--@Author:          Emanuel Flores Martínez
--@Fecha creación:  03/Abril/2021
--@Descripción:     Script para restaurar parametros por anteriores

connect sys/system2 as sysdba

prompt deteniendo la instancia
shutdown immediate

prompt iniciando en modo nomount
startup nomount pfile='/unam-bda/ejercicios-practicos/t0204/e-02-spparameter-pfile.txt'

prompt creando spfile
create spfile 
  from pfile='/unam-bda/ejercicios-practicos/t0204/e-02-spparameter-pfile.txt';

prompt iniciando instancia
shutdown immediate
startup
