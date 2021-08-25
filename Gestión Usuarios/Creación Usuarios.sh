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
clear && echo "${Verde}[?] ${Amarillo}Quieres crear un usuario? (s/n): ${Normal}" | tr -d '\n'
read respuesta

if [ $respuesta = "s" ]; then
	echo "\n" && echo "${Verde}[?] ${Amarillo}Nombre del nuevo usuario: ${Normal}" | tr -d '\n'
	read usuario && sleep 1
	test=$(grep -oP "^$usuario" /etc/passwd | sort -u | wc -l)

	if [ "$test" -eq 1 ]; then
		echo "\n\n${Amarillo}[!] ${Rosa}$usuario${Rojo} ya existe en el sistema!${Normal}"
	else
		echo "\n\n${Verde}[*] ${Amarillo}Agregando el usuario: ${Rosa}$usuario${Normal}\n\n"
		adduser $usuario
		echo "\n\n${Verde}[*] ${Amarillo}El usuario ${Rosa}$usuario${Amarillo} se ha añadido al sistema ${Normal}\n"
		echo "${Verde}[?] ${Amarillo}Quieres verificar la creación del usuario? (s/n): ${Normal}" | tr -d '\n'
                read contesta

                if [ $contesta = "s" ];then
                        clear && echo "\n${Verde}[!] ${Amarillo}Verificando la creación del usuario:${Rosa} $usuario${Normal}\n"
                        echo "${Verde}[!] ${Amarillo}Contenido de fichero /etc/passwd${Normal}\n"
                        cat /etc/passwd | grep $usuario | tail -n 1
                        echo "\n${Verde}[!] ${Amarillo}Hasta pronto!${Normal}"
                else
                        clear && echo "${Verde}[!] ${Amarillo}Ok, hasta pronto!${Normal}"
                fi


	fi
else
	clear && echo "${Verde}[!]${Amarillo} Espero que te haya ayudado!${Normal}"
fi
