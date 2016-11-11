/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : yiju

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2016-08-24 15:24:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL COMMENT '发布者的id',
  `hid` int(11) DEFAULT NULL COMMENT '房子的id',
  `addtime` varchar(100) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='收藏列表';

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('2', '2', '2', '2016/08/23 09:22:25');
INSERT INTO `collect` VALUES ('3', '2', '56', '2016/08/24 10:44:42');
INSERT INTO `collect` VALUES ('4', '2', '57', '2016/08/24 10:44:52');
INSERT INTO `collect` VALUES ('5', '2', '62', '2016/08/24 10:45:01');
INSERT INTO `collect` VALUES ('6', '2', '63', '2016/08/24 10:45:09');

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL COMMENT '房东id',
  `type` varchar(20) DEFAULT NULL COMMENT '房东类型如经纪人，个人房源',
  `price` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '状态1代表出售完，状态0代表正在出售',
  `photo` varchar(200) DEFAULT NULL COMMENT '房子图片',
  `hdescribe` varchar(600) DEFAULT NULL COMMENT '房子整体描述',
  `address` varchar(500) DEFAULT NULL COMMENT '房子详细地址',
  `villageName` varchar(100) DEFAULT NULL COMMENT '房子小区名字',
  `area` varchar(100) DEFAULT NULL COMMENT '房子所在区域',
  `room` varchar(100) DEFAULT NULL COMMENT '房子的厅室',
  `features` varchar(200) DEFAULT NULL COMMENT '房屋特色特点',
  `furniture` varchar(600) DEFAULT NULL COMMENT '房屋设备家具',
  `paymethod` varchar(200) DEFAULT NULL COMMENT '支付方法，交三押一等',
  `floor` varchar(200) DEFAULT NULL COMMENT '所在楼层',
  `countfloor` varchar(60) DEFAULT NULL COMMENT '房子总共楼层',
  `rentway` varchar(200) DEFAULT NULL COMMENT '租赁方法分为整租合租等',
  `linkman` varchar(60) DEFAULT NULL COMMENT '房子联系人姓名',
  `linkphone` varchar(60) DEFAULT NULL COMMENT '电话号码',
  `tittle` varchar(300) DEFAULT NULL,
  `addtime` varchar(30) DEFAULT NULL COMMENT '发布时间',
  `top` int(11) DEFAULT '0' COMMENT '0不是推荐房源，1是推荐房源',
  `direction` varchar(20) DEFAULT NULL COMMENT '方向',
  `hlevel` varchar(30) DEFAULT '' COMMENT '装修层次精装修',
  `hcondition` varchar(200) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL COMMENT '区域',
  `shi` varchar(20) DEFAULT NULL,
  `hlongitude` varchar(100) DEFAULT NULL COMMENT '经度',
  `hlatitude` varchar(100) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='房子信息';

