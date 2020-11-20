# HomeIoT
Complete IoT system from sensors to mobile application to measure and view room temperature and humidity levels.
<br/><br/>

## Project

HomeIoT is complete IoT system project which uses DHT11 sensor to measure inside temperature and humidity levels.
Sensor is attached to NodeMCU microcontroller which is used to send the measurements to google Firebase
realtime database over home Wi-FI. Code to control NodeMCU is provided in the corresponding folder. When measurements are
in the database, the Flutter application can read them in real time so that user sees latest measurements
every time. User can also see maximum temperature of the week. Application code is in the application folder.
<br/>

## Used components

* NodeMCU ESP8266 ESP-12E
* DHT11 Digital temperature and humidity sensor
* Smartphone
* Other: resistor, jumper wires

## Application UI
<img src="https://github.com/markmult/homeIoT/blob/master/example/application.png" width="300">
