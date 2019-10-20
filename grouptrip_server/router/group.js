const express = require('express')
const pool = require('../pool')
const fs = require('fs')
const path = require('path')
const { upload } = require('../fun')
// 引入jwt
const { generateToken } = require('../jwt')
// 创建路由器
var router = express.Router()

// 1. 组队游列表
router.get('/list', (req, res) => {
  // 执行sql 查询组团信息
})

// 2. 上传组团游图片
router.post('/upload', (req, res) => {
  // 获取用户信息
  var user = { uid: 2 }
  // 获取当前时间
  var now = Date.now()
  // 创建文件名
  var pathName = path.join(__dirname, `../public/group/`)
  var fileName = pathName + `${user.uid}${now}.png`
  var imgPath = `group/${user.uid}${now}.png`
  // 获取图片base64数据
  var data = req.body.data
  var callback = function (imgPath) {
    var sql = `insert into trip_group_img where gid=? and uid=?`
    pool.query(sql, [imgPath, gid, user.uid], (err, result) => {
      if (err) throw err
      if (result.affectedRows > 0) {
        res.send({ code: 200, msg: '上传成功'})
      } else {
        res.send({ code: 4001, msg: '上传失败'})
      }
    })
  }
  upload(fileName, data, imgPath, callback)

  res.send('ddd')
})

module.exports = router