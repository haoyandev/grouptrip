import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    groupInfo: {}
  },
  mutations: {
    setGroupInfo (state, obj) {
      Object.assign(state.groupInfo, obj)
    }
  },
  actions: {
  
  }
})