-- ----------------------------
-- Records of houses
-- ----------------------------
INSERT INTO `houses` VALUES ('56', '5', '个人', '5000', '0', '14714190269350.png,14714190269361.png', null, '郑州市金水区中恒都市花园', '中恒都市花园', '89', '2室2厅1卫', '交通便利', '床,衣柜,沙发,书桌,电视,冰箱,微波炉,电磁炉,洗衣机,空调,热水器,宽带', '押一付三', '15', '26', '押一付三', '王先生', '18338765331', '南北通透 家具齐全 价格优惠 房屋干净', '2016/08/17 15:30:26', '0', '南', '精装修', '中恒都市花园2室2厅1卫', null, '1', null, null);
INSERT INTO `houses` VALUES ('57', '5', '个人', '6000', '0', '14714191327790.png,14714191327811.png', null, '郑州市高新区', '天使花园', '98', '1室3厅1卫', '家具齐全', '床,衣柜,沙发,书桌,电视', '押一付三', '1', '6', '押一付三', '张先生', '18338765331', '简单实惠', '2016/08/17 15:32:12', '0', '南', '精装修', '天使花园1室3厅1卫', null, '1', null, null);
INSERT INTO `houses` VALUES ('61', '2', '', '4000', '0', '14718537817280.png,14718537817291.png,14718537817312.png', null, '郑州市南山区', '芒果大厦', '230', '2室3厅2卫', '交通便利', '床,衣柜,沙发,热水器', '押一付三', '23', '43', '', '李先生', '13645678945', '干净卫生', '2016/08/22 16:16:21', '1', '南', '精装修', '芒果大厦2室3厅2卫', null, '2', null, null);
INSERT INTO `houses` VALUES ('62', '2', '', '7000', '0', '14719155782700.png,14719155782711.png,14719155782722.png', null, '郑州市金水区', '温馨家园', '230', '1室4厅2卫', '交通便利', '床,衣柜,沙发,书桌', '押一付三', '2', '7', '', '王先生', '18338765331', '交通便利', '2016/08/23 09:26:18', '1', '南', '精装修', '温馨家园1室4厅2卫', null, '1', null, null);
INSERT INTO `houses` VALUES ('63', '2', '', '1500', '0', '14719356527520.png,14719356527531.png,14719356527542.png', null, '郑州市郑东新区', '温馨家园', '90', '1室2厅1卫', '交通便利 环境优美', '床,衣柜,沙发,洗衣机,空调,热水器', '押一付三', '2', '7', '', '张先生', '18338765331', '交通便利', '2016/08/23 15:00:52', '1', '南', '精装修', '温馨家园1室2厅1卫', null, '1', null, null);
INSERT INTO `houses` VALUES ('64', '2', '', '4000', '0', '14720107329690.png,14720107329701.png,14720107329712.png', null, '郑州市金水区花园路', '皇家小区', '130', '1室3厅1卫', '交通便利 干净卫生', '床,衣柜,沙发,热水器', '押一付三', '2', '7', '', '赵先生', '18338765331', '交通便利', '2016/08/24 11:52:12', '1', '南', '精装修', '皇家小区1室3厅1卫', null, '1', null, null);
INSERT INTO `houses` VALUES ('65', '2', '', '6000', '0', '14720110693200.png,14720110693211.png,14720110693222.png', null, '郑州市金水区红专路', '芒果小区', '230', '4室1厅2卫', '交通便利 环境优美', '床,衣柜,沙发,空调,热水器', '押一付二', '3', '23', '', '张先生', '18695678951', '交通便利 环境优美', '2016/08/24 11:57:49', '1', '南', '精装修', '芒果小区4室1厅2卫', null, '4', null, null);

-- ----------------------------
-- Table structure for landlord
-- ----------------------------
DROP TABLE IF EXISTS `landlord`;
CREATE TABLE `landlord` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(20) DEFAULT NULL,
  `lpassword` varchar(20) DEFAULT NULL,
  `ltype` varchar(20) DEFAULT NULL,
  `permissions` int(11) DEFAULT NULL,
  `addtime` varchar(20) DEFAULT NULL COMMENT '申请时间',
  `lphone` varchar(20) DEFAULT NULL,
  `lemail` varchar(30) DEFAULT NULL,
  `lphoto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='房主信息\r\n';

-- ----------------------------
-- Records of landlord
-- ----------------------------
INSERT INTO `landlord` VALUES ('1', '123', '12313', null, null, null, '1231', '123', null);
INSERT INTO `landlord` VALUES ('2', 'admin', '123456', null, null, null, '1231', '123', '1471915684709.png');
INSERT INTO `landlord` VALUES ('4', 'wjq', '123456', null, null, null, '123456', '123456', null);
INSERT INTO `landlord` VALUES ('5', '123', '123456', null, null, null, '1212', '212', null);
INSERT INTO `landlord` VALUES ('6', '1', '1', null, null, null, '1', '1', null);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mName` varchar(20) DEFAULT NULL,
  `mPassword` varchar(20) DEFAULT NULL,
  `permissions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息';

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for renter
-- ----------------------------
DROP TABLE IF EXISTS `renter`;
CREATE TABLE `renter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rName` varchar(20) DEFAULT NULL,
  `rPassword` varchar(20) DEFAULT NULL,
  `rSex` varchar(20) DEFAULT NULL,
  `permissions` int(11) DEFAULT NULL,
  `rphoto` varchar(60) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租客信息';

-- ----------------------------
-- Records of renter
-- ----------------------------
