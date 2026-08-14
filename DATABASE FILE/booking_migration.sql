-- Run this once on an existing `realestatephp` database.
CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `property_price` int(50) NOT NULL,
  `booking_amount` int(50) NOT NULL COMMENT 'Amount in paise',
  `razorpay_order_id` varchar(100) NOT NULL,
  `razorpay_payment_id` varchar(100) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL,
  `payment_status` varchar(30) NOT NULL DEFAULT 'created',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid_at` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `razorpay_order_id` (`razorpay_order_id`),
  KEY `booking_user` (`user_id`),
  KEY `booking_property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO `state` (`sid`,`sname`) VALUES
(16,'Maharashtra'),(17,'Karnataka'),(18,'Haryana'),(19,'Telangana'),(20,'Tamil Nadu');
INSERT IGNORE INTO `city` (`cid`,`cname`,`sid`) VALUES
(14,'Mumbai',16),(15,'Pune',16),(16,'Bengaluru',17),(17,'Gurugram',18),(18,'Hyderabad',19),(19,'Chennai',20);

INSERT IGNORE INTO `property` (`pid`,`title`,`pcontent`,`type`,`bhk`,`stype`,`bedroom`,`bathroom`,`balcony`,`kitchen`,`hall`,`floor`,`size`,`price`,`location`,`city`,`state`,`feature`,`pimage`,`pimage1`,`pimage2`,`pimage3`,`pimage4`,`uid`,`status`,`mapimage`,`topmapimage`,`groundmapimage`,`totalfloor`,`isFeatured`) VALUES
(30,'Sea View Residence','Premium apartment close to the waterfront with modern amenities.','apartment','3 BHK','sale',3,3,2,1,1,'12th Floor',1450,18500000,'Worli','Mumbai','Maharashtra','<p>24x7 security, parking, gym and swimming pool.</p>','zillhms1.jpg','zillhms2.jpg','zillhms3.jpg','zillhms4.jpg','zillhms5.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','22 Floors',1),
(31,'Green Park Villa','Independent family villa in a calm, green neighbourhood.','house','4 BHK','sale',4,4,2,1,2,'Ground Floor',2600,14500000,'Golf Course Extension Road','Gurugram','Haryana','<p>Gated community, garden, car parking and power backup.</p>','zillhms2.jpg','zillhms3.jpg','zillhms4.jpg','zillhms5.jpg','zillhms1.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','2 Floors',1),
(32,'Tech Park Heights','Well-connected apartment near major IT hubs.','apartment','2 BHK','sale',2,2,1,1,1,'8th Floor',1120,9200000,'Whitefield','Bengaluru','Karnataka','<p>Metro access, clubhouse, lift and covered parking.</p>','zillhms3.jpg','zillhms4.jpg','zillhms5.jpg','zillhms1.jpg','zillhms2.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','18 Floors',0),
(33,'Riverside Homes','Spacious home with landscaped community areas.','apartment','3 BHK','sale',3,3,2,1,1,'6th Floor',1560,8800000,'Gachibowli','Hyderabad','Telangana','<p>Security, children play area, gym and visitor parking.</p>','zillhms4.jpg','zillhms5.jpg','zillhms1.jpg','zillhms2.jpg','zillhms3.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','14 Floors',1),
(34,'Lakeview Enclave','Ready-to-move family apartment near the city centre.','apartment','2 BHK','sale',2,2,1,1,1,'5th Floor',1050,7500000,'Kharadi','Pune','Maharashtra','<p>Gated entry, lift, CCTV and dedicated parking.</p>','zillhms5.jpg','zillhms1.jpg','zillhms2.jpg','zillhms3.jpg','zillhms4.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','12 Floors',0),
(35,'Marina Gardens','Contemporary apartment with excellent connectivity.','apartment','2 BHK','sale',2,2,1,1,1,'10th Floor',1180,6800000,'OMR','Chennai','Tamil Nadu','<p>Clubhouse, rainwater harvesting, security and parking.</p>','zillhms1.jpg','zillhms3.jpg','zillhms5.jpg','zillhms2.jpg','zillhms4.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','16 Floors',0);
