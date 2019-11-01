// 引入exprss body-parser express-session cors
const express = require('express')
const bodyParser = require('body-parser')
const session = require('express-session')
const cors = require('cors')
const { verifyToken } = require('./jwt')
// 引入路由器
const userRouter = require('./router/user')
const groupRouter = require('./router/group')
// 创建服务器
var app = express()

// 跨域
app.use(cors({
  // 允许程序列表
  origin: [
    'http://127.0.0.1:8080',
    'http://localhost:8080'
  ],
  // 每次请求需要验证
  credentials: true
}))
// 配置session
app.use(session({
  secret: '128位字符串',
  resave: true,
  saveUninitialized: true
}))

// 绑定静态服务
app.use(express.static('./public'))
// 使用body-parser
app.use(bodyParser.urlencoded({ limit: '50mb', extended: false } ))
app.use(bodyParser.json())

// 添加token验证中间件
app.use((req, res, next) => {
  // 设置需要验证的接口
  var url = req.url
  // 用户接口除了登陆注册都要验证
  // 发表group除了主题游记都要验证
  if (url !== '/user/api/v1/register' && 
    url !== '/user/api/v1/login' && 
    !url.startsWith('/user/api/v1/userinfo') &&
    url.startsWith('/user') ||
    url === '/group/api/v1/publish'
    ) {
    // 获取用户传来的token值
    var token = req.headers.token
    if (!token) {
      res.status(403)
      res.send({ code: 403, msg: `未提供证书` })
    } else {
        var result = verifyToken(token)
        // 判断result结果
        if (result.name === 'TokenExpiredError') {
          res.writeHead(403)
          res.send({ code: 403, msg: `登陆超时,请重新登陆` })
        } else if (result.name === 'JsonWebTokenError') {
          res.writeHead(403)
          res.send({ code: 403, msg: `证书出错` })
        } else {
          req.user = result.data
          // 验证成功
          next()
        }
    }
  } else {
    // 其他接口不需要验证
    next()
  }
})

// 添加路由器
app.use('/user', userRouter)
app.use('/group', groupRouter)
app.listen(3000, () => {
  console.log(`server start`)
})