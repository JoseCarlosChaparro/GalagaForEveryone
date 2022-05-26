# Galaga For Everyone
## Un acercamiento al juego para todos

Processing             |  Unreal Engine | XAMPP
:-------------------------:|:-------------------------:|:-------------------------:
![Processing3](https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Processing_3_logo.png/240px-Processing_3_logo.png) | ![Unreal](https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/UE_Logo_Black_Centered.svg/220px-UE_Logo_Black_Centered.svg.png)  | ![Xampp](https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Xampp_logo.svg/320px-Xampp_logo.svg.png)

Con este proyecto se busca facilitar o acercar un poco a los desarrolladores a herramientas utiles para el desarrollo de 
videojuegos utilizando un dispositivo móvil como controlador. 📱🎮

## Arquitectura del proyecto

![ArquitecturaProyecto](https://github.com/JoseCarlosChaparro/GalagaForEveryone/blob/main/Imagenes/Arquitectura-removebg-preview.png?raw=true)

## Instalación

- Instalar Unreal Engine
- Añadir la API Remote Control del editor de Unreal Engine
- Instalar Xampp
- Instalar Processing 3

Para instalar Unreal Engine debe tener instalado el lanzador de [Epic Games][unrealLink],
específicamente para este proyecto se utilizó la versión 4.27


> En el lanzador de Epic Games
> encontrará una pestaña dedicada 
> a Unreal Engine, donde puede 
> instalar la versión que desee

Una vez instalada la versión 4.27 de Unreal engine, puede abrir el directamente el proyecto de este repositorio
o puede crear uno en blanco.

> Para instalar la API Web Remote se accede en la pestaña "editar" una vez abiero el editor de Unreal,
> luego se busca la pestaña "plugins" y en esta pestaña puede buscar la API Remote Control
> marca la casilla "enable" y le pedirá que reinicie el editor

Con esto la API funciona en el host local, esto es, el mismo dispositivo que ejecuta Unreal.
Para abrir el control del editor a la red local es necesario actualizar el archivo de configuración del Unreal.
El archivo se encuentra en la carpeta de configuración en el directorio donde está instalado Unreal, por defecto
ser vería de la siguiente manera:
> "C:\Program Files\Epic Games\UE_4.27\Engine\Config\BaseEngine.ini"

En este archivo es necesario agregar las siguientes linas de codigo:

> [HTTPServer.Listeners]
> DefaultBindAddress=0.0.0.0

Una vez configurado el Unreal, utilizaremos Xampp para abrir el servidor que permita la conexión en el área local.
Puede descargar la última version de Xampp que sea compatible con su computadora desde este enlace [Xampp][xamppEnlace].

Una vez instalado lo anterior, puede continuar con la instalación de Processing. Para este proyecto se utilizó la versión 3.5.4.
Puede instalar la versión compatible de Processing con su dispositivo desde el siguiente enlace [Processing][procEnlace]
Una vez instalado Processing es necesario considerar instalar las librerías propias de Processing utilizadas para este proyecto:

- Ketai
- oscP5
- Websockets

Puede instalarlas desde la pestaña herramientas de Processing. A continuación para la parte de android es necesario instalar el modo Android de Processing. Esto se hace desde la pestaña añadir herramienta, luego en modos, ahí encontrará el modo Android.

> Nota: Para compilar el archivo de processing en Android necesita activar el modo Debug del dispositivo y conectarlo al ordenador

## Uso

Una vez cumplidos los requisitos puede proceder con el uso del proyecto.

Para comenzar

- Abre el proyecto de Unreal Engine (es el archivo con nombre "GalagaForEveryone.uproject")
- Ejecuta Xampp y arranca el servicio Apache
- Abre los dos archivos de processing
- Ejecuta el de pc en modo Java
- Ejecuta el de android en modo Android con el dispositivo conectado mediante USB para instalar la app
-Presiona la tecla espacio en la app de pc de processing para comenzar.
- Por último da play en Unreal.
- Y a jugar!!!


## Proyecto Unreal

A continuación de muestra el enlace para descargar el proyecto Unreal

| Google Drive | [Archivo zip del proyecto][UnrealEnlace] |
| ------ | ------ |


   [procEnlace]: <https://processing.org/download>
   [xamppEnlace]: <https://www.apachefriends.org/es/download.html>
   [UnrealEnlace]: <https://drive.google.com/file/d/145v9M007WQ7amIzZcEqCKoZuR-CWaxRu/view?usp=sharing>
   
