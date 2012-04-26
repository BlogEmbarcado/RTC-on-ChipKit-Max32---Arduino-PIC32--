// declaracao da biblioteca do RTC
#include "pic32_RTC.h"
 
//
pic32_RTC RTC;


void setup() {
  
  // configuracao do baudrate da comunicacao serial
  Serial.begin(19200);

  // inicializacao do RTC
  RTC.begin();

  // header do console da serial
  Serial.println("RTC_MAX32_OSC_EXTERNO");
  
  // delay utilizado para garantir que o circuito oscilador esteja estabilizado
  delay(1000);
  
  // configuracao de data e hora do RTC
  // Formato YY/MM/DD HH:mm:ss
  // YY - ANO      HH - HORA
  // DD - DIA      mm - MINUTO
  // MM - MES      ss - SEGUNDO
  RTC.set(12, 04, 23, 20, 05, 00);
}

void loop() {

  // aquisicao dos valores do periferico RTC
  RTC.get();
  
  // envio pela serial dos valores lidos do RTC
  Serial.print(RTC.date());
  Serial.print("\t");
  Serial.print(RTC.time());
  Serial.print("\t");
  Serial.print(RTCDATE, HEX);
  Serial.print("\t");
  Serial.print(RTCTIME, HEX);
  Serial.print("\n");
  
  // delay de 1seg
  delay(1000);
}


