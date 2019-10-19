<template>
  <div>
    <div class="go-head">全部目的地</div>
    <div class="go-zt">
      <ul>
        <li v-for="(ele,l) in gos_zt" :key="l">
          <span
            @click="active=l"
            href="javascript:;"
            :style="l===active&&'color:#02db94;background:white;border:0px;'"
          >{{l}}</span>
        </li>
      </ul>
    </div>
    <div>
      <mt-tab-container v-model="active">
        <div class="active" :style="active===i&&'opacity:1;'" v-for="(ele,i) of gos_zt" :key="i">
          <mt-tab-container-item :id="i">
            <div style="text-align:left;" v-show="i==='热门城市'&&late!=false">最近浏览</div>
            <span class="trip-a" v-show="i==='热门城市'" v-for="(trips,p) of late" :key="p">{{trips}}</span>
            <div style="text-align:left;">热门推荐</div>
            <span
              @click="add_trip(trip)"
              class="trip-a"
              href="javascript:;"
              v-for="(trip,j) of gos_zt[i]"
              :key="'index'+j"
            >{{trip}}</span>
          </mt-tab-container-item>
        </div>
      </mt-tab-container>
    </div>
  </div>
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
          "京都",
          "北京",
          "巴黎",
          "广州",
          "巴厘岛",
          "南京",
          "西安",
          "伦敦",
          "成都",
          "洛杉矶",
          "纽约",
          "上海",
          "首尔",
          "重庆",
          "台北",
          "曼谷",
          "巴塞罗那",
          "杭州",
          "新加坡",
          "北海道"
        ],
        中国内地: [
          "北京",
          "上海",
          "广州",
          "西安",
          "成都",
          "杭州",
          "重庆",
          "南京",
          "武汉",
          "长沙",
          "天津",
          "大理",
          "昆明",
          "厦门",
          "青岛",
          "大连",
          "太原",
          "拉萨"
        ],
        中国港澳台: [
          "香港",
          "澳门",
          "台湾",
          "台北",
          "垦丁",
          "高雄市",
          "花莲",
          "台中市"
        ],
        日韩朝: [
          "东京",
          "首尔",
          "大阪",
          "京都",
          "奈良",
          "济州岛",
          "札幌",
          "济州市"
        ],
        东南亚: [
          "曼谷",
          "吉隆坡",
          "新加坡",
          "清迈",
          "普吉岛",
          "芭提雅",
          "暹粒",
          "巴厘岛"
        ],
        亚洲其他: [
          "伊斯坦布尔",
          "迪拜",
          "加德满都",
          "科伦坡",
          "斯里兰卡康堤",
          "阿布扎比",
          "马尔代夫",
          "多哈"
        ],
        欧洲: [
          "巴黎",
          "罗马",
          "威尼斯",
          "巴塞罗那",
          "米兰",
          "伦敦",
          "慕尼黑",
          "阿姆斯特丹"
        ],
        北美洲: [
          "洛杉矶",
          "纽约",
          "旧金山",
          "拉斯维加斯",
          "波士顿",
          "奥兰多",
          "芝加哥"
        ],
        大洋洲: [
          "悉尼",
          "墨尔本",
          "奥克兰",
          "黄金海岸",
          "布里斯班",
          "皇后镇",
          "基督城",
          "凯恩斯"
        ],
        南美洲: [
          "利马",
          "里约热内卢",
          "布宜诺斯艾利斯",
          "圣地亚哥",
          "波哥大",
          "基多",
          "巴西利亚",
          "加拉加斯"
        ],
        非洲: [
          "开罗",
          "马拉喀什",
          "卡萨布兰卡",
          "开普敦",
          "内罗毕",
          "拉巴特",
          "毛里求斯",
          "亚的斯亚贝巴"
        ],
        南极洲: ["南极半岛", "布韦岛"]
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
<style scoped>
* {
  transition: all 0.3s linear;
}
.active {
  opacity: 0;
}
.trip-a {
  width: 120px;
  text-align: center;
  height: 80px;
  margin: 0 2px 2px 0;
  line-height: 80px;
  display: inline-block;
  background: pink;
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
.go-zt > ul {
  list-style: none;
  float: left;
  padding: 0;
}
.go-zt > ul > li > span {
  display: inline-block;
  text-align: left;
  padding-left: 10px;
  font-weight: 700;
  line-height: 50px;
  border-top: 1px solid #e4e5e5;
  border-bottom: 1px solid #e4e5e5;
  height: 50px;
  background: #f1f1f1;
  width: 118px;
  box-sizing: border-box;
}
</style>