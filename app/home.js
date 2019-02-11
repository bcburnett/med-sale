var mysql = require("promise-mysql");
var dbconfig = require("../config/database").config;
var handleAdmin = require("./admin");
let Parser = require("rss-parser");
let parser = new Parser();

module.exports = async function(req, res) {
  // (async () => {
  //   let feed = await parser.parseURL('https://rss.medicalnewstoday.com/medical_devices.xml');
  //   console.log(JSON.stringify(feed));})();

  var connection = await mysql.createConnection(dbconfig);
  const cn = await connection.query(`select customerNumber from customers where customerNumber =?`,[req.user.id]);
  console.log(cn)
  if (!cn) {
    res.render("profile", {
      user: req.user,
      message: ["Thank You For Registering"],
      body: req.body
    });
    return;
  }

  let dbrank = await connection.query(`select rank from attributes where userid =?`,[req.user.id]);
  dbrank = JSON.parse(JSON.stringify(dbrank))[0].rank
   console.log(dbrank)
  rank = req.session.next || dbrank
  req.session.rank = dbrank;

  if (rank === "user") {
    renderStore();
  } else if (rank === "vendor") {
    renderVendor();
  } else if (rank === "admin") {
    renderAdmin();
  }

  async function renderStore () {

    parser.parseURL('https://rss.medicalnewstoday.com/medical_devices.xml')
    .then(async(feed,ed)=>{
    // console.log(feed)
    req.session.next = "";
    var connection = await mysql.createConnection(dbconfig);
    const orders = await connection.query(
      `select orderNumber, orderDate, keytext, product from orders where customerNumber =?`,
      [req.user.id]
    );
    console.log(feed)
    res.render("store", {
      data: orders,
      rank: req.session.rank,
      name: req.user.username || "name",
      message: req.session.message || "",
      feed: JSON.stringify(feed) || "--feed--"
    });

    req.session.message = "";

    }).catch(e=> console.log(e))

  }

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
    res.render("vendor", {
      message: "",
      data: products || [],
      body: {},
      name: req.user.username || "name",
      rank: req.session.rank
    });
  };

  function renderAdmin() {
    handleAdmin(res, req);
  };
};
