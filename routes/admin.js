const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/index',(req,res,next)=>{
    res.render('data',{pageTitle:'Dashboard'});
});

exports.router = router;