-- CREACION DE BASE DE DATOS DESENSIBILIZADA
CREATE DATABASE proyecto_salud_desensibilizada;

--CREACION DE TABLA COMERCIAL
CREATE TABLE proyecto_salud_desensibilizada.comercial
AS
SELECT * FROM proyecto_salud.comercial;
INSERT INTO proyecto_salud_desensibilizada.comercial 
SELECT * FROM proyecto_salud.comercial;

--CREACION DE TABLA PADECIMIENTOS
CREATE TABLE proyecto_salud_desensibilizada.padecimientos
AS
SELECT * FROM proyecto_salud.padecimientos;
INSERT INTO proyecto_salud_desensibilizada.padecimientos 
SELECT * FROM proyecto_salud.padecimientos;

--CREACION DE TABLA VITALES 
CREATE TEMPORARY TABLE vitales_cliente_temp 
AS SELECT * FROM proyecto_salud.vitales;
ALTER TABLE vitales_cliente_temp RENAME COLUMN id_cliente TO id_hash;
ALTER TABLE vitales_cliente_temp MODIFY COLUMN id_hash varchar(255);
CREATE TABLE proyecto_salud_desensibilizada.vitales
AS
SELECT * FROM vitales_cliente_temp;

--CREACION DE TABLA PADECIMIENTOS DE CLIENTE
CREATE TEMPORARY TABLE padecimientos_cliente_temp 
AS SELECT * FROM proyecto_salud.padecimientos_cliente;
ALTER TABLE padecimientos_cliente_temp RENAME COLUMN id_cliente TO id_hash;
ALTER TABLE padecimientos_cliente_temp MODIFY COLUMN id_hash varchar(255);
CREATE TABLE proyecto_salud_desensibilizada.padecimientos_cliente
AS
SELECT * FROM padecimientos_cliente_temp; 

--CREACION DE TABLA DE CLIENTES SIN DATOS PERSONALES
CREATE TEMPORARY TABLE clientes_temp 
AS SELECT * FROM proyecto_salud.clientes;
ALTER TABLE clientes_temp DROP COLUMN nombre,
                          DROP COLUMN apellido_paterno, 
                          DROP COLUMN apellido_materno, 
                          DROP COLUMN correo, 
                          DROP COLUMN telefono, 
                          DROP COLUMN contrasena, 
                          DROP COLUMN codigo_postal, 
                          DROP COLUMN respuesta_pregunta_seguridad;
ALTER TABLE clientes_temp RENAME COLUMN id_cliente TO id_hash;
ALTER TABLE clientes_temp MODIFY COLUMN id_hash varchar(255);
CREATE TABLE proyecto_salud_desensibilizada.clientes
AS
SELECT * FROM clientes_temp; 
ALTER TABLE proyecto_salud_desensibilizada.clientes 
MODIFY COLUMN id_hash datetime;


-- ANADIENDO LAS LLAVES PRIMARIAS Y NO PRIMARIAS A CADA TABLA
ALTER TABLE proyecto_salud_desensibilizada.comercial
ADD PRIMARY KEY (id_sucursal);
ALTER TABLE proyecto_salud_desensibilizada.padecimientos
ADD PRIMARY KEY (id_padecimiento);
ALTER TABLE proyecto_salud_desensibilizada.padecimientos_cliente
ADD PRIMARY KEY (id_padecimientos_cliente);
ALTER TABLE proyecto_salud_desensibilizada.padecimientos_cliente 
ADD CONSTRAINT adding_forkey_hash_p_c
FOREIGN KEY (id_hash) 
REFERENCES proyecto_salud_desensibilizada.clientes (id_hash);
ALTER TABLE proyecto_salud_desensibilizada.padecimientos_cliente 
ADD CONSTRAINT adding_forkey_padecimiento_p_c
FOREIGN KEY (id_padecimiento) 
REFERENCES proyecto_salud_desensibilizada.padecimientos(id_padecimiento);
ALTER TABLE proyecto_salud_desensibilizada.vitales
ADD PRIMARY KEY (id_lectura);
ALTER TABLE proyecto_salud_desensibilizada.vitales 
ADD CONSTRAINT adding_forkey_local
FOREIGN KEY (id_sucursal) 
REFERENCES proyecto_salud_desensibilizada.comercial (id_sucursal);
ALTER TABLE proyecto_salud_desensibilizada.vitales 
ADD CONSTRAINT adding_forkey
FOREIGN KEY (id_hash) 
REFERENCES proyecto_salud_desensibilizada.clientes (id_hash);
