#!/bin/bash
#Autor: Conde

#Colours
Verde="\e[0;32m\033[1m"
Normal="\033[0m\e[0m"
Rojo="\e[0;31m\033[1m"
Azul="\e[0;34m\033[1m"
Amarillo="\e[0;33m\033[1m"

#Exit ctrl + c
trap ctrl_c INT

ctrl_c(){
        clear
        echo -e "\n${Amarillo}[-]${Rojo} Saliendo... ${Normal}"
        exit 1
}

#Parameters
while getopts "h:w:" opc; do
    case $opc in
        h) host=$OPTARG ;;
        w) dic=$OPTARG ;;
    esac
done

#Main
fuzz(){
echo -e "${Azul}[+] Target: ${Normal}$host"
echo -e "${Azul}[*] Diccionary: ${Normal}${dic-/usr/share/rockyou.txt}\n"
for i in $(cat ${dic:-/usr/share/rockyou.txt}); do
    estado=$(curl -s -L -w "%{http_code}\n" http://$host/$i -o /dev/null &)

    if [[ $estado -eq 200 ]]; then
        echo -e "\t${Amarillo}[*] $i${Normal} (Reply: ${Verde}$estado${Normal})"
    fi
    sleep 0.5
done }

#Help Panel
helpPanel(){
    echo -e "\n${Verde}[?] Uso: $0 -h <host> -w <diccionary>\n"
    echo -e "\t${Azul}-h) Host (ej. 127.0.0.1)"
    echo -e "\t${Azul}-w) Diccionary (ej. /usr/share/worlist/rockyou.txt)${Normal}"
    exit 0
}

#Arguments
[[ $# -eq 0 ]] && helpPanel || fuzz
