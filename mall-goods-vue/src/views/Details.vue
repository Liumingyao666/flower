<!--商品详情页面组件 -->
<template>
  <div id="details">
    <!-- 头部 -->
    <div class="page-header">
      <div class="title">
        <p>{{ productDetails.goodsName }}</p>
        <div class="list">
          <ul>
            <li>
              <router-link to>概述</router-link>
            </li>
            <!--            <li>-->
            <!--              <router-link to>参数</router-link>-->
            <!--            </li>-->
            <li>
              <el-link href="#sunpxit">用户评价</el-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 头部END -->

    <!-- 主要内容 -->
    <div class="main">
      <!-- 左侧商品轮播图 -->
      <div class="block">
        <el-carousel height="560px" v-if="productPicture.length > 1">
          <el-carousel-item v-for="item in productPicture" :key="item">
            <img style="height:560px;" :src="$target + item" :alt="item" />
          </el-carousel-item>
        </el-carousel>
        <div v-if="productPicture.length == 1">
          <img
            style="height:560px; width: 560px"
            :src="$target + productPicture[0]"
            :alt="productPicture[0]"
          />
        </div>
      </div>
      <!-- 左侧商品轮播图END -->

      <!-- 右侧内容区 -->
      <div class="content">
        <h1 class="name">{{ productDetails.goodsName }}</h1>
        <p class="intro">{{ productDetails.goodsAddress }}</p>
        <div
          style="display:flex;justify-content:space-between;align-items: center;"
        >
          <span class="store">{{ productDetails.goodsOrigin }}</span>
          <div style="fontWeight:bold;" v-show="seckill">
            <span class="store">限时秒杀：</span>
            <span class="time">{{hour}}</span> : 
            <span class="time">{{min}}</span> : 
            <span class="time">{{sec}}</span>
          </div>
        </div>
        <div class="price">
          <span>{{ productDetails.goodsDiscount }}元</span>
          <span
            v-show="productDetails.goodsDiscount != productDetails.goodsPrice"
            class="del"
            >{{ productDetails.goodsPrice }}元</span
          >
        </div>
        <div class="pro-list">
          <span class="pro-name">{{ productDetails.goodsName }}</span>
          <span class="pro-price">
            <span>{{ productDetails.goodsDiscount }}元</span>
            <span
              v-show="productDetails.goodsDiscount != productDetails.goodsPrice"
              class="pro-del"
              >{{ productDetails.goodsPrice }}元</span
            >
          </span>
          <p class="price-sum">
            {{ seckill ? "秒杀价" : "总计" }} :
            {{ productDetails.goodsDiscount }}元
          </p>
        </div>
        <!-- 内容区底部按钮 -->
        <div class="button">
          <el-button
            class="shop-cart"
            :disabled="dis"
            v-if="seckill"
            @click="onSeckill"
            >{{seckillText}}</el-button
          >
          <el-button
            class="shop-cart"
            :disabled="dis"
            @click="addShoppingCart"
            v-else
            >加入购物车</el-button
          >
          <el-button class="like" @click="addCollect">喜欢</el-button>
        </div>
        <!-- 内容区底部按钮END -->
        <div class="pro-policy">
          <ul>
            <li v-for="item in productTag" :key="item">
              <i class="el-icon-circle-check"></i> {{ item }}
            </li>
          </ul>
        </div>
      </div>
      <!-- 右侧内容区END -->
    </div>
    <div class="sun_pl">
      <p class="sun_p_lj">花卉参数</p>
<!--      <p>证书编号：2021011606369670</p>
      <p>产品名称：Redmi 8A</p>
      <p>型号: 真我GT Neo 5G</p>
      <p>机身颜色: 最终幻想 骇客黑</p>
      <p>极客银运行内存RAM: 6GB 8GB 12GB
      <p>存储容量: 8+128GB 12+256GB 6+128GB</p>
      <p>网络模式: 双卡双待CPU型号: 天玑1200</p>-->
      <p>简介： {{ productDetails.goodsAddress}}</p>
      <p>繁殖方法： {{ productDetails.propagationMethod}}</p>
      <p>培育条件： {{ productDetails.cultivationConditions}}</p>
      <p>养护技巧： {{ productDetails.maintenanceTips}}</p>
      <p>注意事项： {{ productDetails.precautions}}</p>
      <p>应用场景： {{ productDetails.applicationScenarios}}</p>
      <p>观赏价值： {{ productDetails.viewingValue}}</p>
