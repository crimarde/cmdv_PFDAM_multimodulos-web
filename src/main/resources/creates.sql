-- Dumping database structure for springhibernate_db  
CREATE DATABASE IF NOT EXISTS `springhibernate_db`;  
USE `springhibernate_db`;  
  
-- Dumping structure for table springhibernate_db.employee  
CREATE TABLE IF NOT EXISTS `employee` (  
  `id` int(11) NOT NULL AUTO_INCREMENT,  
  `first_name` varchar(45) DEFAULT NULL,  
  `last_name` varchar(45) DEFAULT NULL,  
  `email` varchar(45) DEFAULT NULL,  
  `phone` varchar(45) DEFAULT NULL,  
  PRIMARY KEY (`id`)  
) ENGINE=InnoDB AUTO_INCREMENT=1

INSERT INTO employee (id, first_name) VALUES (10000,'Cristobal_demo');
