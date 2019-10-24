import Vue from 'vue'
import Router from 'vue-router'
// 导入页面组件
// 首页
import Home from '@/views/Home.vue'
import Grouptrip from './components/index/Grouptrip.vue'
// 个人中心
import Personal from '@/views/Personal.vue'
// 攻略
import Strategy from '@/views/Strategy.vue'
// 游记
import Note from '@/views/Note.vue'
import Login from '@/components/login/login'
// 设置个人信息
import Settings from '@/components/settings'
import Guan from '@/components/common/guanzhu.vue'
Vue.use(Router)

export default new Router({
  routes: [
    {path:'/guan',component:Guan},
    { path: '/', component: Home },
    { path: '/Home', component: Home },
    { path:'/Grouptrip',component:Grouptrip },
    { path: '/Personal', component: Personal },
    { path: '/Strategy', component: Strategy },
    { path: '/Note', component: Note },
    { path: '/login', component: Login },
    { path: '/Settings', component: Settings }
  ]
})
