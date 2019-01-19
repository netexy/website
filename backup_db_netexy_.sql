-- MySQL dump 10.13  Distrib 5.5.60, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sulu_doc
-- ------------------------------------------------------
-- Server version	5.5.60-0+deb8u1

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
-- Table structure for table `au_task`
--

DROP TABLE IF EXISTS `au_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_task` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `task_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `entityClass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entityId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handlerClass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schedule` datetime NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `scheme` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_223B587EDBF11E1D` (`idUsersCreator`),
  KEY `IDX_223B587E30D07CD5` (`idUsersChanger`),
  KEY `IDX_223B587E8DB60186` (`task_id`),
  CONSTRAINT `FK_223B587E30D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_223B587E8DB60186` FOREIGN KEY (`task_id`) REFERENCES `ta_tasks` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_223B587EDBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_task`
--

LOCK TABLES `au_task` WRITE;
/*!40000 ALTER TABLE `au_task` DISABLE KEYS */;
INSERT INTO `au_task` (`id`, `task_id`, `entityClass`, `entityId`, `handlerClass`, `schedule`, `locale`, `scheme`, `host`, `created`, `changed`, `idUsersCreator`, `idUsersChanger`) VALUES ('02110c82-9a37-4ac3-9b33-1adb657fba31','0c7d0499-6a00-4903-96df-b508f3fd74d7','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','568b1018-c5db-41b3-b3f1-5dcdcaa6a08a','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-05 03:15:46','en','https','netexy.com','2018-08-05 03:15:46','2018-08-05 03:15:46',1,1),('2a3950e1-7679-49a5-9646-9c35f0f4200a','61a03db6-8c34-4df6-a889-380ec4375e7a','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','02b4e64c-3cf3-4543-977c-1a1354572312','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-07-11 07:57:50','en','https','netexy.com','2018-07-11 07:57:50','2018-07-11 07:57:50',1,1),('447c625c-5ed6-46a0-a826-a36b1da4300b','2246fa85-b53e-499b-b4a1-27d04fa1b090','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','f1a762e3-0a04-4d95-a29f-ea99c5c2fb43','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-28 15:12:48','en','https','netexy.com','2018-08-28 15:12:48','2018-08-28 15:12:48',1,1),('53600396-cf23-41f9-a353-9d4fc9aa416c','b5be87f2-ac50-43ef-8dd4-86cccce9faa8','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','19a32019-4b3a-48b3-8674-c394d8a7a57d','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-28 15:12:22','en','https','netexy.com','2018-08-28 15:12:22','2018-08-28 15:12:22',1,1),('5a05f1f1-608a-40f7-bbf9-5c5be3e3a894','1486428c-ebdc-41e6-b404-15dad7be5785','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','04873e43-8ceb-45f1-9e34-004bb2c5012d','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-28 15:12:31','en','https','netexy.com','2018-08-28 15:12:31','2018-08-28 15:12:31',1,1),('5d608b1c-1130-4469-b147-159e048f8990','082bad13-c997-4e86-8746-3cf01ad17443','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','f2286519-b6ff-42c0-bff9-7ff41410d99c','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-31 22:33:29','uk','https','netexy.com','2018-08-31 22:33:29','2018-08-31 22:33:29',1,1),('794f3706-34ac-47cf-ace3-8c031895d9ba','4a1184b3-e077-453c-84df-d3863fee8aff','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','19a32019-4b3a-48b3-8674-c394d8a7a57d','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-28 15:12:22','uk','https','netexy.com','2018-08-28 15:12:22','2018-08-28 15:12:22',1,1),('82a451d8-6905-4c68-8305-8b43de0fdbdd','b102eec8-74aa-4060-8acc-c85fcee13eb6','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','02b4e64c-3cf3-4543-977c-1a1354572312','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-07-11 07:57:20','uk','https','netexy.com','2018-07-11 07:57:20','2018-07-11 07:57:20',1,1),('8822e304-5f0e-4315-8811-8fb42c088718','9c28d37a-ca6c-4d34-afd8-fa5a3d14b43b','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','568b1018-c5db-41b3-b3f1-5dcdcaa6a08a','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-08 00:03:33','en','https','netexy.com','2018-08-08 00:03:33','2018-08-08 00:03:33',1,1),('9aaa9392-cc3d-4157-81cc-2ecaf3af90ca','5dfde519-92ed-4772-8e1f-892a0a7dfc2d','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','f1a762e3-0a04-4d95-a29f-ea99c5c2fb43','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-28 15:12:48','uk','https','netexy.com','2018-08-28 15:12:48','2018-08-28 15:12:48',1,1),('a80176d0-059c-4e8f-bede-9b63916e5fe0','bf401c40-66d1-4103-a117-7318af70aae0','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','568b1018-c5db-41b3-b3f1-5dcdcaa6a08a','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-28 15:11:56','uk','https','netexy.com','2018-08-28 15:11:56','2018-08-28 15:11:56',1,1),('a9dab408-b812-4673-baf1-4a36e00b0687','8e7f69bc-321e-4827-898b-c6c8d2b39c69','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','568b1018-c5db-41b3-b3f1-5dcdcaa6a08a','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-28 15:11:57','en','https','netexy.com','2018-08-28 15:11:57','2018-08-28 15:11:57',1,1),('aaac560b-e5f7-475c-b825-eb73a0ea4e7e','c0342484-9655-4821-925d-280a02042eb8','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','568b1018-c5db-41b3-b3f1-5dcdcaa6a08a','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-08 00:03:53','en','https','netexy.com','2018-08-08 00:03:53','2018-08-08 00:03:53',1,1),('ce8c27cd-d489-402d-abd1-a2d5ecc3c934','80e2614b-e5f3-4d22-ab09-a9d353461fa7','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','f2286519-b6ff-42c0-bff9-7ff41410d99c','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-31 22:33:58','en','https','netexy.com','2018-08-31 22:33:58','2018-08-31 22:33:58',1,1),('cf489175-0927-4ef6-868a-87bf3a22964f','01be62d6-e412-4467-bff8-610f8fa0cfb5','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','568b1018-c5db-41b3-b3f1-5dcdcaa6a08a','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-05 03:16:04','en','https','netexy.com','2018-08-05 03:16:04','2018-08-05 03:16:04',1,1),('dbd03806-1ca8-4d79-b2d9-9c1dd5ab933d','0da2e7c1-78f1-4454-bee8-5b7510d2a1e6','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','610bb085-27f2-4862-91a3-34596a9dd70e','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-31 16:08:20','en','https','netexy.com','2018-08-31 16:08:20','2018-08-31 16:08:20',1,1),('e78f6fb5-5255-49f2-878c-7e97e26b935b','36e0fa8b-1f0b-464b-bed4-e788c8344636','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','04873e43-8ceb-45f1-9e34-004bb2c5012d','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','2018-08-28 15:12:31','uk','https','netexy.com','2018-08-28 15:12:31','2018-08-28 15:12:31',1,1),('eb6ddea6-00be-4ef4-b393-8bee4ef8bf98','8ba5b05e-ca3f-4448-9350-f6f652d5285b','Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument','9c34553c-7f80-45ac-b6f5-5ec90e545f15','Sulu\\Bundle\\AutomationBundle\\Handler\\DocumentUnpublishHandler','2018-09-13 23:15:00','uk','https','netexy.com','2018-09-13 23:12:14','2018-09-13 23:12:24',1,1);
/*!40000 ALTER TABLE `au_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_categories`
--

DROP TABLE IF EXISTS `ca_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idCategoriesParent` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3D85D789AF5206F3` (`category_key`),
  KEY `IDX_3D85D78937A3C3B1` (`idCategoriesParent`),
  KEY `IDX_3D85D789DBF11E1D` (`idUsersCreator`),
  KEY `IDX_3D85D78930D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_3D85D78930D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3D85D78937A3C3B1` FOREIGN KEY (`idCategoriesParent`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3D85D789DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_categories`
--

LOCK TABLES `ca_categories` WRITE;
/*!40000 ALTER TABLE `ca_categories` DISABLE KEYS */;
INSERT INTO `ca_categories` (`id`, `category_key`, `default_locale`, `lft`, `rgt`, `depth`, `created`, `changed`, `idCategoriesParent`, `idUsersCreator`, `idUsersChanger`) VALUES (1,'ntx','uk',1,2,0,'2018-07-11 05:07:55','2018-07-11 05:07:55',NULL,1,1);
/*!40000 ALTER TABLE `ca_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_category_meta`
--

DROP TABLE IF EXISTS `ca_category_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_category_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idCategories` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2575BBB0B8075882` (`idCategories`),
  CONSTRAINT `FK_2575BBB0B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_category_meta`
--

LOCK TABLES `ca_category_meta` WRITE;
/*!40000 ALTER TABLE `ca_category_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_category_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_category_translations`
--

DROP TABLE IF EXISTS `ca_category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_category_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idCategories` int(11) NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5DCED5E3B8075882` (`idCategories`),
  KEY `IDX_5DCED5E3DBF11E1D` (`idUsersCreator`),
  KEY `IDX_5DCED5E330D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_5DCED5E330D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_5DCED5E3B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5DCED5E3DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_category_translations`
--

LOCK TABLES `ca_category_translations` WRITE;
/*!40000 ALTER TABLE `ca_category_translations` DISABLE KEYS */;
INSERT INTO `ca_category_translations` (`id`, `translation`, `locale`, `description`, `created`, `changed`, `idCategories`, `idUsersCreator`, `idUsersChanger`) VALUES (1,'Netexy','uk',NULL,'2018-07-11 05:07:55','2018-07-11 05:07:55',1,1,1);
/*!40000 ALTER TABLE `ca_category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_category_translations_keywords`
--

DROP TABLE IF EXISTS `ca_category_translations_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_category_translations_keywords` (
  `keyword_id` int(11) NOT NULL,
  `category_meta_id` int(11) NOT NULL,
  PRIMARY KEY (`keyword_id`,`category_meta_id`),
  KEY `IDX_E5EBCA97115D4552` (`keyword_id`),
  KEY `IDX_E5EBCA97FE24E687` (`category_meta_id`),
  CONSTRAINT `FK_E5EBCA97115D4552` FOREIGN KEY (`keyword_id`) REFERENCES `ca_keywords` (`id`),
  CONSTRAINT `FK_E5EBCA97FE24E687` FOREIGN KEY (`category_meta_id`) REFERENCES `ca_category_translations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_category_translations_keywords`
--

LOCK TABLES `ca_category_translations_keywords` WRITE;
/*!40000 ALTER TABLE `ca_category_translations_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_category_translations_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_keywords`
--

DROP TABLE IF EXISTS `ca_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx` (`keyword`,`locale`),
  KEY `IDX_FE02CA0BDBF11E1D` (`idUsersCreator`),
  KEY `IDX_FE02CA0B30D07CD5` (`idUsersChanger`),
  KEY `IDX_FE02CA0B5A93713B` (`keyword`),
  CONSTRAINT `FK_FE02CA0B30D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FE02CA0BDBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_keywords`
--

LOCK TABLES `ca_keywords` WRITE;
/*!40000 ALTER TABLE `ca_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translation_media_interface`
--

DROP TABLE IF EXISTS `category_translation_media_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translation_media_interface` (
  `category_translation_id` int(11) NOT NULL,
  `media_interface_id` int(11) NOT NULL,
  PRIMARY KEY (`category_translation_id`,`media_interface_id`),
  KEY `IDX_16C70FE67DBA6818` (`category_translation_id`),
  KEY `IDX_16C70FE6C2FA430E` (`media_interface_id`),
  CONSTRAINT `FK_16C70FE67DBA6818` FOREIGN KEY (`category_translation_id`) REFERENCES `ca_category_translations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_16C70FE6C2FA430E` FOREIGN KEY (`media_interface_id`) REFERENCES `me_media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translation_media_interface`
--

LOCK TABLES `category_translation_media_interface` WRITE;
/*!40000 ALTER TABLE `category_translation_media_interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_translation_media_interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_addresses`
--

DROP TABLE IF EXISTS `co_account_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` tinyint(1) NOT NULL,
  `idAddresses` int(11) NOT NULL,
  `idAccounts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4165FE4893205E40996BB4F7` (`idAddresses`,`idAccounts`),
  KEY `IDX_4165FE4893205E40` (`idAddresses`),
  KEY `IDX_4165FE48996BB4F7` (`idAccounts`),
  CONSTRAINT `FK_4165FE4893205E40` FOREIGN KEY (`idAddresses`) REFERENCES `co_addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4165FE48996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_addresses`
--

LOCK TABLES `co_account_addresses` WRITE;
/*!40000 ALTER TABLE `co_account_addresses` DISABLE KEYS */;
INSERT INTO `co_account_addresses` (`id`, `main`, `idAddresses`, `idAccounts`) VALUES (1,1,1,1);
/*!40000 ALTER TABLE `co_account_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_bank_accounts`
--

DROP TABLE IF EXISTS `co_account_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_bank_accounts` (
  `idAccounts` int(11) NOT NULL,
  `idBankAccounts` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idBankAccounts`),
  KEY `IDX_C873A532996BB4F7` (`idAccounts`),
  KEY `IDX_C873A53237FCD1D8` (`idBankAccounts`),
  CONSTRAINT `FK_C873A53237FCD1D8` FOREIGN KEY (`idBankAccounts`) REFERENCES `co_bank_account` (`id`),
  CONSTRAINT `FK_C873A532996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_bank_accounts`
--

LOCK TABLES `co_account_bank_accounts` WRITE;
/*!40000 ALTER TABLE `co_account_bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_categories`
--

DROP TABLE IF EXISTS `co_account_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_categories` (
  `idAccounts` int(11) NOT NULL,
  `idCategories` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idCategories`),
  KEY `IDX_B60E9510996BB4F7` (`idAccounts`),
  KEY `IDX_B60E9510B8075882` (`idCategories`),
  CONSTRAINT `FK_B60E9510996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B60E9510B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_categories`
--

LOCK TABLES `co_account_categories` WRITE;
/*!40000 ALTER TABLE `co_account_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_contacts`
--

DROP TABLE IF EXISTS `co_account_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` tinyint(1) NOT NULL,
  `idPositions` int(11) DEFAULT NULL,
  `idContacts` int(11) NOT NULL,
  `idAccounts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_28C6CA0E60E33F28996BB4F7` (`idContacts`,`idAccounts`),
  KEY `IDX_28C6CA0E2A75CE2A` (`idPositions`),
  KEY `IDX_28C6CA0E60E33F28` (`idContacts`),
  KEY `IDX_28C6CA0E996BB4F7` (`idAccounts`),
  CONSTRAINT `FK_28C6CA0E2A75CE2A` FOREIGN KEY (`idPositions`) REFERENCES `co_positions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_28C6CA0E60E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_28C6CA0E996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_contacts`
--

LOCK TABLES `co_account_contacts` WRITE;
/*!40000 ALTER TABLE `co_account_contacts` DISABLE KEYS */;
INSERT INTO `co_account_contacts` (`id`, `main`, `idPositions`, `idContacts`, `idAccounts`) VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `co_account_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_emails`
--

DROP TABLE IF EXISTS `co_account_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_emails` (
  `idAccounts` int(11) NOT NULL,
  `idEmails` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idEmails`),
  KEY `IDX_3E246FC3996BB4F7` (`idAccounts`),
  KEY `IDX_3E246FC32F9040C8` (`idEmails`),
  CONSTRAINT `FK_3E246FC32F9040C8` FOREIGN KEY (`idEmails`) REFERENCES `co_emails` (`id`),
  CONSTRAINT `FK_3E246FC3996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_emails`
--

LOCK TABLES `co_account_emails` WRITE;
/*!40000 ALTER TABLE `co_account_emails` DISABLE KEYS */;
INSERT INTO `co_account_emails` (`idAccounts`, `idEmails`) VALUES (1,2);
/*!40000 ALTER TABLE `co_account_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_faxes`
--

DROP TABLE IF EXISTS `co_account_faxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_faxes` (
  `idAccounts` int(11) NOT NULL,
  `idFaxes` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idFaxes`),
  KEY `IDX_7A4E77DC996BB4F7` (`idAccounts`),
  KEY `IDX_7A4E77DCCF6A2007` (`idFaxes`),
  CONSTRAINT `FK_7A4E77DC996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`),
  CONSTRAINT `FK_7A4E77DCCF6A2007` FOREIGN KEY (`idFaxes`) REFERENCES `co_faxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_faxes`
--

