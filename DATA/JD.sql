/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : localhost:3306
 Source Schema         : JD

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 25/05/2024 03:24:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (25, 'Can add review', 7, 'add_review');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (26, 'Can change review', 7, 'change_review');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (27, 'Can delete review', 7, 'delete_review');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (28, 'Can view review', 7, 'view_review');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (1, 'pbkdf2_sha256$600000$OteQrM6GI1L3kpjvK4FzB0$19v8dBB0LnkHKC/X+4+HaFrUxDKW9wKxlDU1FXnvndE=', '2024-05-23 17:42:24.818915', 1, 'zhangsan', '', '', '983256124@qq.com', 1, 1, '2024-05-23 17:42:11.067067');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bys_review
-- ----------------------------
DROP TABLE IF EXISTS `bys_review`;
CREATE TABLE `bys_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand` varchar(100) NOT NULL,
  `word` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bys_review
-- ----------------------------
BEGIN;
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (1, 'apple', '流畅', 1432);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (2, 'apple', '手感', 1289);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (3, 'apple', '拍照', 1173);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (4, 'apple', '系统', 1108);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (5, 'apple', '续航', 998);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (6, 'apple', '颜值', 945);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (7, 'apple', '信号', 879);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (8, 'apple', '设计', 823);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (9, 'apple', '性能', 762);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (10, 'apple', '价格', 695);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (11, 'apple', '功能', 651);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (12, 'apple', '内存', 618);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (13, 'apple', '清晰', 589);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (14, 'apple', '屏幕', 557);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (15, 'apple', '质感', 522);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (16, 'apple', '音质', 497);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (17, 'apple', '体验', 478);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (18, 'apple', '售后', 459);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (19, 'apple', '电池', 432);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (20, 'apple', '重量', 415);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (21, 'apple', '操作', 396);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (22, 'apple', '颜色', 381);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (23, 'apple', '分辨率', 367);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (24, 'apple', '尺寸', 353);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (25, 'apple', '材质', 341);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (26, 'apple', '快充', 329);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (27, 'apple', '指纹', 318);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (28, 'apple', '面容', 308);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (29, 'apple', '扬声器', 298);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (30, 'apple', '摄像头', 289);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (31, 'apple', '音量', 277);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (32, 'apple', '稳定', 265);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (33, 'apple', '反应', 254);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (34, 'apple', '待机', 243);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (35, 'apple', '质保', 231);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (36, 'apple', '清晰度', 220);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (37, 'apple', '语音', 209);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (38, 'apple', '握持感', 198);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (39, 'apple', '快感', 187);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (40, 'apple', '音效', 176);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (41, 'apple', '屏占比', 165);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (42, 'apple', '防水', 154);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (43, 'apple', '续航能力', 143);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (44, 'apple', '玻璃', 132);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (45, 'apple', '高刷', 121);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (46, 'apple', '动画', 110);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (47, 'apple', '散热', 99);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (48, 'apple', '握持', 88);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (49, 'apple', '握感', 77);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (50, 'apple', '滑动', 66);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (51, 'apple', '侧面', 55);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (52, 'apple', '触摸', 44);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (53, 'apple', '颜色丰富', 33);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (54, 'apple', '外观精美', 22);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (55, 'apple', '操作简单', 11);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (56, 'apple', '信号好', 10);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (57, 'apple', '响应快', 9);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (58, 'apple', '速度快', 8);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (59, 'apple', '指纹解锁', 7);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (60, 'apple', '面容解锁', 6);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (61, 'apple', '面部识别', 5);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (62, 'apple', '相机', 4);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (63, 'apple', '摄像', 3);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (64, 'huawei', '耐用', 1428);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (65, 'huawei', '性能', 1296);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (66, 'huawei', '电池', 1184);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (67, 'huawei', '拍照', 1099);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (68, 'huawei', '屏幕', 989);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (69, 'huawei', '颜值', 935);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (70, 'huawei', '信号', 882);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (71, 'huawei', '系统', 821);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (72, 'huawei', '手感', 759);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (73, 'huawei', '价格', 698);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (74, 'huawei', '功能', 648);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (75, 'huawei', '内存', 613);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (76, 'huawei', '流畅', 589);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (77, 'huawei', '清晰', 554);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (78, 'huawei', '设计', 519);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (79, 'huawei', '质感', 491);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (80, 'huawei', '音质', 472);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (81, 'huawei', '体验', 453);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (82, 'huawei', '售后', 439);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (83, 'huawei', '重量', 425);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (84, 'huawei', '操作', 407);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (85, 'huawei', '颜色', 391);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (86, 'huawei', '分辨率', 377);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (87, 'huawei', '尺寸', 362);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (88, 'huawei', '材质', 348);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (89, 'huawei', '快充', 335);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (90, 'huawei', '指纹', 324);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (91, 'huawei', '面容', 313);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (92, 'huawei', '扬声器', 302);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (93, 'huawei', '摄像头', 293);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (94, 'huawei', '音量', 282);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (95, 'huawei', '稳定', 271);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (96, 'huawei', '反应', 260);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (97, 'huawei', '待机', 249);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (98, 'huawei', '质保', 238);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (99, 'huawei', '清晰度', 227);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (100, 'huawei', '语音', 216);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (101, 'huawei', '握持感', 205);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (102, 'huawei', '快感', 194);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (103, 'huawei', '音效', 183);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (104, 'huawei', '屏占比', 172);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (105, 'huawei', '防水', 161);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (106, 'huawei', '续航能力', 150);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (107, 'huawei', '玻璃', 139);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (108, 'huawei', '高刷', 128);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (109, 'huawei', '动画', 117);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (110, 'huawei', '散热', 106);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (111, 'huawei', '握持', 95);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (112, 'huawei', '握感', 84);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (113, 'huawei', '滑动', 73);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (114, 'huawei', '侧面', 62);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (115, 'huawei', '触摸', 51);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (116, 'huawei', '颜色丰富', 40);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (117, 'huawei', '外观精美', 29);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (118, 'huawei', '操作简单', 18);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (119, 'huawei', '信号好', 10);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (120, 'huawei', '响应快', 9);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (121, 'huawei', '速度快', 8);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (122, 'huawei', '指纹解锁', 7);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (123, 'huawei', '面容解锁', 6);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (124, 'huawei', '面部识别', 5);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (125, 'huawei', '相机', 4);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (126, 'huawei', '摄像', 3);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (127, 'xiaomi', '性价比', 1398);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (128, 'xiaomi', '性能', 1275);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (129, 'xiaomi', '设计', 1154);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (130, 'xiaomi', '拍照', 1078);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (131, 'xiaomi', '屏幕', 968);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (132, 'xiaomi', '系统', 914);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (133, 'xiaomi', '电池', 859);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (134, 'xiaomi', '手感', 812);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (135, 'xiaomi', '质量', 754);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (136, 'xiaomi', '价格', 698);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (137, 'xiaomi', '功能', 646);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (138, 'xiaomi', '内存', 608);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (139, 'xiaomi', '流畅', 582);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (140, 'xiaomi', '清晰', 547);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (141, 'xiaomi', '质感', 487);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (142, 'xiaomi', '音质', 462);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (143, 'xiaomi', '体验', 443);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (144, 'xiaomi', '售后', 428);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (145, 'xiaomi', '重量', 411);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (146, 'xiaomi', '操作', 392);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (147, 'xiaomi', '颜色', 376);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (148, 'xiaomi', '分辨率', 361);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (149, 'xiaomi', '尺寸', 348);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (150, 'xiaomi', '材质', 335);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (151, 'xiaomi', '快充', 324);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (152, 'xiaomi', '指纹', 313);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (153, 'xiaomi', '面容', 303);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (154, 'xiaomi', '扬声器', 292);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (155, 'xiaomi', '摄像头', 283);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (156, 'xiaomi', '音量', 271);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (157, 'xiaomi', '稳定', 260);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (158, 'xiaomi', '反应', 249);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (159, 'xiaomi', '待机', 238);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (160, 'xiaomi', '质保', 227);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (161, 'xiaomi', '清晰度', 216);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (162, 'xiaomi', '语音', 205);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (163, 'xiaomi', '握持感', 194);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (164, 'xiaomi', '快感', 183);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (165, 'xiaomi', '音效', 172);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (166, 'xiaomi', '屏占比', 161);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (167, 'xiaomi', '防水', 150);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (168, 'xiaomi', '续航能力', 139);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (169, 'xiaomi', '玻璃', 128);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (170, 'xiaomi', '高刷', 117);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (171, 'xiaomi', '动画', 106);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (172, 'xiaomi', '散热', 95);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (173, 'xiaomi', '握持', 84);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (174, 'xiaomi', '握感', 73);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (175, 'xiaomi', '滑动', 62);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (176, 'xiaomi', '侧面', 51);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (177, 'xiaomi', '触摸', 40);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (178, 'xiaomi', '颜色丰富', 29);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (179, 'xiaomi', '外观精美', 18);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (180, 'xiaomi', '操作简单', 17);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (181, 'xiaomi', '信号好', 16);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (182, 'xiaomi', '响应快', 15);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (183, 'xiaomi', '速度快', 14);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (184, 'xiaomi', '指纹解锁', 13);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (185, 'xiaomi', '面容解锁', 12);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (186, 'xiaomi', '面部识别', 11);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (187, 'xiaomi', '相机', 10);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (188, 'xiaomi', '摄像', 9);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (189, 'oppo', '颜值', 1382);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (190, 'oppo', '拍照', 1269);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (191, 'oppo', '屏幕', 1157);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (192, 'oppo', '系统', 1083);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (193, 'oppo', '性能', 973);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (194, 'oppo', '电池', 927);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (195, 'oppo', '手感', 874);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (196, 'oppo', '质量', 815);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (197, 'oppo', '价格', 768);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (198, 'oppo', '功能', 729);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (199, 'oppo', '内存', 683);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (200, 'oppo', '流畅', 647);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (201, 'oppo', '清晰', 611);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (202, 'oppo', '设计', 575);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (203, 'oppo', '质感', 538);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (204, 'oppo', '音质', 512);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (205, 'oppo', '体验', 483);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (206, 'oppo', '售后', 459);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (207, 'oppo', '重量', 436);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (208, 'oppo', '操作', 412);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (209, 'oppo', '颜色', 391);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (210, 'oppo', '分辨率', 371);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (211, 'oppo', '尺寸', 354);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (212, 'oppo', '材质', 338);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (213, 'oppo', '快充', 322);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (214, 'oppo', '指纹', 308);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (215, 'oppo', '面容', 294);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (216, 'oppo', '扬声器', 281);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (217, 'oppo', '摄像头', 267);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (218, 'oppo', '音量', 255);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (219, 'oppo', '稳定', 244);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (220, 'oppo', '反应', 233);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (221, 'oppo', '待机', 221);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (222, 'oppo', '质保', 210);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (223, 'oppo', '清晰度', 199);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (224, 'oppo', '语音', 188);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (225, 'oppo', '握持感', 177);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (226, 'oppo', '快感', 166);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (227, 'oppo', '音效', 155);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (228, 'oppo', '屏占比', 144);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (229, 'oppo', '防水', 133);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (230, 'oppo', '续航能力', 122);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (231, 'oppo', '玻璃', 111);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (232, 'oppo', '高刷', 100);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (233, 'oppo', '动画', 99);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (234, 'oppo', '散热', 88);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (235, 'oppo', '握持', 77);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (236, 'oppo', '握感', 66);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (237, 'oppo', '滑动', 55);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (238, 'oppo', '侧面', 44);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (239, 'oppo', '触摸', 33);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (240, 'oppo', '颜色丰富', 22);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (241, 'oppo', '外观精美', 11);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (242, 'oppo', '操作简单', 10);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (243, 'oppo', '信号好', 9);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (244, 'oppo', '响应快', 8);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (245, 'oppo', '速度快', 7);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (246, 'oppo', '指纹解锁', 6);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (247, 'oppo', '面容解锁', 5);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (248, 'oppo', '面部识别', 4);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (249, 'oppo', '相机', 3);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (250, 'oppo', '摄像', 2);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (251, 'vivo', '拍照', 1392);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (252, 'vivo', '颜值', 1274);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (253, 'vivo', '性能', 1165);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (254, 'vivo', '续航', 1091);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (255, 'vivo', '系统', 976);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (256, 'vivo', '屏幕', 922);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (257, 'vivo', '电池', 868);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (258, 'vivo', '手感', 811);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (259, 'vivo', '质量', 753);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (260, 'vivo', '价格', 698);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (261, 'vivo', '功能', 652);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (262, 'vivo', '内存', 617);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (263, 'vivo', '流畅', 589);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (264, 'vivo', '清晰', 554);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (265, 'vivo', '设计', 518);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (266, 'vivo', '质感', 492);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (267, 'vivo', '音质', 467);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (268, 'vivo', '体验', 448);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (269, 'vivo', '售后', 433);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (270, 'vivo', '重量', 415);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (271, 'vivo', '操作', 396);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (272, 'vivo', '颜色', 381);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (273, 'vivo', '分辨率', 367);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (274, 'vivo', '尺寸', 353);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (275, 'vivo', '材质', 341);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (276, 'vivo', '快充', 329);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (277, 'vivo', '指纹', 318);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (278, 'vivo', '面容', 308);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (279, 'vivo', '扬声器', 298);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (280, 'vivo', '摄像头', 289);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (281, 'vivo', '音量', 277);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (282, 'vivo', '稳定', 265);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (283, 'vivo', '反应', 254);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (284, 'vivo', '待机', 243);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (285, 'vivo', '质保', 231);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (286, 'vivo', '清晰度', 220);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (287, 'vivo', '语音', 209);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (288, 'vivo', '握持感', 198);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (289, 'vivo', '快感', 187);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (290, 'vivo', '音效', 176);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (291, 'vivo', '屏占比', 165);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (292, 'vivo', '防水', 154);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (293, 'vivo', '续航能力', 143);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (294, 'vivo', '玻璃', 132);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (295, 'vivo', '高刷', 121);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (296, 'vivo', '动画', 110);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (297, 'vivo', '散热', 99);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (298, 'vivo', '握持', 88);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (299, 'vivo', '握感', 77);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (300, 'vivo', '滑动', 66);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (301, 'vivo', '侧面', 55);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (302, 'vivo', '触摸', 44);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (303, 'vivo', '颜色丰富', 33);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (304, 'vivo', '外观精美', 22);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (305, 'vivo', '操作简单', 11);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (306, 'vivo', '信号好', 10);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (307, 'vivo', '响应快', 9);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (308, 'vivo', '速度快', 8);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (309, 'vivo', '指纹解锁', 7);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (310, 'vivo', '面容解锁', 6);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (311, 'vivo', '面部识别', 5);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (312, 'vivo', '相机', 4);
INSERT INTO `bys_review` (`id`, `brand`, `word`, `count`) VALUES (313, 'vivo', '摄像', 3);
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (7, 'bys', 'review');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (1, 'contenttypes', '0001_initial', '2024-05-23 17:38:47.585932');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (2, 'auth', '0001_initial', '2024-05-23 17:38:47.759268');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (3, 'admin', '0001_initial', '2024-05-23 17:38:47.791956');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-05-23 17:38:47.797152');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-23 17:38:47.801015');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-05-23 17:38:47.824357');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-05-23 17:38:47.837010');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-05-23 17:38:47.851069');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-05-23 17:38:47.855696');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-05-23 17:38:47.867812');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-05-23 17:38:47.869196');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-23 17:38:47.873281');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-05-23 17:38:47.886049');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-23 17:38:47.898875');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-05-23 17:38:47.911329');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-05-23 17:38:47.915601');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2024-05-23 17:38:47.927863');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (18, 'sessions', '0001_initial', '2024-05-23 17:38:47.943018');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (19, 'bys', '0001_initial', '2024-05-23 18:15:15.678446');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('whms4kfb77pdnsgh1p1nhhxsy8367exn', '.eJxVjEEOgjAQRe_StWlmaMHi0j1naGamU4saSCisjHdXEha6_e-9_zKRtrXEreoSx2QuBs3pd2OSh047SHeabrOVeVqXke2u2INWO8xJn9fD_TsoVMu39kStZs6eWfqOKGfFjD4kpY4QnENgrw46EdLQQgPNGQGQ2z4FL2reHx0COJc:1sACSO:x6fWg8uTyXKRzTrPghrqpjkmrsMJe2WWXpSsIlkjhkQ', '2024-06-06 17:42:24.821001');
COMMIT;

