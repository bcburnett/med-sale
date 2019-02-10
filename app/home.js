var mysql = require("mysql");
var dbconfig = require("../config/database");
var connection = mysql.createConnection(dbconfig.connection);
var handleAdmin = require('./admin')
let Parser = require('rss-parser');
let parser = new Parser();

connection.query("USE " + dbconfig.database);

module.exports = function(req, res) {


  // (async () => {
  //   let feed = await parser.parseURL('https://rss.medicalnewstoday.com/medical_devices.xml');
  //   console.log(JSON.stringify(feed));})();



  connection.query(
    `
  select customerNumber from customers where customerNumber =?`,
    [req.user.id],
    (err, row, fields) => {
      if (!row[0]) {
        res.render("profile", {
          user: req.user,
          message: ["Thank You For Registering"],
          body: req.body
        });
        return;
      }

      connection.query(
        `
    select rank from attributes where userid =?`,
        [req.user.id],
        (err, row1, fields) => {
          let rank = req.session.next || row1[0].rank;
          req.session.rank = row1[0].rank;
          if (rank === "user") {
            renderStore();
          }
          if (rank === "vendor") {
            renderVendor();
          }
          if (rank === "admin") {
            renderAdmin();
          }
        }
      );
    }
  );
  const renderStore = () => {
    req.session.next = "";
    connection.query(
      `
  select orderNumber, orderDate, keytext, product from orders where customerNumber =?`,
      [req.user.id],
      (err, row, fields) => {
        res.render("store", {
          data: row,
          rank: req.session.rank,
          name: req.user.username || "name",
          message: req.session.message || ""
        });
        req.session.message = "";
      }
    );
  };

  const renderVendor = () => {
    if (req.session.rank !== "admin" && req.session.rank !== "vendor") {
      res.render("store", { data: row, rank: req.session.rank });
      return;
    }
    connection.query(
      `
  select * from products where productVendor =?`,
      [req.user.id],
      (err, row, fields) => {
        res.render("vendor", {
          message: "",
          data: row || [],
          body: {},
          name: req.user.username || "name",
          rank: req.session.rank
        });
      }
    );
  };
  const renderAdmin = () => {
    handleAdmin(res,req)
  };
};
