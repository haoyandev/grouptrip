<template>
  <main id="strategypage">
    <mt-tabbar fixed class="tabbar-top">
      <mt-tab-item class="text-item">
        <div class="placebutton">
          <mt-button>
            日本
            <svg class="iicondropdown-white" aria-hidden="true">
              <use xlink:href="#icondropdown-white-copy"></use>
            </svg>
          </mt-button>
        </div>
        <div class="tabbar-search">
          <input type="text" class="form-text">
          <svg class="search-white" aria-hidden="true">
            <use xlink:href="#iconsearch-white"></use>
          </svg>
        </div>
      </mt-tab-item>
    </mt-tabbar>
    <div class="strategywrap">
      <div class="top-city">
        <div class="top-city-title">
          <h3>热门城市</h3>
          <router-link to="javascript;" style="display: flex;align-item:center; line-height: 15px">
            <span style="margin-right: 5px">查看更多</span>     
            <svg class="iconforward-small" aria-hidden="true">
              <use xlink:href="#iconforward"></use>
            </svg>
            </router-link>
        </div>
        <div class="top-city-content">
          <div class="top-city-item">
            <span>大阪</span>
            <span>Osaka</span>
          </div>
          <div class="top-city-item">
            <span>首尔</span>
            <span>Seoul</span>
          </div>
          <div class="top-city-item">
            <span>首尔</span>
            <span>Seoul</span>
          </div>
          <div class="top-city-item">
            <span>首尔</span>
            <span>Seoul</span>
          </div>
          <div class="top-city-item">
            <span>首尔</span>
            <span>Seoul</span>
          </div>
          <div class="top-city-item">
            <span>首尔</span>
            <span>Seoul</span>
          </div>
        </div>
      </div>
      <div class="city-strategy">
          <ul class="strategy-items">
            <li class="strategy-item">
              <div class="cityimg">
                <img src="../assets/citypics/save.jpg" alt="">
              </div>
              <div class="city-details">
                <h4 class="details-title">大阪</h4>
                <p class="details">有着悠久文化历史的大阪是日本第二大城市，全国经济、政治和文化的中心，交通便利、贸易发达，是深受国内外旅行者喜爱的人气城市。大阪位于日本本州中西部，面积是全国都道府县中最小的，但人口却仅次于首都东京。</p>
              </div>
            </li>
            <li class="strategy-item">
              <div class="cityimg">
                <img src="../assets/citypics/save.jpg" alt="">
              </div>
              <div class="city-details">
                <h4 class="details-title">大阪</h4>
                <p class="details">有着悠久文化历史的大阪是日本第二大城市，全国经济、政治和文化的中心，交通便利、贸易发达，是深受国内外旅行者喜爱的人气城市。大阪位于日本本州中西部，面积是全国都道府县中最小的，但人口却仅次于首都东京。</p>
              </div>
            </li>
            <li class="strategy-item">
              <div class="cityimg">
                <img src="../assets/citypics/save.jpg" alt="">
              </div>
              <div class="city-details">
                <h4 class="details-title">大阪</h4>
                <p class="details">有着悠久文化历史的大阪是日本第二大城市，全国经济、政治和文化的中心，交通便利、贸易发达，是深受国内外旅行者喜爱的人气城市。大阪位于日本本州中西部，面积是全国都道府县中最小的，但人口却仅次于首都东京。</p>
              </div>
            </li>
            <li class="strategy-item">
              <div class="cityimg">
                <img src="../assets/citypics/save.jpg" alt="">
              </div>
              <div class="city-details">
                <h4 class="details-title">大阪</h4>
                <p class="details">有着悠久文化历史的大阪是日本第二大城市，全国经济、政治和文化的中心，交通便利、贸易发达，是深受国内外旅行者喜爱的人气城市。大阪位于日本本州中西部，面积是全国都道府县中最小的，但人口却仅次于首都东京。</p>
              </div>
            </li>

          </ul>
        </div>
        <div class="travel-sale">
          <div class="travel-sale-title">
            <h3>旅行特价</h3>
          </div>
          <div class="sale-content">
            <router-link to="javascript;" class="sale-item sale-item1">
              <span>特价酒店</span>
              <p>388元起</p>
            </router-link>
            <router-link to="javascript;" class="sale-item sale-item2">
              <span>日游小团</span>
              <p>已售22686</p>
            </router-link>
            <router-link to="javascript;" class="sale-item sale-item3">
              <span>WIFI电话卡</span>
              <p>已售610300</p>
            </router-link>
            <router-link to="javascript;" class="sale-item sale-item4">
              <span>签证</span>
              <p>已售100855</p>
            </router-link>
            <router-link to="javascript;" class="sale-item sale-item5">
              <span>门票票券</span>
              <p>已售出81006</p>
            </router-link>
            <router-link to="javascript;" class="sale-item sale-item6">
              <span>特价机票</span>
              <p>533元起</p>
            </router-link>
          </div>
        </div>
        <div class="essence-notes">
          <div class="essence-title">
            <h3>精华游记</h3>
            <router-link to="javascript;" class="see-more">
            <span style="margin-right: 5px">查看更多</span>     
            <svg class="iconforward-small" aria-hidden="true">
              <use xlink:href="#iconforward"></use>
            </svg>
            </router-link>
          </div>
          <div class="notes">
            <ul class="notes-items">
              <li class="notes-item">
                <div class="note-title">日本环球影城 | 圣诞节</div>
                <div class="personal-msg">
                  <div class="personal-head">
                    <img src="../assets/iconfont/girl.png" alt="">
                  </div>
                  <span class="personal-name">维多利亚</span>
                </div>
              </li>
              <li class="notes-item">
                <div class="note-title">日本环球影城 | 圣诞节</div>
                <div class="personal-msg">
                  <div class="personal-head">
                    <img src="../assets/iconfont/girl.png" alt="">
                  </div>
                  <span class="personal-name">维多利亚</span>
                </div>
              </li>
              <li class="notes-item">
                <div class="note-title">日本环球影城 | 圣诞节</div>
                <div class="personal-msg">
                  <div class="personal-head">
                    <img src="../assets/iconfont/girl.png" alt="">
                  </div>
                  <span class="personal-name">维多利亚</span>
                </div>
              </li>
              <li class="notes-item">
                <div class="note-title">日本环球影城 | 圣诞节</div>
                <div class="personal-msg">
                  <div class="personal-head">
                    <img src="../assets/iconfont/girl.png" alt="">
                  </div>
                  <span class="personal-name">维多利亚</span>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="strategy-bottom">
          <mt-navbar v-model="selected">
            <mt-tab-item id="bottom1">推荐</mt-tab-item>
            <mt-tab-item id="bottom2">找旅友</mt-tab-item>
          </mt-navbar>
          <mt-tab-container v-model="selected">
            <div :style="selected=='bottom1'?'opacity:1':'opacity:0'">
              <mt-tab-container-item id="bottom1" style="display:block">
              <div class="bottom1_wrap">
                <div class="wrap-item strategy-wrap-item">
                  <div class="wrap-item-content">
                    <div class="personal-pic"></div>
                    <span class="place">泰国,芭提雅</span>
                    <span class="date">10月16日-10月30日</span>
                    <div class="wrap-item-details">
                      <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！
                      </p>
                    </div>
                  </div>
                </div>
                <div class="wrap-item strategy-wrap-item">
                  <div class="wrap-item-content">
                    <div class="personal-pic"></div>
                    <span class="place">泰国,芭提雅</span>
                    <span class="date">10月16日-10月30日</span>
                    <div class="wrap-item-details">
                      <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！
                      </p>
                    </div>
                  </div>
                </div>
                <div class="wrap-item strategy-wrap-item">
                  <div class="wrap-item-content">
                    <div class="personal-pic"></div>
                    <span class="place">泰国,芭提雅</span>
                    <span class="date">10月16日-10月30日</span>
                    <div class="wrap-item-details">
                      <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！
                      </p>
                    </div>
                  </div>
                </div>
                <div class="wrap-item strategy-wrap-item">
                  <div class="wrap-item-content">
                    <div class="personal-pic"></div>
                    <span class="place">泰国,芭提雅</span>
                    <span class="date">10月16日-10月30日</span>
                    <div class="wrap-item-details">
                      <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              </mt-tab-container-item>
            </div>
            <div :style="selected=='bottom2'?'opacity:1':'opacity:0'">
              <mt-tab-container-item id="bottom2" >
              <div class="bottom2_wrap">
                  <div class="tips-wrap-item">
                    <div class="wrap-item-content">
                      <div class="tips-notes-img">
                        <img src="../assets/citypics/img1998.jpg" alt="">
                      </div>
                      <div class="item-details">
                        <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！
                        </p>
                      </div>
                      <div class="tips-personal">
                        <div class="personal-head">
                          <img src="../assets/iconfont/girl.png" alt="">
                        </div>
                        <span>维多利亚</span>
                        <div class="favorite">
                          <svg class="iconblack_favorite-purple" aria-hidden="true">
                          <use xlink:href="#iconblack_favorite-purple"></use>
                          </svg>
                          <span>115</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tips-wrap-item">
                    <div class="wrap-item-content">
                      <div class="tips-notes-img">
                        <img src="../assets/citypics/img1998.jpg" alt="">
                      </div>
                      <div class="item-details">
                        <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！
                        </p>
                      </div>
                      <div class="tips-personal">
                        <div class="personal-head">
                          <img src="../assets/iconfont/girl.png" alt="">
                        </div>
                        <span>维多利亚</span>
                        <div class="favorite">
                          <svg class="iconblack_favorite-purple" aria-hidden="true">
                          <use xlink:href="#iconblack_favorite-purple"></use>
                          </svg>
                          <span>115</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tips-wrap-item">
                    <div class="wrap-item-content">
                      <div class="tips-notes-img">
                        <img src="../assets/citypics/img1998.jpg" alt="">
                      </div>
                      <div class="item-details">
                        <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！
                        </p>
                      </div>
                      <div class="tips-personal">
                        <div class="personal-head">
                          <img src="../assets/iconfont/girl.png" alt="">
                        </div>
                        <span>维多利亚</span>
                        <div class="favorite">
                          <svg class="iconblack_favorite-purple" aria-hidden="true">
                          <use xlink:href="#iconblack_favorite-purple"></use>
                          </svg>
                          <span>115</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tips-wrap-item">
                    <div class="wrap-item-content">
                      <div class="tips-notes-img">
                        <img src="../assets/citypics/img1998.jpg" alt="">
                      </div>
                      <div class="item-details">
                        <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！
                        </p>
                      </div>
                      <div class="tips-personal">
                        <div class="personal-head">
                          <img src="../assets/iconfont/girl.png" alt="">
                        </div>
                        <span>维多利亚</span>
                        <div class="favorite">
                          <svg class="iconblack_favorite-purple" aria-hidden="true">
                          <use xlink:href="#iconblack_favorite-purple"></use>
                          </svg>
                          <span>115</span>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
              </mt-tab-container-item>
            </div>
          </mt-tab-container>
        </div> 
    </div>
    <Sendgroup></Sendgroup>
    <main-tab-bar></main-tab-bar>
  </main>
