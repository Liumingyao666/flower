<!-- <template>
  <div>
    <a href="">
        <h1>京东秒杀</h1>
        <h3>10:00<span class="sp-1">&nbsp;点场 距结束</span></h3>
        <div class="times">
          <span class="hours" id="time1">{{h}}</span>
          :
          <span class="minutes" id="time2">{{m}}</span>
          :
          <span class="seconds" id="time3">{{s}}</span>
        </div>
      </a>
  </div>
</template>

<script>
export default {

  data(){
    return {
    endTime:+new Date("2023-04-08 20:00:00"),
        h:0,
        m:0,
        s:0
    }
  },
  methods: {
    //定义一个秒杀函数
seckill() {
  //每秒执行一次这个函数
    //获取当前的时间
    const nowTime = +new Date();

//获取相差多少秒
let disparity = this.endTime - nowTime;

//相差的毫秒数
//console.log(disparity);
//相差的秒数

disparity = disparity / 1000;

//取整
disparity = parseInt(disparity);
console.log(disparity);
if (disparity >= 0) {
  //根据剩余的秒数，算出剩余的小时
  this.h = parseInt(disparity / 3600);
  //根据剩余的秒数，算出剩余的分钟
  this.m = parseInt((disparity / 60) % 60);
  //根据剩余的秒数，算出剩余的秒数
  this.s = parseInt(disparity % 60);

  //利用2位数表示剩余的时间，如果小于10，就给前边加1个0
  if ( this.h < 10) {
      this.h = "0" +  this.h;
  }
  if ( this.m < 10) {
      this.m = "0" +  this.m;
  }
  if ( this.s < 10) {
      this.s = "0" +  this.s;
  }
} else {
  alert("秒杀结束");
  //console.log("秒杀结束,清除计时器");
  clearInterval(this.interval);
}

}
  },
  created() {
    this.seckill()
    let that = this
    this.interval =setInterval(function () {
        that.seckill()
}, 1000);
  },

  beforeDestroy() {
    clearInterval(this.interval)
  }
}
</script>

<style>
a {
  text-decoration: none;
  background-image: url(../assets/imgs/test.png);
  background-size: 100% 100%;
  display: block;
  width: 190px;
  height: 100%;
  color: #fff;
}
a h1 {
  text-align: center;
  padding-top: 50px;
}
a h3 {
  margin-top: 80px;
  text-align: center;
  display: block;
  margin-bottom: 40px;
}
a .sp-1 {
  font-size: 14px;
  font-weight: 300;
}
#time1,
#time2,
#time3 {
  width: 30px;
  height: 30px;
  background-color: #000;
  font-size: 20px;
  font-weight: 700;
  padding: 6px;
}
.times {
  padding-bottom: 34px;
  text-align: center;
}

</style> -->