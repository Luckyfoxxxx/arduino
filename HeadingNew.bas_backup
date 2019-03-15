Dim Skrivden As Integer
Dim Diff as integer
'Coarse computing and correcting is done once every second.
'Diff is the deviation from Coarse
'Negative diff is Port and will require STB rudder.

'LastDiff is change in deviation last second, and gives the rotation direction of the boat.

'Finn først ut hvor mye vi avviker fra kursen.

'Sjekk om Heading +-5 er innenfor LastHeading

'Dim OffHold as integer              'Angir i .1 grad avvik fra angitt kurs.
'Dim LastOff as integer              'Angir forrige avvik
'Dim OFFDir as integer               '=Offhold-Lastoff som angir om avvik er økende eller minkende.
'dim LastOffDir as integer           'Angir forrige avviks øking eller minking
'Dim OffSpeed as integer             'Angir hastighet på kursendringen


Holdheading:
'Sjekk først hvilken kurskilde som skal benyttes.
if headingsource=0 then
  Coarse=heading  'Use Compass
elseif headingsource=1 then
  coarse=gpsheading
Else
  'Use average from compass and GPS, but only if GPSSpeed>4 knot.
  If gpsspeed>40 then
  Else
    'If not use compass
    coarse=heading
  End if
End if

'Finn avvik fra ønsket kurs.
'Positive diff betyr at kurs er styrbord for ønsket kurs.
diff= heading-coarsetohold
if diff<-1800 then
  diff=diff+3600
  diff=-diff
Elseif diff>1800 then
  diff=diff-3600
  diff=-diff
End if


rotspeed=diff-lastDiff                          'Positive Rotspeed when rotation is Stb..
lastdiff=diff
x=rotspeed*2
x=diff+x
Print Heading;"  ";coarsetohold; " "; diff;"  ";rotspeed;"  ";x
return
 print "GS=";gs;"  GP=";gp
  'Kursjustering må gjøres
  If Gs > 0 Then
    If Gs => Lastgs Then                                     'Bare turn om kursdifferansen har øket
      Gostb = 1
      If Lastturn = 0 Then
        Waitms 50
      End If
      Waitms 150
      Gostb = 0
      test=1
      timer1=rudderdelay
      start timer1

     ' Waitms 300
     ' Rudder = Getadc(2)
     ' Lastrudder = Rudder
      Lastturn = 1
      Skrivden = 1
    Else
      If Gs < 5 Then
        Goport = 1
        Waitms 100
        Goport = 0
        test=1
        timer1=rudderdelay
        start timer1

       ' Waitms 300
        Lastturn = 0
        'Rudder = Getadc(2)
        'Lastrudder = Rudder
      End If
    End If
  End If
  If Gp > 0 Then
    If Gp => Lastgp Then                                     'Bare turn om kursdifferansen har øket
      Goport = 1
      If Lastturn = 1 Then
        Waitms 50
      End If
      Waitms 150

      Goport = 0
      test=1
      timer1=rudderdelay
      start timer1
      'Waitms 300
      'Rudder = Getadc(2)
      'Lastrudder = Rudder
      Lastturn = 0
      Skrivden = 1
    Else
      If Gp < 5 Then
        Gostb = 1
        Waitms 150
        Gostb = 0
        test=1
        timer1=rudderdelay
        start timer1

       ' Waitms 300
       ' Rudder = Getadc(2)
       ' Lastrudder = Rudder
        Lastturn = 1
      End If
    End If
    'gosub centerrudder
  End If
Lastgp = Gp
Lastgs = Gs
If Lastgp > 0 Then Lastgs = 0
If Lastgs > 0 Then Lastgp = 0
Return




Findneutral:
'If rudder and coarse is stable for 10 readings (10 times RudderLag)
'we asume the rudder is in Neutral.
'This calculation is continous as Neutral can change depending on currents,
'wind and waves

''Adcin 4 , Rudder
'Neutralno = Neutralno + 1
'If Tmprudder = Rudder Then
'  If Heading = Ncoarse Then
'    If Neutralno = 10 Then
'      'Set new Rudder Neutral position
'      Write $32 , Rudder
'      Rudderneutral = Rudder
'      Neutralno = 0
'    End If
'  Else
'    Ncoarse = Heading
'    Neutralno = 0
'  End If
'Else
'  Tmprudder = Rudder
'  Neutralno = 0
'End If

'Return


'Centerrudder:
'Center rudder in closed loop
'Adcin 4 , Rudder
'B2 = 0
'Tmprudder = Rudder
'If Rudder > Rudderneutral Then                              'Rudder goes from Stb min to Port Max
'  'Rudder is port
'  Ledstb = 1
'  Gostb = 1
'  Hydvalve = 1
'Else
  'Rudder is Starboard
'  Ledport = 1
'  Goport = 1
'  Hydvalve = 1
'End If
'While Rudder <> Rudderneutral
'  Clearwdt
'  Pause 20
'  Adcin 4 , Rudder
'  If Rudder <> Tmprudder Then
'    Tmprudder = Rudder
'    B2 = 0
'  End If
'  If B2 > 20 Then Goto Endcenter                            'Ror har ikke beveget seg på 400ms
'  B2 = B2 + 1
'Wend

'Endcenter:
'Pause 200
'Clearwdt
'Adcin 4 , Rudder
'Tmprudder = Rudder

'B2 = Holding
'Gosub Alloff
'Holding = B2
'Return