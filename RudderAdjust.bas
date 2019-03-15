Rudderadjust:

'Rudder goes from Starboard Max to Port Min

While Holdbtn = 0 Or Antirbtn = 0
 Waitms 50
Wend


Cls
Locate 1 , 1
Lcd "Turn Rudder Port"
Locate 2 , 1
lcd "HOLD when Done"

while holdbtn=1
  xi=getadc(2)
  locate 2,16
  lcd xi;"  "
  waitms 50
wend
while holdbtn=0
  waitms 50
wend
ruddermin=xi

cls
Locate 1 , 1
Lcd "Turn Rudder STB"
Locate 2 , 1
lcd "HOLD when Done"

while holdbtn=1
  xi=getadc(2)
  locate 2,16
  lcd xi;"  "
  waitms 50
wend
while holdbtn=0
  waitms 50
wend
ruddermax=xi

Elbyte = Low(ruddermin)
Ehbyte = High(ruddermin)
Writeeeprom Elbyte , 20
Writeeeprom Ehbyte , 21

Elbyte = Low(ruddermax)
Ehbyte = High(ruddermax)
Writeeeprom Elbyte , 22
Writeeeprom Ehbyte , 23

xi=ruddermax-ruddermin
xi=xi/2
xi=xi+ruddermin
ruddercenter=xi
Elbyte = Low(xi)
Ehbyte = High(xi)
Writeeeprom Elbyte , 24
Writeeeprom Ehbyte , 25


Cls
Locate 1 , 1
Lcd "   Testing Rudder Lag"    'This is time we have to wait after turning Rudder before reading new rudder.
Locate 2 , 1
Lcd "Hold -> Test"

While Holdbtn = 1
  Waitms 10
Wend
While Holdbtn = 0
  Waitms 10
Wend
Rudder = Getadc(2)
Xi = Ruddermax - Ruddermin
Xi = Xi / 2
Xi = Xi + Ruddermin
If Rudder < Xi Then
  'Roret ligger Port. Kjør Stb
  Lastturn = 2
  Print "Rudder overshoot Time Stb. StartRudder= " ; Rudder
  Gostb = 1
Else
  'Roret ligger Stb. Kjør Port
  Lastturn = 1
  Print "Rudder overshoot Time Port. StartRudder= " ; Rudder
  Goport = 1
End If
'Kjør i 1 sekundd.
print "Running"
for xi=1 to 100
  'rudder=getadc(2)
  waitms 10
next
Print
'print "After"
Gostb = 0
Goport = 0

'Printing some 10 chr each mS
For Xi = 1 To 200
  Rudder = Getadc(2)
  xl=xi*5
  Print  Xl ; " " ; Rudder
  waitms 4
Next

Cls
Locate 1 , 1
Lcd "Check ReadOut"
Locate 2 , 1
Lcd "Hold -> Next"

While Holdbtn = 1
  Waitms 10
Wend
While Holdbtn = 0
  Waitms 10
Wend

'Now do the same the other direction
if lastturn=1 then
  lastturn=2
  Print "Rudder overshoot Time Stb. StartRudder= " ; Rudder
  gostb=1
Else
  lastturn=1
  Print "Rudder overshoot Time Port. StartRudder= " ; Rudder
  goport=1
ENd if
wait 1
gostb=0
goport=0
'Printing some 10 chr each mS
For Xi = 1 To 200
  Rudder = Getadc(2)
  xl=xi*5
  Print  Xl ; " " ; Rudder
  waitms 4
Next

Cls
Locate 1 , 1
Lcd "Check ReadOut"
Locate 2 , 1
Lcd "Hold -> Next"

While Holdbtn = 1
  Waitms 10
Wend
While Holdbtn = 0
  Waitms 10
Wend



'Find min motor time to move rudder
Rudder = Getadc(2)
Print "StartRudder = " ; Rudder
'Vi må fotsette i samme retning som sist for å eliminere backlash
If Lastturn = 1 Then                                        'Babord
  Print "Motor Min Time Port. StartRudder= " ; Rudder
  Goport = 1
Else
  Print "Motor Min Time Stb. StartRudder= " ; Rudder
  Gostb = 1
End If
For Xi = 1 To 100
  Rudder = Getadc(2)
  xl=xi*5
  Print  Xl ; " " ; Rudder
Next

Goport = 0
Gostb = 0

Cls
Locate 1 , 1
Lcd "Check ReadOut"
Locate 2 , 1
Lcd "Hold -> Next"

While Holdbtn = 1
  Waitms 10
Wend
While Holdbtn = 0
  Waitms 10
Wend


'Vi må kjøre i motsatt retning for å finne backlash
rudder  =getadc(2)
Print "Backlash. StartRudder = " ; Rudder
If Lastturn = 1 Then                                        'Babord
  Gostb = 1
Else
  Goport = 1
End If
For Xi = 1 To 100
  Rudder = Getadc(2)
  xl=xi*2
  Print Xl ; " " ; Rudder
Next


Goport = 0
Gostb = 0
Cls
Lcd "Backlash= " ; Xi
Locate 2 , 1
Lcd " Hold -> Start"
While Holdbtn = 1
  Waitms 10
Wend
While Holdbtn = 0
  Waitms 10
Wend

Goto Starten

