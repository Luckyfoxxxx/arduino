


ReadTime:
   Dim DMode as byte
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 0
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , ack
   xb = xb And &B01111111                                     'clear bit_7
   Sekund = Makedec(xb)

   I2crbyte xb , ack
   Minutt = Makedec(xb)

   I2crbyte xb , nack
   xb = xb And &B00111111
   timen = Makedec(xb)

   I2crbyte xb , nack
   I2crbyte xb , nack
   dag=makedec(xb)

   I2crbyte xb , nack
   maned=makedec(xb)

   I2crbyte xb , nack
   ar=makedec(ar)

   i2cstop
   waitus 100

  innstr=str(dag)
  Timestring = Format(innstr , "00")
  timestring=timestring+"."

  innstr=str(maned)
  Timestring = timestring + Format(innstr , "00")
  timestring=timestring+"."

  innstr=str(ar)
  Timestring = timestring+ Format(innstr , "00")
  timestring=timestring+" "


  Innstr = Str(timen)
  Timestring = timestring+ Format(innstr , "00")
  Timestring = Timestring + ":"

  Innstr = Str(minutt)
  Innstr = Format(innstr , "00")
  Timestring = Timestring + Innstr
  Timestring = Timestring + ":"

  Innstr = Str(sekund)
  Innstr = Format(innstr , "00")
  Timestring = Timestring + Innstr


  'Read Temp.
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 17
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , ack
   I2crbyte B , nack
   i2cstop
   If a > 127 Then
     A = Not A
     A=A+1
     xi=a*-1
   else
     xi=A
   End If
   grader=xi*100
   shift b,right,6

   yi=b*25
   grader=grader+yi
return

PCSetTime:
  If Innstr <> "" Then
    Dim Timestr As String * 4
    'Do some Testing
    Timestr = Left(innstr , 2)
    If Val(timestr) > 31 Or Val(timestr) = 0 Then
      Print Timestr ; " Wrong Date"
      Goto Stend
    Else
      Dag = Val(timestr)
    End If

    Timestr = Mid(innstr , 4 , 2)
    If Val(timestr) > 12 Or Val(timestr) = 0 Then
      Print Timestr ; " Wrong Month"
      Goto Stend
    Else
      Maned = Val(timestr)
    End If

    Timestr = Mid(innstr , 7 , 2)
    If Val(timestr) > 99 Or Val(timestr) < 14 Then
      Print Timestr ; " Wrong Year"
      Goto Stend
    Else
      Ar = Val(timestr)
    End If

    Timestr = Mid(innstr , 10 , 2)
    If Val(timestr) > 23 Or Val(timestr) < 0 Then
      Print Timestr ; " Wrong Hour"
      Goto Stend
    Else
      Timen = Val(timestr)
    End If

    Timestr = Mid(innstr , 13 , 2)
    If Val(timestr) > 59 Or Val(timestr) < 0 Then
      Print Timestr ; " Wrong Minute"
      Goto Stend
    Else
      Minutt = Val(timestr)
    End If


    Timestr = Mid(innstr , 16 , 2)
    If Val(timestr) > 60 Or Val(timestr) < 0 Then
      Print Timestr ; " Wrong Second"
      Goto Stend
    Else
      Sekund = Val(timestr)
    End If

    Call Ds1307_set_dayofmonth(dag)
    Call Ds1307_set_monthofyear(maned)
    Call Ds1307_set_year(ar)
    Call Ds1307_set_hour_0_23(timen)
    Call Ds1307_set_minute(minutt)
    Call Ds1307_set_second(sekund)
  End If
Stend:
return




Sub Ds1307_play()                                           'timer and date conter-->play
    I2cstart
    'set defult register index
    I2cwbyte &B11010000
    I2cwbyte 15
    'change to reade mode
    I2cstart
    I2cwbyte &B11010001
    I2crbyte A , Nack
    B = A
    A = A And &B01111111                                    'bit_7=0 ==> set counter to play
    If B = A Then
       I2cstop
       Exit Sub
    End If
    I2cstart
    I2cwbyte &B11010000
    I2cwbyte 15
    I2cwbyte A
    I2cstop
End Sub


