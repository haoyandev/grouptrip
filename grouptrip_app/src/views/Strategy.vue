<template>
  <main id="strategypage">
    <mt-tabbar fixed class="tabbar-top">
      <mt-tab-item class="text-item">
        <div class="placebutton">
          <mt-button>
            日本
            <svg class="iicondropdown-white" aria-hidden="true">
              <use xlink:href="#icondropdown-white-copy" />
            </svg>
          </mt-button>
        </div>
        <div class="tabbar-search">
          <svg class="search" aria-hidden="true">
            <use xlink:href="#iconsearch-copy" />
          </svg>
          <input type="text" class="form-text" placeholder="搜索当地玩乐" />
        </div>
      </mt-tab-item>
    </mt-tabbar>
    <div class="strategywrap">
      <div class="top-city" >
        <div class="top-city-title">
          <h3>热门城市</h3>
          <router-link to="javascript;" style="display: flex;align-item:center; line-height: 15px">
            <span style="margin-right: 5px">查看更多</span>
            <svg class="iconforward-small" aria-hidden="true">
              <use xlink:href="#iconforward" />
            </svg>
          </router-link>
        </div>
        <div class="top-city-content">
          <div class="top-city-item" v-for="(t,i) of trip_city" :key="i" :style="{background:'url('+t.cityimg+')',backgroundRepeat:'no-repeat',backgroundSize: 'cover'}" >
            <span>{{t.name}}</span>
            <p>{{t.elname}}</p>
          </div>
        </div>
      </div>
      <div class="city-tips" style="display:none">
        <router-link to="javascript;">
          <div class="city-tips-item">
            <div class="tips-item-bg">
              <h3>景点</h3>
              <p>人气榜</p>
              <span></span>
            </div>
            <div class="tips-item-text">
              <div>
                <span>1</span><p>广州塔</p>
              </div>
              <div>
                <span>2</span><p>中山大学</p>
              </div>
              <div>
                <span>3</span><p>沙面</p>
              </div>
            </div>
            <svg class="iconforward" aria-hidden="true">
              <use xlink:href="#iconforward" />
            </svg>
          </div>
        </router-link>
        <router-link to="javascript;">
          <div class="city-tips-item">
            <div class="tips-item-bg">
              <h3>景点</h3>
              <p>人气榜</p>
              <span></span>
            </div>
            <div class="tips-item-text">
              <div>
                <span>1</span><p>广州塔</p>
              </div>
              <div>
                <span>2</span><p>中山大学</p>
              </div>
              <div>
                <span>3</span><p>沙面</p>
              </div>
            </div>
            <svg class="iconforward" aria-hidden="true">
              <use xlink:href="#iconforward" />
            </svg>
          </div>
        </router-link>
        <router-link to="javascript;">
          <div class="city-tips-item">
            <div class="tips-item-bg">
              <h3>景点</h3>
              <p>人气榜</p>
              <span></span>
            </div>
            <div class="tips-item-text">
              <div>
                <span>1</span><p>广州塔</p>
              </div>
              <div>
                <span>2</span><p>中山大学</p>
              </div>
              <div>
                <span>3</span><p>沙面</p>
              </div>
            </div>
            <svg class="iconforward" aria-hidden="true">
              <use xlink:href="#iconforward" />
            </svg>
          </div>
        </router-link>
      </div>
      <div class="city-strategy">
        <ul
          id="u1"
          class="strategy-items"
          @touchmove="touchmove"
          @touchstart="touchstart"
          @touchend="touchend"
          data-width="300"
          :style="{marginLeft:move.left+'px',width:strategies.length*300+'px'}"
        >
          <li class="strategy-item" v-for="(strategy,s) of strategies" :key="s">
            <div class="cityimg">
              <img :src="strategy.imgpath" alt />
            </div>
            <div class="city-details">
              <h4 class="details-title">{{strategy.title}}</h4>
              <p class="details">{{strategy.details}}</p>
            </div>
          </li>
        </ul>
      </div>
      <div class="travel-sale">
        <div class="travel-sale-title">
          <h3>旅行特价</h3>
        </div>
        <div class="sale-content">
          <router-link to="javascript;" class="sale-item sale-item1" v-for="(s,i) of sales" :key="i" :style="{background:'url('+s.salebg+')',backgroundRepeat:'no-repeat',backgroundSize: 'cover',
          color:s.fcolor
          }">
            <span>{{s.title}}</span>
            <p>{{s.subtitle}}</p>
          </router-link>
        </div>
      </div>
      <div class="essence-notes">
        <div class="essence-title">
          <h3>精华游记</h3>
          <router-link to="javascript;" class="see-more">
            <span style="margin-right: 5px">查看更多</span>
            <svg class="iconforward-small" aria-hidden="true">
              <use xlink:href="#iconforward" />
            </svg>
          </router-link>
        </div>
        <div class="notes">
          <ul class="notes-items" @touchstart="touchstart1" @touchmove="touchmove1" @touchend="touchend1" :style="{marginLeft:move.left1+'px'}">
            <li
              class="notes-item"
              v-for="(item,i) of items"
              :key="i"
              :style="{background:'url('+item.bgpath+')',backgroundRepeat:'no-repeat',backgroundPosition:'center center', backgroundSize: '100%'}"
            >
              <div class="note-title">{{item.title}}</div>
              <div class="personal-msg">
                <div class="personal-head">
                  <img src="../assets/iconfont/girl.png" alt />
                </div>
                <span class="personal-name">{{item.name}}</span>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="strategy-bottom">
        <van-tabs v-model="active" swipeable="">
          <van-tab title="旅伴">
            <div class="bottom1_wrap">
              <div class="wrap-item strategy-wrap-item">
                <div class="wrap-item-content">
                  <div class="personal-pic"></div>
                  <span class="place">泰国,芭提雅</span>
                  <span class="date">10月16日-10月30日</span>
                  <div class="wrap-item-details">
                    <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
                  </div>
                </div>
              </div>
              <div class="wrap-item strategy-wrap-item">
                <div class="wrap-item-content">
                  <div class="personal-pic"></div>
                  <span class="place">泰国,芭提雅</span>
                  <span class="date">10月16日-10月30日</span>
                  <div class="wrap-item-details">
                    <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
                  </div>
                </div>
              </div>
              <div class="wrap-item strategy-wrap-item">
                <div class="wrap-item-content">
                  <div class="personal-pic"></div>
                  <span class="place">泰国,芭提雅</span>
                  <span class="date">10月16日-10月30日</span>
                  <div class="wrap-item-details">
                    <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
                  </div>
                </div>
              </div>
              <div class="wrap-item strategy-wrap-item">
                <div class="wrap-item-content">
                  <div class="personal-pic"></div>
                  <span class="place">泰国,芭提雅</span>
                  <span class="date">10月16日-10月30日</span>
                  <div class="wrap-item-details">
                    <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
                  </div>
                </div>
              </div>
            </div>
          </van-tab>
          <van-tab title="推荐玩法">
            <div class="bottom2_wrap">
              <div class="tips-wrap-item">
                <div class="wrap-item-content">
                  <div class="tips-notes-img">
                    <img src="../assets/citypics/img1998.jpg" alt />
                  </div>
                  <div class="item-details">
                    <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
                  </div>
                  <div class="tips-personal">
                    <div class="personal-head">
                      <img src="../assets/iconfont/girl.png" alt />
                    </div>
                    <span>维多利亚</span>
                    <div class="favorite">
                      <svg class="iconblack_favorite-purple" aria-hidden="true">
                        <use xlink:href="#iconblack_favorite-purple" />
                      </svg>
                      <span>115</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tips-wrap-item">
                <div class="wrap-item-content">
                  <div class="tips-notes-img">
                    <img src="../assets/citypics/img1998.jpg" alt />
                  </div>
                  <div class="item-details">
                    <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
                  </div>
                  <div class="tips-personal">
                    <div class="personal-head">
                      <img src="../assets/iconfont/girl.png" alt />
                    </div>
                    <span>维多利亚</span>
                    <div class="favorite">
                      <svg class="iconblack_favorite-purple" aria-hidden="true">
                        <use xlink:href="#iconblack_favorite-purple" />
                      </svg>
                      <span>115</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tips-wrap-item">
                <div class="wrap-item-content">
                  <div class="tips-notes-img">
                    <img src="../assets/citypics/img1998.jpg" alt />
                  </div>
                  <div class="item-details">
                    <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
                  </div>
                  <div class="tips-personal">
                    <div class="personal-head">
                      <img src="../assets/iconfont/girl.png" alt />
                    </div>
                    <span>维多利亚</span>
                    <div class="favorite">
                      <svg class="iconblack_favorite-purple" aria-hidden="true">
                        <use xlink:href="#iconblack_favorite-purple" />
                      </svg>
                      <span>115</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tips-wrap-item">
                <div class="wrap-item-content">
                  <div class="tips-notes-img">
                    <img src="../assets/citypics/img1998.jpg" alt />
                  </div>
                  <div class="item-details">
                    <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
                  </div>
                  <div class="tips-personal">
                    <div class="personal-head">
                      <img src="../assets/iconfont/girl.png" alt />
                    </div>
                    <span>维多利亚</span>
                    <div class="favorite">
                      <svg class="iconblack_favorite-purple" aria-hidden="true">
                        <use xlink:href="#iconblack_favorite-purple" />
                      </svg>
                      <span>115</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </van-tab>
        </van-tabs>
      </div>
    </div>
    <Sendgroup></Sendgroup>
    <main-tab-bar></main-tab-bar>
  </main>
