/*
SQLyog Ultimate v9.50 
MySQL - 5.1.54-1ubuntu4 : Database - venky
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `76to80lakh_copy` */

CREATE TABLE `76to80lakh_copy` (
  `id` int(10) DEFAULT NULL,
  `isbn13` varchar(20) DEFAULT NULL,
  `isbn10` varchar(20) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `specialprice` varchar(200) DEFAULT NULL,
  `delivery` varchar(200) DEFAULT NULL,
  `stock` varchar(200) DEFAULT NULL,
  `binding` varchar(200) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `publisher` varchar(200) DEFAULT NULL,
  `pages` varchar(200) DEFAULT NULL,
  `published` varchar(200) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `76to80lakh_copy` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
