const mysql = require('mysql')
var pool = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: 'roothaoyan',
  database: 'trip',
  connectionLimit: 15
})

module.exports = pool