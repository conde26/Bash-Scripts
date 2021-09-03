#!/bin/bash
#Autor: Jose Conde
#Script detectar S.O

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
	echo "${Amarillo}[!] ${Rojo}Saliendo...${Normal}"
	exit 1
}

#Variable con Ip y ttl
ip="$1"
ttl=$(ping -c 1 $1 2> /dev/null | awk  NR==2 | tr ' ' ',' | awk '{print $6}' FS=',' |  awk '{print $2}' FS='=') 

#Función de panel de ayuda
PanelAyuda(){
      echo -e "\n${Verde}[!] Uso: ${Amarillo}./OSAnalizer.sh <<ip-address>> ${Normal}\n"
}

#Función comparando ttl
ttl(){
if [ $ttl -ge 0 -a $ttl -le 64 ]; then
    echo -e "\n${Verde}[*] ${Amarillo}Equipo $ip (TTL $ttl) -> Equipo ${Rosa}Linux${Normal}\n"
elif [ $ttl -ge 65 -a $ttl -le 128 ]; then
    echo -e "\n${Verde}[*] ${Amarillo}Equipo $ip (TTL $ttl) -> Equipo ${Rosa}Windows${Normal}\n"
else
    clear && echo -e "\n${Verde}[!] ${Rojo}Not Found${Normal}\n"
fi
}

#Condicional para argunmentos
if [ $# -lt 1 ]; then
   PanelAyuda
else
   ttl
fi
