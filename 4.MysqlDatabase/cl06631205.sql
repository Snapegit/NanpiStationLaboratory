-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl06631205
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl06631205`
--

/*!40000 DROP DATABASE IF EXISTS `cl06631205`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl06631205` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl06631205`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `haocaikucun`
--

DROP TABLE IF EXISTS `haocaikucun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `haocaikucun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cailiaobianhao` varchar(200) DEFAULT NULL COMMENT '材料编号',
  `cailiaomingcheng` varchar(200) DEFAULT NULL COMMENT '材料名称',
  `cailiaoguige` varchar(200) DEFAULT NULL COMMENT '材料规格',
  `shengchanchangjia` varchar(200) DEFAULT NULL COMMENT '生产厂家',
  `goumairiqi` date DEFAULT NULL COMMENT '购买日期',
  `baozhiqi` varchar(200) DEFAULT NULL COMMENT '保质期',
  `cailiaoyongtu` varchar(200) DEFAULT NULL COMMENT '材料用途',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `shiyongjilu` varchar(200) DEFAULT NULL COMMENT '使用记录',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cailiaobianhao` (`cailiaobianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='耗材库存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `haocaikucun`
--

LOCK TABLES `haocaikucun` WRITE;
/*!40000 ALTER TABLE `haocaikucun` DISABLE KEYS */;
INSERT INTO `haocaikucun` VALUES (101,'2024-03-17 11:31:19','1111111111','材料名称1','材料规格1','生产厂家1','2024-03-17','保质期1','材料用途1',1,'使用记录1'),(102,'2024-03-17 11:31:19','2222222222','材料名称2','材料规格2','生产厂家2','2024-03-17','保质期2','材料用途2',2,'使用记录2'),(103,'2024-03-17 11:31:19','3333333333','材料名称3','材料规格3','生产厂家3','2024-03-17','保质期3','材料用途3',3,'使用记录3'),(104,'2024-03-17 11:31:19','4444444444','材料名称4','材料规格4','生产厂家4','2024-03-17','保质期4','材料用途4',4,'使用记录4'),(105,'2024-03-17 11:31:19','5555555555','材料名称5','材料规格5','生产厂家5','2024-03-17','保质期5','材料用途5',5,'使用记录5'),(106,'2024-03-17 11:31:19','6666666666','材料名称6','材料规格6','生产厂家6','2024-03-17','保质期6','材料用途6',6,'使用记录6');
/*!40000 ALTER TABLE `haocaikucun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyanrenyuan`
--

DROP TABLE IF EXISTS `keyanrenyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyanrenyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `keyanzhanghao` varchar(200) NOT NULL COMMENT '科研账号',
  `keyanmima` varchar(200) NOT NULL COMMENT '科研密码',
  `keyanrenyuanxingming` varchar(200) NOT NULL COMMENT '科研人员姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyanzhanghao` (`keyanzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='科研人员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyanrenyuan`
--

LOCK TABLES `keyanrenyuan` WRITE;
/*!40000 ALTER TABLE `keyanrenyuan` DISABLE KEYS */;
INSERT INTO `keyanrenyuan` VALUES (31,'2024-03-17 11:31:19','科研账号1','123456','科研人员姓名1','file/keyanrenyuanTouxiang1.jpg','男','19819881111'),(32,'2024-03-17 11:31:19','科研账号2','123456','科研人员姓名2','file/keyanrenyuanTouxiang2.jpg','男','19819881112'),(33,'2024-03-17 11:31:19','科研账号3','123456','科研人员姓名3','file/keyanrenyuanTouxiang3.jpg','男','19819881113'),(34,'2024-03-17 11:31:19','科研账号4','123456','科研人员姓名4','file/keyanrenyuanTouxiang4.jpg','男','19819881114'),(35,'2024-03-17 11:31:19','科研账号5','123456','科研人员姓名5','file/keyanrenyuanTouxiang5.jpg','男','19819881115'),(36,'2024-03-17 11:31:19','科研账号6','123456','科研人员姓名6','file/keyanrenyuanTouxiang6.jpg','男','19819881116');
/*!40000 ALTER TABLE `keyanrenyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyanxiangmu`
--

DROP TABLE IF EXISTS `keyanxiangmu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyanxiangmu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xiangmubianhao` varchar(200) DEFAULT NULL COMMENT '项目编号',
  `xiangmumingcheng` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `xiangmufuzeren` varchar(200) DEFAULT NULL COMMENT '项目负责人',
  `xiangmuchengyuan` varchar(200) DEFAULT NULL COMMENT '项目成员',
  `xiangmukaishishijian` date DEFAULT NULL COMMENT '项目开始时间',
  `xiangmujieshushijian` date DEFAULT NULL COMMENT '项目结束时间',
  `yanjiuneirong` longtext COMMENT '研究内容',
  `yusuan` double DEFAULT NULL COMMENT '预算',
  `chengguoxingshi` varchar(200) DEFAULT NULL COMMENT '成果形式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xiangmubianhao` (`xiangmubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='科研项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyanxiangmu`
--

LOCK TABLES `keyanxiangmu` WRITE;
/*!40000 ALTER TABLE `keyanxiangmu` DISABLE KEYS */;
INSERT INTO `keyanxiangmu` VALUES (111,'2024-03-17 11:31:19','1111111111','项目名称1','项目负责人1','项目成员1','2024-03-17','2024-03-17','研究内容1',1,'成果形式1'),(112,'2024-03-17 11:31:19','2222222222','项目名称2','项目负责人2','项目成员2','2024-03-17','2024-03-17','研究内容2',2,'成果形式2'),(113,'2024-03-17 11:31:19','3333333333','项目名称3','项目负责人3','项目成员3','2024-03-17','2024-03-17','研究内容3',3,'成果形式3'),(114,'2024-03-17 11:31:19','4444444444','项目名称4','项目负责人4','项目成员4','2024-03-17','2024-03-17','研究内容4',4,'成果形式4'),(115,'2024-03-17 11:31:19','5555555555','项目名称5','项目负责人5','项目成员5','2024-03-17','2024-03-17','研究内容5',5,'成果形式5'),(116,'2024-03-17 11:31:19','6666666666','项目名称6','项目负责人6','项目成员6','2024-03-17','2024-03-17','研究内容6',6,'成果形式6');
/*!40000 ALTER TABLE `keyanxiangmu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-03-17 11:31:19','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"科研项目\",\"menuJump\":\"列表\",\"tableName\":\"keyanxiangmu\"}],\"fontClass\":\"icon-common30\",\"menu\":\"科研项目管理\",\"unicode\":\"&#xee30;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"预算与资金\",\"menuJump\":\"列表\",\"tableName\":\"yusuanyuzijin\"}],\"fontClass\":\"icon-common48\",\"menu\":\"预算与资金管理\",\"unicode\":\"&#xef65;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-rank\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"实验设备\",\"menuJump\":\"列表\",\"tableName\":\"shiyanshebei\"}],\"fontClass\":\"icon-common50\",\"menu\":\"实验设备管理\",\"unicode\":\"&#xef96;\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"实验数据\",\"menuJump\":\"列表\",\"tableName\":\"shiyanshuju\"}],\"fontClass\":\"icon-common18\",\"menu\":\"实验数据管理\",\"unicode\":\"&#xedff;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"样品信息\",\"menuJump\":\"列表\",\"tableName\":\"yangpinxinxi\"}],\"fontClass\":\"icon-common14\",\"menu\":\"样品信息管理\",\"unicode\":\"&#xedfb;\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"科研人员\",\"tableName\":\"keyanrenyuan\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"设备维护\",\"menuJump\":\"列表\",\"tableName\":\"shebeiweihu\"}],\"fontClass\":\"icon-common43\",\"menu\":\"设备维护管理\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-wenzi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"维护日程安排\",\"menuJump\":\"列表\",\"tableName\":\"weihurichenganpai\"}],\"fontClass\":\"icon-common43\",\"menu\":\"维护日程安排管理\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-rank\",\"buttons\":[\"查看\",\"维护\"],\"menu\":\"实验设备\",\"menuJump\":\"列表\",\"tableName\":\"shiyanshebei\"}],\"fontClass\":\"icon-common50\",\"menu\":\"实验设备管理\",\"unicode\":\"&#xef96;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-camera\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"耗材库存\",\"menuJump\":\"列表\",\"tableName\":\"haocaikucun\"}],\"fontClass\":\"icon-common45\",\"menu\":\"耗材库存管理\",\"unicode\":\"&#xef3b;\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"维护人员\",\"tableName\":\"weihurenyuan\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shebeiweihu`
--

DROP TABLE IF EXISTS `shebeiweihu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shebeiweihu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shebeibianhao` varchar(200) NOT NULL COMMENT '设备编号',
  `shebeimingcheng` varchar(200) NOT NULL COMMENT '设备名称',
  `xinghao` varchar(200) DEFAULT NULL COMMENT '型号',
  `weihuzhanghao` varchar(200) DEFAULT NULL COMMENT '维护账号',
  `weihurenxingming` varchar(200) DEFAULT NULL COMMENT '维护人姓名',
  `weihushijian` datetime DEFAULT NULL COMMENT '维护时间',
  `zhuangtai` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='设备维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shebeiweihu`
--

LOCK TABLES `shebeiweihu` WRITE;
/*!40000 ALTER TABLE `shebeiweihu` DISABLE KEYS */;
INSERT INTO `shebeiweihu` VALUES (81,'2024-03-17 11:31:19','设备编号1','设备名称1','型号1','维护账号1','维护人姓名1','2024-03-17 19:31:19','正常'),(82,'2024-03-17 11:31:19','设备编号2','设备名称2','型号2','维护账号2','维护人姓名2','2024-03-17 19:31:19','正常'),(83,'2024-03-17 11:31:19','设备编号3','设备名称3','型号3','维护账号3','维护人姓名3','2024-03-17 19:31:19','正常'),(84,'2024-03-17 11:31:19','设备编号4','设备名称4','型号4','维护账号4','维护人姓名4','2024-03-17 19:31:19','正常'),(85,'2024-03-17 11:31:19','设备编号5','设备名称5','型号5','维护账号5','维护人姓名5','2024-03-17 19:31:19','正常'),(86,'2024-03-17 11:31:19','设备编号6','设备名称6','型号6','维护账号6','维护人姓名6','2024-03-17 19:31:19','正常');
/*!40000 ALTER TABLE `shebeiweihu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shiyanshebei`
--

DROP TABLE IF EXISTS `shiyanshebei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shiyanshebei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shebeibianhao` varchar(200) NOT NULL COMMENT '设备编号',
  `shebeimingcheng` varchar(200) NOT NULL COMMENT '设备名称',
  `tupian` longtext COMMENT '图片',
  `xinghao` varchar(200) DEFAULT NULL COMMENT '型号',
  `yongtu` longtext COMMENT '用途',
  `weizhi` varchar(200) DEFAULT NULL COMMENT '位置',
  `shebeizhuangtai` varchar(200) DEFAULT NULL COMMENT '设备状态',
  `shebeixiangqing` longtext COMMENT '设备详情',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shebeibianhao` (`shebeibianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='实验设备';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shiyanshebei`
--

LOCK TABLES `shiyanshebei` WRITE;
/*!40000 ALTER TABLE `shiyanshebei` DISABLE KEYS */;
INSERT INTO `shiyanshebei` VALUES (71,'2024-03-17 11:31:19','1111111111','设备名称1','file/shiyanshebeiTupian1.jpg,file/shiyanshebeiTupian2.jpg,file/shiyanshebeiTupian3.jpg','型号1','用途1','位置1','使用中','设备详情1'),(72,'2024-03-17 11:31:19','2222222222','设备名称2','file/shiyanshebeiTupian2.jpg,file/shiyanshebeiTupian3.jpg,file/shiyanshebeiTupian4.jpg','型号2','用途2','位置2','使用中','设备详情2'),(73,'2024-03-17 11:31:19','3333333333','设备名称3','file/shiyanshebeiTupian3.jpg,file/shiyanshebeiTupian4.jpg,file/shiyanshebeiTupian5.jpg','型号3','用途3','位置3','使用中','设备详情3'),(74,'2024-03-17 11:31:19','4444444444','设备名称4','file/shiyanshebeiTupian4.jpg,file/shiyanshebeiTupian5.jpg,file/shiyanshebeiTupian6.jpg','型号4','用途4','位置4','使用中','设备详情4'),(75,'2024-03-17 11:31:19','5555555555','设备名称5','file/shiyanshebeiTupian5.jpg,file/shiyanshebeiTupian6.jpg,file/shiyanshebeiTupian7.jpg','型号5','用途5','位置5','使用中','设备详情5'),(76,'2024-03-17 11:31:19','6666666666','设备名称6','file/shiyanshebeiTupian6.jpg,file/shiyanshebeiTupian7.jpg,file/shiyanshebeiTupian8.jpg','型号6','用途6','位置6','使用中','设备详情6');
/*!40000 ALTER TABLE `shiyanshebei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shiyanshuju`
--

DROP TABLE IF EXISTS `shiyanshuju`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shiyanshuju` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shiyanmingcheng` varchar(200) DEFAULT NULL COMMENT '实验名称',
  `shiyanriqi` datetime DEFAULT NULL COMMENT '实验日期',
  `keyanzhanghao` varchar(200) DEFAULT NULL COMMENT '科研账号',
  `keyanrenyuanxingming` varchar(200) DEFAULT NULL COMMENT '科研人员姓名',
  `shujuleixing` varchar(200) DEFAULT NULL COMMENT '数据类型',
  `shujudanwei` varchar(200) DEFAULT NULL COMMENT '数据单位',
  `yangpinmingcheng` varchar(200) DEFAULT NULL COMMENT '样品名称',
  `yuanshishuju` varchar(200) DEFAULT NULL COMMENT '原始数据',
  `chulishuju` varchar(200) DEFAULT NULL COMMENT '处理数据',
  `wuchafanwei` varchar(200) DEFAULT NULL COMMENT '误差范围',
  `shujuzhushi` varchar(200) DEFAULT NULL COMMENT '数据注释',
  `shiyantiaojian` varchar(200) DEFAULT NULL COMMENT '实验条件',
  `jielun` varchar(200) DEFAULT NULL COMMENT '结论',
  `shiyanzhuangtai` varchar(200) DEFAULT NULL COMMENT '实验状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='实验数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shiyanshuju`
--

LOCK TABLES `shiyanshuju` WRITE;
/*!40000 ALTER TABLE `shiyanshuju` DISABLE KEYS */;
INSERT INTO `shiyanshuju` VALUES (61,'2024-03-17 11:31:19','实验名称1','2024-03-17 19:31:19','科研账号1','科研人员姓名1','数据类型1','数据单位1','样品名称1','原始数据1','处理数据1','误差范围1','数据注释1','实验条件1','结论1','已结束'),(62,'2024-03-17 11:31:19','实验名称2','2024-03-17 19:31:19','科研账号2','科研人员姓名2','数据类型2','数据单位2','样品名称2','原始数据2','处理数据2','误差范围2','数据注释2','实验条件2','结论2','已结束'),(63,'2024-03-17 11:31:19','实验名称3','2024-03-17 19:31:19','科研账号3','科研人员姓名3','数据类型3','数据单位3','样品名称3','原始数据3','处理数据3','误差范围3','数据注释3','实验条件3','结论3','已结束'),(64,'2024-03-17 11:31:19','实验名称4','2024-03-17 19:31:19','科研账号4','科研人员姓名4','数据类型4','数据单位4','样品名称4','原始数据4','处理数据4','误差范围4','数据注释4','实验条件4','结论4','已结束'),(65,'2024-03-17 11:31:19','实验名称5','2024-03-17 19:31:19','科研账号5','科研人员姓名5','数据类型5','数据单位5','样品名称5','原始数据5','处理数据5','误差范围5','数据注释5','实验条件5','结论5','已结束'),(66,'2024-03-17 11:31:19','实验名称6','2024-03-17 19:31:19','科研账号6','科研人员姓名6','数据类型6','数据单位6','样品名称6','原始数据6','处理数据6','误差范围6','数据注释6','实验条件6','结论6','已结束');
/*!40000 ALTER TABLE `shiyanshuju` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-03-17 11:31:19','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weihurenyuan`
--

DROP TABLE IF EXISTS `weihurenyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weihurenyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `weihuzhanghao` varchar(200) NOT NULL COMMENT '维护账号',
  `weihumima` varchar(200) NOT NULL COMMENT '维护密码',
  `weihurenxingming` varchar(200) NOT NULL COMMENT '维护人姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `weihuzhanghao` (`weihuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='维护人员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weihurenyuan`
--

LOCK TABLES `weihurenyuan` WRITE;
/*!40000 ALTER TABLE `weihurenyuan` DISABLE KEYS */;
INSERT INTO `weihurenyuan` VALUES (41,'2024-03-17 11:31:19','维护账号1','123456','维护人姓名1','file/weihurenyuanTouxiang1.jpg','男','19819881111'),(42,'2024-03-17 11:31:19','维护账号2','123456','维护人姓名2','file/weihurenyuanTouxiang2.jpg','男','19819881112'),(43,'2024-03-17 11:31:19','维护账号3','123456','维护人姓名3','file/weihurenyuanTouxiang3.jpg','男','19819881113'),(44,'2024-03-17 11:31:19','维护账号4','123456','维护人姓名4','file/weihurenyuanTouxiang4.jpg','男','19819881114'),(45,'2024-03-17 11:31:19','维护账号5','123456','维护人姓名5','file/weihurenyuanTouxiang5.jpg','男','19819881115'),(46,'2024-03-17 11:31:19','维护账号6','123456','维护人姓名6','file/weihurenyuanTouxiang6.jpg','男','19819881116');
/*!40000 ALTER TABLE `weihurenyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weihurichenganpai`
--

DROP TABLE IF EXISTS `weihurichenganpai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weihurichenganpai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shebeimingcheng` varchar(200) NOT NULL COMMENT '设备名称',
  `shebeibianhao` varchar(200) DEFAULT NULL COMMENT '设备编号',
  `xinghao` varchar(200) NOT NULL COMMENT '型号',
  `weihushijian` date NOT NULL COMMENT '维护时间',
  `dengjishijian` datetime DEFAULT NULL COMMENT '登记时间',
  `weihuzhanghao` varchar(200) DEFAULT NULL COMMENT '维护账号',
  `weihurenxingming` varchar(200) DEFAULT NULL COMMENT '维护人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='维护日程安排';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weihurichenganpai`
--

LOCK TABLES `weihurichenganpai` WRITE;
/*!40000 ALTER TABLE `weihurichenganpai` DISABLE KEYS */;
INSERT INTO `weihurichenganpai` VALUES (91,'2024-03-17 11:31:19','设备名称1','设备编号1','型号1','2024-03-17','2024-03-17 19:31:19','维护账号1','维护人姓名1'),(92,'2024-03-17 11:31:19','设备名称2','设备编号2','型号2','2024-03-17','2024-03-17 19:31:19','维护账号2','维护人姓名2'),(93,'2024-03-17 11:31:19','设备名称3','设备编号3','型号3','2024-03-17','2024-03-17 19:31:19','维护账号3','维护人姓名3'),(94,'2024-03-17 11:31:19','设备名称4','设备编号4','型号4','2024-03-17','2024-03-17 19:31:19','维护账号4','维护人姓名4'),(95,'2024-03-17 11:31:19','设备名称5','设备编号5','型号5','2024-03-17','2024-03-17 19:31:19','维护账号5','维护人姓名5'),(96,'2024-03-17 11:31:19','设备名称6','设备编号6','型号6','2024-03-17','2024-03-17 19:31:19','维护账号6','维护人姓名6');
/*!40000 ALTER TABLE `weihurichenganpai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yangpinxinxi`
--

DROP TABLE IF EXISTS `yangpinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yangpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yangpinbianhao` varchar(200) DEFAULT NULL COMMENT '样品编号',
  `yangpinmingcheng` varchar(200) DEFAULT NULL COMMENT '样品名称',
  `yangpinlaiyuan` varchar(200) DEFAULT NULL COMMENT '样品来源',
  `yangpinleixing` varchar(200) DEFAULT NULL COMMENT '样品类型',
  `caijishijian` datetime DEFAULT NULL COMMENT '采集时间',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `tupian` longtext COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yangpinbianhao` (`yangpinbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='样品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yangpinxinxi`
--

LOCK TABLES `yangpinxinxi` WRITE;
/*!40000 ALTER TABLE `yangpinxinxi` DISABLE KEYS */;
INSERT INTO `yangpinxinxi` VALUES (51,'2024-03-17 11:31:19','1111111111','样品名称1','样品来源1','样品类型1','2024-03-17 19:31:19',1,'file/yangpinxinxiTupian1.jpg,file/yangpinxinxiTupian2.jpg,file/yangpinxinxiTupian3.jpg'),(52,'2024-03-17 11:31:19','2222222222','样品名称2','样品来源2','样品类型2','2024-03-17 19:31:19',2,'file/yangpinxinxiTupian2.jpg,file/yangpinxinxiTupian3.jpg,file/yangpinxinxiTupian4.jpg'),(53,'2024-03-17 11:31:19','3333333333','样品名称3','样品来源3','样品类型3','2024-03-17 19:31:19',3,'file/yangpinxinxiTupian3.jpg,file/yangpinxinxiTupian4.jpg,file/yangpinxinxiTupian5.jpg'),(54,'2024-03-17 11:31:19','4444444444','样品名称4','样品来源4','样品类型4','2024-03-17 19:31:19',4,'file/yangpinxinxiTupian4.jpg,file/yangpinxinxiTupian5.jpg,file/yangpinxinxiTupian6.jpg'),(55,'2024-03-17 11:31:19','5555555555','样品名称5','样品来源5','样品类型5','2024-03-17 19:31:19',5,'file/yangpinxinxiTupian5.jpg,file/yangpinxinxiTupian6.jpg,file/yangpinxinxiTupian7.jpg'),(56,'2024-03-17 11:31:19','6666666666','样品名称6','样品来源6','样品类型6','2024-03-17 19:31:19',6,'file/yangpinxinxiTupian6.jpg,file/yangpinxinxiTupian7.jpg,file/yangpinxinxiTupian8.jpg');
/*!40000 ALTER TABLE `yangpinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yusuanyuzijin`
--

DROP TABLE IF EXISTS `yusuanyuzijin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yusuanyuzijin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shouzhileibie` varchar(200) DEFAULT NULL COMMENT '收支类别',
  `jine` double DEFAULT NULL COMMENT '金额',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `zijinquxiang` varchar(200) DEFAULT NULL COMMENT '资金去向',
  `xiangmumingcheng` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `yusuan` double DEFAULT NULL COMMENT '预算',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='预算与资金';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yusuanyuzijin`
--

LOCK TABLES `yusuanyuzijin` WRITE;
/*!40000 ALTER TABLE `yusuanyuzijin` DISABLE KEYS */;
INSERT INTO `yusuanyuzijin` VALUES (121,'2024-03-17 11:31:19','收支类别1',1,'2024-03-17','资金去向1','项目名称1','备注1',1),(122,'2024-03-17 11:31:19','收支类别2',2,'2024-03-17','资金去向2','项目名称2','备注2',2),(123,'2024-03-17 11:31:19','收支类别3',3,'2024-03-17','资金去向3','项目名称3','备注3',3),(124,'2024-03-17 11:31:19','收支类别4',4,'2024-03-17','资金去向4','项目名称4','备注4',4),(125,'2024-03-17 11:31:19','收支类别5',5,'2024-03-17','资金去向5','项目名称5','备注5',5),(126,'2024-03-17 11:31:19','收支类别6',6,'2024-03-17','资金去向6','项目名称6','备注6',6);
/*!40000 ALTER TABLE `yusuanyuzijin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 19:59:40
