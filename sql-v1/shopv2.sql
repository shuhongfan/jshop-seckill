-- MySQL dump 10.13  Distrib 5.7.25, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `shop`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

--
-- Table structure for table `alipay_config`
--

DROP TABLE IF EXISTS `alipay_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alipay_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) DEFAULT NULL COMMENT '编码',
  `format` varchar(255) DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '异步回调',
  `private_key` text COMMENT '私钥',
  `public_key` text COMMENT '公钥',
  `return_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付宝配置类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alipay_config`
--

LOCK TABLES `alipay_config` WRITE;
/*!40000 ALTER TABLE `alipay_config` DISABLE KEYS */;
INSERT INTO `alipay_config` VALUES (1,'2016091700532697','utf-8','JSON','https://openapi.alipaydev.com/gateway.do','http://api.auauz.net/api/aliPay/notify','MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB','http://api.auauz.net/api/aliPay/return','RSA2','2088102176044281');
/*!40000 ALTER TABLE `alipay_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
  `cid` varchar(255) DEFAULT '1' COMMENT '分类id',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `author` varchar(255) DEFAULT NULL COMMENT '文章作者',
  `image_input` varchar(255) NOT NULL COMMENT '文章图片',
  `synopsis` varchar(255) DEFAULT NULL COMMENT '文章简介',
  `content` text,
  `share_title` varchar(255) DEFAULT NULL COMMENT '文章分享标题',
  `share_synopsis` varchar(255) DEFAULT NULL COMMENT '文章分享简介',
  `visit` varchar(255) DEFAULT NULL COMMENT '浏览次数',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `url` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `add_time` varchar(255) DEFAULT NULL COMMENT '添加时间',
  `hide` tinyint(1) unsigned DEFAULT '0' COMMENT '是否隐藏',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员id',
  `mer_id` int(10) unsigned DEFAULT '0' COMMENT '商户id',
  `product_id` int(10) DEFAULT '0' COMMENT '产品关联id',
  `is_hot` tinyint(1) unsigned DEFAULT '0' COMMENT '是否热门(小程序)',
  `is_banner` tinyint(1) unsigned DEFAULT '0' COMMENT '是否轮播图(小程序)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (2,'','yshop1.3版本上线了','yshop','http://localhost:8000/file/pic/list_16-20200110120838173.png','yshop1.3版本上线了','<h3 data-v-01881cfc=\"\" style=\"text-align: center;\"><p>yshop1.3版本上线了</p></h3>','','','4',NULL,'',NULL,'2019-08-22 12:26',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `column_config`
--

DROP TABLE IF EXISTS `column_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `column_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `column_type` varchar(255) DEFAULT NULL,
  `dict_name` varchar(255) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `form_show` bit(1) DEFAULT NULL,
  `form_type` varchar(255) DEFAULT NULL,
  `key_type` varchar(255) DEFAULT NULL,
  `list_show` bit(1) DEFAULT NULL,
  `not_null` bit(1) DEFAULT NULL,
  `query_type` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `date_annotation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成字段信息存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `column_config`
--

LOCK TABLES `column_config` WRITE;
/*!40000 ALTER TABLE `column_config` DISABLE KEYS */;
INSERT INTO `column_config` VALUES (1,'gen_test','id','int',NULL,'auto_increment',_binary '\0',NULL,'PRI',_binary '\0',_binary '',NULL,'ID',NULL),(2,'gen_test','sex','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0','NotNull','性别',NULL),(3,'gen_test','create_time','datetime',NULL,'',_binary '\0',NULL,'',_binary '',_binary '\0','BetWeen','',NULL),(139,'users_roles','user_id','bigint',NULL,'',_binary '',NULL,'PRI',_binary '',_binary '',NULL,'用户ID',NULL),(140,'users_roles','role_id','bigint',NULL,'',_binary '',NULL,'PRI',_binary '',_binary '',NULL,'角色ID',NULL),(141,'user_avatar','id','bigint',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'',NULL),(142,'user_avatar','real_name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'真实文件名',NULL),(143,'user_avatar','path','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'路径',NULL),(144,'user_avatar','size','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'大小',NULL),(145,'user_avatar','create_time','datetime',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'创建时间',NULL),(146,'material_group','id','varchar',NULL,'',_binary '',NULL,'PRI',_binary '',_binary '',NULL,'PK',NULL),(147,'material_group','user_id','varchar',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'所属租户',NULL),(148,'material_group','del_flag','char',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'逻辑删除标记（0：显示；1：隐藏）',NULL),(149,'material_group','create_time','datetime',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'创建时间',NULL),(150,'material_group','update_time','timestamp',NULL,'on update CURRENT_TIMESTAMP',_binary '',NULL,'',_binary '',_binary '',NULL,'最后更新时间',NULL),(151,'material_group','create_id','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'创建者ID',NULL),(152,'material_group','name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'分组名',NULL),(153,'material','id','varchar',NULL,'',_binary '',NULL,'PRI',_binary '',_binary '',NULL,'PK',NULL),(154,'material','user_id','varchar',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'所属租户',NULL),(155,'material','del_flag','char',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'逻辑删除标记（0：显示；1：隐藏）',NULL),(156,'material','create_time','datetime',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'创建时间',NULL),(157,'material','update_time','timestamp',NULL,'on update CURRENT_TIMESTAMP',_binary '',NULL,'',_binary '',_binary '',NULL,'最后更新时间',NULL),(158,'material','create_id','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'创建者ID',NULL),(159,'material','type','char',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'类型1、图片；2、视频',NULL),(160,'material','group_id','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'分组ID',NULL),(161,'material','name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'素材名',NULL),(162,'material','url','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'素材链接',NULL),(163,'user','uid','int',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'用户id',NULL),(164,'user','username','varchar',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '\0',NULL,'用户账户(跟accout一样)',NULL),(165,'user','account','varchar',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'用户账号',NULL),(166,'user','password','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'用户密码（跟pwd）',NULL),(167,'user','pwd','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户密码',NULL),(168,'user','real_name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'真实姓名',NULL),(169,'user','birthday','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'生日',NULL),(170,'user','card_id','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'身份证号码',NULL),(171,'user','mark','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'用户备注',NULL),(172,'user','partner_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'合伙人id',NULL),(173,'user','group_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'用户分组id',NULL),(174,'user','nickname','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'用户昵称',NULL),(175,'user','avatar','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'用户头像',NULL),(176,'user','phone','char',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'手机号码',NULL),(177,'user','add_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'添加时间',NULL),(178,'user','add_ip','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'添加ip',NULL),(179,'user','last_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'最后一次登录时间',NULL),(180,'user','last_ip','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'最后一次登录ip',NULL),(181,'user','now_money','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户余额',NULL),(182,'user','brokerage_price','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'佣金金额',NULL),(183,'user','integral','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户剩余积分',NULL),(184,'user','sign_num','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'连续签到天数',NULL),(185,'user','status','tinyint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'1为正常，0为禁止',NULL),(186,'user','level','tinyint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'等级',NULL),(187,'user','spread_uid','int',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'推广元id',NULL),(188,'user','spread_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'推广员关联时间',NULL),(189,'user','user_type','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户类型',NULL),(190,'user','is_promoter','tinyint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'是否为推广员',NULL),(191,'user','pay_count','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'用户购买次数',NULL),(192,'user','spread_count','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'下级人数',NULL),(193,'user','clean_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'清理会员时间',NULL),(194,'user','addres','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'详细地址',NULL),(195,'user','adminid','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'管理员编号 ',NULL),(196,'user','login_type','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户登陆类型，h5,wechat,routine',NULL),(197,'wechat_media','id','int',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'微信视频音频id',NULL),(198,'wechat_media','type','varchar',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'回复类型',NULL),(199,'wechat_media','path','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'文件路径',NULL),(200,'wechat_media','media_id','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'微信服务器返回的id',NULL),(201,'wechat_media','url','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'地址',NULL),(202,'wechat_media','temporary','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'是否永久或者临时 0永久1临时',NULL),(203,'wechat_media','add_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'添加时间',NULL),(204,'store_order','id','int',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'订单ID',NULL),(205,'store_order','order_id','varchar',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'订单号',NULL),(206,'store_order','extend_order_id','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'额外订单号',NULL),(207,'store_order','uid','int',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'用户id',NULL),(208,'store_order','real_name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户姓名',NULL),(209,'store_order','user_phone','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户电话',NULL),(210,'store_order','user_address','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'详细地址',NULL),(211,'store_order','cart_id','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'购物车id',NULL),(212,'store_order','freight_price','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'运费金额',NULL),(213,'store_order','total_num','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'订单商品总数',NULL),(214,'store_order','total_price','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'订单总价',NULL),(215,'store_order','total_postage','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'邮费',NULL),(216,'store_order','pay_price','decimal',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'实际支付金额',NULL),(217,'store_order','pay_postage','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'支付邮费',NULL),(218,'store_order','deduction_price','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'抵扣金额',NULL),(219,'store_order','coupon_id','int',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'优惠券id',NULL),(220,'store_order','coupon_price','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'优惠券金额',NULL),(221,'store_order','paid','tinyint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'支付状态',NULL),(222,'store_order','pay_time','int',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '\0',NULL,'支付时间',NULL),(223,'store_order','pay_type','varchar',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'支付方式',NULL),(224,'store_order','add_time','int',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'创建时间',NULL),(225,'store_order','status','tinyint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：待评价；-1：已退款）',NULL),(226,'store_order','refund_status','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'0 未退款 1 申请中 2 已退款',NULL),(227,'store_order','refund_reason_wap_img','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'退款图片',NULL),(228,'store_order','refund_reason_wap_explain','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'退款用户说明',NULL),(229,'store_order','refund_reason_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'退款时间',NULL),(230,'store_order','refund_reason_wap','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'前台退款原因',NULL),(231,'store_order','refund_reason','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'不退款的理由',NULL),(232,'store_order','refund_price','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'退款金额',NULL),(233,'store_order','delivery_sn','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'快递公司编号',NULL),(234,'store_order','delivery_name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'快递名称/送货人姓名',NULL),(235,'store_order','delivery_type','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'发货类型',NULL),(236,'store_order','delivery_id','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'快递单号/手机号',NULL),(237,'store_order','gain_integral','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'消费赚取积分',NULL),(238,'store_order','use_integral','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'使用积分',NULL),(239,'store_order','back_integral','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'给用户退了多少积分',NULL),(240,'store_order','mark','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'备注',NULL),(241,'store_order','is_del','tinyint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'是否删除',NULL),(242,'store_order','unique','char',NULL,'',_binary '',NULL,'UNI',_binary '',_binary '',NULL,'唯一id(md5加密)类似id',NULL),(243,'store_order','remark','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'管理员备注',NULL),(244,'store_order','mer_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'商户ID',NULL),(245,'store_order','is_mer_check','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'',NULL),(246,'store_order','combination_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'拼团产品id0一般产品',NULL),(247,'store_order','pink_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'拼团id 0没有拼团',NULL),(248,'store_order','cost','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'成本价',NULL),(249,'store_order','seckill_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'秒杀产品ID',NULL),(250,'store_order','bargain_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'砍价id',NULL),(251,'store_order','verify_code','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'核销码',NULL),(252,'store_order','store_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'门店id',NULL),(253,'store_order','shipping_type','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'配送方式 1=快递 ，2=门店自提',NULL),(254,'store_order','is_channel','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'支付渠道(0微信公众号1微信小程序)',NULL),(255,'store_order','is_remind','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'',NULL),(256,'store_order','is_system_del','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'',NULL),(257,'user_recharge','id','int',NULL,'auto_increment',_binary '\0',NULL,'PRI',_binary '',_binary '\0',NULL,'',NULL),(258,'user_recharge','uid','int',NULL,'',_binary '\0',NULL,'MUL',_binary '\0',_binary '\0',NULL,'充值用户UID',NULL),(259,'user_recharge','order_id','varchar',NULL,'',_binary '\0',NULL,'UNI',_binary '',_binary '\0',NULL,'订单号',NULL),(260,'user_recharge','price','decimal',NULL,'',_binary '\0',NULL,'',_binary '',_binary '\0',NULL,'充值金额',NULL),(261,'user_recharge','recharge_type','varchar',NULL,'',_binary '\0',NULL,'MUL',_binary '',_binary '\0',NULL,'充值类型',NULL),(262,'user_recharge','paid','tinyint',NULL,'',_binary '\0',NULL,'MUL',_binary '',_binary '\0',NULL,'是否充值',NULL),(263,'user_recharge','pay_time','int',NULL,'',_binary '\0',NULL,'',_binary '',_binary '\0',NULL,'充值支付时间',NULL),(264,'user_recharge','add_time','int',NULL,'',_binary '\0',NULL,'',_binary '',_binary '\0',NULL,'充值时间',NULL),(265,'user_recharge','refund_price','decimal',NULL,'',_binary '\0',NULL,'',_binary '\0',_binary '\0',NULL,'退款金额',NULL),(266,'user_recharge','nickname','varchar',NULL,'',_binary '\0',NULL,'',_binary '',_binary '\0','Like','昵称',NULL),(267,'system_store','id','int',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'',NULL),(268,'system_store','name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'门店名称',NULL),(269,'system_store','introduction','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'简介',NULL),(270,'system_store','phone','char',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'手机号码',NULL),(271,'system_store','address','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'省市区',NULL),(272,'system_store','detailed_address','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'详细地址',NULL),(273,'system_store','image','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'门店logo',NULL),(274,'system_store','latitude','char',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'纬度',NULL),(275,'system_store','longitude','char',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'经度',NULL),(276,'system_store','valid_time','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'核销有效日期',NULL),(277,'system_store','day_time','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'每日营业开关时间',NULL),(278,'system_store','add_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'添加时间',NULL),(279,'system_store','is_show','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'是否显示',NULL),(280,'system_store','is_del','tinyint',NULL,'',_binary '',NULL,'',_binary '\0',_binary '',NULL,'是否删除',NULL),(281,'system_store_staff','id','int',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'',NULL),(282,'system_store_staff','uid','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'微信用户id',NULL),(283,'system_store_staff','avatar','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'店员头像',NULL),(284,'system_store_staff','store_id','int',NULL,'',_binary '','Select','',_binary '',_binary '',NULL,'门店id',NULL),(285,'system_store_staff','staff_name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '','Like','店员名称',NULL),(286,'system_store_staff','phone','char',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'手机号码',NULL),(287,'system_store_staff','verify_status','tinyint',NULL,'',_binary '','Radio','',_binary '',_binary '',NULL,'核销开关',NULL),(288,'system_store_staff','status','tinyint',NULL,'',_binary '','Radio','',_binary '',_binary '\0',NULL,'状态',NULL),(289,'system_store_staff','add_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'添加时间',NULL),(290,'system_store_staff','nickname','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '','Like','微信昵称',NULL),(291,'system_store_staff','store_name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'所属门店',NULL),(292,'wechat_user','uid','int',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'微信用户id',NULL),(293,'wechat_user','unionid','varchar',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '\0',NULL,'只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',NULL),(294,'wechat_user','openid','varchar',NULL,'',_binary '',NULL,'UNI',_binary '',_binary '\0',NULL,'用户的标识，对当前公众号唯一',NULL),(295,'wechat_user','routine_openid','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'小程序唯一身份ID',NULL),(296,'wechat_user','nickname','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户的昵称',NULL),(297,'wechat_user','headimgurl','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户头像',NULL),(298,'wechat_user','sex','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',NULL),(299,'wechat_user','city','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户所在城市',NULL),(300,'wechat_user','language','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户的语言，简体中文为zh_CN',NULL),(301,'wechat_user','province','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户所在省份',NULL),(302,'wechat_user','country','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户所在国家',NULL),(303,'wechat_user','remark','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',NULL),(304,'wechat_user','groupid','smallint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '\0',NULL,'用户所在的分组ID（兼容旧的用户分组接口）',NULL),(305,'wechat_user','tagid_list','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'用户被打上的标签ID列表',NULL),(306,'wechat_user','subscribe','tinyint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '\0',NULL,'用户是否订阅该公众号标识',NULL),(307,'wechat_user','subscribe_time','int',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '\0',NULL,'关注公众号时间',NULL),(308,'wechat_user','add_time','int',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '\0',NULL,'添加时间',NULL),(309,'wechat_user','stair','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'一级推荐人',NULL),(310,'wechat_user','second','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'二级推荐人',NULL),(311,'wechat_user','order_stair','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'一级推荐人订单',NULL),(312,'wechat_user','order_second','int',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'二级推荐人订单',NULL),(313,'wechat_user','now_money','decimal',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'佣金',NULL),(314,'wechat_user','session_key','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'小程序用户会话密匙',NULL),(315,'wechat_user','user_type','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '\0',NULL,'用户类型',NULL),(316,'express','id','mediumint',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'快递公司id',NULL),(317,'express','code','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'快递公司简称',NULL),(318,'express','name','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'快递公司全称',NULL),(319,'express','sort','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'排序',NULL),(320,'express','is_show','tinyint',NULL,'',_binary '',NULL,'MUL',_binary '',_binary '',NULL,'是否显示',NULL),(321,'user_level','id','int',NULL,'auto_increment',_binary '',NULL,'PRI',_binary '',_binary '\0',NULL,'',NULL),(322,'user_level','uid','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'用户uid',NULL),(323,'user_level','level_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'等级vip',NULL),(324,'user_level','grade','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'会员等级',NULL),(325,'user_level','valid_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'过期时间',NULL),(326,'user_level','is_forever','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'是否永久',NULL),(327,'user_level','mer_id','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'商户id',NULL),(328,'user_level','status','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'0:禁止,1:正常',NULL),(329,'user_level','mark','varchar',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'备注',NULL),(330,'user_level','remind','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'是否已通知',NULL),(331,'user_level','is_del','tinyint',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'是否删除,0=未删除,1=删除',NULL),(332,'user_level','add_time','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'添加时间',NULL),(333,'user_level','discount','int',NULL,'',_binary '',NULL,'',_binary '',_binary '',NULL,'享受折扣',NULL);
/*!40000 ALTER TABLE `column_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pid` bigint(20) NOT NULL COMMENT '上级部门',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'开课吧',0,_binary '','2019-03-01 12:07:37'),(2,'研发部',7,_binary '','2019-03-25 09:15:32'),(5,'教研部',7,_binary '','2019-03-25 09:20:44'),(6,'教学部',8,_binary '','2019-03-25 09:52:18'),(7,'北京分部',1,_binary '','2019-03-25 11:04:50'),(8,'后厂分部',1,_binary '','2019-03-25 11:04:53'),(11,'人事部',8,_binary '','2019-03-25 11:07:58'),(12,'7773',1,_binary '','2020-05-18 19:43:53');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict`
--

DROP TABLE IF EXISTS `dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '字典名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict`
--

