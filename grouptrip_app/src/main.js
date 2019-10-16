import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
// 引入初始化样式文件
import 'normalize.css'
Vue.config.productionTip = false

// 引入mint-ui
import MintUI from 'mint-ui'
// 单引入mint-ui库中样式文件
import 'mint-ui/lib/style.css'
// 将mint-ui注册vue实例
Vue.use(MintUI)

// 引入axios
import axios from 'axios'
// 添加两个参数 请求服务器基础路径
axios.defaults.baseURL = 'http://localhost:3000/'
// 发送请求保存session信息
axios.defaults.withCredentials = true
// 注册axios
Vue.prototype.axios = axios

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
