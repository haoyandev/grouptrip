<template>
  <div :style="{opacity:star,transition:'all .3s linear'}">
    <group-trip @Child="showChild" :style="{display:gos,opacity:copa,transition:'all .3s linear'}"></group-trip>
    <main id="homepage" :style="{display:go,opacity:opa,transition:'all .3s linear'}">
      <mt-tabbar fixed class="tabbar-top">
        <mt-tab-item class="text-item logo-top">
          <img src="../assets/cardpics/logo.png" alt style="width:180px;" />
        </mt-tab-item>
        <mt-tab-item class="text-item search-top">
          <div class="tabbar-search">
            <svg class="search" aria-hidden="true">
              <use xlink:href="#iconsearch-copy" />
            </svg>
            <input type="text" class="form-text" placeholder="红叶季赏枫攻略" />
          </div>
          <div class="tabbar-icon">
            <mt-button @click="jump()" class="iconbutton">
              <svg class="iconshaixuan" aria-hidden="true">
                <use xlink:href="#iconshaixuan" />
              </svg>
            </mt-button>
            <span style="font-size:5px;">筛选</span>
            <mt-button class="iconbutton">
              <svg class="iconmessage" aria-hidden="true">
                <use xlink:href="#iconmessage" />
              </svg>
            </mt-button>
          </div>
        </mt-tab-item>
      </mt-tabbar>
      <div class="homewrap">
        <div class="wrap-left">
          <div class="wrap-item top-item">
            <div class="wrap-item-content">
              <div class="personal-pic">
                <img src="../assets/citypics/img1957.jpg" alt="">
              </div>
              <span class="place">马来西亚,沙巴</span>
              <span class="date">11月16日-11月30日</span>
              <div class="wrap-item-details">
                <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
              </div>
            </div>
          </div>
          <div class="wrap-item" v-for="(t,i) of trips" :key="
          i">
            <div class="wrap-item-content">
              <div class="personal-pic">
                <img :src="t.headpic" alt="">
              </div>
              <span class="place">{{t.place}}</span>
              <span class="date">{{t.date}}</span>
              <div class="wrap-item-details">
                <p>{{t.details}}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="wrap-right home-wrap-item">
          <div class="wrap-item" v-for="(t,i) of trips" :key="
          i">
            <div class="wrap-item-content">
              <div class="personal-pic">
                <img :src="t.headpic" alt="">
              </div>
              <span class="place">{{t.place}}</span>
              <span class="date">{{t.date}}</span>
              <div class="wrap-item-details">
                <p>{{t.details}}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <Sendgroup></Sendgroup>
      <main-tab-bar></main-tab-bar>
    </main>
  </div>
