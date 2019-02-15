var mysql = require('promise-mysql');
var dbconfig = require('../config/database').config;
let connection;
let difference
let Parser = require('rss-parser');
let parser = new Parser();

module.exports = async function(req, res){
connection = await mysql.createConnection(dbconfig).catch( (e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 8')})
myfeeds = await connection.query(`select * from rssfeeds limit 1`)
console.log(myfeeds[0])
  let rssurl = req.body.rssfeed || myfeeds[0].url



  let feed = await parser.parseURL(rssurl);
  let subscriptions= await connection.query(`select category from subscriptions where customerNumber = ?`,[req.user.id]).catch(e=>console.log(e))
  let bookmarks = await connection.query(`select * from savedarticles where customerNumber = ?`,[req.user.id]).catch(e=>console.log(e))
  res.send(JSON.stringify({feed:feed.items,subscriptions,bookmarks,rssurl})) // send it off to the browser


}
