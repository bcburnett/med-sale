const mysql = require("promise-mysql");
const dbconfig = require("../config/database").config;

module.exports = async function(req,res){

  if(req.session.rank !== 'admin'){res.send("Unauthorized");return}

  const connection = await mysql.createConnection(dbconfig);
  let title = req.body.title
  let url = req.body.url
  // insert the new rss feed
  try{
  const attrib = await connection.query(`insert into rssfeeds (title,url) values(?, ?)`,[title,url]).catch(e=>console.log((e.code)))
  } catch(e){console.log(e.code)}
  //return success
  res.send('success')
}
