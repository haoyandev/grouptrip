<template>
  <div>
    <div class="head">
      <div>
        <svg @click="jiantou" class="zuojiantou" aria-hidden="true">
          <use xlink:href="#iconzhixiangzuozuojiantou" />
        </svg>
      </div>
      <div>
        <span>关注</span>
      </div>
    </div>

    <!-- head结束 -->

    <div class="body">
        <div class="yellow">
            <span>你很可能想认识TA</span>
        </div>
      <div class="bodyfor" v-for="(item,i) of user" :key="i">
        <div class="img">
          <img :src="item.img" />
        </div>
        <div class="msg">
          <p>{{item.uname}}</p>
          <span>{{item.fen+'粉丝 | '}}</span>
          <span>{{item.Biu+'条Biu'}}</span>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      user: [
        {
          uname: "Tiffany生活家",
          img: require("../../assets/citypics/img1998.jpg"),
          fen: 2824,
          Biu: 30
        },
        {
          uname: "鱼人岛",
          img: require("../../assets/citypics/img1998.jpg"),
          fen: 6666,
          Biu: 3
        },
        {
          uname: "Cookie大曲奇",
          img: require("../../assets/citypics/img1998.jpg"),
          fen: 1512,
          Biu: 75
        }
      ]
    };
  },
  methods: {
    jiantou () {
      this.$router.push('/personal')
    }
  },
};
</script>
<style scoped>
.yellow{
    margin-top:6px;
    background: pink;
    width:100%;
    border-radius:10px;
    height:65px;
    align-items: center;
    display:flex;
}
.yellow span{
    margin-left:20px;
    font-weight:bold;
    font-size:23px;
}
.body{
    margin:0 12px;
}
.bodyfor{
    display:flex;
    margin:0 8px;
    padding:35px 0;
    border-bottom:1px solid #ddd;
}
.head .zuojiantou {
  margin: 0 10px 0 15px;
}
.msg{
    margin-left:15px;
}
.msg p{
    font-weight:700;
    font-size:19px;
}
.msg span{
    font-size:15px;
    color:gray;
    font-weight:bold;
}
.head {
  display: flex;
  height: 100px;
  align-items: center;
  border-bottom:2px solid #ddd;
}
.head span{
    font-size:20px;
    font-weight:bold;
}
.body .img {
  width: 50px;
  height: 50px;
}
.img img {
  width: 100%;
  height: 100%;
  border-radius: 50%;
}
</style>