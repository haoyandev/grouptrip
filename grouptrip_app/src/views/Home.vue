<template>
 
    <main id="homepage">
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
            <router-link to="/GroupTrip">
            <mt-button class="iconbutton">
              <svg class="iconshaixuan" aria-hidden="true">
                <use xlink:href="#iconshaixuan" />
              </svg>
              <span style="font-size:5px;">筛选</span>
            </mt-button>
            </router-link>
            <mt-button class="iconbutton">
              <svg class="iconmessage" aria-hidden="true">
                <use xlink:href="#iconmessage" />
              </svg>
            </mt-button>
          </div>
        </mt-tab-item>
      </mt-tabbar>
      <div class="homewrap">
        <trips></trips>
        <div style="text-align:center">
          <van-loading size="24px" v-show="!can">加载中...</van-loading>
        </div>

        <div class="blank"></div>
      </div>
      <Sendgroup @Chose="jumpchos"></Sendgroup>
      <main-tab-bar></main-tab-bar>
    </main>

</template>
<script>
import Trips from "../components/index/Trips";
import MainTabBar from "../components/mainTabBar";
import Sendgroup from "../components/common/Sendgroup";
import GroupTrip from "../components/index/Grouptrip";
import chose from "../components/publish/choseTheme";
export default {
  components: {
    MainTabBar,
    Sendgroup,
    GroupTrip,
    Trips,
    chose
  },
  created() {
    this.lazy();
    setTimeout(() => {
      this.star = 1;
    }, 300);
  },
  data() {
    return {
      can: true,
      chosopa: 0,
      chosdis: "none",
      star: 0,
      opa: 1,
      copa: 0,
      width: innerWidth * 2 + "px",
      go: "block",
      gos: "none"
    };
  },
  methods: {
    lazy() {
      document.addEventListener("scroll", () => {
        function getWinHeight() {
          return (
            document.documentElement.clientHeight || document.body.clientHeight
          );
        }
        function getScrollHeight() {
          let bodyScrollHeight = 0;
          let documentScrollHeight = 0;
          if (document.body) {
            bodyScrollHeight = document.body.scrollHeight;
          }
          if (document.documentElement) {
            documentScrollHeight = document.documentElement.scrollHeight;
          }
          // 当页面内容超出浏览器可视窗口大小时，Html的高度包含body高度+margin+padding+border所以html高度可能会大于body高度
          return bodyScrollHeight - documentScrollHeight > 0
            ? bodyScrollHeight
            : documentScrollHeight;
        }
        function isReachBottom() {
          const scrollTop = getScrollTop(); // 获取滚动条的高度
          const winHeight = getWinHeight(); // 一屏的高度
          const scrollHeight = getScrollHeight(); // 获取文档总高度
          return scrollTop >= parseInt(scrollHeight) - winHeight;
        }
        function getScrollTop() {
          // 考虑到浏览器版本兼容性问题，解析方式可能会不一样
          return document.documentElement.scrollTop || document.body.scrollTop;
        }
        var address = this.$store.state.page;
        if (isReachBottom() && address === "/Home" && this.can) {
          this.can = false;
          setTimeout(() => {
            this.axios.get("", { params: {} }).then(res => {
              this.can = true;
              console.log(res);
            });
          }, 2000);
        }
      });
    },
    gjc(data) {
      this.chosdis = data.chosdis;
      this.copa = data.opa;
      setTimeout(() => {
        this.chosopa = data.chosopa;
        this.gos = data.go;
        setTimeout(() => {}, 50);
      }, 300);
    },
    jumpchos(data) {
      this.chosdis = data.chosdis;
      this.opa = data.opa;
      setTimeout(() => {
        this.chosopa = data.chosopa;
        this.go = data.go;
        setTimeout(() => {}, 50);
      }, 300);
    },
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
      this.copa = 0;
      setTimeout(() => {
        this.go = data.go;
        this.gos = data.gos;
        setTimeout(() => {
          this.opa = data.opa;
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
@font-face {
  font-family: Mqi;
  src: url("../assets/font/MicrosoftYaqiHei-2.ttf");
}
@font-face {
  font-family: JianHei;
  src: url("../assets/font/HanYiZhongJianHei-2.ttf");
}
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
  line-height: 20px;
}
.tabbar-icon .mint-button-text span {
  margin-left: 5px;
}
.tabbar-icon .mint-button--normal {
  padding: 0 2px;
}
.homewrap {
  position: relative;
  top: 140px;
}

.wrap-item {
  height: 175px;
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
  background-image: url("../assets/cardpics/bg1.jpg");
  background-size: cover;
}
.wrap-item .wrap-item-content {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.wrap-item .wrap-item-content .personal-pic {
  width: 50px;
  height: 50px;
  border: 2px solid #ffffff;
  border-radius: 50px;
}
.wrap-item .wrap-item-content .personal-pic img {
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
  font: bold 16px Mqi;
}
.wrap-item .wrap-item-content .date {
  color: #fff;
  font: 5px "VisbyCFMedium", "Helvetica Neue", Helvetica, Arial, sans-serif;
  margin-top: 0px;
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
  font: bold 14px JianHei;
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
#homepage .blank {
  width: 100%;
  height: 60px;
  background: #fff;
}
</style>