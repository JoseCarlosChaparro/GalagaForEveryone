//Librerías utilizadas para la conexión remota con el ordenador
import netP5.*;                                          
import oscP5.*;

//Librerías que obtienen los datos del giroscopio y permiten llamar metodos de andorid
import ketai.net.*;
import ketai.sensors.*;
import android.content.DialogInterface;
import android.app.Activity;
import android.app.AlertDialog;
import android.text.Editable;
import android.widget.EditText;


OscP5 oscP5;
KetaiSensor sensor;
NetAddress remoteLocation;

boolean info = true;
float touched=0;
float GyrsocopeX, GyroscopeY, GyroscopeZ, presionado;
int x, y;

//Aqui introduzca la ip de su ordenador
String remoteAddress = "192.168.3.6";



float momentoUno = 500, momentoDos = 0;
String myIPAddress;

//inicialización de la ventana, y los sensores
void setup() {
  sensor = new KetaiSensor(this);
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(42);
  fullScreen();

  initNetworkConnection();
  sensor.start();
}

//función que se ejecuta cada frame producido
void draw() {

  momentoDos = millis();

  //Rectángulo rojo
  rectMode(CORNER);
  fill(255, 23, 21); 
  rect(0, 0, width, height/2);

  //Rectángulo azul
  rectMode(CORNER);
  fill(0, 73, 172);
  rect(0, height/2, width, height/2);

  //texto que se imprime en pantalla cada frame
  if (info){
    fill(0);
    text("Presione rojo para recalibrar\n"+
    "Local Tap Info: \n" +
    "screenPressed: " + presionado + "\n\n" +
    "Local Accelerometer Data: \n" +
    "x: " + nfp(GyrsocopeX, 1, 3) + "\n" +
    "z: " + nfp(GyroscopeZ, 1, 3) + "\n\n" +
    "Local IP Address: \n" + myIPAddress + "\n\n" +
    "Remote IP Address: \n" + remoteAddress, width/2, height/2);
  }

  //función que envía la información del giroscopio y la pantalla tactil al ordenador
  OscMessage myMessage = new OscMessage("/1234");
  myMessage.add(GyrsocopeX);    
  myMessage.add(GyroscopeY);
  myMessage.add(GyroscopeZ);
  myMessage.add(presionado);
  oscP5.send(myMessage, remoteLocation);
}

//funcion que obtiene los datos del giroscopio
void onGyroscopeEvent(float x, float y, float z)
{
  GyrsocopeX += 0.18 * x;
  GyroscopeY = y;
  GyroscopeZ -= 0.16 * z;
}

//Funcion que detecta que parte de la pantalla se presiona
void mousePressed() {
  if(touched == 0 && mouseY > height/2){
    //aqui se limita el disparo a un maximo de 1 por cada 250 milisegundos
    if(momentoDos - momentoUno >= 250 ){
     touched = 1;
     presionado = 1;
     momentoUno = millis();
   }
  }
  //Aqui se reinician los valores del giroscopio para recalibrar
  if(touched == 0 && mouseY < height/2){
    touched = 1;
    GyrsocopeX=0;
    GyroscopeZ=0;
  }
}

//aqui se redefinen las variables de control de presionado de la pantalla
void mouseReleased() {
    touched = 0;
    presionado = 0;
}

//funcion que inicializa la conexión con el ordenador
void initNetworkConnection(){
  oscP5 = new OscP5(this, 12000);                         
  remoteLocation = new NetAddress(remoteAddress, 12000);  
  myIPAddress = KetaiNet.getIP();                         
}
