<template>
  <div class="c1">
    <mt-header id="header" :title="hTitle">
      <!-- settings需要改成个人页面路由 -->
      <router-link :to="toRoute" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
  </div>
</template>
<script>
export default {
  //声明接收父元素数据
  props:{
    hTitle:{default:""}, //接收标题
    toRoute:{default:"/"}

  }
}
</script>

<style scoped>
  h4{
    padding: 0 10px;
  }
  .title1{
    margin-top: 40px;
  }
  .title2{
    margin-top: 20px;
    /* border-top: 1px solid #ccc; */
    padding-top: 15px;
  }
   #header >>> .mint-header-title{
    font-weight: bold;
    /* border-bottom: none; */
  }
</style>

