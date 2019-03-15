VERSION 5.00
Begin VB.Form frmSetup 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "White Bird SetUp"
   ClientHeight    =   5856
   ClientLeft      =   36
   ClientTop       =   384
   ClientWidth     =   8772
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   24
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5856
   ScaleWidth      =   8772
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Ferdig"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Left            =   2880
      TabIndex        =   0
      Top             =   4848
      Width           =   2460
   End
   Begin VB.Label Label3 
      Caption         =   "mS"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   28.2
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   588
      Left            =   6096
      TabIndex        =   3
      Top             =   528
      Width           =   780
   End
   Begin VB.Label Label2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "1234"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Index           =   0
      Left            =   4368
      TabIndex        =   2
      Top             =   384
      Width           =   1728
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Min Pump Time:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   552
      Left            =   336
      TabIndex        =   1
      Top             =   576
      Width           =   3648
   End
End
Attribute VB_Name = "frmSetup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Unload Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
  frmAutoPilot.Show
End Sub

Private Sub Label2_Click(Index As Integer)
  frmNumeric.lblfrom.Caption = "SETUP"
  frmNumeric.lblfrom.Tag = Index
  frmNumeric.Show
  
End Sub
