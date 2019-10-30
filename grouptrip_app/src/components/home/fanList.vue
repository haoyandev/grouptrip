<template>
  <div>
    <mt-header id="title" title="粉丝">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    <!-- <mt-button icon="more" slot="right"></mt-button> -->
    </mt-header>
    <div id="container">
        <ul>
            <li v-for="(item,index) in list" :key="index">
              <div ><img class="icon" :src="item.img"></div>
              <div class="info_list">
                  <h2 class="fanName">{{item.fanName}}</h2>
                  <p class="fanNo"> <span>{{item.fans}}粉丝</span> | <span>{{item.amount}}条</span></p>
              </div>
              <div class="res" style="display:none">
                  回粉
              </div>
              <div class="res">
                  已关注
              </div>
            </li>
          </ul>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      list:[
        {img:require(`@/assets/citypics/heimen.jpg`),fanName:"张三",amount:"19",biu:'5',fans:24 },
        {img:require(`@/assets/citypics/heimen.jpg`),fanName:"李四",amount:"11",biu:'2',fans:27 },
        {img:require(`@/assets/citypics/heimen.jpg`),fanName:"王五",amount:"16",biu:'8',fans:29 },
        {img:require(`@/assets/citypics/heimen.jpg`),fanName:"陈六",amount:"5",biu:'4' ,fans:28 },
      ]
    }
  },
  created(){
    //发送axio获取用户的粉丝列表
    var url = ''
  }
}
</script>
<style scoped>
#title{
  background-color: #fff;
  color: #000;
  font-weight: bold;
  font-size: 15px;
  border-bottom: 1px solid #ececec;
  box-shadow: 0px 1px 2px #acacacb9;
  height: 46px;
  position: fixed;
  width: 100%;
}
#container{
  position: relative;
  top: 46px;
}
#title >>> .mint-header-title{

  font-weight: bold;
}
#content { flex:1; overflow:auto;}
ul{ 
margin: 0;
padding: 5px;
}
ul li{ margin-top:12px; display: flex; align-items:center; border-bottom: 1px #e6e6e6 solid; padding-bottom: 5px;}
.icon{ width:60px; height: 60px;border-radius: 50%;position: relative;}
.info_list{
margin-left: 10px;
}
.fanName{
font-size: 16px;
}
.fanName{
margin-bottom: 10px;
}
.fanNo{
margin-top: 10px;
color:rgb(70, 67, 67);
font-size: 13px;
}
.res{width: 60px;
height: 28px;
position: absolute;
line-height: 28px;
text-align: center;
background-color: white;
color: black;
border-radius: 14px;
font-size: 14px;
cursor: pointer;
right:10px;
border: 1px solid rgb(10, 10, 10);
font-weight: bold;

}
</style>


