import axios from "axios";
import qs from "qs";
import store from './store'
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
axios.defaults.baseURL = 'http://localhost:3000'
const Axios = axios.create({
  withCredentials: true
})

Axios.interceptors.request.use(
  config => {
    if (config.method === "post") {
      config.data = qs.stringify(config.data)
    }
    if (localStorage.getItem("token")) {
      config.headers.token = localStorage.getItem("token");
    }
    if (sessionStorage.getItem("token")) {
      config.headers.token = sessionStorage.getItem("token");
    }
    return config;
    },
    error => {
      console.log(error);
      Promise.reject(error);
    }
);
Axios.interceptors.response.use(
  res => {
    if (res.data.status == 403) {
      localStorage.removeItem("token");
      sessionStorage.removeItem("token");
      store.commit("setIslogin", false);
      store.commit("setUname", "");
      store.commit("setUser", "");
    } else if (res.data.code == -1) {
        store.commit("setIslogin", false);
        store.commit("setUname", "");
    } else if (res.data.token) {
        store.commit("setUname", res.data.uname);
        store.commit("setIslogin", true);
        localStorage.setItem("token", res.data.token);
    }
    return res;
  },
  error => {
  }
)
export default {
  install: function (Vue, Option) {
    Vue.prototype.axios = Axios;
  }
}