                                           'For Arduino Uno: Use "Arduino" Programmer in "Options - Programmer"
'Arduino UNO Programmer Baudrate 115200

'For Arduino Mega R3: Use "Arduino STK500V2" Programmer in "Options - Programmer"
'Arduino MEGA Programmer Baudrate 115200


$regfile = "m2560def.dat"                                   ' used micro
$crystal = 16000000                                         ' used xtal
$hwstack = 1000
$swstack = 1000
$framesize = 1000
$frameprotect = 1

Config Adc = Single , Prescaler = Auto , Reference = Aref
Start Adc

Config portb.0 =OUTPUT
Ut Alias portb.0
ut=0
config PORTB.7=OUTPUT
led alias portb.7

'PC Connection
Config Com1 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Serialin = Buffered , Size = 40
Open "com1:" For Binary As #1
Dim XL as Long
Dim Xi as integer
dim Yl as long
Dim Rudder as integer

dim TimerMax as long
TimerMax=65535
dim Flag as integer

Config Timer1 = Timer , Prescale = 1024                     '15.6ticks/ms   100ms=1560 tick
On timer1 Stoppit:
Enable Timer1
stop timer1
enable interrupts


Toppen:

if ut=0 then
  timer1=timermax-31200  '400ms
  start timer1
  ut=1
End if
if ut=0 then
  led=1
  waitms 500
  led=0
  waitms 500
  flag=0
End if

Goto toppen

Stoppit:
'Pushall
stop timer1
flag=1


'if RudderDelay=0 then


  ut=0
  print "S"
  'timer1=timermax-6000 '400ms Delay (rudderlag) before reading rudder position
  'RudderDelay=1
'else
  'stop timer1
'  Rudder = Getadc(2)
'  Lastrudder = Rudder
'  working=0
'  rudderdelay=0
'End if
'popall
return