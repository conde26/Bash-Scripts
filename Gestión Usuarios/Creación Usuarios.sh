#!/bin/bash
#Autor: Jose Conde
#Script para crear usuarios Linux

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

#Código para crear usuario
clear && echo "${Amarillo}Quieres crear un usuario? (s/n): ${Normal}" | tr -d '\n'
read respuesta

if [ $respuesta = "s" ]; then
	echo "${Amarillo}Nombre del nuevo usuario: ${Normal}" | tr -d '\n'
	read usuario && sleep 1
	test=$(grep $usuario /etc/passwd | awk '{print $1}' FS=':' | wc -l)

	if [ "$test" -eq 1 ]; then
		echo "\n\n${Amarillo}[!] ${Rosa}$usuario${Rojo} ya existe en el sistema!${Normal}"
	else
		echo "\n\n${Verde}[*] ${Amarillo}Agregado el usuario: ${Rosa}$usuario${Normal}\n\n"
		adduser $usuario
		echo "\n\n${Verde}[*] ${Amarillo}El usuario ${Rosa}$usuario${Amarillo} se ha añadido al sistema ${Normal}"
	fi
else
	clear && echo "${Verde}[!]${Amarillo} Espero que te haya ayudado${Normal}!"
fi


