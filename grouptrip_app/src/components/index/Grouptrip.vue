<template>
  <main id="grouptrip-page">
    <div class="tabbar-top">
      <div class="tabbar-title">
        <router-link to="javascript;" class="grouptrip-back">
          <svg class="zuojiantou_small" aria-hidden="true">
              <use xlink:href="#iconzhixiangzuozuojiantou"></use>
          </svg>
        </router-link>
        <router-link to="javacript;" class="start-group">
          发起
        </router-link>
      </div>
      <!-- <div class="tabbar-options">
        <mt-button class="option-place">
          地点
          <svg class="icondropdown" aria-hidden="true">
            <use xlink:href="#icondropdown"></use>
          </svg>
        </mt-button>
        <mt-button class="option-date">
          主题
          <svg class="icondropdown" aria-hidden="true">
            <use xlink:href="#icondropdown"></use>
          </svg>
        </mt-button>
        <mt-button class="option-date">
          时间
          <svg class="icondropdown" aria-hidden="true">
            <use xlink:href="#icondropdown"></use>
          </svg>
        </mt-button>
      </div> -->
      <van-dropdown-menu>
        <van-dropdown-item v-model="value1" :options="option1" />
        <van-dropdown-item v-model="value2" :options="option2" />
        <van-dropdown-item v-model="value3" :options="option3" />
      </van-dropdown-menu>
    </div>
    <div class="grouptrip-wrap">
      <div class="grouptrip-wrap-item">
        <mt-swipe :auto="4000">
          <mt-swipe-item>
            <img src="../../assets/citypics/city6.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
            <img src="../../assets/citypics/img1957.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
            <img src="../../assets/citypics/img1996.jpg" alt="">
          </mt-swipe-item>
        </mt-swipe>
        <div class="item-personal-msg">
          <div class="personal-msg-header">
            <div class="msg-header-head">
              <img src="../../assets/citypics/heimen.jpg" style=" max-width: 100%;height: auto;" alt="">
            </div>
            <div class="msg-header-text">
              <h4 class="msg-header-name">维多利亚</h4>
              <div class="msg-header-person-text">
                <div class="msg-sex-age">
                  <span class="msg-sex">
                    <svg class="iconnv" aria-hidden="true">
                      <use xlink:href="#iconnv"></use>
                    </svg>
                  </span>
                  <span class="msg-age">20岁</span>
                </div>
                <router-link to="javascript;" class="msg-favoriate">
                  <span>喜欢</span>
                  <svg class="iconblack_favorite-purple" aria-hidden="true">
                      <use xlink:href="#iconblack_favorite-purple"></use>
                  </svg>
                </router-link>
              </div>
            </div>
            <router-link class="msg-more" to="javascript;">
              <svg class="iconforward" aria-hidden="true">
                <use xlink:href="#iconforward"></use>
              </svg>  
            </router-link>
          </div>
          <div class="personal-msg-date">
            <svg class="iconshijian" aria-hidden="true">
              <use xlink:href="#iconshijian"></use>
            </svg>
            <span class="msg-date">日期</span>
            <span>12月23日~2020年1月8日</span>
          </div>
          <div class="personal-msg-place">
            <svg class="icondidian" aria-hidden="true">
              <use xlink:href="#icondidian"></use>
            </svg>
            <span class="msg-place">地点</span>
            <span>日本•大阪•京都</span>
            <svg class="iconstar-yellow" aria-hidden="true">
              <use xlink:href="#iconstar-yellow"></use>
            </svg>
          </div>
        </div>
      </div>
      <div class="grouptrip-wrap-item">
        <mt-swipe :auto="4000">
          <mt-swipe-item>
            <img src="../../assets/citypics/city8.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
            <img src="../../assets/citypics/img1957.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
            <img src="../../assets/citypics/img1996.jpg" alt="">
          </mt-swipe-item>
        </mt-swipe>
        <div class="item-personal-msg">
          <div class="personal-msg-header">
            <div class="msg-header-head">
              <img src="../../assets/citypics/heimen.jpg" style=" max-width: 100%;height: auto;" alt="">
            </div>
            <div class="msg-header-text">
              <h4 class="msg-header-name">维多利亚</h4>
              <div class="msg-header-person-text">
                <div class="msg-sex-age">
                  <span class="msg-sex">
                    <svg class="iconnv" aria-hidden="true">
                      <use xlink:href="#iconnv"></use>
                    </svg>
                  </span>
                  <span class="msg-age">20岁</span>
                </div>
                <router-link to="javascript;" class="msg-favoriate">
                  <span>喜欢</span>
                  <svg class="iconblack_favorite-purple" aria-hidden="true">
                      <use xlink:href="#iconblack_favorite-purple"></use>
                  </svg>
                </router-link>
              </div>
            </div>
            <router-link class="msg-more" to="javascript;">
              <svg class="iconforward" aria-hidden="true">
                <use xlink:href="#iconforward"></use>
              </svg>  
            </router-link>
          </div>
          <div class="personal-msg-date">
            <svg class="iconshijian" aria-hidden="true">
              <use xlink:href="#iconshijian"></use>
            </svg>
            <span class="msg-date">日期</span>
            <span>12月23日~2020年1月8日</span>
          </div>
          <div class="personal-msg-place">
            <svg class="icondidian" aria-hidden="true">
              <use xlink:href="#icondidian"></use>
            </svg>
            <span class="msg-place">地点</span>
            <span>日本•大阪•京都</span>
            <svg class="iconstar-yellow" aria-hidden="true">
              <use xlink:href="#iconstar-yellow"></use>
            </svg>
          </div>
        </div>
      </div>
      
    </div>
  </main>
