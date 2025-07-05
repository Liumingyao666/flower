<template>
  <el-card class="su_card">
    <div class="sun_bju_1">
      <el-carousel height="360px">
        <el-carousel-item v-for="(item,index) in details.imgList" :key="index">
          <img style="height:360px;" :src="$target + item.imgUrl" alt="轮播图"/>
        </el-carousel-item>
      </el-carousel>
    </div>
    <div class="sun_bju_2">
      <p style="overflow: hidden;width: 70%;text-overflow:ellipsis; text-align: center">{{ details.buyingName }}</p>
      <p class="sun_date">{{ details.createTime }}</p>
    </div>
    <div class="sun_bju_3">
      <p>
        {{ details.buyingAddress }}
      </p>
    </div>
    <el-button @click="addGoodsAll">参与竞标</el-button>
    <el-card class="su_card_aa">
      <div class="sun_sp">
        <el-card :body-style="{ padding: '0px' }" class="aaww" v-for="(item,index) in details.goodsList" :index="index"
                 :key="index">
          <img :src="$target+item.imgUrl"
               class="image">
          <div style="padding: 14px;">
            <span>{{ item.goodsName }}</span>
            <div class="bottom clearfix">
              <time class="time"
                    style="width: 95% ;height: 30px;margin-top: 5px;text-overflow:ellipsis;overflow: hidden;">
                {{ item.buyingAddress }}
              </time>
              <router-link :to="{ path: '/goods/details', query: {productID:item.id} }" tag="a" style="color: blue">
                查看
              </router-link>
            </div>
          </div>
        </el-card>
      </div>
    </el-card>

    <p style="font-size: 20px;padding: 20px">评论:</p>
    <div class="ck">
      <CommentSay type="闲置" :discussList="details.commentGoods"></CommentSay>
    </div>

    <div class="sun_pl">
      <el-input
          type="textarea"
          placeholder="请输入内容"
          :rows="5"
          v-model="mode.news">

      </el-input>
    </div>
    <div style="text-align: center;margin: 20px">
      <el-button @click="release">发布</el-button>
      <el-button>返回</el-button>
    </div>


  </el-card>
</template>
<script>
import CommentSay from '@/components/CommentSay'

export default {
  name: "Addhealthcontrol",
  components: {CommentSay},
  data() {
    return {
      arr: [
        {
          id: 1,
          userName: "张三",
          content: "图文详细。深情并茂，易于了解。然后准确的表达出自己的意思和解决提出问题的能力。",
          creationTime: "2021-01-10 20:00:16",
          goode: {}
        }, {
          id: 2,
          userName: "孙最美",
          content: "图文详细。深情并茂，易于了解。然后准确的表达出自己的意思和解决提出问题的能力。",
          creationTime: "2021-01-10 20:00:16"
        }],
      carousel: [
        "/schoolMall/MALL_GOODS_IMG/idleGoods/1278946041459900418/6ed004d86212456aa9e10fba110b1f4d20210319.jpg",
        "/schoolMall/MALL_GOODS_IMG/idleGoods/1278946041459900418/2aa0e5c3cd43418cb08eff072ef1c45920210319.jpg",
        "/schoolMall/MALL_GOODS_IMG/idleGoods/1278946041459900418/be818d881ca744e7aff99e4329fcc6fd20210319.png"],
      arr1: [1],
      mode: {
        mallGoodsId: '',
        goodsUserId: ''
      },
      details: {}
    }
  },
  methods: {
    queryDetail() {
      this.$axios
          .get("/mallBuying/getByIdMallBuying/" + this.$route.query.buyingId
          ).then(res => {
        if (res.data.code === 20000) {
          this.details = res.data.data.entity
        }

      }).catch(err => {
        return Promise.reject(err);
      });
    },
    release() {
      this.$axios.post("/commentGoods/saveOrUpdateCommentGoods", this.mode).then(res => {
        if (res.data.code === 20000){
          this.mode.news=""
          this.queryDetail()
        }
      })
    },
    addGoodsAll(){
      this.$router.push({path: '/addIdle', query: {isType: 0,buyingId:this.$route.query.buyingId}})
    }
  },
  activated() {
    this.queryDetail()
    this.mode.mallGoodsId=this.$route.query.buyingId
    this.mode.goodsUserId=this.$store.getters.getUser.id
  }
}
</script>

<style lang="less" scoped>
.su_card {
  margin: auto;

  .sun_bju_1 {
    width: 70%;
    margin: auto;

    img {
      width: 100%;
      display: block;
      margin: auto;
    }

  }

  .sun_bju_2 {

    display: flex;
    //margin: auto;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border-bottom: #eeeeee solid 1px;
    padding: 30px;

    p {
      font-size: 30px;
    }

    .sun_date {
      font-size: 15px;
      color: #eeeeee;
    }
  }

  .sun_bju_3 {
    padding: 20px;
    height: 300px;
  }
}

.su_card {
  width: 65%;

  .su_card_aa {
    .sun_sp {
      height: 300px;
      flex-shrink: 0;
      overflow-x: auto;
      white-space: nowrap;

      .aaww {
        margin-left: 10px;
        margin-top: 10px;
        width: 24%;
        display: inline-block;

        .image {
          width: 100%;
          height: 180px;
        }
      }

    }
  }


}

.ck{
  height: 350px;
  flex-shrink: 0;
  overflow-x: auto;
  white-space: nowrap;
}

</style>
