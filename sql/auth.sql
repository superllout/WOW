/*
SQLyog Ultimate v9.63 
MySQL - 5.0.45-community-nt : Database - auth
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`auth` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'Identifier',
  `username` varchar(32) NOT NULL default '',
  `sha_pass_hash` varchar(40) NOT NULL default '',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `email` text,
  `joindate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `last_ip` varchar(30) NOT NULL default '127.0.0.1',
  `failed_logins` int(11) unsigned NOT NULL default '0',
  `locked` tinyint(3) unsigned NOT NULL default '0',
  `last_login` timestamp NOT NULL default '0000-00-00 00:00:00',
  `online` tinyint(4) NOT NULL default '0',
  `expansion` tinyint(3) unsigned NOT NULL default '3',
  `mutetime` bigint(40) unsigned NOT NULL default '0',
  `locale` tinyint(3) unsigned NOT NULL default '0',
  `recruiter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account System';

/*Data for the table `account` */

insert  into `account`(`id`,`username`,`sha_pass_hash`,`sessionkey`,`v`,`s`,`email`,`joindate`,`last_ip`,`failed_logins`,`locked`,`last_login`,`online`,`expansion`,`mutetime`,`locale`,`recruiter`) values (1,'ADMINISTRATOR','9169FBEAB7D28129D1BD37D060963F9D7C829221','6F440D901A47C4F87C411F7DD2BF95BA32696A1F1C0A14CCA7CA73CDD633A5C2DCFD079DDDA0D53F','39D6457B2B9FD73B06B789153896010D5F4FC14700219B36EB8F473C65758469','A3F92394768CF0B70D5D0FC9BB2DF43A9E0C02DC19316CFD04DA1E42B3A81E11',NULL,'2012-12-09 22:23:20','127.0.0.1',0,0,'2012-12-29 18:08:34',0,3,0,0,0),(2,'GAMEMASTER','EC5A62C247F9BFFC475864E97DB465C1C834EC97','C2BC56D5137029298E44864D714971666B867BEE0F7478874F2A67FEEBD160C63017735B53D626FB','3A4E2417F35078AD1D36337E3DAC122BDAAE9E0DAAEB42B9B7B89452CD3497A4','A15B51EB915975F1B9E6FAC7EA1902355E7E16CFAFDAA696EC8944C2B6D98C1D',NULL,'2012-12-14 20:19:05','127.0.0.1',0,0,'2012-12-29 17:42:17',0,3,0,0,0),(3,'PLAYER','F3D332B44DA3D0F3A3A695C737680EB4B5DBCEFF','068339910C00E2E5A819A2142C5F7B1D47F1801261F23571B07583B2B5DCCBD29CE54F15C1A002CF','4D5F8A64EE438FDAEE1B39A982570F0C5EC1A6413AA3BF902DF514CA397D11F4','A6946507C7042116C2A3A9F4E6CF958D9652690A20263A35E94E1872A2053EC3',NULL,'2012-12-21 08:28:37','127.0.0.1',0,0,'2012-12-27 23:11:48',0,3,0,0,0);

/*Table structure for table `account_access` */

DROP TABLE IF EXISTS `account_access`;