<!--      <p class="sun_p_lj">评论</p>-->


      <div id="sunpxit">
        <CommentSay type="二手" :discussList="arr"></CommentSay>
      </div>
    </div>
    <!-- 主要内容END -->
  </div>
</template>
<script>
import { mapActions } from "vuex";
import CommentSay from "@/components/CommentSay";
let timer = ''
export default {
  components: { CommentSay },
  data() {
    return {
      dis: false, // 控制“加入购物车按钮是否可用”
      productID: "", // 商品id
      productDetails: "", // 商品详细信息
      productPicture: "", // 商品图片
      productTag: "", // 标签
      arr: [],
      seckill: this.$route.query.seckill == "true",
      hour: "00",
      min: "00",
      sec: "00",
      seckillText:'立即秒杀'
    };
  },
  // 通过路由获取商品id
  activated() {
    console.log('进入页面2');
    console.log(this.$route.query.seckill);
    if (this.$route.query.productID != undefined) {
      this.productID = this.$route.query.productID;
    }
    this.seckill = this.$route.query.seckill;
    if(this.$route.query.seckill || this.$route.query.seckill == 'true'){
      this.seckillText='立即秒杀'
      this.setTime()
    }
      
    this.queryListOrPage();
  },
  watch: {
    // 监听商品id的变化，请求后端获取商品数据
    productID: function(val) {
      this.getDetails(val);
      this.getDetailsPicture(val);
    },
    // seckill:function(val){
    //   this.seckill = val
    //   this.seckillText='立即秒杀'
    // }
  },
  methods: {
    ...mapActions(["unshiftShoppingCart", "addShoppingCartNum"]),
    setTime(){
    clearInterval(timer);
    let time = 2 * 60 * 60 * 1000; // 定义一个两小时的毫秒数
    timer = window.setInterval(() => {
      if (time <= 0) {
        // 取消定时器(退出轮询)
        window.clearInterval(timer);
        return;
      }
      time -= 1000; // 进入轮询，将剩余时间减去1000毫秒
      let date = new Date(time);
      let hour = "0" + (date.getHours() - 8); // 北京是东八区，北京时间-8小时 = 格林尼治时间
      let min =
        date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
      let sec =
        date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
      this.hour = hour;
      this.min = min;
      this.sec = sec;
    }, 1000);
  },
    onSeckill(){
      if (this.seckillText !='秒杀成功，点击再次秒杀' && this.seckillText != '立即秒杀') {
        return
      }
      let sec = 0
      let timer = setInterval(() => {
          sec++
          this.seckillText = '正在秒杀 '+sec+'s...'
          if (sec == 7) {
          this.seckillText = '秒杀成功，点击再次秒杀'
          this.$message({
          message: '恭喜你，秒杀成功',
          type: 'success'
        });
          clearInterval(timer)
        }
      }, 1000);
    },
    // 获取商品详细信息
    getDetails(val) {
      this.$axios
        .get("/mallGoods/queryMallGoodsDetail/" + val)
        .then(res => {
          this.productDetails = res.data.data.information;
          this.productPicture = res.data.data.img_url;
          this.productTag = res.data.data.tag;

          console.log(res);
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    // 获取商品图片
    getDetailsPicture(val) {
      console.log(val);
    },
    // 加入购物车
    addShoppingCart() {
      // 判断是否登录,没有登录则显示登录组件
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      this.$axios
        .post("/mallGoods/collectionGoods", {
          userId: this.$store.getters.getUser.id,
          goodsId: this.productID,
          type: 2
        })
        .then(res => {
          switch (res.data.data.code) {
            case "001":
              console.log(res.data.data.shoppingCartData);
              // 新加入购物车成功
              this.unshiftShoppingCart(res.data.data.shoppingCartData);
              this.notifySucceed("新加入购物车成功");
              location.reload();
              break;
            case "002":
              //
              this.addShoppingCartNum(this.productID);
              this.notifySucceed("该商品已经在购物车，数量+1");
              break;
            case "003":
              //
              this.dis = true;
              this.notifyError("商品数量达到限购数量");
              break;
            default:
              this.notifyError(res.data.message);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    addCollect() {
      // 判断是否登录,没有登录则显示登录组件
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      this.$axios
        .post("/mallGoods/collectionGoods", {
          userId: this.$store.getters.getUser.id,
          goodsId: this.productID,
          type: 1
        })
        .then(res => {
          if (res.data.code == 20000) {
            // 添加收藏成功
            this.notifySucceed(res.data.message);
          } else {
            // 添加收藏失败
            this.notifyError(res.data.message);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    queryListOrPage() {
      this.$axios
        .get(
          "/commentGoods/queryCommentGoodsList/" + this.$route.query.productID
        )
        .then(res => {
          this.arr = res.data.data.dataList;
        })
        .catch(err => {
          return Promise.reject(err);
        });
    }
  }
};
</script>
<style lang="less">
.time{
  background-color: #ff6700;
  color: white;
  padding: 3px;
  border-radius: 3px;
}
/* 头部CSS */
#details .page-header {
  height: 64px;
  margin-top: -20px;
  z-index: 4;
  background: #fff;
  border-bottom: 1px solid #e0e0e0;
  -webkit-box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.07);
  box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.07);
}

#details .page-header .title {
  width: 1225px;
  height: 64px;
  line-height: 64px;
  font-size: 18px;
  font-weight: 400;
  color: #212121;
  margin: 0 auto;
}

#details .page-header .title p {
  float: left;
}

#details .page-header .title .list {
  height: 64px;
  float: right;
}

#details .page-header .title .list li {
  float: left;
  margin-left: 20px;
}

#details .page-header .title .list li a {
  font-size: 14px;
  color: #616161;
}

#details .page-header .title .list li a:hover {
  font-size: 14px;
  color: #ff6700;
}

/* 头部CSS END */

/* 主要内容CSS */
#details .main {
  width: 1225px;
  height: 560px;
  padding-top: 30px;
  margin: 0 auto;
}

#details .main .block {
  float: left;
  width: 560px;
  height: 560px;
}

