#define rWallPin 13
#define gWallPin 15
#define bWallPin 14


void setup()   {       
  pinMode(rWallPin, OUTPUT); analogWrite(rWallPin, HIGH);
  pinMode(gWallPin, OUTPUT); analogWrite(gWallPin, HIGH);
  pinMode(bWallPin, OUTPUT); analogWrite(bWallPin, HIGH);
  pinMode(0, OUTPUT);
}


void write_wall_leds (int r, int g, int b) {
    digitalWrite(rWallPin, r);
    analogWrite(gWallPin, g); 
    analogWrite(bWallPin, b);
    
}

void loop() {

  for(int fadeValue = 0 ; fadeValue <= 255; fadeValue +=5) { 
    write_wall_leds(abs(fadeValue + 255), abs(fadeValue  - 255), fadeValue);    
    delay(30);                            
  } 


  for(int fadeValue = 255 ; fadeValue >= 0; fadeValue -=5) { 
    write_wall_leds(abs(fadeValue + 255), abs(fadeValue - 255), fadeValue);          
    delay(30);                            
  } 

}

