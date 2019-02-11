
const { body,validationResult } = require('express-validator/check');
const { sanitizeBody } = require('express-validator/filter');
const validateProfile = require('./profileValidator')
const validateProduct = require('./vendorProductValidator')
module.exports = function(app, passport) {

 app.get('/', function(req, res){
    res.render('index.ejs');
 });

 /**
   Login handlers
 */

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

   /**
   Sign Up handlers
 */

 app.get('/signup', function(req, res){
  res.render('signup.ejs', {message: req.flash('signupMessage')});
 });

 app.post('/signup', passport.authenticate('local-signup', {
  successRedirect: '/ghwnu746gjkew8get3fgew19gedr',
  failureRedirect: '/signup',
  failureFlash: true
 }));

  /**
   @host /profile
 */

 var profile = require('./profile')
 app.get('/ghwnu746gjkew8get3fgew19gedr', isLoggedIn, profile );

 var updateProfile = require('./updateProfile')
 app.get('/updateProfile', isLoggedIn, updateProfile );


 var saveProfile = require('./saveProfile')
 app.post('/profile', isLoggedIn, saveProfile );

 var rss = require('./rss');
 app.get('/rss', isLoggedIn,rss );                                  // NON SECURE ROUTE

var home = require('./home');
app.get('/home', isLoggedIn,home );

var store = require('./storeRedirect');
app.get('/store', isLoggedIn,store );

var venPost = require('./vendorProductAdd')
app.post('/vendorProductAdd',validateProduct,isLoggedIn,venPost)

var adminUpdateUserRole = require('./adminupdateUserRole')
app.post('/adminupdateuser',isLoggedIn,adminUpdateUserRole)

var pay = require('./pay');
app.post('/pay', isLoggedIn,pay );

var success = require('./success');
app.get('/success',isLoggedIn,success)

app.get('/cancel', (req, res) => res.redirect('/home'));

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
