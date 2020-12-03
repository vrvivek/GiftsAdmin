const express=require('express');
const rootDir = require('../util/path');
const path = require('path');
const conn = require('../models/database');
const multer = require('multer');
const router = express.Router();

//set storage engine
const storage = multer.diskStorage({
    destination:'../public/productImage/',
    filename:function(req,file,cb){
        var fname=file.filename + ' - ' + Date.now() + path.extname(file.originalname);
        cb(null,fname);
    }
}); 

//init upload
const upload1 = multer({
        storage:storage
    }).single('image1');
// const upload2 = multer({
//         storage:storage
//     }).single('image2');
// const upload3 = multer({
//         storage:storage
//     }).single('image3');

//<%= typeof msg != 'undefined' ? msg : '' %>
router.get('/products/index',  (req,res,next)=>{
    sql="select * from products;select Category_Id,Category_Name from categorys;";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results);
        res.render('productsView',{pageTitle:'products',products:results[0],categorys:results[1]});
    });
});

router.get('/products/getsubcat/:catid',  (req,res,next)=>{
    sql="select Subcategory_Id,Subcategory_Name from `sub-categorys` where Category_Id=?;";
    let query = conn.query(sql,[req.params.catid], (err, results) => {
        if (err) throw err;
        //console.log(results);
        res.send({subcat:results});
    });
});

router.post('/products/add', (req,res,next)=>{
    console.log(req.file);
    var img1,img2,img3;
     upload1(req,res,(err)=>{
        if (err) throw err;
        console.log(req.file);
        img1=req.file;
        res.redirect('/admin/products/index').end();
    });
    // upload2(req,res,(err=>{
    //     if (err) throw err;
    //     img2=req.file;
    // }));
    // upload3(req,res,(err=>{
    //     if (err) throw err;
    //     img3=req.file;
    //     console.log(img1,img2,img3);
    //     res.redirect('/admin/products/index').end();
    // }));
    // if(req.body.subcategoryname != null && req.body.category){
    //     sql="insert into `products`(Product_Name,Category_Id,Sub-Category_Id,Description,Price,Offer,Total_Price,Image1,Image2,Image3,Quantity) values(?,?,?,?,?,?,?,?,?,?,?)";
    //     let query = conn.query(sql,[req.body.subcategoryname,req.body.category], (err, results) => {
    //         if (err) throw err;
    //         res.redirect('/admin/products/index');
    //     });
    // }
    // else
        
    
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