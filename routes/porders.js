const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/porders/index',(req,res,next)=>{
    sql="select o.*,p.Product_Name,u.User_Name from orders as o join users as u on o.User_Id=u.User_Id join products as p on o.Product_Id=p.Product_Id";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.render('POrdersView',{pageTitle:'Orders',orders:results});
    });   
});

router.post('/porders/add',(req,res,next)=>{
    if(req.body.secretque != null){
        sql="insert into secret_ques(Secret_Que) values(?)";
        let query = conn.query(sql, [req.body.secretque],(err, results) => {
            if (err) throw err;
            res.redirect('/admin/porders/index');
        });
    }
    else{
        res.redirect('/admin/porders/index');
    }
});

router.post('/porders/edit/:id',(req,res,next)=>{
    if(req.body.editsecretque != null && req.params.id != undefined){
    sql="update secret_ques set Secret_Que=? where Secret_Id=?;";
        let query = conn.query(sql, [req.body.editsecretque,req.params.id],(err, results) => {
            if (err) throw err;
            //console.log(JSON.stringify(results));
            res.redirect('/admin/porders/index');
        });
    }
    else{
        res.redirect('/admin/porders/index');
    }
});

exports.router = router;