/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - auth_info
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/* Function  structure for function  `GET_SPID_NAME` */

/*!50003 DROP FUNCTION IF EXISTS `GET_SPID_NAME` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `GET_SPID_NAME`(sourceProductId INT) RETURNS varchar(100) CHARSET utf8
BEGIN
	
	SET @sourceProductId=sourceProductId;
	SET @sourceProductName='';
	SELECT `product_name` INTO @sourceProductName FROM `product` WHERE `product_id`= @sourceProductId;
	RETURN IFNULL(@sourceProductName,'');
	
    END */$$
DELIMITER ;

/* Function  structure for function  `GET_SSID_NAME` */

/*!50003 DROP FUNCTION IF EXISTS `GET_SSID_NAME` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `GET_SSID_NAME`(sourceStoreId INT) RETURNS varchar(100) CHARSET utf8
BEGIN
	
	SET @sourceStoreId=sourceStoreId;
	SET @sourceStoreName='';
	SELECT `store_name` INTO @sourceStoreName FROM `store` WHERE `store_id`= @sourceStoreId;
	RETURN IFNULL(@sourceStoreName,'');
	
    END */$$
DELIMITER ;

/* Function  structure for function  `GET_TPID_NAME` */

/*!50003 DROP FUNCTION IF EXISTS `GET_TPID_NAME` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `GET_TPID_NAME`(targetProductId INT) RETURNS varchar(100) CHARSET utf8
BEGIN
	
	SET @targetProductId=targetProductId;
	SET @targetProductName='';
	SELECT `product_name` INTO @targetProductName FROM `product` WHERE `product_id`= @targetProductId;
	RETURN IFNULL(@targetProductName,'');
	
    END */$$
DELIMITER ;

/* Function  structure for function  `GET_TSID_NAME` */

/*!50003 DROP FUNCTION IF EXISTS `GET_TSID_NAME` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `GET_TSID_NAME`(targetStoreId INT) RETURNS varchar(100) CHARSET utf8
BEGIN
	
	SET @targetStoreId=targetStoreId;
	SET @targetStoreName='';
	SELECT `store_name` INTO @targetStoreName FROM `store` WHERE `store_id`= @targetStoreId;
	RETURN IFNULL(@targetStoreName,'');
	
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
