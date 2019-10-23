<template>
  <main id="go-page">
    <mt-tabbar fixed class="go-head">
      <mt-tab-item class="go-head-item">
        <svg class="zuojiantou_small" aria-hidden="true">
          <use xlink:href="#iconzhixiangzuozuojiantou"></use>
        </svg>
        <div class="tabbar-search">
            <svg class="search" aria-hidden="true">
              <use xlink:href="#iconsearch-copy"></use>
            </svg>
            <input type="text" class="form-text" placeholder="搜索国家、城市">
        </div>
      </mt-tab-item>
    </mt-tabbar>
    <div class="go-zt">
      <ul>
        <li v-for="(ele,l) in gos_zt" :key="l">
          <span
            @click="active=l"
            href="javascript:;"
            :style="l===active&&'color:#111111;font-weight:bolder;background:white;border-left:2px solid #b689b6'"
          >{{l}}</span>
        </li>
      </ul>
    </div>
    <mt-tab-container v-model="active" class="go-container">
        <div class="active" :style="active===i&&'opacity:1;'" v-for="(ele,i) of gos_zt" :key="i">
          <mt-tab-container-item :id="i">
            <div style="text-align:left;" v-show="i==='热门城市'&&late!=false">最近浏览</div>
            <router-link to="javascript;" class="trip-a" v-show="i==='热门城市'" v-for="(trips,p) of late" :key="p">{{trips.cname}}</router-link>
            <router-link to="javascript"
              @click="add_trip(trip)"
              class="trip-a"
              href="javascript:;"
              v-for="(trip,j) of gos_zt[i]"
              :key="'index'+j" :style="{background:'url('+trip.cityimg+')',backgroundRepeat:'no-repeat',backgroundPosition:'center center', backgroundSize: 'cover'}"
            >
            <span>{{trip.cname}}</span>
            </router-link>
          </mt-tab-container-item>
        </div>
      </mt-tab-container>
  </main>
</template>
<script>
export default {
  data() {
    return {
      active: "热门城市",
      late: [],
      gos_zt: {
        //主要的目的地；
        热门城市: [
          {cname: "京都", cityimg:require("../../assets/citypics/img1998.jpg")},
          {cname:"北京", cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"巴黎", cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"广州", cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"巴厘岛",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"成都",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"洛杉矶",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"纽约",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"上海",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"首尔",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"重庆",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"台北",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"曼谷",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"巴塞罗那",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"杭州",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"新加坡",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"北海道",cityimg:require("../../assets/citypics/beijin1.jpg")}
        ],
        中国内地: [
          {cname:"北京", cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"上海",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"广州", cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"成都",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"杭州",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"重庆",cityimg:require("../../assets/citypics/beijin1.jpg")},
        ],
        中国港澳台: [
          {cname:"香港",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"澳门",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"台湾",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"垦丁",cityimg:require("../../assets/citypics/beijin1.jpg")},
        ],
        日韩朝: [
          {cname:"东京",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"首尔",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"大阪",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"京都",cityimg:require("../../assets/citypics/beijin1.jpg")},
        ],
        东南亚: [
          {cname:"曼谷",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"吉隆坡",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"新加坡",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"清迈",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"普吉岛",cityimg:require("../../assets/citypics/beijin1.jpg")},
          {cname:"巴厘岛",cityimg:require("../../assets/citypics/beijin1.jpg")}
        ],
        亚洲其他: [
          {cname:"洛杉矶",cityimg:require("../../assets/citypics/LA.jpg")},
          {cname:"纽约",cityimg:require("../../assets/citypics/LA.jpg")},
        ],
        欧洲: [
          {cname:"巴黎",cityimg:require("../../assets/citypics/LA.jpg")},
          {cname:"巴塞罗那",cityimg:require("../../assets/citypics/LA.jpg")}
        ],
        北美洲: [
          {cname:"洛杉矶",cityimg:require("../../assets/citypics/LA.jpg")},
          {cname:"纽约",cityimg:require("../../assets/citypics/LA.jpg")},
        ],
        大洋洲: [
          {cname:"洛杉矶",cityimg:require("../../assets/citypics/LA.jpg")},
          {cname:"纽约",cityimg:require("../../assets/citypics/LA.jpg")},
        ],
        南美洲: [
          {cname:"洛杉矶",cityimg:require("../../assets/citypics/LA.jpg")},
          {cname:"纽约",cityimg:require("../../assets/citypics/LA.jpg")},
          // [{cname:"巴西",cityimg:}]
        ],
        非洲: [
          {cname:"洛杉矶",cityimg:require("../../assets/citypics/LA.jpg")},
          {cname:"纽约",cityimg:require("../../assets/citypics/LA.jpg")},
        ],
        南极洲: [
          {cname:"洛杉矶",cityimg:require("../../assets/citypics/LA.jpg")},
          {cname:"纽约",cityimg:require("../../assets/citypics/LA.jpg")},
        ]
      }
    };
  },
  methods: {
    add_trip(trip) {
      this.late.push(trip);
      var result = [];
      var obj = {};
      for (var i of this.late) {
        if (!obj[i]) {
          result.push(i);
          obj[i] = 1;
        }
      }
      this.late = result;
    }
  }
};
</script>
<style>
#go-page{
  width: 100%;
  position: relative;
}
#go-page .mint-tabbar > .mint-tab-item.is-selected{
  background-color: #ffffff;
}
.go-head .mint-tab-item .mint-tab-item-label{
  display: flex;
  align-items: center;
  width: 100% !important;
}
#go-page .go-head{
  display: flex;
  height: 40px;
  align-items: center;
  justify-content: space-around;
  border-bottom: 1px solid #ececec;
  position: fixed;
  top: 0;
}
#go-page .tabbar-search{
  width: 80%;
  height: 25px;
}
* {
  transition: all 0.3s linear;
}
.active {
  opacity: 0;
}
.trip-a {
  width: 113px;
  height: 80px;
  margin: 0 2px 2px 0;
  display: inline-block;
  background: pink;
  line-height: 80px;
  text-align: center;
}
a {
  text-decoration: none;
  color: #1e1e1e;
  font-size: 15px;
}
.go-head {
  width: 100%;
  height: 50px;
}
.go-zt, .go-container{
  margin-top: 50px;
}

.go-zt > ul {
  list-style: none;
  float: left;
  padding: 0;
}
.go-zt > ul > li > span {
  display: inline-block;
  text-align: center;
  color:#5f5f5f;
  line-height: 50px;
  border-top: 1px solid #e4e5e5;
  border-bottom: 1px solid #e4e5e5;
  height: 50px;
  background: #f1f1f1;
  width: 118px;
  box-sizing: border-box;
}
.go-container a{
  border-radius: 10px;
  margin-left: 10px;
  margin-bottom: 10px;
  color: #ffffff;
  font-size: 16px;
}
.go-container .mint-tab-container-item{
  display: flex;
  flex-wrap: wrap;
  align-items: center;
}
</style>