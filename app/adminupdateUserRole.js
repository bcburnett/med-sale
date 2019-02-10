const mysql = require("mysql");
const dbconfig = require("../config/database");
const connection = mysql.createConnection(dbconfig.connection);
connection.query("USE " + dbconfig.database);



module.exports = function(req,res){
  console.log(req.session.rank)
    let rank = req.body.role
    let id = req.body.id
    console.log(rank,id)

  connection.query(`update attributes set rank = ? where userid = ? `,[rank,id] ,(e,r) => {
    console.log(JSON.stringify(r),e)
    res.send('success')
  })
}
