const express=require('express');
const session = require('express-session');
const path= require('path');
const admin = require('./routes/admin');
const category = require('./routes/category');
const login = require('./routes/login');
const body=require('body-parser');

const app = express(); 

app.set('view engine','ejs');
app.set('views','views');

app.use(session({secret:'!@#$%^&*',resave:false ,saveUninitialized:false}))
app.use(body.urlencoded({extended:false}));
app.use(express.static(path.join(__dirname,'public')));

app.use(login.router);
app.use('/admin',admin.router);
app.use('/admin',category.router);

app.use('/',(req,res,next)=>{
    res.statusCode= 404;
    res.render('404',{pageTitle:'Page Not Found'});
});

app.listen(3000);