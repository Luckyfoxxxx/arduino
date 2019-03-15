'WIFI ******************
'Receives commands from WIFI and sending data and status to Monitor.

''WIFI Module HLK-RM04
'SSID: WB2018
'Pass : 2018WB8102
'IP: 192.168.11.254
'Port: 8080

Getwifi:
'Commands from Monitor are;
'Stopp Stb Engine  $SSE+cr+lf
'Stopp Port Engine $SPE+cr+lf
'Transfer autopilot constant $TAC+cr+lf
'Set Autopilot Constant $SACXyyy+cr+lf where X is 0 to 9, and yyy is formated integer value "000"
'Constants are;
'0=STMR smalest time used to move rudder. Integer in mS   EE 26&27
'1=MTMR Max time to moove rudder. Integer in ms EE 28&29
'2=RBL Rudder backlash. Ekstra time when rudder is moved in opposite direction. Integer in mS   EE 30&31
'3=RL Rudder lag. Time after rudder is moved when rudder position is read. Integer in mS       EE 32&33
'4=MaxRT max Rate of turn. Integer  in .1 degrees/sec. EE 34&35
'5=MinRT min Rate of turn. Integer in .1 degrees/sec. EE 36&37 (Used when OC> maxOC)
'6=MaxOC Max Off coarse. Integer in  .1 degrees/sec. EE 38&39  (IF MaxOC then RT should be at least MinRT)
'7=RMC   Rudder moove constant. Integer. EE 40&41  OC and RT is multiplied with RMC to get rudder pump time.

