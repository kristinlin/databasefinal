CREATE DATABASE  IF NOT EXISTS `das_a_link_dd` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `das_a_link_dd`;
-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: das_a_link_dd
-- ------------------------------------------------------
-- Server version	5.7.36-0ubuntu0.18.04.1

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
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilities` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
INSERT INTO `abilities` VALUES (7,'approachableness'),(4,'communication'),(10,'effective course materials'),(6,'empathy'),(1,'enthusiasm'),(9,'interactive'),(8,'knowledge of the material'),(2,'organization'),(5,'patience'),(3,'respectfulness');
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `course_subject` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `course_num` int(11) NOT NULL,
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_by_professor` (
  `cbp_id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`cbp_id`),
  UNIQUE KEY `cid_pid_sid` (`cid`,`pid`,`sid`),
  KEY `cbp_pid_fk` (`pid`),
  KEY `cbp_sid_fk` (`sid`),
  CONSTRAINT `cbp_cid_fk` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON UPDATE CASCADE,
  CONSTRAINT `cbp_pid_fk` FOREIGN KEY (`pid`) REFERENCES `professor` (`pid`) ON UPDATE CASCADE,
  CONSTRAINT `cbp_sid_fk` FOREIGN KEY (`sid`) REFERENCES `semester` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_by_professor`
--

LOCK TABLES `course_by_professor` WRITE;
/*!40000 ALTER TABLE `course_by_professor` DISABLE KEYS */;
INSERT INTO `course_by_professor` VALUES (1,1,9,1),(2,2,2,7),(3,3,1,2),(4,3,3,1),(5,3,3,3),(6,3,3,4),(7,3,7,5),(8,4,8,5),(9,4,8,6),(10,5,5,3),(11,5,5,4),(12,5,5,5),(13,5,5,6),(14,5,5,7),(15,6,6,6),(16,6,6,7),(17,7,4,3);
/*!40000 ALTER TABLE `course_by_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_course_id` int(11) NOT NULL,
  `rating` decimal(3,1) NOT NULL DEFAULT '5.0',
  `review_comment` varchar(1000) DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `strength1` int(11) DEFAULT NULL,
  `strength2` int(11) DEFAULT NULL,
  `weakness1` int(11) DEFAULT NULL,
  `weakness2` int(11) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `student_course_id` (`student_course_id`),
  KEY `strength1` (`strength1`),
  KEY `strength2` (`strength2`),
  KEY `weakness1` (`weakness1`),
  KEY `weakness2` (`weakness2`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`strength1`) REFERENCES `abilities` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`strength2`) REFERENCES `abilities` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`weakness1`) REFERENCES `abilities` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_4` FOREIGN KEY (`weakness2`) REFERENCES `abilities` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_student_course_id_fk` FOREIGN KEY (`student_course_id`) REFERENCES `student_course` (`student_course_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,3,8.0,'Professor Seo is a very dedicated and caring professor who conveys material very well and loves doing what she does. Great teacher and highly recommend her for any math courses she teaches\r\n',1,7,6,9,NULL),(2,2,8.5,'He is experienced and you can tell he knows what he is talking about. He also explained things in layperson\'s terms and often repeated things or waited for the topics to sink in. He didn\'t assume students knew what he was talking about and helped establish a strong base before diving into more complex topics. He was also very active on office hours and Piazza, sometimes even past midnight.',0,8,4,2,NULL),(3,1,9.1,'The professor provided a ton of material (slides, recorded videos, sample code) on Canvas to help students and it was organized very well, and lectures, even though rooted solidly in the slides, had a lot of additional information and explanation added in them to further explain topics; also answered questions when students were confused with material or for clarification\r\n',0,10,4,9,1),(4,6,10.0,'His enthusiasm and desire to teach are his greatest strengths and are effective in his teaching methods.\r\nProfessor usually went throught basic examples so that we would understand the concepts but the homework problems were more difficult and complex. I feel in the videos we should have done some more difficult problems as well as the basic ones.\r\n',0,1,7,10,2),(5,4,6.7,'The professor knew the material well but lacked explaining and delivering it well.\r\n',0,8,NULL,4,NULL),(6,5,9.0,'Love Sandrine best art professor I have had so far. Really knows how to make everyone fell special and express themselves.',0,7,6,NULL,NULL),(7,9,9.7,'The organization and presentation of the information made it really easy to learn all the information effectively. The professor set up everything to help the student succeed in receiving and understanding all the material.',0,10,2,9,NULL),(8,8,8.4,'The instructor is very kind, caring, and lenient in grading. He gave additional time to submit assignments and gave helpful hints. His piazza posts were very detailed and useful. His feedback and video lectures were great as well',0,7,6,2,NULL),(9,7,7.9,'More examples for each topic would be a great help. I frequently found that many homeworks i would look at a problem and not even be sure what topic it was reffering to as there were few to no examples similar to it covered',0,8,NULL,10,NULL),(10,11,7.8,'Professor Hescott seems to love the math behind computer science and as someone who also gets excited about math (not this course though) I thought it was very impressive. I only wish he had taught all the material rather than leaving a few of the more difficult modules for others to teach, as I learned much more from his lectures.',0,7,1,9,NULL),(11,10,9.3,'Somi is enthusiastic and knowledgable, and fun to lead the classroom.  But the questions in class should be more reflective on the test.\r\n',1,1,8,10,2),(12,12,7.0,'Course was well managed and time was well divided between topics, occasionally, the course did go very quickly and it seemed topics that would be covered in 5-10 minutes in class would be a bulk of the homework making those problems rather challenging',0,2,8,10,NULL),(13,14,4.4,'The teacher did not respond to some of the online students’ questions. The teacher did not explain why some homework and all quiz grades took months to grade. The teacher spent too much time talking about personal life stories instead of class material.',0,1,NULL,4,2),(15,13,5.0,'His enthusiasm and desire to teach are his greatest strengths and are effective in his teaching methods.\r\nI just wish there were more examples done in class.',0,1,7,2,10),(16,15,9.0,'patient and nice!\r\n',0,7,NULL,NULL,NULL),(17,16,8.0,'Prof. Hescott is a great teacher and explains material in a logical manner. I do believe that some additional explanations on topics could\'ve helped. For example, when we did proofs, it would\'ve been very helpful if we had a more general outline for the steps of the proof.',0,7,1,10,NULL),(18,18,8.0,'Thorough lectures that went over all the required material well, well structured chapters that were easy to keep track of.',0,10,NULL,NULL,NULL),(19,17,8.6,'Professor Durant went in depth with the material and provided many different options for learning the material (presentations, lectures, videos).',0,10,NULL,9,NULL),(21,21,5.0,'Nat did a great job displaying enthusiasm for the course material, and giving us lectures that were helpful. He clearly knew what he was talking about, and selected useful things for the curriculum.',0,10,8,2,NULL),(22,19,4.0,'Incredibly boring lectures. Lack of understanding of difficulty of having so much material in so little time. Homework assignents were so frequent and large it felt Herculean to get them all done',0,2,NULL,9,1),(23,24,5.0,'The posted lecture notes were way too long. It is impossible to expect students to read through 33 pages worth of lecture notes per week, especially written in such a poor format. Please condense this material for future students.',0,1,NULL,10,NULL),(24,22,9.2,'Course teaches a lot of useful content.',0,10,8,1,NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sem_year` year(4) NOT NULL,
  `sem_season` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,2019,'FALL'),(2,2020,'SPRING'),(3,2020,'SUMMER1'),(4,2020,'SUMMER2'),(5,2020,'FALL'),(6,2021,'SPRING'),(7,2021,'FALL');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `nuid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nuid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Rhys','Hawkins','password1'),(2,'Vilma','Jarvi','password2'),(3,'Ted','Ellison','password3'),(4,'Heath','Atwood','password4'),(5,'Kinslee','Fink','password5'),(6,'Joshua','Wilson','password6'),(7,'Victoria','Roach','password7'),(8,'Ellis','Schaefer','password8'),(9,'Regan','Rosen','password9'),(10,'Daisy','Morgan','password10'),(11,'Taniyah','Miles','password11'),(12,'Becky','George','password12'),(13,'Alyvia','Cope','password13'),(14,'Clyde','Lucas','password14'),(15,'Lana','Steiner','password15'),(16,'Loren','Spears','password16'),(17,'Adolfo','Hess','password17'),(18,'Candice','Wu','password18'),(19,'Yadira','Redmond','password19'),(20,'Nia','Matos','password20');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course` (
  `student_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `nuid` int(11) NOT NULL,
  `cbp_id` int(11) NOT NULL,
  PRIMARY KEY (`student_course_id`),
  UNIQUE KEY `nuid` (`nuid`,`cbp_id`),
  KEY `student_course_cbp_id_fk` (`cbp_id`),
  CONSTRAINT `student_course_cbp_id_fk` FOREIGN KEY (`cbp_id`) REFERENCES `course_by_professor` (`cbp_id`),
  CONSTRAINT `student_course_nuid_fk` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES (3,1,8),(2,1,13),(1,1,16),(6,2,6),(4,2,12),(5,2,17),(9,3,1),(8,3,7),(7,3,10),(11,4,6),(10,4,8),(12,4,12),(14,5,2),(13,5,6),(15,5,15),(16,6,4),(18,6,8),(17,6,15),(21,7,3),(19,7,11),(20,7,17),(24,8,2),(23,8,4),(22,8,16),(25,9,1),(27,9,2),(26,9,5),(29,10,9),(28,10,10),(30,10,15),(33,11,2),(31,11,7),(32,11,15),(36,12,5),(35,12,6),(34,12,7),(39,13,4),(37,13,5),(38,13,13),(40,14,4),(42,14,7),(41,14,13),(45,15,5),(43,15,8),(44,15,10),(47,16,5),(46,16,8),(48,16,13),(50,17,4),(49,17,13),(51,17,16),(54,18,2),(52,18,3),(53,18,5),(57,19,4),(55,19,9),(56,19,13),(58,20,3),(59,20,5),(60,20,16);
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_likes_review`
--

DROP TABLE IF EXISTS `student_likes_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_likes_review` (
  `student_like_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `nuid` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  PRIMARY KEY (`student_like_review_id`),
  UNIQUE KEY `nuid` (`nuid`,`review_id`),
  KEY `slr_review_id_fk` (`review_id`),
  CONSTRAINT `slr_nuid_fk` FOREIGN KEY (`nuid`) REFERENCES `student` (`nuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `slr_review_id_fk` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_likes_review`
--

LOCK TABLES `student_likes_review` WRITE;
/*!40000 ALTER TABLE `student_likes_review` DISABLE KEYS */;
INSERT INTO `student_likes_review` VALUES (3,9,1),(4,9,11);
/*!40000 ALTER TABLE `student_likes_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER add_review_likes_insert	
AFTER INSERT ON student_likes_review
FOR EACH ROW
BEGIN

update review set likes = likes + 1 where review_id=new.review_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER subtract_review_likes_delete	
BEFORE DELETE ON student_likes_review
FOR EACH ROW
BEGIN

update review set likes = likes - 1 where review_id = old.review_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'das_a_link_dd'
--

--
-- Dumping routines for database 'das_a_link_dd'
--
/*!50003 DROP FUNCTION IF EXISTS `pid_profname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pid_profname`(
	in_pid int
) RETURNS varchar(61) CHARSET utf8 COLLATE utf8_unicode_ci
    READS SQL DATA
    DETERMINISTIC
begin
	declare profname varchar(61);
    set profname = 
    (select concat(fname, " ", lname) from professor p
    where p.pid = in_pid );
    return profname;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sid_semester` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sid_semester`(
	in_sid int
) RETURNS varchar(15) CHARSET utf8 COLLATE utf8_unicode_ci
    READS SQL DATA
    DETERMINISTIC
begin
	declare sem_string varchar(15);
    set sem_string = 
    (select concat(sem_season, " ", sem_year) from semester s
    where s.sid = in_sid );
    return sem_string;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `student_course_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `student_course_review`(
	in_student_course_id int
) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
begin
	declare stud_course_review int;
	set stud_course_review = (select review_id from review r where r.student_course_id = in_student_course_id);
    
    if stud_course_review is NULL then set stud_course_review = -1;
    end if;
    
    return stud_course_review;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `student_liked_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `student_liked_review`(
	in_nuid INT,
    in_review_id INT
) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
begin
	declare review_liked bool;
    set review_liked = 
    (select count(*) from student_likes_review s where s.nuid = in_nuid and s.review_id = in_review_id) > 0;
    return review_liked;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `student_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `student_login`(
	nuid int,
    pwd varchar(255)
) RETURNS int(11)
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
/*!50003 DROP PROCEDURE IF EXISTS `delete_like` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_like`(
	in in_nuid INT,
    in in_review_id INT
)
begin
	delete from student_likes_review where in_nuid=nuid and in_review_id=review_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_review`(
	in in_review_id INT
)
begin
	delete from review 
    where review_id = in_review_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_review`(
	in in_review_id INT,
    in in_rating DECIMAL(2, 1),
    in in_review_comment VARCHAR(1000),
    in in_strength1 INT,
    in in_strength2 INT,
    in in_weakness1 INT,
    in in_weakness2 INT
)
begin
	update review 
    set rating = in_rating, review_comment = in_review_comment, strength1=in_strength1, strength2=in_strength2, weakness1=in_weakness1, weakness2=in_weakness2
    where review_id = in_review_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_abilities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_abilities`()
begin
	select * from abilities;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_course_nums` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_course_nums`()
begin
	select DISTINCT(course_num) from course order by course_num ASC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_course_subjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_course_subjects`()
begin
	select DISTINCT(course_subject) from course;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_review`(
	in in_review_id INT
)
begin
	select * from review where review_id = in_review_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_reviews_for_course` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reviews_for_course`(
	in in_nuid INT,
    in in_cid INT,
    in in_pid INT,
    in in_sid INT
)
begin
	if in_sid is NULL then
		select r.*, sid_semester(c.sid) sem_name, student_liked_review(in_nuid, r.review_id) student_liked_review from review r, student_course s, course_by_professor c
        where c.cid = in_cid and c.pid = in_pid and r.student_course_id =  s.student_course_id and s.cbp_id = c.cbp_id;
	else
		select r.*, sid_semester(in_sid) sem_name, student_liked_review(in_nuid, r.review_id) student_liked_review from review r where student_course_id in
		(select student_course_id from student_course where cbp_id in
		(select cbp_id from course_by_professor where cid = in_cid and pid = in_pid and sid = in_sid)); 
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_search`(
	in in_subject CHAR(4),
    in in_course_num INT,
    in in_professor_lname VARCHAR(30)
)
begin
	if in_subject is not NULL and in_course_num is not NULL and in_professor_lname is not NULL then 
		select cbp.cid, cbp.pid,c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_subject = in_subject and course_num = in_course_num) c, 
        (select pid, fname, lname from professor where lname = in_professor_lname) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is NULL and in_course_num is not NULL and in_professor_lname is not NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_num = in_course_num) c, 
        (select pid, fname, lname from professor where lname = in_professor_lname) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is not NULL and in_course_num is NULL and in_professor_lname is not NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_subject = in_subject) c, 
        (select pid, fname, lname from professor where lname = in_professor_lname) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is not NULL and in_course_num is not NULL and in_professor_lname is NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_subject = in_subject and course_num = in_course_num) c, 
        (select pid, fname, lname from professor) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is NULL and in_course_num is NULL and in_professor_lname is not NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        course c, 
        (select pid, fname, lname from professor where lname = in_professor_lname) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is NULL and in_course_num is not NULL and in_professor_lname is NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_num = in_course_num) c, 
        (select pid, fname, lname from professor) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	elseif in_subject is not NULL and in_course_num is NULL and in_professor_lname is NULL then 
		select cbp.cid, cbp.pid, c.course_subject, c.course_num, c.title, p.fname, p.lname from course_by_professor cbp,
        (select * from course where course_subject = in_subject) c, 
        (select pid, fname, lname from professor) p
        where cbp.pid = p.pid and cbp.cid = c.cid
        group by cbp.cid, cbp.pid;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_semesters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_semesters`(
	in in_cid INT,
    in in_pid INT
)
begin
	select sid, sid_semester(sid) as sem_name from course_by_professor where cid = in_cid and pid = in_pid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_student_courses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_student_courses`(
	in in_nuid int
)
begin
	select sid, course_subject, course_num, title, pid, student_course_id  from 
	course c, (select cbp_id, student_course_id from student_course where nuid = in_nuid) as t, course_by_professor cbp
    where cbp.cbp_id = t.cbp_id and
    cbp.cid = c.cid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_like` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_like`(
	in in_nuid INT,
    in in_review_id INT
)
begin
	insert into student_likes_review (nuid, review_id) values (in_nuid, in_review_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_review`(
	in in_rating DECIMAL(2, 1),
    in in_student_course_id INT,
    in in_review_comment VARCHAR(1000),
    in in_strength1 INT,
    in in_strength2 INT,
    in in_weakness1 INT,
    in in_weakness2 INT
)
begin
	insert into review (rating, student_course_id, review_comment, strength1, strength2, weakness1, weakness2) 
    values (in_rating, in_student_course_id, in_review_comment, in_strength1, in_strength2, in_weakness1, in_weakness2); 
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
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

-- Dump completed on 2021-12-08 23:32:33
