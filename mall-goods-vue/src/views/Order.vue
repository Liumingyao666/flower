<!--我的订单页面组件-->
<template>
  <div class="order">
    <!-- 我的订单头部 -->
    <div class="order-header">
      <div class="order-header-content">
        <p>
          <i class="el-icon-s-order" style="font-size: 30px;color: #ff6700;"></i>
          我的订单
        </p>
      </div>
    </div>
    <!-- 我的订单头部END -->

    <!-- 我的订单主要内容 -->
    <div class="order-content" v-if="orders.length>0">
      <div class="content" v-for="(item,index) in orders" :key="index">
        <ul>
          <!-- 我的订单表头 -->
          <li class="order-info">
            <div class="order-id">订单编号: {{ item.orderUmber }} <span
                :class="item.isPay===1?'s2':'s1'">{{ item.isPay === 1 ? '已支付' : '未支付' }}</span></div>
            <div class="order-time">订单时间: {{ item.gmtCreate }}</div>
          </li>
          <li class="header">
            <div class="pro-img"></div>
            <div class="pro-name">商品名称</div>
            <div class="pro-price">单价</div>
            <div class="pro-num">数量</div>
            <div class="pro-total">小计</div>
            <div class="pro-ll">评价</div>
          </li>
          <!-- 我的订单表头END -->

          <!-- 订单列表 -->
          <li class="product-list" v-for="(product,i) in item.mallGoodsOrderVoList" :key="i">
            <div class="pro-img">
              <router-link :to="{ path: '/goods/details', query: {productID:product.goodsId} }">
                <img :src="$target + product.imgUrl"/>
              </router-link>
            </div>
            <div class="pro-name">
              <router-link
                  :to="{ path: '/goods/details', query: {productID:product.goodsId} }"
              >{{ product.goodsName }}
              </router-link>
            </div>
            <div class="pro-price">{{ product.univalent }}元</div>
            <div class="pro-num">{{ product.quantity }}</div>
            <div class="pro-total pro-total-in">{{ product.amount }}元</div>
            <div class="pro-ll">
              <el-button size="mini" type="success" @click="orderComment(product)" v-if="item.isPay!==2">评价</el-button>
            </div>
          </li>
        </ul>
        <div class="order-bar">
          <div class="order-bar-left">
            <span class="order-total">
              共
              <span class="order-total-num">{{ item.quantity }}</span> 件商品
            </span>
          </div>
          <div class="order-bar-right">
            <el-button size="mini" style="margin-right: 15px;background: red;color: white" v-if="item.isPay===2"
                       @click="uptOrder(item.orderUmber)">立即支付
            </el-button>

            <span>
              <span class="total-price-title">合计：</span>
              <span class="total-price">{{ item.amount }}元</span>
            </span>
          </div>
          <!-- 订单列表END -->
        </div>
      </div>
      <div style="margin-top:-40px;"></div>

      <el-dialog title='支付订单' :visible.sync='dialogAddMallGoods' width='50%' @close='closeInit'>
        <el-table :data="tableData" border style="width: 100%" size="mini" max-height="250">
          <el-table-column prop="goodsName" label="商品名称"></el-table-column>
          <el-table-column prop="univalent" label="价格"></el-table-column>
          <el-table-column prop="quantity" label="数量"></el-table-column>
          <el-table-column prop="amount" label="合计"></el-table-column>
        </el-table>
        <div style="margin: 10px">
          <el-card class="box-card">
            <div style="font-size: 20px">合计:<span style="font-weight:bold;font-size: 25px;padding: 10px;color:#22863a;">{{
                fromData.amount
              }}</span></div>
            <div style="font-size: 20px">账户余额:<span style="font-size: 15px;padding: 10px"
                                                    :class="fromData.balance-fromData.amount>0?'s2':'s1'">{{
                fromData.balance
              }}-{{ fromData.amount }}={{ fromData.balance - fromData.amount }}</span>
            </div>
            <div style="color: red" v-if="fromData.balance-fromData.amount<0">
              账户余额不足请充值
              <el-button @click="test" type="text">点击充值</el-button>
            </div>

          </el-card>
        </div>
        <div style="text-align: center;padding: 10px">
          <el-button size="mini" @click="dialogAddMallGoods=false">取消</el-button>
          <el-button size="mini" type="success" v-if="fromData.balance-fromData.amount>0" @click="orderPay">支付
          </el-button>
        </div>
      </el-dialog>

      <el-dialog title='订单评价' :visible.sync='dialogAddMallAs' width="40%" @close='closeAs'>
        <div style="text-align: center">
          评分:
          <el-rate v-model="comment.level"></el-rate>
        </div>
        <div style="margin-top: 20px">
          <el-input
              type="textarea"
              :rows="4"
              placeholder="请输入内容"
              v-model="comment.news">
          </el-input>
        </div>
        <div style="text-align: center;margin-top: 20px">
          <el-button type="primary" round size="mini" @click="saveComment">发布</el-button>
          <el-button round size="mini" @click="gbComment">取消</el-button>
        </div>
      </el-dialog>
    </div>
    <!-- 我的订单主要内容END -->

    <!-- 订单为空的时候显示的内容 -->
    <div v-else class="order-empty">
      <div class="empty">
        <h2>您的订单还是空的！</h2>
        <p>快去购物吧！</p>
      </div>
    </div>
    <!-- 订单为空的时候显示的内容END -->
  </div>
