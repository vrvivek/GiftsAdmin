const path= require('path');
const express=require('express');
const rootDir = require('../util/path');
const conn = require('./../routes/database');
const router = express.Router();

router.post('/login',(req,res,next)=>{
    let sql = "SELECT * FROM admins where Email_Id=? and Password=? ";
    //console.log(sql);
    let query = conn.query(sql,[req.body.email,req.body.password], (err, results) => {
        if (err) throw err;
        if(results.length>0){
            console.log(results[0]);
            req.session.status=true;
            req.session.name=results[0].Admin_Name;
            res.redirect('admin/index');
        }else{
            res.render('login',{pageTitle:'login',error:'Invalid Username And Password'});
        }
    });
});

router.get('/login',(req,res,next)=>{
    if(req.session.status){
        res.redirect('admin/index');
    }else
        res.render('login',{pageTitle:'Login'});
});

router.get('/logout',(req,res,next)=>{
    req.session.destroy((err) => {
        res.redirect('/login'); // will always fire after session is destroyed
    })
});

router.use((req,res,next)=>{
    if(req.session.status){
        next();
    }else
        res.render('login',{pageTitle:'Login'});
});
exports.router = router;