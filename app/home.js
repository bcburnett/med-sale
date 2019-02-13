var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
var handleAdmin = require("./admin");
var rssfeeds = require("./rssfeeds");

module.exports = async function(req, res) {

  var connection = await mysql.createConnection(dbconfig);

  //check if the user has a customer number
  const cn = await connection.query(`select customerNumber from customers where customerNumber =?`,[req.user.id]);

  // if not send to the profile entry page
  if (!cn[0]) {
    req.session.message = 'Welcome back '+ req.user.username+',Thank You For Registering '
    res.render("profile", {
      name: req.user.name,
      message: req.session.message || "",
      body: req.body
    });
    return;
  }

  // get the users rank
  let dbrank = await connection.query(`select rank from attributes where userid =?`,[req.user.id]);
  dbrank = JSON.parse(JSON.stringify(dbrank))[0].rank
  rank = req.session.next || dbrank
  req.session.rank = dbrank;

  //decide where to send the user
  if (rank === "user") {
    renderStore();
  } else if (rank === "vendor") {
    renderVendor();
  } else if (rank === "admin") {
    renderAdmin();
  }

// render the store
  async function renderStore () {
    req.session.next = "";
    var connection = await mysql.createConnection(dbconfig);
    const orders = await connection.query(
      `select orderNumber, orderDate, keytext, product from orders where customerNumber =?`,
      [req.user.id]
    );
    req.session.message='Welcome back '+ req.user.username

    res.render("store", {
      feeds:rssfeeds,
      data: orders,
      rank: req.session.rank,
      name: req.user.username || "name",
      message: req.session.message || "",
      id:req.user.id
    })
    req.session.message = "";
  }

  // render the vendor view
  async function renderVendor(){
    var connection = await mysql.createConnection(dbconfig);
    if (req.session.rank !== "admin" && req.session.rank !== "vendor") {
      renderStore();
      return;
    }
    let products = await connection.query(
      `select * from products where productVendor =?`,
      [req.user.id]
    );
    req.session.message='Welcome back '+ req.user.username
    res.render("vendor", {
      message:req.session.message || "",
      data: products || [],
      body: {},
      name: req.user.username || "name",
      rank: req.session.rank
    });
    req.session.message=''
  };

  //render the admin view
  function renderAdmin() {
    if (req.session.rank !== "admin" && req.session.rank !== "vendor") {
    renderStore();
    return;
  }
    handleAdmin(res, req);
  };
};
