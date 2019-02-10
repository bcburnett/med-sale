var mysql = require('promise-mysql');
var dbconfig = require('../config/database').config;
let connection

module.exports = async function(req, res){
try{  connection = await mysql.createConnection(dbconfig)} catch (e){console.log(e,'ERROR UPDATEPROFILEJS LINE 8')}
  let b = req.body
try{
  const customer = await connection.query(`INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, email, phone, addressLine1, addressLine2, city, state, postalCode,vendor) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)`, [req.user.id,b.firstname,b.lastname,b.firstname,b.email,b.phone,b.address1, b.address2 , b.city, b.state, b.zip, b.vendor])
  console.log(customer,'CUSTOMER INSERTED')
  } catch(e){console.log(e,'ERROR UPDATEPROFILEJS LINE 12')}

try{
  const attrib = await connection.query(` update attributes set infoGathered = 1 where attributes.userid =?`,[req.user.id])
  console.log(attrib,'ATTRIBUTES UPDATED')
} catch(e){console.log(e,'ERROR UPDATEPROFILEJS LINE 15')}

  res.redirect('/home')
}
