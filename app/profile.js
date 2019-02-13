var mysql = require('mysql');
var dbconfig = require('../config/database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);

module.exports = function(req, res){
  connection.query(`
  select * from attributes where attributes.userid =?`,[req.user.id],(err,row,fields)=>{
    if(!row[0]){
      req.session.infoGathered = false
      connection.query(`
      INSERT INTO
      attributes
        (userid, privileges, rank, infoGathered)
      VALUES
        (?,  JSON_ARRAY("read", "purchase", "comment"), "user", 0)`, [req.user.id])
    }
  })
  req.session.message = 'Welcome back '+ req.user.username+',Thank You For Registering '
 res.render('profile.ejs', {
  name:req.user.name,
  user:req.user,
  message:req.session.message.message ||'',
  body:req.body
 })
 req.session.message = ''
}
