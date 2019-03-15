 Sub Initcell(byval Ic As Byte)
  'Init cell, check if ok. If not try 3 times.
  Dim Cbyte As Byte
  Dim InitX as byte
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




 sub ReadCell(Byval IC as byte)
   'Correction factor is stored as integer

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
     If ic=212 Then

       xl=raw*StbAlternatorAC
       xl=xl/1000
       If Minus = 1 Then xl=0
       StbCharge=xl
     Elseif ic=210  then
       xl=raw*PortAlternatorAC
       xl=xl/1000
       If Minus = 1 Then xl=0
       PortCharge=xl
     elseif ic=208 then
       Correction = BAtteryAC / 1000
       Correction = Raw / Correction
       If Minus = 1 Then correction=correction  * -1
       BattCharge=correction
     End If

     'Print"IC "; IC ; " Raw=" ; raw; " Val=";xl

   Else
     'Not a valid response from I2C
     'Gosub Writelog
      Print IC ; " Not responding. RByte= " ; Rbyte
   End If

End Sub