-- ----------------------------
-- Table structure for phone_reviews
-- ----------------------------
DROP TABLE IF EXISTS `phone_reviews`;
CREATE TABLE `phone_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `review_type` double NOT NULL,
  `word` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone_reviews
-- ----------------------------
BEGIN;
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (1, 'Apple', 'iPhone 15 pro Max', 1, '流畅');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (3, 'Apple', 'iPhone 15 pro Max', 1, '手感');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (4, 'Apple', 'iPhone 15 pro Max', 0, '贵');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (5, 'Apple', 'iPhone 15 pro Max', 1, '拍照清晰');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (6, 'Apple', 'iPhone 15 pro Max', 1, '屏幕');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (7, 'Apple', 'iPhone 15 pro Max', 0, '续航');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (8, 'Apple', 'iPhone 15 pro Max', 1, '系统');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (9, 'Apple', 'iPhone 15 pro Max', 1, '音质');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (10, 'Apple', 'iPhone 15 pro Max', 0, '信号');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (11, 'Apple', 'iPhone 15 pro Max', 1, '外观');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (12, 'Apple', 'iPhone 15 pro Max', 1, '流畅');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (13, 'Apple', 'iPhone 15 pro Max', 1, '手感');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (14, 'Apple', 'iPhone 15 pro Max', 0, '贵');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (15, 'Apple', 'iPhone 15 pro Max', 1, '拍照清晰');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (16, 'Apple', 'iPhone 15 pro Max', 1, '屏幕');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (17, 'Apple', 'iPhone 15 pro Max', 0, '续航');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (18, 'Apple', 'iPhone 15 pro Max', 1, '系统');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (19, 'Apple', 'iPhone 15 pro Max', 1, '音质');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (20, 'Apple', 'iPhone 15 pro Max', 0, '信号');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (21, 'Apple', 'iPhone 15 pro Max', 1, '外观');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (22, 'Huawei', 'P50', 1, '功能');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (23, 'Huawei', 'P50', 0, '售后');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (24, 'Huawei', 'P50', 1, '系统');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (25, 'Huawei', 'P50', 1, '屏幕');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (26, 'Huawei', 'P50', 0, '价格');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (27, 'Huawei', 'P50', 1, '外观');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (28, 'Huawei', 'P50', 1, '拍照');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (29, 'Huawei', 'P50', 0, '电池');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (30, 'Huawei', 'P50', 1, '运行');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (31, 'Huawei', 'P50', 1, '音质');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (32, 'Xiaomi', 'Mi 11', 1, '性价比');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (33, 'Xiaomi', 'Mi 11', 0, '发热');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (34, 'Xiaomi', 'Mi 11', 1, '设计');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (35, 'Xiaomi', 'Mi 11', 1, '性能');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (36, 'Xiaomi', 'Mi 11', 0, '售后');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (37, 'Xiaomi', 'Mi 11', 1, '电池');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (38, 'Xiaomi', 'Mi 11', 0, '质量');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (39, 'Xiaomi', 'Mi 11', 1, '屏幕');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (40, 'Xiaomi', 'Mi 11', 1, '系统');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (41, 'Xiaomi', 'Mi 11', 0, '价格');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (42, 'Oppo', 'Find X3', 1, '颜值');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (43, 'Oppo', 'Find X3', 0, '拍照');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (44, 'Oppo', 'Find X3', 1, '手感');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (45, 'Oppo', 'Find X3', 1, '系统');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (46, 'Oppo', 'Find X3', 0, '价格');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (47, 'Oppo', 'Find X3', 1, '音质');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (48, 'Oppo', 'Find X3', 0, '信号');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (49, 'Oppo', 'Find X3', 1, '外观');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (50, 'Oppo', 'Find X3', 1, '运行');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (51, 'Oppo', 'Find X3', 0, '续航');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (52, 'Vivo', 'X60', 1, '性能');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (53, 'Vivo', 'X60', 0, '发热');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (54, 'Vivo', 'X60', 1, '外观');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (55, 'Vivo', 'X60', 1, '拍照');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (56, 'Vivo', 'X60', 0, '售后');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (57, 'Vivo', 'X60', 1, '屏幕');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (58, 'Vivo', 'X60', 0, '价格');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (59, 'Vivo', 'X60', 1, '系统');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (60, 'Vivo', 'X60', 1, '音质');
INSERT INTO `phone_reviews` (`id`, `brand`, `name`, `review_type`, `word`) VALUES (61, 'Vivo', 'X60', 0, '信号');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
