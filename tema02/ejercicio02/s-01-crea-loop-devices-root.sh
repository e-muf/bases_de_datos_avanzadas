# @Autor Emanuel Flores Martínez
# @Fecha 14/03/2021
# @Descripcion Script para crear y montar loop devices

# crear carpeta unam-bda y cambiarse a esta
if ! [ -d /unam-bda ]; then
  mkdir /unam-bda
fi;
cd /unam-bda

# crear archivos para que sean loop devices
dd if=/dev/zero of=disk2.img bs=100M count=10
dd if=/dev/zero of=disk3.img bs=100M count=10

# comprobar la creación de los archivos 
du -sh disk*.img

# crear loopdevice asociado a los archivos anteriores
losetup -fP disk2.img
losetup -fP disk3.img

# confirmar la creación del loop device
losetup -a

# dar formato a los archivos creados
mkfs.ext4 disk2.img
mkfs.ext4 disk3.img 

# crear los el directorio donde seran montados los archivos
mkdir /u02
mkdir /u03