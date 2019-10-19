<template>
  <main>
    <!-- 面板列表 -->
    <mt-tab-container v-model="active">
      <mt-tab-container-item id="home">
        1
      </mt-tab-container-item>
      <mt-tab-container-item id="strategy">
        2
      </mt-tab-container-item>
      <mt-tab-container-item id="note">
        3
      </mt-tab-container-item>
      <mt-tab-container-item id="personal">
        4
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- tabbar列表 -->
    <mt-tabbar v-model="active" fixed>
      <mt-tab-item id="home" @click.native="changeState(0)">
        <tab-baricon
        :selectedImage="require('../../assets/iconfont/home-active.png')"
        :normalImage="require('../../assets/iconfont/home.png')"
        :focused="currentIndex[0].isSelected">
        </tab-baricon>
        首页
      </mt-tab-item>
      <mt-tab-item id="strategy" @click.native="changeState(1)">
        <tab-baricon
        :selectedImage="require('../../assets/iconfont/location-active.png')"
        :normalImage="require('../../assets/iconfont/location.png')"
        :focused="currentIndex[1].isSelected">
        </tab-baricon>
        广州
      </mt-tab-item>
      <mt-tab-item id="note" @click.native="changeState(2)">
        <tab-baricon
        :selectedImage="require('../../assets/iconfont/note-active.png')"
        :normalImage="require('../../assets/iconfont/note.png')"
        :focused="currentIndex[2].isSelected">
        </tab-baricon>
        游记
      </mt-tab-item>
      <mt-tab-item id="personal" @click.native="changeState(3)">
        <tab-baricon
        :selectedImage="require('../../assets/iconfont/personal-active.png')"
        :normalImage="require('../../assets/iconfont/personal.png')"
        :focused="currentIndex[3].isSelected">
        </tab-baricon>
        我
      </mt-tab-item>
    </mt-tabbar>
  </main>
</template>
<script>
import TabBaricon from './TabBaricon'
import Home from '../../views/Home'
import Note from '../../views/Note'
import Personal from '../../views/Personal'
import Strategy from '../../views/Strategy'

export default {
  name:"Tabbar",
  data() {
    return {
      currentIndex:[
        {isSelected:true},
        {isSelected:false},
        {isSelected:false},
        {isSelected:false}
      ]
    }
  },
  components:{
    TabBaricon,
    Home,
    Strategy,
    Note,
    Personal
  },
  methods:{
    changeState(n){
      for(var i=0;i<this.currentIndex.length;i++){
        if(n==i){
          this.currentIndex[i].isSelected=true
        }else{
          this.currentIndex[i].isSelected=false
        }
        console.log(this.currentIndex[i].isSelected)
      }
    }
  }
}
</script>
<style scoped>

</style>