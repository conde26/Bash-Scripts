#!/bin/bash
#Autor: Conde 
#Creación de usuarios masiva

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
	echo -e "${Amarillo}[!] ${Rojo}Has cancelado la ejecución del Script $0 ${Normal}"
	exit 1
}


#Bucle para agregar usuarios
for usuario in $(cat $1); do
	#Variables
	user=$(echo $usuario | awk '{print $1}' FS=':')
	uid=$(echo $usuario | awk '{print $2}' FS=':')
	pass=abc123.

	#Mensaje por pantalla
	echo -e "\n${Amarillo}[*] Agregando usuario $user \n ${Normal}"

	#Agregar usuario
	(echo $pass | echo $pass) | adduser $user --uid $uid &>/dev/null
	echo -e "\t${Verde}[!] Completado!${Normal}"
done
