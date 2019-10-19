<template>
  <main id="homepage">
    <mt-tabbar fixed class="tabbar-top">
      <mt-tab-item class="text-item logo-top">
        <img src="../assets/cardpics/logo.png" alt="" style="width:180px;">
      </mt-tab-item>
      <mt-tab-item class="text-item search-top">
        <div class="tabbar-search">
          <input type="text" class="form-text">
          <svg class="search" aria-hidden="true">
            <use xlink:href="#iconsearch-copy"></use>
          </svg>
        </div>
        <div class="tabbar-icon">
          <mt-button  class="iconbutton">
            <svg class="iconshaixuan" aria-hidden="true">
              <use xlink:href="#iconshaixuan"></use>
            </svg>
          </mt-button>
          <span style="font-size:5px;">筛选</span>
          <mt-button class="iconbutton">
            <svg class="iconmessage" aria-hidden="true">
              <use xlink:href="#iconmessage"></use>
            </svg>
          </mt-button>
        </div>
      </mt-tab-item>
    </mt-tabbar>
    <div class="homewrap">
      <div class="wrap-left">
        <div class="wrap-item top-item">
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
        <div class="wrap-item">
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
        <div class="wrap-item">
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
      <div class="wrap-right home-wrap-item">
        <div class="wrap-item home-wrap-item">
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
        <div class="wrap-item home-wrap-item">
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
    </div>
    <Sendgroup></Sendgroup>
    <main-tab-bar></main-tab-bar>
  </main>
</template>
<script>
import MainTabBar from '../components/mainTabBar'
import Sendgroup from '../components/common/Sendgroup'
export default {
  components:{
    MainTabBar,
    Sendgroup
  }
}
</script>
<style>
#homepage{
  position: relative;
}
#homepage .tabbar-top{
  position: fixed;
  top: 0;
  height: 120px;
  display: flex;
  flex-direction: column;
}
#homepage .tabbar-top .logo-top{
  width: 100%;
  height: 60px;
  object-fit: cover;
}
#homepage .tabbar-top .logo-top.text-item .mint-tab-item-label{
  display: flex;
  justify-content: center;
}
#homepage .mint-tabbar > .mint-tab-item.is-selected{
  background-color: #fff;
  color: #111111;
}
#homepage .tabbar-top .search-top.text-item .mint-tab-item-label{
  width: 100% !important;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
}
#homepage .tabbar-search{
  margin-left: 10px;
  width: 70%;
  display: flex;
}
#homepage .form-text,#note-page .form-text{
  border: none;
  border-radius: 25px;
  height: 20px;
  width: 100%;
  position: relative;
  background: #f8f8f8;
}
#homepage .tabbar-search .search{
  position: absolute;
  margin-top: 2.5px;
  margin-left: 5px;
}
.tabbar-icon{
  width: 25%;
  display: flex;
  justify-content: space-around;
  align-items: center;
}
.tabbar-icon .mint-button--default{
  background-color: transparent;
  border: none;
  box-shadow: none;
  height: 20px;
}
.tabbar-icon .mint-button--normal{
  padding: 0 2px;
}
.homewrap{
  position: relative;
  top: 120px;
  width: 100%;
  display: flex;
}

.wrap-item{
  height: 210px;
  background-image:url('../assets/cardpics/img_2523.jpg');
  background-size: 100%;
  border-radius: 10px;
  position: relative;
  padding-top: 50px;
  margin-bottom: 15px;
}
.home-wrap-item{
  width: 100%;
}
.top-item{
  height: 230px;
  width: 100%;
}
.wrap-item .wrap-item-content{
  display: flex;
  flex-direction: column;
  align-items: center;
}
.wrap-item .wrap-item-content .personal-pic{
  width: 50px;
  height: 50px;
  border-radius: 50px;
  background-color: #fff;
}
.wrap-item .wrap-item-content span{
  display: block;
  margin: 10px 0;
}
.wrap-item .wrap-item-content .place{
  color: #fff;
  width: 135px;
  text-align: center;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/    -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 2; /** 显示的行数 **/
  overflow: hidden;
}
.wrap-item .wrap-item-content .date{
  color: #fff;
  font:5px "VisbyCFMedium","Helvetica Neue",Helvetica,Arial,sans-serif;
}
.wrap-item .wrap-item-content .wrap-item-details{
  height: 50px;
  background-color: #fff;
  color: #111111;
  position: absolute;
  bottom: 0px;
  border: 1px solid #ececec;
  border-bottom-right-radius: 10px;
  border-bottom-left-radius: 10px;
  padding: 10px;
}
.wrap-item .wrap-item-content .wrap-item-details p{
  overflow: hidden;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/    -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 2; /** 显示的行数 **/
  margin: 0;
  padding-top: 10px;
  font:0.8em "VisbyCFExtraBold","Helvetica Neue",Helvetica,Arial,sans-serif;
}
.wrap-left, .wrap-right{
  width: 50%;
  display: flex;
  flex-direction: column;
}
.wrap-left{
  padding-left: 10px;
  padding-right: 10px;
}
.wrap-right{
  padding-right: 10px;
}
</style>