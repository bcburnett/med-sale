const mysql = require("mysql");
const dbconfig = require("../config/database");
const connection = mysql.createConnection(dbconfig.connection);
connection.query("USE " + dbconfig.database);



module.exports = function(res,req){
console.log(req.user.id)
  connection.query(`select users.username, users.id, attributes.rank from users inner join attributes on users.id = attributes.userid `, (e,r) => {
    connection.query(`select * from products where productVendor =?`,
      [req.user.id],
      (err, row, fields) => {
    console.log(JSON.parse(JSON.stringify(r)))
    res.render('admin',{
      message:'',
      users:r,
      name: req.user.username,
      data:row
    })
  })
})

}