</template>

<script>
import Sendgroup from "../components/common/Sendgroup";
import MainTabBar from "../components/mainTabBar";
export default {
  data() {
    return {

      width: 0,
      active:1,//保存底部推荐面板当前显示的子面板id
      trip_city:[
        {name:"大阪",elname:"Osaka",
        cityimg:require('../assets/citypics/img1998.jpg')},
      ],
      strategies: [
        {
          imgpath: require("../assets/citypics/save.jpg"),
          title: "大阪",
          details:
            "有着悠久文化历史的大阪是日本第二大城市，全国经济、政治和文化的中心，交通便利、贸易发达，是深受国内外旅行者喜爱的人气城市。大阪位于日本本州中西部，面积是全国都道府县中最小的，但人口却仅次于首都东京。"
        },
        {
          imgpath: require("../assets/citypics/save.jpg"),
          title: "东京",
          details:
            "有着悠久文化历史的大阪是日本第二大城市，全国经济、政治和文化的中心，交通便利、贸易发达，是深受国内外旅行者喜爱的人气城市。大阪位于日本本州中西部，面积是全国都道府县中最小的，但人口却仅次于首都东京。"
        },
        {
          imgpath: require("../assets/citypics/save.jpg"),
          title: "京都",
          details:
            "有着悠久文化历史的大阪是日本第二大城市，全国经济、政治和文化的中心，交通便利、贸易发达，是深受国内外旅行者喜爱的人气城市。大阪位于日本本州中西部，面积是全国都道府县中最小的，但人口却仅次于首都东京。"
        },
        {
          imgpath: require("../assets/citypics/save.jpg"),
          title: "北海道",
          details:
            "有着悠久文化历史的大阪是日本第二大城市，全国经济、政治和文化的中心，交通便利、贸易发达，是深受国内外旅行者喜爱的人气城市。大阪位于日本本州中西部，面积是全国都道府县中最小的，但人口却仅次于首都东京。"
        }
      ],
      sales:[
        {title:'特价酒店',subtitle:'388元起',fcolor:' #8134af',
        salebg:require("../assets/cardpics/2.jpg")},
        {title:'日游小团',subtitle:'已售22686',fcolor:'#ea7070',
        salebg:require("../assets/cardpics/6.jpg")},
        {title:'WIFI电话卡',subtitle:'已售610300',
        fcolor:'#20366b',
        salebg:require("../assets/cardpics/7.jpg")},
        {title:'签证',subtitle:'已售100855',
        fcolor:'#d25565',
        salebg:require("../assets/cardpics/3.jpg")},
        {title:'门票票券',subtitle:'已售出81006',
        fcolor:'#f0b775',
        salebg:require("../assets/cardpics/4.jpg")},
        {title:'特价机票',subtitle:'533元起',
        fcolor:'#003399',
        salebg:require("../assets/cardpics/10.jpg")}
      ],
      items: [
        {
          title: "日本环球影城 | 圣诞",
          name: "维多利亚",
          headpath: require("../assets/iconfont/girl.png"),
          bgpath: require("../assets/citypics/img1957.jpg")
        },
        {
          title: "大阪京都美食集 | 关西",
          name: "维多利亚",
          headpath: require("../assets/iconfont/girl.png"),
          bgpath: require("../assets/citypics/img1998.jpg")
        },
        {
          title: "大阪京都美食集 | 关西",
          name: "维多利亚",
          headpath: require("../assets/iconfont/girl.png"),
          bgpath: require("../assets/citypics/img1998.jpg")
        },
        {
          title: "大阪京都美食集 | 关西",
          name: "维多利亚",
          headpath: require("../assets/iconfont/girl.png"),
          bgpath: require("../assets/citypics/img1996.jpg")
        }
      ],
      imgs: {},
      move: {
        start: 0,
        left: 0,
        end: 0,
        start1: 0,
        left1: 0,
        end1: 0
      },
      selected: "bottom1" //保存底部推荐面板当前显示的子面板id
    };
  },
  methods: {
    touchmove(e) {
      this.move.left =
        e.changedTouches[0].pageX - this.move.start + this.move.end;
      if (this.move.left >= 0) {
        this.move.left = 0;
      }
      if (this.move.left <= -800) {
        this.move.left = -800;
      }
    },
    touchstart(e) {
      this.move.start = e.changedTouches[0].pageX;
    },
    touchend(e) {
      this.move.end = this.move.left;
    },

    touchmove1(e) {
      this.move.left1 =
        e.changedTouches[0].pageX - this.move.start1 + this.move.end1;
      if (this.move.left1 >= 0) {
        this.move.left1 = 0;
      }
      if (this.move.left1 <= -965) {
        this.move.left1 = -965;
      }
    },
    touchstart1(e) {
      this.move.start1 = e.changedTouches[0].pageX;
    },
    touchend1(e) {
      this.move.end1 = this.move.left1;
    }
  },
  components: {
    MainTabBar,
    Sendgroup
  }
};
</script>
<style>
ul,
li {
  padding: 0;
  margin: 0;
  list-style: none;
}
#strategypage{
  transition: all 0.1s linear;
}
.blank {
  height: 50px;
}
#strategypage {
  position: relative;
}
#strategypage .mint-tabbar > .mint-tab-item.is-selected {
  background: url("../assets/citypics/img1996.jpg");
  background-size: 100%;
  background-position: center;
}
#strategypage .tabbar-top {
  position: relative;
  height: 100px;
}
.placebutton .mint-button--default {
  background-color: transparent;
  border: none;
  box-shadow: none;
  position: absolute;
  color: #fff;
  top: 12px;
  left: 5px;
}
.mint-button-text {
  display: flex;
}
.text-item .mint-tab-item-label {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
#strategypage .form-text {
  border: none;
  height: 20px;
  left: 23px;
  width: 100%;
  background-color: transparent;
  position: relative;
}
#strategypage .tabbar-search {
  margin-left: 10px;
  border-radius: 30px;
  width: 65%;
  height: 22px;
  display: flex;
  position: relative;
  right: 50px;
  top: 13px;
  background-color: #fff;
  opacity: 0.6;
}
#strategypage .tabbar-search .search {
  position: absolute;
  margin-top: 2.5px;
  margin-left: 5px;
}
.strategywrap {
  width: 100%;
  height: 100%;
  position: relative;
  background-color: #e6e6e6;
}
.strategywrap .top-city {
  width: 100%;
  height: 230px;
  background-color: #fff;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
.top-city-title,
.travel-sale-title,
.essence-title {
  display: flex;
  justify-content: space-between;
  height: 50px;
}
.top-city-title,
.travel-sale-title,
.essence-title h3 {
  margin-left: 12px;
}
.top-city-title a,
.essence-title a {
  display: block;
  margin: 18px 9px 0 0;
  text-decoration: none;
  font-size: 10px;
  height: 15px;
  color: #b689b0;
  display: flex;
  align-items: center;
  line-height: 15px;
}
.top-city-title a .iconforward {
  margin-left: -5px;
}
.top-city-content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 0 12px 0 12px;
}
.top-city-content .top-city-item {
  width: 31%;
  height: 70px;
  border-radius: 10px;
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.top-city-content .top-city-item span,.top-city-content .top-city-item p{
  display: block;
  color: #fff;
}
.top-city-content .top-city-item  p{
  font-size: 12px;
  font-weight: lighter;
}
.city-strategy {
  width: 100%;
  height: 140px;
  margin-top: 10px;
  background: #fff;
  padding-top: 20px;
  overflow: hidden;
}
.city-strategy .strategy-items {
  padding-left: 15px;
}
.city-strategy ul li,
.notes ul li {
  margin-right: 20px;
}
.city-strategy ul,
.notes ul {
  display: flex;
}
.city-strategy ul .strategy-item {
  display: flex;
}
.city-strategy .strategy-item .cityimg {
  width: 80px;
}
.city-strategy .strategy-item .city-details {
  width: 200px;
  height: 100px;
  margin-top: 12.5px;
  background-color: #e6e6e6;
}
.city-strategy .cityimg img {
  width: 100%;
}
.city-strategy .strategy-item .city-details .details-title {
  margin: 10px;
}
.city-strategy .strategy-item .city-details p {
  font-size: 10px;
  color: #858282;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/
  -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 3; /** 显示的行数 **/
  overflow: hidden;
  padding-left: 10px;
}
.strategywrap .travel-sale {
  width: 100%;
  height: 230px;
  background-color: #fff;
  margin-top: 10px;
}
.sale-content {
  height: 160px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 0 12px 0 12px;
}
/* .sale-content .sale-item1 {
  background-image: url("../assets/cardpics/2.jpg");
  color: #8134af;
}
.sale-content .sale-item2 {
  background-image: url("../assets/cardpics/6.jpg");
  color: #ea7070;
}
.sale-content .sale-item3 {
  background-image: url("../assets/cardpics/7.jpg");
  color: #20366b;
}
.sale-content .sale-item4 {
  background-image: url("../assets/cardpics/3.jpg");
  color: #d25565;
}
.sale-content .sale-item5 {
  background-image: url("../assets/cardpics/4.jpg");
  color: #f0b775;
}
.sale-content .sale-item6 {
  background-image: url("../assets/cardpics/10.jpg");
  color: #003399;
} */
.sale-content .sale-item {
  width: 31%;
  height: 70px;
  border-radius: 10px;
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  background-size: 100%;
  text-decoration: none;
}
.sale-content .sale-item span {
  font-size: 15px;
  margin: 10px 0 -3px 8px;
  font-weight: bold;
}
.sale-content .sale-item p {
  font-size: 8px;
  margin: 5px 0px 0px 8px;
}
.essence-notes {
  width: 100%;
  height: 260px;
  background-color: #ffffff;
  margin-top: 10px;
  margin-bottom: 10px;
}
.notes {
  width: 100%;
  overflow: hidden;
  padding-top: 10px;
}
.notes-items {
  width: 1340px;
  margin-left: 15px;
}
.notes-item:first-child{
  margin-left:20px;
}
.notes .notes-item {
  width: 320px;
  height: 160px;
  background-image: url("../assets/citypics/img1957.jpg");
  background-size: 100%;
  border-radius: 10px;
  position: relative;
}
.note-title {
  color: #fff;
  position: absolute;
  top: 100px;
  left: 8px;
}
.notes-item .personal-msg {
  display: flex;
  height: 40px;
  width: 100%;
  position: absolute;
  bottom: 2px;
  align-items: center;
  left: 8px;
}
.personal-msg .persoanl-head {
  width: 50px;
  height: 50px;
  border-radius: 10px;
}
.personal-msg .persoanl-head img {
  width: 100%;
  height: auto;
}
.personal-msg span {
  color: #fff;
  font-size: 5px;
  margin-left: 5px;
}
.bottom1_wrap {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  background-color: #fff;
  justify-content: space-around;
  padding-top:15px;
}
.strategy-wrap-item {
  width: 46%;
}
.bottom2_wrap {
  width: 100%;
  background-color: #fff;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  padding-top:15px;
}
.tips-wrap-item {
  height: 280px;
  border-radius: 10px;
  position: relative;
  margin-bottom: 15px;
  width: 46%;
}
.tips-wrap-item .wrap-item-content {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.wrap-item-content .tips-notes-img {
  width: 100%;
  height: 200px;
  overflow: hidden;
  border-radius: 10px;
}
.wrap-item-content .tips-notes-img img {
  width: 100%;
  height: 100%;
}
.tips-wrap-item .item-details {
  height: 60px;
  background-color: #fff;
}
.tips-wrap-item .item-details p {
  text-overflow: -o-ellipsis-lastline;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  line-clamp: 2;
  -webkit-box-orient: vertical;
}
.tips-personal {
  display: flex;
  position: relative;
  width: 100%;
  height: 23px;
  align-items: center;
}
.tips-personal span {
  color: #999999;
  font-size: 5px;
  margin-left: 5px;
}
.tips-personal .favorite {
  position: absolute;
  right: 2px;
}
#strategypage {
  transition: opacity 0.6s linear;
  transition: marginLeft 0.6s linear;
}
.strategywrap .city-tips{
  width: 100%;
  height: 250px;
  background: #fff;
  padding: 0px 5px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  box-sizing: border-box;
  padding-top: 15px;
}
.strategywrap .city-tips .city-tips-item{
  width: 100%;height: 65px;
  display: flex;
  justify-content: space-around;
  align-items: center;
  margin-bottom: 15px;
}
.city-tips-item .tips-item-bg{
  width: 65px;height: 65px;
  background: url('../assets/citypics/beijin1.jpg');
  background-size:cover;
  border-radius: 6px;
  display: flex;
  flex-direction: column;
  align-content: center;
  justify-content: center;
  text-align: center;
  color: #fff;
  position: relative;
}
.city-tips-item .tips-item-text{
  width: 60%;
  height: 65px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.city-tips-item .tips-item-text>div{
  margin-bottom: 5px;
}
.city-tips-item .tips-item-text p{
  display: inline;
  font-size: 14px;
  margin-left: 10px;
  font-weight: bold;
}
.city-tips-item .tips-item-bg h3{
  margin: 0px 0px 5px 0px;
  z-index: 2;
}
.city-tips-item .tips-item-bg p{
  margin: 0px;
  font-weight: lighter;
  z-index: 2;
}
.city-tips-item .tips-item-bg span{
  background-color: #8134af;
  opacity: 0.7;
  z-index: 1;
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  border-radius: 6px;
}

</style>