var mysql = require("mysql");
var dbconfig = require("../config/database");
var ppconfig = require("../config/paypal");
var data = require("../config/data");
var connection = mysql.createConnection(dbconfig.connection);
const paypal = require("paypal-rest-sdk");
const uuidv1 = require("uuid/v1");

paypal.configure(ppconfig);
connection.query("USE " + dbconfig.database);

module.exports = (req, res) => {
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
  };
  paypal.payment.execute(paymentId, execute_payment_json, function(
    error,
    payment
  ) {
    if (error) {
      throw error;
    } else {
      data = JSON.stringify(payment);
      let uuid = uuidv1();
      uuid = String(uuid);
      connection.query(
        "INSERT INTO orders (orderNumber, orderDate, status, product, payment, keytext, customerNumber) VALUES(?,?,?,?,?,?,?)",
        [
          uuid,
          null,
          "complete",
          purchaseItem.productName,
          data,
          purchaseItem.productKey,
          req.user.id
        ],
        (a, b, c) => {
          connection.query(
            `
        UPDATE products
        SET salesOrder = ?
        WHERE productCode = ?`,
            [uuid, purchaseItem.productCode],
            (a, b, c) => {
              req.session.purchaseItem = ''
              req.session.payment=''
              res.redirect("/home");
            }
          );
        }
      );
    }
  });
};
