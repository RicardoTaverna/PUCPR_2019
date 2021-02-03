// Programa: Web Server com modulo ESP8266
// Alteracoes e adaptacoes:Edson Justino
//    AT Commands
//   AT     =====> ESP8266 returns OK
//   AT+RST =====> ESP8266 restart and returns OK (Não use)
//   AT+GMR =====> ESP8266 returns AT Version; SDK version; id; OK
//   AT+CWMODE? => ESP8266 returns mode type
//   AT+CWLAP ===> ESP8266 returs close access points
//   AT+CIFSR ===> ESP8266 returs designided IP

#include <SoftwareSerial.h>
SoftwareSerial esp8266(2,3);  //Rx ==> Pin 3; TX ==> Pin 2
#define speed8266 113200
#define DEBUG true

void setup() 
{
  Serial.begin(9600);
  esp8266.begin (speed8266); 
  Serial.println("ESP8266 Setup test - use AT coomands");
  //sendData("AT+RSTrn", 2000, DEBUG);
  delay(1000);
  Serial.println("Versao de firmware");
  delay(3000);
  //sendData("AT+GMRrn", 2000, DEBUG); // rst
  // Configure na linha abaixo a velocidade desejada para a
  // comunicacao do modulo ESP8266 (9600, 19200, 38400, etc)
 // sendData("AT+CIOBAUD=19200rn", 2000, DEBUG);
}

void loop() 
{
  while(esp8266.available())
  {
    Serial.write(esp8266.read());
  }
  while(Serial.available())
  {
    esp8266.write(Serial.read());
  }
}
