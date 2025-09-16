-- --------------------------------------------------------
-- Host:                         149.130.164.32
-- Versión del servidor:         8.0.43-0ubuntu0.22.04.1 - (Ubuntu)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para library_db
CREATE DATABASE IF NOT EXISTS `library_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library_db`;

-- Volcando estructura para tabla library_db.book
CREATE TABLE IF NOT EXISTS `book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `isbn` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `editorial_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `FK_book_editorial` (`editorial_id`),
  KEY `FK_book_category` (`category_id`),
  CONSTRAINT `FK_book_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_book_editorial` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla library_db.book: ~18 rows (aproximadamente)
INSERT INTO `book` (`id`, `isbn`, `title`, `author`, `editorial_id`, `category_id`) VALUES
	(1, '9780141439846', 'Pride and Prejudice', 'Jane Austen', 1, 4),
	(2, '9780743273565', 'To Kill a Mockingbird', 'Harper Lee', 2, 2),
	(3, '9780141182605', '1984', 'George Orwell', 2, 1),
	(4, '9780061120084', 'The Catcher in the Rye', 'J.D. Salinger', 3, 3),
	(5, '9780061120085', 'The Great Gatsby', 'F. Scott Fitzgerald', 4, 4),
	(6, '6666777788', 'Libro prueba', 'Univalle', 2, 1),
	(10, '6666777782', 'Libro pruebas', 'Univalle', 2, 1),
	(12, '123456', 'Bible', 'Yisus', 5, 2),
	(13, '51584', 'Libro Prueba', 'Prueba...', 2, 4),
	(14, '9999999', 'Libro prueba 9', 'Univalle buga', 2, 1),
	(15, '111111', 'el libro xd', 'Yom', 23, 4),
	(16, '9780434021512', 'La naranja mecánica', 'Anthony Burgess', 19, 1),
	(23, '978', 'La Naranja Mecanica', 'Anthony Burgess', 1, 1),
	(24, '1234244546565', 'Un mundo feliz', 'Aldous Huxley', 1, 1),
	(25, '12345556', 'Prueba', 'Juanes', 4, 3),
	(26, '666666', 'Libro diabolico buajaja', 'Satanas andres', 2, 3),
	(27, '777777', 'Dios te salvara', 'San Pablo', 3, 3),
	(28, '696969', 'Demonos amorcito', 'Cupido', 4, 4),
	(29, '666', 'Libro mod', 'Univalle', 2, 1),
	(31, '64945757', 'Caperucita', 'ejejjeej', 29, 1);

-- Volcando estructura para tabla library_db.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla library_db.category: ~5 rows (aproximadamente)
INSERT INTO `category` (`id`, `name`, `description`) VALUES
	(1, 'Ficción', 'Libros de ficción y literatura'),
	(2, 'No ficción', 'Libros de no ficción y ensayos'),
	(3, 'Fantasía', 'Libros de fantasía y ciencia ficción'),
	(4, 'Historia', 'Libros de historia y biografías'),
	(5, 'Arte y diseño', 'Libros sobre arte y diseño gráfico');

