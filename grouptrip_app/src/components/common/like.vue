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
      num:''
    }
  },
  methods:{
    isLike(){
      if(this.like){
        this.like=false;
        this.num=1;
      }else{
        this.like=true;
        this.num=-1;
      }
      this.$emit('num',this.num);
    },
  }
}
</script>