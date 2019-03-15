'For Arduino Uno: Use "Arduino" Programmer in "Options - Programmer"
'Arduino UNO Baudrate 115200

'For Arduino Mega R3: Use "Arduino STK500V2" Programmer in "Options - Programmer"
'Arduino MEGA Baudrate 115200

'12V 700Ah BMS Controller with IC2 communication.to each Cell  ****************************

$regfile = "m2560def.dat"                                   ' used micro
$crystal = 16000000                                         ' used xtal
$hwstack = 100
$swstack = 100
$framesize = 100

'PC Connection  ************************************************
Config Com1 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Serialin0 = Buffered , Size = 40
Open "com1:" For Binary As #1


'Machine Connection  ************************************************
Config Com2 = 57600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Open "com2:" For Binary As #2

dim Kar as byte
dim dont as integer

Topp:


if Ischarwaiting(#1) > 0 then
   Get #1 , Kar
   print #2,chr(kar);
   print #1,chr(kar);
end if

if Ischarwaiting(#2) > 0  then
   Get #2 , Kar
   print #1,chr(kar);
End if

if dont=0 then
 print #2,chr(27);"B "
  dont=1
end if



Goto Topp