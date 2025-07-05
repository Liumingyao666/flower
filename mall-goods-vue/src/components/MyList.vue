<!--列表组件，用于首页、全部商品页面的商品列表-->
<template>
  <div id="myList" class="myList">
    <ul>
      <li v-for="item in list" :key="item.product_id" class="card">
        <el-popover placement="top" width="160">
          <p>确定删除吗？</p>
          <div style="text-align: right; margin: 10px 0 0">
            <el-button type="primary" size="mini" @click="deleteCollect(item.id)">确定</el-button>
          </div>
          <i class="el-icon-close delete-btn" slot="reference" v-show="isDelete"></i>
        </el-popover>
        <router-link :to="{ path: '/goods/details', query: {productID:item.id, seckill:seckill} }" class="content-link">
          <img :src="$target + item.imgUrl" alt="Image of the flower" class="flower-img"/>
          <h2>{{item.goodsName}}</h2>
          <!-- 根据addressLabel显示不同的内容 -->
          <div v-if="addressLabel === 'good'" class="info-section">
            <p class="truncate">{{ item.goodsAddress }}</p>
          </div>
          <div v-if="addressLabel === 'propagation'" class="info-section">
            <p class="truncate">{{ item.propagationMethod }}</p>
            <p class="truncate">{{ item.cultivationConditions }}</p>
          </div>
          <div v-if="addressLabel === 'maintenance'" class="info-section">
            <p class="truncate">{{ item.maintenanceTips }}</p>
            <p class="truncate">{{ item.precautions }}</p>
          </div>
          <div v-if="addressLabel === 'scenarios'" class="info-section">
            <p class="truncate">{{ item.applicationScenarios }}</p>
            <p class="truncate">{{ item.viewingValue }}</p>
          </div>
        </router-link>
      </li>
      <li v-show="isMore && list.length >= 1" id="more">
        <router-link :to="{ path: '/goods', query: {categoryID: categoryID} }" class="more-link">
          浏览更多
          <i class="el-icon-d-arrow-right"></i>
        </router-link>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  name: "MyList",
  // list为父组件传过来的商品列表
  // isMore为是否显示“浏览更多”
  props: ["list", "isMore", "isDelete","seckill", "addressLabel"],
  data() {
    return {};
  },
  computed: {
    // 通过list获取当前显示的商品的分类ID，用于“浏览更多”链接的参数
    categoryID: function() {
      console.log(this.list)
      let categoryID = [];
      if (this.list != "") {
        for (let i = 0; i < this.list.length; i++) {
          const id = this.list[i].goodsTypeCode;
          if (!categoryID.includes(id)) {
            categoryID.push(id);
          }
        }
      }
      return categoryID;
    }
  },
  methods: {
    deleteCollect(product_id) {
      this.$axios
        .post("/mallGoods/removeGoods", {
          userId: this.$store.getters.getUser.id,
          goodsId: product_id,
          type:1
        })
        .then(res => {
          switch (res.data.code) {
            case 20000:
              // 删除成功
              // 删除删除列表中的该商品信息
              // for (let i = 0; i < this.list.length; i++) {
              //   const temp = this.list[i];
              //   if (temp.product_id == product_id) {
              //     this.list.splice(i, 1);
              //   }
              // }
              // 提示删除成功信息
              this.notifySucceed(res.data.msg);
              location.reload();
              break;
            default:
              // 提示删除失败信息
              this.notifyError(res.data.msg);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    }
  }
};
</script>
<style scoped>
.myList ul li {
  z-index: 1;
  float: left;
  width: 234px;
  height: 280px;
  padding: 10px 0;
  margin: 0 0 14.5px 13.7px;
  background-color: white;
  -webkit-transition: all 0.2s linear;
  transition: all 0.2s linear;
  position: relative;
}
.myList ul li:hover {
  z-index: 2;
  -webkit-box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
  -webkit-transform: translate3d(0, -2px, 0);
  transform: translate3d(0, -2px, 0);
}
.myList ul li img {
  display: block;
  width: 160px;
  height: 160px;
  background: url(../assets/imgs/placeholder.png) no-repeat 50%;
  margin: 0 auto;
}
.myList ul li h2 {
  margin: 25px 10px 0;
  font-size: 14px;
  font-weight: 400;
  color: #333;
  text-align: center;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
.myList ul li h3 {
  margin: 5px 10px;
  height: 18px;
  font-size: 12px;
  font-weight: 400;
  color: #b0b0b0;
  text-align: center;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
.myList ul li p {
  margin: 10px 10px 10px;
  text-align: center;
  color: #ff6700;
}
.myList ul li p .del {
  margin-left: 0.5em;
  color: #b0b0b0;
  text-decoration: line-through;
}
.myList #more {
  text-align: center;
  line-height: 280px;
}
.myList #more a {
  font-size: 18px;
  color: #333;
}
.myList #more a:hover {
  color: #ff6700;
}
.myList ul li .delete {
  position: absolute;
  top: 10px;
  right: 10px;
  display: none;
}
.myList ul li:hover .delete {
  display: block
}
.myList ul li .delete:hover {
  color: #ff6700;
}
.card {
  border: 1px solid #ebeef5;
  border-radius: 4px;
  overflow: hidden;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
  margin: 10px;
  width: 200px;
  text-align: center;
}

.flower-img {
  width: 100%;
  height: auto;
}
.delete-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  cursor: pointer;
  color: red;
}
.content-link {
  text-decoration: none;
  color: inherit;
}
.info-section p {
  font-size: 14px;
  line-height: 1.5;
}
.truncate {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}
.more-link {
  display: block;
  padding: 10px;
  background-color: #409eff;
  color: white;
  text-decoration: none;
  border-radius: 4px;
}
</style>