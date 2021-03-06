const express=require('express');
const session = require('express-session');
const path= require('path');
const admin = require('./routes/admin');
const category = require('./routes/category');
const subcategory = require('./routes/sub-category');
const products=require('./routes/product');
const state= require('./routes/state');
const city= require('./routes/city');
const secret= require('./routes/secret-que');
const porders= require('./routes/porders');
const login = require('./routes/login');
const body=require('body-parser');
const helmet = require("helmet");

const app = express(); 

app.set('view engine','ejs');
app.set('views','views');

app.use(helmet({
    contentSecurityPolicy: false,
    referrerPolicy: { policy: "no-referrer" }
  }));
app.use(session({secret:'!@#$%^&*',resave:false ,saveUninitialized:false}))
app.use(body.urlencoded({extended:false}));
app.use(express.static(path.join(__dirname,'public')));

app.use(login.router);
app.use('/admin',admin.router);
app.use('/admin',category.router);
app.use('/admin',subcategory.router);
app.use('/admin',products.router);
app.use('/admin',state.router);
app.use('/admin',city.router);
app.use('/admin',secret.router);
app.use('/admin',porders.router);

app.use('/',(req,res,next)=>{
    res.statusCode= 404;
    res.render('404',{pageTitle:'Page Not Found'});
});

app.listen(3000);