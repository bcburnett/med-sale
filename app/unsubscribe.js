var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
let connection;
module.exports = async function(req, res) {
  connection = await mysql.createConnection(dbconfig).catch(e => {
    console.log(e, "ERROR UPDATEPROFILEJS LINE 8");
  });

  let id = req.body.id
  let category = req.body.category
  console.log(id,category)
  let storedCategories = await connection.query(`select category from subscriptions where customerNumber = ?`,[id]).catch(e=>console.log(e))
  storedCategories = storedCategories.map(e=>e.category)
  console.log(storedCategories) //[]
  console.log(storedCategories.indexOf(category))
  if(storedCategories.indexOf(category)!==-1){
    let storedCategories = await connection.query(`delete from subscriptions  where customerNumber = ? and category=?`,[id,category]).catch(e=>console.log(e))
  }
  res.send('success')
};
