const mysql = require("promise-mysql");
const dbconfig = require("../config/database").config;
const ppconfig = require("../config/paypal");
const paypal = require("paypal-rest-sdk");
let connection



paypal.configure(ppconfig);
let baseurl

module.exports = async (req, res) => {
  try{  connection = await mysql.createConnection(dbconfig)} catch (e){console.log(e,'ERROR PAYJS LINE 12')}

  let product = req.body.product;
  console.log(req.headers.host)
  baseurl="https://"+req.headers.host


    const products = await connection.query(`select * from products where salesOrder = 'null' and productName = ? limit 1 `,[product])
    console.log(products)
      if (!products[0]) {
        req.session.message = "We're sorry We are out of Stock";
        res.redirect("/home");
        return;
      }

      req.session.message = null;
      r = products[0];
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
