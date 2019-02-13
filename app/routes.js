
module.exports = function(app, passport) {

  /**
   @host /root
 */

 app.get('/', function(req, res){
    res.render('index.ejs');
 });


  /**
   @host /Login
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
    console.log(req.body.remember)
   if(req.body.remember){
    req.session.cookie.maxAge = 30 * 24 * 60 * 60 * 1000;
   }else{
    req.session.cookie.expires = false;
   }
   res.redirect('/home');
  });

  /**
   @host /Sign_Up_handlers
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

   /**
   @host /rss
 */

 var rss = require('./rss');
 app.post('/rss', isLoggedIn,rss );

var saveArticle = require('./savearticle')
app.post('/savearticle',isLoggedIn,saveArticle)

var unsaveArticle = require('./unsavearticle')
app.delete('/unsavearticle',isLoggedIn,unsaveArticle)

var customerSubscribe = require('./subscribe')
app.post('/subscribe',isLoggedIn,customerSubscribe)

var customerUnsubscribe = require('./unsubscribe')
app.delete('/unsubscribe',isLoggedIn,customerUnsubscribe)

/**
   @host /admin
 */

var adminUpdateUserRole = require('./adminupdateUserRole')
app.put('/adminupdateuser',isLoggedIn,adminUpdateUserRole)

var adminDeleteUser = require('./adminDeleteUser')
app.delete('/admindeleteuser',isLoggedIn,adminDeleteUser)

/**
   @host /paypal
 */
var pay = require('./pay');
app.post('/pay', isLoggedIn,pay );

var success = require('./success');
app.get('/success',isLoggedIn,success)

var cancel = require('./cancel');
app.get('/cancel',isLoggedIn,cancel)

/**
   @host /home
 */
var home = require('./home');
app.get('/home', isLoggedIn,home );


/**
   @host /store
 */
var store = require('./storeRedirect');
app.get('/store', isLoggedIn,store );

/**
   @host /vendor
 */
var venPost = require('./vendorProductAdd')
app.post('/vendorProductAdd',isLoggedIn,venPost)

/**
   @host /logout
 */

 app.get('/logout', function(req,res){
  req.session.destroy(function (err) {
    req.user = null;
  req.logout();
  res.redirect('/');
});
 })
};



function isLoggedIn(req, res, next){
 if(req.isAuthenticated())
  return next();
 res.redirect('/');
}
