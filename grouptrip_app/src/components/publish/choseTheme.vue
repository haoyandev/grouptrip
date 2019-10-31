<template>
  <div class="theme-box">
    <div class="title">
      <router-link to="" >
        <svg class="iconclose-white" aria-hidden="true" @click="closeGroup">
          <use xlink:href="#iconclose-white-copy" />
        </svg>
      </router-link>
      <span>选择group游主题</span>
    </div>
    <ul class="main-box">
      <li class="theme-item" v-for="(item) of themeList" :key="item.tid">
        <div class="left">
          <h1 class="icon">
            <img :src="item.timg" alt />
          </h1>
          <p class="theme-name">{{item.tname}}</p>
        </div>
        <div class="right" v-show="activeTid==item.tid">
          <img src="@/assets/iconfont/tag.png" alt />
        </div>
        <div
          @click="radio"
          class="touch"
          :data-i="item.tid"
          :data-tname="item.tname"
          :data-timg="item.timg"
        ></div>
      </li>
    </ul>
    <p class="step" @click.prevent="next" :class="{ selected: activeTid !== null }">下一步 (1/3)</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeTid: null,
      tname: "",
      timg: "",
      themeList: []
    };
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
    next(e) {
      if (!this.activeTid && !this.tname) {
        return;
      }
      var obj = { tid: this.activeTid, tname: this.tname, timg: this.timg 
      };
      console.log(obj);
      this.$store.commit("setGroupInfo", obj);
      console.log(this.$store.state.groupInfo);
      this.$router.push("/uploadimg");
    },
    radio(e) {
      var i = e.target.dataset.i;
      var tname = e.target.dataset.tname;
      var timg = e.target.dataset.timg;
      this.activeTid = i;
      this.tname = tname;
      this.timg = timg;
      // console.log(this.activeTid)
    }
  },
  created() {
    // 发送请求获取所有主题信息
    var url = 'group/api/v1/themelist'
    this.axios.get(url).then(res => {
      if (res.data.code === 200) {
        console.log(res.data.data);
        this.themeList = res.data.data;
      }
    });
  }
};
</script>

<style>
.theme-box {
  background-color: #1f1f1f;
  margin-bottom: 30px;
  position: fixed;
  width: 100%;
  height: 100%;
}
/* 标题 底部进度提醒 */
.theme-box .title,
.theme-box .step {
  position: fixed;
  width: 100%;
  height: 60px;
  background-color: #000;
  margin: 0;
  color: #fff;
  text-align: center;
  display: flex;
  align-items: center;
}
.theme-box .title {
  top: 0;
  line-height: 70px;
  z-index: 1;
}
.theme-box .title .iconclose-white,.intr-box .title .iconclose-white,.group-box .main-box .iconclose-white{
  margin-left: 10px;
  margin-top: 25px;
}
.theme-box .title span, .intr-box .title span{
  position: relative;
  left: 25%;
}
.theme-box .step {
  position: fixed;
  bottom: 0;
  height: 50px;
  font-weight: 500;
  color: #909090;
  justify-content: center;
}

/* 主题 */
.theme-box .main-box {
  margin-top: 60px;
  background-color: #1f1f1f;
}
.theme-box .theme-item {
  height: 80px;
  line-height: 80px;
  background-color: #1f1f1f;
  border-bottom: 1px solid #2a2a2a;
  color: #fff;
  font-size: 18px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;
}
.theme-box .left {
  display: flex;
  margin-left: 5px;
  align-items: center;
}
.theme-box .icon {
  width: 50px;
  height: 50px;
  margin: 0;
  margin-right: 16px;
  line-height: 50px;
}
.theme-box .icon img {
  width: 50px;
  height: 50px;
}
.theme-item .theme-name {
  margin: 0px;
}
.theme-item .right {
  width: 50px;
  height: 50px;
  line-height: 80px;
}
.theme-item .touch {
  width: 100%;
  height: 100%;
  position: absolute;
}

.theme-box .step.selected {
  color: #8134af;
}
</style>