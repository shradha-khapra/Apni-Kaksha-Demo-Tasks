var mysql = require('mysql');
var connection = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    // db password
    password: 'your database password',
    // db instance name 
    database: 'hospital'
})
connection.connect();
module.exports = connection;
