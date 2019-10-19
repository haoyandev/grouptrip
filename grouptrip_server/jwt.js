const jwt = require('jsonwebtoken')
const fs = require('fs')
const path = require('path')
// 生成token函数
function generateToken (data) {
  // 获取secret密钥
  var secret = fs.readFileSync(path.join(__dirname, './pem'))
  // 获取当前时间 并 转为秒
  let create_time = Date.now() / 1000
  // 生成token
  let token = jwt.sign({ data }, secret, { expiresIn: '30 days' })
  return token
}

// 验证token函数
function verifyToken (token) {
  // 获取secret密钥
  var secret = fs.readFileSync(path.join(__dirname, './pem'))
  // 验证
  // 创建res变量保存结果
  var res
  try {
    // 验证成功 返回token
    res = jwt.verify(token, secret)
  } catch (err) {
    // 验证失败 返回错误信息
    res = err
  }
  return res
}
module.exports = { generateToken, verifyToken }