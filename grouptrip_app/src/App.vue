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
  },
  created () {
    var user = localStorage.getItem('token')
    console.log('user', user)
    var url = `/api/v1/user/loginbytoken`
    this.axios.get(url).then(res => console.log(res))
  }
}
</script>
<style>

</style>
