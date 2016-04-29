import RPi.GPIO as GPIO
import time

# https://www.raspberrypi.org/documentation/usage/gpio-plus-and-raspi2/README.md

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# GPIO pinout
gled = 3
gbutton = 15

GPIO.setup(gled, GPIO.OUT)
GPIO.setup(gbutton, GPIO.IN, GPIO.PUD_UP)

# LED test
print("LED test")
GPIO.output(gled, 1)
time.sleep(2)
GPIO.output(gled, 0)

# Input test
while True:
    if GPIO.input(gbutton) == False:
        print("Green button pressed")
        break

GPIO.cleanup()
