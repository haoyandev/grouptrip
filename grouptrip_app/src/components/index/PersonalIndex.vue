<template>
  <main id="personalindex-page">
    <div @click="jumpfh" class="tabbar-top">
      <svg class="zuojiantou_small" aria-hidden="true">
        <use xlink:href="#iconzhixiangzuozuojiantou" />
      </svg>
    </div>
    <div class="personalindex-wrap">
      <div class="wrap-bg">
      </div>
      <div class="personalindex-msg">
        <div class="msg-wrap">
          <div class="msg-top">
            <div class="msg-top-head">
              <img src="../../assets/citypics/city1.jpg">
            </div>
            <div class="msg-top-follow">
              <svg class="iconsend-small" aria-hidden="true">
                <use xlink:href="#iconsend" />
              </svg>
              关注</div>
            <div class="msg-top-talk">和他聊聊</div>
          </div>
          <div class="msg-middle">
            <h2 class="msg-middle-name">{{personalmsg.uname}}</h2>
            <div class="msg-middle-tag">
              <div class="tag-sex" :class="{
                'tag-sex-screct':personalmsg.gender===-1,
                'tag-sex-female':personalmsg.gender===0,
                'tag-sex-male':personalmsg.gender===1,
                }">
                <span v-if="personalmsg.gender==-1"></span>
                <span class="msg-sex" v-else-if="personalmsg.gender==1">
                  <svg class="icon_male" aria-hidden="true">
                    <use xlink:href="#iconicon28" />
                  </svg>
                </span>
                <span class="msg-sex" v-else>
                  <svg class="icon_female" aria-hidden="true">
                    <use xlink:href="#iconnv" />
                  </svg>
                </span>
                <span v-if="personalmsg.gender==-1">保密</span>
                <span v-else-if="personalmsg.gender==1">男</span>
                <span v-else>女</span>
              </div>
              <div class="msg-place">{{personalmsg.city}}</div>
            </div>
          </div>
          <div class="msg-bottom">
            <span class="msg-bottom-count">{{personalmsg.likes}}</span>
            <p>获赞</p>
            <span class="msg-bottom-count">{{personalmsg.fansNum}}</span>
            <p>粉丝</p>
            <span class="msg-bottom-count">{{personalmsg.follower}}</span>
            <p>关注</p>
          </div>
        </div>
      </div>
      <div class="divider"></div>
        <div class="bottom2_wrap">
          <div class="tips-wrap-item" v-for="(t,i) of trips" :key="i">
            <div class="wrap-item-content">
              <div class="tips-notes-img">
                <img :src=t.timg alt />
              </div>
              <div class="item-details">
                <p>{{t.details}}</p>
              </div>
              <div class="tips-personal">
                <div class="personal-head">
                  <img :src=t.head alt />
                </div>
                <span>{{t.uname}}</span>
                <div class="favorite">
                  <like></like>
                  <p>{{t.likes}}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  </main>
</template>
<script>
import like from "../common/like";
export default {
  data(){
    return{
      active:1,
      personalmsg:{uname:'Victoria',city:'广州',fansNum:'112',likes:'12',follower:'10',gender:0},
      trips:[
        {details:'90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！',uname:'维多利亚',likes:'100',
        timg:require('../../assets/citypics/img1998.jpg'),
        head:require('../../assets/citypics/img1998.jpg')
        },
        {details:'90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！',uname:'维多利亚',likes:'100',
        timg:require('../../assets/citypics/img1998.jpg'),
        head:require('../../assets/citypics/img1998.jpg')
        },
      ],
    }
  },
  components:{
    like
  },
  methods:{
    jumpfh(){
      this.$emit('fh','0')
    }
  }
}
</script>
<style>
#personalindex-page{
  width: 100%;
}
/* #personalindex-page .tabbar-top{
  background-color: transparent !important;
} */
.personalindex-wrap{
  width: 100%;
}
.personalindex-wrap .wrap-bg{
  width: 100%;
  height: 200px;
  background: url('../../assets/citypics/beijin1.jpg');
  background-size: cover;
}
.personalindex-wrap .personalindex-msg{
  width: 100%;
  background-color: #ffffff;
  position: relative;
  top: -10px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  box-sizing: border-box;
  padding: 0px 20px 0px 20px;
}
.personalindex-msg .msg-wrap{
  width: 100%;
  position: relative;
  top: -32.5px;
  height: 160px;
}
.personalindex-msg .msg-top{
  width: 100%;
  display: flex;
  justify-content: space-around;
  align-items: flex-end;
}
.personalindex-msg .msg-top .msg-top-head{
  width: 65px;
  height: 65px;
  border: 5px solid #ffffff;
  border-radius: 50px;
  overflow: hidden;
}
.msg-top .msg-top-head img{
  max-width: 100%;
  height: 100%;
  object-fit: cover;
}
.msg-top .msg-top-follow{
  width: 70px;
  height: 30px;
  line-height: 30px;
  background-color: #51c0c7;
  color: #ffffff;
  border-radius: 30px;
  text-align: center;
  font-size: 13px;
}
.msg-top .msg-top-talk{
  width: 120px;
  height: 30px;
  line-height: 30px;
  color: #ffffff;
  background-color: #8134af;
  border-radius: 30px;
  text-align: center;
  font-size: 13px;
}
.personalindex-msg .msg-middle{
  width: 100%;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
}
.personalindex-msg .msg-middle h2{
  margin-bottom: 5px;
}
.msg-middle .msg-middle-name,.msg-middle .msg-middle-tag{
  width: 40%;
  display: flex;
}
.msg-middle-tag .tag-sex{
  width: 50px;
  height: 20px;
  line-height: 20px;
  border-radius: 30px;
  font-size: 13px;
  display: flex;
  justify-content: center;
  margin-right: 8px;
}
.tag-sex-female{
  border:1px solid #FFB6B9;
  color: #FFB6B9;
}
.tag-sex-male{
  border:1px solid #8ac6d1;
  color: #8ac6d1;
}
.tag-sex-screct{
  border:1px solid #b689b6;
  color: #b689b6;
}
.msg-middle-tag .msg-place{
  width: 50px;
  height: 20px;
  border:1px solid #b689b6;
  border-radius: 30px;
  line-height: 20px;
  font-size: 13px;
  text-align: center;
  color: #b689b6;
}
.personalindex-msg .msg-bottom{
  width: 100%;
  height: 40px;
  display: flex;
  align-items: center;
}
.personalindex-msg .msg-bottom span{
  font-size: 18px;
  font-weight: bold;
}
.personalindex-msg .msg-bottom p{
  font-size: 12px;
  margin-right: 8px;
}
.personalindex-wrap .divider{
  width: 100%;
  height: 15px;
  background: #f2f4f6;
}
</style>