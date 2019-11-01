<template>
  <main class="trips-wrap">
    <div class="wrap-left">
          <div class="wrap-item top-item">
            <div class="wrap-item-content">
              <div class="personal-theme">
                <p>一起去冒险</p>
              </div>
              <div class="personal-pic">
                <img src="../../assets/citypics/img1957.jpg" alt="">
              </div>
              <span class="place">马来西亚,沙巴</span>
              <span class="date">11月16日-11月30日</span>
              <div class="wrap-item-details">
                <p>90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！</p>
              </div>
            </div>
          </div>
          <div class="wrap-item" v-for="(t,i) of trips2" :key="
          i" :style="{background:'url('+t.tripbg+')',backgroundSize:'cover',backgroundRepeat:'no-repeat'}">
            <div class="wrap-item-content">
              <div class="personal-theme">
                <p>一起去冒险</p>
              </div>
              <div class="personal-pic">
                <img :src="t.headpic" alt="">
              </div>
              <span class="place">{{t.place}}</span>
              <span class="date">{{t.date}}</span>
              <div class="wrap-item-details">
                <p>{{t.details}}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="wrap-right home-wrap-item">
          <div class="wrap-item" v-for="(t,i) of trips" :key="
          i" :style="{background:'url('+t.tripbg+')',backgroundSize:'cover',backgroundRepeat:'no-repeat'}">
            <div class="wrap-item-content">
              <div class="personal-theme">
                <p>一起去冒险</p>
              </div>
              <div class="personal-pic">
                <img :src="t.headpic" alt="">
              </div>
              <span class="place">{{t.place}}</span>
              <span class="date">{{t.date}}</span>
              <div class="wrap-item-details">
                <p>{{t.details}}</p>
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
      trips:[
        {headpic:require('../../assets/citypics/heimen.jpg'),
        tripbg:require('../../assets/cardpics/gkGaO_2656.jpg'),
        place:"泰国,芭提雅",date:"10月16日-10月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！",theme:'一起去冒险'},
        {headpic:require('../../assets/citypics/heimen.jpg'),
        tripbg:require('../../assets/cardpics/bg2.jpg'),
        place:"日本，大阪",date:"11月16日-11月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！",theme:'要甜甜的浪漫'},
        {headpic:require('../../assets/citypics/heimen.jpg'),
        tripbg:require('../../assets/cardpics/mDOZ2_7086.jpg'),
        place:"日本，大阪",date:"11月16日-11月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！",theme:'要甜甜的浪漫'},
        {headpic:require('../../assets/citypics/heimen.jpg'),
        tripbg:require('../../assets/cardpics/MJdjR_0158.jpg'),
        place:"日本，大阪",date:"11月16日-11月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！",theme:'要甜甜的浪漫'}
      ],
      trips2:[
        {headpic:require('../../assets/citypics/heimen.jpg'),
        tripbg:require('../../assets/cardpics//ZpGM5_2033.jpg'),
        place:"泰国,芭提雅",date:"10月16日-10月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！",theme:'要甜甜的浪漫'},
        {headpic:require('../../assets/citypics/heimen.jpg'),
        tripbg:require('../../assets/cardpics/12345.jpg'),
        place:"日本，大阪",date:"11月16日-11月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！",theme:'要甜甜的浪漫'},
        {headpic:require('../../assets/citypics/heimen.jpg'),
        tripbg:require('../../assets/cardpics/bg5.jpg'),
        place:"日本，大阪",date:"11月16日-11月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！",theme:'要甜甜的浪漫'},
        {headpic:require('../../assets/citypics/heimen.jpg'),
        tripbg:require('../../assets/cardpics/9876.jpg'),
        place:"日本，大阪",date:"11月16日-11月30日",
        details:"90后女生，计划近期去泰国，已捡3人，有意向的可以一起玩，人多热闹，一起吃吃喝喝玩玩逛逛，男女都行！但不走人多景点，自由职业，时间很随意，一起拼吃拼和拼玩，有意向的可以聊聊！"},
        
      ],
    }
  }
}
</script>
<style>
.trips-wrap{
  width: 100%;
  display: flex;
}
.wrap-item .wrap-item-content .personal-theme{
  background-color: #ffffff;
  padding: 5px 10px;
}
.wrap-item .wrap-item-content .personal-theme p{
  margin: 0px 0px;
  font-size: 13px;
}
</style>