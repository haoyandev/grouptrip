<template>
  <div>
    <!-- 修改跳转或返回至个人页面 -->
    <header1 toRoute="/Settings" hTitle="设置"></header1>
    <!-- 个人设置 -->
    <h4 style="padding:10px" class="title1">个人设置</h4>
    <div class="mt-cell1">
    
    <mt-cell to="usermanage" class="mt-cell" title="账号绑定与设置" is-link>
      <span style="color: green">
        <img slot="icon" src="../../assets/iconfont/girl.png" width="24" height="24">
      </span>
    </mt-cell>

    <mt-cell to="/Detail" title="编辑个人资料" is-link>  
    </mt-cell>
    <mt-cell to="/push" title="推送设置" is-link>
    </mt-cell>
    <mt-cell title="隐私设置" is-link>
    </mt-cell>
    <mt-cell title="视频自动播放" is-link> 
    </mt-cell>

      <!-- 应用相关 -->
      <h4 style="padding:10px" class="title2">应用相关</h4>
      <mt-cell title="常用问题及意见反馈" is-link>  
      </mt-cell>
      <mt-cell title="评价穷游" is-link>  
      </mt-cell>
      <mt-cell title="分享穷游" is-link>  
      </mt-cell>
      <mt-cell title="会员中心" is-link>  
      </mt-cell>
      <mt-cell style="#ccc" title="清除缓存" value="11.21MB"></mt-cell>
    </div>
  </div>
  
</template>
<script>
  //1.引入子组件Sub09
import header1 from "./header/index"
export default {
   components:{
     "header1":header1
   }
}
</script>

<style scoped>

 
  /* h4{
    padding: 0 10px;
  }
  .title1{
    margin-top: 40px;
  }
  .title2{
    margin-top: 20px; */
    /* border-top: 1px solid #ccc; */
    /* padding-top: 15px; */
  /* }
   #header >>> .mint-header-title{
    font-weight: bold; */
    /* border-bottom: none; */
  /* } */
  .c1 .mint-header{
   background-color: #fff;
   color: black;
   font-size: 20px;
   top: 20px;
   
   /* border-bottom: 2px solid #ccc; */
  }
  
  .mint-cell{
    min-height: 35px;
  }
  

</style>

