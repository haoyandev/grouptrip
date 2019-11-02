<template>
  <div class="parent" :style="{height:inheight+250+'px'}">
    <div :style="active==='success'&&'display:none;'">
      <svg @click="jiantou" class="zuojiantou" aria-hidden="true">
        <use xlink:href="#iconzhixiangzuozuojiantou" />
      </svg>
      <h1 :style="active==='success'?'display:none;':'text-align:left;'" class="title">
        Hi,
        <br />欢迎开启group游
      </h1>
    </div>
    <mt-tab-container :style="all?'opacity:0':'opacity:1'" v-model="active">
      <div class="login" :style="{opacity:active!='login'?'0':'1',height:inheight+'px'}">
        <mt-tab-container-item class="width" id="login">
          <div class="user-input">
            <div class="user-input-uname" style="position:relative">
              <span>
                <svg class="user" aria-hidden="true">
                  <use xlink:href="#iconpersonal" />
                </svg>
              </span>
              <input
                v-model="user"
                type="text"
                maxlength="20"
                placeholder="手机号/邮箱/用户名"
                id="uname"
                v-focus
              />
            </div>
            <div class="user-input-pwd">
              <span>
                <svg class="upwd" aria-hidden="true">
                  <use xlink:href="#iconpd" />
                </svg>
              </span>
              <input v-model="pwd" type="password" maxlength="20" placeholder="输入密码" />
              <router-link to>忘记密码？</router-link>
            </div>
          </div>
          <div class="user-input-btn">
            <mt-button
              :disabled="user.length>=11&&pwd.length>=6&&drapopa?false:true"
              :style="user.length>=11&&pwd.length>=6&&drapopa?'opacity:1':'opacity:0.4'"
              size="large"
              id="user-next"
              @click="drapopa=false"
            >登录</mt-button>
            <div class="user-bottom">
              <router-link to @click.native="active='register'">注册新用户</router-link>
              <router-link to>境外手机号</router-link>
              <div>
                <router-link to>需要帮助?</router-link>
              </div>
            </div>

            <div class="drag" ref="dragDiv" :style="drapopa?'opacity:0':'opacity:1'">
              <div class="drag_bg"></div>
              <div class="drag_text">{{confirmWords}}</div>
              <div
                ref="moveDiv"
                @touchstart="mousedownFn($event)"
                :class="{'handler_ok_bg':confirmSuccess}"
                class="handler handler_bg"
                style="position: absolute;top: 0px;left: 0px;"
              ></div>
            </div>
          </div>
        </mt-tab-container-item>
      </div>
      <div class="success">
        <mt-tab-container-item class="width" id="success">
          <h1>{{msg}}</h1>
          <div :style="tisc?'opacity:1;margin-top:20px; transition:opacity 3s linear;':'opacity:0'">
            <h1>继续旅程吧</h1>
          </div>
        </mt-tab-container-item>
      </div>
      <div class="register" :style="active!='register'&&'opacity:0;'">
        <mt-tab-container-item class="width" id="register">
          <div class="user-input">
            <div class="user-input-pwd">
              <span>
                <svg class="user" aria-hidden="true">
                  <use xlink:href="#iconpersonal" />
                </svg>
              </span>
              <input maxlength="11" v-model="phone" type="text" placeholder="请输入合法的手机号" id="phone" />
            </div>
            <div class="user-input-pwd">
              <span>
                <svg class="upwd" aria-hidden="true">
                  <use xlink:href="#iconpd" />
                </svg>
              </span>
              <input maxlength="11" v-model="regpwd" type="password" placeholder="请输入6-12位的密码" />
            </div>
          </div>
          <div class="user-input-btn">
            <mt-button
              :style="phone.length===11&&regpwd.length>=6?'opacity:1':'opacity:0.4'"
              size="large"
              id="user-next"
              @click="register"
              :disabled="phone.length===11&&regpwd.length>=6?false:true"
            >立即注册</mt-button>
            <div class="user-bottom">
              <router-link to @click.native="active='login'">账号密码登录</router-link>
              <div>
                <router-link to>需要帮助?</router-link>
              </div>
            </div>
          </div>
        </mt-tab-container-item>
      </div>
    </mt-tab-container>
    <div :style="active==='success'&&'display:none'" id="parent-bottom">
      <div class="login-bottom">
        <router-link to>
          <svg class="taobao" aria-hidden="true">
            <use xlink:href="#icontaobao" />
          </svg>
        </router-link>
        <router-link to>
          <svg class="weixin" aria-hidden="true">
            <use xlink:href="#iconweixin" />
          </svg>
        </router-link>
        <router-link to>
          <svg class="qq" aria-hidden="true">
            <use xlink:href="#iconQQ" />
          </svg>
        </router-link>
        <router-link to>
          <svg class="weibo" aria-hidden="true">
            <use xlink:href="#iconweibo" />
          </svg>
        </router-link>
      </div>
      <div class="bottom-span">
        <span>第三方账号登陆</span>
      </div>
    </div>
  </div>
