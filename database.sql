-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table simple_arsip.api_modules
DROP TABLE IF EXISTS `api_modules`;
CREATE TABLE IF NOT EXISTS `api_modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_menus` bigint DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`),
  KEY `method` (`method`),
  KEY `api_modules_id_menus_index` (`id_menus`),
  KEY `api_modules_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.api_modules: ~43 rows (approximately)
DELETE FROM `api_modules`;
INSERT INTO `api_modules` (`id`, `id_menus`, `name`, `method`, `key`, `url`, `query_param`, `description`, `header`, `body`, `response`, `created_at`, `updated_at`) VALUES
	(1, 0, 'AUTH - REGISTER', 'POST', 'register', 'api/register', NULL, NULL, NULL, NULL, NULL, '2024-07-29 07:55:36', NULL),
	(2, 1, 'USER - GET LIST USERS', 'GET', 'user_management_get_list', 'api/user_management', NULL, NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(3, 1, 'USER - SAVE NEW USER', 'POST', 'user_management_post', 'api/user_management', NULL, 'Simpan User Baru', NULL, NULL, NULL, '2024-07-29 07:55:39', '2024-08-23 01:27:11'),
	(4, 1, 'USER - UPDATE USER', 'PUT', 'user_management_put', 'api/user_management', 'id_user', NULL, NULL, NULL, NULL, '2024-07-29 07:55:40', NULL),
	(5, 1, 'USER - DELETE USER', 'DELETE', 'user_management_delete', 'api/user_management', 'id_user', NULL, NULL, NULL, NULL, '2024-07-29 07:55:41', NULL),
	(7, 0, 'BASE - GET ROLE MENU', 'GET', 'base_role_menus', 'api/base/role_menus', 'id_role', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 0, 'AUTH - LOGIN', 'GET', 'login', 'api/login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 0, 'BASE - GET MENUS', 'GET', 'base_menus', 'api/base/menus', NULL, 'List menu yang sesuai dengan akses yang dimiliki role', NULL, NULL, NULL, NULL, '2024-08-23 01:20:18'),
	(10, 1, 'USER - LIST ROLES', 'GET', 'user_management_roles', 'api/user_management/roles', NULL, NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(11, 1, 'USER - SHOW USER', 'GET', 'user_management_get_saved_user', 'api/user_management/[id_user]', 'id_user', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(12, 4, 'ROLE - GET LIST', 'GET', 'role_get_list', 'api/role', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(15, 4, 'ROLE - Show Role', 'GET', 'role_get_saved_role', 'api/role/[roleId]', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(16, 4, 'ROLE - Update Role', 'PUT', 'role_put', 'api/role/[roleId]', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(17, 4, 'ROLE - Delete Role', 'DELETE', 'role_delete', 'api/role/[roleId]', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(18, 4, 'ROLE - Role Menus', 'GET', 'role_menus', 'api/role/[roleId]/menus', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(20, 4, 'ROLE - All Menus', 'GET', 'role_all_menus', 'api/role/menus', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(21, 4, 'ROLE - Save new role menu', 'POST', 'role_menus_post', 'api/role/[roleId]/menus', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(22, 4, 'ROLE - Delete Role Menu', 'DELETE', 'role_menus_delete', 'api/role/[roleId]/menus/[menuId]', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(23, 4, 'ROLE - Role Menu Apis', 'GET', 'role_menu_apis', 'api/role/[roleId]/menus/[menuId]/apis', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(24, 4, 'ROLE - Save access role Menu Apis', 'POST', 'role_menu_apis_post', 'api/role/[roleId]/menus/[menuId]/apis', '', NULL, NULL, NULL, NULL, '2024-07-29 07:55:38', NULL),
	(25, 4, 'ROLE - Save Role Menu Access Function', 'POST', 'role_menus_access_post', 'api/role/[roleId]/menus/[menuId]/access', NULL, NULL, NULL, NULL, NULL, '2024-08-19 02:37:31', NULL),
	(26, 5, 'API - Get List Data', 'GET', 'master_api_get_list', 'api/master_api', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, 5, 'API - Save New Api', 'POST', 'master_api_post', 'api/master_api', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, 5, 'API - List All Menu', 'GET', 'master_api_menus', 'api/master_api/menus', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, 5, 'API - Update Api', 'PUT', 'master_api_put', 'api/master_api/[apiId]', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, 5, 'API - Delete Api', 'DELETE', 'master_api_delete', 'api/master_api/[apiId]', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, 5, 'API - Show Api', 'GET', 'master_api_get', 'api/master_api/[apiId]', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(43, 2, 'Kelola Menu - Lihat semua menu', 'GET', 'master_menu_get', 'api/master_menu', NULL, 'Menampilkan list menu yang tersimpan', NULL, NULL, NULL, '2024-08-23 08:26:33', '2024-08-23 08:35:37'),
	(44, 2, 'Kelola Menu - Simpan menu baru', 'POST', 'master_menu_post', 'api/master_menu', NULL, 'Api untuk simpan menu baru', NULL, NULL, NULL, '2024-08-23 08:27:37', '2024-08-23 08:34:02'),
	(45, 2, 'Kelola Menu - Update menu', 'PUT', 'master_menu_put', 'api/master_menu/[menuId]', NULL, 'Api untuk perbarui data menu', NULL, NULL, NULL, '2024-08-23 08:28:33', '2024-08-23 08:34:27'),
	(46, 2, 'Kelola Menu - Lihat detail menu', 'GET', 'master_menu_show', 'api/kelola_menu/[menuId]', NULL, 'Api untuk melihat detail data menu berdasarkan id menu', NULL, NULL, NULL, '2024-08-23 08:29:43', '2024-08-23 08:33:50'),
	(47, 2, 'Kelola Menu - Delete menu', 'DELETE', 'master_menu_delete', 'api/kelola_menu/[menuId]', NULL, 'Api untuk delete data menu', NULL, NULL, NULL, '2024-08-23 08:30:42', '2024-08-23 08:31:02'),
	(48, 0, 'Refresh Token', 'GET', 'refresh_token', 'api/refresh_token', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(49, 0, 'BASE - Menu Access', 'GET', 'base_menu_access', 'api/base/menu_access', '', NULL, NULL, NULL, NULL, NULL, NULL),
	(51, 2, 'Kelola Menu - List menu', 'GET', 'master_menu_menus', 'api/master_menu/menus', NULL, 'Digunanakn saat tambah atau edit', NULL, NULL, NULL, '2024-10-16 01:12:20', '2024-10-16 01:15:13'),
	(56, 4, 'ROLE - INSERT', 'POST', 'role_post', 'api/role', NULL, 'Simpan role baru', NULL, NULL, NULL, '2024-10-16 01:44:25', '2024-10-16 01:44:25'),
	(64, 17, 'ARSIP - Folder - List Folder', 'GET', 'arsip_get_list_folders', 'api/arsip/folder/[parrent]', NULL, 'Untuk melihat seluruh list filder', NULL, NULL, NULL, '2024-10-24 01:39:34', '2024-10-24 01:45:47'),
	(66, 17, 'ARSIP - Folder - Tambah Folder', 'POST', 'arsip_post_folder', 'api/arsip/folder', NULL, 'Simpan Folder Baru', NULL, NULL, NULL, '2024-10-24 01:41:55', '2024-10-24 01:45:39'),
	(67, 17, 'ARSIP - Folder - Edit Folder', 'PUT', 'arsip_put_folder', 'api/arsip/folder/[arsip_id]', NULL, 'Api Edit Folder', NULL, NULL, NULL, '2024-10-24 01:43:19', '2024-10-24 01:45:29'),
	(68, 17, 'ARSIP - Folder - Hapus Folder', 'DELETE', 'arsip_delete_folder', 'api/arsip/folder/[arsip_id]', NULL, 'Delete Folder', NULL, NULL, NULL, '2024-10-24 01:44:24', '2024-10-24 01:45:21'),
	(69, 17, 'ARSIP - FILE - List Files', 'GET', 'arsip_file_get_list', 'api/arsip/file/[parrent]', NULL, 'Get list file by parrent', NULL, NULL, NULL, '2024-10-25 00:25:53', '2024-10-25 00:25:53'),
	(70, 17, 'ARSIP - FILE - Add File', 'POST', 'arsip_file_post', 'api/arsip/file/[parrent]', NULL, 'Simpan File', NULL, NULL, NULL, '2024-10-25 00:26:52', '2024-10-25 00:26:52'),
	(71, 17, 'ARSIP - FILE - Delete File', 'DELETE', 'arsip_file_delete', 'api/arsip/file/[parrent]/[id]', NULL, 'Hapus File', NULL, NULL, NULL, '2024-10-25 00:28:07', '2024-10-25 00:28:07');

-- Dumping structure for table simple_arsip.arsips
DROP TABLE IF EXISTS `arsips`;
CREATE TABLE IF NOT EXISTS `arsips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_arsips` bigint DEFAULT '0',
  `tipe` int DEFAULT NULL,
  `name_display` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_origin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `arsips_id_arsips_index` (`id_arsips`),
  KEY `arsips_tipe_index` (`tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.arsips: ~8 rows (approximately)
DELETE FROM `arsips`;
INSERT INTO `arsips` (`id`, `id_arsips`, `tipe`, `name_display`, `name_origin`, `extension`, `created_at`, `updated_at`) VALUES
	(1, 0, 1, 'Kuliah UNIBI', 'kuliah-unibi', NULL, '2024-10-24 02:20:53', '2024-10-24 02:20:53'),
	(4, 0, 1, 'Kerjaan', 'kerjaan', NULL, '2024-10-24 07:00:04', '2024-10-24 07:00:04'),
	(5, 1, 1, 'Semester 1', 'semester-1', NULL, '2024-10-25 06:16:53', '2024-10-25 06:16:53'),
	(6, 5, 1, 'Kalkulus', 'kalkulus', NULL, NULL, NULL),
	(7, 0, 1, 'Arsip Dokumen Penting', 'arsip-dokumen-penting', NULL, '2024-10-25 01:25:14', '2024-10-25 01:25:14'),
	(8, 1, 1, 'Semester 2', 'semester-2', NULL, '2024-10-25 01:31:31', '2024-10-25 01:31:31'),
	(9, 1, 1, 'Semester 3', 'semester-3', NULL, '2024-10-25 01:32:46', '2024-10-25 01:32:46'),
	(10, 1, 1, 'Semester 4', 'semester-4', NULL, '2024-10-25 01:35:40', '2024-10-25 01:35:40');

-- Dumping structure for table simple_arsip.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table simple_arsip.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_parrent` bigint DEFAULT '0',
  `menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `urutan` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_id_parrent_index` (`id_parrent`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.menus: ~6 rows (approximately)
DELETE FROM `menus`;
INSERT INTO `menus` (`id`, `id_parrent`, `menu`, `link`, `icon`, `urutan`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Management User', '/users', '<svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-users"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M9 7m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /><path d="M16 3.13a4 4 0 0 1 0 7.75" /><path d="M21 21v-2a4 4 0 0 0 -3 -3.85" /></svg>', NULL, NULL, NULL),
	(2, 0, 'Management Menu', '/master_menu', '<svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-category-minus"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 4h6v6h-6zm10 0h6v6h-6zm-10 10h6v6h-6zm10 3h6" /></svg>', NULL, NULL, NULL),
	(4, 0, 'Role', '/roles', '<svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-user-check"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" /><path d="M6 21v-2a4 4 0 0 1 4 -4h4" /><path d="M15 19l2 2l4 -4" /></svg>', NULL, NULL, NULL),
	(5, 0, 'Master API', '/master_api', '<svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-git-pull-request"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M6 18m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M6 6m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M18 18m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M6 8l0 8" /><path d="M11 6h5a2 2 0 0 1 2 2v8" /><path d="M14 9l-3 -3l3 -3" /></svg>', NULL, NULL, NULL),
	(17, 0, 'Arsip File', '/arsip', '<svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-archive"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M3 4m0 2a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2z" /><path d="M5 8v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-10" /><path d="M10 12l4 0" /></svg>', 2, '2024-10-23 23:36:11', '2024-10-23 23:36:11');

-- Dumping structure for table simple_arsip.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.migrations: ~15 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_07_25_032046_create_roles_table', 1),
	(6, '2024_07_25_032120_create_api_modules_table', 1),
	(7, '2024_07_25_032305_create_role_api_modules_table', 1),
	(8, '2024_07_29_074023_create_menus_table', 1),
	(9, '2024_07_29_074354_add_id_menu_to_api_modules', 1),
	(10, '2024_07_29_074825_create_role_menus_table', 1),
	(11, '2024_07_29_080150_add_query_param_to_api_modules', 1),
	(12, '2024_07_29_080823_add_key_to_api_modules', 1),
	(13, '2024_08_19_015328_create_role_menu_accesses_table', 1),
	(14, '2024_08_27_092214_add_expires_at_to_personal_access_tokens', 1),
	(15, '2024_10_24_082455_create_arsips_table', 2),
	(16, '2024_10_25_074139_add_path_to_arsips', 3),
	(17, '2024_10_25_074517_add_name_path_to_arsips', 4);

-- Dumping structure for table simple_arsip.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table simple_arsip.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.personal_access_tokens: ~8 rows (approximately)
DELETE FROM `personal_access_tokens`;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`, `expires_at`) VALUES
	(28, 'App\\Models\\User', 1, 'auth_token', 'f2e838583fd930b4a2f470d5a89b3a302dd92f0ff09999839c19a0aac5dabb9a', '["*"]', '2024-10-24 01:51:41', '2024-10-24 01:42:06', '2024-10-24 01:51:41', '2024-10-27 01:42:06'),
	(38, 'App\\Models\\User', 4, 'auth_token', '4b84ab172b4a9591fe9bedb12c3a6bec2f70a4a26444a654dc325f2f46257414', '["*"]', NULL, '2024-10-24 23:10:22', '2024-10-24 23:10:22', '2024-10-27 23:10:22'),
	(39, 'App\\Models\\User', 4, 'auth_token', '45b1dfc2b8fba5b4ba8638ee40ba588caa2ff1d7cbed159547f6237485f6cbc3', '["*"]', '2024-10-25 02:34:09', '2024-10-24 23:11:28', '2024-10-25 02:34:09', '2024-10-27 23:11:27'),
	(44, 'App\\Models\\User', 4, 'auth_token', 'd544e1489442f43d5d0709d21ae17ca54b6e6de984f194379d1ddbe8a79e62b9', '["*"]', '2024-10-25 00:21:56', '2024-10-25 00:11:05', '2024-10-25 00:21:56', '2024-10-28 00:11:05'),
	(45, 'App\\Models\\User', 1, 'auth_token', '0c8998cd12ab6b7f52bde4d0b8ff7be4ab4ce24cc13270ad0f5ed69f0d58145e', '["*"]', '2024-10-25 00:31:05', '2024-10-25 00:24:18', '2024-10-25 00:31:05', '2024-10-28 00:24:18'),
	(46, 'App\\Models\\User', 4, 'auth_token', '42d24e95b5d2fb573050491c4239f0266d45dcbfd854335aa237a0de5e4a7f2b', '["*"]', '2024-10-25 00:39:37', '2024-10-25 00:39:15', '2024-10-25 00:39:37', '2024-10-28 00:39:15'),
	(47, 'App\\Models\\User', 1, 'auth_token', 'f306c33c148343599c5e2245a8a542727dbe096807d87791f95d54abc8cdbfa7', '["*"]', '2024-10-25 00:40:18', '2024-10-25 00:40:07', '2024-10-25 00:40:18', '2024-10-28 00:40:07'),
	(62, 'App\\Models\\User', 4, 'auth_token', 'f1529e663e75e1aabd38e60992e86ffc36d1c2ec7a8206d6a5f470e1db4cbba7', '["*"]', '2024-10-25 06:37:43', '2024-10-25 02:25:30', '2024-10-25 06:37:43', '2024-10-28 02:25:30');

-- Dumping structure for table simple_arsip.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.roles: ~3 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'SUPERADMIN', NULL, NULL),
	(2, 'ADMIN', NULL, NULL),
	(8, 'Pengguna', '2024-10-16 01:45:06', '2024-10-16 01:45:06');

-- Dumping structure for table simple_arsip.role_api_modules
DROP TABLE IF EXISTS `role_api_modules`;
CREATE TABLE IF NOT EXISTS `role_api_modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_roles` bigint DEFAULT NULL,
  `id_api_module` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_api_modules_id_roles_index` (`id_roles`),
  KEY `role_api_modules_id_api_module_index` (`id_api_module`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.role_api_modules: ~52 rows (approximately)
DELETE FROM `role_api_modules`;
INSERT INTO `role_api_modules` (`id`, `id_roles`, `id_api_module`, `created_at`, `updated_at`) VALUES
	(5, 1, 9, NULL, NULL),
	(9, 1, 13, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(10, 1, 14, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(11, 1, 15, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(12, 1, 16, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(13, 1, 17, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(14, 1, 18, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(15, 1, 19, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(16, 1, 20, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(17, 1, 21, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(18, 1, 22, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(19, 1, 23, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(20, 1, 24, '2024-08-02 07:29:54', '2024-08-02 07:29:54'),
	(39, 1, 12, '2024-08-18 07:32:04', '2024-08-18 07:32:04'),
	(53, 2, 11, '2024-08-18 07:33:59', '2024-08-18 07:33:59'),
	(54, 2, 10, '2024-08-18 07:33:59', '2024-08-18 07:33:59'),
	(55, 2, 5, '2024-08-18 07:34:00', '2024-08-18 07:34:00'),
	(56, 2, 4, '2024-08-18 07:34:00', '2024-08-18 07:34:00'),
	(57, 2, 3, '2024-08-18 07:34:01', '2024-08-18 07:34:01'),
	(58, 2, 2, '2024-08-18 07:34:01', '2024-08-18 07:34:01'),
	(59, 4, 2, '2024-08-18 07:43:42', '2024-08-18 07:43:42'),
	(60, 4, 3, '2024-08-18 07:43:43', '2024-08-18 07:43:43'),
	(61, 4, 4, '2024-08-18 07:43:43', '2024-08-18 07:43:43'),
	(62, 4, 5, '2024-08-18 07:43:43', '2024-08-18 07:43:43'),
	(63, 4, 10, '2024-08-18 07:43:44', '2024-08-18 07:43:44'),
	(64, 4, 11, '2024-08-18 07:43:44', '2024-08-18 07:43:44'),
	(65, 1, 2, '2024-08-18 07:48:42', '2024-08-18 07:48:42'),
	(66, 1, 3, '2024-08-18 07:48:45', '2024-08-18 07:48:45'),
	(67, 1, 4, '2024-08-18 07:48:46', '2024-08-18 07:48:46'),
	(68, 1, 5, '2024-08-18 07:48:46', '2024-08-18 07:48:46'),
	(69, 1, 10, '2024-08-18 07:48:56', '2024-08-18 07:48:56'),
	(70, 1, 11, '2024-08-18 07:48:57', '2024-08-18 07:48:57'),
	(71, 1, 25, '2024-08-18 19:39:41', '2024-08-18 19:39:41'),
	(72, 1, 26, '2024-08-22 02:22:07', '2024-08-22 02:22:07'),
	(73, 1, 27, '2024-08-22 02:22:08', '2024-08-22 02:22:08'),
	(74, 1, 31, '2024-08-22 02:22:09', '2024-08-22 02:22:09'),
	(75, 1, 32, '2024-08-22 02:22:09', '2024-08-22 02:22:09'),
	(76, 1, 34, '2024-08-22 02:22:11', '2024-08-22 02:22:11'),
	(77, 1, 35, '2024-08-22 02:22:11', '2024-08-22 02:22:11'),
	(78, 1, 47, '2024-08-23 08:37:09', '2024-08-23 08:37:09'),
	(79, 1, 46, '2024-08-23 08:37:10', '2024-08-23 08:37:10'),
	(80, 1, 45, '2024-08-23 08:37:11', '2024-08-23 08:37:11'),
	(81, 1, 44, '2024-08-23 08:37:12', '2024-08-23 08:37:12'),
	(82, 1, 43, '2024-08-23 08:37:13', '2024-08-23 08:37:13'),
	(83, 1, 50, '2024-10-16 01:05:30', '2024-10-16 01:05:30'),
	(84, 1, 51, '2024-10-16 01:15:35', '2024-10-16 01:15:35'),
	(89, 1, 56, '2024-10-16 01:44:57', '2024-10-16 01:44:57'),
	(101, 8, 64, '2024-10-24 01:46:12', '2024-10-24 01:46:12'),
	(102, 8, 66, '2024-10-24 01:46:12', '2024-10-24 01:46:12'),
	(103, 8, 68, '2024-10-24 01:46:14', '2024-10-24 01:46:14'),
	(104, 8, 67, '2024-10-24 01:46:14', '2024-10-24 01:46:14'),
	(106, 8, 70, '2024-10-25 00:28:26', '2024-10-25 00:28:26'),
	(107, 8, 71, '2024-10-25 00:28:26', '2024-10-25 00:28:26'),
	(108, 8, 69, '2024-10-25 00:40:18', '2024-10-25 00:40:18');

-- Dumping structure for table simple_arsip.role_menus
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE IF NOT EXISTS `role_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_menus` bigint DEFAULT '0',
  `id_roles` bigint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_menus_id_menus_index` (`id_menus`),
  KEY `role_menus_id_roles_index` (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.role_menus: ~12 rows (approximately)
DELETE FROM `role_menus`;
INSERT INTO `role_menus` (`id`, `id_menus`, `id_roles`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2024-07-29 08:17:32', '2024-07-29 08:17:34'),
	(5, 4, 1, NULL, NULL),
	(6, 1, 2, '2024-08-18 07:32:36', '2024-08-18 07:32:36'),
	(10, 1, 4, '2024-08-18 07:43:31', '2024-08-18 07:43:31'),
	(14, 5, 1, '2024-08-19 07:13:10', '2024-08-19 07:13:10'),
	(15, 2, 1, '2024-08-23 08:36:54', '2024-08-23 08:36:54'),
	(16, 7, 1, '2024-08-23 08:36:54', '2024-08-23 08:36:54'),
	(17, 8, 1, '2024-08-23 08:36:54', '2024-08-23 08:36:54'),
	(18, 9, 1, '2024-08-23 08:36:54', '2024-08-23 08:36:54'),
	(19, 10, 1, '2024-08-23 08:36:54', '2024-08-23 08:36:54'),
	(24, 17, 8, '2024-10-23 23:37:03', '2024-10-23 23:37:03'),
	(25, 17, 2, '2024-10-23 23:38:04', '2024-10-23 23:38:04'),
	(26, 17, 1, '2024-10-23 23:38:10', '2024-10-23 23:38:10');

-- Dumping structure for table simple_arsip.role_menu_accesses
DROP TABLE IF EXISTS `role_menu_accesses`;
CREATE TABLE IF NOT EXISTS `role_menu_accesses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_menus` bigint DEFAULT NULL,
  `id_roles` bigint DEFAULT NULL,
  `access_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_menu_accesses_id_menus_index` (`id_menus`),
  KEY `role_menu_accesses_id_roles_index` (`id_roles`),
  KEY `role_menu_accesses_access_code_index` (`access_code`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.role_menu_accesses: ~20 rows (approximately)
DELETE FROM `role_menu_accesses`;
INSERT INTO `role_menu_accesses` (`id`, `id_menus`, `id_roles`, `access_code`, `created_at`, `updated_at`) VALUES
	(14, 1, 1, 'C', '2024-08-19 06:57:21', '2024-08-19 06:57:21'),
	(15, 1, 1, 'U', '2024-08-19 06:57:22', '2024-08-19 06:57:22'),
	(20, 4, 1, 'U', '2024-08-19 06:57:26', '2024-08-19 06:57:26'),
	(21, 4, 1, 'C', '2024-08-19 06:57:27', '2024-08-19 06:57:27'),
	(22, 1, 1, 'D', '2024-08-19 06:58:16', '2024-08-19 06:58:16'),
	(23, 4, 1, 'D', '2024-08-19 06:58:16', '2024-08-19 06:58:16'),
	(26, 1, 2, 'C', '2024-08-19 06:58:58', '2024-08-19 06:58:58'),
	(27, 1, 2, 'U', '2024-08-19 06:58:59', '2024-08-19 06:58:59'),
	(28, 1, 2, 'D', '2024-08-19 06:59:00', '2024-08-19 06:59:00'),
	(29, 1, 2, 'P', '2024-08-19 06:59:01', '2024-08-19 06:59:01'),
	(33, 1, 1, 'P', '2024-08-19 07:01:56', '2024-08-19 07:01:56'),
	(34, 4, 1, 'P', '2024-08-19 07:01:56', '2024-08-19 07:01:56'),
	(40, 5, 1, 'C', '2024-08-19 07:13:14', '2024-08-19 07:13:14'),
	(41, 5, 1, 'U', '2024-08-19 07:13:15', '2024-08-19 07:13:15'),
	(42, 5, 1, 'D', '2024-08-19 07:13:15', '2024-08-19 07:13:15'),
	(43, 5, 1, 'P', '2024-08-19 07:13:16', '2024-08-19 07:13:16'),
	(47, 2, 1, 'C', '2024-08-23 08:37:00', '2024-08-23 08:37:00'),
	(48, 2, 1, 'D', '2024-08-23 08:37:01', '2024-08-23 08:37:01'),
	(49, 2, 1, 'U', '2024-08-23 08:37:01', '2024-08-23 08:37:01'),
	(50, 2, 1, 'P', '2024-08-23 08:37:02', '2024-08-23 08:37:02');

-- Dumping structure for table simple_arsip.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_role` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_role_index` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table simple_arsip.users: ~2 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `id_role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Ardyn Sulaeman', 'ardyn.sulaeman@gmail.com', NULL, '$2y$10$ILFxPOJoflX2r6x2nqtxweP2vQHcev2rtSGZl8VQXqIRh3AdOIdaS', NULL, '2024-07-24 21:07:40', '2024-07-24 21:07:40'),
	(3, 8, 'Admin Aplikasi', 'lemanfoetra@gmail.com', NULL, '$2y$10$nNgTHenLMbmP8GcE4uD.he95.kqobarrCSKhyBnkHk47u5KUNBDLi', NULL, '2024-08-18 07:49:55', '2024-08-18 07:49:55'),
	(4, 8, 'Guest', 'guest@gmail.com', NULL, '$2y$10$LxWy5lQlqv8ZfdsGOMsvdeUos67GucmuMLOeghkCrc7DhYjwo9c.S', NULL, '2024-10-23 23:38:59', '2024-10-23 23:38:59');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
