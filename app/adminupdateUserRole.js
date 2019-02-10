const mysql = require("promise-mysql");
const dbconfig = require("../config/database").config;

module.exports = async function(req,res){
  const connection = await mysql.createConnection(dbconfig);
  let rank = req.body.role
  let id = req.body.id
  const attrib = await connection.query(`update attributes set rank = ? where userid = ? `,[rank,id])
  const cust = await connection.query(`update customers set vendor = '' where customerNumber = ? `,[id])
  console.log(attrib,cust)
  res.send('success')
}
