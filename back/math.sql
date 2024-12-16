-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2024 a las 11:55:27
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
(1, 'Clase1', '2024-12-11 21:54:49', '2024-12-11 21:54:49');

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
(1, '{\"secretCode\":\"376\",\"codes\":[{\"code\":\"123\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"871\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"349\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"456\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"567\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"}]}', ''),
(2, '{\"secretCode\":\"492\",\"codes\":[{\"code\":\"154\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"582\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"371\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"983\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"742\",\"pista\":\"Tiene 2 n\\u00famero correcto pero solo 1 en la posici\\u00f3n correcta.\"}]}', ''),
(3, '{\"secretCode\":\"135\",\"codes\":[{\"code\":\"123\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero solo 1 en la posici\\u00f3n correcta.\"},{\"code\":\"356\",\"pista\":\"Tiene 2 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"937\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"865\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"246\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"}]}', ''),
(4, '{\"secretCode\":\"394\",\"codes\":[{\"code\":\"291\",\"pista\":\"Tiene 1 n\\u00famero correcto en su posici\\u00f3n.\"},{\"code\":\"245\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"463\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"},{\"code\":\"578\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"809\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"}]}', ''),
(5, '{\"secretCode\":\"521\",\"codes\":[{\"code\":\"962\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"175\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"},{\"code\":\"409\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"614\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"823\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"}]}', ''),
(6, '{\"secretCode\":\"483\",\"codes\":[{\"code\":\"731\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"278\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"162\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"985\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"304\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"}]}', ''),
(7, '{\"secretCode\":\"938\",\"codes\":[{\"code\":\"286\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"430\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"723\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"859\",\"pista\":\"Tiene 2 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"617\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"}]}', ''),
(8, '{\"secretCode\":\"345\",\"codes\":[{\"code\":\"764\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"503\",\"pista\":\"Tiene 2 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"241\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"659\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"987\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"}]}', ''),
(9, '{\"secretCode\":\"207\",\"codes\":[{\"code\":\"580\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"729\",\"pista\":\"Tiene 2 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"603\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"874\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"915\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"}]}', ''),
(10, '{\"secretCode\":\"042\",\"codes\":[{\"code\":\"682\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"614\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"206\",\"pista\":\"Tiene 2 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"738\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"780\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"}]}', ''),
(11, '{\"secretCode\":\"482\",\"codes\":[{\"code\":\"123\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en su posici\\u00f3n.\"},{\"code\":\"845\",\"pista\":\"Tiene 2 n\\u00fameros correctos, pero no en su posici\\u00f3n.\"},{\"code\":\"438\",\"pista\":\"Tiene 2 n\\u00fameros correctos, 1 en su posici\\u00f3n correcta.\"},{\"code\":\"862\",\"pista\":\"Tiene 2 n\\u00fameros correctos, 1 en su posici\\u00f3n correcta.\"},{\"code\":\"491\",\"pista\":\"Tiene 1 n\\u00famero en su posici\\u00f3n correcto.\"}]}', ''),
(12, '{\"secretCode\":\"627\",\"codes\":[{\"code\":\"123\",\"pista\":\"Tiene 1 n\\u00famero correcto en su posici\\u00f3n correcto.\"},{\"code\":\"781\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en su posici\\u00f3n.\"},{\"code\":\"642\",\"pista\":\"Tiene 2 n\\u00fameros correctos, uno en su posici\\u00f3n correcta.\"},{\"code\":\"257\",\"pista\":\"Tiene 2 n\\u00fameros correctos, uno en su posici\\u00f3n correcta.\"},{\"code\":\"867\",\"pista\":\"Tiene 2 n\\u00fameros correctos, uno en su posici\\u00f3n correcta.\"}]}', ''),
(13, '{\"secretCode\":\"904\",\"codes\":[{\"code\":\"450\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en su posici\\u00f3n correcta.\"},{\"code\":\"319\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en su posici\\u00f3n correcta.\"},{\"code\":\"091\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en su posici\\u00f3n correcta.\"},{\"code\":\"564\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"804\",\"pista\":\"Tiene 2 n\\u00fameros correctos en su posici\\u00f3n correcta.\"}]}', ''),
(14, '{\"secretCode\":\"173\",\"codes\":[{\"code\":\"318\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en su posici\\u00f3n correcta.\"},{\"code\":\"157\",\"pista\":\"Tiene 2 n\\u00fameros correctos, uno en la posici\\u00f3n correcta.\"},{\"code\":\"739\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en su posici\\u00f3n.\"},{\"code\":\"523\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"372\",\"pista\":\"Tiene 2 n\\u00fameros correctos, uno en su posici\\u00f3n correcta.\"}]}', ''),
(15, '{\"secretCode\":\"042\",\"codes\":[{\"code\":\"682\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"614\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"206\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"},{\"code\":\"738\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"780\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"}]}', ''),
(16, '{\"secretCode\":\"718\",\"codes\":[{\"code\":\"548\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"530\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"157\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"},{\"code\":\"806\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"647\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"}]}', ''),
(17, '{\"secretCode\":\"718\",\"codes\":[{\"code\":\"256\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"042\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"803\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"},{\"code\":\"917\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"832\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"}]}', ''),
(18, '{\"secretCode\":\"042\",\"codes\":[{\"code\":\"682\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"},{\"code\":\"614\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"206\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"},{\"code\":\"738\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"780\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"}]}', ''),
(19, '{\"secretCode\":\"619\",\"codes\":[{\"code\":\"902\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"135\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"740\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"291\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"},{\"code\":\"632\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"}]}', ''),
(20, '{\"secretCode\":\"974\",\"codes\":[{\"code\":\"146\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"389\",\"pista\":\"Tiene 1 n\\u00famero correcto pero no en la posici\\u00f3n correcta.\"},{\"code\":\"508\",\"pista\":\"Tiene 0 n\\u00fameros correctos.\"},{\"code\":\"457\",\"pista\":\"Tiene 2 n\\u00fameros correctos pero no en la posici\\u00f3n correcta.\"},{\"code\":\"920\",\"pista\":\"Tiene 1 n\\u00famero correcto en la posici\\u00f3n correcta.\"}]}', '');

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
(20, '{\"question\":\"\\u00bfCu\\u00e1nto es 234 + 678?\",\"answers\":[{\"value\":911,\"is_correct\":false},{\"value\":913,\"is_correct\":false},{\"value\":912,\"is_correct\":true},{\"value\":914,\"is_correct\":false}]}', 'difícil', 'suma'),
(21, '{\"question\":\"\\u00bfCu\\u00e1nto es 345 + 567?\",\"answers\":[{\"value\":910,\"is_correct\":false},{\"value\":913,\"is_correct\":false},{\"value\":912,\"is_correct\":true},{\"value\":914,\"is_correct\":false}]}', 'difícil', 'suma'),
(22, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 + 4?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":true}]}', 'fácil', 'suma'),
(23, '{\"question\":\"\\u00bfCu\\u00e1nto es 28 + 35?\",\"answers\":[{\"value\":62,\"is_correct\":false},{\"value\":63,\"is_correct\":true},{\"value\":64,\"is_correct\":false},{\"value\":65,\"is_correct\":false}]}', 'intermedio', 'suma'),
(24, '{\"question\":\"\\u00bfCu\\u00e1nto es 189 + 176?\",\"answers\":[{\"value\":365,\"is_correct\":false},{\"value\":367,\"is_correct\":false},{\"value\":366,\"is_correct\":true},{\"value\":368,\"is_correct\":false}]}', 'difícil', 'suma'),
(25, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 + 7?\",\"answers\":[{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":12,\"is_correct\":false},{\"value\":10,\"is_correct\":true}]}', 'fácil', 'suma'),
(26, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 + 2?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'suma'),
(27, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 + 27?\",\"answers\":[{\"value\":44,\"is_correct\":false},{\"value\":45,\"is_correct\":true},{\"value\":46,\"is_correct\":false},{\"value\":47,\"is_correct\":false}]}', 'intermedio', 'suma'),
(28, '{\"question\":\"\\u00bfCu\\u00e1nto es 34 + 49?\",\"answers\":[{\"value\":82,\"is_correct\":false},{\"value\":84,\"is_correct\":false},{\"value\":83,\"is_correct\":true},{\"value\":85,\"is_correct\":false}]}', 'intermedio', 'suma'),
(29, '{\"question\":\"\\u00bfCu\\u00e1nto es 567 + 234?\",\"answers\":[{\"value\":800,\"is_correct\":false},{\"value\":801,\"is_correct\":true},{\"value\":802,\"is_correct\":false},{\"value\":803,\"is_correct\":false}]}', 'difícil', 'suma'),
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
(102, '{\"question\":\"\\u00bfCu\\u00e1nto es 57 - 23?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":true},{\"value\":33,\"is_correct\":false},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'resta'),
(103, '{\"question\":\"\\u00bfCu\\u00e1nto es 345 - 123?\",\"answers\":[{\"value\":221,\"is_correct\":false},{\"value\":222,\"is_correct\":true},{\"value\":223,\"is_correct\":false},{\"value\":224,\"is_correct\":false}]}', 'difícil', 'resta'),
(104, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 - 2?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":true}]}', 'fácil', 'resta'),
(105, '{\"question\":\"\\u00bfCu\\u00e1nto es 65 - 27?\",\"answers\":[{\"value\":37,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":38,\"is_correct\":true},{\"value\":39,\"is_correct\":false}]}', 'intermedio', 'resta'),
(106, '{\"question\":\"\\u00bfCu\\u00e1nto es 723 - 387?\",\"answers\":[{\"value\":335,\"is_correct\":false},{\"value\":334,\"is_correct\":false},{\"value\":336,\"is_correct\":true},{\"value\":337,\"is_correct\":false}]}', 'difícil', 'resta'),
(107, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 - 2?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(108, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 - 29?\",\"answers\":[{\"value\":16,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":17,\"is_correct\":false}]}', 'intermedio', 'resta'),
(109, '{\"question\":\"\\u00bfCu\\u00e1nto es 412 - 125?\",\"answers\":[{\"value\":287,\"is_correct\":true},{\"value\":290,\"is_correct\":false},{\"value\":285,\"is_correct\":false},{\"value\":286,\"is_correct\":false}]}', 'difícil', 'resta'),
(110, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 - 3?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'fácil', 'resta'),
(111, '{\"question\":\"\\u00bfCu\\u00e1nto es 67 - 33?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":34,\"is_correct\":true}]}', 'intermedio', 'resta'),
(112, '{\"question\":\"\\u00bfCu\\u00e1nto es 973 - 487?\",\"answers\":[{\"value\":486,\"is_correct\":true},{\"value\":485,\"is_correct\":false},{\"value\":487,\"is_correct\":false},{\"value\":485,\"is_correct\":false}]}', 'difícil', 'resta'),
(113, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 - 1?\",\"answers\":[{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(114, '{\"question\":\"\\u00bfCu\\u00e1nto es 56 - 24?\",\"answers\":[{\"value\":80,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":32,\"is_correct\":true}]}', 'intermedio', 'resta'),
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
(132, '{\"question\":\"\\u00bfCu\\u00e1nto es 57 - 40?\",\"answers\":[{\"value\":16,\"is_correct\":false},{\"value\":17,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":18,\"is_correct\":false}]}', 'intermedio', 'resta'),
(133, '{\"question\":\"\\u00bfCu\\u00e1nto es 831 - 482?\",\"answers\":[{\"value\":349,\"is_correct\":true},{\"value\":350,\"is_correct\":false},{\"value\":348,\"is_correct\":false},{\"value\":351,\"is_correct\":false}]}', 'difícil', 'resta'),
(134, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 - 4?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":0,\"is_correct\":false}]}', 'fácil', 'resta'),
(135, '{\"question\":\"\\u00bfCu\\u00e1nto es 68 - 32?\",\"answers\":[{\"value\":37,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false}]}', 'intermedio', 'resta'),
(136, '{\"question\":\"\\u00bfCu\\u00e1nto es 765 - 489?\",\"answers\":[{\"value\":275,\"is_correct\":false},{\"value\":277,\"is_correct\":false},{\"value\":278,\"is_correct\":false},{\"value\":276,\"is_correct\":true}]}', 'difícil', 'resta'),
(137, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 - 6?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":1,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(138, '{\"question\":\"\\u00bfCu\\u00e1nto es 75 - 41?\",\"answers\":[{\"value\":33,\"is_correct\":false},{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":true},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'resta'),
(139, '{\"question\":\"\\u00bfCu\\u00e1nto es 894 - 762?\",\"answers\":[{\"value\":132,\"is_correct\":true},{\"value\":131,\"is_correct\":false},{\"value\":133,\"is_correct\":false},{\"value\":134,\"is_correct\":false}]}', 'difícil', 'resta'),
(140, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 - 2?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":true}]}', 'fácil', 'resta'),
(141, '{\"question\":\"\\u00bfCu\\u00e1nto es 93 - 58?\",\"answers\":[{\"value\":36,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(142, '{\"question\":\"\\u00bfCu\\u00e1nto es 634 - 475?\",\"answers\":[{\"value\":160,\"is_correct\":false},{\"value\":159,\"is_correct\":true},{\"value\":158,\"is_correct\":false},{\"value\":157,\"is_correct\":false}]}', 'difícil', 'resta'),
(143, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 - 3?\",\"answers\":[{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":1,\"is_correct\":true},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(144, '{\"question\":\"\\u00bfCu\\u00e1nto es 84 - 59?\",\"answers\":[{\"value\":26,\"is_correct\":false},{\"value\":24,\"is_correct\":false},{\"value\":27,\"is_correct\":false},{\"value\":25,\"is_correct\":true}]}', 'intermedio', 'resta'),
(145, '{\"question\":\"\\u00bfCu\\u00e1nto es 732 - 498?\",\"answers\":[{\"value\":235,\"is_correct\":false},{\"value\":234,\"is_correct\":true},{\"value\":233,\"is_correct\":false},{\"value\":236,\"is_correct\":false}]}', 'difícil', 'resta'),
(146, '{\"question\":\"\\u00bfCu\\u00e1nto es 10 - 7?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(147, '{\"question\":\"\\u00bfCu\\u00e1nto es 92 - 47?\",\"answers\":[{\"value\":44,\"is_correct\":false},{\"value\":46,\"is_correct\":false},{\"value\":43,\"is_correct\":false},{\"value\":45,\"is_correct\":true}]}', 'intermedio', 'resta'),
(148, '{\"question\":\"\\u00bfCu\\u00e1nto es 982 - 637?\",\"answers\":[{\"value\":345,\"is_correct\":true},{\"value\":344,\"is_correct\":false},{\"value\":346,\"is_correct\":false},{\"value\":347,\"is_correct\":false}]}', 'difícil', 'resta'),
(149, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 - 2?\",\"answers\":[{\"value\":2,\"is_correct\":false},{\"value\":1,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(150, '{\"question\":\"\\u00bfCu\\u00e1nto es 63 - 28?\",\"answers\":[{\"value\":36,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(151, '{\"question\":\"\\u00bfCu\\u00e1nto es 743 - 516?\",\"answers\":[{\"value\":226,\"is_correct\":false},{\"value\":228,\"is_correct\":false},{\"value\":229,\"is_correct\":false},{\"value\":227,\"is_correct\":true}]}', 'difícil', 'resta'),
(152, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 - 4?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'fácil', 'resta'),
(153, '{\"question\":\"\\u00bfCu\\u00e1nto es 81 - 37?\",\"answers\":[{\"value\":44,\"is_correct\":true},{\"value\":43,\"is_correct\":false},{\"value\":45,\"is_correct\":false},{\"value\":42,\"is_correct\":false}]}', 'intermedio', 'resta'),
(154, '{\"question\":\"\\u00bfCu\\u00e1nto es 978 - 683?\",\"answers\":[{\"value\":295,\"is_correct\":true},{\"value\":294,\"is_correct\":false},{\"value\":296,\"is_correct\":false},{\"value\":293,\"is_correct\":false}]}', 'difícil', 'resta'),
(155, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 - 5?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(156, '{\"question\":\"\\u00bfCu\\u00e1nto es 95 - 47?\",\"answers\":[{\"value\":47,\"is_correct\":false},{\"value\":48,\"is_correct\":true},{\"value\":46,\"is_correct\":false},{\"value\":49,\"is_correct\":false}]}', 'intermedio', 'resta'),
(157, '{\"question\":\"\\u00bfCu\\u00e1nto es 843 - 594?\",\"answers\":[{\"value\":249,\"is_correct\":true},{\"value\":248,\"is_correct\":false},{\"value\":250,\"is_correct\":false},{\"value\":247,\"is_correct\":false}]}', 'difícil', 'resta'),
(158, '{\"question\":\"\\u00bfCu\\u00e1nto es 10 - 3?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'fácil', 'resta'),
(159, '{\"question\":\"\\u00bfCu\\u00e1nto es 83 - 59?\",\"answers\":[{\"value\":25,\"is_correct\":false},{\"value\":24,\"is_correct\":true},{\"value\":26,\"is_correct\":false},{\"value\":23,\"is_correct\":false}]}', 'intermedio', 'resta'),
(160, '{\"question\":\"\\u00bfCu\\u00e1nto es 932 - 712?\",\"answers\":[{\"value\":220,\"is_correct\":true},{\"value\":221,\"is_correct\":false},{\"value\":219,\"is_correct\":false},{\"value\":222,\"is_correct\":false}]}', 'difícil', 'resta'),
(161, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 - 3?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'fácil', 'resta'),
(162, '{\"question\":\"\\u00bfCu\\u00e1nto es 72 - 39?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":33,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":false}]}', 'intermedio', 'resta'),
(163, '{\"question\":\"\\u00bfCu\\u00e1nto es 496 - 274?\",\"answers\":[{\"value\":222,\"is_correct\":true},{\"value\":221,\"is_correct\":false},{\"value\":223,\"is_correct\":false},{\"value\":224,\"is_correct\":false}]}', 'difícil', 'resta'),
(164, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 - 4?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'fácil', 'resta'),
(165, '{\"question\":\"\\u00bfCu\\u00e1nto es 85 - 44?\",\"answers\":[{\"value\":41,\"is_correct\":true},{\"value\":40,\"is_correct\":false},{\"value\":42,\"is_correct\":false},{\"value\":39,\"is_correct\":false}]}', 'intermedio', 'resta'),
(166, '{\"question\":\"\\u00bfCu\\u00e1nto es 748 - 524?\",\"answers\":[{\"value\":224,\"is_correct\":true},{\"value\":223,\"is_correct\":false},{\"value\":225,\"is_correct\":false},{\"value\":226,\"is_correct\":false}]}', 'difícil', 'resta'),
(167, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 - 6?\",\"answers\":[{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'fácil', 'resta'),
(168, '{\"question\":\"\\u00bfCu\\u00e1nto es 63 - 28?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":36,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(169, '{\"question\":\"\\u00bfCu\\u00e1nto es 913 - 486?\",\"answers\":[{\"value\":426,\"is_correct\":false},{\"value\":427,\"is_correct\":true},{\"value\":428,\"is_correct\":false},{\"value\":425,\"is_correct\":false}]}', 'difícil', 'resta'),
(170, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 - 9?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":3,\"is_correct\":false}]}', 'fácil', 'resta'),
(171, '{\"question\":\"\\u00bfCu\\u00e1nto es 52 - 17?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":36,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'intermedio', 'resta'),
(172, '{\"question\":\"\\u00bfCu\\u00e1nto es 324 - 198?\",\"answers\":[{\"value\":127,\"is_correct\":false},{\"value\":129,\"is_correct\":false},{\"value\":128,\"is_correct\":false},{\"value\":126,\"is_correct\":true}]}', 'difícil', 'resta'),
(173, '{\"question\":\"\\u00bfCu\\u00e1nto es 10 - 2?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(174, '{\"question\":\"\\u00bfCu\\u00e1nto es 90 - 45?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":44,\"is_correct\":false},{\"value\":45,\"is_correct\":true}]}', 'intermedio', 'resta'),
(175, '{\"question\":\"\\u00bfCu\\u00e1nto es 205 - 150?\",\"answers\":[{\"value\":55,\"is_correct\":true},{\"value\":54,\"is_correct\":false},{\"value\":56,\"is_correct\":false},{\"value\":57,\"is_correct\":false}]}', 'difícil', 'resta'),
(176, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 - 7?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":11,\"is_correct\":true},{\"value\":13,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'fácil', 'resta'),
(177, '{\"question\":\"\\u00bfCu\\u00e1nto es 68 - 32?\",\"answers\":[{\"value\":36,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":37,\"is_correct\":false},{\"value\":34,\"is_correct\":false}]}', 'intermedio', 'resta'),
(178, '{\"question\":\"\\u00bfCu\\u00e1nto es 402 - 198?\",\"answers\":[{\"value\":204,\"is_correct\":true},{\"value\":205,\"is_correct\":false},{\"value\":203,\"is_correct\":false},{\"value\":202,\"is_correct\":false}]}', 'difícil', 'resta'),
(179, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 - 3?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(180, '{\"question\":\"\\u00bfCu\\u00e1nto es 80 - 48?\",\"answers\":[{\"value\":31,\"is_correct\":false},{\"value\":32,\"is_correct\":true},{\"value\":33,\"is_correct\":false},{\"value\":34,\"is_correct\":false}]}', 'intermedio', 'resta'),
(181, '{\"question\":\"\\u00bfCu\\u00e1nto es 100 - 56?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":46,\"is_correct\":false},{\"value\":44,\"is_correct\":true}]}', 'intermedio', 'resta'),
(182, '{\"question\":\"\\u00bfCu\\u00e1nto es 15 - 7?\",\"answers\":[{\"value\":9,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'resta'),
(183, '{\"question\":\"\\u00bfCu\\u00e1nto es 225 - 174?\",\"answers\":[{\"value\":50,\"is_correct\":false},{\"value\":51,\"is_correct\":true},{\"value\":52,\"is_correct\":false},{\"value\":53,\"is_correct\":false}]}', 'difícil', 'resta'),
(184, '{\"question\":\"\\u00bfCu\\u00e1nto es 36 - 19?\",\"answers\":[{\"value\":17,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":false}]}', 'intermedio', 'resta'),
(185, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 - 6?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":2,\"is_correct\":false}]}', 'fácil', 'resta'),
(186, '{\"question\":\"\\u00bfCu\\u00e1nto es 128 - 95?\",\"answers\":[{\"value\":33,\"is_correct\":true},{\"value\":32,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'intermedio', 'resta'),
(187, '{\"question\":\"\\u00bfCu\\u00e1nto es 600 - 425?\",\"answers\":[{\"value\":175,\"is_correct\":true},{\"value\":176,\"is_correct\":false},{\"value\":174,\"is_correct\":false},{\"value\":177,\"is_correct\":false}]}', 'difícil', 'resta'),
(188, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 - 5?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":8,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'fácil', 'resta'),
(189, '{\"question\":\"\\u00bfCu\\u00e1nto es 58 - 22?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":37,\"is_correct\":false},{\"value\":34,\"is_correct\":false}]}', 'intermedio', 'resta'),
(190, '{\"question\":\"\\u00bfCu\\u00e1nto es 500 - 299?\",\"answers\":[{\"value\":200,\"is_correct\":false},{\"value\":201,\"is_correct\":true},{\"value\":202,\"is_correct\":false},{\"value\":203,\"is_correct\":false}]}', 'difícil', 'resta'),
(191, '{\"question\":\"\\u00bfCu\\u00e1nto es 35 - 18?\",\"answers\":[{\"value\":17,\"is_correct\":true},{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":18,\"is_correct\":false}]}', 'intermedio', 'resta'),
(192, '{\"question\":\"\\u00bfCu\\u00e1nto es 1000 - 850?\",\"answers\":[{\"value\":150,\"is_correct\":true},{\"value\":149,\"is_correct\":false},{\"value\":151,\"is_correct\":false},{\"value\":152,\"is_correct\":false}]}', 'difícil', 'resta'),
(193, '{\"question\":\"\\u00bfCu\\u00e1nto es 60 - 27?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":33,\"is_correct\":true},{\"value\":35,\"is_correct\":false}]}', 'intermedio', 'resta'),
(194, '{\"question\":\"\\u00bfCu\\u00e1nto es 22 - 12?\",\"answers\":[{\"value\":10,\"is_correct\":true},{\"value\":11,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'fácil', 'resta'),
(195, '{\"question\":\"\\u00bfCu\\u00e1nto es 150 - 47?\",\"answers\":[{\"value\":102,\"is_correct\":false},{\"value\":103,\"is_correct\":true},{\"value\":104,\"is_correct\":false},{\"value\":101,\"is_correct\":false}]}', 'intermedio', 'resta'),
(196, '{\"question\":\"\\u00bfCu\\u00e1nto es 200 - 89?\",\"answers\":[{\"value\":110,\"is_correct\":false},{\"value\":111,\"is_correct\":true},{\"value\":109,\"is_correct\":false},{\"value\":108,\"is_correct\":false}]}', 'difícil', 'resta'),
(197, '{\"question\":\"\\u00bfCu\\u00e1nto es 12 - 5?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":7,\"is_correct\":true}]}', 'fácil', 'resta'),
(198, '{\"question\":\"\\u00bfCu\\u00e1nto es 85 - 39?\",\"answers\":[{\"value\":47,\"is_correct\":false},{\"value\":46,\"is_correct\":true},{\"value\":48,\"is_correct\":false},{\"value\":45,\"is_correct\":false}]}', 'intermedio', 'resta'),
(199, '{\"question\":\"\\u00bfCu\\u00e1nto es 500 - 275?\",\"answers\":[{\"value\":224,\"is_correct\":false},{\"value\":225,\"is_correct\":true},{\"value\":226,\"is_correct\":false},{\"value\":223,\"is_correct\":false}]}', 'difícil', 'resta'),
(200, '{\"question\":\"\\u00bfCu\\u00e1nto es 19 - 8?\",\"answers\":[{\"value\":11,\"is_correct\":true},{\"value\":12,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":9,\"is_correct\":false}]}', 'fácil', 'resta'),
(201, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 x 6?\",\"answers\":[{\"value\":48,\"is_correct\":true},{\"value\":45,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":52,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(202, '{\"question\":\"\\u00bfCu\\u00e1nto es 12 x 6?\",\"answers\":[{\"value\":75,\"is_correct\":false},{\"value\":70,\"is_correct\":false},{\"value\":80,\"is_correct\":false},{\"value\":72,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(203, '{\"question\":\"\\u00bfCu\\u00e1nto es 24 x 12?\",\"answers\":[{\"value\":280,\"is_correct\":false},{\"value\":295,\"is_correct\":false},{\"value\":288,\"is_correct\":true},{\"value\":300,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(204, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 x 5?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":40,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(205, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 x 8?\",\"answers\":[{\"value\":110,\"is_correct\":false},{\"value\":120,\"is_correct\":false},{\"value\":100,\"is_correct\":false},{\"value\":112,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(206, '{\"question\":\"\\u00bfCu\\u00e1nto es 30 x 18?\",\"answers\":[{\"value\":520,\"is_correct\":false},{\"value\":530,\"is_correct\":false},{\"value\":540,\"is_correct\":true},{\"value\":550,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(207, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 x 7?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":28,\"is_correct\":true},{\"value\":25,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(208, '{\"question\":\"\\u00bfCu\\u00e1nto es 15 x 9?\",\"answers\":[{\"value\":130,\"is_correct\":false},{\"value\":140,\"is_correct\":false},{\"value\":120,\"is_correct\":false},{\"value\":135,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(209, '{\"question\":\"\\u00bfCu\\u00e1nto es 25 x 16?\",\"answers\":[{\"value\":420,\"is_correct\":false},{\"value\":380,\"is_correct\":false},{\"value\":400,\"is_correct\":true},{\"value\":410,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(210, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 x 9?\",\"answers\":[{\"value\":40,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":45,\"is_correct\":true},{\"value\":42,\"is_correct\":false}]}', 'fácil', 'multiplicacion');
INSERT INTO `operacions` (`id`, `problem_json`, `nivel_dificultad`, `tipo_operacion`) VALUES
(211, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 x 11?\",\"answers\":[{\"value\":200,\"is_correct\":false},{\"value\":210,\"is_correct\":false},{\"value\":198,\"is_correct\":true},{\"value\":190,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(212, '{\"question\":\"\\u00bfCu\\u00e1nto es 26 x 13?\",\"answers\":[{\"value\":330,\"is_correct\":false},{\"value\":320,\"is_correct\":false},{\"value\":350,\"is_correct\":false},{\"value\":338,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(213, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 x 4?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":38,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":32,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(214, '{\"question\":\"\\u00bfCu\\u00e1nto es 13 x 8?\",\"answers\":[{\"value\":100,\"is_correct\":false},{\"value\":90,\"is_correct\":false},{\"value\":104,\"is_correct\":true},{\"value\":110,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(215, '{\"question\":\"\\u00bfCu\\u00e1nto es 22 x 17?\",\"answers\":[{\"value\":380,\"is_correct\":false},{\"value\":350,\"is_correct\":false},{\"value\":374,\"is_correct\":true},{\"value\":360,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(216, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 x 8?\",\"answers\":[{\"value\":45,\"is_correct\":false},{\"value\":42,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":48,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(217, '{\"question\":\"\\u00bfCu\\u00e1nto es 10 x 14?\",\"answers\":[{\"value\":140,\"is_correct\":true},{\"value\":130,\"is_correct\":false},{\"value\":120,\"is_correct\":false},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(218, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 x 7?\",\"answers\":[{\"value\":50,\"is_correct\":false},{\"value\":56,\"is_correct\":true},{\"value\":55,\"is_correct\":false},{\"value\":60,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(219, '{\"question\":\"\\u00bfCu\\u00e1nto es 16 x 6?\",\"answers\":[{\"value\":92,\"is_correct\":false},{\"value\":96,\"is_correct\":true},{\"value\":100,\"is_correct\":false},{\"value\":90,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(220, '{\"question\":\"\\u00bfCu\\u00e1nto es 25 x 24?\",\"answers\":[{\"value\":600,\"is_correct\":true},{\"value\":580,\"is_correct\":false},{\"value\":625,\"is_correct\":false},{\"value\":600,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(221, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 x 10?\",\"answers\":[{\"value\":45,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":30,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(222, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 x 9?\",\"answers\":[{\"value\":140,\"is_correct\":false},{\"value\":145,\"is_correct\":false},{\"value\":162,\"is_correct\":true},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(223, '{\"question\":\"\\u00bfCu\\u00e1nto es 28 x 17?\",\"answers\":[{\"value\":476,\"is_correct\":true},{\"value\":485,\"is_correct\":false},{\"value\":460,\"is_correct\":false},{\"value\":490,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(224, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 x 12?\",\"answers\":[{\"value\":65,\"is_correct\":false},{\"value\":72,\"is_correct\":true},{\"value\":60,\"is_correct\":false},{\"value\":80,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(225, '{\"question\":\"\\u00bfCu\\u00e1nto es 15 x 14?\",\"answers\":[{\"value\":210,\"is_correct\":true},{\"value\":225,\"is_correct\":false},{\"value\":200,\"is_correct\":false},{\"value\":215,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(226, '{\"question\":\"\\u00bfCu\\u00e1nto es 35 x 24?\",\"answers\":[{\"value\":850,\"is_correct\":false},{\"value\":840,\"is_correct\":false},{\"value\":820,\"is_correct\":false},{\"value\":840,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(227, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 x 7?\",\"answers\":[{\"value\":33,\"is_correct\":false},{\"value\":35,\"is_correct\":true},{\"value\":38,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(228, '{\"question\":\"\\u00bfCu\\u00e1nto es 16 x 9?\",\"answers\":[{\"value\":140,\"is_correct\":false},{\"value\":144,\"is_correct\":true},{\"value\":145,\"is_correct\":false},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(229, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 x 14?\",\"answers\":[{\"value\":600,\"is_correct\":false},{\"value\":635,\"is_correct\":false},{\"value\":630,\"is_correct\":true},{\"value\":620,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(230, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 x 6?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":40,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(231, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 x 12?\",\"answers\":[{\"value\":168,\"is_correct\":true},{\"value\":160,\"is_correct\":false},{\"value\":155,\"is_correct\":false},{\"value\":180,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(232, '{\"question\":\"\\u00bfCu\\u00e1nto es 28 x 22?\",\"answers\":[{\"value\":600,\"is_correct\":false},{\"value\":616,\"is_correct\":true},{\"value\":650,\"is_correct\":false},{\"value\":620,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(233, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 x 5?\",\"answers\":[{\"value\":25,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":20,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(234, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 x 8?\",\"answers\":[{\"value\":144,\"is_correct\":true},{\"value\":130,\"is_correct\":false},{\"value\":135,\"is_correct\":false},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(235, '{\"question\":\"\\u00bfCu\\u00e1nto es 33 x 19?\",\"answers\":[{\"value\":630,\"is_correct\":false},{\"value\":629,\"is_correct\":false},{\"value\":627,\"is_correct\":true},{\"value\":620,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(236, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 x 5?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":25,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(237, '{\"question\":\"\\u00bfCu\\u00e1nto es 20 x 15?\",\"answers\":[{\"value\":300,\"is_correct\":true},{\"value\":290,\"is_correct\":false},{\"value\":310,\"is_correct\":false},{\"value\":280,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(238, '{\"question\":\"\\u00bfCu\\u00e1nto es 42 x 15?\",\"answers\":[{\"value\":640,\"is_correct\":false},{\"value\":630,\"is_correct\":true},{\"value\":600,\"is_correct\":false},{\"value\":620,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(239, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 x 8?\",\"answers\":[{\"value\":56,\"is_correct\":true},{\"value\":50,\"is_correct\":false},{\"value\":60,\"is_correct\":false},{\"value\":54,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(240, '{\"question\":\"\\u00bfCu\\u00e1nto es 19 x 11?\",\"answers\":[{\"value\":209,\"is_correct\":true},{\"value\":210,\"is_correct\":false},{\"value\":220,\"is_correct\":false},{\"value\":200,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(241, '{\"question\":\"\\u00bfCu\\u00e1nto es 36 x 18?\",\"answers\":[{\"value\":640,\"is_correct\":false},{\"value\":648,\"is_correct\":true},{\"value\":620,\"is_correct\":false},{\"value\":630,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(242, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 x 7?\",\"answers\":[{\"value\":21,\"is_correct\":true},{\"value\":20,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":19,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(243, '{\"question\":\"\\u00bfCu\\u00e1nto es 16 x 12?\",\"answers\":[{\"value\":185,\"is_correct\":false},{\"value\":190,\"is_correct\":false},{\"value\":192,\"is_correct\":true},{\"value\":200,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(244, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 x 17?\",\"answers\":[{\"value\":750,\"is_correct\":false},{\"value\":765,\"is_correct\":true},{\"value\":770,\"is_correct\":false},{\"value\":740,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(245, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 x 8?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":33,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":32,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(246, '{\"question\":\"\\u00bfCu\\u00e1nto es 22 x 9?\",\"answers\":[{\"value\":198,\"is_correct\":true},{\"value\":200,\"is_correct\":false},{\"value\":190,\"is_correct\":false},{\"value\":210,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(247, '{\"question\":\"\\u00bfCu\\u00e1nto es 57 x 14?\",\"answers\":[{\"value\":785,\"is_correct\":false},{\"value\":798,\"is_correct\":true},{\"value\":770,\"is_correct\":false},{\"value\":810,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(248, '{\"question\":\"\\u00bfCu\\u00e1nto es 2 x 10?\",\"answers\":[{\"value\":18,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":22,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(249, '{\"question\":\"\\u00bfCu\\u00e1nto es 17 x 15?\",\"answers\":[{\"value\":250,\"is_correct\":false},{\"value\":240,\"is_correct\":false},{\"value\":260,\"is_correct\":false},{\"value\":255,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(250, '{\"question\":\"\\u00bfCu\\u00e1nto es 63 x 19?\",\"answers\":[{\"value\":1197,\"is_correct\":true},{\"value\":1185,\"is_correct\":false},{\"value\":1200,\"is_correct\":false},{\"value\":1150,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(251, '{\"question\":\"\\u00bfCu\\u00e1nto es 11 x 7?\",\"answers\":[{\"value\":70,\"is_correct\":false},{\"value\":77,\"is_correct\":true},{\"value\":80,\"is_correct\":false},{\"value\":75,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(252, '{\"question\":\"\\u00bfCu\\u00e1nto es 25 x 14?\",\"answers\":[{\"value\":340,\"is_correct\":false},{\"value\":330,\"is_correct\":false},{\"value\":350,\"is_correct\":true},{\"value\":360,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(253, '{\"question\":\"\\u00bfCu\\u00e1nto es 72 x 16?\",\"answers\":[{\"value\":1100,\"is_correct\":false},{\"value\":1180,\"is_correct\":false},{\"value\":1200,\"is_correct\":false},{\"value\":1152,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(254, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 x 6?\",\"answers\":[{\"value\":30,\"is_correct\":true},{\"value\":28,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(255, '{\"question\":\"\\u00bfCu\\u00e1nto es 13 x 18?\",\"answers\":[{\"value\":220,\"is_correct\":false},{\"value\":234,\"is_correct\":true},{\"value\":240,\"is_correct\":false},{\"value\":230,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(256, '{\"question\":\"\\u00bfCu\\u00e1nto es 39 x 17?\",\"answers\":[{\"value\":650,\"is_correct\":false},{\"value\":670,\"is_correct\":false},{\"value\":663,\"is_correct\":true},{\"value\":700,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(257, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 x 5?\",\"answers\":[{\"value\":13,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(258, '{\"question\":\"\\u00bfCu\\u00e1nto es 19 x 7?\",\"answers\":[{\"value\":133,\"is_correct\":true},{\"value\":140,\"is_correct\":false},{\"value\":120,\"is_correct\":false},{\"value\":150,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(259, '{\"question\":\"\\u00bfCu\\u00e1nto es 49 x 12?\",\"answers\":[{\"value\":600,\"is_correct\":false},{\"value\":588,\"is_correct\":true},{\"value\":580,\"is_correct\":false},{\"value\":590,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(260, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 x 3?\",\"answers\":[{\"value\":8,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":true},{\"value\":6,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(261, '{\"question\":\"\\u00bfCu\\u00e1nto es 21 x 9?\",\"answers\":[{\"value\":180,\"is_correct\":false},{\"value\":200,\"is_correct\":false},{\"value\":210,\"is_correct\":false},{\"value\":189,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(262, '{\"question\":\"\\u00bfCu\\u00e1nto es 54 x 18?\",\"answers\":[{\"value\":972,\"is_correct\":true},{\"value\":980,\"is_correct\":false},{\"value\":960,\"is_correct\":false},{\"value\":950,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(263, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 x 8?\",\"answers\":[{\"value\":66,\"is_correct\":false},{\"value\":64,\"is_correct\":true},{\"value\":60,\"is_correct\":false},{\"value\":16,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(264, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 x 11?\",\"answers\":[{\"value\":150,\"is_correct\":false},{\"value\":160,\"is_correct\":false},{\"value\":154,\"is_correct\":true},{\"value\":140,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(265, '{\"question\":\"\\u00bfCu\\u00e1nto es 72 x 25?\",\"answers\":[{\"value\":1700,\"is_correct\":false},{\"value\":1900,\"is_correct\":false},{\"value\":1850,\"is_correct\":false},{\"value\":1800,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(266, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 x 7?\",\"answers\":[{\"value\":28,\"is_correct\":true},{\"value\":30,\"is_correct\":false},{\"value\":27,\"is_correct\":false},{\"value\":32,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(267, '{\"question\":\"\\u00bfCu\\u00e1nto es 16 x 5?\",\"answers\":[{\"value\":80,\"is_correct\":false},{\"value\":92,\"is_correct\":true},{\"value\":75,\"is_correct\":false},{\"value\":85,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(268, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 x 18?\",\"answers\":[{\"value\":800,\"is_correct\":false},{\"value\":820,\"is_correct\":false},{\"value\":810,\"is_correct\":true},{\"value\":850,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(269, '{\"question\":\"\\u00bfCu\\u00e1nto es 10 x 5?\",\"answers\":[{\"value\":55,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":45,\"is_correct\":false},{\"value\":50,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(270, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 x 14?\",\"answers\":[{\"value\":252,\"is_correct\":true},{\"value\":250,\"is_correct\":false},{\"value\":260,\"is_correct\":false},{\"value\":240,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(271, '{\"question\":\"\\u00bfCu\\u00e1nto es 56 x 23?\",\"answers\":[{\"value\":1300,\"is_correct\":false},{\"value\":1288,\"is_correct\":true},{\"value\":1260,\"is_correct\":false},{\"value\":1200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(272, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 x 6?\",\"answers\":[{\"value\":52,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":54,\"is_correct\":true},{\"value\":56,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(273, '{\"question\":\"\\u00bfCu\\u00e1nto es 23 x 11?\",\"answers\":[{\"value\":240,\"is_correct\":false},{\"value\":270,\"is_correct\":false},{\"value\":250,\"is_correct\":false},{\"value\":253,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(274, '{\"question\":\"\\u00bfCu\\u00e1nto es 72 x 29?\",\"answers\":[{\"value\":2088,\"is_correct\":true},{\"value\":2000,\"is_correct\":false},{\"value\":2100,\"is_correct\":false},{\"value\":2200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(275, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 x 10?\",\"answers\":[{\"value\":28,\"is_correct\":false},{\"value\":30,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(276, '{\"question\":\"\\u00bfCu\\u00e1nto es 25 x 15?\",\"answers\":[{\"value\":350,\"is_correct\":false},{\"value\":400,\"is_correct\":false},{\"value\":375,\"is_correct\":true},{\"value\":380,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(277, '{\"question\":\"\\u00bfCu\\u00e1nto es 63 x 24?\",\"answers\":[{\"value\":1500,\"is_correct\":false},{\"value\":1600,\"is_correct\":false},{\"value\":1400,\"is_correct\":false},{\"value\":1512,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(278, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 x 4?\",\"answers\":[{\"value\":16,\"is_correct\":true},{\"value\":12,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(279, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 x 17?\",\"answers\":[{\"value\":220,\"is_correct\":false},{\"value\":238,\"is_correct\":true},{\"value\":240,\"is_correct\":false},{\"value\":230,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(280, '{\"question\":\"\\u00bfCu\\u00e1nto es 32 x 19?\",\"answers\":[{\"value\":620,\"is_correct\":false},{\"value\":600,\"is_correct\":false},{\"value\":608,\"is_correct\":true},{\"value\":610,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(281, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 x 12?\",\"answers\":[{\"value\":58,\"is_correct\":false},{\"value\":65,\"is_correct\":false},{\"value\":55,\"is_correct\":false},{\"value\":60,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(282, '{\"question\":\"\\u00bfCu\\u00e1nto es 21 x 13?\",\"answers\":[{\"value\":273,\"is_correct\":true},{\"value\":260,\"is_correct\":false},{\"value\":280,\"is_correct\":false},{\"value\":290,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(283, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 x 22?\",\"answers\":[{\"value\":1000,\"is_correct\":false},{\"value\":990,\"is_correct\":true},{\"value\":980,\"is_correct\":false},{\"value\":960,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(284, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 x 9?\",\"answers\":[{\"value\":60,\"is_correct\":false},{\"value\":64,\"is_correct\":false},{\"value\":63,\"is_correct\":true},{\"value\":55,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(285, '{\"question\":\"\\u00bfCu\\u00e1nto es 25 x 18?\",\"answers\":[{\"value\":440,\"is_correct\":false},{\"value\":460,\"is_correct\":false},{\"value\":430,\"is_correct\":false},{\"value\":450,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(286, '{\"question\":\"\\u00bfCu\\u00e1nto es 56 x 24?\",\"answers\":[{\"value\":1344,\"is_correct\":true},{\"value\":1300,\"is_correct\":false},{\"value\":1400,\"is_correct\":false},{\"value\":1200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(287, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 x 9?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":36,\"is_correct\":true},{\"value\":38,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(288, '{\"question\":\"\\u00bfCu\\u00e1nto es 17 x 15?\",\"answers\":[{\"value\":250,\"is_correct\":false},{\"value\":240,\"is_correct\":false},{\"value\":255,\"is_correct\":true},{\"value\":270,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(289, '{\"question\":\"\\u00bfCu\\u00e1nto es 63 x 27?\",\"answers\":[{\"value\":1600,\"is_correct\":false},{\"value\":1800,\"is_correct\":false},{\"value\":1750,\"is_correct\":false},{\"value\":1701,\"is_correct\":true}]}', 'difícil', 'multiplicacion'),
(290, '{\"question\":\"\\u00bfCu\\u00e1nto es 3 x 8?\",\"answers\":[{\"value\":24,\"is_correct\":true},{\"value\":22,\"is_correct\":false},{\"value\":26,\"is_correct\":false},{\"value\":20,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(291, '{\"question\":\"\\u00bfCu\\u00e1nto es 16 x 14?\",\"answers\":[{\"value\":210,\"is_correct\":false},{\"value\":224,\"is_correct\":true},{\"value\":230,\"is_correct\":false},{\"value\":240,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(292, '{\"question\":\"\\u00bfCu\\u00e1nto es 45 x 30?\",\"answers\":[{\"value\":1300,\"is_correct\":false},{\"value\":1400,\"is_correct\":false},{\"value\":1350,\"is_correct\":true},{\"value\":1200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(293, '{\"question\":\"\\u00bfCu\\u00e1nto es 7 x 7?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":45,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":49,\"is_correct\":true}]}', 'fácil', 'multiplicacion'),
(294, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 x 19?\",\"answers\":[{\"value\":342,\"is_correct\":true},{\"value\":330,\"is_correct\":false},{\"value\":350,\"is_correct\":false},{\"value\":340,\"is_correct\":false}]}', 'intermedio', 'multiplicacion'),
(295, '{\"question\":\"\\u00bfCu\\u00e1nto es 32 x 17?\",\"answers\":[{\"value\":530,\"is_correct\":false},{\"value\":544,\"is_correct\":true},{\"value\":550,\"is_correct\":false},{\"value\":500,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(296, '{\"question\":\"\\u00bfCu\\u00e1nto es 5 x 15?\",\"answers\":[{\"value\":70,\"is_correct\":false},{\"value\":80,\"is_correct\":false},{\"value\":75,\"is_correct\":true},{\"value\":60,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(297, '{\"question\":\"\\u00bfCu\\u00e1nto es 22 x 14?\",\"answers\":[{\"value\":300,\"is_correct\":false},{\"value\":320,\"is_correct\":false},{\"value\":310,\"is_correct\":false},{\"value\":308,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(298, '{\"question\":\"\\u00bfCu\\u00e1nto es 60 x 22?\",\"answers\":[{\"value\":1300,\"is_correct\":false},{\"value\":1320,\"is_correct\":true},{\"value\":1400,\"is_correct\":false},{\"value\":1200,\"is_correct\":false}]}', 'difícil', 'multiplicacion'),
(299, '{\"question\":\"\\u00bfCu\\u00e1nto es 4 x 11?\",\"answers\":[{\"value\":40,\"is_correct\":false},{\"value\":45,\"is_correct\":false},{\"value\":44,\"is_correct\":true},{\"value\":42,\"is_correct\":false}]}', 'fácil', 'multiplicacion'),
(300, '{\"question\":\"\\u00bfCu\\u00e1nto es 27 x 15?\",\"answers\":[{\"value\":400,\"is_correct\":false},{\"value\":420,\"is_correct\":false},{\"value\":430,\"is_correct\":false},{\"value\":405,\"is_correct\":true}]}', 'intermedio', 'multiplicacion'),
(301, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 \\/ 2?\",\"answers\":[{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'facil', 'division'),
(302, '{\"question\":\"\\u00bfCu\\u00e1nto es 72 \\/ 8?\",\"answers\":[{\"value\":9,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":8,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'intermedio', 'division'),
(303, '{\"question\":\"\\u00bfCu\\u00e1nto es 540 \\/ 15?\",\"answers\":[{\"value\":34,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":38,\"is_correct\":false},{\"value\":36,\"is_correct\":true}]}', 'dificil', 'division'),
(304, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 \\/ 4?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'facil', 'division'),
(305, '{\"question\":\"\\u00bfCu\\u00e1nto es 96 \\/ 8?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":11,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":9,\"is_correct\":false}]}', 'intermedio', 'division'),
(306, '{\"question\":\"\\u00bfCu\\u00e1nto es 720 \\/ 18?\",\"answers\":[{\"value\":39,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":45,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'dificil', 'division'),
(307, '{\"question\":\"\\u00bfCu\\u00e1nto es 9 \\/ 3?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":true}]}', 'facil', 'division'),
(308, '{\"question\":\"\\u00bfCu\\u00e1nto es 144 \\/ 12?\",\"answers\":[{\"value\":14,\"is_correct\":false},{\"value\":12,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'intermedio', 'division'),
(309, '{\"question\":\"\\u00bfCu\\u00e1nto es 990 \\/ 33?\",\"answers\":[{\"value\":25,\"is_correct\":false},{\"value\":30,\"is_correct\":true},{\"value\":27,\"is_correct\":false},{\"value\":20,\"is_correct\":false}]}', 'dificil', 'division'),
(310, '{\"question\":\"\\u00bfCu\\u00e1nto es 10 \\/ 5?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'facil', 'division'),
(311, '{\"question\":\"\\u00bfCu\\u00e1nto es 84 \\/ 7?\",\"answers\":[{\"value\":11,\"is_correct\":false},{\"value\":12,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":14,\"is_correct\":false}]}', 'intermedio', 'division'),
(312, '{\"question\":\"\\u00bfCu\\u00e1nto es 1080 \\/ 36?\",\"answers\":[{\"value\":25,\"is_correct\":false},{\"value\":30,\"is_correct\":true},{\"value\":28,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'dificil', 'division'),
(313, '{\"question\":\"\\u00bfCu\\u00e1nto es 15 \\/ 3?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'facil', 'division'),
(314, '{\"question\":\"\\u00bfCu\\u00e1nto es 192 \\/ 16?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":14,\"is_correct\":false}]}', 'intermedio', 'division'),
(315, '{\"question\":\"\\u00bfCu\\u00e1nto es 1200 \\/ 24?\",\"answers\":[{\"value\":50,\"is_correct\":true},{\"value\":52,\"is_correct\":false},{\"value\":48,\"is_correct\":false},{\"value\":45,\"is_correct\":false}]}', 'dificil', 'division'),
(316, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 \\/ 7?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":2,\"is_correct\":true}]}', 'facil', 'division'),
(317, '{\"question\":\"\\u00bfCu\\u00e1nto es 120 \\/ 6?\",\"answers\":[{\"value\":18,\"is_correct\":false},{\"value\":21,\"is_correct\":false},{\"value\":19,\"is_correct\":false},{\"value\":20,\"is_correct\":true}]}', 'intermedio', 'division'),
(318, '{\"question\":\"\\u00bfCu\\u00e1nto es 1800 \\/ 45?\",\"answers\":[{\"value\":45,\"is_correct\":false},{\"value\":50,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":42,\"is_correct\":false}]}', 'dificil', 'division'),
(319, '{\"question\":\"\\u00bfCu\\u00e1nto es 12 \\/ 6?\",\"answers\":[{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'facil', 'division'),
(320, '{\"question\":\"\\u00bfCu\\u00e1nto es 200 \\/ 10?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":15,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":10,\"is_correct\":false}]}', 'intermedio', 'division'),
(321, '{\"question\":\"\\u00bfCu\\u00e1nto es 20 \\/ 5?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'facil', 'division'),
(322, '{\"question\":\"\\u00bfCu\\u00e1nto es 180 \\/ 15?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":14,\"is_correct\":false},{\"value\":13,\"is_correct\":false},{\"value\":11,\"is_correct\":false}]}', 'intermedio', 'division'),
(323, '{\"question\":\"\\u00bfCu\\u00e1nto es 2500 \\/ 25?\",\"answers\":[{\"value\":95,\"is_correct\":false},{\"value\":100,\"is_correct\":true},{\"value\":105,\"is_correct\":false},{\"value\":110,\"is_correct\":false}]}', 'dificil', 'division'),
(324, '{\"question\":\"\\u00bfCu\\u00e1nto es 6 \\/ 3?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false}]}', 'facil', 'division'),
(325, '{\"question\":\"\\u00bfCu\\u00e1nto es 432 \\/ 24?\",\"answers\":[{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":18,\"is_correct\":true},{\"value\":17,\"is_correct\":false}]}', 'intermedio', 'division'),
(326, '{\"question\":\"\\u00bfCu\\u00e1nto es 810 \\/ 27?\",\"answers\":[{\"value\":32,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":30,\"is_correct\":true}]}', 'dificil', 'division'),
(327, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 \\/ 2?\",\"answers\":[{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":true},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(328, '{\"question\":\"\\u00bfCu\\u00e1nto es 288 \\/ 16?\",\"answers\":[{\"value\":20,\"is_correct\":false},{\"value\":16,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":18,\"is_correct\":true}]}', 'intermedio', 'division'),
(329, '{\"question\":\"\\u00bfCu\\u00e1nto es 1440 \\/ 48?\",\"answers\":[{\"value\":30,\"is_correct\":true},{\"value\":28,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":33,\"is_correct\":false}]}', 'dificil', 'division'),
(330, '{\"question\":\"\\u00bfCu\\u00e1nto es 10 \\/ 2?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(331, '{\"question\":\"\\u00bfCu\\u00e1nto es 16 \\/ 4?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(332, '{\"question\":\"\\u00bfCu\\u00e1nto es 225 \\/ 15?\",\"answers\":[{\"value\":14,\"is_correct\":false},{\"value\":17,\"is_correct\":false},{\"value\":16,\"is_correct\":false},{\"value\":15,\"is_correct\":true}]}', 'intermedio', 'division'),
(333, '{\"question\":\"\\u00bfCu\\u00e1nto es 1980 \\/ 33?\",\"answers\":[{\"value\":60,\"is_correct\":true},{\"value\":55,\"is_correct\":false},{\"value\":62,\"is_correct\":false},{\"value\":65,\"is_correct\":false}]}', 'dificil', 'division'),
(334, '{\"question\":\"\\u00bfCu\\u00e1nto es 18 \\/ 3?\",\"answers\":[{\"value\":6,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'facil', 'division'),
(335, '{\"question\":\"\\u00bfCu\\u00e1nto es 288 \\/ 24?\",\"answers\":[{\"value\":10,\"is_correct\":false},{\"value\":12,\"is_correct\":true},{\"value\":13,\"is_correct\":false},{\"value\":15,\"is_correct\":false}]}', 'intermedio', 'division'),
(336, '{\"question\":\"\\u00bfCu\\u00e1nto es 3600 \\/ 90?\",\"answers\":[{\"value\":40,\"is_correct\":true},{\"value\":45,\"is_correct\":false},{\"value\":35,\"is_correct\":false},{\"value\":50,\"is_correct\":false}]}', 'dificil', 'division'),
(337, '{\"question\":\"\\u00bfCu\\u00e1nto es 12 \\/ 4?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":3,\"is_correct\":true},{\"value\":2,\"is_correct\":false}]}', 'facil', 'division'),
(338, '{\"question\":\"\\u00bfCu\\u00e1nto es 640 \\/ 32?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":25,\"is_correct\":false}]}', 'intermedio', 'division'),
(339, '{\"question\":\"\\u00bfCu\\u00e1nto es 5760 \\/ 144?\",\"answers\":[{\"value\":42,\"is_correct\":false},{\"value\":40,\"is_correct\":false},{\"value\":50,\"is_correct\":true},{\"value\":38,\"is_correct\":false}]}', 'dificil', 'division'),
(340, '{\"question\":\"\\u00bfCu\\u00e1nto es 10 \\/ 5?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":2,\"is_correct\":true}]}', 'facil', 'division'),
(341, '{\"question\":\"\\u00bfCu\\u00e1nto es 14 \\/ 7?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'facil', 'division'),
(342, '{\"question\":\"\\u00bfCu\\u00e1nto es 576 \\/ 24?\",\"answers\":[{\"value\":22,\"is_correct\":false},{\"value\":26,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":24,\"is_correct\":true}]}', 'intermedio', 'division'),
(343, '{\"question\":\"\\u00bfCu\\u00e1nto es 9900 \\/ 33?\",\"answers\":[{\"value\":330,\"is_correct\":false},{\"value\":300,\"is_correct\":true},{\"value\":250,\"is_correct\":false},{\"value\":280,\"is_correct\":false}]}', 'dificil', 'division'),
(344, '{\"question\":\"\\u00bfCu\\u00e1nto es 15 \\/ 3?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'facil', 'division'),
(345, '{\"question\":\"\\u00bfCu\\u00e1nto es 165 \\/ 5?\",\"answers\":[{\"value\":30,\"is_correct\":false},{\"value\":33,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'division'),
(346, '{\"question\":\"\\u00bfCu\\u00e1nto es 5184 \\/ 72?\",\"answers\":[{\"value\":72,\"is_correct\":true},{\"value\":70,\"is_correct\":false},{\"value\":75,\"is_correct\":false},{\"value\":80,\"is_correct\":false}]}', 'dificil', 'division'),
(347, '{\"question\":\"\\u00bfCu\\u00e1nto es 12 \\/ 3?\",\"answers\":[{\"value\":1,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":3,\"is_correct\":false},{\"value\":4,\"is_correct\":true}]}', 'facil', 'division'),
(348, '{\"question\":\"\\u00bfCu\\u00e1nto es 312 \\/ 26?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":14,\"is_correct\":false},{\"value\":13,\"is_correct\":false},{\"value\":15,\"is_correct\":false}]}', 'intermedio', 'division'),
(349, '{\"question\":\"\\u00bfCu\\u00e1nto es 8250 \\/ 75?\",\"answers\":[{\"value\":120,\"is_correct\":false},{\"value\":110,\"is_correct\":true},{\"value\":100,\"is_correct\":false},{\"value\":105,\"is_correct\":false}]}', 'dificil', 'division'),
(350, '{\"question\":\"\\u00bfCu\\u00e1nto es 8 \\/ 2?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":4,\"is_correct\":true},{\"value\":2,\"is_correct\":false}]}', 'facil', 'division'),
(351, '{\"question\":\"\\u00bfCu\\u00e1nto es 16 \\/ 4?\",\"answers\":[{\"value\":3,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":4,\"is_correct\":true},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(352, '{\"question\":\"\\u00bfCu\\u00e1nto es 125 \\/ 25?\",\"answers\":[{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'intermedio', 'division'),
(353, '{\"question\":\"\\u00bfCu\\u00e1nto es 504 \\/ 42?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":13,\"is_correct\":false}]}', 'dificil', 'division'),
(354, '{\"question\":\"\\u00bfCu\\u00e1nto es 32 \\/ 8?\",\"answers\":[{\"value\":4,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":2,\"is_correct\":false},{\"value\":5,\"is_correct\":false}]}', 'facil', 'division'),
(355, '{\"question\":\"\\u00bfCu\\u00e1nto es 672 \\/ 28?\",\"answers\":[{\"value\":22,\"is_correct\":false},{\"value\":24,\"is_correct\":true},{\"value\":26,\"is_correct\":false},{\"value\":25,\"is_correct\":false}]}', 'intermedio', 'division'),
(356, '{\"question\":\"\\u00bfCu\\u00e1nto es 2100 \\/ 30?\",\"answers\":[{\"value\":60,\"is_correct\":false},{\"value\":70,\"is_correct\":true},{\"value\":72,\"is_correct\":false},{\"value\":75,\"is_correct\":false}]}', 'dificil', 'division'),
(357, '{\"question\":\"\\u00bfCu\\u00e1nto es 150 \\/ 25?\",\"answers\":[{\"value\":5,\"is_correct\":false},{\"value\":6,\"is_correct\":true},{\"value\":4,\"is_correct\":false},{\"value\":3,\"is_correct\":false}]}', 'facil', 'division'),
(358, '{\"question\":\"\\u00bfCu\\u00e1nto es 792 \\/ 24?\",\"answers\":[{\"value\":33,\"is_correct\":true},{\"value\":34,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":31,\"is_correct\":false}]}', 'intermedio', 'division'),
(359, '{\"question\":\"\\u00bfCu\\u00e1nto es 9600 \\/ 240?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":40,\"is_correct\":true},{\"value\":45,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'dificil', 'division'),
(360, '{\"question\":\"\\u00bfCu\\u00e1nto es 48 \\/ 6?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(361, '{\"question\":\"\\u00bfCu\\u00e1nto es 198 \\/ 33?\",\"answers\":[{\"value\":6,\"is_correct\":true},{\"value\":7,\"is_correct\":false},{\"value\":5,\"is_correct\":false},{\"value\":8,\"is_correct\":false}]}', 'intermedio', 'division'),
(362, '{\"question\":\"\\u00bfCu\\u00e1nto es 3240 \\/ 36?\",\"answers\":[{\"value\":90,\"is_correct\":true},{\"value\":80,\"is_correct\":false},{\"value\":85,\"is_correct\":false},{\"value\":92,\"is_correct\":false}]}', 'dificil', 'division'),
(363, '{\"question\":\"\\u00bfCu\\u00e1nto es 36 \\/ 9?\",\"answers\":[{\"value\":5,\"is_correct\":false},{\"value\":4,\"is_correct\":true},{\"value\":3,\"is_correct\":false},{\"value\":6,\"is_correct\":false}]}', 'facil', 'division'),
(364, '{\"question\":\"\\u00bfCu\\u00e1nto es 96 \\/ 12?\",\"answers\":[{\"value\":8,\"is_correct\":true},{\"value\":12,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":7,\"is_correct\":false}]}', 'facil', 'division'),
(365, '{\"question\":\"\\u00bfCu\\u00e1nto es 360 \\/ 18?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":22,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":25,\"is_correct\":false}]}', 'intermedio', 'division'),
(366, '{\"question\":\"\\u00bfCu\\u00e1nto es 1024 \\/ 32?\",\"answers\":[{\"value\":31,\"is_correct\":false},{\"value\":33,\"is_correct\":false},{\"value\":32,\"is_correct\":true},{\"value\":30,\"is_correct\":false}]}', 'dificil', 'division'),
(367, '{\"question\":\"\\u00bfCu\\u00e1nto es 90 \\/ 9?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":10,\"is_correct\":true},{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false}]}', 'facil', 'division'),
(368, '{\"question\":\"\\u00bfCu\\u00e1nto es 625 \\/ 25?\",\"answers\":[{\"value\":25,\"is_correct\":true},{\"value\":20,\"is_correct\":false},{\"value\":30,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'intermedio', 'division'),
(369, '{\"question\":\"\\u00bfCu\\u00e1nto es 144 \\/ 18?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":9,\"is_correct\":false},{\"value\":6,\"is_correct\":false},{\"value\":8,\"is_correct\":true}]}', 'facil', 'division'),
(370, '{\"question\":\"\\u00bfCu\\u00e1nto es 900 \\/ 30?\",\"answers\":[{\"value\":32,\"is_correct\":false},{\"value\":30,\"is_correct\":true},{\"value\":28,\"is_correct\":false},{\"value\":35,\"is_correct\":false}]}', 'intermedio', 'division'),
(371, '{\"question\":\"\\u00bfCu\\u00e1nto es 256 \\/ 16?\",\"answers\":[{\"value\":15,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":16,\"is_correct\":true},{\"value\":18,\"is_correct\":false}]}', 'intermedio', 'division'),
(372, '{\"question\":\"\\u00bfCu\\u00e1nto es 750 \\/ 25?\",\"answers\":[{\"value\":35,\"is_correct\":false},{\"value\":28,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":30,\"is_correct\":true}]}', 'intermedio', 'division'),
(373, '{\"question\":\"\\u00bfCu\\u00e1nto es 480 \\/ 40?\",\"answers\":[{\"value\":12,\"is_correct\":true},{\"value\":11,\"is_correct\":false},{\"value\":10,\"is_correct\":false},{\"value\":13,\"is_correct\":false}]}', 'intermedio', 'division'),
(374, '{\"question\":\"\\u00bfCu\\u00e1nto es 1024 \\/ 16?\",\"answers\":[{\"value\":60,\"is_correct\":false},{\"value\":64,\"is_correct\":true},{\"value\":55,\"is_correct\":false},{\"value\":70,\"is_correct\":false}]}', 'dificil', 'division'),
(375, '{\"question\":\"\\u00bfCu\\u00e1nto es 400 \\/ 20?\",\"answers\":[{\"value\":15,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":30,\"is_correct\":false}]}', 'facil', 'division'),
(376, '{\"question\":\"\\u00bfCu\\u00e1nto es 540 \\/ 18?\",\"answers\":[{\"value\":28,\"is_correct\":false},{\"value\":32,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":30,\"is_correct\":true}]}', 'intermedio', 'division'),
(377, '{\"question\":\"\\u00bfCu\\u00e1nto es 999 \\/ 3?\",\"answers\":[{\"value\":333,\"is_correct\":true},{\"value\":332,\"is_correct\":false},{\"value\":334,\"is_correct\":false},{\"value\":325,\"is_correct\":false}]}', 'dificil', 'division'),
(378, '{\"question\":\"\\u00bfCu\\u00e1nto es 121 \\/ 11?\",\"answers\":[{\"value\":12,\"is_correct\":false},{\"value\":11,\"is_correct\":true},{\"value\":10,\"is_correct\":false},{\"value\":13,\"is_correct\":false}]}', 'facil', 'division'),
(379, '{\"question\":\"\\u00bfCu\\u00e1nto es 625 \\/ 125?\",\"answers\":[{\"value\":6,\"is_correct\":false},{\"value\":4,\"is_correct\":false},{\"value\":5,\"is_correct\":true},{\"value\":7,\"is_correct\":false}]}', 'intermedio', 'division'),
(380, '{\"question\":\"\\u00bfCu\\u00e1nto es 1000 \\/ 25?\",\"answers\":[{\"value\":45,\"is_correct\":false},{\"value\":30,\"is_correct\":false},{\"value\":35,\"is_correct\":false},{\"value\":40,\"is_correct\":true}]}', 'intermedio', 'division'),
(381, '{\"question\":\"\\u00bfCu\\u00e1nto es 256 \\/ 8?\",\"answers\":[{\"value\":32,\"is_correct\":true},{\"value\":31,\"is_correct\":false},{\"value\":34,\"is_correct\":false},{\"value\":30,\"is_correct\":false}]}', 'intermedio', 'division'),
(382, '{\"question\":\"\\u00bfCu\\u00e1nto es 512 \\/ 64?\",\"answers\":[{\"value\":7,\"is_correct\":false},{\"value\":8,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":9,\"is_correct\":false}]}', 'intermedio', 'division'),
(383, '{\"question\":\"\\u00bfCu\\u00e1nto es 800 \\/ 25?\",\"answers\":[{\"value\":33,\"is_correct\":false},{\"value\":31,\"is_correct\":false},{\"value\":32,\"is_correct\":true},{\"value\":30,\"is_correct\":false}]}', 'intermedio', 'division'),
(384, '{\"question\":\"\\u00bfCu\\u00e1nto es 640 \\/ 40?\",\"answers\":[{\"value\":15,\"is_correct\":false},{\"value\":14,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":16,\"is_correct\":true}]}', 'intermedio', 'division'),
(385, '{\"question\":\"\\u00bfCu\\u00e1nto es 288 \\/ 12?\",\"answers\":[{\"value\":24,\"is_correct\":true},{\"value\":25,\"is_correct\":false},{\"value\":26,\"is_correct\":false},{\"value\":23,\"is_correct\":false}]}', 'intermedio', 'division'),
(386, '{\"question\":\"\\u00bfCu\\u00e1nto es 144 \\/ 9?\",\"answers\":[{\"value\":15,\"is_correct\":false},{\"value\":16,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":14,\"is_correct\":false}]}', 'facil', 'division'),
(387, '{\"question\":\"\\u00bfCu\\u00e1nto es 777 \\/ 7?\",\"answers\":[{\"value\":112,\"is_correct\":false},{\"value\":110,\"is_correct\":false},{\"value\":111,\"is_correct\":true},{\"value\":108,\"is_correct\":false}]}', 'dificil', 'division'),
(388, '{\"question\":\"\\u00bfCu\\u00e1nto es 1000 \\/ 50?\",\"answers\":[{\"value\":22,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":19,\"is_correct\":false},{\"value\":20,\"is_correct\":true}]}', 'facil', 'division'),
(389, '{\"question\":\"\\u00bfCu\\u00e1nto es 560 \\/ 28?\",\"answers\":[{\"value\":20,\"is_correct\":true},{\"value\":22,\"is_correct\":false},{\"value\":25,\"is_correct\":false},{\"value\":23,\"is_correct\":false}]}', 'intermedio', 'division'),
(390, '{\"question\":\"\\u00bfCu\\u00e1nto es 864 \\/ 32?\",\"answers\":[{\"value\":28,\"is_correct\":false},{\"value\":27,\"is_correct\":true},{\"value\":30,\"is_correct\":false},{\"value\":25,\"is_correct\":false}]}', 'dificil', 'division'),
(391, '{\"question\":\"\\u00bfCu\\u00e1nto es 50 \\/ 5?\",\"answers\":[{\"value\":9,\"is_correct\":false},{\"value\":11,\"is_correct\":false},{\"value\":10,\"is_correct\":true},{\"value\":8,\"is_correct\":false}]}', 'facil', 'division'),
(392, '{\"question\":\"\\u00bfCu\\u00e1nto es 240 \\/ 12?\",\"answers\":[{\"value\":18,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":15,\"is_correct\":false},{\"value\":20,\"is_correct\":true}]}', 'intermedio', 'division'),
(393, '{\"question\":\"\\u00bfCu\\u00e1nto es 625 \\/ 125?\",\"answers\":[{\"value\":5,\"is_correct\":true},{\"value\":6,\"is_correct\":false},{\"value\":7,\"is_correct\":false},{\"value\":4,\"is_correct\":false}]}', 'intermedio', 'division'),
(394, '{\"question\":\"\\u00bfCu\\u00e1nto es 640 \\/ 32?\",\"answers\":[{\"value\":21,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":18,\"is_correct\":false},{\"value\":22,\"is_correct\":false}]}', 'intermedio', 'division'),
(395, '{\"question\":\"\\u00bfCu\\u00e1nto es 900 \\/ 45?\",\"answers\":[{\"value\":21,\"is_correct\":false},{\"value\":18,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":22,\"is_correct\":false}]}', 'intermedio', 'division'),
(396, '{\"question\":\"\\u00bfCu\\u00e1nto es 840 \\/ 42?\",\"answers\":[{\"value\":19,\"is_correct\":false},{\"value\":21,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":20,\"is_correct\":true}]}', 'intermedio', 'division'),
(397, '{\"question\":\"\\u00bfCu\\u00e1nto es 950 \\/ 25?\",\"answers\":[{\"value\":38,\"is_correct\":true},{\"value\":35,\"is_correct\":false},{\"value\":36,\"is_correct\":false},{\"value\":40,\"is_correct\":false}]}', 'intermedio', 'division'),
(398, '{\"question\":\"\\u00bfCu\\u00e1nto es 512 \\/ 8?\",\"answers\":[{\"value\":62,\"is_correct\":false},{\"value\":64,\"is_correct\":true},{\"value\":60,\"is_correct\":false},{\"value\":58,\"is_correct\":false}]}', 'intermedio', 'division'),
(399, '{\"question\":\"\\u00bfCu\\u00e1nto es 400 \\/ 20?\",\"answers\":[{\"value\":25,\"is_correct\":false},{\"value\":22,\"is_correct\":false},{\"value\":20,\"is_correct\":true},{\"value\":18,\"is_correct\":false}]}', 'facil', 'division'),
(400, '{\"question\":\"\\u00bfCu\\u00e1nto es 123,456 \\/ 1?\",\"answers\":[{\"value\":123.456,\"is_correct\":true},{\"value\":\"error\",\"is_correct\":false},{\"value\":124.567,\"is_correct\":false},{\"value\":\"\\u03c0\",\"is_correct\":false}]}', 'facil', 'division');

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
(1, 'user', 'user@gmail.com', NULL, '$2y$12$vkWu1hw10VT0T4gMjL2sxu/54wk0V5vSc7auq3QJJvWiod75p4Pnm', 'user', 1, NULL, '2024-12-11 21:54:50', '2024-12-11 21:54:50'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$12$s02NlTkCvHvLPVUiTansZecpn3WfycEiPQbZKXv7LzGGVMIoQtZvy', 'Admin', 1, NULL, '2024-12-11 21:54:50', '2024-12-11 21:54:50');

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
