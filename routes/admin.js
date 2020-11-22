const path= require('path');
const express=require('express');
const rootDir = require('../util/path');
const router = express.Router();

router.get('/index',(req,res,next)=>{
    //res.sendFile(path.join(rootDir, 'views','add-pro.html'));
    res.render('data',{pageTitle:'Dashboard'});
});

router.get('/test',(req,res,next)=>{
    //res.sendFile(path.join(rootDir, 'views','add-pro.html'));
    res.render('test',{pageTitle:'test'});
});

exports.router = router;