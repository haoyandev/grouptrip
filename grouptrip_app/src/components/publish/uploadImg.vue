<template>
  <div class="intr-box">
    <div class="title">
      <router-link to="">
        <svg @click="closeGroup" class="iconclose-white" aria-hidden="true">
          <use xlink:href="#iconclose-white-copy" />
        </svg>
      </router-link>
      <span>介绍你的Group游</span>
    </div>
    <div class="main">
      <div class="content-box">
        <!-- 主题 -->
        <div class="theme">
          <img :src="this.$store.state.groupInfo.timg" alt="">
          <span>{{this.$store.state.groupInfo.tname}}</span>
        </div>
        <!-- 输入框 -->
        <textarea name="" id="content" v-show="!flag" @input="check" @blur="changeFlag"
         spellcheck="false" maxlength="200" rows="5" v-model="content"
        ></textarea>
        <!-- tip -->
        <div class="tip" v-show="flag" @click="write">点这里讲讲你的group游计划</div>
      </div>  
     <!-- 上传图片 -->
      <div class="upload-box">
        <van-uploader v-model="fileList" multiple :max-count="2"></van-uploader>
      </div>
    </div>
    <p class="step" @click.prevent='next'>下一步 (2/3)</p>
  </div>
</template>

<script>

export default {
  data() {
    return {
      fileList: [],
      show: false,
      imgList: [],
      content: '',
      flag: true
    }
  },
  methods: {
    closeGroup(){
      this.$messagebox.confirm('',{
          title:'确定不发了嘛?',
          confirmButtonText:'继续发布',
          cancelButtonText:'下次再说'
        })
      .then(res=>{
        console.log('继续发布')
      })
      .catch(err=>{
        this.$router.push('/home')
      })
    },
    next () {
      // 获取用户输入的内容
      var content = this.content
      if (content.length < 5) {
        this.$toast('最少五个字哟')
        this.flag = false
        setTimeout(() => {
        document.getElementById('content').focus()
      },100)
      return
      }
      // 此时可以自行将文件上传至服务器
      // 遍历图片对象并添加到一个数组里
      var imgList = []
      for (var item of this.fileList) {
        // console.log(item.content)
        imgList.push(item.content);
      }
      if (imgList.length < 2) {
        this.$toast({ message: `图片不能少于两张哟～`, duration: 1500 })
        return
      }
      // 更新groupInfo
      imgList = JSON.stringify(imgList)
      this.$store.commit('setGroupInfo', { imgList, content })
      this.$router.push('/groupdetail')
    },
    write () {
      this.flag = !this.flag
      console.log(this.flag)
      setTimeout(() => {
        document.getElementById('content').focus()
      },100)
    },
    changeFlag (e) {
      if (!e.target.value) {
        this.flag = true
      }
    },
    check (e) {
      if (e.target.value.length == 200) {
        this.$toast('最多只能输入10个字')
        console.log(e.target.value.length)
        return
      }
    },
    onSelect(item) {
      // 默认情况下，点击选项时不会自动关闭菜单
      // 可以通过 close-on-click-action 属性开启自动关闭
      this.show = false;
      Toast(item.name);
    }
  },
  directives: {
    focus: {
      inserted (e) {
        e.focus()
      }
    }
  }
}
</script>

<style>
/* 标题 进度条 */
.intr-box .title, .intr-box .step {
  position: fixed;
  width: 100%;
  height: 60px;
  background-color: #000;
  margin: 0;
  color: #fff;
  text-align: center;
}
.intr-box .title {
  top: 0;
  line-height: 70px;
  z-index: 1;
  display: flex;

}
.intr-box .step {
  position: fixed;
  bottom: 0;
  height: 50px;
  font-weight: 500;
  line-height: 50px;
  color: #909090;
}
/* 页面主内容 */
.intr-box .main {
  margin-top: 60px;
  background-color: pink;
}
.intr-box .content-box {
  color: #fff;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  text-align: center;
  height: 300px;
  position: relative;
  padding: 0 20px;
}
/* 主题 */
.intr-box .content-box .theme {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.content-box .theme img {
  width: 60px;
}
.content-box .theme span {
  margin-top: -14px;
}
/* 输入框 */
.intr-box .content-box textarea {
  background-color: transparent;
  border: none;
  text-align: center;
}
.intr-box .content-box .tip {
  position: absolute;
  height: 200px;
  line-height: 200px;
  bottom: 0;
  margin: 0 auto;
  left: 0;
  right: 0;
}
/* 上传图片按钮 */
.upload-box .van-uploader__upload {
  /* width: 100%; */
  background-color: #343434;
  border: 1px solid #5d5d5d;
}
.upload-box {
  height: 258px;
  background-color: #1f1f1f;
  display: flex;
  align-items: center;
}
.van-uploader__wrapper {
  margin-left: 10px;
}

</style>