/*
 Navicat Premium Data Transfer

 Source Server         : Z本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 20/09/2019 17:59:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jack_admin
-- ----------------------------
DROP TABLE IF EXISTS `jack_admin`;
CREATE TABLE `jack_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `salt` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码盐',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `join_ip` int(11) NOT NULL COMMENT '加入IP',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像地址 存储云端',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：1正常，0禁用，2删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userName`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_admin
-- ----------------------------
INSERT INTO `jack_admin` VALUES (1, 'admin', '075eaec83636846f51c152f29b98a2fd', 's4f3', '张世杰', 1, '', '2019-08-02 17:01:11', '2019-09-11 21:06:01', 0);
INSERT INTO `jack_admin` VALUES (22, 'zhangshijie', 'f1c5231535e1df5c4004b6d3cf2070a4', '7dmn', '张世杰12311', 2130706433, '', '2019-09-11 20:46:37', '2019-09-11 21:10:24', 1);
INSERT INTO `jack_admin` VALUES (23, 'lisi', '4a1994c589c97fba26d4d633f0a00ddc', 'bovN', '李四', 2130706433, '', '2019-09-11 20:47:48', '2019-09-11 20:47:48', 1);
INSERT INTO `jack_admin` VALUES (24, 'zhangdaxian', 'b442ea8cecb99366e56a7cea8339394a', 'U17Y', '张大仙', 2130706433, '', '2019-09-11 20:48:46', '2019-09-11 20:48:46', 1);
INSERT INTO `jack_admin` VALUES (25, 'admin', '36fa278687f249d4f3132343b6fc9c6a', '8FMb', '张世杰', 2130706433, '', '2019-09-11 21:06:32', '2019-09-11 21:06:32', 1);

-- ----------------------------
-- Table structure for jack_album
-- ----------------------------
DROP TABLE IF EXISTS `jack_album`;
CREATE TABLE `jack_album`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '相册ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '相册名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '相册简介',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面图',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启',
  `music` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '音乐路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 488 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_album
-- ----------------------------
INSERT INTO `jack_album` VALUES (1, '1', '哦吼日常', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (2, '2', '2', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (3, '3', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (4, '4', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (5, '5', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (6, '6', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (7, '7', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (8, '8', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (9, '9', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (10, '10', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (11, '11', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (12, '12', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (13, '13', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (14, '14', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (15, '15', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (16, '16', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (17, '17', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (18, '18', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (19, '19', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (20, '20', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (21, '21', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (22, '22', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (23, '23', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (24, '24', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (25, '25', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (26, '26', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (27, '27', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (28, '28', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (29, '29', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (30, '30', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (31, '31', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (32, '32', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (33, '33', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (34, '34', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (35, '35', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (36, '36', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (37, '37', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (38, '38', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (39, '39', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (40, '40', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (41, '41', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (42, '42', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (43, '43', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (44, '44', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (45, '45', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (46, '46', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (47, '47', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (48, '48', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (49, '49', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (50, '50', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (51, '51', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (52, '52', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (53, '53', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (54, '54', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (55, '55', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (56, '56', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (57, '57', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (58, '58', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (59, '59', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (60, '60', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (61, '61', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (62, '62', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (63, '63', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (64, '64', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (65, '65', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (66, '66', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (67, '67', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (68, '68', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (69, '69', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (70, '70', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (71, '71', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (72, '72', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (73, '73', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (74, '74', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (75, '75', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (76, '76', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (77, '77', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (78, '78', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (79, '79', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (80, '80', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (81, '81', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (82, '82', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (83, '83', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (84, '84', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (85, '85', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (86, '86', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (87, '87', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (88, '88', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (89, '89', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (90, '90', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (91, '91', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (92, '92', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (93, '93', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (94, '94', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (95, '95', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (96, '96', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (97, '97', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (98, '98', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (99, '99', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (100, '100', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (101, '101', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (102, '102', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (103, '103', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (104, '104', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (105, '105', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (106, '106', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (107, '107', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (108, '108', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (109, '109', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (110, '110', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (111, '111', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (112, '112', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (113, '113', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (114, '114', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (115, '115', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (116, '116', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (117, '117', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (118, '118', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (119, '119', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (120, '120', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (121, '121', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (122, '122', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (123, '123', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (124, '124', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (125, '125', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (126, '126', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (127, '127', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (128, '128', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (129, '129', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (130, '130', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (131, '131', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (132, '132', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (133, '133', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (134, '134', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (135, '135', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (136, '136', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (137, '137', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (138, '138', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (139, '139', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (140, '140', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (141, '141', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (142, '142', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (143, '143', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (144, '144', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (145, '145', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (146, '146', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (147, '147', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (148, '148', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (149, '149', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (150, '150', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (151, '151', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (152, '152', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (153, '153', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (154, '154', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (155, '155', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (156, '156', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (157, '157', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (158, '158', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (159, '159', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (160, '160', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (161, '161', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (162, '162', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (163, '163', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (164, '164', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (165, '165', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (166, '166', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (167, '167', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (168, '168', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (169, '169', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (170, '170', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (171, '171', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (172, '172', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (173, '173', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (174, '174', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (175, '175', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (176, '176', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (177, '177', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (178, '178', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (179, '179', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (180, '180', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (181, '181', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (182, '182', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (183, '183', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (184, '184', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (185, '185', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (186, '186', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (187, '187', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (188, '188', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (189, '189', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (190, '190', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (191, '191', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (192, '192', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (193, '193', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (194, '194', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (195, '195', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (196, '196', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (197, '197', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (198, '198', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (199, '199', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (200, '200', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (201, '201', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (202, '202', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (203, '203', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (204, '204', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (205, '205', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (206, '206', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (207, '207', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (208, '208', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (209, '209', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (210, '210', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (211, '211', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (212, '212', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (213, '213', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (214, '214', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (215, '215', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (216, '216', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (217, '217', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (218, '218', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (219, '219', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (220, '220', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (221, '221', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (222, '222', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (223, '223', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (224, '224', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (225, '225', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (226, '226', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (227, '227', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (228, '228', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (229, '229', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (230, '230', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (231, '231', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (232, '232', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (233, '233', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (234, '234', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (235, '235', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (236, '236', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (237, '237', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (238, '238', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (239, '239', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (240, '240', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (241, '241', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (242, '242', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (243, '243', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (244, '244', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (245, '245', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (246, '246', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (247, '247', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (248, '248', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (249, '249', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (250, '250', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (251, '251', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (252, '252', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (253, '253', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (254, '254', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (255, '255', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (256, '256', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (257, '257', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (258, '258', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (259, '259', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (260, '260', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (261, '261', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (262, '262', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (263, '263', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (264, '264', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (265, '265', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (266, '266', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (267, '267', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (268, '268', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (269, '269', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (270, '270', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (271, '271', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (272, '272', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (273, '273', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (274, '274', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (275, '275', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (276, '276', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (277, '277', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (278, '278', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (279, '279', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (280, '280', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (281, '281', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (282, '282', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (283, '283', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (284, '284', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (285, '285', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (286, '286', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (287, '287', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (288, '288', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (289, '289', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (290, '290', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (291, '291', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (292, '292', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (293, '293', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (294, '294', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (295, '295', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (296, '296', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (297, '297', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (298, '298', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (299, '299', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (300, '300', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (301, '301', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (302, '302', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (303, '303', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (304, '304', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (305, '305', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (306, '306', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (307, '307', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (308, '308', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (309, '309', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (310, '310', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (311, '311', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (312, '312', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (313, '313', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (314, '314', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (315, '315', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (316, '316', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (317, '317', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (318, '318', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (319, '319', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (320, '320', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (321, '321', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (322, '322', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (323, '323', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (324, '324', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (325, '325', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (326, '326', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (327, '327', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (328, '328', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (329, '329', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (330, '330', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (331, '331', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (332, '332', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (333, '333', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (334, '334', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (335, '335', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (336, '336', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (337, '337', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (338, '338', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (339, '339', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (340, '340', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (341, '341', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (342, '342', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (343, '343', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (344, '344', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (345, '345', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (346, '346', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (347, '347', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (348, '348', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (349, '349', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (350, '350', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (351, '351', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (352, '352', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (353, '353', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (354, '354', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (355, '355', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (356, '356', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (357, '357', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (358, '358', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (359, '359', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (360, '360', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (361, '361', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (362, '362', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (363, '363', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (364, '364', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (365, '365', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (366, '366', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (367, '367', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (368, '368', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (369, '369', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (370, '370', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (371, '371', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (372, '372', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (373, '373', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (374, '374', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (375, '375', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (376, '376', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (377, '377', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (378, '378', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (379, '379', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (380, '380', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (381, '381', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (382, '382', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (383, '383', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (384, '384', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (385, '385', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (386, '386', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (387, '387', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (388, '388', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (389, '389', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (390, '390', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (391, '391', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (392, '392', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (393, '393', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (394, '394', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (395, '395', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (396, '396', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (397, '397', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (398, '398', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (399, '399', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (400, '400', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (401, '401', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (402, '402', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (403, '403', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (404, '404', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (405, '405', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (406, '406', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (407, '407', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (408, '408', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (409, '409', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (410, '410', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (411, '411', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (412, '412', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (413, '413', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (414, '414', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (415, '415', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (416, '416', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (417, '417', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (418, '418', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (419, '419', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (420, '420', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (421, '421', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (422, '422', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (423, '423', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (424, '424', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (425, '425', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (426, '426', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (427, '427', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (428, '428', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (429, '429', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (430, '430', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (431, '431', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (432, '432', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (433, '433', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (434, '434', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (435, '435', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (436, '436', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (437, '437', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (438, '438', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (439, '439', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (440, '440', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (441, '441', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (442, '442', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (443, '443', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (444, '444', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (445, '445', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (446, '446', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (447, '447', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (448, '448', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (449, '449', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (450, '450', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (451, '451', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (452, '452', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (453, '453', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (454, '454', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (455, '455', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (456, '456', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (457, '457', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (458, '458', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (459, '459', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (460, '460', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (461, '461', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (462, '462', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (463, '463', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (464, '464', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (465, '465', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (466, '466', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (467, '467', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (468, '468', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (469, '469', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (470, '470', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (471, '471', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (472, '472', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (473, '473', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (474, '474', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (475, '475', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (476, '476', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (477, '477', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (478, '478', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (479, '479', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (480, '480', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (481, '481', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (482, '482', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (483, '483', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (484, '484', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (485, '485', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (486, '486', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');
INSERT INTO `jack_album` VALUES (487, '487', '惊天地泣鬼神', 'upload\\album\\20190919\\1cfc4493ec49980df73034347c12b514.png', 1, 'upload\\album\\20190919\\46ef2318537409b7f3fe69438a57ade6.mp3', '2019-09-18 15:21:23', '2019-09-19 10:30:41');

-- ----------------------------
-- Table structure for jack_album_item
-- ----------------------------
DROP TABLE IF EXISTS `jack_album_item`;
CREATE TABLE `jack_album_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `albun_id` int(11) NOT NULL COMMENT '相册ID',
  `thumb_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '缩略图路径',
  `full_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始图路径',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_album_item
-- ----------------------------
INSERT INTO `jack_album_item` VALUES (22, 1, '', 'upload\\album\\20190919\\be94492fdb13bfb8c35dce471d9f3610.png', '');
INSERT INTO `jack_album_item` VALUES (23, 1, '', 'upload\\album\\20190919\\78fc1eeea439897a1813094057c2daa6.png', '');
INSERT INTO `jack_album_item` VALUES (24, 1, '', 'upload\\album\\20190919\\e4c2752c9ecc68f2315a8fbbbe7ffbda.png', '');

-- ----------------------------
-- Table structure for jack_group
-- ----------------------------
DROP TABLE IF EXISTS `jack_group`;
CREATE TABLE `jack_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_group
-- ----------------------------
INSERT INTO `jack_group` VALUES (1, 0, '超级管理组', '*', NULL, NULL, 1);

-- ----------------------------
-- Table structure for jack_menu
-- ----------------------------
DROP TABLE IF EXISTS `jack_menu`;
CREATE TABLE `jack_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url节点路径',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_menu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `order_key` tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `url`(`url`) USING BTREE COMMENT '权限索引'
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_menu
-- ----------------------------
INSERT INTO `jack_menu` VALUES (1, 0, 'admin', '管理员管理', 'fa fa-group', '', 1, '2019-07-31 20:45:48', '2019-08-02 12:34:27', 1, 1);
INSERT INTO `jack_menu` VALUES (2, 1, 'admin/index', '列表', 'fa fa-list', '', 1, '2019-07-31 20:46:33', '2019-08-02 16:41:24', 2, 1);
INSERT INTO `jack_menu` VALUES (3, 1, 'admin/add', '添加', 'fa fa-cog', '', 0, '2019-07-31 20:46:33', '2019-08-02 16:41:34', 3, 1);
INSERT INTO `jack_menu` VALUES (4, 1, 'admin/edit', '编辑', 'fa fa-edit', '', 0, '2019-07-31 20:46:33', '2019-08-02 16:41:36', 4, 1);
INSERT INTO `jack_menu` VALUES (5, 1, 'admin/del', '删除', 'fa fa-circle-o', '', 0, '2019-07-31 20:47:49', '2019-08-02 16:41:39', 5, 1);
INSERT INTO `jack_menu` VALUES (6, 0, 'foot', '页脚管理', 'fa fa-group', '', 1, '2019-07-31 20:45:48', '2019-08-02 16:36:49', 1, 1);
INSERT INTO `jack_menu` VALUES (7, 6, 'foot/index', '列表', 'fa fa-list', '', 0, '2019-07-31 20:46:33', '2019-08-02 16:36:51', 2, 1);
INSERT INTO `jack_menu` VALUES (8, 6, 'foot/add', '添加', 'fa fa-cog', '', 0, '2019-07-31 20:46:33', '2019-08-02 16:36:54', 3, 1);
INSERT INTO `jack_menu` VALUES (9, 6, 'foot/edit', '编辑', 'fa fa-edit', '', 0, '2019-07-31 20:46:33', '2019-08-02 16:36:57', 4, 1);
INSERT INTO `jack_menu` VALUES (10, 6, 'foot/del', '删除', 'fa fa-circle-o', '', 0, '2019-07-31 20:47:49', '2019-08-02 16:36:58', 5, 1);
INSERT INTO `jack_menu` VALUES (11, 0, 'album', '相册管理', 'fa fa-group', '', 1, '2019-07-31 20:45:48', '2019-09-11 21:28:44', 1, 1);
INSERT INTO `jack_menu` VALUES (12, 11, 'album/index', '列表', 'fa fa-list', '', 0, '2019-07-31 20:46:33', '2019-09-11 21:29:11', 2, 1);
INSERT INTO `jack_menu` VALUES (13, 11, 'album/add', '添加', 'fa fa-cog', '', 0, '2019-07-31 20:46:33', '2019-09-11 21:29:13', 3, 1);
INSERT INTO `jack_menu` VALUES (14, 11, 'album/edit', '编辑', 'fa fa-edit', '', 0, '2019-07-31 20:46:33', '2019-09-11 21:29:14', 4, 1);
INSERT INTO `jack_menu` VALUES (15, 11, 'album/del', '删除', 'fa fa-circle-o', '', 0, '2019-07-31 20:47:49', '2019-09-11 21:29:16', 5, 1);

-- ----------------------------
-- Table structure for tm_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `tm_auth_rule`;
CREATE TABLE `tm_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 505 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_auth_rule
-- ----------------------------
INSERT INTO `tm_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1554944270, 93, 'normal');
INSERT INTO `tm_auth_rule` VALUES (2, 'file', 0, 'general', '常规管理', 'fa fa-cogs', '', '', 1, 1497429920, 1531826051, 180, 'normal');
INSERT INTO `tm_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-list', '', 'Category tips', 0, 1497429920, 1529997080, 105, 'normal');
INSERT INTO `tm_auth_rule` VALUES (4, 'file', 415, 'addon', '插件管理', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1539226668, 124, 'normal');
INSERT INTO `tm_auth_rule` VALUES (5, 'file', 415, 'auth', '权限管理', 'fa fa-group', '', '', 1, 1497429920, 1531836322, 9, 'normal');
INSERT INTO `tm_auth_rule` VALUES (6, 'file', 2, 'general/config', '系统配置', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1531835361, 100, 'normal');
INSERT INTO `tm_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1531903366, 62, 'normal');
INSERT INTO `tm_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 0, 1497429920, 1530607395, 68, 'normal');
INSERT INTO `tm_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 36, 'normal');
INSERT INTO `tm_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 41, 'normal');
INSERT INTO `tm_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 45, 'normal');
INSERT INTO `tm_auth_rule` VALUES (12, 'file', 415, 'auth/rule', '后台菜单管理', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1531836257, 1, 'normal');
INSERT INTO `tm_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `tm_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `tm_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `tm_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `tm_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 35, 'normal');
INSERT INTO `tm_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 63, 'normal');
INSERT INTO `tm_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 64, 'normal');
INSERT INTO `tm_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 65, 'normal');
INSERT INTO `tm_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 66, 'normal');
INSERT INTO `tm_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 67, 'normal');
INSERT INTO `tm_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `tm_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `tm_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `tm_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `tm_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 60, 'normal');
INSERT INTO `tm_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 61, 'normal');
INSERT INTO `tm_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 69, 'normal');
INSERT INTO `tm_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 70, 'normal');
INSERT INTO `tm_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 71, 'normal');
INSERT INTO `tm_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 72, 'normal');
INSERT INTO `tm_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 73, 'normal');
INSERT INTO `tm_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 74, 'normal');
INSERT INTO `tm_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 25, 'normal');
INSERT INTO `tm_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 26, 'normal');
INSERT INTO `tm_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 27, 'normal');
INSERT INTO `tm_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `tm_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `tm_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 37, 'normal');
INSERT INTO `tm_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 38, 'normal');
INSERT INTO `tm_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 39, 'normal');
INSERT INTO `tm_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 40, 'normal');
INSERT INTO `tm_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 42, 'normal');
INSERT INTO `tm_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 43, 'normal');
INSERT INTO `tm_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 44, 'normal');
INSERT INTO `tm_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 46, 'normal');
INSERT INTO `tm_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 47, 'normal');
INSERT INTO `tm_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `tm_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `tm_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `tm_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `tm_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `tm_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 53, 'normal');
INSERT INTO `tm_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 104, 'normal');
INSERT INTO `tm_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 103, 'normal');
INSERT INTO `tm_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 102, 'normal');
INSERT INTO `tm_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 101, 'normal');
INSERT INTO `tm_auth_rule` VALUES (59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 100, 'normal');
INSERT INTO `tm_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 99, 'normal');
INSERT INTO `tm_auth_rule` VALUES (61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 98, 'normal');
INSERT INTO `tm_auth_rule` VALUES (62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 97, 'normal');
INSERT INTO `tm_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 96, 'normal');
INSERT INTO `tm_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 95, 'normal');
INSERT INTO `tm_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 94, 'normal');
INSERT INTO `tm_auth_rule` VALUES (66, 'file', 0, 'user', '会员管理', 'fa fa-list', '', '', 0, 1516374729, 1528168728, 111, 'hidden');
INSERT INTO `tm_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 92, 'normal');
INSERT INTO `tm_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 91, 'normal');
INSERT INTO `tm_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 90, 'normal');
INSERT INTO `tm_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 89, 'normal');
INSERT INTO `tm_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 88, 'normal');
INSERT INTO `tm_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 87, 'normal');
INSERT INTO `tm_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 86, 'normal');
INSERT INTO `tm_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 85, 'normal');
INSERT INTO `tm_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 84, 'normal');
INSERT INTO `tm_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 83, 'normal');
INSERT INTO `tm_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 82, 'normal');
INSERT INTO `tm_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 81, 'normal');
INSERT INTO `tm_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 80, 'normal');
INSERT INTO `tm_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 79, 'normal');
INSERT INTO `tm_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 78, 'normal');
INSERT INTO `tm_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 77, 'normal');
INSERT INTO `tm_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 76, 'normal');
INSERT INTO `tm_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 75, 'normal');
INSERT INTO `tm_auth_rule` VALUES (85, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', 1, 1527819532, 1533113890, 130, 'normal');
INSERT INTO `tm_auth_rule` VALUES (86, 'file', 85, 'command/index', '查看', 'fa fa-circle-o', '', '', 0, 1527819532, 1527819532, 3, 'normal');
INSERT INTO `tm_auth_rule` VALUES (87, 'file', 85, 'command/add', '添加', 'fa fa-circle-o', '', '', 0, 1527819532, 1527819532, 4, 'normal');
INSERT INTO `tm_auth_rule` VALUES (88, 'file', 85, 'command/detail', '详情', 'fa fa-circle-o', '', '', 0, 1527819532, 1527819532, 5, 'normal');
INSERT INTO `tm_auth_rule` VALUES (89, 'file', 85, 'command/execute', '运行', 'fa fa-circle-o', '', '', 0, 1527819532, 1527819532, 6, 'normal');
INSERT INTO `tm_auth_rule` VALUES (90, 'file', 85, 'command/del', '删除', 'fa fa-circle-o', '', '', 0, 1527819532, 1527819532, 7, 'normal');
INSERT INTO `tm_auth_rule` VALUES (91, 'file', 85, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1527819532, 1527819532, 8, 'normal');
INSERT INTO `tm_auth_rule` VALUES (181, 'file', 2, 'baidutongji', '网站统计', 'fa fa-bar-chart', '', '', 0, 1527848410, 1539150831, 5, 'normal');
INSERT INTO `tm_auth_rule` VALUES (182, 'file', 181, 'baidutongji/index', '网站列表', 'fa fa-circle-o', '', '', 0, 1527848410, 1527848410, 10, 'normal');
INSERT INTO `tm_auth_rule` VALUES (183, 'file', 181, 'baidutongji/detail', '网站详情', 'fa fa-circle-o', '', '', 0, 1527848410, 1527848410, 11, 'normal');
INSERT INTO `tm_auth_rule` VALUES (184, 'file', 0, 'usergame', '成绩管理', 'fa fa-list', '', '', 1, 1527919861, 1527926430, 30, 'normal');
INSERT INTO `tm_auth_rule` VALUES (185, 'file', 184, 'usergame/info', '比赛成绩主信息', 'fa fa-circle-o', '', '', 1, 1527919861, 1527926482, 13, 'normal');
INSERT INTO `tm_auth_rule` VALUES (186, 'file', 185, 'usergame/info/index', '查看', 'fa fa-circle-o', '', '', 0, 1527919861, 1527919861, 14, 'normal');
INSERT INTO `tm_auth_rule` VALUES (187, 'file', 185, 'usergame/info/add', '添加', 'fa fa-circle-o', '', '', 0, 1527919861, 1527919861, 15, 'normal');
INSERT INTO `tm_auth_rule` VALUES (188, 'file', 185, 'usergame/info/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1527919861, 1527919861, 16, 'normal');
INSERT INTO `tm_auth_rule` VALUES (189, 'file', 185, 'usergame/info/del', '删除', 'fa fa-circle-o', '', '', 0, 1527919861, 1527919861, 17, 'normal');
INSERT INTO `tm_auth_rule` VALUES (190, 'file', 185, 'usergame/info/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1527919861, 1527919861, 18, 'normal');
INSERT INTO `tm_auth_rule` VALUES (192, 'file', 413, 'clothing/sizes', '服装尺码管理', 'fa fa-circle-o', '', '', 1, 1527924770, 1531818720, 19, 'normal');
INSERT INTO `tm_auth_rule` VALUES (193, 'file', 192, 'clothing/sizes/index', '查看', 'fa fa-circle-o', '', '', 0, 1527924770, 1527924770, 20, 'normal');
INSERT INTO `tm_auth_rule` VALUES (194, 'file', 192, 'clothing/sizes/add', '添加', 'fa fa-circle-o', '', '', 0, 1527924771, 1527924771, 21, 'normal');
INSERT INTO `tm_auth_rule` VALUES (195, 'file', 192, 'clothing/sizes/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1527924771, 1527924771, 22, 'normal');
INSERT INTO `tm_auth_rule` VALUES (196, 'file', 192, 'clothing/sizes/del', '删除', 'fa fa-circle-o', '', '', 0, 1527924771, 1527924771, 23, 'normal');
INSERT INTO `tm_auth_rule` VALUES (197, 'file', 192, 'clothing/sizes/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1527924771, 1527924771, 24, 'normal');
INSERT INTO `tm_auth_rule` VALUES (199, 'file', 413, 'dictionary', '字典管理', 'fa fa-book', '', '', 1, 1527930658, 1531818735, 12, 'normal');
INSERT INTO `tm_auth_rule` VALUES (200, 'file', 199, 'dictionary/type', '字典类型管理', 'fa fa-circle-o\r', '', '', 1, 1527930658, 1527930658, 142, 'normal');
INSERT INTO `tm_auth_rule` VALUES (201, 'file', 200, 'dictionary/type/index', '查看', 'fa fa-circle-o', '', '', 0, 1527930659, 1527932688, 141, 'normal');
INSERT INTO `tm_auth_rule` VALUES (202, 'file', 200, 'dictionary/type/add', '添加', 'fa fa-circle-o', '', '', 0, 1527930659, 1527932688, 140, 'normal');
INSERT INTO `tm_auth_rule` VALUES (203, 'file', 200, 'dictionary/type/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1527930659, 1527932688, 139, 'normal');
INSERT INTO `tm_auth_rule` VALUES (204, 'file', 200, 'dictionary/type/del', '删除', 'fa fa-circle-o', '', '', 0, 1527930659, 1527932688, 138, 'normal');
INSERT INTO `tm_auth_rule` VALUES (205, 'file', 200, 'dictionary/type/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1527930659, 1527932688, 137, 'normal');
INSERT INTO `tm_auth_rule` VALUES (206, 'file', 199, 'dictionary/item', '字典类型条目管理', 'fa fa-circle-o\r', '', '', 1, 1527930714, 1527930714, 136, 'normal');
INSERT INTO `tm_auth_rule` VALUES (207, 'file', 206, 'dictionary/item/index', '查看', 'fa fa-circle-o', '', '', 0, 1527930714, 1527930714, 135, 'normal');
INSERT INTO `tm_auth_rule` VALUES (208, 'file', 206, 'dictionary/item/add', '添加', 'fa fa-circle-o', '', '', 0, 1527930714, 1527930714, 134, 'normal');
INSERT INTO `tm_auth_rule` VALUES (209, 'file', 206, 'dictionary/item/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1527930714, 1527930714, 133, 'normal');
INSERT INTO `tm_auth_rule` VALUES (210, 'file', 206, 'dictionary/item/del', '删除', 'fa fa-circle-o', '', '', 0, 1527930714, 1527930714, 132, 'normal');
INSERT INTO `tm_auth_rule` VALUES (211, 'file', 206, 'dictionary/item/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1527930714, 1527930714, 131, 'normal');
INSERT INTO `tm_auth_rule` VALUES (219, 'file', 2, 'foot', '网站页脚', 'fa fa-circle-o', '', '', 1, 1528077136, 1531835353, 11, 'normal');
INSERT INTO `tm_auth_rule` VALUES (220, 'file', 219, 'foot/index', '查看', 'fa fa-circle-o', '', '', 0, 1528077136, 1528077136, 129, 'normal');
INSERT INTO `tm_auth_rule` VALUES (221, 'file', 219, 'foot/add', '添加', 'fa fa-circle-o', '', '', 0, 1528077136, 1528077136, 128, 'normal');
INSERT INTO `tm_auth_rule` VALUES (222, 'file', 219, 'foot/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1528077136, 1528077136, 127, 'normal');
INSERT INTO `tm_auth_rule` VALUES (223, 'file', 219, 'foot/del', '删除', 'fa fa-circle-o', '', '', 0, 1528077136, 1528077136, 126, 'normal');
INSERT INTO `tm_auth_rule` VALUES (224, 'file', 219, 'foot/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1528077136, 1528077136, 125, 'normal');
INSERT INTO `tm_auth_rule` VALUES (231, 'file', 0, 'event', '资讯管理', 'fa fa-list', '', '', 0, 1528090594, 1530607217, 2, 'normal');
INSERT INTO `tm_auth_rule` VALUES (232, 'file', 231, 'event/information', '新闻资讯管理', 'fa fa-circle-o\r', '', '', 1, 1528090594, 1528090594, 123, 'normal');
INSERT INTO `tm_auth_rule` VALUES (233, 'file', 232, 'event/information/index', '查看', 'fa fa-circle-o', '', '', 0, 1528090594, 1528091698, 122, 'normal');
INSERT INTO `tm_auth_rule` VALUES (234, 'file', 232, 'event/information/add', '添加', 'fa fa-circle-o', '', '', 0, 1528090594, 1528091698, 121, 'normal');
INSERT INTO `tm_auth_rule` VALUES (235, 'file', 232, 'event/information/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1528090594, 1528091698, 120, 'normal');
INSERT INTO `tm_auth_rule` VALUES (236, 'file', 232, 'event/information/del', '删除', 'fa fa-circle-o', '', '', 0, 1528090594, 1528091698, 119, 'normal');
INSERT INTO `tm_auth_rule` VALUES (237, 'file', 232, 'event/information/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1528090594, 1528091698, 118, 'normal');
INSERT INTO `tm_auth_rule` VALUES (238, 'file', 231, 'newscolumn', '新闻栏目管理', 'fa fa-circle-o', '', '', 1, 1528091496, 1528092953, 117, 'normal');
INSERT INTO `tm_auth_rule` VALUES (239, 'file', 238, 'newscolumn/index', '查看', 'fa fa-circle-o', '', '', 0, 1528091496, 1528091496, 116, 'normal');
INSERT INTO `tm_auth_rule` VALUES (240, 'file', 238, 'newscolumn/add', '添加', 'fa fa-circle-o', '', '', 0, 1528091496, 1528091496, 115, 'normal');
INSERT INTO `tm_auth_rule` VALUES (241, 'file', 238, 'newscolumn/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1528091496, 1528091496, 114, 'normal');
INSERT INTO `tm_auth_rule` VALUES (242, 'file', 238, 'newscolumn/del', '删除', 'fa fa-circle-o', '', '', 0, 1528091496, 1528091496, 113, 'normal');
INSERT INTO `tm_auth_rule` VALUES (243, 'file', 238, 'newscolumn/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1528091496, 1528091496, 112, 'normal');
INSERT INTO `tm_auth_rule` VALUES (244, 'file', 231, 'page', '单页面管理', 'fa fa-circle-o', '', '', 1, 1528094514, 1529997031, 155, 'normal');
INSERT INTO `tm_auth_rule` VALUES (245, 'file', 244, 'page/add', '默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、des', 'fa fa-circle-o', '', '', 0, 1528094514, 1528094514, 110, 'normal');
INSERT INTO `tm_auth_rule` VALUES (246, 'file', 244, 'page/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1528094514, 1528094514, 109, 'normal');
INSERT INTO `tm_auth_rule` VALUES (247, 'file', 244, 'page/index', '查看', 'fa fa-circle-o', '', '', 0, 1528094514, 1528094514, 108, 'normal');
INSERT INTO `tm_auth_rule` VALUES (248, 'file', 244, 'page/del', '删除', 'fa fa-circle-o', '', '', 0, 1528094514, 1528094514, 107, 'normal');
INSERT INTO `tm_auth_rule` VALUES (249, 'file', 244, 'page/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1528094514, 1528094514, 106, 'normal');
INSERT INTO `tm_auth_rule` VALUES (288, 'file', 413, 'statement', '组委会申明', 'fa fa-circle-o', '', '', 1, 1528428634, 1531818539, 157, 'normal');
INSERT INTO `tm_auth_rule` VALUES (289, 'file', 288, 'statement/index', '查看', 'fa fa-circle-o', '', '', 0, 1528428634, 1528440545, 153, 'normal');
INSERT INTO `tm_auth_rule` VALUES (290, 'file', 288, 'statement/add', '添加', 'fa fa-circle-o', '', '', 0, 1528428634, 1528440545, 152, 'normal');
INSERT INTO `tm_auth_rule` VALUES (291, 'file', 288, 'statement/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1528428634, 1528440545, 151, 'normal');
INSERT INTO `tm_auth_rule` VALUES (292, 'file', 288, 'statement/del', '删除', 'fa fa-circle-o', '', '', 0, 1528428634, 1528440545, 150, 'normal');
INSERT INTO `tm_auth_rule` VALUES (293, 'file', 288, 'statement/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1528428634, 1528440545, 149, 'normal');
INSERT INTO `tm_auth_rule` VALUES (344, 'file', 413, 'websitedeclaration', '网站申明', 'fa fa-circle-o', '', '', 1, 1528509538, 1531818527, 154, 'normal');
INSERT INTO `tm_auth_rule` VALUES (345, 'file', 344, 'websitedeclaration/index', '查看', 'fa fa-circle-o', '', '', 0, 1528509538, 1528509538, 148, 'normal');
INSERT INTO `tm_auth_rule` VALUES (346, 'file', 344, 'websitedeclaration/add', '添加', 'fa fa-circle-o', '', '', 0, 1528509538, 1528509538, 147, 'normal');
INSERT INTO `tm_auth_rule` VALUES (347, 'file', 344, 'websitedeclaration/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1528509538, 1528509538, 146, 'normal');
INSERT INTO `tm_auth_rule` VALUES (348, 'file', 344, 'websitedeclaration/del', '删除', 'fa fa-circle-o', '', '', 0, 1528509538, 1528509538, 145, 'normal');
INSERT INTO `tm_auth_rule` VALUES (349, 'file', 344, 'websitedeclaration/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1528509538, 1528509538, 144, 'normal');
INSERT INTO `tm_auth_rule` VALUES (385, 'file', 415, 'general/crontab', '定时任务', 'fa fa-tasks', '', '类似于Linux的Crontab定时任务,可以按照设定的时间进行任务的执行,目前仅支持三种任务:请求URL、执行SQL、执行Shell', 1, 1530615914, 1531836352, 1, 'normal');
INSERT INTO `tm_auth_rule` VALUES (386, 'file', 385, 'general/crontab/index', '查看', 'fa fa-circle-o', '', '', 0, 1530615914, 1530615914, 184, 'normal');
INSERT INTO `tm_auth_rule` VALUES (387, 'file', 385, 'general/crontab/add', '添加', 'fa fa-circle-o', '', '', 0, 1530615914, 1530615914, 183, 'normal');
INSERT INTO `tm_auth_rule` VALUES (388, 'file', 385, 'general/crontab/edit', '编辑 ', 'fa fa-circle-o', '', '', 0, 1530615914, 1530615914, 182, 'normal');
INSERT INTO `tm_auth_rule` VALUES (389, 'file', 385, 'general/crontab/del', '删除', 'fa fa-circle-o', '', '', 0, 1530615915, 1530615915, 181, 'normal');
INSERT INTO `tm_auth_rule` VALUES (390, 'file', 385, 'general/crontab/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1530615915, 1530615915, 180, 'normal');
INSERT INTO `tm_auth_rule` VALUES (391, 'file', 2, 'payment/index', '支付管理', 'fa fa-circle-o', '', '', 1, 1530791870, 1531833768, 2, 'normal');
INSERT INTO `tm_auth_rule` VALUES (393, 'file', 414, 'autonym', '身份信息审核', 'fa fa-address-card', '', '', 0, 1530843633, 1533204955, 178, 'normal');
INSERT INTO `tm_auth_rule` VALUES (394, 'file', 414, 'register', '报名管理', 'fa fa-align-left', '', '', 0, 1530859432, 1533204943, 177, 'normal');
INSERT INTO `tm_auth_rule` VALUES (395, 'file', 414, 'blacklist', '黑名单', 'fa fa-circle-o', '', '', 1, 1531534867, 1534495626, 150, 'normal');
INSERT INTO `tm_auth_rule` VALUES (396, 'file', 395, 'blacklist/index', '查看', 'fa fa-circle-o', '', '', 0, 1531534868, 1531535210, 175, 'normal');
INSERT INTO `tm_auth_rule` VALUES (397, 'file', 395, 'blacklist/add', '添加', 'fa fa-circle-o', '', '', 0, 1531534868, 1531535210, 174, 'normal');
INSERT INTO `tm_auth_rule` VALUES (398, 'file', 395, 'blacklist/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1531534868, 1531535210, 173, 'normal');
INSERT INTO `tm_auth_rule` VALUES (399, 'file', 395, 'blacklist/del', '删除', 'fa fa-circle-o', '', '', 0, 1531534868, 1531535210, 172, 'normal');
INSERT INTO `tm_auth_rule` VALUES (400, 'file', 395, 'blacklist/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1531534868, 1531535210, 171, 'normal');
INSERT INTO `tm_auth_rule` VALUES (401, 'file', 414, 'matchplayer', '永久号管理', 'fa fa-futbol-o', '', '', 0, 1531538881, 1539143502, 160, 'normal');
INSERT INTO `tm_auth_rule` VALUES (402, 'file', 401, 'matchplayer/index', '查看', 'fa fa-circle-o', '', '', 0, 1531538881, 1531539778, 169, 'normal');
INSERT INTO `tm_auth_rule` VALUES (403, 'file', 401, 'matchplayer/add', '添加', 'fa fa-circle-o', '', '', 0, 1531538881, 1531539778, 168, 'normal');
INSERT INTO `tm_auth_rule` VALUES (404, 'file', 401, 'matchplayer/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1531538881, 1531539778, 167, 'normal');
INSERT INTO `tm_auth_rule` VALUES (405, 'file', 401, 'matchplayer/del', '删除', 'fa fa-circle-o', '', '', 0, 1531538881, 1531539778, 166, 'normal');
INSERT INTO `tm_auth_rule` VALUES (406, 'file', 401, 'matchplayer/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1531538881, 1531539778, 165, 'normal');
INSERT INTO `tm_auth_rule` VALUES (407, 'file', 413, 'ximinlink', '个人中心链接', 'fa fa-link', '', '', 1, 1531788286, 1531832850, 164, 'normal');
INSERT INTO `tm_auth_rule` VALUES (408, 'file', 407, 'ximinlink/index', '查看', 'fa fa-circle-o', '', '', 0, 1531788286, 1531789748, 163, 'normal');
INSERT INTO `tm_auth_rule` VALUES (409, 'file', 407, 'ximinlink/add', '添加', 'fa fa-circle-o', '', '', 0, 1531788286, 1531789748, 162, 'normal');
INSERT INTO `tm_auth_rule` VALUES (410, 'file', 407, 'ximinlink/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1531788286, 1531789748, 161, 'normal');
INSERT INTO `tm_auth_rule` VALUES (411, 'file', 407, 'ximinlink/del', '删除', 'fa fa-circle-o', '', '', 0, 1531788286, 1531789748, 160, 'normal');
INSERT INTO `tm_auth_rule` VALUES (412, 'file', 407, 'ximinlink/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1531788286, 1531789748, 159, 'normal');
INSERT INTO `tm_auth_rule` VALUES (413, 'file', 0, 'bmlc', '报名流程', 'fa fa-gg', '', '', 1, 1531818494, 1531818494, 158, 'normal');
INSERT INTO `tm_auth_rule` VALUES (414, 'file', 0, 'rigsters', '报名管理', 'fa fa-drivers-license-o', '', '', 1, 1531825985, 1531826070, 179, 'normal');
INSERT INTO `tm_auth_rule` VALUES (415, 'file', 0, 'qtgl', '其他管理', 'fa fa-circle-o', '', '', 1, 1531836227, 1531836227, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (416, 'file', 414, 'order/index', '订单管理', 'fa fa-adjust', '', '', 1, 1532696331, 1534495640, 155, 'normal');
INSERT INTO `tm_auth_rule` VALUES (418, 'file', 415, 'matchtemplate', '短信邮件模板管理', 'fa fa-envelope', '', '', 1, 1533107307, 1533107307, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (420, 'file', 414, 'registerallinfo', '用户报名管理', 'fa fa-circle-o', '', '', 1, 1533114427, 1534495578, 180, 'normal');
INSERT INTO `tm_auth_rule` VALUES (421, 'file', 420, 'registerallinfo/index', '查看', 'fa fa-circle-o', '', '', 0, 1533114428, 1533114428, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (422, 'file', 420, 'registerallinfo/add', '添加', 'fa fa-circle-o', '', '', 0, 1533114428, 1533114428, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (423, 'file', 420, 'registerallinfo/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1533114428, 1533114428, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (424, 'file', 420, 'registerallinfo/del', '删除', 'fa fa-circle-o', '', '', 0, 1533114428, 1533114428, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (425, 'file', 420, 'registerallinfo/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1533114428, 1533114428, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (426, 'file', 414, 'code', '验证码管理', 'fa fa-sign-language', '', '', 1, 1533819918, 1533819918, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (427, 'file', 420, 'registerallinfo/import', '导入', 'fa fa-circle-o', '', '', 0, 1535098129, 1535098129, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (428, 'file', 499, 'zhuce/index', '查看', 'fa fa-circle-o', '', '', 0, 1535098431, 1535098431, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (429, 'file', 499, 'zhuce/detail', '详情', 'fa fa-circle-o', '', '', 0, 1535098477, 1535098477, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (430, 'file', 0, 'goods', '完赛服管理', 'fa fa-circle-o', '', '', 0, 1538359229, 1538966318, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (431, 'file', 414, 'projectinfo', '赛事项目管理', 'fa fa-bicycle', '', '', 1, 1539312679, 1539312751, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (448, 'file', 431, 'projectinfo/index', '查看', 'fa fa-circle-o', '', '', 0, 1539312681, 1539312681, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (449, 'file', 431, 'projectinfo/add', '添加', 'fa fa-circle-o', '', '', 0, 1539312681, 1539312681, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (450, 'file', 431, 'projectinfo/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1539312681, 1539312681, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (451, 'file', 431, 'projectinfo/del', '删除', 'fa fa-circle-o', '', '', 0, 1539312681, 1539312681, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (452, 'file', 431, 'projectinfo/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1539312681, 1539312681, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (453, 'file', 414, 'matchinfo', '赛事信息管理', 'fa fa-blind', '', '', 0, 1539312833, 1548406699, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (470, 'file', 453, 'matchinfo/index', '查看', 'fa fa-circle-o', '', '', 0, 1539312834, 1539312834, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (471, 'file', 453, 'matchinfo/add', '添加', 'fa fa-circle-o', '', '', 0, 1539312834, 1539312834, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (472, 'file', 453, 'matchinfo/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1539312834, 1539312834, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (473, 'file', 453, 'matchinfo/del', '删除', 'fa fa-circle-o', '', '', 0, 1539312835, 1539312835, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (474, 'file', 453, 'matchinfo/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1539312835, 1539312835, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (475, 'file', 414, 'teamcode', '邀请码管理', 'fa fa-bookmark', '', '', 1, 1539339876, 1539423839, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (476, 'file', 475, 'teamcode/index', '查看', 'fa fa-circle-o', '', '', 0, 1539422124, 1539422124, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (477, 'file', 414, 'registerimport', '报名导入日志', 'fa fa-circle-o', '', '', 1, 1539588220, 1539588318, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (494, 'file', 477, 'registerimport/index', '查看', 'fa fa-circle-o', '', '', 0, 1539588221, 1539588221, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (495, 'file', 477, 'registerimport/add', '添加', 'fa fa-circle-o', '', '', 0, 1539588221, 1539588221, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (496, 'file', 477, 'registerimport/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1539588221, 1539588221, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (497, 'file', 477, 'registerimport/del', '删除', 'fa fa-circle-o', '', '', 0, 1539588221, 1539588221, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (498, 'file', 477, 'registerimport/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1539588221, 1539588221, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (499, 'file', 414, 'zhuce', '注册信息', 'fa fa-circle-o', '', '', 1, 1554793302, 1554793325, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (500, 'file', 420, 'registerallinfo/exporSelect', '导出选择', 'fa fa-circle-o', '', '', 0, 1554793302, 1554793302, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (501, 'file', 420, 'registerallinfo/export', '导出', 'fa fa-circle-o', '', '', 0, 0, 0, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (502, 'file', 499, 'zhuce/changepassword', '重置密码', 'fa fa-circle-o', '', '', 0, 1556257559, 1556257559, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (503, 'file', 414, 'draw/draw', '抽签管理', 'fa fa-circle-o', '', '', 1, 1557389412, 1557389501, 0, 'normal');
INSERT INTO `tm_auth_rule` VALUES (504, 'file', 503, 'draw/index', '抽签列表', 'fa fa-circle-o', '', '', 1, 1557734398, 1557734398, 0, 'normal');

-- ----------------------------
-- Table structure for tp_communication
-- ----------------------------
DROP TABLE IF EXISTS `tp_communication`;
CREATE TABLE `tp_communication`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_id` int(5) NOT NULL,
  `from_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_id` int(5) NOT NULL,
  `to_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(10) NOT NULL,
  `shopid` int(5) NULL DEFAULT NULL,
  `isread` tinyint(2) NULL DEFAULT 0,
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '1是普通文本，2是图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_communication
-- ----------------------------
INSERT INTO `tp_communication` VALUES (20, 10, '大美如斯', 40, 'Love violet life', '1', 1563890910, NULL, 1, 1);
INSERT INTO `tp_communication` VALUES (21, 10, '大美如斯', 40, 'Love violet life', '\\uploads\\20190723\\7198c495bf38e7c967ce3f1bb2c69eb6.png', 1563890914, NULL, 0, 2);
INSERT INTO `tp_communication` VALUES (22, 10, '大美如斯', 40, 'Love violet life', '\\uploads\\20190723\\1718e1698f566d0ce7332a5d946bbaa1.png', 1563891017, NULL, 0, 2);
INSERT INTO `tp_communication` VALUES (23, 40, 'Love violet life', 10, '大美如斯', '\\uploads\\20190723\\9b43a5f04a0f74d4ecedafcd4688b871.png', 1563891127, NULL, 0, 2);

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'openid',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `subscribe` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否关注',
  `subscribe_time` int(10) NULL DEFAULT NULL COMMENT '关注时间',
  `unsubscribe_time` int(10) NULL DEFAULT NULL COMMENT '取消关注时间',
  `relname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `signature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个性签名',
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `is_bind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否绑定',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用语言',
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `group_id` int(10) NULL DEFAULT 0 COMMENT '分组ID',
  `groupid` int(11) NOT NULL DEFAULT 0 COMMENT '公众号分组标识',
  `tagid_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `score` int(10) NULL DEFAULT 0 COMMENT '积分',
  `money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金钱',
  `latitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `location_precision` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '精度',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0:公众号粉丝1：注册会员',
  `unionid` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unionid字段',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `last_time` int(10) NULL DEFAULT 586969200 COMMENT '最后交互时间',
  `parentid` int(10) NULL DEFAULT 1 COMMENT '非扫码用户默认都是1',
  `isfenxiao` int(8) NULL DEFAULT 0 COMMENT '是否为分销，默认为0，1,2,3，分别为1,2,3级分销',
  `totle_earn` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '挣钱总额',
  `balance` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '分销挣的剩余未提现额',
  `fenxiao_leavel` int(8) NULL DEFAULT 2 COMMENT '分销等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号粉丝表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES (10, 1, 'oYxpK0W2u3Sbbp-wevdQtCuviDVM', '大美如斯', '/head/c1a8ca77bf8f17580ca6765e6f03f097.png', 2, 1, 1507261446, NULL, NULL, NULL, NULL, 0, 'zh_CN', '中国', '河南', '焦作', '', 0, 0, '[]', 0, 0.00, NULL, NULL, NULL, 0, NULL, NULL, 586969200, 1, 0, 0.00, 0.00, 2);
INSERT INTO `tp_user` VALUES (40, 1, 'oYxpK0bPptICGQd3YP_1s7jfDTmE', 'Love violet life', '/head/c1a8ca77bf8f17580ca6765e6f03f097.png', 1, 1, 1517280919, 1517280912, NULL, NULL, NULL, 0, 'zh_CN', '中国', '江西', '赣州', '', 0, 0, '[]', 0, 0.00, NULL, NULL, NULL, 0, NULL, NULL, 1517478028, 1, 0, 26.00, 26.00, 2);
INSERT INTO `tp_user` VALUES (50, 1, 'oYxpK0RsvcwgS9DtmIOuyb_BgJbo', '大金', NULL, 1, 1, 1508920878, NULL, NULL, NULL, NULL, 0, 'zh_CN', '中国', '河南', '商丘', '', 0, 0, '[]', 0, 0.00, NULL, NULL, NULL, 0, NULL, NULL, 586969200, 1, 0, 0.00, 0.00, 2);
INSERT INTO `tp_user` VALUES (60, 1, 'oYxpK0VnHjESafUHzRpstS8mMwlE', '悦悦', NULL, 2, 1, 1512281210, NULL, NULL, NULL, NULL, 0, 'zh_CN', '中国', '福建', '福州', '', 0, 0, '[]', 0, 0.00, NULL, NULL, NULL, 0, NULL, NULL, 586969200, 1, 0, 0.00, 0.00, 2);
INSERT INTO `tp_user` VALUES (70, 1, 'oYxpK0fJVYveWC_nAd7CBwcvYZ3Q', '雨薇', NULL, 2, 1, 1506320564, NULL, NULL, NULL, NULL, 0, 'zh_CN', '', '', '', '', 0, 0, '[]', 0, 0.00, NULL, NULL, NULL, 0, NULL, NULL, 586969200, 1, 0, 0.00, 0.00, 2);

SET FOREIGN_KEY_CHECKS = 1;
