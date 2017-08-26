# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.22-MariaDB)
# Database: recruitment
# Generation Time: 2017-04-12 09:46:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `offer_id` int(10) unsigned NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_offer_id_foreign` (`offer_id`),
  CONSTRAINT `comments_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `user_id`, `offer_id`, `content`, `created_at`, `updated_at`)
VALUES
	(2,2,1,'Testsetsets','2017-04-12 08:51:18','2017-04-12 08:51:18');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(3,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(4,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(5,'2016_06_01_000004_create_oauth_clients_table',1),
	(6,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(7,'2017_02_06_145032_create_news_table',1),
	(8,'2017_02_07_142236_create_offers_table',1),
	(10,'2017_02_07_145734_create_offer_resume_table',1),
	(11,'2017_02_07_151309_create_comments_table',1),
	(12,'2017_02_23_152317_create_offer_favour_table',1),
	(13,'2017_02_23_152333_create_resume_favour_table',1),
	(14,'2017_02_07_144245_create_resumes_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_user_id_foreign` (`user_id`),
  CONSTRAINT `news_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`id`, `user_id`, `title`, `desc`, `image`, `content`, `created_at`, `updated_at`)
VALUES
	(1,3,'123123','123123213123','2017-04-12-08-32-15-4024.jpg','asdasdsa','2017-04-12 07:16:26','2017-04-12 08:32:15'),
	(2,3,'1','1','2017-04-12-09-36-30-4206.jpg','111','2017-04-12 09:36:30','2017-04-12 09:36:30');

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('a3d7d5f2414a47fa14509d7745b9e742909535a388d7c5e02045d8cdf1d841a112c4e0476b78797d',2,1,NULL,'[\"*\"]',0,'2017-04-11 03:10:28','2017-04-11 03:10:28','2018-04-11 03:10:28'),
	('a72c25e79d37a0209d0c8fbdf7cbba6ec67ea52516998c5d628ef7d629498dd1d3527d13f3f7d87e',2,1,NULL,'[]',0,'2017-04-11 02:50:05','2017-04-11 02:50:05','2018-04-11 02:50:05');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'MOBILE_API','UPCu0kxaiH07pgmxYRI1woZuZCxCmsY62yJJD0wx','',0,1,0,'2017-04-11 10:50:02','2017-04-11 10:50:02');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('2a1e374d73c89314990e671d055c5283ed5ac777970a37dbe86006e5cf9027cbd3efcebe0f05a7e1','a3d7d5f2414a47fa14509d7745b9e742909535a388d7c5e02045d8cdf1d841a112c4e0476b78797d',0,'2018-04-11 03:10:28'),
	('acd503cf3244ae2f6ca0213d291dfe8ed496eb115691dea94279d7c5b5cb0160167093940090766e','a72c25e79d37a0209d0c8fbdf7cbba6ec67ea52516998c5d628ef7d629498dd1d3527d13f3f7d87e',0,'2018-04-11 02:50:05');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table offer_resume
# ------------------------------------------------------------

DROP TABLE IF EXISTS `offer_resume`;

CREATE TABLE `offer_resume` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(10) unsigned NOT NULL,
  `resume_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_resume_offer_id_foreign` (`offer_id`),
  KEY `offer_resume_resume_id_foreign` (`resume_id`),
  CONSTRAINT `offer_resume_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  CONSTRAINT `offer_resume_resume_id_foreign` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `offer_resume` WRITE;
/*!40000 ALTER TABLE `offer_resume` DISABLE KEYS */;

