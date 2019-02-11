
const { body,validationResult } = require('express-validator/check');
const { sanitizeBody } = require('express-validator/filter');
const validateProfile = require('./profileValidator')
const validateProduct = require('./vendorProductValidator')
module.exports = function(app, passport) {

 app.get('/', function(req, res){

    res.render('index.ejs');


 });



 app.get('/login', function(req, res){
  res.render('login.ejs', {message:req.flash('loginMessage')});
 });

 app.post('/login', passport.authenticate('local-login', {
  successRedirect: '/home',
  failureRedirect: '/login',
  failureFlash: true
 }),
  function(req, res){
    console.log(req.body.button)
   if(req.body.remember){
    req.session.cookie.maxAge = 1000 * 60 * 10;
   }else{
    req.session.cookie.expires = false;
   }
   res.redirect('/');
  });

 app.get('/signup', function(req, res){
  res.render('signup.ejs', {message: req.flash('signupMessage')});
 });

 app.post('/signup', passport.authenticate('local-signup', {
  successRedirect: '/profile',
  failureRedirect: '/signup',
  failureFlash: true
 }));

 var profile = require('./profile')
 app.get('/profile', isLoggedIn, profile );

 var updateProfile = require('./updateProfile')
 app.post('/profile', isLoggedIn, updateProfile );

var home = require('./home');
app.get('/home', isLoggedIn,home );

var store = require('./storeRedirect');
app.get('/store', isLoggedIn,store );

var pay = require('./pay');
app.post('/pay', isLoggedIn,pay );

var success = require('./success');
app.get('/success',isLoggedIn,success)

var venPost = require('./vendorProductAdd')
app.post('/vendorProductAdd',validateProduct,isLoggedIn,venPost)

var adminUpdateUserRole = require('./adminupdateUserRole')
app.post('/adminupdateuser',isLoggedIn,adminUpdateUserRole)

app.get('/cancel', (req, res) => res.redirect('/wf'));

 app.get('/logout', function(req,res){
  req.logout();
  res.redirect('/');
 })
};



function isLoggedIn(req, res, next){
 if(req.isAuthenticated())
  return next();
 res.redirect('/');
}
