var express = require('express');
var session = require('express-session');
var expressValidator =require('express-validator')
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var morgan = require('morgan');
var app = express();
var MySQLStore = require('express-mysql-session')(session);
var port = process.env.PORT || 8080;

var dboptions = {
  host:'mysql-medsale-6080.nodechef.com',
  port:'2483',
  user:'ncuser_6864',
  password:'95wJOfOPkfxQGgTAkSmalq5cHHknA4',
  database: 'medsale'
};
var sessionStore = new MySQLStore(dboptions);



var passport = require('passport');
var flash = require('connect-flash');
require('./config/passport')(passport);

app.use(morgan(function (tokens, req, res) {
  return [
    tokens.method(req, res),
    tokens.url(req, res),
    tokens.status(req, res),
    tokens.res(req, res, 'content-length'), '-',
    tokens['response-time'](req, res), 'ms'
  ].join(' ')
}));
app.use(cookieParser());
app.use(bodyParser.urlencoded({
 extended: true
}));
app.use(bodyParser.json());
app.use(express.static('public'))
app.set('view engine', 'ejs');



app.use(session({
    key: 'session_cookie_name',
    secret: 'justasecret',
    store: sessionStore,
    resave: true,
    saveUninitialized: true
}));


app.use(passport.initialize());
app.use(passport.session());
app.use(flash());
app.use(expressValidator())

require('./app/routes.js')(app, passport);

app.listen(port);
console.log("Port: " + port);
console.log(app.mountpath)
