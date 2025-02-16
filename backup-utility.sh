#!/bin/bash

# Directorio de origen que deseas respaldar
origen="/home/kali/bash-course"

# Directorio de destino donde se almacenarán las copias de seguridad
destino="/home/kali/Backup-Utility/backup"

# Nombre del archivo de copia de seguridad con marca de tiempo
archivo_destino="$destino/backup_$(date +\%Y\%m\%d_\%H\%M\%S).tar.gz"

# Comprimir y copiar los archivos de origen al directorio de destino
tar -czvf "$archivo_destino" "$origen"

# Comprobar si la copia de seguridad se realizó con éxito
if [ $? -eq 0 ]; then
  echo "Copia de seguridad exitosa en $archivo_destino"
else
  echo "Error al realizar la copia de seguridad."
fi

#Copiar el archivo al servidor de copias de seguridad en la ip asignada
#Se monto una maquina virtual de ubuntu a la cual se le instalo y configuro
#vsftpd
curl -T "$archivo_destino" -u ubuntu:ubuntu ftp://192.168.31.34/

