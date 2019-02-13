var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;

module.exports = async (req, res) => {
connection = await mysql.createConnection(dbconfig).catch(e=>console.log(e))

let product = req.session.purchaseItem
const unblock = await connection.query(`update products set salesOrder = ? where productCode = ? `,['null',product.productCode])
res.redirect('/home')
}
