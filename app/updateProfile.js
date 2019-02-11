var mysql = require('promise-mysql');
var dbconfig = require('../config/database').config;

let connection

module.exports = async function(req, res){
// let errors =await req.getValidationResult().catch(e=>console.log(e))
// if(errors){
//   res.render('profile.ejs', {
//     user:req.user,
//     message:req.validationErrors().map(e=>e.msg),
//     body:req.body
//    })
// }

  let b = req.body


  connection = await mysql.createConnection(dbconfig).catch( (e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 8')})

  const customer = await connection.query(`INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, email, phone, addressLine1, addressLine2, city, state, postalCode,vendor) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)`, [req.user.id,b.firstname,b.lastname,b.firstname,b.email,b.phone,b.address1, b.address2 , b.city, b.state, b.zip, b.vendor]).catch((e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 12')})

  const attrib = await connection.query(` update attributes set infoGathered = 1 where attributes.userid =?`,[req.user.id]).catch((e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 15')})

  res.redirect('/home')
}
