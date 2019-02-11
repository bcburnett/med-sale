var mysql = require('promise-mysql');
var dbconfig = require('../config/database').config;
let connection;
let errors

module.exports = async function(req, res){
  connection = await mysql.createConnection(dbconfig).catch(e=>console.log(e));
  let customers = await connection.query(` select * from customers where customerNumber =?`,[req.user.id]).catch((e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 87')})
  console.log(customers[0])
  customers = customers[0]
  body={
    lastname: customers.contactLastName ,
    firstname: customers.contactFirstName ,
    email: customers.email ,
    phone: customers.phone ,
    address1: customers.addressLine1 ,
    address2: customers.addressLine2,
    city:  customers.city ,
    state: customers.state ,
    zip: customers.postalCode,
    country: customers.country,
    vendor: customers.vendor}

  res.render('profile',{
    body:body,
    name:req.user.username,
    message:'Update Profile'
  })
}
