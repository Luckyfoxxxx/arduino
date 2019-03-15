'For Arduino Uno: Use "Arduino" Programmer in "Options - Programmer"
'Arduino UNO Programmer Baudrate 115200

'For Arduino Mega R3: Use "Arduino STK500V2" Programmer in "Options - Programmer"
'Arduino MEGA Programmer Baudrate 115200

'White Bird data:
'Rudderlag. =300mS Hvor lenge roret beveger seg etter at motor er skrudd av
'MinMotor =100mS   Hvor lenge motor må gå for at roret skal bevege seg.
'Backlash=100mS   Hvor lenge motor må gå for ar roret skal bevege seg, når det skal beveges i motsatt retning av sist.


$regfile = "m2560def.dat"                                   ' used micro
$crystal = 16000000                                         ' used xtal
$hwstack = 500
$swstack = 500
$framesize = 500
$frameprotect = 1
disable jtag

'Config the I2C communication for reading altenators AMP and Battery AMP. *******************
Config Scl = Portd.0                                        ' we need to provide the SCL pin name
Config Sda = Portd.1                                        ' we need to provide the SDA pin name
Config I2cdelay = 5
'I2cinit

'Pump output (Port)
Config PortL.2 = Output
Goport Alias PortL.2
Goport = 0

'Pump Output (Stb)
Config PortL.0 = Output
Gostb Alias PortL.0
Gostb = 0



'Beeper
config portl.4=output
portl.4=0
Beeper alias portl.4

'Test Btn.
Config portG.0=input
portg.0=1
btnTest alias ping.0

'Hold Btn.
Config portc.6=input
portc.6=1
HoldBtn alias pinc.6

'Hold Led.
config porta.7=output
porta.7=0
HoldingLED alias porta.7

'AntiR Btn.
Config porta.5=input
porta.5=1
antirbtn alias pina.5

'AntiRLED
config portc.2=output
portc.2=0
AntiRLED alias portc.2

'MainKey  If No key or Onshore then alarm is activated.
Config PortK.1=input
portk.1=0
OnBoard alias pink.1

Config portk.0=input
portk.0=0
OnRoute alias pink.0

config portl.1=input
portl.1=0
OnShore alias pinl.1


'GSMPower
Config portc.5=output
portc.5=0
GSMPwr alias portc.5


'220V Detect
'config portk.3=input
'portk.3=0
'220V alias pink.3


Dim Xs, Ys, Zs As Single
Dim Xl, Yl, Zl As Long
Dim Xi, Yi, Zi as integer
Dim Xb, Yb, Zb as byte
Dim Elbyte, EhByte As Byte
Dim B1, B2, B3, Rbyte as byte
Dim TmpStr as string*20

Dim Fail as integer



Dim Char As Byte

const _VALCHECK =1



'Clock Is 16mhz
'16bit Max Count 65535
'1 cycle is 1/16 microsekund
'with prescaler 1024: 16 000 000/1024 =15625 ticks /sec
'with prescaler 256: 16 000 000/256 =62500 ticks /sec
'with prescaler 64: 16 000 000/64 =250 000 ticks /sec eller 25 000 tics pr 100mS
'Timer is counting UP, so to set 10.000 tics set Timer1=65535-10.000
dim TimerMax as long
TimerMax=65535


'Compass .....
'Dim Oslinje As String * 50
dim CompassOK as integer
Dim Rolls(10) As Integer
Dim Rollsum As Long
Dim Roll As Integer
Dim CompassHeading as integer
config portk.2=output
compassled alias portk.2

'GPS
Dim GPSOK as integer
Dim GPSFlag as integer
Dim Gpslinje As string *100                                  'Line from GPS
Dim Gpsheading As Integer
Dim GpsSpeed As Integer
Dim Lengde, Bredde as long
Dim Startlat, Startlon As Single
Dim Nowlat, Nowlon As Single
Dim Sekund As Byte
Dim Minutt As Byte
Dim Timen As byte
Dim Dag As byte
Dim Maned as byte
Dim Ar as integer
Dim MaxGPSTime as integer
config portb.2=output
portb.2=0
GPSLED alias portb.2



