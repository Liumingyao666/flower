<!-- 首页组件-->
<template>
  <div class="home" id="home" name="home">
    <!-- 秒杀测试 -->
    <my-count-down/>
    <!-- 放大镜效果 -->
    <magnifying-glass/>
    <!-- 轮播图 -->
    <div class="block">
      <el-carousel height="500px">

        <el-carousel-item v-for="(item,index) in imgSUrl" :key="index">
          <img style="width:100%;height:100%;" :src="item" >
        </el-carousel-item>

      </el-carousel>
    </div>
    <!-- 轮播图END -->
    <div class="main-box">
      <div class="main" v-for="(item,index) in applianceList" :key="item.id">
 
        <div class="phone">
          <div class="box-hd">
            <div class="title">{{ item.typeName }}</div>
          </div>
          <div class="box-bd">
            <div class="promo-list">
              <router-link to v-if="phoneList[index]">
<!--                <img :src="$target +phoneList[index].value"/>-->
<!--                <img src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ba7c4eccf6864b9101c28d2ca9cc71e2.jpg?w=1708&h=868"/>-->
              </router-link>
            </div>
            <div class="list">
              <MyList :list="item.goodsList" :isMore="true"></MyList>
            </div>
          </div>
        </div>
        <!-- 手机商品展示区域END -->
      </div>
    </div>
  </div>
</template>
<script>
import MagnifyingGlass from '../components/MagnifyingGlass.vue';
import MyCountDown from '../components/MyCountDown.vue';



export default {
  components: {MyCountDown, MagnifyingGlass},
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
      accessoryActive: 1, // 配件当前选中的商品分类
      imgSUrl:[

        "https://img.tukuppt.com/bg_grid/00/15/30/f0b9cvnnPD.jpg!/fh/350",
          "https://ts1.cn.mm.bing.net/th/id/R-C.79ed075aaedd7cda4ad08bdc364252cd?rik=NtuvWGnL%2bwiwzA&riu=http%3a%2f%2fwww.dmaku.com%2fdemo%2fmoban%2f2017052552491025%2fimages%2fsycase3.jpg&ehk=7P7XTGB%2b3D9S5IKXMYoPamwyTG6H1jPcHd%2fsTl7FTfg%3d&risl=&pid=ImgRaw&r=0",
          "https://img.tukuppt.com/ad_preview/00/19/11/5c99f7c852662.jpg!/fw/980"
      ]
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
 
        this.applianceList = this.applianceHotList;
        return;
      }
      if (val == 2) {
    
        this.applianceList = this.miTvList;
        return;
      }
    },
    accessoryActive: function (val) {
      if (this.accessoryHotList == "") {
        this.accessoryHotList = this.accessoryList;
      }
      if (val == 1) {
        
        this.accessoryList = this.accessoryHotList;
        return;
      }
      if (val == 2) {
        this.accessoryList = this.protectingShellList;
        return;
      }
      if (val == 3) {
        this.accessoryList = this.chargerList;
        return;
      }
    }
  },
  created() {
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
            this.applianceList = res.data.data.dataList//商品类型
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