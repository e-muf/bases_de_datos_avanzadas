# @Autor Emanuel Flores Martínez
# @Fecha 14/03/2021
# @Descripcion Script para crear el archivo de passwords y parámetros

# establecer valor temporal a ORACLE_SID
export ORACLE_SID=efmbda2

# crear un archivo de passwords
echo "Utilizar password: hola1234*"
orapwd FILE=${ORACLE_HOME}/dbs/orapw${ORACLE_SID} format=12.2 \
  force=y \
  sys=password

# crear archivo de parámetros
echo "
db_name=${ORACLE_SID}
control_files=(/u01/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl,
               /u02/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl,
               /u03/app/oracle/oradata/${ORACLE_SID^^}/control03.ctl)
memory_target=768M
" > ${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora





