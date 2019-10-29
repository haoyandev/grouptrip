<template>
  <div>
    <router-link to class="send">
      <svg @click="jumpchos()" class="iconsend-purple-copy" aria-hidden="true">
        <use xlink:href="#iconsend-purple-copy" />
      </svg>
    </router-link>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {
    jumpchos() {
      this.$emit('Chose',{chosopa:1,chosdis:'block',go:'none',opa:0})
    }
  }
};
</script>
<style>
.send {
  width: 50px;
  height: 50px;
  border-radius: 50px;
  background: url("../../assets/cardpics/img_2522.jpg") no-repeat;
  background-size: 100%;
  position: fixed;
  top: 550px;
  text-align: center;
  line-height: 50px;
  right: 20px;

  box-shadow: 2px 2px 9px #acacacb9;
}
</style>