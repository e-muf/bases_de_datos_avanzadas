--@Author:          Emanuel Flores Martínez
--@Fecha creación:  18/Marzo/2021
--@Descripción:     Script para consultar la versión de la BD

prompt conectando como usuarios sys
connect sys/hola1234* as sysdba

startup nomount

create spfile from pfile;

!ls $ORACLE_HOME/dbs/spfileefmbda2.ora