 Sub Initcell(byval Ic As Byte)
  'Init cell, check if ok. If not try 3 times.
  Dim Cbyte As Byte
  Dim InitX as byte
  Dim B1, B2, B3, Rbyte as byte
  Initx = 0
  Cbyte = 31                                              '18bit 8x gain

Moreinit:
  I2cstart
  I2cwbyte IC                                               'send address
  I2cwbyte Cbyte
  I2cstop

  Waitus 100
  I2cstart                                                  'send start
  I2cwbyte IC+1                                               'send address
  I2crbyte B1 , Ack
  I2crbyte B2 , Ack
  I2crbyte B3 , Ack
  I2crbyte Rbyte , Nack
  I2cstop
  print "IC=";ic;" B1=";b1; " B2=";b2; " B3=";b3;" Rbyte=";rbyte
  If Rbyte <> 31 Then
    Incr Initx
    If Initx < 4 Then
      Waitus 500
      Goto Moreinit
    End If
  End If
End Sub




 sub Readall(Byval IC as byte)
   'Correction factor is stored as integer
   Dim Correction as Single
   Dim Ckorr As Integer
   Dim Raw As Long
   Dim Xc As Byte
   I2cstart                                                'send start
   I2cwbyte IC +1                                            'send address
   I2crbyte B1 , Ack
   I2crbyte B2 , Ack
   I2crbyte B3 , Ack
   I2crbyte Rbyte , Nack
   I2cstop
   If  Rbyte = 31 Then
     'Her har vi antagelig fått riktig svar, så vi beregner målingen.
     print "B1=";b1;"  ";
     If B1 > 127 Then
       B1 = Not B1
       B2 = Not B2
       B3 = Not B3
       Minus = 1
     Else
       Minus = 0
     End If
     Raw = B1 * 256
     Raw = Raw * 256
     Xl = B2 * 256
     Raw = Raw + Xl
     Raw = Raw + B3
     If ic=208 Then
       Correction = StbFaktor / 100
       Correction = Raw / Correction
       If Minus = 1 Then correction=correction  * -1
       StbCharge=correction
     Elseif ic=210  then
       Correction = PortFaktor / 100
       Correction = Raw / Correction
       If Minus = 1 Then correction=correction  * -1
       PortCharge=correction
     elseif ic=212 then
       Correction = BattFaktor / 100
       Correction = Raw / Correction
       If Minus = 1 Then correction=correction  * -1
       BattCharge=correction
     End If

     Print IC ; " = " ; Fusing(correction , "#.####")

   Else
     'Not a valid response from I2C
     'Gosub Writelog
      Print IC ; " Not responding. RByte= " ; Rbyte
   End If

End Sub