--@Author:          Emanuel Flores Martínez
--@Fecha creación:  03/Marzo/2021
--@Descripción:     Script para crear usuarios de administración

-- Creación de usuarios
create user emanuel0105 identified by emanuel quota unlimited on users;
create user emanuel0106 identified by emanuel quota unlimited on users;

-- Asignar privilegio para crear sesion
grant create session to emanuel0105;
grant create session to emanuel0106;

-- Asignar roles de administración a los usuarios
grant sysdba to emanuel0104;
grant sysoper to emanuel0105;
grant sysbackup to emanuel0106;