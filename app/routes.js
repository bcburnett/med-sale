
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
 app.get('/ghwnu746gjkew8get3fgew19gedr', isLoggedIn, require('./profile'));

 app.get('/updateProfile', isLoggedIn,require('./updateProfile'));

 app.post('/profile', isLoggedIn, require('./saveProfile'));

   /**
   @host /rss
 */

app.post('/rss', isLoggedIn, require('./rss'));

app.post('/savearticle',isLoggedIn,require('./savearticle'))

app.delete('/unsavearticle',isLoggedIn,require('./unsavearticle'))

app.post('/subscribe',isLoggedIn,require('./subscribe'))

app.delete('/unsubscribe',isLoggedIn,require('./unsubscribe'))

/**
   @host /admin
 */

app.put('/adminupdateuser',isLoggedIn,require('./adminupdateUserRole'))

app.delete('/admindeleteuser',isLoggedIn,require('./adminDeleteUser'))

app.delete('/admindeleterss',isLoggedIn,require('./adminDeleteRss'))

app.put('/adminaddrss',isLoggedIn,require('./adminAddRss'))

/**
   @host /paypal
 */
app.post('/pay', isLoggedIn,require('./pay'));

app.get('/success',isLoggedIn,require('./success'))

app.get('/cancel',isLoggedIn,require('./cancel'))

/**
   @host /home
 */
app.get('/home', isLoggedIn,require('./home'));


/**
   @host /store
 */
app.get('/store', isLoggedIn,require('./storeRedirect'));

/**
   @host /vendor
 */
app.post('/vendorProductAdd',isLoggedIn,require('./vendorProductAdd'))

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
