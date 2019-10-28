<template>
  <main id="morecity-page">
    <div class="tabbar-top">
      <svg class="zuojiantou_small" aria-hidden="true">
        <use xlink:href="#iconzhixiangzuozuojiantou" />
      </svg>
      <h4>全部城市</h4>
    </div>
    <div class="morecity-wrap">
      <div class="morecity-item" v-for="(c,i) of cities" :key="i" :style="{background:'url('+c.cbg+')',backgroundSize:'cover'}">
        <div class="morecity-bg">
          <p>{{c.cname}}</p>
          <span>{{c.elname}}</span>
        </div>
        <div class="morecity-text">
          <p>{{c.views}}人去过</p>
          <span>代表景点：{{c.spots}}</span>
        </div>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  data(){
    return{
      cities:[
        {cbg:require('../../assets/citypics/beijin1.jpg'),
          cname:'香港',elname:'HongKong',views:"29000",spots:'星光大道、太平山、香港海洋公园、香港迪士尼乐园'},
        {cbg:require('../../assets/citypics/beijin1.jpg'),
          cname:'香港',elname:'HongKong',views:"29000",spots:'星光大道、太平山、香港海洋公园、香港迪士尼乐园'},
        {cbg:require('../../assets/citypics/beijin1.jpg'),
          cname:'香港',elname:'HongKong',views:"29000",spots:'星光大道、太平山、香港海洋公园、香港迪士尼乐园'},
        {cbg:require('../../assets/citypics/beijin1.jpg'),
          cname:'香港',elname:'HongKong',views:"29000",spots:'星光大道、太平山、香港海洋公园、香港迪士尼乐园'},
        {cbg:require('../../assets/citypics/beijin1.jpg'),
          cname:'香港',elname:'HongKong',views:"29000",spots:'星光大道、太平山、香港海洋公园、香港迪士尼乐园'},
        {cbg:require('../../assets/citypics/beijin1.jpg'),
          cname:'香港',elname:'HongKong',views:"29000",spots:'星光大道、太平山、香港海洋公园、香港迪士尼乐园'},
          {cbg:require('../../assets/citypics/beijin1.jpg'),
          cname:'香港',elname:'HongKong',views:"29000",spots:'星光大道、太平山、香港海洋公园、香港迪士尼乐园'},
      ]
    }
  }
}
</script>
<style>
#morecity-page{
  width: 100%;
  position: relative;
  background-color: #f2f4f6;
}
#morecity-page .tabbar-top{
  width: 100%;
  height: 46px;
  position: fixed;
  top: 0px;
  display: flex;
  align-items: center;
  border-bottom: 1px solid #ececec;
  box-shadow: 0px 1px 2px #acacacb9;
  background-color: #ffffff;
}
#morecity-page .tabbar-top .zuojiantou_small{
  position: fixed;
  top: 5px;left: 0px;;
}
#morecity-page .tabbar-top h4{
  margin: 0 auto;
  font-weight: normal;
}
#morecity-page .morecity-wrap{
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  position: relative;
  top: 47px;
  background-color: #f2f4f6;
  justify-content: space-around;
  padding: 10px 5px;
  box-sizing: border-box;
}
#morecity-page .morecity-wrap .morecity-item{
  width: 46%;
  height: 180px;
  display: flex;
  flex-direction: column;
  margin-bottom: 10px;
  box-shadow: 0px 1px 2px #acacacb9;
}
.morecity-item .morecity-bg{
  width: 100%;
  height: 110px;
  color: #ffffff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.morecity-item .morecity-bg span{
  font-size: 13px;
}
.morecity-item .morecity-text{
  width: 100%;
  height: 70px;
  overflow: hidden;
  background-color: #ffffff;
  padding: 6px;
  box-sizing: border-box;
}
.morecity-item .morecity-text p{
  font-size: 12px;
  color: #dddddd;
  margin-bottom: 10px;
}
.morecity-item .morecity-text span{
  font-size: 14px;
  overflow: hidden;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/
  -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
  -webkit-line-clamp: 2; /** 显示的行数 **/
  color: #999999;
}
</style>