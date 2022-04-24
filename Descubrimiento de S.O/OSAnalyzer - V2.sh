#!/bin/bash
#Autor: Jose Conde
#Script detectar S.O - V2

#Paletilla de colores
Amarillo="\e[93m"
Rosa="\e[95m"
Normal="\e[m"
Verde="\e[32m"
Rojo="\e[91m"

#Función Ctrl + c
trap ctrl_c INT

ctrl_c(){
        clear
        echo "${Amarillo}[!] ${Rojo}Saliendo...${Normal}"
        exit 1
}

#variable
ttl=$(timeout 1 ping -c 1 $1 2>/dev/null | grep -oP "ttl=\d{1,3}" | awk '{print $2}' FS='=')

## TTL
ttl(){
        if [ $ttl -le 64 ]; then
                echo -e "\n${Verde}[*] ${Amarillo}Equipo $1 (TTL $ttl) -> ${Rosa}Linux${Normal}\n"
        elif [ $ttl -ge 65 ] && [ $ttl -le 128 ]; then
                echo -e "\n${Verde}[*] ${Amarillo}Equipo $1 (TTL $ttl) -> ${Rosa}Windows${Normal}\n"
        else
                echo -e "\n${Rojo}[-] No response\n"
                echo -e "\t[-] Maybe Firewall is ON"
                echo -e "\t[-] Host maybe is down"
                echo -e "\t[-] Unkown S.O${Normal}"
        fi 2>/dev/null
}

#Argumentos
[ $1 ] && ttl $1 || echo -e "\n${Verde}[!] Uso: ${Amarillo}./OSAnalizer.sh <target> ${Normal}\n"