/*
Navicat MySQL Data Transfer

Source Server         : incc
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : incc

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2017-11-15 21:27:31
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
  KEY `index_approval_user_id` (`user_id`),
  CONSTRAINT `fk_approval_info_product_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval_info
-- ----------------------------
INSERT INTO `approval_info` VALUES ('1', '1', '国产保健食品行政审批许可', '国食健字G2050544', '2020/6/8', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('2', '2', '国产保健食品行政审批许可', '国食健字G20141188', '2020/6/8', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('3', '3', '国产保健药品行政审批许可', '国食健字G20141189', '2020/6/9', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('4', '4', '国产保健药品行政审批许可', '国食健字G20141190', '2020/6/9', '国家食品药品监督管理总局', '1', null);
INSERT INTO `approval_info` VALUES ('5', '5', '国产保健药品行政审批许可', '国药健字G20141190', '2020/6/9', '国家食品药品监督管理总局', '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '态立方', 'R', '14798609', '广东中食营科生物科技有限公司', '1');
INSERT INTO `brand` VALUES ('2', '贝之蓝', 'R', '14798610', '广州贝之蓝儿童用品有限公司', '1');

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
  KEY `index_inspection_user_id` (`user_id`),
  CONSTRAINT `fk_inspection_info_pro_id_product` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2851 DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of i_log
-- ----------------------------
INSERT INTO `i_log` VALUES ('1', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-02 17:15:34');
INSERT INTO `i_log` VALUES ('2', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 17:16:12');
INSERT INTO `i_log` VALUES ('3', 'admin', '0', '/boot/admin/main', 'com.xe.demo.controller.LoginController.main()', '{loginIp=192.168.0.200}', '192.168.0.200', '进入主界面', null, '2017-05-02 17:16:12');
INSERT INTO `i_log` VALUES ('2531', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-02 17:17:21');
INSERT INTO `i_log` VALUES ('2532', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 17:17:55');
INSERT INTO `i_log` VALUES ('2533', 'admin', '0', '/boot/admin/main', 'com.xe.demo.controller.LoginController.main()', '{loginIp=192.168.0.200}', '192.168.0.200', '进入主界面', null, '2017-05-02 17:17:57');
INSERT INTO `i_log` VALUES ('2534', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-02 17:18:08');
INSERT INTO `i_log` VALUES ('2535', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 17:32:12');
INSERT INTO `i_log` VALUES ('2536', 'admin', '0', '/boot/admin/main', 'com.xe.demo.controller.LoginController.main()', '{loginIp=192.168.0.200}', '192.168.0.200', '进入主界面', null, '2017-05-02 17:32:17');
INSERT INTO `i_log` VALUES ('2537', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-02 17:32:43');
INSERT INTO `i_log` VALUES ('2538', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 17:37:27');
INSERT INTO `i_log` VALUES ('2539', 'admin', '0', '/boot/admin/main', 'com.xe.demo.controller.LoginController.main()', '{loginIp=192.168.0.200}', '192.168.0.200', '进入主界面', null, '2017-05-02 17:37:27');
INSERT INTO `i_log` VALUES ('2540', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-02 17:37:33');
INSERT INTO `i_log` VALUES ('2541', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 17:38:56');
INSERT INTO `i_log` VALUES ('2542', 'admin', '0', '/boot/admin/main', 'com.xe.demo.controller.LoginController.main()', '{loginIp=192.168.0.200}', '192.168.0.200', '进入主界面', null, '2017-05-02 17:38:56');
INSERT INTO `i_log` VALUES ('2543', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 18:19:39');
INSERT INTO `i_log` VALUES ('2544', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-02 18:19:42');
INSERT INTO `i_log` VALUES ('2545', 'admin', '0', '/boot/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-02 18:19:43');
INSERT INTO `i_log` VALUES ('2546', 'admin', '0', '/boot/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询权限列表', null, '2017-05-02 18:19:44');
INSERT INTO `i_log` VALUES ('2547', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-02 18:19:46');
INSERT INTO `i_log` VALUES ('2548', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-02 18:19:47');
INSERT INTO `i_log` VALUES ('2549', 'admin', '0', '/boot/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-02 18:20:59');
INSERT INTO `i_log` VALUES ('2550', 'admin', '0', '/boot/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-02 18:21:17');
INSERT INTO `i_log` VALUES ('2551', 'admin', '1', '/boot/admin/role/queryPage', 'com.xe.demo.service.RoleService.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '分页查询', '/ by zero', '2017-05-02 18:21:17');
INSERT INTO `i_log` VALUES ('2552', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 18:33:29');
INSERT INTO `i_log` VALUES ('2553', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:34:20');
INSERT INTO `i_log` VALUES ('2554', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=2, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:34:24');
INSERT INTO `i_log` VALUES ('2555', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=3, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:34:27');
INSERT INTO `i_log` VALUES ('2556', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=100}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:34:32');
INSERT INTO `i_log` VALUES ('2557', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:41:38');
INSERT INTO `i_log` VALUES ('2558', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:42:02');
INSERT INTO `i_log` VALUES ('2559', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:42:20');
INSERT INTO `i_log` VALUES ('2560', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:44:00');
INSERT INTO `i_log` VALUES ('2561', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:45:25');
INSERT INTO `i_log` VALUES ('2562', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:45:37');
INSERT INTO `i_log` VALUES ('2563', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-02 18:46:00');
INSERT INTO `i_log` VALUES ('2564', 'admin', '0', '/boot/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询权限列表', null, '2017-05-02 18:46:02');
INSERT INTO `i_log` VALUES ('2565', 'admin', '0', '/boot/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-02 18:46:04');
INSERT INTO `i_log` VALUES ('2566', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:46:05');
INSERT INTO `i_log` VALUES ('2567', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:46:56');
INSERT INTO `i_log` VALUES ('2568', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:51:19');
INSERT INTO `i_log` VALUES ('2569', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:51:47');
INSERT INTO `i_log` VALUES ('2570', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:51:53');
INSERT INTO `i_log` VALUES ('2571', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=0}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:51:56');
INSERT INTO `i_log` VALUES ('2572', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=1}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:51:58');
INSERT INTO `i_log` VALUES ('2573', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:51:59');
INSERT INTO `i_log` VALUES ('2574', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10, username=匿}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:52:10');
INSERT INTO `i_log` VALUES ('2575', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:52:23');
INSERT INTO `i_log` VALUES ('2576', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10, username=admin}', '192.168.0.200', '查询日志列表', null, '2017-05-02 18:52:26');
INSERT INTO `i_log` VALUES ('2577', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 20:38:41');
INSERT INTO `i_log` VALUES ('2578', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-02 20:38:44');
INSERT INTO `i_log` VALUES ('2579', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-02 20:38:48');
INSERT INTO `i_log` VALUES ('2580', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-02 20:45:19');
INSERT INTO `i_log` VALUES ('2581', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-02 20:45:23');
INSERT INTO `i_log` VALUES ('2582', 'admin', '0', '/boot/admin/tech/updateArticle', 'com.xe.demo.controller.TechController.updateArticle()', '{cover=/upload/20170502/8ff6b7e9-39fb-46ba-9ad5-aaa7d7888fee.jpg, uid=0, color=#2b2b32, loginIp=192.168.0.200, title=测试, content=<p>测试测试<br/></p>}', '192.168.0.200', '修改文章', null, '2017-05-02 20:45:52');
INSERT INTO `i_log` VALUES ('2583', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-02 20:47:19');
INSERT INTO `i_log` VALUES ('2584', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-02 20:47:25');
INSERT INTO `i_log` VALUES ('2585', 'admin', '0', '/boot/admin/tech/updateArticle', 'com.xe.demo.controller.TechController.updateArticle()', '{cover=/upload/20170502/15a2e757-0c6e-430e-8b8b-c949238ed17b.jpg, uid=18, color=#2b2b32, loginIp=192.168.0.200, id=2, title=测试, content=<pre>岗位职责：\r\n1．负责公司整体ios产品的整体架构设计，完成IOS平台手机软件的需求、设计、编码和自测工作；\r\n2．根据软件设计规范，开发基于iphone/ipad平台的应用程序；\r\n3．协同后台开发人员实现产品界面和功能与后台的交互；\r\n4．配合产品经理、UI设计师，研究并改善用户体验；\r\n\r\n任职要求：\r\n1、熟悉Object-C中MVC，封装，多态，委托代理，单例，Block，观察者等设计模式；\r\n2、熟悉iOS的内存管理机制和多线程开发，熟练运用GCD、NSOperation、NSThread等；\r\n3、具有良好的代码编程管理习惯，有独立分析问题和解决问题的能力；\r\n4、精通iOS下的并行开发、网络、内存管理、GUI开发等技术；\r\n5、精通iOS的消息传递机制，delegate，block，通知，推送等等；\r\n6、掌握iOS网络通信机制；熟悉http、tcp、socket等网络编程；\r\n7、了解iOS开发环境，对iOS与第三方平台开发接口的配合，有广泛深入的了解；\r\n8、具备良好的项目进度把控能力，能够独立承担项目任务，分析解决问题；\r\n9、对移动产品的用户体验有一定经验者优先。</pre><p><br/></p>}', '192.168.0.200', '修改文章', null, '2017-05-02 20:50:10');
INSERT INTO `i_log` VALUES ('2586', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-02 20:50:10');
INSERT INTO `i_log` VALUES ('2587', 'admin', '0', '/boot/admin/tech/updateArticle', 'com.xe.demo.controller.TechController.updateArticle()', '{cover=/upload/20170502/15a2e757-0c6e-430e-8b8b-c949238ed17b.jpg, uid=18, color=#2b2b32, loginIp=192.168.0.200, id=2, title=测试, content=<pre>岗位职责：\r\n1．负责公司整体ios产品的整体架构设计，完成IOS平台手机软件的需求、设计、编码和自测工作；\r\n2．根据软件设计规范，开发基于iphone/ipad平台的应用程序；\r\n3．协同后台开发人员实现产品界面和功能与后台的交互；\r\n4．配合产品经理、UI设计师，研究并改善用户体验；\r\n\r\n任职要求：\r\n1、熟悉Object-C中MVC，封装，多态，委托代理，单例，Block，观察者等设计模式；\r\n2、熟悉iOS的内存管理机制和多线程开发，熟练运用GCD、NSOperation、NSThread等；\r\n3、具有良好的代码编程管理习惯，有独立分析问题和解决问题的能力；\r\n4、精通iOS下的并行开发、网络、内存管理、GUI开发等技术；\r\n5、精通iOS的消息传递机制，delegate，block，通知，推送等等；\r\n6、掌握iOS网络通信机制；熟悉http、tcp、socket等网络编程；\r\n7、了解iOS开发环境，对iOS与第三方平台开发接口的配合，有广泛深入的了解；\r\n8、具备良好的项目进度把控能力，能够独立承担项目任务，分析解决问题；\r\n9、对移动产品的用户体验有一定经验者优先。</pre><p><img src=\"/upload/20170502/631e6117-e726-4f33-8056-d54b792615ee.jpg\" title=\"\" alt=\"\"/></p>}', '192.168.0.200', '修改文章', null, '2017-05-02 20:50:39');
INSERT INTO `i_log` VALUES ('2588', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-02 20:50:39');
INSERT INTO `i_log` VALUES ('2589', 'admin', '0', '/boot/admin/tech/updateArticle', 'com.xe.demo.controller.TechController.updateArticle()', '{cover=/upload/20170502/7ff39476-f154-4511-abd1-4248c6a546d7.jpg, uid=18, color=#2b2b32, loginIp=192.168.0.200, id=1, title=测试, content=<p>测试测试</p><p><img src=\"/upload/20170502/c7821f6d-9164-4dfd-88ff-cee1299144f6.jpg\"/></p><p><img src=\"/upload/20170502/f1a4efb2-b1ba-4ecf-a9df-9450952d36ab.jpg\"/></p><p><br/></p>}', '192.168.0.200', '修改文章', null, '2017-05-02 20:51:19');
INSERT INTO `i_log` VALUES ('2590', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-02 20:51:19');
INSERT INTO `i_log` VALUES ('2591', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-03 09:43:25');
INSERT INTO `i_log` VALUES ('2592', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-03 09:43:31');
INSERT INTO `i_log` VALUES ('2593', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-03 09:43:37');
INSERT INTO `i_log` VALUES ('2594', 'admin', '0', '/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-03 09:43:39');
INSERT INTO `i_log` VALUES ('2595', 'admin', '0', '/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=1}', '192.168.0.200', '查询日志列表', null, '2017-05-03 09:43:47');
INSERT INTO `i_log` VALUES ('2596', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 09:47:46');
INSERT INTO `i_log` VALUES ('2597', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询用户列表', null, '2017-05-03 09:47:51');
INSERT INTO `i_log` VALUES ('2598', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文章列表', null, '2017-05-03 09:48:24');
INSERT INTO `i_log` VALUES ('2599', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 09:48:26');
INSERT INTO `i_log` VALUES ('2600', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文章列表', null, '2017-05-03 09:48:31');
INSERT INTO `i_log` VALUES ('2601', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询用户列表', null, '2017-05-03 10:19:26');
INSERT INTO `i_log` VALUES ('2602', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 10:19:28');
INSERT INTO `i_log` VALUES ('2603', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 10:26:45');
INSERT INTO `i_log` VALUES ('2604', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 10:26:49');
INSERT INTO `i_log` VALUES ('2605', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 10:28:32');
INSERT INTO `i_log` VALUES ('2606', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 10:30:41');
INSERT INTO `i_log` VALUES ('2607', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 10:30:45');
INSERT INTO `i_log` VALUES ('2608', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文章列表', null, '2017-05-03 10:33:51');
INSERT INTO `i_log` VALUES ('2609', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 10:34:29');
INSERT INTO `i_log` VALUES ('2610', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询日志列表', null, '2017-05-03 10:34:35');
INSERT INTO `i_log` VALUES ('2611', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=2, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询日志列表', null, '2017-05-03 10:34:44');
INSERT INTO `i_log` VALUES ('2612', 'admin', '0', '/boot/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询日志列表', null, '2017-05-03 10:34:45');
INSERT INTO `i_log` VALUES ('2613', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 10:41:29');
INSERT INTO `i_log` VALUES ('2614', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询用户列表', null, '2017-05-03 10:42:16');
INSERT INTO `i_log` VALUES ('2615', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=127.0.0.1}', '127.0.0.1', '退出', null, '2017-05-03 10:42:22');
INSERT INTO `i_log` VALUES ('2616', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 11:25:39');
INSERT INTO `i_log` VALUES ('2617', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 11:28:15');
INSERT INTO `i_log` VALUES ('2618', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 13:45:06');
INSERT INTO `i_log` VALUES ('2619', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 13:45:15');
INSERT INTO `i_log` VALUES ('2620', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:17');
INSERT INTO `i_log` VALUES ('2621', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:19');
INSERT INTO `i_log` VALUES ('2622', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:19');
INSERT INTO `i_log` VALUES ('2623', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:19');
INSERT INTO `i_log` VALUES ('2624', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:19');
INSERT INTO `i_log` VALUES ('2625', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:19');
INSERT INTO `i_log` VALUES ('2626', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:20');
INSERT INTO `i_log` VALUES ('2627', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:20');
INSERT INTO `i_log` VALUES ('2628', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:20');
INSERT INTO `i_log` VALUES ('2629', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:20');
INSERT INTO `i_log` VALUES ('2630', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:20');
INSERT INTO `i_log` VALUES ('2631', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:21');
INSERT INTO `i_log` VALUES ('2632', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:21');
INSERT INTO `i_log` VALUES ('2633', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:21');
INSERT INTO `i_log` VALUES ('2634', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:21');
INSERT INTO `i_log` VALUES ('2635', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:21');
INSERT INTO `i_log` VALUES ('2636', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:22');
INSERT INTO `i_log` VALUES ('2637', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:22');
INSERT INTO `i_log` VALUES ('2638', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:22');
INSERT INTO `i_log` VALUES ('2639', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:22');
INSERT INTO `i_log` VALUES ('2640', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:22');
INSERT INTO `i_log` VALUES ('2641', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:23');
INSERT INTO `i_log` VALUES ('2642', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:23');
INSERT INTO `i_log` VALUES ('2643', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:23');
INSERT INTO `i_log` VALUES ('2644', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:23');
INSERT INTO `i_log` VALUES ('2645', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:23');
INSERT INTO `i_log` VALUES ('2646', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:23');
INSERT INTO `i_log` VALUES ('2647', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:24');
INSERT INTO `i_log` VALUES ('2648', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:24');
INSERT INTO `i_log` VALUES ('2649', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:24');
INSERT INTO `i_log` VALUES ('2650', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:24');
INSERT INTO `i_log` VALUES ('2651', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:24');
INSERT INTO `i_log` VALUES ('2652', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:24');
INSERT INTO `i_log` VALUES ('2653', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:24');
INSERT INTO `i_log` VALUES ('2654', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:25');
INSERT INTO `i_log` VALUES ('2655', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:25');
INSERT INTO `i_log` VALUES ('2656', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:45:25');
INSERT INTO `i_log` VALUES ('2657', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 13:54:21');
INSERT INTO `i_log` VALUES ('2658', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:25');
INSERT INTO `i_log` VALUES ('2659', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:25');
INSERT INTO `i_log` VALUES ('2660', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:25');
INSERT INTO `i_log` VALUES ('2661', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:25');
INSERT INTO `i_log` VALUES ('2662', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:26');
INSERT INTO `i_log` VALUES ('2663', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:26');
INSERT INTO `i_log` VALUES ('2664', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:26');
INSERT INTO `i_log` VALUES ('2665', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:26');
INSERT INTO `i_log` VALUES ('2666', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:26');
INSERT INTO `i_log` VALUES ('2667', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:27');
INSERT INTO `i_log` VALUES ('2668', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:27');
INSERT INTO `i_log` VALUES ('2669', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=20}', '127.0.0.1', '查询文件列表', null, '2017-05-03 13:54:50');
INSERT INTO `i_log` VALUES ('2670', 'admin', '0', '/boot/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文章列表', null, '2017-05-03 13:54:52');
INSERT INTO `i_log` VALUES ('2671', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 14:06:36');
INSERT INTO `i_log` VALUES ('2672', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询用户列表', null, '2017-05-03 14:07:25');
INSERT INTO `i_log` VALUES ('2673', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 14:09:18');
INSERT INTO `i_log` VALUES ('2674', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 14:11:38');
INSERT INTO `i_log` VALUES ('2675', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=127.0.0.1}', '127.0.0.1', '退出', null, '2017-05-03 14:11:55');
INSERT INTO `i_log` VALUES ('2676', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 14:12:16');
INSERT INTO `i_log` VALUES ('2677', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 14:12:51');
INSERT INTO `i_log` VALUES ('2678', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 14:19:54');
INSERT INTO `i_log` VALUES ('2679', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 14:20:03');
INSERT INTO `i_log` VALUES ('2680', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 14:30:35');
INSERT INTO `i_log` VALUES ('2681', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 14:39:45');
INSERT INTO `i_log` VALUES ('2682', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询用户列表', null, '2017-05-03 14:42:05');
INSERT INTO `i_log` VALUES ('2683', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=127.0.0.1}', '127.0.0.1', '退出', null, '2017-05-03 14:42:09');
INSERT INTO `i_log` VALUES ('2684', 'admin>', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin>}', '127.0.0.1', '登录', null, '2017-05-03 14:42:14');
INSERT INTO `i_log` VALUES ('2685', 'admin>', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin>}', '127.0.0.1', '登录', null, '2017-05-03 14:42:25');
INSERT INTO `i_log` VALUES ('2686', 'admin>', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin>}', '127.0.0.1', '登录', null, '2017-05-03 14:42:59');
INSERT INTO `i_log` VALUES ('2687', 'admin>', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin>}', '127.0.0.1', '登录', null, '2017-05-03 14:43:32');
INSERT INTO `i_log` VALUES ('2688', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 15:06:47');
INSERT INTO `i_log` VALUES ('2689', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询用户列表', null, '2017-05-03 15:06:50');
INSERT INTO `i_log` VALUES ('2690', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 15:08:40');
INSERT INTO `i_log` VALUES ('2691', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 15:09:17');
INSERT INTO `i_log` VALUES ('2692', 'admin', '0', '/boot/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询文件列表', null, '2017-05-03 15:10:31');
INSERT INTO `i_log` VALUES ('2693', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}', '127.0.0.1', '登录', null, '2017-05-03 15:18:09');
INSERT INTO `i_log` VALUES ('2694', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询用户列表', null, '2017-05-03 15:20:15');
INSERT INTO `i_log` VALUES ('2695', 'admin', '0', '/boot/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}', '127.0.0.1', '查询权限列表', null, '2017-05-03 15:27:52');
INSERT INTO `i_log` VALUES ('2696', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-04 11:10:46');
INSERT INTO `i_log` VALUES ('2697', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-04 11:11:10');
INSERT INTO `i_log` VALUES ('2698', 'admin', '0', '/boot/admin/user/add', 'com.xe.demo.controller.UserController.add()', '{useable=1, password=96e79218965eb72c92a549dd5a330112, roleid=5, loginIp=192.168.0.200, email=, username=test}', '192.168.0.200', '添加用户', null, '2017-05-04 11:13:27');
INSERT INTO `i_log` VALUES ('2699', 'admin', '1', '/boot/admin/user/add', 'com.xe.demo.service.UserService.saveUser()', '{useable=1, password=96e79218965eb72c92a549dd5a330112, roleid=5, loginIp=192.168.0.200, email=, username=test}', '192.168.0.200', '添加用户', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'addtime\' cannot be null\r\n### The error may involve com.xe.demo.mapper.AuthUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO auth_user  ( id,username,password,email,useable,roleid,addtime,logintime,loginip ) VALUES( ?,?,?,?,?,?,?,?,? )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'addtime\' cannot be null\n; SQL []; Column \'addtime\' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'addtime\' cannot be null', '2017-05-04 11:13:45');
INSERT INTO `i_log` VALUES ('2700', 'admin', '0', '/boot/admin/user/add', 'com.xe.demo.controller.UserController.add()', '{useable=1, password=96e79218965eb72c92a549dd5a330112, roleid=5, loginIp=192.168.0.200, email=, username=test}', '192.168.0.200', '添加用户', null, '2017-05-04 11:14:31');
INSERT INTO `i_log` VALUES ('2701', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-04 11:14:31');
INSERT INTO `i_log` VALUES ('2702', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 14:37:30');
INSERT INTO `i_log` VALUES ('2703', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-08 14:37:35');
INSERT INTO `i_log` VALUES ('2704', 'admin', '0', '/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-08 14:37:38');
INSERT INTO `i_log` VALUES ('2705', 'admin', '0', '/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-08 14:53:46');
INSERT INTO `i_log` VALUES ('2706', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 15:09:37');
INSERT INTO `i_log` VALUES ('2707', 'admin', '0', '/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-08 15:09:40');
INSERT INTO `i_log` VALUES ('2708', 'admin', '0', '/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=0}', '192.168.0.200', '查询日志列表', null, '2017-05-08 15:09:44');
INSERT INTO `i_log` VALUES ('2709', 'admin', '0', '/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=1}', '192.168.0.200', '查询日志列表', null, '2017-05-08 15:09:45');
INSERT INTO `i_log` VALUES ('2710', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-08 15:09:53');
INSERT INTO `i_log` VALUES ('2711', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 15:18:46');
INSERT INTO `i_log` VALUES ('2712', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 15:29:56');
INSERT INTO `i_log` VALUES ('2713', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 15:30:01');
INSERT INTO `i_log` VALUES ('2714', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 15:30:13');
INSERT INTO `i_log` VALUES ('2715', 'admin', '0', '/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-08 15:30:16');
INSERT INTO `i_log` VALUES ('2716', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-08 15:30:18');
INSERT INTO `i_log` VALUES ('2717', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=2, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-08 15:30:23');
INSERT INTO `i_log` VALUES ('2718', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:22:32');
INSERT INTO `i_log` VALUES ('2719', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]', '2017-05-08 17:22:37');
INSERT INTO `i_log` VALUES ('2720', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:23:47');
INSERT INTO `i_log` VALUES ('2721', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]', '2017-05-08 17:24:00');
INSERT INTO `i_log` VALUES ('2722', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:28:48');
INSERT INTO `i_log` VALUES ('2723', 'admin', '0', '/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-08 17:29:18');
INSERT INTO `i_log` VALUES ('2724', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:30:35');
INSERT INTO `i_log` VALUES ('2725', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:30:49');
INSERT INTO `i_log` VALUES ('2726', 'admin', '0', '/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-08 17:31:15');
INSERT INTO `i_log` VALUES ('2727', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:31:36');
INSERT INTO `i_log` VALUES ('2728', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:34:14');
INSERT INTO `i_log` VALUES ('2729', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]', '2017-05-08 17:34:17');
INSERT INTO `i_log` VALUES ('2730', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:35:41');
INSERT INTO `i_log` VALUES ('2731', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]', '2017-05-08 17:35:42');
INSERT INTO `i_log` VALUES ('2732', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:36:46');
INSERT INTO `i_log` VALUES ('2733', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]', '2017-05-08 17:36:46');
INSERT INTO `i_log` VALUES ('2734', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:37:47');
INSERT INTO `i_log` VALUES ('2735', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:38:40');
INSERT INTO `i_log` VALUES ('2736', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]', '2017-05-08 17:38:40');
INSERT INTO `i_log` VALUES ('2737', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:40:32');
INSERT INTO `i_log` VALUES ('2738', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:40:37');
INSERT INTO `i_log` VALUES ('2739', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:41:41');
INSERT INTO `i_log` VALUES ('2740', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:42:11');
INSERT INTO `i_log` VALUES ('2741', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:45:02');
INSERT INTO `i_log` VALUES ('2742', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:45:11');
INSERT INTO `i_log` VALUES ('2743', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:45:57');
INSERT INTO `i_log` VALUES ('2744', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:46:06');
INSERT INTO `i_log` VALUES ('2745', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:48:16');
INSERT INTO `i_log` VALUES ('2746', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:48:44');
INSERT INTO `i_log` VALUES ('2747', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:48:47');
INSERT INTO `i_log` VALUES ('2748', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:49:35');
INSERT INTO `i_log` VALUES ('2749', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:49:39');
INSERT INTO `i_log` VALUES ('2750', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:50:12');
INSERT INTO `i_log` VALUES ('2751', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:50:16');
INSERT INTO `i_log` VALUES ('2752', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:50:23');
INSERT INTO `i_log` VALUES ('2753', '匿名操作', '0', '/boot/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:50:26');
INSERT INTO `i_log` VALUES ('2754', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 17:50:55');
INSERT INTO `i_log` VALUES ('2755', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 17:50:58');
INSERT INTO `i_log` VALUES ('2756', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 18:35:30');
INSERT INTO `i_log` VALUES ('2757', '匿名操作', '0', '/admin/logout', 'com.xe.demo.controller.LoginController.logout()', '{loginIp=192.168.0.200}', '192.168.0.200', '退出', null, '2017-05-08 18:35:53');
INSERT INTO `i_log` VALUES ('2758', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 18:36:12');
INSERT INTO `i_log` VALUES ('2759', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-08 18:43:43');
INSERT INTO `i_log` VALUES ('2760', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Unknown redis exception; nested exception is java.lang.NullPointerException', '2017-05-08 18:43:43');
INSERT INTO `i_log` VALUES ('2761', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 09:15:27');
INSERT INTO `i_log` VALUES ('2762', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Unknown redis exception; nested exception is java.lang.NullPointerException', '2017-05-09 09:15:28');
INSERT INTO `i_log` VALUES ('2763', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 09:36:19');
INSERT INTO `i_log` VALUES ('2764', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Unknown redis exception; nested exception is java.lang.NullPointerException', '2017-05-09 09:36:19');
INSERT INTO `i_log` VALUES ('2765', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 09:36:50');
INSERT INTO `i_log` VALUES ('2766', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Unknown redis exception; nested exception is java.lang.NullPointerException', '2017-05-09 09:37:20');
INSERT INTO `i_log` VALUES ('2767', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 09:38:08');
INSERT INTO `i_log` VALUES ('2768', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Unknown redis exception; nested exception is java.lang.NullPointerException', '2017-05-09 09:38:20');
INSERT INTO `i_log` VALUES ('2769', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 09:39:43');
INSERT INTO `i_log` VALUES ('2770', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Unknown redis exception; nested exception is java.lang.NullPointerException', '2017-05-09 09:39:43');
INSERT INTO `i_log` VALUES ('2771', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 10:14:27');
INSERT INTO `i_log` VALUES ('2772', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', 'Unknown redis exception; nested exception is java.lang.NullPointerException', '2017-05-09 10:14:27');
INSERT INTO `i_log` VALUES ('2773', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 10:15:38');
INSERT INTO `i_log` VALUES ('2774', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 10:23:44');
INSERT INTO `i_log` VALUES ('2775', 'admin', '0', '/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-09 10:24:03');
INSERT INTO `i_log` VALUES ('2776', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-09 10:24:04');
INSERT INTO `i_log` VALUES ('2777', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-09 10:24:05');
INSERT INTO `i_log` VALUES ('2778', 'admin', '0', '/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-09 10:24:06');
INSERT INTO `i_log` VALUES ('2779', 'admin', '0', '/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询权限列表', null, '2017-05-09 10:24:06');
INSERT INTO `i_log` VALUES ('2780', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 10:31:16');
INSERT INTO `i_log` VALUES ('2781', 'admin', '0', '/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-09 10:31:19');
INSERT INTO `i_log` VALUES ('2782', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-09 10:31:47');
INSERT INTO `i_log` VALUES ('2783', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 10:42:19');
INSERT INTO `i_log` VALUES ('2784', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-09 10:42:25');
INSERT INTO `i_log` VALUES ('2785', 'admin', '0', '/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-09 10:42:27');
INSERT INTO `i_log` VALUES ('2786', 'admin', '0', '/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询权限列表', null, '2017-05-09 10:42:27');
INSERT INTO `i_log` VALUES ('2787', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-09 10:42:29');
INSERT INTO `i_log` VALUES ('2788', 'admin', '0', '/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-09 10:42:30');
INSERT INTO `i_log` VALUES ('2789', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 11:28:31');
INSERT INTO `i_log` VALUES ('2790', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 11:31:08');
INSERT INTO `i_log` VALUES ('2791', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 11:36:47');
INSERT INTO `i_log` VALUES ('2792', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 11:41:48');
INSERT INTO `i_log` VALUES ('2793', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-09 11:41:51');
INSERT INTO `i_log` VALUES ('2794', 'admin', '0', '/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-09 13:53:29');
INSERT INTO `i_log` VALUES ('2795', 'admin', '0', '/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询权限列表', null, '2017-05-09 13:53:31');
INSERT INTO `i_log` VALUES ('2796', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-09 13:53:36');
INSERT INTO `i_log` VALUES ('2797', 'admin', '0', '/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-09 13:53:55');
INSERT INTO `i_log` VALUES ('2798', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-09 13:55:35');
INSERT INTO `i_log` VALUES ('2799', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:06:07');
INSERT INTO `i_log` VALUES ('2800', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:07:58');
INSERT INTO `i_log` VALUES ('2801', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:17:06');
INSERT INTO `i_log` VALUES ('2802', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:17:51');
INSERT INTO `i_log` VALUES ('2803', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:22:19');
INSERT INTO `i_log` VALUES ('2804', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:24:37');
INSERT INTO `i_log` VALUES ('2805', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:28:52');
INSERT INTO `i_log` VALUES ('2806', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:31:25');
INSERT INTO `i_log` VALUES ('2807', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:32:14');
INSERT INTO `i_log` VALUES ('2808', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', '[B cannot be cast to com.xe.demo.model.AuthUser', '2017-05-09 14:32:14');
INSERT INTO `i_log` VALUES ('2809', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:33:24');
INSERT INTO `i_log` VALUES ('2810', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:34:10');
INSERT INTO `i_log` VALUES ('2811', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', '[B cannot be cast to com.xe.demo.model.AuthUser', '2017-05-09 14:34:10');
INSERT INTO `i_log` VALUES ('2812', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 14:55:17');
INSERT INTO `i_log` VALUES ('2813', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', '[B cannot be cast to com.xe.demo.model.AuthUser', '2017-05-09 14:55:17');
INSERT INTO `i_log` VALUES ('2814', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:01:48');
INSERT INTO `i_log` VALUES ('2815', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:22:54');
INSERT INTO `i_log` VALUES ('2816', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:25:09');
INSERT INTO `i_log` VALUES ('2817', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:26:23');
INSERT INTO `i_log` VALUES ('2818', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:53:01');
INSERT INTO `i_log` VALUES ('2819', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:53:01');
INSERT INTO `i_log` VALUES ('2820', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:53:37');
INSERT INTO `i_log` VALUES ('2821', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:53:48');
INSERT INTO `i_log` VALUES ('2822', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:54:05');
INSERT INTO `i_log` VALUES ('2823', 'admin', '1', '/admin/login', 'com.xe.demo.service.LoginService.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:54:20');
INSERT INTO `i_log` VALUES ('2824', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-09 15:54:29');
INSERT INTO `i_log` VALUES ('2825', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-10 10:01:54');
INSERT INTO `i_log` VALUES ('2826', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-10 10:02:23');
INSERT INTO `i_log` VALUES ('2827', 'admin', '0', '/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询角色列表', null, '2017-05-10 10:02:24');
INSERT INTO `i_log` VALUES ('2828', 'admin', '0', '/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询权限列表', null, '2017-05-10 10:02:24');
INSERT INTO `i_log` VALUES ('2829', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-10 10:07:07');
INSERT INTO `i_log` VALUES ('2830', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-10 10:08:21');
INSERT INTO `i_log` VALUES ('2831', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-10 10:09:53');
INSERT INTO `i_log` VALUES ('2832', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-15 10:03:23');
INSERT INTO `i_log` VALUES ('2833', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-15 10:03:29');
INSERT INTO `i_log` VALUES ('2834', 'admin', '0', '/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-15 10:03:38');
INSERT INTO `i_log` VALUES ('2835', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-15 10:03:49');
INSERT INTO `i_log` VALUES ('2836', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}', '192.168.0.200', '登录', null, '2017-05-19 15:15:20');
INSERT INTO `i_log` VALUES ('2837', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询用户列表', null, '2017-05-19 15:15:23');
INSERT INTO `i_log` VALUES ('2838', 'admin', '0', '/admin/tech/queryArticlePage', 'com.xe.demo.controller.TechController.queryArticlePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文章列表', null, '2017-05-19 15:15:26');
INSERT INTO `i_log` VALUES ('2839', 'admin', '0', '/admin/log/queryPage', 'com.xe.demo.controller.LogController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询日志列表', null, '2017-05-19 15:15:28');
INSERT INTO `i_log` VALUES ('2840', 'admin', '0', '/admin/tech/queryFilePage', 'com.xe.demo.controller.TechController.queryFilePage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}', '192.168.0.200', '查询文件列表', null, '2017-05-19 15:15:30');
INSERT INTO `i_log` VALUES ('2841', 'admin', '0', '/boot/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.3, username=admin}', '192.168.1.3', '登录', null, '2017-11-06 20:43:13');
INSERT INTO `i_log` VALUES ('2842', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.3, pageSize=10}', '192.168.1.3', '查询用户列表', null, '2017-11-06 20:43:27');
INSERT INTO `i_log` VALUES ('2843', 'admin', '0', '/boot/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.3, pageSize=10}', '192.168.1.3', '查询角色列表', null, '2017-11-06 20:43:28');
INSERT INTO `i_log` VALUES ('2844', 'admin', '0', '/boot/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.3, pageSize=10}', '192.168.1.3', '查询权限列表', null, '2017-11-06 20:43:29');
INSERT INTO `i_log` VALUES ('2845', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.3, pageSize=10}', '192.168.1.3', '查询用户列表', null, '2017-11-06 20:45:56');
INSERT INTO `i_log` VALUES ('2846', 'admin', '0', '/boot/admin/role/queryPage', 'com.xe.demo.controller.RoleController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.3, pageSize=10}', '192.168.1.3', '查询角色列表', null, '2017-11-06 20:46:12');
INSERT INTO `i_log` VALUES ('2847', 'admin', '0', '/boot/admin/oper/queryPage', 'com.xe.demo.controller.OperationController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.3, pageSize=10}', '192.168.1.3', '查询权限列表', null, '2017-11-06 20:46:16');
INSERT INTO `i_log` VALUES ('2848', 'admin', '0', '/boot/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.3, pageSize=10}', '192.168.1.3', '查询用户列表', null, '2017-11-06 20:50:02');
INSERT INTO `i_log` VALUES ('2849', 'admin', '0', '/admin/login', 'com.xe.demo.controller.LoginController.login()', '{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.3, username=admin}', '192.168.1.3', '登录', null, '2017-11-06 22:55:15');
INSERT INTO `i_log` VALUES ('2850', 'admin', '0', '/admin/user/queryPage', 'com.xe.demo.controller.UserController.queryPage()', '{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.3, pageSize=10}', '192.168.1.3', '查询用户列表', null, '2017-11-06 22:55:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of management
-- ----------------------------
INSERT INTO `management` VALUES ('1', '广东中食营科生物科技有限公司', '2011-06-10', '2041-06-10', 'GD-FDA健证字（2014）第1900S0593号', '91441900576479704U', '1', '2017-11-08');
INSERT INTO `management` VALUES ('2', '广州贝之蓝儿童用品有限公司', '2011-06-10', '2041-06-10', 'GD-FDA健证字（2014）第1900S0594号', '91441900576479704U', '1', '2017-11-08');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producer
-- ----------------------------
INSERT INTO `producer` VALUES ('1', '广东中食营科生物科技有限公司', '2011-06-10', '2041-06-10', 'GD-FDA健证字（2014）第1900S0593号', '91441900576479704U', '1', '2017-11-08');
INSERT INTO `producer` VALUES ('2', '广州贝之蓝儿童用品有限公司', '2011/6/10', '2041/6/10', 'GD-FDA健证字（2014）第1900S0594号', '48379592927888704F', '1', '2017/11/8');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_id` int(10) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`pro_id`),
  KEY `index_product_pro_id` (`pro_id`),
  KEY `index_product_produce_id` (`produce_id`),
  KEY `index_product_man_id` (`management_id`),
  KEY `index_product_user_id` (`user_id`),
  KEY `fk_product_brand_id` (`brand_id`),
  CONSTRAINT `fk_product_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_product_management_id` FOREIGN KEY (`management_id`) REFERENCES `management` (`id`),
  CONSTRAINT `fk_product_produce_id` FOREIGN KEY (`produce_id`) REFERENCES `producer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '俪人粉', '国产保健食品', '1', '1', '1', '2017/08/01', '2018/07/01', '1.jpg', 'pass', '1', '2017/11/08', 'ins_1.jpg');
INSERT INTO `product` VALUES ('2', '达人粉', '国产保健食品', '1', '1', '1', '2017/08/01', '2018/07/01', '2.png', 'pass', '1', '2017/11/08', 'ins_1.jpg');
INSERT INTO `product` VALUES ('3', '全肽粉', '国产保健食品', '1', '1', '1', '2017/08/01', '2018/07/01', '3.jpg', 'pass', '1', '2017/11/08', 'ins_1.jpg');
INSERT INTO `product` VALUES ('4', '冰洋绽放胶原蛋白肽时光面膜', '国产保健用品', '1', '1', '1', '2017/08/01', '2018/07/01', '4.jpg', 'pass', '1', '2017/11/08', 'ins_4.jpg');
INSERT INTO `product` VALUES ('5', '安抚奶嘴', '母婴用品', '2', '2', '2', '2017/08/01', '2018/07/01', '5.jpg', 'pass', '1', '2017/11/08', 'ins_5.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_resources` VALUES ('14', '资质管理', '/certificatePage', '1', '1', '13');
INSERT INTO `sys_resources` VALUES ('15', '商品管理', '/product', '1', '1', '14');
INSERT INTO `sys_resources` VALUES ('16', '经营主体', '/management', '1', '1', '15');
INSERT INTO `sys_resources` VALUES ('17', '品牌信息', '/brand', '1', '1', '16');
INSERT INTO `sys_resources` VALUES ('18', '生产主体', '/producer', '1', '1', '17');

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
INSERT INTO `sys_role_resources` VALUES ('6', '15');
INSERT INTO `sys_role_resources` VALUES ('6', '16');
INSERT INTO `sys_role_resources` VALUES ('6', '17');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '3ef7164d1f6167cb9f2658c07d3c2f0a', '1', '1', null, null);
INSERT INTO `sys_user` VALUES ('24', 'incc', '437a3645fd80b0ca5e922586735d533d', '1', '1', null, null);
INSERT INTO `sys_user` VALUES ('30', 'qqq', 'bac464eebea0b9226c245b9994ce619f', '1', '0', '', '');

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

-- ----------------------------
-- Procedure structure for `addOrUpdateOper`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addOrUpdateOper`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addOrUpdateOper`(IN `opcode` varchar(20),IN `ophref` varchar(50),IN `opname` varchar(50),IN `opseq` int)
BEGIN
	declare opid int default 0;
	select op.opid intoopid from auth_operation AS op where op.opcode = opcode and op.ophref = ophref;
	if opid > 0 then
		update auth_operation set opname = opname, opseq = opseq 
		where opcode = opcode and ophref = ophref;
		delete from auth_operation where opid = opid;
	else
		insert into auth_operation(opcode, opname, ophref, opseq) 
		values(opcode, opname, ophref, opseq);
	end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `bind_opers`
-- ----------------------------
DROP PROCEDURE IF EXISTS `bind_opers`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bind_opers`(IN `roleid` integer)
BEGIN
	/*用于判断是否结束循环*/
	declare done int default 0;
	declare opid int;
	declare count int default 0;
	/*定义游标*/
	declare c_opid cursor for select op.opid from auth_operation op;
	/*定义 设置循环结束标识done值怎么改变 的逻辑*/
	declare continue handler for not FOUND set done = 1;
	/*打开游标*/
	open c_opid;
		repeat
			fetch c_opid into opid;
			if not done then 
				select count(op.opid) into count from auth_role_operation op where op.roleid = roleid and op.opid = opid;

				if count <= 0 then
					insert into auth_role_operation(roleid, opid) values(roleid, opid);
				end if;
			end if;
		until done end repeat;
	close c_opid;  /*关闭游标*/
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `init_shiro_demo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_shiro_demo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `init_shiro_demo`()
BEGIN	
/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - 
*********************************************************************
*/
/*表结构插入*/
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*Table structure for table `u_role` */
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*Table structure for table `u_role_permission` */
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*Table structure for table `u_user` */
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*Table structure for table `u_user_role` */
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - i_wenyiba_com
*********************************************************************
*/
/*所有的表数据插入*/
/*Data for the table `u_permission` */
insert  into `u_permission`(`id`,`url`,`name`) values (4,'/permission/index.shtml','权限列表'),(6,'/permission/addPermission.shtml','权限添加'),(7,'/permission/deletePermissionById.shtml','权限删除'),(8,'/member/list.shtml','用户列表'),(9,'/member/online.shtml','在线用户'),(10,'/member/changeSessionStatus.shtml','用户Session踢出'),(11,'/member/forbidUserById.shtml','用户激活&禁止'),(12,'/member/deleteUserById.shtml','用户删除'),(13,'/permission/addPermission2Role.shtml','权限分配'),(14,'/role/clearRoleByUserIds.shtml','用户角色分配清空'),(15,'/role/addRole2User.shtml','角色分配保存'),(16,'/role/deleteRoleById.shtml','角色列表删除'),(17,'/role/addRole.shtml','角色列表添加'),(18,'/role/index.shtml','角色列表'),(19,'/permission/allocation.shtml','权限分配'),(20,'/role/allocation.shtml','角色分配');
/*Data for the table `u_role` */
insert  into `u_role`(`id`,`name`,`type`) values (1,'系统管理员','888888'),(3,'权限角色','100003'),(4,'用户中心','100002');
/*Data for the table `u_role_permission` */
insert  into `u_role_permission`(`rid`,`pid`) values (4,8),(4,9),(4,10),(4,11),(4,12),(3,4),(3,6),(3,7),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(1,4),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20);
/*Data for the table `u_user` */
insert  into `u_user`(`id`,`nickname`,`email`,`pswd`,`create_time`,`last_login_time`,`status`) values (1,'管理员','admin','9c3250081c7b1f5c6cbb8096e3e1cd04','2016-06-16 11:15:33','2016-06-16 11:24:10',1),(11,'soso','8446666@qq.com','d57ffbe486910dd5b26d0167d034f9ad','2016-05-26 20:50:54','2016-06-16 11:24:35',1),(12,'8446666','8446666','4afdc875a67a55528c224ce088be2ab8','2016-05-27 22:34:19','2016-06-15 17:03:16',1);
/*Data for the table `u_user_role` */
insert  into `u_user_role`(`uid`,`rid`) values (12,4),(11,3),(11,4),(1,1);
   
    END
;;
DELIMITER ;
