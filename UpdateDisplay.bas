


Updatedisplay:

'*****************************Print to OLED & LCD
Dim Lcdstr As String * 4

X = Heading / 10
Lcdstr = Str(x)
Lcdstr = Format(lcdstr , "000")
Print #2 , Chr(1)                                           'home
Print #2 , Chr(3)                                           'small 4x16 text

'Print #2 , Ezline
'Return

Print #2 , Chr(2)                                           'larger 2x16 text
Print #2 , Chr(2)
Print #2 , Chr(2)
Print #2 , Chr(2)
Print #2 , Chr(16) ; Chr(68);                               'curser pos 68-64=4
Print #2 , Lcdstr
Print #2 , Chr(3)                                           'small 4x16 text



If Goport = 1 Then                                          'Turning Port
  Print #2 , Chr(16) ; Chr(94) ; " "                        'remove right arrow
  Print #2 , Chr(16) ; Chr(87) ; Chr(127)                   'Left arrow
Elseif Gostb = 1 Then
  Print #2 , Chr(16) ; Chr(87) ; " "                        'remove left arrow
  Print #2 , Chr(16) ; Chr(94) ; Chr(126)                   'right arrow
Else
  Print #2 , Chr(16) ; Chr(94) ; " "                        'remove right arrow
  Print #2 , Chr(16) ; Chr(87) ; " "                        'remove left arrow
End If


Print #2 , Chr(16) ; Chr(79) ; " "
If Holding = 1 And Antiroll = 0 Then
  Toggle Lcdhold
  If Lcdhold = 0 Then
    Print #2 , Chr(16) ; Chr(79) ; "H"
  End If

  Locate 2 , 6
  X = Coarsetohold / 10
  Lcd "HOLD " ; X ; "  "


Elseif Antiroll = 1 Then
  Toggle Lcdantir
  If Lcdantir = 0 Then
    Print #2 , Chr(16) ; Chr(79) ; "A"
  End If

  Locate 2 , 6
   X = Coarsetohold
  Lcd "AntiR " ; X ; "  "


Elseif Holding = 0 And Antiroll = 0 Then
  Toggle Lcdhold
  If Lcdhold = 0 Then
    Print #2 , Chr(16) ; Chr(79) ; "*"
  End If
  Locate 2 , 1
  Lcd "        IDLE        "
End If

If Holding = 1 Or Antiroll = 1 Then
  X = Coarsetohold
  Lcdstr = Str(x)
  Lcdstr = Format(lcdstr , "000")
  Print #2 , Chr(16) ; Chr(64) ;
  Print #2 , "HO " ; Lcdstr
Else
  Print #2 , Chr(16) ; Chr(64) ;
  Print #2 , "HO     "
End If


Lcdstr = Str(rudder)
Lcdstr = Format(lcdstr , "000")
Print #2 , Chr(16) ; Chr(80) ;
Print #2 , "RU" ; " " ; Lcdstr

X = Roll / 10
Lcdstr = Str(x)

Lcdstr = Format(lcdstr , "000")
Print #2 , Chr(16) ; Chr(96) ;

If X < 0 Then
  Print #2 , "RO" ; Lcdstr
Else
  Print #2 , "RO " ; Lcdstr
End If

Print #2 , Chr(16) ; Chr(112) ;
Lcdstr = Str(gyrorot)
Lcdstr = Format(lcdstr , "000")
If Gyrorot < 0 Then
  Print #2 , "GR" ; Lcdstr
Else
  Print #2 , "GR " ; Lcdstr
End If


'********************** Update LCD  Serial 16x2

'1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6
'H 3 6 0   C 3 5 9   T + 0 5 5      If holding=0 then C=---
'R 1 4 5   G P 3 3   G S 3 3




Locate 1 , 1
Lcd Gyrorot ; "  "
Locate 1 , 8
Lcd X ; "  "



'*********************** Write to Logg
if holding=0 then   'IF Holding, Holdcoarse is updating Logg
  if cardok =1 then
    Print #5,Tiden ;",";Holding;",";Coarsetohold ;","; Heading ;",";Rudder;",";Gs;"," ;  Gp ;","; Gyrorot ; ","; Lastgp ;",";  Lastgs ;"," ;  Gyrorol
  end if
ENd if


'Enable Interrupts
Return