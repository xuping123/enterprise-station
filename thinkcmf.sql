/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : thinkcmf

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-06-10 13:40:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `c121mf_ad`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_ad`;
CREATE TABLE `c121mf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c121mf_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_asset`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_asset`;
CREATE TABLE `c121mf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of c121mf_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_auth_access`;
CREATE TABLE `c121mf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of c121mf_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_auth_rule`;
CREATE TABLE `c121mf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of c121mf_auth_rule
-- ----------------------------
INSERT INTO `c121mf_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `c121mf_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');

-- ----------------------------
-- Table structure for `c121mf_comments`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_comments`;
CREATE TABLE `c121mf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of c121mf_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_common_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_common_action_log`;
CREATE TABLE `c121mf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of c121mf_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_guestbook`;
CREATE TABLE `c121mf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of c121mf_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_links`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_links`;
CREATE TABLE `c121mf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of c121mf_links
-- ----------------------------
INSERT INTO `c121mf_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `c121mf_menu`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_menu`;
CREATE TABLE `c121mf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of c121mf_menu
-- ----------------------------
INSERT INTO `c121mf_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `c121mf_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `c121mf_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `c121mf_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `c121mf_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `c121mf_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `c121mf_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `c121mf_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `c121mf_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `c121mf_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `c121mf_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `c121mf_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `c121mf_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `c121mf_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `c121mf_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `c121mf_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `c121mf_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `c121mf_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `c121mf_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `c121mf_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');

-- ----------------------------
-- Table structure for `c121mf_nav`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_nav`;
CREATE TABLE `c121mf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of c121mf_nav
-- ----------------------------
INSERT INTO `c121mf_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `c121mf_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `c121mf_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for `c121mf_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_nav_cat`;
CREATE TABLE `c121mf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1显示，0不显示',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of c121mf_nav_cat
-- ----------------------------
INSERT INTO `c121mf_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for `c121mf_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_oauth_user`;
CREATE TABLE `c121mf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of c121mf_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_options`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_options`;
CREATE TABLE `c121mf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of c121mf_options
-- ----------------------------
INSERT INTO `c121mf_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `c121mf_options` VALUES ('2', 'site_options', '            {\n            		\"site_name\":\"ThinkCMF内容管理框架\",\n            		\"site_host\":\"http://localhost/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"11@qq.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"ThinkCMF内容管理框架\",\n            		\"site_seo_keywords\":\"ThinkCMF,php,内容管理框架,cmf,cms,简约风, simplewind,framework\",\n            		\"site_seo_description\":\"ThinkCMF是简约风网络科技发布的一款用于快速开发的内容管理框架\"\n        }', '1');

-- ----------------------------
-- Table structure for `c121mf_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_plugins`;
CREATE TABLE `c121mf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of c121mf_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_posts`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_posts`;
CREATE TABLE `c121mf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of c121mf_posts
-- ----------------------------
INSERT INTO `c121mf_posts` VALUES ('1', '1', 'fewfweffewfweffewfweffewfweffewfweffewfweffewfwef', 'fewfweffewfweffewfweffewfweffewfweffewfwef', '2016-06-04 02:17:14', '<p>fewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfwef</p>', 'fewfwef', 'fewfweffewfweffewfweffewfweffewfweffewfweffewfweffewfwef', '1', '1', '2016-06-04 02:16:54', null, '0', null, '', '0', '{\"thumb\":\"20160604\\/5751c9a7c5738.jpg\"}', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for `c121mf_role`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_role`;
CREATE TABLE `c121mf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of c121mf_role
-- ----------------------------
INSERT INTO `c121mf_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `c121mf_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_role_user`;
CREATE TABLE `c121mf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of c121mf_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_route`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_route`;
CREATE TABLE `c121mf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of c121mf_route
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_slide`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_slide`;
CREATE TABLE `c121mf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of c121mf_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_slide_cat`;
CREATE TABLE `c121mf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of c121mf_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `c121mf_terms`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_terms`;
CREATE TABLE `c121mf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of c121mf_terms
-- ----------------------------
INSERT INTO `c121mf_terms` VALUES ('1', '列表演示', '', 'article', '', '0', '0', '0-1', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `c121mf_terms` VALUES ('2', '瀑布流', '', 'article', '', '0', '0', '0-2', '', '', '', 'list_masonry', 'article', '0', '1');

-- ----------------------------
-- Table structure for `c121mf_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_term_relationships`;
CREATE TABLE `c121mf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of c121mf_term_relationships
-- ----------------------------
INSERT INTO `c121mf_term_relationships` VALUES ('1', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for `c121mf_users`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_users`;
CREATE TABLE `c121mf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of c121mf_users
-- ----------------------------
INSERT INTO `c121mf_users` VALUES ('1', 'admin', '###3b7feba08ebd3001177fe692063464a3', 'admin', '11@qq.com', '', null, '0', null, null, '0.0.0.0', '2016-06-04 01:11:21', '2016-06-04 01:11:21', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `c121mf_user_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `c121mf_user_favorites`;
CREATE TABLE `c121mf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of c121mf_user_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_ad`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_asset`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');

-- ----------------------------
-- Table structure for `cmf_comments`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comments`;
CREATE TABLE `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cmf_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_common_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_common_action_log`;
CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of cmf_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guestbook`;
CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of cmf_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_links`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_links`;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of cmf_links
-- ----------------------------
INSERT INTO `cmf_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `cmf_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_menu`;
CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_menu
-- ----------------------------
INSERT INTO `cmf_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `cmf_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `cmf_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `cmf_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `cmf_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `cmf_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `cmf_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `cmf_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');

-- ----------------------------
-- Table structure for `cmf_nav`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `cmf_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `cmf_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for `cmf_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1显示，0不显示',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of cmf_nav_cat
-- ----------------------------
INSERT INTO `cmf_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for `cmf_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_oauth_user`;
CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of cmf_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_options`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_options
-- ----------------------------
INSERT INTO `cmf_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `cmf_options` VALUES ('2', 'site_options', '            {\n            		\"site_name\":\"企业说\",\n            		\"site_host\":\"http://localhost/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"962343525@qq.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"企业说\",\n            		\"site_seo_keywords\":\"企业说\",\n            		\"site_seo_description\":\"企业说\"\n        }', '1');

-- ----------------------------
-- Table structure for `cmf_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugins`;
CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_posts`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_posts`;
CREATE TABLE `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of cmf_posts
-- ----------------------------
INSERT INTO `cmf_posts` VALUES ('1', '1', '1211112111', '1211112111', '2016-05-19 00:33:10', '<p>1211112111121111211112111121111211112111</p>', '12111', '1211112111121111211112111121111211112111', '1', '1', '2016-05-19 00:32:39', null, '0', null, '', '0', '{\"thumb\":\"20160519\\/573c993dd75f1.png\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('2', '1', 'fewfwefwafwaef', 'fewfwefwafwaef', '2016-05-19 15:33:08', '<p>fewfwefwafwaeffewfwefwafwaeffewfwefwafwaeffewfwefwafwaeffewfwefwafwaeffewfwefwafwaeffewfwefwafwaeffewfwefwafwaeffewfwefwafwaeffewfwefwafwaeffewfwefwafwaef<img src=\"http://localhost/think/data/upload/ueditor/20160519/573d6c3098b39.png\" title=\"blob.png\" alt=\"blob.png\"/><img src=\"http://localhost/think/data/upload/ueditor/20160519/573d6c30bfc42.png\" title=\"blob.png\" alt=\"blob.png\"/><img src=\"http://localhost/think/data/upload/ueditor/20160519/573d6c30e751c.png\" title=\"blob.png\" alt=\"blob.png\"/></p>', 'fewfwefwafwaef', 'fewfwefwafwaef', '1', '1', '2016-05-19 15:31:24', null, '0', null, '', '0', '{\"thumb\":\"20160519\\/573d6c2ca0f26.png\"}', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `cmf_role`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `cmf_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_route`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of cmf_route
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_slide`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of cmf_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_terms`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_terms`;
CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of cmf_terms
-- ----------------------------
INSERT INTO `cmf_terms` VALUES ('8', '毅友专区', '', 'article', '', '0', '0', '0-8', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('7', '玩物励志', '', 'article', '', '0', '0', '0-7', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('6', '毅派科技', '', 'article', '', '0', '0', '0-6', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('9', '售前/后管理', '', 'article', '', '0', '0', '0-9', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('10', '毅有专区', '', 'article', '', '0', '0', '0-10', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('11', '毅力专区帖子1', '', 'article', '', '8', '0', '0-8-11', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('12', '毅有专区帖子分类2', '', 'article', '', '8', '0', '0-8-12', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('13', '玩物励志 分类1', '', 'article', '', '7', '0', '0-7-13', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('14', '玩物励志 分类2', '', 'article', '', '7', '0', '0-7-14', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('15', '玩物励志 分类3', '', 'article', '', '7', '0', '0-7-15', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('16', '毅派科技 下帖 分类1', '', 'article', '', '6', '0', '0-6-16', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('17', '毅派科技 下帖 分类1', '', 'article', '', '6', '0', '0-6-17', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('18', '售前讨论1', '', 'article', '', '9', '0', '0-9-18', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('19', '收获aug哪里1312', '', 'article', '', '9', '0', '0-9-19', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('20', '专区下得分类1', '', 'article', '', '10', '0', '0-10-20', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('21', '专区下的分内2', '', 'article', '', '10', '0', '0-10-21', '', '', '', 'list', 'article', '0', '1');

-- ----------------------------
-- Table structure for `cmf_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of cmf_term_relationships
-- ----------------------------
INSERT INTO `cmf_term_relationships` VALUES ('1', '1', '11', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('2', '2', '11', '0', '1');

-- ----------------------------
-- Table structure for `cmf_users`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users`;
CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cmf_users
-- ----------------------------
INSERT INTO `cmf_users` VALUES ('1', 'admin', '###f4c39d80950ccd4a5f3e3fd39e8393a7', 'admin', '962343525@qq.com', '', null, '0', null, null, '0.0.0.0', '2016-05-19 15:31:06', '2016-05-18 07:15:29', '', '1', '0', '1', '0', '');
INSERT INTO `cmf_users` VALUES ('2', '', '###b099844c9ed5c224f9d7d9d8ac9c6d4d', '123123', '', '', null, '0', null, null, '0.0.0.0', '2016-05-18 20:26:53', '2016-05-18 20:26:53', '', '1', '0', '2', '0', '13053137953');
INSERT INTO `cmf_users` VALUES ('3', '', '###71e4cf9c7a812f8be67af6968a437fe9', '123123123123', '', '', null, '0', null, null, '0.0.0.0', '2016-05-19 17:32:21', '2016-05-19 17:24:49', '', '1', '0', '2', '0', '18956583791');

-- ----------------------------
-- Table structure for `cmf_user_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorites`;
CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of cmf_user_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `gaotead`
-- ----------------------------
DROP TABLE IF EXISTS `gaotead`;
CREATE TABLE `gaotead` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gaotead
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteasset`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteasset`;
CREATE TABLE `gaoteasset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of gaoteasset
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteauth_access`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteauth_access`;
CREATE TABLE `gaoteauth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of gaoteauth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteauth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteauth_rule`;
CREATE TABLE `gaoteauth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of gaoteauth_rule
-- ----------------------------
INSERT INTO `gaoteauth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `gaoteauth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');

-- ----------------------------
-- Table structure for `gaotecomments`
-- ----------------------------
DROP TABLE IF EXISTS `gaotecomments`;
CREATE TABLE `gaotecomments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of gaotecomments
-- ----------------------------

-- ----------------------------
-- Table structure for `gaotecommon_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `gaotecommon_action_log`;
CREATE TABLE `gaotecommon_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of gaotecommon_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteguestbook`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteguestbook`;
CREATE TABLE `gaoteguestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of gaoteguestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `gaotelinks`
-- ----------------------------
DROP TABLE IF EXISTS `gaotelinks`;
CREATE TABLE `gaotelinks` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of gaotelinks
-- ----------------------------
INSERT INTO `gaotelinks` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `gaotemenu`
-- ----------------------------
DROP TABLE IF EXISTS `gaotemenu`;
CREATE TABLE `gaotemenu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of gaotemenu
-- ----------------------------
INSERT INTO `gaotemenu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `gaotemenu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `gaotemenu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `gaotemenu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `gaotemenu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `gaotemenu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `gaotemenu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `gaotemenu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `gaotemenu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `gaotemenu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `gaotemenu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `gaotemenu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `gaotemenu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `gaotemenu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `gaotemenu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `gaotemenu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `gaotemenu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `gaotemenu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `gaotemenu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `gaotemenu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');

-- ----------------------------
-- Table structure for `gaotenav`
-- ----------------------------
DROP TABLE IF EXISTS `gaotenav`;
CREATE TABLE `gaotenav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of gaotenav
-- ----------------------------
INSERT INTO `gaotenav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `gaotenav` VALUES ('2', '1', '0', '关于高特', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/about\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}', '', '1', '0', '0-2');
INSERT INTO `gaotenav` VALUES ('3', '1', '0', '垃圾分类', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-3');
INSERT INTO `gaotenav` VALUES ('4', '1', '0', '垃圾清运', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '0', '0-4');
INSERT INTO `gaotenav` VALUES ('5', '1', '0', '政策法规', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}', '', '1', '0', '0-5');
INSERT INTO `gaotenav` VALUES ('6', '1', '0', '分类知识', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '0', '0-6');

-- ----------------------------
-- Table structure for `gaotenav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `gaotenav_cat`;
CREATE TABLE `gaotenav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示，1显示，0不显示',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of gaotenav_cat
-- ----------------------------
INSERT INTO `gaotenav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for `gaoteoauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteoauth_user`;
CREATE TABLE `gaoteoauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of gaoteoauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteoptions`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteoptions`;
CREATE TABLE `gaoteoptions` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of gaoteoptions
-- ----------------------------
INSERT INTO `gaoteoptions` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `gaoteoptions` VALUES ('2', 'site_options', '            {\n            		\"site_name\":\"高特保洁\",\n            		\"site_host\":\"http://localhost/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"962343525@qq.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"高特保洁\",\n            		\"site_seo_keywords\":\"高特保洁\",\n            		\"site_seo_description\":\"高特保洁\"\n        }', '1');

-- ----------------------------
-- Table structure for `gaoteplugins`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteplugins`;
CREATE TABLE `gaoteplugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of gaoteplugins
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteposts`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteposts`;
CREATE TABLE `gaoteposts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of gaoteposts
-- ----------------------------
INSERT INTO `gaoteposts` VALUES ('1', '1', '垃圾分类了啊啊', '垃圾分类了啊啊', '2016-06-04 00:57:16', '<p>垃圾分类了啊啊垃圾分类了啊啊垃圾分类了啊啊垃圾分类了啊啊垃圾分类了啊啊垃圾分类了啊啊垃圾分类了啊啊垃圾分类了啊啊垃圾分类了啊啊</p>', '垃圾分类了啊啊标题啊', '垃圾分类了啊啊', '1', '1', '2016-06-04 00:56:35', null, '0', null, '', '0', '{\"thumb\":\"20160604\\/5751b6e44b1ca.png\"}', '0', '0', '1', '1');
INSERT INTO `gaoteposts` VALUES ('2', '1', '垃圾开始分类啊啊 ', '垃圾开始分类啊啊 ', '2016-06-04 01:00:36', '<p>垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;垃圾开始分类啊啊&nbsp;</p>', '分类知识标题啊题标题标题标题标题标题标题标题标题标题标题标分类知识标题啊分类知识标题啊分类知识标题啊题标题标分类知识标分类知识标题啊题啊分类知识标题啊', '垃圾开始分类啊啊 ', '1', '1', '2016-06-04 00:59:59', null, '0', null, '', '0', '{\"thumb\":\"20160604\\/5751b7aa09c1f.png\"}', '13', '0', '1', '1');
INSERT INTO `gaoteposts` VALUES ('3', '1', '分类知识', '分类知识', '2016-06-04 01:01:04', '<p>分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312分类知识分类知识分类知识分类知12312</p>', '分类知识标题啊', '分类知识', '1', '1', '2016-06-04 01:00:39', null, '0', null, '', '0', '{\"thumb\":\"20160604\\/5751b7cbeb15b.jpg\"}', '7', '0', '0', '0');
INSERT INTO `gaoteposts` VALUES ('4', '1', '垃圾清运', '垃圾清运', '2016-06-04 01:01:32', '<p>垃圾清运垃圾清运垃圾清运垃圾清运垃圾清运</p>', '垃圾清运标题啊', '垃圾清运', '1', '1', '2016-06-04 01:01:06', null, '0', null, '', '0', '{\"thumb\":\"20160604\\/5751b7e8d3519.jpg\"}', '0', '0', '0', '0');
INSERT INTO `gaoteposts` VALUES ('5', '1', '我们是一个大公司啊啊 啊', '我们是一个大公司啊啊 啊', '2016-06-04 01:01:53', '<p>我们是一个大公司啊啊 啊我们是一个大公司啊啊 啊我们是一个大公司啊啊 啊</p>', '我们是标题啊', '我们是一个大公司啊啊 啊', '1', '1', '2016-06-04 01:01:34', null, '0', null, '', '0', '{\"thumb\":\"20160604\\/5751b7ff58577.png\"}', '0', '0', '0', '0');
INSERT INTO `gaoteposts` VALUES ('6', '1', '正义就是法律', '正义就是法律', '2016-06-04 10:38:54', '<p>正义就是法律正义就是法律正义就是法律正义就是法律正义就是法律正义就是法律</p>', '正义就是法律', '正义就是法律', '1', '1', '2016-06-04 10:38:25', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `gaoteposts` VALUES ('7', '1', '开始分页了啊啊啊 ', '开始分页了啊啊啊 ', '2016-06-04 10:45:18', '<p>开始分页了啊啊啊&nbsp;开始分页了啊啊啊&nbsp;开始分页了啊啊啊&nbsp;开始分页了啊啊啊&nbsp;开始分页了啊啊啊&nbsp;开始分页了啊啊啊&nbsp;开始分页了啊啊啊&nbsp;开始分页了啊啊啊&nbsp;开始分页了啊啊啊&nbsp;</p>', '开始分页了啊啊啊 ', '开始分页了啊啊啊 ', '1', '1', '2016-06-04 10:38:55', null, '0', null, '', '0', '{\"thumb\":\"\"}', '1', '0', '0', '0');
INSERT INTO `gaoteposts` VALUES ('8', '1', '高特保洁公司', '高特保洁公司', '2016-06-06 21:18:24', '<p>&nbsp; &nbsp;高特保洁公司经国家工商总局注册的正规服务机构，公司集产品研发、保洁服务、劳务服务、家政服务、保洁技术培训、保洁行业推广、保洁技术转让、信息咨询、清洁设备销售、保洁工具销售等为一体的大型保洁服务机构。</p><p>&nbsp; 公司自成立以来已经建立了一套完善的工作体系、管理体系和质量监督体系,并顺利通过国际ISO9001-2000服务质量管理体系认证,国际环境体系认证，国际健康体系认证，中国保洁企业壹级资质、高空清洗壹级资质，酒店烟道清洗资质，石材养护资质，空气检测治理资质，家政定点培训机构，并被中国石材工业协会、中国物业管理协会、中国家庭服务业协会、中国鼠害与卫生虫害防治协会、北京市消防协会，中国室内装饰协会室内检测委员会，北京市有害生物防治协会，北京市私营经济协会等协会聘为会员单位。并被北京市工商局评为“北京市守信企业”光荣称号，一切荣誉为公司的全面发展奠定了良好的基础．目前已与上千家企事业单位，一万多家庭建立了良好的合作关系。&lt;/p&gt;</p><p>&nbsp; 08年北京奥运会过后，越来越多的国际友人和海外华侨，都选择了北京这座国际都市来定居和生活，这意味着保洁的国际化发展需求在不断的扩大和延伸，同时对保洁行业的技术要求也越来越高。作为中国保洁行业的先锋军，奥美林集团公司及时调整保洁技术发展战略，我公司每年派出张教授，去美国、意大利、法国考察和学习国外的先进保结技术，并与国际知名保洁机构法国ISOR保洁公司，签定了长期合作关系，每年我公司都将派出若干保洁技师，学习该公司先进的国际保洁技术，这一举措也使我公司保洁技术及综合实力，一直处于中国及亚太地区领先水平，同步实现奥美林集团公司保洁服务全球化发展战略。</p><p>&nbsp; 奥美林公司面对清洗保洁这个巨大市场,下设奥美林清洗保洁技术推广中心，特聘请清华大学环保专家﹑结合国内外先进的清洁设备及技术做定期指导培训。公司所有作业人员都经过岗前培训——现场实习——上岗作业三个阶段,公司的管理人员和作业人员都具备熟练的专业技能，保洁服务时必须统一着装，佩戴胸卡、严格要求保洁人员在工作中尽心尽力，细致入微的敬业精神，在经营中保持低价位，高标准．公司成立以来，主要承揽家庭、企事业单位、写字楼、物业、学校、酒店、医院等各类清洗保洁业务，同时也是中国具有行业资质证书最全、最大的保洁加盟培训公司，同时也是中国保洁驰名品牌，在中国大部分城市保洁口碑已家喻户晓，学员既能理论又能现场实习操作，真正学到各类专业保洁技术。 &nbsp;</p><p><br/></p>', '高特保洁公司', '高特保洁公司', '1', '1', '2016-06-06 21:16:30', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `gaoteposts` VALUES ('9', '1', '这里是新闻了案例啊啊 啊啊 ', '这里是新闻了案例啊啊 啊啊 ', '2016-06-06 21:55:56', '<p>这里是新闻了案例啊啊 啊啊&nbsp;</p>', '这里是新闻了案例啊啊 啊啊 ', '这里是新闻了案例啊啊 啊啊 ', '1', '1', '2016-06-06 21:55:41', null, '0', null, '', '0', '{\"thumb\":\"\"}', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `gaoterole`
-- ----------------------------
DROP TABLE IF EXISTS `gaoterole`;
CREATE TABLE `gaoterole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of gaoterole
-- ----------------------------
INSERT INTO `gaoterole` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `gaoterole_user`
-- ----------------------------
DROP TABLE IF EXISTS `gaoterole_user`;
CREATE TABLE `gaoterole_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of gaoterole_user
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteroute`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteroute`;
CREATE TABLE `gaoteroute` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of gaoteroute
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteslide`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteslide`;
CREATE TABLE `gaoteslide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of gaoteslide
-- ----------------------------
INSERT INTO `gaoteslide` VALUES ('1', '0', '1111', '/gaote/data/upload/20160604/5751b2ee7ab8f.jpg', '', '', '', '1', '0');
INSERT INTO `gaoteslide` VALUES ('2', '0', '123123123', '/gaote/data/upload/20160604/5751b376ba649.jpg', '', '', '', '1', '0');

-- ----------------------------
-- Table structure for `gaoteslide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteslide_cat`;
CREATE TABLE `gaoteslide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of gaoteslide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `gaoteterms`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteterms`;
CREATE TABLE `gaoteterms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of gaoteterms
-- ----------------------------
INSERT INTO `gaoteterms` VALUES ('4', '分类知识', '', 'article', '分类知识', '0', '0', '0-4', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `gaoteterms` VALUES ('3', '垃圾分类', '', 'article', '垃圾分类', '0', '0', '0-3', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `gaoteterms` VALUES ('5', '垃圾清运', '', 'article', '垃圾清运', '0', '0', '0-5', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `gaoteterms` VALUES ('8', '关于高特', '', 'article', '', '0', '0', '0-8', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `gaoteterms` VALUES ('7', '政策法规', '', 'article', '政策法规', '0', '0', '0-7', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `gaoteterms` VALUES ('9', '首页新闻', '', 'article', '首页新闻', '0', '0', '0-9', '', '', '', 'list', 'article', '0', '1');

-- ----------------------------
-- Table structure for `gaoteterm_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteterm_relationships`;
CREATE TABLE `gaoteterm_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of gaoteterm_relationships
-- ----------------------------
INSERT INTO `gaoteterm_relationships` VALUES ('1', '1', '2', '0', '0');
INSERT INTO `gaoteterm_relationships` VALUES ('2', '2', '3', '0', '1');
INSERT INTO `gaoteterm_relationships` VALUES ('3', '3', '4', '0', '1');
INSERT INTO `gaoteterm_relationships` VALUES ('4', '4', '5', '0', '1');
INSERT INTO `gaoteterm_relationships` VALUES ('5', '5', '6', '0', '1');
INSERT INTO `gaoteterm_relationships` VALUES ('6', '6', '7', '0', '1');
INSERT INTO `gaoteterm_relationships` VALUES ('7', '7', '4', '0', '1');
INSERT INTO `gaoteterm_relationships` VALUES ('8', '8', '8', '0', '1');
INSERT INTO `gaoteterm_relationships` VALUES ('9', '9', '9', '0', '1');

-- ----------------------------
-- Table structure for `gaoteusers`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteusers`;
CREATE TABLE `gaoteusers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of gaoteusers
-- ----------------------------
INSERT INTO `gaoteusers` VALUES ('1', 'admin', '###e3f52466b56dac01b2a1901927f354b8', 'admin', '962343525@qq.com', '', null, '0', null, null, '0.0.0.0', '2016-06-06 21:54:58', '2016-06-02 07:52:34', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `gaoteuser_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `gaoteuser_favorites`;
CREATE TABLE `gaoteuser_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of gaoteuser_favorites
-- ----------------------------
