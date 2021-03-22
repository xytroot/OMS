/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : ordering_sys

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 22/03/2021 15:00:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `totalPrice` float NOT NULL,
  `billTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`billId`) USING BTREE,
  INDEX `bill_fk_userId`(`userId`) USING BTREE,
  CONSTRAINT `bill_fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (1, 8, 167, '2020-11-23 19:13:23.000000');
INSERT INTO `bill` VALUES (3, 20, 54, '2020-11-23 20:46:02.000000');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `dishesId` int(11) NOT NULL AUTO_INCREMENT,
  `dishesName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unitPrice` float NOT NULL,
  `category` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dishesId`) USING BTREE,
  UNIQUE INDEX `DISHESNAME_IDX`(`dishesName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '黄焖鸡', 20, '荤菜');
INSERT INTO `menu` VALUES (2, '可乐鸡翅', 30, '荤菜');
INSERT INTO `menu` VALUES (3, '手撕包菜', 15, '素菜');
INSERT INTO `menu` VALUES (4, '米饭', 2, '主食');
INSERT INTO `menu` VALUES (5, '重庆小面', 20, '主食');
INSERT INTO `menu` VALUES (6, '椒麻鸡', 128, '荤菜');
INSERT INTO `menu` VALUES (7, '油焖鸡', 97, '荤菜');
INSERT INTO `menu` VALUES (8, '口味虾', 168, '荤菜');
INSERT INTO `menu` VALUES (9, '夫妻肺片', 99, '荤菜');
INSERT INTO `menu` VALUES (10, '烤鸭', 198, '荤菜');
INSERT INTO `menu` VALUES (11, '烤鱼', 128, '荤菜');
INSERT INTO `menu` VALUES (12, '烧鹅', 168, '荤菜');
INSERT INTO `menu` VALUES (13, '清炒菜心', 20, '素菜');
INSERT INTO `menu` VALUES (14, '长豆角炒茄子', 35, '素菜');

