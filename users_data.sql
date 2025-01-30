-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Jan 2025 um 18:15
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `oliver_rein`
--

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `name`, `email_verified_at`, `password`, `users_rights_id`, `profile_photo_path`, `is_admin`, `is_employee`, `is_customer`, `admin_id`, `company_id`, `customer_id`, `last_login_at`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Kiss', 'U', 'KissYou@example.com', 'KissU', '2025-01-10 14:58:58', '$2y$12$xmseqPoBKtL.VWc4w0yZAePcMwNY4ocIjIFgLYFYbYUrufAxuhXvG', 1, 'images/profile/008.jpg', 1, 0, 0, 2, NULL, NULL, '2025-01-30 16:31:49', NULL, NULL, '2025-01-20 17:38:47', NULL, '2025-01-10 14:58:58', '2025-01-30 16:31:49');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
