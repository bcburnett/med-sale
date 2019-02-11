let Parser = require('rss-parser');
let parser = new Parser();

module.exports = async function(req, res){
  let feed = await parser.parseURL("https://rss.medicalnewstoday.com/medical_devices.xml");
  console.log(feed.title);

  feed = feed.items.map(item => {
    return String.raw`
    <h2>${item.title}</h2>
    <a href="${item.link}">Read At Source</a>
    <p>${item.content}</p>
    <p>${item.categories[0]._}</p>
    `
  });

  feed = feed.join(' ')

  res.send(feed)
}
