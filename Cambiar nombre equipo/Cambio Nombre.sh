#!/bin/bash
#Autor: Jose Conde
#Script para cambiar nombre equipo en Linux

#Paletilla de colores
Amarillo="\e[93m"
Rosa="\e[95m"
Normal="\e[m"
Verde="\e[32m"
Rojo="\e[91m"

#Función Ctrl + c
trap ctrl_c iNT

ctrl_c(){
	clear
	echo "${Amarillo}[!] ${Rojo}Has cancelado la ejecución del Script $0 ${Normal}"
	exit 1
}

#Variable hostname antiguo
nombre_antiguo=$(hostname)
echo "${Verde}[!] ${Amarillo}El nombre de tu equipo es:${Rosa} $nombre_antiguo${Normal}\n"

#Codigo para cambiar nombre equipo
echo "${Verde}[?] ${Amarillo}Nombre nuevo para el PC: ${Rosa}" | tr -d '\n'
read nombre_nuevo

#Comandos cambio nombre 
hostname $nombre_nuevo
hostnamectl set-hostname $nombre_nuevo

#Sustituir hostname en /etc/hosts
sed -i "s/$nombre_antiguo/$nombre_nuevo/g" /etc/hosts

#Comprobaciones
sleep 1 && clear
echo "${Verde}[*] ${Amarillo}Comprobamos el fichero /etc/hosts y el nombre del equipo${Normal}"
echo "\n${Amarillo}El nombre nuevo es:${Normal} $(hostname)\n\n"
echo "${Amarillo}Contenido del fichero /etc/hosts${Normal}"
cat /etc/hosts && echo "\n"

#Aplicar cambios reiniciando equipo con condicional if
echo "${Verde}[?] ${Amarillo}Quieres ${Rojo}reinciar${Amarillo} el equipo para aplicar cambios (s/n): ${Normal}" | tr -d '\n'
read respuesta

if [ $respuesta = "s" ]; then
	echo "${Amarillo}Vamos a ${Rojo}reinciar${Amarillo} el equipo en 2 segundos${Normal}"
	sleep 2 && reboot
else
	clear && echo "${Verde}[!] ${Amarillo}Hasta Pronto!${Normal}"
fi

