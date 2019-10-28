<template>
  <div @click="isCollect">
    <svg class="iconstar-yellow" aria-hidden="true" v-if="collect">
      <use xlink:href="#iconstar-yellow" />
    </svg>
    <svg class="iconCollection" aria-hidden="true" v-else>
      <use xlink:href="#iconCollection" />
    </svg>
  </div>
</template>
<script>
export default {
  data(){
    return{
      collect:true
    }
  },
  methods:{
    isCollect(){
      if(this.collect){
        this.collect=false
      }else{
        this.collect=true
      }
    }
  }
}
</script>