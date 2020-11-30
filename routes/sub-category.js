const express=require('express');
const rootDir = require('../util/path');
const conn = require('./../routes/database');
const router = express.Router();

router.get('/sub-category/index',  (req,res,next)=>{
    sql="select sc.*,c.Category_Name from `sub-categorys` as sc join categorys as c where c.Category_Id=sc.Category_Id ;select Category_Id,Category_Name from categorys;";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results);
        res.render('sub-categoryView',{pageTitle:'Sub-Categorys',subcategories:results[0],categorys:results[1]});
    });
});

router.post('/sub-category/add',(req,res,next)=>{
    if(req.body.subcategoryname != null && req.body.category){
        sql="insert into `sub-categorys`(Subcategory_Name,Category_Id) values(?,?)";
        let query = conn.query(sql,[req.body.subcategoryname,req.body.category], (err, results) => {
            if (err) throw err;
            res.redirect('/admin/sub-category/index');
        });
    }
    else{
        res.redirect('/admin/sub-category/index');
    }
});

router.post('/sub-category/edit/:id',(req,res,next)=>{
    if(req.body.subcategoryname != null && req.body.category){
        sql="update `sub-categorys` set Subcategory_Name=?,Category_Id=? where Subcategory_Id=?;";
        let query = conn.query(sql, [req.body.subcategoryname,req.body.category,req.params.id],(err, results) => {
            if (err) throw err;
            //console.log(JSON.stringify(results));
            res.redirect('/admin/sub-category/index');
        });
    }
    else{
        res.redirect('/admin/sub-category/index');
    }
});

exports.router = router;