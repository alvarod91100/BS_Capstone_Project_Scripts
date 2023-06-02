CREATE DATABASE `proyecto_salud` 

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` bigint DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `a_nacimiento` int DEFAULT NULL,
  `respuesta_seguridad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `placeholder_h` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT (substr(md5(rand()),1,32)),
  `pregunta_seguridad` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `adding_forkey_preguntas_seg` (`pregunta_seguridad`),
  CONSTRAINT `adding_forkey_preguntas_seg` FOREIGN KEY (`pregunta_seguridad`) REFERENCES `preguntas_seguridad` (`id_pregunta_seguridad`)
) ENGINE=InnoDB AUTO_INCREMENT=26484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'


CREATE TABLE `c_confianza` (
  `id_contacto_confianza` int NOT NULL AUTO_INCREMENT,
  `nombre_contacto_confianza` varchar(255) DEFAULT NULL,
  `apellido_paterno_contacto_confianza` varchar(255) DEFAULT NULL,
  `apellido_materno_contacto_confianza` varchar(255) DEFAULT NULL,
  `tel_contacto_confianza` bigint DEFAULT NULL,
  `correo_contacto_confianza` varchar(255) DEFAULT NULL,
  `pregunta_contacto_confianza` varchar(45) DEFAULT NULL,
  `respuesta_contacto_confianza` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_contacto_confianza`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'

CREATE TABLE `comercial` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(255) DEFAULT NULL,
  `direccion_sucursal` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `gerente_sucursal` varchar(255) DEFAULT NULL,
  `num_empleados` int DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'

CREATE TABLE `kioskos` (
  `id_consulta_eventos` int NOT NULL AUTO_INCREMENT,
  `id_lectura` int DEFAULT NULL,
  `estatus_finalizacion` varchar(255) DEFAULT NULL,
  `tiempo_registro` datetime DEFAULT NULL,
  `tiempo_vitales_1` datetime DEFAULT NULL,
  `tiempo_vitales_2` datetime DEFAULT NULL,
  `tiempo_vitales_3` datetime DEFAULT NULL,
  `tiempo_total` datetime DEFAULT NULL,
  `tiempo_inactivo` datetime DEFAULT NULL,
  PRIMARY KEY (`id_consulta_eventos`),
  KEY `id_lectura` (`id_lectura`),
  CONSTRAINT `kioskos_ibfk_1` FOREIGN KEY (`id_lectura`) REFERENCES `vitales` (`id_lectura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'


CREATE TABLE `padecimientos` (
  `id_padecimiento` int NOT NULL AUTO_INCREMENT,
  `padecimeinto` varchar(255) DEFAULT NULL,
  `desc_padecimiento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_padecimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'

CREATE TABLE `padecimientos_cliente` (
  `id_padecimientos_cliente` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_padecimiento` int DEFAULT NULL,
  PRIMARY KEY (`id_padecimientos_cliente`),
  KEY `id_padecimiento` (`id_padecimiento`),
  KEY `padecimientos_cliente_ibfk_1` (`id_cliente`),
  CONSTRAINT `padecimientos_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `padecimientos_cliente_ibfk_2` FOREIGN KEY (`id_padecimiento`) REFERENCES `padecimientos` (`id_padecimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=1373 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'

CREATE TABLE `preguntas_seguridad` (
  `id_pregunta_seguridad` int NOT NULL,
  `pregunta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta_seguridad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'

CREATE TABLE `roles` (
  `roleid` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'

CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_contacto_confianza` int DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `keyPrivada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `saltPrivada` varchar(255) DEFAULT NULL,
  `ivUsuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `zc` varchar(255) DEFAULT NULL,
  `saltPwd` varchar(255) DEFAULT NULL,
  `derivedKeyPwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ivPwd` varchar(255) DEFAULT NULL,
  `zcPwd` varchar(255) DEFAULT NULL,
  `saltEmail` varchar(255) DEFAULT NULL,
  `derivedKeyEmail` varchar(255) DEFAULT NULL,
  `ivEmail` varchar(255) DEFAULT NULL,
  `zcEmail` varchar(255) DEFAULT NULL,
  `saltPregunta` varchar(255) DEFAULT NULL,
  `derivedKeyPregunta` varchar(255) DEFAULT NULL,
  `ivPregunta` varchar(255) DEFAULT NULL,
  `zcPregunta` varchar(255) DEFAULT NULL,
  `roleid` int DEFAULT '1',
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `id_cliente` (`id_cliente`),
  KEY `roleid` (`roleid`),
  KEY `adding_forkey_users_c_conf` (`id_contacto_confianza`),
  CONSTRAINT `adding_forkey_users_c_conf` FOREIGN KEY (`id_contacto_confianza`) REFERENCES `c_confianza` (`id_contacto_confianza`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'

CREATE TABLE `vitales` (
  `id_lectura` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_local` int DEFAULT NULL,
  `ritmo_cardiaco` varchar(255) DEFAULT NULL,
  `frecuencia_respiratoria` varchar(255) DEFAULT NULL,
  `peso` varchar(255) DEFAULT NULL,
  `indice_masa_corporal` varchar(255) DEFAULT NULL,
  `saturacion_oxigeno` varchar(255) DEFAULT NULL,
  `temperatura` varchar(255) DEFAULT NULL,
  `presion_sanguinea_sistolica` varchar(255) DEFAULT NULL,
  `presion_sanguinea_diastolica` varchar(255) DEFAULT NULL,
  `altura` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_lectura`)
) ENGINE=InnoDB AUTO_INCREMENT=9238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ENCRYPTION='Y'
