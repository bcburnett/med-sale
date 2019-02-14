const mysql = require("promise-mysql");
const dbconfig = require("../config/database").config;

module.exports = async function(req,res){

  if(req.session.rank !== 'admin'){res.send("Unauthorized");return}

  const connection = await mysql.createConnection(dbconfig);
  let title = req.body.title
  let url = req.body.url
  // insert the new rss feed
  const attrib = await connection.query(`insert into rssfeeds (title,url) values(?, ?)`,[title,url])
  //return success
  res.send('success')
}
