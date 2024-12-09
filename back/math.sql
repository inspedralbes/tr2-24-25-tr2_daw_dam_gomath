-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2024 a las 10:29:00
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ayoub`
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
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_clase` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id`, `nombre_clase`, `created_at`, `updated_at`) VALUES
(1, 'Clase1', '2024-12-08 13:23:17', '2024-12-08 13:23:17');

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
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '1_operacions', 1),
(4, '2024_12_02_073600_create_personal_access_tokens_table', 1),
(5, '2_clases', 1),
(6, '3_users', 1),
(7, '4_puntuacions', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacions`
--

CREATE TABLE `operacions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `problem_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`problem_json`)),
  `nivel_dificultad` varchar(255) NOT NULL,
  `tipo_operacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `operacions`
--

INSERT INTO `operacions` (`id`, `problem_json`, `nivel_dificultad`, `tipo_operacion`) VALUES
(1, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 + 5?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":9,\"is_correct\":false}]}', 'fácil', 'suma'),
(2, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 + 2?\",\"answers\":[{\"value\":9,\"is_correct\":true},{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":11,\"is_correct\":false}]}', 'fácil', 'suma'),
(3, '{\"question\":\"\\u00bfCu\\u00e1nto es 12 + 23?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'suma'),
(4, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 + 24?\",\"answers\":[{\"value\":41,\"is_correct\":false},{\"value\":42,\"is_correct\":true},{\"value\":43,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'suma'),
(5, '{\"question\":\"\\u00bfCu\\u00e1nto es 102 + 203?\",\"answers\":[{\"value\":304,\"is_correct\":false},{\"value\":306,\"is_correct\":false},{\"value\":305,\"is_correct\":true},{\"value\":307,\"is_correct\":false}]}', 'difícil', 'suma'),
(6, '{\"question\":\"\\u00bfCu\\u00e1nto es 350 + 420?\",\"answers\":[{\"value\":760,\"is_correct\":false},{\"value\":780,\"is_correct\":false},{\"value\":750,\"is_correct\":false},{\"value\":770,\"is_correct\":true}]}', 'difícil', 'suma'),
(7, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 + 6?\",\"answers\":[{\"value\":10,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'fácil', 'suma'),
(8, '{\"question\":\"\\u00bfCu\\u00e1nto es 13 + 27?\",\"answers\":[{\"value\":41,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":39,\"is_correct\":false},{\"value\":38,\"is_correct\":false}]}', 'intermedio', 'suma'),
(9, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 + 1?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":8,\"is_correct\":false},{\"value\":7,\"is_correct\":true},{\"value\":9,\"is_correct\":false}]}', 'fácil', 'suma'),
(10, '{\"question\":\"\\u00bfCu\\u00e1nto es 530 + 290?\",\"answers\":[{\"value\":810,\"is_correct\":false},{\"value\":830,\"is_correct\":false},{\"value\":800,\"is_correct\":false},{\"value\":820,\"is_correct\":true}]}', 'difícil', 'suma'),
(11, '{\"question\":\"\\u00bfCu\\u00e1nto es 2 + 6?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(12, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 + 5?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'fácil', 'suma'),
(13, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 + 25?\",\"answers\":[{\"value\":38,\"is_correct\":false},{\"value\":40,\"is_correct\":false},{\"value\":39,\"is_correct\":true},{\"value\":41,\"is_correct\":false}]}', 'intermedio', 'suma'),
(14, '{\"question\":\"\\u00bfCu\\u00e1nto es 31 + 42?\",\"answers\":[{\"value\":72,\"is_correct\":false},{\"value\":74,\"is_correct\":false},{\"value\":71,\"is_correct\":false},{\"value\":73,\"is_correct\":true}]}', 'intermedio', 'suma'),
(15, '{\"question\":\"\\u00bfCu\\u00e1nto es 123 + 456?\",\"answers\":[{\"value\":579,\"is_correct\":true},{\"value\":578,\"is_correct\":false},{\"value\":580,\"is_correct\":false},{\"value\":581,\"is_correct\":false}]}', 'difícil', 'suma'),
(16, '{\"question\":\"\\u00bfCu\\u00e1nto es 789 + 345?\",\"answers\":[{\"value\":1133,\"is_correct\":false},{\"value\":1134,\"is_correct\":true},{\"value\":1135,\"is_correct\":false},{\"value\":1136,\"is_correct\":false}]}', 'difícil', 'suma'),
(17, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 + 3?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":11,\"is_correct\":true},{\"value\":13,\"is_correct\":false}]}', 'fácil', 'suma'),
(18, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 + 62?\",\"answers\":[{\"value\":106,\"is_correct\":false},{\"value\":108,\"is_correct\":false},{\"value\":109,\"is_correct\":false},{\"value\":107,\"is_correct\":true}]}', 'intermedio', 'suma'),
(19, '{\"question\":\"\\u00bfCu\\u00e1nto es 56 + 78?\",\"answers\":[{\"value\":134,\"is_correct\":true},{\"value\":133,\"is_correct\":false},{\"value\":135,\"is_correct\":false},{\"value\":136,\"is_correct\":false}]}', 'intermedio', 'suma'),
(20, '{\"question\":\"\\u00bfCu\\u00e1nto es 234 + 678?\",\"answers\":[{\"value\":911,\"is_correct\":false},{\"value\":913,\"is_correct\":true},{\"value\":912,\"is_correct\":false},{\"value\":914,\"is_correct\":false}]}', 'difícil', 'suma'),
(21, '{\"question\":\"\\u00bfCu\\u00e1nto es 345 + 567?\",\"answers\":[{\"value\":910,\"is_correct\":false},{\"value\":913,\"is_correct\":false},{\"value\":912,\"is_correct\":true},{\"value\":914,\"is_correct\":false}]}', 'difícil', 'suma'),
(22, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 + 4?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":true}]}', 'fácil', 'suma'),
(23, '{\"question\":\"\\u00bfCu\\u00e1nto es 28 + 35?\",\"answers\":[{\"value\":62,\"is_correct\":false},{\"value\":63,\"is_correct\":true},{\"value\":64,\"is_correct\":false},{\"value\":65,\"is_correct\":false}]}', 'intermedio', 'suma'),
(24, '{\"question\":\"\\u00bfCu\\u00e1nto es 89 + 176?\",\"answers\":[{\"value\":265,\"is_correct\":false},{\"value\":267,\"is_correct\":false},{\"value\":266,\"is_correct\":true},{\"value\":268,\"is_correct\":false}]}', 'difícil', 'suma'),
(25, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 + 7?\",\"answers\":[{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":10,\"is_correct\":true}]}', 'fácil', 'suma'),
(26, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(27, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 + 27?\",\"answers\":[{\"value\":44,\"is_correct\":false},{\"value\":45,\"is_correct\":true},{\"value\":46,\"is_correct\":false},{\"value\":47,\"is_correct\":false}]}', 'intermedio', 'suma'),
(28, '{\"question\":\"\\u00bfCu\\u00e1nto es 34 + 49?\",\"answers\":[{\"value\":82,\"is_correct\":false},{\"value\":84,\"is_correct\":false},{\"value\":83,\"is_correct\":true},{\"value\":85,\"is_correct\":false}]}', 'intermedio', 'suma'),
(29, '{\"question\":\"\\u00bfCu\\u00e1nto es 567 + 234?\",\"answers\":[{\"value\":800,\"is_correct\":false},{\"value\":801,\"is_correct\":false},{\"value\":802,\"is_correct\":false},{\"value\":803,\"is_correct\":true}]}', 'difícil', 'suma'),
(30, '{\"question\":\"\\u00bfCu\\u00e1nto es 789 + 432?\",\"answers\":[{\"value\":1222,\"is_correct\":true},{\"value\":1220,\"is_correct\":false},{\"value\":1221,\"is_correct\":false},{\"value\":1223,\"is_correct\":false}]}', 'difícil', 'suma'),
(31, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 + 1?\",\"answers\":[{\"value\":11,\"is_correct\":false},{\"value\":10,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":12,\"is_correct\":false}]}', 'fácil', 'suma'),
(32, '{\"question\":\"\\u00bfCu\\u00e1nto es 13 + 24?\",\"answers\":[{\"value\":36,\"is_correct\":false},{\"value\":38,\"is_correct\":false},{\"value\":37,\"is_correct\":true},{\"value\":39,\"is_correct\":false}]}', 'intermedio', 'suma'),
(33, '{\"question\":\"\\u00bfCu\\u00e1nto es 81 + 92?\",\"answers\":[{\"value\":172,\"is_correct\":false},{\"value\":174,\"is_correct\":false},{\"value\":175,\"is_correct\":false},{\"value\":173,\"is_correct\":true}]}', 'intermedio', 'suma'),
(34, '{\"question\":\"\\u00bfCu\\u00e1nto es 124 + 389?\",\"answers\":[{\"value\":513,\"is_correct\":true},{\"value\":512,\"is_correct\":false},{\"value\":514,\"is_correct\":false},{\"value\":515,\"is_correct\":false}]}', 'difícil', 'suma'),
(35, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 + 8?\",\"answers\":[{\"value\":16,\"is_correct\":false},{\"value\":17,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":19,\"is_correct\":false}]}', 'fácil', 'suma'),
(36, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 + 67?\",\"answers\":[{\"value\":111,\"is_correct\":false},{\"value\":112,\"is_correct\":false},{\"value\":113,\"is_correct\":true},{\"value\":114,\"is_correct\":false}]}', 'intermedio', 'suma'),
(37, '{\"question\":\"\\u00bfCu\\u00e1nto es 653 + 748?\",\"answers\":[{\"value\":1400,\"is_correct\":false},{\"value\":1401,\"is_correct\":false},{\"value\":1402,\"is_correct\":false},{\"value\":1403,\"is_correct\":true}]}', 'difícil', 'suma'),
(38, '{\"question\":\"\\u00bfCu\\u00e1nto es 345 + 234?\",\"answers\":[{\"value\":579,\"is_correct\":true},{\"value\":578,\"is_correct\":false},{\"value\":580,\"is_correct\":false},{\"value\":581,\"is_correct\":false}]}', 'difícil', 'suma'),
(39, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 + 5?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(40, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":11,\"is_correct\":false}]}', 'fácil', 'suma'),
(41, '{\"question\":\"\\u00bfCu\\u00e1nto es 22 + 16?\",\"answers\":[{\"value\":37,\"is_correct\":false},{\"value\":38,\"is_correct\":false},{\"value\":39,\"is_correct\":false},{\"value\":40,\"is_correct\":true}]}', 'intermedio', 'suma'),
(42, '{\"question\":\"\\u00bfCu\\u00e1nto es 30 + 42?\",\"answers\":[{\"value\":72,\"is_correct\":true},{\"value\":71,\"is_correct\":false},{\"value\":73,\"is_correct\":false},{\"value\":74,\"is_correct\":false}]}', 'intermedio', 'suma'),
(43, '{\"question\":\"\\u00bfCu\\u00e1nto es 892 + 479?\",\"answers\":[{\"value\":1370,\"is_correct\":false},{\"value\":1371,\"is_correct\":true},{\"value\":1372,\"is_correct\":false},{\"value\":1373,\"is_correct\":false}]}', 'difícil', 'suma'),
(44, '{\"question\":\"\\u00bfCu\\u00e1nto es 781 + 348?\",\"answers\":[{\"value\":1128,\"is_correct\":false},{\"value\":1130,\"is_correct\":false},{\"value\":1129,\"is_correct\":true},{\"value\":1131,\"is_correct\":false}]}', 'difícil', 'suma'),
(45, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 + 6?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":true}]}', 'fácil', 'suma'),
(46, '{\"question\":\"\\u00bfCu\\u00e1nto es 19 + 23?\",\"answers\":[{\"value\":42,\"is_correct\":true},{\"value\":41,\"is_correct\":false},{\"value\":43,\"is_correct\":false},{\"value\":44,\"is_correct\":false}]}', 'intermedio', 'suma'),
(47, '{\"question\":\"\\u00bfCu\\u00e1nto es 654 + 321?\",\"answers\":[{\"value\":974,\"is_correct\":false},{\"value\":975,\"is_correct\":true},{\"value\":976,\"is_correct\":false},{\"value\":977,\"is_correct\":false}]}', 'difícil', 'suma'),
(48, '{\"question\":\"\\u00bfCu\\u00e1nto es 437 + 285?\",\"answers\":[{\"value\":721,\"is_correct\":false},{\"value\":723,\"is_correct\":false},{\"value\":722,\"is_correct\":true},{\"value\":724,\"is_correct\":false}]}', 'difícil', 'suma'),
(49, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 + 3?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":13,\"is_correct\":false},{\"value\":11,\"is_correct\":true}]}', 'fácil', 'suma'),
(50, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(51, '{\"question\":\"\\u00bfCu\\u00e1nto es 27 + 14?\",\"answers\":[{\"value\":40,\"is_correct\":false},{\"value\":41,\"is_correct\":true},{\"value\":42,\"is_correct\":false},{\"value\":43,\"is_correct\":false}]}', 'intermedio', 'suma'),
(52, '{\"question\":\"\\u00bfCu\\u00e1nto es 34 + 19?\",\"answers\":[{\"value\":52,\"is_correct\":false},{\"value\":54,\"is_correct\":false},{\"value\":53,\"is_correct\":true},{\"value\":55,\"is_correct\":false}]}', 'intermedio', 'suma'),
(53, '{\"question\":\"\\u00bfCu\\u00e1nto es 726 + 194?\",\"answers\":[{\"value\":919,\"is_correct\":false},{\"value\":921,\"is_correct\":false},{\"value\":922,\"is_correct\":false},{\"value\":920,\"is_correct\":true}]}', 'difícil', 'suma'),
(54, '{\"question\":\"\\u00bfCu\\u00e1nto es 318 + 447?\",\"answers\":[{\"value\":765,\"is_correct\":true},{\"value\":764,\"is_correct\":false},{\"value\":766,\"is_correct\":false},{\"value\":767,\"is_correct\":false}]}', 'difícil', 'suma'),
(55, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 + 4?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":13,\"is_correct\":true},{\"value\":14,\"is_correct\":false},{\"value\":15,\"is_correct\":false}]}', 'fácil', 'suma'),
(56, '{\"question\":\"\\u00bfCu\\u00e1nto es 15 + 28?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":44,\"is_correct\":false},{\"value\":43,\"is_correct\":true},{\"value\":45,\"is_correct\":false}]}', 'intermedio', 'suma'),
(57, '{\"question\":\"\\u00bfCu\\u00e1nto es 583 + 217?\",\"answers\":[{\"value\":799,\"is_correct\":false},{\"value\":801,\"is_correct\":false},{\"value\":802,\"is_correct\":false},{\"value\":800,\"is_correct\":true}]}', 'difícil', 'suma'),
(58, '{\"question\":\"\\u00bfCu\\u00e1nto es 441 + 365?\",\"answers\":[{\"value\":805,\"is_correct\":true},{\"value\":804,\"is_correct\":false},{\"value\":806,\"is_correct\":false},{\"value\":807,\"is_correct\":false}]}', 'difícil', 'suma'),
(59, '{\"question\":\"\\u00bfCu\\u00e1nto es 2 + 5?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":7,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(60, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 + 4?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(61, '{\"question\":\"\\u00bfCu\\u00e1nto es 23 + 16?\",\"answers\":[{\"value\":38,\"is_correct\":false},{\"value\":40,\"is_correct\":false},{\"value\":41,\"is_correct\":false},{\"value\":39,\"is_correct\":true}]}', 'intermedio', 'suma'),
(62, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 + 18?\",\"answers\":[{\"value\":63,\"is_correct\":true},{\"value\":62,\"is_correct\":false},{\"value\":64,\"is_correct\":false},{\"value\":65,\"is_correct\":false}]}', 'intermedio', 'suma'),
(63, '{\"question\":\"\\u00bfCu\\u00e1nto es 782 + 213?\",\"answers\":[{\"value\":994,\"is_correct\":false},{\"value\":995,\"is_correct\":true},{\"value\":996,\"is_correct\":false},{\"value\":997,\"is_correct\":false}]}', 'difícil', 'suma'),
(64, '{\"question\":\"\\u00bfCu\\u00e1nto es 619 + 431?\",\"answers\":[{\"value\":1049,\"is_correct\":false},{\"value\":1051,\"is_correct\":false},{\"value\":1050,\"is_correct\":true},{\"value\":1052,\"is_correct\":false}]}', 'difícil', 'suma'),
(65, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 + 6?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":13,\"is_correct\":true}]}', 'fácil', 'suma'),
(66, '{\"question\":\"\\u00bfCu\\u00e1nto es 17 + 24?\",\"answers\":[{\"value\":41,\"is_correct\":true},{\"value\":40,\"is_correct\":false},{\"value\":42,\"is_correct\":false},{\"value\":43,\"is_correct\":false}]}', 'intermedio', 'suma'),
(67, '{\"question\":\"\\u00bfCu\\u00e1nto es 853 + 176?\",\"answers\":[{\"value\":1028,\"is_correct\":false},{\"value\":1029,\"is_correct\":true},{\"value\":1030,\"is_correct\":false},{\"value\":1031,\"is_correct\":false}]}', 'difícil', 'suma'),
(68, '{\"question\":\"\\u00bfCu\\u00e1nto es 489 + 320?\",\"answers\":[{\"value\":808,\"is_correct\":false},{\"value\":810,\"is_correct\":false},{\"value\":809,\"is_correct\":true},{\"value\":811,\"is_correct\":false}]}', 'difícil', 'suma'),
(69, '{\"question\":\"\\u00bfCu\\u00e1nto es 1 + 7?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":8,\"is_correct\":true}]}', 'fácil', 'suma'),
(70, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 + 2?\",\"answers\":[{\"value\":10,\"is_correct\":true},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":12,\"is_correct\":false}]}', 'fácil', 'suma'),
(71, '{\"question\":\"\\u00bfCu\\u00e1nto es 21 + 13?\",\"answers\":[{\"value\":33,\"is_correct\":false},{\"value\":34,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'suma'),
(72, '{\"question\":\"\\u00bfCu\\u00e1nto es 38 + 27?\",\"answers\":[{\"value\":64,\"is_correct\":false},{\"value\":66,\"is_correct\":false},{\"value\":65,\"is_correct\":true},{\"value\":67,\"is_correct\":false}]}', 'intermedio', 'suma'),
(73, '{\"question\":\"\\u00bfCu\\u00e1nto es 649 + 482?\",\"answers\":[{\"value\":1130,\"is_correct\":false},{\"value\":1132,\"is_correct\":false},{\"value\":1133,\"is_correct\":false},{\"value\":1131,\"is_correct\":true}]}', 'difícil', 'suma'),
(74, '{\"question\":\"\\u00bfCu\\u00e1nto es 523 + 197?\",\"answers\":[{\"value\":720,\"is_correct\":true},{\"value\":719,\"is_correct\":false},{\"value\":721,\"is_correct\":false},{\"value\":722,\"is_correct\":false}]}', 'difícil', 'suma'),
(75, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 + 4?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":true},{\"value\":8,\"is_correct\":false},{\"value\":9,\"is_correct\":false}]}', 'fácil', 'suma'),
(76, '{\"question\":\"\\u00bfCu\\u00e1nto es 29 + 14?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":44,\"is_correct\":false},{\"value\":43,\"is_correct\":true},{\"value\":45,\"is_correct\":false}]}', 'intermedio', 'suma'),
(77, '{\"question\":\"\\u00bfCu\\u00e1nto es 372 + 259?\",\"answers\":[{\"value\":630,\"is_correct\":false},{\"value\":632,\"is_correct\":false},{\"value\":633,\"is_correct\":false},{\"value\":631,\"is_correct\":true}]}', 'difícil', 'suma'),
(78, '{\"question\":\"\\u00bfCu\\u00e1nto es 794 + 385?\",\"answers\":[{\"value\":1179,\"is_correct\":true},{\"value\":1178,\"is_correct\":false},{\"value\":1180,\"is_correct\":false},{\"value\":1181,\"is_correct\":false}]}', 'difícil', 'suma'),
(79, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 + 9?\",\"answers\":[{\"value\":14,\"is_correct\":false},{\"value\":15,\"is_correct\":true},{\"value\":16,\"is_correct\":false},{\"value\":17,\"is_correct\":false}]}', 'fácil', 'suma'),
(80, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 + 3?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":11,\"is_correct\":true},{\"value\":13,\"is_correct\":false}]}', 'fácil', 'suma'),
(81, '{\"question\":\"\\u00bfCu\\u00e1nto es 32 + 18?\",\"answers\":[{\"value\":49,\"is_correct\":false},{\"value\":51,\"is_correct\":false},{\"value\":52,\"is_correct\":false},{\"value\":50,\"is_correct\":true}]}', 'intermedio', 'suma'),
(82, '{\"question\":\"\\u00bfCu\\u00e1nto es 46 + 29?\",\"answers\":[{\"value\":75,\"is_correct\":true},{\"value\":74,\"is_correct\":false},{\"value\":76,\"is_correct\":false},{\"value\":77,\"is_correct\":false}]}', 'intermedio', 'suma'),
(83, '{\"question\":\"\\u00bfCu\\u00e1nto es 857 + 194?\",\"answers\":[{\"value\":1050,\"is_correct\":false},{\"value\":1049,\"is_correct\":true},{\"value\":1051,\"is_correct\":false},{\"value\":1052,\"is_correct\":false}]}', 'difícil', 'suma'),
(84, '{\"question\":\"\\u00bfCu\\u00e1nto es 648 + 529?\",\"answers\":[{\"value\":1176,\"is_correct\":false},{\"value\":1178,\"is_correct\":false},{\"value\":1177,\"is_correct\":true},{\"value\":1179,\"is_correct\":false}]}', 'difícil', 'suma'),
(85, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 + 7?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":13,\"is_correct\":false},{\"value\":11,\"is_correct\":true}]}', 'fácil', 'suma'),
(86, '{\"question\":\"\\u00bfCu\\u00e1nto es 25 + 17?\",\"answers\":[{\"value\":42,\"is_correct\":true},{\"value\":41,\"is_correct\":false},{\"value\":43,\"is_correct\":false},{\"value\":44,\"is_correct\":false}]}', 'intermedio', 'suma'),
(87, '{\"question\":\"\\u00bfCu\\u00e1nto es 489 + 377?\",\"answers\":[{\"value\":865,\"is_correct\":false},{\"value\":866,\"is_correct\":true},{\"value\":867,\"is_correct\":false},{\"value\":868,\"is_correct\":false}]}', 'difícil', 'suma'),
(88, '{\"question\":\"\\u00bfCu\\u00e1nto es 743 + 416?\",\"answers\":[{\"value\":1158,\"is_correct\":false},{\"value\":1160,\"is_correct\":false},{\"value\":1159,\"is_correct\":true},{\"value\":1161,\"is_correct\":false}]}', 'difícil', 'suma'),
(89, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":true}]}', 'fácil', 'suma'),
(90, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 + 5?\",\"answers\":[{\"value\":11,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":13,\"is_correct\":false}]}', 'fácil', 'suma'),
(91, '{\"question\":\"\\u00bfCu\\u00e1nto es 27 + 14?\",\"answers\":[{\"value\":40,\"is_correct\":false},{\"value\":41,\"is_correct\":true},{\"value\":42,\"is_correct\":false},{\"value\":43,\"is_correct\":false}]}', 'intermedio', 'suma'),
(92, '{\"question\":\"\\u00bfCu\\u00e1nto es 39 + 23?\",\"answers\":[{\"value\":61,\"is_correct\":false},{\"value\":63,\"is_correct\":false},{\"value\":62,\"is_correct\":true},{\"value\":64,\"is_correct\":false}]}', 'intermedio', 'suma'),
(93, '{\"question\":\"\\u00bfCu\\u00e1nto es 652 + 318?\",\"answers\":[{\"value\":969,\"is_correct\":false},{\"value\":971,\"is_correct\":false},{\"value\":972,\"is_correct\":false},{\"value\":970,\"is_correct\":true}]}', 'difícil', 'suma'),
(94, '{\"question\":\"\\u00bfCu\\u00e1nto es 587 + 412?\",\"answers\":[{\"value\":999,\"is_correct\":true},{\"value\":998,\"is_correct\":false},{\"value\":1000,\"is_correct\":false},{\"value\":1001,\"is_correct\":false}]}', 'difícil', 'suma'),
(95, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 + 9?\",\"answers\":[{\"value\":11,\"is_correct\":false},{\"value\":12,\"is_correct\":true},{\"value\":13,\"is_correct\":false},{\"value\":14,\"is_correct\":false}]}', 'fácil', 'suma'),
(96, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 + 29?\",\"answers\":[{\"value\":46,\"is_correct\":false},{\"value\":48,\"is_correct\":false},{\"value\":47,\"is_correct\":true},{\"value\":49,\"is_correct\":false}]}', 'intermedio', 'suma'),
(97, '{\"question\":\"\\u00bfCu\\u00e1nto es 321 + 478?\",\"answers\":[{\"value\":798,\"is_correct\":false},{\"value\":800,\"is_correct\":false},{\"value\":801,\"is_correct\":false},{\"value\":799,\"is_correct\":true}]}', 'difícil', 'suma'),
(98, '{\"question\":\"\\u00bfCu\\u00e1nto es 918 + 374?\",\"answers\":[{\"value\":1292,\"is_correct\":true},{\"value\":1291,\"is_correct\":false},{\"value\":1293,\"is_correct\":false},{\"value\":1294,\"is_correct\":false}]}', 'difícil', 'suma'),
(99, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 + 6?\",\"answers\":[{\"value\":13,\"is_correct\":false},{\"value\":14,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":16,\"is_correct\":false}]}', 'fácil', 'suma'),
(100, '{\"question\":\"\\u00bfCu\\u00e1nto es 24 + 19?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":44,\"is_correct\":false},{\"value\":43,\"is_correct\":true},{\"value\":45,\"is_correct\":false}]}', 'intermedio', 'suma'),
(101, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 - 4?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":true}]}', 'fácil', 'resta'),
(102, '{\"question\":\"\\u00bfCu\\u00e1nto es 57 - 23?\",\"answers\":[{\"value\":35,\"is_correct\":true},{\"value\":34,\"is_correct\":false},{\"value\":33,\"is_correct\":false},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'resta'),
(103, '{\"question\":\"\\u00bfCu\\u00e1nto es 345 - 123?\",\"answers\":[{\"value\":221,\"is_correct\":false},{\"value\":222,\"is_correct\":false},{\"value\":223,\"is_correct\":true},{\"value\":224,\"is_correct\":false}]}', 'difícil', 'resta'),
(104, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 - 2?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":true}]}', 'fácil', 'resta'),
(105, '{\"question\":\"\\u00bfCu\\u00e1nto es 65 - 27?\",\"answers\":[{\"value\":37,\"is_correct\":true},{\"value\":36,\"is_correct\":false},{\"value\":38,\"is_correct\":false},{\"value\":39,\"is_correct\":false}]}', 'intermedio', 'resta'),
(106, '{\"question\":\"\\u00bfCu\\u00e1nto es 723 - 387?\",\"answers\":[{\"value\":335,\"is_correct\":false},{\"value\":334,\"is_correct\":false},{\"value\":336,\"is_correct\":false},{\"value\":337,\"is_correct\":true}]}', 'difícil', 'resta'),
(107, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 - 2?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(108, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 - 29?\",\"answers\":[{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":14,\"is_correct\":true},{\"value\":17,\"is_correct\":false}]}', 'intermedio', 'resta'),
(109, '{\"question\":\"\\u00bfCu\\u00e1nto es 412 - 125?\",\"answers\":[{\"value\":287,\"is_correct\":false},{\"value\":290,\"is_correct\":false},{\"value\":285,\"is_correct\":true},{\"value\":286,\"is_correct\":false}]}', 'difícil', 'resta'),
(110, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 - 3?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'fácil', 'resta'),
(111, '{\"question\":\"\\u00bfCu\\u00e1nto es 67 - 33?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":34,\"is_correct\":true}]}', 'intermedio', 'resta'),
(112, '{\"question\":\"\\u00bfCu\\u00e1nto es 973 - 487?\",\"answers\":[{\"value\":486,\"is_correct\":true},{\"value\":485,\"is_correct\":false},{\"value\":487,\"is_correct\":false},{\"value\":485,\"is_correct\":false}]}', 'difícil', 'resta'),
(113, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 - 1?\",\"answers\":[{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(114, '{\"question\":\"\\u00bfCu\\u00e1nto es 56 - 24?\",\"answers\":[{\"value\":32,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":32,\"is_correct\":true}]}', 'intermedio', 'resta'),
(115, '{\"question\":\"\\u00bfCu\\u00e1nto es 789 - 432?\",\"answers\":[{\"value\":356,\"is_correct\":false},{\"value\":357,\"is_correct\":true},{\"value\":358,\"is_correct\":false},{\"value\":359,\"is_correct\":false}]}', 'difícil', 'resta'),
(116, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 - 1?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(117, '{\"question\":\"\\u00bfCu\\u00e1nto es 53 - 18?\",\"answers\":[{\"value\":35,\"is_correct\":true},{\"value\":36,\"is_correct\":false},{\"value\":37,\"is_correct\":false},{\"value\":38,\"is_correct\":false}]}', 'intermedio', 'resta'),
(118, '{\"question\":\"\\u00bfCu\\u00e1nto es 853 - 692?\",\"answers\":[{\"value\":161,\"is_correct\":true},{\"value\":160,\"is_correct\":false},{\"value\":162,\"is_correct\":false},{\"value\":159,\"is_correct\":false}]}', 'difícil', 'resta'),
(119, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 - 5?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'fácil', 'resta'),
(120, '{\"question\":\"\\u00bfCu\\u00e1nto es 82 - 27?\",\"answers\":[{\"value\":55,\"is_correct\":true},{\"value\":56,\"is_correct\":false},{\"value\":54,\"is_correct\":false},{\"value\":53,\"is_correct\":false}]}', 'intermedio', 'resta'),
(121, '{\"question\":\"\\u00bfCu\\u00e1nto es 918 - 563?\",\"answers\":[{\"value\":355,\"is_correct\":true},{\"value\":356,\"is_correct\":false},{\"value\":357,\"is_correct\":false},{\"value\":358,\"is_correct\":false}]}', 'difícil', 'resta'),
(122, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 - 3?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(123, '{\"question\":\"\\u00bfCu\\u00e1nto es 76 - 45?\",\"answers\":[{\"value\":31,\"is_correct\":true},{\"value\":32,\"is_correct\":false},{\"value\":30,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(124, '{\"question\":\"\\u00bfCu\\u00e1nto es 991 - 547?\",\"answers\":[{\"value\":445,\"is_correct\":false},{\"value\":444,\"is_correct\":true},{\"value\":446,\"is_correct\":false},{\"value\":447,\"is_correct\":false}]}', 'difícil', 'resta'),
(125, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 - 4?\",\"answers\":[{\"value\":3,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(126, '{\"question\":\"\\u00bfCu\\u00e1nto es 64 - 21?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":43,\"is_correct\":true},{\"value\":41,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'resta'),
(127, '{\"question\":\"\\u00bfCu\\u00e1nto es 742 - 519?\",\"answers\":[{\"value\":223,\"is_correct\":true},{\"value\":224,\"is_correct\":false},{\"value\":225,\"is_correct\":false},{\"value\":226,\"is_correct\":false}]}', 'difícil', 'resta'),
(128, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 - 1?\",\"answers\":[{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(129, '{\"question\":\"\\u00bfCu\\u00e1nto es 53 - 14?\",\"answers\":[{\"value\":39,\"is_correct\":true},{\"value\":40,\"is_correct\":false},{\"value\":41,\"is_correct\":false},{\"value\":38,\"is_correct\":false}]}', 'intermedio', 'resta'),
(130, '{\"question\":\"\\u00bfCu\\u00e1nto es 893 - 632?\",\"answers\":[{\"value\":261,\"is_correct\":true},{\"value\":260,\"is_correct\":false},{\"value\":259,\"is_correct\":false},{\"value\":258,\"is_correct\":false}]}', 'difícil', 'resta'),
(131, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 - 7?\",\"answers\":[{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(132, '{\"question\":\"\\u00bfCu\\u00e1nto es 57 - 23?\",\"answers\":[{\"value\":34,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(133, '{\"question\":\"\\u00bfCu\\u00e1nto es 831 - 482?\",\"answers\":[{\"value\":349,\"is_correct\":true},{\"value\":350,\"is_correct\":false},{\"value\":348,\"is_correct\":false},{\"value\":351,\"is_correct\":false}]}', 'difícil', 'resta');

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
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacions`
--

