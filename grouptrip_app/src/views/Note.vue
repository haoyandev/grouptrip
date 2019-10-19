<template>
  <div>
    <div>
      <div class="carousel">
        <div
          class="carousel-inner"
          :class="ulClass"
          @touchstart="touchstart"
          @touchmove="touchmove"
          :style="ulStyle"
          @touchend="touchend"
        >
          <div v-for="(img,i) of imgs" :key="i" class="carousel-item">
            <img :src="imgs[i]" :style="{width:innerWidth+'px'}" />
          </div>
          <div class="carousel-item">
            <img :src="imgs[0]" :style="{width:innerWidth+'px'}" />
          </div>
        </div>
      </div>
      <ul class="carousel-ul">
        <li v-for="(item,s) of imgs" @click="i=s" :key="s" :class="imgs[s]===imgs[i]&&'li-border'">
          <img :src="imgs[s]">
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  created() {
    this.a = setInterval(() => {
      this.i++;
    }, 3000);
  },
  data() {
    return {
      a: null,
      ulClass: {
        hasTran: true
      },
      i: 0,
      marginLeft: -50,
      leftsize: 0,
      leftstart: 0,
      innerWidth: window.innerWidth,
      imgs: [
        require("../assets/1.jpg"),
        require("../assets/2.jpg"),
        require("../assets/3.jpg"),
        require("../assets/4.jpg")
      ]
    };
  },
  computed: {
    ulStyle() {
      if (this.imgs.length === this.i) {
        setTimeout(() => {
          this.ulClass.hasTran = false;
          setTimeout(() => {
            this.i = 0;
            setTimeout(() => {
              this.ulClass.hasTran = true;
              setTimeout(() => {
                this.canClick = true;
              });
            }, 50);
          }, 50);
        }, 200);
      }
      var width = this.innerWidth * (this.imgs.length + 1) + "px";
      var marginLeft = -this.i * this.innerWidth + -this.leftsize / 5 + "px";
      return { width, marginLeft };
    }
  },
  methods: {
    time(num) {
      console.log(num);
    },
    touchend(e) {
      this.a = setInterval(() => {
        this.i++;
      }, 3000);
      if (this.leftsize > 50 && this.i < this.imgs.length) {
        this.leftsize = 0;
        ++this.i;
        if (this.imgs.length === this.i) {
          setTimeout(() => {
            this.ulClass.hasTran = false;
            setTimeout(() => {
              this.i = 0;
              setTimeout(() => {
                this.ulClass.hasTran = true;
                setTimeout(() => {
                  this.canClick = true;
                });
              }, 50);
            }, 50);
          }, 200);
        }
      } else if (this.leftsize < -50 && this.i > 0) {
        this.leftsize = 0;
        --this.i;
      }
    },
    touchstart(e) {
      clearInterval(this.a);
      this.leftstart = e.changedTouches[0].pageX;
    },
    touchmove(e) {
      var left = e.changedTouches[0].pageX;
      this.leftsize = this.leftstart - left;
      if (this.leftsize < 0 && this.i === 0) {
        this.leftsize = 0;
      }
    }
  }
};
</script>
<style scoped>
.li-border{
  border:1px solid red;
}
.carousel-ul{
  display: flex;
  width: 100%;
  list-style: none;
  padding:0;
}
.carousel-ul>li{
  width: 100%;
  box-sizing: border-box;
  padding:2px;
  text-align:center;
}
.carousel-ul>li>img{
  width: 100%
}
.hasTran {
  transition: all .25s linear;
}
.carousel {
  overflow: hidden;
}
.carousel-item {
  float: left;
}
</style>