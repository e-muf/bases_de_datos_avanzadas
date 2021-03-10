--@Author:          Emanuel Flores Martínez
--@Fecha creación:  08/Marzo/2021
--@Descripción:     Script para consultar la versión de la BD

-- esta instrucción permite detener la ejecución del script al primer error
-- útil para detectar errores de forma rápida.
-- al final del script se debe invocar a whenever sqlerror continue none
-- para regresar a la configuración original
whenever sqlerror exit rollback;

-- para propósitos de pruebas y propósitos académicos se incluye el password
-- no hacer esto en sistemas reales.
prompt conectando como usuarios sys
connect sys/system1 as sysdba

declare
  v_count number;
  v_username varchar2(20) := 'EMANUEL0104';
begin
  select count(*) into v_count
  from all_users
  where username = v_username;

  if v_count > 0 then
    execute immediate 'drop user ' || v_username || ' cascade';
  end if;
end;
/

prompt creando al usuario EMANUEL0104
create user emanuel0104 identified by emanuel quota unlimited on users;
grant create session, create table to emanuel0104;

-- Creación de una tabla a patir de la vista
-- se almacenará la version de la base de datos
create table emanuel0104.t01_db_version as
  select product, version, version_full
  from product_component_version;

-- Verificando que se creo correctamente la tabla
set linesize 500
col product format a40
col version format a20
col version_full format a20

select product, version, version_full
from emanuel0104.t01_db_version;

