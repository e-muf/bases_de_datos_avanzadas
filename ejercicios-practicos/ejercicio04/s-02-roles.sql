--@Author:          Emanuel Flores Martínez
--@Fecha creación:  03/Marzo/2021
--@Descripción:     Script para consultar los roles por defecto y
--                  privilegios del rol DBA

-- Creación de tabla que almacenará los roles
create table emanuel0104.t02_db_roles (
  role_id number,
  role varchar2(128)
);

-- Consulta de los roles en dba_roles
insert into emanuel0104.t02_db_roles (role_id, role)
  select role_id, role from dba_roles;

-- Creación de tabla que almacenará los privilegios de DBA
create table emanuel0104.t03_dba_privs (
  privilege varchar2(128)
);

-- Consulta de los privilegios del rol DBA
insert into emanuel0104.t03_dba_privs (privilege)
  select privilege from dba_sys_privs;