'GSM
dim GSMLinje as string*100
config portC.7=Output
portc.7=0
GSMReset alias portc.7
Config Portc.5=output
portc.5=0
GSMPower alias portc.5
Dim GSMOK as byte
Dim GSMRetry as byte
Dim GSMHavePower as byte

'Engine
Dim Correction as Single
Dim StoppingEngine as byte
Dim I2c(14) As Byte
dim Minus as byte
Dim STBCharge, PortCharge, BattCharge,Remainder as long 'Engines charging current in mA
Dim STBVolt, PortVolt, BattVolt as integer  'Engines Charging Volt in mV
dim BatteryCap, BatterymAH as long
dim StbOil, PortOil, StbTemp, PortTemp as integer 'Engines Oil and temp.
'Dim STBFaktor, PortFaktor, BattFaktor as long 'Multipliers to get correct mA reading fra raw I2C data
'StbFaktor=1960    'ADC 18 Bit to real faktor
'PortFaktor=1960   'ADC 18 Bit to real faktor
'BattFaktor=100    'ADC 18 Bit to real faktor
dim StbRev, PortRev as integer
'Portrev on ADC 4
'StbRev on ADC 5
'Stop stb. Engine
config Portb.6=Output
StopSEngine alias portb.6
StopSengine=0
'Stop Port. Engine
config Portb.7=Output
StopPEngine alias portb.7
StopPEngine=0

dim BattAmpOK as byte
dim StbAmpOK as Byte
dim PortAmpOK as byte


'ADC Constants
Dim PortRPMC As Integer
Dim PortOilc As Integer
Dim PortTempC As Integer
Dim PortALternatorVC As Integer
Dim PortAlternatorAC As Integer
Dim StbRPMC As Integer
Dim StbOilc As Integer
Dim StbTempC As Integer
Dim StbALternatorVC As Integer
Dim StbAlternatorAC As Integer
Dim WaterC As Integer
Dim DieselC As Integer
Dim BatteryVC As Integer
Dim BAtteryAC As Integer




'WIFI


'Universal
Dim MainKey as integer '0=Off, 1=On Board, 2=On Route, 3=On Shore.
Dim Tiden As String * 20
Dim MainLoop as long
Dim Kar as string*2
dim CRLF as string*2
crlf=chr(13)+chr(10)
dim Water, Diesel as integer


'Alarm
Dim DayCounter as Long
Dim OutCounter as integer
Dim InCounter as Integer
dim OnCounter as integer
Dim AktivertFlag as integer
dim Pumpflag as integer
dim Mainsflag as Integer
DIm Irdflag as integer
Dim IRDSent as integer
Dim MainsSent as integer
Dim PumpSent as integer
dim SendIT as integer
Dim Idleblink As Integer
Dim MaxInTime as Integer
config portl.3=input
portl.3=1
IRD alias pinL.3
Config portk.3=input
portk.3=1
Mains alias pink.3
Config PortL.5=input
Pump alias pinl.5


'AutoPilot
Dim Coarsetohold As Integer
'Const Pi = 3.14159265358979
'Const Pi2 = 1.5707963267949
Dim OC, LastOC, RT as long               'OffCoarse, LastOffcoarse, Rate of turn
Dim Turnedoff as string*20
Dim PumpTime as Long
Dim Rudder, LastRudder As Integer
Dim Centertime as integer                'If Coarse stable >Centertime then set RudderCenter.
Dim Turnport, TurnStb, LastTurn As Byte   'Angir hvor mange 50mS kursjustering skal utføres
Dim Heading, TmpHeading As Integer
Dim Offsetcounter As Integer
dim LastCorrection as integer
Dim Co As Integer
Dim Ro As Integer
Dim Holding As integer
Dim Antiroll As Byte
Antiroll = 0
Holding = 0

