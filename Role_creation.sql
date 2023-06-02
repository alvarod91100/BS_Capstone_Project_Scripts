-- DEFINICION DE ROL GOBIERNO
CREATE ROLE gobierno;
GRANT SELECT on proyecto_salud_desensibilizada.* TO gobierno;

-- DEFINICION DE ROL DE FARMACIA
CREATE ROLE farmacia;
GRANT SELECT on proyecto_salud_desensibilizada.* TO farmacia;

-- DEFINICION DE contactos Confianza
CREATE ROLE contacTOs_confianza;
GRANT SELECT, UPDATE, DELETE ON proyecTO_salud.c_confianza 
    TO contactos_confianza;
GRANT update on proyecto_salud.* TO contactos_confianza;
GRANT DELETE on proyecto_salud.* TO contactos_confianza;

-- DEFINICION DE ROL Clientes
CREATE ROLE clientes;
GRANT SELECT on proyecto_salud.* TO clientes;
GRANT CREATE on proyecto_salud.* TO clientes;
GRANT UPDATE on proyecto_salud.* TO clientes;
GRANT DELETE on proyecto_salud.* TO clientes;

-- Definicion de nuevo admin/su
GRANT ALL PRIVILEGES ON *.* TO 'username'@'%';

-- Aplicacion de cambios
FLUSH PRIVILEGES;
