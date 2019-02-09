var mysql = require('mysql');
var dbconfig = require('../config/database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);

module.exports = function(req, res){
  connection.query(`
  select * from attributes where attributes.userid =?`,[req.user.id],(err,row,fields)=>{
    console.log(err,row[0],fields)
    if(!row[0]){
      req.session.infoGathered = false
      connection.query(`
      INSERT INTO
      attributes
        (userid, privileges, rank, infoGathered)
      VALUES
        (?,  JSON_ARRAY("read", "purchase", "comment"), "user", 0)`, [req.user.id],(err,row,fields)=>console.log(err,row[0],fields))
    }
  })
 res.render('profile.ejs', {
  user:req.user,
  message:['Thank You For Registering'],
  body:req.body
 })
}
