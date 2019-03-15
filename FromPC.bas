'Communication with PC.
Frompc:

Innstr = ""
Innstr = Getpcresponce()
If Innstr = "" Then
  Goto Endfrompc
End If
If Len(innstr) > 1 Then
  Xi = Len(innstr)
  Xi = Xi - 1
  Innstr = Left(innstr , Xi)
Else
  Print "Not valid Respons!"
  Goto Endfrompc
End If
innstr=ucase(innstr)
If Innstr = "?" Then
  Print "Commands:"
  Print
  Print "Log? (List LogFiles on SD Card)"
  Print "Get 'abcd' (Log file name)"
  print
Else

  Print "Not a valid Command: " ; Innstr
End If
Endfrompc:
Goto Toppen




Function Getpcresponce() As String * 30
Dim Gpr As String * 30
Dim PCKar as byte
Gpr = ""
Maxintime = 0
While Maxintime < 20000
  If Ischarwaiting(#1) > 0 Then
    Get #1 , pcKar
    If pcKar = 240 Then
      Gpr = ""
      Goto Gprend
    End If
    'Print Chr(kar);

    Gpr = Gpr + Chr(pckar)
    If pcKar = 13 Then Goto Gprend
    Maxintime = 0
  Else
    Incr Maxintime
    Waitus 400
  End If

Wend
Gprend:
If Maxintime > 19999 Then
  'Print
  Print "No Respons!"
  Getpcresponce = ""
Else
  if trim(gpr)<>"" then
    print ">";gpr
    Getpcresponce = Gpr
  end if
End If

End Function


'******************List all Log Files on SD Card
Listlogs:
dim SDFile as string*40
Sdfile = Dir( "Log*.*")
While Sdfile <> ""
  Print Sdfile
  Sdfile = Dir()
Wend


Enable Int5
Goto Toppen

