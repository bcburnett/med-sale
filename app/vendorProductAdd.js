var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
let connection;
let errors
let value
const Joi = require('joi');

module.exports = async function(req, res) {
  let row=[]
let b = req.body;

// define the validation schema
const schema = Joi.object().keys({

  productName: Joi.string().required(),

  productKey: Joi.string().required(),

  productDescription: Joi.string().required(),

  buyPrice: Joi.number().positive()
});

// validate the request data against the schema
errors = await Joi.validate(b, schema, (err, value) => {
  if(err){
    errors = 'error'
    errorReturn(err.details.map(e=>e.message).join('<br>')); return errors
  }
})

if(errors)return




connection = await mysql.createConnection(dbconfig).catch(e=>console.log(e));
let products = await connection.query(`INSERT INTO products (productName, productKey, productVendor, productDescription, buyPrice,salesOrder) VALUES( ?, ?, ?, ?, ?,?)`,[b.productName,b.productKey,req.user.id,b.productDescription,b.buyPrice,"null"] ).catch(e=>{
  console.log(JSON.stringify(e))
   return ['error',JSON.stringify(e)]
});
if(products[0] === 'error'){errorReturn('oops something went wrong'); return}
let message = "";
res.redirect("/home");

function errorReturn (message){
  res.render('vendor.ejs', {
    user:req.user,
    message:message || '',
    data:row||[],
    body:req.body,
    name:req.user.username||"name"
  })
  return
}
}