</template>
<script>
export default {
  data(){
    return{
      //下拉菜单
      value1: 0,
      value2: 0,
      value3: 0,
      option1: [
        { text: '地点', value: 0 },
      ],
      option2: [
        { text: '主题', value: 0 },
        { text: '一起去冒险', value: 1 },
        { text: '要甜甜的浪漫', value: 2 },
        { text: '走！探店去', value: 3 },
        { text: '寻觅美食', value: 4 },
        { text: '看展才是正经事', value: 5 },
        { text: '约你去看音乐剧', value: 6 },
        { text: '其他活动', value: 7 },
      ],
      option3:[
        { text:'开始日期' ,value: 0 },
        { text:'结束日期' , value: 1}
      ]
    }
  }
}
</script>
<style>
#grouptrip-page{
  position: relative;
}
#grouptrip-page .tabbar-top{
  position: relative;
  top:0;
  height: 70px;
}
#grouptrip-page .tabbar-top .tabbar-title{
  width: 100%;
  display: flex;
  height: 30px;
  justify-content: space-between;
}
#grouptrip-page .tabbar-top a,#note-page .tabbar-top a{
  text-decoration: none;
  display: block;
  width: 45px;
  font-size: 12px;
  height: 20px;
}
#grouptrip-page .tabbar-top .tabbar-title .start-group,#note-page .tabbar-top .start-group{
  background-color: #8134af;
  color: #fff;
  border-radius: 30px;
  text-align: center;
  line-height: 20px;
  margin-top: 8px;
  margin-right: 15px;
}
.tabbar-options{
  display: flex;
  justify-content: space-around;
}
.tabbar-options .mint-button--default{
    background-color: transparent;
    box-shadow: none;
    color: #111111;
    font-size: 15px;
    font-weight: 800;
}
.grouptrip-wrap{
  position: relative;
  width: 100%;
}
.grouptrip-wrap .grouptrip-wrap-item{
  height: 520px;
}
.grouptrip-wrap .grouptrip-wrap-item img{
  max-width: 100%;height: 100%;object-fit:cover;
}
.grouptrip-wrap-item .mint-swipe{
  height: 350px;
}
.item-personal-msg{
  height: 170px;
  padding: 20px 10px;
  box-sizing: border-box;
}
.personal-msg-header{
  height: 60px;
  width: 100%;
  display: flex;
  margin-bottom: 10px;
}
.personal-msg-header .msg-header-head{
  width: 60px;
  height: 60px;
}
.personal-msg-header .msg-header-head img{
  width: 100%;
  border-radius: 30px;

}
.personal-msg-header .msg-header-text{
  display: flex;
  flex-direction: column;
  width: 300px;
}
.personal-msg-header .msg-header-text h4{
  margin: 10px;
}
.personal-msg-header .msg-header-person-text{
  display: flex;
  width: 200px;
}
.msg-header-person-text .msg-sex-age{
  border: 1px solid #ffb6b9;
  border-radius: 30px;
  width: 50px;
  height: 16px;
  text-align: center;
  line-height: 16px;
  margin-left: 10px;
  margin-right: 10px;
}
.msg-header-person-text .msg-sex-age .msg-age{
  font-size: 12px;
  color: #ffb6b9;
  margin-left: 3px;
}
.personal-msg-header .msg-more{
  height: 60px;
  line-height: 60px;
}
.personal-msg-date, .personal-msg-place{
  margin-bottom: 10px;
}
.item-personal-msg .msg-date,.item-personal-msg .msg-place{
  margin: 0 10px;
}
.msg-header-person-text .msg-favoriate{
  border: 1px solid #b689b6;
  border-radius: 30px;
  width: 50px;
  height: 16px;
  align-items: center;
  text-decoration: none;
  display: flex;
  justify-content: space-around;
}
.msg-header-person-text .msg-favoriate span{
  font-size: 12px;
  color: #b689b6;
  margin-left: 3px;
}
.personal-msg-place .iconstar-yellow{
  margin-left: 150px;
}
</style>