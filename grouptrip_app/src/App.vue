<template>
  <div id="app">
    <router-view v-if="isAlive"/>
    
  </div>
</template>
<script>
export default {
  provide() {
    return {
      reload: this.reload
    }
  },
  data() {
    return {
      isAlive: true
    }
  },
  name: 'App',
  components:{
  },
  methods: {
    reload() {
      this.isAlive = false;
      this.$nextTick(function () {
        this.isAlive = true
      })
    }
  }
}
</script>
<style>

</style>
