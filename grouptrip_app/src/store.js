import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cid: 0,
    searchKws: "",
    uname: "",
    user: {},
    islogin: false
  },
  // 读取状态
  getters: {
    user: (state) => {
      return state.user;
    }
  },


  //修改状态值
  mutations: {
    setUser(state, user) {
      state.user = user;
    },
    setUname(state, uname) {
      state.uname = uname;
    },
    setIslogin(state, islogin) {
      state.islogin = islogin;
    },
    cityAlert: (state, cid) => {
      state.cid = cid;
      localStorage.setItem('cid', cid);
    },
    search(state, searchKws) {
      state.searchKws = searchKws;
    }
  },
  actions: {

  }
})