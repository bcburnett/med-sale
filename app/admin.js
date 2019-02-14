const mysql = require('promise-mysql');
const dbconfig = require("../config/database").config;

module.exports = async function(res,req){
  //check if a vendor or user somehow got here by mistake
  if(req.session.rank !== 'admin'){res.redirect("/home");return}

  const connection = await mysql.createConnection(dbconfig)

  // get the users
  const users = await connection.query(`
  SELECT users.username, users.id, attributes.rank, customers.vendor
  FROM users
  INNER JOIN attributes
  ON users.id = attributes.userid
  INNER JOIN customers
  ON users.id = customerNumber`)
  const feed = await connection.query(`select * from rssfeeds`).catch(e=>console.log(e))
  // get the admin's products
  const products = await connection.query(`select * from products where productVendor =?`, [req.user.id])
  // get the admin's purchases
  const orders = await connection.query(`select orderNumber, orderDate, keytext, product from orders where customerNumber =?`,[req.user.id])

// message to print at the top of page
req.session.message='Welcome back '+ req.user.username
// render the admin page passing in the following variables
  res.render('admin',{
    message:req.session.message ||'',
    name: req.user.username,
    products,
    users,
    orders,
    feed
  })

  //reset the message
  req.session.message =''
  }
