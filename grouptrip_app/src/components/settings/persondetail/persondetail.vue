<template>
  <div>
    <header1 toRoute="/Settings" hTitle="编辑个人信息"></header1>
    <div class="detail-box">
      <mt-cell class="mt-cell" title="账号绑定与设置" is-link>
        <span><img src="@/assets/iconfont/boy.png" width="24" height="24"></span>
      </mt-cell>
      <mt-cell title="用户昵称" is-link>
        <span style="font-size:12px">{{user.uname}}</span>
      </mt-cell>
      <mt-cell title="性别" is-link>
        <span style="font-size:12px">{{user.gender|sex}}</span>
      </mt-cell>

      <mt-cell id="d4" @click.native="selectBirth" title="出生日期" is-link :value="user.birthday||'设置'"></mt-cell>
        <!-- 日期选择器 -->
      <van-popup v-model="showBirth" position="bottom">
        <van-datetime-picker
        v-model="currentDate"
        type="date"
        :min-date="minDate"
        :max-date="maxDate"
        @confirm="handleConfirmBirth"
        @cancel="handleCancelBirth"
        title="请选择生日日期"
        />
      </van-popup>
      <mt-cell id="d4" title="隐藏年龄" to="Settings" is-link value="所有人可见"></mt-cell>
      <mt-cell title="常居城市" is-link :value="user.city||'设置'" @click.native="selectCity">
      </mt-cell>
      <!-- 城市选择器 -->
      <van-popup
      v-model="showCity"
      position="top"
      :style="{ height: '100%' }"
      >
      <van-index-bar :index-list="indexList" @click.native="handleSelectCity">
      <van-index-anchor index="A">标题1</van-index-anchor>
      <van-cell title="hhh"/>
      <van-cell title="文本" />
      <van-cell title="文本" />

      <van-index-anchor index="B">标题2</van-index-anchor>
      <van-cell title="文本" />
      <van-cell title="文本" />
      <van-cell title="文本" />
      <van-index-anchor index="C">标题3</van-index-anchor>
      <van-cell title="文本" />
      <van-cell title="文本" />
      <van-cell title="文本" />
    </van-index-bar>
      </van-popup>
      <mt-cell title="个人简介" is-link value="设置">
      </mt-cell>
      <mt-button size="large" @click.native="logout">退出当前账号</mt-button>
    </div>
  </div>
</template>

<script>
import header1 from "./../header/header.vue"
import test from "./../test"
export default {
  inject: ['reload'],
  data () {
    return {
      user: this.$store.state.user,
      showBirth: false,
      showCity: false,
      indexList: ['A', 'B', 'C', 'D', 'E', 'F', 'G',
       'H', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'W', 'X', 'Y', 'Z'],
      minDate: new Date('1900-1-1'),
      maxDate: new Date(),
      currentDate: new Date(),
    }
  },
  methods: {
    handleReload() {
      this.reload(); // 在想要刷新页面的时候调用reload方法
    },
    logout () {
      console.log(11)
      // 询问用户是否真的退出
      this.$messagebox.confirm('确定登出账号?').then(res => {
        // 退出
        var url =  `api/v1/user/logout`
        this.axios.get(url).then(res => {
          if (res.data.code === 200) {
            // 清除token
            localStorage.removeItem('token')
            localStorage.removeItem('user')
            setTimeout(() => {
              this.$router.push('/Login')
            }, 1000)
          }
        })
      }).catch(err => {})
    },
    selectBirth () {
      this.showBirth = true
    },
    selectCity () {
      this.showCity = true
    },
    handleConfirmBirth (val) {
      console.log(val)
      // 处理时间
      val = new Date(val)
      var year = val.getFullYear()
      var month = val.getMonth() + 1
      var date = val.getDate()
      var birthday = `${year}-${month}-${date}`
      console.log(birthday)
      // 发送ajax 修改生日
      var url = `api/v1/user/updatebirth`
      var data = { birthday }
      this.axios.put(url, data).then(res => {
        if (res.data.code === 200) {
          // 修改成功 更新用户信息
          this.$store.commit('updateBirth', birthday)
          this.reload()
        }
      }).catch(err => console.log(err))
      this.show = false
    },
    handleCancelBirth () {
      this.show = false
    },
    handleSelectCity (e) {
      console.log(e.target.className.indexOf('van-cell'))
      console.log(e.target.value)
    }
  },
  components:{
    "header1":header1,
    test:test
  },
  filters: {
    sex (val) {
      return val === 0? '女': val === 1? '男': '保密'
    }
  }
}
</script>

<style>
  .mint-cell-value{
    font-size: 12px;
  }
  .detail-box {
    margin-top: 50px;
  }
  .detail-box .mint-button {
    background-color: #eee;
    position: absolute;
    bottom: 0;
  }
  /* 时间选择器 */
  .van-popup--center {
    width: 100%;
  }
</style>

