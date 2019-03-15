VERSION 5.00
Object = "{71D75C77-4682-4723-83E6-BD07E1D80111}#1.0#0"; "BGV2ActiveXPro.ocx"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form AutoPilot 
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
   Begin BGV2ActiveXLib.BeauGaugeCtrl Volt 
      Height          =   2004
      Left            =   4224
      TabIndex        =   13
      Top             =   4704
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":0000
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortOil 
      Height          =   2004
      Left            =   8200
      TabIndex        =   10
      Top             =   6768
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":08AF
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortTemp 
      Height          =   2004
      Left            =   6204
      TabIndex        =   9
      Top             =   6768
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":112C
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl Diesel 
      Height          =   2004
      Left            =   10200
      TabIndex        =   5
      Top             =   6768
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":19AA
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl Water 
      Height          =   2004
      Left            =   9744
      TabIndex        =   4
      Top             =   4800
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":20B5
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbTacho 
      Height          =   5196
      Left            =   10800
      TabIndex        =   2
      Top             =   144
      Width           =   5196
      _Version        =   65536
      _ExtentX        =   9172
      _ExtentY        =   9172
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":27BF
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortTacho 
      Height          =   5196
      Left            =   5424
      TabIndex        =   1
      Top             =   96
      Width           =   5196
      _Version        =   65536
      _ExtentX        =   9172
      _ExtentY        =   9172
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":3005
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   0
      Top             =   8352
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl CompassRose 
      Height          =   5200
      Left            =   96
      TabIndex        =   0
      Top             =   96
      Width           =   5200
      _Version        =   65536
      _ExtentX        =   9165
      _ExtentY        =   9172
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":384B
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbTemp 
      Height          =   2004
      Left            =   12200
      TabIndex        =   11
      Top             =   6720
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":4440
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbOil 
      Height          =   2004
      Left            =   14200
      TabIndex        =   12
      Top             =   6720
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3535
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":4CBE
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl2 
      Height          =   2004
      Left            =   4200
      TabIndex        =   14
      Top             =   6720
      Width           =   2004
      _Version        =   65536
      _ExtentX        =   3528
      _ExtentY        =   3528
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "AutoPilot.frx":553B
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
      Left            =   1200
      TabIndex        =   8
      Top             =   6864
      Width           =   2412
   End
   Begin MSForms.CommandButton CommandButton4 
      Height          =   1020
      Left            =   1200
      TabIndex        =   7
      Top             =   5712
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
   Begin MSForms.CommandButton CommandButton3 
      Height          =   972
      Left            =   12288
      TabIndex        =   6
      Top             =   5664
      Width           =   2412
      ForeColor       =   192
      BackColor       =   8388608
      Caption         =   "Stopp"
      Size            =   "4254;1714"
      FontName        =   "Times New Roman"
      FontEffects     =   1073741825
      FontHeight      =   720
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
      FontWeight      =   700
   End
   Begin MSForms.CommandButton CommandButton2 
      Height          =   972
      Left            =   6768
      TabIndex        =   3
      Top             =   5664
      Width           =   2556
      ForeColor       =   192
      BackColor       =   8388608
      Caption         =   "Stopp"
      Size            =   "4508;1714"
      FontName        =   "Times New Roman"
      FontEffects     =   1073741825
      FontHeight      =   720
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
      FontWeight      =   700
   End
End
Attribute VB_Name = "AutoPilot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  Me.Width = 1366 * Screen.TwipsPerPixelX
  Me.Height = 768 * Screen.TwipsPerPixelY
  x = 455 * Screen.TwipsPerPixelX
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
