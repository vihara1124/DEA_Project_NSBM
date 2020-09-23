-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.17 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for libry
CREATE DATABASE IF NOT EXISTS `libry` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libry`;

-- Dumping structure for table libry.book
CREATE TABLE IF NOT EXISTS `book` (
  `book_code` varchar(45) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `book_category_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`book_code`),
  KEY `fk_book_member1_idx` (`member_id`),
  KEY `fk_book_book_category1_idx` (`book_category_id`),
  CONSTRAINT `fk_book_book_category1` FOREIGN KEY (`book_category_id`) REFERENCES `book_category` (`id`),
  CONSTRAINT `fk_book_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table libry.book: ~0 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
REPLACE INTO `book` (`book_code`, `name`, `author`, `book_category_id`, `member_id`, `status`) VALUES
	('B-579425', 'ABCD', 'john', 1, 4, 0),
	('B-776770', 'Ali Baba saha Horu 40', 'Ali khan', 4, 3, 0);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- Dumping structure for table libry.book_category
CREATE TABLE IF NOT EXISTS `book_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table libry.book_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
REPLACE INTO `book_category` (`id`, `name`) VALUES
	(1, 'Novel'),
	(2, 'Sport'),
	(3, 'Science'),
	(4, 'History');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;

-- Dumping structure for table libry.member
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `nic` varchar(45) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_join` varchar(45) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table libry.member: ~0 rows (approximately)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
REPLACE INTO `member` (`id`, `fname`, `lname`, `nic`, `mobile`, `email`, `gender`, `date_join`, `image`) VALUES
	(3, 'Uwan', 'Rukshala', '981665525V', '1567398', 'abc@gmail.com', 'male', '21-09-2020', NULL),
	(4, 'Kaushalya', 'Hansini', '986566287V', '0715567728', 'cow@gmail.com', 'female', '21-09-2020', NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- Dumping structure for table libry.member_has_book
CREATE TABLE IF NOT EXISTS `member_has_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_code` varchar(45) NOT NULL,
  `member_id` int(11) NOT NULL,
  `date_issue` varchar(45) DEFAULT NULL,
  `date_return` varchar(45) DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `isReurned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_has_book_member1_idx` (`member_id`),
  KEY `fk_member_has_book_staff1_idx` (`staff_id`),
  KEY `fk_member_has_book_book1_idx` (`book_code`),
  CONSTRAINT `fk_member_has_book_book1` FOREIGN KEY (`book_code`) REFERENCES `book` (`book_code`),
  CONSTRAINT `fk_member_has_book_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `fk_member_has_book_staff1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table libry.member_has_book: ~0 rows (approximately)
/*!40000 ALTER TABLE `member_has_book` DISABLE KEYS */;
REPLACE INTO `member_has_book` (`id`, `book_code`, `member_id`, `date_issue`, `date_return`, `staff_id`, `isReurned`) VALUES
	(1, 'B-776770', 3, '2020-09-21', '2020-09-28', 1, 1),
	(2, 'B-579425', 3, '2020-09-21', '2020-10-06', 1, 1),
	(3, 'B-579425', 4, '2020-09-22', '2020-09-28', 1, 1),
	(4, 'B-776770', 3, '2020-09-22', '2020-09-29', 1, 0);
/*!40000 ALTER TABLE `member_has_book` ENABLE KEYS */;

-- Dumping structure for table libry.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `bday` varchar(45) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table libry.staff: ~0 rows (approximately)
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
REPLACE INTO `staff` (`id`, `fname`, `lname`, `nic`, `email`, `mobile`, `gender`, `bday`, `image`, `password`) VALUES
	(1, 'Uwan', 'Rukshala', '2345678', 'abc@gmail.com', '09857899221', 'male', '2020-09-29', NULL, '123456');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
librybookbook_category