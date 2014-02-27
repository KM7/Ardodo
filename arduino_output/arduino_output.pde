import processing.serial.*;
import themidibus.*;
import cc.arduino.*;

Arduino arduino;


MidiBus myBus;

MidiBus OscBus;
ControlChange change;

//color off = color(4, 79, 111);
//color on = color(84, 145, 158);

boolean on=false;
boolean status=true;
int reading;
int reading1;
int potentiometer;
int button;


int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };

void setup() {
  size(600, 400);
  
  // Prints out the available serial ports.
  println(Arduino.list());
  MidiBus.list();
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[7], 57600);
  OscBus = new MidiBus(this, "","Arduino");
  change=new ControlChange(1, 103,0);
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
  
  // Set the Arduino digital pins as outputs.
}
void draw() {
  background(125);
  stroke(22,44,100);
  text(reading,30,30);
  text(reading1,70,30);
  text(button,70,50);
  
  getReading();
  modegentar();
  
  
}

void mousePressed()
{
  
}


boolean Button(){
boolean onn=false;
if (arduino.analogRead(4)<=800){
    onn=false;
  } else{
    onn=true;
  } 
  return onn;
}

boolean ButtonPressed(){
  boolean temp=false;
    if(on){
      if (arduino.analogRead(4)<=800){
        temp=true;
      }
    }
    return temp;
}

void getReading(){
   reading=arduino.analogRead(1);
   reading1=arduino.analogRead(0);
   potentiometer=arduino.analogRead(3);
   button=arduino.analogRead(4);  
}



