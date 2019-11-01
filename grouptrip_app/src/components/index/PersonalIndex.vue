<template>
  <main id="personalindex-page">
    <div class="tabbar-top">
      <router-link to="/personal">
      <svg class="zuojiantou_small" aria-hidden="true">
        <use xlink:href="#iconzhixiangzuozuojiantou" />
      </svg>
      </router-link>
    </div>
    <div class="personalindex-wrap">
      <div class="wrap-bg">
      </div>
      <div class="personalindex-msg">
        <div class="msg-wrap">
          <div class="msg-top">
            <div class="msg-top-head">
              <img :src="user.avatar">
            </div>
            <div class="com-box" v-show='isCurrent'>
              <div class="msg-top-follow" @click="isFollow" v-if="follow">
                <svg class="iconsend-small" aria-hidden="true">
                  <use xlink:href="#iconsend" />
                </svg>
                关注
              </div>
              <div class="follow-success" v-else @click="cancelFollow">
                <span>已关注</span>
              </div>
              <div class="msg-top-talk">和他聊聊</div>
            </div>
          </div>
          <div class="msg-middle">
            <h2 class="msg-middle-name">{{user.uname}}</h2>
            <div class="msg-middle-tag">
              <div class="tag-sex" :class="{
                'tag-sex-screct':user.gender==-1,
                'tag-sex-female':user.gender==0,
                'tag-sex-male':user.gender==1,
                }">
                <span v-if="user.gender==-1"></span>
                <span class="msg-sex" v-else-if="user.gender==1">
                  <svg class="icon_male" aria-hidden="true">
                    <use xlink:href="#iconicon28" />
                  </svg>
                </span>
                <span class="msg-sex" v-else>
                  <svg class="icon_female" aria-hidden="true">
                    <use xlink:href="#iconnv" />
                  </svg>
                </span>
                <span v-if="user.gender==-1">保密</span>
                <span v-else-if="user.gender==1">男</span>
                <span v-else>女</span>
              </div>
              <div class="msg-place" v-if="user.city">{{user.city}}</div>
            </div>
          </div>
          <div class="msg-bottom">
            <span class="msg-bottom-count">{{user.likes || 0}}</span>
            <p>获赞</p>
            <span class="msg-bottom-count">{{user.fansNum}}</span>
            <p>粉丝</p>
            <span class="msg-bottom-count">{{user.focusNum}}</span>
            <p>关注</p>
          </div>
        </div>
      </div>
      <div class="divider"></div>
        <div v-if="groups.length === 0">
            尚未发布
        </div>
        <div class="bottom2_wrap " v-else>
          <div class="tips-wrap-item" v-for="(t,i) of groups" :key="i">
            <div class="wrap-item-content">
              <div class="tips-notes-img">
                <img :src=t.bg alt />
              </div>
              <div class="item-details">
                <p>{{t.content}}</p>
              </div>
              <div class="tips-personal">
                <div class="personal-head">
                  <img :src=user.avatar alt />
                </div>
                <span>{{user.uname}}</span>
                <div class="favorite">
                  <like></like>
                  <p>{{t.likes}}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  </main>
