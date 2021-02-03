import RPi.GPIO as GPIO
import time
import datetime

import paho.mqtt.client as mqtt

user = '06cc93e0-ec41-11e8-8e60-53d8c8eabc71'
password = 'bc56f666f5ca23747947c064543215e8b6cfdc83'
client_id = '3e4181f0-ec41-11e8-8cb9-732fc93af22b'
server = 'mqtt.mydevices.com'
port = 1883

# Client ID
client = mqtt.Client(client_id)

# MQTT username, MQTT password
client.username_pw_set(user, password)

# MQTT Server, MQTT Port,
client.connect(server, port)

infra = 17
led = 22
data = datetime.date.today()
datahora = datetime.datetime.now()

entrada = 0

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(infra, GPIO.IN)         #Read output from PIR motion sensor
GPIO.setup(led, GPIO.OUT)         #LED output pin
while True:
    for count in range(100):
        adiciona = 0
        i=GPIO.input(infra)
        if i==1:                 #When output from motion sensor is LOW
            print("No intruders",i)
            GPIO.output(led, 0)  #Turn OFF LED
            time.sleep(0.5)
        else:               #When output from motion sensor is HIGH
            print("Intruder detected",i, datahora)
            print(data.strftime("%d/%m/%y"))
            GPIO.output(led, 1)  #Turn ON LED
            time.sleep(0.5)
            adiciona += 1
    entrada += adiciona
