<template>
  <div>
      <header1 toRoute="/settings" hTitle="编辑个人信息"></header1>
      <mt-cell class="mt-cell" title="账号绑定与设置" is-link>
        <span><img slot="icon" src="../../../assets/logo.png" width="24" height="24"></span>
      </mt-cell>
      <mt-cell title="用户昵称" is-link>
        <span style="font-size:12px">架构师</span>
      </mt-cell>
      <mt-cell title="性别" is-link>
        <span style="font-size:12px">保密</span>
      </mt-cell>

      <!-- 添加出生日期 -->
      
      <!-- <mt-cell title="" is-link ></mt-cell> -->
      <test></test>
      <mt-cell id="d4" title="隐藏年龄" to="Settings" is-link value="所有人可见"></mt-cell>
      <mt-cell title="常居城市" is-link>
      </mt-cell>
      <mt-cell title="个人简介" is-link>
      </mt-cell>

      
  </div>
</template>
<script>
import header1 from "./../header/header"
import test from "./../test"
export default {
  components:{
    "header1":header1,
    test:test
  }
}
</script>

<style>
  .mint-cell-value{
    font-size: 12px;
  }
</style>


