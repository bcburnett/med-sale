const mysql = require("mysql");
const dbconfig = require("../config/database");
const ppconfig = require("../config/paypal");
const paypal = require("paypal-rest-sdk");


const connection = mysql.createConnection(dbconfig.connection);
connection.query("USE " + dbconfig.database);
paypal.configure(ppconfig);

module.exports = (req, res) => {
  let product = req.body.product;
  const baseurl=req.protocol+"://"+req.headers.host
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
          return_url: baseurl+'/success',
          cancel_url: baseurl+'/cancel'
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
