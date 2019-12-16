-- Host: localhost    Database: dbo_survey_system
-- ------------------------------------------------------

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
-- Table structure for table `alternatives`
--

DROP TABLE IF EXISTS `alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternatives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` int(11) NOT NULL,
  `variant` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer` (`answer`),
  KEY `variant` (`variant`),
  CONSTRAINT `alternatives_ibfk_1` FOREIGN KEY (`answer`) REFERENCES `answers` (`id`),
  CONSTRAINT `alternatives_ibfk_2` FOREIGN KEY (`variant`) REFERENCES `variants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternatives`
--

LOCK TABLES `alternatives` WRITE;
/*!40000 ALTER TABLE `alternatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `alternatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session` (`session`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`session`) REFERENCES `sessions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experts`
--

DROP TABLE IF EXISTS `experts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experts`
--

LOCK TABLES `experts` WRITE;
/*!40000 ALTER TABLE `experts` DISABLE KEYS */;
/*!40000 ALTER TABLE `experts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) DEFAULT NULL,
  `mkey` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mvalue` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question` (`question`),
  CONSTRAINT `metadata_ibfk_1` FOREIGN KEY (`question`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata`
--

LOCK TABLES `metadata` WRITE;
/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;
INSERT INTO `metadata` VALUES (1,1,'n_of_many.min','1'),(2,1,'n_of_many.max','1'),(3,2,'n_of_many.min','1'),(4,2,'n_of_many.max','*'),(5,2,'open_answer.index','6'),(6,3,'matrix.row_answers.min','1'),(7,3,'matrix.row_answers.max','1'),(8,3,'matrix.rows','10'),(9,3,'matrix.columns','3'),(10,4,'n_of_many.min','1'),(11,4,'n_of_many.max','1'),(12,5,'n_of_many.min','1'),(13,5,'n_of_many.max','*'),(14,6,'n_of_many.min','1'),(15,6,'n_of_many.max','1'),(16,7,'n_of_many.min','1'),(17,7,'n_of_many.max','1'),(18,9,'n_of_many.min','1'),(19,9,'n_of_many.max','1'),(20,10,'n_of_many.min','1'),(21,10,'n_of_many.max','1'),(22,11,'n_of_many.min','1'),(23,11,'n_of_many.max','1'),(24,12,'matrix.row_answers.min','1'),(25,12,'matrix.row_answers.max','1'),(26,12,'matrix.rows','5'),(27,12,'matrix.columns','4'),(28,14,'n_of_many.min','1'),(29,14,'n_of_many.max','1'),(30,15,'n_of_many.min','1'),(31,15,'n_of_many.max','1'),(32,16,'n_of_many.min','1'),(33,16,'n_of_many.max','1'),(34,17,'n_of_many.min','1'),(35,17,'n_of_many.max','1');
/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
INSERT INTO `polls` VALUES (1,'Яка ти принцеса Дісней?','bla-bla-bla, this is a test description'),(2,'Оцінка кафе','bla-bla-bla, this is a test description');
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_types`
--

DROP TABLE IF EXISTS `question_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_types`
--

LOCK TABLES `question_types` WRITE;
/*!40000 ALTER TABLE `question_types` DISABLE KEYS */;
INSERT INTO `question_types` VALUES (1,'N of Many'),(2,'Matrix'),(3,'Open'),(4,'Sorted');
/*!40000 ALTER TABLE `question_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qindex` int(11) NOT NULL,
  `qtext` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poll` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poll` (`poll`),
  KEY `type` (`type`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`poll`) REFERENCES `polls` (`id`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`type`) REFERENCES `question_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'Обери риси, що для тебе найбільше притаманні:',1,1),(2,2,'Твій домашній улюбленець:',1,1),(3,3,'Ви дивились наступні фільми Disney?',1,2),(4,4,'Що тебе притягує?',1,1),(5,5,'Яку частину світу обереш?',1,1),(6,6,'Мені подобається:',1,1),(7,7,'Який твій стиль одягу?',1,1),(8,8,'Твоє життя ...',1,3),(9,9,'Твоя сильна сторона:',1,1),(10,10,'Вкажіть вашу стать:',1,1),(11,1,'Як часто ви відвідуєте кафе?',2,1),(12,2,'Зазначте настільки ви згодні з наступними висловлюваннями?',2,2),(13,3,'Відсортуйте від найкращого до найгіршого',2,4),(14,4,'Оцініть наше кафе',2,1),(15,5,'Чи порекомендували б ви наше кафе?',2,1),(16,6,'Вкажіть вашу стать:',2,1),(17,7,'Вкажіть вашу вікову групу:',2,1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expert` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expert` (`expert`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`expert`) REFERENCES `experts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) NOT NULL,
  `vindex` int(11) NOT NULL,
  `text` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link1` int(11) DEFAULT NULL,
  `link2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question` (`question`),
  KEY `link1` (`link1`),
  KEY `link2` (`link2`),
  CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`question`) REFERENCES `questions` (`id`),
  CONSTRAINT `variants_ibfk_2` FOREIGN KEY (`link1`) REFERENCES `variants` (`id`),
  CONSTRAINT `variants_ibfk_3` FOREIGN KEY (`link2`) REFERENCES `variants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,1,1,'Цілеспрямованість, рішучість, допитливість',NULL,NULL),(2,1,2,'Доброта, турбота про інших',NULL,NULL),(3,1,3,'Незалежність, непослушність',NULL,NULL),(4,1,4,'Сила і самовпевненість, хоробрість',NULL,NULL),(5,2,1,'Дуже великий кіт',NULL,NULL),(6,2,2,'Птахи',NULL,NULL),(7,2,3,'Єнот',NULL,NULL),(8,2,4,'Рибка',NULL,NULL),(9,2,5,'Мій домашній улюбленець - книга',NULL,NULL),(10,2,6,'Інші (відкрита відповідь)',NULL,NULL),(11,3,0,'',12,35),(12,3,1,'Tangled',11,NULL),(13,3,0,'',14,35),(14,3,2,'Frozen',13,NULL),(15,3,0,'',16,35),(16,3,3,'Pocahontas',15,NULL),(17,3,0,'',18,35),(18,3,4,'Mulan',17,NULL),(19,3,0,'',20,35),(20,3,5,'Brave',19,NULL),(21,3,0,'',22,35),(22,3,6,'Cinderella',21,NULL),(23,3,0,'',24,35),(24,3,7,'Sleeping Beauty',23,NULL),(25,3,0,'',26,35),(26,3,8,'The Little Mermaid',25,NULL),(27,3,0,'',28,35),(28,3,9,'Beauty and the Beast',27,NULL),(29,3,0,'',30,35),(30,3,10,'Aladdin',29,NULL),(31,3,0,'',30,32),(32,3,11,'Так',31,NULL),(33,3,0,'',30,34),(34,3,12,'Ні, але подивлюсь',33,NULL),(35,3,13,'Ні',29,NULL),(36,3,0,'',12,32),(37,3,0,'',12,34),(38,3,0,'',14,32),(39,3,0,'',14,34),(40,3,0,'',16,32),(41,3,0,'',16,34),(42,3,0,'',18,32),(43,3,0,'',18,34),(44,3,0,'',20,32),(45,3,0,'',20,34),(46,3,0,'',22,32),(47,3,0,'',22,34),(48,3,0,'',24,32),(49,3,0,'',24,34),(50,3,0,'',26,32),(51,3,0,'',26,34),(52,3,0,'',28,32),(53,3,0,'',28,34),(54,4,1,'Море, океан',NULL,NULL),(55,4,2,'Пустеля',NULL,NULL),(56,4,3,'Ліс',NULL,NULL),(57,5,1,'Європа',NULL,NULL),(58,5,2,'Америка',NULL,NULL),(59,5,3,'Східні країни',NULL,NULL),(60,5,4,'Там, де є море',NULL,NULL),(61,6,1,'Руде, вогняного кольору волосся',NULL,NULL),(62,6,2,'Світле або ж русяве волосся',NULL,NULL),(63,6,3,'Темний, насичено чорний колір волосся',NULL,NULL),(64,7,1,'Бальні вишукані і пишні сукні',NULL,NULL),(65,7,2,'Східні наряди (брюки, топ)',NULL,NULL),(66,7,3,'Прості, але  довгі сукні',NULL,NULL),(67,9,1,'Я круто танцюю',NULL,NULL),(68,9,2,'Я неймовірно співаю',NULL,NULL),(69,9,3,'Я хороша господиня',NULL,NULL),(70,9,4,'Я красунька, але тільки до 12 ночі',NULL,NULL),(71,10,1,'Чоловіча',NULL,NULL),(72,10,2,'Жіноча',NULL,NULL),(73,11,1,'Щодня',NULL,NULL),(74,11,2,'Декілька разів на тиждень',NULL,NULL),(75,11,3,'Раз в тиждень',NULL,NULL),(76,11,4,'Декілька разів на місяць',NULL,NULL),(77,11,5,'Раз в місяць',NULL,NULL),(78,11,6,'Декілька разів на рік',NULL,NULL),(79,11,7,'Вперше',NULL,NULL),(80,12,0,'',81,96),(81,12,1,'Закуски були поданні відмінно',80,NULL),(82,12,0,'',83,96),(83,12,2,'Закуски були якісні і смачні',82,NULL),(84,12,0,'',85,96),(85,12,3,'Ціна була приваблива',84,NULL),(86,12,0,'',87,96),(87,12,4,'Інтер\'єр кафе був приємним',86,NULL),(88,12,0,'',89,96),(89,12,5,'WiFi підключення достатньо швидке і якісне',88,NULL),(90,12,0,'',89,91),(91,12,6,'Повністю погоджуюсь',90,NULL),(92,12,0,'',89,93),(93,12,7,'Погоджуюсь',92,NULL),(94,12,0,'',89,95),(95,12,8,'Непогоджуюсь',94,NULL),(96,12,9,'Зовсім непогоджуюсь',88,NULL),(97,12,0,'',81,91),(98,12,0,'',81,93),(99,12,0,'',81,95),(100,12,0,'',83,91),(101,12,0,'',83,93),(102,12,0,'',83,95),(103,12,0,'',85,91),(104,12,0,'',85,93),(105,12,0,'',85,95),(106,12,0,'',87,91),(107,12,0,'',87,93),(108,12,0,'',87,95),(109,13,0,'',120,110),(110,13,1,'Інтер\'єр',109,NULL),(111,13,0,'',120,112),(112,13,2,'Обслуговування',111,NULL),(113,13,0,'',120,114),(114,13,3,'Смак страв',113,NULL),(115,13,0,'',120,116),(116,13,4,'Смак напоїв',115,NULL),(117,13,0,'',120,118),(118,13,5,'Чистота у вбиральні',117,NULL),(119,13,0,'',120,120),(120,13,6,'Місце розташування закладу',119,NULL),(121,13,0,'',110,110),(122,13,0,'',110,112),(123,13,0,'',110,114),(124,13,0,'',110,116),(125,13,0,'',110,118),(126,13,0,'',110,120),(127,13,0,'',112,110),(128,13,0,'',112,112),(129,13,0,'',112,114),(130,13,0,'',112,116),(131,13,0,'',112,118),(132,13,0,'',112,120),(133,13,0,'',114,110),(134,13,0,'',114,112),(135,13,0,'',114,114),(136,13,0,'',114,116),(137,13,0,'',114,118),(138,13,0,'',114,120),(139,13,0,'',116,110),(140,13,0,'',116,112),(141,13,0,'',116,114),(142,13,0,'',116,116),(143,13,0,'',116,118),(144,13,0,'',116,120),(145,13,0,'',118,110),(146,13,0,'',118,112),(147,13,0,'',118,114),(148,13,0,'',118,116),(149,13,0,'',118,118),(150,13,0,'',118,120),(151,14,1,'1',NULL,NULL),(152,14,2,'2',NULL,NULL),(153,14,3,'3',NULL,NULL),(154,14,4,'4',NULL,NULL),(155,14,5,'5',NULL,NULL),(156,15,1,'Так',NULL,NULL),(157,15,2,'Ні',NULL,NULL),(158,16,1,'Чоловіча',NULL,NULL),(159,16,2,'Жіноча',NULL,NULL),(160,17,1,'<20',NULL,NULL),(161,17,2,'21-30',NULL,NULL),(162,17,3,'31-40',NULL,NULL),(163,17,4,'41-50',NULL,NULL),(164,17,5,'51-60',NULL,NULL),(165,17,6,'60+',NULL,NULL);
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

