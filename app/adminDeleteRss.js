const mysql = require("promise-mysql");
const dbconfig = require("../config/database").config;

module.exports = async function(req,res){

  if(req.session.rank !== 'admin'){res.send("Unauthorized");return}

  const connection = await mysql.createConnection(dbconfig);
  let id = req.body.id

  // clear user data from all tables except sales
  const rss = await connection.query(`delete from rssfeeds where id = ? `,[id])


  // return success
  res.send('success')
  myfeeds = await connection.query(`select * from rssfeeds`)
  req.app.io.emit('feedDeleted',myfeeds );
}
