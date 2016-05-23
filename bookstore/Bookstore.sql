-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `OrderHistory`
--

DROP TABLE IF EXISTS `OrderHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderHistory` (
  `order_id` int(10) NOT NULL DEFAULT '0',
  `isbn` bigint(13) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  `currdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `t_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderHistory`
--

LOCK TABLES `OrderHistory` WRITE;
/*!40000 ALTER TABLE `OrderHistory` DISABLE KEYS */;
INSERT INTO `OrderHistory` VALUES (12333,9780743273565,'2',2,'2016-03-31 04:32:58',18.68),(14473,9780743273565,'2',3,'2016-03-31 04:32:30',28.02),(18590,9780375725609,'1',3,'2016-03-31 04:30:50',27.12),(19161,9780375725609,'2',2,'2016-03-31 04:32:25',18.08),(25405,9781476746586,'1',3,'2016-03-31 04:32:44',45.87),(26607,9780743273565,'1',2,'2016-03-31 04:31:06',18.68),(12173,9781476746586,'1',3,'2016-04-01 09:37:17',45.87),(22962,9780991340156,'1',2,'2016-04-01 09:38:25',28.68),(29818,9781338099133,'1',4,'2016-04-01 09:38:47',71.96),(13382,9781250101198,'1',10,'2016-04-01 09:39:43',95.2),(26247,9781476746586,'1',10,'2016-04-01 09:40:00',152.9),(28580,9781338099133,'1',3,'2016-04-01 20:32:00',53.97),(15528,9781338099133,'1',1,'2016-04-01 20:37:36',17.99),(17316,9781338099133,'4',2,'2016-04-01 21:03:11',35.98),(29651,9780375725609,'1',4,'2016-04-01 22:11:05',36.16),(13725,9780399160301,'1',3,'2016-04-02 04:07:20',34.92),(23945,9780375725609,'1',3,'2016-04-02 04:07:09',27.12),(20166,9780399160301,'1',100,'2016-04-02 15:31:13',1164),(11576,9781250101198,'1',3,'2016-04-02 16:33:21',28.56),(15833,9780375725609,'4',3,'2016-04-02 16:27:29',27.12),(15793,9781285057095,'1',3,'2016-04-02 16:35:50',133.05),(20833,9780439064873,'1',1,'2016-04-02 16:35:59',6.7),(24671,9780991340156,'1',2,'2016-04-03 00:09:57',28.68),(14060,9780743273565,'5',2,'2016-04-03 20:16:12',18.68),(15487,9780345391803,'5',3,'2016-04-03 20:15:43',14.97),(29189,9780375725609,'5',1,'2016-04-03 20:15:51',9.04),(19061,9780316098113,'5',3,'2016-04-03 20:38:29',14.97),(12334,517553473123,'6',4,'2016-03-31 09:32:58',15.96),(14474,9780316098113,'7',8,'2016-03-27 10:32:30',39.92),(18595,9780345391803,'8',12,'2016-02-29 08:30:50',59.88),(22943,9780399160301,'5',1,'2016-04-01 06:36:19',11.64),(25406,9780439064873,'7',5,'2016-03-31 16:32:44',33.5),(26602,9780547572482,'6',3,'2016-03-30 08:31:06',17.97),(12171,9781597801234,'8',6,'2016-04-08 14:37:17',23.94),(15809,9781597805384,'9',2,'2016-04-01 18:36:29',7.98),(22960,9780743273565,'1',1,'2016-04-02 22:38:25',9.34),(29811,9781338099133,'2',1,'2016-03-27 22:38:47',17.99),(13383,517553473123,'2',3,'2016-04-02 23:39:43',11.97),(26244,9781285057095,'7',7,'2016-04-01 16:40:00',310.45),(28585,9781476746586,'9',4,'2016-01-03 02:42:00',61.16),(15526,9780399160301,'9',3,'2016-04-02 01:27:36',34.92),(15387,9780316098113,'8',9,'2016-03-03 04:13:05',44.91),(17318,9781338099133,'6',2,'2016-04-02 02:43:11',35.98),(29659,9781597801234,'7',12,'2016-03-31 04:51:05',47.88),(13720,9781597801234,'6',8,'2016-04-02 13:07:20',31.92),(18426,9780345391803,'4',3,'2016-04-03 22:07:02',14.97),(27201,9780316098113,'8',1,'2016-04-04 01:59:08',4.99),(10007,517553473123,'7',2,'2016-04-04 02:00:52',7.98),(20740,9781597805384,'7',1,'2016-04-04 02:01:06',3.99),(28234,9780547572482,'6',1,'2016-04-04 02:01:43',5.99),(14433,9781597801234,'7',1,'2016-04-04 02:02:08',3.99),(12420,517553473123,'9',1,'2016-04-04 02:09:39',3.99),(12927,9780345391803,'2',2,'2016-04-04 02:10:00',9.98),(12420,517553473123,'9',1,'2016-04-04 02:09:39',3.99),(21399,9780743273565,'9',1,'2016-04-04 02:10:17',9.34),(21891,9781597801234,'5',2,'2016-04-06 01:33:53',7.98),(28878,517553473123,'5',2,'2016-04-06 01:33:40',7.98),(15551,9780375725609,'9',2,'2016-04-06 01:35:39',18.08),(17326,9780991340156,'9',1,'2016-04-06 01:35:52',14.34),(10617,517553473123,'15',3,'2016-04-20 06:13:30',11.97);
/*!40000 ALTER TABLE `OrderHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_name_2` (`author_name`),
  KEY `author_name` (`author_name`)
) ENGINE=InnoDB AUTO_INCREMENT=66667 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (10008,'Anthony Doerr'),(10005,'Bernie Webber'),(10010,'Bruce H. Edwards'),(11111,'Douglas Adams'),(10001,'Erik Larson'),(10004,'F. Scott Fitzgerald'),(66666,'Greg Egan'),(10007,'J.K. Rowling'),(10011,'Jack Thorne'),(55555,'John Lloyd'),(10012,'John Tiffany'),(22222,'Kim Stanley Robinson'),(10006,'Michael Punke'),(44444,'Neal Stephenson'),(33333,'Philip Dick'),(10009,'Ron Larson'),(10002,'Ruta Sepetys');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookAuthor`
--

DROP TABLE IF EXISTS `bookAuthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookAuthor` (
  `ISBN` bigint(13) NOT NULL,
  `Author_ID` int(5) unsigned zerofill NOT NULL,
  KEY `Author_ID` (`Author_ID`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `bookauthor_ibfk_1` FOREIGN KEY (`Author_ID`) REFERENCES `authors` (`id`),
  CONSTRAINT `bookauthor_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookAuthor`
--

LOCK TABLES `bookAuthor` WRITE;
/*!40000 ALTER TABLE `bookAuthor` DISABLE KEYS */;
INSERT INTO `bookAuthor` VALUES (9780375725609,10008),(9780399160301,10002),(9780439064873,10007),(9780743273565,10004),(9780991340156,10005),(9781250101198,10006),(9781285057095,10009),(9781285057095,10010),(9781338099133,10007),(9781476746586,10008),(9781338099133,10012),(9781338099133,10011),(517553473123,11111),(9780345391803,11111),(9780316098113,22222),(9780547572482,33333),(9781597801234,44444),(517553473123,55555),(9781597805384,66666);
/*!40000 ALTER TABLE `bookAuthor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `isbn` bigint(13) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (517553473123,'The meaning of Liff','A Useful Dictionary','img/liff.jpg',3.99),(9780316098113,'2312','It is the year 2312','img/2312.jpg',4.99),(9780345391803,'The Hitchhiker\'s Guide to the Galaxy','A book about the meaning of Life, the Universe, and Everything','img/hhgtg.jpg',4.99),(9780375725609,'The Devil in the White City','The true tale of the 1893 World Fair and the cunning serial killer who used the fair to lure his victims to their death. Combining meticulous research with nail-biting storytelling, Erik Larson has crafted a narrative with all the wonder of newly discovered history and the thrills of the best fiction.','img/devil.jpg',9.04),(9780399160301,'Salt to the Sea','Just when it seems freedom is within their grasp, tragedy strikes. Not country, nor culture, nor status matter as all ten thousand people aboard must fight for the same thing: survival','img/seasalt.jpg',11.64),(9780439064873,'Harry Potter And The Chamber Of Secrets','The Dursleys were so mean that hideous that summer that all Harry Potter wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as hes packing his bags, Harry receives a warning from a strange, impish creature named Dobby who says that if Harry Potter returns to Hogwarts, disaster will strike.','img/harrypotter2.jpg',6.7),(9780547572482,'The Man in the High Castle','What if the nazis won the war in a different reality?','img/the_man_in_the_high_castle_frontcover.jpg',5.99),(9780743273565,'The Great Gatsby','Set on the prosperous Long Island of 1922, The Great Gatsby provides a critical social history of America during the Roaring Twenties within its narrative. That era, known for unprecedented economic prosperity, the evolution of jazz music, flapper culture, and bootlegging and other criminal activity, is plausibly depicted in Fitzgerald novel.','img/gatsby.jpg',9.34),(9780991340156,'Into a Raging Sea: My Life and the Pendleton Rescue','Most people familiar with the name Bernie Webber associate him with the miraculous rescue of 32 men off of the stern of the Pendleton, made famous in the book and movie The Finest Hours. Rescuing 32 sailors from a sinking ship caught in a ferocious winter storm is a dramatic tale, but what made this mission so special is that the boat Bernie skippered that terrible night was a mere 36 feet in length and the waves were almost twice that size! Bernie and crew received the Coast Guard’s coveted Gold Lifesaving Medal, and what they did on that stormy night is regarded as the greatest small boat rescue in history.','img/sea.jpg',14.34),(9781250101198,'The Revenant: A Novel of Revenge','A thrilling tale of betrayal and revenge set against the nineteenth-century American frontier, the astonishing story of real-life trapper and frontiersman Hugh Glass','img/Revenant.jpg',9.52),(9781285057095,'Calculus','The Larson CALCULUS program has a long history of innovation in the calculus market. It has been widely praised by a generation of students and professors for its solid and effective pedagogy that addresses the needs of a broad range of teaching and learning styles and environments. Each title is just one component in a comprehensive calculus course program that carefully integrates and coordinates print, media, and technology products for successful teaching and learning.','img/calculus.jpg',44.35),(9781338099133,'Harry Potter and the Cursed Child','Based on an original new story by J.K. Rowling, Jack Thorne and John Tiffany, a new play by Jack Thorne, Harry Potter and the Cursed Child is the eighth story in the Harry Potter series and the first official Harry Potter story to be presented on stage.','img/harrypotter1.jpg',17.99),(9781476746586,'All the Light We Cannot See','From the highly acclaimed, multiple award-winning Anthony Doerr, the beautiful, stunningly ambitious instant New York Times bestseller about a blind French girl and a German boy whose paths collide in occupied France as both try to survive the devastation of World War II.','img/atlwcs.jpg',15.29),(9781597801234,'Cryptonomicon','How to get rich with cryptography and other stories','img/cryptonomicon.jpg',3.99),(9781597805384,'Quarantine','The mind is the ultimate quantum wave collapser','img/quarantine.jpg',3.99);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `isbn` bigint(13) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  `currdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `t_price` float DEFAULT NULL,
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_username` varchar(45) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_address` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_creditcard` bigint(16) DEFAULT NULL,
  `member_level` varchar(10) NOT NULL DEFAULT 'regular',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dpate85','Dhrumil','Chicago, Illinois','6348652853d7d89f9d30211637e50063',1234567890123456,'regular'),(2,'jpate11','Jaitali','Chicago, Illinois','325a2cc052914ceeb8c19016c091d2ac',1234567890123456,'regular'),(5,'HarveyB','Harvey Birdman','California','458839eb86a98747d3d973bcf210287b',1857638290127562,'regular'),(6,'MyronR','Myron Reducto','1234 Main Street','22c14f311a60486b36f79f3bc962be66',5857608298227562,'regular'),(7,'PhilK','Phil Ken Sebben','1235 Main Street, TX','39860b6edc2b31c558718809aefb0fec',7364281946104851,'regular'),(8,'Azul1','Azul Falcone','1236 Main Street, NJ','583b67f2725b6b7c1434d2ec6baaa4dc',3374819563826740,'admin'),(9,'StanZ','Stan Freezoid','1237 Main Street, NY','9102b98f6c3602eb7f6411ef8f746aa7',6732450198545128,'admin'),(13,'admin','John Doe','','16d7a4fca7442dda3ad93c9a726597e4',0,'admin');
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

-- Dump completed on 2016-04-21 12:32:00
