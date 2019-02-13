var mysql = require('promise-mysql');
var dbconfig = require('../config/database').config;
let connection;
let difference
let Parser = require('rss-parser');
let parser = new Parser();

module.exports = async function(req, res){
console.log(req.user)
 let rssurl = req.body.feed || 'https://rss.medicalnewstoday.com/featurednews.xml'


  connection = await mysql.createConnection(dbconfig).catch( (e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 8')})

  let feed = await parser.parseURL(rssurl);
  let subscriptions= await connection.query(`select category from subscriptions where customerNumber = ?`,[req.user.id]).catch(e=>console.log(e))
  let bookmarks = await connection.query(`select * from savedarticles where customerNumber = ?`,[req.user.id]).catch(e=>console.log(e))
  res.send(JSON.stringify({feed:feed.items,subscriptions,bookmarks})) // send it off to the browser

  let storedCategories = await connection.query(`select category from categories`).catch(e=>true)
  storedCategories=storedCategories.map(e=>e.category)  //flattens the categories into an array of strings
  categories = [] // categories initial value

  feed.items.forEach(item => {
    cats =item.categories[0]._.split('/') // split the categories field on the /
    cats.forEach(e=>{
      let c = e.replace("'","")
            c=c.trim()
            c=c.replace(/ /g,"")
      categories.push(c)
    })   // build the category array
  });

  difference = categories.map(e=>e.trim()).filter(x =>  storedCategories.indexOf(x) === -1) // determine if there are new categories
  // update the db if new categories are found
  if(difference) {difference.forEach(async (e)=>{await connection.query(`INSERT INTO categories (category) values (?)`,[e]).catch(e=>console.log(e))})}
}
