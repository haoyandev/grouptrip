<template>
  <main class="trips-wrap">
    <div class="wrap-left">
      <!-- <div class="wrap-item top-item">
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
      </div>-->
      <div
        class="wrap-item wrap-item-left"
        v-for="(t,i) of grouptrip[1]"
        :key="
          i"
        :style="{background:'url('+t.bg+')',backgroundSize:'cover',backgroundRepeat:'no-repeat'}"
      >
        <div class="wrap-item-content">
          <div class="personal-theme">
            <p>{{t.tname}}</p>
          </div>
          <div class="personal-pic">
            <img :src="t.avatar" alt />
          </div>
          <span class="place">{{t.area}}</span>
          <span class="date">{{t.date.split('-')[0].slice(5)+'~'+t.date.split('-')[1].slice(5)}}</span>
          <div class="wrap-item-details">
            <p>{{t.content}}</p>
          </div>
        </div>
      </div>
    </div>
    <div class="wrap-right home-wrap-item">
      <div
        class="wrap-item wrap-item-right"
        v-for="(t,i) of grouptrip[0]"
        :key="
          i"
        :style="{background:'url('+t.bg+')',backgroundSize:'cover',backgroundRepeat:'no-repeat'}"
      >
        <div class="wrap-item-content">
          <div class="personal-theme">
            <p>{{t.tname}}</p>
          </div>
          <div class="personal-pic">
            <img :src="t.avatar" alt />
          </div>
          <span class="place">{{t.area}}</span>
          <span class="date">{{t.date.split('-')[0].slice(5)+'~'+t.date.split('-')[1].slice(5)}}</span>
          <div class="wrap-item-details">
            <p>{{t.content}}</p>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  created() {},
  data() {
    return {
      trips1: [],
      trips2: []
    };
  },
  props: {
    group: Array
  },
  computed: {
    grouptrip() {
      if (this.group) {
        var trips1 = this.group.splice(0, Math.floor(this.group.length / 2));
      }
      var trips2 = this.group;
      console.log(trips1, trips2);
      return [trips1, trips2];
    }
  }
};
</script>
<style>
.trips-wrap {
  width: 100%;
  display: flex;
}
.wrap-item .wrap-item-content .personal-theme {
  background-color: #ffffff;
  padding: 3px 12px;
  border-radius: 30px;
  margin-bottom: 10px;
}
.wrap-item .wrap-item-content .personal-theme p {
  margin: 0px 0px;
  font: bold 12px Mqi;
}
</style>