-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2022 at 07:28 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realestatephp`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `title`, `content`, `image`) VALUES
(10, 'About Us', '<div id=\"pgc-w5d0dcc3394ac1-0-0\" class=\"panel-grid-cell\">\r\n<div id=\"panel-w5d0dcc3394ac1-0-0-0\" class=\"so-panel widget widget_sow-editor panel-first-child panel-last-child\" data-index=\"0\">\r\n<div class=\"so-widget-sow-editor so-widget-sow-editor-base\">\r\n<div class=\"siteorigin-widget-tinymce textwidget\">\r\n<p class=\"text_all_p_tag_css\">This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project.</p>\r\n<p class=\"text_all_p_tag_css\">This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project. (codeastro.com). This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project.</p>\r\n<div id=\"pgc-w5d0dcc3394ac1-0-0\" class=\"panel-grid-cell\">\r\n<div id=\"panel-w5d0dcc3394ac1-0-0-0\" class=\"so-panel widget widget_sow-editor panel-first-child panel-last-child\" data-index=\"0\">\r\n<div class=\"so-widget-sow-editor so-widget-sow-editor-base\">\r\n<div class=\"siteorigin-widget-tinymce textwidget\">\r\n<p class=\"text_all_p_tag_css\">This is a demo about us page for this project. This is a demo about us page for this project. This is a demo about us page for this project.</p>\r\n<p class=\"text_all_p_tag_css\">This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project. (codeastro.com) This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.This is a demo about us page for this project.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'condos-pool.png');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aid` int(10) NOT NULL,
  `auser` varchar(50) NOT NULL,
  `aemail` varchar(50) NOT NULL,
  `apass` varchar(50) NOT NULL,
  `adob` date NOT NULL,
  `aphone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `auser`, `aemail`, `apass`, `adob`, `aphone`) VALUES
(9, 'admin', 'admin@gmail.com', '6812f136d636e737248d365016f8cfd5139e387c', '1994-12-06', '1470002569');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cid` int(50) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `sid` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cid`, `cname`, `sid`) VALUES
(9, 'Olisphis', 3),
(10, 'Alegas', 2),
(11, 'Floson', 2),
(12, 'Ulmore', 7),
(13, 'Awrerton', 15);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `cid` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`cid`, `name`, `email`, `phone`, `subject`, `message`) VALUES
(7, 'codeastro', 'asda@asd.com', '8888885454', 'codeastro.com', 'asdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(50) NOT NULL,
  `uid` int(50) NOT NULL,
  `fdescription` varchar(300) NOT NULL,
  `status` int(1) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `uid`, `fdescription`, `status`, `date`) VALUES
(7, 28, 'This is a demo feedback in order to use set it as Testimonial for the site. Just a simply dummy text rather than using lorem ipsum text lines.', 1, '2022-07-23 16:07:08'),
(8, 33, 'This is great. This is just great. Hmmm, just a dummy text for users feedback.', 1, '2022-07-23 21:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `pid` int(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `pcontent` longtext NOT NULL,
  `type` varchar(100) NOT NULL,
  `bhk` varchar(50) NOT NULL,
  `stype` varchar(100) NOT NULL,
  `bedroom` int(50) NOT NULL,
  `bathroom` int(50) NOT NULL,
  `balcony` int(50) NOT NULL,
  `kitchen` int(50) NOT NULL,
  `hall` int(50) NOT NULL,
  `floor` varchar(50) NOT NULL,
  `size` int(50) NOT NULL,
  `price` int(50) NOT NULL,
  `location` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `feature` longtext NOT NULL,
  `pimage` varchar(300) NOT NULL,
  `pimage1` varchar(300) NOT NULL,
  `pimage2` varchar(300) NOT NULL,
  `pimage3` varchar(300) NOT NULL,
  `pimage4` varchar(300) NOT NULL,
  `uid` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `mapimage` varchar(300) NOT NULL,
  `topmapimage` varchar(300) NOT NULL,
  `groundmapimage` varchar(300) NOT NULL,
  `totalfloor` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isFeatured` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`pid`, `title`, `pcontent`, `type`, `bhk`, `stype`, `bedroom`, `bathroom`, `balcony`, `kitchen`, `hall`, `floor`, `size`, `price`, `location`, `city`, `state`, `feature`, `pimage`, `pimage1`, `pimage2`, `pimage3`, `pimage4`, `uid`, `status`, `mapimage`, `topmapimage`, `groundmapimage`, `totalfloor`, `date`, `isFeatured`) VALUES
