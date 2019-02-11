const { check,validationResult } = require('express-validator/check');
const { sanitizeBody } = require('express-validator/filter');
module.exports= [
  check('email').isEmail()

];
