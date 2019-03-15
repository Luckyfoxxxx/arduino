
Holdheading:

Dim Skrivden As Integer
'Coarse computing and correcting is done once every Rudderlag timeframe.
'Trend is the last timeframe relative coarse shift.
'0 to 99 is 0 to 9.9 encreasing degrees shift,
   'And will require Port rudder compensation
'100 to 200 is 0 to 9.9 decreasing degrees shift,
   'And will require a Starboard rudder compensation.

'Finn først ut hvor mye vi avviker fra kursen.

'Sjekk om Heading +-5 er innenfor LastHeading
Gp = 0
Gs = 0
If Heading > Coarsetohold Then                              'Dreier styrbord, om det ikke er Port gjennom 0
   X = Heading - Coarsetohold
   If X > 1800 Then                                         'Joda det er port gjennom 0
     Gs = Coarsetohold + 3600                               '-heading                      'Port
     Gs = Gs - Heading
   Else
     Gp = Heading - Coarsetohold                            'Stb
   End If
End If
If Coarsetohold > Heading Then                              'Dreier Port, om ikke mor Stb gjennom 0
   X = Coarsetohold - Heading
   If X > 1800 Then                                         'Joda det er Stb gjennom 0
     Gp = Heading + 3600                                    '-coarsetohold                      'Stb
     Gp = Gp - Coarsetohold
   Else
     Gs = Coarsetohold - Heading                            'Port
   End If
End If
'Gyrorot = Gyrorot * 10
'If Gp > 0 And Gyrorot < -1 Then
' X = Gp + Gyrorot
' If X < 0 Then
'   Gs = 5
'   Lastgs = 0
'   Gp = 0
' Else
'   Gp = 0                                                   ' Gp + Gyrorot
' End If
'End If
'If Gs > 0 And Gyrorot > 1 Then
'  X = Gs - Gyrorot
'  If X > 0 Then
'    Gp = 5
'    Lastgp = 0
'    Gs = 0
'  Else
'    Gs = 0                                                  'Gs - Gyrorot
'  End If
'End If

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

  'Update Logg
  if sdcardok =1 then
    'Print #5,Tiden ;",";Holding;",";Coarsetohold ;","; Heading ;",";Rudder;",";Gs;"," ;  Gp ;","; Gyrorot ; ","; Lastgp ;",";  Lastgs ;"," ;  Gyrorol
  end if
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