'PC Connection
Config Com1 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Serialin = Buffered , Size = 40
Open "com1:" For Binary As #1
waitms 1000
print "PC Con set"

'Steering variables in EEProm
'EEPROM Values, which can be set from command and monitor module
Dim Ruddermin As Integer
Dim Ruddermax As Integer
dim RudderCenter as integer
Dim Working as byte


'********************************************************
'Read the EEProm values
Readeeprom Elbyte , 20
Readeeprom Ehbyte , 21
Ruddermin = Ehbyte * 256
Ruddermin = Ruddermin + Elbyte

Readeeprom Elbyte , 22
Readeeprom Ehbyte , 23
Ruddermax = Ehbyte * 256
Ruddermax = Ruddermax + Elbyte

Readeeprom Elbyte , 24
Readeeprom Ehbyte , 25
RudderCenter = Ehbyte * 256
RudderCenter = RudderCenter + Elbyte

xi=ruddermax-ruddermin
xi=xi/2
if ruddercenter<ruddermin then
  ruddercenter=xi +ruddermin
Elseif ruddercenter>ruddermax then
  ruddercenter=xi+ ruddermin
End if

dim STMR as integer 'smalest time used to move rudder. Integer in mS   EE 26&27
Readeeprom Elbyte , 26
Readeeprom Ehbyte , 27
stmr = Ehbyte * 256
stmr = stmr + Elbyte

dim MTMR as integer 'Max time to move rudder. Integer in ms EE 28&29
Readeeprom Elbyte, 28
Readeeprom Ehbyte ,29
mtmr = Ehbyte * 256
mtmr = mtmr + Elbyte


dim RBL as integer 'Rudder backlash. Ekstra time when rudder is moved in opposite direction. Integer in mS   EE 30&31
Readeeprom Elbyte,30
Readeeprom Ehbyte,31
rbl = Ehbyte * 256
rbl = rbl + Elbyte

dim RL as integer 'Rudder lag. Time after rudder is moved when rudder position is read. Integer in mS       EE 32&33
Readeeprom Elbyte,32
Readeeprom Ehbyte,33
rl = Ehbyte * 256
rl = rl + Elbyte

dim MaxRT as integer 'max Rate of turn. Integer  in .1 degrees/sec. EE 34&35
Readeeprom Elbyte,34
Readeeprom Ehbyte,35
Maxrt = Ehbyte * 256
Maxrt = maxrt + Elbyte

dim MinRT as integer 'min Rate of turn. Integer in .1 degrees/sec. EE 36&37 (Used when OC> maxOC)
Readeeprom Elbyte,36
Readeeprom Ehbyte,37
Minrt = Ehbyte * 256
Minrt = Minrt + Elbyte

Dim MaxOC as integer 'Max Off coarse. Integer in  .1 degrees. EE 38&39  (IF MaxOC then RT should be at least MinRT)
Readeeprom Elbyte,38
Readeeprom Ehbyte,39
maxOC = Ehbyte * 256
MaxOC = MaxOC + Elbyte

dim RMC as integer   'Rudder moove constant. Integer. EE 40&41  OC and RT is multiplied with RMC to get rudder pump time.
Readeeprom Elbyte,40
Readeeprom Ehbyte,41
rmc = Ehbyte * 256
rmc = rmc + Elbyte

dim WAS as integer   'Seconds to wait after a steering is done. Integer. EE 42&43
Readeeprom Elbyte,42
Readeeprom Ehbyte,43
WAS = Ehbyte * 256
WAS = WAS + Elbyte

dim CIC as integer   '.1 degrees to start counter action when closing in on HoldCoarse Integer. EE 44&44
Readeeprom Elbyte,44
Readeeprom Ehbyte,45
CIC = Ehbyte * 256
CIC = CIC + Elbyte

dim OCV as integer  '.1 degrees to start counter action when closing in on HoldCoarse Integer. EE 44&44
Readeeprom Elbyte,46
Readeeprom Ehbyte,47
OCV = Ehbyte * 256
OCV = OCV + Elbyte

