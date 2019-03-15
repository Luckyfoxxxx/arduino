'For Arduino Uno: Use "Arduino" Programmer in "Options - Programmer"
'Arduino UNO Programmer Baudrate 115200

'For Arduino Mega R3: Use "Arduino STK500V2" Programmer in "Options - Programmer"
'Arduino MEGA Programmer Baudrate 115200

'MainLoop venter på;
' Kommando fra PC
' Knappene
' Interrupt om at det er kommet en linje fra Kompass. (Kommer 5 ganger pr sekund)
' OG Sjekker om det skal gjøres kursjusteringer en gang pr sekund
' OG Sjekker om eventuell kursjustering skal stoppes.

'White Bird data:
'Rudderlag. =300mS Hvor lenge roret beveger seg etter at motor er skrudd av
'MinMotor =100mS   Hvor lenge motor må gå for at roret skal bevege seg.
'Backlash=100mS   Hvor lenge motor må gå for ar roret skal bevege seg, når det skal beveges i motsatt retning av sist.


$regfile = "m2560def.dat"                                   ' used micro
$crystal = 16000000                                         ' used xtal
$hwstack = 1000
$swstack = 1000
$framesize = 1000
$frameprotect = 1

'$include "config_MMCSD_HC.bas"
'$include "config_AVR-DOS.bas"

'Config PortF.5 = Output
'Goport Alias PortF.5
'Goport = 0

'Config PortF.6 = Output
'Gostb Alias PortF.6
'Gostb = 0


'Config the I2C communication *******************
Config Scl = Portd.0                                        ' we need to provide the SCL pin name
Config Sda = Portd.1                                        ' we need to provide the SDA pin name
Config I2cdelay = 5
I2cinit



Config Adc = Single , Prescaler = Auto , Reference = Aref
Start Adc
Dim Idleblink As Integer

Config PortF.4 = Input
Holdbtn Alias PinF.4
PortF.4 = 1

Config PortF.3 = Input
Antirbtn Alias PinF.3
PortF.3 = 1

Config PortC.0 = Output
Holdingled Alias PortC.0
Holdingled = 0

Config PortC.2 = Output
Antirled Alias PortC.2
Antirled = 0


'Rudder driver
config portA.1=output
goport alias porta.1
config PORTA.2=OUTPUT
gostb alias porta.2
goport=0
gostb=0

Config PortF.7 = Output
Test Alias PortF.7
Test = 0

'Config Port for SD Card detect   *************************
'Card present = 1
Config PortG.0 = Input
PortG.0 = 1
CardPresent Alias PinG.0

Dim CardEjected As Byte

'Config Communication LEDs
config portK.7 =output
GPSLED alias portk.7
GPSled=0

config portk.6 =Output
LED4d alias portk.6
led4d=0

config portk.3=Output
CompLED alias portk.3
compled=0

'Encoder:
Config Porte.4 = Input
cha Alias Pine.4
Porte.4 = 1

Config PortL.4 = Input
chb Alias Pinl.4
Portl.4 = 1


Config PortL.6 = Input
EncoderSW alias Pinl.6
Portl.6 = 1

'Watchdog.
config porta.1 =OUTPUT
WD alias porta.1

dim Xb as byte
Dim Xi as integer
Dim Xl As Long

dim Yb as byte
Dim Yi As Integer
Dim Yl As Long

Dim Zb as byte
dim Zi as integer
Dim Zl as long

Dim Elbyte As Byte
Dim Ehbyte As Byte


Dim Ant As Byte
Dim Char As Byte

Dim Roll As Integer
Dim Rolls(10) As Integer
Dim Rollsum As Long
'Dim Avrheading As Integer
'Dim Lastloops As Integer
'Dim Lloops As Integer
'Dim Rdelta As Integer                                       'Endring i retning siden siste måling. Kalkuleres hvert 100ms
                  'Verdi er grader endring x 10
                  'Dreining mot StB (Økende Grader) gir Rdelta 1-9000
                  'Dreining mot Port (Minkende Grader) gir Rdelta 10000-20000


dim Minus as byte
Dim Complinje As string*50                               'Line from Compass
Dim Gpslinje As string*50                                'Line from GPS
Dim MaxGPSTime as integer                                'Maxtime to wait for GPS data
dim CompassOK as byte
dim GPSOK as Byte




'EEPROM Values, which can be set from command and monitor module
Dim Ruddermin As Integer
Dim Ruddermax As Integer
dim RudderCenter as integer
Dim RudderDelay as Integer           'Angir min pumpetid for at ror skal bevege seg
Dim Rudderlag as integer             'Angir hvor lenge ror beveger seg etter en kjøring i mS

Dim Maxturn as integer               'Angir max pumpetid i ms
Dim Backlash As integer              'Angir i mS hvor stor backlash det er i roret.
dim MaxDiff as integer               'Angir max avvik fra Kurs før kurskooresjon i 0.1 grader
dim LastDiff as integer              'Angir forrige avvik fra kurs

