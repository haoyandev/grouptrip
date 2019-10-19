import Vue from 'vue'
import Router from 'vue-router'
// 导入页面组件
// 首页
import Home from '@/views/Home.vue'
// 个人中心
import Personal from '@/views/Personal.vue'
// 攻略
import Strategy from '@/views/Strategy.vue'
// 游记
import Note from '@/views/Note.vue'

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/', component: Home },
    { path: '/Home', component: Home },
    { path: '/Personal', component: Personal },
    { path: '/Strategy', component: Strategy },
    { path: '/Note', component: Note },
  ]
})