dim RTV as integer   '.1 degrees to start counter action when closing in on HoldCoarse Integer. EE 44&44
Readeeprom Elbyte,48
Readeeprom Ehbyte,49
RTV = Ehbyte * 256
RTV = RTV + Elbyte

dim OCF as integer   'Off coarse faktor. OCF * OC = Time to move rudder. Result is divided by 100 before used.
Readeeprom Elbyte,50
Readeeprom Ehbyte,51
OCF = Ehbyte * 256
OCF = OCF + Elbyte

dim RTF as integer   'Rate of Turn faktor. RT * RTF= time to move ruder. Result is divided by 100 before used.
Readeeprom Elbyte,52
Readeeprom Ehbyte,53
RTF = Ehbyte * 256
RTF = RTF + Elbyte

dim HeadingSource as byte         'Angir hvor Kurs hentes fra. 0=Compass, 1=GPS, 2=Snitt av Compass og GPS
Readeeprom Elbyte,54
HeadingSource = Elbyte
If headingsource>2 then headingsource=0

Dim HeadingAverage as byte       'Angir hvor mange data fra kurs som det skal beregnes gjennosnitt av, 0 to 10
Readeeprom Elbyte,56
HeadingAverage = Elbyte
If HeadingAverage>10 then HeadingAverage=0

Readeeprom Elbyte,58     'Constant for Port RPM ADC
Readeeprom Ehbyte,59
PortRPMC=ehbyte*256
PortRPMC=PortRPMC+elbyte

Readeeprom Elbyte,60     'Constant for Port Oil ADC
Readeeprom Ehbyte,61
PortoilC=ehbyte*256
PortoilC=PortOIlC+elbyte

Readeeprom Elbyte,62      'Constant for Port Temp ADC
Readeeprom Ehbyte,63
PortTempC=ehbyte*256
PortTempC=PortTempC+elbyte

Readeeprom Elbyte,64       'Constant for Port Alternator Volt
Readeeprom Ehbyte,65
PortAlternatorVC=ehbyte*256
PortAlternatorVC=PortAlternatorVC+elbyte

Readeeprom Elbyte,66        'Constant for Port Alternator Amp
Readeeprom Ehbyte,67
PortAlternatorAC=ehbyte*256
PortAlternatorAC=PortAlternatorAC+elbyte

Readeeprom Elbyte,68     'Constant for Stb RPM ADC
Readeeprom Ehbyte,69
StbRPMC=ehbyte*256
STbRPMC=StbRPMC+elbyte

Readeeprom Elbyte,70     'Constant for Stb Oil ADC
Readeeprom Ehbyte,71
StboilC=ehbyte*256
StboilC=StboilC+elbyte

Readeeprom Elbyte,72      'Constant for Stb Temp ADC
Readeeprom Ehbyte,73
StbTempC=ehbyte*256
StbTempC=StbTempC+elbyte

Readeeprom Elbyte,74       'Constant for Stb Alternator Volt
Readeeprom Ehbyte,75
StbAlternatorVC=ehbyte*256
StbAlternatorVC=StbAlternatorVC+elbyte

Readeeprom Elbyte,76        'Constant for Stb Alternator Amp
Readeeprom Ehbyte,77
StbAlternatorAC=ehbyte*256
StbAlternatorAC=StbAlternatorAC+elbyte


Readeeprom Elbyte,78     'Constant for Water ADC
Readeeprom Ehbyte,79
WaterC=ehbyte*256
WaterC=waterC+elbyte

Readeeprom Elbyte,80     'Constant for Diesel ADC
Readeeprom Ehbyte,81
DieselC=ehbyte*256
DieselC=DieselC+elbyte

Readeeprom Elbyte,82     'Constant for BAttery Volt ADC
Readeeprom Ehbyte,83
BAtteryVC=ehbyte*256
BatteryVC=BAtteryVC+elbyte

