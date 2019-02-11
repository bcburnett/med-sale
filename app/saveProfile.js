var mysql = require('promise-mysql');
var dbconfig = require('../config/database').config;
let connection;
let errors
let value
const Joi = require('joi');

module.exports = async function(req, res){
  let b = req.body;

  // define the validation schema
  const schema = Joi.object().keys({
    //b.address1, b.address2 , b.city, b.state, b.zip, b.vendor
    lastname: Joi
    .string()
    .required()
    .error(errors => {
      return {
        message: "Lastname is Required"
      }}),

    firstname: Joi
    .string()
    .required()
    .error(errors => {
      return {
        message: "Lastname is Required"
      }}),

    email: Joi
    .string()
    .email()
    .required()
    .error(errors => {
      return {
        message: "Lastname is Required"
      }}),

    phone: Joi
    .string()
    .regex(/^(?:(?:\(?(?:00|\+)([1-4]\d\d|[1-9]\d?)\)?)?[\-\.\ \\\/]?)?((?:\(?\d{1,}\)?[\-\.\ \\\/]?){0,})(?:[\-\.\ \\\/]?(?:#|ext\.?|extension|x)[\-\.\ \\\/]?(\d+))?$/i)
    .required()
    .error(errors => {
      return {
        message: "Phone number is Required"
      }}),


    address1: Joi
    .string()
    .required()
    .error(errors => {
      return {
        message: "Address is Required"
      }}),

    address2: Joi.string(),

    city: Joi
    .string()
    .required()
    .error(errors => {
      return {
        message: "City is Required"
      }}),

    state: Joi
    .string()
    .required()
    .error(errors => {
      return {
        message: "State is Required"
      }}),

    zip: Joi
    .string()
    .regex(/^[0-9]{5}(?:-[0-9]{4})?$/)
    .required()
    .error(errors => {
      return {
        message: "Zipcode in the form xxxxx or xxxxx-xxxx is required"
      }}),

    country: Joi
    .string()
    .required()
    .error(errors => {
      return {
        message: "If Your State isn't listed enter your state,country in the state/country box otherwise enter your country Required"
      }}),

    vendor: Joi.string()

  });

  // validate the request data against the schema
  errors = await Joi.validate(b, schema,{'abortEarly':false}, (err, value) => {
    if(err){
      errors = 'error'
      console.log(JSON.stringify(err))
      errorReturn(JSON.stringify(err.details.map(e=>e.message))); return errors
    }
  })

  if(errors)return


  connection = await mysql.createConnection(dbconfig).catch( (e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 8')})

  try {
    const del = await connection.query(` delete  from customers where customerNumber =?`,[req.user.id]).catch((e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 80')})
  } catch (error) {

  }

  const customer = await connection.query(`INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, email, phone, addressLine1, addressLine2, city, state, postalCode,vendor,country) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?,?)`, [req.user.id,b.firstname+' '+b.lastname,b.lastname,b.firstname,b.email,b.phone,b.address1, b.address2 , b.city, b.state, b.zip, b.vendor,b.country]).catch((e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 85')})

  const attrib = await connection.query(` update attributes set infoGathered = 1 where attributes.userid =?`,[req.user.id]).catch((e)=>{console.log(e,'ERROR UPDATEPROFILEJS LINE 87')})

  res.redirect('/home')


  function errorReturn (message){
    res.render('profile.ejs', {
      message:message || '',
      body:req.body,
      name:req.user.username||"name"
    })
    return
  }
}
