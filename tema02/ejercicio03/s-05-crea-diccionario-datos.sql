--@Author:          Emanuel Flores Martínez
--@Fecha creación:  19/Marzo/2021
--@Descripción:     Script para la creación del diccionario de datos

connect sys/system2 as sysdba

@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

connect system/system2

@?/sqlplus/admin/pupbld.sql