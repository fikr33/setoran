-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 10.2.3-MariaDB-log - mariadb.org binary distribution
-- OS Server:                    Win32
-- HeidiSQL Versi:               9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk ecommerce
CREATE DATABASE IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecommerce`;

-- membuang struktur untuk table ecommerce.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no-foto.png',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `in_out_qty` int(11) NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `inventories_item_id_foreign` (`item_id`),
  KEY `inventories_user_id_foreign` (`user_id`),
  CONSTRAINT `inventories_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `inventories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upc_ean_isbn` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `item_name` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no-foto.png',
  `cost_price` decimal(9,2) NOT NULL,
  `selling_price` decimal(9,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.item_kit_items
CREATE TABLE IF NOT EXISTS `item_kit_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_kit_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `selling_price` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost_price` decimal(15,2) NOT NULL,
  `total_selling_price` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `item_kit_items_item_kit_id_foreign` (`item_kit_id`),
  KEY `item_kit_items_item_id_foreign` (`item_id`),
  CONSTRAINT `item_kit_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `item_kit_items_item_kit_id_foreign` FOREIGN KEY (`item_kit_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.item_kit_item_temps
CREATE TABLE IF NOT EXISTS `item_kit_item_temps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `selling_price` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost_price` decimal(15,2) NOT NULL,
  `total_selling_price` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `item_kit_item_temps_item_id_foreign` (`item_id`),
  CONSTRAINT `item_kit_item_temps_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.receivings
CREATE TABLE IF NOT EXISTS `receivings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `payment_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `receivings_supplier_id_foreign` (`supplier_id`),
  KEY `receivings_user_id_foreign` (`user_id`),
  CONSTRAINT `receivings_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `receivings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.receiving_items
CREATE TABLE IF NOT EXISTS `receiving_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receiving_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `cost_price` decimal(9,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost` decimal(9,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `receiving_items_receiving_id_foreign` (`receiving_id`),
  KEY `receiving_items_item_id_foreign` (`item_id`),
  CONSTRAINT `receiving_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `receiving_items_receiving_id_foreign` FOREIGN KEY (`receiving_id`) REFERENCES `receivings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.receiving_temps
CREATE TABLE IF NOT EXISTS `receiving_temps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `cost_price` decimal(9,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost` decimal(9,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `receiving_temps_item_id_foreign` (`item_id`),
  CONSTRAINT `receiving_temps_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.sales
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `payment_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sales_customer_id_foreign` (`customer_id`),
  KEY `sales_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.sale_items
CREATE TABLE IF NOT EXISTS `sale_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `selling_price` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost` decimal(15,2) NOT NULL,
  `total_selling` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sale_items_sale_id_foreign` (`sale_id`),
  KEY `sale_items_item_id_foreign` (`item_id`),
  CONSTRAINT `sale_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.sale_temps
CREATE TABLE IF NOT EXISTS `sale_temps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `cost_price` decimal(9,2) NOT NULL,
  `selling_price` decimal(9,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost` decimal(9,2) NOT NULL,
  `total_selling` decimal(9,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sale_temps_item_id_foreign` (`item_id`),
  CONSTRAINT `sale_temps_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no-foto.png',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.tutapos_settings
CREATE TABLE IF NOT EXISTS `tutapos_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `languange` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table ecommerce.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Pengeluaran data tidak dipilih.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