(25, 'Zills Home', '', 'house', '4 BHK', 'sale', 4, 2, 0, 1, 1, '2nd Floor', 1869, 219690, '39 Bailey Drive', 'Floson', 'Colotana', '<p>&nbsp;</p>\r\n<!---feature area start--->\r\n<div class=\"col-md-4\">\r\n<ul>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Property Age : </span>10 Years</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Swiming Pool : </span>Yes</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Parking : </span>Yes</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">GYM : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class=\"col-md-4\">\r\n<ul>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Type : </span>Appartment</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Security : </span>Yes</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Dining Capacity : </span>10 People</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Church/Temple : </span>Yes</li>\r\n</ul>\r\n</div>\r\n<div class=\"col-md-4\">\r\n<ul>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">3rd Party : </span>No</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Elevator : </span>Yes</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">CCTV : </span>Yes</li>\r\n<li class=\"mb-3\"><span class=\"text-secondary font-weight-bold\">Water Supply : </span>Ground Water / Tank</li>\r\n</ul>\r\n</div>\r\n<!---feature area end---->\r\n<p>&nbsp;</p>', 'zillhms1.jpg', 'zillhms2.jpg', 'zillhms3.jpg', 'zillhms4.jpg', 'zillhms5.jpg', 30, 'available', 'floorplan_sample.jpg', 'zillhms7.jpg', 'zillhms6.jpg', '2 Floor', '2022-07-22 22:29:20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `sid` int(50) NOT NULL,
  `sname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`sid`, `sname`) VALUES
(2, 'Colotana'),
(3, 'Floaii'),
(4, 'Virconsin'),
(7, 'West Misstana\n\n'),
(9, 'New Pennrk\n\n'),
(10, 'Louiswa\n\n'),
(15, 'Wisginia\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(50) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `uemail` varchar(100) NOT NULL,
  `uphone` varchar(20) NOT NULL,
  `upass` varchar(50) NOT NULL,
  `utype` varchar(50) NOT NULL,
  `uimage` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `uemail`, `uphone`, `upass`, `utype`, `uimage`) VALUES
(28, 'Aditi Singh', 'christine@mail.com', '7777444455', '6812f136d636e737248d365016f8cfd5139e387c', 'user', 'gr7.png'),
(29, 'Priya Sharma', 'howarda@mail.com', '7775552214', '6812f136d636e737248d365016f8cfd5139e387c', 'agent', 'avatarm2-min.jpg'),
(30, 'Rohan Gupta', 'thomas@mail.com', '7896665555', '6812f136d636e737248d365016f8cfd5139e387c', 'user', 'avatarm7-min.jpg'),
(31, 'Rahul Verma', 'moore@mail.com', '7896547855', '6812f136d636e737248d365016f8cfd5139e387c', 'agent', 'user-default-3-min.png'),
(32, 'Arjun Mehta', 'carl@mail.com', '1458887969', '6812f136d636e737248d365016f8cfd5139e387c', 'agent', 'user-profile-min.png'),
(33, 'Neha Kapoor', 'noah@mail.com', '7965555544', '6812f136d636e737248d365016f8cfd5139e387c', 'user', 'usersys-min.png'),
(34, 'Vikram Patel', 'fred@mail.com', '7850002587', '6812f136d636e737248d365016f8cfd5139e387c', 'builder', 'user-a-min.png'),
(35, 'Aman Kumar', 'michael@mail.com', '8542221140', '6812f136d636e737248d365016f8cfd5139e387c', 'user', 'usric.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `cid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `pid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `sid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

-- --------------------------------------------------------
-- Bookings and India-focused starter inventory
--
CREATE TABLE `bookings` (
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

INSERT INTO `state` (`sid`,`sname`) VALUES
(16,'Maharashtra'),(17,'Karnataka'),(18,'Haryana'),(19,'Telangana'),(20,'Tamil Nadu');
INSERT INTO `city` (`cid`,`cname`,`sid`) VALUES
(14,'Mumbai',16),(15,'Pune',16),(16,'Bengaluru',17),(17,'Gurugram',18),(18,'Hyderabad',19),(19,'Chennai',20);

INSERT INTO `property` (`pid`,`title`,`pcontent`,`type`,`bhk`,`stype`,`bedroom`,`bathroom`,`balcony`,`kitchen`,`hall`,`floor`,`size`,`price`,`location`,`city`,`state`,`feature`,`pimage`,`pimage1`,`pimage2`,`pimage3`,`pimage4`,`uid`,`status`,`mapimage`,`topmapimage`,`groundmapimage`,`totalfloor`,`isFeatured`) VALUES
(30,'Sea View Residence','Premium apartment close to the waterfront with modern amenities.','apartment','3 BHK','sale',3,3,2,1,1,'12th Floor',1450,18500000,'Worli','Mumbai','Maharashtra','<p>24x7 security, parking, gym and swimming pool.</p>','zillhms1.jpg','zillhms2.jpg','zillhms3.jpg','zillhms4.jpg','zillhms5.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','22 Floors',1),
(31,'Green Park Villa','Independent family villa in a calm, green neighbourhood.','house','4 BHK','sale',4,4,2,1,2,'Ground Floor',2600,14500000,'Golf Course Extension Road','Gurugram','Haryana','<p>Gated community, garden, car parking and power backup.</p>','zillhms2.jpg','zillhms3.jpg','zillhms4.jpg','zillhms5.jpg','zillhms1.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','2 Floors',1),
(32,'Tech Park Heights','Well-connected apartment near major IT hubs.','apartment','2 BHK','sale',2,2,1,1,1,'8th Floor',1120,9200000,'Whitefield','Bengaluru','Karnataka','<p>Metro access, clubhouse, lift and covered parking.</p>','zillhms3.jpg','zillhms4.jpg','zillhms5.jpg','zillhms1.jpg','zillhms2.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','18 Floors',0),
(33,'Riverside Homes','Spacious home with landscaped community areas.','apartment','3 BHK','sale',3,3,2,1,1,'6th Floor',1560,8800000,'Gachibowli','Hyderabad','Telangana','<p>Security, children play area, gym and visitor parking.</p>','zillhms4.jpg','zillhms5.jpg','zillhms1.jpg','zillhms2.jpg','zillhms3.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','14 Floors',1),
(34,'Lakeview Enclave','Ready-to-move family apartment near the city centre.','apartment','2 BHK','sale',2,2,1,1,1,'5th Floor',1050,7500000,'Kharadi','Pune','Maharashtra','<p>Gated entry, lift, CCTV and dedicated parking.</p>','zillhms5.jpg','zillhms1.jpg','zillhms2.jpg','zillhms3.jpg','zillhms4.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','12 Floors',0),
(35,'Marina Gardens','Contemporary apartment with excellent connectivity.','apartment','2 BHK','sale',2,2,1,1,1,'10th Floor',1180,6800000,'OMR','Chennai','Tamil Nadu','<p>Clubhouse, rainwater harvesting, security and parking.</p>','zillhms1.jpg','zillhms3.jpg','zillhms5.jpg','zillhms2.jpg','zillhms4.jpg',29,'available','floorplan_sample.jpg','zillhms7.jpg','zillhms6.jpg','16 Floors',0);
ALTER TABLE `property` MODIFY `pid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
ALTER TABLE `state` MODIFY `sid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
ALTER TABLE `city` MODIFY `cid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
UPDATE `about` SET `title`='About Vaibhav Real Estate', `content`='<p>Vaibhav Real Estate is a modern property platform built to make buying and reserving a home simpler for everyone.</p><p>We bring verified residential listings from growing Indian cities together with transparent prices, detailed property information and trusted agent support.</p><p>Browse homes, compare options and reserve an available property online with a secure Razorpay token payment.</p><h4>Why choose us?</h4><ul><li>Indian listings with clear pricing</li><li>Easy city and property search</li><li>Secure online booking and payment verification</li><li>Helpful agents and a simple customer journey</li></ul>' WHERE `id`=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
