--@Author:          Emanuel Flores Martínez
--@Fecha creación:  03/Marzo/2021
--@Descripción:     Script para crear usuarios de administración

-- Conectando con el usuario emanuel0104
connect emanuel0104/emanuel;

-- Creación de tabla my_schema
create table t04_my_schema (
  username varchar2(128),
  schema_name varchar2(128)
);

-- Otorgando privilegios para acceder a la tabla
-- a los usuarios con privilegios de administración
grant insert on t04_my_schema to public, sysbackup;

insert into t04_my_schema (username, schema_name)
  select 






