SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car_sells
-- ----------------------------
DROP TABLE IF EXISTS `car_sells`;
CREATE TABLE `car_sells`  (
  `SellID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Type` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Color` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `Day` date NULL DEFAULT NULL,
  `Amount` int NULL DEFAULT NULL,
  `Name` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SellID`) USING BTREE,
  CONSTRAINT `car_sells_chk_1` CHECK (`price` > 0),
  CONSTRAINT `car_sells_chk_2` CHECK (`Amount` > 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of car_sells
-- ----------------------------
INSERT INTO `car_sells` VALUES ('1004', '宝马M4', '宝格丽蓝', 1570000, '2024-02-29', 1, '邱睿');
INSERT INTO `car_sells` VALUES ('1005', '保时捷GT4', '暗夜黑', 1578000, '2020-05-02', 1, '龙詩涵');
INSERT INTO `car_sells` VALUES ('1006', '保时捷GT4', '龙胆蓝金属漆', 1617700, '2023-02-02', 1, '陆子异');
INSERT INTO `car_sells` VALUES ('1007', '大众Phaeton', '经典黑', 200000, '2021-01-30', 1, '汤詩涵');
INSERT INTO `car_sells` VALUES ('1008', '保时捷718', '竞速黄', 650000, '2022-05-06', 1, '赵晓明');
INSERT INTO `car_sells` VALUES ('1009', '奔驰E300', '暗夜黑', 600000, '2023-03-19', 1, '贺秀英');
INSERT INTO `car_sells` VALUES ('1010', '迈巴赫S900', '黑灰双拼（限定）', 2121000, '2019-02-05', 1, '侯震南');
INSERT INTO `car_sells` VALUES ('1011', '宝马8系', '经典黑', 1108000, '2023-01-03', 1, '萧嘉伦');
INSERT INTO `car_sells` VALUES ('1012', '宝马X7', '滨海湾蓝', 1039000, '2020-02-23', 1, '戴杰宏');
INSERT INTO `car_sells` VALUES ('1013', '保时捷GT4', '火焰红', 1578000, '2019-10-11', 1, '严岚');
INSERT INTO `car_sells` VALUES ('1014', '保时捷GT4', '竞速黄', 1578000, '2021-01-09', 1, '戴秀英');
INSERT INTO `car_sells` VALUES ('1015', '宝马5系', '墨灰色', 1208000, '2019-11-21', 1, '武詩涵');
INSERT INTO `car_sells` VALUES ('1016', '宝马3系', '经典白', 300000, '2021-07-26', 1, '侯震南');
INSERT INTO `car_sells` VALUES ('1017', '保时捷GT4', '极地灰', 1617700, '2021-09-01', 1, '王子韬');
INSERT INTO `car_sells` VALUES ('1018', '大众Passat', '碧蓝', 200000, '2021-05-14', 1, '王子韬');
INSERT INTO `car_sells` VALUES ('1019', '保时捷GT4', '星光宝石红 Neo', 1617700, '2023-02-24', 1, '王子韬');
INSERT INTO `car_sells` VALUES ('1020', '保时捷GT4', 'GT 银金属漆', 1617700, '2021-05-02', 1, '武詩涵');
INSERT INTO `car_sells` VALUES ('1027', '迈巴赫S900', '黑灰双拼（限定）', 2121000, '2022-03-09', 1, '龙詩涵');
INSERT INTO `car_sells` VALUES ('1028', '方程豹5', '夜影黑', 309800, '2022-02-01', 1, '侯震南');
INSERT INTO `car_sells` VALUES ('1029', '仰望U8豪华版', '萤石白', 1098000, '2024-07-09', 1, '唐睿');
INSERT INTO `car_sells` VALUES ('1030', '仰望U8越野版', '龙石绿', 1098000, '2024-07-09', 1, '汤詩涵');
INSERT INTO `car_sells` VALUES ('1031', '比亚迪唐DM-I', '银砂黑', 249800, '2020-04-09', 1, '戴杰宏');
INSERT INTO `car_sells` VALUES ('1032', '比亚迪汉EV', '赤帝红', 302800, '2024-07-09', 1, '侯震南');
INSERT INTO `car_sells` VALUES ('1033', '宝马M4', '暗夜黑', 1500000, '2020-08-01', 1, '姚子韬');
INSERT INTO `car_sells` VALUES ('1034', '比亚迪汉DM-P', '玄空黑', 290000, '2024-07-09', 1, '唐睿');
INSERT INTO `car_sells` VALUES ('1035', '大众Passat', '碧蓝', 200000, '2019-01-09', 1, '郭宇宁');
INSERT INTO `car_sells` VALUES ('1036', '比亚迪海豹06', '沁海绿', 110800, '2020-04-01', 1, '贺秀英');
INSERT INTO `car_sells` VALUES ('1037', '比亚迪秦L', '茶晶灰', 100000, '2023-01-09', 1, '汤詩涵');
INSERT INTO `car_sells` VALUES ('1038', '比亚迪海豹06', '亚特兰蒂斯灰', 109800, '2022-04-09', 1, '陆子异');
INSERT INTO `car_sells` VALUES ('1039', '比亚迪唐DM-I', '冰川蓝', 249800, '2023-01-09', 1, '严岚');
INSERT INTO `car_sells` VALUES ('1040', '保时捷GT4', '竞速黄', 1578000, '2024-07-09', 1, '徐晓明');
INSERT INTO `car_sells` VALUES ('1041', '仰望U9', '月曜银', 1680000, '2021-01-01', 1, '邵嘉伦');
INSERT INTO `car_sells` VALUES ('1042', '比亚迪秦L', '冰珀青', 100000, '2021-04-01', 1, '萧嘉伦');
INSERT INTO `car_sells` VALUES ('1043', '比亚迪唐DM-I', '银釉白', 249800, '2020-03-01', 1, '武詩涵');

-- ----------------------------
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars`  (
  `CarID` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Color` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Factory` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreateTime` date NULL DEFAULT NULL,
  `Price` double NULL DEFAULT NULL,
  `Status` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CarID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cars
-- ----------------------------
INSERT INTO `cars` VALUES ('BC1010', '奔驰E300', '暗夜黑', '北京经济技术开发区', '2024-07-07', 600000, 'unsold');
INSERT INTO `cars` VALUES ('BC1011', '奔驰E300', '暗夜黑', '北京经济技术开发区', '2023-06-15', 600000, 'sold');
INSERT INTO `cars` VALUES ('BC1012', '迈巴赫S900', '黑灰双拼（限定）', '德国斯图加特', '2023-06-02', 2121000, 'sold');
INSERT INTO `cars` VALUES ('BC1013', '奔驰E300', '暗夜黑', '北京经济技术开发区', '2023-06-15', 600000, 'unsold');
INSERT INTO `cars` VALUES ('BC1014', '迈巴赫S900', '黑灰双拼（限定）', '德国斯图加特', '2023-06-02', 2121000, 'sold');
INSERT INTO `cars` VALUES ('BC1015', '奔驰E300', '暗夜黑', '北京经济技术开发区', '2023-06-15', 600000, 'unsold');
INSERT INTO `cars` VALUES ('BC1016', '奔驰E300', '碧蓝', '北京经济技术开发区', '2023-06-15', 600000, 'unsold');
INSERT INTO `cars` VALUES ('BMW1010', '宝马5系', '墨灰色', '德国慕尼黑（进口）', '2022-01-01', 1208000, 'sold');
INSERT INTO `cars` VALUES ('BMW1011', '宝马M4', '暗夜黑', '德国慕尼黑（进口）', '2022-01-15', 1500000, 'sold');
INSERT INTO `cars` VALUES ('BMW1012', '宝马3系', '经典白', '中国沈阳', '2023-02-06', 300000, 'sold');
INSERT INTO `cars` VALUES ('BMW1013', '宝马M4', '宝格丽蓝', '德国慕尼黑（进口）', '2023-02-14', 1570000, 'sold');
INSERT INTO `cars` VALUES ('BMW1014', '宝马8系', '宝石青', '德国慕尼黑（进口）', '2023-01-01', 1108000, 'sold');
INSERT INTO `cars` VALUES ('BMW1015', '宝马X7', '滨海湾蓝', '德国慕尼黑（进口）', '2021-01-01', 1039000, 'sold');
INSERT INTO `cars` VALUES ('BMW1016', '宝马8系', '滨海湾蓝', '德国慕尼黑（进口）', '2023-07-05', 1108000, 'unsold');
INSERT INTO `cars` VALUES ('BMW1017', '宝马3系', '经典白', '中国沈阳', '2023-02-06', 300000, 'unsold');
INSERT INTO `cars` VALUES ('BMW1018', '宝马8系', '宝石青', '德国慕尼黑（进口）', '2023-01-01', 1108000, 'unsold');
INSERT INTO `cars` VALUES ('BSJ1010', '保时捷GT4', '经典白', '德国斯图加特', '2021-11-17', 1578000, 'unsold');
INSERT INTO `cars` VALUES ('BSJ1011', '保时捷GT4', '经典白', '德国斯图加特', '2021-11-17', 1578000, 'unsold');
INSERT INTO `cars` VALUES ('BSJ1012', '保时捷GT4', '暗夜黑', '德国斯图加特', '2021-11-17', 1578000, 'sold');
INSERT INTO `cars` VALUES ('BSJ1013', '保时捷GT4', '火焰红', '德国斯图加特', '2021-11-17', 1578000, 'sold');
INSERT INTO `cars` VALUES ('BSJ1014', '保时捷GT4', '竞速黄', '德国斯图加特', '2021-11-17', 1578000, 'sold');
INSERT INTO `cars` VALUES ('BSJ1015', '保时捷GT4', 'GT 银金属漆', '德国斯图加特', '2021-11-17', 1617700, 'sold');
INSERT INTO `cars` VALUES ('BSJ1016', '保时捷GT4', '龙胆蓝金属漆', '德国斯图加特', '2021-11-17', 1617700, 'sold');
INSERT INTO `cars` VALUES ('BSJ1017', '保时捷GT4', '极地灰', '德国斯图加特', '2021-11-17', 1617700, 'sold');
INSERT INTO `cars` VALUES ('BSJ1018', '保时捷GT4', '星光宝石红 Neo', '德国斯图加特', '2021-11-17', 1617700, 'sold');
INSERT INTO `cars` VALUES ('BSJ1019', '保时捷GT4', '鲨蓝', '德国斯图加特', '2021-11-17', 1617700, 'unsold');
INSERT INTO `cars` VALUES ('BSJ1020', '保时捷718', '竞速黄', '德国斯图加特', '2023-01-11', 650000, 'sold');
INSERT INTO `cars` VALUES ('BSJ1021', '保时捷GT4', '经典白', '德国斯图加特', '2021-11-17', 1578000, 'unsold');
INSERT INTO `cars` VALUES ('BSJ1022', '保时捷GT4', '暗夜黑', '德国斯图加特', '2021-11-17', 1578000, 'unsold');
INSERT INTO `cars` VALUES ('BSJ1023', '保时捷GT4', '火焰红', '德国斯图加特', '2021-11-17', 1578000, 'unsold');
INSERT INTO `cars` VALUES ('BSJ1024', '保时捷GT4', '竞速黄', '德国斯图加特', '2021-11-17', 1578000, 'sold');
INSERT INTO `cars` VALUES ('BYD1001', '比亚迪秦L', '建窑紫', '陕西西安', '2021-07-07', 100000, 'unsold');
INSERT INTO `cars` VALUES ('BYD1002', '比亚迪秦L', '茶晶灰', '陕西西安', '2024-07-07', 100000, 'sold');
INSERT INTO `cars` VALUES ('BYD1003', '比亚迪秦L', '冰珀青', '陕西西安', '2024-07-07', 100000, 'sold');
INSERT INTO `cars` VALUES ('BYD1004', '比亚迪汉DM-P', '玄空黑', '陕西西安', '2024-07-07', 290000, 'sold');
INSERT INTO `cars` VALUES ('BYD1005', '比亚迪汉EV', '极光蓝', '陕西西安', '2024-07-07', 302800, 'unsold');
INSERT INTO `cars` VALUES ('BYD1006', '比亚迪汉EV', '赤帝红', '陕西西安', '2024-07-07', 302800, 'sold');
INSERT INTO `cars` VALUES ('BYD1007', '比亚迪汉EV', '时光灰', '陕西西安', '2024-07-07', 302800, 'unsold');
INSERT INTO `cars` VALUES ('BYD1008', '比亚迪汉EV', '冰川蓝', '陕西西安', '2024-07-07', 302800, 'unsold');
INSERT INTO `cars` VALUES ('BYD1009', '比亚迪唐EV', '冰川蓝', '陕西西安', '2024-07-07', 302800, 'unsold');
INSERT INTO `cars` VALUES ('BYD1010', '比亚迪唐EV', '冰川蓝', '陕西西安', '2024-07-07', 269800, 'unsold');
INSERT INTO `cars` VALUES ('BYD1011', '比亚迪唐EV', '山脉灰', '陕西西安', '2024-07-07', 269800, 'unsold');
INSERT INTO `cars` VALUES ('BYD1012', '比亚迪唐EV', '银釉白', '陕西西安', '2024-07-07', 269800, 'unsold');
INSERT INTO `cars` VALUES ('BYD1013', '比亚迪唐DM-I', '银釉白', '陕西西安', '2024-07-07', 249800, 'sold');
INSERT INTO `cars` VALUES ('BYD1014', '比亚迪唐DM-I', '银砂黑', '陕西西安', '2024-07-07', 249800, 'sold');
INSERT INTO `cars` VALUES ('BYD1015', '比亚迪唐DM-I', '冰川蓝', '陕西西安', '2024-07-07', 249800, 'sold');
INSERT INTO `cars` VALUES ('BYD1016', '比亚迪海豹06', '亚特兰蒂斯灰', '陕西西安', '2024-07-07', 109800, 'sold');
INSERT INTO `cars` VALUES ('BYD1017', '比亚迪海豹06', '沁海绿', '陕西西安', '2024-07-07', 110800, 'sold');
INSERT INTO `cars` VALUES ('DZ1010', '大众Passat', '碧蓝', '南京生产基地', '2023-05-03', 200000, 'sold');
INSERT INTO `cars` VALUES ('DZ1011', '大众Phaeton', '经典黑', '德国德累斯顿', '2010-06-11', 1000000, 'sold');
INSERT INTO `cars` VALUES ('DZ1012', '大众Passat', '碧蓝', '南京生产基地', '2023-05-03', 200000, 'sold');
INSERT INTO `cars` VALUES ('DZ1013', '大众Passat', '碧蓝', '南京生产基地', '2023-05-03', 200000, 'unsold');
INSERT INTO `cars` VALUES ('DZ1014', '大众Phaeton', '经典黑', '德国德累斯顿', '2010-06-11', 200000, 'unsold');
INSERT INTO `cars` VALUES ('DZ1015', '大众Phaeton', '经典黑', '德国德累斯顿', '2010-06-11', 200000, 'unsold');
INSERT INTO `cars` VALUES ('FCB1001', '方程豹5', '冰原蓝', '陕西西安', '2024-07-03', 289800, 'unsold');
INSERT INTO `cars` VALUES ('FCB1002', '方程豹5', '夜影黑', '陕西西安', '2024-07-03', 309800, 'sold');
INSERT INTO `cars` VALUES ('FCB1003', '方程豹5', '胡杨金', '陕西西安', '2024-07-03', 309800, 'unsold');
INSERT INTO `cars` VALUES ('FCB1004', '方程豹5', '雪域白', '陕西西安', '2024-07-03', 309800, 'unsold');
INSERT INTO `cars` VALUES ('FCB1005', '方程豹5', '山脉绿', '陕西西安', '2024-07-03', 289800, 'unsold');
INSERT INTO `cars` VALUES ('UW1001', '仰望U8越野版', '龙石绿', '陕西西安', '2024-07-01', 1098000, 'sold');
INSERT INTO `cars` VALUES ('UW1002', '仰望U8越野版', '曜石黑', '陕西西安', '2024-07-01', 1098000, 'unsold');
INSERT INTO `cars` VALUES ('UW1003', '仰望U8豪华版', '萤石白', '陕西西安', '2024-07-01', 1098000, 'sold');
INSERT INTO `cars` VALUES ('UW1004', '仰望U8越野版', '萤石白', '陕西西安', '2024-07-01', 1098000, 'unsold');
INSERT INTO `cars` VALUES ('UW1005', '仰望U9', '阿盖尔紫', '陕西西安', '2024-07-02', 1680000, 'unsold');
INSERT INTO `cars` VALUES ('UW1006', '仰望U9', '赤霞丹朱', '陕西西安', '2024-07-02', 1680000, 'unsold');
INSERT INTO `cars` VALUES ('UW1007', '仰望U9', '月曜银', '陕西西安', '2024-07-02', 1680000, 'sold');

-- ----------------------------
-- Table structure for charges
-- ----------------------------
DROP TABLE IF EXISTS `charges`;
CREATE TABLE `charges`  (
  `SellID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `StaffID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `StaffID`(`StaffID` ASC) USING BTREE,
  INDEX `SellID`(`SellID` ASC) USING BTREE,
  CONSTRAINT `charges_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staffs` (`StaffID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `charges_ibfk_2` FOREIGN KEY (`SellID`) REFERENCES `car_sells` (`SellID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of charges
-- ----------------------------
INSERT INTO `charges` VALUES ('1004', '9');
INSERT INTO `charges` VALUES ('1005', '5');
INSERT INTO `charges` VALUES ('1006', '10');
INSERT INTO `charges` VALUES ('1007', '14');
INSERT INTO `charges` VALUES ('1008', '13');
INSERT INTO `charges` VALUES ('1009', '20');
INSERT INTO `charges` VALUES ('1010', '11');
INSERT INTO `charges` VALUES ('1011', '18');
INSERT INTO `charges` VALUES ('1012', '12');
INSERT INTO `charges` VALUES ('1013', '16');
INSERT INTO `charges` VALUES ('1014', '6');
INSERT INTO `charges` VALUES ('1015', '8');
INSERT INTO `charges` VALUES ('1016', '11');
INSERT INTO `charges` VALUES ('1017', '1');
INSERT INTO `charges` VALUES ('1018', '1');
INSERT INTO `charges` VALUES ('1019', '1');
INSERT INTO `charges` VALUES ('1020', '8');
INSERT INTO `charges` VALUES ('1027', '5');
INSERT INTO `charges` VALUES ('1028', '11');
INSERT INTO `charges` VALUES ('1029', '3');
INSERT INTO `charges` VALUES ('1030', '14');
INSERT INTO `charges` VALUES ('1031', '12');
INSERT INTO `charges` VALUES ('1032', '11');
INSERT INTO `charges` VALUES ('1033', '4');
INSERT INTO `charges` VALUES ('1034', '3');
INSERT INTO `charges` VALUES ('1035', '15');
INSERT INTO `charges` VALUES ('1036', '20');
INSERT INTO `charges` VALUES ('1037', '14');
INSERT INTO `charges` VALUES ('1038', '10');
INSERT INTO `charges` VALUES ('1039', '16');
INSERT INTO `charges` VALUES ('1040', '7');
INSERT INTO `charges` VALUES ('1041', '17');
INSERT INTO `charges` VALUES ('1042', '2');
INSERT INTO `charges` VALUES ('1043', '8');

-- ----------------------------
-- Table structure for communications
-- ----------------------------
DROP TABLE IF EXISTS `communications`;
CREATE TABLE `communications`  (
  `StaffID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CustomerID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `RecordID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `StaffID`(`StaffID` ASC) USING BTREE,
  INDEX `CustomerID`(`CustomerID` ASC) USING BTREE,
  INDEX `RecordID`(`RecordID` ASC) USING BTREE,
  CONSTRAINT `communications_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staffs` (`StaffID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `communications_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `communications_ibfk_3` FOREIGN KEY (`RecordID`) REFERENCES `records` (`RecordID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of communications
-- ----------------------------
INSERT INTO `communications` VALUES ('16', 'C4', '1');
INSERT INTO `communications` VALUES ('1', 'C1', '10');
INSERT INTO `communications` VALUES ('10', 'C4', '11');
INSERT INTO `communications` VALUES ('14', 'C9', '12');
INSERT INTO `communications` VALUES ('18', 'C10', '13');
INSERT INTO `communications` VALUES ('11', 'C12', '14');
INSERT INTO `communications` VALUES ('1', 'C5', '15');
INSERT INTO `communications` VALUES ('1', 'C20', '16');
INSERT INTO `communications` VALUES ('8', 'C19', '17');
INSERT INTO `communications` VALUES ('12', 'C18', '18');
INSERT INTO `communications` VALUES ('13', 'C15', '19');
INSERT INTO `communications` VALUES ('6', 'C19', '20');
INSERT INTO `communications` VALUES ('5', 'C11', '3');
INSERT INTO `communications` VALUES ('20', 'C4', '2');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `CustomerID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Address` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Contact` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('C1', '小方', '中国深圳罗湖区蔡屋围深南东路616号华润大厦6室', '18700000001');
INSERT INTO `customers` VALUES ('C10', '小斌', '中国东莞坑美十五巷641号华润大厦47室', '18700000010');
INSERT INTO `customers` VALUES ('C11', '小元', '中国上海市黄浦区淮海中路41号43楼', '18700000011');
INSERT INTO `customers` VALUES ('C12', '小周', '中国北京市西城区复兴门内大街333号16栋', '18700000012');
INSERT INTO `customers` VALUES ('C13', '小阳', '中国北京市东城区东单王府井东街506号37楼', '18700000013');
INSERT INTO `customers` VALUES ('C14', '小数', '中国深圳龙岗区布吉镇西环路443号华润大厦17室', '18700000014');
INSERT INTO `customers` VALUES ('C15', '小据', '中国广州市海珠区江南西路299号32楼', '18700000015');
INSERT INTO `customers` VALUES ('C16', '小库', '中国深圳龙岗区学园一巷238号华润大厦47室', '18700000016');
INSERT INTO `customers` VALUES ('C17', '小课', '中国东莞珊瑚路149号17楼', '18700000017');
INSERT INTO `customers` VALUES ('C18', '小程', '中国深圳罗湖区蔡屋围深南东路927号7楼', '18700000018');
INSERT INTO `customers` VALUES ('C19', '小设', '中国广州市越秀区中山二路173号11栋', '18700000019');
INSERT INTO `customers` VALUES ('C2', '小坤', '中国深圳福田区景田东一街596号华润大厦28室', '18700000002');
INSERT INTO `customers` VALUES ('C20', '小计', '中国北京市東城区東直門內大街707号34栋', '18700000020');
INSERT INTO `customers` VALUES ('C3', '小冯', '中国成都市成华区双庆路750号28室', '18700000003');
INSERT INTO `customers` VALUES ('C4', '小胜', '中国东莞珊瑚路623号15号楼', '18700000004');
INSERT INTO `customers` VALUES ('C5', '小龙', '中国广州市白云区小坪东路99号5号楼', '18700000005');
INSERT INTO `customers` VALUES ('C6', '小叶', '中国深圳龙岗区布吉镇西环路175号26室', '18700000006');
INSERT INTO `customers` VALUES ('C7', '小顾', '中国广州市天河区天河路15号华润大厦46室', '18700000007');
INSERT INTO `customers` VALUES ('C8', '小玮', '中国上海市徐汇区虹桥路235号49楼', '18700000008');
INSERT INTO `customers` VALUES ('C9', '小徐', '中国北京市西城区西長安街222号华润大厦29室', '18700000009');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `CustomerID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SellID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `CustomerID`(`CustomerID` ASC) USING BTREE,
  INDEX `SellID`(`SellID` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`SellID`) REFERENCES `car_sells` (`SellID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('C5', '1004');
INSERT INTO `orders` VALUES ('C11', '1005');
INSERT INTO `orders` VALUES ('C4', '1006');
INSERT INTO `orders` VALUES ('C9', '1007');
INSERT INTO `orders` VALUES ('C15', '1008');
INSERT INTO `orders` VALUES ('C4', '1009');
INSERT INTO `orders` VALUES ('C12', '1010');
INSERT INTO `orders` VALUES ('C9', '1011');
INSERT INTO `orders` VALUES ('C4', '1012');
INSERT INTO `orders` VALUES ('C16', '1013');
INSERT INTO `orders` VALUES ('C19', '1014');
INSERT INTO `orders` VALUES ('C19', '1015');
INSERT INTO `orders` VALUES ('C8', '1016');
INSERT INTO `orders` VALUES ('C5', '1017');
INSERT INTO `orders` VALUES ('C10', '1018');
INSERT INTO `orders` VALUES ('C20', '1019');
INSERT INTO `orders` VALUES ('C19', '1020');

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records`  (
  `RecordID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Time` date NULL DEFAULT NULL,
  `Type` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`RecordID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES ('1', '2019-04-07', '售后服务', '维修保养可以提前预约吗？预约的话需要联系谁？');
INSERT INTO `records` VALUES ('10', '2023-02-07', '购车服务', '这台车的生产日期是哪天，是什么时候到4S店的？');
INSERT INTO `records` VALUES ('11', '2023-06-22', '购车服务', '宝马X7有什么样的配置、颜色有哪些？');
INSERT INTO `records` VALUES ('12', '2023-01-12', '购车服务', '购车是否收取出库费？');
INSERT INTO `records` VALUES ('13', '2021-09-12', '购车服务', '购车是否收取PDI检测费？');
INSERT INTO `records` VALUES ('14', '2019-02-14', '售后服务', '日常用车疑问需要咨询销售还是售后，具体联系谁？');
INSERT INTO `records` VALUES ('15', '2021-04-26', '购车服务', '这台车的生产日期是哪天，是什么时候到4S店的？');
INSERT INTO `records` VALUES ('16', '2020-09-01', '售后服务', '发生交通事故后，除了联系交警和保险公司，4S店是否会派人前来协助处理？\r\n\r\n');
INSERT INTO `records` VALUES ('17', '2020-11-13', '购车服务', '你这台车库存时间较久的车型，是否在提车之前4S店安排全车检测和保养一次？');
INSERT INTO `records` VALUES ('18', '2020-02-18', '购车服务', '车子是现车还是要订车，现车的话是库存几月的了？');
INSERT INTO `records` VALUES ('19', '2022-06-08', '购车服务', '该车型有没有现车，没有的话等多久？');
INSERT INTO `records` VALUES ('2', '2021-12-12', '购车服务', '有没有强制加装精品，裸车是不是不卖？');
INSERT INTO `records` VALUES ('20', '2021-10-12', '购车服务', '该车的辆信息，包括车辆具体出厂时间、安全配置都有哪些？');
INSERT INTO `records` VALUES ('3', '2021-11-06', '购车服务', '驾驶环节都可以测试哪些功能？');

-- ----------------------------
-- Table structure for sells
-- ----------------------------
DROP TABLE IF EXISTS `sells`;
CREATE TABLE `sells`  (
  `CarID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SellID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `CarID`(`CarID` ASC) USING BTREE,
  INDEX `SellID`(`SellID` ASC) USING BTREE,
  CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sells_ibfk_2` FOREIGN KEY (`SellID`) REFERENCES `car_sells` (`SellID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sells
-- ----------------------------
INSERT INTO `sells` VALUES ('BMW1013', '1004');
INSERT INTO `sells` VALUES ('BSJ1012', '1005');
INSERT INTO `sells` VALUES ('BC1012', '1010');
INSERT INTO `sells` VALUES ('BSJ1015', '1020');
INSERT INTO `sells` VALUES ('BMW1015', '1012');
INSERT INTO `sells` VALUES ('BSJ1016', '1006');
INSERT INTO `sells` VALUES ('BSJ1018', '1019');
INSERT INTO `sells` VALUES ('DZ1011', '1007');
INSERT INTO `sells` VALUES ('BMW1010', '1015');
INSERT INTO `sells` VALUES ('DZ1010', '1018');
INSERT INTO `sells` VALUES ('BC1011', '1009');
INSERT INTO `sells` VALUES ('BSJ1017', '1017');
INSERT INTO `sells` VALUES ('BMW1012', '1016');
INSERT INTO `sells` VALUES ('BSJ1013', '1013');
INSERT INTO `sells` VALUES ('BMW1014', '1011');
INSERT INTO `sells` VALUES ('BSJ1014', '1014');
INSERT INTO `sells` VALUES ('BSJ1020', '1008');
INSERT INTO `sells` VALUES ('BC1014', '1027');
INSERT INTO `sells` VALUES ('FCB1002', '1028');
INSERT INTO `sells` VALUES ('UW1003', '1029');
INSERT INTO `sells` VALUES ('UW1001', '1030');
INSERT INTO `sells` VALUES ('BYD1014', '1031');
INSERT INTO `sells` VALUES ('BYD1006', '1032');
INSERT INTO `sells` VALUES ('BMW1011', '1033');
INSERT INTO `sells` VALUES ('BYD1004', '1034');
INSERT INTO `sells` VALUES ('DZ1012', '1035');
INSERT INTO `sells` VALUES ('BYD1017', '1036');
INSERT INTO `sells` VALUES ('BYD1002', '1037');
INSERT INTO `sells` VALUES ('BYD1016', '1038');
INSERT INTO `sells` VALUES ('BYD1015', '1039');
INSERT INTO `sells` VALUES ('BSJ1024', '1040');
INSERT INTO `sells` VALUES ('UW1007', '1041');
INSERT INTO `sells` VALUES ('BYD1003', '1042');
INSERT INTO `sells` VALUES ('BYD1013', '1043');

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs`  (
  `StaffID` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Sex` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Age` int NULL DEFAULT NULL,
  `Origin` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Education` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`StaffID`) USING BTREE,
  CONSTRAINT `staffs_chk_1` CHECK (`Sex` in (_utf8mb4'男',_utf8mb4'女')),
  CONSTRAINT `staffs_chk_2` CHECK ((`age` >= 18) and (`age` <= 60))
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of staffs
-- ----------------------------
INSERT INTO `staffs` VALUES ('1', '王子韬', '男', 25, '中国深圳罗湖区田贝一路112号5室', '高中');
INSERT INTO `staffs` VALUES ('10', '陆子异', '男', 23, '中国北京市延庆区028县道206号5楼', '专科');
INSERT INTO `staffs` VALUES ('11', '侯震南', '男', 20, '中国成都市成华区双庆路222号35室', '博士');
INSERT INTO `staffs` VALUES ('12', '戴杰宏', '男', 25, '中国北京市朝阳区三里屯路164号28号楼', '专科');
INSERT INTO `staffs` VALUES ('13', '赵晓明', '男', 34, '中国中山天河区大信商圈大信南路869号42栋', '研究生');
INSERT INTO `staffs` VALUES ('14', '汤詩涵', '女', 19, '中国上海市浦东新区健祥路926号36号楼', '专科');
INSERT INTO `staffs` VALUES ('15', '郭宇宁', '男', 32, '中国上海市黄浦区淮海中路779号19号楼', '本科');
INSERT INTO `staffs` VALUES ('16', '严岚', '女', 28, '中国成都市锦江区人民南路四段292号34楼', '专科');
INSERT INTO `staffs` VALUES ('17', '邵嘉伦', '男', 19, '中国深圳罗湖区田贝一路172号46室', '研究生');
INSERT INTO `staffs` VALUES ('18', '梁嘉伦', '男', 22, '中国东莞坑美十五巷649号39栋', '专科');
INSERT INTO `staffs` VALUES ('19', '丁晓明', '男', 25, '中国深圳罗湖区田贝一路846号44室', '本科');
INSERT INTO `staffs` VALUES ('2', '萧嘉伦', '男', 27, '中国东莞东泰五街578号华润大厦47室', '本科');
INSERT INTO `staffs` VALUES ('20', '贺秀英', '女', 25, '中国中山紫马岭商圈中山五路460号29室', '研究生');
INSERT INTO `staffs` VALUES ('3', '唐睿', '男', 21, '中国北京市东城区东单王府井东街653号49楼', '硕士');
INSERT INTO `staffs` VALUES ('4', '姚子韬', '男', 28, '中国成都市成华区双庆路462号华润大厦7室', '本科');
INSERT INTO `staffs` VALUES ('5', '龙詩涵', '女', 24, '中国成都市锦江区人民南路四段261号37栋', '本科');
INSERT INTO `staffs` VALUES ('6', '戴秀英', '女', 26, '中国北京市房山区岳琉路5号28栋', '专科');
INSERT INTO `staffs` VALUES ('7', '徐晓明', '男', 22, '中国北京市東城区東直門內大街347号44室', '研究生');
INSERT INTO `staffs` VALUES ('8', '武詩涵', '女', 34, '中国成都市成华区双庆路837号华润大厦49室', '本科');
INSERT INTO `staffs` VALUES ('9', '邱睿', '男', 35, '中国北京市海淀区清河中街68号748号46号楼', '本科');

SET FOREIGN_KEY_CHECKS = 1;
