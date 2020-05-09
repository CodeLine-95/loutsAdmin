/*
 Navicat Premium Data Transfer

 Source Server         : mis_agzjt_com
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : 47.95.1.68:3306
 Source Schema         : mis_agzjt_com

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 09/05/2020 10:19:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for vm_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `vm_auth_group`;
CREATE TABLE `vm_auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_auth_group
-- ----------------------------
INSERT INTO `vm_auth_group` VALUES (1, '监督管理员', 1, '229,238,239,240,241,242,243,249,251,245,246,247,250,254,260,261,263,255,264,265,267,270,271,272,273,252,256,257,258,292,286,330,285,275,276,277,280,281,293,253,268,295,296,298,299,320,321,323,324,300,302,303,305,306,307,308,310,339,340,343,314,315,316,317,326,327,328,329,335,333,334,336,337,341,342');
INSERT INTO `vm_auth_group` VALUES (2, '采购管理员', 1, '238,240,241,242,243,249,251,245,246,247,250,254,263,255,264,265,266,267,270,271,252,256,257,258,259,292,269,286,330,351,293,253,268,300,302,303,305,306,352,307,308,310,339,340,343,314,315,316,317,326,327,328,329,335,331,333,334,336,337,338,342');
INSERT INTO `vm_auth_group` VALUES (3, '行政管理员', 1, '238,229,240,241,242,243,249,251,245,246,247,250,254,260,261,263,255,264,265,267,252,256,257,258,259,292,269,286,330,293,253,268,294,295,296,297,298,299,320,321,322,323,324,325,300,301,302,303,304,305,306,307,308,310,339,340,343,329,328,314,315,316,317,335,331,333,334,336,337,338,341,342');
INSERT INTO `vm_auth_group` VALUES (4, '库房管理员', 1, '238,240,241,242,243,249,251,245,246,247,250,254,260,261,263,255,264,265,267,252,256,257,258,259,292,269,286,330,293,253,268,295,296,300,301,302,303,304,305,306,307,308,310,339,340,343,329,328,314,315,316,317,335,331,333,334,336,337,338,341,342');
INSERT INTO `vm_auth_group` VALUES (5, '楼宇管理员', 1, '240,270,271,272,273,274');
INSERT INTO `vm_auth_group` VALUES (6, '车辆管理员', 1, '238,240,241,242,243,249,251,245,246,247,250,254,260,261,263,293,253,268,295,296,300,301,302,303,304,305,306,307,308,310,339,340,343,329,328,314,315,316,317,335,336,337,338,341,342');
INSERT INTO `vm_auth_group` VALUES (7, '物业经理', 1, '238,240,241,242,249,251,245,246,247,250,254,263,293,253,268,295,296,298,299,320,321,323,324,300,302,303,314,317,326,327,328,329,335,336,337');
INSERT INTO `vm_auth_group` VALUES (8, '程序员', 1, '1,2,223,224,225,3,220,221,222,4,219,226,228,229,238,239,240,241,242,243,244,249,251,245,246,247,248,250,254,260,261,262,263,255,264,265,266,267,270,271,272,273,274,252,256,257,258,259,292,269,286,330,351,285,275,276,277,278,279,291,280,281,282,283,284,293,253,268,294,295,296,297,298,299,320,321,322,323,324,325,300,301,302,303,304,305,306,352,307,308,310,339,340,343,314,315,316,317,326,327,328,329,335,331,332,333,334,336,337,338,341,342');

-- ----------------------------
-- Table structure for vm_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `vm_auth_group_access`;
CREATE TABLE `vm_auth_group_access`  (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_auth_group_access
-- ----------------------------
INSERT INTO `vm_auth_group_access` VALUES (1, 1);
INSERT INTO `vm_auth_group_access` VALUES (2, 1);
INSERT INTO `vm_auth_group_access` VALUES (3, 3);
INSERT INTO `vm_auth_group_access` VALUES (4, 4);
INSERT INTO `vm_auth_group_access` VALUES (5, 3);
INSERT INTO `vm_auth_group_access` VALUES (6, 2);
INSERT INTO `vm_auth_group_access` VALUES (7, 2);
INSERT INTO `vm_auth_group_access` VALUES (8, 6);
INSERT INTO `vm_auth_group_access` VALUES (9, 4);
INSERT INTO `vm_auth_group_access` VALUES (10, 1);
INSERT INTO `vm_auth_group_access` VALUES (11, 7);
INSERT INTO `vm_auth_group_access` VALUES (12, 8);

-- ----------------------------
-- Table structure for vm_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `vm_auth_rule`;
CREATE TABLE `vm_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `pid` smallint(5) UNSIGNED NOT NULL COMMENT '父级ID',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图标',
  `sort` int(50) UNSIGNED NOT NULL COMMENT '排序',
  `condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 395 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_auth_rule
-- ----------------------------
INSERT INTO `vm_auth_rule` VALUES (1, 'admin/user/default', '用户权限', 1, 1, 0, 'layui-icon-rate-half', 8, '');
INSERT INTO `vm_auth_rule` VALUES (2, 'admin/user/userList', '用户管理', 1, 1, 1, '', 1, '');
INSERT INTO `vm_auth_rule` VALUES (3, 'admin/user/ruleList', '权限管理', 1, 1, 1, '', 1, '');
INSERT INTO `vm_auth_rule` VALUES (4, 'admin/user/roleList', '角色管理', 1, 1, 1, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (219, 'admin/user/addRole', '新增角色', 1, 0, 4, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (220, 'admin/user/addRule', '新增权限', 1, 0, 3, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (221, 'admin/user/editRule', '编辑权限', 1, 0, 3, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (222, 'admin/user/deleteRule', '删除权限', 1, 0, 3, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (223, 'admin/User/addUser', '增加用户', 1, 0, 2, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (224, 'admin/user/editUser', '编辑用户', 1, 0, 2, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (225, 'admin/user/deleteUser', '删除用户', 1, 0, 2, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (226, 'admin/user/editRole', '角色授权', 1, 0, 4, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (228, 'admin/user/delRole', '删除角色', 1, 0, 4, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (229, 'admin/userLog/index', '系统日志', 1, 1, 0, 'layui-icon-log', 9, '');
INSERT INTO `vm_auth_rule` VALUES (238, 'admin/user/editpasswd', '修改密码', 1, 0, 0, 'layui-icon-password', 3, '');
INSERT INTO `vm_auth_rule` VALUES (239, 'admin/systemConfig/set', '系统设置', 1, 1, 0, 'layui-icon-util', 10, '');
INSERT INTO `vm_auth_rule` VALUES (240, 'admin/basic/default', '基础数据', 1, 1, 0, 'layui-icon-set-sm', 7, '');
INSERT INTO `vm_auth_rule` VALUES (241, 'admin/goods/goodsList', '资产管理', 1, 1, 240, '', 15, '');
INSERT INTO `vm_auth_rule` VALUES (242, 'admin/goods/addGoods', '增加资产', 1, 0, 241, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (243, 'admin/goods/editGoods', '编辑资产', 1, 0, 241, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (244, 'admin/goods/delGoods', '删除资产', 1, 0, 241, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (245, 'admin/goods/categoryList', '资产分类', 1, 1, 240, 'layui-icon-component', 0, '');
INSERT INTO `vm_auth_rule` VALUES (246, 'admin/goods/addCategory', '增加分类', 1, 0, 245, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (247, 'admin/goods/editCategory', '编辑分类', 1, 0, 245, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (248, 'admin/goods/delCategory', '删除分类', 1, 0, 245, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (249, 'admin/goods/goodsListJson', '资产汇总', 1, 0, 241, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (250, 'admin/goods/categoryListJson', '分类列表', 1, 0, 245, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (251, 'admin/goods/desGoods', '资产详情', 1, 0, 241, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (252, 'admin/storage/default', '采购管理', 1, 1, 0, 'layui-icon-component', 3, '');
INSERT INTO `vm_auth_rule` VALUES (253, 'admin/stocks/stocksList', '库存列表', 1, 1, 293, '', 8, '');
INSERT INTO `vm_auth_rule` VALUES (254, 'admin/goods/storehouseList', '仓库管理', 1, 1, 240, '', 10, '');
INSERT INTO `vm_auth_rule` VALUES (255, 'admin/goods/supplierList', '供应商管理', 1, 1, 240, '', 9, '');
INSERT INTO `vm_auth_rule` VALUES (256, 'admin/storage/storageList', '采购订单', 1, 1, 252, '', 6, '');
INSERT INTO `vm_auth_rule` VALUES (257, 'admin/storage/storageListJson', '资产入库列表', 1, 0, 256, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (258, 'admin/storage/returnNew', '采购退货', 1, 1, 252, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (259, 'admin/storage/returnList', '资产退货列表', 1, 0, 258, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (260, 'admin/goods/addStorehouse', '添加仓库', 1, 0, 254, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (261, 'admin/goods/editStorehouse', '编辑仓库', 1, 0, 254, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (262, 'admin/goods/delStorehouse', '删除仓库', 1, 0, 254, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (263, 'admin/goods/storehouseListJson', '仓库列表', 1, 0, 254, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (264, 'admin/goods/addSupplier', '添加供应商', 1, 0, 255, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (265, 'admin/goods/editSupplier', '编辑供应商', 1, 0, 255, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (266, 'admin/goods/delSupplier', '删除供应商', 1, 0, 255, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (267, 'admin/goods/supplierListJson', '供应商列表', 1, 0, 255, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (268, 'admin/stocks/stocksListJson', '库存数据读取', 1, 0, 253, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (269, 'admin/storage/addStorage', '新建采购', 1, 1, 252, '', 7, '');
INSERT INTO `vm_auth_rule` VALUES (270, 'admin/goods/shopList', '楼宇管理', 1, 1, 240, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (271, 'admin/goods/shopListJson', '楼宇汇总', 1, 0, 270, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (272, 'admin/goods/addShop', '添加楼宇', 1, 0, 270, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (273, 'admin/goods/editShop', '编辑楼宇', 1, 0, 270, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (274, 'admin/goods/delShop', '删除楼宇', 1, 0, 270, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (275, 'admin/member/memberList', '员工管理', 1, 1, 285, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (276, 'admin/member/memberListJson', '职员列表数据', 1, 0, 275, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (277, 'admin/member/addMember', '添加职员', 1, 0, 275, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (278, 'admin/member/editMember', '编辑职员', 1, 0, 275, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (279, 'admin/member/delMember', '删除职员', 1, 0, 275, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (280, 'admin/member/mcategoryList', '部门管理', 1, 1, 285, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (281, 'admin/member/mcategoryListJson', '部门分类列表', 1, 0, 280, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (282, 'admin/member/addMcategory', '添加部门分类', 1, 0, 280, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (283, 'admin/member/editMcategory', '编辑部门分类', 1, 0, 280, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (284, 'admin/member/delMcategory', '删除部门分类', 1, 0, 280, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (285, 'admin/member/memberDefault', '职员管理', 1, 1, 0, 'layui-icon-user', 6, '');
INSERT INTO `vm_auth_rule` VALUES (286, 'admin/storage/returnNewList', '采购退货列表', 1, 1, 252, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (291, 'admin/member/addMemberCard', '职员开户', 1, 0, 275, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (292, 'admin/storage/returnnewListJson', '读取采购退货列表', 1, 0, 258, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (293, 'admin/stocks/default', '库存管理', 1, 1, 0, 'layui-icon-form', 4, '');
INSERT INTO `vm_auth_rule` VALUES (294, 'admin/stocks/stockstake', '新建盘点', 1, 1, 293, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (295, 'admin/stocks/stockstakeList', '历史盘点', 1, 1, 293, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (296, 'admin/stocks/stockstakeListJson', '读取历史盘点', 1, 0, 295, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (297, 'admin/stocks/allot', '新建调拔', 1, 1, 293, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (298, 'admin/stocks/allotList', '调拔列表', 1, 1, 293, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (299, 'admin/stocks/allotListJson', '读取调拔列表', 1, 0, 298, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (300, 'admin/sales/default', '出库管理', 1, 1, 0, 'layui-icon-templeate-1', 3, '');
INSERT INTO `vm_auth_rule` VALUES (301, 'admin/sales/addSales', '新建出库', 1, 1, 300, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (302, 'admin/sales/salesList', '出库列表', 1, 1, 300, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (303, 'admin/sales/salesListJson', '读取出库列表', 1, 0, 302, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (304, 'admin/sales/addReturn', '新建出库退货', 1, 1, 300, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (305, 'admin/sales/returnList', '出库退货列表', 1, 1, 300, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (306, 'admin/returnListJson', '读取退货列表', 1, 0, 305, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (307, 'admin/financial/default', '车辆管理', 1, 1, 0, 'layui-icon-release', 2, '');
INSERT INTO `vm_auth_rule` VALUES (308, 'admin/moduls.moduls_cars/list', '车辆使用记录', 1, 1, 307, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (310, 'admin/moduls.moduls_cars/index', '车辆综合管理', 1, 1, 307, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (314, 'admin/report/default', '统计报表', 1, 1, 0, 'layui-icon-chart-screen', 1, '');
INSERT INTO `vm_auth_rule` VALUES (315, 'admin/report/goods', '资产统计', 1, 1, 314, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (316, 'admin/report/procure', '采购统计', 1, 1, 314, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (317, 'admin/report/sales', '出库统计', 1, 1, 314, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (320, 'admin/stocks/increaseList', '增溢列表', 1, 0, 293, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (321, 'admin/stocks/increaseListJson', '读取增溢列表', 1, 0, 320, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (322, 'admin/stocks/addIncrease', '新建增溢', 1, 0, 320, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (323, 'admin/stocks/decreaseList', '损耗列表', 1, 1, 293, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (324, 'admin/stocks/decreaseListJson', '读取损耗列表', 1, 0, 323, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (325, 'admin/stocks/deIncrease', '新建损耗', 1, 0, 323, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (326, 'admin/index/orderchart', '欢迎页订单统计', 1, 0, 314, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (327, 'admin/index/memberchart', '欢迎页职员统计', 1, 0, 314, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (328, 'admin/pub/selectgoods', '公共路由A', 1, 0, 0, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (329, 'admin/pub/selectbatchgoods', '公共路由B', 1, 0, 0, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (330, 'admin/storage/seeorder', '查看采购订单', 1, 0, 252, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (331, 'admin/storage/editstorage', '编辑采购订单', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (332, 'admin/pub/delorder', '删除采购订单', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (333, 'admin/pub/verifyorder', '审核采购订单', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (334, 'admin/pub/finishorder', '财务审核采购订单', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (335, 'admin/', '其他权限管理', 1, 0, 0, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (336, 'admin/storage/editreturn', '查看出库订单操作', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (337, 'admin/sales/seeorder', '查看出库订单', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (338, 'admin/sales/editsales', '编辑出库订单', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (339, 'admin/moduls.modulscars/edit', '车辆编辑管理', 1, 0, 307, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (340, 'admin/moduls.modulscars/use', '派车用车权限', 1, 0, 307, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (341, 'admin/moduls.modulscars/buy', '保险购买权限', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (342, 'admin/pub/changeitemvalue', '出库订单编辑', 1, 0, 335, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (343, 'admin/moduls.modulscars/back', '车辆回收权限', 1, 0, 307, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (344, 'admin/estate/default', '物业管理', 1, 1, 0, 'layui-icon-group', 0, '');
INSERT INTO `vm_auth_rule` VALUES (345, 'admin/estate.enterprise/index', '企业管理', 1, 1, 344, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (346, 'admin/estate.repair/index', '报修管理', 1, 1, 344, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (347, 'admin/estate.caller/index', '访客管理', 1, 1, 344, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (348, 'admin/estate.car/index', '进车管理', 1, 1, 344, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (349, 'admin/estate.tools/index', '物业工具', 1, 1, 344, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (350, 'admin/estate.safety/index', '安保巡更', 1, 1, 344, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (351, 'admin/storage/storagetotal', '采购汇总', 1, 1, 252, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (352, 'admin/sales/salestotal', '出库汇总', 1, 1, 300, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (353, 'admin/goods/projectList', '工程管理', 1, 1, 240, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (354, 'admin/goods/projectListJson', '工程列表', 1, 0, 353, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (355, 'admin/goods/addProject', '添加工程', 1, 0, 353, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (356, 'admin/goods/editProject', '编辑工程', 1, 0, 353, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (357, 'admin/goods/delProject', '删除工程', 1, 0, 353, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (358, 'admin/estate.car/add', '进车添加', 1, 0, 348, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (359, 'admin/estate.car/edit', '进车编辑', 1, 0, 348, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (360, 'admin/estate.car/del', '进车删除', 1, 0, 348, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (361, 'admin/estate.car/listJson', '进车数据列表', 1, 0, 348, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (362, 'admin/estate.enterprise/listJson', '读取企业管理列表', 1, 0, 345, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (363, 'admin/estate.enterprise/add', '企业添加', 1, 0, 345, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (364, 'admin/estate.enterprise/edit', '企业编辑', 1, 0, 345, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (365, 'admin/estate.enterprise/del', '企业删除', 1, 0, 345, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (366, 'admin/estate.car/show', '进车查看', 1, 0, 348, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (367, 'admin/estate.caller/listJson', '读取访客管理列表', 1, 0, 347, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (368, 'admin/estate.caller/add', '访客添加', 1, 0, 347, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (369, 'admin/estate.caller/edit', '访客编辑', 1, 0, 347, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (370, 'admin/estate.caller/del', '访客删除', 1, 0, 347, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (371, 'admin/estate.code/index', '巡更标识', 1, 1, 344, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (372, 'admin/estate.code/listJson', '标识数据列表', 1, 0, 371, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (373, 'admin/estate.code/add', '标识添加 ', 1, 0, 371, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (374, 'admin/estate.code/edit', '标识编辑', 1, 0, 371, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (375, 'admin/estate.code/del', '标识删除', 1, 0, 371, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (376, 'admin/estate.patrol/index', '巡更计划', 1, 1, 344, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (377, 'admin/estate.patrol/listJson', '巡更计划数据列表', 1, 0, 376, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (378, 'admin/estate.patrol/add', '计划添加', 1, 0, 376, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (379, 'admin/estate.patrol/edit', '计划编辑', 1, 0, 376, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (380, 'admin/estate.patrol/del', '计划删除', 1, 0, 376, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (381, 'admin/estate.repair/listJson', '报修数据列表', 1, 0, 346, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (382, 'admin/estate.repair/add', '报修添加', 1, 0, 346, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (383, 'admin/estate.repair/edit', '报修编辑', 1, 0, 346, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (384, 'admin/estate.repair/del', '报修删除', 1, 0, 346, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (385, 'admin/estate.tools/listJson', '工具数据列表', 1, 0, 349, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (386, 'admin/estate.tools/add', '工具添加', 1, 0, 349, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (387, 'admin/estate.tools/edit', '工具编辑', 1, 0, 349, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (388, 'admin/estate.tools/del', '工具删除', 1, 0, 349, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (389, 'admin/estate.repair/audit', '报修审核', 1, 0, 346, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (390, 'admin/goods/tools', '工具管理', 1, 1, 240, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (391, 'admin/goods/toolsListJson', '读取工具数据列表', 1, 0, 390, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (392, 'admin/goods/addTools', '工具管理添加', 1, 0, 390, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (393, 'admin/goods/editTools', '工具管理编辑', 1, 0, 390, '', 0, '');
INSERT INTO `vm_auth_rule` VALUES (394, 'admin/goods/delTools', '工具管理删除', 1, 0, 390, '', 0, '');

-- ----------------------------
-- Table structure for vm_caller
-- ----------------------------
DROP TABLE IF EXISTS `vm_caller`;
CREATE TABLE `vm_caller`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `caller_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `caller_ename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被访人姓名',
  `caller_cardid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `caller_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `caller_work` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `caller_parking` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车位号',
  `caller_on_time` int(11) NULL DEFAULT NULL COMMENT '来访时间',
  `caller_out_time` int(11) NULL DEFAULT NULL COMMENT '离开时间',
  `is_on_car` int(11) NULL DEFAULT NULL COMMENT '是否开车：0未，1开',
  `caller_car_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号：开车必填',
  `caller_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `caller_enter_id` int(11) NULL DEFAULT NULL COMMENT '被访公司编号',
  `caller_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访客表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_caller
-- ----------------------------
INSERT INTO `vm_caller` VALUES (3, '吴一', '刘小小', '111111111111111111', '13121305007', '测试', 'D001', 1587484800, 1587484800, 0, '', 'aa', 9, 'BGHIL8ZO');
INSERT INTO `vm_caller` VALUES (4, '李静', '宋佳', '111111111111111111', '13501077729', '北京正一科技有限公司', '1', 1587571200, 1587571200, 1, '京AD2252', '', 4, 'SQIXNEHJ');

-- ----------------------------
-- Table structure for vm_card_details
-- ----------------------------
DROP TABLE IF EXISTS `vm_card_details`;
CREATE TABLE `vm_card_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员卡',
  `money` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `type` smallint(6) NOT NULL DEFAULT 0 COMMENT '0消耗，1充值',
  `or_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标订单',
  `time` int(11) NOT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `card_no`(`card_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_card_details
-- ----------------------------

-- ----------------------------
-- Table structure for vm_cars
-- ----------------------------
DROP TABLE IF EXISTS `vm_cars`;
CREATE TABLE `vm_cars`  (
  `car_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '车辆ID',
  `car_no` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆牌号',
  `car_type` smallint(1) NOT NULL COMMENT '1蓝牌,2黄牌,3绿牌',
  `car_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆图片',
  `car_mileage` int(4) NOT NULL DEFAULT 0 COMMENT '行驶里程数',
  `car_buy` int(11) NOT NULL DEFAULT 0 COMMENT '购买时间',
  `car_sort` smallint(1) NOT NULL DEFAULT 0 COMMENT '排序',
  `car_status` smallint(2) NOT NULL DEFAULT 1 COMMENT '0停用,1正常',
  `car_add_time` int(11) NOT NULL COMMENT '添加时间',
  `is_use` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否使用',
  `is_appointment` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否预约',
  `is_repair` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否维修',
  `car_upkeep` int(11) NOT NULL COMMENT '保养时间',
  PRIMARY KEY (`car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_cars
-- ----------------------------
INSERT INTO `vm_cars` VALUES (1, '京ADJ0252', 3, '比亚迪 秦 PRO', 'https://mis.mbacms.com/upload/attach/2020/03/09/5e65ba6927516.png', 19963, 1552406400, 1, 1, 1582724716, 0, 0, 0, 1582724716);
INSERT INTO `vm_cars` VALUES (2, '京Q15MW9', 3, '比亚迪 E5', 'https://mis.mbacms.com/upload/attach/2020/03/09/5e65bb05c4335.png', 57222, 1486137600, 2, 1, 1582731577, 0, 0, 0, 1582724716);
INSERT INTO `vm_cars` VALUES (3, '京N3NN02', 1, '塞纳', 'https://mis.mbacms.com/upload/attach/2020/03/09/5e65b889e61df.png', 66530, 1394121600, 3, 1, 1583724790, 0, 0, 0, 1582646400);
INSERT INTO `vm_cars` VALUES (4, '京N3GQ62', 1, '货车', 'https://mis.mbacms.com/upload/attach/2020/03/09/5e65c2ca00e78.png', 3447, 1552838400, 4, 1, 1583727334, 0, 0, 0, 1582992000);
INSERT INTO `vm_cars` VALUES (5, '京N63J56', 1, '奇瑞', 'https://mis.mbacms.com/upload/attach/2020/03/09/5e65d6c27bf4d.png', 1, 1280073600, 5, 1, 1583732459, 0, 0, 0, 1593532800);
INSERT INTO `vm_cars` VALUES (6, '津D33595', 1, '众泰', 'https://mis.mbacms.com/upload/attach/2020/03/09/5e65d9354898e.png', 1, 1332432000, 6, 1, 1583733070, 0, 0, 0, 1582992000);
INSERT INTO `vm_cars` VALUES (7, '京LF2250', 1, '奔驰S400L', 'https://mis.mbacms.com/upload/attach/2020/03/09/5e65db4abec24.png', 100901, 1367337600, 7, 1, 1583733115, 0, 0, 0, 1582646400);
INSERT INTO `vm_cars` VALUES (8, '京PRQ866', 1, '奥迪A8', 'https://mis.mbacms.com/upload/attach/2020/03/09/5e65d9d374d86.png', 145216, 1261065600, 8, 1, 1583733207, 0, 0, 0, 1606752000);

-- ----------------------------
-- Table structure for vm_cars_record
-- ----------------------------
DROP TABLE IF EXISTS `vm_cars_record`;
CREATE TABLE `vm_cars_record`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `carid` smallint(4) NOT NULL COMMENT '车辆ID',
  `record_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事由',
  `record_time` int(11) NOT NULL COMMENT '发生日期',
  `record_money` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '产生金额',
  `record_mileage` int(4) NOT NULL DEFAULT 0 COMMENT '还车里程',
  `record_oil` int(4) NOT NULL DEFAULT 0 COMMENT '还车油电',
  `record_user` smallint(4) NOT NULL COMMENT '操作员',
  `record_people` smallint(4) NOT NULL COMMENT '关联人员',
  `record_type` smallint(1) NOT NULL DEFAULT 0 COMMENT '0出资,1进资',
  `record_finish` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否结束',
  `record_end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车辆记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_cars_record
-- ----------------------------
INSERT INTO `vm_cars_record` VALUES (1, 1, '疫情期间上下班用车', 1582798246, 0.00, 19630, 64, 1, 7, 0, 1, 1582851600);
INSERT INTO `vm_cars_record` VALUES (2, 2, '疫情期间上下班用车', 1581673968, 0.00, 56365, 80, 1, 18, 0, 1, 1582797228);
INSERT INTO `vm_cars_record` VALUES (3, 2, '疫情期间上下班用车', 1580464800, 0.00, 56429, 33, 3, 18, 0, 1, 1583302471);
INSERT INTO `vm_cars_record` VALUES (4, 1, '带客户看房（信息、M6）', 1583207453, 0.00, 19721, 63, 1, 64, 0, 1, 1583219857);
INSERT INTO `vm_cars_record` VALUES (5, 3, '中国平安（全险）', 1583424000, 0.00, 0, 0, 1, 9, 0, 1, 1614873600);
INSERT INTO `vm_cars_record` VALUES (6, 1, '中国平安（全险）', 1583424000, 0.00, 0, 0, 1, 9, 0, 1, 1614960000);
INSERT INTO `vm_cars_record` VALUES (7, 4, '中国平安（全险）', 1552320000, 0.00, 0, 0, 1, 9, 0, 1, 1615478400);
INSERT INTO `vm_cars_record` VALUES (8, 5, '中国人民保险（强制险）', 1570723200, 0.00, 0, 0, 1, 64, 0, 1, 1602345600);
INSERT INTO `vm_cars_record` VALUES (9, 1, '中国平安（全险）', 1583424000, 0.00, 0, 0, 1, 9, 0, 1, 1614960000);
INSERT INTO `vm_cars_record` VALUES (10, 5, '中国太平洋保险（三者险）', 1587052800, 0.00, 0, 0, 1, 64, 0, 1, 1618588800);
INSERT INTO `vm_cars_record` VALUES (11, 8, '中国平安（强制险）', 1577548800, 0.00, 0, 0, 1, 76, 0, 1, 1609171200);
INSERT INTO `vm_cars_record` VALUES (12, 1, '疫情期间上下班用车', 1583755200, 0.00, 19865, 86, 6, 7, 0, 1, 1583800200);
INSERT INTO `vm_cars_record` VALUES (13, 1, '因公外出去创新办事', 1583802054, 0.00, 19876, 68, 6, 25, 0, 1, 1583812221);
INSERT INTO `vm_cars_record` VALUES (14, 3, '因公外出办事', 1583810514, 0.00, 0, 0, 6, 9, 1, 1, 1584877300);
INSERT INTO `vm_cars_record` VALUES (15, 2, '疫情期间上下班用车', 1583834400, 0.00, 57109, 35, 1, 18, 0, 1, 1583888400);
INSERT INTO `vm_cars_record` VALUES (16, 1, '疫情期间上下班用车', 1583924400, 0.00, 19895, 61, 1, 7, 0, 1, 1583971803);
INSERT INTO `vm_cars_record` VALUES (17, 2, '疫情期间上下班用车', 1583920800, 0.00, 57145, 39, 1, 18, 0, 1, 1583975400);
INSERT INTO `vm_cars_record` VALUES (18, 1, '因公外出：去硅谷亮城办理电话号码', 1583978717, 0.00, 19901, 47, 1, 6, 0, 1, 1583992285);
INSERT INTO `vm_cars_record` VALUES (19, 8, '因公办事：测试车辆', 1584000006, 0.00, 145216, 10, 1, 25, 0, 1, 1584002978);
INSERT INTO `vm_cars_record` VALUES (20, 4, '因公办事：测试车辆', 1584003189, 0.00, 3292, 50, 1, 25, 0, 1, 1584003199);
INSERT INTO `vm_cars_record` VALUES (21, 2, '情期间上下班用车', 1584007200, 0.00, 57222, 15, 1, 18, 0, 1, 1584061129);
INSERT INTO `vm_cars_record` VALUES (22, 1, '情期间上下班用车', 1584100800, 0.00, 19963, 0, 1, 7, 1, 1, 1584317460);

-- ----------------------------
-- Table structure for vm_category
-- ----------------------------
DROP TABLE IF EXISTS `vm_category`;
CREATE TABLE `vm_category`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分类状态',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '父ID',
  `sort` tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_category
-- ----------------------------
INSERT INTO `vm_category` VALUES (1, '行政类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (2, '财务类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (3, '物业类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (4, '工程类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (5, '接待类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (6, '资产类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (7, '会议类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (8, '礼品类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (9, '工具类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (10, '电脑类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (11, '配件类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (12, '管材类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (13, '弱电类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (14, '强电类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (15, '烟酒茶类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (16, '保安保洁类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (17, '工服工装类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (18, '水果零食类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (19, '图书资料类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (20, '客户代购类', 1, 0, 0, NULL);
INSERT INTO `vm_category` VALUES (21, '防疫物资类', 1, 0, 0, '');

-- ----------------------------
-- Table structure for vm_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `vm_enterprise`;
CREATE TABLE `vm_enterprise`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `enter_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业名称',
  `enter_acreage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租赁面积',
  `enter_short` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业简称',
  `enter_people` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `enter_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `enter_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司座机',
  `enter_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系地址',
  `enter_time` int(11) NOT NULL COMMENT '登记日期',
  `enter_leave` int(11) NOT NULL COMMENT '离场日期',
  `enter_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '企业状态',
  `enter_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '企业简介',
  `enter_butler` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业管家',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_enterprise
-- ----------------------------
INSERT INTO `vm_enterprise` VALUES (1, '湖南祥龙飞机有限公司', '133.27', '祥龙飞机', '张先生', '13121305007', '1', '湖南省长沙市', 1586620800, 1588176000, 1, '无', '94');
INSERT INTO `vm_enterprise` VALUES (2, '测试企业166.25平米', '166.25', '测试企业', '测试', '12121211', '2', '测试地址', 1587139200, 1588176000, 1, '测试企业简介', '93');
INSERT INTO `vm_enterprise` VALUES (3, '测试企业300平米', '300', '1', '1', '1', '1', '1', 1587484800, 1618934400, 1, '1', '94');
INSERT INTO `vm_enterprise` VALUES (4, '测试2', '100', '测试2', '1', '1', '01082828345', '1', 1559232000, 1590854400, 1, '1', '94');

-- ----------------------------
-- Table structure for vm_financial_details
-- ----------------------------
DROP TABLE IF EXISTS `vm_financial_details`;
CREATE TABLE `vm_financial_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_type` smallint(1) NOT NULL DEFAULT 1 COMMENT '1表借进，0表贷出',
  `f_money` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '交易金额',
  `f_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易事由',
  `f_username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经手人',
  `f_time` int(11) NOT NULL COMMENT '交易时间',
  `f_channel` smallint(2) NOT NULL COMMENT '交易途径',
  `f_come` tinyint(1) NOT NULL DEFAULT 1 COMMENT '金额来源，1表POS，2表会员',
  `handover` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否交接',
  `handtime` int(11) NOT NULL DEFAULT 0 COMMENT '交接时间',
  `f_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `handover`(`handover`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_financial_details
-- ----------------------------
INSERT INTO `vm_financial_details` VALUES (1, 1, 469.00, '订单VM_20200319-4-312收款', 'root', 1584715451, 1, 1, 1, 1584715451, '');

-- ----------------------------
-- Table structure for vm_goods
-- ----------------------------
DROP TABLE IF EXISTS `vm_goods`;
CREATE TABLE `vm_goods`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `sku` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品货号',
  `barcode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条码',
  `unit` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `spec` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `lead_time` int(11) NULL DEFAULT NULL COMMENT '交期',
  `category` smallint(4) NOT NULL COMMENT '分类',
  `min_pack` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最小包装',
  `contact` smallint(4) NULL DEFAULT NULL COMMENT '对应往来单位',
  `min_qty` int(4) NOT NULL DEFAULT 1 COMMENT '最小订量',
  `net` float(8, 2) NOT NULL DEFAULT 0.00 COMMENT '净重',
  `wet` float(8, 2) NOT NULL DEFAULT 0.00 COMMENT '毛重',
  `org` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地',
  `cost` float(8, 2) NOT NULL DEFAULT 0.00 COMMENT '成本',
  `price` float(8, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `word` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '助记词',
  `overflow` smallint(1) NOT NULL DEFAULT 1 COMMENT '允许负出库',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `status` smallint(1) NOT NULL DEFAULT 1 COMMENT '产品状态',
  `shop` int(4) NOT NULL DEFAULT 0 COMMENT '所属店铺',
  `sales` float(8, 2) NOT NULL DEFAULT 0.00 COMMENT '产品销量',
  `replenishment` tinyint(2) NOT NULL DEFAULT 10 COMMENT '补货数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sku`(`sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 651 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_goods
-- ----------------------------
INSERT INTO `vm_goods` VALUES (1, '天茯茶-白沙溪1939', 'AGZ-ZC-0000001', 'AGZ-TM-00001', '盒', '20盒/箱', NULL, 8, NULL, 5, 1, 0.00, 0.00, '湖南', 135.00, 135.00, 'RW', 1, '价格为测试价格', '0000-00-00 00:00:00', 1, 0, -209.00, 10);
INSERT INTO `vm_goods` VALUES (2, '永兴冰糖橙', 'AGZ-ZC-0000002', 'AGZ-TM-00002', '箱', '9公斤/箱', NULL, 8, NULL, 5, 1, 0.91, 1.00, '北京', 80.00, 80.00, 'ZHYR', 1, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (3, '私人定制酒', 'AGZ-ZC-0000003', 'AGZ-TM-00003', '瓶', '6瓶/箱', NULL, 15, NULL, 10, 0, 3.00, 4.50, '贵州茅台镇', 229.00, 229.00, NULL, 0, NULL, '1999-12-31 00:00:00', 1, 0, 0.00, 127);
INSERT INTO `vm_goods` VALUES (4, '安光正定制酒', 'AGZ-ZC-0000004', 'AGZ-TM-00004', '箱', '6瓶/箱', NULL, 15, NULL, 10, 0, 3.00, 4.50, '贵州茅台镇', 599.00, 599.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 100);
INSERT INTO `vm_goods` VALUES (5, '飞天茅台酒', 'AGZ-ZC-0000005', 'AGZ-TM-00005', '瓶', '6瓶/箱', NULL, 15, NULL, 5, 0, 0.00, 0.00, NULL, 1499.00, 1499.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (6, '自购红酒', 'AGZ-ZC-0000006', 'AGZ-TM-00006', '瓶', '6瓶/箱', NULL, 15, NULL, 5, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '1999-12-31 00:00:00', 1, 0, -97.00, 0);
INSERT INTO `vm_goods` VALUES (7, '新会陈皮', 'AGZ-ZC-0000007', 'AGZ-TM-00007', '盒', '1盒自装', NULL, 8, NULL, 5, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, -5.00, 0);
INSERT INTO `vm_goods` VALUES (8, '中华烟-软盒', 'AGZ-ZC-0000008', 'AGZ-TM-00008', '条', '10盒/条', NULL, 15, NULL, 4, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, -59.00, 0);
INSERT INTO `vm_goods` VALUES (9, '中华烟-硬盒', 'AGZ-ZC-0000009', 'AGZ-TM-00009', '条', '10盒/条', NULL, 15, NULL, 4, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, -4.00, 0);
INSERT INTO `vm_goods` VALUES (10, '玉溪烟-软盒', 'AGZ-ZC-0000010', 'AGZ-TM-00010', '条', '10盒/条', NULL, 15, NULL, 4, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, -2.00, 0);
INSERT INTO `vm_goods` VALUES (11, '私人窖藏酒', 'AGZ-ZC-0000011', 'AGZ-TM-00011', '瓶', '6瓶/箱', NULL, 15, NULL, 10, 0, 4.50, 0.00, '贵州茅台镇', 229.00, 229.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, -1565.00, 100);
INSERT INTO `vm_goods` VALUES (12, '将军伏茶', 'AGZ-ZC-0000012', 'AGZ-TM-00012', '盒', '8盒/箱', NULL, 8, NULL, 5, 0, 0.00, 0.00, '湖南', 235.00, 235.00, NULL, 0, '', '0000-00-00 00:00:00', 1, 0, -3.00, 5);
INSERT INTO `vm_goods` VALUES (13, '亚麻籽油', 'AGZ-ZC-0000013', 'AGZ-TM-00013', '瓶', '1瓶/箱', NULL, 8, NULL, 5, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '1999-12-31 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (14, '中秋月饼A', 'AGZ-ZC-0000014', 'AGZ-TM-00014', '盒', 'A类', NULL, 8, NULL, 5, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (15, '中秋月饼B', 'AGZ-ZC-0000015', 'AGZ-TM-00015', '盒', 'B类', NULL, 8, NULL, 5, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (16, '中秋月饼C', 'AGZ-ZC-0000016', 'AGZ-TM-00016', '盒', 'C类', NULL, 8, NULL, 5, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (17, '黄果树烟', 'AGZ-ZC-0000017', 'AGZ-TM-00017', '条', '10盒/条', NULL, 15, NULL, 4, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (18, '三星S8手机', 'AGZ-ZC-0000018', 'AGZ-TM-00018', '台', '1/台', NULL, 11, NULL, 7, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '1999-12-31 00:00:00', 1, 0, 1.00, 0);
INSERT INTO `vm_goods` VALUES (19, '衡水老白干酒', 'AGZ-ZC-0000019', 'AGZ-TM-00019', '瓶', '6瓶/箱', NULL, 15, NULL, 8, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, -4.00, 0);
INSERT INTO `vm_goods` VALUES (20, '金银花茶', 'AGZ-ZC-0000020', 'AGZ-TM-00020', '盒', '盒', NULL, 8, NULL, 8, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '1999-12-31 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (21, '木盒红酒（小）', 'AGZ-ZC-0000021', 'AGZ-TM-00021', '瓶', '6瓶/箱', NULL, 15, NULL, 5, 0, 0.00, 0.00, '', 200.00, 200.00, NULL, 0, '', '0000-00-00 00:00:00', 1, 0, -8.00, 0);
INSERT INTO `vm_goods` VALUES (22, '木盒红酒（大）', 'AGZ-ZC-0000022', 'AGZ-TM-00022', '瓶', '6瓶/箱', NULL, 15, NULL, 5, 0, 0.00, 0.00, NULL, 1.00, 1.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (23, '芬享艺术红酒', 'AGZ-ZC-0000023', 'AGZ-TM-00023', '瓶', '瓶', NULL, 15, NULL, 8, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (24, '红枣', 'AGZ-ZC-0000024', 'AGZ-TM-00024', '盒', '盒', NULL, 8, NULL, 8, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, NULL, '1999-12-31 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (25, '上下铺', 'AGZ-ZC-0000025', 'AGZ-TM-00025', '套', '90*190', NULL, 6, NULL, 12, 0, 0.00, 0.00, NULL, 280.00, 280.00, NULL, 0, '科实', '2000-01-01 00:00:01', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (26, 'A4纸', 'AGZ-ZC-0000026', 'AGZ-TM-00026', '箱', '高质量', NULL, 1, NULL, 12, 0, 0.00, 0.00, NULL, 145.00, 145.00, NULL, 0, '总办', '2000-01-01 00:00:02', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (27, '电风扇', 'AGZ-ZC-0000027', 'AGZ-TM-00027', '台', '台式', NULL, 6, NULL, 12, 0, 0.00, 0.00, NULL, 80.00, 80.00, NULL, 0, '科实', '2000-01-01 00:00:03', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (28, '卧式脚踏阀', 'AGZ-ZC-0000028', 'AGZ-TM-00028', '个', '科实更换', NULL, 3, NULL, 12, 0, 0.00, 0.00, NULL, 105.00, 105.00, NULL, 0, '科实', '2000-01-01 00:00:04', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (29, '投光灯-1000W', 'AGZ-ZC-0000029', 'AGZ-TM-00029', '个', '1000W', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 113.00, 113.00, NULL, 0, '物业', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (30, '投光灯-精准度高', 'AGZ-ZC-0000030', 'AGZ-TM-00030', '台', '精准度高', NULL, 3, NULL, 12, 0, 0.00, 0.00, '', 90.00, 90.00, NULL, 0, '科实', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (31, '钳子', 'AGZ-ZC-0000031', 'AGZ-TM-00031', '把', '普通', NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '科实', '2000-01-01 00:00:07', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (32, '电风扇', 'AGZ-ZC-0000032', 'AGZ-TM-00032', '个', '台式', NULL, 6, NULL, 12, 0, 0.00, 0.00, NULL, 80.00, 80.00, NULL, 0, '科实', '2000-01-01 00:00:08', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (33, '瓶装水', 'AGZ-ZC-0000033', 'AGZ-TM-00033', '箱', '怡宝', NULL, 1, NULL, 12, 0, 0.00, 0.00, NULL, 23.00, 23.00, NULL, 0, '二号会议室', '2000-01-01 00:00:09', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (34, '卷纸', 'AGZ-ZC-0000034', 'AGZ-TM-00034', '提', '普通', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 16.00, 16.00, NULL, 0, '日常消耗补充', '2000-01-01 00:00:10', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (35, '绝缘胶带', 'AGZ-ZC-0000035', 'AGZ-TM-00035', '卷', '普通', NULL, 1, NULL, 12, 0, 0.00, 0.00, NULL, 2.00, 2.00, NULL, 0, '日常消耗补充', '2000-01-01 00:00:11', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (36, '火碱', 'AGZ-ZC-0000036', 'AGZ-TM-00036', '包', NULL, NULL, 6, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, 'M6', '2000-01-01 00:00:12', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (37, '吸尘器内胆', 'AGZ-ZC-0000037', 'AGZ-TM-00037', '个', '70L', NULL, 11, NULL, 12, 0, 0.00, 0.00, NULL, 80.00, 80.00, NULL, 0, 'M6', '2000-01-01 00:00:13', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (38, '保洁工服', 'AGZ-ZC-0000038', 'AGZ-TM-00038', '套', '180/175', NULL, 17, NULL, 12, 0, 0.00, 0.00, NULL, 35.00, 35.00, NULL, 0, 'M6', '2000-01-01 00:00:14', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (39, '电工工服', 'AGZ-ZC-0000039', 'AGZ-TM-00039', '套', '185', NULL, 17, NULL, 12, 0, 0.00, 0.00, NULL, 73.00, 73.00, NULL, 0, 'M6', '2000-01-01 00:00:15', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (40, '角磨机', 'AGZ-ZC-0000040', 'AGZ-TM-00040', '个', NULL, NULL, 4, NULL, 12, 0, 0.00, 0.00, NULL, 150.00, 150.00, NULL, 0, '三层多功能厅', '2000-01-01 00:00:16', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (41, '切片', 'AGZ-ZC-0000041', 'AGZ-TM-00041', '盒', NULL, NULL, 4, NULL, 12, 0, 0.00, 0.00, NULL, 45.00, 45.00, NULL, 0, '三层多功能厅', '2000-01-01 00:00:17', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (42, '改锥十字', 'AGZ-ZC-0000042', 'AGZ-TM-00042', '个', '大', NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 7.00, 7.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:18', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (43, '改锥十字', 'AGZ-ZC-0000043', 'AGZ-TM-00043', '个', '中', NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 13.00, 13.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:19', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (44, '改锥十字', 'AGZ-ZC-0000044', 'AGZ-TM-00044', '个', '小', NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 9.00, 9.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:20', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (45, '改锥一字', 'AGZ-ZC-0000045', 'AGZ-TM-00045', '个', '大', NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 7.00, 7.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:21', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (46, '改锥一字', 'AGZ-ZC-0000046', 'AGZ-TM-00046', '个', '中', NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 13.00, 13.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:22', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (47, '改锥一字', 'AGZ-ZC-0000047', 'AGZ-TM-00047', '个', '小', NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 9.00, 9.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:23', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (48, '老虎钳', 'AGZ-ZC-0000048', 'AGZ-TM-00048', '个', NULL, NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:24', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (49, '尖口钳', 'AGZ-ZC-0000049', 'AGZ-TM-00049', '个', NULL, NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 13.00, 13.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:25', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (50, '斜口钳', 'AGZ-ZC-0000050', 'AGZ-TM-00050', '个', NULL, NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 13.00, 13.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:26', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (51, '活动扳手', 'AGZ-ZC-0000051', 'AGZ-TM-00051', '个', NULL, NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:27', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (52, '电笔', 'AGZ-ZC-0000052', 'AGZ-TM-00052', '个', '艿管', NULL, 9, NULL, 12, 0, 0.00, 0.00, NULL, 3.00, 3.00, NULL, 0, 'M6电工工具', '2000-01-01 00:00:28', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (53, '小便池下水圈', 'AGZ-ZC-0000053', 'AGZ-TM-00053', '个', '黑', NULL, 11, NULL, 12, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '工程库房', '2000-01-01 00:00:29', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (54, '配钥匙（5元）', 'AGZ-ZC-0000054', 'AGZ-TM-00054', '把', '把', NULL, 3, NULL, 12, 0, 0.00, 0.00, '', 5.00, 5.00, NULL, 0, '电井设备间钥匙', '0000-00-00 00:00:00', 1, 0, -2.00, 0);
INSERT INTO `vm_goods` VALUES (55, '档案袋-2019', 'AGZ-ZC-0000055', 'AGZ-TM-00055', '个', '个', NULL, 1, NULL, 19, 0, 0.00, 0.00, NULL, 0.80, 0.80, NULL, 0, '库房留存', '1999-12-31 00:00:00', 1, 0, -80.00, 0);
INSERT INTO `vm_goods` VALUES (56, 'U盘', 'AGZ-ZC-0000056', 'AGZ-TM-00056', '个', '16G', NULL, 11, NULL, 12, 0, 0.00, 0.00, NULL, 38.00, 38.00, NULL, 0, '库房留存', '2000-01-01 00:00:32', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (57, '单页文件盒', 'AGZ-ZC-0000057', 'AGZ-TM-00057', '个', NULL, NULL, 1, NULL, 19, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '库房留存', '2000-01-01 00:00:33', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (58, '瓶装水', 'AGZ-ZC-0000058', 'AGZ-TM-00058', '箱', '小瓶', NULL, 1, NULL, 19, 0, 0.00, 0.00, NULL, 23.00, 23.00, NULL, 0, '库房留存', '2000-01-01 00:00:34', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (59, '锁芯', 'AGZ-ZC-0000059', 'AGZ-TM-00059', '个', NULL, NULL, 3, NULL, 17, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '库房留存', '2000-01-01 00:00:35', 1, 0, -1.00, 0);
INSERT INTO `vm_goods` VALUES (60, '文件合页夹', 'AGZ-ZC-0000060', 'AGZ-TM-00060', '个', '双页', NULL, 1, NULL, 19, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '库房留存', '2000-01-01 00:00:36', 1, 0, -8.00, 0);
INSERT INTO `vm_goods` VALUES (61, '文件夹', 'AGZ-ZC-0000061', 'AGZ-TM-00061', '个', '单页', NULL, 1, NULL, 12, 0, 0.00, 0.00, NULL, 4.00, 4.00, NULL, 0, '库房留存', '2000-01-01 00:00:37', 1, 0, -6.00, 0);
INSERT INTO `vm_goods` VALUES (62, '文件袋', 'AGZ-ZC-0000062', 'AGZ-TM-00062', '包', '一包30个', NULL, 1, NULL, 15, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, '库房留存', '2000-01-01 00:00:38', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (63, '打印机油墨', 'AGZ-ZC-0000063', 'AGZ-TM-00063', '瓶', NULL, NULL, 1, NULL, 15, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '总办打印机', '2000-01-01 00:00:39', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (64, '文件盒', 'AGZ-ZC-0000064', 'AGZ-TM-00064', '个', '蓝', NULL, 1, NULL, 15, 0, 0.00, 0.00, NULL, 7.00, 7.00, NULL, 0, '库房留存', '2000-01-01 00:00:40', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (65, '文件架', 'AGZ-ZC-0000065', 'AGZ-TM-00065', '个', '蓝', NULL, 1, NULL, 12, 0, 0.00, 0.00, NULL, 12.00, 12.00, NULL, 0, '库房留存', '2000-01-01 00:00:41', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (66, '双面胶', 'AGZ-ZC-0000066', 'AGZ-TM-00066', '个', '大/小各10', NULL, 1, NULL, 14, 0, 0.00, 0.00, NULL, 1.50, 1.50, NULL, 0, '库房留存', '2000-01-01 00:00:42', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (67, 'PVC展会证', 'AGZ-ZC-0000067', 'AGZ-TM-00067', '个', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 1.80, 1.80, NULL, 0, '库房留存', '2000-01-01 00:00:43', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (68, '中性笔', 'AGZ-ZC-0000068', 'AGZ-TM-00068', '盒', '黑', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '库房留存', '2000-01-01 00:00:44', 1, 0, -3.00, 0);
INSERT INTO `vm_goods` VALUES (69, '美工刀', 'AGZ-ZC-0000069', 'AGZ-TM-00069', '个', NULL, NULL, 9, NULL, 14, 0, 0.00, 0.00, NULL, 3.80, 3.80, NULL, 0, '库房留存', '2000-01-01 00:00:45', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (70, '刀片', 'AGZ-ZC-0000070', 'AGZ-TM-00070', '盒', NULL, NULL, 9, NULL, 15, 0, 0.00, 0.00, NULL, 5.50, 5.50, NULL, 0, '库房留存', '2000-01-01 00:00:46', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (71, '电工工服', 'AGZ-ZC-0000071', 'AGZ-TM-00071', '套', '夏', NULL, 17, NULL, 14, 0, 0.00, 0.00, NULL, 70.00, 70.00, NULL, 0, 'M6电工', '2000-01-01 00:00:47', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (72, '下水道软管', 'AGZ-ZC-0000072', 'AGZ-TM-00072', '个', NULL, NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '创新大厦', '2000-01-01 00:00:48', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (73, '除胶剂', 'AGZ-ZC-0000073', 'AGZ-TM-00073', '瓶', '普通', NULL, 3, NULL, 17, 0, 0.00, 0.00, NULL, 18.00, 18.00, NULL, 0, 'M6保洁', '2000-01-01 00:00:49', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (74, '工作服', 'AGZ-ZC-0000074', 'AGZ-TM-00074', '套', '电工', NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 70.00, 70.00, NULL, 0, 'M6电工', '2000-01-01 00:00:50', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (75, 'A4纸', 'AGZ-ZC-0000075', 'AGZ-TM-00075', '箱', '普通', NULL, 1, NULL, 3, 0, 0.00, 0.00, NULL, 190.00, 190.00, NULL, 0, '库房留存及日常消耗', '2000-01-01 00:00:51', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (76, '剪刀', 'AGZ-ZC-0000076', 'AGZ-TM-00076', '把', '中号', NULL, 1, NULL, 15, 0, 0.00, 0.00, NULL, 4.50, 4.50, NULL, 0, '库房留存及日常消耗', '2000-01-01 00:00:52', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (77, '卷纸', 'AGZ-ZC-0000077', 'AGZ-TM-00077', '提', '普通', NULL, 1, NULL, 15, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, '库房留存及日常消耗', '2000-01-01 00:00:53', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (78, '胶棒', 'AGZ-ZC-0000078', 'AGZ-TM-00078', '个', NULL, NULL, 1, NULL, 15, 0, 0.00, 0.00, NULL, 2.50, 2.50, NULL, 0, '库房留存及日常消耗', '2000-01-01 00:00:54', 1, 0, -6.00, 0);
INSERT INTO `vm_goods` VALUES (79, '一次性筷子', 'AGZ-ZC-0000079', 'AGZ-TM-00079', '包', NULL, NULL, 1, NULL, 16, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '库房留存及日常消耗', '2000-01-01 00:00:55', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (80, '一次性纸杯', 'AGZ-ZC-0000080', 'AGZ-TM-00080', '箱', NULL, NULL, 1, NULL, 16, 0, 0.00, 0.00, NULL, 200.00, 200.00, NULL, 0, '库房留存及日常消耗', '2000-01-01 00:00:56', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (81, '前台工服', 'AGZ-ZC-0000081', 'AGZ-TM-00081', '套', '170', NULL, 17, NULL, 16, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, '库房留存及日常消耗', '2000-01-01 00:00:57', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (82, '地毯刷', 'AGZ-ZC-0000082', 'AGZ-TM-00082', '个', NULL, NULL, 3, NULL, 16, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '物业保洁', '2000-01-01 00:00:58', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (83, '铲刀', 'AGZ-ZC-0000083', 'AGZ-TM-00083', '个', NULL, NULL, 3, NULL, 16, 0, 0.00, 0.00, NULL, 6.00, 6.00, NULL, 0, '物业保洁', '2000-01-01 00:00:59', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (84, '玻璃刷', 'AGZ-ZC-0000084', 'AGZ-TM-00084', '个', '带毛', NULL, 3, NULL, 13, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业保洁', '1999-12-31 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (85, '玻璃刷', 'AGZ-ZC-0000085', 'AGZ-TM-00085', '个', '平头', NULL, 3, NULL, 3, 0, 0.00, 0.00, NULL, 12.00, 12.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (86, '玻璃刷杆', 'AGZ-ZC-0000086', 'AGZ-TM-00086', '个', '配套', NULL, 3, NULL, 3, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (87, '地毯刷杆', 'AGZ-ZC-0000087', 'AGZ-TM-00087', '个', '配套', NULL, 3, NULL, 14, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (88, '绝缘鞋', 'AGZ-ZC-0000088', 'AGZ-TM-00088', '双', '43', NULL, 3, NULL, 3, 0, 0.00, 0.00, NULL, 26.00, 26.00, NULL, 0, '物业电工', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (89, '壁纸刀', 'AGZ-ZC-0000089', 'AGZ-TM-00089', '个', '好的', NULL, 3, NULL, 3, 0, 0.00, 0.00, NULL, 9.00, 9.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (90, '壁纸刀片', 'AGZ-ZC-0000090', 'AGZ-TM-00090', '盒', NULL, NULL, 3, NULL, 3, 0, 0.00, 0.00, NULL, 3.00, 3.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (91, '螺丝刀', 'AGZ-ZC-0000091', 'AGZ-TM-00091', '把', '一字十字各1', NULL, 9, NULL, 11, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (92, '内扣三通', 'AGZ-ZC-0000092', 'AGZ-TM-00092', '个', '4分', NULL, 9, NULL, 3, 0, 0.00, 0.00, NULL, 5.50, 5.50, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (93, '6角扳手', 'AGZ-ZC-0000093', 'AGZ-TM-00093', '把', '8-10 10-12', NULL, 9, NULL, 13, 0, 0.00, 0.00, NULL, 5.50, 5.50, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (94, '管卡', 'AGZ-ZC-0000094', 'AGZ-TM-00094', '个', '4分', NULL, 9, NULL, 13, 0, 0.00, 0.00, NULL, 0.20, 0.20, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (95, '钻头', 'AGZ-ZC-0000095', 'AGZ-TM-00095', '包', '3.2', NULL, 9, NULL, 1, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (96, '钻头', 'AGZ-ZC-0000096', 'AGZ-TM-00096', '包', '4.2', NULL, 9, NULL, 1, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (97, '钻头', 'AGZ-ZC-0000097', 'AGZ-TM-00097', '包', '5.2', NULL, 9, NULL, 11, 0, 0.00, 0.00, NULL, 20.00, 20.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (98, '珋钉', 'AGZ-ZC-0000098', 'AGZ-TM-00098', '盒', '好的', NULL, 3, NULL, 11, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (99, '拉柳抢', 'AGZ-ZC-0000099', 'AGZ-TM-00099', '个', '好的', NULL, 3, NULL, 11, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (100, '螺丝', 'AGZ-ZC-0000100', 'AGZ-TM-00100', '盒', '4个', NULL, 3, NULL, 3, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '科实维修厕所及维修窗户', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (101, '灯管LED', 'AGZ-ZC-0000101', 'AGZ-TM-00101', '个', NULL, NULL, 3, NULL, 11, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '作业帮', '2000-01-01 00:00:00', 1, 0, 1.00, 0);
INSERT INTO `vm_goods` VALUES (102, '启动器', 'AGZ-ZC-0000102', 'AGZ-TM-00102', '个', '40瓦', NULL, 3, NULL, 11, 1, 0.00, 0.00, '北京', 2.00, 2.00, '30MPC', 1, '作业帮', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (103, '多功能人字升降合梯', 'AGZ-ZC-0000103', 'AGZ-TM-000103', '个', '6米', NULL, 3, NULL, 11, 1, 0.00, 0.00, NULL, 870.00, 870.00, 'YBKC', 1, '作业帮', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (104, '长袖工作服', 'AGZ-ZC-0000104', 'AGZ-TM-0000104', '套', '185', NULL, 3, NULL, 5, 1, 5.50, 5.50, '北京', 80.00, 80.00, 'PGDN', 1, 'M6电工', '2000-01-01 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (105, '保安服', 'AGZ-ZC-0000105', 'AGZ-TM-0000105', '套', 'XXL', NULL, 3, NULL, 7, 1, 1.70, 1.70, '北京', 120.00, 120.00, 'PGDN', 1, '保安', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (106, '塑料软管', 'AGZ-ZC-0000106', 'AGZ-TM-0000106', '个', NULL, NULL, 3, NULL, 12, 1, 0.00, 0.00, NULL, 10.00, 10.00, 'YJD', 1, '厕所维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (107, '电池', 'AGZ-ZC-0000107', 'AGZ-TM-0000107', '个', '5#', NULL, 3, NULL, 12, 1, 0.00, 0.00, NULL, 1.80, 1.80, 'DTZ', 1, '厕所维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (108, '瓶装水', 'AGZ-ZC-0000108', 'AGZ-TM-0000108', '箱', '小瓶', NULL, 3, NULL, 12, 1, 0.00, 0.00, NULL, 23.00, 23.00, 'SLSJ', 1, '库房留存', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (109, '扣取纸', 'AGZ-ZC-0000109', 'AGZ-TM-0000109', '包', '大中小各10', NULL, 3, NULL, 18, 1, 0.00, 0.00, NULL, 2.50, 2.50, 'MTS', 1, '库房留存', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (110, '曲别针', 'AGZ-ZC-0000110', 'AGZ-TM-0000110', '盒', NULL, NULL, 3, NULL, 15, 1, 0.00, 0.00, NULL, 2.00, 2.00, 'SCJ', 1, '库房留存', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (111, '洗手液', 'AGZ-ZC-0000111', 'AGZ-TM-0000111', '箱', NULL, NULL, 3, NULL, 18, 1, 0.00, 0.00, NULL, 114.00, 114.00, 'CJJ', 1, '物业保洁', '2000-01-01 00:00:00', 1, 0, -4.00, 10);
INSERT INTO `vm_goods` VALUES (112, '洗洁灵', 'AGZ-ZC-0000112', 'AGZ-TM-0000112', '箱', NULL, NULL, 3, NULL, 18, 1, 0.00, 0.00, NULL, 60.00, 60.00, 'TB', 1, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (113, '芳香盒', 'AGZ-ZC-0000113', 'AGZ-TM-0000113', '箱', NULL, NULL, 3, NULL, 18, 1, 0.00, 0.00, NULL, 200.00, 200.00, 'ZSC', 1, '物业保洁', '2000-01-01 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (114, '扫把撮子', 'AGZ-ZC-0000114', 'AGZ-TM-0000114', '套', NULL, NULL, 3, NULL, 18, 1, 0.00, 0.00, NULL, 15.00, 15.00, 'XJST', 1, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (115, '保洁工服', 'AGZ-ZC-0000115', 'AGZ-TM-0000115', '套', '190', NULL, 3, NULL, 18, 1, 0.00, 0.00, NULL, 43.00, 43.00, 'CTJDH', 1, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (116, '保洁工服', 'AGZ-ZC-0000116', 'AGZ-TM-0000116', '套', '185', NULL, 3, NULL, 18, 1, 0.00, 0.00, NULL, 44.00, 44.00, 'CTJB', 1, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (117, '保洁工服', 'AGZ-ZC-0000117', 'AGZ-TM-0000117', '套', '180', NULL, 3, NULL, 3, 1, 0.00, 0.00, NULL, 45.00, 45.00, 'CGJ', 1, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (118, 'PVC电气胶带', 'AGZ-ZC-0000118', 'AGZ-TM-0000118', '卷', '红黄蓝', NULL, 3, NULL, 18, 1, 0.00, 0.00, NULL, 1.50, 1.50, 'FS', 1, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (119, '时控开关', 'AGZ-ZC-0000119', 'AGZ-TM-0000119', '个', NULL, NULL, 3, NULL, 15, 1, 0.00, 0.00, NULL, 48.00, 48.00, 'SDT', 1, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (120, '手把漆', 'AGZ-ZC-0000120', 'AGZ-TM-0000120', '瓶', '灰色', NULL, 3, NULL, 3, 1, 0.00, 0.00, NULL, 5.00, 5.00, 'NGDB', 1, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (121, '空气清新剂', 'AGZ-ZC-0000121', 'AGZ-TM-0000121', '箱', NULL, NULL, 3, NULL, 11, 1, 0.00, 0.00, NULL, 360.00, 360.00, 'YSJ', 1, '科实大厦', '2000-01-01 00:00:00', 1, 0, -1.00, 10);
INSERT INTO `vm_goods` VALUES (122, '水不漏', 'AGZ-ZC-0000122', 'AGZ-TM-0000122', '袋', NULL, NULL, 3, NULL, 11, 1, 0.00, 0.00, NULL, 9.00, 9.00, 'HJTJP', 1, '科实大厦', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (123, 'PVC胶', 'AGZ-ZC-0000123', 'AGZ-TM-0000123', '瓶', NULL, NULL, 3, NULL, 16, 1, 0.00, 0.00, NULL, 3.00, 3.00, 'CS', 1, '科实大厦', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (124, '双面胶', 'AGZ-ZC-0000124', 'AGZ-TM-0000124', '卷', NULL, NULL, 1, NULL, 9, 1, 0.00, 0.00, NULL, 11.00, 11.00, 'ALSKJHC', 1, '科实大厦', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (125, '壁纸刀', 'AGZ-ZC-0000125', 'AGZ-TM-0000125', '个', '小型', NULL, 1, NULL, 9, 1, 0.00, 0.00, NULL, 3.00, 3.00, 'XZQS', 1, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (126, '印油', 'AGZ-ZC-0000126', 'AGZ-TM-0000126', '个', NULL, NULL, 1, NULL, 18, 1, 0.00, 0.00, NULL, 6.00, 6.00, 'WSZ', 1, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (127, '橡皮', 'AGZ-ZC-0000127', 'AGZ-TM-0000127', '个', NULL, NULL, 1, NULL, 12, 1, 0.00, 0.00, NULL, 2.00, 2.00, 'GZP', 1, '物业总办', '2000-01-01 00:00:00', 1, 0, -1.00, 10);
INSERT INTO `vm_goods` VALUES (128, '单面夹板', 'AGZ-ZC-0000128', 'AGZ-TM-0000128', '包', NULL, NULL, 1, NULL, 18, 1, 0.00, 0.00, NULL, 20.00, 20.00, 'FSZS', 1, '物业总办', '2000-01-01 00:00:00', 1, 0, -1.00, 10);
INSERT INTO `vm_goods` VALUES (129, '中华烟（硬）', 'AGZ-ZC-0000129', 'AGZ-TM-0000129', '条', '硬', NULL, 15, NULL, 15, 1, 0.00, 0.00, '', 450.00, 450.00, 'WLUPJK', 1, '京仪', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (130, '硒鼓', 'AGZ-ZC-0000130', 'AGZ-TM-0000130', '个', '加墨', NULL, 11, NULL, 15, 1, 0.00, 0.00, NULL, 80.00, 80.00, 'S', 1, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (131, '笔', 'AGZ-ZC-0000131', 'AGZ-TM-0000131', '盒', '签字', NULL, 1, NULL, 3, 1, 0.00, 0.00, NULL, 10.00, 10.00, 'SLB', 1, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (132, '条幅', 'AGZ-ZC-0000132', 'AGZ-TM-0000132', '个', '86X8', NULL, 7, NULL, 12, 1, 0.00, 0.00, NULL, 120.00, 120.00, 'DSD', 1, '物业行政部同方', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (133, '花篮（2019）', 'AGZ-ZC-0000133', 'AGZ-TM-0000133', '个', '高1.8米', NULL, 5, NULL, 12, 1, 0.00, 0.00, '', 300.00, 300.00, 'QDQ', 1, '物业行政部同方', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (134, '纸', 'AGZ-ZC-0000134', 'AGZ-TM-0000134', '箱', '轮纸', NULL, 7, NULL, 12, 1, 0.00, 0.00, NULL, 100.00, 100.00, 'WJJ', 1, '代购库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (135, '会议桌', 'AGZ-ZC-0000135', 'AGZ-TM-0000135', '张', '2.4X1.2米', NULL, 7, NULL, 12, 1, 0.00, 0.00, NULL, 864.00, 864.00, 'JD', 1, '代购库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (136, '垃圾桶', 'AGZ-ZC-0000136', 'AGZ-TM-0000136', '个', '小', NULL, 3, NULL, 15, 1, 0.00, 0.00, NULL, 4.00, 4.00, 'JGB', 1, '代购库房', '2000-01-01 00:00:00', 1, 0, -3.00, 1);
INSERT INTO `vm_goods` VALUES (137, '厕所垫纸', 'AGZ-ZC-0000137', 'AGZ-TM-0000137', '箱', '3.5寸', NULL, 3, NULL, 12, 1, 0.00, 0.00, NULL, 245.00, 245.00, '5HDC', 1, '代购库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (138, '指向牌', 'AGZ-ZC-0000138', 'AGZ-TM-0000138', '张', NULL, NULL, 3, NULL, 12, 1, 0.00, 0.00, NULL, 10.00, 10.00, 'ZB', 1, '物业行政部同方', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (139, '垃圾桶', 'AGZ-ZC-0000139', 'AGZ-TM-0000139', '个', '大', NULL, 2, NULL, 15, 1, 0.00, 0.00, NULL, 160.00, 160.00, 'YCXFH', 1, '物业电梯使用', '2000-01-01 00:00:00', 1, 0, -4.00, 10);
INSERT INTO `vm_goods` VALUES (140, '支票登记本', 'AGZ-ZC-0000140', 'AGZ-TM-0000140', '个', NULL, NULL, 2, NULL, 12, 1, 0.00, 0.00, NULL, 15.00, 15.00, 'NKDC', 1, '物业财务', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (141, '支票夹', 'AGZ-ZC-0000141', 'AGZ-TM-0000141', '个', NULL, NULL, 2, NULL, 15, 1, 0.00, 0.00, NULL, 4.00, 4.00, 'S', 1, '物业财务', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (142, '透明可密封文件袋', 'AGZ-ZC-0000142', 'AGZ-TM-0000142', '包', NULL, NULL, 2, NULL, 12, 1, 0.00, 0.00, NULL, 12.00, 12.00, 'QB', 1, '物业财务', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (143, '支票打印机', 'AGZ-ZC-0000143', 'AGZ-TM-0000143', '个', NULL, NULL, 2, NULL, 11, 1, 0.00, 0.00, NULL, 280.00, 280.00, 'CJJ', 1, '物业财务', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (144, '三联收据', 'AGZ-ZC-0000144', 'AGZ-TM-0000144', '本', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 1.00, 1.00, NULL, 0, '物业财务', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (145, '笔记本', 'AGZ-ZC-0000145', 'AGZ-TM-0000145', '个', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 1.50, 1.50, NULL, 0, '物业财务', '2000-01-01 00:00:00', 1, 0, -6.00, 10);
INSERT INTO `vm_goods` VALUES (146, '复印纸', 'AGZ-ZC-0000146', 'AGZ-TM-0000146', '盒', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 4.00, 4.00, NULL, 0, '物业财务', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (147, '大号直尺', 'AGZ-ZC-0000147', 'AGZ-TM-0000147', '个', NULL, NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 38.00, 38.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (148, '软尺', 'AGZ-ZC-0000148', 'AGZ-TM-0000148', '个', NULL, NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (149, '打孔机', 'AGZ-ZC-0000149', 'AGZ-TM-0000149', '个', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (150, '打印制作：电梯', 'AGZ-ZC-0000150', 'AGZ-TM-0000150', '张', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, '物业行政部电梯', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (151, '橡胶手套', 'AGZ-ZC-0000151', 'AGZ-TM-0000151', '套', '半臂式', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 9.00, 9.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (152, '洁厕剂', 'AGZ-ZC-0000152', 'AGZ-TM-0000152', '箱', '大桶', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 60.00, 60.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (153, '除胶剂', 'AGZ-ZC-0000153', 'AGZ-TM-0000153', '箱', '大桶', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 210.00, 210.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (154, '除垢剂', 'AGZ-ZC-0000154', 'AGZ-TM-0000154', '箱', '大桶', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 80.00, 80.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (155, '小垃圾袋', 'AGZ-ZC-0000155', 'AGZ-TM-0000155', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 130.00, 130.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (156, '大垃圾袋', 'AGZ-ZC-0000156', 'AGZ-TM-0000156', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 200.00, 200.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (157, '空气清新剂', 'AGZ-ZC-0000157', 'AGZ-TM-0000157', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 200.00, 200.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (158, '毛刷-马桶专用', 'AGZ-ZC-0000158', 'AGZ-TM-0000158', '个', '马桶专用，棉花头', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 4.00, 4.00, NULL, 0, '物业保洁', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (159, '5号电池', 'AGZ-ZC-0000159', 'AGZ-TM-0000159', '盒', '大盒', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 90.00, 90.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, -1.00, 10);
INSERT INTO `vm_goods` VALUES (160, '电工工服', 'AGZ-ZC-0000160', 'AGZ-TM-0000160', '套', '180长袖', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 75.00, 75.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (161, '五洁粉', 'AGZ-ZC-0000161', 'AGZ-TM-0000161', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 150.00, 150.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (162, '绿色百洁布', 'AGZ-ZC-0000162', 'AGZ-TM-0000162', '块', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 1.00, 1.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (163, '毛巾', 'AGZ-ZC-0000163', 'AGZ-TM-0000163', '个', '擦拭，好的', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 2.50, 2.50, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (164, '小水桶', 'AGZ-ZC-0000164', 'AGZ-TM-0000164', '个', '高5.0CM', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 16.00, 16.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (165, '活页文件夹', 'AGZ-ZC-0000165', 'AGZ-TM-0000165', '个', '40页', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (166, '拉杆文件膜', 'AGZ-ZC-0000166', 'AGZ-TM-0000166', '个', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 1.10, 1.10, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (167, '卫生纸', 'AGZ-ZC-0000167', 'AGZ-TM-0000167', '提', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 18.00, 18.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, -1.00, 10);
INSERT INTO `vm_goods` VALUES (168, '橡皮', 'AGZ-ZC-0000168', 'AGZ-TM-0000168', '个', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 1.50, 1.50, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (169, '风琴包', 'AGZ-ZC-0000169', 'AGZ-TM-0000169', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 20.00, 20.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (170, '锁芯', 'AGZ-ZC-0000170', 'AGZ-TM-0000170', '个', '普通', NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 35.00, 35.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (171, '卷尺', 'AGZ-ZC-0000171', 'AGZ-TM-0000171', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (172, '锁芯', 'AGZ-ZC-0000172', 'AGZ-TM-0000172', '个', '消防门上', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (173, '半截杆套头', 'AGZ-ZC-0000173', 'AGZ-TM-0000173', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (174, '头灯-头戴式', 'AGZ-ZC-0000174', 'AGZ-TM-0000174', '个', '头戴式', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 15.00, 15.00, NULL, 0, '物业保洁', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (175, 'PVC胶带', 'AGZ-ZC-0000175', 'AGZ-TM-0000175', '卷', '5色', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 1.50, 1.50, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (176, '大理石胶', 'AGZ-ZC-0000176', 'AGZ-TM-0000176', '桶', '小', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (177, '智能查断点测电笔', 'AGZ-ZC-0000177', 'AGZ-TM-0000177', '个', NULL, NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (178, '男装西服', 'AGZ-ZC-0000178', 'AGZ-TM-0000178', '套', NULL, NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 450.00, 450.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (179, '女装西服', 'AGZ-ZC-0000179', 'AGZ-TM-0000179', '套', NULL, NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 450.00, 450.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (180, '衬衣', 'AGZ-ZC-0000180', 'AGZ-TM-0000180', '件', NULL, NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 50.00, 50.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (181, '上下铺', 'AGZ-ZC-0000181', 'AGZ-TM-0000181', '套', '铁的', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 280.00, 280.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (182, '床垫', 'AGZ-ZC-0000182', 'AGZ-TM-0000182', '个', '软', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 50.00, 50.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (183, '水果三样', 'AGZ-ZC-0000183', 'AGZ-TM-0000183', '份', '橘子，枣，葡萄', NULL, 5, NULL, NULL, 0, 0.00, 0.00, NULL, 58.00, 58.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (184, '打印制作：导视图', 'AGZ-ZC-0000184', 'AGZ-TM-0000184', '张', '40X48CM', NULL, 5, NULL, NULL, 0, 0.00, 0.00, NULL, 8.50, 8.50, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (185, 'LED', 'AGZ-ZC-0000185', 'AGZ-TM-0000185', '个', '一体化', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 14.00, 14.00, NULL, 0, '创新大厦', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (186, '简灯（3.5寸）', 'AGZ-ZC-0000186', 'AGZ-TM-0000186', '个', '3.5寸', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 15.00, 15.00, NULL, 0, '创新大厦', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (187, 'LED灯管', 'AGZ-ZC-0000187', 'AGZ-TM-0000187', '个', 'T5一体化', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '创新大厦走廊', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (188, '简灯（3.5寸）', 'AGZ-ZC-0000188', 'AGZ-TM-0000188', '个', '3.5寸', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 14.00, 14.00, NULL, 0, '创新大厦走廊', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (189, '镇流器', 'AGZ-ZC-0000189', 'AGZ-TM-0000189', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (190, '硒鼓', 'AGZ-ZC-0000190', 'AGZ-TM-0000190', '支', '惠普', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 120.00, 120.00, NULL, 0, '人事', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (191, '除垢剂', 'AGZ-ZC-0000191', 'AGZ-TM-0000191', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 80.00, 80.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (192, '檫手纸', 'AGZ-ZC-0000192', 'AGZ-TM-0000192', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 80.00, 80.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (193, '小喷壶', 'AGZ-ZC-0000193', 'AGZ-TM-0000193', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 3.50, 3.50, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, -6.00, 10);
INSERT INTO `vm_goods` VALUES (194, '尘推油', 'AGZ-ZC-0000194', 'AGZ-TM-0000194', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 180.00, 180.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (195, '一次性马桶垫', 'AGZ-ZC-0000195', 'AGZ-TM-0000195', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 245.00, 245.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (196, '竹夹子', 'AGZ-ZC-0000196', 'AGZ-TM-0000196', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 2.00, 2.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (197, '大盘纸', 'AGZ-ZC-0000197', 'AGZ-TM-0000197', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 125.00, 125.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, -5.00, 10);
INSERT INTO `vm_goods` VALUES (198, '洗手液', 'AGZ-ZC-0000198', 'AGZ-TM-0000198', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 114.00, 114.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (199, '硒鼓加墨', 'AGZ-ZC-0000199', 'AGZ-TM-0000199', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 30.00, 30.00, NULL, 0, '办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (200, '暖气片', 'AGZ-ZC-0000200', 'AGZ-TM-0000200', '台', '12页', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 210.00, 210.00, NULL, 0, '物业（六楼同方）', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (201, '手电', 'AGZ-ZC-0000201', 'AGZ-TM-0000201', '台', '大', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 100.00, 100.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (202, '垃圾桶', 'AGZ-ZC-0000202', 'AGZ-TM-0000202', '个', '120', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 130.00, 130.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (203, '垃圾桶', 'AGZ-ZC-0000203', 'AGZ-TM-0000203', '个', '240', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 190.00, 190.00, NULL, 0, '物业保洁备用物质', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (204, '对讲机', 'AGZ-ZC-0000204', 'AGZ-TM-0000204', '台', 'LS-A8', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 390.00, 390.00, NULL, 0, '物业安保', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (205, '耳机', 'AGZ-ZC-0000205', 'AGZ-TM-0000205', '条', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 18.00, 18.00, NULL, 0, '物业安保', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (206, '更衣柜', 'AGZ-ZC-0000206', 'AGZ-TM-0000206', '个', '6门', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 370.00, 370.00, NULL, 0, '物业部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (207, '更衣柜', 'AGZ-ZC-0000207', 'AGZ-TM-0000207', '个', '4门', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 370.00, 370.00, NULL, 0, '物业部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (208, '电缆', 'AGZ-ZC-0000208', 'AGZ-TM-0000208', '米', '4X35+1x16', NULL, 12, NULL, NULL, 0, 0.00, 0.00, NULL, 85.00, 85.00, NULL, 0, '物业打印机隔壁域主用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (209, '打印制作：物业部工牌', 'AGZ-ZC-0000209', 'AGZ-TM-0000209', '个', '5.5X8.5', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (210, '温度计', 'AGZ-ZC-0000210', 'AGZ-TM-0000210', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (211, '测温仪', 'AGZ-ZC-0000211', 'AGZ-TM-0000211', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 90.00, 90.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (212, '84消毒液', 'AGZ-ZC-0000212', 'AGZ-TM-0000212', '箱', '大桶', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 53.00, 53.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (213, '尘推布', 'AGZ-ZC-0000213', 'AGZ-TM-0000213', '个', '90cm', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 17.00, 17.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (214, '扫把撮子', 'AGZ-ZC-0000214', 'AGZ-TM-0000214', '套', '好的', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 21.00, 21.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (215, '大扫帚', 'AGZ-ZC-0000215', 'AGZ-TM-0000215', '把', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 19.00, 19.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (216, '铲雪铲', 'AGZ-ZC-0000216', 'AGZ-TM-0000216', '把', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 45.00, 45.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (217, '铁锹', 'AGZ-ZC-0000217', 'AGZ-TM-0000217', '把', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 28.00, 28.00, NULL, 0, '物业维修', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (218, '抽屉锁', 'AGZ-ZC-0000218', 'AGZ-TM-0000218', '把', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (219, '小柜子', 'AGZ-ZC-0000219', 'AGZ-TM-0000219', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 50.00, 50.00, NULL, 0, '六楼同方', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (220, '玻璃清洁工具', 'AGZ-ZC-0000220', 'AGZ-TM-0000220', '套', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 12.00, 12.00, NULL, 0, '物业清洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (221, '保洁工服', 'AGZ-ZC-0000221', 'AGZ-TM-0000221', '套', NULL, NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 0.00, 0.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (222, '组装电脑', 'AGZ-ZC-0000222', 'AGZ-TM-0000222', '台', NULL, NULL, 10, NULL, NULL, 0, 0.00, 0.00, NULL, 8135.50, 8135.50, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (223, '直接（PVC管）', 'AGZ-ZC-0000223', 'AGZ-TM-0000223', '个', '50MM', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '三层总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (224, '地砖', 'AGZ-ZC-0000224', 'AGZ-TM-0000224', '块', '60X60', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 13.00, 13.00, NULL, 0, '科实大厦', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (225, '锁芯', 'AGZ-ZC-0000225', 'AGZ-TM-0000225', '个', '中', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (226, '沙子', 'AGZ-ZC-0000226', 'AGZ-TM-0000226', '袋', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '科实大厦', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (227, '地砖', 'AGZ-ZC-0000227', 'AGZ-TM-0000227', '块', '300X300', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 7.00, 7.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (228, '内丝堵头', 'AGZ-ZC-0000228', 'AGZ-TM-0000228', '个', '15', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 2.00, 2.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (229, '内丝堵头', 'AGZ-ZC-0000229', 'AGZ-TM-0000229', '个', '20', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 3.00, 3.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (230, '内丝堵头', 'AGZ-ZC-0000230', 'AGZ-TM-0000230', '个', '25', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 4.00, 4.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (231, '外丝堵头', 'AGZ-ZC-0000231', 'AGZ-TM-0000231', '个', '15', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 2.00, 2.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (232, '外丝堵头', 'AGZ-ZC-0000232', 'AGZ-TM-0000232', '个', '20', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 3.00, 3.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (233, '外丝堵头', 'AGZ-ZC-0000233', 'AGZ-TM-0000233', '个', '25', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 4.00, 4.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (234, '挂锁头', 'AGZ-ZC-0000234', 'AGZ-TM-0000234', '个', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 3.00, 3.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (235, '锁扣', 'AGZ-ZC-0000235', 'AGZ-TM-0000235', '个', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (236, '窗户把手', 'AGZ-ZC-0000236', 'AGZ-TM-0000236', '把', '定制', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 14.00, 14.00, NULL, 0, '科实大厦', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (237, '坐便盖', 'AGZ-ZC-0000237', 'AGZ-TM-0000237', '套', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (238, '洗手池电池阀', 'AGZ-ZC-0000238', 'AGZ-TM-0000238', '个', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 75.00, 75.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (239, '方便面', 'AGZ-ZC-0000239', 'AGZ-TM-0000239', '箱', NULL, NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 36.00, 36.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (240, '干脆面', 'AGZ-ZC-0000240', 'AGZ-TM-0000240', '箱', NULL, NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 23.00, 23.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (241, '香肠', 'AGZ-ZC-0000241', 'AGZ-TM-0000241', '包', NULL, NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 16.00, 16.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (242, 'A4纸', 'AGZ-ZC-0000242', 'AGZ-TM-0000242', '箱', '80克（好的）', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 155.00, 155.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (243, '卷纸', 'AGZ-ZC-0000243', 'AGZ-TM-0000243', '提', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 6.00, 6.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (244, '抽纸', 'AGZ-ZC-0000244', 'AGZ-TM-0000244', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 180.00, 180.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (245, '胶带', 'AGZ-ZC-0000245', 'AGZ-TM-0000245', '个', '大', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业库房', '2000-01-01 00:00:00', 1, 0, -7.00, 10);
INSERT INTO `vm_goods` VALUES (246, '洁厕灵', 'AGZ-ZC-0000246', 'AGZ-TM-0000246', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 60.00, 60.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (247, '毛巾', 'AGZ-ZC-0000247', 'AGZ-TM-0000247', '条', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 2.50, 2.50, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (248, '固体空气清新剂', 'AGZ-ZC-0000248', 'AGZ-TM-0000248', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 228.00, 228.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (249, '小便池清洁球', 'AGZ-ZC-0000249', 'AGZ-TM-0000249', '箱', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 200.00, 200.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (250, '小垃圾桶', 'AGZ-ZC-0000250', 'AGZ-TM-0000250', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 6.50, 6.50, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (251, '前台锁', 'AGZ-ZC-0000251', 'AGZ-TM-0000251', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 6.00, 6.00, NULL, 0, '物业前台', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (252, '水果两样', 'AGZ-ZC-0000252', 'AGZ-TM-0000252', '样', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 45.50, 45.50, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (253, '配钥匙（7元）', 'AGZ-ZC-0000253', 'AGZ-TM-0000253', '把', '把', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 7.00, 7.00, NULL, 0, '物业总办', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (254, '大衣柜', 'AGZ-ZC-0000254', 'AGZ-TM-0000254', '个', '二手', NULL, 6, NULL, NULL, 0, 0.00, 0.00, NULL, 260.00, 260.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (255, '西装', 'AGZ-ZC-0000255', 'AGZ-TM-0000255', '套', NULL, NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 140.00, 140.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (256, '文件夹', 'AGZ-ZC-0000256', 'AGZ-TM-0000256', '个', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 7.00, 7.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (257, '无线网卡', 'AGZ-ZC-0000257', 'AGZ-TM-0000257', '个', NULL, NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业保洁', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (258, '箱式风机', 'AGZ-ZC-0000258', 'AGZ-TM-0000258', '台', '1.5KW,风压500pa', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 1860.00, 1860.00, NULL, 0, '一层物业办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (259, '不锈钢踢脚线', 'AGZ-ZC-0000259', 'AGZ-TM-0000259', '米', '8公分', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '一层物业办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (260, '9厘密度板', 'AGZ-ZC-0000260', 'AGZ-TM-0000260', '张', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 45.00, 45.00, NULL, 0, '一层物业办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (261, '发泡胶', 'AGZ-ZC-0000261', 'AGZ-TM-0000261', '箱', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 140.00, 140.00, NULL, 0, '一层物业办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (262, '白玻璃胶', 'AGZ-ZC-0000262', 'AGZ-TM-0000262', '箱', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 240.00, 240.00, NULL, 0, '一层物业办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (263, '高强石膏', 'AGZ-ZC-0000263', 'AGZ-TM-0000263', '袋', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '一层物业办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (264, '游标卡尺', 'AGZ-ZC-0000264', 'AGZ-TM-0000264', '把', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 65.00, 65.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (265, '单面海绵密封条', 'AGZ-ZC-0000265', 'AGZ-TM-0000265', '米', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 1.80, 1.80, NULL, 0, '物业卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (266, '堵漏灵', 'AGZ-ZC-0000266', 'AGZ-TM-0000266', '袋', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (267, '防水胶布', 'AGZ-ZC-0000267', 'AGZ-TM-0000267', '个', '一大一小', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 22.50, 22.50, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (268, '红外线测温枪', 'AGZ-ZC-0000268', 'AGZ-TM-0000268', '把', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 75.00, 75.00, NULL, 0, '物业四楼卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (269, '9V测温枪电池', 'AGZ-ZC-0000269', 'AGZ-TM-0000269', '个', NULL, NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (270, '苹果电脑（前台）', 'AGZ-ZC-0000270', 'AGZ-TM-0000270', '台', '全新', NULL, 10, NULL, NULL, 0, 0.00, 0.00, NULL, 7778.00, 7778.00, NULL, 0, '物业前台', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (271, '直流电源', 'AGZ-ZC-0000271', 'AGZ-TM-0000271', '箱', '15V23A', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 3100.00, 3100.00, NULL, 0, '物业门禁设备', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (272, '铝塑管', 'AGZ-ZC-0000272', 'AGZ-TM-0000272', '米', '6分', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '三层总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (273, '铝塑-直接', 'AGZ-ZC-0000273', 'AGZ-TM-0000273', '个', '6分', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 12.00, 12.00, NULL, 0, '三层总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (274, '墙卡', 'AGZ-ZC-0000274', 'AGZ-TM-0000274', '套', '6分', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 0.50, 0.50, NULL, 0, '三层总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (275, '工作服', 'AGZ-ZC-0000275', 'AGZ-TM-0000275', '件', '185\\4，182\\4', NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 45.00, 45.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (276, '垃圾桶', 'AGZ-ZC-0000276', 'AGZ-TM-0000276', '个', '大堂外，灭烟式', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 430.00, 430.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (277, '电工工服', 'AGZ-ZC-0000277', 'AGZ-TM-0000277', '套', '175\\2,180\\2', NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 75.00, 75.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (278, '工具包', 'AGZ-ZC-0000278', 'AGZ-TM-0000278', '个', '电工', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (279, '老虎钳', 'AGZ-ZC-0000279', 'AGZ-TM-0000279', '把', '好的', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 35.00, 35.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (280, '螺丝刀', 'AGZ-ZC-0000280', 'AGZ-TM-0000280', '把', ' 好的（大）', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 12.00, 12.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (281, '螺丝刀', 'AGZ-ZC-0000281', 'AGZ-TM-0000281', '把', '好的 (小)', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 9.00, 9.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (282, '尖嘴钳', 'AGZ-ZC-0000282', 'AGZ-TM-0000282', '把', '好的', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 28.00, 28.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (283, '斜口钳', 'AGZ-ZC-0000283', 'AGZ-TM-0000283', '把', '好的', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 28.00, 28.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (284, '电笔', 'AGZ-ZC-0000284', 'AGZ-TM-0000284', '把', '非接处式', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (285, '剥线钳', 'AGZ-ZC-0000285', 'AGZ-TM-0000285', '个', '7寸', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 33.00, 33.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (286, '插排', 'AGZ-ZC-0000286', 'AGZ-TM-0000286', '个', '公牛', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 33.00, 33.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (287, '拉杆夹', 'AGZ-ZC-0000287', 'AGZ-TM-0000287', '个', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 0.80, 0.80, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (288, '活页文件夹', 'AGZ-ZC-0000288', 'AGZ-TM-0000288', '个', '40页', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (289, '壁纸刀', 'AGZ-ZC-0000289', 'AGZ-TM-0000289', '把', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (290, '刀片', 'AGZ-ZC-0000290', 'AGZ-TM-0000290', '盒', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (291, '瓶装水', 'AGZ-ZC-0000291', 'AGZ-TM-0000291', '箱', '小瓶', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 23.00, 23.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (292, '提示贴', 'AGZ-ZC-0000292', 'AGZ-TM-0000292', '个', '12X18', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (293, '感应水龙头', 'AGZ-ZC-0000293', 'AGZ-TM-0000293', '个', '好的（万家美）', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 160.00, 160.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (294, '南孚电池', 'AGZ-ZC-0000294', 'AGZ-TM-0000294', '块', '9V', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (295, '壁纸刀', 'AGZ-ZC-0000295', 'AGZ-TM-0000295', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (296, '刀片', 'AGZ-ZC-0000296', 'AGZ-TM-0000296', '个', '好的', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (297, '老式水箱配件', 'AGZ-ZC-0000297', 'AGZ-TM-0000297', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 20.00, 20.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (298, '欧司朗节能灯', 'AGZ-ZC-0000298', 'AGZ-TM-0000298', '个', '欧司朗', NULL, 4, NULL, 0, 0, 0.00, 0.00, '', 13.00, 13.00, NULL, 0, '物业消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (299, '防滑地毯', 'AGZ-ZC-0000299', 'AGZ-TM-0000299', '米', '加边', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 151.25, 151.25, NULL, 0, '物业大厅', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (300, '派工服务单', 'AGZ-ZC-0000300', 'AGZ-TM-0000300', '本', '定制', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 4.32, 4.32, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (301, '访客出入条', 'AGZ-ZC-0000301', 'AGZ-TM-0000301', '本', '定制', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.18, 5.18, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (302, '男士西服', 'AGZ-ZC-0000302', 'AGZ-TM-0000302', '套', '170XL', NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 150.00, 150.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (303, '便利贴', 'AGZ-ZC-0000303', 'AGZ-TM-0000303', '个', '大', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 2.00, 2.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (304, '小胶带', 'AGZ-ZC-0000304', 'AGZ-TM-0000304', '卷', '小卷', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 0.45, 0.45, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (305, '衬衣', 'AGZ-ZC-0000305', 'AGZ-TM-0000305', '件', '170', NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 45.00, 45.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (306, '门把手套', 'AGZ-ZC-0000306', 'AGZ-TM-0000306', '套', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 20.80, 20.80, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (307, '电脑主机', 'AGZ-ZC-0000307', 'AGZ-TM-0000307', '台', '组装', NULL, 10, NULL, NULL, 0, 0.00, 0.00, NULL, 2100.00, 2100.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (308, '交换机', 'AGZ-ZC-0000308', 'AGZ-TM-0000308', '台', 'POE供电', NULL, 13, NULL, NULL, 0, 0.00, 0.00, NULL, 728.00, 728.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (309, '反馈磁力锁', 'AGZ-ZC-0000309', 'AGZ-TM-0000309', '把', NULL, NULL, 13, NULL, NULL, 0, 0.00, 0.00, NULL, 130.00, 130.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (310, '档案柜', 'AGZ-ZC-0000310', 'AGZ-TM-0000310', '组', '玻璃', NULL, 6, NULL, NULL, 0, 0.00, 0.00, NULL, 350.00, 350.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (311, '香肠', 'AGZ-ZC-0000311', 'AGZ-TM-0000311', '袋', '王中王', NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 13.00, 13.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (312, '汤达人', 'AGZ-ZC-0000312', 'AGZ-TM-0000312', '箱', '碗装', NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 72.00, 72.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (313, '百度VIP（软件服务）', 'AGZ-ZC-0000313', 'AGZ-TM-0000313', '年', NULL, NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 99.90, 99.90, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (314, '前台工服', 'AGZ-ZC-0000314', 'AGZ-TM-0000314', '套', 'M,L', NULL, 17, NULL, NULL, 0, 0.00, 0.00, NULL, 265.00, 265.00, NULL, 0, '物业前台', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (315, '灯泡', 'AGZ-ZC-0000315', 'AGZ-TM-0000315', '个', '办公室', NULL, 4, NULL, NULL, 0, 0.00, 0.00, NULL, 19.00, 19.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (316, '电脑显示器', 'AGZ-ZC-0000316', 'AGZ-TM-0000316', '台', '19寸', NULL, 10, NULL, NULL, 0, 0.00, 0.00, NULL, 455.00, 455.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (317, '键盘鼠标', 'AGZ-ZC-0000317', 'AGZ-TM-0000317', '套', NULL, NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 35.00, 35.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (318, '花篮（2019A）', 'AGZ-ZC-0000318', 'AGZ-TM-0000318', '个', '个', NULL, 5, NULL, 0, 0, 0.00, 0.00, '', 300.00, 300.00, NULL, 0, '物业6楼同方', '0000-00-00 00:00:00', 1, 0, -10.00, 10);
INSERT INTO `vm_goods` VALUES (319, '硒鼓', 'AGZ-ZC-0000319', 'AGZ-TM-0000319', '个', NULL, NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 150.00, 150.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (320, '六角扳手工具', 'AGZ-ZC-0000320', 'AGZ-TM-0000320', '套', NULL, NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业网络', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (321, '十字一字两用(最短)', 'AGZ-ZC-0000321', 'AGZ-TM-0000321', '吧', '好的', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业网络', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (322, '冲击钻头', 'AGZ-ZC-0000322', 'AGZ-TM-0000322', '个', '6mm', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业网络', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (323, '冲击钻头', 'AGZ-ZC-0000323', 'AGZ-TM-0000323', '个', '8mm', NULL, 9, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业网络', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (324, '冲击钻头', 'AGZ-ZC-0000324', 'AGZ-TM-0000324', '个', '10mm', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业网络', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (325, '大盘纸盒', 'AGZ-ZC-0000325', 'AGZ-TM-0000325', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (326, '檫手纸盒', 'AGZ-ZC-0000326', 'AGZ-TM-0000326', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 22.00, 22.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (327, '打印机连接线', 'AGZ-ZC-0000327', 'AGZ-TM-0000327', '个', 'USB转打印机', NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (328, '签字笔', 'AGZ-ZC-0000328', 'AGZ-TM-0000328', '盒', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (329, '文件架', 'AGZ-ZC-0000329', 'AGZ-TM-0000329', '个', '架子', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (330, '卫生纸', 'AGZ-ZC-0000330', 'AGZ-TM-0000330', '提', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 18.00, 18.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, -1.00, 10);
INSERT INTO `vm_goods` VALUES (331, '水龙头', 'AGZ-ZC-0000331', 'AGZ-TM-0000331', '个', '普通', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 12.00, 12.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (332, '千库网会员（软件服务）', 'AGZ-ZC-0000332', 'AGZ-TM-0000332', '年', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 199.00, 199.00, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (333, '方便面', 'AGZ-ZC-0000333', 'AGZ-TM-0000333', '箱', '汤达人', NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 72.00, 72.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (334, '香肠', 'AGZ-ZC-0000334', 'AGZ-TM-0000334', '包', NULL, NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (335, '干脆面', 'AGZ-ZC-0000335', 'AGZ-TM-0000335', '箱', NULL, NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 23.00, 23.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (336, '面包', 'AGZ-ZC-0000336', 'AGZ-TM-0000336', '箱', NULL, NULL, 18, NULL, NULL, 0, 0.00, 0.00, NULL, 42.00, 42.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (337, '吊挂式文件夹', 'AGZ-ZC-0000337', 'AGZ-TM-0000337', '盒', 'A4', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 62.50, 62.50, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (338, '钥匙柜', 'AGZ-ZC-0000338', 'AGZ-TM-0000338', '个', '壁挂式', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 420.00, 420.00, NULL, 0, '物业消耗备用', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (339, '抽屉锁', 'AGZ-ZC-0000339', 'AGZ-TM-0000339', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 4.00, 4.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (340, '凝聚力CTD平板灯', 'AGZ-ZC-0000340', 'AGZ-TM-0000340', '个', '600X600', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 48.00, 48.00, NULL, 0, '科实厕所', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (341, '横幅', 'AGZ-ZC-0000341', 'AGZ-TM-0000341', '个', '600X50（同方）', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 90.00, 90.00, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (342, '迎宾地毯', 'AGZ-ZC-0000342', 'AGZ-TM-0000342', '块', '2X1.6', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 688.00, 688.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (343, '柜锁', 'AGZ-ZC-0000343', 'AGZ-TM-0000343', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 4.00, 4.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (344, '电加热风幕机', 'AGZ-ZC-0000344', 'AGZ-TM-0000344', '台', '1.5米', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 1263.00, 1263.00, NULL, 0, '物业一楼大厅', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (345, '打印制作：物业部门带', 'AGZ-ZC-0000345', 'AGZ-TM-0000345', '套', '加厚玻璃克纸', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 35.00, 35.00, NULL, 0, '物业部办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (346, '打印制作：磨砂贴膜', 'AGZ-ZC-0000346', 'AGZ-TM-0000346', '米', '25厘米', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 30.00, 30.00, NULL, 0, '物业部办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (347, '打印制作：推拉门标牌', 'AGZ-ZC-0000347', 'AGZ-TM-0000347', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业部办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (348, '打印制作：服务中心', 'AGZ-ZC-0000348', 'AGZ-TM-0000348', '副', '4个字', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 60.00, 60.00, NULL, 0, '物业部办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (349, '人工费', 'AGZ-ZC-0000349', 'AGZ-TM-0000349', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 300.00, 300.00, NULL, 0, '物业部办公室', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (350, '对讲机', 'AGZ-ZC-0000350', 'AGZ-TM-0000350', '台', 'LS-A8', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 403.00, 403.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (351, '对讲机', 'AGZ-ZC-0000351', 'AGZ-TM-0000351', '台', 'LS-A9', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 403.00, 403.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (352, '音响功效', 'AGZ-ZC-0000352', 'AGZ-TM-0000352', '套', '吸顶式', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 1700.00, 1700.00, NULL, 0, '物业三层总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (353, '计算器', 'AGZ-ZC-0000353', 'AGZ-TM-0000353', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 22.00, 22.00, NULL, 0, '物业财务', '2000-01-01 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (354, 'USB分线器', 'AGZ-ZC-0000354', 'AGZ-TM-0000354', '个', NULL, NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 30.00, 30.00, NULL, 0, '物业财务', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (355, '订书机', 'AGZ-ZC-0000355', 'AGZ-TM-0000355', '盒', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 1.50, 1.50, NULL, 0, '物业库房日常领用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (356, '插排', 'AGZ-ZC-0000356', 'AGZ-TM-0000356', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 35.00, 35.00, NULL, 0, '物业库房日常领用', '2000-01-01 00:00:00', 1, 0, -1.00, 10);
INSERT INTO `vm_goods` VALUES (357, '白板笔', 'AGZ-ZC-0000357', 'AGZ-TM-0000357', '个', '三种颜色', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 20.00, 20.00, NULL, 0, '物业库房日常领用', '2000-01-01 00:00:00', 1, 0, -3.00, 10);
INSERT INTO `vm_goods` VALUES (358, '无线网卡', 'AGZ-ZC-0000358', 'AGZ-TM-0000358', '个', NULL, NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 25.00, 25.00, NULL, 0, '物业库房日常领用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (359, '光球', 'AGZ-ZC-0000359', 'AGZ-TM-0000359', '包', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 50.00, 50.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (360, '贴画', 'AGZ-ZC-0000360', 'AGZ-TM-0000360', '个', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 6.50, 6.50, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (361, '领结', 'AGZ-ZC-0000361', 'AGZ-TM-0000361', '个', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (362, '彩灯', 'AGZ-ZC-0000362', 'AGZ-TM-0000362', '个', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 10.00, 10.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (363, '网灯', 'AGZ-ZC-0000363', 'AGZ-TM-0000363', '个', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 35.00, 35.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (364, '黑线', 'AGZ-ZC-0000364', 'AGZ-TM-0000364', '个', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (365, '雪花', 'AGZ-ZC-0000365', 'AGZ-TM-0000365', '包', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (366, '铃铛', 'AGZ-ZC-0000366', 'AGZ-TM-0000366', '个', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (367, '小挂件', 'AGZ-ZC-0000367', 'AGZ-TM-0000367', '个', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.00, 5.00, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (368, '小雪花', 'AGZ-ZC-0000368', 'AGZ-TM-0000368', '个', '圣诞节挂件', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 1.50, 1.50, NULL, 0, '物业消耗', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (369, '考勤打卡机', 'AGZ-ZC-0000369', 'AGZ-TM-0000369', '台', '脸部识别', NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 1000.00, 1000.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (370, 'LED吸顶灯', 'AGZ-ZC-0000370', 'AGZ-TM-0000370', '个', '300MM', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 30.00, 30.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (371, '电脑', 'AGZ-ZC-0000371', 'AGZ-TM-0000371', '套', NULL, NULL, 10, NULL, NULL, 0, 0.00, 0.00, NULL, 2825.00, 2825.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (372, '节能灯', 'AGZ-ZC-0000372', 'AGZ-TM-0000372', '个', 'LED', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 13.00, 13.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (373, '洗手盆水龙头', 'AGZ-ZC-0000373', 'AGZ-TM-0000373', '个', '单冷', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 35.00, 35.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (374, '打印机专用线', 'AGZ-ZC-0000374', 'AGZ-TM-0000374', '根', NULL, NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 7.70, 7.70, NULL, 0, '物业行政部', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (375, '配钥匙（6元）', 'AGZ-ZC-0000375', 'AGZ-TM-0000375', '个', '个', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 6.00, 6.00, NULL, 0, '物业行政部', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (376, '档案盒', 'AGZ-ZC-0000376', 'AGZ-TM-0000376', '个', NULL, NULL, 1, NULL, NULL, 0, 0.00, 0.00, NULL, 7.00, 7.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (377, '网络标签打印机', 'AGZ-ZC-0000377', 'AGZ-TM-0000377', '台', '网络标签贴', NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 394.00, 394.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (378, '防爆八件套', 'AGZ-ZC-0000378', 'AGZ-TM-0000378', '套', '带架子', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 730.00, 730.00, NULL, 0, '物业消耗备用', '2000-01-01 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (379, '水龙头', 'AGZ-ZC-0000379', 'AGZ-TM-0000379', '个', '延时', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 50.00, 50.00, NULL, 0, '科实卫生间', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (380, '考勤打卡机', 'AGZ-ZC-0000380', 'AGZ-TM-0000380', '台', NULL, NULL, 6, NULL, NULL, 0, 0.00, 0.00, NULL, 469.00, 469.00, NULL, 0, '物业人事部', '2000-01-01 00:00:00', 1, 0, -1.00, 10);
INSERT INTO `vm_goods` VALUES (381, '打印机墨盒', 'AGZ-ZC-0000381', 'AGZ-TM-0000381', '盒', NULL, NULL, 6, NULL, NULL, 0, 0.00, 0.00, NULL, 120.00, 120.00, NULL, 0, '物业人事部', '2000-01-01 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (382, '医疗箱药品', 'AGZ-ZC-0000382', 'AGZ-TM-0000382', '套', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 177.90, 177.90, NULL, 0, '库房日常领用', '2000-01-01 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (383, '反光马甲', 'AGZ-ZC-0000383', 'AGZ-TM-0000383', '套', '背面印工程', NULL, 4, NULL, 0, 0, 0.00, 0.00, '', 3.00, 3.00, NULL, 0, '工程部', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (384, '隔断柜', 'AGZ-ZC-0000384', 'AGZ-TM-0000384', '套', '定制', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 3500.00, 3500.00, NULL, 0, '三层总办，含票', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (385, '工位', 'AGZ-ZC-0000385', 'AGZ-TM-0000385', '套', '套', NULL, 6, NULL, 0, 0, 0.00, 0.00, '', 217.50, 217.50, NULL, 0, '三层总办，含票', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (386, '工位线槽', 'AGZ-ZC-0000386', 'AGZ-TM-0000386', '套', '好的', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 19.00, 19.00, NULL, 0, '三层总办，含票', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (387, '蛇形软管', 'AGZ-ZC-0000387', 'AGZ-TM-0000387', '根', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 16.50, 16.50, NULL, 0, '三层总办', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (388, '声控壁灯', 'AGZ-ZC-0000388', 'AGZ-TM-0000388', '套', '挂壁式', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 90.00, 90.00, NULL, 0, '一层咖啡厅过道', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (389, '自动手摇喷漆', 'AGZ-ZC-0000389', 'AGZ-TM-0000389', '瓶', '浅灰色', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '物业部消耗备用', '2000-01-01 00:00:00', 1, 0, -8.00, 10);
INSERT INTO `vm_goods` VALUES (390, '自动手摇喷漆', 'AGZ-ZC-0000390', 'AGZ-TM-0000390', '瓶', '白色', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 8.00, 8.00, NULL, 0, '物业部消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (391, '电话机', 'AGZ-ZC-0000391', 'AGZ-TM-0000391', '台', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 60.00, 60.00, NULL, 0, '物业部消耗备用', '2000-01-01 00:00:00', 1, 0, -4.00, 10);
INSERT INTO `vm_goods` VALUES (392, '城建档案盒', 'AGZ-ZC-0000392', 'AGZ-TM-0000392', '个', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 4.85, 4.85, NULL, 0, '物业总办', '2000-01-01 00:00:00', 1, 0, -4.00, 10);
INSERT INTO `vm_goods` VALUES (393, '茶杯', 'AGZ-ZC-0000393', 'AGZ-TM-0000393', '个', '带盖', NULL, 1, NULL, 0, 0, 0.00, 0.00, '', 13.75, 13.75, NULL, 0, '物业行政部', '0000-00-00 00:00:00', 1, 0, -24.00, 10);
INSERT INTO `vm_goods` VALUES (394, '茶盘', 'AGZ-ZC-0000394', 'AGZ-TM-0000394', '个', '个', NULL, 1, NULL, 1, 0, 0.00, 0.00, '', 35.00, 35.00, NULL, 0, '物业行政部', '0000-00-00 00:00:00', 1, 0, -4.00, 0);
INSERT INTO `vm_goods` VALUES (395, '马桶', 'AGZ-ZC-0000395', 'AGZ-TM-0000395', '套', '全套', NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 700.00, 700.00, NULL, 0, '物业部消耗备用', '2000-01-01 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (396, '配钥匙（8元）', 'AGZ-ZC-0000396', 'AGZ-TM-0000396', '把', '把', NULL, 3, NULL, 0, 0, 0.00, 0.00, '', 5.00, 5.00, NULL, 0, '物业行政部', '0000-00-00 00:00:00', 1, 0, -2.00, 0);
INSERT INTO `vm_goods` VALUES (397, '一次性鞋套', 'AGZ-ZC-0000397', 'AGZ-TM-0000397', '包', NULL, NULL, 3, NULL, NULL, 0, 0.00, 0.00, NULL, 5.50, 5.50, NULL, 0, '物业部消耗备用', '2000-01-01 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (398, '声控光控灯', 'AGZ-ZC-0000398', 'AGZ-TM-0000398', '只', 'LED', NULL, 11, NULL, NULL, 0, 0.00, 0.00, NULL, 15.00, 15.00, NULL, 0, '物业部消耗备用', '2000-01-01 00:00:00', 1, 0, -20.00, 10);
INSERT INTO `vm_goods` VALUES (399, '水性白板笔', 'AGZ-ZC-0000399', 'AGZ-TM-0000399', '支', '支', NULL, 1, NULL, 0, 0, 0.00, 0.00, '', 2.00, 2.00, NULL, 0, '物业总办', '0000-00-00 00:00:00', 1, 0, -8.00, 10);
INSERT INTO `vm_goods` VALUES (400, '医用酒精', 'AGZ-ZC-0000400', 'AGZ-TM-0000400', '瓶', '瓶', NULL, 1, NULL, 0, 0, 0.00, 0.00, '', 15.00, 15.00, NULL, 0, '物业总办', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (401, '白板擦', 'AGZ-ZC-0000401', 'AGZ-TM-0000401', '个', '个', NULL, 1, NULL, 0, 0, 0.00, 0.00, '', 5.00, 5.00, NULL, 0, '物业总办', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (402, '红外感应器', 'AGZ-ZC-0000402', 'AGZ-TM-0000402', '个', '电池阀', NULL, 3, NULL, 27, 0, 0.00, 0.00, '', 60.00, 60.00, NULL, 0, '物业部消耗备用', '0000-00-00 00:00:00', 1, 0, -40.00, 10);
INSERT INTO `vm_goods` VALUES (403, '防爆工具', 'AGZ-ZC-0000403', 'AGZ-TM-0000403', '套', '8件套', NULL, 3, NULL, 6, 0, 0.00, 0.00, '', 400.00, 400.00, NULL, 0, '物业部消耗备用', '0000-00-00 00:00:00', 1, 0, -4.00, 10);
INSERT INTO `vm_goods` VALUES (404, 'LED灯带', 'AGZ-ZC-0000404', 'AGZ-TM-0000404', '盘', '10CM', NULL, 3, NULL, 13, 0, 0.00, 0.00, '', 120.00, 120.00, NULL, 0, '三层总办', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (405, '硒鼓', 'AGZ-ZC-0000405', 'AGZ-TM-0000405', '个', '个', NULL, 3, NULL, 19, 0, 0.00, 0.00, '', 60.00, 60.00, NULL, 0, '物业财务', '0000-00-00 00:00:00', 1, 0, -6.00, 10);
INSERT INTO `vm_goods` VALUES (406, 'T5节能灯', 'AGZ-ZC-0000406', 'AGZ-TM-0000406', '箱', '飞利浦', NULL, 3, NULL, 13, 0, 0.00, 0.00, '', 175.00, 175.00, NULL, 0, '志远大厦', '0000-00-00 00:00:00', 1, 0, -4.00, 10);
INSERT INTO `vm_goods` VALUES (407, '彩纸', 'AGZ-ZC-0000407', 'AGZ-TM-0000407', '包', '各色', NULL, 11, NULL, 12, 0, 0.00, 0.00, '', 17.00, 17.00, NULL, 0, '物业部消耗备用', '0000-00-00 00:00:00', 1, 0, -16.00, 10);
INSERT INTO `vm_goods` VALUES (408, '花篮(2020)', 'AGZ-ZC-0000408', 'AGZ-TM-0000408', '个', '三层', NULL, 3, NULL, 23, 0, 0.00, 0.00, '', 300.00, 300.00, NULL, 0, '市场部&amp;quot;培优入场&amp;quot;', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (409, '花篮', 'AGZ-ZC-0000409', 'AGZ-TM-0000409', '个', '三层', NULL, 3, NULL, 23, 0, 0.00, 0.00, '', 300.00, 300.00, NULL, 0, '市场部&quot;学而思入驻&quot;', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (410, '配电箱', 'AGZ-ZC-0000410', 'AGZ-TM-0000410', '个', '个', NULL, 4, NULL, 3, 0, 0.00, 0.00, '', 1150.00, 1150.00, NULL, 0, '四层中心机房', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (411, '美得丽', 'AGZ-ZC-0000411', 'AGZ-TM-0000411', '桶', '立邦', NULL, 3, NULL, 11, 0, 0.00, 0.00, '', 220.00, 220.00, NULL, 0, '大厅楼梯', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (412, '毛刷-油漆专用', 'AGZ-ZC-0000412', 'AGZ-TM-0000412', '个', '个', NULL, 4, NULL, 11, 0, 0.00, 0.00, '', 8.00, 8.00, NULL, 0, '三层总办', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (413, '螺丝', 'AGZ-ZC-0000413', 'AGZ-TM-0000413', '个', '配套', NULL, 4, NULL, 11, 0, 0.00, 0.00, '', 1.70, 1.70, NULL, 0, '三层总办', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (414, '卫生间门锁', 'AGZ-ZC-0000414', 'AGZ-TM-0000414', '套', '套', NULL, 3, NULL, 11, 0, 0.00, 0.00, '', 14.00, 14.00, NULL, 0, '志远大厦', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (415, '高压软管接口', 'AGZ-ZC-0000415', 'AGZ-TM-0000415', '个', '个', NULL, 3, NULL, 12, 0, 0.00, 0.00, '', 8.00, 8.00, NULL, 0, '物业部消耗备用', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (416, '一次性纸杯托', 'AGZ-ZC-0000416', 'AGZ-TM-0000416', '包', '包', NULL, 3, NULL, 12, 0, 0.00, 0.00, '', 7.00, 7.00, NULL, 0, '物业部消耗备用', '0000-00-00 00:00:00', 1, 0, -6.00, 10);
INSERT INTO `vm_goods` VALUES (417, 'A3纸', 'AGZ-ZC-0000417', 'AGZ-TM-0000417', '箱', '箱', NULL, 3, NULL, 12, 0, 0.00, 0.00, '', 192.00, 192.00, NULL, 0, '物业部消耗备用', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (418, '三角钻头', 'AGZ-ZC-0000418', 'AGZ-TM-0000418', '个', '好的', NULL, 3, NULL, 3, 0, 0.00, 0.00, '', 7.00, 7.00, NULL, 0, '', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (419, '读卡器', 'AGZ-ZC-0000419', 'AGZ-TM-0000419', '个', '个', NULL, 11, NULL, 14, 0, 0.00, 0.00, '', 25.00, 25.00, NULL, 0, '总办提请采购的物品', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (420, '大垃圾袋', 'AGZ-ZC-0000420', 'AGZ-TM-0000420', '箱', '加厚', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 372.00, 372.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (421, '大盘纸', 'AGZ-ZC-0000421', 'AGZ-TM-0000421', '箱', '箱', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 90.00, 90.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (422, '擦手纸', 'AGZ-ZC-0000422', 'AGZ-TM-0000422', '箱', '箱', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 78.00, 78.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (423, '纸杯', 'AGZ-ZC-0000423', 'AGZ-TM-0000423', '箱', '加厚', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 240.00, 240.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (424, '大盘纸盒', 'AGZ-ZC-0000424', 'AGZ-TM-0000424', '个', '个', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 24.00, 24.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (425, '洗洁灵', 'AGZ-ZC-0000425', 'AGZ-TM-0000425', '箱', '箱', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 58.00, 58.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (426, '84消毒液', 'AGZ-ZC-0000426', 'AGZ-TM-0000426', '箱', '箱', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 58.00, 58.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (427, '小垃圾袋', 'AGZ-ZC-0000427', 'AGZ-TM-0000427', '箱', '办公室', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 560.00, 560.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (428, '洁厕灵', 'AGZ-ZC-0000428', 'AGZ-TM-0000428', '箱', '箱', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 58.00, 58.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (429, '固体清新剂', 'AGZ-ZC-0000429', 'AGZ-TM-0000429', '箱', '爱家', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 210.00, 210.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (430, '垃圾袋', 'AGZ-ZC-0000430', 'AGZ-TM-0000430', '袋', '电梯口', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 240.00, 240.00, NULL, 0, '物业保洁备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (431, '气泵', 'AGZ-ZC-0000431', 'AGZ-TM-0000431', '套', '打气线、气表、拖车带', NULL, 9, NULL, 22, 0, 0.00, 0.00, '', 705.00, 705.00, NULL, 0, '物业部消耗备用', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (432, '千斤顶', 'AGZ-ZC-0000432', 'AGZ-TM-0000432', '个', '个', NULL, 9, NULL, 22, 0, 0.00, 0.00, '', 285.00, 285.00, NULL, 0, '物业部消耗备用', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (433, '中华烟-软盒', 'AGZ-ZC-0000433', 'AGZ-TM-0000433', '条', '软', NULL, 15, NULL, 4, 0, 0.00, 0.00, '', 640.00, 640.00, NULL, 0, '物业总办', '0000-00-00 00:00:00', 1, 0, -6.00, 10);
INSERT INTO `vm_goods` VALUES (434, '灯笼', 'AGZ-ZC-0000434', 'AGZ-TM-0000434', '串', '串', NULL, 3, NULL, 15, 0, 0.00, 0.00, '', 20.00, 20.00, NULL, 0, '物业部春节用品', '0000-00-00 00:00:00', 1, 0, -20.00, 10);
INSERT INTO `vm_goods` VALUES (435, '窗花', 'AGZ-ZC-0000435', 'AGZ-TM-0000435', '个', '小', NULL, 3, NULL, 15, 0, 0.00, 0.00, '', 3.50, 3.50, NULL, 0, '物业部春节用品', '0000-00-00 00:00:00', 1, 0, -40.00, 10);
INSERT INTO `vm_goods` VALUES (436, '福字', 'AGZ-ZC-0000436', 'AGZ-TM-0000436', '个', '个', NULL, 3, NULL, 15, 0, 0.00, 0.00, '', 10.00, 10.00, NULL, 0, '物业部春节用品', '0000-00-00 00:00:00', 1, 0, -4.00, 10);
INSERT INTO `vm_goods` VALUES (437, '窗花', 'AGZ-ZC-0000437', 'AGZ-TM-0000437', '个', '大', NULL, 3, NULL, 15, 0, 0.00, 0.00, '', 5.00, 5.00, NULL, 0, '物业部春节用品', '0000-00-00 00:00:00', 1, 0, -40.00, 10);
INSERT INTO `vm_goods` VALUES (438, '对联', 'AGZ-ZC-0000438', 'AGZ-TM-0000438', '对', '大', NULL, 3, NULL, 15, 0, 0.00, 0.00, '', 90.00, 90.00, NULL, 0, '物业部春节用品', '0000-00-00 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (439, '84消毒液', 'AGZ-ZC-0000439', 'AGZ-TM-0000439', '瓶', '医用', NULL, 21, NULL, 21, 0, 0.00, 0.00, '', 1.40, 1.40, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (440, '莲花清瘟胶囊', 'AGZ-ZC-0000440', 'AGZ-TM-0000440', '盒', '盒', NULL, 21, NULL, 21, 0, 0.00, 0.00, '', 16.50, 16.50, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (441, '复方板蓝根', 'AGZ-ZC-0000441', 'AGZ-TM-0000441', '包', '包', NULL, 21, NULL, 21, 0, 0.00, 0.00, '', 25.00, 25.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (442, '电子测温仪', 'AGZ-ZC-0000442', 'AGZ-TM-0000442', '个', '非接触', NULL, 21, NULL, 35, 0, 0.00, 0.00, '', 258.00, 258.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (443, '电子测温仪', 'AGZ-ZC-0000443', 'AGZ-TM-0000443', '个', '红外', NULL, 21, NULL, 20, 0, 0.00, 0.00, '', 238.00, 238.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (444, '口罩', 'AGZ-ZC-0000444', 'AGZ-TM-0000444', '个', '个', NULL, 21, NULL, 27, 0, 0.00, 0.00, '', 1.30, 1.30, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (445, '电子测温仪', 'AGZ-ZC-0000445', 'AGZ-TM-0000445', '个', '红外', NULL, 21, NULL, 21, 0, 0.00, 0.00, '', 298.00, 298.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (446, '一次性手套', 'AGZ-ZC-0000446', 'AGZ-TM-0000446', '包', '包', NULL, 6, NULL, 11, 0, 0.00, 0.00, '', 3.00, 3.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (447, '电饭锅', 'AGZ-ZC-0000447', 'AGZ-TM-0000447', '个', '个', NULL, 1, NULL, 15, 0, 0.00, 0.00, '', 453.00, 453.00, NULL, 0, '物业部预防病毒消耗备用       ', '0000-00-00 00:00:00', 1, 0, -1.00, 0);
INSERT INTO `vm_goods` VALUES (448, '84消毒液', 'AGZ-ZC-0000448', 'AGZ-TM-0000448', '箱', '箱', NULL, 21, NULL, 11, 0, 0.00, 0.00, '', 105.00, 105.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (449, '脚踏垃圾桶', 'AGZ-ZC-0000449', 'AGZ-TM-0000449', '个', '个', NULL, 3, NULL, 15, 0, 0.00, 0.00, '', 30.00, 30.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (450, '洗手液', 'AGZ-ZC-0000450', 'AGZ-TM-0000450', '箱', '月亮牌', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 125.00, 125.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (451, '抽纸', 'AGZ-ZC-0000451', 'AGZ-TM-0000451', '箱', '箱', NULL, 3, NULL, 14, 0, 0.00, 0.00, '', 290.00, 290.00, NULL, 0, '物业部预防病毒消耗备用', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (452, '一次性马桶垫', 'AGZ-ZC-0000452', 'AGZ-TM-0000452', '箱', '5000个一箱', NULL, 3, NULL, 15, 0, 0.00, 0.00, '', 320.00, 320.00, NULL, 0, '物业消耗', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (453, '塑封膜', 'AGZ-ZC-0000453', 'AGZ-TM-0000453', '包', 'A4', NULL, 1, NULL, 12, 0, 0.00, 0.00, '', 35.00, 35.00, NULL, 0, '物业部办公', '0000-00-00 00:00:00', 1, 0, -2.00, 0);
INSERT INTO `vm_goods` VALUES (454, '印尼', 'AGZ-ZC-0000454', 'AGZ-TM-0000454', '个', '个', NULL, 1, NULL, 12, 0, 0.00, 0.00, '', 6.00, 6.00, NULL, 0, '物业部办公', '0000-00-00 00:00:00', 1, 0, -1.00, 0);
INSERT INTO `vm_goods` VALUES (455, '档案袋（牛皮纸）', 'AGZ-ZC-0000455', 'AGZ-TM-0000455', '个', '牛皮纸', NULL, 1, NULL, 1, 0, 0.00, 0.00, '', 1.00, 1.00, NULL, 0, 'm6总办', '0000-00-00 00:00:00', 1, 0, -63.00, 0);
INSERT INTO `vm_goods` VALUES (586, '体温计', 'AGZ-ZC-0000456', 'AGZ-TM-0000456', '个', '个', NULL, 3, NULL, 9, 1, 0.00, 0.00, NULL, 1.00, 6.00, 'TWJ', 1, NULL, '1999-12-31 00:00:00', 1, 0, -2.00, 10);
INSERT INTO `vm_goods` VALUES (587, '风机盘管', 'AGZ-ZC-0000457', 'AGZ-TM-0000457', '台', '238W/A', NULL, 4, NULL, 36, 1, 0.00, 0.00, NULL, 1.00, 1010.00, 'FJPG', 1, NULL, '1999-12-31 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (588, '工位牌屏风', 'AGZ-ZC-0000458', 'AGZ-TM-0000458', '个', '8X12', NULL, 1, NULL, 6, 1, 0.00, 0.00, NULL, 1.00, 2.20, 'GPPF', 1, NULL, '1999-12-31 00:00:00', 1, 0, -52.00, 10);
INSERT INTO `vm_goods` VALUES (589, '水晶头', 'AGZ-ZC-0000459', 'AGZ-TM-0000459', '盒', '超5类', NULL, 3, NULL, 17, 1, 0.00, 0.00, NULL, 1.00, 25.00, 'SJT', 1, NULL, '1999-12-31 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (590, 'AP', 'AGZ-ZC-0000460', 'AGZ-TM-0000460', '个', '千兆吸顶', NULL, 3, NULL, 27, 1, 0.00, 0.00, NULL, 0.00, 360.00, 'AP', 1, '侯罗平采购', '1999-12-31 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (591, '直通', 'AGZ-ZC-0000461', 'AGZ-TM-0000461', '个', '配套', NULL, 3, NULL, 17, 1, 0.00, 0.00, NULL, 0.00, 0.50, 'ZT', 1, '侯罗平采购', '1999-12-31 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (592, '排气扇', 'AGZ-ZC-0000462', 'AGZ-TM-0000462', '个', '8寸', NULL, 3, NULL, 11, 1, 0.00, 0.00, NULL, 0.00, 130.00, 'PQS', 1, NULL, '1999-12-31 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (593, '石膏板', 'AGZ-ZC-0000463', 'AGZ-TM-0000463', '张', '9.5厘', NULL, 4, NULL, 27, 1, 0.00, 0.00, NULL, 0.00, 22.00, 'SGB', 1, NULL, '1999-12-31 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (594, 'LED灯-13W', 'AGZ-ZC-0000464', 'AGZ-TM-0000464', '个', '13W', NULL, 3, NULL, 3, 1, 0.00, 0.00, '', 0.00, 13.00, 'LEDD', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (595, 'LED灯-9W', 'AGZ-ZC-0000465', 'AGZ-TM-0000465', '个', '9W', NULL, 3, NULL, 3, 1, 0.00, 0.00, '', 0.00, 10.00, 'LEDD', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (596, '橡胶手套', '1', '1', '套', '套', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 4.50, 'XJST', 1, '', '2020-03-24 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (597, '抹布', '1', '1', '张', '张', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 3.50, 'MB', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (598, '蹲坑毛刷', '1', '1', '个', '个', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 4.00, 'DKMS', 1, '', '2020-03-24 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (599, '墩布池过滤网', '1', '1', '个', '个', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 4.00, 'DBCGLW', 1, '', '2020-03-24 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (600, '擦玻璃茅头', '1', '1', '个', '个', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 7.00, 'CBLT', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (601, '刮玻璃刮子', '1', '1', '个', '个', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 8.00, 'GBLGZ', 1, '', '2020-03-24 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (602, '竹夹子（大）', '1', '1', '个', '个', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 4.00, 'ZJZD', 1, '', '2020-03-24 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (603, '清洁铲刀', '1', '1', '把', '把', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 8.00, 'QJCD', 1, '', '2020-03-24 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (604, '高粱把扫把', '1', '1', '把', '把', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 14.00, 'GLBSB', 1, '', '2020-03-24 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (605, '大垃圾袋（12X14）', '1', '1', '大包', '大包', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 360.00, 'DLJD12X14', 1, '', '2020-03-24 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (606, '小垃圾袋', '1', '1', '小包', '小包', NULL, 3, NULL, 14, 1, 0.00, 0.00, '', 0.00, 3.00, 'LJD', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (607, '证卡', '1', '1', '张', '张', NULL, 3, NULL, 12, 1, 0.00, 0.00, '', 0.00, 2.00, 'ZK', 1, '', '2020-03-25 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (608, '打印机连接线', '1', '1', '根', '根', NULL, 1, NULL, 1, 1, 0.00, 0.00, '', 0.00, 21.90, 'DYJLJX', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (609, '无线网卡', '1', '1', '个', '个', NULL, 3, NULL, 0, 1, 0.00, 0.00, '', 0.00, 25.00, 'WXWK', 1, '侯罗平采购', '2020-03-26 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (610, '无线AP', '1', '1', '台', '台', NULL, 3, NULL, 0, 1, 0.00, 0.00, '', 0.00, 360.00, 'WXAP', 1, '侯罗平采购', '2020-03-26 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (611, '系统U盘', '1', '1', '个', '个', NULL, 3, NULL, 0, 1, 0.00, 0.00, '', 1.00, 45.00, 'XTUP', 1, '侯罗平采购', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (612, '工位', '1', '1', '张', '120x60', NULL, 1, NULL, 38, 1, 0.00, 0.00, '', 0.00, 136.50, 'G', 1, '总办要求2天类完工，价格含运带安装带票', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (613, '小推柜', '1', '1', '个', '个', NULL, 1, NULL, 38, 1, 0.00, 0.00, '', 1.00, 63.00, 'TG', 1, '总办要求2天类完工，价格含运带安装带票', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (614, '转椅', '1', '1', '把', '旋转', NULL, 1, NULL, 38, 1, 0.00, 0.00, '', 0.00, 80.40, 'ZY', 1, '总办要求2天类完工，价格含运带安装带票', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (615, '热敏打印纸', '1', '1', '卷', '卷', NULL, 3, NULL, 1, 1, 0.00, 0.00, '', 0.00, 19.75, 'RMDYZ', 1, '', '2020-03-26 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (616, '电线收纳扎带器', '1', '1', '个', '个', NULL, 1, NULL, 1, 1, 0.00, 0.00, '', 0.00, 1.49, 'DXSNZDQ', 1, '', '2020-03-26 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (617, '网线', '1', '1', '箱', '超5类', NULL, 3, NULL, 13, 1, 0.00, 0.00, '', 0.00, 325.00, 'WX', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (618, '电胶带', '1', '1', '卷', '个', NULL, 3, NULL, 13, 1, 0.00, 0.00, '', 0.00, 2.00, 'DJD', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (619, '长扎带', '1', '1', '把', '把', NULL, 3, NULL, 13, 1, 0.00, 0.00, '', 0.00, 20.00, 'CZD', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (620, '网线钳', '1', '1', '把', '把', NULL, 3, NULL, 13, 1, 0.00, 0.00, '', 0.00, 30.00, 'WXQ', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (621, '水晶头', '1', '1', '个', '超五类', NULL, 3, NULL, 13, 1, 0.00, 0.00, '', 1.00, 0.70, 'SJT', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (622, '小黄鱼', '1', '1', '包', '6号', NULL, 1, NULL, 28, 1, 0.00, 0.00, '', 7.00, 7.00, 'HY', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (623, '寻线仪', '1', '1', '个', '个', NULL, 3, NULL, 13, 1, 0.00, 0.00, '', 0.00, 150.00, 'XXY', 1, '', '2020-04-02 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (624, '橡胶椅子', '1', '1', '把', '厚', NULL, 1, NULL, 14, 1, 0.00, 0.00, '', 0.00, 18.00, 'XJYZ', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (625, '海绵桌脚贴（角贴）', '1', '1', '包', '包', NULL, 1, NULL, 14, 1, 0.00, 0.00, '', 0.00, 5.00, 'HMZJTJT', 1, '', '2020-04-02 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (626, '海绵桌脚贴（边贴）', '1', '1', '包', '包', NULL, 1, NULL, 14, 1, 0.00, 0.00, '', 0.00, 10.00, 'HMZJTBT', 1, '', '2020-04-02 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (627, '花洒', '1', '1', '个', '个', NULL, 1, NULL, 11, 1, 0.00, 0.00, '', 0.00, 35.00, 'HS', 1, '', '2020-04-02 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (628, '休闲桌椅', '1', '1', '套', '1桌4椅', NULL, 1, NULL, 40, 1, 0.00, 0.00, '', 0.00, 220.00, 'XXZY', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (629, '西服', '1', '1', '套', '套', NULL, 1, NULL, 39, 1, 0.00, 0.00, '', 0.00, 450.00, 'XF', 1, '', '2020-04-02 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (630, '衬衣', '1', '1', '件', '件', NULL, 1, NULL, 39, 1, 0.00, 0.00, '', 0.00, 50.00, 'CY', 1, '', '2020-04-02 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (631, '笑脸贴', '1', '1', '包', '包', NULL, 1, NULL, 1, 1, 0.00, 0.00, '', 0.00, 3.30, 'LT', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (632, '浅蓝A4打印纸', '1', '1', '包', '浅蓝', NULL, 1, NULL, 1, 1, 0.00, 0.00, '', 0.00, 15.70, 'QLA4DYZ', 1, '', '2020-04-02 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (633, '施耐德LED灯', '1', '1', '个', '9瓦', NULL, 1, NULL, 13, 1, 0.00, 0.00, '', 0.00, 13.50, 'SNDLEDD', 1, '', '2020-04-08 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (634, '玻璃吸盘', '1', '1', '套', '带绳', NULL, 1, NULL, 42, 1, 0.00, 0.00, '', 0.00, 100.00, 'SNDLEDD', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (635, '电瓶连接器', '1', '1', '套', '套', NULL, 1, NULL, 22, 1, 0.00, 0.00, '', 0.00, 100.00, 'SNDLEDD', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (636, '抽纸（心相印）', '1', '1', '箱', '36盒', NULL, 1, NULL, 14, 1, 0.00, 0.00, '', 0.00, 200.00, 'CZXXY', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 10);
INSERT INTO `vm_goods` VALUES (637, '红笔', '1', '1', '盒', '盒', NULL, 1, NULL, 14, 1, 0.00, 0.00, '', 0.00, 15.00, 'HB', 1, '', '2020-04-08 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (638, '抽纸', '1', '1', '箱', '维达', NULL, 1, NULL, 14, 1, 0.00, 0.00, '', 0.00, 130.00, 'CZ', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (639, '投影仪升降梯', '1', '1', '台', '自动限行，2米', NULL, 1, NULL, 43, 1, 0.00, 0.00, '', 0.00, 2715.00, 'TYYSJT', 1, '第一次购买985元，使用后进行更换型号货物，补差价1530元。使用后磨损费用200元，共计2715元。', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (640, '投影仪灯泡', '1', '1', '个', '日立HCP-347X', NULL, 1, NULL, 43, 1, 0.00, 0.00, '', 0.00, 315.00, 'TYYDP', 1, '', '2020-04-08 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (641, '投影仪遥控器', '1', '1', '个', '个', NULL, 1, NULL, 1, 1, 0.00, 0.00, '', 0.00, 26.00, 'TYYYKQ', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (642, 'usb转RJ45线', '1', '1', '条', '条', NULL, 1, NULL, 1, 1, 0.00, 0.00, '', 0.00, 65.00, 'usbZRJ45X', 1, '', '2020-04-08 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (643, 'TP双频无线网卡', '1', '1', '个', '5200免驱', NULL, 1, NULL, 43, 1, 0.00, 0.00, '', 0.00, 88.00, 'TPSPWXWK', 1, '侯罗平采购', '2020-04-08 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (644, 'TP双频无线网卡', '1', '1', '个', '6200免驱', NULL, 1, NULL, 43, 1, 0.00, 0.00, '', 0.00, 163.00, 'TPSPWXWK', 1, '侯罗平采购', '2020-04-08 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (645, '三木订书机(加一盒钉子)', '1', '1', '套', '组合', NULL, 1, NULL, 6, 1, 0.00, 0.00, '', 0.00, 103.00, 'SMDSJ(JYHDZ)', 1, '', '2020-04-13 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (646, '移动硬盘-希捷', '1', '1', '个', '2TB', NULL, 1, NULL, 1, 1, 0.00, 0.00, '', 0.00, 459.00, 'YDYP-XJ', 1, '', '2020-04-13 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (647, '支出凭证', '1', '1', '大包（18小包）', '大包', NULL, 1, NULL, 12, 1, 0.00, 0.00, '', 0.00, 78.00, 'ZCPZ', 1, '', '0000-00-00 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (648, '打印机条', '1', '1', '个', '税控', NULL, 1, NULL, 43, 1, 0.00, 0.00, '', 0.00, 14.00, 'DYJT', 1, '', '2020-04-13 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (649, '洗洁灵', '1', '1', '箱', '6瓶', NULL, 1, NULL, 14, 1, 0.00, 0.00, '', 0.00, 84.00, 'XJL', 1, '', '2020-04-13 00:00:00', 1, 0, 0.00, 0);
INSERT INTO `vm_goods` VALUES (650, '杀虫剂', '1', '1', '箱', '24瓶', NULL, 1, NULL, 14, 1, 0.00, 0.00, '', 0.00, 360.00, 'SCJ', 1, '', '2020-04-13 00:00:00', 1, 0, 0.00, 0);

-- ----------------------------
-- Table structure for vm_handover
-- ----------------------------
DROP TABLE IF EXISTS `vm_handover`;
CREATE TABLE `vm_handover`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `hand_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交接用户',
  `hand_cash` float(8, 2) NOT NULL COMMENT '交接现金',
  `hand_wechat` float(8, 2) NOT NULL COMMENT '交接微信',
  `hand_alipay` float(8, 2) NOT NULL COMMENT '交接支付宝',
  `hand_keep` float(8, 2) NOT NULL COMMENT '钱箱留存',
  `hand_shop` int(4) NOT NULL COMMENT '交接店铺',
  `hand_time` int(11) NOT NULL COMMENT '交接时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_handover
-- ----------------------------

-- ----------------------------
-- Table structure for vm_item
-- ----------------------------
DROP TABLE IF EXISTS `vm_item`;
CREATE TABLE `vm_item`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `or_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `gd_id` int(4) NOT NULL COMMENT '产品ID',
  `it_number` float(8, 2) NOT NULL COMMENT '数量',
  `it_price` float(8, 2) NOT NULL COMMENT '单价或单价ID',
  `it_discount` float(4, 2) NOT NULL DEFAULT 10.00 COMMENT '商品折扣',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `or_id`(`or_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1064 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_item
-- ----------------------------
INSERT INTO `vm_item` VALUES (5, 'VM_20200222-1-3', 1, 10.00, 25.00, 10.00);
INSERT INTO `vm_item` VALUES (7, 'VM_20200222-1-6', 1, 1.00, 22.00, 10.00);
INSERT INTO `vm_item` VALUES (8, 'VM_20200222-1-6', 2, 1.00, 630.00, 10.00);
INSERT INTO `vm_item` VALUES (97, 'VM_20200223-1-2', 11, 18.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (108, 'VM_20200223-1-13', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (109, 'VM_20200223-1-14', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (110, 'VM_20200223-1-15', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (111, 'VM_20200223-1-16', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (112, 'VM_20200223-1-17', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (113, 'VM_20200223-1-18', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (114, 'VM_20200223-1-19', 11, 30.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (115, 'VM_20200223-1-20', 11, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (116, 'VM_20200223-1-21', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (117, 'VM_20200223-1-22', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (118, 'VM_20200223-1-23', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (120, 'VM_20200223-1-24', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (121, 'VM_20200223-1-25', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (122, 'VM_20200223-1-26', 11, 3.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (125, 'VM_20200223-1-28', 11, 60.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (126, 'VM_20200223-1-29', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (127, 'VM_20200223-1-30', 11, 24.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (128, 'VM_20200223-1-31', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (129, 'VM_20200223-1-32', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (130, 'VM_20200223-1-33', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (131, 'VM_20200223-1-34', 11, 18.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (132, 'VM_20200223-1-35', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (133, 'VM_20200223-1-36', 11, 126.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (134, 'VM_20200223-1-37', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (135, 'VM_20200223-1-38', 11, 72.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (136, 'VM_20200223-1-39', 11, 72.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (137, 'VM_20200223-1-40', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (138, 'VM_20200223-1-41', 11, 66.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (139, 'VM_20200224-1-42', 11, 24.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (140, 'VM_20200224-1-43', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (141, 'VM_20200224-1-44', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (142, 'VM_20200224-1-45', 11, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (143, 'VM_20200224-1-46', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (144, 'VM_20200224-1-47', 11, 24.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (145, 'VM_20200224-1-48', 11, 36.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (146, 'VM_20200224-1-49', 11, 78.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (147, 'VM_20200224-1-50', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (148, 'VM_20200224-1-51', 11, 60.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (149, 'VM_20200224-1-52', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (150, 'VM_20200224-1-53', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (151, 'VM_20200224-1-54', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (152, 'VM_20200224-1-55', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (153, 'VM_20200224-1-56', 11, 60.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (154, 'VM_20200224-1-57', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (155, 'VM_20200224-1-58', 11, 30.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (156, 'VM_20200224-1-59', 11, 24.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (157, 'VM_20200224-1-60', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (158, 'VM_20200224-1-61', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (159, 'VM_20200224-1-62', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (160, 'VM_20200224-1-63', 11, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (161, 'VM_20200224-1-64', 11, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (162, 'VM_20200224-1-65', 11, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (169, 'VM_20200224-1-66', 9, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (170, 'VM_20200224-1-77', 9, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (171, 'VM_20200224-1-78', 10, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (174, 'VM_20200224-1-79', 6, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (175, 'VM_20200224-1-80', 6, 36.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (176, 'VM_20200224-1-81', 6, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (177, 'VM_20200224-1-82', 6, 7.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (178, 'VM_20200224-1-83', 6, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (179, 'VM_20200224-1-84', 6, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (180, 'VM_20200224-1-85', 6, 36.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (182, 'VM_20200224-1-86', 6, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (183, 'VM_20200224-1-87', 6, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (270, 'VM_20200224-1-88', 1, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (271, 'VM_20200225-1-90', 1, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (273, 'VM_20200225-1-92', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (274, 'VM_20200225-1-93', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (275, 'VM_20200225-1-94', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (276, 'VM_20200225-1-95', 1, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (277, 'VM_20200225-1-96', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (278, 'VM_20200225-1-97', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (279, 'VM_20200225-1-98', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (281, 'VM_20200225-1-99', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (282, 'VM_20200225-1-100', 1, 3.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (283, 'VM_20200225-1-101', 1, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (284, 'VM_20200225-1-102', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (285, 'VM_20200225-1-103', 1, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (286, 'VM_20200225-1-104', 1, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (287, 'VM_20200225-1-105', 1, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (288, 'VM_20200225-1-106', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (289, 'VM_20200225-1-107', 1, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (290, 'VM_20200225-1-108', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (291, 'VM_20200225-1-109', 1, 40.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (292, 'VM_20200225-1-110', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (293, 'VM_20200225-1-111', 1, 20.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (294, 'VM_20200225-1-112', 1, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (295, 'VM_20200225-1-113', 1, 20.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (296, 'VM_20200225-1-114', 1, 12.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (297, 'VM_20200225-1-115', 1, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (469, 'PS_20200228-1-122', 101, 1.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (485, 'PS_20200302-1-140', 1, 1.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (486, 'PS_20200302-1-140', 2, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (610, 'VM_20200306-7-146', 380, 1.00, 469.00, 10.00);
INSERT INTO `vm_item` VALUES (611, 'VM_20200312-7-148', 382, 1.00, 177.90, 10.00);
INSERT INTO `vm_item` VALUES (612, 'VM_20200312-7-148', 383, 30.00, 3.00, 10.00);
INSERT INTO `vm_item` VALUES (613, 'VM_20200312-7-149', 381, 1.00, 120.00, 10.00);
INSERT INTO `vm_item` VALUES (614, 'VM_20200312-7-150', 384, 1.00, 3500.00, 10.00);
INSERT INTO `vm_item` VALUES (615, 'VM_20200312-7-150', 385, 26.00, 217.50, 10.00);
INSERT INTO `vm_item` VALUES (616, 'VM_20200312-7-150', 386, 15.00, 19.00, 10.00);
INSERT INTO `vm_item` VALUES (617, 'VM_20200312-7-151', 387, 12.00, 16.50, 10.00);
INSERT INTO `vm_item` VALUES (618, 'VM_20200312-7-152', 388, 2.00, 90.00, 10.00);
INSERT INTO `vm_item` VALUES (619, 'VM_20200312-7-153', 389, 10.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (620, 'VM_20200312-7-153', 390, 10.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (621, 'VM_20200312-7-154', 391, 2.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (622, 'VM_20200312-7-155', 392, 20.00, 4.85, 10.00);
INSERT INTO `vm_item` VALUES (623, 'VM_20200312-7-156', 393, 12.00, 13.75, 10.00);
INSERT INTO `vm_item` VALUES (624, 'VM_20200312-7-156', 394, 2.00, 35.00, 10.00);
INSERT INTO `vm_item` VALUES (625, 'VM_20200312-7-157', 395, 3.00, 700.00, 10.00);
INSERT INTO `vm_item` VALUES (626, 'VM_20200312-7-158', 54, 2.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (629, 'VM_20200312-7-160', 399, 4.00, 2.00, 10.00);
INSERT INTO `vm_item` VALUES (630, 'VM_20200312-7-160', 400, 1.00, 15.00, 10.00);
INSERT INTO `vm_item` VALUES (631, 'VM_20200312-7-160', 401, 1.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (636, 'VM_20200224-1-69', 402, 1.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (637, 'VM_20200312-7-159', 403, 2.00, 400.00, 10.00);
INSERT INTO `vm_item` VALUES (638, 'VM_20200312-7-162', 397, 30.00, 5.50, 10.00);
INSERT INTO `vm_item` VALUES (639, 'VM_20200312-7-162', 398, 10.00, 15.00, 10.00);
INSERT INTO `vm_item` VALUES (640, 'VM_20200312-7-163', 402, 20.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (644, 'VM_20200312-7-164', 404, 4.00, 120.00, 10.00);
INSERT INTO `vm_item` VALUES (645, 'VM_20200312-7-165', 405, 3.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (646, 'VM_20200312-7-166', 406, 2.00, 175.00, 10.00);
INSERT INTO `vm_item` VALUES (647, 'VM_20200312-7-167', 407, 8.00, 17.00, 10.00);
INSERT INTO `vm_item` VALUES (648, 'VM_20200312-7-168', 318, 2.00, 300.00, 10.00);
INSERT INTO `vm_item` VALUES (649, 'VM_20200312-7-169', 318, 6.00, 300.00, 10.00);
INSERT INTO `vm_item` VALUES (650, 'VM_20200312-7-170', 410, 1.00, 1150.00, 10.00);
INSERT INTO `vm_item` VALUES (651, 'VM_20200312-7-171', 411, 6.00, 220.00, 10.00);
INSERT INTO `vm_item` VALUES (652, 'VM_20200312-7-172', 412, 2.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (653, 'VM_20200312-7-173', 413, 10.00, 1.70, 10.00);
INSERT INTO `vm_item` VALUES (654, 'VM_20200312-7-174', 414, 5.00, 14.00, 10.00);
INSERT INTO `vm_item` VALUES (655, 'VM_20200312-7-175', 415, 1.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (657, 'VM_20200312-7-175', 417, 1.00, 192.00, 10.00);
INSERT INTO `vm_item` VALUES (658, 'VM_20200312-7-176', 418, 10.00, 7.00, 10.00);
INSERT INTO `vm_item` VALUES (659, 'VM_20200312-7-177', 416, 3.00, 7.00, 10.00);
INSERT INTO `vm_item` VALUES (660, 'VM_20200312-7-178', 419, 2.00, 25.00, 10.00);
INSERT INTO `vm_item` VALUES (665, 'VM_20200312-7-179', 420, 15.00, 372.00, 10.00);
INSERT INTO `vm_item` VALUES (666, 'VM_20200312-7-179', 421, 30.00, 90.00, 10.00);
INSERT INTO `vm_item` VALUES (667, 'VM_20200312-7-179', 422, 30.00, 78.00, 10.00);
INSERT INTO `vm_item` VALUES (668, 'VM_20200312-7-179', 423, 1.00, 240.00, 10.00);
INSERT INTO `vm_item` VALUES (669, 'VM_20200312-7-179', 424, 30.00, 24.00, 10.00);
INSERT INTO `vm_item` VALUES (670, 'VM_20200312-7-179', 425, 10.00, 58.00, 10.00);
INSERT INTO `vm_item` VALUES (671, 'VM_20200312-7-179', 426, 15.00, 58.00, 10.00);
INSERT INTO `vm_item` VALUES (672, 'VM_20200312-7-179', 427, 5.00, 560.00, 10.00);
INSERT INTO `vm_item` VALUES (673, 'VM_20200312-7-179', 428, 10.00, 58.00, 10.00);
INSERT INTO `vm_item` VALUES (674, 'VM_20200312-7-179', 429, 2.00, 210.00, 10.00);
INSERT INTO `vm_item` VALUES (675, 'VM_20200312-7-179', 430, 1.00, 240.00, 10.00);
INSERT INTO `vm_item` VALUES (676, 'VM_20200312-7-180', 431, 1.00, 705.00, 10.00);
INSERT INTO `vm_item` VALUES (677, 'VM_20200312-7-180', 432, 1.00, 285.00, 10.00);
INSERT INTO `vm_item` VALUES (678, 'VM_20200312-7-181', 433, 4.00, 640.00, 10.00);
INSERT INTO `vm_item` VALUES (679, 'VM_20200312-7-182', 434, 10.00, 20.00, 10.00);
INSERT INTO `vm_item` VALUES (680, 'VM_20200312-7-182', 435, 20.00, 3.50, 10.00);
INSERT INTO `vm_item` VALUES (681, 'VM_20200312-7-182', 436, 2.00, 10.00, 10.00);
INSERT INTO `vm_item` VALUES (682, 'VM_20200312-7-182', 437, 20.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (683, 'VM_20200312-7-182', 438, 1.00, 90.00, 10.00);
INSERT INTO `vm_item` VALUES (684, 'VM_20200312-7-183', 452, 1.00, 320.00, 10.00);
INSERT INTO `vm_item` VALUES (691, 'VM_20200312-7-185', 453, 5.00, 35.00, 10.00);
INSERT INTO `vm_item` VALUES (692, 'VM_20200312-7-185', 454, 2.00, 6.00, 10.00);
INSERT INTO `vm_item` VALUES (693, 'VM_20200312-7-185', 455, 100.00, 1.00, 10.00);
INSERT INTO `vm_item` VALUES (696, 'VM_20200223-1-4', 78, 6.00, 2.50, 10.00);
INSERT INTO `vm_item` VALUES (697, 'VM_20200223-1-4', 330, 1.00, 18.00, 10.00);
INSERT INTO `vm_item` VALUES (710, 'VM_20200302-4-137', 127, 1.00, 2.00, 10.00);
INSERT INTO `vm_item` VALUES (711, 'VM_20200302-4-137', 167, 1.00, 18.00, 10.00);
INSERT INTO `vm_item` VALUES (712, 'VM_20200313-4-187', 68, 1.00, 10.00, 10.00);
INSERT INTO `vm_item` VALUES (713, 'VM_20200313-4-188', 136, 1.00, 4.00, 10.00);
INSERT INTO `vm_item` VALUES (714, 'VM_20200313-4-189', 145, 2.00, 1.50, 10.00);
INSERT INTO `vm_item` VALUES (715, 'VM_20200313-4-190', 397, 1.00, 5.50, 10.00);
INSERT INTO `vm_item` VALUES (716, 'VM_20200313-4-190', 68, 1.00, 10.00, 10.00);
INSERT INTO `vm_item` VALUES (717, 'VM_20200313-4-192', 245, 4.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (722, 'VM_20200313-4-193', 61, 1.00, 4.00, 10.00);
INSERT INTO `vm_item` VALUES (723, 'VM_20200313-4-195', 286, 2.00, 33.00, 10.00);
INSERT INTO `vm_item` VALUES (724, 'VM_20200313-7-186', 586, 20.00, 6.00, 10.00);
INSERT INTO `vm_item` VALUES (732, 'VM_20200313-4-196', 454, 1.00, 6.00, 10.00);
INSERT INTO `vm_item` VALUES (733, 'VM_20200318-4-200', 245, 3.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (734, 'VM_20200318-4-201', 68, 1.00, 10.00, 10.00);
INSERT INTO `vm_item` VALUES (735, 'VM_20200318-4-202', 145, 2.00, 1.50, 10.00);
INSERT INTO `vm_item` VALUES (736, 'VM_20200318-4-203', 60, 2.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (737, 'VM_20200318-4-204', 159, 1.00, 90.00, 10.00);
INSERT INTO `vm_item` VALUES (738, 'VM_20200318-4-205', 357, 1.00, 20.00, 10.00);
INSERT INTO `vm_item` VALUES (739, 'VM_20200318-4-206', 357, 1.00, 20.00, 10.00);
INSERT INTO `vm_item` VALUES (740, 'VM_20200318-4-207', 357, 1.00, 20.00, 10.00);
INSERT INTO `vm_item` VALUES (741, 'VM_20200318-4-208', 59, 1.00, 25.00, 10.00);
INSERT INTO `vm_item` VALUES (742, 'VM_20200318-4-209', 128, 1.00, 20.00, 10.00);
INSERT INTO `vm_item` VALUES (743, 'VM_20200318-4-210', 455, 60.00, 1.00, 10.00);
INSERT INTO `vm_item` VALUES (744, 'VM_20200318-4-210', 55, 80.00, 0.80, 10.00);
INSERT INTO `vm_item` VALUES (745, 'VM_20200318-4-211', 356, 1.00, 35.00, 10.00);
INSERT INTO `vm_item` VALUES (746, 'VM_20200318-4-212', 61, 5.00, 4.00, 10.00);
INSERT INTO `vm_item` VALUES (747, 'VM_20200318-4-213', 145, 2.00, 1.50, 10.00);
INSERT INTO `vm_item` VALUES (748, 'VM_20200318-4-214', 397, 1.00, 5.50, 10.00);
INSERT INTO `vm_item` VALUES (749, 'VM_20200318-4-215', 381, 1.00, 120.00, 10.00);
INSERT INTO `vm_item` VALUES (751, 'VM_20200318-4-216', 382, 1.00, 177.90, 10.00);
INSERT INTO `vm_item` VALUES (752, 'VM_20200318-4-217', 389, 4.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (753, 'VM_20200318-4-218', 391, 2.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (755, 'VM_20200318-4-220', 393, 12.00, 13.75, 10.00);
INSERT INTO `vm_item` VALUES (756, 'VM_20200318-4-220', 394, 2.00, 35.00, 10.00);
INSERT INTO `vm_item` VALUES (757, 'VM_20200318-4-221', 395, 3.00, 700.00, 10.00);
INSERT INTO `vm_item` VALUES (763, 'VM_20200318-4-223', 398, 10.00, 15.00, 10.00);
INSERT INTO `vm_item` VALUES (764, 'VM_20200318-4-223', 402, 20.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (765, 'VM_20200318-4-224', 378, 1.00, 730.00, 10.00);
INSERT INTO `vm_item` VALUES (766, 'VM_20200318-4-224', 403, 2.00, 400.00, 10.00);
INSERT INTO `vm_item` VALUES (767, 'VM_20200318-4-225', 399, 4.00, 2.00, 10.00);
INSERT INTO `vm_item` VALUES (768, 'VM_20200318-4-225', 400, 1.00, 15.00, 10.00);
INSERT INTO `vm_item` VALUES (769, 'VM_20200318-4-225', 401, 1.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (770, 'VM_20200318-4-226', 406, 2.00, 175.00, 10.00);
INSERT INTO `vm_item` VALUES (775, 'VM_20200318-4-227', 405, 3.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (778, 'VM_20200318-4-229', 407, 8.00, 17.00, 10.00);
INSERT INTO `vm_item` VALUES (779, 'VM_20200318-4-230', 416, 3.00, 7.00, 10.00);
INSERT INTO `vm_item` VALUES (780, 'VM_20200318-4-230', 417, 1.00, 192.00, 10.00);
INSERT INTO `vm_item` VALUES (781, 'VM_20200318-4-231', 415, 1.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (782, 'VM_20200318-4-232', 419, 1.00, 25.00, 10.00);
INSERT INTO `vm_item` VALUES (783, 'VM_20200318-4-233', 431, 1.00, 705.00, 10.00);
INSERT INTO `vm_item` VALUES (784, 'VM_20200318-4-233', 432, 1.00, 285.00, 10.00);
INSERT INTO `vm_item` VALUES (786, 'VM_20200318-4-234', 434, 10.00, 20.00, 10.00);
INSERT INTO `vm_item` VALUES (787, 'VM_20200318-4-234', 435, 20.00, 3.50, 10.00);
INSERT INTO `vm_item` VALUES (788, 'VM_20200318-4-234', 437, 20.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (789, 'VM_20200318-4-234', 436, 2.00, 10.00, 10.00);
INSERT INTO `vm_item` VALUES (790, 'VM_20200318-4-234', 438, 1.00, 90.00, 10.00);
INSERT INTO `vm_item` VALUES (791, 'VM_20200318-4-235', 447, 1.00, 453.00, 10.00);
INSERT INTO `vm_item` VALUES (792, 'VM_20200318-4-236', 111, 2.00, 114.00, 10.00);
INSERT INTO `vm_item` VALUES (793, 'VM_20200318-4-237', 353, 1.00, 22.00, 10.00);
INSERT INTO `vm_item` VALUES (795, 'VM_20200318-4-239', 197, 1.00, 125.00, 10.00);
INSERT INTO `vm_item` VALUES (796, 'VM_20200318-4-239', 113, 2.00, 200.00, 10.00);
INSERT INTO `vm_item` VALUES (797, 'VM_20200318-4-240', 422, 2.00, 78.00, 10.00);
INSERT INTO `vm_item` VALUES (798, 'VM_20200318-4-240', 139, 1.00, 160.00, 10.00);
INSERT INTO `vm_item` VALUES (799, 'VM_20200318-4-240', 136, 1.00, 4.00, 10.00);
INSERT INTO `vm_item` VALUES (800, 'VM_20200318-4-240', 197, 2.00, 125.00, 10.00);
INSERT INTO `vm_item` VALUES (801, 'VM_20200318-4-240', 121, 1.00, 360.00, 10.00);
INSERT INTO `vm_item` VALUES (802, 'VM_20200318-4-241', 193, 6.00, 3.50, 10.00);
INSERT INTO `vm_item` VALUES (803, 'VM_20200318-4-241', 197, 2.00, 125.00, 10.00);
INSERT INTO `vm_item` VALUES (804, 'VM_20200318-4-241', 139, 1.00, 160.00, 10.00);
INSERT INTO `vm_item` VALUES (806, 'VM_20200318-4-242', 136, 1.00, 4.00, 10.00);
INSERT INTO `vm_item` VALUES (807, 'VM_20200318-4-242', 139, 2.00, 160.00, 10.00);
INSERT INTO `vm_item` VALUES (808, 'VM_20200318-4-243', 151, 5.00, 9.00, 10.00);
INSERT INTO `vm_item` VALUES (809, 'VM_20200318-4-244', 111, 2.00, 114.00, 10.00);
INSERT INTO `vm_item` VALUES (810, 'VM_20200318-4-244', 422, 2.00, 78.00, 10.00);
INSERT INTO `vm_item` VALUES (811, 'VM_20200318-4-244', 197, 3.00, 125.00, 10.00);
INSERT INTO `vm_item` VALUES (813, 'VM_20200318-4-245', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (814, 'VM_20200318-4-246', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (815, 'VM_20200318-4-247', 8, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (816, 'VM_20200318-4-248', 8, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (817, 'VM_20200318-4-249', 8, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (818, 'VM_20200318-4-250', 8, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (819, 'VM_20200318-4-251', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (820, 'VM_20200318-4-252', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (821, 'VM_20200318-4-253', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (822, 'VM_20200318-4-254', 8, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (823, 'VM_20200318-4-255', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (824, 'VM_20200318-4-256', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (825, 'VM_20200318-4-257', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (826, 'VM_20200318-4-258', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (827, 'VM_20200318-4-259', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (828, 'VM_20200318-4-260', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (829, 'VM_20200318-4-261', 8, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (830, 'VM_20200318-4-262', 8, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (831, 'VM_20200318-4-263', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (832, 'VM_20200318-4-264', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (833, 'VM_20200318-4-265', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (834, 'VM_20200318-4-266', 8, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (835, 'VM_20200318-4-267', 1, 20.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (836, 'VM_20200318-4-268', 6, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (837, 'VM_20200318-4-268', 11, 2.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (838, 'VM_20200318-4-269', 6, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (839, 'VM_20200318-4-269', 11, 2.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (840, 'VM_20200318-4-270', 7, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (841, 'VM_20200318-4-270', 1, 1.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (842, 'VM_20200318-4-271', 19, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (843, 'VM_20200318-4-272', 11, 12.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (844, 'VM_20200318-4-273', 11, 36.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (846, 'VM_20200318-4-274', 11, 24.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (847, 'VM_20200318-4-275', 11, 90.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (849, 'VM_20200318-4-276', 11, 12.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (850, 'VM_20200318-4-277', 1, 40.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (851, 'VM_20200318-4-278', 1, 2.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (853, 'VM_20200318-4-280', 11, 6.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (855, 'VM_20200318-4-280', 1, 2.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (856, 'VM_20200318-4-281', 1, 20.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (857, 'VM_20200318-4-282', 11, 12.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (858, 'VM_20200318-4-283', 1, 20.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (860, 'VM_20200318-4-285', 1, 1.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (861, 'VM_20200318-4-285', 7, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (862, 'VM_20200318-4-285', 11, 18.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (864, 'VM_20200318-4-286', 11, 12.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (865, 'VM_20200318-4-287', 1, 1.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (866, 'VM_20200318-4-287', 7, 3.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (868, 'VM_20200318-4-288', 6, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (869, 'VM_20200318-4-289', 1, 1.00, 138.00, 10.00);
INSERT INTO `vm_item` VALUES (870, 'VM_20200318-4-289', 11, 6.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (888, 'VM_20200318-4-219', 392, 2.00, 4.85, 10.00);
INSERT INTO `vm_item` VALUES (889, 'VM_20200318-1-292', 1, 1.00, 135.00, 10.00);
INSERT INTO `vm_item` VALUES (890, 'VM_20200318-1-292', 3, 1.00, 229.00, 10.00);
INSERT INTO `vm_item` VALUES (891, 'VM_20200318-1-292', 4, 1.00, 599.00, 10.00);
INSERT INTO `vm_item` VALUES (892, 'VM_20200319-7-291', 588, 26.00, 2.20, 10.00);
INSERT INTO `vm_item` VALUES (893, 'VM_20200319-7-292', 587, 11.00, 1010.00, 10.00);
INSERT INTO `vm_item` VALUES (894, 'VM_20200319-7-293', 244, 2.00, 130.00, 10.00);
INSERT INTO `vm_item` VALUES (895, 'VM_20200319-7-294', 353, 2.00, 26.00, 10.00);
INSERT INTO `vm_item` VALUES (896, 'VM_20200319-7-295', 190, 4.00, 120.00, 10.00);
INSERT INTO `vm_item` VALUES (897, 'VM_20200319-7-296', 308, 1.00, 720.00, 10.00);
INSERT INTO `vm_item` VALUES (898, 'VM_20200319-7-296', 589, 1.00, 25.00, 10.00);
INSERT INTO `vm_item` VALUES (899, 'VM_20200319-7-296', 590, 1.00, 360.00, 10.00);
INSERT INTO `vm_item` VALUES (900, 'VM_20200319-7-297', 591, 20.00, 0.50, 10.00);
INSERT INTO `vm_item` VALUES (901, 'VM_20200319-7-298', 338, 1.00, 420.00, 10.00);
INSERT INTO `vm_item` VALUES (902, 'VM_20200319-7-299', 592, 1.00, 130.00, 10.00);
INSERT INTO `vm_item` VALUES (903, 'VM_20200319-7-299', 72, 3.00, 15.00, 10.00);
INSERT INTO `vm_item` VALUES (904, 'VM_20200319-7-300', 593, 38.00, 22.00, 10.00);
INSERT INTO `vm_item` VALUES (906, 'VM_20200319-7-301', 594, 50.00, 13.00, 10.00);
INSERT INTO `vm_item` VALUES (907, 'VM_20200319-7-301', 595, 50.00, 10.00, 10.00);
INSERT INTO `vm_item` VALUES (909, 'VM_20200319-1-302', 433, 2.00, 640.00, 10.00);
INSERT INTO `vm_item` VALUES (910, 'VM_20200319-4-304', 433, 2.00, 640.00, 10.00);
INSERT INTO `vm_item` VALUES (911, 'VM_20200319-4-305', 8, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (913, 'VM_20200319-4-307', 586, 1.00, 6.00, 10.00);
INSERT INTO `vm_item` VALUES (914, 'VM_20200319-1-308', 586, 1.00, 6.00, 10.00);
INSERT INTO `vm_item` VALUES (915, 'VM_20200319-4-306', 8, 4.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (916, 'VM_20200319-4-309', 588, 26.00, 2.20, 10.00);
INSERT INTO `vm_item` VALUES (917, 'VM_20200227-1-118', 586, 20.00, 6.00, 10.00);
INSERT INTO `vm_item` VALUES (918, 'VM_20200319-1-311', 455, 1.00, 1.00, 10.00);
INSERT INTO `vm_item` VALUES (919, 'VM_20200319-1-310', 455, 1.00, 1.00, 10.00);
INSERT INTO `vm_item` VALUES (920, 'VM_20200319-1-313', 455, 100.00, 1.00, 10.00);
INSERT INTO `vm_item` VALUES (921, 'VM_20200318-4-275', 12, 2.00, 235.00, 10.00);
INSERT INTO `vm_item` VALUES (926, 'VM_20200319-4-312', 380, 1.00, 469.00, 10.00);
INSERT INTO `vm_item` VALUES (928, 'VM_20200319-1-315', 1, 1.00, 135.00, 10.00);
INSERT INTO `vm_item` VALUES (929, 'VM_20200319-1-315', 2, 1.00, 80.00, 10.00);
INSERT INTO `vm_item` VALUES (932, 'VM_20200319-7-303', 20, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (933, 'VM_20200319-7-303', 1, 240.00, 135.00, 10.00);
INSERT INTO `vm_item` VALUES (945, 'VM_20200322-1-318', 21, 60.00, 200.00, 10.00);
INSERT INTO `vm_item` VALUES (946, 'VM_20200318-4-279', 21, 6.00, 200.00, 10.00);
INSERT INTO `vm_item` VALUES (948, 'VM_20200322-1-325', 19, 6.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (949, 'VM_20200322-1-326', 111, 6.00, 114.00, 10.00);
INSERT INTO `vm_item` VALUES (952, 'VM_20200318-4-238', 338, 1.00, 420.00, 10.00);
INSERT INTO `vm_item` VALUES (963, 'VM_20200318-4-222', 54, 2.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (965, 'VM_20200322-1-324', 318, 6.00, 300.00, 10.00);
INSERT INTO `vm_item` VALUES (968, 'VM_20200318-4-228', 318, 2.00, 300.00, 10.00);
INSERT INTO `vm_item` VALUES (969, 'VM_20200322-4-328', 21, 1.00, 200.00, 10.00);
INSERT INTO `vm_item` VALUES (970, 'VM_20200322-1-327', 447, 1.00, 453.00, 10.00);
INSERT INTO `vm_item` VALUES (971, 'VM_20200322-1-327', 426, 40.00, 105.00, 10.00);
INSERT INTO `vm_item` VALUES (972, 'VM_20200322-1-327', 449, 6.00, 30.00, 10.00);
INSERT INTO `vm_item` VALUES (973, 'VM_20200322-1-327', 450, 6.00, 125.00, 10.00);
INSERT INTO `vm_item` VALUES (974, 'VM_20200323-7-330', 451, 2.00, 145.00, 10.00);
INSERT INTO `vm_item` VALUES (975, 'VM_20200323-7-331', 452, 1.00, 320.00, 10.00);
INSERT INTO `vm_item` VALUES (976, 'VM_20200323-7-332', 428, 5.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (977, 'VM_20200323-7-332', 425, 2.00, 60.00, 10.00);
INSERT INTO `vm_item` VALUES (978, 'VM_20200323-7-332', 596, 20.00, 4.50, 10.00);
INSERT INTO `vm_item` VALUES (979, 'VM_20200323-7-332', 157, 2.00, 190.00, 10.00);
INSERT INTO `vm_item` VALUES (980, 'VM_20200323-7-332', 198, 2.00, 144.00, 10.00);
INSERT INTO `vm_item` VALUES (983, 'VM_20200323-7-332', 597, 20.00, 3.50, 10.00);
INSERT INTO `vm_item` VALUES (984, 'VM_20200323-7-332', 599, 20.00, 4.00, 10.00);
INSERT INTO `vm_item` VALUES (985, 'VM_20200323-7-332', 601, 20.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (986, 'VM_20200323-7-332', 602, 20.00, 4.00, 10.00);
INSERT INTO `vm_item` VALUES (987, 'VM_20200323-7-332', 603, 6.00, 8.00, 10.00);
INSERT INTO `vm_item` VALUES (988, 'VM_20200323-7-332', 604, 6.00, 14.00, 10.00);
INSERT INTO `vm_item` VALUES (989, 'VM_20200323-7-332', 600, 20.00, 7.00, 10.00);
INSERT INTO `vm_item` VALUES (990, 'VM_20200323-7-332', 605, 1.00, 360.00, 10.00);
INSERT INTO `vm_item` VALUES (991, 'VM_20200323-7-332', 606, 30.00, 3.00, 10.00);
INSERT INTO `vm_item` VALUES (992, 'VM_20200323-7-332', 598, 15.00, 4.00, 10.00);
INSERT INTO `vm_item` VALUES (993, 'VM_20200324-7-334', 607, 200.00, 2.00, 10.00);
INSERT INTO `vm_item` VALUES (995, 'VM_20200326-7-335', 608, 3.00, 21.90, 10.00);
INSERT INTO `vm_item` VALUES (996, 'VM_20200326-7-336', 611, 1.00, 45.00, 10.00);
INSERT INTO `vm_item` VALUES (997, 'VM_20200326-7-336', 609, 3.00, 25.00, 10.00);
INSERT INTO `vm_item` VALUES (998, 'VM_20200326-7-336', 610, 1.00, 360.00, 10.00);
INSERT INTO `vm_item` VALUES (999, 'VM_20200326-7-337', 615, 20.00, 19.75, 10.00);
INSERT INTO `vm_item` VALUES (1000, 'VM_20200326-7-337', 616, 100.00, 1.49, 10.00);
INSERT INTO `vm_item` VALUES (1001, 'VM_20200326-7-338', 617, 60.00, 325.00, 10.00);
INSERT INTO `vm_item` VALUES (1002, 'VM_20200326-7-338', 619, 5.00, 20.00, 10.00);
INSERT INTO `vm_item` VALUES (1003, 'VM_20200326-7-338', 618, 20.00, 2.00, 10.00);
INSERT INTO `vm_item` VALUES (1005, 'VM_20200326-7-338', 269, 20.00, 7.00, 10.00);
INSERT INTO `vm_item` VALUES (1006, 'VM_20200326-7-338', 620, 2.00, 30.00, 10.00);
INSERT INTO `vm_item` VALUES (1007, 'VM_20200326-7-338', 621, 500.00, 0.70, 10.00);
INSERT INTO `vm_item` VALUES (1008, 'VM_20200326-7-339', 612, 205.00, 136.50, 10.00);
INSERT INTO `vm_item` VALUES (1009, 'VM_20200326-7-339', 613, 205.00, 63.00, 10.00);
INSERT INTO `vm_item` VALUES (1010, 'VM_20200326-7-339', 614, 100.00, 80.40, 10.00);
INSERT INTO `vm_item` VALUES (1011, 'VM_20200322-4-329', 7, 1.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (1013, 'VM_20200322-4-329', 12, 1.00, 235.00, 10.00);
INSERT INTO `vm_item` VALUES (1014, 'VM_20200327-4-341', 433, 2.00, 640.00, 10.00);
INSERT INTO `vm_item` VALUES (1015, 'VM_20200327-4-341', 1, 1.00, 135.00, 10.00);
INSERT INTO `vm_item` VALUES (1016, 'VM_20200327-4-342', 453, 2.00, 35.00, 10.00);
INSERT INTO `vm_item` VALUES (1017, 'VM_20200331-4-343', 454, 1.00, 6.00, 10.00);
INSERT INTO `vm_item` VALUES (1018, 'VM_20200331-4-344', 455, 60.00, 1.00, 10.00);
INSERT INTO `vm_item` VALUES (1020, 'VM_20200402-7-346', 319, 2.00, 110.00, 10.00);
INSERT INTO `vm_item` VALUES (1021, 'VM_20200402-7-347', 621, 500.00, 0.70, 10.00);
INSERT INTO `vm_item` VALUES (1022, 'VM_20200402-7-347', 620, 1.00, 90.00, 10.00);
INSERT INTO `vm_item` VALUES (1023, 'VM_20200402-7-347', 623, 1.00, 150.00, 10.00);
INSERT INTO `vm_item` VALUES (1024, 'VM_20200402-7-348', 624, 50.00, 18.00, 10.00);
INSERT INTO `vm_item` VALUES (1025, 'VM_20200402-7-348', 625, 3.00, 5.00, 10.00);
INSERT INTO `vm_item` VALUES (1026, 'VM_20200402-7-348', 626, 2.00, 10.00, 10.00);
INSERT INTO `vm_item` VALUES (1027, 'VM_20200402-7-349', 627, 1.00, 35.00, 10.00);
INSERT INTO `vm_item` VALUES (1028, 'VM_20200402-7-350', 629, 2.00, 450.00, 10.00);
INSERT INTO `vm_item` VALUES (1029, 'VM_20200402-7-350', 630, 2.00, 50.00, 10.00);
INSERT INTO `vm_item` VALUES (1030, 'VM_20200402-7-351', 628, 4.00, 220.00, 10.00);
INSERT INTO `vm_item` VALUES (1034, 'VM_20200327-7-340', 622, 8.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (1035, 'VM_20200402-7-352', 622, 8.00, 7.00, 10.00);
INSERT INTO `vm_item` VALUES (1036, 'VM_20200403-6-353', 633, 60.00, 13.50, 10.00);
INSERT INTO `vm_item` VALUES (1037, 'VM_20200403-6-353', 634, 1.00, 100.00, 10.00);
INSERT INTO `vm_item` VALUES (1038, 'VM_20200408-7-354', 33, 20.00, 23.00, 10.00);
INSERT INTO `vm_item` VALUES (1040, 'VM_20200408-7-354', 635, 1.00, 100.00, 10.00);
INSERT INTO `vm_item` VALUES (1041, 'VM_20200408-7-354', 636, 1.00, 200.00, 10.00);
INSERT INTO `vm_item` VALUES (1043, 'VM_20200408-7-354', 637, 1.00, 15.00, 10.00);
INSERT INTO `vm_item` VALUES (1044, 'VM_20200408-7-354', 34, 12.00, 18.00, 10.00);
INSERT INTO `vm_item` VALUES (1046, 'VM_20200408-7-354', 638, 2.00, 130.00, 10.00);
INSERT INTO `vm_item` VALUES (1047, 'VM_20200408-7-355', 639, 1.00, 2715.00, 10.00);
INSERT INTO `vm_item` VALUES (1048, 'VM_20200408-7-355', 640, 1.00, 315.00, 10.00);
INSERT INTO `vm_item` VALUES (1049, 'VM_20200408-7-356', 641, 1.00, 26.00, 10.00);
INSERT INTO `vm_item` VALUES (1050, 'VM_20200408-7-356', 642, 1.00, 65.00, 10.00);
INSERT INTO `vm_item` VALUES (1051, 'VM_20200408-7-357', 643, 5.00, 88.00, 10.00);
INSERT INTO `vm_item` VALUES (1052, 'VM_20200408-7-357', 644, 2.00, 163.00, 10.00);
INSERT INTO `vm_item` VALUES (1053, 'VM_20200408-7-358', 645, 1.00, 103.00, 10.00);
INSERT INTO `vm_item` VALUES (1054, 'VM_20200413-7-359', 646, 2.00, 0.00, 10.00);
INSERT INTO `vm_item` VALUES (1055, 'VM_20200413-7-360', 647, 5.00, 78.00, 10.00);
INSERT INTO `vm_item` VALUES (1056, 'VM_20200413-7-360', 648, 3.00, 14.00, 10.00);
INSERT INTO `vm_item` VALUES (1057, 'VM_20200413-7-360', 649, 1.00, 84.00, 10.00);
INSERT INTO `vm_item` VALUES (1058, 'VM_20200413-7-361', 650, 1.00, 360.00, 10.00);

-- ----------------------------
-- Table structure for vm_mcategory
-- ----------------------------
DROP TABLE IF EXISTS `vm_mcategory`;
CREATE TABLE `vm_mcategory`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `mcategory_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分类状态',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '父ID',
  `sort` tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `discount` float(4, 2) NOT NULL DEFAULT 10.00 COMMENT '享受折扣',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_mcategory
-- ----------------------------
INSERT INTO `vm_mcategory` VALUES (1, '管理层', 1, 0, 1, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (2, '总裁办', 1, 0, 2, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (3, '财务部', 1, 0, 3, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (4, '人事部', 1, 0, 4, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (5, '工程部', 1, 0, 4, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (6, '行政部', 1, 0, 5, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (7, '物业部', 1, 0, 6, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (8, '法务部', 1, 0, 7, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (9, '采购部', 1, 0, 8, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (10, '招商部', 1, 0, 9, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (11, '市场部', 1, 0, 10, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (12, '科实项目', 1, 0, 11, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (13, '志远项目', 1, 0, 12, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (14, '航发项目', 1, 0, 13, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (15, '创新项目', 1, 0, 14, '', 10.00);
INSERT INTO `vm_mcategory` VALUES (16, '京仪项目', 1, 0, 15, '', 10.00);

-- ----------------------------
-- Table structure for vm_member
-- ----------------------------
DROP TABLE IF EXISTS `vm_member`;
CREATE TABLE `vm_member`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `member_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户代码',
  `member_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名称',
  `member_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆用户',
  `member_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆密码',
  `member_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `member_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `member_sname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户简称',
  `member_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `member_category` smallint(2) NOT NULL COMMENT '客户分类',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `member_site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户网址',
  `member_regtime` int(11) NOT NULL COMMENT '注册时间',
  `member_status` smallint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `member_handover` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否交接',
  `member_shop` int(4) NOT NULL DEFAULT 0 COMMENT '所属店铺',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客户介绍',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `member_code`(`member_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_member
-- ----------------------------
INSERT INTO `vm_member` VALUES (1, 'NO.0000001', '侯奎', NULL, NULL, '', '1', 'MR-HK', '', 1, '北京', '市辖区', '海淀区', '', 1582364996, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (2, 'NO.0000002', '李强', NULL, NULL, '', '1', 'MR-LQ', '1', 1, '北京', '市辖区', '海淀区', '1', 1582364997, 1, 0, 1, '1');
INSERT INTO `vm_member` VALUES (3, 'NO.0000003', '陈镇', NULL, NULL, '', '', 'MR-CZ', '', 1, '北京', '市辖区', '海淀区', '', 1582364998, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (4, 'NO.0000004', '张亚飞', NULL, NULL, '', '', 'MR-ZYF', '', 1, '北京', '市辖区', '海淀区', '', 1582364999, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (5, 'NO.0000005', '何龙香', NULL, NULL, '', '', 'MR-HLX', '', 2, '北京', '市辖区', '海淀区', '', 1582365000, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (6, 'NO.0000006', '詹致远', NULL, NULL, '', '', 'MR-ZZY', '', 4, '北京', '市辖区', '海淀区', '', 1582365001, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (7, 'NO.0000007', '张平凡', 'bander', '7ddebd51b0708ff7a3102d5c42e10cdc', '1', '1', 'MR-ZPF', '', 6, '北京', '市辖区', '海淀区', '', 1582365002, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (8, 'NO.0000008', '李姣恒', NULL, NULL, '', '', 'MR-LHJ', '', 3, '北京', '市辖区', '海淀区', '', 1582365003, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (9, 'NO.0000009', '李国军', NULL, NULL, '', '', 'MR-LGJ', '', 9, '北京', '市辖区', '海淀区', '', 1582365004, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (10, 'NO.0000010', '张晶', NULL, NULL, '', '', 'MR-ZJ', '', 2, '北京', '市辖区', '海淀区', '', 1582365005, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (11, 'NO.0000011', '高会朋', NULL, NULL, '', '', 'MR-GHP', '', 5, '北京', '市辖区', '海淀区', '', 1582365006, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (12, 'NO.0000012', '贺朝峰', NULL, NULL, '', '', 'MR-HCF', '', 5, '北京', '市辖区', '海淀区', '', 1582365007, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (13, 'NO.0000013', '张鸰', NULL, NULL, '', '', 'MR-ZL', '', 5, '北京', '市辖区', '海淀区', '', 1582365008, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (14, 'NO.0000014', '侯锣平', NULL, NULL, '', '', 'MR-HLP', '', 7, '北京', '市辖区', '海淀区', '', 1582365009, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (15, 'NO.0000015', '郑昭华', NULL, NULL, '', '', 'MR-ZZH', '', 9, '北京', '市辖区', '海淀区', '', 1582365010, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (16, 'NO.0000016', '杨宝湘', NULL, NULL, '', '', 'MR-YBX', '', 9, '北京', '市辖区', '海淀区', '', 1582365011, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (17, 'NO.0000017', '王玙婧', NULL, NULL, '', '', 'MR-WYJ', '', 4, '北京', '市辖区', '海淀区', '', 1582365012, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (18, 'NO.0000018', '郭晓京', NULL, NULL, '', '', 'MR-GXJ', '', 8, '北京', '市辖区', '海淀区', '', 1582365013, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (19, 'NO.0000019', '曹淑君', NULL, NULL, '', '', 'MR-CSJ', '', 3, '北京', '市辖区', '海淀区', '', 1582365014, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (20, 'NO.0000020', '吕瑞宁', NULL, NULL, '', '', 'MR-LRN', '', 3, '北京', '市辖区', '海淀区', '', 1582365015, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (21, 'NO.0000021', '石小南', NULL, NULL, '', '', 'MR-SXN', '', 3, '北京', '市辖区', '海淀区', '', 1582365016, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (22, 'NO.0000022', '刁海超', NULL, NULL, '', '', 'MR-DHC', '', 7, '北京', '市辖区', '海淀区', '', 1582365017, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (23, 'NO.0000023', '张艳丽', NULL, NULL, '', '', 'MR-ZYL', '', 7, '北京', '市辖区', '海淀区', '', 1582365018, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (24, 'NO.0000024', '刘晓燕', NULL, NULL, '', '', 'MR-LXY', '', 7, '北京', '市辖区', '海淀区', '', 1582365019, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (25, 'NO.0000025', '黄超波', NULL, NULL, '', '', 'MR-HCB', '', 7, '北京', '市辖区', '海淀区', '', 1582365020, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (26, 'NO.0000026', '王虎', NULL, NULL, '', '', 'MR-WH', '', 7, '北京', '市辖区', '海淀区', '', 1582365021, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (27, 'NO.0000027', '王平', NULL, NULL, '', '', 'MR-WP', '', 7, '北京', '市辖区', '海淀区', '', 1582365022, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (28, 'NO.0000028', '李晓东', NULL, NULL, '', '', 'MR-LXD', '', 7, '北京', '市辖区', '海淀区', '', 1582365023, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (29, 'NO.0000029', '肖小月', NULL, NULL, '', '', 'MR-XXY', '', 7, '北京', '市辖区', '海淀区', '', 1582365024, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (30, 'NO.0000030', '徐富然', NULL, NULL, '', '', 'MR-XFR', '', 7, '北京', '市辖区', '海淀区', '', 1582365025, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (31, 'NO.0000031', '王玉琴', NULL, NULL, '', '', 'MR-WYQ', '', 7, '北京', '市辖区', '海淀区', '', 1582365026, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (32, 'NO.0000032', '张爱梅', NULL, NULL, '', '', 'MR-ZAM', '', 7, '北京', '市辖区', '海淀区', '', 1582365027, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (33, 'NO.0000033', '赵淑荣', NULL, NULL, '', '', 'MR-ZSY', '', 7, '北京', '市辖区', '海淀区', '', 1582365028, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (34, 'NO.0000034', '扬春花', NULL, NULL, '', '', 'MR-YCH', '', 7, '北京', '市辖区', '海淀区', '', 1582365029, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (35, 'NO.0000035', '孙爱景', NULL, NULL, '', '', 'MR-XMJ', '', 7, '北京', '市辖区', '海淀区', '', 1582365030, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (36, 'NO.0000036', '李福明', NULL, NULL, '', '', 'MR-LFM', '', 7, '北京', '市辖区', '海淀区', '', 1582365031, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (37, 'NO.0000037', '谢前', NULL, NULL, '', '', 'MR-XQ', '', 7, '北京', '市辖区', '海淀区', '', 1582365032, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (38, 'NO.0000038', '李庆民', NULL, NULL, '', '', 'MR-LQM', '', 7, '北京', '市辖区', '海淀区', '', 1582365033, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (39, 'NO.0000039', '张琦', NULL, NULL, '', '', 'MR-ZQ', '', 7, '北京', '市辖区', '海淀区', '', 1582365034, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (40, 'NO.0000040', '李中宝', NULL, NULL, '', '', 'MR-LZB', '', 7, '北京', '市辖区', '海淀区', '', 1582365035, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (41, 'NO.0000041', '郑国锋', NULL, NULL, '', '', 'MR-ZGF', '', 7, '北京', '市辖区', '海淀区', '', 1582365036, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (42, 'NO.0000042', '李慧明', NULL, NULL, '', '', 'MR-LHM', '', 7, '北京', '市辖区', '海淀区', '', 1582365037, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (43, 'NO.0000043', '段国伟', NULL, NULL, '', '', 'MR-DGW', '', 7, '北京', '市辖区', '海淀区', '', 1582365038, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (44, 'NO.0000044', '赵永顺', NULL, NULL, '', '', 'MR-ZYS', '', 7, '北京', '市辖区', '海淀区', '', 1582365039, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (45, 'NO.0000045', '段冬升', NULL, NULL, '', '', 'MR-LDS', '', 7, '北京', '市辖区', '海淀区', '', 1582365040, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (46, 'NO.0000046', '赵震宇', NULL, NULL, '', '', 'MR-ZZYU', '', 7, '北京', '市辖区', '海淀区', '', 1582365041, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (47, 'NO.0000047', '刘欢', NULL, NULL, '', '', 'MR-LL', '', 7, '北京', '市辖区', '海淀区', '', 1582365042, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (48, 'NO.0000048', '朱永明', NULL, NULL, '', '', 'MR-ZYM', '', 10, '北京', '市辖区', '海淀区', '', 1582365043, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (49, 'NO.0000049', '高铭博', NULL, NULL, '', '', 'MR-GMB', '', 10, '北京', '市辖区', '海淀区', '', 1582365044, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (50, 'NO.0000050', '侯帅', NULL, NULL, '', '', 'MR-HS', '', 10, '北京', '市辖区', '海淀区', '', 1582365045, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (51, 'NO.0000051', '廖刚', NULL, NULL, '', '', 'MR-LG', '', 10, '北京', '市辖区', '海淀区', '', 1582365046, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (52, 'NO.0000052', '张雷鸣', NULL, NULL, '', '', 'MR-ZLM', '', 10, '北京', '市辖区', '海淀区', '', 1582365047, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (53, 'NO.0000053', '项良', NULL, NULL, '', '', 'MR-XL', '', 10, '北京', '市辖区', '海淀区', '', 1582365048, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (54, 'NO.0000054', '苏泽超', NULL, NULL, '', '', 'MR-SZC', '', 11, '北京', '市辖区', '海淀区', '', 1582365049, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (55, 'NO.0000055', '李庆', NULL, NULL, '', '', 'MR-LQQ', '', 11, '北京', '市辖区', '海淀区', '', 1582365050, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (56, 'NO.0000056', '祁武', NULL, NULL, '', '', 'MR-QW', '', 11, '北京', '市辖区', '海淀区', '', 1582365051, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (57, 'NO.0000057', '李世建', NULL, NULL, '', '', 'MR-LSJ', '', 11, '北京', '市辖区', '海淀区', '', 1582365052, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (58, 'NO.0000058', '袁丽冬', NULL, NULL, '', '', 'MR-YLD', '', 11, '北京', '市辖区', '海淀区', '', 1582365053, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (59, 'NO.0000059', '郑云龙', NULL, NULL, '', '', 'MR-ZZY', '', 12, '北京', '市辖区', '海淀区', '', 1582365054, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (60, 'NO.0000060', '李文勤', NULL, NULL, '', '', 'MR-LWQ', '', 12, '北京', '市辖区', '海淀区', '', 1582365055, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (61, 'NO.0000061', '周振江', NULL, NULL, '', '', 'MR-ZZJ', '', 12, '北京', '市辖区', '海淀区', '', 1582365056, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (62, 'NO.0000062', '陈小江', NULL, NULL, '', '', 'MR-CXJ', '', 12, '北京', '市辖区', '海淀区', '', 1582365057, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (63, 'NO.0000063', '辛庆杰', NULL, NULL, '', '', 'MR-XQJ', '', 12, '北京', '市辖区', '海淀区', '', 1582365058, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (64, 'NO.0000064', '周隽雄', NULL, NULL, '', '', 'MR-ZJX', '', 12, '北京', '市辖区', '海淀区', '', 1582365059, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (65, 'NO.0000065', '孙亚丽', NULL, NULL, '', '', 'MR-SYL', '', 14, '北京', '市辖区', '海淀区', '', 1582365060, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (66, 'NO.0000066', '杜怀良', NULL, NULL, '', '', 'MR-DHL', '', 13, '北京', '市辖区', '海淀区', '', 1582365061, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (67, 'NO.0000067', '范福成', NULL, NULL, '', '', 'MR-FFC', '', 13, '北京', '市辖区', '海淀区', '', 1582365062, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (68, 'NO.0000068', '王英', NULL, NULL, '', '', 'MR-WY', '', 13, '北京', '市辖区', '海淀区', '', 1582365063, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (69, 'NO.0000069', '叶灵', NULL, NULL, '', '', 'MR-YL', '', 13, '北京', '市辖区', '海淀区', '', 1582365064, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (70, 'NO.0000070', '王敬伟', NULL, NULL, '', '', 'MR-WJW', '', 13, '北京', '市辖区', '海淀区', '', 1582365065, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (71, 'NO.0000071', '陈冰', NULL, NULL, '', '', 'MR-CB', '', 15, '北京', '市辖区', '海淀区', '', 1582365066, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (72, 'NO.0000072', '张冬梅', NULL, NULL, '', '', 'MR-ZDM', '', 15, '北京', '市辖区', '海淀区', '', 1582365067, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (73, 'NO.0000073', '邓华', NULL, NULL, '', '', 'MR-DH', '', 16, '北京', '市辖区', '海淀区', '', 1582365068, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (74, 'NO.0000074', '徐黎明', NULL, NULL, '', '', 'MR-XLM', '', 16, '北京', '市辖区', '海淀区', '', 1582365069, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (75, 'NO.0000075', '郭磊', NULL, NULL, '', '', 'MR-GL', '', 16, '北京', '市辖区', '海淀区', '', 1582365070, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (76, 'NO.0000076', '朱要增', NULL, NULL, '', '', 'MR-ZYZ', '', 16, '北京', '市辖区', '海淀区', '', 1582365071, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (77, 'NO.0000077', '唐亮', NULL, NULL, '', '', 'MR-TL', '', 16, '北京', '市辖区', '海淀区', '', 1582365072, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (78, 'NO.0000078', '冯先歌', NULL, NULL, '', '', 'MR-FXG', '', 16, '北京', '市辖区', '海淀区', '', 1582365073, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (79, 'NO.0000079', '黄国周', NULL, NULL, '', '', 'MR-HGZ', '', 16, '北京', '市辖区', '海淀区', '', 1582365074, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (80, 'NO.0000080', '王占峰', NULL, NULL, '', '', 'MR-WZF', '', 16, '北京', '市辖区', '海淀区', '', 1582365075, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (81, 'NO.0000081', '庞彦国', NULL, NULL, '', '', 'MR-PYG', '', 16, '北京', '市辖区', '海淀区', '', 1582365076, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (82, 'NO.0000082', '刘金玲', NULL, NULL, '', '', 'MR-LJL', '', 16, '北京', '市辖区', '海淀区', '', 1582365077, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (83, 'NO.0000083', '周时金', NULL, NULL, '', '', 'MR-ZSJ', '', 16, '北京', '市辖区', '海淀区', '', 1582365078, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (84, 'NO.0000084', '周生才', NULL, NULL, '', '', 'MR-ZCS', '', 16, '北京', '市辖区', '海淀区', '', 1582365079, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (85, 'NO.0000085', '刘阳', NULL, NULL, '', '', 'MR-LY', '', 6, '北京', '市辖区', '海淀区', '', 1582365080, 0, 0, 1, '');
INSERT INTO `vm_member` VALUES (86, 'NO.0000086', '李宪哲', NULL, NULL, '', '', 'MR-LXZ', '', 6, '北京', '市辖区', '海淀区', '', 1582365081, 0, 0, 1, '');
INSERT INTO `vm_member` VALUES (87, 'NO.0000087', '李君豪', NULL, NULL, '', '', 'MR-LJH', '', 6, '北京', '市辖区', '海淀区', '', 1582365082, 0, 0, 1, '');
INSERT INTO `vm_member` VALUES (88, 'NO.0000088', '王卓', NULL, NULL, '', '', 'MR-WZ', '', 6, '北京', '市辖区', '海淀区', '', 1582365083, 0, 0, 1, '');
INSERT INTO `vm_member` VALUES (89, 'NO.0000089', '张少斌', NULL, NULL, '', '', 'MR-ZSB', '', 6, '北京', '市辖区', '海淀区', '', 1582365084, 0, 0, 1, '');
INSERT INTO `vm_member` VALUES (90, 'NO.0000090', '龙玉峰', NULL, NULL, '', '', 'MR-LYF', '', 6, '北京', '市辖区', '海淀区', '', 1582365085, 0, 0, 1, '');
INSERT INTO `vm_member` VALUES (91, 'NO.0000091', '安光正', NULL, NULL, '', '', 'MR-AGA', '', 6, '北京', '市辖区', '海淀区', '', 1582365086, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (92, 'NO.0000092', '隋欢欢', NULL, NULL, '', '', 'MR-SHH', '', 2, '北京', '市辖区', '海淀区', '', 1582365087, 1, 0, 1, '');
INSERT INTO `vm_member` VALUES (93, 'NO.0000093', '客户代购专用', 'wyb', 'f671a53e1b07bab2e0656b5fa44600c5', '1', '1', 'MR-WYB', '1', 7, '北京', '市辖区', '东城区', '1', 1582699504, 0, 0, 1, '本帐户为客户代购资产专用，其它操作另行禁止。');
INSERT INTO `vm_member` VALUES (94, 'MR-PYG', '盘彦国', 'pyg', '7a7030043e0c2ce8e7979e522b8b6a69', '1', '1', '1', '1', 5, '河南', '安阳市', '0', '1', 1587025941, 1, 0, 1, '');

-- ----------------------------
-- Table structure for vm_member_card
-- ----------------------------
DROP TABLE IF EXISTS `vm_member_card`;
CREATE TABLE `vm_member_card`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `member_id` int(4) NOT NULL COMMENT '会员ID',
  `card_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员卡号',
  `card_pwd` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员卡密码',
  `card_money` float(10, 2) NOT NULL COMMENT '充值金额',
  `card_balance` float(10, 2) NOT NULL COMMENT '卡余额',
  `card_give` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '赠送金额',
  `status` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `channel` tinyint(1) NOT NULL COMMENT '收款途径',
  `card_time` int(11) NOT NULL COMMENT '开卡时间',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开卡说明',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_member_card
-- ----------------------------

-- ----------------------------
-- Table structure for vm_order
-- ----------------------------
DROP TABLE IF EXISTS `vm_order`;
CREATE TABLE `vm_order`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `or_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `or_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单类型',
  `or_contact` tinyint(4) NOT NULL DEFAULT 0 COMMENT '往来单位编号',
  `or_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作员',
  `or_house` tinyint(2) NOT NULL DEFAULT 0 COMMENT '仓库',
  `or_house1` tinyint(2) NOT NULL DEFAULT 0 COMMENT '备用仓库ID',
  `or_verify_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核员',
  `or_verify_status` smallint(1) NOT NULL DEFAULT 0 COMMENT '审核状态',
  `or_verify_time` int(11) NULL DEFAULT NULL COMMENT '审核日期',
  `or_delivery_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送货人',
  `or_create_time` int(11) NOT NULL COMMENT '订单日期',
  `or_status` smallint(1) NOT NULL DEFAULT 0 COMMENT '订单状态',
  `or_finish` smallint(1) NOT NULL DEFAULT 0 COMMENT '订单结束标志',
  `or_unique` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一码',
  `or_money` float(8, 2) NULL DEFAULT 0.00 COMMENT '订单金额',
  `or_paied` tinyint(4) NOT NULL DEFAULT 0 COMMENT '付款状态',
  `or_shop` tinyint(2) NOT NULL DEFAULT 0 COMMENT '所属店铺',
  `or_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `or_depart` int(4) NOT NULL COMMENT '审批部门',
  `or_project` int(4) NOT NULL COMMENT '工程项目',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `or_id`(`or_id`) USING BTREE,
  INDEX `or_type`(`or_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 366 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_order
-- ----------------------------
INSERT INTO `vm_order` VALUES (1, 'VM_20200223-1-1', 'sales_return', 0, 'root', 0, 0, NULL, 0, NULL, NULL, 1582471391, 0, 0, NULL, 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (4, 'VM_20200223-1-4', 'sales', 21, 'wanghu', 1, 0, 'root', 1, 1584681253, NULL, 1579017600, 1, 0, '9e19f3f476284ae1729cc6902aa7932e', 33.00, 1, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (13, 'VM_20200223-1-13', 'sales', 71, 'root', 1, 0, 'root', 0, NULL, NULL, 1576684800, 1, 0, 'cb35ff71511b4d944a6d5e792dce59d8', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (14, 'VM_20200223-1-14', 'sales', 54, 'root', 1, 0, 'root', 0, NULL, NULL, 1574870400, 1, 0, 'e0e0d82fad4c1b46b70fd44a139ae461', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (15, 'VM_20200223-1-15', 'sales', 85, 'root', 1, 0, 'root', 0, NULL, NULL, 1577376000, 1, 0, 'c2abdd15ec9c0c79711f75c0f7939a9a', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (16, 'VM_20200223-1-16', 'sales', 85, 'root', 1, 0, 'root', 0, NULL, NULL, 1572537600, 1, 0, 'f304369edd34073d9de5acff1998e1f2', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (17, 'VM_20200223-1-17', 'sales', 85, 'root', 1, 0, 'root', 0, NULL, NULL, 1569254400, 1, 0, '121384c836e3f39c8b4cc0786ee8cca7', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (18, 'VM_20200223-1-18', 'sales', 6, 'root', 1, 0, 'root', 0, NULL, NULL, 1577548800, 1, 0, '879cf9692ffe9f2917aa363c21578397', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (19, 'VM_20200223-1-19', 'sales', 6, 'root', 1, 0, 'root', 0, NULL, NULL, 1569168000, 1, 0, '3ec0f95383285cb3c6c846537bc8af45', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (20, 'VM_20200223-1-20', 'sales', 25, 'root', 1, 0, 'root', 0, NULL, NULL, 1567872000, 1, 0, '0fb8fa4ca69a0813c9f0f4817d684416', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (21, 'VM_20200223-1-21', 'sales', 87, 'root', 1, 0, 'root', 0, NULL, NULL, 1561651200, 1, 0, '39d00cf2c83b642bd4dfe41d2ced15f2', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (22, 'VM_20200223-1-22', 'sales', 22, 'root', 1, 0, 'root', 0, NULL, NULL, 1559145600, 1, 0, '5b56130afb3a0fc17cd66deceda1d39c', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (23, 'VM_20200223-1-23', 'sales', 5, 'root', 1, 0, 'root', 0, NULL, NULL, 1568908800, 1, 0, '53c857042e08c157110f2b23dd171d5f', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (24, 'VM_20200223-1-24', 'sales', 5, 'root', 1, 0, 'root', 0, NULL, NULL, 1558627200, 1, 0, '84a47d18b921b9c35704e2d14422f0ac', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (25, 'VM_20200223-1-25', 'sales', 15, 'root', 1, 0, 'root', 0, NULL, NULL, 1557936000, 1, 0, '48ff63ddee42b00f548b6f934d425821', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (26, 'VM_20200223-1-26', 'sales', 64, 'root', 1, 0, 'root', 0, NULL, NULL, 1557331200, 1, 0, '7fd4ef11b3a4fb8f1328a972d1f28696', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (28, 'VM_20200223-1-28', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1560787200, 1, 0, 'a8b4de130cf90582ba713a587e056dd6', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (29, 'VM_20200223-1-29', 'sales', 74, 'root', 1, 0, 'root', 0, NULL, NULL, 1555862400, 1, 0, 'd9178d745e617dfa38dfbbb23cc9b4ea', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (30, 'VM_20200223-1-30', 'sales', 1, 'root', 1, 0, 'root', 0, NULL, NULL, 1557072000, 1, 0, '2ee1bd54c1c35f66fbfe3e73340580ce', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (31, 'VM_20200223-1-31', 'sales', 13, 'root', 1, 0, 'root', 0, NULL, NULL, 1559145600, 1, 0, 'ba013abd68288cc135f783d3a8984b95', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (32, 'VM_20200223-1-32', 'sales', 13, 'root', 1, 0, 'root', 0, NULL, NULL, 1555603200, 1, 0, 'c0cfdea5ee3329f7a7b55221c1f446e5', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (33, 'VM_20200223-1-33', 'sales', 55, 'root', 1, 0, 'root', 0, NULL, NULL, 1555344000, 1, 0, 'a4b2cebe23349b01f2659dd09dfedf4c', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (34, 'VM_20200223-1-34', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1575302400, 1, 0, '859c8291e7d089b3514e8298debd347d', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (35, 'VM_20200223-1-35', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1574870400, 1, 0, '3c22f2fe2d7d25f516eea17629c6af72', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (36, 'VM_20200223-1-36', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1571760000, 1, 0, '19b3cad04d92bc46020ec15fe93f8e0f', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (37, 'VM_20200223-1-37', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1568131200, 1, 0, '9c298df8c6bd1f44f51764d40da061c4', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (38, 'VM_20200223-1-38', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1562947200, 1, 0, '5d581d0933481716ef982f88c94aff56', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (39, 'VM_20200223-1-39', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1562601600, 1, 0, 'cfa632af48cdc9c77b54650146eda3ab', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (40, 'VM_20200223-1-40', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1562256000, 1, 0, '01d69f213a0403eea3c0e5bd7c585c75', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (41, 'VM_20200223-1-41', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1560355200, 1, 0, '0e7be13aef4f9620e64431fa9df99f3b', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (42, 'VM_20200224-1-42', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1558713600, 1, 0, 'ef0df750a9cbcfd1e0dc1b301367e4f2', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (43, 'VM_20200224-1-43', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1559664000, 1, 0, '5fbf8da4330ebda5b195aa32c4b8877f', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (44, 'VM_20200224-1-44', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1577635200, 1, 0, '42a20add464eaa4430f6fc2d1698fe9b', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (45, 'VM_20200224-1-45', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1570982400, 1, 0, '13d00f7ea44419d6af0d0b06627ad2bc', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (46, 'VM_20200224-1-46', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1569859200, 1, 0, '3e648dd02a67217a185b478edf149f45', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (47, 'VM_20200224-1-47', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1569772800, 1, 0, 'e38e80023cf96e9724310a0777cb07b6', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (48, 'VM_20200224-1-48', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1567699200, 1, 0, 'c2537d6ab749081f19ae86fcf9b26069', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (49, 'VM_20200224-1-49', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1562256000, 1, 0, '93018bd6a319cc2066339a429bccc5f5', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (50, 'VM_20200224-1-50', 'sales', 4, 'root', 1, 0, 'root', 0, NULL, NULL, 1565539200, 1, 0, 'c83ab43ad90a7e529ad013e2db332d96', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (51, 'VM_20200224-1-51', 'sales', 4, 'root', 1, 0, 'root', 0, NULL, NULL, 1559750400, 1, 0, '611a18a038a11275dd1b2f351086c27d', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (52, 'VM_20200224-1-52', 'sales', 4, 'root', 1, 0, 'root', 0, NULL, NULL, 1559577600, 1, 0, '69e39da410fd5bfef6d52ca23d524e3d', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (53, 'VM_20200224-1-53', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1567958400, 1, 0, 'e916db734710e356ce3daf9c354e01c0', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (54, 'VM_20200224-1-54', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1567612800, 1, 0, '7de4912018402e3cc509da5b420338f4', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (55, 'VM_20200224-1-55', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1559059200, 1, 0, 'a79b99ce69f5f87ebd174e554acf70a8', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (56, 'VM_20200224-1-56', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1556380800, 1, 0, '0ecfebe0d327ac68db90bb9d4e55ec20', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (57, 'VM_20200224-1-57', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1577721600, 1, 0, 'f55dbaf240d0f8eea588063ba737ec0e', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (58, 'VM_20200224-1-58', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1577635200, 1, 0, 'd6ff2df30b4682036cab0f10f47ae0cd', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (59, 'VM_20200224-1-59', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1569772800, 1, 0, '44f8094711c35913d3326cf1af313248', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (60, 'VM_20200224-1-60', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1560096000, 1, 0, '68932f3c4de995eccad1c56470f7f220', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (61, 'VM_20200224-1-61', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1559491200, 1, 0, '60de018e733f77c4ca79e6502adb88b7', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (62, 'VM_20200224-1-62', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1558368000, 1, 0, '335388639f75c170119f45db8372170e', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (63, 'VM_20200224-1-63', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1555344000, 1, 0, '504c710ddf93ac2ad1259648175aa3a9', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (64, 'VM_20200224-1-64', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1554998400, 1, 0, 'b60e3d3493f9402cf447a91d43adbc37', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (65, 'VM_20200224-1-65', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1554825600, 1, 0, '26bbc64757e6120ed7e3eb39f5f5ebd1', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (66, 'VM_20200224-1-66', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1556985600, 1, 0, 'ff899f3895fbc4c0c899d01481261bba', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (77, 'VM_20200224-1-77', 'sales', 87, 'root', 1, 0, 'root', 0, NULL, NULL, 1562169600, 1, 0, '1eb300c14b7172e9da193b0118537c0b', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (78, 'VM_20200224-1-78', 'sales', 25, 'root', 1, 0, 'root', 0, NULL, NULL, 1562601600, 1, 0, '377284f9255a37e0f32c02e364cdc280', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (79, 'VM_20200224-1-79', 'sales', 85, 'root', 1, 0, 'root', 0, NULL, NULL, 1569254400, 1, 0, '43366f000b4d0ea06fbff25ee23b9b10', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (80, 'VM_20200224-1-80', 'sales', 85, 'root', 1, 0, 'root', 0, NULL, NULL, 1572537600, 1, 0, '841daadf9c6814923bb129b58cb71b82', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (81, 'VM_20200224-1-81', 'sales', 85, 'root', 1, 0, 'root', 0, NULL, NULL, 1575216000, 1, 0, '2072202cb101c7744f85807933b586d5', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (82, 'VM_20200224-1-82', 'sales', 85, 'root', 1, 0, 'root', 0, NULL, NULL, 1577376000, 1, 0, 'e0df3de97462d8b2f57c63c60907a702', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (83, 'VM_20200224-1-83', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1577721600, 1, 0, '8c7aa85aa2cde259261c9e847501a18f', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (84, 'VM_20200224-1-84', 'sales', 7, 'root', 1, 0, 'root', 0, NULL, NULL, 1576857600, 1, 0, '3f6aef6f644f6dfaab4f99489db5eea0', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (85, 'VM_20200224-1-85', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1570723200, 1, 0, '7fd3ae6b756062715afb03aa9ea84087', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (86, 'VM_20200224-1-86', 'sales', 25, 'root', 1, 0, 'root', 0, NULL, NULL, 1578585600, 1, 0, 'ba6827409d796f7dad53f04730a70152', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (87, 'VM_20200224-1-87', 'sales', 25, 'root', 1, 0, 'root', 0, NULL, NULL, 1578844800, 1, 0, '45780d21bdb663c1ff8761929ea4706d', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (88, 'VM_20200224-1-88', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1560096000, 1, 0, 'e112da5e47b760b023f75a410e18daed', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (90, 'VM_20200225-1-90', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1561392000, 1, 0, '5a0e28780f163cfe756c3084657dabb5', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (91, 'PS_20200225--91', 'pos', 0, 'hk', 0, 0, NULL, 0, NULL, NULL, 1582601878, 0, 0, NULL, 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (92, 'VM_20200225-1-92', 'sales', 9, 'root', 1, 0, 'root', 0, NULL, NULL, 1561392000, 1, 0, '9763a71b9946fe8e91cd7cf7773b0ecd', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (93, 'VM_20200225-1-93', 'sales', 86, 'root', 1, 0, 'root', 0, NULL, NULL, 1560441600, 1, 0, '0da71b6e5b049afcc2b5f24e68b47947', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (94, 'VM_20200225-1-94', 'sales', 6, 'root', 1, 0, 'root', 0, NULL, NULL, 1560441600, 1, 0, '44b20450bc3e20d5e4874e405727d6b5', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (95, 'VM_20200225-1-95', 'sales', 87, 'root', 1, 0, 'root', 0, NULL, NULL, 1561651200, 1, 0, 'f17fdd08a8a298ccf165c85bbbc77c7d', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (96, 'VM_20200225-1-96', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1561651200, 1, 0, 'eceac1d0c5bb3c6abcb411032151e972', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (97, 'VM_20200225-1-97', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1562774400, 1, 0, '78f7e72648b9bb3232f7d3ca34754d89', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (98, 'VM_20200225-1-98', 'sales', 13, 'root', 1, 0, 'root', 0, NULL, NULL, 1565107200, 1, 0, '84afad632f7e89dec2d4b4a63e5b1245', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (99, 'VM_20200225-1-99', 'sales', 6, 'root', 1, 0, 'root', 0, NULL, NULL, 1565539200, 1, 0, '42c5fdf56720c2fb032bac3d2111df9e', 0.00, 1, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (100, 'VM_20200225-1-100', 'sales', 6, 'root', 1, 0, 'root', 0, NULL, NULL, 1563984000, 1, 0, 'c6adaa1568ffcef26242593798070cd2', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (101, 'VM_20200225-1-101', 'sales', 25, 'root', 1, 0, 'root', 0, NULL, NULL, 1564675200, 1, 0, '80e2576adc49f8863dccf8080d0c3aa5', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (102, 'VM_20200225-1-102', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1566403200, 1, 0, 'dca78a8a69beb56cdbfd3b7449c3cc2a', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (103, 'VM_20200225-1-103', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1567008000, 1, 0, '4b698df61cc32116ece4c2acb06abf55', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (104, 'VM_20200225-1-104', 'sales', 71, 'root', 1, 0, 'root', 0, NULL, NULL, 1598976000, 1, 0, '08585d02b08b4017035937fb52287483', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (105, 'VM_20200225-1-105', 'sales', 6, 'root', 1, 0, 'wanghu', 0, 1584585222, NULL, 1567353600, 1, 0, '2822851e121a05c642dd3fa3ecdcf474', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (106, 'VM_20200225-1-106', 'sales', 57, 'root', 1, 0, 'wanghu', 0, 1584585219, NULL, 1567353600, 1, 0, '3884d42270c0225639e7d489ed1ac2ad', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (107, 'VM_20200225-1-107', 'sales', 5, 'root', 1, 0, 'wanghu', 0, 1584585217, NULL, 1568736000, 1, 0, 'c4d97a6a0e4d3bb7904cad534efb2872', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (108, 'VM_20200225-1-108', 'sales', 6, 'root', 1, 0, 'wanghu', 1, 1584585214, NULL, 1568822400, 1, 0, '989e48526df105203d7afb2dec032c9e', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (109, 'VM_20200225-1-109', 'sales', 85, 'root', 1, 0, 'root', 0, NULL, NULL, 1579104000, 1, 0, '07f2474e05eaf27e9bbf2506659beeba', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (110, 'VM_20200225-1-110', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1579104000, 1, 0, 'ab008dfb2a67a9aba88ecc92d61d853d', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (111, 'VM_20200225-1-111', 'sales', 2, 'root', 1, 0, 'root', 0, NULL, NULL, 1579104000, 1, 0, '6b508272350b7f858896048776c2ec51', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (112, 'VM_20200225-1-112', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1579104000, 1, 0, 'ecd62b282f17d659cbba0f53b515f253', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (113, 'VM_20200225-1-113', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1579449600, 1, 0, 'fddc93ba16144b68721924a942477aa5', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (114, 'VM_20200225-1-114', 'sales', 3, 'root', 1, 0, 'root', 0, NULL, NULL, 1579449600, 1, 0, 'a8c7e298f66bd8c609149563fffc7ab4', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (115, 'VM_20200225-1-115', 'sales', 3, 'root', 1, 0, 'root', 1, 1584587822, NULL, 1579449600, 1, 0, 'e4204aabce7040597cca21376922f767', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (118, 'VM_20200227-1-118', 'allot', 0, 'root', 1, 3, 'root', 1, 1584630292, NULL, 1584547200, 1, 0, '6e7af6a3f7eba5f5dcc33d854d4451eb', 120.00, 0, 0, '仓库入错换仓', 0, 0);
INSERT INTO `vm_order` VALUES (120, 'VM_20200228-4-120', 'stocks_take', 0, 'wanghu', 0, 0, NULL, 0, NULL, NULL, 1582880211, 0, 0, NULL, 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (125, 'VM_20200301-3-125', 'procure_return', 0, 'bander', 0, 0, NULL, 0, NULL, NULL, 1583034914, 0, 0, NULL, 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (137, 'VM_20200302-4-137', 'sales', 92, 'wanghu', 1, 0, 'wanghu', 1, 1584584736, NULL, 1579622400, 1, 0, 'e3d797f01a19a05fded8edcd421b332d', 20.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (146, 'VM_20200306-7-146', 'procure', 6, 'ybx', 1, 0, 'root', 1, 1584715768, NULL, 1577894400, 1, 0, 'c8bd276551620f68181568953bc3acf0', 469.00, 0, 0, '', 4, 0);
INSERT INTO `vm_order` VALUES (147, 'VM_20200312-1-147', 'decrease', 0, 'root', 0, 0, NULL, 0, NULL, NULL, 1583973305, 0, 0, NULL, 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (148, 'VM_20200312-7-148', 'procure', 6, 'ybx', 3, 0, 'root', 1, 1584716341, NULL, 1577894400, 1, 0, '488d492825d9a8a0d6315e4921d6bc5e', 267.90, 0, 0, '库房日常领用/工程部', 6, 0);
INSERT INTO `vm_order` VALUES (149, 'VM_20200312-7-149', 'procure', 19, 'root', 1, 0, 'root', 1, 1584716947, NULL, 1580572800, 1, 0, '98592e1ee7d67b24cba7ee498c90ad73', 120.00, 0, 0, '三层总办', 2, 0);
INSERT INTO `vm_order` VALUES (150, 'VM_20200312-7-150', 'procure', 34, 'ybx', 2, 0, 'root', 1, 1584089421, NULL, 1577980800, 1, 0, '7a1013901eb1b96e1da2267a755abb85', 9440.00, 0, 0, '三层总办', 5, 0);
INSERT INTO `vm_order` VALUES (151, 'VM_20200312-7-151', 'procure', 6, 'ybx', 2, 0, 'root', 1, 1584089421, NULL, 1577980800, 1, 0, '660411939722b7d4cd87745857751c09', 198.00, 0, 0, '三层总办', 5, 0);
INSERT INTO `vm_order` VALUES (152, 'VM_20200312-7-152', 'procure', 13, 'ybx', 2, 0, 'root', 1, 1584718251, NULL, 1577980800, 1, 0, '167a64c2be29c571faddce349d1c31d2', 180.00, 0, 0, '一层咖啡厅过道', 5, 0);
INSERT INTO `vm_order` VALUES (153, 'VM_20200312-7-153', 'procure', 27, 'ybx', 3, 0, 'root', 1, 1584718366, NULL, 1577980800, 1, 0, '234508f4f4ca46786b8d8d322fa377ab', 160.00, 0, 0, '物业部消耗备用', 7, 0);
INSERT INTO `vm_order` VALUES (154, 'VM_20200312-7-154', 'procure', 15, 'ybx', 3, 0, 'root', 1, 1584718524, NULL, 1577980800, 1, 0, 'ab90cefb6b2046fbb303ebd80d8522d2', 120.00, 0, 0, '物业部消耗备用', 7, 0);
INSERT INTO `vm_order` VALUES (155, 'VM_20200312-7-155', 'procure', 6, 'ybx', 3, 0, 'root', 1, 1584718821, NULL, 1577980800, 1, 0, '66e3e484461956b892dbd405efb0e393', 97.00, 0, 0, '未知入采购说明', 7, 0);
INSERT INTO `vm_order` VALUES (156, 'VM_20200312-7-156', 'procure', 1, 'ybx', 1, 0, 'root', 1, 1584719034, NULL, 1578067200, 1, 0, 'ecafdd09be2ffffdafb20c00523f9118', 235.00, 0, 0, NULL, 6, 0);
INSERT INTO `vm_order` VALUES (157, 'VM_20200312-7-157', 'procure', 27, 'ybx', 3, 0, 'root', 1, 1584721575, NULL, 1578067200, 1, 0, 'faf7e0e0a8359cbcf00140fb016a9774', 2100.00, 0, 0, '未知申请需求', 7, 0);
INSERT INTO `vm_order` VALUES (158, 'VM_20200312-7-158', 'procure', 15, 'root', 3, 0, 'root', 1, 1584721703, NULL, 1578240000, 1, 0, '12e093b00de58a4a7bc0b3e4c822baa2', 10.00, 0, 0, '物业消耗备用', 7, 0);
INSERT INTO `vm_order` VALUES (159, 'VM_20200312-7-159', 'procure', 6, 'ybx', 3, 0, 'root', 1, 1584721831, NULL, 1578240000, 1, 0, '5c1602743a2dcfc8c74b3b3126501de1', 800.00, 0, 0, '物业部消耗备用', 7, 0);
INSERT INTO `vm_order` VALUES (161, 'VM_20200312-7-160', 'procure', 15, 'ybx', 1, 0, 'root', 1, 1584721969, NULL, 1578240000, 1, 0, '7c92ca485fc105c9c1bc01a18456a89d', 28.00, 0, 0, '总办何龙香提申请', 2, 0);
INSERT INTO `vm_order` VALUES (162, 'VM_20200312-7-162', 'procure', 27, 'ybx', 3, 0, 'root', 1, 1584722149, NULL, 1578240000, 1, 0, '16b5edaaaa8298c8630bf4506fe5c5a6', 315.00, 0, 0, '物业消耗备用', 7, 0);
INSERT INTO `vm_order` VALUES (163, 'VM_20200312-7-163', 'procure', 27, 'ybx', 3, 0, 'root', 1, 1584722456, NULL, 1578240000, 1, 0, '982e6c433aea9fa20569f365aa8c9f56', 1200.00, 0, 0, '物业部消耗备用', 7, 0);
INSERT INTO `vm_order` VALUES (164, 'VM_20200312-7-164', 'procure', 32, 'root', 2, 0, 'root', 1, 1584722657, NULL, 1578326400, 1, 0, 'a2f3402b357e298d01c1a0e765acc9d2', 480.00, 0, 0, '三层总办', 6, 0);
INSERT INTO `vm_order` VALUES (165, 'VM_20200312-7-165', 'procure', 19, 'root', 1, 0, 'root', 1, 1584722825, NULL, 1578326400, 1, 0, '803abc8b4490fb33a4e84419a7b112a9', 180.00, 0, 0, '物业财务', 3, 0);
INSERT INTO `vm_order` VALUES (166, 'VM_20200312-7-166', 'procure', 13, 'ybx', 3, 0, 'root', 1, 1584723015, NULL, 1578326400, 1, 0, '180092852c56ddfda9b127d28ddd79bf', 350.00, 0, 0, '用于志远大厦', 13, 0);
INSERT INTO `vm_order` VALUES (167, 'VM_20200312-7-167', 'procure', 12, 'root', 1, 0, 'root', 1, 1584794635, NULL, 1584720000, 1, 0, '930660866d68af74cdc6c5fdaf9fc089', 136.00, 0, 0, '市场部\"培优入场\"', 6, 0);
INSERT INTO `vm_order` VALUES (168, 'VM_20200312-7-168', 'procure', 23, 'ybx', 1, 0, 'root', 1, 1584794889, NULL, 1578499200, 1, 0, '49008eaf4fdbbec3c25788871403ddf4', 600.00, 0, 0, '市场部\"培优入场\"', 2, 0);
INSERT INTO `vm_order` VALUES (169, 'VM_20200312-7-169', 'procure', 23, 'root', 1, 0, 'root', 1, 1584794996, NULL, 1578585600, 1, 0, 'cef1c64637b97f2c08ece23438c61df9', 1800.00, 0, 0, '未注明用处', 2, 0);
INSERT INTO `vm_order` VALUES (170, 'VM_20200312-7-170', 'procure', 27, 'ybx', 2, 0, 'root', 1, 1584795193, NULL, 1584720000, 1, 0, '0c6b67c0bb37fe126bf64f515caa5d3a', 1150.00, 0, 0, '工程专用', 5, 0);
INSERT INTO `vm_order` VALUES (171, 'VM_20200312-7-171', 'procure', 27, 'ybx', 2, 0, 'root', 1, 1584795561, NULL, 1578585600, 1, 0, '287d0175f7de3fab41c7cdcd4e5eefac', 1320.00, 0, 0, '大厅楼梯间', 5, 0);
INSERT INTO `vm_order` VALUES (172, 'VM_20200312-7-172', 'procure', 9, 'ybx', 2, 0, 'root', 1, 1584795794, NULL, 1578585600, 1, 0, '13be5a51cff316957b4ac1ff34c5367a', 16.00, 0, 0, '大厅楼梯间', 5, 0);
INSERT INTO `vm_order` VALUES (173, 'VM_20200312-7-173', 'procure', 11, 'root', 2, 0, 'root', 1, 1584796036, NULL, 1578844800, 1, 0, 'dda55302bc4c27ef091ba7eee3b0892e', 17.00, 0, 0, '项目：三层总办工程', 5, 0);
INSERT INTO `vm_order` VALUES (174, 'VM_20200312-7-174', 'procure', 3, 'root', 3, 0, 'root', 1, 1584796310, NULL, 1578931200, 1, 0, '7fd25cf3f31a1ca9ad63cec138484a0b', 70.00, 0, 0, '项目：志远大厦维修', 13, 0);
INSERT INTO `vm_order` VALUES (175, 'VM_20200312-7-175', 'procure', 15, 'ybx', 3, 0, 'root', 1, 1584796465, NULL, 1578931200, 1, 0, '69c1b9aa32969b467ca18687e1acd3fd', 200.00, 0, 0, '备用：物业部消耗', 7, 0);
INSERT INTO `vm_order` VALUES (176, 'VM_20200312-7-176', 'procure', 3, 'ybx', 3, 0, 'root', 1, 1584796705, NULL, 1578931200, 1, 0, '021858038236b6b137521f8da55f80b2', 70.00, 0, 0, '备用：物业部消耗品', 7, 0);
INSERT INTO `vm_order` VALUES (177, 'VM_20200312-7-177', 'procure', 15, 'ybx', 3, 0, 'root', 1, 1584796819, NULL, 1578931200, 1, 0, '1d9ad4d881be98ca963287cd8aabe80f', 21.00, 0, 0, '备用：物业部消耗品', 7, 0);
INSERT INTO `vm_order` VALUES (178, 'VM_20200312-7-178', 'procure', 15, 'ybx', 1, 0, 'root', 1, 1584796981, NULL, 1579017600, 1, 0, '2fda7dcb72fa14822ff6e448768f3fe1', 50.00, 0, 0, '总经办办公用品', 2, 0);
INSERT INTO `vm_order` VALUES (179, 'VM_20200312-7-179', 'procure', 14, 'dhc', 3, 0, 'root', 1, 1584797392, NULL, 1579017600, 1, 0, 'feb9e9736e6174b6f004dddd2f25fec1', 17070.00, 0, 0, '备用：物业消耗品', 7, 0);
INSERT INTO `vm_order` VALUES (180, 'VM_20200312-7-180', 'procure', 22, 'ybx', 3, 0, 'root', 1, 1584798191, NULL, 1579363200, 1, 0, '00a67fcb3e7822aa15ec7fa59c44861f', 990.00, 0, 0, '备用：物业部', 7, 0);
INSERT INTO `vm_order` VALUES (181, 'VM_20200312-7-181', 'procure', 9, 'ybx', 1, 0, 'root', 1, 1584798777, NULL, 1579363200, 1, 0, 'fc0078908970f36547738dedfd92466f', 2560.00, 0, 0, '物业总办', 2, 0);
INSERT INTO `vm_order` VALUES (182, 'VM_20200312-7-182', 'procure', 15, 'ybx', 3, 0, 'root', 1, 1584798781, NULL, 1579363200, 1, 0, 'ee5d9727d6623657d78f5956d4a09ac8', 480.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (183, 'VM_20200312-7-183', 'procure', 11, 'ybx', 3, 0, 'root', 1, 1584799299, NULL, 1579363200, 1, 0, '249b775533188ff79539d5dceb95e0f3', 320.00, 0, 0, '备用：物业消耗品', 7, 0);
INSERT INTO `vm_order` VALUES (185, 'VM_20200312-7-185', 'procure', 12, 'ybx', 3, 0, 'root', 1, 1584799529, NULL, 1583683200, 1, 0, '26dcab5854355e054bd11aa9307a516c', 287.00, 0, 0, '备用：物业消耗品', 7, 0);
INSERT INTO `vm_order` VALUES (186, 'VM_20200313-7-186', 'procure', 9, 'ybx', 3, 0, 'root', 1, 1584799723, NULL, 1584028800, 1, 0, 'bbd20b0c7d5b4b61010c089fb723872c', 120.00, 0, 0, '备用：物业消耗品', 7, 0);
INSERT INTO `vm_order` VALUES (187, 'VM_20200313-4-187', 'sales', 40, 'wanghu', 1, 0, 'wanghu', 0, 1584524321, NULL, 1580832000, 1, 0, '2ab4f61ad302189f9d4ff8888b3373dc', 10.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (188, 'VM_20200313-4-188', 'sales', 74, 'wanghu', 1, 0, 'wanghu', 0, 1584524338, NULL, 1580918400, 1, 0, 'dd6646db9fa9be480a31389801b80b39', 4.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (189, 'VM_20200313-4-189', 'sales', 71, 'wanghu', 1, 0, 'wanghu', 0, 1584524348, NULL, 1581004800, 1, 0, '1c5c78108ab4e506bce72ac6bdafa726', 3.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (190, 'VM_20200313-4-190', 'sales', 64, 'wanghu', 1, 0, 'wanghu', 0, 1584524360, NULL, 1581091200, 1, 0, '2d315649054b60c64e3486425b4770e2', 15.50, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (192, 'VM_20200313-4-192', 'sales', 81, 'wanghu', 1, 0, 'wanghu', 0, 1584524381, NULL, 1581177600, 1, 0, '59fe92648cfcb336c1caee3f1d68d5bd', 20.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (193, 'VM_20200313-4-193', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 0, 1584524391, NULL, 1581264000, 1, 0, '6578ee6d588cda5a3445a85aa4bdb86f', 4.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (195, 'VM_20200313-4-195', 'sales', 81, 'wanghu', 1, 0, 'wanghu', 0, 1584524408, NULL, 1581350400, 1, 0, 'da79ab524b5aed56a996fc2353feac89', 66.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (196, 'VM_20200313-4-196', 'sales', 17, 'wanghu', 3, 0, 'wanghu', 0, 1584524418, NULL, 1579449600, 1, 0, '0d34e4110735da5080a2da384d0ed252', 6.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (200, 'VM_20200318-4-200', 'sales', 71, 'wanghu', 1, 0, 'wanghu', 0, 1584524427, NULL, 1581436800, 1, 0, '1a6fd3a3b7b310fceb57957ba7eb4949', 15.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (201, 'VM_20200318-4-201', 'sales', 40, 'wanghu', 1, 0, 'wanghu', 0, 1584524442, NULL, 1581609600, 1, 0, '105423d3d72db608ab3ed3987dc4731c', 10.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (202, 'VM_20200318-4-202', 'sales', 23, 'wanghu', 1, 0, 'wanghu', 0, 1584524451, NULL, 1583769600, 1, 0, '91d3e7d86baa5411fb7a52c12ed5c91e', 3.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (203, 'VM_20200318-4-203', 'sales', 81, 'wanghu', 1, 0, 'wanghu', 0, 1584524481, NULL, 1584460800, 1, 0, '9a83703c4e37de2e21e5b4fad3c014e3', 10.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (204, 'VM_20200318-4-204', 'sales', 40, 'wanghu', 1, 0, 'wanghu', 0, 1584524495, NULL, 1583942400, 1, 0, 'd1a56395c67d49d69cefebe04c35067b', 90.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (205, 'VM_20200318-4-205', 'sales', 31, 'wanghu', 1, 0, 'wanghu', 0, 1584524540, NULL, 1579276800, 1, 0, 'e8d96a4fb8f9ddbe507ac77ecbc16f6a', 20.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (206, 'VM_20200318-4-206', 'sales', 31, 'wanghu', 1, 0, 'wanghu', 0, 1584524577, NULL, 1581782400, 1, 0, 'c71f2c8003bed56728b1f3855200d248', 20.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (207, 'VM_20200318-4-207', 'sales', 31, 'wanghu', 1, 0, 'wanghu', 0, 1584524582, NULL, 1584028800, 1, 0, '324eada2fcc9644c20c7bd6124d2e780', 20.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (208, 'VM_20200318-4-208', 'sales', 81, 'wanghu', 1, 0, 'wanghu', 0, 1584524593, NULL, 1584288000, 1, 0, 'c7cf921bd0ad6bac690b1e581bb3dd4c', 25.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (209, 'VM_20200318-4-209', 'sales', 81, 'wanghu', 1, 0, 'wanghu', 0, 1584524602, NULL, 1584374400, 1, 0, '0eb3b98269fbad4cf703d2492910e3d0', 20.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (210, 'VM_20200318-4-210', 'sales', 5, 'wanghu', 1, 0, 'wanghu', 0, 1584582066, NULL, 1584288000, 1, 0, 'bc72e7947ec9f27fd3321777684bf7a0', 124.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (211, 'VM_20200318-4-211', 'sales', 75, 'wanghu', 1, 0, 'wanghu', 0, 1584582063, NULL, 1584460800, 1, 0, 'a7599a13fbdfef749dac961019308438', 35.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (212, 'VM_20200318-4-212', 'sales', 40, 'wanghu', 1, 0, 'wanghu', 0, 1584582061, NULL, 1579795200, 1, 0, '5c744434bb79e77a04229314a43dce4f', 20.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (213, 'VM_20200318-4-213', 'sales', 4, 'wanghu', 1, 0, 'wanghu', 0, 1584582059, NULL, 1584460800, 1, 0, '75686c82cc25c8c044b4b8d399e2ba12', 3.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (214, 'VM_20200318-4-214', 'sales', 81, 'wanghu', 3, 0, 'wanghu', 0, 1584582057, NULL, 1584460800, 1, 0, '2e3357bfdd6c1755edb0496d0a970844', 5.50, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (215, 'VM_20200318-4-215', 'sales', 17, 'wanghu', 1, 0, 'wanghu', 1, 1584879981, NULL, 1577894400, 1, 0, 'e520d9bd986336694002798687f84c7e', 120.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (216, 'VM_20200318-4-216', 'sales', 26, 'wanghu', 3, 0, 'wanghu', 1, 1584879976, NULL, 1577894400, 1, 0, '1522d96b4c46ecc542458bbf6f77c797', 177.90, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (217, 'VM_20200318-4-217', 'sales', 41, 'wanghu', 3, 0, 'wanghu', 1, 1584879970, NULL, 1577980800, 1, 0, '8cf99148a033c07be48e04c46f52a268', 32.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (218, 'VM_20200318-4-218', 'sales', 26, 'wanghu', 3, 0, 'wanghu', 1, 1584879888, NULL, 1577980800, 1, 0, 'e8df5f2e4766114c4045fc3520e1f4ba', 120.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (219, 'VM_20200318-4-219', 'sales', 5, 'wanghu', 3, 0, 'wanghu', 1, 1584879773, NULL, 1577980800, 1, 0, '7e20962acefd81ee94d44e696d7bbab7', 9.70, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (220, 'VM_20200318-4-220', 'sales', 7, 'wanghu', 1, 0, 'wanghu', 1, 1584879756, NULL, 1578067200, 1, 0, '1a9cefb07b531f79cfb182e1d904a284', 235.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (221, 'VM_20200318-4-221', 'sales', 41, 'wanghu', 3, 0, 'root', 1, 1584631985, NULL, 1578067200, 1, 0, 'ad12da14f7ee9ad190a11768fb5435c6', 2100.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (222, 'VM_20200318-4-222', 'sales', 7, 'wanghu', 3, 0, 'wanghu', 1, 1584879762, NULL, 1578240000, 1, 0, '8d8bd780dfc79d463ebc4a43e0a00a6a', 10.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (223, 'VM_20200318-4-223', 'sales', 41, 'wanghu', 3, 0, 'wanghu', 1, 1584878954, NULL, 1578240000, 1, 0, '4f4ed57f46fa57e8312d0184344cf827', 1350.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (224, 'VM_20200318-4-224', 'sales', 91, 'wanghu', 3, 0, 'wanghu', 1, 1584878595, NULL, 1578240000, 1, 0, '1c33fc6544b7c4ee0954059fdbf2a483', 1530.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (225, 'VM_20200318-4-225', 'sales', 5, 'wanghu', 1, 0, 'wanghu', 1, 1584878588, NULL, 1578240000, 1, 0, '897c5c3b784d8fd2e0d2b68a4d0970be', 28.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (226, 'VM_20200318-4-226', 'sales', 71, 'wanghu', 3, 0, 'wanghu', 1, 1584878396, NULL, 1578326400, 1, 0, '1cbe835638a3a6104ec225547fa27efc', 350.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (227, 'VM_20200318-4-227', 'sales', 20, 'wanghu', 1, 0, 'wanghu', 1, 1584878437, NULL, 1578326400, 1, 0, '36db0d97a2c254f41bac6df170b3d43e', 180.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (228, 'VM_20200318-4-228', 'sales', 91, 'wanghu', 1, 0, 'wanghu', 1, 1584881830, NULL, 1578240000, 1, 0, 'd1b1b884357cd9bf8482058e9e1d0c9a', 600.00, 0, 0, '培优', 0, 0);
INSERT INTO `vm_order` VALUES (229, 'VM_20200318-4-229', 'sales', 26, 'wanghu', 1, 0, 'wanghu', 1, 1584878249, NULL, 1578499200, 1, 0, 'a68e248ac8737b9188f1266954ab79bb', 136.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (230, 'VM_20200318-4-230', 'sales', 23, 'wanghu', 3, 0, 'wanghu', 1, 1584878213, NULL, 1578844800, 1, 0, '74889aa86abf0a7eb4fc25f07ddd3373', 213.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (231, 'VM_20200318-4-231', 'sales', 41, 'wanghu', 3, 0, 'wanghu', 1, 1584878210, NULL, 1578931200, 1, 0, '778557c65bc42ead1a365305ebba59a8', 8.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (232, 'VM_20200318-4-232', 'sales', 92, 'wanghu', 1, 0, 'root', 1, 1584631835, NULL, 1579017600, 1, 0, '91668526db87418e471c43453458cff5', 25.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (233, 'VM_20200318-4-233', 'sales', 41, 'wanghu', 3, 0, 'wanghu', 1, 1584878143, NULL, 1579104000, 1, 0, '2fd663eb4fbc4e28473e13cb5cad99ea', 990.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (234, 'VM_20200318-4-234', 'sales', 23, 'wanghu', 3, 0, 'wanghu', 1, 1584878024, NULL, 1579363200, 1, 0, '40329faf6e353fbf91695563fec8afee', 480.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (235, 'VM_20200318-4-235', 'sales', 91, 'wanghu', 1, 0, 'wanghu', 0, 1584581856, NULL, 1580832000, 1, 0, '24674733cc629021a2f1e8c2f8b612ec', 453.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (236, 'VM_20200318-4-236', 'sales', 31, 'wanghu', 3, 0, 'wanghu', 1, 1584877947, NULL, 1580918400, 1, 0, '1340d0de7f20fdb3a9e88ac1e0d24794', 228.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (237, 'VM_20200318-4-237', 'sales', 26, 'wanghu', 3, 0, 'wanghu', 1, 1584877566, NULL, 1584288000, 1, 0, 'e39e7ae33c6c240fa89e5e3878e5db75', 22.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (238, 'VM_20200318-4-238', 'sales', 23, 'wanghu', 3, 0, 'wanghu', 1, 1584877554, NULL, 1584374400, 1, 0, '4647a9308f2452c65cf965e93b2b607a', 420.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (239, 'VM_20200318-4-239', 'sales', 31, 'wanghu', 1, 0, 'wanghu', 0, 1584581836, NULL, 1578240000, 1, 0, '729c7c29db012baecbcd1e6d1dd6e4f3', 525.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (240, 'VM_20200318-4-240', 'sales', 31, 'wanghu', 1, 0, 'wanghu', 0, 1584581772, NULL, 1579017600, 1, 0, '2c2420c76c311d2003fbd694e873cbb7', 930.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (241, 'VM_20200318-4-241', 'sales', 31, 'wanghu', 1, 0, 'wanghu', 0, 1584581765, NULL, 1580659200, 1, 0, '8c92bdada5cb38db79fb0719677cc914', 431.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (242, 'VM_20200318-4-242', 'sales', 31, 'wanghu', 1, 0, 'root', 1, 1584676465, NULL, 1581523200, 1, 0, '0b25c2c67bcc714e6b9d3b64bba01ee5', 324.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (243, 'VM_20200318-4-243', 'sales', 31, 'wanghu', 3, 0, 'root', 1, 1584676322, NULL, 1582473600, 1, 0, '27063f2cfd45389398783e0748cfdb2d', 45.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (244, 'VM_20200318-4-244', 'sales', 31, 'wanghu', 3, 0, 'wanghu', 0, 1584876585, NULL, 1583510400, 1, 0, 'e6ce7ef60b40101b2dd3438b2e2f26ee', 759.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (245, 'VM_20200318-4-245', 'sales', 2, 'wanghu', 1, 0, 'wanghu', 0, 1584581744, NULL, 1554307200, 1, 0, 'e4a7bb5f9c1ab19b8a4dccef76aec79c', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (246, 'VM_20200318-4-246', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581741, NULL, 1554825600, 1, 0, 'fa6c58b27ad989040b3e8119e1b55fe2', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (247, 'VM_20200318-4-247', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581739, NULL, 1555948800, 1, 0, '35a6bea9cbbfd447358a73ac8b3dd188', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (248, 'VM_20200318-4-248', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581736, NULL, 1556380800, 1, 0, '333c3603ecc7754dcd10ff3f59b9210c', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (249, 'VM_20200318-4-249', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 0, 1584581733, NULL, 1557849600, 1, 0, '703c7834f0607e62a642caa464e5df64', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (250, 'VM_20200318-4-250', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 0, 1584581563, NULL, 1558022400, 1, 0, '29cf0198e4f5d5d5a55790f633b73bd5', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (251, 'VM_20200318-4-251', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 0, 1584581559, NULL, 1558454400, 1, 0, '3617f1acd1ff0df522e1b0aa5894e48d', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (252, 'VM_20200318-4-252', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 0, 1584581556, NULL, 1558540800, 1, 0, 'fc3c504073bf5808000847ba5d2d098a', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (253, 'VM_20200318-4-253', 'sales', 2, 'wanghu', 1, 0, 'wanghu', 0, 1584581552, NULL, 1559232000, 1, 0, '45715450c81839cc55363cd62c931300', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (254, 'VM_20200318-4-254', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581548, NULL, 1559232000, 1, 0, 'c8423fda19c368a7502c90cb36d16e5f', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (255, 'VM_20200318-4-255', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581545, NULL, 1561651200, 1, 0, '76784727d61d5b4849278941b42b81ad', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (256, 'VM_20200318-4-256', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581541, NULL, 1562774400, 1, 0, '2898c135fbc16e2bef83bfcf9f899c19', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (257, 'VM_20200318-4-257', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 0, 1584581538, NULL, 1565193600, 1, 0, '1cac513343f7fe72471c816f2544dc62', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (258, 'VM_20200318-4-258', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581536, NULL, 1566316800, 1, 0, 'fb362011eed042cb021b1e9bb775f74a', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (259, 'VM_20200318-4-259', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581532, NULL, 1566835200, 1, 0, '55b7bdaca182d014ffe97fff538964ae', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (260, 'VM_20200318-4-260', 'sales', 9, 'wanghu', 1, 0, 'root', 1, 1584631750, NULL, 1567526400, 1, 0, '4d218f1832c3a13a4b59d1c1c93451e5', 0.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (261, 'VM_20200318-4-261', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581522, NULL, 1568044800, 1, 0, '177397a9f3fd0b8bb744d1aab21e1fee', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (262, 'VM_20200318-4-262', 'sales', 22, 'wanghu', 1, 0, 'wanghu', 0, 1584581519, NULL, 1568649600, 1, 0, 'a386f1bd66e239196bc87f0ecc78e1d6', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (263, 'VM_20200318-4-263', 'sales', 22, 'wanghu', 1, 0, 'wanghu', 0, 1584581516, NULL, 1568822400, 1, 0, 'c4d0dbe367c8f08817f04360c2d17f64', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (264, 'VM_20200318-4-264', 'sales', 6, 'wanghu', 1, 0, 'wanghu', 0, 1584581513, NULL, 1568822400, 1, 0, 'cffa5a76d9fd8d06894c0c75a0680700', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (265, 'VM_20200318-4-265', 'sales', 73, 'wanghu', 1, 0, 'wanghu', 0, 1584581507, NULL, 1572969600, 1, 0, '7ca33f99d98d412fa1fc9808749c714d', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (266, 'VM_20200318-4-266', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 0, 1584581493, NULL, 1577548800, 1, 0, 'cd82f1932fdb5ef0909d750391993d36', 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (267, 'VM_20200318-4-267', 'sales', 3, 'wanghu', 1, 0, 'root', 0, 1584631766, NULL, 1577980800, 1, 0, 'b128e5d7e6f70dc71dfb1c6504fe9acc', 2760.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (268, 'VM_20200318-4-268', 'sales', 25, 'wanghu', 1, 0, 'root', 0, 1584631782, NULL, 1578585600, 1, 0, 'bf19a54f090f30a0a0d353c7060cd2fe', 458.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (269, 'VM_20200318-4-269', 'sales', 25, 'wanghu', 1, 0, 'wanghu', 1, 1584876025, NULL, 1578844800, 1, 0, '7af2914cc12a1f75411cf37dc3b16ecb', 458.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (270, 'VM_20200318-4-270', 'sales', 57, 'wanghu', 1, 0, 'root', 0, 1584630720, NULL, 1578585600, 1, 0, 'd8ed850267c9d7344026f75e82395835', 138.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (271, 'VM_20200318-4-271', 'sales', 2, 'wanghu', 1, 0, 'wanghu', 1, 1584876022, NULL, 1578499200, 1, 0, '3c91619c3b9723d21d0fb3b1801e4510', 0.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (272, 'VM_20200318-4-272', 'sales', 2, 'wanghu', 1, 0, 'wanghu', 1, 1584875955, NULL, 1578585600, 1, 0, 'a8868c65a367e31c2b766b9ca7877473', 2748.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (273, 'VM_20200318-4-273', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 1, 1584875697, NULL, 1578412800, 1, 0, 'f15eef61cea2fc09e36934d63e765903', 8244.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (274, 'VM_20200318-4-274', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 1, 1584875687, NULL, 1578412800, 1, 0, '695f7c265ecaebe318f3dec3b369023a', 5496.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (275, 'VM_20200318-4-275', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 1, 1584875628, NULL, 1578412800, 1, 0, '1dfa3846d8ae9b83f3179e64dde62be2', 21080.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (276, 'VM_20200318-4-276', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 1, 1584875624, NULL, 1579017600, 1, 0, '44dc236b3f5d1abf1da174ef9da01aee', 2748.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (277, 'VM_20200318-4-277', 'sales', 85, 'wanghu', 1, 0, 'wanghu', 1, 1584875559, NULL, 1579104000, 1, 0, '7f083d8b0ed52e35658812e4b76c59e6', 5520.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (278, 'VM_20200318-4-278', 'sales', 2, 'wanghu', 1, 0, 'wanghu', 1, 1584875374, NULL, 1579104000, 1, 0, '7ebe6ee02e96792e9d090d7b628d32c2', 276.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (279, 'VM_20200318-4-279', 'sales', 9, 'wanghu', 1, 0, 'wanghu', 1, 1584882897, NULL, 1579104000, 1, 0, 'cb8d2bfaf8fcbbe9c8d865eac4d687b9', 1200.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (280, 'VM_20200318-4-280', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 1, 1584875327, NULL, 1579017600, 1, 0, '0c1637dcedc75296df3c91e13c1cffc1', 1650.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (281, 'VM_20200318-4-281', 'sales', 2, 'wanghu', 1, 0, 'root', 1, 1584630855, NULL, 1579449600, 1, 0, '4e7cc7609b0697348db2dc45ddeb4c58', 2760.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (282, 'VM_20200318-4-282', 'sales', 4, 'wanghu', 1, 0, 'wanghu', 1, 1584874852, NULL, 1579449600, 1, 0, '985f0348b09e0452f08c40ab88cbd59c', 2748.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (283, 'VM_20200318-4-283', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 1, 1584874844, NULL, 1579449600, 1, 0, '14945956602752d69c37cef9b3caec89', 2760.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (285, 'VM_20200318-4-285', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 1, 1584874810, NULL, 1579449600, 1, 0, 'ad0e6a5569ab1205508d9fce8e178865', 4260.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (286, 'VM_20200318-4-286', 'sales', 6, 'wanghu', 1, 0, 'wanghu', 1, 1584874799, NULL, 1582560000, 1, 0, 'eec208c14a14e720d899c90c03f825f0', 2748.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (287, 'VM_20200318-4-287', 'sales', 76, 'wanghu', 1, 0, 'wanghu', 1, 1584865796, NULL, 1582560000, 1, 0, 'c39b90cee13695d18ae7f8629d64da15', 138.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (288, 'VM_20200318-4-288', 'sales', 6, 'wanghu', 1, 0, 'wanghu', 1, 1584864647, NULL, 1583769600, 1, 0, '7356c3aba32782c7d42f80503e79a9b4', 0.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (289, 'VM_20200318-4-289', 'sales', 6, 'wanghu', 1, 0, 'wanghu', 1, 1584864592, NULL, 1584460800, 1, 0, 'c673b860acdef5b795fb09948d378290', 1512.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (291, 'VM_20200319-7-291', 'procure', 6, 'zzh', 1, 0, 'root', 1, 1584801640, NULL, 1583942400, 1, 0, 'd8909be2e5fa5d42b6b3a15d578b706e', 57.20, 0, 0, '三楼总办工位', 6, 0);
INSERT INTO `vm_order` VALUES (292, 'VM_20200319-7-292', 'procure', 36, 'ybx', 2, 0, 'ybx', 0, NULL, NULL, 1584288000, 1, 0, 'd5ba8a3d5661de4234229dbf89a4b13d', 11110.00, 0, 0, NULL, 5, 0);
INSERT INTO `vm_order` VALUES (293, 'VM_20200319-7-293', 'procure', 37, 'ybx', 3, 0, 'ybx', 0, NULL, NULL, 1584288000, 1, 0, 'd4eda35f3940d8d86dfce19d2d424365', 260.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (294, 'VM_20200319-7-294', 'procure', 19, 'ybx', 3, 0, 'root', 1, 1584877492, NULL, 1584288000, 1, 0, '2660efe613d1857e20a67a674e9eed4d', 52.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (295, 'VM_20200319-7-295', 'procure', 19, 'ybx', 1, 0, 'ybx', 0, NULL, NULL, 1584288000, 1, 0, 'c8b81b47bbd374776423d6c57e6e52b5', 480.00, 0, 0, NULL, 4, 0);
INSERT INTO `vm_order` VALUES (296, 'VM_20200319-7-296', 'procure', 17, 'ybx', 3, 0, 'ybx', 0, 1584588507, NULL, 1584374400, 1, 0, '0e83f5bae6c9630996a7d40b9cd86345', 1105.00, 0, 0, '侯罗平采购', 7, 0);
INSERT INTO `vm_order` VALUES (297, 'VM_20200319-7-297', 'procure', 17, 'ybx', 3, 0, 'ybx', 0, NULL, NULL, 1584374400, 1, 0, '688d1052275d9ee0fc01d03b1082a22b', 10.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (298, 'VM_20200319-7-298', 'procure', 11, 'ybx', 3, 0, 'root', 1, 1584877298, NULL, 1584374400, 1, 0, 'b7fefadf5b514f68100c0ba429c3116e', 420.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (299, 'VM_20200319-7-299', 'procure', 11, 'ybx', 3, 0, 'ybx', 0, NULL, NULL, 1584374400, 1, 0, '920b9e848e4816224a24493d98a35897', 175.00, 0, 0, NULL, 6, 0);
INSERT INTO `vm_order` VALUES (300, 'VM_20200319-7-300', 'procure', 27, 'ybx', 2, 0, 'ybx', 0, NULL, NULL, 1584460800, 1, 0, '19a6d6aa23e2aeafaff2179a93186b4c', 836.00, 0, 0, NULL, 5, 0);
INSERT INTO `vm_order` VALUES (301, 'VM_20200319-7-301', 'procure', 13, 'ybx', 2, 0, 'ybx', 0, NULL, NULL, 1584460800, 1, 0, '3c56c415a38b1c33efee7219377843d3', 1150.00, 0, 0, NULL, 5, 0);
INSERT INTO `vm_order` VALUES (302, 'VM_20200319-1-302', 'sales', 86, 'wanghu', 1, 0, 'wanghu', 1, 1584605249, NULL, 1560441600, 1, 0, 'd60a7ea6470e343b3d2cfb1085789972', 1280.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (303, 'VM_20200319-7-303', 'procure', 0, 'wanghu', 1, 0, 'root', 1, 1584866233, NULL, 1577808000, 1, 0, '63c0378af4ecf7ce58389f06161d8c7b', 32400.00, 0, 0, NULL, 2, 0);
INSERT INTO `vm_order` VALUES (304, 'VM_20200319-4-304', 'sales', 86, 'wanghu', 1, 0, 'wanghu', 1, 1584864590, NULL, 1562515200, 1, 0, 'd5fc520f8dab182dce6cb7d9a1b54749', 1280.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (305, 'VM_20200319-4-305', 'sales', 86, 'wanghu', 1, 0, 'wanghu', 1, 1584864588, NULL, 1565539200, 1, 0, '7316d571e4ba8acad75192dc7996b789', 0.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (306, 'VM_20200319-4-306', 'sales', 2, 'wanghu', 1, 0, 'wanghu', 1, 1584864586, NULL, 1584806400, 1, 0, 'e71cb0f67690746f72bb69f8e7963a6a', 0.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (307, 'VM_20200319-4-307', 'sales', 71, 'wanghu', 3, 0, 'root', 1, 1584864141, NULL, 1584806400, 1, 0, '8adac3ce3861997a0b76ffcaaf879d5c', 6.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (308, 'VM_20200319-1-308', 'sales', 2, 'wanghu', 3, 0, 'root', 1, 1584864135, NULL, 1584028800, 1, 0, '61a9511a9fb9863cdb7c2560d2e0b3d3', 6.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (309, 'VM_20200319-4-309', 'sales', 92, 'wanghu', 1, 0, 'root', 1, 1584801790, NULL, 1584720000, 1, 0, 'f710341b35a9a5592a91f46cbdfe5889', 57.20, 0, 0, '三楼总办工位使用', 0, 0);
INSERT INTO `vm_order` VALUES (310, 'VM_20200319-1-310', 'sales', 7, 'wanghu', 3, 0, 'root', 1, 1584801572, NULL, 1584720000, 1, 0, 'c48551ffe47f71f7f1eb62703f2281b1', 1.00, 0, 0, '测试出库，将退回', 0, 0);
INSERT INTO `vm_order` VALUES (312, 'VM_20200319-4-312', 'sales', 6, 'root', 1, 0, 'root', 1, 1584715447, NULL, 1584633600, 1, 1, '22c8552963eafd894c5021c3f9a69056', 469.00, 1, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (318, 'VM_20200322-1-318', 'procure', 0, 'root', 1, 0, 'root', 1, 1584875278, NULL, 1584806400, 1, 0, '66a5b22a8496434d81dd49b642d6ae3a', 12000.00, 0, 0, NULL, 2, 0);
INSERT INTO `vm_order` VALUES (324, 'VM_20200322-1-324', 'sales', 91, 'wanghu', 1, 0, 'wanghu', 1, 1584882103, NULL, 1578240000, 1, 0, 'a529ff10f9f29be7d2e50ab491e66a2e', 1800.00, 0, 0, '网校', 0, 0);
INSERT INTO `vm_order` VALUES (325, 'VM_20200322-1-325', 'procure', 0, 'root', 1, 0, 'root', 1, 1584875847, NULL, 1584806400, 1, 0, 'a87bdae7bb6c151584fb9d2db83c521e', 0.00, 0, 0, '人情往来', 2, 0);
INSERT INTO `vm_order` VALUES (326, 'VM_20200322-1-326', 'procure', 0, 'zzh', 3, 0, 'root', 1, 1584876522, NULL, 1581264000, 1, 0, '14519e3e3e7fba9455e20d492202bdd5', 684.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (327, 'VM_20200322-1-327', 'procure', 0, 'zzh', 3, 0, 'liqiang', 0, NULL, NULL, 1580832000, 1, 0, '33952da80e4ddc8021a28cd8c40db937', 5583.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (328, 'VM_20200322-4-328', 'sales', 7, 'wanghu', 1, 0, 'wanghu', 1, 1584882663, NULL, 1582128000, 1, 0, '9ba9db4fecf0aa44ffe14d1c63b86dd7', 200.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (329, 'VM_20200322-4-329', 'sales', 3, 'wanghu', 1, 0, 'wanghu', 1, 1585635192, NULL, 1584547200, 1, 0, '1d84f5d4ca8355243c8e27f9832dbc11', 235.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (330, 'VM_20200323-7-330', 'procure', 0, 'zzh', 3, 0, 'dhc', 0, NULL, NULL, 1581609600, 1, 0, '3974aa12e2b17151c33f87197aa1d715', 290.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (331, 'VM_20200323-7-331', 'procure', 0, 'zzh', 3, 0, 'dhc', 0, NULL, NULL, 1582732800, 1, 0, 'af40033d53f430b2e042cda6da2e7231', 320.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (332, 'VM_20200323-7-332', 'procure', 0, 'ybx', 3, 0, 'userma', 0, NULL, NULL, 1584979200, 1, 0, '3a1ff3001a197884f6ba4a331b79d304', 2350.00, 0, 0, NULL, 13, 0);
INSERT INTO `vm_order` VALUES (333, 'VM_20200324-5-333', 'allot', 0, 'jams', 0, 0, NULL, 0, NULL, NULL, 1585011737, 0, 0, NULL, 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (334, 'VM_20200324-7-334', 'procure', 0, 'ybx', 3, 0, 'dhc', 0, NULL, NULL, 1584892800, 1, 0, 'decaeaf4dc79d109021a624e70a6ef6b', 400.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (335, 'VM_20200326-7-335', 'procure', 0, 'ybx', 1, 0, 'liqiang', 0, NULL, NULL, 1584892800, 1, 0, '4277039772caecd7206e43a732ceab63', 65.70, 0, 0, NULL, 2, 0);
INSERT INTO `vm_order` VALUES (336, 'VM_20200326-7-336', 'procure', 0, 'ybx', 3, 0, 'dhc', 0, NULL, NULL, 1585065600, 1, 0, 'f11336a7c391f9f1c8a4ec3e228e323f', 480.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (337, 'VM_20200326-7-337', 'procure', 0, 'ybx', 3, 0, 'dhc', 0, NULL, NULL, 1585152000, 1, 0, 'e231b39d8708c61463d72df7c2584a5a', 544.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (338, 'VM_20200326-7-338', 'procure', 0, 'ybx', 3, 0, 'liqiang', 0, NULL, NULL, 1585152000, 1, 0, '05b0798c96a833291b9e7e7fabaf1b33', 20190.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (339, 'VM_20200326-7-339', 'procure', 0, 'ybx', 1, 0, 'ybx', 0, 1585793702, NULL, 1585152000, 1, 0, '8cd56201c839e01804ea094b9ed92f71', 48937.50, 0, 0, '加急采购', 2, 0);
INSERT INTO `vm_order` VALUES (340, 'VM_20200327-7-340', 'procure', 0, 'ybx', 3, 0, 'dhc', 0, NULL, NULL, 1585324800, 1, 0, '39811381d0cc2f6a58fd89f7415ffd69', 56.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (341, 'VM_20200327-4-341', 'sales', 71, 'wanghu', 1, 0, 'wanghu', 1, 1585635187, NULL, 1585152000, 1, 0, '6e1dae26a36b93d11cba0a07868bcffc', 1415.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (342, 'VM_20200327-4-342', 'sales', 25, 'wanghu', 3, 0, 'wanghu', 1, 1585635200, NULL, 1583683200, 1, 0, '781ed6f1d90d284924fca47159225987', 70.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (343, 'VM_20200331-4-343', 'sales', 23, 'wanghu', 3, 0, NULL, 0, NULL, NULL, 1583769600, 1, 0, '80f114cc027c3668f5e25b04b315a522', 6.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (344, 'VM_20200331-4-344', 'sales', 5, 'wanghu', 3, 0, NULL, 0, NULL, NULL, 1583856000, 1, 0, '4f4433b23bf58d551c5fd9ddde9f18cf', 60.00, 0, 0, '', 0, 0);
INSERT INTO `vm_order` VALUES (345, 'VM_20200331-4-345', 'sales', 0, 'wanghu', 0, 0, NULL, 0, NULL, NULL, 1585636905, 0, 0, NULL, 0.00, 0, 0, NULL, 0, 0);
INSERT INTO `vm_order` VALUES (346, 'VM_20200402-7-346', 'procure', 0, 'ybx', 1, 0, 'ybx', 0, 1585796008, NULL, 1585584000, 1, 0, '53f8477b791c41b9caa3801b9db2cd19', 220.00, 0, 0, '徐黎明申请', 13, 0);
INSERT INTO `vm_order` VALUES (347, 'VM_20200402-7-347', 'procure', 0, 'ybx', 3, 0, 'ybx', 0, 1585797819, NULL, 1585584000, 1, 0, 'abebd6376c0b40630fa410076af0e288', 590.00, 0, 0, '网线钳50一把，之前采购的两把进行换货', 7, 0);
INSERT INTO `vm_order` VALUES (348, 'VM_20200402-7-348', 'procure', 0, 'ybx', 1, 0, 'liqiang', 0, NULL, NULL, 1585670400, 1, 0, '74c53e1faf8194f3d51488334d1586a9', 935.00, 0, 0, NULL, 2, 0);
INSERT INTO `vm_order` VALUES (349, 'VM_20200402-7-349', 'procure', 0, 'ybx', 1, 0, 'liqiang', 0, NULL, NULL, 1585670400, 1, 0, '322b07dc3d74260fabc25d0533eb6eff', 35.00, 0, 0, NULL, 11, 0);
INSERT INTO `vm_order` VALUES (350, 'VM_20200402-7-350', 'procure', 0, 'ybx', 1, 0, 'dhc', 0, NULL, NULL, 1585670400, 1, 0, '16074522342a8cf640ddedff3b253175', 1000.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (351, 'VM_20200402-7-351', 'procure', 0, 'ybx', 1, 0, 'liqiang', 0, NULL, NULL, 1585670400, 1, 0, 'f924f6e11bd4728b779e757d5b63f42b', 880.00, 0, 0, NULL, 2, 0);
INSERT INTO `vm_order` VALUES (352, 'VM_20200402-7-352', 'procure', 0, 'ybx', 3, 0, 'dhc', 0, NULL, NULL, 1585324800, 1, 0, '3cfb94d3f0bd89c1acc0bbc56b1a16bd', 56.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (353, 'VM_20200403-6-353', 'procure', 0, 'ybx', 3, 0, 'dhc', 0, NULL, NULL, 1585756800, 1, 0, '60340bfd7e2acc450a64fb76eff5919c', 910.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (354, 'VM_20200408-7-354', 'procure', 0, 'ybx', 3, 0, 'dhc', 0, NULL, NULL, 1585843200, 1, 0, '1550c6be169a5197d1a08b5b79ada3c2', 1251.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (355, 'VM_20200408-7-355', 'procure', 0, 'ybx', 1, 0, 'zyf', 0, NULL, NULL, 1586016000, 1, 0, 'a052ee70f3f57cc9881b6dd65f8d3cea', 3030.00, 0, 0, NULL, 6, 0);
INSERT INTO `vm_order` VALUES (356, 'VM_20200408-7-356', 'procure', 0, 'ybx', 1, 0, 'zyf', 0, NULL, NULL, 1586016000, 1, 0, 'd8498659ed4f51e88b269df7c8abd031', 91.00, 0, 0, NULL, 6, 0);
INSERT INTO `vm_order` VALUES (357, 'VM_20200408-7-357', 'procure', 0, 'ybx', 3, 0, 'dhc', 0, NULL, NULL, 1586275200, 1, 0, '600ec985f2bd73f8510e61d32f5aa77e', 766.00, 0, 0, NULL, 7, 0);
INSERT INTO `vm_order` VALUES (358, 'VM_20200408-7-358', 'procure', 0, 'ybx', 1, 0, 'liqiang', 0, NULL, NULL, 1586361600, 1, 0, 'f155ec793efbc718f5874b17e534237d', 103.00, 0, 0, NULL, 2, 0);
INSERT INTO `vm_order` VALUES (359, 'VM_20200413-7-359', 'procure', 0, 'ybx', 1, 0, 'userma', 0, NULL, NULL, 1586361600, 1, 0, 'cb1a9be1af0e26f6d3f340bc834338cf', 0.00, 0, 0, NULL, 12, 0);
INSERT INTO `vm_order` VALUES (360, 'VM_20200413-7-360', 'procure', 0, 'ybx', 1, 0, 'userma', 0, NULL, NULL, 1586448000, 1, 0, '42853aac36d83f41d325c896bc788096', 516.00, 0, 0, NULL, 3, 0);
INSERT INTO `vm_order` VALUES (361, 'VM_20200413-7-361', 'procure', 0, 'ybx', 1, 0, 'root', 0, 1587545357, NULL, 1586448000, 1, 0, '88d3ce2550bd9d8153c928c36e3bbac5', 360.00, 0, 0, '', 13, 5);
INSERT INTO `vm_order` VALUES (365, 'VM_20200417-12-365', 'procure', 0, 'userma', 0, 0, NULL, 0, NULL, NULL, 1587104100, 0, 0, NULL, 0.00, 0, 0, NULL, 0, 0);

-- ----------------------------
-- Table structure for vm_patrol_record
-- ----------------------------
DROP TABLE IF EXISTS `vm_patrol_record`;
CREATE TABLE `vm_patrol_record`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '巡更人ID',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡更人电话',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '巡更时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡更备注',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡更图片',
  `patrol_id` int(11) NULL DEFAULT NULL COMMENT '巡更计划ID',
  `code_id` int(11) NULL DEFAULT NULL COMMENT '巡更标识ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '巡更记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_patrol_record
-- ----------------------------
INSERT INTO `vm_patrol_record` VALUES (1, 1, '12121212121', 1588942197, '测试', 'http://pt.mbacms.com/api/qr_code/code/unique_id/AGZ-1-D.html', 2, 5);

-- ----------------------------
-- Table structure for vm_plan_code
-- ----------------------------
DROP TABLE IF EXISTS `vm_plan_code`;
CREATE TABLE `vm_plan_code`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `code_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码地址',
  `code_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '二维码库' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_plan_code
-- ----------------------------
INSERT INTO `vm_plan_code` VALUES (2, 'AGZ-1-A', '一层-大堂-正门', 'http://pt.mbacms.com/api/qr_code/code/unique_id/AGZ-1-A.html', '/qrcode/5ea8030e588fd.png');
INSERT INTO `vm_plan_code` VALUES (3, 'AGZ-1-B', '一层-大堂-多点门', 'http://pt.mbacms.com/api/qr_code/code/unique_id/AGZ-1-B.html', '/qrcode/5ea8035fdc292.png');
INSERT INTO `vm_plan_code` VALUES (4, 'AGZ-1-C', '一层-东侧-南1门（上地晏消防步梯）', 'http://pt.mbacms.com/api/qr_code/code/unique_id/AGZ-1-C.html', '/qrcode/5ea8d15ad82aa.png');
INSERT INTO `vm_plan_code` VALUES (5, 'AGZ-1-D', '一层-东侧-中门（上地晏正门步梯）', 'http://pt.mbacms.com/api/qr_code/code/unique_id/AGZ-1-D.html', '/qrcode/5ea8d19407f3c.png');
INSERT INTO `vm_plan_code` VALUES (6, 'AGZ-1-E', '一层-东侧-北1门（东货梯）', 'http://pt.mbacms.com/api/qr_code/code/unique_id/AGZ-1-E.html', '/qrcode/5ea8d1b57fb33.png');
INSERT INTO `vm_plan_code` VALUES (7, 'AGZ-1-F', '一层-东侧-北2门（东货旁梯步梯）', 'http://pt.mbacms.com/api/qr_code/code/unique_id/AGZ-1-F.html', '/qrcode/5ea8d21eecf33.png');
INSERT INTO `vm_plan_code` VALUES (8, 'AGZ-1-J', '一层-北侧-东1门（东北部消防步梯）', 'http://pt.mbacms.com/api/qr_code/code/unique_id/AGZ-1-J.html', '/qrcode/5ea8d2896825a.png');

-- ----------------------------
-- Table structure for vm_plan_patrol
-- ----------------------------
DROP TABLE IF EXISTS `vm_plan_patrol`;
CREATE TABLE `vm_plan_patrol`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patrol_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划名称',
  `patrol_start_time` int(11) NULL DEFAULT NULL COMMENT '开始时间',
  `patrol_end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `patrol_week` int(11) NULL DEFAULT NULL COMMENT '周期：0每天，1每周，2每月',
  `code_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识id',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '巡更计划' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_plan_patrol
-- ----------------------------
INSERT INTO `vm_plan_patrol` VALUES (2, '节假日-巡逻线路', 1588176000, 1588694400, 0, '8,7,6,5', 1588168764, 1588327150);
INSERT INTO `vm_plan_patrol` VALUES (3, '早班（白天）', 1588262400, 1619712000, 1, '8,5', 1588556529, 1588729219);
INSERT INTO `vm_plan_patrol` VALUES (4, '测试', 1588694400, 1590768000, 2, '8,4,2', 1588730844, 1588730869);

-- ----------------------------
-- Table structure for vm_print
-- ----------------------------
DROP TABLE IF EXISTS `vm_print`;
CREATE TABLE `vm_print`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `print_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打印机名称',
  `print_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打印机序列号',
  `print_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打印机Key',
  `print_brand` tinyint(1) NOT NULL COMMENT '打印机品牌',
  `print_shop` smallint(4) NOT NULL COMMENT '店铺ID',
  `print_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '打印状态',
  `print_mould` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打印模板',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `print_sn`(`print_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_print
-- ----------------------------

-- ----------------------------
-- Table structure for vm_project
-- ----------------------------
DROP TABLE IF EXISTS `vm_project`;
CREATE TABLE `vm_project`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `project_director` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目负责人',
  `project_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人电话',
  `project_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目详细地址',
  `status` smallint(1) NOT NULL DEFAULT 1 COMMENT '项目状态',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目概况',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_project
-- ----------------------------
INSERT INTO `vm_project` VALUES (1, 'M6四层-中心机房', '11', '1', '1', 1, 'M6-四层-中心机房：墙顶地、粉刷');
INSERT INTO `vm_project` VALUES (2, 'M6四层-西北侧', '94', '1', '1', 1, 'M6-四层-西北侧');
INSERT INTO `vm_project` VALUES (3, 'M6四层-北侧（东北侧）', '94', '1', '1', 1, 'M6-四层-北侧（东北侧）：');
INSERT INTO `vm_project` VALUES (4, 'M6一层-平台（商铺）', '94', '1', '1', 1, 'M6一层-平台（商铺）改造工程：');
INSERT INTO `vm_project` VALUES (5, 'M6一层-空调机房', '11', '1', '1', 1, 'M6一层-空调机房工程：拆除、改造。');
INSERT INTO `vm_project` VALUES (6, 'M6一层-隔断墙', '11', '1', '1', 0, 'M6一层-隔断墙面工程：');
INSERT INTO `vm_project` VALUES (7, 'M6一层-逃生通道', '11', '1', '1', 0, 'M6一层-逃生通道工程：');

-- ----------------------------
-- Table structure for vm_repair
-- ----------------------------
DROP TABLE IF EXISTS `vm_repair`;
CREATE TABLE `vm_repair`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `repair_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修人电话',
  `repair_type` int(11) NULL DEFAULT NULL COMMENT '报修类型：0宽带电话，1电力系统，2水力系统，3燃气系统',
  `repair_status` int(11) NULL DEFAULT 0 COMMENT '报修状态：0未派单，1处理中，2已完成',
  `repair_create_time` int(11) NULL DEFAULT NULL COMMENT '报修创建时间',
  `repair_update_time` int(11) NULL DEFAULT NULL COMMENT '报修更新时间',
  `repair_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修备注',
  `repair_user_id` int(11) NULL DEFAULT NULL COMMENT '报修人ID',
  `repair_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修ID',
  `repair_audit_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `repair_audit_time` int(11) NULL DEFAULT NULL COMMENT '审批时间',
  `maintainer` int(11) NULL DEFAULT NULL COMMENT '维修人ID',
  `enter_id` int(11) NULL DEFAULT NULL COMMENT '企业单位ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报修' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_repair
-- ----------------------------
INSERT INTO `vm_repair` VALUES (1, '13295158684', 0, 1, 1588338607, 1588339960, '测试', 94, 'BX202005015868', 1, 1588340045, NULL, NULL);
INSERT INTO `vm_repair` VALUES (2, '13295158684', 3, 1, 1588340311, NULL, '测试稿2', 92, 'BX202005016591', 1, 1588942547, 94, NULL);
INSERT INTO `vm_repair` VALUES (3, '13121305009', 1, 1, 1588821959, NULL, '插件无电', 91, 'BX202005074406', 1, 1588822099, NULL, NULL);
INSERT INTO `vm_repair` VALUES (4, '13131305008', 0, 1, 1588822125, 1588908613, '宽带上网太慢', 90, 'BX202005074810', 1, 1588908516, 92, 2);
INSERT INTO `vm_repair` VALUES (5, '13121305007', 0, 1, 1588926361, 1588926412, '测试宽带问题', 88, 'BX202005084715', 1, 1588926420, 91, 2);
INSERT INTO `vm_repair` VALUES (6, '13121305009', 0, 1, 1588926440, NULL, '电话不通', 94, 'BX202005086514', 1, 1588942347, 92, 2);
INSERT INTO `vm_repair` VALUES (7, '13121305003', 2, 1, 1588926714, 1588985074, '水表显不清楚，建议更换。', 84, 'BX202005086001', 1, 1588926831, 79, 2);
INSERT INTO `vm_repair` VALUES (8, '13121305004', 1, 1, 1588927620, 1588927646, '走廊灯不亮', 82, 'BX202005087190', 1, 1588927630, 94, 1);
INSERT INTO `vm_repair` VALUES (9, '13121305007', 1, 1, 1588928489, 1588987083, '压力低小', 81, 'BX202005089576', 1, 1588987095, 78, 4);

-- ----------------------------
-- Table structure for vm_shop
-- ----------------------------
DROP TABLE IF EXISTS `vm_shop`;
CREATE TABLE `vm_shop`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `shop_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店电话',
  `shop_address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店地址',
  `shop_director` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店负责人',
  `status` smallint(1) NOT NULL DEFAULT 1 COMMENT '门店状态',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '门店简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_shop
-- ----------------------------
INSERT INTO `vm_shop` VALUES (1, 'AGZ', '13121305007', '北京', 'AGZ', 1, '');

-- ----------------------------
-- Table structure for vm_stocks
-- ----------------------------
DROP TABLE IF EXISTS `vm_stocks`;
CREATE TABLE `vm_stocks`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) NOT NULL COMMENT '商品ID',
  `numbers` float(10, 2) NOT NULL COMMENT '商品数量',
  `house_id` int(4) NOT NULL COMMENT '仓库ID',
  `contact` int(4) NOT NULL COMMENT '供应商ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_stocks
-- ----------------------------
INSERT INTO `vm_stocks` VALUES (1, 1, 29.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (2, 2, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (3, 3, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (4, 4, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (5, 5, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (6, 6, 11.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (7, 7, 58.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (8, 8, -75.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (9, 9, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (10, 10, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (11, 11, 6761.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (12, 12, 17.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (13, 13, 5.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (14, 14, 58.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (15, 15, 56.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (16, 16, 104.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (17, 17, 2.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (18, 18, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (19, 19, 4.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (20, 20, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (21, 21, 53.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (22, 22, 2.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (23, 23, 3.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (24, 24, 1.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (25, 380, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (26, 382, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (27, 383, 30.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (28, 381, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (29, 384, 1.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (30, 385, 26.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (31, 386, 15.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (32, 387, 12.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (33, 388, 2.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (34, 389, 6.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (35, 390, 10.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (36, 391, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (37, 392, 18.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (38, 393, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (39, 394, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (40, 395, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (41, 54, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (42, 403, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (43, 399, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (44, 400, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (45, 401, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (46, 397, 30.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (47, 398, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (48, 402, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (49, 404, 4.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (50, 405, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (51, 406, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (52, 407, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (53, 318, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (54, 410, 1.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (55, 411, 6.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (56, 412, 2.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (57, 413, 10.00, 2, 0);
INSERT INTO `vm_stocks` VALUES (58, 414, 5.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (59, 415, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (60, 417, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (61, 418, 10.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (62, 416, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (63, 419, 2.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (64, 420, 15.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (65, 421, 30.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (66, 422, 30.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (67, 423, 1.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (68, 424, 30.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (69, 425, 10.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (70, 426, 15.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (71, 427, 5.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (72, 428, 10.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (73, 429, 2.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (74, 430, 1.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (75, 431, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (76, 432, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (77, 433, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (78, 434, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (79, 435, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (80, 436, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (81, 437, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (82, 438, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (83, 452, 1.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (84, 453, 3.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (85, 454, 1.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (86, 455, 99.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (87, 586, 17.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (88, 588, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (89, 111, 2.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (90, 338, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (91, 353, 1.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (92, 133, 0.00, 1, 0);
INSERT INTO `vm_stocks` VALUES (93, 378, 0.00, 3, 0);
INSERT INTO `vm_stocks` VALUES (94, 650, 5.00, 1, 0);

-- ----------------------------
-- Table structure for vm_storehouse
-- ----------------------------
DROP TABLE IF EXISTS `vm_storehouse`;
CREATE TABLE `vm_storehouse`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `house_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库名称',
  `status` smallint(1) NOT NULL DEFAULT 1 COMMENT '仓库状态',
  `shop` int(8) NOT NULL COMMENT '所属店铺',
  `pos` smallint(1) NOT NULL DEFAULT 0 COMMENT '设为POS仓库',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_storehouse
-- ----------------------------
INSERT INTO `vm_storehouse` VALUES (1, '行政仓库', 1, 1, 0, '');
INSERT INTO `vm_storehouse` VALUES (2, '工程仓库', 1, 1, 0, '');
INSERT INTO `vm_storehouse` VALUES (3, '物业仓库', 1, 1, 0, '');
INSERT INTO `vm_storehouse` VALUES (4, '代购仓库', 1, 1, 1, '本仓库为客户代购资产，其他资产禁止入库。');
INSERT INTO `vm_storehouse` VALUES (5, '调试仓库', 1, 1, 0, '软件开发调试仓库');

-- ----------------------------
-- Table structure for vm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `vm_supplier`;
CREATE TABLE `vm_supplier`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `supplier_director` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `supplier_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `supplier_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `status` smallint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_supplier
-- ----------------------------
INSERT INTO `vm_supplier` VALUES (1, '京东商城', '1', '1', '1', 1, '');
INSERT INTO `vm_supplier` VALUES (2, '天猫商城', '1', '1', '1', 1, '');
INSERT INTO `vm_supplier` VALUES (3, '建材市场', '1', '1', '1', 1, '');
INSERT INTO `vm_supplier` VALUES (4, '烟草局', '北京市烟草专卖公', '010-67009899', '北京市朝阳区南新园西路2号', 1, '');
INSERT INTO `vm_supplier` VALUES (5, '侯总自购', '侯总', '1', '1', 1, '本分类为侯总自购分类，其他资产禁止写入。');
INSERT INTO `vm_supplier` VALUES (6, '淘宝网', '1', '1', '1', 1, '');
INSERT INTO `vm_supplier` VALUES (7, '免费回收', '1', '1', '1', 1, '');
INSERT INTO `vm_supplier` VALUES (8, '人情往来', '1', '1', '1', 1, '公司高层-人情往来的资产');
INSERT INTO `vm_supplier` VALUES (9, '超市商店', '1', '1', '1', 1, '');
INSERT INTO `vm_supplier` VALUES (10, '唯君酒业', '张平凡', '13121305007', '贵州省茅台镇中酒投集团', 1, '1');
INSERT INTO `vm_supplier` VALUES (11, '京鹏久恒(五金)', '王', '18612335800', '北京市昌平区昌平路357号京昌回龙观建材城', 1, '');
INSERT INTO `vm_supplier` VALUES (12, '双雄办公', '彭', '18810607688', '北京市昌平区西三旗建材城西路三旗百汇商品城', 1, '');
INSERT INTO `vm_supplier` VALUES (13, '美的照明(灯)', '云', '15010109532', '北京市昌平区回龙观', 1, '');
INSERT INTO `vm_supplier` VALUES (14, '塑料家居(劳保)', '张', '13671339808', '北京市海淀区西三旗百汇商城4楼', 1, '');
INSERT INTO `vm_supplier` VALUES (15, '西三旗商城', '1', '1', '西三旗百汇商场', 1, '');
INSERT INTO `vm_supplier` VALUES (16, '旭雅商贸(工服)', '胡', '13311201173', '北京市海淀区西三旗百汇负一楼旭雅商贸有限公司', 1, '');
INSERT INTO `vm_supplier` VALUES (17, '中关村科贸大厦', '1', '1', '北京市海淀区中关村科技园', 1, '');
INSERT INTO `vm_supplier` VALUES (18, '西三旗保洁用品', '高', '13521971762', '北京市海淀区西三旗百汇负一层', 1, '');
INSERT INTO `vm_supplier` VALUES (19, '办公耗材', '晓', '18801456389', '北京市海淀区西三旗百汇四楼', 1, '');
INSERT INTO `vm_supplier` VALUES (20, '汇国康低价药店', '无', '无', '北京市海淀区上地西路', 1, '');
INSERT INTO `vm_supplier` VALUES (21, '嘉事堂连锁药店', '无', '无', '北京是海淀区小营桥边', 1, '');
INSERT INTO `vm_supplier` VALUES (22, '好美都汽配城', '无', '无', '北京市海淀区小营桥附近', 1, '');
INSERT INTO `vm_supplier` VALUES (23, '金地花卉A区9号', '冯莉', '13552765425', '北京市海淀区金地花卉', 1, '');
INSERT INTO `vm_supplier` VALUES (24, '三楼打印机店', '晓', '18801456389', '北京市海淀区西三旗3楼', 1, '');
INSERT INTO `vm_supplier` VALUES (25, '天鑫顺业', '张', '13520202136', '北京市中关村科贸大厦', 1, '');
INSERT INTO `vm_supplier` VALUES (26, '米兰春天', '余', '15210277838', '北京市海淀区小营市场', 1, '');
INSERT INTO `vm_supplier` VALUES (27, '回龙观建材城', '无', '无', '北京市海淀区回龙观建材城', 1, '');
INSERT INTO `vm_supplier` VALUES (28, '小营建材城', '无', '无', '北京市海淀区小营建材城', 1, '');
INSERT INTO `vm_supplier` VALUES (29, '玉泉营建材城', '无', '无', '无', 1, '北京市海淀区玉泉营建材城');
INSERT INTO `vm_supplier` VALUES (30, '锦绣大地', '无', '无', '无', 1, '北京市海淀区景秀大地');
INSERT INTO `vm_supplier` VALUES (31, '远洋灯具城', '无', '无', '无', 1, '北京市丰台区远洋灯具城');
INSERT INTO `vm_supplier` VALUES (32, '十里河灯具城', '无', '无', '无', 1, '北京市十里河灯具城');
INSERT INTO `vm_supplier` VALUES (33, '水屯建材城', '无', '无', '无', 1, '北京市昌平区水屯建材城');
INSERT INTO `vm_supplier` VALUES (34, '集美家居', '无', '13701093159', '北京市西四环集美家居', 1, '');
INSERT INTO `vm_supplier` VALUES (35, '北京益民阳光医药销售有限公司', '店员', '82818123', '清河镇二街南口清河百货商城西侧一层101号', 1, '');
INSERT INTO `vm_supplier` VALUES (36, '德州鑫金空调设备有限公司', '1', '18753403333', '山东德州', 1, '');
INSERT INTO `vm_supplier` VALUES (37, '北农批发市场', '李', '无', '北京市昌平区北农批发市场', 1, '');
INSERT INTO `vm_supplier` VALUES (38, '二手家具', '王', '13581543750', '北京市昌平区', 1, '');
INSERT INTO `vm_supplier` VALUES (39, '加博尔服装有限公司', '郑龙飞', '15611138259', '河北省石家庄市天山水榭花都', 1, '');
INSERT INTO `vm_supplier` VALUES (40, '安和通国际展览设计有限公司', '杨思慧', '13810277347', '北京市朝阳区', 1, '');
INSERT INTO `vm_supplier` VALUES (41, '海林面板', '樊', '13716003352', '北京市昌平区回龙观国际信息产业基地发展路9号', 1, '');
INSERT INTO `vm_supplier` VALUES (42, '一次性采购', '无', '无', '无', 1, '');
INSERT INTO `vm_supplier` VALUES (43, '恒晟微创科技有限公司', '陈小涛', '13366268606', '北京市海淀区北三环西路43号满庭芳园4楼1302室', 1, '侯罗平推荐');

-- ----------------------------
-- Table structure for vm_system
-- ----------------------------
DROP TABLE IF EXISTS `vm_system`;
CREATE TABLE `vm_system`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置项名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_system
-- ----------------------------
INSERT INTO `vm_system` VALUES (1, 'site_config', 'a:6:{s:9:\"site_name\";s:21:\"AGZ资产管理系统\";s:11:\"login_title\";s:21:\"AGZ资产管理系统\";s:5:\"admin\";s:6:\"Bander\";s:5:\"phone\";s:11:\"13121305007\";s:7:\"address\";s:32:\"北京市海淀区创业路11号\";s:5:\"email\";s:14:\"3532111@qq.com\";}');

-- ----------------------------
-- Table structure for vm_system_attachment
-- ----------------------------
DROP TABLE IF EXISTS `vm_system_attachment`;
CREATE TABLE `vm_system_attachment`  (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件名称',
  `att_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件路径',
  `satt_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件大小',
  `att_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件类型',
  `pid` int(10) NOT NULL COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `time` int(11) NOT NULL COMMENT '上传时间',
  `image_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片上传类型 1本地 2七牛云 3OSS 4COS ',
  `module_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片上传模块类型 1 后台上传 2 用户生成',
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_system_attachment
-- ----------------------------
INSERT INTO `vm_system_attachment` VALUES (172, '5e56937e48a6d.jpg', '/upload/attach/2020/02/26/5e56937e48a6d.jpg', '/upload/attach/2020/02/26/s_5e56937e48a6d.jpg', '195401', 'image/jpeg', 0, 1582732158, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (173, '5e5693b393560.jpg', '/upload/attach/2020/02/26/5e5693b393560.jpg', '/upload/attach/2020/02/26/s_5e5693b393560.jpg', '42490', 'image/jpeg', 1, 1582732211, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (174, '5e65b889e61df.png', '/upload/attach/2020/03/09/5e65b889e61df.png', '/upload/attach/2020/03/09/s_5e65b889e61df.png', '71667', 'image/png', 0, 1583724681, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (175, '5e65ba6927516.png', '/upload/attach/2020/03/09/5e65ba6927516.png', '/upload/attach/2020/03/09/s_5e65ba6927516.png', '100028', 'image/png', 0, 1583725161, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (176, '5e65bb05c4335.png', '/upload/attach/2020/03/09/5e65bb05c4335.png', '/upload/attach/2020/03/09/s_5e65bb05c4335.png', '148181', 'image/png', 0, 1583725317, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (177, '5e65c2ca00e78.png', '/upload/attach/2020/03/09/5e65c2ca00e78.png', '/upload/attach/2020/03/09/s_5e65c2ca00e78.png', '113985', 'image/png', 0, 1583727306, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (178, '5e65d6c27bf4d.png', '/upload/attach/2020/03/09/5e65d6c27bf4d.png', '/upload/attach/2020/03/09/s_5e65d6c27bf4d.png', '108442', 'image/png', 0, 1583732418, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (179, '5e65d9354898e.png', '/upload/attach/2020/03/09/5e65d9354898e.png', '/upload/attach/2020/03/09/s_5e65d9354898e.png', '112928', 'image/png', 0, 1583733045, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (180, '5e65d9d374d86.png', '/upload/attach/2020/03/09/5e65d9d374d86.png', '/upload/attach/2020/03/09/s_5e65d9d374d86.png', '73502', 'image/png', 0, 1583733203, 1, 1);
INSERT INTO `vm_system_attachment` VALUES (181, '5e65db4abec24.png', '/upload/attach/2020/03/09/5e65db4abec24.png', '/upload/attach/2020/03/09/s_5e65db4abec24.png', '72709', 'image/png', 0, 1583733578, 1, 1);

-- ----------------------------
-- Table structure for vm_system_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `vm_system_attachment_category`;
CREATE TABLE `vm_system_attachment_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT 0 COMMENT '父级ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类目录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_system_attachment_category
-- ----------------------------
INSERT INTO `vm_system_attachment_category` VALUES (1, 0, '产品图', '');
INSERT INTO `vm_system_attachment_category` VALUES (2, 0, '分类图片', '');

-- ----------------------------
-- Table structure for vm_system_config
-- ----------------------------
DROP TABLE IF EXISTS `vm_system_config`;
CREATE TABLE `vm_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型(文本框,单选按钮...)',
  `config_tab_id` int(10) UNSIGNED NOT NULL COMMENT '配置分类id',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则 单选框和多选框',
  `upload_type` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '上传文件格式1单图2多图3文件',
  `required` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则',
  `width` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '多行文本框的宽度',
  `high` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '多行文框的高度',
  `value` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置简介',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_system_config
-- ----------------------------
INSERT INTO `vm_system_config` VALUES (1, 'site_name', 'text', 1, '', 0, 'required:true', 100, 0, '\"AGZ资产管理系统\"', '网站名称', '网站名称', 0, 1);
INSERT INTO `vm_system_config` VALUES (2, 'site_url', 'text', 1, '', 0, 'required:true,url:true', 100, 0, '\"https:\\/\\/mis.mbacms.com\"', '网站地址', '网站地址', 0, 1);
INSERT INTO `vm_system_config` VALUES (3, 'site_logo', 'upload', 1, '', 1, '', 0, 0, '\"\"', '后台LOGO', '左上角logo,建议尺寸[170*50]', 0, 1);
INSERT INTO `vm_system_config` VALUES (4, 'site_phone', 'text', 1, '', 0, '', 100, 0, '\"\"', '联系电话', '联系电话', 0, 1);
INSERT INTO `vm_system_config` VALUES (5, 'seo_title', 'text', 1, '', 0, 'required:true', 100, 0, '\"crmeb\\u7535\\u5546\\u7cfb\\u7edf\"', 'SEO标题', 'SEO标题', 0, 1);
INSERT INTO `vm_system_config` VALUES (6, 'site_email', 'text', 1, '', 0, 'email:true', 100, 0, '\"admin@xazbkj.com\"', '联系邮箱', '联系邮箱', 0, 1);
INSERT INTO `vm_system_config` VALUES (7, 'site_qq', 'text', 1, '', 0, 'qq:true', 100, 0, '\"98718401\"', '联系QQ', '联系QQ', 0, 1);
INSERT INTO `vm_system_config` VALUES (8, 'site_close', 'radio', 1, '0=>开启\n1=>PC端关闭\n2=>WAP端关闭(含微信)\n3=>全部关闭', 0, '', 0, 0, '\"0\"', '网站关闭', '网站后台、商家中心不受影响。关闭网站也可访问', 0, 1);
INSERT INTO `vm_system_config` VALUES (9, 'close_system', 'radio', 1, '0=>开启\n1=>关闭', 0, '', 0, 0, '\"0\"', '关闭后台', '关闭后台', 0, 2);
INSERT INTO `vm_system_config` VALUES (10, 'wechat_name', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '公众号名称', '公众号的名称', 0, 1);
INSERT INTO `vm_system_config` VALUES (11, 'wechat_id', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '微信号', '微信号', 0, 1);
INSERT INTO `vm_system_config` VALUES (12, 'wechat_sourceid', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '公众号原始id', '公众号原始id', 0, 1);
INSERT INTO `vm_system_config` VALUES (13, 'wechat_appid', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', 'AppID', 'AppID', 0, 1);
INSERT INTO `vm_system_config` VALUES (14, 'wechat_appsecret', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', 'AppSecret', 'AppSecret', 0, 1);
INSERT INTO `vm_system_config` VALUES (15, 'wechat_token', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '微信验证TOKEN', '微信验证TOKEN', 0, 1);
INSERT INTO `vm_system_config` VALUES (16, 'wechat_encode', 'radio', 2, '0=>明文模式\n1=>兼容模式\n2=>安全模式', 0, '', 0, 0, '\"0\"', '消息加解密方式', '如需使用安全模式请在管理中心修改，仅限服务号和认证订阅号', 0, 1);
INSERT INTO `vm_system_config` VALUES (17, 'wechat_encodingaeskey', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', 'EncodingAESKey', '公众号消息加解密Key,在使用安全模式情况下要填写该值，请先在管理中心修改，然后填写该值，仅限服务号和认证订阅号', 0, 1);
INSERT INTO `vm_system_config` VALUES (18, 'wechat_share_img', 'upload', 3, '', 1, '', 0, 0, '\"\"', '微信分享图片', '若填写此图片地址，则分享网页出去时会分享此图片。可有效防止分享图片变形', 0, 1);
INSERT INTO `vm_system_config` VALUES (19, 'wechat_qrcode', 'upload', 2, '', 1, '', 0, 0, '\"\"', '公众号二维码', '您的公众号二维码', 0, 1);
INSERT INTO `vm_system_config` VALUES (20, 'wechat_type', 'radio', 2, '0=>服务号\n1=>订阅号', 0, '', 0, 0, '\"0\"', '公众号类型', '公众号的类型', 0, 1);
INSERT INTO `vm_system_config` VALUES (21, 'wechat_share_title', 'text', 3, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '微信分享标题', '微信分享标题', 0, 1);
INSERT INTO `vm_system_config` VALUES (22, 'wechat_share_synopsis', 'textarea', 3, '', 0, '', 100, 5, '\"CRMEB\"', '微信分享简介', '微信分享简介', 0, 1);
INSERT INTO `vm_system_config` VALUES (23, 'pay_weixin_appid', 'text', 4, '', 0, '', 100, 0, '\"CRMEB\"', 'Appid', '微信公众号身份的唯一标识。审核通过后，在微信发送的邮件中查看。', 0, 1);
INSERT INTO `vm_system_config` VALUES (24, 'pay_weixin_appsecret', 'text', 4, '', 0, '', 100, 0, '\"CRMEB\"', 'Appsecret', 'JSAPI接口中获取openid，审核后在公众平台开启开发模式后可查看。', 0, 1);
INSERT INTO `vm_system_config` VALUES (25, 'pay_weixin_mchid', 'text', 4, '', 0, '', 100, 0, '\"CRMEB\"', 'Mchid', '受理商ID，身份标识', 0, 1);
INSERT INTO `vm_system_config` VALUES (26, 'pay_weixin_client_cert', 'upload', 4, '', 3, '', 0, 0, '\"\"', '微信支付证书', '微信支付证书，在微信商家平台中可以下载！文件名一般为apiclient_cert.pem', 0, 1);
INSERT INTO `vm_system_config` VALUES (27, 'pay_weixin_client_key', 'upload', 4, '', 3, '', 0, 0, '\"\"', '微信支付证书密钥', '微信支付证书密钥，在微信商家平台中可以下载！文件名一般为apiclient_key.pem', 0, 1);
INSERT INTO `vm_system_config` VALUES (28, 'pay_weixin_key', 'text', 4, '', 0, '', 100, 0, '\"CRMEB\"', 'Key', '商户支付密钥Key。审核通过后，在微信发送的邮件中查看。', 0, 1);
INSERT INTO `vm_system_config` VALUES (29, 'pay_weixin_open', 'radio', 4, '1=>开启\n0=>关闭', 0, '', 0, 0, '\"1\"', '开启', '是否启用微信支付', 0, 1);
INSERT INTO `vm_system_config` VALUES (31, 'store_postage', 'text', 10, '', 0, 'number:true,min:0', 100, 0, '\"0\"', '邮费基础价', '商品邮费基础价格,最终金额为(基础价 + 商品1邮费 + 商品2邮费)', 0, 1);
INSERT INTO `vm_system_config` VALUES (32, 'store_free_postage', 'text', 5, '', 0, 'number:true,min:-1', 100, 0, '\"20\"', '满额包邮', '商城商品满多少金额即可包邮', 0, 1);
INSERT INTO `vm_system_config` VALUES (33, 'offline_postage', 'radio', 10, '0=>不包邮\n1=>包邮', 0, '', 0, 0, '\"1\"', '线下支付是否包邮', '用户选择线下支付时是否包邮', 0, 1);
INSERT INTO `vm_system_config` VALUES (34, 'integral_ratio', 'text', 11, '', 0, 'number:true', 100, 0, '\"0.01\"', '积分抵用比例', '积分抵用比例(1积分抵多少金额)', 0, 1);
INSERT INTO `vm_system_config` VALUES (35, 'site_service_phone', 'text', 1, '', 0, '', 100, 0, '\"\"', '客服电话', '客服联系电话', 0, 1);
INSERT INTO `vm_system_config` VALUES (44, 'store_user_min_recharge', 'text', 5, '', 0, 'required:true,number:true,min:0', 100, 0, '\"0.01\"', '用户最低充值金额', '用户单次最低充值金额', 0, 0);
INSERT INTO `vm_system_config` VALUES (45, 'site_store_admin_uids', 'text', 5, '', 0, '', 100, 0, '\"4\"', '管理员用户ID', '管理员用户ID,用于接收商城订单提醒，到微信用户中查找编号，多个英文‘,’隔开', 0, 1);
INSERT INTO `vm_system_config` VALUES (46, 'system_express_app_code', 'text', 10, '', 0, '', 100, 0, '\"e435be4a9bea44fa8a4862f8d0204da6\"', '快递查询密钥', '阿里云快递查询接口密钥购买地址：https://market.aliyun.com/products/56928004/cmapi021863.html', 0, 1);
INSERT INTO `vm_system_config` VALUES (47, 'main_business', 'text', 2, '', 0, 'required:true', 100, 0, '\" IT\\u79d1\\u6280 \\u4e92\\u8054\\u7f51|\\u7535\\u5b50\\u5546\\u52a1\"', '微信模板消息_主营行业', '微信公众号模板消息中选择开通的主营行业', 0, 0);
INSERT INTO `vm_system_config` VALUES (48, 'vice_business', 'text', 2, '', 0, 'required:true', 100, 0, '\"IT\\u79d1\\u6280 IT\\u8f6f\\u4ef6\\u4e0e\\u670d\\u52a1 \"', '微信模板消息_副营行业', '微信公众号模板消息中选择开通的副营行业', 0, 0);
INSERT INTO `vm_system_config` VALUES (49, 'store_brokerage_ratio', 'text', 9, '', 0, 'required:true,min:0,max:100,number:true', 100, 0, '\"80\"', '一级返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', 5, 1);
INSERT INTO `vm_system_config` VALUES (50, 'wechat_first_sub_give_coupon', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"\"', '首次关注赠送优惠券ID', '首次关注赠送优惠券ID,0为不赠送', 0, 1);
INSERT INTO `vm_system_config` VALUES (51, 'store_give_con_min_price', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"0.01\"', '消费满多少赠送优惠券', '消费满多少赠送优惠券,0为不赠送', 0, 1);
INSERT INTO `vm_system_config` VALUES (52, 'store_order_give_coupon', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"\"', '消费赠送优惠劵ID', '消费赠送优惠劵ID,0为不赠送', 0, 1);
INSERT INTO `vm_system_config` VALUES (53, 'user_extract_min_price', 'text', 9, '', 0, 'required:true,number:true,min:0', 100, 0, '\"1\"', '提现最低金额', '用户提现最低金额', 0, 1);
INSERT INTO `vm_system_config` VALUES (54, 'sx_sign_min_int', 'text', 11, '', 0, 'required:true,number:true,min:0', 100, 0, '\"1\"', '签到奖励最低积分', '签到奖励最低积分', 0, 1);
INSERT INTO `vm_system_config` VALUES (55, 'sx_sign_max_int', 'text', 11, '', 0, 'required:true,number:true,min:0', 100, 0, '\"5\"', '签到奖励最高积分', '签到奖励最高积分', 0, 1);
INSERT INTO `vm_system_config` VALUES (56, 'store_home_pink', 'upload', 5, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c3dd2ffb2616.jpeg\"', '首页拼团广告图', '首页拼团广告图', 0, 1);
INSERT INTO `vm_system_config` VALUES (57, 'about_us', 'upload', 1, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c3d964265e9f.png\"', '关于我们', '系统的标识', 0, 1);
INSERT INTO `vm_system_config` VALUES (58, 'replenishment_num', 'text', 5, '', 0, 'required:true,number:true,min:0', 100, 0, '\"20\"', '待补货数量', '产品待补货数量低于多少时，提示补货', 0, 1);
INSERT INTO `vm_system_config` VALUES (59, 'routine_appId', 'text', 7, '', 0, '', 100, 0, '\"\"', 'appId', '小程序appID', 0, 1);
INSERT INTO `vm_system_config` VALUES (60, 'routine_appsecret', 'text', 7, '', 0, '', 100, 0, '\"\"', 'AppSecret', '小程序AppSecret', 0, 1);
INSERT INTO `vm_system_config` VALUES (61, 'api', 'text', 2, '', 0, '', 100, 0, '\"\\/wap\\/Wechat\\/serve\"', '接口地址', '微信接口例如：http://www.abc.com/wap/wechat/serve', 0, 1);
INSERT INTO `vm_system_config` VALUES (62, 'paydir', 'textarea', 4, '', 0, '', 100, 5, '\"\\/wap\\/my\\/\\r\\n\\/wap\\/my\\/order\\/uni\\/\\r\\n\\/wap\\/store\\/confirm_order\\/cartId\\/\\r\\n\\/wap\\/store\\/combination_order\\/\"', '配置目录', '支付目录配置系统不调用提示作用', 0, 1);
INSERT INTO `vm_system_config` VALUES (73, 'routine_logo', 'upload', 7, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c9cd841a76fe.png\"', '小程序logo', '小程序logo', 0, 1);
INSERT INTO `vm_system_config` VALUES (74, 'routine_name', 'text', 7, '', 0, '', 100, 0, '\"CRMEB\"', '小程序名称', '小程序名称', 0, 1);
INSERT INTO `vm_system_config` VALUES (76, 'routine_style', 'text', 7, '', 0, '', 100, 0, '\"\"', '小程序风格', '小程序颜色', 0, 1);
INSERT INTO `vm_system_config` VALUES (77, 'store_stock', 'text', 5, '', 0, '', 100, 0, '\"2\"', '警戒库存', '警戒库存提醒值', 0, 1);
INSERT INTO `vm_system_config` VALUES (85, 'stor_reason', 'textarea', 5, '', 0, '', 100, 8, '\"\\u6536\\u8d27\\u5730\\u5740\\u586b\\u9519\\u4e86\\r\\n\\u4e0e\\u63cf\\u8ff0\\u4e0d\\u7b26\\r\\n\\u4fe1\\u606f\\u586b\\u9519\\u4e86\\uff0c\\u91cd\\u65b0\\u62cd\\r\\n\\u6536\\u5230\\u5546\\u54c1\\u635f\\u574f\\u4e86\\r\\n\\u672a\\u6309\\u9884\\u5b9a\\u65f6\\u95f4\\u53d1\\u8d27\\r\\n\\u5176\\u5b83\\u539f\\u56e0\"', '退货理由', '配置退货理由，一行一个理由', 0, 1);
INSERT INTO `vm_system_config` VALUES (87, 'store_brokerage_two', 'text', 9, '', 0, 'required:true,min:0,max:100,number:true', 100, 0, '\"60\"', '二级返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', 4, 1);
INSERT INTO `vm_system_config` VALUES (88, 'store_brokerage_statu', 'radio', 9, '1=>指定分销\n2=>人人分销', 0, '', 0, 0, '\"2\"', '分销模式', '人人分销默认每个人都可以分销，制定人分销后台制定人开启分销', 10, 1);
INSERT INTO `vm_system_config` VALUES (89, 'pay_routine_appid', 'text', 14, '', 0, 'required:true', 100, 0, '\"0\"', 'Appid', '小程序Appid', 0, 1);
INSERT INTO `vm_system_config` VALUES (90, 'pay_routine_appsecret', 'text', 14, '', 0, 'required:true', 100, 0, '\"0\"', 'Appsecret', '小程序Appsecret', 0, 1);
INSERT INTO `vm_system_config` VALUES (91, 'pay_routine_mchid', 'text', 14, '', 0, 'required:true', 100, 0, '\"0\"', 'Mchid', '商户号', 0, 1);
INSERT INTO `vm_system_config` VALUES (92, 'pay_routine_key', 'text', 14, '', 0, 'required:true', 100, 0, '\"0\"', 'Key', '商户key', 0, 1);
INSERT INTO `vm_system_config` VALUES (93, 'pay_routine_client_cert', 'upload', 14, '', 3, '', 0, 0, '\"\"', '小程序支付证书', '小程序支付证书', 0, 1);
INSERT INTO `vm_system_config` VALUES (94, 'pay_routine_client_key', 'upload', 14, '', 3, '', 0, 0, '\"\"', '小程序支付证书密钥', '小程序支付证书密钥', 0, 1);
INSERT INTO `vm_system_config` VALUES (98, 'wechat_avatar', 'upload', 2, '', 1, '', 0, 0, '\"\"', '公众号logo', '公众号logo', 0, 1);
INSERT INTO `vm_system_config` VALUES (99, 'user_extract_bank', 'textarea', 9, '', 0, '', 100, 5, '\"\\u4e2d\\u56fd\\u519c\\u884c\\r\\n\\u4e2d\\u56fd\\u5efa\\u8bbe\\u94f6\\u884c\\r\\n\\u5de5\\u5546\\u94f6\\u884c\"', '提现银行卡', '提现银行卡，每个银行换行', 0, 1);
INSERT INTO `vm_system_config` VALUES (100, 'fast_info', 'text', 16, NULL, NULL, '', 100, NULL, '\"\\u4e0a\\u767e\\u79cd\\u5546\\u54c1\\u5206\\u7c7b\\u4efb\\u60a8\\u9009\\u62e9\"', '快速选择简介', '小程序首页配置快速选择简介', 0, 1);
INSERT INTO `vm_system_config` VALUES (101, 'bast_info', 'text', 16, NULL, NULL, '', 100, NULL, '\"\\u8001\\u674e\\u8bda\\u610f\\u63a8\\u8350\\u54c1\\u8d28\\u5546\\u54c1\"', '精品推荐简介', '小程序首页配置精品推荐简介', 0, 1);
INSERT INTO `vm_system_config` VALUES (102, 'first_info', 'text', 16, NULL, NULL, '', 100, NULL, '\"\\u591a\\u4e2a\\u4f18\\u8d28\\u5546\\u54c1\\u6700\\u65b0\\u4e0a\\u67b6\"', '首发新品简介', '小程序首页配置首发新品简介', 0, 1);
INSERT INTO `vm_system_config` VALUES (103, 'sales_info', 'text', 16, NULL, NULL, '', 100, NULL, '\"\\u5e93\\u5b58\\u5546\\u54c1\\u4f18\\u60e0\\u4fc3\\u9500\\u6d3b\\u52a8\"', '促销单品简介', '小程序首页配置促销单品简介', 0, 1);
INSERT INTO `vm_system_config` VALUES (104, 'fast_number', 'text', 16, NULL, NULL, 'required:true,digits:true,min:1', 100, NULL, '\"10\"', '快速选择分类个数', '小程序首页配置快速选择分类个数', 0, 1);
INSERT INTO `vm_system_config` VALUES (105, 'bast_number', 'text', 16, NULL, NULL, 'required:true,digits:true,min:1', 100, NULL, '\"10\"', '精品推荐个数', '小程序首页配置精品推荐个数', 0, 1);
INSERT INTO `vm_system_config` VALUES (106, 'first_number', 'text', 16, NULL, NULL, 'required:true,digits:true,min:1', 100, NULL, '\"10\"', '首发新品个数', '小程序首页配置首发新品个数', 0, 1);
INSERT INTO `vm_system_config` VALUES (107, 'routine_index_logo', 'upload', 7, NULL, 1, NULL, NULL, NULL, '\"\"', '小程序主页logo图标', '小程序主页logo图标', 0, 1);
INSERT INTO `vm_system_config` VALUES (108, 'upload_type', 'radio', 17, '1=>本地存储\n2=>七牛云存储\n3=>阿里云OSS\n4=>腾讯COS', NULL, NULL, NULL, NULL, '\"1\"', '上传类型', '文件上传的类型', 0, 1);
INSERT INTO `vm_system_config` VALUES (109, 'uploadUrl', 'text', 17, NULL, NULL, 'url:true', 100, NULL, '\"\"', '空间域名 Domain', '空间域名 Domain', 0, 1);
INSERT INTO `vm_system_config` VALUES (110, 'accessKey', 'text', 17, NULL, NULL, '', 100, NULL, '\"\"', 'accessKey', 'accessKey', 0, 1);
INSERT INTO `vm_system_config` VALUES (111, 'secretKey', 'text', 17, NULL, NULL, '', 100, NULL, '\"\"', 'secretKey', 'secretKey', 0, 1);
INSERT INTO `vm_system_config` VALUES (112, 'storage_name', 'text', 17, NULL, NULL, '', 100, NULL, '\"\"', '存储空间名称', '存储空间名称', 0, 1);
INSERT INTO `vm_system_config` VALUES (113, 'order_cancel_time', 'text', 5, NULL, NULL, '', 100, NULL, '\"24\"', '普通商品未支付取消订单时间', '普通商品未支付取消订单时间，单位（小时）', 0, 1);
INSERT INTO `vm_system_config` VALUES (114, 'order_activity_time', 'text', 5, NULL, NULL, '', 100, NULL, '\"2\"', '活动商品未支付取消订单时间', '活动商品未支付取消订单时间，单位（小时）', 0, 1);
INSERT INTO `vm_system_config` VALUES (115, 'order_bargain_time', 'text', 5, NULL, NULL, NULL, 100, NULL, '\"0\"', '砍价未支付取消订单时间', '砍价未支付默认取消订单时间，单位（小时），如果为0将使用默认活动取消时间，优先使用单独活动配置', 0, 1);
INSERT INTO `vm_system_config` VALUES (116, 'order_seckill_time', 'text', 5, NULL, NULL, NULL, 100, NULL, '\"0\"', '秒杀未支付订单取消时间', '秒杀未支付订单取消时间，单位（小时），如果为0将使用默认活动取消时间，优先使用单独活动配置', 0, 1);
INSERT INTO `vm_system_config` VALUES (117, 'order_pink_time', 'text', 5, NULL, NULL, NULL, 100, NULL, '\"0\"', '拼团未支付取消订单时间', '拼团未支付取消订单时间,单位（小时），如果为0将使用默认活动取消时间，优先使用单独活动配置', 0, 1);
INSERT INTO `vm_system_config` VALUES (118, 'storage_region', 'text', 17, NULL, NULL, '', 100, NULL, '\"\"', '所属地域', '所属地域(腾讯COS时填写)', 0, 1);
INSERT INTO `vm_system_config` VALUES (119, 'vip_open', 'radio', 5, '0=>关闭\n1=>开启', NULL, NULL, NULL, NULL, '\"0\"', '会员功能是否开启', '会员功能是否开启', 0, 1);
INSERT INTO `vm_system_config` VALUES (120, 'new_order_audio_link', 'upload', 5, NULL, 3, NULL, NULL, NULL, '', '新订单语音提示', '新订单语音提示', 0, 1);

-- ----------------------------
-- Table structure for vm_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `vm_system_config_tab`;
CREATE TABLE `vm_system_config_tab`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置分类名称',
  `eng_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置分类英文名称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '配置分类状态',
  `info` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分类是否显示',
  `icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` int(2) NULL DEFAULT 0 COMMENT '配置类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_system_config_tab
-- ----------------------------
INSERT INTO `vm_system_config_tab` VALUES (1, '基础配置', 'basics', 1, 0, 'cog', 0);
INSERT INTO `vm_system_config_tab` VALUES (2, '公众号配置', 'wechat', 1, 0, 'weixin', 1);
INSERT INTO `vm_system_config_tab` VALUES (3, '公众号分享配置', 'wechat_share', 1, 0, 'whatsapp', 1);
INSERT INTO `vm_system_config_tab` VALUES (4, '公众号支付配置', 'pay', 1, 0, 'jpy', 1);
INSERT INTO `vm_system_config_tab` VALUES (5, '商城配置', 'store', 1, 0, 'shopping-cart', 0);
INSERT INTO `vm_system_config_tab` VALUES (7, '小程序配置', 'routine', 1, 0, 'weixin', 2);
INSERT INTO `vm_system_config_tab` VALUES (9, '分销配置', 'fenxiao', 1, 0, 'sitemap', 3);
INSERT INTO `vm_system_config_tab` VALUES (10, '物流配置', 'express', 1, 0, 'motorcycle', 0);
INSERT INTO `vm_system_config_tab` VALUES (11, '积分配置', 'point', 1, 0, 'powerpoint-o', 3);
INSERT INTO `vm_system_config_tab` VALUES (12, '优惠券配置', 'coupon', 1, 0, 'heartbeat', 3);
INSERT INTO `vm_system_config_tab` VALUES (14, '小程序支付配置', 'routine_pay', 1, 0, 'jpy', 2);
INSERT INTO `vm_system_config_tab` VALUES (16, '小程序首页配置', 'routine_index_page', 1, 0, 'home', 2);
INSERT INTO `vm_system_config_tab` VALUES (17, '文件上传配置', 'upload_set', 1, 0, '', 0);

-- ----------------------------
-- Table structure for vm_system_file
-- ----------------------------
DROP TABLE IF EXISTS `vm_system_file`;
CREATE TABLE `vm_system_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件对比ID',
  `cthash` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件内容',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文价名称',
  `atime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次访问时间',
  `mtime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次修改时间',
  `ctime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次改变时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件对比表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_system_file
-- ----------------------------

-- ----------------------------
-- Table structure for vm_tools
-- ----------------------------
DROP TABLE IF EXISTS `vm_tools`;
CREATE TABLE `vm_tools`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工具标识',
  `tools_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工具名称',
  `tools_type` int(11) NULL DEFAULT 0 COMMENT '工具类型',
  `cycle` int(11) NULL DEFAULT NULL COMMENT '周期',
  `start_time` int(11) NULL DEFAULT NULL COMMENT '起始时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `extra_price` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '额外费用',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `default_id` int(11) NULL DEFAULT NULL COMMENT '初始数据ID',
  `enter_id` int(11) NULL DEFAULT NULL COMMENT '企业单位ID',
  `current_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本期账单',
  `previous_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上期账单',
  `current_totalPrice` decimal(18, 2) NULL DEFAULT NULL COMMENT '应收费用',
  `mumber_id` int(11) NULL DEFAULT NULL COMMENT '操作员ID',
  `dosage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用量',
  `property_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '物业费',
  `air_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '冷气费',
  `heating_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '暖气费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '物业工具' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_tools
-- ----------------------------
INSERT INTO `vm_tools` VALUES (1, 'VMDBGCUEJY', '5月份综合费用', 0, 2, 1588780800, 1591459200, 0.00, 1588814368, 1588814483, 3, 1, '[\"15\",\"23\",\"0\"]', '[\"0\",\"0\",\"0\"]', 261.00, 1, '[15,23,0]', 0.00, 0.00, 0.00);
INSERT INTO `vm_tools` VALUES (2, 'HABHQGCGLK', '测试企业166.25平米', 0, 3, 1588780800, 1596729600, 0.00, 1588814846, 1588815236, 3, 2, '[\"375\",\"199\",\"0\"]', '[\"200\",\"120\",\"0\"]', 1057.00, 1, '[175,79,0]', 285.95, 12635.00, 27930.00);
INSERT INTO `vm_tools` VALUES (3, 'NRIPA270PR', '测试企业300平米', 0, 3, 1588780800, 1596729600, 0.00, 1588815259, 1588815278, 3, 3, '[\"10\",\"10\",\"0\"]', '[\"0\",\"0\",\"0\"]', 118.00, 1, '[10,10,0]', 516.00, 22800.00, 50400.00);
INSERT INTO `vm_tools` VALUES (4, '9IRIYCUBOG', '免费测试', 0, 3, 1588780800, 1596816000, 0.00, 1588821674, 1588909901, 1, 1, '[\"53\",\"55\",\"0\"]', '[\"22\",\"27\",\"0\"]', 0.00, 1, '[31,28,0]', 0.00, 0.00, 0.00);
INSERT INTO `vm_tools` VALUES (5, '9LUVIZXDTE', 'aa', 0, 5, 1588867200, 1588953600, 0.00, 1588909855, NULL, 3, 3, '[\"0\",\"0\",\"0\"]', '[\"0\",\"0\",\"0\"]', 0.00, 1, '[0,0,0]', 129.00, 5700.00, 12600.00);

-- ----------------------------
-- Table structure for vm_tools_copy1
-- ----------------------------
DROP TABLE IF EXISTS `vm_tools_copy1`;
CREATE TABLE `vm_tools_copy1`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工具标识',
  `tools_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工具名称',
  `tools_type` int(11) NULL DEFAULT 0 COMMENT '工具类型',
  `cycle` int(11) NULL DEFAULT NULL COMMENT '周期',
  `start_time` int(11) NULL DEFAULT NULL COMMENT '起始时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `extra_price` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '额外费用',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `default_id` int(11) NULL DEFAULT NULL COMMENT '初始数据ID',
  `enter_id` int(11) NULL DEFAULT NULL COMMENT '企业单位ID',
  `current_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本期账单',
  `previous_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上期账单',
  `current_totalPrice` decimal(18, 2) NULL DEFAULT NULL COMMENT '应收费用',
  `mumber_id` int(11) NULL DEFAULT NULL COMMENT '操作员ID',
  `dosage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用量',
  `property_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '物业费',
  `air_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '冷气费',
  `heating_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '暖气费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '物业工具' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_tools_copy1
-- ----------------------------
INSERT INTO `vm_tools_copy1` VALUES (6, 'EPSN0WJBN2', '测试', 0, 3, 1578240000, 1586188800, 0.00, 1588736065, 1588751909, 3, 2, '[\"30\",\"15\",\"50\"]', '[\"12\",\"5\",\"10\"]', 434.80, 1, '[18,10,40]', 0.00, 0.00, 0.00);
INSERT INTO `vm_tools_copy1` VALUES (7, '5T3LP0W3TW', '3月综合费用', 0, 2, 1582992000, 1585584000, 0.00, 1588736426, 1588749390, 1, 1, '[\"155\",\"19\",\"0\"]', '[\"37\",\"13\",\"0\"]', 0.00, 1, '[118,6,0]', 0.00, 0.00, 0.00);
INSERT INTO `vm_tools_copy1` VALUES (8, 'J8RBSBFPWB', '4月综合费用', 0, 2, 1585670400, 1588176000, 0.00, 1588736509, 1588751859, 1, 1, '[\"243\",\"51\",\"0\"]', '[\"155\",\"23\",\"0\"]', 0.00, 1, '[88,28,0]', 0.00, 0.00, 0.00);
INSERT INTO `vm_tools_copy1` VALUES (9, 'S8XKPOILSI', '3月综合费用', 0, 2, 1582992000, 1585584000, 0.00, 1588749507, 1588751839, 1, 1, '[\"155\",\"23\",\"0\"]', '[\"47\",\"13\",\"0\"]', 0.00, 1, '[108,10,0]', 0.00, 0.00, 0.00);
INSERT INTO `vm_tools_copy1` VALUES (10, 'ACUQZROPVC', '3月综合费用', 0, 2, 1585929600, 1588435200, 0.00, 1588751697, 1588751753, 3, 2, '[\"155\",\"37\",\"0\"]', '[\"0\",\"0\",\"0\"]', 590.00, 1, '[155,37,0]', 0.00, 0.00, 0.00);
INSERT INTO `vm_tools_copy1` VALUES (11, 'TM7KOZZ0YD', '4月综合费用', 0, 5, 1588694400, 1588780800, 0.00, 1588751998, 1588758246, 3, 3, '[\"200\",\"140\",\"0\"]', '[\"0\",\"0\",\"0\"]', 1730.00, 1, '[200,140,0]', 129.00, 5700.00, 12600.00);
INSERT INTO `vm_tools_copy1` VALUES (19, 'EMJAXRRE3O', '300平米', 0, 5, 1588694400, 1588780800, 0.00, 1588758421, NULL, 3, 3, '[\"5\",\"5\",\"-0.02\"]', '[\"0\",\"0\",\"0\"]', 58.85, 1, '[5,5,-0.02]', 129.00, 5700.00, 12600.00);
INSERT INTO `vm_tools_copy1` VALUES (21, '2JEOYMG9JC', 'aa', 0, 3, 1588694400, 1596643200, 0.00, 1588758865, 1588759243, 3, 2, '[\"0\",\"0\",\"0\"]', '[\"0\",\"0\",\"0\"]', 0.00, 1, '[0,0,0]', 285.95, 12635.00, 27930.00);

-- ----------------------------
-- Table structure for vm_tools_default
-- ----------------------------
DROP TABLE IF EXISTS `vm_tools_default`;
CREATE TABLE `vm_tools_default`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '车位管理：地上车位N个、地下车位N个',
  `electricity_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '电价：度/元',
  `water_rate` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '水费：元/吨',
  `gas_bill` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '气费：元/立方',
  `heating_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '暖气费：（天数*平米数*单价）*4（两种，超4米）',
  `air_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '冷气费：（天数*平米数*单价）*4（两种，超4米）',
  `property_fee` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '物业费：（天数*平米数*单价）',
  `tools_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `month_num` int(11) NULL DEFAULT 0 COMMENT '可变月份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '物业工具基础数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_tools_default
-- ----------------------------
INSERT INTO `vm_tools_default` VALUES (1, '[\"155\",\"500\"]', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '免费（水/电/气等全免）', 0);
INSERT INTO `vm_tools_default` VALUES (2, '[\"300\",\"500\"]', 1.30, 10.50, 7.66, 82.00, 38.00, 0.43, '计价（层高超4米）', 4);
INSERT INTO `vm_tools_default` VALUES (3, '[\"500\",\"155\"]', 1.30, 10.50, 7.66, 42.00, 19.00, 0.43, '计价（正常层高）', 4);

-- ----------------------------
-- Table structure for vm_user
-- ----------------------------
DROP TABLE IF EXISTS `vm_user`;
CREATE TABLE `vm_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `shop` smallint(2) NULL DEFAULT 0 COMMENT '所属店铺',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_user
-- ----------------------------
INSERT INTO `vm_user` VALUES (1, 'root', '07a8bc5f071562cdd342da61150b3727', '', '3532111@qq.com', 1, '2020-02-22 12:58:50', NULL, '', 0);
INSERT INTO `vm_user` VALUES (2, 'hk', '85293c75738153ab3abbafa0c422fc07', '', 'hk@agzjt.com', 1, '2020-02-22 08:14:05', '2020-03-02 14:54:11', '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (3, 'bander', '899713b12cd1eb80d817bc3bfce913f0', '', 'bander@qq.com', 1, '2020-02-22 08:14:52', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (4, 'wanghu', '2ecc00b9c173cf7b22e71f58a786d9ba', '', 'wh@agzjt.com', 1, '2020-02-22 08:15:43', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (5, 'jams', '9cfb6cba3568111cd9405566504a73ad', '', 'zzy@agzjt.com', 1, '2020-02-22 08:16:18', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (6, 'zzh', 'fc43e09523205e8e634adb3d18007d75', '', 'zzh@agzjt.com', 1, '2020-02-22 08:16:43', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (7, 'ybx', '1a8fea23683c95a5126334f246381d7b', '', 'ybx@agzjt.com', 1, '2020-03-02 12:59:13', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (8, 'hcb', 'a20428c9b1b78f2af2f461bc6d3a5738', '', 'hcb@agzjt.com', 1, '2020-03-04 01:59:25', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (9, 'dhc', 'e0732bf8c4e129920b8ad93c31a17d3a', '', 'dhc@agzjt.com', 1, '2020-03-18 03:11:46', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (10, 'liqiang', '012c665e0c0576ca9dbd2bfe05537d44', '', 'lq@agzjt.com', 1, '2020-03-19 05:12:45', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (11, 'zyf', 'e7b25b7e46cad7c8372ade2c0b0440d7', '', 'zyf@agzjt.com', 1, '2020-03-19 05:13:13', NULL, '0.0.0.0', 0);
INSERT INTO `vm_user` VALUES (12, 'userma', '7c4b1dead375965d6eb2177d0ed8fd32', '', '12612019@qq.com', 1, '2020-03-22 06:34:07', NULL, '0.0.0.0', 0);

-- ----------------------------
-- Table structure for vm_user_car
-- ----------------------------
DROP TABLE IF EXISTS `vm_user_car`;
CREATE TABLE `vm_user_car`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `car_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `car_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '车牌图片,多图显示',
  `car_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `car_type` int(11) NULL DEFAULT NULL COMMENT '车辆类型：1蓝牌,2黄牌,3绿牌',
  `car_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车主姓名',
  `car_parking` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车位编号',
  `car_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `enter_id` int(11) NULL DEFAULT NULL COMMENT '所在单位：关联企业表',
  `car_start_time` int(11) NULL DEFAULT NULL COMMENT '启用时间',
  `car_end_time` int(11) NULL DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户车辆表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_user_car
-- ----------------------------
INSERT INTO `vm_user_car` VALUES (1, 'TEST', '[\"http:\\/\\/pt.mbacms.com\\/upload\\/attach\\/2020\\/03\\/09\\/5e65bb05c4335.png\"]', '京A245N7', 3, '1', 'B201', '1', 1, 1587312000, 1587312000);
INSERT INTO `vm_user_car` VALUES (2, '桂林', '[\"http:\\/\\/pt.mbacms.com\\/upload\\/attach\\/2020\\/02\\/26\\/5e5693b393560.jpg\"]', '津AD252C', 2, 'S', 'B001', '1', 1, 1587312000, 1587312000);
INSERT INTO `vm_user_car` VALUES (4, '斯奈德', '[\"http:\\/\\/pt.mbacms.com\\/upload\\/attach\\/2020\\/03\\/09\\/5e65b889e61df.png\"]', '京AD25336', 1, '1deqwsd', 'B204', '13911185818', 2, 1585670400, 1586448000);
INSERT INTO `vm_user_car` VALUES (6, 'TEST1', '[\"http:\\/\\/pt.mbacms.com\\/upload\\/attach\\/2020\\/02\\/26\\/5e5693b393560.jpg\",\"http:\\/\\/pt.mbacms.com\\/upload\\/attach\\/2020\\/03\\/09\\/5e65b889e61df.png\"]', '京A002311', 1, '李先生', 'D001', '13295158966', 2, 1587312000, 1587312000);

-- ----------------------------
-- Table structure for vm_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `vm_user_ext`;
CREATE TABLE `vm_user_ext`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` int(4) NOT NULL COMMENT '用户ID',
  `fullname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` int(11) NULL DEFAULT NULL COMMENT '生日',
  `card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `depart` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `telphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `im` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '即时通讯',
  `salary` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '月薪',
  `jointime` int(11) NULL DEFAULT NULL COMMENT '入职时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_user_ext
-- ----------------------------
INSERT INTO `vm_user_ext` VALUES (1, 1, '系统管理员', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (2, 2, '侯奎', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (3, 3, '张平凡', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (4, 4, '王虎', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (5, 5, '詹致远', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (6, 6, '郑昭华', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (7, 7, '杨宝湘', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (8, 8, '黄超波', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (9, 9, '刁海超', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (10, 10, '李强', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (11, 11, '张亚飞', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `vm_user_ext` VALUES (12, 12, '测试帐号（禁用）', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL);

-- ----------------------------
-- Table structure for vm_user_log
-- ----------------------------
DROP TABLE IF EXISTS `vm_user_log`;
CREATE TABLE `vm_user_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ip` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `create_time` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2696 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vm_user_log
-- ----------------------------
INSERT INTO `vm_user_log` VALUES (489, 1, '登陆系统', 'admin/login/login', '120.244.234.17', 1582347603);
INSERT INTO `vm_user_log` VALUES (490, 1, '注销系统', 'admin/login/logout', '120.244.234.17', 1582348157);
INSERT INTO `vm_user_log` VALUES (491, 1, '登陆系统', 'admin/login/login', '120.244.234.17', 1582348222);
INSERT INTO `vm_user_log` VALUES (492, 1, '登陆系统', 'admin/login/login', '120.244.234.17', 1582352190);
INSERT INTO `vm_user_log` VALUES (493, 1, '添加店铺AGZ', 'admin/goods/addShop', '120.244.234.17', 1582352418);
INSERT INTO `vm_user_log` VALUES (494, 1, '登陆系统', 'admin/login/login', '120.244.234.17', 1582352589);
INSERT INTO `vm_user_log` VALUES (495, 1, '登陆系统', 'admin/login/login', '222.240.57.203', 1582353091);
INSERT INTO `vm_user_log` VALUES (496, 1, '添加客户分类总裁办', 'admin/member/addMcategory', '120.244.234.17', 1582353717);
INSERT INTO `vm_user_log` VALUES (497, 1, '添加仓库行政仓库', 'admin/goods/addStorehouse', '120.244.234.17', 1582358410);
INSERT INTO `vm_user_log` VALUES (498, 1, '添加分类酒', 'admin/goods/addCategory', '120.244.234.17', 1582358583);
INSERT INTO `vm_user_log` VALUES (499, 1, '添加分类烟', 'admin/goods/addCategory', '120.244.234.17', 1582358591);
INSERT INTO `vm_user_log` VALUES (500, 1, '编辑商品（ID：2）', 'admin/goods/editCategory', '120.244.234.17', 1582358599);
INSERT INTO `vm_user_log` VALUES (501, 1, '添加角色采购管理员', 'admin/user/addRole', '120.244.234.17', 1582358783);
INSERT INTO `vm_user_log` VALUES (502, 1, '添加角色行政管理员', 'admin/user/addRole', '120.244.234.17', 1582358792);
INSERT INTO `vm_user_log` VALUES (503, 1, '添加角色库房管理员', 'admin/user/addRole', '120.244.234.17', 1582358801);
INSERT INTO `vm_user_log` VALUES (504, 1, '添加商品芙蓉王', 'admin/goods/addGoods', '222.240.57.203', 1582359467);
INSERT INTO `vm_user_log` VALUES (505, 1, '添加仓库行政仓库', 'admin/goods/addStorehouse', '120.244.234.17', 1582361222);
INSERT INTO `vm_user_log` VALUES (506, 1, '添加供应商京东商城', 'admin/goods/addSupplier', '120.244.234.17', 1582361384);
INSERT INTO `vm_user_log` VALUES (507, 1, '登陆系统', 'admin/login/login', '120.244.234.17', 1582361414);
INSERT INTO `vm_user_log` VALUES (508, 1, '添加供应商天猫商城', 'admin/goods/addSupplier', '120.244.234.17', 1582362794);
INSERT INTO `vm_user_log` VALUES (509, 1, '添加供应商建材市场', 'admin/goods/addSupplier', '120.244.234.17', 1582363092);
INSERT INTO `vm_user_log` VALUES (510, 1, '添加商品中华烟（软）', 'admin/goods/addGoods', '120.244.234.17', 1582363326);
INSERT INTO `vm_user_log` VALUES (511, 1, '注销系统', 'admin/login/logout', '120.244.234.17', 1582363510);
INSERT INTO `vm_user_log` VALUES (512, 1, '登陆系统', 'admin/login/login', '120.244.234.17', 1582363520);
INSERT INTO `vm_user_log` VALUES (513, 1, '添加客户侯奎', 'admin/member/addMember', '120.244.234.17', 1582364996);
INSERT INTO `vm_user_log` VALUES (514, 1, '添加仓库行政仓库', 'admin/goods/addStorehouse', '120.244.234.17', 1582365024);
INSERT INTO `vm_user_log` VALUES (515, 1, '登陆系统', 'admin/login/login', '222.240.57.203', 1582365758);
INSERT INTO `vm_user_log` VALUES (516, 2, '添加用户wanghu', 'admin/user/addUser', '120.244.234.17', 1582373645);
INSERT INTO `vm_user_log` VALUES (517, 3, '添加用户wanghu', 'admin/user/addUser', '120.244.234.17', 1582373692);
INSERT INTO `vm_user_log` VALUES (518, 4, '添加用户wanghu', 'admin/user/addUser', '120.244.234.17', 1582373743);
INSERT INTO `vm_user_log` VALUES (519, 5, '添加用户jams', 'admin/user/addUser', '120.244.234.17', 1582373778);
INSERT INTO `vm_user_log` VALUES (520, 6, '添加用户zzh', 'admin/user/addUser', '120.244.234.17', 1582373803);
INSERT INTO `vm_user_log` VALUES (521, 1, '添加客户bander', 'admin/member/addMember', '120.244.234.17', 1582377246);
INSERT INTO `vm_user_log` VALUES (522, 1, '编辑客户分类（ID：1）', 'admin/member/editMcategory', '120.244.234.17', 1582379647);
INSERT INTO `vm_user_log` VALUES (523, 1, '添加客户分类总裁办', 'admin/member/addMcategory', '120.244.234.17', 1582379670);
INSERT INTO `vm_user_log` VALUES (524, 1, '添加客户分类财务部', 'admin/member/addMcategory', '120.244.234.17', 1582379681);
INSERT INTO `vm_user_log` VALUES (525, 1, '添加客户分类人事部', 'admin/member/addMcategory', '120.244.234.17', 1582379693);
INSERT INTO `vm_user_log` VALUES (526, 1, '添加客户分类工程部', 'admin/member/addMcategory', '120.244.234.17', 1582379706);
INSERT INTO `vm_user_log` VALUES (527, 1, '添加客户分类行政部', 'admin/member/addMcategory', '120.244.234.17', 1582379714);
INSERT INTO `vm_user_log` VALUES (528, 1, '添加客户分类物业部', 'admin/member/addMcategory', '120.244.234.17', 1582379721);
INSERT INTO `vm_user_log` VALUES (529, 1, '添加客户分类法务部', 'admin/member/addMcategory', '120.244.234.17', 1582379729);
INSERT INTO `vm_user_log` VALUES (530, 1, '添加客户分类采购部', 'admin/member/addMcategory', '120.244.234.17', 1582379746);
INSERT INTO `vm_user_log` VALUES (531, 1, '编辑客户分类（ID：9）', 'admin/member/editMcategory', '120.244.234.17', 1582379752);
INSERT INTO `vm_user_log` VALUES (532, 1, '编辑客户分类（ID：1）', 'admin/member/editMcategory', '120.244.234.17', 1582379760);
INSERT INTO `vm_user_log` VALUES (533, 1, '添加客户分类招商部', 'admin/member/addMcategory', '120.244.234.17', 1582379770);
INSERT INTO `vm_user_log` VALUES (534, 1, '添加客户分类市场部', 'admin/member/addMcategory', '120.244.234.17', 1582379780);
INSERT INTO `vm_user_log` VALUES (535, 1, '添加客户分类科实项目', 'admin/member/addMcategory', '120.244.234.17', 1582379803);
INSERT INTO `vm_user_log` VALUES (536, 1, '添加客户分类志远项目', 'admin/member/addMcategory', '120.244.234.17', 1582379810);
INSERT INTO `vm_user_log` VALUES (537, 1, '添加客户分类航发项目', 'admin/member/addMcategory', '120.244.234.17', 1582379831);
INSERT INTO `vm_user_log` VALUES (538, 1, '添加客户分类创新项目', 'admin/member/addMcategory', '120.244.234.17', 1582379840);
INSERT INTO `vm_user_log` VALUES (539, 1, '添加客户分类京仪项目', 'admin/member/addMcategory', '120.244.234.17', 1582379847);
INSERT INTO `vm_user_log` VALUES (540, 1, '订单（VM_20200222-1-1）成功保存', 'admin/storage/addStorage', '120.244.234.17', 1582380439);
INSERT INTO `vm_user_log` VALUES (541, 1, '登陆系统', 'admin/login/login', '222.240.57.203', 1582382703);
INSERT INTO `vm_user_log` VALUES (542, 1, '添加供应商烟草局', 'admin/goods/addSupplier', '120.244.234.17', 1582387037);
INSERT INTO `vm_user_log` VALUES (543, 1, '添加供应商自购渠道', 'admin/goods/addSupplier', '120.244.234.17', 1582387052);
INSERT INTO `vm_user_log` VALUES (544, 1, '添加供应商淘宝网', 'admin/goods/addSupplier', '120.244.234.17', 1582387067);
INSERT INTO `vm_user_log` VALUES (545, 1, '添加供应商免费回收', 'admin/goods/addSupplier', '120.244.234.17', 1582387082);
INSERT INTO `vm_user_log` VALUES (546, 1, '添加分类茶', 'admin/goods/addCategory', '120.244.234.17', 1582387151);
INSERT INTO `vm_user_log` VALUES (547, 1, '编辑商品（ID：2）', 'admin/goods/editCategory', '120.244.234.17', 1582387157);
INSERT INTO `vm_user_log` VALUES (548, 1, '编辑商品（ID：1）', 'admin/goods/editCategory', '120.244.234.17', 1582387164);
INSERT INTO `vm_user_log` VALUES (549, 1, '添加分类陈皮', 'admin/goods/addCategory', '120.244.234.17', 1582387181);
INSERT INTO `vm_user_log` VALUES (550, 1, '添加分类油', 'admin/goods/addCategory', '120.244.234.17', 1582387208);
INSERT INTO `vm_user_log` VALUES (551, 1, '编辑商品（ID：5）', 'admin/goods/editCategory', '120.244.234.17', 1582387219);
INSERT INTO `vm_user_log` VALUES (552, 1, '添加分类月饼', 'admin/goods/addCategory', '120.244.234.17', 1582387229);
INSERT INTO `vm_user_log` VALUES (553, 1, '添加角色楼宇管理员', 'admin/user/addRole', '120.244.234.17', 1582421497);
INSERT INTO `vm_user_log` VALUES (554, 1, '注销系统', 'admin/login/logout', '120.244.234.17', 1582421600);
INSERT INTO `vm_user_log` VALUES (555, 3, '登陆系统', 'admin/login/login', '120.244.234.17', 1582421622);
INSERT INTO `vm_user_log` VALUES (556, 3, '注销系统', 'admin/login/logout', '120.244.234.17', 1582421656);
INSERT INTO `vm_user_log` VALUES (557, 2, '登陆POS系统', 'index/login/login', '120.244.234.17', 1582421680);
INSERT INTO `vm_user_log` VALUES (558, 4, '登陆系统', 'admin/login/login', '120.244.234.17', 1582422851);
INSERT INTO `vm_user_log` VALUES (559, 4, '注销系统', 'admin/login/logout', '120.244.234.17', 1582425003);
INSERT INTO `vm_user_log` VALUES (560, 5, '登陆系统', 'admin/login/login', '120.244.234.17', 1582425019);
INSERT INTO `vm_user_log` VALUES (561, 5, '注销系统', 'admin/login/logout', '120.244.234.17', 1582426377);
INSERT INTO `vm_user_log` VALUES (562, 1, '登陆系统', 'admin/login/login', '120.244.234.17', 1582426395);
INSERT INTO `vm_user_log` VALUES (563, 1, '添加分类白酒', 'admin/goods/addCategory', '120.244.234.17', 1582448954);
INSERT INTO `vm_user_log` VALUES (564, 1, '添加分类红酒', 'admin/goods/addCategory', '120.244.234.17', 1582448970);
INSERT INTO `vm_user_log` VALUES (565, 1, '编辑商品（ID：8）', 'admin/goods/editCategory', '120.244.234.17', 1582448978);
INSERT INTO `vm_user_log` VALUES (566, 1, '编辑商品（ID：36）', 'admin/goods/editCategory', '120.244.234.17', 1582451708);
INSERT INTO `vm_user_log` VALUES (567, 1, '编辑商品（ID：36）', 'admin/goods/editCategory', '120.244.234.17', 1582451853);
INSERT INTO `vm_user_log` VALUES (568, 1, '添加分类测试', 'admin/goods/addCategory', '120.244.234.17', 1582451884);
INSERT INTO `vm_user_log` VALUES (569, 1, '编辑商品（ID：139）', 'admin/goods/editCategory', '120.244.234.17', 1582452024);
INSERT INTO `vm_user_log` VALUES (570, 1, '编辑商品（ID：36）', 'admin/goods/editCategory', '120.244.234.17', 1582452116);
INSERT INTO `vm_user_log` VALUES (571, 1, '登陆系统', 'admin/login/login', '113.247.181.97', 1582452498);
INSERT INTO `vm_user_log` VALUES (572, 1, '销售单（VM_20200222-1-3）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582453686);
INSERT INTO `vm_user_log` VALUES (573, 1, '订单（VM_20200222-1-7）成功保存', 'admin/storage/addStorage', '120.244.234.17', 1582453835);
INSERT INTO `vm_user_log` VALUES (574, 1, '采购退货订单（VM_20200222-1-6）成功保存', 'admin/storage/returnNew', '120.244.234.17', 1582453888);
INSERT INTO `vm_user_log` VALUES (575, 1, '审核单据（:VM_20200222-1-6）成功', 'admin/pub/verifyOrder', '120.244.234.17', 1582453913);
INSERT INTO `vm_user_log` VALUES (576, 1, '单据（VM_20200222-1-7）删除成功', 'admin/pub/delOrder', '120.244.234.17', 1582453980);
INSERT INTO `vm_user_log` VALUES (577, 1, '单据（VM_20200222-1-1）删除成功', 'admin/pub/delOrder', '120.244.234.17', 1582453983);
INSERT INTO `vm_user_log` VALUES (578, 1, '编辑商品（ID：16）', 'admin/goods/editCategory', '120.244.234.17', 1582460675);
INSERT INTO `vm_user_log` VALUES (579, 1, '编辑商品（ID：38）', 'admin/goods/editCategory', '120.244.234.17', 1582461010);
INSERT INTO `vm_user_log` VALUES (580, 1, '编辑商品（ID：43）', 'admin/goods/editCategory', '120.244.234.17', 1582461085);
INSERT INTO `vm_user_log` VALUES (581, 1, '编辑商品（ID：104）', 'admin/goods/editCategory', '120.244.234.17', 1582461371);
INSERT INTO `vm_user_log` VALUES (582, 1, '编辑商品（ID：103）', 'admin/goods/editCategory', '120.244.234.17', 1582461388);
INSERT INTO `vm_user_log` VALUES (583, 1, '编辑商品（ID：39）', 'admin/goods/editCategory', '120.244.234.17', 1582461536);
INSERT INTO `vm_user_log` VALUES (584, 1, '编辑商品（ID：47）', 'admin/goods/editCategory', '120.244.234.17', 1582461622);
INSERT INTO `vm_user_log` VALUES (585, 1, '编辑商品（ID：46）', 'admin/goods/editCategory', '120.244.234.17', 1582461644);
INSERT INTO `vm_user_log` VALUES (586, 1, '编辑商品（ID：26）', 'admin/goods/editCategory', '120.244.234.17', 1582461711);
INSERT INTO `vm_user_log` VALUES (587, 1, '编辑商品（ID：27）', 'admin/goods/editCategory', '120.244.234.17', 1582461741);
INSERT INTO `vm_user_log` VALUES (588, 1, '编辑商品（ID：48）', 'admin/goods/editCategory', '120.244.234.17', 1582461828);
INSERT INTO `vm_user_log` VALUES (589, 1, '编辑商品（ID：45）', 'admin/goods/editCategory', '120.244.234.17', 1582461840);
INSERT INTO `vm_user_log` VALUES (590, 1, '编辑商品（ID：49）', 'admin/goods/editCategory', '120.244.234.17', 1582461877);
INSERT INTO `vm_user_log` VALUES (591, 1, '编辑商品（ID：51）', 'admin/goods/editCategory', '120.244.234.17', 1582461912);
INSERT INTO `vm_user_log` VALUES (592, 1, '编辑商品（ID：50）', 'admin/goods/editCategory', '120.244.234.17', 1582461919);
INSERT INTO `vm_user_log` VALUES (593, 1, '采购退货订单（VM_20200222-1-6）成功保存', 'admin/storage/editReturn', '120.244.234.17', 1582465956);
INSERT INTO `vm_user_log` VALUES (594, 1, '登陆系统', 'admin/login/login', '113.247.181.97', 1582467034);
INSERT INTO `vm_user_log` VALUES (595, 1, '销售单（VM_20200223-1-1）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471222);
INSERT INTO `vm_user_log` VALUES (596, 1, '销售单（VM_20200223-1-2）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471462);
INSERT INTO `vm_user_log` VALUES (597, 1, '销售单（VM_20200223-1-3）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471514);
INSERT INTO `vm_user_log` VALUES (598, 1, '销售单（VM_20200223-1-4）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471585);
INSERT INTO `vm_user_log` VALUES (599, 1, '销售单（VM_20200223-1-5）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471700);
INSERT INTO `vm_user_log` VALUES (600, 1, '销售单（VM_20200223-1-6）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471812);
INSERT INTO `vm_user_log` VALUES (601, 1, '销售单（VM_20200223-1-7）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471850);
INSERT INTO `vm_user_log` VALUES (602, 1, '销售单（VM_20200223-1-8）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471916);
INSERT INTO `vm_user_log` VALUES (603, 1, '销售单（VM_20200223-1-9）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471949);
INSERT INTO `vm_user_log` VALUES (604, 1, '销售单（VM_20200223-1-10）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582471988);
INSERT INTO `vm_user_log` VALUES (605, 1, '销售单（VM_20200223-1-11）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472042);
INSERT INTO `vm_user_log` VALUES (606, 1, '销售单（VM_20200223-1-12）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472089);
INSERT INTO `vm_user_log` VALUES (607, 1, '销售单（VM_20200223-1-13）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472134);
INSERT INTO `vm_user_log` VALUES (608, 1, '销售单（VM_20200223-1-14）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472171);
INSERT INTO `vm_user_log` VALUES (609, 1, '销售单（VM_20200223-1-15）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472241);
INSERT INTO `vm_user_log` VALUES (610, 1, '销售单（VM_20200223-1-16）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472296);
INSERT INTO `vm_user_log` VALUES (611, 1, '销售单（VM_20200223-1-17）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472332);
INSERT INTO `vm_user_log` VALUES (612, 1, '销售单（VM_20200223-1-18）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472373);
INSERT INTO `vm_user_log` VALUES (613, 1, '销售单（VM_20200223-1-19）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472424);
INSERT INTO `vm_user_log` VALUES (614, 1, '销售单（VM_20200223-1-20）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472480);
INSERT INTO `vm_user_log` VALUES (615, 1, '销售单（VM_20200223-1-21）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472537);
INSERT INTO `vm_user_log` VALUES (616, 1, '销售单（VM_20200223-1-22）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472576);
INSERT INTO `vm_user_log` VALUES (617, 1, '销售单（VM_20200223-1-23）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472618);
INSERT INTO `vm_user_log` VALUES (618, 1, '销售单（VM_20200223-1-24）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472649);
INSERT INTO `vm_user_log` VALUES (619, 1, '销售订单（VM_20200223-1-24）成功保存', 'admin/sales/editSales', '120.244.234.17', 1582472735);
INSERT INTO `vm_user_log` VALUES (620, 1, '销售单（VM_20200223-1-25）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472842);
INSERT INTO `vm_user_log` VALUES (621, 1, '销售单（VM_20200223-1-26）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472889);
INSERT INTO `vm_user_log` VALUES (622, 1, '销售单（VM_20200223-1-27）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582472930);
INSERT INTO `vm_user_log` VALUES (623, 1, '单据（VM_20200223-1-27）删除成功', 'admin/pub/delOrder', '120.244.234.17', 1582472981);
INSERT INTO `vm_user_log` VALUES (624, 1, '销售单（VM_20200223-1-28）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473030);
INSERT INTO `vm_user_log` VALUES (625, 1, '销售单（VM_20200223-1-29）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473065);
INSERT INTO `vm_user_log` VALUES (626, 1, '销售单（VM_20200223-1-30）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473101);
INSERT INTO `vm_user_log` VALUES (627, 1, '销售单（VM_20200223-1-31）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473146);
INSERT INTO `vm_user_log` VALUES (628, 1, '销售单（VM_20200223-1-32）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473178);
INSERT INTO `vm_user_log` VALUES (629, 1, '销售单（VM_20200223-1-33）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473232);
INSERT INTO `vm_user_log` VALUES (630, 1, '销售单（VM_20200223-1-34）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473266);
INSERT INTO `vm_user_log` VALUES (631, 1, '销售单（VM_20200223-1-35）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473305);
INSERT INTO `vm_user_log` VALUES (632, 1, '销售单（VM_20200223-1-36）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473356);
INSERT INTO `vm_user_log` VALUES (633, 1, '销售单（VM_20200223-1-37）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473412);
INSERT INTO `vm_user_log` VALUES (634, 1, '销售单（VM_20200223-1-38）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473483);
INSERT INTO `vm_user_log` VALUES (635, 1, '销售单（VM_20200223-1-39）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473523);
INSERT INTO `vm_user_log` VALUES (636, 1, '销售单（VM_20200223-1-40）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473568);
INSERT INTO `vm_user_log` VALUES (637, 1, '销售单（VM_20200223-1-41）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473614);
INSERT INTO `vm_user_log` VALUES (638, 1, '销售单（VM_20200224-1-42）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473813);
INSERT INTO `vm_user_log` VALUES (639, 1, '销售单（VM_20200224-1-43）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582473903);
INSERT INTO `vm_user_log` VALUES (640, 1, '销售单（VM_20200224-1-44）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474006);
INSERT INTO `vm_user_log` VALUES (641, 1, '销售单（VM_20200224-1-45）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474062);
INSERT INTO `vm_user_log` VALUES (642, 1, '销售单（VM_20200224-1-46）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474209);
INSERT INTO `vm_user_log` VALUES (643, 1, '销售单（VM_20200224-1-47）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474249);
INSERT INTO `vm_user_log` VALUES (644, 1, '销售单（VM_20200224-1-48）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474283);
INSERT INTO `vm_user_log` VALUES (645, 1, '销售单（VM_20200224-1-49）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474330);
INSERT INTO `vm_user_log` VALUES (646, 1, '销售单（VM_20200224-1-50）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474363);
INSERT INTO `vm_user_log` VALUES (647, 1, '销售单（VM_20200224-1-51）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474403);
INSERT INTO `vm_user_log` VALUES (648, 1, '销售单（VM_20200224-1-52）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474432);
INSERT INTO `vm_user_log` VALUES (649, 1, '销售单（VM_20200224-1-53）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474459);
INSERT INTO `vm_user_log` VALUES (650, 1, '销售单（VM_20200224-1-54）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474523);
INSERT INTO `vm_user_log` VALUES (651, 1, '销售单（VM_20200224-1-55）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474554);
INSERT INTO `vm_user_log` VALUES (652, 1, '销售单（VM_20200224-1-56）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474583);
INSERT INTO `vm_user_log` VALUES (653, 1, '销售单（VM_20200224-1-57）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474626);
INSERT INTO `vm_user_log` VALUES (654, 1, '销售单（VM_20200224-1-58）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474687);
INSERT INTO `vm_user_log` VALUES (655, 1, '销售单（VM_20200224-1-59）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474713);
INSERT INTO `vm_user_log` VALUES (656, 1, '销售单（VM_20200224-1-60）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474758);
INSERT INTO `vm_user_log` VALUES (657, 1, '销售单（VM_20200224-1-61）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474806);
INSERT INTO `vm_user_log` VALUES (658, 1, '销售单（VM_20200224-1-62）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474838);
INSERT INTO `vm_user_log` VALUES (659, 1, '销售单（VM_20200224-1-63）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474875);
INSERT INTO `vm_user_log` VALUES (660, 1, '销售单（VM_20200224-1-64）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474933);
INSERT INTO `vm_user_log` VALUES (661, 1, '销售单（VM_20200224-1-65）成功保存', 'admin/sales/addSales', '120.244.234.17', 1582474966);
INSERT INTO `vm_user_log` VALUES (662, 1, '订单（VM_20200224-1-69）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1582517953);
INSERT INTO `vm_user_log` VALUES (663, 1, '订单（VM_20200224-1-71）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1582518005);
INSERT INTO `vm_user_log` VALUES (664, 1, '订单（VM_20200224-1-72）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1582518054);
INSERT INTO `vm_user_log` VALUES (665, 1, '采购订单（VM_20200224-1-72）成功保存', 'admin/storage/editStorage', '1.202.254.70', 1582518099);
INSERT INTO `vm_user_log` VALUES (666, 1, '订单（VM_20200224-1-73）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1582518197);
INSERT INTO `vm_user_log` VALUES (667, 1, '订单（VM_20200224-1-74）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1582518295);
INSERT INTO `vm_user_log` VALUES (668, 1, '订单（VM_20200224-1-75）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1582518371);
INSERT INTO `vm_user_log` VALUES (669, 1, '审核单据（:VM_20200224-1-75）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582521215);
INSERT INTO `vm_user_log` VALUES (670, 1, '审核单据（:VM_20200223-1-26）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522398);
INSERT INTO `vm_user_log` VALUES (671, 1, '审核单据（:VM_20200224-1-65）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522433);
INSERT INTO `vm_user_log` VALUES (672, 1, '审核单据（:VM_20200224-1-64）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522437);
INSERT INTO `vm_user_log` VALUES (673, 1, '审核单据（:VM_20200224-1-63）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522440);
INSERT INTO `vm_user_log` VALUES (674, 1, '审核单据（:VM_20200224-1-62）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522444);
INSERT INTO `vm_user_log` VALUES (675, 1, '审核单据（:VM_20200224-1-61）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522447);
INSERT INTO `vm_user_log` VALUES (676, 1, '审核单据（:VM_20200224-1-60）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522450);
INSERT INTO `vm_user_log` VALUES (677, 1, '审核单据（:VM_20200224-1-59）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522453);
INSERT INTO `vm_user_log` VALUES (678, 1, '审核单据（:VM_20200224-1-58）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522457);
INSERT INTO `vm_user_log` VALUES (679, 1, '审核单据（:VM_20200224-1-57）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522462);
INSERT INTO `vm_user_log` VALUES (680, 1, '审核单据（:VM_20200224-1-56）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522466);
INSERT INTO `vm_user_log` VALUES (681, 1, '审核单据（:VM_20200224-1-55）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522470);
INSERT INTO `vm_user_log` VALUES (682, 1, '审核单据（:VM_20200224-1-54）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522474);
INSERT INTO `vm_user_log` VALUES (683, 1, '审核单据（:VM_20200224-1-53）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522478);
INSERT INTO `vm_user_log` VALUES (684, 1, '审核单据（:VM_20200224-1-52）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522482);
INSERT INTO `vm_user_log` VALUES (685, 1, '审核单据（:VM_20200224-1-51）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522486);
INSERT INTO `vm_user_log` VALUES (686, 1, '审核单据（:VM_20200224-1-50）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522491);
INSERT INTO `vm_user_log` VALUES (687, 1, '审核单据（:VM_20200224-1-49）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522495);
INSERT INTO `vm_user_log` VALUES (688, 1, '审核单据（:VM_20200224-1-48）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522499);
INSERT INTO `vm_user_log` VALUES (689, 1, '审核单据（:VM_20200224-1-47）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522503);
INSERT INTO `vm_user_log` VALUES (690, 1, '审核单据（:VM_20200224-1-46）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522519);
INSERT INTO `vm_user_log` VALUES (691, 1, '审核单据（:VM_20200224-1-45）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522523);
INSERT INTO `vm_user_log` VALUES (692, 1, '审核单据（:VM_20200224-1-44）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522528);
INSERT INTO `vm_user_log` VALUES (693, 1, '审核单据（:VM_20200224-1-43）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522532);
INSERT INTO `vm_user_log` VALUES (694, 1, '审核单据（:VM_20200224-1-42）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522537);
INSERT INTO `vm_user_log` VALUES (695, 1, '审核单据（:VM_20200223-1-41）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522541);
INSERT INTO `vm_user_log` VALUES (696, 1, '审核单据（:VM_20200223-1-40）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522547);
INSERT INTO `vm_user_log` VALUES (697, 1, '审核单据（:VM_20200223-1-39）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522552);
INSERT INTO `vm_user_log` VALUES (698, 1, '审核单据（:VM_20200223-1-38）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522557);
INSERT INTO `vm_user_log` VALUES (699, 1, '审核单据（:VM_20200223-1-37）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522561);
INSERT INTO `vm_user_log` VALUES (700, 1, '审核单据（:VM_20200223-1-36）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522566);
INSERT INTO `vm_user_log` VALUES (701, 1, '审核单据（:VM_20200223-1-35）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522570);
INSERT INTO `vm_user_log` VALUES (702, 1, '审核单据（:VM_20200223-1-34）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522575);
INSERT INTO `vm_user_log` VALUES (703, 1, '审核单据（:VM_20200223-1-33）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522580);
INSERT INTO `vm_user_log` VALUES (704, 1, '审核单据（:VM_20200223-1-32）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522584);
INSERT INTO `vm_user_log` VALUES (705, 1, '审核单据（:VM_20200223-1-31）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522605);
INSERT INTO `vm_user_log` VALUES (706, 1, '审核单据（:VM_20200223-1-30）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522610);
INSERT INTO `vm_user_log` VALUES (707, 1, '审核单据（:VM_20200223-1-29）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522615);
INSERT INTO `vm_user_log` VALUES (708, 1, '审核单据（:VM_20200223-1-28）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522620);
INSERT INTO `vm_user_log` VALUES (709, 1, '审核单据（:VM_20200223-1-25）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522626);
INSERT INTO `vm_user_log` VALUES (710, 1, '审核单据（:VM_20200223-1-24）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522633);
INSERT INTO `vm_user_log` VALUES (711, 1, '审核单据（:VM_20200223-1-23）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522638);
INSERT INTO `vm_user_log` VALUES (712, 1, '审核单据（:VM_20200223-1-22）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522643);
INSERT INTO `vm_user_log` VALUES (713, 1, '审核单据（:VM_20200223-1-21）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522647);
INSERT INTO `vm_user_log` VALUES (714, 1, '审核单据（:VM_20200223-1-20）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522697);
INSERT INTO `vm_user_log` VALUES (715, 1, '审核单据（:VM_20200223-1-19）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522708);
INSERT INTO `vm_user_log` VALUES (716, 1, '审核单据（:VM_20200223-1-18）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522714);
INSERT INTO `vm_user_log` VALUES (717, 1, '审核单据（:VM_20200223-1-17）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522719);
INSERT INTO `vm_user_log` VALUES (718, 1, '审核单据（:VM_20200223-1-16）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522738);
INSERT INTO `vm_user_log` VALUES (719, 1, '审核单据（:VM_20200223-1-15）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522744);
INSERT INTO `vm_user_log` VALUES (720, 1, '审核单据（:VM_20200223-1-14）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522797);
INSERT INTO `vm_user_log` VALUES (721, 1, '审核单据（:VM_20200223-1-13）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522803);
INSERT INTO `vm_user_log` VALUES (722, 1, '审核单据（:VM_20200223-1-12）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522810);
INSERT INTO `vm_user_log` VALUES (723, 1, '审核单据（:VM_20200223-1-11）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522815);
INSERT INTO `vm_user_log` VALUES (724, 1, '审核单据（:VM_20200223-1-10）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522825);
INSERT INTO `vm_user_log` VALUES (725, 1, '审核单据（:VM_20200223-1-9）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522830);
INSERT INTO `vm_user_log` VALUES (726, 1, '审核单据（:VM_20200223-1-8）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522835);
INSERT INTO `vm_user_log` VALUES (727, 1, '审核单据（:VM_20200223-1-7）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522841);
INSERT INTO `vm_user_log` VALUES (728, 1, '审核单据（:VM_20200223-1-6）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522846);
INSERT INTO `vm_user_log` VALUES (729, 1, '审核单据（:VM_20200223-1-5）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522851);
INSERT INTO `vm_user_log` VALUES (730, 1, '审核单据（:VM_20200223-1-4）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522867);
INSERT INTO `vm_user_log` VALUES (731, 1, '审核单据（:VM_20200223-1-3）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522872);
INSERT INTO `vm_user_log` VALUES (732, 1, '审核单据（:VM_20200223-1-2）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582522877);
INSERT INTO `vm_user_log` VALUES (733, 1, '完成单据（ID:65）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525004);
INSERT INTO `vm_user_log` VALUES (734, 1, '完成单据（ID:64）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525011);
INSERT INTO `vm_user_log` VALUES (735, 1, '完成单据（ID:63）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525014);
INSERT INTO `vm_user_log` VALUES (736, 1, '完成单据（ID:62）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525018);
INSERT INTO `vm_user_log` VALUES (737, 1, '完成单据（ID:61）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525026);
INSERT INTO `vm_user_log` VALUES (738, 1, '完成单据（ID:60）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525165);
INSERT INTO `vm_user_log` VALUES (739, 1, '完成单据（ID:59）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525168);
INSERT INTO `vm_user_log` VALUES (740, 1, '完成单据（ID:58）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525172);
INSERT INTO `vm_user_log` VALUES (741, 1, '完成单据（ID:57）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525176);
INSERT INTO `vm_user_log` VALUES (742, 1, '完成单据（ID:56）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525180);
INSERT INTO `vm_user_log` VALUES (743, 1, '完成单据（ID:55）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525193);
INSERT INTO `vm_user_log` VALUES (744, 1, '完成单据（ID:54）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525198);
INSERT INTO `vm_user_log` VALUES (745, 1, '完成单据（ID:53）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525211);
INSERT INTO `vm_user_log` VALUES (746, 1, '完成单据（ID:2）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525219);
INSERT INTO `vm_user_log` VALUES (747, 1, '完成单据（ID:52）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525223);
INSERT INTO `vm_user_log` VALUES (748, 1, '完成单据（ID:51）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525228);
INSERT INTO `vm_user_log` VALUES (749, 1, '完成单据（ID:50）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525232);
INSERT INTO `vm_user_log` VALUES (750, 1, '完成单据（ID:49）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525236);
INSERT INTO `vm_user_log` VALUES (751, 1, '完成单据（ID:48）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525381);
INSERT INTO `vm_user_log` VALUES (752, 1, '完成单据（ID:47）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525386);
INSERT INTO `vm_user_log` VALUES (753, 1, '完成单据（ID:46）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525390);
INSERT INTO `vm_user_log` VALUES (754, 1, '完成单据（ID:45）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525394);
INSERT INTO `vm_user_log` VALUES (755, 1, '完成单据（ID:44）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525398);
INSERT INTO `vm_user_log` VALUES (756, 1, '完成单据（ID:43）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525403);
INSERT INTO `vm_user_log` VALUES (757, 1, '完成单据（ID:42）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525417);
INSERT INTO `vm_user_log` VALUES (758, 1, '完成单据（ID:41）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525424);
INSERT INTO `vm_user_log` VALUES (759, 1, '完成单据（ID:40）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525429);
INSERT INTO `vm_user_log` VALUES (760, 1, '完成单据（ID:39）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525434);
INSERT INTO `vm_user_log` VALUES (761, 1, '完成单据（ID:38）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525438);
INSERT INTO `vm_user_log` VALUES (762, 1, '完成单据（ID:37）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525443);
INSERT INTO `vm_user_log` VALUES (763, 1, '完成单据（ID:36）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525448);
INSERT INTO `vm_user_log` VALUES (764, 1, '完成单据（ID:35）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525452);
INSERT INTO `vm_user_log` VALUES (765, 1, '完成单据（ID:34）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525457);
INSERT INTO `vm_user_log` VALUES (766, 1, '完成单据（ID:33）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525462);
INSERT INTO `vm_user_log` VALUES (767, 1, '完成单据（ID:32）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525467);
INSERT INTO `vm_user_log` VALUES (768, 1, '完成单据（ID:3）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525485);
INSERT INTO `vm_user_log` VALUES (769, 1, '完成单据（ID:31）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525491);
INSERT INTO `vm_user_log` VALUES (770, 1, '完成单据（ID:30）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525496);
INSERT INTO `vm_user_log` VALUES (771, 1, '完成单据（ID:29）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525501);
INSERT INTO `vm_user_log` VALUES (772, 1, '完成单据（ID:28）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525506);
INSERT INTO `vm_user_log` VALUES (773, 1, '完成单据（ID:26）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525512);
INSERT INTO `vm_user_log` VALUES (774, 1, '完成单据（ID:25）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525519);
INSERT INTO `vm_user_log` VALUES (775, 1, '完成单据（ID:24）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525524);
INSERT INTO `vm_user_log` VALUES (776, 1, '完成单据（ID:23）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525529);
INSERT INTO `vm_user_log` VALUES (777, 1, '完成单据（ID:22）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525534);
INSERT INTO `vm_user_log` VALUES (778, 1, '完成单据（ID:21）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525539);
INSERT INTO `vm_user_log` VALUES (779, 1, '完成单据（ID:20）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525545);
INSERT INTO `vm_user_log` VALUES (780, 1, '完成单据（ID:19）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525550);
INSERT INTO `vm_user_log` VALUES (781, 1, '完成单据（ID:18）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525555);
INSERT INTO `vm_user_log` VALUES (782, 1, '完成单据（ID:17）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525559);
INSERT INTO `vm_user_log` VALUES (783, 1, '完成单据（ID:16）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525564);
INSERT INTO `vm_user_log` VALUES (784, 1, '完成单据（ID:15）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525570);
INSERT INTO `vm_user_log` VALUES (785, 1, '完成单据（ID:14）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525575);
INSERT INTO `vm_user_log` VALUES (786, 1, '完成单据（ID:13）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525580);
INSERT INTO `vm_user_log` VALUES (787, 1, '完成单据（ID:11）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525594);
INSERT INTO `vm_user_log` VALUES (788, 1, '完成单据（ID:10）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525599);
INSERT INTO `vm_user_log` VALUES (789, 1, '完成单据（ID:9）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525604);
INSERT INTO `vm_user_log` VALUES (790, 1, '完成单据（ID:8）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525609);
INSERT INTO `vm_user_log` VALUES (791, 1, '完成单据（ID:7）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525615);
INSERT INTO `vm_user_log` VALUES (792, 1, '完成单据（ID:6）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525623);
INSERT INTO `vm_user_log` VALUES (793, 1, '完成单据（ID:5）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525628);
INSERT INTO `vm_user_log` VALUES (794, 1, '完成单据（ID:4）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582525635);
INSERT INTO `vm_user_log` VALUES (795, 1, '销售单（VM_20200224-1-66）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582526274);
INSERT INTO `vm_user_log` VALUES (796, 1, '销售单（VM_20200224-1-77）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582526315);
INSERT INTO `vm_user_log` VALUES (797, 1, '审核单据（:VM_20200224-1-77）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582526357);
INSERT INTO `vm_user_log` VALUES (798, 1, '审核单据（:VM_20200224-1-66）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582526367);
INSERT INTO `vm_user_log` VALUES (799, 1, '完成单据（ID:77）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582526371);
INSERT INTO `vm_user_log` VALUES (800, 1, '完成单据（ID:66）成功', 'admin/pub/finishOrder', '124.126.208.41', 1582526374);
INSERT INTO `vm_user_log` VALUES (801, 1, '销售单（VM_20200224-1-78）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582526463);
INSERT INTO `vm_user_log` VALUES (802, 1, '审核单据（:VM_20200224-1-78）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582526471);
INSERT INTO `vm_user_log` VALUES (803, 1, '登陆系统', 'admin/login/login', '113.247.181.97', 1582527056);
INSERT INTO `vm_user_log` VALUES (804, 1, '审核单据（:VM_20200224-1-74）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582529933);
INSERT INTO `vm_user_log` VALUES (805, 1, '审核单据（:VM_20200224-1-73）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582529936);
INSERT INTO `vm_user_log` VALUES (806, 1, '审核单据（:VM_20200224-1-72）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582529939);
INSERT INTO `vm_user_log` VALUES (807, 1, '审核单据（:VM_20200224-1-71）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582529942);
INSERT INTO `vm_user_log` VALUES (808, 1, '审核单据（:VM_20200224-1-69）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582529945);
INSERT INTO `vm_user_log` VALUES (809, 1, '注销系统', 'admin/login/logout', '124.126.208.41', 1582533263);
INSERT INTO `vm_user_log` VALUES (810, 1, '登陆系统', 'admin/login/login', '124.126.208.41', 1582533285);
INSERT INTO `vm_user_log` VALUES (811, 1, '添加供应商人情往来', 'admin/goods/addSupplier', '124.126.208.41', 1582534459);
INSERT INTO `vm_user_log` VALUES (812, 1, '销售单（VM_20200224-1-79）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582534810);
INSERT INTO `vm_user_log` VALUES (813, 1, '销售单（VM_20200224-1-80）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582534870);
INSERT INTO `vm_user_log` VALUES (814, 1, '销售单（VM_20200224-1-80）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582534870);
INSERT INTO `vm_user_log` VALUES (815, 1, '销售单（VM_20200224-1-81）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582534943);
INSERT INTO `vm_user_log` VALUES (816, 1, '销售单（VM_20200224-1-82）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582535084);
INSERT INTO `vm_user_log` VALUES (817, 1, '销售单（VM_20200224-1-83）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582535160);
INSERT INTO `vm_user_log` VALUES (818, 1, '销售单（VM_20200224-1-84）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582535199);
INSERT INTO `vm_user_log` VALUES (819, 1, '销售单（VM_20200224-1-85）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582535290);
INSERT INTO `vm_user_log` VALUES (820, 1, '销售单（VM_20200224-1-86）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582535346);
INSERT INTO `vm_user_log` VALUES (821, 1, '销售单（VM_20200224-1-87）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582535446);
INSERT INTO `vm_user_log` VALUES (822, 1, '审核单据（:VM_20200224-1-79）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535457);
INSERT INTO `vm_user_log` VALUES (823, 1, '审核单据（:VM_20200224-1-80）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535460);
INSERT INTO `vm_user_log` VALUES (824, 1, '审核单据（:VM_20200224-1-81）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535463);
INSERT INTO `vm_user_log` VALUES (825, 1, '审核单据（:VM_20200224-1-82）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535466);
INSERT INTO `vm_user_log` VALUES (826, 1, '审核单据（:VM_20200224-1-83）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535469);
INSERT INTO `vm_user_log` VALUES (827, 1, '审核单据（:VM_20200224-1-84）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535473);
INSERT INTO `vm_user_log` VALUES (828, 1, '审核单据（:VM_20200224-1-85）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535476);
INSERT INTO `vm_user_log` VALUES (829, 1, '审核单据（:VM_20200224-1-86）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535481);
INSERT INTO `vm_user_log` VALUES (830, 1, '审核单据（:VM_20200224-1-87）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582535488);
INSERT INTO `vm_user_log` VALUES (831, 1, '修改仓库物业仓库', 'admin/goods/editStorehouse', '124.126.208.41', 1582536912);
INSERT INTO `vm_user_log` VALUES (832, 1, '订单（VM_20200224-1-76）成功保存', 'admin/storage/addStorage', '124.126.208.41', 1582540503);
INSERT INTO `vm_user_log` VALUES (833, 1, '审核单据（:VM_20200224-1-76）成功', 'admin/pub/verifyOrder', '124.126.208.41', 1582540807);
INSERT INTO `vm_user_log` VALUES (834, 1, '销售单（VM_20200224-1-88）成功保存', 'admin/sales/addSales', '124.126.208.41', 1582596262);
INSERT INTO `vm_user_log` VALUES (835, 2, '登陆POS系统', 'index/login/login', '1.202.254.70', 1582601874);
INSERT INTO `vm_user_log` VALUES (836, 2, '会员卡(218)现金充值成功', 'index/member/payMent', '1.202.254.70', 1582602158);
INSERT INTO `vm_user_log` VALUES (837, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582602459);
INSERT INTO `vm_user_log` VALUES (838, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582603747);
INSERT INTO `vm_user_log` VALUES (839, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582608589);
INSERT INTO `vm_user_log` VALUES (840, 1, '销售单（VM_20200225-1-90）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582608659);
INSERT INTO `vm_user_log` VALUES (841, 1, '销售单（VM_20200225-1-92）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582609807);
INSERT INTO `vm_user_log` VALUES (842, 1, '销售单（VM_20200225-1-93）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582609867);
INSERT INTO `vm_user_log` VALUES (843, 1, '销售单（VM_20200225-1-94）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582609899);
INSERT INTO `vm_user_log` VALUES (844, 1, '销售单（VM_20200225-1-95）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582609968);
INSERT INTO `vm_user_log` VALUES (845, 1, '销售单（VM_20200225-1-96）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582610031);
INSERT INTO `vm_user_log` VALUES (846, 1, '销售单（VM_20200225-1-97）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582610113);
INSERT INTO `vm_user_log` VALUES (847, 1, '销售单（VM_20200225-1-98）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582610190);
INSERT INTO `vm_user_log` VALUES (848, 1, '销售单（VM_20200225-1-99）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582610254);
INSERT INTO `vm_user_log` VALUES (849, 1, '销售订单（VM_20200225-1-99）成功保存', 'admin/sales/editSales', '1.202.254.70', 1582610431);
INSERT INTO `vm_user_log` VALUES (850, 1, '审核单据（:VM_20200225-1-99）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610449);
INSERT INTO `vm_user_log` VALUES (851, 1, '审核单据（:VM_20200225-1-98）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610453);
INSERT INTO `vm_user_log` VALUES (852, 1, '审核单据（:VM_20200225-1-97）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610456);
INSERT INTO `vm_user_log` VALUES (853, 1, '审核单据（:VM_20200225-1-96）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610459);
INSERT INTO `vm_user_log` VALUES (854, 1, '审核单据（:VM_20200225-1-95）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610462);
INSERT INTO `vm_user_log` VALUES (855, 1, '审核单据（:VM_20200225-1-94）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610465);
INSERT INTO `vm_user_log` VALUES (856, 1, '审核单据（:VM_20200225-1-93）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610468);
INSERT INTO `vm_user_log` VALUES (857, 1, '审核单据（:VM_20200225-1-92）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610471);
INSERT INTO `vm_user_log` VALUES (858, 1, '审核单据（:VM_20200225-1-90）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610474);
INSERT INTO `vm_user_log` VALUES (859, 1, '审核单据（:VM_20200224-1-88）成功', 'admin/pub/verifyOrder', '1.202.254.70', 1582610478);
INSERT INTO `vm_user_log` VALUES (860, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1582613667);
INSERT INTO `vm_user_log` VALUES (861, 1, '销售单（VM_20200225-1-100）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615057);
INSERT INTO `vm_user_log` VALUES (862, 1, '销售单（VM_20200225-1-101）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615098);
INSERT INTO `vm_user_log` VALUES (863, 1, '销售单（VM_20200225-1-102）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615134);
INSERT INTO `vm_user_log` VALUES (864, 1, '销售单（VM_20200225-1-103）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615185);
INSERT INTO `vm_user_log` VALUES (865, 1, '销售单（VM_20200225-1-104）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615235);
INSERT INTO `vm_user_log` VALUES (866, 1, '销售单（VM_20200225-1-105）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615270);
INSERT INTO `vm_user_log` VALUES (867, 1, '销售单（VM_20200225-1-106）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615309);
INSERT INTO `vm_user_log` VALUES (868, 1, '销售单（VM_20200225-1-107）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615360);
INSERT INTO `vm_user_log` VALUES (869, 1, '销售单（VM_20200225-1-108）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582615398);
INSERT INTO `vm_user_log` VALUES (870, 1, '销售单（VM_20200225-1-109）成功保存', 'admin/sales/addSales', '124.126.217.30', 1582615502);
INSERT INTO `vm_user_log` VALUES (871, 1, '销售单（VM_20200225-1-110）成功保存', 'admin/sales/addSales', '124.126.217.30', 1582615530);
INSERT INTO `vm_user_log` VALUES (872, 1, '销售单（VM_20200225-1-111）成功保存', 'admin/sales/addSales', '124.126.217.30', 1582615557);
INSERT INTO `vm_user_log` VALUES (873, 1, '销售单（VM_20200225-1-112）成功保存', 'admin/sales/addSales', '124.126.217.30', 1582615587);
INSERT INTO `vm_user_log` VALUES (874, 1, '销售单（VM_20200225-1-113）成功保存', 'admin/sales/addSales', '124.126.217.30', 1582615617);
INSERT INTO `vm_user_log` VALUES (875, 1, '销售单（VM_20200225-1-114）成功保存', 'admin/sales/addSales', '124.126.217.30', 1582615698);
INSERT INTO `vm_user_log` VALUES (876, 1, '销售单（VM_20200225-1-115）成功保存', 'admin/sales/addSales', '124.126.217.30', 1582615727);
INSERT INTO `vm_user_log` VALUES (877, 1, '审核单据（:VM_20200225-1-115）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615770);
INSERT INTO `vm_user_log` VALUES (878, 1, '审核单据（:VM_20200225-1-114）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615773);
INSERT INTO `vm_user_log` VALUES (879, 1, '审核单据（:VM_20200225-1-113）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615777);
INSERT INTO `vm_user_log` VALUES (880, 1, '审核单据（:VM_20200225-1-112）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615780);
INSERT INTO `vm_user_log` VALUES (881, 1, '审核单据（:VM_20200225-1-111）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615783);
INSERT INTO `vm_user_log` VALUES (882, 1, '审核单据（:VM_20200225-1-110）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615786);
INSERT INTO `vm_user_log` VALUES (883, 1, '审核单据（:VM_20200225-1-109）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615789);
INSERT INTO `vm_user_log` VALUES (884, 1, '审核单据（:VM_20200225-1-108）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615792);
INSERT INTO `vm_user_log` VALUES (885, 1, '审核单据（:VM_20200225-1-107）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615795);
INSERT INTO `vm_user_log` VALUES (886, 1, '审核单据（:VM_20200225-1-106）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615798);
INSERT INTO `vm_user_log` VALUES (887, 1, '审核单据（:VM_20200225-1-105）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615804);
INSERT INTO `vm_user_log` VALUES (888, 1, '审核单据（:VM_20200225-1-104）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615807);
INSERT INTO `vm_user_log` VALUES (889, 1, '审核单据（:VM_20200225-1-103）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615811);
INSERT INTO `vm_user_log` VALUES (890, 1, '审核单据（:VM_20200225-1-102）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615814);
INSERT INTO `vm_user_log` VALUES (891, 1, '审核单据（:VM_20200225-1-101）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615817);
INSERT INTO `vm_user_log` VALUES (892, 1, '审核单据（:VM_20200225-1-100）成功', 'admin/pub/verifyOrder', '124.126.217.30', 1582615820);
INSERT INTO `vm_user_log` VALUES (893, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1582699396);
INSERT INTO `vm_user_log` VALUES (894, 1, '添加客户test', 'admin/member/addMember', '124.126.217.30', 1582699504);
INSERT INTO `vm_user_log` VALUES (895, 1, '注销系统', 'admin/login/logout', '124.126.217.30', 1582699630);
INSERT INTO `vm_user_log` VALUES (896, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1582699653);
INSERT INTO `vm_user_log` VALUES (897, 4, '添加供应商test', 'admin/goods/addSupplier', '124.126.217.30', 1582699813);
INSERT INTO `vm_user_log` VALUES (898, 4, '修改供应商超市商店', 'admin/goods/editSupplier', '124.126.217.30', 1582699837);
INSERT INTO `vm_user_log` VALUES (899, 4, '编辑商品（ID：19）', 'admin/goods/editCategory', '124.126.217.30', 1582699904);
INSERT INTO `vm_user_log` VALUES (900, 4, '注销系统', 'admin/login/logout', '124.126.217.30', 1582700005);
INSERT INTO `vm_user_log` VALUES (901, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1582700016);
INSERT INTO `vm_user_log` VALUES (902, 1, '注销系统', 'admin/login/logout', '124.126.217.30', 1582700174);
INSERT INTO `vm_user_log` VALUES (903, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1582700190);
INSERT INTO `vm_user_log` VALUES (904, 4, '注销系统', 'admin/login/logout', '124.126.217.30', 1582704057);
INSERT INTO `vm_user_log` VALUES (905, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1582704084);
INSERT INTO `vm_user_log` VALUES (906, 1, '登陆系统', 'admin/login/login', '113.247.180.74', 1582722387);
INSERT INTO `vm_user_log` VALUES (907, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.217.30', 1582724766);
INSERT INTO `vm_user_log` VALUES (908, 1, '京A15W252 成功购买保险', 'admin/moduls.moduls_cars/buy', '124.126.217.30', 1582724845);
INSERT INTO `vm_user_log` VALUES (909, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1582730945);
INSERT INTO `vm_user_log` VALUES (910, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '120.244.234.39', 1582731177);
INSERT INTO `vm_user_log` VALUES (911, 1, '车辆预约成功', 'admin/moduls.moduls_cars/use', '120.244.234.39', 1582731650);
INSERT INTO `vm_user_log` VALUES (912, 1, '车辆预约取回成功', 'admin/moduls.moduls_cars/back', '120.244.234.39', 1582731682);
INSERT INTO `vm_user_log` VALUES (913, 1, '车辆送修成功', 'admin/moduls.moduls_cars/use', '120.244.234.39', 1582766185);
INSERT INTO `vm_user_log` VALUES (914, 1, '车辆送修取回成功', 'admin/moduls.moduls_cars/back', '120.244.234.39', 1582766454);
INSERT INTO `vm_user_log` VALUES (915, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '120.244.234.39', 1582766484);
INSERT INTO `vm_user_log` VALUES (916, 1, '登陆系统', 'admin/login/login', '222.240.57.212', 1582785222);
INSERT INTO `vm_user_log` VALUES (917, 1, '销售单（VM_20200225-1-116）成功保存', 'admin/sales/addSales', '1.202.254.70', 1582785361);
INSERT INTO `vm_user_log` VALUES (918, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1582786006);
INSERT INTO `vm_user_log` VALUES (919, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1582792688);
INSERT INTO `vm_user_log` VALUES (920, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1582796820);
INSERT INTO `vm_user_log` VALUES (921, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1582796871);
INSERT INTO `vm_user_log` VALUES (922, 1, '车辆预约成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1582797177);
INSERT INTO `vm_user_log` VALUES (923, 1, '车辆预约取回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1582797223);
INSERT INTO `vm_user_log` VALUES (924, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1582797310);
INSERT INTO `vm_user_log` VALUES (925, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1582797379);
INSERT INTO `vm_user_log` VALUES (926, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1582797487);
INSERT INTO `vm_user_log` VALUES (927, 1, '京ADJD252 成功购买保险', 'admin/moduls.moduls_cars/buy', '1.202.254.70', 1582797622);
INSERT INTO `vm_user_log` VALUES (928, 1, '登陆系统', 'admin/login/login', '222.240.57.212', 1582797783);
INSERT INTO `vm_user_log` VALUES (929, 1, '车辆预约成功', 'admin/moduls.moduls_cars/use', '222.240.57.212', 1582797870);
INSERT INTO `vm_user_log` VALUES (930, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582798913);
INSERT INTO `vm_user_log` VALUES (931, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1582808627);
INSERT INTO `vm_user_log` VALUES (932, 1, '采购订单（VM_20200224-1-76）成功保存', 'admin/storage/editStorage', '120.244.234.39', 1582812314);
INSERT INTO `vm_user_log` VALUES (933, 1, '编辑客户分类（ID：1）', 'admin/member/editMcategory', '120.244.234.39', 1582812917);
INSERT INTO `vm_user_log` VALUES (934, 1, '调拔订单（VM_20200224-1-68）成功保存', 'admin/stocks/allot', '120.244.234.39', 1582813117);
INSERT INTO `vm_user_log` VALUES (935, 1, '单据（VM_20200224-1-68）删除成功', 'admin/pub/delOrder', '120.244.234.39', 1582813162);
INSERT INTO `vm_user_log` VALUES (936, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582852060);
INSERT INTO `vm_user_log` VALUES (937, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1582854760);
INSERT INTO `vm_user_log` VALUES (938, 4, '订单（VM_20200224-1-89）成功保存', 'admin/storage/addStorage', '124.126.217.30', 1582856087);
INSERT INTO `vm_user_log` VALUES (939, 1, '车辆预约取回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1582868524);
INSERT INTO `vm_user_log` VALUES (940, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1582868581);
INSERT INTO `vm_user_log` VALUES (941, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1582868638);
INSERT INTO `vm_user_log` VALUES (942, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1582868671);
INSERT INTO `vm_user_log` VALUES (943, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1582868699);
INSERT INTO `vm_user_log` VALUES (944, 1, '单据（VM_20200225-1-116）删除成功', 'admin/pub/delOrder', '1.202.254.70', 1582868968);
INSERT INTO `vm_user_log` VALUES (945, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1582878503);
INSERT INTO `vm_user_log` VALUES (946, 4, '登陆系统', 'admin/login/login', '1.202.254.70', 1582878512);
INSERT INTO `vm_user_log` VALUES (947, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1582878565);
INSERT INTO `vm_user_log` VALUES (948, 4, '注销系统', 'admin/login/logout', '1.202.254.70', 1582878753);
INSERT INTO `vm_user_log` VALUES (949, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582878788);
INSERT INTO `vm_user_log` VALUES (950, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1582878959);
INSERT INTO `vm_user_log` VALUES (951, 4, '登陆系统', 'admin/login/login', '1.202.254.70', 1582878974);
INSERT INTO `vm_user_log` VALUES (952, 4, '注销系统', 'admin/login/logout', '1.202.254.70', 1582879482);
INSERT INTO `vm_user_log` VALUES (953, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582879589);
INSERT INTO `vm_user_log` VALUES (954, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1582879926);
INSERT INTO `vm_user_log` VALUES (955, 4, '登陆系统', 'admin/login/login', '1.202.254.70', 1582879949);
INSERT INTO `vm_user_log` VALUES (956, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1582880095);
INSERT INTO `vm_user_log` VALUES (957, 4, '添加供应商测试', 'admin/goods/addSupplier', '1.202.254.70', 1582880148);
INSERT INTO `vm_user_log` VALUES (958, 4, '盘点订单（VM_20200224-1-67）成功保存', 'admin/stocks/stocksTake', '124.126.217.30', 1582880209);
INSERT INTO `vm_user_log` VALUES (959, 4, '注销系统', 'admin/login/logout', '1.202.254.70', 1582880211);
INSERT INTO `vm_user_log` VALUES (960, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582880243);
INSERT INTO `vm_user_log` VALUES (961, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1582880634);
INSERT INTO `vm_user_log` VALUES (962, 4, '注销系统', 'admin/login/logout', '124.126.217.30', 1582880643);
INSERT INTO `vm_user_log` VALUES (963, 4, '登陆系统', 'admin/login/login', '1.202.254.70', 1582880649);
INSERT INTO `vm_user_log` VALUES (964, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1582880656);
INSERT INTO `vm_user_log` VALUES (965, 4, '注销系统', 'admin/login/logout', '1.202.254.70', 1582880692);
INSERT INTO `vm_user_log` VALUES (966, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582880704);
INSERT INTO `vm_user_log` VALUES (967, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1582880870);
INSERT INTO `vm_user_log` VALUES (968, 4, '登陆系统', 'admin/login/login', '1.202.254.70', 1582880889);
INSERT INTO `vm_user_log` VALUES (969, 4, '修改仓库物业仓库', 'admin/goods/editStorehouse', '1.202.254.70', 1582881042);
INSERT INTO `vm_user_log` VALUES (970, 4, '注销系统', 'admin/login/logout', '1.202.254.70', 1582881300);
INSERT INTO `vm_user_log` VALUES (971, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582881311);
INSERT INTO `vm_user_log` VALUES (972, 4, '销售单（VM_20200227-1-117）成功保存', 'admin/sales/addSales', '124.126.217.30', 1582881570);
INSERT INTO `vm_user_log` VALUES (973, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1582881608);
INSERT INTO `vm_user_log` VALUES (974, 3, '登陆系统', 'admin/login/login', '1.202.254.70', 1582881620);
INSERT INTO `vm_user_log` VALUES (975, 3, '注销系统', 'admin/login/logout', '1.202.254.70', 1582881635);
INSERT INTO `vm_user_log` VALUES (976, 4, '登陆系统', 'admin/login/login', '1.202.254.70', 1582881648);
INSERT INTO `vm_user_log` VALUES (977, 4, '注销系统', 'admin/login/logout', '1.202.254.70', 1582881777);
INSERT INTO `vm_user_log` VALUES (978, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1582881798);
INSERT INTO `vm_user_log` VALUES (979, 4, '注销系统', 'admin/login/logout', '124.126.217.30', 1582883631);
INSERT INTO `vm_user_log` VALUES (980, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1582883692);
INSERT INTO `vm_user_log` VALUES (981, 1, '单据（VM_20200224-1-89）删除成功', 'admin/pub/delOrder', '1.202.254.70', 1582884110);
INSERT INTO `vm_user_log` VALUES (982, 2, '登陆POS系统', 'index/login/login', '1.202.254.70', 1582884749);
INSERT INTO `vm_user_log` VALUES (983, 1, '单据（VM_20200227-1-117）删除成功', 'admin/pub/delOrder', '1.202.254.70', 1582885200);
INSERT INTO `vm_user_log` VALUES (984, 1, '单据（VM_20200224-1-67）删除成功', 'admin/pub/delOrder', '1.202.254.70', 1582885499);
INSERT INTO `vm_user_log` VALUES (985, 1, '添加商品30米皮尺', 'admin/goods/addGoods', '1.202.254.70', 1582885782);
INSERT INTO `vm_user_log` VALUES (986, 1, '订单（VM_20200228-4-119）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1582886735);
INSERT INTO `vm_user_log` VALUES (987, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1582897582);
INSERT INTO `vm_user_log` VALUES (988, 1, '修改供应商中关村友谊店', 'admin/goods/editSupplier', '120.244.234.39', 1582897869);
INSERT INTO `vm_user_log` VALUES (989, 1, '修改供应商中关村友谊店', 'admin/goods/editSupplier', '120.244.234.39', 1582897884);
INSERT INTO `vm_user_log` VALUES (990, 1, '登陆系统', 'admin/login/login', '113.246.246.15', 1582956801);
INSERT INTO `vm_user_log` VALUES (991, 1, '注销系统', 'admin/login/logout', '113.246.246.15', 1582984609);
INSERT INTO `vm_user_log` VALUES (992, 4, '登陆系统', 'admin/login/login', '113.246.246.15', 1582984630);
INSERT INTO `vm_user_log` VALUES (993, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '120.244.234.39', 1582984785);
INSERT INTO `vm_user_log` VALUES (994, 1, '单据（VM_20200228-4-119）删除成功', 'admin/pub/delOrder', '120.244.234.39', 1582984828);
INSERT INTO `vm_user_log` VALUES (995, 4, '注销系统', 'admin/login/logout', '113.246.246.15', 1582985347);
INSERT INTO `vm_user_log` VALUES (996, 6, '登陆系统', 'admin/login/login', '113.246.246.15', 1582985362);
INSERT INTO `vm_user_log` VALUES (997, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1582985595);
INSERT INTO `vm_user_log` VALUES (998, 4, '登陆系统', 'admin/login/login', '120.244.234.39', 1582985619);
INSERT INTO `vm_user_log` VALUES (999, 4, '注销系统', 'admin/login/logout', '120.244.234.39', 1582985721);
INSERT INTO `vm_user_log` VALUES (1000, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1582985739);
INSERT INTO `vm_user_log` VALUES (1001, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1582985867);
INSERT INTO `vm_user_log` VALUES (1002, 4, '登陆系统', 'admin/login/login', '120.244.234.39', 1582985878);
INSERT INTO `vm_user_log` VALUES (1003, 4, '添加商品游标卡尺', 'admin/goods/addGoods', '120.244.234.39', 1582986001);
INSERT INTO `vm_user_log` VALUES (1004, 4, '注销系统', 'admin/login/logout', '120.244.234.39', 1582986145);
INSERT INTO `vm_user_log` VALUES (1005, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1582986156);
INSERT INTO `vm_user_log` VALUES (1006, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1582986637);
INSERT INTO `vm_user_log` VALUES (1007, 5, '登陆系统', 'admin/login/login', '120.244.234.39', 1582986649);
INSERT INTO `vm_user_log` VALUES (1008, 5, '修改供应商友谊店', 'admin/goods/editSupplier', '120.244.234.39', 1582986670);
INSERT INTO `vm_user_log` VALUES (1009, 5, '注销系统', 'admin/login/logout', '120.244.234.39', 1582986759);
INSERT INTO `vm_user_log` VALUES (1010, 4, '登陆系统', 'admin/login/login', '120.244.234.39', 1582986771);
INSERT INTO `vm_user_log` VALUES (1011, 4, '注销系统', 'admin/login/logout', '120.244.234.39', 1582986877);
INSERT INTO `vm_user_log` VALUES (1012, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1582986887);
INSERT INTO `vm_user_log` VALUES (1013, 6, '注销系统', 'admin/login/logout', '113.246.246.15', 1582986898);
INSERT INTO `vm_user_log` VALUES (1014, 1, '登陆系统', 'admin/login/login', '113.246.246.15', 1582986920);
INSERT INTO `vm_user_log` VALUES (1015, 1, '注销系统', 'admin/login/logout', '113.246.246.15', 1582986988);
INSERT INTO `vm_user_log` VALUES (1016, 6, '登陆系统', 'admin/login/login', '113.246.246.15', 1582987018);
INSERT INTO `vm_user_log` VALUES (1017, 6, '注销系统', 'admin/login/logout', '113.246.246.15', 1582987059);
INSERT INTO `vm_user_log` VALUES (1018, 1, '登陆系统', 'admin/login/login', '113.246.246.15', 1582987085);
INSERT INTO `vm_user_log` VALUES (1019, 1, '登陆系统', 'admin/login/login', '120.244.154.107', 1582987108);
INSERT INTO `vm_user_log` VALUES (1020, 1, '登陆系统', 'admin/login/login', '120.244.154.107', 1582987108);
INSERT INTO `vm_user_log` VALUES (1021, 1, '注销系统', 'admin/login/logout', '113.246.246.15', 1582987161);
INSERT INTO `vm_user_log` VALUES (1022, 6, '登陆系统', 'admin/login/login', '113.246.246.15', 1582987177);
INSERT INTO `vm_user_log` VALUES (1023, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1582987177);
INSERT INTO `vm_user_log` VALUES (1024, 3, '登陆系统', 'admin/login/login', '120.244.234.39', 1582987237);
INSERT INTO `vm_user_log` VALUES (1025, 3, '订单（VM_20200228-1-123）成功保存', 'admin/storage/addStorage', '120.244.234.39', 1582987359);
INSERT INTO `vm_user_log` VALUES (1026, 3, '注销系统', 'admin/login/logout', '120.244.234.39', 1582987487);
INSERT INTO `vm_user_log` VALUES (1027, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1582987523);
INSERT INTO `vm_user_log` VALUES (1028, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1582987787);
INSERT INTO `vm_user_log` VALUES (1029, 3, '登陆系统', 'admin/login/login', '120.244.234.39', 1582987828);
INSERT INTO `vm_user_log` VALUES (1030, 3, '修改仓库物业仓库', 'admin/goods/editStorehouse', '120.244.234.39', 1582988068);
INSERT INTO `vm_user_log` VALUES (1031, 3, '注销系统', 'admin/login/logout', '120.244.234.39', 1583034175);
INSERT INTO `vm_user_log` VALUES (1032, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1583034193);
INSERT INTO `vm_user_log` VALUES (1033, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1583034802);
INSERT INTO `vm_user_log` VALUES (1034, 3, '登陆系统', 'admin/login/login', '120.244.234.39', 1583034823);
INSERT INTO `vm_user_log` VALUES (1035, 3, '采购退货订单（VM_20200224-1-70）成功保存', 'admin/storage/returnNew', '120.244.234.39', 1583034912);
INSERT INTO `vm_user_log` VALUES (1036, 3, '审核单据（:VM_20200224-1-70）成功', 'admin/pub/verifyOrder', '120.244.234.39', 1583034924);
INSERT INTO `vm_user_log` VALUES (1037, 3, '登陆系统', 'admin/login/login', '120.244.234.39', 1583034986);
INSERT INTO `vm_user_log` VALUES (1038, 3, '注销系统', 'admin/login/logout', '120.244.234.39', 1583035201);
INSERT INTO `vm_user_log` VALUES (1039, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1583035224);
INSERT INTO `vm_user_log` VALUES (1040, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1583037592);
INSERT INTO `vm_user_log` VALUES (1041, 3, '登陆系统', 'admin/login/login', '120.244.234.39', 1583037608);
INSERT INTO `vm_user_log` VALUES (1042, 3, '派车用车成功', 'admin/moduls.moduls_cars/use', '120.244.234.39', 1583037839);
INSERT INTO `vm_user_log` VALUES (1043, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1583113825);
INSERT INTO `vm_user_log` VALUES (1044, 1, '注销系统', 'admin/login/logout', '124.126.217.30', 1583114093);
INSERT INTO `vm_user_log` VALUES (1045, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1583114108);
INSERT INTO `vm_user_log` VALUES (1046, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1583114758);
INSERT INTO `vm_user_log` VALUES (1047, 4, '销售单（VM_20200228-4-121）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583115902);
INSERT INTO `vm_user_log` VALUES (1048, 4, '销售单（VM_20200302-4-126）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583115997);
INSERT INTO `vm_user_log` VALUES (1049, 4, '销售单（VM_20200302-4-127）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583120822);
INSERT INTO `vm_user_log` VALUES (1050, 4, '销售单（VM_20200302-4-128）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583120898);
INSERT INTO `vm_user_log` VALUES (1051, 4, '销售单（VM_20200302-4-129）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583120947);
INSERT INTO `vm_user_log` VALUES (1052, 4, '销售单（VM_20200302-4-130）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583120999);
INSERT INTO `vm_user_log` VALUES (1053, 4, '销售单（VM_20200302-4-131）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583121049);
INSERT INTO `vm_user_log` VALUES (1054, 4, '销售单（VM_20200302-4-132）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583121101);
INSERT INTO `vm_user_log` VALUES (1055, 4, '销售单（VM_20200302-4-133）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583121152);
INSERT INTO `vm_user_log` VALUES (1056, 4, '销售单（VM_20200302-4-134）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583121196);
INSERT INTO `vm_user_log` VALUES (1057, 4, '销售单（VM_20200302-4-135）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583121456);
INSERT INTO `vm_user_log` VALUES (1058, 4, '销售单（VM_20200302-4-136）成功保存', 'admin/sales/addSales', '124.126.217.30', 1583121634);
INSERT INTO `vm_user_log` VALUES (1059, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1583124689);
INSERT INTO `vm_user_log` VALUES (1060, 4, '登陆系统', 'admin/login/login', '1.202.254.70', 1583124699);
INSERT INTO `vm_user_log` VALUES (1061, 4, '注销系统', 'admin/login/logout', '1.202.254.70', 1583124742);
INSERT INTO `vm_user_log` VALUES (1062, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1583124753);
INSERT INTO `vm_user_log` VALUES (1063, 1, '采购退货订单（VM_20200224-1-70）成功保存', 'admin/storage/editReturn', '1.202.254.70', 1583124948);
INSERT INTO `vm_user_log` VALUES (1064, 1, '采购退货订单（VM_20200224-1-70）成功保存', 'admin/storage/editReturn', '1.202.254.70', 1583125038);
INSERT INTO `vm_user_log` VALUES (1065, 7, '添加用户ybx', 'admin/user/addUser', '1.202.254.70', 1583125153);
INSERT INTO `vm_user_log` VALUES (1066, 2, '登陆POS系统', 'index/login/login', '1.202.254.70', 1583128424);
INSERT INTO `vm_user_log` VALUES (1067, 1, '登陆系统', 'admin/login/login', '113.246.245.103', 1583128653);
INSERT INTO `vm_user_log` VALUES (1068, 2, '注销系统', 'index/login/logout', '1.202.254.70', 1583132044);
INSERT INTO `vm_user_log` VALUES (1069, 2, '登陆POS系统', 'index/login/login', '1.202.254.70', 1583132051);
INSERT INTO `vm_user_log` VALUES (1070, 1, '编辑客户test', 'admin/member/editMember', '113.246.245.103', 1583136373);
INSERT INTO `vm_user_log` VALUES (1071, 93, '登陆POS系统', 'index/login/login', '113.246.245.103', 1583137290);
INSERT INTO `vm_user_log` VALUES (1072, 2, '注销系统', 'index/login/logout', '1.202.254.70', 1583138326);
INSERT INTO `vm_user_log` VALUES (1073, 93, '注销系统', 'index/login/logout', '113.246.245.103', 1583138435);
INSERT INTO `vm_user_log` VALUES (1074, 93, '登陆POS系统', 'index/login/login', '113.246.245.103', 1583138443);
INSERT INTO `vm_user_log` VALUES (1075, 1, '修改仓库行政仓库', 'admin/goods/editStorehouse', '113.246.245.103', 1583141553);
INSERT INTO `vm_user_log` VALUES (1076, 93, '订单(PS_20200228-1-122)现金付款成功', 'index/index/payMent', '113.246.245.103', 1583141635);
INSERT INTO `vm_user_log` VALUES (1077, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1583143919);
INSERT INTO `vm_user_log` VALUES (1078, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583143962);
INSERT INTO `vm_user_log` VALUES (1079, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1583144000);
INSERT INTO `vm_user_log` VALUES (1080, 3, '登陆系统', 'admin/login/login', '120.244.234.39', 1583152505);
INSERT INTO `vm_user_log` VALUES (1081, 3, '注销系统', 'admin/login/logout', '120.244.234.39', 1583152513);
INSERT INTO `vm_user_log` VALUES (1082, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1583152557);
INSERT INTO `vm_user_log` VALUES (1083, 1, '编辑客户张平凡', 'admin/member/editMember', '120.244.234.39', 1583152805);
INSERT INTO `vm_user_log` VALUES (1084, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1583152811);
INSERT INTO `vm_user_log` VALUES (1085, 7, '登陆POS系统', 'index/login/login', '120.244.234.39', 1583152827);
INSERT INTO `vm_user_log` VALUES (1086, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1583152970);
INSERT INTO `vm_user_log` VALUES (1087, 1, '单据（VM_20200228-1-123）删除成功', 'admin/pub/delOrder', '120.244.234.39', 1583152993);
INSERT INTO `vm_user_log` VALUES (1088, 7, '注销系统', 'index/login/logout', '120.244.234.39', 1583153303);
INSERT INTO `vm_user_log` VALUES (1089, 1, '编辑客户test', 'admin/member/editMember', '120.244.234.39', 1583153332);
INSERT INTO `vm_user_log` VALUES (1090, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1583153336);
INSERT INTO `vm_user_log` VALUES (1091, 93, '登陆POS系统', 'index/login/login', '120.244.234.39', 1583153341);
INSERT INTO `vm_user_log` VALUES (1092, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1583153354);
INSERT INTO `vm_user_log` VALUES (1093, 1, '编辑客户前端测试', 'admin/member/editMember', '120.244.234.39', 1583157304);
INSERT INTO `vm_user_log` VALUES (1094, 1, '编辑客户前端测试', 'admin/member/editMember', '120.244.234.39', 1583157334);
INSERT INTO `vm_user_log` VALUES (1095, 93, '注销系统', 'index/login/logout', '120.244.234.39', 1583159648);
INSERT INTO `vm_user_log` VALUES (1096, 93, '登陆POS系统', 'index/login/login', '120.244.234.39', 1583159657);
INSERT INTO `vm_user_log` VALUES (1097, 93, '订单(PS_20200302-1-139)现金付款成功', 'index/index/payMent', '120.244.234.39', 1583159794);
INSERT INTO `vm_user_log` VALUES (1098, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1583197490);
INSERT INTO `vm_user_log` VALUES (1099, 1, '修改密码', 'admin/user/editPasswd', '1.202.254.70', 1583197792);
INSERT INTO `vm_user_log` VALUES (1100, 1, '修改密码', 'admin/user/editPasswd', '1.202.254.70', 1583197794);
INSERT INTO `vm_user_log` VALUES (1101, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1583197794);
INSERT INTO `vm_user_log` VALUES (1102, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1583197817);
INSERT INTO `vm_user_log` VALUES (1103, 7, '登陆POS系统', 'index/login/login', '1.202.254.70', 1583197886);
INSERT INTO `vm_user_log` VALUES (1104, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1583199487);
INSERT INTO `vm_user_log` VALUES (1105, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583219837);
INSERT INTO `vm_user_log` VALUES (1106, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1583219912);
INSERT INTO `vm_user_log` VALUES (1107, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583220043);
INSERT INTO `vm_user_log` VALUES (1108, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583220044);
INSERT INTO `vm_user_log` VALUES (1109, 93, '修改密码', 'index/login/editPasswd', '120.244.234.39', 1583243422);
INSERT INTO `vm_user_log` VALUES (1110, 93, '修改密码', 'index/login/editPasswd', '120.244.234.39', 1583243454);
INSERT INTO `vm_user_log` VALUES (1111, 93, '注销系统', 'index/login/logout', '120.244.234.39', 1583243464);
INSERT INTO `vm_user_log` VALUES (1112, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1583243484);
INSERT INTO `vm_user_log` VALUES (1113, 5, '登陆系统', 'admin/login/login', '120.244.234.39', 1583243499);
INSERT INTO `vm_user_log` VALUES (1114, 5, '注销系统', 'admin/login/logout', '120.244.234.39', 1583243508);
INSERT INTO `vm_user_log` VALUES (1115, 3, '登陆系统', 'admin/login/login', '120.244.234.39', 1583243574);
INSERT INTO `vm_user_log` VALUES (1116, 3, '修改供应商唯君酒业', 'admin/goods/editSupplier', '120.244.234.39', 1583245260);
INSERT INTO `vm_user_log` VALUES (1117, 3, '添加商品苹果电脑', 'admin/goods/addGoods', '120.244.234.39', 1583247037);
INSERT INTO `vm_user_log` VALUES (1118, 3, '添加商品苹果电脑', 'admin/goods/addGoods', '120.244.234.39', 1583247207);
INSERT INTO `vm_user_log` VALUES (1119, 3, '添加分类苹果电脑', 'admin/goods/addCategory', '120.244.234.39', 1583247379);
INSERT INTO `vm_user_log` VALUES (1120, 3, '编辑商品（ID：121）', 'admin/goods/editCategory', '120.244.234.39', 1583247405);
INSERT INTO `vm_user_log` VALUES (1121, 3, '编辑商品（ID：121）', 'admin/goods/editCategory', '120.244.234.39', 1583247432);
INSERT INTO `vm_user_log` VALUES (1122, 3, '编辑商品（ID：119）', 'admin/goods/editCategory', '120.244.234.39', 1583247469);
INSERT INTO `vm_user_log` VALUES (1123, 3, '编辑商品（ID：120）', 'admin/goods/editCategory', '120.244.234.39', 1583247481);
INSERT INTO `vm_user_log` VALUES (1124, 3, '编辑商品（ID：122）', 'admin/goods/editCategory', '120.244.234.39', 1583247497);
INSERT INTO `vm_user_log` VALUES (1125, 3, '编辑商品（ID：121）', 'admin/goods/editCategory', '120.244.234.39', 1583247630);
INSERT INTO `vm_user_log` VALUES (1126, 3, '编辑商品（ID：118）', 'admin/goods/editCategory', '120.244.234.39', 1583247643);
INSERT INTO `vm_user_log` VALUES (1127, 3, '编辑商品（ID：123）', 'admin/goods/editCategory', '120.244.234.39', 1583247669);
INSERT INTO `vm_user_log` VALUES (1128, 3, '编辑商品（ID：118）', 'admin/goods/editCategory', '120.244.234.39', 1583247735);
INSERT INTO `vm_user_log` VALUES (1129, 3, '编辑商品（ID：127）', 'admin/goods/editCategory', '120.244.234.39', 1583247762);
INSERT INTO `vm_user_log` VALUES (1130, 3, '编辑商品（ID：129）', 'admin/goods/editCategory', '120.244.234.39', 1583247783);
INSERT INTO `vm_user_log` VALUES (1131, 3, '编辑商品（ID：128）', 'admin/goods/editCategory', '120.244.234.39', 1583247802);
INSERT INTO `vm_user_log` VALUES (1132, 3, '编辑商品（ID：129）', 'admin/goods/editCategory', '120.244.234.39', 1583247815);
INSERT INTO `vm_user_log` VALUES (1133, 3, '编辑商品（ID：128）', 'admin/goods/editCategory', '120.244.234.39', 1583247823);
INSERT INTO `vm_user_log` VALUES (1134, 3, '编辑商品（ID：124）', 'admin/goods/editCategory', '120.244.234.39', 1583247857);
INSERT INTO `vm_user_log` VALUES (1135, 3, '编辑商品（ID：77）', 'admin/goods/editCategory', '120.244.234.39', 1583247901);
INSERT INTO `vm_user_log` VALUES (1136, 3, '编辑商品（ID：55）', 'admin/goods/editCategory', '120.244.234.39', 1583247925);
INSERT INTO `vm_user_log` VALUES (1137, 3, '编辑商品（ID：122）', 'admin/goods/editCategory', '120.244.234.39', 1583248009);
INSERT INTO `vm_user_log` VALUES (1138, 3, '编辑商品（ID：55）', 'admin/goods/editCategory', '120.244.234.39', 1583248169);
INSERT INTO `vm_user_log` VALUES (1139, 3, '编辑商品（ID：95）', 'admin/goods/editCategory', '120.244.234.39', 1583248184);
INSERT INTO `vm_user_log` VALUES (1140, 3, '登陆系统', 'admin/login/login', '120.244.234.39', 1583248389);
INSERT INTO `vm_user_log` VALUES (1141, 93, '登陆POS系统', 'index/login/login', '117.136.38.150', 1583249924);
INSERT INTO `vm_user_log` VALUES (1142, 93, '登陆POS系统', 'index/login/login', '117.136.38.150', 1583249926);
INSERT INTO `vm_user_log` VALUES (1143, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1583286875);
INSERT INTO `vm_user_log` VALUES (1144, 7, '登陆系统', 'admin/login/login', '120.244.154.107', 1583288102);
INSERT INTO `vm_user_log` VALUES (1145, 8, '添加用户hcb', 'admin/user/addUser', '124.126.217.30', 1583301565);
INSERT INTO `vm_user_log` VALUES (1146, 1, '添加角色车辆管理员', 'admin/user/addRole', '124.126.217.30', 1583301732);
INSERT INTO `vm_user_log` VALUES (1147, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.217.30', 1583302098);
INSERT INTO `vm_user_log` VALUES (1148, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.217.30', 1583302467);
INSERT INTO `vm_user_log` VALUES (1149, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.217.30', 1583302545);
INSERT INTO `vm_user_log` VALUES (1150, 5, '登陆系统', 'admin/login/login', '124.126.217.30', 1583303774);
INSERT INTO `vm_user_log` VALUES (1151, 8, '登陆系统', 'admin/login/login', '1.202.254.70', 1583303834);
INSERT INTO `vm_user_log` VALUES (1152, 8, '登陆系统', 'admin/login/login', '124.126.217.30', 1583304161);
INSERT INTO `vm_user_log` VALUES (1153, 1, '注销系统', 'admin/login/logout', '124.126.217.30', 1583304301);
INSERT INTO `vm_user_log` VALUES (1154, 8, '登陆系统', 'admin/login/login', '124.126.217.30', 1583304334);
INSERT INTO `vm_user_log` VALUES (1155, 8, '注销系统', 'admin/login/logout', '124.126.217.30', 1583304368);
INSERT INTO `vm_user_log` VALUES (1156, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1583307211);
INSERT INTO `vm_user_log` VALUES (1157, 1, '注销系统', 'admin/login/logout', '124.126.217.30', 1583307264);
INSERT INTO `vm_user_log` VALUES (1158, 8, '登陆系统', 'admin/login/login', '124.126.217.30', 1583307300);
INSERT INTO `vm_user_log` VALUES (1159, 8, '注销系统', 'admin/login/logout', '124.126.217.30', 1583307420);
INSERT INTO `vm_user_log` VALUES (1160, 6, '登陆系统', 'admin/login/login', '124.126.217.30', 1583307434);
INSERT INTO `vm_user_log` VALUES (1161, 8, '登陆系统', 'admin/login/login', '117.136.38.150', 1583309596);
INSERT INTO `vm_user_log` VALUES (1162, 8, '注销系统', 'admin/login/logout', '117.136.38.150', 1583309715);
INSERT INTO `vm_user_log` VALUES (1163, 6, '注销系统', 'admin/login/logout', '124.126.217.30', 1583311085);
INSERT INTO `vm_user_log` VALUES (1164, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1583311104);
INSERT INTO `vm_user_log` VALUES (1165, 1, '注销系统', 'admin/login/logout', '124.126.217.30', 1583311481);
INSERT INTO `vm_user_log` VALUES (1166, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1583326728);
INSERT INTO `vm_user_log` VALUES (1167, 1, '修改密码', 'admin/user/editPasswd', '120.244.234.39', 1583326754);
INSERT INTO `vm_user_log` VALUES (1168, 1, '注销系统', 'admin/login/logout', '120.244.234.39', 1583326756);
INSERT INTO `vm_user_log` VALUES (1169, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1583326821);
INSERT INTO `vm_user_log` VALUES (1170, 1, '登陆系统', 'admin/login/login', '120.244.234.39', 1583326854);
INSERT INTO `vm_user_log` VALUES (1171, 1, '登陆系统', 'admin/login/login', '113.240.146.198', 1583326960);
INSERT INTO `vm_user_log` VALUES (1172, 1, '登陆系统', 'admin/login/login', '113.240.146.198', 1583337522);
INSERT INTO `vm_user_log` VALUES (1173, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '113.240.146.198', 1583337875);
INSERT INTO `vm_user_log` VALUES (1174, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1583369382);
INSERT INTO `vm_user_log` VALUES (1175, 1, '编辑客户物业部客服', 'admin/member/editMember', '124.126.217.30', 1583370719);
INSERT INTO `vm_user_log` VALUES (1176, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.217.30', 1583371038);
INSERT INTO `vm_user_log` VALUES (1177, 4, '登陆系统', 'admin/login/login', '124.126.217.30', 1583371046);
INSERT INTO `vm_user_log` VALUES (1178, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.217.30', 1583371124);
INSERT INTO `vm_user_log` VALUES (1179, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.217.30', 1583371363);
INSERT INTO `vm_user_log` VALUES (1180, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.217.30', 1583371402);
INSERT INTO `vm_user_log` VALUES (1181, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.217.30', 1583371483);
INSERT INTO `vm_user_log` VALUES (1182, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.217.30', 1583371524);
INSERT INTO `vm_user_log` VALUES (1183, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.217.30', 1583371667);
INSERT INTO `vm_user_log` VALUES (1184, 1, '单据（PS_20200302-1-139）删除成功', 'admin/pub/delOrder', '124.126.217.30', 1583392979);
INSERT INTO `vm_user_log` VALUES (1185, 7, '登陆系统', 'admin/login/login', '120.244.154.107', 1583406057);
INSERT INTO `vm_user_log` VALUES (1186, 1, '登陆系统', 'admin/login/login', '124.126.217.30', 1583462125);
INSERT INTO `vm_user_log` VALUES (1187, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.217.30', 1583463680);
INSERT INTO `vm_user_log` VALUES (1188, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.217.30', 1583463761);
INSERT INTO `vm_user_log` VALUES (1189, 7, '登陆系统', 'admin/login/login', '120.244.154.107', 1583464111);
INSERT INTO `vm_user_log` VALUES (1190, 7, '添加供应商回龙观五金', 'admin/goods/addSupplier', '120.244.154.107', 1583465084);
INSERT INTO `vm_user_log` VALUES (1191, 7, '添加供应商西三旗百汇', 'admin/goods/addSupplier', '120.244.154.107', 1583465254);
INSERT INTO `vm_user_log` VALUES (1192, 1, '修改供应商西三旗百汇', 'admin/goods/editSupplier', '1.202.254.70', 1583465872);
INSERT INTO `vm_user_log` VALUES (1193, 1, '修改供应商回龙观五金', 'admin/goods/editSupplier', '1.202.254.70', 1583465912);
INSERT INTO `vm_user_log` VALUES (1194, 7, '添加供应商回龙观灯', 'admin/goods/addSupplier', '120.244.154.107', 1583465991);
INSERT INTO `vm_user_log` VALUES (1195, 7, '修改供应商回龙观灯', 'admin/goods/editSupplier', '120.244.154.107', 1583466043);
INSERT INTO `vm_user_log` VALUES (1196, 7, '添加供应商西三旗劳保', 'admin/goods/addSupplier', '120.244.154.107', 1583466201);
INSERT INTO `vm_user_log` VALUES (1197, 1, '修改供应商回龙观五金', 'admin/goods/editSupplier', '1.202.254.70', 1583466205);
INSERT INTO `vm_user_log` VALUES (1198, 1, '修改供应商西三旗劳保', 'admin/goods/editSupplier', '1.202.254.70', 1583466309);
INSERT INTO `vm_user_log` VALUES (1199, 7, '添加供应商西三旗', 'admin/goods/addSupplier', '120.244.154.107', 1583466359);
INSERT INTO `vm_user_log` VALUES (1200, 7, '添加供应商西三旗工服', 'admin/goods/addSupplier', '120.244.154.107', 1583466463);
INSERT INTO `vm_user_log` VALUES (1201, 7, '添加供应商中关村', 'admin/goods/addSupplier', '120.244.154.107', 1583466786);
INSERT INTO `vm_user_log` VALUES (1202, 7, '修改供应商西三旗双雄办公', 'admin/goods/editSupplier', '120.244.154.107', 1583466855);
INSERT INTO `vm_user_log` VALUES (1203, 7, '登陆系统', 'admin/login/login', '120.244.154.107', 1583467881);
INSERT INTO `vm_user_log` VALUES (1204, 7, '修改供应商工服', 'admin/goods/editSupplier', '120.244.154.107', 1583467961);
INSERT INTO `vm_user_log` VALUES (1205, 7, '修改供应商塑料家居——劳保', 'admin/goods/editSupplier', '120.244.154.107', 1583468004);
INSERT INTO `vm_user_log` VALUES (1206, 7, '修改供应商旗双雄办公', 'admin/goods/editSupplier', '120.244.154.107', 1583468134);
INSERT INTO `vm_user_log` VALUES (1207, 7, '修改供应商京鹏久恒——五金', 'admin/goods/editSupplier', '120.244.154.107', 1583468182);
INSERT INTO `vm_user_log` VALUES (1208, 7, '修改供应商旭雅商贸——工服', 'admin/goods/editSupplier', '120.244.154.107', 1583468254);
INSERT INTO `vm_user_log` VALUES (1209, 7, '修改供应商美的照明——灯', 'admin/goods/editSupplier', '120.244.154.107', 1583468963);
INSERT INTO `vm_user_log` VALUES (1210, 7, '修改供应商双雄办公', 'admin/goods/editSupplier', '120.244.154.107', 1583468976);
INSERT INTO `vm_user_log` VALUES (1211, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1583472227);
INSERT INTO `vm_user_log` VALUES (1212, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583472295);
INSERT INTO `vm_user_log` VALUES (1213, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1583472340);
INSERT INTO `vm_user_log` VALUES (1214, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583472368);
INSERT INTO `vm_user_log` VALUES (1215, 1, '采购订单（VM_20200224-1-76）成功保存', 'admin/storage/editStorage', '1.202.254.70', 1583475563);
INSERT INTO `vm_user_log` VALUES (1216, 1, '修改供应商旭雅商贸(工服)', 'admin/goods/editSupplier', '1.202.254.70', 1583475886);
INSERT INTO `vm_user_log` VALUES (1217, 1, '修改供应商塑料家居(劳保)', 'admin/goods/editSupplier', '1.202.254.70', 1583475897);
INSERT INTO `vm_user_log` VALUES (1218, 1, '修改供应商美的照明(灯)', 'admin/goods/editSupplier', '1.202.254.70', 1583475914);
INSERT INTO `vm_user_log` VALUES (1219, 1, '修改供应商京鹏久恒(五金)', 'admin/goods/editSupplier', '1.202.254.70', 1583475925);
INSERT INTO `vm_user_log` VALUES (1220, 1, '修改供应商烟草局', 'admin/goods/editSupplier', '1.202.254.70', 1583476015);
INSERT INTO `vm_user_log` VALUES (1221, 1, '修改供应商自购渠道', 'admin/goods/editSupplier', '1.202.254.70', 1583476076);
INSERT INTO `vm_user_log` VALUES (1222, 7, '登陆系统', 'admin/login/login', '120.244.154.107', 1583476829);
INSERT INTO `vm_user_log` VALUES (1223, 7, '添加资产燕尾夹（大）', 'admin/goods/addGoods', '120.244.154.107', 1583477849);
INSERT INTO `vm_user_log` VALUES (1224, 7, '添加资产大头针', 'admin/goods/addGoods', '120.244.154.107', 1583478047);
INSERT INTO `vm_user_log` VALUES (1225, 7, '添加资产三联收据', 'admin/goods/addGoods', '120.244.154.107', 1583478148);
INSERT INTO `vm_user_log` VALUES (1226, 7, '订单（VM_20200229-3-124）成功保存', 'admin/storage/addStorage', '120.244.154.107', 1583478218);
INSERT INTO `vm_user_log` VALUES (1227, 7, '订单（VM_20200306-7-142）成功保存', 'admin/storage/addStorage', '120.244.154.107', 1583478782);
INSERT INTO `vm_user_log` VALUES (1228, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1583478973);
INSERT INTO `vm_user_log` VALUES (1229, 7, '登陆系统', 'admin/login/login', '1.202.254.70', 1583478990);
INSERT INTO `vm_user_log` VALUES (1230, 7, '注销系统', 'admin/login/logout', '1.202.254.70', 1583479051);
INSERT INTO `vm_user_log` VALUES (1231, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1583479060);
INSERT INTO `vm_user_log` VALUES (1232, 7, '订单（VM_20200306-7-143）成功保存', 'admin/storage/addStorage', '120.244.154.107', 1583483395);
INSERT INTO `vm_user_log` VALUES (1233, 7, '添加资产马桶刷', 'admin/goods/addGoods', '120.244.154.107', 1583483474);
INSERT INTO `vm_user_log` VALUES (1234, 7, '添加资产杀虫剂', 'admin/goods/addGoods', '120.244.154.107', 1583483532);
INSERT INTO `vm_user_log` VALUES (1235, 7, '添加供应商西三旗保洁用品', 'admin/goods/addSupplier', '120.244.154.107', 1583483637);
INSERT INTO `vm_user_log` VALUES (1236, 7, '添加资产除胶剂', 'admin/goods/addGoods', '120.244.154.107', 1583483730);
INSERT INTO `vm_user_log` VALUES (1237, 7, '添加资产拖布', 'admin/goods/addGoods', '120.244.154.107', 1583483769);
INSERT INTO `vm_user_log` VALUES (1238, 7, '添加资产榨水车', 'admin/goods/addGoods', '120.244.154.107', 1583483802);
INSERT INTO `vm_user_log` VALUES (1239, 7, '添加资产橡胶手套', 'admin/goods/addGoods', '120.244.154.107', 1583483854);
INSERT INTO `vm_user_log` VALUES (1240, 7, '添加资产尘推架（大号）', 'admin/goods/addGoods', '120.244.154.107', 1583483935);
INSERT INTO `vm_user_log` VALUES (1241, 7, '添加资产尘推架布', 'admin/goods/addGoods', '120.244.154.107', 1583483997);
INSERT INTO `vm_user_log` VALUES (1242, 7, '添加资产除垢剂', 'admin/goods/addGoods', '120.244.154.107', 1583484145);
INSERT INTO `vm_user_log` VALUES (1243, 7, '添加资产风扇', 'admin/goods/addGoods', '120.244.154.107', 1583484193);
INSERT INTO `vm_user_log` VALUES (1244, 7, '添加资产手电筒', 'admin/goods/addGoods', '120.244.154.107', 1583484227);
INSERT INTO `vm_user_log` VALUES (1245, 7, '添加资产氖管电笔', 'admin/goods/addGoods', '120.244.154.107', 1583484309);
INSERT INTO `vm_user_log` VALUES (1246, 7, '添加资产云石机', 'admin/goods/addGoods', '120.244.154.107', 1583484360);
INSERT INTO `vm_user_log` VALUES (1247, 7, '添加资产合金头锯片', 'admin/goods/addGoods', '120.244.154.107', 1583484398);
INSERT INTO `vm_user_log` VALUES (1248, 7, '添加资产衬衫', 'admin/goods/addGoods', '120.244.154.107', 1583484465);
INSERT INTO `vm_user_log` VALUES (1249, 7, '添加资产爱丽丝抗菊花茶', 'admin/goods/addGoods', '120.244.154.107', 1583484622);
INSERT INTO `vm_user_log` VALUES (1250, 7, '添加资产藿香正气水', 'admin/goods/addGoods', '120.244.154.107', 1583484668);
INSERT INTO `vm_user_log` VALUES (1251, 6, '登陆系统', 'admin/login/login', '1.202.254.70', 1583484958);
INSERT INTO `vm_user_log` VALUES (1252, 7, '订单（VM_20200306-7-144）成功保存', 'admin/storage/addStorage', '120.244.154.107', 1583485139);
INSERT INTO `vm_user_log` VALUES (1253, 7, '添加资产卫生纸', 'admin/goods/addGoods', '120.244.154.107', 1583485453);
INSERT INTO `vm_user_log` VALUES (1254, 7, '添加资产工作牌', 'admin/goods/addGoods', '120.244.154.107', 1583485532);
INSERT INTO `vm_user_log` VALUES (1255, 7, '添加资产风扇（桌式）', 'admin/goods/addGoods', '120.244.154.107', 1583485597);
INSERT INTO `vm_user_log` VALUES (1256, 7, '添加资产网络U盘接口', 'admin/goods/addGoods', '120.244.154.107', 1583485728);
INSERT INTO `vm_user_log` VALUES (1257, 7, '添加供应商办公耗材', 'admin/goods/addSupplier', '120.244.154.107', 1583485870);
INSERT INTO `vm_user_log` VALUES (1258, 7, '添加资产锁芯', 'admin/goods/addGoods', '120.244.154.107', 1583486011);
INSERT INTO `vm_user_log` VALUES (1259, 7, '添加资产塑料布', 'admin/goods/addGoods', '120.244.154.107', 1583486043);
INSERT INTO `vm_user_log` VALUES (1260, 7, '订单（VM_20200306-7-145）成功保存', 'admin/storage/addStorage', '120.244.154.107', 1583486140);
INSERT INTO `vm_user_log` VALUES (1261, 7, '登陆POS系统', 'index/login/login', '1.202.254.70', 1583495143);
INSERT INTO `vm_user_log` VALUES (1262, 7, '注销系统', 'index/login/logout', '1.202.254.70', 1583495202);
INSERT INTO `vm_user_log` VALUES (1263, 1, '登陆系统', 'admin/login/login', '120.244.234.5', 1583571983);
INSERT INTO `vm_user_log` VALUES (1264, 1, '销售订单（VM_20200302-4-128）成功保存', 'admin/sales/editSales', '120.244.234.27', 1583633655);
INSERT INTO `vm_user_log` VALUES (1265, 1, '销售订单（VM_20200302-4-134）成功保存', 'admin/sales/editSales', '120.244.234.27', 1583633743);
INSERT INTO `vm_user_log` VALUES (1266, 1, '销售订单（VM_20200302-4-133）成功保存', 'admin/sales/editSales', '120.244.234.27', 1583633769);
INSERT INTO `vm_user_log` VALUES (1267, 7, '登陆系统', 'admin/login/login', '1.202.254.70', 1583717209);
INSERT INTO `vm_user_log` VALUES (1268, 7, '添加资产订书钉', 'admin/goods/addGoods', '1.202.254.70', 1583717494);
INSERT INTO `vm_user_log` VALUES (1269, 7, '添加资产起钉器', 'admin/goods/addGoods', '1.202.254.70', 1583717617);
INSERT INTO `vm_user_log` VALUES (1270, 7, '添加资产文件架', 'admin/goods/addGoods', '1.202.254.70', 1583717668);
INSERT INTO `vm_user_log` VALUES (1271, 7, '添加资产小胶带', 'admin/goods/addGoods', '1.202.254.70', 1583717754);
INSERT INTO `vm_user_log` VALUES (1272, 7, '添加资产激光笔', 'admin/goods/addGoods', '1.202.254.70', 1583717852);
INSERT INTO `vm_user_log` VALUES (1273, 7, '添加资产5号电池', 'admin/goods/addGoods', '1.202.254.70', 1583717899);
INSERT INTO `vm_user_log` VALUES (1274, 7, '添加资产纸杯', 'admin/goods/addGoods', '1.202.254.70', 1583717950);
INSERT INTO `vm_user_log` VALUES (1275, 7, '添加资产一次性饭盒', 'admin/goods/addGoods', '1.202.254.70', 1583717991);
INSERT INTO `vm_user_log` VALUES (1276, 7, '添加资产纽扣电池', 'admin/goods/addGoods', '1.202.254.70', 1583718076);
INSERT INTO `vm_user_log` VALUES (1277, 7, '添加资产水', 'admin/goods/addGoods', '1.202.254.70', 1583718109);
INSERT INTO `vm_user_log` VALUES (1278, 7, '添加资产铅笔', 'admin/goods/addGoods', '1.202.254.70', 1583718147);
INSERT INTO `vm_user_log` VALUES (1279, 7, '添加资产除胶剂', 'admin/goods/addGoods', '1.202.254.70', 1583718226);
INSERT INTO `vm_user_log` VALUES (1280, 1, '登陆系统', 'admin/login/login', '124.126.166.90', 1583720253);
INSERT INTO `vm_user_log` VALUES (1281, 1, '添加仓库代购仓库', 'admin/goods/addStorehouse', '124.126.166.90', 1583721222);
INSERT INTO `vm_user_log` VALUES (1282, 1, '编辑客户客户代购专用', 'admin/member/editMember', '124.126.166.90', 1583721340);
INSERT INTO `vm_user_log` VALUES (1283, 1, '京N3NN02 成功购买保险', 'admin/moduls.moduls_cars/buy', '124.126.166.90', 1583725428);
INSERT INTO `vm_user_log` VALUES (1284, 1, '京ADJ0252 成功购买保险', 'admin/moduls.moduls_cars/buy', '124.126.166.90', 1583726927);
INSERT INTO `vm_user_log` VALUES (1285, 1, '京N3GQ62 成功购买保险', 'admin/moduls.moduls_cars/buy', '124.126.166.90', 1583727492);
INSERT INTO `vm_user_log` VALUES (1286, 8, '登陆系统', 'admin/login/login', '223.104.3.6', 1583730087);
INSERT INTO `vm_user_log` VALUES (1287, 4, '登陆系统', 'admin/login/login', '124.126.166.90', 1583732717);
INSERT INTO `vm_user_log` VALUES (1288, 8, '登陆系统', 'admin/login/login', '124.126.166.90', 1583734272);
INSERT INTO `vm_user_log` VALUES (1289, 1, '京N63J56 成功购买保险', 'admin/moduls.moduls_cars/buy', '124.126.166.90', 1583734654);
INSERT INTO `vm_user_log` VALUES (1290, 1, '京ADJ0252 成功购买保险', 'admin/moduls.moduls_cars/buy', '124.126.166.90', 1583734747);
INSERT INTO `vm_user_log` VALUES (1291, 1, '京N63J56 成功购买保险', 'admin/moduls.moduls_cars/buy', '124.126.166.90', 1583735070);
INSERT INTO `vm_user_log` VALUES (1292, 1, '京PRQ866 成功购买保险', 'admin/moduls.moduls_cars/buy', '124.126.166.90', 1583735161);
INSERT INTO `vm_user_log` VALUES (1293, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.166.90', 1583735230);
INSERT INTO `vm_user_log` VALUES (1294, 1, '注销系统', 'admin/login/logout', '1.202.254.70', 1583804627);
INSERT INTO `vm_user_log` VALUES (1295, 6, '登陆系统', 'admin/login/login', '1.202.254.70', 1583804640);
INSERT INTO `vm_user_log` VALUES (1296, 6, '注销系统', 'admin/login/logout', '1.202.254.70', 1583804647);
INSERT INTO `vm_user_log` VALUES (1297, 6, '登陆系统', 'admin/login/login', '1.202.254.70', 1583804669);
INSERT INTO `vm_user_log` VALUES (1298, 6, '登陆系统', 'admin/login/login', '1.202.254.70', 1583805005);
INSERT INTO `vm_user_log` VALUES (1299, 6, '登陆系统', 'admin/login/login', '1.202.254.70', 1583807461);
INSERT INTO `vm_user_log` VALUES (1300, 6, '登陆系统', 'admin/login/login', '1.202.254.70', 1583808047);
INSERT INTO `vm_user_log` VALUES (1301, 6, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583810229);
INSERT INTO `vm_user_log` VALUES (1302, 6, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1583810359);
INSERT INTO `vm_user_log` VALUES (1303, 6, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583810410);
INSERT INTO `vm_user_log` VALUES (1304, 6, '派车用车成功', 'admin/moduls.moduls_cars/use', '1.202.254.70', 1583810518);
INSERT INTO `vm_user_log` VALUES (1305, 6, '注销系统', 'admin/login/logout', '1.202.254.70', 1583810567);
INSERT INTO `vm_user_log` VALUES (1306, 1, '登陆系统', 'admin/login/login', '1.202.254.70', 1583810598);
INSERT INTO `vm_user_log` VALUES (1307, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1583810650);
INSERT INTO `vm_user_log` VALUES (1308, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '1.202.254.70', 1583812235);
INSERT INTO `vm_user_log` VALUES (1309, 7, '登陆系统', 'admin/login/login', '1.202.254.70', 1583818360);
INSERT INTO `vm_user_log` VALUES (1310, 7, '添加供应商汇国康低价药店', 'admin/goods/addSupplier', '1.202.254.70', 1583818581);
INSERT INTO `vm_user_log` VALUES (1311, 7, '添加供应商嘉事堂连锁药店', 'admin/goods/addSupplier', '1.202.254.70', 1583819023);
INSERT INTO `vm_user_log` VALUES (1312, 7, '添加供应商修车所', 'admin/goods/addSupplier', '1.202.254.70', 1583819220);
INSERT INTO `vm_user_log` VALUES (1313, 7, '添加供应商金地花卉A区9号', 'admin/goods/addSupplier', '1.202.254.70', 1583819598);
INSERT INTO `vm_user_log` VALUES (1314, 7, '添加供应商三楼打印机店', 'admin/goods/addSupplier', '1.202.254.70', 1583819825);
INSERT INTO `vm_user_log` VALUES (1315, 7, '添加供应商天鑫顺业', 'admin/goods/addSupplier', '1.202.254.70', 1583820920);
INSERT INTO `vm_user_log` VALUES (1316, 6, '登陆系统', 'admin/login/login', '1.202.254.70', 1583825774);
INSERT INTO `vm_user_log` VALUES (1317, 7, '修改供应商好美都汽配城', 'admin/goods/editSupplier', '1.202.254.70', 1583826666);
INSERT INTO `vm_user_log` VALUES (1318, 7, '修改供应商西三旗商城', 'admin/goods/editSupplier', '1.202.254.70', 1583826717);
INSERT INTO `vm_user_log` VALUES (1319, 7, '修改供应商中关村科贸大厦', 'admin/goods/editSupplier', '1.202.254.70', 1583827067);
INSERT INTO `vm_user_log` VALUES (1320, 7, '添加供应商米兰春天', 'admin/goods/addSupplier', '1.202.254.70', 1583828699);
INSERT INTO `vm_user_log` VALUES (1321, 7, '修改供应商办公耗材', 'admin/goods/editSupplier', '1.202.254.70', 1583828769);
INSERT INTO `vm_user_log` VALUES (1322, 7, '修改供应商塑料家居(劳保)', 'admin/goods/editSupplier', '1.202.254.70', 1583828853);
INSERT INTO `vm_user_log` VALUES (1323, 7, '修改供应商嘉事堂连锁药店', 'admin/goods/editSupplier', '1.202.254.70', 1583829335);
INSERT INTO `vm_user_log` VALUES (1324, 7, '添加供应商回龙观建材城', 'admin/goods/addSupplier', '1.202.254.70', 1583829654);
INSERT INTO `vm_user_log` VALUES (1325, 7, '添加供应商小营建材城', 'admin/goods/addSupplier', '1.202.254.70', 1583829824);
INSERT INTO `vm_user_log` VALUES (1326, 7, '添加供应商玉泉营建材城', 'admin/goods/addSupplier', '1.202.254.70', 1583830064);
INSERT INTO `vm_user_log` VALUES (1327, 7, '添加供应商景秀大地', 'admin/goods/addSupplier', '1.202.254.70', 1583830098);
INSERT INTO `vm_user_log` VALUES (1328, 7, '添加供应商远洋灯具城', 'admin/goods/addSupplier', '1.202.254.70', 1583830145);
INSERT INTO `vm_user_log` VALUES (1329, 7, '添加供应商十里河灯具城', 'admin/goods/addSupplier', '1.202.254.70', 1583830199);
INSERT INTO `vm_user_log` VALUES (1330, 7, '添加供应商水屯建材城', 'admin/goods/addSupplier', '1.202.254.70', 1583830251);
INSERT INTO `vm_user_log` VALUES (1331, 7, '登陆系统', 'admin/login/login', '1.202.254.70', 1583889983);
INSERT INTO `vm_user_log` VALUES (1332, 1, '销售订单（VM_20200302-4-135）成功保存', 'admin/sales/editSales', '124.126.166.90', 1583898434);
INSERT INTO `vm_user_log` VALUES (1333, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.166.90', 1583914036);
INSERT INTO `vm_user_log` VALUES (1334, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.166.90', 1583914079);
INSERT INTO `vm_user_log` VALUES (1335, 5, '登陆系统', 'admin/login/login', '124.126.160.63', 1583917502);
INSERT INTO `vm_user_log` VALUES (1336, 1, '添加分类防疫物业类', 'admin/goods/addCategory', '124.126.160.63', 1583922758);
INSERT INTO `vm_user_log` VALUES (1337, 1, '编辑资产（ID：21）', 'admin/goods/editCategory', '124.126.160.63', 1583923170);
INSERT INTO `vm_user_log` VALUES (1338, 1, '登陆系统', 'admin/login/login', '120.244.234.27', 1583929778);
INSERT INTO `vm_user_log` VALUES (1339, 6, '登陆系统', 'admin/login/login', '1.202.254.70', 1583975881);
INSERT INTO `vm_user_log` VALUES (1340, 7, '登陆系统', 'admin/login/login', '1.202.254.70', 1583975915);
INSERT INTO `vm_user_log` VALUES (1341, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.171.105', 1583976086);
INSERT INTO `vm_user_log` VALUES (1342, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1583977240);
INSERT INTO `vm_user_log` VALUES (1343, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.171.105', 1583977570);
INSERT INTO `vm_user_log` VALUES (1344, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.171.105', 1583977604);
INSERT INTO `vm_user_log` VALUES (1345, 6, '登陆系统', 'admin/login/login', '124.126.171.105', 1583977973);
INSERT INTO `vm_user_log` VALUES (1346, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.171.105', 1583978678);
INSERT INTO `vm_user_log` VALUES (1347, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.171.105', 1583978764);
INSERT INTO `vm_user_log` VALUES (1348, 7, '订单（VM_20200306-7-146）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583981755);
INSERT INTO `vm_user_log` VALUES (1349, 7, '订单（VM_20200312-7-148）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583981909);
INSERT INTO `vm_user_log` VALUES (1350, 7, '订单（VM_20200312-7-149）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583981952);
INSERT INTO `vm_user_log` VALUES (1351, 7, '添加供应商集美家居', 'admin/goods/addSupplier', '1.202.254.70', 1583982139);
INSERT INTO `vm_user_log` VALUES (1352, 7, '订单（VM_20200312-7-150）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982202);
INSERT INTO `vm_user_log` VALUES (1353, 7, '订单（VM_20200312-7-151）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982265);
INSERT INTO `vm_user_log` VALUES (1354, 7, '订单（VM_20200312-7-152）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982378);
INSERT INTO `vm_user_log` VALUES (1355, 7, '订单（VM_20200312-7-153）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982677);
INSERT INTO `vm_user_log` VALUES (1356, 7, '订单（VM_20200312-7-154）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982741);
INSERT INTO `vm_user_log` VALUES (1357, 7, '订单（VM_20200312-7-155）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982813);
INSERT INTO `vm_user_log` VALUES (1358, 7, '订单（VM_20200312-7-155）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982813);
INSERT INTO `vm_user_log` VALUES (1359, 7, '订单（VM_20200312-7-156）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982892);
INSERT INTO `vm_user_log` VALUES (1360, 7, '订单（VM_20200312-7-157）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583982954);
INSERT INTO `vm_user_log` VALUES (1361, 7, '订单（VM_20200312-7-158）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583983043);
INSERT INTO `vm_user_log` VALUES (1362, 7, '订单（VM_20200312-7-159）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583983194);
INSERT INTO `vm_user_log` VALUES (1363, 7, '订单（VM_20200312-7-160）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583983331);
INSERT INTO `vm_user_log` VALUES (1364, 1, '销售订单（VM_20200223-1-5）成功保存', 'admin/sales/editSales', '124.126.171.105', 1583983536);
INSERT INTO `vm_user_log` VALUES (1365, 7, '修改供应商集美家居', 'admin/goods/editSupplier', '1.202.254.70', 1583984041);
INSERT INTO `vm_user_log` VALUES (1366, 1, '单据（VM_20200224-1-69）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1583984072);
INSERT INTO `vm_user_log` VALUES (1367, 1, '单据（VM_20200224-1-71）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1583984080);
INSERT INTO `vm_user_log` VALUES (1368, 1, '单据（VM_20200224-1-72）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1583984089);
INSERT INTO `vm_user_log` VALUES (1369, 1, '单据（VM_20200224-1-73）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1583984095);
INSERT INTO `vm_user_log` VALUES (1370, 7, '修改供应商锦绣大地', 'admin/goods/editSupplier', '1.202.254.70', 1583984128);
INSERT INTO `vm_user_log` VALUES (1371, 1, '单据（VM_20200224-1-74）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1583984133);
INSERT INTO `vm_user_log` VALUES (1372, 1, '单据（VM_20200224-1-75）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1583984150);
INSERT INTO `vm_user_log` VALUES (1373, 1, '单据（VM_20200224-1-76）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1583984172);
INSERT INTO `vm_user_log` VALUES (1374, 7, '订单（VM_20200224-1-69）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583984342);
INSERT INTO `vm_user_log` VALUES (1375, 7, '订单（VM_20200312-7-159）成功保存', 'admin/storage/addStorage', '1.202.254.70', 1583984570);
INSERT INTO `vm_user_log` VALUES (1376, 7, '登陆系统', 'admin/login/login', '124.126.171.105', 1583984973);
INSERT INTO `vm_user_log` VALUES (1377, 7, '订单（VM_20200312-7-160）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583985394);
INSERT INTO `vm_user_log` VALUES (1378, 7, '订单（VM_20200312-7-162）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583985500);
INSERT INTO `vm_user_log` VALUES (1379, 7, '订单（VM_20200312-7-163）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583985575);
INSERT INTO `vm_user_log` VALUES (1380, 7, '订单（VM_20200312-7-164）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583992561);
INSERT INTO `vm_user_log` VALUES (1381, 7, '订单（VM_20200312-7-165）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583993518);
INSERT INTO `vm_user_log` VALUES (1382, 7, '订单（VM_20200312-7-166）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583993675);
INSERT INTO `vm_user_log` VALUES (1383, 7, '订单（VM_20200312-7-167）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583993755);
INSERT INTO `vm_user_log` VALUES (1384, 7, '订单（VM_20200312-7-168）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583993818);
INSERT INTO `vm_user_log` VALUES (1385, 7, '订单（VM_20200312-7-169）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583993879);
INSERT INTO `vm_user_log` VALUES (1386, 7, '订单（VM_20200312-7-170）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583993929);
INSERT INTO `vm_user_log` VALUES (1387, 7, '订单（VM_20200312-7-171）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583993989);
INSERT INTO `vm_user_log` VALUES (1388, 7, '订单（VM_20200312-7-172）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583994508);
INSERT INTO `vm_user_log` VALUES (1389, 7, '订单（VM_20200312-7-173）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583994562);
INSERT INTO `vm_user_log` VALUES (1390, 7, '订单（VM_20200312-7-174）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583994616);
INSERT INTO `vm_user_log` VALUES (1391, 7, '订单（VM_20200312-7-175）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583994702);
INSERT INTO `vm_user_log` VALUES (1392, 7, '订单（VM_20200312-7-176）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583994854);
INSERT INTO `vm_user_log` VALUES (1393, 7, '订单（VM_20200312-7-177）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583994908);
INSERT INTO `vm_user_log` VALUES (1394, 7, '订单（VM_20200312-7-178）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1583994979);
INSERT INTO `vm_user_log` VALUES (1395, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.171.105', 1584002959);
INSERT INTO `vm_user_log` VALUES (1396, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.171.105', 1584003045);
INSERT INTO `vm_user_log` VALUES (1397, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.171.105', 1584003100);
INSERT INTO `vm_user_log` VALUES (1398, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.171.105', 1584003190);
INSERT INTO `vm_user_log` VALUES (1399, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.171.105', 1584003233);
INSERT INTO `vm_user_log` VALUES (1400, 7, '订单（VM_20200312-7-179）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584003989);
INSERT INTO `vm_user_log` VALUES (1401, 7, '订单（VM_20200312-7-180）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584004079);
INSERT INTO `vm_user_log` VALUES (1402, 7, '订单（VM_20200312-7-181）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584004138);
INSERT INTO `vm_user_log` VALUES (1403, 7, '订单（VM_20200312-7-182）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584004243);
INSERT INTO `vm_user_log` VALUES (1404, 7, '订单（VM_20200312-7-183）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584004497);
INSERT INTO `vm_user_log` VALUES (1405, 7, '订单（VM_20200312-7-184）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584004653);
INSERT INTO `vm_user_log` VALUES (1406, 6, '登陆系统', 'admin/login/login', '124.126.171.105', 1584005562);
INSERT INTO `vm_user_log` VALUES (1407, 7, '登陆POS系统', 'index/login/login', '124.126.171.105', 1584059823);
INSERT INTO `vm_user_log` VALUES (1408, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.171.105', 1584061534);
INSERT INTO `vm_user_log` VALUES (1409, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.171.105', 1584061585);
INSERT INTO `vm_user_log` VALUES (1410, 7, '登陆系统', 'admin/login/login', '124.126.171.105', 1584068935);
INSERT INTO `vm_user_log` VALUES (1411, 1, '登陆系统', 'admin/login/login', '124.126.171.105', 1584069878);
INSERT INTO `vm_user_log` VALUES (1412, 1, '登陆系统', 'admin/login/login', '111.35.24.113', 1584069910);
INSERT INTO `vm_user_log` VALUES (1413, 7, '订单（VM_20200312-7-185）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584070119);
INSERT INTO `vm_user_log` VALUES (1414, 1, '审核单据（:VM_20200312-7-185）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584070674);
INSERT INTO `vm_user_log` VALUES (1415, 1, '审核单据（:VM_20200312-7-183）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584070746);
INSERT INTO `vm_user_log` VALUES (1416, 1, '审核单据（:VM_20200312-7-182）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584070803);
INSERT INTO `vm_user_log` VALUES (1417, 1, '采购订单（VM_20200312-7-181）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584070873);
INSERT INTO `vm_user_log` VALUES (1418, 1, '审核单据（:VM_20200312-7-181）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584070994);
INSERT INTO `vm_user_log` VALUES (1419, 1, '审核单据（:VM_20200312-7-180）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071050);
INSERT INTO `vm_user_log` VALUES (1420, 1, '审核单据（:VM_20200312-7-179）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071101);
INSERT INTO `vm_user_log` VALUES (1421, 1, '审核单据（:VM_20200312-7-178）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071120);
INSERT INTO `vm_user_log` VALUES (1422, 1, '审核单据（:VM_20200312-7-177）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071168);
INSERT INTO `vm_user_log` VALUES (1423, 1, '审核单据（:VM_20200312-7-176）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071218);
INSERT INTO `vm_user_log` VALUES (1424, 1, '审核单据（:VM_20200312-7-175）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071247);
INSERT INTO `vm_user_log` VALUES (1425, 1, '采购订单（VM_20200312-7-174）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584071277);
INSERT INTO `vm_user_log` VALUES (1426, 1, '审核单据（:VM_20200312-7-174）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071288);
INSERT INTO `vm_user_log` VALUES (1427, 1, '审核单据（:VM_20200312-7-173）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071332);
INSERT INTO `vm_user_log` VALUES (1428, 1, '审核单据（:VM_20200312-7-172）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071352);
INSERT INTO `vm_user_log` VALUES (1429, 1, '审核单据（:VM_20200312-7-171）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071481);
INSERT INTO `vm_user_log` VALUES (1430, 1, '审核单据（:VM_20200312-7-170）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071506);
INSERT INTO `vm_user_log` VALUES (1431, 1, '审核单据（:VM_20200312-7-169）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071531);
INSERT INTO `vm_user_log` VALUES (1432, 1, '采购订单（VM_20200312-7-168）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584071571);
INSERT INTO `vm_user_log` VALUES (1433, 1, '审核单据（:VM_20200312-7-168）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071583);
INSERT INTO `vm_user_log` VALUES (1434, 1, '采购订单（VM_20200312-7-167）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584071663);
INSERT INTO `vm_user_log` VALUES (1435, 1, '审核单据（:VM_20200312-7-167）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071711);
INSERT INTO `vm_user_log` VALUES (1436, 1, '采购订单（VM_20200312-7-166）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584071731);
INSERT INTO `vm_user_log` VALUES (1437, 1, '审核单据（:VM_20200312-7-166）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071741);
INSERT INTO `vm_user_log` VALUES (1438, 1, '审核单据（:VM_20200312-7-166）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071741);
INSERT INTO `vm_user_log` VALUES (1439, 1, '审核单据（:VM_20200312-7-166）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071741);
INSERT INTO `vm_user_log` VALUES (1440, 1, '采购订单（VM_20200312-7-165）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584071838);
INSERT INTO `vm_user_log` VALUES (1441, 1, '审核单据（:VM_20200312-7-165）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071844);
INSERT INTO `vm_user_log` VALUES (1442, 1, '采购订单（VM_20200312-7-164）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584071872);
INSERT INTO `vm_user_log` VALUES (1443, 1, '审核单据（:VM_20200312-7-164）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071887);
INSERT INTO `vm_user_log` VALUES (1444, 1, '审核单据（:VM_20200312-7-164）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071887);
INSERT INTO `vm_user_log` VALUES (1445, 1, '采购订单（VM_20200312-7-163）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584071977);
INSERT INTO `vm_user_log` VALUES (1446, 1, '审核单据（:VM_20200312-7-163）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584071985);
INSERT INTO `vm_user_log` VALUES (1447, 1, '采购订单（VM_20200312-7-160）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584072254);
INSERT INTO `vm_user_log` VALUES (1448, 1, '审核单据（:VM_20200312-7-160）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072269);
INSERT INTO `vm_user_log` VALUES (1449, 1, '采购订单（VM_20200312-7-162）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584072320);
INSERT INTO `vm_user_log` VALUES (1450, 1, '审核单据（:VM_20200312-7-162）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072325);
INSERT INTO `vm_user_log` VALUES (1451, 1, '采购订单（VM_20200312-7-159）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584072373);
INSERT INTO `vm_user_log` VALUES (1452, 1, '审核单据（:VM_20200312-7-159）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072385);
INSERT INTO `vm_user_log` VALUES (1453, 1, '审核单据（:VM_20200312-7-158）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072410);
INSERT INTO `vm_user_log` VALUES (1454, 1, '采购订单（VM_20200312-7-157）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584072579);
INSERT INTO `vm_user_log` VALUES (1455, 1, '审核单据（:VM_20200312-7-157）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072588);
INSERT INTO `vm_user_log` VALUES (1456, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072654);
INSERT INTO `vm_user_log` VALUES (1457, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072654);
INSERT INTO `vm_user_log` VALUES (1458, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072654);
INSERT INTO `vm_user_log` VALUES (1459, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072655);
INSERT INTO `vm_user_log` VALUES (1460, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072655);
INSERT INTO `vm_user_log` VALUES (1461, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072655);
INSERT INTO `vm_user_log` VALUES (1462, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072655);
INSERT INTO `vm_user_log` VALUES (1463, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072655);
INSERT INTO `vm_user_log` VALUES (1464, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072655);
INSERT INTO `vm_user_log` VALUES (1465, 1, '审核单据（:VM_20200312-7-155）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584072673);
INSERT INTO `vm_user_log` VALUES (1466, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584083026);
INSERT INTO `vm_user_log` VALUES (1467, 4, '销售单（VM_20200223-1-3）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584083312);
INSERT INTO `vm_user_log` VALUES (1468, 4, '销售单（VM_20200223-1-4）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584083439);
INSERT INTO `vm_user_log` VALUES (1469, 4, '销售单（VM_20200223-1-12）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584083803);
INSERT INTO `vm_user_log` VALUES (1470, 4, '销售单（VM_20200302-4-137）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084054);
INSERT INTO `vm_user_log` VALUES (1471, 4, '销售单（VM_20200313-4-187）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084157);
INSERT INTO `vm_user_log` VALUES (1472, 4, '销售单（VM_20200313-4-188）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084209);
INSERT INTO `vm_user_log` VALUES (1473, 4, '销售单（VM_20200313-4-189）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084310);
INSERT INTO `vm_user_log` VALUES (1474, 4, '销售单（VM_20200313-4-190）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084376);
INSERT INTO `vm_user_log` VALUES (1475, 4, '销售单（VM_20200313-4-191）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084435);
INSERT INTO `vm_user_log` VALUES (1476, 4, '销售单（VM_20200313-4-192）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084489);
INSERT INTO `vm_user_log` VALUES (1477, 4, '销售单（VM_20200313-4-193）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084597);
INSERT INTO `vm_user_log` VALUES (1478, 4, '销售单（VM_20200313-4-194）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084689);
INSERT INTO `vm_user_log` VALUES (1479, 4, '销售单（VM_20200313-4-195）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584084735);
INSERT INTO `vm_user_log` VALUES (1480, 1, '单据（VM_20200312-7-184）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584089121);
INSERT INTO `vm_user_log` VALUES (1481, 1, '单据（VM_20200229-3-124）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584089152);
INSERT INTO `vm_user_log` VALUES (1482, 1, '单据（VM_20200306-7-142）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584089154);
INSERT INTO `vm_user_log` VALUES (1483, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584089200);
INSERT INTO `vm_user_log` VALUES (1484, 1, '采购订单（VM_20200312-7-154）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584089249);
INSERT INTO `vm_user_log` VALUES (1485, 1, '审核单据（:VM_20200312-7-154）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584089254);
INSERT INTO `vm_user_log` VALUES (1486, 1, '采购订单（VM_20200312-7-153）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584089274);
INSERT INTO `vm_user_log` VALUES (1487, 1, '审核单据（:VM_20200312-7-153）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584089278);
INSERT INTO `vm_user_log` VALUES (1488, 1, '采购订单（VM_20200312-7-152）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584089297);
INSERT INTO `vm_user_log` VALUES (1489, 1, '审核单据（:VM_20200312-7-152）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584089305);
INSERT INTO `vm_user_log` VALUES (1490, 1, '采购订单（VM_20200312-7-151）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584089320);
INSERT INTO `vm_user_log` VALUES (1491, 1, '审核单据（:VM_20200312-7-151）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584089334);
INSERT INTO `vm_user_log` VALUES (1492, 1, '采购订单（VM_20200312-7-150）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584089387);
INSERT INTO `vm_user_log` VALUES (1493, 7, '登陆系统', 'admin/login/login', '124.126.171.105', 1584089390);
INSERT INTO `vm_user_log` VALUES (1494, 1, '审核单据（:VM_20200312-7-150）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584089421);
INSERT INTO `vm_user_log` VALUES (1495, 1, '采购订单（VM_20200312-7-149）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584089455);
INSERT INTO `vm_user_log` VALUES (1496, 1, '审核单据（:VM_20200312-7-149）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584089468);
INSERT INTO `vm_user_log` VALUES (1497, 7, '添加资产体温计', 'admin/goods/addGoods', '124.126.171.105', 1584089496);
INSERT INTO `vm_user_log` VALUES (1498, 1, '采购订单（VM_20200312-7-148）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584089515);
INSERT INTO `vm_user_log` VALUES (1499, 1, '审核单据（:VM_20200312-7-148）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584089523);
INSERT INTO `vm_user_log` VALUES (1500, 1, '采购订单（VM_20200306-7-146）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584089549);
INSERT INTO `vm_user_log` VALUES (1501, 1, '审核单据（:VM_20200306-7-146）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584089556);
INSERT INTO `vm_user_log` VALUES (1502, 1, '单据（VM_20200306-7-145）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584089570);
INSERT INTO `vm_user_log` VALUES (1503, 1, '单据（VM_20200306-7-144）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584089573);
INSERT INTO `vm_user_log` VALUES (1504, 1, '单据（VM_20200306-7-143）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584089576);
INSERT INTO `vm_user_log` VALUES (1505, 7, '订单（VM_20200313-7-186）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584089998);
INSERT INTO `vm_user_log` VALUES (1506, 7, '登陆系统', 'admin/login/login', '124.126.171.105', 1584091150);
INSERT INTO `vm_user_log` VALUES (1507, 7, '添加供应商北京益民阳光医药销售有限公司', 'admin/goods/addSupplier', '124.126.171.105', 1584091516);
INSERT INTO `vm_user_log` VALUES (1508, 7, '采购订单（VM_20200313-7-186）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584091534);
INSERT INTO `vm_user_log` VALUES (1509, 1, '登陆系统', 'admin/login/login', '111.35.24.113', 1584157046);
INSERT INTO `vm_user_log` VALUES (1510, 1, '登陆系统', 'admin/login/login', '111.35.24.113', 1584157162);
INSERT INTO `vm_user_log` VALUES (1511, 1, '订单（VM_20200313-7-197）成功保存', 'admin/storage/addStorage', '111.35.24.113', 1584171485);
INSERT INTO `vm_user_log` VALUES (1512, 1, '登陆系统', 'admin/login/login', '120.244.234.169', 1584181799);
INSERT INTO `vm_user_log` VALUES (1513, 1, '注销系统', 'admin/login/logout', '120.244.234.169', 1584202106);
INSERT INTO `vm_user_log` VALUES (1514, 1, '登陆系统', 'admin/login/login', '120.244.234.169', 1584202129);
INSERT INTO `vm_user_log` VALUES (1515, 1, '注销系统', 'admin/login/logout', '120.244.234.169', 1584202168);
INSERT INTO `vm_user_log` VALUES (1516, 1, '登陆系统', 'admin/login/login', '120.244.234.169', 1584202187);
INSERT INTO `vm_user_log` VALUES (1517, 7, '登陆系统', 'admin/login/login', '124.126.171.105', 1584327138);
INSERT INTO `vm_user_log` VALUES (1518, 7, '添加资产风机盘管', 'admin/goods/addGoods', '124.126.171.105', 1584327308);
INSERT INTO `vm_user_log` VALUES (1519, 7, '添加供应商德州鑫金空调设备有限公司', 'admin/goods/addSupplier', '124.126.171.105', 1584327495);
INSERT INTO `vm_user_log` VALUES (1520, 1, '采购订单（VM_20200313-7-197）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584329420);
INSERT INTO `vm_user_log` VALUES (1521, 1, '采购订单（VM_20200313-7-197）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584329452);
INSERT INTO `vm_user_log` VALUES (1522, 1, '单据（VM_20200313-7-197）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584329516);
INSERT INTO `vm_user_log` VALUES (1523, 1, '登陆系统', 'admin/login/login', '222.240.57.60', 1584370760);
INSERT INTO `vm_user_log` VALUES (1524, 1, '登陆系统', 'admin/login/login', '120.244.234.169', 1584370806);
INSERT INTO `vm_user_log` VALUES (1525, 1, '订单（VM_20200314-1-198）成功保存', 'admin/storage/addStorage', '120.244.234.169', 1584374560);
INSERT INTO `vm_user_log` VALUES (1526, 6, '登陆系统', 'admin/login/login', '124.126.171.105', 1584424117);
INSERT INTO `vm_user_log` VALUES (1527, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584425416);
INSERT INTO `vm_user_log` VALUES (1528, 6, '登陆系统', 'admin/login/login', '124.126.171.105', 1584433281);
INSERT INTO `vm_user_log` VALUES (1529, 1, '单据（VM_20200314-1-198）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584435598);
INSERT INTO `vm_user_log` VALUES (1530, 1, '单据（VM_20200224-1-70）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584435616);
INSERT INTO `vm_user_log` VALUES (1531, 6, '登陆系统', 'admin/login/login', '124.126.171.105', 1584437702);
INSERT INTO `vm_user_log` VALUES (1532, 6, '登陆系统', 'admin/login/login', '124.126.171.105', 1584493268);
INSERT INTO `vm_user_log` VALUES (1533, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584495413);
INSERT INTO `vm_user_log` VALUES (1534, 4, '销售单（VM_20200313-4-196）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584498310);
INSERT INTO `vm_user_log` VALUES (1535, 4, '销售单（VM_20200318-4-200）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584498542);
INSERT INTO `vm_user_log` VALUES (1536, 4, '销售单（VM_20200318-4-201）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584498645);
INSERT INTO `vm_user_log` VALUES (1537, 4, '销售单（VM_20200318-4-202）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584498784);
INSERT INTO `vm_user_log` VALUES (1538, 4, '销售单（VM_20200318-4-203）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584498830);
INSERT INTO `vm_user_log` VALUES (1539, 4, '销售单（VM_20200318-4-204）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584498911);
INSERT INTO `vm_user_log` VALUES (1540, 4, '销售单（VM_20200318-4-205）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584498997);
INSERT INTO `vm_user_log` VALUES (1541, 4, '销售单（VM_20200318-4-206）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584499051);
INSERT INTO `vm_user_log` VALUES (1542, 4, '销售单（VM_20200318-4-207）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584499086);
INSERT INTO `vm_user_log` VALUES (1543, 4, '销售单（VM_20200318-4-208）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584499149);
INSERT INTO `vm_user_log` VALUES (1544, 4, '销售单（VM_20200318-4-209）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584499190);
INSERT INTO `vm_user_log` VALUES (1545, 4, '销售单（VM_20200318-4-210）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584499337);
INSERT INTO `vm_user_log` VALUES (1546, 4, '销售单（VM_20200318-4-211）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584499396);
INSERT INTO `vm_user_log` VALUES (1547, 4, '销售单（VM_20200318-4-212）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584499451);
INSERT INTO `vm_user_log` VALUES (1548, 4, '销售单（VM_20200318-4-213）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584499484);
INSERT INTO `vm_user_log` VALUES (1549, 4, '销售单（VM_20200318-4-214）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584500854);
INSERT INTO `vm_user_log` VALUES (1550, 4, '销售单（VM_20200318-4-215）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503008);
INSERT INTO `vm_user_log` VALUES (1551, 4, '销售单（VM_20200318-4-216）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503045);
INSERT INTO `vm_user_log` VALUES (1552, 4, '销售单（VM_20200318-4-217）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503175);
INSERT INTO `vm_user_log` VALUES (1553, 4, '销售单（VM_20200318-4-218）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503213);
INSERT INTO `vm_user_log` VALUES (1554, 4, '销售单（VM_20200318-4-219）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503249);
INSERT INTO `vm_user_log` VALUES (1555, 4, '销售单（VM_20200318-4-220）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503361);
INSERT INTO `vm_user_log` VALUES (1556, 4, '销售单（VM_20200318-4-221）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503414);
INSERT INTO `vm_user_log` VALUES (1557, 4, '销售单（VM_20200318-4-222）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503485);
INSERT INTO `vm_user_log` VALUES (1558, 4, '销售单（VM_20200318-4-223）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503604);
INSERT INTO `vm_user_log` VALUES (1559, 4, '销售单（VM_20200318-4-224）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503686);
INSERT INTO `vm_user_log` VALUES (1560, 4, '销售单（VM_20200318-4-225）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503763);
INSERT INTO `vm_user_log` VALUES (1561, 4, '销售单（VM_20200318-4-226）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584503832);
INSERT INTO `vm_user_log` VALUES (1562, 4, '销售单（VM_20200318-4-227）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508004);
INSERT INTO `vm_user_log` VALUES (1563, 4, '销售单（VM_20200318-4-228）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508234);
INSERT INTO `vm_user_log` VALUES (1564, 4, '销售单（VM_20200318-4-229）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508326);
INSERT INTO `vm_user_log` VALUES (1565, 4, '销售单（VM_20200318-4-230）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508505);
INSERT INTO `vm_user_log` VALUES (1566, 4, '销售单（VM_20200318-4-231）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508562);
INSERT INTO `vm_user_log` VALUES (1567, 4, '销售单（VM_20200318-4-232）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508603);
INSERT INTO `vm_user_log` VALUES (1568, 4, '销售单（VM_20200318-4-233）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508665);
INSERT INTO `vm_user_log` VALUES (1569, 4, '销售单（VM_20200318-4-234）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508943);
INSERT INTO `vm_user_log` VALUES (1570, 4, '销售单（VM_20200318-4-235）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584508997);
INSERT INTO `vm_user_log` VALUES (1571, 4, '销售单（VM_20200318-4-236）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584509039);
INSERT INTO `vm_user_log` VALUES (1572, 4, '销售单（VM_20200318-4-237）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584509084);
INSERT INTO `vm_user_log` VALUES (1573, 4, '销售单（VM_20200318-4-238）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584509123);
INSERT INTO `vm_user_log` VALUES (1574, 1, '登陆系统', 'admin/login/login', '124.126.171.105', 1584510824);
INSERT INTO `vm_user_log` VALUES (1575, 1, '派车用车成功', 'admin/moduls.moduls_cars/use', '124.126.171.105', 1584510920);
INSERT INTO `vm_user_log` VALUES (1576, 4, '销售单（VM_20200318-4-239）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584511222);
INSERT INTO `vm_user_log` VALUES (1577, 4, '销售单（VM_20200318-4-240）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584511413);
INSERT INTO `vm_user_log` VALUES (1578, 4, '销售单（VM_20200318-4-241）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584511488);
INSERT INTO `vm_user_log` VALUES (1579, 4, '销售单（VM_20200318-4-242）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584511564);
INSERT INTO `vm_user_log` VALUES (1580, 4, '销售单（VM_20200318-4-243）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584511610);
INSERT INTO `vm_user_log` VALUES (1581, 4, '销售单（VM_20200318-4-244）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584511727);
INSERT INTO `vm_user_log` VALUES (1582, 9, '添加用户dhc', 'admin/user/addUser', '124.126.171.105', 1584515506);
INSERT INTO `vm_user_log` VALUES (1583, 1, '添加角色物业经理', 'admin/user/addRole', '124.126.171.105', 1584515519);
INSERT INTO `vm_user_log` VALUES (1584, 4, '销售单（VM_20200318-4-245）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584517487);
INSERT INTO `vm_user_log` VALUES (1585, 4, '销售单（VM_20200318-4-246）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584517543);
INSERT INTO `vm_user_log` VALUES (1586, 4, '销售单（VM_20200318-4-247）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584517589);
INSERT INTO `vm_user_log` VALUES (1587, 4, '销售单（VM_20200318-4-248）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584517878);
INSERT INTO `vm_user_log` VALUES (1588, 4, '销售单（VM_20200318-4-249）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584517931);
INSERT INTO `vm_user_log` VALUES (1589, 4, '销售单（VM_20200318-4-250）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584517967);
INSERT INTO `vm_user_log` VALUES (1590, 4, '销售单（VM_20200318-4-251）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584517997);
INSERT INTO `vm_user_log` VALUES (1591, 4, '销售单（VM_20200318-4-252）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584518085);
INSERT INTO `vm_user_log` VALUES (1592, 4, '销售单（VM_20200318-4-253）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584518154);
INSERT INTO `vm_user_log` VALUES (1593, 4, '销售单（VM_20200318-4-254）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584518441);
INSERT INTO `vm_user_log` VALUES (1594, 4, '销售单（VM_20200318-4-255）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520492);
INSERT INTO `vm_user_log` VALUES (1595, 4, '销售单（VM_20200318-4-256）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520529);
INSERT INTO `vm_user_log` VALUES (1596, 4, '销售单（VM_20200318-4-257）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520555);
INSERT INTO `vm_user_log` VALUES (1597, 4, '销售单（VM_20200318-4-258）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520593);
INSERT INTO `vm_user_log` VALUES (1598, 4, '销售单（VM_20200318-4-259）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520618);
INSERT INTO `vm_user_log` VALUES (1599, 4, '销售单（VM_20200318-4-260）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520652);
INSERT INTO `vm_user_log` VALUES (1600, 4, '销售单（VM_20200318-4-261）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520688);
INSERT INTO `vm_user_log` VALUES (1601, 4, '销售单（VM_20200318-4-262）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520725);
INSERT INTO `vm_user_log` VALUES (1602, 4, '销售单（VM_20200318-4-263）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520756);
INSERT INTO `vm_user_log` VALUES (1603, 4, '销售单（VM_20200318-4-264）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520786);
INSERT INTO `vm_user_log` VALUES (1604, 4, '销售单（VM_20200318-4-265）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520838);
INSERT INTO `vm_user_log` VALUES (1605, 4, '销售单（VM_20200318-4-266）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520860);
INSERT INTO `vm_user_log` VALUES (1606, 4, '销售单（VM_20200318-4-267）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584520995);
INSERT INTO `vm_user_log` VALUES (1607, 4, '销售单（VM_20200318-4-268）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521194);
INSERT INTO `vm_user_log` VALUES (1608, 4, '销售单（VM_20200318-4-269）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521248);
INSERT INTO `vm_user_log` VALUES (1609, 4, '销售单（VM_20200318-4-270）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521334);
INSERT INTO `vm_user_log` VALUES (1610, 4, '销售订单（VM_20200318-4-270）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584521351);
INSERT INTO `vm_user_log` VALUES (1611, 4, '销售订单（VM_20200318-4-270）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584521369);
INSERT INTO `vm_user_log` VALUES (1612, 4, '销售订单（VM_20200318-4-270）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584521373);
INSERT INTO `vm_user_log` VALUES (1613, 4, '销售单（VM_20200318-4-271）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521420);
INSERT INTO `vm_user_log` VALUES (1614, 4, '销售单（VM_20200318-4-272）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521445);
INSERT INTO `vm_user_log` VALUES (1615, 4, '销售单（VM_20200318-4-273）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521498);
INSERT INTO `vm_user_log` VALUES (1616, 4, '销售单（VM_20200318-4-274）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521528);
INSERT INTO `vm_user_log` VALUES (1617, 4, '销售单（VM_20200318-4-275）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521595);
INSERT INTO `vm_user_log` VALUES (1618, 4, '销售单（VM_20200318-4-276）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521643);
INSERT INTO `vm_user_log` VALUES (1619, 4, '销售单（VM_20200318-4-277）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521696);
INSERT INTO `vm_user_log` VALUES (1620, 4, '销售单（VM_20200318-4-278）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521800);
INSERT INTO `vm_user_log` VALUES (1621, 4, '销售单（VM_20200318-4-279）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584521847);
INSERT INTO `vm_user_log` VALUES (1622, 4, '销售单（VM_20200318-4-280）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522136);
INSERT INTO `vm_user_log` VALUES (1623, 4, '销售单（VM_20200318-4-281）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522160);
INSERT INTO `vm_user_log` VALUES (1624, 4, '销售单（VM_20200318-4-282）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522220);
INSERT INTO `vm_user_log` VALUES (1625, 4, '销售单（VM_20200318-4-283）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522265);
INSERT INTO `vm_user_log` VALUES (1626, 4, '销售单（VM_20200318-4-284）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522297);
INSERT INTO `vm_user_log` VALUES (1627, 4, '销售单（VM_20200318-4-285）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522342);
INSERT INTO `vm_user_log` VALUES (1628, 4, '销售单（VM_20200318-4-286）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522471);
INSERT INTO `vm_user_log` VALUES (1629, 4, '销售单（VM_20200318-4-287）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522513);
INSERT INTO `vm_user_log` VALUES (1630, 4, '销售单（VM_20200318-4-288）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522549);
INSERT INTO `vm_user_log` VALUES (1631, 4, '销售单（VM_20200318-4-289）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584522569);
INSERT INTO `vm_user_log` VALUES (1632, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584523352);
INSERT INTO `vm_user_log` VALUES (1633, 4, '审核单据（:VM_20200318-4-289）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584523796);
INSERT INTO `vm_user_log` VALUES (1634, 4, '审核单据（:VM_20200223-1-4）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584523906);
INSERT INTO `vm_user_log` VALUES (1635, 4, '审核单据（:VM_20200313-4-187）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524321);
INSERT INTO `vm_user_log` VALUES (1636, 4, '审核单据（:VM_20200313-4-188）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524338);
INSERT INTO `vm_user_log` VALUES (1637, 4, '审核单据（:VM_20200313-4-189）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524348);
INSERT INTO `vm_user_log` VALUES (1638, 4, '审核单据（:VM_20200313-4-190）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524360);
INSERT INTO `vm_user_log` VALUES (1639, 4, '审核单据（:VM_20200313-4-192）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524381);
INSERT INTO `vm_user_log` VALUES (1640, 4, '审核单据（:VM_20200313-4-193）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524391);
INSERT INTO `vm_user_log` VALUES (1641, 4, '审核单据（:VM_20200313-4-195）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524408);
INSERT INTO `vm_user_log` VALUES (1642, 4, '审核单据（:VM_20200313-4-196）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524418);
INSERT INTO `vm_user_log` VALUES (1643, 4, '审核单据（:VM_20200318-4-200）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524427);
INSERT INTO `vm_user_log` VALUES (1644, 4, '审核单据（:VM_20200318-4-201）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524442);
INSERT INTO `vm_user_log` VALUES (1645, 4, '审核单据（:VM_20200318-4-202）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524451);
INSERT INTO `vm_user_log` VALUES (1646, 4, '审核单据（:VM_20200318-4-203）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524481);
INSERT INTO `vm_user_log` VALUES (1647, 4, '审核单据（:VM_20200318-4-203）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524481);
INSERT INTO `vm_user_log` VALUES (1648, 4, '审核单据（:VM_20200318-4-203）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524481);
INSERT INTO `vm_user_log` VALUES (1649, 4, '审核单据（:VM_20200318-4-203）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524481);
INSERT INTO `vm_user_log` VALUES (1650, 4, '审核单据（:VM_20200318-4-204）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524495);
INSERT INTO `vm_user_log` VALUES (1651, 4, '审核单据（:VM_20200318-4-205）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524540);
INSERT INTO `vm_user_log` VALUES (1652, 4, '审核单据（:VM_20200318-4-206）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524577);
INSERT INTO `vm_user_log` VALUES (1653, 4, '审核单据（:VM_20200318-4-207）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524582);
INSERT INTO `vm_user_log` VALUES (1654, 4, '审核单据（:VM_20200318-4-208）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524593);
INSERT INTO `vm_user_log` VALUES (1655, 4, '审核单据（:VM_20200318-4-209）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584524602);
INSERT INTO `vm_user_log` VALUES (1656, 1, '销售单（VM_20200318-4-290）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584528290);
INSERT INTO `vm_user_log` VALUES (1657, 1, '登陆系统', 'admin/login/login', '120.244.234.181', 1584539799);
INSERT INTO `vm_user_log` VALUES (1658, 1, '登陆系统', 'admin/login/login', '223.78.223.171', 1584539997);
INSERT INTO `vm_user_log` VALUES (1659, 1, '订单（VM_20200317-1-199）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584540436);
INSERT INTO `vm_user_log` VALUES (1660, 1, '单据（VM_20200317-1-199）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584580463);
INSERT INTO `vm_user_log` VALUES (1661, 6, '登陆系统', 'admin/login/login', '124.126.171.105', 1584580485);
INSERT INTO `vm_user_log` VALUES (1662, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584580539);
INSERT INTO `vm_user_log` VALUES (1663, 1, '单据（VM_20200318-4-290）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584580784);
INSERT INTO `vm_user_log` VALUES (1664, 4, '审核单据（:VM_20200318-4-288）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581119);
INSERT INTO `vm_user_log` VALUES (1665, 1, '修改供应商侯总自购渠道', 'admin/goods/editSupplier', '124.126.171.105', 1584581126);
INSERT INTO `vm_user_log` VALUES (1666, 4, '审核单据（:VM_20200318-4-287）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581131);
INSERT INTO `vm_user_log` VALUES (1667, 1, '修改供应商侯总自购', 'admin/goods/editSupplier', '124.126.171.105', 1584581143);
INSERT INTO `vm_user_log` VALUES (1668, 4, '审核单据（:VM_20200318-4-286）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581144);
INSERT INTO `vm_user_log` VALUES (1669, 4, '审核单据（:VM_20200318-4-285）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581157);
INSERT INTO `vm_user_log` VALUES (1670, 4, '审核单据（:VM_20200318-4-284）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581171);
INSERT INTO `vm_user_log` VALUES (1671, 4, '审核单据（:VM_20200318-4-283）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581180);
INSERT INTO `vm_user_log` VALUES (1672, 4, '审核单据（:VM_20200318-4-282）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581188);
INSERT INTO `vm_user_log` VALUES (1673, 4, '审核单据（:VM_20200318-4-281）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581197);
INSERT INTO `vm_user_log` VALUES (1674, 4, '审核单据（:VM_20200318-4-280）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581206);
INSERT INTO `vm_user_log` VALUES (1675, 4, '审核单据（:VM_20200318-4-279）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581221);
INSERT INTO `vm_user_log` VALUES (1676, 4, '审核单据（:VM_20200318-4-278）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581248);
INSERT INTO `vm_user_log` VALUES (1677, 4, '审核单据（:VM_20200318-4-277）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581257);
INSERT INTO `vm_user_log` VALUES (1678, 4, '审核单据（:VM_20200318-4-276）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581269);
INSERT INTO `vm_user_log` VALUES (1679, 4, '审核单据（:VM_20200318-4-275）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581364);
INSERT INTO `vm_user_log` VALUES (1680, 4, '审核单据（:VM_20200318-4-274）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581372);
INSERT INTO `vm_user_log` VALUES (1681, 4, '审核单据（:VM_20200318-4-273）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581381);
INSERT INTO `vm_user_log` VALUES (1682, 4, '审核单据（:VM_20200318-4-273）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581381);
INSERT INTO `vm_user_log` VALUES (1683, 4, '审核单据（:VM_20200318-4-272）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581391);
INSERT INTO `vm_user_log` VALUES (1684, 4, '审核单据（:VM_20200318-4-271）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581401);
INSERT INTO `vm_user_log` VALUES (1685, 4, '审核单据（:VM_20200318-4-271）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581401);
INSERT INTO `vm_user_log` VALUES (1686, 4, '审核单据（:VM_20200318-4-270）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581416);
INSERT INTO `vm_user_log` VALUES (1687, 4, '销售订单（VM_20200318-4-270）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584581442);
INSERT INTO `vm_user_log` VALUES (1688, 4, '审核单据（:VM_20200318-4-269）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581475);
INSERT INTO `vm_user_log` VALUES (1689, 4, '审核单据（:VM_20200318-4-268）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581478);
INSERT INTO `vm_user_log` VALUES (1690, 4, '审核单据（:VM_20200318-4-267）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581488);
INSERT INTO `vm_user_log` VALUES (1691, 4, '审核单据（:VM_20200318-4-266）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581493);
INSERT INTO `vm_user_log` VALUES (1692, 4, '审核单据（:VM_20200318-4-265）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581507);
INSERT INTO `vm_user_log` VALUES (1693, 4, '审核单据（:VM_20200318-4-264）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581513);
INSERT INTO `vm_user_log` VALUES (1694, 4, '审核单据（:VM_20200318-4-264）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581513);
INSERT INTO `vm_user_log` VALUES (1695, 4, '审核单据（:VM_20200318-4-263）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581516);
INSERT INTO `vm_user_log` VALUES (1696, 4, '审核单据（:VM_20200318-4-262）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581519);
INSERT INTO `vm_user_log` VALUES (1697, 4, '审核单据（:VM_20200318-4-261）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581522);
INSERT INTO `vm_user_log` VALUES (1698, 4, '审核单据（:VM_20200318-4-260）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581525);
INSERT INTO `vm_user_log` VALUES (1699, 4, '审核单据（:VM_20200318-4-259）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581532);
INSERT INTO `vm_user_log` VALUES (1700, 4, '审核单据（:VM_20200318-4-258）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581536);
INSERT INTO `vm_user_log` VALUES (1701, 4, '审核单据（:VM_20200318-4-257）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581538);
INSERT INTO `vm_user_log` VALUES (1702, 4, '审核单据（:VM_20200318-4-256）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581541);
INSERT INTO `vm_user_log` VALUES (1703, 4, '审核单据（:VM_20200318-4-255）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581545);
INSERT INTO `vm_user_log` VALUES (1704, 4, '审核单据（:VM_20200318-4-254）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581548);
INSERT INTO `vm_user_log` VALUES (1705, 4, '审核单据（:VM_20200318-4-253）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581552);
INSERT INTO `vm_user_log` VALUES (1706, 4, '审核单据（:VM_20200318-4-252）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581556);
INSERT INTO `vm_user_log` VALUES (1707, 4, '审核单据（:VM_20200318-4-251）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581559);
INSERT INTO `vm_user_log` VALUES (1708, 4, '审核单据（:VM_20200318-4-250）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581563);
INSERT INTO `vm_user_log` VALUES (1709, 4, '审核单据（:VM_20200318-4-249）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581733);
INSERT INTO `vm_user_log` VALUES (1710, 4, '审核单据（:VM_20200318-4-248）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581736);
INSERT INTO `vm_user_log` VALUES (1711, 4, '审核单据（:VM_20200318-4-247）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581739);
INSERT INTO `vm_user_log` VALUES (1712, 4, '审核单据（:VM_20200318-4-246）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581741);
INSERT INTO `vm_user_log` VALUES (1713, 4, '审核单据（:VM_20200318-4-245）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581744);
INSERT INTO `vm_user_log` VALUES (1714, 4, '审核单据（:VM_20200318-4-244）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581747);
INSERT INTO `vm_user_log` VALUES (1715, 4, '审核单据（:VM_20200318-4-243）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581756);
INSERT INTO `vm_user_log` VALUES (1716, 4, '审核单据（:VM_20200318-4-242）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581762);
INSERT INTO `vm_user_log` VALUES (1717, 4, '审核单据（:VM_20200318-4-241）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581765);
INSERT INTO `vm_user_log` VALUES (1718, 4, '审核单据（:VM_20200318-4-240）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581772);
INSERT INTO `vm_user_log` VALUES (1719, 4, '审核单据（:VM_20200318-4-239）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581836);
INSERT INTO `vm_user_log` VALUES (1720, 4, '审核单据（:VM_20200318-4-238）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581838);
INSERT INTO `vm_user_log` VALUES (1721, 4, '审核单据（:VM_20200318-4-237）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581840);
INSERT INTO `vm_user_log` VALUES (1722, 4, '审核单据（:VM_20200318-4-236）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581848);
INSERT INTO `vm_user_log` VALUES (1723, 4, '审核单据（:VM_20200318-4-235）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581856);
INSERT INTO `vm_user_log` VALUES (1724, 4, '审核单据（:VM_20200318-4-234）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581863);
INSERT INTO `vm_user_log` VALUES (1725, 4, '审核单据（:VM_20200318-4-233）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581865);
INSERT INTO `vm_user_log` VALUES (1726, 4, '审核单据（:VM_20200318-4-232）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581868);
INSERT INTO `vm_user_log` VALUES (1727, 4, '审核单据（:VM_20200318-4-231）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581871);
INSERT INTO `vm_user_log` VALUES (1728, 4, '审核单据（:VM_20200318-4-230）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581875);
INSERT INTO `vm_user_log` VALUES (1729, 4, '审核单据（:VM_20200318-4-229）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581937);
INSERT INTO `vm_user_log` VALUES (1730, 4, '审核单据（:VM_20200318-4-228）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581943);
INSERT INTO `vm_user_log` VALUES (1731, 4, '审核单据（:VM_20200318-4-227）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581946);
INSERT INTO `vm_user_log` VALUES (1732, 4, '审核单据（:VM_20200318-4-226）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581949);
INSERT INTO `vm_user_log` VALUES (1733, 4, '审核单据（:VM_20200318-4-225）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581952);
INSERT INTO `vm_user_log` VALUES (1734, 4, '审核单据（:VM_20200318-4-224）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581954);
INSERT INTO `vm_user_log` VALUES (1735, 4, '审核单据（:VM_20200318-4-223）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581961);
INSERT INTO `vm_user_log` VALUES (1736, 4, '审核单据（:VM_20200318-4-222）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584581980);
INSERT INTO `vm_user_log` VALUES (1737, 4, '审核单据（:VM_20200318-4-221）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582002);
INSERT INTO `vm_user_log` VALUES (1738, 4, '审核单据（:VM_20200318-4-220）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582004);
INSERT INTO `vm_user_log` VALUES (1739, 4, '销售订单（VM_20200318-4-219）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584582033);
INSERT INTO `vm_user_log` VALUES (1740, 4, '审核单据（:VM_20200318-4-219）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582045);
INSERT INTO `vm_user_log` VALUES (1741, 4, '审核单据（:VM_20200318-4-218）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582049);
INSERT INTO `vm_user_log` VALUES (1742, 4, '审核单据（:VM_20200318-4-217）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582051);
INSERT INTO `vm_user_log` VALUES (1743, 4, '审核单据（:VM_20200318-4-216）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582054);
INSERT INTO `vm_user_log` VALUES (1744, 4, '审核单据（:VM_20200318-4-215）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582056);
INSERT INTO `vm_user_log` VALUES (1745, 4, '审核单据（:VM_20200318-4-214）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582057);
INSERT INTO `vm_user_log` VALUES (1746, 4, '审核单据（:VM_20200318-4-213）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582059);
INSERT INTO `vm_user_log` VALUES (1747, 4, '审核单据（:VM_20200318-4-212）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582061);
INSERT INTO `vm_user_log` VALUES (1748, 4, '审核单据（:VM_20200318-4-211）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582063);
INSERT INTO `vm_user_log` VALUES (1749, 4, '审核单据（:VM_20200318-4-210）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584582066);
INSERT INTO `vm_user_log` VALUES (1750, 1, '订单（VM_20200318-1-292）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584582457);
INSERT INTO `vm_user_log` VALUES (1751, 1, '采购订单（VM_20200318-1-292）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584582493);
INSERT INTO `vm_user_log` VALUES (1752, 1, '采购订单（VM_20200318-1-292）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584582511);
INSERT INTO `vm_user_log` VALUES (1753, 1, '采购订单（VM_20200318-1-292）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584582527);
INSERT INTO `vm_user_log` VALUES (1754, 1, '采购订单（VM_20200318-1-292）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584582567);
INSERT INTO `vm_user_log` VALUES (1755, 7, '登陆系统', 'admin/login/login', '124.126.171.105', 1584582718);
INSERT INTO `vm_user_log` VALUES (1756, 4, '审核单据（:VM_20200302-4-137）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584584736);
INSERT INTO `vm_user_log` VALUES (1757, 4, '审核单据（:VM_20200225-1-108）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584585214);
INSERT INTO `vm_user_log` VALUES (1758, 4, '审核单据（:VM_20200225-1-107）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584585217);
INSERT INTO `vm_user_log` VALUES (1759, 4, '审核单据（:VM_20200225-1-106）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584585219);
INSERT INTO `vm_user_log` VALUES (1760, 4, '审核单据（:VM_20200225-1-105）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584585222);
INSERT INTO `vm_user_log` VALUES (1761, 7, '添加资产工位牌屏风', 'admin/goods/addGoods', '124.126.171.105', 1584586443);
INSERT INTO `vm_user_log` VALUES (1762, 7, '订单（VM_20200319-7-291）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584586971);
INSERT INTO `vm_user_log` VALUES (1763, 7, '订单（VM_20200319-7-292）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584587079);
INSERT INTO `vm_user_log` VALUES (1764, 1, '单据（VM_20200223-1-3）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587602);
INSERT INTO `vm_user_log` VALUES (1765, 1, '单据（VM_20200223-1-5）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587617);
INSERT INTO `vm_user_log` VALUES (1766, 1, '单据（VM_20200223-1-6）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587627);
INSERT INTO `vm_user_log` VALUES (1767, 1, '单据（VM_20200223-1-7）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587635);
INSERT INTO `vm_user_log` VALUES (1768, 1, '单据（VM_20200223-1-8）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587651);
INSERT INTO `vm_user_log` VALUES (1769, 1, '单据（VM_20200223-1-9）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587665);
INSERT INTO `vm_user_log` VALUES (1770, 1, '单据（VM_20200223-1-10）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587672);
INSERT INTO `vm_user_log` VALUES (1771, 1, '单据（VM_20200223-1-11）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587680);
INSERT INTO `vm_user_log` VALUES (1772, 1, '销售订单（VM_20200225-1-115）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584587822);
INSERT INTO `vm_user_log` VALUES (1773, 1, '单据（VM_20200228-4-121）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587836);
INSERT INTO `vm_user_log` VALUES (1774, 1, '单据（VM_20200302-4-126）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587847);
INSERT INTO `vm_user_log` VALUES (1775, 1, '单据（VM_20200302-4-127）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587855);
INSERT INTO `vm_user_log` VALUES (1776, 1, '单据（VM_20200302-4-128）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587864);
INSERT INTO `vm_user_log` VALUES (1777, 1, '单据（VM_20200302-4-129）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587871);
INSERT INTO `vm_user_log` VALUES (1778, 1, '单据（VM_20200302-4-130）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587878);
INSERT INTO `vm_user_log` VALUES (1779, 1, '单据（VM_20200302-4-131）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587884);
INSERT INTO `vm_user_log` VALUES (1780, 1, '单据（VM_20200302-4-132）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587888);
INSERT INTO `vm_user_log` VALUES (1781, 1, '单据（VM_20200302-4-133）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587891);
INSERT INTO `vm_user_log` VALUES (1782, 1, '单据（VM_20200302-4-134）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587900);
INSERT INTO `vm_user_log` VALUES (1783, 1, '单据（VM_20200302-4-135）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587903);
INSERT INTO `vm_user_log` VALUES (1784, 1, '单据（VM_20200302-4-136）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587905);
INSERT INTO `vm_user_log` VALUES (1785, 1, '单据（VM_20200313-4-191）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587918);
INSERT INTO `vm_user_log` VALUES (1786, 1, '单据（VM_20200313-4-194）删除成功', 'admin/pub/delOrder', '124.126.171.105', 1584587928);
INSERT INTO `vm_user_log` VALUES (1787, 7, '添加供应商北农批发市场', 'admin/goods/addSupplier', '124.126.171.105', 1584587943);
INSERT INTO `vm_user_log` VALUES (1788, 7, '订单（VM_20200319-7-293）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584587982);
INSERT INTO `vm_user_log` VALUES (1789, 7, '订单（VM_20200319-7-294）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584588119);
INSERT INTO `vm_user_log` VALUES (1790, 7, '订单（VM_20200319-7-295）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584588188);
INSERT INTO `vm_user_log` VALUES (1791, 7, '添加资产水晶头', 'admin/goods/addGoods', '124.126.171.105', 1584588323);
INSERT INTO `vm_user_log` VALUES (1792, 7, '添加资产AP', 'admin/goods/addGoods', '124.126.171.105', 1584588390);
INSERT INTO `vm_user_log` VALUES (1793, 7, '订单（VM_20200319-7-296）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584588465);
INSERT INTO `vm_user_log` VALUES (1794, 7, '采购订单（VM_20200319-7-296）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584588507);
INSERT INTO `vm_user_log` VALUES (1795, 7, '添加资产直通', 'admin/goods/addGoods', '124.126.171.105', 1584588567);
INSERT INTO `vm_user_log` VALUES (1796, 7, '订单（VM_20200319-7-297）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584588620);
INSERT INTO `vm_user_log` VALUES (1797, 7, '订单（VM_20200319-7-298）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584588672);
INSERT INTO `vm_user_log` VALUES (1798, 7, '添加资产排气扇', 'admin/goods/addGoods', '124.126.171.105', 1584588736);
INSERT INTO `vm_user_log` VALUES (1799, 7, '订单（VM_20200319-7-299）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584588908);
INSERT INTO `vm_user_log` VALUES (1800, 7, '添加资产石膏板', 'admin/goods/addGoods', '124.126.171.105', 1584589185);
INSERT INTO `vm_user_log` VALUES (1801, 7, '订单（VM_20200319-7-300）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584589420);
INSERT INTO `vm_user_log` VALUES (1802, 7, '添加资产LED灯', 'admin/goods/addGoods', '124.126.171.105', 1584589532);
INSERT INTO `vm_user_log` VALUES (1803, 7, '添加资产LED灯', 'admin/goods/addGoods', '124.126.171.105', 1584589573);
INSERT INTO `vm_user_log` VALUES (1804, 1, '销售单（VM_20200319-4-290）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584589617);
INSERT INTO `vm_user_log` VALUES (1805, 1, '审核单据（:VM_20200319-4-290）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584589658);
INSERT INTO `vm_user_log` VALUES (1806, 7, '订单（VM_20200319-7-301）成功保存', 'admin/storage/addStorage', '124.126.171.105', 1584589720);
INSERT INTO `vm_user_log` VALUES (1807, 1, '采购订单（VM_20200312-7-185）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584598089);
INSERT INTO `vm_user_log` VALUES (1808, 1, '采购订单（VM_20200312-7-185）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584598127);
INSERT INTO `vm_user_log` VALUES (1809, 1, '采购订单（VM_20200312-7-185）成功保存', 'admin/storage/editStorage', '124.126.171.105', 1584598148);
INSERT INTO `vm_user_log` VALUES (1810, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584604554);
INSERT INTO `vm_user_log` VALUES (1811, 4, '销售单（VM_20200319-1-302）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584604899);
INSERT INTO `vm_user_log` VALUES (1812, 4, '审核单据（:VM_20200319-1-302）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584605249);
INSERT INTO `vm_user_log` VALUES (1813, 4, '销售单（VM_20200319-4-304）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584605326);
INSERT INTO `vm_user_log` VALUES (1814, 4, '审核单据（:VM_20200319-4-304）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584605338);
INSERT INTO `vm_user_log` VALUES (1815, 4, '销售单（VM_20200319-4-305）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584605407);
INSERT INTO `vm_user_log` VALUES (1816, 4, '审核单据（:VM_20200319-4-305）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584605419);
INSERT INTO `vm_user_log` VALUES (1817, 4, '销售单（VM_20200319-4-306）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584605484);
INSERT INTO `vm_user_log` VALUES (1818, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584606515);
INSERT INTO `vm_user_log` VALUES (1819, 1, '审核单据（:VM_20200313-7-186）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584606985);
INSERT INTO `vm_user_log` VALUES (1820, 1, '销售单（VM_20200319-4-307）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584607201);
INSERT INTO `vm_user_log` VALUES (1821, 4, '销售单（VM_20200319-4-307）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584607326);
INSERT INTO `vm_user_log` VALUES (1822, 4, '销售单（VM_20200319-1-308）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584607350);
INSERT INTO `vm_user_log` VALUES (1823, 4, '审核单据（:VM_20200319-1-308）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584607364);
INSERT INTO `vm_user_log` VALUES (1824, 4, '审核单据（:VM_20200319-4-307）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584607367);
INSERT INTO `vm_user_log` VALUES (1825, 4, '销售订单（VM_20200319-4-306）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584607405);
INSERT INTO `vm_user_log` VALUES (1826, 7, '登陆系统', 'admin/login/login', '124.126.171.105', 1584608653);
INSERT INTO `vm_user_log` VALUES (1827, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584608716);
INSERT INTO `vm_user_log` VALUES (1828, 10, '添加用户liqiang', 'admin/user/addUser', '124.126.171.105', 1584609165);
INSERT INTO `vm_user_log` VALUES (1829, 11, '添加用户zyf', 'admin/user/addUser', '124.126.171.105', 1584609193);
INSERT INTO `vm_user_log` VALUES (1830, 1, '审核单据（:VM_20200319-7-291）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584610352);
INSERT INTO `vm_user_log` VALUES (1831, 1, '销售单（VM_20200319-4-309）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584610487);
INSERT INTO `vm_user_log` VALUES (1832, 1, '审核单据（:VM_20200319-4-309）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584610497);
INSERT INTO `vm_user_log` VALUES (1833, 1, '调拔订单（VM_20200227-1-118）成功保存', 'admin/stocks/allot', '124.126.171.105', 1584610606);
INSERT INTO `vm_user_log` VALUES (1834, 1, '采购订单（VM_20200227-1-118）成功保存', 'admin/stocks/editAllot', '124.126.171.105', 1584610639);
INSERT INTO `vm_user_log` VALUES (1835, 1, '采购订单（VM_20200227-1-118）成功保存', 'admin/stocks/editAllot', '124.126.171.105', 1584610646);
INSERT INTO `vm_user_log` VALUES (1836, 1, '采购订单（VM_20200227-1-118）成功保存', 'admin/stocks/editAllot', '124.126.171.105', 1584610664);
INSERT INTO `vm_user_log` VALUES (1837, 1, '采购订单（VM_20200227-1-118）成功保存', 'admin/stocks/editAllot', '124.126.171.105', 1584610671);
INSERT INTO `vm_user_log` VALUES (1838, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584611208);
INSERT INTO `vm_user_log` VALUES (1839, 4, '销售单（VM_20200319-1-310）成功保存', 'admin/sales/addSales', '124.126.171.105', 1584611310);
INSERT INTO `vm_user_log` VALUES (1840, 4, '审核单据（:VM_20200319-1-310）成功', 'admin/pub/verifyOrder', '124.126.171.105', 1584611320);
INSERT INTO `vm_user_log` VALUES (1841, 4, '销售订单（VM_20200319-1-310）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584613123);
INSERT INTO `vm_user_log` VALUES (1842, 4, '销售订单（VM_20200319-1-310）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584613142);
INSERT INTO `vm_user_log` VALUES (1843, 1, '登陆系统', 'admin/login/login', '120.244.234.181', 1584625999);
INSERT INTO `vm_user_log` VALUES (1844, 1, '调拔订单（VM_20200319-1-311）成功保存', 'admin/stocks/allot', '120.244.234.181', 1584626116);
INSERT INTO `vm_user_log` VALUES (1845, 1, '采购订单（VM_20200319-1-311）成功保存', 'admin/stocks/editAllot', '120.244.234.181', 1584626155);
INSERT INTO `vm_user_log` VALUES (1846, 1, '销售订单（VM_20200319-1-310）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584627242);
INSERT INTO `vm_user_log` VALUES (1847, 1, '销售订单（VM_20200319-1-310）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584627257);
INSERT INTO `vm_user_log` VALUES (1848, 1, '销售订单（VM_20200319-1-310）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584627275);
INSERT INTO `vm_user_log` VALUES (1849, 1, '销售订单（VM_20200319-1-310）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584627303);
INSERT INTO `vm_user_log` VALUES (1850, 1, '销售订单（VM_20200319-1-310）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584627312);
INSERT INTO `vm_user_log` VALUES (1851, 1, '销售单（VM_20200319-1-310）成功保存', 'admin/sales/addSales', '120.244.234.181', 1584627496);
INSERT INTO `vm_user_log` VALUES (1852, 1, '调拔订单（VM_20200319-1-313）成功保存', 'admin/stocks/allot', '120.244.234.181', 1584627656);
INSERT INTO `vm_user_log` VALUES (1853, 1, '采购订单（VM_20200319-1-313）成功保存', 'admin/stocks/editAllot', '120.244.234.181', 1584627688);
INSERT INTO `vm_user_log` VALUES (1854, 1, '采购订单（VM_20200319-1-313）成功保存', 'admin/stocks/editAllot', '120.244.234.181', 1584627716);
INSERT INTO `vm_user_log` VALUES (1855, 1, '销售订单（VM_20200319-1-308）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630122);
INSERT INTO `vm_user_log` VALUES (1856, 1, '销售单（VM_20200319-1-308）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630140);
INSERT INTO `vm_user_log` VALUES (1857, 1, '销售单（VM_20200319-4-307）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630187);
INSERT INTO `vm_user_log` VALUES (1858, 1, '采购订单（VM_20200227-1-118）成功保存', 'admin/stocks/editAllot', '120.244.234.181', 1584630281);
INSERT INTO `vm_user_log` VALUES (1859, 1, '采购订单（VM_20200227-1-118）成功保存', 'admin/stocks/editAllot', '120.244.234.181', 1584630292);
INSERT INTO `vm_user_log` VALUES (1860, 1, '调拔订单（VM_20200227-1-118）成功保存', 'admin/stocks/allot', '120.244.234.181', 1584630447);
INSERT INTO `vm_user_log` VALUES (1861, 1, '销售单（VM_20200318-4-269）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630710);
INSERT INTO `vm_user_log` VALUES (1862, 1, '销售单（VM_20200318-4-270）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630720);
INSERT INTO `vm_user_log` VALUES (1863, 1, '销售单（VM_20200318-4-271）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630735);
INSERT INTO `vm_user_log` VALUES (1864, 1, '销售单（VM_20200318-4-272）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630743);
INSERT INTO `vm_user_log` VALUES (1865, 1, '销售单（VM_20200318-4-273）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630751);
INSERT INTO `vm_user_log` VALUES (1866, 1, '销售单（VM_20200318-4-274）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630759);
INSERT INTO `vm_user_log` VALUES (1867, 1, '销售单（VM_20200318-4-275）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630798);
INSERT INTO `vm_user_log` VALUES (1868, 1, '销售单（VM_20200318-4-276）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630806);
INSERT INTO `vm_user_log` VALUES (1869, 1, '销售单（VM_20200318-4-277）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630817);
INSERT INTO `vm_user_log` VALUES (1870, 1, '销售单（VM_20200318-4-278）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630828);
INSERT INTO `vm_user_log` VALUES (1871, 1, '销售单（VM_20200318-4-279）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630840);
INSERT INTO `vm_user_log` VALUES (1872, 1, '销售单（VM_20200318-4-280）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630847);
INSERT INTO `vm_user_log` VALUES (1873, 1, '销售单（VM_20200318-4-281）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630855);
INSERT INTO `vm_user_log` VALUES (1874, 1, '销售单（VM_20200318-4-282）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630863);
INSERT INTO `vm_user_log` VALUES (1875, 1, '销售单（VM_20200318-4-283）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630871);
INSERT INTO `vm_user_log` VALUES (1876, 1, '销售单（VM_20200318-4-284）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630878);
INSERT INTO `vm_user_log` VALUES (1877, 1, '销售单（VM_20200318-4-285）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630890);
INSERT INTO `vm_user_log` VALUES (1878, 1, '销售单（VM_20200318-4-286）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630896);
INSERT INTO `vm_user_log` VALUES (1879, 1, '销售单（VM_20200318-4-287）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630904);
INSERT INTO `vm_user_log` VALUES (1880, 1, '销售单（VM_20200318-4-288）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630912);
INSERT INTO `vm_user_log` VALUES (1881, 1, '销售单（VM_20200318-4-289）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630922);
INSERT INTO `vm_user_log` VALUES (1882, 1, '销售单（VM_20200319-4-304）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630930);
INSERT INTO `vm_user_log` VALUES (1883, 1, '销售单（VM_20200319-4-306）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630942);
INSERT INTO `vm_user_log` VALUES (1884, 1, '销售单（VM_20200319-4-305）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584630954);
INSERT INTO `vm_user_log` VALUES (1885, 1, '销售单（VM_20200319-4-312）成功保存', 'admin/sales/addSales', '120.244.234.181', 1584631280);
INSERT INTO `vm_user_log` VALUES (1886, 1, '销售单（VM_20200319-4-312）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584631349);
INSERT INTO `vm_user_log` VALUES (1887, 1, '销售单（VM_20200318-4-244）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584631473);
INSERT INTO `vm_user_log` VALUES (1888, 1, '销售单（VM_20200318-4-243）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584631667);
INSERT INTO `vm_user_log` VALUES (1889, 1, '销售单（VM_20200318-4-260）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584631750);
INSERT INTO `vm_user_log` VALUES (1890, 1, '销售单（VM_20200318-4-267）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584631766);
INSERT INTO `vm_user_log` VALUES (1891, 1, '销售单（VM_20200318-4-268）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584631782);
INSERT INTO `vm_user_log` VALUES (1892, 1, '销售单（VM_20200318-4-232）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584631835);
INSERT INTO `vm_user_log` VALUES (1893, 1, '销售单（VM_20200318-4-221）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584631985);
INSERT INTO `vm_user_log` VALUES (1894, 1, '销售订单（VM_20200319-4-312）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584632372);
INSERT INTO `vm_user_log` VALUES (1895, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584667029);
INSERT INTO `vm_user_log` VALUES (1896, 6, '登陆系统', 'admin/login/login', '124.126.171.105', 1584667596);
INSERT INTO `vm_user_log` VALUES (1897, 4, '销售订单（VM_20200318-4-242）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584669349);
INSERT INTO `vm_user_log` VALUES (1898, 4, '销售订单（VM_20200318-4-242）成功保存', 'admin/sales/editSales', '124.126.171.105', 1584669360);
INSERT INTO `vm_user_log` VALUES (1899, 4, '注销系统', 'admin/login/logout', '124.126.171.105', 1584672234);
INSERT INTO `vm_user_log` VALUES (1900, 4, '登陆系统', 'admin/login/login', '124.126.171.105', 1584672432);
INSERT INTO `vm_user_log` VALUES (1901, 4, '注销系统', 'admin/login/logout', '219.142.145.164', 1584676154);
INSERT INTO `vm_user_log` VALUES (1902, 1, '登陆系统', 'admin/login/login', '219.142.145.164', 1584676188);
INSERT INTO `vm_user_log` VALUES (1903, 1, '销售订单（VM_20200319-1-310）成功保存', 'admin/sales/editSales', '219.142.145.164', 1584676217);
INSERT INTO `vm_user_log` VALUES (1904, 1, '销售订单（VM_20200318-4-242）成功保存', 'admin/sales/editSales', '219.142.145.164', 1584676269);
INSERT INTO `vm_user_log` VALUES (1905, 1, '销售订单（VM_20200318-4-242）成功保存', 'admin/sales/editSales', '219.142.145.164', 1584676291);
INSERT INTO `vm_user_log` VALUES (1906, 1, '销售订单（VM_20200318-4-242）成功保存', 'admin/sales/editSales', '219.142.145.164', 1584676298);
INSERT INTO `vm_user_log` VALUES (1907, 1, '销售订单（VM_20200318-4-243）成功保存', 'admin/sales/editSales', '219.142.145.164', 1584676322);
INSERT INTO `vm_user_log` VALUES (1908, 1, '销售订单（VM_20200318-4-242）成功保存', 'admin/sales/editSales', '219.142.145.164', 1584676465);
INSERT INTO `vm_user_log` VALUES (1909, 1, '销售订单（VM_20200223-1-4）成功保存', 'admin/sales/editSales', '219.142.145.164', 1584681253);
INSERT INTO `vm_user_log` VALUES (1910, 6, '登陆系统', 'admin/login/login', '1.202.6.206', 1584696720);
INSERT INTO `vm_user_log` VALUES (1911, 1, '登陆系统', 'admin/login/login', '120.244.234.181', 1584712606);
INSERT INTO `vm_user_log` VALUES (1912, 1, '销售订单（VM_20200319-4-312）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584714796);
INSERT INTO `vm_user_log` VALUES (1913, 1, '销售订单（VM_20200319-4-312）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584714821);
INSERT INTO `vm_user_log` VALUES (1914, 1, '销售订单（VM_20200319-4-312）成功保存', 'admin/sales/editSales', '120.244.234.181', 1584714836);
INSERT INTO `vm_user_log` VALUES (1915, 1, '销售单（VM_20200319-4-312）成功保存', 'admin/sales/addSales', '120.244.234.181', 1584715435);
INSERT INTO `vm_user_log` VALUES (1916, 1, '审核单据（:VM_20200319-4-312）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584715447);
INSERT INTO `vm_user_log` VALUES (1917, 1, '完成单据（ID:312）成功', 'admin/pub/finishOrder', '120.244.234.181', 1584715451);
INSERT INTO `vm_user_log` VALUES (1918, 1, '订单（VM_20200306-7-146）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584715680);
INSERT INTO `vm_user_log` VALUES (1919, 1, '采购订单（VM_20200306-7-146）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584715735);
INSERT INTO `vm_user_log` VALUES (1920, 1, '审核单据（:VM_20200306-7-146）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584715747);
INSERT INTO `vm_user_log` VALUES (1921, 1, '采购订单（VM_20200306-7-146）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584715768);
INSERT INTO `vm_user_log` VALUES (1922, 1, '订单（VM_20200312-7-148）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584716061);
INSERT INTO `vm_user_log` VALUES (1923, 1, '审核单据（:VM_20200312-7-148）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584716341);
INSERT INTO `vm_user_log` VALUES (1924, 1, '订单（VM_20200312-7-149）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584716905);
INSERT INTO `vm_user_log` VALUES (1925, 1, '采购订单（VM_20200312-7-149）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584716942);
INSERT INTO `vm_user_log` VALUES (1926, 1, '审核单据（:VM_20200312-7-149）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584716947);
INSERT INTO `vm_user_log` VALUES (1927, 1, '订单（VM_20200312-7-150）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584717153);
INSERT INTO `vm_user_log` VALUES (1928, 1, '采购订单（VM_20200312-7-150）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584717206);
INSERT INTO `vm_user_log` VALUES (1929, 1, '审核单据（:VM_20200312-7-150）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584717213);
INSERT INTO `vm_user_log` VALUES (1930, 1, '订单（VM_20200312-7-151）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584717634);
INSERT INTO `vm_user_log` VALUES (1931, 1, '采购订单（VM_20200312-7-151）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584717677);
INSERT INTO `vm_user_log` VALUES (1932, 1, '审核单据（:VM_20200312-7-151）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584717682);
INSERT INTO `vm_user_log` VALUES (1933, 1, '订单（VM_20200312-7-152）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584718201);
INSERT INTO `vm_user_log` VALUES (1934, 1, '采购订单（VM_20200312-7-152）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584718242);
INSERT INTO `vm_user_log` VALUES (1935, 1, '审核单据（:VM_20200312-7-152）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584718251);
INSERT INTO `vm_user_log` VALUES (1936, 1, '订单（VM_20200312-7-153）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584718317);
INSERT INTO `vm_user_log` VALUES (1937, 1, '采购订单（VM_20200312-7-153）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584718361);
INSERT INTO `vm_user_log` VALUES (1938, 1, '审核单据（:VM_20200312-7-153）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584718366);
INSERT INTO `vm_user_log` VALUES (1939, 1, '订单（VM_20200312-7-154）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584718515);
INSERT INTO `vm_user_log` VALUES (1940, 1, '审核单据（:VM_20200312-7-154）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584718524);
INSERT INTO `vm_user_log` VALUES (1941, 1, '订单（VM_20200312-7-155）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584718773);
INSERT INTO `vm_user_log` VALUES (1942, 1, '采购订单（VM_20200312-7-155）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584718816);
INSERT INTO `vm_user_log` VALUES (1943, 1, '审核单据（:VM_20200312-7-155）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584718821);
INSERT INTO `vm_user_log` VALUES (1944, 1, '订单（VM_20200312-7-156）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584718960);
INSERT INTO `vm_user_log` VALUES (1945, 1, '审核单据（:VM_20200312-7-156）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584719034);
INSERT INTO `vm_user_log` VALUES (1946, 1, '订单（VM_20200312-7-157）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584721491);
INSERT INTO `vm_user_log` VALUES (1947, 1, '采购订单（VM_20200312-7-157）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584721532);
INSERT INTO `vm_user_log` VALUES (1948, 1, '审核单据（:VM_20200312-7-157）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584721575);
INSERT INTO `vm_user_log` VALUES (1949, 1, '订单（VM_20200312-7-158）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584721674);
INSERT INTO `vm_user_log` VALUES (1950, 1, '采购订单（VM_20200312-7-158）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584721695);
INSERT INTO `vm_user_log` VALUES (1951, 1, '审核单据（:VM_20200312-7-158）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584721703);
INSERT INTO `vm_user_log` VALUES (1952, 1, '订单（VM_20200312-7-159）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584721808);
INSERT INTO `vm_user_log` VALUES (1953, 1, '采购订单（VM_20200312-7-159）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584721826);
INSERT INTO `vm_user_log` VALUES (1954, 1, '审核单据（:VM_20200312-7-159）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584721831);
INSERT INTO `vm_user_log` VALUES (1955, 1, '订单（VM_20200312-7-160）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584721949);
INSERT INTO `vm_user_log` VALUES (1956, 1, '采购订单（VM_20200312-7-160）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584721966);
INSERT INTO `vm_user_log` VALUES (1957, 1, '审核单据（:VM_20200312-7-160）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584721969);
INSERT INTO `vm_user_log` VALUES (1958, 1, '订单（VM_20200312-7-162）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584722059);
INSERT INTO `vm_user_log` VALUES (1959, 1, '采购订单（VM_20200312-7-162）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584722144);
INSERT INTO `vm_user_log` VALUES (1960, 1, '审核单据（:VM_20200312-7-162）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584722149);
INSERT INTO `vm_user_log` VALUES (1961, 1, '订单（VM_20200312-7-163）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584722413);
INSERT INTO `vm_user_log` VALUES (1962, 1, '采购订单（VM_20200312-7-163）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584722452);
INSERT INTO `vm_user_log` VALUES (1963, 1, '审核单据（:VM_20200312-7-163）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584722456);
INSERT INTO `vm_user_log` VALUES (1964, 1, '订单（VM_20200312-7-164）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584722617);
INSERT INTO `vm_user_log` VALUES (1965, 1, '采购订单（VM_20200312-7-164）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584722641);
INSERT INTO `vm_user_log` VALUES (1966, 1, '审核单据（:VM_20200312-7-164）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584722657);
INSERT INTO `vm_user_log` VALUES (1967, 1, '订单（VM_20200312-7-165）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584722806);
INSERT INTO `vm_user_log` VALUES (1968, 1, '采购订单（VM_20200312-7-165）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584722820);
INSERT INTO `vm_user_log` VALUES (1969, 1, '审核单据（:VM_20200312-7-165）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584722825);
INSERT INTO `vm_user_log` VALUES (1970, 1, '订单（VM_20200312-7-166）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584722976);
INSERT INTO `vm_user_log` VALUES (1971, 1, '采购订单（VM_20200312-7-166）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584723011);
INSERT INTO `vm_user_log` VALUES (1972, 1, '审核单据（:VM_20200312-7-166）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584723015);
INSERT INTO `vm_user_log` VALUES (1973, 1, '订单（VM_20200312-7-167）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584794592);
INSERT INTO `vm_user_log` VALUES (1974, 1, '采购订单（VM_20200312-7-167）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584794618);
INSERT INTO `vm_user_log` VALUES (1975, 1, '审核单据（:VM_20200312-7-167）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584794635);
INSERT INTO `vm_user_log` VALUES (1976, 1, '订单（VM_20200312-7-168）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584794847);
INSERT INTO `vm_user_log` VALUES (1977, 1, '采购订单（VM_20200312-7-168）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584794883);
INSERT INTO `vm_user_log` VALUES (1978, 1, '审核单据（:VM_20200312-7-168）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584794889);
INSERT INTO `vm_user_log` VALUES (1979, 1, '订单（VM_20200312-7-169）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584794974);
INSERT INTO `vm_user_log` VALUES (1980, 1, '采购订单（VM_20200312-7-169）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584794991);
INSERT INTO `vm_user_log` VALUES (1981, 1, '审核单据（:VM_20200312-7-169）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584794996);
INSERT INTO `vm_user_log` VALUES (1982, 1, '订单（VM_20200312-7-170）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584795154);
INSERT INTO `vm_user_log` VALUES (1983, 1, '采购订单（VM_20200312-7-170）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584795189);
INSERT INTO `vm_user_log` VALUES (1984, 1, '审核单据（:VM_20200312-7-170）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584795193);
INSERT INTO `vm_user_log` VALUES (1985, 1, '订单（VM_20200312-7-171）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584795466);
INSERT INTO `vm_user_log` VALUES (1986, 1, '采购订单（VM_20200312-7-171）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584795556);
INSERT INTO `vm_user_log` VALUES (1987, 1, '审核单据（:VM_20200312-7-171）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584795561);
INSERT INTO `vm_user_log` VALUES (1988, 1, '订单（VM_20200312-7-172）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584795612);
INSERT INTO `vm_user_log` VALUES (1989, 1, '采购订单（VM_20200312-7-172）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584795639);
INSERT INTO `vm_user_log` VALUES (1990, 1, '审核单据（:VM_20200312-7-172）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584795794);
INSERT INTO `vm_user_log` VALUES (1991, 1, '订单（VM_20200312-7-173）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584795908);
INSERT INTO `vm_user_log` VALUES (1992, 1, '采购订单（VM_20200312-7-173）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584795994);
INSERT INTO `vm_user_log` VALUES (1993, 1, '采购订单（VM_20200312-7-173）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796011);
INSERT INTO `vm_user_log` VALUES (1994, 1, '采购订单（VM_20200312-7-173）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796023);
INSERT INTO `vm_user_log` VALUES (1995, 1, '采购订单（VM_20200312-7-173）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796032);
INSERT INTO `vm_user_log` VALUES (1996, 1, '审核单据（:VM_20200312-7-173）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584796036);
INSERT INTO `vm_user_log` VALUES (1997, 1, '订单（VM_20200312-7-174）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584796243);
INSERT INTO `vm_user_log` VALUES (1998, 1, '采购订单（VM_20200312-7-174）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796305);
INSERT INTO `vm_user_log` VALUES (1999, 1, '审核单据（:VM_20200312-7-174）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584796310);
INSERT INTO `vm_user_log` VALUES (2000, 1, '订单（VM_20200312-7-175）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584796404);
INSERT INTO `vm_user_log` VALUES (2001, 1, '采购订单（VM_20200312-7-175）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796454);
INSERT INTO `vm_user_log` VALUES (2002, 1, '审核单据（:VM_20200312-7-175）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584796465);
INSERT INTO `vm_user_log` VALUES (2003, 1, '订单（VM_20200312-7-176）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584796656);
INSERT INTO `vm_user_log` VALUES (2004, 1, '采购订单（VM_20200312-7-176）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796698);
INSERT INTO `vm_user_log` VALUES (2005, 1, '审核单据（:VM_20200312-7-176）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584796705);
INSERT INTO `vm_user_log` VALUES (2006, 1, '订单（VM_20200312-7-177）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584796795);
INSERT INTO `vm_user_log` VALUES (2007, 1, '采购订单（VM_20200312-7-177）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796814);
INSERT INTO `vm_user_log` VALUES (2008, 1, '审核单据（:VM_20200312-7-177）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584796819);
INSERT INTO `vm_user_log` VALUES (2009, 1, '订单（VM_20200312-7-178）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584796919);
INSERT INTO `vm_user_log` VALUES (2010, 1, '采购订单（VM_20200312-7-178）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796965);
INSERT INTO `vm_user_log` VALUES (2011, 1, '采购订单（VM_20200312-7-178）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584796976);
INSERT INTO `vm_user_log` VALUES (2012, 1, '审核单据（:VM_20200312-7-178）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584796981);
INSERT INTO `vm_user_log` VALUES (2013, 1, '订单（VM_20200312-7-179）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584797298);
INSERT INTO `vm_user_log` VALUES (2014, 1, '采购订单（VM_20200312-7-179）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584797361);
INSERT INTO `vm_user_log` VALUES (2015, 1, '采购订单（VM_20200312-7-179）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584797374);
INSERT INTO `vm_user_log` VALUES (2016, 1, '审核单据（:VM_20200312-7-179）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584797392);
INSERT INTO `vm_user_log` VALUES (2017, 1, '订单（VM_20200312-7-180）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584798026);
INSERT INTO `vm_user_log` VALUES (2018, 1, '采购订单（VM_20200312-7-180）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584798079);
INSERT INTO `vm_user_log` VALUES (2019, 1, '审核单据（:VM_20200312-7-180）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584798191);
INSERT INTO `vm_user_log` VALUES (2020, 1, '订单（VM_20200312-7-181）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584798505);
INSERT INTO `vm_user_log` VALUES (2021, 1, '订单（VM_20200312-7-182）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584798754);
INSERT INTO `vm_user_log` VALUES (2022, 1, '审核单据（:VM_20200312-7-181）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584798777);
INSERT INTO `vm_user_log` VALUES (2023, 1, '审核单据（:VM_20200312-7-182）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584798781);
INSERT INTO `vm_user_log` VALUES (2024, 1, '订单（VM_20200312-7-183）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584799178);
INSERT INTO `vm_user_log` VALUES (2025, 1, '采购订单（VM_20200312-7-183）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584799275);
INSERT INTO `vm_user_log` VALUES (2026, 1, '采购订单（VM_20200312-7-183）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584799295);
INSERT INTO `vm_user_log` VALUES (2027, 1, '审核单据（:VM_20200312-7-183）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584799299);
INSERT INTO `vm_user_log` VALUES (2028, 1, '订单（VM_20200312-7-185）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584799459);
INSERT INTO `vm_user_log` VALUES (2029, 1, '采购订单（VM_20200312-7-185）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584799485);
INSERT INTO `vm_user_log` VALUES (2030, 1, '审核单据（:VM_20200312-7-185）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584799529);
INSERT INTO `vm_user_log` VALUES (2031, 1, '订单（VM_20200313-7-186）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584799683);
INSERT INTO `vm_user_log` VALUES (2032, 1, '采购订单（VM_20200313-7-186）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584799713);
INSERT INTO `vm_user_log` VALUES (2033, 1, '审核单据（:VM_20200313-7-186）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584799723);
INSERT INTO `vm_user_log` VALUES (2034, 1, '订单（VM_20200319-7-291）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584799971);
INSERT INTO `vm_user_log` VALUES (2035, 1, '订单（VM_20200319-7-291）成功保存', 'admin/storage/addStorage', '120.244.234.181', 1584799971);
INSERT INTO `vm_user_log` VALUES (2036, 1, '采购订单（VM_20200319-7-291）成功保存', 'admin/storage/editStorage', '120.244.234.181', 1584799992);
INSERT INTO `vm_user_log` VALUES (2037, 1, '销售单（VM_20200319-1-310）成功保存', 'admin/sales/addSales', '120.244.234.181', 1584801555);
INSERT INTO `vm_user_log` VALUES (2038, 1, '审核单据（:VM_20200319-1-310）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584801572);
INSERT INTO `vm_user_log` VALUES (2039, 1, '审核单据（:VM_20200319-7-291）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584801640);
INSERT INTO `vm_user_log` VALUES (2040, 1, '销售单（VM_20200319-4-309）成功保存', 'admin/sales/addSales', '120.244.234.181', 1584801763);
INSERT INTO `vm_user_log` VALUES (2041, 1, '审核单据（:VM_20200319-4-309）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584801790);
INSERT INTO `vm_user_log` VALUES (2042, 1, '销售单（VM_20200319-1-308）成功保存', 'admin/sales/addSales', '120.244.234.181', 1584802246);
INSERT INTO `vm_user_log` VALUES (2043, 1, '审核单据（:VM_20200319-1-308）成功', 'admin/pub/verifyOrder', '120.244.234.181', 1584802273);
INSERT INTO `vm_user_log` VALUES (2044, 1, '登陆系统', 'admin/login/login', '113.246.245.170', 1584848122);
INSERT INTO `vm_user_log` VALUES (2045, 1, '添加仓库调试仓库', 'admin/goods/addStorehouse', '113.246.245.170', 1584848567);
INSERT INTO `vm_user_log` VALUES (2046, 4, '登陆系统', 'admin/login/login', '1.202.6.206', 1584854404);
INSERT INTO `vm_user_log` VALUES (2047, 1, '登陆系统', 'admin/login/login', '1.202.6.206', 1584863371);
INSERT INTO `vm_user_log` VALUES (2048, 1, '登陆系统', 'admin/login/login', '113.246.245.170', 1584863583);
INSERT INTO `vm_user_log` VALUES (2049, 4, '销售单（VM_20200319-4-307）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584863635);
INSERT INTO `vm_user_log` VALUES (2050, 4, '销售单（VM_20200319-4-306）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584863777);
INSERT INTO `vm_user_log` VALUES (2051, 4, '销售订单（VM_20200319-1-308）成功保存', 'admin/sales/editSales', '1.202.6.206', 1584863800);
INSERT INTO `vm_user_log` VALUES (2052, 4, '销售单（VM_20200319-4-305）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584864116);
INSERT INTO `vm_user_log` VALUES (2053, 1, '审核单据（:VM_20200319-1-308）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584864135);
INSERT INTO `vm_user_log` VALUES (2054, 1, '审核单据（:VM_20200319-4-307）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584864141);
INSERT INTO `vm_user_log` VALUES (2055, 4, '销售单（VM_20200319-4-304）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584864254);
INSERT INTO `vm_user_log` VALUES (2056, 4, '销售单（VM_20200318-4-289）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584864567);
INSERT INTO `vm_user_log` VALUES (2057, 4, '审核单据（:VM_20200319-4-306）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584864586);
INSERT INTO `vm_user_log` VALUES (2058, 4, '审核单据（:VM_20200319-4-305）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584864588);
INSERT INTO `vm_user_log` VALUES (2059, 4, '审核单据（:VM_20200319-4-304）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584864590);
INSERT INTO `vm_user_log` VALUES (2060, 4, '审核单据（:VM_20200318-4-289）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584864592);
INSERT INTO `vm_user_log` VALUES (2061, 4, '销售单（VM_20200318-4-288）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584864640);
INSERT INTO `vm_user_log` VALUES (2062, 4, '审核单据（:VM_20200318-4-288）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584864647);
INSERT INTO `vm_user_log` VALUES (2063, 1, '登陆系统', 'admin/login/login', '1.202.6.206', 1584865652);
INSERT INTO `vm_user_log` VALUES (2064, 4, '销售单（VM_20200318-4-287）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584865783);
INSERT INTO `vm_user_log` VALUES (2065, 4, '审核单据（:VM_20200318-4-287）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584865796);
INSERT INTO `vm_user_log` VALUES (2066, 1, '销售单（VM_20200319-4-290）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584865815);
INSERT INTO `vm_user_log` VALUES (2067, 1, '单据（VM_20200319-4-290）删除成功', 'admin/pub/delOrder', '113.246.245.170', 1584865926);
INSERT INTO `vm_user_log` VALUES (2068, 1, '订单（VM_20200319-7-303）成功保存', 'admin/storage/addStorage', '1.202.6.206', 1584866207);
INSERT INTO `vm_user_log` VALUES (2069, 1, '审核单据（:VM_20200319-7-303）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584866233);
INSERT INTO `vm_user_log` VALUES (2070, 1, '添加角色程序员', 'admin/user/addRole', '113.246.245.170', 1584866414);
INSERT INTO `vm_user_log` VALUES (2071, 1, '销售单（VM_20200318-4-284）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584871109);
INSERT INTO `vm_user_log` VALUES (2072, 1, '单据（VM_20200318-4-284）删除成功', 'admin/pub/delOrder', '113.246.245.170', 1584871365);
INSERT INTO `vm_user_log` VALUES (2073, 1, '销售单（VM_20200322-4-313）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584871398);
INSERT INTO `vm_user_log` VALUES (2074, 1, '单据（VM_20200322-4-313）删除成功', 'admin/pub/delOrder', '113.246.245.170', 1584871583);
INSERT INTO `vm_user_log` VALUES (2075, 1, '销售单（VM_20200322-1-319）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584871774);
INSERT INTO `vm_user_log` VALUES (2076, 1, '单据（VM_20200322-1-319）删除成功', 'admin/pub/delOrder', '113.246.245.170', 1584871786);
INSERT INTO `vm_user_log` VALUES (2077, 1, '销售单（VM_20200322-1-320）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584871848);
INSERT INTO `vm_user_log` VALUES (2078, 1, '单据（VM_20200322-1-320）删除成功', 'admin/pub/delOrder', '113.246.245.170', 1584871863);
INSERT INTO `vm_user_log` VALUES (2079, 1, '销售单（VM_20200322-1-321）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584871949);
INSERT INTO `vm_user_log` VALUES (2080, 1, '销售单（VM_20200322-1-321）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584872064);
INSERT INTO `vm_user_log` VALUES (2081, 1, '单据（VM_20200322-1-321）删除成功', 'admin/pub/delOrder', '113.246.245.170', 1584872079);
INSERT INTO `vm_user_log` VALUES (2082, 1, '销售单（VM_20200322-1-319）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584872411);
INSERT INTO `vm_user_log` VALUES (2083, 1, '销售单（VM_20200322-1-319）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584872591);
INSERT INTO `vm_user_log` VALUES (2084, 1, '销售单（VM_20200322-1-319）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584872631);
INSERT INTO `vm_user_log` VALUES (2085, 1, '销售单（VM_20200322-1-323）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584872873);
INSERT INTO `vm_user_log` VALUES (2086, 1, '销售单（VM_20200322-1-323）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584872878);
INSERT INTO `vm_user_log` VALUES (2087, 1, '销售单（VM_20200322-1-323）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584872885);
INSERT INTO `vm_user_log` VALUES (2088, 1, '销售单（VM_20200322-1-323）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584872890);
INSERT INTO `vm_user_log` VALUES (2089, 1, '销售单（VM_20200322-1-319）成功保存', 'admin/sales/addSales', '113.246.245.170', 1584872906);
INSERT INTO `vm_user_log` VALUES (2090, 1, '单据（VM_20200322-1-319）删除成功', 'admin/pub/delOrder', '113.246.245.170', 1584873045);
INSERT INTO `vm_user_log` VALUES (2091, 12, '添加用户userma', 'admin/user/addUser', '113.246.245.170', 1584873247);
INSERT INTO `vm_user_log` VALUES (2092, 1, '销售订单（VM_20200322-1-323）成功保存', 'admin/sales/editSales', '1.202.6.206', 1584873910);
INSERT INTO `vm_user_log` VALUES (2093, 4, '登陆系统', 'admin/login/login', '1.202.6.206', 1584874290);
INSERT INTO `vm_user_log` VALUES (2094, 4, '销售单（VM_20200318-4-286）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584874366);
INSERT INTO `vm_user_log` VALUES (2095, 4, '销售单（VM_20200318-4-285）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584874692);
INSERT INTO `vm_user_log` VALUES (2096, 4, '销售单（VM_20200318-4-283）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584874788);
INSERT INTO `vm_user_log` VALUES (2097, 4, '审核单据（:VM_20200318-4-286）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584874799);
INSERT INTO `vm_user_log` VALUES (2098, 4, '审核单据（:VM_20200318-4-285）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584874810);
INSERT INTO `vm_user_log` VALUES (2099, 4, '销售单（VM_20200318-4-282）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584874823);
INSERT INTO `vm_user_log` VALUES (2100, 4, '审核单据（:VM_20200318-4-283）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584874844);
INSERT INTO `vm_user_log` VALUES (2101, 4, '审核单据（:VM_20200318-4-282）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584874852);
INSERT INTO `vm_user_log` VALUES (2102, 4, '销售单（VM_20200318-4-280）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584874869);
INSERT INTO `vm_user_log` VALUES (2103, 1, '订单（VM_20200322-1-318）成功保存', 'admin/storage/addStorage', '1.202.6.206', 1584875265);
INSERT INTO `vm_user_log` VALUES (2104, 1, '审核单据（:VM_20200322-1-318）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875278);
INSERT INTO `vm_user_log` VALUES (2105, 4, '销售单（VM_20200318-4-279）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875318);
INSERT INTO `vm_user_log` VALUES (2106, 4, '审核单据（:VM_20200318-4-280）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875327);
INSERT INTO `vm_user_log` VALUES (2107, 4, '审核单据（:VM_20200318-4-279）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875354);
INSERT INTO `vm_user_log` VALUES (2108, 4, '审核单据（:VM_20200318-4-278）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875374);
INSERT INTO `vm_user_log` VALUES (2109, 4, '销售单（VM_20200318-4-277）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875517);
INSERT INTO `vm_user_log` VALUES (2110, 4, '销售单（VM_20200318-4-276）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875552);
INSERT INTO `vm_user_log` VALUES (2111, 4, '审核单据（:VM_20200318-4-277）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875559);
INSERT INTO `vm_user_log` VALUES (2112, 4, '销售单（VM_20200318-4-275）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875580);
INSERT INTO `vm_user_log` VALUES (2113, 4, '销售单（VM_20200318-4-274）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875616);
INSERT INTO `vm_user_log` VALUES (2114, 4, '审核单据（:VM_20200318-4-276）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875624);
INSERT INTO `vm_user_log` VALUES (2115, 4, '审核单据（:VM_20200318-4-275）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875628);
INSERT INTO `vm_user_log` VALUES (2116, 4, '审核单据（:VM_20200318-4-274）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875633);
INSERT INTO `vm_user_log` VALUES (2117, 4, '销售单（VM_20200318-4-273）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875652);
INSERT INTO `vm_user_log` VALUES (2118, 4, '销售单（VM_20200318-4-272）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875672);
INSERT INTO `vm_user_log` VALUES (2119, 4, '销售订单（VM_20200318-4-274）成功保存', 'admin/sales/editSales', '1.202.6.206', 1584875687);
INSERT INTO `vm_user_log` VALUES (2120, 4, '审核单据（:VM_20200318-4-273）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875697);
INSERT INTO `vm_user_log` VALUES (2121, 1, '订单（VM_20200322-1-325）成功保存', 'admin/storage/addStorage', '1.202.6.206', 1584875802);
INSERT INTO `vm_user_log` VALUES (2122, 1, '采购订单（VM_20200322-1-325）成功保存', 'admin/storage/editStorage', '1.202.6.206', 1584875838);
INSERT INTO `vm_user_log` VALUES (2123, 1, '审核单据（:VM_20200322-1-325）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875847);
INSERT INTO `vm_user_log` VALUES (2124, 4, '销售单（VM_20200318-4-271）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875871);
INSERT INTO `vm_user_log` VALUES (2125, 4, '销售单（VM_20200318-4-270）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875943);
INSERT INTO `vm_user_log` VALUES (2126, 4, '审核单据（:VM_20200318-4-272）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584875955);
INSERT INTO `vm_user_log` VALUES (2127, 4, '销售单（VM_20200318-4-269）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584875993);
INSERT INTO `vm_user_log` VALUES (2128, 4, '审核单据（:VM_20200318-4-271）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584876022);
INSERT INTO `vm_user_log` VALUES (2129, 4, '审核单据（:VM_20200318-4-269）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584876025);
INSERT INTO `vm_user_log` VALUES (2130, 4, '销售单（VM_20200318-4-268）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584876056);
INSERT INTO `vm_user_log` VALUES (2131, 4, '销售单（VM_20200318-4-267）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584876105);
INSERT INTO `vm_user_log` VALUES (2132, 1, '订单（VM_20200322-1-326）成功保存', 'admin/storage/addStorage', '1.202.6.206', 1584876503);
INSERT INTO `vm_user_log` VALUES (2133, 1, '审核单据（:VM_20200322-1-326）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584876522);
INSERT INTO `vm_user_log` VALUES (2134, 4, '销售单（VM_20200318-4-244）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584876555);
INSERT INTO `vm_user_log` VALUES (2135, 4, '销售订单（VM_20200318-4-244）成功保存', 'admin/sales/editSales', '1.202.6.206', 1584876585);
INSERT INTO `vm_user_log` VALUES (2136, 1, '审核单据（:VM_20200319-7-298）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584877298);
INSERT INTO `vm_user_log` VALUES (2137, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '113.246.245.170', 1584877302);
INSERT INTO `vm_user_log` VALUES (2138, 4, '销售单（VM_20200318-4-238）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584877436);
INSERT INTO `vm_user_log` VALUES (2139, 1, '审核单据（:VM_20200319-7-294）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584877492);
INSERT INTO `vm_user_log` VALUES (2140, 4, '销售单（VM_20200318-4-237）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584877536);
INSERT INTO `vm_user_log` VALUES (2141, 4, '审核单据（:VM_20200318-4-238）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584877554);
INSERT INTO `vm_user_log` VALUES (2142, 4, '审核单据（:VM_20200318-4-237）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584877566);
INSERT INTO `vm_user_log` VALUES (2143, 4, '销售单（VM_20200318-4-236）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584877613);
INSERT INTO `vm_user_log` VALUES (2144, 4, '审核单据（:VM_20200318-4-236）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584877947);
INSERT INTO `vm_user_log` VALUES (2145, 4, '销售单（VM_20200318-4-234）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878015);
INSERT INTO `vm_user_log` VALUES (2146, 4, '审核单据（:VM_20200318-4-234）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878024);
INSERT INTO `vm_user_log` VALUES (2147, 4, '销售单（VM_20200318-4-233）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878060);
INSERT INTO `vm_user_log` VALUES (2148, 4, '销售单（VM_20200318-4-232）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878113);
INSERT INTO `vm_user_log` VALUES (2149, 4, '审核单据（:VM_20200318-4-233）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878143);
INSERT INTO `vm_user_log` VALUES (2150, 4, '销售单（VM_20200318-4-231）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878173);
INSERT INTO `vm_user_log` VALUES (2151, 4, '销售单（VM_20200318-4-230）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878200);
INSERT INTO `vm_user_log` VALUES (2152, 4, '审核单据（:VM_20200318-4-231）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878210);
INSERT INTO `vm_user_log` VALUES (2153, 4, '审核单据（:VM_20200318-4-230）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878213);
INSERT INTO `vm_user_log` VALUES (2154, 4, '销售单（VM_20200318-4-229）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878242);
INSERT INTO `vm_user_log` VALUES (2155, 4, '审核单据（:VM_20200318-4-229）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878249);
INSERT INTO `vm_user_log` VALUES (2156, 4, '销售单（VM_20200318-4-228）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878310);
INSERT INTO `vm_user_log` VALUES (2157, 4, '审核单据（:VM_20200318-4-228）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878322);
INSERT INTO `vm_user_log` VALUES (2158, 4, '销售单（VM_20200318-4-227）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878344);
INSERT INTO `vm_user_log` VALUES (2159, 4, '销售单（VM_20200318-4-226）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878387);
INSERT INTO `vm_user_log` VALUES (2160, 4, '审核单据（:VM_20200318-4-226）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878396);
INSERT INTO `vm_user_log` VALUES (2161, 4, '销售单（VM_20200318-4-225）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878416);
INSERT INTO `vm_user_log` VALUES (2162, 4, '审核单据（:VM_20200318-4-227）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878437);
INSERT INTO `vm_user_log` VALUES (2163, 4, '销售订单（VM_20200318-4-224）成功保存', 'admin/sales/editSales', '1.202.6.206', 1584878469);
INSERT INTO `vm_user_log` VALUES (2164, 4, '销售订单（VM_20200318-4-224）成功保存', 'admin/sales/editSales', '1.202.6.206', 1584878510);
INSERT INTO `vm_user_log` VALUES (2165, 4, '销售单（VM_20200318-4-224）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878579);
INSERT INTO `vm_user_log` VALUES (2166, 4, '审核单据（:VM_20200318-4-225）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878588);
INSERT INTO `vm_user_log` VALUES (2167, 4, '审核单据（:VM_20200318-4-224）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878595);
INSERT INTO `vm_user_log` VALUES (2168, 4, '销售单（VM_20200318-4-223）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584878666);
INSERT INTO `vm_user_log` VALUES (2169, 4, '审核单据（:VM_20200318-4-223）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584878954);
INSERT INTO `vm_user_log` VALUES (2170, 4, '销售单（VM_20200318-4-220）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584879228);
INSERT INTO `vm_user_log` VALUES (2171, 4, '销售单（VM_20200318-4-222）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584879660);
INSERT INTO `vm_user_log` VALUES (2172, 4, '销售单（VM_20200318-4-221）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584879711);
INSERT INTO `vm_user_log` VALUES (2173, 4, '销售单（VM_20200318-4-219）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584879743);
INSERT INTO `vm_user_log` VALUES (2174, 4, '审核单据（:VM_20200318-4-220）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584879756);
INSERT INTO `vm_user_log` VALUES (2175, 4, '审核单据（:VM_20200318-4-222）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584879762);
INSERT INTO `vm_user_log` VALUES (2176, 4, '审核单据（:VM_20200318-4-219）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584879773);
INSERT INTO `vm_user_log` VALUES (2177, 4, '销售单（VM_20200318-4-218）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584879853);
INSERT INTO `vm_user_log` VALUES (2178, 4, '销售单（VM_20200318-4-217）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584879880);
INSERT INTO `vm_user_log` VALUES (2179, 4, '审核单据（:VM_20200318-4-218）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584879888);
INSERT INTO `vm_user_log` VALUES (2180, 4, '销售单（VM_20200318-4-216）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584879905);
INSERT INTO `vm_user_log` VALUES (2181, 4, '销售单（VM_20200318-4-215）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584879944);
INSERT INTO `vm_user_log` VALUES (2182, 4, '审核单据（:VM_20200318-4-217）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584879970);
INSERT INTO `vm_user_log` VALUES (2183, 4, '审核单据（:VM_20200318-4-216）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584879976);
INSERT INTO `vm_user_log` VALUES (2184, 4, '审核单据（:VM_20200318-4-215）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584879981);
INSERT INTO `vm_user_log` VALUES (2185, 4, '销售单（VM_20200318-4-214）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584880012);
INSERT INTO `vm_user_log` VALUES (2186, 4, '销售单（VM_20200313-4-196）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584880353);
INSERT INTO `vm_user_log` VALUES (2187, 1, '单据（VM_20200223-1-12）删除成功', 'admin/pub/delOrder', '1.202.6.206', 1584880391);
INSERT INTO `vm_user_log` VALUES (2188, 4, '销售单（VM_20200318-4-228）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584881761);
INSERT INTO `vm_user_log` VALUES (2189, 4, '销售单（VM_20200322-1-324）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584881794);
INSERT INTO `vm_user_log` VALUES (2190, 4, '审核单据（:VM_20200318-4-228）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584881830);
INSERT INTO `vm_user_log` VALUES (2191, 4, '审核单据（:VM_20200322-1-324）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584882103);
INSERT INTO `vm_user_log` VALUES (2192, 4, '销售单（VM_20200322-4-328）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584882632);
INSERT INTO `vm_user_log` VALUES (2193, 4, '审核单据（:VM_20200322-4-328）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584882663);
INSERT INTO `vm_user_log` VALUES (2194, 4, '销售单（VM_20200318-4-279）成功保存', 'admin/sales/addSales', '1.202.6.206', 1584882870);
INSERT INTO `vm_user_log` VALUES (2195, 4, '审核单据（:VM_20200318-4-279）成功', 'admin/pub/verifyOrder', '1.202.6.206', 1584882897);
INSERT INTO `vm_user_log` VALUES (2196, 6, '登陆系统', 'admin/login/login', '1.202.6.206', 1584926084);
INSERT INTO `vm_user_log` VALUES (2197, 7, '登陆系统', 'admin/login/login', '1.202.6.206', 1584928140);
INSERT INTO `vm_user_log` VALUES (2198, 7, '订单（VM_20200322-1-327）成功保存', 'admin/storage/addStorage', '1.202.5.48', 1584928635);
INSERT INTO `vm_user_log` VALUES (2199, 7, '登陆系统', 'admin/login/login', '1.202.4.153', 1584930499);
INSERT INTO `vm_user_log` VALUES (2200, 7, '订单（VM_20200323-7-330）成功保存', 'admin/storage/addStorage', '1.202.4.153', 1584931127);
INSERT INTO `vm_user_log` VALUES (2201, 7, '订单（VM_20200323-7-331）成功保存', 'admin/storage/addStorage', '1.202.4.153', 1584931226);
INSERT INTO `vm_user_log` VALUES (2202, 6, '登陆系统', 'admin/login/login', '124.126.213.126', 1584952176);
INSERT INTO `vm_user_log` VALUES (2203, 1, '派车用车收回成功', 'admin/moduls.moduls_cars/back', '124.126.213.126', 1584954287);
INSERT INTO `vm_user_log` VALUES (2204, 7, '登陆系统', 'admin/login/login', '124.126.213.126', 1584956206);
INSERT INTO `vm_user_log` VALUES (2205, 1, '登陆系统', 'admin/login/login', '124.126.213.126', 1585010255);
INSERT INTO `vm_user_log` VALUES (2206, 5, '登陆系统', 'admin/login/login', '124.126.213.126', 1585011583);
INSERT INTO `vm_user_log` VALUES (2207, 6, '登陆系统', 'admin/login/login', '124.126.213.126', 1585016115);
INSERT INTO `vm_user_log` VALUES (2208, 7, '登陆系统', 'admin/login/login', '124.126.213.126', 1585024766);
INSERT INTO `vm_user_log` VALUES (2209, 7, '添加资产橡胶手套', 'admin/goods/addGoods', '124.126.213.126', 1585024979);
INSERT INTO `vm_user_log` VALUES (2210, 7, '添加资产抹布', 'admin/goods/addGoods', '124.126.213.126', 1585025166);
INSERT INTO `vm_user_log` VALUES (2211, 7, '添加资产蹲坑毛刷', 'admin/goods/addGoods', '124.126.213.126', 1585025248);
INSERT INTO `vm_user_log` VALUES (2212, 7, '添加资产墩布池过滤网', 'admin/goods/addGoods', '124.126.213.126', 1585025299);
INSERT INTO `vm_user_log` VALUES (2213, 7, '添加资产擦玻璃茅头', 'admin/goods/addGoods', '124.126.213.126', 1585025361);
INSERT INTO `vm_user_log` VALUES (2214, 7, '添加资产刮玻璃刮子', 'admin/goods/addGoods', '124.126.213.126', 1585025428);
INSERT INTO `vm_user_log` VALUES (2215, 7, '添加资产竹夹子（大）', 'admin/goods/addGoods', '124.126.213.126', 1585025603);
INSERT INTO `vm_user_log` VALUES (2216, 7, '添加资产清洁铲刀', 'admin/goods/addGoods', '124.126.213.126', 1585025643);
INSERT INTO `vm_user_log` VALUES (2217, 7, '添加资产高粱把扫把', 'admin/goods/addGoods', '124.126.213.126', 1585025692);
INSERT INTO `vm_user_log` VALUES (2218, 7, '添加资产大垃圾袋（12X14）', 'admin/goods/addGoods', '124.126.213.126', 1585025852);
INSERT INTO `vm_user_log` VALUES (2219, 7, '添加资产小垃圾袋', 'admin/goods/addGoods', '124.126.213.126', 1585026111);
INSERT INTO `vm_user_log` VALUES (2220, 7, '订单（VM_20200323-7-332）成功保存', 'admin/storage/addStorage', '124.126.213.126', 1585026739);
INSERT INTO `vm_user_log` VALUES (2221, 4, '登陆系统', 'admin/login/login', '124.126.213.126', 1585033571);
INSERT INTO `vm_user_log` VALUES (2222, 4, '登陆系统', 'admin/login/login', '124.126.213.126', 1585033590);
INSERT INTO `vm_user_log` VALUES (2223, 4, '登陆系统', 'admin/login/login', '124.126.213.126', 1585034099);
INSERT INTO `vm_user_log` VALUES (2224, 6, '登陆系统', 'admin/login/login', '124.126.213.126', 1585042399);
INSERT INTO `vm_user_log` VALUES (2225, 6, '登陆系统', 'admin/login/login', '124.126.213.126', 1585043575);
INSERT INTO `vm_user_log` VALUES (2226, 7, '登陆系统', 'admin/login/login', '124.126.213.126', 1585114582);
INSERT INTO `vm_user_log` VALUES (2227, 7, '添加资产证卡', 'admin/goods/addGoods', '124.126.213.126', 1585114638);
INSERT INTO `vm_user_log` VALUES (2228, 7, '添加资产打印机连接线', 'admin/goods/addGoods', '124.126.213.126', 1585114879);
INSERT INTO `vm_user_log` VALUES (2229, 4, '注销系统', 'admin/login/logout', '124.126.213.126', 1585119799);
INSERT INTO `vm_user_log` VALUES (2230, 1, '登陆系统', 'admin/login/login', '120.244.234.181', 1585141887);
INSERT INTO `vm_user_log` VALUES (2231, 1, '登陆系统', 'admin/login/login', '221.217.52.118', 1585144707);
INSERT INTO `vm_user_log` VALUES (2232, 6, '登陆系统', 'admin/login/login', '222.128.173.46', 1585203065);
INSERT INTO `vm_user_log` VALUES (2233, 7, '登陆系统', 'admin/login/login', '222.128.173.46', 1585207747);
INSERT INTO `vm_user_log` VALUES (2234, 7, '订单（VM_20200324-7-334）成功保存', 'admin/storage/addStorage', '222.128.173.46', 1585207935);
INSERT INTO `vm_user_log` VALUES (2235, 7, '订单（VM_20200326-7-335）成功保存', 'admin/storage/addStorage', '222.128.173.46', 1585208009);
INSERT INTO `vm_user_log` VALUES (2236, 7, '添加资产无线网卡', 'admin/goods/addGoods', '222.128.173.46', 1585208243);
INSERT INTO `vm_user_log` VALUES (2237, 7, '添加资产无线AP', 'admin/goods/addGoods', '222.128.173.46', 1585208305);
INSERT INTO `vm_user_log` VALUES (2238, 7, '添加资产系统U盘', 'admin/goods/addGoods', '222.128.173.46', 1585208361);
INSERT INTO `vm_user_log` VALUES (2239, 7, '订单（VM_20200326-7-336）成功保存', 'admin/storage/addStorage', '222.128.173.46', 1585208475);
INSERT INTO `vm_user_log` VALUES (2240, 7, '添加资产工位', 'admin/goods/addGoods', '222.128.173.46', 1585208577);
INSERT INTO `vm_user_log` VALUES (2241, 7, '添加资产小推柜', 'admin/goods/addGoods', '222.128.173.46', 1585208615);
INSERT INTO `vm_user_log` VALUES (2242, 7, '添加资产转椅', 'admin/goods/addGoods', '222.128.173.46', 1585208658);
INSERT INTO `vm_user_log` VALUES (2243, 7, '添加资产热敏打印纸', 'admin/goods/addGoods', '222.128.173.46', 1585208715);
INSERT INTO `vm_user_log` VALUES (2244, 7, '添加资产电线收纳扎带器', 'admin/goods/addGoods', '222.128.173.46', 1585208766);
INSERT INTO `vm_user_log` VALUES (2245, 7, '订单（VM_20200326-7-337）成功保存', 'admin/storage/addStorage', '222.128.173.46', 1585208894);
INSERT INTO `vm_user_log` VALUES (2246, 7, '添加资产网线', 'admin/goods/addGoods', '222.128.173.46', 1585209135);
INSERT INTO `vm_user_log` VALUES (2247, 7, '添加资产电胶带', 'admin/goods/addGoods', '222.128.173.46', 1585209190);
INSERT INTO `vm_user_log` VALUES (2248, 7, '添加资产长扎带', 'admin/goods/addGoods', '222.128.173.46', 1585209245);
INSERT INTO `vm_user_log` VALUES (2249, 7, '添加资产网线钳', 'admin/goods/addGoods', '222.128.173.46', 1585209376);
INSERT INTO `vm_user_log` VALUES (2250, 7, '添加资产水晶头', 'admin/goods/addGoods', '222.128.173.46', 1585209590);
INSERT INTO `vm_user_log` VALUES (2251, 4, '登陆系统', 'admin/login/login', '124.126.165.39', 1585212089);
INSERT INTO `vm_user_log` VALUES (2252, 7, '订单（VM_20200326-7-338）成功保存', 'admin/storage/addStorage', '222.128.173.46', 1585217361);
INSERT INTO `vm_user_log` VALUES (2253, 4, '登陆系统', 'admin/login/login', '117.136.0.240', 1585225679);
INSERT INTO `vm_user_log` VALUES (2254, 1, '登陆系统', 'admin/login/login', '117.136.0.240', 1585230584);
INSERT INTO `vm_user_log` VALUES (2255, 4, '登陆系统', 'admin/login/login', '124.126.165.39', 1585271319);
INSERT INTO `vm_user_log` VALUES (2256, 6, '登陆系统', 'admin/login/login', '222.128.173.46', 1585272127);
INSERT INTO `vm_user_log` VALUES (2257, 7, '登陆系统', 'admin/login/login', '222.128.173.46', 1585274183);
INSERT INTO `vm_user_log` VALUES (2258, 7, '添加供应商二手家具', 'admin/goods/addSupplier', '222.128.173.46', 1585275161);
INSERT INTO `vm_user_log` VALUES (2259, 7, '订单（VM_20200326-7-339）成功保存', 'admin/storage/addStorage', '222.128.173.46', 1585275382);
INSERT INTO `vm_user_log` VALUES (2260, 7, '登陆系统', 'admin/login/login', '222.128.173.46', 1585275546);
INSERT INTO `vm_user_log` VALUES (2261, 4, '销售单（VM_20200322-4-329）成功保存', 'admin/sales/addSales', '124.126.165.39', 1585296489);
INSERT INTO `vm_user_log` VALUES (2262, 4, '销售单（VM_20200327-4-341）成功保存', 'admin/sales/addSales', '124.126.165.39', 1585296550);
INSERT INTO `vm_user_log` VALUES (2263, 1, '登陆系统', 'admin/login/login', '106.121.70.25', 1585532281);
INSERT INTO `vm_user_log` VALUES (2264, 1, '登陆系统', 'admin/login/login', '106.121.70.25', 1585532396);
INSERT INTO `vm_user_log` VALUES (2265, 6, '登陆系统', 'admin/login/login', '125.33.194.227', 1585545627);
INSERT INTO `vm_user_log` VALUES (2266, 1, '登陆系统', 'admin/login/login', '125.33.194.227', 1585545806);
INSERT INTO `vm_user_log` VALUES (2267, 1, '注销系统', 'admin/login/logout', '125.33.194.227', 1585545966);
INSERT INTO `vm_user_log` VALUES (2268, 1, '登陆系统', 'admin/login/login', '125.33.194.227', 1585546019);
INSERT INTO `vm_user_log` VALUES (2269, 1, '注销系统', 'admin/login/logout', '125.33.194.227', 1585546122);
INSERT INTO `vm_user_log` VALUES (2270, 1, '登陆系统', 'admin/login/login', '125.33.194.227', 1585546173);
INSERT INTO `vm_user_log` VALUES (2271, 1, '注销系统', 'admin/login/logout', '125.33.194.227', 1585546204);
INSERT INTO `vm_user_log` VALUES (2272, 2, '登陆系统', 'admin/login/login', '125.33.194.227', 1585546211);
INSERT INTO `vm_user_log` VALUES (2273, 2, '登陆系统', 'admin/login/login', '125.33.194.227', 1585550486);
INSERT INTO `vm_user_log` VALUES (2274, 2, '注销系统', 'admin/login/logout', '125.33.194.227', 1585558695);
INSERT INTO `vm_user_log` VALUES (2275, 1, '登陆系统', 'admin/login/login', '125.33.194.227', 1585558717);
INSERT INTO `vm_user_log` VALUES (2276, 7, '登陆系统', 'admin/login/login', '125.33.194.227', 1585559783);
INSERT INTO `vm_user_log` VALUES (2277, 7, '登陆系统', 'admin/login/login', '125.33.194.227', 1585561369);
INSERT INTO `vm_user_log` VALUES (2278, 4, '登陆系统', 'admin/login/login', '124.126.221.17', 1585634918);
INSERT INTO `vm_user_log` VALUES (2279, 4, '销售单（VM_20200327-4-342）成功保存', 'admin/sales/addSales', '124.126.221.17', 1585635133);
INSERT INTO `vm_user_log` VALUES (2280, 4, '审核单据（:VM_20200327-4-341）成功', 'admin/pub/verifyOrder', '124.126.221.17', 1585635187);
INSERT INTO `vm_user_log` VALUES (2281, 4, '审核单据（:VM_20200322-4-329）成功', 'admin/pub/verifyOrder', '124.126.221.17', 1585635192);
INSERT INTO `vm_user_log` VALUES (2282, 4, '审核单据（:VM_20200327-4-342）成功', 'admin/pub/verifyOrder', '124.126.221.17', 1585635200);
INSERT INTO `vm_user_log` VALUES (2283, 4, '销售单（VM_20200331-4-343）成功保存', 'admin/sales/addSales', '124.126.221.17', 1585636843);
INSERT INTO `vm_user_log` VALUES (2284, 4, '销售单（VM_20200331-4-344）成功保存', 'admin/sales/addSales', '124.126.221.17', 1585636903);
INSERT INTO `vm_user_log` VALUES (2285, 6, '登陆系统', 'admin/login/login', '125.33.194.227', 1585644072);
INSERT INTO `vm_user_log` VALUES (2286, 6, '登陆系统', 'admin/login/login', '125.33.194.227', 1585719584);
INSERT INTO `vm_user_log` VALUES (2287, 4, '登陆系统', 'admin/login/login', '124.126.221.17', 1585721523);
INSERT INTO `vm_user_log` VALUES (2288, 6, '登陆系统', 'admin/login/login', '114.249.224.63', 1585790179);
INSERT INTO `vm_user_log` VALUES (2289, 7, '登陆系统', 'admin/login/login', '114.249.224.63', 1585793597);
INSERT INTO `vm_user_log` VALUES (2290, 7, '采购订单（VM_20200326-7-339）成功保存', 'admin/storage/editStorage', '114.249.224.63', 1585793702);
INSERT INTO `vm_user_log` VALUES (2291, 7, '添加资产小黄鱼', 'admin/goods/addGoods', '114.249.224.63', 1585793964);
INSERT INTO `vm_user_log` VALUES (2292, 6, '登陆系统', 'admin/login/login', '114.249.224.63', 1585794611);
INSERT INTO `vm_user_log` VALUES (2293, 7, '登陆系统', 'admin/login/login', '114.249.224.63', 1585795752);
INSERT INTO `vm_user_log` VALUES (2294, 7, '订单（VM_20200327-7-340）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1585795860);
INSERT INTO `vm_user_log` VALUES (2295, 7, '订单（VM_20200402-7-346）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1585795968);
INSERT INTO `vm_user_log` VALUES (2296, 7, '采购订单（VM_20200402-7-346）成功保存', 'admin/storage/editStorage', '114.249.224.63', 1585796008);
INSERT INTO `vm_user_log` VALUES (2297, 7, '添加资产寻线仪', 'admin/goods/addGoods', '114.249.224.63', 1585796114);
INSERT INTO `vm_user_log` VALUES (2298, 7, '订单（VM_20200402-7-347）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1585796205);
INSERT INTO `vm_user_log` VALUES (2299, 7, '采购订单（VM_20200402-7-347）成功保存', 'admin/storage/editStorage', '114.249.224.63', 1585797819);
INSERT INTO `vm_user_log` VALUES (2300, 7, '添加资产橡胶椅子', 'admin/goods/addGoods', '114.249.224.63', 1585797896);
INSERT INTO `vm_user_log` VALUES (2301, 7, '添加资产海绵桌脚贴（角贴）', 'admin/goods/addGoods', '114.249.224.63', 1585797957);
INSERT INTO `vm_user_log` VALUES (2302, 7, '添加资产海绵桌脚贴（边贴）', 'admin/goods/addGoods', '114.249.224.63', 1585797995);
INSERT INTO `vm_user_log` VALUES (2303, 7, '订单（VM_20200402-7-348）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1585798090);
INSERT INTO `vm_user_log` VALUES (2304, 7, '添加资产花洒', 'admin/goods/addGoods', '114.249.224.63', 1585798177);
INSERT INTO `vm_user_log` VALUES (2305, 7, '订单（VM_20200402-7-349）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1585798277);
INSERT INTO `vm_user_log` VALUES (2306, 7, '添加资产休闲桌椅', 'admin/goods/addGoods', '114.249.224.63', 1585798401);
INSERT INTO `vm_user_log` VALUES (2307, 7, '添加供应商加博尔服装有限公司', 'admin/goods/addSupplier', '114.249.224.63', 1585798589);
INSERT INTO `vm_user_log` VALUES (2308, 7, '添加资产西服', 'admin/goods/addGoods', '114.249.224.63', 1585798636);
INSERT INTO `vm_user_log` VALUES (2309, 7, '添加资产衬衣', 'admin/goods/addGoods', '114.249.224.63', 1585798673);
INSERT INTO `vm_user_log` VALUES (2310, 7, '添加供应商安和3国际展览设计有限公司', 'admin/goods/addSupplier', '114.249.224.63', 1585799064);
INSERT INTO `vm_user_log` VALUES (2311, 7, '订单（VM_20200402-7-350）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1585799263);
INSERT INTO `vm_user_log` VALUES (2312, 7, '订单（VM_20200402-7-351）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1585799400);
INSERT INTO `vm_user_log` VALUES (2313, 7, '添加资产笑脸贴', 'admin/goods/addGoods', '114.249.224.63', 1585799454);
INSERT INTO `vm_user_log` VALUES (2314, 7, '添加资产浅蓝A4打印纸', 'admin/goods/addGoods', '114.249.224.63', 1585799502);
INSERT INTO `vm_user_log` VALUES (2315, 7, '修改供应商安和通国际展览设计有限公司', 'admin/goods/editSupplier', '114.249.224.63', 1585799568);
INSERT INTO `vm_user_log` VALUES (2316, 1, '登陆系统', 'admin/login/login', '120.244.234.129', 1585834166);
INSERT INTO `vm_user_log` VALUES (2317, 6, '登陆系统', 'admin/login/login', '114.249.224.63', 1585876264);
INSERT INTO `vm_user_log` VALUES (2318, 7, '登陆系统', 'admin/login/login', '114.249.224.63', 1585878008);
INSERT INTO `vm_user_log` VALUES (2319, 7, '添加供应商海林面板', 'admin/goods/addSupplier', '114.249.224.63', 1585878117);
INSERT INTO `vm_user_log` VALUES (2320, 1, '登陆系统', 'admin/login/login', '114.249.224.63', 1585878735);
INSERT INTO `vm_user_log` VALUES (2321, 7, '登陆系统', 'admin/login/login', '114.249.224.63', 1585882017);
INSERT INTO `vm_user_log` VALUES (2322, 6, '订单（VM_20200402-7-352）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1585882451);
INSERT INTO `vm_user_log` VALUES (2323, 1, '单据（VM_20200322-1-323）删除成功', 'admin/pub/delOrder', '114.249.224.63', 1585894850);
INSERT INTO `vm_user_log` VALUES (2324, 2, '登陆系统', 'admin/login/login', '114.249.224.63', 1586220233);
INSERT INTO `vm_user_log` VALUES (2325, 6, '登陆系统', 'admin/login/login', '114.249.224.63', 1586222833);
INSERT INTO `vm_user_log` VALUES (2326, 4, '登陆系统', 'admin/login/login', '124.126.221.17', 1586242043);
INSERT INTO `vm_user_log` VALUES (2327, 6, '登陆系统', 'admin/login/login', '114.249.224.63', 1586316661);
INSERT INTO `vm_user_log` VALUES (2328, 1, '登陆系统', 'admin/login/login', '114.249.224.63', 1586324202);
INSERT INTO `vm_user_log` VALUES (2329, 7, '登陆系统', 'admin/login/login', '114.249.224.63', 1586326960);
INSERT INTO `vm_user_log` VALUES (2330, 7, '添加资产施耐德LED灯', 'admin/goods/addGoods', '114.249.224.63', 1586327111);
INSERT INTO `vm_user_log` VALUES (2331, 7, '添加供应商一次性采购', 'admin/goods/addSupplier', '114.249.224.63', 1586327267);
INSERT INTO `vm_user_log` VALUES (2332, 7, '添加资产斯耐德LED灯', 'admin/goods/addGoods', '114.249.224.63', 1586327627);
INSERT INTO `vm_user_log` VALUES (2333, 7, '添加资产斯耐德LED灯', 'admin/goods/addGoods', '114.249.224.63', 1586327628);
INSERT INTO `vm_user_log` VALUES (2334, 7, '订单（VM_20200403-6-353）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1586327770);
INSERT INTO `vm_user_log` VALUES (2335, 7, '添加资产抽纸（心相印）', 'admin/goods/addGoods', '114.249.224.63', 1586328246);
INSERT INTO `vm_user_log` VALUES (2336, 7, '添加资产红笔', 'admin/goods/addGoods', '114.249.224.63', 1586328441);
INSERT INTO `vm_user_log` VALUES (2337, 7, '添加资产抽纸', 'admin/goods/addGoods', '114.249.224.63', 1586328706);
INSERT INTO `vm_user_log` VALUES (2338, 7, '订单（VM_20200408-7-354）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1586328882);
INSERT INTO `vm_user_log` VALUES (2339, 7, '添加供应商科贸', 'admin/goods/addSupplier', '114.249.224.63', 1586329357);
INSERT INTO `vm_user_log` VALUES (2340, 7, '添加资产投影仪升降梯', 'admin/goods/addGoods', '114.249.224.63', 1586329372);
INSERT INTO `vm_user_log` VALUES (2341, 7, '添加资产投影仪灯泡', 'admin/goods/addGoods', '114.249.224.63', 1586329447);
INSERT INTO `vm_user_log` VALUES (2342, 7, '订单（VM_20200408-7-355）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1586329561);
INSERT INTO `vm_user_log` VALUES (2343, 7, '添加资产投影仪遥控器', 'admin/goods/addGoods', '114.249.224.63', 1586329644);
INSERT INTO `vm_user_log` VALUES (2344, 7, '添加资产usb转RJ45线', 'admin/goods/addGoods', '114.249.224.63', 1586329698);
INSERT INTO `vm_user_log` VALUES (2345, 7, '订单（VM_20200408-7-356）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1586329761);
INSERT INTO `vm_user_log` VALUES (2346, 7, '修改供应商科贸', 'admin/goods/editSupplier', '114.249.224.63', 1586329903);
INSERT INTO `vm_user_log` VALUES (2347, 7, '修改供应商恒晟微创科技有限公司', 'admin/goods/editSupplier', '114.249.224.63', 1586330135);
INSERT INTO `vm_user_log` VALUES (2348, 7, '添加资产TP双频无线网卡', 'admin/goods/addGoods', '114.249.224.63', 1586330227);
INSERT INTO `vm_user_log` VALUES (2349, 7, '添加资产TP双频无线网卡', 'admin/goods/addGoods', '114.249.224.63', 1586330268);
INSERT INTO `vm_user_log` VALUES (2350, 7, '订单（VM_20200408-7-357）成功保存', 'admin/storage/addStorage', '114.249.224.63', 1586330343);
INSERT INTO `vm_user_log` VALUES (2351, 1, '登陆系统', 'admin/login/login', '221.221.148.230', 1586489927);
INSERT INTO `vm_user_log` VALUES (2352, 6, '登陆系统', 'admin/login/login', '221.221.148.230', 1586499037);
INSERT INTO `vm_user_log` VALUES (2353, 7, '登陆系统', 'admin/login/login', '221.221.148.230', 1586499331);
INSERT INTO `vm_user_log` VALUES (2354, 6, '登陆系统', 'admin/login/login', '221.221.148.230', 1586499630);
INSERT INTO `vm_user_log` VALUES (2355, 1, '登陆系统', 'admin/login/login', '222.240.57.232', 1586692111);
INSERT INTO `vm_user_log` VALUES (2356, 6, '登陆系统', 'admin/login/login', '221.221.148.230', 1586742444);
INSERT INTO `vm_user_log` VALUES (2357, 4, '登陆系统', 'admin/login/login', '124.126.221.17', 1586743623);
INSERT INTO `vm_user_log` VALUES (2358, 7, '登陆系统', 'admin/login/login', '221.221.148.230', 1586763096);
INSERT INTO `vm_user_log` VALUES (2359, 7, '添加资产三木订书机(加一盒钉子)', 'admin/goods/addGoods', '221.221.148.230', 1586763239);
INSERT INTO `vm_user_log` VALUES (2360, 7, '订单（VM_20200408-7-358）成功保存', 'admin/storage/addStorage', '221.221.148.230', 1586763306);
INSERT INTO `vm_user_log` VALUES (2361, 7, '添加资产移动硬盘-希捷', 'admin/goods/addGoods', '221.221.148.230', 1586763367);
INSERT INTO `vm_user_log` VALUES (2362, 7, '订单（VM_20200413-7-359）成功保存', 'admin/storage/addStorage', '221.221.148.230', 1586763440);
INSERT INTO `vm_user_log` VALUES (2363, 7, '添加资产支出凭证', 'admin/goods/addGoods', '221.221.148.230', 1586763526);
INSERT INTO `vm_user_log` VALUES (2364, 7, '添加资产打印机条', 'admin/goods/addGoods', '221.221.148.230', 1586763598);
INSERT INTO `vm_user_log` VALUES (2365, 7, '添加资产洗洁灵', 'admin/goods/addGoods', '221.221.148.230', 1586763720);
INSERT INTO `vm_user_log` VALUES (2366, 7, '添加资产杀虫剂', 'admin/goods/addGoods', '221.221.148.230', 1586763785);
INSERT INTO `vm_user_log` VALUES (2367, 7, '订单（VM_20200413-7-360）成功保存', 'admin/storage/addStorage', '221.221.148.230', 1586763904);
INSERT INTO `vm_user_log` VALUES (2368, 7, '订单（VM_20200413-7-361）成功保存', 'admin/storage/addStorage', '221.221.148.230', 1586763955);
INSERT INTO `vm_user_log` VALUES (2369, 12, '登陆系统', 'admin/login/login', '123.121.167.58', 1586828209);
INSERT INTO `vm_user_log` VALUES (2370, 12, '登陆系统', 'admin/login/login', '123.121.167.58', 1586829219);
INSERT INTO `vm_user_log` VALUES (2371, 1, '登陆系统', 'admin/login/login', '221.221.148.230', 1586829274);
INSERT INTO `vm_user_log` VALUES (2372, 1, '修改密码', 'admin/user/editPasswd', '221.221.148.230', 1586831209);
INSERT INTO `vm_user_log` VALUES (2373, 1, '注销系统', 'admin/login/logout', '221.221.148.230', 1586831212);
INSERT INTO `vm_user_log` VALUES (2374, 12, '注销系统', 'admin/login/logout', '123.121.167.58', 1586831220);
INSERT INTO `vm_user_log` VALUES (2375, 1, '登陆系统', 'admin/login/login', '221.221.148.230', 1586831224);
INSERT INTO `vm_user_log` VALUES (2376, 1, '登陆系统', 'admin/login/login', '123.121.167.58', 1586831234);
INSERT INTO `vm_user_log` VALUES (2377, 1, '登陆系统', 'admin/login/login', '123.121.167.58', 1586834470);
INSERT INTO `vm_user_log` VALUES (2378, 1, '订单（VM_20200413-7-362）成功保存', 'admin/storage/addStorage', '221.221.148.230', 1586834823);
INSERT INTO `vm_user_log` VALUES (2379, 1, '订单（VM_20200414-1-363）成功保存', 'admin/storage/addStorage', '221.221.148.230', 1586834866);
INSERT INTO `vm_user_log` VALUES (2380, 1, '单据（VM_20200414-1-363）删除成功', 'admin/pub/delOrder', '221.221.148.230', 1586850013);
INSERT INTO `vm_user_log` VALUES (2381, 1, '单据（VM_20200413-7-362）删除成功', 'admin/pub/delOrder', '221.221.148.230', 1586850019);
INSERT INTO `vm_user_log` VALUES (2382, 1, '登陆系统', 'admin/login/login', '123.121.167.58', 1586857776);
INSERT INTO `vm_user_log` VALUES (2383, 1, '登陆系统', 'admin/login/login', '123.121.167.58', 1586857839);
INSERT INTO `vm_user_log` VALUES (2384, 1, '注销系统', 'admin/login/logout', '221.221.148.230', 1586918265);
INSERT INTO `vm_user_log` VALUES (2385, 6, '登陆系统', 'admin/login/login', '221.221.148.230', 1586918281);
INSERT INTO `vm_user_log` VALUES (2386, 6, '注销系统', 'admin/login/logout', '221.221.148.230', 1586918298);
INSERT INTO `vm_user_log` VALUES (2387, 1, '登陆系统', 'admin/login/login', '221.221.148.230', 1586918323);
INSERT INTO `vm_user_log` VALUES (2388, 1, '注销系统', 'admin/login/logout', '221.221.148.230', 1586918367);
INSERT INTO `vm_user_log` VALUES (2389, 1, '登陆系统', 'admin/login/login', '221.221.148.230', 1586918376);
INSERT INTO `vm_user_log` VALUES (2390, 1, '注销系统', 'admin/login/logout', '221.221.148.230', 1586918427);
INSERT INTO `vm_user_log` VALUES (2391, 6, '登陆系统', 'admin/login/login', '221.221.148.230', 1586918445);
INSERT INTO `vm_user_log` VALUES (2392, 6, '注销系统', 'admin/login/logout', '221.221.148.230', 1586918456);
INSERT INTO `vm_user_log` VALUES (2393, 1, '登陆系统', 'admin/login/login', '221.221.148.230', 1586918470);
INSERT INTO `vm_user_log` VALUES (2394, 1, '注销系统', 'admin/login/logout', '221.221.148.230', 1586918568);
INSERT INTO `vm_user_log` VALUES (2395, 6, '登陆系统', 'admin/login/login', '221.221.148.230', 1586918592);
INSERT INTO `vm_user_log` VALUES (2396, 6, '注销系统', 'admin/login/logout', '221.221.148.230', 1586918822);
INSERT INTO `vm_user_log` VALUES (2397, 1, '登陆系统', 'admin/login/login', '221.221.148.230', 1586918839);
INSERT INTO `vm_user_log` VALUES (2398, 1, '登陆系统', 'admin/login/login', '125.34.0.212', 1587017475);
INSERT INTO `vm_user_log` VALUES (2399, 1, '登陆系统', 'admin/login/login', '221.221.145.208', 1587017795);
INSERT INTO `vm_user_log` VALUES (2400, 1, '添加工程项目: 测试工程', 'admin/goods/addProject', '125.34.0.212', 1587019539);
INSERT INTO `vm_user_log` VALUES (2401, 1, '编辑部门分类（ID：1）', 'admin/goods/editProject', '125.34.0.212', 1587020256);
INSERT INTO `vm_user_log` VALUES (2402, 1, '编辑部门分类（ID：1）', 'admin/goods/editProject', '125.34.0.212', 1587020263);
INSERT INTO `vm_user_log` VALUES (2403, 1, '添加工程项目: 测试工程2', 'admin/goods/addProject', '125.34.0.212', 1587020570);
INSERT INTO `vm_user_log` VALUES (2404, 1, '登陆系统', 'admin/login/login', '221.221.145.208', 1587022932);
INSERT INTO `vm_user_log` VALUES (2405, 1, '编辑工程项目（ID：1）', 'admin/goods/editProject', '221.221.145.208', 1587023037);
INSERT INTO `vm_user_log` VALUES (2406, 1, '编辑工程项目（ID：2）', 'admin/goods/editProject', '221.221.145.208', 1587023201);
INSERT INTO `vm_user_log` VALUES (2407, 1, '添加工程项目: M6-四层-北侧（东北侧）', 'admin/goods/addProject', '221.221.145.208', 1587023358);
INSERT INTO `vm_user_log` VALUES (2408, 1, '编辑工程项目（ID：2）', 'admin/goods/editProject', '221.221.145.208', 1587023376);
INSERT INTO `vm_user_log` VALUES (2409, 1, '添加工程项目: M6一层-平台（商铺）', 'admin/goods/addProject', '221.221.145.208', 1587023502);
INSERT INTO `vm_user_log` VALUES (2410, 1, '编辑工程项目（ID：3）', 'admin/goods/editProject', '221.221.145.208', 1587023510);
INSERT INTO `vm_user_log` VALUES (2411, 1, '编辑工程项目（ID：2）', 'admin/goods/editProject', '221.221.145.208', 1587023516);
INSERT INTO `vm_user_log` VALUES (2412, 1, '编辑工程项目（ID：1）', 'admin/goods/editProject', '221.221.145.208', 1587023523);
INSERT INTO `vm_user_log` VALUES (2413, 1, '添加工程项目: M6一层-空调机房', 'admin/goods/addProject', '221.221.145.208', 1587023577);
INSERT INTO `vm_user_log` VALUES (2414, 1, '编辑工程项目（ID：4）', 'admin/goods/editProject', '221.221.145.208', 1587023586);
INSERT INTO `vm_user_log` VALUES (2415, 1, '编辑工程项目（ID：1）', 'admin/goods/editProject', '221.221.145.208', 1587023591);
INSERT INTO `vm_user_log` VALUES (2416, 1, '添加工程项目: M6一层-隔断墙', 'admin/goods/addProject', '221.221.145.208', 1587023726);
INSERT INTO `vm_user_log` VALUES (2417, 1, '添加工程项目: M6一层-逃生通道', 'admin/goods/addProject', '221.221.145.208', 1587023752);
INSERT INTO `vm_user_log` VALUES (2418, 1, '编辑工程项目（ID：7）', 'admin/goods/editProject', '221.221.145.208', 1587025800);
INSERT INTO `vm_user_log` VALUES (2419, 1, '编辑工程项目（ID：6）', 'admin/goods/editProject', '221.221.145.208', 1587025811);
INSERT INTO `vm_user_log` VALUES (2420, 1, '编辑工程项目（ID：5）', 'admin/goods/editProject', '221.221.145.208', 1587025823);
INSERT INTO `vm_user_log` VALUES (2421, 1, '添加客户盘彦国', 'admin/member/addMember', '221.221.145.208', 1587025941);
INSERT INTO `vm_user_log` VALUES (2422, 1, '编辑工程项目（ID：4）', 'admin/goods/editProject', '221.221.145.208', 1587026005);
INSERT INTO `vm_user_log` VALUES (2423, 1, '编辑工程项目（ID：3）', 'admin/goods/editProject', '221.221.145.208', 1587026016);
INSERT INTO `vm_user_log` VALUES (2424, 1, '编辑工程项目（ID：2）', 'admin/goods/editProject', '221.221.145.208', 1587026038);
INSERT INTO `vm_user_log` VALUES (2425, 1, '编辑工程项目（ID：1）', 'admin/goods/editProject', '221.221.145.208', 1587026047);
INSERT INTO `vm_user_log` VALUES (2426, 12, '订单（VM_20200414-1-364）成功保存', 'admin/storage/addStorage', '124.200.109.50', 1587104097);
INSERT INTO `vm_user_log` VALUES (2427, 12, '单据（VM_20200414-1-364）删除成功', 'admin/pub/delOrder', '124.200.109.50', 1587104113);
INSERT INTO `vm_user_log` VALUES (2428, 1, '登陆系统', 'admin/login/login', '125.34.0.212', 1587211174);
INSERT INTO `vm_user_log` VALUES (2429, 1, '添加企业名称: 测试企业名称', 'admin/estate.enterprise/add', '125.34.0.212', 1587216567);
INSERT INTO `vm_user_log` VALUES (2430, 1, '添加企业名称: 测试企业名称', 'admin/estate.enterprise/edit', '125.34.0.212', 1587217418);
INSERT INTO `vm_user_log` VALUES (2431, 1, '添加企业名称: 测试企业名称', 'admin/estate.enterprise/edit', '125.34.0.212', 1587217437);
INSERT INTO `vm_user_log` VALUES (2432, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '125.34.0.212', 1587219240);
INSERT INTO `vm_user_log` VALUES (2433, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '125.34.0.212', 1587219281);
INSERT INTO `vm_user_log` VALUES (2434, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '125.34.0.212', 1587219302);
INSERT INTO `vm_user_log` VALUES (2435, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '125.34.0.212', 1587219311);
INSERT INTO `vm_user_log` VALUES (2436, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '125.34.0.212', 1587219339);
INSERT INTO `vm_user_log` VALUES (2437, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '125.34.0.212', 1587219348);
INSERT INTO `vm_user_log` VALUES (2438, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '125.34.0.212', 1587219392);
INSERT INTO `vm_user_log` VALUES (2439, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '125.34.0.212', 1587219395);
INSERT INTO `vm_user_log` VALUES (2440, 1, '修改企业名称: 测试企业名称', 'admin/estate.enterprise/edit', '125.34.0.212', 1587219403);
INSERT INTO `vm_user_log` VALUES (2441, 12, '注销系统', 'admin/login/logout', '124.200.109.50', 1587367924);
INSERT INTO `vm_user_log` VALUES (2442, 1, '登陆系统', 'admin/login/login', '124.200.109.50', 1587367945);
INSERT INTO `vm_user_log` VALUES (2443, 1, '添加车辆: TEST(车牌号：京A245N7)', 'admin/estate.car/add', '221.221.145.208', 1587376266);
INSERT INTO `vm_user_log` VALUES (2444, 1, '添加车辆: 桂林(车牌号：津AD252C)', 'admin/estate.car/add', '221.221.145.208', 1587376415);
INSERT INTO `vm_user_log` VALUES (2445, 1, '添加车辆: 1(车牌号：1)', 'admin/estate.car/add', '221.221.145.208', 1587377765);
INSERT INTO `vm_user_log` VALUES (2446, 1, '添加车辆: #$##@@$(车牌号：京!@*#($E_)', 'admin/estate.car/add', '221.221.145.208', 1587377819);
INSERT INTO `vm_user_log` VALUES (2447, 1, '添加车辆: 测试(车牌号：121212)', 'admin/estate.car/add', '124.200.109.50', 1587377868);
INSERT INTO `vm_user_log` VALUES (2448, 1, '删除车辆（ID：0）', 'admin/estate.car/del', '124.200.109.50', 1587380919);
INSERT INTO `vm_user_log` VALUES (2449, 1, '删除车辆（ID：5）', 'admin/estate.car/del', '124.200.109.50', 1587381170);
INSERT INTO `vm_user_log` VALUES (2450, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '124.200.109.50', 1587381402);
INSERT INTO `vm_user_log` VALUES (2451, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '124.200.109.50', 1587381403);
INSERT INTO `vm_user_log` VALUES (2452, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '124.200.109.50', 1587381404);
INSERT INTO `vm_user_log` VALUES (2453, 1, '修改企业状态:（ID： 2）', 'admin/estate.enterprise/editStatus', '124.200.109.50', 1587381412);
INSERT INTO `vm_user_log` VALUES (2454, 1, '编辑车辆: #$##@@$(车牌号：京!@*#($E_)', 'admin/estate.car/edit', '120.244.234.96', 1587384985);
INSERT INTO `vm_user_log` VALUES (2455, 1, '编辑车辆: 桂林(车牌号：津AD252C)', 'admin/estate.car/edit', '120.244.234.96', 1587385031);
INSERT INTO `vm_user_log` VALUES (2456, 1, '编辑车辆: TEST(车牌号：京A245N7)', 'admin/estate.car/edit', '120.244.234.96', 1587385054);
INSERT INTO `vm_user_log` VALUES (2457, 1, '添加车辆: TEST1(车牌号：京A0023111)', 'admin/estate.car/add', '120.244.234.96', 1587385174);
INSERT INTO `vm_user_log` VALUES (2458, 1, '编辑车辆: TEST1(车牌号：京A0023111)', 'admin/estate.car/edit', '120.244.234.96', 1587385449);
INSERT INTO `vm_user_log` VALUES (2459, 1, '编辑车辆: #$##@@$(车牌号：京!@*#($E_)', 'admin/estate.car/edit', '120.244.234.96', 1587387573);
INSERT INTO `vm_user_log` VALUES (2460, 1, '修改企业名称: 湖南祥龙飞机有限公司', 'admin/estate.enterprise/edit', '120.244.234.96', 1587388603);
INSERT INTO `vm_user_log` VALUES (2461, 1, '编辑车辆: TEST(车牌号：京A245N7)', 'admin/estate.car/edit', '120.244.234.96', 1587388624);
INSERT INTO `vm_user_log` VALUES (2462, 1, '编辑车辆: 桂林(车牌号：津AD252C)', 'admin/estate.car/edit', '120.244.234.96', 1587388635);
INSERT INTO `vm_user_log` VALUES (2463, 1, '登陆系统', 'admin/login/login', '124.200.109.50', 1587438024);
INSERT INTO `vm_user_log` VALUES (2464, 1, '添加企业名称: 1', 'admin/estate.enterprise/add', '221.221.145.208', 1587517290);
INSERT INTO `vm_user_log` VALUES (2465, 1, '修改企业名称: 测试企业名称', 'admin/estate.enterprise/edit', '221.221.145.208', 1587517416);
INSERT INTO `vm_user_log` VALUES (2466, 1, '编辑车辆: TEST1(车牌号：京A002311)', 'admin/estate.car/edit', '221.221.145.208', 1587524917);
INSERT INTO `vm_user_log` VALUES (2467, 1, '编辑车辆: #$##@@$(车牌号：京!@*#($E_)', 'admin/estate.car/edit', '221.221.145.208', 1587524932);
INSERT INTO `vm_user_log` VALUES (2468, 1, '编辑车辆: 桂林(车牌号：津AD252C)', 'admin/estate.car/edit', '221.221.145.208', 1587524942);
INSERT INTO `vm_user_log` VALUES (2469, 1, '编辑车辆: TEST(车牌号：京A245N7)', 'admin/estate.car/edit', '221.221.145.208', 1587524957);
INSERT INTO `vm_user_log` VALUES (2470, 1, '编辑车辆: TEST1(车牌号：京A002311)', 'admin/estate.car/edit', '221.221.145.208', 1587524992);
INSERT INTO `vm_user_log` VALUES (2471, 1, '登陆系统', 'admin/login/login', '124.200.109.50', 1587539986);
INSERT INTO `vm_user_log` VALUES (2472, 1, '修改企业名称: 测试企业名称', 'admin/estate.enterprise/edit', '124.200.109.50', 1587540613);
INSERT INTO `vm_user_log` VALUES (2473, 1, '编辑车辆: TEST1(车牌号：京A002311)', 'admin/estate.car/edit', '124.200.109.50', 1587540950);
INSERT INTO `vm_user_log` VALUES (2474, 1, '编辑车辆: TEST1(车牌号：京A002311)', 'admin/estate.car/edit', '124.200.109.50', 1587540960);
INSERT INTO `vm_user_log` VALUES (2475, 1, '登陆系统', 'admin/login/login', '221.221.145.208', 1587541127);
INSERT INTO `vm_user_log` VALUES (2476, 1, '编辑车辆: TEST1(车牌号：京A002311)', 'admin/estate.car/edit', '124.200.109.50', 1587542430);
INSERT INTO `vm_user_log` VALUES (2477, 1, '编辑车辆: TEST1(车牌号：京A002311)', 'admin/estate.car/edit', '124.200.109.50', 1587542473);
INSERT INTO `vm_user_log` VALUES (2478, 1, '登陆系统', 'admin/login/login', '124.200.109.50', 1587542885);
INSERT INTO `vm_user_log` VALUES (2479, 1, '编辑车辆: #$##@@$(车牌号：京!@*#($E_)', 'admin/estate.car/edit', '221.221.145.208', 1587544012);
INSERT INTO `vm_user_log` VALUES (2480, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587544482);
INSERT INTO `vm_user_log` VALUES (2481, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587544488);
INSERT INTO `vm_user_log` VALUES (2482, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587544499);
INSERT INTO `vm_user_log` VALUES (2483, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587544971);
INSERT INTO `vm_user_log` VALUES (2484, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587544977);
INSERT INTO `vm_user_log` VALUES (2485, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587545129);
INSERT INTO `vm_user_log` VALUES (2486, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587545284);
INSERT INTO `vm_user_log` VALUES (2487, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587545312);
INSERT INTO `vm_user_log` VALUES (2488, 1, '采购订单（VM_20200413-7-361）成功保存', 'admin/storage/editStorage', '124.200.109.50', 1587545357);
INSERT INTO `vm_user_log` VALUES (2489, 1, '编辑车辆: TEST1(车牌号：京A002311)', 'admin/estate.car/edit', '221.221.145.208', 1587546724);
INSERT INTO `vm_user_log` VALUES (2490, 1, '编辑车辆: #$##@@$(车牌号：京AD25336)', 'admin/estate.car/edit', '221.221.145.208', 1587546743);
INSERT INTO `vm_user_log` VALUES (2491, 1, '编辑车辆: #$##@@$(车牌号：京AD25336)', 'admin/estate.car/edit', '221.221.145.208', 1587546759);
INSERT INTO `vm_user_log` VALUES (2492, 1, '编辑车辆: 斯奈德(车牌号：京AD25336)', 'admin/estate.car/edit', '221.221.145.208', 1587546778);
INSERT INTO `vm_user_log` VALUES (2493, 1, '登陆系统', 'admin/login/login', '125.34.4.9', 1587561182);
INSERT INTO `vm_user_log` VALUES (2494, 1, '新增访客: 测试', 'admin/estate.caller/add', '125.34.4.9', 1587563319);
INSERT INTO `vm_user_log` VALUES (2495, 1, '编辑访客: 测试', 'admin/estate.caller/edit', '125.34.4.9', 1587564316);
INSERT INTO `vm_user_log` VALUES (2496, 1, '新增访客: 测试1', 'admin/estate.caller/add', '125.34.4.9', 1587564531);
INSERT INTO `vm_user_log` VALUES (2497, 1, '编辑访客: 测试1', 'admin/estate.caller/edit', '125.34.4.9', 1587564693);
INSERT INTO `vm_user_log` VALUES (2498, 1, '编辑访客: 测试', 'admin/estate.caller/edit', '125.34.4.9', 1587564701);
INSERT INTO `vm_user_log` VALUES (2499, 1, '删除访客（ID：2）', 'admin/estate.caller/del', '125.34.4.9', 1587564734);
INSERT INTO `vm_user_log` VALUES (2500, 1, '新增访客: 测试', 'admin/estate.caller/add', '125.34.4.9', 1587565074);
INSERT INTO `vm_user_log` VALUES (2501, 1, '编辑访客: 测试', 'admin/estate.caller/edit', '125.34.4.9', 1587565460);
INSERT INTO `vm_user_log` VALUES (2502, 1, '编辑访客: 测试', 'admin/estate.caller/edit', '125.34.4.9', 1587565990);
INSERT INTO `vm_user_log` VALUES (2503, 1, '编辑车辆: TEST1(车牌号：京A002311)', 'admin/estate.car/edit', '125.34.4.9', 1587566044);
INSERT INTO `vm_user_log` VALUES (2504, 1, '编辑访客: 测试', 'admin/estate.caller/edit', '125.34.4.9', 1587566059);
INSERT INTO `vm_user_log` VALUES (2505, 1, '注销系统', 'admin/login/logout', '125.34.4.9', 1587566258);
INSERT INTO `vm_user_log` VALUES (2506, 12, '登陆系统', 'admin/login/login', '125.34.4.9', 1587566301);
INSERT INTO `vm_user_log` VALUES (2507, 1, '修改企业名称: 1', 'admin/estate.enterprise/edit', '221.221.145.131', 1587627271);
INSERT INTO `vm_user_log` VALUES (2508, 1, '修改企业名称: 测试企业名称', 'admin/estate.enterprise/edit', '221.221.145.131', 1587627284);
INSERT INTO `vm_user_log` VALUES (2509, 1, '修改企业名称: 湖南祥龙飞机有限公司', 'admin/estate.enterprise/edit', '221.221.145.131', 1587627299);
INSERT INTO `vm_user_log` VALUES (2510, 1, '登陆系统', 'admin/login/login', '221.221.145.131', 1587860926);
INSERT INTO `vm_user_log` VALUES (2511, 1, '登陆系统', 'admin/login/login', '221.221.145.131', 1587970580);
INSERT INTO `vm_user_log` VALUES (2512, 1, '登陆系统', 'admin/login/login', '124.200.109.50', 1587989950);
INSERT INTO `vm_user_log` VALUES (2513, 1, '添加二维码: 一层-南侧-大堂(标识：AGZ-1-A)', 'admin/estate.code/add', '221.221.145.131', 1588043061);
INSERT INTO `vm_user_log` VALUES (2514, 1, '添加二维码: 测试(标识：test)', 'admin/estate.code/add', '124.200.109.50', 1588063347);
INSERT INTO `vm_user_log` VALUES (2515, 1, '编辑二维码: 测试(标识：test)', 'admin/estate.code/edit', '124.200.109.50', 1588065631);
INSERT INTO `vm_user_log` VALUES (2516, 1, '编辑二维码: 测试(标识：test1)', 'admin/estate.code/edit', '124.200.109.50', 1588065635);
INSERT INTO `vm_user_log` VALUES (2517, 1, '删除二维码（ID：1）', 'admin/estate.code/del', '124.200.109.50', 1588065893);
INSERT INTO `vm_user_log` VALUES (2518, 1, '添加二维码: test12(标识：test2)', 'admin/estate.code/add', '221.221.145.131', 1588068790);
INSERT INTO `vm_user_log` VALUES (2519, 1, '添加二维码: 一层-大堂-多点门(标识：AGZ-1-A)', 'admin/estate.code/add', '221.221.145.131', 1588069004);
INSERT INTO `vm_user_log` VALUES (2520, 1, '编辑二维码: 一层-东侧-南1门(标识：AGZ-1-B)', 'admin/estate.code/edit', '221.221.145.131', 1588069054);
INSERT INTO `vm_user_log` VALUES (2521, 1, '编辑二维码: 一层-大堂-正门(标识：AGZ-1-C)', 'admin/estate.code/edit', '221.221.145.131', 1588069105);
INSERT INTO `vm_user_log` VALUES (2522, 1, '编辑二维码: 一层-大堂-多点门(标识：AGZ-1-D)', 'admin/estate.code/edit', '221.221.145.131', 1588069123);
INSERT INTO `vm_user_log` VALUES (2523, 1, '编辑二维码: 一层-大堂-正门(标识：AGZ-1-A)', 'admin/estate.code/edit', '221.221.145.131', 1588069134);
INSERT INTO `vm_user_log` VALUES (2524, 1, '编辑二维码: 一层-大堂-多点门(标识：AGZ-1-C)', 'admin/estate.code/edit', '221.221.145.131', 1588069149);
INSERT INTO `vm_user_log` VALUES (2525, 1, '添加二维码: 一层-东侧-北1(标识：AGZ-1-D)', 'admin/estate.code/add', '221.221.145.131', 1588069201);
INSERT INTO `vm_user_log` VALUES (2526, 1, '编辑二维码: 一层-大堂-多点门(标识：AGZ-1-B)', 'admin/estate.code/edit', '221.221.145.131', 1588069215);
INSERT INTO `vm_user_log` VALUES (2527, 1, '编辑二维码: 一层-东侧-南1门(标识：AGZ-1-C)', 'admin/estate.code/edit', '221.221.145.131', 1588069223);
INSERT INTO `vm_user_log` VALUES (2528, 1, '编辑二维码: 一层-东侧-北1门(标识：AGZ-1-D)', 'admin/estate.code/edit', '221.221.145.131', 1588069236);
INSERT INTO `vm_user_log` VALUES (2529, 1, '添加二维码: 一层-东侧-北2门(标识：AGZ-1-E)', 'admin/estate.code/add', '221.221.145.131', 1588069257);
INSERT INTO `vm_user_log` VALUES (2530, 1, '添加二维码: 一层-东侧-北3门(标识：AGZ-1-F)', 'admin/estate.code/add', '221.221.145.131', 1588069283);
INSERT INTO `vm_user_log` VALUES (2531, 1, '添加二维码: 一层-北侧-东1门(标识：AGZ-1-J)', 'admin/estate.code/add', '221.221.145.131', 1588121873);
INSERT INTO `vm_user_log` VALUES (2532, 1, '编辑二维码: 一层-东侧-南1门（上地晏消防步梯）(标识：AGZ-1-C)', 'admin/estate.code/edit', '221.221.145.131', 1588121946);
INSERT INTO `vm_user_log` VALUES (2533, 1, '编辑二维码: 一层-东侧-中门（（上地晏正门步梯））(标识：AGZ-1-D)', 'admin/estate.code/edit', '221.221.145.131', 1588121992);
INSERT INTO `vm_user_log` VALUES (2534, 1, '编辑二维码: 一层-东侧-中门（上地晏正门步梯）(标识：AGZ-1-D)', 'admin/estate.code/edit', '221.221.145.131', 1588122004);
INSERT INTO `vm_user_log` VALUES (2535, 1, '编辑二维码: 一层-东侧-北1门（东货梯）(标识：AGZ-1-E)', 'admin/estate.code/edit', '221.221.145.131', 1588122037);
INSERT INTO `vm_user_log` VALUES (2536, 1, '编辑二维码: 一层-东侧-北2门（东货梯步梯）(标识：AGZ-1-F)', 'admin/estate.code/edit', '221.221.145.131', 1588122128);
INSERT INTO `vm_user_log` VALUES (2537, 1, '编辑二维码: 一层-东侧-北2门（东货旁梯步梯）(标识：AGZ-1-F)', 'admin/estate.code/edit', '221.221.145.131', 1588122143);
INSERT INTO `vm_user_log` VALUES (2538, 1, '编辑二维码: 一层-北侧-东1门（东北部消防步梯）(标识：AGZ-1-J)', 'admin/estate.code/edit', '221.221.145.131', 1588122249);
INSERT INTO `vm_user_log` VALUES (2539, 1, '登陆系统', 'admin/login/login', '111.193.234.32', 1588165174);
INSERT INTO `vm_user_log` VALUES (2540, 1, '编辑计划: 测试稿(标识：8)', 'admin/estate.patrol/edit', '111.193.234.32', 1588168703);
INSERT INTO `vm_user_log` VALUES (2541, 1, '编辑计划: 测试稿(标识：8)', 'admin/estate.patrol/edit', '111.193.234.32', 1588168711);
INSERT INTO `vm_user_log` VALUES (2542, 1, '添加计划: 测试稿1(标识：8)', 'admin/estate.patrol/add', '111.193.234.32', 1588168764);
INSERT INTO `vm_user_log` VALUES (2543, 1, '编辑计划: 测试稿1(标识：2)', 'admin/estate.patrol/edit', '111.193.234.32', 1588168817);
INSERT INTO `vm_user_log` VALUES (2544, 1, '删除计划（ID：1）', 'admin/estate.patrol/del', '111.193.234.32', 1588168834);
INSERT INTO `vm_user_log` VALUES (2545, 1, '删除计划（ID：1）', 'admin/estate.patrol/del', '111.193.234.32', 1588168880);
INSERT INTO `vm_user_log` VALUES (2546, 1, '登陆系统', 'admin/login/login', '222.128.183.95', 1588209064);
INSERT INTO `vm_user_log` VALUES (2547, 1, '编辑计划: 节假日-巡逻线路(标识：8)', 'admin/estate.patrol/edit', '222.128.183.95', 1588209157);
INSERT INTO `vm_user_log` VALUES (2548, 1, '编辑计划: 节假日-巡逻线路(标识：8,7)', 'admin/estate.patrol/edit', '111.193.234.32', 1588322990);
INSERT INTO `vm_user_log` VALUES (2549, 1, '编辑计划: 节假日-巡逻线路(标识：8,7,6,5)', 'admin/estate.patrol/edit', '111.193.234.32', 1588327150);
INSERT INTO `vm_user_log` VALUES (2550, 1, '登陆系统', 'admin/login/login', '111.193.234.32', 1588336356);
INSERT INTO `vm_user_log` VALUES (2551, 1, '添加报修单: BX202005015868', 'admin/estate.repair/add', '111.193.234.32', 1588338607);
INSERT INTO `vm_user_log` VALUES (2552, 1, '编辑报修单: BX202005015868', 'admin/estate.repair/edit', '111.193.234.32', 1588339332);
INSERT INTO `vm_user_log` VALUES (2553, 1, '编辑报修单: BX202005015868', 'admin/estate.repair/edit', '111.193.234.32', 1588339960);
INSERT INTO `vm_user_log` VALUES (2554, 1, '审批报修单: BX202005015868', 'admin/estate.repair/audit', '111.193.234.32', 1588340024);
INSERT INTO `vm_user_log` VALUES (2555, 1, '审批报修单: BX202005015868', 'admin/estate.repair/audit', '111.193.234.32', 1588340045);
INSERT INTO `vm_user_log` VALUES (2556, 1, '添加报修单: BX202005016591', 'admin/estate.repair/add', '111.193.234.32', 1588340311);
INSERT INTO `vm_user_log` VALUES (2557, 1, '审批报修单: BX202005016591', 'admin/estate.repair/audit', '111.193.234.32', 1588340332);
INSERT INTO `vm_user_log` VALUES (2558, 1, '登陆系统', 'admin/login/login', '111.193.234.32', 1588483452);
INSERT INTO `vm_user_log` VALUES (2559, 1, '添加工具基础数据', 'admin/goods/addTools', '111.193.234.229', 1588513975);
INSERT INTO `vm_user_log` VALUES (2560, 1, '编辑工具基础数据', 'admin/goods/editTools', '111.193.234.229', 1588514257);
INSERT INTO `vm_user_log` VALUES (2561, 1, '登陆系统', 'admin/login/login', '120.244.234.113', 1588556221);
INSERT INTO `vm_user_log` VALUES (2562, 1, '审批报修单: BX202005016591', 'admin/estate.repair/audit', '120.244.234.113', 1588556464);
INSERT INTO `vm_user_log` VALUES (2563, 1, '添加计划: sfw(标识：8,5)', 'admin/estate.patrol/add', '120.244.234.113', 1588556529);
INSERT INTO `vm_user_log` VALUES (2564, 1, '添加工具基础数据', 'admin/goods/addTools', '120.244.234.113', 1588556677);
INSERT INTO `vm_user_log` VALUES (2565, 1, '编辑工具基础数据', 'admin/goods/editTools', '120.244.234.113', 1588556703);
INSERT INTO `vm_user_log` VALUES (2566, 1, '登陆系统', 'admin/login/login', '111.193.234.229', 1588597218);
INSERT INTO `vm_user_log` VALUES (2567, 1, '编辑工具基础数据', 'admin/goods/editTools', '111.193.234.229', 1588597463);
INSERT INTO `vm_user_log` VALUES (2568, 1, '登陆系统', 'admin/login/login', '111.193.234.229', 1588664109);
INSERT INTO `vm_user_log` VALUES (2569, 1, '编辑工具基础数据', 'admin/goods/editTools', '125.33.197.100', 1588726459);
INSERT INTO `vm_user_log` VALUES (2570, 1, '登陆系统', 'admin/login/login', '124.200.109.50', 1588728406);
INSERT INTO `vm_user_log` VALUES (2571, 1, '编辑计划: 早班（白天）(标识：8,5)', 'admin/estate.patrol/edit', '125.33.197.100', 1588729219);
INSERT INTO `vm_user_log` VALUES (2572, 1, '添加计划: 测试(标识：8,4,2)', 'admin/estate.patrol/add', '125.33.197.100', 1588730844);
INSERT INTO `vm_user_log` VALUES (2573, 1, '编辑计划: 测试(标识：8,4,2)', 'admin/estate.patrol/edit', '125.33.197.100', 1588730869);
INSERT INTO `vm_user_log` VALUES (2574, 1, '添加工具: aa(标识：USYPORH2UO)', 'admin/estate.tools/add', '124.200.109.50', 1588734433);
INSERT INTO `vm_user_log` VALUES (2575, 1, '添加工具: 1422(标识：DK9PSX1SBK)', 'admin/estate.tools/add', '125.33.197.100', 1588735188);
INSERT INTO `vm_user_log` VALUES (2576, 1, '添加工具: 25(标识：T1ZCOOKWUO)', 'admin/estate.tools/add', '125.33.197.100', 1588735351);
INSERT INTO `vm_user_log` VALUES (2577, 1, '添加工具: 五月综合费用电费(标识：HGNZCFUNRU)', 'admin/estate.tools/add', '125.33.197.100', 1588735624);
INSERT INTO `vm_user_log` VALUES (2578, 1, '添加工具: aa(标识：SOIL2WPCJE)', 'admin/estate.tools/add', '124.200.109.50', 1588736065);
INSERT INTO `vm_user_log` VALUES (2579, 1, '添加工具: 3月综合费用(标识：V9UBTTZ5PF)', 'admin/estate.tools/add', '125.33.197.100', 1588736426);
INSERT INTO `vm_user_log` VALUES (2580, 1, '添加工具: 4月综合费用(标识：QDRABWPZNC)', 'admin/estate.tools/add', '125.33.197.100', 1588736509);
INSERT INTO `vm_user_log` VALUES (2581, 1, '编辑工具基础数据', 'admin/goods/editTools', '125.33.197.100', 1588737239);
INSERT INTO `vm_user_log` VALUES (2582, 1, '添加工具基础数据', 'admin/goods/addTools', '125.33.197.100', 1588737300);
INSERT INTO `vm_user_log` VALUES (2583, 1, '编辑工具基础数据', 'admin/goods/editTools', '125.33.197.100', 1588737368);
INSERT INTO `vm_user_log` VALUES (2584, 1, '编辑工具: 3月综合费用(标识：YVSEBTJEIO)', 'admin/estate.tools/edit', '124.200.109.50', 1588748117);
INSERT INTO `vm_user_log` VALUES (2585, 1, '编辑工具: aa(标识：JTLJKN49WG)', 'admin/estate.tools/edit', '124.200.109.50', 1588748134);
INSERT INTO `vm_user_log` VALUES (2586, 1, '编辑工具: aa(标识：4UFDRQ9ZQX)', 'admin/estate.tools/edit', '124.200.109.50', 1588748320);
INSERT INTO `vm_user_log` VALUES (2587, 1, '编辑工具基础数据', 'admin/goods/editTools', '221.221.150.196', 1588748743);
INSERT INTO `vm_user_log` VALUES (2588, 1, '编辑工具基础数据', 'admin/goods/editTools', '221.221.150.196', 1588748754);
INSERT INTO `vm_user_log` VALUES (2589, 1, '编辑工具: 测试(标识：ENDHZPO6HX)', 'admin/estate.tools/edit', '221.221.150.196', 1588748801);
INSERT INTO `vm_user_log` VALUES (2590, 1, '编辑工具: 测试(标识：EU6JPFNHLJ)', 'admin/estate.tools/edit', '221.221.150.196', 1588748815);
INSERT INTO `vm_user_log` VALUES (2591, 1, '编辑工具: 3月综合费用(标识：6ZIAMJ8I89)', 'admin/estate.tools/edit', '221.221.150.196', 1588749042);
INSERT INTO `vm_user_log` VALUES (2592, 1, '修改企业名称: 测试企业名称A', 'admin/estate.enterprise/edit', '221.221.150.196', 1588749063);
INSERT INTO `vm_user_log` VALUES (2593, 1, '编辑工具: 测试(标识：Z8Z17NCBPR)', 'admin/estate.tools/edit', '221.221.150.196', 1588749095);
INSERT INTO `vm_user_log` VALUES (2594, 1, '编辑工具: 3月综合费用(标识：CJRD6U2JAZ)', 'admin/estate.tools/edit', '221.221.150.196', 1588749360);
INSERT INTO `vm_user_log` VALUES (2595, 1, '编辑工具: 4月综合费用(标识：Z9Z2H6XAOB)', 'admin/estate.tools/edit', '124.200.109.50', 1588749379);
INSERT INTO `vm_user_log` VALUES (2596, 1, '编辑工具: 3月综合费用(标识：5T3LP0W3TW)', 'admin/estate.tools/edit', '221.221.150.196', 1588749390);
INSERT INTO `vm_user_log` VALUES (2597, 1, '删除保修单（ID：7）', 'admin/estate.repair/del', '221.221.150.196', 1588749416);
INSERT INTO `vm_user_log` VALUES (2598, 1, '添加工具: 3月综合费用(标识：NCD26PCMYW)', 'admin/estate.tools/add', '221.221.150.196', 1588749507);
INSERT INTO `vm_user_log` VALUES (2599, 1, '编辑工具: 4月综合费用(标识：2HCYIJ1ZQP)', 'admin/estate.tools/edit', '124.200.109.50', 1588749897);
INSERT INTO `vm_user_log` VALUES (2600, 1, '编辑工具: 测试(标识：CR7WDUBDHR)', 'admin/estate.tools/edit', '124.200.109.50', 1588749904);
INSERT INTO `vm_user_log` VALUES (2601, 1, '添加工具: 3月综合费用(标识：XZYP8IC2E1)', 'admin/estate.tools/add', '221.221.150.196', 1588751697);
INSERT INTO `vm_user_log` VALUES (2602, 1, '编辑工具: 3月综合费用(标识：HBNN2GHNGW)', 'admin/estate.tools/edit', '221.221.150.196', 1588751729);
INSERT INTO `vm_user_log` VALUES (2603, 1, '编辑工具: 3月综合费用(标识：ACUQZROPVC)', 'admin/estate.tools/edit', '221.221.150.196', 1588751753);
INSERT INTO `vm_user_log` VALUES (2604, 1, '编辑工具: 3月综合费用(标识：S8XKPOILSI)', 'admin/estate.tools/edit', '221.221.150.196', 1588751839);
INSERT INTO `vm_user_log` VALUES (2605, 1, '编辑工具: 4月综合费用(标识：J8RBSBFPWB)', 'admin/estate.tools/edit', '221.221.150.196', 1588751859);
INSERT INTO `vm_user_log` VALUES (2606, 1, '编辑工具: 测试(标识：EPSN0WJBN2)', 'admin/estate.tools/edit', '221.221.150.196', 1588751909);
INSERT INTO `vm_user_log` VALUES (2607, 1, '删除保修单（ID：6）', 'admin/estate.repair/del', '221.221.150.196', 1588751926);
INSERT INTO `vm_user_log` VALUES (2608, 1, '添加工具: 4月综合费用(标识：NH8V9WCCQ0)', 'admin/estate.tools/add', '221.221.150.196', 1588751998);
INSERT INTO `vm_user_log` VALUES (2609, 1, '编辑工具基础数据', 'admin/goods/editTools', '221.221.150.196', 1588752062);
INSERT INTO `vm_user_log` VALUES (2610, 1, '编辑工具: 4月综合费用(标识：4DPAXQTZF7)', 'admin/estate.tools/edit', '221.221.150.196', 1588755067);
INSERT INTO `vm_user_log` VALUES (2611, 1, '添加工具: aa(标识：570K9GF5FX)', 'admin/estate.tools/add', '124.200.109.50', 1588757222);
INSERT INTO `vm_user_log` VALUES (2612, 1, '编辑工具基础数据', 'admin/goods/editTools', '124.200.109.50', 1588757267);
INSERT INTO `vm_user_log` VALUES (2613, 1, '删除保修单（ID：12）', 'admin/estate.repair/del', '124.200.109.50', 1588757328);
INSERT INTO `vm_user_log` VALUES (2614, 1, '删除保修单（ID：12）', 'admin/estate.repair/del', '124.200.109.50', 1588757332);
INSERT INTO `vm_user_log` VALUES (2615, 1, '删除物业工具（ID：12）', 'admin/estate.tools/del', '124.200.109.50', 1588757369);
INSERT INTO `vm_user_log` VALUES (2616, 1, '添加工具: aa(标识：GJN3NWIAMJ)', 'admin/estate.tools/add', '124.200.109.50', 1588757418);
INSERT INTO `vm_user_log` VALUES (2617, 1, '删除物业工具（ID：13）', 'admin/estate.tools/del', '124.200.109.50', 1588757899);
INSERT INTO `vm_user_log` VALUES (2618, 1, '添加工具: aa(标识：UBU0WL5KLY)', 'admin/estate.tools/add', '124.200.109.50', 1588757946);
INSERT INTO `vm_user_log` VALUES (2619, 1, '添加工具: aa(标识：PLCP0KRY2R)', 'admin/estate.tools/add', '124.200.109.50', 1588757978);
INSERT INTO `vm_user_log` VALUES (2620, 1, '删除物业工具（ID：15）', 'admin/estate.tools/del', '124.200.109.50', 1588758004);
INSERT INTO `vm_user_log` VALUES (2621, 1, '删除物业工具（ID：14）', 'admin/estate.tools/del', '124.200.109.50', 1588758006);
INSERT INTO `vm_user_log` VALUES (2622, 1, '添加工具: aa(标识：S9MYWECARB)', 'admin/estate.tools/add', '124.200.109.50', 1588758023);
INSERT INTO `vm_user_log` VALUES (2623, 1, '删除物业工具（ID：16）', 'admin/estate.tools/del', '124.200.109.50', 1588758054);
INSERT INTO `vm_user_log` VALUES (2624, 1, '编辑工具基础数据', 'admin/goods/editTools', '221.221.150.196', 1588758223);
INSERT INTO `vm_user_log` VALUES (2625, 1, '添加工具: aa(标识：MX4GG8S4MM)', 'admin/estate.tools/add', '124.200.109.50', 1588758229);
INSERT INTO `vm_user_log` VALUES (2626, 1, '编辑工具: 4月综合费用(标识：TM7KOZZ0YD)', 'admin/estate.tools/edit', '221.221.150.196', 1588758246);
INSERT INTO `vm_user_log` VALUES (2627, 1, '删除物业工具（ID：17）', 'admin/estate.tools/del', '124.200.109.50', 1588758265);
INSERT INTO `vm_user_log` VALUES (2628, 1, '添加工具: aa(标识：QDVNJMGSP5)', 'admin/estate.tools/add', '124.200.109.50', 1588758278);
INSERT INTO `vm_user_log` VALUES (2629, 1, '添加工具: 300平米(标识：EMJAXRRE3O)', 'admin/estate.tools/add', '221.221.150.196', 1588758421);
INSERT INTO `vm_user_log` VALUES (2630, 1, '添加工具: aa(标识：HGYJSL8TZY)', 'admin/estate.tools/add', '124.200.109.50', 1588758542);
INSERT INTO `vm_user_log` VALUES (2631, 1, '删除物业工具（ID：20）', 'admin/estate.tools/del', '124.200.109.50', 1588758578);
INSERT INTO `vm_user_log` VALUES (2632, 1, '删除物业工具（ID：18）', 'admin/estate.tools/del', '124.200.109.50', 1588758581);
INSERT INTO `vm_user_log` VALUES (2633, 1, '添加工具: aa(标识：2JEOYMG9JC)', 'admin/estate.tools/add', '124.200.109.50', 1588758865);
INSERT INTO `vm_user_log` VALUES (2634, 1, '编辑工具: aa(标识：2JEOYMG9JC)', 'admin/estate.tools/edit', '124.200.109.50', 1588759243);
INSERT INTO `vm_user_log` VALUES (2635, 1, '添加工具: 3月份综合费用(标识：VMDBGCUEJY)', 'admin/estate.tools/add', '221.221.150.196', 1588814368);
INSERT INTO `vm_user_log` VALUES (2636, 1, '编辑工具: 3月份综合费用(标识：VMDBGCUEJY)', 'admin/estate.tools/edit', '221.221.150.196', 1588814436);
INSERT INTO `vm_user_log` VALUES (2637, 1, '编辑工具: 3月份综合费用(标识：VMDBGCUEJY)', 'admin/estate.tools/edit', '221.221.150.196', 1588814454);
INSERT INTO `vm_user_log` VALUES (2638, 1, '编辑工具: 3月份综合费用(标识：VMDBGCUEJY)', 'admin/estate.tools/edit', '221.221.150.196', 1588814469);
INSERT INTO `vm_user_log` VALUES (2639, 1, '编辑工具: 5月份综合费用(标识：VMDBGCUEJY)', 'admin/estate.tools/edit', '221.221.150.196', 1588814483);
INSERT INTO `vm_user_log` VALUES (2640, 1, '添加工具: 300平米(标识：HABHQGCGLK)', 'admin/estate.tools/add', '221.221.150.196', 1588814846);
INSERT INTO `vm_user_log` VALUES (2641, 1, '修改企业名称: 测试企业166.25平米', 'admin/estate.enterprise/edit', '221.221.150.196', 1588815200);
INSERT INTO `vm_user_log` VALUES (2642, 1, '修改企业名称: 测试企业300平米', 'admin/estate.enterprise/edit', '221.221.150.196', 1588815212);
INSERT INTO `vm_user_log` VALUES (2643, 1, '编辑工具: 300平米(标识：HABHQGCGLK)', 'admin/estate.tools/edit', '221.221.150.196', 1588815225);
INSERT INTO `vm_user_log` VALUES (2644, 1, '编辑工具: 测试企业166.25平米(标识：HABHQGCGLK)', 'admin/estate.tools/edit', '221.221.150.196', 1588815236);
INSERT INTO `vm_user_log` VALUES (2645, 1, '添加工具: 测试企业300平米(标识：NRIPA270PR)', 'admin/estate.tools/add', '221.221.150.196', 1588815259);
INSERT INTO `vm_user_log` VALUES (2646, 1, '编辑工具: 测试企业300平米(标识：NRIPA270PR)', 'admin/estate.tools/edit', '221.221.150.196', 1588815278);
INSERT INTO `vm_user_log` VALUES (2647, 1, '添加工具: 免费测试(标识：9IRIYCUBOG)', 'admin/estate.tools/add', '221.221.150.196', 1588821674);
INSERT INTO `vm_user_log` VALUES (2648, 1, '添加报修单: BX202005074406', 'admin/estate.repair/add', '221.221.150.196', 1588821959);
INSERT INTO `vm_user_log` VALUES (2649, 1, '审批报修单: BX202005074406', 'admin/estate.repair/audit', '221.221.150.196', 1588822080);
INSERT INTO `vm_user_log` VALUES (2650, 1, '审批报修单: BX202005074406', 'admin/estate.repair/audit', '221.221.150.196', 1588822092);
INSERT INTO `vm_user_log` VALUES (2651, 1, '审批报修单: BX202005074406', 'admin/estate.repair/audit', '221.221.150.196', 1588822099);
INSERT INTO `vm_user_log` VALUES (2652, 1, '添加报修单: BX202005074810', 'admin/estate.repair/add', '221.221.150.196', 1588822125);
INSERT INTO `vm_user_log` VALUES (2653, 1, '新增访客: 张静', 'admin/estate.caller/add', '221.221.150.196', 1588822310);
INSERT INTO `vm_user_log` VALUES (2654, 1, '编辑访客: 张静', 'admin/estate.caller/edit', '221.221.150.196', 1588822330);
INSERT INTO `vm_user_log` VALUES (2655, 1, '登陆系统', 'admin/login/login', '124.193.148.26', 1588907285);
INSERT INTO `vm_user_log` VALUES (2656, 1, '修改企业状态:（ID： 3）', 'admin/estate.enterprise/editStatus', '124.193.148.26', 1588908002);
INSERT INTO `vm_user_log` VALUES (2657, 1, '审批报修单: BX202005074810', 'admin/estate.repair/audit', '124.193.148.26', 1588908516);
INSERT INTO `vm_user_log` VALUES (2658, 1, '编辑报修单: BX202005074810', 'admin/estate.repair/edit', '124.193.148.26', 1588908613);
INSERT INTO `vm_user_log` VALUES (2659, 1, '登陆系统', 'admin/login/login', '124.193.148.26', 1588908650);
INSERT INTO `vm_user_log` VALUES (2660, 1, '添加工具: aa(标识：9LUVIZXDTE)', 'admin/estate.tools/add', '124.193.148.26', 1588909855);
INSERT INTO `vm_user_log` VALUES (2661, 1, '编辑工具: 免费测试(标识：9IRIYCUBOG)', 'admin/estate.tools/edit', '124.193.148.26', 1588909901);
INSERT INTO `vm_user_log` VALUES (2662, 1, '添加报修单: BX202005084715', 'admin/estate.repair/add', '221.221.150.196', 1588926361);
INSERT INTO `vm_user_log` VALUES (2663, 1, '审批报修单: BX202005084715', 'admin/estate.repair/audit', '221.221.150.196', 1588926371);
INSERT INTO `vm_user_log` VALUES (2664, 1, '审批报修单: BX202005084715', 'admin/estate.repair/audit', '221.221.150.196', 1588926398);
INSERT INTO `vm_user_log` VALUES (2665, 1, '编辑报修单: BX202005084715', 'admin/estate.repair/edit', '221.221.150.196', 1588926412);
INSERT INTO `vm_user_log` VALUES (2666, 1, '审批报修单: BX202005084715', 'admin/estate.repair/audit', '221.221.150.196', 1588926420);
INSERT INTO `vm_user_log` VALUES (2667, 1, '添加报修单: BX202005086514', 'admin/estate.repair/add', '221.221.150.196', 1588926440);
INSERT INTO `vm_user_log` VALUES (2668, 1, '审批报修单: BX202005086514', 'admin/estate.repair/audit', '221.221.150.196', 1588926450);
INSERT INTO `vm_user_log` VALUES (2669, 1, '添加报修单: BX202005086001', 'admin/estate.repair/add', '221.221.150.196', 1588926714);
INSERT INTO `vm_user_log` VALUES (2670, 1, '审批报修单: BX202005086001', 'admin/estate.repair/audit', '221.221.150.196', 1588926831);
INSERT INTO `vm_user_log` VALUES (2671, 1, '添加报修单: BX202005087190', 'admin/estate.repair/add', '221.221.150.196', 1588927620);
INSERT INTO `vm_user_log` VALUES (2672, 1, '审批报修单: BX202005087190', 'admin/estate.repair/audit', '221.221.150.196', 1588927630);
INSERT INTO `vm_user_log` VALUES (2673, 1, '编辑报修单: BX202005087190', 'admin/estate.repair/edit', '221.221.150.196', 1588927638);
INSERT INTO `vm_user_log` VALUES (2674, 1, '编辑报修单: BX202005087190', 'admin/estate.repair/edit', '221.221.150.196', 1588927646);
INSERT INTO `vm_user_log` VALUES (2675, 1, '添加企业名称: 测试2', 'admin/estate.enterprise/add', '221.221.150.196', 1588928429);
INSERT INTO `vm_user_log` VALUES (2676, 1, '添加报修单: BX202005089576', 'admin/estate.repair/add', '221.221.150.196', 1588928489);
INSERT INTO `vm_user_log` VALUES (2677, 1, '登陆系统', 'admin/login/login', '124.193.148.26', 1588936325);
INSERT INTO `vm_user_log` VALUES (2678, 1, '修改企业状态:（ID： 3）', 'admin/estate.enterprise/editStatus', '124.193.148.26', 1588942326);
INSERT INTO `vm_user_log` VALUES (2679, 1, '审批报修单: BX202005086514', 'admin/estate.repair/audit', '124.193.148.26', 1588942347);
INSERT INTO `vm_user_log` VALUES (2680, 1, '审批报修单: BX202005016591', 'admin/estate.repair/audit', '124.193.148.26', 1588942547);
INSERT INTO `vm_user_log` VALUES (2681, 1, '登陆系统', 'admin/login/login', '221.221.150.196', 1588984768);
INSERT INTO `vm_user_log` VALUES (2682, 1, '编辑报修单: BX202005089576', 'admin/estate.repair/edit', '221.221.150.196', 1588985060);
INSERT INTO `vm_user_log` VALUES (2683, 1, '编辑报修单: BX202005086001', 'admin/estate.repair/edit', '221.221.150.196', 1588985074);
INSERT INTO `vm_user_log` VALUES (2684, 1, '编辑报修单: BX202005089576', 'admin/estate.repair/edit', '221.221.150.196', 1588985091);
INSERT INTO `vm_user_log` VALUES (2685, 1, '审批报修单: BX202005089576', 'admin/estate.repair/audit', '221.221.150.196', 1588985099);
INSERT INTO `vm_user_log` VALUES (2686, 1, '编辑报修单: BX202005089576', 'admin/estate.repair/edit', '221.221.150.196', 1588985113);
INSERT INTO `vm_user_log` VALUES (2687, 1, '审批报修单: BX202005089576', 'admin/estate.repair/audit', '221.221.150.196', 1588985122);
INSERT INTO `vm_user_log` VALUES (2688, 1, '审批报修单: BX202005089576', 'admin/estate.repair/audit', '221.221.150.196', 1588985130);
INSERT INTO `vm_user_log` VALUES (2689, 1, '编辑报修单: BX202005089576', 'admin/estate.repair/edit', '221.221.150.196', 1588985147);
INSERT INTO `vm_user_log` VALUES (2690, 1, '编辑报修单: BX202005089576', 'admin/estate.repair/edit', '221.221.150.196', 1588985155);
INSERT INTO `vm_user_log` VALUES (2691, 1, '审批报修单: BX202005089576', 'admin/estate.repair/audit', '221.221.150.196', 1588985164);
INSERT INTO `vm_user_log` VALUES (2692, 1, '审批报修单: BX202005089576', 'admin/estate.repair/audit', '221.221.150.196', 1588987075);
INSERT INTO `vm_user_log` VALUES (2693, 1, '编辑报修单: BX202005089576', 'admin/estate.repair/edit', '221.221.150.196', 1588987083);
INSERT INTO `vm_user_log` VALUES (2694, 1, '审批报修单: BX202005089576', 'admin/estate.repair/audit', '221.221.150.196', 1588987095);
INSERT INTO `vm_user_log` VALUES (2695, 1, '登陆系统', 'admin/login/login', '124.193.148.26', 1588989140);

SET FOREIGN_KEY_CHECKS = 1;