</template>
<script>
import touchCode from "vue-slide-verification";
export default {
  inject: ["reload"],
  created() {},
  data() {
    return {
      inheight: innerHeight - 250,
      all: false,
      tisc: false,
      msg: "", //登录成功后出现的页面字段
      height: "height:" + innerHeight + "px",
      drapopa: true,
      beginClientX: 0 /*距离屏幕左端距离*/,
      mouseMoveStata: false /*触发拖动状态  判断*/,
      maxwidth: "" /*拖动最大宽度，依据滑块宽度算出来的*/,
      confirmWords: "请拖动模块验证登录" /*滑块文字*/,
      confirmSuccess: false /*验证成功判断*/,
      regpwd: "",
      can: true,
      user: "", //保存用户账号
      pwd: "", //保存用户密码
      active: "login", //默认初始化显示的面板
      phone: "", //用户注册的手机号
      now: ["login", "register"]
    };
  },
  components: {
    touchCode
  },
  mounted() {
    this.maxwidth =
      this.$refs.dragDiv.clientWidth - this.$refs.moveDiv.clientWidth;
    document
      .getElementsByTagName("html")[0]
      .addEventListener("touchmove", this.mouseMoveFn);
    document
      .getElementsByTagName("html")[0]
      .addEventListener("touchend", this.moseUpFn);
  },
  methods: {
    handleReload() {
      this.reload(); // 在想要刷新页面的时候调用reload方法
    },
    mousedownFn: function(e) {
      if (!this.confirmSuccess) {
        e.preventDefault && e.preventDefault(); //阻止文字选中等 浏览器默认事件
        this.mouseMoveStata = true;
        this.beginClientX = e.changedTouches[0].clientX;
      }
    }, //mousedoen 事件
    successFunction() {
      this.confirmSuccess = true;
      this.confirmWords = "验证通过";
      // 验证成功后执行的axios
      var phone = this.user;
      var upwd = this.pwd;
      this.axios.post("/user/api/v1/login", { phone, upwd }).then(result => {
        // 登陆失败
        if (result.data.code !== 200) {
          this.$toast({
            message: result.data.msg,
            duration: 1500,
            iconClass: "icon icon-success"
          });
          setTimeout(() => {
            // 重新加载本页
            this.handleReload();
          }, 1500);
        } else {
          this.$toast({
            message: result.data.msg,
            duration: 1500,
            iconClass: "icon icon-success"
          });
          // 获取该用户的信息并且保存在store里和本地localStore里
          this.axios.get("/user/api/v1/detail").then(result => {
            if (result.data.code === 200) {
              // 显示欢迎语
              this.active = "success";
              var message = "Hi," + result.data.data.uname;
              var i = 0;
              var time = setInterval(() => {
                this.msg += message[i];
                i++;
                if (i > message.length - 1) {
                  clearInterval(time);
                  this.tisc = true;
                  setTimeout(() => {
                    this.all = true;
                    setTimeout(() => {
                      this.$router.push("/Personal");
                    }, 300);
                  }, 3000);
                }
              }, 300);
            }
          });
        }
      });
      if (window.addEventListener) {
        document
          .getElementsByTagName("html")[0]
          .removeEventListener("touchmove", this.mouseMoveFn);
        document
          .getElementsByTagName("html")[0]
          .removeEventListener("touchend", this.moseUpFn);
      } else {
        document
          .getElementsByTagName("html")[0]
          .removeEventListener("touchend", () => {});
      }
      document.getElementsByClassName("drag_text")[0].style.color = "#fff";
      document.getElementsByClassName("handler")[0].style.left =
        this.maxwidth + "px";
      document.getElementsByClassName("drag_bg")[0].style.width =
        this.maxwidth + "px";
    }, //验证成功函数
    mouseMoveFn(e) {
      if (this.mouseMoveStata) {
        let width = e.changedTouches[0].clientX - this.beginClientX;
        if (width > 0 && width <= this.maxwidth) {
          document.getElementsByClassName("handler")[0].style.left =
            width + "px";
          document.getElementsByClassName("drag_bg")[0].style.width =
            width + "px";
        } else if (width > this.maxwidth) {
          this.successFunction();
        }
      }
    }, //mousemove事件
    moseUpFn(e) {
      if (
        e.target.nodeName === "DIV" &&
        e.target.className.indexOf("handler") !== -1
      ) {
        this.mouseMoveStata = false;
        var width = e.changedTouches[0].clientX - this.beginClientX;
        if (width < this.maxwidth) {
          document.getElementsByClassName("handler")[0].style.left = 0 + "px";
          document.getElementsByClassName("drag_bg")[0].style.width = 0 + "px";
        }
      }
    },
    jiantou() {
      var i = this.now.indexOf(this.active);
      if (i > 0) {
        this.active = this.now[i - 1];
      } else {
        this.$router.push("/Personal");
      }
    },
    register() {
      console.log(1);
      var phoneReg = /^1[3456789]\d{9}$/;
      if (!phoneReg.test(this.phone)) {
        this.$messagebox("请输入合法的手机号");
        return;
      }
      // 判断密码格式
      var pwdReg = /^[0-9a-z]{6,12}$/i;
      if (!pwdReg.test(this.regpwd)) {
        this.$messagebox("密码格式不正确");
        return;
      }
      var data = { phone: this.phone, upwd: this.regpwd };
      this.axios.post("/user/api/v1/register", data).then(result => {
        console.log(result.data);
        if (result.data.code === 200) {
          this.$messagebox("注册成功").then(() => {
            this.axios.post("/user/api/v1/login", data).then(res => {
              this.$router.push("/Home");
            });
          });
        } else {
          // 注册失败
          this.$toast({
            message: result.data.msg,
            duration: 1500,
            iconClass: "iconfont iconhome"
          });
          this.phone = "";
          this.regpwd = "";
          document.getElementById("phone").focus();
        }
      });
    }
  },
  directives: {
    focus: {
      inserted(e) {
        e.focus();
      }
    }
  }
};
</script>
<style scoped>
* {
  transition: opacity 0.2s linear;
}
.title {
  line-height: 38px;
}
.success {
  width: 100%;
  position: absolute;
  margin-top: 50px;
}
.drag {
  position: relative;
  background-color: #e8e8e8;
  width: 100%;
  height: 34px;
  line-height: 34px;
  text-align: center;
  top: 30px;
}
.handler {
  width: 40px;
  height: 32px;
  border: 1px solid #ccc;
  cursor: move;
}
.handler_bg {
  background: #fff
    url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTEyNTVEMURGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTEyNTVEMUNGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2MTc5NzNmZS02OTQxLTQyOTYtYTIwNi02NDI2YTNkOWU5YmUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+YiRG4AAAALFJREFUeNpi/P//PwMlgImBQkA9A+bOnfsIiBOxKcInh+yCaCDuByoswaIOpxwjciACFegBqZ1AvBSIS5OTk/8TkmNEjwWgQiUgtQuIjwAxUF3yX3xyGIEIFLwHpKyAWB+I1xGSwxULIGf9A7mQkBwTlhBXAFLHgPgqEAcTkmNCU6AL9d8WII4HOvk3ITkWJAXWUMlOoGQHmsE45ViQ2KuBuASoYC4Wf+OUYxz6mQkgwAAN9mIrUReCXgAAAABJRU5ErkJggg==")
    no-repeat center;
}
.handler_ok_bg {
  background: #fff
    url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDlBRDI3NjVGMkQ2MTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDlBRDI3NjRGMkQ2MTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDphNWEzMWNhMC1hYmViLTQxNWEtYTEwZS04Y2U5NzRlN2Q4YTEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+k+sHwwAAASZJREFUeNpi/P//PwMyKD8uZw+kUoDYEYgloMIvgHg/EM/ptHx0EFk9I8wAoEZ+IDUPiIMY8IN1QJwENOgj3ACo5gNAbMBAHLgAxA4gQ5igAnNJ0MwAVTsX7IKyY7L2UNuJAf+AmAmJ78AEDTBiwGYg5gbifCSxFCZoaBMCy4A4GOjnH0D6DpK4IxNSVIHAfSDOAeLraJrjgJp/AwPbHMhejiQnwYRmUzNQ4VQgDQqXK0ia/0I17wJiPmQNTNBEAgMlQIWiQA2vgWw7QppBekGxsAjIiEUSBNnsBDWEAY9mEFgMMgBk00E0iZtA7AHEctDQ58MRuA6wlLgGFMoMpIG1QFeGwAIxGZo8GUhIysmwQGSAZgwHaEZhICIzOaBkJkqyM0CAAQDGx279Jf50AAAAAABJRU5ErkJggg==")
    no-repeat center;
}
.drag_bg {
  background-color: #7ac23c;
  height: 34px;
  width: 0px;
}
.drag_text {
  position: absolute;
  top: 0px;
  width: 100%;
  text-align: center;
  -moz-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  -o-user-select: none;
  -ms-user-select: none;
}

