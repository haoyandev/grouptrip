<template>
  <div >
    <!-- <mt-header title="multiple button">
      <router-link to="/" slot="left">
        <mt-button icon="back">back</mt-button>
        <mt-button @click="handleClose">close</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>  -->
    <div class="c1">
      <mt-header id="header" title="账号管理">
        <router-link to="/settings" slot="left">
          <mt-button icon="back"></mt-button>
        </router-link>
      </mt-header>
    </div>
    <mt-cell title="账号安全"></mt-cell>
    <mt-cell id="d3" title="" label="手机号" is-link><span style="font-size:12px">已绑定</span></mt-cell>
    <mt-cell id="d3" title="" label="邮箱" is-link><span style="font-size:12px">未绑定</span></mt-cell>
    <mt-cell id="d3" title="" label="修改密码" is-link></mt-cell>
    <mt-cell id="d2" title="第三方账号绑定" label="绑定后可直接通过以下账号登录"></mt-cell>
    <mt-cell id="d1" label="手机号" is-link><span style="font-size:12px">未绑定</span></mt-cell>
    <mt-cell id="d1" label="微信" is-link><span style="font-size:12px">未绑定</span></mt-cell>
    <mt-cell id="d1" label="QQ" is-link><span style="font-size:12px">未绑定</span></mt-cell>
    <mt-cell id="d1" label="微博" is-link><span style="font-size:12px">未绑定</span></mt-cell>
  </div>
</template>

<style>
.c1 .mint-header{
   background-color: #fff;
   color: black;
   font-size: 20px;
   top: 20px;
   border-bottom: 2px solid #ccc;
   font-weight: bold;
   margin-bottom: 30px;
}
#header .mint-header-title{
   font-weight: bold;  
}
#d3{
  min-height:35px;
}
#d2{
  min-height: 35px;
   margin-top: 20px;
   margin-bottom: 15px;
} 
#d1{
   min-height: 35px;
} 
</style>
