VERSION 5.00
Begin VB.Form frmKeyboard 
   Caption         =   "Form1"
   ClientHeight    =   6192
   ClientLeft      =   48
   ClientTop       =   396
   ClientWidth     =   8340
   LinkTopic       =   "Form1"
   ScaleHeight     =   6192
   ScaleWidth      =   8340
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1440
      Left            =   48
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Text            =   "frmKeyboard.frx":0000
      Top             =   48
      Width           =   8124
   End
   Begin VB.CommandButton cmdkey 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   396
      Index           =   0
      Left            =   720
      TabIndex        =   0
      Top             =   4176
      Width           =   876
   End
   Begin VB.Label lblfrom 
      Caption         =   "Label1"
      Height          =   828
      Left            =   1728
      TabIndex        =   2
      Top             =   2352
      Visible         =   0   'False
      Width           =   1644
   End
End
Attribute VB_Name = "frmKeyboard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdKey_Click(Index As Integer)
Static boShift As Boolean
Dim strInput As String
Dim intASC As Integer
If Index = 107 Then 'Lagre.
  If lblfrom.Caption = "SETUP" Then
    If lblfrom.Tag = 0 Then
      frmSetup.Label2(0).Caption = Text1.Text
      DoEvents
      Unload Me
      Exit Sub
    
    End If
  
  End If


End If
If Index = 1 Then
    boShift = Not boShift
    If boShift = True Then
        cmdkey(1).Caption = "SHIFT"
    Else
        cmdkey(1).Caption = "shift"
    End If
    Exit Sub
 ElseIf Index = 32 Or Index = 104 Or Index = 105 Or Index = 106 Then 'Special char..
   If Index = 32 Then 'Space
     Text1.Text = Text1.Text & " "
   ElseIf Index = 104 Then 'Back
     If Not Text1.Text = "" Then
       Text1.Text = Left(Text1.Text, Len(Text1.Text) - 1)
     End If
   ElseIf Index = 106 Then 'NL
     Text1.Text = Text1.Text & vbCrLf
     'Text1.t
   End If
   GoTo EndofClick
 End If

  If boShift = True Then
    'Store Bokstaver
    If Index <> 32 Then
      Text1.Text = Text1.Text & cmdkey(Index).Caption
    Else
      Text1.Text = Text1.Text & " "
    End If
  Else
    'Små
    If Asc(cmdkey(Index).Caption) > 64 And Asc(cmdkey(Index).Caption) < 91 Then
      intASC = Index + (Asc("a") - Asc("A"))
      Text1.Text = Text1.Text & Chr(intASC)
    
     ElseIf Index > 99 And Index < 103 Then
        If Index = 100 Then
          intASC = 230
        ElseIf Index = 101 Then
          intASC = 248
        ElseIf Index = 102 Then
          intASC = 229
        End If
        Text1.Text = Text1.Text & Chr(intASC)
     Else
        If Index <> 32 Then
          Text1.Text = Text1.Text & cmdkey(Index).Caption
        Else
          Text1.Text = Text1.Text & " "
        End If
      
    End If
  
End If
EndofClick:
Text1.SelStart = Len(Text1.Text)
Text1.SetFocus
End Sub

Private Sub Form_Load()
Dim intI As Integer
Dim Last As Integer
cmdkey(0).Left = 2200
cmdkey(0).Top = 1550
cmdkey(0).Width = 800
cmdkey(0).Height = 600
Text1.Width = (16 * (cmdkey(0).Width + 50)) - 400
Me.Width = (16 * (cmdkey(0).Width + 50)) - 200
Me.Height = 6000
For intI = Asc("1") To Asc("9") + 1
    Load cmdkey(intI)
    If intI <> 49 Then
      cmdkey(intI).Caption = Chr(intI - 1)
      cmdkey(intI).Left = cmdkey(intI - 1).Left + cmdkey(intI - 1).Width + 50
      cmdkey(intI).Top = cmdkey(intI - 1).Top
      cmdkey(intI).Visible = True
    End If
Next intI
For intI = 33 To Asc("0") - 1
    If intI = 34 Or intI = 35 Or intI = 36 Or intI = 37 Or intI = 39 Then
    Else
      Load cmdkey(intI)
      If intI = 33 Then 'First
        cmdkey(intI).Caption = Chr(intI)
        cmdkey(intI).Left = cmdkey(0).Left
        cmdkey(intI).Top = cmdkey(0).Top + cmdkey(0).Height + 100
        cmdkey(intI).Visible = True
        Last = intI
      Else
        cmdkey(intI).Caption = Chr(intI)
        cmdkey(intI).Left = cmdkey(Last).Left + cmdkey(Last).Width + 50
        cmdkey(intI).Top = cmdkey(0).Top + cmdkey(0).Height + 100
        cmdkey(intI).Visible = True
        Last = intI
      End If
    End If
