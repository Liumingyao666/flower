/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : school_mall

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 08/03/2025 16:09:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buying_goods
-- ----------------------------
DROP TABLE IF EXISTS `buying_goods`;
CREATE TABLE `buying_goods`  (
  `id` bigint NOT NULL COMMENT '主键',
  `buying_id` bigint NOT NULL COMMENT '求购信息id',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品求购信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buying_goods
-- ----------------------------

-- ----------------------------
-- Table structure for comment_goods
-- ----------------------------
DROP TABLE IF EXISTS `comment_goods`;
CREATE TABLE `comment_goods`  (
  `id` bigint NOT NULL COMMENT '组件',
  `mall_goods_id` bigint NOT NULL COMMENT '商品id',
  `goods_user_id` bigint NOT NULL COMMENT '用户id',
  `news` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论',
  `level` tinyint NULL DEFAULT NULL COMMENT '评分1-5',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评分' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment_goods
-- ----------------------------
INSERT INTO `comment_goods` VALUES (1636251948836802561, 1636247822233063425, 1636243656873955329, '1111', 5, '2023-03-16 06:23:59');
INSERT INTO `comment_goods` VALUES (1658364093912805377, 1636247425896501250, 1636243656873955329, '好', 5, '2023-05-16 06:49:46');
INSERT INTO `comment_goods` VALUES (1670724586722127873, 1636247425896501250, 1670274934042345474, '真不错v！', 5, '2023-06-19 09:25:57');
INSERT INTO `comment_goods` VALUES (1670724655697457153, 1636247425896501250, 1670274934042345474, '好', 5, '2023-06-19 09:26:13');
INSERT INTO `comment_goods` VALUES (1670727256904134658, 1636246843571916801, 1670274934042345474, '非常好', 5, '2023-06-19 09:36:33');
INSERT INTO `comment_goods` VALUES (1759463348893716481, 1636248156569423873, 1759461973598212098, '花很香', 5, '2024-02-19 06:22:06');
INSERT INTO `comment_goods` VALUES (1760909631089074177, 1636246843571916801, 1636243656873955329, '好看', 5, '2024-02-23 06:09:07');

-- ----------------------------
-- Table structure for goods_address
-- ----------------------------
DROP TABLE IF EXISTS `goods_address`;
CREATE TABLE `goods_address`  (
  `id` bigint NOT NULL COMMENT '主键',
  `goods_user_id` bigint NOT NULL COMMENT '绑定goods_user主键',
  `province` varchar(28) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '省',
  `city` varchar(28) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '市',
  `county` varchar(28) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '区/县',
  `consignee` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '手机号码',
  `mail_code` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '邮编',
  `address` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '详细地址',
  `note` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_address
-- ----------------------------
INSERT INTO `goods_address` VALUES (1658360913644711938, 1636243656873955329, '安徽省', '合肥市', '肥西', '哈哈', '15855324577', '502317', '504', '啊哈哈', '2023-05-16 06:37:07');
INSERT INTO `goods_address` VALUES (1670275217778622465, 1670274934042345474, 'gd', '阳江市', '丽江市玉', '113', '18818999921', '529500', '丽江市玉龙县丽江古城以北15公里处（玉龙雪山风景区）', NULL, '2023-06-18 03:40:19');
INSERT INTO `goods_address` VALUES (1759462442664005633, 1759461973598212098, '广东省', '广州市', '番禺区', 'lisi', '1234565', '123456', '小学', '123456', '2024-02-19 06:18:30');

-- ----------------------------
-- Table structure for goods_send_user
-- ----------------------------
DROP TABLE IF EXISTS `goods_send_user`;
CREATE TABLE `goods_send_user`  (
  `id` bigint NOT NULL COMMENT '主建',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `goods_user_id` bigint NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户发布闲置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_send_user
-- ----------------------------

-- ----------------------------
-- Table structure for goods_top_up
-- ----------------------------
DROP TABLE IF EXISTS `goods_top_up`;
CREATE TABLE `goods_top_up`  (
  `id` bigint NOT NULL COMMENT '主建',
  `account_id` bigint NULL DEFAULT NULL COMMENT '账户id',
  `goods_top_up_money` decimal(10, 0) NULL DEFAULT NULL COMMENT '充值金额',
  `account_balance` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '拒绝原因',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint NULL DEFAULT NULL COMMENT '商城用户id',
  `is_pay` int NULL DEFAULT 1 COMMENT '1成功,2待确定,3,拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '充值记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_top_up
-- ----------------------------
INSERT INTO `goods_top_up` VALUES (1636251156394364930, 1636243656941064194, 1000000, NULL, '2023-03-16 06:20:50', 1636243656873955329, 1);
INSERT INTO `goods_top_up` VALUES (1658004311402041346, 1636243656941064194, 500, NULL, '2023-05-15 07:00:07', 1636243656873955329, 1);
INSERT INTO `goods_top_up` VALUES (1670275312498589697, 1670274934042345475, 100000, NULL, '2023-06-18 03:40:41', 1670274934042345474, 1);
INSERT INTO `goods_top_up` VALUES (1759462518929035265, 1759461973619183618, 1000000, NULL, '2024-02-19 06:18:48', 1759461973598212098, 1);
INSERT INTO `goods_top_up` VALUES (1760909338842554370, 1636243656941064194, 10000, NULL, '2024-02-23 06:07:57', 1636243656873955329, 1);
INSERT INTO `goods_top_up` VALUES (1760918258088730626, 1636243656941064194, 1000, NULL, '2024-02-23 06:43:24', 1636243656873955329, 2);
INSERT INTO `goods_top_up` VALUES (1898034684529483778, 1636243656941064194, 1111111111, NULL, '2025-03-07 15:35:07', 1636243656873955329, 2);

-- ----------------------------
-- Table structure for goods_user
-- ----------------------------
DROP TABLE IF EXISTS `goods_user`;
CREATE TABLE `goods_user`  (
  `id` bigint NOT NULL COMMENT '主建',
  `username` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `mg_state` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否开启 1开 0关',
  `password` varchar(488) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `email` varchar(38) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商城用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_user
-- ----------------------------
INSERT INTO `goods_user` VALUES (1636243656873955329, '11', '11', 1, 'ebb5929402d94370daf07046f4064f40', '51869114f45e0008a1485c803a10072d', '2023-03-16 05:51:02', NULL, NULL);
INSERT INTO `goods_user` VALUES (1670274673005641730, 'zhangsan', '18645230407@163.com', 1, 'e917764477d3c36db952c1d3f831b751', '59d10bba812c4951cd6ceda5e89f70f5', '2023-06-18 03:38:09', NULL, NULL);
INSERT INTO `goods_user` VALUES (1670274934042345474, '123', '18645230407@163.com', 1, '7300a1b98dbd8ed1e5960dece2162129', '82f949e9939888e7e671312795326b9f', '2023-06-18 03:39:11', NULL, NULL);
INSERT INTO `goods_user` VALUES (1759461973598212098, 'lisi', 'lisi@qq.com', 1, 'fa2a81fee6c312b9e7ea5cf5dffc8e78', '4a9daaacc94ee2a4ad41c0345d15d73a', '2024-02-19 06:16:38', NULL, NULL);
INSERT INTO `goods_user` VALUES (1760911567423070210, '111', '111@qq.com', 1, 'd4637ac16909d81d893f00b0de422092', '69e78497d39add8d29b1f7fa13e7f139', '2024-02-23 06:16:48', NULL, NULL);
INSERT INTO `goods_user` VALUES (1760918409918341122, '333', '333@qq.com', 1, '12d464bf5be6bfb4c4d3e6ded8abc04e', '14eb4b15e29c6fc31bab01ec8571b9a5', '2024-02-23 06:44:00', NULL, NULL);

-- ----------------------------
-- Table structure for goods_user_account
-- ----------------------------
DROP TABLE IF EXISTS `goods_user_account`;
CREATE TABLE `goods_user_account`  (
  `id` bigint NOT NULL COMMENT '主建',
  `goods_user_id` bigint NOT NULL COMMENT '用户id',
  `money` decimal(10, 0) NOT NULL COMMENT '余额',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_user_account
-- ----------------------------
INSERT INTO `goods_user_account` VALUES (1499061151181045761, 1499061151118131201, 0, '2022-03-02 16:36:44');
INSERT INTO `goods_user_account` VALUES (1636243656941064194, 1636243656873955329, 939159, '2023-03-16 05:51:02');
INSERT INTO `goods_user_account` VALUES (1670274673102110721, 1670274673005641730, 0, '2023-06-18 03:38:09');
INSERT INTO `goods_user_account` VALUES (1670274934042345475, 1670274934042345474, 66802, '2023-06-18 03:39:11');
INSERT INTO `goods_user_account` VALUES (1759461973619183618, 1759461973598212098, 975779, '2024-02-19 06:16:38');
INSERT INTO `goods_user_account` VALUES (1760911567490179073, 1760911567423070210, 0, '2024-02-23 06:16:49');
INSERT INTO `goods_user_account` VALUES (1760918409985449986, 1760918409918341122, 0, '2024-02-23 06:44:00');

-- ----------------------------
-- Table structure for mall_buying
-- ----------------------------
DROP TABLE IF EXISTS `mall_buying`;
CREATE TABLE `mall_buying`  (
  `id` bigint NOT NULL COMMENT '主建',
  `buying_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `buying_price` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收购价钱',
  `buying_address` varchar(488) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '简介',
  `old_and_new` tinyint NULL DEFAULT NULL COMMENT '新旧程度',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '求购信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_buying
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `goods_name` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `goods_pay_type` bigint NULL DEFAULT 1 COMMENT '支付方式 1 在线,2货到付款+在线',
  `goods_amount` bigint NOT NULL COMMENT '数量',
  `goods_price` decimal(10, 0) NOT NULL COMMENT '价格',
  `goods_discount` decimal(10, 0) NOT NULL COMMENT '优惠价格',
  `goods_type_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品类型关联mall_goods_type表',
  `status` int NOT NULL DEFAULT 1 COMMENT '商品状态 1启用,2禁用',
  `goods_origin` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '产地',
  `goods_address` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `goods_mark_code` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签 关联参数表 GOODS_BQ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `goode_user_type` int NULL DEFAULT 0 COMMENT '0官方商品,1闲置商品;',
  `propagation_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '繁殖方法',
  `cultivation_conditions` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '培育条件',
  `maintenance_tips` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `precautions` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `application_scenarios` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `viewing_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods
-- ----------------------------
INSERT INTO `mall_goods` VALUES (1636246843571916801, '中华水韭', 1, 991, 1000, 200, '1636246470664736770', 1, '中国江苏南京', '一种古老的水生蕨类植物，对水质要求极高。', '1,5,6', '2024-02-23 14:07:41', NULL, 0, '孢子繁殖、分株繁殖', '需要清澈、流动缓慢的淡水环境，适宜生长温度为15-25℃。', '保持水质清洁，定期更换部分水源，避免阳光直射。', '防止水体富营养化，以免影响其生长。', '适合用于生态修复项目和水族馆展示。', '因其独特的形态和稀有性，具有较高的科研和观赏价值。');
INSERT INTO `mall_goods` VALUES (1636247425896501250, '水盾草', 1, 93, 10000, 3600, '1636246470664736770', 1, '亚洲温带地区', '多年生沉水草本植物，花小，淡紫色。', '2', '2024-02-19 14:20:49', NULL, 0, '种子繁殖、扦插繁殖。', '适宜生长在弱酸性至中性的水域中，耐阴。', '保持适度光照，避免过度施肥。', '注意防止病虫害，尤其是蚜虫。', '可用于园林水景布置，增加景观多样性。', '花朵美丽，适合观赏。');
INSERT INTO `mall_goods` VALUES (1636247822233063425, '白玫瑰', 1, 106, 1999, 122, '1636246470664736770', 1, '1', '玫瑰花的花语是爱情，如果你喜欢一个人就可以送她玫瑰花，这代表你的爱，预示着想和对方厮守终生。玫瑰花是女神节、情人节、七夕节、圣诞节、生日、纪念日的常见花礼，一般是男生送给女生，不过也有女生送男生的，常见的有红玫瑰、粉玫瑰、白玫瑰、香槟玫瑰、蓝玫瑰、紫玫瑰等，这些都代表美好的爱情。', '1', '2024-02-19 16:17:18', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_goods` VALUES (1636248156569423873, '蓝玫瑰、紫玫瑰等', 1, 1107, 11111, 111, '1636246470664736770', 1, '111', '玫瑰花的花语是爱情，如果你喜欢一个人就可以送她玫瑰花，这代表你的爱，预示着想和对方厮守终生。玫瑰花是女神节、情人节、七夕节、圣诞节、生日、纪念日的常见花礼，一般是男生送给女生，不过也有女生送男生的，常见的有红玫瑰、粉玫瑰、白玫瑰、香槟玫瑰、蓝玫瑰、紫玫瑰等，这些都代表美好的爱情。', '2', '2024-02-19 14:20:49', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_goods` VALUES (1636248669784461313, '香槟玫瑰', 1, 108, 9999, 999, '1636246470664736770', 1, NULL, '玫瑰花的花语是爱情，如果你喜欢一个人就可以送她玫瑰花，这代表你的爱，预示着想和对方厮守终生。玫瑰花是女神节、情人节、七夕节、圣诞节、生日、纪念日的常见花礼，一般是男生送给女生，不过也有女生送男生的，常见的有红玫瑰、粉玫瑰、白玫瑰、香槟玫瑰、蓝玫瑰、紫玫瑰等，这些都代表美好的爱情。', '', '2024-02-23 14:43:13', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_goods` VALUES (1636249106696720385, '有红玫瑰、粉玫瑰、白玫瑰', 1, 100, 900, 111, '1636248417241223170', 1, NULL, '玫瑰花的花语是爱情，如果你喜欢一个人就可以送她玫瑰花，这代表你的爱，预示着想和对方厮守终生。玫瑰花是女神节、情人节、七夕节、圣诞节、生日、纪念日的常见花礼，一般是男生送给女生，不过也有女生送男生的，常见的有红玫瑰、粉玫瑰、白玫瑰、香槟玫瑰、蓝玫瑰、紫玫瑰等，这些都代表美好的爱情。', '2', '2023-06-19 16:55:58', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_goods` VALUES (1636249324364320770, '有红玫瑰', 1, 996, 100, 10, '1636248417241223170', 1, NULL, '玫瑰花的花语是爱情，如果你喜欢一个人就可以送她玫瑰花，这代表你的爱，预示着想和对方厮守终生。玫瑰花是女神节、情人节、七夕节、圣诞节、生日、纪念日的常见花礼，一般是男生送给女生，不过也有女生送男生的，常见的有红玫瑰、粉玫瑰、白玫瑰、香槟玫瑰、蓝玫瑰、紫玫瑰等，这些都代表美好的爱情。', '', '2024-02-19 14:20:49', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_goods` VALUES (1636249713365045250, '紫玫瑰等，这些都代表美好的爱情', 1, 997, 999, 100, '1636248417241223170', 1, NULL, '玫瑰花的花语是爱情，如果你喜欢一个人就可以送她玫瑰花，这代表你的爱，预示着想和对方厮守终生。玫瑰花是女神节、情人节、七夕节、圣诞节、生日、纪念日的常见花礼，一般是男生送给女生，不过也有女生送男生的，常见的有红玫瑰、粉玫瑰、白玫瑰、香槟玫瑰、蓝玫瑰、紫玫瑰等，这些都代表美好的爱情。', '', '2024-02-19 14:20:49', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_goods` VALUES (1670718304439070722, '向日葵', 1, 123, 233, 231, '1636248417241223170', 1, '广州', 'asdf', '4', '2023-06-19 08:56:04', 12, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_goods` VALUES (1670723699106738178, '向日葵2', 1, 22, 123, 23, '1636248417241223170', 1, '广州', '阿斯蒂芬', '1', '2024-02-23 14:43:13', 23, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mall_goods_img
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_img`;
CREATE TABLE `mall_goods_img`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `img_type` int NOT NULL DEFAULT 2 COMMENT '图片类型,1主图 2附属图',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `img_address` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片描述',
  `img_url` varchar(280) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片',
  `sort` int NULL DEFAULT 10 COMMENT '排序',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 1启用,2禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1898010466710478851 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_img
-- ----------------------------
INSERT INTO `mall_goods_img` VALUES (1636252213371555841, 2, 1636252177061466113, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636252177061466113/351c6d0dfb7c43df819fcc5dc84a95b020230316.jpg', 0, 1, '2023-03-16 14:25:02');
INSERT INTO `mall_goods_img` VALUES (1636252243566350338, 1, 1636252177061466113, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636252177061466113/f276b3ce5fdf41ac95b4e8411a130f5220230316.jpg', 0, 1, '2023-03-16 14:25:09');
INSERT INTO `mall_goods_img` VALUES (1670312303768453121, 2, 1636246843571916801, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636246843571916801/bcc4a9a94d1045b2baa3a0a771c95f5b20230618.jpg', 0, 1, '2023-06-18 14:07:40');
INSERT INTO `mall_goods_img` VALUES (1670312429589184514, 1, 1636246843571916801, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636246843571916801/2cb4ccc5c7fa4ccf93c3cf1abcf6bf3120230618.jpg', 0, 1, '2023-06-18 14:08:10');
INSERT INTO `mall_goods_img` VALUES (1670312931844505601, 2, 1636247425896501250, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636247425896501250/f00a95c974b146a3834223a909b00e4c20230618.jpg', 0, 1, '2023-06-18 14:10:10');
INSERT INTO `mall_goods_img` VALUES (1670312983937761281, 2, 1636247425896501250, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636247425896501250/606919a410ee41799c672c8966ef7dc420230618.jpg', 0, 1, '2023-06-18 14:10:22');
INSERT INTO `mall_goods_img` VALUES (1670313054511120386, 1, 1636247425896501250, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636247425896501250/8bb2cb421ff04823821bf4a695afe6c620230618.jpg', 0, 1, '2023-06-18 14:10:39');
INSERT INTO `mall_goods_img` VALUES (1670313426692685825, 2, 1636248156569423873, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636248156569423873/af5b8015096940e593f1045bacf9994520230618.jpg', 0, 1, '2023-06-18 14:12:08');
INSERT INTO `mall_goods_img` VALUES (1670313479058571266, 2, 1636248156569423873, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636248156569423873/27ff7502b447416e8d445258d3598b5b20230618.jpg', 0, 1, '2023-06-18 14:12:21');
INSERT INTO `mall_goods_img` VALUES (1670313532984737794, 1, 1636248156569423873, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636248156569423873/bbb0230abb3c4095b64a265fe87a753120230618.jpg', 0, 1, '2023-06-18 14:12:33');
INSERT INTO `mall_goods_img` VALUES (1670316436181303297, 1, 1636249106696720385, '', '/schoolMall/MALL_GOODS_IMG/1636248417241223170/1636249106696720385/c666ca5887a74742997a70c29dccabde20230618.jpg', 0, 1, '2023-06-18 14:24:06');
INSERT INTO `mall_goods_img` VALUES (1670316516971986945, 1, 1636249324364320770, '', '/schoolMall/MALL_GOODS_IMG/1636248417241223170/1636249324364320770/2758e5a423a84001966f002d13da861e20230618.jpg', 0, 1, '2023-06-18 14:24:25');
INSERT INTO `mall_goods_img` VALUES (1670316622290960386, 2, 1636249713365045250, '', '/schoolMall/MALL_GOODS_IMG/1636248417241223170/1636249713365045250/9f9f2da5ce464a52931a988a36b1026620230618.jpg', 0, 1, '2023-06-18 14:24:50');
INSERT INTO `mall_goods_img` VALUES (1670316662929571841, 1, 1636249713365045250, '', '/schoolMall/MALL_GOODS_IMG/1636248417241223170/1636249713365045250/98525195f8d1474fb6c58de9729906cb20230618.jpg', 0, 1, '2023-06-18 14:25:00');
INSERT INTO `mall_goods_img` VALUES (1670718829322661889, 1, 1670718304439070722, '', '/schoolMall/MALL_GOODS_IMG/1636248417241223170/1670718304439070722/24ae32f2e74f4b1ea439e3441c344e8e20230619.jpg', 0, 1, '2023-06-19 17:03:04');
INSERT INTO `mall_goods_img` VALUES (1759472520007827458, 1, 1759471360190496769, '不出现', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1759471360190496769/a217eb5d656a422f833e12395ff745b120240219.png', 0, 2, '2024-02-19 14:58:32');
INSERT INTO `mall_goods_img` VALUES (1759472611351379970, 1, 1759471360190496769, '订单', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1759471360190496769/cd4ce3d756f84d4b809c94ec02c78e1f20240219.png', 3, 1, '2024-02-19 14:58:54');
INSERT INTO `mall_goods_img` VALUES (1759472925701881858, 2, 1759471360190496769, '方法', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1759471360190496769/c28d8267a1a847aa92840ab7921e5c1720240219.png', 5, 1, '2024-02-19 15:00:09');
INSERT INTO `mall_goods_img` VALUES (1760902549002575873, 2, 1759494028700729346, '香', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1759494028700729346/d4a83c50c8c04e54b0beb3fe52d5df0020240223.jpg', 0, 1, '2024-02-23 13:40:58');
INSERT INTO `mall_goods_img` VALUES (1760902594355585026, 1, 1759494028700729346, '2', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1759494028700729346/30ffbb20b98342f9bc2f34c95c13ba8520240223.png', 0, 1, '2024-02-23 13:41:09');
INSERT INTO `mall_goods_img` VALUES (1760902813256310786, 1, 1759494028700729346, '111', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1759494028700729346/3ede4c650c024c1894ff4c0a45aa667420240223.jpg', 0, 1, '2024-02-23 13:42:01');
INSERT INTO `mall_goods_img` VALUES (1760908606529658882, 1, 1636248669784461313, '香', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636248669784461313/d5f8f8f9619544b9819bef90c91d61ae20240223.jpg', 0, 1, '2024-02-23 14:05:02');
INSERT INTO `mall_goods_img` VALUES (1760908663320535042, 2, 1636248669784461313, '好看', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636248669784461313/b0ffcbe04b6c438b805820e509d6980f20240223.jpg', 0, 1, '2024-02-23 14:05:16');
INSERT INTO `mall_goods_img` VALUES (1760908863657271298, 1, 1636247822233063425, '香', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636247822233063425/2c30d6d75a02447fbdd72a85a28f0cc520240223.jpg', 0, 1, '2024-02-23 14:06:03');
INSERT INTO `mall_goods_img` VALUES (1760908914227994626, 2, 1636247822233063425, '好看', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636247822233063425/7bdce57c18364d48bcd1e54061d9ac9e20240223.jpg', 0, 1, '2024-02-23 14:06:15');
INSERT INTO `mall_goods_img` VALUES (1760917382078980098, 1, 1670723699106738178, '好看', '/schoolMall/MALL_GOODS_IMG/1636248417241223170/1670723699106738178/261b43950da142b299e83aa0082d936420240223.jpg', 0, 1, '2024-02-23 14:39:54');
INSERT INTO `mall_goods_img` VALUES (1760917428350541825, 2, 1670723699106738178, '香', '/schoolMall/MALL_GOODS_IMG/1636248417241223170/1670723699106738178/a72772448e23422c84b55772bb260ca020240223.jpg', 0, 1, '2024-02-23 14:40:05');
INSERT INTO `mall_goods_img` VALUES (1898010466710478850, 2, 1636246843571916801, '', '/schoolMall/MALL_GOODS_IMG/1636246470664736770/1636246843571916801/1b30f7a44c164bb688883eb2866249e520250307.png', 0, 1, '2025-03-07 21:58:53');

-- ----------------------------
-- Table structure for mall_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_order`;
CREATE TABLE `mall_goods_order`  (
  `id` bigint NOT NULL COMMENT '主建',
  `order_umber` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `quantity` int NOT NULL DEFAULT 1 COMMENT '数量',
  `univalent` decimal(10, 0) NULL DEFAULT NULL COMMENT '单价',
  `amount` decimal(10, 0) NOT NULL COMMENT '金额',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品订单中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_order
-- ----------------------------
INSERT INTO `mall_goods_order` VALUES (1636251123301306370, 'OD2303161636251123226513408', 1636247425896501250, 1, 10000, 10000, '2023-03-16 06:20:43');
INSERT INTO `mall_goods_order` VALUES (1636251922760814594, 'OD2303161636251922692997120', 1636247822233063425, 1, 1999, 1999, '2023-03-16 06:23:53');
INSERT INTO `mall_goods_order` VALUES (1658002517192036354, 'OD2305151658002517134024704', 1636248156569423873, 1, 11111, 11111, '2023-05-15 06:52:59');
INSERT INTO `mall_goods_order` VALUES (1658362598559543298, 'OD2305161658362598528299008', 1636246843571916801, 2, 1000, 2000, '2023-05-16 06:43:49');
INSERT INTO `mall_goods_order` VALUES (1658362598559543299, 'OD2305161658362598528299008', 1636248156569423873, 1, 11111, 11111, '2023-05-16 06:43:49');
INSERT INTO `mall_goods_order` VALUES (1658362598559543300, 'OD2305161658362598528299008', 1636247822233063425, 1, 1999, 1999, '2023-05-16 06:43:49');
INSERT INTO `mall_goods_order` VALUES (1658362654691913729, 'OD2305161658362654715195392', 1636249713365045250, 1, 999, 999, '2023-05-16 06:44:02');
INSERT INTO `mall_goods_order` VALUES (1658362768273666049, 'OD2305161658362768298934272', 1636247425896501250, 1, 10000, 10000, '2023-05-16 06:44:30');
INSERT INTO `mall_goods_order` VALUES (1658364031568670721, 'OD2305161658364031595642880', 1636247425896501250, 1, 10000, 10000, '2023-05-16 06:49:31');
INSERT INTO `mall_goods_order` VALUES (1670275227517796354, 'OD2306181670275227453034496', 1636247822233063425, 1, 1999, 1999, '2023-06-18 03:40:21');
INSERT INTO `mall_goods_order` VALUES (1670275227584905217, 'OD2306181670275227453034496', 1636248669784461313, 1, 9999, 9999, '2023-06-18 03:40:21');
INSERT INTO `mall_goods_order` VALUES (1670724538852536322, 'OD2306191670724538372173824', 1636247425896501250, 1, 10000, 10000, '2023-06-19 09:25:45');
INSERT INTO `mall_goods_order` VALUES (1670724538852536323, 'OD2306191670724538372173824', 1636249324364320770, 2, 100, 200, '2023-06-19 09:25:45');
INSERT INTO `mall_goods_order` VALUES (1670726999445172226, 'OD2306191670726999429672960', 1636247425896501250, 1, 10000, 10000, '2023-06-19 09:35:32');
INSERT INTO `mall_goods_order` VALUES (1670726999445172227, 'OD2306191670726999429672960', 1636246843571916801, 1, 1000, 1000, '2023-06-19 09:35:32');
INSERT INTO `mall_goods_order` VALUES (1759462460816953346, 'OD2402191759462460792160256', 1636248156569423873, 2, 11111, 22222, '2024-02-19 06:18:35');
INSERT INTO `mall_goods_order` VALUES (1759492341399339010, 'OD2402191759492341149356032', 1636247822233063425, 1, 1999, 1999, '2024-02-19 08:17:19');
INSERT INTO `mall_goods_order` VALUES (1760909274631954433, 'OD2402231760909274521575424', 1636246843571916801, 2, 1000, 2000, '2024-02-23 06:07:42');
INSERT INTO `mall_goods_order` VALUES (1760918213612331010, 'OD2402231760918213578117120', 1636248669784461313, 1, 9999, 9999, '2024-02-23 06:43:13');
INSERT INTO `mall_goods_order` VALUES (1760918213612331011, 'OD2402231760918213578117120', 1670723699106738178, 1, 123, 123, '2024-02-23 06:43:13');

-- ----------------------------
-- Table structure for mall_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_type`;
CREATE TABLE `mall_goods_type`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `type_name` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `img_type` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 1启用,2禁用',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_home` int NOT NULL DEFAULT 2 COMMENT '是否在主页推荐 1推荐,2不推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_type
-- ----------------------------
INSERT INTO `mall_goods_type` VALUES (1636246470664736770, '水生花', '1', 1, 600, '2023-03-16 14:02:13', 1);
INSERT INTO `mall_goods_type` VALUES (1636248417241223170, '向日葵', NULL, 1, 400, '2023-03-16 14:09:57', 1);

-- ----------------------------
-- Table structure for mall_menu
-- ----------------------------
DROP TABLE IF EXISTS `mall_menu`;
CREATE TABLE `mall_menu`  (
  `id` bigint NOT NULL COMMENT 'id主键',
  `menu_code` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单编码',
  `menu_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '父级菜单名称,顶级00',
  `icon` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `menu_path` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单地址',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `gmt_create` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_btn` int NULL DEFAULT 0 COMMENT '是否是按钮0菜单,1按钮',
  `is_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_menu
-- ----------------------------
INSERT INTO `mall_menu` VALUES (1, '0001', '系统管理', '00', 'el-icon-s-tools', '#', 0, '2021-04-17 00:38:59', '2021-04-17 00:04:11', 300, 0, 0);
INSERT INTO `mall_menu` VALUES (2, '000101', '用户管理', '0001', 'el-icon-user-solid', 'users', 0, '2021-04-17 00:28:56', '2021-04-17 03:40:39', 101, 0, 0);
INSERT INTO `mall_menu` VALUES (4, '000103', '角色管理', '0001', 'el-icon-s-check', 'roles', 0, '2021-04-17 00:29:43', '2021-04-17 22:33:26', 102, 0, 1);
INSERT INTO `mall_menu` VALUES (14, '00010101', '删除用户', '000101', 'el-icon-warning', 'is_user_del', 0, '2021-04-17 02:20:46', '2021-04-17 11:11:29', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (15, '00010102', '添加用户', '000101', 'el-icon-s-order', 'is_user_add', 0, '2021-04-17 02:21:00', '2021-04-17 03:39:16', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (16, '00010103', '更新用户', '000101', 'el-icon-s-custom', 'is_user_upt', 0, '2021-04-17 02:21:10', '2021-04-17 03:40:42', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (17, '00010304', '添加角色', '000103', 'el-icon-s-ticket', 'is_user_add_role', 0, '2021-04-17 02:21:24', '2021-04-17 03:40:45', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (18, '00010105', '查询用户', '000101', NULL, 'users', 0, '2021-04-17 20:04:47', '2021-04-17 03:40:49', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (19, '00010301', '查询角色', '000103', NULL, 'roles', 0, '2021-04-17 21:06:36', '2021-04-17 03:40:52', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (20, '00010303', '删除角色', '000103', NULL, 'is_role_del', 0, '2021-04-17 21:07:32', '2021-04-17 03:40:56', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (30, '00010302', '修改角色', '000103', NULL, 'resume', 0, '2021-04-17 21:06:36', '2021-04-17 03:40:59', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (13301, '00010305', '分配角色', '000103', 'el-icon-s-ticket', 'is_role_add_role', 0, '2021-04-17 02:21:24', '2021-04-17 03:41:02', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (13302, '000104', '权限管理', '0001', 'el-icon-s-order', 'model', 0, '2021-04-17 00:28:45', '2021-04-17 03:41:04', 103, 0, 1);
INSERT INTO `mall_menu` VALUES (13303, '00010401', '查询权限', '000104', 'el-icon-s-ticket', 'model', 0, '2021-04-17 02:21:24', '2021-04-17 03:41:08', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (13304, '00010402', '添加权限', '000104', 'el-icon-s-ticket', 'is_model_add', 0, '2021-04-17 02:21:24', '2021-04-17 03:41:11', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (13305, '00010403', '更新权限', '000104', 'el-icon-s-ticket', 'is_model_upt', 0, '2021-04-17 02:21:24', '2021-04-17 03:41:14', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (13306, '00010404', '删除权限', '000104', 'el-icon-s-ticket', 'is_model_del', 0, '2021-04-17 02:21:24', '2021-04-17 03:41:17', 0, 1, 1);
INSERT INTO `mall_menu` VALUES (1339111452297711617, '000102', '个人中心', '0001', 'el-icon-star-off', 'personalCenter', 0, '2021-04-17 00:28:52', '2021-04-17 03:41:20', 100, 0, 1);
INSERT INTO `mall_menu` VALUES (1339123805156331522, '00010201', '查询个人中心', '000102', 'el-icon-menu', 'personalCenter', 0, '2021-04-17 16:24:29', '2021-04-17 03:41:23', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1340336917119156225, '000105', '日志', '0001', 'el-icon-tickets', 'logList', 0, '2021-04-17 00:43:18', '2021-04-17 03:41:26', 400, 0, 1);
INSERT INTO `mall_menu` VALUES (1340336975130574849, '00010501', '查询日志', '000105', 'el-icon-menu', 'logList', 0, '2021-04-17 00:43:32', '2021-04-17 03:41:30', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1340338909082206210, '0004', '首页', '00', 'el-icon-house', 'welcome', 0, '2021-04-17 00:51:55', '2021-04-17 03:41:34', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1348670893571424257, '0005', '花卉管理', '00', 'el-icon-shopping-bag-2', '/#', 0, NULL, '2025-03-07 21:31:26', 100, 0, 0);
INSERT INTO `mall_menu` VALUES (1348671057262526465, '000501', '花卉列表', '0005', 'el-icon-collection', 'MallGoods', 0, NULL, '2025-03-07 21:31:33', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1348671138069987330, '00050101', '查询花卉', '000501', 'el-icon-menu', 'MallGoods', 0, NULL, '2025-03-07 21:31:44', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1348671432539488257, '0006', '订单管理', '00', 'el-icon-s-order', '/', 0, NULL, NULL, 120, 0, 1);
INSERT INTO `mall_menu` VALUES (1348671566505558018, '000601', '订单列表', '0006', 'el-icon-s-shop', 'orderList', 0, NULL, '2021-02-08 19:14:30', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1348671644171485186, '00060101', '查询订单', '000601', 'el-icon-menu', 'orderList', 0, NULL, '2021-02-08 19:14:07', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1348671910870499330, '0007', '用户管理', '00', 'el-icon-s-custom', '/', 0, NULL, NULL, 99, 0, 1);
INSERT INTO `mall_menu` VALUES (1348672111295315969, '000701', '用户列表', '0007', 'el-icon-coffee-cup', 'goodsUserList', 0, NULL, '2021-01-12 11:27:40', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1348672155884961793, '00070101', '查询列表', '000701', 'el-icon-menu', 'goodsUserList', 0, NULL, '2021-02-08 23:38:10', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1348672307085426690, '0008', '财务管理', '00', 'el-icon-s-cooperation', '/', 0, NULL, NULL, 150, 0, 1);
INSERT INTO `mall_menu` VALUES (1348672425046032386, '000801', '充值管理', '0008', 'el-icon-menu', 'goodsTopUp', 0, NULL, '2021-02-14 21:54:18', 0, 0, 0);
INSERT INTO `mall_menu` VALUES (1348672498064670722, '00080101', '查询充值', '000801', 'el-icon-menu', 'goodsTopUp', 0, NULL, '2021-02-14 21:54:01', 0, 0, 1);
INSERT INTO `mall_menu` VALUES (1348835001241489410, '000503', '花卉类型管理', '0005', 'el-icon-table-lamp', 'MallGoodsType', 0, NULL, '2025-03-07 21:41:48', 30, 0, 1);
INSERT INTO `mall_menu` VALUES (1348835055176044545, '00050301', '查询类型', '000503', 'el-icon-menu', 'MallGoodsType', 0, NULL, '2021-01-12 11:36:44', 0, 0, 1);

-- ----------------------------
-- Table structure for mall_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `mall_menu_role`;
CREATE TABLE `mall_menu_role`  (
  `id` bigint NOT NULL COMMENT 'Pk',
  `menu_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单编号',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单角色中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_menu_role
-- ----------------------------
INSERT INTO `mall_menu_role` VALUES (1364176296623599617, '000102', 1278945879542988801);
INSERT INTO `mall_menu_role` VALUES (1364176296640376833, '00010201', 1278945879542988801);
INSERT INTO `mall_menu_role` VALUES (1364176296640376834, '0004', 1278945879542988801);
INSERT INTO `mall_menu_role` VALUES (1364176296640376835, '000501', 1278945879542988801);
INSERT INTO `mall_menu_role` VALUES (1364176296640376836, '00050101', 1278945879542988801);
INSERT INTO `mall_menu_role` VALUES (1364176296648765442, '0001', 1278945879542988801);
INSERT INTO `mall_menu_role` VALUES (1364176296648765443, '0005', 1278945879542988801);
INSERT INTO `mall_menu_role` VALUES (1366597807734894593, '000102', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807743283201, '00010201', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807743283202, '0005', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807743283203, '000501', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807743283204, '00050101', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807743283205, '000503', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807743283206, '00050301', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807751671809, '0006', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807751671810, '000601', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807751671811, '00060101', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1366597807751671812, '0001', 1366597238844665858);
INSERT INTO `mall_menu_role` VALUES (1499057322226089986, '000101', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478593, '00010101', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478594, '00010102', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478595, '00010103', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478596, '00010105', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478597, '000103', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478598, '00010304', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478599, '00010301', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478600, '00010303', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478601, '00010302', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478602, '00010305', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478603, '000104', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478604, '00010401', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478605, '00010402', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478606, '00010403', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478607, '00010404', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478608, '000102', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478609, '00010201', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478610, '0005', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478611, '000501', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478612, '00050101', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478613, '000503', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478614, '00050301', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478615, '0006', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478616, '000601', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478617, '00060101', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478618, '0007', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478619, '000701', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478620, '00070101', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478621, '0008', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478622, '000801', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478623, '00080101', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478624, '0009', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478625, '000901', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478626, '00090101', 1);
INSERT INTO `mall_menu_role` VALUES (1499057322234478627, '0001', 1);

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order`  (
  `id` bigint NOT NULL COMMENT '主建',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `order_umber` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'OD+年(2)+月(2)+日(2)+20位雪花算法',
  `address_id` bigint NOT NULL COMMENT '地址编号',
  `amount` decimal(10, 0) NOT NULL COMMENT '金额',
  `quantity` int NOT NULL COMMENT '数量',
  `is_pay` tinyint NOT NULL DEFAULT 2 COMMENT '1.以支付 2.未支付',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `status` int NOT NULL DEFAULT 2 COMMENT '状态 1以发货,2未发货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES (1658362598559543301, 1636243656873955329, 'OD2305161658362598528299008', 1658360913644711938, 15110, 4, 1, '2023-05-16 06:43:49', '2023-05-16 06:43:49', 1);
INSERT INTO `mall_order` VALUES (1658362654691913730, 1636243656873955329, 'OD2305161658362654715195392', 1658360913644711938, 999, 1, 1, '2023-05-16 06:44:02', '2023-05-16 06:44:02', 2);
INSERT INTO `mall_order` VALUES (1658362768273666050, 1636243656873955329, 'OD2305161658362768298934272', 1658360913644711938, 10000, 1, 1, '2023-05-16 06:44:30', '2023-05-16 06:44:30', 2);
INSERT INTO `mall_order` VALUES (1658364031568670722, 1636243656873955329, 'OD2305161658364031595642880', 1658360913644711938, 10000, 1, 1, '2023-05-16 06:49:31', '2023-05-16 06:49:31', 2);
INSERT INTO `mall_order` VALUES (1670275227584905218, 1670274934042345474, 'OD2306181670275227453034496', 1670275217778622465, 11998, 2, 1, '2023-06-18 06:41:31', '2023-06-18 03:40:21', 2);
INSERT INTO `mall_order` VALUES (1670724538978365442, 1670274934042345474, 'OD2306191670724538372173824', 1670275217778622465, 10200, 3, 1, '2023-06-19 09:25:45', '2023-06-19 09:25:45', 2);
INSERT INTO `mall_order` VALUES (1670726999508086785, 1670274934042345474, 'OD2306191670726999429672960', 1670275217778622465, 11000, 2, 1, '2023-06-19 09:35:32', '2023-06-19 09:35:32', 1);
INSERT INTO `mall_order` VALUES (1759462460884062210, 1759461973598212098, 'OD2402191759462460792160256', 1759462442664005633, 22222, 2, 1, '2024-02-19 06:20:49', '2024-02-19 06:18:35', 1);
INSERT INTO `mall_order` VALUES (1759492341466447874, 1759461973598212098, 'OD2402191759492341149356032', 1759462442664005633, 1999, 1, 1, '2024-02-19 08:17:19', '2024-02-19 08:17:19', 1);
INSERT INTO `mall_order` VALUES (1760909274699063298, 1636243656873955329, 'OD2402231760909274521575424', 1658360913644711938, 2000, 2, 1, '2024-02-23 06:07:42', '2024-02-23 06:07:42', 1);
INSERT INTO `mall_order` VALUES (1760918213612331012, 1636243656873955329, 'OD2402231760918213578117120', 1658360913644711938, 10122, 2, 1, '2024-02-23 06:43:13', '2024-02-23 06:43:13', 1);

-- ----------------------------
-- Table structure for mall_parameter
-- ----------------------------
DROP TABLE IF EXISTS `mall_parameter`;
CREATE TABLE `mall_parameter`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `p_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'key',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '值多个用逗号隔开',
  `type` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类型0系统类型,1普通类型,系统类型无法删除',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_parameter
-- ----------------------------
INSERT INTO `mall_parameter` VALUES (1, '1', '官方自营', 'GOODS_TAG', NULL);
INSERT INTO `mall_parameter` VALUES (2, '2', '30天无理由', 'GOODS_TAG', NULL);
INSERT INTO `mall_parameter` VALUES (3, '3', '3年质保', 'GOODS_TAG', NULL);
INSERT INTO `mall_parameter` VALUES (4, '4', '官方发货', 'GOODS_TAG', NULL);
INSERT INTO `mall_parameter` VALUES (5, '5', '7天价格保护', 'GOODS_TAG', NULL);
INSERT INTO `mall_parameter` VALUES (6, '6', '只换不修', 'GOODS_TAG', NULL);
INSERT INTO `mall_parameter` VALUES (7, '1358252184207151104', '/schoolMall/advertising/phone.png', 'HOME_GOODS_IMG', '商品推荐');
INSERT INTO `mall_parameter` VALUES (8, '1358252499837054976', '/schoolMall/home/cms_1.jpg', 'HOME_IMG', '轮播图');
INSERT INTO `mall_parameter` VALUES (9, '1358252169632309248', '/schoolMall/home/cms_2.jpg', 'HOME_IMG', '轮播图');
INSERT INTO `mall_parameter` VALUES (10, '1358252184207151104', '/schoolMall/home/cms_3.jpg', 'HOME_IMG', '轮播图');
INSERT INTO `mall_parameter` VALUES (11, '1358252222499811328', '/schoolMall/home/cms_4.jpg', 'HOME_IMG', '轮播图');
INSERT INTO `mall_parameter` VALUES (13, '2', '/schoolMall/advertising/cb1bd61ad71c45a4f67f09b075463944.png', 'HOME_GOODS_IMG', '商品推荐');
INSERT INTO `mall_parameter` VALUES (14, '3', '/schoolMall/advertising/84050343901614305048.png', 'HOME_GOODS_IMG', '商品推荐');
INSERT INTO `mall_parameter` VALUES (15, '1', NULL, 'BUSINESS_id', NULL);

-- ----------------------------
-- Table structure for mall_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `mall_sys_role`;
CREATE TABLE `mall_sys_role`  (
  `id` bigint NOT NULL COMMENT '序号,PK',
  `role_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名',
  `create_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间 自动记录',
  `remark` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `new_column` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_sys_role
-- ----------------------------
INSERT INTO `mall_sys_role` VALUES (1, '超级管理员', '1', '2021-04-16 14:31:21', '开发人员', NULL);
INSERT INTO `mall_sys_role` VALUES (1278945879542988801, '测试角色', '1278935893681131521', '2021-04-17 01:57:14', '最低权限', NULL);
INSERT INTO `mall_sys_role` VALUES (1366597238844665858, '商品角色', '1278946041459900418', '2021-04-07 11:52:26', NULL, NULL);

-- ----------------------------
-- Table structure for mall_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_sys_user`;
CREATE TABLE `mall_sys_user`  (
  `id` bigint NOT NULL COMMENT '主建',
  `username` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `type` bigint NULL DEFAULT NULL COMMENT '类型',
  `email` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mg_state` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否开启 1开 0关',
  `password` varchar(488) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `role_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_sys_user
-- ----------------------------
INSERT INTO `mall_sys_user` VALUES (1381613957323464705, 'admin', '17742614333', NULL, '2289475270@qq.com', 1, '48399ceafc13e8ec77e7ad3c6732a578', '29daa8217bace2352176cc710970d8b6', '1', NULL, NULL);
INSERT INTO `mall_sys_user` VALUES (1381615565503504386, 'TaoBao', '17456698794', NULL, '94922432@qq.com', 1, 'f0be588d9e231647df0bbb0c67299a7a', 'ae42c4a82d25333eabab6b5577abc3f4', '1366597238844665858', NULL, NULL);

-- ----------------------------
-- Table structure for receive_msg
-- ----------------------------
DROP TABLE IF EXISTS `receive_msg`;
CREATE TABLE `receive_msg`  (
  `id` bigint NOT NULL COMMENT '主键',
  `to_user_name` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '开发者微信号',
  `from_user_name` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发送方帐号（OpenID）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `msg_type` int NULL DEFAULT NULL COMMENT '0.文本 1.图片 2语音 3视频 4小视频 5 地理位置 5链接',
  `msg_id` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息id',
  `media_id` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片素材id',
  `content` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息;msg_type=0时必填',
  `pic_url` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片链接（由系统生成）;msg_type=1时必填',
  `thumb_media_id` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '视频素材id;msg_type=2时必填',
  `format` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '语音格式;msg_type=2时必填',
  `location_x` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地理位置纬度 msg_type=4',
  `location_y` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地理位置经度 msg_type=4',
  `scale` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地图缩放大小 msg_type=4',
  `title` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题 msg_type=5',
  `url` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '链接 msg_type=5',
  `description` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息描述 msg_type=5',
  `is_handle` tinyint NULL DEFAULT NULL COMMENT '是否处理 1以匹配,2默认回复',
  `reply_msg` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复消息',
  `reply_rule` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '消息记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of receive_msg
-- ----------------------------

-- ----------------------------
-- Table structure for user_goods
-- ----------------------------
DROP TABLE IF EXISTS `user_goods`;
CREATE TABLE `user_goods`  (
  `id` bigint NOT NULL COMMENT 'id主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `type` int NULL DEFAULT NULL COMMENT '1收藏,2购物车',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_goods
-- ----------------------------
INSERT INTO `user_goods` VALUES (1499061941450833922, 1499061151118131201, 1358252302722154496, '2022-03-02 16:39:53', 2);
INSERT INTO `user_goods` VALUES (1636250901082886145, 1636243656873955329, 1636247425896501250, '2023-03-16 06:19:50', 1);
INSERT INTO `user_goods` VALUES (1636250929797091330, 1636243656873955329, 1636248669784461313, '2023-03-16 06:19:56', 1);
INSERT INTO `user_goods` VALUES (1670275022911258626, 1670274934042345474, 1636247822233063425, '2023-06-18 03:39:32', 1);
INSERT INTO `user_goods` VALUES (1670275112925216769, 1670274934042345474, 1636248669784461313, '2023-06-18 03:39:54', 1);
INSERT INTO `user_goods` VALUES (1670724485282885634, 1670274934042345474, 1636249324364320770, '2023-06-19 09:25:33', 1);
INSERT INTO `user_goods` VALUES (1759462044393869313, 1759461973598212098, 1636248156569423873, '2024-02-19 06:16:55', 1);
INSERT INTO `user_goods` VALUES (1759474373898584066, 1759461973598212098, 1759471360190496769, '2024-02-19 07:05:55', 2);
INSERT INTO `user_goods` VALUES (1759492307316424705, 1759461973598212098, 1636246843571916801, '2024-02-19 08:17:11', 2);
INSERT INTO `user_goods` VALUES (1896931711850229761, 1636243656873955329, 1636247425896501250, '2025-03-04 14:32:18', 2);
INSERT INTO `user_goods` VALUES (1896931711850229762, 1636243656873955329, 1636247425896501250, '2025-03-04 14:32:18', 2);
INSERT INTO `user_goods` VALUES (1896931711850229763, 1636243656873955329, 1636247425896501250, '2025-03-04 14:32:18', 2);
INSERT INTO `user_goods` VALUES (1896931711850229764, 1636243656873955329, 1636247425896501250, '2025-03-04 14:32:18', 2);
INSERT INTO `user_goods` VALUES (1896931711850229765, 1636243656873955329, 1636247425896501250, '2025-03-04 14:32:18', 2);
INSERT INTO `user_goods` VALUES (1898034648722710529, 1636243656873955329, 1636248156569423873, '2025-03-07 15:34:59', 1);

SET FOREIGN_KEY_CHECKS = 1;
