<!-- <template>
    
        <!-- 上方一张大图,放大镜,遮罩层 -->
        <div class="img_box" ref="img_box" @mousemove="move" @mouseover="flag=true" @mouseout="flag=false">
            <img src="../assets/imgs/cart-empty.png" />
            <div class="big_img_box" v-show="flag">
                <img src="../assets/imgs/cart-empty.png" :style="{left:left+'px',top:top+'px'}" alt />
            </div>
            <div class="mark" :style="{left:l+'px',top:t+'px'}" v-show="flag"></div>
        </div>
    
  </template>
  
  <script>
  export default {
  
    data(){
      return {
                flag: false,
                // 放大镜图坐标
                left: 0,
                top: 0,
                // 遮罩层坐标
                l: 0,
                t: 0,
      }
    },
    methods: {
        move(e) {
                // 鼠标相对于网页左上角的坐标
                var x = e.pageX;
                var y = e.pageY;
                // 大图相对于网页左上角的坐标
                var ot = this.$refs.img_box.offsetTop;
                var ol = this.$refs.img_box.offsetLeft;
                // 计算鼠标相对于大图左上角的坐标
                x -= ol;
                y -= ot;
                // 限制鼠标相对于大图的坐标变化范围
                x = x < 130 ? 130 : x;
                x = x > 270 ? 270 : x;
                y = y < 130 ? 130 : y;
                y = y > 270 ? 270 : y; 
                // 在这个范围内,让遮罩层跟随鼠标移动
                this.l = x - 130;
                this.t = y - 130;
                // 计算放大镜图片坐标
                // 左侧图片移动范围 270 - 130 = 140 
                // 右侧大图移动范围 760 - 480 = 280
                // 得出: 右侧大图和左侧小图移动的坐标比例关系  280 / 140 = 2
                // this.left = -(x - 130) * 2;
                // this.top = -(y - 130) * 2
                this.left = -2 * x + 260;
                this.top = -2 * y + 260;

            }
    },
    created() {
      
    },
  
   
  }
  </script>
  

<style scoped> /*scoped 样式隔离*/
    .img_box {
        width: 400px;
        position: relative;
        cursor: crosshair;
    }

    .img_box img {
        width: 400px;
        height: 400px;
        border-radius: 10px;
    }

    .img_btns img {
        width: 80px;
        float: left;
        box-sizing: border-box;
        border: 2px solid white;
    }

    .img_btns .active {
        border-color: rgb(110, 73, 110);
    }

    .big_img_box {
        position: absolute;
        top: 0px;
        left: 402px;
        width: 480px;
        height: 480px;
        overflow: hidden;
        z-index: 100;
        border-radius: 10px;
    }

    .mark {
        width: 260px;
        height: 260px;
        position: absolute;
        top: 0;
        left: 0;
        background: rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }

    .big_img_box img {
        width: 760px;
        position: absolute;
        left: 0;
        top: 0;
    }
</style> -->