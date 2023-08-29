-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-08-2023 a las 23:44:53
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peliculas`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `conteovotos`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `conteovotos`;
CREATE TABLE IF NOT EXISTS `conteovotos` (
`Pelicula` varchar(100)
,`Votos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
CREATE TABLE IF NOT EXISTS `pelicula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `publicacion` date DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `titulo`, `duracion`, `publicacion`, `pais`, `foto`) VALUES
(1, 'El Padrino', 145, '1972-03-24', 'Estados Unidos', 'padrino.jpg'),
(2, 'Pulp Fiction', 122, '1994-10-14', 'Estados Unidos', 'pulp.jpg'),
(3, 'El Señor de los Anillos: El Retorno del Rey', 150, '2003-12-17', 'Estados Unidos', 'anillos.jpg'),
(4, 'Inception', 90, '2010-07-16', 'Estados Unidos', 'inception.jpg'),
(5, 'La La Land', 130, '2016-12-19', 'Estados Unidos', 'land.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voto`
--

DROP TABLE IF EXISTS `voto`;
CREATE TABLE IF NOT EXISTS `voto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pelicula` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pelicula` (`fk_pelicula`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `voto`
--

INSERT INTO `voto` (`id`, `fk_pelicula`, `fecha`) VALUES
(100, 2, '2023-07-21 18:21:20'),
(101, 1, '2023-07-21 18:21:23'),
(102, 5, '2023-07-21 18:21:28'),
(103, 5, '2023-07-21 18:21:30'),
(104, 4, '2023-07-21 18:21:30'),
(105, 4, '2023-07-21 18:21:33'),
(106, 3, '2023-07-21 18:21:33'),
(107, 2, '2023-07-21 19:00:58'),
(108, 2, '2023-07-21 19:01:03'),
(109, 5, '2023-07-21 19:01:09'),
(110, 2, '2023-07-21 19:01:09'),
(111, 3, '2023-07-31 01:27:50'),
(112, 5, '2023-07-31 01:27:50'),
(113, 5, '2023-07-31 01:31:17'),
(114, 2, '2023-07-31 01:31:17'),
(115, 5, '2023-07-31 20:32:14'),
(116, 2, '2023-07-31 20:32:14');

-- --------------------------------------------------------

--
-- Estructura para la vista `conteovotos`
--
DROP TABLE IF EXISTS `conteovotos`;

DROP VIEW IF EXISTS `conteovotos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `conteovotos`  AS SELECT `so`.`titulo` AS `Pelicula`, count(`v`.`fk_pelicula`) AS `Votos` FROM (`pelicula` `so` join `voto` `v` on((`so`.`id` = `v`.`fk_pelicula`))) GROUP BY `so`.`titulo` ORDER BY count(`v`.`fk_pelicula`) DESC ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
