var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
let connection;
let errors
const { validationResult } = require('express-validator/check')
module.exports = async function(req, res) {
  let row=[]

row = [];
let b = req.body;


connection = await mysql.createConnection(dbconfig).catch(e=>console.log(e));
let products = await connection.query(`INSERT INTO products (productName, productKey, productVendor, productDescription, buyPrice,salesOrder) VALUES( ?, ?, ?, ?, ?,?)`,[b.productName,b.productKey,req.user.id,b.productDescription,b.buyPrice,"null"] ).catch(e=>{
  console.log(JSON.stringify(e))
   return ['error',e]
});
if(products[0] === 'error'){errorReturn ();return}
let message = "";
res.redirect("/home");

function errorReturn (){
  res.render('vendor.ejs', {
    user:req.user,
    message:'Something went wrong, check your form and try again' || '',
    data:row||[],
    body:req.body,
    name:req.user.username||"name"
  })
  return
}
}


