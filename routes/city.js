const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/city/index',  (req,res,next)=>{
    sql="select c.*,s.State_Name from citys as c join states as s where c.State_Id=s.State_Id ;select * from states;";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results);
        res.render('cityView',{pageTitle:'citys',cities:results[0],states:results[1]});
    });
});

router.post('/city/add',(req,res,next)=>{
    if(req.body.cityname != null && req.body.state){
        sql="insert into citys(City_Name,State_Id) values(?,?)";
        let query = conn.query(sql,[req.body.cityname,req.body.state], (err, results) => {
            if (err) throw err;
            res.redirect('/admin/city/index');
        });
    }
    else{
        res.redirect('/admin/city/index');
    }
});

router.post('/city/edit/:id',(req,res,next)=>{
    if(req.body.cityname != null && req.body.state){
        sql="update citys set City_Name=?,State_Id=? where City_Id=?;";
        let query = conn.query(sql, [req.body.cityname,req.body.state,req.params.id],(err, results) => {
            if (err) throw err;
            //console.log(JSON.stringify(results));
            res.redirect('/admin/city/index');
        });
    }
    else{
        res.redirect('/admin/city/index');
    }
});

exports.router = router;