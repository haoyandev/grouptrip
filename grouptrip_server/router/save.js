// while (i < 3) {
//   console.log(i)
//   var str = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqpstuvwxyz'
//   var uname = 'user_'
//   for (var i = 0; i < 10; i++) {
//     uname += str[Math.floor(Math.random() * 62)]
//   }
//   console.log(uname)
//   // 判断该昵称是否可用
//   var sql = `select uid from trip_user where uname=?`
//   pool.query(sql, ['user_TdGpyIt0Tk'], (err, result) => {
//     if (err) throw err
//     console.log(result)
//     if (result.length === 0) {
//       // 该用户名不存在 可注册
//       console.log('该用户名不存在 可注册')
//       var sql = `insert into trip_user(phone,upwd,uname,create_time) values(?,md5(?),?,now())`
//       pool.query(sql, [phone, upwd, uname], (err, result) => {
//         if (err) throw err
//         if (result.affectedRows > 0) {
//           // 注册成功
//           res.send({ code: 200, msg: `注册成功` })
//         } else {
//           // 注册失败
//           res.send({ code: 406, msg: `注册失败` })
//         }
//       })
//     } 
//     console.log(11)
//   })
//   console.log(i)
// }

      // 该手机号不存在 可以注册
      // 执行sql 插入新数据
      // 随机给用户分配一个昵称
      // 循环分配昵称 直到昵称可用

       // 执行sql
  // 查询该手机号是否已注册
  // var sql = `select uid from trip_user where phone=?`
  // pool.query(sql, [phone], (err, result) => {
  //   if (err) throw err
  //   if (result.length > 0) {
  //     // 该手机号已存在
  //     // 返回响应
  //     res.send({ code: 405, msg: `该手机号已存在` })
  //   } else {

  //   }
  // })