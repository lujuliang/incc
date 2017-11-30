/*
Navicat MySQL Data Transfer

Source Server         : incc
Source Server Version : 50558
Source Host           : localhost:3307
Source Database       : incc

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2017-11-22 22:32:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `approval_info`
-- ----------------------------
DROP TABLE IF EXISTS `approval_info`;
CREATE TABLE `approval_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '审批项目',
  `audit_num` varchar(20) DEFAULT NULL COMMENT '凭证号码',
  `dt_term` varchar(20) DEFAULT NULL COMMENT '有效时间',
  `approv_org` varchar(50) DEFAULT NULL COMMENT '审批机构',
  `user_id` int(11) DEFAULT NULL,
  `pic_path` varchar(512) DEFAULT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `index_approval_info_id` (`id`),
  KEY `index_approval_info_pro_id` (`pro_id`),
  KEY `index_approval_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_info
-- ----------------------------
INSERT INTO `approval_info` VALUES ('1', '1', '国产保健食品行政审批许可', '国食健字G2050544', '2020/6/8', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('2', '2', '国产保健食品行政审批许可', '国食健字G20141188', '2020/6/8', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('3', '3', '国产保健药品行政审批许可', '国食健字G20141189', '2020/6/9', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('4', '4', '国产保健药品行政审批许可', '国食健字G20141190', '2020/6/9', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('5', '5', '国产保健药品行政审批许可', '国药健字G20141190', '2020/6/9', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('17', '16', '国产保健药品行政审批许可', '国药健字G20141120', '2018-12-30', '国家食品药品监督管理总局', '26', null);

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `num` varchar(20) DEFAULT NULL COMMENT '品牌注册证号',
  `author` varchar(100) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_brand_id` (`id`),
  KEY `index_brand_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '态立方', 'R', '14798609', '广东中食营科生物科技有限公司', '1');
INSERT INTO `brand` VALUES ('2', '贝之蓝', 'R', '14798610', '广州贝之蓝儿童用品有限公司', '1');
INSERT INTO `brand` VALUES ('15', '爱他美', 'R', '14798611', 'Milupa', '26');

-- ----------------------------
-- Table structure for `certificate`
-- ----------------------------
DROP TABLE IF EXISTS `certificate`;
CREATE TABLE `certificate` (
  `pro_id` int(10) unsigned NOT NULL,
  `pro_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `produce_name` varchar(100) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `start_dt` varchar(20) DEFAULT NULL,
  `end_dt` varchar(20) DEFAULT NULL,
  `ewm_path` varchar(512) NOT NULL,
  `award_org` varchar(60) DEFAULT NULL COMMENT '颁发机构',
  `award_dt` varchar(20) DEFAULT NULL COMMENT '颁发日期',
  PRIMARY KEY (`pro_id`),
  KEY `index_certificate_pro_id` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of certificate
-- ----------------------------
INSERT INTO `certificate` VALUES ('1', '俪人粉', '广东中食营科生物科技有限公司', '态立方', '2017/08/01', '2018/07/01', 'ewm_1.jpg', '中国保护消费者基金会', '2017-11-08');
INSERT INTO `certificate` VALUES ('2', '达人粉', '广东中食营科生物科技有限公司', '态立方', '2017/08/01', '2018/07/01', 'ewm_2.jpg', '中国保护消费者基金会', '2017-11-08');
INSERT INTO `certificate` VALUES ('3', '全肽粉', '广东中食营科生物科技有限公司', '态立方', '2017/08/01', '2018/07/01', 'ewm_3.jpg', '中国保护消费者基金会', '2017-11-08');
INSERT INTO `certificate` VALUES ('4', '冰洋绽放胶原蛋白肽时光面膜', '广东中食营科生物科技有限公司', '态立方', '2017/08/01', '2018/07/01', 'ewm_4.jpg', '中国保护消费者基金会', '2017-11-08');
INSERT INTO `certificate` VALUES ('5', '安抚奶嘴', '广州贝之蓝儿童用品有限公司', 'Laytex', '2017/08/01', '2018/07/01', 'ewm_5.jpg', '中国保护消费者基金会', '2017-11-08');
INSERT INTO `certificate` VALUES ('16', '爱他美', '德国Milupa Gmbh', '爱他美', '2017-09-01 ', ' 2018-09-01', '16_爱他美.png', '中国保护消费者基金会', '2017-11-21');

-- ----------------------------
-- Table structure for `inspection_info`
-- ----------------------------
DROP TABLE IF EXISTS `inspection_info`;
CREATE TABLE `inspection_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `content` varchar(50) DEFAULT NULL COMMENT '检测指标',
  `insp_org` varchar(60) DEFAULT NULL COMMENT '检测方',
  `result` varchar(30) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_inspection_info_id` (`id`),
  KEY `index_inspection_info_pro_id` (`pro_id`),
  KEY `index_inspection_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inspection_info
-- ----------------------------
INSERT INTO `inspection_info` VALUES ('1', '1', '感官指标', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('2', '1', '水分活度', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('3', '1', '动物双歧杆菌活菌', '国家食品质量监督检验中心', '符合标准', null, '1');
INSERT INTO `inspection_info` VALUES ('4', '1', '黄色葡萄球菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('5', '1', '霉菌酵母菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('6', '1', '肠杆菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('7', '1', '沙门氏菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('8', '1', '重金属', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('9', '2', '感官指标', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('10', '2', '水分活度', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('11', '2', '动物双歧杆菌活菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('12', '2', '黄色葡萄球菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('13', '2', '霉菌酵母菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('14', '3', '肠杆菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('15', '3', '沙门氏菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('16', '3', '重金属', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('17', '4', '感官指标', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('18', '4', '水分活度', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('19', '4', '动物双歧杆菌活菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('20', '4', '黄色葡萄球菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('21', '4', '霉菌酵母菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('22', '4', '肠杆菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('23', '4', '沙门氏菌', '国家食品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('24', '4', '重金属', '国家药品品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('25', '5', '观感', '国家药品品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('26', '5', '锌', '国家药品品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('27', '5', '铅', '国家药品品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('28', '5', '汞', '国家药品品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('29', '5', '砷', '国家药品品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('30', '5', '蒸发残留', '国家药品品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('31', '5', '高锰酸钾', '国家药品品质量监督检验中心', '合格', null, '1');
INSERT INTO `inspection_info` VALUES ('36', '15', '重金属', '检测机构', '合格', null, '25');
INSERT INTO `inspection_info` VALUES ('37', '16', '外观', '国家食品质量监督检验中心', '合格', null, '26');
INSERT INTO `inspection_info` VALUES ('38', '16', '锌', '国家食品质量监督检验中心', '合格', null, '26');
INSERT INTO `inspection_info` VALUES ('39', '16', '铅', '国家食品质量监督检验中心', '合格', null, '26');
INSERT INTO `inspection_info` VALUES ('40', '16', '砷', '国家食品质量监督检验中心', '合格', null, '26');

-- ----------------------------
-- Table structure for `i_log`
-- ----------------------------
DROP TABLE IF EXISTS `i_log`;
CREATE TABLE `i_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '操作用户',
  `type` tinyint(4) NOT NULL COMMENT '操作类型(0操作日志;1异常日志)',
  `url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `method` varchar(255) NOT NULL COMMENT '执行方法',
  `params` text COMMENT '请求参数',
  `requestip` varchar(255) NOT NULL COMMENT '请求IP',
  `description` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `detail` text COMMENT '异常详情',
  `oper_date` datetime NOT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of i_log
-- ----------------------------

-- ----------------------------
-- Table structure for `management`
-- ----------------------------
DROP TABLE IF EXISTS `management`;
CREATE TABLE `management` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `start_dt` varchar(20) DEFAULT NULL,
  `end_dt` varchar(20) DEFAULT NULL,
  `permit` varchar(60) DEFAULT NULL COMMENT '保健食品生产销售行政许可',
  `credit_code` varchar(30) DEFAULT NULL COMMENT '社会统一信用代码',
  `user_id` int(11) DEFAULT NULL,
  `create_dt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_management_id` (`id`),
  KEY `index_management_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of management
-- ----------------------------
INSERT INTO `management` VALUES ('1', '广东中食营科生物科技有限公司', '2011-06-10', '2041-06-10', 'GD-FDA健证字（2014）第1900S0593号', '91441900576479704U', '1', '2017-11-08');
INSERT INTO `management` VALUES ('2', '广州贝之蓝儿童用品有限公司', '2011-06-10', '2041-06-10', 'GD-FDA健证字（2014）第1900S0594号', '91441900576479704U', '1', '2017-11-08');
INSERT INTO `management` VALUES ('14', '婴贝儿', '2017-07-01', '2040-10-10', 'GD-FDA健证字（2014）第1900S0595号', '91441900576479704U', '26', '2017-11-21 21:36:07');

-- ----------------------------
-- Table structure for `producer`
-- ----------------------------
DROP TABLE IF EXISTS `producer`;
CREATE TABLE `producer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `start_dt` varchar(20) DEFAULT NULL,
  `end_dt` varchar(20) DEFAULT NULL,
  `permit` varchar(60) DEFAULT NULL COMMENT '保健食品生产销售行政许可',
  `credit_code` varchar(30) DEFAULT NULL COMMENT '社会统一信用代码',
  `user_id` int(11) DEFAULT NULL,
  `create_dt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_producer_id` (`id`),
  KEY `index_producer_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producer
-- ----------------------------
INSERT INTO `producer` VALUES ('1', '广东中食营科生物科技有限公司', '2011-06-10', '2041-06-10', 'GD-FDA健证字（2014）第1900S0593号', '91441900576479704U', '1', '2017-11-08');
INSERT INTO `producer` VALUES ('2', '广州贝之蓝儿童用品有限公司', '2011/6/10', '2041/6/10', 'GD-FDA健证字（2014）第1900S0594号', '48379592927888704F', '1', '2017/11/8');
INSERT INTO `producer` VALUES ('16', '德国Milupa Gmbh', '2010-11-21', '2040-10-01', 'GD-FDA健证字（2014）第1900S0595号', '48379592927888704F', '26', '2017-11-21 21:36:07');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(60) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `management_id` int(10) unsigned NOT NULL COMMENT '经营主体',
  `brand_id` int(10) unsigned NOT NULL,
  `produce_id` int(10) unsigned NOT NULL COMMENT '生产主体',
  `start_dt` varchar(20) DEFAULT NULL,
  `end_dt` varchar(20) DEFAULT NULL,
  `pic_path` varchar(512) DEFAULT NULL COMMENT '产品图片',
  `status` varchar(10) DEFAULT NULL COMMENT '审批状态:new新录入， progress提交申请 ，pass通过， nopass未通过，term失效',
  `user_id` int(11) DEFAULT NULL COMMENT '录入人',
  `create_dt` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `inspection_report_path` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_product_produce_id` (`produce_id`),
  KEY `index_product_man_id` (`management_id`),
  KEY `index_product_user_id` (`user_id`),
  KEY `fk_product_brand_id` (`brand_id`),
  KEY `id` (`id`),
  CONSTRAINT `fk_product_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_product_management_id` FOREIGN KEY (`management_id`) REFERENCES `management` (`id`),
  CONSTRAINT `fk_product_produce_id` FOREIGN KEY (`produce_id`) REFERENCES `producer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '俪人粉', '国产保健食品', '1', '1', '1', '2017/08/01', '2018/07/01', '1.jpg', 'pass', '1', '2017/11/08', 'ins_1.jpg');
INSERT INTO `product` VALUES ('2', '达人粉', '国产保健食品', '1', '1', '1', '2017/08/01', '2018/07/01', '2.png', 'pass', '1', '2017/11/08', 'ins_1.jpg');
INSERT INTO `product` VALUES ('3', '全肽粉', '国产保健食品', '1', '1', '1', '2017/08/01', '2018/07/01', '3.jpg', 'pass', '1', '2017/11/08', 'ins_1.jpg');
INSERT INTO `product` VALUES ('4', '冰洋绽放胶原蛋白肽时光面膜', '国产保健用品', '1', '1', '1', '2017/08/01', '2018/07/01', '4.jpg', 'pass', '1', '2017/11/08', 'ins_4.jpg');
INSERT INTO `product` VALUES ('5', '安抚奶嘴', '母婴用品', '2', '2', '2', '2017/08/01', '2018/07/01', '5.jpg', 'pass', '24', '2017/11/08', 'ins_5.jpg');
INSERT INTO `product` VALUES ('16', '爱他美', '奶粉', '14', '15', '16', '2017-09-01', '2018-09-01', '26_670386_timg.jpg', 'pass', '26', '2017-11-21 21:36:07', '26_827758_timg.jpg');

-- ----------------------------
-- Table structure for `sys_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '资源名称',
  `resUrl` varchar(255) DEFAULT NULL COMMENT '资源url',
  `type` int(11) DEFAULT NULL COMMENT '资源类型   1:菜单    2：按钮',
  `parentId` int(11) DEFAULT NULL COMMENT '父资源',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', '系统设置', '/system', '0', '0', '1');
INSERT INTO `sys_resources` VALUES ('2', '用户管理', '/usersPage', '1', '1', '2');
INSERT INTO `sys_resources` VALUES ('3', '角色管理', '/rolesPage', '1', '1', '3');
INSERT INTO `sys_resources` VALUES ('4', '资源管理', '/resourcesPage', '1', '1', '4');
INSERT INTO `sys_resources` VALUES ('5', '添加用户', '/users/add', '2', '2', '5');
INSERT INTO `sys_resources` VALUES ('6', '删除用户', '/users/delete', '2', '2', '6');
INSERT INTO `sys_resources` VALUES ('7', '添加角色', '/roles/add', '2', '3', '7');
INSERT INTO `sys_resources` VALUES ('8', '删除角色', '/roles/delete', '2', '3', '8');
INSERT INTO `sys_resources` VALUES ('9', '添加资源', '/resources/add', '2', '4', '9');
INSERT INTO `sys_resources` VALUES ('10', '删除资源', '/resources/delete', '2', '4', '10');
INSERT INTO `sys_resources` VALUES ('11', '分配角色', '/users/saveUserRoles', '2', '2', '11');
INSERT INTO `sys_resources` VALUES ('13', '分配权限', '/roles/saveRoleResources', '2', '3', '12');
INSERT INTO `sys_resources` VALUES ('14', '认证审批', '/approvalPage', '1', '1', '13');
INSERT INTO `sys_resources` VALUES ('15', '生产主体', '/producer', '1', '1', '14');
INSERT INTO `sys_resources` VALUES ('16', '经营主体', '/management', '1', '1', '15');
INSERT INTO `sys_resources` VALUES ('17', '品牌信息', '/brand', '1', '1', '16');
INSERT INTO `sys_resources` VALUES ('18', '商品管理', '/productPage', '1', '1', '17');
INSERT INTO `sys_resources` VALUES ('19', '商品检测管理', '/inspectionInfoPage', '1', '1', '18');
INSERT INTO `sys_resources` VALUES ('20', '行政许可管理', '/approvalInfoPage', '1', '1', '19');
INSERT INTO `sys_resources` VALUES ('21', '资质管理', '/certificatePage', '1', '1', '20');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员');
INSERT INTO `sys_role` VALUES ('3', '管理员');
INSERT INTO `sys_role` VALUES ('5', 'INCC');
INSERT INTO `sys_role` VALUES ('6', '会员');

-- ----------------------------
-- Table structure for `sys_role_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `roleId` int(11) NOT NULL,
  `resourcesId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`resourcesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES ('1', '2');
INSERT INTO `sys_role_resources` VALUES ('1', '3');
INSERT INTO `sys_role_resources` VALUES ('1', '4');
INSERT INTO `sys_role_resources` VALUES ('1', '5');
INSERT INTO `sys_role_resources` VALUES ('1', '6');
INSERT INTO `sys_role_resources` VALUES ('1', '7');
INSERT INTO `sys_role_resources` VALUES ('1', '8');
INSERT INTO `sys_role_resources` VALUES ('1', '9');
INSERT INTO `sys_role_resources` VALUES ('1', '10');
INSERT INTO `sys_role_resources` VALUES ('1', '11');
INSERT INTO `sys_role_resources` VALUES ('1', '13');
INSERT INTO `sys_role_resources` VALUES ('1', '14');
INSERT INTO `sys_role_resources` VALUES ('1', '15');
INSERT INTO `sys_role_resources` VALUES ('1', '16');
INSERT INTO `sys_role_resources` VALUES ('1', '17');
INSERT INTO `sys_role_resources` VALUES ('1', '18');
INSERT INTO `sys_role_resources` VALUES ('3', '2');
INSERT INTO `sys_role_resources` VALUES ('3', '3');
INSERT INTO `sys_role_resources` VALUES ('3', '4');
INSERT INTO `sys_role_resources` VALUES ('3', '5');
INSERT INTO `sys_role_resources` VALUES ('3', '6');
INSERT INTO `sys_role_resources` VALUES ('3', '7');
INSERT INTO `sys_role_resources` VALUES ('3', '8');
INSERT INTO `sys_role_resources` VALUES ('3', '9');
INSERT INTO `sys_role_resources` VALUES ('3', '10');
INSERT INTO `sys_role_resources` VALUES ('3', '11');
INSERT INTO `sys_role_resources` VALUES ('3', '13');
INSERT INTO `sys_role_resources` VALUES ('3', '14');
INSERT INTO `sys_role_resources` VALUES ('3', '15');
INSERT INTO `sys_role_resources` VALUES ('3', '16');
INSERT INTO `sys_role_resources` VALUES ('3', '17');
INSERT INTO `sys_role_resources` VALUES ('3', '18');
INSERT INTO `sys_role_resources` VALUES ('5', '14');
INSERT INTO `sys_role_resources` VALUES ('5', '21');
INSERT INTO `sys_role_resources` VALUES ('6', '18');
INSERT INTO `sys_role_resources` VALUES ('9', '9');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(33) DEFAULT NULL,
  `password` varchar(33) DEFAULT NULL,
  `enable` int(10) DEFAULT '1' COMMENT '是否启用',
  `type` int(10) DEFAULT NULL COMMENT '0:enterprises user,1 system user',
  `email` varchar(60) DEFAULT NULL,
  `telnum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '3ef7164d1f6167cb9f2658c07d3c2f0a', '1', '1', null, null);
INSERT INTO `sys_user` VALUES ('24', 'incc', '437a3645fd80b0ca5e922586735d533d', '1', '1', null, null);
INSERT INTO `sys_user` VALUES ('25', 'peter', '923ad5ea7b2c91edf25295c67b4511fb', '1', '0', 'peter@163.com', '18766165023');
INSERT INTO `sys_user` VALUES ('26', 'eden', 'a5e963a0f11f662abb99cdd14c13abc1', '1', '0', 'eden@163.com', '13156191001');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('23', '2');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('24', '5');
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '3');
INSERT INTO `sys_user_role` VALUES ('29', '6');
INSERT INTO `sys_user_role` VALUES ('30', '6');
INSERT INTO `sys_user_role` VALUES ('31', '6');
INSERT INTO `sys_user_role` VALUES ('25', '6');
INSERT INTO `sys_user_role` VALUES ('26', '6');
