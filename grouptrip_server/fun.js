const pool = require('./pool')


// 获取基本用户信息
function getBaseInfo (uid) {
  return new Promise ((resolve, reject) => {
      var sql = `select uid, avatar, uname, gender, birthday, age, intr from trip_user where uid=?`
      pool.query(sql, [uid], (err, result) => {
      if (err) {
        reject(err)
      }
      if (result.length > 0) {
        resolve(result[0])
      }
    })
  })
}
// 获取粉丝数
function getFunsNum (uid) {
  return new Promise((resolve, reject) => {
    var sql = `select count(1) as fansNum from trip_focus where uid=?`
    pool.query(sql, [uid], (err, result) => {
      console.log('fan', result)
      if (err) {
        reject(err)
      }
      resolve(result[0])
    })
  })
}

// 获取关注数
function getFocusNum (uid) {
  return new Promise ((resolve, reject) => {
    var sql = `select count(1) as focusNum from trip_focus where from_uid=?`
    pool.query(sql, [uid], (err, result) => {
      if (err) {
        reject(err)
      } else {
        resolve(result[0])
      }
    })
  })
}
module.exports = { getBaseInfo, getFunsNum, getFocusNum }