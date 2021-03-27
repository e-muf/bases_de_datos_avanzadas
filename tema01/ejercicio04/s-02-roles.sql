--@Author:          Emanuel Flores Martínez
--@Fecha creación:  08/Marzo/2021
--@Descripción:     Script para consultar los roles y privilegios

-- Consulta de los roles en dba_roles
create table emanuel0104.t02_db_roles as
  select role_id, role from dba_roles;

-- Consulta de los privilegios del rol DBA
-- el rol bda contiene todos los priivilegios
create table emanuel0104.t03_dba_privs as
  select privilege from dba_sys_privs;