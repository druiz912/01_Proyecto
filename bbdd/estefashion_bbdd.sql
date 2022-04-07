-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2022 a las 17:50:12
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
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `identificador` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `imagen` varchar(1000) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`identificador`, `nombre`, `imagen`) VALUES
(4, 'Calzonas', 'calzonas.png'),
(5, 'Camisetas', 'camisetas.png'),
(9, 'Pantalones ', 'pantalones.png'),
(10, 'Gorros', 'gorros.img'),
(11, 'Zapatos', 'zapatos.png'),
(12, 'Zapatos', 'zapatos.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Identificador` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidos` varchar(300) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `suscripcion_nl` tinyint(4) DEFAULT NULL,
  `direccion_envio` varchar(1000) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Identificador`, `nombre`, `apellidos`, `email`, `password`, `suscripcion_nl`, `direccion_envio`, `telefono`, `estado`) VALUES
(1, 'Daniel', 'Ruiz ', 'danielruiz@hotmail.com', '000000', 0, 'C/ Washington ', '8328938', 1),
(2, 'Manuel', 'Benítez', 'manuelbenitez@gmail.com', '111', 1, 'Avda. Andalucia', '634923123', 0),
(3, 'Antonio', ' Rodríguez', ' antoniorodriguez@gmail.com', '12339293', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Identificador` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `importe` int(11) NOT NULL,
  `observaciones` varchar(1000) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`Identificador`, `id_cliente`, `fecha`, `importe`, `observaciones`) VALUES
(1, 1, '2022-03-22', 50, 'Pedido de prueba'),
(4, 2, '2022-03-26', 11, 'Pedido de prueba 2'),
(5, 2, '2022-04-09', 29, 'Pedido de prueba 3');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_clientes`
--

CREATE TABLE `tipos_clientes` (
  `Identificador` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipos_clientes`
--

INSERT INTO `tipos_clientes` (`Identificador`, `nombre`) VALUES
(1, 'Hombre'),
(2, 'Mujer'),
(3, 'Niño'),
(4, 'Aliens'),
(5, 'Zombies'),
(11, 'Rusos'),
(12, 'Reptilianos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Identificador` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `importe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`Identificador`, `id_cliente`, `fecha`, `importe`) VALUES
(1, 1, '2022-03-22', 90);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`identificador`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Identificador`),
  ADD KEY `FK_PEDIDOS_CLIENTES_idx` (`id_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Identificador`),
  ADD KEY `FK_PRODUCTOS_CLIENTES_idx` (`id_tipo_cliente`),
  ADD KEY `FK_PRODUCOS_CATEGORIAS` (`id_categoria`);

--
-- Indices de la tabla `tipos_clientes`
--
ALTER TABLE `tipos_clientes`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Identificador`),
  ADD KEY `fk_ventas_clientes_idx` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `identificador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Identificador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Identificador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Identificador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipos_clientes`
--
ALTER TABLE `tipos_clientes`
  MODIFY `Identificador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `Identificador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_PEDIDOS_CLIENTES` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`Identificador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_constraint_PEDIDOS_CLIENTES` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`Identificador`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_PRODUCOS_CATEGORIAS` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`identificador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PRODUCTOS_TIPOCLIENTES` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipos_clientes` (`Identificador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`Identificador`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
