-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2022 a las 17:52:00
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estefashion_bbdd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Identificador` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(1000) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `PVP` decimal(5,3) NOT NULL,
  `SN` varchar(16) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `imagen` varchar(10000) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `colorpredominante` varchar(20) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `stock` int(5) NOT NULL,
  `temporada` tinyint(4) DEFAULT NULL,
  `rebajado` tinyint(4) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_tipo_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Identificador`, `nombre`, `descripcion`, `PVP`, `SN`, `imagen`, `colorpredominante`, `stock`, `temporada`, `rebajado`, `id_categoria`, `id_tipo_cliente`) VALUES
(1, 'Camiseta manga corta', 'Camiseta unisex blanca de manga corta ', '10.000', '0', 'https://vestircole.com/601-thickbox_default_2x/camiseta-algodon-manga-corta-blanca-roly.jpg', 'blanco', 5, 0, 1, 5, 1),
(2, 'Camiseta manga corta de hombre', 'Camiseta de Froosties', '12.000', '0', 'https://static.bershka.net/4/photos2/2022/V/0/2/p/2809/130/447/2809130447_2_13_3.jpg?t=1648216963187', 'azul', 10, 1, 1, 5, 1),
(3, 'Pantalones vaqueros negros', ' Pantalones de hombre de estiramiento clásico', '15.000', '0', 'https://www.dhresource.com/webp/m/0x0/f2/albu/g8/M01/E4/A9/rBVaVFxqh6OAT55TAAImsZq7NM8310.jpg', 'negro', 20, 1, 1, 9, 1),
(5, 'Pantalones vaqueros grises ', 'Pantalones vaqueros grises ceñidos ', '18.000', '0', 'https://cdn.webshopapp.com/shops/198755/files/372728095/800x900x2/true-rise-pantalones-vaqueros-para-hombre-a61g-gri.jpg', 'gris', 20, 1, 1, 9, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Identificador`),
  ADD KEY `FK_PRODUCTOS_CLIENTES_idx` (`id_tipo_cliente`),
  ADD KEY `FK_PRODUCOS_CATEGORIAS` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Identificador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_PRODUCOS_CATEGORIAS` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`identificador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PRODUCTOS_TIPOCLIENTES` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipos_clientes` (`Identificador`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
