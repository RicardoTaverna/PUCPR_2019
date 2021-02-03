//Carrega a biblioteca SoftwareSerial
#include <SoftwareSerial.h>
    
//Define os pinos para a serial  (RX, TX)
SoftwareSerial MinhaSerial(2,3);
String buf;
bool YL = false, GR = false, RD = false, BYL = false;
int potenciometro;
float pwm;
unsigned int tempoPadrao = 2000;
unsigned int tempoAgregado = 10000;
float tempoS;
float tempoP;
unsigned int tempoPedestre = 5000;
unsigned int chamaSemafP;


void setup() {
  
    pinMode(4, OUTPUT);//semaforo primario vermelho
    pinMode(5, OUTPUT);//semaforo primario amarelo
    pinMode(6, OUTPUT);//semaforo primario verde
    pinMode(7, OUTPUT);//semaforo secundario vermelho
    pinMode(8, OUTPUT);//semaforo secundario amarelo
    pinMode(9, OUTPUT);//semaforo secundario verde
    pinMode(10, OUTPUT);//semaforo pedestre verde
    pinMode(11, OUTPUT);//semaforo pedestre vermelho
    pinMode(13, OUTPUT);//Regulador de fluxo
    Serial.begin(9600); 
    //Inicia a serial configurada nas portas 6 e 7
    MinhaSerial.begin(9600); 
}

void semaforoPedestre(){

  
  if(chamaSemafP == 1){
    digitalWrite(10, HIGH);
    digitalWrite(11, LOW);
    //semaforo principal em vermelho
    digitalWrite(4, HIGH);
    digitalWrite(5, LOW);
    digitalWrite(6, LOW);
    //semaforo secundario em verde
    digitalWrite(7, HIGH);
    digitalWrite(8, LOW);
    digitalWrite(9, LOW);
    delay(tempoPedestre);
    for(int i = 0; i < 5; i++){
      digitalWrite(10, LOW);
      digitalWrite(11, HIGH);
      delay(tempoPadrao/3);
      digitalWrite(10, LOW);
      digitalWrite(11, LOW);
      delay(tempoPadrao/3);
    }
  }
  chamaSemafP = 0;
}

void semaforoAtivo(){
  if(chamaSemafP == 0){
    if(potenciometro <= 341){
        Serial.println(potenciometro);
      pwm = (float)map(potenciometro, 0, 341, tempoAgregado/4 , tempoAgregado/2)/10000;//Controle de tempo com o regulador de fluxo
    }else{
        Serial.println(potenciometro);
       pwm = (float)map(potenciometro, 342, 1023, tempoAgregado/2, (2*tempoAgregado)/3)/10000;
    }
   
    
    tempoP = tempoAgregado*pwm;
    tempoS = tempoAgregado - tempoP;
    
    //semaforo principal em vermelho
    digitalWrite(4, HIGH);
    digitalWrite(5, LOW);
    digitalWrite(6, LOW);
    //semaforo secundario em verde
    digitalWrite(7, LOW);
    digitalWrite(8, LOW);
    digitalWrite(9, HIGH);
    digitalWrite(10, LOW);
    digitalWrite(11, HIGH);
    delay(tempoS);

    //Amarelo ligado
    digitalWrite(4, HIGH);
    digitalWrite(5, LOW);
    digitalWrite(6, LOW);
    digitalWrite(7, LOW);
    digitalWrite(8, HIGH);
    digitalWrite(9, LOW);
    digitalWrite(10, LOW);
    digitalWrite(11, HIGH);
    delay(tempoPadrao);
    //Tempo de segurança em vermelho
    digitalWrite(4, HIGH);
    digitalWrite(5, LOW);
    digitalWrite(6, LOW);
    digitalWrite(7, HIGH);
    digitalWrite(8, LOW);
    digitalWrite(9, LOW);
    digitalWrite(10, LOW);
    digitalWrite(11, HIGH);
    delay(tempoPadrao);



    //semaforo Via Principal em verde usando o fluxo como delay
    digitalWrite(4, LOW);
    digitalWrite(5, LOW);
    digitalWrite(6, HIGH);
    //semaforo secundario em vermelho
    digitalWrite(7, HIGH);
    digitalWrite(8, LOW);
    digitalWrite(9, LOW);
    digitalWrite(10, LOW);
    digitalWrite(11, HIGH);
    delay(tempoP);

    //Amarelo ligado
    digitalWrite(4, LOW);
    digitalWrite(5, HIGH);
    digitalWrite(6, LOW);
    digitalWrite(7, HIGH);
    digitalWrite(8, LOW);
    digitalWrite(9, LOW);
    digitalWrite(10, LOW);
    digitalWrite(11, HIGH);
    delay(tempoPadrao);
    //Tempo de segurança em vermelho
    digitalWrite(4, HIGH);
    digitalWrite(5, LOW);
    digitalWrite(6, LOW);
    digitalWrite(7, HIGH);
    digitalWrite(8, LOW);
    digitalWrite(9, LOW);
    digitalWrite(10, LOW);
    digitalWrite(11, HIGH);
    delay(tempoPadrao);
  }
  
}

void semaforoAlerta(){
  while (buf == 'Off') //O maisculo
    {
      //Desligado
      //semaforo principal
      digitalWrite(4, LOW);
      digitalWrite(5, LOW);//Amarelo
      digitalWrite(6, LOW);
      //semaforo secundario em verd
      digitalWrite(7, LOW);
      digitalWrite(8, LOW);//Amarelo
      digitalWrite(9, LOW);
      //Ligado
      //semaforo principal
      digitalWrite(4, LOW);
      digitalWrite(5, HIGH);//Amarelo
      digitalWrite(6, LOW);
      //semaforo secundario em verd
      digitalWrite(7, LOW);
      digitalWrite(8, HIGH);//Amarelo
      digitalWrite(9, LOW);
      Serial.println("LED amarelo piscando em atencao!");
    }
 
}


void loop() {
  // put your main code here, to run repeatedly:
  while(MinhaSerial.available())
  {
    buf = MinhaSerial.readString();
    Serial.println(buf);    
    
    //Caso seja recebido R, acende o led vermelho
    if (buf == 'V')
    {
      buf = "";
      GR = !GR;
      digitalWrite(3, GR);
      Serial.println("LED Verde comandado !");
    }
    //Caso seja recebido G, acende o led verde
    else if (buf == "A")
    {
      buf = "";
      YL = !YL;
      digitalWrite(4, YL);
      Serial.println("LED Amarelo ligado !");
    }
    else if (buf == "C")
    {
      buf = "";
      RD = YL = GR = false;
      digitalWrite(3, GR);
      Serial.println("Desliga LED Verde  !");
      digitalWrite(4, YL);
      Serial.println("Desliga LED Amarelo  !");
      digitalWrite(5, RD);
      Serial.println("Desliga LED Vermelho  !");
      analogWrite(9,0);
    }

    else if (buf == "P"){
      chamaSemafP = 1;
    }

    else if (buf == "Off"){
      semaforoAlerta();
    }
    
    else{
      potenciometro =  buf.toInt();
      Serial.println(potenciometro + " Potenciometro");
    }

    semaforoAtivo();   
     
    semaforoPedestre();
  }
}
