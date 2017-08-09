/*
SQLyog Community v12.16 (64 bit)
MySQL - 5.5.36-log : Database - wxstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wxstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wxstore`;

/*Table structure for table `tp_norms` */

DROP TABLE IF EXISTS `tp_norms`;

CREATE TABLE `tp_norms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL,
  `catid` int(10) unsigned NOT NULL,
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_norms` */

/*Table structure for table `tp_product` */

DROP TABLE IF EXISTS `tp_product`;

CREATE TABLE `tp_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `catid` mediumint(4) NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL,
  `storeid` mediumint(4) NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '',
  `price` float NOT NULL DEFAULT '0',
  `vprice` float NOT NULL,
  `oprice` float NOT NULL DEFAULT '0',
  `mailprice` float NOT NULL,
  `discount` float NOT NULL DEFAULT '10',
  `intro` text NOT NULL,
  `token` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `salecount` mediumint(4) NOT NULL DEFAULT '0',
  `logourl` varchar(150) NOT NULL DEFAULT '',
  `dining` tinyint(1) NOT NULL DEFAULT '0',
  `groupon` tinyint(1) NOT NULL DEFAULT '0',
  `endtime` int(10) NOT NULL DEFAULT '0',
  `fakemembercount` mediumint(4) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL,
  `commission_type` varchar(10) NOT NULL DEFAULT '' COMMENT '佣金类型 固定金额fixed, 百分比 float',
  `commission` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '分销佣金',
  `allow_distribution` char(1) NOT NULL DEFAULT '0' COMMENT '允许分销 0, 1',
  `sn` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sn_name` varchar(200) DEFAULT NULL,
  `sn_pass` varchar(200) DEFAULT NULL,
  `groupon_num` int(10) unsigned NOT NULL DEFAULT '200',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`storeid`),
  KEY `catid_2` (`catid`),
  KEY `storeid` (`storeid`),
  KEY `token` (`token`),
  KEY `price` (`price`),
  KEY `oprice` (`oprice`),
  KEY `discount` (`discount`),
  KEY `dining` (`dining`),
  KEY `groupon` (`groupon`,`endtime`),
  KEY `cid` (`cid`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tp_product` */

insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (5,1,0,5,0,0,'蛋糕8个',29.8,29,75.8,0,3.9,'','hkzyaf1467686790','甜甜圈',0,'http://192.168.2.140:8062/Public/upload/Wap/0/1/9/c/thumb_57ddf58de332e.jpg',0,0,0,0,1474164172,0,1000000,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (6,1,0,5,0,0,'饼干60枚',42,41.2,45,0,9.3,'','hkzyaf1467686790','饼干',0,'http://192.168.2.140:8062/Public/upload/Wap/6/8/4/7/thumb_57ddf7f1be365.jpg',0,0,0,0,1474164766,0,16762,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (7,1,0,5,0,0,'红茶250g',43,42.1,86,0,5,'','hkzyaf1467686790','茶叶',0,'http://192.168.2.140:8062/Public/upload/Wap/2/2/9/c/thumb_57ddf915531f4.jpg',0,0,0,0,1474165067,0,9789643,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (16,1,0,6,0,0,'运动女鞋',139,131.34,278,0,5,'','hkzyaf1467686790','白色',0,'http://192.168.2.140:8062/Public/upload/Wap/e/e/6/2/thumb_58101d7d329cb.jpg',0,0,0,0,1477451210,0,1033,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (8,1,0,6,0,0,'女鞋H14W6308',126,126,129,0,9.8,'','hkzyaf1467686790','平底鞋',0,'http://192.168.2.140:8062/Public/upload/Wap/7/0/f/3/thumb_57ddfa8d104a2.jpg',0,0,0,0,1474165536,0,9999987,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (9,1,0,6,0,0,'女鞋H03W6325',296.01,295.48,299,0,9.9,'','hkzyaf1467686790','浅口鞋',0,'http://192.168.2.140:8062/Public/upload/Wap/5/d/8/2/thumb_57ddfbab98517.jpg',0,0,0,0,1474165714,0,106,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (10,1,0,6,0,0,'裸靴女H03W6312',367.08,366.62,399,0,9.2,'','hkzyaf1467686790','高跟鞋',0,'http://192.168.2.140:8062/Public/upload/Wap/2/9/e/1/thumb_57ddfc76e0b68.jpg',0,0,0,0,1474165926,0,158,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (11,1,0,5,0,0,'巧克力1粒',1.78,1.78,2.5,6,7.1,'','hkzyaf1467686790','费列罗',0,'http://192.168.2.140:8062/Public/upload/Wap/0/2/9/6/thumb_57ddfd55e647c.jpg',0,0,0,0,1474166106,0,964126,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (15,1,0,6,0,0,'英伦风马丁靴',198,195.64,688,0,2.9,'','hkzyaf1467686790','英伦风',0,'http://192.168.2.140:8062/Public/upload/Wap/9/2/8/b/thumb_58101ba7969c2.jpg',0,0,0,0,1477450746,0,577,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (12,1,0,7,0,0,'2016铆钉女包',99,96.03,465,0,2.1,'','hkzyaf1467686790','日韩',0,'http://192.168.2.140:8062/Public/upload/Wap/8/7/e/3/thumb_57ddfe02911a5.jpg',0,0,0,0,1474166308,0,10,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (13,1,0,7,0,0,'女包双肩包',69.85,69.16,196,0,3.6,'','hkzyaf1467686790','学生包',0,'http://192.168.2.140:8062/Public/upload/Wap/c/d/6/8/thumb_57ddfec1e518b.jpg',0,0,0,0,1474166505,0,21659,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (14,1,0,7,0,0,'2016小包包',33.5,33.5,192.7,0,1.7,'','hkzyaf1467686790','斜挎包',0,'http://192.168.2.140:8062/Public/upload/Wap/4/e/d/6/thumb_57ddff648a773.jpg',0,0,0,0,1474166670,0,440,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (17,1,0,6,0,0,'低帮女鞋',178,172.39,356,0,5,'','hkzyaf1467686790','休闲',0,'http://192.168.2.140:8062/Public/upload/Wap/0/e/8/9/thumb_58101ea710f12.jpg',0,0,0,0,1477451522,0,491,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (18,1,0,5,0,0,'盐焗鸡翅中',68,67,78,6,8.7,'','hkzyaf1467686790','零食',0,'http://192.168.2.140:8062/Public/upload/Wap/e/1/7/8/thumb_5810220f8a454.jpg',0,0,0,0,1477452362,0,1043,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (19,1,0,5,0,0,'四丸套餐',75.8,74.33,170,0,4.5,'','hkzyaf1467686790','食材',0,'http://192.168.2.140:8062/Public/upload/Wap/f/3/7/a/thumb_5810232dd894e.jpg',0,0,0,0,1477452634,0,1222,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (20,1,0,5,0,0,'虾干',79,71.02,98,0,8.1,'','hkzyaf1467686790','小吃',0,'http://192.168.2.140:8062/Public/upload/Wap/3/4/0/2/thumb_581023fc35dad.jpg',0,0,0,0,1477452849,0,1300,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (21,1,0,5,0,0,'新疆红枣500g',16.99,16.83,80,0,2.1,'','hkzyaf1467686790','干果',0,'http://192.168.2.140:8062/Public/upload/Wap/4/2/d/f/thumb_581024e475359.jpg',0,0,0,0,1477453075,0,99981,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (22,1,0,7,0,0,'女士休闲包',66,66,187,0,3.5,'','hkzyaf1467686790','女包',0,'http://192.168.2.140:8062/Public/upload/Wap/f/6/f/d/thumb_581025cd8a7a4.jpg',0,0,0,0,1477453303,0,8994,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (23,1,0,7,0,0,'单肩包',58,57.42,145,0,4,'','hkzyaf1467686790','女包',0,'http://192.168.2.140:8062/Public/upload/Wap/d/a/0/d/thumb_581026cb4ee67.jpg',0,0,0,0,1477453564,0,6659,'0','0.00','0',0,NULL,NULL,200);
insert  into `tp_product`(`id`,`cid`,`sort`,`catid`,`gid`,`storeid`,`name`,`price`,`vprice`,`oprice`,`mailprice`,`discount`,`intro`,`token`,`keyword`,`salecount`,`logourl`,`dining`,`groupon`,`endtime`,`fakemembercount`,`time`,`status`,`num`,`commission_type`,`commission`,`allow_distribution`,`sn`,`sn_name`,`sn_pass`,`groupon_num`) values (24,1,0,7,0,0,'旅行背包',148,146.1,298,0,5,'','hkzyaf1467686790','女包',0,'http://192.168.2.140:8062/Public/upload/Wap/2/3/e/3/thumb_5810278d49ebc.jpg',0,0,0,0,1477453761,0,96889,'0','0.00','0',0,NULL,NULL,200);

/*Table structure for table `tp_product_attribute` */

DROP TABLE IF EXISTS `tp_product_attribute`;

CREATE TABLE `tp_product_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_attribute` */

/*Table structure for table `tp_product_cart` */

DROP TABLE IF EXISTS `tp_product_cart`;

CREATE TABLE `tp_product_cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `transactionid` varchar(100) NOT NULL DEFAULT '',
  `paytype` varchar(30) NOT NULL DEFAULT '',
  `productid` int(10) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `wecha_id` varchar(60) NOT NULL DEFAULT '',
  `diningtype` mediumint(2) NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `total` mediumint(4) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `truename` varchar(20) NOT NULL DEFAULT '',
  `tel` varchar(14) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `ordertype` mediumint(2) NOT NULL DEFAULT '0',
  `tableid` mediumint(4) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  `buytime` varchar(100) NOT NULL DEFAULT '',
  `groupon` tinyint(1) NOT NULL DEFAULT '0',
  `dining` tinyint(1) NOT NULL DEFAULT '0',
  `year` mediumint(4) NOT NULL DEFAULT '0',
  `month` mediumint(4) NOT NULL DEFAULT '0',
  `day` mediumint(4) NOT NULL DEFAULT '0',
  `hour` smallint(4) NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `orderid` varchar(40) NOT NULL DEFAULT '',
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `logistics` varchar(70) NOT NULL DEFAULT '',
  `logisticsid` varchar(50) NOT NULL DEFAULT '',
  `printed` tinyint(1) NOT NULL DEFAULT '0',
  `handled` tinyint(1) NOT NULL DEFAULT '0',
  `handledtime` int(10) NOT NULL DEFAULT '0',
  `handleduid` int(10) NOT NULL DEFAULT '0',
  `score` int(10) unsigned NOT NULL,
  `paymode` tinyint(1) unsigned NOT NULL,
  `comment` varchar(300) NOT NULL DEFAULT '' COMMENT '买家留言',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '买家id',
  `twid` varchar(20) NOT NULL COMMENT '来源推广人的推广ID',
  `totalprice` float NOT NULL COMMENT '购买商品的订单总价',
  `sn` tinyint(1) NOT NULL DEFAULT '0',
  `sn_content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`,`time`),
  KEY `groupon` (`groupon`),
  KEY `dining` (`dining`),
  KEY `printed` (`printed`),
  KEY `year` (`year`,`month`,`day`,`hour`),
  KEY `diningtype` (`diningtype`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_cart` */

/*Table structure for table `tp_product_cart_list` */

DROP TABLE IF EXISTS `tp_product_cart_list`;

CREATE TABLE `tp_product_cart_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `cartid` int(10) NOT NULL DEFAULT '0',
  `productid` int(10) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `total` mediumint(4) NOT NULL DEFAULT '0',
  `wecha_id` varchar(60) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `time` int(10) NOT NULL DEFAULT '0',
  `shipping` float NOT NULL DEFAULT '0' COMMENT '运费',
  `sku_id` int(10) NOT NULL DEFAULT '0' COMMENT '库存id',
  `comment` varchar(300) NOT NULL DEFAULT '0' COMMENT '买家留言',
  PRIMARY KEY (`id`),
  KEY `cartid` (`cartid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_cart_list` */

/*Table structure for table `tp_product_cat` */

DROP TABLE IF EXISTS `tp_product_cat`;

CREATE TABLE `tp_product_cat` (
  `id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `sort` int(10) NOT NULL DEFAULT '0',
  `cid` int(10) unsigned NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `des` varchar(500) NOT NULL DEFAULT '',
  `parentid` mediumint(4) NOT NULL,
  `logourl` varchar(100) NOT NULL,
  `dining` tinyint(1) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL,
  `norms` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `isfinal` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pc_cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  KEY `token` (`token`),
  KEY `dining` (`dining`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_cat` */

insert  into `tp_product_cat`(`id`,`sort`,`cid`,`token`,`name`,`des`,`parentid`,`logourl`,`dining`,`time`,`norms`,`color`,`isfinal`,`pc_cat_id`) values (7,3,1,'hkzyaf1467686790','包','',0,'',0,1474163820,'【质地】','【颜色】',1,0);
insert  into `tp_product_cat`(`id`,`sort`,`cid`,`token`,`name`,`des`,`parentid`,`logourl`,`dining`,`time`,`norms`,`color`,`isfinal`,`pc_cat_id`) values (5,1,1,'hkzyaf1467686790','零食','',0,'',0,1474163700,'【口味】','',1,0);
insert  into `tp_product_cat`(`id`,`sort`,`cid`,`token`,`name`,`des`,`parentid`,`logourl`,`dining`,`time`,`norms`,`color`,`isfinal`,`pc_cat_id`) values (6,2,1,'hkzyaf1467686790','鞋','',0,'',0,1474163771,'【鞋码】','【颜色】',1,0);

/*Table structure for table `tp_product_comment` */

DROP TABLE IF EXISTS `tp_product_comment`;

CREATE TABLE `tp_product_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `token` varchar(50) NOT NULL,
  `cartid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `detailid` int(10) unsigned NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  `truename` varchar(20) NOT NULL,
  `tel` varchar(14) NOT NULL,
  `content` varchar(500) NOT NULL,
  `productinfo` varchar(80) NOT NULL,
  `score` tinyint(1) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `isdelete` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `wecha_id` (`wecha_id`),
  KEY `token` (`token`),
  KEY `cartid` (`cartid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_comment` */

/*Table structure for table `tp_product_detail` */

DROP TABLE IF EXISTS `tp_product_detail`;

CREATE TABLE `tp_product_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `format` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `price` float NOT NULL,
  `vprice` float NOT NULL,
  `logo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_detail` */

/*Table structure for table `tp_product_diningtable` */

DROP TABLE IF EXISTS `tp_product_diningtable`;

CREATE TABLE `tp_product_diningtable` (
  `id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `intro` varchar(500) NOT NULL DEFAULT '',
  `taxis` mediumint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_diningtable` */

/*Table structure for table `tp_product_group` */

DROP TABLE IF EXISTS `tp_product_group`;

CREATE TABLE `tp_product_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_group` */

/*Table structure for table `tp_product_image` */

DROP TABLE IF EXISTS `tp_product_image`;

CREATE TABLE `tp_product_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_image` */

insert  into `tp_product_image`(`id`,`pid`,`image`) values (1,5,'http://192.168.2.140:8062/Public/upload/Wap/0/1/9/c/thumb_57ddf58de332e.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (2,5,'http://192.168.2.140:8062/Public/upload/Wap/c/e/f/f/thumb_57ddf59664cc9.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (3,5,'http://192.168.2.140:8062/Public/upload/Wap/6/3/2/9/thumb_57ddf59cb5fe2.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (4,5,'http://192.168.2.140:8062/Public/upload/Wap/4/a/1/f/thumb_57ddf5aab6ec4.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (5,5,'http://192.168.2.140:8062/Public/upload/Wap/2/d/0/1/thumb_57ddf5b41ac0d.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (6,6,'http://192.168.2.140:8062/Public/upload/Wap/d/f/8/f/thumb_57ddf7fab58c3.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (7,6,'http://192.168.2.140:8062/Public/upload/Wap/b/f/7/e/thumb_57ddf802272d5.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (8,6,'http://192.168.2.140:8062/Public/upload/Wap/d/c/0/7/thumb_57ddf809916cc.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (9,6,'http://192.168.2.140:8062/Public/upload/Wap/0/a/7/8/thumb_57ddf814820c7.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (10,7,'http://192.168.2.140:8062/Public/upload/Wap/2/2/9/c/thumb_57ddf915531f4.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (11,7,'http://192.168.2.140:8062/Public/upload/Wap/6/e/7/1/thumb_57ddf91bb87d2.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (12,7,'http://192.168.2.140:8062/Public/upload/Wap/d/8/a/9/thumb_57ddf924ec523.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (13,7,'http://192.168.2.140:8062/Public/upload/Wap/9/2/0/8/thumb_57ddf93d66fe1.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (14,7,'http://192.168.2.140:8062/Public/upload/Wap/d/0/4/d/thumb_57ddf947654f6.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (15,8,'http://192.168.2.140:8062/Public/upload/Wap/7/0/f/3/thumb_57ddfa8d104a2.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (16,8,'http://192.168.2.140:8062/Public/upload/Wap/4/4/5/a/thumb_57ddfafe91288.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (17,8,'http://192.168.2.140:8062/Public/upload/Wap/c/5/6/9/thumb_57ddfb0742814.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (18,8,'http://192.168.2.140:8062/Public/upload/Wap/a/b/5/2/thumb_57ddfb111920a.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (19,8,'http://192.168.2.140:8062/Public/upload/Wap/c/3/a/7/thumb_57ddfb19d8d69.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (20,9,'http://192.168.2.140:8062/Public/upload/Wap/5/d/8/2/thumb_57ddfbab98517.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (21,9,'http://192.168.2.140:8062/Public/upload/Wap/3/8/8/3/thumb_57ddfbb3eda4a.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (22,9,'http://192.168.2.140:8062/Public/upload/Wap/2/d/0/1/thumb_57ddfbbc5c724.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (23,9,'http://192.168.2.140:8062/Public/upload/Wap/1/9/a/a/thumb_57ddfbc4ca70f.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (24,9,'http://192.168.2.140:8062/Public/upload/Wap/1/c/5/5/thumb_57ddfbcda076f.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (25,10,'http://192.168.2.140:8062/Public/upload/Wap/2/9/e/1/thumb_57ddfc76e0b68.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (26,10,'http://192.168.2.140:8062/Public/upload/Wap/a/c/f/a/thumb_57ddfc80510fc.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (27,10,'http://192.168.2.140:8062/Public/upload/Wap/9/8/4/d/thumb_57ddfc8b764ec.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (28,10,'http://192.168.2.140:8062/Public/upload/Wap/d/0/1/9/thumb_57ddfc961cdaa.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (29,10,'http://192.168.2.140:8062/Public/upload/Wap/e/1/3/d/thumb_57ddfca0b38e9.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (30,11,'http://192.168.2.140:8062/Public/upload/Wap/0/2/9/6/thumb_57ddfd55e647c.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (31,12,'http://192.168.2.140:8062/Public/upload/Wap/8/7/e/3/thumb_57ddfe02911a5.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (32,12,'http://192.168.2.140:8062/Public/upload/Wap/0/b/b/4/thumb_57ddfe08b11b9.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (33,12,'http://192.168.2.140:8062/Public/upload/Wap/2/a/b/5/thumb_57ddfe0ee2402.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (34,12,'http://192.168.2.140:8062/Public/upload/Wap/0/6/2/7/thumb_57ddfe1a4b392.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (35,12,'http://192.168.2.140:8062/Public/upload/Wap/e/6/8/3/thumb_57ddfe20ab5b2.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (36,13,'http://192.168.2.140:8062/Public/upload/Wap/c/d/6/8/thumb_57ddfec1e518b.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (37,13,'http://192.168.2.140:8062/Public/upload/Wap/9/7/a/9/thumb_57ddfeca399cc.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (38,13,'http://192.168.2.140:8062/Public/upload/Wap/d/0/7/0/thumb_57ddfed423417.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (39,13,'http://192.168.2.140:8062/Public/upload/Wap/c/1/d/3/thumb_57ddfedd57697.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (40,13,'http://192.168.2.140:8062/Public/upload/Wap/5/7/e/1/thumb_57ddfee5505c8.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (41,14,'http://192.168.2.140:8062/Public/upload/Wap/4/e/d/6/thumb_57ddff648a773.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (42,14,'http://192.168.2.140:8062/Public/upload/Wap/8/6/2/5/thumb_57ddff6cd0f76.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (43,14,'http://192.168.2.140:8062/Public/upload/Wap/4/8/d/5/thumb_57ddff74aa4a5.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (44,14,'http://192.168.2.140:8062/Public/upload/Wap/9/0/2/6/thumb_57ddff81365a0.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (45,14,'http://192.168.2.140:8062/Public/upload/Wap/3/c/0/b/thumb_57ddff8b47a21.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (46,15,'http://192.168.2.140:8062/Public/upload/Wap/2/6/6/9/thumb_58101bc088c42.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (47,15,'http://192.168.2.140:8062/Public/upload/Wap/7/1/5/0/thumb_58101bcf16795.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (48,15,'http://192.168.2.140:8062/Public/upload/Wap/c/b/8/4/thumb_58101be77977b.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (49,15,'http://192.168.2.140:8062/Public/upload/Wap/1/7/c/6/thumb_58101bf316cc9.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (50,16,'http://192.168.2.140:8062/Public/upload/Wap/e/e/6/2/thumb_58101d7d329cb.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (51,16,'http://192.168.2.140:8062/Public/upload/Wap/4/5/d/9/thumb_58101d975171d.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (52,16,'http://192.168.2.140:8062/Public/upload/Wap/6/0/d/9/thumb_58101da214d98.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (53,16,'http://192.168.2.140:8062/Public/upload/Wap/7/8/5/7/thumb_58101daee62fb.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (54,16,'http://192.168.2.140:8062/Public/upload/Wap/6/5/e/e/thumb_58101db980789.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (55,17,'http://192.168.2.140:8062/Public/upload/Wap/0/e/8/9/thumb_58101ea710f12.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (56,17,'http://192.168.2.140:8062/Public/upload/Wap/f/7/a/c/thumb_58101eb3bdbdf.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (57,17,'http://192.168.2.140:8062/Public/upload/Wap/e/6/e/3/thumb_58101ec06685b.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (58,17,'http://192.168.2.140:8062/Public/upload/Wap/2/f/2/1/thumb_58101ecce6075.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (59,17,'http://192.168.2.140:8062/Public/upload/Wap/3/2/2/4/thumb_58101ee17f738.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (60,18,'http://192.168.2.140:8062/Public/upload/Wap/e/1/7/8/thumb_5810220f8a454.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (61,18,'http://192.168.2.140:8062/Public/upload/Wap/a/d/f/6/thumb_5810221dc73c9.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (62,18,'http://192.168.2.140:8062/Public/upload/Wap/9/c/f/a/thumb_5810222ad09ff.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (63,18,'http://192.168.2.140:8062/Public/upload/Wap/5/8/9/a/thumb_5810223648023.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (64,18,'http://192.168.2.140:8062/Public/upload/Wap/6/2/2/5/thumb_581022405ad3d.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (65,19,'http://192.168.2.140:8062/Public/upload/Wap/f/3/7/a/thumb_5810232dd894e.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (66,19,'http://192.168.2.140:8062/Public/upload/Wap/4/4/2/a/thumb_5810233983919.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (67,19,'http://192.168.2.140:8062/Public/upload/Wap/a/d/a/5/thumb_5810234183cde.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (68,19,'http://192.168.2.140:8062/Public/upload/Wap/e/6/5/7/thumb_581023499a021.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (69,19,'http://192.168.2.140:8062/Public/upload/Wap/7/f/4/0/thumb_5810235234c8a.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (70,20,'http://192.168.2.140:8062/Public/upload/Wap/3/4/0/2/thumb_581023fc35dad.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (71,20,'http://192.168.2.140:8062/Public/upload/Wap/c/7/0/c/thumb_581024061a0d3.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (72,20,'http://192.168.2.140:8062/Public/upload/Wap/7/e/3/a/thumb_58102411e6b2a.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (73,20,'http://192.168.2.140:8062/Public/upload/Wap/1/e/0/1/thumb_581024218f0a8.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (74,20,'http://192.168.2.140:8062/Public/upload/Wap/6/a/3/8/thumb_5810242a6f9f8.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (75,21,'http://192.168.2.140:8062/Public/upload/Wap/4/2/d/f/thumb_581024e475359.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (76,21,'http://192.168.2.140:8062/Public/upload/Wap/0/c/e/0/thumb_581024ef35709.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (77,21,'http://192.168.2.140:8062/Public/upload/Wap/c/0/d/3/thumb_581024fa51580.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (78,21,'http://192.168.2.140:8062/Public/upload/Wap/e/6/a/f/thumb_5810250405b95.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (79,21,'http://192.168.2.140:8062/Public/upload/Wap/d/8/8/3/thumb_5810250c9d2a9.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (80,22,'http://192.168.2.140:8062/Public/upload/Wap/f/6/f/d/thumb_581025cd8a7a4.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (81,22,'http://192.168.2.140:8062/Public/upload/Wap/b/5/d/9/thumb_581025d6231df.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (82,22,'http://192.168.2.140:8062/Public/upload/Wap/8/a/6/4/thumb_581025df0c63b.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (83,22,'http://192.168.2.140:8062/Public/upload/Wap/f/8/8/9/thumb_581025e7c0415.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (84,22,'http://192.168.2.140:8062/Public/upload/Wap/5/2/0/2/thumb_581025f0aefb4.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (85,23,'http://192.168.2.140:8062/Public/upload/Wap/d/a/0/d/thumb_581026cb4ee67.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (86,23,'http://192.168.2.140:8062/Public/upload/Wap/c/6/6/0/thumb_581026d6c5f81.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (87,23,'http://192.168.2.140:8062/Public/upload/Wap/b/7/a/0/thumb_581026e1d4ec4.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (88,23,'http://192.168.2.140:8062/Public/upload/Wap/0/8/7/6/thumb_581026ecbd4d4.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (89,23,'http://192.168.2.140:8062/Public/upload/Wap/c/9/d/9/thumb_581026f584499.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (90,24,'http://192.168.2.140:8062/Public/upload/Wap/2/3/e/3/thumb_5810278d49ebc.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (91,24,'http://192.168.2.140:8062/Public/upload/Wap/d/7/f/e/thumb_58102796d693d.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (92,24,'http://192.168.2.140:8062/Public/upload/Wap/1/e/a/2/thumb_581027a0bea00.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (93,24,'http://192.168.2.140:8062/Public/upload/Wap/7/1/8/8/thumb_581027ab589cc.jpg');
insert  into `tp_product_image`(`id`,`pid`,`image`) values (94,24,'http://192.168.2.140:8062/Public/upload/Wap/0/d/1/b/thumb_581027b6ac25d.jpg');

/*Table structure for table `tp_product_mail_price` */

DROP TABLE IF EXISTS `tp_product_mail_price`;

CREATE TABLE `tp_product_mail_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(100) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_mail_price` */

/*Table structure for table `tp_product_relation` */

DROP TABLE IF EXISTS `tp_product_relation`;

CREATE TABLE `tp_product_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_relation` */

/*Table structure for table `tp_product_setting` */

DROP TABLE IF EXISTS `tp_product_setting`;

CREATE TABLE `tp_product_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `token` varchar(100) NOT NULL,
  `price` float NOT NULL DEFAULT '-1' COMMENT '满多少元免邮费',
  `score` float NOT NULL,
  `paymode` tinyint(1) unsigned NOT NULL,
  `tpid` int(10) unsigned NOT NULL,
  `footerid` int(10) unsigned NOT NULL,
  `headerbackgroud` text NOT NULL,
  `headerid` int(10) unsigned NOT NULL,
  `isgroup` tinyint(1) unsigned NOT NULL,
  `email` varchar(64) NOT NULL DEFAULT '',
  `email_status` char(1) NOT NULL DEFAULT '0',
  `shop_send_sms` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_setting` */

/*Table structure for table `tp_product_sn` */

DROP TABLE IF EXISTS `tp_product_sn`;

CREATE TABLE `tp_product_sn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `wecha_id` varchar(60) NOT NULL COMMENT '微信唯一识别码',
  `token` varchar(30) NOT NULL,
  `sn` varchar(200) NOT NULL COMMENT '中奖后序列号',
  `pass` varchar(200) NOT NULL,
  `sendstutas` int(10) unsigned NOT NULL DEFAULT '0',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tp_product_sn` */

/*Table structure for table `tp_seckill_users` */

DROP TABLE IF EXISTS `tp_seckill_users`;

CREATE TABLE `tp_seckill_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_nickname` varchar(20) DEFAULT '' COMMENT '普通用户昵称',
  `user_headimgurl` varchar(500) DEFAULT '' COMMENT '用户用户头像',
  `user_sex` tinyint(4) DEFAULT '0' COMMENT '用户性别',
  `user_tel` varchar(20) DEFAULT '' COMMENT '用户电话',
  `user_qq` varchar(20) DEFAULT '' COMMENT '用户QQ',
  `user_address` varchar(50) DEFAULT '' COMMENT '用户address',
  `user_province` varchar(50) DEFAULT '' COMMENT '用户province',
  `user_city` varchar(50) DEFAULT '' COMMENT '用户city',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tp_seckill_users` */

insert  into `tp_seckill_users`(`user_id`,`user_nickname`,`user_headimgurl`,`user_sex`,`user_tel`,`user_qq`,`user_address`,`user_province`,`user_city`) values (1,'li','http://cms.3tiworld.com/tpl/static/seckill/images/yk.jpg',1,'18680229321','','111111111111111111111','','');

/*Table structure for table `tp_userinfo` */

DROP TABLE IF EXISTS `tp_userinfo`;

CREATE TABLE `tp_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portrait` varchar(200) NOT NULL DEFAULT '',
  `wallopen` tinyint(1) NOT NULL DEFAULT '0',
  `total_score` int(10) NOT NULL DEFAULT '0',
  `expensetotal` int(10) NOT NULL DEFAULT '0',
  `token` varchar(60) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  `wechaname` varchar(60) NOT NULL,
  `truename` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(11) NOT NULL,
  `bornyear` varchar(4) NOT NULL DEFAULT '',
  `bornmonth` varchar(4) NOT NULL DEFAULT '',
  `bornday` varchar(4) NOT NULL DEFAULT '',
  `qq` varchar(11) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL,
  `age` varchar(3) NOT NULL DEFAULT '',
  `birthday` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `info` varchar(200) NOT NULL,
  `sign_score` int(11) NOT NULL,
  `expend_score` int(11) NOT NULL,
  `continuous` int(11) NOT NULL,
  `add_expend` int(11) NOT NULL,
  `add_expend_time` int(11) NOT NULL,
  `live_time` int(11) NOT NULL,
  `getcardtime` int(10) NOT NULL,
  `balance` double(10,2) unsigned NOT NULL DEFAULT '0.00',
  `paypass` varchar(32) DEFAULT NULL,
  `twid` varchar(20) NOT NULL COMMENT '推广号',
  `username` varchar(32) NOT NULL COMMENT '账号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `city` varchar(40) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  `store_id` int(10) DEFAULT '0',
  `drp_cart` text NOT NULL COMMENT '分销系统-用户购物车',
  `regtime` varchar(20) NOT NULL DEFAULT '' COMMENT '注册时间',
  `fakeopenid` varchar(100) NOT NULL DEFAULT '',
  `issub` tinyint(1) NOT NULL DEFAULT '0',
  `isverify` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `twid` (`twid`),
  KEY `username` (`username`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tp_userinfo` */

insert  into `tp_userinfo`(`id`,`portrait`,`wallopen`,`total_score`,`expensetotal`,`token`,`wecha_id`,`wechaname`,`truename`,`tel`,`bornyear`,`bornmonth`,`bornday`,`qq`,`sex`,`age`,`birthday`,`address`,`info`,`sign_score`,`expend_score`,`continuous`,`add_expend`,`add_expend_time`,`live_time`,`getcardtime`,`balance`,`paypass`,`twid`,`username`,`password`,`city`,`province`,`store_id`,`drp_cart`,`regtime`,`fakeopenid`,`issub`,`isverify`) values (6,'',0,0,0,'','YUd1','','','','','','','',0,'','','','',0,0,0,0,0,0,0,0.00,NULL,'YUd1','libin','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,0,'','','',0,0);
insert  into `tp_userinfo`(`id`,`portrait`,`wallopen`,`total_score`,`expensetotal`,`token`,`wecha_id`,`wechaname`,`truename`,`tel`,`bornyear`,`bornmonth`,`bornday`,`qq`,`sex`,`age`,`birthday`,`address`,`info`,`sign_score`,`expend_score`,`continuous`,`add_expend`,`add_expend_time`,`live_time`,`getcardtime`,`balance`,`paypass`,`twid`,`username`,`password`,`city`,`province`,`store_id`,`drp_cart`,`regtime`,`fakeopenid`,`issub`,`isverify`) values (2,'',0,0,0,'','SlC2','','','','','','','',0,'','','','',0,0,0,0,0,0,0,0.00,NULL,'SlC2','zhang','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,0,'','','',0,0);
insert  into `tp_userinfo`(`id`,`portrait`,`wallopen`,`total_score`,`expensetotal`,`token`,`wecha_id`,`wechaname`,`truename`,`tel`,`bornyear`,`bornmonth`,`bornday`,`qq`,`sex`,`age`,`birthday`,`address`,`info`,`sign_score`,`expend_score`,`continuous`,`add_expend`,`add_expend_time`,`live_time`,`getcardtime`,`balance`,`paypass`,`twid`,`username`,`password`,`city`,`province`,`store_id`,`drp_cart`,`regtime`,`fakeopenid`,`issub`,`isverify`) values (3,'',0,0,0,'','KtM3','','','','','','','',0,'','','','',0,0,0,0,0,0,0,0.00,NULL,'KtM3','zhou1','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,0,'','','',0,0);
insert  into `tp_userinfo`(`id`,`portrait`,`wallopen`,`total_score`,`expensetotal`,`token`,`wecha_id`,`wechaname`,`truename`,`tel`,`bornyear`,`bornmonth`,`bornday`,`qq`,`sex`,`age`,`birthday`,`address`,`info`,`sign_score`,`expend_score`,`continuous`,`add_expend`,`add_expend_time`,`live_time`,`getcardtime`,`balance`,`paypass`,`twid`,`username`,`password`,`city`,`province`,`store_id`,`drp_cart`,`regtime`,`fakeopenid`,`issub`,`isverify`) values (4,'',0,0,0,'','rrR4','','','','','','','',0,'','','','',0,0,0,0,0,0,0,0.00,NULL,'rrR4','zhou2','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,0,'','','',0,0);
insert  into `tp_userinfo`(`id`,`portrait`,`wallopen`,`total_score`,`expensetotal`,`token`,`wecha_id`,`wechaname`,`truename`,`tel`,`bornyear`,`bornmonth`,`bornday`,`qq`,`sex`,`age`,`birthday`,`address`,`info`,`sign_score`,`expend_score`,`continuous`,`add_expend`,`add_expend_time`,`live_time`,`getcardtime`,`balance`,`paypass`,`twid`,`username`,`password`,`city`,`province`,`store_id`,`drp_cart`,`regtime`,`fakeopenid`,`issub`,`isverify`) values (1,'',0,0,0,'','Uhq5','','','','','','','',0,'','','','',0,0,0,0,0,0,0,0.00,NULL,'Uhq5','li1','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,0,'','','',0,0);
insert  into `tp_userinfo`(`id`,`portrait`,`wallopen`,`total_score`,`expensetotal`,`token`,`wecha_id`,`wechaname`,`truename`,`tel`,`bornyear`,`bornmonth`,`bornday`,`qq`,`sex`,`age`,`birthday`,`address`,`info`,`sign_score`,`expend_score`,`continuous`,`add_expend`,`add_expend_time`,`live_time`,`getcardtime`,`balance`,`paypass`,`twid`,`username`,`password`,`city`,`province`,`store_id`,`drp_cart`,`regtime`,`fakeopenid`,`issub`,`isverify`) values (5,'',0,0,0,'','NEY6','','','','','','','',0,'','','','',0,0,0,0,0,0,0,0.00,NULL,'NEY6','li2','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,0,'','','',0,0);
insert  into `tp_userinfo`(`id`,`portrait`,`wallopen`,`total_score`,`expensetotal`,`token`,`wecha_id`,`wechaname`,`truename`,`tel`,`bornyear`,`bornmonth`,`bornday`,`qq`,`sex`,`age`,`birthday`,`address`,`info`,`sign_score`,`expend_score`,`continuous`,`add_expend`,`add_expend_time`,`live_time`,`getcardtime`,`balance`,`paypass`,`twid`,`username`,`password`,`city`,`province`,`store_id`,`drp_cart`,`regtime`,`fakeopenid`,`issub`,`isverify`) values (8,'',0,0,0,'','wlu8','','','','','','','',0,'','','','',0,0,0,0,0,0,0,0.00,NULL,'wlu8','wan','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,0,'','','',0,0);
insert  into `tp_userinfo`(`id`,`portrait`,`wallopen`,`total_score`,`expensetotal`,`token`,`wecha_id`,`wechaname`,`truename`,`tel`,`bornyear`,`bornmonth`,`bornday`,`qq`,`sex`,`age`,`birthday`,`address`,`info`,`sign_score`,`expend_score`,`continuous`,`add_expend`,`add_expend_time`,`live_time`,`getcardtime`,`balance`,`paypass`,`twid`,`username`,`password`,`city`,`province`,`store_id`,`drp_cart`,`regtime`,`fakeopenid`,`issub`,`isverify`) values (9,'',0,0,0,'','uLU9','','','','','','','',0,'','','','',0,0,0,0,0,0,0,0.00,NULL,'uLU9','chen','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,0,'','','',0,0);

/*Table structure for table `tp_users` */

DROP TABLE IF EXISTS `tp_users`;

CREATE TABLE `tp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(80) NOT NULL DEFAULT '',
  `agentid` int(10) NOT NULL DEFAULT '0',
  `inviter` int(10) NOT NULL DEFAULT '0',
  `gid` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `mp` varchar(11) NOT NULL DEFAULT '',
  `smscount` int(10) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL,
  `email` varchar(90) NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `lasttime` varchar(13) NOT NULL,
  `status` varchar(1) NOT NULL,
  `createip` varchar(30) NOT NULL,
  `lastip` varchar(30) NOT NULL,
  `diynum` int(11) NOT NULL,
  `activitynum` int(11) unsigned NOT NULL DEFAULT '0',
  `card_num` int(11) NOT NULL,
  `card_create_status` tinyint(1) NOT NULL,
  `money` int(11) NOT NULL,
  `moneybalance` int(10) NOT NULL DEFAULT '0',
  `spend` int(5) NOT NULL DEFAULT '0',
  `viptime` varchar(13) NOT NULL,
  `connectnum` int(11) NOT NULL DEFAULT '0',
  `lastloginmonth` smallint(2) NOT NULL DEFAULT '0',
  `attachmentsize` int(10) NOT NULL DEFAULT '0',
  `wechat_card_num` int(3) NOT NULL,
  `serviceUserNum` tinyint(3) NOT NULL,
  `invitecode` varchar(6) NOT NULL DEFAULT '',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `business` char(20) NOT NULL DEFAULT 'other',
  `usertplid` tinyint(4) NOT NULL DEFAULT '1',
  `sysuser` int(11) NOT NULL,
  `is_syn` tinyint(4) NOT NULL DEFAULT '0',
  `source_domain` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='前台用户表';

/*Data for the table `tp_users` */

insert  into `tp_users`(`id`,`openid`,`agentid`,`inviter`,`gid`,`username`,`mp`,`smscount`,`password`,`email`,`createtime`,`lasttime`,`status`,`createip`,`lastip`,`diynum`,`activitynum`,`card_num`,`card_create_status`,`money`,`moneybalance`,`spend`,`viptime`,`connectnum`,`lastloginmonth`,`attachmentsize`,`wechat_card_num`,`serviceUserNum`,`invitecode`,`remark`,`business`,`usertplid`,`sysuser`,`is_syn`,`source_domain`) values (5,'',0,1,4,'libin','',0,'f379eaf3c831b04de153469d1bec345e','libinstar126@126.com','1467686678','1473816929','1','124.74.77.170','124.74.77.170',0,0,0,0,0,0,0,'1569772800',1,9,3122149,1,0,'rcfbqz','','estate',1,1,0,'');

/*Table structure for table `tp_wxuser` */

DROP TABLE IF EXISTS `tp_wxuser`;

CREATE TABLE `tp_wxuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routerid` varchar(50) NOT NULL DEFAULT '',
  `agentid` int(10) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `winxintype` smallint(2) NOT NULL DEFAULT '1',
  `aeskey` varchar(45) NOT NULL DEFAULT '',
  `encode` tinyint(1) NOT NULL DEFAULT '0',
  `appid` varchar(50) NOT NULL DEFAULT '',
  `appsecret` varchar(50) NOT NULL DEFAULT '',
  `wxid` varchar(20) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(20) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL,
  `pigsecret` varchar(150) NOT NULL DEFAULT '',
  `province` varchar(30) NOT NULL COMMENT '省',
  `city` varchar(60) NOT NULL COMMENT '市',
  `qq` char(25) NOT NULL COMMENT '公众号邮箱',
  `wxfans` int(11) NOT NULL COMMENT '微信粉丝',
  `typeid` int(11) NOT NULL COMMENT '分类ID',
  `typename` varchar(90) DEFAULT '0' COMMENT '分类名',
  `tongji` text NOT NULL,
  `allcardnum` int(11) NOT NULL,
  `cardisok` int(11) NOT NULL,
  `yetcardnum` int(11) NOT NULL,
  `totalcardnum` int(11) NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `tpltypeid` varchar(10) NOT NULL DEFAULT '1',
  `updatetime` varchar(13) NOT NULL,
  `tpltypename` varchar(20) NOT NULL COMMENT '首页模版名',
  `tpllistid` varchar(2) NOT NULL COMMENT '列表模版ID',
  `tpllistname` varchar(20) NOT NULL COMMENT '列表模版名',
  `tplcontentid` varchar(2) NOT NULL COMMENT '内容模版ID',
  `tplcontentname` varchar(20) NOT NULL COMMENT '内容模版名',
  `transfer_customer_service` tinyint(1) NOT NULL DEFAULT '0',
  `openphotoprint` tinyint(1) NOT NULL DEFAULT '0',
  `freephotocount` mediumint(4) NOT NULL DEFAULT '3',
  `oauth` tinyint(1) NOT NULL DEFAULT '0',
  `oauthinfo` tinyint(1) NOT NULL DEFAULT '1',
  `color_id` int(2) NOT NULL,
  `ifbiz` tinyint(1) DEFAULT '0',
  `fuwuappid` char(20) DEFAULT NULL,
  `share_ticket` varchar(150) NOT NULL,
  `share_dated` char(15) NOT NULL,
  `authorizer_access_token` varchar(200) NOT NULL,
  `authorizer_refresh_token` varchar(200) NOT NULL,
  `authorizer_expires` char(10) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `web_access_token` varchar(200) NOT NULL COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) NOT NULL,
  `web_expires` char(10) NOT NULL,
  `wx_coupons` tinyint(4) NOT NULL,
  `card_ticket` char(120) NOT NULL,
  `card_expires` char(15) NOT NULL,
  `wx_liaotian` tinyint(4) NOT NULL,
  `qr` varchar(200) NOT NULL,
  `dynamicTmpls` int(11) NOT NULL DEFAULT '0',
  `sub_notice` varchar(255) DEFAULT NULL,
  `need_phone_notice` varchar(255) DEFAULT NULL,
  `sub_notice_btn` varchar(60) DEFAULT NULL,
  `is_syn` tinyint(4) NOT NULL DEFAULT '0',
  `phone` text NOT NULL,
  `smsstatus` text NOT NULL,
  `smsuser` text NOT NULL,
  `smspassword` text NOT NULL,
  `email` text NOT NULL,
  `emailstatus` text NOT NULL,
  `emailuser` text NOT NULL,
  `emailpassword` text NOT NULL,
  `eqxpassword` varchar(32) NOT NULL,
  `eqx` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uid_2` (`uid`),
  KEY `agentid` (`agentid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tp_wxuser` */

insert  into `tp_wxuser`(`id`,`routerid`,`agentid`,`uid`,`wxname`,`winxintype`,`aeskey`,`encode`,`appid`,`appsecret`,`wxid`,`weixin`,`headerpic`,`token`,`pigsecret`,`province`,`city`,`qq`,`wxfans`,`typeid`,`typename`,`tongji`,`allcardnum`,`cardisok`,`yetcardnum`,`totalcardnum`,`createtime`,`tpltypeid`,`updatetime`,`tpltypename`,`tpllistid`,`tpllistname`,`tplcontentid`,`tplcontentname`,`transfer_customer_service`,`openphotoprint`,`freephotocount`,`oauth`,`oauthinfo`,`color_id`,`ifbiz`,`fuwuappid`,`share_ticket`,`share_dated`,`authorizer_access_token`,`authorizer_refresh_token`,`authorizer_expires`,`type`,`web_access_token`,`web_refresh_token`,`web_expires`,`wx_coupons`,`card_ticket`,`card_expires`,`wx_liaotian`,`qr`,`dynamicTmpls`,`sub_notice`,`need_phone_notice`,`sub_notice_btn`,`is_syn`,`phone`,`smsstatus`,`smsuser`,`smspassword`,`email`,`emailstatus`,`emailuser`,`emailpassword`,`eqxpassword`,`eqx`) values (5,'',0,5,'李斌测试',1,'ufHQYKXrsltutojOuRjgAPKhVXlAWFAqLhgKSebkpuF',0,'wxea7824d0b700eb14','1dde9309703b0190fac2f26912c02fd8','gh_d80980ea27a8','libinfortest','./tpl/User/default/common/images/portrait.jpg','hkzyaf1467686790','KKExdGHkgw4or2A1Efsf','p','c','1467686790@yourdomain.com',0,8,'','',10000,1,0,0,'1467687758','176','1467687758','1110_index_fxfg','1','yl_list','1','ktv_content',0,0,3,0,1,5,0,NULL,'','','','','',0,'','','',0,'','',0,'http://cms.3tiworld.com/uploads/a/admin/7/e/b/a/thumb_577b23130ba49.jpg',0,NULL,NULL,NULL,0,'','','','','','','','','','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
