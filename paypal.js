const paypal = require('paypal-rest-sdk');
const payments = paypal.v1.payments;

let env;
if (process.env.NODE_ENV === 'production') {
  // Live Account details
  env = new paypal.core.LiveEnvironment('Your Live Client ID', 'Your Live Client Secret');
} else {
  env = new paypal.core.SandboxEnvironment('AdV4d6nLHabWLyemrw4BKdO9LjcnioNIOgoz7vD611ObbDUL0kJQfzrdhXEBwnH8QmV-7XZjvjRWn0kg', 'EPKoPC_haZMTq5uM9WXuzoxUVdgzVqHyD5avCyVC1NCIUJeVaNNUZMnzduYIqrdw-carG9LBAizFGMyK');
}

let client = new paypal.core.PayPalHttpClient(env);

let payment = {
  "intent": "sale",
  "transactions": [
    {amount: {
      total: "30.11",
      currency: "USD",
      details: {
        subtotal: "30.00",
        tax: "0.07",
        shipping: "0.03",
        handling_fee: "1.00",
        insurance: "0.01",
        shipping_discount: "-1.00"
      }}}
  ],
  "redirect_urls": {
    "cancel_url": "http://localhost/~brian/library",
    "return_url": "http://localhost/~brian"
  },
  "payer": {
    "payment_method": "paypal"
  }
};


let request = new payments.PaymentCreateRequest();
request.requestBody(payment);



client.execute(request).then((response) => {
  console.log(response.statusCode);
  console.log(response.result);
}).catch((error) => {
  console.error(error.statusCode);
  console.error(error.message);
});
