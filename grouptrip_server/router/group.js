const express = require('express')
const pool = require('../pool')
const fs = require('fs')
const path = require('path')
const {
  getNoteTagIds,
  getNoteTagNames,
  uploadImg
} = require('../fun')
// 引入jwt
const {
  generateToken
} = require('../jwt')
// 创建路由器
var router = express.Router()

// 2. 获取主题列表
router.get('/api/v1/themelist', (req, res) => {
  // 执行sql
  var sql = `select tid, tname, timg from trip_theme`
  pool.query(sql, (err, result) => {
    if (err) throw err
    res.send({
      code: 200,
      data: result
    })
  })
})
// 3. 发布组团游
router.post('/api/v1/publish', (req, res) => {
  // 获取数据
  var groupInfo = req.body
  console.log(groupInfo)
  var { tid, tname, timg, sid, cid, area, date, content, likes, imgList, uname, avatar, gender, age, uid } = groupInfo
  // 检验数据
  if (!tid && !tname && !timg && !sid && !cid &&
    !area && !date && !content && !likes &&
    !uname && !avatar && !gender && !age && !uid
  ) {
    return res.send({
      code: 4001,
      msg: `参数不齐`
    })
  }
  var sql = `insert into trip_groups (tid, tname, timg, sid, cid, area, date, content, likes, uid, uname, avatar, gender, age) values(?, ?, ?, ?, ?, ?, ?,
    ?, ?, ?, ?, ?, ?, ?)`
  pool.query(sql, [tid, tname, timg, sid, cid, area, date, content, likes, uid, uname, avatar, gender, age||0], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      var gid = result.insertId
      // 把图片转为对象
      imgList = JSON.parse(imgList)
      var files = []
      // 获取图片后缀 整理图片对象
      for (var item of imgList) {
        // console.log(item.match()[1])
        var suReg = /image\/(\w+);/
        var su = item.match(suReg)
        if (su) {
          su = su[1]
        }
        // 创建图片fileId
        var fileID = Date.now() + Math.floor(Math.random() * 999) + '.' + su
        // 拼接图片的本地绝对路径
        var localFileID = __dirname + '/../public/group/' + fileID
        // 拼接图片的本地路径
        var imgUrl = 'http://localhost:3000/group/' + fileID
        files.push({
          dataUrl: item,
          localFileID,
          fileID
        })
      }
      var tasks = []
      for (var file of files) {
        var p = new Promise((resolve, reject) => {
          uploadImg(file.dataUrl, file.localFileID, file.fileID).then((result) => {
            // 拼接图片的网络地址
            var imgUrl = 'http://localhost:3000/group/' + result
            resolve(imgUrl)
          }).catch(err => reject(err))
        })
        tasks.push(p)
      }
      Promise.all(tasks).then(result => {
        var sql = `update trip_groups set img1=?, img2=? where id=?`
        pool.query(sql, [...result, gid], (err, result) => {
          if (err) throw err
          if (result.affectedRows > 0) {
            res.send({
              code: 200,
              msg: `发布成功`
            })
          } else {
            res.send({
              code: 4002,
              msg: `发布失败`
            })
          }

        })
      })
    } else {

    }
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
  // 每次返回8条数据
  var count = 8
  var start = (pno - 1) * count

  // 执行sql
  var sql = `select cid, cname, elname, views, detail,hot_spots,poster,img from trip_city limit ?, 8`
  pool.query(sql, [start], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({
        code: 200,
        data: result
      })
    } else {
      res.send({
        code: 4001,
        msg: `没有更多数据`
      })
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
      res.send({
        code: 200,
        data: result
      })
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
      var groupList = result
      var tasks = []
      for (var item of groupList) {
        tasks.push(
          new Promise((resolve, reject) => {
            var sql = `select img from trip_group_img where gid=?`
            pool.query(sql, [item.gid], (err, result) => {
              if (err) reject(err)
              console.log(item.gid)
              Object.assign(item, {
                imgs: result
              })
              resolve()
            })
          })
        )
      }
      Promise.all(tasks).then(result => console.log(groupList))
    } else {
      res.send({
        code: 4001,
        msg: `没用更多数据了`,
        data: []
      })
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
            .catch(err => {
              reject(err)
            })
        })
        tasks.push(p)
      }
      Promise.all(tasks).then(() => {
        res.send({
          code: 200,
          data: nodeList
        })
      })
    } else {
      res.send({
        code: 4001,
        msg: `没有更多的数据了`,
        data: []
      })
    }
  })
})
// 9. 组团游搜索
router.get('/api/v1/search/:kw/:pno', (req, res) => {
  // 获取数据
  var kw = req.params.kw
  if (!kw) {
    return res.send({
      code: 4001,
      msg: `关键字为空`
    })
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
  var sql = `select * from trip_groups where tname like ? or content like ? or area like ?`
  pool.query(sql, [`%${kw}%`, `%${kw}%`, `%${kw}%`], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({
        code: 200,
        data: result
      })
    } else {
      res.send({
        code: 4001,
        msg: `没有更多数据了`
      })
    }
  })
})
// 10. place
router.get('/api/v1/place', (req, res) => {
  // 执行sql
  var sql = `select cid, cname, img from trip_city`
  pool.query(sql, (err, result) => {
    if (err) throw err
    res.send({
      code: 200,
      data: result
    })
  })
})
// 11. 游记首页轮播图
router.get('/api/v1/banner', (req, res) => {
  // 执行sql

})
// 12. 筛选
router.get('/api/v1/grouplist', (req, res) => {
  // 获取数据
  var {
    cid,
    tid,
    pno
  } = req.query

  pno = parseInt(pno)
  if (!pno) {
    pno = 1
  }
  // 每次返回2条数据
  var count = 2
  // 计算start
  var start = (pno - 1) * count

  if (!cid && tid) {
    var sql = `select * from trip_groups where tid=? limit ?,?`
    pool.query(sql, [tid, start, count], (err, result) => {
      if (err) throw err
      if (result.length > 0) {
        console.log(result.length)
        res.send({
          code: 200,
          data: result
        })
      } else {
        res.send({
          code: 4001,
          msg: `没有数据`
        })
      }
    })
  } else if (!tid && cid) {
    var sql = `select * from trip_groups where cid=? limit ?, ?`
    pool.query(sql, [cid, start, count], (err, result) => {
      if (err) throw err
      if (result.length > 0) {
        console.log(result.length)
        res.send({
          code: 200,
          data: result
        })
      } else {
        res.send({
          code: 4001,
          msg: `没有数据`
        })
      }
    })
  } else if (tid && cid) {
    var sql = `select * from trip_groups where tid=? and cid=? limit ?, ?`
    pool.query(sql, [tid, cid, start, count], (err, result) => {
      if (err) throw err
      if (result.length > 0) {
        console.log(result.length)
        res.send({
          code: 200,
          data: result
        })
      } else {
        res.send({
          code: 4001,
          msg: `没有数据`
        })
      }
    })
  } else {
    var sql = `select * from trip_groups limit ?, ?`
    pool.query(sql, [start, count], (err, result) => {
      if (err) throw err
      if (result.length > 0) {
        console.log(result.length)
        res.send({
          code: 200,
          data: result
        })
      } else {
        res.send({
          code: 4001,
          msg: `没有数据`
        })
      }
    })
  }
  console.log(cid, tid)
})
// 13. 首页组团游
router.get('/api/v1/idxgrouplist', (req, res) => {
  var pno = req.query.pno
  pno = parseInt(pno)
  if (!pno) {
    pno = 1
  }
  // 每次返回6条数据
  var count = 6
  // 计算start
  var start = (pno - 1) * count
  // 执行sql
  var sql = `select 
id, tid, tname, sid, cid, area, date, content, likes, bg,img1, img2, uid, uname, avatar, gender, age
  from trip_groups group by tid,sid,cid limit ?, ?`
  pool.query(sql, [start, count], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({
        code: 200,
        data: result
      })
    } else {
      res.send({
        code: 4001,
        msg: `没有更多数据了`
      })
    }
  })
})

// 14. 个人组团游列表
router.get('/api/v1/pgroup', (req, res) => {
  // 获取信息
  var uid = req.query.uid
  console.log(uid)
  if (!uid) {
    res.send({
      code: 4001,
      msg: `用户id为空`
    })
  }
  // 执行sql
  var sql = `select * from trip_groups where uid=?`
  pool.query(sql, [uid], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({
        code: 200,
        data: result
      })
    } else {
      res.send({
        code: 4002,
        msg: `没有更多数据了`
      })
    }
  })
})
// 15. 全部城市列表
router.get('/api/v1/allcity', (req, res) => {
  // 执行sql
  var sql = `select cid, cname, img from trip_city`
  pool.query(sql, (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({
        code: 200,
        data: result
      })
    } else {
      res.send({
        code: 4001,
        msg: `没有数据`
      })
    }
  })
})
module.exports = router