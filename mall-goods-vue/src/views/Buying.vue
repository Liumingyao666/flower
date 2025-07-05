<template>
  <div class="su_card">
    <div class="sun_main" v-for="(item,index) in arrList" :index="item.id" :key="index">
      <!--      {{item}}-->
      <div class="sun_img">
        <img :src="$target+item.imgUrl" alt="">
      </div>
      <div class="sun_send_pf">
        <router-link :to="{path:'/buyingDetails',query: { buyingId:item.id}}" tag="li">
          <div class="sun_bt">
            <p>{{ item.buyingName }}</p>
          </div>
          <p style="width: 95% ;height: 30px;margin-top: 5px;text-overflow:ellipsis;overflow: hidden;">
            {{ item.buyingAddress }}</p>

          <p style="margin-top: 15px;font-size: 8px; color: #eeeeee">{{ item.createTime }}</p>
        </router-link>
      </div>
      <div class="sun_hhh">
        <p class="sun_zt">新旧:&nbsp;&nbsp;&nbsp;<span class="zt">{{ item.oldAndNew }}成新</span></p>
        <p class="sun_zt">价格:&nbsp;&nbsp;&nbsp;<span class="zt">{{ item.buyingPrice }}</span></p>
        <p class="sun_zt">报价:&nbsp;&nbsp;&nbsp;<span class="zt">{{ item.tender ? item.tender : 0 }}人</span></p>
      </div>
    </div>
    <div class="sun_fy">
      <el-pagination
          layout="prev, pager, next"
          @size-change='handleSizeChange'
          @current-change='handleCurrentChange'
          :current-page='page.current'
          :page-size='page.size'
          :total='page.total'>
      </el-pagination>
    </div>

  </div>
</template>
<script>
export default {
  name: "Addhealthcontrol",
  data() {
    return {
      arrList: [],
      mode: {},
      infoMode: {
        page: {
          current: 1,
          size: 10
        }
      },
      page: {
        current: 1,
        size: 10,
        total:0
      }
    }
  },
  methods: {
    queryPage() {
      // debugger
      this.$axios
          .post("/mallBuying/queryMallBuyingList", this.infoMode
          )
          .then(res => {
            if (res.data.code === 20000) {
              this.arrList = res.data.data.dataList.records
              this.page.current=res.data.data.dataList.current
              this.page.size=res.data.data.dataList.size
              this.page.total=res.data.data.dataList.total
            }

          })
          .catch(err => {
            return Promise.reject(err);
          });
    },
    handleSizeChange(newSize) {
      this.infoMode.page.size = newSize
      this.queryPage()
    },
    handleCurrentChange(newCurrent) {
      this.infoMode.page.current = newCurrent
      this.queryPage()
    }

  },
  created() {
    this.queryPage()
  }
}
</script>

<style lang="less" scoped>
.su_card {
  width: 65%;
  margin: auto;
  height: 800px;
  overflow: scroll;

  .sun_main {
    width: 100%;
    display: flex;
    border-bottom: #eeeeee solid 1px;
    margin: 20px;
    background: white;
    //头像样式
    .sun_img {
      width: 10%;
      //display: flex;
      //border-right: #eeeeee solid 1px;
      padding: 10px;

      img {
        width: 100px;
        height: 100px;
        display: block;
        //border-radius: 50%;
        margin: auto;
      }

      .sun_name {
        font-size: 10px;
        text-align: center;
      }
    }

    //评分主题
    .sun_send_pf {
      font-size: 10px;
      margin-left: 20px;
      width: 70%;
      //color: white;
      .sun_bt {
        font-size: 20px;
      }
    }

    .sun_hhh {
      font-size: 12px;
      padding-left: 20px;
      margin-bottom: 10px;
      border-left: #eeeeee solid 1px;

      .sun_zt {
        margin: 5px;

        .zt {
          color: #eac1c1;
        }
      }
    }

  }

  .sun_fy {
    display: flex;

    .el-pagination {
      margin: auto;
    }
  }
}
</style>
