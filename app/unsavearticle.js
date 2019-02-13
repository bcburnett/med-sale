var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
let connection;
module.exports = async function(req, res) {
  connection = await mysql.createConnection(dbconfig).catch(e => {
    console.log(e, "ERROR UPDATEPROFILEJS LINE 8");
  });

  let id = req.user.id
  let guid =req.body.guid

  let storedCategories = await connection.query(`select guid from savedarticles where customerNumber = ?`,[id]).catch(e=>console.log(e))
  storedCategories = storedCategories.map(e=>e.guid)
  if(storedCategories.indexOf(guid)!==-1){
    let storedCategories = await connection.query(`delete from savedarticles  where customerNumber = ? and guid=?`,[id,guid]).catch(e=>console.log(e))
  }
  res.send('success')
};
