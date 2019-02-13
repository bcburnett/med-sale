const mysql = require("promise-mysql");
const dbconfig = require("../config/database").config;

module.exports = async function(req,res){

  if(req.session.rank !== 'admin'){res.send("Unauthorized");return}

  const connection = await mysql.createConnection(dbconfig);
  let rank = req.body.role
  let id = req.body.id
  // update the users rank and clear the vendor request flag
  const attrib = await connection.query(`update attributes set rank = ? where userid = ? `,[rank,id])
  const cust = await connection.query(`update customers set vendor = '' where customerNumber = ? `,[id])
  console.log(attrib,cust)

  //return success
  res.send('success')
}
