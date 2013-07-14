import RPi.GPIO as GPIO
import urllib2
import time
import requests

# set the mode of the pin
GPIO.setmode(GPIO.BCM)

# set the input of the gpio
# set the pull down resistor 
GPIO.setup(8,GPIO.IN,pull_up_down=GPIO.PUD_DOWN)

# set up the HTTP request
api_url = 'http://api.hackspace.ca/s/vhs/data/door/update?dataname=door;value='

prev_input = 3 # Set it to an unknow value so it has to change on first read. 

def SendDoorStatus( status ):
  print( 'Door status changed to ' + status )
  print( 'http.url=[' + str(api_url + status ) + ']' )
  r = requests.get( api_url + status ) 
  print( 'http.status=[' + str(r.status_code) + ']' )
  print( 'http.content=[' + str(r.text) + ']' )
  print('') 

while 1:
  input = GPIO.input(8)
   
  if(prev_input != input):
      if(input):
        SendDoorStatus( "open" ) 
      else:
        SendDoorStatus( "closed" ) 
  prev_input = input
  

