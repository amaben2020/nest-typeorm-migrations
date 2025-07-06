-- MySQL dump 10.13  Distrib 8.4.5, for macos15 (arm64)
--
-- Host: xefi550t7t6tjn36.cbetxkdyhwsb.us-east-1.rds.amazonaws.com    Database: h78c90bd0sv0eh6n
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
 
 

--
-- GTID state at the beginning of the backup 
--

--
-- Table structure for table `accessibilities`
--

DROP TABLE IF EXISTS `accessibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessibilities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `access_daemon` varchar(1000) DEFAULT NULL,
  `ref_daemon` varchar(1000) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessibilities`
--

LOCK TABLES `accessibilities` WRITE;
/*!40000 ALTER TABLE `accessibilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adept_access`
--

DROP TABLE IF EXISTS `adept_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adept_access` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `access_token` varchar(1000) DEFAULT NULL,
  `ttl` datetime NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adept_access`
--

LOCK TABLES `adept_access` WRITE;
/*!40000 ALTER TABLE `adept_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `adept_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airtime_providers`
--

DROP TABLE IF EXISTS `airtime_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airtime_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airtime_providers`
--

LOCK TABLES `airtime_providers` WRITE;
/*!40000 ALTER TABLE `airtime_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `airtime_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airtime_transactions`
--

DROP TABLE IF EXISTS `airtime_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airtime_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(80) NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `amount` decimal(12,2) unsigned DEFAULT NULL,
  `payment_reference` varchar(40) DEFAULT NULL,
  `payment_mode` enum('wallet','card') DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
  `vend_request_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `vend_response_body` varchar(1500) DEFAULT NULL,
  `balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_airtime_txn` (`transaction_id`,`user_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_receiver` (`receiver`),
  CONSTRAINT `airtime_transactions_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airtime_transactions`
--

LOCK TABLES `airtime_transactions` WRITE;
/*!40000 ALTER TABLE `airtime_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `airtime_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sms_platform` enum('termii','sendchamp') NOT NULL,
  `verification_platform` enum('dojah','mono') NOT NULL DEFAULT 'dojah',
  `payment_platform` enum('flutterwave','paystack','irecharge') NOT NULL,
  `minimum_amount` decimal(8,0) DEFAULT NULL,
  `irchg_token_ttl` datetime DEFAULT NULL,
  `irchg_charge_rate` decimal(5,0) NOT NULL DEFAULT '50',
  `irchg_token_login` varchar(60) DEFAULT NULL,
  `minimum_amount_to_phone` decimal(8,2) NOT NULL DEFAULT '200.00',
  `withdrawal_charge_rate` decimal(8,0) NOT NULL DEFAULT '20',
  `createdAt` datetime NOT NULL DEFAULT (now()),
  `no_kyc_max_amount` decimal(8,2) NOT NULL DEFAULT '20000.00',
  `basic_transfer_amount` decimal(10,2) NOT NULL DEFAULT '20000.00',
  `intermediate_transfer_amount` decimal(10,0) NOT NULL DEFAULT '5000000',
  `min_amount_to_phone` decimal(10,2) NOT NULL DEFAULT '200.00',
  `min_amount_to_wallet` decimal(10,2) NOT NULL DEFAULT '100.00',
  `non_blue_charge_rate` decimal(10,2) NOT NULL DEFAULT '50.00',
  `blue_charge_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_withdrawal_amount` varchar(255) DEFAULT NULL,
  `adept_token` varchar(1000) DEFAULT NULL,
  `adept_token_ttl` datetime DEFAULT NULL,
  `power_platform` enum('irecharge','vtpass','buypower') NOT NULL,
  `airtime_platform` enum('irecharge','vtpass','buypower') NOT NULL,
  `data_platform` enum('irecharge','vtpass','buypower') NOT NULL,
  `tv_platform` enum('irecharge','vtpass','buypower') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_4800b266ba790931744b3e53a74` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `bank_code` varchar(20) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `logo_url` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiaries`
--

DROP TABLE IF EXISTS `beneficiaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `beneficiary_id` bigint unsigned DEFAULT NULL,
  `identifier` varchar(50) NOT NULL,
  `type` enum('phone','blue-user') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `business_beneficiary` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `business_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_id` (`beneficiary_id`),
  KEY `user_id` (`user_id`),
  KEY `idx_business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiaries`
--

LOCK TABLES `beneficiaries` WRITE;
/*!40000 ALTER TABLE `beneficiaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_mates_favourites`
--

DROP TABLE IF EXISTS `bill_mates_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_mates_favourites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `provider_id` bigint unsigned DEFAULT NULL,
  `provider_type` enum('power_providers','data_providers','tv_providers','airtime_providers') NOT NULL,
  `receiver` varchar(150) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `meter_category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `bill_mates_favourites_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_mates_favourites`
--

LOCK TABLES `bill_mates_favourites` WRITE;
/*!40000 ALTER TABLE `bill_mates_favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_mates_favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_mates_transactions`
--

DROP TABLE IF EXISTS `bill_mates_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_mates_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` enum('successful','pending','failed','in-progress','processing') NOT NULL,
  `type` enum('airtime','data','cable-tv','power') NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `package` varchar(255) DEFAULT NULL,
  `transaction_reference` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `receiver` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_transaction_reference` (`transaction_reference`),
  KEY `idx_type` (`type`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_mates_transactions`
--

LOCK TABLES `bill_mates_transactions` WRITE;
/*!40000 ALTER TABLE `bill_mates_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_mates_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blue_admin_roles`
--

DROP TABLE IF EXISTS `blue_admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blue_admin_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blue_admin_roles`
--

LOCK TABLES `blue_admin_roles` WRITE;
/*!40000 ALTER TABLE `blue_admin_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `blue_admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blue_admins`
--

DROP TABLE IF EXISTS `blue_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blue_admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `display_picture` varchar(255) DEFAULT NULL,
  `password_changed_at` varchar(30) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime NOT NULL DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blue_admins`
--

LOCK TABLES `blue_admins` WRITE;
/*!40000 ALTER TABLE `blue_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `blue_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_branches`
--

DROP TABLE IF EXISTS `business_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `staff_size` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_branches`
--

LOCK TABLES `business_branches` WRITE;
/*!40000 ALTER TABLE `business_branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_categories`
--

DROP TABLE IF EXISTS `business_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_categories` (
  `id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_d10a707dfd0ca189233999204e5` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_categories`
--

LOCK TABLES `business_categories` WRITE;
/*!40000 ALTER TABLE `business_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_data_transactions`
--

DROP TABLE IF EXISTS `business_data_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_data_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `staff_id` bigint unsigned DEFAULT NULL,
  `receiver` varchar(20) NOT NULL,
  `provider` varchar(15) NOT NULL,
  `package` varchar(100) NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `payment_reference` varchar(40) DEFAULT NULL,
  `customer_info` varchar(100) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `payment_mode` enum('wallet','card') DEFAULT NULL,
  `status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `provider_slug` varchar(30) DEFAULT NULL,
  `access_token` varchar(40) DEFAULT NULL,
  `vend_request_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `code` varchar(10) DEFAULT NULL,
  `vend_response_body` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_data_transactions`
--

LOCK TABLES `business_data_transactions` WRITE;
/*!40000 ALTER TABLE `business_data_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_data_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_devices`
--

DROP TABLE IF EXISTS `business_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_devices`
--

LOCK TABLES `business_devices` WRITE;
/*!40000 ALTER TABLE `business_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_fees`
--

DROP TABLE IF EXISTS `business_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned DEFAULT NULL,
  `withdrawal` decimal(10,2) NOT NULL,
  `bill_payment` decimal(10,2) NOT NULL,
  `transfers` decimal(10,2) NOT NULL,
  `blue_to_blue` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_fees`
--

LOCK TABLES `business_fees` WRITE;
/*!40000 ALTER TABLE `business_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_onboarding_forms`
--

DROP TABLE IF EXISTS `business_onboarding_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_onboarding_forms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) NOT NULL,
  `business_type` varchar(255) NOT NULL,
  `business_category` varchar(255) NOT NULL,
  `business_address` text NOT NULL,
  `state` varchar(100) NOT NULL,
  `branch_count` varchar(50) NOT NULL,
  `business_website` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_role` varchar(100) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `accepts_digital_payments` tinyint NOT NULL DEFAULT '0',
  `payment_tools` text NOT NULL,
  `monthly_transactions` varchar(100) NOT NULL,
  `employee_count` varchar(50) DEFAULT NULL,
  `setup_needs` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (now()),
  `updated_at` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_onboarding_forms`
--

LOCK TABLES `business_onboarding_forms` WRITE;
/*!40000 ALTER TABLE `business_onboarding_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_onboarding_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_payment_transactions`
--

DROP TABLE IF EXISTS `business_payment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_payment_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `staff_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `narration` varchar(255) DEFAULT NULL,
  `order_reference` varchar(50) DEFAULT NULL,
  `receiver_name` varchar(250) DEFAULT NULL,
  `sender_name` varchar(200) DEFAULT NULL,
  `receiver_wallet` varchar(20) DEFAULT NULL,
  `client_used` enum('desktop','mobile') DEFAULT 'mobile',
  `due_date` datetime DEFAULT NULL,
  `payment_mode` enum('blue-user','phone','offline','withdrawal','wallet_topup','card','bank_transfer') NOT NULL,
  `status` enum('in-progress','pending','successful','failed','reversed') NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(30) NOT NULL,
  `verification_request` varchar(1000) DEFAULT NULL,
  `verification_response` varchar(1000) DEFAULT NULL,
  `service_charge` decimal(10,2) DEFAULT '0.00',
  `email` varchar(300) DEFAULT NULL,
  `request_body` varchar(1000) DEFAULT NULL,
  `response_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `receiver_type` enum('personal','business','business-personal') DEFAULT NULL,
  `sent_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_payment_transactions`
--

LOCK TABLES `business_payment_transactions` WRITE;
/*!40000 ALTER TABLE `business_payment_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_payment_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_pins`
--

DROP TABLE IF EXISTS `business_pins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_pins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned NOT NULL,
  `passcode` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT (now(6)),
  `updated_at` datetime(6) NOT NULL DEFAULT (now(6)),
  `reset_pin_status` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_pins`
--

LOCK TABLES `business_pins` WRITE;
/*!40000 ALTER TABLE `business_pins` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_pins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_power_transactions`
--

DROP TABLE IF EXISTS `business_power_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_power_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `staff_id` bigint unsigned DEFAULT NULL,
  `meter_type` enum('prepaid','postpaid') NOT NULL,
  `receiver` varchar(15) NOT NULL,
  `provider` varchar(80) NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `units` varchar(20) DEFAULT NULL,
  `token` varchar(30) DEFAULT NULL,
  `payment_reference` varchar(40) DEFAULT NULL,
  `customer_info` varchar(100) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `meter_category` enum('MD','NON-MD') DEFAULT NULL,
  `payment_mode` enum('wallet','card') DEFAULT NULL,
  `status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
  `access_token` varchar(40) DEFAULT NULL,
  `vend_request_body` varchar(1000) DEFAULT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `slug` varchar(30) DEFAULT NULL,
  `minimum_amount` varchar(20) DEFAULT NULL,
  `service_charge` decimal(10,2) DEFAULT '100.00',
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `kct_1` varchar(100) DEFAULT NULL,
  `kct_2` varchar(100) DEFAULT NULL,
  `vend_response_body` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_power_transactions`
--

LOCK TABLES `business_power_transactions` WRITE;
/*!40000 ALTER TABLE `business_power_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_power_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_profiles`
--

DROP TABLE IF EXISTS `business_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `staff_size_min` int DEFAULT NULL,
  `staff_size_max` int DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `lga` varchar(80) DEFAULT NULL,
  `level` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT (now()),
  `updated_at` datetime NOT NULL DEFAULT (now()),
  `cac_number` varchar(50) DEFAULT NULL,
  `staff_size` varchar(100) DEFAULT NULL,
  `b_user_id` bigint unsigned DEFAULT NULL,
  `bvn` varchar(20) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_29525485b1db8e87caf6a5ef042` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_profiles`
--

LOCK TABLES `business_profiles` WRITE;
/*!40000 ALTER TABLE `business_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_recovery_infos`
--

DROP TABLE IF EXISTS `business_recovery_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_recovery_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `recovery_code` varchar(40) DEFAULT NULL,
  `recovery_phone` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT (now()),
  `business_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_recovery_infos`
--

LOCK TABLES `business_recovery_infos` WRITE;
/*!40000 ALTER TABLE `business_recovery_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_recovery_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_security_questions`
--

DROP TABLE IF EXISTS `business_security_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_security_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT (now()),
  `question` varchar(200) NOT NULL,
  `answer` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_security_questions`
--

LOCK TABLES `business_security_questions` WRITE;
/*!40000 ALTER TABLE `business_security_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_security_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settlement_accounts`
--

DROP TABLE IF EXISTS `business_settlement_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_settlement_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `business_id` bigint unsigned DEFAULT NULL,
  `bank_id` bigint DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `bank_name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_business_id` (`business_id`),
  UNIQUE KEY `IDX_4aca6fb35fd3ce0f57cc6cdf89` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settlement_accounts`
--

LOCK TABLES `business_settlement_accounts` WRITE;
/*!40000 ALTER TABLE `business_settlement_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_settlement_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_shareholders`
--

DROP TABLE IF EXISTS `business_shareholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_shareholders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `bvn` varchar(25) DEFAULT NULL,
  `verified` tinyint unsigned DEFAULT '0',
  `designation` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_shareholders`
--

LOCK TABLES `business_shareholders` WRITE;
/*!40000 ALTER TABLE `business_shareholders` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_shareholders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_transaction_histories`
--

DROP TABLE IF EXISTS `business_transaction_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_transaction_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `staff_id` bigint unsigned DEFAULT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `receiver_name` varchar(100) DEFAULT NULL,
  `sender_name` varchar(100) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `status` enum('successful','pending','failed','in-progress') NOT NULL,
  `payment_mode` enum('blue-user','phone','offline','withdrawal','card','bank_transfer','airtime','data','power','cable-tv') NOT NULL,
  `type` enum('credit','debit') NOT NULL,
  `client_used` enum('desktop','mobile') NOT NULL DEFAULT 'mobile',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT (now()),
  `balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_business_id` (`business_id`),
  KEY `idx_transaction_reference` (`transaction_id`),
  KEY `idx_payment_mode` (`payment_mode`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  KEY `fk_txnhistory_branch_id` (`branch_id`),
  KEY `fk_txnhistory_staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_transaction_histories`
--

LOCK TABLES `business_transaction_histories` WRITE;
/*!40000 ALTER TABLE `business_transaction_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_transaction_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_tv_transactions`
--

DROP TABLE IF EXISTS `business_tv_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_tv_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `staff_id` bigint unsigned DEFAULT NULL,
  `receiver` varchar(25) NOT NULL,
  `provider` varchar(80) NOT NULL,
  `package` varchar(80) NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `payment_reference` varchar(40) DEFAULT NULL,
  `customer_info` varchar(100) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `payment_mode` enum('wallet','card') DEFAULT NULL,
  `status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
  `access_token` varchar(40) DEFAULT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `service_charge` decimal(10,2) DEFAULT '100.00',
  `vend_request_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `vend_response_body` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_tv_transactions`
--

LOCK TABLES `business_tv_transactions` WRITE;
/*!40000 ALTER TABLE `business_tv_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_tv_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_users`
--

DROP TABLE IF EXISTS `business_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `display_picture` varchar(1000) DEFAULT NULL,
  `is_deleted` tinyint unsigned DEFAULT '0',
  `flagged` tinyint NOT NULL DEFAULT '0',
  `verified` tinyint unsigned DEFAULT '0',
  `level` int DEFAULT '1',
  `notification_status` tinyint unsigned DEFAULT '0',
  `reset_credential_status` tinyint unsigned DEFAULT '0',
  `password` varchar(255) DEFAULT NULL,
  `password_changed_at` varchar(255) DEFAULT NULL,
  `kyc` enum('basic','intermediate','pro') NOT NULL DEFAULT 'basic',
  `business_profile_completed` tinyint unsigned DEFAULT '0',
  `business_details_completed` tinyint unsigned DEFAULT '0',
  `business_kyc_completed` tinyint unsigned DEFAULT '0',
  `proof_of_address_verified` tinyint unsigned DEFAULT '0',
  `auto_withdrawal_enabled` tinyint unsigned DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `idx_phone_191uuwqwmc12` (`phone`),
  UNIQUE KEY `IDX_b6efb89dc9d9a33223c221e98e` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_users`
--

LOCK TABLES `business_users` WRITE;
/*!40000 ALTER TABLE `business_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_wallet_accounts`
--

DROP TABLE IF EXISTS `business_wallet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_wallet_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned NOT NULL,
  `wallet_id` bigint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `account_number` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `reference_number` varchar(100) NOT NULL,
  `request_body` varchar(1000) DEFAULT NULL,
  `response_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`),
  KEY `wallet_id` (`wallet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_wallet_accounts`
--

LOCK TABLES `business_wallet_accounts` WRITE;
/*!40000 ALTER TABLE `business_wallet_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_wallet_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_wallet_snapshots`
--

DROP TABLE IF EXISTS `business_wallet_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_wallet_snapshots` (
  `business_id` bigint unsigned DEFAULT NULL,
  `type` enum('credit','debit') NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT (now(6)),
  `updated_at` datetime(6) NOT NULL DEFAULT (now(6)),
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(20) NOT NULL,
  `wallet_id` int NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `balance_before` decimal(12,2) DEFAULT NULL,
  `balance_after` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_bus_snapshot` (`transaction_id`,`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_wallet_snapshots`
--

LOCK TABLES `business_wallet_snapshots` WRITE;
/*!40000 ALTER TABLE `business_wallet_snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_wallet_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_wallets`
--

DROP TABLE IF EXISTS `business_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `wallet_id` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT (now(6)),
  `updated_at` datetime(6) NOT NULL DEFAULT (now(6)),
  `wallet_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ff06839ff828223b3e3d33c2` (`wallet_id`),
  UNIQUE KEY `IDX_199d242ff5da3a2c4e69bd8bd4` (`wallet_id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_wallets`
--

LOCK TABLES `business_wallets` WRITE;
/*!40000 ALTER TABLE `business_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashme_idempotency_records`
--

DROP TABLE IF EXISTS `dashme_idempotency_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashme_idempotency_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `operation_type` varchar(50) NOT NULL,
  `response_data` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`,`user_id`,`operation_type`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashme_idempotency_records`
--

LOCK TABLES `dashme_idempotency_records` WRITE;
/*!40000 ALTER TABLE `dashme_idempotency_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashme_idempotency_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashme_transactions`
--

DROP TABLE IF EXISTS `dashme_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashme_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `order_reference` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `receiver_id` bigint unsigned DEFAULT NULL,
  `receiver_name` varchar(250) DEFAULT NULL,
  `receiver_wallet` varchar(20) DEFAULT NULL,
  `sender_wallet` varchar(300) DEFAULT NULL,
  `sender_name` varchar(250) DEFAULT NULL,
  `payment_mode` enum('blue-user','phone') NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `status` enum('pending','sent','successful','failed','reversed') NOT NULL DEFAULT 'pending',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `narration` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `due_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_transaction_id` (`transaction_id`),
  UNIQUE KEY `unique_transaction` (`transaction_id`,`user_id`),
  UNIQUE KEY `IDX_95ba1f0f7266d2c6f945adb0c1` (`transaction_id`),
  KEY `user_id` (`user_id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_payment_mode` (`payment_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashme_transactions`
--

LOCK TABLES `dashme_transactions` WRITE;
/*!40000 ALTER TABLE `dashme_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashme_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashme_transactions_attempt_logs`
--

DROP TABLE IF EXISTS `dashme_transactions_attempt_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashme_transactions_attempt_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `action` enum('accept','decline','initiate','confirm') NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`action`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashme_transactions_attempt_logs`
--

LOCK TABLES `dashme_transactions_attempt_logs` WRITE;
/*!40000 ALTER TABLE `dashme_transactions_attempt_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashme_transactions_attempt_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_packages`
--

DROP TABLE IF EXISTS `data_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `validity` varchar(100) DEFAULT NULL,
  `provider` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT (now()),
  `provider_slug` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_packages`
--

LOCK TABLES `data_packages` WRITE;
/*!40000 ALTER TABLE `data_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_providers`
--

DROP TABLE IF EXISTS `data_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_providers`
--

LOCK TABLES `data_providers` WRITE;
/*!40000 ALTER TABLE `data_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_transactions`
--

DROP TABLE IF EXISTS `data_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `provider` varchar(80) NOT NULL,
  `package` varchar(300) NOT NULL,
  `amount` decimal(12,2) unsigned DEFAULT NULL,
  `payment_reference` varchar(40) DEFAULT NULL,
  `customer_info` varchar(100) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `payment_mode` enum('wallet','card') DEFAULT NULL,
  `status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `provider_slug` varchar(30) DEFAULT NULL,
  `access_token` varchar(40) DEFAULT NULL,
  `vend_request_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `code` varchar(10) DEFAULT NULL,
  `vend_response_body` varchar(1500) DEFAULT NULL,
  `balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_airtime_txn` (`transaction_id`,`user_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_transactions`
--

LOCK TABLES `data_transactions` WRITE;
/*!40000 ALTER TABLE `data_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_accounts`
--

DROP TABLE IF EXISTS `deleted_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deleted_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `reason_id` (`reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_accounts`
--

LOCK TABLES `deleted_accounts` WRITE;
/*!40000 ALTER TABLE `deleted_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_types`
--

DROP TABLE IF EXISTS `document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_types`
--

LOCK TABLES `document_types` WRITE;
/*!40000 ALTER TABLE `document_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flagged_users`
--

DROP TABLE IF EXISTS `flagged_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flagged_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('personal','business') NOT NULL,
  `reason` text NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flagged_users`
--

LOCK TABLES `flagged_users` WRITE;
/*!40000 ALTER TABLE `flagged_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `flagged_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irchg_banks`
--

DROP TABLE IF EXISTS `irchg_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irchg_banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `bank_code` varchar(20) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `logo_url` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irchg_banks`
--

LOCK TABLES `irchg_banks` WRITE;
/*!40000 ALTER TABLE `irchg_banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `irchg_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irecharge_data_packages`
--

DROP TABLE IF EXISTS `irecharge_data_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irecharge_data_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `validity` varchar(100) DEFAULT NULL,
  `price` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irecharge_data_packages`
--

LOCK TABLES `irecharge_data_packages` WRITE;
/*!40000 ALTER TABLE `irecharge_data_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `irecharge_data_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irecharge_power_providers`
--

DROP TABLE IF EXISTS `irecharge_power_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irecharge_power_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `slug` varchar(15) NOT NULL,
  `code` varchar(100) NOT NULL,
  `minimum_value` decimal(12,2) unsigned DEFAULT '0.00',
  `maximum_value` decimal(12,2) unsigned DEFAULT '0.00',
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irecharge_power_providers`
--

LOCK TABLES `irecharge_power_providers` WRITE;
/*!40000 ALTER TABLE `irecharge_power_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `irecharge_power_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irecharge_tv_packages`
--

DROP TABLE IF EXISTS `irecharge_tv_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irecharge_tv_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `network` varchar(15) NOT NULL,
  `price` decimal(12,2) unsigned DEFAULT '0.00',
  `code` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irecharge_tv_packages`
--

LOCK TABLES `irecharge_tv_packages` WRITE;
/*!40000 ALTER TABLE `irecharge_tv_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `irecharge_tv_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kycs`
--

DROP TABLE IF EXISTS `kycs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kycs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `document_type_id` bigint unsigned DEFAULT NULL,
  `bvn` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `front_cover` varchar(300) DEFAULT NULL,
  `back_cover` varchar(300) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `documents` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  UNIQUE KEY `IDX_bbfe1fa864841e82cff1be09e8` (`user_id`),
  KEY `document_type_id` (`document_type_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kycs`
--

LOCK TABLES `kycs` WRITE;
/*!40000 ALTER TABLE `kycs` DISABLE KEYS */;
/*!40000 ALTER TABLE `kycs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,1751813030369,'NewMigration1751813030369'),(2,1751813102382,'NewMigration1751813102382'),(3,1751815531284,'NewMigration1751815531284'),(4,1751816247626,'NewMigration1751816247626'),(5,1751817258179,'NewMigration1751817258179'),(6,1751824106267,'NewMigration11751824106267');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` tinyint unsigned DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  UNIQUE KEY `IDX_9a8a82462cab47c73d25f49261` (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otps`
--

DROP TABLE IF EXISTS `otps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `business_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otps`
--

LOCK TABLES `otps` WRITE;
/*!40000 ALTER TABLE `otps` DISABLE KEYS */;
/*!40000 ALTER TABLE `otps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_links`
--

DROP TABLE IF EXISTS `payment_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `transaction_id` varchar(20) NOT NULL,
  `url_code` varchar(20) NOT NULL,
  `original_url` varchar(255) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `sender_name` varchar(300) DEFAULT NULL,
  `verified_account` tinyint DEFAULT '0',
  `clicked` tinyint unsigned DEFAULT '0',
  `status` enum('failed','sent','processing','fulfilled','cancelled','withdrawn','reversed') DEFAULT 'sent',
  `platform_used` varchar(20) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `batch` varchar(120) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `api_response` text,
  `account_number` varchar(15) DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  `reference` varchar(20) DEFAULT NULL,
  `recipient_code` varchar(20) DEFAULT NULL,
  `business_id` bigint unsigned DEFAULT NULL,
  `narration` varchar(255) DEFAULT NULL,
  `type` enum('personal','business') NOT NULL DEFAULT 'personal',
  `request_body` text,
  `response_body` text,
  `idempotency_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_links`
--

LOCK TABLES `payment_links` WRITE;
/*!40000 ALTER TABLE `payment_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(20) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `response_body` varchar(1000) NOT NULL,
  `created_at` datetime NOT NULL,
  `account_number` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paystack_banks`
--

DROP TABLE IF EXISTS `paystack_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paystack_banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `bank_code` varchar(20) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `logo_url` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paystack_banks`
--

LOCK TABLES `paystack_banks` WRITE;
/*!40000 ALTER TABLE `paystack_banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `paystack_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot_testers`
--

DROP TABLE IF EXISTS `pilot_testers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot_testers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `platform` text NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `IDX_e6343c7edaad580e600ba5ec75` (`email`),
  UNIQUE KEY `IDX_c74be53456bd51c31ce9f06276` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot_testers`
--

LOCK TABLES `pilot_testers` WRITE;
/*!40000 ALTER TABLE `pilot_testers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilot_testers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pins`
--

DROP TABLE IF EXISTS `pins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `passcode` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  UNIQUE KEY `IDX_b64043825b647234e0ae931644` (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pins`
--

LOCK TABLES `pins` WRITE;
/*!40000 ALTER TABLE `pins` DISABLE KEYS */;
/*!40000 ALTER TABLE `pins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_providers`
--

DROP TABLE IF EXISTS `power_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `slug` varchar(10) NOT NULL,
  `locations` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_providers`
--

LOCK TABLES `power_providers` WRITE;
/*!40000 ALTER TABLE `power_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `power_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_transactions`
--

DROP TABLE IF EXISTS `power_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `meter_type` enum('prepaid','postpaid') NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `provider` varchar(80) NOT NULL,
  `amount` decimal(12,2) unsigned DEFAULT NULL,
  `units` varchar(20) DEFAULT NULL,
  `token` varchar(30) DEFAULT NULL,
  `payment_reference` varchar(40) DEFAULT NULL,
  `customer_info` varchar(100) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `meter_category` enum('MD','NON-MD') DEFAULT NULL,
  `payment_mode` enum('wallet','card') DEFAULT NULL,
  `status` enum('pending','successful','failed','processing') NOT NULL DEFAULT 'pending',
  `access_token` varchar(40) DEFAULT NULL,
  `vend_request_body` varchar(1000) DEFAULT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `slug` varchar(30) DEFAULT NULL,
  `minimum_amount` varchar(20) DEFAULT NULL,
  `service_charge` decimal(10,2) DEFAULT '100.00',
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `kct_1` varchar(100) DEFAULT NULL,
  `kct_2` varchar(100) DEFAULT NULL,
  `vend_response_body` varchar(1500) DEFAULT NULL,
  `balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_airtime_txn` (`transaction_id`,`user_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_meter_type` (`meter_type`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_transactions`
--

LOCK TABLES `power_transactions` WRITE;
/*!40000 ALTER TABLE `power_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `power_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reasons`
--

DROP TABLE IF EXISTS `reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reasons`
--

LOCK TABLES `reasons` WRITE;
/*!40000 ALTER TABLE `reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recovery_infos`
--

DROP TABLE IF EXISTS `recovery_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recovery_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `recovery_code` varchar(255) DEFAULT NULL,
  `recovery_phone` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  UNIQUE KEY `IDX_a51f6f210c69af4e31800be5b1` (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recovery_infos`
--

LOCK TABLES `recovery_infos` WRITE;
/*!40000 ALTER TABLE `recovery_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recovery_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_preferences`
--

DROP TABLE IF EXISTS `report_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business_id` bigint unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `schedule_time` varchar(10) NOT NULL DEFAULT '23:00',
  `created_at` timestamp NOT NULL DEFAULT (now()),
  `updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_8bd9422c2c9e0ca8ab0df102c5e` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_preferences`
--

LOCK TABLES `report_preferences` WRITE;
/*!40000 ALTER TABLE `report_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_questions`
--

DROP TABLE IF EXISTS `security_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `question` varchar(200) NOT NULL,
  `answer` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  UNIQUE KEY `IDX_f2c2fb415138d89ce45146e5fe` (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_questions`
--

LOCK TABLES `security_questions` WRITE;
/*!40000 ALTER TABLE `security_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_logs`
--

DROP TABLE IF EXISTS `sms_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `request_body` varchar(1000) DEFAULT NULL,
  `response_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_logs`
--

LOCK TABLES `sms_logs` WRITE;
/*!40000 ALTER TABLE `sms_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_profiles`
--

DROP TABLE IF EXISTS `staff_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL,
  `password_changed_at` varchar(50) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT (now()),
  `updated_at` datetime NOT NULL DEFAULT (now()),
  `owner_id` bigint DEFAULT NULL,
  `role` enum('admin','cashier') NOT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `display_picture` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `business_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_6d4c6c0b447e39147b4a6dcbede` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_profiles`
--

LOCK TABLES `staff_profiles` WRITE;
/*!40000 ALTER TABLE `staff_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_roles`
--

DROP TABLE IF EXISTS `staff_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_roles`
--

LOCK TABLES `staff_roles` WRITE;
/*!40000 ALTER TABLE `staff_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_accounts`
--

DROP TABLE IF EXISTS `temp_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(50) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `bank_id` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  `bank_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_accounts`
--

LOCK TABLES `temp_accounts` WRITE;
/*!40000 ALTER TABLE `temp_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_recovery_phones`
--

DROP TABLE IF EXISTS `temp_recovery_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_recovery_phones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) NOT NULL,
  `old_phone` varchar(15) NOT NULL,
  `new_phone` varchar(15) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_recovery_phones`
--

LOCK TABLES `temp_recovery_phones` WRITE;
/*!40000 ALTER TABLE `temp_recovery_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_recovery_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_histories`
--

DROP TABLE IF EXISTS `transaction_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `receiver_name` varchar(250) DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` enum('successful','pending','failed','in-progress','refunded') NOT NULL,
  `payment_mode` enum('blue-user','phone','wallet_topup','offline','withdrawal','card','bank-transfer','airtime','data','power','cable-tv') NOT NULL,
  `type` enum('credit','debit') NOT NULL,
  `sender_name` varchar(100) DEFAULT NULL,
  `client_used` enum('desktop','mobile') NOT NULL DEFAULT 'mobile',
  `transaction_reference` varchar(20) DEFAULT NULL,
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  `balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
  `app` varchar(100) DEFAULT NULL,
  `narration` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `idx_payment_mode` (`payment_mode`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_transaction_reference` (`transaction_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_histories`
--

LOCK TABLES `transaction_histories` WRITE;
/*!40000 ALTER TABLE `transaction_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `order_reference` varchar(50) DEFAULT NULL,
  `receiver_name` varchar(250) DEFAULT NULL,
  `receiver_wallet` varchar(20) DEFAULT NULL,
  `sender_name` varchar(300) DEFAULT NULL,
  `payment_mode` enum('blue-user','phone','offline','withdrawal','wallet_topup','card','bank_transfer') NOT NULL,
  `client_used` enum('desktop','mobile') DEFAULT 'mobile',
  `due_date` datetime DEFAULT NULL,
  `status` enum('in-progress','pending','successful','failed','reversed') NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(20) DEFAULT NULL,
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `employee_id` bigint DEFAULT NULL,
  `narration` varchar(255) DEFAULT NULL,
  `request_body` varchar(1000) DEFAULT NULL,
  `response_body` varchar(10000) DEFAULT NULL,
  `verification_request` varchar(1000) DEFAULT NULL,
  `verification_response` varchar(1000) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `receiver_type` enum('personal','business','business-personal') DEFAULT NULL,
  `sent_by` varchar(20) DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_transaction_id` (`transaction_id`),
  UNIQUE KEY `unique_transaction` (`transaction_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_payment_mode` (`payment_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_packages`
--

DROP TABLE IF EXISTS `tv_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tv_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_packages`
--

LOCK TABLES `tv_packages` WRITE;
/*!40000 ALTER TABLE `tv_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_providers`
--

DROP TABLE IF EXISTS `tv_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tv_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `slug` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_providers`
--

LOCK TABLES `tv_providers` WRITE;
/*!40000 ALTER TABLE `tv_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_transactions`
--

DROP TABLE IF EXISTS `tv_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tv_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `provider` varchar(80) NOT NULL,
  `package` varchar(80) NOT NULL,
  `amount` decimal(12,2) unsigned DEFAULT NULL,
  `payment_reference` varchar(40) DEFAULT NULL,
  `customer_info` varchar(100) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `payment_mode` enum('wallet','card') DEFAULT NULL,
  `status` enum('pending','successful','failed') NOT NULL DEFAULT 'pending',
  `access_token` varchar(40) DEFAULT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `service_charge` decimal(10,2) DEFAULT '100.00',
  `vend_request_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `vend_response_body` varchar(1500) DEFAULT NULL,
  `balance_before` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_after` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_airtime_txn` (`transaction_id`,`user_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_transactions`
--

LOCK TABLES `tv_transactions` WRITE;
/*!40000 ALTER TABLE `tv_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `bank_id` bigint unsigned NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `bank_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  KEY `bank_id` (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_card_details`
--

DROP TABLE IF EXISTS `user_card_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_card_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `authorization_code` varchar(80) NOT NULL,
  `bin` varchar(20) NOT NULL,
  `last4` varchar(20) NOT NULL,
  `exp_month` varchar(20) NOT NULL,
  `exp_year` varchar(20) NOT NULL,
  `card_type` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_card_details`
--

LOCK TABLES `user_card_details` WRITE;
/*!40000 ALTER TABLE `user_card_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_card_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `role` enum('owner','employee') DEFAULT 'owner',
  `type` enum('personal','business','business_personal') DEFAULT 'personal',
  `display_pic` varchar(1000) DEFAULT NULL,
  `level` int DEFAULT '1',
  `password` varchar(255) DEFAULT NULL,
  `passwordChangedAt` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint unsigned DEFAULT '0',
  `flagged` tinyint NOT NULL DEFAULT '0',
  `verified` tinyint unsigned DEFAULT '0',
  `reset_credential_status` tinyint unsigned DEFAULT '0',
  `notification_status` tinyint NOT NULL DEFAULT '1',
  `kyc_status` tinyint unsigned DEFAULT '0',
  `kyc` enum('basic','intermediate','pro') NOT NULL DEFAULT 'basic',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersTest`
--

DROP TABLE IF EXISTS `usersTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersTest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `best_pal` varchar(255) DEFAULT NULL,
  `is_online` varchar(255) DEFAULT NULL,
  `is_best_friend` tinyint DEFAULT '0',
  `is_brand_news` int DEFAULT NULL,
  `is_Nice` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersTest`
--

LOCK TABLES `usersTest` WRITE;
/*!40000 ALTER TABLE `usersTest` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersTest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ussd_withdrawals`
--

DROP TABLE IF EXISTS `ussd_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ussd_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_code` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `session_id` varchar(150) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `account_info` varchar(200) DEFAULT NULL,
  `transaction_id` varchar(40) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `status` enum('in-progress','pending','successful','failed') NOT NULL DEFAULT 'pending',
  `verification_request_body` varchar(500) DEFAULT NULL,
  `verification_response_body` varchar(1000) DEFAULT NULL,
  `transfer_request_body` varchar(500) DEFAULT NULL,
  `transfer_response_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ussd_withdrawals`
--

LOCK TABLES `ussd_withdrawals` WRITE;
/*!40000 ALTER TABLE `ussd_withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ussd_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_accounts`
--

DROP TABLE IF EXISTS `wallet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `wallet_id` bigint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `account_number` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `reference_number` varchar(100) NOT NULL,
  `request_body` varchar(1000) DEFAULT NULL,
  `response_body` varchar(1000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `bank_logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  KEY `wallet_id` (`wallet_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_accounts`
--

LOCK TABLES `wallet_accounts` WRITE;
/*!40000 ALTER TABLE `wallet_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_snapshots`
--

DROP TABLE IF EXISTS `wallet_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_snapshots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `wallet_id` bigint unsigned NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `balance_before` decimal(15,2) NOT NULL,
  `balance_after` decimal(15,2) NOT NULL,
  `type` enum('credit','debit') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `transaction_reference` varchar(20) DEFAULT NULL,
  `is_new` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_transaction_type` (`user_id`,`transaction_reference`,`type`),
  KEY `wallet_id` (`wallet_id`),
  KEY `idx_transaction_reference` (`transaction_reference`),
  KEY `ws_idx_user_id` (`user_id`),
  KEY `ws_idx_created_at` (`created_at`),
  KEY `ws_idx_type` (`type`),
  CONSTRAINT `balance_before_non_negative` CHECK ((`balance_before` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_snapshots`
--

LOCK TABLES `wallet_snapshots` WRITE;
/*!40000 ALTER TABLE `wallet_snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `balance` decimal(15,2) unsigned DEFAULT '0.00',
  `wallet_id` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT (now()),
  `wallet_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallet_code` (`wallet_id`),
  UNIQUE KEY `idx_wallet_code` (`wallet_id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `balance_non_negative` CHECK ((`balance` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_credentials`
--

DROP TABLE IF EXISTS `withdraw_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_credentials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL,
  `token_ttl` datetime NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `secret_pwd` varchar(50) DEFAULT NULL,
  `secret_pin` varchar(50) DEFAULT NULL,
  `charge_rate` decimal(5,0) DEFAULT NULL,
  `created_at` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_credentials`
--

LOCK TABLES `withdraw_credentials` WRITE;
/*!40000 ALTER TABLE `withdraw_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_idempotency_records`
--

DROP TABLE IF EXISTS `withdraw_idempotency_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_idempotency_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `operation_type` varchar(50) NOT NULL,
  `response_data` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`,`user_id`,`operation_type`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_idempotency_records`
--

LOCK TABLES `withdraw_idempotency_records` WRITE;
/*!40000 ALTER TABLE `withdraw_idempotency_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_idempotency_records` ENABLE KEYS */;
UNLOCK TABLES;
 
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 21:25:23
