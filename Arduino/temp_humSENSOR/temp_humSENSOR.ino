#include <SimpleDHT.h>
const int TEMP_HUM = 2;
const int RAIN_D = 4;
const int RAIN_A = A5;
const int LIGHT = A3;
const int WIND = 7;

//const int BYPASS = 8;

int rain = 0;
float temperature = 0;
float humidity = 0;
int light = 0;
bool wind = 0;
bool last_wind = 0;
int count_wind = 0;
//bool switch = LOW;

SimpleDHT11 dht11(TEMP_HUM);

//SETUP
void setup() { 
  Serial.begin(9600); 
  pinMode(RAIN_D, INPUT);
  pinMode(RAIN_A, INPUT);
  pinMode(WIND, INPUT);
 // pinMode(BYPASS, INPUT);
}


//LOOP
void loop() {
// TEMPERATURE AND HUMIDITY SENSOR READ
int err = SimpleDHTErrSuccess;
if((err=dht11.read2(&temperature, &humidity, NULL)) != SimpleDHTErrSuccess){
  Serial.print("Read DHT11 failed, err=");
  Serial.println(err);
  delay(2000);
  return;
  }

//RAIN SENSOR READ
rain = analogRead(RAIN_A); 

//LIGHT SENSOR READ
light = analogRead(LIGHT);

//WIND SENSOR READ
for (int i=0; i<100; i++) {
  wind = digitalRead(WIND);
  if (wind!=last_wind){
    count_wind++;
    last_wind = wind;
  }
  delay(20);
}


//SERIAL PRINT
Serial.print((int)temperature);
Serial.print("a");
Serial.print((int)humidity);
Serial.print("b");
Serial.print(rain); 
Serial.print("c");
Serial.print(light); 
Serial.print("d");
Serial.print(count_wind);
Serial.print("e");

count_wind = 0;

//Serial.println();
delay(1000); // DHT11 sampling rate is 1HZ.
}
