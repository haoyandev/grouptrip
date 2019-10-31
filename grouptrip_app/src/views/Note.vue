<template>
  <main id="note-page">
    <div class="tabbar-top">
      <div class="tabbar-search">
        <svg class="search" aria-hidden="true">
          <use xlink:href="#iconsearch-copy" />
        </svg>
        <input type="text" class="form-text" placeholder="搜索游记" />
      </div>
      <router-link to="javascript;" class="start-group">发布</router-link>
    </div>
    <div class="top-title">
      <div class="title-date">
        <h1>{{times.getDate()}}</h1>
      </div>
      <div class="title-year-mon">
        <h5>{{times.toString().slice(3,7)}}</h5>
        <h5>2019</h5>
      </div>
      <div class="main-title">
        <h1>游记</h1>
      </div>
    </div>
    <div>
      <div class="carousel">
        <div
          class="carousel-inner"
          :class="ulClass"
          @touchstart="touchstart"
          @touchmove="touchmove"
          :style="ulStyle"
          @touchend="touchend"
        >
          <div v-for="(img,i) of imgs" :key="i" class="carousel-item">
            <img :src="imgs[i]" :style="{width:innerWidth+'px'}" />
          </div>
          <div class="carousel-item">
            <img :src="imgs[0]" :style="{width:innerWidth+'px'}" />
          </div>
        </div>
      </div>
      <ul class="carousel-ul">
        <li v-for="(item,s) of imgs" @click="i=s" :key="s" :class="imgs[s]===imgs[i]&&'li-border'">
          <img :src="imgs[s]" />
        </li>
      </ul>
    </div>
    <div class="note-wrap">
      <div class="topic-suggest">
        <h3>话题推荐</h3>
        <ul
          class="topic-ul"
          :style="{marginLeft:move.left+'px'}"
          @touchstart="ts"
          @touchmove="tm"
          @touchend="te"
        >
          <li
            class="topic-li"
            v-for="(item,i) of items"
            :key="i"
            :style="{background:'url('+item.imgpath+')',backgroundRepeat:'no-repeat',backgroundPosition:'center center', backgroundSize: '100%'}"
          >
            <h5>{{item.title}}</h5>
            <p>{{item.subtitle}}</p>
            <span :style="{'background':item.color}"></span>
          </li>
        </ul>
      </div>
      <van-tabs v-model="active" animated class="note-tabs">
        <van-tab title="全部游记">
          <div class="all-item" v-for="(n,i) of newnotes" :key="i">
            <div class="item-text">
              <h3>{{n.title}}</h3>
              <div class="item-head">
                <img :src="n.avatar" alt />
              </div>
              <span class="text-personal">发表于{{n.create_time}}</span>
            </div>
            <div class="item-img">
              <img :src="n.img" alt />
            </div>
            <div class="item-tag">
              <span>{{n.tags[0]}}</span>
              <span>{{n.tags[1]}}</span>
            </div>
            <div class="item-icon">
              <like></like>
              <span>{{n.likes}}</span>
              <svg class="iconcomment" aria-hidden="true">
                <use xlink:href="#iconcomment" />
              </svg>
              <span>{{n.comments}}</span>
              <collect class="collection"></collect>
            </div>
            <van-divider />
          </div>
          <div style="text-align:center">
            <van-loading v-show="!can" size="24px" style="padding-bottom:30px;">加载中...</van-loading>
          </div>
        </van-tab>
        <van-tab title="宝藏游记">
          <div class="note-top">
            <h2>宝藏游记</h2>
            <div class="notetop-img">
              <img src="../assets/citypics/food01.jpg" alt />
            </div>
            <div class="item-text">
              <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
              <div class="item-head">
                <img src="../assets/citypics/heimen.jpg" alt />
              </div>
              <span class="text-personal">
                <b>维多利亚</b>
              </span>
              <span class="text-personal">
                在
                <b>日本</b>
              </span>
              <div class="item-icon">
                <like></like>
                <span>128</span>
                <svg class="iconcomment" aria-hidden="true">
                  <use xlink:href="#iconcomment" />
                </svg>
                <span>83</span>
                <collect class="collection"></collect>
              </div>
            </div>
            <van-divider />
          </div>
          <div class="history-note">
            <h2>历史榜首宝藏</h2>
            <div class="all-item" v-for="(n,i) of newnotes" :key="i">
              <div class="item-text">
                <h3>{{n.title}}</h3>
                <div class="item-head">
                  <img :src="n.avatar" alt />
                </div>
                <span class="text-personal">发表于{{n.create_time}}</span>
              </div>
              <div class="item-img">
                <img :src="n.img" alt />
              </div>
              <div class="item-tag">
                <span>{{n.tags[0]}}</span>
                <span>{{n.tags[1]}}</span>
              </div>
              <div class="item-icon">
                <like></like>
                <span>{{n.likes}}</span>
                <svg class="iconcomment" aria-hidden="true">
                  <use xlink:href="#iconcomment" />
                </svg>
                <span>{{n.comments}}</span>
                <collect class="collection"></collect>
              </div>
              <van-divider />
            </div>
            <div style="text-align:center">
              <van-loading v-show="!can" size="24px" style="padding-bottom:30px;">加载中...</van-loading>
            </div>
          </div>
        </van-tab>
        <van-tab title="玩法路线">
          <div class="route-wrap">
            <h2>旅行新发现</h2>
            <div class="new-route">
              <div class="new-item" v-for="(find,f) of finds" :key="f">
                <div class="new-itemimg">
                  <img :src="find.imgpath" alt />
                </div>
                <h4>{{find.title}}</h4>
                <p>{{find.count}}次浏览</p>
              </div>
            </div>
            <van-divider />
            <div class="hot-route">
              <h2>热门玩法</h2>
              <ul
                class="hot-route-ul"
                @touchmove="t2"
                @touchstart="t1"
                @touchend="t3"
                :style="{marginLeft:move.t2+'px'}"
              >
                <li class="hot-route-li" v-for="(route,r) of routes" :key="r">
                  <h4>{{route.title}}</h4>
                  <p>{{route.count}}人感兴趣</p>
                  <span :style="{'backgroundColor':route.color}"></span>
                </li>
              </ul>
            </div>
            <van-divider />
            <div class="popular-route">
              <h2>热门路线</h2>
              <div class="popular-item" v-for="(popular,p) of populars" :key="p">
                <div class="popular-img">
                  <img src="../assets/citypics/img1957.jpg" alt />
                </div>
                <div class="popular-text">
                  <h3>{{popular.title}}</h3>
                  <span>{{popular.tag1}}</span>
                  <span>{{popular.tag2}}</span>
                  <p>{{popular.subtitle}}</p>
                </div>
                <van-divider />
              </div>
            </div>
          </div>
        </van-tab>
        <van-tab title="最新发表">
          <div class="all-item" v-for="(item,i) of newnotes" :key="i">
            <div class="item-text">
              <h3>{{item.title}}</h3>
              <div class="item-head">
                <img :src="item.avatar" alt />
              </div>
              <span class="text-personal">发表于{{item.create_time}}</span>
            </div>
            <div class="item-img">
              <img :src="item.img" alt />
            </div>
            <div class="item-tag">
              <span>{{item.tags[0]}}</span>
              <span>{{item.tags[1]}}</span>
            </div>
            <div class="item-icon">
              <like></like>
              <span>{{item.likes}}</span>
              <svg class="iconcomment" aria-hidden="true">
                <use xlink:href="#iconcomment" />
              </svg>
              <span>{{item.comments}}</span>
              <collect class="collection"></collect>
            </div>
            <van-divider />
          </div>
          <div style="text-align:center">
            <van-loading v-show="!can" size="24px" style="padding-bottom:30px;">加载中...</van-loading>
          </div>
        </van-tab>
      </van-tabs>
      <div class="blank"></div>
    </div>
    <main-tab-bar></main-tab-bar>
  </main>
