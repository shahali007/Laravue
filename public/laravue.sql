-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2019 at 04:37 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravue`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('1577f587c0a29a22c921d4c9a786b1021d8794d1dc26b6aa739621b4bf7930713d9cb4119c6fbeb3', 50, 1, 'Testing', '[]', 1, '2019-05-15 22:01:09', '2019-05-15 22:01:09', '2020-05-16 04:01:09'),
('92ae313618fd1012658bcc341947215b5936dbc07a22b0aa4274ef620762d8382fb35af7ae8357b0', 50, 1, 'Testing', '[]', 0, '2019-05-15 22:01:53', '2019-05-15 22:01:53', '2020-05-16 04:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'LxFtkuc63RisHQEPrlu4fgsdDoOA94z7UDd53Dec', 'http://localhost', 1, 0, 0, '2019-05-14 23:14:59', '2019-05-14 23:14:59'),
(2, NULL, 'Laravel Password Grant Client', 'FuXsnU8LhN04FaUGbJY7GF7vtLOippAiC8pUvk6E', 'http://localhost', 0, 1, 0, '2019-05-14 23:15:01', '2019-05-14 23:15:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-05-14 23:15:00', '2019-05-14 23:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(34, 'Shahali Bogdadi', 'shahali@laravue.com', NULL, '$2y$10$aNja1QwVz9tDLRnsIE6JLeP8au/QbPKiZC.H6obsHg/XhoNP9HYbm', NULL, '2019-05-13 06:27:25', '2019-05-14 03:50:01'),
(35, 'Al Helal', 'helal@laravue.com', NULL, '$2y$10$OATW.vbz/oqYSAqfJoYqzOMas.H7mSZWQcwmihcknefKL/WjbQreG', NULL, '2019-05-13 22:37:25', '2019-05-13 22:37:25'),
(37, 'Saiful Islam', 'saiful@laravue.com', NULL, '$2y$10$Aj6WD0ejg0rynvvL.eh5QO6Zpd6qlsdw8VJPUYaTseJ4u/CjGfBZm', NULL, '2019-05-14 03:51:12', '2019-05-14 03:51:12'),
(38, 'Rasel', 'rasel@laravue.com', NULL, '$2y$10$3p2ozxihd5tINxn2Rrd3yueI4BOfcZy3rroE8ozXYB3tNZQK2zE76', NULL, '2019-05-14 03:51:31', '2019-05-14 03:51:31'),
(39, 'Abdul Kayum', 'kayum@laravue.com', NULL, '$2y$10$wkQqYIGZ0vhzIvgdXO2q0.2OjlfrdLe7cGTom30IFpU8T6nAzjgzK', NULL, '2019-05-14 03:51:49', '2019-05-14 03:51:49'),
(40, 'Md. Sohel', 'sohel@laravue.com', NULL, '$2y$10$Cw/agQIh2EgmdKuZ1U/91uATYHWQuiRDWPAJzGRbsi0O06FYN3OPm', NULL, '2019-05-14 03:52:09', '2019-05-14 03:52:09'),
(41, 'Abdullah Al Faysal', 'faysal@laravue.com', NULL, '$2y$10$JXXJvVgXuKyzrfDSrdXArOvO5hTZX5OszBvgXwdPquQgQYcZqYR.S', NULL, '2019-05-14 03:52:38', '2019-05-14 03:52:38'),
(43, 'Habib', 'habib@laravue.com', NULL, '$2y$10$AXc/nKV3Kx1mhJ5rWR/9fuU9T6iobrVpj5zL58SVQiw5rS1IZztVy', NULL, '2019-05-14 03:53:14', '2019-05-14 03:53:14'),
(44, 'Abdul Jalil', 'jalil@laravue.com', NULL, '$2y$10$jqZD.Nupi55LI7fx7xsA8.mmzq6bF7BzCi8vzvyAPAXVa/sBSDFlq', NULL, '2019-05-14 03:53:31', '2019-05-14 03:53:31'),
(45, 'Abdul Jabbar', 'jabbar@laravue.com', NULL, '$2y$10$3y8RPgWM6GBme6vom1yjnenBsQ5/dwDZbUEoERYFa9id5uLGuc8Ka', NULL, '2019-05-14 03:53:54', '2019-05-14 03:53:54'),
(46, 'Tajul Islam', 'tajul@laravue.com', NULL, '$2y$10$FN2C6evY.RXItfedlVTgj.UJh3UBHgidvkaQwzLWCLsd0wA/sJ2hS', NULL, '2019-05-14 03:54:41', '2019-05-14 03:57:08'),
(47, 'Abdullah Al Mamun', 'mamun@laravue.com', NULL, '$2y$10$ed0BcNhxhBY6jYgVDalb7ee6BkjZ/.qH19JMQPkGHyAeuz7JYMogq', NULL, '2019-05-14 03:57:46', '2019-05-14 03:59:52'),
(48, 'Ashik Hasan', 'ashik@laravue.com', NULL, '$2y$10$TrPNqYpKoywe3KWMXZkume9q6codVyweAKJbtDexETsqpFUMhBZoG', NULL, '2019-05-14 06:21:51', '2019-05-14 10:36:18'),
(49, 'Abdul Jabbar', 'ajabbar@laravue.com', NULL, '$2y$10$wudRQ5KrTeZBWDUuCIYUUO.wkYtWGqC3Abd.1enzchtjNYes3AZ/m', NULL, '2019-05-14 10:37:36', '2019-05-19 07:01:31'),
(50, 'Rimon', 'rimon@laravue.com', NULL, '$2y$10$GJjhgJ2/qGRiwnrVhqYhmuc20OqumxKdR75c0RSSPZpOaaUZT0mBS', NULL, '2019-05-14 11:18:27', '2019-05-14 11:18:40'),
(51, 'Jonayed islam', 'jonayed@laravue.com', NULL, '$2y$10$ARbrjBYIg0qSZ1sYmbt6AeNxovGc.VcBDnJEKhRbFteg7gkaSWja6', NULL, '2019-05-16 07:29:17', '2019-05-16 07:29:17'),
(54, 'Rakib Siddiquee', 'rakib@laravue.com', NULL, '$2y$10$nFVHnb2ITQUw7RZpCefNd.4sX9RMKQ67L0aMunUfouAsbbvAREHHy', NULL, '2019-05-19 06:52:03', '2019-05-19 06:52:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
