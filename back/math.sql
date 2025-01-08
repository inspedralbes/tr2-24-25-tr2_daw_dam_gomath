-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2024 a las 09:45:57
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
(1, 'Clase1', '2024-12-20 07:43:24', '2024-12-20 07:43:24');

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
-- Estructura de tabla para la tabla `joc_codis`
--

CREATE TABLE `joc_codis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codi_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`codi_json`)),
  `nivel_dificultad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `joc_codis`
--

INSERT INTO `joc_codis` (`id`, `codi_json`, `nivel_dificultad`) VALUES
(1, '{\"secretCode\":\"376\",\"codes\":[{\"code\":\"123\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"871\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"349\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"456\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"567\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"}]}', ''),
(2, '{\"secretCode\":\"492\",\"codes\":[{\"code\":\"154\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"582\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"371\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"983\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"742\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, 1 en la seva posici\\u00f3 correcta.\"}]}', ''),
(3, '{\"secretCode\":\"135\",\"codes\":[{\"code\":\"123\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, 1 en la seva posici\\u00f3 correcta.\"},{\"code\":\"356\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"937\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"865\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"246\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"}]}', ''),
(4, '{\"secretCode\":\"394\",\"codes\":[{\"code\":\"291\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"245\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"463\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"578\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"809\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"}]}', ''),
(5, '{\"secretCode\":\"521\",\"codes\":[{\"code\":\"962\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"175\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"409\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"614\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"823\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"}]}', ''),
(6, '{\"secretCode\":\"483\",\"codes\":[{\"code\":\"731\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"278\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"162\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"985\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"304\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"}]}', ''),
(7, '{\"secretCode\":\"938\",\"codes\":[{\"code\":\"286\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"430\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"723\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"859\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"617\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"}]}', ''),
(8, '{\"secretCode\":\"345\",\"codes\":[{\"code\":\"764\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"503\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"241\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"659\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"987\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"}]}', ''),
(9, '{\"secretCode\":\"207\",\"codes\":[{\"code\":\"580\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"729\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"603\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"874\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"915\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"}]}', ''),
(10, '{\"secretCode\":\"042\",\"codes\":[{\"code\":\"682\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"614\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"206\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"738\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"780\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"}]}', ''),
(11, '{\"secretCode\":\"482\",\"codes\":[{\"code\":\"123\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"845\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, per\\u00f2 no en la seva posici\\u00f3.\"},{\"code\":\"438\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, 1 en la seva posici\\u00f3 correcta.\"},{\"code\":\"862\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, 1 en la seva posici\\u00f3 correcta.\"},{\"code\":\"491\",\"pista\":\"T\\u00e9 1 n\\u00famero en la seva posici\\u00f3 correcte.\"}]}', ''),
(12, '{\"secretCode\":\"627\",\"codes\":[{\"code\":\"123\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"781\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"642\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, un en la seva posici\\u00f3 correcta.\"},{\"code\":\"257\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, un en la seva posici\\u00f3 correcta.\"},{\"code\":\"867\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, un en la seva posici\\u00f3 correcta.\"}]}', ''),
(13, '{\"secretCode\":\"904\",\"codes\":[{\"code\":\"450\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, per\\u00f2 no en la seva posici\\u00f3.\"},{\"code\":\"319\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"091\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, per\\u00f2 no en la seva posici\\u00f3.\"},{\"code\":\"564\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"804\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes en la seva posici\\u00f3 correcta.\"}]}', ''),
(14, '{\"secretCode\":\"173\",\"codes\":[{\"code\":\"318\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, per\\u00f2 no en la seva posici\\u00f3.\"},{\"code\":\"157\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, un en la seva posici\\u00f3 correcta.\"},{\"code\":\"739\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"523\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"372\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, un en la seva posici\\u00f3 correcta.\"}]}', ''),
(15, '{\"secretCode\":\"274\",\"codes\":[{\"code\":\"942\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes, per\\u00f2 no en la seva posici\\u00f3.\"},{\"code\":\"170\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"526\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"391\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"738\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"}]}', ''),
(16, '{\"secretCode\":\"718\",\"codes\":[{\"code\":\"548\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"530\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"157\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"806\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"647\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"}]}', ''),
(17, '{\"secretCode\":\"478\",\"codes\":[{\"code\":\"157\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"841\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"128\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"624\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"362\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"}]}', ''),
(18, '{\"secretCode\":\"430\",\"codes\":[{\"code\":\"206\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"014\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"137\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"},{\"code\":\"549\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"921\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"}]}', ''),
(19, '{\"secretCode\":\"619\",\"codes\":[{\"code\":\"902\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"135\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"740\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"291\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"632\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"}]}', ''),
(20, '{\"secretCode\":\"974\",\"codes\":[{\"code\":\"146\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"389\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"508\",\"pista\":\"T\\u00e9 0 n\\u00fameros correctes.\"},{\"code\":\"457\",\"pista\":\"T\\u00e9 2 n\\u00fameros correctes per\\u00f2 no en la posici\\u00f3 correcta.\"},{\"code\":\"920\",\"pista\":\"T\\u00e9 1 n\\u00famero correcte en la posici\\u00f3 correcta.\"}]}', '');

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
(5, '2024_12_11_114900_create_joc_codis_table', 1),
(6, '2_clases', 1),
(7, '3_users', 1),
(8, '4_puntuacions', 1);

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
(1, '{\"question\":\"Quant \\u00e9s 3 + 5?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":9,\"is_correct\":false}]}', 'fácil', 'suma'),
(2, '{\"question\":\"Quant \\u00e9s 7 + 2?\",\"answers\":[{\"value\":9,\"is_correct\":true},{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":11,\"is_correct\":false}]}', 'fácil', 'suma'),
(3, '{\"question\":\"Quant \\u00e9s 12 + 23?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'suma'),
(4, '{\"question\":\"Quant \\u00e9s 18 + 24?\",\"answers\":[{\"value\":41,\"is_correct\":false},{\"value\":42,\"is_correct\":true},{\"value\":43,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'suma'),
(5, '{\"question\":\"Quant \\u00e9s 102 + 203?\",\"answers\":[{\"value\":304,\"is_correct\":false},{\"value\":306,\"is_correct\":false},{\"value\":305,\"is_correct\":true},{\"value\":307,\"is_correct\":false}]}', 'difícil', 'suma'),
(6, '{\"question\":\"Quant \\u00e9s 350 + 420?\",\"answers\":[{\"value\":760,\"is_correct\":false},{\"value\":780,\"is_correct\":false},{\"value\":750,\"is_correct\":false},{\"value\":770,\"is_correct\":true}]}', 'difícil', 'suma'),
(7, '{\"question\":\"Quant \\u00e9s 4 + 6?\",\"answers\":[{\"value\":10,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'fácil', 'suma'),
(8, '{\"question\":\"Quant \\u00e9s 13 + 27?\",\"answers\":[{\"value\":41,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":39,\"is_correct\":false},{\"value\":38,\"is_correct\":false}]}', 'intermedio', 'suma'),
(9, '{\"question\":\"Quant \\u00e9s 6 + 1?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":8,\"is_correct\":false},{\"value\":7,\"is_correct\":true},{\"value\":9,\"is_correct\":false}]}', 'fácil', 'suma'),
(10, '{\"question\":\"Quant \\u00e9s 530 + 290?\",\"answers\":[{\"value\":810,\"is_correct\":false},{\"value\":830,\"is_correct\":false},{\"value\":800,\"is_correct\":false},{\"value\":820,\"is_correct\":true}]}', 'difícil', 'suma'),
(11, '{\"question\":\"Quant \\u00e9s 2 + 6?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(12, '{\"question\":\"Quant \\u00e9s 4 + 5?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'fácil', 'suma'),
(13, '{\"question\":\"Quant \\u00e9s 14 + 25?\",\"answers\":[{\"value\":38,\"is_correct\":false},{\"value\":40,\"is_correct\":false},{\"value\":39,\"is_correct\":true},{\"value\":41,\"is_correct\":false}]}', 'intermedio', 'suma'),
(14, '{\"question\":\"Quant \\u00e9s 31 + 42?\",\"answers\":[{\"value\":72,\"is_correct\":false},{\"value\":74,\"is_correct\":false},{\"value\":71,\"is_correct\":false},{\"value\":73,\"is_correct\":true}]}', 'intermedio', 'suma'),
(15, '{\"question\":\"Quant \\u00e9s 123 + 456?\",\"answers\":[{\"value\":579,\"is_correct\":true},{\"value\":578,\"is_correct\":false},{\"value\":580,\"is_correct\":false},{\"value\":581,\"is_correct\":false}]}', 'difícil', 'suma'),
(16, '{\"question\":\"Quant \\u00e9s 789 + 345?\",\"answers\":[{\"value\":1133,\"is_correct\":false},{\"value\":1134,\"is_correct\":true},{\"value\":1135,\"is_correct\":false},{\"value\":1136,\"is_correct\":false}]}', 'difícil', 'suma'),
(17, '{\"question\":\"Quant \\u00e9s 8 + 3?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":11,\"is_correct\":true},{\"value\":13,\"is_correct\":false}]}', 'fácil', 'suma'),
(18, '{\"question\":\"Quant \\u00e9s 45 + 62?\",\"answers\":[{\"value\":106,\"is_correct\":false},{\"value\":108,\"is_correct\":false},{\"value\":109,\"is_correct\":false},{\"value\":107,\"is_correct\":true}]}', 'intermedio', 'suma'),
(19, '{\"question\":\"Quant \\u00e9s 56 + 78?\",\"answers\":[{\"value\":134,\"is_correct\":true},{\"value\":133,\"is_correct\":false},{\"value\":135,\"is_correct\":false},{\"value\":136,\"is_correct\":false}]}', 'intermedio', 'suma'),
(20, '{\"question\":\"Quant \\u00e9s 234 + 678?\",\"answers\":[{\"value\":911,\"is_correct\":false},{\"value\":913,\"is_correct\":false},{\"value\":912,\"is_correct\":true},{\"value\":914,\"is_correct\":false}]}', 'difícil', 'suma'),
(21, '{\"question\":\"Quant \\u00e9s 345 + 567?\",\"answers\":[{\"value\":910,\"is_correct\":false},{\"value\":913,\"is_correct\":false},{\"value\":912,\"is_correct\":true},{\"value\":914,\"is_correct\":false}]}', 'difícil', 'suma'),
(22, '{\"question\":\"Quant \\u00e9s 5 + 4?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":true}]}', 'fácil', 'suma'),
(23, '{\"question\":\"Quant \\u00e9s 28 + 35?\",\"answers\":[{\"value\":62,\"is_correct\":false},{\"value\":63,\"is_correct\":true},{\"value\":64,\"is_correct\":false},{\"value\":65,\"is_correct\":false}]}', 'intermedio', 'suma'),
(24, '{\"question\":\"Quant \\u00e9s 189 + 176?\",\"answers\":[{\"value\":365,\"is_correct\":false},{\"value\":367,\"is_correct\":false},{\"value\":366,\"is_correct\":true},{\"value\":368,\"is_correct\":false}]}', 'difícil', 'suma'),
(25, '{\"question\":\"Quant \\u00e9s 3 + 7?\",\"answers\":[{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":10,\"is_correct\":true}]}', 'fácil', 'suma'),
(26, '{\"question\":\"Quant \\u00e9s 6 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(27, '{\"question\":\"Quant \\u00e9s 18 + 27?\",\"answers\":[{\"value\":44,\"is_correct\":false},{\"value\":45,\"is_correct\":true},{\"value\":46,\"is_correct\":false},{\"value\":47,\"is_correct\":false}]}', 'intermedio', 'suma'),
(28, '{\"question\":\"Quant \\u00e9s 34 + 49?\",\"answers\":[{\"value\":82,\"is_correct\":false},{\"value\":84,\"is_correct\":false},{\"value\":83,\"is_correct\":true},{\"value\":85,\"is_correct\":false}]}', 'intermedio', 'suma'),
(29, '{\"question\":\"Quant \\u00e9s 567 + 234?\",\"answers\":[{\"value\":800,\"is_correct\":false},{\"value\":801,\"is_correct\":true},{\"value\":802,\"is_correct\":false},{\"value\":803,\"is_correct\":false}]}', 'difícil', 'suma'),
(30, '{\"question\":\"Quant \\u00e9s 789 + 432?\",\"answers\":[{\"value\":1222,\"is_correct\":true},{\"value\":1220,\"is_correct\":false},{\"value\":1221,\"is_correct\":false},{\"value\":1223,\"is_correct\":false}]}', 'difícil', 'suma'),
(31, '{\"question\":\"Quant \\u00e9s 9 + 1?\",\"answers\":[{\"value\":11,\"is_correct\":false},{\"value\":10,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":12,\"is_correct\":false}]}', 'fácil', 'suma'),
(32, '{\"question\":\"Quant \\u00e9s 13 + 24?\",\"answers\":[{\"value\":36,\"is_correct\":false},{\"value\":38,\"is_correct\":false},{\"value\":37,\"is_correct\":true},{\"value\":39,\"is_correct\":false}]}', 'intermedio', 'suma'),
(33, '{\"question\":\"Quant \\u00e9s 81 + 92?\",\"answers\":[{\"value\":172,\"is_correct\":false},{\"value\":174,\"is_correct\":false},{\"value\":175,\"is_correct\":false},{\"value\":173,\"is_correct\":true}]}', 'intermedio', 'suma'),
(34, '{\"question\":\"Quant \\u00e9s 124 + 389?\",\"answers\":[{\"value\":513,\"is_correct\":true},{\"value\":512,\"is_correct\":false},{\"value\":514,\"is_correct\":false},{\"value\":515,\"is_correct\":false}]}', 'difícil', 'suma'),
(35, '{\"question\":\"Quant \\u00e9s 9 + 8?\",\"answers\":[{\"value\":16,\"is_correct\":false},{\"value\":17,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":19,\"is_correct\":false}]}', 'fácil', 'suma'),
(36, '{\"question\":\"Quant \\u00e9s 45 + 67?\",\"answers\":[{\"value\":111,\"is_correct\":false},{\"value\":112,\"is_correct\":false},{\"value\":113,\"is_correct\":true},{\"value\":114,\"is_correct\":false}]}', 'intermedio', 'suma'),
(37, '{\"question\":\"Quant \\u00e9s 653 + 748?\",\"answers\":[{\"value\":1400,\"is_correct\":false},{\"value\":1401,\"is_correct\":false},{\"value\":1402,\"is_correct\":false},{\"value\":1403,\"is_correct\":true}]}', 'difícil', 'suma'),
(38, '{\"question\":\"Quant \\u00e9s 345 + 234?\",\"answers\":[{\"value\":579,\"is_correct\":true},{\"value\":578,\"is_correct\":false},{\"value\":580,\"is_correct\":false},{\"value\":581,\"is_correct\":false}]}', 'difícil', 'suma'),
(39, '{\"question\":\"Quant \\u00e9s 4 + 5?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(40, '{\"question\":\"Quant \\u00e9s 7 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":11,\"is_correct\":false}]}', 'fácil', 'suma'),
(41, '{\"question\":\"Quant \\u00e9s 22 + 16?\",\"answers\":[{\"value\":37,\"is_correct\":false},{\"value\":38,\"is_correct\":true},{\"value\":39,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'suma'),
(42, '{\"question\":\"Quant \\u00e9s 30 + 42?\",\"answers\":[{\"value\":72,\"is_correct\":true},{\"value\":71,\"is_correct\":false},{\"value\":73,\"is_correct\":false},{\"value\":74,\"is_correct\":false}]}', 'intermedio', 'suma'),
(43, '{\"question\":\"Quant \\u00e9s 892 + 479?\",\"answers\":[{\"value\":1370,\"is_correct\":false},{\"value\":1371,\"is_correct\":true},{\"value\":1372,\"is_correct\":false},{\"value\":1373,\"is_correct\":false}]}', 'difícil', 'suma'),
(44, '{\"question\":\"Quant \\u00e9s 781 + 348?\",\"answers\":[{\"value\":1128,\"is_correct\":false},{\"value\":1130,\"is_correct\":false},{\"value\":1129,\"is_correct\":true},{\"value\":1131,\"is_correct\":false}]}', 'difícil', 'suma'),
(45, '{\"question\":\"Quant \\u00e9s 5 + 6?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":true}]}', 'fácil', 'suma'),
(46, '{\"question\":\"Quant \\u00e9s 19 + 23?\",\"answers\":[{\"value\":42,\"is_correct\":true},{\"value\":41,\"is_correct\":false},{\"value\":43,\"is_correct\":false},{\"value\":44,\"is_correct\":false}]}', 'intermedio', 'suma'),
(47, '{\"question\":\"Quant \\u00e9s 654 + 321?\",\"answers\":[{\"value\":974,\"is_correct\":false},{\"value\":975,\"is_correct\":true},{\"value\":976,\"is_correct\":false},{\"value\":977,\"is_correct\":false}]}', 'difícil', 'suma'),
(48, '{\"question\":\"Quant \\u00e9s 437 + 285?\",\"answers\":[{\"value\":721,\"is_correct\":false},{\"value\":723,\"is_correct\":false},{\"value\":722,\"is_correct\":true},{\"value\":724,\"is_correct\":false}]}', 'difícil', 'suma'),
(49, '{\"question\":\"Quant \\u00e9s 8 + 3?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":13,\"is_correct\":false},{\"value\":11,\"is_correct\":true}]}', 'fácil', 'suma'),
(50, '{\"question\":\"Quant \\u00e9s 6 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(51, '{\"question\":\"Quant \\u00e9s 27 + 14?\",\"answers\":[{\"value\":40,\"is_correct\":false},{\"value\":41,\"is_correct\":true},{\"value\":42,\"is_correct\":false},{\"value\":43,\"is_correct\":false}]}', 'intermedio', 'suma'),
(52, '{\"question\":\"Quant \\u00e9s 34 + 19?\",\"answers\":[{\"value\":52,\"is_correct\":false},{\"value\":54,\"is_correct\":false},{\"value\":53,\"is_correct\":true},{\"value\":55,\"is_correct\":false}]}', 'intermedio', 'suma'),
(53, '{\"question\":\"Quant \\u00e9s 726 + 194?\",\"answers\":[{\"value\":919,\"is_correct\":false},{\"value\":921,\"is_correct\":false},{\"value\":922,\"is_correct\":false},{\"value\":920,\"is_correct\":true}]}', 'difícil', 'suma'),
(54, '{\"question\":\"Quant \\u00e9s 318 + 447?\",\"answers\":[{\"value\":765,\"is_correct\":true},{\"value\":764,\"is_correct\":false},{\"value\":766,\"is_correct\":false},{\"value\":767,\"is_correct\":false}]}', 'difícil', 'suma'),
(55, '{\"question\":\"Quant \\u00e9s 9 + 4?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":13,\"is_correct\":true},{\"value\":14,\"is_correct\":false},{\"value\":15,\"is_correct\":false}]}', 'fácil', 'suma'),
(56, '{\"question\":\"Quant \\u00e9s 15 + 28?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":44,\"is_correct\":false},{\"value\":43,\"is_correct\":true},{\"value\":45,\"is_correct\":false}]}', 'intermedio', 'suma'),
(57, '{\"question\":\"Quant \\u00e9s 583 + 217?\",\"answers\":[{\"value\":799,\"is_correct\":false},{\"value\":801,\"is_correct\":false},{\"value\":802,\"is_correct\":false},{\"value\":800,\"is_correct\":true}]}', 'difícil', 'suma'),
(58, '{\"question\":\"Quant \\u00e9s 441 + 365?\",\"answers\":[{\"value\":805,\"is_correct\":false},{\"value\":804,\"is_correct\":false},{\"value\":806,\"is_correct\":true},{\"value\":807,\"is_correct\":false}]}', 'difícil', 'suma'),
(59, '{\"question\":\"Quant \\u00e9s 2 + 5?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":7,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(60, '{\"question\":\"Quant \\u00e9s 4 + 4?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(61, '{\"question\":\"Quant \\u00e9s 23 + 16?\",\"answers\":[{\"value\":38,\"is_correct\":false},{\"value\":40,\"is_correct\":false},{\"value\":41,\"is_correct\":false},{\"value\":39,\"is_correct\":true}]}', 'intermedio', 'suma'),
(62, '{\"question\":\"Quant \\u00e9s 45 + 18?\",\"answers\":[{\"value\":63,\"is_correct\":true},{\"value\":62,\"is_correct\":false},{\"value\":64,\"is_correct\":false},{\"value\":65,\"is_correct\":false}]}', 'intermedio', 'suma'),
(63, '{\"question\":\"Quant \\u00e9s 782 + 213?\",\"answers\":[{\"value\":994,\"is_correct\":false},{\"value\":995,\"is_correct\":true},{\"value\":996,\"is_correct\":false},{\"value\":997,\"is_correct\":false}]}', 'difícil', 'suma'),
(64, '{\"question\":\"Quant \\u00e9s 619 + 431?\",\"answers\":[{\"value\":1049,\"is_correct\":false},{\"value\":1051,\"is_correct\":false},{\"value\":1050,\"is_correct\":true},{\"value\":1052,\"is_correct\":false}]}', 'difícil', 'suma'),
(65, '{\"question\":\"Quant \\u00e9s 7 + 6?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":13,\"is_correct\":true}]}', 'fácil', 'suma'),
(66, '{\"question\":\"Quant \\u00e9s 17 + 24?\",\"answers\":[{\"value\":41,\"is_correct\":true},{\"value\":40,\"is_correct\":false},{\"value\":42,\"is_correct\":false},{\"value\":43,\"is_correct\":false}]}', 'intermedio', 'suma'),
(67, '{\"question\":\"Quant \\u00e9s 853 + 176?\",\"answers\":[{\"value\":1028,\"is_correct\":false},{\"value\":1029,\"is_correct\":true},{\"value\":1030,\"is_correct\":false},{\"value\":1031,\"is_correct\":false}]}', 'difícil', 'suma'),
(68, '{\"question\":\"Quant \\u00e9s 489 + 320?\",\"answers\":[{\"value\":808,\"is_correct\":false},{\"value\":810,\"is_correct\":false},{\"value\":809,\"is_correct\":true},{\"value\":811,\"is_correct\":false}]}', 'difícil', 'suma'),
(69, '{\"question\":\"Quant \\u00e9s 1 + 7?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":8,\"is_correct\":true}]}', 'fácil', 'suma'),
(70, '{\"question\":\"Quant \\u00e9s 8 + 2?\",\"answers\":[{\"value\":10,\"is_correct\":true},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":12,\"is_correct\":false}]}', 'fácil', 'suma'),
(71, '{\"question\":\"Quant \\u00e9s 21 + 13?\",\"answers\":[{\"value\":33,\"is_correct\":false},{\"value\":34,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'suma'),
(72, '{\"question\":\"Quant \\u00e9s 38 + 27?\",\"answers\":[{\"value\":64,\"is_correct\":false},{\"value\":66,\"is_correct\":false},{\"value\":65,\"is_correct\":true},{\"value\":67,\"is_correct\":false}]}', 'intermedio', 'suma'),
(73, '{\"question\":\"Quant \\u00e9s 649 + 482?\",\"answers\":[{\"value\":1130,\"is_correct\":false},{\"value\":1132,\"is_correct\":false},{\"value\":1133,\"is_correct\":false},{\"value\":1131,\"is_correct\":true}]}', 'difícil', 'suma'),
(74, '{\"question\":\"Quant \\u00e9s 523 + 197?\",\"answers\":[{\"value\":720,\"is_correct\":true},{\"value\":719,\"is_correct\":false},{\"value\":721,\"is_correct\":false},{\"value\":722,\"is_correct\":false}]}', 'difícil', 'suma'),
(75, '{\"question\":\"Quant \\u00e9s 3 + 4?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":true},{\"value\":8,\"is_correct\":false},{\"value\":9,\"is_correct\":false}]}', 'fácil', 'suma'),
(76, '{\"question\":\"Quant \\u00e9s 29 + 14?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":44,\"is_correct\":false},{\"value\":43,\"is_correct\":true},{\"value\":45,\"is_correct\":false}]}', 'intermedio', 'suma'),
(77, '{\"question\":\"Quant \\u00e9s 372 + 259?\",\"answers\":[{\"value\":630,\"is_correct\":false},{\"value\":632,\"is_correct\":false},{\"value\":633,\"is_correct\":false},{\"value\":631,\"is_correct\":true}]}', 'difícil', 'suma'),
(78, '{\"question\":\"Quant \\u00e9s 794 + 385?\",\"answers\":[{\"value\":1179,\"is_correct\":true},{\"value\":1178,\"is_correct\":false},{\"value\":1180,\"is_correct\":false},{\"value\":1181,\"is_correct\":false}]}', 'difícil', 'suma'),
(79, '{\"question\":\"Quant \\u00e9s 6 + 9?\",\"answers\":[{\"value\":14,\"is_correct\":false},{\"value\":15,\"is_correct\":true},{\"value\":16,\"is_correct\":false},{\"value\":17,\"is_correct\":false}]}', 'fácil', 'suma'),
(80, '{\"question\":\"Quant \\u00e9s 8 + 3?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":11,\"is_correct\":true},{\"value\":13,\"is_correct\":false}]}', 'fácil', 'suma'),
(81, '{\"question\":\"Quant \\u00e9s 32 + 18?\",\"answers\":[{\"value\":49,\"is_correct\":false},{\"value\":51,\"is_correct\":false},{\"value\":52,\"is_correct\":false},{\"value\":50,\"is_correct\":true}]}', 'intermedio', 'suma'),
(82, '{\"question\":\"Quant \\u00e9s 46 + 29?\",\"answers\":[{\"value\":75,\"is_correct\":true},{\"value\":74,\"is_correct\":false},{\"value\":76,\"is_correct\":false},{\"value\":77,\"is_correct\":false}]}', 'intermedio', 'suma'),
(83, '{\"question\":\"Quant \\u00e9s 857 + 194?\",\"answers\":[{\"value\":1050,\"is_correct\":false},{\"value\":1049,\"is_correct\":true},{\"value\":1051,\"is_correct\":false},{\"value\":1052,\"is_correct\":false}]}', 'difícil', 'suma'),
(84, '{\"question\":\"Quant \\u00e9s 648 + 529?\",\"answers\":[{\"value\":1176,\"is_correct\":false},{\"value\":1178,\"is_correct\":false},{\"value\":1177,\"is_correct\":true},{\"value\":1179,\"is_correct\":false}]}', 'difícil', 'suma'),
(85, '{\"question\":\"Quant \\u00e9s 4 + 7?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":13,\"is_correct\":false},{\"value\":11,\"is_correct\":true}]}', 'fácil', 'suma'),
(86, '{\"question\":\"Quant \\u00e9s 25 + 17?\",\"answers\":[{\"value\":42,\"is_correct\":true},{\"value\":41,\"is_correct\":false},{\"value\":43,\"is_correct\":false},{\"value\":44,\"is_correct\":false}]}', 'intermedio', 'suma'),
(87, '{\"question\":\"Quant \\u00e9s 489 + 377?\",\"answers\":[{\"value\":865,\"is_correct\":false},{\"value\":866,\"is_correct\":true},{\"value\":867,\"is_correct\":false},{\"value\":868,\"is_correct\":false}]}', 'difícil', 'suma'),
(88, '{\"question\":\"Quant \\u00e9s 743 + 416?\",\"answers\":[{\"value\":1158,\"is_correct\":false},{\"value\":1160,\"is_correct\":false},{\"value\":1159,\"is_correct\":true},{\"value\":1161,\"is_correct\":false}]}', 'difícil', 'suma'),
(89, '{\"question\":\"Quant \\u00e9s 7 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":true}]}', 'fácil', 'suma'),
(90, '{\"question\":\"Quant \\u00e9s 6 + 5?\",\"answers\":[{\"value\":11,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":13,\"is_correct\":false}]}', 'fácil', 'suma'),
(91, '{\"question\":\"Quant \\u00e9s 27 + 14?\",\"answers\":[{\"value\":40,\"is_correct\":false},{\"value\":41,\"is_correct\":true},{\"value\":42,\"is_correct\":false},{\"value\":43,\"is_correct\":false}]}', 'intermedio', 'suma'),
(92, '{\"question\":\"Quant \\u00e9s 39 + 23?\",\"answers\":[{\"value\":61,\"is_correct\":false},{\"value\":63,\"is_correct\":false},{\"value\":62,\"is_correct\":true},{\"value\":64,\"is_correct\":false}]}', 'intermedio', 'suma'),
(93, '{\"question\":\"Quant \\u00e9s 652 + 318?\",\"answers\":[{\"value\":969,\"is_correct\":false},{\"value\":971,\"is_correct\":false},{\"value\":972,\"is_correct\":false},{\"value\":970,\"is_correct\":true}]}', 'difícil', 'suma'),
(94, '{\"question\":\"Quant \\u00e9s 587 + 412?\",\"answers\":[{\"value\":999,\"is_correct\":true},{\"value\":998,\"is_correct\":false},{\"value\":1000,\"is_correct\":false},{\"value\":1001,\"is_correct\":false}]}', 'difícil', 'suma'),
(95, '{\"question\":\"Quant \\u00e9s 3 + 9?\",\"answers\":[{\"value\":11,\"is_correct\":false},{\"value\":12,\"is_correct\":true},{\"value\":13,\"is_correct\":false},{\"value\":14,\"is_correct\":false}]}', 'fácil', 'suma'),
(96, '{\"question\":\"Quant \\u00e9s 18 + 29?\",\"answers\":[{\"value\":46,\"is_correct\":false},{\"value\":48,\"is_correct\":false},{\"value\":47,\"is_correct\":true},{\"value\":49,\"is_correct\":false}]}', 'intermedio', 'suma'),
(97, '{\"question\":\"Quant \\u00e9s 321 + 478?\",\"answers\":[{\"value\":798,\"is_correct\":false},{\"value\":800,\"is_correct\":false},{\"value\":801,\"is_correct\":false},{\"value\":799,\"is_correct\":true}]}', 'difícil', 'suma'),
(98, '{\"question\":\"Quant \\u00e9s 918 + 374?\",\"answers\":[{\"value\":1292,\"is_correct\":true},{\"value\":1291,\"is_correct\":false},{\"value\":1293,\"is_correct\":false},{\"value\":1294,\"is_correct\":false}]}', 'difícil', 'suma'),
(99, '{\"question\":\"Quant \\u00e9s 8 + 6?\",\"answers\":[{\"value\":13,\"is_correct\":false},{\"value\":14,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":16,\"is_correct\":false}]}', 'fácil', 'suma'),
(100, '{\"question\":\"Quant \\u00e9s 24 + 19?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":44,\"is_correct\":false},{\"value\":43,\"is_correct\":true},{\"value\":45,\"is_correct\":false}]}', 'intermedio', 'suma'),
(101, '{\"question\":\"Quant \\u00e9s 9 - 4?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":true}]}', 'fácil', 'resta'),
(102, '{\"question\":\"Quant \\u00e9s 57 - 23?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":true},{\"value\":33,\"is_correct\":false},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'resta'),
(103, '{\"question\":\"Quant \\u00e9s 345 - 123?\",\"answers\":[{\"value\":221,\"is_correct\":false},{\"value\":222,\"is_correct\":true},{\"value\":223,\"is_correct\":false},{\"value\":224,\"is_correct\":false}]}', 'difícil', 'resta'),
(104, '{\"question\":\"Quant \\u00e9s 8 - 2?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":true}]}', 'fácil', 'resta'),
(105, '{\"question\":\"Quant \\u00e9s 65 - 27?\",\"answers\":[{\"value\":37,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":38,\"is_correct\":true},{\"value\":39,\"is_correct\":false}]}', 'intermedio', 'resta'),
(106, '{\"question\":\"Quant \\u00e9s 723 - 387?\",\"answers\":[{\"value\":335,\"is_correct\":false},{\"value\":334,\"is_correct\":false},{\"value\":336,\"is_correct\":true},{\"value\":337,\"is_correct\":false}]}', 'difícil', 'resta'),
(107, '{\"question\":\"Quant \\u00e9s 7 - 2?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(108, '{\"question\":\"Quant \\u00e9s 45 - 29?\",\"answers\":[{\"value\":16,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":17,\"is_correct\":false}]}', 'intermedio', 'resta'),
(109, '{\"question\":\"Quant \\u00e9s 412 - 125?\",\"answers\":[{\"value\":287,\"is_correct\":true},{\"value\":290,\"is_correct\":false},{\"value\":285,\"is_correct\":false},{\"value\":286,\"is_correct\":false}]}', 'difícil', 'resta'),
(110, '{\"question\":\"Quant \\u00e9s 8 - 3?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'fácil', 'resta'),
(111, '{\"question\":\"Quant \\u00e9s 67 - 33?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":34,\"is_correct\":true}]}', 'intermedio', 'resta'),
(112, '{\"question\":\"Quant \\u00e9s 973 - 487?\",\"answers\":[{\"value\":486,\"is_correct\":true},{\"value\":485,\"is_correct\":false},{\"value\":487,\"is_correct\":false},{\"value\":485,\"is_correct\":false}]}', 'difícil', 'resta'),
(113, '{\"question\":\"Quant \\u00e9s 4 - 1?\",\"answers\":[{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(114, '{\"question\":\"Quant \\u00e9s 56 - 24?\",\"answers\":[{\"value\":80,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":32,\"is_correct\":true}]}', 'intermedio', 'resta'),
(115, '{\"question\":\"Quant \\u00e9s 789 - 432?\",\"answers\":[{\"value\":356,\"is_correct\":false},{\"value\":357,\"is_correct\":true},{\"value\":358,\"is_correct\":false},{\"value\":359,\"is_correct\":false}]}', 'difícil', 'resta'),
(116, '{\"question\":\"Quant \\u00e9s 5 - 1?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(117, '{\"question\":\"Quant \\u00e9s 53 - 18?\",\"answers\":[{\"value\":35,\"is_correct\":true},{\"value\":36,\"is_correct\":false},{\"value\":37,\"is_correct\":false},{\"value\":38,\"is_correct\":false}]}', 'intermedio', 'resta'),
(118, '{\"question\":\"Quant \\u00e9s 853 - 692?\",\"answers\":[{\"value\":161,\"is_correct\":true},{\"value\":160,\"is_correct\":false},{\"value\":162,\"is_correct\":false},{\"value\":159,\"is_correct\":false}]}', 'difícil', 'resta'),
(119, '{\"question\":\"Quant \\u00e9s 9 - 5?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'fácil', 'resta'),
(120, '{\"question\":\"Quant \\u00e9s 82 - 27?\",\"answers\":[{\"value\":55,\"is_correct\":true},{\"value\":56,\"is_correct\":false},{\"value\":54,\"is_correct\":false},{\"value\":53,\"is_correct\":false}]}', 'intermedio', 'resta'),
(121, '{\"question\":\"Quant \\u00e9s 918 - 563?\",\"answers\":[{\"value\":355,\"is_correct\":true},{\"value\":356,\"is_correct\":false},{\"value\":357,\"is_correct\":false},{\"value\":358,\"is_correct\":false}]}', 'difícil', 'resta'),
(122, '{\"question\":\"Quant \\u00e9s 6 - 3?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(123, '{\"question\":\"Quant \\u00e9s 76 - 45?\",\"answers\":[{\"value\":31,\"is_correct\":true},{\"value\":32,\"is_correct\":false},{\"value\":30,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(124, '{\"question\":\"Quant \\u00e9s 991 - 547?\",\"answers\":[{\"value\":445,\"is_correct\":false},{\"value\":444,\"is_correct\":true},{\"value\":446,\"is_correct\":false},{\"value\":447,\"is_correct\":false}]}', 'difícil', 'resta'),
(125, '{\"question\":\"Quant \\u00e9s 7 - 4?\",\"answers\":[{\"value\":3,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(126, '{\"question\":\"Quant \\u00e9s 64 - 21?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":43,\"is_correct\":true},{\"value\":41,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'resta'),
(127, '{\"question\":\"Quant \\u00e9s 742 - 519?\",\"answers\":[{\"value\":223,\"is_correct\":true},{\"value\":224,\"is_correct\":false},{\"value\":225,\"is_correct\":false},{\"value\":226,\"is_correct\":false}]}', 'difícil', 'resta'),
(128, '{\"question\":\"Quant \\u00e9s 3 - 1?\",\"answers\":[{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(129, '{\"question\":\"Quant \\u00e9s 53 - 14?\",\"answers\":[{\"value\":39,\"is_correct\":true},{\"value\":40,\"is_correct\":false},{\"value\":41,\"is_correct\":false},{\"value\":38,\"is_correct\":false}]}', 'intermedio', 'resta'),
(130, '{\"question\":\"Quant \\u00e9s 893 - 632?\",\"answers\":[{\"value\":261,\"is_correct\":true},{\"value\":260,\"is_correct\":false},{\"value\":259,\"is_correct\":false},{\"value\":258,\"is_correct\":false}]}', 'difícil', 'resta'),
(131, '{\"question\":\"Quant \\u00e9s 9 - 7?\",\"answers\":[{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(132, '{\"question\":\"Quant \\u00e9s 57 - 40?\",\"answers\":[{\"value\":16,\"is_correct\":false},{\"value\":17,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":18,\"is_correct\":false}]}', 'intermedio', 'resta'),
(133, '{\"question\":\"Quant \\u00e9s 831 - 482?\",\"answers\":[{\"value\":349,\"is_correct\":true},{\"value\":350,\"is_correct\":false},{\"value\":348,\"is_correct\":false},{\"value\":351,\"is_correct\":false}]}', 'difícil', 'resta'),
(134, '{\"question\":\"Quant \\u00e9s 6 - 4?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":0,\"is_correct\":false}]}', 'fácil', 'resta'),
(135, '{\"question\":\"Quant \\u00e9s 68 - 32?\",\"answers\":[{\"value\":37,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false}]}', 'intermedio', 'resta'),
(136, '{\"question\":\"Quant \\u00e9s 765 - 489?\",\"answers\":[{\"value\":275,\"is_correct\":false},{\"value\":277,\"is_correct\":false},{\"value\":278,\"is_correct\":false},{\"value\":276,\"is_correct\":true}]}', 'difícil', 'resta'),
(137, '{\"question\":\"Quant \\u00e9s 8 - 6?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":1,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(138, '{\"question\":\"Quant \\u00e9s 75 - 41?\",\"answers\":[{\"value\":33,\"is_correct\":false},{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":true},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'resta'),
(139, '{\"question\":\"Quant \\u00e9s 894 - 762?\",\"answers\":[{\"value\":132,\"is_correct\":true},{\"value\":131,\"is_correct\":false},{\"value\":133,\"is_correct\":false},{\"value\":134,\"is_correct\":false}]}', 'difícil', 'resta'),
(140, '{\"question\":\"Quant \\u00e9s 5 - 2?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":true}]}', 'fácil', 'resta'),
(141, '{\"question\":\"Quant \\u00e9s 93 - 58?\",\"answers\":[{\"value\":36,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(142, '{\"question\":\"Quant \\u00e9s 634 - 475?\",\"answers\":[{\"value\":160,\"is_correct\":false},{\"value\":159,\"is_correct\":true},{\"value\":158,\"is_correct\":false},{\"value\":157,\"is_correct\":false}]}', 'difícil', 'resta'),
(143, '{\"question\":\"Quant \\u00e9s 4 - 3?\",\"answers\":[{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":1,\"is_correct\":true},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(144, '{\"question\":\"Quant \\u00e9s 84 - 59?\",\"answers\":[{\"value\":26,\"is_correct\":false},{\"value\":24,\"is_correct\":false},{\"value\":27,\"is_correct\":false},{\"value\":25,\"is_correct\":true}]}', 'intermedio', 'resta'),
(145, '{\"question\":\"Quant \\u00e9s 732 - 498?\",\"answers\":[{\"value\":235,\"is_correct\":false},{\"value\":234,\"is_correct\":true},{\"value\":233,\"is_correct\":false},{\"value\":236,\"is_correct\":false}]}', 'difícil', 'resta'),
(146, '{\"question\":\"Quant \\u00e9s 10 - 7?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(147, '{\"question\":\"Quant \\u00e9s 92 - 47?\",\"answers\":[{\"value\":44,\"is_correct\":false},{\"value\":46,\"is_correct\":false},{\"value\":43,\"is_correct\":false},{\"value\":45,\"is_correct\":true}]}', 'intermedio', 'resta'),
(148, '{\"question\":\"Quant \\u00e9s 982 - 637?\",\"answers\":[{\"value\":345,\"is_correct\":true},{\"value\":344,\"is_correct\":false},{\"value\":346,\"is_correct\":false},{\"value\":347,\"is_correct\":false}]}', 'difícil', 'resta'),
(149, '{\"question\":\"Quant \\u00e9s 3 - 2?\",\"answers\":[{\"value\":2,\"is_correct\":false},{\"value\":1,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(150, '{\"question\":\"Quant \\u00e9s 63 - 28?\",\"answers\":[{\"value\":36,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(151, '{\"question\":\"Quant \\u00e9s 743 - 516?\",\"answers\":[{\"value\":226,\"is_correct\":false},{\"value\":228,\"is_correct\":false},{\"value\":229,\"is_correct\":false},{\"value\":227,\"is_correct\":true}]}', 'difícil', 'resta'),
(152, '{\"question\":\"Quant \\u00e9s 9 - 4?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'fácil', 'resta'),
(153, '{\"question\":\"Quant \\u00e9s 81 - 37?\",\"answers\":[{\"value\":44,\"is_correct\":true},{\"value\":43,\"is_correct\":false},{\"value\":45,\"is_correct\":false},{\"value\":42,\"is_correct\":false}]}', 'intermedio', 'resta'),
(154, '{\"question\":\"Quant \\u00e9s 978 - 683?\",\"answers\":[{\"value\":295,\"is_correct\":true},{\"value\":294,\"is_correct\":false},{\"value\":296,\"is_correct\":false},{\"value\":293,\"is_correct\":false}]}', 'difícil', 'resta'),
(155, '{\"question\":\"Quant \\u00e9s 7 - 5?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(156, '{\"question\":\"Quant \\u00e9s 95 - 47?\",\"answers\":[{\"value\":47,\"is_correct\":false},{\"value\":48,\"is_correct\":true},{\"value\":46,\"is_correct\":false},{\"value\":49,\"is_correct\":false}]}', 'intermedio', 'resta'),
(157, '{\"question\":\"Quant \\u00e9s 843 - 594?\",\"answers\":[{\"value\":249,\"is_correct\":true},{\"value\":248,\"is_correct\":false},{\"value\":250,\"is_correct\":false},{\"value\":247,\"is_correct\":false}]}', 'difícil', 'resta'),
(158, '{\"question\":\"Quant \\u00e9s 10 - 3?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'fácil', 'resta'),
(159, '{\"question\":\"Quant \\u00e9s 83 - 59?\",\"answers\":[{\"value\":25,\"is_correct\":false},{\"value\":24,\"is_correct\":true},{\"value\":26,\"is_correct\":false},{\"value\":23,\"is_correct\":false}]}', 'intermedio', 'resta'),
(160, '{\"question\":\"Quant \\u00e9s 932 - 712?\",\"answers\":[{\"value\":220,\"is_correct\":true},{\"value\":221,\"is_correct\":false},{\"value\":219,\"is_correct\":false},{\"value\":222,\"is_correct\":false}]}', 'difícil', 'resta'),
(161, '{\"question\":\"Quant \\u00e9s 8 - 3?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'fácil', 'resta'),
(162, '{\"question\":\"Quant \\u00e9s 72 - 39?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":33,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'resta'),
(163, '{\"question\":\"Quant \\u00e9s 496 - 274?\",\"answers\":[{\"value\":222,\"is_correct\":true},{\"value\":221,\"is_correct\":false},{\"value\":223,\"is_correct\":false},{\"value\":224,\"is_correct\":false}]}', 'difícil', 'resta'),
(164, '{\"question\":\"Quant \\u00e9s 6 - 4?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(165, '{\"question\":\"Quant \\u00e9s 85 - 44?\",\"answers\":[{\"value\":41,\"is_correct\":true},{\"value\":40,\"is_correct\":false},{\"value\":42,\"is_correct\":false},{\"value\":39,\"is_correct\":false}]}', 'intermedio', 'resta'),
(166, '{\"question\":\"Quant \\u00e9s 748 - 524?\",\"answers\":[{\"value\":224,\"is_correct\":true},{\"value\":223,\"is_correct\":false},{\"value\":225,\"is_correct\":false},{\"value\":226,\"is_correct\":false}]}', 'difícil', 'resta'),
(167, '{\"question\":\"Quant \\u00e9s 9 - 6?\",\"answers\":[{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(168, '{\"question\":\"Quant \\u00e9s 63 - 28?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":36,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(169, '{\"question\":\"Quant \\u00e9s 913 - 486?\",\"answers\":[{\"value\":426,\"is_correct\":false},{\"value\":427,\"is_correct\":true},{\"value\":428,\"is_correct\":false},{\"value\":425,\"is_correct\":false}]}', 'difícil', 'resta'),
(170, '{\"question\":\"Quant \\u00e9s 14 - 9?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":3,\"is_correct\":false}]}', 'fácil', 'resta'),
(171, '{\"question\":\"Quant \\u00e9s 52 - 17?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":36,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(172, '{\"question\":\"Quant \\u00e9s 324 - 198?\",\"answers\":[{\"value\":127,\"is_correct\":false},{\"value\":129,\"is_correct\":false},{\"value\":128,\"is_correct\":false},{\"value\":126,\"is_correct\":true}]}', 'difícil', 'resta'),
(173, '{\"question\":\"Quant \\u00e9s 10 - 2?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(174, '{\"question\":\"Quant \\u00e9s 90 - 45?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":44,\"is_correct\":false},{\"value\":45,\"is_correct\":true}]}', 'intermedio', 'resta'),
(175, '{\"question\":\"Quant \\u00e9s 205 - 150?\",\"answers\":[{\"value\":55,\"is_correct\":true},{\"value\":54,\"is_correct\":false},{\"value\":56,\"is_correct\":false},{\"value\":57,\"is_correct\":false}]}', 'difícil', 'resta'),
(176, '{\"question\":\"Quant \\u00e9s 18 - 7?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":11,\"is_correct\":true},{\"value\":13,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'resta'),
(177, '{\"question\":\"Quant \\u00e9s 68 - 32?\",\"answers\":[{\"value\":36,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":37,\"is_correct\":false},{\"value\":34,\"is_correct\":false}]}', 'intermedio', 'resta'),
(178, '{\"question\":\"Quant \\u00e9s 402 - 198?\",\"answers\":[{\"value\":204,\"is_correct\":true},{\"value\":205,\"is_correct\":false},{\"value\":203,\"is_correct\":false},{\"value\":202,\"is_correct\":false}]}', 'difícil', 'resta'),
(179, '{\"question\":\"Quant \\u00e9s 7 - 3?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(180, '{\"question\":\"Quant \\u00e9s 80 - 48?\",\"answers\":[{\"value\":31,\"is_correct\":false},{\"value\":32,\"is_correct\":true},{\"value\":33,\"is_correct\":false},{\"value\":34,\"is_correct\":false}]}', 'intermedio', 'resta'),
(181, '{\"question\":\"Quant \\u00e9s 100 - 56?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":46,\"is_correct\":false},{\"value\":44,\"is_correct\":true}]}', 'intermedio', 'resta'),
(182, '{\"question\":\"Quant \\u00e9s 15 - 7?\",\"answers\":[{\"value\":9,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(183, '{\"question\":\"Quant \\u00e9s 225 - 174?\",\"answers\":[{\"value\":50,\"is_correct\":false},{\"value\":51,\"is_correct\":true},{\"value\":52,\"is_correct\":false},{\"value\":53,\"is_correct\":false}]}', 'difícil', 'resta'),
(184, '{\"question\":\"Quant \\u00e9s 36 - 19?\",\"answers\":[{\"value\":17,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":false}]}', 'intermedio', 'resta'),
(185, '{\"question\":\"Quant \\u00e9s 9 - 6?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":2,\"is_correct\":false}]}', 'fácil', 'resta'),
(186, '{\"question\":\"Quant \\u00e9s 128 - 95?\",\"answers\":[{\"value\":33,\"is_correct\":true},{\"value\":32,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'intermedio', 'resta'),
(187, '{\"question\":\"Quant \\u00e9s 600 - 425?\",\"answers\":[{\"value\":175,\"is_correct\":true},{\"value\":176,\"is_correct\":false},{\"value\":174,\"is_correct\":false},{\"value\":177,\"is_correct\":false}]}', 'difícil', 'resta'),
(188, '{\"question\":\"Quant \\u00e9s 14 - 5?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":8,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'fácil', 'resta'),
(189, '{\"question\":\"Quant \\u00e9s 58 - 22?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":37,\"is_correct\":false},{\"value\":34,\"is_correct\":false}]}', 'intermedio', 'resta'),
(190, '{\"question\":\"Quant \\u00e9s 500 - 299?\",\"answers\":[{\"value\":200,\"is_correct\":false},{\"value\":201,\"is_correct\":true},{\"value\":202,\"is_correct\":false},{\"value\":203,\"is_correct\":false}]}', 'difícil', 'resta'),
(191, '{\"question\":\"Quant \\u00e9s 35 - 18?\",\"answers\":[{\"value\":17,\"is_correct\":true},{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":18,\"is_correct\":false}]}', 'intermedio', 'resta'),
(192, '{\"question\":\"Quant \\u00e9s 1000 - 850?\",\"answers\":[{\"value\":150,\"is_correct\":true},{\"value\":149,\"is_correct\":false},{\"value\":151,\"is_correct\":false},{\"value\":152,\"is_correct\":false}]}', 'difícil', 'resta'),
(193, '{\"question\":\"Quant \\u00e9s 60 - 27?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":33,\"is_correct\":true},{\"value\":35,\"is_correct\":false}]}', 'intermedio', 'resta'),
(194, '{\"question\":\"Quant \\u00e9s 22 - 12?\",\"answers\":[{\"value\":10,\"is_correct\":true},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'fácil', 'resta'),
(195, '{\"question\":\"Quant \\u00e9s 150 - 47?\",\"answers\":[{\"value\":102,\"is_correct\":false},{\"value\":103,\"is_correct\":true},{\"value\":104,\"is_correct\":false},{\"value\":101,\"is_correct\":false}]}', 'intermedio', 'resta'),
(196, '{\"question\":\"Quant \\u00e9s 200 - 89?\",\"answers\":[{\"value\":110,\"is_correct\":false},{\"value\":111,\"is_correct\":true},{\"value\":109,\"is_correct\":false},{\"value\":108,\"is_correct\":false}]}', 'difícil', 'resta'),
(197, '{\"question\":\"Quant \\u00e9s 12 - 5?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":7,\"is_correct\":true}]}', 'fácil', 'resta'),
(198, '{\"question\":\"Quant \\u00e9s 85 - 39?\",\"answers\":[{\"value\":47,\"is_correct\":false},{\"value\":46,\"is_correct\":true},{\"value\":48,\"is_correct\":false},{\"value\":45,\"is_correct\":false}]}', 'intermedio', 'resta'),
(199, '{\"question\":\"Quant \\u00e9s 500 - 275?\",\"answers\":[{\"value\":224,\"is_correct\":false},{\"value\":225,\"is_correct\":true},{\"value\":226,\"is_correct\":false},{\"value\":223,\"is_correct\":false}]}', 'difícil', 'resta'),
(200, '{\"question\":\"Quant \\u00e9s 19 - 8?\",\"answers\":[{\"value\":11,\"is_correct\":true},{\"value\":12,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":9,\"is_correct\":false}]}', 'fácil', 'resta'),
(201, '{\"question\":\"Quant \\u00e9s 8 x 6?\",\"answers\":[{\"value\":48,\"is_correct\":true},{\"value\":45,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":52,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(202, '{\"question\":\"Quant \\u00e9s 12 x 6?\",\"answers\":[{\"value\":75,\"is_correct\":false},{\"value\":70,\"is_correct\":false},{\"value\":80,\"is_correct\":false},{\"value\":72,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(203, '{\"question\":\"Quant \\u00e9s 24 x 12?\",\"answers\":[{\"value\":280,\"is_correct\":false},{\"value\":295,\"is_correct\":false},{\"value\":288,\"is_correct\":true},{\"value\":300,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(204, '{\"question\":\"Quant \\u00e9s 7 x 5?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":40,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(205, '{\"question\":\"Quant \\u00e9s 14 x 8?\",\"answers\":[{\"value\":110,\"is_correct\":false},{\"value\":120,\"is_correct\":false},{\"value\":100,\"is_correct\":false},{\"value\":112,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(206, '{\"question\":\"Quant \\u00e9s 30 x 18?\",\"answers\":[{\"value\":520,\"is_correct\":false},{\"value\":530,\"is_correct\":false},{\"value\":540,\"is_correct\":true},{\"value\":550,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(207, '{\"question\":\"Quant \\u00e9s 4 x 7?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":28,\"is_correct\":true},{\"value\":25,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(208, '{\"question\":\"Quant \\u00e9s 15 x 9?\",\"answers\":[{\"value\":130,\"is_correct\":false},{\"value\":140,\"is_correct\":false},{\"value\":120,\"is_correct\":false},{\"value\":135,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(209, '{\"question\":\"Quant \\u00e9s 25 x 16?\",\"answers\":[{\"value\":420,\"is_correct\":false},{\"value\":380,\"is_correct\":false},{\"value\":400,\"is_correct\":true},{\"value\":410,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(210, '{\"question\":\"Quant \\u00e9s 5 x 9?\",\"answers\":[{\"value\":40,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":45,\"is_correct\":true},{\"value\":42,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(211, '{\"question\":\"Quant \\u00e9s 18 x 11?\",\"answers\":[{\"value\":200,\"is_correct\":false},{\"value\":210,\"is_correct\":false},{\"value\":198,\"is_correct\":true},{\"value\":190,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(212, '{\"question\":\"Quant \\u00e9s 26 x 13?\",\"answers\":[{\"value\":330,\"is_correct\":false},{\"value\":320,\"is_correct\":false},{\"value\":350,\"is_correct\":false},{\"value\":338,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(213, '{\"question\":\"Quant \\u00e9s 9 x 4?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":38,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":32,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(214, '{\"question\":\"Quant \\u00e9s 13 x 8?\",\"answers\":[{\"value\":100,\"is_correct\":false},{\"value\":90,\"is_correct\":false},{\"value\":104,\"is_correct\":true},{\"value\":110,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(215, '{\"question\":\"Quant \\u00e9s 22 x 17?\",\"answers\":[{\"value\":380,\"is_correct\":false},{\"value\":350,\"is_correct\":false},{\"value\":374,\"is_correct\":true},{\"value\":360,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(216, '{\"question\":\"Quant \\u00e9s 6 x 8?\",\"answers\":[{\"value\":45,\"is_correct\":false},{\"value\":42,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":48,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(217, '{\"question\":\"Quant \\u00e9s 10 x 14?\",\"answers\":[{\"value\":140,\"is_correct\":true},{\"value\":130,\"is_correct\":false},{\"value\":120,\"is_correct\":false},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion');
INSERT INTO `operacions` (`id`, `problem_json`, `nivel_dificultad`, `tipo_operacion`) VALUES
(218, '{\"question\":\"Quant \\u00e9s 8 x 7?\",\"answers\":[{\"value\":50,\"is_correct\":false},{\"value\":56,\"is_correct\":true},{\"value\":55,\"is_correct\":false},{\"value\":60,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(219, '{\"question\":\"Quant \\u00e9s 16 x 6?\",\"answers\":[{\"value\":92,\"is_correct\":false},{\"value\":96,\"is_correct\":true},{\"value\":100,\"is_correct\":false},{\"value\":90,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(220, '{\"question\":\"Quant \\u00e9s 25 x 24?\",\"answers\":[{\"value\":600,\"is_correct\":true},{\"value\":580,\"is_correct\":false},{\"value\":625,\"is_correct\":false},{\"value\":600,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(221, '{\"question\":\"Quant \\u00e9s 4 x 10?\",\"answers\":[{\"value\":45,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":30,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(222, '{\"question\":\"Quant \\u00e9s 18 x 9?\",\"answers\":[{\"value\":140,\"is_correct\":false},{\"value\":145,\"is_correct\":false},{\"value\":162,\"is_correct\":true},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(223, '{\"question\":\"Quant \\u00e9s 28 x 17?\",\"answers\":[{\"value\":476,\"is_correct\":true},{\"value\":485,\"is_correct\":false},{\"value\":460,\"is_correct\":false},{\"value\":490,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(224, '{\"question\":\"Quant \\u00e9s 6 x 12?\",\"answers\":[{\"value\":65,\"is_correct\":false},{\"value\":72,\"is_correct\":true},{\"value\":60,\"is_correct\":false},{\"value\":80,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(225, '{\"question\":\"Quant \\u00e9s 15 x 14?\",\"answers\":[{\"value\":210,\"is_correct\":true},{\"value\":225,\"is_correct\":false},{\"value\":200,\"is_correct\":false},{\"value\":215,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(226, '{\"question\":\"Quant \\u00e9s 35 x 24?\",\"answers\":[{\"value\":850,\"is_correct\":false},{\"value\":840,\"is_correct\":false},{\"value\":820,\"is_correct\":false},{\"value\":840,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(227, '{\"question\":\"Quant \\u00e9s 5 x 7?\",\"answers\":[{\"value\":33,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":38,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(228, '{\"question\":\"Quant \\u00e9s 16 x 9?\",\"answers\":[{\"value\":140,\"is_correct\":false},{\"value\":144,\"is_correct\":true},{\"value\":145,\"is_correct\":false},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(229, '{\"question\":\"Quant \\u00e9s 45 x 14?\",\"answers\":[{\"value\":600,\"is_correct\":false},{\"value\":635,\"is_correct\":false},{\"value\":630,\"is_correct\":true},{\"value\":620,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(230, '{\"question\":\"Quant \\u00e9s 6 x 6?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":40,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(231, '{\"question\":\"Quant \\u00e9s 14 x 12?\",\"answers\":[{\"value\":168,\"is_correct\":true},{\"value\":160,\"is_correct\":false},{\"value\":155,\"is_correct\":false},{\"value\":180,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(232, '{\"question\":\"Quant \\u00e9s 28 x 22?\",\"answers\":[{\"value\":600,\"is_correct\":false},{\"value\":616,\"is_correct\":true},{\"value\":650,\"is_correct\":false},{\"value\":620,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(233, '{\"question\":\"Quant \\u00e9s 5 x 5?\",\"answers\":[{\"value\":25,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":20,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(234, '{\"question\":\"Quant \\u00e9s 18 x 8?\",\"answers\":[{\"value\":144,\"is_correct\":true},{\"value\":130,\"is_correct\":false},{\"value\":135,\"is_correct\":false},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(235, '{\"question\":\"Quant \\u00e9s 33 x 19?\",\"answers\":[{\"value\":630,\"is_correct\":false},{\"value\":629,\"is_correct\":false},{\"value\":627,\"is_correct\":true},{\"value\":620,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(236, '{\"question\":\"Quant \\u00e9s 4 x 5?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":25,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(237, '{\"question\":\"Quant \\u00e9s 20 x 15?\",\"answers\":[{\"value\":300,\"is_correct\":true},{\"value\":290,\"is_correct\":false},{\"value\":310,\"is_correct\":false},{\"value\":280,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(238, '{\"question\":\"Quant \\u00e9s 42 x 15?\",\"answers\":[{\"value\":640,\"is_correct\":false},{\"value\":630,\"is_correct\":true},{\"value\":600,\"is_correct\":false},{\"value\":620,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(239, '{\"question\":\"Quant \\u00e9s 7 x 8?\",\"answers\":[{\"value\":56,\"is_correct\":true},{\"value\":50,\"is_correct\":false},{\"value\":60,\"is_correct\":false},{\"value\":54,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(240, '{\"question\":\"Quant \\u00e9s 19 x 11?\",\"answers\":[{\"value\":209,\"is_correct\":true},{\"value\":210,\"is_correct\":false},{\"value\":220,\"is_correct\":false},{\"value\":200,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(241, '{\"question\":\"Quant \\u00e9s 36 x 18?\",\"answers\":[{\"value\":640,\"is_correct\":false},{\"value\":648,\"is_correct\":true},{\"value\":620,\"is_correct\":false},{\"value\":630,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(242, '{\"question\":\"Quant \\u00e9s 3 x 7?\",\"answers\":[{\"value\":21,\"is_correct\":true},{\"value\":20,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":19,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(243, '{\"question\":\"Quant \\u00e9s 16 x 12?\",\"answers\":[{\"value\":185,\"is_correct\":false},{\"value\":190,\"is_correct\":false},{\"value\":192,\"is_correct\":true},{\"value\":200,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(244, '{\"question\":\"Quant \\u00e9s 45 x 17?\",\"answers\":[{\"value\":750,\"is_correct\":false},{\"value\":765,\"is_correct\":true},{\"value\":770,\"is_correct\":false},{\"value\":740,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(245, '{\"question\":\"Quant \\u00e9s 4 x 8?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":33,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":32,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(246, '{\"question\":\"Quant \\u00e9s 22 x 9?\",\"answers\":[{\"value\":198,\"is_correct\":true},{\"value\":200,\"is_correct\":false},{\"value\":190,\"is_correct\":false},{\"value\":210,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(247, '{\"question\":\"Quant \\u00e9s 57 x 14?\",\"answers\":[{\"value\":785,\"is_correct\":false},{\"value\":798,\"is_correct\":true},{\"value\":770,\"is_correct\":false},{\"value\":810,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(248, '{\"question\":\"Quant \\u00e9s 2 x 10?\",\"answers\":[{\"value\":18,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":22,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(249, '{\"question\":\"Quant \\u00e9s 17 x 15?\",\"answers\":[{\"value\":177,\"is_correct\":false},{\"value\":117,\"is_correct\":false},{\"value\":167,\"is_correct\":false},{\"value\":187,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(250, '{\"question\":\"Quant \\u00e9s 63 x 19?\",\"answers\":[{\"value\":1197,\"is_correct\":true},{\"value\":1185,\"is_correct\":false},{\"value\":1200,\"is_correct\":false},{\"value\":1150,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(251, '{\"question\":\"Quant \\u00e9s 11 x 7?\",\"answers\":[{\"value\":70,\"is_correct\":false},{\"value\":77,\"is_correct\":true},{\"value\":80,\"is_correct\":false},{\"value\":75,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(252, '{\"question\":\"Quant \\u00e9s 25 x 14?\",\"answers\":[{\"value\":340,\"is_correct\":false},{\"value\":330,\"is_correct\":false},{\"value\":350,\"is_correct\":true},{\"value\":360,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(253, '{\"question\":\"Quant \\u00e9s 72 x 16?\",\"answers\":[{\"value\":1100,\"is_correct\":false},{\"value\":1180,\"is_correct\":false},{\"value\":1200,\"is_correct\":false},{\"value\":1152,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(254, '{\"question\":\"Quant \\u00e9s 5 x 6?\",\"answers\":[{\"value\":30,\"is_correct\":true},{\"value\":28,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(255, '{\"question\":\"Quant \\u00e9s 13 x 18?\",\"answers\":[{\"value\":220,\"is_correct\":false},{\"value\":234,\"is_correct\":true},{\"value\":240,\"is_correct\":false},{\"value\":230,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(256, '{\"question\":\"Quant \\u00e9s 39 x 17?\",\"answers\":[{\"value\":650,\"is_correct\":false},{\"value\":670,\"is_correct\":false},{\"value\":663,\"is_correct\":true},{\"value\":700,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(257, '{\"question\":\"Quant \\u00e9s 3 x 5?\",\"answers\":[{\"value\":13,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(258, '{\"question\":\"Quant \\u00e9s 19 x 7?\",\"answers\":[{\"value\":133,\"is_correct\":true},{\"value\":140,\"is_correct\":false},{\"value\":120,\"is_correct\":false},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(259, '{\"question\":\"Quant \\u00e9s 49 x 12?\",\"answers\":[{\"value\":600,\"is_correct\":false},{\"value\":588,\"is_correct\":true},{\"value\":580,\"is_correct\":false},{\"value\":590,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(260, '{\"question\":\"Quant \\u00e9s 3 x 3?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(261, '{\"question\":\"Quant \\u00e9s 21 x 9?\",\"answers\":[{\"value\":180,\"is_correct\":false},{\"value\":200,\"is_correct\":false},{\"value\":210,\"is_correct\":false},{\"value\":189,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(262, '{\"question\":\"Quant \\u00e9s 54 x 18?\",\"answers\":[{\"value\":972,\"is_correct\":true},{\"value\":980,\"is_correct\":false},{\"value\":960,\"is_correct\":false},{\"value\":950,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(263, '{\"question\":\"Quant \\u00e9s 8 x 8?\",\"answers\":[{\"value\":66,\"is_correct\":false},{\"value\":64,\"is_correct\":true},{\"value\":60,\"is_correct\":false},{\"value\":16,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(264, '{\"question\":\"Quant \\u00e9s 14 x 11?\",\"answers\":[{\"value\":150,\"is_correct\":false},{\"value\":160,\"is_correct\":false},{\"value\":154,\"is_correct\":true},{\"value\":140,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(265, '{\"question\":\"Quant \\u00e9s 72 x 25?\",\"answers\":[{\"value\":1700,\"is_correct\":false},{\"value\":1900,\"is_correct\":false},{\"value\":1850,\"is_correct\":false},{\"value\":1800,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(266, '{\"question\":\"Quant \\u00e9s 4 x 7?\",\"answers\":[{\"value\":28,\"is_correct\":true},{\"value\":30,\"is_correct\":false},{\"value\":27,\"is_correct\":false},{\"value\":32,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(267, '{\"question\":\"Quant \\u00e9s 16 x 5?\",\"answers\":[{\"value\":80,\"is_correct\":false},{\"value\":92,\"is_correct\":true},{\"value\":75,\"is_correct\":false},{\"value\":85,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(268, '{\"question\":\"Quant \\u00e9s 45 x 18?\",\"answers\":[{\"value\":800,\"is_correct\":false},{\"value\":820,\"is_correct\":false},{\"value\":810,\"is_correct\":true},{\"value\":850,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(269, '{\"question\":\"Quant \\u00e9s 10 x 5?\",\"answers\":[{\"value\":55,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":45,\"is_correct\":false},{\"value\":50,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(270, '{\"question\":\"Quant \\u00e9s 18 x 14?\",\"answers\":[{\"value\":252,\"is_correct\":true},{\"value\":250,\"is_correct\":false},{\"value\":260,\"is_correct\":false},{\"value\":240,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(271, '{\"question\":\"Quant \\u00e9s 56 x 23?\",\"answers\":[{\"value\":1300,\"is_correct\":false},{\"value\":1288,\"is_correct\":true},{\"value\":1260,\"is_correct\":false},{\"value\":1200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(272, '{\"question\":\"Quant \\u00e9s 9 x 6?\",\"answers\":[{\"value\":52,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":54,\"is_correct\":true},{\"value\":56,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(273, '{\"question\":\"Quant \\u00e9s 23 x 11?\",\"answers\":[{\"value\":240,\"is_correct\":false},{\"value\":270,\"is_correct\":false},{\"value\":250,\"is_correct\":false},{\"value\":253,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(274, '{\"question\":\"Quant \\u00e9s 72 x 29?\",\"answers\":[{\"value\":2088,\"is_correct\":true},{\"value\":2000,\"is_correct\":false},{\"value\":2100,\"is_correct\":false},{\"value\":2200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(275, '{\"question\":\"Quant \\u00e9s 3 x 10?\",\"answers\":[{\"value\":28,\"is_correct\":false},{\"value\":30,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(276, '{\"question\":\"Quant \\u00e9s 25 x 15?\",\"answers\":[{\"value\":350,\"is_correct\":false},{\"value\":400,\"is_correct\":false},{\"value\":375,\"is_correct\":true},{\"value\":380,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(277, '{\"question\":\"Quant \\u00e9s 63 x 24?\",\"answers\":[{\"value\":1500,\"is_correct\":false},{\"value\":1600,\"is_correct\":false},{\"value\":1400,\"is_correct\":false},{\"value\":1512,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(278, '{\"question\":\"Quant \\u00e9s 4 x 4?\",\"answers\":[{\"value\":16,\"is_correct\":true},{\"value\":12,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(279, '{\"question\":\"Quant \\u00e9s 14 x 17?\",\"answers\":[{\"value\":220,\"is_correct\":false},{\"value\":238,\"is_correct\":true},{\"value\":240,\"is_correct\":false},{\"value\":230,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(280, '{\"question\":\"Quant \\u00e9s 32 x 19?\",\"answers\":[{\"value\":620,\"is_correct\":false},{\"value\":600,\"is_correct\":false},{\"value\":608,\"is_correct\":true},{\"value\":610,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(281, '{\"question\":\"Quant \\u00e9s 5 x 12?\",\"answers\":[{\"value\":58,\"is_correct\":false},{\"value\":65,\"is_correct\":false},{\"value\":55,\"is_correct\":false},{\"value\":60,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(282, '{\"question\":\"Quant \\u00e9s 21 x 13?\",\"answers\":[{\"value\":273,\"is_correct\":true},{\"value\":260,\"is_correct\":false},{\"value\":280,\"is_correct\":false},{\"value\":290,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(283, '{\"question\":\"Quant \\u00e9s 45 x 22?\",\"answers\":[{\"value\":1000,\"is_correct\":false},{\"value\":990,\"is_correct\":true},{\"value\":980,\"is_correct\":false},{\"value\":960,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(284, '{\"question\":\"Quant \\u00e9s 7 x 9?\",\"answers\":[{\"value\":60,\"is_correct\":false},{\"value\":64,\"is_correct\":false},{\"value\":63,\"is_correct\":true},{\"value\":55,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(285, '{\"question\":\"Quant \\u00e9s 25 x 18?\",\"answers\":[{\"value\":440,\"is_correct\":false},{\"value\":460,\"is_correct\":false},{\"value\":430,\"is_correct\":false},{\"value\":450,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(286, '{\"question\":\"Quant \\u00e9s 56 x 24?\",\"answers\":[{\"value\":1344,\"is_correct\":true},{\"value\":1300,\"is_correct\":false},{\"value\":1400,\"is_correct\":false},{\"value\":1200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(287, '{\"question\":\"Quant \\u00e9s 4 x 9?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":38,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(288, '{\"question\":\"Quant \\u00e9s 17 x 15?\",\"answers\":[{\"value\":250,\"is_correct\":false},{\"value\":240,\"is_correct\":false},{\"value\":255,\"is_correct\":true},{\"value\":270,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(289, '{\"question\":\"Quant \\u00e9s 63 x 27?\",\"answers\":[{\"value\":1600,\"is_correct\":false},{\"value\":1800,\"is_correct\":false},{\"value\":1750,\"is_correct\":false},{\"value\":1701,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(290, '{\"question\":\"Quant \\u00e9s 3 x 8?\",\"answers\":[{\"value\":24,\"is_correct\":true},{\"value\":22,\"is_correct\":false},{\"value\":26,\"is_correct\":false},{\"value\":20,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(291, '{\"question\":\"Quant \\u00e9s 16 x 14?\",\"answers\":[{\"value\":210,\"is_correct\":false},{\"value\":224,\"is_correct\":true},{\"value\":230,\"is_correct\":false},{\"value\":240,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(292, '{\"question\":\"Quant \\u00e9s 45 x 30?\",\"answers\":[{\"value\":1300,\"is_correct\":false},{\"value\":1400,\"is_correct\":false},{\"value\":1350,\"is_correct\":true},{\"value\":1200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(293, '{\"question\":\"Quant \\u00e9s 7 x 7?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":45,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":49,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(294, '{\"question\":\"Quant \\u00e9s 18 x 19?\",\"answers\":[{\"value\":342,\"is_correct\":true},{\"value\":330,\"is_correct\":false},{\"value\":350,\"is_correct\":false},{\"value\":340,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(295, '{\"question\":\"Quant \\u00e9s 32 x 17?\",\"answers\":[{\"value\":530,\"is_correct\":false},{\"value\":544,\"is_correct\":true},{\"value\":550,\"is_correct\":false},{\"value\":500,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(296, '{\"question\":\"Quant \\u00e9s 5 x 15?\",\"answers\":[{\"value\":70,\"is_correct\":false},{\"value\":80,\"is_correct\":false},{\"value\":75,\"is_correct\":true},{\"value\":60,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(297, '{\"question\":\"Quant \\u00e9s 22 x 14?\",\"answers\":[{\"value\":300,\"is_correct\":false},{\"value\":320,\"is_correct\":false},{\"value\":310,\"is_correct\":false},{\"value\":308,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(298, '{\"question\":\"Quant \\u00e9s 60 x 22?\",\"answers\":[{\"value\":1300,\"is_correct\":false},{\"value\":1320,\"is_correct\":true},{\"value\":1400,\"is_correct\":false},{\"value\":1200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(299, '{\"question\":\"Quant \\u00e9s 4 x 11?\",\"answers\":[{\"value\":40,\"is_correct\":false},{\"value\":45,\"is_correct\":false},{\"value\":44,\"is_correct\":true},{\"value\":42,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(300, '{\"question\":\"Quant \\u00e9s 27 x 15?\",\"answers\":[{\"value\":400,\"is_correct\":false},{\"value\":420,\"is_correct\":false},{\"value\":430,\"is_correct\":false},{\"value\":405,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(301, '{\"question\":\"Quant \\u00e9s 6 \\/ 2?\",\"answers\":[{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'facil', 'division'),
(302, '{\"question\":\"Quant \\u00e9s 72 \\/ 8?\",\"answers\":[{\"value\":9,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":8,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'intermedio', 'division'),
(303, '{\"question\":\"Quant \\u00e9s 540 \\/ 15?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":38,\"is_correct\":false},{\"value\":36,\"is_correct\":true}]}', 'dificil', 'division'),
(304, '{\"question\":\"Quant \\u00e9s 8 \\/ 4?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'facil', 'division'),
(305, '{\"question\":\"Quant \\u00e9s 96 \\/ 8?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":11,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":9,\"is_correct\":false}]}', 'intermedio', 'division'),
(306, '{\"question\":\"Quant \\u00e9s 720 \\/ 18?\",\"answers\":[{\"value\":39,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":45,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'dificil', 'division'),
(307, '{\"question\":\"Quant \\u00e9s 9 \\/ 3?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":true}]}', 'facil', 'division'),
(308, '{\"question\":\"Quant \\u00e9s 144 \\/ 12?\",\"answers\":[{\"value\":14,\"is_correct\":false},{\"value\":12,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'intermedio', 'division'),
(309, '{\"question\":\"Quant \\u00e9s 990 \\/ 33?\",\"answers\":[{\"value\":25,\"is_correct\":false},{\"value\":30,\"is_correct\":true},{\"value\":27,\"is_correct\":false},{\"value\":20,\"is_correct\":false}]}', 'dificil', 'division'),
(310, '{\"question\":\"Quant \\u00e9s 10 \\/ 5?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'facil', 'division'),
(311, '{\"question\":\"Quant \\u00e9s 84 \\/ 7?\",\"answers\":[{\"value\":11,\"is_correct\":false},{\"value\":12,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":14,\"is_correct\":false}]}', 'intermedio', 'division'),
(312, '{\"question\":\"Quant \\u00e9s 1080 \\/ 36?\",\"answers\":[{\"value\":25,\"is_correct\":false},{\"value\":30,\"is_correct\":true},{\"value\":28,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'dificil', 'division'),
(313, '{\"question\":\"Quant \\u00e9s 15 \\/ 3?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'facil', 'division'),
(314, '{\"question\":\"Quant \\u00e9s 192 \\/ 16?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":14,\"is_correct\":false}]}', 'intermedio', 'division'),
(315, '{\"question\":\"Quant \\u00e9s 1200 \\/ 24?\",\"answers\":[{\"value\":50,\"is_correct\":true},{\"value\":52,\"is_correct\":false},{\"value\":48,\"is_correct\":false},{\"value\":45,\"is_correct\":false}]}', 'dificil', 'division'),
(316, '{\"question\":\"Quant \\u00e9s 14 \\/ 7?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":2,\"is_correct\":true}]}', 'facil', 'division'),
(317, '{\"question\":\"Quant \\u00e9s 120 \\/ 6?\",\"answers\":[{\"value\":18,\"is_correct\":false},{\"value\":21,\"is_correct\":false},{\"value\":19,\"is_correct\":false},{\"value\":20,\"is_correct\":true}]}', 'intermedio', 'division'),
(318, '{\"question\":\"Quant \\u00e9s 1800 \\/ 45?\",\"answers\":[{\"value\":45,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":42,\"is_correct\":false}]}', 'dificil', 'division'),
(319, '{\"question\":\"Quant \\u00e9s 12 \\/ 6?\",\"answers\":[{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'facil', 'division'),
(320, '{\"question\":\"Quant \\u00e9s 200 \\/ 10?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'intermedio', 'division'),
(321, '{\"question\":\"Quant \\u00e9s 20 \\/ 5?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'facil', 'division'),
(322, '{\"question\":\"Quant \\u00e9s 180 \\/ 15?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":14,\"is_correct\":false},{\"value\":13,\"is_correct\":false},{\"value\":11,\"is_correct\":false}]}', 'intermedio', 'division'),
(323, '{\"question\":\"Quant \\u00e9s 2500 \\/ 25?\",\"answers\":[{\"value\":95,\"is_correct\":false},{\"value\":100,\"is_correct\":true},{\"value\":105,\"is_correct\":false},{\"value\":110,\"is_correct\":false}]}', 'dificil', 'division'),
(324, '{\"question\":\"Quant \\u00e9s 6 \\/ 3?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false}]}', 'facil', 'division'),
(325, '{\"question\":\"Quant \\u00e9s 432 \\/ 24?\",\"answers\":[{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":18,\"is_correct\":true},{\"value\":17,\"is_correct\":false}]}', 'intermedio', 'division'),
(326, '{\"question\":\"Quant \\u00e9s 810 \\/ 27?\",\"answers\":[{\"value\":32,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":30,\"is_correct\":true}]}', 'dificil', 'division'),
(327, '{\"question\":\"Quant \\u00e9s 8 \\/ 2?\",\"answers\":[{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":true},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(328, '{\"question\":\"Quant \\u00e9s 288 \\/ 16?\",\"answers\":[{\"value\":20,\"is_correct\":false},{\"value\":16,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":18,\"is_correct\":true}]}', 'intermedio', 'division'),
(329, '{\"question\":\"Quant \\u00e9s 1440 \\/ 48?\",\"answers\":[{\"value\":30,\"is_correct\":true},{\"value\":28,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'dificil', 'division'),
(330, '{\"question\":\"Quant \\u00e9s 10 \\/ 2?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(331, '{\"question\":\"Quant \\u00e9s 16 \\/ 4?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(332, '{\"question\":\"Quant \\u00e9s 225 \\/ 15?\",\"answers\":[{\"value\":14,\"is_correct\":false},{\"value\":17,\"is_correct\":false},{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":true}]}', 'intermedio', 'division'),
(333, '{\"question\":\"Quant \\u00e9s 1980 \\/ 33?\",\"answers\":[{\"value\":60,\"is_correct\":true},{\"value\":55,\"is_correct\":false},{\"value\":62,\"is_correct\":false},{\"value\":65,\"is_correct\":false}]}', 'dificil', 'division'),
(334, '{\"question\":\"Quant \\u00e9s 18 \\/ 3?\",\"answers\":[{\"value\":6,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'facil', 'division'),
(335, '{\"question\":\"Quant \\u00e9s 288 \\/ 24?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":true},{\"value\":13,\"is_correct\":false},{\"value\":15,\"is_correct\":false}]}', 'intermedio', 'division'),
(336, '{\"question\":\"Quant \\u00e9s 3600 \\/ 90?\",\"answers\":[{\"value\":40,\"is_correct\":true},{\"value\":45,\"is_correct\":false},{\"value\":35,\"is_correct\":false},{\"value\":50,\"is_correct\":false}]}', 'dificil', 'division'),
(337, '{\"question\":\"Quant \\u00e9s 12 \\/ 4?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false}]}', 'facil', 'division'),
(338, '{\"question\":\"Quant \\u00e9s 640 \\/ 32?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":25,\"is_correct\":false}]}', 'intermedio', 'division'),
(339, '{\"question\":\"Quant \\u00e9s 5760 \\/ 144?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":40,\"is_correct\":false},{\"value\":50,\"is_correct\":true},{\"value\":38,\"is_correct\":false}]}', 'dificil', 'division'),
(340, '{\"question\":\"Quant \\u00e9s 10 \\/ 5?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":2,\"is_correct\":true}]}', 'facil', 'division'),
(341, '{\"question\":\"Quant \\u00e9s 14 \\/ 7?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'facil', 'division'),
(342, '{\"question\":\"Quant \\u00e9s 576 \\/ 24?\",\"answers\":[{\"value\":22,\"is_correct\":false},{\"value\":26,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":24,\"is_correct\":true}]}', 'intermedio', 'division'),
(343, '{\"question\":\"Quant \\u00e9s 9900 \\/ 33?\",\"answers\":[{\"value\":330,\"is_correct\":false},{\"value\":300,\"is_correct\":true},{\"value\":250,\"is_correct\":false},{\"value\":280,\"is_correct\":false}]}', 'dificil', 'division'),
(344, '{\"question\":\"Quant \\u00e9s 15 \\/ 3?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'facil', 'division'),
(345, '{\"question\":\"Quant \\u00e9s 165 \\/ 5?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":33,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'division'),
(346, '{\"question\":\"Quant \\u00e9s 5184 \\/ 72?\",\"answers\":[{\"value\":72,\"is_correct\":true},{\"value\":70,\"is_correct\":false},{\"value\":75,\"is_correct\":false},{\"value\":80,\"is_correct\":false}]}', 'dificil', 'division'),
(347, '{\"question\":\"Quant \\u00e9s 12 \\/ 3?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":true}]}', 'facil', 'division'),
(348, '{\"question\":\"Quant \\u00e9s 312 \\/ 26?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":14,\"is_correct\":false},{\"value\":13,\"is_correct\":false},{\"value\":15,\"is_correct\":false}]}', 'intermedio', 'division'),
(349, '{\"question\":\"Quant \\u00e9s 8250 \\/ 75?\",\"answers\":[{\"value\":120,\"is_correct\":false},{\"value\":110,\"is_correct\":true},{\"value\":100,\"is_correct\":false},{\"value\":105,\"is_correct\":false}]}', 'dificil', 'division'),
(350, '{\"question\":\"Quant \\u00e9s 8 \\/ 2?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":4,\"is_correct\":true},{\"value\":2,\"is_correct\":false}]}', 'facil', 'division'),
(351, '{\"question\":\"Quant \\u00e9s 16 \\/ 4?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":4,\"is_correct\":true},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(352, '{\"question\":\"Quant \\u00e9s 125 \\/ 25?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'intermedio', 'division'),
(353, '{\"question\":\"Quant \\u00e9s 504 \\/ 42?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":13,\"is_correct\":false}]}', 'dificil', 'division'),
(354, '{\"question\":\"Quant \\u00e9s 32 \\/ 8?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'facil', 'division'),
(355, '{\"question\":\"Quant \\u00e9s 672 \\/ 28?\",\"answers\":[{\"value\":22,\"is_correct\":false},{\"value\":24,\"is_correct\":true},{\"value\":26,\"is_correct\":false},{\"value\":25,\"is_correct\":false}]}', 'intermedio', 'division'),
(356, '{\"question\":\"Quant \\u00e9s 2100 \\/ 30?\",\"answers\":[{\"value\":60,\"is_correct\":false},{\"value\":70,\"is_correct\":true},{\"value\":72,\"is_correct\":false},{\"value\":75,\"is_correct\":false}]}', 'dificil', 'division'),
(357, '{\"question\":\"Quant \\u00e9s 150 \\/ 25?\",\"answers\":[{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'facil', 'division'),
(358, '{\"question\":\"Quant \\u00e9s 792 \\/ 24?\",\"answers\":[{\"value\":33,\"is_correct\":true},{\"value\":34,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":31,\"is_correct\":false}]}', 'intermedio', 'division'),
(359, '{\"question\":\"Quant \\u00e9s 9600 \\/ 240?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":45,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'dificil', 'division'),
(360, '{\"question\":\"Quant \\u00e9s 48 \\/ 6?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(361, '{\"question\":\"Quant \\u00e9s 198 \\/ 33?\",\"answers\":[{\"value\":6,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'intermedio', 'division'),
(362, '{\"question\":\"Quant \\u00e9s 3240 \\/ 36?\",\"answers\":[{\"value\":90,\"is_correct\":true},{\"value\":80,\"is_correct\":false},{\"value\":85,\"is_correct\":false},{\"value\":92,\"is_correct\":false}]}', 'dificil', 'division'),
(363, '{\"question\":\"Quant \\u00e9s 36 \\/ 9?\",\"answers\":[{\"value\":5,\"is_correct\":false},{\"value\":4,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(364, '{\"question\":\"Quant \\u00e9s 96 \\/ 12?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":12,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'facil', 'division'),
(365, '{\"question\":\"Quant \\u00e9s 360 \\/ 18?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":22,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":25,\"is_correct\":false}]}', 'intermedio', 'division'),
(366, '{\"question\":\"Quant \\u00e9s 1024 \\/ 32?\",\"answers\":[{\"value\":31,\"is_correct\":false},{\"value\":33,\"is_correct\":false},{\"value\":32,\"is_correct\":true},{\"value\":30,\"is_correct\":false}]}', 'dificil', 'division'),
(367, '{\"question\":\"Quant \\u00e9s 90 \\/ 9?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":10,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false}]}', 'facil', 'division'),
(368, '{\"question\":\"Quant \\u00e9s 625 \\/ 25?\",\"answers\":[{\"value\":25,\"is_correct\":true},{\"value\":20,\"is_correct\":false},{\"value\":30,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'intermedio', 'division'),
(369, '{\"question\":\"Quant \\u00e9s 144 \\/ 18?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":8,\"is_correct\":true}]}', 'facil', 'division'),
(370, '{\"question\":\"Quant \\u00e9s 900 \\/ 30?\",\"answers\":[{\"value\":32,\"is_correct\":false},{\"value\":30,\"is_correct\":true},{\"value\":28,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'intermedio', 'division'),
(371, '{\"question\":\"Quant \\u00e9s 256 \\/ 16?\",\"answers\":[{\"value\":15,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":16,\"is_correct\":true},{\"value\":18,\"is_correct\":false}]}', 'intermedio', 'division'),
(372, '{\"question\":\"Quant \\u00e9s 750 \\/ 25?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":28,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":30,\"is_correct\":true}]}', 'intermedio', 'division'),
(373, '{\"question\":\"Quant \\u00e9s 480 \\/ 40?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":11,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":13,\"is_correct\":false}]}', 'intermedio', 'division'),
(374, '{\"question\":\"Quant \\u00e9s 1024 \\/ 16?\",\"answers\":[{\"value\":60,\"is_correct\":false},{\"value\":64,\"is_correct\":true},{\"value\":55,\"is_correct\":false},{\"value\":70,\"is_correct\":false}]}', 'dificil', 'division'),
(375, '{\"question\":\"Quant \\u00e9s 400 \\/ 20?\",\"answers\":[{\"value\":15,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":30,\"is_correct\":false}]}', 'facil', 'division'),
(376, '{\"question\":\"Quant \\u00e9s 540 \\/ 18?\",\"answers\":[{\"value\":28,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":30,\"is_correct\":true}]}', 'intermedio', 'division'),
(377, '{\"question\":\"Quant \\u00e9s 999 \\/ 3?\",\"answers\":[{\"value\":333,\"is_correct\":true},{\"value\":332,\"is_correct\":false},{\"value\":334,\"is_correct\":false},{\"value\":325,\"is_correct\":false}]}', 'dificil', 'division'),
(378, '{\"question\":\"Quant \\u00e9s 121 \\/ 11?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":11,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":13,\"is_correct\":false}]}', 'facil', 'division'),
(379, '{\"question\":\"Quant \\u00e9s 625 \\/ 125?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":7,\"is_correct\":false}]}', 'intermedio', 'division'),
(380, '{\"question\":\"Quant \\u00e9s 1000 \\/ 25?\",\"answers\":[{\"value\":45,\"is_correct\":false},{\"value\":30,\"is_correct\":false},{\"value\":35,\"is_correct\":false},{\"value\":40,\"is_correct\":true}]}', 'intermedio', 'division'),
(381, '{\"question\":\"Quant \\u00e9s 256 \\/ 8?\",\"answers\":[{\"value\":32,\"is_correct\":true},{\"value\":31,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'intermedio', 'division'),
(382, '{\"question\":\"Quant \\u00e9s 512 \\/ 64?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":9,\"is_correct\":false}]}', 'intermedio', 'division'),
(383, '{\"question\":\"Quant \\u00e9s 800 \\/ 25?\",\"answers\":[{\"value\":33,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":32,\"is_correct\":true},{\"value\":30,\"is_correct\":false}]}', 'intermedio', 'division'),
(384, '{\"question\":\"Quant \\u00e9s 640 \\/ 40?\",\"answers\":[{\"value\":15,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":16,\"is_correct\":true}]}', 'intermedio', 'division'),
(385, '{\"question\":\"Quant \\u00e9s 288 \\/ 12?\",\"answers\":[{\"value\":24,\"is_correct\":true},{\"value\":25,\"is_correct\":false},{\"value\":26,\"is_correct\":false},{\"value\":23,\"is_correct\":false}]}', 'intermedio', 'division'),
(386, '{\"question\":\"Quant \\u00e9s 144 \\/ 9?\",\"answers\":[{\"value\":15,\"is_correct\":false},{\"value\":16,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":14,\"is_correct\":false}]}', 'facil', 'division'),
(387, '{\"question\":\"Quant \\u00e9s 777 \\/ 7?\",\"answers\":[{\"value\":112,\"is_correct\":false},{\"value\":110,\"is_correct\":false},{\"value\":111,\"is_correct\":true},{\"value\":108,\"is_correct\":false}]}', 'dificil', 'division'),
(388, '{\"question\":\"Quant \\u00e9s 1000 \\/ 50?\",\"answers\":[{\"value\":22,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":19,\"is_correct\":false},{\"value\":20,\"is_correct\":true}]}', 'facil', 'division'),
(389, '{\"question\":\"Quant \\u00e9s 560 \\/ 28?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":22,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":23,\"is_correct\":false}]}', 'intermedio', 'division'),
(390, '{\"question\":\"Quant \\u00e9s 864 \\/ 32?\",\"answers\":[{\"value\":28,\"is_correct\":false},{\"value\":27,\"is_correct\":true},{\"value\":30,\"is_correct\":false},{\"value\":25,\"is_correct\":false}]}', 'dificil', 'division'),
(391, '{\"question\":\"Quant \\u00e9s 50 \\/ 5?\",\"answers\":[{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":10,\"is_correct\":true},{\"value\":8,\"is_correct\":false}]}', 'facil', 'division'),
(392, '{\"question\":\"Quant \\u00e9s 240 \\/ 12?\",\"answers\":[{\"value\":18,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":20,\"is_correct\":true}]}', 'intermedio', 'division'),
(393, '{\"question\":\"Quant \\u00e9s 625 \\/ 125?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'intermedio', 'division'),
(394, '{\"question\":\"Quant \\u00e9s 640 \\/ 32?\",\"answers\":[{\"value\":21,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":22,\"is_correct\":false}]}', 'intermedio', 'division'),
(395, '{\"question\":\"Quant \\u00e9s 900 \\/ 45?\",\"answers\":[{\"value\":21,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":22,\"is_correct\":false}]}', 'intermedio', 'division'),
(396, '{\"question\":\"Quant \\u00e9s 840 \\/ 42?\",\"answers\":[{\"value\":19,\"is_correct\":false},{\"value\":21,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":20,\"is_correct\":true}]}', 'intermedio', 'division'),
(397, '{\"question\":\"Quant \\u00e9s 950 \\/ 25?\",\"answers\":[{\"value\":38,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'division'),
(398, '{\"question\":\"Quant \\u00e9s 512 \\/ 8?\",\"answers\":[{\"value\":62,\"is_correct\":false},{\"value\":64,\"is_correct\":true},{\"value\":60,\"is_correct\":false},{\"value\":58,\"is_correct\":false}]}', 'intermedio', 'division'),
(399, '{\"question\":\"Quant \\u00e9s 400 \\/ 20?\",\"answers\":[{\"value\":25,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":18,\"is_correct\":false}]}', 'facil', 'division'),
(400, '{\"question\":\"Quant \\u00e9s 123,456 \\/ 1?\",\"answers\":[{\"value\":123.456,\"is_correct\":true},{\"value\":\"error\",\"is_correct\":false},{\"value\":124.567,\"is_correct\":false},{\"value\":\"\\u03c0\",\"is_correct\":false}]}', 'facil', 'division');

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
(1, 'user', 'user@gmail.com', NULL, '$2y$12$XXbUMBnt7k7/qUP3YVLyWeriKwGjGYpvr6XQrfUDgFdaePt65ssBq', 'user', 1, NULL, '2024-12-20 07:43:24', '2024-12-20 07:43:24'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$12$QWnxFz0aMnfArYuMdUzUU.5hR.l/pKoAlPy.atSOw6RA3753a0iuS', 'Admin', 1, NULL, '2024-12-20 07:43:25', '2024-12-20 07:43:25');

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
-- Indices de la tabla `joc_codis`
--
ALTER TABLE `joc_codis`
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
-- AUTO_INCREMENT de la tabla `joc_codis`
--
ALTER TABLE `joc_codis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `operacions`
--
ALTER TABLE `operacions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

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
