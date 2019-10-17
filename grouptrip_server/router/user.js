const express = require('express')
const pool = require('../pool')

// 引入jwt
const { generateToken } = require('../jwt')
// 创建路由器
var router = express.Router()

// 添加路由
// 1. 用户注册
router.post('/register', (req, res) => {
  // 获取数据
  var obj = req.body
  // 检验数据
  var { phone, upwd } = obj
  if (!phone) {
    return res.send({ code: 401, msg: `手机为空` })
  } 
  if (!upwd) {
    return res.send({ code: 402, msg: `密码为空` })
  }
  // 判断手机格式
  var phoneReg = /^1[3456789]\d{9}$/
  if (!phoneReg.test(phone)) {
    return res.send({ code: 403, msg: `手机格式不正确` })
  }
  // 判断密码格式
  var pwdReg = /^[0-9a-z]{6,12}$/i
  if (!pwdReg.test(upwd)) {
    return res.send({ code: 404, msg: `密码格式不正确`} )
  }
  //  查询该手机号是否已注册
  var sql = `select uid from trip_user where phone=?`
  pool.query(sql, [phone], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      // 该手机号已存在
      // 返回响应
      res.send({ code: 405, msg: `该手机号已存在` })
    } else {
      // 该手机号不存在 可以注册
      // 随机给用户分配一个昵称
      var str = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqpstuvwxyz'
      var uname = 'user_'
      for (var i = 0; i < 10; i++) {
        uname += str[Math.floor(Math.random() * 62)]
      }
      var sql = `insert into trip_user(phone,upwd,uname,create_time) values(?,md5(?),?,now())`
      pool.query(sql, [phone, upwd, uname], (err, result) => {
        if (err) throw err
        if (result.affectedRows > 0) {
          // 注册成功
          res.send({ code: 200, msg: `注册成功` })
        } else {
          // 注册失败
          res.send({ code: 406, msg: `注册失败` })
        }
      })
    }
  })
})

// 2. 登陆
router.post('/login', (req, res) => {
  // 获取用户信息
  var obj = req.body
  var phone = obj.phone
  var upwd = obj.upwd
  // 检验数据
  if (!phone) {
    return res.send({ code: 401, msg: `请填写用户名` })
  }
  if (!upwd) {
    return res.send({ code: 402, msg: `请填写密码` })
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
      res.send({ code: 403, msg: `登陆失败` })
    }
  })
})

// 3. 注销
router.get('/logout', (req, res) => {
  res.send({ code: 1, msg: `注销成功` })
})
 
// 4. 个人信息
router.get('/detail', (req, res) => {
  // 获取用户信息
  var user = req.user
  console.log(user)
  // 查询用户相关信息
  var sql = `select avatar, uname, gender, birthday, age, intr from trip_user where uid=?`
  pool.query(sql, [user.uid], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      console.log(result)
      res.send({ code: 200, msg: `查询成功`, data: result[0] })
    } else {
      res.send({ code: 401, msg: `查询失败` })
    }
  })
})

// 5. 更新昵称
router.put('/updatename', (req, res) => {
  // 获取数据
  var uname = req.body.uname
  // 检验名字是否为空
  if (!uname) {
    return res.send({ code: 401, msg: `用户名为空` })
  }
  // 检验名字格式
  var uReg = /^\w{1,16}&/
  if (uReg.test(uname)) {
    return res.send({ code: 402, msg: `名字格式不规范` })
  }
  // 获取用户信息
  var user = req.user
  // 获取用户的更新时间
  var sql = `select update_time from trip_user where uid=?`
  pool.query(sql, [user.uid], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      // 设置一个变量 控制是否可以进行修改
      var canUpdate = false
      var update_time = result[0].update_time
      if (!update_time) {
        // 更新时间为null 表示用户名为初始值可以修改
        canUpdate = true
      } else {
        // 用户已修改初始名字 判断是否可修改
        // 可以修改的时间为一个月一次
        var time = 60 * 60 * 24 * 30
        // 获取当前时间 转为秒
        var now = new Date().getTime()
        now = Math.floor(now / 1000)
        // 将上次更新的时间转为时间戳 并转为秒
        update_time = new Date(update_time).getTime()
        update_time = Math.floor(update_time / 1000)
    
        if (now - update_time > time) {
          canUpdate = true
        } else {
          canUpdate = false
        }
      }
      // 根据canUpdate判断是否可以修改
      if (canUpdate) {
        // 可以修改
        // 检测该名字是否已存在
        var sql = `select uid from trip_user where uname=?`
        pool.query(sql, [uname], (err, result) => {
          if (err) throw err
          if (result.length > 0) {
            // 该用户名已存在
            res.send({ code: 403, msg: `该用户名已存在` })
          } else {
            // 该用户名不存在 可以修改
            // 执行sql
            // 返回应答
            var sql = `update trip_user set uname=?,update_time=now() where uid=?`
            pool.query(sql, [user.uname, user.uid], (err, result) => {
              if (err) throw err
              if (result.affectedRows > 0) {
                res.send({ code: 1, msg: `修改成功` })
              } else {
                res.send({ code: -1, msg: `修改失败` })
              }
            })
          } 
        }) 
      } else {
        // 不可以修改
        res.send({ code: 404, msg: `一个月内只可修改一次`})
      }
    }
  })
})


module.exports = router