CREATE TABLE `account_access` (
  `id` int(11) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL default '-1',
  PRIMARY KEY  (`id`,`RealmID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `account_access` */

insert  into `account_access`(`id`,`gmlevel`,`RealmID`) values (1,6,-1);

/*Table structure for table `account_banned` */

DROP TABLE IF EXISTS `account_banned`;

CREATE TABLE `account_banned` (
  `id` int(11) NOT NULL default '0' COMMENT 'Account id',
  `bandate` bigint(40) NOT NULL default '0',
  `unbandate` bigint(40) NOT NULL default '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ban List';

/*Data for the table `account_banned` */

/*Table structure for table `account_premium` */

DROP TABLE IF EXISTS `account_premium`;

CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL default '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL default '0',
  `unsetdate` bigint(40) NOT NULL default '0',
  `premium_type` tinyint(4) unsigned NOT NULL default '1',
  `active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`,`setdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Premium Accounts';

/*Data for the table `account_premium` */

/*Table structure for table `ip_banned` */

DROP TABLE IF EXISTS `ip_banned`;

CREATE TABLE `ip_banned` (
  `ip` varchar(32) NOT NULL default '127.0.0.1',
  `bandate` bigint(40) NOT NULL,
  `unbandate` bigint(40) NOT NULL,
  `bannedby` varchar(50) NOT NULL default '[Console]',
  `banreason` varchar(255) NOT NULL default 'no reason',
  PRIMARY KEY  (`ip`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';

/*Data for the table `ip_banned` */

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `time` int(14) NOT NULL,
  `realm` int(4) NOT NULL,
  `type` int(4) NOT NULL,
  `string` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `logs` */

/*Table structure for table `realmcharacters` */

DROP TABLE IF EXISTS `realmcharacters`;

CREATE TABLE `realmcharacters` (
  `realmid` int(11) unsigned NOT NULL default '0',
  `acctid` bigint(20) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm Character Tracker';

/*Data for the table `realmcharacters` */

insert  into `realmcharacters`(`realmid`,`acctid`,`numchars`) values (1,1,2),(1,2,2),(1,3,1);

/*Table structure for table `realmlist` */

DROP TABLE IF EXISTS `realmlist`;

CREATE TABLE `realmlist` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL default '',
  `address` varchar(32) NOT NULL default '127.0.0.1',
  `port` int(11) NOT NULL default '8085',
  `icon` tinyint(3) unsigned NOT NULL default '0',
  `color` tinyint(3) unsigned NOT NULL default '2',
  `timezone` tinyint(3) unsigned NOT NULL default '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL default '0',
  `population` float unsigned NOT NULL default '0',
  `online` int(11) NOT NULL default '0',
  `gamebuild` int(11) unsigned NOT NULL default '13623',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm System';

/*Data for the table `realmlist` */

insert  into `realmlist`(`id`,`name`,`address`,`port`,`icon`,`color`,`timezone`,`allowedSecurityLevel`,`population`,`online`,`gamebuild`) values (1,'ArkCORE','127.0.0.1',8085,0,0,1,0,0,1,13623);

/*Table structure for table `uptime` */

DROP TABLE IF EXISTS `uptime`;

CREATE TABLE `uptime` (
  `realmid` int(11) unsigned NOT NULL,
  `starttime` bigint(20) unsigned NOT NULL default '0',
  `startstring` varchar(64) NOT NULL default '',
  `uptime` bigint(20) unsigned NOT NULL default '0',
  `maxplayers` smallint(5) unsigned NOT NULL default '0',
  `revision` varchar(255) NOT NULL default 'Trinitycore',
  PRIMARY KEY  (`realmid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Uptime system';

/*Data for the table `uptime` */

insert  into `uptime`(`realmid`,`starttime`,`startstring`,`uptime`,`maxplayers`,`revision`) values (1,1355088192,'2012-12-09 13:23:12',2400,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355510783,'2012-12-14 19:46:23',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355512471,'2012-12-14 20:14:31',1801,2,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355514737,'2012-12-14 20:52:17',601,2,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355563323,'2012-12-15 10:22:03',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355563578,'2012-12-15 10:26:18',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355563892,'2012-12-15 10:31:32',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355564945,'2012-12-15 10:49:05',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355565451,'2012-12-15 10:57:31',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355565755,'2012-12-15 11:02:35',6000,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355572732,'2012-12-15 12:58:52',601,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355574069,'2012-12-15 13:21:09',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355574934,'2012-12-15 13:35:34',1201,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355577053,'2012-12-15 14:10:53',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355577308,'2012-12-15 14:15:08',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355578334,'2012-12-15 14:32:14',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355578824,'2012-12-15 14:40:24',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355579206,'2012-12-15 14:46:46',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355579670,'2012-12-15 14:54:30',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355581957,'2012-12-15 15:32:37',2401,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355586612,'2012-12-15 16:50:12',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355587306,'2012-12-15 17:01:46',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355590123,'2012-12-15 17:48:43',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355590245,'2012-12-15 17:50:45',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355591297,'2012-12-15 18:08:17',1200,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355592899,'2012-12-15 18:34:59',1800,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355594931,'2012-12-15 19:08:51',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355595617,'2012-12-15 19:20:17',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355596466,'2012-12-15 19:34:26',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355597074,'2012-12-15 19:44:34',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355597311,'2012-12-15 19:48:31',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355597489,'2012-12-15 19:51:29',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355598407,'2012-12-15 20:06:47',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355598572,'2012-12-15 20:09:32',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355599007,'2012-12-15 20:16:47',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355599612,'2012-12-15 20:26:52',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355600258,'2012-12-15 20:37:38',1200,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355601913,'2012-12-15 21:05:13',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355602015,'2012-12-15 21:06:55',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355602117,'2012-12-15 21:08:37',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355602278,'2012-12-15 21:11:18',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355602497,'2012-12-15 21:14:57',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355602677,'2012-12-15 21:17:57',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355602847,'2012-12-15 21:20:47',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355603253,'2012-12-15 21:27:33',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355603322,'2012-12-15 21:28:42',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355603532,'2012-12-15 21:32:12',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355603767,'2012-12-15 21:36:07',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355604784,'2012-12-15 21:53:04',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355605369,'2012-12-15 22:02:49',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355606393,'2012-12-15 22:19:53',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355606658,'2012-12-15 22:24:18',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355606814,'2012-12-15 22:26:54',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355607417,'2012-12-15 22:36:57',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355607503,'2012-12-15 22:38:23',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355607977,'2012-12-15 22:46:17',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355608293,'2012-12-15 22:51:33',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355608397,'2012-12-15 22:53:17',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355608657,'2012-12-15 22:57:37',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355609041,'2012-12-15 23:04:01',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355609247,'2012-12-15 23:07:27',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355610960,'2012-12-15 23:36:00',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355611844,'2012-12-15 23:50:44',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355612283,'2012-12-15 23:58:03',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355612964,'2012-12-16 00:09:24',601,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355614084,'2012-12-16 00:28:04',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355659800,'2012-12-16 13:10:00',1200,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355661099,'2012-12-16 13:31:39',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355661534,'2012-12-16 13:38:54',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355661737,'2012-12-16 13:42:17',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355661878,'2012-12-16 13:44:38',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355662441,'2012-12-16 13:54:01',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355662744,'2012-12-16 13:59:04',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355668699,'2012-12-16 15:38:19',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355668931,'2012-12-16 15:42:11',1200,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355670395,'2012-12-16 16:06:35',1800,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355672309,'2012-12-16 16:38:29',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355672640,'2012-12-16 16:44:00',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355672758,'2012-12-16 16:45:58',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355676743,'2012-12-16 17:52:23',1800,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355678590,'2012-12-16 18:23:10',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355679154,'2012-12-16 18:32:34',600,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355679789,'2012-12-16 18:43:09',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355680426,'2012-12-16 18:53:46',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355680689,'2012-12-16 18:58:09',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355681100,'2012-12-16 19:05:00',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355681530,'2012-12-16 19:12:10',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355682730,'2012-12-16 19:32:10',5400,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355688353,'2012-12-16 21:05:53',1200,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355689773,'2012-12-16 21:29:33',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355690312,'2012-12-16 21:38:32',600,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355691032,'2012-12-16 21:50:32',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355691312,'2012-12-16 21:55:12',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355691598,'2012-12-16 21:59:58',600,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355692361,'2012-12-16 22:12:41',1200,1,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355694706,'2012-12-16 22:51:46',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355698777,'2012-12-16 23:59:37',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355699319,'2012-12-17 00:08:39',0,0,'Project Mirage rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355700541,'2012-12-17 00:29:01',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355735279,'2012-12-17 10:07:59',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355736154,'2012-12-17 10:22:34',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355739513,'2012-12-17 11:18:33',1800,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355741581,'2012-12-17 11:53:01',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355742582,'2012-12-17 12:09:42',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355743451,'2012-12-17 12:24:11',1200,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355746458,'2012-12-17 13:14:18',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355747094,'2012-12-17 13:24:54',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355753148,'2012-12-17 15:05:48',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355756939,'2012-12-17 16:08:59',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355774032,'2012-12-17 20:53:52',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355774648,'2012-12-17 21:04:08',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355774850,'2012-12-17 21:07:30',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355833362,'2012-12-18 13:22:42',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355847898,'2012-12-18 17:24:58',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355848461,'2012-12-18 17:34:21',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355848857,'2012-12-18 17:40:57',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355850083,'2012-12-18 18:01:23',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355851206,'2012-12-18 18:20:06',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355851492,'2012-12-18 18:24:52',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355851581,'2012-12-18 18:26:21',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355852076,'2012-12-18 18:34:36',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1355949213,'2012-12-19 21:33:33',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356014909,'2012-12-20 15:48:29',1201,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356073328,'2012-12-21 08:02:08',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356074522,'2012-12-21 08:22:02',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356250602,'2012-12-23 09:16:42',1201,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356252582,'2012-12-23 09:49:42',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356274061,'2012-12-23 15:47:41',1201,2,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356276332,'2012-12-23 16:25:32',604,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356277215,'2012-12-23 16:40:15',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356279018,'2012-12-23 17:10:18',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356279272,'2012-12-23 17:14:32',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356279438,'2012-12-23 17:17:18',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356279535,'2012-12-23 17:18:55',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356280039,'2012-12-23 17:27:19',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356280267,'2012-12-23 17:31:07',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356281172,'2012-12-23 17:46:12',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356281440,'2012-12-23 17:50:40',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356281862,'2012-12-23 17:57:42',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356283329,'2012-12-23 18:22:09',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356284774,'2012-12-23 18:46:14',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356285145,'2012-12-23 18:52:25',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356294771,'2012-12-23 21:32:51',1801,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356295286,'2012-12-23 21:41:26',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356303583,'2012-12-23 23:59:43',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356304246,'2012-12-24 00:10:46',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356307762,'2012-12-24 01:09:22',602,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356309513,'2012-12-24 01:38:33',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356342845,'2012-12-24 10:54:05',3001,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356346444,'2012-12-24 11:54:04',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356346602,'2012-12-24 11:56:42',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356346739,'2012-12-24 11:58:59',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356354342,'2012-12-24 14:05:42',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356354894,'2012-12-24 14:14:54',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356355601,'2012-12-24 14:26:41',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356355789,'2012-12-24 14:29:49',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356355989,'2012-12-24 14:33:09',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356356450,'2012-12-24 14:40:50',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356356745,'2012-12-24 14:45:45',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356356911,'2012-12-24 14:48:31',1200,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356358204,'2012-12-24 15:10:04',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356358496,'2012-12-24 15:14:56',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356358865,'2012-12-24 15:21:05',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356363305,'2012-12-24 16:35:05',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356363434,'2012-12-24 16:37:14',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356363921,'2012-12-24 16:45:21',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356365058,'2012-12-24 17:04:18',1200,2,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356367751,'2012-12-24 17:49:11',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356384639,'2012-12-24 22:30:39',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356384783,'2012-12-24 22:33:03',2400,3,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356387740,'2012-12-24 23:22:20',1200,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356442304,'2012-12-25 14:31:44',602,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356443349,'2012-12-25 14:49:09',601,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356444380,'2012-12-25 15:06:20',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356444665,'2012-12-25 15:11:05',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356444760,'2012-12-25 15:12:40',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356444928,'2012-12-25 15:15:28',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356445463,'2012-12-25 15:24:23',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356547556,'2012-12-26 19:45:56',9604,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356557464,'2012-12-26 22:31:04',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356559027,'2012-12-26 22:57:07',1800,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356561704,'2012-12-26 23:41:44',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356561906,'2012-12-26 23:45:06',1200,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356563551,'2012-12-27 00:12:31',1200,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356565233,'2012-12-27 00:40:33',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356630756,'2012-12-27 18:52:36',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356631331,'2012-12-27 19:02:11',1200,3,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356632891,'2012-12-27 19:28:11',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356633140,'2012-12-27 19:32:20',600,3,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356633787,'2012-12-27 19:43:07',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356633860,'2012-12-27 19:44:20',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356633963,'2012-12-27 19:46:03',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356634093,'2012-12-27 19:48:13',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356634264,'2012-12-27 19:51:04',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356634562,'2012-12-27 19:56:02',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356635369,'2012-12-27 20:09:29',10200,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356646214,'2012-12-27 23:10:14',600,3,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356794829,'2012-12-29 16:27:09',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356795237,'2012-12-29 16:33:57',600,1,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356799029,'2012-12-29 17:37:09',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356799304,'2012-12-29 17:41:44',600,2,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356800356,'2012-12-29 17:59:16',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1356800911,'2012-12-29 18:08:31',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1357670424,'2013-01-08 22:40:24',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),(1,1360352796,'2013-02-08 23:46:36',0,0,'ArkCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
