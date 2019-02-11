const { check } = require('express-validator/check')
const { body,validationResult } = require('express-validator/check');
const { sanitizeBody } = require('express-validator/filter');
module.exports= [
check("productName").not().isEmpty(),
check("productKey").not().isEmpty(),
check("productDescription").not().isEmpty(),
check("buyPrice").isNumeric()
];


