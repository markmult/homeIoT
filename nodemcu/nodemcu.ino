#include <FirebaseESP8266.h>
#include <ESP8266WiFi.h>
#include <DHT.h>
                          
#define FIREBASE_HOST "homeiot-*****.firebaseio.com"              // Database addres from Firebase
#define FIREBASE_AUTH "*****************************"             // Secret key from Firebase

#define WIFI_SSID "TP-Link ****"                                  // Wifi SSID
#define WIFI_PASSWORD "**************"                            // Wifi password

#define DHTPIN D4                                                 // DHT data pin in NodeMCU
#define DHTTYPE DHT11

FirebaseData firebaseData;                                        // Declare the Firebase Data object
DHT dht(DHTPIN, DHTTYPE);



void setup() {
  
  Serial.begin(115200);
  dht.begin();                                                   // Start reading at D4 pin
  
  Serial.println("Serial communication started\n\n");  
           
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);                          // Try to connect with wifi
  Serial.print("Connecting to ");
  Serial.print(WIFI_SSID);

  
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }

  
  Serial.println();
  Serial.print("Connected to ");
  Serial.println(WIFI_SSID);
  Serial.print("IP Address is : ");
  Serial.println(WiFi.localIP());                                // Print local IP address
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);                  // Connect to firebase

  Firebase.reconnectWiFi(true);
  delay(1000);
}

void loop() {
  
  // Write latest measurements to Firebase realtime database every six seconds

  float temp = dht.readTemperature();                            // Read temperature
  float hum = dht.readHumidity();                                // Read Humidity
  
  if (isnan(hum) || isnan(temp))                                 // Check sensor working
  {                                   
    Serial.println(F("Failed to read from DHT sensor"));
    return;
  }

  delay(1000);

  if (Firebase.setInt(firebaseData, "/temperature", temp)) {     // Write current temperature to database 
    Serial.println("Temperature Uploaded Successfully");
    Serial.print("Temp = ");
    Serial.println(temp);
    Serial.println("\n");
                 
  }
  
  else {        
    Serial.println(firebaseData.errorReason());
  }

  if (Firebase.setInt(firebaseData, "/humidity", hum)) {        // Write current humidity to database 
    Serial.println("Humidity Uploaded Successfully");
    Serial.print("Humidity = ");
    Serial.println(hum);
    Serial.println("\n");
                 
  }
  
  else {        
      Serial.println(firebaseData.errorReason());
  }

  delay(5000);                                                 // Delay for five seconds

}
