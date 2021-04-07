--@Author:          Emanuel Flores Martínez
--@Fecha creación:  03/Abril/2021
--@Descripción:     Script para modificar parámetros de la base de datos

connect sys/system2 as sysdba

-- modificando el parámetro: nls_date_format
-- nivel: session
alter session set nls_date_format = 'dd/mm/yyyy hh24:mi:ss';

-- modificación del parámetro: db_writer_processes
-- nivel: system, scope: spfile 
alter system set db_writer_processes=2 scope=spfile;

-- modificación del parámetro: log_buffer
-- nivel: system, scope: spfile
alter system set log_buffer=10240 scope=spfile;

-- modificación del parámetro: db_files
-- nivel: system, scope: spfile
alter system set db_files=250 scope=spfile;

-- modificación del parámetro: dml_locks
-- nivel: system, scope: spfile
alter system set dml_locks=2500 scope=spfile;

-- modificación del parámetro: transactions
-- nivel: system, scope: spfile
alter system set transactions=600 scope=spfile;

-- modificación del parámetro: hash_area_size
-- nivel: session
-- nivel: system, scope=spfile
alter session set hash_area_size=2048;
alter system set hash_area_size=2048 scope=spfile;

-- modificación del parámetro: sort_area_size
-- nivel: session
alter session set sort_area_size=1024;

-- modificación del parámetro: sql_trace
-- nivel: system, scope=memory
alter system set sql_trace=true scope=memory;

-- modificación del parámetro: optimizer_mode
-- nivel: system, scope=both
alter system set optimizer_mode=FIRST_ROWS_100 scope=both;

-- modificación del parámetro: cursor_invalidation
-- nivel: session
alter session set cursor_invalidation=deferred;

-- parametros modificados en la sesión del usuario
create table emanuel0204.t03_update_param_session as
  select name,value
  from v$parameter
  where name in (
    'cursor_invalidation', 'optimizer_mode',
    'sql_trace', 'sort_area_size', 'hash_area_size', 'nls_date_format'
  )
  and value is not null;

-- parametros modificados en la instancia
create table emanuel0204.t04_update_param_instance as
  select name,value
  from v$system_parameter
  where name in ('optimizer_mode', 'sql_trace')
  and value is not null;

  -- parametros modificados en el spfile
create table emanuel0204.t05_update_param_spfile as
  select name,value
  from v$spparameter
  where name in (
    'optimizer_mode','hash_area_size', 'db_writter_processes', 
    'db_files', 'dml_locks', 'log_buffer', 'transactions'
  )
  and value is not null;


create pfile='/unam-bda/ejercicios-practicos/t0204/e-03-spparameter-pfile.txt'
from spfile;


