var mysql = require('promise-mysql');
var dbconfig = require('../config/database').config;
let connection;
let errors
let value
const Joi = require('joi');

module.exports = async function(req, res){
  let b = req.body;

  // define the validation schema
  const schema = Joi.object().keys({
    //b.address1, b.address2 , b.city, b.state, b.zip, b.vendor
    lastname: Joi.string().required(),

    firstname: Joi.string().required(),

    email: Joi.string().email().required(),

    phone1: Joi.string().regex(/^\d{3}$/).required(),
    phone2: Joi.string().regex(/^[2-9]\d{2}$/).required(),
    phone3: Joi.string().regex(/^\d{4}$/).required(),

    address1: Joi.string().required(),

    address2: Joi.string(),
    city: Joi.string().required(),

    state: Joi.string().required(),

    zip: Joi.string().regex(/^[0-9]{5}(?:-[0-9]{4})?$/).required(),

    country: Joi.string().required(),

    vendor: Joi.string()

  });

  // validate the request data against the schema
  errors = await Joi.validate(b, schema, (err, value) => {
    if(err){
      errors = 'error'
      errorReturn(err.details.map(e=>e.message).join('<br>')); return errors
    }
  })

  if(errors)return


  connection = await mysql.createConnection(dbconfig).catch( (e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 8')})

  const customer = await connection.query(`INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, email, phone, addressLine1, addressLine2, city, state, postalCode,vendor) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)`, [req.user.id,b.firstname+' '+b.lastname,b.lastname,b.firstname,b.email,b.phone1+'-'+b.phone2+'-'+b.phone3,b.address1, b.address2 , b.city, b.state, b.zip, b.vendor]).catch((e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 12')})

  const attrib = await connection.query(` update attributes set infoGathered = 1 where attributes.userid =?`,[req.user.id]).catch((e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 15')})

  res.redirect('/home')


  function errorReturn (message){
    res.render('profile.ejs', {
      message:message || '',
      body:req.body,
      name:req.user.username||"name"
    })
    return
  }
}
