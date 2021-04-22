/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3366
 Source Schema         : manager

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 02/02/2021 17:29:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for busi_address
-- ----------------------------
DROP TABLE IF EXISTS `busi_address`;
CREATE TABLE `busi_address`  (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `ancestors` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `address_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `order_num` decimal(4, 0) DEFAULT NULL,
  `leader` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `phone` decimal(11, 0) DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `del_flag` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci COMMENT = '设备位置的信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of busi_address
-- ----------------------------
INSERT INTO `busi_address` VALUES (1, NULL, NULL, '全厂', 0, '张三', 13911190901, '祖级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (2, 1, '1', '电解车间', 1, '李四', 13911190901, '一级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (3, 1, '1', '铸造车间', 1, '李四', 13911190901, '一级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (4, 1, '1', '阳极车间', 2, '李四', 13911190901, '一级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (5, 1, '1', '维修车间', 3, '李四', 13911190901, '一级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (6, 2, '1,2', '电解车间一系列', 1, '王五', 13911190901, '二级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (7, 2, '1,2', '电解车间一系列', 2, '王五', 13911190901, '二级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (8, 2, '1,2', '电解车间一系列', 3, '王五', 13911190901, '二级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (9, 2, '1,2', '电解车间一系列', 4, '王五', 13911190901, '二级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (10, 5, '1,5', '维修车间电器', 1, '王五', 13911190901, '二级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (11, 5, '1,5', '维修车间工艺', 2, '王五', 13911190901, '二级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (12, 5, '1,5', '维修车间生产', 3, '王五', 13911190901, '二级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (13, 5, '1,5', '维修车间物料', 4, '王五', 13911190901, '二级节点', '0', '0', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_address` VALUES (14, 3, NULL, '阳极导杆', 1, '马六', 13911198965, '测试', '0', '1', 'admin', '2021-01-29 08:53:21');

-- ----------------------------
-- Table structure for busi_checkitems
-- ----------------------------
DROP TABLE IF EXISTS `busi_checkitems`;
CREATE TABLE `busi_checkitems`  (
  `check_code` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `check_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `realtime_type` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '0' COMMENT '0：非实时 1：实时',
  `check_type` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '0' COMMENT '查字典',
  `status` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `comput_limit` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL COMMENT '> < != 等等',
  `max_value` decimal(10, 4) DEFAULT NULL,
  `order_num` decimal(4, 0) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`check_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci COMMENT = '检查表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of busi_checkitems
-- ----------------------------
INSERT INTO `busi_checkitems` VALUES (4, '电解车间一系列', '扳手限位', '1', '2', '0', '5', 1.0000, 1, '2021-01-01', '2021-03-31', '', 'admin', '2021-01-29 09:57:31');
INSERT INTO `busi_checkitems` VALUES (5, '维修车间', '打壳机上限位', '1', '2', '0', '2', 2.0000, 2, '2021-01-01', '2021-04-16', '测试', 'admin', '2021-01-30 18:39:14');
INSERT INTO `busi_checkitems` VALUES (6, '', '大车变频报警', '1', '1', '0', '2', 3.0000, 3, '2021-01-06', '2021-03-25', '', 'admin', '2021-01-30 18:39:39');

-- ----------------------------
-- Table structure for busi_checkpoints
-- ----------------------------
DROP TABLE IF EXISTS `busi_checkpoints`;
CREATE TABLE `busi_checkpoints`  (
  `check_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `address` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `ancestors` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `check_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `check_type` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL COMMENT '查字典',
  `comput_limit` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL COMMENT '> < != 等等',
  `max_value` decimal(10, 4) DEFAULT NULL,
  `order_num` decimal(4, 0) NOT NULL,
  `comment` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`check_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci COMMENT = '检查点信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of busi_checkpoints
-- ----------------------------
INSERT INTO `busi_checkpoints` VALUES (1, NULL, '全厂', NULL, '全厂', NULL, NULL, NULL, 0, '祖级节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (2, 1, '电解一系列', '1', '大车', NULL, NULL, NULL, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (3, 1, '电解一系列', '1', '工具车', NULL, NULL, NULL, 2, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (4, 1, '电解一系列', '1', '出铝车', NULL, NULL, NULL, 3, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (5, 1, '电解一系列', '1', '液压站', NULL, NULL, NULL, 4, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (6, 1, '电解一系列', '1', '司机室', NULL, NULL, NULL, 5, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (7, 1, '电解一系列', '1', '故障', NULL, NULL, NULL, 6, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (8, 2, '电解一系列', '1,2', '大车电机过热', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (9, 2, '电解一系列', '1,2', '大车变频报警', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (10, 2, '电解一系列', '1,2', '碰碎脚踏', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (11, 2, '电解一系列', '1,2', '大车前进激光防撞限位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (12, 2, '电解一系列', '1,2', '大车前进限位机械', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (13, 2, '电解一系列', '1,2', '大车前进激光减速限位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (14, 2, '电解一系列', '1,2', '料管上限位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (15, 2, '电解一系列', '1,2', '打壳机上限位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (16, 2, '电解一系列', '1,2', '大车前进一档', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (17, 2, '电解一系列', '1,2', '大车前进二档', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (18, 2, '电解一系列', '1,2', '大车前进三档', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (19, 2, '电解一系列', '1,2', '大车后退一档', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (20, 2, '电解一系列', '1,2', '大车后退二档', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (21, 2, '电解一系列', '1,2', '大车后退三档', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (22, 2, '电解一系列', '1,2', '大车抱闸', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (23, 2, '电解一系列', '1,2', '大车变频运行', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (24, 2, '电解一系列', '1,2', '大车变频复位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (25, 2, '电解一系列', '1,2', '大车后退限位机械', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (26, 2, '电解一系列', '1,2', '大车后退激光防撞限位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (27, 2, '电解一系列', '1,2', '大车后退激光减速限位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (28, 2, '电解一系列', '1,2', '门限位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_checkpoints` VALUES (29, 2, '电解一系列', '1,2', '扳手限位', '1', '1', 80.0000, 1, '一级节点节点', 'SYSTEM', '2021-01-29 00:00:00');

-- ----------------------------
-- Table structure for busi_partinformation
-- ----------------------------
DROP TABLE IF EXISTS `busi_partinformation`;
CREATE TABLE `busi_partinformation`  (
  `part_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `part_item` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `unit_name` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `del_flag` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`part_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci COMMENT = '备件的基本信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of busi_partinformation
-- ----------------------------
INSERT INTO `busi_partinformation` VALUES (1, 'CPU电磁', '1756-BA2', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (2, 'HBC遥控器腰带', 'HBC遥控器腰带 编码号CM.HJ.29', '条', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (3, 'LED工矿灯', 'NJZ-FLB-160RR-AO', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (4, '摆线针轮减速机', 'XLEDY-74-2.2KW-传动比：1：841  YPX100L1-4 B5X4', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (5, '变频调速电磁制动三相异步电动机', 'YPBFE100L-6', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (6, '变频器', '20B C 011 AOAYNANCO', '台', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (7, '变压器', 'JMB-4K(5K)VA', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (8, '不锈钢后冷却器', 'ATC60002', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (9, '超级冷却剂', '38459582', 'KG', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (10, '打壳机拉杆', 'M24*425 8.8级', '根', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (11, '打壳机倾斜油缸', 'D/D-L/L1=80/56-840/1180', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (12, '打壳机专用螺栓', '86263829', '根', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (13, '弹簧', '86220498', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (14, '电磁阀', '4V430-15', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (15, '电机', 'IY112M-4', '台', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (16, '电解多功能出铝小车卷扬配件', 'PTM32t/(18+18)吊钩组联轴器 订货号；FDG32-GZ', '件', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (17, '电缆', '4*1.5', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (18, '电缆拖链(司机室)', 'MP52.2  171  R1500/RU135', '件', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (19, '定位销', '86239506', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (20, '断火限位', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (21, '断油阀', 'ATC05028', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (22, '多功能机组遥控器发射器电池', 'HBC-D74564-BA214061(沈冶04B', '块', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (23, '防脱卡具扳手总成', '配7B119/8B107机组', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (24, '风管', '1寸', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (25, '钢丝绳', 'Φ8', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (26, '高精度全自动交流稳压器', 'TND3-5000VA 额定功率；Ma*5000VA', ' 台', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (27, '工具车防撞胶敦', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (28, '工具车行走电机', 'DV132S4/BMG/HF/VS  5.5KW', '台', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (29, '工具旋转马达', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (30, '轨道夹板', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (31, '缓冲块', '86269925', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (32, '回转水平轮组', '回转水平轮组II', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (33, '激光防撞', 'TQJGS-2011', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (34, '继电器隔离板', 'KAB-D8A8-L', '块', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (35, '继电器隔离板(直流)', 'KF-108', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (36, '夹具开启油缸', 'BYG2807-07-00-00', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (37, '加载缸', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (38, '减震装置', '与GBLY.314.2.3.2.1.0配套  胶皮套厚度75MM\"', '套', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (39, '交流接触器', 'LC1 D32 Q7C', '个 ', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (40, '接近开关', 'NBB15-30GM50-WO', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (41, '绝缘胶管', '588N-6', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (42, '开关电源', 'GZM-H40D5+12R', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (43, '空气压缩机', '空压机总成ESB50320  额定功率；55KW 额定电压；380V', '台', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (44, '空压机主机', 'AA038001', '台', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (45, '空压软管', '', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (46, '快速插头三通', 'ф12', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (47, '两位旋钮', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (48, '气缸', 'QGB E63*160 L5', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (49, '钎头', 'L= 475', '根', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (50, '全方位抗磨液压油', 'HM46#', 'KG', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (51, '热继电器', 'LRD 09', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (52, '时间继电器', 'LAD T2', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (53, '塑胶管', '', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (54, '同轴电缆', '', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (55, '同轴电缆接头', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (56, '铜套', '图二', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (57, '吸顶灯', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (58, '小车防撞缓冲器', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (59, '行程开关', 'ME-8169', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (60, '压力开关', '99260960', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (61, '氧气带', '', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (62, '遥控器接收器急停板', '遥控器接收器急停板 CM776-04*11', '块', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (63, '遥控器配件', '机组单独发射器主控04B/05B10  FSS776 SP3', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (64, '遥控器总成', 'FSS  524 SP1', '台', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (65, '液压缸', 'ATC05029', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (66, '易格斯电缆', 'CF77.UL.40.04.D', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (67, '易格斯电缆线', '4*2.5', '米', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (68, '油管接头', '与绝缘胶管588N-6配套', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (69, '油滤芯', '42843797', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (70, '支撑滚轮', 'NATV35', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (71, '中间继电器', '', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (72, '轴承', 'SKF6311', '口', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_partinformation` VALUES (73, '主令控制器（右手）', '8B122;BVV8Z3Z3+B3D4WKP11-CP6', '个', '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');

-- ----------------------------
-- Table structure for busi_pointpartmap
-- ----------------------------
DROP TABLE IF EXISTS `busi_pointpartmap`;
CREATE TABLE `busi_pointpartmap`  (
  `map_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `address` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `check_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `part_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `part_item` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `unit_name` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `default_flag` varchar(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`map_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci COMMENT = '检查点备件对应表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of busi_pointpartmap
-- ----------------------------
INSERT INTO `busi_pointpartmap` VALUES (3, NULL, NULL, '电解车间一系列', '打壳机上限位', '变频调速电磁制动三相异步电动机', 'NJZ-FLB-160RR-AO', '个', 'Y', 'D阿萨德', 'admin', '2021-01-30 18:18:52');
INSERT INTO `busi_pointpartmap` VALUES (4, NULL, NULL, '电解车间一系列', '扳手限位', 'HBC遥控器腰带', 'HBC遥控器腰带 编码号CM.HJ.29', '根', 'Y', '测试', 'admin', '2021-01-30 18:38:10');

-- ----------------------------
-- Table structure for busi_reportday
-- ----------------------------
DROP TABLE IF EXISTS `busi_reportday`;
CREATE TABLE `busi_reportday`  (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `part_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `part_item` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `unit_name` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `part_count` int(11) NOT NULL DEFAULT 0,
  `create_by` varchar(64) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `create_date` datetime(0) NOT NULL,
  `leader` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `deal_time` datetime(0) DEFAULT NULL,
  `repair_dept` varchar(30) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `require_time` datetime(0) DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of busi_reportday
-- ----------------------------
INSERT INTO `busi_reportday` VALUES (1, '扳手限位', 'HBC遥控器腰带', 'HBC遥控器腰带 编码号CM.HJ.29', '根', 0, 'SYSTEM', '2021-01-31 01:00:00', NULL, NULL, NULL, NULL, '系统自动生成');
INSERT INTO `busi_reportday` VALUES (2, '打壳机上限位', '变频调速电磁制动三相异步电动机', 'NJZ-FLB-160RR-AO', '个', 0, 'SYSTEM', '2021-01-31 01:00:00', NULL, NULL, NULL, NULL, '系统自动生成');
INSERT INTO `busi_reportday` VALUES (3, '扳手限位', 'HBC遥控器腰带', 'HBC遥控器腰带 编码号CM.HJ.29', '根', 0, 'SYSTEM', '2021-02-01 01:00:00', NULL, NULL, NULL, NULL, '系统自动生成');
INSERT INTO `busi_reportday` VALUES (4, '打壳机上限位', '变频调速电磁制动三相异步电动机', 'NJZ-FLB-160RR-AO', '个', 0, 'SYSTEM', '2021-02-01 01:00:00', NULL, NULL, NULL, NULL, '系统自动生成');
INSERT INTO `busi_reportday` VALUES (5, '扳手限位', 'HBC遥控器腰带', 'HBC遥控器腰带 编码号CM.HJ.29', '根', 0, 'SYSTEM', '2021-02-02 01:00:00', NULL, NULL, NULL, NULL, '系统自动生成');
INSERT INTO `busi_reportday` VALUES (6, '打壳机上限位', '变频调速电磁制动三相异步电动机', 'NJZ-FLB-160RR-AO', '个', 0, 'SYSTEM', '2021-02-02 01:00:00', NULL, NULL, NULL, NULL, '系统自动生成');

-- ----------------------------
-- Table structure for busi_unit
-- ----------------------------
DROP TABLE IF EXISTS `busi_unit`;
CREATE TABLE `busi_unit`  (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `foreign_name` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `unit_mark` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `order_num` decimal(4, 0) NOT NULL,
  `status` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `del_flag` char(1) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci COMMENT = '计量单位' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of busi_unit
-- ----------------------------
INSERT INTO `busi_unit` VALUES (1, '米', 'metre', 'M', 1, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (2, '台', NULL, 'T', 2, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (3, '公斤', 'kilogram', 'Kg', 3, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (4, '个', NULL, 'G', 4, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (5, '根', NULL, 'Gen', 5, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (6, '件', NULL, 'J', 6, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (7, '口', NULL, 'K', 7, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (8, '块', NULL, 'Ku', 8, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (9, '套', NULL, 'T', 9, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');
INSERT INTO `busi_unit` VALUES (10, '条', NULL, 'T', 10, '0', '0', '系统导入', 'SYSTEM', '2021-01-29 00:00:00');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'sys_config', '参数配置表', NULL, NULL, 'Config', 'crud', 'com.jeethink.project.system', 'system', 'config', '参数配置', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_dept', '部门表', NULL, NULL, 'Dept', 'tree', 'com.jeethink.project.system', 'system', 'dept', '企业部门', 'hanbin', '0', '/', '{\"parentMenuId\":\"2002\",\"treeName\":\"dept_name\",\"treeParentCode\":\"parent_id\",\"parentMenuName\":\"基本信息\",\"treeCode\":\"dept_id\"}', 'admin', '2021-01-06 13:27:15', '', '2021-01-23 16:58:04', '');
INSERT INTO `gen_table` VALUES (5, 'sys_dict_data', '字典数据表', NULL, NULL, 'DictData', 'crud', 'com.jeethink.project.system', 'system', 'data', '字典数据', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_dict_type', '字典类型表', NULL, NULL, 'DictType', 'crud', 'com.jeethink.project.system', 'system', 'type', '字典类型', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'sys_job', '定时任务调度表', NULL, NULL, 'Job', 'crud', 'com.jeethink.project.system', 'system', 'job', '定时任务调度', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'sys_job_log', '定时任务调度日志表', NULL, NULL, 'JobLog', 'crud', 'com.jeethink.project.system', 'system', 'log', '定时任务调度日志', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'sys_logininfor', '系统访问记录', NULL, NULL, 'Logininfor', 'crud', 'com.jeethink.project.system', 'system', 'logininfor', '系统访问记录', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (10, 'sys_menu', '菜单权限表', NULL, NULL, 'Menu', 'crud', 'com.jeethink.project.system', 'system', 'menu', '菜单权限', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (11, 'sys_notice', '通知公告表', NULL, NULL, 'Notice', 'crud', 'com.jeethink.project.system', 'system', 'notice', '通知公告', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'sys_oper_log', '操作日志记录', NULL, NULL, 'OperLog', 'crud', 'com.jeethink.project.system', 'system', 'log', '操作日志记录', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (13, 'sys_post', '岗位信息表', NULL, NULL, 'Post', 'crud', 'com.jeethink.project.system', 'system', 'post', '岗位信息', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 'sys_role', '角色信息表', NULL, NULL, 'Role', 'crud', 'com.jeethink.project.system', 'system', 'role', '角色信息', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'sys_role_dept', '角色和部门关联表', NULL, NULL, 'RoleDept', 'crud', 'com.jeethink.project.system', 'system', 'dept', '角色和部门关联', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (16, 'sys_role_menu', '角色和菜单关联表', NULL, NULL, 'RoleMenu', 'crud', 'com.jeethink.project.system', 'system', 'menu', '角色和菜单关联', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (17, 'sys_user', '用户信息表', NULL, NULL, 'User', 'crud', 'com.jeethink.project.system', 'system', 'user', '用户信息', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (18, 'sys_user_online', '在线用户记录', NULL, NULL, 'UserOnline', 'crud', 'com.jeethink.project.system', 'system', 'online', '在线用户记录', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (19, 'sys_user_post', '用户与岗位关联表', NULL, NULL, 'UserPost', 'crud', 'com.jeethink.project.system', 'system', 'post', '用户与岗位关联', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (20, 'sys_user_role', '用户和角色关联表', NULL, NULL, 'UserRole', 'crud', 'com.jeethink.project.system', 'system', 'role', '用户和角色关联', 'jeethink', '0', '/', NULL, 'admin', '2021-01-06 13:27:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (50, 'busi_address', '设备位置的信息表', NULL, NULL, 'Address', 'tree', 'com.jeethink.project.business', 'business', 'address', '设备位置的信息', 'hanbin', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"address_name\",\"treeParentCode\":\"parent_id\",\"parentMenuName\":\"设备设定\",\"treeCode\":\"address_id\"}', 'admin', '2021-01-27 09:45:00', '', '2021-01-27 11:02:55', '');
INSERT INTO `gen_table` VALUES (54, 'busi_reportday', '日报表', NULL, NULL, 'ReportDay', 'crud', 'com.jeethink.project.business', 'business', 'reportDay', '日报表', 'hanbin', '0', '/', '{\"parentMenuId\":\"2003\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"日常报表\",\"treeCode\":\"\"}', 'admin', '2021-01-27 09:45:00', '', '2021-01-29 16:38:40', '');
INSERT INTO `gen_table` VALUES (56, 'busi_checkpoints', '检查点信息表', NULL, NULL, 'CheckPoints', 'tree', 'com.jeethink.project.business', 'business', 'checkPoints', '检查点信息', 'hanbin', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"check_name\",\"treeParentCode\":\"parent_id\",\"parentMenuName\":\"设备设定\",\"treeCode\":\"check_id\"}', 'admin', '2021-01-27 10:01:30', '', '2021-01-28 08:02:00', '');
INSERT INTO `gen_table` VALUES (59, 'busi_unit', '计量单位', NULL, NULL, 'Unit', 'crud', 'com.jeethink.project.business', 'business', 'unit', '计量单位', 'hanbin', '0', '/', '{\"parentMenuId\":\"2002\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"基本信息\",\"treeCode\":\"\"}', 'admin', '2021-01-27 11:20:27', '', '2021-01-27 17:03:42', '');
INSERT INTO `gen_table` VALUES (60, 'busi_partinformation', '备件的基本信息', NULL, NULL, 'Part', 'crud', 'com.jeethink.project.business', 'business', 'part', '备件信息', 'hanbin', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"设备设定\",\"treeCode\":\"\"}', 'admin', '2021-01-27 19:31:50', '', '2021-01-27 19:37:08', '');
INSERT INTO `gen_table` VALUES (61, 'busi_checkitems', '检查表', NULL, NULL, 'CheckItems', 'crud', 'com.jeethink.project.business', 'business', 'checkItems', '检查项设置', 'hanbin', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2021-01-28 19:26:55', '', '2021-01-28 19:33:18', '');
INSERT INTO `gen_table` VALUES (63, 'busi_pointpartmap', '检查点备件对应表', NULL, NULL, 'PointPartMap', 'crud', 'com.jeethink.project.business', 'business', 'pointPartMap', '检查点备件对应', 'hanbin', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"设备设定\",\"treeCode\":\"\"}', 'admin', '2021-01-30 15:22:55', '', '2021-01-30 18:19:38', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 630 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (13, '3', 'config_id', '参数主键', 'int(5)', 'Integer', 'configId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '3', 'config_name', '参数名称', 'varchar(100)', 'String', 'configName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '3', 'config_key', '参数键名', 'varchar(100)', 'String', 'configKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '3', 'config_value', '参数键值', 'varchar(500)', 'String', 'configValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '3', 'config_type', '系统内置（Y是 N否）', 'char(1)', 'String', 'configType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '4', 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (24, '4', 'parent_id', '父部门id', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (25, '4', 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (26, '4', 'dept_name', '部门名称', 'varchar(30)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (27, '4', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (28, '4', 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (29, '4', 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (30, '4', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (31, '4', 'status', '部门状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'sys_normal_disable', 9, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (32, '4', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', 'sys_oper_type', 10, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (33, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (34, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (35, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (36, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-01-06 13:27:15', NULL, '2021-01-23 16:58:04');
INSERT INTO `gen_table_column` VALUES (37, '5', 'dict_code', '字典编码', 'bigint(20)', 'Long', 'dictCode', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '5', 'dict_sort', '字典排序', 'int(4)', 'Integer', 'dictSort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '5', 'dict_label', '字典标签', 'varchar(100)', 'String', 'dictLabel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '5', 'dict_value', '字典键值', 'varchar(100)', 'String', 'dictValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '5', 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '5', 'css_class', '样式属性（其他样式扩展）', 'varchar(100)', 'String', 'cssClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '5', 'list_class', '表格回显样式', 'varchar(100)', 'String', 'listClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '5', 'is_default', '是否默认（Y是 N否）', 'char(1)', 'String', 'isDefault', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '5', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '6', 'dict_id', '字典主键', 'bigint(20)', 'Long', 'dictId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '6', 'dict_name', '字典名称', 'varchar(100)', 'String', 'dictName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '6', 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '6', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '6', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, '7', 'job_id', '任务ID', 'bigint(20)', 'Long', 'jobId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, '7', 'job_name', '任务名称', 'varchar(64)', 'String', 'jobName', '1', '0', NULL, '1', NULL, NULL, NULL, 'LIKE', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, '7', 'job_group', '任务组名', 'varchar(64)', 'String', 'jobGroup', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, '7', 'invoke_target', '调用目标字符串', 'varchar(500)', 'String', 'invokeTarget', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, '7', 'cron_expression', 'cron执行表达式', 'varchar(255)', 'String', 'cronExpression', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, '7', 'misfire_policy', '计划执行错误策略（1立即执行 2执行一次 3放弃执行）', 'varchar(20)', 'String', 'misfirePolicy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, '7', 'concurrent', '是否并发执行（0允许 1禁止）', 'char(1)', 'String', 'concurrent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, '7', 'status', '状态（0正常 1暂停）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, '7', 'remark', '备注信息', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, '8', 'job_log_id', '任务日志ID', 'bigint(20)', 'Long', 'jobLogId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, '8', 'job_name', '任务名称', 'varchar(64)', 'String', 'jobName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, '8', 'job_group', '任务组名', 'varchar(64)', 'String', 'jobGroup', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, '8', 'invoke_target', '调用目标字符串', 'varchar(500)', 'String', 'invokeTarget', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, '8', 'job_message', '日志信息', 'varchar(500)', 'String', 'jobMessage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, '8', 'status', '执行状态（0正常 1失败）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, '8', 'exception_info', '异常信息', 'varchar(2000)', 'String', 'exceptionInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, '9', 'info_id', '访问ID', 'bigint(20)', 'Long', 'infoId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, '9', 'login_name', '登录账号', 'varchar(50)', 'String', 'loginName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, '9', 'ipaddr', '登录IP地址', 'varchar(50)', 'String', 'ipaddr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, '9', 'login_location', '登录地点', 'varchar(255)', 'String', 'loginLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '9', 'browser', '浏览器类型', 'varchar(50)', 'String', 'browser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, '9', 'os', '操作系统', 'varchar(50)', 'String', 'os', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, '9', 'status', '登录状态（0成功 1失败）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, '9', 'msg', '提示消息', 'varchar(255)', 'String', 'msg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, '9', 'login_time', '访问时间', 'datetime', 'Date', 'loginTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, '10', 'menu_id', '菜单ID', 'bigint(20)', 'Long', 'menuId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, '10', 'menu_name', '菜单名称', 'varchar(50)', 'String', 'menuName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, '10', 'parent_id', '父菜单ID', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, '10', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, '10', 'url', '请求地址', 'varchar(200)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, '10', 'target', '打开方式（menuItem页签 menuBlank新窗口）', 'varchar(20)', 'String', 'target', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, '10', 'menu_type', '菜单类型（M目录 C菜单 F按钮）', 'char(1)', 'String', 'menuType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, '10', 'visible', '菜单状态（0显示 1隐藏）', 'char(1)', 'String', 'visible', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, '10', 'perms', '权限标识', 'varchar(100)', 'String', 'perms', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, '10', 'icon', '菜单图标', 'varchar(100)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, '10', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, '10', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, '10', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, '10', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, '11', 'notice_id', '公告ID', 'int(4)', 'Integer', 'noticeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, '11', 'notice_title', '公告标题', 'varchar(50)', 'String', 'noticeTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, '11', 'notice_type', '公告类型（1通知 2公告）', 'char(1)', 'String', 'noticeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '11', 'notice_content', '公告内容', 'varchar(2000)', 'String', 'noticeContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, '11', 'status', '公告状态（0正常 1关闭）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, '11', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, '12', 'oper_id', '日志主键', 'bigint(20)', 'Long', 'operId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, '12', 'title', '模块标题', 'varchar(50)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, '12', 'business_type', '业务类型（0其它 1新增 2修改 3删除）', 'int(2)', 'Integer', 'businessType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, '12', 'method', '方法名称', 'varchar(100)', 'String', 'method', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (119, '12', 'request_method', '请求方式', 'varchar(10)', 'String', 'requestMethod', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, '12', 'operator_type', '操作类别（0其它 1后台用户 2手机端用户）', 'int(1)', 'Integer', 'operatorType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, '12', 'oper_name', '操作人员', 'varchar(50)', 'String', 'operName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, '12', 'dept_name', '部门名称', 'varchar(50)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, '12', 'oper_url', '请求URL', 'varchar(255)', 'String', 'operUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, '12', 'oper_ip', '主机地址', 'varchar(50)', 'String', 'operIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, '12', 'oper_location', '操作地点', 'varchar(255)', 'String', 'operLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, '12', 'oper_param', '请求参数', 'varchar(2000)', 'String', 'operParam', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, '12', 'json_result', '返回参数', 'varchar(2000)', 'String', 'jsonResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 13, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, '12', 'status', '操作状态（0正常 1异常）', 'int(1)', 'Integer', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, '12', 'error_msg', '错误消息', 'varchar(2000)', 'String', 'errorMsg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, '12', 'oper_time', '操作时间', 'datetime', 'Date', 'operTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, '13', 'post_id', '岗位ID', 'bigint(20)', 'Long', 'postId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, '13', 'post_code', '岗位编码', 'varchar(64)', 'String', 'postCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, '13', 'post_name', '岗位名称', 'varchar(50)', 'String', 'postName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, '13', 'post_sort', '显示顺序', 'int(4)', 'Integer', 'postSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (135, '13', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (136, '13', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (137, '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, '13', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, '13', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, '13', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, '14', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, '14', 'role_name', '角色名称', 'varchar(30)', 'String', 'roleName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, '14', 'role_key', '角色权限字符串', 'varchar(100)', 'String', 'roleKey', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, '14', 'role_sort', '显示顺序', 'int(4)', 'Integer', 'roleSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, '14', 'data_scope', '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）', 'char(1)', 'String', 'dataScope', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, '14', 'status', '角色状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, '14', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, '14', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, '14', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, '14', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, '14', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, '14', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, '15', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, '15', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, '16', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, '16', 'menu_id', '菜单ID', 'bigint(20)', 'Long', 'menuId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (157, '17', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (158, '17', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (159, '17', 'login_name', '登录账号', 'varchar(30)', 'String', 'loginName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, '17', 'user_name', '用户昵称', 'varchar(30)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (161, '17', 'user_type', '用户类型（00系统用户 01注册用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (162, '17', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (163, '17', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (164, '17', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (165, '17', 'avatar', '头像路径', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (166, '17', 'password', '密码', 'varchar(50)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (167, '17', 'salt', '盐加密', 'varchar(20)', 'String', 'salt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (168, '17', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 12, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (169, '17', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (170, '17', 'login_ip', '最后登录IP', 'varchar(50)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (171, '17', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (172, '17', 'pwd_update_date', '密码最后更新时间', 'datetime', 'Date', 'pwdUpdateDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (173, '17', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (174, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (175, '17', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (176, '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (177, '17', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 21, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (178, '18', 'sessionId', '用户会话id', 'varchar(50)', 'String', 'sessionId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (179, '18', 'login_name', '登录账号', 'varchar(50)', 'String', 'loginName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (180, '18', 'dept_name', '部门名称', 'varchar(50)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (181, '18', 'ipaddr', '登录IP地址', 'varchar(50)', 'String', 'ipaddr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (182, '18', 'login_location', '登录地点', 'varchar(255)', 'String', 'loginLocation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (183, '18', 'browser', '浏览器类型', 'varchar(50)', 'String', 'browser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (184, '18', 'os', '操作系统', 'varchar(50)', 'String', 'os', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (185, '18', 'status', '在线状态on_line在线off_line离线', 'varchar(10)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (186, '18', 'start_timestamp', 'session创建时间', 'datetime', 'Date', 'startTimestamp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (187, '18', 'last_access_time', 'session最后访问时间', 'datetime', 'Date', 'lastAccessTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (188, '18', 'expire_time', '超时时间，单位为分钟', 'int(5)', 'Integer', 'expireTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (189, '19', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (190, '19', 'post_id', '岗位ID', 'bigint(20)', 'Long', 'postId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (191, '20', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (192, '20', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-06 13:27:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (489, '50', 'address_id', '地址编码', 'int(11)', 'Long', 'addressId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (490, '50', 'parent_id', '父地址编码', 'int(11)', 'Long', 'parentId', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (491, '50', 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (492, '50', 'address_name', '地址名称', 'varchar(50)', 'String', 'addressName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (493, '50', 'order_num', '显示顺序', 'decimal(4,0)', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (494, '50', 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (495, '50', 'phone', '联系电话', 'decimal(11,0)', 'Long', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (496, '50', 'comment', '备注', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (497, '50', 'status', '使用状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_normal_disable', 9, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (498, '50', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'select', 'busi_delete_flag', 10, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (499, '50', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (500, '50', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-27 11:02:55');
INSERT INTO `gen_table_column` VALUES (536, '54', 'report_id', '报表编码', 'int(11)', 'Long', 'reportId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (537, '54', 'check_name', '检查点名', 'varchar(50)', 'String', 'checkName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'select', '', 2, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (538, '54', 'part_name', '配件名称', 'varchar(50)', 'String', 'partName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (539, '54', 'part_item', '规格型号', 'varchar(100)', 'String', 'partItem', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (540, '54', 'unit_name', '单位名称', 'varchar(20)', 'String', 'unitName', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', '', 5, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (541, '54', 'part_count', '数量', 'int(11)', 'Long', 'partCount', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (542, '54', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'input', '', 7, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (543, '54', 'create_date', '创建日期', 'datetime', 'Date', 'createDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (544, '54', 'leader', '分配者', 'varchar(20)', 'String', 'leader', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (545, '54', 'deal_time', '要求时限', 'datetime', 'Date', 'dealTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (546, '54', 'repair_dept', '维修机组', 'varchar(30)', 'String', 'repairDept', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'select', '', 11, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (547, '54', 'require_time', '完成时间', 'datetime', 'Date', 'requireTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (548, '54', 'comment', '备注', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-01-27 09:45:00', NULL, '2021-01-29 16:38:40');
INSERT INTO `gen_table_column` VALUES (559, '56', 'check_id', '检查点编码', 'int(11)', 'Long', 'checkId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (560, '56', 'parent_id', '父检查点编码', 'int(11)', 'Long', 'parentId', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (561, '56', 'address', '所在地址', 'varchar(50)', 'String', 'address', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (562, '56', 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (563, '56', 'check_name', '检查点名称', 'varchar(50)', 'String', 'checkName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (564, '56', 'check_type', '检查类型', 'char(1)', 'String', 'checkType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'busi_check_type', 6, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (565, '56', 'comput_limit', '计算类型', 'char(1)', 'String', 'computLimit', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', 'busi_condition_items', 7, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (566, '56', 'max_value', '阈值', 'decimal(10,4)', 'BigDecimal', 'maxValue', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (567, '56', 'order_num', '显示顺序', 'decimal(4,0)', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (568, '56', 'comment', '备注', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (569, '56', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (570, '56', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-01-27 10:01:30', NULL, '2021-01-28 08:02:00');
INSERT INTO `gen_table_column` VALUES (583, '59', 'unit_id', '计量编码', 'int(11)', 'Long', 'unitId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (584, '59', 'unit_name', '计量名称', 'varchar(20)', 'String', 'unitName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (585, '59', 'foreign_name', '国际名称', 'varchar(20)', 'String', 'foreignName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (586, '59', 'unit_mark', '计量符号', 'varchar(20)', 'String', 'unitMark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (587, '59', 'order_num', '显示顺序', 'decimal(4,0)', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (588, '59', 'status', '使用状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_normal_disable', 6, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (589, '59', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'select', 'busi_delete_flag', 7, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (590, '59', 'comment', '备注', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (591, '59', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (592, '59', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-01-27 11:20:27', NULL, '2021-01-27 17:03:42');
INSERT INTO `gen_table_column` VALUES (593, '60', 'part_id', '配件编码', 'int(11)', 'Long', 'partId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (594, '60', 'part_name', '配件名称', 'varchar(50)', 'String', 'partName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (595, '60', 'part_item', '规格型号', 'varchar(100)', 'String', 'partItem', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (596, '60', 'unit_name', '单位名称', 'varchar(20)', 'String', 'unitName', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', '', 4, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (597, '60', 'status', '使用状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_normal_disable', 5, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (598, '60', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'select', 'busi_delete_flag', 6, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (599, '60', 'comment', '备注', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (600, '60', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (601, '60', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-01-27 19:31:50', NULL, '2021-01-27 19:37:08');
INSERT INTO `gen_table_column` VALUES (602, '61', 'check_code', '检查编码', 'int(11)', 'Long', 'checkCode', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (603, '61', 'address', '所在位置', 'varchar(50)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (604, '61', 'check_name', '检查点名称', 'varchar(50)', 'String', 'checkName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'select', '', 3, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (605, '61', 'realtime_type', '实时性', 'char(1)', 'String', 'realtimeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'busi_realtime_type', 4, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (606, '61', 'check_type', '检查类型', 'char(1)', 'String', 'checkType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'busi_check_type', 5, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (607, '61', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_job_status', 6, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (608, '61', 'comput_limit', '条件判断', 'char(1)', 'String', 'computLimit', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', 'busi_condition_items', 7, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (609, '61', 'max_value', '阈值（10,4）', 'decimal(10,4)', 'BigDecimal', 'maxValue', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (610, '61', 'order_num', '显示顺序', 'decimal(4,0)', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (611, '61', 'start_date', '开始日期', 'date', 'Date', 'startDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (612, '61', 'end_date', '结束日期', 'date', 'Date', 'endDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (613, '61', 'comment', '备注', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (614, '61', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (615, '61', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-01-28 19:26:55', NULL, '2021-01-28 19:33:18');
INSERT INTO `gen_table_column` VALUES (618, '63', 'map_id', '映射编码', 'int(11)', 'Long', 'mapId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (619, '63', 'check_id', '检查项编码', 'int(11)', 'Long', 'checkId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (620, '63', 'part_id', '设备编码', 'int(11)', 'Long', 'partId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (621, '63', 'address', '位置名称', 'varchar(50)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (622, '63', 'check_name', '检查点名称', 'varchar(50)', 'String', 'checkName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'select', '', 5, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (623, '63', 'part_name', '备件名称', 'varchar(50)', 'String', 'partName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'select', '', 6, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (624, '63', 'part_item', '备件型号', 'varchar(100)', 'String', 'partItem', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (625, '63', 'unit_name', '单位名称', 'varchar(20)', 'String', 'unitName', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (626, '63', 'default_flag', '默认标志', 'varchar(1)', 'String', 'defaultFlag', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'sys_yes_no', 9, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (627, '63', 'comment', '备注信息', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (628, '63', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');
INSERT INTO `gen_table_column` VALUES (629, '63', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'datetime', '', 12, 'admin', '2021-01-30 15:22:55', NULL, '2021-01-30 18:19:38');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', '0/15 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME5', 'DEFAULT', '0 0 1 * * ?', 'GMT+08:00');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.jeethink.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002B636F6D2E6A65657468696E6B2E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002C636F6D2E6A65657468696E6B2E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176D59B201078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000131740001317800);
INSERT INTO `qrtz_job_details` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.jeethink.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002B636F6D2E6A65657468696E6B2E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002C636F6D2E6A65657468696E6B2E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176D59B201078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328276A74272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.jeethink.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002B636F6D2E6A65657468696E6B2E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002C636F6D2E6A65657468696E6B2E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176D59B201078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328276A74272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', NULL, 'com.jeethink.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002B636F6D2E6A65657468696E6B2E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002C636F6D2E6A65657468696E6B2E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001773D0CA1B078707400007070707400013174000E302F3135202A202A202A202A203F74001972795461736B2E7279576F726B44657461696C506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000004740006E6B58BE8AF9574000131740001317800);
INSERT INTO `qrtz_job_details` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME5', 'DEFAULT', NULL, 'com.jeethink.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002B636F6D2E6A65657468696E6B2E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002C636F6D2E6A65657468696E6B2E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001774E6C5AE07870740018E697A5E68AA5E7949FE68890E7A4BAE4BE8BE4BBA3E7A0817070707400013174000B3020302031202A202A203F74001752795461736B4461792E72795265706F7274446179282974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000574000CE697A5E68AA5E7949FE6889074000131740001307800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('JeeThinkScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('JeeThinkScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('JeeThinkScheduler', 'instance-s4y6bv1612256827957', 1612258110637, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1612256830000, -1, 5, 'PAUSED', 'CRON', 1612256828000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1612256835000, -1, 5, 'PAUSED', 'CRON', 1612256828000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1612256840000, -1, 5, 'PAUSED', 'CRON', 1612256828000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', 'TASK_CLASS_NAME4', 'DEFAULT', NULL, 1612256835000, -1, 5, 'PAUSED', 'CRON', 1612256828000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('JeeThinkScheduler', 'TASK_CLASS_NAME5', 'DEFAULT', 'TASK_CLASS_NAME5', 'DEFAULT', NULL, 1612285200000, -1, 5, 'WAITING', 'CRON', 1612256828000, 0, NULL, -1, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-01-06 10:51:22', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, NULL, '', '全厂', 0, '王晓红', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '1', '厂办公室', 1, '张三', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (3, 1, '1', '维修车间', 2, '李四', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (4, 3, '1,3', '5-0', 1, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (5, 3, '1,3', '5-1', 2, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (6, 3, '1,3', '5-1普车', 3, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (7, 3, '1,3', '5-2', 4, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (8, 3, '1,3', '5-2普车', 5, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (9, 3, '1,3', '5-3', 6, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10, 3, '1,3', '5-4', 7, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (11, 3, '1,3', '5-5', 8, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (12, 3, '1,3', '5-6', 9, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (13, 3, '1,3', '5168大面', 10, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (14, 3, '1,3', '5厂3通廊', 11, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (15, 3, '1,3', '6-1', 12, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (16, 3, '1,3', '6-1普车', 13, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (17, 3, '1,3', '6-2', 14, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (18, 3, '1,3', '6-2普车', 15, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (19, 3, '1,3', '6-3', 16, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (20, 3, '1,3', '6-4', 17, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (21, 3, '1,3', '6-5', 18, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (22, 3, '1,3', '6-6', 19, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (23, 3, '1,3', '6-7', 20, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (24, 3, '1,3', '6厂3通廊料塔', 21, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (25, 3, '1,3', '六厂二区', 22, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (26, 3, '1,3', '六厂六区', 23, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (27, 3, '1,3', '六厂一区', 24, '王五', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (28, 2, '1,2', '行政办公室', 1, '马六', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);
INSERT INTO `sys_dept` VALUES (29, 2, '1,2', '生产办公室', 2, '马六', '13900099091', NULL, '0', '0', 'SYSTEM', '2021-01-29 00:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '计次', '1', 'busi_check_type', '', 'info', 'N', '0', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-23 18:58:26', '计次');
INSERT INTO `sys_dict_data` VALUES (31, 2, '计时', '2', 'busi_check_type', '', 'success', 'N', '0', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-23 18:58:31', '计时');
INSERT INTO `sys_dict_data` VALUES (32, 3, '随机', '3', 'busi_check_type', '', 'warning', 'N', '0', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-23 18:58:36', '随机');
INSERT INTO `sys_dict_data` VALUES (33, 1, '非实时', '1', 'busi_realtime_type', '非实时', 'primary', 'Y', '0', 'admin', '2021-01-27 09:20:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 2, '实时', '2', 'busi_realtime_type', NULL, 'warning', 'Y', '0', 'admin', '2021-01-27 09:21:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 1, '等于', '1', 'busi_condition_items', '', 'primary', 'Y', '0', 'admin', '2021-01-27 09:23:22', 'admin', '2021-01-29 08:28:21', '');
INSERT INTO `sys_dict_data` VALUES (36, 2, '大于', '2', 'busi_condition_items', '', 'success', 'Y', '0', 'admin', '2021-01-27 09:23:44', 'admin', '2021-01-29 08:28:31', '');
INSERT INTO `sys_dict_data` VALUES (37, 3, '小于', '3', 'busi_condition_items', '3', 'success', 'Y', '0', 'admin', '2021-01-27 09:24:15', 'admin', '2021-01-29 08:28:38', '');
INSERT INTO `sys_dict_data` VALUES (39, 2, '禁用', '2', 'busi_delete_flag', '', 'warning', 'Y', '0', 'admin', '2021-01-27 10:50:00', 'admin', '2021-01-27 10:50:20', '');
INSERT INTO `sys_dict_data` VALUES (40, 1, '正常', '1', 'busi_delete_flag', '1', 'info', 'Y', '0', 'admin', '2021-01-27 10:50:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 3, '删除', '3', 'busi_delete_flag', '3', 'danger', 'Y', '0', 'admin', '2021-01-27 10:50:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (42, 5, '大于等于', '5', 'busi_condition_items', '2', 'success', 'Y', '0', 'admin', '2021-01-29 08:29:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (43, 4, '不等于', '4', 'busi_condition_items', '4', 'warning', 'Y', '0', 'admin', '2021-01-29 08:29:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (44, 6, '小于等于', '6', 'busi_condition_items', '6', 'success', 'Y', '0', 'admin', '2021-01-29 08:29:47', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '检测手段', 'busi_check_type', '0', 'admin', '2021-01-06 00:00:00', 'admin', '2021-01-27 09:26:01', '');
INSERT INTO `sys_dict_type` VALUES (12, '实时性要求', 'busi_realtime_type', '0', 'admin', '2021-01-27 09:19:21', 'admin', '2021-01-27 09:26:09', '设备检查的实时性要求');
INSERT INTO `sys_dict_type` VALUES (13, '条件判断', 'busi_condition_items', '0', 'admin', '2021-01-27 09:22:59', 'admin', '2021-01-29 08:28:06', '计算阈值的表达式');
INSERT INTO `sys_dict_type` VALUES (14, '删除标志', 'busi_delete_flag', '0', 'admin', '2021-01-27 10:49:27', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '1', '1', '1', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-26 13:03:32', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'jt\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'jt\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_job` VALUES (4, '测试', 'DEFAULT', 'ryTask.ryWorkDetailParams', '0/15 * * * * ?', '1', '1', '1', 'admin', '2021-01-26 12:56:14', 'admin', '2021-01-26 15:28:42', '');
INSERT INTO `sys_job` VALUES (5, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '0 0 1 * * ?', '1', '1', '0', 'admin', '2021-01-29 21:54:20', 'admin', '2021-01-30 20:05:51', '日报生成示例代码');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '日报生成 总共耗时：112毫秒', '0', '', '2021-01-30 20:03:30');
INSERT INTO `sys_job_log` VALUES (2, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '日报生成 总共耗时：35毫秒', '0', '', '2021-01-30 20:04:00');
INSERT INTO `sys_job_log` VALUES (3, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '日报生成 总共耗时：55毫秒', '0', '', '2021-01-30 20:04:30');
INSERT INTO `sys_job_log` VALUES (4, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '日报生成 总共耗时：197毫秒', '0', '', '2021-01-30 20:05:00');
INSERT INTO `sys_job_log` VALUES (5, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '日报生成 总共耗时：25毫秒', '0', '', '2021-01-30 20:05:30');
INSERT INTO `sys_job_log` VALUES (6, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '日报生成 总共耗时：63毫秒', '0', '', '2021-01-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (7, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '日报生成 总共耗时：16毫秒', '0', '', '2021-02-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (8, '日报生成', 'DEFAULT', 'RyTaskDay.ryReportDay()', '日报生成 总共耗时：16毫秒', '0', '', '2021-02-02 01:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'test', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2021-02-02 17:02:18');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-02 17:07:18');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2021-02-02 17:07:26');
INSERT INTO `sys_logininfor` VALUES (4, 'test', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-02 17:07:35');
INSERT INTO `sys_logininfor` VALUES (5, 'test', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2021-02-02 17:09:26');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-02 17:09:27');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2021-02-02 17:10:52');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-02 17:10:54');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2021-02-02 17:13:05');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2021-02-02 17:13:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2160 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 5, '#', 'menuItem', 'M', '0', '', 'fa fa-gear', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:32:52', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 8, '#', 'menuItem', 'M', '0', '', 'fa fa-video-camera', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:32:42', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 9, '#', 'menuItem', 'M', '0', '', 'fa fa-bars', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:31:51', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '统计分析', 0, 4, '#', 'menuBlank', 'M', '0', '', 'fa fa-calculator', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 20:55:31', '吉想官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', 'fa fa-user-o', 'admin', '2021-01-06 10:51:22', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-01-06 10:51:22', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-01-06 10:51:22', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 2002, 1, '/system/dept', 'menuItem', 'C', '0', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:29:25', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 2002, 2, '/system/post', 'menuItem', 'C', '0', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-01-06 10:51:22', 'admin', '2021-02-02 17:11:33', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 3, 6, '/system/dict', 'menuItem', 'C', '0', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:33:43', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 3, 7, '/system/config', 'menuItem', 'C', '0', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:34:03', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-01-06 10:51:22', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 2, 9, '#', 'menuItem', 'M', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 20:57:15', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-01-06 10:51:22', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-01-06 10:51:22', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 3, 3, '/monitor/data', 'menuItem', 'C', '0', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:35:37', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 3, 3, '/monitor/server', 'menuItem', 'C', '0', 'monitor:server:view', 'fa fa-server', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:35:52', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-01-06 10:51:22', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', 'fa fa-code', 'admin', '2021-01-06 10:51:22', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-01-06 10:51:22', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 3, 1, '/monitor/operlog', 'menuItem', 'C', '0', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 20:56:46', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 2, 2, '/monitor/logininfor', 'menuItem', 'C', '0', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 20:56:29', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2021-01-06 10:51:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '设备设定', 0, 2, '#', 'menuItem', 'M', '0', '', 'fa fa-asl-interpreting', 'admin', '2021-01-06 14:09:10', 'admin', '2021-01-23 19:02:51', '');
INSERT INTO `sys_menu` VALUES (2002, '基本信息', 0, 1, '#', 'menuItem', 'M', '0', NULL, 'fa fa-institution', 'admin', '2021-01-11 16:28:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '日常报表', 0, 3, '#', 'menuItem', 'M', '0', '', 'fa fa-group', 'admin', '2021-01-11 16:32:28', 'admin', '2021-01-23 19:03:31', '');
INSERT INTO `sys_menu` VALUES (2106, '计量单位', 2002, 3, '/business/unit', 'menuItem', 'C', '0', 'business:unit:view', '#', 'admin', '2021-01-27 17:05:24', 'admin', '2021-02-02 17:11:47', '计量单位菜单');
INSERT INTO `sys_menu` VALUES (2107, '计量单位查询', 2106, 1, '#', '', 'F', '0', 'business:unit:list', '#', 'admin', '2021-01-27 17:05:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '计量单位新增', 2106, 2, '#', '', 'F', '0', 'business:unit:add', '#', 'admin', '2021-01-27 17:05:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '计量单位修改', 2106, 3, '#', '', 'F', '0', 'business:unit:edit', '#', 'admin', '2021-01-27 17:05:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '计量单位删除', 2106, 4, '#', '', 'F', '0', 'business:unit:remove', '#', 'admin', '2021-01-27 17:05:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '计量单位导出', 2106, 5, '#', '', 'F', '0', 'business:unit:export', '#', 'admin', '2021-01-27 17:05:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2112, '备件信息', 2002, 5, '/business/part', 'menuItem', 'C', '0', 'business:part:view', '#', 'admin', '2021-01-27 17:31:08', 'admin', '2021-02-02 17:12:21', '备件信息菜单');
INSERT INTO `sys_menu` VALUES (2113, '备件信息查询', 2112, 1, '#', '', 'F', '0', 'business:part:list', '#', 'admin', '2021-01-27 17:31:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '备件信息新增', 2112, 2, '#', '', 'F', '0', 'business:part:add', '#', 'admin', '2021-01-27 17:31:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '备件信息修改', 2112, 3, '#', '', 'F', '0', 'business:part:edit', '#', 'admin', '2021-01-27 17:31:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '备件信息删除', 2112, 4, '#', '', 'F', '0', 'business:part:remove', '#', 'admin', '2021-01-27 17:31:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '备件信息导出', 2112, 5, '#', '', 'F', '0', 'business:part:export', '#', 'admin', '2021-01-27 17:31:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2124, '位置信息', 2002, 4, '/business/address', 'menuItem', 'C', '0', 'business:address:view', '#', 'admin', '2021-01-28 07:50:57', 'admin', '2021-02-02 17:11:56', '设备位置的信息菜单');
INSERT INTO `sys_menu` VALUES (2125, '位置信息查询', 2124, 1, '#', '', 'F', '0', 'business:address:list', '#', 'admin', '2021-01-28 07:50:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '位置信息新增', 2124, 2, '#', '', 'F', '0', 'business:address:add', '#', 'admin', '2021-01-28 07:50:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, '位置信息修改', 2124, 3, '#', '', 'F', '0', 'business:address:edit', '#', 'admin', '2021-01-28 07:50:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2128, '位置信息删除', 2124, 4, '#', '', 'F', '0', 'business:address:remove', '#', 'admin', '2021-01-28 07:50:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2129, '位置信息导出', 2124, 5, '#', '', 'F', '0', 'business:address:export', '#', 'admin', '2021-01-28 07:50:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2130, '检查点信息', 2002, 6, '/business/checkPoints', 'menuItem', 'C', '0', 'business:checkPoints:view', '#', 'admin', '2021-01-28 08:02:41', 'admin', '2021-02-02 17:12:31', '检查点信息菜单');
INSERT INTO `sys_menu` VALUES (2131, '检查点信息查询', 2130, 1, '#', '', 'F', '0', 'business:checkPoints:list', '#', 'admin', '2021-01-28 08:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2132, '检查点信息新增', 2130, 2, '#', '', 'F', '0', 'business:checkPoints:add', '#', 'admin', '2021-01-28 08:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, '检查点信息修改', 2130, 3, '#', '', 'F', '0', 'business:checkPoints:edit', '#', 'admin', '2021-01-28 08:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '检查点信息删除', 2130, 4, '#', '', 'F', '0', 'business:checkPoints:remove', '#', 'admin', '2021-01-28 08:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '检查点信息导出', 2130, 5, '#', '', 'F', '0', 'business:checkPoints:export', '#', 'admin', '2021-01-28 08:02:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '检查点设置', 2000, 2, '/business/checkItems', 'menuItem', 'C', '0', 'business:checkItems:view', '#', 'admin', '2021-01-28 18:56:32', 'admin', '2021-02-02 17:12:45', '检查设置菜单');
INSERT INTO `sys_menu` VALUES (2137, '检查点设置查询', 2136, 1, '#', '', 'F', '0', 'business:checkItems:list', '#', 'admin', '2021-01-28 18:56:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2138, '检查点设置新增', 2136, 2, '#', '', 'F', '0', 'business:checkItems:add', '#', 'admin', '2021-01-28 18:56:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2139, '检查点设置修改', 2136, 3, '#', '', 'F', '0', 'business:checkItems:edit', '#', 'admin', '2021-01-28 18:56:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2140, '检查点设置删除', 2136, 4, '#', '', 'F', '0', 'business:checkItems:remove', '#', 'admin', '2021-01-28 18:56:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '检查点设置导出', 2136, 5, '#', '', 'F', '0', 'business:checkItems:export', '#', 'admin', '2021-01-28 18:56:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2142, '日报表', 2003, 1, '/business/reportDay', '', 'C', '0', 'business:reportDay:view', '#', 'admin', '2021-01-29 14:44:09', '', NULL, '日报表菜单');
INSERT INTO `sys_menu` VALUES (2143, '日报表查询', 2142, 1, '#', '', 'F', '0', 'business:reportDay:list', '#', 'admin', '2021-01-29 14:44:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2144, '日报表新增', 2142, 2, '#', '', 'F', '0', 'business:reportDay:add', '#', 'admin', '2021-01-29 14:44:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2145, '日报表修改', 2142, 3, '#', '', 'F', '0', 'business:reportDay:edit', '#', 'admin', '2021-01-29 14:44:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2146, '日报表删除', 2142, 4, '#', '', 'F', '0', 'business:reportDay:remove', '#', 'admin', '2021-01-29 14:44:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2147, '日报表导出', 2142, 5, '#', '', 'F', '0', 'business:reportDay:export', '#', 'admin', '2021-01-29 14:44:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2148, '测试', 3, 1, '/business/Htest', '', 'C', '0', 'business:Htest:view', '#', 'admin', '2021-01-30 08:28:33', '', NULL, '测试菜单');
INSERT INTO `sys_menu` VALUES (2149, '测试查询', 2148, 1, '#', '', 'F', '0', 'business:Htest:list', '#', 'admin', '2021-01-30 08:28:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2150, '测试新增', 2148, 2, '#', '', 'F', '0', 'business:Htest:add', '#', 'admin', '2021-01-30 08:28:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2151, '测试修改', 2148, 3, '#', '', 'F', '0', 'business:Htest:edit', '#', 'admin', '2021-01-30 08:28:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2152, '测试删除', 2148, 4, '#', '', 'F', '0', 'business:Htest:remove', '#', 'admin', '2021-01-30 08:28:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2153, '测试导出', 2148, 5, '#', '', 'F', '0', 'business:Htest:export', '#', 'admin', '2021-01-30 08:28:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2154, '检查点备件对应', 2000, 1, '/business/pointPartMap', '', 'C', '0', 'business:pointPartMap:view', '#', 'admin', '2021-01-30 15:29:08', '', NULL, '检查点备件对应菜单');
INSERT INTO `sys_menu` VALUES (2155, '检查点备件对应查询', 2154, 1, '#', '', 'F', '0', 'business:pointPartMap:list', '#', 'admin', '2021-01-30 15:29:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2156, '检查点备件对应新增', 2154, 2, '#', '', 'F', '0', 'business:pointPartMap:add', '#', 'admin', '2021-01-30 15:29:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2157, '检查点备件对应修改', 2154, 3, '#', '', 'F', '0', 'business:pointPartMap:edit', '#', 'admin', '2021-01-30 15:29:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2158, '检查点备件对应删除', 2154, 4, '#', '', 'F', '0', 'business:pointPartMap:remove', '#', 'admin', '2021-01-30 15:29:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2159, '检查点备件对应导出', 2154, 5, '#', '', 'F', '0', 'business:pointPartMap:export', '#', 'admin', '2021-01-30 15:29:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '定时任务', 2, 'com.jeethink.project.monitor.job.controller.JobController.editSave()', 'POST', 1, 'admin', '全厂', '/monitor/job/edit', '101.243.161.65', 'XX XX', '{\"jobId\":[\"5\"],\"jobName\":[\"日报生成\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"RyTaskDay.ryReportDay()\"],\"cronExpression\":[\"0 0 1 * * ?\"],\"misfirePolicy\":[\"1\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"日报生成示例代码\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-01-30 20:05:43');
INSERT INTO `sys_oper_log` VALUES (2, '定时任务', 2, 'com.jeethink.project.monitor.job.controller.JobController.changeStatus()', 'POST', 1, 'admin', '全厂', '/monitor/job/changeStatus', '101.243.161.65', 'XX XX', '{\"jobId\":[\"5\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-01-30 20:05:48');
INSERT INTO `sys_oper_log` VALUES (3, '定时任务', 2, 'com.jeethink.project.monitor.job.controller.JobController.changeStatus()', 'POST', 1, 'admin', '全厂', '/monitor/job/changeStatus', '101.243.161.65', 'XX XX', '{\"jobId\":[\"5\"],\"jobGroup\":[\"DEFAULT\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-01-30 20:05:51');
INSERT INTO `sys_oper_log` VALUES (4, '用户管理', 3, 'com.jeethink.project.system.user.controller.UserController.remove()', 'POST', 1, 'test', '维修车间', '/system/user/remove', '101.243.161.65', 'XX XX', '{\"ids\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-01-30 20:14:47');
INSERT INTO `sys_oper_log` VALUES (5, '检查项设置', 2, 'com.jeethink.project.business.checkItems.controller.CheckItemsController.editSave()', 'POST', 1, 'admin', '全厂', '/business/checkItems/edit', '101.243.161.65', 'XX XX', '{\"checkCode\":[\"5\"],\"address\":[\"\"],\"checkName\":[\"\"],\"realtimeType\":[\"1\"],\"checkType\":[\"2\"],\"status\":[\"0\"],\"computLimit\":[\"2\"],\"maxValue\":[\"2.0000\"],\"orderNum\":[\"2\"],\"startDate\":[\"2021-01-01\"],\"endDate\":[\"2021-04-16\"],\"comment\":[\"测试\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-01 14:39:49');
INSERT INTO `sys_oper_log` VALUES (6, '检查项设置', 2, 'com.jeethink.project.business.checkItems.controller.CheckItemsController.editSave()', 'POST', 1, 'admin', '全厂', '/business/checkItems/edit', '101.243.161.65', 'XX XX', '{\"checkCode\":[\"4\"],\"address\":[\"\"],\"checkName\":[\"\"],\"realtimeType\":[\"1\"],\"checkType\":[\"2\"],\"status\":[\"0\"],\"computLimit\":[\"5\"],\"maxValue\":[\"1.0000\"],\"orderNum\":[\"1\"],\"startDate\":[\"2021-01-01\"],\"endDate\":[\"2021-03-31\"],\"comment\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-01 14:40:07');
INSERT INTO `sys_oper_log` VALUES (7, '检查项设置', 2, 'com.jeethink.project.business.checkItems.controller.CheckItemsController.editSave()', 'POST', 1, 'admin', '全厂', '/business/checkItems/edit', '101.243.161.65', 'XX XX', '{\"checkCode\":[\"4\"],\"address\":[\"电解车间一系列\"],\"checkName\":[\"\"],\"realtimeType\":[\"1\"],\"checkType\":[\"2\"],\"status\":[\"0\"],\"computLimit\":[\"5\"],\"maxValue\":[\"1.0000\"],\"orderNum\":[\"1\"],\"startDate\":[\"2021-01-01\"],\"endDate\":[\"2021-03-31\"],\"comment\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 07:58:57');
INSERT INTO `sys_oper_log` VALUES (8, '检查项设置', 2, 'com.jeethink.project.business.checkItems.controller.CheckItemsController.editSave()', 'POST', 1, 'admin', '全厂', '/business/checkItems/edit', '101.243.161.65', 'XX XX', '{\"checkCode\":[\"5\"],\"address\":[\"维修车间\"],\"checkName\":[\"打壳机上限位\"],\"realtimeType\":[\"1\"],\"checkType\":[\"2\"],\"status\":[\"0\"],\"computLimit\":[\"2\"],\"maxValue\":[\"2.0000\"],\"orderNum\":[\"2\"],\"startDate\":[\"2021-01-01\"],\"endDate\":[\"2021-04-16\"],\"comment\":[\"测试\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 07:59:09');
INSERT INTO `sys_oper_log` VALUES (9, '检查项设置', 2, 'com.jeethink.project.business.checkItems.controller.CheckItemsController.editSave()', 'POST', 1, 'admin', '全厂', '/business/checkItems/edit', '101.243.161.65', 'XX XX', '{\"checkCode\":[\"6\"],\"address\":[\"\"],\"checkName\":[\"\"],\"realtimeType\":[\"1\"],\"checkType\":[\"1\"],\"status\":[\"0\"],\"computLimit\":[\"2\"],\"maxValue\":[\"3.0000\"],\"orderNum\":[\"3\"],\"startDate\":[\"2021-01-06\"],\"endDate\":[\"2021-03-25\"],\"comment\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 07:59:26');
INSERT INTO `sys_oper_log` VALUES (10, '登录日志', 9, 'com.jeethink.project.monitor.logininfor.controller.LogininforController.clean()', 'POST', 1, 'test', '维修车间', '/monitor/logininfor/clean', '101.243.161.65', 'XX XX', NULL, '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:02:14');
INSERT INTO `sys_oper_log` VALUES (11, '用户管理', 3, 'com.jeethink.project.system.user.controller.UserController.remove()', 'POST', 1, 'test', '维修车间', '/system/user/remove', '101.243.161.65', 'XX XX', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:07:47');
INSERT INTO `sys_oper_log` VALUES (12, '重置密码', 2, 'com.jeethink.project.system.user.controller.UserController.resetPwdSave()', 'POST', 1, 'test', '维修车间', '/system/user/resetPwd', '101.243.161.65', 'XX XX', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', 'null', 1, '不允许操作超级管理员用户', '2021-02-02 17:08:10');
INSERT INTO `sys_oper_log` VALUES (13, '重置密码', 2, 'com.jeethink.project.system.user.controller.UserController.resetPwdSave()', 'POST', 1, 'test', '维修车间', '/system/user/resetPwd', '101.243.161.65', 'XX XX', '{\"userId\":[\"9\"],\"loginName\":[\"zhanglihui\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:08:34');
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2106\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"计量单位\"],\"url\":[\"/business/unit\"],\"target\":[\"menuItem\"],\"perms\":[\"business:unit:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:09:55');
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2124\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"位置信息\"],\"url\":[\"/business/address\"],\"target\":[\"menuItem\"],\"perms\":[\"business:address:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:10:09');
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2112\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"备件信息\"],\"url\":[\"/business/part\"],\"target\":[\"menuItem\"],\"perms\":[\"business:part:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:10:34');
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2130\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"检查点信息\"],\"url\":[\"/business/checkPoints\"],\"target\":[\"menuItem\"],\"perms\":[\"business:checkPoints:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:10:48');
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"104\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:11:33');
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2106\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"计量单位\"],\"url\":[\"/business/unit\"],\"target\":[\"menuItem\"],\"perms\":[\"business:unit:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:11:47');
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2124\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"位置信息\"],\"url\":[\"/business/address\"],\"target\":[\"menuItem\"],\"perms\":[\"business:address:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:11:56');
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2112\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"备件信息\"],\"url\":[\"/business/part\"],\"target\":[\"menuItem\"],\"perms\":[\"business:part:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:12:21');
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2130\"],\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"检查点信息\"],\"url\":[\"/business/checkPoints\"],\"target\":[\"menuItem\"],\"perms\":[\"business:checkPoints:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:12:31');
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 2, 'com.jeethink.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '全厂', '/system/menu/edit', '101.243.161.65', 'XX XX', '{\"menuId\":[\"2136\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"检查点设置\"],\"url\":[\"/business/checkItems\"],\"target\":[\"menuItem\"],\"perms\":[\"business:checkItems:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2021-02-02 17:12:45');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'CEO', '董事长', 1, '0', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:23:32', '');
INSERT INTO `sys_post` VALUES (2, 'Manager', '生产厂长', 2, '0', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:23:51', '');
INSERT INTO `sys_post` VALUES (3, 'HR', '人力资源', 3, '0', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:24:07', '');
INSERT INTO `sys_post` VALUES (4, 'Finance', '财务人员', 4, '0', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-11 16:23:19', '');
INSERT INTO `sys_post` VALUES (5, 'Skiller', '技术人员', 5, '0', 'admin', '2021-01-11 16:24:42', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (6, 'Worker', '工人', 6, '0', 'admin', '2021-01-11 16:24:59', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (7, 'Other', '其他', 7, '0', 'admin', '2021-01-11 16:25:15', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-01-06 10:51:22', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 3, '2', '0', '0', 'admin', '2021-01-06 10:51:22', 'admin', '2021-01-29 10:24:32', '普通角色');
INSERT INTO `sys_role` VALUES (100, '系统管理员', 'system', 2, '1', '0', '0', 'admin', '2021-01-11 16:04:39', 'admin', '2021-01-30 18:37:43', '厂家系统管理员');
INSERT INTO `sys_role` VALUES (101, '访客', 'guest', 4, '1', '0', '0', 'admin', '2021-01-11 16:25:55', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (102, '其他', 'other', 5, '1', '0', '0', 'admin', '2021-01-11 16:26:14', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2106);
INSERT INTO `sys_role_menu` VALUES (2, 2107);
INSERT INTO `sys_role_menu` VALUES (2, 2108);
INSERT INTO `sys_role_menu` VALUES (2, 2109);
INSERT INTO `sys_role_menu` VALUES (2, 2110);
INSERT INTO `sys_role_menu` VALUES (2, 2111);
INSERT INTO `sys_role_menu` VALUES (2, 2112);
INSERT INTO `sys_role_menu` VALUES (2, 2113);
INSERT INTO `sys_role_menu` VALUES (2, 2114);
INSERT INTO `sys_role_menu` VALUES (2, 2115);
INSERT INTO `sys_role_menu` VALUES (2, 2116);
INSERT INTO `sys_role_menu` VALUES (2, 2117);
INSERT INTO `sys_role_menu` VALUES (2, 2124);
INSERT INTO `sys_role_menu` VALUES (2, 2125);
INSERT INTO `sys_role_menu` VALUES (2, 2126);
INSERT INTO `sys_role_menu` VALUES (2, 2127);
INSERT INTO `sys_role_menu` VALUES (2, 2128);
INSERT INTO `sys_role_menu` VALUES (2, 2129);
INSERT INTO `sys_role_menu` VALUES (2, 2130);
INSERT INTO `sys_role_menu` VALUES (2, 2131);
INSERT INTO `sys_role_menu` VALUES (2, 2132);
INSERT INTO `sys_role_menu` VALUES (2, 2133);
INSERT INTO `sys_role_menu` VALUES (2, 2134);
INSERT INTO `sys_role_menu` VALUES (2, 2135);
INSERT INTO `sys_role_menu` VALUES (2, 2136);
INSERT INTO `sys_role_menu` VALUES (2, 2137);
INSERT INTO `sys_role_menu` VALUES (2, 2138);
INSERT INTO `sys_role_menu` VALUES (2, 2139);
INSERT INTO `sys_role_menu` VALUES (2, 2140);
INSERT INTO `sys_role_menu` VALUES (2, 2141);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 4);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2106);
INSERT INTO `sys_role_menu` VALUES (100, 2107);
INSERT INTO `sys_role_menu` VALUES (100, 2108);
INSERT INTO `sys_role_menu` VALUES (100, 2109);
INSERT INTO `sys_role_menu` VALUES (100, 2110);
INSERT INTO `sys_role_menu` VALUES (100, 2111);
INSERT INTO `sys_role_menu` VALUES (100, 2112);
INSERT INTO `sys_role_menu` VALUES (100, 2113);
INSERT INTO `sys_role_menu` VALUES (100, 2114);
INSERT INTO `sys_role_menu` VALUES (100, 2115);
INSERT INTO `sys_role_menu` VALUES (100, 2116);
INSERT INTO `sys_role_menu` VALUES (100, 2117);
INSERT INTO `sys_role_menu` VALUES (100, 2124);
INSERT INTO `sys_role_menu` VALUES (100, 2125);
INSERT INTO `sys_role_menu` VALUES (100, 2126);
INSERT INTO `sys_role_menu` VALUES (100, 2127);
INSERT INTO `sys_role_menu` VALUES (100, 2128);
INSERT INTO `sys_role_menu` VALUES (100, 2129);
INSERT INTO `sys_role_menu` VALUES (100, 2130);
INSERT INTO `sys_role_menu` VALUES (100, 2131);
INSERT INTO `sys_role_menu` VALUES (100, 2132);
INSERT INTO `sys_role_menu` VALUES (100, 2133);
INSERT INTO `sys_role_menu` VALUES (100, 2134);
INSERT INTO `sys_role_menu` VALUES (100, 2135);
INSERT INTO `sys_role_menu` VALUES (100, 2136);
INSERT INTO `sys_role_menu` VALUES (100, 2137);
INSERT INTO `sys_role_menu` VALUES (100, 2138);
INSERT INTO `sys_role_menu` VALUES (100, 2139);
INSERT INTO `sys_role_menu` VALUES (100, 2140);
INSERT INTO `sys_role_menu` VALUES (100, 2141);
INSERT INTO `sys_role_menu` VALUES (100, 2142);
INSERT INTO `sys_role_menu` VALUES (100, 2143);
INSERT INTO `sys_role_menu` VALUES (100, 2144);
INSERT INTO `sys_role_menu` VALUES (100, 2145);
INSERT INTO `sys_role_menu` VALUES (100, 2146);
INSERT INTO `sys_role_menu` VALUES (100, 2147);
INSERT INTO `sys_role_menu` VALUES (100, 2154);
INSERT INTO `sys_role_menu` VALUES (100, 2155);
INSERT INTO `sys_role_menu` VALUES (100, 2156);
INSERT INTO `sys_role_menu` VALUES (100, 2157);
INSERT INTO `sys_role_menu` VALUES (100, 2158);
INSERT INTO `sys_role_menu` VALUES (100, 2159);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '超级管理员', '00', 'jluhan_bin@sina.com.cn', '18600508871', '0', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '101.243.161.65', '2021-02-02 17:13:07', '2021-01-06 10:51:22', 'admin', '2021-01-06 10:51:22', '', '2021-02-02 17:13:06', '管理员');
INSERT INTO `sys_user` VALUES (2, 1, 'hanbin', '系统管理员', '00', 'hanbing@ncut.edu.cn', '18600508871', '0', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', '2021-01-06 10:51:22', '2021-01-06 10:51:22', 'admin', '2021-01-06 10:51:22', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 6, 'baohongbin', '包红宾', '00', '', '13911198765', '0', '', '62e57bea85f8689be220c688e54f2e8d', 'e1edb2', '0', '0', '127.0.0.1', '2021-01-29 10:12:56', NULL, 'admin', '2021-01-29 10:12:27', '', '2021-01-29 10:12:56', '系统导入');
INSERT INTO `sys_user` VALUES (4, 6, 'chenhongyu', '陈宏宇', '00', '', '13911198763', '0', '', '4f43dd73a6865be935643ebec561216b', '12913b', '0', '0', '', NULL, NULL, 'admin', '2021-01-29 10:14:48', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (5, 28, 'jianghongguang', '姜洪广', '00', 'test@sina.com.cn', '13911198766', '0', '', 'e93cfe361f4ad503405a18a4abcd2a84', '301015', '0', '0', '', NULL, NULL, 'admin', '2021-01-29 10:15:37', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 29, 'liyingxin', '李迎新', '00', 'tes3t@sina.com.cn', '13911198768', '0', '', '0781f64d62fee04c142cb68b67597aa9', 'bab0a1', '0', '0', '', NULL, NULL, 'admin', '2021-01-29 10:16:23', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (7, 16, 'tianshuai', '田帅', '00', '', '13911198769', '0', '', 'd86039aa7a3028bd46615137b820783f', '21faad', '0', '0', '', NULL, NULL, 'admin', '2021-01-29 10:16:52', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (8, 18, 'weichigang', '魏迟刚', '00', '', '', '0', '', '757ca524869bfcce5eb06b00fbe7832b', '317737', '0', '0', '', NULL, NULL, 'admin', '2021-01-29 10:17:19', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (9, 6, 'zhanglihui', '张立辉', '00', '', '', '0', '', 'd829c6733998bd70398ae95b657654de', '549cee', '0', '0', '127.0.0.1', '2021-01-29 10:24:58', NULL, 'admin', '2021-01-29 10:17:45', '', '2021-02-02 17:08:34', NULL);
INSERT INTO `sys_user` VALUES (10, 1, 'wangxh', '王小红', '00', '', '13911198760', '1', '', '1e06c1d015938ed0f83c895b967e14ef', '4e9d55', '0', '2', '127.0.0.1', '2021-01-29 10:25:11', NULL, 'admin', '2021-01-29 10:18:44', 'admin', '2021-01-29 10:25:11', '');
INSERT INTO `sys_user` VALUES (11, 3, 'test', '测试用户', '00', '', '', '0', '', 'b5cfcea70863b4b6da0bdadb64f1976c', 'bece46', '0', '0', '101.243.161.65', '2021-02-02 17:07:36', NULL, 'admin', '2021-01-29 20:17:05', 'admin', '2021-02-02 17:07:35', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('595ef0e6-f986-4f09-9f0e-619acee2c9a1', 'admin', '全厂', '101.243.161.65', 'XX XX', 'Chrome', 'Windows 10', 'on_line', '2021-02-02 17:13:05', '2021-02-02 17:25:03', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (3, 5);
INSERT INTO `sys_user_post` VALUES (4, 5);
INSERT INTO `sys_user_post` VALUES (5, 2);
INSERT INTO `sys_user_post` VALUES (6, 5);
INSERT INTO `sys_user_post` VALUES (7, 6);
INSERT INTO `sys_user_post` VALUES (8, 3);
INSERT INTO `sys_user_post` VALUES (9, 5);
INSERT INTO `sys_user_post` VALUES (10, 2);
INSERT INTO `sys_user_post` VALUES (11, 5);
INSERT INTO `sys_user_post` VALUES (100, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (5, 2);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (7, 2);
INSERT INTO `sys_user_role` VALUES (8, 2);
INSERT INTO `sys_user_role` VALUES (9, 2);
INSERT INTO `sys_user_role` VALUES (10, 100);
INSERT INTO `sys_user_role` VALUES (11, 100);
INSERT INTO `sys_user_role` VALUES (100, 100);

SET FOREIGN_KEY_CHECKS = 1;