LOCK TABLES `dict` WRITE;
/*!40000 ALTER TABLE `dict` DISABLE KEYS */;
INSERT INTO `dict` VALUES (1,'user_status','用户状态','2019-10-27 20:31:36'),(4,'dept_status','部门状态','2019-10-27 20:31:36'),(5,'job_status','岗位状态','2019-10-27 20:31:36'),(6,'33','3','2020-05-18 19:55:49');
/*!40000 ALTER TABLE `dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_detail`
--

DROP TABLE IF EXISTS `dict_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL COMMENT '字典标签',
  `value` varchar(255) NOT NULL COMMENT '字典值',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `dict_id` bigint(11) DEFAULT NULL COMMENT '字典id',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`) USING BTREE,
  CONSTRAINT `FK5tpkputc6d9nboxojdbgnpmyb` FOREIGN KEY (`dict_id`) REFERENCES `dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_detail`
--

LOCK TABLES `dict_detail` WRITE;
/*!40000 ALTER TABLE `dict_detail` DISABLE KEYS */;
INSERT INTO `dict_detail` VALUES (1,'激活','true','1',1,'2019-10-27 20:31:36'),(2,'禁用','false','2',1,NULL),(3,'启用','true','1',4,NULL),(4,'停用','false','2',4,'2019-10-27 20:31:36'),(5,'启用2','true','1',5,NULL),(6,'停用','false','2',5,'2019-10-27 20:31:36'),(7,'8','8','999',NULL,'2020-05-18 19:44:05'),(8,'99','999','999',NULL,'2020-05-18 19:44:31');
/*!40000 ALTER TABLE `dict_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_config`
--

DROP TABLE IF EXISTS `email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `from_user` varchar(255) DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) DEFAULT NULL COMMENT '密码',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `user` varchar(255) DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_config`
--

LOCK TABLES `email_config` WRITE;
/*!40000 ALTER TABLE `email_config` DISABLE KEYS */;
INSERT INTO `email_config` VALUES (1,'111@qq.com','111','111','111','1');
/*!40000 ALTER TABLE `email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `express`
--

DROP TABLE IF EXISTS `express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `express` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '快递公司id',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '快递公司简称',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '快递公司全称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='快递公司表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `express`
--

LOCK TABLES `express` WRITE;
/*!40000 ALTER TABLE `express` DISABLE KEYS */;
INSERT INTO `express` VALUES (426,'STO','申通快递',0,0),(427,'SF','顺丰速运',0,0),(428,'ZTO','中通快递',0,0),(429,'YTO','圆通速递2',0,0),(430,'555','555555',0,0),(431,'555','5555',0,0);
/*!40000 ALTER TABLE `express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `front_user`
--

DROP TABLE IF EXISTS `front_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `front_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL,
  `source_type` varchar(1) DEFAULT NULL COMMENT '会员来源：1:PC，2：H5，3：Android，4：IOS，5：WeChat',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `status` varchar(1) DEFAULT NULL COMMENT '使用状态（Y正常 N非正常）',
  `head_pic` varchar(150) NOT NULL COMMENT '头像地址',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `account_balance` decimal(10,0) DEFAULT NULL COMMENT '账户余额',
  `is_mobile_check` varchar(1) DEFAULT '0' COMMENT '手机是否验证 （0否  1是）',
  `is_email_check` varchar(1) DEFAULT '0' COMMENT '邮箱是否检测（0否  1是）',
  `sex` varchar(1) DEFAULT '0' COMMENT '性别，1男，2女',
  `user_level` int(11) DEFAULT NULL COMMENT '会员等级',
  `points` int(11) DEFAULT NULL COMMENT '积分',
  `experience_value` int(11) DEFAULT NULL COMMENT '经验值',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`,`head_pic`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `front_user`
--

LOCK TABLES `front_user` WRITE;
/*!40000 ALTER TABLE `front_user` DISABLE KEYS */;
INSERT INTO `front_user` VALUES (15,'jackhu','d8ff80cce9365929c6ccdd3a2bdcf0e9','17338118923',NULL,'2017-10-08 12:34:53','2019-06-19 15:24:01',NULL,NULL,'太白',NULL,'http://39.107.94.159/group1/M00/00/02/rBHN5l0J4wqAJ9p3AAICSgmCgRk703.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'hubin','d8ff80cce9365929c6ccdd3a2bdcf0e9','13288888888','ithubin@163.com','2020-06-09 18:47:31','2020-06-09 18:47:34','1',NULL,'黄官','1','http://sec.kaikeba.com/pic/xxx.jpg',NULL,NULL,'0','0','0',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `front_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_config`
--

DROP TABLE IF EXISTS `gen_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成器配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_config`
--

LOCK TABLES `gen_config` WRITE;
/*!40000 ALTER TABLE `gen_config` DISABLE KEYS */;
INSERT INTO `gen_config` VALUES (3,'gen_test','Zheng Jie',_binary '','eladmin-system','me.zhengjie.gen','E:\\workspace\\me\\front\\eladmin-web\\src\\views\\gen','E:\\workspace\\me\\front\\eladmin-web\\src\\api',NULL,'测试生成'),(4,'material_group','hupeng',_binary '\0','yshop-shop','co.kaikeba.modules.shop','E:\\output','E:\\output\\',NULL,'素材'),(5,'material','hupeng',_binary '\0','yshop-shop','co.kaikeba.modules.shop','E:\\output','E:\\output\\',NULL,'素材管理'),(6,'user','hupeng',_binary '\0','yshop-system','co.kaikeba.modules','aa','aa\\',NULL,'用户'),(7,'wechat_media','hupeng',_binary '\0','yshop-system','co.kaikeba.modules','E:\\book\\img','E:\\book\\img\\',NULL,'ceshi'),(8,'user_recharge','hupeng',_binary '\0','yshop-shop','co.kaikeba.modules.shop','E:\\java\\shop-private\\yshop-web\\src\\views\\shop\\recharge','E:\\java\\yxshop-private\\yshop-web\\src\\api','','充值管理'),(9,'system_store','hupeng',_binary '\0','yshop-shop','co.kaikeba.modules.shop','E:\\java\\yxshop-private\\yshop-web\\src\\views\\shop\\store','E:\\java\\yxshop-private\\yshop-web\\src\\api',NULL,'门店'),(10,'system_store_staff','hupeng',_binary '','yshop-shop','co.kaikeba.modules.shop','E:\\java\\yxshop-private\\yshop-web\\src\\views\\shop\\storestaff','E:\\java\\yxshop-private\\yshop-web\\src\\api',NULL,'门店店员');
/*!40000 ALTER TABLE `gen_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_test`
--

DROP TABLE IF EXISTS `gen_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(255) DEFAULT NULL COMMENT '性别',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成测试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_test`
--

LOCK TABLES `gen_test` WRITE;
/*!40000 ALTER TABLE `gen_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `sort` bigint(20) NOT NULL COMMENT '岗位排序',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKmvhj0rogastlctflsxf1d6k3i` (`dept_id`) USING BTREE,
  CONSTRAINT `FKmvhj0rogastlctflsxf1d6k3i` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (8,'人事专员',_binary '',3,11,'2019-03-29 14:52:28'),(10,'产品经理',_binary '',4,2,'2019-03-29 14:55:51'),(11,'全栈开发2',_binary '',2,2,'2019-03-31 13:39:30'),(12,'软件测试',_binary '',5,2,'2019-03-31 13:39:43');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_storage`
--

DROP TABLE IF EXISTS `local_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_storage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `size` varchar(100) DEFAULT NULL COMMENT '大小',
  `operate` varchar(255) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='本地存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_storage`
--

LOCK TABLES `local_storage` WRITE;
/*!40000 ALTER TABLE `local_storage` DISABLE KEYS */;
INSERT INTO `local_storage` VALUES (1,'list_30-20200107120524671.png','list_30','png','E:\\yshop\\file\\图片\\list_30-20200107120524671.png','图片','28.57KB   ','admin','2020-01-07 12:05:25'),(2,'list_34-20200109071140374.png','list_34','png','E:\\yshop\\file\\图片\\list_34-20200109071140374.png','图片','27.05KB   ','admin','2020-01-09 19:11:40'),(3,'list_22-20200109072256534.png','list_22','png','E:\\yshop\\file\\pic\\list_22-20200109072256534.png','pic','28.23KB   ','admin','2020-01-09 19:22:57'),(4,'list_32-20200109093407741.png','list_32','png','E:\\yshop\\file\\pic\\list_32-20200109093407741.png','pic','27.65KB   ','admin','2020-01-09 21:34:08'),(5,'list_32-20200109094223500.png','list_32','png','E:\\yshop\\file\\pic\\list_32-20200109094223500.png','pic','27.65KB   ','admin','2020-01-09 21:42:24'),(6,'list_32-20200109094413459.png','list_32','png','E:\\yshop\\file\\pic\\list_32-20200109094413459.png','pic','27.65KB   ','admin','2020-01-09 21:44:13'),(7,'list_32-20200109094652138.png','list_32','png','E:\\yshop\\file\\pic\\list_32-20200109094652138.png','pic','27.65KB   ','admin','2020-01-09 21:46:52'),(8,'list_34-20200109095146476.png','list_34','png','E:\\yshop\\file\\pic\\list_34-20200109095146476.png','pic','27.05KB   ','admin','2020-01-09 21:51:47'),(9,'list_32-20200109095700685.png','list_32','png','E:\\yshop\\file\\pic\\list_32-20200109095700685.png','pic','27.65KB   ','admin','2020-01-09 21:57:01'),(10,'list_20-20200109095936988.png','list_20','png','E:\\yshop\\file\\pic\\list_20-20200109095936988.png','pic','22.92KB   ','admin','2020-01-09 21:59:37'),(11,'list_32-20200109100213309.png','list_32','png','E:\\yshop\\file\\pic\\list_32-20200109100213309.png','pic','27.65KB   ','admin','2020-01-09 22:02:13'),(12,'list_30-20200109104513493.png','list_30','png','E:\\yshop\\file\\pic\\list_30-20200109104513493.png','pic','28.57KB   ','admin','2020-01-09 22:45:13'),(13,'list_16-20200110120838173.png','list_16','png','E:\\yshop\\file\\pic\\list_16-20200110120838173.png','pic','28.93KB   ','admin','2020-01-10 12:08:38'),(14,'list_32-20200110035831202.png','list_32','png','E:\\yshop\\file\\pic\\list_32-20200110035831202.png','pic','27.65KB   ','admin','2020-01-10 15:58:31'),(15,'list_32-2020011004054091.png','list_32','png','E:\\yshop\\file\\pic\\list_32-2020011004054091.png','pic','27.65KB   ','admin','2020-01-10 16:05:40'),(16,'list_30-20200110053337209.png','list_30','png','E:\\yshop\\file\\pic\\list_30-20200110053337209.png','pic','28.57KB   ','admin','2020-01-10 17:33:37'),(17,'list_32-20200110064436937.png','list_32','png','E:\\yshop\\file\\pic\\list_32-20200110064436937.png','pic','27.65KB   ','admin','2020-01-10 18:44:37'),(18,'list_22-20200110104217508.png','list_22','png','E:\\yshop\\file\\pic\\list_22-20200110104217508.png','pic','28.23KB   ','admin','2020-01-10 22:42:18'),(19,'list_18-20200111051038569.png','list_18','png','E:\\yshop\\file\\pic\\list_18-20200111051038569.png','pic','29.62KB   ','15136175246','2020-01-11 17:10:39'),(20,'list_30-2020011105115469.png','list_30','png','E:\\yshop\\file\\pic\\list_30-2020011105115469.png','pic','28.57KB   ','15136175246','2020-01-11 17:11:54'),(21,'list_30-20200111051343335.png','list_30','png','E:\\yshop\\file\\pic\\list_30-20200111051343335.png','pic','28.57KB   ','15136175246','2020-01-11 17:13:43'),(22,'list_16-20200111051622984.png','list_16','png','E:\\yshop\\file\\pic\\list_16-20200111051622984.png','pic','28.93KB   ','15136175246','2020-01-11 17:16:23'),(23,'list_24-20200111051630227.png','list_24','png','E:\\yshop\\file\\pic\\list_24-20200111051630227.png','pic','27.31KB   ','15136175246','2020-01-11 17:16:30'),(24,'logo-20200131103905417.png','logo','png','E:\\yshop\\file\\pic\\logo-20200131103905417.png','pic','48.39KB   ','admin','2020-01-31 10:39:05'),(25,'avatar-20200131103928688.png','avatar','png','E:\\yshop\\file\\pic\\avatar-20200131103928688.png','pic','1.82KB   ','admin','2020-01-31 10:39:29'),(26,'list_13-2020013110394473.png','list_13','png','E:\\yshop\\file\\pic\\list_13-2020013110394473.png','pic','23.05KB   ','admin','2020-01-31 10:39:44'),(27,'list_18-2020013110394988.png','list_18','png','E:\\yshop\\file\\pic\\list_18-2020013110394988.png','pic','29.62KB   ','admin','2020-01-31 10:39:49'),(28,'list_22-20200131103952926.png','list_22','png','E:\\yshop\\file\\pic\\list_22-20200131103952926.png','pic','28.23KB   ','admin','2020-01-31 10:39:53'),(29,'list_26-20200131103956836.png','list_26','png','E:\\yshop\\file\\pic\\list_26-20200131103956836.png','pic','28.36KB   ','admin','2020-01-31 10:39:57'),(30,'list_28-20200131104001169.png','list_28','png','E:\\yshop\\file\\pic\\list_28-20200131104001169.png','pic','28.38KB   ','admin','2020-01-31 10:40:01'),(31,'list_16-20200207061544740.png','list_16','png','E:\\yshop\\file\\pic\\list_16-20200207061544740.png','pic','28.93KB   ','hupeng','2020-02-07 18:15:45'),(32,'list_30-2020020706162996.png','list_30','png','E:\\yshop\\file\\pic\\list_30-2020020706162996.png','pic','28.57KB   ','hupeng','2020-02-07 18:16:29'),(33,'list_16-20200207061714702.png','list_16','png','E:\\yshop\\file\\pic\\list_16-20200207061714702.png','pic','28.93KB   ','hupeng','2020-02-07 18:17:15'),(34,'list_18-20200207061743361.png','list_18','png','E:\\yshop\\file\\pic\\list_18-20200207061743361.png','pic','29.62KB   ','hupeng','2020-02-07 18:17:43'),(35,'list_30-20200207062920744.png','list_30','png','E:\\yshop\\file\\pic\\list_30-20200207062920744.png','pic','28.57KB   ','hupeng','2020-02-07 18:29:21'),(36,'05ea40b831858a8cf423aa709840507c-20200228083801500.png','05ea40b831858a8cf423aa709840507c','png','E:\\yshop\\file\\pic\\05ea40b831858a8cf423aa709840507c-20200228083801500.png','pic','5.19KB   ','admin','2020-02-28 20:38:02'),(37,'05ea40b831858a8cf423aa709840507c-20200311043711341.png','05ea40b831858a8cf423aa709840507c','png','E:\\yshop\\file\\pic\\05ea40b831858a8cf423aa709840507c-20200311043711341.png','pic','5.19KB   ','admin','2020-03-11 16:37:11'),(38,'秒杀-2020031104371672.png','秒杀','png','E:\\yshop\\file\\pic\\秒杀-2020031104371672.png','pic','6.07KB   ','admin','2020-03-11 16:37:16'),(39,'砍价-20200311043720679.png','砍价','png','E:\\yshop\\file\\pic\\砍价-20200311043720679.png','pic','6.13KB   ','admin','2020-03-11 16:37:21'),(40,'优惠券-20200311043724709.png','优惠券','png','E:\\yshop\\file\\pic\\优惠券-20200311043724709.png','pic','5.45KB   ','admin','2020-03-11 16:37:25'),(41,'资讯-20200311043727918.png','资讯','png','E:\\yshop\\file\\pic\\资讯-20200311043727918.png','pic','5.19KB   ','admin','2020-03-11 16:37:28'),(42,'list_16-20200322071324803.png','list_16','png','E:\\yshop\\file\\pic\\list_16-20200322071324803.png','pic','28.93KB   ','admin','2020-03-22 19:13:25'),(43,'list_22-20200322071348844.png','list_22','png','E:\\yshop\\file\\pic\\list_22-20200322071348844.png','pic','28.23KB   ','admin','2020-03-22 19:13:49'),(44,'list_34-2020032207154023.png','list_34','png','E:\\yshop\\file\\pic\\list_34-2020032207154023.png','pic','27.05KB   ','admin','2020-03-22 19:15:40'),(45,'钻石-20200328094531898.jpg','钻石','jpg','E:\\yshop\\file\\pic\\钻石-20200328094531898.jpg','pic','32.42KB   ','admin','2020-03-28 21:45:32'),(46,'20200623192348809700.jpg','1592893166(1)','jpg','D:\\yshop\\file\\pic\\20200623192348809700.jpg','pic','8.83KB   ','admin','2020-06-23 19:23:49');
/*!40000 ALTER TABLE `local_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `log_type` varchar(255) DEFAULT '',
  `method` varchar(255) DEFAULT NULL,
  `params` text,
  `request_ip` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `type` int(1) DEFAULT '0',
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1262575380937429540 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1262575380937429525,'2020-07-16 18:18:50','查询数据配置',NULL,'INFO','com.jshop.modules.shop.rest.SystemGroupDataController.getSystemGroupDatas()','{ criteria: SystemGroupDataQueryCriteria(groupName=yshop_seckill_time) pageable: Page request [number: 0, size 20, sort: UNSORTED] }','10.20.32.236',98,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429526,'2020-07-16 18:18:54','查询数据配置',NULL,'INFO','com.jshop.modules.shop.rest.SystemGroupDataController.getSystemGroupDatas()','{ criteria: SystemGroupDataQueryCriteria(groupName=yshop_seckill_time) pageable: Page request [number: 0, size 20, sort: UNSORTED] }','10.20.32.236',434,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429527,'2020-07-16 18:18:55','查询商品',NULL,'INFO','com.jshop.modules.shop.rest.StoreProductController.getStoreProducts()','{ criteria: StoreProductQueryCriteria(storeName=null, isDel=0, isShow=0) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',326,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429528,'2020-07-16 18:18:55','查询商品',NULL,'INFO','com.jshop.modules.shop.rest.StoreProductController.getStoreProducts()','{ criteria: StoreProductQueryCriteria(storeName=null, isDel=1, isShow=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',1334,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429529,'2020-07-16 18:18:57','查询商品',NULL,'INFO','com.jshop.modules.shop.rest.StoreProductController.getStoreProducts()','{ criteria: StoreProductQueryCriteria(storeName=null, isDel=0, isShow=1) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',2994,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429530,'2020-07-16 18:19:19','发布',NULL,'INFO','com.jshop.modules.activity.rest.StoreSeckillController.update()','{ resources: StoreSeckill(id=29, productId=31, image=http://127.0.0.1:8000/file/pic/20200623192348809700.jpg, images=http://127.0.0.1:8000/file/pic/20200623192348809700.jpg, title=java架构师, info=11111, price=0.01, costPrice=111, otPrice=90, giveIntegral=0, sort=0, stock=100, stockCount=100, sales=0, unitName=节, postage=0, description=<p>11111111</p>, startTime=1595952000, stopTime=1595952000, addTime=1594894752, status=1, isPostage=0, isHot=0, isDel=0, num=1, isShow=1, endTimeDate=2020-07-29 00:00:00.0, startTimeDate=2020-07-29 00:00:00.0, timeId=238) }','10.20.32.236',7110,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429531,'2020-07-16 18:19:20','查询商品',NULL,'INFO','com.jshop.modules.shop.rest.StoreProductController.getStoreProducts()','{ criteria: StoreProductQueryCriteria(storeName=null, isDel=0, isShow=1) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',218,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429532,'2020-07-16 18:25:29','查询数据配置',NULL,'INFO','com.jshop.modules.shop.rest.SystemGroupDataController.getSystemGroupDatas()','{ criteria: SystemGroupDataQueryCriteria(groupName=yshop_seckill_time) pageable: Page request [number: 0, size 20, sort: UNSORTED] }','10.20.32.236',161,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429533,'2020-07-16 18:25:29','查询商品',NULL,'INFO','com.jshop.modules.shop.rest.StoreProductController.getStoreProducts()','{ criteria: StoreProductQueryCriteria(storeName=null, isDel=0, isShow=0) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',101,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429534,'2020-07-16 18:25:30','查询商品',NULL,'INFO','com.jshop.modules.shop.rest.StoreProductController.getStoreProducts()','{ criteria: StoreProductQueryCriteria(storeName=null, isDel=0, isShow=1) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',370,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429535,'2020-07-16 18:25:30','查询商品',NULL,'INFO','com.jshop.modules.shop.rest.StoreProductController.getStoreProducts()','{ criteria: StoreProductQueryCriteria(storeName=null, isDel=1, isShow=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',420,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429536,'2020-07-16 18:25:30','查询数据配置',NULL,'INFO','com.jshop.modules.shop.rest.SystemGroupDataController.getSystemGroupDatas()','{ criteria: SystemGroupDataQueryCriteria(groupName=yshop_seckill_time) pageable: Page request [number: 0, size 20, sort: UNSORTED] }','10.20.32.236',149,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429537,'2020-07-16 18:25:30','列表',NULL,'INFO','com.jshop.modules.activity.rest.StoreSeckillController.getStoreSeckills()','{ criteria: StoreSeckillQueryCriteria(title=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',148,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429538,'2020-07-16 18:26:15','删除',NULL,'INFO','com.jshop.modules.activity.rest.StoreSeckillController.delete()','{ id: 29 }','10.20.32.236',711,'admin',' 局域网IP',NULL,0,NULL),(1262575380937429539,'2020-07-16 18:26:16','列表',NULL,'INFO','com.jshop.modules.activity.rest.StoreSeckillController.getStoreSeckills()','{ criteria: StoreSeckillQueryCriteria(title=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }','10.20.32.236',986,'admin',' 局域网IP',NULL,0,NULL);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'PK',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `create_time` datetime COMMENT '创建时间',
  `create_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建者ID',
  `type` char(2) COLLATE utf8mb4_bin NOT NULL COMMENT '类型1、图片；2、视频',
  `group_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分组ID',
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '素材名',
  `url` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '素材链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='素材库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES ('19169f03bbcc9d2a303724571d6f9a0c','0','2020-06-23 19:23:50','admin','1',NULL,'1592893166(1).jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_group`
--

DROP TABLE IF EXISTS `material_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_group` (
  `id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'PK',
  `del_flag` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `create_time` datetime COMMENT '创建时间',
  `create_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建者ID',
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '分组名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='素材分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_group`
--

LOCK TABLES `material_group` WRITE;
/*!40000 ALTER TABLE `material_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `pid` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `sort` bigint(20) NOT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '是否隐藏',
  `component_name` varchar(20) DEFAULT '-' COMMENT '组件名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKqcf9gem97gqa5qjm4d3elcqt5` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,_binary '\0','系统管理',NULL,0,99,'system','system',_binary '\0',_binary '\0',NULL,'2018-12-18 15:11:29',NULL,NULL),(2,_binary '\0','用户管理','system/user/index',1,2,'peoples','user',_binary '\0',_binary '\0','User','2018-12-18 15:14:44',NULL,1),(3,_binary '\0','角色管理','system/role/index',1,3,'role','role',_binary '\0',_binary '\0','Role','2018-12-18 15:16:07',NULL,1),(5,_binary '\0','菜单管理','system/menu/index',1,5,'menu','menu',_binary '\0',_binary '\0','Menu','2018-12-18 15:17:28','admin,menu:list,roles:list',1),(6,_binary '\0','系统监控',NULL,0,100,'monitor','monitor',_binary '\0',_binary '\0',NULL,'2018-12-18 15:17:48',NULL,1),(7,_binary '\0','操作日志','monitor/log/index',6,11,'log','logs',_binary '',_binary '\0','Log','2018-12-18 15:18:26',NULL,1),(9,_binary '\0','SQL监控','monitor/sql/index',6,14,'sqlMonitor','druid',_binary '\0',_binary '\0','Sql','2018-12-18 15:19:34',NULL,1),(14,_binary '\0','邮件工具','tools/email/index',36,24,'email','email',_binary '\0',_binary '\0','Email','2018-12-27 10:13:09',NULL,1),(18,_binary '\0','存储管理','tools/storage/index',36,23,'qiniu','storage',_binary '\0',_binary '\0','Storage','2018-12-31 11:12:15','storage:list',1),(19,_binary '\0','支付宝工具','tools/aliPay/index',36,27,'alipay','aliPay',_binary '\0',_binary '\0','AliPay','2018-12-31 14:52:38',NULL,1),(28,_binary '\0','定时任务','system/timing/index',36,21,'timing','timing',_binary '\0',_binary '\0','Timing','2019-01-07 20:34:40','timing:list',1),(30,_binary '\0','代码生成','generator/index',36,22,'dev','generator',_binary '\0',_binary '\0','GeneratorIndex','2019-01-11 15:45:55',NULL,1),(32,_binary '\0','异常日志','monitor/log/errorLog',6,12,'error','errorLog',_binary '\0',_binary '\0','ErrorLog','2019-01-13 13:49:03',NULL,1),(35,_binary '\0','部门管理','system/dept/index',1,6,'dept','dept',_binary '\0',_binary '\0','Dept','2019-03-25 09:46:00',NULL,1),(36,_binary '\0','系统工具','',0,101,'sys-tools','sys-tools',_binary '\0',_binary '\0',NULL,'2019-03-29 10:57:35',NULL,1),(37,_binary '\0','岗位管理','system/job/index',1,7,'Steve-Jobs','job',_binary '\0',_binary '\0','Job','2019-03-29 13:51:18',NULL,1),(39,_binary '\0','字典管理','system/dict/index',1,8,'dictionary','dict',_binary '\0',_binary '\0','Dict','2019-04-10 11:49:04',NULL,1),(40,_binary '\0','商品管理','',0,1,'shop','shop',_binary '',_binary '\0','','2019-10-03 17:40:19',NULL,1),(41,_binary '\0','商品分类','shop/cate/index',40,11,'icon','cate',_binary '\0',_binary '\0','Cate','2019-10-03 17:42:35','STORECATEGORY_SELECT',1),(45,_binary '\0','管理商品','shop/goods/tab',40,12,'develop','goods',_binary '',_binary '\0','Goods','2019-10-04 15:34:35','STOREPRODUCT_SELECT',1),(46,_binary '\0','会员管理','',0,2,'peoples','member',_binary '\0',_binary '\0','','2019-10-06 16:18:05',NULL,1),(47,_binary '\0','会员','shop/user/index',46,21,'peoples','member',_binary '\0',_binary '\0','Member','2019-10-06 16:20:17','USER_SELECT',1),(48,_binary '\0','微信管理','',0,3,'weixin','wechat',_binary '\0',_binary '','','2019-10-06 18:28:54',NULL,1),(49,_binary '\0','微信菜单','wechat/menu/index',48,31,'menu','wemenu',_binary '\0',_binary '\0','WeMenu','2019-10-06 18:31:06',NULL,1),(50,_binary '\0','图文管理','wechat/article/index',48,32,'article','wearticle',_binary '\0',_binary '\0','WeArticle','2019-10-07 17:33:45',NULL,1),(51,_binary '\0','自动回复','wechat/reply/index',48,33,'reply','wereply',_binary '\0',_binary '\0','Wereply','2019-10-10 09:58:31',NULL,1),(52,_binary '\0','公众号配置','wechat/config/index',48,34,'configure','weconfig',_binary '\0',_binary '\0','WeConfig','2019-10-10 15:52:24',NULL,1),(53,_binary '\0','订单管理','',0,4,'lock','order',_binary '\0',_binary '\0','','2019-10-14 14:35:18',NULL,1),(54,_binary '\0','订单','shop/order/index',53,41,'order','order',_binary '\0',_binary '\0','Order','2019-10-14 14:36:28','STOREORDER_SELECT',1),(55,_binary '\0','商城配置','',0,5,'configure','set',_binary '\0',_binary '\0','','2019-10-18 15:21:26',NULL,1),(56,_binary '\0','首页幻灯片','shop/set/index',55,51,'banner','homeBanner',_binary '\0',_binary '\0','HomeBanner','2019-10-18 15:24:30',NULL,1),(57,_binary '\0','首页导航按钮','shop/set/menu',55,52,'button','homeMenus',_binary '\0',_binary '\0','HomeMenus','2019-10-18 17:23:35',NULL,1),(59,_binary '\0','首页滚动新闻','shop/set/roll',55,54,'news','roll',_binary '\0',_binary '\0','Roll','2019-10-21 16:41:30',NULL,1),(60,_binary '\0','热门搜索','shop/set/hot',55,55,'search','hot',_binary '\0',_binary '\0','Hot','2019-10-26 18:21:54',NULL,1),(61,_binary '\0','个人中心菜单','shop/set/usermenu',55,56,'menu','userMenu',_binary '\0',_binary '\0','UserMenu','2019-10-26 18:42:18',NULL,1),(62,_binary '\0','评论管理','shop/reply/index',53,42,'comment','reply',_binary '\0',_binary '\0','Reply','2019-11-03 14:39:09','STOREPRODUCTREPLY_SELECT',1),(63,_binary '\0','营销管理','',0,6,'yingxiao','activity',_binary '\0',_binary '\0','','2019-11-09 14:17:42',NULL,1),(64,_binary '\0','优惠券制作','activity/coupon/index',63,61,'coupon','coupon',_binary '\0',_binary '\0','Coupon','2019-11-09 14:18:58','STORECOUPON_SELECT',1),(65,_binary '\0','已发布优惠券','activity/couponissue/index',63,62,'coupon2','couponissue',_binary '\0',_binary '\0','Couponissue','2019-11-09 14:20:35','STORECOUPONISSUE_SELECT',1),(66,_binary '\0','优惠券领取记录','activity/storecouponuser/index',63,63,'log','couponuser',_binary '\0',_binary '\0','Couponuser','2019-11-09 14:21:35',NULL,1),(67,_binary '\0','优惠券配置','activity/coupon/set',63,64,'log','couponset',_binary '\0',_binary '','Couponset','2019-11-09 14:22:17',NULL,1),(68,_binary '\0','积分配置','wechat/config/point',55,59,'configure','pointConfig',_binary '\0',_binary '\0','PointConfig','2019-11-10 18:45:55',NULL,1),(69,_binary '\0','分销管理','',0,7,'fenxiao','promoter',_binary '\0',_binary '\0','','2019-11-11 10:42:16',NULL,1),(70,_binary '\0','分销配置','wechat/config/promoter',69,71,'configure','promoterconfig',_binary '\0',_binary '\0','Promoterconfig','2019-11-11 10:48:37',NULL,1),(71,_binary '\0','分销员','shop/user/aindex',69,72,'user','agent',_binary '\0',_binary '\0','Agent','2019-11-13 18:32:00',NULL,1),(72,_binary '\0','提现管理','activity/extract/index',176,81,'tixian','extract',_binary '\0',_binary '\0','Extract','2019-11-14 10:49:39',NULL,1),(73,_binary '\0','拼团产品','activity/combination/index',63,64,'peoples','combination',_binary '\0',_binary '\0','Combination','2019-11-18 14:23:04','STORECOMBINATION_SELECT',1),(74,_binary '\0','拼团列表','activity/combinlist/index',63,65,'list','pink',_binary '\0',_binary '\0','Pink','2019-11-21 19:35:58',NULL,1),(75,_binary '\0','微信支付配置','wechat/config/pay',48,35,'wxpay','wxpayconfig',_binary '\0',_binary '\0','Wxpayconfig','2019-11-28 17:06:22',NULL,1),(76,_binary '\0','小程序配置','wechat/config/wxapp',48,36,'configure','wxapp',_binary '\0',_binary '\0','Wxapp','2019-11-29 15:13:46',NULL,1),(77,_binary '\0','会员等级','shop/userlevel/index',46,22,'dengji','userlevel',_binary '\0',_binary '\0','Userlevel','2019-12-04 16:35:41','SYSTEMUSERLEVEL_SELECT',1),(78,_binary '\0','等级任务','shop/usertask/index',46,23,'task manege','usertask',_binary '\0',_binary '\0','Usertask','2019-12-04 17:26:19','SYSTEMUSERTASK_SELECT',1),(79,_binary '\0','签到天数配置','shop/set/sign',55,57,'sign2','signday',_binary '\0',_binary '\0','Signday','2019-12-05 14:12:16',NULL,1),(80,_binary '\0','用户账单','shop/user/bill',46,24,'list','bill',_binary '\0',_binary '\0','Bill','2019-12-11 17:28:38',NULL,1),(81,_binary '\0','物流快递','shop/express/index',53,43,'express','express',_binary '\0',_binary '\0','Express','2019-12-12 16:36:00','EXPRESS_SELECT',1),(82,_binary '\0','微信模板消息','wechat/template/index',48,35,'anq','template',_binary '\0',_binary '\0','Template','2019-12-13 14:42:50',NULL,1),(83,_binary '\0','秒杀产品','activity/seckill/index',63,66,'seckill','seckill',_binary '\0',_binary '\0','Seckill','2019-12-16 13:06:29','STORESECKILL_SELECT',1),(84,_binary '\0','秒杀配置','shop/set/seckill',63,67,'configure','seckillconfig',_binary '\0',_binary '\0','Seckillconfig','2019-12-16 16:07:42',NULL,1),(86,_binary '\0','砍价产品','activity/bargain/index',63,956,'Sign','bargain',_binary '\0',_binary '\0','Bargain','2019-12-22 12:25:55','STOREBARGAIN_SELECT',1),(87,_binary '\0','生成配置','generator/config',36,33,'dev','generator/config/:tableName',_binary '',_binary '','GeneratorConfig','2019-11-17 20:08:56','',1),(88,_binary '\0','生成预览','generator/preview',36,999,'java','generator/preview/:tableName',_binary '',_binary '','Preview','2019-11-26 14:54:36',NULL,1),(116,_binary '\0','生成配置','generator/config',36,33,'dev','generator/config/:tableName',_binary '',_binary '','GeneratorConfig','2019-11-17 20:08:56','',1),(117,_binary '\0','图表库','components/Echarts',10,50,'chart','echarts',_binary '',_binary '\0','Echarts','2019-11-21 09:04:32','',1),(118,_binary '\0','新增',NULL,45,1,NULL,NULL,_binary '\0',_binary '\0',NULL,'2019-12-24 13:00:47','STOREPRODUCT_EDIT',2),(119,_binary '\0','修改',NULL,45,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2019-12-24 13:02:23','STOREPRODUCT_CREATE',2),(120,_binary '\0','删除',NULL,45,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2019-12-24 13:03:51','STOREPRODUCT_DELETE',2),(121,_binary '\0','在线用户','monitor/online/index',6,10,'Steve-Jobs','online',_binary '\0',_binary '\0','OnlineUser','2020-01-06 22:46:43',NULL,1),(122,_binary '\0','浏览记录','monitor/log/mlog',40,13,'log','viewlog',_binary '\0',_binary '\0','Viewlog','2020-01-07 13:17:21',NULL,1),(123,_binary '\0','后台接口文档','tools/swagger/index',36,31,'swagger','swagger2',_binary '\0',_binary '\0','Swagger','2020-01-07 18:05:52',NULL,1),(124,_binary '\0','在线会员','monitor/online/indext',46,25,'Steve-Jobs','onlinet',_binary '\0',_binary '\0','OnlineMember','2020-01-13 10:53:07',NULL,1),(125,_binary '\0','邮费配置','wechat/config/postage',55,58,'configure','postageConfig',_binary '\0',_binary '\0','PostageConfig','2020-02-13 15:38:24',NULL,1),(126,_binary '\0','编辑',NULL,54,1,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:05:28','STOREORDER_EDIT',2),(127,_binary '\0','用户新增',NULL,2,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:12:21','user:add',2),(128,_binary '\0','用户编辑',NULL,2,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:12:47','user:edit',2),(129,_binary '\0','用户删除',NULL,2,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:13:08','user:del',2),(130,_binary '\0','角色创建',NULL,3,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:13:49','roles:add',2),(131,_binary '\0','角色修改',NULL,3,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:14:11','roles:edit',2),(132,_binary '\0','角色删除',NULL,3,999,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:14:38','4',2),(133,_binary '\0','菜单新增',NULL,5,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:15:05','menu:add',2),(134,_binary '\0','菜单编辑',NULL,5,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:18:44','menu:edit',2),(135,_binary '\0','菜单删除',NULL,5,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:19:05','menu:del',2),(136,_binary '\0','部门新增',NULL,35,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:21:07','dept:add',2),(137,_binary '\0','部门编辑',NULL,35,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:21:33','dept:edit',2),(138,_binary '\0','部门删除',NULL,35,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:21:53','dept:del',2),(139,_binary '\0','岗位新增',NULL,37,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:29:04','job:add',2),(140,_binary '\0','岗位编辑',NULL,37,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:48:38','job:edit',2),(141,_binary '\0','岗位删除',NULL,37,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:49:00','job:del',2),(142,_binary '\0','字典新增',NULL,39,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:49:26','dict:add',2),(143,_binary '\0','字典编辑',NULL,39,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:49:39','dict:edit',2),(144,_binary '\0','字典删除',NULL,39,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:49:56','dict:del',2),(147,_binary '\0','上传文件',NULL,18,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:53:49','storage:add',2),(148,_binary '\0','文件编辑',NULL,18,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:54:06','storage:edit',2),(149,_binary '\0','文件删除',NULL,18,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:54:27','storage:del',2),(150,_binary '\0','任务新增',NULL,28,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:55:58','timing:add',2),(151,_binary '\0','任务编辑',NULL,28,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:56:54','timing:edit',2),(152,_binary '\0','任务删除',NULL,28,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 21:57:10','timing:del',2),(153,_binary '\0','新增分类',NULL,41,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:00:41','STORECATEGORY_CREATE',2),(154,_binary '\0','分类编辑',NULL,41,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:01:15','STORECATEGORY_EDIT',2),(155,_binary '\0','分类删除',NULL,41,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:01:37','STORECATEGORY_DELETE',2),(156,_binary '\0','修改会员',NULL,47,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:03:40','USER_EDIT',2),(157,_binary '\0','等级新增',NULL,77,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:06:55','SYSTEMUSERLEVEL_CREATE',2),(158,_binary '\0','等级编辑',NULL,77,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:08:03','SYSTEMUSERLEVEL_EDIT',2),(159,_binary '\0','等级删除',NULL,77,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:08:41','SYSTEMUSERLEVEL_DELETE',2),(160,_binary '\0','编辑任务',NULL,78,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:10:08','SYSTEMUSERTASK_EDIT',2),(161,_binary '\0','评论删除',NULL,62,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:14:22','STOREPRODUCTREPLY_DELETE',2),(162,_binary '\0','新增物流',NULL,81,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:15:33','EXPRESS_CREATE',2),(163,_binary '\0','编辑物流',NULL,81,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:15:53','EXPRESS_EDIT',2),(164,_binary '\0','删除物流',NULL,81,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:16:11','EXPRESS_DELETE',2),(165,_binary '\0','新增优惠券',NULL,64,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:18:32','STORECOUPON_CREATE',2),(166,_binary '\0','编辑优惠券',NULL,64,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:18:50','STORECOUPON_EDIT',2),(167,_binary '\0','删除优惠券',NULL,64,4,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:19:10','STORECOUPON_DELETE',2),(168,_binary '\0','编辑已发布',NULL,65,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:20:23','STORECOUPONISSUE_EDIT',2),(169,_binary '\0','删除已发布',NULL,65,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:20:42','STORECOUPONISSUE_DELETE',2),(170,_binary '\0','编辑拼团',NULL,73,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:24:15','STORECOMBINATION_EDIT',2),(171,_binary '\0','删除拼团',NULL,73,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:24:37','STORECOMBINATION_DELETE',2),(172,_binary '\0','编辑秒杀',NULL,83,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:25:23','STORESECKILL_EDIT',2),(173,_binary '\0','删除秒杀',NULL,83,3,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:25:41','STORESECKILL_DELETE',2),(174,_binary '\0','编辑砍价',NULL,86,2,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:26:20','STOREBARGAIN_EDIT',2),(175,_binary '\0','删除砍价',NULL,86,999,NULL,NULL,_binary '\0',_binary '\0',NULL,'2020-02-14 22:26:40','STOREBARGAIN_DELETE',2),(176,_binary '\0','财务管理',NULL,0,8,'price','price',_binary '\0',_binary '\0',NULL,'2020-03-02 22:30:23',NULL,1),(177,_binary '\0','充值管理','shop/recharge/index',176,82,'rec','recharge',_binary '\0',_binary '\0','Recharge','2020-03-02 23:05:26',NULL,1),(178,_binary '\0','门店管理',NULL,0,9,'store','store',_binary '\0',_binary '\0',NULL,'2020-03-03 17:27:53',NULL,1),(179,_binary '\0','门店列表','shop/store/index',178,92,'edit','storeinfo',_binary '\0',_binary '\0','Storeinfo','2020-03-03 17:29:09',NULL,1),(180,_binary '\0','门店配置','shop/store/set',178,91,'configure','storeset',_binary '\0',_binary '\0','Storeset','2020-03-04 13:09:54',NULL,1),(181,_binary '\0','核销订单','shop/order/indext',178,95,'order','ordert',_binary '\0',_binary '\0','Ordert','2020-03-05 17:04:12',NULL,1),(182,_binary '\0','充值金额配置','shop/set/recharge',55,60,'money','rechargeset',_binary '\0',_binary '\0','Rechargeset','2020-03-21 14:24:05',NULL,1),(183,_binary '\0','店员列表','shop/storestaff/index',178,94,'peoples','staff',_binary '\0',_binary '\0','Staff','2020-03-22 14:11:36',NULL,1),(184,_binary '\0','支付管理','shop/pay/index',176,83,'rec','pay',_binary '\0',_binary '\0','Recharge','2020-06-22 19:35:42',NULL,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_server`
--

DROP TABLE IF EXISTS `monitor_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_core` int(11) DEFAULT NULL COMMENT 'CPU内核数',
  `cpu_rate` double DEFAULT NULL COMMENT 'CPU使用率',
  `disk_total` double DEFAULT NULL COMMENT '磁盘总量',
  `disk_used` double DEFAULT NULL COMMENT '磁盘使用量',
  `mem_total` double DEFAULT NULL COMMENT '内存总数',
  `mem_used` double DEFAULT NULL COMMENT '内存使用量',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `port` int(11) DEFAULT NULL COMMENT '访问端口',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `swap_total` double DEFAULT NULL COMMENT '交换区总量',
  `swap_used` double DEFAULT NULL COMMENT '交换区使用量',
  `address` varchar(255) NOT NULL COMMENT '服务地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务监控';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_server`
--

LOCK TABLES `monitor_server` WRITE;
/*!40000 ALTER TABLE `monitor_server` DISABLE KEYS */;
INSERT INTO `monitor_server` VALUES (1,8,0.05924018,465.12402,91.66521,7.849415,7.6052284,'本地',8777,999,'0',14.599415,11.263367,'localhost');
/*!40000 ALTER TABLE `monitor_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '上传日期',
  `delete_url` varchar(255) DEFAULT NULL COMMENT '删除的URL',
  `filename` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `height` varchar(255) DEFAULT NULL COMMENT '图片高度',
  `size` varchar(255) DEFAULT NULL COMMENT '图片大小',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `width` varchar(255) DEFAULT NULL COMMENT '图片宽度',
  `md5code` varchar(255) DEFAULT NULL COMMENT '文件的MD5值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Sm.Ms图床';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiniu_config`
--

DROP TABLE IF EXISTS `qiniu_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qiniu_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `access_key` text COMMENT 'accessKey',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) NOT NULL COMMENT '外链域名',
  `secret_key` text COMMENT 'secretKey',
  `type` varchar(255) DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='七牛云配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiniu_config`
--

LOCK TABLES `qiniu_config` WRITE;
/*!40000 ALTER TABLE `qiniu_config` DISABLE KEYS */;
INSERT INTO `qiniu_config` VALUES (1,'1111114444','yixiang','https://image.dayouqiantu.cn','22222','公开','华东');
/*!40000 ALTER TABLE `qiniu_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiniu_content`
--

DROP TABLE IF EXISTS `qiniu_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qiniu_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型：私有或公开',
  `update_time` datetime DEFAULT NULL COMMENT '上传或同步的时间',
  `url` varchar(255) DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='七牛云文件存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiniu_content`
--

LOCK TABLES `qiniu_content` WRITE;
/*!40000 ALTER TABLE `qiniu_content` DISABLE KEYS */;
INSERT INTO `qiniu_content` VALUES (1,'yixiang','list_34','27.05KB   ','公开','2020-01-07 12:05:41','https://pic.dayouqiantu.cn/list_34.png','png'),(2,'yixiang','list_32','27.65KB   ','公开','2020-01-07 12:11:15','https://pic.dayouqiantu.cn/list_32.png','png'),(3,'yixiang','list_30','28.57KB   ','公开','2020-01-07 12:13:26','https://image.dayouqiantu.cn/list_30.png','png'),(4,'yixiang','list_34','27.05KB   ','公开','2020-01-07 12:32:15','https://image.dayouqiantu.cn/list_34.png','png'),(5,'yixiang','list_32','27.65KB   ','公开','2020-01-07 12:53:11','https://image.dayouqiantu.cn/list_32.png','png'),(6,'yixiang','list_34','27.05KB   ','公开','2020-01-07 13:05:55','https://image.dayouqiantu.cn/list_34.png','png'),(7,'yixiang','list_32','27.65KB   ','公开','2020-01-07 13:08:32','https://image.dayouqiantu.cn/list_32.png','png'),(8,'yixiang','list_22','28.23KB   ','公开','2020-01-07 13:08:38','https://image.dayouqiantu.cn/list_22.png','png'),(9,'yixiang','list_32','27.65KB   ','公开','2020-01-07 13:08:49','https://image.dayouqiantu.cn/list_32.png','png'),(10,'yixiang','list_34','27.05KB   ','公开','2020-01-10 12:02:24','https://image.dayouqiantu.cn/list_34.png','png'),(11,'yixiang','list_32','27.65KB   ','公开','2020-01-10 16:49:48','https://image.dayouqiantu.cn/list_32.png','png'),(12,'yixiang','list_20','22.92KB   ','公开','2020-01-10 22:43:47','https://image.dayouqiantu.cn/list_20.png','png'),(13,'yixiang','list_24','27.31KB   ','公开','2020-01-10 22:44:21','https://image.dayouqiantu.cn/list_24.png','png'),(14,'yixiang','list_28','28.38KB   ','公开','2020-01-11 17:06:00','https://image.dayouqiantu.cn/list_28.png','png');
/*!40000 ALTER TABLE `qiniu_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_job`
--

DROP TABLE IF EXISTS `quartz_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_job`
--

LOCK TABLES `quartz_job` WRITE;
/*!40000 ALTER TABLE `quartz_job` DISABLE KEYS */;
INSERT INTO `quartz_job` VALUES (1,'visitsTask','0 0 0 * * ?',_binary '\0','更新访客记录','run',NULL,'每日0点创建新的访客记录','2019-01-08 14:53:31'),(2,'testTask','0/5 * * * * ?',_binary '','测试1','run1','test','带参测试，多参使用json','2019-08-22 14:08:29'),(3,'testTask','0/5 * * * * ?',_binary '','测试43','run','44','不带参测试','2019-09-26 16:44:39');
/*!40000 ALTER TABLE `quartz_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_log`
--

DROP TABLE IF EXISTS `quartz_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baen_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `is_success` bit(1) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_log`
--

LOCK TABLES `quartz_log` WRITE;
/*!40000 ALTER TABLE `quartz_log` DISABLE KEYS */;
INSERT INTO `quartz_log` VALUES (1,'visitsTask','2020-01-10 00:00:00','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,160),(2,'visitsTask','2020-03-10 00:00:00','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,42),(3,'visitsTask','2020-04-02 00:00:00','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,60),(4,'visitsTask','2020-06-23 10:04:54','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,802),(5,'visitsTask','2020-06-24 00:00:02','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,1370),(6,'visitsTask','2020-07-02 10:16:08','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,2578),(7,'visitsTask','2020-07-03 10:04:46','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,2426),(8,'visitsTask','2020-07-15 10:09:43','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,653),(9,'visitsTask','2020-07-16 10:08:53','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,1489),(10,'visitsTask','2020-07-17 10:14:50','0 0 0 * * ?',NULL,_binary '','更新访客记录','run',NULL,1132);
/*!40000 ALTER TABLE `quartz_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `data_scope` varchar(255) DEFAULT NULL COMMENT '数据权限',
  `level` int(255) DEFAULT NULL COMMENT '角色级别',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `permission` varchar(255) DEFAULT NULL COMMENT '功能权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员','-','全部',1,'2018-11-23 11:04:37','admin'),(2,'普通用户','-','本级',2,'2018-11-23 13:09:06','common'),(3,'管理员2','222','全部',3,'2020-01-31 16:53:25','22');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_depts`
--

DROP TABLE IF EXISTS `roles_depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_depts` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`) USING BTREE,
  CONSTRAINT `FK7qg6itn5ajdoa9h9o78v9ksur` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `FKrg1ci4cxxfbja0sb0pddju7k` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色部门关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_depts`
--

LOCK TABLES `roles_depts` WRITE;
/*!40000 ALTER TABLE `roles_depts` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_depts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_menus`
--

DROP TABLE IF EXISTS `roles_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_menus` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`role_id`) USING BTREE,
  CONSTRAINT `FKo7wsmlrrxb2osfaoavp46rv2r` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `FKtag324maketmxffly3pdyh193` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色菜单关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_menus`
--

LOCK TABLES `roles_menus` WRITE;
/*!40000 ALTER TABLE `roles_menus` DISABLE KEYS */;
INSERT INTO `roles_menus` VALUES (1,1),(2,1),(3,1),(5,1),(6,1),(7,1),(9,1),(10,1),(11,1),(14,1),(15,1),(18,1),(19,1),(21,1),(22,1),(23,1),(24,1),(27,1),(28,1),(30,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(86,1),(87,1),(88,1),(116,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(1,2),(2,2),(3,2),(5,2),(6,2),(9,2),(10,2),(11,2),(14,2),(15,2),(18,2),(19,2),(21,2),(23,2),(24,2),(27,2),(28,2),(30,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(44,2),(45,2),(48,2),(49,2),(50,2),(53,2),(54,2),(77,2),(78,2),(79,2),(118,2),(119,2),(126,2),(154,2),(184,2);
/*!40000 ALTER TABLE `roles_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_bargain`
--

DROP TABLE IF EXISTS `store_bargain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_bargain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价产品ID',
  `product_id` int(11) unsigned NOT NULL COMMENT '关联产品ID',
  `title` varchar(255) NOT NULL COMMENT '砍价活动名称',
  `image` varchar(150) NOT NULL COMMENT '砍价活动图片',
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位名称',
  `stock` int(11) unsigned DEFAULT NULL COMMENT '库存',
  `sales` int(11) unsigned DEFAULT NULL COMMENT '销量',
  `images` varchar(2000) NOT NULL COMMENT '砍价产品轮播图',
  `start_time` int(11) unsigned NOT NULL COMMENT '砍价开启时间',
  `stop_time` int(11) unsigned NOT NULL COMMENT '砍价结束时间',
  `store_name` varchar(255) DEFAULT NULL COMMENT '砍价产品名称',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价金额',
  `min_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价商品最低价',
  `num` int(11) unsigned DEFAULT NULL COMMENT '每次购买的砍价产品数量',
  `bargain_max_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '用户每次砍价的最大金额',
  `bargain_min_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '用户每次砍价的最小金额',
  `bargain_num` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '用户每次砍价的次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)',
  `description` text COMMENT '砍价详情',
  `give_integral` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '反多少积分',
  `info` varchar(255) DEFAULT NULL COMMENT '砍价活动简介',
  `cost` decimal(8,2) unsigned DEFAULT NULL COMMENT '成本价',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐0不推荐1推荐',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1删除',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否包邮 0不包邮 1包邮',
  `postage` decimal(10,2) unsigned DEFAULT NULL COMMENT '邮费',
  `rule` text COMMENT '砍价规则',
  `look` int(11) unsigned DEFAULT '0' COMMENT '砍价产品浏览量',
  `share` int(11) unsigned DEFAULT '0' COMMENT '砍价产品分享量',
  `end_time_date` datetime NOT NULL,
  `start_time_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='砍价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_bargain`
--

LOCK TABLES `store_bargain` WRITE;
/*!40000 ALTER TABLE `store_bargain` DISABLE KEYS */;
INSERT INTO `store_bargain` VALUES (2,24,'砍价测试01','https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg','张',100,1,'https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg',1577090495,1608660000,'70gA4彩色打印复印',10.00,0.01,1,2.00,0.01,1,1,'<p style=\"text-align: center;\">7<strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: center;\"><img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width:100%;\"><strong><br></strong></p><p style=\"text-align: center;\"><br></p>',0.00,'70gA4彩色打印复印',0.50,0,0,0,1577090553,1,0.00,'<p>这里是规则</p>',90,2,'2020-12-23 02:00:00','2019-12-23 16:41:35'),(3,24,'砍价活动2','https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg','张',99,2,'https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg,http://localhost:8000/file/pic/05ea40b831858a8cf423aa709840507c-20200228083801500.png',1578412800,1603900800,'70gA4彩色打印复印',0.01,0.01,1,10.00,0.01,1,1,'<p style=\"text-align: center;\">7<strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: center;\"><img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width:100%;\"><strong><br></strong></p><p style=\"text-align: center;\"><br></p>',0.00,'70gA4彩色打印复印',0.50,0,0,0,1577101179,1,0.00,'<p>444444</p>',34,1,'2020-10-29 00:00:00','2020-01-08 00:00:00'),(4,28,'9999','http://localhost:8000/file/pic/资讯-20200311043727918.png','张',0,0,'http://localhost:8000/file/pic/钻石-20200328094531898.jpg',1589731200,1590768000,NULL,0.01,NULL,1,NULL,NULL,1,1,'<p>999999</p>',0.00,'333',0.00,0,0,0,1589799053,0,0.00,'<p>33333</p>',0,0,'2020-05-30 00:00:00','2020-05-18 00:00:00'),(5,28,'9999','http://localhost:8000/file/pic/资讯-20200311043727918.png','张',1,0,'http://localhost:8000/file/pic/钻石-20200328094531898.jpg',1589731200,1590595200,NULL,0.01,1.00,1,1.00,1.00,1,1,'<p>999999</p>',0.00,'',0.00,0,0,0,1589799708,0,0.00,'<p>7777</p>',0,0,'2020-05-28 00:00:00','2020-05-18 00:00:00'),(6,27,'9999','http://localhost:8000/file/pic/资讯-20200311043727918.png','9',2,0,'http://localhost:8000/file/pic/钻石-20200328094531898.jpg',1589855271,1590422400,NULL,0.01,1.00,1,1.00,1.00,1,1,'<p>999999</p>',0.00,'999',0.00,0,0,0,1589855299,0,0.00,'<p>666</p>',0,0,'2020-05-26 00:00:00','2020-05-19 10:27:51');
/*!40000 ALTER TABLE `store_bargain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_bargain_user`
--

DROP TABLE IF EXISTS `store_bargain_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_bargain_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户参与砍价表ID',
  `uid` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `bargain_id` int(11) unsigned DEFAULT NULL COMMENT '砍价产品id',
  `bargain_price_min` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价的最低价',
  `bargain_price` decimal(8,2) DEFAULT NULL COMMENT '砍价金额',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍掉的价格',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1参与中 2 活动结束参与失败 3活动结束参与成功',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '参与时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户参与砍价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_bargain_user`
--

LOCK TABLES `store_bargain_user` WRITE;
/*!40000 ALTER TABLE `store_bargain_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_bargain_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_bargain_user_help`
--

DROP TABLE IF EXISTS `store_bargain_user_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_bargain_user_help` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价用户帮助表ID',
  `uid` int(11) unsigned DEFAULT NULL COMMENT '帮助的用户id',
  `bargain_id` int(11) unsigned DEFAULT NULL COMMENT '砍价产品ID',
  `bargain_user_id` int(11) unsigned DEFAULT NULL COMMENT '用户参与砍价表id',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '帮助砍价多少金额',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='砍价用户帮助表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_bargain_user_help`
--

LOCK TABLES `store_bargain_user_help` WRITE;
/*!40000 ALTER TABLE `store_bargain_user_help` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_bargain_user_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cart`
--

DROP TABLE IF EXISTS `store_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_cart` (
  `id` bigint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `type` varchar(32) NOT NULL COMMENT '类型',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `product_attr_unique` varchar(50) NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为立即购买',
  `combination_id` int(11) unsigned DEFAULT '0' COMMENT '拼团id',
  `seckill_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀产品ID',
  `bargain_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '砍价id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`uid`) USING BTREE,
  KEY `goods_id` (`product_id`) USING BTREE,
  KEY `uid` (`uid`,`is_pay`) USING BTREE,
  KEY `uid_2` (`uid`,`is_del`) USING BTREE,
  KEY `uid_3` (`uid`,`is_new`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cart`
--

LOCK TABLES `store_cart` WRITE;
/*!40000 ALTER TABLE `store_cart` DISABLE KEYS */;
INSERT INTO `store_cart` VALUES (123,11,'product',19,'',2,1582885462,1,0,1,0,0,0),(124,12,'product',19,'',1,1582897654,0,0,1,0,0,0),(125,11,'product',19,'',2,1582970873,1,0,1,0,0,0),(126,11,'product',19,'',1,1582971001,1,0,1,0,0,0),(127,11,'product',19,'',1,1582971278,1,0,1,0,0,0),(128,11,'product',19,'',1,1582990627,1,0,1,0,0,0),(129,11,'product',19,'',1,1583330733,1,0,1,0,0,0),(130,11,'product',19,'',1,1583393646,1,0,1,0,0,0),(131,11,'product',19,'',1,1583394583,1,0,1,0,0,0),(132,11,'product',19,'',1,1583399181,1,0,1,0,0,0),(133,11,'product',19,'',1,1583403251,1,0,1,0,0,0),(134,11,'product',19,'',1,1583410813,1,0,1,0,0,0),(135,11,'product',19,'',1,1583416029,1,0,1,0,0,0),(136,11,'product',20,'2e51e5d2d86a44748f81cdd5bf7a51c0',1,1583422305,0,0,1,0,0,0),(137,11,'product',19,'',1,1583479387,1,0,1,0,0,0),(138,11,'product',19,'',1,1583486497,1,0,0,0,0,0),(139,11,'product',20,'2e51e5d2d86a44748f81cdd5bf7a51c0',1,1583486504,1,0,0,0,0,0),(140,11,'product',19,'',1,1584171669,1,0,1,0,0,0),(141,11,'product',20,'',1,1584175842,1,0,1,0,2,0),(142,11,'product',19,'',1,1584177295,1,0,1,0,0,0),(143,11,'product',24,'',1,1585051721,1,0,1,0,0,0),(144,11,'product',19,'',1,1585144729,0,0,0,0,0,0),(145,12,'product',24,'',1,1585224558,0,0,1,0,0,0),(146,11,'product',19,'',1,1585293362,1,0,1,0,0,0),(147,11,'product',19,'',1,1585385719,1,0,1,0,0,0),(148,11,'product',24,'',1,1585899825,1,0,1,0,0,0),(149,11,'product',24,'',1,1585900220,1,0,1,0,0,0),(150,11,'product',24,'',1,1585900404,1,0,1,0,0,0),(151,11,'product',24,'',1,1585900426,1,0,1,0,0,0),(152,11,'product',24,'',1,1585900444,1,0,1,0,0,0),(153,11,'product',24,'',1,1585900487,1,0,1,0,0,0),(154,11,'product',24,'',1,1585900506,1,0,1,0,0,0),(155,11,'product',24,'',1,1585901825,1,0,1,0,0,0),(156,11,'product',24,'',1,1585901980,1,0,1,0,0,0),(157,11,'product',24,'',1,1585907975,1,0,1,0,0,3),(158,11,'product',24,'',1,1586065022,1,0,1,0,1,0),(159,11,'product',19,'',1,1586065167,1,0,1,0,0,0),(160,11,'product',19,'',1,1586066223,0,0,1,2,0,0),(161,11,'product',19,'',1,1589803637,1,0,1,0,0,0),(162,11,'product',19,'',1,1589804627,1,0,1,0,0,0),(163,11,'product',19,'',1,1589804837,1,0,1,0,0,0);
/*!40000 ALTER TABLE `store_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_category` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(11) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) NOT NULL COMMENT '分类名称',
  `sort` mediumint(11) DEFAULT NULL COMMENT '排序',
  `pic` varchar(128) DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否推荐',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_base` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_category`
--

LOCK TABLES `store_category` WRITE;
/*!40000 ALTER TABLE `store_category` DISABLE KEYS */;
INSERT INTO `store_category` VALUES (1,0,'图文广告',1,'',1,1584876792,0),(2,1,'写真',1,'http://localhost:8000/file/pic/资讯-20200311043727918.png',1,1586244998,1),(3,1,'平面设计',1,'http://localhost:8000/file/pic/资讯-20200311043727918.png',1,1584945190,0),(5,1,'名片',1,'http://localhost:8000/file/pic/砍价-20200311043720679.png',1,1586245178,0),(6,0,'666',1,'',1,1589792698,0),(7,0,'9999',1,'',1,1589795680,0),(8,7,'8888',1,'http://localhost:8000/file/pic/钻石-20200328094531898.jpg',1,1589795706,0),(9,0,'课程',1,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg',1,1593517887,0);
/*!40000 ALTER TABLE `store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_combination`
--

DROP TABLE IF EXISTS `store_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_combination` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `mer_id` int(10) unsigned DEFAULT '0' COMMENT '商户id',
  `image` varchar(255) NOT NULL COMMENT '推荐图',
  `images` varchar(2000) NOT NULL COMMENT '轮播图',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `attr` varchar(255) DEFAULT NULL COMMENT '活动属性',
  `people` int(2) unsigned NOT NULL COMMENT '参团人数',
  `info` varchar(255) NOT NULL COMMENT '简介',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `stock` int(10) unsigned NOT NULL COMMENT '库存',
  `add_time` varchar(128) NOT NULL COMMENT '添加时间',
  `is_host` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐',
  `is_show` tinyint(1) unsigned NOT NULL COMMENT '产品状态',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `combination` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `mer_use` tinyint(1) unsigned DEFAULT NULL COMMENT '商户是否可用1可用0不可用',
  `is_postage` tinyint(1) unsigned NOT NULL COMMENT '是否包邮1是0否',
  `postage` decimal(10,2) unsigned NOT NULL COMMENT '邮费',
  `description` text NOT NULL COMMENT '拼团内容',
  `start_time` int(11) unsigned NOT NULL COMMENT '拼团开始时间',
  `stop_time` int(11) unsigned NOT NULL COMMENT '拼团结束时间',
  `effective_time` int(11) NOT NULL DEFAULT '0' COMMENT '拼团订单有效时间',
  `cost` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拼图产品成本',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `unit_name` varchar(32) NOT NULL DEFAULT '' COMMENT '单位名',
  `end_time_date` datetime NOT NULL,
  `start_time_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拼团产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_combination`
--

LOCK TABLES `store_combination` WRITE;
/*!40000 ALTER TABLE `store_combination` DISABLE KEYS */;
INSERT INTO `store_combination` VALUES (5,31,0,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','java架构师',NULL,2,'11111',100.00,0,0,100,'1594870194',0,1,0,1,NULL,0,0.00,'<p>11111111</p>',1594051200,1595260800,24,0,0,'节','2020-07-21 00:00:00','2020-07-07 00:00:00');
/*!40000 ALTER TABLE `store_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon`
--

DROP TABLE IF EXISTS `store_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券表ID',
  `title` varchar(64) NOT NULL COMMENT '优惠券名称',
  `integral` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券有效期限（单位：天）',
  `sort` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0：关闭，1：开启）',
  `add_time` int(11) unsigned NOT NULL COMMENT '兑换项目添加时间',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `coupon_time` (`coupon_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon`
--

LOCK TABLES `store_coupon` WRITE;
/*!40000 ALTER TABLE `store_coupon` DISABLE KEYS */;
INSERT INTO `store_coupon` VALUES (8,'开课吧',0,100.00,500.00,100,1,1,1593596180,0);
/*!40000 ALTER TABLE `store_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon_issue`
--

DROP TABLE IF EXISTS `store_coupon_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_coupon_issue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) DEFAULT '',
  `cid` int(10) DEFAULT NULL COMMENT '优惠券ID',
  `start_time` int(10) DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` int(10) DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(10) DEFAULT NULL COMMENT '优惠券领取数量',
  `remain_count` int(10) DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `is_permanent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否无限张数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) DEFAULT NULL COMMENT '优惠券添加时间',
  `end_time_date` datetime DEFAULT NULL,
  `start_time_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `start_time` (`start_time`,`end_time`) USING BTREE,
  KEY `remain_count` (`remain_count`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券前台领取表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon_issue`
--

LOCK TABLES `store_coupon_issue` WRITE;
/*!40000 ALTER TABLE `store_coupon_issue` DISABLE KEYS */;
INSERT INTO `store_coupon_issue` VALUES (16,'开课吧',8,1593532800,1596124800,100,95,1,1,0,1593596299,'2020-07-31 00:00:00','2020-07-01 00:00:00');
/*!40000 ALTER TABLE `store_coupon_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon_issue_user`
--

DROP TABLE IF EXISTS `store_coupon_issue_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_coupon_issue_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(10) DEFAULT NULL COMMENT '优惠券前台领取ID',
  `add_time` int(10) DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`issue_coupon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券前台用户领取记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon_issue_user`
--

LOCK TABLES `store_coupon_issue_user` WRITE;
/*!40000 ALTER TABLE `store_coupon_issue_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_coupon_issue_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon_user`
--

DROP TABLE IF EXISTS `store_coupon_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_coupon_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id',
  `cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '兑换的项目id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) NOT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠券的面值',
  `use_min_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低消费多少金额可用优惠券',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '优惠券创建时间',
  `end_time` int(11) unsigned DEFAULT NULL COMMENT '优惠券结束时间',
  `use_time` int(11) unsigned DEFAULT '0' COMMENT '使用时间',
  `type` varchar(32) NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `end_time` (`end_time`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_fail` (`is_fail`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券发放记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon_user`
--

LOCK TABLES `store_coupon_user` WRITE;
/*!40000 ALTER TABLE `store_coupon_user` DISABLE KEYS */;
INSERT INTO `store_coupon_user` VALUES (28,1,1001,'开课吧',100.00,500.00,NULL,NULL,NULL,'页面领取',0,0);
/*!40000 ALTER TABLE `store_coupon_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_id` varchar(32) NOT NULL COMMENT '订单号',
  `extend_order_id` varchar(32) DEFAULT NULL COMMENT '额外订单号',
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) NOT NULL COMMENT '详细地址',
  `cart_id` varchar(256) NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `freight_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `total_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单商品总数',
  `total_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `total_postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `pay_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `pay_postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付邮费',
  `deduction_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '抵扣金额',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `coupon_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_time` int(11) unsigned DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(32) NOT NULL COMMENT '支付方式',
  `add_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：待评价；-1：已退款）',
  `refund_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` int(11) unsigned DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `delivery_sn` varchar(100) DEFAULT '' COMMENT '快递公司编号',
  `delivery_name` varchar(64) DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_type` varchar(32) DEFAULT NULL COMMENT '发货类型',
  `delivery_id` varchar(64) DEFAULT NULL COMMENT '快递单号/手机号',
  `gain_integral` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '消费赚取积分',
  `use_integral` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '使用积分',
  `back_integral` decimal(8,2) unsigned DEFAULT NULL COMMENT '给用户退了多少积分',
  `mark` varchar(512) NOT NULL COMMENT '备注',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `unique` char(32) NOT NULL COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) DEFAULT NULL COMMENT '管理员备注',
  `mer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  `is_mer_check` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combination_id` int(11) unsigned DEFAULT '0' COMMENT '拼团产品id0一般产品',
  `pink_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '拼团id 0没有拼团',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `seckill_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀产品ID',
  `bargain_id` int(11) unsigned DEFAULT '0' COMMENT '砍价id',
  `verify_code` varchar(50) NOT NULL DEFAULT '' COMMENT '核销码',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `shipping_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送方式 1=快递 ，2=门店自提',
  `is_channel` tinyint(1) unsigned DEFAULT '0' COMMENT '支付渠道(0微信公众号1微信小程序)',
  `is_remind` tinyint(1) unsigned DEFAULT '0',
  `is_system_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`order_id`,`uid`) USING BTREE,
  UNIQUE KEY `unique` (`unique`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `pay_price` (`pay_price`) USING BTREE,
  KEY `paid` (`paid`) USING BTREE,
  KEY `pay_time` (`pay_time`) USING BTREE,
  KEY `pay_type` (`pay_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `coupon_id` (`coupon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order_cart_info`
--

DROP TABLE IF EXISTS `store_order_cart_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order_cart_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `oid` int(11) unsigned NOT NULL COMMENT '订单id',
  `cart_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购物车id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `cart_info` text NOT NULL COMMENT '购买东西的详细信息',
  `unique` varchar(50) NOT NULL DEFAULT '' COMMENT '唯一id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `oid` (`oid`,`unique`) USING BTREE,
  KEY `cart_id` (`cart_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单购物详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order_cart_info`
--

LOCK TABLES `store_order_cart_info` WRITE;
/*!40000 ALTER TABLE `store_order_cart_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_order_cart_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order_status`
--

DROP TABLE IF EXISTS `store_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `oid` int(10) unsigned NOT NULL COMMENT '订单id',
  `change_type` varchar(32) NOT NULL COMMENT '操作类型',
  `change_message` varchar(256) NOT NULL COMMENT '操作备注',
  `change_time` int(10) unsigned NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE,
  KEY `change_type` (`change_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单操作记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order_status`
--

LOCK TABLES `store_order_status` WRITE;
/*!40000 ALTER TABLE `store_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_pink`
--

DROP TABLE IF EXISTS `store_pink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_pink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id 生成',
  `order_id_key` int(10) unsigned NOT NULL COMMENT '订单id  数据库',
  `total_num` int(10) unsigned NOT NULL COMMENT '购买商品个数',
  `total_price` decimal(10,2) unsigned NOT NULL COMMENT '购买总金额',
  `cid` int(10) unsigned NOT NULL COMMENT '拼团产品id',
  `pid` int(10) unsigned NOT NULL COMMENT '产品id',
  `people` int(10) unsigned NOT NULL COMMENT '拼图总人数',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '拼团产品单价',
  `add_time` varchar(24) NOT NULL COMMENT '开始时间',
  `stop_time` varchar(24) NOT NULL,
  `k_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '团长id 0为团长',
  `is_tpl` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否发送模板消息0未发送1已发送',
  `is_refund` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否退款 0未退款 1已退款',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1进行中2已完成3未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拼团表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_pink`
--

LOCK TABLES `store_pink` WRITE;
/*!40000 ALTER TABLE `store_pink` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_pink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `mer_id` int(10) unsigned DEFAULT '0' COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(256) NOT NULL COMMENT '商品图片',
  `slider_image` varchar(2000) NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) NOT NULL COMMENT '关键字',
  `bar_code` varchar(15) DEFAULT '' COMMENT '产品条码（一维码）',
  `cate_id` varchar(64) NOT NULL COMMENT '分类id',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `vip_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '会员价格',
  `ot_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '市场价',
  `postage` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '邮费',
  `unit_name` varchar(32) DEFAULT NULL COMMENT '单位名',
  `sort` smallint(11) DEFAULT '0' COMMENT '排序',
  `sales` mediumint(11) unsigned DEFAULT '0' COMMENT '销量',
  `stock` mediumint(11) unsigned DEFAULT '0' COMMENT '库存',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `is_benefit` tinyint(1) DEFAULT '0' COMMENT '是否优惠',
  `is_best` tinyint(1) DEFAULT '0' COMMENT '是否精品',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新品',
  `description` text COMMENT '产品描述',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '添加时间',
  `is_postage` tinyint(1) unsigned DEFAULT '0' COMMENT '是否包邮',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除',
  `mer_use` tinyint(1) unsigned DEFAULT '0' COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8,2) unsigned DEFAULT NULL COMMENT '获得积分',
  `cost_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '成本价',
  `is_seckill` tinyint(1) unsigned DEFAULT '0' COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(1) unsigned DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `is_good` tinyint(1) DEFAULT '0' COMMENT '是否优品推荐',
  `ficti` mediumint(11) DEFAULT '100' COMMENT '虚拟销量',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `code_path` varchar(64) NOT NULL DEFAULT '' COMMENT '产品二维码地址(用户小程序海报)',
  `soure_link` varchar(255) DEFAULT '' COMMENT '淘宝京东1688类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_benefit` (`is_benefit`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_new` (`is_new`) USING BTREE,
  KEY `toggle_on_sale, is_del` (`is_del`) USING BTREE,
  KEY `price` (`price`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `sales` (`sales`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (19,NULL,'https://image.dayouqiantu.cn/5ca011a1cd487.jpg','https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg','70gA4黑白打印复印','打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务','打印复印','','3',120.00,0.20,0.50,0.00,'张',1,52,72,1,1,1,1,1,'<p style=\"text-align: center;\"><strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: left;\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width: 100%;\"><br></p>',NULL,1,1,0,1.00,0.20,0,0,1,NULL,NULL,'',''),(24,0,'https://image.dayouqiantu.cn/5ca011a1cd487.jpg','https://image.dayouqiantu.cn/5ca011a1cd487.jpg','彩色打印','彩色打印','彩色打印','','2',1.00,0.00,1.00,0.00,'张',0,10,9989,1,1,1,1,1,'<p>彩色打印</p>',1582894605,0,1,0,0.00,0.00,0,0,1,0,0,'',''),(29,0,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png','开课吧java课程','1111111','java','开课吧','5',200.00,0.00,240.00,10.00,'开课吧',1,0,100,1,0,0,0,0,'<p>1111111111111</p>',1592911470,0,1,0,0.00,150.00,0,0,0,0,0,'',''),(30,0,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png','开课吧java架构师','开课吧课程','开课吧','1213123123KKB','5',100.00,0.00,150.00,10.00,'节',1,0,100,1,0,0,0,0,'<p>开课吧课程</p>',1592993768,0,0,0,0.00,80.00,0,0,0,0,0,'',''),(31,0,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','java架构师','11111','课程','1111','8',100.00,0.00,90.00,0.00,'节',0,0,100,1,0,0,0,0,'<p>11111111</p>',1593518521,0,0,0,0.00,80.00,0,0,0,0,0,'','');
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product_attr`
--

DROP TABLE IF EXISTS `store_product_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product_attr`
--

LOCK TABLES `store_product_attr` WRITE;
/*!40000 ALTER TABLE `store_product_attr` DISABLE KEYS */;
INSERT INTO `store_product_attr` VALUES (14,20,'纸张','A3,A4'),(15,20,'颜色','白色,红色');
/*!40000 ALTER TABLE `store_product_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product_attr_result`
--

DROP TABLE IF EXISTS `store_product_attr_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product_attr_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `result` text NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) unsigned NOT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product_attr_result`
--

LOCK TABLES `store_product_attr_result` WRITE;
/*!40000 ALTER TABLE `store_product_attr_result` DISABLE KEYS */;
INSERT INTO `store_product_attr_result` VALUES (8,20,'{\"attr\":[{\"attrHidden\":true,\"detailValue\":\"\",\"detail\":[\"A3\",\"A4\"],\"value\":\"纸张\"},{\"attrHidden\":true,\"detailValue\":\"\",\"detail\":[\"白色\",\"红色\"],\"value\":\"颜色\"}],\"value\":[{\"cost\":0.5,\"price\":0.5,\"pic\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"detail\":{\"颜色\":\"白色\",\"纸张\":\"A3\"},\"check\":false,\"sales\":\"999\"},{\"cost\":0.5,\"price\":0.5,\"pic\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"detail\":{\"颜色\":\"红色\",\"纸张\":\"A3\"},\"check\":false,\"sales\":\"999\"},{\"cost\":0.5,\"price\":\"0.2\",\"pic\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"detail\":{\"颜色\":\"白色\",\"纸张\":\"A4\"},\"check\":false,\"sales\":\"999\"},{\"cost\":0.5,\"price\":\"0.2\",\"pic\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"detail\":{\"颜色\":\"红色\",\"纸张\":\"A4\"},\"check\":false,\"sales\":\"999\"}]}',1578320995),(9,28,'{\"attr\":[{\"attrHidden\":true,\"detailValue\":\"\",\"detail\":[\"黑色\",\"白色\"],\"value\":\"颜色\"},{\"attrHidden\":true,\"detailValue\":\"\",\"detail\":[\"11\"],\"value\":\"尺寸\"}],\"value\":[{\"cost\":0,\"price\":0,\"pic\":\"http://localhost:8000/file/pic/资讯-20200311043727918.png\",\"detail\":{\"颜色\":\"黑色\",\"尺寸\":\"11\"},\"check\":false,\"sales\":0},{\"cost\":0,\"price\":0,\"pic\":\"http://localhost:8000/file/pic/资讯-20200311043727918.png\",\"detail\":{\"颜色\":\"白色\",\"尺寸\":\"11\"},\"check\":false,\"sales\":0}]}',1589854701);
/*!40000 ALTER TABLE `store_product_attr_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product_attr_value`
--

DROP TABLE IF EXISTS `store_product_attr_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product_attr_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `suk` varchar(128) NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `unique` varchar(100) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  KEY `store_id` (`product_id`,`suk`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product_attr_value`
--

LOCK TABLES `store_product_attr_value` WRITE;
/*!40000 ALTER TABLE `store_product_attr_value` DISABLE KEYS */;
INSERT INTO `store_product_attr_value` VALUES (26,20,'A3,白色',996,NULL,0.50,'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg','2e51e5d2d86a44748f81cdd5bf7a51c0',0.50),(27,20,'A3,红色',999,NULL,0.50,'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg','fd545718bbdb4634aa54228ecca6febe',0.50),(28,20,'A4,白色',999,NULL,0.20,'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg','5e0ae3241d8c4ea793368666f862dd3b',0.50),(29,20,'A4,红色',999,NULL,0.20,'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg','4b4b306134434832885a52f3a85955ce',0.50),(30,28,'11,黑色',0,0,0.00,'http://localhost:8000/file/pic/资讯-20200311043727918.png','b8f3e4936b294a8a9fb433f1324eabe4',0.00),(31,28,'11,白色',0,0,0.00,'http://localhost:8000/file/pic/资讯-20200311043727918.png','42b4b10585f14d6c96f07372e46fb63b',0.00);
/*!40000 ALTER TABLE `store_product_attr_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product_relation`
--

DROP TABLE IF EXISTS `store_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `type` varchar(32) NOT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) NOT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`product_id`,`type`,`category`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `category` (`category`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品点赞和收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product_relation`
--

LOCK TABLES `store_product_relation` WRITE;
/*!40000 ALTER TABLE `store_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product_reply`
--

DROP TABLE IF EXISTS `store_product_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` int(11) NOT NULL COMMENT '订单ID',
  `unique` char(32) NOT NULL COMMENT '唯一id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) NOT NULL COMMENT '评论内容',
  `pics` text NOT NULL COMMENT '评论图片',
  `add_time` int(11) NOT NULL COMMENT '评论时间',
  `merchant_reply_content` varchar(300) DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`oid`,`unique`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `parent_id` (`reply_type`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `product_score` (`product_score`) USING BTREE,
  KEY `service_score` (`service_score`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product_reply`
--

LOCK TABLES `store_product_reply` WRITE;
/*!40000 ALTER TABLE `store_product_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_product_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_seckill`
--

DROP TABLE IF EXISTS `store_seckill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_seckill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `image` varchar(255) NOT NULL COMMENT '推荐图',
  `images` varchar(2000) NOT NULL COMMENT '轮播图',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `info` varchar(255) NOT NULL COMMENT '简介',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `cost` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本',
  `ot_price` decimal(10,2) unsigned NOT NULL COMMENT '原价',
  `give_integral` decimal(10,2) unsigned NOT NULL COMMENT '返多少积分',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `stock` int(10) unsigned NOT NULL COMMENT '库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `unit_name` varchar(16) NOT NULL COMMENT '单位名',
  `postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `description` text COMMENT '内容',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `stop_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `add_time` varchar(128) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '热门推荐',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除 0未删除1已删除',
  `num` int(11) unsigned NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示',
  `end_time_date` datetime NOT NULL,
  `start_time_date` datetime NOT NULL,
  `time_id` int(10) unsigned DEFAULT '0' COMMENT '时间段id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `start_time` (`start_time`,`stop_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_show` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品秒杀产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_seckill`
--

LOCK TABLES `store_seckill` WRITE;
/*!40000 ALTER TABLE `store_seckill` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_seckill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_visit`
--

DROP TABLE IF EXISTS `store_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_visit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) DEFAULT NULL COMMENT '产品类型',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `count` int(11) DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品浏览分析表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_visit`
--

LOCK TABLES `store_visit` WRITE;
/*!40000 ALTER TABLE `store_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_attachment`
--

DROP TABLE IF EXISTS `system_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_attachment` (
  `att_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '附件名称',
  `att_dir` varchar(200) NOT NULL DEFAULT '' COMMENT '附件路径',
  `satt_dir` varchar(200) DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) NOT NULL DEFAULT '' COMMENT '附件大小',
  `att_type` char(30) NOT NULL DEFAULT '' COMMENT '附件类型',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '上传时间',
  `image_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '图片上传类型 1本地 2七牛云 3OSS 4COS ',
  `module_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '图片上传模块类型 1 后台上传 2 用户生成',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `invite_code` varchar(50) DEFAULT '' COMMENT '邀请码',
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_attachment`
--

LOCK TABLES `system_attachment` WRITE;
/*!40000 ALTER TABLE `system_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` varchar(5000) DEFAULT NULL COMMENT '默认值',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (162,'wechat_share_img','https://image.dayouqiantu.cn/list_34.png',NULL,NULL),(165,'wechat_avatar','',NULL,NULL),(172,'wechat_share_synopsis','4444444',NULL,NULL),(174,'api','http://你的H5端域名/api/wechat/serve',NULL,NULL),(175,'wechat_share_title','4444',NULL,NULL),(177,'store_postage','1',0,0),(178,'store_free_postage','200',0,0),(179,'integral_ratio','1',0,0),(180,'store_brokerage_ratio','70',NULL,NULL),(181,'store_brokerage_statu','2',NULL,NULL),(182,'user_extract_min_price','1',NULL,NULL),(183,'store_brokerage_two','30',NULL,NULL),(184,'site_url','http://localhost:8080',0,0),(185,'api_url','http://127.0.0.1:8009',0,0),(186,'order_cancel_job_time','20',0,0),(187,'wechat_appid','1111299',NULL,NULL),(188,'wechat_appsecret','222266',NULL,NULL),(189,'wechat_encodingaeskey','6666',NULL,NULL),(190,'wechat_token','999',NULL,NULL),(191,'wxpay_mchId','2222',NULL,NULL),(192,'wxpay_appId','111111',NULL,NULL),(193,'wxpay_mchKey','55555',NULL,NULL),(194,'wxapp_appId','22222',NULL,NULL),(195,'wxapp_secret','22222222',NULL,NULL),(196,'wxpay_keyPath','http://localhost:8000/file/pic/list_30-20200110053337209.png',0,0),(197,'imageArr','[\"https://image.dayouqiantu.cn/list_34.png\"]',NULL,NULL),(198,'store_brokerage_open','1',0,0),(199,'integral_full','0',NULL,NULL),(200,'integral_max','0',NULL,NULL),(201,'store_user_min_recharge','1',0,0),(203,'store_self_mention','1',NULL,NULL),(204,'tengxun_map_key','OGABZ-Y5OCF-5UWJ5-N7DHH-VFIG7-DHFEB',NULL,NULL),(205,'wechat_id','',NULL,NULL),(206,'wechat_type','',NULL,NULL),(207,'wechat_encode','',NULL,NULL),(208,'wechat_sourceid','',NULL,NULL),(209,'wechat_name','',NULL,NULL),(210,'wechat_qrcode','',NULL,NULL),(211,'wx_native_app_appId','11111',NULL,NULL);
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_group_data`
--

DROP TABLE IF EXISTS `system_group_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID',
  `group_name` varchar(100) NOT NULL DEFAULT '' COMMENT '对应的数据名称',
  `value` text NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加数据时间',
  `sort` int(11) DEFAULT '0' COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1：开启；2：关闭；）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组合数据详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_group_data`
--

LOCK TABLES `system_group_data` WRITE;
/*!40000 ALTER TABLE `system_group_data` DISABLE KEYS */;
INSERT INTO `system_group_data` VALUES (177,'shop_home_banner','{\"imageArr\":[\"https://image.dayouqiantu.cn/5c9f05aee5059.jpg\"],\"name\":\"banner2\",\"id\":177,\"pic\":\"https://image.dayouqiantu.cn/5c9f05aee5059.jpg\",\"sort\":1,\"url\":\"wwww\",\"status\":1}',1571387677,1,1),(180,'shop_home_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e85bfa61251d.png\"],\"uniapp_url\":\"/pages/shop/GoodsClass/index\",\"name\":\"全部商品\",\"id\":180,\"pic\":\"https://image.dayouqiantu.cn/5e85bfa61251d.png\",\"sort\":9,\"url\":\"/goods_list\",\"wxapp_url\":\"/pages/shop/GoodsClass/main\",\"status\":1}',1571390842,9,1),(182,'shop_home_roll_news','{\"uniapp_url\":\"/pages/shop/news/NewsList/index\",\"id\":182,\"pic\":\"https://i.loli.net/2019/10/18/DqOUgNf7wjuFpPT.png\",\"sort\":2,\"title\":\"分销、拼团、商户功能上线啦！\",\"url\":\"/news_list\",\"info\":\"yshop2.0上线啦\",\"wxapp_url\":\"/pages/shop/news/NewsList/main\",\"status\":1}',0,2,1),(183,'shop_hot_search','{\"id\":183,\"title\":\"照片\"}',0,0,1),(184,'shop_hot_search','{\"id\":184,\"title\":\"springboot\"}',0,0,1),(187,'shop_home_roll_news','{\"uniapp_url\":\"/pages/shop/news/NewsList/index\",\"id\":187,\"sort\":1,\"url\":\"/news_list\",\"info\":\"springboot2+JPA+Mybatisplus商城系统\",\"wxapp_url\":\"/pages/shop/news/NewsList/main\",\"status\":1}',1572086163,1,1),(188,'shop_hot_search','{\"id\":188,\"title\":\"打印\"}',1572086172,0,1),(189,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5dec896eeb25a.png\"],\"uniapp_url\":\"/pages/user/UserVip/index\",\"name\":\"会员中心\",\"id\":189,\"pic\":\"https://image.dayouqiantu.cn/5dec896eeb25a.png\",\"sort\":9,\"url\":\"/user/vip\",\"wxapp_url\":\"/pages/user/UserVip/main\",\"status\":1}',1572087722,9,1),(190,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5db428984d64d.png\"],\"uniapp_url\":\"/pages/user/coupon/UserCoupon/index\",\"name\":\"优惠券\",\"id\":190,\"pic\":\"https://image.dayouqiantu.cn/5db428984d64d.png\",\"sort\":8,\"url\":\"/user/get_coupon\",\"wxapp_url\":\"/pages/user/coupon/UserCoupon/main\",\"status\":1}',0,8,1),(191,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5db428a8d3ab0.png\"],\"uniapp_url\":\"/pages/shop/GoodsCollection/index\",\"name\":\"收藏商品\",\"id\":191,\"pic\":\"https://image.dayouqiantu.cn/5db428a8d3ab0.png\",\"sort\":7,\"url\":\"/collection\",\"wxapp_url\":\"/pages/shop/GoodsCollection/main\",\"status\":1}',0,7,1),(192,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5db428bd61b73.png\"],\"uniapp_url\":\"/pages/user/address/AddressManagement/index\",\"name\":\"地址管理\",\"id\":192,\"pic\":\"https://image.dayouqiantu.cn/5db428bd61b73.png\",\"sort\":6,\"url\":\"/user/add_manage\",\"wxapp_url\":\"/pages/user/address/AddressManagement/main\",\"status\":1}',0,6,1),(193,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5db428e28dd48.png\"],\"uniapp_url\":\"/pages/user/promotion/UserPromotion/index\",\"name\":\"我的推广\",\"id\":193,\"pic\":\"https://image.dayouqiantu.cn/5db428e28dd48.png\",\"sort\":5,\"url\":\"/user/user_promotion\",\"wxapp_url\":\"/pages/user/promotion/UserPromotion/main\",\"status\":1}',0,5,1),(194,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5db42a4208c55.png\"],\"uniapp_url\":\"/pages/user/UserAccount/index\",\"name\":\"我的余额\",\"id\":194,\"pic\":\"https://image.dayouqiantu.cn/5db42a4208c55.png\",\"sort\":4,\"url\":\"/user/account\",\"wxapp_url\":\"/pages/user/UserAccount/main\",\"status\":1}',0,4,1),(195,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5db428f410462.png\"],\"uniapp_url\":\"/pages/user/signIn/Integral/index\",\"name\":\"我的积分\",\"id\":195,\"pic\":\"https://image.dayouqiantu.cn/5db428f410462.png\",\"sort\":3,\"url\":\"/user/integral\",\"wxapp_url\":\"/pages/user/signIn/Integral/main\",\"status\":1}',0,3,1),(196,'shop_home_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e4e93f004713.png\"],\"uniapp_url\":\"/pages/shop/news/NewsList/index\",\"name\":\"图文资讯\",\"id\":196,\"pic\":\"https://image.dayouqiantu.cn/5e85bfea151b7.png\",\"sort\":8,\"url\":\"/news_list\",\"wxapp_url\":\"/pages/shop/news/NewsList/main\",\"status\":1}',1573109648,8,1),(197,'shop_home_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e4e939507b5e.png\"],\"uniapp_url\":\"/pages/shop/GoodsCollection/index\",\"name\":\"我的收藏\",\"id\":197,\"pic\":\"https://image.dayouqiantu.cn/5e85bfa55f352.png\",\"sort\":7,\"url\":\"/collection\",\"wxapp_url\":\"/pages/shop/GoodsCollection/main\",\"status\":1}',1573109723,7,1),(198,'shop_home_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e4e939507b5e.png\"],\"uniapp_url\":\"/pages/shop/GoodsCollection/index\",\"name\":\"我的收藏\",\"id\":197,\"pic\":\"https://image.dayouqiantu.cn/5e85bfa55f352.png\",\"sort\":7,\"url\":\"/collection\",\"wxapp_url\":\"/pages/shop/GoodsCollection/main\",\"status\":1}',1573109723,7,1),(200,'shop_home_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e4e925140b57.png\"],\"uniapp_url\":\"/pages/activity/GoodsGroup/index\",\"name\":\"拼团专区\",\"id\":200,\"pic\":\"https://image.dayouqiantu.cn/5e85bfa4b273f.png\",\"sort\":5,\"url\":\"/activity/group\",\"wxapp_url\":\"/pages/activity/GoodsGroup/main\",\"status\":1}',0,5,1),(201,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5ddb7a37d58d9.png\"],\"uniapp_url\":\"/pages/orderAdmin/OrderIndex/index\",\"name\":\"商户管理\",\"id\":201,\"pic\":\"https://image.dayouqiantu.cn/5ddb7a37d58d9.png\",\"sort\":2,\"url\":\"/customer/index\",\"wxapp_url\":\"/pages/orderAdmin/OrderIndex/main\",\"status\":1}',0,2,1),(202,'shop_sign_day_num','{\"sign_num\":\"10\",\"id\":205,\"day\":\"第一天\"}',0,9,1),(203,'shop_sign_day_num','{\"sign_num\":\"20\",\"id\":\"\",\"day\":\"第二天\"}',0,8,1),(204,'shop_sign_day_num','{\"sign_num\":\"30\",\"id\":\"\",\"day\":\"第三天\"}',0,7,1),(205,'shop_sign_day_num','{\"addTime\":\"\",\"sign_num\":\"40\",\"id\":\"\",\"sort\":\"\",\"value\":\"\",\"day\":\"第四天\",\"status\":\"\"}',0,6,1),(206,'shop_sign_day_num','{\"addTime\":\"\",\"sign_num\":\"50\",\"id\":\"\",\"sort\":\"\",\"value\":\"\",\"day\":\"第五天\",\"status\":\"\"}',0,5,1),(207,'shop_sign_day_num','{\"addTime\":\"\",\"sign_num\":\"60\",\"id\":\"\",\"sort\":\"\",\"value\":\"\",\"day\":\"第六天\",\"status\":\"\"}',0,4,1),(208,'shop_sign_day_num','{\"addTime\":\"\",\"sign_num\":\"100\",\"id\":\"\",\"sort\":\"\",\"value\":\"\",\"day\":\"奖励\",\"status\":\"\"}',0,3,1),(209,'shop_home_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e4e93010a248.png\"],\"uniapp_url\":\"/pages/user/signIn/Sign/index\",\"name\":\"积分签到\",\"id\":209,\"pic\":\"https://image.dayouqiantu.cn/5e85bf8e494f2.png\",\"sort\":4,\"url\":\"/user/sign\",\"wxapp_url\":\"/pages/user/signIn/Sign/main\",\"status\":1}',0,4,1),(210,'shop_seckill_time','{\"continued\":2,\"id\":\"\",\"time\":5}',0,0,1),(211,'shop_seckill_time','{\"addTime\":\"\",\"continued\":\"3\",\"id\":\"\",\"sort\":\"\",\"time\":\"7\",\"value\":\"\",\"status\":\"\"}',0,0,1),(212,'shop_seckill_time','{\"addTime\":\"\",\"continued\":\"2\",\"id\":\"\",\"sort\":\"\",\"time\":\"10\",\"value\":\"\",\"status\":\"\"}',0,0,1),(213,'shop_seckill_time','{\"addTime\":\"\",\"continued\":\"3\",\"id\":\"\",\"sort\":\"\",\"time\":\"12\",\"value\":\"\",\"status\":\"\"}',0,0,1),(214,'shop_seckill_time','{\"addTime\":\"\",\"continued\":\"4\",\"id\":\"\",\"sort\":\"\",\"time\":\"15\",\"value\":\"\",\"status\":\"\"}',0,0,1),(215,'shop_seckill_time','{\"continued\":\"2\",\"id\":223,\"time\":\"19\"}',0,0,1),(216,'shop_home_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e4e929f9be59.png\"],\"uniapp_url\":\"/pages/activity/GoodsSeckill/index\",\"name\":\"秒杀专区\",\"id\":216,\"pic\":\"https://image.dayouqiantu.cn/5e85bfa5a9f85.png\",\"sort\":3,\"url\":\"/activity/goods_seckill\",\"wxapp_url\":\"/pages/activity/GoodsSeckill/main\",\"status\":1}',0,3,1),(217,'shop_home_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e4e9276c608f.png\"],\"uniapp_url\":\"/pages/activity/GoodsBargain/index\",\"name\":\"砍价专区\",\"id\":217,\"pic\":\"https://image.dayouqiantu.cn/5e85bfe9b1da8.png\",\"sort\":2,\"url\":\"/activity/bargain\",\"wxapp_url\":\"/pages/activity/GoodsBargain/main\",\"status\":1}',0,2,1),(218,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5dfd7b748e053.png\"],\"uniapp_url\":\"/pages/activity/BargainRecord/index\",\"name\":\"砍价记录\",\"id\":218,\"pic\":\"https://image.dayouqiantu.cn/5dfd7b748e053.png\",\"sort\":1,\"url\":\"/activity/bargain/record\",\"wxapp_url\":\"/pages/activity/BargainRecord/main\",\"status\":1}',0,1,1),(219,'shop_home_banner','{\"name\":\"222\",\"id\":\"\",\"pic\":\"https://image.dayouqiantu.cn/5c9f117f624ee.jpg\",\"sort\":\"\",\"url\":\"/\",\"status\":\"\"}',0,0,1),(221,'shop_my_menus','{\"imageArr\":[\"https://image.dayouqiantu.cn/5e60da498cfdd.png\"],\"name\":\"订单核销\",\"id\":230,\"pic\":\"https://image.dayouqiantu.cn/5e60da498cfdd.png\",\"sort\":0,\"url\":\"/order/order_cancellation\",\"wxapp_url\":\"\",\"status\":1}',0,0,1),(222,'shop_recharge_price_ways','{\"give_price\":\"10\",\"price\":\"100\",\"id\":\"\",\"sort\":0,\"status\":1}',0,1,1),(223,'shop_recharge_price_ways','{\"give_price\":\"1\",\"price\":1,\"id\":\"\",\"sort\":0,\"status\":1}',0,0,1),(238,'yshop_seckill_time','{\"continued\":\"6\",\"id\":\"\",\"time\":5}',1593316125,0,1);
/*!40000 ALTER TABLE `system_group_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_store`
--

DROP TABLE IF EXISTS `system_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '门店名称',
  `introduction` varchar(1000) NOT NULL DEFAULT '' COMMENT '简介',
  `phone` char(25) NOT NULL DEFAULT '' COMMENT '手机号码',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '省市区',
  `detailed_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '门店logo',
  `latitude` char(25) NOT NULL DEFAULT '' COMMENT '纬度',
  `longitude` char(25) NOT NULL DEFAULT '' COMMENT '经度',
  `valid_time` varchar(100) NOT NULL DEFAULT '' COMMENT '核销有效日期',
  `day_time` varchar(100) NOT NULL DEFAULT '' COMMENT '每日营业开关时间',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `day_time_end` datetime DEFAULT NULL,
  `day_time_start` datetime DEFAULT NULL,
  `valid_time_end` datetime DEFAULT NULL,
  `valid_time_start` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店自提';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_store`
--

LOCK TABLES `system_store` WRITE;
/*!40000 ALTER TABLE `system_store` DISABLE KEYS */;
INSERT INTO `system_store` VALUES (3,'KKB店铺','springboot商城','15136175234','河南省漯河市','','https://image.dayouqiantu.cn/noMeal_tt.png','33.54528','113.9202','2020-03-09 - 2020-04-30','11:33:49 - 19:33:49',1583300059,0,0,'2020-03-04 19:33:49','2020-03-04 11:33:49','2020-04-30 00:00:00','2020-03-09 00:00:00'),(4,'信阳门店','信阳门店','15136275234','河南省信阳市','','http://localhost:8000/file/pic/砍价-20200311043720679.png','32.11683','114.05857','2020-03-21 - 2020-03-31','17:11:13 - 20:11:13',1584781880,1,0,'2020-03-21 20:11:13','2020-03-21 17:11:13','2020-03-31 00:00:00','2020-03-21 00:00:00'),(5,'郑州门店','郑州门店','15136175246','河南省郑州','','http://localhost:8000/file/pic/05ea40b831858a8cf423aa709840507c-20200311043711341.png','34.72468','113.6401','2020-03-21 - 2020-03-31','17:11:13 - 20:11:15',1584782199,1,0,'2020-03-21 20:11:15','2020-03-21 17:11:13','2020-03-31 00:00:00','2020-03-21 00:00:00'),(7,'44','44','11111','河南信阳','','http://localhost:8000/file/pic/资讯-20200311043727918.png','32.11683','114.05857','2020-05-18 - 2020-06-30','08:00:00 - 22:58:28',1589806916,1,0,'2020-05-18 22:58:28','2020-05-18 08:00:00','2020-06-30 00:00:00','2020-05-18 00:00:00');
/*!40000 ALTER TABLE `system_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_store_staff`
--

DROP TABLE IF EXISTS `system_store_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_store_staff` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '微信用户id',
  `nickname` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '店员头像',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL,
  `staff_name` varchar(64) DEFAULT '' COMMENT '店员名称',
  `phone` char(15) DEFAULT NULL COMMENT '手机号码',
  `verify_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '核销开关',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店店员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_store_staff`
--

LOCK TABLES `system_store_staff` WRITE;
/*!40000 ALTER TABLE `system_store_staff` DISABLE KEYS */;
INSERT INTO `system_store_staff` VALUES (2,12,'会敲代码的喵2','https://image.dayouqiantu.cn/5dc2c7f3a104c.png',4,'信阳门店','tttt','15136175423',1,1,1584868920),(3,11,'开课吧','https://image.dayouqiantu.cn/5dc2c7f3a104c.png',5,'郑州门店','tttt','16136175234',1,1,1585213920),(4,19,'15136175528','https://image.dayouqiantu.cn/5dc2c7f3a104c.png',5,'郑州门店','111','15136175246',1,1,1586180635),(5,20,'15136171112','https://image.dayouqiantu.cn/5e79f6cfd33b6.png',4,'信阳门店','444','44444',1,1,NULL);
/*!40000 ALTER TABLE `system_store_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_level`
--

DROP TABLE IF EXISTS `system_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '会员名称',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '购买金额',
  `valid_date` int(11) NOT NULL DEFAULT '0' COMMENT '有效时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为永久会员',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否购买,1=购买,0=不购买',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 1=显示,0=隐藏',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '享受折扣',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '会员卡背景',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '会员图标',
  `explain` text NOT NULL COMMENT '说明',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除.1=删除,0=未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='设置用户等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_level`
--

LOCK TABLES `system_user_level` WRITE;
/*!40000 ALTER TABLE `system_user_level` DISABLE KEYS */;
INSERT INTO `system_user_level` VALUES (1,0,'普通会员',20.00,0,1,0,1,1,99.00,'http://pic.dayouqiantu.cn/5c9ccca8cd632.jpg','http://pic.dayouqiantu.cn/5c9ccca8bc1e0.png','普通会员',1553824559,0),(2,0,'青铜会员',0.00,0,1,0,1,2,98.00,'http://pic.dayouqiantu.cn/5c9ccca904016.jpg','http://pic.dayouqiantu.cn/5c9ccca8f0a30.png','青铜会员',1553824639,0),(3,0,'黄铜会员',0.00,0,1,0,1,3,95.00,'http://pic.dayouqiantu.cn/5c9ccca8b27f1.jpg','http://pic.dayouqiantu.cn/5c9ccca8e9365.png','黄铜会员',1553824742,0),(4,0,'白银会员',0.00,0,1,0,1,4,94.00,'http://pic.dayouqiantu.cn/5c9ccca8d6ae1.jpg','http://pic.dayouqiantu.cn/5c9ccca8a27f0.png','白银会员',1553824797,0),(5,0,'黄金会员',0.00,0,1,0,1,5,90.00,'http://pic.dayouqiantu.cn/5c9ccca8b27f1.jpg','http://pic.dayouqiantu.cn/5c9ccca8aa5b9.png','黄金会员',1553824837,0),(6,0,'钻石会员',0.00,0,1,0,1,6,88.00,'http://localhost:8000/file/pic/钻石-20200328094531898.jpg','http://pic.dayouqiantu.cn/5c9ccca90d2d3.png','钻石会员',1553824871,1),(8,0,'444',0.00,4,1,0,1,4,4.00,'http://localhost:8000/file/pic/资讯-20200311043727918.png','http://localhost:8000/file/pic/05ea40b831858a8cf423aa709840507c-20200311043711341.png','',1589793284,0),(9,0,'777',0.00,0,1,0,1,33,8.00,'http://localhost:8000/file/pic/钻石-20200328094531898.jpg','http://localhost:8000/file/pic/资讯-20200311043727918.png','',1589796908,0);
/*!40000 ALTER TABLE `system_user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_task`
--

DROP TABLE IF EXISTS `system_user_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '任务名称',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '配置原名',
  `task_type` varchar(50) NOT NULL DEFAULT '' COMMENT '任务类型',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '限定数',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '等级id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_must` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否务必达成任务,1务必达成,0=满足其一',
  `illustrate` varchar(255) NOT NULL DEFAULT '' COMMENT '任务说明',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='等级任务设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_task`
--

LOCK TABLES `system_user_task` WRITE;
/*!40000 ALTER TABLE `system_user_task` DISABLE KEYS */;
INSERT INTO `system_user_task` VALUES (1,'满足积分20分','积分数','SatisfactionIntegral',20,1,0,1,1,'',1553827616),(2,'消费满100元','消费金额','ConsumptionAmount',100,1,0,1,1,'',1553827625),(3,'满足积分200分','积分数','SatisfactionIntegral',200,2,0,1,1,'',1553827638),(4,'累计签到20天','累计签到','CumulativeAttendance',20,2,0,1,1,'',1553827681),(5,'满足积分500分','积分数','SatisfactionIntegral',500,3,0,1,1,'',1553827695),(6,'累计签到30天','累计签到','CumulativeAttendance',30,3,0,1,1,'',1553827703),(7,'满足积分1000分','积分数','SatisfactionIntegral',1000,4,0,1,1,'',1553827731),(8,'累计签到10天','累计签到','CumulativeAttendance',10,4,0,1,1,'',1553827740),(9,'满足积分1200分','积分数','SatisfactionIntegral',1200,5,0,1,1,'',1553827759),(10,'累计签到60天','累计签到','CumulativeAttendance',60,5,0,1,1,'',1553827768),(11,'消费满10000元','消费次数','ConsumptionAmount',10000,5,0,1,1,'',1553827776),(12,'满足积分2000分','积分数','SatisfactionIntegral',2000,6,0,1,1,'',1553827791),(13,'消费满10000元','消费次数','ConsumptionAmount',10000,6,0,1,1,'',1553827803),(14,'累计签到100天','累计签到','CumulativeAttendance',100,6,0,1,1,'',1553827814),(15,'消费满1000元','消费金额','ConsumptionAmount',1000,4,0,1,1,'',1575456513),(16,'累计签到2天','累计签到','CumulativeAttendance',2,1,0,1,1,'',1575456576),(17,'消费满100元','消费次数','ConsumptionAmount',100,2,0,1,1,'',1575456612),(18,'消费满1000元','消费金额','ConsumptionAmount',1000,3,0,1,1,'',1575456692);
/*!40000 ALTER TABLE `system_user_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_address`
--

DROP TABLE IF EXISTS `tb_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `province_id` varchar(10) DEFAULT NULL COMMENT '省',
  `city_id` varchar(10) DEFAULT NULL COMMENT '市',
  `town_id` varchar(10) DEFAULT NULL COMMENT '县/区',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `is_default` varchar(1) DEFAULT NULL COMMENT '是否是默认 1默认 0否',
  `notes` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `alias` varchar(50) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_address`
--

LOCK TABLES `tb_address` WRITE;
/*!40000 ALTER TABLE `tb_address` DISABLE KEYS */;
INSERT INTO `tb_address` VALUES (62,'jackhu',NULL,NULL,NULL,NULL,'西二旗','好人','1',NULL,NULL,NULL),(65,NULL,NULL,NULL,NULL,NULL,'test-update',NULL,NULL,NULL,NULL,NULL),(66,'15','北京','北京',NULL,'15229257908','银田工业区佳逸里青年公寓B栋231','jackhu',NULL,NULL,'2020-06-25 13:47:14',NULL);
/*!40000 ALTER TABLE `tb_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pay_log`
--

DROP TABLE IF EXISTS `tb_pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pay_log` (
  `out_trade_no` varchar(30) NOT NULL COMMENT '支付订单号',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `pay_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` bigint(20) DEFAULT NULL COMMENT '支付金额（分）',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易号码',
  `trade_state` varchar(1) DEFAULT NULL COMMENT '交易状态',
  `order_list` varchar(200) DEFAULT NULL COMMENT '订单编号列表',
  `pay_type` varchar(1) DEFAULT NULL COMMENT '支付类型',
  PRIMARY KEY (`out_trade_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pay_log`
--

LOCK TABLES `tb_pay_log` WRITE;
/*!40000 ALTER TABLE `tb_pay_log` DISABLE KEYS */;
INSERT INTO `tb_pay_log` VALUES ('1280810157621637120','2020-07-08 18:25:13',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810174470156288','2020-07-08 18:25:17',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810377264754688','2020-07-08 18:26:05',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810477525397504','2020-07-08 18:26:29',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810479136010240','2020-07-08 18:26:29',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810483921711104','2020-07-08 18:26:30',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810486585094144','2020-07-08 18:26:31',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810622472155136','2020-07-08 18:27:03',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810673479086080','2020-07-08 18:27:16',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810696543563776','2020-07-08 18:27:21',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810878345670656','2020-07-08 18:28:04',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810904320995328','2020-07-08 18:28:11',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810907252813824','2020-07-08 18:28:11',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280810917742768128','2020-07-08 18:28:14',NULL,5000,'15',NULL,'0','127707057201413','0'),('1280811084852228096','2020-07-08 18:28:54',NULL,5000,'15',NULL,'0','127707057201413','0'),('1282685883534798848','2020-07-13 22:38:44',NULL,5000,'null',NULL,'0','10086','0'),('1282685897006903296','2020-07-13 22:38:46',NULL,5000,'null',NULL,'0','10086','0'),('1282685941139369984','2020-07-13 22:38:54',NULL,5000,'null',NULL,'0','10086','0'),('1283704196821938176','2020-07-16 18:05:05',NULL,131400,'null',NULL,'0','1283704082002866176','0'),('1283704200634560512','2020-07-16 18:05:06',NULL,131400,'null',NULL,'0','1283704082002866176','0'),('1283704207957815296','2020-07-16 18:05:08',NULL,131400,'null',NULL,'0','1283704082002866176','0'),('1283704208700207104','2020-07-16 18:05:08',NULL,131400,'null',NULL,'0','1283704082002866176','0'),('1283704213179723776','2020-07-16 18:05:09',NULL,131400,'null',NULL,'0','1283704082002866176','0'),('1283704217814429696','2020-07-16 18:05:10',NULL,131400,'null',NULL,'0','1283704082002866176','0'),('1283704224219131904','2020-07-16 18:05:12',NULL,131400,'null',NULL,'0','1283704082002866176','0'),('1283973378493480960','2020-07-17 11:54:43',NULL,131400,'15',NULL,'0','1283971863259156480','0'),('1283973876701261824','2020-07-17 11:56:42',NULL,131400,'15',NULL,'0','1283971863259156480','0'),('1283975034027175936','2020-07-17 12:01:18',NULL,131400,'15',NULL,'0','1283974989504638976','0'),('201708261157265358046058','2017-08-26 11:57:26',NULL,1,'lijialong',NULL,'0','34','1'),('201708261221397410698125','2017-08-26 12:21:39',NULL,1,'lijialong',NULL,'0','35','1'),('201708261234474784646997','2017-08-26 12:34:47',NULL,1,'lijialong',NULL,'0','36','1'),('201708261247443132289031','2017-08-26 12:47:44','2017-08-26 12:48:22',3,'lijialong','4009852001201708268336481082','1','37,38','1'),('918773291320152064','2017-10-13 17:39:57',NULL,20000,'lijialong',NULL,'0','918773289399160832','1'),('918780410236788736','2017-10-13 18:08:14','2017-10-13 18:09:36',1,'lijialong','4200000028201710137833806033','1','918780408353546240','1'),('918806410983137280','2017-10-13 19:51:33','2017-10-13 19:51:47',1,'lijialong','4200000013201710137859270000','1','918806410454654976','1'),('918833486129815552','2017-10-13 21:39:08',NULL,1,'lijialong',NULL,'0','918833485639081984','1'),('918835712999055360','2017-10-13 21:47:59','2017-10-13 21:49:28',1,'lijialong','4200000018201710137883338612','1','918835712441212928','1'),('919055625042825216','2017-10-14 12:21:50',NULL,1,NULL,NULL,'0','919055624854081536','1'),('919059761058607104','2017-10-14 12:38:16','2017-10-14 12:38:24',2,'lijialong','4200000005201710147980202916','1','919059760869863424','1');
/*!40000 ALTER TABLE `tb_pay_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_seckill_goods`
--

DROP TABLE IF EXISTS `tb_seckill_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_seckill_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` bigint(20) unsigned DEFAULT NULL COMMENT '商品id',
  `image` varchar(255) DEFAULT NULL COMMENT '推荐图',
  `images` varchar(2000) DEFAULT NULL COMMENT '轮播图',
  `mark` varchar(50) DEFAULT NULL COMMENT '标签说明',
  `title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `info` varchar(255) DEFAULT NULL COMMENT '简介',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '秒杀价格',
  `cost_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '原价',
  `ot_price` decimal(10,2) unsigned DEFAULT NULL COMMENT '成本',
  `give_integral` decimal(10,2) unsigned DEFAULT NULL COMMENT '返多少积分',
  `sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `stock` int(10) unsigned DEFAULT NULL COMMENT '秒杀商品数',
  `stock_count` int(10) unsigned DEFAULT NULL COMMENT '剩余库存',
  `sales` int(10) unsigned DEFAULT '0' COMMENT '销量',
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位名',
  `postage` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '邮费',
  `description` text COMMENT '内容',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `stop_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `add_time` varchar(128) DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) unsigned DEFAULT '0' COMMENT '是否包邮',
  `is_hot` tinyint(1) unsigned DEFAULT '0' COMMENT '热门推荐',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '删除 0未删除1已删除',
  `num` int(11) unsigned DEFAULT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '显示',
  `end_time_date` datetime DEFAULT NULL,
  `start_time_date` datetime DEFAULT NULL,
  `time_id` int(10) unsigned DEFAULT '0' COMMENT '时间段id',
  `version` int(10) unsigned DEFAULT '0' COMMENT '时间段id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `start_time` (`start_time`,`stop_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_show` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品秒杀产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seckill_goods`
--

LOCK TABLES `tb_seckill_goods` WRITE;
/*!40000 ALTER TABLE `tb_seckill_goods` DISABLE KEYS */;
INSERT INTO `tb_seckill_goods` VALUES (1,30,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png',NULL,'开课吧java架构师','开课吧课程',9.90,50.00,99.00,0.00,1,100,375,0,'节',10.00,'开课吧课程',1590940800,1593446400,'1592997034',1,0,0,0,1,1,'2020-06-30 00:00:00','2020-06-01 00:00:00',212,0),(17,30,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png',NULL,'开课吧java架构师','开课吧课程',0.01,10.00,150.00,0.00,1,100,30,0,'节',10.00,'<p>开课吧课程</p>',1590854400,1593619200,'1593316153',1,0,0,0,1,1,'2020-07-02 00:00:00','2020-05-31 00:00:00',238,0),(18,31,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png',NULL,'java架构师','11111',70.00,0.00,90.00,0.00,0,100,30,0,'节',0.00,'<p>11111111</p>',1591027200,1622563200,'1593518552',1,0,0,0,1,1,'2021-06-02 00:00:00','2020-06-02 00:00:00',238,0),(19,30,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png',NULL,'开课吧java架构师','开课吧课程',120.00,0.00,150.00,0.00,1,100,NULL,0,'节',10.00,'<p>开课吧课程</p>',1594137600,1596038400,'1594868040',1,0,0,0,1,1,'2020-07-30 00:00:00','2020-07-08 00:00:00',238,0),(20,31,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg',NULL,'java架构师','11111',0.01,0.00,90.00,0.00,0,100,NULL,0,'节',0.00,'<p>11111111</p>',1593360000,1594656000,'1594869631',1,0,0,0,1,1,'2020-07-14 00:00:00','2020-06-29 00:00:00',238,0),(21,30,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png',NULL,'java架构师','开课吧课程',5000.00,0.00,8000.00,0.00,1,100,NULL,0,'节',10.00,'<p>开课吧课程</p>',1593792000,1596124800,'1594887343',1,0,0,0,1,1,'2020-07-31 00:00:00','2020-07-04 00:00:00',238,0),(22,30,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png',NULL,'开课吧java架构师','开课吧课程',1314.00,0.00,1999.00,0.00,1,100,61,0,'节',10.00,'<p>开课吧课程</p>',1594051200,1596038400,'1594890068',1,0,0,0,1,1,'2020-07-30 00:00:00','2020-07-07 00:00:00',238,0),(23,31,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg',NULL,'java架构师','11111',0.01,0.00,90.00,0.00,0,100,100,0,'节',0.00,'<p>11111111</p>',1593964800,1594051200,'1594893976',1,0,0,0,1,1,'2020-07-07 00:00:00','2020-07-06 00:00:00',238,0),(24,31,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg',NULL,'java架构师','11111',0.01,0.00,90.00,0.00,0,100,100,0,'节',0.00,'<p>11111111</p>',1593964800,1594051200,'1594894205',1,0,0,0,1,1,'2020-07-07 00:00:00','2020-07-06 00:00:00',238,0),(25,31,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg',NULL,'java架构师','11111',0.01,0.00,90.00,0.00,0,100,100,0,'节',0.00,'<p>11111111</p>',1595779200,1595952000,'1594894249',1,0,0,0,1,1,'2020-07-29 00:00:00','2020-07-27 00:00:00',238,0),(26,31,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg',NULL,'java架构师','11111',0.01,0.00,90.00,0.00,0,100,100,0,'节',0.00,'<p>11111111</p>',1593360000,1594051200,'1594894349',1,0,0,0,1,1,'2020-07-07 00:00:00','2020-06-29 00:00:00',238,0),(27,31,'http://127.0.0.1:8000/file/pic/20200623192348809700.jpg','http://127.0.0.1:8000/file/pic/20200623192348809700.jpg',NULL,'java架构师','11111',0.01,0.00,90.00,0.00,0,100,100,0,'节',0.00,'<p>11111111</p>',1594656000,1594051200,'1594894381',1,0,0,0,1,1,'2020-07-07 00:00:00','2020-07-14 00:00:00',238,0),(28,30,'https://img.kaikeba.com/under_line_shalong_one.png','https://img.kaikeba.com/under_line_shalong_one.png',NULL,'开课吧java架构师','开课吧课程',0.01,0.00,150.00,0.00,1,100,100,0,'节',10.00,'<p>开课吧课程</p>',1595779200,1595779200,'1594894680',1,0,0,0,1,1,'2020-07-27 00:00:00','2020-07-27 00:00:00',238,0);
/*!40000 ALTER TABLE `tb_seckill_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_seckill_goods_bak`
--

DROP TABLE IF EXISTS `tb_seckill_goods_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_seckill_goods_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT 'spu ID',
  `item_id` bigint(20) DEFAULT NULL COMMENT 'sku ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `small_pic` varchar(150) DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10,2) DEFAULT NULL COMMENT '原价格',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '秒杀价格',
  `seller_id` varchar(100) DEFAULT NULL COMMENT '商家ID',
  `create_time` datetime DEFAULT NULL COMMENT '添加日期',
  `check_time` datetime DEFAULT NULL COMMENT '审核日期',
  `status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `num` int(11) DEFAULT NULL COMMENT '秒杀商品数',
  `mark` varchar(50) DEFAULT NULL COMMENT '标签',
  `stock_count` int(11) DEFAULT NULL COMMENT '剩余库存数',
  `goods_desc` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `introduction` varchar(2000) DEFAULT NULL COMMENT '介绍',
  `version` bigint(20) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seckill_goods_bak`
--

LOCK TABLES `tb_seckill_goods_bak` WRITE;
/*!40000 ALTER TABLE `tb_seckill_goods_bak` DISABLE KEYS */;
INSERT INTO `tb_seckill_goods_bak` VALUES (1,149187842867960,NULL,'Java架构师必备技能之kubernetes与微服务的完美结合','http://192.168.25.133/group1/M00/00/00/wKgZhVnGbYuAO6AHAAjlKdWCzvg253.jpg,',100.00,10.00,'ss',NULL,'2019-10-23 18:07:27','1','2020-06-09 18:07:27','2020-06-12 18:07:27',10,'开课吧',0,'kubernetes作用,命令服务部署,yaml部署,jenkins&k8s','k8s作用,k8s命令服务部署,yaml部署,jenkins/CI/CD/k8s',1),(2,149187842867953,NULL,'轻轻奶茶','http://192.168.25.133/group1/M00/00/00/wKgZhVnGZfWAaX2hAAjlKdWCzvg173.jpg',10.00,0.01,'xx',NULL,'2019-10-23 18:07:27','1','2019-10-28 18:07:27','2019-10-30 18:07:27',10,NULL,200,NULL,'清仓打折',NULL),(3,149187842867953,NULL,'秒杀精品女装11','11',100.00,20.00,'x',NULL,'2019-10-23 18:07:27','1','2019-10-28 18:07:27','2019-10-30 18:07:27',10,NULL,323,NULL,NULL,NULL),(4,149187842867953,NULL,'测试',NULL,10.00,0.01,'xx','2017-10-14 19:18:18','2019-10-23 18:07:27','1','2019-10-28 18:07:27','2019-10-30 18:07:27',100,NULL,333,NULL,NULL,NULL),(5,149187842867953,NULL,'羽绒服',NULL,100.00,0.02,'ss','2017-10-15 09:50:52','2017-10-15 10:06:27','1','2019-10-28 18:07:27','2019-10-30 18:07:27',10,NULL,666,NULL,'清仓打折',NULL),(6,149187842867953,NULL,'秒杀测试','https://img.kaikeba.com/under_line_shalong_one.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_seckill_goods_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_seckill_order`
--

DROP TABLE IF EXISTS `tb_seckill_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_seckill_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `seckill_id` bigint(20) DEFAULT NULL COMMENT '秒杀商品ID',
  `money` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货人地址',
  `receiver_mobile` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `receiver` varchar(20) DEFAULT NULL COMMENT '收货人',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易流水',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1283974989504638977 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seckill_order`
--

LOCK TABLES `tb_seckill_order` WRITE;
/*!40000 ALTER TABLE `tb_seckill_order` DISABLE KEYS */;
INSERT INTO `tb_seckill_order` VALUES (10086,10086,50.00,'15',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1283688297830281216,22,0.00,NULL,'2020-07-16 17:01:55',NULL,'0',NULL,NULL,NULL,NULL),(1283688304847351808,22,0.00,NULL,'2020-07-16 17:01:56',NULL,'0',NULL,NULL,NULL,NULL),(1283688408786399232,22,0.00,NULL,'2020-07-16 17:02:21',NULL,'0',NULL,NULL,NULL,NULL),(1283690085203570688,22,0.00,NULL,'2020-07-16 17:09:01',NULL,'0',NULL,NULL,NULL,NULL),(1283690086965178368,22,0.00,NULL,'2020-07-16 17:09:01',NULL,'0',NULL,NULL,NULL,NULL),(1283690184398860288,22,0.00,NULL,'2020-07-16 17:09:24',NULL,'0',NULL,NULL,NULL,NULL),(1283691641613316096,22,0.00,NULL,'2020-07-16 17:15:12',NULL,'0',NULL,NULL,NULL,NULL),(1283691989266591744,22,0.00,NULL,'2020-07-16 17:16:35',NULL,'0',NULL,NULL,NULL,NULL),(1283692215201165312,22,0.00,NULL,'2020-07-16 17:17:30',NULL,'0',NULL,NULL,NULL,NULL),(1283695007529693184,22,0.00,NULL,'2020-07-16 17:28:35',NULL,'0',NULL,NULL,NULL,NULL),(1283695202703241216,22,0.00,NULL,'2020-07-16 17:29:22',NULL,'0',NULL,NULL,NULL,NULL),(1283695288141213696,22,0.00,NULL,'2020-07-16 17:30:17',NULL,'0',NULL,NULL,NULL,NULL),(1283695415933267968,22,0.00,NULL,'2020-07-16 17:30:17',NULL,'0',NULL,NULL,NULL,NULL),(1283696583065464832,22,0.00,NULL,'2020-07-16 17:34:51',NULL,'0',NULL,NULL,NULL,NULL),(1283696585510744064,22,0.00,NULL,'2020-07-16 17:34:53',NULL,'0',NULL,NULL,NULL,NULL),(1283696979926315008,22,0.00,NULL,'2020-07-16 17:36:25',NULL,'0',NULL,NULL,NULL,NULL),(1283697547524698112,22,0.00,NULL,'2020-07-16 17:38:41',NULL,'0',NULL,NULL,NULL,NULL),(1283697972067954688,22,0.00,NULL,'2020-07-16 17:40:22',NULL,'0',NULL,NULL,NULL,NULL),(1283697978413936640,22,0.00,NULL,'2020-07-16 17:40:24',NULL,'0',NULL,NULL,NULL,NULL),(1283697983254163456,22,0.00,NULL,'2020-07-16 17:40:25',NULL,'0',NULL,NULL,NULL,NULL),(1283698466987438080,22,0.00,NULL,'2020-07-16 17:42:28',NULL,'0',NULL,NULL,NULL,NULL),(1283698494766313472,22,0.00,NULL,'2020-07-16 17:42:28',NULL,'0',NULL,NULL,NULL,NULL),(1283698590337724416,22,0.00,NULL,'2020-07-16 17:42:49',NULL,'0',NULL,NULL,NULL,NULL),(1283698858412470272,22,0.00,NULL,'2020-07-16 17:43:54',NULL,'0',NULL,NULL,NULL,NULL),(1283699916857667584,22,0.00,NULL,'2020-07-16 17:48:05',NULL,'0',NULL,NULL,NULL,NULL),(1283700056540573696,22,0.00,NULL,'2020-07-16 17:48:48',NULL,'0',NULL,NULL,NULL,NULL),(1283700076492877824,22,0.00,NULL,'2020-07-16 17:48:48',NULL,'0',NULL,NULL,NULL,NULL),(1283700086735368192,22,0.00,NULL,'2020-07-16 17:48:49',NULL,'0',NULL,NULL,NULL,NULL),(1283700086739562496,22,0.00,NULL,'2020-07-16 17:48:48',NULL,'0',NULL,NULL,NULL,NULL),(1283700237856141312,22,0.00,NULL,'2020-07-16 17:49:23',NULL,'0',NULL,NULL,NULL,NULL),(1283700370832355328,22,0.00,NULL,'2020-07-16 17:49:54',NULL,'0',NULL,NULL,NULL,NULL),(1283704082002866176,22,1314.00,NULL,'2020-07-16 18:04:38',NULL,'0',NULL,NULL,NULL,NULL),(1283712516012736512,22,0.00,NULL,'2020-07-16 18:38:09',NULL,'0',NULL,NULL,NULL,NULL),(1283719092974997504,22,0.00,NULL,'2020-07-16 19:04:17',NULL,'0',NULL,NULL,NULL,NULL),(1283719110884675584,22,0.00,NULL,'2020-07-16 19:04:21',NULL,'0',NULL,NULL,NULL,NULL),(1283964661496651776,22,0.00,NULL,'2020-07-17 11:20:06',NULL,'0',NULL,NULL,NULL,NULL),(1283971863259156480,22,1314.00,NULL,'2020-07-17 11:48:43',NULL,'0',NULL,NULL,NULL,NULL),(1283974989504638976,22,1314.00,NULL,'2020-07-17 12:01:08',NULL,'0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_seckill_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户账户(跟accout一样)',
  `account` varchar(32) NOT NULL COMMENT '用户账号',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码（跟pwd）',
  `pwd` varchar(255) NOT NULL COMMENT '用户密码',
  `real_name` varchar(25) DEFAULT '' COMMENT '真实姓名',
  `birthday` int(11) DEFAULT '0' COMMENT '生日',
  `card_id` varchar(20) DEFAULT '' COMMENT '身份证号码',
  `mark` varchar(255) DEFAULT '' COMMENT '用户备注',
  `partner_id` int(11) DEFAULT '0' COMMENT '合伙人id',
  `group_id` int(11) DEFAULT '0' COMMENT '用户分组id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(256) DEFAULT NULL COMMENT '用户头像',
  `phone` char(15) DEFAULT NULL COMMENT '手机号码',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `add_ip` varchar(16) DEFAULT '' COMMENT '添加ip',
  `last_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_ip` varchar(16) DEFAULT '' COMMENT '最后一次登录ip',
  `now_money` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `brokerage_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `integral` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '用户剩余积分',
  `sign_num` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到天数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为正常，0为禁止',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `spread_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推广元id',
  `spread_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '推广员关联时间',
  `user_type` varchar(32) NOT NULL COMMENT '用户类型',
  `is_promoter` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为推广员',
  `pay_count` int(11) unsigned DEFAULT '0' COMMENT '用户购买次数',
  `spread_count` int(11) DEFAULT '0' COMMENT '下级人数',
  `clean_time` int(11) DEFAULT '0' COMMENT '清理会员时间',
  `addres` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `adminid` int(11) unsigned DEFAULT '0' COMMENT '管理员编号 ',
  `login_type` varchar(36) NOT NULL DEFAULT '' COMMENT '用户登陆类型，h5,wechat,routine',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `spreaduid` (`spread_uid`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_promoter` (`is_promoter`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `avatar_id` bigint(20) DEFAULT NULL COMMENT '头像',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `enabled` bigint(20) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门名称',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `job_id` bigint(20) DEFAULT NULL COMMENT '岗位名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `last_password_reset_time` datetime DEFAULT NULL COMMENT '最后修改密码的日期',
  `nick_name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_kpubos9gc2cvtkb0thktkbkes` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `FK5rwmryny6jthaaxkogownknqp` (`dept_id`) USING BTREE,
  KEY `FKfftoc2abhot8f2wu6cl9a5iky` (`job_id`) USING BTREE,
  KEY `FKpq2dhypk2qgt68nauh2by22jb` (`avatar_id`) USING BTREE,
  CONSTRAINT `FK5rwmryny6jthaaxkogownknqp` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `FKfftoc2abhot8f2wu6cl9a5iky` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FKpq2dhypk2qgt68nauh2by22jb` FOREIGN KEY (`avatar_id`) REFERENCES `user_avatar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'yshop@qq.com',1,'$2a$10$fP.426qKaTmix50Oln8L.uav55gELhAd0Eg66Av4oG86u8km7D/Ky','admin',2,'18888888888',11,'2018-08-23 09:11:56','2019-05-18 17:34:21','管理员','男'),(3,NULL,'test@yshopnet',1,'$2a$10$HhxyGZy.ulf3RvAwaHUGb.k.2i9PBpv4YbLMJWp8pES7pPhTyRCF.','test',2,'17777777777',12,'2018-12-27 20:05:26','2019-04-01 09:15:24','测试','男'),(4,NULL,'test2@qq.com',1,'$2a$10$IjehtV8MiXb8ni.Qz0wBteE7FjVn49cEcsSj2.ZBUqqHjnC3umSh.','test2',2,'15136175247',11,'2020-02-15 20:39:16',NULL,'test2','男'),(5,NULL,'444@qq.com',0,'$2a$10$f/VH35NBOBszycV9KEA1HenQ0qVjazDm8LacQU9PO.A4UizFxLMuq','qqqqq',11,'15136175249',8,'2020-02-17 11:12:01',NULL,'eeeeee','男'),(6,NULL,'666@qq.com',0,'$2a$10$3Vlo24eOmHHW7.3vAjqPSusfIINNo4JiujzxgqsaoWLx/d5de/jEm','7777',8,'15136175246',8,'2020-05-18 19:43:30',NULL,'777','男');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) NOT NULL DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人所在省',
  `city` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人所在市',
  `district` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人所在区',
  `detail` varchar(256) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `post_code` varchar(20) NOT NULL DEFAULT '' COMMENT '邮编',
  `longitude` varchar(16) NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (9,8,'胡鹏','15136175246','山西','大同市','灵丘县','999','','0','0',1,0,1573119435),(10,11,'胡鹏','15139175246','重庆','荣昌县','广顺镇','999','','0','0',1,0,1573120628),(11,12,'hu','15136175246','上海','闸北区','城区','99999','','0','0',1,0,1573123595),(12,14,'zhang','15136175247','上海','静安区','城区','999','','0','0',1,0,1573612804);
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_avatar`
--

DROP TABLE IF EXISTS `user_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_avatar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `size` varchar(255) DEFAULT NULL COMMENT '大小',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户头像';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_avatar`
--

LOCK TABLES `user_avatar` WRITE;
/*!40000 ALTER TABLE `user_avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bill`
--

DROP TABLE IF EXISTS `user_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户账单id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户uid',
  `link_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 = 支出 1 = 获得',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '账单标题',
  `category` varchar(64) NOT NULL DEFAULT '' COMMENT '明细种类',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT '明细类型',
  `number` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '明细数字',
  `balance` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '剩余',
  `mark` varchar(512) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = 带确定 1 = 有效 -1 = 无效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openid` (`uid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `pm` (`pm`) USING BTREE,
  KEY `type` (`category`,`type`,`link_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bill`
--

LOCK TABLES `user_bill` WRITE;
/*!40000 ALTER TABLE `user_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_enter`
--

DROP TABLE IF EXISTS `user_enter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_enter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商户申请ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '商户所在省',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '商户所在市',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '商户所在区',
  `address` varchar(256) NOT NULL DEFAULT '' COMMENT '商户详细地址',
  `merchant_name` varchar(256) NOT NULL DEFAULT '' COMMENT '商户名称',
  `link_user` varchar(32) NOT NULL DEFAULT '',
  `link_tel` varchar(16) NOT NULL DEFAULT '' COMMENT '商户电话',
  `charter` varchar(512) NOT NULL DEFAULT '' COMMENT '商户证书',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `apply_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `success_time` int(11) NOT NULL COMMENT '通过时间',
  `fail_message` varchar(256) NOT NULL DEFAULT '' COMMENT '未通过原因',
  `fail_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '未通过时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 审核未通过 0未审核 1审核通过',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 = 开启 1= 关闭',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  KEY `province` (`province`,`city`,`district`) USING BTREE,
  KEY `is_lock` (`is_lock`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商户申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_enter`
--

LOCK TABLES `user_enter` WRITE;
/*!40000 ALTER TABLE `user_enter` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_enter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_extract`
--

DROP TABLE IF EXISTS `user_extract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_extract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL,
  `real_name` varchar(64) DEFAULT NULL COMMENT '名称',
  `extract_type` varchar(32) DEFAULT 'bank' COMMENT 'bank = 银行卡 alipay = 支付宝wx=微信',
  `bank_code` varchar(32) DEFAULT '0' COMMENT '银行卡',
  `bank_address` varchar(256) DEFAULT '' COMMENT '开户地址',
  `alipay_code` varchar(64) DEFAULT '' COMMENT '支付宝账号',
  `extract_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '提现金额',
  `mark` varchar(512) DEFAULT NULL,
  `balance` decimal(8,2) unsigned DEFAULT '0.00',
  `fail_msg` varchar(128) DEFAULT NULL COMMENT '无效原因',
  `fail_time` int(10) unsigned DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(2) DEFAULT '0' COMMENT '-1 未通过 0 审核中 1 已提现',
  `wechat` varchar(15) DEFAULT NULL COMMENT '微信号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `extract_type` (`extract_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `openid` (`uid`) USING BTREE,
  KEY `fail_time` (`fail_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户提现表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_extract`
--

LOCK TABLES `user_extract` WRITE;
/*!40000 ALTER TABLE `user_extract` DISABLE KEYS */;
INSERT INTO `user_extract` VALUES (1,11,'开课吧','weixin','0','','',1.00,NULL,5.00,'失败了',1589800488,1573648445,-1,'hu');
/*!40000 ALTER TABLE `user_extract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) DEFAULT NULL COMMENT '用户分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_level`
--

DROP TABLE IF EXISTS `user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '等级vip',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `valid_time` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否永久',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:禁止,1:正常',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已通知',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除,0=未删除,1=删除',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `discount` int(11) NOT NULL DEFAULT '0' COMMENT '享受折扣',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户等级记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
INSERT INTO `user_level` VALUES (4,11,1,1,0,1,0,1,'恭喜你成为了普通会员',0,0,1585297281,99);
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_recharge`
--

DROP TABLE IF EXISTS `user_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '充值用户UID',
  `nickname` varchar(50) DEFAULT '',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单号',
  `price` decimal(8,2) DEFAULT NULL COMMENT '充值金额',
  `give_price` decimal(8,2) DEFAULT '0.00' COMMENT '购买赠送金额',
  `recharge_type` varchar(32) DEFAULT NULL COMMENT '充值类型',
  `paid` tinyint(1) DEFAULT NULL COMMENT '是否充值',
  `pay_time` int(10) DEFAULT NULL COMMENT '充值支付时间',
  `add_time` int(12) DEFAULT NULL COMMENT '充值时间',
  `refund_price` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `recharge_type` (`recharge_type`) USING BTREE,
  KEY `paid` (`paid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_recharge`
--

LOCK TABLES `user_recharge` WRITE;
/*!40000 ALTER TABLE `user_recharge` DISABLE KEYS */;
INSERT INTO `user_recharge` VALUES (1,11,'开课吧','1234428298159718400',200.00,0.00,'weixin',0,NULL,1583145615,0.00),(2,11,'开课吧','1235853569362493440',110.00,0.00,'weixin',0,NULL,1583485426,0.00),(3,11,'开课吧','1235874304738983936',111.00,0.00,'weixin',0,NULL,1583490370,0.00),(4,11,'开课吧','1235874561447165952',111.00,0.00,'weixin',0,NULL,1583490431,0.00),(5,11,'开课吧','1235874725738053632',111.00,0.00,'weixin',0,NULL,1583490470,0.00),(6,11,'开课吧','1235875114126409728',1111.00,0.00,'weixin',0,NULL,1583490563,0.00),(7,11,'开课吧','1235876251080589312',1111.00,0.00,'weixin',0,NULL,1583490834,0.00),(8,11,'开课吧','1242024244678754304',100.00,10.00,'weixin',0,NULL,1584956630,0.00),(9,11,'开课吧','1242024501730869248',111.00,111.00,'weixin',0,NULL,1584956691,0.00),(10,11,'开课吧','1242025322262560768',222.00,0.00,'weixin',0,NULL,1584956887,0.00),(11,11,'开课吧','1246020207407792128',1.00,1.00,'weixin',0,NULL,1585909342,0.00),(12,11,'开课吧','1246379540565983232',10.00,100.00,'weixin',0,NULL,1585995013,0.00),(13,11,'开课吧','1246379584941719552',1.00,1.00,'weixin',0,NULL,1585995024,0.00),(14,11,'开课吧','1246383201052524544',10.00,100.00,'weixin',0,NULL,1585995886,0.00),(15,11,'开课吧','1246383225413042176',10.00,100.00,'weixin',0,NULL,1585995892,0.00);
/*!40000 ALTER TABLE `user_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sign`
--

DROP TABLE IF EXISTS `user_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '签到说明',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '获得积分',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '剩余积分',
  `add_time` bigint(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='签到记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sign`
--

LOCK TABLES `user_sign` WRITE;
/*!40000 ALTER TABLE `user_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_task_finish`
--

DROP TABLE IF EXISTS `user_task_finish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_task_finish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户任务完成记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_task_finish`
--

LOCK TABLES `user_task_finish` WRITE;
/*!40000 ALTER TABLE `user_task_finish` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_task_finish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`) USING BTREE,
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(3,2),(4,2),(5,2),(6,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_code`
--

DROP TABLE IF EXISTS `verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verification_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(255) DEFAULT NULL COMMENT '验证码',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `status` bit(1) DEFAULT NULL COMMENT '状态：1有效、0过期',
  `type` varchar(255) DEFAULT NULL COMMENT '验证码类型：email或者短信',
  `value` varchar(255) DEFAULT NULL COMMENT '接收邮箱或者手机号码',
  `scenes` varchar(255) DEFAULT NULL COMMENT '业务名称：如重置邮箱、重置密码等',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_code`
--

LOCK TABLES `verification_code` WRITE;
/*!40000 ALTER TABLE `verification_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `verification_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `ip_counts` bigint(20) DEFAULT NULL,
  `pv_counts` bigint(20) DEFAULT NULL,
  `week_day` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_11aksgq87euk9bcyeesfs4vtp` (`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='访客记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (21,'2019-12-31 11:40:24','2019-12-31',2,4,'Tue'),(22,'2020-01-06 16:55:15','2020-01-06',4,25,'Mon'),(23,'2020-01-07 11:32:57','2020-01-07',4,8,'Tue'),(24,'2020-01-08 00:04:57','2020-01-08',2,17,'Wed'),(25,'2020-01-09 14:28:38','2020-01-09',3,3,'Thu'),(26,'2020-01-10 00:00:00','2020-01-10',6,16,'Fri'),(27,'2020-01-11 11:06:01','2020-01-11',1,2,'Sat'),(28,'2020-01-12 17:19:42','2020-01-12',1,1,'Sun'),(29,'2020-01-13 10:18:00','2020-01-13',1,2,'Mon'),(30,'2020-01-14 17:34:40','2020-01-14',1,3,'Tue'),(31,'2020-01-15 11:23:03','2020-01-15',1,1,'Wed'),(32,'2020-01-16 10:45:22','2020-01-16',1,1,'Thu'),(33,'2020-01-17 18:07:10','2020-01-17',1,1,'Fri'),(34,'2020-01-18 18:19:03','2020-01-18',1,2,'Sat'),(35,'2020-01-19 09:53:20','2020-01-19',1,1,'Sun'),(36,'2020-01-20 14:01:00','2020-01-20',1,1,'Mon'),(37,'2020-01-31 10:38:18','2020-01-31',1,2,'Fri'),(38,'2020-02-02 14:27:41','2020-02-02',1,2,'Sun'),(39,'2020-02-03 14:11:42','2020-02-03',1,1,'Mon'),(40,'2020-02-04 10:27:33','2020-02-04',1,1,'Tue'),(41,'2020-02-05 10:40:14','2020-02-05',1,2,'Wed'),(42,'2020-02-07 10:17:32','2020-02-07',1,1,'Fri'),(43,'2020-02-09 13:31:49','2020-02-09',1,1,'Sun'),(44,'2020-02-10 10:07:12','2020-02-10',1,3,'Mon'),(45,'2020-02-11 21:31:13','2020-02-11',1,1,'Tue'),(46,'2020-02-13 14:47:22','2020-02-13',1,3,'Thu'),(47,'2020-02-14 13:32:26','2020-02-14',3,5,'Fri'),(48,'2020-02-15 20:37:36','2020-02-15',1,4,'Sat'),(49,'2020-02-16 20:11:40','2020-02-16',1,4,'Sun'),(50,'2020-02-17 09:48:36','2020-02-17',1,2,'Mon'),(51,'2020-02-19 10:34:18','2020-02-19',1,3,'Wed'),(52,'2020-02-20 21:19:04','2020-02-20',1,1,'Thu'),(53,'2020-02-21 10:25:10','2020-02-21',1,1,'Fri'),(54,'2020-02-23 16:34:09','2020-02-23',1,2,'Sun'),(55,'2020-02-24 14:30:06','2020-02-24',1,2,'Mon'),(56,'2020-02-26 15:24:09','2020-02-26',1,1,'Wed'),(57,'2020-02-27 12:55:34','2020-02-27',2,3,'Thu'),(58,'2020-02-28 15:31:37','2020-02-28',2,4,'Fri'),(59,'2020-02-29 14:37:48','2020-02-29',2,3,'Sat'),(60,'2020-03-01 13:43:01','2020-03-01',2,5,'Sun'),(61,'2020-03-02 18:36:56','2020-03-02',2,7,'Mon'),(62,'2020-03-03 02:51:42','2020-03-03',2,9,'Tue'),(63,'2020-03-04 12:55:53','2020-03-04',1,11,'Wed'),(64,'2020-03-05 12:55:28','2020-03-05',1,2,'Thu'),(65,'2020-03-06 02:48:11','2020-03-06',2,2,'Fri'),(66,'2020-03-07 09:58:45','2020-03-07',1,2,'Sat'),(67,'2020-03-08 10:24:41','2020-03-08',1,1,'Sun'),(68,'2020-03-09 22:57:23','2020-03-09',1,2,'Mon'),(69,'2020-03-10 00:00:00','2020-03-10',1,2,'Tue'),(70,'2020-03-11 16:10:12','2020-03-11',2,10,'Wed'),(71,'2020-03-12 12:37:42','2020-03-12',1,1,'Thu'),(72,'2020-03-13 13:13:48','2020-03-13',1,5,'Fri'),(73,'2020-03-14 09:59:04','2020-03-14',1,7,'Sat'),(74,'2020-03-15 12:38:59','2020-03-15',1,5,'Sun'),(75,'2020-03-18 20:37:00','2020-03-18',1,1,'Wed'),(76,'2020-03-19 14:19:16','2020-03-19',1,2,'Thu'),(77,'2020-03-21 13:23:28','2020-03-21',1,4,'Sat'),(78,'2020-03-22 14:01:05','2020-03-22',1,6,'Sun'),(79,'2020-03-23 13:08:06','2020-03-23',1,2,'Mon'),(80,'2020-03-24 13:52:07','2020-03-24',1,6,'Tue'),(81,'2020-03-25 11:18:01','2020-03-25',1,2,'Wed'),(82,'2020-03-26 13:40:28','2020-03-26',1,2,'Thu'),(83,'2020-03-27 11:11:32','2020-03-27',1,2,'Fri'),(84,'2020-03-28 15:24:09','2020-03-28',1,3,'Sat'),(85,'2020-03-29 21:56:39','2020-03-29',1,1,'Sun'),(86,'2020-03-31 16:50:56','2020-03-31',1,2,'Tue'),(87,'2020-04-01 13:52:04','2020-04-01',1,3,'Wed'),(88,'2020-04-02 00:00:00','2020-04-02',1,8,'Thu'),(89,'2020-04-03 10:50:28','2020-04-03',1,29,'Fri'),(90,'2020-04-04 17:56:12','2020-04-04',1,1,'Sat'),(91,'2020-04-05 09:24:56','2020-04-05',1,3,'Sun'),(92,'2020-04-06 21:38:54','2020-04-06',1,2,'Mon'),(93,'2020-04-07 15:06:27','2020-04-07',1,2,'Tue'),(94,'2020-05-18 15:34:23','2020-05-18',1,1,'Mon'),(97,'2020-05-19 10:01:41','2020-05-19',1,1,'Tue'),(99,'2020-06-22 18:40:54','2020-06-22',1,5,'Mon'),(100,'2020-06-23 10:04:54','2020-06-23',1,4,'Tue'),(101,'2020-06-24 00:00:01','2020-06-24',1,3,'Wed'),(102,'2020-06-25 13:35:52','2020-06-25',1,1,'Thu'),(103,'2020-06-28 00:03:38','2020-06-28',2,7,'Sun'),(104,'2020-06-30 19:43:47','2020-06-30',1,2,'Tue'),(105,'2020-07-01 15:36:23','2020-07-01',1,3,'Wed'),(106,'2020-07-02 10:16:08','2020-07-02',1,1,'Thu'),(107,'2020-07-03 10:04:45','2020-07-03',1,1,'Fri'),(108,'2020-07-08 11:02:33','2020-07-08',1,3,'Wed'),(109,'2020-07-14 18:45:11','2020-07-14',1,2,'Tue'),(110,'2020-07-15 10:09:43','2020-07-15',1,1,'Wed'),(111,'2020-07-16 10:08:53','2020-07-16',1,6,'Thu'),(112,'2020-07-17 10:14:49','2020-07-17',1,1,'Fri');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_media`
--

DROP TABLE IF EXISTS `wechat_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信视频音频id',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '回复类型',
  `path` varchar(128) NOT NULL DEFAULT '' COMMENT '文件路径',
  `media_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信服务器返回的id',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT '地址',
  `temporary` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否永久或者临时 0永久1临时',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`,`media_id`) USING BTREE,
  KEY `type_2` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_media`
--

LOCK TABLES `wechat_media` WRITE;
/*!40000 ALTER TABLE `wechat_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_menu`
--

DROP TABLE IF EXISTS `wechat_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_menu` (
  `key` varchar(32) NOT NULL,
  `result` text COMMENT '缓存数据',
  `add_time` int(10) DEFAULT NULL COMMENT '缓存时间',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_menu`
--

LOCK TABLES `wechat_menu` WRITE;
/*!40000 ALTER TABLE `wechat_menu` DISABLE KEYS */;
INSERT INTO `wechat_menu` VALUES ('wechat_menus','[{\"subButtons\":[{\"name\":\"公众号演示\",\"type\":\"view\",\"url\":\"https://h5.dayouqiantu.cn\"}],\"name\":\"Yshop商城3\",\"type\":\"click\",\"key\":\"yshop\"},{\"subButtons\":[{\"appId\":\"wxa82b5b7fcb0ec161\",\"name\":\"小程序演示\",\"pagePath\":\"pages/index\",\"type\":\"miniprogram\",\"url\":\"pages/index\"}],\"name\":\"供货商城\",\"type\":\"click\",\"key\":\"supply\"},{\"subButtons\":[],\"name\":\"3333\",\"type\":\"click\",\"key\":\"2222\"}]',1570435277);
/*!40000 ALTER TABLE `wechat_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_reply`
--

DROP TABLE IF EXISTS `wechat_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_reply` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信关键字回复id',
  `key` varchar(64) NOT NULL DEFAULT '' COMMENT '关键字',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '回复类型',
  `data` text NOT NULL COMMENT '回复数据',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0=不可用  1 =可用',
  `hide` tinyint(1) unsigned DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`key`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `hide` (`hide`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信关键字回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_reply`
--

LOCK TABLES `wechat_reply` WRITE;
/*!40000 ALTER TABLE `wechat_reply` DISABLE KEYS */;
INSERT INTO `wechat_reply` VALUES (1,'subscribe','text','{\"content\":\"22222222222444499990000\"}',1,NULL);
/*!40000 ALTER TABLE `wechat_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_template`
--

DROP TABLE IF EXISTS `wechat_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '模板名',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '回复内容',
  `tempid` char(100) DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tempkey` (`tempkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_template`
--

LOCK TABLES `wechat_template` WRITE;
/*!40000 ALTER TABLE `wechat_template` DISABLE KEYS */;
INSERT INTO `wechat_template` VALUES (3,'OPENTM200565259','订单发货提醒','{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n物流公司：{{keyword2.DATA}}\n物流单号：{{keyword3.DATA}}\n{{remark.DATA}}','KusKZOFc_4CrRU_gzuXMdMMTfFeR-OLVVuDiMyR5PiM','1515052638',1),(13,'OPENTM207791277','订单支付成功通知','{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n支付金额：{{keyword2.DATA}}\n{{remark.DATA}}','hJV1d1OwWB_lbPrSaRHi9RGr5CFAF4PJcZdYeg73Mtg','1528966759',1),(14,'OPENTM405847076','帐户资金变动提醒','{{first.DATA}}\n变动类型：{{keyword1.DATA}}\n变动时间：{{keyword2.DATA}}\n变动金额：{{keyword3.DATA}}\n{{remark.DATA}}','ePF4RS3ONCEuS9AuPyqZ2Th_B-HZ6E1CIpnJRt7ACwI','1528966759',1);
/*!40000 ALTER TABLE `wechat_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_user`
--

DROP TABLE IF EXISTS `wechat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信用户id',
  `unionid` varchar(30) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `openid` varchar(30) DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `routine_openid` varchar(32) DEFAULT NULL COMMENT '小程序唯一身份ID',
  `nickname` varchar(64) NOT NULL COMMENT '用户的昵称',
  `headimgurl` varchar(256) NOT NULL COMMENT '用户头像',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) NOT NULL COMMENT '用户所在城市',
  `language` varchar(64) NOT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `province` varchar(64) NOT NULL COMMENT '用户所在省份',
  `country` varchar(64) NOT NULL COMMENT '用户所在国家',
  `remark` varchar(256) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` smallint(5) unsigned DEFAULT '0' COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(256) DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe` tinyint(3) unsigned DEFAULT '1' COMMENT '用户是否订阅该公众号标识',
  `subscribe_time` int(10) unsigned DEFAULT NULL COMMENT '关注公众号时间',
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `stair` int(11) unsigned DEFAULT NULL COMMENT '一级推荐人',
  `second` int(11) unsigned DEFAULT NULL COMMENT '二级推荐人',
  `order_stair` int(11) DEFAULT NULL COMMENT '一级推荐人订单',
  `order_second` int(11) unsigned DEFAULT NULL COMMENT '二级推荐人订单',
  `now_money` decimal(8,2) unsigned DEFAULT NULL COMMENT '佣金',
  `session_key` varchar(32) DEFAULT NULL COMMENT '小程序用户会话密匙',
  `user_type` varchar(32) DEFAULT 'wechat' COMMENT '用户类型',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `openid` (`openid`) USING BTREE,
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `subscribe_time` (`subscribe_time`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `subscribe` (`subscribe`) USING BTREE,
  KEY `unionid` (`unionid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_user`
--

LOCK TABLES `wechat_user` WRITE;
/*!40000 ALTER TABLE `wechat_user` DISABLE KEYS */;
INSERT INTO `wechat_user` VALUES (1,NULL,NULL,NULL,'hupeng','',0,'','','','',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'wechat');
/*!40000 ALTER TABLE `wechat_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 14:18:07