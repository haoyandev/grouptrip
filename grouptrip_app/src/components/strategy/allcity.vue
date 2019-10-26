<template>
  <div >
    <!-- 设置跳转 -->
    <header1 hTitle="日本城市"></header1>
    <div id="container">
      <ul>
        <li  v-for="(item, index) in list" :key="index">
          <a href=""><img :src="item.img" alt=""></a>
          <span class="city1">{{item.city}}</span>
          <span class="city2">{{item.ecity}}</span>
          <p style="font-size:15px">{{item.num}}人去过</p>
          <p style="font-size:12px;color:#666">代表景点：{{item.site}}</p>
        </li> 
      </ul>
    </div>
  </div>
</template>
<script>
import header1 from "../settings/header/header"
export default {
    data(){
      return {
        list:[
          {img:require(`../../assets/citypics/beijin1.jpg`),city:"北京",ecity:"beijing",num:"1336",site:"故宫" },
          {img:require(`../../assets/citypics/beijin1.jpg`),city:"北京",ecity:"beijing",num:"1336",site:"故宫" },
          {img:require(`../../assets/citypics/beijin1.jpg`),city:"北京",ecity:"beijing",num:"1336",site:"故宫" },
          {img:require(`../../assets/citypics/beijin1.jpg`),city:"北京",ecity:"beijing",num:"1336",site:"故宫" },
        ]

        

      }
    },
   components:{
     "header1":header1
   }
}
</script>
</script>
<style scoped>
  #container{
    /* float: left; */
  }

   #container ul{
    display: flex;
    justify-content: space-around;
    flex-wrap:wrap;
    width: 100%;
    height: 200px;
    list-style: none;
    padding-left:0px;
    
  }
  #container ul li{
    position: relative;
    border: 1.5px solid #ccc;
    margin-bottom: 5px;
    /* padding:0 px ; */
  }
  #container ul li span{
    position: absolute;
  } 
  #container ul li p{
    padding: 0 5px;
  }
  #container ul li p:nth-child(1){
    color:red;
  }
  #container ul li .city1{
    font-size: 14px;
    color: white;
    bottom: 108px;
    left: 4px;
  }
  #container ul li .city2{
    font-size: 14px;
    color: white;
    bottom: 90px;
    left: 4px;
  }
  #container ul img{
    height: 128px;
    width: 46%;
    /* height: 200px; */
    text-align: center;
    line-height: 200px;
    /* padding:0 5px; */
    background-color:skyblue;

  }
  
  #container ul li img{
    width: 170px;
  }

  
</style>

