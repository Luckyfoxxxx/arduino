
 Dim Initwait As Long

 '******************* INIT PS
 'Turn OFF all outputs.
 '$PSRF103,xx,00,00,01*CC
 '0 = Gga,
 '1 = Gll,
 '2 = Gsa,
 '3 = Gsv,
 '4 = Rmc,
 '5 = Vtg
 '6 = Mss(if Internal Beacon Is Supported)
 '8 = Zda(if 1pps Output Supported)
 Initgps:
 cls
 'locate 1,1
 'lcd "    INIT GPS    "
 print "Init"
     'Start with turning OFF all Outputs
     gpslinje="$PSRF103,00,00,00,01*24" +crlf   'Turn OFF GGA
     print #2,gpslinje;
     waitms 100
     gpslinje="$PSRF103,02,00,00,01*26" +crlf    'Turn OFF GSA
     print #2,gpslinje;
     waitms 100
     gpslinje="$PSRF103,03,00,00,01*27"+crlf   'Turn OFF GSV
     print #2, gpslinje;
     waitms 100
     gpslinje="$PSRF103,05,00,00,01*21" +crlf   'Turn OFF VTG
     print #2,gpslinje;
     waitms 100

     gpslinje="$PSRF103,04,00,01,01*21" +crlf 'Set Send RMC Every second
     print #2,gpslinje;
     waitms 100

     'Set Baudrate to 38400
     gpslinje="$PSRF100,1,38400,8,1,0*3D" +crlf
     print #2,gpslinje;

     Config Com2 = 38400 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
     'waitms 500
 return


 GPS_ISR:
 '*********************** Read Line from GPS, But Wait max 10mS
 disable int1
 eifr.int1=1

 gpsflag=1
 return

 ReadGPS:
 gpsled=1
 Gpslinje = ""
 GpsOK = 0
 MaxGPStime = 0
 Dim StartGPS as byte
 startgps=0
 while MaxGPSTime < 10000
   If Ischarwaiting(#2) > 0 Then
     MaxGPStime=0
     get #2,xb
     print chr(xb);
     if chr(xb)="$" then  startgps=1
     if startgps=1 then
       If xb = 13 Then
       Elseif xb = 10 Then
         'We should have a line!
         while ischarwaiting(#3)>0
           get #2,char
         Wend
         goto SplitLine
       Else
         if len(gpslinje)>90 then goto endgetgps
         Gpslinje = Gpslinje + Chr(xb)
       End If
     end if
   Else
     Incr maxGPStime
     Waitus 10
   End If
Wend
print "Nothing from GPS ";maxGPStime
goto endgetgps

'*************************** Extracting Time, Lat, Lon, Speed and Heading from GPS Line
SplitLine:
dim SplitArray(10) as string *12
dim GPSSingle as single
'$GPRMC,161229.487,A,3723.2475,N,12158.3416,W,0.13,309.62,120598,,,A*10
'UTC Time: 161229.487
'Status valid= A
'Lat = 3723.2475  DDMM.MMMMM
'N/S = "N"
'Lon = 12158.3416  DDDMM.MMMM
'E/W = "W"
'Speed = 0.13
'Heading =309.62
'print gpsline
If Left(gpslinje , 7) <> "$GPRMC," Then
  print "Auda ";gpslinje

  if Left(gpslinje , 7) = "$GPGGA," then 'Turn it off
   gpslinje="$PSRF103,00,00,00,01*24" +crlf   'Turn OFF GGA
   print #2,gpslinje;
   waitms 100
  end if
  if Left(gpslinje , 7) = "$GPGSV," then 'Turn it off
     gpslinje="$PSRF103,03,00,00,01*27"+crlf   'Turn OFF GSV
     print #2, gpslinje;
     waitms 100
  end if
  if Left(gpslinje , 7) = "$GMC," then 'Turn it off
     gpslinje="$PSRF103,03,00,00,01*27"+crlf   'Turn OFF GSV
     print #2, gpslinje;
     waitms 100
  end if
  goto endgetgps
end if

xi=split(gpslinje,splitarray(1),",")
if xi<>10 then
  print "Auda ";xi
  goto endgetgps
Else
  'Speed
  gpsSingle=val(splitarray(8))
  gpsspeed=gpssingle*10
  'HEading
  gpssingle=val(splitarray(9))
  gpsheading=gpssingle*10
  if gpsspeed<20 then
    holding=0
  ENd if
End if

'Find time.
tiden=left(splitarray(10),2)+"."
tiden=tiden+mid(splitarray(10),3,2)+"."
tiden=tiden+right(splitarray(10),2) +" "
tiden=tiden+left(splitarray(2),2)+":"
tiden=tiden+mid(splitarray(2),3,2)+":"
tiden=tiden+mid(splitarray(2),5,2)
GPSOK=1

EndGetGPS:
gpsled=0

'Read Compass
compassled=1
'First empty buffer from Compass if out of sync
while ischarwaiting(#3)>0
 get #3,ehbyte
wend

print #3, chr(19);   'Get heading
xi=0
yi=0
while xi<1000
  if ischarwaiting(#3)>0 then
    if yi=0 then
      get #3,ehbyte
      yi=1
      xi=0
    else
      get #3,elbyte
      yi=2
      exit while
    End if
  End if
  incr xi
  waitus 5
wend
print "Xi=";xi;"  Yi=";yi
if yi=2 then
  compassok=1
  xl=ehbyte*256
  compassheading=xl+elbyte
  if compassheading<1800 then
   compassheading=compassheading +1800
  else
   compassheading=compassheading -1800
  End if
Else
  compassok=0
End if

print #3, chr(21);   'Get Roll
xi=0
while xi<1000
  if ischarwaiting(#3)>0 then
     get #3,Roll
     exit while
  End if
  incr xi
wend
compassled=0
Return