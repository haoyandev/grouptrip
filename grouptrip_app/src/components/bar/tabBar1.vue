<template>
  <div id="tab-bar">
    <slot></slot>
  </div>
</template>
<script>
export default {
  name:"TabBar"
}
</script>
<style scoped>
#tab-bar{
  display: flex;
  background-color: #fff;
  position: fixed;
  height: 60px;
  border-top: 1px solid #f8f8f8;
  left: 0;
  right: 0;
  bottom: 0;
  align-items: center;
}
</style>