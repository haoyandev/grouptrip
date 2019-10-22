<template>
  <main id="note-page">
    <div class="tabbar-top">
      <div class="tabbar-search">
          <svg class="search" aria-hidden="true">
            <use xlink:href="#iconsearch-copy"></use>
          </svg>
          <input type="text" class="form-text" placeholder="搜索游记">
      </div>
      <router-link to="javascript;" class="start-group">发布</router-link>
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
          <img :src="imgs[s]">
        </li>
      </ul>
    </div>
    <div class="note-wrap">
      <div class="topic-suggest">
        <h3>话题推荐</h3>
        <ul class="topic-ul">
          <li class="topic-li" v-for="(item,i) of items" :key="i" :style="{background:'url('+item.imgpath+')',backgroundRepeat:'no-repeat',backgroundPosition:'center center', backgroundSize: '100%'}">
            <h5>{{item.title}}</h5>
            <p>{{item.subtitle}}</p>
            <span></span>
          </li>
        </ul>
      </div>
      <van-tabs v-model="active" swipeable class="note-tabs">
        <van-tab title="全部游记">
          <div class="all-item">
            <div class="item-text">
              <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
              <div class="item-head">
                <img src="../assets/citypics/heimen.jpg" alt="">
              </div>
              <span class="text-personal">发表于2018-12-01</span>
            </div>
            <div class="item-img">
                <img src="../assets/citypics/food01.jpg" alt="">
            </div>
            <div class="item-tag">
              <span>关西攻略</span>
              <span>日本美食</span>
            </div>
            <div class="item-icon">
              <svg class="iconblack_favorite-purple" aria-hidden="true">
                <use xlink:href="#iconblack_favorite-purple"></use>
              </svg>
              <span>128</span>
              <svg class="iconcomment" aria-hidden="true">
                <use xlink:href="#iconcomment"></use>
              </svg>
              <span>83</span>
            </div>
            <van-divider />
          </div>
          <div class="all-item">
            <div class="item-text">
              <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
              <div class="item-head">
                <img src="../assets/citypics/heimen.jpg" alt="">
              </div>
              <span class="text-personal">发表于2018-12-01</span>
            </div>
            <div class="item-img">
                <img src="../assets/citypics/food01.jpg" alt="">
            </div>
            <div class="item-tag">
              <span>关西攻略</span>
              <span>日本美食</span>
            </div>
            <div class="item-icon">
              <svg class="iconblack_favorite-purple" aria-hidden="true">
                <use xlink:href="#iconblack_favorite-purple"></use>
              </svg>
              <span>128</span>
              <svg class="iconcomment" aria-hidden="true">
                <use xlink:href="#iconcomment"></use>
              </svg>
              <span>83</span>
            </div>
            <van-divider style="height:1px;width:100%;margin:0px;"/>
          </div>
          <div class="all-item">
            <div class="item-text">
              <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
              <div class="item-head">
                <img src="../assets/citypics/heimen.jpg" alt="">
              </div>
              <span class="text-personal">发表于2018-12-01</span>
            </div>
            <div class="item-img">
                <img src="../assets/citypics/food01.jpg" alt="">
            </div>
            <div class="item-tag">
              <span>关西攻略</span>
              <span>日本美食</span>
            </div>
            <div class="item-icon">
              <svg class="iconblack_favorite-purple" aria-hidden="true">
                <use xlink:href="#iconblack_favorite-purple"></use>
              </svg>
              <span>128</span>
              <svg class="iconcomment" aria-hidden="true">
                <use xlink:href="#iconcomment"></use>
              </svg>
              <span>83</span>
            </div>
            <van-divider style="height:1px;width:100%;margin:0px;"/>
          </div>
        </van-tab>
        <van-tab title="宝藏游记">
          <div class="note-top">
            <h2>宝藏游记</h2>
            <div class="notetop-img">
              <img src="../assets/citypics/food01.jpg" alt="">
            </div>
            <div class="item-text">
              <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
              <div class="item-head">
                <img src="../assets/citypics/heimen.jpg" alt="">
              </div>
              <span class="text-personal"><b>维多利亚</b></span>
              <span class="text-personal">在<b>日本</b></span>
              <div class="item-icon">
                <svg class="iconblack_favorite-purple" aria-hidden="true">
                  <use xlink:href="#iconblack_favorite-purple"></use>
                </svg>
                <span>128</span>
                <svg class="iconcomment" aria-hidden="true">
                  <use xlink:href="#iconcomment"></use>
                </svg>
                <span>83</span>
              </div>
            </div>
            <van-divider />
          </div>    
          <div class="history-note">
            <h2>历史榜首宝藏</h2>
            <div class="all-item">
              <div class="item-text">
                <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
                <div class="item-head">
                  <img src="../assets/citypics/heimen.jpg" alt="">
                </div>
                <span class="text-personal">发表于2018-12-01</span>
              </div>
              <div class="item-img">
                  <img src="../assets/citypics/food01.jpg" alt="">
              </div>
              <div class="item-tag">
                <span>关西攻略</span>
                <span>日本美食</span>
              </div>
              <div class="item-icon">
                <svg class="iconblack_favorite-purple" aria-hidden="true">
                  <use xlink:href="#iconblack_favorite-purple"></use>
                </svg>
                <span>128</span>
                <svg class="iconcomment" aria-hidden="true">
                  <use xlink:href="#iconcomment"></use>
                </svg>
                <span>83</span>
              </div>
              <van-divider />
            </div>
            <div class="all-item">
              <div class="item-text">
                <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
                <div class="item-head">
                  <img src="../assets/citypics/heimen.jpg" alt="">
                </div>
                <span class="text-personal">发表于2018-12-01</span>
              </div>
              <div class="item-img">
                  <img src="../assets/citypics/food01.jpg" alt="">
              </div>
              <div class="item-tag">
                <span>关西攻略</span>
                <span>日本美食</span>
              </div>
              <div class="item-icon">
                <svg class="iconblack_favorite-purple" aria-hidden="true">
                  <use xlink:href="#iconblack_favorite-purple"></use>
                </svg>
                <span>128</span>
                <svg class="iconcomment" aria-hidden="true">
                  <use xlink:href="#iconcomment"></use>
                </svg>
                <span>83</span>
              </div>
              <van-divider />
            </div>
          </div>
        </van-tab>
        <van-tab title="玩法路线">3</van-tab>
        <van-tab title="最新发表">
          <div class="all-item">
            <div class="item-text">
              <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
              <div class="item-head">
                <img src="../assets/citypics/heimen.jpg" alt="">
              </div>
              <span class="text-personal">发表于2018-12-01</span>
            </div>
            <div class="item-img">
                <img src="../assets/citypics/food01.jpg" alt="">
            </div>
            <div class="item-tag">
              <span>关西攻略</span>
              <span>日本美食</span>
            </div>
            <div class="item-icon">
              <svg class="iconblack_favorite-purple" aria-hidden="true">
                <use xlink:href="#iconblack_favorite-purple"></use>
              </svg>
              <span>128</span>
              <svg class="iconcomment" aria-hidden="true">
                <use xlink:href="#iconcomment"></use>
              </svg>
              <span>83</span>
            </div>
            <van-divider />
          </div>
          <div class="all-item">
            <div class="item-text">
              <h3>从平价小吃到米其林——大阪京都神户美食集(10日20店详记）</h3>
              <div class="item-head">
                <img src="../assets/citypics/heimen.jpg" alt="">
              </div>
              <span class="text-personal">发表于2018-12-01</span>
            </div>
            <div class="item-img">
                <img src="../assets/citypics/food01.jpg" alt="">
            </div>
            <div class="item-tag">
              <span>关西攻略</span>
              <span>日本美食</span>
            </div>
            <div class="item-icon">
              <svg class="iconblack_favorite-purple" aria-hidden="true">
                <use xlink:href="#iconblack_favorite-purple"></use>
              </svg>
              <span>128</span>
              <svg class="iconcomment" aria-hidden="true">
                <use xlink:href="#iconcomment"></use>
              </svg>
              <span>83</span>
            </div>
            <van-divider />
          </div>
        </van-tab>
      </van-tabs>
    </div>
    <main-tab-bar></main-tab-bar>
  </main>
</template>
<script>
import MainTabBar from '../components/mainTabBar'
export default {
  created() {
    this.a = setInterval(() => {
      this.i++;
    }, 3000);
  },
  components:{
    MainTabBar,
  },
  data() {
    return {
      active:0,
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
      ],
      items:[
        {title:'#香港购物指南',subtitle:'购物',imgpath:require("../assets/citypics/city12.jpg")},
        {title:'#首尔小众秘境推荐',subtitle:'人少景美',
        imgpath:require("../assets/citypics/city10.jpg")},
        {title:'#大阪+京都',subtitle:'关西',imgpath:require("../assets/citypics/city8.jpg")},
        {title:'#大马学潜水',subtitle:'潜水',imgpath:require("../assets/citypics/city12.jpg")},
        {title:'#泰国美食推荐',subtitle:'种草绿皮书',imgpath:require("../assets/citypics/city7.jpg")},
        {title:'#新加坡网红打卡地',subtitle:'拍照',imgpath:require("../assets/citypics/city6.jpg")}
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
        }, 200);
      }
      var width = this.innerWidth * (this.imgs.length + 1) + "px";
      var marginLeft = -this.i * this.innerWidth + -this.leftsize / 5 + "px";
      return { width, marginLeft };
    }
  },
  methods: {
    time(num) {
      console.log(num);
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
          }, 200);
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
#note-page .tabbar-top{
  width: 100%;
  height: 70px;
  display: flex;
  align-items: center;
  justify-content: space-around;
}
#note-page .tabbar-top .tabbar-search{
  width: 70%;
}
#note-page .tabbar-top .start-group{
  margin-top: 0px;
}
.li-border{
  border:2px solid#111111;
  border-radius: 10px;
}
.carousel-ul{
  display: flex;
  width: 100%;
  list-style: none;
  padding:0;
}
.carousel-ul>li{
  width: 50px;
  height: 50px;
  box-sizing: border-box;
  padding:2px;
  text-align:center;
  overflow: hidden;
  border-radius: 10px;
}
.carousel-ul>li>img{
  max-width: 100%;height: 100%;
  object-fit: cover;
}
.hasTran {
  transition: all .25s linear;
}
.carousel {
  overflow: hidden;
}
.carousel-item {
  float: left;
}
.carousel-item img{
  width: 100%;
  object-fit: cover;
  -webkit-filter: blur(4px);filter: blur(4px);
}
.note-wrap{
  width: 100%;
  position: relative;
}
.van-divider{
  height:1px;width:100%;margin:0px;
}
.note-tabs .van-tabs__line{
  background-color: #b689b6;
}
.note-wrap .topic-suggest{
  width: 100%;
  height:150px;
  overflow: hidden;
}
.note-wrap .topic-suggest h3{
  margin-left: 10px;
}
.note-wrap .topic-suggest h5{
  margin: 10px 10px 5px 10px;
  color: #fff;
  position: absolute;
  z-index: 2;
}
.note-wrap .topic-suggest p{
  font-size: 10px;
  color: #fff;
  margin: 0px 0px 0px 10px;
  
  position: absolute;
  z-index: 2;
  bottom:5px;
}
.note-wrap .topic-suggest span::after{
  content: "";
  background-color: #e59572;
  opacity: 0.7;
  z-index: 1;
  position: absolute;
  width: 100%;height: 100%;
  left: 0;top: 0;
  border-radius: 6px;
}
.note-wrap .topic-suggest ul{
  display: flex;
  margin-left: 10px;
  width:630px;
}
.note-wrap .topic-suggest ul .topic-li{
  width: 100px;
  height: 60px;
  background-size:100%;
  border-radius: 6px;
  position: relative;
  margin-right: 10px;
}
.note-wrap .all-item{
  width: 100%;
  height: 200px;
  display: flex;
  flex-wrap: wrap;
  padding: 15px 15px 0px 15px;
  box-sizing: border-box;
}
.note-wrap .all-item .item-text{
  width: 50%;
  padding-right: 8px;
  box-sizing: border-box;
  position: relative;
}
.note-wrap .all-item .item-text h3{
  margin: 0;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/    -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 3; /** 显示的行数 **/
  overflow: hidden;
}
.item-text .item-head{
  width: 30px;
  height: 30px;
}
.note-wrap .all-item .item-text .item-head{
  position: absolute;
  bottom: 30px;
}
.item-text .item-head img{
  width: 100%;
  border-radius: 30px;
}
.item-text .text-personal{
  font-size: 13px;
  font-weight: lighter;
}
.note-wrap .all-item .item-text span{
  position: absolute;
  left: 35px;
  bottom: 37px;
}
.note-wrap .all-item .item-img{
  width: 50%;
}
.note-wrap .all-item .item-img img{
  width: 100%;
  border-radius: 6px;
}
.note-wrap .all-item .item-tag{
  width: 70%;
  font-size: 12px;
  margin-bottom: 15px;
}
.note-wrap .all-item .item-tag span{
  border:1px solid #b689b6;
  border-radius: 5px;
  padding: 3px 5px;
  margin-right: 5px;
  color: #999999;
}
.item-icon{
  font-size: 13px;
  display: flex;
  justify-content: center;
}
.item-icon span{
  margin-left: 5px;
}
.item-icon .iconcomment{
  margin-left: 15px;
}
.note-wrap .note-top{
  width: 100%;
  height: 360px;
  display: flex;
  flex-wrap: wrap;
  padding: 15px 15px 0px 15px;
  box-sizing: border-box;
  position: relative;
}
.note-top h2,.history-note h2{
  margin: 0px 0px 15px 0px;
  font-weight: lighter;
}
.history-note{
  width: 100%;
}
.history-note h2{
  margin-left: 15px;
  margin-top: 15px;
}
.note-top h3{
  margin-bottom: 15px;
}
.note-top .notetop-img{
  width: 100%;
  height: 160px;
  overflow: hidden;
  border-radius: 6px;
}
.note-top .notetop-img img{
  width: 100%;
  border-radius: 6px;
}
.note-top .item-text .text-personal{
  position: relative;
  left: 40px;
  bottom: 27px;
  margin-left: 5px;
}
.note-top .item-icon{
  position: absolute;
  right: 15px;
  bottom: 30px;
}
</style>