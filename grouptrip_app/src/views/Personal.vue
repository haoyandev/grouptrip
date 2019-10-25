
<template>
  <main id="personal-page">
    <div class="icon">
      <div class="icon-left">
        <span>
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
        <svg @click="jump" class="boyhead" aria-hidden="true">
          <use xlink:href="#icontouxiangnanhai" />
        </svg>
      </div>
      <span @click="jump">{{this.$store.getters.user.uname||'登录查看更多信息'}}</span>
    </div>
    <div class="self-content">
      <ul>
        <li>
          <h1>0</h1>
          <span>获赞与收藏</span>
        </li>
        <li>
          <h1>0</h1>
          <span>粉丝</span>
        </li>
        <li>
          <h1>0</h1>
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
  </main>
</template>

<script>
// 这是个人中心页面
import MainTabBar from '../components/mainTabBar'
export default {
  data() {
    return {
    };
  },
  created() {
    setTimeout(() => {
      this.start = true;
    }, 200);
    return {};
  },
  methods:{
    jump(){
      this.$router.push('/login')
    }
  },
  components:{
    MainTabBar,
  }
};
</script>
<style scoped>
#personal-page{
  transition: opacity 0.3s linear;
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
.user-hobby > ul {
  width: 100%;
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