'--------------921203-------
 Sub Ds1307_set_second(byval Sekund As Byte)
   If Sekund > 59 Then
      Exit Sub
   End If
   A = Makebcd(sekund)
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 0
   I2cstart
   I2cwbyte &B11010001
   I2crbyte B , Nack
   B = B And &B10000000                                     'extract bit_7
   A = A Or B                                               'merge
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 0
   I2cwbyte A
   I2cstop
 End Sub
 '-------------921205---------
  Function Ds1307_get_second_0_59() As Byte
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 0
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , Nack
   I2cstop
   A = A And &B01111111                                     'clear bit_7
   Ds1307_get_second_0_59 = Makedec(a)
 End Function


  Sub Ds1307_set_minute(byval Minutt As Byte)               'ok
   If Minutt > 59 Then
      Exit Sub
   End If
   A = Makebcd(minutt)
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 1
   I2cwbyte A
   I2cstop
 End Sub


  Function Ds1307_get_minute_0_59() As Byte                 'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 1
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , Nack
   I2cstop
   Ds1307_get_minute_0_59 = Makedec(a)
 End Function


  '-------------921209---------
 Sub Ds1307_set_24h_or_12h_mode(byval _24h_0_12h_1 As Byte) 'ok
      If _24h_0_12h_1 > 1 Then
         Exit Sub
      End If
      I2cstart
      I2cwbyte &B11010000
      I2cwbyte 2
      I2cstart
      I2cwbyte &B11010001
      I2crbyte A , Nack
      B = A And &B01000000
      If B = _24h_0_12h_1 Then
           I2cstop
           Exit Sub
      End If
      If B = 0 Then                                         'is 24h mode  -->change to 12h mode
         B = A And &B00111111
         B = Makedec(b)
         If B < 12 Then                                     'set am
            A = A And &B00011111
            A = A Or &B01000000
         Elseif B = 12 Then                                 'set pm
            A = A And &B00011111
            A = A Or &B01100000
         Else                                               'b > 12 ->set pm and houre= h -12
            A = A And &B00111111
            A = Makedec(a)
           A = A - 12
           A = Makebcd(a)
           A = A Or &B01100000
         End If
      Else                                                  'is 12h  mode   -->change to 24h mode
          B = A
          B = B And &B00100000
          If B = 0 Then                                     'is am
             A = A And &B00111111
          Else                                              'is pm
             A = A And &B00011111
             A = Makedec(a)
             If A = 12 Then
                A = Makebcd(a)
             Else                                           'is<12
                A = A + 12
                A = Makebcd(a)
             End If
          End If
      End If
      I2cstart
      I2cwbyte &B11010000
      I2cwbyte 2
      I2cwbyte A
      I2cstop
 End Sub



Function Ds1307_get_hour_0_23() As Byte                     'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 2
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , Nack
   I2cstop
   B = A And &B01000000
   If B = 0 Then                                            'is 24h mode
      B = A And &B00011111
      Ds1307_get_hour_0_23 = Makedec(b)
   End If
End Function


Sub Ds1307_set_hour_0_23(byval Timen As Byte )              'ok
   If Timen > 23 Then
      Exit Sub
   End If
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 2
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , Nack
   'B = A And &B01000000
'   A = A And &B11000000
   print timen
   Timen = Makebcd(timen)
   print bin(timen)
   'Timen = Timen or &B00111111
'   A = A Or Timen
   print bin(A)
 '   print bin(timen)
   ' a=a or timen

    print bin(a)
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 2
   I2cwbyte timen
   I2cstop
End Sub



Function Ds1307_getdayofweek()as Byte                  'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 3
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , Nack
   I2cstop
   Ds1307_getdayofweek = Makedec(a)
End Function


Function Ds1307_get_dayofmonth_1_31()as Byte                'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 4
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , Nack
   I2cstop
   Ds1307_get_dayofmonth_1_31 = Makedec(a)
End Function


Sub Ds1307_set_dayofmonth(byval Dag As Byte )               'ok
   If Dag = 0 Then
      Exit Sub
   Elseif Dag > 31 Then
      Exit Sub
   End If
   Dag = Makebcd(dag)
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 4
   I2cwbyte Dag
   I2cstop
End Sub


Function Ds1307_get_monthofyear_1_12()as Byte               'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 5
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , Nack
   I2cstop
   Ds1307_get_monthofyear_1_12 = Makedec(a)
End Function


Sub Ds1307_set_monthofyear(byval Maned As Byte )            'ok
   If Maned = 0 Then
      Exit Sub
   Elseif Maned > 12 Then
      Exit Sub
   End If
   Maned = Makebcd(maned)
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 5
   I2cwbyte Maned
   I2cstop
End Sub


Function Ds1307_get_year_0_99()as Byte                      'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 6
   I2cstart
   I2cwbyte &B11010001
   I2crbyte A , Nack
   I2cstop
   Ds1307_get_year_0_99 = Makedec(a)
End Function

Sub Ds1307_set_year(byval Ar As Byte )                      'ok
   If Ar > 99 Then
      Exit Sub
   End If
   Ar = Makebcd(ar)
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 6
   I2cwbyte Ar
   print "Jeg satte: "; ar
   I2cstop
End Sub


Sub Ds1307_external_1hz_on()                                'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 14
   I2cwbyte &B01000000
   I2cstop
End Sub


Sub Ds1307_external_off_sqwe_0()                            'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 7
   I2cwbyte &B00000000
   I2cstop
End Sub

Sub Ds1307_external_off_sqwe_1()                            'ok
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte 7
   I2cwbyte &B10000000
   I2cstop
End Sub

Function Ds1307_read_ram(byval Ram_byte_index_0_55 As Byte) As Byte       'ok
   If Ram_byte_index_0_55 > 55 Then
      Exit Function
   End If
   Ram_byte_index_0_55 = Ram_byte_index_0_55 + 8
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte Ram_byte_index_0_55
   I2cstart
   I2cwbyte &B11010001
   I2crbyte Ds1307_read_ram , Nack
   I2cstop
End Function

Sub Ds1307_write_ram(byval Ram_byte_index_0_55 As Byte , Byval Value As Byte)       'ok
   If Ram_byte_index_0_55 > 55 Then
      Exit Sub
   End If
   Ram_byte_index_0_55 = Ram_byte_index_0_55 + 8
   I2cstart
   I2cwbyte &B11010000
   I2cwbyte Ram_byte_index_0_55
   I2cwbyte Value
   I2cstop
End Sub