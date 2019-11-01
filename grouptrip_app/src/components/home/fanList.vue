<template>
  <div>
    <mt-header id="title" title="粉丝">
      
      <router-link to="/personal" slot="left">
        <mt-button @click.native="jumpper" icon="back"></mt-button>
      </router-link>
    <!-- <mt-button icon="more" slot="right"></mt-button> -->
    </mt-header>
    <div id="container">
        <ul>
            <li v-for="(item,index) in list" :key="index">
              <div @click="jumpdetail" data-id=item.uid><img class="icon" :src="item.avatar"></div>
              <div class="info_list">
                  <h2 class="fanName">{{item.uname}}</h2>
                  <p class="fanNo"> <span>{{item.fansNum}}粉丝</span></p>
              </div>
              <div class="res" v-if="item.checkIsFollowed">
                  已关注
              </div>
              <div class="res" v-else @click="follow" :data-uid="item.uid">
                  回粉
              </div>
            </li>
          </ul>
    </div>
  </div>
</template>
<script>
export default {
  inject: ['reload'],
  data(){
    return {
      list:[]
    }
  },
  created () {
    //发送axios获取用户的粉丝列表
    var uid = this.$store.state.user.uid
    console.log(uid)
    var url = `/user/api/v1/fanslist/${uid}`
    console.log(url)
    this.axios.get(url).then(res=>{
      if (res.data.code===200){
        this.list = res.data.data
        console.log(this.list)
      }
    }).catch(err=>{
      console.log(err)
    })
  },
  methods: {
    follow(e){
      var url = '/user/api/v1/focus'
      var uid = e.target.dataset.uid
      var obj = {
        uid
      }
      this.axios.post(url, obj)
      .then(res=>{
        if(res.data.code===200){
          this.reload() 
        }
      })
    },
    jumpdetail (e) {
      var uid = e.target.uid
      this.$router.push(`/personalindex?uid=${uid}`)
    },
    jumpper(){
      this.$emit('fans',{paropa:1,pardis:'block',fanopa:0,fandis:'none'})
    }
  },
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


