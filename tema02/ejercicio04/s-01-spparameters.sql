--@Author:          Emanuel Flores Martínez
--@Fecha creación:  03/Abril/2021
--@Descripción:     Script para obtener parámetros con create pfile

prompt conectando con usuarios sys
connect sys/system2 as sysdba

-- Creando pfile con los parametros del spfile
create pfile='/unam-bda/ejercicios-practicos/t0204/e-02-spparameter-pfile.txt'
from spfile;

-- Bloque anónimo para eliminar usuario en caso de que exista
declare
  v_count number;
  v_username varchar2(20) := 'EMANUEL0204';
begin
  select count(*) into v_count
  from all_users
  where username = v_username;

  if v_count > 0 then
    execute immediate 'drop user ' || v_username || ' cascade';
  end if;
end;
/

prompt creando usuario emanuel0204
create user emanuel0204 identified by emanuel quota unlimited on users;

grant create session, create table, create sequence, create procedure
to emanuel0204;

create table emanuel0204.t01_spparameters as
  select name, value from v$spparameter
  where value is not null;

/**
Sección de preguntas y respuestas:

1. Observar que los parámetros mostrados en el archivo e-02-spparameter-pfile.txt
tienen 2 formatos: algunos inician con <oracle_sid>.__ y otros inician con *.
¿Qué diferencia existe entre estos 2 grupos?

Respuesta:

Los paramétros que inician con * son los que nosotros configuramos en el pfile
antes de la creación de la base de datos, mientras que los que inician con
<oracle_sid>.__ son los parametrós que se tenían configurados por defecto.

===============================================================================

2. Comparar los 2 archivos e-01-spparameter-alert-log.txt y 
e-02-spparameter-pfile.txt así como el contenido de la tabla t01_spparameters.
Cofirmar que en los 3 casos, existen los mismos parámetros con los mismos
valores. De encontrar diferencias mencionarlas.

Respuesta:

Los valores tanto en los archivos como en la tabla son exactamente los mismos,
la única diferencia es que en los archivos se muestra el parámetro 
memory_target en megabytes mientras que en la tabla se muestra en bytes.

*/