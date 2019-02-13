var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
let connection;
module.exports = async function(req, res) {
  connection = await mysql.createConnection(dbconfig).catch(e => {
    console.log(e, "ERROR UPDATEPROFILEJS LINE 8");
  });

  let id = req.user.id
  let link = req.body.link
  let exerpt= req.body.exerpt
  let guid =req.body.guid
  let title = req.body.title
  let storedCategories = await connection.query(`select guid from savedarticles where customerNumber = ?`,[id]).catch(e=>console.log(e))
  storedCategories = storedCategories.map(e=>e.guid)
  if(storedCategories.indexOf(guid)===-1){
    let articles = await connection.query(`insert into savedarticles (id,customerNumber,guid,link,exerpt,title) values(?,?,?,?,?,?)`,[null,id,guid,link,exerpt,title]).catch(e=>console.log(e))
  }
  res.send('success')
};
