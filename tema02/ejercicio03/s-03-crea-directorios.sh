# @Autor Emanuel Flores Martínez
# @Fecha 18/03/2021
# @Descripcion  Script para crear la estructura para poder ejecutar create database

export ORACLE_SID=efmbda2

# Crear directorios
mkdir -p /u01/app/oracle/oradata/${ORACLE_SID^^}
mkdir -p /u02/app/oracle/oradata/${ORACLE_SID^^}
mkdir -p /u03/app/oracle/oradata/${ORACLE_SID^^}

# Cambiar dueño y grupo a subdirectorios
chown oracle:oinstall /u01/app/oracle/oradata/${ORACLE_SID^^}
chown -R oracle:oinstall /u02/*
chown -R oracle:oinstall /u03/*

# Cambiar permisos de los subdirectorios
chmod 754 /u01/app/oracle/oradata/${ORACLE_SID^^}
chmod 754 /u02/app/oracle/oradata/${ORACLE_SID^^}
chmod 754 /u03/app/oracle/oradata/${ORACLE_SID^^}