'After AP receives command it responds;
'$ commands requires no response.
'V commands, response with Variables
'F Commands, response with Factors
Wifiled=1
WifiLine=""
while ischarwaiting(#4)>0
  char=inkey(#4)
  'print chr(char);
  if char=10 or char=13 then
    if char=10 then exit while
  Else

    kar=chr(char)
    wifiline=wifiline +kar
  End if
  waitus 400
wend
wifiline=trim(wifiline)
print "From wifi: ";wifiline ;" ";Len(wifiline)
if len(wifiline)>3 then
  'Check command Line.
  if left(Wifiline,1)="$" then
    if wifiline="$SSE" then
      'Stopp Starboard Engine
      stopsengine=1
      StoppingEngine=0  'Stop relay will be shut off in main loop after 5 sec.
      'print #4,"$SSE"
    elseif wifiline="$SPE" then
      stopPengine=1
      StoppingEngine=0  'Stop relay will be shut off in main loop after 5 sec.
      'print #4,"$SPE"
    elseif wifiline="$SBE" then
      stopsengine=1
      stopPengine=1
      StoppingEngine=0  'Stop relay will be shut off in main loop after 5 sec.
      'print #4,"$SBE"
    elseif wifiline="$HOLD" then
      if holding=1 then
        holding=0
      Else
        holding=1
        coarsetohold=compassheading
      end if
    elseif left(wifiline,7)="$Coarse" then
      xi=len(Wifiline)
      xi=xi-7
      tmpstr=right(wifiline,xi)
      xi=val(tmpstr)
      coarsetohold=coarsetohold+xi
      if coarsetohold>359 then coarsetohold=coarsetohold-360
      if coarsetohold<0 then coarsetohold=coarsetohold+360
    elseif left(wifiline,10)="$NewCoarse" then
      tmpstr=right(wifiline,3)
      coarsetohold=val(tmpstr)
    elseif left(wifiline,11)="$BatterymAh" then
       tmpstr=right(wifiline,11)
       Batterymah=val(tmpstr)
       batterymah=batterymah*1000
    end if
  elseif left(Wifiline,1)="V" then
    if left(wifiline,10)="VRuddermin" then
       call savetoee(10,20)
       Ruddermin=zi
    elseif left(wifiline,10)="VRuddermax" then
       call savetoee(10,22)
       Ruddermax=zi
    elseif left(wifiline,13)="VRuddercenter" then
       call savetoee(13,24)
       Ruddercenter=zi
    elseif left(wifiline,5)="VSTMR" then
       call savetoee(5,26)
       STMR=zi
    elseif left(wifiline,5)="VMTMR" then
       call savetoee(5,28)
       MTMR=zi
    elseif left(wifiline,4)="VRBL" then
       call savetoee(4,30)
       RBL=zi
    elseif left(wifiline,3)="VRL" then
       call savetoee(3,32)
       RL=zi
    elseif left(wifiline,6)="VMINRT" then
      call savetoee(6,34)
      MinRT=zi
    elseif left(wifiline,6)="VMAXRT" then
      call savetoee(6,36)
      MaxRT=zi
    elseif left(wifiline,6)="VMAXOC" then
      call savetoee(6,38)
      MaxOC=zi
    elseif left(wifiline,4)="VRMC" then
      call savetoee(4,40)
      RMC=zi
    elseif left(wifiline,4)="VWAS" then
      call savetoee(4,42)
      WAS=zi
    elseif left(wifiline,4)="VCIC" then
      call savetoee(4,44)
      CIC=zi
    elseif left(wifiline,4)="VOCV" then
      call savetoee(4,46)
      OCV=zi
    elseif left(wifiline,4)="VRTV" then
      call savetoee(4,48)
      RTV=zi
    elseif left(wifiline,4)="VHDS" then
      call savetoee(4,54)
      Headingsource=zi
    elseif left(wifiline,4)="VHDA" then
      call savetoee(4,56)
      HeadingAverage=zi
    elseif left(wifiline,5)="VCADJ" then
      call savetoee(5,88)
      cadj=zi
    end if
    print "Sending variables."
    gosub sendvariables
  elseif left(wifiline,1)="F" then
    if left(wifiline,9)="FPortRPMC" then
      call savetoee(9,58)
      PortRPMC=zi
    elseif left(wifiline,9)="FPortOilC" then
      call savetoee(9,60)
      PortOilc=zi
    elseif left(wifiline,10)="FPortTempC" then
      call savetoee(10,62)
      PortTempC=zi
    elseif left(wifiline,17)="FPortAlternatorVC" then
      call savetoee(17,64)
      PortALternatorVC=zi
    elseif left(wifiline,17)="FPortAlternatorAC" then
      call savetoee(17,66)
      PortAlternatorAC=zi
    elseif left(wifiline,8)="FStbRPMC" then
      call savetoee(8,68)
      StbRPMC=zi
    elseif left(wifiline,8)="FStbOilC" then
      call savetoee(8,70)
      StbOilc=zi
    elseif left(wifiline,9)="FStbTempC" then
      call savetoee(9,72)
      StbTempC=zi
    elseif left(wifiline,16)="FStbAlternatorVC" then
      call savetoee(16,74)
      StbALternatorVC=zi
    elseif left(wifiline,16)="FStbAlternatorAC" then
      call savetoee(16,76)
      StbALternatorAC=zi
    elseif left(wifiline,7)="FWaterC" then
      call savetoee(7,78)
      WaterC=zi
    elseif left(wifiline,8)="FDieselC" then
      call savetoee(8,80)
      DieselC=zi
    elseif left(wifiline,10)="FBatteryVC" then
      call savetoee(10,82)
      BatteryVC=zi
    elseif left(wifiline,10)="FBatteryAC" then
      call savetoee(10,84)
      BatteryAC=zi
    elseif left(wifiline,11)="FBatteryCap" then
      call savetoee(11,86)
      Batterycap=zi
      batterycap=batterycap*1000
    end if
    gosub sendfactors
  end if
End if
endwifi:
WifiLed=0
return

SendVariables:
  Print #4,"V";Ruddermin;",";Ruddermax;",";Ruddercenter;",";STMR;",";MTMR;",";RBL;",";RL;",";MINRT;",";MAXRT;",";MAXOC;",";RMC;",";WAS;",";CIC;",";OCV;",";RTV;",";Headingsource;",";headingaverage;",";Cadj
return

SendFactors:
   print #4,"F"; PortRPMC;",";PortOilc;",";PortTempC;",";PortALternatorVC;",";PortAlternatorAC;",";StbRPMC;",";StbOilc;",";StbTempC;",";StbALternatorVC;",";StbAlternatorAC;",";WaterC;",";DieselC;",";BatteryVC;",";BAtteryAC;",";BatteryCap
return

SendStatus:
 'Routine with convertions takes 25mS to complete.
 'Routine without convertions takes 23ms to complete
 'Routine without convertions but with Buffer output=200 takes 12ms to complete
 wifiled=1
 'Read all Engine data, and send to Monitor, including GPS Data.
  call Readcell( 212)  'Read STB Engines Charging current
  call Readcell( 210)  'Read Port Engines Charging current
  call Readcell( 208)  'Battery Current

  'Calculate BAtterycapasity!

  remainder=remainder+battcharge
  print battcharge;"  ";remainder;"  ";
  if abs(remainder)>3600 then
     xl=remainder/3600
     batterymah=batterymah + xl
     remainder=remainder mod 3600
     print xl;"  ";Remainder;"  ";Batterymah
  ENd if

  if batterymah>batterycap then
     batterymah=batterycap
  ENd if
  if batterymah<0 then
     batterymah=0
  end if
  'Port Gen Volt
  PortVolt=getadc(38)
  'xl=xi*1521
  'xl=xl+5
  'xl=xl/1000
  'PortVolt=xl

  'Stb Gen Volt
  StbVolt=getadc(39)
  'xl=xi*1521
  'xl=xl+5
  'xl=x l/1000
  'STBVolt=xl

  'Battery Volt
  BattVolt=getadc(6)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'BattVolt=xl



  'Stb RPM
  'White Bird data;
  '780RMP=175Hz    ;4.46 RMP/Hz
  '2000RPM=480Hz   ;4.17 RPM/Hz
  'CAble: 1=hvit(or), 2=Or(hvit), 3=(hvit(Gr), 4=blå, 5=hvit(blå), 6=grønn, 7=hvit(brun), 8= Brun.
  'Mesured ADC with;
  '        stb    port
  '100Hz;  87     93
  '200Hz   178    184
  '300Hz   269    273
  '400Hz   355    365
  '500Hz   440    455
  StbRev=getadc(5)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'Stbrev=xi

  'Port RPM
  PortRev=getadc(4)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'Portrev=xi

  'Stb Oil
  StbOil=getadc(2)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'StbOil=xl

  'Port Oil
  PortOil=getadc(1)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'PortOil=xl

  'Stb temp
  StbTemp=getadc(3)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'stbTemp=xl

  'Port Temp
  PortTemp=getadc(0)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'PortTemp=xl

  'Water
  Water=getadc(36)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'Water=xl

  'Diesel
  Diesel=getadc(37)
  'xl=xi*1519
  'xl=xl+5
  'xl=xl/1000
  'Diesel=xl



 'Now print Status
  print #4,"!";tiden;",";BattVolt;",";portvolt;",";stbVolt;",";portrev;",";stbrev;",";PortOil;",";stbOil;",";Porttemp;",";StbTemp;",";PortCharge;",";StbCharge;",";battCharge;",";Water;",";diesel;",";compassok;",";GpsOK;",";GSMOK;",";Gpsheading;",";GPSSPeed;",";Compassheading;
  print #4,",";Roll;",";BatterymAh;",";MainKey;",";Holding;",";Coarsetohold;",";Holding;",";Coarsetohold

 Wifiled=0
return

Sub SaveToEE(byval Length as byte, byval Pos as byte)
  xi=len(wifiline)
  yi=xi-length
  tmpstr=right(wifiline,yi)
  Zi=val(tmpstr)
  Elbyte = Low(zi)
  Ehbyte = High(zi)
  Writeeeprom Elbyte , pos
  incr pos
  Writeeeprom Ehbyte , pos
  print "Saved with ZI=";zi;" Pos=";pos
end sub