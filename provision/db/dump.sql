CREATE DATABASE  IF NOT EXISTS `scotchbox` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `scotchbox`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: scotchbox
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `dle_admin_logs`
--

DROP TABLE IF EXISTS `dle_admin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_admin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '',
  `action` int(11) NOT NULL DEFAULT '0',
  `extras` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_admin_logs`
--

LOCK TABLES `dle_admin_logs` WRITE;
/*!40000 ALTER TABLE `dle_admin_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_admin_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_admin_sections`
--

DROP TABLE IF EXISTS `dle_admin_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_admin_sections` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `descr` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `allow_groups` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_admin_sections`
--

LOCK TABLES `dle_admin_sections` WRITE;
/*!40000 ALTER TABLE `dle_admin_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_admin_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_banned`
--

DROP TABLE IF EXISTS `dle_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_banned` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `users_id` mediumint(8) NOT NULL DEFAULT '0',
  `descr` text NOT NULL,
  `date` varchar(15) NOT NULL DEFAULT '',
  `days` smallint(4) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_banned`
--

LOCK TABLES `dle_banned` WRITE;
/*!40000 ALTER TABLE `dle_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_banners`
--

DROP TABLE IF EXISTS `dle_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_banners` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `banner_tag` varchar(40) NOT NULL DEFAULT '',
  `descr` varchar(200) NOT NULL DEFAULT '',
  `code` text NOT NULL,
  `approve` tinyint(1) NOT NULL DEFAULT '0',
  `short_place` tinyint(1) NOT NULL DEFAULT '0',
  `bstick` tinyint(1) NOT NULL DEFAULT '0',
  `main` tinyint(1) NOT NULL DEFAULT '0',
  `category` varchar(255) NOT NULL DEFAULT '',
  `grouplevel` varchar(100) NOT NULL DEFAULT 'all',
  `start` varchar(15) NOT NULL DEFAULT '',
  `end` varchar(15) NOT NULL DEFAULT '',
  `fpage` tinyint(1) NOT NULL DEFAULT '0',
  `innews` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_banners`
--

LOCK TABLES `dle_banners` WRITE;
/*!40000 ALTER TABLE `dle_banners` DISABLE KEYS */;
INSERT INTO `dle_banners` VALUES (1,'header','Верхний баннер','<div align=\"center\"><a href=\"http://dle-news.ru/\" target=\"_blank\"><img src=\"http://192.168.33.20/templates/Default/images/_banner_.gif\" style=\"border: none;\" alt=\"\" /></a></div>',1,0,0,0,'0','all','','',0,0);
/*!40000 ALTER TABLE `dle_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_category`
--

DROP TABLE IF EXISTS `dle_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_category` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `parentid` mediumint(8) NOT NULL DEFAULT '0',
  `posi` mediumint(8) NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL DEFAULT '',
  `alt_name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(200) NOT NULL DEFAULT '',
  `skin` varchar(50) NOT NULL DEFAULT '',
  `descr` varchar(200) NOT NULL DEFAULT '',
  `keywords` text NOT NULL,
  `news_sort` varchar(10) NOT NULL DEFAULT '',
  `news_msort` varchar(4) NOT NULL DEFAULT '',
  `news_number` smallint(5) NOT NULL DEFAULT '0',
  `short_tpl` varchar(40) NOT NULL DEFAULT '',
  `full_tpl` varchar(40) NOT NULL DEFAULT '',
  `metatitle` varchar(255) NOT NULL DEFAULT '',
  `show_sub` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_category`
--

LOCK TABLES `dle_category` WRITE;
/*!40000 ALTER TABLE `dle_category` DISABLE KEYS */;
INSERT INTO `dle_category` VALUES (1,0,1,'Информация','main','','','','','','',0,'','','',0);
/*!40000 ALTER TABLE `dle_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_comments`
--

DROP TABLE IF EXISTS `dle_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `autor` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `ip` varchar(16) NOT NULL DEFAULT '',
  `is_register` tinyint(1) NOT NULL DEFAULT '0',
  `approve` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `approve` (`approve`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_comments`
--

LOCK TABLES `dle_comments` WRITE;
/*!40000 ALTER TABLE `dle_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_complaint`
--

DROP TABLE IF EXISTS `dle_complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_complaint` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL DEFAULT '0',
  `c_id` int(11) NOT NULL DEFAULT '0',
  `n_id` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `from` varchar(40) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`),
  KEY `p_id` (`p_id`),
  KEY `n_id` (`n_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_complaint`
--

LOCK TABLES `dle_complaint` WRITE;
/*!40000 ALTER TABLE `dle_complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_email`
--

DROP TABLE IF EXISTS `dle_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_email` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_email`
--

LOCK TABLES `dle_email` WRITE;
/*!40000 ALTER TABLE `dle_email` DISABLE KEYS */;
INSERT INTO `dle_email` VALUES (1,'reg_mail','{%username%},\r\n\r\nЭто письмо отправлено с сайта http://192.168.33.20/\r\n\r\nВы получили это письмо, так как этот e-mail адрес был использован при регистрации на сайте. Если Вы не регистрировались на этом сайте, просто проигнорируйте это письмо и удалите его. Вы больше не получите такого письма.\r\n\r\n------------------------------------------------\r\nВаш логин и пароль на сайте:\r\n------------------------------------------------\r\n\r\nЛогин: {%username%}\r\nПароль: {%password%}\r\n\r\n------------------------------------------------\r\nИнструкция по активации\r\n------------------------------------------------\r\n\r\nБлагодарим Вас за регистрацию.\r\nМы требуем от Вас подтверждения Вашей регистрации, для проверки того, что введённый Вами e-mail адрес - реальный. Это требуется для защиты от нежелательных злоупотреблений и спама.\r\n\r\nДля активации Вашего аккаунта, зайдите по следующей ссылке:\r\n\r\n{%validationlink%}\r\n\r\nЕсли и при этих действиях ничего не получилось, возможно Ваш аккаунт удалён. В этом случае, обратитесь к Администратору, для разрешения проблемы.\r\n\r\nС уважением,\r\n\r\nАдминистрация http://192.168.33.20/.'),(2,'feed_mail','{%username_to%},\r\n\r\nДанное письмо вам отправил {%username_from%} с сайта http://192.168.33.20/\r\n\r\n------------------------------------------------\r\nТекст сообщения\r\n------------------------------------------------\r\n\r\n{%text%}\r\n\r\nIP адрес отправителя: {%ip%}\r\n\r\n------------------------------------------------\r\nПомните, что администрация сайта не несет ответственности за содержание данного письма\r\n\r\nС уважением,\r\n\r\nАдминистрация http://192.168.33.20/'),(3,'lost_mail','Уважаемый {%username%},\r\n\r\nВы сделали запрос на получение забытого пароля на сайте http://192.168.33.20/ Однако в целях безопасности все пароли хранятся в зашифрованном виде, поэтому мы не можем сообщить вам ваш старый пароль, поэтому если вы хотите сгенерировать новый пароль, зайдите по следующей ссылке: \r\n\r\n{%lostlink%}\r\n\r\nЕсли вы не делали запроса для получения пароля, то просто удалите данное письмо, ваш пароль храниться в надежном месте, и недоступен посторонним лицам.\r\n\r\nIP адрес отправителя: {%ip%}\r\n\r\nС уважением,\r\n\r\nАдминистрация http://192.168.33.20/'),(4,'new_news','Уважаемый администратор,\r\n\r\nуведомляем вас о том, что на сайт  http://192.168.33.20/ была добавлена новость, которая в данный момент ожидает модерации.\r\n\r\n------------------------------------------------\r\nКраткая информация о новости\r\n------------------------------------------------\r\n\r\nАвтор: {%username%}\r\nЗаголовок новости: {%title%}\r\nКатегория: {%category%}\r\nДата добавления: {%date%}\r\n\r\nС уважением,\r\n\r\nАдминистрация http://192.168.33.20/'),(5,'comments','Уважаемый {%username_to%},\r\n\r\nуведомляем вас о том, что на сайт  http://192.168.33.20/ был добавлен комментарий к новости, на которую вы были подписаны.\r\n\r\n------------------------------------------------\r\nКраткая информация о комментарии\r\n------------------------------------------------\r\n\r\nАвтор: {%username%}\r\nДата добавления: {%date%}\r\nСсылка на новость: {%link%}\r\n\r\n------------------------------------------------\r\nТекст комментария\r\n------------------------------------------------\r\n\r\n{%text%}\r\n\r\n------------------------------------------------\r\n\r\nЕсли вы не хотите больше получать уведомлений о новых комментариях к данной новости, то проследуйте по данной ссылке: {%unsubscribe%}\r\n\r\nС уважением,\r\n\r\nАдминистрация http://192.168.33.20/'),(6,'pm','Уважаемый {%username%},\r\n\r\nуведомляем вас о том, что на сайте  http://192.168.33.20/ вам было отправлено персональное сообщение.\r\n\r\n------------------------------------------------\r\nКраткая информация о сообщении\r\n------------------------------------------------\r\n\r\nОтправитель: {%fromusername%}\r\nДата  получения: {%date%}\r\nЗаголовок: {%title%}\r\n\r\n------------------------------------------------\r\nТекст сообщения\r\n------------------------------------------------\r\n\r\n{%text%}\r\n\r\nС уважением,\r\n\r\nАдминистрация http://192.168.33.20/');
/*!40000 ALTER TABLE `dle_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_files`
--

DROP TABLE IF EXISTS `dle_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_files` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `news_id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL DEFAULT '',
  `onserver` varchar(250) NOT NULL DEFAULT '',
  `author` varchar(40) NOT NULL DEFAULT '',
  `date` varchar(15) NOT NULL DEFAULT '',
  `dcount` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_files`
--

LOCK TABLES `dle_files` WRITE;
/*!40000 ALTER TABLE `dle_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_flood`
--

DROP TABLE IF EXISTS `dle_flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_flood` (
  `f_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL DEFAULT '',
  `id` varchar(20) NOT NULL DEFAULT '',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`f_id`),
  KEY `ip` (`ip`),
  KEY `id` (`id`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_flood`
--

LOCK TABLES `dle_flood` WRITE;
/*!40000 ALTER TABLE `dle_flood` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_flood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_ignore_list`
--

DROP TABLE IF EXISTS `dle_ignore_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_ignore_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `user_from` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `user_from` (`user_from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_ignore_list`
--

LOCK TABLES `dle_ignore_list` WRITE;
/*!40000 ALTER TABLE `dle_ignore_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_ignore_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_images`
--

DROP TABLE IF EXISTS `dle_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `images` text NOT NULL,
  `news_id` int(10) NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL DEFAULT '',
  `date` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_images`
--

LOCK TABLES `dle_images` WRITE;
/*!40000 ALTER TABLE `dle_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_links`
--

DROP TABLE IF EXISTS `dle_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `only_one` tinyint(1) NOT NULL DEFAULT '0',
  `replacearea` tinyint(1) NOT NULL DEFAULT '1',
  `rcount` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_links`
--

LOCK TABLES `dle_links` WRITE;
/*!40000 ALTER TABLE `dle_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_login_log`
--

DROP TABLE IF EXISTS `dle_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(16) NOT NULL DEFAULT '',
  `count` smallint(6) NOT NULL DEFAULT '0',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_login_log`
--

LOCK TABLES `dle_login_log` WRITE;
/*!40000 ALTER TABLE `dle_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_logs`
--

DROP TABLE IF EXISTS `dle_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) NOT NULL DEFAULT '0',
  `member` varchar(40) NOT NULL DEFAULT '',
  `ip` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `member` (`member`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_logs`
--

LOCK TABLES `dle_logs` WRITE;
/*!40000 ALTER TABLE `dle_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_lostdb`
--

DROP TABLE IF EXISTS `dle_lostdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_lostdb` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `lostname` mediumint(8) NOT NULL DEFAULT '0',
  `lostid` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lostid` (`lostid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_lostdb`
--

LOCK TABLES `dle_lostdb` WRITE;
/*!40000 ALTER TABLE `dle_lostdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_lostdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_mail_log`
--

DROP TABLE IF EXISTS `dle_mail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_mail_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `mail` varchar(50) NOT NULL DEFAULT '',
  `hash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_mail_log`
--

LOCK TABLES `dle_mail_log` WRITE;
/*!40000 ALTER TABLE `dle_mail_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_mail_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_notice`
--

DROP TABLE IF EXISTS `dle_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_notice` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `notice` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_notice`
--

LOCK TABLES `dle_notice` WRITE;
/*!40000 ALTER TABLE `dle_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_pm`
--

DROP TABLE IF EXISTS `dle_pm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_pm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subj` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `user` mediumint(8) NOT NULL DEFAULT '0',
  `user_from` varchar(40) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `pm_read` tinyint(1) NOT NULL DEFAULT '0',
  `folder` varchar(10) NOT NULL DEFAULT '',
  `reply` tinyint(1) NOT NULL DEFAULT '0',
  `sendid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `folder` (`folder`),
  KEY `user` (`user`),
  KEY `user_from` (`user_from`),
  KEY `pm_read` (`pm_read`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_pm`
--

LOCK TABLES `dle_pm` WRITE;
/*!40000 ALTER TABLE `dle_pm` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_pm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_poll`
--

DROP TABLE IF EXISTS `dle_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_poll` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `frage` varchar(200) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `votes` mediumint(8) NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_poll`
--

LOCK TABLES `dle_poll` WRITE;
/*!40000 ALTER TABLE `dle_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_poll_log`
--

DROP TABLE IF EXISTS `dle_poll_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_poll_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_poll_log`
--

LOCK TABLES `dle_poll_log` WRITE;
/*!40000 ALTER TABLE `dle_poll_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_poll_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_post`
--

DROP TABLE IF EXISTS `dle_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autor` varchar(40) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `short_story` text NOT NULL,
  `full_story` text NOT NULL,
  `xfields` text NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `descr` varchar(200) NOT NULL DEFAULT '',
  `keywords` text NOT NULL,
  `category` varchar(200) NOT NULL DEFAULT '0',
  `alt_name` varchar(200) NOT NULL DEFAULT '',
  `comm_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comm` tinyint(1) NOT NULL DEFAULT '1',
  `allow_main` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `approve` tinyint(1) NOT NULL DEFAULT '0',
  `fixed` tinyint(1) NOT NULL DEFAULT '0',
  `allow_br` tinyint(1) NOT NULL DEFAULT '1',
  `symbol` varchar(3) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `metatitle` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `autor` (`autor`),
  KEY `alt_name` (`alt_name`),
  KEY `category` (`category`),
  KEY `approve` (`approve`),
  KEY `allow_main` (`allow_main`),
  KEY `date` (`date`),
  KEY `symbol` (`symbol`),
  KEY `comm_num` (`comm_num`),
  KEY `tags` (`tags`),
  KEY `fixed` (`fixed`),
  FULLTEXT KEY `short_story` (`short_story`,`full_story`,`xfields`,`title`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_post`
--

LOCK TABLES `dle_post` WRITE;
/*!40000 ALTER TABLE `dle_post` DISABLE KEYS */;
INSERT INTO `dle_post` VALUES (1,'admin','2017-03-30 09:16:31','<div align=\"center\"><img src=\"http://192.168.33.20/uploads/boxsmall.jpg\" alt=\"\" /></div>Добро пожаловать на демонстрационную страницу движка DataLife Engine. DataLife Engine это многопользовательский новостной движок, обладающий большими функциональными возможностями. Движок предназначен в первую очередь для создание новостных блогов и сайтов с большим информационным контекстом. Однако он имеет большое количество настроек, которые позволяют использовать его практически для любых целей. Движок может быть интегрирован практически в любой существующий дизайн, и не имеет никаких ограничений по созданию шаблонов для него. Еще одной ключевой особенностью DataLife Engine является низкая нагрузка на системные ресурсы, Даже при очень большой аудитории сайта нагрузка не сервер будет минимальной, и вы не будете испытывать каких-либо проблем с отображением информации. Движок оптимизирован под поисковые системы. Обо всех функциональных особенностях вы сможете прочитать на <a href=\"http://dle-news.ru/\" target=\"_blank\">нашей странице</a>.<br /><br />Обсуждение скрипта по всем вопросам ведется <a href=\"http://forum.dle-news.ru/index.php\" target=\"_blank\">здесь</a>. Так же там Вы сможете получить оперативную помощь.','','','Добро пожаловать','','','1','post1',0,1,1,1,0,1,'','по, новости',''),(2,'admin','2017-03-30 09:16:11','Уважаемые вебмастера хотим для вас сделать небольшое дополнение. Прежде чем обратиться с каким-либо вопросом в службу поддержки скрипта, убедитесь что вы тщательно прочитали документацию по скрипту и не нашли там для вас необходимого ответа. Мы оставляем за собой право игнорировать вопросы, поступившие к нам от пользователей, использующих некоммерческую версию скрипта или не оплативших лицензию, включающую в себя службу технической поддержки. Вы можете приобрести один из двух типов лицензии на DataLife Engine по вашему желанию:<br /><br />- <b>Базовая лицензия.</b> Стоимость данной лицензии составляет: <span style=\"color:red\">59$</span>. При приобретении данной лицензии вы также получаете возможность получения бесплатно новых версий скрипта в течении <b>одного года</b>.<br /><br />- <b>Расширенная лицензия.</b> Стоимость данной лицензии составляет: <span style=\"color:red\">78$</span>. При приобретении данной лицензии вы получаете все что входит в базовую лицензию, а также дополнительно входит служба технической поддержки скрипта и разрешение на снятие копирайтов на скрипт с пользовательской части (видимой для обычных посетителей сайта).<br /><br /><b>Срок действия лицензии</b> составляет <span style=\"color:#FF0000\">1 год</span>, в течении которого вы бесплатно будете получать все последующие версии скрипта и обновления, а в случае приобретения расширенной лицензии, и тех. поддержку. После окончания срока лицензии вы можете ее продлить, либо использовать пожизненно бесплатно актуальную на тот момент времени версию скрипта. В случае если вы захотите продлить лицензию для получения новых версий скрипта, то стоимость продления лицензии на год, составляет <span style=\"color:red\">39$</span><br /><br /><b>Как оплатить скрипт вы можете прочитать на</b> <a href=\"http://dle-news.ru/price.html\" target=\"_blank\">http://dle-news.ru/price.html</a><br /><br />Помните что лицензия выдается только на один домен (проект) и не может использоваться на других сайтах, а также запрещена передача вашего файла лицензии третьим лицам.<br /><br /><b>С уважением,<br /><br />SoftNews Media Group</b>','','','Приобретение и оплата скрипта','','','1','post2',0,1,1,1,0,1,'','по, новости',''),(3,'admin','2017-03-30 09:15:41','<br /><div align=\"center\"><a href=\"http://www.dletemplates.com/\" target=\"_blank\"><img src=\"http://192.168.33.20/uploads/dlelogo.gif\" alt=\"\" /></a></div><br />Совместно с нашими партнерами <a href=\"http://www.dletemplates.com/\" target=\"_blank\">www.dletemplates.com</a> мы рады предложить вам  также высококачественные шаблоны, специально подготовленные для использования под управлением DataLife Engine. Предлагаемые шаблоны созданы на высоком качественном уровне опытными дизайнерами и программистами. Каждый из предлагаемых шаблонов полностью настроен и готов к использованию сразу же после его установки на сервер. Помимо того что все шаблоны уже подготовлены к использованию на портале, вы получаете также все исходные материалы, которые были использованы при создании шаблона.<br /><br />Если вы еще только раздумываете как будет выглядеть ваш сайт и желаете воспользоваться услугами профессионалов по вполне разумным ценам, то мы рекомендуем вам обратиться к нашим партнерам <a href=\"http://www.dletemplates.com/\" target=\"_blank\">www.dletemplates.com</a>, которые в сжатые строки создадут для вас персональный макет вашего сайта, а также подготовят его непосредственно к работе с движком. Также на сайте оказываются услуги по интеграции уже готового Вашего макета в движок.','','','Шаблоны для DataLife Engine','','','1','post3',0,1,1,1,0,1,'','по, шаблоны',''),(4,'admin','2017-03-30 09:15:21','<b>Техническая поддержка скрипта</b> осуществляется силами <a href=\"http://forum.dle-news.ru/index.php\" target=\"_blank\">форума поддержки</a>, а также по E-Mail. По мере поступления возникших у вас вопросов мы стараемся ответить на все ваши вопросы, но в связи с большим количеством посетителей, это не всегда является возможным. Поэтому введена дополнительная услуга платной поддержки скрипта. Стоимость данной услуги составляет дополнительно <!--colorstart:#FF0000--><span style=\"color:#FF0000\"><!--/colorstart-->19 $<!--colorend--></span><!--/colorend--> одноразово на весь срок действия лицензии.<br /><br /><b>Услуги по дополнительной поддержки скрипта включают в себя:</b><br /><br />1. Приоритетное получение ответа на вопросы, которые задают пользователи впервые столкнувшиеся со скриптом и естественно не знающие всех нюансов работы скрипта. В компетенции службы поддержки находится только помощь только по непосредственным сбоям самого скрипта, в случае если причиной некорректной работы скрипта явился ваш шаблон, не соответствующий требованиям скрипта, то в поддержке вам может быть отказано.<br /><br />2. Также вы получаете возможность одноразовой установки скрипта вам на сервер, включая настройку его до полной работоспособности с учетом текущих настроек сервера (иногда нужно верно отключить поддержку ЧПУ, включение специальных директив для Русского Апача, для верной загрузки картинок и прочее...).<br /><br />3. Вы получаете консультационную поддержку по работе со структурой скрипта, например у вас есть желание добавить небольшие изменения в скрипт для более удобной работы для вас, вы сможете сэкономить время на поиске нужного куска кода просто спросив у нас. Вам будет предоставлена консультация где это копать и как вообще лучше реализовать поставленную задачу. (Внимание мы не пишем за вас дополнительные модули, а только помогаем вам лучше разобраться со структурой скрипта, поэтому всегда задавайте вопросы по существу, вопросы типа: \"как мне сделать такую фишку\" могут быть проигнорированы службой поддержки).<br /><br />4. Еще одна из часто возникающих проблем это некорректное обновление скрипта, например во время обновления произошел сбой сервера, часть новых данных была внесена в базу и настройки, часть нет, в итоге вы получаете нерабочий скрипт, со всеми вытекающими последствиями. В данном случае для вас будет проведена ручная коррекция поврежденной структуры базы данных.<br /><br />В случае если вы не являетесь подписчиком дополнительной службы поддержки, ваши вопросы могут быть проигнорированы и оставлены без ответа.<br /><br /><b>С уважением,<br /><br />SoftNews Media Group</b>','','','Осуществление технической поддержки скрипта','','','1','post4',0,1,1,1,0,1,'','','');
/*!40000 ALTER TABLE `dle_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_post_extras`
--

DROP TABLE IF EXISTS `dle_post_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_post_extras` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL DEFAULT '0',
  `news_read` int(11) NOT NULL DEFAULT '0',
  `allow_rate` tinyint(1) NOT NULL DEFAULT '1',
  `rating` mediumint(8) NOT NULL DEFAULT '0',
  `vote_num` mediumint(8) NOT NULL DEFAULT '0',
  `votes` tinyint(1) NOT NULL DEFAULT '0',
  `view_edit` tinyint(1) NOT NULL DEFAULT '0',
  `disable_index` tinyint(1) NOT NULL DEFAULT '0',
  `related_ids` varchar(255) NOT NULL DEFAULT '',
  `access` varchar(150) NOT NULL DEFAULT '',
  `editdate` int(11) NOT NULL DEFAULT '0',
  `editor` varchar(40) NOT NULL DEFAULT '',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eid`),
  KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_post_extras`
--

LOCK TABLES `dle_post_extras` WRITE;
/*!40000 ALTER TABLE `dle_post_extras` DISABLE KEYS */;
INSERT INTO `dle_post_extras` VALUES (1,1,0,1,0,0,0,0,0,'','',0,'','',1),(2,2,0,1,0,0,0,0,0,'','',0,'','',1),(3,3,0,1,0,0,0,0,0,'','',0,'','',1),(4,4,0,1,0,0,0,0,0,'','',0,'','',1);
/*!40000 ALTER TABLE `dle_post_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_post_log`
--

DROP TABLE IF EXISTS `dle_post_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_post_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL DEFAULT '0',
  `expires` varchar(15) NOT NULL DEFAULT '',
  `action` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_post_log`
--

LOCK TABLES `dle_post_log` WRITE;
/*!40000 ALTER TABLE `dle_post_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_post_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_question`
--

DROP TABLE IF EXISTS `dle_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_question`
--

LOCK TABLES `dle_question` WRITE;
/*!40000 ALTER TABLE `dle_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_read_log`
--

DROP TABLE IF EXISTS `dle_read_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_read_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_read_log`
--

LOCK TABLES `dle_read_log` WRITE;
/*!40000 ALTER TABLE `dle_read_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_read_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_rss`
--

DROP TABLE IF EXISTS `dle_rss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_rss` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `allow_main` tinyint(1) NOT NULL DEFAULT '0',
  `allow_rating` tinyint(1) NOT NULL DEFAULT '0',
  `allow_comm` tinyint(1) NOT NULL DEFAULT '0',
  `text_type` tinyint(1) NOT NULL DEFAULT '0',
  `date` tinyint(1) NOT NULL DEFAULT '0',
  `search` text NOT NULL,
  `max_news` tinyint(3) NOT NULL DEFAULT '0',
  `cookie` text NOT NULL,
  `category` smallint(5) NOT NULL DEFAULT '0',
  `lastdate` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_rss`
--

LOCK TABLES `dle_rss` WRITE;
/*!40000 ALTER TABLE `dle_rss` DISABLE KEYS */;
INSERT INTO `dle_rss` VALUES (1,'http://dle-news.ru/rss.xml','Официальный сайт DataLife Engine',1,1,1,1,1,'<td align=\"left\" valign=\"top\" class=\"news\">{get}<br /><br /></td>',5,'',1,0);
/*!40000 ALTER TABLE `dle_rss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_rssinform`
--

DROP TABLE IF EXISTS `dle_rssinform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_rssinform` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `tag` varchar(40) NOT NULL DEFAULT '',
  `descr` varchar(255) NOT NULL DEFAULT '',
  `category` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(40) NOT NULL DEFAULT '',
  `news_max` smallint(5) NOT NULL DEFAULT '0',
  `tmax` smallint(5) NOT NULL DEFAULT '0',
  `dmax` smallint(5) NOT NULL DEFAULT '0',
  `approve` tinyint(1) NOT NULL DEFAULT '1',
  `rss_date_format` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_rssinform`
--

LOCK TABLES `dle_rssinform` WRITE;
/*!40000 ALTER TABLE `dle_rssinform` DISABLE KEYS */;
INSERT INTO `dle_rssinform` VALUES (1,'dle','Новости с Яндекса','0','http://news.yandex.ru/index.rss','informer',3,0,200,1,'j F Y H:i');
/*!40000 ALTER TABLE `dle_rssinform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_sendlog`
--

DROP TABLE IF EXISTS `dle_sendlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_sendlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(40) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `date` (`date`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_sendlog`
--

LOCK TABLES `dle_sendlog` WRITE;
/*!40000 ALTER TABLE `dle_sendlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_sendlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_social_login`
--

DROP TABLE IF EXISTS `dle_social_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_social_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(40) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `provider` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_social_login`
--

LOCK TABLES `dle_social_login` WRITE;
/*!40000 ALTER TABLE `dle_social_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_social_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_spam_log`
--

DROP TABLE IF EXISTS `dle_spam_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_spam_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(16) NOT NULL DEFAULT '',
  `is_spammer` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `is_spammer` (`is_spammer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_spam_log`
--

LOCK TABLES `dle_spam_log` WRITE;
/*!40000 ALTER TABLE `dle_spam_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_spam_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_static`
--

DROP TABLE IF EXISTS `dle_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_static` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `descr` varchar(255) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `allow_br` tinyint(1) NOT NULL DEFAULT '0',
  `allow_template` tinyint(1) NOT NULL DEFAULT '0',
  `grouplevel` varchar(100) NOT NULL DEFAULT 'all',
  `tpl` varchar(40) NOT NULL DEFAULT '',
  `metadescr` varchar(200) NOT NULL DEFAULT '',
  `metakeys` text NOT NULL,
  `views` mediumint(8) NOT NULL DEFAULT '0',
  `template_folder` varchar(50) NOT NULL DEFAULT '',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `metatitle` varchar(255) NOT NULL DEFAULT '',
  `allow_count` tinyint(1) NOT NULL DEFAULT '1',
  `sitemap` tinyint(1) NOT NULL DEFAULT '1',
  `disable_index` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  FULLTEXT KEY `template` (`template`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_static`
--

LOCK TABLES `dle_static` WRITE;
/*!40000 ALTER TABLE `dle_static` DISABLE KEYS */;
INSERT INTO `dle_static` VALUES (1,'dle-rules-page','Общие правила на сайте','<b>Общие правила поведения на сайте:</b><br /><br />Начнем с того, что на сайте общаются сотни людей, разных религий и взглядов, и все они являются полноправными посетителями нашего сайта, поэтому если мы хотим чтобы это сообщество людей функционировало нам и необходимы правила. Мы настоятельно рекомендуем прочитать настоящие правила, это займет у вас всего минут пять, но сбережет нам и вам время и поможет сделать сайт более интересным и организованным.<br /><br />Начнем с того, что на нашем сайте нужно вести себя уважительно ко всем посетителям сайта. Не надо оскорблений по отношению к участникам, это всегда лишнее. Если есть претензии - обращайтесь к Админам или Модераторам (воспользуйтесь личными сообщениями). Оскорбление других посетителей считается у нас одним из самых тяжких нарушений и строго наказывается администрацией. <b>У нас строго запрещен расизм, религиозные и политические высказывания.</b> Заранее благодарим вас за понимание и за желание сделать наш сайт более вежливым и дружелюбным.<br /><br /><b>На сайте строго запрещено:</b> <br /><br />- сообщения, не относящиеся к содержанию статьи или к контексту обсуждения<br />- оскорбление и угрозы в адрес посетителей сайта<br />- в комментариях запрещаются выражения, содержащие ненормативную лексику, унижающие человеческое достоинство, разжигающие межнациональную рознь<br />- спам, а также реклама любых товаров и услуг, иных ресурсов, СМИ или событий, не относящихся к контексту обсуждения статьи<br /><br />Давайте будем уважать друг друга и сайт, на который Вы и другие читатели приходят пообщаться и высказать свои мысли. Администрация сайта оставляет за собой право удалять комментарии или часть комментариев, если они не соответствуют данным требованиям.<br /><br />При нарушении правил вам может быть дано <b>предупреждение</b>. В некоторых случаях может быть дан бан <b>без предупреждений</b>. По вопросам снятия бана писать администратору.<br /><br /><b>Оскорбление</b> администраторов или модераторов также караются <b>баном</b> - уважайте чужой труд.<br /><br /><div align=\"center\">{ACCEPT-DECLINE}</div>',1,1,'all','','Общие правила','Общие правила',0,'',1490865391,'',1,1,0);
/*!40000 ALTER TABLE `dle_static` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_static_files`
--

DROP TABLE IF EXISTS `dle_static_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_static_files` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `static_id` mediumint(8) NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL DEFAULT '',
  `date` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `onserver` varchar(255) NOT NULL DEFAULT '',
  `dcount` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `static_id` (`static_id`),
  KEY `onserver` (`onserver`),
  KEY `author` (`author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_static_files`
--

LOCK TABLES `dle_static_files` WRITE;
/*!40000 ALTER TABLE `dle_static_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_static_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_subscribe`
--

DROP TABLE IF EXISTS `dle_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `news_id` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_subscribe`
--

LOCK TABLES `dle_subscribe` WRITE;
/*!40000 ALTER TABLE `dle_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_tags`
--

DROP TABLE IF EXISTS `dle_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_tags`
--

LOCK TABLES `dle_tags` WRITE;
/*!40000 ALTER TABLE `dle_tags` DISABLE KEYS */;
INSERT INTO `dle_tags` VALUES (1,1,'по'),(2,2,'по'),(3,3,'по'),(4,1,'новости'),(5,2,'новости'),(6,3,'шаблоны');
/*!40000 ALTER TABLE `dle_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_usergroups`
--

DROP TABLE IF EXISTS `dle_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_usergroups` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `allow_cats` text NOT NULL,
  `allow_adds` tinyint(1) NOT NULL DEFAULT '1',
  `cat_add` text NOT NULL,
  `allow_admin` tinyint(1) NOT NULL DEFAULT '0',
  `allow_addc` tinyint(1) NOT NULL DEFAULT '0',
  `allow_editc` tinyint(1) NOT NULL DEFAULT '0',
  `allow_delc` tinyint(1) NOT NULL DEFAULT '0',
  `edit_allc` tinyint(1) NOT NULL DEFAULT '0',
  `del_allc` tinyint(1) NOT NULL DEFAULT '0',
  `moderation` tinyint(1) NOT NULL DEFAULT '0',
  `allow_all_edit` tinyint(1) NOT NULL DEFAULT '0',
  `allow_edit` tinyint(1) NOT NULL DEFAULT '0',
  `allow_pm` tinyint(1) NOT NULL DEFAULT '0',
  `max_pm` smallint(5) NOT NULL DEFAULT '0',
  `max_foto` varchar(10) NOT NULL DEFAULT '',
  `allow_files` tinyint(1) NOT NULL DEFAULT '0',
  `allow_hide` tinyint(1) NOT NULL DEFAULT '1',
  `allow_short` tinyint(1) NOT NULL DEFAULT '0',
  `time_limit` tinyint(1) NOT NULL DEFAULT '0',
  `rid` smallint(5) NOT NULL DEFAULT '0',
  `allow_fixed` tinyint(1) NOT NULL DEFAULT '0',
  `allow_feed` tinyint(1) NOT NULL DEFAULT '1',
  `allow_search` tinyint(1) NOT NULL DEFAULT '1',
  `allow_poll` tinyint(1) NOT NULL DEFAULT '1',
  `allow_main` tinyint(1) NOT NULL DEFAULT '1',
  `captcha` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(200) NOT NULL DEFAULT '',
  `allow_modc` tinyint(1) NOT NULL DEFAULT '0',
  `allow_rating` tinyint(1) NOT NULL DEFAULT '1',
  `allow_offline` tinyint(1) NOT NULL DEFAULT '0',
  `allow_image_upload` tinyint(1) NOT NULL DEFAULT '0',
  `allow_file_upload` tinyint(1) NOT NULL DEFAULT '0',
  `allow_signature` tinyint(1) NOT NULL DEFAULT '0',
  `allow_url` tinyint(1) NOT NULL DEFAULT '1',
  `news_sec_code` tinyint(1) NOT NULL DEFAULT '1',
  `allow_image` tinyint(1) NOT NULL DEFAULT '0',
  `max_signature` smallint(6) NOT NULL DEFAULT '0',
  `max_info` smallint(6) NOT NULL DEFAULT '0',
  `admin_addnews` tinyint(1) NOT NULL DEFAULT '0',
  `admin_editnews` tinyint(1) NOT NULL DEFAULT '0',
  `admin_comments` tinyint(1) NOT NULL DEFAULT '0',
  `admin_categories` tinyint(1) NOT NULL DEFAULT '0',
  `admin_editusers` tinyint(1) NOT NULL DEFAULT '0',
  `admin_wordfilter` tinyint(1) NOT NULL DEFAULT '0',
  `admin_xfields` tinyint(1) NOT NULL DEFAULT '0',
  `admin_userfields` tinyint(1) NOT NULL DEFAULT '0',
  `admin_static` tinyint(1) NOT NULL DEFAULT '0',
  `admin_editvote` tinyint(1) NOT NULL DEFAULT '0',
  `admin_newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `admin_blockip` tinyint(1) NOT NULL DEFAULT '0',
  `admin_banners` tinyint(1) NOT NULL DEFAULT '0',
  `admin_rss` tinyint(1) NOT NULL DEFAULT '0',
  `admin_iptools` tinyint(1) NOT NULL DEFAULT '0',
  `admin_rssinform` tinyint(1) NOT NULL DEFAULT '0',
  `admin_googlemap` tinyint(1) NOT NULL DEFAULT '0',
  `allow_html` tinyint(1) NOT NULL DEFAULT '1',
  `group_prefix` text NOT NULL,
  `group_suffix` text NOT NULL,
  `allow_subscribe` tinyint(1) NOT NULL DEFAULT '0',
  `allow_image_size` tinyint(1) NOT NULL DEFAULT '0',
  `cat_allow_addnews` text NOT NULL,
  `flood_news` smallint(6) NOT NULL DEFAULT '0',
  `max_day_news` smallint(6) NOT NULL DEFAULT '0',
  `force_leech` tinyint(1) NOT NULL DEFAULT '0',
  `edit_limit` smallint(6) NOT NULL DEFAULT '0',
  `captcha_pm` tinyint(1) NOT NULL DEFAULT '0',
  `max_pm_day` smallint(6) NOT NULL DEFAULT '0',
  `max_mail_day` smallint(6) NOT NULL DEFAULT '0',
  `admin_tagscloud` tinyint(1) NOT NULL DEFAULT '0',
  `allow_vote` tinyint(1) NOT NULL DEFAULT '0',
  `admin_complaint` tinyint(1) NOT NULL DEFAULT '0',
  `news_question` tinyint(1) NOT NULL DEFAULT '0',
  `comments_question` tinyint(1) NOT NULL DEFAULT '0',
  `max_comment_day` smallint(6) NOT NULL DEFAULT '0',
  `max_images` smallint(6) NOT NULL DEFAULT '0',
  `max_files` smallint(6) NOT NULL DEFAULT '0',
  `disable_news_captcha` smallint(6) NOT NULL DEFAULT '0',
  `disable_comments_captcha` smallint(6) NOT NULL DEFAULT '0',
  `pm_question` tinyint(1) NOT NULL DEFAULT '0',
  `captcha_feedback` tinyint(1) NOT NULL DEFAULT '1',
  `feedback_question` tinyint(1) NOT NULL DEFAULT '0',
  `files_type` varchar(255) NOT NULL DEFAULT '',
  `max_file_size` mediumint(9) NOT NULL DEFAULT '0',
  `files_max_speed` smallint(6) NOT NULL DEFAULT '0',
  `allow_lostpassword` tinyint(1) NOT NULL DEFAULT '1',
  `spamfilter` tinyint(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_usergroups`
--

LOCK TABLES `dle_usergroups` WRITE;
/*!40000 ALTER TABLE `dle_usergroups` DISABLE KEYS */;
INSERT INTO `dle_usergroups` VALUES (1,'Администраторы','all',1,'all',1,1,1,1,1,1,1,1,1,1,50,'101',1,1,1,0,1,1,1,1,1,1,0,'{THEME}/images/icon_1.gif',0,1,1,1,1,1,1,0,1,500,1000,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'<b><span style=\"color:red\">','</span></b>',1,1,'all',0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,0,'zip,rar,exe,doc,pdf,swf',4096,0,0,2),(2,'Главные редакторы','all',1,'all',1,1,1,1,1,0,1,1,1,1,50,'101',1,1,1,0,2,1,1,1,1,1,0,'{THEME}/images/icon_2.gif',0,1,0,1,1,1,1,0,1,500,1000,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'all',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,'zip,rar,exe,doc,pdf,swf',4096,0,1,2),(3,'Журналисты','all',1,'all',1,1,1,1,0,0,1,0,1,1,50,'101',1,1,1,0,3,0,1,1,1,1,0,'{THEME}/images/icon_3.gif',0,1,0,1,1,1,1,0,1,500,1000,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'','',1,1,'all',0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,'zip,rar,exe,doc,pdf,swf',4096,0,1,2),(4,'Посетители','all',1,'all',0,1,1,1,0,0,0,0,0,1,20,'101',1,1,1,0,4,0,1,1,1,1,0,'{THEME}/images/icon_4.gif',0,1,0,1,0,1,1,1,0,500,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'','',1,0,'all',0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,'zip,rar,exe,doc,pdf,swf',4096,0,1,2),(5,'Гости','all',0,'all',0,1,0,0,0,0,0,0,0,0,0,'0',1,0,1,0,5,0,1,1,1,0,1,'{THEME}/images/icon_5.gif',0,1,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0,0,'all',0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,'',0,0,0,2);
/*!40000 ALTER TABLE `dle_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_users`
--

DROP TABLE IF EXISTS `dle_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_users` (
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_num` mediumint(8) NOT NULL DEFAULT '0',
  `comm_num` mediumint(8) NOT NULL DEFAULT '0',
  `user_group` smallint(5) NOT NULL DEFAULT '4',
  `lastdate` varchar(20) DEFAULT NULL,
  `reg_date` varchar(20) DEFAULT NULL,
  `banned` varchar(5) NOT NULL DEFAULT '',
  `allow_mail` tinyint(1) NOT NULL DEFAULT '1',
  `info` text NOT NULL,
  `signature` text NOT NULL,
  `foto` varchar(50) NOT NULL DEFAULT '',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `land` varchar(100) NOT NULL DEFAULT '',
  `favorites` text NOT NULL,
  `pm_all` smallint(5) NOT NULL DEFAULT '0',
  `pm_unread` smallint(5) NOT NULL DEFAULT '0',
  `time_limit` varchar(20) NOT NULL DEFAULT '',
  `xfields` text NOT NULL,
  `allowed_ip` varchar(255) NOT NULL DEFAULT '',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `logged_ip` varchar(16) NOT NULL DEFAULT '',
  `restricted` tinyint(1) NOT NULL DEFAULT '0',
  `restricted_days` smallint(4) NOT NULL DEFAULT '0',
  `restricted_date` varchar(15) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_users`
--

LOCK TABLES `dle_users` WRITE;
/*!40000 ALTER TABLE `dle_users` DISABLE KEYS */;
INSERT INTO `dle_users` VALUES ('admin@site.com','c3284d0f94606de1fd2af172aba15bf3','admin',1,4,0,1,'1490865391','1490865391','',1,'','','','','','',0,0,'','','','','',0,0,'','');
/*!40000 ALTER TABLE `dle_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_views`
--

DROP TABLE IF EXISTS `dle_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_views`
--

LOCK TABLES `dle_views` WRITE;
/*!40000 ALTER TABLE `dle_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_vote`
--

DROP TABLE IF EXISTS `dle_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_vote` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  `vote_num` mediumint(8) NOT NULL DEFAULT '0',
  `date` varchar(25) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `approve` tinyint(1) NOT NULL DEFAULT '1',
  `start` varchar(15) NOT NULL DEFAULT '',
  `end` varchar(15) NOT NULL DEFAULT '',
  `grouplevel` varchar(250) NOT NULL DEFAULT 'all',
  PRIMARY KEY (`id`),
  KEY `approve` (`approve`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_vote`
--

LOCK TABLES `dle_vote` WRITE;
/*!40000 ALTER TABLE `dle_vote` DISABLE KEYS */;
INSERT INTO `dle_vote` VALUES (1,'all',0,'2017-03-30 09:16:31','Оцените работу движка','Лучший из новостных<br />Неплохой движок<br />Устраивает ... но ...<br />Встречал и получше<br />Совсем не понравился',1,'','','all');
/*!40000 ALTER TABLE `dle_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dle_vote_result`
--

DROP TABLE IF EXISTS `dle_vote_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dle_vote_result` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  `vote_id` mediumint(8) NOT NULL DEFAULT '0',
  `answer` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer` (`answer`),
  KEY `vote_id` (`vote_id`),
  KEY `ip` (`ip`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dle_vote_result`
--

LOCK TABLES `dle_vote_result` WRITE;
/*!40000 ALTER TABLE `dle_vote_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `dle_vote_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-30 12:19:57
