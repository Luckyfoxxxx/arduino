VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3144
   ClientLeft      =   48
   ClientTop       =   396
   ClientWidth     =   3744
   LinkTopic       =   "Form1"
   ScaleHeight     =   3144
   ScaleWidth      =   3744
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   3024
      Top             =   816
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Left            =   672
      TabIndex        =   3
      Top             =   2592
      Width           =   1836
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BorderStyle     =   1  'Fixed Single
      Caption         =   " "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   636
      Left            =   672
      TabIndex        =   2
      Top             =   1776
      Width           =   1836
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   636
      Left            =   672
      TabIndex        =   1
      Top             =   1056
      Width           =   1836
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   636
      Left            =   672
      TabIndex        =   0
      Top             =   336
      Width           =   1836
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim XL As Long
Dim Heading As Long
Private Sub Command1_Click()
  If Timer1.Enabled = True Then
    Timer1.Enabled = False
  Else
    Heading = 0
    Timer1.Enabled = True
  End If
End Sub

Private Sub Label1_DblClick()
 Label1.Caption = InputBox("Holding:", 10)
End Sub

Private Sub Timer1_Timer()
   Heading = Heading + 10
   If Heading = 3600 Then Heading = 0
   Label2.Caption = Heading
   XL = Heading - Label1.Caption
   If XL < -1800 Then XL = XL + 3600
   If XL > 1800 Then XL = XL - 3600
   Label3.Caption = XL
End Sub
