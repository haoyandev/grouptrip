import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from './axios'
import store from './store'
import './assets/iconfont/iconfont'
import './assets/iconfont/travelicon.css'
import 'mint-ui/lib/style.css'
import MintUI from 'mint-ui'
import 'normalize.css'

Vue.config.productionTip = false;
Vue.use(axios);
Vue.use(MintUI);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')