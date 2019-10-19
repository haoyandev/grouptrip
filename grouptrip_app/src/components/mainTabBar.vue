<template>
  <tab-bar>
    <tab-bar-item path="/Home" activeColor="#8ac6d1">
      <img slot="item-icon" src="../assets/iconfont/home.png" alt="">
      <img slot="item-icon-active" src="../assets/iconfont/home-active.png" alt="">
      <div slot="item-text">首页</div>
    </tab-bar-item>
    <tab-bar-item path="/Strategy" activeColor="#111111">
      <img slot="item-icon" src="../assets/iconfont/location.png" alt="">
      <img slot="item-icon-active" src="../assets/iconfont/location-active.png" alt="">
      <div slot="item-text">日本</div>
    </tab-bar-item>
    <tab-bar-item path="/Note" activeColor="#111111">
      <img slot="item-icon" src="../assets/iconfont/note.png" alt="">
      <img slot="item-icon-active" src="../assets/iconfont/note-active.png" alt="">
      <div slot="item-text">游记</div>
    </tab-bar-item>
    <tab-bar-item path="/Personal" activeColor="#111111">
      <img slot="item-icon" src="../assets/iconfont/personal.png">
      <img slot="item-icon-active" src="../assets/iconfont/personal-active.png" alt="">
      <div slot="item-text">我的</div>
    </tab-bar-item>
  </tab-bar>
</template>
<script>
import TabBar from './bar/tabBar1.vue'
import TabBarItem from './bar/tabBarItem.vue'

export default {
  name:"MainTabBar",
  components:{
    TabBar,
    TabBarItem
  }
}
</script>
<style scoped>

</style>