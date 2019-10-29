<template>
  <div class="tab-bar-item" @click="itemClick">
    <div v-if="!isActive">
      <slot name="item-icon"></slot>
    </div>
    <div v-else>
      <slot name="item-icon-active"></slot>
    </div>
    <div>
      <slot name="item-text"></slot>
    </div>
  </div>
</template>
<script>
export default {
  name:"TabBarItem",
  props:{
    path:String,
    activeColor:{
      type:String,
      default:'#8ac6d1'
    }
  },
  data(){
    return{
    }
  },
  computed:{
    isActive(){
      return this.$route.path.indexOf(this.path) !== -1
    },
    activeStyle(){
      return this.isActive ?
      {color:this.activeColor}:{}
    }
  },
  methods:{
    itemClick(){
      this.$router.replace(this.path)
      this.$store.commit('setPage',this.path);
    }
  }
}
</script>
<style scoped>
.tab-bar-item{
  flex:1;
  height:50px;
  font-size: 14px;
  text-align: center;
}
.tab-bar-item img{
    width: 30px;
    height:30px;
    vertical-align: middle;
    margin-bottom: 2px;
}
</style>