CREATE DATABASE  IF NOT EXISTS `medsale` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `medsale`;
-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: mysql-medsale-6080.nodechef.com    Database: medsale
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `privileges` json NOT NULL,
  `rank` varchar(11) NOT NULL,
  `infoGathered` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `attributes_ibfk_1` (`userid`),
  CONSTRAINT `attributes_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (45,23,'[\"read\", \"purchase\", \"comment\"]','admin',1),(47,25,'[\"read\", \"purchase\", \"comment\"]','vendor',1),(48,26,'[\"read\", \"purchase\", \"comment\"]','user',1),(50,28,'[\"read\", \"purchase\", \"comment\"]','admin',1),(55,33,'[\"read\", \"purchase\", \"comment\"]','user',1),(56,34,'[\"read\", \"purchase\", \"comment\"]','admin',1),(69,48,'[\"read\", \"purchase\", \"comment\"]','user',1),(70,49,'[\"read\", \"purchase\", \"comment\"]','user',1);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `idcategories` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategories`),
  UNIQUE KEY `idcategories_UNIQUE` (`idcategories`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=1356 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1344,'Abortion'),(1298,'AcidReflux'),(1000,'ADD'),(912,'Addiction'),(999,'ADHD'),(1118,'Aging'),(1328,'Agriculture'),(1312,'Aid'),(911,'Alcohol'),(1241,'Allergy'),(1125,'ALS'),(991,'AlternativeMedicine'),(914,'Alzheimers'),(979,'Anesthetics'),(963,'Anxiety'),(1139,'Arrhythmia'),(1043,'Asbestos'),(1278,'AtopicDermatitis'),(1003,'Autism'),(1245,'AvianFlu'),(936,'BackPain'),(946,'Bacteria'),(977,'Biochemistry'),(976,'Biology'),(998,'Bipolar'),(1244,'BirdFlu'),(1223,'BitesandStings'),(1107,'Blindness'),(934,'Blood'),(969,'Bones'),(1196,'BreastCancer'),(908,'Cancer'),(1198,'Cardiology'),(1197,'Cardiovascular'),(1032,'ChildrensHealth'),(953,'Cold'),(990,'ComplementaryMedicine'),(1311,'COPD'),(1341,'Crohns'),(915,'Dementia'),(957,'Dentistry'),(1310,'Depression'),(1101,'Dermatology'),(958,'Diabetes'),(1203,'DiabetesType2'),(907,'Diagnostics'),(962,'Diet'),(1313,'Disasters'),(1088,'DrugResistance'),(1208,'DryEye'),(1222,'E-mail'),(1094,'Ear,NoseandThroat'),(1240,'EatingDisorders'),(1335,'Ebola'),(1279,'Eczema'),(927,'Endocrinology'),(1164,'Endometriosis'),(1276,'Epilepsy'),(1131,'ErectileDysfunction'),(1106,'EyeHealth'),(973,'Fertility'),(1233,'Fibromyalgia'),(983,'Fitness'),(952,'Flu'),(1126,'FoodAllergy'),(956,'Gastroenterology'),(955,'GastroIntestinal'),(1168,'GeneralPractice'),(1133,'Genetics'),(1299,'GERD'),(968,'Gynecology'),(1162,'Headache'),(1119,'HeadandNeckCancer'),(1170,'HeartDisease'),(935,'Hematology'),(917,'Hepatitis'),(1326,'HIVandAIDS'),(1174,'HospiceCare'),(1169,'Hypertension'),(1342,'IBD'),(913,'IllegalDrugs'),(971,'ImmuneSystem'),(945,'InfectiousDiseases'),(1161,'Insomnia'),(1221,'Internet'),(1220,'IT'),(1280,'Leukemia'),(916,'LiverDisease'),(1078,'LungCancer'),(1102,'Lupus'),(906,'MedicalDevices'),(924,'MedicalInnovation'),(1185,'MedicalPracticeManagement'),(1165,'MedicalStudents'),(1343,'Menopause'),(1277,'MensHealth'),(1022,'MentalHealth'),(1044,'Mesothelioma'),(1163,'Migraine'),(1087,'MRSA'),(929,'MultipleSclerosis'),(1124,'MuscularDystrophy'),(1096,'Nephrology'),(920,'Neurology'),(921,'Neuroscience'),(1325,'NuclearMedicine'),(961,'Nutrition'),(1120,'Obesity'),(981,'Obstetrics'),(909,'Oncology'),(970,'Orthopedics'),(1195,'Osteoarthritis'),(1242,'Osteoporosis'),(978,'Pain'),(1173,'PalliativeCare'),(1093,'PancreaticCancer'),(1031,'Pediatrics'),(1005,'Pharmacist'),(1004,'Pharmacy'),(980,'Pregnancy'),(1132,'PrematureEjaculation'),(1167,'PrimaryCare'),(984,'Prostate'),(985,'ProstateCancer'),(1097,'Psoriasis'),(992,'PsoriaticArthritis'),(1136,'Psychiatry'),(1135,'Psychology'),(1067,'PublicHealth'),(960,'QuitSmoking'),(1324,'Radiology'),(928,'Respiratory'),(995,'RheumatoidArthritis'),(948,'Rheumatology'),(954,'SARS'),(1100,'Schizophrenia'),(1117,'Seniors'),(1090,'SexualHealth'),(1159,'Sleep'),(1160,'SleepDisorders'),(959,'Smoking'),(982,'SportsMedicine'),(1091,'STDs'),(1192,'StemCellResearch'),(964,'Stress'),(1089,'Stroke'),(1092,'Surgery'),(1166,'Training'),(910,'Tuberculosis'),(1134,'UrinaryTractInfection'),(1095,'Urology'),(972,'Vaccines'),(947,'Viruses'),(1327,'Water-AirQuality'),(1121,'WeightLoss'),(967,'WomensHealth');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `vendor` char(10) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_ibfk_1` (`customerNumber`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (15,25,'Patrick','santora','Patrick','Patrick.santora27@gmail.com','8608572129','175 Midway Oval','-','Groton','CT','06340','',NULL),(16,26,'Patrick','santora','Patrick','Patrick.santora27@gmail.com','8608572129','175 Midway Oval','-','Groton','CT','06340',NULL,NULL),(17,28,'brian','burnett','brian','bcburnett@gmail.com','8605019828','16 Benham Road','apt 2 first floor','groton','CT','06340',NULL,NULL),(28,33,'brian','burnett','brian','bcburnett@gmail.com','8605019828','16 Benham Road','apt 2 first floor','groton','CT','06340',NULL,NULL),(29,34,'Butthead','mcfartface','Butthead','nickart2k@gmail.com','8603034957','40  oak st','','norwich','CT','06360',NULL,NULL),(58,48,'brian burnett','burnett','brian','bcburnett@gmail.com','8605019828','16 Benham Road','apt 2 first floor','groton','CT','06340','','United States'),(59,23,'brian burnett','burnett','brian','bcburnett@gmail.com','860-501-9828','16 Benham Road','apt 2 first floor','groton','CT','06340',NULL,'United States'),(61,49,'brian burnett','burnett','brian','bcburnett@gmail.com','8605019828','16 Benham Road, apt 2 first floor','apt 2 first floor','groton','CT','06340',NULL,'United States');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` char(50) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(15) NOT NULL,
  `Product` varchar(50) DEFAULT NULL,
  `payment` json DEFAULT NULL,
  `keytext` varchar(255) NOT NULL,
  `customerNumber` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerNumber` (`customerNumber`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'0fd881d0-2d58-11e9-b999-e9473dcbba4a','2019-02-10 17:19:45','complete','med-tech software key','{\"id\": \"PAYID-LRQF2GQ01Y32076M4588335L\", \"cart\": \"61E32672UM6033057\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRQF2GQ01Y32076M4588335L\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-10T17:19:45Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"9\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key\", \"related_resources\": [{\"sale\": {\"id\": \"9X707379Y5315152D\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/9X707379Y5315152D\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/9X707379Y5315152D/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRQF2GQ01Y32076M4588335L\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-10T17:19:45Z\", \"update_time\": \"2019-02-10T17:19:45Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRQF2GQ01Y32076M4588335L\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}','81dc-2c27d72d0f1e',28),(2,'e5353f20-2dea-11e9-8ecd-d36d0fa75a4e','2019-02-11 10:50:50','complete','med-tech software key','{\"id\": \"PAYID-LRQVG2I9WF50240VY385360P\", \"cart\": \"8BN44210W6894080K\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRQVG2I9WF50240VY385360P\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-11T10:50:50Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"10\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key\", \"related_resources\": [{\"sale\": {\"id\": \"0BY84454L86611437\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/0BY84454L86611437\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/0BY84454L86611437/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRQVG2I9WF50240VY385360P\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-11T10:50:49Z\", \"update_time\": \"2019-02-11T10:50:49Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRQVG2I9WF50240VY385360P\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',23),(3,'2f725f50-2f4e-11e9-9674-5da757e2a35e','2019-02-13 05:14:06','complete','med-tech software key','{\"id\": \"PAYID-LRR2O6Y2LE99876LV286253W\", \"cart\": \"2GF737908Y602703P\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRR2O6Y2LE99876LV286253W\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-13T05:14:06Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"11\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key\", \"related_resources\": [{\"sale\": {\"id\": \"9ET46488RE328751M\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/9ET46488RE328751M\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/9ET46488RE328751M/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRR2O6Y2LE99876LV286253W\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-13T05:14:05Z\", \"update_time\": \"2019-02-13T05:14:05Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRR2O6Y2LE99876LV286253W\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81',26),(4,'787970d0-2f4e-11e9-9674-5da757e2a35e','2019-02-13 05:16:08','complete','med-tech software key','{\"id\": \"PAYID-LRR2P3I26822598PR9773729\", \"cart\": \"86R12758HF048520J\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRR2P3I26822598PR9773729\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-13T05:16:08Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"12\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key\", \"related_resources\": [{\"sale\": {\"id\": \"33P12713MC093720B\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/33P12713MC093720B\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/33P12713MC093720B/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRR2P3I26822598PR9773729\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-13T05:16:08Z\", \"update_time\": \"2019-02-13T05:16:08Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRR2P3I26822598PR9773729\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',26),(5,'3b2458c0-2fb3-11e9-b812-450bf342fde4','2019-02-13 17:17:24','complete','med-tech software key','{\"id\": \"PAYID-LRSFCEA89S47125TT3494058\", \"cart\": \"35383699MF7379601\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRSFCEA89S47125TT3494058\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-13T17:17:24Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"13\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key , 25\", \"related_resources\": [{\"sale\": {\"id\": \"53K213828L125490C\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/53K213828L125490C\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/53K213828L125490C/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRSFCEA89S47125TT3494058\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-13T17:17:24Z\", \"update_time\": \"2019-02-13T17:17:24Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRSFCEA89S47125TT3494058\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',23),(6,'4af1a7a0-2fe8-11e9-a3a8-6db87488d7d9','2019-02-13 23:37:14','complete','med-tech software key','{\"id\": \"PAYID-LRSKT7Y23L33172MA7424637\", \"cart\": \"3XN04201LL2091629\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRSKT7Y23L33172MA7424637\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-13T23:37:14Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"14\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key , 25\", \"related_resources\": [{\"sale\": {\"id\": \"44G06930UD264243U\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/44G06930UD264243U\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/44G06930UD264243U/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRSKT7Y23L33172MA7424637\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-13T23:37:14Z\", \"update_time\": \"2019-02-13T23:37:14Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRSKT7Y23L33172MA7424637\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81',49),(7,'815b2c40-3000-11e9-b1f0-ad7be24835a1','2019-02-14 02:30:34','complete','med-tech software key','{\"id\": \"PAYID-LRSNFMY05P17725BG882433L\", \"cart\": \"05E76450N6622573X\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRSNFMY05P17725BG882433L\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-14T02:30:33Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"15\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key , 25\", \"related_resources\": [{\"sale\": {\"id\": \"5KA12556P95658258\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/5KA12556P95658258\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/5KA12556P95658258/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRSNFMY05P17725BG882433L\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-14T02:30:33Z\", \"update_time\": \"2019-02-14T02:30:33Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRSNFMY05P17725BG882433L\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',48);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productCode` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(70) NOT NULL,
  `productKey` varchar(255) NOT NULL,
  `productVendor` int(11) NOT NULL,
  `productDescription` text NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `salesOrder` char(50) NOT NULL,
  PRIMARY KEY (`productCode`),
  KEY `productVendor` (`productVendor`),
  KEY `products_ibfk_2` (`salesOrder`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productVendor`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (9,'med-tech software key','81dc-2c27d72d0f1e',25,'med-tech software key',25.00,'0fd881d0-2d58-11e9-b999-e9473dcbba4a'),(10,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',25,'med-tech software key',25.00,'e5353f20-2dea-11e9-8ecd-d36d0fa75a4e'),(11,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81',25,'med-tech software key',25.00,'2f725f50-2f4e-11e9-9674-5da757e2a35e'),(12,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',25,'med-tech software key',25.00,'787970d0-2f4e-11e9-9674-5da757e2a35e'),(13,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',25,'med-tech software key',25.00,'3b2458c0-2fb3-11e9-b812-450bf342fde4'),(14,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81',25,'med-tech software key',25.00,'4af1a7a0-2fe8-11e9-a3a8-6db87488d7d9'),(15,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',25,'med-tech software key',25.00,'815b2c40-3000-11e9-b1f0-ad7be24835a1'),(16,'med-tech software key','81dc-2c27d72d0f1e',25,'med-tech software key',25.00,'null'),(17,'med-line software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',25,'med-line software key',25.00,'null'),(18,'med-line software key','81dc-2c27d72d0f1e',25,'med-line software key',25.00,'null'),(19,'med-line software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',25,'med-line software key',25.00,'null'),(20,'med-line software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',25,'med-line software key',25.00,'null'),(21,'med-line software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',25,'med-line software key',25.00,'null'),(22,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',23,'med-tech software key',25.00,'null'),(23,'med-tech software key','81dc-2c27d72d0f1e',23,'med-tech software key',25.00,'null'),(24,'med-line software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',28,'med-line software key',25.00,'null'),(25,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',28,'med-tech software key',25.00,'null'),(26,'med-line software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-brian',28,'med-line software key',25.00,'null'),(27,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',28,'med-tech software key',25.00,'null'),(28,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',28,'med-tech software key',25.00,'null'),(29,'med-line software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e8178989',28,'med-line software key',25.00,'null'),(30,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-brian',28,'med-tech software key',25.00,'null'),(31,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81',28,'med-tech software key',25.00,'null'),(32,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-brian',23,'med-tech software key',25.00,'null'),(33,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e8178989',23,'med-tech software key',25.00,'null'),(34,'med-tech software key','81dc-2c27d72d0f1e',23,'med-tech software key',25.00,'null'),(35,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81',23,'med-tech software key',25.00,'null'),(36,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81',23,'med-tech software key',25.00,'null'),(37,'med-tech software key','81dc-2c27d72d0f1e',28,'med-tech software key',25.00,'null'),(38,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',23,'med-tech software key',25.00,'null'),(39,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',23,'med-tech software key',25.00,'null'),(40,'med-tech software key','81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7',23,'med-tech software key',25.00,'null');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rss-feeds`
--

DROP TABLE IF EXISTS `rss-feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss-feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(145) DEFAULT NULL,
  `link` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rss-feeds`
--

LOCK TABLES `rss-feeds` WRITE;
/*!40000 ALTER TABLE `rss-feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `rss-feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savedarticles`
--

DROP TABLE IF EXISTS `savedarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savedarticles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(145) DEFAULT NULL,
  `customerNumber` int(11) DEFAULT NULL,
  `link` varchar(145) DEFAULT NULL,
  `exerpt` varchar(255) DEFAULT NULL,
  `title` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savedarticles`
--

LOCK TABLES `savedarticles` WRITE;
/*!40000 ALTER TABLE `savedarticles` DISABLE KEYS */;
INSERT INTO `savedarticles` VALUES (40,'https://www.medicalnewstoday.com/articles/324432.php',26,'https://www.medicalnewstoday.com/articles/324432.php','New research pinpoints the mechanism through which sleep helps boost the activity of immune cells, thereby enhancing the body\'s immune response.','Medical News Today: How sleep can boost your body\'s immune response'),(43,'https://www.medicalnewstoday.com/articles/324441.php',23,'https://www.medicalnewstoday.com/articles/324441.php','A study in humans and mice reveals that exercise prompts fat to release helpful compounds, including a signaling protein that improves glucose tolerance.','Medical News Today: How does exercise prompt fat to benefit metabolism?'),(44,'https://www.medicalnewstoday.com/articles/323886.php',23,'https://www.medicalnewstoday.com/articles/323886.php','An upper respiratory infection is an illness that affects the nose and throat, causing symptoms such as sneezing and coughing. Learn more about upper respiratory infections here.','What are the signs of an upper respiratory infection?'),(47,'https://www.medicalnewstoday.com/articles/324443.php',48,'https://www.medicalnewstoday.com/articles/324443.php','Cloudy urine can result from many different issues, including dehydration, urinary tract infections, and kidney stones. Learn more about the causes and treatments here.','Medical News Today: What causes cloudy urine?'),(48,'https://www.medicalnewstoday.com/articles/324431.php',48,'https://www.medicalnewstoday.com/articles/324431.php','All fruits are healthful, but some stand out for their exceptional nutritional values. In this article, we look at 12 of the best fruits that people can eat to boost their health and wellbeing. ','Medical News Today: Top 12 healthful fruits'),(49,'https://www.medicalnewstoday.com/articles/322026.php',49,'https://www.medicalnewstoday.com/articles/322026.php','A new study confirms that the influenza virus can jump from pigs to dogs. Rapidly changing, some are concerned it could cause the next flu pandemic.  ','Could \'dog flu\' be the next pandemic?'),(51,'https://www.medicalnewstoday.com/releases/315401.php',49,'https://www.medicalnewstoday.com/releases/315401.php','New research from Vanderbilt eavesdrops on gene expression in human immune system cells before and after vaccination against bird flu.','Team uncovers cellular responses to bird flu vaccine');
/*!40000 ALTER TABLE `savedarticles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('ACA5zn0ooO3-T2Of_sFwcjtltHrnsxXo',1550175814,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2019-02-14T20:23:33.943Z\",\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":34},\"flash\":{},\"rank\":\"admin\",\"message\":\"Welcome back mumblitadmin\",\"next\":\"\"}'),('BcOuZCpalVJuJV68z0xXDK5fS9YleW2C',1550193024,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2019-02-15T01:10:24.025Z\",\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":23},\"flash\":{},\"rank\":\"admin\",\"message\":\"Welcome back brian\"}'),('QMMd_JWSzPKwpXGo2gBPR0PkHrUSzZSE',1550196573,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2019-02-15T02:09:32.511Z\",\"httpOnly\":true,\"path\":\"/\"},\"passport\":{}}'),('XYJ6jvxsVuRd1w2bSSkGpP59tfm7RhSO',1550201549,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2019-02-15T03:32:28.926Z\",\"httpOnly\":true,\"path\":\"/\"},\"passport\":{}}'),('ZXONqux2toDa9wDZeBX9aGMf0ebdH3jw',1550197835,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2019-02-15T02:30:35.491Z\",\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":48},\"flash\":{},\"rank\":\"user\",\"next\":\"\",\"message\":\"Welcome back bb\",\"purchaseItem\":{\"productCode\":15,\"productName\":\"med-tech software key\",\"productKey\":\"81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7\",\"productVendor\":25,\"productDescription\":\"med-tech software key\",\"buyPrice\":25,\"salesOrder\":\"null\"},\"payment\":{\"id\":\"PAYID-LRSNFMY05P17725BG882433L\",\"intent\":\"sale\",\"state\":\"created\",\"payer\":{\"payment_method\":\"paypal\"},\"transactions\":[{\"amount\":{\"total\":\"25.00\",\"currency\":\"USD\"},\"description\":\"med-tech software key , 25\",\"item_list\":{\"items\":[{\"name\":\"med-tech software key\",\"sku\":\"15\",\"price\":\"25.00\",\"currency\":\"USD\",\"quantity\":1}]},\"related_resources\":[]}],\"create_time\":\"2019-02-14T02:30:11Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRSNFMY05P17725BG882433L\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=EC-05E76450N6622573X\",\"rel\":\"approval_url\",\"method\":\"REDIRECT\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRSNFMY05P17725BG882433L/execute\",\"rel\":\"execute\",\"method\":\"POST\"}],\"httpStatusCode\":201}}'),('qPX2M7IaIJRqrQslq45BPFOjS1ED5JJc',1550199527,'{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2019-02-15T02:58:47.186Z\",\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":34},\"flash\":{},\"rank\":\"admin\",\"message\":\"Welcome back mumblitadmin\",\"next\":\"\"}'),('yeTAvlHkZxtVJsqBLoZQj1lJSFHb_fZY',1550192042,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2019-02-15T00:54:01.838Z\",\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":48},\"flash\":{},\"rank\":\"user\",\"next\":\"\",\"message\":\"Welcome back bb\"}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerNumber` int(11) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (22,23,'Cancer'),(24,23,'Oncology'),(32,23,'IllegalDrugs'),(35,23,'Viruses'),(36,26,'IllegalDrugs'),(37,23,'Cardiovascular'),(39,23,'Respiratory'),(40,23,'Dentistry'),(41,49,'QuitSmoking'),(42,34,'Surgery'),(43,34,'Bipolar'),(44,34,'Nephrology');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (23,'brian','$2a$10$cQaff7wHdIUYsqBNSXokdOIUjYZly22R595Q2.lR.anAGRzL9SneG'),(25,'bcburnett','$2a$10$XX3swrCwf.s26LdBUChPwOOV/7gEhrLJqszHEpv4tbF9dqCVu1i3m'),(26,'someone','$2a$10$arvxXPG7yuJpSFHZ8iru/OrVgJsx7fdhU7.WbGMRI3HiQqwqKae9i'),(28,'taz','$2a$10$.cRUMFnX7HDHk4KDtZ1PseFUYg/P/vRIYMxXQfnZ9aZpOvOPzZXA.'),(33,'bcburnett@gmail.com','$2a$10$XDFm9d5weVUuRM9KJEis/udv/fINrB2NlcLB8KmueayEF3atYrvXu'),(34,'mumblitadmin','$2a$10$liY.Itu/0UbeIcCI7DHwq.ARpQCp/fq25ffyni8I8PLc2vLbfpf3i'),(48,'bb','$2a$10$gBRikRCFU1mmdIqnf4tYneWdN7sETUmycsin3RoGZngEoWpJ9ownW'),(49,'jj','$2a$10$1wrr2vuJzThxOOT6Hj.lSuSNVuFOdcEc7BqlfHYtr.ZfYlMpX5sVW');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-13 22:37:26