-- Volcando estructura para tabla library_db.editorial
CREATE TABLE IF NOT EXISTS `editorial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla library_db.editorial: ~23 rows (aproximadamente)
INSERT INTO `editorial` (`id`, `name`, `address`) VALUES
	(1, 'Editorial ABC', '123 Main Street'),
	(2, 'Librería XYZ', '456 Oak Avenue'),
	(3, 'Publicaciones 123', '789 Elm Street'),
	(4, 'Imprenta Rápida', '101 Maple Drive'),
	(5, 'Ediciones de la Montaña', '234 Pine Road'),
	(7, 'Editorial prueba', 'Calle 123'),
	(14, 'Editorial Androide', 'Calle 13'),
	(15, 'Editorial Androide', 'Calle 13'),
	(16, 'Editorial Androide', 'Calle 13'),
	(17, 'Editorial Androide', 'Calle 13'),
	(18, 'Editorial Androide', 'Calle 13'),
	(19, 'Editorial prueba', 'Calle 123'),
	(21, 'Editorial Androide', 'Calle 13'),
	(22, 'Editorial Androide', 'Calle 13'),
	(23, 'Editorial Androide', 'Calle 13'),
	(24, 'Editorial Androide', 'Calle 13'),
	(25, 'Editorial Androide', 'Calle 13'),
	(26, 'Editorial prueba mod', 'Calle 1'),
	(28, 'Editorial Sena', 'Calle 24'),
	(29, 'Editorial Sena 2', 'Calle 24'),
	(31, 'Editorial Sena 2', 'Calle 24'),
	(32, 'Editorial Sena 2', 'Calle 24'),
	(33, 'Editorial Sena 2', 'Calle 24');

-- Volcando estructura para tabla library_db.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla library_db.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla library_db.loan
CREATE TABLE IF NOT EXISTS `loan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  `loan_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id_book_id` (`member_id`,`book_id`),
  KEY `FK_loan_book` (`book_id`),
  CONSTRAINT `FK_loan_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_loan_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla library_db.loan: ~4 rows (aproximadamente)
INSERT INTO `loan` (`id`, `member_id`, `book_id`, `loan_date`, `return_date`) VALUES
	(1, 1, 2, '2024-05-15', '2024-05-16'),
	(2, 1, 3, '2024-05-15', '2024-05-16'),
	(3, 2, 4, '2024-05-14', '2024-05-20'),
	(4, 5, 1, '2024-05-15', NULL);

-- Volcando estructura para tabla library_db.member
CREATE TABLE IF NOT EXISTS `member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document` bigint NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document` (`document`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla library_db.member: ~5 rows (aproximadamente)
INSERT INTO `member` (`id`, `document`, `firstname`, `lastname`, `email`, `phone`) VALUES
	(1, 123456789, 'Juan', 'Pérez', 'juan@example.com', '1234567890'),
	(2, 987654321, 'María', 'Gómez', 'maria@example.com', '9876543210'),
	(3, 456789123, 'Carlos', 'Martínez', 'carlos@example.com', '4567891230'),
	(4, 789123456, 'Laura', 'Rodríguez', 'laura@example.com', '7891234560'),
	(5, 321654987, 'Ana', 'López', 'ana@example.com', '3216549870');

-- Volcando estructura para tabla library_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla library_db.migrations: ~4 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Volcando estructura para tabla library_db.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla library_db.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla library_db.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla library_db.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla library_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla library_db.users: ~10 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Mrs. Kariane Legros', 'ivah.goodwin@example.org', '2024-05-14 07:47:58', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'cnjXlBKUyy', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(2, 'Sammy Will', 'alexane.kautzer@example.org', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'Uf60qnz8sp', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(3, 'Veda Zieme', 'khaley@example.net', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'I7ZJEbREo1', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(4, 'Ezequiel Nikolaus', 'champlin.pauline@example.org', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'VnDdweKUeh', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(5, 'Fermin Raynor', 'kaylah66@example.com', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'KDMBiJMN1P', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(6, 'Emily Dietrich', 'ryan.keeley@example.org', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'dz9qR6Sla2', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(7, 'Mateo Weber', 'whoppe@example.org', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'G8Tg30LZbP', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(8, 'Kyla Baumbach', 'amanda61@example.com', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'KMOOLzdRpf', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(9, 'Rodrigo Towne', 'jermey.leannon@example.com', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', '4ELPKuDzTc', '2024-05-14 07:47:59', '2024-05-14 07:47:59'),
	(10, 'Ashlee Miller', 'polly02@example.com', '2024-05-14 07:47:59', '$2y$12$.YlFxEwNGG8yfQpUhsr9yO/5hjs5MZdGgZ5Q.hLr2BbrhEMwdGGr.', 'XNkHw5m2Vv', '2024-05-14 07:47:59', '2024-05-14 07:47:59');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
