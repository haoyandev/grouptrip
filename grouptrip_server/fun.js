const pool = require('./pool')
const fs = require('fs')

// 获取基本用户信息
function getBaseInfo (uid) {
  return new Promise ((resolve, reject) => {
      var sql = `select uid, avatar, uname, gender, birthday, age, intr, city from trip_user where uid=?`
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
function uploadImg (dataUrl, localFileID, fileID) {
  return new Promise((resolve, reject) => {
    //  过滤data:URL
    var base64Data = dataUrl.replace(/^data:image\/\w+;base64,/, "")
    // 解码图片
    var dataBuffer = new Buffer.from(base64Data, 'base64')
    // 写入图片
    // console.log(dataUrl,localFileID)
    fs.writeFile(localFileID, dataBuffer, (err) => {
      if (err) reject(err)
      // 成功
      // 执行回调函数
      resolve(fileID)
    })
  })
}
// 获取游记标签id
function getNoteTagIds (item) {
  return new Promise((resolve, reject) => {
    // 查询游记的标签id列表
    var sql = `select tid from trip_note_tag where nid=?`
    pool.query(sql, [item.nid], (err, result) => {
      if (err) reject (err)
      // 如果有标签 把结果转为数组再赋值给游记对象
      if (result.length > 0) {
        var tagIds = []
        for (var data of result) {
          tagIds.push(data.tid)
        }
        Object.assign(item, { tags: tagIds })
        resolve(item)
      } else {
        // 没有设置标签 标签为空
        Object.assign(item, { tags: [] })
        resolve(item)
      }
    })
  })
}
// 获取游记标签名
function getNoteTagNames (item) {
  return new Promise((resolve, reject) => {
    var tags = item.tags
    if (tags.length > 0) {
      var sql = `select tid, tname from trip_tag where tid in (?)`
      pool.query(sql, [item.tags], (err, result) => {
        if (err) reject(err)
        if (result.length > 0) {
          var tags = []
          for (var tag of result) {
            tags.push(tag.tname)
          }
          item.tags = tags
          resolve(item)
        } else {
          resolve(item)
        }
      })
    } else {
      // 标签为空不需要下一步操作
      resolve(item)
    }
  })
}
// 发布组团游
function publishGroup (groupInfo) {
  return new Promise((resolve, reject) => {
    var { tid, tname, timg, sid, cid, area, date, content, likes, uname, avatar, gender, age, uid } = groupInfo
    // 执行sql
    var sql = `insert into trip_group (tid, tname, timg, sid, cid, area, date, content, likes, uid, uname, avatar, gender, age) values(?, ?, ?, ?, ?, ?, ?,
      ?, ?, ?, ?, ?, ?, ?)`
    pool.query(sql, [tid, tname, timg, sid, cid, area, date, content, likes, uid, uname, avatar, gender, age], (err, result) => {
      console.log('11', result)
      if (err) reject(err)
      if (result.affectedRows > 0) {
        resolve(result.insertId)
      } else {
        reject({ code: 4006, msg: `发布失败` })
      }
    })
  })
}

// 组团游列表
function getGroupList () {
  return new Promise((resolve, reject) => [
    
  ])
}
module.exports = { getBaseInfo, getFunsNum, getFocusNum, uploadImg, checkIsFollowed, getNoteTagIds, getNoteTagNames, publishGroup }