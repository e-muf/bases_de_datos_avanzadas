# @Autor Emanuel Flores Martínez
# @Fecha 26/02/2021
# @Descripcion Script para descargar y comprimir imágenes

# parámetros
# proteger nuestro programas (shell injection)
archivoImagenes="${1}"
numImagenes="${2}"
archivoZip="${3}"

#
# Función que se encarga de mostrar el contenido de el archivo
# s-02-ayuda.sh y terminar la ejecución en caso de encontrar un error
#
function ayuda(){
  status="${1}"
  cat s-02-ayuda.sh
  exit "${status}"
}

# Validar parámetros de entrada
if [ -z "${archivoImagenes}" ]; then
  echo "[-] ERROR: El nombre del archivo de imágenes es obligatorio"
  ayuda 100
elif ! [ -f "${archivoImagenes}" ]; then
  echo "[-] ERROR: El archivo ${archivoImagenes} no existe"
  ayuda 101
fi;

# Validar el número de imagenes
# =~ -> Expresión regular 
if ! [[ "${numImagenes}" =~ [0-9]+ && "${numImagenes}" -gt 0 &&
  "${numImagenes}" -le 90 ]]; then
    echo "[-] ERROR: El número de imagenes ${numImagenes} es inválido"
    ayuda 102
fi;

# Validar el parámetro 3. Si se especifica, verificar que exista el directorio
if [ -n "${archivoZip}" ]; then
  # extraer la ruta del archivo zip
  dirSalida=$(dirname "$archivoZip")
  nombreZip=$(basename "$archivoZip")
  if ! [ -d "${dirSalida}" ]; then
    echo "[-] ERROR: El directorio ${dirSalida} no existe"
    ayuda 103
  fi;
else
  dirSalida="/tmp/${USER}/imagenes"
  mkdir -p "${dirSalida}"
  nombreZip="imagenes-$(date '+%Y-%m-%H-%M-%S').zip"
fi;

echo "Parámetros correctos, obteniendo imágenes..."
# limpiar el directorio en caso de no estar vacío 
rm -rf "${dirSalida}"/"${nombreZip}"

# Leer el contenido del archivo que contiene la lista de imágenes
# que se van a descargar
count=1
while read -r linea
do
  wget -q -P "${dirSalida}" "${linea}"
  # valida el código de salida de wget
  status=$?
  if ! [ ${status} -eq 0 ]; then
    echo "[-] ERROR: No se pudo obtener el archivo de ${linea}"
    ayuda 104
  fi;

  if [ ${count} -ge ${numImagenes} ]; then
    break;
  fi;

  # Evalua la expresión aritmética y lo asigna a count
  count=$((count+1))

done < "${archivoImagenes}"

# Generando archivo zip
export IMG_ZIP_FILE="${dirSalida}"/"${nombreZip}"

zip -j ${IMG_ZIP_FILE} "${dirSalida}"/*.jpg

# eliminando imagenes descargadas
rm -rf "${dirSalida}"/*.jpg

# cambiando permisos
chmod 700 "${IMG_ZIP_FILE}"

# Generando archivo s-00-lista-archivos.txt
# -Z nombre de los archivos sin ruta
# -l listar sin descomprimir
unzip -Z1 "${IMG_ZIP_FILE}" > "${dirSalida}"/s-00-lista-archivos.txt

 
