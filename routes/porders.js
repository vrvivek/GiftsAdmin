const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/porders/index',(req,res,next)=>{
    sql="select o.*,p.Product_Name,p.Image1,u.User_Name from orders as o join users as u on o.User_Id=u.User_Id join products as p on o.Product_Id=p.Product_Id";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.render('POrdersView',{pageTitle:'Orders',orders:results});
    });   
});

router.post('/porders/edit/:id',(req,res,next)=>{
    if(req.body.Status != null && req.params.id != undefined){
        var date= new Date();
        sql="update orders set 	Status=? , updated_at='"+date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate() +' ' +date.toLocaleTimeString().split(' ')[0]+"' where Order_Id=?;";
        let query = conn.query(sql, [req.body.Status,req.params.id],(err, results) => {
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