Dim OffFaktor As Integer             'Angir hvor stort rorutslag det skal være iht hvor mye ute av kurs båten er
Dim Rotfaktor As Integer             'Angir hvor stort rorutslag det skal være iht hvor fort båten beveger seg fra riktig kurs.

dim HeadingSource as integer         'Angir hvor Kurs hentes fra. 0=Compass, 1=GPS, 2=Snitt av Compass og GPS

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

Readeeprom Elbyte , 26
Readeeprom Ehbyte , 27
RudderDelay = Ehbyte * 256
Rudderdelay = RudderDelay + Elbyte

Readeeprom Elbyte , 28
Readeeprom Ehbyte , 29
RudderLag = Ehbyte * 256
RudderLag = RudderLag + Elbyte

Readeeprom Elbyte , 30
Readeeprom Ehbyte , 31
MaxTurn = Ehbyte * 256
MaxTurn = MaxTurn + Elbyte

Readeeprom Elbyte , 32
Readeeprom Ehbyte , 33
BackLash = Ehbyte * 256
BackLash = BackLash + Elbyte

Readeeprom Elbyte , 34
Readeeprom Ehbyte , 35
MaxDiff = Ehbyte * 256
MaxDiff = MaxDiff + Elbyte

Readeeprom Elbyte , 36
Readeeprom Ehbyte , 37
LastDiff = Ehbyte * 256
LastDiff = Lastdiff + Elbyte

Readeeprom Elbyte , 38
Readeeprom Ehbyte , 39
RudderCenter = Ehbyte * 256
RudderCenter = RudderCenter + Elbyte

Readeeprom Elbyte , 40
Readeeprom Ehbyte , 41
OffFaktor = Ehbyte * 256
OffFaktor = OffFaktor + Elbyte

Readeeprom Elbyte , 42
Readeeprom Ehbyte , 43
RotFaktor = Ehbyte * 256
RotFaktor = Rotfaktor + Elbyte

Readeeprom Elbyte , 44
Readeeprom Ehbyte , 45
HeadingSource = Ehbyte * 256
HeadingSource = HeadingSource + Elbyte



'********************************************



Dim Rudder As Integer
Dim Lastrudder As Integer           'Siste rorposisjon.
Dim Pump as integer                 'Angir pumpetid i mS for kurskorreksjon. Positive betyr styr til styrbord
Dim Lastturn As Byte                'TIL hvilken side det sist ble gjort kursendring mot 1=Babord, 2 =Styrbord

Dim Heading As Long                 'Compass Heading
Dim Gpsheading As Integer
Dim GpsSpeed As Integer

Dim Holding As Byte                 '1=Hold angitt kurs
Dim Coarsetohold As Integer         'Angitt Kurs
Dim Antiroll As Byte                '1=Bruk ror for å motvirke krenging
Antiroll = 0
Holding = 0

Dim Coarse as integer               'Kurs som benyttes i kursberegning. Compass, GPS eller et snitt av begge
Dim OffHold as integer              'Angir i .1 grad avvik fra angitt kurs.
Dim LastOff as integer              'Angir forrige avvik
Dim OFFDir as integer               '=Offhold-Lastoff som angir om avvik er økende eller minkende.
dim LastOffDir as integer           'Angir forrige avviks øking eller minking
Dim OffSpeed as integer             'Angir hastighet på kursendringen

Dim Offsetcounter As Integer


'Dim RotSpeed as integer                                       'Angir hvor for båten dreier.
'Dim LastRotSpeed as integer                                   'Angir hvor fort båten dreide sist.

const _VALCHECK =1

dim innstr as string*40
dim Tiden as string*20


Dim Tiende As Byte
Dim Sekund As Byte
Dim Minutt As Byte
Dim Timen As byte
Dim Dag As byte
dim Maned as Byte
dim Aar as byte

Dim CRC as Byte
Dim RMax as integer

'Dim Presett As Long
'Clock Is 16mhz
'16bit Max Count 65535
'1 cycle is 1/16 microsekund
'with prescaler 1024: 16 000 000/1024 =15625 ticks /sec
'with prescaler 256: 16 000 000/256 =62500 ticks /sec
'with prescaler 64: 16 000 000/64 =250 000 ticks /sec eller 25 000 tics pr 100mS
'Timer is counting UP, so to set 10.000 tics set Timer1=65535-10.000

'dim TimerMax as long
'TimerMax=65535

'Config Timer1 = Timer , Prescale = 1024                     '15.6ticks/ms   100ms=1560 tick
'On Timer1 Stoppit:
'Enable Timer1
'stop timer1



Dim Kar as string*2



Dim Ezbyte As Byte
dim FilNavn as string*25
Dim MainLoop as long
dim Calibrating as integer
Dim CoarseLoop as integer
dim CRLF as string*2
crlf=chr(13)+chr(10)
dim Speedwarning as integer
Dim SDCardOK as integer
Dim DontSend as integer
Dim Turnedoff as string*20





