<!-- @Description: 秒杀专区-->
<template>
  <div class="home" id="home" name="home">
    <!-- 轮播图 -->
    <div class="block">
      <img width="100%" src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3265838597,2644605925&fm=26&gp=0.jpg" alt="">
    </div>
    <!-- 轮播图END -->
    <div class="main-box" style="paddingTop:30px;">
      <div class="main" v-for="(item) in [applianceList[0]]" :key="item.id">
        <!-- 手机商品展示区域 -->
        <div class="phone">
          <div>
            <div class="column-head"><h3 class="head-a">抢购</h3></div>
            <div style="margin: 0 auto; height: 615px;width: 991px;marginTop:30px;">
              <MyList :list="item.goodsList" :isMore="false" :seckill="true"></MyList>
            </div>
          </div>
        </div>
        <!-- 手机商品展示区域END -->
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      carousel: "", // 轮播图数据
      phoneList: "", // 手机商品列表
      miTvList: "", // 小米电视商品列表
      applianceList: [], // 家电商品列表
      applianceHotList: "", //热门家电商品列表
      accessoryList: "", //配件商品列表
      accessoryHotList: "", //热门配件商品列表
      protectingShellList: "", // 保护套商品列表
      chargerList: "", //充电器商品列表
      applianceActive: 1, // 家电当前选中的商品分类
      accessoryActive: 1 // 配件当前选中的商品分类
    };
  },
  watch: {
    // 家电当前选中的商品分类，响应不同的商品数据
    applianceActive: function (val) {
      // 页面初始化的时候把applianceHotList(热门家电商品列表)直接赋值给applianceList(家电商品列表)
      // 所以在切换商品列表时判断applianceHotList是否为空,为空则是第一次切换,把applianceList赋值给applianceHotList
      if (this.applianceHotList == "") {
        this.applianceHotList = this.applianceList;
      }
      if (val == 1) {
        // 1为热门商品
        this.applianceList = this.applianceHotList;
        return;
      }
      if (val == 2) {
        // 2为电视商品
        this.applianceList = this.miTvList;
        return;
      }
    },
    accessoryActive: function (val) {
      // 页面初始化的时候把accessoryHotList(热门配件商品列表)直接赋值给accessoryList(配件商品列表)
      // 所以在切换商品列表时判断accessoryHotList是否为空,为空则是第一次切换,把accessoryList赋值给accessoryHotList
      if (this.accessoryHotList == "") {
        this.accessoryHotList = this.accessoryList;
      }
      if (val == 1) {
        // 1为热门商品
        this.accessoryList = this.accessoryHotList;
        return;
      }
      if (val == 2) {
        // 2为保护套商品
        this.accessoryList = this.protectingShellList;
        return;
      }
      if (val == 3) {
        //3 为充电器商品
        this.accessoryList = this.chargerList;
        return;
      }
    }
  },
  created() {
    // 获取轮播图数据
    this.$axios
        .get("/home/homeCarousel", {})
        .then(res => {
          this.carousel = res.data.data.dataList;
        })
        .catch(err => {
          return Promise.reject(err);
        });
    this.getPromo()
  },
  methods: {


    // 获取各类商品数据方法封装
    getPromo() {
      this.$axios
          .get("/home/homeGoodsList",)
          .then(res => {
            console.log(res)
            this.applianceList = res.data.data.dataList
            this.phoneList = res.data.data.dataMap
          })
          .catch(err => {
            return Promise.reject(err);
          });
    }
  }
};
</script>
<style scoped>
@import "../assets/css/index.css";
</style>