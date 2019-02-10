var mysql = require('mysql');
var dbconfig = require('../config/database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);

module.exports = function(req, res){
  req.checkBody('phone','Phone field is required').notEmpty().isLength({min:10});
  req.checkBody('email','Email field is required').notEmpty();
  req.checkBody('firstname','firstname field is required').notEmpty();
  req.checkBody('lastname','lastname field is required').notEmpty();
  req.checkBody('address1','Address is required').notEmpty();
  req.checkBody('city','City is required').notEmpty().isLength({min:2});
  req.checkBody('zip','Zip Code is Required').notEmpty().isLength({min:5});

  req.sanitizeBody('phone','Phone field is required').notEmpty().isLength({min:10});
  req.sanitizeBody('email','Email field is required').notEmpty();
  req.sanitizeBody('firstname','firstname field is required').notEmpty();
  req.sanitizeBody('lastname','lastname field is required').notEmpty();
  req.sanitizeBody('address1','Address is required').notEmpty();
  req.sanitizeBody('city','City is required').notEmpty().isLength({min:2});
  req.sanitizeBody('zip','Zip Code is Required').notEmpty().isLength({min:5});

  if(req.validationErrors()){
    res.render('profile.ejs', {
      user:req.user,
      message:req.validationErrors().map(e=>e.msg),
      body:req.body
      })
      return
  }
  let b = req.body
  connection.query(`
  INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, email, phone, addressLine1, addressLine2, city, state, postalCode,vendor) VALUES
  ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)`, [req.user.id,b.firstname,b.lastname,b.firstname,b.email,b.phone,b.address1, b.address2 , b.city, b.state, b.zip, b.vendor])
  connection.query(` update attributes set infoGathered = 1 where attributes.userid =?`,[req.user.id])
  req.session.infoGathered = true
  res.redirect('/home')
  //  console.log(req.user,req.session)

}
