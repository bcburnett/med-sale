var mysql = require("mysql");
var dbconfig = require("../config/database");
var ppconfig = require("../config/paypal");
const paypal = require("paypal-rest-sdk");

var connection = mysql.createConnection(dbconfig.connection);
connection.query("USE " + dbconfig.database);
paypal.configure(ppconfig);

module.exports = (req, res) => {
  let product = req.body.product;

  connection.query(
    `select * from products where salesOrder = 'null' and productName = ? limit 1 `,
    [product],
    (e, r, f) => {
      if (!r[0]) {
        req.session.message = "We're sorry We are out of Stock";
        res.redirect("/home");
        return;
      }

      req.session.message = null;
      r = r[0];
      const create_payment_json = {
        intent: "sale",
        payer: {
          payment_method: "paypal"
        },
        redirect_urls: {
          return_url: "http://localhost:8080/success",
          cancel_url: "http://localhost:8080/home"
        },
        transactions: [
          {
            item_list: {
              items: [
                {
                  name: r.productName,
                  sku: r.productCode,
                  price: r.buyPrice,
                  currency: "USD",
                  quantity: 1
                }
              ]
            },
            amount: {
              currency: "USD",
              total: r.buyPrice
            },
            description: r.productName
          }
        ]
      };

      req.session.purchaseItem = r;

      paypal.payment.create(create_payment_json, function(error, payment) {
        req.session.payment = payment;
        if (error) {
          res.redirect("/home");
        } else {
          payment.links.forEach(e => {
            if (e.rel === "approval_url") res.redirect(e.href);
          });
        }
      });
    }
  );
};
