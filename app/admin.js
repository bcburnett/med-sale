const mysql = require('promise-mysql');
const dbconfig = require("../config/database").config;

module.exports = async function(res,req){

  const connection = await mysql.createConnection(dbconfig)
  const users = await connection.query(`
  SELECT users.username, users.id, attributes.rank, customers.vendor
  FROM users
  INNER JOIN attributes
  ON users.id = attributes.userid
  INNER JOIN customers
  ON users.id = customerNumber`)
  const products = await connection.query(`select * from products where productVendor =?`, [req.user.id])
  const orders = await connection.query(`select orderNumber, orderDate, keytext, product from orders where customerNumber =?`,[req.user.id])

  res.render('admin',{
    message:'',
    name: req.user.username,
    products,
    users,
    orders
  })
  }
