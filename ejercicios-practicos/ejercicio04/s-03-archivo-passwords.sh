# @Author:          Emanuel Flores Martínez
# @Fecha creación:  09/Marzo/2021
# @Descripción:     Script para consultar la versión de la BD

backup_file=orapwefmbda1
dir_backups=/home/${USER}/backups
dir_file=${ORACLE_HOME}/dbs/${backup_file}

# Verificar si existe el directorio backups, si no crearlo
if ! [ -d ${dir_backups} ]; then
  mkdir -p ${dir_backups}
fi;

# Verificar si existe el archivo de contraseñas
if [ -f ${dir_file} ]; then

  # Verificar si no existe el respaldo
  if ! [ -f ${dir_backups}/${backup_file} ]; then
    # Se hace el respaldo del archivo
    cp ${dir_file} ${dir_backups}
  fi;

  # Se elimina el archivo original, para simular su perdida
  rm ${dir_file}
fi;

# Generar un nuevo archivo de passwords
orapwd FILE=${dir_file} format=12.2 \
  FORCE=y \
  SYS=password \
  SYSBACKUP=password




