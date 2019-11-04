<template>
  <main class="trips-wrap">
    <div class="wrap-left">
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