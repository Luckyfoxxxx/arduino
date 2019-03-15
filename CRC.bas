Attribute VB_Name = "Module1"
Sub MakeCRC(s As String)
  Dim CRC As Byte
  For x = 1 To Len(s)
    If x = 1 Then
       CRC = Asc(Left(s, 1))
    Else
      CRC = CRC Xor Asc(Mid(s, x, 1))
    End If

  Next

Form1.Label1.Caption = Hex(CRC)

End Sub
