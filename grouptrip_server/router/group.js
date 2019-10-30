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
router.get('/api/v1/grouplist', (req, res) => {
  // 执行sql 查询组团信息
})

// 2. 获取主题列表
router.get('/api/v1/themelist', (req, res) => {
  // 执行sql
  var sql = `select tid, tname, timg from trip_theme`
  pool.query(sql, (err, result) => {
    if (err) throw err 
    res.send({ code: 200, data: result })
  })
})
// 3. 发布组团游
router.post('/api/v1/publish', (req, res) => {
  // 获取用户id
  var uid = req.user.uid
  // 获取数据
  var data = req.body
  // 获取图片列表
  var imgList = data.imgList
  // 获取主题id 
  var tid = data.tid
  
})
// 4. 上传组团游图片
router.post('/api/v1/upload', (req, res) => {
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
// 5. 城市列表
router.get('/api/v1/citylist/:pno', (req, res) => {
  // 获取数据
  var pno = req.params.pno
  pno = parseInt(pno)
  // 每次返回6条数据
  var count = 6
  var start = (pno - 1) * count
  if (start) {
    start = 1
  }
  // 执行sql
  var sql = `select cid, cname, elname, views, hot_spots from trip_city limit ?, 6`
  pool.query(sql, [start], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({ code: 200, data: result })
    } else {
      res.send({ code: 4001, msg: `没有更多数据` })
    }
  })
})

// 6. 获取景点列表
router.get('/api/v1/spotslist/:pno', (req, res) => {
  // 获取数据
  var pno = req.params.pno
  // 每次返回6条数据
  var count = 6
  // 计算start
  pno = parseInt(pno)
  var start = (pno - 1) * count
  if (!start) {
    start = 1
  }
  // 执行sql 
  var sql = `select sid, cid from trip_spots limit ?, 6`
  pool.query(sql, [start], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({ code: 200, data: result })
    }
  })
})

module.exports = router