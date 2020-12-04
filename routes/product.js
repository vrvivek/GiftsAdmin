const express=require('express');
const rootDir = require('../util/path');
const path = require('path');
const conn = require('../models/database');
const multer = require('multer');
const router = express.Router();

//set storage engine
const storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null,'./public/productImage');
    },
    filename:function(req,file,cb){
        var fname=file.originalname.split('.')[0] + ' - ' + Date.now() + path.extname(file.originalname);
        cb(null,fname);
    }
}); 

//init upload
const upload = multer({
        storage:storage
    }).fields(
        [
            {name:'image1',maxCount:1},
            {name:'image2',maxCount:1},
            {name:'image3',maxCount:1}
        ]);

//<%= typeof msg != 'undefined' ? msg : '' %>
router.get('/products/index',  (req,res,next)=>{
    sql="select p.*,c.Category_Name,s.Subcategory_Name from products as p join categorys as c join `sub-categorys` as s on p.Category_Id=c.Category_Id and p.`Sub-Category_Id`=s.Subcategory_Id;select Category_Id,Category_Name from categorys;";
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
     upload(req,res,(err)=>{
        var files=req.files;
        if (err) throw err;
        sql="insert into products(Product_Name,Category_Id,`Sub-Category_Id`,Description,Price,Offer,Total_Price,Image1,Image2,Image3,Quantity) values(?,?,?,?,?,?,?,?,?,?,?)";
        let query = conn.query(sql,
            [req.body.productname,
            req.body.category,
            req.body.subcategory,
            req.body.description,
            req.body.price,
            req.body.offer,
            (req.body.price-req.body.offer),
            files.image1[0].filename,
            files.image2[0].filename,
            files.image3[0].filename,
            req.body.quantity],
            (err, results) => {
                if (err) throw err;
                if(results.insertId>0)
                {
                    res.redirect('/admin/products/index');
                }
        });
        req.body.quantity
    });
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