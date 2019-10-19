<template>
<div>
  <div class="selector selectYear" @click="selectYear">
    <div class="show_year">
      <div id="birthday" v-if="!isClicked"><mt-cell title="出生日期" is-link ></mt-cell></div>
      <p v-if="isClicked">{{year}}</p>
      <i class="icon"></i>
    </div>
  </div>
  <mt-datetime-picker 
    v-model="dateValue" 
    type="date" 
    ref="datePicker" 
    year-format="{value} 年" 
    month-format="{value} 月" 
    date-format="{value} 日" 
    :startDate="new Date('1949-1-1')"
    :endDate="new Date()" 
    @confirm="handleConfirm">
  </mt-datetime-picker>
</div>

</template>
<script>
export default {
  data(){
    return {
      year:"",
      dataValue:"",
      idClicked:false
    }
  },
  methods: {
    selectYear () {
      this.$refs.datePicker.open();
    },
    handleConfirm (value) {
      console.log(value);
      this.year = value.getFullYear();
      this.month = value.getMonth() + 1;
      this.date = value.getDate();
      this.isClicked = true;
    },
  }

}
</script>
<style scoped>
  #birthday{
    height: 35px;
  }
</style>


