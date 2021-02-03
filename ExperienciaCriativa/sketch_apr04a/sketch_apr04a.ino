unsigned int potenciometro;
float pwm;
unsigned int tempoPadrao = 2000;
unsigned int tempoAgregado = 10000;
float tempoS;
float tempoP;
unsigned int tempoPedestre = 15000;
unsigned int chamaSemafP;

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
      delay(tempoPadrao/2);
      digitalWrite(10, LOW);
      digitalWrite(11, LOW);
      delay(tempoPadrao/2);
    }
  }
  chamaSemafP = 0;
}

void setup(){
  //pinMode(2, OUTPUT);//interrupção 0
  attachInterrupt(0, chave, RISING);
  //pinMode(3, OUTPUT);//interrupção 1
  pinMode(4, OUTPUT);//semaforo primario vermelho
  pinMode(5, OUTPUT);//semaforo primario amarelo
  pinMode(6, OUTPUT);//semaforo primario verde
  pinMode(7, OUTPUT);//semaforo secundario vermelho
  pinMode(8, OUTPUT);//semaforo secundario amarelo
  pinMode(9, OUTPUT);//semaforo secundario verde
  pinMode(10, OUTPUT);//semaforo pedestre verde
  pinMode(11, OUTPUT);//semaforo pedestre verde
  pinMode(13, OUTPUT);//Regulador de fluxo
  Serial.begin(9600);
  
}

void chave(){
  chamaSemafP = 1;
}

void loop()
{
  if(chamaSemafP == 0){
    potenciometro = analogRead(A0);
    if(potenciometro <= 341){
        Serial.println(potenciometro);
      pwm = (float)map(potenciometro, 0, 341, tempoAgregado/4 , tempoAgregado/2)/10000;//Controle de tempo com o regulador de fluxo
    }else{
        Serial.println(potenciometro);
       pwm = (float)map(potenciometro, 342, 1023, tempoAgregado/2, (2*tempoAgregado)/3)/10000;
    }
   
    
    tempoP = tempoAgregado*pwm;
    tempoS = tempoAgregado - tempoP;
    Serial.println(pwm);
    Serial.println(tempoP);
    Serial.println(tempoS);
    
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
    
    
    semaforoPedestre();
   
  }
}
