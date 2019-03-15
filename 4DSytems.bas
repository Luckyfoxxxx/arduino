
'Reports and commands from/to 4D Systems

'Compass display
'01 1B 00 00 03 19  Where 03= 6 degrees.

'Compass heading;
'02 00 03 33 35 38 3F  String where 03=number of char then three asc

'Hold Button Report:
'07 21 00 00 01 27   Going from Hold to Holding
'07 21 00 00 00 26   Going from Holding to Hold.

'Hold Button Command:
'01 21 00 00 00 20   Set HOLD
'01 21 00 00 01 21   Set HOlding

'Coarse to HOLD;
'02 01 03 32 35 35 32  Set to 255

'LED Command;
'01 13 00 00 00 12  LED OFF
'01 13 00 00 01 13  LED ON

'Rudder Values;
'01 07 00 00 14 12  Set Rudder to Center (20).... 14=H20 (0-40)
'01 07 00 00 00 06  Set Rudder MAX STB   (0)
'01 07 00 00 28 2E  Set Rudder MAX Port  (40)

'Gyro Values;
'01 07 01 00 0A 0D  Set Gyro to Center (10) ..... 0A=H10  (0-20)
'01 07 01 00 00 07  Set Gyro MAX STB   (0)
'01 07 01 00 14 13  Set GYRO MAX Port  (20)




Sub Displaystr(byval A As Byte , Byval B As Byte , Byval C As Byte , Byval Stringen As String)
  Dim Ds As String * 1
  'A & B are Object adress.
  'Third byte is number of bytes in string
   Crc = A
   Print #2 , Chr(a);
   Crc = Crc Xor B
   Print #2 , Chr(b);
   Crc = Crc Xor C
   Print #2 , Chr(c);
   if len(stringen)>0 then
     For C = 1 To Len(stringen)
       Ds = Mid(stringen , C , 1)
       Crc = Crc Xor Asc(ds)
       Print #2 , Ds;
     Next
   end if
   Print #2 , Chr(crc);
End Sub


Sub Getack()
Dim MaxAck as integer
Kar=0
MaxAck=0
While MaxAck < 100
   If Ischarwaiting(#2) > 0 Then
      Get #2 , Kar
      if Ischarwaiting(#2) =0 then goto getackend
   End If
   Incr MaxAck
   Waitms 1
Wend
Getackend:
if kar<>6 then print "Ack Not Right: " ;kar; " BLR=";MaxAck
End Sub


Responsefromdisplay:
  disable int5
  'Check if display is talking
  'But for maximum 10ms
  Maxintime = 0
  Rmax = 0
  While Maxintime < 100
    If Ischarwaiting(#2) > 0 Then
      Get #2 , Kar

      Rmax = Rmax + 1
      If Rmax = 1 Then
        Crc = Kar
      Else
        Crc = Crc Xor Kar
      End If
      Rarr(rmax) = Kar
      If Crc = 0 and rmax>5 Then Goto Response
      Maxintime =0
    Else
      Incr Maxintime
      Waitus 100
    End If
  Wend

Response:

  enable int5
Return