Readeeprom Elbyte,84     'Constant for Battery AMP ADC
Readeeprom Ehbyte,85
BatteryAC=ehbyte*256
BatteryAC=BatteryAC+elbyte


Readeeprom Elbyte,86     'Battery Capasity in mAh
Readeeprom Ehbyte,87
BatteryCap=ehbyte*256
BatteryCap=BatteryCap+elbyte
Batterycap=batterycap*1000
BatterymAh=BatteryCap      'Start with the asumption the battery is full

dim Cadj as integer  'Correction to compass to get true heading of boat
Readeeprom Elbyte,88
Readeeprom Ehbyte,89
cadj=ehbyte*256
cadj=cadj+elbyte

'Declare Function Getangle(byval Lon1 As Single , Byval Lat1 As Single , Byval Lon2 As Single , Byval Lat2 As Single) As Single
'Declare Function Getdistance(byval Lon1 As Single , Byval Lat1 As Single , Byval Lon2 As Single , Byval Lat2 As Single) As Single
'Declare Function Arctan2(x As Single , Y As Single) As Single
'declare sub AskCompass()
'declare sub GetCompass()
'declare sub AskGPS()
declare function WaitFor(byval What as string*20,Byval Maksvent as long) as byte 'Waiting max 10sec
'function Waitfor(byval What as string*20,Byval MaksVent as Long, Byval Port as byte) As Byte
declare function SendSMS(Byval Msg as string *20, byval number as byte) as byte
declare sub SendToGSM(byval What as string*20,Byval SendCR as byte )
declare function SendALARM(Byval Msg as string *20, Byval Number as byte) as byte

declare sub SaveToEE(byval Length as byte, Byval Pos as byte)
declare Sub Initcell(byval Ic As Byte)
declare sub ReadCell(Byval IC as byte)
declare sub GSM_ISR()
Config Adc = Single , Prescaler = Auto , Reference = Aref
Start Adc



'EM506 GPS
Config Com2 = 38400 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Serialin1 = Buffered , Size = 200
Open "com2:" For Binary As #2
'config int1=falling
'on int1 GPS_ISR
Dim Bauden as long
Bauden=4800

'CMPS12 Compass com3
Config Com3 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Serialin2 = Buffered , Size = 50
Open "com3:" For Binary As #3


'WIFI HKL RM04
Config Com4 = 57600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Serialin3 = Buffered , Size = 100 ', Bytematch = 10
'Config Serialout3 = Buffered , Size = 200 ', Bytematch = 10

Open "com4:" For Binary As #4
Dim WifiLine as string*50
Config portb.0=output
portb.0=0
WifiLED alias portb.0

print "0"
'GSM RB-elf-68
config portc.1=input
portc.1=1
config portc.3=output
portc.3=1
open "comc.1:19200,8,n,1" for input as #5
open "comc.3:19200,8,n,1" for output as #6
config porte.4=input
config int4=falling
on int4 GSM_ISR
Print "00"
wait 1

IF GSMOK=0 then
   print "GSM Fault"
end if
'config watchdog=2048
'start watchdog
print "000"

'If TEST button pressed during startup, GOTO SetUp routine
If BtnTest = 0 Then
 'Goto Rudderadjust
End If

'Enable int1         'Enable GPS interrupt
Disable int4        'Do not listen to GSM when MainKey is NOT Off or in OnShore.
print "0000"
Enable interrupts

Goto Startup


Starten:


turnedoff="StartUp"
Holding = 0
Goport = 0
Gostb = 0
Startlat = 0
Startlon = 0

print "Start with min=";ruddermin;"  max=";ruddermax ;" Onboard=";onboard; " Onroute=";onroute
dim OffString as string*10

LastRudder = Getadc(2)


Toppen: '********************* Main Loop
'Check Mainkey.
if onboard=0 and onroute=0 and onshore =0 then
  mainkey=0
end if
if onboard=1 then
  waitms 50
  if onboard=1 then
    mainkey=1
  end if