CREATE TABLE `puntuacions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `modo` varchar(255) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('xoB5q09CGexu0hnRVBmHTqdXUXiytsYSUTOw4ALt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmdmOTRoTTN1bUJYWGVhTGc5eUM1QVRHY1Z3a1RUVDRDZjNUMXFobCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1733732578);

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
  `rol` varchar(255) NOT NULL,
  `clase_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `rol`, `clase_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user', 'user@gmail.com', NULL, '$2y$12$M8LmhVHo5Mt6N7RBkBbgYeGoGas3yvMw5O.RV1XQ/Y2qUzKJO9B.y', 'user', 1, NULL, '2024-12-08 13:23:18', '2024-12-08 13:23:18'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$12$JzkDWUBbGVmP4k8RXXd72utsBbTlkS9J7.f74dT1JKHYsdvI.1Msy', 'Admin', 1, NULL, '2024-12-08 13:23:18', '2024-12-08 13:23:18');

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
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `operacions`
--
ALTER TABLE `operacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `puntuacions`
--
ALTER TABLE `puntuacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puntuacions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_clase_id_foreign` (`clase_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `operacions`
--
ALTER TABLE `operacions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puntuacions`
--
ALTER TABLE `puntuacions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `puntuacions`
--
ALTER TABLE `puntuacions`
  ADD CONSTRAINT `puntuacions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_clase_id_foreign` FOREIGN KEY (`clase_id`) REFERENCES `clases` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
