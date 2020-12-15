const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/secretque/index',(req,res,next)=>{
    sql="select * from secret_ques";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.render('secretqueView',{pageTitle:'secretques',secretques:results});
    });   
});

router.post('/secretque/add',(req,res,next)=>{
    if(req.body.secretque != null){
        sql="insert into secret_ques(Secret_Que) values(?)";
        let query = conn.query(sql, [req.body.secretque],(err, results) => {
            if (err) throw err;
            res.redirect('/admin/secretque/index');
        });
    }
    else{
        res.redirect('/admin/secretque/index');
    }
});

router.post('/secretque/edit/:id',(req,res,next)=>{
    if(req.body.editsecretque != null && req.params.id != undefined){
    sql="update secret_ques set Secret_Que=? where Secret_Id=?;";
        let query = conn.query(sql, [req.body.editsecretque,req.params.id],(err, results) => {
            if (err) throw err;
            //console.log(JSON.stringify(results));
            res.redirect('/admin/secretque/index');
        });
    }
    else{
        res.redirect('/admin/secretque/index');
    }
});

exports.router = router;