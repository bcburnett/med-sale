#!/usr/bin/env node
var express = require('express');
var session = require('express-session');
var expressValidator =require('express-validator')
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var morgan = require('morgan');
var app = express();
var https = require('https')
var MySQLStore = require('express-mysql-session')(session);
var port = process.env.PORT || 8080;
var fs = require('fs')
const socket = require('socket.io')

var httpsOptions = {
  cert:fs.readFileSync('./ssh/cert.pem'),
  key: fs.readFileSync('./ssh/key.pem'),
  passphrase: 'password'
}

var sessionStore = new MySQLStore(require('./config/database').config);
var favicon = require('serve-favicon')
var path = require('path')

app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')))


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
    saveUninitialized: false,
    cookie: {
       maxAge:86400000 //24 hrs
      }
}));


app.use(passport.initialize());
app.use(passport.session());
app.use(flash());
app.use(expressValidator())

require('./app/routes.js')(app, passport);
var server = https.createServer(httpsOptions,app)
const io = socket(server)
server.listen(port);
console.log("Port: " + port);
console.log(app.mountpath)

io.on('connection', socket => {



  socket.on('hello', data => {
    console.log('hello',data)
       socket.broadcast.emit('hello', data)
  })

})
