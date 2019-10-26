<template>
  <div @click="isLike">
    <svg class="iconblack_favorite-purple" aria-hidden="true" v-if="like">
      <use xlink:href="#iconblack_favorite-purple" />
    </svg>
    <svg class="iconred_favorite" aria-hidden="true" v-else>
      <use xlink:href="#iconred_favorite" />
    </svg>
  </div>
</template>
<script>
export default {
  data(){
    return{
      //点赞
      like:true,
    }
  },
  methods:{
    isLike(){
      if(this.like){
        this.like=false
      }else{
        this.like=true
      }
    },
  }
}
</script>