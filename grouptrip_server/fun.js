const pool = require('./pool')
const fs = require('fs')

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
    var sql = `select count(1) as fansNum from trip_focus where uid=? and is_delete=0`
    pool.query(sql, [uid], (err, result) => {
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
    var sql = `select count(1) as focusNum from trip_focus where from_uid=? and is_delete=0`
    pool.query(sql, [uid], (err, result) => {
      if (err) {
        reject(err)
      } else {
        resolve(result[0])
      }
    })
  })
}
// 判断是否被关注
function checkIsFollowed (uid, from_uid) {
  return new Promise ((resolve, reject) => {
    var sql = `select fid from trip_focus where uid=? and from_uid=?`
    pool.query(sql, [uid, from_uid], (err, result) => {
      if (err) {
        reject(err)
      } else {
        if (result.length > 0) {
          resolve({ checkIsFollowed: true })
        } else {
          resolve({ checkIsFollowed: false })
        }
      }
    })
  })
}
// 上传图片
function uploadImg (dataUrl, localFileID) {
  return new Promise((resolve, reject) => {
    //  过滤data:URL
    var base64Data = dataUrl.replace(/^data:image\/\w+;base64,/, "")
    // 解码图片
    var dataBuffer = new Buffer(base64Data, 'base64')
    // 写入图片
    fs.writeFile(localFileID, dataBuffer, (err) => {
      if (err) reject(err)
      // 成功
      // 执行回调函数
      resolve('ok')
    })
  })
}

module.exports = { getBaseInfo, getFunsNum, getFocusNum, uploadImg, checkIsFollowed }