-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: board
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_number` int NOT NULL AUTO_INCREMENT COMMENT '게시물 번호',
  `writer_email` varchar(50) NOT NULL COMMENT '작성자 이메일',
  `title` text NOT NULL COMMENT '제목',
  `content` text NOT NULL COMMENT '내용',
  `write_datetime` datetime NOT NULL COMMENT '작성날짜',
  `favorite_count` int NOT NULL DEFAULT '0' COMMENT '좋아요 수',
  `comment_count` int NOT NULL DEFAULT '0' COMMENT '댓글 수',
  `view_count` int NOT NULL DEFAULT '0' COMMENT '조회 수',
  PRIMARY KEY (`board_number`),
  KEY `FK_user_TO_board` (`writer_email`),
  CONSTRAINT `FK_user_TO_board` FOREIGN KEY (`writer_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시물 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_number` int NOT NULL COMMENT '댓글 번호',
  `board_number` int NOT NULL COMMENT '게시물 번호',
  `user_email` varchar(50) NOT NULL COMMENT '사용자 이메일',
  `content` text NOT NULL COMMENT '내용',
  `write_datetime` datetime NOT NULL COMMENT '작성날짜',
  PRIMARY KEY (`comment_number`),
  KEY `FK_board_TO_comment` (`board_number`),
  KEY `FK_user_TO_comment` (`user_email`),
  CONSTRAINT `FK_board_TO_comment` FOREIGN KEY (`board_number`) REFERENCES `board` (`board_number`),
  CONSTRAINT `FK_user_TO_comment` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='댓글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `board_number` int NOT NULL COMMENT '게시물 번호',
  `email` varchar(50) NOT NULL COMMENT '사용자 이메일',
  KEY `FK_user_TO_favorite` (`email`),
  KEY `FK_board_TO_favorite` (`board_number`),
  CONSTRAINT `FK_board_TO_favorite` FOREIGN KEY (`board_number`) REFERENCES `board` (`board_number`),
  CONSTRAINT `FK_user_TO_favorite` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='좋아요 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `board_number` int NOT NULL COMMENT '게시물 번호',
  `image` text NOT NULL COMMENT '이미지 URL',
  KEY `FK_board_TO_image` (`board_number`),
  CONSTRAINT `FK_board_TO_image` FOREIGN KEY (`board_number`) REFERENCES `board` (`board_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시물 이미지 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

--
-- Table structure for table `search_log`
--

DROP TABLE IF EXISTS `search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_log` (
  `sequence` int NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `search_word` text NOT NULL COMMENT '검색어',
  `relation_word` text COMMENT '관련 검색어',
  `relation` tinyint(1) NOT NULL COMMENT '관련 검색어 여부',
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='검색기록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_log`
--

/*!40000 ALTER TABLE `search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_log` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(50) NOT NULL COMMENT '사용자 이메일',
  `password` varchar(100) NOT NULL COMMENT '사용자 비밀번호',
  `nickname` varchar(20) NOT NULL COMMENT '사용자 닉네임',
  `tel_number` varchar(15) NOT NULL COMMENT '휴대전화번호',
  `address` text NOT NULL COMMENT '사용자 주소',
  `address_detail` text COMMENT '사용자 주소상세',
  `profile_image` text COMMENT '프로필사진',
  PRIMARY KEY (`email`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `tel_number` (`tel_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사용자 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Dumping routines for database 'board'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-29 13:08:37
