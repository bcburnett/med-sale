var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
var ppconfig = require("../config/paypal");
const paypal = require("paypal-rest-sdk");
const uuidv1 = require("uuid/v1");
paypal.configure(ppconfig);
let connection

module.exports = async (req, res) => {
  try{
    connection = await mysql.createConnection(dbconfig);
  }catch(e){console.log(e)}
  console.log("SUCCESS.JS");
  const payerId = req.query.PayerID;
  const paymentId = req.query.paymentId;
  const purchaseItem = req.session.purchaseItem;
  const custPayment = req.session.payment;
  const execute_payment_json = {
    payer_id: payerId,
    transactions: [
      {
        amount: custPayment.transactions[0].amount
      }
    ]
  }
  paypal.payment.execute(paymentId, execute_payment_json, function(error,payment) {
    if (error) {
      throw error;
    } else {
      data = JSON.stringify(payment);
      let uuid = uuidv1();
      uuid = String(uuid);
        connection.query("INSERT INTO orders (orderNumber, orderDate, status, product, payment, keytext, customerNumber) VALUES(?,?,?,?,?,?,?)",[uuid,null,"complete",purchaseItem.productName,data,purchaseItem.productKey,req.user.id])
        .then(resp=>{
          connection.query(`UPDATE products SET salesOrder = ? WHERE productCode = ?`, [uuid, purchaseItem.productCode])
          res.redirect('/home')
        })


  }

    })
  }