</template>
<script>
import like from "../common/like";
export default {
  data(){
    return{
      follow:true,
      active:1,
      user: this.$store.state.user,
      groups: [],
      isCurrent: false,
      quid: null,
    }
  },
  components:{
    like,
  },
  created(){
    this.quid = this.$route.query.uid
    if (this.user.uid == this.quid) {
      // 当前登录用户查看自己的详情
      this.isCurrent = false
    } else {
      this.isCurrent = true
    }
    
    // 发送axios
    var url = `user/api/v1/userinfo`
    this.axios.get(url, { params: { uid: this.quid }}).then(res => {
      if (res.data.code === 200) {
        this.user = res.data.data
      }
    })
    url = `group/api/v1/pgroup`
    this.axios.get(url, { params: { uid: this.quid }}).then(res => {
      if (res.data.code === 200) {
        this.groups = res.data.data
        console.log(this.groups.length)
      }
      console.log(res)
    })
  },
  methods:{
    jumpfh(){
      this.$emit('fh','0')
    },
    isFollow(){
        this.follow=false
    },
    cancelFollow(){
      this.follow=true
      this.$messagebox.confirm("是否取消关注")
      .then(action=>{
        console.log('确认')
      })
      .catch(err=>{
        console.log('取消')
      });
    }
  }
}
</script>
<style>
#personalindex-page{
  width: 100%;
}
.personalindex-wrap{
  width: 100%;
}
.personalindex-wrap .wrap-bg{
  width: 100%;
  height: 200px;
  background: url('../../assets/citypics/beijin1.jpg');
  background-size: cover;
}
.personalindex-wrap .personalindex-msg{
  width: 100%;
  background-color: #ffffff;
  position: relative;
  top: -10px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  box-sizing: border-box;
  padding: 0px 20px 0px 20px;
}
.personalindex-msg .msg-wrap{
  width: 100%;
  position: relative;
  top: -32.5px;
  height: 160px;
}
.personalindex-msg .msg-top{
  width: 100%;
  display: flex;
  justify-content: space-around;
  align-items: flex-end;
}
.personalindex-msg .msg-top .msg-top-head{
  width: 65px;
  height: 65px;
  border: 5px solid #ffffff;
  border-radius: 50px;
  overflow: hidden;
}
.msg-top .msg-top-head img{
  max-width: 100%;
  height: 100%;
  object-fit: cover;
}
.msg-top .msg-top-follow, .msg-top .follow-success{
  width: 70px;
  height: 30px;
  line-height: 30px;
  border-radius: 30px;
  text-align: center;
  font-size: 13px;
}
.msg-top .msg-top-follow{
  background-color: #51c0c7;
  color: #ffffff;
}
.msg-top .follow-success{
  background-color: #dddddd;
}
.msg-top .msg-top-talk{
  width: 120px;
  height: 30px;
  line-height: 30px;
  color: #ffffff;
  background-color: #8134af;
  border-radius: 30px;
  text-align: center;
  font-size: 13px;
}
.msg-top .com-box {
  width: 230px;
  display: flex;
  justify-content: space-between;
}
.personalindex-msg .msg-middle-tag {
  margin-top: 8px;
}
.personalindex-msg .msg-middle{
  width: 100%;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
}
.personalindex-msg .msg-middle h2{
  margin-bottom: 5px;
}
.msg-middle .msg-middle-name,.msg-middle .msg-middle-tag{
  font-size: 16px;
  width: 40%;
  display: flex;
  margin-bottom: 15px;
}
.msg-middle-tag .tag-sex{
  width: 50px;
  height: 20px;
  line-height: 20px;
  border-radius: 30px;
  font-size: 13px;
  display: flex;
  justify-content: center;
  margin-right: 8px;
}
.tag-sex-female{
  border:1px solid #FFB6B9;
  color: #FFB6B9;
}
.tag-sex-male{
  border:1px solid #8ac6d1;
  color: #8ac6d1;
}
.tag-sex-screct{
  border:1px solid #b689b6;
  color: #b689b6;
}
.msg-middle-tag .msg-place{
  width: 50px;
  height: 20px;
  border:1px solid #b689b6;
  border-radius: 30px;
  line-height: 20px;
  font-size: 13px;
  text-align: center;
  color: #b689b6;
}
.personalindex-msg .msg-bottom{
  width: 100%;
  margin-top: 10px;
  height: 40px;
  display: flex;
  align-items: center;
}
.personalindex-msg .msg-bottom span{
  font-size: 18px;
  font-weight: bold;
}
.personalindex-msg .msg-bottom p{
  font-size: 12px;
  margin-right: 8px;
}
.personalindex-wrap .divider{
  width: 100%;
  height: 15px;
  background: #f2f4f6;
}
.msg-bottom .msg-bottom-count {
  margin: 0 5px;
}
</style>