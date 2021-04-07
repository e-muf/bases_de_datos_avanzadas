--@Author:          Emanuel Flores Martínez
--@Fecha creación:  03/Abril/2021
--@Descripción:     Script para obtener parámetros de v$system_parameter

connect sys/system2 as sysdba

create table emanuel0204.t02_other_parameters as
  select num, name, value, default_value, 
    isses_modifiable as is_session_modifiable,
    issys_modifiable as is_system_modifiable
  from v$system_parameter;
