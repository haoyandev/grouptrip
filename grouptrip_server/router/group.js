const express = require('express')
const pool = require('../pool')
const fs = require('fs')
const path = require('path')
const { getNoteTagIds, getNoteTagNames, publishGroup , uploadImg} = require('../fun')
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
  var groupInfo = req.body
  var { tid, cid, intr, imgList, begin_time, end_time } = groupInfo
  // 检验数据
  if (!tid) {
    return res.send({ code: 4001, msg: `主题为空` })
  }
  if (!cid) {
    return res.send({ code: 4002, msg: `城市为空` })
  }
  if (!intr) {
    return res.send({ code: 4003, msg: `内容为空` })
  }
  if (!begin_time) {
    return res.send({ code: 4004, msg: `开始时间为空` })
  }
  if (!end_time) {
    return res.send({ code: 4005, msg: `结束时间为空` })
  }
  if (!imgList) {
    return res.send({ code: 4006, msg: `图片列表为空` })
  }
  // 把uid 赋值给groupInfo
  groupInfo.uid = uid
  // 把图片转为对象
  imgList = JSON.parse(imgList)
  var files = []
  // console.log(imgList)
  // 获取图片后缀 整理图片对象
  for (var item of imgList) {
    // console.log(item.match()[1])
    var suReg = /image\/(\w+);/
    var su = item.match(suReg)
    if (su) {
      su = su[1]
    }
    // 创建图片fileId
    var fileID = Date.now() + Math.floor(Math.random() * 999)+ '.' + su
    // 拼接图片的本地路径
    var imgUrl = 'http://localhost:3000/group/' + fileID
    files.push({dataUrl: item, localFileID: imgUrl})
  }
  console.log(files)
  // 创建变量保存上传图片任务
  var tasks = []
  for (var file of files) {
    uploadImg(file.dataUrl, file.localFileID).then(() => {
      // 插入组团游图片表数据
      var sql = `insert into `
    })
  }

  
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

// 7. 组团游列表
router.get('/api/v1/grouplist/:order/:pno', (req, res) => {
  // 获取数据
  // 排序方式
  var order = req.params.order
  // 页码
  var pno = req.params.pno
  // 检验数据
  if (!order) {
    如果未提供
    order = 'create_time'
  }
})
// 8. 游记列表
router.get('/api/v1/notelist/:pno', (req, res) => {
  // 获取数据
  var pno = req.params.pno
  pno = parseInt(pno)
  if (!pno) {
    pno = 1
  }
  // 每次返回两条数据
  var count = 2
  // 计算start
  var start = (pno - 1) * count
  // 执行sql
  var sql = `select nid, title, likes, comments, img, n.create_time,u.uid, avatar from trip_note n left join trip_user u on n.uid=u.uid limit ?, ?`
  pool.query(sql, [start, count], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      var tasks = []
      var nodeList = result
      for (item of nodeList) {
        var p = new Promise((resolve, reject) => {
          getNoteTagIds(item)
          .then(getNoteTagNames)
          .then(() => {
            resolve()
          })
          .catch(err => { reject(err) })
        })
        tasks.push(p)
      }
      Promise.all(tasks).then(() => {
        res.send({ code: 200, data: nodeList })
      })
    } else {
      res.send({ code: 4001, msg: `没有更多的数据了`, data: [] })
    }
  })
})
// 9. 组团游搜索
router.get('/api/v1/group/:kw', (req, res) => {
  // 获取用户的搜索关键字

})
module.exports = router