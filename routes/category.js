const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/category/index',(req,res,next)=>{
    sql="select * from categorys";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.render('categoryView',{pageTitle:'Categorys',categories:results});
    });   
});

router.post('/category/add',(req,res,next)=>{
    if(req.body.categoryname != null && req.body.description){
    sql="insert into categorys(Category_Name,Description) values(?,?)";
    let query = conn.query(sql, [req.body.categoryname,req.body.description],(err, results) => {
        if (err) throw err;
        res.redirect('/admin/category/index');
    });
    }
    else{
        res.render('categoryView',{pageTitle:'Categorys',categories:results,error:true});
    }
});

router.post('/category/edit/:id',(req,res,next)=>{
    if(req.body.categoryname != null && req.body.description){
    sql="update categorys set Category_Name=?,Description=? where Category_Id=?;";
    let query = conn.query(sql, [req.body.categoryname,req.body.description,req.params.id],(err, results) => {
        if (err) throw err;
        console.log(JSON.stringify(results));
        res.redirect('/admin/category/index');
    });
    }
    else{
        res.render('categoryView',{pageTitle:'Categorys',categories:results,error:true});
    }
});

exports.router = router;