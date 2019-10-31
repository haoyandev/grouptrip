<template>
  <main id="go-page">
    <mt-tabbar fixed class="go-head">
      <mt-tab-item class="go-head-item">
        <svg @click="jumpStr" class="zuojiantou_small" aria-hidden="true">
          <use xlink:href="#iconzhixiangzuozuojiantou" />
        </svg>
        <div class="tabbar-search">
          <svg class="search" aria-hidden="true">
            <use xlink:href="#iconsearch-copy" />
          </svg>
          <input type="text" class="form-text" placeholder="搜索国家、城市" />
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
        <mt-tab-container-item @click.native="city" :id="i">
          <router-link
            to=""
            @click="add_trip(trip)"
            class="trip-a"
            href="javascript:;"
            v-for="(trip,j) of gos_zt[i]"
            :data-city="trip.cname"
            :key="'index'+j"
            :style="{background:'url('+trip.cityimg+')',backgroundRepeat:'no-repeat',backgroundPosition:'center center', backgroundSize: 'cover'}"
          >
            <span :data-citys="trip.cname">{{trip.cname}}</span>
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
        国家:[
          {
            cname:'中国',
            cityimg: require("../../assets/citypics/img1998.jpg")
          },
          {
            cname:'韩国',
            cityimg:''
          },
          {
            cname:'朝鲜',
            cityimg:''
          },
          {
            cname:'日本',
            cityimg:''
          },
          {
            cname:'泰国',
            cityimg:''
          },
          {
            cname:'马来西亚',
            cityimg:''
          },
          {
            cname:'新加坡',
            cityimg:''
          },
          {
            cname:'柬埔寨',
            cityimg:''
          },
          {
            cname:'越南',
            cityimg:''
          },
          {
            cname:'印度尼西亚',
            cityimg:''
          },
          {
            cname:'菲律宾',
            cityimg:''
          },
          {
            cname:'缅甸',
            cityimg:''
          },
          {
            cname:'老挝',
            cityimg:''
          },
          {
            cname:'文莱',
            cityimg:''
          },
          {
            cname:'东帝汶',
            cityimg:''
          },
          {
            cname:'土耳其',
            cityimg:''
          },
          {
            cname:'阿联酋',
            cityimg:''
          },
          {
            cname:'尼泊尔',
            cityimg:''
          },
          {
            cname:'斯里兰卡',
            cityimg:''
          },
          {
            cname:'马尔代夫',
            cityimg:''
          },
          {
            cname:'印度',
            cityimg:''
          },
          {
            cname:'以色列',
            cityimg:''
          },
          {
            cname:'卡塔尔',
            cityimg:''
          },
          {
            cname:'伊朗',
            cityimg:''
          },
          {
            cname:'约旦',
            cityimg:''
          },
          {
            cname:'蒙古',
            cityimg:''
          },
          {
            cname:'巴勒斯坦',
            cityimg:''
          },
          {
            cname:'巴基斯坦',
            cityimg:''
          },
          {
            cname:'哈萨克斯坦',
            cityimg:''
          },
          {
            cname:'黎巴嫩',
            cityimg:''
          },
          {
            cname:'沙特阿拉伯',
            cityimg:''
          },
          {
            cname:'孟加拉国',
            cityimg:''
          },
          {
            cname:'不丹',
            cityimg:''
          },
          {
            cname:'阿曼',
            cityimg:''
          },
          {
            cname:'乌兹别克斯坦',
            cityimg:''
          },
          {
            cname:'巴林',
            cityimg:''
          },
          {
            cname:'吉尔吉斯斯坦',
            cityimg:''
          },
          {
            cname:'叙利亚',
            cityimg:''
          },
          {
            cname:'科威特',
            cityimg:''
          },
          {
            cname:'阿富汗',
            cityimg:''
          },
          {
            cname:'塔吉克斯坦',
            cityimg:''
          },
          {
            cname:'伊拉克',
            cityimg:''
          },
          {
            cname:'土库曼斯坦',
            cityimg:''
          },
          {
            cname:'也门',
            cityimg:''
          },
          {
            cname:'英属印度洋领地',
            cityimg:''
          },
          {
            cname:'法国',
            cityimg:''
          },
          {
            cname:'意大利',
            cityimg:''
          },
          {
            cname:'德国',
            cityimg:''
          },
          {
            cname:'西班牙',
            cityimg:''
          },
          {
            cname:'英国',
            cityimg:''
          },
          {
            cname:'瑞士',
            cityimg:''
          },
          {
            cname:'奥地利',
            cityimg:''
          },
          {
            cname:'荷兰',
            cityimg:''
          },
          {
            cname:'梵蒂冈',
            cityimg:''
          },
          {
            cname:'捷克',
            cityimg:''
          },
          {
            cname:'俄罗斯',
            cityimg:''
          },
          {
            cname:'比利时',
            cityimg:''
          },
          {
            cname:'土耳其',
            cityimg:''
          },
          {
            cname:'希腊',
            cityimg:''
          },
          {
            cname:'匈牙利',
            cityimg:''
          },
          {
            cname:'瑞典',
            cityimg:''
          },
          {
            cname:'丹麦',
            cityimg:''
          },
          {
            cname:'葡萄牙',
            cityimg:''
          },
          {
            cname:'挪威',
            cityimg:''
          },
          {
            cname:'芬兰',
            cityimg:''
          },
          {
            cname:'摩纳哥',
            cityimg:''
          },
          {
            cname:'卢森堡',
            cityimg:''
          },
          {
            cname:'冰岛',
            cityimg:''
          },
          {
            cname:'波兰',
            cityimg:''
          },
          {
            cname:'斯洛伐克',
            cityimg:''
          },
          {
            cname:'列支敦士登',
            cityimg:''
          },
          {
            cname:'克罗地亚',
            cityimg:''
          },
          {
            cname:'爱尔兰',
            cityimg:''
          },
          {
            cname:'爱沙尼亚',
            cityimg:''
          },
          {
            cname:'斯洛文尼亚',
            cityimg:''
          },
          {
            cname:'塞尔维亚',
            cityimg:''
          },
          {
            cname:'马耳他',
            cityimg:''
          },
          {
            cname:'拉脱维亚',
            cityimg:''
          },
          {
            cname:'格鲁吉亚',
            cityimg:''
          },
          {
            cname:'圣马力诺',
            cityimg:''
          },
          {
            cname:'波黑',
            cityimg:''
          },
          {
            cname:'黑山',
            cityimg:''
          },
          {
            cname:'立陶宛',
            cityimg:''
          },
          {
            cname:'安道尔',
            cityimg:''
          },
          {
            cname:'罗马尼亚',
            cityimg:''
          },
          {
            cname:'乌克兰',
            cityimg:''
          },
          {
            cname:'保加利亚',
            cityimg:''
          },
          {
            cname:'亚美尼亚',
            cityimg:''
          },
          {
            cname:'阿塞拜疆',
            cityimg:''
          },
          {
            cname:'阿尔巴尼亚',
            cityimg:''
          },
          {
            cname:'直布罗陀',
            cityimg:''
          },
          {
            cname:'白俄罗斯',
            cityimg:''
          },
          {
            cname:'塞浦路斯',
            cityimg:''
          },
          {
            cname:'北马其顿',
            cityimg:''
          },
          {
            cname:'科索沃',
            cityimg:''
          },
          {
            cname:'格陵兰',
            cityimg:''
          },
          {
            cname:'摩尔多瓦',
            cityimg:''
          },
          {
            cname:'法罗群岛',
            cityimg:''
          },
          {
            cname:'美国',
            cityimg:''
          },
          {
            cname:'加拿大',
            cityimg:''
          },
          {
            cname:'墨西哥',
            cityimg:''
          },
          {
            cname:'古巴',
            cityimg:''
          },
          {
            cname:'巴哈马',
            cityimg:''
          },
          {
            cname:'波多黎各',
            cityimg:''
          },
          {
            cname:'巴拿马',
            cityimg:''
          },
          {
            cname:'哥斯达黎加',
            cityimg:''
          },
          {
            cname:'牙买加',
            cityimg:''
          },
          {
            cname:'美属维尔京群岛',
            cityimg:''
          },
          {
            cname:'危地马拉',
            cityimg:''
          },
          {
            cname:'伯利兹',
            cityimg:''
          },
          {
            cname:'多米尼加共和国',
            cityimg:''
          },
          {
            cname:'开曼群岛',
            cityimg:''
          },
          {
            cname:'洪都拉斯',
            cityimg:''
          },
          {
            cname:'海地',
            cityimg:''
          },
          {
            cname:'荷属圣马丁',
            cityimg:''
          },
          {
            cname:'百慕大',
            cityimg:''
          },
          {
            cname:'法属圣马丁',
            cityimg:''
          },
          {
            cname:'萨尔瓦多',
            cityimg:''
          },
          {
            cname:'巴巴多斯',
            cityimg:''
          },
          {
            cname:'阿鲁巴',
            cityimg:''
          },
          {
            cname:'尼加拉瓜',
            cityimg:''
          },
        ],
        热门城市: [
          {
            cname: "京都",
            cityimg: require("../../assets/citypics/img1998.jpg")
          },
          {
            cname: "北京",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "巴黎",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "广州",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "巴厘岛",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "成都",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "洛杉矶",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "纽约",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "上海",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "首尔",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "重庆",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "台北",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "曼谷",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "巴塞罗那",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "杭州",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "新加坡",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "北海道",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          }
        ],
        中国内地: [
          {
            cname: "北京",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "上海",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "广州",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "成都",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "杭州",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "重庆",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          }
        ],
        中国港澳台: [
          {
            cname: "香港",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "澳门",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "台湾",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "垦丁",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          }
        ],
        日韩朝: [
          {
            cname: "东京",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "首尔",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "大阪",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "京都",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          }
        ],
        东南亚: [
          {
            cname: "曼谷",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "吉隆坡",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "新加坡",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "清迈",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "普吉岛",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          },
          {
            cname: "巴厘岛",
            cityimg: require("../../assets/citypics/beijin1.jpg")
          }
        ],
        亚洲其他: [
          { cname: "洛杉矶", cityimg: require("../../assets/citypics/LA.jpg") },
          { cname: "纽约", cityimg: require("../../assets/citypics/LA.jpg") }
        ],
        欧洲: [
          { cname: "巴黎", cityimg: require("../../assets/citypics/LA.jpg") },
          {
            cname: "巴塞罗那",
            cityimg: require("../../assets/citypics/LA.jpg")
          }
        ],
        北美洲: [
          { cname: "洛杉矶", cityimg: require("../../assets/citypics/LA.jpg") },
          { cname: "纽约", cityimg: require("../../assets/citypics/LA.jpg") }
        ],
        大洋洲: [
          { cname: "洛杉矶", cityimg: require("../../assets/citypics/LA.jpg") },
          { cname: "纽约", cityimg: require("../../assets/citypics/LA.jpg") }
        ],
        南美洲: [
          { cname: "洛杉矶", cityimg: require("../../assets/citypics/LA.jpg") },
          { cname: "纽约", cityimg: require("../../assets/citypics/LA.jpg") }
          // [{cname:"巴西",cityimg:}]
        ],
        非洲: [
          { cname: "洛杉矶", cityimg: require("../../assets/citypics/LA.jpg") },
          { cname: "纽约", cityimg: require("../../assets/citypics/LA.jpg") }
        ],
        南极洲: [
          { cname: "洛杉矶", cityimg: require("../../assets/citypics/LA.jpg") },
          { cname: "纽约", cityimg: require("../../assets/citypics/LA.jpg") }
        ]
      }
    };
  },
  methods: {
    city(e){
      var city=e.target.dataset.city||e.target.dataset.citys;
      this.$emit('city',city)
    },
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
    },
    jumpStr(){
      this.$emit("Child",{opa:1,gos:'none',go:'block',copa:0})
    }
  }
};
</script>
<style scoped>
.tabbar-search{
  top:15px;
  left:12px;
}
*{transition: opacity .4s linear}
#go-page {
  width: 100%;
  position: relative;
}
.zuojiantou_small{
  float:left;
  margin-top:10px;
}
#go-page .mint-tabbar > .mint-tab-item.is-selected {
  background-color: #ffffff;
}
.go-head .mint-tab-item .mint-tab-item-label {
  display: flex;
  align-items: center;
  width: 100% !important;
}
#go-page .go-head {
  display: flex;
  height: 40px;
  align-items: center;
  justify-content: space-around;
  border-bottom: 1px solid #ececec;
  position: fixed;
  top: 0;
}
#go-page .tabbar-search {
  width: 80%;
  height: 25px;
}
#go-page{
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
.go-zt,
.go-container {
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
  color: #5f5f5f;
  line-height: 50px;
  border-top: 1px solid #e4e5e5;
  border-bottom: 1px solid #e4e5e5;
  height: 50px;
  background: #f1f1f1;
  width: 118px;
  box-sizing: border-box;
}
.go-container a {
  border-radius: 10px;
  margin-left: 10px;
  margin-bottom: 10px;
  color: #ffffff;
  font-size: 16px;
}
.go-container .mint-tab-container-item {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
}
</style>