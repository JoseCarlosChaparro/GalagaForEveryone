# Galaga For Everyone
## Un acercamiento al juego para todos

Processing             |  Unreal Engine | XAMPP
:-------------------------:|:-------------------------:|:-------------------------:
![Processing3](https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Processing_3_logo.png/240px-Processing_3_logo.png) | ![Unreal](https://github.com/JoseCarlosChaparro/GalagaForEveryone/blob/main/Imagenes/UnrealWhiteLogo.png?raw=true)  | ![Xampp](https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Xampp_logo.svg/320px-Xampp_logo.svg.png)

Con este proyecto se busca facilitar o acercar un poco a los desarrolladores a herramientas utiles para el desarrollo de 
videojuegos utilizando un dispositivo m贸vil como controlador. 馃摫馃幃

## Arquitectura del proyecto

![ArquitecturaProyecto](https://github.com/JoseCarlosChaparro/GalagaForEveryone/blob/main/Imagenes/Arquitectura-removebg-preview.png?raw=true)

## Instalaci贸n

- Instalar Unreal Engine
- A帽adir la API Remote Control del editor de Unreal Engine
- Instalar Xampp
- Instalar Processing 3

Para instalar Unreal Engine debe tener instalado el lanzador de [Epic Games][unrealLink],
espec铆ficamente para este proyecto se utiliz贸 la versi贸n 4.27


> En el lanzador de Epic Games
> encontrar谩 una pesta帽a dedicada 
> a Unreal Engine, donde puede 
> instalar la versi贸n que desee

Una vez instalada la versi贸n 4.27 de Unreal engine, puede abrir el directamente el proyecto de este repositorio
o puede crear uno en blanco.

> Para instalar la API Web Remote se accede en la pesta帽a "editar" una vez abiero el editor de Unreal,
> luego se busca la pesta帽a "plugins" y en esta pesta帽a puede buscar la API Remote Control
> marca la casilla "enable" y le pedir谩 que reinicie el editor

Con esto la API funciona en el host local, esto es, el mismo dispositivo que ejecuta Unreal.
Para abrir el control del editor a la red local es necesario actualizar el archivo de configuraci贸n del Unreal.
El archivo se encuentra en la carpeta de configuraci贸n en el directorio donde est谩 instalado Unreal, por defecto
ser ver铆a de la siguiente manera:
> "C:\Program Files\Epic Games\UE_4.27\Engine\Config\BaseEngine.ini"

En este archivo es necesario agregar las siguientes linas de codigo:

> [HTTPServer.Listeners]
> DefaultBindAddress=0.0.0.0

Una vez configurado el Unreal, utilizaremos Xampp para abrir el servidor que permita la conexi贸n en el 谩rea local.
Puede descargar la 煤ltima version de Xampp que sea compatible con su computadora desde este enlace [Xampp][xamppEnlace].

Una vez instalado lo anterior, puede continuar con la instalaci贸n de Processing. Para este proyecto se utiliz贸 la versi贸n 3.5.4.
Puede instalar la versi贸n compatible de Processing con su dispositivo desde el siguiente enlace [Processing][procEnlace]
Una vez instalado Processing es necesario considerar instalar las librer铆as propias de Processing utilizadas para este proyecto:

- Ketai
- oscP5
- Websockets

Puede instalarlas desde la pesta帽a herramientas de Processing. A continuaci贸n para la parte de android es necesario instalar el modo Android de Processing. Esto se hace desde la pesta帽a a帽adir herramienta, luego en modos, ah铆 encontrar谩 el modo Android.

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
- Por 煤ltimo da play en Unreal.
- Y a jugar!!!


## Proyecto Unreal

A continuaci贸n de muestra el enlace para descargar el proyecto Unreal

| Google Drive | [Archivo zip del proyecto][UnrealEnlace] |
| ------ | ------ |


   [procEnlace]: <https://processing.org/download>
   [xamppEnlace]: <https://www.apachefriends.org/es/download.html>
   [UnrealEnlace]: <https://drive.google.com/file/d/145v9M007WQ7amIzZcEqCKoZuR-CWaxRu/view?usp=sharing>
   
