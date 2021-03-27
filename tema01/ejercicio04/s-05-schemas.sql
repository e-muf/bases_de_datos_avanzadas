--@Author:          Emanuel Flores Martínez
--@Fecha creación:  09/Marzo/2021
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

prompt insertando con emanuel0104 as sysdba
connect emanuel0104/emanuel as sysdba;

insert into emanuel0104.t04_my_schema values (
  sys_context('USERENV', 'CURRENT_USER'),
  sys_context('USERNEV', 'CURRENT_SCHEMA')
);

-- Conectando con el usuario emanuel0105 con sysoper
prompt insertando con emanuel0105 as sysoper
connect emanuel0105/emanuel as sysoper;

insert into emanuel0104.t04_my_schema values (
  sys_context('USERENV', 'CURRENT_USER'),
  sys_context('USERNEV', 'CURRENT_SCHEMA')
);

-- Conectando con el usuario emanuel0106 con sysbackup
prompt insertando con emanuel0106 as sysbackup
connect emanuel0106/emanuel as sysbackup;

insert into emanuel0104.t04_my_schema values (
  sys_context('USERENV', 'CURRENT_USER'),
  sys_context('USERNEV', 'CURRENT_SCHEMA')
);

commit;

connect sys/Hola1234# as sysdba

-- Consultado la vista del archivo de passwords
col username format a15
col last_login format a40

select username, sysdba, sysoper, sysbackup, last_login
from v$pwfile_users;

-- Actualizando contraseña del usuario sys
alter user sys identified by system1;