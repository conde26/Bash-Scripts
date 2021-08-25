#!/bin/bash
#Autor: Jose Conde
#Script para crear grupos Linux

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

#Código para crear grupo
clear && echo "${Verde}[?] ${Amarillo}Quieres crear un grupo? (s/n): ${Normal}" | tr -d '\n'
read respuesta

if [ $respuesta = "s" ]; then
	echo "\n" && echo "${Verde}[?] ${Amarillo}Nombre del nuevo grupo: ${Normal}" | tr -d '\n'
	read grupo && sleep 1
	test=$(grep -oP "^$grupo" /etc/group | sort -u | wc -l)

	if [ "$test" -eq 1 ]; then
		echo "\n\n${Amarillo}[!] ${Rosa}$grupo${Rojo} ya existe en el sistema!${Normal}"
	else
		echo "\n\n${Verde}[*] ${Amarillo}Agregando el grupo: ${Rosa}$grupo${Normal}\n\n"
		sleep 2 && groupadd $grupo
		echo "${Verde}[*] ${Amarillo}El grupo ${Rosa}$grupo${Amarillo} se ha añadido al sistema ${Normal}\n\n"
		echo "\n${Verde}[?] ${Amarillo}Quieres verificar la creación del grupo? (s/n): ${Normal}" | tr -d '\n'
		read contesta

		if [ $contesta = "s" ];then
			clear && echo "\n${Verde}[!] ${Amarillo}Verificando la creación del grupo $grupo${Normal}\n"
			echo "${Verde}[!] ${Amarillo}Contenido de fichero /etc/group${Normal}\n"
			cat /etc/group | grep $grupo | tail -n 1
			echo "\n${Verde}[!] ${Amarillo}Hasta pronto!${Normal}"
		else
			clear && echo "${Verde}[!] ${Amarillo}Ok, hasta pronto!${Normal}"
		fi
	fi
else
	clear && echo "${Verde}[!]${Amarillo} Espero que te haya ayudado!${Normal}"
fi
