StartUP:

'The following units need StartUP;
' (If MainKee is 0 then only halt on GSM error!)

'GSM ***************
'First test if unit is on by sending AT.
'If not OK then PWR must be held High for 1 sec.
TestGSM:
Print "Starting GSMTest"
call sendtogsm("AT",1)
if waitfor("OK",100000)=1 then 'Waiting max 1S
  GSMHavePower=1
  'Now check if connected
  call sendtogsm("ATE0",1)  'Disable Echo
  if waitfor("OK",100000)=1 then 'Waiting max 1S
    call sendtogsm("AT+CREG=0",1) 'Disable Autoreporting
    if waitfor("OK",100000)=1 then 'Waiting max 1S
      call sendtogsm("AT+CREG?",1) 'Check if connected to network
      if waitfor(",1",100000)=1 then 'Waiting max 1S
        gsmok=1
        print "GSM OK"
      end if
    end if
  end if
end if
if gsmok=0 then
  'Try to apply Power
  incr GSMRetry
  if GSMRetry<4 then 'Retry only 3 times.
    if GSMHavePower=0 then
      gsmpower=1
      waitms 500
      gsmpower=0
    end if
    wait 3
    goto TestGSM
  end if
end if


'ADC Init
call initcell(208) 'BattAmp
If rbyte=31 then BattAmpOK=1
call initcell(210) 'Port Amp
If rbyte=31 then PortAmpOK=1
call initcell(212) 'tb Amp
If rbyte=31 then StbAmpOK=1




'GPS. ***************************
'First check if GPS is transmitting on 38400. If so no setup is needed.

'Gosub InitGPS at default baudrate; 4800
'Start with turning OFF all Outputs
'Set up GPS to send only GSMRC every second.
'Setup baud to 38400
'Check if GPS is using 38400

Dim GPSTrye as byte
dim GpsL as long

GPS2:
 Print "GPS Test with ";bauden

 'Empty GPS Buffer
 while ischarwaiting(#2)>0
   get #2,char
   if char=10 then
     exit while
   End if
 wend

 'Now wait for GPS for 2 sec
 gpsl=0
 while gpsl<20000
   char=inkey(#2)
   if chr(char)="$" then
    print "GPS OK"
    gpsok=1
    exit while
   End if
   incr gpsl
   waitus 10
 wend

 if gpsok=0 then
    'Set baud to 4800
    print "GPS Needs Init"
    Config Com2 = 38400 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
    gosub initGPS
    goto GPS2
 end if



'Compass  ************************
'Startup with CMPS12 default 9600 Baud.
''Try to get version as byte
compassIni:
  print #3,chr(17);
  compassok=0
  'wait for answer in 100ms
 gpsl=0
 while gpsl<10000
   char=inkey(#3)
   if char=3 then
    print "Compass; ";char;"  ";gpsl
    Compassok=1
    exit while
   End if
   incr gpsl
   waitus 10
 wend



'Wifi. ***************************
'For now, I have no way of testing the WIFI.

'ADC MCP3421 set to 18 bit with amplification of 8
call Initcell(208)
call Initcell(210)
call Initcell(212)

'Empty GPS Buffer
 while ischarwaiting(#2)>0
   get #2,char
 wend

goto starten

FailHalt:
  'Send Fault Signal for 20 Sec, then wait for 10 minutes and then try again
  fail=3
  PRINT "tO FEIL WITH ";FAIL
  for xi=1 to 200
  if fail<4 then
    for yi=1 to fail
      beeper=1
      waitms 300
      beeper=0
      Waitms 300
      reset watchdog
    Next
    waitms 1500
    reset watchdog
    waitms 1500
    reset watchdog
  Else
  End if
next


goto Starten