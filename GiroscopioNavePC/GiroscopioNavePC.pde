//Librerías utilizadas para la conexión remota con el dispositivo Adnroid
import oscP5.*;
import netP5.*;
import ketai.net.*;

//Librería utilizada para el envio de Websockets
import websockets.*;
// objeto del  cual se utilizarán los metodos para el envio de paquetes
WebsocketClient socket; 

//definicion de todos los objetos y variables utilizados 
OscP5 oscP5;
NetAddress remoteLocation;
float gyroscopeX, gyroscopeY, gyroscopeZ, presionado;
int contador = 0;
float correctionX = 0.0, correctionZ = 0.0;
float inputGyroscopeX, inputGyroscopeZ;
float scopeX, scopeY;
String myIPAddress; 

//Aqui ingrese la dirección IP de su dispositivo movil, esta se muestra una vez ejecute la aplicación de android
String remoteAddress = "192.168.3.7";
//Aqui ingrese la dirección IP del ordenador, esta puede consultarse con el comando "ipconfig" en la terminal
String computerAddress = "192.168.3.6";

String data = "{\n                    \"MessageName\": \"http\",\n                    \"Parameters\": {\n  \"Url\": \"/remote/object/call\",\n                        \"Verb\": \"PUT\",\n                        \"Body\": {\n                            \"ObjectPath\": \"/Game/StarterContent/Maps/UEDPIE_0_Minimal_Default.Minimal_Default:PersistentLevel.Jugador_3\",\n                            \"functionName\": \"disparar\",\n                            \"access\": \"WRITE_ACCESS\"\n                        }\n                    }\n                }";
float y = 0,z = 0;
int i=0;

//Muestra la informacion
boolean info = true;
boolean play=false;

//Inicializa la ventana
void setup() {
  size(600, 600);
  initNetworkConnection();
  noLoop();
}

//función que se ejecuta cada frame producido
void draw() {
  background(255);

  //se ajusta el valor del giroscopio
  gyroscopeX = inputGyroscopeX - correctionX;
  gyroscopeZ = inputGyroscopeZ - correctionZ;
  
 if (info){
 fill(0);

 //Aqui se imprime en la ventana la información recibida del dispositivo Android
 text("PRESIONE LA TECLA ESPACIO PARA COMENZAR EL ENVIO DE WEBSOCKETS AL EDITOR UNREAL\n" +
    "LUEGO PUEDE DAR PLAY EN EL EDITOR UNREAL PARA JUGAR\n" +
    "Remote Tap Info: " + "\n" +
    "Screen tapped: "+ presionado + "\n" +
    "Remote Gyroscope Info: " + "\n" +
    "x: "+ nfp(gyroscopeX, 1, 3) + "\n" +
    "z: "+ nfp(gyroscopeZ, 1, 3), width/2, height/2);
    textSize(20);
    textAlign(CENTER, CENTER);
 }

 //En este if se envía la solicitud para que el jugador dispare y se limita a un disparo
 if(presionado == 1 && contador == 0){
   socket.sendMessage(data);
   contador++;
 }

 if(presionado==0){
   contador = 0;
 }

 if(play){
   //En esta parte se escala el valor obtenido del girocopio 
   y=-5.2*gyroscopeZ;
   z=-4.2*gyroscopeX;
   
   //en esta parte se hace el String en formato JSON para enviarse como websocket por medio del metodo del objeto socket.sendMessage(<Data>)
   String dataY = "{\n     \"MessageName\": \"http\",\n     \"Parameters\": {\n         \"Url\": \"/remote/object/call\",\n         \"Verb\": \"PUT\",\n         \"Body\": {\n             \"ObjectPath\": \"/Game/StarterContent/Maps/UEDPIE_0_Minimal_Default.Minimal_Default:PersistentLevel.Jugador_3\",\n             \"functionName\": \"setY\",\n             \"Parameters\":{\n                             \"newY\": "+nf(y,1,1)+"\n                         },\n             \"access\": \"WRITE_ACCESS\"\n         }\n     }\n }";
   String dataZ = " {\n     \"MessageName\": \"http\",\n     \"Parameters\": {\n         \"Url\": \"/remote/object/call\",\n         \"Verb\": \"PUT\",\n         \"Body\": {\n             \"ObjectPath\": \"/Game/StarterContent/Maps/UEDPIE_0_Minimal_Default.Minimal_Default:PersistentLevel.Jugador_3\",\n             \"functionName\": \"setZ\",\n             \"Parameters\":{\n                             \"newZ\": "+nf(z,1,1)+"\n                         },\n             \"access\": \"WRITE_ACCESS\"\n         }\n     }\n }";

   //Llamada al método sendMessage() del objeto socket, con la información de los objetos el Unreal definida en dataY y dataZ
   socket.sendMessage(dataY);
   socket.sendMessage(dataZ);
 }

}

//Esta función se encarga de solicitar la conexión con el Unreal para enviar websockets
void solicitarAcceso(){
    socket = new WebsocketClient(this, "ws://"+computerAddress+":30020");
}

/*
IMPORTANTE
Para comenzar el envio de websockets una vez ejecutada la aplicacion de pc es necesario presionar la tecla Espacio.
La función se encuentra definida a continuación
*/
void keyTyped(){
  if(key == ' '){
    if(play){
      play = false;
      
      noLoop();
    }else{
      play = true;
      solicitarAcceso();
      loop();
    }
  }
}

/* 
* OSC event listener
* La etiqueta de tipo debe ser idéntica a la enviada por el dispositivo remoto
* La etiqueta de tipo parece ser única o al menos una necesita volver a compilar las clases
* El patrón de dirección también se puede usar para hacer un apretón de manos
* Las fichas de información están indizadas.
*/
void oscEvent(OscMessage theOscMessage) {
    inputGyroscopeX = -theOscMessage.get(0).floatValue();  //correccion de grioscopio
    gyroscopeY =  theOscMessage.get(1).floatValue();
    inputGyroscopeZ =  theOscMessage.get(2).floatValue();
    presionado =  theOscMessage.get(3).floatValue();
}

/*
* Puerto local abierto para conexiones
* Intenta conectarte con un dispositivo remoto
* Obtener IP local
*/
void initNetworkConnection()
{
  oscP5 = new OscP5(this, 12000, OscP5.UDP);                         
  remoteLocation = new NetAddress(remoteAddress, 12000);  
  myIPAddress = KetaiNet.getIP();                         
}
