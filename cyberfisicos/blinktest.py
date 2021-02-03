import RPi.GPIO as GPIO
import time

pino = 22
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(pino,GPIO.OUT)     #Define pin 3 as an output pin

while True:
    GPIO.output(pino,1)   #Outputs digital HIGH signal (5V) on pin 3
    time.sleep(1)      #Time delay of 1 second

    GPIO.output(pino,0)   #Outputs digital LOW signal (0V) on pin 3
    time.sleep(1)      #Time delay of 1 second