</template>
<script>
import MainTabBar from "../components/mainTabBar";
import Sendgroup from "../components/common/Sendgroup";
import GroupTrip from "../components/index/Grouptrip";
export default {
  components: {
    MainTabBar,
    Sendgroup,
    GroupTrip
  },
  created() {
    setTimeout(() => {
      this.star = 1;
    }, 300);
  },
  data() {
    return {
      star: 0,
      opa: 1,
      copa: 0,
      width: innerWidth * 2 + "px",
      go: "block",
      gos: "none",

      trips:[
        {headpic:require('../assets/citypics/heimen.jpg'),
        place:"泰国,芭提雅",date:"10月16日-10月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！"},
        {headpic:require('../assets/citypics/heimen.jpg'),
        place:"日本，大阪",date:"11月16日-11月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！"}
      ]
    };
  },
  methods: {
    jump() {
      this.opa = 0;
      setTimeout(() => {
        this.gos = "block";
        this.go = "none";
        setTimeout(() => {
          this.copa = 1;
        }, 50);
      }, 300);
    },
    showChild(data) {
      console.log(data)
      this.copa=0;
      setTimeout(() => {
        this.go=data.go;
        this.gos=data.gos;
        setTimeout(() => {
          this.opa=data.opa;
        }, 50);
      }, 300);
      // this.opa = data.opa;
      // setTimeout(() => {
      //   this.gos = data.gos;
      //   this.go = data.go;
      //   setTimeout(() => {
      //     this.copa =data.copa;
      //   }, 50);
      // }, 300);
    }
  }
};
</script>
<style>
#homepage {
  position: relative;
}
#homepage .tabbar-top {
  position: fixed;
  top: 0;
  height: 120px;
  display: flex;
  flex-direction: column;
}
#homepage .tabbar-top .logo-top {
  width: 100%;
  height: 60px;
  object-fit: cover;
}
#homepage .tabbar-top .logo-top.text-item .mint-tab-item-label {
  display: flex;
  justify-content: center;
}
#homepage .mint-tabbar > .mint-tab-item.is-selected {
  background-color: #fff;
  color: #111111;
}
#homepage .tabbar-top .search-top.text-item .mint-tab-item-label {
  width: 100% !important;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
}
#homepage .tabbar-search,
#note-page .tabbar-search,
#go-page .tabbar-search {
  margin-left: 10px;
  display: flex;
  position: relative;
  border-radius: 30px;
  background-color: #e4e4e47c;
}
#homepage .tabbar-search,
#note-page .tabbar-search {
  width: 65%;
}
#homepage .tabbar-search .search,
#note-page .tabbar-search .search,
.pop-panel .tabbar-search .search,
#go-page .tabbar-search .search {
  position: absolute;
  margin-top: 2.5px;
  margin-left: 5px;
}
#homepage .form-text,
#note-page .form-text,
.pop-panel .form-text,
#go-page .form-text {
  border: none;
  height: 20px;
  width: 100%;
  position: relative;
  background: transparent;
  font-size: 12px;
  padding: 3px 5px;
  margin-left: 23px;
}
.tabbar-search input::-webkit-input-placeholder {
  font-size: 12px;
  color: #999999;
  right: 5px;
}
.tabbar-search input {
  outline: none;
}

.tabbar-icon {
  width: 25%;
  display: flex;
  justify-content: space-around;
  align-items: center;
}
.tabbar-icon .mint-button--default {
  background-color: transparent;
  border: none;
  box-shadow: none;
  height: 20px;
}
.tabbar-icon .mint-button--normal {
  padding: 0 2px;
}
.homewrap {
  position: relative;
  top: 140px;
  width: 100%;
  display: flex;
}

.wrap-item {
  height: 175px;
  background:url('../assets/cardpics/bg-test.jpg');
  background-size: 100%;
  border-radius: 10px;
  position: relative;
  padding-top: 50px;
  margin-bottom: 15px;
}
.home-wrap-item {
  width: 100%;
}
.top-item {
  height: 205px;
  width: 100%;
}
.wrap-item .wrap-item-content {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.wrap-item .wrap-item-content .personal-pic {
  width: 50px;
  height: 50px;
  border:2px solid #ffffff;
  border-radius: 50px;
}
.wrap-item .wrap-item-content .personal-pic img{
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 50px;
}
.wrap-item .wrap-item-content span {
  display: block;
  margin: 10px 0;
}
.wrap-item .wrap-item-content .place {
  color: #fff;
  width: 135px;
  text-align: center;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/
  -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 2; /** 显示的行数 **/
  overflow: hidden;
}
.wrap-item .wrap-item-content .date {
  color: #fff;
  font: 5px "VisbyCFMedium", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
.wrap-item .wrap-item-content .wrap-item-details {
  height: 50px;
  color: #ffffff;
  position: absolute;
  bottom: 0px;
  border-bottom-right-radius: 10px;
  border-bottom-left-radius: 10px;
  padding: 10px;
}
.wrap-item .wrap-item-content .wrap-item-details p {
  overflow: hidden;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/
  -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 2; /** 显示的行数 **/
  margin: 0;
  padding-top: 10px;
  font: 0.8em "VisbyCFExtraBold", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
.wrap-left,
.wrap-right {
  width: 50%;
  display: flex;
  flex-direction: column;
}
.wrap-left {
  padding-left: 10px;
  padding-right: 10px;
}
.wrap-right {
  padding-right: 10px;
}
</style>