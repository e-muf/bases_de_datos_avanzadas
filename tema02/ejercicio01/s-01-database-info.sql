--@Author:          Emanuel Flores Martínez
--@Fecha creación:  12/Marzo/2021
--@Descripción:     Script para consultar la versión de la BD

prompt conectando como usuarios sys
connect sys/system1 as sysdba

declare
  v_count number;
  v_username varchar2(20) := 'EMANUEL0201';
begin
  select count(*) into v_count
  from all_users
  where username = v_username;

  if v_count > 0 then
    execute immediate 'drop user ' || v_username || ' cascade';
  end if;
end;
/

create user emanuel0201 identified by emanuel quota unlimited on users;

create table emanuel0201.database_info (
  instance_name varchar2(16),
  db_domain varchar2(20),
  db_charset varchar2(15),
  sys_timestamp varchar2(40),
  timezone_offset varchar2(10),
  db_block_size_bytes number(5,0),
  os_block_size_bytes number(5,0),
  redo_block_size_bytes number(5,0),
  total_components number(5,0),
  total_components_mb number(10,2),
  max_component_name varchar2(30),
  max_component_desc varchar2(64),
  max_component_mb number(10,0)
);

insert into emanuel0201.database_info (
  instance_name,
  db_domain,
  db_charset,
  sys_timestamp,
  timezone_offset,
  db_block_size_bytes,
  os_block_size_bytes,
  redo_block_size_bytes,
  total_components,
  total_components_mb,
  max_component_name,
  max_component_desc,
  max_component_mb
) values(
  (select instance_name from v$instance),
  (select value from v$parameter where name='db_domain'),
  (select value from nls_database_parameters where parameter='NLS_CHARACTERSET'),
  (select systimestamp from dual),
  (select tz_offset((select sessiontimezone from dual)) from dual),
  (select value from v$parameter where name='db_block_size'),
  4096, -- os_block_size_bytes 4096
  (select distinct blocksize from v$log), -- redo_block_size_bytes
  (select count(*) from v$sysaux_occupants),
  (select round(sum(space_usage_kbytes)/1024,2) from v$sysaux_occupants),
  (select occupant_name from v$sysaux_occupants where space_usage_kbytes = (
    select max(space_usage_kbytes) from v$sysaux_occupants)),
  (select occupant_desc from v$sysaux_occupants where space_usage_kbytes = (
    select max(space_usage_kbytes) from v$sysaux_occupants)),
  (select max(space_usage_kbytes) from v$sysaux_occupants)
);

prompt mostrando datos parte 1
set linesize window

col db_domain format a13

select instance_name, db_domain, db_charset, sys_timestamp, timezone_offset
from emanuel0201.database_info;

prompt mostrando datos parte 2

select db_block_size_bytes,os_block_size_bytes,redo_block_size_bytes,
  total_components,total_components_mb
from emanuel0201.database_info;

prompt mostrando datos parte 3

col max_component_name format a20
col max_component_desc format a20

select max_component_name,max_component_desc,max_component_mb
from emanuel0201.database_info;
