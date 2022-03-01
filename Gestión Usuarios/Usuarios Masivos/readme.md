# Crear usuarios de forma masiva
## Autor: Jose Conde 

### Dar permisos de ejecucción
Para ejecutar el siguiente script debemos ejecutar las siguiente instrucciones: 
```bash
chmod +x Creación_Usuarios_Masivos.sh
```
### Explicación 
Una vez que le hemos dado permisos, podremos ejecutarlo necesitaremos un fichero (csv, txt, etc) separado por dos puntos
- usuarios.txt -> Este fichero es pasado por parametro **$1**. No necesita ese nombre, puede ser cualquiera, pero los campos deben ir separados por puntos
- pass -> Por defecto la contraseña de todos los usuarios es **abc123.**. Si queremos modificarla debemos cambiar la variable **pass** o modificarla una vez creados pero a mano con la siguiente instrucción:
```bash
passwd User_Name
``` 

![Usuarios Masivos](https://github.com/conde26/Bash-Scripts/blob/main/Gesti%C3%B3n%20Usuarios/Usuarios%20Masivos/explic.PNG)