-- ----------------------------
-- Table structure for ordering
-- ----------------------------
DROP TABLE IF EXISTS `ordering`;
CREATE TABLE `ordering`  (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `tableId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dishesId` int(11) NOT NULL,
  `dishesNum` int(11) NOT NULL,
  `orderTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `ordering_fk_userId`(`userId`) USING BTREE,
  INDEX `ordering_fk_dishesId`(`dishesId`) USING BTREE,
  CONSTRAINT `ordering_fk_dishesId` FOREIGN KEY (`dishesId`) REFERENCES `menu` (`dishesId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ordering_fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordering
-- ----------------------------
INSERT INTO `ordering` VALUES (1, 1, 8, 4, 2, '2020-11-23 19:13:23.000000');
INSERT INTO `ordering` VALUES (2, 1, 8, 11, 1, '2020-11-23 19:13:23.000000');
INSERT INTO `ordering` VALUES (3, 1, 8, 14, 1, '2020-11-23 19:13:23.000000');
INSERT INTO `ordering` VALUES (4, 2, 10, 4, 4, '2020-11-23 20:18:21.000000');
INSERT INTO `ordering` VALUES (5, 2, 10, 8, 1, '2020-11-23 20:18:21.000000');
INSERT INTO `ordering` VALUES (6, 2, 10, 11, 1, '2020-11-23 20:18:21.000000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `authorization` tinyint(4) NOT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `USERNAME_IDX`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', 'admin', 0, 1);
INSERT INTO `user` VALUES (2, '123@qq.com', '666', 233, 0);
INSERT INTO `user` VALUES (7, '3321@qq.com', '3321', 63, 0);
INSERT INTO `user` VALUES (8, 'x', 'x', 262, 0);
INSERT INTO `user` VALUES (9, 'chatbot', '2333', 15, 0);
INSERT INTO `user` VALUES (10, 'dl', 'dsb', 135, 0);
INSERT INTO `user` VALUES (14, 'xdf', 'hhh', 0, 0);
INSERT INTO `user` VALUES (15, 'test', 'dd', 0, 0);
INSERT INTO `user` VALUES (20, 'test02', '123', 46, 0);
INSERT INTO `user` VALUES (21, 'test03', '123', 0, 0);
INSERT INTO `user` VALUES (22, 'test04', '123', -30, 0);
INSERT INTO `user` VALUES (23, 'test05', '123', 100, 0);

-- ----------------------------
-- View structure for billtoshow
-- ----------------------------
DROP VIEW IF EXISTS `billtoshow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `billtoshow` AS select `b`.`billId` AS `bId`,`b`.`totalPrice` AS `bPrice`,`b`.`billTime` AS `bTime`,`u`.`userName` AS `uName` from (`bill` `b` join `user` `u`) where (`b`.`userId` = `u`.`userId`);

-- ----------------------------
-- View structure for customer_bill
-- ----------------------------
DROP VIEW IF EXISTS `customer_bill`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `customer_bill` AS select `ordering`.`userId` AS `userId`,sum((`ordering`.`dishesNum` * `menu`.`unitPrice`)) AS `totalPri` from (`ordering` join `menu`) where (`ordering`.`dishesId` = `menu`.`dishesId`) group by `ordering`.`userId`;

-- ----------------------------
-- View structure for menu_withdiscount
-- ----------------------------
DROP VIEW IF EXISTS `menu_withdiscount`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `menu_withdiscount` AS select `menu`.`dishesId` AS `dishesId`,`menu`.`dishesName` AS `dishesName`,`menu`.`unitPrice` AS `unitPrice`,(`menu`.`unitPrice` * 0.88) AS `discountPri` from `menu`;

-- ----------------------------
-- View structure for orderingtoshow
-- ----------------------------
DROP VIEW IF EXISTS `orderingtoshow`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `orderingtoshow` AS select `o`.`orderId` AS `oId`,`o`.`tableId` AS `tId`,`u`.`userName` AS `uName`,`m`.`dishesName` AS `dName`,`o`.`dishesNum` AS `dNum`,`o`.`orderTime` AS `oTime` from ((`ordering` `o` join `user` `u`) join `menu` `m`) where ((`o`.`userId` = `u`.`userId`) and (`o`.`dishesId` = `m`.`dishesId`));

-- ----------------------------
-- View structure for s_meat
-- ----------------------------
DROP VIEW IF EXISTS `s_meat`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `s_meat` AS select `menu`.`dishesId` AS `dishesId`,`menu`.`dishesName` AS `dishesName`,`menu`.`unitPrice` AS `unitPrice` from `menu` where (`menu`.`category` = '荤菜');

-- ----------------------------
-- View structure for user_order
-- ----------------------------
DROP VIEW IF EXISTS `user_order`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_order` AS select `ordering`.`userId` AS `userId`,sum(`ordering`.`dishesNum`) AS `totalNum` from `ordering` group by `ordering`.`userId`;

-- ----------------------------
-- Procedure structure for addUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `addUser`;
delimiter ;;
CREATE PROCEDURE `addUser`(in uId int, in uName varchar(30),in pwd varchar(30), in bal float, in auth int)
begin
	insert into user values (uId,uName,pwd,bal,auth);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deleteUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteUser`;
delimiter ;;
CREATE PROCEDURE `deleteUser`(in uId int)
begin
	delete from ordering_sys.user where userId=uId;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getOrderingList
-- ----------------------------
DROP PROCEDURE IF EXISTS `getOrderingList`;
delimiter ;;
CREATE PROCEDURE `getOrderingList`()
begin
	select * from orderingToShow;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getUserById
-- ----------------------------
DROP PROCEDURE IF EXISTS `getUserById`;
delimiter ;;
CREATE PROCEDURE `getUserById`(in id int)
begin
	select * from user where userId = id;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getUserList
-- ----------------------------
DROP PROCEDURE IF EXISTS `getUserList`;
delimiter ;;
CREATE PROCEDURE `getUserList`()
begin
	select * from ordering_sys.user;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updateBalance
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateBalance`;
delimiter ;;
CREATE PROCEDURE `updateBalance`(in uId int, in bal float)
begin
	update ordering_sys.user set balance=bal where userId = uId;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table menu
-- ----------------------------
DROP TRIGGER IF EXISTS `cascadedelete`;
delimiter ;;
CREATE TRIGGER `cascadedelete` BEFORE DELETE ON `menu` FOR EACH ROW begin
	delete from ordering where dishesId=old.dishesId;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `negative`;
delimiter ;;
CREATE TRIGGER `negative` BEFORE INSERT ON `user` FOR EACH ROW begin
	if new.balance<0
	then set new.balance=0;
	end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `negative2`;
delimiter ;;
CREATE TRIGGER `negative2` BEFORE UPDATE ON `user` FOR EACH ROW begin
	if new.balance<0
	then set new.balance=0;
	end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
