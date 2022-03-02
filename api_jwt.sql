-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.4.11-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para api_jwt
CREATE DATABASE IF NOT EXISTS `api_jwt` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `api_jwt`;

-- Copiando estrutura para tabela api_jwt.departamentos
CREATE TABLE IF NOT EXISTS `departamentos` (
  `departamentos_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loja_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`departamentos_id`),
  KEY `departamentos_loja_id_foreign` (`loja_id`),
  CONSTRAINT `departamentos_loja_id_foreign` FOREIGN KEY (`loja_id`) REFERENCES `loja` (`loja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela api_jwt.departamentos: ~6 rows (aproximadamente)
DELETE FROM `departamentos`;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` (`departamentos_id`, `nome`, `loja_id`, `created_at`, `updated_at`) VALUES
	(1, 'Cama e Mesa', 2, '2022-03-01 17:26:50', '2022-03-01 17:26:51'),
	(3, 'Informática', 2, '2022-03-01 17:27:24', '2022-03-01 17:27:24'),
	(4, 'Roupas e Acessórios', 2, '2022-03-01 23:09:10', '2022-03-01 23:09:10'),
	(5, 'Cozinha e jantar', 2, '2022-03-02 16:25:43', '2022-03-02 16:36:32'),
	(7, 'teste', 4, '2022-03-02 13:57:38', '2022-03-02 13:57:39'),
	(9, 'Depto teste', 4, '2022-03-02 13:58:07', '2022-03-02 13:58:08');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela api_jwt.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela api_jwt.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Copiando estrutura para tabela api_jwt.loja
CREATE TABLE IF NOT EXISTS `loja` (
  `loja_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double(8,2) DEFAULT NULL,
  `long` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`loja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela api_jwt.loja: ~4 rows (aproximadamente)
DELETE FROM `loja`;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
INSERT INTO `loja` (`loja_id`, `nome`, `lat`, `long`) VALUES
	(2, 'LojaUpdated', NULL, NULL),
	(3, 'teste', NULL, NULL),
	(4, 'testando', NULL, NULL);
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;

-- Copiando estrutura para tabela api_jwt.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela api_jwt.migrations: ~6 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(8, '2022_03_01_1646096938_create_loja_table', 2),
	(15, '2022_03_01_1646097169_create_departamentos_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela api_jwt.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela api_jwt.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Copiando estrutura para tabela api_jwt.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela api_jwt.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela api_jwt.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `produto_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `preço` double(8,2) NOT NULL DEFAULT 0.00,
  `imagem` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `loja_id` bigint(20) unsigned NOT NULL,
  `departamento_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`produto_id`),
  KEY `departamento_id` (`departamento_id`),
  KEY `produto_loja_id_foreign` (`loja_id`),
  CONSTRAINT `departamento_id` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`departamentos_id`),
  CONSTRAINT `produto_loja_id_foreign` FOREIGN KEY (`loja_id`) REFERENCES `loja` (`loja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela api_jwt.produto: ~3 rows (aproximadamente)
DELETE FROM `produto`;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`produto_id`, `nome`, `preço`, `imagem`, `loja_id`, `departamento_id`, `created_at`, `updated_at`) VALUES
	(1, 'meia soquete', 9.00, '/imagens/meiasoquete.jpg', 2, 4, '2022-03-02 11:37:09', '2022-03-02 16:20:14'),
	(3, 'Calça masculina Skinny 40', 100.50, '/imagens/calça.jpg', 2, 4, '2022-03-02 15:46:05', '2022-03-02 15:46:05'),
	(4, 'Produto Dpt 9', 100.00, 'adasd', 4, 7, '2022-03-02 13:59:26', '2022-03-02 13:59:27');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela api_jwt.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela api_jwt.users: ~1 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Bruno Dsstudio', 'brunodsstudio@gmail.com', NULL, '$2y$10$vL0hUd3QQ05KZlJ30sqeguG.D4WPa02bklglUvhAS4931Tv74W6ty', NULL, '2022-03-01 14:12:08', '2022-03-01 14:12:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