.bottom-span {
  position: absolute;
  left: 50%;
  bottom: 20px;
  transform: translate(-50%);
}
.bottom-span > span {
  font-size: 13px;
  font-weight: 300;
}

.login-bottom {
  position: absolute;
  bottom: 60px;
}
.width {
  width: 100%;
  /* padding-right:44px; */
}
.register {
  width: 100%;
  position: absolute;
}
.login {
  width: 100%;
  opacity: 1;
  height: 375px;
}

h1 {
  font-weight: 700;
  line-height: 1;
  margin: 0;
  color: #191919;
}

.user-bottom > div > a {
  float: right;
  margin-right: 5px;
  color: #6e6e6e;
}
.user-bottom a {
  float: left;
  margin-right: 10px;
  text-decoration: none;
  color: #1c1c1c;
  font-size: 12px;
}
.parent {
  position: relative;
  margin: 0 16px 0 16px;
  opacity: 1;
}
.user-input {
  margin-top: 30px;
}
.user-input input {
  padding: 14px 0px 8px 28px;
  border: 0px;
  width: 100%;
  font-size: 13px;
  outline: none;
}
.user-input-pwd > a {
  text-decoration: none;
  color: gray;
  font-size: 14px;
  position: absolute;
  top: 12px;
  right: 0;
}
.user-input-pwd {
  position: relative;
}

.user-input div {
  border-bottom: 1px solid #ccc;
}
#user-next label {
  justify-content: center;
}
#user-next {
  margin-top: 20px;
  margin-bottom: 24px;
  background: #11bf79;
  color: #fff;
  border-radius: 40px;
  opacity: 0.4;
  font-size: 15px;
}
</style>
<style >
.mint-button-text {
  justify-content: center;
}
</style>