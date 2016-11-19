var express = require('express');
var router = express.Router();
var controller = require('./controller.js');
router.get('/collections',controller.list);
router.get('/collections/:collection',controller.printData);
router.put('/collections',controller.save);
module.exports = router;
