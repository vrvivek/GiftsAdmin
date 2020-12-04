const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/state/index',(req,res,next)=>{
    sql="select * from states";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.render('stateView',{pageTitle:'states',states:results});
    });   
});

router.post('/state/add',(req,res,next)=>{
    if(req.body.statename != null){
        sql="insert into states(State_Name) values(?)";
        let query = conn.query(sql, [req.body.statename],(err, results) => {
            if (err) throw err;
            res.redirect('/admin/state/index');
        });
    }
    else{
        res.redirect('/admin/state/index');
    }
});

router.post('/state/edit/:id',(req,res,next)=>{
    if(req.body.editstatename != null && req.params.id != undefined){
    sql="update states set State_Name=? where State_Id=?;";
        let query = conn.query(sql, [req.body.editstatename,req.params.id],(err, results) => {
            if (err) throw err;
            //console.log(JSON.stringify(results));
            res.redirect('/admin/state/index');
        });
    }
    else{
        res.redirect('/admin/state/index');
    }
});

exports.router = router;