LOCK TABLES `co_account_faxes` WRITE;
/*!40000 ALTER TABLE `co_account_faxes` DISABLE KEYS */;
INSERT INTO `co_account_faxes` (`idAccounts`, `idFaxes`) VALUES (1,2);
/*!40000 ALTER TABLE `co_account_faxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_medias`
--

DROP TABLE IF EXISTS `co_account_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_medias` (
  `idAccounts` int(11) NOT NULL,
  `idMedias` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idMedias`),
  KEY `IDX_60772810996BB4F7` (`idAccounts`),
  KEY `IDX_6077281071C3071B` (`idMedias`),
  CONSTRAINT `FK_6077281071C3071B` FOREIGN KEY (`idMedias`) REFERENCES `me_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_60772810996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_medias`
--

LOCK TABLES `co_account_medias` WRITE;
/*!40000 ALTER TABLE `co_account_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_notes`
--

DROP TABLE IF EXISTS `co_account_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_notes` (
  `idAccounts` int(11) NOT NULL,
  `idNotes` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idNotes`),
  KEY `IDX_A3FBB24A996BB4F7` (`idAccounts`),
  KEY `IDX_A3FBB24A16DFE591` (`idNotes`),
  CONSTRAINT `FK_A3FBB24A16DFE591` FOREIGN KEY (`idNotes`) REFERENCES `co_notes` (`id`),
  CONSTRAINT `FK_A3FBB24A996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_notes`
--

LOCK TABLES `co_account_notes` WRITE;
/*!40000 ALTER TABLE `co_account_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_phones`
--

DROP TABLE IF EXISTS `co_account_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_phones` (
  `idAccounts` int(11) NOT NULL,
  `idPhones` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idPhones`),
  KEY `IDX_918DA964996BB4F7` (`idAccounts`),
  KEY `IDX_918DA9648039866F` (`idPhones`),
  CONSTRAINT `FK_918DA9648039866F` FOREIGN KEY (`idPhones`) REFERENCES `co_phones` (`id`),
  CONSTRAINT `FK_918DA964996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_phones`
--

LOCK TABLES `co_account_phones` WRITE;
/*!40000 ALTER TABLE `co_account_phones` DISABLE KEYS */;
INSERT INTO `co_account_phones` (`idAccounts`, `idPhones`) VALUES (1,2);
/*!40000 ALTER TABLE `co_account_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_social_media_profiles`
--

DROP TABLE IF EXISTS `co_account_social_media_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_social_media_profiles` (
  `idAccounts` int(11) NOT NULL,
  `idSocialMediaProfiles` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idSocialMediaProfiles`),
  KEY `IDX_E06F75F5996BB4F7` (`idAccounts`),
  KEY `IDX_E06F75F5573F8344` (`idSocialMediaProfiles`),
  CONSTRAINT `FK_E06F75F5573F8344` FOREIGN KEY (`idSocialMediaProfiles`) REFERENCES `co_social_media_profiles` (`id`),
  CONSTRAINT `FK_E06F75F5996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_social_media_profiles`
--

LOCK TABLES `co_account_social_media_profiles` WRITE;
/*!40000 ALTER TABLE `co_account_social_media_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_social_media_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_tags`
--

DROP TABLE IF EXISTS `co_account_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_tags` (
  `idAccounts` int(11) NOT NULL,
  `idTags` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idTags`),
  KEY `IDX_E8D92005996BB4F7` (`idAccounts`),
  KEY `IDX_E8D920051C41CAB8` (`idTags`),
  CONSTRAINT `FK_E8D920051C41CAB8` FOREIGN KEY (`idTags`) REFERENCES `ta_tags` (`id`),
  CONSTRAINT `FK_E8D92005996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_tags`
--

LOCK TABLES `co_account_tags` WRITE;
/*!40000 ALTER TABLE `co_account_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_urls`
--

DROP TABLE IF EXISTS `co_account_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_urls` (
  `idAccounts` int(11) NOT NULL,
  `idUrls` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idUrls`),
  KEY `IDX_ADF18382996BB4F7` (`idAccounts`),
  KEY `IDX_ADF183825969693F` (`idUrls`),
  CONSTRAINT `FK_ADF183825969693F` FOREIGN KEY (`idUrls`) REFERENCES `co_urls` (`id`),
  CONSTRAINT `FK_ADF18382996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_urls`
--

LOCK TABLES `co_account_urls` WRITE;
/*!40000 ALTER TABLE `co_account_urls` DISABLE KEYS */;
INSERT INTO `co_account_urls` (`idAccounts`, `idUrls`) VALUES (1,1);
/*!40000 ALTER TABLE `co_account_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_accounts`
--

DROP TABLE IF EXISTS `co_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `externalId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corporation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registerNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `placeOfJurisdiction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mainEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mainPhone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mainFax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mainUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `idContactsMain` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  `idAccountsParent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_805CD14A6D4A8651` (`idContactsMain`),
  KEY `IDX_805CD14ADBF11E1D` (`idUsersCreator`),
  KEY `IDX_805CD14A30D07CD5` (`idUsersChanger`),
  KEY `IDX_805CD14AC9171171` (`idAccountsParent`),
  KEY `IDX_805CD14AE48E9A13` (`logo`),
  KEY `IDX_805CD14A5E237E06` (`name`),
  CONSTRAINT `FK_805CD14A30D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_805CD14A6D4A8651` FOREIGN KEY (`idContactsMain`) REFERENCES `co_contacts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_805CD14AC9171171` FOREIGN KEY (`idAccountsParent`) REFERENCES `co_accounts` (`id`),
  CONSTRAINT `FK_805CD14ADBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_805CD14AE48E9A13` FOREIGN KEY (`logo`) REFERENCES `me_media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_accounts`
--

LOCK TABLES `co_accounts` WRITE;
/*!40000 ALTER TABLE `co_accounts` DISABLE KEYS */;
INSERT INTO `co_accounts` (`id`, `logo`, `name`, `externalId`, `number`, `corporation`, `uid`, `registerNumber`, `placeOfJurisdiction`, `mainEmail`, `mainPhone`, `mainFax`, `mainUrl`, `created`, `changed`, `lft`, `rgt`, `depth`, `idContactsMain`, `idUsersCreator`, `idUsersChanger`, `idAccountsParent`) VALUES (1,17,'Netexy',NULL,'00001','Digital strategy, design, engineering and marketing for high-growth organizations.','',NULL,NULL,'info@netexy.com','+38 (073) 774 74 73','+1 (847) 220 48 38','https://netexy.com','2018-07-08 15:53:32','2018-08-29 19:37:20',1,2,0,1,1,1,NULL);
/*!40000 ALTER TABLE `co_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_address_types`
--

DROP TABLE IF EXISTS `co_address_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_address_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_address_types`
--

LOCK TABLES `co_address_types` WRITE;
/*!40000 ALTER TABLE `co_address_types` DISABLE KEYS */;
INSERT INTO `co_address_types` (`id`, `name`) VALUES (1,'address.work'),(2,'address.home');
/*!40000 ALTER TABLE `co_address_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_addresses`
--

DROP TABLE IF EXISTS `co_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primaryAddress` tinyint(1) DEFAULT NULL,
  `deliveryAddress` tinyint(1) DEFAULT NULL,
  `billingAddress` tinyint(1) DEFAULT NULL,
  `street` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addition` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postboxNumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postboxPostcode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postboxCity` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `idAdressTypes` int(11) NOT NULL,
  `idCountries` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_26E9A6142A37021A` (`idAdressTypes`),
  KEY `IDX_26E9A614A18CC0FB` (`idCountries`),
  CONSTRAINT `FK_26E9A6142A37021A` FOREIGN KEY (`idAdressTypes`) REFERENCES `co_address_types` (`id`),
  CONSTRAINT `FK_26E9A614A18CC0FB` FOREIGN KEY (`idCountries`) REFERENCES `co_countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_addresses`
--

LOCK TABLES `co_addresses` WRITE;
/*!40000 ALTER TABLE `co_addresses` DISABLE KEYS */;
INSERT INTO `co_addresses` (`id`, `title`, `primaryAddress`, `deliveryAddress`, `billingAddress`, `street`, `number`, `addition`, `zip`, `city`, `state`, `postboxNumber`, `postboxPostcode`, `postboxCity`, `latitude`, `longitude`, `note`, `idAdressTypes`, `idCountries`) VALUES (1,'Адреса',NULL,0,0,'Галицька ','43б','','76018','Івано-Франківськ','','','','',NULL,NULL,'',1,231);
/*!40000 ALTER TABLE `co_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_bank_account`
--

DROP TABLE IF EXISTS `co_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_bank_account`
--

LOCK TABLES `co_bank_account` WRITE;
/*!40000 ALTER TABLE `co_bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_addresses`
--

DROP TABLE IF EXISTS `co_contact_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` tinyint(1) NOT NULL,
  `idAddresses` int(11) NOT NULL,
  `idContacts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DEE056893205E4060E33F28` (`idAddresses`,`idContacts`),
  KEY `IDX_DEE056893205E40` (`idAddresses`),
  KEY `IDX_DEE056860E33F28` (`idContacts`),
  CONSTRAINT `FK_DEE056860E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DEE056893205E40` FOREIGN KEY (`idAddresses`) REFERENCES `co_addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_addresses`
--

LOCK TABLES `co_contact_addresses` WRITE;
/*!40000 ALTER TABLE `co_contact_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_bank_accounts`
--

DROP TABLE IF EXISTS `co_contact_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_bank_accounts` (
  `idContacts` int(11) NOT NULL,
  `idBankAccounts` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idBankAccounts`),
  KEY `IDX_76CDDA0660E33F28` (`idContacts`),
  KEY `IDX_76CDDA0637FCD1D8` (`idBankAccounts`),
  CONSTRAINT `FK_76CDDA0637FCD1D8` FOREIGN KEY (`idBankAccounts`) REFERENCES `co_bank_account` (`id`),
  CONSTRAINT `FK_76CDDA0660E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_bank_accounts`
--

LOCK TABLES `co_contact_bank_accounts` WRITE;
/*!40000 ALTER TABLE `co_contact_bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_categories`
--

DROP TABLE IF EXISTS `co_contact_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_categories` (
  `idContacts` int(11) NOT NULL,
  `idCategories` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idCategories`),
  KEY `IDX_8D2C3E2360E33F28` (`idContacts`),
  KEY `IDX_8D2C3E23B8075882` (`idCategories`),
  CONSTRAINT `FK_8D2C3E2360E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8D2C3E23B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_categories`
--

LOCK TABLES `co_contact_categories` WRITE;
/*!40000 ALTER TABLE `co_contact_categories` DISABLE KEYS */;
INSERT INTO `co_contact_categories` (`idContacts`, `idCategories`) VALUES (1,1);
/*!40000 ALTER TABLE `co_contact_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_emails`
--

DROP TABLE IF EXISTS `co_contact_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_emails` (
  `idContacts` int(11) NOT NULL,
  `idEmails` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idEmails`),
  KEY `IDX_8982963160E33F28` (`idContacts`),
  KEY `IDX_898296312F9040C8` (`idEmails`),
  CONSTRAINT `FK_898296312F9040C8` FOREIGN KEY (`idEmails`) REFERENCES `co_emails` (`id`),
  CONSTRAINT `FK_8982963160E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_emails`
--

LOCK TABLES `co_contact_emails` WRITE;
/*!40000 ALTER TABLE `co_contact_emails` DISABLE KEYS */;
INSERT INTO `co_contact_emails` (`idContacts`, `idEmails`) VALUES (1,1),(3,3);
/*!40000 ALTER TABLE `co_contact_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_faxes`
--

DROP TABLE IF EXISTS `co_contact_faxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_faxes` (
  `idContacts` int(11) NOT NULL,
  `idFaxes` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idFaxes`),
  KEY `IDX_61EBBEA260E33F28` (`idContacts`),
  KEY `IDX_61EBBEA2CF6A2007` (`idFaxes`),
  CONSTRAINT `FK_61EBBEA260E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`),
  CONSTRAINT `FK_61EBBEA2CF6A2007` FOREIGN KEY (`idFaxes`) REFERENCES `co_faxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_faxes`
--

LOCK TABLES `co_contact_faxes` WRITE;
/*!40000 ALTER TABLE `co_contact_faxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_faxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_locales`
--

DROP TABLE IF EXISTS `co_contact_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_locales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `idContacts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_31E5672760E33F28` (`idContacts`),
  CONSTRAINT `FK_31E5672760E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_locales`
--

LOCK TABLES `co_contact_locales` WRITE;
/*!40000 ALTER TABLE `co_contact_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_medias`
--

DROP TABLE IF EXISTS `co_contact_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_medias` (
  `idContacts` int(11) NOT NULL,
  `idMedias` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idMedias`),
  KEY `IDX_D7D1D1E260E33F28` (`idContacts`),
  KEY `IDX_D7D1D1E271C3071B` (`idMedias`),
  CONSTRAINT `FK_D7D1D1E260E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D7D1D1E271C3071B` FOREIGN KEY (`idMedias`) REFERENCES `me_media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_medias`
--

LOCK TABLES `co_contact_medias` WRITE;
/*!40000 ALTER TABLE `co_contact_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_notes`
--

DROP TABLE IF EXISTS `co_contact_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_notes` (
  `idContacts` int(11) NOT NULL,
  `idNotes` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idNotes`),
  KEY `IDX_B85E7B3460E33F28` (`idContacts`),
  KEY `IDX_B85E7B3416DFE591` (`idNotes`),
  CONSTRAINT `FK_B85E7B3416DFE591` FOREIGN KEY (`idNotes`) REFERENCES `co_notes` (`id`),
  CONSTRAINT `FK_B85E7B3460E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_notes`
--

LOCK TABLES `co_contact_notes` WRITE;
/*!40000 ALTER TABLE `co_contact_notes` DISABLE KEYS */;
INSERT INTO `co_contact_notes` (`idContacts`, `idNotes`) VALUES (1,1);
/*!40000 ALTER TABLE `co_contact_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_phones`
--

DROP TABLE IF EXISTS `co_contact_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_phones` (
  `idContacts` int(11) NOT NULL,
  `idPhones` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idPhones`),
  KEY `IDX_262B509660E33F28` (`idContacts`),
  KEY `IDX_262B50968039866F` (`idPhones`),
  CONSTRAINT `FK_262B509660E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`),
  CONSTRAINT `FK_262B50968039866F` FOREIGN KEY (`idPhones`) REFERENCES `co_phones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_phones`
--

LOCK TABLES `co_contact_phones` WRITE;
/*!40000 ALTER TABLE `co_contact_phones` DISABLE KEYS */;
INSERT INTO `co_contact_phones` (`idContacts`, `idPhones`) VALUES (1,1),(1,4),(2,6),(3,5);
/*!40000 ALTER TABLE `co_contact_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_social_media_profiles`
--

DROP TABLE IF EXISTS `co_contact_social_media_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_social_media_profiles` (
  `idContacts` int(11) NOT NULL,
  `idSocialMediaProfiles` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idSocialMediaProfiles`),
  KEY `IDX_74FF4CC060E33F28` (`idContacts`),
  KEY `IDX_74FF4CC0573F8344` (`idSocialMediaProfiles`),
  CONSTRAINT `FK_74FF4CC0573F8344` FOREIGN KEY (`idSocialMediaProfiles`) REFERENCES `co_social_media_profiles` (`id`),
  CONSTRAINT `FK_74FF4CC060E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_social_media_profiles`
--

LOCK TABLES `co_contact_social_media_profiles` WRITE;
/*!40000 ALTER TABLE `co_contact_social_media_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_social_media_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_tags`
--

DROP TABLE IF EXISTS `co_contact_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_tags` (
  `idContacts` int(11) NOT NULL,
  `idTags` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idTags`),
  KEY `IDX_4CB5255060E33F28` (`idContacts`),
  KEY `IDX_4CB525501C41CAB8` (`idTags`),
  CONSTRAINT `FK_4CB525501C41CAB8` FOREIGN KEY (`idTags`) REFERENCES `ta_tags` (`id`),
  CONSTRAINT `FK_4CB5255060E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_tags`
--

LOCK TABLES `co_contact_tags` WRITE;
/*!40000 ALTER TABLE `co_contact_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_titles`
--

DROP TABLE IF EXISTS `co_contact_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4463FC02B36786B` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_titles`
--

LOCK TABLES `co_contact_titles` WRITE;
/*!40000 ALTER TABLE `co_contact_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_urls`
--

DROP TABLE IF EXISTS `co_contact_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_urls` (
  `idContacts` int(11) NOT NULL,
  `idUrls` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idUrls`),
  KEY `IDX_99D86D760E33F28` (`idContacts`),
  KEY `IDX_99D86D75969693F` (`idUrls`),
  CONSTRAINT `FK_99D86D75969693F` FOREIGN KEY (`idUrls`) REFERENCES `co_urls` (`id`),
  CONSTRAINT `FK_99D86D760E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_urls`
--

LOCK TABLES `co_contact_urls` WRITE;
/*!40000 ALTER TABLE `co_contact_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contacts`
--

DROP TABLE IF EXISTS `co_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` int(11) DEFAULT NULL,
  `firstName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `middleName` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `salutation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formOfAddress` int(11) DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mainEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mainPhone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mainFax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mainUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idTitles` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_79D45A95A254E939` (`idTitles`),
  KEY `IDX_79D45A951677722F` (`avatar`),
  KEY `IDX_79D45A95DBF11E1D` (`idUsersCreator`),
  KEY `IDX_79D45A9530D07CD5` (`idUsersChanger`),
  KEY `IDX_79D45A952392A156` (`firstName`),
  KEY `IDX_79D45A9591161A88` (`lastName`),
  CONSTRAINT `FK_79D45A951677722F` FOREIGN KEY (`avatar`) REFERENCES `me_media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_79D45A9530D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_79D45A95A254E939` FOREIGN KEY (`idTitles`) REFERENCES `co_contact_titles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_79D45A95DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contacts`
--

LOCK TABLES `co_contacts` WRITE;
/*!40000 ALTER TABLE `co_contacts` DISABLE KEYS */;
INSERT INTO `co_contacts` (`id`, `avatar`, `firstName`, `middleName`, `lastName`, `birthday`, `salutation`, `formOfAddress`, `newsletter`, `gender`, `mainEmail`, `mainPhone`, `mainFax`, `mainUrl`, `created`, `changed`, `idTitles`, `idUsersCreator`, `idUsersChanger`) VALUES (1,16,'Руслан',NULL,'Митько','1986-01-04','',0,NULL,NULL,'netexy@icloud.com','+38 (073) 774 74 73',NULL,NULL,'2018-07-04 10:26:15','2018-08-06 21:53:52',NULL,NULL,NULL),(2,19,'Коля',NULL,'Федотів','1992-07-23','',0,NULL,NULL,NULL,'+38 (099) 3017313',NULL,NULL,'2018-07-13 04:14:57','2018-09-15 18:09:58',NULL,1,1),(3,71,'Дмитрий',NULL,'Zorkyy',NULL,'',0,NULL,NULL,'zorkyysokol@gmail.com','+38 (096) 623 0154',NULL,NULL,'2018-09-15 18:04:40','2018-09-15 18:05:11',NULL,1,1);
/*!40000 ALTER TABLE `co_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_countries`
--

DROP TABLE IF EXISTS `co_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_countries`
--

LOCK TABLES `co_countries` WRITE;
/*!40000 ALTER TABLE `co_countries` DISABLE KEYS */;
INSERT INTO `co_countries` (`id`, `name`, `code`) VALUES (1,'Afghanistan','AF'),(2,'Åland Islands','AX'),(3,'Albania','AL'),(4,'Algeria','DZ'),(5,'American Samoa','AS'),(6,'Andorra','AD'),(7,'Angola','AO'),(8,'Anguilla','AI'),(9,'Antarctica','AQ'),(10,'Antigua and Barbuda','AG'),(11,'Argentina','AR'),(12,'Armenia','AM'),(13,'Aruba','AW'),(14,'Australia','AU'),(15,'Austria','AT'),(16,'Azerbaijan','AZ'),(17,'Bahamas','BS'),(18,'Bahrain','BH'),(19,'Bangladesh','BD'),(20,'Barbados','BB'),(21,'Belarus','BY'),(22,'Belgium','BE'),(23,'Belize','BZ'),(24,'Benin','BJ'),(25,'Bermuda','BM'),(26,'Bhutan','BT'),(27,'Bolivia','BO'),(28,'Bonaire, Sint Eustatius and Saba','BQ'),(29,'Bosnia and Herzegovina','BA'),(30,'Botswana','BW'),(31,'Bouvet Island','BV'),(32,'Brazil','BR'),(33,'British Indian Ocean Territory','IO'),(34,'Brunei Darussalam','BN'),(35,'Bulgaria','BG'),(36,'Burkina Faso','BF'),(37,'Burundi','BI'),(38,'Cambodia','KH'),(39,'Cameroon','CM'),(40,'Canada','CA'),(41,'Cape Verde','CV'),(42,'Cayman Islands','KY'),(43,'Central African Republic','CF'),(44,'Chad','TD'),(45,'Chile','CL'),(46,'China','CN'),(47,'Christmas Island','CX'),(48,'Cocos (Keeling) Islands','CC'),(49,'Colombia','CO'),(50,'Comoros','KM'),(51,'Congo','CG'),(52,'Cook Islands','CK'),(53,'Costa Rica','CR'),(54,'Côte d\'Ivoire','CI'),(55,'Croatia','HR'),(56,'Cuba','CU'),(57,'Curaçao','CW'),(58,'Cyprus','CY'),(59,'Czech Republic','CZ'),(60,'Denmark','DK'),(61,'Djibouti','DJ'),(62,'Dominica','DM'),(63,'Dominican Republic','DO'),(64,'Ecuador','EC'),(65,'Egypt','EG'),(66,'El Salvador','SV'),(67,'Equatorial Guinea','GQ'),(68,'Eritrea','ER'),(69,'Estonia','EE'),(70,'Ethiopia','ET'),(71,'Falkland Islands','FK'),(72,'Faroe Islands','FO'),(73,'Fiji','FJ'),(74,'Finland','FI'),(75,'France','FR'),(76,'French Guiana','GF'),(77,'French Polynesia','PF'),(78,'French Southern Territories','TF'),(79,'Gabon','GA'),(80,'Gambia','GM'),(81,'Georgia','GE'),(82,'Germany','DE'),(83,'Ghana','GH'),(84,'Gibraltar','GI'),(85,'Greece','GR'),(86,'Greenland','GL'),(87,'Grenada','GD'),(88,'Guadeloupe','GP'),(89,'Guam','GU'),(90,'Guatemala','GT'),(91,'Guernsey','GG'),(92,'Guinea','GN'),(93,'Guinea-Bissau','GW'),(94,'Guyana','GY'),(95,'Haiti','HT'),(96,'Heard Island and McDonald Islands','HM'),(97,'Holy See','VA'),(98,'Honduras','HN'),(99,'Hong Kong','HK'),(100,'Hungary','HU'),(101,'Iceland','IS'),(102,'India','IN'),(103,'Indonesia','ID'),(104,'Iran','IR'),(105,'Iraq','IQ'),(106,'Ireland','IE'),(107,'Isle of Man','IM'),(108,'Israel','IL'),(109,'Italy','IT'),(110,'Jamaica','JM'),(111,'Japan','JP'),(112,'Jersey','JE'),(113,'Jordan','JO'),(114,'Kazakhstan','KZ'),(115,'Kenya','KE'),(116,'Kiribati','KI'),(117,'Korea','KR'),(118,'Kuwait','KW'),(119,'Kyrgyzstan','KG'),(120,'Lao People\'s Democratic Republic','LA'),(121,'Latvia','LV'),(122,'Lebanon','LB'),(123,'Lesotho','LS'),(124,'Liberia','LR'),(125,'Libya','LY'),(126,'Liechtenstein','LI'),(127,'Lithuania','LT'),(128,'Luxembourg','LU'),(129,'Macao','MO'),(130,'Macedonia','MK'),(131,'Madagascar','MG'),(132,'Malawi','MW'),(133,'Malaysia','MY'),(134,'Maldives','MV'),(135,'Mali','ML'),(136,'Malta','MT'),(137,'Marshall Islands','MH'),(138,'Martinique','MQ'),(139,'Mauritania','MR'),(140,'Mauritius','MU'),(141,'Mayotte','YT'),(142,'Mexico','MX'),(143,'Micronesia','FM'),(144,'Moldova','MD'),(145,'Monaco','MC'),(146,'Mongolia','MN'),(147,'Montenegro','ME'),(148,'Montserrat','MS'),(149,'Morocco','MA'),(150,'Mozambique','MZ'),(151,'Myanmar','MM'),(152,'Namibia','NA'),(153,'Nauru','NR'),(154,'Nepal','NP'),(155,'Netherlands','NL'),(156,'New Caledonia','NC'),(157,'New Zealand','NZ'),(158,'Nicaragua','NI'),(159,'Niger','NE'),(160,'Nigeria','NG'),(161,'Niue','NU'),(162,'Norfolk Island','NF'),(163,'Northern Mariana Islands','MP'),(164,'Norway','NO'),(165,'Oman','OM'),(166,'Pakistan','PK'),(167,'Palau','PW'),(168,'Palestine','PS'),(169,'Panama','PA'),(170,'Papua New Guinea','PG'),(171,'Paraguay','PY'),(172,'Peru','PE'),(173,'Philippines','PH'),(174,'Pitcairn','PN'),(175,'Poland','PL'),(176,'Portugal','PT'),(177,'Puerto Rico','PR'),(178,'Qatar','QA'),(179,'Réunion','RE'),(180,'Romania','RO'),(181,'Russian Federation','RU'),(182,'Rwanda','RW'),(183,'Saint Barthélemy','BL'),(184,'Saint Helena, Ascension and Tristan da Cunha','SH'),(185,'Saint Kitts and Nevis','KN'),(186,'Saint Lucia','LC'),(187,'Saint Martin','MF'),(188,'Saint Pierre and Miquelon','PM'),(189,'Saint Vincent and the Grenadines','VC'),(190,'Samoa','WS'),(191,'San Marino','SM'),(192,'Sao Tome and Principe','ST'),(193,'Saudi Arabia','SA'),(194,'Senegal','SN'),(195,'Serbia','RS'),(196,'Seychelles','SC'),(197,'Sierra Leone','SL'),(198,'Singapore','SG'),(199,'Sint Maarten','SX'),(200,'Slovakia','SK'),(201,'Slovenia','SI'),(202,'Solomon Islands','SB'),(203,'Somalia','SO'),(204,'South Africa','ZA'),(205,'South Georgia and the South Sandwich Islands','GS'),(206,'South Sudan','SS'),(207,'Spain','ES'),(208,'Sri Lanka','LK'),(209,'Sudan','SD'),(210,'Suriname','SR'),(211,'Svalbard and Jan Mayen','SJ'),(212,'Swaziland','SZ'),(213,'Sweden','SE'),(214,'Switzerland','CH'),(215,'Syrian Arab Republic','SY'),(216,'Taiwan','TW'),(217,'Tajikistan','TJ'),(218,'Tanzania','TZ'),(219,'Thailand','TH'),(220,'Timor-Leste','TL'),(221,'Togo','TG'),(222,'Tokelau','TK'),(223,'Tonga','TO'),(224,'Trinidad and Tobago','TT'),(225,'Tunisia','TN'),(226,'Turkey','TR'),(227,'Turkmenistan','TM'),(228,'Turks and Caicos Islands','TC'),(229,'Tuvalu','TV'),(230,'Uganda','UG'),(231,'Ukraine','UA'),(232,'United Arab Emirates','AE'),(233,'United Kingdom','GB'),(234,'United States','US'),(235,'United States Minor Outlying Islands','UM'),(236,'Uruguay','UY'),(237,'Uzbekistan','UZ'),(238,'Vanuatu','VU'),(239,'Venezuela','VE'),(240,'Viet Nam','VN'),(241,'Virgin Islands (British)','VG'),(242,'Virgin Islands (U.S.)','VI'),(243,'Wallis and Futuna','WF'),(244,'Western Sahara','EH'),(245,'Yemen','YE'),(246,'Zambia','ZM'),(247,'Zimbabwe','ZW');
/*!40000 ALTER TABLE `co_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_email_types`
--

DROP TABLE IF EXISTS `co_email_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_email_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_email_types`
--

LOCK TABLES `co_email_types` WRITE;
/*!40000 ALTER TABLE `co_email_types` DISABLE KEYS */;
INSERT INTO `co_email_types` (`id`, `name`) VALUES (1,'email.work'),(2,'email.home');
/*!40000 ALTER TABLE `co_email_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_emails`
--

DROP TABLE IF EXISTS `co_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `idEmailTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A2F2CB77D816E840` (`idEmailTypes`),
  KEY `IDX_A2F2CB77E7927C74` (`email`),
  CONSTRAINT `FK_A2F2CB77D816E840` FOREIGN KEY (`idEmailTypes`) REFERENCES `co_email_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_emails`
--

LOCK TABLES `co_emails` WRITE;
/*!40000 ALTER TABLE `co_emails` DISABLE KEYS */;
INSERT INTO `co_emails` (`id`, `email`, `idEmailTypes`) VALUES (1,'netexy@icloud.com',1),(2,'info@netexy.com',1),(3,'zorkyysokol@gmail.com',1);
/*!40000 ALTER TABLE `co_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_fax_types`
--

DROP TABLE IF EXISTS `co_fax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_fax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_fax_types`
--

LOCK TABLES `co_fax_types` WRITE;
/*!40000 ALTER TABLE `co_fax_types` DISABLE KEYS */;
INSERT INTO `co_fax_types` (`id`, `name`) VALUES (1,'fax.work'),(2,'fax.home');
/*!40000 ALTER TABLE `co_fax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_faxes`
--

DROP TABLE IF EXISTS `co_faxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_faxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idFaxTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A5EC6A18B466C5DA` (`idFaxTypes`),
  CONSTRAINT `FK_A5EC6A18B466C5DA` FOREIGN KEY (`idFaxTypes`) REFERENCES `co_fax_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_faxes`
--

LOCK TABLES `co_faxes` WRITE;
/*!40000 ALTER TABLE `co_faxes` DISABLE KEYS */;
INSERT INTO `co_faxes` (`id`, `fax`, `idFaxTypes`) VALUES (1,'+1 (847) 220 48 38',1),(2,'+1 (847) 220 48 38',1);
/*!40000 ALTER TABLE `co_faxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_notes`
--

DROP TABLE IF EXISTS `co_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_notes`
--

LOCK TABLES `co_notes` WRITE;
/*!40000 ALTER TABLE `co_notes` DISABLE KEYS */;
INSERT INTO `co_notes` (`id`, `value`) VALUES (1,'SkillourAPI {\n\'deploy\' = ( \'server\', upgrade\', \'secure\', \'configure\', \'automate\' ); \n\'develope\' = ( \'pwa\', \'frontend, \'templates\', \'layouts\', \'blocks\' );\n\'integrate\' = ( \'seo\', \'optimize\', \'solutions\', \'newFeautures\' );\n\'designe\' = ( \'branding\', \'prototype\', \'graphic\', \'socialMedia\' );\n\'digitalMarketing\' = ( \'analytics\', \'strategy\', \'smm\', \'seo\' );\n}');
/*!40000 ALTER TABLE `co_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_phone_types`
--

DROP TABLE IF EXISTS `co_phone_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_phone_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_phone_types`
--

LOCK TABLES `co_phone_types` WRITE;
/*!40000 ALTER TABLE `co_phone_types` DISABLE KEYS */;
INSERT INTO `co_phone_types` (`id`, `name`) VALUES (1,'phone.work'),(2,'phone.home'),(3,'phone.mobile');
/*!40000 ALTER TABLE `co_phone_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_phones`
--

DROP TABLE IF EXISTS `co_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `idPhoneTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D5B0DD0A4249AD7` (`idPhoneTypes`),
  CONSTRAINT `FK_D5B0DD0A4249AD7` FOREIGN KEY (`idPhoneTypes`) REFERENCES `co_phone_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_phones`
--

LOCK TABLES `co_phones` WRITE;
/*!40000 ALTER TABLE `co_phones` DISABLE KEYS */;
INSERT INTO `co_phones` (`id`, `phone`, `idPhoneTypes`) VALUES (1,'+38 (073) 774 74 73',1),(2,'+38 (073) 774 74 73',1),(3,'+1 (847) 220 48 38',1),(4,'+1 (847) 220 48 38',1),(5,'+38 (096) 623 0154',1),(6,'+38 (099) 3017313',1);
/*!40000 ALTER TABLE `co_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_positions`
--

DROP TABLE IF EXISTS `co_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9FBC367E462CE4F5` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_positions`
--

LOCK TABLES `co_positions` WRITE;
/*!40000 ALTER TABLE `co_positions` DISABLE KEYS */;
INSERT INTO `co_positions` (`id`, `position`) VALUES (1,'Засновник (Founder)');
/*!40000 ALTER TABLE `co_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_social_media_profile_types`
--

DROP TABLE IF EXISTS `co_social_media_profile_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_social_media_profile_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_social_media_profile_types`
--

LOCK TABLES `co_social_media_profile_types` WRITE;
/*!40000 ALTER TABLE `co_social_media_profile_types` DISABLE KEYS */;
INSERT INTO `co_social_media_profile_types` (`id`, `name`) VALUES (1,'Facebook'),(2,'Twitter'),(3,'Instagram');
/*!40000 ALTER TABLE `co_social_media_profile_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_social_media_profiles`
--

DROP TABLE IF EXISTS `co_social_media_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_social_media_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idSocialMediaTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DF585BFBB5BEA95F` (`idSocialMediaTypes`),
  CONSTRAINT `FK_DF585BFBB5BEA95F` FOREIGN KEY (`idSocialMediaTypes`) REFERENCES `co_social_media_profile_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_social_media_profiles`
--

LOCK TABLES `co_social_media_profiles` WRITE;
/*!40000 ALTER TABLE `co_social_media_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_social_media_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_url_types`
--

DROP TABLE IF EXISTS `co_url_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_url_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_url_types`
--

LOCK TABLES `co_url_types` WRITE;
/*!40000 ALTER TABLE `co_url_types` DISABLE KEYS */;
INSERT INTO `co_url_types` (`id`, `name`) VALUES (1,'url.work'),(2,'url.home');
/*!40000 ALTER TABLE `co_url_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_urls`
--

DROP TABLE IF EXISTS `co_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idUrlTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6F03842E882335CC` (`idUrlTypes`),
  CONSTRAINT `FK_6F03842E882335CC` FOREIGN KEY (`idUrlTypes`) REFERENCES `co_url_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_urls`
--

LOCK TABLES `co_urls` WRITE;
/*!40000 ALTER TABLE `co_urls` DISABLE KEYS */;
INSERT INTO `co_urls` (`id`, `url`, `idUrlTypes`) VALUES (1,'https://netexy.com',1);
/*!40000 ALTER TABLE `co_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fo_dynamics`
--

DROP TABLE IF EXISTS `fo_dynamics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fo_dynamics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `typeId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `webspaceKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `typeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salutation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `function` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` longtext COLLATE utf8_unicode_ci,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textarea` longtext COLLATE utf8_unicode_ci,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkbox` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkboxMultiple` longtext COLLATE utf8_unicode_ci,
  `dropdown` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropdownMultiple` longtext COLLATE utf8_unicode_ci,
  `radioButtons` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `formId` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EC8AF0309E50CC11` (`formId`),
  KEY `IDX_EC8AF030DBF11E1D` (`idUsersCreator`),
  KEY `IDX_EC8AF03030D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_EC8AF03030D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EC8AF0309E50CC11` FOREIGN KEY (`formId`) REFERENCES `fo_forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_EC8AF030DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fo_dynamics`
--

LOCK TABLES `fo_dynamics` WRITE;
/*!40000 ALTER TABLE `fo_dynamics` DISABLE KEYS */;
INSERT INTO `fo_dynamics` (`id`, `type`, `typeId`, `locale`, `webspaceKey`, `typeName`, `salutation`, `title`, `firstName`, `lastName`, `email`, `phone`, `fax`, `street`, `zip`, `city`, `state`, `country`, `function`, `company`, `text`, `textarea`, `date`, `attachment`, `checkbox`, `checkboxMultiple`, `dropdown`, `dropdownMultiple`, `radioButtons`, `data`, `created`, `changed`, `formId`, `idUsersCreator`, `idUsersChanger`) VALUES (1,'page','577b5e38-57c7-42cc-b935-0a2732f78a74','en','core-ntx','Test products',NULL,NULL,'Test',NULL,NULL,'+380737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-07 16:31:36','2018-07-07 16:31:36',NULL,NULL,NULL),(2,'page','577b5e38-57c7-42cc-b935-0a2732f78a74','uk','core-ntx','Test products',NULL,NULL,'test',NULL,NULL,'3807355556',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-07 19:27:18','2018-07-07 19:27:18',NULL,NULL,NULL),(3,'page','94b8bdc1-1be3-4cf7-b9e8-9f6efe147310','uk','core-ntx','Головна',NULL,NULL,'олол',NULL,NULL,'олоол',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-07 19:35:25','2018-07-07 19:35:25',NULL,NULL,NULL),(4,'page','94b8bdc1-1be3-4cf7-b9e8-9f6efe147310','uk','core-ntx','Головна',NULL,NULL,'test',NULL,NULL,'123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-07 19:57:03','2018-07-07 19:57:03',NULL,NULL,NULL),(5,'page','94b8bdc1-1be3-4cf7-b9e8-9f6efe147310','uk','core-ntx','Головна',NULL,NULL,'test',NULL,NULL,'+380737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-10 22:43:43','2018-07-10 22:43:43',NULL,NULL,NULL),(6,'page','94b8bdc1-1be3-4cf7-b9e8-9f6efe147310','uk','core-ntx','Головна',NULL,NULL,'323223',NULL,NULL,'3223232',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-10 22:44:56','2018-07-10 22:44:56',NULL,NULL,NULL),(7,'page','94b8bdc1-1be3-4cf7-b9e8-9f6efe147310','uk','core-ntx','Головна',NULL,NULL,'322323',NULL,NULL,'32323',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-10 23:14:20','2018-07-10 23:14:20',NULL,NULL,NULL),(8,'page','94b8bdc1-1be3-4cf7-b9e8-9f6efe147310','uk','core-ntx','Головна',NULL,NULL,'Тест',NULL,NULL,'0737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-11 04:56:02','2018-07-11 04:56:02',2,NULL,NULL),(9,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'Test',NULL,NULL,'+38 (073) 774 74 73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-11 15:30:07','2018-07-11 15:30:07',2,NULL,NULL),(10,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'Ruslan',NULL,NULL,'+38 (073) 774 74 73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-11 15:42:14','2018-07-11 15:42:14',2,NULL,NULL),(11,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'Тест',NULL,NULL,'0737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-12 02:15:42','2018-07-12 02:15:42',2,NULL,NULL),(12,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'Тест',NULL,NULL,'0737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-12 12:02:09','2018-07-12 12:02:09',2,NULL,NULL),(13,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'Тест',NULL,NULL,'0737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-07-14 02:52:52','2018-07-14 02:52:52',2,NULL,NULL),(14,'page','568b1018-c5db-41b3-b3f1-5dcdcaa6a08a','uk','core-ntx','Платформа',NULL,NULL,'Test',NULL,NULL,'+380737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-09 04:27:46','2018-08-09 04:27:46',2,NULL,NULL),(15,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'Test',NULL,NULL,'+38 073 774 74 73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-27 21:10:03','2018-08-27 21:10:03',2,NULL,NULL),(16,'page','19a32019-4b3a-48b3-8674-c394d8a7a57d','uk','core-ntx','Інфраструктура',NULL,NULL,'Руслан',NULL,NULL,'+38 073 774 74 73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"DEV\",\"UX\",\"SEO\"]',NULL,NULL,'Senior','[]','2018-08-28 04:06:02','2018-08-28 04:06:02',3,NULL,NULL),(17,'page','19a32019-4b3a-48b3-8674-c394d8a7a57d','uk','core-ntx','Інфраструктура',NULL,NULL,'Test',NULL,NULL,'777',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"DEV\",\"UX\",\"SEO\"]',NULL,NULL,'Middle ','[]','2018-08-28 04:24:16','2018-08-28 04:24:16',3,NULL,NULL),(18,'page','568b1018-c5db-41b3-b3f1-5dcdcaa6a08a','uk','core-ntx','Платформа',NULL,NULL,'Test',NULL,NULL,'+38 073 774 74 73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-28 04:25:00','2018-08-28 04:25:00',2,NULL,NULL),(19,'page','19a32019-4b3a-48b3-8674-c394d8a7a57d','uk','core-ntx','Інфраструктура',NULL,NULL,'Test',NULL,NULL,'777',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"DEV\",\"UX\"]',NULL,NULL,NULL,'[]','2018-08-28 05:16:20','2018-08-28 05:16:20',3,NULL,NULL),(20,'page','19a32019-4b3a-48b3-8674-c394d8a7a57d','uk','core-ntx','Інфраструктура',NULL,NULL,'Test',NULL,NULL,'777',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'Junior','[]','2018-08-28 05:16:36','2018-08-28 05:16:36',3,NULL,NULL),(21,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'Test',NULL,NULL,'1234567',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-28 11:24:51','2018-08-28 11:24:51',2,NULL,NULL),(22,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'test',NULL,NULL,'+12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-28 11:37:16','2018-08-28 11:37:16',2,NULL,NULL),(23,'page','04873e43-8ceb-45f1-9e34-004bb2c5012d','uk','core-ntx','Маркетинг',NULL,NULL,'Тестове повідомлення',NULL,NULL,'+3837327783278237832',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-28 12:18:06','2018-08-28 12:18:06',2,NULL,NULL),(24,'page','19a32019-4b3a-48b3-8674-c394d8a7a57d','uk','core-ntx','Інфраструктура',NULL,NULL,'Test',NULL,NULL,'5855874',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-28 21:08:53','2018-08-28 21:08:53',3,NULL,NULL),(25,'page','ecf6aee1-b052-4208-bd66-31c85a16095e','uk','core-ntx','Послуги',NULL,NULL,'Руслан',NULL,NULL,'+380737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Івано-Франківськ','Розробка веб-сайту','2018-11-11',NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-29 18:58:49','2018-08-29 18:58:49',4,NULL,NULL),(26,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Руслан',NULL,NULL,'+38 073 774 74 73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Цифрова стратегія, проектування, дизайн, веб розробка, інжиніринг та маркетинг для компаній з високими темпами зростання.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-30 04:49:54','2018-08-30 04:49:54',5,NULL,NULL),(27,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Test',NULL,NULL,'+38 073 774 7473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тест',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-30 14:40:21','2018-08-30 14:40:21',5,NULL,NULL),(28,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Test',NULL,NULL,'8855808',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тест',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-30 16:34:10','2018-08-30 16:34:10',5,NULL,NULL),(29,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Text',NULL,NULL,'0737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-30 20:24:38','2018-08-30 20:24:38',5,NULL,NULL),(30,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Test',NULL,NULL,'12345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-31 02:45:32','2018-08-31 02:45:32',5,NULL,NULL),(31,'page','ecf6aee1-b052-4208-bd66-31c85a16095e','uk','core-ntx','Послуги',NULL,NULL,'Test',NULL,NULL,'5558888',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-31 20:38:10','2018-08-31 20:38:10',4,NULL,NULL),(32,'page','ecf6aee1-b052-4208-bd66-31c85a16095e','uk','core-ntx','Послуги',NULL,NULL,'Test',NULL,NULL,'+380737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-31 22:07:49','2018-08-31 22:07:49',4,NULL,NULL),(33,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Test',NULL,NULL,'8855808',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Message',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-31 22:13:40','2018-08-31 22:13:40',5,NULL,NULL),(34,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Text',NULL,NULL,'8855808',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Message',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-31 22:18:41','2018-08-31 22:18:41',5,NULL,NULL),(35,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Test',NULL,NULL,'+38 073 774 7473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test message',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-31 23:02:21','2018-08-31 23:02:21',5,NULL,NULL),(36,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Test',NULL,NULL,'8855808',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-31 23:33:48','2018-08-31 23:33:48',5,NULL,NULL),(37,'page','e5d9170b-0c59-47ad-ac0c-f1988a0b7af7','uk','core-ntx','Контакти',NULL,NULL,'Test',NULL,NULL,'8855808',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-08-31 23:37:32','2018-08-31 23:37:32',5,NULL,NULL),(38,'page','ecf6aee1-b052-4208-bd66-31c85a16095e','uk','core-ntx','Послуги',NULL,NULL,'Test',NULL,NULL,'+38 073 774 7473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Message',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-09-01 00:21:17','2018-09-01 00:21:17',4,NULL,NULL),(39,'page','39cec43f-2701-482b-b4b8-9c73dee95331','uk','core-ntx','-30% на наші послуги!',NULL,NULL,'Test',NULL,NULL,'+380737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тест',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-09-11 21:04:54','2018-09-11 21:04:54',4,NULL,NULL),(40,'page','39cec43f-2701-482b-b4b8-9c73dee95331','uk','core-ntx','-30% на наші послуги!',NULL,NULL,'Test',NULL,NULL,'+380737747473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test message',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]','2018-09-15 00:32:58','2018-09-15 00:32:58',4,NULL,NULL);
/*!40000 ALTER TABLE `fo_dynamics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fo_form_field_translations`
--

DROP TABLE IF EXISTS `fo_form_field_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fo_form_field_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8_unicode_ci,
  `placeholder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultValue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8_unicode_ci,
  `idFormFields` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D3E6716F2C2B00B` (`idFormFields`),
  CONSTRAINT `FK_D3E6716F2C2B00B` FOREIGN KEY (`idFormFields`) REFERENCES `fo_form_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fo_form_field_translations`
--

LOCK TABLES `fo_form_field_translations` WRITE;
/*!40000 ALTER TABLE `fo_form_field_translations` DISABLE KEYS */;
INSERT INTO `fo_form_field_translations` (`id`, `title`, `placeholder`, `defaultValue`, `shortTitle`, `locale`, `options`, `idFormFields`) VALUES (5,'Ваше ім\'я','','','Ім\'я','uk','[]',3),(6,'Телефон','+12 345 678 99 00','','','uk','[]',4),(7,'Firstname','','','','en','[]',3),(8,'Phone','+12 345 678 99 00','','','en','[]',4),(9,'',NULL,NULL,'','uk','[]',5),(10,'Ім\'я','','','','uk','[]',6),(11,'Телефон','','','','uk','[]',7),(15,'',NULL,NULL,'','uk','[]',11),(16,'Ваше ім\'я','','','Ім\'я','uk','[]',12),(17,'Телефон','+38 (0XX) XXX XX XX','','','uk','[]',13),(22,'Ваше ім\'я','','','Ім\'я','uk','[]',18),(23,'Телефон','+38 (0XX) XXX XX XX','','','uk','[]',19),(24,'Повідомлення','','','','uk','[]',20),(25,'',NULL,NULL,'','uk','[]',21),(26,'',NULL,NULL,'','uk','[]',22),(27,'Повідомлення','','','','uk','[]',23);
/*!40000 ALTER TABLE `fo_form_field_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fo_form_fields`
--

DROP TABLE IF EXISTS `fo_form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fo_form_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `orderNumber` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  `defaultLocale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `idForms` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D544F184EAFB58EA6773D512` (`idForms`,`keyName`),
  KEY `IDX_D544F184EAFB58EA` (`idForms`),
  CONSTRAINT `FK_D544F184EAFB58EA` FOREIGN KEY (`idForms`) REFERENCES `fo_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fo_form_fields`
--

LOCK TABLES `fo_form_fields` WRITE;
/*!40000 ALTER TABLE `fo_form_fields` DISABLE KEYS */;
INSERT INTO `fo_form_fields` (`id`, `keyName`, `orderNumber`, `type`, `width`, `required`, `defaultLocale`, `idForms`) VALUES (3,'firstName',1,'firstName','full',1,'uk',2),(4,'phone',2,'phone','full',1,'uk',2),(5,'recaptcha',3,'recaptcha','full',0,'uk',2),(6,'firstName',1,'firstName','full',1,'uk',3),(7,'phone',2,'phone','full',1,'uk',3),(11,'recaptcha',3,'recaptcha','full',0,'uk',3),(12,'firstName',1,'firstName','full',1,'uk',4),(13,'phone',2,'phone','full',1,'uk',4),(18,'firstName',1,'firstName','full',1,'uk',5),(19,'phone',2,'phone','full',1,'uk',5),(20,'textarea',3,'textarea','full',0,'uk',5),(21,'recaptcha',4,'recaptcha','full',0,'uk',5),(22,'recaptcha',4,'recaptcha','full',0,'uk',4),(23,'textarea',3,'textarea','full',0,'uk',4);
/*!40000 ALTER TABLE `fo_form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fo_form_translation_receivers`
--

DROP TABLE IF EXISTS `fo_form_translation_receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fo_form_translation_receivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idFormTranslations` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E57BDF29F4EA7C89` (`idFormTranslations`),
  CONSTRAINT `FK_E57BDF29F4EA7C89` FOREIGN KEY (`idFormTranslations`) REFERENCES `fo_form_translations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fo_form_translation_receivers`
--

LOCK TABLES `fo_form_translation_receivers` WRITE;
/*!40000 ALTER TABLE `fo_form_translation_receivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `fo_form_translation_receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fo_form_translations`
--

DROP TABLE IF EXISTS `fo_form_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fo_form_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailText` longtext COLLATE utf8_unicode_ci,
  `submitLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `successText` longtext COLLATE utf8_unicode_ci,
  `sendAttachments` tinyint(1) NOT NULL DEFAULT '0',
  `deactivateNotifyMails` tinyint(1) NOT NULL DEFAULT '0',
  `deactivateCustomerMails` tinyint(1) NOT NULL DEFAULT '0',
  `replyTo` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idForms` int(11) NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8BAF12FFEAFB58EA` (`idForms`),
  KEY `IDX_8BAF12FFDBF11E1D` (`idUsersCreator`),
  KEY `IDX_8BAF12FF30D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_8BAF12FF30D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8BAF12FFDBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8BAF12FFEAFB58EA` FOREIGN KEY (`idForms`) REFERENCES `fo_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fo_form_translations`
--

LOCK TABLES `fo_form_translations` WRITE;
/*!40000 ALTER TABLE `fo_form_translations` DISABLE KEYS */;
INSERT INTO `fo_form_translations` (`id`, `title`, `subject`, `fromEmail`, `fromName`, `toEmail`, `toName`, `mailText`, `submitLabel`, `successText`, `sendAttachments`, `deactivateNotifyMails`, `deactivateCustomerMails`, `replyTo`, `locale`, `created`, `changed`, `idForms`, `idUsersCreator`, `idUsersChanger`) VALUES (3,'Форма','Netexy ','info@netexy.com','Netexy Inc.','netexy@icloud.com','Private','<p>Повідомлення відправлено</p>\n','Надіслати','<p>Повідомлення відправлено</p>\n',1,0,0,0,'uk','2018-07-11 01:24:36','2018-08-28 11:11:05',2,1,1),(4,'Form','Netexy Inc. [web]','info@netexy.com','Netexy Inc.','netexy@icloud.com','','<p>Повідомлення відправлено</p>\n','Надіслати','<p>Повідомлення відправлено</p>\n',0,0,0,0,'en','2018-07-11 02:35:47','2018-07-11 15:27:00',2,1,1),(5,'Опитування','Опитування','info@netexy.com','Netexy Inc.','netexy@icloud.com','Анкетне опитування','<p>Анкету успішно відправлено.</p>\n','Надіслати','<p>Анкету успішно відправлено.</p>\n',1,0,0,0,'uk','2018-08-28 03:59:00','2018-08-29 18:30:24',3,1,1),(6,'[NTX] Послуги','Netexy - Послуги','info@netexy.com','Netexy [services]','netexy@icloud.com','Netexy Manager [services]','<p>Повідомлення відправлено</p>\n','Надіслати','<p>Повідомлення відправлено</p>\n',1,0,0,0,'uk','2018-08-29 18:47:54','2018-09-07 23:37:46',4,1,1),(7,'[NTX] Зворотній зв\'язок','[NTX] Зворотній зв\'язок','info@netexy.com','Netexy [contact]','netexy@icloud.com','Netexy Manager [contact]','<p>Повідомлення відправлено</p>\n','Надіслати','<p>Повідомлення відправлено</p>\n',1,0,0,0,'uk','2018-08-30 04:35:10','2018-08-30 23:53:53',5,1,1);
/*!40000 ALTER TABLE `fo_form_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fo_forms`
--

DROP TABLE IF EXISTS `fo_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fo_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaultLocale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fo_forms`
--

LOCK TABLES `fo_forms` WRITE;
/*!40000 ALTER TABLE `fo_forms` DISABLE KEYS */;
INSERT INTO `fo_forms` (`id`, `defaultLocale`) VALUES (2,'uk'),(3,'uk'),(4,'uk'),(5,'uk');
/*!40000 ALTER TABLE `fo_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_collection_meta`
--

DROP TABLE IF EXISTS `me_collection_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_collection_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `idCollections` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F8D5E71693782C96` (`idCollections`),
  KEY `IDX_F8D5E7162B36786B` (`title`),
  KEY `IDX_F8D5E7164180C698` (`locale`),
  CONSTRAINT `FK_F8D5E71693782C96` FOREIGN KEY (`idCollections`) REFERENCES `me_collections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_collection_meta`
--

LOCK TABLES `me_collection_meta` WRITE;
/*!40000 ALTER TABLE `me_collection_meta` DISABLE KEYS */;
INSERT INTO `me_collection_meta` (`id`, `title`, `description`, `locale`, `idCollections`) VALUES (1,'System',NULL,'uk',1),(2,'Sulu forms',NULL,'en',2),(3,'Sulu Formulare',NULL,'de',2),(4,'Attachments',NULL,'en',3),(5,'Anhänge',NULL,'de',3),(6,'Sulu media',NULL,'en',4),(7,'Sulu Medien',NULL,'de',4),(8,'Preview images',NULL,'en',5),(9,'Vorschaubilder',NULL,'de',5),(10,'Sulu contacts',NULL,'en',6),(11,'Sulu Kontakte',NULL,'de',6),(12,'People',NULL,'en',7),(13,'Personen',NULL,'de',7),(14,'Organizations',NULL,'en',8),(15,'Organisationen',NULL,'de',8),(16,'media','image & video files','en',9),(17,'test','test directory','en',10),(18,'System',NULL,'en',1),(19,'app',NULL,'uk',11),(20,'Documents',NULL,'uk',12),(21,'netexy',NULL,'uk',13),(22,'icons',NULL,'uk',14),(23,'meta-cover',NULL,'uk',15),(24,'manifest',NULL,'uk',16),(25,'space',NULL,'uk',17),(26,'social',NULL,'uk',18),(27,'promo',NULL,'uk',19),(28,'wallpapiers',NULL,'uk',20);
/*!40000 ALTER TABLE `me_collection_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_collection_types`
--

DROP TABLE IF EXISTS `me_collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_collection_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection_type_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FB78DFB179078378` (`collection_type_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_collection_types`
--

LOCK TABLES `me_collection_types` WRITE;
/*!40000 ALTER TABLE `me_collection_types` DISABLE KEYS */;
INSERT INTO `me_collection_types` (`id`, `name`, `collection_type_key`, `description`) VALUES (1,'Default','collection.default',NULL),(2,'System Collections','collection.system',NULL);
/*!40000 ALTER TABLE `me_collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_collections`
--

DROP TABLE IF EXISTS `me_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `collection_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idCollectionTypes` int(11) NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  `idCollectionsMetaDefault` int(11) DEFAULT NULL,
  `idCollectionsParent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F0D4887221904CD` (`collection_key`),
  UNIQUE KEY `UNIQ_F0D4887CFA3F467` (`idCollectionsMetaDefault`),
  KEY `IDX_F0D4887E67924D6` (`idCollectionTypes`),
  KEY `IDX_F0D4887DBF11E1D` (`idUsersCreator`),
  KEY `IDX_F0D488730D07CD5` (`idUsersChanger`),
  KEY `IDX_F0D4887A4F2DCF8` (`idCollectionsParent`),
  CONSTRAINT `FK_F0D488730D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F0D4887A4F2DCF8` FOREIGN KEY (`idCollectionsParent`) REFERENCES `me_collections` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F0D4887CFA3F467` FOREIGN KEY (`idCollectionsMetaDefault`) REFERENCES `me_collection_meta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F0D4887DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F0D4887E67924D6` FOREIGN KEY (`idCollectionTypes`) REFERENCES `me_collection_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_collections`
--

LOCK TABLES `me_collections` WRITE;
/*!40000 ALTER TABLE `me_collections` DISABLE KEYS */;
INSERT INTO `me_collections` (`id`, `style`, `lft`, `rgt`, `depth`, `collection_key`, `created`, `changed`, `idCollectionTypes`, `idUsersCreator`, `idUsersChanger`, `idCollectionsMetaDefault`, `idCollectionsParent`) VALUES (1,NULL,1,16,0,'system_collections','2018-07-04 10:21:34','2018-07-04 10:21:34',2,NULL,NULL,1,NULL),(2,NULL,2,5,1,'sulu_form','2018-07-04 10:21:34','2018-08-04 04:00:54',2,NULL,1,2,1),(3,NULL,3,4,2,'sulu_form.attachments','2018-07-04 10:21:34','2018-08-04 04:00:54',2,NULL,1,4,2),(4,NULL,6,9,1,'sulu_media','2018-07-04 10:21:34','2018-08-04 04:00:54',2,NULL,1,6,1),(5,NULL,7,8,2,'sulu_media.preview_image','2018-07-04 10:21:34','2018-08-04 04:00:54',2,NULL,1,8,4),(6,NULL,10,15,1,'sulu_contact','2018-07-04 10:21:34','2018-08-04 04:00:54',2,NULL,1,10,1),(7,NULL,11,12,2,'sulu_contact.contact','2018-07-04 10:21:34','2018-08-04 04:00:54',2,NULL,1,12,6),(8,NULL,13,14,2,'sulu_contact.account','2018-07-04 10:21:34','2018-08-04 04:00:54',2,NULL,1,14,6),(9,NULL,17,20,0,NULL,'2018-07-07 02:56:41','2018-07-07 02:56:41',1,1,1,16,NULL),(10,NULL,18,19,1,NULL,'2018-07-07 02:57:14','2018-07-07 02:57:14',1,1,1,17,9),(11,NULL,21,22,0,NULL,'2018-07-11 01:15:37','2018-07-11 01:15:37',1,1,1,19,NULL),(12,NULL,23,24,0,NULL,'2018-07-13 19:28:59','2018-07-13 19:28:59',1,1,1,20,NULL),(13,NULL,25,40,0,NULL,'2018-08-04 20:55:26','2018-08-04 20:55:26',1,1,1,21,NULL),(14,NULL,26,31,1,NULL,'2018-08-04 20:55:35','2018-08-04 20:55:35',1,1,1,22,13),(15,NULL,32,33,1,NULL,'2018-08-04 21:08:57','2018-08-04 21:08:57',1,1,1,23,13),(16,NULL,27,28,2,NULL,'2018-08-28 06:38:16','2018-08-28 06:38:16',1,1,1,24,14),(17,NULL,34,35,1,NULL,'2018-08-28 08:46:43','2018-08-28 08:46:43',1,1,1,25,13),(18,NULL,29,30,2,NULL,'2018-08-29 22:52:22','2018-08-29 22:52:22',1,1,1,26,14),(19,NULL,36,37,1,NULL,'2018-08-30 21:59:11','2018-08-30 21:59:11',1,1,1,27,13),(20,NULL,38,39,1,NULL,'2018-09-10 19:04:57','2018-09-10 19:04:57',1,1,1,28,13);
/*!40000 ALTER TABLE `me_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_categories`
--

DROP TABLE IF EXISTS `me_file_version_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_categories` (
  `idFileVersions` int(11) NOT NULL,
  `idCategories` int(11) NOT NULL,
  PRIMARY KEY (`idFileVersions`,`idCategories`),
  KEY `IDX_2F1E17D0911ADE33` (`idFileVersions`),
  KEY `IDX_2F1E17D0B8075882` (`idCategories`),
  CONSTRAINT `FK_2F1E17D0911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2F1E17D0B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_categories`
--

LOCK TABLES `me_file_version_categories` WRITE;
/*!40000 ALTER TABLE `me_file_version_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_content_languages`
--

DROP TABLE IF EXISTS `me_file_version_content_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_content_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `idFileVersions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F3FD652C911ADE33` (`idFileVersions`),
  CONSTRAINT `FK_F3FD652C911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_content_languages`
--

LOCK TABLES `me_file_version_content_languages` WRITE;
/*!40000 ALTER TABLE `me_file_version_content_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_content_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_meta`
--

DROP TABLE IF EXISTS `me_file_version_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `copyright` longtext COLLATE utf8_unicode_ci,
  `credits` longtext COLLATE utf8_unicode_ci,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `idFileVersions` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AD44B0AD911ADE33` (`idFileVersions`),
  KEY `IDX_AD44B0AD2B36786B` (`title`),
  KEY `IDX_AD44B0AD4180C698` (`locale`),
  CONSTRAINT `FK_AD44B0AD911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_meta`
--

LOCK TABLES `me_file_version_meta` WRITE;
/*!40000 ALTER TABLE `me_file_version_meta` DISABLE KEYS */;
INSERT INTO `me_file_version_meta` (`id`, `title`, `description`, `copyright`, `credits`, `locale`, `idFileVersions`) VALUES (1,'img-7','',NULL,NULL,'uk',1),(2,'img-5','',NULL,NULL,'uk',2),(3,'img-6','',NULL,NULL,'uk',3),(4,'img-13','',NULL,NULL,'uk',4),(5,'img-2','','','','uk',5),(6,'img-1','',NULL,NULL,'uk',6),(7,'img-11','',NULL,NULL,'uk',7),(8,'img-8','',NULL,NULL,'uk',8),(9,'img-4','','','','uk',9),(10,'img-9','',NULL,NULL,'uk',10),(11,'img-10','',NULL,NULL,'uk',11),(12,'img-12','','','','uk',12),(13,'img-3','','','','uk',13),(14,'img-14','',NULL,NULL,'uk',14),(15,'6ZBPXW',NULL,NULL,NULL,'uk',15),(16,'Ruslan Mytko',NULL,NULL,NULL,'uk',16),(17,'App LOGO - 300@1x',NULL,NULL,NULL,'uk',17),(18,'OutDoor@0,2',NULL,NULL,NULL,'uk',18),(19,'19956248_1935829866696016_669853980344591058_o',NULL,NULL,NULL,'uk',19),(20,'demo-video','','','','uk',20),(21,'Руслан Митько',NULL,NULL,NULL,'uk',21),(22,'Руслан Митько',NULL,NULL,NULL,'uk',22),(23,'Netexy','','','','uk',23),(24,'mask-icon',NULL,NULL,NULL,'uk',24),(25,'social-logo-512x512',NULL,NULL,NULL,'uk',25),(26,'logo-512x512',NULL,NULL,NULL,'uk',26),(27,'favicon',NULL,NULL,NULL,'uk',27),(29,'clean-logo',NULL,NULL,NULL,'uk',29),(31,'mask-icon','','','','uk',31),(32,'logo-128',NULL,NULL,NULL,'uk',32),(33,'logo-144',NULL,NULL,NULL,'uk',33),(34,'logo-152',NULL,NULL,NULL,'uk',34),(35,'logo-192',NULL,NULL,NULL,'uk',35),(36,'logo-256',NULL,NULL,NULL,'uk',36),(37,'logo-512',NULL,NULL,NULL,'uk',37),(38,'space1',NULL,NULL,NULL,'uk',38),(39,'space-x',NULL,NULL,NULL,'uk',39),(40,'space2',NULL,NULL,NULL,'uk',40),(41,'space3',NULL,NULL,NULL,'uk',41),(42,'space4',NULL,NULL,NULL,'uk',42),(43,'space5',NULL,NULL,NULL,'uk',43),(44,'slack',NULL,NULL,NULL,'uk',44),(45,'github-logo',NULL,NULL,NULL,'uk',45),(46,'vimeo',NULL,NULL,NULL,'uk',46),(47,'linkedin',NULL,NULL,NULL,'uk',47),(48,'dribbble',NULL,NULL,NULL,'uk',48),(49,'behance',NULL,NULL,NULL,'uk',49),(50,'twitter',NULL,NULL,NULL,'uk',50),(51,'youtube',NULL,NULL,NULL,'uk',51),(52,'facebook',NULL,NULL,NULL,'uk',52),(53,'telegram',NULL,NULL,NULL,'uk',53),(56,'logo_wide',NULL,NULL,NULL,'uk',56),(58,'sair5656-photo-id-938','','','','uk',58),(59,'sair5656-photo-id-938','','','','uk',59),(60,'google-merchant-1200x600',NULL,NULL,NULL,'uk',60),(61,'fb-forms-1200x628',NULL,NULL,NULL,'uk',61),(62,'536529_backgrounds-for-your-computer-or-presentation_4500x3000_h','','','','uk',62),(63,'technology-or-bio-molecular-structure-with-space-for-text-4k-looped-animation-presentation-background_voflj4vnl__F0000',NULL,NULL,NULL,'uk',63),(64,'promo_space_blow',NULL,NULL,NULL,'uk',64),(65,'fb-cover-950x354',NULL,NULL,NULL,'uk',65),(66,'fb-cover-950x354(EN)',NULL,NULL,NULL,'uk',66),(67,'fb-forms-1200x600[UA]','','','','uk',67),(68,'fb-forms-1200x628[UA]',NULL,NULL,NULL,'uk',68),(73,'Netexy-MAX[UA]',NULL,NULL,NULL,'uk',73),(74,'Netexy-MAX[EN]',NULL,NULL,NULL,'uk',74),(75,'fb_promo-1200x628',NULL,NULL,NULL,'uk',75),(76,'fb_promo-1200x628','','','','uk',76),(77,'fb_promo-1200x628','','','','uk',77),(78,'fb_promo-1200x628','','','','uk',78),(79,'fb_promo-1200x628','','','','uk',79),(80,'fb_promo-1200x628','','','','uk',80),(81,'fb_promo-1200x628','','','','uk',81),(82,'fb_promo-1200x628','','','','uk',82),(83,'2018-09-15 18.03.11',NULL,NULL,NULL,'uk',83);
/*!40000 ALTER TABLE `me_file_version_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_publish_languages`
--

DROP TABLE IF EXISTS `me_file_version_publish_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_publish_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `idFileVersions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_195DAB3C911ADE33` (`idFileVersions`),
  CONSTRAINT `FK_195DAB3C911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_publish_languages`
--

LOCK TABLES `me_file_version_publish_languages` WRITE;
/*!40000 ALTER TABLE `me_file_version_publish_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_publish_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_tags`
--

DROP TABLE IF EXISTS `me_file_version_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_tags` (
  `idFileVersions` int(11) NOT NULL,
  `idTags` int(11) NOT NULL,
  PRIMARY KEY (`idFileVersions`,`idTags`),
  KEY `IDX_150A30BE911ADE33` (`idFileVersions`),
  KEY `IDX_150A30BE1C41CAB8` (`idTags`),
  CONSTRAINT `FK_150A30BE1C41CAB8` FOREIGN KEY (`idTags`) REFERENCES `ta_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_150A30BE911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_tags`
--

LOCK TABLES `me_file_version_tags` WRITE;
/*!40000 ALTER TABLE `me_file_version_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_versions`
--

DROP TABLE IF EXISTS `me_file_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `subVersion` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL,
  `downloadCounter` int(11) NOT NULL DEFAULT '0',
  `storageOptions` longtext COLLATE utf8_unicode_ci,
  `mimeType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `focusPointX` int(11) DEFAULT NULL,
  `focusPointY` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idFileVersionsMetaDefault` int(11) DEFAULT NULL,
  `idFiles` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7B6E89456B801096` (`idFileVersionsMetaDefault`),
  KEY `IDX_7B6E894511F10344` (`idFiles`),
  KEY `IDX_7B6E8945DBF11E1D` (`idUsersCreator`),
  KEY `IDX_7B6E894530D07CD5` (`idUsersChanger`),
  KEY `IDX_7B6E8945D8F2A087` (`mimeType`),
  KEY `IDX_7B6E8945F7C0246A` (`size`),
  KEY `IDX_7B6E8945BF1CD3C3` (`version`),
  KEY `IDX_7B6E89455E237E06` (`name`),
  CONSTRAINT `FK_7B6E894511F10344` FOREIGN KEY (`idFiles`) REFERENCES `me_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7B6E894530D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7B6E89456B801096` FOREIGN KEY (`idFileVersionsMetaDefault`) REFERENCES `me_file_version_meta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7B6E8945DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_versions`
--

LOCK TABLES `me_file_versions` WRITE;
/*!40000 ALTER TABLE `me_file_versions` DISABLE KEYS */;
INSERT INTO `me_file_versions` (`id`, `name`, `version`, `subVersion`, `size`, `downloadCounter`, `storageOptions`, `mimeType`, `properties`, `focusPointX`, `focusPointY`, `created`, `changed`, `idFileVersionsMetaDefault`, `idFiles`, `idUsersCreator`, `idUsersChanger`) VALUES (1,'wallhaven-281623.jpg',1,0,485789,1,'{\"segment\":\"03\",\"fileName\":\"wallhaven-281623.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:29','2018-08-05 03:13:08',1,1,1,1),(2,'wallhaven-318273.jpg',1,0,932059,4,'{\"segment\":\"03\",\"fileName\":\"wallhaven-318273.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:29','2018-08-05 03:13:07',2,2,1,1),(3,'wallhaven-315504.jpg',1,0,632369,5,'{\"segment\":\"07\",\"fileName\":\"wallhaven-315504.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:29','2018-08-05 03:13:07',3,3,1,1),(4,'wallhaven-138124.jpg',1,0,814425,0,'{\"segment\":\"01\",\"fileName\":\"wallhaven-138124.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:30','2018-08-05 03:13:09',4,4,1,1),(5,'wallhaven-78537.jpg',1,0,1651955,7,'{\"segment\":\"04\",\"fileName\":\"wallhaven-78537.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:30','2018-08-05 03:13:06',5,5,1,1),(6,'wallhaven-95980.jpg',1,0,1197566,8,'{\"segment\":\"01\",\"fileName\":\"wallhaven-95980.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:31','2018-08-05 03:13:07',6,6,1,1),(7,'wallhaven-186129.jpg',1,0,1688932,1,'{\"segment\":\"02\",\"fileName\":\"wallhaven-186129.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:32','2018-08-05 03:13:09',7,7,1,1),(8,'wallhaven-276426.jpg',1,0,756110,2,'{\"segment\":\"04\",\"fileName\":\"wallhaven-276426.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:32','2018-08-05 03:13:08',8,8,1,1),(9,'wallhaven-336059.jpg',1,0,1035621,3,'{\"segment\":\"03\",\"fileName\":\"wallhaven-336059.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:33','2018-08-05 03:13:07',9,9,1,1),(10,'wallhaven-24419.jpg',1,0,854175,1,'{\"segment\":\"06\",\"fileName\":\"wallhaven-24419.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:33','2018-08-05 03:13:08',10,10,1,1),(11,'wallhaven-228113.jpg',1,0,483808,2,'{\"segment\":\"05\",\"fileName\":\"wallhaven-228113.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:34','2018-08-05 03:13:08',11,11,1,1),(12,'wallhaven-160186.jpg',1,0,1096547,4,'{\"segment\":\"05\",\"fileName\":\"wallhaven-160186.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:35','2018-08-05 03:13:09',12,12,1,1),(13,'wallhaven-88956.jpg',1,0,385145,18,'{\"segment\":\"01\",\"fileName\":\"wallhaven-88956.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:35','2018-08-05 03:13:06',13,13,1,1),(14,'wallhaven-12013.jpg',1,0,702950,2,'{\"segment\":\"03\",\"fileName\":\"wallhaven-12013.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:36','2018-08-05 03:13:10',14,14,1,1),(15,'6ZBPXW.jpg',1,0,1462865,3,'{\"segment\":\"05\",\"fileName\":\"6zbpxw.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-07 02:58:36','2018-07-07 02:58:36',15,15,1,1),(16,'my_photo_cut-bg.png',1,0,19505,1,'{\"segment\":\"04\",\"fileName\":\"my_photo_cut-bg.png\"}','image/png','{}',NULL,NULL,'2018-07-08 15:43:19','2018-07-08 15:43:19',16,16,1,1),(17,'App LOGO - 300@1x.png',1,0,42096,154,'{\"segment\":\"10\",\"fileName\":\"app-logo-3001x.png\"}','image/png','{}',NULL,NULL,'2018-07-08 15:48:36','2018-07-08 15:48:36',17,17,1,1),(18,'OutDoor@0,2.png',1,0,1595025,4,'{\"segment\":\"03\",\"fileName\":\"outdoor02.png\"}','image/png','{}',NULL,NULL,'2018-07-11 01:18:02','2018-07-11 01:18:02',18,18,1,1),(19,'19956248_1935829866696016_669853980344591058_o.jpg',1,0,141329,0,'{\"segment\":\"09\",\"fileName\":\"19956248_1935829866696016_669853980344591058_o.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-07-13 04:14:34','2018-07-13 04:14:34',19,19,1,1),(20,'demo.mp4',1,0,2441891,2128,'{\"segment\":\"03\",\"fileName\":\"demo.mp4\"}','video/mp4','{\"duration\":\"30.102000\"}',NULL,NULL,'2018-07-13 22:46:53','2018-07-13 22:47:19',20,20,1,1),(21,'36187986_2121557298079198_4139582693560025088_n.jpg',2,0,58159,0,'{\"segment\":\"04\",\"fileName\":\"36187986_2121557298079198_4139582693560025088_n.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-04 09:27:56','2018-08-04 09:27:56',21,16,1,1),(22,'36187986_2121557298079198_4139582693560025088_n.jpg',3,0,58159,0,'{\"segment\":\"04\",\"fileName\":\"36187986_2121557298079198_4139582693560025088_n-1.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-04 09:28:14','2018-08-04 09:28:14',22,16,1,1),(23,'social-logo-512x512.png',2,0,219803,1,'{\"segment\":\"10\",\"fileName\":\"social-logo-512x512.png\"}','image/png','{}',NULL,NULL,'2018-08-04 17:14:42','2018-08-04 21:29:33',23,17,1,1),(24,'mask-icon.svg',1,0,7705,4,'{\"segment\":\"09\",\"fileName\":\"mask-icon.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-04 20:56:20','2018-08-04 20:56:20',24,21,1,1),(25,'social-logo-512x512.png',1,0,97279,0,'{\"segment\":\"08\",\"fileName\":\"social-logo-512x512.png\"}','image/png','{}',NULL,NULL,'2018-08-04 20:56:32','2018-08-04 20:56:32',25,22,1,1),(26,'logo-512x512.svg',1,0,11721,219,'{\"segment\":\"05\",\"fileName\":\"logo-512x512.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-04 20:58:28','2018-08-04 20:58:28',26,23,1,1),(27,'favicon.ico',1,0,4286,1315,'{\"segment\":\"04\",\"fileName\":\"favicon.ico\"}','image/x-icon','{}',NULL,NULL,'2018-08-04 21:07:03','2018-08-04 21:07:03',27,24,1,1),(29,'clean-logo.png',1,0,99879,0,'{\"segment\":\"04\",\"fileName\":\"clean-logo.png\"}','image/png','{}',NULL,NULL,'2018-08-04 21:15:00','2018-08-04 21:15:00',29,26,1,1),(31,'mask-icon.svg',2,0,5106,251,'{\"segment\":\"09\",\"fileName\":\"mask-icon-1.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-06 21:37:05','2018-08-06 21:37:10',31,21,1,1),(32,'logo-128.png',1,0,14735,19,'{\"segment\":\"03\",\"fileName\":\"logo-128.png\"}','image/png','{}',NULL,NULL,'2018-08-28 06:38:24','2018-08-28 06:38:24',32,28,1,1),(33,'logo-144.png',1,0,17179,44,'{\"segment\":\"06\",\"fileName\":\"logo-144.png\"}','image/png','{}',NULL,NULL,'2018-08-28 06:38:25','2018-08-28 06:38:25',33,29,1,1),(34,'logo-152.png',1,0,18347,13,'{\"segment\":\"05\",\"fileName\":\"logo-152.png\"}','image/png','{}',NULL,NULL,'2018-08-28 06:38:26','2018-08-28 06:38:26',34,30,1,1),(35,'logo-192.png',1,0,25556,11,'{\"segment\":\"08\",\"fileName\":\"logo-192.png\"}','image/png','{}',NULL,NULL,'2018-08-28 06:38:26','2018-08-28 06:38:26',35,31,1,1),(36,'logo-256.png',1,0,37549,12,'{\"segment\":\"07\",\"fileName\":\"logo-256.png\"}','image/png','{}',NULL,NULL,'2018-08-28 06:38:27','2018-08-28 06:38:27',36,32,1,1),(37,'logo-512.png',1,0,98253,20,'{\"segment\":\"07\",\"fileName\":\"logo-512.png\"}','image/png','{}',NULL,NULL,'2018-08-28 06:38:28','2018-08-28 06:38:28',37,33,1,1),(38,'space1.jpg',1,0,132290,0,'{\"segment\":\"09\",\"fileName\":\"space1.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-28 08:52:57','2018-08-28 08:52:57',38,34,1,1),(39,'space-x.jpg',1,0,386055,0,'{\"segment\":\"07\",\"fileName\":\"space-x.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-28 08:52:57','2018-08-28 08:52:57',39,35,1,1),(40,'space2.jpg',1,0,174259,0,'{\"segment\":\"04\",\"fileName\":\"space2.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-28 08:52:58','2018-08-28 08:52:58',40,36,1,1),(41,'space3.jpg',1,0,313371,0,'{\"segment\":\"05\",\"fileName\":\"space3.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-28 08:52:59','2018-08-28 08:52:59',41,37,1,1),(42,'space4.jpg',1,0,158263,2,'{\"segment\":\"01\",\"fileName\":\"space4.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-28 08:53:00','2018-08-28 08:53:00',42,38,1,1),(43,'space5.jpg',1,0,44136,0,'{\"segment\":\"06\",\"fileName\":\"space5.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-28 08:53:01','2018-08-28 08:53:01',43,39,1,1),(44,'slack.svg',1,0,2288,0,'{\"segment\":\"03\",\"fileName\":\"slack.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:31','2018-08-29 22:52:31',44,40,1,1),(45,'github-logo.svg',1,0,2319,0,'{\"segment\":\"05\",\"fileName\":\"github-logo.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:31','2018-08-29 22:52:31',45,41,1,1),(46,'vimeo.svg',1,0,1387,0,'{\"segment\":\"08\",\"fileName\":\"vimeo.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:32','2018-08-29 22:52:32',46,42,1,1),(47,'linkedin.svg',1,0,1832,0,'{\"segment\":\"07\",\"fileName\":\"linkedin.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:33','2018-08-29 22:52:33',47,43,1,1),(48,'dribbble.svg',1,0,2132,0,'{\"segment\":\"06\",\"fileName\":\"dribbble.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:34','2018-08-29 22:52:34',48,44,1,1),(49,'behance.svg',1,0,1908,0,'{\"segment\":\"02\",\"fileName\":\"behance.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:34','2018-08-29 22:52:34',49,45,1,1),(50,'twitter.svg',1,0,1512,0,'{\"segment\":\"04\",\"fileName\":\"twitter.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:35','2018-08-29 22:52:35',50,46,1,1),(51,'youtube.svg',1,0,4699,1,'{\"segment\":\"08\",\"fileName\":\"youtube.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:36','2018-08-29 22:52:36',51,47,1,1),(52,'facebook.svg',1,0,888,4,'{\"segment\":\"04\",\"fileName\":\"facebook.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:37','2018-08-29 22:52:37',52,48,1,1),(53,'telegram.svg',1,0,1280,0,'{\"segment\":\"07\",\"fileName\":\"telegram.svg\"}','image/svg+xml','{}',NULL,NULL,'2018-08-29 22:52:38','2018-08-29 22:52:38',53,49,1,1),(56,'logo_wide.png',1,0,84998,1,'{\"segment\":\"01\",\"fileName\":\"logo_wide.png\"}','image/png','{}',NULL,NULL,'2018-08-30 03:50:43','2018-08-30 03:50:43',56,52,1,1),(58,'sair5656-photo-id-938.jpg',1,0,3251322,6,'{\"segment\":\"07\",\"fileName\":\"sair5656-photo-id-938.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-30 22:02:51','2018-08-30 22:06:40',58,54,1,1),(59,'sair5656-photo-id-938.jpg',2,0,221138,2,'{\"segment\":\"07\",\"fileName\":\"sair5656-photo-id-938-1.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-30 22:14:32','2018-08-30 22:14:32',59,54,1,1),(60,'google-merchant-1200x600.png',1,0,1089023,0,'{\"segment\":\"08\",\"fileName\":\"google-merchant-1200x600.png\"}','image/png','{}',NULL,NULL,'2018-08-30 23:04:00','2018-08-30 23:04:00',60,55,1,1),(61,'fb-forms-1200x628.png',1,0,1131028,0,'{\"segment\":\"01\",\"fileName\":\"fb-forms-1200x628.png\"}','image/png','{}',NULL,NULL,'2018-08-30 23:04:21','2018-08-30 23:04:21',61,56,1,1),(62,'536529_backgrounds-for-your-computer-or-presentation_4500x3000_h.jpg',1,0,1983057,4,'{\"segment\":\"05\",\"fileName\":\"536529_backgrounds-for-your-computer-or-presentation_4500x3000_h.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-31 01:45:36','2018-08-31 02:04:18',62,57,1,1),(63,'technology-or-bio-molecular-structure-with-space-for-text-4k-looped-animation-presentation-background_voflj4vnl__F0000.png',1,0,2911945,1,'{\"segment\":\"03\",\"fileName\":\"technology-or-bio-molecular-structure-with-space-for-text-4k-looped-animation-presentation-background_voflj4vnl__f0000.png\"}','image/png','{}',NULL,NULL,'2018-08-31 01:45:37','2018-08-31 01:45:37',63,58,1,1),(64,'promo_space_blow.jpg',1,0,222319,4,'{\"segment\":\"02\",\"fileName\":\"promo_space_blow.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-08-31 23:09:33','2018-08-31 23:09:33',64,59,1,1),(65,'fb-cover-950x354.png',1,0,567910,0,'{\"segment\":\"08\",\"fileName\":\"fb-cover-950x354.png\"}','image/png','{}',NULL,NULL,'2018-09-01 00:49:10','2018-09-01 00:49:10',65,60,1,1),(66,'fb-cover-950x354(EN).png',1,0,566743,0,'{\"segment\":\"07\",\"fileName\":\"fb-cover-950x354-en.png\"}','image/png','{}',NULL,NULL,'2018-09-01 00:51:15','2018-09-01 00:51:15',66,61,1,1),(67,'fb-forms-1200x628[UA].png',1,0,1090421,1,'{\"segment\":\"05\",\"fileName\":\"fb-forms-1200x628-ua.png\"}','image/png','{}',NULL,NULL,'2018-09-01 00:53:01','2018-09-01 00:54:13',67,62,1,1),(68,'fb-forms-1200x628[UA].png',1,0,1127803,0,'{\"segment\":\"02\",\"fileName\":\"fb-forms-1200x628-ua.png\"}','image/png','{}',NULL,NULL,'2018-09-01 00:54:59','2018-09-01 00:54:59',68,63,1,1),(73,'Netexy-MAX[UA].png',1,0,3010560,0,'{\"segment\":\"10\",\"fileName\":\"netexy-max-ua.png\"}','image/png','{}',NULL,NULL,'2018-09-10 19:25:12','2018-09-10 19:25:12',73,68,1,1),(74,'Netexy-MAX[EN].png',1,0,3007372,0,'{\"segment\":\"09\",\"fileName\":\"netexy-max-en.png\"}','image/png','{}',NULL,NULL,'2018-09-10 19:25:12','2018-09-10 19:25:12',74,69,1,1),(75,'fb_promo-1200x628.png',1,0,889435,1,'{\"segment\":\"01\",\"fileName\":\"fb_promo-1200x628.png\"}','image/png','{}',NULL,NULL,'2018-09-13 11:31:38','2018-09-13 11:31:38',75,70,1,1),(76,'fb_promo-1200x628.png',2,0,883089,2,'{\"segment\":\"01\",\"fileName\":\"fb_promo-1200x628-1.png\"}','image/png','{}',NULL,NULL,'2018-09-13 11:43:07','2018-09-13 11:43:12',76,70,1,1),(77,'fb_promo-1200x628.png',3,0,882262,2,'{\"segment\":\"01\",\"fileName\":\"fb_promo-1200x628-2.png\"}','image/png','{}',NULL,NULL,'2018-09-13 11:49:24','2018-09-13 11:49:24',77,70,1,1),(78,'fb_promo-1200x628.png',4,0,882746,2,'{\"segment\":\"01\",\"fileName\":\"fb_promo-1200x628-3.png\"}','image/png','{}',NULL,NULL,'2018-09-13 12:23:40','2018-09-13 12:23:40',78,70,1,1),(79,'fb_promo-1200x628.png',5,0,1125297,2,'{\"segment\":\"01\",\"fileName\":\"fb_promo-1200x628-4.png\"}','image/png','{}',NULL,NULL,'2018-09-13 14:28:09','2018-09-13 14:28:09',79,70,1,1),(80,'fb_promo-1200x628.png',6,0,1125471,2,'{\"segment\":\"01\",\"fileName\":\"fb_promo-1200x628-5.png\"}','image/png','{}',NULL,NULL,'2018-09-13 14:31:52','2018-09-13 14:31:52',80,70,1,1),(81,'fb_promo-1200x628.png',7,0,1125885,1,'{\"segment\":\"01\",\"fileName\":\"fb_promo-1200x628-6.png\"}','image/png','{}',NULL,NULL,'2018-09-13 14:53:07','2018-09-13 14:53:07',81,70,1,1),(82,'fb_promo-1200x628.png',8,0,1125885,1,'{\"segment\":\"01\",\"fileName\":\"fb_promo-1200x628-7.png\"}','image/png','{}',NULL,NULL,'2018-09-13 14:53:22','2018-09-13 14:53:22',82,70,1,1),(83,'2018-09-15 18.03.11.jpg',1,0,124604,0,'{\"segment\":\"10\",\"fileName\":\"2018-09-15-18-03-11.jpg\"}','image/jpeg','{}',NULL,NULL,'2018-09-15 18:04:15','2018-09-15 18:04:15',83,71,1,1);
/*!40000 ALTER TABLE `me_file_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_files`
--

DROP TABLE IF EXISTS `me_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idMedia` int(11) NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CA8D04277DE8E211` (`idMedia`),
  KEY `IDX_CA8D0427DBF11E1D` (`idUsersCreator`),
  KEY `IDX_CA8D042730D07CD5` (`idUsersChanger`),
  KEY `IDX_CA8D0427BF1CD3C3` (`version`),
  CONSTRAINT `FK_CA8D042730D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA8D04277DE8E211` FOREIGN KEY (`idMedia`) REFERENCES `me_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CA8D0427DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_files`
--

LOCK TABLES `me_files` WRITE;
/*!40000 ALTER TABLE `me_files` DISABLE KEYS */;
INSERT INTO `me_files` (`id`, `version`, `created`, `changed`, `idMedia`, `idUsersCreator`, `idUsersChanger`) VALUES (1,1,'2018-07-07 02:58:29','2018-08-05 03:13:08',1,1,1),(2,1,'2018-07-07 02:58:29','2018-08-05 03:13:07',2,1,1),(3,1,'2018-07-07 02:58:29','2018-08-05 03:13:07',3,1,1),(4,1,'2018-07-07 02:58:30','2018-08-05 03:13:09',4,1,1),(5,1,'2018-07-07 02:58:30','2018-08-05 03:13:06',5,1,1),(6,1,'2018-07-07 02:58:31','2018-08-05 03:13:07',6,1,1),(7,1,'2018-07-07 02:58:32','2018-08-05 03:13:09',7,1,1),(8,1,'2018-07-07 02:58:32','2018-08-05 03:13:08',8,1,1),(9,1,'2018-07-07 02:58:33','2018-08-05 03:13:07',9,1,1),(10,1,'2018-07-07 02:58:33','2018-08-05 03:13:08',10,1,1),(11,1,'2018-07-07 02:58:34','2018-08-05 03:13:08',11,1,1),(12,1,'2018-07-07 02:58:35','2018-08-05 03:13:09',12,1,1),(13,1,'2018-07-07 02:58:35','2018-08-05 03:13:06',13,1,1),(14,1,'2018-07-07 02:58:36','2018-08-05 03:13:10',14,1,1),(15,1,'2018-07-07 02:58:36','2018-07-07 02:58:36',15,1,1),(16,3,'2018-07-08 15:43:19','2018-08-04 09:28:14',16,1,1),(17,2,'2018-07-08 15:48:36','2018-08-04 21:29:33',17,1,1),(18,1,'2018-07-11 01:18:02','2018-07-11 01:18:02',18,1,1),(19,1,'2018-07-13 04:14:34','2018-07-13 04:14:34',19,1,1),(20,1,'2018-07-13 22:46:53','2018-07-13 22:47:19',20,1,1),(21,2,'2018-08-04 20:56:20','2018-08-06 21:37:10',21,1,1),(22,1,'2018-08-04 20:56:32','2018-08-04 20:56:32',22,1,1),(23,1,'2018-08-04 20:58:28','2018-08-04 20:58:28',23,1,1),(24,1,'2018-08-04 21:07:03','2018-08-04 21:07:03',24,1,1),(26,1,'2018-08-04 21:15:00','2018-08-04 21:15:00',26,1,1),(28,1,'2018-08-28 06:38:24','2018-08-28 06:38:24',28,1,1),(29,1,'2018-08-28 06:38:25','2018-08-28 06:38:25',29,1,1),(30,1,'2018-08-28 06:38:25','2018-08-28 06:38:25',30,1,1),(31,1,'2018-08-28 06:38:26','2018-08-28 06:38:26',31,1,1),(32,1,'2018-08-28 06:38:27','2018-08-28 06:38:27',32,1,1),(33,1,'2018-08-28 06:38:28','2018-08-28 06:38:28',33,1,1),(34,1,'2018-08-28 08:52:57','2018-08-28 08:52:57',34,1,1),(35,1,'2018-08-28 08:52:57','2018-08-28 08:52:57',35,1,1),(36,1,'2018-08-28 08:52:58','2018-08-28 08:52:58',36,1,1),(37,1,'2018-08-28 08:52:59','2018-08-28 08:52:59',37,1,1),(38,1,'2018-08-28 08:53:00','2018-08-28 08:53:00',38,1,1),(39,1,'2018-08-28 08:53:01','2018-08-28 08:53:01',39,1,1),(40,1,'2018-08-29 22:52:31','2018-08-29 22:52:31',40,1,1),(41,1,'2018-08-29 22:52:31','2018-08-29 22:52:31',41,1,1),(42,1,'2018-08-29 22:52:32','2018-08-29 22:52:32',42,1,1),(43,1,'2018-08-29 22:52:33','2018-08-29 22:52:33',43,1,1),(44,1,'2018-08-29 22:52:34','2018-08-29 22:52:34',44,1,1),(45,1,'2018-08-29 22:52:34','2018-08-29 22:52:34',45,1,1),(46,1,'2018-08-29 22:52:35','2018-08-29 22:52:35',46,1,1),(47,1,'2018-08-29 22:52:36','2018-08-29 22:52:36',47,1,1),(48,1,'2018-08-29 22:52:37','2018-08-29 22:52:37',48,1,1),(49,1,'2018-08-29 22:52:38','2018-08-29 22:52:38',49,1,1),(52,1,'2018-08-30 03:50:43','2018-08-30 03:50:43',52,1,1),(54,2,'2018-08-30 22:02:51','2018-08-30 22:14:32',54,1,1),(55,1,'2018-08-30 23:04:00','2018-08-30 23:04:00',55,1,1),(56,1,'2018-08-30 23:04:21','2018-08-30 23:04:21',56,1,1),(57,1,'2018-08-31 01:45:36','2018-08-31 02:04:18',57,1,1),(58,1,'2018-08-31 01:45:37','2018-08-31 01:45:37',58,1,1),(59,1,'2018-08-31 23:09:33','2018-08-31 23:09:33',59,1,1),(60,1,'2018-09-01 00:49:10','2018-09-01 00:49:10',60,1,1),(61,1,'2018-09-01 00:51:15','2018-09-01 00:51:15',61,1,1),(62,1,'2018-09-01 00:53:01','2018-09-01 00:54:13',62,1,1),(63,1,'2018-09-01 00:54:59','2018-09-01 00:54:59',63,1,1),(68,1,'2018-09-10 19:25:12','2018-09-10 19:25:12',68,1,1),(69,1,'2018-09-10 19:25:12','2018-09-10 19:25:12',69,1,1),(70,8,'2018-09-13 11:31:38','2018-09-13 14:53:22',70,1,1),(71,1,'2018-09-15 18:04:15','2018-09-15 18:04:15',71,1,1);
/*!40000 ALTER TABLE `me_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_format_options`
--

DROP TABLE IF EXISTS `me_format_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_format_options` (
  `format_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crop_x` int(11) NOT NULL,
  `crop_y` int(11) NOT NULL,
  `crop_width` int(11) NOT NULL,
  `crop_height` int(11) NOT NULL,
  `fileVersion` int(11) NOT NULL,
  PRIMARY KEY (`format_key`,`fileVersion`),
  KEY `IDX_6D25443B31852B63` (`fileVersion`),
  CONSTRAINT `FK_6D25443B31852B63` FOREIGN KEY (`fileVersion`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_format_options`
--

LOCK TABLES `me_format_options` WRITE;
/*!40000 ALTER TABLE `me_format_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_format_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_media`
--

DROP TABLE IF EXISTS `me_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idMediaTypes` int(11) NOT NULL,
  `idPreviewImage` int(11) DEFAULT NULL,
  `idCollections` int(11) NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A694E572D1EB44DE` (`idPreviewImage`),
  KEY `IDX_A694E57284671716` (`idMediaTypes`),
  KEY `IDX_A694E57293782C96` (`idCollections`),
  KEY `IDX_A694E572DBF11E1D` (`idUsersCreator`),
  KEY `IDX_A694E57230D07CD5` (`idUsersChanger`),
  KEY `IDX_A694E572A3F33DFA` (`changed`),
  KEY `IDX_A694E572B23DB7B8` (`created`),
  CONSTRAINT `FK_A694E57230D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A694E57284671716` FOREIGN KEY (`idMediaTypes`) REFERENCES `me_media_types` (`id`),
  CONSTRAINT `FK_A694E57293782C96` FOREIGN KEY (`idCollections`) REFERENCES `me_collections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A694E572D1EB44DE` FOREIGN KEY (`idPreviewImage`) REFERENCES `me_media` (`id`),
  CONSTRAINT `FK_A694E572DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_media`
--

LOCK TABLES `me_media` WRITE;
/*!40000 ALTER TABLE `me_media` DISABLE KEYS */;
INSERT INTO `me_media` (`id`, `created`, `changed`, `idMediaTypes`, `idPreviewImage`, `idCollections`, `idUsersCreator`, `idUsersChanger`) VALUES (1,'2018-07-07 02:58:29','2018-08-05 03:13:08',2,NULL,10,1,1),(2,'2018-07-07 02:58:29','2018-08-05 03:13:07',2,NULL,10,1,1),(3,'2018-07-07 02:58:29','2018-08-05 03:13:07',2,NULL,10,1,1),(4,'2018-07-07 02:58:30','2018-08-05 03:13:09',2,NULL,10,1,1),(5,'2018-07-07 02:58:30','2018-08-05 03:13:06',2,NULL,10,1,1),(6,'2018-07-07 02:58:31','2018-08-05 03:13:07',2,NULL,10,1,1),(7,'2018-07-07 02:58:32','2018-08-05 03:13:09',2,NULL,10,1,1),(8,'2018-07-07 02:58:32','2018-08-05 03:13:08',2,NULL,10,1,1),(9,'2018-07-07 02:58:33','2018-08-05 03:13:07',2,NULL,10,1,1),(10,'2018-07-07 02:58:33','2018-08-05 03:13:08',2,NULL,10,1,1),(11,'2018-07-07 02:58:34','2018-08-05 03:13:08',2,NULL,10,1,1),(12,'2018-07-07 02:58:35','2018-08-05 03:13:09',2,NULL,10,1,1),(13,'2018-07-07 02:58:35','2018-08-05 03:13:06',2,NULL,10,1,1),(14,'2018-07-07 02:58:36','2018-08-05 03:13:10',2,NULL,10,1,1),(15,'2018-07-07 02:58:36','2018-07-07 02:58:36',2,NULL,10,1,1),(16,'2018-07-08 15:43:19','2018-08-04 09:28:14',2,NULL,7,1,1),(17,'2018-07-08 15:48:36','2018-08-04 21:29:33',2,NULL,8,1,1),(18,'2018-07-11 01:18:02','2018-07-11 01:18:02',2,NULL,11,1,1),(19,'2018-07-13 04:14:34','2018-07-13 04:14:34',2,NULL,7,1,1),(20,'2018-07-13 22:46:53','2018-07-13 22:47:19',3,NULL,10,1,1),(21,'2018-08-04 20:56:20','2018-08-06 21:37:10',2,NULL,14,1,1),(22,'2018-08-04 20:56:32','2018-08-04 20:56:32',2,NULL,14,1,1),(23,'2018-08-04 20:58:28','2018-08-04 20:58:28',2,NULL,14,1,1),(24,'2018-08-04 21:07:03','2018-08-04 21:07:03',2,NULL,14,1,1),(26,'2018-08-04 21:15:00','2018-08-04 21:15:00',2,NULL,14,1,1),(28,'2018-08-28 06:38:24','2018-08-28 06:38:24',2,NULL,16,1,1),(29,'2018-08-28 06:38:25','2018-08-28 06:38:25',2,NULL,16,1,1),(30,'2018-08-28 06:38:25','2018-08-28 06:38:25',2,NULL,16,1,1),(31,'2018-08-28 06:38:26','2018-08-28 06:38:26',2,NULL,16,1,1),(32,'2018-08-28 06:38:27','2018-08-28 06:38:27',2,NULL,16,1,1),(33,'2018-08-28 06:38:28','2018-08-28 06:38:28',2,NULL,16,1,1),(34,'2018-08-28 08:52:57','2018-08-28 08:52:57',2,NULL,17,1,1),(35,'2018-08-28 08:52:57','2018-08-28 08:52:57',2,NULL,17,1,1),(36,'2018-08-28 08:52:58','2018-08-28 08:52:58',2,NULL,17,1,1),(37,'2018-08-28 08:52:59','2018-08-28 08:52:59',2,NULL,17,1,1),(38,'2018-08-28 08:53:00','2018-08-28 08:53:00',2,NULL,17,1,1),(39,'2018-08-28 08:53:01','2018-08-28 08:53:01',2,NULL,17,1,1),(40,'2018-08-29 22:52:31','2018-08-29 22:52:31',2,NULL,18,1,1),(41,'2018-08-29 22:52:31','2018-08-29 22:52:31',2,NULL,18,1,1),(42,'2018-08-29 22:52:32','2018-08-29 22:52:32',2,NULL,18,1,1),(43,'2018-08-29 22:52:33','2018-08-29 22:52:33',2,NULL,18,1,1),(44,'2018-08-29 22:52:34','2018-08-29 22:52:34',2,NULL,18,1,1),(45,'2018-08-29 22:52:34','2018-08-29 22:52:34',2,NULL,18,1,1),(46,'2018-08-29 22:52:35','2018-08-29 22:52:35',2,NULL,18,1,1),(47,'2018-08-29 22:52:36','2018-08-29 22:52:36',2,NULL,18,1,1),(48,'2018-08-29 22:52:37','2018-08-29 22:52:37',2,NULL,18,1,1),(49,'2018-08-29 22:52:38','2018-08-29 22:52:38',2,NULL,18,1,1),(52,'2018-08-30 03:50:43','2018-08-30 03:50:43',2,NULL,14,1,1),(54,'2018-08-30 22:02:51','2018-08-30 22:14:32',2,NULL,19,1,1),(55,'2018-08-30 23:04:00','2018-08-30 23:04:00',2,NULL,15,1,1),(56,'2018-08-30 23:04:21','2018-08-30 23:04:21',2,NULL,15,1,1),(57,'2018-08-31 01:45:36','2018-08-31 02:04:18',2,NULL,17,1,1),(58,'2018-08-31 01:45:37','2018-08-31 01:45:37',2,NULL,17,1,1),(59,'2018-08-31 23:09:33','2018-08-31 23:09:33',2,NULL,19,1,1),(60,'2018-09-01 00:49:10','2018-09-01 00:49:10',2,NULL,15,1,1),(61,'2018-09-01 00:51:15','2018-09-01 00:51:15',2,NULL,15,1,1),(62,'2018-09-01 00:53:01','2018-09-01 00:54:13',2,NULL,15,1,1),(63,'2018-09-01 00:54:59','2018-09-01 00:54:59',2,NULL,15,1,1),(68,'2018-09-10 19:25:12','2018-09-10 19:25:12',2,NULL,20,1,1),(69,'2018-09-10 19:25:12','2018-09-10 19:25:12',2,NULL,20,1,1),(70,'2018-09-13 11:31:38','2018-09-13 14:53:22',2,NULL,19,1,1),(71,'2018-09-15 18:04:15','2018-09-15 18:04:15',2,NULL,7,1,1);
/*!40000 ALTER TABLE `me_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_media_types`
--

DROP TABLE IF EXISTS `me_media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_media_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_9A01D6E85E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_media_types`
--

LOCK TABLES `me_media_types` WRITE;
/*!40000 ALTER TABLE `me_media_types` DISABLE KEYS */;
INSERT INTO `me_media_types` (`id`, `name`, `description`) VALUES (1,'document',NULL),(2,'image',NULL),(3,'video',NULL),(4,'audio',NULL);
/*!40000 ALTER TABLE `me_media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_binarydata`
--

DROP TABLE IF EXISTS `phpcr_binarydata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_binarydata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `property_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `workspace_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idx` int(11) NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_37E65615460D9FD7413BC13C1AC10DC4E7087E10` (`node_id`,`property_name`,`workspace_name`,`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_binarydata`
--

LOCK TABLES `phpcr_binarydata` WRITE;
/*!40000 ALTER TABLE `phpcr_binarydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpcr_binarydata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_internal_index_types`
--

DROP TABLE IF EXISTS `phpcr_internal_index_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_internal_index_types` (
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `node_id` int(11) NOT NULL,
  PRIMARY KEY (`type`,`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_internal_index_types`
--

LOCK TABLES `phpcr_internal_index_types` WRITE;
/*!40000 ALTER TABLE `phpcr_internal_index_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpcr_internal_index_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_namespaces`
--

DROP TABLE IF EXISTS `phpcr_namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_namespaces` (
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_namespaces`
--

LOCK TABLES `phpcr_namespaces` WRITE;
/*!40000 ALTER TABLE `phpcr_namespaces` DISABLE KEYS */;
INSERT INTO `phpcr_namespaces` (`prefix`, `uri`) VALUES ('i18n','http://sulu.io/phpcr/locale'),('phpcrmig','http://www.danteech.com/phpcr-migrations'),('sec','http://sulu.io/phpcr/sec'),('settings','http://sulu.io/phpcr/settings'),('sulu','http://sulu.io/phpcr');
/*!40000 ALTER TABLE `phpcr_namespaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_nodes`
--

DROP TABLE IF EXISTS `phpcr_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `local_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `workspace_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `props` longtext COLLATE utf8_unicode_ci NOT NULL,
  `numerical_props` longtext COLLATE utf8_unicode_ci,
  `depth` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A4624AD7B548B0F1AC10DC4` (`path`,`workspace_name`),
  UNIQUE KEY `UNIQ_A4624AD7772E836A1AC10DC4` (`identifier`,`workspace_name`),
  KEY `IDX_A4624AD73D8E604F` (`parent`),
  KEY `IDX_A4624AD78CDE5729` (`type`),
  KEY `IDX_A4624AD7623C14D533E16B56` (`local_name`,`namespace`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_nodes`
--

LOCK TABLES `phpcr_nodes` WRITE;
/*!40000 ALTER TABLE `phpcr_nodes` DISABLE KEYS */;
INSERT INTO `phpcr_nodes` (`id`, `path`, `parent`, `local_name`, `namespace`, `workspace_name`, `identifier`, `type`, `props`, `numerical_props`, `depth`, `sort_order`) VALUES (376,'/cmf/core-ntx/contents/poslugi/serverna-pidtrimka','/cmf/core-ntx/contents/poslugi','serverna-pidtrimka','','default_live','b85b1b9b-d525-454e-825b-ae9a544c0b98','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:page</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">b85b1b9b-d525-454e-825b-ae9a544c0b98</sv:value></sv:property><sv:property sv:name=\"i18n:uk-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"35\">Серверна підтримка</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"44\">Серверна підтримка | Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"155\">Налаштовуємо та оптимізуємо сервер / хостинг, забеспечуємо новітніми технологіями.</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"42\">https://netexy.com/services/server-support</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"6\">Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"171\">&lt;p&gt;Налаштовуємо&amp;nbsp;та оптимізуємо сервер / хостинг, забеспечуємо новітніми&amp;nbsp;технологіями.&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"32\">{\"displayOption\":\"top\",\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"32\">{\"displayOption\":\"top\",\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:uk-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"24\">/services/server-support</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navigation_top__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-footer__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-30T20:23:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-30T20:23:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-30T20:23:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-14T21:19:48.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">60</sv:value></sv:property><sv:property sv:name=\"i18n:en-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"14\">Server Support</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:en-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"24\">/services/server-support</sv:value></sv:property><sv:property sv:name=\"i18n:en-navigation_top__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-footer__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:50:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-30T20:23:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-30T20:23:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:50:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"44\">Серверна підтримка | Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-more\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"42\">https://netexy.com/services/server-support</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-length\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">3</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"7\">heading</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-heading_level#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#1\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">text</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-text#1\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"270\">&lt;h2 class=\"h2\" style=\"text-align: center;\"&gt;Цікавитесь серверною підтримкою?&lt;/h2&gt;\n\n&lt;p style=\"text-align: center;\"&gt;Ми підготуємо вам кращу пропозицію!&lt;br /&gt;\nЗалишилось заповнити форму.&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-background#1\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#2\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">form</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-form#2\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property></sv:node>\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">60</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property></sv:node>\n',5,5),(377,'/cmf/core-ntx/routes/uk/services/server-support','/cmf/core-ntx/routes/uk/services','server-support','','default_live','e6991ceb-3a73-4433-af8c-4d350303443f','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">e6991ceb-3a73-4433-af8c-4d350303443f</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-30T20:23:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-30T20:23:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">b85b1b9b-d525-454e-825b-ae9a544c0b98</sv:value></sv:property></sv:node>\n',NULL,6,12),(378,'/cmf/core-ntx/routes/en/storage-1','/cmf/core-ntx/routes/en','storage-1','','default','ec2e08bf-19db-4257-bb2e-39923e09e8ae','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">ec2e08bf-19db-4257-bb2e-39923e09e8ae</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:08:20.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:08:20.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">610bb085-27f2-4862-91a3-34596a9dd70e</sv:value></sv:property></sv:node>\n',NULL,5,37),(379,'/cmf/core-ntx/routes/en/storage-1/privacy-policy-1','/cmf/core-ntx/routes/en/storage-1','privacy-policy-1','','default','696e2f7c-d7bb-4933-838f-3ccd769a1ae7','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">696e2f7c-d7bb-4933-838f-3ccd769a1ae7</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:08:20.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:08:20.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">f1a762e3-0a04-4d95-a29f-ea99c5c2fb43</sv:value></sv:property></sv:node>\n',NULL,6,1),(380,'/cmf/core-ntx/routes/en/storage-1','/cmf/core-ntx/routes/en','storage-1','','default_live','ec2e08bf-19db-4257-bb2e-39923e09e8ae','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">ec2e08bf-19db-4257-bb2e-39923e09e8ae</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:08:20.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:08:20.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">610bb085-27f2-4862-91a3-34596a9dd70e</sv:value></sv:property></sv:node>\n',NULL,5,38),(381,'/cmf/core-ntx/routes/en/storage-1/privacy-policy-1','/cmf/core-ntx/routes/en/storage-1','privacy-policy-1','','default_live','696e2f7c-d7bb-4933-838f-3ccd769a1ae7','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">696e2f7c-d7bb-4933-838f-3ccd769a1ae7</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:08:20.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:08:20.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">f1a762e3-0a04-4d95-a29f-ea99c5c2fb43</sv:value></sv:property></sv:node>\n',NULL,6,2),(386,'/cmf/core-ntx/routes/en/services/server-support','/cmf/core-ntx/routes/en/services','server-support','','default','bef00b6c-c0a8-4142-957c-8c49796fc7d2','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">bef00b6c-c0a8-4142-957c-8c49796fc7d2</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:50:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:50:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">b85b1b9b-d525-454e-825b-ae9a544c0b98</sv:value></sv:property></sv:node>\n',NULL,6,1),(387,'/cmf/core-ntx/routes/en/services/server-support','/cmf/core-ntx/routes/en/services','server-support','','default_live','bef00b6c-c0a8-4142-957c-8c49796fc7d2','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">bef00b6c-c0a8-4142-957c-8c49796fc7d2</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:50:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T13:50:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">b85b1b9b-d525-454e-825b-ae9a544c0b98</sv:value></sv:property></sv:node>\n',NULL,6,2),(388,'/cmf/core-ntx/contents/poslugi/veb-rozrobka','/cmf/core-ntx/contents/poslugi','veb-rozrobka','','default','dd6331f1-5b0e-45a4-ab53-002ba55b2523','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:page</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">dd6331f1-5b0e-45a4-ab53-002ba55b2523</sv:value></sv:property><sv:property sv:name=\"i18n:uk-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"23\">Веб-розробка</sv:value></sv:property><sv:property sv:name=\"i18n:uk-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"25\">/services/web-development</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navigation_top__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-footer__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-14T21:40:03.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">10</sv:value></sv:property><sv:property sv:name=\"i18n:uk-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"15\">Web development</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:en-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"25\">/services/web-development</sv:value></sv:property><sv:property sv:name=\"i18n:en-navigation_top__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-footer__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"45\">Розробка веб-сайтів | Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"152\">Ми любимо створювати цифрові можливості, використовуючи найновіші веб-технології.</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"178\">розробка веб-сайтів, ефективний дизайн, розвиток бізнесу, інтеграція рішень, електронна комерція</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"43\">https://netexy.com/services/web-development</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"6\">Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"160\">&lt;p&gt;Ми любимо створювати цифрові можливості, використовуючи найновіші веб-технології.&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-tags\" sv:type=\"Long\" sv:multi-valued=\"1\"><sv:value length=\"1\">2</sv:value><sv:value length=\"1\">5</sv:value><sv:value length=\"1\">3</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"32\">{\"displayOption\":\"top\",\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"32\">{\"displayOption\":\"top\",\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-length\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"7\">heading</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-heading_level#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#1\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">text</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-text#1\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5189\">&lt;h3 class=\"h3\" style=\"color:#f5f5f5;text-align: center;\"&gt;Ми любимо створювати цифрові можливості, використовуючи найновіші веб-технології.&lt;/h3&gt;\n\n&lt;p style=\"text-align: center;\"&gt;Ми створюємо сайти, які є логічним продовженням вашого бізнесу. Унікальний дизайн, розробка та пітримка утворюють єдиний продукт з великою кількістю дуже точних деталей. Наші прагнення до досконалості - незмінні. Починаючи з програмного забезпечення та інструментів, які допомагають успішно виконувати проекти, закінчуючи надійною підтримкою, та супроводом сайту після завершення. Усі ці деталі дозволять вам отримати абсолютний, цільний, раціональний та монолітний продукт.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;Технологія веб-розробки&lt;/h3&gt;\n\n&lt;p&gt;Веб постійно розвивається і технології веб-дизайну змінюються разом з ним. Настільні комп\'ютери поступилися місцем мобільним пристроям з дивовижною швидкістю. Таким чином використання Інтернету в даний час сильно відрізняється, ніж це було всього лише пару років тому.&lt;/p&gt;\n\n&lt;p&gt;Нові технології, особливості, стилі і тенденції встановлюють до інтернет ресурсів високі вимоги. Ефективність дизайну, спосіб кодування і послідовність процесів забезпечують високу якість проекту, задовольняючи клієнта та пошукові системи. Ми оснащуємо проекти ідеями, починаючи від змісту до аналітики, інтегруємо процеси для покращення управління. Знаходимо нові рішення, щоб створити продуманий до дрібниць &lt;strong&gt;Usability&lt;/strong&gt;. Детальне налаштування фонових функцій, під ваші бізнес-цілі і щоденні операції, автоматизує процеси всередині потужної платформи.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;Оптимізованість та гнучкість&lt;/h3&gt;\n\n&lt;p&gt;У мультиплатформенному та мультидоменному світі вам потрібна веб-присутність, без якої не можливо розвивати свій бізнес. Завдяки досвіду в наших проектах ми використовуємо методи найкращої практики для розробки веб-сайтів, які спрямовані на задоволення вашої аудиторії та пошукових систем.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;Розробка на CMS / CMP&lt;/h3&gt;\n\n&lt;p&gt;Ми використовуємо &lt;strong&gt;підхід, керований даними&lt;/strong&gt;, для побудови системи(платформи) управління контентом. Ми розглядаємо, якими даними буде керувати веб-сайт і знаходимо найкращий спосіб забезпечити ефективним рішенням клієнта.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;Електронна комерція&lt;/h3&gt;\n\n&lt;p&gt;Ми володіємо широкими знаннями про інтеграцію рішень електронної комерції та платіжних шлюзів від широкого кола постачальників, включаючи &lt;strong&gt;Privat24&lt;/strong&gt; та &lt;strong&gt;LiqPay&lt;/strong&gt;. Наш досвід охоплює все, починаючи від сторінок покупки окремих предметів до складних комплексних рішень кошика для кошиків, використовуючи &lt;strong&gt;CS-Cart&lt;/strong&gt;.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;API інтеграції&lt;/h3&gt;\n\n&lt;p&gt;Соціальні канали, подібні до Facebook та Twitter, залишаються новими, а їхні API дозволяють веб-сайтам і додаткам &lt;strong&gt;повністю використовувати соціальну інтеграцію&lt;/strong&gt;. API забезпечує основну функціональність деяких сайтів, що дозволяє клієнтам інтегруватися з іншими продуктами та послугами.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-background#1\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-title#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">Розробка веб-сайтів</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-more\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"43\">https://netexy.com/services/web-development</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"45\">Розробка веб-сайтів | Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#2\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">text</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-form#2\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-text#2\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"244\">&lt;h2 class=\"h2\" style=\"text-align: center;\"&gt;Потрібний веб-сайт?&lt;/h2&gt;\n\n&lt;p style=\"text-align: center;\"&gt;Ми підготуємо вам кращу пропозицію!&lt;br /&gt;\nЗалишилось заповнити форму.&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-background#2\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#3\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">form</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-form#3\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property></sv:node>\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">10</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-tags\" sv:type=\"Long\" sv:multi-valued=\"1\"><sv:value length=\"1\">2</sv:value><sv:value length=\"1\">5</sv:value><sv:value length=\"1\">3</sv:value></sv:property></sv:node>\n',5,0),(389,'/cmf/core-ntx/routes/uk/services/web-development','/cmf/core-ntx/routes/uk/services','web-development','','default','97930e5d-c199-4e46-b23a-2c1c8958c120','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">97930e5d-c199-4e46-b23a-2c1c8958c120</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">dd6331f1-5b0e-45a4-ab53-002ba55b2523</sv:value></sv:property></sv:node>\n',NULL,6,13),(390,'/cmf/core-ntx/contents/poslugi/veb-rozrobka','/cmf/core-ntx/contents/poslugi','veb-rozrobka','','default_live','dd6331f1-5b0e-45a4-ab53-002ba55b2523','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:page</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">dd6331f1-5b0e-45a4-ab53-002ba55b2523</sv:value></sv:property><sv:property sv:name=\"i18n:uk-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"23\">Веб-розробка</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"45\">Розробка веб-сайтів | Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"152\">Ми любимо створювати цифрові можливості, використовуючи найновіші веб-технології.</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"178\">розробка веб-сайтів, ефективний дизайн, розвиток бізнесу, інтеграція рішень, електронна комерція</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"43\">https://netexy.com/services/web-development</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"6\">Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"160\">&lt;p&gt;Ми любимо створювати цифрові можливості, використовуючи найновіші веб-технології.&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-tags\" sv:type=\"Long\" sv:multi-valued=\"1\"><sv:value length=\"1\">2</sv:value><sv:value length=\"1\">5</sv:value><sv:value length=\"1\">3</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"32\">{\"displayOption\":\"top\",\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"32\">{\"displayOption\":\"top\",\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:uk-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"25\">/services/web-development</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navigation_top__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-footer__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-14T21:40:03.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">10</sv:value></sv:property><sv:property sv:name=\"i18n:en-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"15\">Web development</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:en-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"25\">/services/web-development</sv:value></sv:property><sv:property sv:name=\"i18n:en-navigation_top__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-footer__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-length\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"7\">heading</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-heading_level#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#1\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">text</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-text#1\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5189\">&lt;h3 class=\"h3\" style=\"color:#f5f5f5;text-align: center;\"&gt;Ми любимо створювати цифрові можливості, використовуючи найновіші веб-технології.&lt;/h3&gt;\n\n&lt;p style=\"text-align: center;\"&gt;Ми створюємо сайти, які є логічним продовженням вашого бізнесу. Унікальний дизайн, розробка та пітримка утворюють єдиний продукт з великою кількістю дуже точних деталей. Наші прагнення до досконалості - незмінні. Починаючи з програмного забезпечення та інструментів, які допомагають успішно виконувати проекти, закінчуючи надійною підтримкою, та супроводом сайту після завершення. Усі ці деталі дозволять вам отримати абсолютний, цільний, раціональний та монолітний продукт.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;Технологія веб-розробки&lt;/h3&gt;\n\n&lt;p&gt;Веб постійно розвивається і технології веб-дизайну змінюються разом з ним. Настільні комп\'ютери поступилися місцем мобільним пристроям з дивовижною швидкістю. Таким чином використання Інтернету в даний час сильно відрізняється, ніж це було всього лише пару років тому.&lt;/p&gt;\n\n&lt;p&gt;Нові технології, особливості, стилі і тенденції встановлюють до інтернет ресурсів високі вимоги. Ефективність дизайну, спосіб кодування і послідовність процесів забезпечують високу якість проекту, задовольняючи клієнта та пошукові системи. Ми оснащуємо проекти ідеями, починаючи від змісту до аналітики, інтегруємо процеси для покращення управління. Знаходимо нові рішення, щоб створити продуманий до дрібниць &lt;strong&gt;Usability&lt;/strong&gt;. Детальне налаштування фонових функцій, під ваші бізнес-цілі і щоденні операції, автоматизує процеси всередині потужної платформи.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;Оптимізованість та гнучкість&lt;/h3&gt;\n\n&lt;p&gt;У мультиплатформенному та мультидоменному світі вам потрібна веб-присутність, без якої не можливо розвивати свій бізнес. Завдяки досвіду в наших проектах ми використовуємо методи найкращої практики для розробки веб-сайтів, які спрямовані на задоволення вашої аудиторії та пошукових систем.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;Розробка на CMS / CMP&lt;/h3&gt;\n\n&lt;p&gt;Ми використовуємо &lt;strong&gt;підхід, керований даними&lt;/strong&gt;, для побудови системи(платформи) управління контентом. Ми розглядаємо, якими даними буде керувати веб-сайт і знаходимо найкращий спосіб забезпечити ефективним рішенням клієнта.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;Електронна комерція&lt;/h3&gt;\n\n&lt;p&gt;Ми володіємо широкими знаннями про інтеграцію рішень електронної комерції та платіжних шлюзів від широкого кола постачальників, включаючи &lt;strong&gt;Privat24&lt;/strong&gt; та &lt;strong&gt;LiqPay&lt;/strong&gt;. Наш досвід охоплює все, починаючи від сторінок покупки окремих предметів до складних комплексних рішень кошика для кошиків, використовуючи &lt;strong&gt;CS-Cart&lt;/strong&gt;.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;h3 class=\"h4\"&gt;API інтеграції&lt;/h3&gt;\n\n&lt;p&gt;Соціальні канали, подібні до Facebook та Twitter, залишаються новими, а їхні API дозволяють веб-сайтам і додаткам &lt;strong&gt;повністю використовувати соціальну інтеграцію&lt;/strong&gt;. API забезпечує основну функціональність деяких сайтів, що дозволяє клієнтам інтегруватися з іншими продуктами та послугами.&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-background#1\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-title#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">Розробка веб-сайтів</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-more\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"43\">https://netexy.com/services/web-development</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"45\">Розробка веб-сайтів | Netexy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#2\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">text</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-form#2\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-text#2\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"244\">&lt;h2 class=\"h2\" style=\"text-align: center;\"&gt;Потрібний веб-сайт?&lt;/h2&gt;\n\n&lt;p style=\"text-align: center;\"&gt;Ми підготуємо вам кращу пропозицію!&lt;br /&gt;\nЗалишилось заповнити форму.&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-background#2\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#3\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">form</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-form#3\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property></sv:node>\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"i18n:uk-excerpt-tags\" sv:type=\"Long\" sv:multi-valued=\"1\"><sv:value length=\"1\">2</sv:value><sv:value length=\"1\">5</sv:value><sv:value length=\"1\">3</sv:value></sv:property><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">10</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property></sv:node>\n',5,0),(391,'/cmf/core-ntx/routes/uk/services/web-development','/cmf/core-ntx/routes/uk/services','web-development','','default_live','97930e5d-c199-4e46-b23a-2c1c8958c120','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">97930e5d-c199-4e46-b23a-2c1c8958c120</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:04:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">dd6331f1-5b0e-45a4-ab53-002ba55b2523</sv:value></sv:property></sv:node>\n',NULL,6,14),(392,'/cmf/core-ntx/routes/en/services/web-development','/cmf/core-ntx/routes/en/services','web-development','','default','c328f75e-8361-4520-a2d9-e2eec3182a31','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">c328f75e-8361-4520-a2d9-e2eec3182a31</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">dd6331f1-5b0e-45a4-ab53-002ba55b2523</sv:value></sv:property></sv:node>\n',NULL,6,3),(393,'/cmf/core-ntx/routes/en/services/web-development','/cmf/core-ntx/routes/en/services','web-development','','default_live','c328f75e-8361-4520-a2d9-e2eec3182a31','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">c328f75e-8361-4520-a2d9-e2eec3182a31</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">dd6331f1-5b0e-45a4-ab53-002ba55b2523</sv:value></sv:property></sv:node>\n',NULL,6,4),(394,'/cmf/core-ntx/routes/en/services/social-media','/cmf/core-ntx/routes/en/services','social-media','','default','8f90ab6a-e7d4-451e-ab84-122469d3dc75','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">8f90ab6a-e7d4-451e-ab84-122469d3dc75</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:29.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:29.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">70c72c68-d8e1-4cf5-9272-88bb590c37b0</sv:value></sv:property></sv:node>\n',NULL,6,5),(395,'/cmf/core-ntx/routes/en/services/social-media','/cmf/core-ntx/routes/en/services','social-media','','default_live','8f90ab6a-e7d4-451e-ab84-122469d3dc75','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">8f90ab6a-e7d4-451e-ab84-122469d3dc75</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:29.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:29.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">70c72c68-d8e1-4cf5-9272-88bb590c37b0</sv:value></sv:property></sv:node>\n',NULL,6,6),(396,'/cmf/core-ntx/routes/en/services/e-marketing','/cmf/core-ntx/routes/en/services','e-marketing','','default','5d415624-9188-47ec-974f-f21321653e1e','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">5d415624-9188-47ec-974f-f21321653e1e</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:41.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:41.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">f7d9f832-9af7-40ae-8db4-f060ae6b28ed</sv:value></sv:property></sv:node>\n',NULL,6,7),(397,'/cmf/core-ntx/routes/en/services/e-marketing','/cmf/core-ntx/routes/en/services','e-marketing','','default_live','5d415624-9188-47ec-974f-f21321653e1e','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">5d415624-9188-47ec-974f-f21321653e1e</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:41.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:41.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">f7d9f832-9af7-40ae-8db4-f060ae6b28ed</sv:value></sv:property></sv:node>\n',NULL,6,8),(398,'/cmf/core-ntx/routes/en/services/seo','/cmf/core-ntx/routes/en/services','seo','','default','2293c705-2c41-491e-b117-b0467409688d','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">2293c705-2c41-491e-b117-b0467409688d</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">fde8c44b-a9bb-407d-a9f6-02c2eb7e5dc3</sv:value></sv:property></sv:node>\n',NULL,6,9),(399,'/cmf/core-ntx/routes/en/services/seo','/cmf/core-ntx/routes/en/services','seo','','default_live','2293c705-2c41-491e-b117-b0467409688d','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">2293c705-2c41-491e-b117-b0467409688d</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:05:54.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">fde8c44b-a9bb-407d-a9f6-02c2eb7e5dc3</sv:value></sv:property></sv:node>\n',NULL,6,10),(400,'/cmf/core-ntx/routes/en/services/paid-biddable-media','/cmf/core-ntx/routes/en/services','paid-biddable-media','','default','724cf7a4-cd3b-4fb8-9765-757db6cdaf2e','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">724cf7a4-cd3b-4fb8-9765-757db6cdaf2e</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:06:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">87658fb7-347b-4ced-976e-491120684f14</sv:value></sv:property></sv:node>\n',NULL,6,11),(401,'/cmf/core-ntx/routes/en/services/paid-biddable-media','/cmf/core-ntx/routes/en/services','paid-biddable-media','','default_live','724cf7a4-cd3b-4fb8-9765-757db6cdaf2e','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">724cf7a4-cd3b-4fb8-9765-757db6cdaf2e</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T14:06:07.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">87658fb7-347b-4ced-976e-491120684f14</sv:value></sv:property></sv:node>\n',NULL,6,12),(402,'/cmf/core-ntx/routes/uk/services/advertising-campaigns','/cmf/core-ntx/routes/uk/services','advertising-campaigns','','default','2561eb7d-0e2b-4c70-9be8-7b699119f9fd','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">2561eb7d-0e2b-4c70-9be8-7b699119f9fd</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:29.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:29.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">f2286519-b6ff-42c0-bff9-7ff41410d99c</sv:value></sv:property></sv:node>\n',NULL,6,15),(403,'/cmf/core-ntx/routes/uk/services/advertising-campaigns','/cmf/core-ntx/routes/uk/services','advertising-campaigns','','default_live','2561eb7d-0e2b-4c70-9be8-7b699119f9fd','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">2561eb7d-0e2b-4c70-9be8-7b699119f9fd</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:29.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:29.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">f2286519-b6ff-42c0-bff9-7ff41410d99c</sv:value></sv:property></sv:node>\n',NULL,6,16),(404,'/cmf/core-ntx/routes/en/services/advertising-campaigns','/cmf/core-ntx/routes/en/services','advertising-campaigns','','default','87658fb7-347b-4ced-976e-491120684f14','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">87658fb7-347b-4ced-976e-491120684f14</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">f2286519-b6ff-42c0-bff9-7ff41410d99c</sv:value></sv:property></sv:node>\n',NULL,6,13),(405,'/cmf/core-ntx/routes/en/services/advertising-campaigns','/cmf/core-ntx/routes/en/services','advertising-campaigns','','default_live','87658fb7-347b-4ced-976e-491120684f14','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">87658fb7-347b-4ced-976e-491120684f14</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-31T19:33:58.000+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">f2286519-b6ff-42c0-bff9-7ff41410d99c</sv:value></sv:property></sv:node>\n',NULL,6,14),(410,'/cmf/core-ntx/contents/golovna','/cmf/core-ntx/contents','golovna','','default','9c34553c-7f80-45ac-b6f5-5ec90e545f15','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:page</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">9c34553c-7f80-45ac-b6f5-5ec90e545f15</sv:value></sv:property><sv:property sv:name=\"i18n:uk-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"14\">Головна</sv:value></sv:property><sv:property sv:name=\"i18n:uk-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">/main</sv:value></sv:property><sv:property sv:name=\"i18n:uk-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"7\">default</sv:value></sv:property><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-13T19:59:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-13T19:59:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-13T20:03:05.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"><sv:value length=\"4\">main</sv:value><sv:value length=\"6\">footer</sv:value></sv:property><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">80</sv:value></sv:property><sv:property sv:name=\"i18n:uk-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-13T19:59:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:uk-internal_link\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">8a1ca287-8319-49bf-85ba-5a30f204fa86</sv:value></sv:property><sv:property sv:name=\"i18n:uk-external\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"18\">https://netexy.com</sv:value></sv:property></sv:node>\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">4</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">80</sv:value></sv:property></sv:node>\n',4,9),(412,'/cmf/core-ntx/contents/main','/cmf/core-ntx/contents','main','','default_live','9c34553c-7f80-45ac-b6f5-5ec90e545f15','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:page</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">9c34553c-7f80-45ac-b6f5-5ec90e545f15</sv:value></sv:property><sv:property sv:name=\"i18n:uk-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">main</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:uk-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">/main</sv:value></sv:property><sv:property sv:name=\"i18n:uk-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"7\">default</sv:value></sv:property><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-13T19:59:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-13T19:59:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-13T19:59:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-09-13T20:00:42.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"><sv:value length=\"4\">main</sv:value><sv:value length=\"6\">footer</sv:value></sv:property><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">80</sv:value></sv:property><sv:property sv:name=\"i18n:uk-internal_link\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">03d1c17e-663f-4404-95ce-ce063d89532b</sv:value></sv:property></sv:node>\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">80</sv:value></sv:property></sv:node>\n',4,8),(420,'/cmf/core-ntx/contents/golovna/politika-konfidentsiynosti','/cmf/core-ntx/contents/golovna','politika-konfidentsiynosti','','default','0171ebbf-d642-4502-b954-5551cf1e4d74','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:page</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">0171ebbf-d642-4502-b954-5551cf1e4d74</sv:value></sv:property><sv:property sv:name=\"i18n:uk-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"49\">Політика конфіденційності</sv:value></sv:property><sv:property sv:name=\"i18n:uk-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"20\">/main/privacy-policy</sv:value></sv:property><sv:property sv:name=\"i18n:uk-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-07T04:37:02.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-07T04:37:02.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-07T04:48:10.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">70</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:uk-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:uk-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-length\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-type#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">text</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-text#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"9275\">&lt;h3&gt;&lt;strong&gt;Політика конфіденційності&lt;/strong&gt;&lt;/h3&gt;\n\n&lt;p&gt;Ця політика застосовується до інформації, яка може бути зібрана на сайті Netexy. &lt;strong&gt;Реєструючись на сайті www.netexy.com, Ви погоджуєтесь прийняти інструкції, описані у цій Політиці конфіденційності та надати нам щиру і правдиву інформацію стосовно Вас.&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;Netexy знає, що ви турбуєтеся про те, як використовуються та поширюються Ваші персональні дані, і ми високо цінуємо Вашу довіру тому, що ми будемо робити це обережно і розсудливо. Netexy прагне прислухатися та проявляти повагу до Ваших побажань стосовно збереження Ваших даних на сайті.&lt;/p&gt;\n\n&lt;h3&gt;&lt;strong&gt;Персональна інформація&lt;/strong&gt;&lt;/h3&gt;\n\n&lt;p&gt;Інформація, яку ми отримали від Вас, допомагає нам персоналізувати та постійно поліпшувати умови для здійснення покупок на сайті www.netexy.com.&lt;/p&gt;\n\n&lt;p&gt;Ваша історія транзакцій та інформація, яку Ви надаєте нам в режимі онлайн на сайті www.netexy.com, по телефону або за допомогою електронної пошти, надійно зберігається в базі даних клієнтів і може бути надана тільки нашим споріднених компаніям або деяким ретельно перевіреним третіми особам для забезпечення надійності та цілісності.&lt;/p&gt;\n\n&lt;p&gt;Компанія Netexy, а також треті особи, що здійснюють опрацювання вашого замовлення, можуть надавати вам інформацію щодо реєстрації та оплати вашого замовлення, в т. ч. надсилати повідомлення рекламного, інформаційного та іншого характеру на вказану вами адресу електронної пошти та (або) номер телефону.&lt;/p&gt;\n\n&lt;p&gt;Компанія Netexy може здійснювати обробку ваших особистих даних (у т. ч. відомостей про ім\'я, прізвище, телефонний номер тощо) та надсилати їх вищезазначеним третім особам з метою виконання зобов\'язань по вашому замовленню.&lt;/p&gt;\n\n&lt;p&gt;Інформація, яку ми отримуємо від Вас є добровільною, її більша частина є необхідною для оформлення Вашого замовлення належним чином. Ненадання такої інформації може призвести до скасування Вашого замовлення. В доповнення до виконання замовлень, ми використовуємо Вашу інформацію для таких цілей, як відповідь на запити, налаштування майбутніх покупок для Вас, поліпшення наших магазинів і спілкування з Вами.&lt;/p&gt;\n\n&lt;p&gt;Ми забезпечуємо захист будь-якої наданої нам інформації. Компанія Netexy виконує вимоги стандартів та правил з безпеки щодо несанкціонованого доступу до інформації клієнтів з метою попередження несанкціонованого видалення чи редагування даних. Компанія Netexy слідує діючим стандартам з безпеки для всіх транзакцій, що можуть передбачати здійснення оплати за допомогою сервісу, доступного на цьому веб-сайті, у т. ч. з використанням шифрування та SSL-сервісів. Ми не зберігаємо номери кредитних карт довше, ніж це необхідно для здійснення верифікації та завершення необхідної транзакції. Від вас вимагається забезпечення захисту від несанкціонованого доступу до пароля до комп\'ютера. У разі якщо ви використовуєте спільний комп\'ютер, по завершенню роботи не забудьте вийти зі свого облікового запису.&lt;/p&gt;\n\n&lt;p&gt;У будь-який час Ви можете отримати доступ і виправити всю інформацію, яка стосується Вас і зберігається в Netexy. Ви можете в будь-який час звернутися до Netexy, щоб дізнатися, якою інформацією про Вас ми володіємо, і за запитом щодо змін такої інформації.&lt;/p&gt;\n\n&lt;h3&gt;&lt;strong&gt;Політика безпеки електронної пошти&lt;/strong&gt;&lt;/h3&gt;\n\n&lt;p&gt;Окрім виключень, зазначених у цій політиці, Netexy не буде продавати, передавати або ж іншим чином поширювати адреси електронної пошти, які були передані нам або ж отримані за допомогою цього сайту. Будь-яка адреса електронної пошти, що подається безпосередньо до Netexy, використовується лише по відношенню до онлайн-замовлень, запитів до каталогу та запитів на іншу інформацію і залишається виключно у власності Netexy і пов\'язаних з ним компаній.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;Якщо Ви не хочете отримувати рекламні електронні листи від Netexy в майбутньому,&lt;/strong&gt; будь ласка, повідомте нам, зв\'язавшись з нами за допомогою електронної пошти або зателефонувавши нам за контактними телефонам.&lt;/p&gt;\n\n&lt;p&gt;Якщо Ви надаєте нам свою поштову адресу, Ви можете отримувати від нас періодичні розсилки з інформацією про нові продукти та послуги або ж майбутні події. &lt;strong&gt;Якщо Ви не хочете отримувати такі розсилки, будь ласка, зв\'яжіться з нами за допомогою електронної пошти або зателефонуйте за контактними телефонами.&lt;/strong&gt;&lt;/p&gt;\n\n&lt;h3&gt;&lt;strong&gt;Cookie-файли&lt;/strong&gt;&lt;/h3&gt;\n\n&lt;p&gt;Як і більшість роздрібних веб-сайтів, ми використовуємо cookie-файли, які є частинами даних, що подаються в браузер та дозволяють нашому сайту ідентифікувати Вас, коли Ви заходите на сайт. Хоча було висловлене занепокоєння з приводу застосування cookie-файлів, важливо, щоб Ви зрозуміли, що ці файли не зможуть видати інформацію про Вас, якщо Ви її добровільно не пред’явили. Переважна більшість інтернет-користувачів наразі визнає функцію cookie-файлів зручною для покупок в Інтернеті. Якщо Ви бажаєте, функція «help», що знаходиться на панелі інструментів, розповість Вам, як запобігти тому, щоб Ваш браузер отримував нові cookie-файли, як налаштувати повідомлення від браузера про отримання нового cookie-файла або ж як взагалі відключити цю функцію.&lt;/p&gt;\n\n&lt;p&gt;Якщо у Вас є питання стосовно будь-якого елемента нашої політики щодо веб-конфіденційності, будь ласка, зв\'яжіться з нами за допомогою електронної пошти або по телефону.&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:uk-main_content-background#0\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"14\">Privacy-Policy</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-facebookAppID\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-siteName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-pageName\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-twitterSite\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-faviconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-webManifestUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-maskIconUri\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hexTheme\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-barStyle\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"2\">[]</sv:value></sv:property><sv:property sv:name=\"i18n:en-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"19\">/privacy-policy-1-1</sv:value></sv:property><sv:property sv:name=\"i18n:en-main_content-length\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-main_content-type#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"4\">text</sv:value></sv:property><sv:property sv:name=\"i18n:en-main_content-text#0\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"9290\">&lt;h3&gt;&lt;strong&gt;Політика конфіденційності&lt;/strong&gt;&lt;/h3&gt;\n\n&lt;p&gt;Ця політика застосовується до інформації, яка може бути зібрана на сайті Netexy.&amp;nbsp;&lt;strong&gt;Реєструючись на сайті www.netexy.com, Ви погоджуєтесь прийняти інструкції, описані у цій Політиці конфіденційності та надати нам щиру і правдиву інформацію стосовно Вас.&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;Netexy знає, що ви турбуєтеся про те, як використовуються та поширюються Ваші персональні дані, і ми високо цінуємо Вашу довіру тому, що ми будемо робити це обережно і розсудливо. Netexy прагне прислухатися та проявляти повагу до Ваших побажань стосовно збереження Ваших даних на сайті.&lt;/p&gt;\n\n&lt;h3&gt;&lt;strong&gt;Персональна інформація&lt;/strong&gt;&lt;/h3&gt;\n\n&lt;p&gt;Інформація, яку ми отримали від Вас, допомагає нам персоналізувати та постійно поліпшувати умови для здійснення покупок на сайті www.netexy.com.&lt;/p&gt;\n\n&lt;p&gt;Ваша історія транзакцій та інформація, яку Ви надаєте нам в режимі онлайн на сайті www.netexy.com, по телефону або за допомогою електронної пошти, надійно зберігається в базі даних клієнтів і може бути надана тільки нашим споріднених компаніям або деяким ретельно перевіреним третіми особам для забезпечення надійності та цілісності.&lt;/p&gt;\n\n&lt;p&gt;Компанія Netexy, а також треті особи, що здійснюють опрацювання вашого замовлення, можуть надавати вам інформацію щодо реєстрації та оплати вашого замовлення, в т. ч. надсилати повідомлення рекламного, інформаційного та іншого характеру на вказану вами адресу електронної пошти та (або) номер телефону.&lt;/p&gt;\n\n&lt;p&gt;Компанія Netexy може здійснювати обробку ваших особистих даних (у т. ч. відомостей про ім\'я, прізвище, телефонний номер тощо) та надсилати їх вищезазначеним третім особам з метою виконання зобов\'язань по вашому замовленню.&lt;/p&gt;\n\n&lt;p&gt;Інформація, яку ми отримуємо від Вас є добровільною, її більша частина є необхідною для оформлення Вашого замовлення належним чином. Ненадання такої інформації може призвести до скасування Вашого замовлення. В доповнення до виконання замовлень, ми використовуємо Вашу інформацію для таких цілей, як відповідь на запити, налаштування майбутніх покупок для Вас, поліпшення наших магазинів і спілкування з Вами.&lt;/p&gt;\n\n&lt;p&gt;Ми забезпечуємо захист будь-якої наданої нам інформації. Компанія Netexy виконує вимоги стандартів та правил з безпеки щодо несанкціонованого доступу до інформації клієнтів з метою попередження несанкціонованого видалення чи редагування даних. Компанія Netexy слідує діючим стандартам з безпеки для всіх транзакцій, що можуть передбачати здійснення оплати за допомогою сервісу, доступного на цьому веб-сайті, у т. ч. з використанням шифрування та SSL-сервісів. Ми не зберігаємо номери кредитних карт довше, ніж це необхідно для здійснення верифікації та завершення необхідної транзакції. Від вас вимагається забезпечення захисту від несанкціонованого доступу до пароля до комп\'ютера. У разі якщо ви використовуєте спільний комп\'ютер, по завершенню роботи не забудьте вийти зі свого облікового запису.&lt;/p&gt;\n\n&lt;p&gt;У будь-який час Ви можете отримати доступ і виправити всю інформацію, яка стосується Вас і зберігається в Netexy. Ви можете в будь-який час звернутися до Netexy, щоб дізнатися, якою інформацією про Вас ми володіємо, і за запитом щодо змін такої інформації.&lt;/p&gt;\n\n&lt;h3&gt;&lt;strong&gt;Політика безпеки електронної пошти&lt;/strong&gt;&lt;/h3&gt;\n\n&lt;p&gt;Окрім виключень, зазначених у цій політиці, Netexy не буде продавати, передавати або ж іншим чином поширювати адреси електронної пошти, які були передані нам або ж отримані за допомогою цього сайту. Будь-яка адреса електронної пошти, що подається безпосередньо до Netexy, використовується лише по відношенню до онлайн-замовлень, запитів до каталогу та запитів на іншу інформацію і залишається виключно у власності Netexy і пов\'язаних з ним компаній.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;Якщо Ви не хочете отримувати рекламні електронні листи від Netexy в майбутньому,&lt;/strong&gt;&amp;nbsp;будь ласка, повідомте нам, зв\'язавшись з нами за допомогою електронної пошти або зателефонувавши нам за контактними телефонам.&lt;/p&gt;\n\n&lt;p&gt;Якщо Ви надаєте нам свою поштову адресу, Ви можете отримувати від нас періодичні розсилки з інформацією про нові продукти та послуги або ж майбутні події.&amp;nbsp;&lt;strong&gt;Якщо Ви не хочете отримувати такі розсилки, будь ласка, зв\'яжіться з нами за допомогою електронної пошти або зателефонуйте за контактними телефонами.&lt;/strong&gt;&lt;/p&gt;\n\n&lt;h3&gt;&lt;strong&gt;Cookie-файли&lt;/strong&gt;&lt;/h3&gt;\n\n&lt;p&gt;Як і більшість роздрібних веб-сайтів, ми використовуємо cookie-файли, які є частинами даних, що подаються в браузер та дозволяють нашому сайту ідентифікувати Вас, коли Ви заходите на сайт. Хоча було висловлене занепокоєння з приводу застосування cookie-файлів, важливо, щоб Ви зрозуміли, що ці файли не зможуть видати інформацію про Вас, якщо Ви її добровільно не пред’явили. Переважна більшість інтернет-користувачів наразі визнає функцію cookie-файлів зручною для покупок в Інтернеті. Якщо Ви бажаєте, функція «help», що знаходиться на панелі інструментів, розповість Вам, як запобігти тому, щоб Ваш браузер отримував нові cookie-файли, як налаштувати повідомлення від браузера про отримання нового cookie-файла або ж як взагалі відключити цю функцію.&lt;/p&gt;\n\n&lt;p&gt;Якщо у Вас є питання стосовно будь-якого елемента нашої політики щодо веб-конфіденційності, будь ласка, зв\'яжіться з нами за допомогою електронної пошти або по телефону.&lt;/p&gt;\n</sv:value></sv:property><sv:property sv:name=\"i18n:en-main_content-background#0\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-07T04:37:02.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-author\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-07T04:37:02.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2018-08-28T02:32:02.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navigation_top__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-footer__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-navigation_top__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-footer__disabled\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:uk-navigation_top__ln_title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"14\">Privacy-Policy</sv:value></sv:property></sv:node>\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"i18n:uk-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:uk-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">70</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property></sv:node>\n',5,1);
/*!40000 ALTER TABLE `phpcr_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_nodes_references`
--

DROP TABLE IF EXISTS `phpcr_nodes_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_nodes_references` (
  `source_id` int(11) NOT NULL,
  `source_property_name` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`source_id`,`source_property_name`,`target_id`),
  KEY `IDX_F3BF7E1158E0B66` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_nodes_references`
--

LOCK TABLES `phpcr_nodes_references` WRITE;
/*!40000 ALTER TABLE `phpcr_nodes_references` DISABLE KEYS */;
INSERT INTO `phpcr_nodes_references` (`source_id`, `source_property_name`, `target_id`) VALUES (140,'sulu:content',138),(141,'sulu:content',138),(151,'sulu:content',149),(152,'sulu:content',149),(410,'i18n:uk-internal_link',149),(148,'settings:snippets-website_config',193),(137,'settings:snippets-website_config',195),(193,'i18n:en-copyright',200),(193,'i18n:uk-copyright',200),(195,'i18n:en-copyright',201),(195,'i18n:uk-copyright',201),(280,'sulu:content',230),(379,'sulu:content',230),(282,'sulu:content',232),(381,'sulu:content',232),(288,'i18n:uk-main_content-markers#6',248),(288,'i18n:uk-main_content-markers#7',248),(290,'i18n:uk-main_content-markers#6',249),(290,'i18n:uk-main_content-markers#7',249),(265,'sulu:content',264),(378,'sulu:content',264),(267,'sulu:content',266),(380,'sulu:content',266),(231,'sulu:content',280),(233,'sulu:content',282),(289,'sulu:content',288),(306,'sulu:content',288),(291,'sulu:content',290),(307,'sulu:content',290),(309,'sulu:content',308),(312,'sulu:content',308),(311,'sulu:content',310),(313,'sulu:content',310),(315,'sulu:content',314),(318,'sulu:content',314),(317,'sulu:content',316),(319,'sulu:content',316),(321,'sulu:content',320),(324,'sulu:content',320),(323,'sulu:content',322),(325,'sulu:content',322),(412,'i18n:uk-internal_link',322),(193,'i18n:uk-footer_social_buttons',327),(195,'i18n:uk-footer_social_buttons',329),(193,'i18n:uk-footer_social_buttons',332),(195,'i18n:uk-footer_social_buttons',333),(193,'i18n:uk-footer_social_buttons',338),(195,'i18n:uk-footer_social_buttons',339),(347,'sulu:content',346),(350,'sulu:content',346),(349,'sulu:content',348),(351,'sulu:content',348),(402,'sulu:content',358),(404,'sulu:content',358),(403,'sulu:content',360),(405,'sulu:content',360),(363,'sulu:content',362),(398,'sulu:content',362),(365,'sulu:content',364),(399,'sulu:content',364),(367,'sulu:content',366),(396,'sulu:content',366),(369,'sulu:content',368),(397,'sulu:content',368),(371,'sulu:content',370),(394,'sulu:content',370),(373,'sulu:content',372),(395,'sulu:content',372),(375,'sulu:content',374),(386,'sulu:content',374),(377,'sulu:content',376),(387,'sulu:content',376),(342,'sulu:content',378),(234,'sulu:content',379),(281,'sulu:content',379),(343,'sulu:content',379),(344,'sulu:content',380),(235,'sulu:content',381),(283,'sulu:content',381),(345,'sulu:content',381),(389,'sulu:content',388),(392,'sulu:content',388),(391,'sulu:content',390),(393,'sulu:content',390),(359,'sulu:content',402),(361,'sulu:content',403),(400,'sulu:content',404),(401,'sulu:content',405);
/*!40000 ALTER TABLE `phpcr_nodes_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_nodes_weakreferences`
--

DROP TABLE IF EXISTS `phpcr_nodes_weakreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_nodes_weakreferences` (
  `source_id` int(11) NOT NULL,
  `source_property_name` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`source_id`,`source_property_name`,`target_id`),
  KEY `IDX_F0E4F6FA158E0B66` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_nodes_weakreferences`
--

LOCK TABLES `phpcr_nodes_weakreferences` WRITE;
/*!40000 ALTER TABLE `phpcr_nodes_weakreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpcr_nodes_weakreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_type_childs`
--

DROP TABLE IF EXISTS `phpcr_type_childs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_type_childs` (
  `node_type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `protected` tinyint(1) NOT NULL,
  `auto_created` tinyint(1) NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  `on_parent_version` int(11) NOT NULL,
  `primary_types` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_type_childs`
--

LOCK TABLES `phpcr_type_childs` WRITE;
/*!40000 ALTER TABLE `phpcr_type_childs` DISABLE KEYS */;
INSERT INTO `phpcr_type_childs` (`node_type_id`, `name`, `protected`, `auto_created`, `mandatory`, `on_parent_version`, `primary_types`, `default_type`) VALUES (12,'*',0,0,0,1,'phpcrmig:version',NULL),(9,'*',0,0,0,1,'',NULL);
/*!40000 ALTER TABLE `phpcr_type_childs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_type_nodes`
--

DROP TABLE IF EXISTS `phpcr_type_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_type_nodes` (
  `node_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supertypes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_abstract` tinyint(1) NOT NULL,
  `is_mixin` tinyint(1) NOT NULL,
  `queryable` tinyint(1) NOT NULL,
  `orderable_child_nodes` tinyint(1) NOT NULL,
  `primary_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`node_type_id`),
  UNIQUE KEY `UNIQ_34B0A8095E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_type_nodes`
--

LOCK TABLES `phpcr_type_nodes` WRITE;
/*!40000 ALTER TABLE `phpcr_type_nodes` DISABLE KEYS */;
INSERT INTO `phpcr_type_nodes` (`node_type_id`, `name`, `supertypes`, `is_abstract`, `is_mixin`, `queryable`, `orderable_child_nodes`, `primary_item`) VALUES (1,'sulu:base','mix:referenceable',1,1,0,0,NULL),(2,'sulu:path','sulu:base',0,1,0,0,NULL),(3,'sulu:content','sulu:base',0,1,0,0,NULL),(4,'sulu:snippet','sulu:content',0,1,0,0,NULL),(5,'sulu:page','sulu:content',0,1,0,0,NULL),(6,'sulu:home','sulu:content',0,1,0,0,NULL),(7,'sulu:custom_url','sulu:base',0,1,0,0,NULL),(8,'sulu:custom_url_route','sulu:base',0,1,0,0,NULL),(9,'sulu:article','sulu:base',0,1,0,0,NULL),(10,'sulu:articlepage','sulu:article',0,1,0,0,NULL),(11,'phpcrmig:version','nt:base mix:created',0,0,1,0,NULL),(12,'phpcrmig:versions','nt:base',0,0,1,0,NULL);
/*!40000 ALTER TABLE `phpcr_type_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_type_props`
--

DROP TABLE IF EXISTS `phpcr_type_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_type_props` (
  `node_type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `protected` tinyint(1) NOT NULL,
  `auto_created` tinyint(1) NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  `on_parent_version` int(11) NOT NULL,
  `multiple` tinyint(1) NOT NULL,
  `fulltext_searchable` tinyint(1) NOT NULL,
  `query_orderable` tinyint(1) NOT NULL,
  `required_type` int(11) NOT NULL,
  `query_operators` int(11) NOT NULL,
  `default_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`node_type_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_type_props`
--

LOCK TABLES `phpcr_type_props` WRITE;
/*!40000 ALTER TABLE `phpcr_type_props` DISABLE KEYS */;
INSERT INTO `phpcr_type_props` (`node_type_id`, `name`, `protected`, `auto_created`, `mandatory`, `on_parent_version`, `multiple`, `fulltext_searchable`, `query_orderable`, `required_type`, `query_operators`, `default_value`) VALUES (2,'sulu:content',0,0,1,1,0,0,0,9,0,NULL),(2,'sulu:history',0,1,1,1,0,0,0,6,0,'');
/*!40000 ALTER TABLE `phpcr_type_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_workspaces`
--

DROP TABLE IF EXISTS `phpcr_workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_workspaces` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_workspaces`
--

LOCK TABLES `phpcr_workspaces` WRITE;
/*!40000 ALTER TABLE `phpcr_workspaces` DISABLE KEYS */;
INSERT INTO `phpcr_workspaces` (`name`) VALUES ('default'),('default_live');
/*!40000 ALTER TABLE `phpcr_workspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_redirect_routes`
--

DROP TABLE IF EXISTS `re_redirect_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_redirect_routes` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `statusCode` int(11) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3DB4B4315F8A7F73` (`source`),
  KEY `IDX_3DB4B431DBF11E1D` (`idUsersCreator`),
  KEY `IDX_3DB4B43130D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_3DB4B43130D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3DB4B431DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_redirect_routes`
--

LOCK TABLES `re_redirect_routes` WRITE;
/*!40000 ALTER TABLE `re_redirect_routes` DISABLE KEYS */;
INSERT INTO `re_redirect_routes` (`id`, `enabled`, `statusCode`, `source`, `target`, `created`, `changed`, `idUsersCreator`, `idUsersChanger`) VALUES ('c37bbde0-0903-43e4-9637-d3f6f51a44d9',1,301,'/pro-kompanyu/','/','2018-09-01 13:44:36','2018-09-01 13:44:36',1,1);
/*!40000 ALTER TABLE `re_redirect_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ro_routes`
--

DROP TABLE IF EXISTS `ro_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ro_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `entity_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `history` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_671DB7A4B548B0F4180C698` (`path`,`locale`),
  KEY `IDX_671DB7A4158E0B66` (`target_id`),
  KEY `IDX_671DB7A4DBF11E1D` (`idUsersCreator`),
  KEY `IDX_671DB7A430D07CD5` (`idUsersChanger`),
  KEY `IDX_671DB7A4B548B0F` (`path`),
  KEY `IDX_671DB7A44180C698` (`locale`),
  CONSTRAINT `FK_671DB7A4158E0B66` FOREIGN KEY (`target_id`) REFERENCES `ro_routes` (`id`),
  CONSTRAINT `FK_671DB7A430D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_671DB7A4DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ro_routes`
--

LOCK TABLES `ro_routes` WRITE;
/*!40000 ALTER TABLE `ro_routes` DISABLE KEYS */;
INSERT INTO `ro_routes` (`id`, `target_id`, `path`, `locale`, `entity_class`, `entity_id`, `history`, `created`, `changed`, `idUsersCreator`, `idUsersChanger`) VALUES (11,NULL,'/test-article','uk','Sulu\\Bundle\\ArticleBundle\\Document\\ArticleDocument','b54e6507-089c-4bb7-bf6a-e37c97275564',0,'2018-07-11 04:46:49','2018-07-11 04:46:49',1,1),(12,NULL,'/test-blog-news','uk','Sulu\\Bundle\\ArticleBundle\\Document\\ArticleDocument','af01d54d-1bd9-404d-9b96-edd24ea9192b',0,'2018-07-11 05:03:37','2018-07-11 05:03:37',1,1),(13,NULL,'/test-blog-news','en','Sulu\\Bundle\\ArticleBundle\\Document\\ArticleDocument','af01d54d-1bd9-404d-9b96-edd24ea9192b',0,'2018-07-11 07:58:34','2018-07-11 07:58:34',1,1),(14,NULL,'/blog/start-promo-all-services','uk','Sulu\\Bundle\\ArticleBundle\\Document\\ArticleDocument','39cec43f-2701-482b-b4b8-9c73dee95331',0,'2018-08-30 20:49:39','2018-08-30 20:49:39',1,1);
/*!40000 ALTER TABLE `ro_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_access_controls`
--

DROP TABLE IF EXISTS `se_access_controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_access_controls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissions` smallint(6) NOT NULL,
  `entityId` int(11) NOT NULL,
  `entityClass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idRoles` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C526DC52A1FA6DDA` (`idRoles`),
  KEY `IDX_C526DC52F62829FC` (`entityId`),
  KEY `IDX_C526DC523963FFAB` (`entityClass`),
  CONSTRAINT `FK_C526DC52A1FA6DDA` FOREIGN KEY (`idRoles`) REFERENCES `se_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_access_controls`
--

LOCK TABLES `se_access_controls` WRITE;
/*!40000 ALTER TABLE `se_access_controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_access_controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_group_roles`
--

DROP TABLE IF EXISTS `se_group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_group_roles` (
  `idGroups` int(11) NOT NULL,
  `idRoles` int(11) NOT NULL,
  PRIMARY KEY (`idGroups`,`idRoles`),
  KEY `IDX_9713F725937C91EA` (`idGroups`),
  KEY `IDX_9713F725A1FA6DDA` (`idRoles`),
  CONSTRAINT `FK_9713F725937C91EA` FOREIGN KEY (`idGroups`) REFERENCES `se_groups` (`id`),
  CONSTRAINT `FK_9713F725A1FA6DDA` FOREIGN KEY (`idRoles`) REFERENCES `se_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_group_roles`
--

LOCK TABLES `se_group_roles` WRITE;
/*!40000 ALTER TABLE `se_group_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_groups`
--

DROP TABLE IF EXISTS `se_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idGroupsParent` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_231E44ECBF274AB0` (`idGroupsParent`),
  KEY `IDX_231E44ECDBF11E1D` (`idUsersCreator`),
  KEY `IDX_231E44EC30D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_231E44EC30D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_231E44ECBF274AB0` FOREIGN KEY (`idGroupsParent`) REFERENCES `se_groups` (`id`),
  CONSTRAINT `FK_231E44ECDBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_groups`
--

LOCK TABLES `se_groups` WRITE;
/*!40000 ALTER TABLE `se_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_permissions`
--

DROP TABLE IF EXISTS `se_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` smallint(6) NOT NULL,
  `idRoles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5CEC3EEAE25D857EC242628A1FA6DDA` (`context`,`module`,`idRoles`),
  KEY `IDX_5CEC3EEAA1FA6DDA` (`idRoles`),
  CONSTRAINT `FK_5CEC3EEAA1FA6DDA` FOREIGN KEY (`idRoles`) REFERENCES `se_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_permissions`
--

LOCK TABLES `se_permissions` WRITE;
/*!40000 ALTER TABLE `se_permissions` DISABLE KEYS */;
INSERT INTO `se_permissions` (`id`, `context`, `module`, `permissions`, `idRoles`) VALUES (1,'sulu.contact.people',NULL,127,1),(2,'sulu.contact.organizations',NULL,127,1),(3,'sulu.media.collections',NULL,127,1),(4,'sulu.media.system_collections',NULL,127,1),(5,'sulu.security.roles',NULL,127,1),(6,'sulu.security.groups',NULL,127,1),(7,'sulu.security.users',NULL,127,1),(8,'sulu.settings.categories',NULL,127,1),(9,'sulu.settings.tags',NULL,127,1),(10,'sulu.global.snippets',NULL,127,1),(11,'sulu.modules.articles',NULL,127,1),(12,'sulu.modules.redirects',NULL,127,1),(13,'sulu.webspace_settings.core-ntx.default-snippets',NULL,127,1),(14,'sulu.webspace_settings.core-ntx.analytics',NULL,127,1),(15,'sulu.webspace_settings.core-ntx.custom-urls',NULL,127,1),(16,'sulu.webspaces.core-ntx',NULL,127,1),(17,'sulu.automation.tasks',NULL,127,1),(18,'sulu.form.forms',NULL,127,1),(19,'sulu.settings.categories',NULL,120,2),(20,'sulu.settings.tags',NULL,120,2),(21,'sulu.global.snippets',NULL,120,2),(22,'sulu.modules.articles',NULL,122,2),(23,'sulu.webspace_settings.core-ntx.default-snippets',NULL,0,2),(24,'sulu.webspace_settings.core-ntx.analytics',NULL,0,2),(25,'sulu.webspaces.core-ntx',NULL,114,2),(26,'sulu.form.forms',NULL,112,2),(27,'sulu.automation.tasks',NULL,112,2),(28,'sulu.media.collections',NULL,120,2),(29,'sulu.contact.organizations',NULL,112,3),(30,'sulu.contact.people',NULL,112,3),(31,'sulu.security.roles',NULL,112,3),(32,'sulu.security.groups',NULL,112,3),(33,'sulu.security.users',NULL,112,3),(34,'sulu.global.snippets',NULL,112,3),(35,'sulu.modules.redirects',NULL,64,3),(36,'sulu.modules.articles',NULL,66,3),(37,'sulu.settings.tags',NULL,64,3),(38,'sulu.settings.categories',NULL,64,3),(39,'sulu.media.system_collections',NULL,64,3),(40,'sulu.media.collections',NULL,64,3),(41,'sulu.webspace_settings.core-ntx.custom-urls',NULL,120,3),(42,'sulu.webspace_settings.core-ntx.analytics',NULL,120,3),(43,'sulu.webspace_settings.core-ntx.default-snippets',NULL,80,3),(44,'sulu.webspaces.core-ntx',NULL,66,3),(45,'sulu.form.forms',NULL,120,3),(46,'sulu.automation.tasks',NULL,64,3),(47,'sulu.contact.people',NULL,96,4),(48,'sulu.contact.organizations',NULL,96,4),(49,'sulu.media.collections',NULL,104,4),(50,'sulu.media.system_collections',NULL,64,4),(51,'sulu.security.roles',NULL,96,4),(52,'sulu.security.groups',NULL,96,4),(53,'sulu.security.users',NULL,96,4),(54,'sulu.settings.categories',NULL,104,4),(55,'sulu.settings.tags',NULL,104,4),(56,'sulu.global.snippets',NULL,96,4),(57,'sulu.modules.redirects',NULL,64,4),(58,'sulu.modules.articles',NULL,98,4),(59,'sulu.webspace_settings.core-ntx.default-snippets',NULL,64,4),(60,'sulu.webspace_settings.core-ntx.analytics',NULL,96,4),(61,'sulu.webspace_settings.core-ntx.custom-urls',NULL,96,4),(62,'sulu.webspaces.core-ntx',NULL,98,4),(63,'sulu.form.forms',NULL,96,4),(64,'sulu.automation.tasks',NULL,96,4);
/*!40000 ALTER TABLE `se_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_role_settings`
--

DROP TABLE IF EXISTS `se_role_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_role_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settingKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DAD1C8CB3AA9950BB8C2FD88` (`settingKey`,`roleId`),
  KEY `IDX_DAD1C8CBB8C2FD88` (`roleId`),
  KEY `IDX_DAD1C8CB3AA9950B` (`settingKey`),
  CONSTRAINT `FK_DAD1C8CBB8C2FD88` FOREIGN KEY (`roleId`) REFERENCES `se_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_role_settings`
--

LOCK TABLES `se_role_settings` WRITE;
/*!40000 ALTER TABLE `se_role_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_role_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_roles`
--

DROP TABLE IF EXISTS `se_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `system` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idSecurityTypes` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_13B749A05E237E06` (`name`),
  KEY `IDX_13B749A0D02106C0` (`idSecurityTypes`),
  KEY `IDX_13B749A0DBF11E1D` (`idUsersCreator`),
  KEY `IDX_13B749A030D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_13B749A030D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_13B749A0D02106C0` FOREIGN KEY (`idSecurityTypes`) REFERENCES `se_security_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_13B749A0DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_roles`
--

LOCK TABLES `se_roles` WRITE;
/*!40000 ALTER TABLE `se_roles` DISABLE KEYS */;
INSERT INTO `se_roles` (`id`, `name`, `system`, `created`, `changed`, `idSecurityTypes`, `idUsersCreator`, `idUsersChanger`) VALUES (1,'Повний доступ','Sulu','2018-07-04 10:26:15','2018-07-08 16:37:41',NULL,NULL,NULL),(2,'Контент','Sulu','2018-07-11 22:40:18','2018-07-11 22:41:15',NULL,1,1),(3,'Система','Sulu','2018-07-11 22:46:11','2018-07-11 22:47:17',NULL,1,1),(4,'Розробка','Sulu','2018-07-13 04:20:30','2018-07-13 04:20:30',NULL,1,1);
/*!40000 ALTER TABLE `se_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_security_types`
--

DROP TABLE IF EXISTS `se_security_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_security_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_security_types`
--

LOCK TABLES `se_security_types` WRITE;
/*!40000 ALTER TABLE `se_security_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_security_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_user_groups`
--

DROP TABLE IF EXISTS `se_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `idGroups` int(11) DEFAULT NULL,
  `idUsers` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E43ED0C8937C91EA` (`idGroups`),
  KEY `IDX_E43ED0C8347E6F4` (`idUsers`),
  CONSTRAINT `FK_E43ED0C8347E6F4` FOREIGN KEY (`idUsers`) REFERENCES `se_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E43ED0C8937C91EA` FOREIGN KEY (`idGroups`) REFERENCES `se_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_user_groups`
--

LOCK TABLES `se_user_groups` WRITE;
/*!40000 ALTER TABLE `se_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_user_roles`
--

DROP TABLE IF EXISTS `se_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `idUsers` int(11) DEFAULT NULL,
  `idRoles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E48BD9DB347E6F4` (`idUsers`),
  KEY `IDX_E48BD9DBA1FA6DDA` (`idRoles`),
  CONSTRAINT `FK_E48BD9DB347E6F4` FOREIGN KEY (`idUsers`) REFERENCES `se_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E48BD9DBA1FA6DDA` FOREIGN KEY (`idRoles`) REFERENCES `se_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_user_roles`
--

LOCK TABLES `se_user_roles` WRITE;
/*!40000 ALTER TABLE `se_user_roles` DISABLE KEYS */;
INSERT INTO `se_user_roles` (`id`, `locale`, `idUsers`, `idRoles`) VALUES (1,'[\"uk\",\"en\"]',1,1),(5,'[\"uk\",\"en\"]',2,4),(6,'[\"uk\",\"en\"]',3,1);
/*!40000 ALTER TABLE `se_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_user_settings`
--

DROP TABLE IF EXISTS `se_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_user_settings` (
  `settingsValue` longtext COLLATE utf8_unicode_ci NOT NULL,
  `settingsKey` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `idUsers` int(11) NOT NULL,
  PRIMARY KEY (`settingsKey`,`idUsers`),
  KEY `IDX_108FCAFA347E6F4` (`idUsers`),
  CONSTRAINT `FK_108FCAFA347E6F4` FOREIGN KEY (`idUsers`) REFERENCES `se_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_user_settings`
--

LOCK TABLES `se_user_settings` WRITE;
/*!40000 ALTER TABLE `se_user_settings` DISABLE KEYS */;
INSERT INTO `se_user_settings` (`settingsValue`, `settingsKey`, `idUsers`) VALUES ('[{\"name\":\"logo\",\"translation\":\"public.logo\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"false\",\"type\":\"thumbnails\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"861\"},{\"name\":\"number\",\"translation\":\"contact.accounts.number\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"90px\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"862\"},{\"name\":\"name\",\"translation\":\"public.name\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"300px\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"filter-type\":\"string\",\"id\":\"863\"},{\"name\":\"corporation\",\"translation\":\"contact.accounts.corporation\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"864\"},{\"name\":\"city\",\"translation\":\"contact.address.city\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"filter-type\":\"string\",\"id\":\"865\"},{\"name\":\"zip\",\"translation\":\"contact.address.zip\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"866\"},{\"name\":\"street\",\"translation\":\"contact.address.street\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"867\"},{\"name\":\"streetNumber\",\"translation\":\"contact.address.number\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"868\"},{\"name\":\"addressLine\",\"translation\":\"contact.address.address-line\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"false\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"869\"},{\"name\":\"state\",\"translation\":\"contact.address.state\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"870\"},{\"name\":\"countryCode\",\"translation\":\"contact.address.countryCode\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"871\"},{\"name\":\"mainContact\",\"translation\":\"contact.contacts.main-contact\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"false\",\"type\":\"string\",\"width\":\"200px\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"872\"},{\"name\":\"mainPhone\",\"translation\":\"public.phone\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"873\"},{\"name\":\"mainEmail\",\"translation\":\"public.email\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"filter-type\":\"string\",\"id\":\"874\"},{\"name\":\"mainFax\",\"translation\":\"public.fax\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"875\"},{\"name\":\"mainUrl\",\"translation\":\"public.url\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"876\"},{\"name\":\"created\",\"translation\":\"public.created\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"datetime\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"datetime\",\"id\":\"877\"},{\"name\":\"changed\",\"translation\":\"public.changed\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"datetime\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"datetime\",\"id\":\"878\"},{\"name\":\"id\",\"translation\":\"public.id\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"integer\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"integer\",\"id\":\"879\"},{\"name\":\"uid\",\"translation\":\"contact.accounts.uid\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"integer\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"880\"},{\"name\":\"registerNumber\",\"translation\":\"contact.accounts.registerNumber\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"881\"},{\"name\":\"placeOfJurisdiction\",\"translation\":\"contact.accounts.placeOfJurisdiction\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"882\"}]','accountsFields',1),('\"uk\"','articleLanguage',1),('[{\"name\":\"id\",\"translation\":\"public.id\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"\",\"id\":\"889\"},{\"name\":\"key\",\"translation\":\"public.key\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"\",\"id\":\"890\"},{\"name\":\"name\",\"translation\":\"public.name\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"false\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"\",\"id\":\"891\"},{\"name\":\"created\",\"translation\":\"public.created\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"\",\"id\":\"892\"},{\"name\":\"changed\",\"translation\":\"public.changed\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"\",\"id\":\"893\"}]','categoriesFields',1),('\"1\"','categoriesLastClicked',1),('\"uk\"','categoryLocale',1),('\"infinite-scroll\"','collectionEditListPagination',1),('\"datagrid\\/decorators\\/masonry-view\"','collectionEditListView',1),('\"true\"','column-navigation-show-ghost-pages',1),('\"infinite-scroll\"','contactListPagination',1),('\"datagrid\\/decorators\\/card-view\"','contactListView',1),('[{\"name\":\"avatar\",\"translation\":\"public.avatar\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"false\",\"type\":\"thumbnails\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"811\"},{\"name\":\"fullName\",\"translation\":\"public.name\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"false\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"812\"},{\"name\":\"firstName\",\"translation\":\"contact.contacts.firstName\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"filter-type\":\"string\",\"id\":\"813\"},{\"name\":\"lastName\",\"translation\":\"contact.contacts.lastName\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"filter-type\":\"string\",\"id\":\"814\"},{\"name\":\"mainEmail\",\"translation\":\"public.email\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"filter-type\":\"string\",\"id\":\"815\"},{\"name\":\"account\",\"translation\":\"contact.contacts.company\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"816\"},{\"name\":\"city\",\"translation\":\"contact.address.city\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"filter-type\":\"string\",\"id\":\"817\"},{\"name\":\"zip\",\"translation\":\"contact.address.zip\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"818\"},{\"name\":\"street\",\"translation\":\"contact.address.street\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"819\"},{\"name\":\"number\",\"translation\":\"contact.address.number\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"820\"},{\"name\":\"addressLine\",\"translation\":\"contact.address.address-line\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"false\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"821\"},{\"name\":\"state\",\"translation\":\"contact.address.state\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"822\"},{\"name\":\"countryCode\",\"translation\":\"contact.address.countryCode\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"823\"},{\"name\":\"mainPhone\",\"translation\":\"public.phone\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"filter-type\":\"string\",\"id\":\"824\"},{\"name\":\"id\",\"translation\":\"public.id\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"integer\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"integer\",\"id\":\"825\"},{\"name\":\"mainFax\",\"translation\":\"public.fax\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"826\"},{\"name\":\"mainUrl\",\"translation\":\"public.url\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"827\"},{\"name\":\"created\",\"translation\":\"public.created\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"datetime\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"datetime\",\"id\":\"828\"},{\"name\":\"changed\",\"translation\":\"public.changed\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"datetime\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"datetime\",\"id\":\"829\"},{\"name\":\"birthday\",\"translation\":\"contact.contacts.birthday\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"date\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"date\",\"id\":\"830\"},{\"name\":\"title\",\"translation\":\"public.title\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"id\":\"831\"},{\"name\":\"salutation\",\"translation\":\"contact.contacts.salutation\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"832\"},{\"name\":\"formOfAddress\",\"translation\":\"contact.contacts.formOfAddress\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"833\"},{\"name\":\"position\",\"translation\":\"contact.contacts.position\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"false\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"filter-type\":\"string\",\"id\":\"834\"}]','contactsFields',1),('\"uk\"','contentLanguage',1),('\"uk\"','core-ntx.contentLanguage',1),('\"8a1ca287-8319-49bf-85ba-5a30f204fa86\"','core-ntxColumnNavigationSelected',1),('\"8a1ca287-8319-49bf-85ba-5a30f204fa86\"','core-ntxColumnNavigationSelected',2),('{\"attribute\":\"created\",\"direction\":\"desc\"}','dynamicsOrder',1),('[{\"name\":\"id\",\"translation\":\"public.id\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"\",\"id\":\"1057\"},{\"name\":\"title\",\"translation\":\"public.title\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"\",\"id\":\"1058\"},{\"name\":\"changed\",\"translation\":\"public.changed\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"\",\"id\":\"1059\"}]','formsFields',1),('\"19\"','last-visited-collection',1),('\"20\"','mediaDropdownPageSize',1),('[{\"name\":\"id\",\"translation\":\"public.id\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"integer\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"id\":\"895\"},{\"name\":\"changed\",\"translation\":\"public.changed\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"datetime\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"id\":\"896\"},{\"name\":\"created\",\"translation\":\"public.created\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"datetime\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"id\":\"897\"},{\"name\":\"thumbnails\",\"translation\":\"media.media.thumbnails\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"false\",\"type\":\"thumbnails\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"thumbnails\",\"id\":\"898\"},{\"name\":\"url\",\"translation\":\"Url\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"string\",\"id\":\"899\"},{\"name\":\"type\",\"translation\":\"public.type\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"900\"},{\"name\":\"version\",\"translation\":\"public.version\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"id\":\"901\"},{\"name\":\"name\",\"translation\":\"public.name\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"902\"},{\"name\":\"subVersion\",\"translation\":\"SubVersion\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"none\",\"id\":\"903\"},{\"name\":\"size\",\"translation\":\"media.media.size\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"bytes\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"904\"},{\"name\":\"mimeType\",\"translation\":\"media.media.mime-type\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"905\"},{\"name\":\"title\",\"translation\":\"public.title\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"title\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"always\",\"id\":\"906\"},{\"name\":\"description\",\"translation\":\"public.description\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"display\":\"no\",\"id\":\"907\"}]','mediaFields',1),('\"20\"','mediaInfinitePageSize',1),('\"uk\"','mediaLanguage',1),('{\"attribute\":\"name\",\"direction\":\"desc\"}','mediaOrder',1),('{\"attribute\":\"enabled\",\"direction\":\"desc\"}','redirect-routesOrder',1),('{\"attribute\":\"created\",\"direction\":\"desc\"}','rolesOrder',1),('\"20\"','snippetsDropdownPageSize',1),('[{\"name\":\"title\",\"translation\":\"public.title\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"100px\",\"editable\":\"false\",\"id\":\"1818\"},{\"name\":\"localizedTemplate\",\"translation\":\"snippets.list.template\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"false\",\"type\":\"\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"id\":\"1819\"},{\"name\":\"id\",\"translation\":\"public.id\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"false\",\"type\":\"\",\"width\":\"50px\",\"minWidth\":\"\",\"editable\":\"false\",\"id\":\"1820\"},{\"name\":\"created\",\"translation\":\"public.created\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"date\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"id\":\"1821\"},{\"name\":\"changed\",\"translation\":\"public.changed\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"date\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"id\":\"1822\"}]','snippetsFields',1),('\"4\"','suluformformLastClicked',1),('[{\"name\":\"id\",\"translation\":\"public.id\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"integer\",\"width\":\"50px\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"integer\",\"id\":\"5314\"},{\"name\":\"name\",\"translation\":\"tags.name\",\"disabled\":\"false\",\"default\":\"true\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"true\",\"class\":\"\",\"filter-type\":\"string\",\"id\":\"5315\"},{\"name\":\"created\",\"translation\":\"public.created\",\"disabled\":\"true\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"date\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"date\",\"id\":\"5316\"},{\"name\":\"changed\",\"translation\":\"public.changed\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"date\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"date\",\"id\":\"5317\"},{\"name\":\"creator\",\"translation\":\"tags.author\",\"disabled\":\"false\",\"default\":\"false\",\"sortable\":\"true\",\"type\":\"string\",\"width\":\"\",\"minWidth\":\"\",\"editable\":\"false\",\"class\":\"\",\"filter-type\":\"string\",\"id\":\"5318\"}]','tagsFields',1);
/*!40000 ALTER TABLE `se_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_users`
--

DROP TABLE IF EXISTS `se_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `lastLogin` datetime DEFAULT NULL,
  `confirmationKey` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetToken` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetTokenExpiresAt` datetime DEFAULT NULL,
  `passwordResetTokenEmailsSent` int(11) DEFAULT '0',
  `privateKey` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apiKey` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idContacts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B10AC28EF85E0677` (`username`),
  UNIQUE KEY `UNIQ_B10AC28E60E33F28` (`idContacts`),
  UNIQUE KEY `UNIQ_B10AC28EADC1CD13` (`passwordResetToken`),
  UNIQUE KEY `UNIQ_B10AC28EE7927C74` (`email`),
  CONSTRAINT `FK_B10AC28E60E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_users`
--

LOCK TABLES `se_users` WRITE;
/*!40000 ALTER TABLE `se_users` DISABLE KEYS */;
INSERT INTO `se_users` (`id`, `username`, `password`, `locale`, `salt`, `locked`, `enabled`, `lastLogin`, `confirmationKey`, `passwordResetToken`, `passwordResetTokenExpiresAt`, `passwordResetTokenEmailsSent`, `privateKey`, `apiKey`, `email`, `idContacts`) VALUES (1,'admin','2dc6b7e1db944e260ef9ba109d97da1b62990b0c2a3891d6c941064b7c8be0b7c9f8f944c4d3c7777f55e1a5991f2b5c851e766671108de65652027f71a0201b','uk','PgwJW8y0Wn2Dukrt2mXxGxIZJlAUXfRnvCS629uR42g=',0,1,'2018-09-15 02:14:26',NULL,'QZy3IgEhUVTNCs-CwSxP_n9VYTS-zB83cF8fo_NOQYo','2018-08-29 12:16:29',2,NULL,'e606872febebed122e2a2fc89082c1ba','netexy@icloud.com',1),(2,'script','5a955106861b5abfde2df885111b32dc6f889adcf2ce2c69750ed66922dc69959ef7cab8da3377c9ae95ec8b790ca8de66dcb17d498c927d7f15ac2c155d40f3','uk','Mbclay+GWCgqfyaPmgX2NJ0rGXOaHhMBE4TPCWi+fxU=',0,1,'2018-07-30 17:53:57',NULL,NULL,NULL,NULL,NULL,'6c21f34673c3241b0a9f9282fc1eae1e',NULL,2),(3,'zorkyy','8524c68b839fc65369be6b56bbe6d8d08d5f9e60e2b946e286d85bc374b267f73640807baa9eefa3c3bb57d264ff91eb9577dee47a51a14c3c497cc6aa70983b','en','3cOQy/VGWEn4D/UzO3LyXf3rn+IUNAB+0kYqTGP8ewI=',0,1,NULL,NULL,NULL,NULL,NULL,NULL,'d47ac1009a79d8063bd733c594068e7d','zorkyysokol@gmail.com',3);
/*!40000 ALTER TABLE `se_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_tags`
--

DROP TABLE IF EXISTS `ta_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ta_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B258E4995E237E06` (`name`),
  KEY `IDX_B258E499DBF11E1D` (`idUsersCreator`),
  KEY `IDX_B258E49930D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_B258E49930D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B258E499DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_tags`
--

LOCK TABLES `ta_tags` WRITE;
/*!40000 ALTER TABLE `ta_tags` DISABLE KEYS */;
INSERT INTO `ta_tags` (`id`, `name`, `created`, `changed`, `idUsersCreator`, `idUsersChanger`) VALUES (1,'SEO','2018-07-11 22:49:06','2018-07-11 22:49:06',1,1),(2,'DESIGN','2018-07-11 22:49:56','2018-07-11 22:49:56',1,1),(3,'PWA','2018-07-11 22:50:51','2018-07-11 22:50:51',1,1),(4,'SCSS','2018-07-11 22:51:59','2018-07-11 22:51:59',1,1),(5,'FRONTEND','2018-07-11 22:53:33','2018-07-11 22:53:33',1,1),(6,'UX','2018-07-11 22:53:55','2018-07-11 22:53:55',1,1);
/*!40000 ALTER TABLE `ta_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_task_executions`
--

DROP TABLE IF EXISTS `ta_task_executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ta_task_executions` (
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `task_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `handler_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `workload` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)',
  `duration` double DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `schedule_time` datetime NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci,
  `result` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:object)',
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `attempts` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `IDX_1EB41368DB60186` (`task_id`),
  KEY `IDX_1EB41368FDCB81E` (`schedule_time`),
  CONSTRAINT `FK_1EB41368DB60186` FOREIGN KEY (`task_id`) REFERENCES `ta_tasks` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_task_executions`
--

LOCK TABLES `ta_task_executions` WRITE;
/*!40000 ALTER TABLE `ta_task_executions` DISABLE KEYS */;
INSERT INTO `ta_task_executions` (`uuid`, `task_id`, `handler_class`, `workload`, `duration`, `start_time`, `end_time`, `schedule_time`, `exception`, `result`, `status`, `attempts`) VALUES ('078f0683-c4f6-4928-a249-7d48d7371df4','bf401c40-66d1-4103-a117-7318af70aae0','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"uk\";}',NULL,NULL,NULL,'2018-08-28 15:11:56',NULL,'N;','planned',1),('0e75c0c7-6034-449c-99ee-f34934a64fee','0c7d0499-6a00-4903-96df-b508f3fd74d7','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-05 03:15:46',NULL,'N;','planned',1),('393ac3ab-c7be-452f-b7b8-b11f35dcf9c2','b102eec8-74aa-4060-8acc-c85fcee13eb6','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"02b4e64c-3cf3-4543-977c-1a1354572312\";s:6:\"locale\";s:2:\"uk\";}',NULL,NULL,NULL,'2018-07-11 07:57:20',NULL,'N;','planned',1),('5582b33d-cd2c-4b23-8c44-672a8cd41cfb','0da2e7c1-78f1-4454-bee8-5b7510d2a1e6','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"610bb085-27f2-4862-91a3-34596a9dd70e\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-31 16:08:20',NULL,'N;','planned',1),('703aed73-4b16-4222-9a0d-e307cf07176d','b5be87f2-ac50-43ef-8dd4-86cccce9faa8','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"19a32019-4b3a-48b3-8674-c394d8a7a57d\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-28 15:12:22',NULL,'N;','planned',1),('838c7661-2142-46d7-bbc9-715ebd62b179','9c28d37a-ca6c-4d34-afd8-fa5a3d14b43b','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-08 00:03:33',NULL,'N;','planned',1),('8f0baf8f-5799-45ee-9aef-0198e02ec298','8ba5b05e-ca3f-4448-9350-f6f652d5285b','Sulu\\Bundle\\AutomationBundle\\Handler\\DocumentUnpublishHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"9c34553c-7f80-45ac-b6f5-5ec90e545f15\";s:6:\"locale\";s:2:\"uk\";}',NULL,NULL,NULL,'2018-09-13 23:15:00',NULL,'N;','planned',1),('9a1b8df4-3cdc-496d-bff0-18b02c7dd296','8e7f69bc-321e-4827-898b-c6c8d2b39c69','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-28 15:11:57',NULL,'N;','planned',1),('9a9e4dcd-3113-4231-bbde-23761be75497','4a1184b3-e077-453c-84df-d3863fee8aff','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"19a32019-4b3a-48b3-8674-c394d8a7a57d\";s:6:\"locale\";s:2:\"uk\";}',NULL,NULL,NULL,'2018-08-28 15:12:22',NULL,'N;','planned',1),('9e578adc-a501-43b4-aecf-14dfab4ca952','c0342484-9655-4821-925d-280a02042eb8','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-08 00:03:53',NULL,'N;','planned',1),('a82716fb-39a2-40b4-8468-9621f4c97c67','1486428c-ebdc-41e6-b404-15dad7be5785','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"04873e43-8ceb-45f1-9e34-004bb2c5012d\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-28 15:12:31',NULL,'N;','planned',1),('ab0aa4ea-b232-465c-842d-4bd3982881e6','80e2614b-e5f3-4d22-ab09-a9d353461fa7','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"f2286519-b6ff-42c0-bff9-7ff41410d99c\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-31 22:33:58',NULL,'N;','planned',1),('ab803b1a-131e-47c5-bf20-4a1079acbb00','61a03db6-8c34-4df6-a889-380ec4375e7a','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"02b4e64c-3cf3-4543-977c-1a1354572312\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-07-11 07:57:50',NULL,'N;','planned',1),('c611c110-166f-47c4-98ac-af7feac0ffa4','01be62d6-e412-4467-bff8-610f8fa0cfb5','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-05 03:16:04',NULL,'N;','planned',1),('c757ebcf-7a87-47d5-a68c-280985be8191','2246fa85-b53e-499b-b4a1-27d04fa1b090','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"f1a762e3-0a04-4d95-a29f-ea99c5c2fb43\";s:6:\"locale\";s:2:\"en\";}',NULL,NULL,NULL,'2018-08-28 15:12:48',NULL,'N;','planned',1),('db04bf8d-c94b-45bb-8adf-7646daf28b0e','36e0fa8b-1f0b-464b-bed4-e788c8344636','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"04873e43-8ceb-45f1-9e34-004bb2c5012d\";s:6:\"locale\";s:2:\"uk\";}',NULL,NULL,NULL,'2018-08-28 15:12:31',NULL,'N;','planned',1),('e4eafd6b-deac-47b0-ba9c-e4975f149a89','082bad13-c997-4e86-8746-3cf01ad17443','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"f2286519-b6ff-42c0-bff9-7ff41410d99c\";s:6:\"locale\";s:2:\"uk\";}',NULL,NULL,NULL,'2018-08-31 22:33:29',NULL,'N;','planned',1),('e8ae6747-ee8d-4e94-ac00-f04b04020f2b','5dfde519-92ed-4772-8e1f-892a0a7dfc2d','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler','a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"f1a762e3-0a04-4d95-a29f-ea99c5c2fb43\";s:6:\"locale\";s:2:\"uk\";}',NULL,NULL,NULL,'2018-08-28 15:12:48',NULL,'N;','planned',1);
/*!40000 ALTER TABLE `ta_task_executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_tasks`
--

DROP TABLE IF EXISTS `ta_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ta_tasks` (
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `handler_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `interval_expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_execution` datetime DEFAULT NULL,
  `last_execution` datetime DEFAULT NULL,
  `system_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workload` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `UNIQ_B5B2FFA47280172` (`system_key`),
  KEY `IDX_B5B2FFAD17F50A6` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_tasks`
--

LOCK TABLES `ta_tasks` WRITE;
/*!40000 ALTER TABLE `ta_tasks` DISABLE KEYS */;
INSERT INTO `ta_tasks` (`uuid`, `handler_class`, `interval_expression`, `first_execution`, `last_execution`, `system_key`, `workload`) VALUES ('01be62d6-e412-4467-bff8-610f8fa0cfb5','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-05 03:16:04',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}'),('082bad13-c997-4e86-8746-3cf01ad17443','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-31 22:33:29',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"f2286519-b6ff-42c0-bff9-7ff41410d99c\";s:6:\"locale\";s:2:\"uk\";}'),('0c7d0499-6a00-4903-96df-b508f3fd74d7','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-05 03:15:46',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}'),('0da2e7c1-78f1-4454-bee8-5b7510d2a1e6','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-31 16:08:20',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"610bb085-27f2-4862-91a3-34596a9dd70e\";s:6:\"locale\";s:2:\"en\";}'),('1486428c-ebdc-41e6-b404-15dad7be5785','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-28 15:12:31',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"04873e43-8ceb-45f1-9e34-004bb2c5012d\";s:6:\"locale\";s:2:\"en\";}'),('2246fa85-b53e-499b-b4a1-27d04fa1b090','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-28 15:12:48',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"f1a762e3-0a04-4d95-a29f-ea99c5c2fb43\";s:6:\"locale\";s:2:\"en\";}'),('36e0fa8b-1f0b-464b-bed4-e788c8344636','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-28 15:12:31',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"04873e43-8ceb-45f1-9e34-004bb2c5012d\";s:6:\"locale\";s:2:\"uk\";}'),('4a1184b3-e077-453c-84df-d3863fee8aff','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-28 15:12:22',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"19a32019-4b3a-48b3-8674-c394d8a7a57d\";s:6:\"locale\";s:2:\"uk\";}'),('5dfde519-92ed-4772-8e1f-892a0a7dfc2d','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-28 15:12:48',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"f1a762e3-0a04-4d95-a29f-ea99c5c2fb43\";s:6:\"locale\";s:2:\"uk\";}'),('61a03db6-8c34-4df6-a889-380ec4375e7a','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-07-11 07:57:50',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"02b4e64c-3cf3-4543-977c-1a1354572312\";s:6:\"locale\";s:2:\"en\";}'),('80e2614b-e5f3-4d22-ab09-a9d353461fa7','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-31 22:33:58',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"f2286519-b6ff-42c0-bff9-7ff41410d99c\";s:6:\"locale\";s:2:\"en\";}'),('8ba5b05e-ca3f-4448-9350-f6f652d5285b','Sulu\\Bundle\\AutomationBundle\\Handler\\DocumentUnpublishHandler',NULL,'2018-09-13 23:15:00',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"9c34553c-7f80-45ac-b6f5-5ec90e545f15\";s:6:\"locale\";s:2:\"uk\";}'),('8e7f69bc-321e-4827-898b-c6c8d2b39c69','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-28 15:11:57',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}'),('9c28d37a-ca6c-4d34-afd8-fa5a3d14b43b','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-08 00:03:33',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}'),('b102eec8-74aa-4060-8acc-c85fcee13eb6','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-07-11 07:57:20',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"02b4e64c-3cf3-4543-977c-1a1354572312\";s:6:\"locale\";s:2:\"uk\";}'),('b5be87f2-ac50-43ef-8dd4-86cccce9faa8','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-28 15:12:22',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"19a32019-4b3a-48b3-8674-c394d8a7a57d\";s:6:\"locale\";s:2:\"en\";}'),('bf401c40-66d1-4103-a117-7318af70aae0','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-28 15:11:56',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"uk\";}'),('c0342484-9655-4821-925d-280a02042eb8','Sulu\\Bundle\\ArticleBundle\\PageTree\\PageTreeRouteUpdateHandler',NULL,'2018-08-08 00:03:53',NULL,NULL,'a:3:{s:5:\"class\";s:51:\"Sulu\\Bundle\\ContentBundle\\Document\\BasePageDocument\";s:2:\"id\";s:36:\"568b1018-c5db-41b3-b3f1-5dcdcaa6a08a\";s:6:\"locale\";s:2:\"en\";}');
/*!40000 ALTER TABLE `ta_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `we_analytics`
--

DROP TABLE IF EXISTS `we_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `we_analytics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `webspace_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `all_domains` tinyint(1) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `type` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4E50BB8D1640EFD3` (`all_domains`),
  KEY `IDX_4E50BB8DAE248174` (`webspace_key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `we_analytics`
--

LOCK TABLES `we_analytics` WRITE;
/*!40000 ALTER TABLE `we_analytics` DISABLE KEYS */;
INSERT INTO `we_analytics` (`id`, `title`, `webspace_key`, `all_domains`, `content`, `type`) VALUES (1,'Google Analytics','core-ntx',1,'\"UA-83585706-4\"','google'),(2,'Facebook Customer Chat Plugin','core-ntx',0,'{\"position\":\"bodyOpen\",\"value\":\"<!-- Load Facebook SDK for JavaScript -->\\n<div id=\\\"fb-root\\\"><\\/div>\\n<script>(function(d, s, id) {\\n  var js, fjs = d.getElementsByTagName(s)[0];\\n  if (d.getElementById(id)) return;\\n  js = d.createElement(s); js.id = id;\\n  js.src = \'https:\\/\\/connect.facebook.net\\/uk_UA\\/sdk\\/xfbml.customerchat.js#xfbml=1&version=v2.12&autoLogAppEvents=1\';\\n  fjs.parentNode.insertBefore(js, fjs);\\n}(document, \'script\', \'facebook-jssdk\'));<\\/script>\\n\\n<!-- Your customer chat code -->\\n<div class=\\\"fb-customerchat\\\"\\n  attribution=setup_tool\\n  page_id=\\\"1903085179716932\\\"\\n  greeting_dialog_display=\\\"hide\\\"\\n  theme_color=\\\"#337CF0\\\"\\n  logged_in_greeting=\\\"\\u0412\\u0456\\u0442\\u0430\\u0454\\u043c\\u043e! \\u0427\\u0438\\u043c \\u043c\\u043e\\u0436\\u0435\\u043c\\u043e \\u0412\\u0430\\u043c \\u0434\\u043e\\u043f\\u043e\\u043c\\u043e\\u0433\\u0442\\u0438?\\\"\\n  logged_out_greeting=\\\"\\u0412\\u0456\\u0442\\u0430\\u0454\\u043c\\u043e! \\u0427\\u0438\\u043c \\u043c\\u043e\\u0436\\u0435\\u043c\\u043e \\u0412\\u0430\\u043c \\u0434\\u043e\\u043f\\u043e\\u043c\\u043e\\u0433\\u0442\\u0438?\\\">\\n<\\/div>\"}','custom'),(4,'Manifest.json','core-ntx',0,'{\"position\":\"headOpen\",\"value\":\"<link rel=\\\"manifest\\\" href=\\\"\\/manifest.json\\\">\"}','custom'),(5,'Local Business Schema','core-ntx',0,'{\"position\":\"headOpen\",\"value\":\"    <script type=\\\"application\\/ld+json\\\">\\n        {\\n            \\\"@context\\\": \\\"http:\\/\\/schema.org\\\",\\n            \\\"@type\\\": \\\"LocalBusiness\\\",\\n            \\\"image\\\": \\\"https:\\/\\/netexy.com\\/media\\/27\\/download\\/fb-cover-950x354%28EN%29.png\\\",\\n            \\\"priceRange\\\": \\\"$250 - $5000\\\",\\n            \\\"url\\\": \\\"https:\\/\\/netexy.com\\/\\\",\\n            \\\"logo\\\": \\\"https:\\/\\/netexy.com\\/media\\/29\\/download\\/logo-144.png\\\",\\n            \\\"hasMap\\\": \\\"https:\\/\\/www.google.com.ua\\/maps\\/place\\/Netexy\\/@48.9242758,24.70619,17z\\/data=!4m12!1m6!3m5!1s0x4730c120f5ee1aff:0x8154761be8333b26!2sNetexy!8m2!3d48.9242758!4d24.7083787!3m4!1s0x4730c120f5ee1aff:0x8154761be8333b26!8m2!3d48.9242758!4d24.7083787\\\",\\n            \\\"email\\\": \\\"mailto:info@netexy.com\\\",\\n            \\\"address\\\": {\\n                \\\"@type\\\": \\\"PostalAddress\\\",\\n                \\\"addressLocality\\\": \\\"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a\\\",\\n                \\\"postalCode\\\": \\\"76018\\\",\\n                \\\"streetAddress\\\": \\\"\\u0432\\u0443\\u043b. \\u0413\\u0430\\u043b\\u0438\\u0446\\u044c\\u043a\\u0430, 43\\\",\\n                \\\"addressRegion\\\": \\\"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a\\\",\\n                \\\"addressCountry\\\": \\\"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430\\\"\\n            },\\n            \\\"description\\\": \\\"Digital strategy, design, web development, engineering and marketing for high growth companies.\\\",\\n            \\\"name\\\": \\\"Netexy\\\",\\n            \\\"telephone\\\": \\\"073 774 7473\\\",\\n            \\\"openingHours\\\": \\\"Mo,Tu,We,Th,Fr 10:00-17:00\\\",\\n            \\\"geo\\\": {\\n                \\\"@type\\\": \\\"GeoCoordinates\\\",\\n                \\\"latitude\\\": \\\"48.9242758\\\",\\n                \\\"longitude\\\": \\\"24.70619\\\"\\n            },\\n            \\\"sameAs\\\": [\\\"https:\\/\\/www.facebook.com\\/netexy\\\"]\\n        }\\n    <\\/script>  \"}','custom'),(6,'Local Business Schema','core-ntx',0,'{\"value\":\"    <script type=\\\"application\\/ld+json\\\">\\n        {\\n            \\\"@context\\\": \\\"http:\\/\\/schema.org\\\",\\n            \\\"@type\\\": \\\"LocalBusiness\\\",\\n            \\\"image\\\": \\\"https:\\/\\/netexy.com\\\",\\n            \\\"priceRange\\\": \\\"$200 - $5000\\\",\\n            \\\"url\\\": \\\"https:\\/\\/netexy.com\\/\\\",\\n            \\\"logo\\\": \\\"https:\\/\\/netexy.com\\/media\\/29\\/download\\/logo-144.png\\\",\\n            \\\"hasMap\\\": \\\"https:\\/\\/www.google.com.ua\\/maps\\/place\\/Netexy\\/@48.9242758,24.7083787,15z\\/data=!4m5!3m4!1s0x0:0x8154761be8333b26!8m2!3d48.9242758!4d24.7083787\\\",\\n            \\\"email\\\": \\\"mailto:info@netexy.com\\\",\\n            \\\"address\\\": {\\n                \\\"@type\\\": \\\"PostalAddress\\\",\\n                \\\"addressLocality\\\": \\\"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a\\\",\\n                \\\"postalCode\\\": \\\"76018\\\",\\n                \\\"streetAddress\\\": \\\"\\u0432\\u0443\\u043b. \\u0413\\u0430\\u043b\\u0438\\u0446\\u044c\\u043a\\u0430 43\\u0431\\\",\\n                \\\"addressRegion\\\": \\\"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a\\\",\\n                \\\"addressCountry\\\": \\\"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430\\\"\\n            },\\n            \\\"description\\\": \\\"Unlimited Digital Space\\\",\\n            \\\"name\\\": \\\"Netexy\\\",\\n            \\\"telephone\\\": \\\"073 774 7473\\\",\\n            \\\"openingHours\\\": \\\"Mo,Tu,We,Th,Fr 10:00-17:00\\\",\\n            \\\"geo\\\": {\\n                \\\"@type\\\": \\\"GeoCoordinates\\\",\\n                \\\"latitude\\\": \\\"48.9242758\\\",\\n                \\\"longitude\\\": \\\"24.7083787\\\"\\n            },\\n            \\\"sameAs\\\": [\\\"https:\\/\\/www.facebook.com\\/netexy\\\"]\\n        }\\n    <\\/script>  \"}','custom'),(7,'Manifest','core-ntx',0,'{\"position\":\"headOpen\",\"value\":\" <link rel=\\\"manifest\\\" href=\\\"\\/manifest.json\\\">\"}','custom'),(9,'Facebook Customer Chat Plugin','core-ntx',0,'{\"position\":\"bodyClose\",\"value\":\"<script>\\n  window.fbAsyncInit = function() {\\n    FB.init({\\n      appId            : \'1959982027611358\',\\n      autoLogAppEvents : true,\\n      xfbml            : true,\\n      version          : \'v3.1\'\\n    });\\n  };\\n\\n  (function(d, s, id){\\n     var js, fjs = d.getElementsByTagName(s)[0];\\n     if (d.getElementById(id)) {return;}\\n     js = d.createElement(s); js.id = id;\\n     js.src = \\\"https:\\/\\/connect.facebook.net\\/uk_UA\\/sdk.js\\\";\\n     fjs.parentNode.insertBefore(js, fjs);\\n   }(document, \'script\', \'facebook-jssdk\'));\\n<\\/script>\\n    \\n<div class=\\\"fb-customerchat\\\"\\n page_id=\\\"1903085179716932\\\"\\n ref=\\\"\\\"\\n theme_color=\\\"#337CF0\\\"\\n logged_in_greeting=\\\"\\u0412\\u0456\\u0442\\u0430\\u0454\\u043c\\u043e! \\u041c\\u043e\\u0436\\u043b\\u0438\\u0432\\u043e \\u0432\\u0430\\u043c \\u043f\\u043e\\u0442\\u0440\\u0456\\u0431\\u043d\\u0430 \\u0434\\u043e\\u043f\\u043e\\u043c\\u043e\\u0433\\u0430?\\\"\\n logged_out_greeting=\\\"\\u0412\\u0456\\u0442\\u0430\\u0454\\u043c\\u043e! \\u041c\\u0438 \\u0433\\u043e\\u0442\\u043e\\u0432\\u0456 \\u0432\\u0430\\u043c \\u0434\\u043e\\u043f\\u043e\\u043c\\u043e\\u0433\\u0442\\u0438\\\">\\n minimized=\\\"true\\\"\\n<\\/div>\"}','custom'),(10,'latest-link[FIX]','core-ntx',0,'{\"position\":\"headClose\",\"value\":\"<style>\\n#globalnav .item-menu:last-child {\\n  display: none !important;\\n}\\n.site-footer__legal .item-menu:last-child {\\n  display: none !important;\\n}\\n<\\/style>\"}','custom');
/*!40000 ALTER TABLE `we_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `we_analytics_domains`
--

DROP TABLE IF EXISTS `we_analytics_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `we_analytics_domains` (
  `analytics` int(11) NOT NULL,
  `domain` int(11) NOT NULL,
  PRIMARY KEY (`analytics`,`domain`),
  KEY `IDX_F9323B6EEAC2E688` (`analytics`),
  KEY `IDX_F9323B6EA7A91E0B` (`domain`),
  CONSTRAINT `FK_F9323B6EA7A91E0B` FOREIGN KEY (`domain`) REFERENCES `we_domains` (`id`),
  CONSTRAINT `FK_F9323B6EEAC2E688` FOREIGN KEY (`analytics`) REFERENCES `we_analytics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `we_analytics_domains`
--

LOCK TABLES `we_analytics_domains` WRITE;
/*!40000 ALTER TABLE `we_analytics_domains` DISABLE KEYS */;
INSERT INTO `we_analytics_domains` (`analytics`, `domain`) VALUES (2,1),(4,1),(4,2),(5,1),(5,2),(6,3),(6,4),(7,3),(7,4),(9,3),(9,4),(10,3),(10,4);
/*!40000 ALTER TABLE `we_analytics_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `we_domains`
--

DROP TABLE IF EXISTS `we_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `we_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `environment` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7CFAB3F5F47645AE` (`url`),
  KEY `IDX_7CFAB3F54626DE22` (`environment`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `we_domains`
--

LOCK TABLES `we_domains` WRITE;
/*!40000 ALTER TABLE `we_domains` DISABLE KEYS */;
INSERT INTO `we_domains` (`id`, `url`, `environment`) VALUES (1,'netexy.com','dev'),(2,'netexy.com/{localization}','dev'),(3,'netexy.com','prod'),(4,'netexy.com/{localization}','prod');
/*!40000 ALTER TABLE `we_domains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-15 18:10:18