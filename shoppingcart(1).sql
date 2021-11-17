-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2021 a las 04:16:50
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `checkout_id` text NOT NULL,
  `subtotal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `quantity`, `checkout_id`, `subtotal`) VALUES
(4, 1, 1, '618963ac6b2ac', '49.98'),
(5, 3, 1, '618963ac7690b', '49.98'),
(6, 12, 1, '61945df51c712', '5000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `checkout_id` int(11) NOT NULL,
  `amount` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `postcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `checkout_id`, `amount`, `name`, `email`, `address`, `city`, `postcode`) VALUES
(2, 618963, '49.98', 'rf', 'f', 'ff', 'f', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `desc` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `rrp` decimal(7,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `desc`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(1, 'Asus Z590', '', '8900.00', '0.00', 10, 'asusz390.jpg', '2019-03-13 17:55:22'),
(2, 'Arctic Termic Paste', '', '569.00', '1000.00', 34, 'arcticmx.jpg', '2019-03-13 18:52:49'),
(3, 'TPM Module 2.0', '', '750.00', '0.00', 21, 'tpmmodulo.jpg', '2019-03-13 18:47:56'),
(4, 'Ryzen CPU', '', '25999.00', '0.00', 7, 'ryzencpu.jpg', '2019-03-13 17:42:04'),
(5, 'Gabinete Sentey Fulltower', 'Gabinete Marca Sentey \nFull tower = bien espacioso\nNuevo', '4500.00', '0.00', 15, 'Gabosentey.png', '2021-11-08 14:57:19'),
(6, 'Cable Sata', 'Cable Sata Color Rojo, dimensiones universales', '120.00', '0.00', 20, 'Cable Sata.png', '2021-11-08 15:01:01'),
(7, 'Disco Rigido 1tb Western Digital', 'Western Digital es una marca de renombre mundial en almacenamiento de datos con la cual podés crear, experimentar y guardar contenidos a través de una amplia gama de dispositivos. La alta seguridad y rendimiento que brindan sus unidades la convierten en una de las empresas más elegidas del mercado.\r\nEl WD Blue WD10SPZX se caracteriza por su eficiencia y buen funcionamiento, que sumado a su reducido consumo energético lo vuelven un disco indispensable para funciones estándar.\r\n\r\nMás velocidad a tu alcance\r\nEste producto posee una interfaz SATA III que se encarga de transferir datos con la placa madre de tu computadora. Es de gran importancia y con su velocidad de envío de información mejora el rendimiento. Vas a poder cargar todo tipo de archivos en tu PC con rapidez.', '6500.00', '0.00', 10, 'Disco Duro Western Digital 1tb.png', '2021-11-08 15:02:41'),
(8, 'Disco Estado Solido 128gb', 'Con la unidad en estado sólido vas a incrementar la capacidad de respuesta de tu equipo. Gracias a esta tecnología podrás invertir en velocidad y eficiencia para el inicio, la carga y la transferencia de datos.\r\n\r\nMás velocidad a tu alcance\r\nEste disco transfiere datos a través de una interfaz PCIe 3.0, lo que te brindará trasmitir una mayor cantidad de información de una sola vez.\r\n', '2500.00', '0.00', 20, 'Disco ssd.png', '2021-11-08 15:04:02'),
(9, 'Fuente Evga, 500w 80 plus', '    Tipo de fuente de alimentación para PC: ATX\n\n    Tipo de refrigeración: Por aire\n\n    Con protección de bajo voltaje: Sí\n\n    Cantidad de conectores SATA: 6\n\n    Cantidad de conectores floppy: 1\n\n    Cantidad de conectores PCI-E: 2\n\n    Certificación de eficiencia: 80 Plus White\n\n    Diámetro del ventilador: 120 mm\n\n    Altura de la fuente de alimentación para PC x Ancho de la fuente de alimentación para PC: 85 mm x 150 mm\n\n    Largo de la fuente de alimentación para PC: 140 mm\n\n    Peso de la fuente de alimentación para PC: 4 lb\n\n    Frecuencia: 60 Hz\n\n    Largo del conector principal: 550 mm\n\n    Largo del cable de alimentación: 1200 mm\n\n    Tipo de modulación: Permanente\n\n    Con protección sobre potencia: Sí\n\n    Con protección sobre voltaje: Sí\n\n    Con protección contra cortocircuito: Sí\n\n    Con funcionamiento silencioso: Sí\n\n    Cantidad de pines de la placa madre: 24', '10000.00', '0.00', 5, 'Fuente.png', '2021-11-08 15:04:58'),
(10, 'Memoria Ram Kingstone Rgb 8gb ', 'Kingston es sinónimo de trayectoria y excelencia en el mercado tecnológico, principalmente en lo que a memorias ram refiere. Mejorar la capacidad y rendimiento de tu computadora va a ser fácil con la incorporación de una memoria de la línea ValueRAM, que cubrirá todas tus necesidades. Dispará la productividad y ejecutá tus programas y aplicaciones con mayor velocidad.\r\n\r\nPotenciá tu PC\r\nCon este módulo de tecnología DDR3, mejorará el desempeño de tu equipo, ya que alcanza velocidades de transferencia y de bus más altas. Además, funciona a niveles de bajo voltaje, lo que optimiza el rendimiento y disminuye el consumo eléctrico.\r\n\r\nTu equipo como nuevo\r\nEsta memoria es ideal para tu Computadoras de escritorio. ¡Instalala y comenzá a disfrutar de un óptimo funcionamiento!\r\n\r\nTrabajá con libertad\r\nYa sea que la uses para actividades domésticas como navegar por Internet, enviar correos o contenido multimedia, o bien para trabajar utilizando diversas funciones en simultáneo, esta memoria es para vos. Gracias a su velocidad de 1600 MHz, podrás realizar todas tus tareas de manera rápida y efectiva.', '4750.00', '0.00', 17, 'Memoria ram 8gb.png', '2021-11-08 15:06:41'),
(11, 'Monitor Samsung 24p Plano Led', 'Descripción\r\n\r\nSamsung está fielmente comprometida en brindar productos de calidad y que contribuyan a crear un mejor futuro para las personas. Como empresa líder en la industria tecnológica uno de sus objetivos principales es desarrollar avanzadas e innovadoras soluciones. Es por ello que con este monitor tendrás y disfrutarás de una gran experiencia visual en todo momento.\r\n\r\nUn monitor a tu medida\r\nCon tu pantalla LED no solo ahorrás energía, ya que su consumo es bajo, sino que vas a ver colores nítidos y definidos en tus películas o series favoritas.\r\n\r\nUna experiencia visual de calidad\r\nEste monitor de 24\" te va a resultar cómodo para estudiar, trabajar o ver una película en tus tiempos de ocio. Asimismo, su resolución de 1920 x 1080 te permite disfrutar de momentos únicos gracias a una imagen de alta fidelidad. Su tiempo de respuesta de 5 ms lo hace ideal para gamers y cinéfilos porque es capaz de mostrar imágenes en movimiento sin halos o bordes borrosos.\r\n', '20000.00', '0.00', 6, 'Monitor Samsung 24p.png', '2021-11-08 15:07:43'),
(12, 'Mouse Logitech G603 Inalambrico', 'G603 es un ratón para gaming de próxima generación diseñado para el mundo inalámbrico. Dispone de una serie de funciones y tecnologías avanzadas para ofrecer alto rendimiento a los jugadores más exigentes. G603 es el primer ratón para gaming dotado del sensor HERO, que proporciona una precisión excepcional, con una sensibilidad de hasta 12.000 dpi. Al mismo tiempo, G603 tiene una eficiencia de pilas 10 veces superior a la de generaciones anteriores. También tiene tecnología inalámbrica LIGHTSPEED, que proporciona un rendimiento profesional y una fiabilidad inigualable, superior incluso a la de muchos ratones para gaming con cable.', '5000.00', '6500.00', 7, 'Mouse Logitech G603.png', '2021-11-08 15:09:24'),
(13, 'Router TP-Link Archer C58HP negro', 'Conectividad que te acompaña\r\nTP Link es sinónimo de estabilidad, rendimiento y valor, ya que es el proveedor número 1 de dispositivos wifi con distribución en más de 170 países.\r\nEste modelo C58HP te permitirá crear redes de gran velocidad e integrar todos los aparatos electrónicos inteligentes para que disfrutes de la mejor conexión sin interrupciones.\r\n\r\nInformación que vuela\r\nSin importar la cantidad de artefactos conectados ni la magnitud de los datos, tu conexión será impresionante. Con una velocidad de 1317 Mbps, los tiempos de cargas lentas quedaron atrás.\r\n\r\nGran alcance y estabilidad\r\n¡Mantenete siempre en línea! Con su doble banda lográ un mayor alcance y una mejor estabilidad de la frecuencia.', '4500.00', '5000.00', 4, 'Router.png', '2021-11-08 15:10:21'),
(14, 'Teclado Logitech Rgb Mecanico', 'Este teclado Logitech de alto rendimiento permite que puedas disfrutar de horas ilimitadas de juegos. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Podrás mejorar tu experiencia de gaming, ya seas un aficionado o todo un experto y hacer que tus jugadas alcancen otro nivel.\r\n\r\nDistinción a todo color\r\nSu retroiluminación le da un toque diferente a tu equipo y resalta su composición cuando es utilizado en espacios poco iluminados.\r\n', '6700.00', '7000.00', 3, 'Teclado Logitech Rgb.png', '2021-11-08 15:11:13'),
(15, 'Gabinete Sentey T20', 'Sentey sorprende nuevamente con sus nuevos gabinetes de la linea Extreme Glass, en este caso con el T20.', '9499.00', '10000.00', 26, 'senteyt20.png', '2021-11-16 22:56:36'),
(16, 'Auriculares Beats Solo³ Inalámbricos', 'Con hasta 40 horas de batería, los Beats Solo3 Wireless son los auriculares perfectos para todos los días. Con Fast Fuel, 5 minutos de carga son suficientes para obtener 3 horas de reproducción. Disfruta del sonido galardonado de Beats con la libertad que ofrece la tecnología Bluetooth® Class 1. Las almohadillas acolchadas sobre la oreja son ajustables para lograr gran comodidad durante todo el día.', '25000.00', '26500.00', 13, 'beatssolo3.png', '2021-11-16 23:00:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indices de la tabla `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
