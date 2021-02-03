// Using the Serial Monitor
// By Edson J. R. Justino

// LED function
void LedOnOff(int ch)
{
  if (ch == 'o')
    digitalWrite(13, HIGH);
 else if (ch == 'f')
   digitalWrite(13, LOW);
 
}

void setup() {
  // Initialize Console and wait for port to open:
  Serial.begin(9600);
  while(!Serial) {
  // Wainting for conection
  Serial.println ("Hi, send me an 'o'on 'f':");
  }

  //LED adress
  pinMode(13, OUTPUT);

  Serial.println("Hi, Send me an o or f:");
}

void loop() {
  if (Serial.available() > 0) {
    char c = Serial.read(); // read the next char received
    if (c == 'o'){
      Serial.print("LED is ON!");
      Serial.print('\n');
      Serial.print(c);
    }else{
      Serial.print("LED is OFF!");
      Serial.print('\n');
      Serial.print(c);
    }
    LedOnOff(c);
    Serial.print('\n');
    delay(100);
  }
}

