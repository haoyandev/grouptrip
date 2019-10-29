<template>
  <div class="avatar-box">
    <div class="top-bar" v-if="upload">
      <span class="to-back" @click="toBack">
        <img :src="require('@/assets/iconfont/left-arrow.png')" alt="">
      </span>
      <div class="change-avatar">
        <input type="file" accept="image/*" class="van-uploader__input" @change="uploadAvatar">更换头像
      </div>
    </div>
    <div class="top-bar" v-else>
      <span class="close" @click="cancle">
        <img :src="require('@/assets/iconfont/close-white.png')" alt="">
      </span>
      <span @click="makeSure">确定</span>
    </div>
    <div class="avatar">
      <img :src="user.avatar||''" alt="" id="avatar">
    </div>
  </div>
  
</template>

<script>
export default {
  inject: ['reload'],
  data () {
    return {
      user: this.$store.state.user,
      upload: true,
      fileID: '',
      dataUrl: ''
    }
  },
  mounted () {
    this.avatarEl = document.getElementById('avatar')
  },
  methods: {
    uploadAvatar (e) {
      console.log(this.avatarEl)
      // 获取文件对象
      var file = e.target.files[0]
      // 获取图片的后缀
      var reg = /\.\w+/
      var su = /\.\w+/.exec(file.name)[0]
      // 将图片转为base64
      var reader = new FileReader()
      reader.readAsDataURL(file)
      reader.onload = () => {
        // base64
        var dataUrl = reader.result
        this.dataUrl = dataUrl
        // 生成随机唯一fileID
        var fileID = Date.now() + Math.floor(Math.random()) * 999 + su
        this.fileID = fileID
        // 预览
        this.avatarEl.setAttribute('src', dataUrl)
        this.upload = false
      }
    },
    toBack () {
      this.$router.go(-1)
    },
    cancle () {
      // 取消更换头像
      this.upload = true
      // 显示用户原本的头像
      this.avatarEl.setAttribute('src', this.user.avatar)
    },
    makeSure () {
      console.log('make')
      // 确认更换头像
      // 整理数据
      var data = {
        fileID: this.fileID,
        dataUrl: this.dataUrl
      }
      console.log(data)
      // 发送axios
      var url = 'api/v1/user/changeavatar'
      this.axios.put(url, { data })
      .then(res => {
        // 更新成功
        console.log(res)
        if (res.data.code === 200) {
          this.$router.push('/Detail')
          this.reload()
        }
      })
      .catch(err => {
        // 更新失败
        console.log(err)
      })

    }
  },
}
</script>

<style>
  .avatar-box {
    position: fixed;
    height: 100%;
    width: 100%;
    background-color: #000;
    display: flex;
    flex-direction: column;
    /* justify-content: f; */
  }
  .avatar-box .top-bar {
    margin-top: 20px;
    padding: 0 16px;
    height: 30px;
    line-height: 30px;
    color: #fff;
    display: flex;
    justify-content: space-between;
    
  }
  .avatar-box .top-bar .change-avatar {
    position: relative;
  }
  .avatar-box .top-bar .close img {
    width: 20px;
    vertical-align: middle;
  }
  .avatar-box .top-bar .to-back img {
    width: 30px;
  }
  .avatar-box .avatar {
    margin-top: 30%;
    height: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #fff;
  }
  .avatar-box .avatar img {
    width: 100%;
    height: 100%;
    object-fit: contain;
  }
</style>