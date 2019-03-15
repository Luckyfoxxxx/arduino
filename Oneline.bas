Dim MaxCompassFault as integer


'******************Check Line From Compass
Sub Getcompass
  compled=1
  compassok=0
  Check = 0
  Oklinje = 0
  osline=""
  'But for maximum 2ms
  Maxintime = 0
  Rmax = 0
  kar=""
  While Maxintime < 200
    If Ischarwaiting(#4) > 0 Then
      Get #4 , char
      if calibrating=1 then
        print chr(char);
        goto endoneline
      End if
      if char<>10 and char<>13 then
        'print chr(char);

        osline=osline+chr(char)
      end if
      if char=10 then exit while
      Maxintime =0
    Else
      Incr Maxintime
      Waitus 10
    End If
  Wend
  'print osline
  If osline="" then goto endoneline
  if left(osline,1)<>"$" then goto endoneline
  For X = 1 To Len(osline)
    Kar = Mid(osline , X , 1)
    Select Case Kar
    Case "$"
     ' Ignore the dollar sign
    Case "*"
      'Stop processing before the asterisk
      Exit For
    Case Else
       'Is this the first value for the checksum?
      If Check = 0 Then
         'Yes. Set the checksum to the value
        Check = Asc(kar)
      Else
       'No. XOR the checksum with this character's value
        Check = Check Xor Asc(kar)
      End If
    End Select
  Next
  Kar = Hex(check)
  'X = Len(osline) - 2
  'Osline = Left(osline , X)
  ' print "NOPE ";Right(osline , 2);"  ";kar; "  ";Len(kar)
  If Right(osline , 2) <> Right(kar , 2) Then
    incr maxcompassfault
    if maxcompassfault>5 then
      compassok=0
    End if

    goto endoneline
  End If

'***************Find Compass and Roll from OSLine
maxcompassfault=0
Compass = 0
CompassOK=1
'Find heading
'print osline
'print "1"
X = Instr(1 , Osline , "P")
x=x-3
Tempc = Mid(osline , 3 , x)
x=len(tempc)
x=x-2
'print "2"
Tempc = Left(tempc , X) + Right(tempc , 1)
heading = Val(tempc)

'print "3"
'find ROLL
X = Instr(1 , Osline , "T")
Y = Instr(1 , Osline , "R")
Z = X - y
decr z
incr y
'print "4"
Tempc = Mid(osline , y , z)
y = Len(tempc) - 2
Tempc = Left(tempc , y) + Right(tempc , 1)
Roll = Val(tempc)


Endoneline:
compled=0
end sub