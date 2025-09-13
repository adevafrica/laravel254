

CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'Bank Account',
  `parent_account_id` int(11) DEFAULT NULL,
  `is_payment` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","11111","Sales Accounts","1000","1000","this is first account","1","1","2018-12-18 02:58:02","2024-03-12 07:57:50","","Bank Account","","1");
INSERT INTO accounts VALUES("3","21211","Sa","","0","","0","1","2018-12-18 02:58:56","2019-01-20 09:59:06","","Bank Account","","1");
INSERT INTO accounts VALUES("5","bank-1","zuhair","100000","100000","","","1","2022-11-28 05:58:18","2022-11-28 05:58:18","","Bank Account","","1");



CREATE TABLE `adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO adjustments VALUES("1","adr-20250214-060549","1","","100","1","","2025-02-14 18:05:49","2025-02-14 18:05:49");
INSERT INTO adjustments VALUES("2","adr-20250214-061021","3","","10","1","","2025-02-14 18:10:21","2025-02-14 18:10:21");
INSERT INTO adjustments VALUES("3","adr-20250214-070914","1","","10","1","","2025-02-14 19:09:14","2025-02-14 19:09:14");
INSERT INTO adjustments VALUES("4","adr-20250214-071213","2","","10","1","","2025-02-14 19:12:13","2025-02-14 19:12:13");
INSERT INTO adjustments VALUES("5","adr-20250214-071258","2","","11","1","","2025-02-14 19:12:58","2025-02-14 19:12:58");



CREATE TABLE `attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(255) NOT NULL,
  `checkout` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `barcodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `is_custom` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO barcodes VALUES("7","20 Labels per Sheet","Sheet Size: 8.5" x 11", Label Size: 4" x 1", Label...","4.0000","1.0000","8.5000","11.0000","0.5000","0.1250","0.0000","0.1875","2","0","0","20","","","");
INSERT INTO barcodes VALUES("8","30 Labels per sheet","Sheet Size: 8.5" x 11", Label Size: 2.625" x 1", Labels per sheet: 30","2.6250","1.0000","8.5000","11.0000","0.5000","0.1880","0.0000","0.1250","3","0","0","30","","","");
INSERT INTO barcodes VALUES("9","32 Labels per sheet","Sheet Size: 8.5" x 11", Label Size: 2" x 1.25", Labels per sheet: 32","2.0000","1.2500","8.5000","11.0000","0.5000","0.2500","0.0000","0.0000","4","0","0","32","","","");
INSERT INTO barcodes VALUES("10","40 Labels per sheet","Sheet Size: 8.5" x 11", Label Size: 2" x 1", Labels per sheet: 40","2.0000","1.0000","8.5000","11.0000","0.5000","0.2500","0.0000","0.0000","4","0","0","40","","","");
INSERT INTO barcodes VALUES("11","50 Labels per Sheet","Sheet Size: 8.5" x 11", Label Size: 1.5" x 1", Labels per sheet: 50","1.5000","1.0000","8.5000","11.0000","0.5000","0.5000","0.0000","0.0000","5","0","0","50","","","");
INSERT INTO barcodes VALUES("12","Continuous Rolls - 31.75mm x 25.4mm","Label Size: 31.75mm x 25.4mm, Gap: 3.18mm","1.2500","1.0000","1.2500","0.0000","0.1250","0.0000","0.1250","0.0000","1","0","1","","","","");
INSERT INTO barcodes VALUES("13","custom","","2.0000","0.5000","3.0000","","2.0000","2.0000","0.3000","0.3000","1","0","1","28","1","","");



CREATE TABLE `billers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","John Watson","","The solution","","john@gmail.com","312313","36 housing road","london","","","England","1","2024-01-19 13:30:23","2024-01-19 13:30:23");
INSERT INTO billers VALUES("2","cashier1","","kirinyaga","","palmwavecars@gmail.com","0717608640","2121","Nairobi","","","","1","2025-02-14 15:59:53","2025-02-14 15:59:53");



CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("1","Apple","20240114102326.png","1","2024-01-08 05:25:12","2024-01-14 16:23:26");
INSERT INTO brands VALUES("2","Samsung","20240114102343.png","1","2024-01-08 05:25:12","2024-01-14 16:23:43");
INSERT INTO brands VALUES("3","Huawei","20240114102512.png","1","2024-01-08 05:25:12","2024-01-14 16:25:12");
INSERT INTO brands VALUES("4","Xiaomi","20240114103640.png","1","2024-01-08 05:25:12","2024-01-14 16:36:40");
INSERT INTO brands VALUES("5","Whirlpool","20240114103701.png","1","2024-01-08 05:25:12","2024-01-14 16:37:01");
INSERT INTO brands VALUES("6","Nestle","20240114103717.png","1","2024-01-08 05:25:12","2024-01-14 16:37:17");
INSERT INTO brands VALUES("7","Kraft","20240114103851.png","1","2024-01-08 05:25:12","2024-01-14 16:38:51");
INSERT INTO brands VALUES("8","Kellogs","20240114103906.png","1","2024-01-08 05:25:12","2024-01-14 16:39:06");
INSERT INTO brands VALUES("9","Unilever","20240114103928.png","1","2024-01-08 05:25:12","2024-01-14 16:39:28");
INSERT INTO brands VALUES("10","LG","20240114103943.png","1","2024-01-08 05:25:12","2024-01-14 16:39:43");
INSERT INTO brands VALUES("11","Haier","20240114102407.png","1","2024-01-08 05:25:12","2024-01-14 16:24:07");
INSERT INTO brands VALUES("12","Bosch","20240114103618.png","1","2024-01-08 05:25:12","2024-01-14 16:36:18");
INSERT INTO brands VALUES("13","Siemens","20240114104008.png","1","2024-01-08 05:25:12","2024-01-14 16:40:08");
INSERT INTO brands VALUES("14","Philips","20240114104027.png","1","2024-01-08 05:25:12","2024-01-14 16:40:27");
INSERT INTO brands VALUES("15","Nike","20240114104052.png","1","2024-01-08 05:25:12","2024-01-14 16:40:52");
INSERT INTO brands VALUES("16","Adidas","20240114104112.png","1","2024-01-08 05:25:12","2024-01-14 16:41:12");
INSERT INTO brands VALUES("17","Canon","20240114034815.png","1","2024-01-14 09:48:15","2024-01-14 09:48:15");
INSERT INTO brands VALUES("18","Omega","20240119071354.jpg","1","2024-01-19 13:13:54","2024-01-19 13:14:59");
INSERT INTO brands VALUES("19","jhakanaka","","1","2024-04-29 12:28:31","2024-04-29 12:28:31");
INSERT INTO brands VALUES("20","BEVERAGES","","1","2025-02-14 17:33:51","2025-02-14 17:33:51");
INSERT INTO brands VALUES("21","MAIN DISHES","","1","2025-02-14 17:34:08","2025-02-14 17:34:08");
INSERT INTO brands VALUES("22","FIRST COURSE","","1","2025-02-14 17:34:23","2025-02-14 17:34:23");



CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","100","1","2","0","2024-01-19 14:46:52","2024-08-25 23:03:17");
INSERT INTO cash_registers VALUES("2","150","1","1","0","2024-01-19 14:47:08","2024-08-25 23:03:24");
INSERT INTO cash_registers VALUES("3","200","1","1","1","2024-08-25 23:04:20","2024-08-25 23:04:20");
INSERT INTO cash_registers VALUES("4","10000","47","1","1","2025-02-13 16:36:20","2025-02-13 16:36:20");
INSERT INTO cash_registers VALUES("5","10000","48","1","1","2025-02-14 16:51:49","2025-02-14 16:51:49");
INSERT INTO cash_registers VALUES("6","100000","48","3","1","2025-02-14 19:18:07","2025-02-14 19:18:07");
INSERT INTO cash_registers VALUES("7","120000","47","3","1","2025-02-15 23:36:27","2025-02-15 23:36:27");
INSERT INTO cash_registers VALUES("8","6","47","2","1","2025-02-17 19:28:46","2025-02-17 19:28:46");



CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `woocommerce_category_id` int(11) DEFAULT NULL,
  `is_sync_disable` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("1","Smartphone & Gadges","","","1","","","2024-01-04 19:22:14","2024-01-08 06:22:02");
