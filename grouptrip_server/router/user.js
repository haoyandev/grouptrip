const express = require('express')
const pool = require('../pool')
// 引入jwt
const { generateToken } = require('../jwt')
const { getBaseInfo, getFunsNum, getFocusNum, uploadImg, checkIsFollowed } = require('../fun')

// 创建路由器
var router = express.Router()

// 添加路由
// 1. 用户注册
router.post('/api/v1/register', (req, res) => {
  // 获取数据
  var obj = req.body
  // 检验数据
  var { phone, upwd } = obj
  if (!phone) {
    return res.send({ code: 4001, msg: `手机为空` })
  } 
  if (!upwd) {
    return res.send({ code: 4002, msg: `密码为空` })
  }
  // 判断手机格式
  var phoneReg = /^1[3456789]\d{9}$/
  if (!phoneReg.test(phone)) {
    return res.send({ code: 4003, msg: `手机格式不正确` })
  }
  // 判断密码格式
  var pwdReg = /^[0-9a-z]{6,12}$/i
  if (!pwdReg.test(upwd)) {
    return res.send({ code: 4004, msg: `密码格式不正确`} )
  }
  //  查询该手机号是否已注册
  var sql = `select uid from trip_user where phone=?`
  pool.query(sql, [phone], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      // 该手机号已存在
      // 返回响应
      res.send({ code: 4005, msg: `该手机号已存在` })
    } else {
      // 该手机号不存在 可以注册
      // 随机给用户分配一个昵称
      var str = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqpstuvwxyz'
      var uname = 'user_'
      for (var i = 0; i < 10; i++) {
        uname += str[Math.floor(Math.random() * 62)]
      }
      var sql = `insert into trip_user(phone,upwd,uname,create_time, update_time) values(?,md5(?),?,now(), now())`
      pool.query(sql, [phone, upwd, uname], (err, result) => {
        if (err) throw err
        if (result.affectedRows > 0) {
          // 注册成功
          res.send({ code: 200, msg: `注册成功` })
        } else {
          // 注册失败
          res.send({ code: 4006, msg: `注册失败` })
        }
      })
    }
  })
})

// 2. 登陆
router.post('/api/v1/login', (req, res) => {
  // 获取用户信息
  var obj = req.body
  var phone = obj.phone
  var upwd = obj.upwd
  // 检验数据
  if (!phone) {
    return res.send({ code: 4001, msg: `请填写用户名` })
  }
  if (!upwd) {
    return res.send({ code: 4002, msg: `请填写密码` })
  }
  // 查询数据库 检验用户信息的合法性
  var sql = `select uid, uname from trip_user where phone=? and upwd=md5(?)`
  pool.query(sql, [phone, upwd], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      // 该用户合法 登陆成功 返回token值
      // 生成token
      result = result[0]
      var data = {
        uid: result.uid,
        uname: result.uname
      }
      var token = generateToken(data)
      // 返回应答
      res.send({ code: 200, msg: `登陆成功`, token: token })
    } else {
      res.send({ code: 4003, msg: `登陆失败` })
    }
  })
})

// 3. 注销
router.get('/api/v1/logout', (req, res) => {
  res.send({ code: 200, msg: `注销成功` })
})
 
// 4. 个人信息
router.get('/api/v1/detail', (req, res) => {
  // 获取用户信息
  var uid = req.user.uid
  // 查询用户相关信息
  var userInfo = {}
  Promise.all([getBaseInfo(uid), getFunsNum(uid), getFocusNum(uid)]).then(result => {
    Object.assign(userInfo, ...result)
    console.log(userInfo)
    res.send({ code: 200, data: userInfo })
  })
})

// 5. 更新昵称
router.put('/api/v1/updatename', (req, res) => {
  // 获取数据
  var uid = req.user.uid
  var uname = req.body.uname
  // 检验名字是否为空
  if (!uname) {
    return res.send({ code: 4001, msg: `用户名为空` })
  }
  // 检验名字格式
  var uReg = /^\w{1,16}&/
  if (uReg.test(uname)) {
    return res.send({ code: 4002, msg: `名字格式不规范` })
  }
  // 获取用户信息
  var user = req.user
  var sql = `update trip_user set uname=? where uid=?`
  pool.query(sql, [uname, uid], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: `修改成功` })
    } else {
      res.send({ code: 4001, msg: `修改失败` })
    }
  })
})
 
