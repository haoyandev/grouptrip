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
}
</script>
<style>

</style>
