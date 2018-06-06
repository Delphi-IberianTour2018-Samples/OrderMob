BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `products` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`lockid`	INTEGER NOT NULL,
	`code`	varchar ( 20 ),
	`description`	TEXT,
	`price`	DECIMAL ( 9 , 2 ),
	`created_at`	[datetime],
	`updated_at`	[datetime]
);
INSERT INTO `products` VALUES (1,1,'A0001','Articulo 001
Fantastico producto',100,'2017-06-15 19:01:40.374','2018-06-06 19:01:15.797');
INSERT INTO `products` VALUES (2,3,'A0002','Segundo articulo',200,'2018-03-01 11:28:50.508','2018-06-06 19:01:58.264');
INSERT INTO `products` VALUES (3,1,'A0003',NULL,300,'2018-06-06 19:02:20.281','2018-06-06 19:02:48.553');
INSERT INTO `products` VALUES (4,0,'A0004',NULL,4000,'2018-06-06 19:02:32.881','2018-06-06 19:02:32.881');
CREATE TABLE IF NOT EXISTS `orders` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`lockid`	INTEGER NOT NULL,
	`company_id`	INTEGER,
	`status`	INTEGER,
	`number`	varchar ( 15 ),
	`reference`	varchar ( 15 ),
	`total`	DECIMAL ( 9 , 2 ),
	`note`	TEXT,
	`created_at`	[datetime],
	`updated_at`	[datetime]
);
INSERT INTO `orders` VALUES (1,14,1,NULL,'0001','DAN-0001',400,'Un pedido de prueba','2017-06-15 19:40:39.702','2018-06-06 19:06:26.669');
INSERT INTO `orders` VALUES (2,5,2,NULL,'0002','ALE-0001',800,NULL,'2017-06-16 10:16:40.629','2018-06-06 19:06:07.196');
INSERT INTO `orders` VALUES (3,1,3,NULL,'0003','ACM-0003',4000,NULL,'2018-06-06 19:07:20.197','2018-06-06 19:07:54.465');
CREATE TABLE IF NOT EXISTS `order_items` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`lockid`	INTEGER NOT NULL,
	`order_id`	INTEGER,
	`product_id`	INTEGER,
	`quantity`	DECIMAL ( 9 , 2 ),
	`price`	DECIMAL ( 9 , 2 ),
	`total`	DECIMAL ( 9 , 2 ),
	`created_at`	[datetime],
	`updated_at`	[datetime]
);
INSERT INTO `order_items` VALUES (1,3,1,2,2,200,NULL,'2017-06-15 19:43:07.521','2018-03-01 11:29:01.974');
INSERT INTO `order_items` VALUES (2,1,2,1,2,100,200,'2018-06-06 19:04:11.985','2018-06-06 19:04:21.345');
INSERT INTO `order_items` VALUES (3,0,2,2,3,200,600,'2018-06-06 19:05:25.112','2018-06-06 19:05:25.112');
INSERT INTO `order_items` VALUES (4,0,3,4,1,4000,4000,'2018-06-06 19:07:50.012','2018-06-06 19:07:50.012');
CREATE TABLE IF NOT EXISTS `companies` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`lockid`	INTEGER NOT NULL,
	`code`	varchar ( 20 ),
	`name`	varchar ( 30 ),
	`nif`	varchar ( 16 ),
	`street`	varchar ( 30 ),
	`zipcode`	varchar ( 10 ),
	`city`	varchar ( 30 ),
	`state`	varchar ( 30 ),
	`country`	varchar ( 30 ),
	`email`	varchar ( 40 ),
	`phone`	varchar ( 16 ),
	`created_at`	[datetime],
	`updated_at`	[datetime]
);
INSERT INTO `companies` VALUES (1,13,'0001','Danysoft S. L.','111111','Calle 1',NULL,NULL,NULL,NULL,NULL,NULL,'2017-06-15 19:01:01.370','2018-06-06 19:13:01.750');
INSERT INTO `companies` VALUES (2,7,'0002','Aledit S. L.','222222','Calle 2',NULL,NULL,NULL,NULL,NULL,NULL,'2017-06-16 10:13:37.521','2018-06-06 19:13:10.188');
INSERT INTO `companies` VALUES (3,3,'003','ACME Limited','333333','Calle 3',NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-27 13:27:21.986','2018-06-06 19:13:22.394');
COMMIT;
