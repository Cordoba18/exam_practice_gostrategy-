-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2024 a las 20:54:41
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `exam_practice_gostrategy_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `communes`
--

CREATE TABLE `communes` (
  `id_com` int(11) NOT NULL,
  `id_reg` int(11) NOT NULL,
  `description` varchar(95) NOT NULL,
  `status` enum('A','I','trash') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `communes`
--

INSERT INTO `communes` (`id_com`, `id_reg`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Santiago', 'A', NULL, NULL),
(2, 1, 'San bernando', 'A', NULL, NULL),
(3, 1, 'Puente alto', 'A', NULL, NULL),
(4, 2, 'Valparaíso', 'A', NULL, NULL),
(5, 2, 'San Antonio', 'A', NULL, NULL),
(6, 3, 'Concepción', 'A', NULL, NULL),
(7, 3, 'Los Ángeles', 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `dni` int(11) NOT NULL,
  `id_reg` int(11) NOT NULL,
  `id_com` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_reg` datetime NOT NULL,
  `status` enum('A','I','trash') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`dni`, `id_reg`, `id_com`, `email`, `name`, `lastname`, `address`, `date_reg`, `status`, `created_at`, `updated_at`) VALUES
(412, 1, 2, 'jccq12@gmail.com', 'Jhan Carlos', 'Cordoba Quiñonez', 'Calle 28 #86-29, Cali, Valle del Cauca, Colombia', '2024-08-22 00:00:00', 'I', '2024-08-31 23:53:43', '2024-08-31 23:53:49'),
(11116, 1, 2, 'jccq12@gmail.com', 'Jhan Carlos', 'Cordoba Quiñonez', 'Calle 28 #86-29, Cali, Valle del Cauca, Colombia', '2024-08-06 00:00:00', 'I', '2024-08-31 22:26:36', '2024-08-31 23:50:01'),
(45124124, 2, 5, 'jccq12@gmail.com', 'Jhan Carlos', 'Cordoba Quiñonez', 'Calle 28 #86-29, Cali, Valle del Cauca, Colombia', '2024-08-31 00:00:00', 'A', '2024-08-31 23:53:28', '2024-08-31 23:53:28'),
(1111661512, 1, 2, 'jccq12@gmail.com', 'Jhan Carlos', 'Cordoba Quiñonez', 'Calle 28 #86-29, Cali, Valle del Cauca, Colombia', '2024-07-29 00:00:00', 'I', '2024-08-31 22:15:12', '2024-08-31 23:49:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `type`, `ip`, `url`, `method`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 17:59:02', '2024-08-31 17:59:02'),
(2, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 17:59:02', '2024-08-31 17:59:02'),
(3, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 17:59:03', '2024-08-31 17:59:03'),
(4, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"ypoStcOIGylEnR4Q0SRVdK0BmAZY2sxhDlhhvgpw\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 17:59:47', '2024-08-31 17:59:47'),
(5, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 17:59:47', '2024-08-31 17:59:47'),
(6, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logout', 'POST', '{\"_token\":\"ypoStcOIGylEnR4Q0SRVdK0BmAZY2sxhDlhhvgpw\"}', '2024-08-31 18:00:17', '2024-08-31 18:00:17'),
(7, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 18:00:17', '2024-08-31 18:00:17'),
(8, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy', 'GET', '[]', '2024-08-31 18:00:38', '2024-08-31 18:00:38'),
(9, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:00:38', '2024-08-31 18:00:38'),
(10, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 18:00:39', '2024-08-31 18:00:39'),
(11, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"LzurjzmMyIM7ncX8FQL6AEkL69CLkxJM3layL2Z1\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 18:00:43', '2024-08-31 18:00:43'),
(12, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:00:44', '2024-08-31 18:00:44'),
(13, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:01:49', '2024-08-31 18:01:49'),
(14, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:04:40', '2024-08-31 18:04:40'),
(15, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:04:41', '2024-08-31 18:04:41'),
(16, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:05:06', '2024-08-31 18:05:06'),
(17, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:05:07', '2024-08-31 18:05:07'),
(18, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:07:07', '2024-08-31 18:07:07'),
(19, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logout', 'POST', '{\"_token\":\"LzurjzmMyIM7ncX8FQL6AEkL69CLkxJM3layL2Z1\"}', '2024-08-31 18:07:10', '2024-08-31 18:07:10'),
(20, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 18:07:10', '2024-08-31 18:07:10'),
(21, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:07:14', '2024-08-31 18:07:14'),
(22, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 18:07:14', '2024-08-31 18:07:14'),
(23, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"x3rz6K5KH6DOBL2qzRVQmzrZLAXqmQBWstrrOkGI\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 18:07:17', '2024-08-31 18:07:17'),
(24, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:07:18', '2024-08-31 18:07:18'),
(25, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:09:32', '2024-08-31 18:09:32'),
(26, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:09:33', '2024-08-31 18:09:33'),
(27, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logout', 'POST', '{\"_token\":\"x3rz6K5KH6DOBL2qzRVQmzrZLAXqmQBWstrrOkGI\"}', '2024-08-31 18:09:35', '2024-08-31 18:09:35'),
(28, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 18:09:35', '2024-08-31 18:09:35'),
(29, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"s8Mp3zkhnRdmWlnFBDrfjdwU3ja1zJFxp2b2C6fK\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 18:09:39', '2024-08-31 18:09:39'),
(30, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:09:40', '2024-08-31 18:09:40'),
(31, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:10:15', '2024-08-31 18:10:15'),
(32, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:12:16', '2024-08-31 18:12:16'),
(33, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:12:40', '2024-08-31 18:12:40'),
(34, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:12:41', '2024-08-31 18:12:41'),
(35, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:13:21', '2024-08-31 18:13:21'),
(36, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:13:39', '2024-08-31 18:13:39'),
(37, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:13:39', '2024-08-31 18:13:39'),
(38, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:15:11', '2024-08-31 18:15:11'),
(39, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:15:11', '2024-08-31 18:15:11'),
(40, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:15:26', '2024-08-31 18:15:26'),
(41, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:15:26', '2024-08-31 18:15:26'),
(42, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:15:58', '2024-08-31 18:15:58'),
(43, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:15:58', '2024-08-31 18:15:58'),
(44, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:16:08', '2024-08-31 18:16:08'),
(45, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:16:08', '2024-08-31 18:16:08'),
(46, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:16:28', '2024-08-31 18:16:28'),
(47, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:16:28', '2024-08-31 18:16:28'),
(48, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:16:34', '2024-08-31 18:16:34'),
(49, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:16:35', '2024-08-31 18:16:35'),
(50, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:16:48', '2024-08-31 18:16:48'),
(51, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:16:48', '2024-08-31 18:16:48'),
(52, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:19:21', '2024-08-31 18:19:21'),
(53, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:19:22', '2024-08-31 18:19:22'),
(54, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:27:04', '2024-08-31 18:27:04'),
(55, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:27:04', '2024-08-31 18:27:04'),
(56, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:27:15', '2024-08-31 18:27:15'),
(57, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:27:15', '2024-08-31 18:27:15'),
(58, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:27:16', '2024-08-31 18:27:16'),
(59, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:27:26', '2024-08-31 18:27:26'),
(60, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 18:27:41', '2024-08-31 18:27:41'),
(61, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:27:42', '2024-08-31 18:27:42'),
(62, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:27:42', '2024-08-31 18:27:42'),
(63, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:32:49', '2024-08-31 18:32:49'),
(64, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:32:49', '2024-08-31 18:32:49'),
(65, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:33:06', '2024-08-31 18:33:06'),
(66, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:33:06', '2024-08-31 18:33:06'),
(67, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:33:21', '2024-08-31 18:33:21'),
(68, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:33:22', '2024-08-31 18:33:22'),
(69, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:34:26', '2024-08-31 18:34:26'),
(70, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:34:27', '2024-08-31 18:34:27'),
(71, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:39:52', '2024-08-31 18:39:52'),
(72, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:39:53', '2024-08-31 18:39:53'),
(73, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:47:07', '2024-08-31 18:47:07'),
(74, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:47:07', '2024-08-31 18:47:07'),
(75, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:47:19', '2024-08-31 18:47:19'),
(76, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:47:19', '2024-08-31 18:47:19'),
(77, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:47:29', '2024-08-31 18:47:29'),
(78, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:47:29', '2024-08-31 18:47:29'),
(79, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:47:39', '2024-08-31 18:47:39'),
(80, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:47:39', '2024-08-31 18:47:39'),
(81, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 18:47:42', '2024-08-31 18:47:42'),
(82, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:51:08', '2024-08-31 18:51:08'),
(83, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:51:08', '2024-08-31 18:51:08'),
(84, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 18:51:08', '2024-08-31 18:51:08'),
(85, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:52:25', '2024-08-31 18:52:25'),
(86, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:52:25', '2024-08-31 18:52:25'),
(87, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:54:39', '2024-08-31 18:54:39'),
(88, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:54:39', '2024-08-31 18:54:39'),
(89, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:55:21', '2024-08-31 18:55:21'),
(90, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:55:21', '2024-08-31 18:55:21'),
(91, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:55:49', '2024-08-31 18:55:49'),
(92, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:55:50', '2024-08-31 18:55:50'),
(93, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:56:15', '2024-08-31 18:56:15'),
(94, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:56:15', '2024-08-31 18:56:15'),
(95, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:57:31', '2024-08-31 18:57:31'),
(96, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 18:57:31', '2024-08-31 18:57:31'),
(97, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:57:31', '2024-08-31 18:57:31'),
(98, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 18:58:28', '2024-08-31 18:58:28'),
(99, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 18:58:28', '2024-08-31 18:58:28'),
(100, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 18:58:28', '2024-08-31 18:58:28'),
(101, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:00:06', '2024-08-31 19:00:06'),
(102, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:00:06', '2024-08-31 19:00:06'),
(103, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:00:06', '2024-08-31 19:00:06'),
(104, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:00:35', '2024-08-31 19:00:35'),
(105, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:00:35', '2024-08-31 19:00:35'),
(106, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:00:35', '2024-08-31 19:00:35'),
(107, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logout', 'POST', '{\"_token\":\"s8Mp3zkhnRdmWlnFBDrfjdwU3ja1zJFxp2b2C6fK\"}', '2024-08-31 19:00:37', '2024-08-31 19:00:37'),
(108, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 19:00:37', '2024-08-31 19:00:37'),
(109, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"LDE6z12tAdIRJvXDdO06Wndohs9k43GvkU52gdnd\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 19:00:42', '2024-08-31 19:00:42'),
(110, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:00:43', '2024-08-31 19:00:43'),
(111, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:00:59', '2024-08-31 19:00:59'),
(112, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:01:03', '2024-08-31 19:01:03'),
(113, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:01:03', '2024-08-31 19:01:03'),
(114, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:01:03', '2024-08-31 19:01:03'),
(115, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:01:19', '2024-08-31 19:01:19'),
(116, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:01:19', '2024-08-31 19:01:19'),
(117, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:01:19', '2024-08-31 19:01:19'),
(118, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logout', 'POST', '{\"_token\":\"LDE6z12tAdIRJvXDdO06Wndohs9k43GvkU52gdnd\"}', '2024-08-31 19:01:27', '2024-08-31 19:01:27'),
(119, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 19:01:27', '2024-08-31 19:01:27'),
(120, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"k3MimOPo0JzTcHOUi8MqoILKaZwlb8oDQYiYpMC6\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 19:01:31', '2024-08-31 19:01:31'),
(121, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:01:31', '2024-08-31 19:01:31'),
(122, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:01:34', '2024-08-31 19:01:34'),
(123, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:01:34', '2024-08-31 19:01:34'),
(124, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:01:34', '2024-08-31 19:01:34'),
(125, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:03:38', '2024-08-31 19:03:38'),
(126, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:03:38', '2024-08-31 19:03:38'),
(127, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:03:38', '2024-08-31 19:03:38'),
(128, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:03:40', '2024-08-31 19:03:40'),
(129, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:03:41', '2024-08-31 19:03:41'),
(130, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:03:42', '2024-08-31 19:03:42'),
(131, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:03:42', '2024-08-31 19:03:42'),
(132, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:04:46', '2024-08-31 19:04:46'),
(133, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:04:46', '2024-08-31 19:04:46'),
(134, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:04:46', '2024-08-31 19:04:46'),
(135, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:06:13', '2024-08-31 19:06:13'),
(136, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:06:13', '2024-08-31 19:06:13'),
(137, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:06:13', '2024-08-31 19:06:13'),
(138, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:06:46', '2024-08-31 19:06:46'),
(139, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:06:46', '2024-08-31 19:06:46'),
(140, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:06:46', '2024-08-31 19:06:46'),
(141, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:07:14', '2024-08-31 19:07:14'),
(142, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:07:14', '2024-08-31 19:07:14'),
(143, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:07:14', '2024-08-31 19:07:14'),
(144, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:07:38', '2024-08-31 19:07:38'),
(145, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:07:38', '2024-08-31 19:07:38'),
(146, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:07:38', '2024-08-31 19:07:38'),
(147, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logout', 'POST', '{\"_token\":\"k3MimOPo0JzTcHOUi8MqoILKaZwlb8oDQYiYpMC6\"}', '2024-08-31 19:07:56', '2024-08-31 19:07:56'),
(148, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 19:07:56', '2024-08-31 19:07:56'),
(149, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"GMzlidn1XGaclawhGzot0oUAR37mp0iBFbC5uumo\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 19:08:04', '2024-08-31 19:08:04'),
(150, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:08:04', '2024-08-31 19:08:04'),
(151, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:08:06', '2024-08-31 19:08:06'),
(152, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:08:06', '2024-08-31 19:08:06'),
(153, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:08:06', '2024-08-31 19:08:06'),
(154, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logout', 'POST', '{\"_token\":\"GMzlidn1XGaclawhGzot0oUAR37mp0iBFbC5uumo\"}', '2024-08-31 19:08:16', '2024-08-31 19:08:16'),
(155, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 19:08:16', '2024-08-31 19:08:16'),
(156, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"h86ZVaOV7ufrwKfvQXVMZNWaq3JLAyFk6ylRMP6y\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 19:08:23', '2024-08-31 19:08:23'),
(157, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:08:23', '2024-08-31 19:08:23'),
(158, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:08:26', '2024-08-31 19:08:26'),
(159, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/custommers.js', 'GET', '[]', '2024-08-31 19:08:26', '2024-08-31 19:08:26'),
(160, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:08:26', '2024-08-31 19:08:26'),
(161, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:41:59', '2024-08-31 19:41:59'),
(162, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:41:59', '2024-08-31 19:41:59'),
(163, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:41:59', '2024-08-31 19:41:59'),
(164, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:42:03', '2024-08-31 19:42:03'),
(165, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:42:07', '2024-08-31 19:42:07'),
(166, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:42:07', '2024-08-31 19:42:07'),
(167, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:07', '2024-08-31 19:42:07'),
(168, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:42:07', '2024-08-31 19:42:07'),
(169, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:32', '2024-08-31 19:42:32'),
(170, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:53', '2024-08-31 19:42:53'),
(171, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:54', '2024-08-31 19:42:54'),
(172, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:54', '2024-08-31 19:42:54'),
(173, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:55', '2024-08-31 19:42:55'),
(174, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:55', '2024-08-31 19:42:55'),
(175, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:56', '2024-08-31 19:42:56'),
(176, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:56', '2024-08-31 19:42:56'),
(177, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:56', '2024-08-31 19:42:56'),
(178, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:56', '2024-08-31 19:42:56'),
(179, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:42:57', '2024-08-31 19:42:57'),
(180, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:43:02', '2024-08-31 19:43:02'),
(181, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:43:05', '2024-08-31 19:43:05'),
(182, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:43:06', '2024-08-31 19:43:06'),
(183, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:43:06', '2024-08-31 19:43:06'),
(184, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:43:06', '2024-08-31 19:43:06'),
(185, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:43:48', '2024-08-31 19:43:48'),
(186, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:43:48', '2024-08-31 19:43:48'),
(187, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:43:48', '2024-08-31 19:43:48'),
(188, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:43:48', '2024-08-31 19:43:48'),
(189, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logout', 'POST', '{\"_token\":\"h86ZVaOV7ufrwKfvQXVMZNWaq3JLAyFk6ylRMP6y\"}', '2024-08-31 19:43:55', '2024-08-31 19:43:55'),
(190, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/login', 'GET', '[]', '2024-08-31 19:43:55', '2024-08-31 19:43:55'),
(191, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:43:55', '2024-08-31 19:43:55'),
(192, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/logueo', 'POST', '{\"_token\":\"mjvCVwjun7jp6ozMI4MMXOrxb2NLcq0Gp32EWDKD\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 19:43:59', '2024-08-31 19:43:59'),
(193, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:43:59', '2024-08-31 19:43:59'),
(194, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:44:00', '2024-08-31 19:44:00'),
(195, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:44:02', '2024-08-31 19:44:02'),
(196, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:44:03', '2024-08-31 19:44:03'),
(197, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:44:03', '2024-08-31 19:44:03'),
(198, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:44:03', '2024-08-31 19:44:03'),
(199, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:44:07', '2024-08-31 19:44:07'),
(200, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:44:08', '2024-08-31 19:44:08'),
(201, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:44:09', '2024-08-31 19:44:09'),
(202, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:44:10', '2024-08-31 19:44:10'),
(203, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:44:10', '2024-08-31 19:44:10'),
(204, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:44:10', '2024-08-31 19:44:10'),
(205, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:44:22', '2024-08-31 19:44:22'),
(206, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:44:22', '2024-08-31 19:44:22'),
(207, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:44:22', '2024-08-31 19:44:22'),
(208, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:44:23', '2024-08-31 19:44:23'),
(209, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:44:38', '2024-08-31 19:44:38'),
(210, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:44:38', '2024-08-31 19:44:38'),
(211, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:44:38', '2024-08-31 19:44:38'),
(212, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:44:41', '2024-08-31 19:44:41'),
(213, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:44:41', '2024-08-31 19:44:41'),
(214, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:44:41', '2024-08-31 19:44:41'),
(215, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:44:59', '2024-08-31 19:44:59'),
(216, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:44:59', '2024-08-31 19:44:59'),
(217, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:44:59', '2024-08-31 19:44:59'),
(218, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:45:25', '2024-08-31 19:45:25'),
(219, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:45:25', '2024-08-31 19:45:25'),
(220, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:45:27', '2024-08-31 19:45:27'),
(221, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:45:30', '2024-08-31 19:45:30'),
(222, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:45:31', '2024-08-31 19:45:31'),
(223, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:45:31', '2024-08-31 19:45:31'),
(224, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:45:38', '2024-08-31 19:45:38'),
(225, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:45:38', '2024-08-31 19:45:38'),
(226, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:45:38', '2024-08-31 19:45:38'),
(227, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:45:59', '2024-08-31 19:45:59'),
(228, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:45:59', '2024-08-31 19:45:59'),
(229, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/js/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:45:59', '2024-08-31 19:45:59'),
(230, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:46:00', '2024-08-31 19:46:00'),
(231, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:46:00', '2024-08-31 19:46:00'),
(232, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:46:00', '2024-08-31 19:46:00'),
(233, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/js/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:46:01', '2024-08-31 19:46:01'),
(234, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:46:01', '2024-08-31 19:46:01'),
(235, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:46:04', '2024-08-31 19:46:04'),
(236, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:46:04', '2024-08-31 19:46:04'),
(237, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/js/js/get_my_token.js', 'GET', '[]', '2024-08-31 19:46:04', '2024-08-31 19:46:04'),
(238, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:46:04', '2024-08-31 19:46:04'),
(239, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:46:20', '2024-08-31 19:46:20'),
(240, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:46:20', '2024-08-31 19:46:20'),
(241, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:46:21', '2024-08-31 19:46:21'),
(242, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home', 'GET', '[]', '2024-08-31 19:46:26', '2024-08-31 19:46:26'),
(243, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:46:27', '2024-08-31 19:46:27'),
(244, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:46:31', '2024-08-31 19:46:31'),
(245, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/js/customers.js', 'GET', '[]', '2024-08-31 19:46:32', '2024-08-31 19:46:32'),
(246, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:46:32', '2024-08-31 19:46:32'),
(247, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:46:52', '2024-08-31 19:46:52'),
(248, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:46:55', '2024-08-31 19:46:55'),
(249, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:47:53', '2024-08-31 19:47:53'),
(250, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:47:54', '2024-08-31 19:47:54'),
(251, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:48:06', '2024-08-31 19:48:06'),
(252, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:48:07', '2024-08-31 19:48:07'),
(253, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:48:17', '2024-08-31 19:48:17'),
(254, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:48:17', '2024-08-31 19:48:17'),
(255, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:48:23', '2024-08-31 19:48:23'),
(256, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:48:24', '2024-08-31 19:48:24'),
(257, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:48:24', '2024-08-31 19:48:24'),
(258, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:48:25', '2024-08-31 19:48:25'),
(259, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:48:37', '2024-08-31 19:48:37'),
(260, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:48:37', '2024-08-31 19:48:37'),
(261, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:49:50', '2024-08-31 19:49:50'),
(262, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:49:50', '2024-08-31 19:49:50'),
(263, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:52:08', '2024-08-31 19:52:08'),
(264, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:52:08', '2024-08-31 19:52:08'),
(265, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:52:30', '2024-08-31 19:52:30'),
(266, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:52:30', '2024-08-31 19:52:30'),
(267, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:52:41', '2024-08-31 19:52:41'),
(268, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:52:42', '2024-08-31 19:52:42'),
(269, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:53:00', '2024-08-31 19:53:00'),
(270, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:53:01', '2024-08-31 19:53:01'),
(271, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:53:12', '2024-08-31 19:53:12'),
(272, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:53:13', '2024-08-31 19:53:13'),
(273, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:53:13', '2024-08-31 19:53:13'),
(274, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:53:14', '2024-08-31 19:53:14'),
(275, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:53:14', '2024-08-31 19:53:14'),
(276, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:53:15', '2024-08-31 19:53:15'),
(277, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:53:25', '2024-08-31 19:53:25');
INSERT INTO `logs` (`id`, `type`, `ip`, `url`, `method`, `message`, `created_at`, `updated_at`) VALUES
(278, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:53:26', '2024-08-31 19:53:26'),
(279, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:53:48', '2024-08-31 19:53:48'),
(280, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:53:48', '2024-08-31 19:53:48'),
(281, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:54:02', '2024-08-31 19:54:02'),
(282, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:54:03', '2024-08-31 19:54:03'),
(283, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:54:27', '2024-08-31 19:54:27'),
(284, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:54:28', '2024-08-31 19:54:28'),
(285, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:54:56', '2024-08-31 19:54:56'),
(286, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:54:57', '2024-08-31 19:54:57'),
(287, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/home/customers', 'GET', '[]', '2024-08-31 19:55:35', '2024-08-31 19:55:35'),
(288, 'Entrada', '::1', 'http://localhost/exam_practice_gostrategy-/exam_practice_gostrategy/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:55:36', '2024-08-31 19:55:36'),
(289, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000', 'GET', '[]', '2024-08-31 19:55:39', '2024-08-31 19:55:39'),
(290, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 19:55:40', '2024-08-31 19:55:40'),
(291, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 19:55:40', '2024-08-31 19:55:40'),
(292, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 19:55:43', '2024-08-31 19:55:43'),
(293, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:55:44', '2024-08-31 19:55:44'),
(294, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulko1\"}', '2024-08-31 19:55:47', '2024-08-31 19:55:47'),
(295, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 19:55:48', '2024-08-31 19:55:48'),
(296, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:55:48', '2024-08-31 19:55:48'),
(297, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 19:55:52', '2024-08-31 19:55:52'),
(298, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 19:55:53', '2024-08-31 19:55:53'),
(299, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:55:53', '2024-08-31 19:55:53'),
(300, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 19:55:55', '2024-08-31 19:55:55'),
(301, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 19:55:56', '2024-08-31 19:55:56'),
(302, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers/get_regiones?token=fa5275f9cd6ceb05f6356257e150b087ca45e96b', 'GET', '{\"token\":\"fa5275f9cd6ceb05f6356257e150b087ca45e96b\"}', '2024-08-31 19:55:56', '2024-08-31 19:55:56'),
(303, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:04:42', '2024-08-31 20:04:42'),
(304, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:04:43', '2024-08-31 20:04:43'),
(305, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=fa5275f9cd6ceb05f6356257e150b087ca45e96b', 'GET', '{\"token\":\"fa5275f9cd6ceb05f6356257e150b087ca45e96b\"}', '2024-08-31 20:04:43', '2024-08-31 20:04:43'),
(306, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:05:05', '2024-08-31 20:05:05'),
(307, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:05:05', '2024-08-31 20:05:05'),
(308, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:05:28', '2024-08-31 20:05:28'),
(309, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:05:29', '2024-08-31 20:05:29'),
(310, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=fa5275f9cd6ceb05f6356257e150b087ca45e96b', 'GET', '{\"token\":\"fa5275f9cd6ceb05f6356257e150b087ca45e96b\"}', '2024-08-31 20:05:29', '2024-08-31 20:05:29'),
(311, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:08:17', '2024-08-31 20:08:17'),
(312, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:08:18', '2024-08-31 20:08:18'),
(313, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=fa5275f9cd6ceb05f6356257e150b087ca45e96b', 'GET', '{\"token\":\"fa5275f9cd6ceb05f6356257e150b087ca45e96b\"}', '2024-08-31 20:08:18', '2024-08-31 20:08:18'),
(314, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:08:29', '2024-08-31 20:08:29'),
(315, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:08:29', '2024-08-31 20:08:29'),
(316, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:09:25', '2024-08-31 20:09:25'),
(317, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:09:26', '2024-08-31 20:09:26'),
(318, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=fa5275f9cd6ceb05f6356257e150b087ca45e96b', 'GET', '{\"token\":\"fa5275f9cd6ceb05f6356257e150b087ca45e96b\"}', '2024-08-31 20:09:26', '2024-08-31 20:09:26'),
(319, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:09:47', '2024-08-31 20:09:47'),
(320, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:09:47', '2024-08-31 20:09:47'),
(321, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 20:09:48', '2024-08-31 20:09:48'),
(322, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:09:48', '2024-08-31 20:09:48'),
(323, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 20:10:07', '2024-08-31 20:10:07'),
(324, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:10:07', '2024-08-31 20:10:07'),
(325, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 20:10:09', '2024-08-31 20:10:09'),
(326, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:10:09', '2024-08-31 20:10:09'),
(327, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:10:10', '2024-08-31 20:10:10'),
(328, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:10:11', '2024-08-31 20:10:11'),
(329, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 20:10:14', '2024-08-31 20:10:14'),
(330, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:10:15', '2024-08-31 20:10:15'),
(331, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 20:10:24', '2024-08-31 20:10:24'),
(332, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:10:24', '2024-08-31 20:10:24'),
(333, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 20:10:30', '2024-08-31 20:10:30'),
(334, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 20:10:30', '2024-08-31 20:10:30'),
(335, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:10:31', '2024-08-31 20:10:31'),
(336, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:10:32', '2024-08-31 20:10:32'),
(337, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:10:32', '2024-08-31 20:10:32'),
(338, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:10:33', '2024-08-31 20:10:33'),
(339, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:10:52', '2024-08-31 20:10:52'),
(340, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:10:52', '2024-08-31 20:10:52'),
(341, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:10:52', '2024-08-31 20:10:52'),
(342, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:12:02', '2024-08-31 20:12:02'),
(343, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:12:03', '2024-08-31 20:12:03'),
(344, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:12:03', '2024-08-31 20:12:03'),
(345, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:12:28', '2024-08-31 20:12:28'),
(346, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:12:28', '2024-08-31 20:12:28'),
(347, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:12:28', '2024-08-31 20:12:28'),
(348, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:12:53', '2024-08-31 20:12:53'),
(349, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:12:53', '2024-08-31 20:12:53'),
(350, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:12:54', '2024-08-31 20:12:54'),
(351, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:13:09', '2024-08-31 20:13:09'),
(352, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:13:10', '2024-08-31 20:13:10'),
(353, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:13:10', '2024-08-31 20:13:10'),
(354, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:13:19', '2024-08-31 20:13:19'),
(355, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:13:20', '2024-08-31 20:13:20'),
(356, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:13:20', '2024-08-31 20:13:20'),
(357, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:13:41', '2024-08-31 20:13:41'),
(358, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:13:42', '2024-08-31 20:13:42'),
(359, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:13:42', '2024-08-31 20:13:42'),
(360, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:15:44', '2024-08-31 20:15:44'),
(361, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:15:45', '2024-08-31 20:15:45'),
(362, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=79769ba1fdc397c4918cfa11bbee72b392ce2f3f', 'GET', '{\"token\":\"79769ba1fdc397c4918cfa11bbee72b392ce2f3f\"}', '2024-08-31 20:15:45', '2024-08-31 20:15:45'),
(363, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 20:15:45', '2024-08-31 20:15:45'),
(364, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:15:46', '2024-08-31 20:15:46'),
(365, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 20:15:52', '2024-08-31 20:15:52'),
(366, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:15:52', '2024-08-31 20:15:52'),
(367, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 20:15:57', '2024-08-31 20:15:57'),
(368, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 20:15:57', '2024-08-31 20:15:57'),
(369, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:15:58', '2024-08-31 20:15:58'),
(370, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:16:00', '2024-08-31 20:16:00'),
(371, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:16:01', '2024-08-31 20:16:01'),
(372, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:16:01', '2024-08-31 20:16:01'),
(373, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:24:59', '2024-08-31 20:24:59'),
(374, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:24:59', '2024-08-31 20:24:59'),
(375, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:25:00', '2024-08-31 20:25:00'),
(376, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:01', '2024-08-31 20:25:01'),
(377, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:25:05', '2024-08-31 20:25:05'),
(378, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:25:05', '2024-08-31 20:25:05'),
(379, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:25:18', '2024-08-31 20:25:18'),
(380, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:25:19', '2024-08-31 20:25:19'),
(381, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:25:19', '2024-08-31 20:25:19'),
(382, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:21', '2024-08-31 20:25:21'),
(383, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:25:23', '2024-08-31 20:25:23'),
(384, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:25:23', '2024-08-31 20:25:23'),
(385, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:26', '2024-08-31 20:25:26'),
(386, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:26', '2024-08-31 20:25:26'),
(387, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:26', '2024-08-31 20:25:26'),
(388, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:26', '2024-08-31 20:25:26'),
(389, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:29', '2024-08-31 20:25:29'),
(390, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:30', '2024-08-31 20:25:30'),
(391, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:30', '2024-08-31 20:25:30'),
(392, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:30', '2024-08-31 20:25:30'),
(393, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:30', '2024-08-31 20:25:30'),
(394, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:30', '2024-08-31 20:25:30'),
(395, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:30', '2024-08-31 20:25:30'),
(396, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:25:31', '2024-08-31 20:25:31'),
(397, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:35', '2024-08-31 20:25:35'),
(398, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:35', '2024-08-31 20:25:35'),
(399, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:35', '2024-08-31 20:25:35'),
(400, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:35', '2024-08-31 20:25:35'),
(401, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:36', '2024-08-31 20:25:36'),
(402, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:36', '2024-08-31 20:25:36'),
(403, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:36', '2024-08-31 20:25:36'),
(404, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:36', '2024-08-31 20:25:36'),
(405, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:36', '2024-08-31 20:25:36'),
(406, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:36', '2024-08-31 20:25:36'),
(407, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:37', '2024-08-31 20:25:37'),
(408, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:37', '2024-08-31 20:25:37'),
(409, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:37', '2024-08-31 20:25:37'),
(410, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:37', '2024-08-31 20:25:37'),
(411, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:37', '2024-08-31 20:25:37'),
(412, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:25:37', '2024-08-31 20:25:37'),
(413, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:26:14', '2024-08-31 20:26:14'),
(414, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:26:15', '2024-08-31 20:26:15'),
(415, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:26:15', '2024-08-31 20:26:15'),
(416, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:26:16', '2024-08-31 20:26:16'),
(417, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:26:35', '2024-08-31 20:26:35'),
(418, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:26:35', '2024-08-31 20:26:35'),
(419, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:26:35', '2024-08-31 20:26:35'),
(420, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:26:37', '2024-08-31 20:26:37'),
(421, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:26:41', '2024-08-31 20:26:41'),
(422, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:26:46', '2024-08-31 20:26:46'),
(423, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:26:48', '2024-08-31 20:26:48'),
(424, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:26:51', '2024-08-31 20:26:51'),
(425, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:27:10', '2024-08-31 20:27:10'),
(426, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:27:11', '2024-08-31 20:27:11'),
(427, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:27:11', '2024-08-31 20:27:11'),
(428, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:38:18', '2024-08-31 20:38:18'),
(429, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:38:19', '2024-08-31 20:38:19'),
(430, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:38:21', '2024-08-31 20:38:21'),
(431, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:38:27', '2024-08-31 20:38:27'),
(432, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:38:27', '2024-08-31 20:38:27'),
(433, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 20:38:34', '2024-08-31 20:38:34'),
(434, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:38:36', '2024-08-31 20:38:36'),
(435, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:38:36', '2024-08-31 20:38:36'),
(436, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:43:24', '2024-08-31 20:43:24'),
(437, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:43:25', '2024-08-31 20:43:25'),
(438, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:43:29', '2024-08-31 20:43:29'),
(439, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:44:02', '2024-08-31 20:44:02'),
(440, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:44:03', '2024-08-31 20:44:03'),
(441, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:44:03', '2024-08-31 20:44:03'),
(442, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:44:14', '2024-08-31 20:44:14'),
(443, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:44:15', '2024-08-31 20:44:15'),
(444, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:44:15', '2024-08-31 20:44:15'),
(445, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:44:33', '2024-08-31 20:44:33'),
(446, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:44:34', '2024-08-31 20:44:34'),
(447, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:44:59', '2024-08-31 20:44:59'),
(448, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:45:00', '2024-08-31 20:45:00'),
(449, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:45:00', '2024-08-31 20:45:00'),
(450, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:45:06', '2024-08-31 20:45:06'),
(451, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:45:08', '2024-08-31 20:45:08'),
(452, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:45:10', '2024-08-31 20:45:10'),
(453, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:45:12', '2024-08-31 20:45:12'),
(454, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:45:13', '2024-08-31 20:45:13'),
(455, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:45:32', '2024-08-31 20:45:32'),
(456, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:45:33', '2024-08-31 20:45:33'),
(457, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:45:33', '2024-08-31 20:45:33'),
(458, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:50:00', '2024-08-31 20:50:00'),
(459, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:52:29', '2024-08-31 20:52:29'),
(460, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:52:32', '2024-08-31 20:52:32'),
(461, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:57:47', '2024-08-31 20:57:47'),
(462, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 20:57:48', '2024-08-31 20:57:48'),
(463, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:57:48', '2024-08-31 20:57:48'),
(464, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 20:57:50', '2024-08-31 20:57:50'),
(465, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 20:57:54', '2024-08-31 20:57:54'),
(466, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 20:57:56', '2024-08-31 20:57:56'),
(467, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 20:59:59', '2024-08-31 20:59:59'),
(468, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 20:59:59', '2024-08-31 20:59:59'),
(469, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:00:00', '2024-08-31 21:00:00'),
(470, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 21:00:00', '2024-08-31 21:00:00'),
(471, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 21:00:03', '2024-08-31 21:00:03'),
(472, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:04:19', '2024-08-31 21:04:19'),
(473, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:04:19', '2024-08-31 21:04:19'),
(474, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 21:04:20', '2024-08-31 21:04:20'),
(475, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"1\"}', '2024-08-31 21:04:22', '2024-08-31 21:04:22'),
(476, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:04:47', '2024-08-31 21:04:47'),
(477, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:04:48', '2024-08-31 21:04:48'),
(478, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\"}', '2024-08-31 21:04:48', '2024-08-31 21:04:48'),
(479, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"2\"}', '2024-08-31 21:04:50', '2024-08-31 21:04:50'),
(480, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=3&token=d55bfce31470ccb52da4a39235407eecd2175d09', 'GET', '{\"token\":\"d55bfce31470ccb52da4a39235407eecd2175d09\",\"id_reg\":\"3\"}', '2024-08-31 21:04:52', '2024-08-31 21:04:52'),
(481, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:30:53', '2024-08-31 21:30:53'),
(482, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 21:30:57', '2024-08-31 21:30:57'),
(483, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 21:31:01', '2024-08-31 21:31:01'),
(484, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 21:31:02', '2024-08-31 21:31:02'),
(485, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:31:03', '2024-08-31 21:31:03'),
(486, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=325644a87bb37d4cc33e285a1e943c738766f5d8', 'GET', '{\"token\":\"325644a87bb37d4cc33e285a1e943c738766f5d8\"}', '2024-08-31 21:31:04', '2024-08-31 21:31:04'),
(487, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:36:25', '2024-08-31 21:36:25'),
(488, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=325644a87bb37d4cc33e285a1e943c738766f5d8', 'GET', '{\"token\":\"325644a87bb37d4cc33e285a1e943c738766f5d8\"}', '2024-08-31 21:36:26', '2024-08-31 21:36:26'),
(489, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:36:31', '2024-08-31 21:36:31'),
(490, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=325644a87bb37d4cc33e285a1e943c738766f5d8', 'GET', '{\"token\":\"325644a87bb37d4cc33e285a1e943c738766f5d8\",\"id_reg\":\"1\"}', '2024-08-31 21:36:45', '2024-08-31 21:36:45'),
(491, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"lastname\":\"Cordoba\",\"address\":\"calle 28#86-29\",\"date_reg\":\"1993-02-16\",\"status\":1,\"token\":\"325644a87bb37d4cc33e285a1e943c738766f5d8\"}', '2024-08-31 21:37:26', '2024-08-31 21:37:26'),
(492, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"dni\":\"1111663045\",\"select_regions\":\"1\",\"select_communes\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba\",\"address\":\"calle 28#86-29\",\"date_reg\":\"1993-02-16\"}', '2024-08-31 21:37:26', '2024-08-31 21:37:26'),
(493, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:37:33', '2024-08-31 21:37:33'),
(494, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:37:33', '2024-08-31 21:37:33'),
(495, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=325644a87bb37d4cc33e285a1e943c738766f5d8', 'GET', '{\"token\":\"325644a87bb37d4cc33e285a1e943c738766f5d8\"}', '2024-08-31 21:37:34', '2024-08-31 21:37:34'),
(496, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:37:37', '2024-08-31 21:37:37'),
(497, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:37:38', '2024-08-31 21:37:38'),
(498, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=325644a87bb37d4cc33e285a1e943c738766f5d8', 'GET', '{\"token\":\"325644a87bb37d4cc33e285a1e943c738766f5d8\"}', '2024-08-31 21:37:38', '2024-08-31 21:37:38'),
(499, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=325644a87bb37d4cc33e285a1e943c738766f5d8', 'GET', '{\"token\":\"325644a87bb37d4cc33e285a1e943c738766f5d8\",\"id_reg\":\"1\"}', '2024-08-31 21:37:52', '2024-08-31 21:37:52'),
(500, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"1\",\"email\":\"jccq12@gmail.com\",\"lastname\":\"Cordoba\",\"address\":\"n\\/a\",\"date_reg\":\"2024-08-31\",\"status\":1,\"token\":\"325644a87bb37d4cc33e285a1e943c738766f5d8\"}', '2024-08-31 21:38:14', '2024-08-31 21:38:14'),
(501, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"dni\":\"1111663045\",\"select_regions\":\"1\",\"select_communes\":\"1\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan\",\"lastname\":\"Cordoba\",\"address\":\"n\\/a\",\"date_reg\":\"2024-08-31\"}', '2024-08-31 21:38:14', '2024-08-31 21:38:14'),
(502, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000', 'GET', '[]', '2024-08-31 21:39:39', '2024-08-31 21:39:39'),
(503, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 21:39:39', '2024-08-31 21:39:39'),
(504, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 21:39:40', '2024-08-31 21:39:40'),
(505, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 21:39:45', '2024-08-31 21:39:45'),
(506, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 21:39:49', '2024-08-31 21:39:49'),
(507, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 21:39:49', '2024-08-31 21:39:49'),
(508, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:39:51', '2024-08-31 21:39:51'),
(509, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:39:51', '2024-08-31 21:39:51'),
(510, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":null,\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:40:04', '2024-08-31 21:40:04'),
(511, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:40:08', '2024-08-31 21:40:08'),
(512, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":null,\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:42:57', '2024-08-31 21:42:57'),
(513, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:45:53', '2024-08-31 21:45:53'),
(514, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:45:54', '2024-08-31 21:45:54'),
(515, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:45:54', '2024-08-31 21:45:54'),
(516, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":null,\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:45:54', '2024-08-31 21:45:54'),
(517, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"432142141\",\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:46:00', '2024-08-31 21:46:00'),
(518, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"432142141412\",\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:46:13', '2024-08-31 21:46:13'),
(519, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"432142141412\",\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:46:14', '2024-08-31 21:46:14'),
(520, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"12\",\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:46:16', '2024-08-31 21:46:16'),
(521, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"214\",\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:46:53', '2024-08-31 21:46:53'),
(522, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:46:58', '2024-08-31 21:46:58'),
(523, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:46:59', '2024-08-31 21:46:59');
INSERT INTO `logs` (`id`, `type`, `ip`, `url`, `method`, `message`, `created_at`, `updated_at`) VALUES
(524, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"1\"}', '2024-08-31 21:47:02', '2024-08-31 21:47:02'),
(525, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"1\",\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:47:04', '2024-08-31 21:47:04'),
(526, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"1\",\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:47:05', '2024-08-31 21:47:05'),
(527, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:48:00', '2024-08-31 21:48:00'),
(528, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:48:00', '2024-08-31 21:48:00'),
(529, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":null,\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:48:02', '2024-08-31 21:48:02'),
(530, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":null,\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:48:07', '2024-08-31 21:48:07'),
(531, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"1\"}', '2024-08-31 21:48:09', '2024-08-31 21:48:09'),
(532, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"2\",\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:48:11', '2024-08-31 21:48:11'),
(533, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:48:15', '2024-08-31 21:48:15'),
(534, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:48:26', '2024-08-31 21:48:26'),
(535, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:49:19', '2024-08-31 21:49:19'),
(536, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"qwrqwrwqr\",\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:49:31', '2024-08-31 21:49:31'),
(537, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:49:49', '2024-08-31 21:49:49'),
(538, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:49:53', '2024-08-31 21:49:53'),
(539, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:50:24', '2024-08-31 21:50:24'),
(540, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:50:24', '2024-08-31 21:50:24'),
(541, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:50:24', '2024-08-31 21:50:24'),
(542, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":null,\"email\":null,\"name\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:50:27', '2024-08-31 21:50:27'),
(543, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"2\"}', '2024-08-31 21:50:28', '2024-08-31 21:50:28'),
(544, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"5\",\"email\":null,\"name\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:50:31', '2024-08-31 21:50:31'),
(545, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"5\",\"email\":\"jccq1\",\"name\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:50:36', '2024-08-31 21:50:36'),
(546, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"5\",\"email\":\"jccq12@gmail.com\",\"name\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:50:43', '2024-08-31 21:50:43'),
(547, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"5\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:50:48', '2024-08-31 21:50:48'),
(548, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"5\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-31\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:50:52', '2024-08-31 21:50:52'),
(549, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:51:37', '2024-08-31 21:51:37'),
(550, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:51:38', '2024-08-31 21:51:38'),
(551, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:51:38', '2024-08-31 21:51:38'),
(552, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"1\"}', '2024-08-31 21:51:41', '2024-08-31 21:51:41'),
(553, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":80,\"email\":\"jccq12@g,ail.com\",\"name\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:51:51', '2024-08-31 21:51:51'),
(554, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":80,\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-23\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:52:03', '2024-08-31 21:52:03'),
(555, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":80,\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-23\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:52:07', '2024-08-31 21:52:07'),
(556, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":80,\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-23\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:52:48', '2024-08-31 21:52:48'),
(557, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:55:27', '2024-08-31 21:55:27'),
(558, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:55:27', '2024-08-31 21:55:27'),
(559, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:55:28', '2024-08-31 21:55:28'),
(560, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":null,\"id_com\":80,\"email\":null,\"name\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:58:42', '2024-08-31 21:58:42'),
(561, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"1\"}', '2024-08-31 21:58:45', '2024-08-31 21:58:45'),
(562, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":80,\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-22\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:58:57', '2024-08-31 21:58:57'),
(563, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 21:59:28', '2024-08-31 21:59:28'),
(564, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 21:59:29', '2024-08-31 21:59:29'),
(565, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:59:29', '2024-08-31 21:59:29'),
(566, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"1\"}', '2024-08-31 21:59:31', '2024-08-31 21:59:31'),
(567, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":80,\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-31\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 21:59:43', '2024-08-31 21:59:43'),
(568, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":80,\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-31\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:00:20', '2024-08-31 22:00:20'),
(569, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":80,\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-31\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:00:57', '2024-08-31 22:00:57'),
(570, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 22:01:54', '2024-08-31 22:01:54'),
(571, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 22:01:54', '2024-08-31 22:01:54'),
(572, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:01:54', '2024-08-31 22:01:54'),
(573, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"1\"}', '2024-08-31 22:01:56', '2024-08-31 22:01:56'),
(574, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-09-05\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:02:07', '2024-08-31 22:02:07'),
(575, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-09-05\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:02:39', '2024-08-31 22:02:39'),
(576, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-09-05\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:02:52', '2024-08-31 22:02:52'),
(577, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-09-05\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:04:16', '2024-08-31 22:04:16'),
(578, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 22:05:37', '2024-08-31 22:05:37'),
(579, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 22:05:38', '2024-08-31 22:05:38'),
(580, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:05:38', '2024-08-31 22:05:38'),
(581, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"1\"}', '2024-08-31 22:05:59', '2024-08-31 22:05:59'),
(582, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-07-29\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:06:16', '2024-08-31 22:06:16'),
(583, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-07-29\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:12:39', '2024-08-31 22:12:39'),
(584, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-07-29\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:13:01', '2024-08-31 22:13:01'),
(585, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111661\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-07-29\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:13:14', '2024-08-31 22:13:14'),
(586, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111661\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-07-29\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:13:45', '2024-08-31 22:13:45'),
(587, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111661\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-07-29\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:15:09', '2024-08-31 22:15:09'),
(588, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111661512\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-07-29\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:15:12', '2024-08-31 22:15:12'),
(589, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 22:15:16', '2024-08-31 22:15:16'),
(590, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 22:15:16', '2024-08-31 22:15:16'),
(591, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:15:17', '2024-08-31 22:15:17'),
(592, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"2\"}', '2024-08-31 22:15:19', '2024-08-31 22:15:19'),
(593, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"4\",\"email\":\"jcacw@gmail.com\",\"name\":\"Jhan Carlos Cordoba\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-30\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:15:35', '2024-08-31 22:15:35'),
(594, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"111142141\",\"id_com\":\"4\",\"email\":\"jcacw@gmail.com\",\"name\":\"Jhan Carlos Cordoba\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-30\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:15:39', '2024-08-31 22:15:39'),
(595, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"2\"}', '2024-08-31 22:26:14', '2024-08-31 22:26:14'),
(596, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 22:26:17', '2024-08-31 22:26:17'),
(597, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:26:17', '2024-08-31 22:26:17'),
(598, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=ba20005dcae20e03e7e54526ad63b7d310ea16dc', 'GET', '{\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\",\"id_reg\":\"1\"}', '2024-08-31 22:26:21', '2024-08-31 22:26:21'),
(599, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-06\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:26:28', '2024-08-31 22:26:28'),
(600, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"11116630455421542152151\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-06\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:26:31', '2024-08-31 22:26:31'),
(601, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"11116\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-06\",\"status\":1,\"token\":\"ba20005dcae20e03e7e54526ad63b7d310ea16dc\"}', '2024-08-31 22:26:36', '2024-08-31 22:26:36'),
(602, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 22:42:59', '2024-08-31 22:42:59'),
(603, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 22:43:03', '2024-08-31 22:43:03'),
(604, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 22:43:07', '2024-08-31 22:43:07'),
(605, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 22:43:08', '2024-08-31 22:43:08'),
(606, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 22:43:09', '2024-08-31 22:43:09'),
(607, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\"}', '2024-08-31 22:43:10', '2024-08-31 22:43:10'),
(608, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 22:47:27', '2024-08-31 22:47:27'),
(609, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\"}', '2024-08-31 22:47:27', '2024-08-31 22:47:27'),
(610, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=24124124&email=122412412&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":\"122412412\",\"dni\":\"24124124\"}', '2024-08-31 22:47:32', '2024-08-31 22:47:32'),
(611, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 22:47:35', '2024-08-31 22:47:35'),
(612, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":null}', '2024-08-31 22:47:53', '2024-08-31 22:47:53'),
(613, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=111663&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"111663\"}', '2024-08-31 22:48:07', '2024-08-31 22:48:07'),
(614, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1111663045&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"1111663045\"}', '2024-08-31 22:48:13', '2024-08-31 22:48:13'),
(615, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1111663045&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"1111663045\"}', '2024-08-31 22:55:35', '2024-08-31 22:55:35'),
(616, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1111&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"1111\"}', '2024-08-31 22:55:39', '2024-08-31 22:55:39'),
(617, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=423214&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"423214\"}', '2024-08-31 22:55:44', '2024-08-31 22:55:44'),
(618, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=jccq12%40gmail&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":\"jccq12@gmail\",\"dni\":null}', '2024-08-31 22:55:52', '2024-08-31 22:55:52'),
(619, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=wetwet&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"wetwet\"}', '2024-08-31 22:56:39', '2024-08-31 22:56:39'),
(620, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=twetwetwet&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"twetwetwet\"}', '2024-08-31 22:57:05', '2024-08-31 22:57:05'),
(621, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=twetwetwet&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"twetwetwet\"}', '2024-08-31 22:57:08', '2024-08-31 22:57:08'),
(622, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=twetwetwet&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"twetwetwet\"}', '2024-08-31 22:57:09', '2024-08-31 22:57:09'),
(623, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=twetwetwet&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"twetwetwet\"}', '2024-08-31 22:57:10', '2024-08-31 22:57:10'),
(624, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=twetwetwet&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"twetwetwet\"}', '2024-08-31 22:57:10', '2024-08-31 22:57:10'),
(625, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=twetwetwet&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"twetwetwet\"}', '2024-08-31 22:57:10', '2024-08-31 22:57:10'),
(626, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=twetwetwet&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":\"twetwetwet\"}', '2024-08-31 22:57:10', '2024-08-31 22:57:10'),
(627, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:00:18', '2024-08-31 23:00:18'),
(628, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:00:18', '2024-08-31 23:00:18'),
(629, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\"}', '2024-08-31 23:00:19', '2024-08-31 23:00:19'),
(630, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=23523&email=2352&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":\"2352\",\"dni\":\"23523\"}', '2024-08-31 23:00:35', '2024-08-31 23:00:35'),
(631, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=23523&email=2352&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":\"2352\",\"dni\":\"23523\"}', '2024-08-31 23:00:40', '2024-08-31 23:00:40'),
(632, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":null}', '2024-08-31 23:00:43', '2024-08-31 23:00:43'),
(633, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=07514eb2ae0fbdb3742931c17f1d411c87b56bb6', 'GET', '{\"token\":\"07514eb2ae0fbdb3742931c17f1d411c87b56bb6\",\"email\":null,\"dni\":null}', '2024-08-31 23:00:46', '2024-08-31 23:00:46'),
(634, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 23:00:47', '2024-08-31 23:00:47'),
(635, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:00:48', '2024-08-31 23:00:48'),
(636, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 23:00:55', '2024-08-31 23:00:55'),
(637, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 23:00:55', '2024-08-31 23:00:55'),
(638, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:00:56', '2024-08-31 23:00:56'),
(639, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 23:04:30', '2024-08-31 23:04:30'),
(640, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:04:31', '2024-08-31 23:04:31'),
(641, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:04:31', '2024-08-31 23:04:31'),
(642, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=72a08deb01ccb6043f657026525878c1134308d9', 'GET', '{\"token\":\"72a08deb01ccb6043f657026525878c1134308d9\"}', '2024-08-31 23:04:32', '2024-08-31 23:04:32'),
(643, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:04:32', '2024-08-31 23:04:32'),
(644, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=236&email=3626&token=72a08deb01ccb6043f657026525878c1134308d9', 'GET', '{\"token\":\"72a08deb01ccb6043f657026525878c1134308d9\",\"email\":\"3626\",\"dni\":\"236\"}', '2024-08-31 23:04:34', '2024-08-31 23:04:34'),
(645, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', '[]', '2024-08-31 23:04:39', '2024-08-31 23:04:39'),
(646, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:04:39', '2024-08-31 23:04:39'),
(647, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/logueo', 'POST', '{\"_token\":\"CmyTKeslWEbitVTCn5A8hrATJFcYpF4JEQCYOc8h\",\"email\":\"jccq12@gmail.com\",\"password\":\"Papichulo1\"}', '2024-08-31 23:05:11', '2024-08-31 23:05:11'),
(648, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home', 'GET', '[]', '2024-08-31 23:05:12', '2024-08-31 23:05:12'),
(649, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:05:12', '2024-08-31 23:05:12'),
(650, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:05:20', '2024-08-31 23:05:20'),
(651, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:05:21', '2024-08-31 23:05:21'),
(652, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:05:21', '2024-08-31 23:05:21'),
(653, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=42141&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"42141\"}', '2024-08-31 23:05:24', '2024-08-31 23:05:24'),
(654, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:07:36', '2024-08-31 23:07:36'),
(655, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:07:37', '2024-08-31 23:07:37'),
(656, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:07:37', '2024-08-31 23:07:37'),
(657, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=4214&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"4214\"}', '2024-08-31 23:07:38', '2024-08-31 23:07:38'),
(658, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:07:47', '2024-08-31 23:07:47'),
(659, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:12:19', '2024-08-31 23:12:19'),
(660, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:12:20', '2024-08-31 23:12:20'),
(661, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=4214124&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"4214124\"}', '2024-08-31 23:12:21', '2024-08-31 23:12:21'),
(662, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=12&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"12\"}', '2024-08-31 23:12:24', '2024-08-31 23:12:24'),
(663, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:12:28', '2024-08-31 23:12:28'),
(664, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:13:02', '2024-08-31 23:13:02'),
(665, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:13:02', '2024-08-31 23:13:02'),
(666, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=124214&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"124214\"}', '2024-08-31 23:13:03', '2024-08-31 23:13:03'),
(667, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1111663045&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"1111663045\"}', '2024-08-31 23:13:12', '2024-08-31 23:13:12'),
(668, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:14:03', '2024-08-31 23:14:03'),
(669, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:14:03', '2024-08-31 23:14:03'),
(670, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=124&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"124\"}', '2024-08-31 23:14:05', '2024-08-31 23:14:05'),
(671, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1111663045&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"1111663045\"}', '2024-08-31 23:14:18', '2024-08-31 23:14:18'),
(672, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:14:56', '2024-08-31 23:14:56'),
(673, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:14:57', '2024-08-31 23:14:57'),
(674, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=124&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"124\"}', '2024-08-31 23:14:58', '2024-08-31 23:14:58'),
(675, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=42141241&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"42141241\"}', '2024-08-31 23:15:07', '2024-08-31 23:15:07'),
(676, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1111663045&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"1111663045\"}', '2024-08-31 23:15:12', '2024-08-31 23:15:12'),
(677, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:15:33', '2024-08-31 23:15:33'),
(678, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:15:33', '2024-08-31 23:15:33'),
(679, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=124124&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"124124\"}', '2024-08-31 23:15:36', '2024-08-31 23:15:36'),
(680, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:20:08', '2024-08-31 23:20:08'),
(681, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:20:08', '2024-08-31 23:20:08'),
(682, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=jcc&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":\"jcc\",\"dni\":null}', '2024-08-31 23:20:12', '2024-08-31 23:20:12'),
(683, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:21:01', '2024-08-31 23:21:01'),
(684, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:21:01', '2024-08-31 23:21:01'),
(685, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=124124&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"124124\"}', '2024-08-31 23:21:03', '2024-08-31 23:21:03'),
(686, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:21:10', '2024-08-31 23:21:10'),
(687, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":null,\"id_com\":null,\"email\":null,\"name\":null,\"lastname\":null,\"address\":null,\"date_reg\":null,\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:24:11', '2024-08-31 23:24:11'),
(688, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:24:16', '2024-08-31 23:24:16'),
(689, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=31312&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"31312\"}', '2024-08-31 23:24:18', '2024-08-31 23:24:18'),
(690, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=4214122&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"4214122\"}', '2024-08-31 23:25:01', '2024-08-31 23:25:01'),
(691, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=12234&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"12234\"}', '2024-08-31 23:25:05', '2024-08-31 23:25:05'),
(692, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1116&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"1116\"}', '2024-08-31 23:25:08', '2024-08-31 23:25:08'),
(693, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=113&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"113\"}', '2024-08-31 23:25:13', '2024-08-31 23:25:13'),
(694, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"1\"}', '2024-08-31 23:25:18', '2024-08-31 23:25:18'),
(695, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"1\"}', '2024-08-31 23:31:07', '2024-08-31 23:31:07'),
(696, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=1252151&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":\"1252151\"}', '2024-08-31 23:31:11', '2024-08-31 23:31:11'),
(697, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:31:49', '2024-08-31 23:31:49'),
(698, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:31:49', '2024-08-31 23:31:49'),
(699, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:31:50', '2024-08-31 23:31:50'),
(700, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:31:56', '2024-08-31 23:31:56'),
(701, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:43:16', '2024-08-31 23:43:16'),
(702, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:43:16', '2024-08-31 23:43:16'),
(703, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:43:19', '2024-08-31 23:43:19'),
(704, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"11116\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:43:22', '2024-08-31 23:43:22'),
(705, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"1111661512\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:43:56', '2024-08-31 23:43:56'),
(706, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:44:44', '2024-08-31 23:44:44'),
(707, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:44:44', '2024-08-31 23:44:44'),
(708, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:44:45', '2024-08-31 23:44:45'),
(709, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"11116\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:44:48', '2024-08-31 23:44:48'),
(710, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/argon/vendor/bootstrap/dist/js/bootstrap.bundle.min.js.map', 'GET', '[]', '2024-08-31 23:44:52', '2024-08-31 23:44:52'),
(711, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"1111661\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:45:43', '2024-08-31 23:45:43'),
(712, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"1111661512\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:45:56', '2024-08-31 23:45:56'),
(713, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"1111661512\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:46:30', '2024-08-31 23:46:30'),
(714, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"1111661512\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:47:44', '2024-08-31 23:47:44'),
(715, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"1111661512\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:49:16', '2024-08-31 23:49:16'),
(716, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"111142141\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:49:48', '2024-08-31 23:49:48');
INSERT INTO `logs` (`id`, `type`, `ip`, `url`, `method`, `message`, `created_at`, `updated_at`) VALUES
(717, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:49:57', '2024-08-31 23:49:57'),
(718, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"11116\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:50:00', '2024-08-31 23:50:00'),
(719, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"id_reg\":\"1\"}', '2024-08-31 23:50:10', '2024-08-31 23:50:10'),
(720, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-31\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:50:18', '2024-08-31 23:50:18'),
(721, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:50:21', '2024-08-31 23:50:21'),
(722, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"1111663045\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:50:24', '2024-08-31 23:50:24'),
(723, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"id_reg\":\"1\"}', '2024-08-31 23:50:28', '2024-08-31 23:50:28'),
(724, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-30\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:50:36', '2024-08-31 23:50:36'),
(725, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:51:19', '2024-08-31 23:51:19'),
(726, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"1111661\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:51:39', '2024-08-31 23:51:39'),
(727, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-30\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:51:51', '2024-08-31 23:51:51'),
(728, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-30\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:51:54', '2024-08-31 23:51:54'),
(729, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-30\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:51:59', '2024-08-31 23:51:59'),
(730, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"3\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-30\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:52:41', '2024-08-31 23:52:41'),
(731, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/home/customers', 'GET', '[]', '2024-08-31 23:53:15', '2024-08-31 23:53:15'),
(732, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_regiones?token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:53:16', '2024-08-31 23:53:16'),
(733, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=2&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"id_reg\":\"2\"}', '2024-08-31 23:53:18', '2024-08-31 23:53:18'),
(734, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"1111663045\",\"id_com\":\"5\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-31\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:53:25', '2024-08-31 23:53:25'),
(735, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"45124124\",\"id_com\":\"5\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-31\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:53:28', '2024-08-31 23:53:28'),
(736, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_communes?id_reg=1&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"id_reg\":\"1\"}', '2024-08-31 23:53:31', '2024-08-31 23:53:31'),
(737, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"wgewgwe\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-22\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:53:39', '2024-08-31 23:53:39'),
(738, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/save', 'POST', '{\"dni\":\"412\",\"id_com\":\"2\",\"email\":\"jccq12@gmail.com\",\"name\":\"Jhan Carlos\",\"lastname\":\"Cordoba Qui\\u00f1onez\",\"address\":\"Calle 28 #86-29, Cali, Valle del Cauca, Colombia\",\"date_reg\":\"2024-08-22\",\"status\":1,\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:53:43', '2024-08-31 23:53:43'),
(739, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/get_customers?dni=&email=&token=bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', 'GET', '{\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\",\"email\":null,\"dni\":null}', '2024-08-31 23:53:47', '2024-08-31 23:53:47'),
(740, 'Entrada', '127.0.0.1', 'http://127.0.0.1:8000/api/customers/delete', 'POST', '{\"dni\":\"412\",\"token\":\"bbe64f628f31e0fc2e9b487e3d2175ee08256c3c\"}', '2024-08-31 23:53:49', '2024-08-31 23:53:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_08_30_013317_create_tokens_table', 1),
(5, '2024_08_30_033450_create_logs_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regions`
--

CREATE TABLE `regions` (
  `id_reg` int(11) NOT NULL,
  `description` varchar(90) NOT NULL,
  `status` enum('A','I','trash') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regions`
--

INSERT INTO `regions` (`id_reg`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Región Metropolitana de Santiago', 'A', NULL, NULL),
(2, 'Región de Valparaíso', 'A', NULL, NULL),
(3, 'Región del Biobío', 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QfJ3CCqqjSGLlrERf0GsDIcckCRk2MRMAXipmjNX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ215VEtlc2xXRWJpdFZUQ241QThockFUSkZjWXBGNEpFUUNZT2M4aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob21lL2N1c3RvbWVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NToidG9rZW4iO3M6NDA6ImJiZTY0ZjYyOGYzMWUwZmMyZTliNDg3ZTNkMjE3NWVlMDgyNTZjM2MiO30=', 1725130395);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(40) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 1, '7ddbe44d196236cef814a96f786c4862e7c1c453', '2024-08-31 05:45:56', '2024-08-31 04:45:56', '2024-08-31 04:45:56'),
(2, 1, 'baa7c5cf37ec52014da7749aa1f268821cf35f22', '2024-08-31 06:10:37', '2024-08-31 05:10:37', '2024-08-31 05:10:37'),
(3, 1, '19b9fb32d4788cffdcb8b92ca8c8d2f9737d479f', '2024-08-31 06:19:17', '2024-08-31 05:19:17', '2024-08-31 05:19:17'),
(5, 1, 'd219d2e1c1323ef0cb4f5b5a1ccbf3a90cc26a43', '2024-08-31 07:05:41', '2024-08-31 06:05:41', '2024-08-31 06:05:41'),
(6, 1, '4d9ab60325e99cf270087eac04d557a9438e5464', '2024-08-31 06:06:52', '2024-08-31 06:06:38', '2024-08-31 06:06:38'),
(11, 1, '901541e0e66c6fdb38d08caaf660f2cf8a0c325d', '2024-08-31 07:26:20', '2024-08-31 06:26:20', '2024-08-31 06:26:20'),
(12, 1, '8519b1c2ed245872e064cdc8a1b1aab509ba79f8', '2024-08-31 07:30:52', '2024-08-31 06:30:52', '2024-08-31 06:30:52'),
(13, 1, '2a2314034892e38e3e0b80bdeb65c6566bdb4e3a', '2024-08-31 08:00:04', '2024-08-31 07:00:05', '2024-08-31 07:00:05'),
(14, 1, '6240b5bc0290caaeb5d5c90291dbe3459fecf6dc', '2024-08-31 08:54:14', '2024-08-31 07:54:14', '2024-08-31 07:54:14'),
(16, 1, '785c216dd373d90bd16911bbaf3cbb20e86540ff', '2024-08-31 10:39:56', '2024-08-31 09:39:57', '2024-08-31 09:39:57'),
(17, 1, 'c2b4435022ec0b2a572a73e358b9e876c3179078', '2024-08-31 10:49:19', '2024-08-31 09:49:20', '2024-08-31 09:49:20'),
(18, 2, '0a026c84e4755859432817cc957b3ffa9fd4a39e', '2024-08-31 10:49:40', '2024-08-31 09:49:41', '2024-08-31 09:49:41'),
(19, 1, '800069382dbc8e6d546249364b0adcb12d3b6858', '2024-08-31 10:53:02', '2024-08-31 09:53:02', '2024-08-31 09:53:02'),
(20, 1, '1146fd65606977d9583cef8ac4a19ccf166e6640', '2024-08-31 11:11:33', '2024-08-31 10:11:33', '2024-08-31 10:11:33'),
(21, 1, '99041ca2ed0f510fe105bab66769eeba7a3db322', '2024-08-31 17:36:06', '2024-08-31 16:36:07', '2024-08-31 16:36:07'),
(22, 1, 'c2b4c538d21a928abe144e60add2c49255d4ce97', '2024-08-31 18:01:14', '2024-08-31 17:01:14', '2024-08-31 17:01:14'),
(23, 1, 'ae6c9b5ca2a1387f805c36ab021235175ca58b02', '2024-08-31 18:04:26', '2024-08-31 17:04:26', '2024-08-31 17:04:26'),
(24, 1, 'c1bb945d1b8a84ff6567cb193d3f4ad8e3977c05', '2024-08-31 18:04:52', '2024-08-31 17:04:52', '2024-08-31 17:04:52'),
(25, 1, '74b2db061e2bb368289fa577b5d96d24bcefb6b1', '2024-08-31 18:20:05', '2024-08-31 17:20:05', '2024-08-31 17:20:05'),
(26, 1, '7aef6270a923ba7aef1980b7211e6b72c5955f6f', '2024-08-31 18:21:01', '2024-08-31 17:21:01', '2024-08-31 17:21:01'),
(27, 1, '37947caeee4af09901cc2938d29a974dcf912aed', '2024-08-31 18:24:05', '2024-08-31 17:24:05', '2024-08-31 17:24:05'),
(28, 1, '9e56cc0d66c8cbb45e5a7823b0ca07abe479fd18', '2024-08-31 18:59:47', '2024-08-31 17:59:47', '2024-08-31 17:59:47'),
(29, 1, '13027065e08b7737800576af88c77e3ccb1cd914', '2024-08-31 19:00:43', '2024-08-31 18:00:43', '2024-08-31 18:00:43'),
(30, 1, 'b9642145e70b7105030aac7ef05f492a88c000c3', '2024-08-31 19:07:18', '2024-08-31 18:07:18', '2024-08-31 18:07:18'),
(31, 1, '01b33cc475e18e83c1959e07e0ad3d014f98f3a7', '2024-08-31 19:09:40', '2024-08-31 18:09:40', '2024-08-31 18:09:40'),
(32, 1, '05f05b8485587189736b110bbf7fb76b993015a9', '2024-08-31 20:00:43', '2024-08-31 19:00:43', '2024-08-31 19:00:43'),
(33, 1, '328cd0fa730bc54ae009b596136d4fa296aea0fd', '2024-08-31 20:01:31', '2024-08-31 19:01:31', '2024-08-31 19:01:31'),
(34, 1, 'bc589e1f6a369aca382a1ba6684c57bb338a7f0f', '2024-08-31 20:08:04', '2024-08-31 19:08:04', '2024-08-31 19:08:04'),
(35, 1, '83f9a59b2096eb4547220f154d62cb1b11925166', '2024-08-31 20:08:23', '2024-08-31 19:08:23', '2024-08-31 19:08:23'),
(36, 1, '5ebc54b246e019d4768d9943d7889452de037472', '2024-08-31 20:43:59', '2024-08-31 19:43:59', '2024-08-31 19:43:59'),
(37, 1, 'fa5275f9cd6ceb05f6356257e150b087ca45e96b', '2024-08-31 20:55:53', '2024-08-31 19:55:53', '2024-08-31 19:55:53'),
(38, 1, '79769ba1fdc397c4918cfa11bbee72b392ce2f3f', '2024-08-31 21:10:30', '2024-08-31 20:10:30', '2024-08-31 20:10:30'),
(39, 1, 'd55bfce31470ccb52da4a39235407eecd2175d09', '2024-08-31 21:15:57', '2024-08-31 20:15:57', '2024-08-31 20:15:57'),
(40, 1, '325644a87bb37d4cc33e285a1e943c738766f5d8', '2024-08-31 22:31:02', '2024-08-31 21:31:02', '2024-08-31 21:31:02'),
(41, 1, 'ba20005dcae20e03e7e54526ad63b7d310ea16dc', '2024-08-31 22:39:49', '2024-08-31 21:39:49', '2024-08-31 21:39:49'),
(42, 1, '07514eb2ae0fbdb3742931c17f1d411c87b56bb6', '2024-08-31 23:43:08', '2024-08-31 22:43:08', '2024-08-31 22:43:08'),
(43, 1, '72a08deb01ccb6043f657026525878c1134308d9', '2024-09-01 00:00:55', '2024-08-31 23:00:55', '2024-08-31 23:00:55'),
(44, 1, 'bbe64f628f31e0fc2e9b487e3d2175ee08256c3c', '2024-09-01 00:05:12', '2024-08-31 23:05:12', '2024-08-31 23:05:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jhan Carlos', 'jccq12@gmail.com', NULL, '$2y$12$EEdaW.Dqf7RLBfu7omUUM.iVdUDQcWrlpzqYGgUKHpulwxXk52ShK', NULL, '2024-08-31 04:45:50', '2024-08-31 04:45:50'),
(2, 'Jhan Carlos Cordoba Quiñonez', 'sistemasaux9@eltemplodelamoda.com.co', NULL, '$2y$12$4xET8VckOXIiGCXrvJmq9eW9avTPIP.wwz5ZBcMUWVfnVfVvQyIlS', NULL, '2024-08-31 09:49:33', '2024-08-31 09:49:33');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `communes`
--
ALTER TABLE `communes`
  ADD PRIMARY KEY (`id_com`),
  ADD KEY `fk_communes_regions1_idx` (`id_reg`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `fk_customers_communes_idx` (`id_com`),
  ADD KEY `fk_customers_regions1_idx` (`id_reg`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id_reg`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `communes`
--
ALTER TABLE `communes`
  MODIFY `id_com` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=741;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `regions`
--
ALTER TABLE `regions`
  MODIFY `id_reg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `communes`
--
ALTER TABLE `communes`
  ADD CONSTRAINT `fk_communes_regions1` FOREIGN KEY (`id_reg`) REFERENCES `regions` (`id_reg`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_communes` FOREIGN KEY (`id_com`) REFERENCES `communes` (`id_com`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customers_regions1` FOREIGN KEY (`id_reg`) REFERENCES `regions` (`id_reg`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
