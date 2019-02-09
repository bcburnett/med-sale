module.exports = (req,res)=>{
  req.session.next = 'user'
  req.session.message=''
  res.redirect('/home')

}