Next intI
For intI = 65 To Asc("P") - 1
      Load cmdkey(intI)
      If intI = 65 Then 'First
        cmdkey(intI).Caption = Chr(intI)
        cmdkey(intI).Left = 200
        cmdkey(intI).Top = cmdkey(0).Top + cmdkey(0).Height * 2 + 200
        cmdkey(intI).Visible = True
        Last = intI
      Else
        cmdkey(intI).Caption = Chr(intI)
        cmdkey(intI).Left = cmdkey(Last).Left + cmdkey(Last).Width + 50
        cmdkey(intI).Top = cmdkey(0).Top + cmdkey(0).Height * 2 + 200
        cmdkey(intI).Visible = True
        Last = intI
      End If
Next intI
For intI = 80 To 90
      Load cmdkey(intI)
      If intI = 80 Then 'First
        cmdkey(intI).Caption = Chr(intI)
        cmdkey(intI).Left = 200
        cmdkey(intI).Top = cmdkey(0).Top + cmdkey(0).Height * 3 + 300
        cmdkey(intI).Visible = True
        Last = intI
      Else
        cmdkey(intI).Caption = Chr(intI)
        cmdkey(intI).Left = cmdkey(Last).Left + cmdkey(Last).Width + 50
        cmdkey(intI).Top = cmdkey(0).Top + cmdkey(0).Height * 3 + 300
        cmdkey(intI).Visible = True
        Last = intI
      End If
Next intI

'Then the Norwegian.
Load cmdkey(100)
cmdkey(100).Caption = Chr(198)
cmdkey(100).Left = cmdkey(Last).Left + cmdkey(Last).Width + 50
cmdkey(100).Top = cmdkey(0).Top + cmdkey(0).Height * 3 + 300
cmdkey(100).Visible = True

Load cmdkey(101)
cmdkey(101).Caption = Chr(216)
cmdkey(101).Left = cmdkey(100).Left + cmdkey(100).Width + 50
cmdkey(101).Top = cmdkey(0).Top + cmdkey(0).Height * 3 + 300
cmdkey(101).Visible = True


Load cmdkey(102)
cmdkey(102).Caption = Chr(197)
cmdkey(102).Left = cmdkey(101).Left + cmdkey(101).Width + 50
cmdkey(102).Top = cmdkey(0).Top + cmdkey(0).Height * 3 + 300
cmdkey(102).Visible = True

' Shift Key
'
Load cmdkey(1)
cmdkey(1).Caption = "shift"
cmdkey(1).Top = cmdkey(0).Top + cmdkey(0).Height * 4 + 400
cmdkey(1).Left = 200
cmdkey(1).Width = 1455
cmdkey(1).Visible = True
'
' Space Bar
'
Load cmdkey(32)
cmdkey(32).Caption = "Space"
cmdkey(32).Top = cmdkey(0).Top + cmdkey(0).Height * 4 + 400
cmdkey(32).Width = 3000
cmdkey(32).Left = 3500
cmdkey(32).Visible = True

'Back
Load cmdkey(104)
cmdkey(104).Caption = "Back"
cmdkey(104).Top = cmdkey(0).Top + cmdkey(0).Height * 4 + 400
cmdkey(104).Width = 1000
cmdkey(104).Left = 8000
cmdkey(104).Visible = True



'Del
Load cmdkey(105)
cmdkey(105).Caption = "DEL"
cmdkey(105).Top = cmdkey(0).Top + cmdkey(0).Height * 4 + 400
cmdkey(105).Width = 1000
cmdkey(105).Left = 10000
cmdkey(105).Visible = True


'New Line
Load cmdkey(106)
cmdkey(106).Caption = "Line"
cmdkey(106).Top = cmdkey(0).Top + cmdkey(0).Height * 4 + 400
cmdkey(106).Width = 1000
cmdkey(106).Left = 12000
cmdkey(106).Visible = True


'Lagre
Load cmdkey(107)
cmdkey(107).Caption = "LAGRE"
cmdkey(107).Top = 1800
cmdkey(107).Width = 1500
cmdkey(107).Left = 200
cmdkey(107).Visible = True




End Sub

