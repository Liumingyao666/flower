<template>
    <div class="aaaa">
        <el-row>
            <el-col :span="6" class="msa-col">

                <div class="msa">
                    <div class="grid-content bg-purple" id="myChart">
                      <img src="../assets/images/156156.png" width="100%" height="100%" >
                    </div>
                </div>
                <div class="msa">
                    <div class="bode_main">
                        <img src="https://ts1.cn.mm.bing.net/th/id/R-C.b5626c02041dc09b594ddca5e6f5e842?rik=G3Y8%2frGcx7leuQ&riu=http%3a%2f%2fwww.gx8899.com%2fuploads%2fallimg%2f2017110610%2fgux4mieu24t.jpg&ehk=9Sg9vfINz9Ck2TiR%2bxBwjC9v66BRNy0sgcn8xX5HLRQ%3d&risl=&pid=ImgRaw&r=0" alt="" class="tp_img" width="150px" height="150px">
                        <p>admin</p>
                        <p>超级管理员</p>
                    </div>

                </div>

            </el-col>
            <el-col :span="18" class="msa-col">
                <div class="right_main">
                    <div class="grid-content bg-purple" id="myChart1"></div>
                </div>
                <div class="right_main_bottom">
                  <h1 style="text-align: center;color: #ffc504;">开发系统用到的技术说明</h1>
                  <p style="text-align: center;color: #22863a;margin-top: 5px"><span>前端主要采用的技术：</span>vue , css , js , echarts , axios , element-ui</p>
                  <p style="text-align: center;color: #ad1d2b;margin-top: 5px"><span>后端主要采用的技术：</span>springboot , mybatis-plus , mysql , jwt , lombok</p>
                </div>
            </el-col>
        </el-row>
    </div>
</template>
<script>
  // 基于准备好的dom，初始化echarts实例

  export default {
    data() {
      return {
        msg: 'Welcome to Your Vue.js App',
      }
    },
    mounted() {

        this.drawLine1();
    },
    methods: {
        drawLine(){

            // 基于准备好的dom，初始化echarts实例
            let myChart = this.$echarts.init(document.getElementById('myChart'))
            // 绘制图表
            myChart.setOption({
                title: { text: '在Vue中使用echarts' },
                tooltip: {},
                xAxis: {
                 textStyle:{
                                        color:'#fff'
                                    },
                    data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
                },
                textStyle:{
                    color:'#fff'
                },
                yAxis: {},
                series: [{
                    name: '销量',
                    type: 'bar',
                    data: [5, 20, 36, 10, 10, 20]
                }]
            });
        },
        drawLine1(){
             this.$http.get('/mallGoods/shuliang').then(res => {
                let list = res.data;
                let newList = [];
                console.log(list,'0012');
                 for(let i = 0;i < list.length;i++){
                    if(i<10){
                        let newValue = list[i].goodsAmount;
                        let newName = list[i].goodsName;
                        newList.push({value:newValue,name:newName})
                     }
                  }
                    console.log(newList,'0011112');
                        // 基于准备好的dom，初始化echarts实例
                                    let myChart = this.$echarts.init(document.getElementById('myChart1'))
                                    // 绘制图表
                                    myChart.setOption({
                                         title: {
                                                text: '商城数据',
                                                subtext: '销量排行',
                                                left: 'center'
                                            },
                                            tooltip: {
                                                trigger: 'item'
                                            },
                                            legend: {
                                                orient: 'vertical',
                                                left: '0',
                                                top:'100',
                                                textStyle:{
                                                    color:'#000'
                                                }
                                            },
                                            textStyle:{
                                                color:'#000'
                                            },
                                            series: [
                                                {
                                                    name: '访问来源',
                                                    type: 'pie',
                                                    radius: '50%',
                                                    data: newList,
                                                    emphasis: {
                                                        itemStyle: {
                                                            shadowBlur: 10,
                                                            shadowOffsetX: 0,
                                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                        }
                                                    }
                                                }
                                            ]
                                    });


             });

        }


    }
  }
</script>
<style lang="less" scoped>
    .left-map {
        /*width: 100%;*/
        /*height: 200px;*/
        /*margin-top: 20px;*/
        /*background-color: white;*/
    }
    .tp_img{
        border-radius: 50%;
        display: block;
        margin: auto;
        padding: 40px;
    }
    #myChart6{
        height: 90%;
    }
    #myChart {
        width:100%;
        height: 80%;
    }
    #myChart1 {
        height: 90%;
        width:100%;
    }

    .el-row {
        height: 100%;
    }

    .aaaa {
        height: 100%;
      overflow: hidden;
    }

    .msa-col {
        height: 100%;

    }

    .msa {
        height: 45%;
        background: #fff;
      padding-top: 30px;
        margin-bottom: 20px;
    }
    .right_main{
        height: 70%;
        width: 98%;
        margin-left: 20px;
        margin-bottom: 20px;
        background: #fff;
    }

    .right_main_bottom{
        height: 28%;
        margin-top: 20px;
        margin-left: 20px;
           background: #fff;
      box-sizing: border-box;
    }
    .bode_main{
        width: 100%;
        height: 100%;
        background: #fff;
        font-size: 20px;
        text-align: center;
        color:#000;
    }
</style>
