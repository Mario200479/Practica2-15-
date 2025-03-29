-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-03-2025 a las 03:27:56
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleados`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `ContarEmpleadosPorPuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarEmpleadosPorPuesto` ()   BEGIN
    SELECT puesto, COUNT(*) AS cantidad FROM Empleado_general GROUP BY puesto;
END$$

DROP PROCEDURE IF EXISTS `ContarProductos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarProductos` ()   BEGIN
    SELECT COUNT(*) AS total_productos FROM Miscelanea;
END$$

DROP PROCEDURE IF EXISTS `EmpleadosPorSalario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmpleadosPorSalario` (IN `min_salario` DECIMAL(10,2))   BEGIN
    SELECT * FROM Empleado_general WHERE salario >= min_salario;
END$$

DROP PROCEDURE IF EXISTS `MiscelaneaPorCategoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MiscelaneaPorCategoria` (IN `categoria_buscar` VARCHAR(50))   BEGIN
    SELECT * FROM Miscelanea WHERE categoria = categoria_buscar;
END$$

DROP PROCEDURE IF EXISTS `ObtenerEmpleados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEmpleados` ()   BEGIN
    SELECT * FROM Empleado_general;
END$$

DROP PROCEDURE IF EXISTS `ObtenerEmpleadosPorPuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEmpleadosPorPuesto` (IN `puesto_buscar` VARCHAR(50))   BEGIN
    SELECT * FROM Empleado_general WHERE puesto = puesto_buscar;
END$$

DROP PROCEDURE IF EXISTS `ObtenerMiscelanea`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMiscelanea` ()   BEGIN
    SELECT * FROM Miscelanea;
END$$

DROP PROCEDURE IF EXISTS `ProductosPorFechaIngreso`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductosPorFechaIngreso` (IN `fecha_ingreso` DATE)   BEGIN
    SELECT * FROM Miscelanea WHERE fecha_ingreso > fecha_ingreso;
END$$

DROP PROCEDURE IF EXISTS `ProductosPorPrecio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductosPorPrecio` (IN `precio_min` DECIMAL(10,2))   BEGIN
    SELECT * FROM Miscelanea WHERE precio > precio_min;
END$$

DROP PROCEDURE IF EXISTS `SalarioPromedio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SalarioPromedio` ()   BEGIN
    SELECT AVG(salario) AS salario_promedio FROM Empleado_general;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_general`
--

DROP TABLE IF EXISTS `empleado_general`;
CREATE TABLE IF NOT EXISTS `empleado_general` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado_general`
--

INSERT INTO `empleado_general` (`id`, `nombre`, `apellido`, `edad`, `puesto`, `salario`) VALUES
(1, 'Juan', 'Pérez', 30, 'Ingeniero', 2500.00),
(2, 'Ana', 'López', 28, 'Contadora', 2200.00),
(3, 'Carlos', 'Ramírez', 35, 'Gerente', 5000.00),
(4, 'Sofía', 'Gómez', 27, 'Diseñadora', 1800.00),
(5, 'Pedro', 'Martínez', 40, 'Supervisor', 3200.00),
(6, 'Lucía', 'Fernández', 33, 'Analista', 2600.00),
(7, 'Diego', 'Torres', 29, 'Técnico', 2000.00),
(8, 'Marta', 'Sánchez', 31, 'Consultora', 2700.00),
(9, 'Ricardo', 'Ortega', 38, 'Jefe de Proyecto', 4000.00),
(10, 'Elena', 'Castro', 25, 'Asistente', 1500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelanea`
--

DROP TABLE IF EXISTS `miscelanea`;
CREATE TABLE IF NOT EXISTS `miscelanea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `proveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `miscelanea`
--

INSERT INTO `miscelanea` (`id`, `descripcion`, `categoria`, `cantidad`, `precio`, `fecha_ingreso`, `proveedor`) VALUES
(1, 'Silla ergonómica', 'Mobiliario', 5, 150.00, '2025-03-01', 'Proveedor A'),
(2, 'Monitor LED', 'Electrónica', 3, 300.00, '2025-02-15', 'Proveedor B'),
(3, 'Teclado mecánico', 'Periféricos', 10, 90.00, '2025-03-10', 'Proveedor C'),
(4, 'Mouse inalámbrico', 'Periféricos', 8, 50.00, '2025-03-05', 'Proveedor D'),
(5, 'Cámara de seguridad', 'Seguridad', 2, 200.00, '2025-02-25', 'Proveedor E'),
(6, 'Escritorio de oficina', 'Mobiliario', 4, 180.00, '2025-03-08', 'Proveedor A'),
(7, 'Laptop Dell', 'Computadoras', 1, 1200.00, '2025-02-20', 'Proveedor F'),
(8, 'Audífonos Bluetooth', 'Electrónica', 7, 75.00, '2025-03-12', 'Proveedor G'),
(9, 'Proyector', 'Electrónica', 2, 400.00, '2025-03-03', 'Proveedor H'),
(10, 'Silla gamer', 'Mobiliario', 3, 250.00, '2025-03-07', 'Proveedor A'),
(11, 'Router WiFi', 'Redes', 6, 120.00, '2025-03-02', 'Proveedor I'),
(12, 'Disco SSD 1TB', 'Almacenamiento', 5, 130.00, '2025-03-11', 'Proveedor J'),
(13, 'Memoria RAM 16GB', 'Hardware', 4, 80.00, '2025-03-06', 'Proveedor K'),
(14, 'Pizarra blanca', 'Oficina', 2, 60.00, '2025-03-09', 'Proveedor L'),
(15, 'Tóner de impresora', 'Consumibles', 5, 45.00, '2025-03-04', 'Proveedor M');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
