VERSION 5.00
Begin VB.Form frmNumeric 
   BorderStyle     =   0  'None
   Caption         =   "White Bird"
   ClientHeight    =   7020
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5556
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   36
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7020
   ScaleWidth      =   5556
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Height          =   936
      Left            =   1440
      TabIndex        =   14
      Top             =   576
      Width           =   2604
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   14
      Left            =   3696
      TabIndex        =   13
      Top             =   5760
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   13
      Left            =   240
      TabIndex        =   12
      Top             =   5760
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Back"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   11
      Left            =   240
      TabIndex        =   11
      Top             =   4704
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Clear"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   12
      Left            =   3696
      TabIndex        =   10
      Top             =   4704
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   0
      Left            =   1968
      TabIndex        =   9
      Top             =   4704
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   9
      Left            =   3696
      TabIndex        =   8
      Top             =   3648
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   8
      Left            =   1968
      TabIndex        =   7
      Top             =   3648
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   7
      Left            =   240
      TabIndex        =   6
      Top             =   3648
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   6
      Left            =   3696
      TabIndex        =   5
      Top             =   2592
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   5
      Left            =   1968
      TabIndex        =   4
      Top             =   2592
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   4
      Left            =   240
      TabIndex        =   3
      Top             =   2592
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   3
      Left            =   3696
      TabIndex        =   2
      Top             =   1536
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   2
      Left            =   1968
      TabIndex        =   1
      Top             =   1536
      Width           =   1644
   End
   Begin VB.CommandButton Command1 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   1
      Left            =   240
      TabIndex        =   0
      Top             =   1536
      Width           =   1644
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H000000FF&
      BorderWidth     =   5
      Height          =   7020
      Left            =   48
      Top             =   0
      Width           =   5484
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   48
      TabIndex        =   16
      Top             =   0
      Width           =   5484
   End
   Begin VB.Label lblfrom 
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   444
      Left            =   4368
      TabIndex        =   15
      Top             =   816
      Visible         =   0   'False
      Width           =   828
   End
End
Attribute VB_Name = "frmNumeric"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click(Index As Integer)
 If Index < 10 Then
   Text1.Text = Text1.Text & Trim(Str(Index))
 ElseIf Index = 10 Then
 ElseIf Index = 12 Then
   Text1.Text = ""
 ElseIf Index = 13 Then 'Lagre
   If lblfrom.Caption = "Coarse" Then
     SendtoAP = "$NewCoarse" & Format(Text1.Text, "000")
     DontcheckHolding = True
     frmAutoPilot.Label8.Caption = Format(Text1.Text, "000")
     Unload Me
     Exit Sub
   ElseIf lblfrom.Caption = "SETUP" Then
      frmSetup.Label2(lblfrom.Tag).Caption = Text1.Text
      DoEvents
      SendtoAP = "V" & Text1.Tag & Text1.Text
      Unload Me
      Exit Sub
   ElseIf lblfrom.Caption = "SYS" Then
     frmSetup.SysLabel2(lblfrom.Tag) = Text1.Text
      If lblfrom.Tag = 0 Then
        SaveSetting App.Title, "System", "GMT", Text1.Text
        GMT = Val(Text1.Text)
      End If
      If lblfrom.Tag > 0 And lblfrom.Tag < 18 Then
        frmSetup.Label2(lblfrom.Tag).Caption = Text1.Text
        DoEvents
        SendtoAP = "F" & frmSetup.SysLabel2(lblfrom.Tag).Tag & Text1.Text
        Unload Me
        Exit Sub
      End If
     Unload Me
     Exit Sub
     
   End If
 ElseIf Index = 14 Then
   Unload Me
 End If

 
End Sub

Private Sub Form_Activate()
  If lblfrom.Caption = "SETUP" Then frmSetup.Enabled = False
End Sub

Private Sub Form_Load()
  'frmAutoPilot.Enabled = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
 frmSetup.Enabled = True
End Sub

