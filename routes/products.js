const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/products/index',  (req,res,next)=>{
    sql="select * from products;select Category_Id,Category_Name from categorys;";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results);
        res.render('productsView',{pageTitle:'products',products:results[0],categorys:results[1]});
    });
});

router.post('/products/add',(req,res,next)=>{
    if(req.body.subcategoryname != null && req.body.category){
        sql="insert into `products`(Subcategory_Name,Category_Id) values(?,?)";
        let query = conn.query(sql,[req.body.subcategoryname,req.body.category], (err, results) => {
            if (err) throw err;
            res.redirect('/admin/products/index');
        });
    }
    else{
        res.redirect('/admin/products/index');
    }
});

router.post('/products/edit/:id',(req,res,next)=>{
    if(req.body.subcategoryname != null && req.body.category){
        sql="update `products` set Subcategory_Name=?,Category_Id=? where Subcategory_Id=?;";
        let query = conn.query(sql, [req.body.subcategoryname,req.body.category,req.params.id],(err, results) => {
            if (err) throw err;
            //console.log(JSON.stringify(results));
            res.redirect('/admin/products/index');
        });
    }
    else{
        res.redirect('/admin/products/index');
    }
});

exports.router = router;