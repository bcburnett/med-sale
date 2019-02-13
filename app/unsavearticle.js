var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
let connection;
module.exports = async function(req, res) {
  connection = await mysql.createConnection(dbconfig).catch(e => {
    console.log(e, "ERROR UPDATEPROFILEJS LINE 8");
  });

  let id = req.body.id
  let guid =req.body.guid

  console.log(id,guid)
  let storedCategories = await connection.query(`select guid from savedarticles where customerNumber = ?`,[id]).catch(e=>console.log(e))
  storedCategories = storedCategories.map(e=>e.guid)
  console.log(storedCategories) //[]
  console.log(storedCategories.indexOf(guid))
  if(storedCategories.indexOf(guid)!==-1){
    let storedCategories = await connection.query(`delete from savedarticles  where customerNumber = ? and guid=?`,[id,guid]).catch(e=>console.log(e))
  }
  res.send('success')
};
