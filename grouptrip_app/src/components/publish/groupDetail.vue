<template>
  <div class="group-box">
    <div class="main-box">
      <div class="top-box">
        <!-- 返回按钮 -->
        <router-link to="">
          <svg @click="closeGroup" class="iconclose-white" aria-hidden="true">
            <use xlink:href="#iconclose-white-copy" />
          </svg>
        </router-link>
        <div class="tip">
          完善信息，<br>
          让更多人看到<br>  
          你的group伴
        </div>
        <!-- 时间选择器 -->
        <div class="time-picker">
          <van-cell is-link @click="selectBeginTime"><span class="time-tip">开始日期</span>{{beginTime}}</van-cell>
          <van-cell is-link @click="selectEndTime"><span class="time-tip">结束日期</span>{{endTime}}</van-cell>
          <!-- 开始时间 -->
          <van-popup v-model="showBeginTime">
          <van-datetime-picker
          type="date"
          :min-date="minDate"
          @confirm="handleBeginTime"
          @cancel="handleCancel"
          />
          </van-popup>
          <!-- 结束时间 -->
          <van-popup v-model="showEndTime">
          <van-datetime-picker
          type="date"
          :min-date="minDate"
          @confirm="handleEndTime"
          @cancel="handleCancel"
          />
          </van-popup>
        </div>
        <!-- 地区选择器 -->
        <div class="location-picker">
          <van-cell is-link @click="selectLocation"><span class="area-tip">地区</span>{{location}}</van-cell>
          <van-popup v-model="showLocation">
           <van-area :area-list="areaList" :columns-num="2"
           @confirm="handleLocation"
           />
          </van-popup>
        </div>

      </div>
      <div class="bottom-box">
        <!-- 阅读规范 -->
        <div class="read">我已阅读《
          <router-link to="">发布规范和风险提示</router-link>
          》
          </div>
        <div class="publish" @click="publish">立即发布</div>   
      </div>
      <van-overlay :show="overlay" @click="show = false" >
        hhhh
         <van-loading size="24px" vertical v-show="loading">
           发布中...
         </van-loading>
      </van-overlay>
    </div>   
  </div>
</template>

<script>
export default {
  data() {
    return {
      minDate: new Date(), // 最小时间
      currentDate: new Date(), // 当前时间
      beginTime: '',
      endTime: '',
      area: null,
      location: '',
      showBeginTime: false, // 是否显示benginTime选择器
      showEndTime: false, // 是否显示EndTime选择器,
      showLocation: false, // 是否显示地区选择器
      overlay: false,
      loading: false,
      areaList: {
        province_list: {
          110000: '中国',
          120000: '日本',
          130000: '马来西亚',
          140000: '法国',
          150000: '西班牙',
          160000: '美国',
          170000: '泰国',
          180000: '韩国'
        },
        city_list: {
          110100: '香港',
          110200: '澳门',
          120100: '东京',
          130100: '吉隆波',
          140100: '巴黎',
          150100: '马德里',
        },
        county_list: {
          110000: '',
        }
      }
    }

  },
  methods: {
    closeGroup(){
      this.$messagebox.confirm('',{
          title:'确定不发了嘛?',
          confirmButtonText:'继续发布',
          cancelButtonText:'下次再说'
        })
      .then(res=>{
        console.log('继续发布')
      })
      .catch(err=>{
        this.$router.push('/home')
      })
    },
    handleLocation (val) {
      this.area = val
      this.location = `${val[0].name}.${val[1].name}`
      this.showLocation = false
    },
    publish () {
      // 判断数据
      if (!this.beginTime) {
        this.$toast('请选择开始时间')
        return
      }
      if (!this.endTime) {
        this.$store('请现在结束时间')
        return
      }
      if (!this.location) {
        this.$store('请选择地区')
        return
      }
      // 整理数据
      var obj = {
        date: `${this.beginTime}-${this.endTime}`,
        cid: this.area[1].code,
        cname: this.area[1].name,
        sid: this.area[0].code,
        area: `${this.area[0].name}.${this.area[1].name}`
      }
      console.log(obj)
      var user = this.$store.state.user
      Object.assign(obj, user)
      this.$store.commit('setGroupInfo', obj)
      // 获得组团游信息
      var groupInfo = this.$store.state.groupInfo
      console.log(groupInfo)
      // 显示遮罩层 loding
      this.overlay = true
      this.loading = true
      // 发表组队
      var url = '/group/api/v1/publish'
      // 发送axios
      this.axios.post(url, groupInfo)
      .then(res => {
        if (res.data.code === 200) {
          console.log(res.data)
          this.loading = false
          this.$toast({ message: '发布成功 即将跳转到首页', duration: 2500 })
        } else {
          this.loading = false
          this.$toast({ message: `发布失败 即将跳转到首页`, duration: 2500 })
        }
        setTimeout(() => {
          this.$router.push('/Home')
        }, 2500)
      })
      .catch(err => {
        this.$toast({ message: '出错啦！ 即将跳转到首页', duration: 1500 })
        setTimeout(() => {
          this.$router.push('/Home')
        }, 1500)
      })
    },
    selectBeginTime () {
      // 判断结束时间是否已选择
      if (this.endTime) {
        // 已选择 把最小值设置成当前时间
        this.minDate = this.currentDate
      }
      this.showBeginTime = true
    },
    selectEndTime () {
      this.showEndTime = true
    },
    selectLocation () {
      this.showLocation = true
    },
    handleBeginTime (val) {
      var date = new Date(val)
      this.beginTime = this.handleDate(date)
      // 设置最小时间为beginTime
      this.minDate = date
      // 隐藏选择器
      this.showBeginTime = false
    },
    handleEndTime (val) {
      var date = new Date(val)
      this.endTime = this.handleDate(date)
      // 隐藏选择器
      this.showEndTime = false
    },
    handleCancel () {
      // 隐藏选择器
      this.showBeginTime = false
      this.showEndTime = false
    },
    handleDate (val) {
      var date = new Date(val)
      var year = date.getFullYear()
      var month = date.getMonth() + 1
      var day = date.getDate()
      return `${year}年${month}月${day}日`
    }
  }
}
</script>

<style>
  .group-box {
    background-color: #343434;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
  .group-box .main-box {
    display: flex;
    height: 100%;
    flex-direction: column;
    justify-content: space-between;
  }
  .group-box .tip {
    font-size: 30px;
    line-height: 40px;
    margin-left: 30px;
    margin-top: 20px;
    color: #fff;
    font-weight: 700;
  }
  /* 选择时间 */
  .group-box .time-picker, .group-box .location-picker {
    margin-top: 30px;
    padding: 0 30px;
  } 
  .group-box .location-picker {
    margin-top: 0;
  }
  .group-box .van-cell {
    border-bottom: 1px solid #fff;
    background-color: transparent;
    padding: 10px 0;
    font-size: 16px;
  }
  .group-box .van-cell .time-tip {
    margin-right: 55px;
  }
  .group-box .van-cell .area-tip {
    margin-right: 88px;
  }
  .group-box .van-cell__value--alone {
    color: #fff;
  }
  .van-cell:not(:last-child)::after {
    border-bottom: none;
  }
  /* 发布 */
  .group-box .bottom-box .publish {
    background-color: #000;
    color: #909090;
    text-align: center;
    line-height: 46px;
    margin-top: 30px;
  }
  .group-box .bottom-box .read {
    margin-left: 30px;
    color: #fff;
    font-size: 14px;

  }
  .group-box .bottom-box .router-link-active {
    color: #fff;
  }
  .group-box .van-loading {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
</style>
