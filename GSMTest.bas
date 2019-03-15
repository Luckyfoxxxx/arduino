
'For Arduino Uno: Use "Arduino" Programmer in "Options - Programmer"
'Arduino UNO Baudrate 115200

'For Arduino Mega R3: Use "Arduino STK500V2" Programmer in "Options - Programmer"
'Arduino MEGA Baudrate 115200

'12V 700Ah BMS Controller with IC2 communication.to each Cell  ****************************

$regfile = "m2560def.dat"                                   ' used micro
$crystal = 16000000                                         ' used xtal
$hwstack = 200
$swstack = 200
$framesize = 200

Dim GSMChar as byte
Dim GSMLine as string*100
Dim ErrCounter as integer
Dim Flag as integer
Dim Sekunder as Long
Dim Sek as long
Sek=65536-15625
Dim Vent as long
Dim Xi as integer
Dim FResult as byte
Dim DayCounter as Long
Dim OutCounter as integer
Dim InCounter as Integer
Dim BatteryV as single
Dim AktivertFlag as integer
dim Pumpflag as integer
dim Mainsflag as Integer
DIm Irdflag as integer
Dim IRDSent as integer
Dim MainsSent as integer
Dim PumpSent as integer
dim SendIT as integer

'PC Connection  ************************************************
Config Com1 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
'Config Serialin0 = Buffered , Size = 40
Open "com1:" For Binary As #1

'GSM Connection  ************************************************
Config Com2 = 38400 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Open "com2:" For Binary As #3

declare function WaitFor(byval What as string*20,Byval Maksvent as long) as byte 'Waiting max 10sec
declare function SendSMS(Byval Msg as string *20, byval number as byte) as byte



Config Portf.6 = Output
ONLed alias portf.6
Onled=0

Config Portc.4 = Input
Portc.4=0
OnKey alias pinc.4

Config Portg.2 = Input
PortG.2=1
IRD alias pinG.2



Config Portg.0 = Input
Portg.0=0
Pump alias ping.0

Config Portf.5 = Input
Portf.5=1
Mains alias Pinf.5

Config PortK.6 = Output
MainsLed alias portK.6

Config Portf.4 = Output
Beeper alias portf.4
Beeper=0

Config portc.0 = output
IRDLed alias portc.0
irdled=0

config PORTc.5=output
portc.5=1
GSMReset alias portc.5
GSMReset=0
waitms 100
gsmreset=1

dim Batt AS integer
Dim BattV as single
dim ONCounter as Integer

'  AT+CMIC to adjust the input gain level of microphone
Print "Starter"


dim x as byte
Dim G as string *2
print "Ferdig med Start"
test:

    'Sjekk om vi har kommunikasjon fra PC Eller GSM
    if ischarwaiting (#1)>0 then  'PC
      get #1,gsmchar

      g=chr(gsmchar)
      g=ucase(g)

      'print asc(g)
      'if g="$" then
       ' x=sendsms("Testing new Module",1)
      'elseif g="+" then
'        print #3,"ATA"
'        wait 10
'        Print #3,"ATH"
    '  else
        print #3,G;
    '  end if
    End if

    if ischarwaiting (#3)>0 then 'GSM
      get #3,gsmchar
   '   if gsmchar=10 or gsmchar=13 then
'        if len(gsmline)>0 then
'          print gsmline
'        end if
'        if GSMLINE="RING" then
'          print #3,"ATA"
'          wait 10
'          Print #3,"ATH"
'        end if
'        gsmline=""
'      else
'        gsmline=gsmline+chr(gsmchar)
'      end if
      print chr(gsmchar);
      ''print gsmchar;" ";
    End if
goto Test


 function SendSMS(Byval Msg as string *20, Byval Number as byte) as byte
  disable interrupts
  FResult=0
  'First sjekk if Modem ready to send SMS
  print #3,"AT+CMGF=1";chr(13);

  if waitfor("OK",50000)=0 then
    'print "No 1"
    'Goto Norespons 'No Modem not responding
  End if

  'Set up to send SMS to ME
  print #3,"AT+CMGS=";
  print #3,chr(34);
  if number=1 then
   print #3,"90613522";
  else
   print #3,"92684042";
  end if
  print #3,chr(34);
  print #3, chr(13);

  if waitfor(">",50000)=0 then
    'print "No 2"

    Goto NoRespons 'NO Answer

  End if

  waitms 10

  Print #3,"White Bird Calling"

  print #3,msg

  if irdflag=1 and irdsent=0 then
     print #3, "Innbrudd";
  End if
  if mainsflag=1 and mainssent=0 then
     print #3, "Ingen Landstrom!";
  End if
  if pumpflag=1 and pumpsent=0 then
    print #3, "Lensepumpe aktivert";
  End if
  print #3,""

  Print #3,"Battery Volt=";'13.2V"
   batt=getadc(1)
   battv=batt/65.73
   print #3,fusing(battV,"#.##");"V"

  waitms 10
  print #3, chr(26);
  if waitfor("OK",1000000)=0 then
    'print "No 3"
    Goto Norespons 'No Modem not responding
  else
    FResult=1
  end if
Norespons:
'  enable interrupts
  SendSMS=Fresult
end function


getGSM:
 gsmline=""
 more:
 if Ischarwaiting(#3) > 0 then
     get #3,gsmchar
     gsmline=gsmline+chr(gsmchar)
     if gsmchar=10 then
       print gsmline
       return
     end if
 End if
 goto more
 return

function Waitfor(byval What as string*20,Byval MaksVent as Long ) As Byte
 disable interrupts
 'print "sek5=";sek
 FResult=0
 gsmline=""
 vent=0
' print "Waiting for ";what;
' print len(what)
 while what<>gsmline
   if Ischarwaiting(#3) > 0 then
     vent=0
     get #3,gsmchar
     'print chr(gsmchar);
     if gsmchar=10 or gsmchar=13 then
       gsmline=""
     else
       gsmline=gsmline+chr(gsmchar)
       'print "G=";gsmline
     end if
     if what=gsmline then
      print "Waitfor=";gsmline
      FResult=1
      goto EndWait
     ENd if
     'if gsmchar=10 or gsmchar=13 then
     '  if FResult=1 then goto endwait
     '  if len(gsmline)>1 then
     '    print "WaitFor ";gsmline
     '  end if
     '  gsmline=""
     'end if
   else

     waitus 10
     incr Vent
     If Vent>MaksVent then
       print "Timeout waiting for"; what
       Goto EndWait
     End if
   end if
 wend
EndWait:
while ischarwaiting(#3)>0
 get #3,gsmchar
 waitus 10
wend
''print "Sek6";sek
'enable interrupts
'print "Waitfor=";Result
waitfor=Fresult
end function

'********************************************************************