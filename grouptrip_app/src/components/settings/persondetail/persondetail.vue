<template>
  <div>
    <header1 toRoute="/Settings" hTitle="编辑个人信息"></header1>
    <div class="detail-box">
      <mt-cell class="mt-cell" title="头像" is-link @click.native="toChangeAvatar">
        <span class="avatar"><img :src="user.avatar"></span>
      </mt-cell>
      <mt-cell title="用户昵称" is-link @click.native='changeName'>
        <span style="font-size:12px">{{user.uname}}</span>
      </mt-cell>
      <van-popup v-model="showName">
        <div class="update-name">
          <div class="name-bar">
            <span @click="cancleUpdName"><img src="@/assets/iconfont/arrow.png" alt="" class="arrow"></span>
            <span>编写用户昵称</span>
            <span><img src="@/assets/iconfont/right.png" alt="" class="right" @click="updName"></span>
          </div>
          <input type="text" v-model="uname" :placeholder="user.uname" id="uname" class="ipt-name" @click="input">
          <div class="tip">每月可修改一次用户名，请慎重修改</div>
          <div class="err-msg">{{errMsg}}</div>
        </div>
      </van-popup>
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
      minDate: new Date('1900-1-1'),
      maxDate: new Date(),
      currentDate: new Date(),
      showName: false,
      uname: '',
      errMsg: '',
      showerr: true
    }
  },
  methods: {
    input () {
      this.errMsg = ''
      this.showerr = false
    },
    updName () {
      var url =  `user/api/v1/updatename`
      var data = {
        uname: this.uname
      }
      // console.log(1)
      this.axios.put(url, data).then(res => {
        if (res.data.code === 200) {
          this.axios.get('/user/api/v1/detail')
          .then(res => {
            if (res.data.code === 200) {
              this.user = res.data.data
              this.showName = false
              this.$store.commit('setUser', res.data.data)
            } else {
              this.errMsg = res.data.msg
            }
          })
        } else {
          this.errMsg = res.data.msg
          this.showerr = true
        }
      }).catch(err => {
        throw err
      })
    },
    cancleUpdName () {
      this.showName = false
    },
    changeName () {
      this.showName = true
      setTimeout(() => {
        document.getElementById('uname').focus()
      }, 100)
    },
    getUserInfo () {
      var url = `user/api/v1/detail`
      this.axios.get(url).then(res => {
        this.user = res.data.data
      })
    },
    handleReload() {
      this.reload(); // 在想要刷新页面的时候调用reload方法
    },
    logout () {
      // 询问用户是否真的退出
      this.$messagebox.confirm('确定登出账号?').then(res => {
        // 退出
        var url = `/user/api/v1/logout`
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
      var url = `user/api/v1/updatebirth`
      var data = { birthday }
      this.axios.put(url, data).then(res => {
        console.log(res)
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
    },
    toChangeAvatar () {
      this.$router.push('/Changeavatar')
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
  .detail-box .mint-cell-wrapper:first-child {
    height: 65px;
    line-height: 65px;
  }
  .detail-box .avatar {
    width: 50px;
    height: 50px;
    text-align: center;
  }
  .detail-box .avatar img {
    vertical-align: top;
    width:  100%;
    height: 100%;
  }
  /* 时间选择器 */
  .van-popup--center {
    width: 100%;
  }
  .detail-box .van-popup {
    display: fixed;
    width: 100%;
    height: 100%;
  }
  .detail-box .van-overlay {
    background-color: #fff;
  }
  .detail-box .update-name {

  }
  .detail-box .van-cell {
    border: 1px solid #eee;
    margin: 10px;
  }
  .detail-box .ipt-name {
    width: 100%;
    height: 45px;
    line-height: 45px;
    border: 1px solid #eee;
    padding: 0 20px;
    margin-bottom: 20px;
  }
  .update-name .name-bar {
    display: flex;
    height: 60px;
    justify-content: space-between;
    align-items: center;
  }
  .name-bar .right, .name-bar .arrow {
    width: 30px;
  }
  .update-name .tip {
    margin-left: 20px;
  }
  .update-name .err-msg {
    color: red;
    margin-left: 20px;
    margin-top: 10px;
    font-size: 14px;
  }
</style>

