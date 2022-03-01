# Escaner de puertos en bash
## Autor: Jose Conde 

### Panel de ayuda 
Para ver el panel de ayuda solo es necesario llamar a si mismo al script.
```bash 
./ScannerPort
```
![Panel Ayuda](https://github.com/conde26/Bash-Scripts/blob/main/Escaner%20de%20Puertos/imagenes/Panel_Ayuda.PNG)

### Escaneo de Ip
Para hacer un escaneo básico de la ip, solo es necesario indicar la opción -i, para indicar la ip a escanear
```bash 
./ScannerPort -i 127.0.0.1
```
![Escaneo IP 1](https://github.com/conde26/Bash-Scripts/blob/main/Escaner%20de%20Puertos/imagenes/Escaneo_IP.PNG)

### Escaneo de Ip exportando datos 
Para hacer un escaneo exportando las evidencias agregamos el parametro -o e indicamos un nombre al fichero de salida
```Bash
./ScannerPort -i 127.0.0.1 -o Puertos_Abiertos
```
![Escaneo IP 2](https://github.com/conde26/Bash-Scripts/blob/main/Escaner%20de%20Puertos/imagenes/Escaneo_IP_Exportando.PNG)
Terminado el proceso de escaneo, podemos ver el fichero con los puertos abiertos
![datos](https://github.com/conde26/Bash-Scripts/blob/main/Escaner%20de%20Puertos/imagenes/datos.PNG)
