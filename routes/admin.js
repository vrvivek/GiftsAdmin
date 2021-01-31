const express=require('express');
const rootDir = require('../util/path');
const conn = require('../models/database');
const router = express.Router();

router.get('/index',(req,res,next)=>{
    sql = "select count(*) as countcategorys from categorys;"
    sql += "select count(*) as countsubcategorys from `sub-categorys`;";
    sql += "select count(*) as countusers from users;";
    sql += "select count(*) as countproducs from products;";
    sql += "select count(*) as countstates from states;";
    sql += "select count(*) as countcitys from citys;";
    sql += "select count(*) as countsecretques from secret_ques;";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        //console.log(results);
        res.render('Dashboard',{
            pageTitle:'Dashboard',
            categorys:results[0][0],
            subcategories:results[1][0],
            users : results[2][0],
            products : results[3][0],
            states : results[4][0],
            citys : results[5][0],
            secrets : results[6][0]
        });
    });
    
});

exports.router = router;