-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2021 at 02:43 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opfa`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'EgtWJV7X1OF9gjbw9KwpxlV0XmQ9Hfe91m2IEMswmtx3h6OHpz9ycy1r5eopHWvuqYP69I5CXDpzZwYHVoApRCItYVQSZdcyYsGhes50mUbuiq3GpM9ma0nwxKtSygnWPVeGm0t2voKwMqi5Ztaz7ZI85HQJDI183zWaF2eRKTSzCVqVxZ93eaJBm3rentOWoLeY3TMP8mTkC0ZarkRdksU8uBZOrmt1IEGXH2l3mhlgegtU6y9rls4ruJrlDuRv', 1, '2021-02-07 08:07:09', '2021-02-07 08:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `session_id`, `ip`, `date_added`, `date_modified`) VALUES
(1, 1, '241fccc97da631afdff0795080', '127.0.0.1', '2021-02-07 10:26:29', '2021-02-07 10:26:29'),
(2, 1, '4783926d718153a8b63b748632', '127.0.0.1', '2021-02-07 10:26:36', '2021-02-07 10:26:36'),
(3, 1, 'f0010ff26df64da48025289a23', '127.0.0.1', '2021-02-07 10:26:45', '2021-02-07 10:26:56'),
(4, 1, '520f1393aff8f6732303931f07', '127.0.0.1', '2021-02-07 10:26:56', '2021-02-07 10:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(3, 1, 'Clockspeed'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(1, 2, 'توضیحات'),
(2, 2, 'تعداد هسته ها'),
(3, 2, 'کلاک اسپید'),
(4, 2, 'تست 1'),
(5, 2, 'تست 2'),
(6, 2, 'تست 3'),
(7, 2, 'تست 4'),
(8, 2, 'تست 5'),
(9, 2, 'تست 6'),
(10, 2, 'تست 7'),
(11, 2, 'تست 8');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'حافظه'),
(4, 2, 'تکنیکی'),
(5, 2, 'مادربرد'),
(6, 2, 'پردازنده');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(7, 'اسلایدشو صفحه اصلی', 1),
(8, 'تولیدکنندگان', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(34, 7, 2, 'لنوو تبلت', 'index.php?route=product/product&amp;path=62_60&amp;product_id=139', 'catalog/demo/product/30ec30abdb9c9a44fac212673e3615eaedb3102e_1605048000.jpg', 0),
(3, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(4, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(5, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(6, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(7, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(8, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(9, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(10, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(11, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(33, 7, 2, 'لنوو تبلت', 'index.php?route=product/product&amp;path=62_60&amp;product_id=146', 'catalog/demo/product/2128570.jpg', 0),
(13, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(14, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(31, 7, 2, 'اپل تبلت', 'index.php?route=product/product&amp;path=62_60&amp;product_id=135', 'catalog/demo/product/121463586.jpg', 0),
(32, 7, 2, 'لنوو تبلت', 'index.php?route=product/product&amp;path=62_60&amp;product_id=131', 'catalog/demo/product/113717411.jpg', 0),
(17, 8, 2, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(18, 8, 2, 'ردبول', '', 'catalog/demo/manufacturer/redbull.png', 0),
(19, 8, 2, 'سونی', '', 'catalog/demo/manufacturer/sony.png', 0),
(20, 8, 2, 'کوکا کولا', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(21, 8, 2, 'برگر پادشاه', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(22, 8, 2, 'کانون', '', 'catalog/demo/manufacturer/canon.png', 0),
(23, 8, 2, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(24, 8, 2, 'دل', '', 'catalog/demo/manufacturer/dell.png', 0),
(25, 8, 2, 'دیزنی', '', 'catalog/demo/manufacturer/disney.png', 0),
(27, 8, 2, 'استار باکس', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(28, 8, 2, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(69, '', 0, 1, 1, 0, 1, '2021-02-23 08:12:22', '2021-02-23 08:15:46'),
(60, '', 62, 1, 1, 1, 1, '2021-02-16 14:47:03', '2021-02-17 14:50:27'),
(70, '', 69, 0, 1, 0, 1, '2021-02-23 08:12:54', '2021-02-23 08:16:06'),
(62, '', 0, 1, 1, 0, 1, '2021-02-16 14:49:36', '2021-02-17 14:49:09'),
(71, '', 60, 0, 1, 0, 1, '2021-02-28 07:46:05', '2021-02-28 07:46:05'),
(72, '', 71, 0, 1, 0, 1, '2021-02-28 07:46:20', '2021-02-28 07:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(69, 2, 'پوشاک', '', 'پوشاک', '', ''),
(70, 2, 'تی شرت مردانه', '', 'تی شرت مردانه', '', ''),
(71, 2, 'لوازم جانبی تبلت', '', 'لوازم جانبی تبلت', '', ''),
(60, 2, 'تبلت', '&lt;p&gt;توضیحات دسته بندی تبلت اینجا قرار میگیرد&lt;br&gt;&lt;/p&gt;', 'تبلت', 'توضیحات متا تگ تبلت', 'تبلت'),
(72, 2, 'زیر دسته لوازم جانبی تبلت', '', 'زیر دسته لوازم جانبی تبلت', '', ''),
(62, 2, 'کالای دیجیتال', '&lt;p&gt;توضیحات دسته بندی کالای دیجیتال اینجا قرار میگیرد&lt;br&gt;&lt;br&gt;&lt;/p&gt;', 'کالای دیجیتال', 'توضیحات متا تگ کالای دیجیتال', 'کالای دیجیتال');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_filter`
--

INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES
(60, 9),
(60, 10),
(60, 26),
(60, 27),
(60, 28),
(60, 30),
(60, 41),
(60, 63),
(60, 72),
(60, 73),
(60, 74),
(60, 75),
(60, 76),
(60, 77),
(62, 9),
(62, 10),
(62, 26),
(62, 27),
(62, 28),
(62, 30),
(62, 40),
(62, 41),
(62, 63),
(62, 72),
(62, 73),
(62, 74),
(62, 75),
(62, 76),
(62, 77),
(69, 26),
(69, 27),
(69, 63),
(69, 78),
(69, 79),
(69, 80),
(69, 81),
(69, 82),
(69, 83),
(70, 26),
(70, 27),
(70, 63),
(70, 78),
(70, 79),
(70, 80),
(70, 81),
(70, 82),
(70, 83);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(71, 60, 1),
(69, 69, 0),
(70, 70, 1),
(60, 62, 0),
(62, 62, 0),
(71, 62, 0),
(60, 60, 1),
(70, 69, 0),
(72, 62, 0),
(72, 60, 1),
(71, 71, 2),
(72, 72, 3),
(72, 71, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(62, 0, 0),
(60, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(60, 0),
(62, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(101, 'ایران', 'IR', 'IRN', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'ریال', 'RLS', '', 'ریال', '', 10.00000000, 1, '2017-07-24 06:25:47'),
(2, 'تومان', 'TOM', '', 'تومان', '', 1.00000000, 1, '2017-07-24 06:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text DEFAULT NULL,
  `wishlist` text DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_affiliate`
--

CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT 0.00,
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_approval`
--

CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 2, 'پیش فرض', 'تست');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, '09912661040', '::1', 1, '2021-02-07 09:07:56', '2021-02-07 09:07:56'),
(2, 'admin', '127.0.0.1', 1, '2021-02-07 09:28:36', '2021-02-07 09:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_online`
--

INSERT INTO `oc_customer_online` (`ip`, `customer_id`, `url`, `referer`, `date_added`) VALUES
('127.0.0.1', 0, 'http://localhost/opfa/index.php?route=common/home', 'http://localhost/opfa/index.php?route=product/product&amp;product_id=218', '2021-02-28 09:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_search`
--

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'captcha', 'basic'),
(2, 'module', 'banner'),
(3, 'module', 'carousel'),
(4, 'module', 'category'),
(5, 'module', 'account'),
(6, 'module', 'featured'),
(7, 'module', 'latest'),
(8, 'module', 'slideshow'),
(9, 'payment', 'cod'),
(10, 'payment', 'free_checkout'),
(11, 'shipping', 'citylink'),
(12, 'shipping', 'flat'),
(13, 'shipping', 'item'),
(14, 'shipping', 'parcelforce_48'),
(15, 'shipping', 'weight'),
(16, 'theme', 'default'),
(17, 'total', 'shipping'),
(18, 'total', 'sub_total'),
(19, 'total', 'tax'),
(20, 'total', 'total'),
(21, 'total', 'credit'),
(22, 'total', 'handling'),
(23, 'total', 'low_order_fee'),
(24, 'total', 'coupon'),
(25, 'total', 'reward'),
(26, 'total', 'voucher'),
(27, 'dashboard', 'activity'),
(28, 'dashboard', 'sale'),
(29, 'dashboard', 'recent'),
(30, 'dashboard', 'order'),
(31, 'dashboard', 'online'),
(32, 'dashboard', 'map'),
(33, 'dashboard', 'customer'),
(34, 'dashboard', 'chart'),
(35, 'report', 'sale_coupon'),
(36, 'report', 'customer_search'),
(37, 'report', 'customer_transaction'),
(38, 'report', 'product_purchased'),
(39, 'report', 'product_viewed'),
(40, 'report', 'sale_return'),
(41, 'report', 'sale_order'),
(42, 'report', 'sale_shipping'),
(43, 'report', 'sale_tax'),
(44, 'report', 'customer_activity'),
(45, 'report', 'customer_order'),
(46, 'report', 'customer_reward');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_install`
--

CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_path`
--

CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(9, 4, 0),
(10, 4, 0),
(83, 8, 0),
(82, 8, 0),
(81, 8, 0),
(80, 8, 0),
(28, 5, 0),
(30, 5, 0),
(78, 5, 0),
(79, 5, 0),
(63, 1, 0),
(27, 1, 0),
(26, 1, 0),
(75, 6, 0),
(74, 6, 0),
(73, 6, 0),
(72, 6, 0),
(76, 7, 0),
(77, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(9, 2, 4, 'پلاستیکی'),
(10, 2, 4, 'فلزی'),
(83, 2, 8, 'XXL'),
(82, 2, 8, 'XL'),
(81, 2, 8, 'L'),
(80, 2, 8, 'M'),
(28, 2, 5, 'سامسونگ'),
(30, 2, 5, 'اپل'),
(79, 2, 5, 'ویلسون'),
(78, 2, 5, 'ال سی وایکیکی'),
(63, 2, 1, 'ابی'),
(27, 2, 1, 'قرمز'),
(26, 2, 1, 'سبز'),
(75, 2, 6, '8'),
(74, 2, 6, '64'),
(73, 2, 6, '32'),
(72, 2, 6, '16'),
(76, 2, 7, 'intel'),
(77, 2, 7, 'amd');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 0),
(5, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 2, 'رنگ'),
(4, 2, 'جنس بدنه'),
(5, 2, 'برند'),
(6, 2, 'رم'),
(7, 2, 'پردازنده'),
(8, 2, 'سایز');

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'مناطق مالیاتی ایران', 'مناطق مالیاتی', '2017-07-05 23:26:25', '2017-07-05 05:47:24'),
(4, 'حمل و نقل ایران', 'کلیه مناطق جمهوری اسلامی ایران', '2017-07-05 01:14:53', '2017-07-05 05:46:41'),
(5, 'منطقه پستی تهران', 'منطقه پستی صرفا تهران', '2017-07-05 06:41:28', '2017-07-05 06:25:28'),
(6, 'منطقه پستی البرز', 'منطقه پستی صرفا البرز', '2017-07-05 06:42:04', '2017-07-05 06:25:28'),
(7, 'منطقه پستی اصفهان', 'منطقه پستی صرفا اصفهان', '2017-07-05 06:42:32', '2017-07-05 06:25:28'),
(8, 'منطقه پستی خراسان رضوی', 'منطقه پستی صرفا خراسان رضوی', '2017-07-05 06:43:08', '2017-07-05 06:25:28'),
(9, 'منطقه پستی فارس', 'منطقه پستی صرفا فارس', '2017-07-05 06:44:05', '2017-07-05 06:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(4, 1, 'About Us', '&lt;p&gt;&lt;br&gt;	&lt;/p&gt;&lt;p&gt;You Can Write Here About Your Store.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;All Right Of Translation To persian Reserved By &lt;a href=&quot;http://www.opencartfarsi.com&quot; target=&quot;_blank&quot;&gt;OpenCartFarsi.Com&lt;/a&gt; .&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'About Your Shop', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(3, 2, 'شرایط عضویت', '&lt;p&gt;\r\n	شرایط عضویت در فروشگاه&lt;/p&gt;\r\n', 'شرایط عضویت فروشگاه', '', ''),
(4, 2, 'درباره ما', '&lt;p&gt;&lt;br&gt;	&lt;/p&gt;&lt;p&gt;در این قسمت می توانید درباره خودتان بنویسید.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;تمامی حقوق فارسی سازی این فروشگاه ساز برای &lt;a href=&quot;http://www.opencartfarsi.com&quot; target=&quot;_blank&quot;&gt;اپن کارت فارسی دات کام&lt;/a&gt; محفوظ می باشد.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'درباره فروشگاه ما', '', ''),
(5, 2, 'شرایط خرید', '&lt;p&gt;\r\n	شرایط خرید از فروشگاه&lt;/p&gt;\r\n', 'شرایط خرید فروشگاه', '', ''),
(6, 2, 'راهنمای خرید', '&lt;p&gt;\r\n	راهنمای خرید از فروشگاه&lt;/p&gt;\r\n', 'راهنمای خرید فروشگاه', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(2, 'فارسی', 'fa-ir', 'fa-IR,fa_IR.UTF-8,fa_IR,fa-ir,persian', 'ir.png', 'persian', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'صفحه اصلی (Home)'),
(2, 'محصول (Product)'),
(3, 'دسته بندی (Category)'),
(4, 'پیش فرض (Default)'),
(5, 'تولیدکنندگان (Manufacturer)'),
(6, 'حساب کاربری (Account)'),
(7, 'تسویه حساب (Checkout)'),
(8, 'تماس با ما (Contact)'),
(9, 'نقشه سایت (Sitemap)'),
(10, 'بازاریابی (Affiliate)'),
(11, 'اطلاعات (Information)'),
(12, 'مقایسه (Compare)'),
(13, 'جستجو (Search)'),
(14, 'ویژه ها (Special)'),
(15, 'پرداخت ها (Payment CallBack)');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(1, 1, 'slideshow.1', 'content_top', 1),
(2, 1, 'latest.2', 'content_top', 2),
(3, 1, 'featured.3', 'content_top', 2),
(4, 1, 'carousel.4', 'content_top', 3),
(9, 3, 'category', 'column_right', 1),
(7, 10, 'account', 'column_right', 1),
(8, 6, 'account', 'column_right', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(1, 1, 0, 'common/home'),
(2, 2, 0, 'product/product'),
(16, 3, 0, 'product/category'),
(4, 4, 0, ''),
(5, 5, 0, 'product/manufacturer/%'),
(6, 6, 0, 'account/%'),
(7, 7, 0, 'checkout/%'),
(8, 8, 0, 'information/contact'),
(9, 9, 0, 'information/sitemap'),
(10, 10, 0, 'affiliate/%'),
(11, 11, 0, 'information/information'),
(12, 12, 0, 'product/compare'),
(13, 13, 0, 'product/search'),
(14, 14, 0, 'product/special'),
(15, 15, 0, 'extension/payment/%');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'سانتی متر', 'cm'),
(2, 2, 'میلی متر', 'mm'),
(3, 2, 'اینچ', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(13, 'اپل', '', 0),
(14, 'ایسوس', '', 0),
(11, 'سامسونگ', '', 0),
(12, 'لنوو', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(11, 0),
(12, 0),
(13, 0),
(14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 0, 'OpenCartFarsi Shamsi Date V3.0.2.0', 'OpenCartFarsi_Shamsi_Date', 'Mojtaba Moghani - wWw.Open-Cart.ir', '3.8.2', 'https://www.opencartfarsi.ir', '<?xml version=\"1.0\" encoding=\"UTF-8\"?><modification><name>OpenCartFarsi Shamsi Date V3.0.2.0</name><code>OpenCartFarsi_Shamsi_Date</code><version>3.8.2</version><author>Mojtaba Moghani - wWw.Open-Cart.ir</author><link>https://www.opencartfarsi.ir</link><file path=\"admin/controller/catalog/product.php\"><operation><search><![CDATA[($product_info[\'date_available\'] != \'0000-00-00\') ? $product_info[\'date_available\'] : \'\';]]></search><add position=\"replace\"><![CDATA[($product_info[\'date_available\'] != \'0000-00-00\') ? (($this->language->get(\'code\') == \'fa\') ? gtj($product_info[\'date_available\']) : $product_info[\'date_available\']) : \'\';]]></add></operation><operation><search><![CDATA[$data[\'date_available\'] = date(\'Y-m-d\');]]></search><add position=\"replace\"><![CDATA[$data[\'date_available\'] = ($this->language->get(\'code\') == \'fa\') ? jdate(\'Y-m-d\') : date(\'Y-m-d\');]]></add></operation><operation><search><![CDATA[($product_discount[\'date_start\'] != \'0000-00-00\') ? $product_discount[\'date_start\'] : \'\',]]></search><add position=\"replace\"><![CDATA[($product_discount[\'date_start\'] != \'0000-00-00\') ? (($this->language->get(\'code\') == \'fa\') ? gtj($product_discount[\'date_start\']) : $product_discount[\'date_start\']) : \'\',]]></add></operation><operation><search><![CDATA[($product_discount[\'date_end\'] != \'0000-00-00\') ? $product_discount[\'date_end\'] : \'\']]></search><add position=\"replace\"><![CDATA[($product_discount[\'date_end\'] != \'0000-00-00\') ? (($this->language->get(\'code\') == \'fa\') ? gtj($product_discount[\'date_end\']) : $product_discount[\'date_end\']) : \'\']]></add></operation><operation><search><![CDATA[($product_special[\'date_start\'] != \'0000-00-00\') ? $product_special[\'date_start\'] : \'\',]]></search><add position=\"replace\"><![CDATA[($product_special[\'date_start\'] != \'0000-00-00\') ? (($this->language->get(\'code\') == \'fa\') ? gtj($product_special[\'date_start\']) : $product_special[\'date_start\']) : \'\',]]></add></operation><operation><search><![CDATA[($product_special[\'date_end\'] != \'0000-00-00\') ? $product_special[\'date_end\'] :  \'\']]></search><add position=\"replace\"><![CDATA[($product_special[\'date_end\'] != \'0000-00-00\') ? (($this->language->get(\'code\') == \'fa\') ? gtj($product_special[\'date_end\']) : $product_special[\'date_end\']) :  \'\']]></add></operation></file><file path=\"admin/controller/catalog/review.php\"><operation><search><![CDATA[\'filter_date_added\' => $filter_date_added,]]></search><add position=\"replace\"><![CDATA[\'filter_date_added\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_added) : $filter_date_added,]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/catalog/download.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/customer/customer.php\"><operation><search><![CDATA[\'filter_date_added\'        => $filter_date_added,]]></search><add position=\"replace\"><![CDATA[\'filter_date_added\'        => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_added) : $filter_date_added,]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></add></operation><operation><search><![CDATA[\'date_added\' => date(\'d/m/y\', strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[\'date_added\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date(\'d/m/y\', strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/customer/customer_approval.php\"><operation><search><![CDATA[\'filter_date_added\'        => $filter_date_added,]]></search><add position=\"replace\"><![CDATA[\'filter_date_added\'        => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_added) : $filter_date_added,]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/design/theme.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/extension/dashboard/activity.php\"><operation><search><![CDATA[date($this->language->get(\'datetime_format\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'datetime_format\'), strtotime($result[\'date_added\']))]]></add></operation></file><file path=\"admin/controller/extension/dashboard/chart.php\"><operation><search><![CDATA[$results = $this->model_extension_dashboard_chart->getTotalOrdersByMonth();]]></search><add position=\"replace\"><![CDATA[if ($this->language->get(\'code\') == \'fa\') {\r\n					$results = $this->model_extension_dashboard_chart->getTotalOrdersByMonthFarsi();\r\n				} else {\r\n					$results = $this->model_extension_dashboard_chart->getTotalOrdersByMonth();\r\n				}]]></add></operation><operation><search><![CDATA[$results = $this->model_extension_dashboard_chart->getTotalCustomersByMonth();]]></search><add position=\"replace\"><![CDATA[if ($this->language->get(\'code\') == \'fa\') {\r\n					$results = $this->model_extension_dashboard_chart->getTotalCustomersByMonthFarsi();\r\n				} else {\r\n					$results = $this->model_extension_dashboard_chart->getTotalCustomersByMonth();\r\n				}]]></add></operation><operation><search><![CDATA[$results = $this->model_extension_dashboard_chart->getTotalOrdersByYear();]]></search><add position=\"replace\"><![CDATA[if ($this->language->get(\'code\') == \'fa\') {\r\n					$results = $this->model_extension_dashboard_chart->getTotalOrdersByYearFarsi();\r\n				} else {\r\n					$results = $this->model_extension_dashboard_chart->getTotalOrdersByYear();\r\n				}]]></add></operation><operation><search><![CDATA[$results = $this->model_extension_dashboard_chart->getTotalCustomersByYear();]]></search><add position=\"replace\"><![CDATA[if ($this->language->get(\'code\') == \'fa\') {\r\n					$results = $this->model_extension_dashboard_chart->getTotalCustomersByYearFarsi();\r\n				} else {\r\n					$results = $this->model_extension_dashboard_chart->getTotalCustomersByYear();\r\n				}]]></add></operation><operation info=\"Chart For Week\"><search><![CDATA[$json[\'xaxis\'][] = array(date(\'w\', strtotime($date)), date(\'D\', strtotime($date)));]]></search><add position=\"replace\"><![CDATA[$json[\'xaxis\'][] = ($this->language->get(\'code\') == \'fa\') ? array(date(\'w\', strtotime($date)), jdate(\'l\', strtotime($date))) : array(date(\'w\', strtotime($date)), date(\'D\', strtotime($date)));]]></add></operation><operation info=\"Chart For Month\"><search><![CDATA[for ($i = 1; $i <= date(\'t\'); $i++) {]]></search><add position=\"replace\" offset=\"4\"><![CDATA[\r\n				if ($this->language->get(\'code\') == \'fa\') {\r\n					for ($i = 1; $i <= jdate(\'t\'); $i++) {\r\n						$jdate = jdate(\'Y\') . \'-\' . jdate(\'m\') . \'-\' . $i;\r\n						$date = jtg($jdate);\r\n						$json[\'xaxis\'][] = array(jdate(\'j\', strtotime($date)), jdate(\'d\', strtotime($date)));\r\n					}\r\n				}  else {\r\n					for ($i = 1; $i <= date(\'t\'); $i++) {\r\n						$date = date(\'Y\') . \'-\' . date(\'m\') . \'-\' . $i;\r\n						$json[\'xaxis\'][] = array(date(\'j\', strtotime($date)), date(\'d\', strtotime($date)));\r\n					}\r\n				}\r\n]]></add></operation><operation info=\"Chart For Year\"><search><![CDATA[$json[\'xaxis\'][] = array($i, date(\'M\', mktime(0, 0, 0, $i)));]]></search><add position=\"replace\"><![CDATA[$json[\'xaxis\'][] = ($this->language->get(\'code\') == \'fa\') ? array($i, jdate(\'F\', jmktime(0, 0, 0, $i, 1, jdate(\'Y\')))) : array($i, date(\'M\', mktime(0, 0, 0, $i)));]]></add></operation></file><file path=\"admin/controller/extension/dashboard/{customer,order,sale}.php\"><operation><search><![CDATA[date(\'Y-m-d\', strtotime(\'-1 day\'))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate(\'Y-m-d\', strtotime(\'-1 day\')) : date(\'Y-m-d\', strtotime(\'-1 day\'))]]></add></operation><operation><search><![CDATA[date(\'Y-m-d\', strtotime(\'-2 day\'))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate(\'Y-m-d\', strtotime(\'-2 day\')) : date(\'Y-m-d\', strtotime(\'-2 day\'))]]></add></operation></file><file path=\"admin/controller/extension/dashboard/recent.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/extension/report/{customer_activity,customer_reward,customer_search,customer_transaction,sale_coupon}.php\"><operation><search><![CDATA[\'filter_date_start\'	=> $filter_date_start,]]></search><add position=\"replace\" offset=\"1\"><![CDATA[\r\n			\'filter_date_start\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_start) : $filter_date_start,\r\n			\'filter_date_end\'	=> ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_end) : $filter_date_end,\r\n]]></add></operation></file><file path=\"admin/controller/extension/report/{marketing,product_purchased,sale_order,sale_shipping,sale_tax}.php\"><operation><search><![CDATA[\'filter_date_start\'	     => $filter_date_start,]]></search><add position=\"replace\" offset=\"1\"><![CDATA[\r\n			\'filter_date_start\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_start) : $filter_date_start,\r\n			\'filter_date_end\'	=> ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_end) : $filter_date_end,\r\n]]></add></operation></file><file path=\"admin/controller/extension/report/customer_order.php\"><operation><search><![CDATA[\'filter_date_start\'			=> $filter_date_start,]]></search><add position=\"replace\" offset=\"1\"><![CDATA[\r\n			\'filter_date_start\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_start) : $filter_date_start,\r\n			\'filter_date_end\'	=> ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_end) : $filter_date_end,\r\n]]></add></operation></file><file path=\"admin/controller/extension/report/sale_return.php\"><operation><search><![CDATA[\'filter_date_start\'	      => $filter_date_start,]]></search><add position=\"replace\" offset=\"1\"><![CDATA[\r\n			\'filter_date_start\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_start) : $filter_date_start,\r\n			\'filter_date_end\'	=> ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_end) : $filter_date_end,\r\n]]></add></operation></file><file path=\"admin/controller/extension/report/{customer_activity,customer_search}.php\"><operation><search><![CDATA[date($this->language->get(\'datetime_format\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'datetime_format\'), strtotime($result[\'date_added\']))]]></add></operation></file><file path=\"admin/controller/extension/report/sale_order.php\"><operation><search><![CDATA[$filter_date_start = date(\'Y-m-d\', strtotime(date(\'Y\') . \'-\' . date(\'m\') . \'-01\'));]]></search><add position=\"replace\"><![CDATA[$filter_date_start = ($this->language->get(\'code\') == \'fa\') ? jdate(\'Y\') . \'-\' . jdate(\'m\') . \'-01\' : date(\'Y-m-d\', strtotime(date(\'Y\') . \'-\' . date(\'m\') . \'-01\'));]]></add></operation><operation><search><![CDATA[$filter_date_end = date(\'Y-m-d\');]]></search><add position=\"replace\"><![CDATA[$filter_date_end = ($this->language->get(\'code\') == \'fa\') ? jdate(\'Y-m-d\') : date(\'Y-m-d\');]]></add></operation></file><file path=\"admin/controller/extension/report/{sale_order,sale_return,sale_shipping,sale_tax}.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_start\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_start\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_start\'])),]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_end\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_end\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_end\'])),]]></add></operation></file><file path=\"admin/controller/localisation/{currency,tax_rate}.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_modified\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_modified\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_modified\'])),]]></add></operation></file><file path=\"admin/controller/localisation/tax_rate.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/localisation/zone.php\"><operation><search><![CDATA[$order = \'ASC\';]]></search><add position=\"replace\"><![CDATA[$order = \'DESC\';]]></add></operation></file><file path=\"admin/controller/mail/return.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($return_info[\'date_modified\']));]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($return_info[\'date_modified\'])) : date($this->language->get(\'date_format_short\'), strtotime($return_info[\'date_modified\']));]]></add></operation></file><file path=\"admin/controller/marketing/marketing.php\"><operation><search><![CDATA[\'filter_date_added\' => $filter_date_added,]]></search><add position=\"replace\" regex=\"true\"><![CDATA[\'filter_date_added\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_added) : $filter_date_added,]]></add></operation></file><file path=\"admin/controller/marketing/{coupon,marketing}.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></add></operation></file><file path=\"admin/controller/marketing/coupon.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_start\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_start\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_start\'])),]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_end\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_end\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_end\'])),]]></add></operation><operation><search><![CDATA[($coupon_info[\'date_start\'] != \'0000-00-00\' ? $coupon_info[\'date_start\'] : \'\');]]></search><add position=\"replace\"><![CDATA[($coupon_info[\'date_start\'] != \'0000-00-00\' ? (($this->language->get(\'code\') == \'fa\') ? gtj($coupon_info[\'date_start\']) : $coupon_info[\'date_start\']) : \'\');]]></add></operation><operation><search><![CDATA[$data[\'date_start\'] = date(\'Y-m-d\', time());]]></search><add position=\"replace\"><![CDATA[$data[\'date_start\'] = ($this->language->get(\'code\') == \'fa\') ? jdate(\'Y-m-d\', time()) : date(\'Y-m-d\', time());]]></add></operation><operation><search><![CDATA[($coupon_info[\'date_end\'] != \'0000-00-00\' ? $coupon_info[\'date_end\'] : \'\');]]></search><add position=\"replace\"><![CDATA[($coupon_info[\'date_end\'] != \'0000-00-00\' ? (($this->language->get(\'code\') == \'fa\') ? gtj($coupon_info[\'date_end\']) : $coupon_info[\'date_end\']) : \'\');]]></add></operation><operation><search><![CDATA[$data[\'date_end\'] = date(\'Y-m-d\', strtotime(\'+1 month\'));]]></search><add position=\"replace\"><![CDATA[$data[\'date_end\'] = ($this->language->get(\'code\') == \'fa\') ? jdate(\'Y-m-d\', strtotime(\'+1 month\')) : date(\'Y-m-d\', strtotime(\'+1 month\'));]]></add></operation></file><file path=\"admin/controller/marketplace/{installer,marketplace,modification}.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></add></operation></file><file path=\"admin/controller/marketplace/marketplace.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($response_info[\'date_added\']));]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($response_info[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($response_info[\'date_added\']));]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($response_info[\'date_modified\']));]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($response_info[\'date_modified\'])) : date($this->language->get(\'date_format_short\'), strtotime($response_info[\'date_modified\']));]]></add></operation></file><file path=\"admin/controller/report/online.php\"><operation><search><![CDATA[date($this->language->get(\'datetime_format\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'datetime_format\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/sale/recurring.php\"><operation><search><![CDATA[\'filter_date_added\'         => $filter_date_added,]]></search><add position=\"replace\"><![CDATA[\'filter_date_added\'        => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_added) : $filter_date_added,]]></add></operation><operation><search><![CDATA[$data[\'date_added\'] = date($this->language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']));]]></search><add position=\"replace\"><![CDATA[$data[\'date_added\'] = ($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($order_info[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']));]]></add></operation></file><file path=\"admin/controller/sale/{order,recurring,return,voucher}.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></add></operation></file><file path=\"admin/controller/sale/order.php\"><operation><search><![CDATA[\'filter_date_added\'      => $filter_date_added,]]></search><add position=\"replace\" offset=\"1\"><![CDATA[\r\n			\'filter_date_added\'    => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_added) : $filter_date_added,\r\n			\'filter_date_modified\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_modified) : $filter_date_modified,\r\n]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($order_info[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']))]]></add></operation></file><file path=\"admin/controller/sale/return.php\"><operation><search><![CDATA[\'filter_date_added\'       => $filter_date_added,]]></search><add position=\"replace\" offset=\"1\"><![CDATA[\r\n			\'filter_date_added\'    => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_added) : $filter_date_added,\r\n			\'filter_date_modified\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_modified) : $filter_date_modified,\r\n]]></add></operation></file><file path=\"admin/controller/sale/{order,return}.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_modified\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_modified\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_modified\'])),]]></add></operation></file><file path=\"admin/controller/setting/setting.php\"><operation><search><![CDATA[if (isset($this->request->post[\'config_currency_auto\'])) {]]></search><add position=\"before\"><![CDATA[\r\n		$data[\'shamsidate_formats\'] = array();\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'date_format_short\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'date_format_short\')) : date($this->language->get(\'date_format_short\'))\r\n		);\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'date_format_long\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'date_format_long\')) : date($this->language->get(\'date_format_long\'))\r\n		);\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'datetime_format\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'datetime_format\')) : date($this->language->get(\'datetime_format\'))\r\n		);\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'datetime_format_short\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'datetime_format_short\')) : date($this->language->get(\'datetime_format_short\'))\r\n		);\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'datetime_format_long\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'datetime_format_long\')) : date($this->language->get(\'datetime_format_long\'))\r\n		);\r\n		if (isset($this->request->post[\'config_shamsidate_format\'])) {\r\n			$data[\'config_shamsidate_format\'] = $this->request->post[\'config_shamsidate_format\'];\r\n		} else {\r\n			$data[\'config_shamsidate_format\'] = $this->config->get(\'config_shamsidate_format\');\r\n		}\r\n]]></add></operation></file><file path=\"admin/controller/setting/store.php\"><operation><search><![CDATA[if (isset($this->request->post[\'config_currency\'])) {]]></search><add position=\"before\"><![CDATA[\r\n		$data[\'shamsidate_formats\'] = array();\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'date_format_short\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'date_format_short\')) : date($this->language->get(\'date_format_short\'))\r\n		);\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'date_format_long\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'date_format_long\')) : date($this->language->get(\'date_format_long\'))\r\n		);\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'datetime_format\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'datetime_format\')) : date($this->language->get(\'datetime_format\'))\r\n		);\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'datetime_format_short\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'datetime_format_short\')) : date($this->language->get(\'datetime_format_short\'))\r\n		);\r\n		$data[\'shamsidate_formats\'][] = array(\r\n			\'code\' 	=> $this->language->get(\'datetime_format_long\'),\r\n			\'title\' => ($this->language->get(\'code\') == \'fa\') ? jdate($this->language->get(\'datetime_format_long\')) : date($this->language->get(\'datetime_format_long\'))\r\n		);\r\n		if (isset($this->request->post[\'config_shamsidate_format\'])) {\r\n			$data[\'config_shamsidate_format\'] = $this->request->post[\'config_shamsidate_format\'];\r\n		} else {\r\n			$data[\'config_shamsidate_format\'] = $this->config->get(\'config_shamsidate_format\');\r\n		}\r\n]]></add></operation></file><file path=\"admin/controller/tool/upload.php\"><operation><search><![CDATA[\'filter_date_added\'	=> $filter_date_added,]]></search><add position=\"replace\"><![CDATA[\'filter_date_added\' => ($this->language->get(\'code\') == \'fa\') ? jtg($filter_date_added) : $filter_date_added,]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/controller/user/api.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_modified\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_modified\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_modified\'])),]]></add></operation><operation><search><![CDATA[date($this->language->get(\'datetime_format\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'datetime_format\'), strtotime($result[\'date_added\'])),]]></add></operation><operation><search><![CDATA[date($this->language->get(\'datetime_format\'), strtotime($result[\'date_modified\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_modified\'])) : date($this->language->get(\'datetime_format\'), strtotime($result[\'date_modified\']))]]></add></operation></file><file path=\"admin/controller/user/{api,user}.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\'])),]]></add></operation></file><file path=\"admin/language/en-gb/en-gb.php\"><operation><search><![CDATA[$_[\'datetime_format\']]]></search><add position=\"before\"><![CDATA[$_[\'datetime_format_short\']    		= \'l d F Y\';\r\n$_[\'datetime_format_long\']    		= \'l d F Y - H:i:s\';]]></add></operation></file><file path=\"admin/language/en-gb/setting/setting.php\"><operation><search><![CDATA[$_[\'entry_currency_auto\']]]></search><add position=\"before\"><![CDATA[\r\n$_[\'entry_shamsidate_status\']          = \'Shamsi Date Status\';\r\n$_[\'entry_shamsidate_format\']          = \'Shamsi Date Format\';\r\n]]></add></operation><operation><search><![CDATA[$_[\'help_currency_auto\']]]></search><add position=\"before\"><![CDATA[\r\n$_[\'help_shamsidate_status\']           = \'By Activate This Option You Can View Date In Format Shamsi Date.\';\r\n$_[\'help_shamsidate_format\']           = \'Shamsi Date Format For Persian Language.\';\r\n]]></add></operation></file><file path=\"admin/language/en-gb/setting/store.php\"><operation><search><![CDATA[$_[\'entry_currency\']]]></search><add position=\"before\"><![CDATA[\r\n$_[\'entry_shamsidate_status\']          = \'Shamsi Date Status\';\r\n$_[\'entry_shamsidate_format\']          = \'Shamsi Date Format\';\r\n]]></add></operation><operation><search><![CDATA[$_[\'help_currency\']]]></search><add position=\"before\"><![CDATA[\r\n$_[\'help_shamsidate_status\']           = \'By Activate This Option You Can View Date In Format Shamsi Date.\';\r\n$_[\'help_shamsidate_format\']           = \'Shamsi Date Format For Persian Language.\';\r\n]]></add></operation></file><file path=\"admin/language/fa-ir/common/footer.php\"><operation error=\"skip\"><search><![CDATA[?>]]></search><add position=\"before\"><![CDATA[echo eval(base64_decode(\'JF9bJ3RleHRfZm9vdGVyJ10gCT0gJyYjMTU3ODsmIzE2MDU7JiMxNTc1OyYjMTYwNTsmIzE3NDA7ICYjMTU4MTsmIzE2MDI7JiMxNjA4OyYjMTYwMjsgJiMxNTc2OyYjMTU4NTsmIzE1NzU7JiMxNzQwOyA8YSB0YXJnZXQ9Il9ibGFuayIgaHJlZj0iaHR0cDovL3d3dy5vcGVuY2FydGZhcnNpLmNvbSIgdGl0bGU9Ik9wZW5DYXJ0RmFyc2kuQ29tIj4mIzE1NzU7JiMxNjYyOyYjMTYwNjsgJiMxNzA1OyYjMTU3NTsmIzE1ODU7JiMxNTc4OyAmIzE2MDE7JiMxNTc1OyYjMTU4NTsmIzE1ODc7JiMxNzQwOyAmIzE1ODM7JiMxNTc1OyYjMTU3ODsgJiMxNzA1OyYjMTU3NTsmIzE2MDU7PC9hPiAmIzE2MDU7JiMxNTgxOyYjMTYwMTsmIzE2MDg7JiMxNTkyOyAmIzE1NzU7JiMxNTg3OyYjMTU3ODsuICZjb3B5OyAxMzg5LScgLiBqZGF0ZSgnWScpIC4gJyAnOw==\'));]]></add></operation></file><file path=\"admin/model/catalog/product.php\"><operation><search><![CDATA[$this->db->escape($data[\'date_available\'])]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($data[\'date_available\'])) : $this->db->escape($data[\'date_available\']))]]></add></operation><operation><search><![CDATA[$this->db->escape($product_discount[\'date_start\'])]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($product_discount[\'date_start\'])) : $this->db->escape($product_discount[\'date_start\']))]]></add></operation><operation><search><![CDATA[date_end = \'\" . $this->db->escape($product_discount[\'date_end\']) . \"\']]></search><add position=\"replace\"><![CDATA[date_end = \'\" . ($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($product_discount[\'date_end\'])) : $this->db->escape($product_discount[\'date_end\'])) . \"\']]></add></operation><operation><search><![CDATA[date_start = \'\" . $this->db->escape($product_special[\'date_start\']) . \"\']]></search><add position=\"replace\"><![CDATA[date_start = \'\" . ($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($product_special[\'date_start\'])) : $this->db->escape($product_special[\'date_start\'])) . \"\']]></add></operation><operation><search><![CDATA[date_end = \'\" . $this->db->escape($product_special[\'date_end\']) . \"\']]></search><add position=\"replace\"><![CDATA[date_end = \'\" . ($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($product_special[\'date_end\'])) : $this->db->escape($product_special[\'date_end\'])) . \"\']]></add></operation></file><file path=\"admin/model/catalog/review.php\"><operation><search><![CDATA[$this->db->escape($data[\'date_added\'])]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($data[\'date_added\'])) : $this->db->escape($data[\'date_added\']))]]></add></operation></file><file path=\"admin/model/extension/dashboard/chart.php\"><operation info=\"getTotalOrdersByMonth\"><search><![CDATA[public function getTotalOrdersByMonth() {]]></search><add position=\"before\"><![CDATA[/* *********************************** */\r\n	public function getTotalOrdersByMonthFarsi() {\r\n		$implode = array();\r\n		foreach ($this->config->get(\'config_complete_status\') as $order_status_id) {\r\n			$implode[] = \"\'\" . (int)$order_status_id . \"\'\";\r\n		}\r\n		$order_data = array();\r\n		for ($i = 1; $i <= jdate(\'t\'); $i++) {\r\n			$jdate = jdate(\'Y\') . \'-\' . jdate(\'m\') . \'-\' . $i;\r\n			$date = jtg($jdate);\r\n			$order_data[jdate(\'j\', strtotime($date))] = array(\r\n				\'day\'   => jdate(\'d\', strtotime($date)),\r\n				\'total\' => 0\r\n			);\r\n		}\r\n		$jmdate = jdate(\'Y\') . \'-\' . jdate(\'m\') . \'-1\';\r\n		$gmdate = jtg($jmdate);\r\n		$query = $this->db->query(\"SELECT COUNT(*) AS total, date_added FROM `\" . DB_PREFIX . \"order` WHERE order_status_id > \'0\' AND DATE(date_added) >= \'\" . $this->db->escape($gmdate) . \"\' GROUP BY DATE(date_added)\");\r\n		foreach ($query->rows as $result) {\r\n			$order_data[jdate(\'j\', strtotime($result[\'date_added\']))] = array(\r\n				\'day\'   => jdate(\'d\', strtotime($result[\'date_added\'])),\r\n				\'total\' => $result[\'total\']\r\n			);\r\n		}\r\n		return $order_data;\r\n	}\r\n/* *********************************** */]]></add></operation><operation info=\"getTotalOrdersByYear\"><search><![CDATA[public function getTotalOrdersByYear() {]]></search><add position=\"before\"><![CDATA[/* *********************************** */\r\n	public function getTotalOrdersByYearFarsi() {\r\n		$implode = array();\r\n		foreach ($this->config->get(\'config_complete_status\') as $order_status_id) {\r\n			$implode[] = \"\'\" . (int)$order_status_id . \"\'\";\r\n		}\r\n		$order_data = array();\r\n		for ($i = 1; $i <= 12; $i++) {\r\n			$jmonth = gregorian_to_jalali(date(\'Y\'), $i, date(\'d\')); \r\n			$jmonth = $jmonth[1];\r\n			$jyear = jdate(\'Y\');\r\n			$order_data[$jmonth] = array(\r\n				\'month\' => jdate(\'F\', jmktime(0, 0, 0, $jmonth)),//M or F\r\n				\'total\' => 0\r\n			);\r\n			$jmdate = jdate(\'Y\') . \'-\' . $jmonth . \'-1\';\r\n			$gmdate = jtg($jmdate);\r\n			$query = $this->db->query(\"SELECT YEAR(date_added) AS year, MONTH(date_added) AS month, DAY(date_added) AS day, date_added FROM `\" . DB_PREFIX . \"order` WHERE order_status_id > \'0\' AND DATE(date_added) >= \'\" . $this->db->escape($gmdate) . \"\' GROUP BY DATE(date_added)\");\r\n			$total_rows = 0;\r\n			$date_add = \'\';\r\n			if ($query->num_rows) {\r\n				foreach ($query->rows as $result) {\r\n					$order_jdate = gregorian_to_jalali($result[\'year\'], $result[\'month\'], $result[\'day\']);\r\n					if ($order_jdate[0] == $jyear && $order_jdate[1] == $jmonth) {\r\n						if($total_rows == 0) {$date_add = $result[\'date_added\'];}\r\n						$total_rows = $total_rows + 1;\r\n					}\r\n				}\r\n				$order_data[jdate(\'n\', strtotime($date_add))] = array(\r\n					\'month\' => jdate(\'F\', strtotime($date_add)),//M or F\r\n					\'total\' => $total_rows\r\n				);\r\n			}\r\n		}\r\n		return $order_data;\r\n	}\r\n/* *********************************** */]]></add></operation><operation info=\"getTotalCustomersByMonth\"><search><![CDATA[public function getTotalCustomersByMonth() {]]></search><add position=\"before\"><![CDATA[/* *********************************** */\r\n	public function getTotalCustomersByMonthFarsi() {\r\n		$customer_data = array();\r\n		for ($i = 1; $i <= jdate(\'t\'); $i++) {\r\n			$jdate = jdate(\'Y\') . \'-\' . jdate(\'m\') . \'-\' . $i;\r\n			$date = jtg($jdate);\r\n			$customer_data[jdate(\'j\', strtotime($date))] = array(\r\n				\'day\'   => jdate(\'d\', strtotime($date)),\r\n				\'total\' => 0\r\n			);\r\n		}\r\n		$jmdate = jdate(\'Y\') . \'-\' . jdate(\'m\') . \'-1\';\r\n		$gmdate = jtg($jmdate);\r\n		$query = $this->db->query(\"SELECT COUNT(*) AS total, date_added FROM `\" . DB_PREFIX . \"customer` WHERE DATE(date_added) >= \'\" . $this->db->escape($gmdate) . \"\' GROUP BY DATE(date_added)\");\r\n		foreach ($query->rows as $result) {\r\n			$customer_data[jdate(\'j\', strtotime($result[\'date_added\']))] = array(\r\n				\'day\'   => jdate(\'d\', strtotime($result[\'date_added\'])),\r\n				\'total\' => $result[\'total\']\r\n			);\r\n		}\r\n		return $customer_data;\r\n	}\r\n/* *********************************** */]]></add></operation><operation info=\"getTotalCustomersByYear\"><search><![CDATA[public function getTotalCustomersByYear() {]]></search><add position=\"before\"><![CDATA[/* *********************************** */\r\n	public function getTotalCustomersByYearFarsi() {\r\n		$customer_data = array();\r\n		for ($i = 1; $i <= 12; $i++) {\r\n			$jmonth = gregorian_to_jalali(date(\'Y\'), $i, date(\'d\')); \r\n			$jmonth = $jmonth[1];\r\n			$jyear = jdate(\'Y\');\r\n			$customer_data[$jmonth] = array(\r\n				\'month\' => jdate(\'F\', jmktime(0, 0, 0, $jmonth)),//M or F\r\n				\'total\' => 0\r\n			);\r\n			$jmdate = jdate(\'Y\') . \'-\' . $jmonth . \'-1\';\r\n			$gmdate = jtg($jmdate);\r\n			$query = $this->db->query(\"SELECT YEAR(date_added) AS year, MONTH(date_added) AS month, DAY(date_added) AS day, date_added FROM `\" . DB_PREFIX . \"customer` WHERE DATE(date_added) >= \'\" . $this->db->escape($gmdate) . \"\' GROUP BY DATE(date_added)\");\r\n			$total_rows = 0;\r\n			$date_add = \'\';\r\n			if ($query->num_rows) {\r\n				foreach ($query->rows as $result) {\r\n					$customer_jdate = gregorian_to_jalali($result[\'year\'], $result[\'month\'], $result[\'day\']);\r\n					if ($customer_jdate[0] == $jyear && $customer_jdate[1] == $jmonth) {\r\n						if($total_rows == 0) {$date_add = $result[\'date_added\'];}\r\n						$total_rows = $total_rows + 1;\r\n					}\r\n				}\r\n				$customer_data[jdate(\'n\', strtotime($date_add))] = array(\r\n					\'month\' => jdate(\'F\', strtotime($date_add)),//M or F\r\n					\'total\' => $total_rows\r\n				);\r\n			}\r\n		}\r\n		return $customer_data;\r\n	}\r\n/* *********************************** */]]></add></operation></file><file path=\"admin/model/marketing/coupon.php\"><operation><search><![CDATA[date_start = \'\" . $this->db->escape($data[\'date_start\']) . \"\', date_end = \'\" . $this->db->escape($data[\'date_end\']) . \"\']]></search><add position=\"replace\"><![CDATA[date_start = \'\" . ($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($data[\'date_start\'])) : $this->db->escape($data[\'date_start\'])) . \"\', date_end = \'\" . ($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($data[\'date_end\'])) : $this->db->escape($data[\'date_end\'])) . \"\']]></add></operation></file><file path=\"admin/model/sale/return.php\"><operation><search><![CDATA[date_ordered = \'\" . $this->db->escape($data[\'date_ordered\']) . \"\',]]></search><add position=\"replace\"><![CDATA[date_ordered = \'\" . ($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($data[\'date_ordered\'])) : $this->db->escape($data[\'date_ordered\'])) . \"\',]]></add></operation></file><file path=\"admin/view/template/setting/setting.twig\"><operation><search><![CDATA[<label class=\"col-sm-2 control-label\" for=\"input-length-class\">{{ entry_length_class }}</label>]]></search><add position=\"before\" offset=\"1\"><![CDATA[\r\n<!--*****************Start Shamsi Date********************-->\r\n              <div class=\"form-group\">\r\n                <label class=\"col-sm-2 control-label\" for=\"input-shamsidate-format\"><span data-toggle=\"tooltip\" title=\"{{ help_shamsidate_format }}\">{{ entry_shamsidate_format }}</span></label>\r\n                <div class=\"col-sm-10\">\r\n                  <select name=\"config_shamsidate_format\" id=\"input-shamsidate-format\" class=\"form-control\">\r\n					{% for format in shamsidate_formats %}\r\n					{% if format.code == config_shamsidate_format %}\r\n                    <option value=\"{{ format.code }}\" selected=\"selected\">{{ format.title }}</option>\r\n                    {% else %}\r\n                    <option value=\"{{ format.code }}\">{{ format.title }}</option>\r\n					{% endif %}\r\n					{% endfor %}\r\n                  </select>\r\n                </div>\r\n              </div>\r\n<!--*****************Ends Shamsi Date********************-->\r\n]]></add></operation></file><file path=\"admin/view/template/setting/store_form.twig\"><operation><search><![CDATA[<div class=\"tab-pane\" id=\"tab-option\">]]></search><add position=\"before\" offset=\"1\"><![CDATA[\r\n<!--*****************Start Shamsi Date********************-->\r\n              <div class=\"form-group\">\r\n                <label class=\"col-sm-2 control-label\" for=\"input-shamsidate-format\"><span data-toggle=\"tooltip\" title=\"{{ help_shamsidate_format }}\">{{ entry_shamsidate_format }}</span></label>\r\n                <div class=\"col-sm-10\">\r\n                  <select name=\"config_shamsidate_format\" id=\"input-shamsidate-format\" class=\"form-control\">\r\n					{% for format in shamsidate_formats %}\r\n					{% if format.code == config_shamsidate_format %}\r\n                    <option value=\"{{ format.code }}\" selected=\"selected\">{{ format.title }}</option>\r\n                    {% else %}\r\n                    <option value=\"{{ format.code }}\">{{ format.title }}</option>\r\n					{% endif %}\r\n					{% endfor %}\r\n                  </select>\r\n                </div>\r\n              </div>\r\n<!--*****************Ends Shamsi Date********************-->\r\n]]></add></operation></file><file path=\"catalog/controller/account/{download,order,recurring,return,reward,transaction}.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></add></operation></file><file path=\"catalog/controller/account/order.php\"><operation><search><![CDATA[$data[\'date_added\'] = date($this->language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']));]]></search><add position=\"replace\"><![CDATA[$data[\'date_added\'] = ($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($order_info[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']));]]></add></operation></file><file path=\"catalog/controller/account/recurring.php\"><operation><search><![CDATA[$data[\'date_added\'] = date($this->language->get(\'date_format_short\'), strtotime($recurring_info[\'date_added\']));]]></search><add position=\"replace\"><![CDATA[$data[\'date_added\'] = ($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($recurring_info[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($recurring_info[\'date_added\']));]]></add></operation></file><file path=\"catalog/controller/account/return.php\"><operation><search><![CDATA[$data[\'date_ordered\'] = date($this->language->get(\'date_format_short\'), strtotime($return_info[\'date_ordered\']));]]></search><add position=\"replace\"><![CDATA[$data[\'date_ordered\'] = ($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($return_info[\'date_ordered\'])) : date($this->language->get(\'date_format_short\'), strtotime($return_info[\'date_ordered\']));]]></add></operation><operation><search><![CDATA[$data[\'date_added\'] = date($this->language->get(\'date_format_short\'), strtotime($return_info[\'date_added\']));]]></search><add position=\"replace\"><![CDATA[$data[\'date_added\'] = ($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($return_info[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($return_info[\'date_added\']));]]></add></operation></file><file path=\"catalog/controller/account/transaction.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></add></operation></file><file path=\"catalog/controller/common/footer.php\"><operation error=\"skip\"><search><![CDATA[date(\'Y\', time())]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\' ? jdate(\'Y\', time()) : date(\'Y\', time()))]]></add></operation></file><file path=\"catalog/controller/product/product.php\"><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\') ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($result[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($result[\'date_added\']))]]></add></operation></file><file path=\"catalog/controller/mail/order.php\"><operation><search><![CDATA[date($language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']))]]></search><add position=\"replace\"><![CDATA[$language->get(\'code\') == \'fa\' ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($order_info[\'date_added\'])) : date($language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']))]]></add></operation><operation><search><![CDATA[date($this->language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']));]]></search><add position=\"replace\"><![CDATA[$this->language->get(\'code\') == \'fa\' ? jdate($this->config->get(\'config_shamsidate_format\'), strtotime($order_info[\'date_added\'])) : date($this->language->get(\'date_format_short\'), strtotime($order_info[\'date_added\']));]]></add></operation></file><file path=\"catalog/model/account/return.php\"><operation><search><![CDATA[$this->db->escape($data[\'date_ordered\'])]]></search><add position=\"replace\"><![CDATA[($this->language->get(\'code\') == \'fa\' ? $this->db->escape(jtg($data[\'date_ordered\'])) : $this->db->escape($data[\'date_ordered\']))]]></add></operation></file><file path=\"catalog/language/en-gb/en-gb.php\"><operation><search><![CDATA[$_[\'datetime_format\']]]></search><add position=\"before\"><![CDATA[$_[\'datetime_format_short\'] = \'l d F Y\';\r\n$_[\'datetime_format_long\']  = \'l d F Y - H:i:s\';]]></add></operation></file><file path=\"catalog/language/fa-ir/common/footer.php\"><operation error=\"skip\"><search><![CDATA[?>]]></search><add position=\"before\"><![CDATA[echo eval(base64_decode(\'JF9bJ3RleHRfcG93ZXJlZCddICAgICAgPSAnPGEgaHJlZj0iaHR0cDovL29wZW5jYXJ0ZmFyc2kuY29tIiB0aXRsZT0iJiMxNTc1OyYjMTYwNjsmIzE1ODA7JiMxNjA1OyYjMTYwNjsgJiMxNjYyOyYjMTU4ODsmIzE1Nzg7JiMxNzQwOyYjMTU3NjsmIzE1NzU7JiMxNjA2OyYjMTc0MDsgT3BlbkNhcnRGYXJzaS5Db20iIHRhcmdldD0iX2JsYW5rIj4mIzE2NjI7JiMxNTg4OyYjMTU3ODsmIzE3NDA7JiMxNTc2OyYjMTU3NTsmIzE2MDY7JiMxNzQwOyAmIzE2MDg7ICYjMTU3ODsmIzE2MDg7JiMxNTg3OyYjMTU5MzsmIzE2MDc7PC9hPiAmIzE1Nzg7JiMxNjA4OyYjMTU4NzsmIzE1OTE7IDxhIGhyZWY9Imh0dHA6Ly93d3cub3BlbmNhcnRmYXJzaS5pciIgdGl0bGU9IiYjMTYwODsmIzE1NzY7ICYjMTU4NzsmIzE1NzU7JiMxNzQwOyYjMTU3ODsgT3BlbkNhcnRGYXJzaS5pciIgdGFyZ2V0PSJfYmxhbmsiPiYjMTU3NTsmIzE2NjI7JiMxNjA2OyAmIzE3MDU7JiMxNTc1OyYjMTU4NTsmIzE1Nzg7ICYjMTYwMTsmIzE1NzU7JiMxNTg1OyYjMTU4NzsmIzE3NDA7PC9hPiA8YnIgLz4gJXMgJmNvcHk7ICVzJzs=\'));]]></add></operation></file><file path=\"system/engine/loader.php\"><operation><search><![CDATA[$result = $this->registry->get(\'event\')->trigger(\'view/\' . $trigger . \'/after\', array(&$route, &$data, &$output));]]></search><add position=\"after\" offset=\"4\"><![CDATA[\r\n		$direction = is_object($this->registry->get(\'language\')) ? strtolower($this->registry->get(\'language\')->get(\'direction\')) : \'rtl\';\r\n		$replaces = array();\r\n		if ($direction == \'rtl\') {\r\n			$replaces[\'catalog/view/javascript/common.js\'] = \'catalog/view/javascript/common-rtl.js\';\r\n			$replaces[\'catalog/view/javascript/jquery/magnific/magnific-popup.css\'] = \'catalog/view/javascript/jquery/magnific/magnific-popup-rtl.css\';\r\n			$replaces[\'catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js\'] = \'catalog/view/javascript/jquery/magnific/jquery.magnific-popup.farsi.min.js\';\r\n			$replaces[\'view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css\'] = \'view/javascript/jquery/datetimepicker/bootstrap-persiandatetimepicker.css\';\r\n			$replaces[\'view/javascript/jquery/datetimepicker/moment/moment.min.js\'] = \'view/javascript/jquery/datetimepicker/calendar.js\';\r\n			$replaces[\'view/javascript/jquery/datetimepicker/moment/moment-with-locales.min.js\'] = \'view/javascript/jquery/datetimepicker/shamsi.js\';\r\n			$replaces[\'view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js\'] = \'view/javascript/jquery/datetimepicker/bootstrap-persiandatetimepicker.min.js\';\r\n			$replaces[\'view/javascript/codemirror/lib/codemirror.css\'] = \'view/javascript/codemirror/lib/codemirror-rtl.css\';\r\n			$replaces[\'view/javascript/summernote/summernote.css\'] = \'view/javascript/summernote/summernote-rtl.css\';\r\n		}\r\n		$output = str_replace(array_keys($replaces), $replaces, $output);\r\n]]></add></operation></file></modification>', 1, '2018-09-07 22:21:28');
INSERT INTO `oc_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(2, 0, 'کد امنیتی برای صفحه ورود به مدیریت 3.0.2.0', 'Admin_Captcha', 'Mojtaba Moghani - wWw.Open-Cart.ir', '2.6', 'http://www.opencartfarsi.com', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n	<name>کد امنیتی برای صفحه ورود به مدیریت 3.0.0.0</name>\r\n	<code>Admin_Captcha</code>\r\n	<version>2.6</version>\r\n	<author>Mojtaba Moghani - wWw.Open-Cart.ir</author>\r\n	<link>http://www.opencartfarsi.com</link>\r\n	<file path=\"admin/controller/setting/setting.php\">\r\n		<operation>\r\n			<search><![CDATA[if (isset($this->request->post[\'config_logo\'])) {]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n		$data[\'captcha_pages\'][] = array(\r\n			\'text\'  => $this->language->get(\'text_admin\'),\r\n			\'value\' => \'admin\'\r\n		);\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"admin/language/en-gb/setting/setting.php\">\r\n		<operation>\r\n			<search><![CDATA[$_[\'text_contact\']]]></search>\r\n			<add position=\"after\"><![CDATA[$_[\'text_admin\']        = \'Admin Login\';]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"admin/language/fa-ir/setting/setting.php\">\r\n		<operation>\r\n			<search><![CDATA[$_[\'text_contact\']]]></search>\r\n			<add position=\"after\"><![CDATA[$_[\'text_admin\']     = \'ورود به مدیریت\';]]></add>\r\n		</operation>\r\n	</file>\r\n\r\n	<file path=\"admin/controller/common/login.php\">\r\n		<operation>\r\n			<search><![CDATA[if ($this->config->get(\'config_password\')) {]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n		// Admin Captcha\r\n		if ($this->config->get(\'captcha_\' . $this->config->get(\'config_captcha\') . \'_status\') && in_array(\'admin\', (array)$this->config->get(\'config_captcha_page\'))) {\r\n			$data[\'captcha\'] = $this->load->controller(\'common/\' . $this->config->get(\'config_captcha\'), $this->error);\r\n		} else {\r\n			$data[\'captcha\'] = \'\';\r\n		}\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[protected function validate() {]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n		// Admin Captcha\r\n		if ($this->config->get(\'captcha_\' . $this->config->get(\'config_captcha\') . \'_status\') && in_array(\'admin\', (array)$this->config->get(\'config_captcha_page\'))) {\r\n			$captcha = $this->load->controller(\'common/\' . $this->config->get(\'config_captcha\') . \'/validate\');\r\n\r\n			if ($captcha) {\r\n				$this->error[\'captcha\'] = $captcha;\r\n			}\r\n		}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"admin/view/template/common/login.twig\">\r\n		<operation>\r\n			<search><![CDATA[{% if forgotten %}]]></search>\r\n			<add position=\"before\"><![CDATA[</div>{{ captcha }}<div>]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2017-07-24 15:49:28'),
(3, 0, 'Patch For OpenCart v3.0.2.0', 'patch_ocf', 'Mojtaba Moghani - wWw.Open-Cart.ir', '1.2', 'http://opencartfarsi.com', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n	<name>Patch For OpenCart v3.0.0.0</name>\r\n	<code>patch_ocf</code>\r\n	<version>1.2</version>\r\n	<author>Mojtaba Moghani - wWw.Open-Cart.ir</author>\r\n	<link>http://opencartfarsi.com</link>\r\n	<file path=\"catalog/controller/common/column_left.php\">\r\n		<operation>\r\n			<search><![CDATA[$modules = $this->model_design_layout->getLayoutModules($layout_id, \'column_left\');]]></search>\r\n			<add position=\"replace\"><![CDATA[/* ********************************** */\r\n		if ($this->language->get(\'direction\') == \'rtl\') {\r\n			$modules = $this->model_design_layout->getLayoutModules($layout_id, \'column_right\');\r\n		} else {\r\n			$modules = $this->model_design_layout->getLayoutModules($layout_id, \'column_left\');\r\n		}\r\n/* ********************************** */]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[return $this->load->view(\'common/column_left\', $data);]]></search>\r\n			<add position=\"replace\"><![CDATA[/* ********************************** */\r\n		if ($this->language->get(\'direction\') == \'rtl\') {\r\n			return $this->load->view(\'common/column_right\', $data);\r\n		} else {\r\n			return $this->load->view(\'common/column_left\', $data);\r\n		}\r\n/* ********************************** */]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/common/column_right.php\">\r\n		<operation>\r\n			<search><![CDATA[$modules = $this->model_design_layout->getLayoutModules($layout_id, \'column_right\');]]></search>\r\n			<add position=\"replace\"><![CDATA[/* ********************************** */\r\n		if ($this->language->get(\'direction\') == \'rtl\') {\r\n			$modules = $this->model_design_layout->getLayoutModules($layout_id, \'column_left\');\r\n		} else {\r\n			$modules = $this->model_design_layout->getLayoutModules($layout_id, \'column_right\');\r\n		}\r\n/* ********************************** */]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[return $this->load->view(\'common/column_right\', $data);]]></search>\r\n			<add position=\"replace\"><![CDATA[/* ********************************** */\r\n		if ($this->language->get(\'direction\') == \'rtl\') {\r\n			return $this->load->view(\'common/column_left\', $data);\r\n		} else {\r\n			return $this->load->view(\'common/column_right\', $data);\r\n		}\r\n/* ********************************** */]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2017-07-24 15:51:28'),
(4, 0, 'راست چین سازی ایمیل های اپن کارت فارسی 3.0.2.0', 'RTL_Email', 'Mojtaba Moghani - wWw.Open-Cart.ir', '1.5', 'http://opencartfarsi.com', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n	<name>راست چین سازی ایمیل های اپن کارت فارسی 3.0.0.0</name>\r\n	<code>RTL_Email</code>\r\n	<version>1.5</version>\r\n	<author>Mojtaba Moghani - wWw.Open-Cart.ir</author>\r\n	<link>http://opencartfarsi.com</link>\r\n	<file path=\"admin/controller/sale/voucher.php\">\r\n		<operation>\r\n			<search><![CDATA[$mail->setHtml($this->load->view(\'mail/voucher\', $data));]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n							if ($this->language->get(\'code\') == \'fa\') {\r\n								$mail->setHtml($this->load->view(\'mail/voucher_farsi\', $data));\r\n							} else {\r\n								$mail->setHtml($this->load->view(\'mail/voucher\', $data));\r\n							}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/extension/total/voucher.php\">\r\n		<operation>\r\n			<search><![CDATA[$mail->setHtml($this->load->view(\'mail/voucher\', $data));]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n					if ($order_info[\'language_code\'] == \'fa-ir\') {\r\n						$mail->setHtml($this->load->view(\'mail/voucher_farsi\', $data));\r\n					} else {\r\n						$mail->setHtml($this->load->view(\'mail/voucher\', $data));\r\n					}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/mail/order.php\">\r\n		<operation>\r\n			<search><![CDATA[$mail->setHtml($this->load->view(\'mail/order_add\', $data));]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n		if ($order_info[\'language_code\'] == \'fa-ir\') {\r\n			$mail->setHtml($this->load->view(\'mail/order_add_farsi\', $data));\r\n		} else {\r\n			$mail->setHtml($this->load->view(\'mail/order_add\', $data));\r\n		}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2017-07-24 15:53:28'),
(5, 0, 'SEO Url Fix - oc 3.x', 'seo_url_fix_oc3x', 'Mojtaba Moghani', '1.0', 'https://opencartfarsi.com/', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n	<name>SEO Url Fix - oc 3.x</name>\r\n	<code>seo_url_fix_oc3x</code>\r\n	<version>1.0</version>\r\n	<author>Mojtaba Moghani</author>\r\n	<link>https://opencartfarsi.com/</link>\r\n 	<file path=\"catalog/controller/startup/seo_url.php\">\r\n		<operation>\r\n			<search index=\"0\"><![CDATA[} elseif ($key == \'path\') {]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n} elseif ($key == \'route\') {\r\n	$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"seo_url WHERE `query` = \'\" . $this->db->escape($value) . \"\' AND store_id = \'\" . (int)$this->config->get(\'config_store_id\') . \"\' AND language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\'\");\r\n   	if ($query->num_rows && $query->row[\'keyword\']) {\r\n	 	$url .= \'/\' . $query->row[\'keyword\'];\r\n	 	unset($data[$key]);\r\n   	} else if ($data[\'route\'] == \"common/home\") {\r\n		$url .= \'/\'; \r\n   	}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2020-06-04 22:26:03'),
(6, 0, 'Product Auto Assign To Parent Categories', 'product_auto_assign_to_parent_categories', 'Mojtaba Moghani', '3.0', 'http://opencartfarsi.com', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n	<name>Product Auto Assign To Parent Categories</name>\r\n	<code>product_auto_assign_to_parent_categories</code>\r\n	<version>3.0</version>\r\n	<author>Mojtaba Moghani</author>\r\n	<link>http://opencartfarsi.com</link>\r\n	<file path=\"admin/controller/catalog/product.php\">\r\n		<operation>\r\n			<search><![CDATA[$this->load->model(\'design/layout\');]]></search>\r\n			<add position=\"before\"><![CDATA[		if (isset($this->request->post[\'autoassign\'])) {\r\n			$data[\'autoassign\'] = $this->request->post[\'autoassign\'];\r\n		} else {\r\n			$data[\'autoassign\'] = \'\';\r\n		}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"admin/language/en-gb/catalog/product.php\">\r\n		<operation>\r\n			<search><![CDATA[$_[\'entry_category\']]]></search>\r\n			<add position=\"before\"><![CDATA[$_[\'entry_autoassign\']        = \'Assign to all parents of selected categories\';]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"admin/language/fa-ir/catalog/product.php\">\r\n		<operation>\r\n			<search><![CDATA[$_[\'entry_category\']]]></search>\r\n			<add position=\"before\"><![CDATA[$_[\'entry_autoassign\']        = \'تخصیص به همه والدهای دسته بندی های انتخاب شده\';]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"admin/model/catalog/product.php\">\r\n		<operation>\r\n			<search><![CDATA[if (isset($data[\'product_category\'])) {]]></search>\r\n			<add position=\"replace\" offset=\"4\"><![CDATA[		if (empty($data[\'autoassign\'])) {\r\n		if (isset($data[\'product_category\'])) {\r\n			foreach ($data[\'product_category\'] as $category_id) {\r\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_to_category SET product_id = \'\" . (int)$product_id . \"\', category_id = \'\" . (int)$category_id . \"\'\");\r\n			}		\r\n		}\r\n    } else {\r\n		if (isset($data[\'product_category\'])) {\r\n			$all_cats = array();\r\n			foreach ($data[\'product_category\'] as $category_id) {\r\n				$parent_cats = explode(\".\", $this->getCategoryParentsIds($category_id));\r\n				$all_cats = array_merge($all_cats, $parent_cats);\r\n			}\r\n			$all_cats = array_unique($all_cats);\r\n			foreach($all_cats as $category_id) {\r\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_to_category SET product_id = \'\" . (int)$product_id . \"\', category_id = \'\" . (int)$category_id . \"\'\");\r\n			}\r\n		}\r\n    }		]]></add>\r\n		</operation>\r\n    \r\n		<operation>\r\n			<search><![CDATA[public function addProduct($data) {]]></search>\r\n			<add position=\"before\"><![CDATA[  public function getCategoryParentsIds($category_id) {\r\n		$query = $this->db->query(\"SELECT c.category_id, c.parent_id FROM \" . DB_PREFIX . \"category c WHERE c.category_id = \'\" . (int)$category_id . \"\' ORDER BY c.sort_order\");\r\n		\r\n		$category_info = $query->row;\r\n		\r\n		if ($category_info[\'parent_id\']) {\r\n			return $this->getCategoryParentsIds($category_info[\'parent_id\']) . \".\" . $category_info[\'category_id\'];\r\n		} else {\r\n			return $category_info[\'category_id\'];\r\n		}\r\n	}\r\n	]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"admin/view/template/catalog/product_form.twig\">\r\n		<operation>\r\n			<search><![CDATA[<input type=\"text\" name=\"category\" value=\"\" placeholder=\"{{ entry_category }}\" id=\"input-category\" class=\"form-control\" />]]></search>\r\n			<add position=\"before\"><![CDATA[<p><label><input type=\"checkbox\" name=\"autoassign\" value=\"1\" {% if autoassign %} checked=\"checked\" {% endif %} /> {{ entry_autoassign }}</label></p>]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2017-07-24 15:57:28'),
(7, 0, 'TO TOP', 'totop', 'Dotbox Creative', '1.1', 'http://www.dotboxcreative.com', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n	<name>TO TOP</name>\r\n	<code>totop</code>\r\n	<version>1.1</version>\r\n	<author>Dotbox Creative</author>\r\n	<link>http://www.dotboxcreative.com</link>\r\n	<file path=\"catalog/view/theme/*/template/common/footer.twig\">\r\n		<operation>\r\n			<search><![CDATA[</body></html>]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n<style type=\"text/css\">\r\n	#ToTopHover {background: url(\'image/totop.png\') no-repeat left -51px;cursor: pointer;width: 51px;height: 51px;display: block;overflow: hidden;float: left;opacity: 0;-moz-opacity: 0;filter: alpha(opacity=0);}\r\n	#ToTop {display: none;text-decoration: none;position: fixed;bottom: 20px;right: 20px;overflow: hidden;width: 51px;height: 51px;border: none;text-indent: -999px;background: url(\'image/totop.png\') no-repeat left top;}\r\n</style>\r\n<script type=\"text/javascript\">\r\n	jQuery(document).ready(function(){$().UItoTop({easingType:\'easeOutQuint\'});});\r\n	(function($){\r\n		$.fn.UItoTop = function(options) {\r\n			var defaults = {\r\n				text: \'To Top\',\r\n				min: 200,\r\n				inDelay:600,\r\n				outDelay:400,\r\n				containerID: \'ToTop\',\r\n				containerHoverID: \'ToTopHover\',\r\n				scrollSpeed: 1200,\r\n				easingType: \'linear\'\r\n			};\r\n			var settings = $.extend(defaults, options);\r\n			var containerIDhash = \'#\' + settings.containerID;\r\n			var containerHoverIDHash = \'#\'+settings.containerHoverID;\r\n			$(\'body\').append(\'<a id=\"\'+settings.containerID+\'\">\'+settings.text+\'</a>\');\r\n			$(containerIDhash).hide().click(function(){\r\n				$(\'html, body\').animate({scrollTop: 0}, settings.scrollSpeed);\r\n				event.preventDefault();\r\n			})\r\n			.prepend(\'<span id=\"\'+settings.containerHoverID+\'\"></span>\')\r\n			.hover(function() {\r\n					$(containerHoverIDHash, this).stop().animate({\r\n						\'opacity\': 1\r\n					}, 600, \'linear\');\r\n				}, function() { \r\n					$(containerHoverIDHash, this).stop().animate({\r\n						\'opacity\': 0\r\n					}, 700, \'linear\');\r\n				});			\r\n			$(window).scroll(function() {\r\n				var sd = $(window).scrollTop();\r\n				if(typeof document.body.style.maxHeight === \"undefined\") {\r\n					$(containerIDhash).css({\r\n						\'position\': \'absolute\',\r\n						\'top\': $(window).scrollTop() + $(window).height() - 50\r\n					});\r\n				}\r\n				if ( sd > settings.min ) \r\n					$(containerIDhash).fadeIn(settings.inDelay);\r\n				else \r\n					$(containerIDhash).fadeOut(settings.Outdelay);\r\n			});\r\n	};\r\n	})(jQuery);\r\n</script>\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2017-07-24 15:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(1, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(2, 'Home Page', 'latest', '{\"name\":\"Home Page\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(3, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(4, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(5, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(6, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11),
(13, 'select', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(11, 1, 'Size'),
(12, 1, 'Delivery Date'),
(1, 2, 'دکمه رادیویی'),
(2, 2, 'چک باکس'),
(4, 2, 'متن'),
(5, 2, 'انتخاب'),
(6, 2, 'متن طولانی'),
(7, 2, 'فایل'),
(8, 2, 'تاریخ'),
(9, 2, 'زمان'),
(10, 2, 'تاریخ و زمان'),
(11, 2, 'اندازه'),
(12, 2, 'تاریخ تحویل'),
(13, 2, 'رنگ');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3),
(49, 13, '', 0),
(50, 13, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'بزرگ'),
(32, 2, 1, 'کوچک'),
(45, 2, 2, 'چک باکس 4'),
(44, 2, 2, 'چک باکس 3'),
(31, 2, 1, 'متوسط'),
(42, 2, 5, 'زرد'),
(41, 2, 5, 'سبز'),
(39, 2, 5, 'قرمز'),
(40, 2, 5, 'آبی'),
(23, 2, 2, 'چک باکس 1'),
(24, 2, 2, 'چک باکس 2'),
(48, 2, 11, 'بزرگ'),
(47, 2, 11, 'متوسط'),
(46, 2, 11, 'کوچک'),
(49, 2, 13, 'آبی'),
(50, 2, 13, 'سیاه');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT 0,
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT 1.00000000,
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_shipment`
--

CREATE TABLE `oc_order_shipment` (
  `order_shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(14, 1, 'Expired'),
(15, 1, 'Processed'),
(16, 1, 'Voided'),
(1, 2, 'در انتظار'),
(2, 2, 'در حال پردازش'),
(3, 2, 'ارسال شده'),
(5, 2, 'کامل شده'),
(7, 2, 'لغو شده'),
(8, 2, 'امتناع شده'),
(9, 2, 'برگشت لغو شده'),
(10, 2, 'ناموفق'),
(11, 2, 'بازپرداخت شده'),
(12, 2, 'برگشت خورده'),
(13, 2, 'وجه برگشت خورده توسط بانک'),
(14, 2, 'منقضی شده'),
(15, 2, 'اقدام شده'),
(16, 2, 'باطل شده');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `points` int(8) NOT NULL DEFAULT 0,
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `weight_class_id` int(11) NOT NULL DEFAULT 0,
  `length` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `width` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `height` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `length_class_id` int(11) NOT NULL DEFAULT 0,
  `subtract` tinyint(1) NOT NULL DEFAULT 1,
  `minimum` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(215, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/7b3882bdc0ec0f967ce6c668a3cd2f88910f81c6_1604820526.jpg', 11, 1, '21676.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(216, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/7b3882bdc0ec0f967ce6c668a3cd2f88910f81c6_1604820526.jpg', 11, 1, '72203.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(217, 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/111210633.jpg', 11, 1, '95988.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(218, 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/111210633.jpg', 11, 1, '63329.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(219, 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/111210633.jpg', 11, 1, '28680.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(220, 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/111210633.jpg', 11, 1, '53413.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(214, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/7b3882bdc0ec0f967ce6c668a3cd2f88910f81c6_1604820526.jpg', 11, 1, '81027.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(213, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/7b3882bdc0ec0f967ce6c668a3cd2f88910f81c6_1604820526.jpg', 11, 1, '44897.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(167, 'تبلت اپل 32 intel ابی پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/113804981.jpg', 13, 1, '81403.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 2, '2021-02-17 15:23:31', '2021-02-22 09:33:58'),
(206, 'تبلت اپل 32 intel ابی پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/113804981.jpg', 13, 1, '72323.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(207, 'تبلت اپل 32 intel ابی پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/113804981.jpg', 13, 1, '17406.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(208, 'تبلت اپل 32 intel ابی پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/113804981.jpg', 13, 1, '70061.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(166, 'تبلت اپل 32 intel سبز فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/114561690.jpg', 13, 1, '98087.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2021-02-17 15:23:28', '2021-02-22 09:34:21'),
(209, 'تبلت اپل 32 intel سبز فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/114561690.jpg', 13, 1, '80252.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(165, 'تبلت اپل 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/110767200.jpg', 13, 1, '7000.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '2021-02-17 15:23:19', '2021-02-28 09:41:41'),
(204, 'تبلت اپل 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/110767200.jpg', 13, 1, '94244.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(205, 'تبلت اپل 32 intel ابی پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/113804981.jpg', 13, 1, '50218.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(199, 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', '', '', '', '', '', '', 1, 6, 'catalog/تی شرت/117176566.jpg', 0, 1, '68359.0000', 0, 0, '2021-02-23', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(200, 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', '', '', '', '', '', '', 1, 6, 'catalog/تی شرت/117176566.jpg', 0, 1, '91139.0000', 0, 0, '2021-02-23', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(201, 'تبلت اپل 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/110767200.jpg', 13, 1, '50621.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(212, 'تبلت اپل 32 intel سبز فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/114561690.jpg', 13, 1, '79686.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(133, 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/111210633.jpg', 11, 1, '46566.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-17 09:56:35', '2021-02-22 09:36:01'),
(170, 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', '', '', '', '', '', '', 1, 6, 'catalog/تی شرت/117176566.jpg', 0, 1, '93773.0000', 0, 0, '2021-02-23', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 08:19:23', '2021-02-23 08:24:27'),
(171, 'تبلت اپل 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/110767200.jpg', 13, 1, '29167.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:28:48', '2021-02-23 10:29:01'),
(172, 'تبلت اپل 32 intel ابی پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/113804981.jpg', 13, 1, '64517.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:28:48', '2021-02-23 10:29:10'),
(173, 'تبلت اپل 32 intel سبز فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/114561690.jpg', 13, 1, '35083.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:28:48', '2021-02-23 10:28:48'),
(174, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/7b3882bdc0ec0f967ce6c668a3cd2f88910f81c6_1604820526.jpg', 11, 1, '81862.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:28:48', '2021-02-23 10:28:48'),
(175, 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/111210633.jpg', 11, 1, '4063.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:28:48', '2021-02-23 10:28:48'),
(176, 'تبلت سامسونگ 32 intel سبز و ابی فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/5072850.jpg', 11, 1, '74730.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:28:48', '2021-02-23 10:28:48'),
(141, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/7b3882bdc0ec0f967ce6c668a3cd2f88910f81c6_1604820526.jpg', 11, 1, '61462.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-17 09:56:39', '2021-02-22 09:35:33'),
(144, 'تبلت سامسونگ 32 intel سبز و ابی فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/5072850.jpg', 11, 1, '83119.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-17 09:56:39', '2021-02-22 09:36:26'),
(211, 'تبلت اپل 32 intel سبز فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/114561690.jpg', 13, 1, '31208.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(210, 'تبلت اپل 32 intel سبز فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/114561690.jpg', 13, 1, '6683.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(202, 'تبلت اپل 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/110767200.jpg', 13, 1, '39793.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(203, 'تبلت اپل 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/110767200.jpg', 13, 1, '78913.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2021-02-23 10:30:45', '2021-02-23 10:30:45'),
(180, 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', '', '', '', '', '', '', 1, 6, 'catalog/تی شرت/117176566.jpg', 0, 1, '75186.0000', 0, 0, '2021-02-23', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:28:48', '2021-02-23 10:28:48'),
(181, 'تبلت اپل 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/110767200.jpg', 13, 1, '39194.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(182, 'تبلت اپل 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/110767200.jpg', 13, 1, '70409.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(183, 'تبلت اپل 32 intel ابی پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/113804981.jpg', 13, 1, '34465.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(184, 'تبلت اپل 32 intel ابی پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/113804981.jpg', 13, 1, '61095.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(185, 'تبلت اپل 32 intel سبز فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/114561690.jpg', 13, 1, '2084.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(186, 'تبلت اپل 32 intel سبز فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/تبلت/114561690.jpg', 13, 1, '27132.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(187, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/7b3882bdc0ec0f967ce6c668a3cd2f88910f81c6_1604820526.jpg', 11, 1, '29410.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(188, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/7b3882bdc0ec0f967ce6c668a3cd2f88910f81c6_1604820526.jpg', 11, 1, '65653.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(189, 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/111210633.jpg', 11, 1, '40035.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(190, 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/111210633.jpg', 11, 1, '3215.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(191, 'تبلت سامسونگ 32 intel سبز و ابی فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/5072850.jpg', 11, 1, '95973.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(192, 'تبلت سامسونگ 32 intel سبز و ابی فلزی', '', '', '', '', '', '', '', 1, 6, 'catalog/demo/product/5072850.jpg', 11, 1, '70218.0000', 0, 0, '2021-02-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-02-23 10:30:42', '2021-02-23 10:30:42'),
(221, 'شارژر', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '63171.0000', 0, 0, '2021-02-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2021-02-28 07:46:47', '2021-02-28 07:46:47'),
(222, 'سیم شارژر', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '5201.0000', 0, 0, '2021-02-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 10, '2021-02-28 07:47:12', '2021-02-28 07:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(218, 2, 'تبلت سامسونگ 16 intel سبز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', ''),
(217, 2, 'تبلت سامسونگ 16 intel سبز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', ''),
(219, 2, 'تبلت سامسونگ 16 intel سبز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', ''),
(220, 2, 'تبلت سامسونگ 16 intel سبز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', ''),
(216, 2, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', ''),
(212, 2, 'تبلت اپل 32 intel سبز فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel سبز فلزی', '', ''),
(213, 2, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', ''),
(210, 2, 'تبلت اپل 32 intel سبز فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel سبز فلزی', '', ''),
(211, 2, 'تبلت اپل 32 intel سبز فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel سبز فلزی', '', ''),
(214, 2, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', ''),
(215, 2, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', ''),
(133, 2, 'تبلت سامسونگ 16 intel سبز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', ''),
(170, 2, 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', '', 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', ''),
(171, 2, 'تبلت اپل 16و32 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 16 amd قرمز پلاستیکی', '', ''),
(172, 2, 'تبلت اپل 32 intel ابی پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel ابی پلاستیکی', '', ''),
(173, 2, 'تبلت اپل 32 intel سبز فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel سبز فلزی', '', ''),
(174, 2, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', ''),
(141, 2, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', ''),
(183, 2, 'تبلت اپل 32 intel ابی پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel ابی پلاستیکی', '', ''),
(184, 2, 'تبلت اپل 32 intel ابی پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel ابی پلاستیکی', '', ''),
(185, 2, 'تبلت اپل 32 intel سبز فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel سبز فلزی', '', ''),
(144, 2, 'تبلت سامسونگ 32 intel سبز و ابی فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 32 intel سبز و ابی فلزی', 'تبلت سامسونگ 32 intel سبز و ابی فلزی', ''),
(181, 2, 'تبلت اپل 16و32 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 16 amd قرمز پلاستیکی', '', ''),
(182, 2, 'تبلت اپل 16و32 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 16 amd قرمز پلاستیکی', '', ''),
(175, 2, 'تبلت سامسونگ 16 intel سبز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', ''),
(176, 2, 'تبلت سامسونگ 32 intel سبز و ابی فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 32 intel سبز و ابی فلزی', 'تبلت سامسونگ 32 intel سبز و ابی فلزی', ''),
(180, 2, 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', '', 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', ''),
(165, 2, 'موبایل ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 16 amd قرمز پلاستیکی', '', ''),
(166, 2, 'تبلت اپل 32 intel سبز فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel سبز فلزی', '', ''),
(167, 2, 'تبلت اپل 32 intel ابی پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel ابی پلاستیکی', '', ''),
(186, 2, 'تبلت اپل 32 intel سبز فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel سبز فلزی', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(187, 2, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', ''),
(188, 2, 'تبلت سامسونگ 16 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', 'تبلت سامسونگ 16 amd قرمز پلاستیکی', ''),
(189, 2, 'تبلت سامسونگ 16 intel سبز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', ''),
(190, 2, 'تبلت سامسونگ 16 intel سبز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 16 intel قرمز پلاستیکی', '', ''),
(191, 2, 'تبلت سامسونگ 32 intel سبز و ابی فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 32 intel سبز و ابی فلزی', 'تبلت سامسونگ 32 intel سبز و ابی فلزی', ''),
(192, 2, 'تبلت سامسونگ 32 intel سبز و ابی فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text&quot;&gt;\r\n                                تبلت Samsung Galaxy Tab A 8.0 یکی از \r\nتبلت های میان رده سامسونگ به حساب می رود که در سال 2019 میلادی رونمایی و\r\n روانه بازار شد. مشخصات سخت افزاری و نرم افزاری متوسط و حضور برخی قابلیت\r\n های کاربردی، Tab A 8.0 را به گزینه ای مناسب در میان تبلت های میان رده \r\nتبدیل کرده است. صفحه نمایش Tab A 8.0، صفحه نمایشی 8.0 اینچ و از نوع TFT \r\nمی باشد. رزولوشن این صفحه نمایش برابر با 1280 × 800 پیکسل و تراکم پیکسلی\r\n آن نیز برابر با 189 پیکسل بر اینچ می باشد. چیپست به کار گرفته شده در \r\nTab A 8.0، چیپست میان رده Snapdragon 429 می باشد که از یک پردازنده هشت \r\nهسته با کلاک 2.0 گیگاهرتز و همچنین پرردازنده گرافیکی Adreno 504 تشکیل \r\nشده است. در نظر گرفته شدن حافظه رم 2 گیگابایتی در کنار این چیپست میان \r\nرده، قدرت پردازشی متوسطی را برای Tab A 8.0 به ارمغان می آورد به طوری که \r\nاین تبلت قادر به اجرا بازی ها و برنامه های نسبتا سنگین نیز می باشد. \r\nحافظه داخلی Tab A 8.0 برابر با 32 گیگابایت می باشد که البته افزایش آن تا\r\n 1000 گیگابایت دیگر نیز به کمک کارت های حافظه جانبی، امکان پذیر می باشد.\r\n سامسونگ تبلت جدید خود را به یک دوربین 8 مگاپیکسل در قسمت پشت تبلت و به \r\nعنوان دوربین اصلی مجهز کرده است در حالی که در قسمت جلو تبلت نیز یک \r\nدوربین 2 مگاپیکسل به عنوان دوربین سلفی تبلت به کار گرفته شده است. از \r\nدیگر ویژگی های تبلت میان رده و جدید سامسونگ می توان به سیستم عامل \r\nAndroid 9.0 PIE، درگاه MICRO USB و باتری قدرتمند 5100 میلی آمپر ساعت، \r\nاشاره کرد. خرید تبلت Samsung Galaxy Tab A 8.0 به کاربرانی که قصد انجام \r\nکارهای روزمره خود یا اجرا برخی برنامه های نه چندان سنگین را در صفحه \r\nنمایش معمولی و با کیفیت Tab A 8.0 داشته و به تماشای فیلم و ویدیو در تبلت\r\n نیز علاقه مند می باشند، پیشنهاد می شود.\r\n\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت سامسونگ 32 intel سبز و ابی فلزی', 'تبلت سامسونگ 32 intel سبز و ابی فلزی', ''),
(221, 2, 'شارژر', '', '', 'شارژر', '', ''),
(222, 2, 'سیم شارژر', '', '', 'سیم شارژر', '', ''),
(199, 2, 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', '', 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', ''),
(200, 2, 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', '', 'تی شرت ال سی وایکیکی ابی M L XL XXL', '', ''),
(201, 2, 'تبلت اپل 16و32 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 16 amd قرمز پلاستیکی', '', ''),
(202, 2, 'تبلت اپل 16و32 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 16 amd قرمز پلاستیکی', '', ''),
(203, 2, 'تبلت اپل 16و32 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 16 amd قرمز پلاستیکی', '', ''),
(204, 2, 'تبلت اپل 16و32 amd قرمز پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 16 amd قرمز پلاستیکی', '', ''),
(205, 2, 'تبلت اپل 32 intel ابی پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel ابی پلاستیکی', '', ''),
(206, 2, 'تبلت اپل 32 intel ابی پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel ابی پلاستیکی', '', ''),
(207, 2, 'تبلت اپل 32 intel ابی پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel ابی پلاستیکی', '', ''),
(208, 2, 'تبلت اپل 32 intel ابی پلاستیکی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel ابی پلاستیکی', '', ''),
(209, 2, 'تبلت اپل 32 intel سبز فلزی', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;c-mask__text c-mask__text--product-summary js-mask__text is-active&quot;&gt;\r\n                                تبلت مدل GALAXY TAB S6 از محصولات جدید \r\nسامسونگ است که با صفحه‌نمایش 10.4اینچی طراحی و تولید شده است. بدنه‌ی \r\nتمام آلومبنیومی این تبلت 5.7 میلی‌متر ضخامت دارد و از کیفیت ساخت و \r\nاستحکام خوبی برخوردار است. تراشه Exynos 9611  این تبلت، دارای پردازنده‌ی\r\n 8هسته‌ای Cortex-A73  با پردازشگر گرافیکی Mali-G72 MP3 است. رم4 \r\nگیگابایتی و حافظه‌ی 64 گیگابایتی هم از دیگر مشخصات فنی این محصول است. یک\r\n باتری لیتیوم‌-پلیمر 7040 میلی‌آمپری هم وظیفه‌ی توان‌رسانی به این قطعات \r\nسخت‌افزاری و صفحه‌نمایش را به‌ عهده دارد. درمجموع قطعات سخت‌افزاری این \r\nمدل طوری انتخاب شده‌اند که هم توان کاری خوبی داشته باشند و هم باعث \r\nافزایش بیش‌ازحد قیمت نهایی کالا نشوند. این تبلت قابلیت اتصال سیم‌کارت‌ \r\nدارد و شبکه‌های ارتباطی 2G ،3G و 4G را پشتیبانی می‌کند و می‌توانید در \r\nتمامی شرایط با GALAXY TAB S6 lite آنلاین باشید. دوربین پشتی یا همان \r\nدوربین اصلی این تبلت از رزولوشن 8 مگاپیکسل برخورداراست و دوربین جلو یا \r\nهمان سلفی هم کیفیت 5 مگاپیکسلی دارد. درمجموع می‌توان GALAXY TAB S6 lite \r\nرا یک محصول خوش‌ساخت و یک همراه همیشگی برای انجام انواع امور روزمره در \r\nیک صفحه‌نمایش نسبتا بزرگ دانست.\r\n                            &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'تبلت اپل 32 intel سبز فلزی', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_filter`
--

INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES
(133, 9),
(133, 26),
(133, 28),
(133, 72),
(133, 76),
(141, 9),
(141, 27),
(141, 28),
(141, 72),
(141, 77),
(144, 10),
(144, 26),
(144, 28),
(144, 63),
(144, 73),
(144, 76),
(165, 9),
(165, 27),
(165, 30),
(165, 72),
(165, 73),
(165, 77),
(166, 10),
(166, 26),
(166, 30),
(166, 73),
(166, 76),
(167, 9),
(167, 30),
(167, 63),
(167, 73),
(167, 76),
(170, 63),
(170, 78),
(170, 80),
(170, 81),
(170, 82),
(170, 83),
(171, 9),
(171, 27),
(171, 30),
(171, 72),
(171, 73),
(171, 77),
(172, 9),
(172, 30),
(172, 63),
(172, 73),
(172, 76),
(173, 10),
(173, 26),
(173, 30),
(173, 73),
(173, 76),
(174, 9),
(174, 27),
(174, 28),
(174, 72),
(174, 77),
(175, 9),
(175, 26),
(175, 28),
(175, 72),
(175, 76),
(176, 10),
(176, 26),
(176, 28),
(176, 63),
(176, 73),
(176, 76),
(180, 63),
(180, 78),
(180, 80),
(180, 81),
(180, 82),
(180, 83),
(181, 9),
(181, 27),
(181, 30),
(181, 72),
(181, 73),
(181, 77),
(182, 9),
(182, 27),
(182, 30),
(182, 72),
(182, 73),
(182, 77),
(183, 9),
(183, 30),
(183, 63),
(183, 73),
(183, 76),
(184, 9),
(184, 30),
(184, 63),
(184, 73),
(184, 76),
(185, 10),
(185, 26),
(185, 30),
(185, 73),
(185, 76),
(186, 10),
(186, 26),
(186, 30),
(186, 73),
(186, 76),
(187, 9),
(187, 27),
(187, 28),
(187, 72),
(187, 77),
(188, 9),
(188, 27),
(188, 28),
(188, 72),
(188, 77),
(189, 9),
(189, 26),
(189, 28),
(189, 72),
(189, 76),
(190, 9),
(190, 26),
(190, 28),
(190, 72),
(190, 76),
(191, 10),
(191, 26),
(191, 28),
(191, 63),
(191, 73),
(191, 76),
(192, 10),
(192, 26),
(192, 28),
(192, 63),
(192, 73),
(192, 76),
(199, 63),
(199, 78),
(199, 80),
(199, 81),
(199, 82),
(199, 83),
(200, 63),
(200, 78),
(200, 80),
(200, 81),
(200, 82),
(200, 83),
(201, 9),
(201, 27),
(201, 30),
(201, 72),
(201, 73),
(201, 77),
(202, 9),
(202, 27),
(202, 30),
(202, 72),
(202, 73),
(202, 77),
(203, 9),
(203, 27),
(203, 30),
(203, 72),
(203, 73),
(203, 77),
(204, 9),
(204, 27),
(204, 30),
(204, 72),
(204, 73),
(204, 77),
(205, 9),
(205, 30),
(205, 63),
(205, 73),
(205, 76),
(206, 9),
(206, 30),
(206, 63),
(206, 73),
(206, 76),
(207, 9),
(207, 30),
(207, 63),
(207, 73),
(207, 76),
(208, 9),
(208, 30),
(208, 63),
(208, 73),
(208, 76),
(209, 10),
(209, 26),
(209, 30),
(209, 73),
(209, 76),
(210, 10),
(210, 26),
(210, 30),
(210, 73),
(210, 76),
(211, 10),
(211, 26),
(211, 30),
(211, 73),
(211, 76),
(212, 10),
(212, 26),
(212, 30),
(212, 73),
(212, 76),
(213, 9),
(213, 27),
(213, 28),
(213, 72),
(213, 77),
(214, 9),
(214, 27),
(214, 28),
(214, 72),
(214, 77),
(215, 9),
(215, 27),
(215, 28),
(215, 72),
(215, 77),
(216, 9),
(216, 27),
(216, 28),
(216, 72),
(216, 77),
(217, 9),
(217, 26),
(217, 28),
(217, 72),
(217, 76),
(218, 9),
(218, 26),
(218, 28),
(218, 72),
(218, 76),
(219, 9),
(219, 26),
(219, 28),
(219, 72),
(219, 76),
(220, 9),
(220, 26),
(220, 28),
(220, 72),
(220, 76);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(239, 165, 13, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(34, 239, 165, 13, 50, 2, 1, '5000.0000', '+', 0, '+', '0.00000000', '+'),
(33, 239, 165, 13, 49, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `points` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(133, 60),
(133, 62),
(141, 60),
(141, 62),
(144, 60),
(144, 62),
(165, 60),
(165, 62),
(166, 60),
(166, 62),
(167, 60),
(167, 62),
(170, 69),
(170, 70),
(171, 60),
(171, 62),
(172, 60),
(172, 62),
(173, 60),
(173, 62),
(174, 60),
(174, 62),
(175, 60),
(175, 62),
(176, 60),
(176, 62),
(180, 69),
(180, 70),
(181, 60),
(181, 62),
(182, 60),
(182, 62),
(183, 60),
(183, 62),
(184, 60),
(184, 62),
(185, 60),
(185, 62),
(186, 60),
(186, 62),
(187, 60),
(187, 62),
(188, 60),
(188, 62),
(189, 60),
(189, 62),
(190, 60),
(190, 62),
(191, 60),
(191, 62),
(192, 60),
(192, 62),
(199, 69),
(199, 70),
(200, 69),
(200, 70),
(201, 60),
(201, 62),
(202, 60),
(202, 62),
(203, 60),
(203, 62),
(204, 60),
(204, 62),
(205, 60),
(205, 62),
(206, 60),
(206, 62),
(207, 60),
(207, 62),
(208, 60),
(208, 62),
(209, 60),
(209, 62),
(210, 60),
(210, 62),
(211, 60),
(211, 62),
(212, 60),
(212, 62),
(213, 60),
(213, 62),
(214, 60),
(214, 62),
(215, 60),
(215, 62),
(216, 60),
(216, 62),
(217, 60),
(217, 62),
(218, 60),
(218, 62),
(219, 60),
(219, 62),
(220, 60),
(220, 62),
(221, 60),
(221, 62),
(221, 71),
(222, 60),
(222, 62),
(222, 71),
(222, 72);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(188, 0, 0),
(192, 0, 0),
(170, 0, 0),
(200, 0, 0),
(221, 0, 0),
(133, 0, 0),
(175, 0, 0),
(199, 0, 0),
(202, 0, 0),
(204, 0, 0),
(171, 0, 0),
(203, 0, 0),
(174, 0, 0),
(180, 0, 0),
(189, 0, 0),
(191, 0, 0),
(141, 0, 0),
(201, 0, 0),
(182, 0, 0),
(183, 0, 0),
(190, 0, 0),
(173, 0, 0),
(222, 0, 0),
(144, 0, 0),
(172, 0, 0),
(184, 0, 0),
(187, 0, 0),
(185, 0, 0),
(186, 0, 0),
(181, 0, 0),
(165, 0, 0),
(166, 0, 0),
(167, 0, 0),
(176, 0, 0),
(205, 0, 0),
(206, 0, 0),
(207, 0, 0),
(208, 0, 0),
(209, 0, 0),
(210, 0, 0),
(211, 0, 0),
(212, 0, 0),
(213, 0, 0),
(214, 0, 0),
(215, 0, 0),
(216, 0, 0),
(217, 0, 0),
(218, 0, 0),
(219, 0, 0),
(220, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(133, 0),
(141, 0),
(144, 0),
(165, 0),
(166, 0),
(167, 0),
(170, 0),
(171, 0),
(172, 0),
(173, 0),
(174, 0),
(175, 0),
(176, 0),
(180, 0),
(181, 0),
(182, 0),
(183, 0),
(184, 0),
(185, 0),
(186, 0),
(187, 0),
(188, 0),
(189, 0),
(190, 0),
(191, 0),
(192, 0),
(199, 0),
(200, 0),
(201, 0),
(202, 0),
(203, 0),
(204, 0),
(205, 0),
(206, 0),
(207, 0),
(208, 0),
(209, 0),
(210, 0),
(211, 0),
(212, 0),
(213, 0),
(214, 0),
(215, 0),
(216, 0),
(217, 0),
(218, 0),
(219, 0),
(220, 0),
(221, 0),
(222, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'برگردانده شد'),
(2, 2, 'اعتبار صادر شد'),
(3, 2, 'جایگزین ارسال شد');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'عدم دریافت محصول'),
(2, 2, 'دریافت محصول اشتباهی'),
(3, 2, 'اشتباه در سفارش'),
(4, 2, 'معیوب، جزئیات را بیان کنید'),
(5, 2, 'سایر، جزئیات را بیان کنید');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Awaiting Products'),
(3, 1, 'Complete'),
(1, 2, 'معلق'),
(2, 2, 'محصولات در دست اقدام'),
(3, 2, 'کامل شده');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_seo_url`
--

CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_seo_url`
--

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(1, 0, 1, 'information_id=3', 'privacy'),
(2, 0, 1, 'information_id=4', 'about-opencartfarsi-website'),
(3, 0, 1, 'information_id=5', 'terms'),
(4, 0, 1, 'information_id=6', 'delivery'),
(5, 0, 2, 'information_id=3', 'شرایط-عضویت'),
(6, 0, 2, 'information_id=4', 'درباره-فروشگاه-ساز-اپن-کارت-فارسی'),
(7, 0, 2, 'information_id=5', 'شرایط-خرید'),
(8, 0, 2, 'information_id=6', 'راهنمای-خرید'),
(249, 0, 2, 'manufacturer_id=11', 'سامسونگ'),
(250, 0, 2, 'manufacturer_id=12', 'لنوو'),
(253, 0, 2, 'manufacturer_id=13', 'اپل'),
(255, 0, 2, 'manufacturer_id=14', 'ایسوس'),
(266, 0, 2, 'category_id=60', 'تبلت'),
(265, 0, 2, 'category_id=62', 'کالای دیجیتال'),
(135, 0, 1, 'account/wishlist', 'wishlist'),
(136, 0, 1, 'account/account', 'my-account'),
(137, 0, 1, 'account/edit', 'edit-account'),
(138, 0, 1, 'account/password', 'change-password'),
(139, 0, 1, 'account/address', 'address-book'),
(140, 0, 1, 'account/reward', 'reward-points'),
(141, 0, 1, 'account/login', 'login'),
(142, 0, 1, 'account/logout', 'logout'),
(143, 0, 1, 'account/newsletter', 'newsletter'),
(144, 0, 1, 'account/forgotten', 'forgot-password'),
(145, 0, 1, 'account/download', 'downloads'),
(146, 0, 1, 'account/return', 'my-returns'),
(147, 0, 1, 'account/return/add', 'return-add'),
(148, 0, 1, 'account/transaction', 'transactions'),
(149, 0, 1, 'account/register', 'register'),
(150, 0, 1, 'account/recurring', 'recurring'),
(151, 0, 1, 'account/order', 'order-history'),
(152, 0, 1, 'account/voucher', 'gift-vouchers'),
(153, 0, 1, 'account/voucher/success', 'voucher-success'),
(154, 0, 1, 'affiliate/register', 'register-affiliate'),
(155, 0, 1, 'affiliate/login', 'affiliate-login'),
(156, 0, 1, 'checkout/cart', 'cart'),
(157, 0, 1, 'checkout/checkout', 'checkout'),
(158, 0, 1, 'checkout/success', 'checkout-success'),
(159, 0, 1, 'information/contact', 'contact'),
(160, 0, 1, 'information/sitemap', 'sitemap'),
(161, 0, 1, 'product/special', 'specials'),
(162, 0, 1, 'product/manufacturer', 'brands'),
(163, 0, 1, 'product/compare', 'compare-products'),
(164, 0, 1, 'product/search', 'search'),
(165, 0, 2, 'account/wishlist', 'wishlist'),
(166, 0, 2, 'account/account', 'my-account'),
(167, 0, 2, 'account/edit', 'edit-account'),
(168, 0, 2, 'account/password', 'change-password'),
(169, 0, 2, 'account/address', 'address-book'),
(170, 0, 2, 'account/reward', 'reward-points'),
(171, 0, 2, 'account/login', 'login'),
(172, 0, 2, 'account/logout', 'logout'),
(173, 0, 2, 'account/newsletter', 'newsletter'),
(174, 0, 2, 'account/forgotten', 'forgot-password'),
(175, 0, 2, 'account/download', 'downloads'),
(176, 0, 2, 'account/return', 'my-returns'),
(177, 0, 2, 'account/return/add', 'return-add'),
(178, 0, 2, 'account/transaction', 'transactions'),
(179, 0, 2, 'account/register', 'register'),
(180, 0, 2, 'account/recurring', 'recurring'),
(181, 0, 2, 'account/order', 'order-history'),
(182, 0, 2, 'account/voucher', 'gift-vouchers'),
(183, 0, 2, 'account/voucher/success', 'voucher-success'),
(184, 0, 2, 'affiliate/register', 'register-affiliate'),
(185, 0, 2, 'affiliate/login', 'affiliate-login'),
(186, 0, 2, 'checkout/cart', 'cart'),
(187, 0, 2, 'checkout/checkout', 'checkout'),
(188, 0, 2, 'checkout/success', 'checkout-success'),
(189, 0, 2, 'information/contact', 'contact'),
(190, 0, 2, 'information/sitemap', 'sitemap'),
(191, 0, 2, 'product/special', 'specials'),
(192, 0, 2, 'product/manufacturer', 'brands'),
(193, 0, 2, 'product/compare', 'compare-products'),
(194, 0, 2, 'product/search', 'search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_session`
--

CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_session`
--

INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('10b990d7a3338ad841b5039aae', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"G8akicbtZwBczfuWLcuakW3w5dKNkdpq\"}', '2021-02-21 17:01:15'),
('241fccc97da631afdff0795080', '{\"api_id\":\"1\"}', '2021-02-07 10:50:29'),
('2d82e72be99ea15eceefe6fcdb', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-24 11:15:56'),
('38ece5d957ce3a7d5af51f76eb', 'false', '2021-02-23 08:48:42'),
('3a55efddce3441b0b27f4dd1e6', 'false', '2021-02-16 15:22:50'),
('3c7d951233913a8c0f7b4e8750', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"dFpfwOnQ0VM0zRTqk7sMWnf8HGAxiFGq\"}', '2021-02-13 16:17:06'),
('41ce97dc4bce0740c04412f7b8', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-23 14:23:36'),
('4783926d718153a8b63b748632', '{\"api_id\":\"1\",\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-07 10:50:36'),
('4bc070f0a4bc846beb2b74100c', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-08 12:23:45'),
('4d2af45a01ebf463887eae8ae8', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-08 11:43:02'),
('4dea58c4f3b8bf817ab51e6152', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-08 12:11:24'),
('4e4998ca4864f7781977abb137', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-27 14:17:30'),
('520f1393aff8f6732303931f07', '{\"api_id\":\"1\"}', '2021-02-07 10:50:56'),
('560b1a7a96c78bdd4ad6aa7d73', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"captcha\":\"cde2ae\",\"user_id\":\"1\",\"user_token\":\"EsW6D7OAjhgBGacZtC1xqsRe2BuDTXeY\"}', '2021-02-28 10:25:25'),
('695763b65f9a2769654881ef09', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-09 10:01:49'),
('6ac052951f3d34cf8a2f8bf9b6', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"YdJjx5VW37ifYpRM2wKMCCvCuJCOKFgP\",\"captcha\":\"e232a3\"}', '2021-02-17 17:16:33'),
('778816b50e5196a1a9788875a7', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-13 09:14:32'),
('7c7773f22b42003dc47bd98495', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-08 11:09:18'),
('800fe020398bedd67a13b995f3', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"captcha\":\"929890\"}', '2021-02-27 14:13:40'),
('83971a1dbb0b964e8d26dd0e7d', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"ZVhXHi7lsiKgGIHcgxdHoWIXlQTAgy9M\"}', '2021-02-22 16:50:43'),
('87260b3fbe5e1a9ed295ccd3b2', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"sVEvDd2KPfDnn0ATFwRIV7yFVSs4kqhZ\"}', '2021-02-15 13:06:57'),
('8b3f12d1ea0b6981e3395fec45', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-08 17:52:07'),
('91003cad75bf8b1d2909ee8a97', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"compare\":[]}', '2021-02-24 16:42:09'),
('9ab9a84c1e648992e69b381c31', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-09 09:38:14'),
('9ad508328c002f7fbe3dcbcef5', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-27 10:37:26'),
('a914712a13899b86b4f6ca7954', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-09 10:41:18'),
('b193f0e3993f4c270268f5bcec', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"captcha\":\"c2a957\"}', '2021-02-08 18:44:40'),
('b349a2e6b4898133f36075d2b7', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-09 09:55:53'),
('c41441d5fef46a3e4f0540e5a8', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"k48AeqKkHD91CtTStYRvCHjbo41BtTTa\",\"captcha\":\"8c9502\"}', '2021-02-09 18:36:05'),
('c46dced454e459454fbf24a8da', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"wishlist\":[\"29\"],\"user_id\":\"1\",\"user_token\":\"2y7EHRpm5scq3jniHBRasieQL9tkLD9M\",\"captcha\":\"e37f68\"}', '2021-02-15 16:44:05'),
('c70a62ef53e84a280410ec2529', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"2sSQsb66SYubjes9sAi6gYJBOfOkq2I4\",\"captcha\":\"070c08\",\"compare\":[]}', '2021-02-23 14:14:24'),
('da6626ea7808bcd08e56fe80f8', '{\"user_id\":\"1\",\"user_token\":\"xUgXqg2cDZO5vjY5ZcSbCPPczMkvCamv\",\"language\":\"fa-ir\",\"currency\":\"TOM\",\"captcha\":\"15dcbd\",\"customer_id\":\"2\",\"payment_address\":{\"address_id\":\"3\",\"firstname\":\"\\u0639\\u0644\\u06cc\",\"lastname\":\"\\u0633\\u0645\\u06cc\\u0639\\u06cc\",\"company\":\"\",\"address_1\":\"\\u062a\\u0647\\u0631\\u0627\\u0646 \\u0634\\u0647\\u0631\\u0631\\u06cc\",\"address_2\":\"\",\"postcode\":\"1887973146\",\"city\":\"\\u0634\\u0647\\u0631\\u0631\\u06cc\",\"zone_id\":\"1538\",\"zone\":\"\\u062a\\u0647\\u0631\\u0627\\u0646\",\"zone_code\":\"TEH\",\"country_id\":\"101\",\"country\":\"\\u0627\\u06cc\\u0631\\u0627\\u0646\",\"iso_code_2\":\"IR\",\"iso_code_3\":\"IRN\",\"address_format\":\"\",\"custom_field\":null},\"shipping_address\":{\"address_id\":\"3\",\"firstname\":\"\\u0639\\u0644\\u06cc\",\"lastname\":\"\\u0633\\u0645\\u06cc\\u0639\\u06cc\",\"company\":\"\",\"address_1\":\"\\u062a\\u0647\\u0631\\u0627\\u0646 \\u0634\\u0647\\u0631\\u0631\\u06cc\",\"address_2\":\"\",\"postcode\":\"1887973146\",\"city\":\"\\u0634\\u0647\\u0631\\u0631\\u06cc\",\"zone_id\":\"1538\",\"zone\":\"\\u062a\\u0647\\u0631\\u0627\\u0646\",\"zone_code\":\"TEH\",\"country_id\":\"101\",\"country\":\"\\u0627\\u06cc\\u0631\\u0627\\u0646\",\"iso_code_2\":\"IR\",\"iso_code_3\":\"IRN\",\"address_format\":\"\",\"custom_field\":null}}', '2021-02-07 16:30:49'),
('e0f87ed6da4fe75e333a8a67fa', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-07 13:05:05'),
('e52d13132aaac36baad30b1a3f', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"6M3aSR9vCFq3VHUcwS7pQ57FMd0LgMBG\"}', '2021-02-14 17:03:33'),
('e596e8099c39feca0aa81a6092', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-23 14:15:18'),
('eb9d0a5d9ff829892f99b8e4cc', 'false', '2021-02-17 15:45:16'),
('ebe606a07ec7de1d57f870766f', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"vcRcDChZ9UkSjsIEt957AXYbQQVm4qv6\",\"compare\":[\"165\",\"166\"]}', '2021-02-20 14:20:48'),
('edf4dd58c8bce358927ce21759', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"captcha\":\"c52c6a\",\"compare\":[],\"user_id\":\"1\",\"user_token\":\"c51EPvIfRuQWAaZZPYOWnxRaWIf1XqPG\"}', '2021-02-23 17:24:20'),
('f0010ff26df64da48025289a23', '{\"api_id\":\"1\",\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-07 10:50:56'),
('f14ff8b67824950fa9031ee39e', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-27 10:21:04'),
('f19dd78e4fb585a5de4208a5ac', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"user_id\":\"1\",\"user_token\":\"C079drLdsmLpaPRYyCPAf9zn4JKVnsjd\"}', '2021-02-16 16:59:50'),
('f3a62ce3b5b475e930dd612d8f', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-08 15:32:37'),
('f98d0fa7021f38e2cabd8f5310', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"captcha\":\"e64aa7\"}', '2021-02-27 17:11:32'),
('fe759899ea1f9534bd7da086e4', '{\"language\":\"fa-ir\",\"currency\":\"TOM\"}', '2021-02-08 19:06:06'),
('fec29220e8517019a35ed139c4', '{\"language\":\"fa-ir\",\"currency\":\"TOM\",\"captcha\":\"e39d52\"}', '2021-02-07 10:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'module_category', 'module_category_status', '1', 0),
(2, 0, 'module_account', 'module_account_status', '1', 0),
(3, 0, 'captcha_basic', 'captcha_basic_status', '1', 0),
(4, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(5, 0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(6, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(7, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(8, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(9, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(10, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(11, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(12, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(13, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(14, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(15, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '0', 0),
(16, 0, 'shipping_flat', 'shipping_flat_cost', '5000.00', 0),
(17, 0, 'shipping_citylink', 'shipping_citylink_tax_class_id', '0', 0),
(18, 0, 'shipping_citylink', 'shipping_citylink_geo_zone_id', '0', 0),
(19, 0, 'shipping_citylink', 'shipping_citylink_rate', '10:11.6,15:14.1,20:16.60,25:19.1,30:21.6,35:24.1,40:26.6,45:29.1,50:31.6,55:34.1,60:36.6,65:39.1,70:41.6,75:44.1,80:46.6,100:56.6,125:69.1,150:81.6,200:106.6', 0),
(20, 0, 'shipping_citylink', 'shipping_citylink_status', '1', 0),
(21, 0, 'shipping_citylink', 'shipping_citylink_sort_order', '2', 0),
(22, 0, 'shipping_item', 'shipping_item_cost', '4000', 0),
(23, 0, 'shipping_item', 'shipping_item_tax_class_id', '0', 0),
(24, 0, 'shipping_item', 'shipping_item_geo_zone_id', '0', 0),
(25, 0, 'shipping_item', 'shipping_item_status', '1', 0),
(26, 0, 'shipping_item', 'shipping_item_sort_order', '4', 0),
(27, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_rate', '10:15.99,12:19.99,14:20.99,16:21.99,18:21.99,20:21.99,22:26.99,24:30.99,26:34.99,28:38.99,30:42.99,35:52.99,40:62.99,45:72.99,50:82.99,55:92.99,60:102.99,65:112.99,70:122.99,75:132.99,80:142.99,85:152.99,90:162.99,95:172.99,100:182.99', 0),
(28, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_insurance', '150:0,500:12,1000:24,1500:36,2000:48,2500:60', 0),
(29, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_display_weight', '0', 0),
(30, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_display_insurance', '0', 0),
(31, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_display_time', '0', 0),
(32, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_tax_class_id', '0', 0),
(33, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_geo_zone_id', '0', 0),
(34, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_status', '1', 0),
(35, 0, 'shipping_parcelforce_48', 'shipping_parcelforce_48_sort_order', '5', 0),
(36, 0, 'shipping_weight', 'shipping_weight_8_status', '1', 0),
(37, 0, 'shipping_weight', 'shipping_weight_4_rate', '1:5000,2:6000,3:6500,4:7000,5:8000,20000:20000', 0),
(38, 0, 'shipping_weight', 'shipping_weight_8_rate', '1:4000,2:5000,3:5500,4:6000,5:7000,20000:18000', 0),
(39, 0, 'shipping_weight', 'shipping_weight_5_status', '1', 0),
(40, 0, 'shipping_weight', 'shipping_weight_5_rate', '1:6000,2:6500,3:7500,4:8000,5:8500,20000:30000', 0),
(41, 0, 'shipping_weight', 'shipping_weight_6_status', '0', 0),
(42, 0, 'shipping_weight', 'shipping_weight_6_rate', '1:4000,2:5000,3:5500,4:6000,5:7000,20000:18000', 0),
(43, 0, 'shipping_weight', 'shipping_weight_7_status', '0', 0),
(44, 0, 'shipping_weight', 'shipping_weight_3_rate', '', 0),
(45, 0, 'shipping_weight', 'shipping_weight_3_status', '0', 0),
(46, 0, 'shipping_weight', 'shipping_weight_7_rate', '1:4000,2:5000,3:5500,4:6000,5:7000,20000:18000', 0),
(47, 0, 'shipping_weight', 'shipping_weight_4_status', '1', 0),
(48, 0, 'shipping_weight', 'shipping_weight_tax_class_id', '0', 0),
(49, 0, 'shipping_weight', 'shipping_weight_status', '1', 0),
(50, 0, 'shipping_weight', 'shipping_weight_sort_order', '7', 0),
(51, 0, 'shipping_weight', 'shipping_weight_9_rate', '1:4000,2:5000,3:5500,4:6000,5:7000,20000:18000', 0),
(52, 0, 'shipping_weight', 'shipping_weight_9_status', '0', 0),
(53, 0, 'total_sub_total', 'sub_total_sort_order', '1', 0),
(54, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(55, 0, 'total_tax', 'total_tax_status', '1', 0),
(56, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(57, 0, 'total_total', 'total_total_sort_order', '9', 0),
(58, 0, 'total_total', 'total_total_status', '1', 0),
(59, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(60, 0, 'total_credit', 'total_credit_status', '1', 0),
(61, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(62, 0, 'total_reward', 'total_reward_status', '1', 0),
(63, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(64, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(65, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(66, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(67, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(68, 0, 'total_voucher', 'total_voucher_sort_order', '8', 0),
(69, 0, 'total_voucher', 'total_voucher_status', '1', 0),
(502, 0, 'developer', 'developer_sass', '1', 0),
(500, 0, 'config', 'config_error_filename', 'ocferror.log', 0),
(499, 0, 'config', 'config_error_log', '1', 0),
(498, 0, 'config', 'config_error_display', '0', 0),
(497, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(490, 0, 'config', 'config_compression', '0', 0),
(491, 0, 'config', 'config_secure', '0', 0),
(492, 0, 'config', 'config_password', '1', 0),
(493, 0, 'config', 'config_shared', '0', 0),
(494, 0, 'config', 'config_encryption', 'JNm0TCXWsJT3teKFBtupuZWB4wdJUKt8iTajGzoR3NQV34VD3dQiI5smuXDzb0mwdZFqRc4ihnYfIHnEG9LLMReIGGrc7EZIU3OtwTEeajL2QCE8nZZVBCRPwGUs0I8G3QYltdooOh1N2WxFH9TXssocOLLzC9bsioBkhHv05WMy6fr2eUGdb6HiJzM38CKjEA0YIDBy9GERf0fcqoAjXarwnmJumaFHTC41uL8m9Bfehw4SYk69MhBU9Tyn33g8Ob2m37hA66dNRO2fMdq2MdPkU1F5y8RArjCHmtOG789eoTTVAAFXDijHpO63PonWIIdsFs2IwwcEZ3Bs44rxDMNyH0vsb9NFXzulDZRBHzgIHmX21hzMTaZFxkSg8Ue2TdTezoFMUrVkpd07uF7Nh65HkWp9VB6ZEKk1VwRfqKdxps1xYEqAyCixEpfvEEcVyvGpJZfsI7TDWzaFxfHoP1JoNgPZC1nxhoKL03KzXZNyys3IMMnycOUw4m7Dqag5NpoJ8L8NON6hoRzM7jWxialalz5wbHD0hrSqT9I4KuSWOYyoBtbNKEiIPGpZWSbjVVNSm2wI2uRTKK3QoqszEGpv5Jc3W3zDNd4ngqnkMfDHUfs2R5OLirwV7UWBxeu5O44dsbKeem2zFhae499QWIsUZkVH5tWZbqeEZnf9UD7lJcB7c3ZnUNVdM68LNSzKhcWD9jlIsxiFqeLo4UZZNLjN87xBiQTfUrA9t9mzAZsfTkRU5RCXszRkNvoVj53e3XJHDu7kmBdD5Jtz28Ow3XTQHIYUcogGBpxRC3F0Ky2r9K7fatxVQOMw8Gx4JzzpC2JJpT13422eVECRnQ9PunYJReQvv3qsXswz7wScb1EVPd8X7RXfjafzjj8cSJrJkK1WkqffS6GR3GejxA6iUbc7N0BTGCVjSGQ0TnQaQZ2oESSjoutVMrICNzIgT9OEuoL5FCh3FbiKHZuxxli7CT1ow37G3zJeQ20JRf3JsVwD02SJTSahMYqRuMHMXv9F', 0),
(495, 0, 'config', 'config_file_max_size', '300000', 0),
(496, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(471, 0, 'config', 'config_affiliate_id', '4', 0),
(472, 0, 'config', 'config_return_id', '0', 0),
(473, 0, 'config', 'config_return_status_id', '2', 0),
(474, 0, 'config', 'config_captcha', 'basic', 0),
(475, 0, 'config', 'config_captcha_page', '[\"register\",\"guest\",\"review\",\"return\",\"contact\"]', 1),
(476, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(477, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(478, 0, 'config', 'config_mail_engine', 'mail', 0),
(479, 0, 'config', 'config_mail_parameter', '', 0),
(480, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(481, 0, 'config', 'config_mail_smtp_username', '', 0),
(482, 0, 'config', 'config_mail_smtp_password', '', 0),
(483, 0, 'config', 'config_mail_smtp_port', '25', 0),
(484, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(485, 0, 'config', 'config_mail_alert', '[\"order\",\"review\"]', 1),
(486, 0, 'config', 'config_mail_alert_email', '', 0),
(487, 0, 'config', 'config_maintenance', '0', 0),
(488, 0, 'config', 'config_seo_url', '0', 0),
(489, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(470, 0, 'config', 'config_affiliate_commission', '5', 0),
(469, 0, 'config', 'config_affiliate_auto', '0', 0),
(468, 0, 'config', 'config_affiliate_approval', '0', 0),
(463, 0, 'config', 'config_api_id', '1', 0),
(464, 0, 'config', 'config_stock_display', '0', 0),
(465, 0, 'config', 'config_stock_warning', '0', 0),
(466, 0, 'config', 'config_stock_checkout', '0', 0),
(467, 0, 'config', 'config_affiliate_group_id', '1', 0),
(461, 0, 'config', 'config_complete_status', '[\"3\",\"5\"]', 1),
(462, 0, 'config', 'config_fraud_status_id', '3', 0),
(460, 0, 'config', 'config_processing_status', '[\"3\",\"12\",\"1\",\"2\",\"5\"]', 1),
(459, 0, 'config', 'config_order_status_id', '1', 0),
(458, 0, 'config', 'config_checkout_id', '5', 0),
(457, 0, 'config', 'config_checkout_guest', '1', 0),
(456, 0, 'config', 'config_cart_weight', '1', 0),
(164, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(165, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(166, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(167, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(168, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(169, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(170, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(171, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(172, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(173, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(174, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(175, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(176, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(177, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(178, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(179, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(180, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(181, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(182, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(183, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(184, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(185, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(186, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(187, 0, 'theme_default', 'theme_default_status', '1', 0),
(188, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(189, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(190, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(191, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(192, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(193, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(194, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(195, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(196, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(197, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(198, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(199, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(200, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(201, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(202, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(203, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(204, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(205, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(206, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(207, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(208, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(209, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(210, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(211, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(212, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(213, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(214, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(215, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(216, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(217, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(218, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(219, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(220, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(221, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(222, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(223, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(224, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(225, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(226, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(227, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(228, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(229, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(230, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(231, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(232, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(233, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(234, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(235, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(236, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(237, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(501, 0, 'developer', 'developer_theme', '0', 0),
(454, 0, 'config', 'config_account_id', '3', 0),
(455, 0, 'config', 'config_invoice_prefix', 'INV-2021-00', 0),
(453, 0, 'config', 'config_login_attempts', '5', 0),
(452, 0, 'config', 'config_customer_price', '0', 0),
(450, 0, 'config', 'config_customer_group_id', '1', 0),
(451, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(449, 0, 'config', 'config_customer_search', '0', 0),
(448, 0, 'config', 'config_customer_activity', '0', 0),
(447, 0, 'config', 'config_customer_online', '1', 0),
(446, 0, 'config', 'config_tax_customer', '', 0),
(445, 0, 'config', 'config_tax_default', '', 0),
(444, 0, 'config', 'config_tax', '0', 0),
(443, 0, 'config', 'config_voucher_max', '1000', 0),
(442, 0, 'config', 'config_voucher_min', '1', 0),
(441, 0, 'config', 'config_review_guest', '1', 0),
(440, 0, 'config', 'config_review_status', '1', 0),
(439, 0, 'config', 'config_limit_admin', '20', 0),
(438, 0, 'config', 'config_product_count', '1', 0),
(437, 0, 'config', 'config_weight_class_id', '1', 0),
(436, 0, 'config', 'config_length_class_id', '1', 0),
(435, 0, 'config', 'config_currency_auto', '0', 0),
(434, 0, 'config', 'config_currency', 'TOM', 0),
(433, 0, 'config', 'config_admin_language', 'fa-ir', 0),
(432, 0, 'config', 'config_language', 'fa-ir', 0),
(431, 0, 'config', 'config_zone_id', '1566', 0),
(430, 0, 'config', 'config_country_id', '101', 0),
(429, 0, 'config', 'config_comment', '', 0),
(428, 0, 'config', 'config_open', '9 صبح تا 10 شب', 0),
(427, 0, 'config', 'config_image', '', 0),
(426, 0, 'config', 'config_fax', '', 0),
(425, 0, 'config', 'config_telephone', '123456789', 0),
(424, 0, 'config', 'config_email', 'alisamie97@gmail.com', 0),
(423, 0, 'config', 'config_geocode', '', 0),
(416, 0, 'config', 'config_meta_description', 'توضیحات شما برای گوگل', 0),
(422, 0, 'config', 'config_address', 'آدرس فروشگاه \r\n(فروشگاه ساز اپن کارت فارسی دات کام)', 0),
(421, 0, 'config', 'config_owner', 'نام صاحب فروشگاه', 0),
(419, 0, 'config', 'config_layout_id', '4', 0),
(420, 0, 'config', 'config_name', 'نام فروشگاه شما ...', 0),
(418, 0, 'config', 'config_theme', 'default', 0),
(417, 0, 'config', 'config_meta_keyword', '', 0),
(415, 0, 'config', 'config_meta_title', 'عنوان فروشگاه شما ...', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_shipping_courier`
--

CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_shipping_courier`
--

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post'),
(7, 'citylink', 'Citylink');

-- --------------------------------------------------------

--
-- Table structure for table `oc_statistics`
--

CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '5241.9880'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days'),
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 2, 'عدم موجودی در انبار'),
(6, 2, '2 تا 3 روز دیگر'),
(7, 2, 'در انبار(موجود)'),
(8, 2, 'پیش سفارش');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'محصولات مشمول مالیات', 'محصولاتی که مالیات به آنها تعلق می گیرد', '2017-06-24 23:21:53', '2017-07-24 14:07:50'),
(10, 'محصولات دانلودی', 'مالیات محصولات دانلودی', '2017-06-24 22:19:39', '2017-07-24 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'بر ارزش افزوده (20%)', '20.0000', 'P', '2017-06-24 21:17:10', '2017-07-24 22:24:29'),
(87, 3, 'مالیات ثابت (-2.00)', '2.0000', 'F', '2017-06-24 21:49:23', '2017-07-24 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_theme`
--

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_translation`
--

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '782fde1e4752243118073aa669ccc58de1a4d30d', 'hWxl8LFPM', 'OpenCart', 'Farsi', 'alisamie97@gmail.com', '', '', '127.0.0.1', 1, '2021-02-07 08:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'مدیریت ارشد', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/theme\",\"design\\/translation\",\"design\\/seo_url\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/marketing\\/remarketing\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/payment\\/pp_braintree\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/filter\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/theme\",\"design\\/translation\",\"design\\/seo_url\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/marketing\\/remarketing\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/payment\\/pp_braintree\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/event\",\"marketplace\\/api\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/filter\"]}'),
(10, 'دمو نمایشی', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'عید نوروز'),
(7, 2, 'تولد'),
(8, 2, 'معمولی');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT 0.00000000
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'کیلوگرم', 'kg'),
(2, 2, 'گرم', 'g'),
(5, 2, 'پوند', 'lb'),
(6, 2, 'اونس', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1538, 101, 'تهران', 'TEH', 1),
(1539, 101, 'قم', 'QOM', 1),
(1540, 101, 'مرکزی', 'MKZ', 1),
(1541, 101, 'قزوین', 'QAZ', 1),
(1542, 101, 'گیلان', 'GIL', 1),
(1543, 101, 'اردبیل', 'ARD', 1),
(1544, 101, 'زنجان', 'ZAN', 1),
(1545, 101, 'آذربایجان شرقی', 'EAZ', 1),
(1546, 101, 'آذربایجان غربی', 'WEZ', 1),
(1547, 101, 'کردستان', 'KRD', 1),
(1548, 101, 'همدان', 'HMD', 1),
(1549, 101, 'کرمانشاه', 'KRM', 1),
(1550, 101, 'ایلام', 'ILM', 1),
(1551, 101, 'لرستان', 'LRS', 1),
(1552, 101, 'خوزستان', 'KZT', 1),
(1553, 101, 'جهار محال و بختیاری', 'CMB', 1),
(1554, 101, 'کهگیلویه و بویر احمد', 'KBA', 1),
(1555, 101, 'بوشهر', 'BSH', 1),
(1556, 101, 'فارس', 'FAR', 1),
(1557, 101, 'هرمزگان', 'HRM', 1),
(1558, 101, 'سیستان و بلوچستان', 'SBL', 1),
(1559, 101, 'کرمان', 'KRB', 1),
(1560, 101, 'یزد', 'YZD', 1),
(1561, 101, 'اصفهان', 'EFH', 1),
(1562, 101, 'سمنان', 'SMN', 1),
(1563, 101, 'مازندران', 'MZD', 1),
(1564, 101, 'گلستان', 'GLS', 1),
(1565, 101, 'خراسان شمالی', 'NKH', 1),
(1566, 101, 'خراسان رضوی', 'RKH', 1),
(1567, 101, 'خراسان جنوبی', 'SKH', 1),
(3969, 101, 'البرز', 'ALB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 101, 0, 4, '2014-07-05 05:46:41', '0000-00-00 00:00:00'),
(2, 101, 0, 3, '2014-07-05 05:47:24', '0000-00-00 00:00:00'),
(3, 101, 1538, 5, '2014-07-05 06:41:28', '0000-00-00 00:00:00'),
(4, 101, 3969, 6, '2014-07-05 06:42:04', '0000-00-00 00:00:00'),
(5, 101, 1561, 7, '2014-07-05 06:42:32', '0000-00-00 00:00:00'),
(6, 101, 1566, 8, '2014-07-05 06:43:08', '0000-00-00 00:00:00'),
(7, 101, 1556, 9, '2014-07-05 06:44:05', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Indexes for table `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Indexes for table `oc_customer_affiliate`
--
ALTER TABLE `oc_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Indexes for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Indexes for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Indexes for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Indexes for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`);

--
-- Indexes for table `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  ADD PRIMARY KEY (`order_shipment_id`);

--
-- Indexes for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `oc_session`
--
ALTER TABLE `oc_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oc_shipping_courier`
--
ALTER TABLE `oc_shipping_courier`
  ADD PRIMARY KEY (`shipping_courier_id`);

--
-- Indexes for table `oc_statistics`
--
ALTER TABLE `oc_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Indexes for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Indexes for table `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  MODIFY `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  MODIFY `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2624;

--
-- AUTO_INCREMENT for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=565;

--
-- AUTO_INCREMENT for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=443;

--
-- AUTO_INCREMENT for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  MODIFY `seo_url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `oc_statistics`
--
ALTER TABLE `oc_statistics`
  MODIFY `statistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4239;

--
-- AUTO_INCREMENT for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
