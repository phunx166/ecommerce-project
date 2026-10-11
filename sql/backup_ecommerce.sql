-- MySQL dump 10.13  Distrib 26.7.0, for macos15 (arm64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '09d4a44e-ac49-11f1-baaf-54f5d1379f78:1-43';

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `old_price` decimal(12,2) DEFAULT NULL,
  `new_price` decimal(12,2) DEFAULT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `fk_audit_products` (`product_id`),
  CONSTRAINT `fk_audit_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Điện thoại & Tablet','Thiết bị di động thông minh'),(2,'Laptop & Máy tính','Máy tính xách tay và linh kiện PC'),(3,'Phụ kiện công nghệ','Tai nghe, cáp sạc, chuột bàn phím'),(4,'Thời trang nam','Quần áo và giày dép nam'),(5,'Gia dụng & Đời sống','Thiết bị nhà bếp và chăm sóc nhà cửa'),(6,'Sách & Văn phòng phẩm','Sách kỹ năng, tiểu thuyết, giáo trình'),(7,'Đồng hồ thông minh','Smartwatch và vòng tay theo dõi sức khỏe'),(8,'Âm thanh','Loa Bluetooth, soundbar, ampli'),(9,'Mỹ phẩm & Chăm sóc da','Sản phẩm dưỡng da và trang điểm'),(10,'Thể thao & Dã ngoại','Dụng cụ tập gym và cắm trại');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Nguyen Van A','nguyenvana@gmail.com','0901234567','Quan 1, TP Ho Chi Minh','2026-10-11 16:04:54'),(2,'Tran Thi B','tranthib@gmail.com','0912345678','Ba Dinh, Ha Noi','2026-10-11 16:04:54'),(3,'Le Van C','levanc@gmail.com','0923456789','Hai Chau, Da Nang','2026-10-11 16:04:54'),(4,'Pham Minh D','phamminhd@gmail.com','0934567890','Cau Giay, Ha Noi','2026-10-11 16:04:54'),(5,'Hoang Thi E','hoangthie@gmail.com','0945678901','Ninh Kieu, Can Tho','2026-10-11 16:04:54'),(6,'Doan Van F','doanvanf@gmail.com','0956789012','Quan 7, TP Ho Chi Minh','2026-10-11 16:04:54'),(7,'Bui Thi G','buithig@gmail.com','0967890123','Thanh Khe, Da Nang','2026-10-11 16:04:54'),(8,'Vuong Minh H','vuongminhh@gmail.com','0978901234','Dong Da, Ha Noi','2026-10-11 16:04:54'),(9,'Dinh Van I','dinhvani@gmail.com','0989012345','Quan 3, TP Ho Chi Minh','2026-10-11 16:04:54'),(10,'Ngo Thi K','ngothik@gmail.com','0990123456','Ha Dong, Ha Noi','2026-10-11 16:04:54');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_items_orders` (`order_id`),
  KEY `fk_items_products` (`product_id`),
  CONSTRAINT `fk_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT,
  CONSTRAINT `order_items_chk_1` CHECK ((`quantity` > 0)),
  CONSTRAINT `order_items_chk_2` CHECK ((`unit_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,27990000.00),(2,1,5,1,2290000.00),(3,2,3,1,26500000.00),(4,3,5,1,2290000.00),(5,3,6,1,1850000.00),(6,4,8,1,7990000.00),(7,5,2,1,29990000.00),(8,6,10,1,3200000.00),(9,7,7,1,10290000.00),(10,8,11,2,250000.00),(11,9,9,1,8900000.00),(12,10,5,1,2290000.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(12,2) DEFAULT '0.00',
  `order_status` enum('PENDING','PROCESSING','COMPLETED','CANCELLED') COLLATE utf8mb4_unicode_ci DEFAULT 'PENDING',
  PRIMARY KEY (`order_id`),
  KEY `idx_orders_customer_date` (`customer_id`,`order_date`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `orders_chk_1` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-09-01 03:00:00',30280000.00,'COMPLETED'),(2,2,'2026-09-02 04:30:00',26500000.00,'COMPLETED'),(3,3,'2026-09-03 07:15:00',4140000.00,'COMPLETED'),(4,1,'2026-09-05 02:20:00',7990000.00,'PROCESSING'),(5,4,'2026-09-06 09:45:00',29990000.00,'COMPLETED'),(6,5,'2026-09-07 11:00:00',3200000.00,'PENDING'),(7,6,'2026-09-08 01:30:00',10290000.00,'CANCELLED'),(8,7,'2026-09-09 06:10:00',500000.00,'COMPLETED'),(9,8,'2026-09-10 08:25:00',8900000.00,'COMPLETED'),(10,9,'2026-09-11 10:40:00',2290000.00,'PROCESSING');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method` enum('CREDIT_CARD','BANK_TRANSFER','COD','E_WALLET') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` enum('UNPAID','PAID','REFUNDED') COLLATE utf8mb4_unicode_ci DEFAULT 'UNPAID',
  `payment_date` timestamp NULL DEFAULT NULL,
  `amount_paid` decimal(12,2) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `fk_payments_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `payments_chk_1` CHECK ((`amount_paid` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'CREDIT_CARD','PAID','2026-09-01 03:05:00',30280000.00),(2,2,'BANK_TRANSFER','PAID','2026-09-02 04:35:00',26500000.00),(3,3,'E_WALLET','PAID','2026-09-03 07:20:00',4140000.00),(4,4,'BANK_TRANSFER','PAID','2026-09-05 02:25:00',7990000.00),(5,5,'CREDIT_CARD','PAID','2026-09-06 09:50:00',29990000.00),(6,6,'COD','UNPAID',NULL,3200000.00),(7,7,'CREDIT_CARD','REFUNDED','2026-09-08 02:00:00',10290000.00),(8,8,'COD','PAID','2026-09-10 03:00:00',500000.00),(9,9,'E_WALLET','PAID','2026-09-10 08:30:00',8900000.00),(10,10,'BANK_TRANSFER','UNPAID',NULL,2290000.00);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVE',
  PRIMARY KEY (`product_id`),
  KEY `fk_products_categories` (`category_id`),
  KEY `idx_products_name` (`product_name`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT,
  CONSTRAINT `products_chk_1` CHECK ((`price` >= 0)),
  CONSTRAINT `products_chk_2` CHECK ((`stock_quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'iPhone 15 Pro 128GB',27990000.00,45,'ACTIVE'),(2,1,'Samsung Galaxy S24 Ultra',29990000.00,30,'ACTIVE'),(3,2,'MacBook Air M2 16GB',26500000.00,20,'ACTIVE'),(4,2,'Dell XPS 13 9315',24900000.00,15,'ACTIVE'),(5,3,'Chuột Logitech MX Master 3S',2290000.00,100,'ACTIVE'),(6,3,'Bàn phím cơ Keychron K2V2',1850000.00,50,'ACTIVE'),(7,7,'Apple Watch Series 9 GPS',10290000.00,25,'ACTIVE'),(8,8,'Tai nghe Sony WH-1000XM5',7990000.00,40,'ACTIVE'),(9,8,'Loa Marshall Stanmore III',8900000.00,12,'ACTIVE'),(10,5,'Nồi chiên không dầu Philips',3200000.00,35,'ACTIVE'),(11,6,'Sách Clean Code tiếng Việt',250000.00,150,'ACTIVE');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_product_price_audit` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
    IF OLD.price <> NEW.price THEN
        INSERT INTO audit_logs (product_id, old_price, new_price, changed_at)
        VALUES (OLD.product_id, OLD.price, NEW.price, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `review_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `fk_reviews_customers` (`customer_id`),
  KEY `fk_reviews_products` (`product_id`),
  CONSTRAINT `fk_reviews_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reviews_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,5,'Máy dùng rất mượt, viền titan nhẹ hơn đời trước nhiều.','2026-10-11 16:04:54'),(2,1,5,4,'Chuột cầm êm tay, cuộn vô cực rất thích.','2026-10-11 16:04:54'),(3,2,3,5,'MacBook pin cực trâu, hoàn thiện xuất sắc.','2026-10-11 16:04:54'),(4,3,5,5,'Đáng giá từng xu cho dân văn phòng.','2026-10-11 16:04:54'),(5,3,6,4,'Bàn phím gõ nảy nhưng switch hơi ồn.','2026-10-11 16:04:54'),(6,4,2,5,'Màn hình hiển thị chống chói cực đỉnh.','2026-10-11 16:04:54'),(7,7,11,5,'Sách gối đầu giường cho mọi lập trình viên.','2026-10-11 16:04:54'),(8,8,9,5,'Chất âm loa Marshall ấm và chi tiết, decor phòng rất đẹp.','2026-10-11 16:04:54'),(9,9,5,4,'Dùng tốt trên macOS.','2026-10-11 16:04:54');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_order_summary`
--

DROP TABLE IF EXISTS `view_order_summary`;
/*!50001 DROP VIEW IF EXISTS `view_order_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_order_summary` AS SELECT 
 1 AS `order_id`,
 1 AS `customer_name`,
 1 AS `email`,
 1 AS `order_date`,
 1 AS `order_status`,
 1 AS `total_amount`,
 1 AS `payment_method`,
 1 AS `payment_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'ecommerce_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_order`(
    IN p_customer_id INT,
    IN p_product_id INT,
    IN p_quantity INT,
    OUT p_order_id INT
)
BEGIN
    DECLARE v_price DECIMAL(12, 2);
    DECLARE v_stock INT;
    DECLARE v_total DECIMAL(12, 2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT price, stock_quantity INTO v_price, v_stock 
    FROM products WHERE product_id = p_product_id FOR UPDATE;

    IF v_stock < p_quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khong du so luong san pham trong kho!';
    END IF;

    SET v_total = v_price * p_quantity;

    INSERT INTO orders (customer_id, total_amount, order_status)
    VALUES (p_customer_id, v_total, 'PROCESSING');
    
    SET p_order_id = LAST_INSERT_ID();

    INSERT INTO order_items (order_id, product_id, quantity, unit_price)
    VALUES (p_order_id, p_product_id, p_quantity, v_price);

    UPDATE products 
    SET stock_quantity = stock_quantity - p_quantity 
    WHERE product_id = p_product_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_order_summary`
--

/*!50001 DROP VIEW IF EXISTS `view_order_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_order_summary` AS select `o`.`order_id` AS `order_id`,`c`.`full_name` AS `customer_name`,`c`.`email` AS `email`,`o`.`order_date` AS `order_date`,`o`.`order_status` AS `order_status`,`o`.`total_amount` AS `total_amount`,`p`.`payment_method` AS `payment_method`,`p`.`payment_status` AS `payment_status` from ((`orders` `o` join `customers` `c` on((`o`.`customer_id` = `c`.`customer_id`))) left join `payments` `p` on((`o`.`order_id` = `p`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-11 23:07:56