INSERT INTO categories VALUES("2","Phone Accessories","","1","1","","","2024-01-04 19:22:14","2024-01-08 06:22:03");
INSERT INTO categories VALUES("3","iPhone","","1","1","","","2024-01-04 19:22:14","2024-01-08 06:22:03");
INSERT INTO categories VALUES("4","Samsung","","1","1","","","2024-01-04 19:22:14","2024-01-08 06:22:03");
INSERT INTO categories VALUES("5","Phone Cases","","1","1","","","2024-01-04 19:22:15","2024-01-08 06:22:03");
INSERT INTO categories VALUES("6","Laptops & Computers","","","1","","","2024-01-04 19:22:15","2024-01-08 06:22:03");
INSERT INTO categories VALUES("7","Keyboards","","6","1","","","2024-01-04 19:22:15","2024-01-08 06:22:03");
INSERT INTO categories VALUES("8","Laptop Bags","","6","1","","","2024-01-04 19:22:15","2024-01-08 06:22:04");
INSERT INTO categories VALUES("9","Mouses","","6","1","","","2024-01-04 19:22:15","2024-01-08 06:22:04");
INSERT INTO categories VALUES("10","Webcams","","6","1","","","2024-01-04 19:22:15","2024-01-08 06:22:04");
INSERT INTO categories VALUES("11","Monitors","","6","1","","","2024-01-04 19:22:15","2024-01-08 06:22:04");
INSERT INTO categories VALUES("12","Smartwatches","","","1","","","2024-01-04 19:22:15","2024-01-08 06:22:04");
INSERT INTO categories VALUES("13","Sport Watches","","12","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("14","Kids Watches","","12","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("15","Women Watches","","12","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("16","Men Watches","","12","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("17","Appliances","20240117121109.png","","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("18","Dishwashers","","17","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("19","Dryers","","17","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("20","Washing machine","","17","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("21","Refrigerators","","17","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("22","Vacuum cleaners","","17","1","","","2024-01-04 19:22:15","2024-01-08 06:22:05");
INSERT INTO categories VALUES("23","TVs, Audio & Video","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("24","Television Accessories","","23","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("25","HD, DVD Players","","23","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("26","TV-DVD Combos","","23","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("27","Projectors","","23","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("28","Projection Screen","","23","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("29","Fruits & Vegetables","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("30","Dairy & Egg","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("31","Meat & Fish","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("32","Sauces & Pickles","","","0","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("33","Candy & Chocolates","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("34","Foods","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("35","Cooking","","34","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("36","Breakfast","","34","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("37","Beverages","","34","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("38","BackPack","20240119070653.jpg","","1","","","","");
INSERT INTO categories VALUES("40","spices","","","1","","","2024-04-29 12:28:15","2024-04-29 12:28:15");
INSERT INTO categories VALUES("41","Kitchen","","","1","","","2025-02-14 17:29:28","2025-02-14 17:29:28");
INSERT INTO categories VALUES("42","BREAKFIRST","","","1","","","2025-02-14 17:34:48","2025-02-14 17:34:48");
INSERT INTO categories VALUES("43","LUNCH","","","1","","","2025-02-14 17:34:55","2025-02-14 17:34:55");
INSERT INTO categories VALUES("44","BEEF","","","1","","","2025-02-14 17:35:10","2025-02-14 17:35:10");
INSERT INTO categories VALUES("45","Soft Drinks","","","1","","","2025-02-18 16:24:04","2025-02-18 16:24:04");



CREATE TABLE `challans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `packing_slip_list` longtext NOT NULL,
  `amount_list` longtext NOT NULL,
  `cash_list` longtext DEFAULT NULL,
  `online_payment_list` longtext DEFAULT NULL,
  `cheque_list` longtext DEFAULT NULL,
  `delivery_charge_list` longtext DEFAULT NULL,
  `status_list` longtext DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO challans VALUES("1","1001","Close","1","1","577","500","","77","50","Delivered","2024-08-11","1","1","2024-08-11 05:27:04","2024-08-11 05:28:06");
INSERT INTO challans VALUES("2","1002","Active","1","2","599","","","","","","","1","","2024-08-11 05:39:22","2024-08-11 05:39:22");



CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `couriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO couriers VALUES("1","Fedex","3122312","london,uk","1","2024-08-11 05:26:49","2024-08-11 05:26:49");
INSERT INTO couriers VALUES("2","G4S","7209086035","17160-00100","1","2025-02-15 23:58:38","2025-02-15 23:58:38");



CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` double NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currencies VALUES("1","US Dollar","USD","11","0","2020-11-01 00:22:58","2025-02-13 16:15:54");
INSERT INTO currencies VALUES("2","Euro","Euro","0.95","0","2020-11-01 01:29:12","2025-02-13 16:15:58");
INSERT INTO currencies VALUES("3","Bangladeshi Taka","BDT","110","0","2023-09-06 07:05:29","2023-09-06 07:05:46");
INSERT INTO currencies VALUES("4","KES","KES","1","1","2025-02-13 16:15:41","2025-02-14 12:10:04");



CREATE TABLE `custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `belongs_to` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `default_value` text DEFAULT NULL,
  `option_value` text DEFAULT NULL,
  `grid_value` int(11) NOT NULL,
  `is_table` tinyint(1) NOT NULL,
  `is_invoice` tinyint(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `percentage` varchar(191) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","Regular","0","1","2024-01-19 13:19:29","2024-01-19 13:19:29");
INSERT INTO customer_groups VALUES("2","Loyalty Program","2","1","2025-02-13 21:20:32","2025-02-13 21:20:32");



CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) NOT NULL,
  `tax_no` varchar(191) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ecom` varchar(255) DEFAULT NULL,
  `dsf` varchar(255) DEFAULT 'df',
  `arabic_name` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `franchise_location` varchar(255) DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT 'Same as Customer',
  `customer_assigned_to` varchar(255) DEFAULT 'Advocate',
  `assigned` varchar(255) DEFAULT 'Advocate',
  `aaaaaaaa` varchar(255) DEFAULT 'aa',
  `district` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("1","1","44","James Bond","MI6","","313131","","221 Baker Street","London","","","England","30","20","0","1","2024-01-19 13:23:29","2025-02-15 23:24:11","","df","","","","Same as Customer","Advocate","Advocate","aa","");
INSERT INTO customers VALUES("2","1","","Walk in Customer","","","231313","","Halishahar","chittagong","","","Bangladesh","691","","","1","2024-01-19 13:31:51","2025-02-18 16:22:22","","df","","","","Same as Customer","Advocate","Advocate","aa","");
INSERT INTO customers VALUES("4","1","46","bkk","","bkk@bkk.com","87897","","jhkjh","gjhgh","","","","8","","","1","2024-06-10 10:40:15","2025-02-15 23:38:29","","df","","","","Same as Customer","Advocate","Advocate","aa","");
INSERT INTO customers VALUES("5","2","","PAUL LOYAL CUSTOMER","","briankibet7401@gmail.com","0717608640","","2121","Nairobi","","","","3","","","1","2025-02-13 21:21:07","2025-02-17 19:26:21","","df","","","","Same as Customer","Advocate","Advocate","aa","");
INSERT INTO customers VALUES("6","2","","Isaac Owade","Wise Insurance Agency","twedhjk@gmail.com","0736536237","12","17160-00100","Nairobi","Enugu","00100","Kenya","4","","","1","2025-02-15 23:49:51","2025-02-17 19:29:08","","df","","","","Same as Customer","Advocate","Advocate","aa","");



CREATE TABLE `deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `packing_slip_ids` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `delivered_by` varchar(191) DEFAULT NULL,
  `recieved_by` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deliveries VALUES("2","dr-20240811-113738","43","2","1","1","Halishahar","","","","","3","2024-08-11 05:37:38","2025-02-13 17:37:10");
INSERT INTO deliveries VALUES("3","dr-20250217-094931","77","","47","2","Halishahar chittagong Bangladesh","","","","","2","2025-02-17 21:49:39","2025-02-17 21:49:39");



CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES("1","Sales People","1","2025-02-15 23:12:48","2025-02-15 23:12:48");



CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deposits VALUES("1","20","1","1","","2024-07-08 05:54:31","2024-07-08 05:54:31");



CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discount_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `applicable_for` varchar(191) NOT NULL,
  `product_list` longtext DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(191) NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `dso_alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_info` longtext NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `staff_id` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES("1","Raila Odinga","railaodinga@gmail.com","072734778","1","49","2000","","17160-00100","Nairobi","Kenya","1","2025-02-15 23:14:16","2025-02-15 23:14:16");



CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES("1","Electric Bill","Electric Bill","1","2024-01-19 14:50:02","2024-01-19 14:50:02");
INSERT INTO expense_categories VALUES("2","93158712","SUPPLIER LIST1","1","2025-02-17 19:50:23","2025-02-17 19:50:23");



CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expenses VALUES("1","er-20240119-085023","1","1","1","1","2","200","","2024-01-19 14:50:23","2024-01-19 14:50:23");
INSERT INTO expenses VALUES("2","er-20240119-085046","1","2","1","1","1","120","","2024-01-19 14:50:46","2024-01-19 14:50:46");
INSERT INTO expenses VALUES("3","er-20240825-063016","1","2","1","1","","450","","2024-08-25 23:30:15","2024-08-25 23:30:16");
INSERT INTO expenses VALUES("4","er-20250218-040305","2","1","3","47","4","2000","","2025-02-19 00:00:00","2025-02-18 16:03:05");
INSERT INTO expenses VALUES("5","er-20250218-040351","1","1","1","47","4","2000","","2025-02-17 00:00:00","2025-02-18 16:03:51");



CREATE TABLE `external_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `module_status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_status`)),
  `active` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO external_services VALUES("1","PayPal","payment","Client ID,Client Secret;abcd1234,wxyz5678","","0","","");
INSERT INTO external_services VALUES("2","Stripe","payment","Public Key,Private Key;efgh1234,stuv5678","","0","","");
INSERT INTO external_services VALUES("3","Razorpay","payment","Key,Secret;rzp_test_Y4MCcpHfZNU6rR,3Hr7SDqaZ0G5waN0jsLgsiLx","","1","","");
INSERT INTO external_services VALUES("4","Paystack","payment","public_Key,Secret_Key;pk_test_e8d220b7463d64569f0053e78534f38e6b10cf4a,sk_test_6d62cb976e1e0ab43f1e48b2934b0dfc7f32a1fe","","1","","");
INSERT INTO external_services VALUES("6","Mollie","payment","api_key;test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM","","0","","");
INSERT INTO external_services VALUES("7","Xendit","payment","secret_key,callback_token;xnd_development_aKJVKYbc4lHkEjcCLzWLrBsKs6jF6nbM6WaCMfnJerP3JW57CLis553XNRdDU,YPZxND92Mt8tdXntTYIEkRX802onZ5OcdKBUzycebuqYvN4n","","1","","");
INSERT INTO external_services VALUES("8","bkash","payment","Mode,app_key,app_secret,username,password;sandbox,0vWQuCRGiUX7EPVjQDr0EUAYtc,jcUNPBgbcqEDedNKdvE4G1cAK7D3hCjmJccNPZZBq96QIxxwAMEx,01770618567,D7DaC<*E*eG","","1","","");
INSERT INTO external_services VALUES("9","sslcommerz","payment","appkey,appsecret;12341234,asdfa23423","","1","","");
INSERT INTO external_services VALUES("10","Pesapal","payment","Mode,Consumer Key,Consumer Secret;sandbox,qkio1BGGYAXTu2JOfm7XSXNruoZsrqEW,osGQ364R49cXKeOYSpaOnT++rHs=","","1","","");



CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) NOT NULL,
  `site_logo` varchar(191) DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `staff_access` varchar(191) NOT NULL,
  `without_stock` varchar(255) NOT NULL DEFAULT 'no',
  `date_format` varchar(191) NOT NULL,
  `developed_by` varchar(191) DEFAULT NULL,
  `invoice_format` varchar(191) DEFAULT NULL,
  `decimal` int(11) DEFAULT 2,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) NOT NULL,
  `modules` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `expiry_type` varchar(255) NOT NULL DEFAULT 'days',
  `expiry_value` varchar(255) NOT NULL DEFAULT '0',
  `is_zatca` tinyint(1) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `vat_registration_number` varchar(191) DEFAULT NULL,
  `is_packing_slip` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","Uhai Africa","20250214024746.png","0","4","","","warehouse","no","d-m-Y","Uhai Africa","standard","2","1","default.css","manufacturing","2018-07-06 06:13:11","2025-02-14 14:47:46","prefix","","days","0","0","Uhai Africa","98098007","1");



CREATE TABLE `gift_card_recharges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `gift_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `hrm_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(191) NOT NULL,
  `checkout` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hrm_settings VALUES("1","10:00am","6:00pm","2019-01-02 02:20:08","2019-01-02 04:20:53");



CREATE TABLE `income_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO income_categories VALUES("1","99903833","Foreign investment","1","2024-08-11 04:56:46","2024-08-11 04:56:46");



CREATE TABLE `incomes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `income_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO incomes VALUES("1","ir-20240811-105709","1","1","1","1","2","100","","2024-08-11 04:57:09","2024-08-11 04:57:09");
INSERT INTO incomes VALUES("2","ir-20241202-100021","1","1","1","1","3","77","","2024-12-05 06:00:00","2024-12-03 04:00:21");



CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO languages VALUES("1","en","2018-07-07 22:59:17","2019-12-24 17:34:20");



CREATE TABLE `mail_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `driver` varchar(191) NOT NULL,
  `host` varchar(191) NOT NULL,
  `port` varchar(191) NOT NULL,
  `from_address` varchar(191) NOT NULL,
  `from_name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `encryption` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO mail_settings VALUES("1","SMTP","mail.uhai.africa","587","info@uhai.africa","info@uhai.africa","info@uhai.africa","Kibet7401#","TLS","2025-02-14 11:42:30","2025-02-14 14:49:36");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2018_02_17_060412_create_categories_table","1");
INSERT INTO migrations VALUES("4","2018_02_20_035727_create_brands_table","1");
INSERT INTO migrations VALUES("5","2018_02_25_100635_create_suppliers_table","1");
INSERT INTO migrations VALUES("6","2018_02_27_101619_create_warehouse_table","1");
INSERT INTO migrations VALUES("7","2018_03_03_040448_create_units_table","1");
INSERT INTO migrations VALUES("8","2018_03_04_041317_create_taxes_table","1");
INSERT INTO migrations VALUES("9","2018_03_10_061915_create_customer_groups_table","1");
INSERT INTO migrations VALUES("10","2018_03_10_090534_create_customers_table","1");
INSERT INTO migrations VALUES("11","2018_03_11_095547_create_billers_table","1");
INSERT INTO migrations VALUES("12","2018_04_05_054401_create_products_table","1");
INSERT INTO migrations VALUES("13","2018_04_06_133606_create_purchases_table","1");
INSERT INTO migrations VALUES("14","2018_04_06_154600_create_product_purchases_table","1");
INSERT INTO migrations VALUES("15","2018_04_06_154915_create_product_warhouse_table","1");
INSERT INTO migrations VALUES("16","2018_04_10_085927_create_sales_table","1");
INSERT INTO migrations VALUES("17","2018_04_10_090133_create_product_sales_table","1");
INSERT INTO migrations VALUES("18","2018_04_10_090254_create_payments_table","1");
INSERT INTO migrations VALUES("19","2018_04_10_090341_create_payment_with_cheque_table","1");
INSERT INTO migrations VALUES("20","2018_04_10_090509_create_payment_with_credit_card_table","1");
INSERT INTO migrations VALUES("21","2018_04_13_121436_create_quotation_table","1");
INSERT INTO migrations VALUES("22","2018_04_13_122324_create_product_quotation_table","1");
INSERT INTO migrations VALUES("23","2018_04_14_121802_create_transfers_table","1");
INSERT INTO migrations VALUES("24","2018_04_14_121913_create_product_transfer_table","1");
INSERT INTO migrations VALUES("25","2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table","2");
INSERT INTO migrations VALUES("26","2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table","3");
INSERT INTO migrations VALUES("27","2018_05_20_054532_create_adjustments_table","4");
INSERT INTO migrations VALUES("28","2018_05_20_054859_create_product_adjustments_table","4");
INSERT INTO migrations VALUES("29","2018_05_21_163419_create_returns_table","5");
INSERT INTO migrations VALUES("30","2018_05_21_163443_create_product_returns_table","5");
INSERT INTO migrations VALUES("31","2018_06_02_050905_create_roles_table","6");
INSERT INTO migrations VALUES("32","2018_06_02_073430_add_columns_to_users_table","7");
INSERT INTO migrations VALUES("33","2018_06_03_053738_create_permission_tables","8");
INSERT INTO migrations VALUES("36","2018_06_21_063736_create_pos_setting_table","9");
INSERT INTO migrations VALUES("37","2018_06_21_094155_add_user_id_to_sales_table","10");
INSERT INTO migrations VALUES("38","2018_06_21_101529_add_user_id_to_purchases_table","11");
INSERT INTO migrations VALUES("39","2018_06_21_103512_add_user_id_to_transfers_table","12");
INSERT INTO migrations VALUES("40","2018_06_23_061058_add_user_id_to_quotations_table","13");
INSERT INTO migrations VALUES("41","2018_06_23_082427_add_is_deleted_to_users_table","14");
INSERT INTO migrations VALUES("42","2018_06_25_043308_change_email_to_users_table","15");
INSERT INTO migrations VALUES("43","2018_07_06_115449_create_general_settings_table","16");
INSERT INTO migrations VALUES("44","2018_07_08_043944_create_languages_table","17");
INSERT INTO migrations VALUES("45","2018_07_11_102144_add_user_id_to_returns_table","18");
INSERT INTO migrations VALUES("46","2018_07_11_102334_add_user_id_to_payments_table","18");
INSERT INTO migrations VALUES("47","2018_07_22_130541_add_digital_to_products_table","19");
INSERT INTO migrations VALUES("49","2018_07_24_154250_create_deliveries_table","20");
INSERT INTO migrations VALUES("50","2018_08_16_053336_create_expense_categories_table","21");
INSERT INTO migrations VALUES("51","2018_08_17_115415_create_expenses_table","22");
INSERT INTO migrations VALUES("55","2018_08_18_050418_create_gift_cards_table","23");
INSERT INTO migrations VALUES("56","2018_08_19_063119_create_payment_with_gift_card_table","24");
INSERT INTO migrations VALUES("57","2018_08_25_042333_create_gift_card_recharges_table","25");
INSERT INTO migrations VALUES("58","2018_08_25_101354_add_deposit_expense_to_customers_table","26");
INSERT INTO migrations VALUES("59","2018_08_26_043801_create_deposits_table","27");
INSERT INTO migrations VALUES("60","2018_09_02_044042_add_keybord_active_to_pos_setting_table","28");
INSERT INTO migrations VALUES("61","2018_09_09_092713_create_payment_with_paypal_table","29");
INSERT INTO migrations VALUES("62","2018_09_10_051254_add_currency_to_general_settings_table","30");
INSERT INTO migrations VALUES("63","2018_10_22_084118_add_biller_and_store_id_to_users_table","31");
INSERT INTO migrations VALUES("65","2018_10_26_034927_create_coupons_table","32");
INSERT INTO migrations VALUES("66","2018_10_27_090857_add_coupon_to_sales_table","33");
INSERT INTO migrations VALUES("67","2018_11_07_070155_add_currency_position_to_general_settings_table","34");
INSERT INTO migrations VALUES("68","2018_11_19_094650_add_combo_to_products_table","35");
INSERT INTO migrations VALUES("69","2018_12_09_043712_create_accounts_table","36");
INSERT INTO migrations VALUES("70","2018_12_17_112253_add_is_default_to_accounts_table","37");
INSERT INTO migrations VALUES("71","2018_12_19_103941_add_account_id_to_payments_table","38");
INSERT INTO migrations VALUES("72","2018_12_20_065900_add_account_id_to_expenses_table","39");
INSERT INTO migrations VALUES("73","2018_12_20_082753_add_account_id_to_returns_table","40");
INSERT INTO migrations VALUES("74","2018_12_26_064330_create_return_purchases_table","41");
INSERT INTO migrations VALUES("75","2018_12_26_144210_create_purchase_product_return_table","42");
INSERT INTO migrations VALUES("76","2018_12_26_144708_create_purchase_product_return_table","43");
INSERT INTO migrations VALUES("77","2018_12_27_110018_create_departments_table","44");
INSERT INTO migrations VALUES("78","2018_12_30_054844_create_employees_table","45");
INSERT INTO migrations VALUES("79","2018_12_31_125210_create_payrolls_table","46");
INSERT INTO migrations VALUES("80","2018_12_31_150446_add_department_id_to_employees_table","47");
INSERT INTO migrations VALUES("81","2019_01_01_062708_add_user_id_to_expenses_table","48");
INSERT INTO migrations VALUES("82","2019_01_02_075644_create_hrm_settings_table","49");
INSERT INTO migrations VALUES("83","2019_01_02_090334_create_attendances_table","50");
INSERT INTO migrations VALUES("84","2019_01_27_160956_add_three_columns_to_general_settings_table","51");
INSERT INTO migrations VALUES("85","2019_02_15_183303_create_stock_counts_table","52");
INSERT INTO migrations VALUES("86","2019_02_17_101604_add_is_adjusted_to_stock_counts_table","53");
INSERT INTO migrations VALUES("87","2019_04_13_101707_add_tax_no_to_customers_table","54");
INSERT INTO migrations VALUES("89","2019_10_14_111455_create_holidays_table","55");
INSERT INTO migrations VALUES("90","2019_11_13_145619_add_is_variant_to_products_table","56");
INSERT INTO migrations VALUES("91","2019_11_13_150206_create_product_variants_table","57");
INSERT INTO migrations VALUES("92","2019_11_13_153828_create_variants_table","57");
INSERT INTO migrations VALUES("93","2019_11_25_134041_add_qty_to_product_variants_table","58");
INSERT INTO migrations VALUES("94","2019_11_25_134922_add_variant_id_to_product_purchases_table","58");
INSERT INTO migrations VALUES("95","2019_11_25_145341_add_variant_id_to_product_warehouse_table","58");
INSERT INTO migrations VALUES("96","2019_11_29_182201_add_variant_id_to_product_sales_table","59");
INSERT INTO migrations VALUES("97","2019_12_04_121311_add_variant_id_to_product_quotation_table","60");
INSERT INTO migrations VALUES("98","2019_12_05_123802_add_variant_id_to_product_transfer_table","61");
INSERT INTO migrations VALUES("100","2019_12_08_114954_add_variant_id_to_product_returns_table","62");
INSERT INTO migrations VALUES("101","2019_12_08_203146_add_variant_id_to_purchase_product_return_table","63");
INSERT INTO migrations VALUES("102","2020_02_28_103340_create_money_transfers_table","64");
INSERT INTO migrations VALUES("103","2020_07_01_193151_add_image_to_categories_table","65");
INSERT INTO migrations VALUES("105","2020_09_26_130426_add_user_id_to_deliveries_table","66");
INSERT INTO migrations VALUES("107","2020_10_11_125457_create_cash_registers_table","67");
INSERT INTO migrations VALUES("108","2020_10_13_155019_add_cash_register_id_to_sales_table","68");
INSERT INTO migrations VALUES("109","2020_10_13_172624_add_cash_register_id_to_returns_table","69");
INSERT INTO migrations VALUES("110","2020_10_17_212338_add_cash_register_id_to_payments_table","70");
INSERT INTO migrations VALUES("111","2020_10_18_124200_add_cash_register_id_to_expenses_table","71");
INSERT INTO migrations VALUES("112","2020_10_21_121632_add_developed_by_to_general_settings_table","72");
INSERT INTO migrations VALUES("113","2019_08_19_000000_create_failed_jobs_table","73");
INSERT INTO migrations VALUES("114","2020_10_30_135557_create_notifications_table","73");
INSERT INTO migrations VALUES("115","2020_11_01_044954_create_currencies_table","74");
INSERT INTO migrations VALUES("116","2020_11_01_140736_add_price_to_product_warehouse_table","75");
INSERT INTO migrations VALUES("117","2020_11_02_050633_add_is_diff_price_to_products_table","76");
INSERT INTO migrations VALUES("118","2020_11_09_055222_add_user_id_to_customers_table","77");
INSERT INTO migrations VALUES("119","2020_11_17_054806_add_invoice_format_to_general_settings_table","78");
INSERT INTO migrations VALUES("120","2021_02_10_074859_add_variant_id_to_product_adjustments_table","79");
INSERT INTO migrations VALUES("121","2021_03_07_093606_create_product_batches_table","80");
INSERT INTO migrations VALUES("122","2021_03_07_093759_add_product_batch_id_to_product_warehouse_table","80");
INSERT INTO migrations VALUES("123","2021_03_07_093900_add_product_batch_id_to_product_purchases_table","80");
INSERT INTO migrations VALUES("124","2021_03_11_132603_add_product_batch_id_to_product_sales_table","81");
INSERT INTO migrations VALUES("127","2021_03_25_125421_add_is_batch_to_products_table","82");
INSERT INTO migrations VALUES("128","2021_05_19_120127_add_product_batch_id_to_product_returns_table","82");
INSERT INTO migrations VALUES("130","2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table","83");
INSERT INTO migrations VALUES("131","2021_05_23_124848_add_product_batch_id_to_product_transfer_table","84");
INSERT INTO migrations VALUES("132","2021_05_26_153106_add_product_batch_id_to_product_quotation_table","85");
INSERT INTO migrations VALUES("133","2021_06_08_213007_create_reward_point_settings_table","86");
INSERT INTO migrations VALUES("134","2021_06_16_104155_add_points_to_customers_table","87");
INSERT INTO migrations VALUES("135","2021_06_17_101057_add_used_points_to_payments_table","88");
INSERT INTO migrations VALUES("136","2021_07_06_132716_add_variant_list_to_products_table","89");
INSERT INTO migrations VALUES("137","2021_09_27_161141_add_is_imei_to_products_table","90");
INSERT INTO migrations VALUES("138","2021_09_28_170052_add_imei_number_to_product_warehouse_table","91");
INSERT INTO migrations VALUES("139","2021_09_28_170126_add_imei_number_to_product_purchases_table","91");
INSERT INTO migrations VALUES("140","2021_10_03_170652_add_imei_number_to_product_sales_table","92");
INSERT INTO migrations VALUES("141","2021_10_10_145214_add_imei_number_to_product_returns_table","93");
INSERT INTO migrations VALUES("142","2021_10_11_104504_add_imei_number_to_product_transfer_table","94");
INSERT INTO migrations VALUES("143","2021_10_12_160107_add_imei_number_to_purchase_product_return_table","95");
INSERT INTO migrations VALUES("144","2021_10_12_205146_add_is_rtl_to_general_settings_table","96");
INSERT INTO migrations VALUES("145","2021_10_23_142451_add_is_approve_to_payments_table","97");
INSERT INTO migrations VALUES("146","2022_01_13_191242_create_discount_plans_table","97");
INSERT INTO migrations VALUES("147","2022_01_14_174318_create_discount_plan_customers_table","97");
INSERT INTO migrations VALUES("148","2022_01_14_202439_create_discounts_table","98");
INSERT INTO migrations VALUES("149","2022_01_16_153506_create_discount_plan_discounts_table","98");
INSERT INTO migrations VALUES("150","2022_02_05_174210_add_order_discount_type_and_value_to_sales_table","99");
INSERT INTO migrations VALUES("154","2022_05_26_195506_add_daily_sale_objective_to_products_table","100");
INSERT INTO migrations VALUES("155","2022_05_28_104209_create_dso_alerts_table","101");
INSERT INTO migrations VALUES("156","2022_06_01_112100_add_is_embeded_to_products_table","102");
INSERT INTO migrations VALUES("157","2022_06_14_130505_add_sale_id_to_returns_table","103");
INSERT INTO migrations VALUES("159","2022_07_19_115504_add_variant_data_to_products_table","104");
INSERT INTO migrations VALUES("160","2022_07_25_194300_add_additional_cost_to_product_variants_table","104");
INSERT INTO migrations VALUES("161","2022_09_04_195610_add_purchase_id_to_return_purchases_table","105");
INSERT INTO migrations VALUES("162","2023_01_18_123842_alter_table_pos_setting","106");
INSERT INTO migrations VALUES("164","2023_01_18_125040_alter_table_general_settings","107");
INSERT INTO migrations VALUES("165","2023_01_18_133701_alter_table_pos_setting","108");
INSERT INTO migrations VALUES("166","2023_01_25_145309_add_expiry_date_to_general_settings_table","109");
INSERT INTO migrations VALUES("167","2023_02_23_125656_alter_table_sales","110");
INSERT INTO migrations VALUES("168","2023_02_26_124100_add_package_id_to_general_settings_table","111");
INSERT INTO migrations VALUES("169","2023_03_04_120325_create_custom_fields_table","111");
INSERT INTO migrations VALUES("170","2023_03_22_174352_add_currency_id_and_exchange_rate_to_returns_table","112");
INSERT INTO migrations VALUES("171","2023_03_27_114320_add_currency_id_and_exchange_rate_to_purchases_table","113");
INSERT INTO migrations VALUES("172","2023_03_27_132747_add_currency_id_and_exchange_rate_to_return_purchases_table","114");
INSERT INTO migrations VALUES("173","2023_04_25_150236_create_mail_settings_table","115");
INSERT INTO migrations VALUES("174","2023_05_13_125424_add_zatca_to_general_settings_table","116");
INSERT INTO migrations VALUES("175","2023_05_28_155540_create_tables_table","117");
INSERT INTO migrations VALUES("176","2023_05_29_115039_add_is_table_to_pos_setting_table","117");
INSERT INTO migrations VALUES("177","2023_05_29_115301_add_table_id_to_sales_table","117");
INSERT INTO migrations VALUES("178","2023_05_31_165049_add_queue_no_to_sales_table","117");
INSERT INTO migrations VALUES("190","2023_08_12_124016_add_staff_id_to_employees_table","121");
INSERT INTO migrations VALUES("192","2023_07_23_160254_create_couriers_table","122");
INSERT INTO migrations VALUES("193","2023_07_23_174343_add_courier_id_to_deliveries_table","122");
INSERT INTO migrations VALUES("194","2023_08_14_142608_add_is_active_to_currencies_table","122");
INSERT INTO migrations VALUES("195","2023_08_24_130203_change_columns_to_attendances_table","122");
INSERT INTO migrations VALUES("196","2023_09_10_134503_add_without_stock_to_general_settings_table","123");
INSERT INTO migrations VALUES("204","2023_09_26_211542_add_modules_to_general_settings_table","125");
INSERT INTO migrations VALUES("217","2023_10_15_124306_add_return_qty_to_product_sales_table","129");
INSERT INTO migrations VALUES("219","2023_12_03_235606_crete_external_services_table","131");
INSERT INTO migrations VALUES("221","2023_03_14_174658_add_subscription_type_to_general_setting_table","130");
INSERT INTO migrations VALUES("222","2024_02_04_131826_add_unit_cost_to_product_adjustments_table","132");
INSERT INTO migrations VALUES("223","2024_02_13_173126_change_modules_to_general_settings_table","133");
INSERT INTO migrations VALUES("224","2024_05_02_114215_add_payment_receiver_to_payments","134");
INSERT INTO migrations VALUES("225","2024_05_06_132553_create_sms_templates_table","135");
INSERT INTO migrations VALUES("226","2024_05_07_102225_add_send_sms_to_pos_setting_table","135");
INSERT INTO migrations VALUES("227","2024_05_07_132625_add_is_default_to_sms_templates_table","135");
INSERT INTO migrations VALUES("228","2024_05_08_112211_change_address_and_city_field_to_nullable_in_customers_table","135");
INSERT INTO migrations VALUES("229","2024_05_08_151050_add_is_default_ecommerce_columne_to_sms_templates_table","135");
INSERT INTO migrations VALUES("230","2024_05_20_182757_add_wholesale_price_to_products_table","136");
INSERT INTO migrations VALUES("231","2024_05_21_170500_add_is_sent_to_transfers_table","137");
INSERT INTO migrations VALUES("232","2023_02_05_132001_add_change_to_payments_table","138");
INSERT INTO migrations VALUES("233","2024_06_04_225113_create_income_categories_table","138");
INSERT INTO migrations VALUES("234","2024_06_04_225128_create_incomes_table","138");
INSERT INTO migrations VALUES("235","2024_06_29_131917_add_is_packing_slip_to_general_settings_table","138");
INSERT INTO migrations VALUES("236","2024_07_05_192531_create_packing_slips_table","138");
INSERT INTO migrations VALUES("237","2024_07_05_193002_create_packing_slip_products_table","138");
INSERT INTO migrations VALUES("238","2024_07_05_194501_add_is_packing_and_delivered_to_product_sales_table","138");
INSERT INTO migrations VALUES("239","2024_07_14_122245_add_delivery_id_to_packing_slips_table","138");
INSERT INTO migrations VALUES("240","2024_07_14_122415_add_variant_id_to_packing_slip_products_table","138");
INSERT INTO migrations VALUES("241","2024_07_14_122519_add_packing_slip_ids_to_deliveries_table","138");
INSERT INTO migrations VALUES("242","2024_07_16_125908_create_challans_table","138");
INSERT INTO migrations VALUES("245","2023_03_18_141537_add_woocommerce_category_id_to_categories_table","139");
INSERT INTO migrations VALUES("246","2023_03_20_214553_add_column_for_woocommerce_to_products_table","139");
INSERT INTO migrations VALUES("247","2023_03_20_214563_add_woocommerce_tax_id_to_taxes_table","139");
INSERT INTO migrations VALUES("248","2023_03_20_214565_add_woocommerce_order_id_to_sales_table","139");
INSERT INTO migrations VALUES("249","2023_08_01_134406_add_is_sync_disable_to_categories_table","139");
INSERT INTO migrations VALUES("250","2023_08_01_135252_add_product_status_to_woocommerce_settings_table","139");
INSERT INTO migrations VALUES("251","2024_08_12_112830_add_thermal_invoice_size_to_pos_setting","139");
INSERT INTO migrations VALUES("252","2024_08_14_133351_add_expiry_type_value_to_general_settings","139");
INSERT INTO migrations VALUES("253","2024_09_11_151744_add_return_qty_to_product_purchases_table","140");
INSERT INTO migrations VALUES("254","2024_09_12_162309_create_barcodes_table","140");
INSERT INTO migrations VALUES("255","2024_10_10_121312_add_data_to_payment_with_credit_card_table","141");
INSERT INTO migrations VALUES("256","2024_10_10_212501_alter_attendances_table","142");
INSERT INTO migrations VALUES("257","2024_10_10_213757_alter_attendances_table","142");
INSERT INTO migrations VALUES("258","2024_10_14_144917_change_column_to_nullable_to_payment_with_credit_card_table","142");
INSERT INTO migrations VALUES("259","2024_09_01_120515_create_productions_table","143");
INSERT INTO migrations VALUES("260","2024_09_01_120536_create_product_productions_table","143");
INSERT INTO migrations VALUES("261","2024_11_10_121521_add_code_and_type_to_accounts_table","144");
INSERT INTO migrations VALUES("262","2024_11_24_100926_add_module_status_to_external_services_table","145");



CREATE TABLE `money_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `packing_slip_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `packing_slip_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO packing_slip_products VALUES("1","1","23","","2024-08-11 05:25:41","2024-08-11 05:25:41");
INSERT INTO packing_slip_products VALUES("2","2","18","","2024-08-11 05:37:38","2024-08-11 05:37:38");



CREATE TABLE `packing_slips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO packing_slips VALUES("1","1001","42","1","577","Delivered","2024-08-11 05:25:41","2024-08-11 05:28:06");
INSERT INTO packing_slips VALUES("2","1002","43","2","599","In Transit","2024-08-11 05:37:38","2024-08-11 05:39:22");



CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES("ashfaqdev.php@gmail.com","$2y$10$plxHOMxChJlHd9t6FQkoN.4dXMdtZ9fE5tXBBItzjxB1R5JF9OpbO","2023-07-15 11:31:30");
INSERT INTO password_resets VALUES("briankibet7401@gmail.com","$2y$10$D72MQVsCF5CIO1WcjsevlO4vA9BidUuWBefmn038aah/McdWl7uM2","2025-02-14 15:01:43");



CREATE TABLE `payment_with_cheque` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_cheque VALUES("1","21","34242423","2024-06-03 06:29:06","2024-06-03 06:29:06");



CREATE TABLE `payment_with_credit_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) DEFAULT NULL,
  `charge_id` varchar(191) NOT NULL,
  `data` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_gift_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_paypal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_reference` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `payment_receiver` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double DEFAULT NULL,
  `paying_method` varchar(191) NOT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("1","spr-20240119-084017","1","","1","","1","","1758","","","Cash","","2024-01-19 14:40:17","2024-01-19 14:40:17");
INSERT INTO payments VALUES("2","spr-20240119-084441","1","","2","","1","","3017","","","Cash","","2024-01-19 14:44:41","2024-01-19 14:44:41");
INSERT INTO payments VALUES("3","spr-20240210-122224","1","","5","2","1","","1259","","","Cash","","2024-02-10 06:22:24","2024-02-10 06:22:24");
INSERT INTO payments VALUES("4","spr-20240225-014951","1","","6","2","1","","1299.99","","","Credit Card","","2024-02-25 07:49:51","2024-02-25 07:49:51");
INSERT INTO payments VALUES("5","spr-20240225-015013","1","","7","2","1","","2599.98","","","Cash","","2024-02-25 07:50:13","2024-02-25 07:50:13");
INSERT INTO payments VALUES("6","spr-20240228-112744","1","","8","2","1","","2558.99","","","Cash","","2024-02-28 05:27:44","2024-02-28 05:27:44");
INSERT INTO payments VALUES("7","spr-20240421-110143","1","","9","2","1","","350","","","Cash","","2024-04-21 05:01:43","2024-04-21 05:01:43");
INSERT INTO payments VALUES("8","spr-20240428-121544","1","","13","2","1","","1409","","","Cash","","2024-04-28 06:15:44","2024-04-28 06:15:44");
INSERT INTO payments VALUES("9","spr-20240429-062956","1","","14","2","1","","3800.99","","","Cash","","2024-04-29 12:29:56","2024-04-29 12:29:56");
INSERT INTO payments VALUES("12","spr-20240505-052905","1","","20","2","1","","2549.99","","","Cash","","2024-05-05 11:29:05","2024-05-05 11:29:05");
INSERT INTO payments VALUES("13","spr-20240508-020851","1","","22","2","1","","1349.99","","","Cash","","2024-05-08 08:08:51","2024-05-08 08:08:51");
INSERT INTO payments VALUES("14","spr-20240519-022423","1","","23","2","1","","1299.99","","","Cash","","2024-05-19 08:24:23","2024-05-19 08:24:23");
INSERT INTO payments VALUES("15","spr-20240519-022530","1","","24","2","1","","1300","","","Cash","","2024-05-19 08:25:30","2024-05-19 08:25:30");
INSERT INTO payments VALUES("16","spr-20240519-023055","1","","25","2","1","","1300","","","Cash","","2024-05-19 08:30:55","2024-05-19 08:30:55");
INSERT INTO payments VALUES("18","spr-20240521-013249","1","","28","2","1","","1050","","","Cash","","2024-05-21 07:32:49","2024-05-21 07:32:49");
INSERT INTO payments VALUES("19","spr-20240603-122701","1","","29","2","1","","1000","","","Cash","","2024-06-03 06:27:01","2024-06-03 06:27:01");
INSERT INTO payments VALUES("20","spr-20240603-122810","1","","29","2","1","","1000","","","Credit Card","","2024-06-03 06:28:10","2024-06-03 06:28:10");
INSERT INTO payments VALUES("21","spr-20240603-122906","1","","29","2","1","","549.99","","","Cheque","","2024-06-03 06:29:06","2024-06-03 06:29:06");
INSERT INTO payments VALUES("22","spr-20240603-053022","1","","30","2","1","","2300","","","Cash","","2024-06-03 11:30:22","2024-06-03 11:30:22");
INSERT INTO payments VALUES("23","spr-20240626-010119","1","","33","2","1","","1299.99","","","Cash","","2024-06-26 07:01:19","2024-06-26 07:01:19");
INSERT INTO payments VALUES("24","spr-20240718-113630","1","","38","2","1","","1299.99","","0","Cash","","2024-07-18 05:36:30","2024-07-18 05:36:30");
INSERT INTO payments VALUES("25","spr-20240718-015913","1","","39","2","1","","250","","0","Cash","","2024-07-18 07:59:13","2024-07-18 07:59:13");
INSERT INTO payments VALUES("26","spr-20240718-020145","1","","40","1","1","","250","","0","Cash","","2024-07-18 08:01:45","2024-07-18 08:01:45");
INSERT INTO payments VALUES("27","spr-20240811-112806","1","","42","2","1","","500","","0","Cash","","2024-08-11 05:28:06","2024-08-11 05:28:06");
INSERT INTO payments VALUES("28","spr-20240811-112806","1","","42","2","1","","77","","0","Cheque","","2024-08-11 05:28:06","2024-08-11 05:28:06");
INSERT INTO payments VALUES("29","spr-20240811-114852","1","","45","2","1","","1600","","0","Cash","","2024-08-11 05:48:52","2024-08-11 05:48:52");
INSERT INTO payments VALUES("30","spr-20240825-062616","1","","46","3","1","","1299.99","","0","","","2024-08-25 23:26:16","2024-08-25 23:26:16");
INSERT INTO payments VALUES("31","spr-20240825-062630","1","","47","3","1","","1050","","0","Cash","","2024-08-25 23:26:30","2024-08-25 23:26:30");
INSERT INTO payments VALUES("34","spr-20240825-062929","1","","50","3","1","","350","","0","","","2024-08-25 23:29:29","2024-08-25 23:29:29");
INSERT INTO payments VALUES("35","spr-20241126-101724","1","","51","3","1","","31.9","","0","Cash","","2024-11-26 16:17:24","2024-11-26 16:17:24");
INSERT INTO payments VALUES("36","spr-20241128-112142","1","","53","3","1","","1299.99","","0","Cash","","2024-11-28 05:21:42","2024-11-28 05:21:42");
INSERT INTO payments VALUES("37","spr-20241128-091248","1","","56","3","1","","1497","","0","Cash","","2024-11-28 15:12:48","2024-11-28 15:12:48");
INSERT INTO payments VALUES("38","spr-20250213-044151","47","","57","4","1","","21299.89","","0","Cash","","2025-02-13 16:41:51","2025-02-13 16:41:51");
INSERT INTO payments VALUES("39","spr-20250213-044506","47","","58","4","1","","14299.89","","0","Cash","","2025-02-13 16:45:06","2025-02-13 16:45:06");
INSERT INTO payments VALUES("40","spr-20250213-044845","47","","59","4","1","","24299.89","","0","Cash","","2025-02-13 16:48:45","2025-02-13 16:48:45");
INSERT INTO payments VALUES("41","spr-20250213-075412","47","","62","4","1","","14299.89","","0","Cash","","2025-02-13 19:54:12","2025-02-13 19:54:12");
INSERT INTO payments VALUES("42","spr-20250214-101034","47","","63","4","1","","1250","","0","Cash","","2025-02-14 10:10:34","2025-02-14 10:10:34");
INSERT INTO payments VALUES("43","spr-20250214-071905","48","","64","6","1","","220","","0","Cash","","2025-02-14 19:19:05","2025-02-14 19:19:05");
INSERT INTO payments VALUES("44","spr-20250215-112411","47","","65","4","1","Tarus","1260","","0","Cash","Done","2025-02-15 23:24:11","2025-02-15 23:24:11");
INSERT INTO payments VALUES("45","spr-20250215-112741","47","","66","4","1","","2400.99","","0","Cash","","2025-02-15 23:27:41","2025-02-15 23:27:41");
INSERT INTO payments VALUES("46","spr-20250215-112848","47","","67","4","1","","559","","0","Cash","","2025-02-15 23:28:48","2025-02-15 23:28:48");
INSERT INTO payments VALUES("47","spr-20250215-112946","47","","68","4","1","","5999.94","","0","Cash","","2025-02-15 23:29:46","2025-02-15 23:29:46");
INSERT INTO payments VALUES("48","spr-20250215-113100","47","","69","4","1","","2301.98","","0","Cash","","2025-02-15 23:31:00","2025-02-15 23:31:00");
INSERT INTO payments VALUES("49","spr-20250215-113419","47","","70","4","1","","350","","0","Cash","","2025-02-15 23:34:19","2025-02-15 23:34:19");
INSERT INTO payments VALUES("50","spr-20250215-113721","47","","71","7","1","","448.8","","0","Cash","","2025-02-15 23:37:21","2025-02-15 23:37:21");
INSERT INTO payments VALUES("51","spr-20250215-113829","47","","72","4","1","","2500","","0","Cash","","2025-02-15 23:38:29","2025-02-15 23:38:29");
INSERT INTO payments VALUES("52","spr-20250217-072621","47","","75","4","1","","1050","","0","Cash","","2025-02-17 19:26:21","2025-02-17 19:26:21");
INSERT INTO payments VALUES("53","spr-20250217-072909","47","","76","8","1","","1325.99","","0","Cash","","2025-02-17 19:29:09","2025-02-17 19:29:09");
INSERT INTO payments VALUES("54","spr-20250217-073140","47","","77","4","1","","218","","0","Cash","","2025-02-17 19:31:40","2025-02-17 19:31:40");
INSERT INTO payments VALUES("55","spr-20250218-100646","47","","78","4","1","","1050","","1000","Cash","","2025-02-18 10:06:46","2025-02-18 10:06:46");
INSERT INTO payments VALUES("56","spr-20250218-101048","47","","79","4","1","","1150.99","","1000","Cash","","2025-02-18 10:10:48","2025-02-18 10:10:48");
INSERT INTO payments VALUES("57","spr-20250218-101449","47","","80","4","1","","1150.99","","10","Cash","","2025-02-18 10:14:49","2025-02-18 10:14:49");
INSERT INTO payments VALUES("58","spr-20250218-103942","47","","82","4","1","","1150.99","","0","Cash","","2025-02-18 10:39:42","2025-02-18 10:39:42");
INSERT INTO payments VALUES("59","spr-20250218-022422","47","","86","4","1","","559","","5030","Cash","","2025-02-18 14:24:22","2025-02-18 14:24:22");
INSERT INTO payments VALUES("60","spr-20250218-022501","47","","87","4","1","","559","","100","Cash","","2025-02-18 14:25:01","2025-02-18 14:25:01");
INSERT INTO payments VALUES("61","spr-20250218-022538","47","","88","4","1","","1111.99","","0","Cash","","2025-02-18 14:25:38","2025-02-18 14:25:38");
INSERT INTO payments VALUES("62","spr-20250218-022717","47","","89","4","1","","559","","0","Cash","","2025-02-18 14:27:17","2025-02-18 14:27:17");
INSERT INTO payments VALUES("63","spr-20250218-023138","47","","90","4","1","","559","","100","Cash","","2025-02-18 14:31:38","2025-02-18 14:31:38");
INSERT INTO payments VALUES("64","spr-20250218-023258","47","","91","4","1","","559","","100","Cash","","2025-02-18 14:32:58","2025-02-18 14:32:58");
INSERT INTO payments VALUES("65","spr-20250218-023320","47","","92","4","1","","559","","0","Cash","","2025-02-18 14:33:20","2025-02-18 14:33:20");
INSERT INTO payments VALUES("66","spr-20250218-025911","47","","93","4","1","","559","","100","Cash","","2025-02-18 14:59:11","2025-02-18 14:59:11");
INSERT INTO payments VALUES("67","spr-20250218-030015","47","","94","4","1","","559","","100","Cash","","2025-02-18 15:00:15","2025-02-18 15:00:15");
INSERT INTO payments VALUES("68","spr-20250218-030253","47","","95","4","1","","559","","100","Cash","","2025-02-18 15:02:53","2025-02-18 15:02:53");
INSERT INTO payments VALUES("69","spr-20250218-030511","47","","96","4","1","","1150.99","","1000","Cash","","2025-02-18 15:05:11","2025-02-18 15:05:11");
INSERT INTO payments VALUES("70","spr-20250218-030547","47","","97","4","1","","1150.99","","1000","Cash","","2025-02-18 15:05:47","2025-02-18 15:05:47");
INSERT INTO payments VALUES("71","spr-20250218-030703","47","","98","4","1","","1150.99","","1000","Cash","","2025-02-18 15:07:03","2025-02-18 15:07:03");
INSERT INTO payments VALUES("72","spr-20250218-031643","47","","99","4","1","","2301.98","","3000","Cash","","2025-02-18 15:16:43","2025-02-18 15:16:43");
INSERT INTO payments VALUES("73","spr-20250218-031726","47","","100","4","1","","1111.99","","1000","Cash","","2025-02-18 15:17:26","2025-02-18 15:17:26");
INSERT INTO payments VALUES("74","spr-20250218-032057","47","","101","4","1","","1111.99","","200","Cash","","2025-02-18 15:20:57","2025-02-18 15:20:57");
INSERT INTO payments VALUES("75","spr-20250218-032209","47","","102","4","1","","1111.99","","10200","Cash","","2025-02-18 15:22:09","2025-02-18 15:22:09");
INSERT INTO payments VALUES("76","spr-20250218-032256","47","","103","4","1","","1111.99","","2000","Cash","","2025-02-18 15:22:56","2025-02-18 15:22:56");
INSERT INTO payments VALUES("77","spr-20250218-032500","47","","104","4","1","","1111.99","","1000","Cash","","2025-02-18 15:25:00","2025-02-18 15:25:00");
INSERT INTO payments VALUES("78","spr-20250218-033317","47","","105","4","1","","1111.99","","1000","Cash","","2025-02-18 15:33:17","2025-02-18 15:33:17");
INSERT INTO payments VALUES("79","spr-20250218-033407","47","","106","4","1","","1111.99","","2000","Cash","","2025-02-18 15:34:07","2025-02-18 15:34:07");
INSERT INTO payments VALUES("80","spr-20250218-033433","47","","107","4","1","","1111.99","","0","Cash","","2025-02-18 15:34:33","2025-02-18 15:34:33");
INSERT INTO payments VALUES("81","spr-20250218-035818","47","","108","8","1","","1299.99","","0","Cash","","2025-02-18 15:58:18","2025-02-18 15:58:18");
INSERT INTO payments VALUES("82","spr-20250218-035915","47","","109","8","1","","1299.99","","0","Cash","","2025-02-18 15:59:15","2025-02-18 15:59:15");
INSERT INTO payments VALUES("83","spr-20250218-040157","47","","110","4","1","","1250","","0","Cash","","2025-02-18 16:01:57","2025-02-18 16:01:57");
INSERT INTO payments VALUES("84","spr-20250218-042141","47","","112","4","1","","1150.99","","0","Credit Card","","2025-02-18 16:21:41","2025-02-18 16:21:41");
INSERT INTO payments VALUES("85","spr-20250218-042222","47","","113","4","1","","1250","","0","Cash","","2025-02-18 16:22:22","2025-02-18 16:22:22");



CREATE TABLE `payrolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payrolls VALUES("1","payroll-20250215-111630","1","1","47","1000000","1","Done","2025-02-15 00:00:00","2025-02-15 23:16:30");
INSERT INTO payrolls VALUES("2","payroll-20250217-114151","1","1","47","700","0","","2025-02-17 00:00:00","2025-02-17 11:41:51");
INSERT INTO payrolls VALUES("3","payroll-20250217-124650","1","1","47","700","0","","2025-02-17 00:00:00","2025-02-17 12:46:50");
INSERT INTO payrolls VALUES("4","payroll-20250218-040500","1","3","47","1300","1","","2025-02-18 00:00:00","2025-02-18 16:05:15");



CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("4","products-edit","web","2018-06-03 01:00:09","2018-06-03 01:00:09");
INSERT INTO permissions VALUES("5","products-delete","web","2018-06-03 22:54:22","2018-06-03 22:54:22");
INSERT INTO permissions VALUES("6","products-add","web","2018-06-04 00:34:14","2018-06-04 00:34:14");
INSERT INTO permissions VALUES("7","products-index","web","2018-06-04 03:34:27","2018-06-04 03:34:27");
INSERT INTO permissions VALUES("8","purchases-index","web","2018-06-04 08:03:19","2018-06-04 08:03:19");
INSERT INTO permissions VALUES("9","purchases-add","web","2018-06-04 08:12:25","2018-06-04 08:12:25");
INSERT INTO permissions VALUES("10","purchases-edit","web","2018-06-04 09:47:36","2018-06-04 09:47:36");
INSERT INTO permissions VALUES("11","purchases-delete","web","2018-06-04 09:47:36","2018-06-04 09:47:36");
INSERT INTO permissions VALUES("12","sales-index","web","2018-06-04 10:49:08","2018-06-04 10:49:08");
INSERT INTO permissions VALUES("13","sales-add","web","2018-06-04 10:49:52","2018-06-04 10:49:52");
INSERT INTO permissions VALUES("14","sales-edit","web","2018-06-04 10:49:52","2018-06-04 10:49:52");
INSERT INTO permissions VALUES("15","sales-delete","web","2018-06-04 10:49:53","2018-06-04 10:49:53");
INSERT INTO permissions VALUES("16","quotes-index","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("17","quotes-add","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("18","quotes-edit","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("19","quotes-delete","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("20","transfers-index","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("21","transfers-add","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("22","transfers-edit","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("23","transfers-delete","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("24","returns-index","web","2018-06-04 22:50:24","2018-06-04 22:50:24");
INSERT INTO permissions VALUES("25","returns-add","web","2018-06-04 22:50:24","2018-06-04 22:50:24");
INSERT INTO permissions VALUES("26","returns-edit","web","2018-06-04 22:50:25","2018-06-04 22:50:25");
INSERT INTO permissions VALUES("27","returns-delete","web","2018-06-04 22:50:25","2018-06-04 22:50:25");
INSERT INTO permissions VALUES("28","customers-index","web","2018-06-04 23:15:54","2018-06-04 23:15:54");
INSERT INTO permissions VALUES("29","customers-add","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("30","customers-edit","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("31","customers-delete","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("32","suppliers-index","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("33","suppliers-add","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("34","suppliers-edit","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("35","suppliers-delete","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("36","product-report","web","2018-06-24 23:05:33","2018-06-24 23:05:33");
INSERT INTO permissions VALUES("37","purchase-report","web","2018-06-24 23:24:56","2018-06-24 23:24:56");
INSERT INTO permissions VALUES("38","sale-report","web","2018-06-24 23:33:13","2018-06-24 23:33:13");
INSERT INTO permissions VALUES("39","customer-report","web","2018-06-24 23:36:51","2018-06-24 23:36:51");
INSERT INTO permissions VALUES("40","due-report","web","2018-06-24 23:39:52","2018-06-24 23:39:52");
INSERT INTO permissions VALUES("41","users-index","web","2018-06-25 00:00:10","2018-06-25 00:00:10");
INSERT INTO permissions VALUES("42","users-add","web","2018-06-25 00:00:10","2018-06-25 00:00:10");
INSERT INTO permissions VALUES("43","users-edit","web","2018-06-25 00:01:30","2018-06-25 00:01:30");
INSERT INTO permissions VALUES("44","users-delete","web","2018-06-25 00:01:30","2018-06-25 00:01:30");
INSERT INTO permissions VALUES("45","profit-loss","web","2018-07-14 21:50:05","2018-07-14 21:50:05");
INSERT INTO permissions VALUES("46","best-seller","web","2018-07-14 22:01:38","2018-07-14 22:01:38");
INSERT INTO permissions VALUES("47","daily-sale","web","2018-07-14 22:24:21","2018-07-14 22:24:21");
INSERT INTO permissions VALUES("48","monthly-sale","web","2018-07-14 22:30:41","2018-07-14 22:30:41");
INSERT INTO permissions VALUES("49","daily-purchase","web","2018-07-14 22:36:46","2018-07-14 22:36:46");
INSERT INTO permissions VALUES("50","monthly-purchase","web","2018-07-14 22:48:17","2018-07-14 22:48:17");
INSERT INTO permissions VALUES("51","payment-report","web","2018-07-14 23:10:41","2018-07-14 23:10:41");
INSERT INTO permissions VALUES("52","warehouse-stock-report","web","2018-07-14 23:16:55","2018-07-14 23:16:55");
INSERT INTO permissions VALUES("53","product-qty-alert","web","2018-07-14 23:33:21","2018-07-14 23:33:21");
INSERT INTO permissions VALUES("54","supplier-report","web","2018-07-30 03:00:01","2018-07-30 03:00:01");
INSERT INTO permissions VALUES("55","expenses-index","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("56","expenses-add","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("57","expenses-edit","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("58","expenses-delete","web","2018-09-05 01:07:11","2018-09-05 01:07:11");
INSERT INTO permissions VALUES("59","general_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("60","mail_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("61","pos_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("62","hrm_setting","web","2019-01-02 10:30:23","2019-01-02 10:30:23");
INSERT INTO permissions VALUES("63","purchase-return-index","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("64","purchase-return-add","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("65","purchase-return-edit","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("66","purchase-return-delete","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("67","account-index","web","2019-01-02 22:06:13","2019-01-02 22:06:13");
INSERT INTO permissions VALUES("68","balance-sheet","web","2019-01-02 22:06:14","2019-01-02 22:06:14");
INSERT INTO permissions VALUES("69","account-statement","web","2019-01-02 22:06:14","2019-01-02 22:06:14");
INSERT INTO permissions VALUES("70","department","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("71","attendance","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("72","payroll","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("73","employees-index","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("74","employees-add","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("75","employees-edit","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("76","employees-delete","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("77","user-report","web","2019-01-16 06:48:18","2019-01-16 06:48:18");
INSERT INTO permissions VALUES("78","stock_count","web","2019-02-17 10:32:01","2019-02-17 10:32:01");
INSERT INTO permissions VALUES("79","adjustment","web","2019-02-17 10:32:02","2019-02-17 10:32:02");
INSERT INTO permissions VALUES("80","sms_setting","web","2019-02-22 05:18:03","2019-02-22 05:18:03");
INSERT INTO permissions VALUES("81","create_sms","web","2019-02-22 05:18:03","2019-02-22 05:18:03");
INSERT INTO permissions VALUES("82","print_barcode","web","2019-03-07 05:02:19","2019-03-07 05:02:19");
INSERT INTO permissions VALUES("83","empty_database","web","2019-03-07 05:02:19","2019-03-07 05:02:19");
INSERT INTO permissions VALUES("84","customer_group","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("85","unit","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("86","tax","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("87","gift_card","web","2019-03-07 06:29:38","2019-03-07 06:29:38");
INSERT INTO permissions VALUES("88","coupon","web","2019-03-07 06:29:38","2019-03-07 06:29:38");
INSERT INTO permissions VALUES("89","holiday","web","2019-10-19 08:57:15","2019-10-19 08:57:15");
INSERT INTO permissions VALUES("90","warehouse-report","web","2019-10-22 06:00:23","2019-10-22 06:00:23");
INSERT INTO permissions VALUES("91","warehouse","web","2020-02-26 06:47:32","2020-02-26 06:47:32");
INSERT INTO permissions VALUES("92","brand","web","2020-02-26 06:59:59","2020-02-26 06:59:59");
INSERT INTO permissions VALUES("93","billers-index","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("94","billers-add","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("95","billers-edit","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("96","billers-delete","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("97","money-transfer","web","2020-03-02 05:41:48","2020-03-02 05:41:48");
INSERT INTO permissions VALUES("98","category","web","2020-07-13 12:13:16","2020-07-13 12:13:16");
INSERT INTO permissions VALUES("99","delivery","web","2020-07-13 12:13:16","2020-07-13 12:13:16");
INSERT INTO permissions VALUES("100","send_notification","web","2020-10-31 06:21:31","2020-10-31 06:21:31");
INSERT INTO permissions VALUES("101","today_sale","web","2020-10-31 06:57:04","2020-10-31 06:57:04");
INSERT INTO permissions VALUES("102","today_profit","web","2020-10-31 06:57:04","2020-10-31 06:57:04");
INSERT INTO permissions VALUES("103","currency","web","2020-11-09 00:23:11","2020-11-09 00:23:11");
INSERT INTO permissions VALUES("104","backup_database","web","2020-11-15 00:16:55","2020-11-15 00:16:55");
INSERT INTO permissions VALUES("105","reward_point_setting","web","2021-06-27 04:34:42","2021-06-27 04:34:42");
INSERT INTO permissions VALUES("106","revenue_profit_summary","web","2022-02-08 13:57:21","2022-02-08 13:57:21");
INSERT INTO permissions VALUES("107","cash_flow","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("108","monthly_summary","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("109","yearly_report","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("110","discount_plan","web","2022-02-16 09:12:26","2022-02-16 09:12:26");
INSERT INTO permissions VALUES("111","discount","web","2022-02-16 09:12:38","2022-02-16 09:12:38");
INSERT INTO permissions VALUES("112","product-expiry-report","web","2022-03-30 05:39:20","2022-03-30 05:39:20");
INSERT INTO permissions VALUES("113","purchase-payment-index","web","2022-06-05 14:12:27","2022-06-05 14:12:27");
INSERT INTO permissions VALUES("114","purchase-payment-add","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("115","purchase-payment-edit","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("116","purchase-payment-delete","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("117","sale-payment-index","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("118","sale-payment-add","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("119","sale-payment-edit","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("120","sale-payment-delete","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("121","all_notification","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("122","sale-report-chart","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("123","dso-report","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("124","product_history","web","2022-08-25 14:04:05","2022-08-25 14:04:05");
INSERT INTO permissions VALUES("125","supplier-due-report","web","2022-08-31 09:46:33","2022-08-31 09:46:33");
INSERT INTO permissions VALUES("126","custom_field","web","2023-05-02 07:41:35","2023-05-02 07:41:35");
INSERT INTO permissions VALUES("127","incomes-index","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("128","incomes-add","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("129","incomes-edit","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("130","incomes-delete","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("131","packing_slip_challan","web","2024-08-11 04:51:00","2024-08-11 04:51:00");
INSERT INTO permissions VALUES("132","biller-report","web","2024-08-25 23:30:44","2024-08-25 23:30:44");



CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `is_table` tinyint(1) NOT NULL DEFAULT 0,
  `send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_public_key` varchar(191) DEFAULT NULL,
  `stripe_secret_key` varchar(191) DEFAULT NULL,
  `paypal_live_api_username` varchar(191) DEFAULT NULL,
  `paypal_live_api_password` varchar(191) DEFAULT NULL,
  `paypal_live_api_secret` varchar(191) DEFAULT NULL,
  `payment_options` text DEFAULT NULL,
  `invoice_option` varchar(10) DEFAULT NULL,
  `thermal_invoice_size` varchar(255) NOT NULL DEFAULT '80',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `pos_setting_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_setting VALUES("1","2","1","1","3","0","0","1","","","admin","admin","","cash,card,cheque,gift_card,deposit,paypal","thermal","80","2018-09-02 03:17:04","2024-08-25 23:28:35");



CREATE TABLE `product_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_adjustments VALUES("1","1","11","","1500","100","+","2025-02-14 18:05:49","2025-02-14 18:05:49");
INSERT INTO product_adjustments VALUES("2","2","39","","1200","10","+","2025-02-14 18:10:21","2025-02-14 18:10:21");
INSERT INTO product_adjustments VALUES("3","3","35","","1500","10","+","2025-02-14 19:09:14","2025-02-14 19:09:14");
INSERT INTO product_adjustments VALUES("4","4","2","","1000","10","-","2025-02-14 19:12:13","2025-02-14 19:12:13");
INSERT INTO product_adjustments VALUES("5","5","2","","1000","11","+","2025-02-14 19:12:58","2025-02-14 19:12:58");



CREATE TABLE `product_batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_productions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `production_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("1","1","23","","","","10","10","0","1","439","0","0","0","4390","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("2","1","27","","","","10","10","0","1","0.89","0","0","0","8.9","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("3","1","20","","","","10","10","0","1","399","0","0","0","3990","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("4","1","17","","","","10","10","0","1","349","0","0","0","3490","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("5","1","16","","","","10","10","0","1","79","0","0","0","790","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("6","1","30","","","","10","10","0","1","100","0","10","100","1100","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("7","1","19","","","","10","10","0","1","817.27","0","10","817.27","8990","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("8","1","3","","","","10","10","0","1","272.73","0","10","272.73","3000","2024-01-19 13:46:05","2024-01-19 13:46:05");
INSERT INTO product_purchases VALUES("9","1","7","","","","10","10","0","1","818.17","0","10","818.17","8999.9","2024-01-19 13:46:05","2024-01-19 13:46:05");
INSERT INTO product_purchases VALUES("10","1","2","","","","10","10","0","1","909.09","0","10","909.09","10000","2024-01-19 13:46:05","2024-01-19 13:46:05");
INSERT INTO product_purchases VALUES("11","2","6","","","","10","10","0","1","999.99","0","0","0","9999.9","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("12","2","13","","","","10","10","0","1","227.27","0","10","227.27","2500","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("13","2","10","","","","10","10","0","1","990","0","0","0","9900","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("14","2","21","","","","10","10","0","1","369","0","0","0","3690","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("15","2","8","","","","10","10","0","1","1090","0","10","1090","11990","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("16","2","12","","","","10","10","0","1","908.18","0","10","908.18","9990","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("17","2","29","","","","10","10","0","1","2.39","0","0","0","23.9","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("18","2","26","","","","10","10","0","4","2.99","0","0","0","29.9","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("19","2","9","","","","10","10","0","1","399","0","0","0","3990","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("20","2","11","","","","10","10","0","1","1363.64","0","10","1363.64","15000","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("21","3","1","","","","10","10","0","1","999.99","0","10","999.99","10999.9","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("22","3","18","","","","10","10","0","1","417.27","0","10","417.27","4590","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("23","3","25","","","","10","10","0","1","130","0","0","0","1300","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("24","3","28","","","","10","10","0","1","2.39","0","0","0","23.9","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("25","3","14","","","","10","10","0","1","318.18","0","10","318.18","3500","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("26","3","24","","","","10","10","0","1","271.82","0","10","271.82","2990","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("27","3","4","","","","10","10","0","1","818.18","0","10","818.18","9000","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("28","3","5","","","","10","10","0","1","864.54","0","10","864.54","9509.9","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("29","3","22","","","","10","10","0","1","275","0","0","0","2750","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("30","3","15","","","","10","10","0","1","499","0","0","0","4990","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("31","4","1","","","","11","11","0","1","999.99","0","10","1099.99","12099.89","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_purchases VALUES("32","4","18","","","","10","10","0","1","417.27","0","10","417.27","4590","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_purchases VALUES("33","4","25","","","","10","10","0","1","130","0","0","0","1300","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_purchases VALUES("34","4","28","","","","10","10","0","1","2.39","0","0","0","23.9","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_purchases VALUES("35","4","14","","","","10","10","0","1","318.18","0","10","318.18","3500","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("36","4","24","","","","10","10","0","1","271.82","0","10","271.82","2990","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("37","4","4","","","","10","10","0","1","818.18","0","10","818.18","9000","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("38","4","5","","","","10","10","0","1","864.54","0","10","864.54","9509.9","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("39","4","22","","","","10","10","0","1","275","0","0","0","2750","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("40","4","15","","","","10","10","0","1","499","0","0","0","4990","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("41","5","23","","","","10","10","0","1","439","0","0","0","4390","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("42","5","27","","","","10","10","0","1","0.89","0","0","0","8.9","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("43","5","20","","","","10","10","0","1","399","0","0","0","3990","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("44","5","17","","","","10","10","0","1","349","0","0","0","3490","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("45","5","16","","","","10","10","0","1","79","0","0","0","790","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("46","5","30","","","","10","10","0","1","100","0","10","100","1100","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("47","5","19","","","","10","10","0","1","817.27","0","10","817.27","8990","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("48","5","3","","","","10","10","0","1","272.73","0","10","272.73","3000","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("49","5","7","","","","10","10","0","1","818.17","0","10","818.17","8999.9","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("50","5","2","","","","10","10","0","1","909.09","0","10","909.09","10000","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("51","6","6","","","","10","10","0","1","999.99","0","0","0","9999.9","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("52","6","13","","","","10","10","0","1","227.27","0","10","227.27","2500","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("53","6","10","","","","10","10","0","1","990","0","0","0","9900","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("54","6","21","","","","10","10","0","1","369","0","0","0","3690","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("55","6","8","","","","10","10","0","1","1090","0","10","1090","11990","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("56","6","12","","","","10","10","0","1","908.18","0","10","908.18","9990","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("57","6","29","","","","10","10","0","1","2.39","0","0","0","23.9","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("58","6","26","","","","10","10","0","4","2.99","0","0","0","29.9","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("59","6","9","","","","10","10","0","1","399","0","0","0","3990","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("60","6","11","","","","10","10","0","1","1363.64","0","10","1363.64","15000","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("61","7","17","","","","1","1","0","1","349","0","0","0","349","2024-01-19 14:52:02","2024-01-19 14:52:02");
INSERT INTO product_purchases VALUES("62","7","20","","","","1","1","0","1","399","0","0","0","399","2024-01-19 14:52:02","2024-01-19 14:52:02");
INSERT INTO product_purchases VALUES("64","8","7","","","","6","6","0","1","800","0","10","480","5280","2024-06-20 05:08:26","2024-06-20 05:08:26");
INSERT INTO product_purchases VALUES("65","9","33","","","1001,1002,1003,1004,1005","5","5","0","1","100","0","0","0","500","2024-07-18 07:41:45","2024-07-18 07:41:45");
INSERT INTO product_purchases VALUES("67","10","33","","","2001,2002,2003,2004,2005","5","5","0","1","100","0","0","0","500","2024-07-18 07:51:35","2024-07-18 07:51:35");
INSERT INTO product_purchases VALUES("68","11","1","","","","1","1","0","1","999.99","0","10","100","1099.99","2025-02-14 12:10:45","2025-02-14 12:10:45");
INSERT INTO product_purchases VALUES("69","12","1","","","","100","0","0","1","999.99","0","10","9999.91","109999","2025-02-17 19:49:32","2025-02-17 19:49:32");



CREATE TABLE `product_quotation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_quotation VALUES("1","1","17","","","1","1","499","0","0","0","499","2024-01-19 14:51:32","2024-01-19 14:51:32");
INSERT INTO product_quotation VALUES("2","1","20","","","1","1","499","0","0","0","499","2024-01-19 14:51:32","2024-01-19 14:51:32");
INSERT INTO product_quotation VALUES("3","2","20","","","3","1","499","0","0","0","1497","2024-08-25 23:01:17","2024-08-25 23:01:17");



CREATE TABLE `product_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_returns VALUES("1","1","1","","","","1","1","1181.81","0","10","118.18","1299.99","2024-03-24 07:08:23","2024-03-24 07:08:23");
INSERT INTO product_returns VALUES("2","2","5","","","","1","1","1046.35","0","10","104.64","1150.99","2024-04-29 12:30:38","2024-04-29 12:30:38");
INSERT INTO product_returns VALUES("3","2","3","","","","1","1","318.18","0","10","31.82","350","2024-04-29 12:30:38","2024-04-29 12:30:38");
INSERT INTO product_returns VALUES("4","3","1","","","","1","1","1181.81","0","10","118.18","1299.99","2024-06-26 07:01:42","2024-06-26 07:01:42");



CREATE TABLE `product_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `is_packing` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("1","1","14","","","","1","0","1","453.64","0","10","45.36","499","2024-01-19 14:40:16","2024-01-19 14:40:16","","");
INSERT INTO product_sales VALUES("2","1","2","","","","1","0","1","1144.55","0","10","114.45","1259","2024-01-19 14:40:16","2024-01-19 14:40:16","","");
INSERT INTO product_sales VALUES("3","2","16","","","","1","0","1","109","0","0","0","109","2024-01-19 14:44:41","2024-01-19 14:44:41","","");
INSERT INTO product_sales VALUES("4","2","18","","","","1","0","1","544.55","0","10","54.45","599","2024-01-19 14:44:41","2024-01-19 14:44:41","","");
INSERT INTO product_sales VALUES("5","2","9","","","","1","0","1","559","0","0","0","559","2024-01-19 14:44:41","2024-01-19 14:44:41","","");
INSERT INTO product_sales VALUES("6","2","4","","","","1","0","1","954.55","0","10","95.45","1050","2024-01-19 14:44:41","2024-01-19 14:44:41","","");
INSERT INTO product_sales VALUES("7","2","3","","","","2","0","1","318.18","0","10","63.64","700","2024-01-19 14:44:41","2024-01-19 14:44:41","","");
INSERT INTO product_sales VALUES("8","3","18","","","","1","0","1","544.55","0","10","54.45","599","2024-01-19 14:48:33","2024-01-19 14:48:33","","");
INSERT INTO product_sales VALUES("9","3","23","","","","1","0","1","577","0","0","0","577","2024-01-19 14:48:33","2024-01-19 14:48:33","","");
INSERT INTO product_sales VALUES("10","3","27","","","","3","0","1","2","0","0","0","6","2024-01-19 14:48:33","2024-01-19 14:48:33","","");
INSERT INTO product_sales VALUES("11","4","7","","","","1","0","1","908.18","0","10","90.82","999","2024-01-19 14:52:42","2024-01-19 14:53:31","","");
INSERT INTO product_sales VALUES("12","4","17","","","","1","0","1","499","0","0","0","499","2024-01-19 14:52:42","2024-01-19 14:53:31","","");
INSERT INTO product_sales VALUES("13","4","20","","","","1","0","1","499","0","0","0","499","2024-01-19 14:52:42","2024-01-19 14:53:31","","");
INSERT INTO product_sales VALUES("14","5","2","","","","1","0","1","1144.55","0","10","114.45","1259","2024-02-10 06:22:24","2024-02-10 06:22:24","","");
INSERT INTO product_sales VALUES("15","6","1","","","","1","0","1","1181.81","0","10","118.18","1299.99","2024-02-25 07:49:51","2024-02-25 07:49:51","","");
INSERT INTO product_sales VALUES("16","7","1","","","","2","0","1","1181.81","0","10","236.36","2599.98","2024-02-25 07:50:13","2024-02-25 07:50:13","","");
INSERT INTO product_sales VALUES("17","8","2","","","","1","0","1","1144.55","0","10","114.45","1259","2024-02-28 05:27:44","2024-02-28 05:27:44","","");
INSERT INTO product_sales VALUES("18","8","1","","","","1","1","1","1181.81","0","10","118.18","1299.99","2024-02-28 05:27:44","2024-03-24 07:08:23","","");
INSERT INTO product_sales VALUES("19","9","3","","","","1","0","1","318.18","0","10","31.82","350","2024-04-21 05:01:43","2024-04-21 05:01:43","","");
INSERT INTO product_sales VALUES("25","13","3","","","","1","0","1","318.18","0","10","31.82","350","2024-04-28 06:15:44","2024-04-28 06:15:44","","");
INSERT INTO product_sales VALUES("26","13","19","","","","1","0","1","962.73","0","10","96.27","1059","2024-04-28 06:15:44","2024-04-28 06:15:44","","");
INSERT INTO product_sales VALUES("27","14","5","","","","1","1","1","1046.35","0","10","104.64","1150.99","2024-04-29 12:29:56","2024-04-29 12:30:38","","");
INSERT INTO product_sales VALUES("28","14","4","","","","1","0","1","954.55","0","10","95.45","1050","2024-04-29 12:29:56","2024-04-29 12:29:56","","");
INSERT INTO product_sales VALUES("29","14","3","","","","1","1","1","318.18","0","10","31.82","350","2024-04-29 12:29:56","2024-04-29 12:30:38","","");
INSERT INTO product_sales VALUES("30","14","2","","","","1","0","1","1136.36","0","10","113.64","1250","2024-04-29 12:29:56","2024-04-29 12:29:56","","");
INSERT INTO product_sales VALUES("31","15","20","","","","1","0","1","499","0","0","0","499","2024-05-05 05:19:02","2024-05-05 05:19:02","","");
INSERT INTO product_sales VALUES("37","20","2","","","","1","0","1","1136.36","0","10","113.64","1250","2024-05-05 11:29:05","2024-05-05 11:29:05","","");
INSERT INTO product_sales VALUES("38","20","1","","","","1","0","1","1181.81","0","10","118.18","1299.99","2024-05-05 11:29:05","2024-05-05 11:29:05","","");
INSERT INTO product_sales VALUES("40","22","7","","","","1","0","1","909.08","0","10","90.91","999.99","2024-05-08 08:08:51","2024-05-08 08:08:51","","");
INSERT INTO product_sales VALUES("41","22","3","","","","1","0","1","318.18","0","10","31.82","350","2024-05-08 08:08:51","2024-05-08 08:08:51","","");
INSERT INTO product_sales VALUES("42","23","1","","","","1","0","1","1181.81","0","10","118.18","1299.99","2024-05-19 08:24:23","2024-05-19 08:24:23","","");
INSERT INTO product_sales VALUES("43","24","8","","","","1","0","1","1181.82","0","10","118.18","1300","2024-05-19 08:25:30","2024-05-19 08:25:30","","");
INSERT INTO product_sales VALUES("44","25","8","","","","1","0","1","1181.82","0","10","118.18","1300","2024-05-19 08:30:55","2024-05-19 08:30:55","","");
INSERT INTO product_sales VALUES("49","28","4","","","","1","0","1","954.55","0","10","95.45","1050","2024-05-21 07:32:49","2024-05-21 07:32:49","","");
INSERT INTO product_sales VALUES("50","29","2","","","","1","0","1","1136.36","0","10","113.64","1250","2024-06-03 06:26:51","2024-06-03 06:26:51","","");
INSERT INTO product_sales VALUES("51","29","1","","","","1","0","1","1181.81","0","10","118.18","1299.99","2024-06-03 06:26:51","2024-06-03 06:26:51","","");
INSERT INTO product_sales VALUES("52","30","4","","","","1","0","1","954.55","0","10","95.45","1050","2024-06-03 11:30:15","2024-06-03 11:30:15","","");
INSERT INTO product_sales VALUES("53","30","2","","","","1","0","1","1136.36","0","10","113.64","1250","2024-06-03 11:30:15","2024-06-03 11:30:15","","");
INSERT INTO product_sales VALUES("54","31","23","","","","1","0","1","577","0","0","0","577","2024-06-03 11:30:58","2024-06-03 11:30:58","","");
INSERT INTO product_sales VALUES("55","32","1","","","","1","0","1","1181.81","0","10","118.18","1299.99","2024-06-20 07:54:56","2024-06-20 07:54:56","","");
INSERT INTO product_sales VALUES("56","33","1","","","","1","1","1","1181.81","0","10","118.18","1299.99","2024-06-26 07:01:15","2024-06-26 07:01:42","","");
INSERT INTO product_sales VALUES("59","36","23","","","","1","0","1","577","0","0","0","577","2024-07-11 06:10:41","2024-07-11 06:10:41","","");
INSERT INTO product_sales VALUES("61","38","1","","","","1","0","1","1181.81","0","10","118.18","1299.99","2024-07-18 05:36:30","2024-07-18 05:36:30","","");
INSERT INTO product_sales VALUES("62","39","33","","","1003","1","0","1","250","0","0","0","250","2024-07-18 07:59:13","2024-07-18 07:59:13","","");
INSERT INTO product_sales VALUES("63","40","33","","","2001","1","0","1","250","0","0","0","250","2024-07-18 08:01:45","2024-07-18 08:01:45","","");
INSERT INTO product_sales VALUES("65","42","23","","","","1","0","1","577","0","0","0","577","2024-08-11 05:06:29","2024-08-11 05:28:06","1","1");
INSERT INTO product_sales VALUES("66","43","18","","","","1","0","1","544.55","0","10","54.45","599","2024-08-11 05:37:22","2024-08-11 05:37:38","","1");
INSERT INTO product_sales VALUES("68","45","2","","","","1","0","1","1136.36","0","10","113.64","1250","2024-08-11 05:48:52","2024-11-26 16:37:06","","");
INSERT INTO product_sales VALUES("69","45","3","","","","1","0","1","318.18","0","10","31.82","350","2024-08-11 05:48:52","2024-11-26 16:37:07","","");
INSERT INTO product_sales VALUES("70","46","1","","","","1","0","1","1181.81","0","10","118.18","1299.99","2024-08-25 23:26:16","2024-11-26 16:35:18","","");
INSERT INTO product_sales VALUES("71","47","4","","","","1","0","1","954.55","0","10","95.45","1050","2024-08-25 23:26:30","2024-11-26 16:38:31","","");
INSERT INTO product_sales VALUES("74","50","3","","","","1","0","1","318.18","0","10","31.82","350","2024-08-25 23:29:29","2024-11-26 16:20:14","","");
INSERT INTO product_sales VALUES("75","51","29","","","null","10","0","1","3.19","0","0","0","31.9","2024-11-26 16:17:24","2024-11-26 16:36:03","","");
INSERT INTO product_sales VALUES("76","52","20","","","","3","0","1","499","0","0","0","1497","2024-11-26 16:41:34","2024-11-26 16:41:34","","");
INSERT INTO product_sales VALUES("77","53","1","","","null","1","0","1","1181.81","0","10","118.18","1299.99","2024-11-28 05:21:41","2024-11-28 05:21:41","","");
INSERT INTO product_sales VALUES("78","54","20","","","","3","0","1","499","0","0","0","1497","2024-11-28 15:04:21","2024-11-28 15:04:21","","");
INSERT INTO product_sales VALUES("79","55","20","","","","3","0","1","499","0","0","0","1497","2024-11-28 15:07:19","2024-11-28 15:07:19","","");
INSERT INTO product_sales VALUES("80","56","20","","","","3","0","1","499","0","0","0","1497","2024-11-28 15:12:48","2024-11-28 15:12:48","","");
INSERT INTO product_sales VALUES("81","57","1","","","null","1","0","1","12999.9","0","10","1299.99","14299.89","2025-02-13 16:41:51","2025-02-13 16:41:51","","");
INSERT INTO product_sales VALUES("82","58","1","","","null","1","0","1","12999.9","0","10","1299.99","14299.89","2025-02-13 16:45:06","2025-02-13 16:45:06","","");
INSERT INTO product_sales VALUES("83","59","1","","","null","1","0","1","12999.9","0","10","1299.99","14299.89","2025-02-13 16:48:45","2025-02-13 16:48:45","","");
INSERT INTO product_sales VALUES("84","60","1","","","null","1","0","1","12999.9","0","10","1299.99","14299.89","2025-02-13 16:55:20","2025-02-13 16:55:20","","");
INSERT INTO product_sales VALUES("85","61","5","","","null","1","0","1","11509.9","0","10","1150.99","12660.89","2025-02-13 16:55:26","2025-02-13 16:55:26","","");
INSERT INTO product_sales VALUES("86","62","1","","","null","1","0","1","12999.9","0","10","1299.99","14299.89","2025-02-13 19:54:12","2025-02-13 19:54:12","","");
INSERT INTO product_sales VALUES("87","63","2","","","null","1","0","1","1136.36","0","10","113.64","1250","2025-02-14 10:10:34","2025-02-14 10:10:34","","");
INSERT INTO product_sales VALUES("88","64","30","","","null","1","0","1","200","0","10","20","220","2025-02-14 19:19:05","2025-02-14 19:19:05","","");
INSERT INTO product_sales VALUES("89","65","2","","","null","1","0","1","1136.36","0","10","113.64","1250","2025-02-15 23:24:11","2025-02-15 23:24:11","","");
INSERT INTO product_sales VALUES("90","66","10","","","null","1","0","1","1250","0","0","0","1250","2025-02-15 23:27:41","2025-02-15 23:27:41","","");
INSERT INTO product_sales VALUES("91","66","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-15 23:27:41","2025-02-15 23:27:41","","");
INSERT INTO product_sales VALUES("92","67","9","","","null","1","0","1","559","0","0","0","559","2025-02-15 23:28:48","2025-02-15 23:28:48","","");
INSERT INTO product_sales VALUES("93","68","7","","","null","6","0","1","909.08","0","10","545.45","5999.94","2025-02-15 23:29:46","2025-02-15 23:29:46","","");
INSERT INTO product_sales VALUES("94","69","5","","","null","2","0","1","1046.35","0","10","209.27","2301.98","2025-02-15 23:31:00","2025-02-15 23:31:00","","");
INSERT INTO product_sales VALUES("95","70","3","","","null","1","0","1","318.18","0","10","31.82","350","2025-02-15 23:34:19","2025-02-15 23:34:19","","");
INSERT INTO product_sales VALUES("96","71","30","","","null,null","2","0","1","204","0","10","40.8","448.8","2025-02-15 23:37:21","2025-02-15 23:37:21","","");
INSERT INTO product_sales VALUES("97","72","12","","","null","2","0","1","1136.36","0","10","227.27","2500","2025-02-15 23:38:29","2025-02-15 23:38:29","","");
INSERT INTO product_sales VALUES("98","73","30","","","null,null","2","0","1","204","0","10","40.8","448.8","2025-02-17 19:10:58","2025-02-17 19:10:58","","");
INSERT INTO product_sales VALUES("99","73","39","","","null,null,null,null","4","0","1","122.4","0","0","0","489.6","2025-02-17 19:10:58","2025-02-17 19:10:58","","");
INSERT INTO product_sales VALUES("100","74","3","","","null","1","0","1","318.18","0","10","31.82","350","2025-02-17 19:22:51","2025-02-17 19:22:51","","");
INSERT INTO product_sales VALUES("101","75","4","","","null","1","0","1","954.55","0","10","95.45","1050","2025-02-17 19:26:21","2025-02-17 19:26:21","","");
INSERT INTO product_sales VALUES("102","76","1","","","null","1","0","1","1205.45","0","10","120.54","1325.99","2025-02-17 19:29:08","2025-02-17 19:29:08","","");
INSERT INTO product_sales VALUES("103","77","16","","","null","2","0","1","109","0","0","0","218","2025-02-17 19:31:40","2025-02-17 19:31:40","","");
INSERT INTO product_sales VALUES("104","78","4","","","null","1","0","1","954.55","0","10","95.45","1050","2025-02-18 10:06:46","2025-02-18 10:06:46","","");
INSERT INTO product_sales VALUES("105","79","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 10:10:48","2025-02-18 10:10:48","","");
INSERT INTO product_sales VALUES("106","80","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 10:14:49","2025-02-18 10:14:49","","");
INSERT INTO product_sales VALUES("107","81","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 10:39:21","2025-02-18 10:39:21","","");
INSERT INTO product_sales VALUES("108","82","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 10:39:42","2025-02-18 10:39:42","","");
INSERT INTO product_sales VALUES("109","83","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 10:39:56","2025-02-18 10:39:56","","");
INSERT INTO product_sales VALUES("110","83","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 10:39:56","2025-02-18 10:39:56","","");
INSERT INTO product_sales VALUES("113","86","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 14:24:22","2025-02-18 14:24:22","","");
INSERT INTO product_sales VALUES("114","87","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 14:25:01","2025-02-18 14:25:01","","");
INSERT INTO product_sales VALUES("115","88","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 14:25:38","2025-02-18 14:25:38","","");
INSERT INTO product_sales VALUES("116","89","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 14:27:17","2025-02-18 14:27:17","","");
INSERT INTO product_sales VALUES("117","90","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 14:31:38","2025-02-18 14:31:38","","");
INSERT INTO product_sales VALUES("118","91","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 14:32:58","2025-02-18 14:32:58","","");
INSERT INTO product_sales VALUES("119","92","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 14:33:20","2025-02-18 14:33:20","","");
INSERT INTO product_sales VALUES("120","93","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 14:59:11","2025-02-18 14:59:11","","");
INSERT INTO product_sales VALUES("121","94","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 15:00:15","2025-02-18 15:00:15","","");
INSERT INTO product_sales VALUES("122","95","9","","","null","1","0","1","559","0","0","0","559","2025-02-18 15:02:53","2025-02-18 15:02:53","","");
INSERT INTO product_sales VALUES("123","96","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 15:05:11","2025-02-18 15:05:11","","");
INSERT INTO product_sales VALUES("124","97","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 15:05:47","2025-02-18 15:05:47","","");
INSERT INTO product_sales VALUES("125","98","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 15:07:03","2025-02-18 15:07:03","","");
INSERT INTO product_sales VALUES("126","99","5","","","null,null","2","0","1","1046.35","0","10","209.27","2301.98","2025-02-18 15:16:43","2025-02-18 15:16:43","","");
INSERT INTO product_sales VALUES("127","100","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 15:17:26","2025-02-18 15:17:26","","");
INSERT INTO product_sales VALUES("128","101","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 15:20:57","2025-02-18 15:20:57","","");
INSERT INTO product_sales VALUES("129","102","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 15:22:09","2025-02-18 15:22:09","","");
INSERT INTO product_sales VALUES("130","103","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 15:22:56","2025-02-18 15:22:56","","");
INSERT INTO product_sales VALUES("131","104","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 15:25:00","2025-02-18 15:25:00","","");
INSERT INTO product_sales VALUES("132","105","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 15:33:17","2025-02-18 15:33:17","","");
INSERT INTO product_sales VALUES("133","106","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 15:34:07","2025-02-18 15:34:07","","");
INSERT INTO product_sales VALUES("134","107","6","","","null","1","0","1","1111.99","0","0","0","1111.99","2025-02-18 15:34:33","2025-02-18 15:34:33","","");
INSERT INTO product_sales VALUES("135","108","1","","","null","1","0","1","1181.81","0","10","118.18","1299.99","2025-02-18 15:58:18","2025-02-18 15:58:18","","");
INSERT INTO product_sales VALUES("136","109","1","","","null","1","0","1","1181.81","0","10","118.18","1299.99","2025-02-18 15:59:15","2025-02-18 15:59:15","","");
INSERT INTO product_sales VALUES("137","110","2","","","null","1","0","1","1136.36","0","10","113.64","1250","2025-02-18 16:01:57","2025-02-18 16:01:57","","");
INSERT INTO product_sales VALUES("139","112","5","","","null","1","0","1","1046.35","0","10","104.64","1150.99","2025-02-18 16:21:41","2025-02-18 16:21:41","","");
INSERT INTO product_sales VALUES("140","113","10","","","null","1","0","1","1250","0","0","0","1250","2025-02-18 16:22:22","2025-02-18 16:22:22","","");



CREATE TABLE `product_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_transfer VALUES("11","11","23","","","","1","1","439","0","0","439","2024-05-28 09:05:50","2024-05-28 09:05:50");
INSERT INTO product_transfer VALUES("12","12","20","","","","1","1","399","0","0","399","2024-05-28 09:07:14","2024-05-28 09:07:14");
INSERT INTO product_transfer VALUES("13","13","23","","","null","1","1","439","0","0","439","2025-02-13 23:26:33","2025-02-13 23:26:33");
INSERT INTO product_transfer VALUES("14","14","30","","","null","10","1","100","10","100","1100","2025-02-14 19:17:22","2025-02-14 19:17:22");
INSERT INTO product_transfer VALUES("15","15","25","","","null","1","1","130","0","0","130","2025-02-15 23:57:19","2025-02-15 23:57:19");



CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) NOT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(191) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouse VALUES("1","23","","","","1","5","577","2024-01-19 13:46:04","2025-02-13 23:26:33");
INSERT INTO product_warehouse VALUES("2","27","","","","1","10","1.29","2024-01-19 13:46:04","2024-07-11 06:12:35");
INSERT INTO product_warehouse VALUES("3","20","","","","1","-4","499","2024-01-19 13:46:04","2024-11-28 15:12:48");
INSERT INTO product_warehouse VALUES("4","17","","","","1","10","499","2024-01-19 13:46:04","2024-04-28 06:05:43");
INSERT INTO product_warehouse VALUES("5","16","","","","1","8","109","2024-01-19 13:46:04","2025-02-17 19:31:40");
INSERT INTO product_warehouse VALUES("6","30","","","","1","0","200","2024-01-19 13:46:04","2025-02-14 19:17:22");
INSERT INTO product_warehouse VALUES("7","19","","","","1","9","1059","2024-01-19 13:46:04","2024-05-28 08:46:50");
INSERT INTO product_warehouse VALUES("8","3","","","","1","4","350","2024-01-19 13:46:05","2025-02-15 23:34:19");
INSERT INTO product_warehouse VALUES("9","7","","","","1","7","","2024-01-19 13:46:05","2025-02-15 23:29:46");
INSERT INTO product_warehouse VALUES("10","2","","","","1","-1","","2024-01-19 13:46:05","2025-02-18 16:01:57");
INSERT INTO product_warehouse VALUES("11","6","","","","1","1","1111.99","2024-01-19 13:50:04","2025-02-18 15:34:33");
INSERT INTO product_warehouse VALUES("12","13","","","","1","10","349","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_warehouse VALUES("13","10","","","","1","8","1250","2024-01-19 13:50:04","2025-02-18 16:22:22");
INSERT INTO product_warehouse VALUES("14","21","","","","1","10","599","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_warehouse VALUES("15","8","","","","1","8","1300","2024-01-19 13:50:04","2024-05-19 08:30:55");
INSERT INTO product_warehouse VALUES("16","12","","","","1","8","1250","2024-01-19 13:50:04","2025-02-15 23:38:29");
INSERT INTO product_warehouse VALUES("17","29","","","","1","0","3.19","2024-01-19 13:50:04","2024-11-26 16:36:03");
INSERT INTO product_warehouse VALUES("18","26","","","","1","10","3.99","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_warehouse VALUES("19","9","","","","1","0","559","2024-01-19 13:50:04","2025-02-18 15:02:53");
INSERT INTO product_warehouse VALUES("20","11","","","","1","110","1750","2024-01-19 13:50:04","2025-02-14 18:05:49");
INSERT INTO product_warehouse VALUES("21","1","","","","1","-2","1299.99","2024-01-19 13:53:21","2025-02-14 12:10:45");
INSERT INTO product_warehouse VALUES("22","18","","","","1","10","599","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("23","25","","","null","1","11","157.99","2024-01-19 13:53:21","2025-02-15 23:57:19");
INSERT INTO product_warehouse VALUES("24","28","","","","1","10","3.3","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("25","14","","","","1","9","499","2024-01-19 13:53:21","2024-01-19 14:40:16");
INSERT INTO product_warehouse VALUES("26","24","","","","1","10","379","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("27","4","","","","1","4","1050","2024-01-19 13:53:21","2025-02-18 10:06:46");
INSERT INTO product_warehouse VALUES("28","5","","","","1","-1","1150.99","2024-01-19 13:53:21","2025-02-18 16:21:41");
INSERT INTO product_warehouse VALUES("29","22","","","","1","10","399","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("30","15","","","","1","10","547","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("31","1","","","","2","8","1299.99","2024-01-19 14:26:48","2025-02-18 15:59:15");
INSERT INTO product_warehouse VALUES("32","18","","","","2","7","599","2024-01-19 14:26:48","2024-08-11 05:37:38");
INSERT INTO product_warehouse VALUES("33","25","","","","2","9","157.99","2024-01-19 14:26:48","2025-02-15 23:57:19");
INSERT INTO product_warehouse VALUES("34","28","","","","2","10","3.3","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_warehouse VALUES("35","14","","","","2","10","499","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("36","24","","","","2","10","379","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("37","4","","","","2","9","1050","2024-01-19 14:26:49","2024-01-19 14:44:41");
INSERT INTO product_warehouse VALUES("38","5","","","","2","10","1150.99","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("39","22","","","","2","10","399","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("40","15","","","","2","10","547","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("41","23","","","null","2","11","577","2024-01-19 14:28:26","2025-02-13 23:26:33");
INSERT INTO product_warehouse VALUES("42","27","","","","2","7","1.29","2024-01-19 14:28:26","2024-01-19 14:48:33");
INSERT INTO product_warehouse VALUES("43","20","","","","2","11","499","2024-01-19 14:28:26","2024-05-28 09:07:14");
INSERT INTO product_warehouse VALUES("44","17","","","","2","10","499","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_warehouse VALUES("45","16","","","","2","9","109","2024-01-19 14:28:26","2024-01-19 14:44:41");
INSERT INTO product_warehouse VALUES("46","30","","","","2","10","200","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_warehouse VALUES("47","19","","","","2","10","1059","2024-01-19 14:28:26","2024-05-28 08:46:50");
INSERT INTO product_warehouse VALUES("48","3","","","","2","8","350","2024-01-19 14:28:26","2024-01-19 14:44:41");
INSERT INTO product_warehouse VALUES("49","7","","","","2","10","","2024-01-19 14:28:26","2024-05-23 07:38:12");
INSERT INTO product_warehouse VALUES("50","2","","","","2","11","","2024-01-19 14:28:26","2025-02-14 19:12:58");
INSERT INTO product_warehouse VALUES("51","6","","","","2","10","1111.99","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("52","13","","","","2","10","349","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("53","10","","","","2","10","1250","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("54","21","","","","2","10","599","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("55","8","","","","2","10","1300","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("56","12","","","","2","10","1250","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("57","29","","","","2","10","3.19","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("58","26","","","","2","10","3.99","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("59","9","","","","2","9","559","2024-01-19 14:28:35","2024-01-19 14:44:41");
INSERT INTO product_warehouse VALUES("60","11","","","","2","10","1750","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("61","32","","","","1","0","","2024-04-29 12:29:17","2024-04-29 12:29:17");
INSERT INTO product_warehouse VALUES("62","32","","","","2","0","","2024-04-29 12:29:17","2024-04-29 12:29:17");
INSERT INTO product_warehouse VALUES("63","33","","","1001,1002,1004,1005","1","4","","2024-07-18 07:39:33","2024-07-18 07:59:13");
INSERT INTO product_warehouse VALUES("64","33","","","2002,2003,2004,2005,","2","4","","2024-07-18 07:39:33","2024-07-18 08:01:45");
INSERT INTO product_warehouse VALUES("65","35","","","","1","10","130","2025-02-14 18:02:36","2025-02-14 19:09:14");
INSERT INTO product_warehouse VALUES("66","35","","","","2","0","123","2025-02-14 18:02:36","2025-02-14 18:02:36");
INSERT INTO product_warehouse VALUES("67","34","","","","1","0","123","2025-02-14 18:07:22","2025-02-14 18:07:22");
INSERT INTO product_warehouse VALUES("68","34","","","","2","0","130","2025-02-14 18:07:22","2025-02-14 18:07:22");
INSERT INTO product_warehouse VALUES("69","39","","","","3","6","120","2025-02-14 18:09:52","2025-02-17 19:10:58");
INSERT INTO product_warehouse VALUES("70","30","","","null","3","5","","2025-02-14 19:17:22","2025-02-17 19:10:58");



CREATE TABLE `productions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `status` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `barcode_symbology` varchar(191) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `wholesale_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `daily_sale_objective` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) DEFAULT NULL,
  `starting_date` varchar(200) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `is_embeded` tinyint(1) DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) DEFAULT NULL,
  `variant_list` varchar(191) DEFAULT NULL,
  `qty_list` varchar(191) DEFAULT NULL,
  `price_list` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `variant_option` text DEFAULT NULL,
  `variant_value` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_sync_disable` tinyint(4) DEFAULT NULL,
  `woocommerce_product_id` int(11) DEFAULT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("1","Zenbook 14 OLED (UX3402)ï½œLaptops For Home â€“ ASUS","59028109","standard","C128","2","6","1","1","1","1099.99","1299.99","","6","","","1","1050.99","2024-01-08","","1","2","202401081146401.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 05:46:42","2025-02-18 15:59:15");
INSERT INTO products VALUES("2","2021 Apple 12.9-inch iPad Pro Wi-Fi 512GB","2035892312345","standard","C128","3","6","1","1","1","1000","1250","1230","10","","","1","1200.00","2024-01-08","","1","2","202401081246041.png,202401081246062.png,202401081246063.png,202401081246064.png","","0","","","0","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 06:46:07","2025-02-18 16:01:57");
INSERT INTO products VALUES("3","Apple iPhone 11 (4GB-64GB) Black","49251814","standard","C128","1","1","1","1","1","300","350","","12","","","1","","2024-01-08","","1","2","202401081255081.png,202401081255112.png,202401081255123.png,202401081255134.png,202401081255135.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 06:55:14","2025-02-15 23:34:19");
INSERT INTO products VALUES("4","Samsung Galaxy Chromebook Go, 14â€³ HD LED, Intel Celeron N4500","28090345","standard","C128","2","6","1","1","1","900","1050","","13","","","","","","","1","2","202401080121221.png,202401080121242.png,202401080121243.png,202401080121254.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 07:21:25","2025-02-18 10:06:46");
INSERT INTO products VALUES("5","SAMSUNG Galaxy Book Pro 15.6 Laptop â€“ Intel Core i5","67015642","standard","C128","2","6","1","1","1","950.99","1150.99","","9","","","","","","","1","2","202401080124321.png,202401080124342.png,202401080124353.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 07:24:36","2025-02-18 16:21:41");
INSERT INTO products VALUES("6","Microsoft â€“ Surface Laptop 4 13.5â€ Touch-Screen â€“ AMD Ryzen 5","24005329","standard","C128","3","6","1","1","1","999.99","1111.99","","11","","","","","","","","1","202401080127451.png,202401080127462.png,202401080127473.jpg,202401080127484.jpg,202401080127485.jpg","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 07:27:49","2025-02-18 15:34:33");
INSERT INTO products VALUES("7","Acer Chromebook 315, 15.6 HD â€“ Intel Celeron N4000","30798200","standard","C128","4","6","1","1","1","899.99","999.99","950","17","","","","","","","1","2","202401080130241.png,202401080130242.png,202401080130253.png","","0","","","0","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 07:30:25","2025-02-15 23:29:46");
INSERT INTO products VALUES("8","HP Victus 16-e00244AX GTX 1650 Gaming Laptop 16.1â€ FHD 144Hz","81526930","standard","C128","4","6","1","1","1","1199","1300","","18","","","","","","","1","2","202401080134061.png,202401080134072.png,202401080134073.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 07:34:08","2024-05-19 08:30:55");
INSERT INTO products VALUES("9","Epson Inkjet WorkForce Pro WF-3820DWF","20142029","standard","C128","2","6","1","1","1","399","559","","9","","","","","","","","1","202401080141091.png,202401080141102.png,202401080141103.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 07:41:11","2025-02-18 15:02:53");
INSERT INTO products VALUES("10","iPhone 14 Pro 256GB Gold","29733132","standard","C128","1","1","1","1","1","990","1250","","18","","","","","","","","1","202401080143591.png,202401080144002.png,202401080144013.png,202401080144014.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-08 07:44:02","2025-02-18 16:22:22");
INSERT INTO products VALUES("11","Electrolux EW6F449ST PerfectCare 9 Kg Washing Machine","23279148","standard","C128","5","20","1","1","1","1500","1750","","120","","","1","1650","2024-01-13","","1","2","202401130329581.png,202401130330002.png,202401130330013.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-13 09:30:02","2025-02-14 18:05:49");
INSERT INTO products VALUES("12","GORENJE Waschmaschine WHP74EPS Waschmaschine","43879312","standard","C128","2","20","1","1","1","999","1250","","18","","","","","","","1","2","202401130338301.png,202401130338322.png,202401130338323.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-13 09:38:33","2025-02-15 23:38:29");
INSERT INTO products VALUES("13","iRobot Roomba E6 (6199) Robot Vacuum","56858702","standard","C128","4","22","1","1","1","250","349","","20","","","","","","","1","2","202401130343221.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-13 09:43:24","2024-01-19 14:28:35");
INSERT INTO products VALUES("14","Sony Bravia 55X90J 4K Ultra HD 55â€³ 140 Screen Google Smart LED TV","16530612","standard","C128","3","23","1","1","1","350","499","","19","","","","","","","1","2","","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-13 09:53:32","2024-01-19 14:40:16");
INSERT INTO products VALUES("15","Samsung 43AU7000 4K Ultra HD 43â€³ 109 Screen Smart LED TV","73189124","standard","C128","2","23","1","1","1","499","547","","20","","","","","","","","1","202401130357131.png,202401130357152.png,202401130357153.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-13 09:57:16","2024-01-19 14:26:49");
INSERT INTO products VALUES("16","Apple TV HD 32GB (2nd Generation)","71493353","standard","C128","1","23","1","1","1","79","109","","17","","","","","","","","1","202401130401491.png,202401130401522.png,202401130401533.png,202401130401544.png","","","","","","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-13 10:01:55","2025-02-17 19:31:40");
INSERT INTO products VALUES("17","Apple Watch SE GPS + Cellular 40mm Space Gray","92178104","standard","C128","1","12","1","1","1","349","499","","20","","","","","","","","1","202401130410191.png,202401130410222.jpg,202401130410233.jpg","","0","","","0","","1","","","","","<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>","","","1","","","","2024-01-13 10:10:24","2024-04-28 06:05:43");
INSERT INTO products VALUES("18","Xbox One Wireless Controller Black Color","93060790","standard","C128","","1","1","1","1","459","599","","17","","","","","","","1","2","202401150808421.jpg,202401150808432.jpg","","","","","","","1","","","","","<div class=@item-description@>
<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>
</div>","","","1","","","","2024-01-15 14:08:43","2024-08-11 05:37:38");
INSERT INTO products VALUES("19","Apple iPhone XS Max-64GB -white","22061536","standard","C128","1","1","1","1","1","899","1059","","19","","","","","","","1","2","202401150814131.jpg","","","","","","","1","","","","","<div class=@item-description@>
<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>
</div>","","","1","","","","2024-01-15 14:14:14","2024-04-28 06:15:44");
INSERT INTO products VALUES("20","Apple Watch Series 8 GPS 45mm Midnight Aluminum Case","31429623","standard","C128","1","12","1","1","1","399","499","","7","","","","","","","","1","202401151009571.png,202401151009582.png,202401151009583.jpg","","","","","","","1","","","","","<div class=@item-description@>
<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>
</div>","","","1","","","","2024-01-15 16:09:59","2024-11-28 15:12:48");
INSERT INTO products VALUES("21","Huawei Watch GT 2 Sport Stainless Steel 46mm","02456392","standard","C128","3","12","1","1","1","369","599","","20","","","1","499","2024-01-15","","","1","202401151013061.png,202401151013062.png,202401151013073.png","","","","","","","1","","","","","<div class=@item-description@>
<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>
</div>","","","1","","","","2024-01-15 16:13:07","2024-01-19 14:28:35");
INSERT INTO products VALUES("22","Samsung Galaxy Active 2 R835U Smartwatch 40mm","10203743","standard","C128","2","12","1","1","1","275","399","","20","","","","","","","","1","202401151019301.png,202401151019302.png,202401151019313.png","","","","","","","1","","","","","<div class=@item-description@>
<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>
</div>","","","1","","","","2024-01-15 16:19:31","2024-01-19 14:26:49");
INSERT INTO products VALUES("23","Canon EOS R10 RF-S 18-45 IS STM","13929367","standard","C128","17","1","1","1","1","439","577","","16","","","","","","","","1","202401151024231.png,202401151024232.png,202401151024233.png","","","","","","","1","","","","","<div class=@item-description@>
<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>
</div>","","","1","","","","2024-01-15 16:24:24","2024-08-11 05:25:42");
INSERT INTO products VALUES("24","Sony A7 III Mirrorless Camera Body Only","99421096","standard","C128","2","1","1","1","1","299","379","","20","","","","","","","1","2","202401151026581.png,202401151026592.png","","","","","","","1","","","","","<div class=@item-description@>
<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>
</div>","","","1","","","","2024-01-15 16:27:00","2024-01-19 14:26:49");
INSERT INTO products VALUES("25","WOLFANG GA420 Action Camera 4K 60FPS 24MP","99218280","standard","C128","4","1","1","1","1","130","157.99","","20","","","","","","","","1","202401151029321.png,202401151029332.jpg,202401151029343.jpg","","","","","","","1","","","","","<div class=@item-description@>
<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>
<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>
</div>","","","1","","","","2024-01-15 16:29:34","2024-01-19 14:26:48");
INSERT INTO products VALUES("26","Fresh Organic Navel Orange","33887520","standard","C128","","29","4","4","4","2.99","3.99","","20","","","","","","","","1","202401151115301.png","","","","","","","1","","","","","<p>Fresh Organic Navel Orange</p>","","","1","","","","2024-01-15 17:15:32","2024-01-19 14:28:35");
INSERT INTO products VALUES("27","Banana (pack of 12)","27583341","standard","C128","","29","1","1","1","0.89","1.29","","17","","","","","","","","1","202401151118271.png","","","","","","","1","","","","","","","","1","","","","2024-01-15 17:18:28","2024-07-11 06:12:35");
INSERT INTO products VALUES("28","Water Melon ~ 3KG","19186147","standard","C128","","29","1","1","1","2.39","3.3","","20","","","","","","","","1","202401151142511.png","","","","","","","1","","","","","<p>Water Melon ~ 3KG</p>","","","1","","","","2024-01-15 17:42:53","2024-01-19 14:26:48");
INSERT INTO products VALUES("29","Gala Original Apple - 1KG","80912386","standard","C128","","29","1","1","1","2.39","3.19","","10","","","","","","","","1","202401151144271.png","","","","","","","1","","","","","<p>Gala Original Apple - 1KG</p>","","","1","","","","2024-01-15 17:44:27","2024-11-26 16:36:03");
INSERT INTO products VALUES("30","Apple Smart Watch","12010761","standard","C128","1","12","1","1","1","100","200","","15","","","","","","","1","1","202401190429592.jpg","","0","","","0","","0","","","","","","","","1","","","","2024-01-19 09:43:44","2025-02-17 19:10:58");
INSERT INTO products VALUES("31","Alpha Cheese","33357221","standard","C128","","34","1","1","1","120","200","","0","","","","","","","","1","zummXD2dvAtI.png","","","","1","","","","","","","","","","","1","","","","2024-04-14 06:15:06","2024-04-14 06:15:06");
INSERT INTO products VALUES("32","green spice","61226895","standard","C128","19","40","1","1","1","10","20","","0","","","","","","","3","1","zummXD2dvAtI.png","","","","","","","","","","","","","","","1","","","","2024-04-29 12:29:17","2024-04-29 12:29:17");
INSERT INTO products VALUES("33","Samsung Adapter","99767039","standard","C128","2","6","1","1","1","100","250","","8","","","","","","","","1","zummXD2dvAtI.png","","","","","","1","","","","","","","","","1","","","","2024-07-18 07:39:33","2024-07-18 08:01:45");
INSERT INTO products VALUES("34","BEEF","28953213","standard","C128","20","43","1","1","1","1200","1500","","0","5","","","","","","","1","202502140536341.jpg","","1","","","1","","1","","","","","","","","1","","","","2025-02-14 17:36:34","2025-02-14 18:07:22");
INSERT INTO products VALUES("35","BEEF STEW","48101092","standard","C128","20","43","1","1","1","1500","1200","","10","5","","","","","","","1","202502140554181.jpg","","0","","","1","","1","","","","","","","","1","","","","2025-02-14 17:54:18","2025-02-14 19:09:14");
INSERT INTO products VALUES("36","CHAPO","96826041","standard","C128","20","43","1","1","1","1500","1300","","0","5","5","1","1200","2025-02-14","2025-02-21","","1","202502140555521.jpg","","","","","","","1","","","","","","","","1","","","","2025-02-14 17:55:52","2025-02-14 17:55:52");
INSERT INTO products VALUES("37","MUKIMO","98031028","standard","C128","22","43","1","1","1","450","500","","0","","","","","","","","1","202502140557071.jpg","","","","","","","1","","","","","","","","1","","","","2025-02-14 17:57:07","2025-02-14 17:57:07");
INSERT INTO products VALUES("38","MURSIK","11629700","standard","C128","22","43","1","1","1","300","400","","0","5","3","","","","","","1","202502140558151.jpg","","","","","","","","","","","","","","","1","","","","2025-02-14 17:58:15","2025-02-14 17:58:15");
INSERT INTO products VALUES("39","BEEF SOUP","31639174","standard","C128","","43","1","1","1","1200","1500","","6","5","","","","","","","1","202502140609521.jpg","","","","","1","","","","","","","","","","1","","","","2025-02-14 18:09:52","2025-02-17 19:10:58");



CREATE TABLE `purchase_product_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("1","pr-20240119-074604","1","1","1","1","1","10","100","0","2917.26","44758.8","0","0","0","0","44758.8","0","1","1","","","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO purchases VALUES("2","pr-20240119-075004","1","1","1","1","1","10","100","0","3589.09","67113.7","0","0","0","0","67113.7","0","1","1","","","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO purchases VALUES("3","pr-20240119-075321","1","1","","1","1","10","100","0","3689.98","49653.7","0","0","0","0","49653.7","0","1","1","","","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO purchases VALUES("4","pr-20240119-082648","1","2","1","","","10","101","0","3789.98","50753.69","0","0","0","0","50753.69","0","1","1","","","2024-01-18 18:00:00","2024-01-19 14:26:48");
INSERT INTO purchases VALUES("5","pr-20240119-082826","1","2","1","","","10","100","0","2917.26","44758.8","0","0","0","0","44758.8","0","1","1","","","2024-01-18 18:00:00","2024-01-19 14:28:26");
INSERT INTO purchases VALUES("6","pr-20240119-082835","1","2","1","","","10","100","0","3589.09","67113.7","0","0","0","0","67113.7","0","1","1","","","2024-01-18 18:00:00","2024-01-19 14:28:35");
INSERT INTO purchases VALUES("7","pr-20240119-085202","1","1","1","","","2","2","0","0","748","0","0","0","0","748","0","1","1","","","2024-01-19 14:52:02","2024-01-19 14:52:02");
INSERT INTO purchases VALUES("8","pr-20240204-011347","1","1","","1","1","1","6","0","480","5280","0","0","0","0","5280","0","1","1","","","2024-02-03 18:00:00","2024-06-20 05:08:26");
INSERT INTO purchases VALUES("9","pr-20240718-014145","1","1","1","1","1","1","5","0","0","500","0","0","0","0","500","0","1","1","","","2024-07-18 07:41:45","2024-07-18 07:41:45");
INSERT INTO purchases VALUES("10","pr-20240718-014928","1","2","2","","","1","5","0","0","500","0","0","0","0","500","0","1","1","","","2024-07-17 18:00:00","2024-07-18 07:51:35");
INSERT INTO purchases VALUES("11","121","47","1","1","4","1","1","1","0","100","1099.99","0","0","0","100","1199.99","0","1","1","","","2025-02-14 00:00:00","2025-02-14 12:10:45");
INSERT INTO purchases VALUES("12","REF10","47","1","1","4","1","1","100","0","9999.91","109999","10","10999.9","0","120","121118.9","0","4","1","","","2025-02-17 00:00:00","2025-02-17 19:49:32");



CREATE TABLE `quotations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO quotations VALUES("1","qr-20240119-085132","1","1","1","1","1","2","2","0","0","998","0","0","","","998","1","","","2024-01-19 14:51:32","2024-01-19 14:51:32");
INSERT INTO quotations VALUES("2","qr-20240825-060117","1","1","1","2","1","1","3","0","0","1497","0","0","","","1497","1","","","2024-08-25 23:01:17","2024-08-25 23:01:17");



CREATE TABLE `return_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO returns VALUES("1","rr-20240324-010823","1","8","2","2","1","1","1","1","1","1","1","0","118.18","1299.99","0","0","1299.99","","","","2024-03-24 07:08:23","2024-03-24 07:08:23");
INSERT INTO returns VALUES("2","rr-20240429-063038","1","14","2","2","1","1","1","1","1","2","2","0","136.46","1500.99","0","0","1500.99","","","","2024-04-29 12:30:38","2024-04-29 12:30:38");
INSERT INTO returns VALUES("3","rr-20240626-010142","1","33","2","2","1","1","1","1","1","1","1","0","118.18","1299.99","0","0","1299.99","","","","2024-06-26 07:01:42","2024-06-26 07:01:42");



CREATE TABLE `reward_point_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO reward_point_settings VALUES("1","300","1000","1","Year","1","2021-06-08 15:40:15","2025-02-15 23:51:13");



CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("4","1");
INSERT INTO role_has_permissions VALUES("4","2");
INSERT INTO role_has_permissions VALUES("4","4");
INSERT INTO role_has_permissions VALUES("4","6");
INSERT INTO role_has_permissions VALUES("5","1");
INSERT INTO role_has_permissions VALUES("5","2");
INSERT INTO role_has_permissions VALUES("6","1");
INSERT INTO role_has_permissions VALUES("6","2");
INSERT INTO role_has_permissions VALUES("6","4");
INSERT INTO role_has_permissions VALUES("6","6");
INSERT INTO role_has_permissions VALUES("7","1");
INSERT INTO role_has_permissions VALUES("7","2");
INSERT INTO role_has_permissions VALUES("7","4");
INSERT INTO role_has_permissions VALUES("7","6");
INSERT INTO role_has_permissions VALUES("8","1");
INSERT INTO role_has_permissions VALUES("8","2");
INSERT INTO role_has_permissions VALUES("8","4");
INSERT INTO role_has_permissions VALUES("9","1");
INSERT INTO role_has_permissions VALUES("9","2");
INSERT INTO role_has_permissions VALUES("9","4");
INSERT INTO role_has_permissions VALUES("10","1");
INSERT INTO role_has_permissions VALUES("10","2");
INSERT INTO role_has_permissions VALUES("11","1");
INSERT INTO role_has_permissions VALUES("11","2");
INSERT INTO role_has_permissions VALUES("12","1");
INSERT INTO role_has_permissions VALUES("12","2");
INSERT INTO role_has_permissions VALUES("12","4");
INSERT INTO role_has_permissions VALUES("12","6");
INSERT INTO role_has_permissions VALUES("13","1");
INSERT INTO role_has_permissions VALUES("13","2");
INSERT INTO role_has_permissions VALUES("13","4");
INSERT INTO role_has_permissions VALUES("13","6");
INSERT INTO role_has_permissions VALUES("14","1");
INSERT INTO role_has_permissions VALUES("14","2");
INSERT INTO role_has_permissions VALUES("14","6");
INSERT INTO role_has_permissions VALUES("15","1");
INSERT INTO role_has_permissions VALUES("15","2");
INSERT INTO role_has_permissions VALUES("16","1");
INSERT INTO role_has_permissions VALUES("16","2");
INSERT INTO role_has_permissions VALUES("16","6");
INSERT INTO role_has_permissions VALUES("17","1");
INSERT INTO role_has_permissions VALUES("17","2");
INSERT INTO role_has_permissions VALUES("17","6");
INSERT INTO role_has_permissions VALUES("18","1");
INSERT INTO role_has_permissions VALUES("18","2");
INSERT INTO role_has_permissions VALUES("18","6");
INSERT INTO role_has_permissions VALUES("19","1");
INSERT INTO role_has_permissions VALUES("19","2");
INSERT INTO role_has_permissions VALUES("20","1");
INSERT INTO role_has_permissions VALUES("20","2");
INSERT INTO role_has_permissions VALUES("20","4");
INSERT INTO role_has_permissions VALUES("21","1");
INSERT INTO role_has_permissions VALUES("21","2");
INSERT INTO role_has_permissions VALUES("21","4");
INSERT INTO role_has_permissions VALUES("22","1");
INSERT INTO role_has_permissions VALUES("22","2");
INSERT INTO role_has_permissions VALUES("22","4");
INSERT INTO role_has_permissions VALUES("23","1");
INSERT INTO role_has_permissions VALUES("23","2");
INSERT INTO role_has_permissions VALUES("24","1");
INSERT INTO role_has_permissions VALUES("24","2");
INSERT INTO role_has_permissions VALUES("24","4");
INSERT INTO role_has_permissions VALUES("24","6");
INSERT INTO role_has_permissions VALUES("25","1");
INSERT INTO role_has_permissions VALUES("25","2");
INSERT INTO role_has_permissions VALUES("25","4");
INSERT INTO role_has_permissions VALUES("25","6");
INSERT INTO role_has_permissions VALUES("26","1");
INSERT INTO role_has_permissions VALUES("26","2");
INSERT INTO role_has_permissions VALUES("26","6");
INSERT INTO role_has_permissions VALUES("27","1");
INSERT INTO role_has_permissions VALUES("27","2");
INSERT INTO role_has_permissions VALUES("28","1");
INSERT INTO role_has_permissions VALUES("28","2");
INSERT INTO role_has_permissions VALUES("28","4");
INSERT INTO role_has_permissions VALUES("28","6");
INSERT INTO role_has_permissions VALUES("29","1");
INSERT INTO role_has_permissions VALUES("29","2");
INSERT INTO role_has_permissions VALUES("29","4");
INSERT INTO role_has_permissions VALUES("29","6");
INSERT INTO role_has_permissions VALUES("30","1");
INSERT INTO role_has_permissions VALUES("30","2");
INSERT INTO role_has_permissions VALUES("30","6");
INSERT INTO role_has_permissions VALUES("31","1");
INSERT INTO role_has_permissions VALUES("31","2");
INSERT INTO role_has_permissions VALUES("32","1");
INSERT INTO role_has_permissions VALUES("32","2");
INSERT INTO role_has_permissions VALUES("33","1");
INSERT INTO role_has_permissions VALUES("33","2");
INSERT INTO role_has_permissions VALUES("34","1");
INSERT INTO role_has_permissions VALUES("34","2");
INSERT INTO role_has_permissions VALUES("35","1");
INSERT INTO role_has_permissions VALUES("35","2");
INSERT INTO role_has_permissions VALUES("36","1");
INSERT INTO role_has_permissions VALUES("36","2");
INSERT INTO role_has_permissions VALUES("37","1");
INSERT INTO role_has_permissions VALUES("37","2");
INSERT INTO role_has_permissions VALUES("38","1");
INSERT INTO role_has_permissions VALUES("38","2");
INSERT INTO role_has_permissions VALUES("39","1");
INSERT INTO role_has_permissions VALUES("39","2");
INSERT INTO role_has_permissions VALUES("39","6");
INSERT INTO role_has_permissions VALUES("40","1");
INSERT INTO role_has_permissions VALUES("40","2");
INSERT INTO role_has_permissions VALUES("41","1");
INSERT INTO role_has_permissions VALUES("41","2");
INSERT INTO role_has_permissions VALUES("42","1");
INSERT INTO role_has_permissions VALUES("42","2");
INSERT INTO role_has_permissions VALUES("43","1");
INSERT INTO role_has_permissions VALUES("43","2");
INSERT INTO role_has_permissions VALUES("44","1");
INSERT INTO role_has_permissions VALUES("44","2");
INSERT INTO role_has_permissions VALUES("45","1");
INSERT INTO role_has_permissions VALUES("45","2");
INSERT INTO role_has_permissions VALUES("46","1");
INSERT INTO role_has_permissions VALUES("46","2");
INSERT INTO role_has_permissions VALUES("46","6");
INSERT INTO role_has_permissions VALUES("47","1");
INSERT INTO role_has_permissions VALUES("47","2");
INSERT INTO role_has_permissions VALUES("47","6");
INSERT INTO role_has_permissions VALUES("48","1");
INSERT INTO role_has_permissions VALUES("48","2");
INSERT INTO role_has_permissions VALUES("49","1");
INSERT INTO role_has_permissions VALUES("49","2");
INSERT INTO role_has_permissions VALUES("49","6");
INSERT INTO role_has_permissions VALUES("50","1");
INSERT INTO role_has_permissions VALUES("50","2");
INSERT INTO role_has_permissions VALUES("51","1");
INSERT INTO role_has_permissions VALUES("51","2");
INSERT INTO role_has_permissions VALUES("52","1");
INSERT INTO role_has_permissions VALUES("52","2");
INSERT INTO role_has_permissions VALUES("53","1");
INSERT INTO role_has_permissions VALUES("53","2");
INSERT INTO role_has_permissions VALUES("53","6");
INSERT INTO role_has_permissions VALUES("54","1");
INSERT INTO role_has_permissions VALUES("54","2");
INSERT INTO role_has_permissions VALUES("55","1");
INSERT INTO role_has_permissions VALUES("55","2");
INSERT INTO role_has_permissions VALUES("55","4");
INSERT INTO role_has_permissions VALUES("56","1");
INSERT INTO role_has_permissions VALUES("56","2");
INSERT INTO role_has_permissions VALUES("56","4");
INSERT INTO role_has_permissions VALUES("57","1");
INSERT INTO role_has_permissions VALUES("57","2");
INSERT INTO role_has_permissions VALUES("57","4");
INSERT INTO role_has_permissions VALUES("58","1");
INSERT INTO role_has_permissions VALUES("58","2");
INSERT INTO role_has_permissions VALUES("59","1");
INSERT INTO role_has_permissions VALUES("59","2");
INSERT INTO role_has_permissions VALUES("60","1");
INSERT INTO role_has_permissions VALUES("60","2");
INSERT INTO role_has_permissions VALUES("61","1");
INSERT INTO role_has_permissions VALUES("61","2");
INSERT INTO role_has_permissions VALUES("62","1");
INSERT INTO role_has_permissions VALUES("62","2");
INSERT INTO role_has_permissions VALUES("63","1");
INSERT INTO role_has_permissions VALUES("63","2");
INSERT INTO role_has_permissions VALUES("63","4");
INSERT INTO role_has_permissions VALUES("63","6");
INSERT INTO role_has_permissions VALUES("64","1");
INSERT INTO role_has_permissions VALUES("64","2");
INSERT INTO role_has_permissions VALUES("64","4");
INSERT INTO role_has_permissions VALUES("64","6");
INSERT INTO role_has_permissions VALUES("65","1");
INSERT INTO role_has_permissions VALUES("65","2");
INSERT INTO role_has_permissions VALUES("65","6");
INSERT INTO role_has_permissions VALUES("66","1");
INSERT INTO role_has_permissions VALUES("66","2");
INSERT INTO role_has_permissions VALUES("67","1");
INSERT INTO role_has_permissions VALUES("67","2");
INSERT INTO role_has_permissions VALUES("68","1");
INSERT INTO role_has_permissions VALUES("68","2");
INSERT INTO role_has_permissions VALUES("69","1");
INSERT INTO role_has_permissions VALUES("69","2");
INSERT INTO role_has_permissions VALUES("70","1");
INSERT INTO role_has_permissions VALUES("70","2");
INSERT INTO role_has_permissions VALUES("71","1");
INSERT INTO role_has_permissions VALUES("71","2");
INSERT INTO role_has_permissions VALUES("72","1");
INSERT INTO role_has_permissions VALUES("72","2");
INSERT INTO role_has_permissions VALUES("73","1");
INSERT INTO role_has_permissions VALUES("73","2");
INSERT INTO role_has_permissions VALUES("74","1");
INSERT INTO role_has_permissions VALUES("74","2");
INSERT INTO role_has_permissions VALUES("75","1");
INSERT INTO role_has_permissions VALUES("75","2");
INSERT INTO role_has_permissions VALUES("76","1");
INSERT INTO role_has_permissions VALUES("76","2");
INSERT INTO role_has_permissions VALUES("77","1");
INSERT INTO role_has_permissions VALUES("77","2");
INSERT INTO role_has_permissions VALUES("78","1");
INSERT INTO role_has_permissions VALUES("78","2");
INSERT INTO role_has_permissions VALUES("79","1");
INSERT INTO role_has_permissions VALUES("79","2");
INSERT INTO role_has_permissions VALUES("80","1");
INSERT INTO role_has_permissions VALUES("80","2");
INSERT INTO role_has_permissions VALUES("81","1");
INSERT INTO role_has_permissions VALUES("81","2");
INSERT INTO role_has_permissions VALUES("82","1");
INSERT INTO role_has_permissions VALUES("82","2");
INSERT INTO role_has_permissions VALUES("83","1");
INSERT INTO role_has_permissions VALUES("83","2");
INSERT INTO role_has_permissions VALUES("84","1");
INSERT INTO role_has_permissions VALUES("84","2");
INSERT INTO role_has_permissions VALUES("85","1");
INSERT INTO role_has_permissions VALUES("85","2");
INSERT INTO role_has_permissions VALUES("86","1");
INSERT INTO role_has_permissions VALUES("86","2");
INSERT INTO role_has_permissions VALUES("87","1");
INSERT INTO role_has_permissions VALUES("87","2");
INSERT INTO role_has_permissions VALUES("88","1");
INSERT INTO role_has_permissions VALUES("88","2");
INSERT INTO role_has_permissions VALUES("89","1");
INSERT INTO role_has_permissions VALUES("89","2");
INSERT INTO role_has_permissions VALUES("89","4");
INSERT INTO role_has_permissions VALUES("90","1");
INSERT INTO role_has_permissions VALUES("90","2");
INSERT INTO role_has_permissions VALUES("91","1");
INSERT INTO role_has_permissions VALUES("91","2");
INSERT INTO role_has_permissions VALUES("92","1");
INSERT INTO role_has_permissions VALUES("92","2");
INSERT INTO role_has_permissions VALUES("93","1");
INSERT INTO role_has_permissions VALUES("93","2");
INSERT INTO role_has_permissions VALUES("94","1");
INSERT INTO role_has_permissions VALUES("94","2");
INSERT INTO role_has_permissions VALUES("95","1");
INSERT INTO role_has_permissions VALUES("95","2");
INSERT INTO role_has_permissions VALUES("96","1");
INSERT INTO role_has_permissions VALUES("96","2");
INSERT INTO role_has_permissions VALUES("97","1");
INSERT INTO role_has_permissions VALUES("97","2");
INSERT INTO role_has_permissions VALUES("98","1");
INSERT INTO role_has_permissions VALUES("98","2");
INSERT INTO role_has_permissions VALUES("99","1");
INSERT INTO role_has_permissions VALUES("99","2");
INSERT INTO role_has_permissions VALUES("99","6");
INSERT INTO role_has_permissions VALUES("100","1");
INSERT INTO role_has_permissions VALUES("100","2");
INSERT INTO role_has_permissions VALUES("101","1");
INSERT INTO role_has_permissions VALUES("101","2");
INSERT INTO role_has_permissions VALUES("101","6");
INSERT INTO role_has_permissions VALUES("102","1");
INSERT INTO role_has_permissions VALUES("102","2");
INSERT INTO role_has_permissions VALUES("103","1");
INSERT INTO role_has_permissions VALUES("103","2");
INSERT INTO role_has_permissions VALUES("104","1");
INSERT INTO role_has_permissions VALUES("104","2");
INSERT INTO role_has_permissions VALUES("105","1");
INSERT INTO role_has_permissions VALUES("105","2");
INSERT INTO role_has_permissions VALUES("106","1");
INSERT INTO role_has_permissions VALUES("106","4");
INSERT INTO role_has_permissions VALUES("107","1");
INSERT INTO role_has_permissions VALUES("108","1");
INSERT INTO role_has_permissions VALUES("109","1");
INSERT INTO role_has_permissions VALUES("110","1");
INSERT INTO role_has_permissions VALUES("111","1");
INSERT INTO role_has_permissions VALUES("112","1");
INSERT INTO role_has_permissions VALUES("112","6");
INSERT INTO role_has_permissions VALUES("113","1");
INSERT INTO role_has_permissions VALUES("114","1");
INSERT INTO role_has_permissions VALUES("115","1");
INSERT INTO role_has_permissions VALUES("116","1");
INSERT INTO role_has_permissions VALUES("117","1");
INSERT INTO role_has_permissions VALUES("117","6");
INSERT INTO role_has_permissions VALUES("118","1");
INSERT INTO role_has_permissions VALUES("118","6");
INSERT INTO role_has_permissions VALUES("119","1");
INSERT INTO role_has_permissions VALUES("119","6");
INSERT INTO role_has_permissions VALUES("120","1");
INSERT INTO role_has_permissions VALUES("121","1");
INSERT INTO role_has_permissions VALUES("121","6");
INSERT INTO role_has_permissions VALUES("122","1");
INSERT INTO role_has_permissions VALUES("123","1");
INSERT INTO role_has_permissions VALUES("123","6");
INSERT INTO role_has_permissions VALUES("124","1");
INSERT INTO role_has_permissions VALUES("125","1");
INSERT INTO role_has_permissions VALUES("126","1");
INSERT INTO role_has_permissions VALUES("127","1");
INSERT INTO role_has_permissions VALUES("128","1");
INSERT INTO role_has_permissions VALUES("129","1");
INSERT INTO role_has_permissions VALUES("130","1");
INSERT INTO role_has_permissions VALUES("131","1");
INSERT INTO role_has_permissions VALUES("132","1");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `guard_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Admin","admin can access all data...","web","1","2018-06-01 23:46:44","2018-06-02 23:13:05");
INSERT INTO roles VALUES("2","Owner","Staff of shop","web","1","2018-10-22 02:38:13","2022-02-01 13:13:30");
INSERT INTO roles VALUES("4","staff","staff has specific acess...","web","1","2018-06-02 00:05:27","2022-02-01 13:13:04");
INSERT INTO roles VALUES("5","Customer","","web","1","2020-11-05 06:43:16","2020-11-15 00:24:15");
INSERT INTO roles VALUES("6","Cashier","","web","1","2025-02-14 15:54:36","2025-02-14 15:54:36");



CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `queue` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount_type` varchar(191) DEFAULT NULL,
  `order_discount_value` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `woocommerce_order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("1","posr-20240119-084016","1","","","","1","1","1","2","2","0","159.81","1758","1758","1","1","0","0","Flat","","0","","","0","1","4","","1758","","","","2024-01-19 14:40:16","2024-01-19 14:40:16");
INSERT INTO sales VALUES("2","posr-20240119-084441","1","","","","1","2","1","5","6","0","213.54","3017","3017","1","1","0","0","Flat","","0","","","0","1","4","","3017","","","","2024-01-19 14:44:41","2024-01-19 14:44:41");
INSERT INTO sales VALUES("3","sr-20240119-084833","1","1","","","2","2","1","3","5","0","54.45","1182","1182","1","1","0","0","Flat","","0","","","0","1","1","","","","","","2024-01-19 14:48:33","2024-01-19 14:48:33");
INSERT INTO sales VALUES("4","sr-20240119-085242","1","2","","","1","1","1","3","3","0","90.82","1997","1997","","","0","0","Flat","0","0","","","0","1","2","","","","","","2024-01-18 18:00:00","2024-01-19 14:53:31");
INSERT INTO sales VALUES("5","posr-20240210-122224","1","2","","","2","1","1","1","1","0","114.45","1259","1259","1","1","0","0","Flat","","0","","","0","1","4","","1259","","","","2024-02-10 06:22:24","2024-02-10 06:22:24");
INSERT INTO sales VALUES("6","posr-20240225-014951","1","2","","","2","1","1","1","1","0","118.18","1299.99","1299.99","1","1","0","0","Flat","","0","","","0","1","4","","1299.99","","","","2024-02-25 07:49:51","2024-02-25 07:49:51");
INSERT INTO sales VALUES("7","posr-20240225-015013","1","2","","","2","1","1","1","2","0","236.36","2599.98","2599.98","1","1","0","0","Flat","","0","","","0","1","4","","2599.98","","","","2024-02-25 07:50:13","2024-02-25 07:50:13");
INSERT INTO sales VALUES("8","posr-20240228-112744","1","2","","","2","1","1","2","2","0","232.63","2558.99","2558.99","1","1","0","0","Flat","","0","","","0","1","4","","2558.99","","","","2024-02-28 05:27:44","2024-02-28 05:27:44");
INSERT INTO sales VALUES("9","posr-20240421-110143","1","2","1","1","2","1","1","1","1","0","31.82","350","350","1","1","0","0","Flat","","0","","","0","1","4","","350","","","","2024-04-21 05:01:43","2024-04-21 05:01:43");
INSERT INTO sales VALUES("13","posr-20240428-121544","1","2","","","2","1","1","2","2","0","128.09","1409","1409","1","1","","0","","","0","","","0","1","4","","1409","","","","2024-04-28 06:15:44","2024-04-28 06:15:44");
INSERT INTO sales VALUES("14","posr-20240429-062956","1","2","","","2","1","1","4","4","0","345.55","3800.99","3800.99","1","1","0","0","Flat","","0","","","0","1","4","","3800.99","","","","2024-04-29 12:29:56","2024-04-29 12:29:56");
INSERT INTO sales VALUES("15","sr-20240505-111902","1","2","","","2","1","1","1","1","0","0","499","499","1","1","0","0","Flat","","0","","","0","1","2","","0","","","","2024-05-05 05:19:02","2024-05-05 05:20:14");
INSERT INTO sales VALUES("20","posr-20240505-052905","1","2","","","2","1","1","2","2","0","231.82","2549.99","2549.99","1","1","","0","","","0","","","0","1","4","","2549.99","","","","2024-05-05 11:29:05","2024-05-05 11:29:05");
INSERT INTO sales VALUES("22","posr-20240508-020851","1","2","","","2","1","1","2","2","0","122.73","1349.99","1349.99","1","1","","0","","","0","","","0","1","4","","1349.99","","","","2024-05-08 08:08:51","2024-05-08 08:08:51");
INSERT INTO sales VALUES("23","posr-20240519-022423","1","2","","","2","1","1","1","1","0","118.18","1299.99","1299.99","1","1","0","0","Flat","","0","","","0","1","4","","1299.99","","","","2024-05-19 08:24:23","2024-05-19 08:24:23");
INSERT INTO sales VALUES("24","posr-20240519-022530","1","2","","","2","1","1","1","1","0","118.18","1300","1300","1","1","0","0","Flat","","0","","","0","1","4","","1300","","","","2024-05-19 08:25:30","2024-05-19 08:25:30");
INSERT INTO sales VALUES("25","posr-20240519-023055","1","2","","","2","1","1","1","1","0","118.18","1300","1300","1","1","0","0","Flat","","0","","","0","1","4","","1300","","","","2024-05-19 08:30:55","2024-05-19 08:30:55");
INSERT INTO sales VALUES("28","posr-20240521-013249","1","2","","","2","1","1","1","1","0","95.45","1050","1050","1","1","0","0","Flat","","0","","","0","1","4","","1050","","","","2024-05-21 07:32:49","2024-05-21 07:32:49");
INSERT INTO sales VALUES("29","posr-20240603-122651","1","2","","","2","1","1","2","2","0","231.82","2549.99","2549.99","1","1","0","0","Flat","","0","","","0","1","4","","2549.99","","","","2024-06-03 06:26:51","2024-06-03 06:29:06");
INSERT INTO sales VALUES("30","posr-20240603-053015","1","2","","","2","1","1","2","2","0","209.09","2300","2300","1","1","0","0","Flat","","0","","","0","1","4","","2300","","","","2024-06-03 11:30:15","2024-06-03 11:30:15");
INSERT INTO sales VALUES("31","sr-20240603-053058","1","2","","","1","1","1","1","1","0","0","577","577","1","1","0","0","Flat","","0","","","0","1","1","","","","","","2024-06-03 11:30:58","2024-06-03 11:30:58");
INSERT INTO sales VALUES("32","posr-20240620-015456","1","2","","","2","1","1","1","1","0","118.18","1299.99","1299.99","1","1","0","0","Flat","","0","","","0","3","2","","","","","","2024-06-20 07:54:56","2024-06-20 07:54:56");
INSERT INTO sales VALUES("33","posr-20240626-010115","1","2","","","2","1","1","1","1","0","118.18","1299.99","1299.99","1","1","0","0","Flat","","0","","","0","4","4","","1299.99","","","","2024-06-26 07:01:15","2024-06-26 07:01:42");
INSERT INTO sales VALUES("36","sr-20240711-121041","1","2","","","1","1","1","1","1","0","0","577","577","1","1","0","0","Flat","","0","","","0","1","1","","","","","","2024-07-07 18:00:00","2024-07-11 06:10:41");
INSERT INTO sales VALUES("38","posr-20240718-113630","1","2","","","2","1","1","1","1","0","118.18","1299.99","1299.99","1","1","0","0","Flat","","0","","","0","1","4","","1299.99","","","","2024-07-18 05:36:30","2024-07-18 05:36:30");
INSERT INTO sales VALUES("39","posr-20240718-015913","1","2","","","2","1","1","1","1","0","0","250","250","1","1","0","0","Flat","","0","","","0","1","4","","250","","","","2024-07-18 07:59:13","2024-07-18 07:59:13");
INSERT INTO sales VALUES("40","posr-20240718-020145","1","1","","","2","2","1","1","1","0","0","250","250","1","1","0","0","Flat","","0","","","0","1","4","","250","","","","2024-07-18 08:01:45","2024-07-18 08:01:45");
INSERT INTO sales VALUES("42","sr-20240811-110629","1","2","","","2","1","1","1","1","0","0","577","577","1","1","0","0","Flat","","0","","","0","1","4","","577","","","","2024-08-11 05:06:29","2024-08-11 05:28:06");
INSERT INTO sales VALUES("43","sr-20240811-113722","1","1","","","2","2","1","1","1","0","54.45","599","599","1","1","0","0","Flat","","0","","","0","5","1","","","","","","2024-08-11 05:37:22","2024-08-11 05:37:38");
INSERT INTO sales VALUES("45","posr-20240811-114852","1","2","","","2","1","1","2","2","0","145.46","1600","1600","1","1","0","0","Flat","0","0","","","0","1","4","","1600","","","","2024-08-11 16:37:06","2024-11-26 16:37:07");
INSERT INTO sales VALUES("46","posr-20240825-062616","1","3","","","2","1","1","1","1","0","118.18","1299.99","1299.99","1","1","0","0","Flat","0","0","","","0","1","4","","1299.99","","","","2024-08-25 18:00:00","2024-11-26 16:35:18");
INSERT INTO sales VALUES("47","posr-20240825-062630","1","3","","","2","1","1","1","1","0","95.45","1050","1050","1","1","0","0","Flat","0","0","","","0","1","4","","1050","","","","2024-08-26 16:38:31","2024-11-26 16:38:31");
INSERT INTO sales VALUES("50","posr-20240825-062929","1","3","","","2","1","1","1","1","0","31.82","350","350","1","1","0","0","Flat","0","0","","","0","1","4","","350","","","","2024-08-26 16:20:15","2024-11-26 16:20:15");
INSERT INTO sales VALUES("51","sr-20241126-101723","1","3","","","2","1","1","1","10","0","0","31.9","31.9","1","1","0","0","Flat","0","0","","","0","1","4","","31.9","","","","2024-11-26 16:36:03","2024-11-26 16:36:04");
INSERT INTO sales VALUES("52","sr-20241126-104134","1","3","","","2","1","1","1","3","0","0","1497","1497","","","0","0","Flat","0","","","","0","1","1","","","","","","2024-11-26 16:41:34","2024-11-26 16:41:34");
INSERT INTO sales VALUES("53","posr-20241128-112140","1","3","","","2","1","1","1","1","0","118.18","1299.99","1299.99","1","1","0","0","Flat","","0","","0","0","1","4","","1299.99","","","","2024-11-28 05:21:40","2024-11-28 05:21:40");
INSERT INTO sales VALUES("54","sr-20241128-090420","1","3","","","2","1","1","1","3","0","0","1497","1497","","","0","0","Flat","0","","","","0","1","4","","1497","","","","2024-11-28 15:04:20","2024-11-28 15:04:20");
INSERT INTO sales VALUES("55","sr-20241128-090719","1","3","","","2","1","1","1","3","0","0","1497","1497","","","0","0","Flat","0","","","","0","1","4","","1497","","","","2024-11-28 15:07:19","2024-11-28 15:07:19");
INSERT INTO sales VALUES("56","sr-20241128-091248","1","3","","","2","1","1","1","3","0","0","1497","1497","","","0","0","Flat","0","","","","0","1","4","","1497","","","","2024-11-28 15:12:48","2024-11-28 15:12:48");
INSERT INTO sales VALUES("57","posr-20250213-044151","47","4","","","2","1","1","1","1","0","1299.99","14299.89","14299.89","4","11","0","0","Flat","","0","","0","0","1","2","","21299.89","","","","2025-02-13 16:41:51","2025-02-13 16:41:51");
INSERT INTO sales VALUES("58","posr-20250213-044506","47","4","","","2","1","1","1","1","0","1299.99","14299.89","14299.89","4","11","0","0","Flat","","0","","0","0","1","4","","14299.89","","","","2025-02-13 16:45:06","2025-02-13 16:45:06");
INSERT INTO sales VALUES("59","posr-20250213-044845","47","4","","","2","1","1","1","1","0","1299.99","14299.89","14299.89","4","11","0","0","Flat","","0","","0","0","1","2","","24299.89","","","","2025-02-13 16:48:45","2025-02-13 16:48:45");
INSERT INTO sales VALUES("60","posr-20250213-045520","47","4","","","2","1","1","1","1","0","1299.99","14299.89","14299.89","4","11","0","0","Flat","","0","","0","0","3","2","","0","","","","2025-02-13 16:55:20","2025-02-13 16:55:20");
INSERT INTO sales VALUES("61","posr-20250213-045526","47","4","","","2","1","1","1","1","0","1150.99","12660.89","12660.89","4","11","0","0","Flat","","0","","0","0","3","2","","0","","","","2025-02-13 16:55:26","2025-02-13 16:55:26");
INSERT INTO sales VALUES("62","posr-20250213-075412","47","4","","","2","1","1","1","1","0","1299.99","14299.89","14299.89","4","11","0","0","Flat","","0","","0","0","1","4","","14299.89","","","","2025-02-13 19:54:12","2025-02-13 19:54:12");
INSERT INTO sales VALUES("63","posr-20250214-101034","47","4","","","2","1","1","1","1","0","113.64","1250","1250","4","1","0","0","Flat","","0","","0","0","1","4","","1250","","","","2025-02-14 10:10:34","2025-02-14 10:10:34");
INSERT INTO sales VALUES("64","posr-20250214-071905","48","6","","","2","3","2","1","1","0","20","220","220","4","1","0","0","Flat","","0","","0","0","1","4","","220","","","","2025-02-14 19:19:05","2025-02-14 19:19:05");
INSERT INTO sales VALUES("65","8575rfhrv","47","4","","","1","1","2","1","1","0","113.64","1250","1260","4","12","0","0","Flat","","0","","","10","1","4","","1260","","","","2025-02-15 23:24:11","2025-02-15 23:24:11");
INSERT INTO sales VALUES("66","posr-20250215-112741","47","4","","","2","1","1","2","2","0","104.64","2400.99","2400.99","4","1","0","0","Flat","","0","","0","0","1","4","","2400.99","","","","2025-02-15 23:27:41","2025-02-15 23:27:41");
INSERT INTO sales VALUES("67","posr-20250215-112848","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-15 23:28:48","2025-02-15 23:28:48");
INSERT INTO sales VALUES("68","posr-20250215-112946","47","4","","","2","1","1","1","6","0","545.45","5999.94","5999.94","4","1","0","0","Flat","","0","","0","0","1","4","","5999.94","","","","2025-02-15 23:29:46","2025-02-15 23:29:46");
INSERT INTO sales VALUES("69","posr-20250215-113100","47","4","","","2","1","1","1","2","0","209.27","2301.98","2301.98","4","1","0","0","Flat","","0","","0","0","1","4","","2301.98","","","","2025-02-15 23:31:00","2025-02-15 23:31:00");
INSERT INTO sales VALUES("70","posr-20250215-113419","47","4","","","2","1","1","1","1","0","31.82","350","350","4","1","0","0","Flat","","0","","0","0","1","4","","350","","","","2025-02-15 23:34:19","2025-02-15 23:34:19");
INSERT INTO sales VALUES("71","Lamar","47","7","","","5","3","1","1","2","0","40.8","448.8","448.8","4","1","0","0","Flat","","0","","","0","1","4","","448.8","","","","2025-02-15 23:37:21","2025-02-15 23:37:21");
INSERT INTO sales VALUES("72","posr-20250215-113829","47","4","","","4","1","1","1","2","0","227.27","2500","2500","4","1","0","0","Flat","","0","","0","0","1","4","","2500","","","","2025-02-15 23:38:29","2025-02-15 23:38:29");
INSERT INTO sales VALUES("73","sr-20250217-071058","47","7","","","6","3","2","2","6","0","40.8","938.4","938.4","4","1","0","0","Flat","","0","","","0","1","1","","0","","","","2025-02-18 19:10:58","2025-02-17 19:10:58");
INSERT INTO sales VALUES("74","posr-20250217-072251","47","4","","","2","1","1","1","1","0","31.82","350","350","4","1","0","0","Flat","","0","","0","0","3","2","","0","","","","2025-02-17 19:22:51","2025-02-17 19:22:51");
INSERT INTO sales VALUES("75","posr-20250217-072621","47","4","","","5","1","1","1","1","0","95.45","1050","1050","4","1","0","0","Flat","","0","","0","0","1","4","","1050","","","","2025-02-17 19:26:21","2025-02-17 19:26:21");
INSERT INTO sales VALUES("76","posr-20250217-072908","47","8","","","6","2","2","1","1","0","120.54","1325.99","1325.99","4","1","0","0","Flat","","0","","0","0","1","4","","1325.99","","","","2025-02-17 19:29:08","2025-02-17 19:29:08");
INSERT INTO sales VALUES("77","posr-20250217-073140","47","4","","","2","1","1","1","2","0","0","218","218","4","1","0","0","Flat","","0","","0","0","1","4","","218","","","","2025-02-17 19:31:40","2025-02-17 19:31:40");
INSERT INTO sales VALUES("78","posr-20250218-100646","47","4","","","2","1","1","1","1","0","95.45","1050","1050","4","1","0","0","Flat","","0","","0","0","1","4","","1050","","","","2025-02-18 10:06:46","2025-02-18 10:06:46");
INSERT INTO sales VALUES("79","posr-20250218-101048","47","4","","","2","1","1","1","1","0","104.64","1150.99","1150.99","4","1","0","0","Flat","","0","","0","0","1","4","","1150.99","","","","2025-02-18 10:10:48","2025-02-18 10:10:48");
INSERT INTO sales VALUES("80","posr-20250218-101449","47","4","","","2","1","1","1","1","0","104.64","1150.99","1150.99","4","1","0","0","Flat","","0","","0","0","1","4","","1150.99","","","","2025-02-18 10:14:49","2025-02-18 10:14:49");
INSERT INTO sales VALUES("81","posr-20250218-103921","47","4","","","2","1","1","1","1","0","104.64","1150.99","1150.99","4","1","0","0","Flat","","0","","0","0","3","2","","0","","","","2025-02-18 10:39:21","2025-02-18 10:39:21");
INSERT INTO sales VALUES("82","posr-20250218-103942","47","4","","","2","1","1","1","1","0","104.64","1150.99","1150.99","4","1","0","0","Flat","","0","","0","0","3","4","","1150.99","","","","2025-02-18 10:39:42","2025-02-18 10:39:42");
INSERT INTO sales VALUES("83","posr-20250218-103956","47","4","","","2","1","1","2","2","0","104.64","1709.99","1709.99","4","1","0","0","Flat","","0","","0","0","3","2","","0","","","","2025-02-18 10:39:56","2025-02-18 10:39:56");
INSERT INTO sales VALUES("86","posr-20250218-022422","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 14:24:22","2025-02-18 14:24:22");
INSERT INTO sales VALUES("87","posr-20250218-022501","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 14:25:01","2025-02-18 14:25:01");
INSERT INTO sales VALUES("88","posr-20250218-022538","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 14:25:38","2025-02-18 14:25:38");
INSERT INTO sales VALUES("89","posr-20250218-022717","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 14:27:17","2025-02-18 14:27:17");
INSERT INTO sales VALUES("90","posr-20250218-023138","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 14:31:38","2025-02-18 14:31:38");
INSERT INTO sales VALUES("91","posr-20250218-023258","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 14:32:58","2025-02-18 14:32:58");
INSERT INTO sales VALUES("92","posr-20250218-023320","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 14:33:20","2025-02-18 14:33:20");
INSERT INTO sales VALUES("93","posr-20250218-025911","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 14:59:11","2025-02-18 14:59:11");
INSERT INTO sales VALUES("94","posr-20250218-030015","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 15:00:15","2025-02-18 15:00:15");
INSERT INTO sales VALUES("95","posr-20250218-030253","47","4","","","2","1","1","1","1","0","0","559","559","4","1","0","0","Flat","","0","","0","0","1","4","","559","","","","2025-02-18 15:02:53","2025-02-18 15:02:53");
INSERT INTO sales VALUES("96","posr-20250218-030511","47","4","","","2","1","1","1","1","0","104.64","1150.99","1150.99","4","1","0","0","Flat","","0","","0","0","1","4","","1150.99","","","","2025-02-18 15:05:11","2025-02-18 15:05:11");
INSERT INTO sales VALUES("97","posr-20250218-030547","47","4","","","2","1","1","1","1","0","104.64","1150.99","1150.99","4","1","0","0","Flat","","0","","0","0","1","4","","1150.99","","","","2025-02-18 15:05:47","2025-02-18 15:05:47");
INSERT INTO sales VALUES("98","posr-20250218-030703","47","4","","","2","1","1","1","1","0","104.64","1150.99","1150.99","4","1","0","0","Flat","","0","","0","0","1","4","","1150.99","","","","2025-02-18 15:07:03","2025-02-18 15:07:03");
INSERT INTO sales VALUES("99","posr-20250218-031643","47","4","","","2","1","1","1","2","0","209.27","2301.98","2301.98","4","1","0","0","Flat","","0","","0","0","1","4","","2301.98","","","","2025-02-18 15:16:43","2025-02-18 15:16:43");
INSERT INTO sales VALUES("100","posr-20250218-031726","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 15:17:26","2025-02-18 15:17:26");
INSERT INTO sales VALUES("101","posr-20250218-032057","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 15:20:57","2025-02-18 15:20:57");
INSERT INTO sales VALUES("102","posr-20250218-032209","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 15:22:09","2025-02-18 15:22:09");
INSERT INTO sales VALUES("103","posr-20250218-032256","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 15:22:56","2025-02-18 15:22:56");
INSERT INTO sales VALUES("104","posr-20250218-032500","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 15:25:00","2025-02-18 15:25:00");
INSERT INTO sales VALUES("105","posr-20250218-033317","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 15:33:17","2025-02-18 15:33:17");
INSERT INTO sales VALUES("106","posr-20250218-033407","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 15:34:07","2025-02-18 15:34:07");
INSERT INTO sales VALUES("107","posr-20250218-033433","47","4","","","2","1","1","1","1","0","0","1111.99","1111.99","4","1","0","0","Flat","","0","","0","0","1","4","","1111.99","","","","2025-02-18 15:34:33","2025-02-18 15:34:33");
INSERT INTO sales VALUES("108","posr-20250218-035818","47","8","","","2","2","1","1","1","0","118.18","1299.99","1299.99","4","1","0","0","Flat","","0","","0","0","1","4","","1299.99","","","","2025-02-18 15:58:18","2025-02-18 15:58:18");
INSERT INTO sales VALUES("109","posr-20250218-035915","47","8","","","2","2","1","1","1","0","118.18","1299.99","1299.99","4","1","0","0","Flat","","0","","0","0","1","4","","1299.99","","","","2025-02-18 15:59:15","2025-02-18 15:59:15");
INSERT INTO sales VALUES("110","posr-20250218-040157","47","4","","","2","1","1","1","1","0","113.64","1250","1250","4","1","","0","","","0","","0","0","1","4","","1250","","","","2025-02-18 16:01:57","2025-02-18 16:01:57");
INSERT INTO sales VALUES("112","posr-20250218-042141","47","4","","","2","1","1","1","1","0","104.64","1150.99","1150.99","4","1","","0","","","0","","0","0","1","4","","1150.99","","","","2025-02-18 16:21:41","2025-02-18 16:21:41");
INSERT INTO sales VALUES("113","posr-20250218-042222","47","4","","","2","1","1","1","1","0","0","1250","1250","4","1","","0","","","0","","0","0","1","4","","1250","","","","2025-02-18 16:22:22","2025-02-18 16:22:22");



CREATE TABLE `sms_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_ecommerce` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sms_templates VALUES("1","test template","eso nije kori...","1","0","2024-05-19 08:14:12","2024-10-28 20:07:53");
INSERT INTO sms_templates VALUES("2","test template 2","fsdfsdf","0","1","2024-05-19 08:20:25","2024-10-28 20:07:53");



CREATE TABLE `stock_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) DEFAULT NULL,
  `brand_id` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `initial_file` varchar(191) DEFAULT NULL,
  `final_file` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stock_counts VALUES("1","scr-20240825-060302","1","","","1","full","20240825-060302.csv","","","0","2024-08-25 23:03:02","2024-08-25 23:03:02");



CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("1","Abdullah","","Global Tech","31213131","abdullah@gmail.com","312313","Mirpur","Dhaka","","","Bangladesh","1","2024-01-19 13:41:37","2024-01-19 13:41:37");
INSERT INTO suppliers VALUES("2","rahmatullah","","Samsung","","info@microsoft.com","213123123","boropul, halishahr","chittagong","","","","1","2024-07-18 07:51:07","2024-07-18 07:51:07");



CREATE TABLE `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `number_of_person` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO tables VALUES("1","Table 1","3","middle table","1","2024-04-21 04:58:24","2024-04-21 04:58:24");



CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `woocommerce_tax_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES("1","@10","10","1","","2024-01-08 05:26:16","2024-01-08 05:26:16");
INSERT INTO taxes VALUES("2","@15","15","1","","2024-01-08 05:26:29","2024-01-08 05:26:29");
INSERT INTO taxes VALUES("3","vat 20%","20","1","","2024-04-29 12:28:49","2024-04-29 12:28:49");



CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transfers VALUES("11","tr-20240528-030550","1","1","1","2","1","1","0","439","","439","","","1","2024-05-28 09:05:50","2024-05-28 09:05:56");
INSERT INTO transfers VALUES("12","tr-20240528-030714","1","1","1","2","1","1","0","399","","399","","","1","2024-05-28 09:07:14","2024-05-28 09:07:20");
INSERT INTO transfers VALUES("13","tr-20250213-112633","47","1","1","2","1","1","0","439","","439","","","0","2025-02-13 00:00:00","2025-02-13 23:26:33");
INSERT INTO transfers VALUES("14","tr-20250214-071722","47","1","1","3","1","10","100","1100","","1100","","","1","2025-02-14 19:17:22","2025-02-14 19:17:22");
INSERT INTO transfers VALUES("15","tr-20250215-115719","47","1","2","1","1","1","0","130","112","242","","","1","2025-02-16 00:00:00","2025-02-15 23:57:19");



CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(191) NOT NULL,
  `unit_name` varchar(191) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","pc","Piece","","*","1","1","2024-01-08 05:37:39","2024-01-08 05:37:39");
INSERT INTO units VALUES("2","dozen","Dozen","1","*","12","1","2024-01-08 05:38:27","2024-01-08 05:38:27");
INSERT INTO units VALUES("3","carton","Carton","1","*","24","1","2024-01-08 05:39:01","2024-01-08 05:39:01");
INSERT INTO units VALUES("4","kg","Kilogram","","*","1","1","2024-01-08 05:39:37","2024-01-08 05:39:37");
INSERT INTO units VALUES("5","gm","Gram","4","/","1000","1","2024-01-08 05:40:00","2024-01-08 05:40:00");



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","admin","ashfaqdev.php@gmail.com","$2a$12$UmEJxPv6lb3pc22LZ.Z40.gioOt6OEuBNAtPn.sg7h9RorQ/9zyfm","cYJmu9OE8HQIZZuvg0sURkn9cGZDRwmIOF3yhuBKtZRJ0N26kHeRXsf2jc8F","12112","lioncoders","1","","","0","1","2018-06-02 03:24:15","2025-02-14 19:35:57");
INSERT INTO users VALUES("3","dhiman da","dhiman@gmail.com","$2y$10$Fef6vu5E67nm11hX7V5a2u1ThNCQ6n9DRCvRF9TD7stk.Pmt2R6O.","5ehQM6JIfiQfROgTbB5let0Z93vjLHS7rd9QD5RPNgOxli3xdo7fykU7vtTt","212","lioncoders","1","","","0","1","2018-06-13 22:00:31","2020-11-05 07:06:51");
INSERT INTO users VALUES("6","test","test@gmail.com","$2y$10$TDAeHcVqHyCmurki0wjLZeIl1SngKX3WLOhyTiCoZG3souQfqv.LS","KpW1gYYlOFacumklO2IcRfSsbC3KcWUZzOI37gqoqM388Xie6KdhaOHIFEYm","1234","212312","4","","","0","1","2018-06-23 03:05:33","2018-06-23 03:13:45");
INSERT INTO users VALUES("8","test","test@yahoo.com","$2y$10$hlMigidZV0j2/IPkgE/xsOSb8WM2IRlsMv.1hg1NM7kfyd6bGX3hC","","31231","","4","","","0","1","2018-06-24 22:35:49","2018-07-02 01:07:39");
INSERT INTO users VALUES("9","staff","anda@gmail.com","$2y$10$kxDbnynB6mB1e1w3pmtbSOlSxy/WwbLPY5TJpMi0Opao5ezfuQjQm","EOBWOQLzRNZHj4Qo59mIDEW4z1qk7Bewt7tgTwGSnMaGlez2Xt47zb6ReIb1","3123","","4","5","1","0","1","2018-07-02 01:08:08","2025-02-14 19:35:57");
INSERT INTO users VALUES("10","abul","abul@alpha.com","$2y$10$5zgB2OOMyNBNVAd.QOQIju5a9fhNnTqPx5H6s4oFlXhNiF6kXEsPq","x7HlttI5bM0vSKViqATaowHFJkLS3PHwfvl7iJdFl5Z1SsyUgWCVbLSgAoi0","1234","anda","1","","","0","1","2018-09-07 23:44:48","2025-02-14 19:35:57");
INSERT INTO users VALUES("11","teststaff","a@a.com","$2y$10$5KNBIIhZzvvZEQEhkHaZGu.Q8bbQNfqYvYgL5N55B8Pb4P5P/b/Li","DkHDEcCA0QLfsKPkUK0ckL0CPM6dPiJytNa0k952gyTbeAyMthW3vi7IRitp","111","aa","4","5","1","0","1","2018-10-22 02:47:56","2018-10-23 02:10:56");
INSERT INTO users VALUES("12","john","john@gmail.com","$2y$10$P/pN2J/uyTYNzQy2kRqWwuSv7P2f6GE/ykBwtHdda7yci3XsfOKWe","O0f1WJBVjT5eKYl3Js5l1ixMMtoU6kqrH7hbHDx9I1UCcD9CmiSmCBzHbQZg","10001","","4","2","2","0","1","2018-12-30 00:48:37","2019-03-06 04:59:49");
INSERT INTO users VALUES("13","jjj","test@test.com","$2y$10$/Qx3gHWYWUhlF1aPfzXaCeZA7fRzfSEyCIOnk/dcC4ejO8PsoaalG","","1213","","1","","","0","1","2019-01-03 00:08:31","2019-03-03 04:02:29");
INSERT INTO users VALUES("19","shakalaka","shakalaka@gmail.com","$2y$10$ketLWT0Ib/JXpo00eJlxoeSw.7leS8V1CUGInfbyOWT4F5.Xuo7S2","","1212","Digital image","5","","","0","1","2020-11-09 00:07:16","2025-02-14 19:35:57");
INSERT INTO users VALUES("21","modon","modon@gmail.com","$2y$10$7VpoeGMkP8QCvL5zLwFW..6MYJ5MRumDLDoX.TTQtClS561rpFHY.","","2222","modon company","5","","","0","1","2020-11-13 07:12:08","2025-02-14 19:35:57");
INSERT INTO users VALUES("22","dhiman","dhiman@gmail.com","$2y$10$3mPygsC6wwnDtw/Sg85IpuExtUhgaHx52Lwp7Rz0.FNfuFdfKVpRq","","+8801111111101","lioncoders","5","","","0","1","2020-11-15 06:14:58","2025-02-14 19:35:57");
INSERT INTO users VALUES("31","mbs","mbs@gmail.com","$2y$10$6Ldm1rWEVSrlTmpjIXkeQO9KwWJz/j0FB4U.fY1oCFeax47rvttEK","","2121","","4","1","2","0","1","2021-12-29 06:40:22","2025-02-14 19:35:57");
INSERT INTO users VALUES("39","maja","maja@maja.com","$2y$10$lrMVhNDE9AuKhFrJIgG2y.zdtrCltR8/JB1okO0W8GsUcMjSFW7rW","","444555","","4","5","2","0","1","2022-09-14 04:37:21","2025-02-14 19:35:57");
INSERT INTO users VALUES("42","Tarik Iqbal","tarik_17@yahoo.co.uk","$2y$10$z2nZAsrIPrSWgPEtTY9D6.1vmkvYj4p3W3kamYvdoCDnCtlVqZp86","","","","5","","","0","1","2023-11-17 05:04:37","2025-02-14 19:35:57");
INSERT INTO users VALUES("43","support@lion-coders.com","support@lion-coders.com","$2y$10$ea.ekPLTQk0Y5087FqSbdevaN.gkEMGucgFJ13aGPEd.EqY45Y.AK","","","","5","","","0","1","2023-12-09 14:15:06","2025-02-14 19:35:57");
INSERT INTO users VALUES("44","james","jamesbond@gmail.com","$2y$10$7XCviP5GAZm6E/nlk4HQmuyw2kbhVpLbxsN6PqmNubmUKpiseGiEy","","313131","MI6","5","","","1","0","2024-01-19 13:23:28","2024-01-19 13:23:28");
INSERT INTO users VALUES("46","bkk","bkk@bkk.com","$2y$10$6FBCW.gf7tOH6ygDYLUcSeVkur1VL.iBSvGor35AxO849fJLxxZoW","","87897","","5","","","1","0","2024-06-10 10:40:15","2024-06-10 10:40:15");
INSERT INTO users VALUES("47","brian7401","briankibet7401@gmail.com","$2y$10$dMCSWq6cTahWLa1iTJJ3u.z167dJmSeTvPW3SlcBB6RjiNwoN0YAW","","0717608640","kirinyaga","1","","","1","0","2025-02-13 16:12:36","2025-02-13 16:12:36");
INSERT INTO users VALUES("48","cashier1","palmwavecars@gmail.com","$2y$10$PVQ5SP2FDTOCOVGjhWukN.rEK8/Vp2fTAXI4kIB1Gd6rKYWynJIle","","0717608640","Uhai Africa","6","2","1","1","0","2025-02-14 16:20:16","2025-02-14 19:19:51");
INSERT INTO users VALUES("49","Rao","railaodinga@gmail.com","$2y$10$.OU6JFCZMI2KTIjcDt8d5eCjpjA4LKsdUkqMs.SRg328S2uc1qe3e","","072734778","","5","1","1","1","0","2025-02-15 23:14:16","2025-02-15 23:14:16");



CREATE TABLE `variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("1","Shop 1","97090998","ashfaqdev.php@gmail.com","london","1","2024-01-19 13:28:31","2024-05-28 07:56:14");
INSERT INTO warehouses VALUES("2","Shop 2","8098098","ashfaqdev.php@gmail.com","Liverpool","1","2024-01-19 13:28:52","2024-05-28 07:57:05");
INSERT INTO warehouses VALUES("3","TEST STORE","0717608640","","NAIROBI","1","2025-02-14 18:08:42","2025-02-14 18:08:42");

