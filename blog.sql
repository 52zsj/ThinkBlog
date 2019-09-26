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

 Date: 26/09/2019 18:06:13
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_admin
-- ----------------------------
INSERT INTO `jack_admin` VALUES (1, 'admin', '83c69fb8d19137202c9f88735b781d4d', 'abcd', 'admin', 0, '', '2019-09-25 15:30:35', '2019-09-25 15:30:35', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_album
-- ----------------------------
INSERT INTO `jack_album` VALUES (1, '全新后台JS测试', '全新后台JS测试编辑', 'upload\\album\\20190923\\cccaeb1e349836f35cc602ae9cc0817f.jpg', 1, 'upload\\album\\20190923\\b26bd6a4c56be0c2e435e71a1e7417ff.mp3', '2019-09-23 16:45:47', '2019-09-23 17:03:28');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_album_item
-- ----------------------------
INSERT INTO `jack_album_item` VALUES (2, 1, '', 'upload\\album\\20190923\\f789fdcac3c2415aaeb0037243ded2d3.png', '');
INSERT INTO `jack_album_item` VALUES (4, 1, '', 'upload\\album\\20190923\\22814fd53961ce5a3a9b458cf1e5ee06.png', '');
INSERT INTO `jack_album_item` VALUES (5, 1, '', 'upload\\album\\20190923\\bc079652fa8a31ba2676337d12c28e6e.png', '');
INSERT INTO `jack_album_item` VALUES (6, 1, '', 'upload\\album\\20190923\\2f9c6d1dbc6e294ae332a855cb87a9f6.png', '');

-- ----------------------------
-- Table structure for jack_config
-- ----------------------------
DROP TABLE IF EXISTS `jack_config`;
CREATE TABLE `jack_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_config
-- ----------------------------
INSERT INTO `jack_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `jack_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `jack_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `jack_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `jack_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `jack_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `jack_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `jack_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `jack_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `jack_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `jack_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `jack_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `jack_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `jack_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `jack_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `jack_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `jack_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for jack_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `jack_dictionary`;
CREATE TABLE `jack_dictionary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示名称',
  `en_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段标示',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  `order_key` smallint(6) NOT NULL DEFAULT 50 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用1启用0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_dictionary
-- ----------------------------
INSERT INTO `jack_dictionary` VALUES (1, '页脚', 'footer', '2019-09-26 15:41:06', '2019-09-26 17:39:14', '&lt;ul class=&quot;col-sm-2 site-link list-paddingleft-2&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 40px; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 190px; color: rgb(136, 136, 136); font-family: -apple-system, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;WenQuanYi Micro Hei&amp;quot;, &amp;quot;Microsoft Yahei&amp;quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;li&gt;&lt;p&gt;产品&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/questions/hottest?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;热门问答&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/blogs/hottest?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;热门专栏&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/lives?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;热门课程&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/events?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;最新活动&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/groups?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;技术圈&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/groups?tab=jobs&amp;utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;酷工作&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/app?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;移动客户端&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;col-sm-2 site-link list-paddingleft-2&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 40px; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 190px; color: rgb(136, 136, 136); font-family: -apple-system, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;WenQuanYi Micro Hei&amp;quot;, &amp;quot;Microsoft Yahei&amp;quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;li&gt;&lt;p&gt;课程&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/lives/edu?tag=java&amp;sort=hottest&amp;utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;Java 开发课程&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/lives/edu?tag=php&amp;sort=hottest&amp;utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;PHP 开发课程&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/lives/edu?tag=python&amp;sort=hottest&amp;utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;Python 开发课程&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/lives/edu?category=1&amp;sort=hottest&amp;utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;前端开发课程&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/lives/study?category=3&amp;sort=hottest&amp;utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;移动开发课程&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;col-sm-2 site-link list-paddingleft-2&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 40px; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 190px; color: rgb(136, 136, 136); font-family: -apple-system, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;WenQuanYi Micro Hei&amp;quot;, &amp;quot;Microsoft Yahei&amp;quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;li&gt;&lt;p&gt;资源&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/weekly?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;每周精选&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/users?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;用户排行榜&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/badges?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;徽章&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/faq?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;帮助中心&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/repu?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;声望与权限&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/community?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;社区服务中心&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;col-sm-2 site-link list-paddingleft-2&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 40px; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 190px; color: rgb(136, 136, 136); font-family: -apple-system, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;WenQuanYi Micro Hei&amp;quot;, &amp;quot;Microsoft Yahei&amp;quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;li&gt;&lt;p&gt;合作&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://about.segmentfault.com/?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;关于我们&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://business.segmentfault.com/ads?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;广告投放&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/groups?tab=jobs&amp;utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;职位发布&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/lives/apply?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;讲师招募&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://about.segmentfault.com/contact.html?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;联系我们&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;col-sm-2 site-link list-paddingleft-2&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 40px; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 190px; color: rgb(136, 136, 136); font-family: -apple-system, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;WenQuanYi Micro Hei&amp;quot;, &amp;quot;Microsoft Yahei&amp;quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;li&gt;&lt;p&gt;关注&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/blog/segmentfault?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;产品技术日志&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/blog/community_admin?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;社区运营日志&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/blog/segmentfault_news?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;市场运营日志&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/blog/segmentfault_team?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;团队日志&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/blog/interview?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;社区访谈&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;/li&gt;&lt;ul class=&quot;sn-inline list-paddingleft-2&quot; style=&quot;list-style-type: none;&quot;&gt;&lt;li&gt;&lt;p&gt;&lt;a class=&quot;entypo-wechart icon-sn-weixin weixin-popover-qrcode&quot; title=&quot;&quot; style=&quot;box-sizing: border-box; background: url(&amp;quot;../img/social-icons/icon-sn.svg&amp;quot;) -252px -28px / auto 56px no-repeat transparent; outline: 0px; display: inline-block; width: 28px; height: 28px; vertical-align: middle; text-indent: 110%; white-space: nowrap; overflow: hidden; text-transform: capitalize;&quot;&gt;微信&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;http://weibo.com/segmentfault&quot; target=&quot;_blank&quot; class=&quot;entypo-weibo icon-sn-weibo&quot; style=&quot;box-sizing: border-box; background: url(&amp;quot;../img/social-icons/icon-sn.svg&amp;quot;) -56px -28px / auto 56px no-repeat transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px; display: inline-block; width: 28px; height: 28px; vertical-align: middle; text-indent: 110%; white-space: nowrap; overflow: hidden; text-transform: capitalize;&quot;&gt;新浪微博&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://github.com/SegmentFault&quot; target=&quot;_blank&quot; class=&quot;entypo-facebook icon-sn-github&quot; style=&quot;box-sizing: border-box; background: url(&amp;quot;../img/social-icons/icon-sn.svg&amp;quot;) -28px -28px / auto 56px no-repeat transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px; display: inline-block; width: 28px; height: 28px; vertical-align: middle; text-indent: 110%; white-space: nowrap; overflow: hidden; text-transform: capitalize;&quot;&gt;Github&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://twitter.com/segment_fault&quot; target=&quot;_blank&quot; class=&quot;entypo-twitter icon-sn-twitter&quot; style=&quot;box-sizing: border-box; background: url(&amp;quot;../img/social-icons/icon-sn.svg&amp;quot;) -112px -28px / auto 56px no-repeat transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px; display: inline-block; width: 28px; height: 28px; vertical-align: middle; text-indent: 110%; white-space: nowrap; overflow: hidden; text-transform: capitalize;&quot;&gt;Twitter&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;ul class=&quot;col-sm-2 site-link list-paddingleft-2&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 40px; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 190px; color: rgb(136, 136, 136); font-family: -apple-system, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;WenQuanYi Micro Hei&amp;quot;, &amp;quot;Microsoft Yahei&amp;quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;li&gt;&lt;p&gt;条款&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/tos?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;服务条款&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/privacy?utm_source=sf-footer&quot; target=&quot;_blank&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px;&quot;&gt;隐私政策&lt;/a&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;&lt;a href=&quot;https://segmentfault.com/app&quot; class=&quot;clearfix mt10 block&quot; style=&quot;box-sizing: border-box; background: transparent; color: rgb(136, 136, 136); text-decoration-line: none; outline: 0px; display: block; margin-top: 10px !important;&quot;&gt;&lt;img src=&quot;/ueditor/upload/image/20190926/1569483664.png&quot; class=&quot;app-qrcode&quot;/&gt;&lt;/a&gt;&lt;/p&gt;&lt;div class=&quot;app-download-desc&quot; style=&quot;box-sizing: border-box; padding-top: 10px;&quot;&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;&quot;&gt;扫一扫下载 App&lt;/p&gt;&lt;/div&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 222, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jack_menu
-- ----------------------------
INSERT INTO `jack_menu` VALUES (1, 0, 'admin', '管理员管理', 'fa fa-group', '', 1, '2019-07-31 20:45:48', '2019-08-02 12:34:27', 1, 1);
INSERT INTO `jack_menu` VALUES (2, 1, 'admin/index', '列表', 'fa fa-list', '', 0, '2019-07-31 20:46:33', '2019-09-23 11:16:50', 2, 1);
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
INSERT INTO `jack_menu` VALUES (16, 0, 'dictionary', '字典管理', 'fa fa-group', '', 1, '2019-09-23 17:28:39', '2019-09-25 16:10:43', 1, 1);
INSERT INTO `jack_menu` VALUES (17, 16, 'dictionary/add', '添加', 'fa fa-cog', '', 0, '2019-09-23 17:28:53', '2019-09-25 16:10:45', 2, 1);
INSERT INTO `jack_menu` VALUES (18, 16, 'dictionary/edit', '编辑', 'fa fa-edit', '', 0, '2019-09-23 17:29:23', '2019-09-25 16:10:46', 3, 1);
INSERT INTO `jack_menu` VALUES (19, 16, 'dictionary/del', '删除', 'fa fa-circle-o', '', 0, '2019-09-23 17:29:38', '2019-09-25 16:10:48', 4, 1);

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
