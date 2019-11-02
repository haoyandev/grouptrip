const mysql = require('mysql')
var pool = mysql.createPool({
  host: 'w.rdc.sae.sina.com.cn',
  port: 3306,
  user: 'kwlk51lm3m',
  password: '4j1lwjyz1hh5w0x51xl11jl00m0wxkxhhhxxkllk',
  database: 'app_grouptrip',
  connectionLimit: 15
})

module.exports = pool