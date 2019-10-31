<template>
  <div
    :style="{opacity:opa.paropa,display:opa.pardis,transition:'opacity .3s linear'}"
    v-if="canShow">
    <div class="icon">
      <div class="icon-left">
        <span @click="jumpSetting">
          <svg class="chilun" aria-hidden="true">
            <use xlink:href="#iconsetup" />
          </svg>
        </span>
        <svg class="erweima" aria-hidden="true">
          <use xlink:href="#iconscan" />
        </svg>
      </div>
      <div class="icon-right">
        <svg class="message" aria-hidden="true">
          <use xlink:href="#iconmessage" />
        </svg>
      </div>
    </div>
    <div class="user-head">
      <div>
        <div @click="jump" v-if="isLogin" class="header">
          <router-link to="/PersonalIndex">
            <img :src="user.avatar" alt />
          </router-link>
        </div>

        <div v-else>
          <router-link to="/login">
            <svg class="boyhead" aria-hidden="true">
              <use xlink:href="#icontouxiangnanhai" />
            </svg>
          </router-link>
        </div>
      </div>
      <span v-if="isLogin">{{user.uname}}</span>
      <span v-else @click="jump">登录查看更多信息</span>
    </div>
    <div class="self-content">
      <ul>
        <li>
          <h1>0</h1>
          <span>获赞与收藏</span>
        </li>
        <li>
          <router-link to="/fans">
            <h1>{{user.fansNum || 0}}</h1>
            <span>粉丝</span>
          </router-link>
        </li>
        <li>
          <h1>{{user.focusNum || 0}}</h1>
          <span>关注</span>
        </li>
        <li>
          <h1>0</h1>
          <span>国家</span>
        </li>
      </ul>
    </div>
    <div class="user-hobby">
      <ul>
        <li>
          <div>
            <svg class="shoucangjia" aria-hidden="true">
              <use xlink:href="#iconshoucangjia" />
            </svg>
          </div>
          <span>收藏夹</span>
        </li>
        <li>
          <div>
            <svg class="youhuiquan" aria-hidden="true">
              <use xlink:href="#iconyouhuiquan2" />
            </svg>
          </div>
          <span>优惠券</span>
        </li>
        <li>
          <div>
            <svg class="qianbao" aria-hidden="true">
              <use xlink:href="#iconqianbao" />
            </svg>
          </div>
          <span>钱包</span>
        </li>
        <li>
          <div>
            <svg class="ban" aria-hidden="true">
              <use xlink:href="#iconhuoban" />
            </svg>
          </div>
          <span>Biu伴</span>
        </li>
        <li>
          <div>
            <svg class="dingdan" aria-hidden="true">
              <use xlink:href="#iconshoutibao" />
            </svg>
          </div>
          <span>订单</span>
        </li>
        <li>
          <div>
            <svg class="wenda" aria-hidden="true">
              <use xlink:href="#iconwenda" />
            </svg>
          </div>
          <span>问答</span>
        </li>
      </ul>
    </div>
    <main-tab-bar></main-tab-bar>
  </div>
</template>

<script>
// 这是个人中心页面
import MainTabBar from "../components/mainTabBar";
import fans from "../components/home/fanList";
import user from "../components/index/PersonalIndex";
export default {
  data() {
    return {
      opa: {
        paropa: 1,
        pardis: "block",
        fanopa: 0,
        fandis: "none",
        useropa: 0,
        userdis: "none"
      },
      user: {},
      isLogin: false,
      canShow: false
    };
  },
  created() {
    // 每次创建personal都要先判断用户是否已登录
    // 获取本定token判断用户是否有登录
    var token = localStorage.getItem("token");
    if (token !== "undefined") {
      // 如果有登录 展现有用户信息的页面
      // 发送ajax获取最新的信息
      console.log("token", token);
      var url = "/user/api/v1/detail";
      this.axios
        .get(url)
        .then(res => {
          if (res.data.code === 200) {
            // token正常
            this.user = res.data.data;
            this.isLogin = true;
            // 设置vuex
            this.$store.commit("setUser", this.user);
            this.$store.commit("setIsLogin", this.isLogin);
          }
        })
        .catch(err => console.log(err));
    }
    this.canShow = true;
    // 发送ajax获取用户最新的信息
  },
  methods: {
    fh() {
      this.opa.useropa = 0;
      setTimeout(() => {
        this.opa.userdis = "none";
        this.opa.pardis = "block";
        setTimeout(() => {
          this.opa.paropa = 1;
        }, 50);
      }, 50);
    },
    jumppro(data) {
      this.opa.fanopa = data.fanopa;
      setTimeout(() => {
        this.opa.fandis = data.fandis;
        this.opa.pardis = data.pardis;
        setTimeout(() => {
          this.opa.paropa = 1;
        }, 50);
      }, 50);
    },
    jumpfans() {
      this.opa.paropa = 0;
      setTimeout(() => {
        this.opa.pardis = "none";
        this.opa.fandis = "block";
        setTimeout(() => {
          this.opa.fanopa = 1;
        }, 50);
      }, 50);
    },
    jump() {
      if (!this.isLogin) {
        this.$router.push("/login");
      } else {
        this.opa.paropa = 0;
        setTimeout(() => {
          this.opa.pardis = "none";
          this.opa.userdis = "block";
          setTimeout(() => {
            this.opa.useropa = 1;
          }, 50);
        }, 50);
      }
    },
    jumpSetting() {
      if (this.isLogin) {
        // 如果登录 则跳去个人设置页面
        this.$router.push("/Settings");
      } else {
        // 如果未登录 则跳去登录页面
        this.$toast({ message: "未登录", duration: 1000 });
        setTimeout(() => {
          this.$router.push("/Login");
        }, 1000);
      }
    }
  },
  components: {
    MainTabBar,
    fans,
    user
  }
};
</script>
<style scoped>
#personal-page {
  transition: opacity 0.3s linear;
}
[v-cloak] {
  display: none;
}
ul {
  padding: 0px;
}
.icon {
  display: flex;
  justify-content: space-between;
  height: 80px;
}
.icon .icon-left {
  margin-top: 25px;
  margin-left: 30px;
}
.icon .icon-left > span {
  margin-right: 20px;
}
.icon .icon-right {
  margin-top: 25px;
  margin-right: 30px;
}
.user-head > div {
  margin-bottom: 15px;
}
.user-head > span {
  font-weight: 700;
  font-size: 20px;
}
.user-head {
  text-align: center;
  margin-bottom: 25px;
}
/* 头像 */
.user-head .header {
  width: 50px;
  height: 50px;
  margin: 0 auto;
  border-radius: 50%;
  text-align: center;
}
.user-head .header img {
  width: 100%;
  object-fit: cover;
}
.user-hobby > ul {
  max-width: 100%;
  height: 100%;
  flex-wrap: wrap;
  list-style: none;
}
.user-hobby > ul > li {
  width: 33.33%;
  float: left;
  position: relative;
  text-align: center;
  height: 30px;
  font-size: 14px;
  margin: 20px 0 18px 0;
}
.self-content > ul > li > span {
  font-size: 7px;
  color: black;
}
.self-content > ul {
  display: flex;
  list-style: none;
}
.self-content > ul > li {
  width: 25%;
  color: black;
  text-align: center;
}
.self-content > ul > li > h1 {
  font-weight: bold;
  font-size: 27px;
  margin: 0;
}
</style>