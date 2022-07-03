#!/bin/bash
#Autor: Conde

#Colours
Verde="\e[0;32m\033[1m"
Normal="\033[0m\e[0m"
Rojo="\e[0;31m\033[1m"
Azul="\e[0;34m\033[1m"
Amarillo="\e[0;33m\033[1m"


#Función Ctrl + c
trap ctrl_c iNT

ctrl_c(){
	clear
	echo -e "${Amarillo}[-]${Rojo} Saliendo... ${Normal}"
	exit 1
}


#Opciones del scripts
while getopts "i:o:h" opciones; do
	case $opciones in
		i)
			ip=$OPTARG ;;
		o)
			salida=$OPTARG
			echo -e "\t\t\t\tPuertos Abiertos \n" > $salida;;
		h)
			echo -e "\n${Verde}[*] ${Amarillo}Uso: $0 -i <ip-address>${Normal}"
			echo -e "\n${Verde}[*] ${Amarillo}Parametros: ${Normal}"
			echo -e "\t${Verde} -i=Dirección ip"
			echo -e "\t${Verde} -o=Fichero de salida"
			echo -e "\t${Verde} -h=Muestra este panel ${Normal}"
			exit 0 ;;
		?)
			echo -e "${Amarillo}[-] ${Rojo}Opcion no valida, usa -h para mostrar el panel de ayuda${Normal}"
			exit 1;;
	esac
done

#Control de parametros
if [ $(echo $#) -eq 0 ]; then
	./$0 -h && exit 1
fi

#Bucle para verificar puertos
for puerto in $(seq 1 65535); do
	if [ $salida ]; then
		timeout 1 bash -c "echo '' > /dev/tcp/$ip/$puerto" 2>/dev/null && echo -e "${Verde}[*] ${Amarillo}Puerto $puerto - ${Verde}Abierto${Normal}" && echo -e "$puerto" >> $salida &
	else
		timeout 1 bash -c "echo '' > /dev/tcp/$ip/$puerto" 2>/dev/null && echo -e "${Verde}[*] ${Amarillo}Puerto $puerto - ${Verde}Abierto${Normal}" &
	fi
done; wait