Declare Function Getpcresponce() As String * 30
'Declare Function Getangle(byval Lon1 As Single , Byval Lat1 As Single , Byval Lon2 As Single , Byval Lat2 As Single) As Single
'Declare Function Getdistance(byval Lon1 As Single , Byval Lat1 As Single , Byval Lon2 As Single , Byval Lat2 As Single) As Single
'Declare Function Arctan2(x As Single , Y As Single) As Single
declare sub AskCompass()
declare sub GetCompass()
declare sub AskGPS()


Config Adc = Single , Prescaler = Auto , Reference = AVCC
Start Adc

'PC Connection
Config Com1 = 115200 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Serialin = Buffered , Size = 40
Open "com1:" For Binary As #1


'ME506 GPS
Config Com2 = 38400 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Serialin1 = Buffered , Size = 100
Open "com2:" For Binary As #2

Dim Booting as integer
booting=1

turnedoff="StartUp"
Holding = 0
Holdingled = 0
Antiroll = 0
Antirled = 0
Goport = 0
Gostb = 0





'Initier LCD
Cls
Locate 1 , 1
Lcd "Hold + AntiR to"
locate 2,1
Lcd "Rudder Adjust"
wait 2

'If BOTH button pressed during startup, GOTO SetUp routine
If Holdbtn = 0 And Antirbtn = 0 Then
 Goto Rudderadjust
End If

Starten:


Start2:

gosub Initgps
if GPSok=0 then
   Cls
   Locate 1 , 1
   Lcd "GPS Not responding"
  'print "NO GPS!"
   Locate 2,1
   lcd "START? -> HOLD"
   while holdbtn=1
   wend
   while holdbtn=0
     waitms 50
   wend
end if

if gpsok=1 and sdcardok=1 then 'Open a new file for Logg
  gosub OpenLog
end if

Start3:



Cls
Locate 1 , 1
Lcd "WHITE BIRD AUTOPILOT"
locate 2,1
Lcd "        IDLE"

Enable Interrupts

print "Start with min=";ruddermin;"  max=";ruddermax
dim OffString as string*10

Toppen: '********************* Main Loop
'Every second Coarse is adjusted, displays updated and all data logged to SD Card.

'Check Rudder
'Check Buttons
'Check if GPS is talking
'Check if Compass is talking
'Check if 4D is talking
'Check if Mainloop = 200ms  to ask GPS and Compass
'Check if coarseloop = 5 to do coarse adjust.
  if cardpresent=0 then
    cardejected=1
    sdcardok=0
  End if
  toggle wd
  rudder=getadc(2)
  '************************** Check if rudder manually moved
    If Holding = 1 Then
      Xi = Lastrudder - Rudder
      If Abs(xi) > 20 Then
        'Print "turning OFF Last=" ; Lastrudder ; "  Rudd=" ; Rudder ; "  xC=" ; Xc ; " YC=" ; Yc
        yi=abs(xi)
        offstring=str(yi)
        turnedoff="Rudder Mooved "+offstring
        Holding = 0
        Holdingled = 0
        Antiroll = 0
        Antirled = 0
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
        Print "Hold OFF"
      Else
        if gpsspeed>20 then
          Lastrudder = Rudder
          Holding = 1
          Coarsetohold = gpsHeading
          'Startlat = Nowlat
          'Startlon = Nowlon
          Print "HOLD =" ; Heading ; " Rudder=" ; Rudder
        end if
      End If
    End If
  End If


  '******************************* GPS
  'Check if GPS is talking
  If Ischarwaiting(#3) > 0 Then
    'print "GPS is talking"
    gosub getgps
    if gpsok=1 then
      if holding=1 and gpsok=1 then
        gosub holdHeading
      End if
      if sdcardok=1 then gosub WriteLog
    else
      print "Not OK"
    End if
  end if



  'Check if PC is talking
  If Ischarwaiting(#1) > 0 Then
    get #1,char
    print chr(char);
    if calibrating=1 then
       print #4,chr(char);
    end if
    if char=27 then
      calibrating=1
      print #4,chr(char);
    End if
    if char=32 then calibrating=0
  end if

goto toppen



'Stoppit:
'Pushall

'if RudderDelay=0 then
'  Goport=0
'  Gostb=0
'  timer1=timermax-6000 '400ms Delay (rudderlag) before reading rudder position
'  RudderDelay=1
'else
'  stop timer1
'  Rudder = Getadc(2)
'  Lastrudder = Rudder
'  working=0
'  rudderdelay=0
'End if
'popall
'return


End

'$include "SDCard.bas"
$include "GPSLine.bas"
'$include "OneLine.bas"
$include "HeadingNew.bas"
$include "RudderAdjust.bas"
'$include "Klokke.bas"
$include "FromPC.bas"