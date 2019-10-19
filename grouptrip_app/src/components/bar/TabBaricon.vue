<template>
  <div>
    <img :src="focused?selectedImage:normalImage" alt="" class="imgstyle">
  </div>
</template>
<script>
export default {
  name:"TabBaricon",
  props:{
    focused:false,
    selectedImage:{default:""},
    normalImage:{default:""}
  }
}
</script>
<style scoped>
.imgstyle{
  width: 30px;
  height: 30px;
}
</style>