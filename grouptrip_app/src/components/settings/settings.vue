<template>
  <div class="settings">
    <!-- 修改跳转或返回至个人页面 -->
    <header1 toRoute="/Personal" hTitle="设置"></header1>
    <!-- 个人设置 -->
    <h4 style="padding:10px" class="title">个人设置</h4>
    <div class="mt-cell1">
    
    <mt-cell to="usermanage" class="mt-cell" title="账号绑定与设置" is-link>
      <span class="uname">{{user.uname|| ''}}</span>
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
      <mt-cell title="分享穷游" is-link>  
      </mt-cell>
      <mt-cell title="会员中心" is-link>  
      </mt-cell>
      <mt-cell style="#ccc" title="清除缓存" value=" " @click.native="clear"></mt-cell>
    </div>
  </div>
</template>
<script>
  //1.引入子组件Sub09
import header1 from "./header/header"
export default {
  data () {
    return {
      user: this.$store.state.user
    }
  },
  methods: {
    clear () {
      // 询问用户是否真的清除缓存
      this.$messagebox.confirm('消息', '是否真的删除缓存')
      .then(res => { // 删除缓存
        // 清除缓存
        // 先保存token
        var token = localStorage.getItem('token')
        // 再清除缓存
        localStorage.clear()
        // 再保存token
        localStorage.setItem('token', token)
      })
      .catch(err => {})
    }
  },
  components:{
    "header1":header1
  },
  created () {

  }
}
</script>

<style>
.settings h4.title {
  padding: 0;
}
.settings .uname {
  font-size: 18px;
}
.c1 .mint-header{
  background-color: #fff;
  color: black;
  font-size: 20px;
  top: 20px;
}
</style>