INSERT INTO `offer_resume` (`id`, `offer_id`, `resume_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'2017-04-12 08:59:53','2017-04-12 08:59:53'),
	(2,1,2,'2017-04-12 09:35:54','2017-04-12 09:35:54');

/*!40000 ALTER TABLE `offer_resume` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table offers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `offers`;

CREATE TABLE `offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offers_user_id_foreign` (`user_id`),
  CONSTRAINT `offers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;

INSERT INTO `offers` (`id`, `user_id`, `title`, `education`, `pay`, `sort`, `detail`, `created_at`, `updated_at`, `status`)
VALUES
	(1,3,'电子/电气转行8K系统工程师','大专','6001-8000元/月',0,'有一年以上工作经验可直接投递简历，零基础想转行的，请咨询招聘经理！\r\n招聘：系统运维、技术支持、网络工程师及实习生20名\r\n职业前景：AIX系统工程师是银行、金融机构高级IT岗位（AIX是建立在LINUX基础上的IBM小型服务器的高端操作系统，AIX系统占据银行和大型企业80%市场份额，凡是这个岗位都是高端企业高工资，是本次招聘的主要岗位；实习生可以零基础实训，AIX技术容易掌握。对于想进入金融IT行业求稳定发展的求职者，是个好机会。具统计2016年系统运维工程师招聘人数同比上涨32%，工资上涨28%，全国需求总量是38万人，本岗位需求空间稳步增长，工资水涨船高。\r\n\r\n薪资待遇：第一年工资7000元/月-10000元/月，第二年起9000元/月-22000元/月，均享受国家规定的五险一金福利待遇。\r\n\r\n工作内容：\r\n1. 可提供HACMP方案、测试、实施、维护；\r\n2. 负责公司IBM/HP小机设备的安装、维护、配置、管理；\r\n3. 熟悉IBM/HP小机设备的硬、软件使用并能够联系相应的服务厂商协助解决。\r\n4. 负责公司IBM/惠普小型机设备的日常运行和维护，如果出现题可以和厂家协调解决；\r\n\r\n报名条件：\r\n1. 大专及以上学历（自考、成考、统招毕业生均可)未毕业者在取得毕业证后转正；\r\n2.计算机科学与技术、软件工程、电子技术、自动化、电子商务、应用数学等相关专业；\r\n3.入职前在北京参加集中岗前实训三个半月，要求至少在北京工作一年以上才可协调重新安置到原籍省会城市（特殊情况可协调处理）。','2017-04-11 03:17:55','2017-04-12 06:54:35',1);

/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resumes`;

CREATE TABLE `resumes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` int(11) NOT NULL,
  `school` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resumes_user_id_foreign` (`user_id`),
  CONSTRAINT `resumes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;

INSERT INTO `resumes` (`id`, `user_id`, `title`, `name`, `sex`, `school`, `desc`, `detail`, `created_at`, `updated_at`)
VALUES
	(1,2,'titleValue','nameValue',1,'schoolValue','descValue','detailVacle','2017-04-11 03:10:39','2017-04-11 03:10:39'),
	(2,2,'12222','12222',2,'12222','12222','112222','2017-04-12 09:35:48','2017-04-12 09:45:56');

/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_offer_favour
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_offer_favour`;

CREATE TABLE `user_offer_favour` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `offer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_offer_favour_user_id_foreign` (`user_id`),
  KEY `user_offer_favour_offer_id_foreign` (`offer_id`),
  CONSTRAINT `user_offer_favour_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  CONSTRAINT `user_offer_favour_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user_offer_favour` WRITE;
/*!40000 ALTER TABLE `user_offer_favour` DISABLE KEYS */;

INSERT INTO `user_offer_favour` (`id`, `user_id`, `offer_id`, `created_at`, `updated_at`)
VALUES
	(1,2,1,'2017-04-12 08:59:50','2017-04-12 08:59:50');

/*!40000 ALTER TABLE `user_offer_favour` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_resume_favour
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_resume_favour`;

CREATE TABLE `user_resume_favour` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `resume_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_resume_favour_user_id_foreign` (`user_id`),
  KEY `user_resume_favour_resume_id_foreign` (`resume_id`),
  CONSTRAINT `user_resume_favour_resume_id_foreign` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`),
  CONSTRAINT `user_resume_favour_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `password`, `company`, `type`, `remember_token`, `created_at`, `updated_at`, `status`)
VALUES
	(1,'admin','$2y$10$XnEsPEod56GexhHr9gkANeVuOEPXhpc21VdDo855nONPtIAAqqgJ2','管理员',3,NULL,'2017-04-12 11:09:31','2017-04-12 11:09:31',1),
	(2,'Jack@126.com','$2y$10$XnEsPEod56GexhHr9gkANeVuOEPXhpc21VdDo855nONPtIAAqqgJ2',NULL,1,NULL,'2017-04-11 02:49:23','2017-04-11 02:49:23',1),
	(3,'baidu@126.com','$2y$10$i8.ZkHrpYJrZPgmBoDFD8ONr6SMqGMq/H1jTwr3QOAaQ/7YlJ0bPi','北京百度科技有限公司',2,'ePLkB1OMXaMExKnMNCj9q9tUbM6oLT4XiO3sQg37vLzxgRjE5S2RdylpBiab','2017-04-11 03:14:11','2017-04-12 03:28:43',2);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
