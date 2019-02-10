var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
let connection;

module.exports = async function(req, res) {

req
  .checkBody("productName", "Name field is required")
  .notEmpty()
req.checkBody("productKey", "productKey field is required").notEmpty();
req
  .checkBody("productDescription", "productDescription field is required")
  .notEmpty();
req
  .checkBody("buyPrice", "buyPrice field is required")
  .notEmpty()

let row = [];
let b = req.body;

try {
  connection = await mysql.createConnection(dbconfig);
  console.log(connection)
  try {
    console.log(connection)
    let products = await connection.query(`INSERT INTO products (productName, productKey, productVendor, productDescription, buyPrice,salesOrder) VALUES( ?, ?, ?, ?, ?,?)`,[b.productName,b.productKey,req.user.id,b.productDescription,b.buyPrice,"null"] );
    let message = "";
    res.redirect("/home");

  }catch(e){console.log(e)}
} catch (e) {console.log(e)};
}