// 6. 更新性别
router.put('/api/v1/updatesex', (req, res) => {
  // 获取用户uid
  var uid = req.user.uid
  // 获取数据
  var gender = req.body.gender
  // 检验数据
  if (!gender) {
    return res.send({ code: 4001, msg: `性别为空` })
  }
  // 执行sql 修改性别
  var sql =  `update trip_user set gender=?, update_time=now() where uid=?`
  pool.query(sql, [gender, uid], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: `修改成功` })
    } else {
      res.send({ code: 4002, msg: `修改失败` })
    }
  })
})

// 7. 更新生日
router.put('/api/v1/updatebirth', (req, res) => {
  // 获取用户uid
  var uid = req.user.uid
  // 获取数据
  var birthday = req.body.birthday
  // 检验数据
  if (!birthday) {
    return res.send({ code: 4001, msg: `生日为空` })
  }
  // 执行sql 修改性别
  var sql =  `update trip_user set birthday=?, update_time=now() where uid=?`
  pool.query(sql, [birthday, uid], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: `修改成功` })
    } else {
      res.send({ code: 4002, msg: `修改失败` })
    }
  })
})

// 8. 更新城市
router.put('/api/v1/updatecity', (req, res) => {
  // 获取用户uid
  var uid = req.user.uid
  // 获取数据
  var city = req.body.city
  // 检验数据
  if (!city) {
    return res.send({ code: 4001, msg: `性别为空` })
  }
  // 执行sql 修改性别
  var sql =  `update trip_user set city=?, update_time=now() where uid=?`
  pool.query(sql, [city, uid], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: `修改成功` })
    } else {
      res.send({ code: 4002, msg: `修改失败` })
    }
  })
})

// 9. 更新简介
router.put('/api/v1/updateintr', (req, res) => {
  // 获取用户uid
  var uid = req.user.uid
  // 获取数据
  var intr = req.body.intr
  // 检验数据
  if (!intr) {
    return res.send({ code: 4001, msg: `性别为空` })
  }
  // 执行sql 修改性别
  var sql =  `update trip_user set intr=?, update_time=now() where uid=?`
  pool.query(sql, [intr, uid], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: `修改成功` })
    } else {
      res.send({ code: 4002, msg: `修改失败` })
    }
  })
})

// 10. 关注
router.post('/api/v1/focus', (req, res) => {
  // 获取用户信息
  var user = req.user 
  // 获取被关注用户的uid
  var uid = req.body.uid
  // 检验数据是否为空
  if (!uid) {
    return res.send({ code: 4001, msg: `未提交被关注用户uid` })
  }
  if (uid === user.uid) {
    return res.send({ code: 4002, msg: `不能关注自己` })
  }
  // 查看被关注用户是否存在
  // 执行sql
  var sql = `select uid from trip_user where uid=?`
  pool.query(sql, [uid], (err, result) => {
    if (err) throw err
    // 该用户存在 可关注
    if (result.length === 0) {
      res.send({code: 4003, msg: `该用户不存在` })
    } else {
      // 查看是否已关注
      var sql = `select fid from trip_focus where uid=? and from_uid=? and is_delete = 0`
      pool.query(sql, [uid, user.uid], (err, result) => {
        if (err) throw err
        if (result.length > 0) {
          // 已关注
          res.send({ code: 4004, msg: `已关注` })
        } else {
          // 未关注
          var sql = `insert into trip_focus(fid, uid, from_uid, create_time, update_time) values (null, ?, ?, now(), now())`
          pool.query(sql, [uid, user.uid], (err, result) => {
            if (err) throw err
            if (result.affectedRows > 0) { 
              res.send({ code: 200, msg: `关注成功` })
            } else {
              res.send({ code: 4005, msg: `关注失败` })
            }
          })
        }
      })
    }
  })
})

// 11 . 粉丝列表
router.get('/api/v1/fanslist/:uid', (req, res) => {
  // 获取用户uid
  var uid = req.params.uid
  // 创建一个变量保存所有粉丝的信息
  var fanslist = []
  // 执行sql 查询粉丝的uid
  var sql = `select from_uid from trip_focus where uid=?`
  pool.query(sql, [uid], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      // 所有粉丝的uid
      var fansUid = result
      var tasks = []
      for (var item of fansUid) {
        var p = Promise.all([
          getBaseInfo(item.from_uid),
          getFunsNum(item.from_uid),
          checkIsFollowed(item.from_uid, uid)
        ]
        ).then(result => {
          fanslist.push(Object.assign({}, ...result))
        })
        tasks.push(p)
      }
      Promise.all(tasks).then(result => {
        res.send({ code: 200, data: fanslist })
      }).catch(err => {
        throw err
      })
    } else {
      res.send({ code: 4001, msg: '该用户尚未被关注', data: null })
    }
  })
})