</template>

<script>
import MainTabBar from '../components/mainTabBar'
import Sendgroup from '../components/common/Sendgroup'
export default {
  data(){
    return{
      selected:"bottom1",//保存底部推荐面板当前显示的子面板id
    }
  },
  components:{
    MainTabBar,
    Sendgroup
  }
}
</script>
<style>
ul,li{ padding:0;margin:0;list-style:none}
.blank{
  height: 50px;

}
#strategypage{
  position: relative;
}
#strategypage .mint-tabbar > .mint-tab-item.is-selected {
  background:url('../assets/citypics/img1996.jpg');
  background-size: 100%;
  background-position: center;
  
}
#strategypage .tabbar-top{
  position: relative;
  height: 100px;
}
.placebutton .mint-button--default{
  background-color: transparent;
  border: none;
  box-shadow: none;
  position:absolute;
  color: #fff;
  top: 12px;
  left: 5px;
}
.mint-button-text {
  display: flex;
}
.text-item .mint-tab-item-label{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
#strategypage .form-text{
  border: none;
  border-radius: 25px;
  height: 20px;
  width: 100%;
  position: relative;
  background-color: #fff;
  opacity: 0.5;
}
#strategypage .tabbar-search{
  margin-left: 10px;
  width: 75%;
  display: flex;
  position: absolute;
  top: 20px;
  right: 20px;
}
#strategypage .tabbar-search .search-white{
  position: absolute;
  margin-top: 2.5px;
  margin-left: 5px;
}
.strategywrap{
  width: 100%;height: 100%;
  position: relative;
  background-color:#e6e6e6;
}
.strategywrap .top-city{
  width: 100%;
  height: 230px;
  background-color: #fff;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
.top-city-title, .travel-sale-title, .essence-title{
  display: flex;
  justify-content: space-between;
  height: 50px;
}
.top-city-title,.travel-sale-title, .essence-title  h3{
  margin-left: 12px;
}
.top-city-title a, .essence-title a{
  display: block;
  margin:18px 9px 0 0;
  text-decoration: none;
  font-size: 10px;
  height: 15px;
  color: #b689b0;
  display: flex;
  align-items:center; 
  line-height: 15px
}
.top-city-title a .iconforward{
  margin-left: -5px;
}
.top-city-content{
  display: flex;
  flex-wrap: wrap;
  justify-content:space-between;
  padding: 0 12px 0 12px;
}
.top-city-content .top-city-item{
  width: 31%;
  height: 70px;
  background-color: plum;
  border-radius: 10px;
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.top-city-content .top-city-item span{
  display: block;
}
.city-strategy{
  width: 100%;
  height: 140px;
  margin-top: 10px;
  background:#fff;
  padding-top: 20px;
  overflow: hidden;
}
.city-strategy .strategy-items{
  width: 1270px;
  padding-left: 15px;
}
.city-strategy ul,.notes ul {
  display: flex;
  justify-content: space-between;
}
.city-strategy ul .strategy-item{
  display: flex;

}
.city-strategy .strategy-item .cityimg{
  width: 80px;
}
.city-strategy .strategy-item .city-details{
  width: 200px;
  height: 100px;
  margin-top: 12.5px;
  background-color: #e6e6e6;
}
.city-strategy .cityimg img{
  width: 100%;
}
.city-strategy .strategy-item .city-details .details-title{
  margin: 10px;
}
.city-strategy .strategy-item .city-details p{
  font-size: 10px;
  color:#858282;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/    -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 3; /** 显示的行数 **/
  overflow: hidden;
  padding-left: 10px;
}
.strategywrap .travel-sale{
  width: 100%;
  height: 230px;
  background-color: #fff;
  margin-top: 10px;
}
.sale-content{
  height: 160px;
  display: flex;
  flex-wrap: wrap;
  justify-content:space-between;
  padding: 0 12px 0 12px;
}
.sale-content .sale-item1{
  background-image:url('../assets/cardpics/2.jpg');
  color:#8134af;
}
.sale-content .sale-item2{
  background-image:url('../assets/cardpics/6.jpg');
  color: #ea7070;
}
.sale-content .sale-item3{
  background-image:url('../assets/cardpics/7.jpg');
  color: #20366b;
}
.sale-content .sale-item4{
  background-image:url('../assets/cardpics/3.jpg');
  color: #D25565;
}
.sale-content .sale-item5{
  background-image:url('../assets/cardpics/4.jpg');
  color: #F0B775;
}
.sale-content .sale-item6{
  background-image:url('../assets/cardpics/10.jpg');
  color: #003399;
}
.sale-content .sale-item{
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
.sale-content .sale-item span{
  font-size: 15px;
  margin:10px 0 -3px 8px;
  font-weight: bold;
}
.sale-content .sale-item p{
  font-size: 8px;
  margin:5px 0px 0px 8px;

}
.essence-notes{
  width: 100%;
  height: 260px;
  background-color: #ffffff;
  margin-top: 10px;
  margin-bottom: 10px;
}
.notes{
  width: 100%;
  overflow: hidden;
  padding-top: 10px;
}
.notes-items{
  width: 1340px;
  margin-left: 15px;
}
.notes .notes-item{
  width: 320px;
  height: 160px;
  background-image:url('../assets/citypics/img1957.jpg');
  background-size: 100%;
  border-radius: 10px;
  position: relative;
}
.note-title{
  color: #fff;
  position: absolute;
  top: 100px;
  left: 8px;
}
.notes-item .personal-msg{
  display: flex;
  height: 40px;width: 100%;
  position: absolute;
  bottom: 2px;
  align-items: center;
  left: 8px;
}
.personal-msg .persoanl-head{
  width: 50px;
  height: 50px;
  border-radius: 10px;
}
.personal-msg .persoanl-head img{
  width: 100%;
  height: auto;
}
.personal-msg span{
  color: #fff;
  font-size: 5px;
  margin-left: 5px;
}
.strategy-bottom .mint-navbar .mint-tab-item.is-selected{
  color: #111111;
  font-weight: 500;
  font-style: italic;
  border: none;
}
.strategy-bottom .mint-navbar .mint-tab-item.is-selected::after{
    content: '';
    display: block;
    width: 100px;
    background: #F3EDFF;
    height: 7px;
    z-index: -1;
    margin-left: 100px;
    transform: translateX(-50%)
}
.strategy-bottom .mint-navbar .mint-tab-item .mint-tab-item-label{
  font-size: 13px;
}
.bottom1_wrap{
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  background-color: #fff;
  justify-content: space-around;
}
.strategy-wrap-item{
  width: 46%;
}
.bottom2_wrap{
  width: 100%;
  background-color: #fff;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
.tips-wrap-item{
  height: 280px;
  border-radius: 10px;
  position: relative;
  margin-bottom: 15px;
  width: 46%;
}
.tips-wrap-item .wrap-item-content{
  display: flex;
  flex-direction: column;
  align-items: center;
}
.wrap-item-content .tips-notes-img{
  width: 100%;
  height: 200px;
  overflow: hidden;
  border-radius: 10px;
}
.wrap-item-content .tips-notes-img img{
  width: 100%;
  height: 100%;
}
.tips-wrap-item .item-details{
  height: 60px;
  background-color: #fff;
}
.tips-wrap-item .item-details p{
  text-overflow: -o-ellipsis-lastline;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  line-clamp: 2;
  -webkit-box-orient: vertical;
}
.tips-personal{
  display: flex;
  position: relative;
  width: 100%;
  height: 23px;
  align-items: center;
}
.tips-personal span{
  color: #999999;
  font-size: 5px;
  margin-left: 5px;
}
.tips-personal .favorite{
  position: absolute;
  right: 2px;
}
*{
  transition: opacity .6s linear;
}
</style>