import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    city:[],
    groupInfo: {},
    cid: 0,
    searchKws: "",
    uname: "",
    user: {},
    isLogin: false,
    page:'/Home'
  },
  // 读取状态
  getters: {
    city:(state)=>{
      return state.city
    },
    isLogin:(state)=>{
      return state.isLogin;
    },
    user: (state) => {
      return state.user;
    },
    page:(state)=>{
      return state.page;
    }
  },
  //修改状态值
  mutations: {
    setCity(state,city){
      state.city.push(city);
    },
    setPage(state,page){
      state.page=page;
    },
    setUser(state, user) {
      state.user = user;
    },
    setUname(state, uname) {
      state.uname = uname;
    },
    setIsLogin(state, status) {
      state.isLogin = status;
    },
    cityAlert: (state, cid) => {
      state.cid = cid;
      localStorage.setItem('cid', cid);
    },
    search(state, searchKws) {
      state.searchKws = searchKws;
    },
    setGroupInfo (state, obj) {
      Object.assign(state.groupInfo, obj)
    },
    updateBirth (state, birth) {
      state.user.birthday = birth
    },
  },

  actions: {
  
  }
})