elseif onroute=1 then
  waitms 50
   if onroute=1 then
      mainkey=2
   end if
elseif onshore=1 then
  waitms 50
   if onshore=1 then
     mainkey=3
   end if
end if


if mainkey=0 or mainkey=3 then
  'print "Going to Walk Out"
  'goto Walkout
ENd if


'Every 1s GPS gives one line.
'Coarse is adjusted, displays updated.

'Check Rudder
'Check Buttons
'Check if GPS is talking
'Check if Compass is talking
'Check if Mainloop = 200ms  to ask GPS and Compass
'Check if coarseloop = 5 to do coarse adjust.

'************************** Check if rudder manually moved
  If Holding = 1 and working=0 Then
    Rudder = Getadc(2)
    Xi = Lastrudder - Rudder
    If Abs(xi) > 20 Then
      'Print "turning OFF Last=" ; Lastrudder ; "  Rudd=" ; Rudder
      yi=abs(xi)
      offstring=str(yi)
      turnedoff="Rudder Mooved "+offstring
      'Holding = 0
      Goport = 0
      Gostb = 0
    End If
  End If

'*********************  Check Holdbutton
  If Holdbtn = 0 Then
    Waitms 10
    If Holdbtn = 0 Then
      While Holdbtn = 0
        Waitms 10
      Wend
      Waitms 10
      If Holding = 1 Then
        print "Hold"
        turnedoff="Hold Btn"
        Holding = 0
        Holdingled = 0
        Antiroll = 0
        Antirled = 0
        Goport = 0
        Gostb = 0
        Startlat = 0
        Startlon = 0
        Print "Hold OFF"
      Else
        if gpsspeed>-1 then
          Rudder = Getadc(2)
          Lastrudder = Rudder
          Holding = 1
          Coarsetohold = Heading
          Startlat = Nowlat
          Startlon = Nowlon
          Print "HOLD =" ; Heading ; " Rudder=" ; Rudder
        else
          Rudder = Getadc(2)
          Lastrudder = Rudder
          Holding = 1
          Coarsetohold = Heading
          Startlat = Nowlat
          Startlon = Nowlon
          print "Uffda"
        end if
      End If
'      Enable Interrupts
    End If
  End If

'******************************* GPS
'Check if GPS is talking
  If ischarwaiting(#2)>0 Then
    gosub readgps   'Also reading Compass
    if holding=1 and gpsok=1 then
      gosub holdHeading
    End if

    'Check if Stop Engine is activated
    if stopsengine=1 or stoppengine=1 then
      incr stoppingengine
      if stoppingengine>3 then
        stopsengine=0
        stoppengine=0
      End if
    End if


    gosub SendStatus
    gpsok=0
    compassok=0
  end if

'******************************* WIFI
'Check if Wifi is talking
  If Ischarwaiting(#4) > 0 then

    print "Wifi Talking"
    gosub getWifi
  end if

'*******************************PC
'Check if PC is talking
  If Ischarwaiting(#1) > 0 Then
    get #1,char

  end if

'Check if we have received from WIFI
  if instr(gsmlinje,"RING")>0 then
     gsmlinje=""
     print "RING"
  end if


goto toppen



Sub GSM_ISR()
'ISR when something is transmitted fro the GSM
'Wait max 2mS after last char.
disable int4
gsmlinje=""
zi=2000
char=0
while zi>0
  char=inkey(#5)
  'if char=10 or char=13 then
'    zi=2000
  if char>0 then
    zi=2000
    print chr(char);
    gsmlinje=gsmlinje+chr(char)
  else
    decr zi
  ENd if
  waitus 1
wend
eifr.int4=1

enable int4
End sub



End



$include "StartUP.bas"
$include "GPSLine.bas"
'$include "OneLine.bas"
$include "checkcoarse.bas"
$include "RudderAdjust.bas"
$include "GSM.bas"
$include "Wifi.bas"
$include "ReadI2C.bas"
$include "Alarm.bas"