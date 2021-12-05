CREATE DATABASE  IF NOT EXISTS `das_a_link_dd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `das_a_link_dd`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: das_a_link_dd
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abilities` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `course_subject` char(4) NOT NULL,
  `course_num` int NOT NULL,
  `title` varchar(40) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'MSCR',1100,'Film 101'),(2,'CS',2800,'Logic and Computation'),(3,'CS',1800,'Discrete Structures'),(4,'MATH',2331,'Linear Algebra'),(5,'CS',3800,'Theory of Computation'),(6,'CS',3200,'Database Design'),(7,'ARTF',2223,'5D Fundtls: Experience/Drawing');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_by_professor`
--

DROP TABLE IF EXISTS `course_by_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_by_professor` (
  `cbp_id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `pid` int NOT NULL,
  `sid` int NOT NULL,
  `num_students` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`cbp_id`),
  UNIQUE KEY `cid_pid_sid` (`cid`,`pid`,`sid`),
  KEY `cbp_pid_fk` (`pid`),
  KEY `cbp_sid_fk` (`sid`),
  CONSTRAINT `cbp_cid_fk` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `cbp_pid_fk` FOREIGN KEY (`pid`) REFERENCES `professor` (`pid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `cbp_sid_fk` FOREIGN KEY (`sid`) REFERENCES `semester` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_by_professor`
--

LOCK TABLES `course_by_professor` WRITE;
/*!40000 ALTER TABLE `course_by_professor` DISABLE KEYS */;
INSERT INTO `course_by_professor` VALUES (1,1,9,1,0),(2,2,2,7,0),(3,3,1,2,0),(4,3,3,1,0),(5,3,3,3,0),(6,3,3,4,0),(7,3,7,5,0),(8,4,8,5,0),(9,4,8,6,0),(10,5,5,3,0),(11,5,5,4,0),(12,5,5,5,0),(13,5,5,6,0),(14,5,5,7,0),(15,6,6,6,0),(16,6,6,7,0),(17,7,4,3,0);
/*!40000 ALTER TABLE `course_by_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Nate','Tucker'),(2,'Olin','Shudders'),(3,'Bean','Hescat'),(4,'Sandreen','Schafer'),(5,'Walker','Schneider'),(6,'Katherine','Durane'),(7,'Videro','Mihajlovikj'),(8,'Somi','Soo'),(9,'Nate','Blane');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `student_course_id` int NOT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `strength1` int DEFAULT NULL,
  `strength2` int DEFAULT NULL,
  `weakness1` int DEFAULT NULL,
  `weakness2` int DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `student_course_id` (`student_course_id`),
  KEY `review_comment_fk` (`comment_id`),
  KEY `strength1` (`strength1`),
  KEY `strength2` (`strength2`),
  KEY `weakness1` (`weakness1`),
  KEY `weakness2` (`weakness2`),
  CONSTRAINT `review_comment_fk` FOREIGN KEY (`comment_id`) REFERENCES `review_comment` (`comment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`strength1`) REFERENCES `abilities` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`strength2`) REFERENCES `abilities` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`weakness1`) REFERENCES `abilities` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_4` FOREIGN KEY (`weakness2`) REFERENCES `abilities` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_student_course_id_fk` FOREIGN KEY (`student_course_id`) REFERENCES `student_course` (`student_course_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `review_chk_1` CHECK ((`rating` <= 10.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_comment`
--

DROP TABLE IF EXISTS `review_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `likes` int DEFAULT NULL,
  `dislikes` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_comment`
--

LOCK TABLES `review_comment` WRITE;
/*!40000 ALTER TABLE `review_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sem_year` year NOT NULL,
  `sem_season` varchar(10) NOT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,2019,'FALL',0),(2,2020,'SPRING',0),(3,2020,'SUMMER1',0),(4,2020,'SUMMER2',0),(5,2020,'FALL',0),(6,2021,'SPRING',0),(7,2021,'FALL',1);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `nuid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`nuid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Rhys','Hawkins','newpwd1'),(2,'Vilma','Jarvi','password2'),(3,'Ted','Ellison','password3'),(4,'Heath','Atwood','password4'),(5,'Kinslee','Fink','password5'),(6,'Joshua','Wilson','password6'),(7,'Victoria','Roach','password7'),(8,'Ellis','Schaefer','password8'),(9,'Regan','Rosen','password9'),(10,'Daisy','Morgan','password10'),(11,'Taniyah','Miles','password11'),(12,'Becky','George','password12'),(13,'Alyvia','Cope','password13'),(14,'Clyde','Lucas','password14'),(15,'Lana','Steiner','password15'),(16,'Loren','Spears','password16'),(17,'Adolfo','Hess','password17'),(18,'Candice','Wu','password18'),(19,'Yadira','Redmond','password19'),(20,'Nia','Matos','password20');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course` (
  `student_course_id` int NOT NULL AUTO_INCREMENT,
  `nuid` int NOT NULL,
  `cbp_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`student_course_id`),
  UNIQUE KEY `nuid` (`nuid`,`cbp_id`),
  KEY `student_course_cbp_id_fk` (`cbp_id`),
  CONSTRAINT `student_course_cbp_id_fk` FOREIGN KEY (`cbp_id`) REFERENCES `course_by_professor` (`cbp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_course_nuid_fk` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES (1,1,16,0),(2,1,13,1),(3,1,8,1),(4,2,12,0),(5,2,17,1),(6,2,6,1),(7,3,10,1),(8,3,7,1),(9,3,12,1),(10,4,8,1),(11,4,6,1),(12,4,12,1),(13,5,6,1),(14,5,2,1),(15,5,4,1),(16,6,4,1),(17,6,3,1),(18,6,8,1),(19,7,7,1),(20,7,17,1),(21,7,4,1),(22,8,16,1),(23,8,4,1),(24,8,2,1),(25,9,1,1),(26,9,5,1),(27,9,2,1),(28,10,10,1),(29,10,9,1),(30,10,15,1),(31,11,7,1),(32,11,15,1),(33,11,2,1),(34,12,7,1),(35,12,6,1),(36,12,5,1),(37,13,5,1),(38,13,13,1),(39,13,4,1),(40,14,4,1),(41,14,13,1),(42,14,7,1),(43,15,8,1),(44,15,10,1),(45,15,5,1),(46,16,8,1),(47,16,5,1),(48,16,13,1),(49,17,13,1),(50,17,4,1),(51,17,16,1),(52,18,3,1),(53,18,5,1),(54,18,2,1),(55,19,9,1),(56,19,13,1),(57,19,4,1),(58,20,3,1),(59,20,5,1),(60,20,16,1);
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_likes_review`
--

DROP TABLE IF EXISTS `student_likes_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_likes_review` (
  `student_like_review_id` int NOT NULL AUTO_INCREMENT,
  `nuid` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`student_like_review_id`),
  UNIQUE KEY `nuid` (`nuid`,`review_id`),
  KEY `slr_review_id_fk` (`review_id`),
  CONSTRAINT `slr_nuid_fk` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `slr_review_id_fk` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_likes_review`
--

LOCK TABLES `student_likes_review` WRITE;
/*!40000 ALTER TABLE `student_likes_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_likes_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'das_a_link_dd'
--

--
-- Dumping routines for database 'das_a_link_dd'
--
/*!50003 DROP FUNCTION IF EXISTS `student_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `student_login`(
	nuid int,
    pwd varchar(255)
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
begin
	declare successful_login int;
	set successful_login = (select count(nuid) from student s where s.nuid= nuid and s.pwd = pwd);
    return successful_login;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_pwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_pwd`(
	in nuid int,
    in new_pwd varchar(255)
)
begin
	update student set pwd = new_pwd
    where student.nuid = nuid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 17:09:33