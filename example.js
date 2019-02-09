const express = require('express');
const ejs = require('ejs');
const paypal = require('paypal-rest-sdk');

paypal.configure({
  'mode': 'sandbox', //sandbox or live
  'client_id': 'AWIPCjfBgYmzdLcnAvKQlOMjaya4OP1ZpwqAiwBAPwbWe4yw-X5eaClWmVLXAUOAfk5FqJUij_GLu0jB',
  'client_secret': 'ECH8buys_GKE0WqrflRWOvTOzeB8diDW70ryew5A3VzpnXI7x9PybNsMjoOVZNRrC8BxncV0YbgKemXO'
});

const app = express();

app.set('view engine', 'ejs');

app.get('/', (req, res) => res.render('index'));

app.post('/pay', (req, res) =>{
  const create_payment_json = {
    "intent": "sale",
    "payer": {
        "payment_method": "paypal"
    },
    "redirect_urls": {
        "return_url": "http://localhost:3000/success",
        "cancel_url": "http://localhost:3000/cancel"
    },
    "transactions": [{
        "item_list": {
            "items": [{
                "name": "red sox hat",
                "sku": "rsh-lg",
                "price": "25.00",
                "currency": "USD",
                "quantity": 1
            }]
        },
        "amount": {
            "currency": "USD",
            "total": "25.00"
        },
        "description": "Red Sox Hat"
    }]
};

paypal.payment.create(create_payment_json, function (error, payment) {
  if (error) {throw error;} else {payment.links.forEach(e=>{if(e.rel==='approval_url') res.redirect(e.href)})}
});
});

app.get('/success',(req,res)=>{
  const payerId = req.query.PayerID;
  const paymentId = req.query.paymentId;
  const execute_payment_json = {
    "payer_id": payerId,
    "transactions": [{
        "amount": {
            "currency": "USD",
            "total": "25.00"
        }
    }]
  };
  paypal.payment.execute(paymentId, execute_payment_json, function (error, payment) {
    if (error) {
        console.log(error.response);
        throw error;
    } else {
        console.log(JSON.stringify(payment));
        res.send('success');
    }
});
})

app.get('/cancel', (req, res) => res.send('Cancelled'));

app.listen(3000, () => console.log('Server Started'));

