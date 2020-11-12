const express=require('express');
const adminRoutes = require('./routes/admin');

const body=require('body-parser');

const app = express(); 

app.use(body.urlencoded({extended:false}));

app.use('/admin',adminRoutes);