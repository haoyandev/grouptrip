<template>
  <div class="main">
    <div class="detail-box clearfix">
      <div class="tip">
        完善信息，<br>
        让更多人看到<br>  
        你的group伴
      </div>
      <van-cell is-link @click="showPopup">开始{{starttime}}</van-cell>
      <van-cell is-link @click="showPopup">结束{{endtime}}</van-cell>

      <van-popup v-model="show">
        <!-- 开始时间 -->
        <van-datetime-picker
          v-model="currentDate"
          type="date"
          :min-date="minDate"
          @confirm="confirm"
        />
      </van-popup>
      <van-popup v-model="show1">
        <!-- 结束时间 -->
        <van-datetime-picker
          v-model="currentDate"
          type="date"
          :min-date="minDate"
          @confirm="confirm1"
        />
      </van-popup>
    </div>
    <div class="publish">立即发布</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      show: false,
      show1: false,
      minHour: 10,
      maxHour: 20,
      minDate: new Date(),
      maxDate: new Date(2019, 10, 1),
      currentDate: new Date(),
      starttime: '',
      endtime: ''
    }
  },

  methods: {
    showPopup() {
      this.show = true;
    },
    confirm (val) {
      console.log(111)
      console.log(val)
      var date = new Date(val)
      var year = date.getFullYear()
      var month = date.getMonth() + 1
      var day = date.getDate()
      this.show = false
      this.starttime = `${year}年${month}月${day}日`
    },
    confirm1 (val) {
      console.log(111111)
      console.log(val)
      var date = new Date(val)
      var year = date.getFullYear()
      var month = date.getMonth() + 1
      var day = date.getDate()
      this.show = false
      this.starttime = `${year}年${month}月${day}日`
    },
  }
}
</script>

<style scoped>
  .main {
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    /* padding: 0 10px; */
  }
  .detail-box {
    height: 92%;
    background-color: #343434;
    padding: 0 20px;
  }
  .tip {
    margin-top: 50px;
    font-size: 30px;
    line-height: 40px;
    color: #fff;
    font-weight: 700;
  }
  .publish {
    background-color: #000;
    color: #909090;
    text-align: center;
    height: 8%;
    line-height: 46px;
  }
  .clearfix::before {
    content: "";
    display: table;
    clear: both;
  }
  .van-popup--center {
    width: 100%;
  }
</style>