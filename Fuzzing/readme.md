# Fuzzing con curl 

- [Explicación](#explicación) 
- [Instalación](#instalación)
- [Uso](#uso)  


### Explicación
Como ya sabemos, cuando estamos realizando auditorias web, tiramos de herramientas como pueden ser gobuster, dirb, ffuf, wfuzz, etc. En esta ocación he creado esta pequeña herramienta en bash, que nos permite realizar la misma acción que los binarios que nombramos antes. Este no permite trabajar con hilos, pero no hace tanto ruido como las dichas. 

### Instalación 
Para instalar la siguiente herramienta, usaremos la siguiente cadena de comandos. 
```bash 
sudo wget -q https://raw.githubusercontent.com/conde26/Bash-Scripts/main/Fuzzing/fuzzer.sh -o /usr/bin/fuzzer.sh 
sudo chmod +x fuzzer.sh
```

### Uso 
En primer lugar, si ejecutamos el binario sin ningún parámetro nos mostrará el panel de ayuda. 
```bash 
./fuzzer.sh 
```
![HelpPanel](https://github.com/conde26/Bash-Scripts/blob/main/Fuzzing/images/helpPanel.png)

Ahora que sabemos que utiliza dos parámetros vamos a indicar el host y el diccionario. 
```bash 
./fuzzer.sh -h hackme.local -w /usr/share/wordlist/rockyou.txt
```
![uso](https://github.com/conde26/Bash-Scripts/blob/main/Fuzzing/images/Use.png)


