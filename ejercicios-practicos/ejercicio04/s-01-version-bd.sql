--@Author:          Emanuel Flores Martínez
--@Fecha creación:  03/Marzo/2021
--@Descripción:     Script para consultar la versión de la BD

-- Creación de usuario
create user emanuel0104 identified by emanuel quota unlimited on users;

-- Creación de tabla en usuario emanuel0104
create table emanuel0104.t01_db_version (
  product varchar2(100),
  version varchar2(50),
  version_full varchar2(50)
);

-- Consulta a la vista product_component_version
insert into emanuel0104.t01_db_version (product, version, version_full)
  select product, version, version_full
  from product_component_version;


