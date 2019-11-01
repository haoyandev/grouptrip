const express = require('express')
const pool = require('../pool')
const fs = require('fs')
const path = require('path')
const { getNoteTagIds, getNoteTagNames, publishGroup , uploadImg} = require('../fun')
// 引入jwt
const { generateToken } = require('../jwt')
// 创建路由器
var router = express.Router()

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
  // 将用户id赋值给groupInfo
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
    // 拼接图片的本地绝对路径
    var localFileID = __dirname + '/../public/group/' + fileID
    // 拼接图片的本地路径
    // var imgUrl = 'http://localhost:3000/group/' + fileID
    files.push({ dataUrl: item, localFileID, fileID })
  }
  // console.log(files)
  // 插入新的组团游信息
  publishGroup(groupInfo).then(result => {
    var gid = result
    // 创建变量保存上传图片任务
    var tasks = []
    for (var file of files) {
      var p = new Promise((resolve, reject) => {
        uploadImg(file.dataUrl, file.localFileID, file.fileID).then((result) => {
          // 拼接图片的网络地址
          var imgUrl = 'http://localhost:3000/group/' + result
          var sql = `insert into trip_group_img (gid, img) values (?, ?)`
          pool.query(sql, [gid, imgUrl], (err, result) => {
            if (err) reject(err) 
            resolve()
          })
        }).then(() => resolve()).catch(err => reject(err))
      })
      tasks.push(p)
    }
    Promise.all(tasks).then(result => {
      res.send({ code: 200, msg: '发布成功' })
    }).catch(err => {
      res.send({ code: 4001, msg: `发布失败` })
    })
  })

  
})
// 5. 城市列表
router.get('/api/v1/citylist/:pno', (req, res) => {
  // 获取数据
  var pno = req.params.pno
  pno = parseInt(pno)
  if (!pno) {
    pno = 1
  }
  // 每次返回6条数据
  var count = 8
  var start = (pno - 1) * count
 
  // 执行sql
  var sql = `select cid, cname, elname, views, detail,hot_spots, img from trip_city limit ?, 8`
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
router.get('/api/v1/grouplist/:pno', (req, res) => {
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
   var sql = `select g.gid, g.begin_time, g.end_time, g.intr,c.cid,c.cname, s.sid, u.uid, u.avatar, u.age, u.uname from trip_group g left join trip_user u on g.uid = u.uid left join trip_city c on g.cid = c.cid left join trip_state s on g.sid = s.sid limit ?, ?`
   pool.query(sql, [start, count], (err, result) => {
     if (err) throw err
     if (result.length > 0) {
       res.send({ code: 200, data: result })
     } else {
       res.send({ code: 4001, msg: `没用更多数据了`, data: [] })
     }
   })
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
router.get('/api/v1/search/:kw/:pno', (req, res) => {
  // 获取数据
  var kw = req.params.kw
  if (!kw) {
    return res.send({ code: 4001, msg: `关键字为空` })
  }
  // 解码关键字
  kw = decodeURI(kw)
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
  var sql = `select g.gid, g.begin_time, g.end_time, g.intr,c.cid,c.cname, u.uid, u.avatar from trip_group g left join trip_user u on g.uid = u.uid left join trip_city c on g.cid = c.cid where g.intr like ? limit ?, ?`
  pool.query(sql, [`%${kw}%`, start, count], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({ code: 200, data: result })
    } else {
      res.send({ code: 4001, msg: `没用更多数据了`, data: [] })
    }
  })
})
// 10. place
router.get('/api/v1/place', (req, res) => {
  // 执行sql
  var sql = `select cid, cname, img from trip_city`
  pool.query(sql, (err, result) => {
    if (err) throw err
    res.send({ code: 200, data: result })
  })
})
// 11. 热门城市
router.get('/api/v1/hotcity', (req, res) => {
  // 执行sql
})
module.exports = router

