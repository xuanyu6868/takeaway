/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80038
 Source Host           : localhost:3306
 Source Schema         : manager

 Target Server Type    : MySQL
 Target Server Version : 80038
 File Encoding         : 65001

 Date: 15/07/2024 09:00:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货地址',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收货地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (6, '端州区棕榈园7c', '林吃吃', '1320794312', 4);
INSERT INTO `address` VALUES (7, '东软小镇26栋 758', '禤宇', '13988997788', 4);
INSERT INTO `address` VALUES (8, '东软小镇26栋758', '林吃吃', '1320794312', 4);
INSERT INTO `address` VALUES (9, '东软小镇26栋757', '李炜锻', '13988997799', 4);
INSERT INTO `address` VALUES (10, '东软小镇26栋759', '邓一立', '13988776699', 4);
INSERT INTO `address` VALUES (14, '东软小镇26栋757', '邱名流', '13899778866', 4);
INSERT INTO `address` VALUES (16, '26栋', 'aee', '13877889988', 11);
INSERT INTO `address` VALUES (17, '26栋', 'acc', '13202794313', 2);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1697438073596-avatar.png', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '广告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (5, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E5%95%86%E5%93%81/%E5%B9%BF%E5%91%8A.png', 14);
INSERT INTO `banner` VALUES (6, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E5%B9%BF%E5%91%8A.png', 13);

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序号',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'logo',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业执照',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '审核状态',
  `time_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业时间',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商家表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES (10, 'musi', '123', '姆斯汉堡', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%95%86%E5%AE%B6%E5%A4%B4%E5%83%8F/%E5%A7%86%E6%96%AF%E6%B1%89%E5%A0%A1.png', 'BUSINESS', '0551-67889988', '爱心大鸡排', '东软小镇学6三楼', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E8%90%A5%E4%B8%9A%E6%89%A7%E7%85%A7/%E8%90%A5%E4%B8%9A%E6%89%A7%E7%85%A7.png', '通过', '9:00-21:00', '炸鸡汉堡');
INSERT INTO `business` VALUES (13, 'mdl', '123', '麦当劳', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%95%86%E5%AE%B6%E5%A4%B4%E5%83%8F/%E9%BA%A6%E5%BD%93%E5%8A%B3.png', 'BUSINESS', '13788997788', '薄皮v翅全新上市！', '阳光广场1楼10号', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E8%90%A5%E4%B8%9A%E6%89%A7%E7%85%A7/%E8%90%A5%E4%B8%9A%E6%89%A7%E7%85%A7.png', '通过', '9:00-22:00', '轻食简餐');
INSERT INTO `business` VALUES (14, 'ydd', '123', '一点点', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%95%86%E5%AE%B6%E5%A4%B4%E5%83%8F/%E4%B8%80%E7%82%B9%E7%82%B9.png', 'BUSINESS', '13788997788', '我们只用鲜奶，味你绽放精彩！', '阳光广场1楼20号', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E8%90%A5%E4%B8%9A%E6%89%A7%E7%85%A7/%E8%90%A5%E4%B8%9A%E6%89%A7%E7%85%A7.png', '通过', '9:00-21:00', '奶茶饮品');
INSERT INTO `business` VALUES (16, 'kudi', '123', '库迪咖啡', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%95%86%E5%AE%B6%E5%A4%B4%E5%83%8F/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1.png', 'BUSINESS', '13899778899', '全场9.9畅饮！', '阳光广场1楼36号', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E8%90%A5%E4%B8%9A%E6%89%A7%E7%85%A7/%E8%90%A5%E4%B8%9A%E6%89%A7%E7%85%A7.png', '通过', '9:00-21:00', '奶茶饮品');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (47, 17, 1, 4, 16);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '波波奶茶', 14);
INSERT INTO `category` VALUES (2, '单人套餐', 13);
INSERT INTO `category` VALUES (6, '芋泥奶茶', 14);
INSERT INTO `category` VALUES (7, '人气热卖', 13);
INSERT INTO `category` VALUES (8, '当季新品', 14);
INSERT INTO `category` VALUES (10, '蓝山咖啡', 16);
INSERT INTO `category` VALUES (11, '橙C美式', 16);
INSERT INTO `category` VALUES (12, '当季爆品', 16);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (10, 14, 4, '2023-11-03 11:41:35');
INSERT INTO `collect` VALUES (11, 13, 4, '2023-11-03 15:06:31');
INSERT INTO `collect` VALUES (12, 16, 11, '2023-11-03 16:12:25');
INSERT INTO `collect` VALUES (13, 16, 2, '2024-07-03 11:54:42');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论',
  `star` double(10, 1) NULL DEFAULT 0.0 COMMENT '评分',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  `order_id` int NULL DEFAULT NULL COMMENT '订单ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时间',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC, `order_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (19, '好吃好吃', 5.0, 11, 13, 19, '2024-07-01 10:15:34', NULL);
INSERT INTO `comment` VALUES (20, '好喝好喝', 4.0, 2, 16, 20, '2024-07-01 10:21:18', NULL);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '原材料',
  `taste` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '口味',
  `specs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '规格',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上架日期',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '上架' COMMENT '上架状态',
  `discount` double(11, 1) NULL DEFAULT 1.0 COMMENT '折扣',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  `category_id` int NULL DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (4, '芋泥珍珠奶茶', 15.00, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E8%8A%8B%E6%B3%A5%E7%8F%8D%E7%8F%A0%E5%A5%B6%E8%8C%B6.png', '好喝不腻，秋天第一杯', '珍珠、芋泥、奶茶', '香浓', '1杯', '2024-6-26', '下架', 0.8, 14, 6);
INSERT INTO `goods` VALUES (5, '薄荷奶绿', 18.00, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E8%96%84%E8%8D%B7%E5%A5%B6%E7%BB%BF.png', '清爽薄荷搭配奶绿', '薄荷、奶茶', '清淡', '1杯', '2024-6-26', '上架', 0.9, 14, 8);
INSERT INTO `goods` VALUES (6, '奥利奥薄荷冰沙', 18.00, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E5%A5%A5%E5%88%A9%E5%A5%A5%E8%96%84%E8%8D%B7%E5%86%B0%E6%B2%99.png', '奥利奥碎配清爽薄荷', '奥利奥、薄荷、奶茶', '清淡', '1杯', '2024-6-26', '上架', 0.9, 14, 8);
INSERT INTO `goods` VALUES (8, '手剥葡萄', 18.00, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%89%8B%E5%89%A5%E8%91%A1%E8%90%84.png', '手剥葡萄，清爽怡人', '葡萄、奶茶', '清淡', '1杯', '2024-6-26', '上架', 0.9, 14, 8);
INSERT INTO `goods` VALUES (12, '橙C美式咖啡', 12.90, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E6%A9%99C.png', '橙C美式咖啡', '咖啡', '苦、香', '杯', '2024-6-03', '上架', 0.7, 16, 11);
INSERT INTO `goods` VALUES (13, '蓝山咖啡', 12.90, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E8%93%9D%E5%B1%B1.png', '咖啡', '咖啡', '苦、香', '杯', '2024-6-03', '上架', 0.7, 16, 10);
INSERT INTO `goods` VALUES (14, '生椰拿铁', 12.90, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E7%94%9F%E6%A4%B0%E6%8B%BF%E9%93%81.png', '生椰拿铁', '咖啡，椰浆', '甜、香', '杯', '2024-6-03', '上架', 0.7, 16, 12);
INSERT INTO `goods` VALUES (15, '高山抹茶清爽椰', 12.90, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E9%AB%98%E5%B1%B1%E6%8A%B9%E8%8C%B6%E6%B8%85%E7%88%BD%E6%A4%B0.png', '高山鲜椰，海边椰子', '茶，椰浆', '甜、香', '杯', '2024-6-03', '上架', 0.7, 16, 12);
INSERT INTO `goods` VALUES (16, '风味燕麦拿铁', 12.90, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E9%A3%8E%E5%91%B3%E7%87%95%E9%BA%A6%E6%8B%BF%E9%93%81.png', '黑糖燕麦拿铁', '咖啡', '苦、香', '杯', '2024-6-03', '上架', 0.7, 16, 12);
INSERT INTO `goods` VALUES (17, '阿卡特里咖啡', 30.00, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E9%98%BF%E5%8D%A1%E7%89%B9%E9%87%8C%E5%92%96%E5%95%A1.png', '咖啡', '咖啡', '苦、香', '杯', '2024-6-03', '上架', 0.6, 16, 12);
INSERT INTO `goods` VALUES (18, '西瓜麦旋风', 15.00, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E9%BA%A6%E5%BD%93%E5%8A%B3/%E5%95%86%E5%93%81/%E8%A5%BF%E7%93%9C%E9%BA%A6%E6%97%8B%E9%A3%8E.png', '夏日清爽西瓜', '西瓜麦旋风', '甜', '杯', '2024-06-30', '上架', 0.8, 13, 7);
INSERT INTO `goods` VALUES (19, '双层吉士堡', 22.00, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E9%BA%A6%E5%BD%93%E5%8A%B3/%E5%95%86%E5%93%81/%E5%8F%8C%E5%B1%82%E5%90%89%E5%A3%AB%E5%A0%A1.png', '100%牛肉加香浓芝士', '双层吉士堡', '香', '个', '2024-06-30', '上架', 1.0, 13, 7);
INSERT INTO `goods` VALUES (20, '精选单人三件套', 33.50, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E9%BA%A6%E5%BD%93%E5%8A%B3/%E5%95%86%E5%93%81/%E7%B2%BE%E9%80%89%E4%B8%89%E4%BA%BA%E5%A5%97%E9%A4%90.png', '1个汉堡+1份小食+1杯饮料', '精选单人三件套', '可选', '份', '2024-06-30', '上架', 1.0, 13, 2);
INSERT INTO `goods` VALUES (21, '双层安格斯MAX厚牛培根堡', 28.00, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E9%BA%A6%E5%BD%93%E5%8A%B3/%E5%95%86%E5%93%81/%E5%8F%8C%E5%B1%82%E5%AE%89%E6%A0%BC%E6%96%AFMAX%E5%8E%9A%E7%89%9B%E5%9F%B9%E6%A0%B9%E5%A0%A1.png', '厚牛美味一个顶饱', '安格斯厚牛培根', '香', '个', '2024-06-30', '上架', 1.0, 13, 7);
INSERT INTO `goods` VALUES (24, '板烧鸡腿堡', 20.50, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E9%BA%A6%E5%BD%93%E5%8A%B3/%E5%95%86%E5%93%81/%E6%9D%BF%E7%83%A7%E9%B8%A1%E8%85%BF%E5%A0%A1.png', '板烧鸡腿堡', '板烧鸡腿堡', NULL, '个', '2024-07-01', '上架', 1.0, 13, 7);
INSERT INTO `goods` VALUES (25, '“鸡”不可失', 28.80, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E9%BA%A6%E5%BD%93%E5%8A%B3/%E5%95%86%E5%93%81/%E9%B8%A1%E4%B8%8D%E5%8F%AF%E5%A4%B1.png', '“鸡”不可失', '鸡肉', NULL, '份', '2024-07-02', '上架', 1.0, 13, 2);
INSERT INTO `goods` VALUES (26, '想吃鲜的', 26.80, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E9%BA%A6%E5%BD%93%E5%8A%B3/%E5%95%86%E5%93%81/%E6%83%B3%E5%90%83%E9%B2%9C%E7%9A%84.png', '想吃鲜的', NULL, NULL, '份', '2024-07-02', '上架', 1.0, 13, 2);
INSERT INTO `goods` VALUES (27, '波波奶茶', 18.80, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%B3%A2%E6%B3%A2%E5%A5%B6%E8%8C%B6.png', '波波', '波波', NULL, '杯', '2024-07-02', '上架', 0.9, 14, 1);
INSERT INTO `goods` VALUES (30, '牛油果炸鸡盒', 25.50, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/26f6010e69ffece8c999449dd9038732bd915b15/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/MUSI/avofriedchicken.png', '牛油果炸鸡盒', '牛油果炸鸡', NULL, '盒', '2024-07-09', '上架', 0.9, 10, 14);
INSERT INTO `goods` VALUES (31, '烤鸡+可乐', 18.80, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/26f6010e69ffece8c999449dd9038732bd915b15/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/MUSI/kaoji.png', '烤鸡+可乐', '烤鸡+可乐', NULL, '份', '2024-07-09', '上架', 1.0, 10, 13);
INSERT INTO `goods` VALUES (32, '爱心大鸡排', 9.90, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/26f6010e69ffece8c999449dd9038732bd915b15/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/MUSI/heartjipai.png', '爱心大鸡排', '大鸡排', NULL, '份', '2024-07-06', '上架', 1.0, 10, 14);
INSERT INTO `goods` VALUES (33, '舍友4人套餐', 79.90, 'https://raw.githubusercontent.com/xuanyu6868/takeaway/26f6010e69ffece8c999449dd9038732bd915b15/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/MUSI/shirentaocan4.png', '舍友4人套餐', NULL, NULL, '份', '2024-07-08', '上架', 0.9, 10, 13);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (12, '系统维护公告', '为了提升系统稳定性，我们将于2023年12月1日凌晨进行系统维护。维护期间，系统将暂时无法访问，请提前做好准备。对您造成的不便，我们深表歉意。', '2023-11-25', '管理员');
INSERT INTO `notice` VALUES (13, '新功能上线', '我们很高兴地宣布，一系列新功能即将上线！包括用户反馈系统、订单追踪功能和优惠券系统。请持续关注我们的更新。', '2023-12-10', '管理员');
INSERT INTO `notice` VALUES (14, '假期配送安排', '圣诞节期间，我们的配送服务将有所调整。12月24日和25日当天仅提供部分时段配送服务，12月26日恢复正常配送。感谢您的理解与支持。', '2023-12-20', '管理员');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下单时间',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付类型',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单状态',
  `business_id` int NULL DEFAULT NULL COMMENT '接单商家ID',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '送货地址',
  `user_id` int NULL DEFAULT NULL COMMENT '下单人ID',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总价',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `actual` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付款',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缩略图',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (19, '1807596767808909312', '2024-07-01 10:07:07', '微信支付', '2024-07-01 10:15:10', '已完成', 13, 'aee', '13877889988', '26栋', 11, 15.00, 3.00, 12.00, '', 'http://localhost:9090/files/1719740126233-西瓜麦旋风.png', '西瓜麦旋风等1件商品');
INSERT INTO `orders` VALUES (20, '1807599672674807808', '2024-07-01 10:18:40', '支付宝', '2024-07-01 10:18:47', '已完成', 16, 'acc', '13202794313', '26栋', 2, 38.70, 11.61, 27.09, '五分糖', 'http://localhost:9090/files/1719738519325-高山抹茶清爽椰.png', '高山抹茶清爽椰等3件商品');
INSERT INTO `orders` VALUES (21, '1808346676811808768', '2024-07-03 11:46:59', '支付宝', NULL, '待支付', 16, 'acc', '13202794313', '26栋', 2, 30.00, 12.00, 18.00, '', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E9%98%BF%E5%8D%A1%E7%89%B9%E9%87%8C%E5%92%96%E5%95%A1.png', '阿卡特里咖啡等1件商品');

-- ----------------------------
-- Table structure for orders_item
-- ----------------------------
DROP TABLE IF EXISTS `orders_item`;
CREATE TABLE `orders_item`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int NULL DEFAULT NULL COMMENT '订单ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `num` int NULL DEFAULT NULL COMMENT '购买数量',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders_item
-- ----------------------------
INSERT INTO `orders_item` VALUES (10, 7, '手剥葡萄', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%89%8B%E5%89%A5%E8%91%A1%E8%90%84.png', 16.20, 2, NULL);
INSERT INTO `orders_item` VALUES (11, 7, '手剥葡萄', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%89%8B%E5%89%A5%E8%91%A1%E8%90%84.png', 16.20, 1, NULL);
INSERT INTO `orders_item` VALUES (12, 8, '手剥葡萄', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%89%8B%E5%89%A5%E8%91%A1%E8%90%84.png', 16.20, 2, NULL);
INSERT INTO `orders_item` VALUES (13, 8, '手剥葡萄', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%89%8B%E5%89%A5%E8%91%A1%E8%90%84.png', 16.20, 1, NULL);
INSERT INTO `orders_item` VALUES (28, 18, '手剥葡萄', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%89%8B%E5%89%A5%E8%91%A1%E8%90%84.png', 16.20, 1, 6);
INSERT INTO `orders_item` VALUES (29, 18, '手剥葡萄', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%89%8B%E5%89%A5%E8%91%A1%E8%90%84.png', 16.20, 1, 10);
INSERT INTO `orders_item` VALUES (30, 18, '手剥葡萄', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E4%B8%80%E7%82%B9%E7%82%B9/%E5%95%86%E5%93%81/%E6%89%8B%E5%89%A5%E8%91%A1%E8%90%84.png', 16.20, 1, 11);
INSERT INTO `orders_item` VALUES (31, 19, '西瓜麦旋风', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E9%BA%A6%E5%BD%93%E5%8A%B3/%E5%95%86%E5%93%81/%E8%A5%BF%E7%93%9C%E9%BA%A6%E6%97%8B%E9%A3%8E.png', 12.00, 1, 18);
INSERT INTO `orders_item` VALUES (32, 20, '高山抹茶清爽椰', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E9%AB%98%E5%B1%B1%E6%8A%B9%E8%8C%B6%E6%B8%85%E7%88%BD%E6%A4%B0.png', 9.03, 1, 15);
INSERT INTO `orders_item` VALUES (33, 20, '蓝山咖啡', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E8%93%9D%E5%B1%B1.png', 9.03, 1, 13);
INSERT INTO `orders_item` VALUES (34, 20, '橙C美式咖啡', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E6%A9%99C.png', 9.03, 1, 12);
INSERT INTO `orders_item` VALUES (35, 21, '阿卡特里咖啡', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E5%BA%93%E8%BF%AA%E5%92%96%E5%95%A1/%E5%95%86%E5%93%81/%E9%98%BF%E5%8D%A1%E7%89%B9%E9%87%8C%E5%92%96%E5%95%A1.png', 18.00, 1, 17);

-- ----------------------------
-- Table structure for rider_orders
-- ----------------------------
DROP TABLE IF EXISTS `rider_orders`;
CREATE TABLE `rider_orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rider_id` int NOT NULL,
  `order_id` int NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `assigned_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rider_id`(`rider_id` ASC) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `rider_orders_ibfk_1` FOREIGN KEY (`rider_id`) REFERENCES `riders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rider_orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rider_orders
-- ----------------------------
INSERT INTO `rider_orders` VALUES (1, 1, 21, '已完成', '2024-07-02 00:00:00');

-- ----------------------------
-- Table structure for riders
-- ----------------------------
DROP TABLE IF EXISTS `riders`;
CREATE TABLE `riders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rider_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vehicle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of riders
-- ----------------------------
INSERT INTO `riders` VALUES (1, 'testRider', 'password123', 'Test Rider', '1234567890', 'bike', 'available', 'http://localhost:9090/files/1720658977880-lcc.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `latitude` decimal(10, 8) NULL DEFAULT NULL,
  `longitude` decimal(11, 8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'lwd', '123', '李炜锻', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E7%94%A8%E6%88%B7/lwd.png', 'USER', '男', '13899887766', 1.00000000, 1.00000000);
INSERT INTO `user` VALUES (4, 'lcc', '123', '林吃吃', 'http://localhost:9090/files/1719978079776-用户头像.png', 'USER', '男', '13202794312', NULL, NULL);
INSERT INTO `user` VALUES (7, 'qml', '123', '邱名流', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E7%94%A8%E6%88%B7/qml.png', 'USER', '男', NULL, NULL, NULL);
INSERT INTO `user` VALUES (8, 'hj', '123', '何君', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E7%94%A8%E6%88%B7/hj.png', 'USER', '男', NULL, NULL, NULL);
INSERT INTO `user` VALUES (9, 'tjh', '123', '唐嘉豪', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E7%94%A8%E6%88%B7/tjh.png', 'USER', '男', '132069600', NULL, NULL);
INSERT INTO `user` VALUES (10, 'ljh', '123', '柳嘉豪', 'https://raw.githubusercontent.com/xuanyu6868/takeaway/main/%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90/%E7%94%A8%E6%88%B7/ljh.png', 'USER', '男', '132066666', NULL, NULL);
INSERT INTO `user` VALUES (15, '123', '123', '123', 'http://localhost:9090/files/1697438073596-avatar.png', 'USER', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
