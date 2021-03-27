--@Author:          Emanuel Flores Martínez
--@Fecha creación:  09/Marzo/2021
--@Descripción:     Script para crear usuarios de administración

prompt conectando con usuario sys
connect sys/Hola1234# as sysdba

declare
  v_count number;
  v_username varchar2(20) := 'EMANUEL0105';
begin
  select count(*) into v_count
  from all_users
  where username = v_username;

  if v_count > 0 then
    execute immediate 'drop user ' || v_username || ' cascade';
  end if;
end;
/

declare
  v_count number;
  v_username varchar2(20) := 'EMANUEL0106';
begin
  select count(*) into v_count
  from all_users
  where username = v_username;

  if v_count > 0 then
    execute immediate 'drop user ' || v_username || ' cascade';
  end if;
end;
/

-- Creación de usuarios emanuel0105 y emanuel0106
create user emanuel0105 identified by emanuel quota unlimited on users;
create user emanuel0106 identified by emanuel quota unlimited on users;

-- Otorgando permisos para que puedan crear sesión
grant create session to emanuel0105, emanuel0106;

-- Asignar roles de administración a los usuarios
grant sysdba to emanuel0104;
grant sysoper to emanuel0105;
grant sysbackup to emanuel0106;