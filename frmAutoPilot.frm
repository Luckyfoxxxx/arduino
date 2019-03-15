VERSION 5.00
Object = "{71D75C77-4682-4723-83E6-BD07E1D80111}#1.0#0"; "BGV2ActiveXPro.ocx"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form frmAutoPilot 
   BackColor       =   &H00FF8080&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Autopilot"
   ClientHeight    =   8760
   ClientLeft      =   36
   ClientTop       =   384
   ClientWidth     =   16308
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   12
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8760
   ScaleWidth      =   16308
   StartUpPosition =   3  'Windows Default
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl7 
      Height          =   876
      Left            =   4848
      TabIndex        =   19
      Top             =   3504
      Width           =   924
      _Version        =   65536
      _ExtentX        =   1630
      _ExtentY        =   1545
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":0000
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl6 
      Height          =   1260
      Left            =   4272
      TabIndex        =   18
      Top             =   5040
      Width           =   1212
      _Version        =   65536
      _ExtentX        =   2138
      _ExtentY        =   2222
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":0094
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl Volt 
      Height          =   2004
      Left            =   13920
      TabIndex        =   11
      Top             =   4656
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":9DA2
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortOil 
      Height          =   2004
      Left            =   7824
      TabIndex        =   8
      Top             =   4704
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":A651
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortTemp 
      Height          =   2004
      Left            =   5856
      TabIndex        =   7
      Top             =   4656
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":AECE
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl Diesel 
      Height          =   2004
      Left            =   2400
      TabIndex        =   4
      Top             =   6720
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":B74C
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl Water 
      Height          =   2004
      Left            =   384
      TabIndex        =   3
      Top             =   6672
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":BE57
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbTacho 
      Height          =   4500
      Left            =   11664
      TabIndex        =   2
      Top             =   144
      Width           =   4500
      _Version        =   65536
      _ExtentX        =   7937
      _ExtentY        =   7937
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":C561
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortTacho 
      Height          =   4500
      Left            =   5712
      TabIndex        =   1
      Top             =   144
      Width           =   4500
      _Version        =   65536
      _ExtentX        =   7937
      _ExtentY        =   7937
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":CDA7
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   0
      Top             =   8352
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl CompassRose 
      Height          =   4500
      Left            =   96
      TabIndex        =   0
      Top             =   96
      Width           =   4500
      _Version        =   65536
      _ExtentX        =   7937
      _ExtentY        =   7937
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":D5ED
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbTemp 
      Height          =   2004
      Left            =   12096
      TabIndex        =   9
      Top             =   6720
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":E1E2
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbOil 
      Height          =   2004
      Left            =   14112
      TabIndex        =   10
      Top             =   6720
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3535
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":EA60
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl2 
      Height          =   2004
      Left            =   11904
      TabIndex        =   12
      Top             =   4704
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":F2DD
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl1 
      Height          =   2004
      Left            =   9792
      TabIndex        =   13
      Top             =   4704
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":FB8C
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl3 
      Height          =   2004
      Left            =   9888
      TabIndex        =   14
      Top             =   6624
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":10296
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl4 
      Height          =   2004
      Left            =   7872
      TabIndex        =   15
      Top             =   6624
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":109A0
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl5 
      Height          =   2004
      Left            =   5952
      TabIndex        =   16
      Top             =   6672
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1124F
   End
   Begin VB.Shape Shape2 
      BorderWidth     =   8
      Height          =   1248
      Left            =   10176
      Shape           =   3  'Circle
      Top             =   200
      Width           =   1452
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Stopp"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   19.8
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1548
      Left            =   10200
      TabIndex        =   17
      Top             =   48
      Width           =   1404
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1200
      Left            =   10320
      Shape           =   3  'Circle
      Top             =   240
      Width           =   1164
   End
   Begin VB.Image Image1 
      Height          =   888
      Left            =   4704
      Picture         =   "frmAutoPilot.frx":11AFE
      Stretch         =   -1  'True
      Top             =   7248
      Width           =   984
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H00800000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "147"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   780
      Left            =   1056
      TabIndex        =   6
      Top             =   5712
      Width           =   2412
   End
   Begin MSForms.CommandButton CommandButton4 
      Height          =   1020
      Left            =   1056
      TabIndex        =   5
      Top             =   4704
      Width           =   2412
      ForeColor       =   16777215
      BackColor       =   8388608
      Caption         =   "Hold"
      PicturePosition =   262148
      Size            =   "4254;1799"
      FontName        =   "Times New Roman"
      FontEffects     =   1073741825
      FontHeight      =   720
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
      FontWeight      =   700
   End
End
Attribute VB_Name = "frmAutoPilot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub BeauGaugeCtrl6_RightClicked(ByVal nX As Long, ByVal nY As Long)
  x = x
End Sub
Private Sub BeauGaugeCtrl6_LeftClicked(ByVal nX As Long, ByVal nY As Long)
  x = x
End Sub

Private Sub Form_Load()
  Me.Width = 1366 * Screen.TwipsPerPixelX
  Me.Height = 768 * Screen.TwipsPerPixelY
  x = 455 * Screen.TwipsPerPixelX
  Label1.Caption = vbCrLf & "   Stopp" & vbCrLf & "     Stb"
End Sub

Private Sub Image1_Click()
 'frmKeyboard.Show
  frmSetup.Show
  frmSetup.ZOrder
End Sub

Private Sub StbOil_RightClicked(ByVal nX As Long, ByVal nY As Long)
  x = x
End Sub

Private Sub Timer1_Timer()
  Static x As Integer
  Static y As Integer
  Static z As Integer
  Static z2 As Single
  x = x + 1
  If x = 361 Then x = 1
  ga = CompassRose.SetValue("RotateLayer1", x)
  ga = CompassRose.SetValue("DigitalIndicator1", x)
   
   y = y + 1
  If y > 400 Then y = 0
  ga = PortTacho.SetValue("Pointer1", y)
  ga = StbTacho.SetValue("Pointer1", y)
  ga = StbTacho.SetValue("DigitalIndicator1", y * 10)
  ga = PortTacho.SetValue("DigitalIndicator1", y * 10)
  
  'Clock.SetValue
  'ga = Clock.SetValue("Pointer1", Format(Now, "ss"))
  'ga = Clock.SetValue("Pointer2", Format(Now, "nn"))
  ''z = Format(Now, "hh")
  'If z > 12 Then z = z - 12
  'ga = Clock.SetValue("Pointer3", z)
  'ga = Clock.SetValue("DateTime1", TimeValue(Now()))
  'ga = Clock.SetValue("Label2", Format(Now, "hh:nn:ss"))
  
  ga = Water.SetValue("Pointer1", y / 4)
  ga = Diesel.SetValue("Pointer1", y / 4)
  
  z = z + 1
  If z > 120 Then z = 1
  ga = PortTemp.SetValue("DigitalIndicator1", z)
  ga = PortTemp.SetValue("Pointer1", z)
  
  z2 = z2 + 0.01
  If z2 < 10 Then z2 = 10
  If z2 > 15 Then z2 = 10
  ga = Volt.SetValue("DigitalIndicator1", z2 * 10)
  ga = Volt.SetValue("Pointer1", z2)
  
  
End Sub
