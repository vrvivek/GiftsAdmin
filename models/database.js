const mysql = require("mysql");

//create database connection
const conn = mysql.createConnection({
    // host: "localhost", 
    // user: "root", 
    // password: "", 
    // database: "giftsdeck",
    host: "svr6.educationhost.cloud",
    user: "mwupzuuk_giftsdeck",
    password: "2Uy3QTFvS3",
    database: "mwupzuuk_giftsdeck",
    multipleStatements: true
});

//connect to database
conn.connect((err) => {
    if (err) throw err;
    console.log("Connected...");
});

module.exports = conn;