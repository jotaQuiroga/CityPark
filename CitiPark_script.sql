/*IMPORTANTE: Comentar la siguente instrucción si se ejecutará este script en CLEVER-CLOUD*/
DROP DATABASE IF EXISTS `CityPark1`;
CREATE DATABASE CityPark1;

USE CityPark1;

-- citypark.cargo definition
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(255) DEFAULT NULL,
  `salario` int DEFAULT NULL,
  KEY `PK_CARGO` (`id_cargo`),
  CONSTRAINT `PK_CARGO` PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- citypark.empleado definition
DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `cedula` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `id_emple_cargo` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `FK_emple_cargo` (`id_emple_cargo`),
  CONSTRAINT `FK_emple_cargo` FOREIGN KEY (`id_emple_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- citypark.condicionuso definition
DROP TABLE IF EXISTS `condicionuso`;
CREATE TABLE `condicionuso` (
  `id_condicion_uso` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_condicion_uso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- citypark.atraccion definition
DROP TABLE IF EXISTS `atraccion`;
CREATE TABLE `atraccion` (
  `id_atraccion` int NOT NULL AUTO_INCREMENT,
  `clasificacion` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `mantenimiento` bit(1) DEFAULT NULL,
  `nombre_atrac` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_atraccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- citypark.atraccion_condicionuso_map definition
DROP TABLE IF EXISTS `atraccion_condicionuso_map`;
CREATE TABLE `atraccion_condicionuso_map` (
  `id_cond_uso` int NOT NULL,
  `id_atrac` int NOT NULL,
  PRIMARY KEY (`id_cond_uso`,`id_atrac`),
  KEY `FK_aCUso_atrac` (`id_atrac`),
  CONSTRAINT `FK_aCUso_atrac` FOREIGN KEY (`id_atrac`) REFERENCES `atraccion` (`id_atraccion`),
  KEY `FK_aCUso_cdUso` (`id_atrac`),
  CONSTRAINT `FK_aCUso_cdUso` FOREIGN KEY (`id_cond_uso`) REFERENCES `condicionuso` (`id_condicion_uso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- citypark.usuario definition
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `cedula` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `estatura` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_visitas` int DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- citypark.acudiente definition
DROP TABLE IF EXISTS `acudiente`;
CREATE TABLE `acudiente` (
  `id_acudiente` int NOT NULL AUTO_INCREMENT,
  `apellido_acu` varchar(255) DEFAULT NULL,
  `cedula_acu` varchar(255) DEFAULT NULL,
  `correo_elec_acu` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre_acu` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `id_usu_acu` int DEFAULT NULL,
  PRIMARY KEY (`id_acudiente`),
  KEY `FK_acudi_usuar` (`id_usu_acu`),
  CONSTRAINT `FK_acudi_usuar` FOREIGN KEY (`id_usu_acu`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- citypark.estacion definition
DROP TABLE IF EXISTS `estacion`;
CREATE TABLE `estacion` (
  `id_estacion` int NOT NULL AUTO_INCREMENT,
  `nombre_estacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- citypark.tiquete definition
DROP TABLE IF EXISTS `tiquete`;
CREATE TABLE `tiquete` (
  `id_tiquete` int NOT NULL AUTO_INCREMENT,
  `tipo_tiquete` varchar(255) DEFAULT NULL,
  `id_atrac_tiq` int DEFAULT NULL,
  `id_emp_tiq` int DEFAULT NULL,
  `id_est_tiq` int DEFAULT NULL,
  `id_usu_tiq` int DEFAULT NULL,
  PRIMARY KEY (`id_tiquete`),
  KEY `FK_tique_atrac` (`id_atrac_tiq`),
  KEY `FK_tique_emple` (`id_emp_tiq`),
  KEY `FK_tique_estac` (`id_est_tiq`),
  KEY `FK_tique_usuar` (`id_usu_tiq`),
  CONSTRAINT `FK_tique_emple` FOREIGN KEY (`id_emp_tiq`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `FK_tique_atrac` FOREIGN KEY (`id_atrac_tiq`) REFERENCES `atraccion` (`id_atraccion`),
  CONSTRAINT `FK_tique_estac` FOREIGN KEY (`id_est_tiq`) REFERENCES `estacion` (`id_estacion`),
  CONSTRAINT `FK_tique_usuar` FOREIGN KEY (`id_usu_tiq`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO cargo (id_cargo, nombre_cargo, salario) VALUES
(1, 'Administrador', 3500000),
(2, 'Logistica', 3000000),
(3, 'Mantenimiento', 2500000),
(4, 'Operacion', 2000000),
(5, 'Publicidad', 4000000);


INSERT INTO citypark1.empleado
(id_empleado, apellido, cedula, correo_electronico, direccion, nombre, telefono, id_emple_cargo) VALUES
(2, 'Rios', '5678', 'hola_2@home.com', 'cll 89 90', 'Sergio', '4666', 2),
(3, 'Ramos', '9012', 'hola_3@home.com', 'cll 23 34', 'Juan', '5777', 3),
(4, 'Robayo', '3456', 'hola_4@home.com', 'cll 67 78', 'Andres', '7999', 4),
(5, 'Rico', '7890', 'hola_5@home.com', 'cll 01 12', 'Simon', '555511', 1),
(6, 'pR244obayo8', '044324568', 'lh882ola_48@home.com', 'carrera 25 88 78', 'kAn244dres8', '2278611', 1),
(7, 'Gonzalez', 'a1412541', 'shbfj@sdgsdds', 'cll 55 22', 'Milton', '798465', 3),
(8, 'Rocha', '9090', 'hola_ruben@home.com', 'carrera 01 12', 'Ruben', '888811', 3);


INSERT INTO usuario
(id_usuario, apellido, cedula, correo_electronico, direccion, edad, estatura, nombre, numero_visitas, telefono)
VALUES(1, 'Rodriguez', '123345', 'raul@gmail.com', 'cll 58 # 23', 20, 2, 'Raul', 6, '31334556'),
(2, 'Rodriguez', '124345', 'jimmy@gmail.com', 'cll 58 # 23', 20, 2, 'Jimmy', 6, '31334557'),
(3, 'Rodriguez', '122346', 'tomas@gmail.com', 'cll 58 # 23', 20, 2, 'Tomas', 6, '31334558'),
(4, 'Rodriguez', '133385', 'alejo@gmail.com', 'cll 58 # 23', 22, 2, 'Alejandro', 6, '31367925'),
(5, 'Saenz', '8888', 'lucas@gmail.com', 'cll 58 # 23', 20, 2, 'Lucas', 6, '31334555');


INSERT INTO acudiente
(id_acudiente, apellido_acu, cedula_acu, correo_elec_acu, direccion, nombre_acu, telefono, id_usu_acu) values
(1, 'Sanchez', '79080080', 'mailAcudiente1@mail.com', 'calle 20 carrera 10', 'Jack', '2504565', 3),
(2, 'Torres', '90800806', 'mAcudiente2@mail.com', 'calle 30 carrera 15', 'Peter', '2850456', 5),
(3, 'Sanchez', '79080080', 'mailAcudiente1@mail.com', 'calle 20 carrera 10', 'Jack', '2504565', 1);


insert into estacion  (id_estacion, nombre_estacion) values
(1, 'zona nororiental'),
(2, 'zona noroccidental'),
(3, 'zona norte'),
(4, 'zona suroriental'),
(5, 'zona suroccidental'),
(6, 'zona sur'),
(7, 'zona web');


INSERT INTO atraccion
(id_atraccion, clasificacion, descripcion, estado, mantenimiento, nombre_atrac) values
(1,  'Todos', 'Rueda de baja velocidad, de gran tamaño que permite tener una visión general de la ciudad por sus 40 metros de altura', 1, 0, 'rueda panorámica'),
(2,  'Estatura Mínima 140cm', 'Tren de alta velocidad, para 30 pasajeros con un recorrido de abruptos giros, elevaciones y caidas', 1, 0, 'montaña rusa'),
(3,  'Todos, conductor estatura mínima 120cm', 'Vehículos de 2 pasajeros cuyo objetivo es golpear a cualquiera de los otros 12 vehículos que se encentran el la pista', 1, 0, 'carros chocones'),
(4,  'Tdoos', 'Atracción giratoria que genera elevación a todos los 10 aviones de cuatro pasajeros, sobre los 5 metros aproximadamente', 1, 0, 'aviones'),
(5,  'Todos', 'Tren de 10 vagones y 4 pasajeos por vagón que recorre todo el parque de atracciones', 1, 0, 'turistren'),
(6,  'Estatura máxima 130', 'Bus con diseño de ruta escolar, de rotación vertical, de 4 metros de altura con capacidad para 12 pasajeros', 1, 0, 'bus escolar'),
(7,  'Todos', 'Atracción con forma de troncos con capacidad para 4 pasajeros por tronco, que recorre un riel con subidas, bajadas y zona de inmersión acuática parcial', 1, 0, 'acuatroncos'),
(8,  'Todos', 'Atracción giratoria con caballos de 1 pasajero y carrozas de 4 pasajeros', 1, 0, 'carrusel'),
(9,  'Estatura Mínima 140cm', 'Atracción de ascenso lento y caída vertiginosa, con momentos de rotación de 360 grados sobre su eje.', 1, 0, 'apocalipsys'),
(10, 'Estatura Mínima 140cm', 'Atracción de movimento pendular progresivo hasta un movimiento circular con capacidad para 30 pasajeros', 1, 0, 'barco pirata'),
(11, 'Todos', 'Muro de 8 metros y soporte con linea de vida para ascender de forma individual con supervisión de profesionales ', 1, 0, 'muro de escalar'),
(12, 'Estatura máxima 130', 'Estructura con escaleras, túneles, mayas, obstaculos, de 4 pisos para que los niños exploten sus habilidades psicomotrices', 1, 0, 'laberinto infantil'),
(13, 'Todos', 'Rodadero ondulado por el cual se deslizan los usuarios sentados dentro de un costal', 1, 0, 'costales'),
(14, 'Estatura Mínima 140cm', 'Pista de 24 vehículos tipo Kart individual, con un trazado de curvas y rectas para medir las habilidades de pilotaje', 1, 0, 'karts');


INSERT INTO condicionuso
(id_condicion_uso, descripcion) VALUES
(1,  'No está permitido el ingreso en estado de embriaguez'),
(2,  'Todo menor de edad debe indicar quien es su acudiente'),
(3,  'No se permite el ingreso con elementos de mano (maletas, bolsos, bolsas, ect)'),
(4,  'No se responde por objetos susceptibles de separarse a causa de la acción de la atracción'),
(5,  'Para ingresar nuevamente es necesario realizar nuevamente la fila'),
(6,  'El coordinador de la atraccion tiene plena facultad para negar el ingreso a un usuario'),
(7,  'El usuario debe cumplir con todas las instrucciones de seguridad exigidas por el cordinador de la instrucción'),
(8,  'El usuario que falte a alguna instrucción o regla puede ser expulsado en cualquier momento de la atracción'),
(9,  'El ususario con estatura inferior a 130cm debe ingresar en compañia de su acudiente'),
(10, 'Es obligatorio el uso de elementos de seguridad brindados por el parque'),
(11, 'Está prohibido el ingreso con zapatos');


insert into atraccion_condicionuso_map (id_cond_uso, id_atrac) values
/*1  rueda panorámica*/
(1,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
/*2  montaña rusa*/
(1,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
/*3  carros chocones*/
(1,3),
(4,3),
(5,3),
(6,3),
(7,3),
(8,3),
/*4  aviones*/
(1,4),
(4,4),
(5,4),
(6,4),
(7,4),
(8,4),
(9,4),
/*5  turistren*/
(1,5),
(4,5),
(5,5),
(6,5),
(7,5),
(8,5),
(9,5),
/*6  bus escolar*/
(1,6),
(4,6),
(5,6),
(6,6),
(7,6),
(8,6),
/*7  acuatroncos*/
(1,7),
(4,7),
(5,7),
(6,7),
(7,7),
(8,7),
(9,7),
/*8  carrusel*/
(1,8),
(4,8),
(5,8),
(6,8),
(7,8),
(8,8),
(9,8),
/*9  apocalipsys*/
(1,9),
(4,9),
(5,9),
(6,9),
(7,9),
(8,9),
/*10 barco pirata*/
(1,10),
(4,10),
(5,10),
(6,10),
(7,10),
(8,10),
(9,10),
/*11 muro de escalar*/
(1,11),
(4,11),
(5,11),
(6,11),
(7,11),
(8,11),
(10,11),
(11,11),
/*12 laberinto infantil*/
(1,12),
(4,12),
(5,12),
(6,12),
(7,12),
(8,12),
(11,12),
/*13 costales*/
(1,13),
(4,13),
(5,13),
(6,13),
(7,13),
(8,13),
/*14 karts*/
(1,14),
(4,14),
(5,14),
(6,14),
(7,14),
(8,14),
(10,14);


commit;
