# @Autor Emanuel Flores Martínez
# @Fecha 03/Abril/2021
# @Descripcion  Script para crear estructura de directorios

# Creación de directorios
mkdir -p /unam-bda/ejercicios-practicos/t0204

# Cambiando grupo asociado a los directorios
chown emanuel:oinstall -R /unam-bda/ejercicios-practicos/

# Cambiando permisos a las carpetas
chmod -R 774 /unam-bda/ejercicios-practicos/