// 12. 关注列表
router.get('/api/v1/focuslist', (req, res) => {
  // 获取用户id
  var uid = req.body.uid
  // 创建一个变量保存该用户关注的所有用户信息
  var focusList = []
  // 执行sql
  // 查询所有关注用户的uid
  var sql = `select uid from trip_focus where from_uid=? `
  pool.query(sql, [uid], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      // 保存所有关注人的uid
      var focusUid = result
      // 创建一个变量保存所有任务
      var tasks = []
      for (var item of focusUid) {
        var p = Promise.all([getBaseInfo(item.uid), getFunsNum(item.uid), checkIsFollowed(item.uid, uid)]).then(result => {
          focusList.push(Object.assign({}, ...result))
        }).catch(err => {
          throw err
        })
        tasks.push(p)
      }
      // 查询每个用户的uid 头像 粉丝数 且判断是否互粉
      Promise.all(tasks).then(result => {
        res.send({ code: 200, data: focusList })
      }).catch(err => { throw err })
    } else {
      res.send({ code: 200, msg: `该用户尚未关注人`, data: null })
    }
  })
})

// 13. 更换头像
router.put('/api/v1/changeavatar', (req, res) => {
  // 获取用户信息
  var uid = req.user.uid
  // 获取数据
  var { dataUrl, fileID } = req.body.data
  // 检验数据
  if (!dataUrl) {
    return res.send({ code: 4001, msg: `base图片为空` })
  }
  if (!fileID) {
    return res.send({ code: 4002, msg: `图片ID为空` })
  }
  // 拼接图片的本地绝对路径
  var localFileID = __dirname + '/../public/avatar/' + fileID
  // 执行上传功能

  // 调用上传图片函数
  uploadImg(dataUrl, localFileID).then(() => {
    // 更新用户的头像信息
    // 拼接图片的网络地址
    var imgUrl = 'http://localhost:3000/avatar/' + fileID
    console.log(imgUrl)
    var sql = `update trip_user set avatar=?, update_time=now() where uid=?`
    pool.query(sql, [imgUrl, uid], (err, result) => {
      if (err) throw err
      if (result.affectedRows > 0) {
        res.send({ code: 200, msg: `更新成功` })
      } else {
        res.send({ code: 4003, msg: `更新失败` })
      }
    })
  }).catch(err => { throw err })
})
// 14. 取消关注
router.put('/api/v1/canclefocus', (req, res) => {
  // 获取被关注用户id
  var uid = req.body.uid
  // 获取取消关注的用户id
  var from_uid = req.user.uid
  if (!from_uid) {
    return res.send({ code: 4001, msg: `被取消关注用户id为空` })
  }
  // 执行sql
  var sql = `update trip_focus set is_delete=1, update_time=now() where uid=? and from_uid=?`
  pool.query(sql, [uid, from_uid], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: `取消关注成功` })
    } else {
      res.send({ code: 4002, msg: `取消关注失败` })
    }
  })
})
// 15. 用户详情
router.get('/api/v1/userinfo', (req, res) => {
  // 获取uid
  var uid = req.query.uid
  if (isNaN(uid)) {
    return res.send({ code: 4001, msg: `用户id出错` })
  }
   // 查询用户相关信息
   var userInfo = {}
   Promise.all([getBaseInfo(uid), getFunsNum(uid), getFocusNum(uid)]).then(result => {
     Object.assign(userInfo, ...result)
     console.log(userInfo)
     res.send({ code: 200, data: userInfo })
   })
} )

// 16. 查看是否已关注
router.get('/api/v1/isfollowed', (req, res) => {
// 获取数据
var uid = req.query.uid
var from_uid = req.user.uid
if (!uid) {
  return res.send({ code: 4001, msg: `被检查用户id为空` })
}
// 执行sql
var sql = `select fid from trip_focus where uid=? and from_uid=? and is_delete=0`
pool.query(sql, [uid, from_uid], (err, result) => {
  if (err) throw err
  if (result.length > 0) {
    res.send({ code: 200, msg: `已关注`, data: { isfollowed: true }})
  } else {
    res.send({ code: 4002, msg: '未关注', data: { isfollowed: false }})
  }
})
})
module.exports = router