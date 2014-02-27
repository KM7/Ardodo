void modeflasher(){
  int newvalp = int(map(potentiometer,0,1023,80,1000));
  int newval = int(map(reading,300,800,0,120));
  int newval1 = int(map(reading1,0,800,12,80));
 
 if (!Button()){
  OscBus.sendNoteOn(1,newval1,77);
 delay(newvalp);
 arduino.digitalWrite(5,Arduino.HIGH);
  arduino.digitalWrite(6,Arduino.HIGH);
 arduino.digitalWrite(7,Arduino.HIGH);
  OscBus.sendNoteOff(1,newval1,77);
  change.setValue(newval);
  arduino.digitalWrite(5,Arduino.LOW);
  arduino.digitalWrite(6,Arduino.LOW);
  arduino.digitalWrite(7,Arduino.LOW);
  OscBus.sendControllerChange(change);
 } 
}
