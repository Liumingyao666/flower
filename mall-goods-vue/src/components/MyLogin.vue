<!--登录组件 -->
<template>
  <div id="myLogin">
    <el-dialog title="登录" width="300px" center :visible.sync="isLogin">
      <el-form :model="LoginUser" :rules="rules" status-icon ref="ruleForm" class="demo-ruleForm">
        <el-form-item prop="name">
          <el-input prefix-icon="el-icon-user-solid" placeholder="请输入账号" v-model="LoginUser.name"></el-input>
        </el-form-item>
        <el-form-item prop="pass">
          <el-input
              prefix-icon="el-icon-view"
              type="password"
              placeholder="请输入密码"
              v-model="LoginUser.pass"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button size="medium" type="primary" @click="Login" style="width:100%;">登录</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>
<script>
import {mapActions} from "vuex";

export default {
  name: "MyLogin",
  data() {
    return {
      LoginUser: {
        name: "",
        pass: ""
      },
      // 用户信息校验规则,validator(校验方法),trigger(触发方式),blur为在组件 Input 失去焦点时触发
      rules: {

      }
    };
  },
  computed: {
    // 获取vuex中的showLogin，控制登录组件是否显示
    isLogin: {
      get() {
        return this.$store.getters.getShowLogin;
      },
      set(val) {
        this.$refs["ruleForm"].resetFields();
        this.setShowLogin(val);
      }
    }
  },
  //登录接口所在
  methods: {
    ...mapActions(["setUser", "setShowLogin"]),
    Login() {
      this.$axios
          .post("/user/login", {
            username: this.LoginUser.name,
            password: this.LoginUser.pass
          })
          .then(res => {
            // “001”代表登录成功，其他的均为失败
            if (res.data.code === 20000) {
              // 隐藏登录组件
              this.isLogin = false;
              // 登录信息存到本地
              let user = JSON.stringify(res.data.data.user);
              localStorage.setItem("user", user);
              localStorage.setItem("token", res.data.data.token);
              localStorage.setItem("trolleyAmount", res.data.data.trolleyAmount);
              // 登录信息存到vuex
              this.setUser(res.data.data.user);
              // 弹出通知框提示登录成功信息
              this.notifySucceed(res.data.message);
              if (this.$route.path==='/about'){
                location.reload();
              }

            } else {
              // 清空输入框的校验状态
              this.$refs["ruleForm"].resetFields();
              // 弹出通知框提示登录失败信息
              this.notifyError(res.data.message);
            }
          })
          .catch(err => {
            return Promise.reject(err);
          });

    }
  }
};
</script>
<style>
</style>