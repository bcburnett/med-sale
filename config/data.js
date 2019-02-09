module.exports={
  id: "PAYID-LROJ6MY4KM1300493614142D",
  intent: "sale",
  state: "approved",
  cart: "4GL3175194014160W",
  payer: {
    payment_method: "paypal",
    status: "VERIFIED",
    payer_info: {
      email: "bcburnett@gmail.com",
      first_name: "brian",
      last_name: "burnett",
      payer_id: "M7MY3RW647FGE",
      shipping_address: {
        recipient_name: "brian burnett",
        line1: "1 Main St",
        city: "San Jose",
        state: "CA",
        postal_code: "95131",
        country_code: "US"
      },
      country_code: "US"
    }
  },
  transactions: [
    {
      amount: { total: "25.00", currency: "USD", details: {} },
      payee: { merchant_id: "R3VQZWKJ89FAL", email: "bcburnett@email.com" },
      description: "Red Sox Hat",
      item_list: {
        items: [
          {
            name: "red sox hat",
            sku: "rsh-lg",
            price: "25.00",
            currency: "USD",
            quantity: 1
          }
        ],
        shipping_address: {
          recipient_name: "brian burnett",
          line1: "1 Main St",
          city: "San Jose",
          state: "CA",
          postal_code: "95131",
          country_code: "US"
        }
      },
      related_resources: [
        {
          sale: {
            id: "2EN074610E2198633",
            state: "completed",
            amount: {
              total: "25.00",
              currency: "USD",
              details: { subtotal: "25.00" }
            },
            payment_mode: "INSTANT_TRANSFER",
            protection_eligibility: "ELIGIBLE",
            protection_eligibility_type:
              "ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE",
            transaction_fee: { value: "1.03", currency: "USD" },
            parent_payment: "PAYID-LROJ6MY4KM1300493614142D",
            create_time: "2019-02-07T21:12:32Z",
            update_time: "2019-02-07T21:12:32Z",
            links: [
              {
                href:
                  "https://api.sandbox.paypal.com/v1/payments/sale/2EN074610E2198633",
                rel: "self",
                method: "GET"
              },
              {
                href:
                  "https://api.sandbox.paypal.com/v1/payments/sale/2EN074610E2198633/refund",
                rel: "refund",
                method: "POST"
              },
              {
                href:
                  "https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LROJ6MY4KM1300493614142D",
                rel: "parent_payment",
                method: "GET"
              }
            ]
          }
        }
      ]
    }
  ],
  create_time: "2019-02-07T21:12:33Z",
  links: [
    {
      href:
        "https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LROJ6MY4KM1300493614142D",
      rel: "self",
      method: "GET"
    }
  ],
  httpStatusCode: 200
}