</template>
<script>
import MainTabBar from "../components/mainTabBar";
import like from "../components/common/like";
import collect from "../components/common/collect";
export default {
  beforeCreate() {
    this.a = setInterval(() => {
      this.i++;
    }, 5000);
  },
  mounted() {
    this.lazy();
    this.axios.get(`/group/api/v1/notelist/${this.page}`).then(res => {
      this.newnotes = this.newnotes.concat(res.data.data);
      console.log(this.newnotes);
    });
  },
  components: {
    MainTabBar,
    like,
    collect
  },
  data() {
    return {
      page: 1,
      can: true,
      times: new Date(),
      move: {
        start: 0,
        left: 0,
        end: 0,
        t1: 0,
        t2: 0,
        t3: 0
      },
      active: 0,
      a: null,
      ulClass: {
        hasTran: true
      },
      i: 0,
      marginLeft: -50,
      leftsize: 0,
      leftstart: 0,
      innerWidth: window.innerWidth,
      imgs: [
        require("../assets/citypics/city6.jpg"),
        require("../assets/citypics/city7.jpg"),
        require("../assets/citypics/city8.jpg"),
        require("../assets/citypics/city10.jpg"),
        require("../assets/citypics/city12.jpg"),
        require("../assets/citypics/img1957.jpg")
      ],
      newnotes: [],
      populars: [
        {
          title: "大阪3日路线",
          tag1: "初次必玩",
          tag2: "环球影城一日游",
          subtitle: "游玩3天/适宜9月-12月/4个景点"
        },
        {
          title: "品味老广州经典1日游",
          tag1: "老广州的建筑",
          tag2: "品味粤菜",
          subtitle: "游玩6天/适宜10月-5月/14个景点"
        },
        {
          title: "大阪3日路线",
          tag1: "初次必玩",
          tag2: "环球影城一日游",
          subtitle: "游玩3天/适宜3月-11月/12个景点"
        }
      ],

      finds: [
        {
          title: "不止布达佩斯 | 走进不一样的匈牙利",
          count: "133456",
          imgpath: require("../assets/citypics/beijin1.jpg")
        },
        {
          title: "不止布达佩斯 | 走进不一样的匈牙利",
          count: "133456",
          imgpath: require("../assets/citypics/beijin1.jpg")
        },
        {
          title: "不止布达佩斯 | 走进不一样的匈牙利",
          count: "133456",
          imgpath: require("../assets/citypics/beijin1.jpg")
        },
        {
          title: "不止布达佩斯 | 走进不一样的匈牙利",
          count: "133456",
          imgpath: require("../assets/citypics/beijin1.jpg")
        }
      ],
      routes: [
        { title: "自驾游", count: "120000", color: "#2694ab" },
        { title: "赏秋好去处", count: "187709", color: "#fdc4b6" },
        { title: "最省钱的一次旅游", count: "20000", color: "#a696c8" },
        { title: "忘不掉的味道", count: "187930", color: "#ea7070" }
      ],
      items: [
        {
          title: "#香港购物指南",
          subtitle: "购物",
          imgpath: require("../assets/citypics/city12.jpg"),
          color: "#e59572"
        },
        {
          title: "#首尔小众秘境推荐",
          subtitle: "人少景美",
          imgpath: require("../assets/citypics/city10.jpg"),
          color: "#96ceb4"
        },
        {
          title: "#大阪+京都",
          subtitle: "关西",
          imgpath: require("../assets/citypics/city8.jpg"),
          color: "#fdc4b6"
        },
        {
          title: "#大马学潜水",
          subtitle: "潜水",
          imgpath: require("../assets/citypics/city12.jpg"),
          color: "#F9CE00"
        },
        {
          title: "#泰国美食推荐",
          subtitle: "种草绿皮书",
          imgpath: require("../assets/citypics/city7.jpg"),
          color: "#2694ab"
        },
        {
          title: "#新加坡网红打卡地",
          subtitle: "拍照",
          imgpath: require("../assets/citypics/city6.jpg"),
          color: "#a696c8"
        }
      ]
    };
  },
  computed: {
    ulStyle() {
      if (this.imgs.length === this.i) {
        setTimeout(() => {
          this.ulClass.hasTran = false;
          setTimeout(() => {
            this.i = 0;
            setTimeout(() => {
              this.ulClass.hasTran = true;
              setTimeout(() => {
                this.canClick = true;
              });
            }, 50);
          }, 50);
        }, 400);
      }
      var width = this.innerWidth * (this.imgs.length + 1) + "px";
      var marginLeft = -this.i * this.innerWidth + -this.leftsize / 5 + "px";
      return { width, marginLeft };
    }
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
        if (isReachBottom() && address === "/Note" && this.can) {
          this.can = false;
          setTimeout(() => {
            this.axios
              .get(`/group/api/v1/notelist/${++this.page}`, { params: {} })
              .then(res => {
                this.newnotes = this.newnotes.concat(res.data.data);
                this.can = true;
              });
          }, 2000);
        }
      });
    },

    time(num) {
      console.log(num);
    },
    tm(e) {
      this.move.left =
        e.changedTouches[0].pageX - this.move.start + this.move.end;
      if (this.move.left >= 0) {
        this.move.left = 0;
      }
      if (this.move.left <= -270) {
        this.move.left = -270;
      }
    },
    ts(e) {
      this.move.start = e.changedTouches[0].pageX;
    },
    te(e) {
      this.move.end = this.move.left;
    },
    t2(e) {
      this.move.t2 = e.changedTouches[0].pageX - this.move.t1 + this.move.t3;
      if (this.move.t2 >= 0) {
        this.move.t2 = 0;
      }
      if (this.move.t2 <= -225) {
        this.move.t2 = -225;
      }
    },
    t1(e) {
      this.move.t1 = e.changedTouches[0].pageX;
    },
    t3(e) {
      this.move.t3 = this.move.t2;
    },
    touchend(e) {
      this.a = setInterval(() => {
        this.i++;
      }, 3000);
      if (this.leftsize > 50 && this.i < this.imgs.length) {
        this.leftsize = 0;
        ++this.i;
        if (this.imgs.length === this.i) {
          setTimeout(() => {
            this.ulClass.hasTran = false;
            setTimeout(() => {
              this.i = 0;
              setTimeout(() => {
                this.ulClass.hasTran = true;
                setTimeout(() => {
                  this.canClick = true;
                });
              }, 50);
            }, 50);
          }, 400);
        }
      } else if (this.leftsize < -50 && this.i > 0) {
        this.leftsize = 0;
        --this.i;
      }
    },
    touchstart(e) {
      clearInterval(this.a);
      this.leftstart = e.changedTouches[0].pageX;
    },
    touchmove(e) {
      var left = e.changedTouches[0].pageX;
      this.leftsize = this.leftstart - left;
      if (this.leftsize < 0 && this.i === 0) {
        this.leftsize = 0;
      }
    }
  }
};
</script>
<style>
.topic-ul {
  padding-left: 10px;
}
#note-page .tabbar-top {
  width: 100%;
  height: 70px;
  display: flex;
  align-items: center;
  justify-content: space-around;
}
#note-page .tabbar-top .tabbar-search {
  width: 70%;
}
#note-page .tabbar-top .start-group {
  margin-top: 0px;
}
#note-page .top-title {
  display: flex;
  height: 40px;
  align-items: center;
  margin: 0px 0px 15px 15px;
}
#note-page .top-title h1,
h5 {
  margin: 0px;
}
#note-page .top-title .title-year-mon {
  margin: 0 5px;
  display: flex;
  flex-direction: column;
  border-left: 2px solid #111111;
  padding: 0px 5px;
}
.carousel-ul {
  display: flex;
  width: 340px;
  justify-content: space-between;
  list-style: none;
  padding: 0;
  margin: 10px 15px;
}
.carousel-ul > li {
  width: 50px;
  height: 50px;
  box-sizing: border-box;
  padding: 2px;
  text-align: center;
  overflow: hidden;
}
.li-border {
  border: 2px solid #b689b6;
  border-radius: 8px;
}
.carousel-ul > li > img {
  max-width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 8px;
}
.hasTran {
  transition: all 0.25s linear;
}
.carousel {
  overflow: hidden;
  width: 340px;
  height: 200px;
  border-radius: 6px;
  margin: 0 auto;
}
.carousel-item {
  float: left;
}
.carousel-item img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}
.note-wrap {
  width: 100%;
  position: relative;
}
.van-divider {
  height: 1px;
  width: 100%;
  margin: 0px 0px;
}
.note-tabs .van-tabs__line,
.strategy-bottom .van-tabs__line {
  background-color: #b689b6;
}
.note-wrap .topic-suggest {
  width: 100%;
  height: 150px;
  overflow: hidden;
}
.note-wrap .topic-suggest h3 {
  margin-left: 10px;
}
.note-wrap .topic-suggest h5 {
  margin: 10px 10px 5px 10px;
  color: #fff;
  position: absolute;
  z-index: 2;
}
.note-wrap .topic-suggest p {
  font-size: 10px;
  color: #fff;
  margin: 0px 0px 0px 10px;

  position: absolute;
  z-index: 2;
  bottom: 5px;
}
.note-wrap .topic-suggest span {
  opacity: 0.7;
  z-index: 1;
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  border-radius: 6px;
}
.note-wrap .topic-suggest ul {
  display: flex;
  margin-left: 10px;
  width: 630px;
}
.note-wrap .topic-suggest ul .topic-li {
  width: 100px;
  height: 60px;
  background-size: 100%;
  border-radius: 6px;
  position: relative;
  margin-right: 10px;
}
.note-wrap .all-item {
  width: 100%;
  height: 200px;
  display: flex;
  flex-wrap: wrap;
  padding: 15px 15px 0px 15px;
  margin-top: 10px;
  box-sizing: border-box;
}
.note-wrap .all-item .item-text {
  width: 50%;
  padding-right: 8px;
  box-sizing: border-box;
  position: relative;
}
.note-wrap .all-item .item-text h3 {
  margin: 0;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/
  -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 3; /** 显示的行数 **/
  overflow: hidden;
}
.item-text .item-head {
  width: 30px;
  height: 30px;
}
.note-wrap .all-item .item-text .item-head {
  position: absolute;
  bottom: 30px;
}
.item-text .item-head img {
  width: 100%;
  border-radius: 30px;
}
.item-text .text-personal {
  font-size: 13px;
  font-weight: lighter;
}
.note-wrap .all-item .item-text span {
  position: absolute;
  left: 35px;
  bottom: 37px;
}
.note-wrap .all-item .item-img {
  width: 50%;
}
.note-wrap .all-item .item-img img {
  width: 100%;
  border-radius: 6px;
}
.note-wrap .all-item .item-tag {
  width: 70%;
  font-size: 12px;
  margin-bottom: 15px;
}
.note-wrap .all-item .item-tag span {
  border: 1px solid #b689b6;
  border-radius: 5px;
  padding: 3px 5px;
  margin-right: 5px;
  color: #999999;
}
.item-icon {
  font-size: 13px;
  align-items: center;
  display: flex;
  justify-content: center;
}
.item-icon span {
  margin-left: 5px;
}
.item-icon .iconcomment {
  margin-left: 15px;
}
.note-wrap .note-top {
  width: 100%;
  height: 360px;
  display: flex;
  flex-wrap: wrap;
  padding: 15px 15px 0px 15px;
  box-sizing: border-box;
  position: relative;
}
.note-top h2,
.history-note h2,
.new-route h2,
.route-wrap h2 {
  margin: 0px 0px 15px 0px;
  font-weight: lighter;
}
.history-note {
  width: 100%;
}
.history-note h2 {
  margin-left: 15px;
  margin-top: 15px;
}
.note-top h3 {
  margin-bottom: 15px;
}
.note-top .notetop-img {
  width: 100%;
  height: 160px;
  overflow: hidden;
  border-radius: 6px;
}
.note-top .notetop-img img {
  width: 100%;
  border-radius: 6px;
}
.note-top .item-text .text-personal {
  position: relative;
  left: 40px;
  bottom: 27px;
  margin-left: 5px;
}
.note-top .item-icon {
  position: absolute;
  right: 15px;
  bottom: 30px;
}
.route-wrap {
  width: 100%;
  margin-top: 15px;
}
.route-wrap .new-route {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.route-wrap .new-route h2,
.route-wrap h2,
.route-wrap .popular-route h2 {
  margin-left: 15px;
}
.route-wrap .new-route .new-item {
  width: 45%;
  height: 200px;
  margin: 0px 5px;
}
.new-route .new-item .new-itemimg {
  width: 100%;
  height: auto;
  border-radius: 10px;
}
.new-route .new-item .new-itemimg img {
  width: 100%;
  border-radius: 10px;
}
.new-route .new-item h4,
p {
  margin: 5px 0px;
}
.new-route .new-item p {
  font-size: 12px;
  color: #999999;
  font-weight: lighter;
}
.route-wrap .hot-route {
  width: 100%;
  height: 150px;
  overflow: hidden;
}
.route-wrap .hot-route ul {
  display: flex;
  width: 870px;
}
.route-wrap .hot-route li {
  width: 130px;
  height: 80px;
  background: url("../assets/citypics/beijin1.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  margin-left: 15px;
  border-radius: 10px;
  position: relative;
}
.route-wrap .hot-route li h4 {
  margin: 10px 0px 0px 10px;
  color: #fff;
  z-index: 2;
  position: absolute;
}
.route-wrap .hot-route li p {
  color: #fff;
  font-size: 12px;
  margin: 60px 0px 0px 10px;
  z-index: 2;
  position: absolute;
}
.route-wrap .hot-route li span {
  width: 100%;
  height: 100%;
  z-index: 1;
  /* background-color: purple; */
  position: absolute;
  top: 0px;
  left: 0px;
  border-radius: 10px;
  opacity: 0.6;
}
.route-wrap .popular-route {
  width: 100%;
  box-sizing: border-box;
}
.popular-route .popular-item {
  width: 100%;
  height: 150px;
  display: flex;
  flex-wrap: wrap;
  box-sizing: border-box;
  padding: 0px 15px;
}
.popular-route .popular-item .popular-img {
  width: 120px;
  height: 120px;
  border-radius: 10px;
}
.popular-route .popular-item .popular-text {
  margin-left: 15px;
}
.popular-route .popular-item .popular-text span {
  font-size: 12px;
  border-radius: 5px;
  padding: 3px 5px;
  margin-right: 5px;
  background-color: #b689b6;
  color: #ffffff;
}
.popular-route .popular-item .popular-text h3 {
  margin: 0px 0px 10px 0px;
}
.popular-route .popular-item .popular-text p {
  color: #999999;
  font-size: 12px;
  margin: 50px 0px 0px 5px;
}
.popular-route .popular-item .popular-img img {
  max-width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 10px;
}
</style>