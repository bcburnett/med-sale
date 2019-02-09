var mysql = require('mysql');
var dbconfig = require('../config/database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);
module.exports = function(req, res){
  req.checkBody('productName','Name field is required').notEmpty().isLength({min:5});
    req.checkBody('productKey','productKey field is required').notEmpty();
    req.checkBody('productDescription','productDescription field is required').notEmpty();
    req.checkBody('buyPrice','buyPrice field is required').notEmpty().isDecimal();

    if(req.validationErrors()){
      res.render('vendor.ejs', {
        user:req.user,
        message:req.validationErrors().map(e=>e.msg),
        data:row||[],
        body:req.body,
        name:req.user.username||"name"
       })
    }
    let row = []
    let b = req.body
    connection.query(`
    INSERT INTO products (productName, productKey, productVendor, productDescription, buyPrice,salesOrder) VALUES
( ?, ?, ?, ?, ?,?)`, [b.productName,b.productKey,req.user.id,b.productDescription,b.buyPrice,"null"],(e,r)=>{
  let message =''
  if(e) {
    message = JSON.stringify(e)
    res.render('vendor.ejs', {
      user:req.user,
      message:message,
      data:row||[],
      body:req.body,
      name:req.user.username||"name"
     })
    return
  }

res.redirect('/home')
})

  //  console.log(req.user,req.session)


}