#details .el-carousel .el-carousel__indicator .el-carousel__button {
  background-color: rgba(163, 163, 163, 0.8);
}

#details .main .content {
  float: left;
  margin-left: 25px;
  width: 640px;
}

#details .main .content .name {
  height: 30px;
  line-height: 30px;
  font-size: 24px;
  font-weight: normal;
  color: #212121;
}

#details .main .content .intro {
  color: #b0b0b0;
  padding-top: 10px;
}

#details .main .content .store {
  color: #ff6700;
  padding-top: 10px;
}

#details .main .content .price {
  display: block;
  font-size: 18px;
  color: #ff6700;
  border-bottom: 1px solid #e0e0e0;
  padding: 25px 0 25px;
}

#details .main .content .price .del {
  font-size: 14px;
  margin-left: 10px;
  color: #b0b0b0;
  text-decoration: line-through;
}

#details .main .content .pro-list {
  background: #f9f9fa;
  padding: 30px 60px;
  margin: 50px 0 50px;
}

#details .main .content .pro-list span {
  line-height: 30px;
  color: #616161;
}

#details .main .content .pro-list .pro-price {
  float: right;
}

#details .main .content .pro-list .pro-price .pro-del {
  margin-left: 10px;
  text-decoration: line-through;
}

#details .main .content .pro-list .price-sum {
  color: #ff6700;
  font-size: 24px;
  padding-top: 20px;
}

#details .main .content .button {
  height: 55px;
  margin: 10px 0 20px 0;
}

#details .main .content .button .el-button {
  float: left;
  height: 55px;
  font-size: 16px;
  color: #fff;
  border: none;
  text-align: center;
}

#details .main .content .button .shop-cart {
  width: 340px;
  background-color: #ff6700;
}

#details .main .content .button .shop-cart:hover {
  background-color: #f25807;
}

#details .main .content .button .like {
  width: 260px;
  margin-left: 40px;
  background-color: #b0b0b0;
}

#details .main .content .button .like:hover {
  background-color: #757575;
}

#details .main .content .pro-policy li {
  float: left;
  margin-right: 20px;
  color: #b0b0b0;
}

.sun_pl {
  width: 65%;
  margin: auto;

  .sun_p_lj {
    font-size: 25px;
    text-align: center;
    border-bottom: 1px solid #e0e0e0;
    border-top: 1px solid #e0e0e0;
    padding: 20px;
    margin: 20px;
  }
}

/* 主要内容CSS END */
</style>