</template>
<script>
export default {
  data() {
    return {
      orders: [], // 订单列表
      total: [],// 每个订单的商品数量及总价列表
      dialogAddMallGoods: false,
      dialogAddMallAs: false,
      tableData: [],
      fromData: {
        amount: 0,
        balance: 0
      },
      comment: {},
      orderId: ""
    };
  },
  activated() {
    // 获取订单数据
    this.$axios
        .post("/goodsOrderApp/orderList")
        .then(res => {
          if (res.data.code === 20000) {
            this.orders = res.data.data.dataList;
          } else {
            this.notifyError(res.data.message);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
  },
  watch: {
    // 通过订单信息，计算出每个订单的商品数量及总价
    orders: function (val) {
      let total = [];
      for (let i = 0; i < val.length; i++) {
        const element = val[i];

        let totalNum = 0;
        let totalPrice = 0;
        for (let j = 0; j < element.length; j++) {
          const temp = element[j];
          totalNum += temp.product_num;
          totalPrice += temp.product_price * temp.product_num;
        }
        total.push({totalNum, totalPrice});
      }
      this.total = total;
    }
  },
  methods: {
    test() {
      this.dialogAddMallGoods = false
      this.$router.push({path: '/about'})
    },
    closeAs() {
    },
    uptOrder(res) {
      this.orderId = res
      this.dialogAddMallGoods = true
      this.$axios
          .get("/goodsOrderApp/getOrderData/" + res)
          .then(res => {
            if (res.data.code === 20000) {
              this.tableData = res.data.data.tableData;
              this.fromData.amount = res.data.data.amount
              this.fromData.balance = res.data.data.balance
            } else {
              this.notifyError(res.data.message);
            }
            console.log(res)
          })
          .catch(err => {
            return Promise.reject(err);
          });

    }
    , closeInit() {
      this.fromData = {amount: 0, balance: 0}
    },
    orderPay() {
      this.$axios
          .get("/goodsOrderApp/orderPay/" + this.orderId)
          .then(res => {
            if (res.data.code === 20000) {
              this.dialogAddMallGoods = false
              this.listPage()
              this.notifySucceed(res.data.message);
            } else {
              this.notifyError(res.data.message);
            }
            console.log(res)
          })
          .catch(err => {
            return Promise.reject(err);
          });
    },
    listPage() {
      // 获取订单数据
      this.$axios
          .post("/goodsOrderApp/orderList")
          .then(res => {
            if (res.data.code === 20000) {
              this.orders = res.data.data.dataList;
            } else {
              this.notifyError(res.data.message);
            }
          })
          .catch(err => {
            return Promise.reject(err);
          });
    },
    orderComment(res) {
      this.dialogAddMallAs = true
      this.comment.mallGoodsId = res.goodsId
      this.comment.goodsUserId = this.$store.getters.getUser.id
    },
    saveComment(){
      this.$axios
          .post("/commentGoods/saveOrUpdateCommentGoods",this.comment)
          .then(res => {
            if (res.data.code === 20000) {
              this.notifySucceed(res.data.message);
              this.comment={}
              this.dialogAddMallAs=false
            } else {
              this.notifyError(res.data.message);
            }
          })
          .catch(err => {
            return Promise.reject(err);
          });
    },
    gbComment(){
      this.comment={}
      this.dialogAddMallAs=false
    }
  }
};
</script>
<style scoped>
.s1 {
  color: red;
}

.s2 {
  color: #22863a;
}

.order {
  background-color: #f5f5f5;
  padding-bottom: 20px;
}

/* 我的订单头部CSS */
.order .order-header {
  height: 64px;
  border-bottom: 2px solid #ff6700;
  background-color: #fff;
  margin-bottom: 20px;
}

.order .order-header .order-header-content {
  width: 1225px;
  margin: 0 auto;
}

.order .order-header p {
  font-size: 28px;
  line-height: 58px;
  float: left;
  font-weight: normal;
  color: #424242;
}

/* 我的订单头部CSS END */
.order .content {
  width: 1225px;
  margin: 0 auto;
  background-color: #fff;
  margin-bottom: 50px;
}

.order .content ul {
  background-color: #fff;
  color: #424242;
  line-height: 85px;
}

/* 我的订单表头CSS */
.order .content ul .order-info {
  height: 60px;
  line-height: 60px;
  padding: 0 26px;
  color: #424242;
  border-bottom: 1px solid #ff6700;
}

.order .content ul .order-info .order-id {
  float: left;
  color: #ff6700;
}

.order .content ul .order-info .order-time {
  float: right;
}

.order .content ul .header {
  height: 85px;
  padding-right: 26px;
  color: #424242;
}

/* 我的订单表头CSS END */

/* 订单列表CSS */
.order .content ul .product-list {
  height: 85px;
  padding: 15px 26px 15px 0;
  border-top: 1px solid #e0e0e0;
}

.order .content ul .pro-img {
  float: left;
  height: 85px;
  width: 120px;
  padding-left: 80px;
}

.order .content ul .pro-img img {
  height: 80px;
  width: 80px;
}

.order .content ul .pro-name {
  float: left;
  width: 300px;
}

.order .content ul .pro-name a {
  color: #424242;
}

.order .content ul .pro-name a:hover {
  color: #ff6700;
}

.order .content ul .pro-price {
  float: left;
  width: 160px;
  padding-right: 18px;
  text-align: center;
}

.order .content ul .pro-num {
  float: left;
  width: 100px;
  text-align: center;
}

.order .content ul .pro-total {
  float: left;
  width: 160px;
  padding-right: 81px;
  text-align: right;
}

.order .content ul .pro-total-in {
  color: #ff6700;
}

.order .order-bar {
  width: 1185px;
  padding: 0 20px;
  border-top: 1px solid #ff6700;
  height: 50px;
  line-height: 50px;
  background-color: #fff;
}

.order .order-bar .order-bar-left {
  float: left;
}

.order .order-bar .order-bar-left .order-total {
  color: #757575;
}

.order .order-bar .order-bar-left .order-total-num {
  color: #ff6700;
}

.order .order-bar .order-bar-right {
  float: right;
}

.order .order-bar .order-bar-right .total-price-title {
  color: #ff6700;
  font-size: 14px;
}

.order .order-bar .order-bar-right .total-price {
  color: #ff6700;
  font-size: 30px;
}

/* 订单列表CSS END */

/* 订单为空的时候显示的内容CSS */
.order .order-empty {
  width: 1225px;
  margin: 0 auto;
}

.order .order-empty .empty {
  height: 300px;
  padding: 0 0 130px 558px;
  margin: 65px 0 0;
  background: url(../assets/imgs/cart-empty.png) no-repeat 124px 0;
  color: #b0b0b0;
  overflow: hidden;
}

.order .order-empty .empty h2 {
  margin: 70px 0 15px;
  font-size: 36px;
}

.order .order-empty .empty p {
  margin: 0 0 20px;
  font-size: 20px;
}

/* 订单为空的时候显示的内容CSS END */
</style>