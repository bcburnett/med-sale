const mysql = require("promise-mysql");
const dbconfig = require("../config/database").config;

module.exports = async function(req,res){

  if(req.session.rank !== 'admin'){res.send("Unauthorized");return}

  const connection = await mysql.createConnection(dbconfig);
  let id = req.body.id

  // clear user data from all tables except sales
  const attrib = await connection.query(`delete from customers where customerNumber = ? `,[id])
  const cust = await connection.query(`delete from attributes where userid = ? `,[id])
  const user = await connection.query(`delete from products where productVendor = ? `,[id])
  const products = await connection.query(`delete from users where id = ? `,[id])
  const subscriptions = await connection.query(`delete from subscriptions where customerNumber = ? `,[id])
  console.log(attrib,cust,user,products,subscriptions)

  // return success
  res.send('success')
}
