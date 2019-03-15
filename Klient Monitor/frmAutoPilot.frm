VERSION 5.00
Object = "{71D75C77-4682-4723-83E6-BD07E1D80111}#1.0#0"; "BGV2ActiveXClientPro.ocx"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmAutoPilot 
   BackColor       =   &H00FF8080&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Autopilot"
   ClientHeight    =   10980
   ClientLeft      =   30
   ClientTop       =   390
   ClientWidth     =   20520
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
   ScaleHeight     =   10980
   ScaleWidth      =   20520
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FF8080&
      Height          =   855
      Left            =   0
      Picture         =   "frmAutoPilot.frx":0000
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   0
      Width           =   975
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauKey 
      Height          =   2025
      Left            =   2040
      TabIndex        =   23
      Top             =   8880
      Width           =   1935
      _Version        =   65536
      _ExtentX        =   3408
      _ExtentY        =   3577
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1A927
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   192
      Top             =   6144
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl Clock 
      Height          =   5904
      Left            =   0
      TabIndex        =   22
      Top             =   0
      Visible         =   0   'False
      Width           =   5904
      _Version        =   65536
      _ExtentX        =   10407
      _ExtentY        =   10407
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1B087
   End
   Begin MSCommLib.MSComm Comm 
      Left            =   4896
      Top             =   4560
      _ExtentX        =   979
      _ExtentY        =   979
      _Version        =   393216
      CommPort        =   11
      DTREnable       =   0   'False
      InBufferSize    =   2000
      InputLen        =   1
      NullDiscard     =   -1  'True
      RThreshold      =   1
      BaudRate        =   57600
      SThreshold      =   1
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl stbVolt 
      Height          =   2604
      Left            =   17760
      TabIndex        =   7
      Top             =   8400
      Width           =   2604
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1B7D1
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl Diesel 
      Height          =   2100
      Left            =   4032
      TabIndex        =   4
      Top             =   8736
      Width           =   2052
      _Version        =   65536
      _ExtentX        =   3619
      _ExtentY        =   3704
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1C14B
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl Water 
      Height          =   2052
      Left            =   0
      TabIndex        =   3
      Top             =   8784
      Width           =   2076
      _Version        =   65536
      _ExtentX        =   3662
      _ExtentY        =   3619
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1C856
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbTacho 
      Height          =   5844
      Left            =   14544
      TabIndex        =   2
      Top             =   96
      Width           =   5840
      _Version        =   65536
      _ExtentX        =   10301
      _ExtentY        =   10308
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1CF60
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortTacho 
      Height          =   5844
      Left            =   6912
      TabIndex        =   1
      Top             =   48
      Width           =   5844
      _Version        =   65536
      _ExtentX        =   10301
      _ExtentY        =   10301
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1D872
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbTemp 
      Height          =   2604
      Left            =   14976
      TabIndex        =   5
      Top             =   5856
      Width           =   2604
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1E184
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbOil 
      Height          =   2600
      Left            =   17760
      TabIndex        =   6
      Top             =   5850
      Width           =   2600
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1EA02
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl StbCharge 
      Height          =   2604
      Left            =   14976
      TabIndex        =   8
      Top             =   8400
      Width           =   2604
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1F27F
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BeauGaugeCtrl1 
      Height          =   2604
      Left            =   12240
      TabIndex        =   9
      Top             =   5856
      Width           =   2604
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":1F988
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortCharge 
      Height          =   2604
      Left            =   6624
      TabIndex        =   10
      Top             =   8400
      Width           =   2604
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":20255
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortVolt 
      Height          =   2604
      Left            =   9408
      TabIndex        =   11
      Top             =   8400
      Width           =   2604
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":2095E
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortTemp 
      Height          =   2600
      Left            =   6624
      TabIndex        =   12
      Top             =   5850
      Width           =   2600
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":212D8
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl PortOil 
      Height          =   2600
      Left            =   9408
      TabIndex        =   13
      Top             =   5850
      Width           =   2600
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":21B56
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl BattVAH 
      Height          =   2604
      Left            =   12240
      TabIndex        =   14
      Top             =   8400
      Width           =   2604
      _Version        =   65536
      _ExtentX        =   4586
      _ExtentY        =   4586
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":223D3
   End
   Begin BGV2ActiveXLib.BeauGaugeCtrl CompassRose 
      Height          =   5904
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5904
      _Version        =   65536
      _ExtentX        =   10414
      _ExtentY        =   10414
      _StockProps     =   0
      GaugeWidth      =   100
      GaugeHeight     =   100
      GaugeV2Data     =   "frmAutoPilot.frx":22FE8
   End
   Begin VB.Label Label10 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Å"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   48
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00004000&
      Height          =   1092
      Left            =   672
      TabIndex        =   29
      Top             =   7200
      Visible         =   0   'False
      Width           =   864
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Æ"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   48
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   1092
      Left            =   4320
      TabIndex        =   28
      Top             =   7152
      Visible         =   0   'False
      Width           =   864
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "000"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   48
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1170
      Left            =   2040
      TabIndex        =   27
      Top             =   7200
      Visible         =   0   'False
      Width           =   1845
   End
   Begin VB.Image Image6 
      Height          =   1140
      Left            =   1296
      Picture         =   "frmAutoPilot.frx":23CA3
      Stretch         =   -1  'True
      Top             =   7152
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Å"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   48
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00004000&
      Height          =   1092
      Left            =   672
      TabIndex        =   26
      Top             =   6144
      Visible         =   0   'False
      Width           =   864
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Æ"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   48
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   1092
      Left            =   4368
      TabIndex        =   25
      Top             =   6192
      Visible         =   0   'False
      Width           =   864
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "AutoPilot OFF"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   22.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   750
      Left            =   1320
      TabIndex        =   24
      Top             =   6390
      Width           =   3300
   End
   Begin VB.Image Image5 
      Height          =   1140
      Left            =   1296
      Picture         =   "frmAutoPilot.frx":2F1B7
      Stretch         =   -1  'True
      Top             =   6096
      Width           =   3300
   End
   Begin VB.Shape Shape4 
      BorderWidth     =   3
      FillColor       =   &H00004000&
      Height          =   444
      Left            =   6192
      Shape           =   3  'Circle
      Top             =   4032
      Width           =   444
   End
   Begin VB.Shape Shape3 
      BorderWidth     =   3
      FillColor       =   &H00004000&
      Height          =   444
      Left            =   6192
      Shape           =   3  'Circle
      Top             =   2784
      Width           =   444
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Comp."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Index           =   3
      Left            =   6048
      TabIndex        =   21
      Top             =   3696
      Width           =   828
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "GSM"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Index           =   2
      Left            =   6096
      TabIndex        =   20
      Top             =   2448
      Width           =   636
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "GPS"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Index           =   1
      Left            =   6144
      TabIndex        =   19
      Top             =   1152
      Width           =   636
   End
   Begin VB.Shape Shape2 
      BorderWidth     =   3
      FillColor       =   &H00004000&
      Height          =   444
      Left            =   6192
      Shape           =   3  'Circle
      Top             =   1536
      Width           =   444
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "WIFI"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Index           =   0
      Left            =   6144
      TabIndex        =   18
      Top             =   48
      Width           =   636
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00004000&
      BorderWidth     =   3
      FillColor       =   &H00004000&
      Height          =   444
      Left            =   6192
      Shape           =   3  'Circle
      Top             =   384
      Width           =   444
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   48
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1260
      Left            =   13248
      TabIndex        =   17
      Top             =   3600
      Width           =   1356
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   48
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1068
      Left            =   13296
      TabIndex        =   16
      Top             =   1920
      Width           =   1164
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   48
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Left            =   13296
      TabIndex        =   15
      Top             =   336
      Width           =   828
   End
   Begin VB.Image Image4 
      Height          =   1104
      Left            =   13104
      Picture         =   "frmAutoPilot.frx":3A6CB
      Stretch         =   -1  'True
      Top             =   3648
      Width           =   1200
   End
   Begin VB.Image Image3 
      Height          =   1104
      Left            =   13104
      Picture         =   "frmAutoPilot.frx":3D524
      Stretch         =   -1  'True
      Top             =   2016
      Width           =   1200
   End
   Begin VB.Image Image2 
      Height          =   1104
      Left            =   13152
      Picture         =   "frmAutoPilot.frx":4037D
      Stretch         =   -1  'True
      Top             =   384
      Width           =   1200
   End
   Begin VB.Image Image1 
      Height          =   696
      Left            =   6000
      Picture         =   "frmAutoPilot.frx":431D6
      Stretch         =   -1  'True
      Top             =   4944
      Width           =   792
   End
End
Attribute VB_Name = "frmAutoPilot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'WIFI HLK-RM04
'SSID WB2018
'PAss 2018WB8102
'IP: 192.168.11.254
'Port: 8080
Public Y As Integer
Dim xx As Integer
Dim OldY As Integer
Dim Z As Integer
Dim WifiLine As String
Dim start As Integer
Dim Mottatt As Long
Dim starttid As Date
Dim startid As Variant
Dim C As String
Dim feil As Long
Dim MouseX As Single
Dim MouseY As Single
Dim Roll As Integer
Dim RollMax As Integer



'Dim Wifidata(100) As Long

Private Sub BeauGaugeCtrl6_RightClicked(ByVal nX As Long, ByVal nY As Long)
  X = X
End Sub
Private Sub BeauGaugeCtrl6_LeftClicked(ByVal nX As Long, ByVal nY As Long)
  X = X
End Sub

Private Sub Clock_RightClicked(ByVal nX As Long, ByVal nY As Long)
   CompassRose.Visible = True
   Clock.Visible = False
End Sub

Private Sub Comm_OnComm()
  C = Comm.Input
  If C <> "" Then
    
    If C = "!" Or C = "$" Or C = "V" Or C = "F" Then
      start = 1
      WifiLine = C
      
    Else
      If start = 1 Then
        If Asc(C) = 10 Then
          'List1.AddItem WifiLine
          start = 0
          'Debug.Print WifiLine
          Comm.InBufferCount = 0
          Call ShowWifiData
          Exit Sub
        ElseIf Asc(C) = 13 Then
        Else
          WifiLine = WifiLine & C
          'Debug.Print c;
        End If
      End If
   End If
 End If
End Sub
Sub ShowWifiData()
  Dim XL As Long
  Dim Cl As Double
  Dim start As Long
  Dim enden As Long
  Static Keypos As Integer
 'GetLocalTime()
  If WifiLine = "" Then Exit Sub
  On Error Resume Next
 
  If frmSetup.Shape1.BackStyle = 0 Then
    frmSetup.Shape1.BackStyle = 1
  Else
    frmSetup.Shape1.BackStyle = 0
  End If
  Timer1.Enabled = False
  Timer1.Interval = 0
  Timer1.Interval = 2000
  Timer1.Enabled = True
  Shape2.FillStyle = 0
  'DoEvents
  If Shape1.BackStyle = 0 Then
    Shape1.BackStyle = 1
  Else
    Shape1.BackStyle = 0
  End If
  'Label8.Caption = WifiLine
  If Left(WifiLine, 1) = "F" Then
    Call GetFactors
    Exit Sub
  End If
  If Left(WifiLine, 1) = "V" Then
    Call GetVariables
    Exit Sub
  End If
  If Left(WifiLine, 1) <> "!" Then Exit Sub
  frmSetup.Label4(0).Caption = WifiLine
  Keypos = Keypos + 1
  If Keypos = 4 Then Keypos = 0
  If Keypos = 0 Then
    BeauKey.SetValue "Knob1", 0
  ElseIf Keypos = 1 Then
    BeauKey.SetValue "Knob1", 35
  ElseIf Keypos = 2 Then
    BeauKey.SetValue "Knob1", 70
  ElseIf Keypos = 3 Then
    BeauKey.SetValue "Knob1", 120
  End If
  
  WifiLine = Right(WifiLine, Len(WifiLine) - 1)
  wifidata = Split(WifiLine, ",")
  If frmSetup.Visible = False Then frmAutoPilot.Enabled = True
  If UBound(wifidata) < 19 Then Exit Sub
  
  tiden = wifidata(0)
  'Debug.Print tiden
  Cl = Right(tiden, 2)
  Clock.SetValue "Pointer1", Cl
  Cl = Mid(tiden, 13, 2)
  Clock.SetValue "Pointer2", Cl
  XL = Mid(tiden, 10, 2) + GMT
  If XL > 11 Then XL = XL - 12
   XL = XL * 60 + Val(Mid(tiden, 13, 2))
   Cl = XL
  Clock.SetValue "Pointer3", Cl
  
  '18 Battery Volt
  XL = wifidata(1)
  XL = XL * BatteryVC
  XL = XL / 10000
  BattVAH.SetValue "DigitalIndicator2", XL
  BattVAH.SetValue "Pointer1", XL
  BattVAH.SetValue "DigitalIndicator1", 287
  BattVAH.SetValue "Pointer2", 287
  If ShowValue = 13 Then frmSetup.SysLabel(13).Caption = XL
  
  '19 Port Alternator Volt
  XL = wifidata(2)
  XL = XL * PortALternatorVC
  XL = XL / 10000
  If ShowValue = 4 Then frmSetup.SysLabel(4) = XL
  PortVolt.SetValue "DigitalIndicator1", XL
  If XL > 110 Then XL = 100
  PortVolt.SetValue "Pointer1", XL '- 110
  
  
  '20 Stb Alternator Volt
  XL = wifidata(3)
  XL = XL * StbALternatorVC
  XL = XL / 10000
  If ShowValue = 9 Then frmSetup.SysLabel(9) = XL
  stbVolt.SetValue "DigitalIndicator1", XL
  If XL < 110 Then XL = 100
  stbVolt.SetValue "Pointer1", XL
  
  
  XL = wifidata(4) 'PortRev
  XL = XL / 2.2
  Me.PortTacho.SetValue "Pointer1", XL * 10
  Me.PortTacho.SetValue "DigitalIndicator1", XL * 10
  
  XL = wifidata(5) 'StbRev
  XL = XL / 2.2
  Me.StbTacho.SetValue "Pointer1", XL * 10
  Me.StbTacho.SetValue "DigitalIndicator1", XL * 10
  XL = wifidata(6)
  If XL > 50 Then
    xi = XL - 50
    XL = XL - xi
  
  End If
  
  '23
  Static testo
  testo = testo + 1
  If testo = 50 Then testo = 0
  PortOil.SetValue "Pointer1", testo
  PortOil.SetValue "DigitalIndicator1", testo / 10
  
  '24
  StbOil.SetValue "Pointer1", testo
  StbOil.SetValue "DigitalIndicator1", testo / 10
  
  Dim ttt As Double
  
  '25
  XL = wifidata(8)
  XL = ((1024 - XL) / 6) - (((1024 - XL) - 180) * 0.05)
  PortTemp.SetValue "Pointer1", XL
  PortTemp.SetValue "DigitalIndicator1", XL
  
  
  '26
  XL = wifidata(9)
  XL = ((1024 - XL) / 6) - (((1024 - XL) - 180) * 0.05)
  StbTemp.SetValue "Pointer1", XL
  StbTemp.SetValue "DigitalIndicator1", XL
  
  '27
  PortCharge.SetValue "Pointer1", wifidata(10)
  PortCharge.SetValue "DigitalIndicator1", wifidata(10)
  
  '28
  StbCharge.SetValue "Pointer1", wifidata(11)
  StbCharge.SetValue "DigitalIndicator1", wifidata(11)
  
  
  '29
  'BAttery Charge
  If ShowValue = 14 Then
    frmSetup.SysLabel(14) = wifidata(12)
  End If
  
  '30
  Water.SetValue "Pointer1", wifidata(13)
  
  '31
  Diesel.SetValue "Pointer1", wifidata(14)
  
  '32  CompassOK
  If wifidata(15) = 0 Then
    Shape4.FillStyle = 1
  Else
    Shape4.FillStyle = 0
  End If
  '33  GPSOK
  If wifidata(16) = 0 Then
    Shape2.FillStyle = 1
  Else
    Shape2.FillStyle = 0
  End If
  
  '34  GSMOK
   If wifidata(17) = 0 Then
    Shape3.FillStyle = 1
  Else
    Shape3.FillStyle = 0
  End If
 
  '35  GPSHeading
  '36  GPSSPeed
  Me.CompassRose.SetValue "DigitalIndicator2", wifidata(19)
  If wifidata(19) < 20 Then 'Speed to slow, use Compass heading
    Me.CompassRose.SetValue "RotateLayer1", wifidata(20) / 10
    Me.CompassRose.SetValue "DigitalIndicator1", wifidata(20) / 10
  Else
  End If
  '37  CompassHeading
  '38  Roll Against Stb is 0-90, Against port is 255-165
  Roll = wifidata(21)
  If Roll > 100 Then
     Roll = 256 - Roll
     Roll = -Roll
  End If
  If Abs(Roll) > Abs(RollMax) Then RollMax = Roll
  'frmSetup.Label2(17) = Roll
  'frmSetup.Label2(18) = RollMax
  'Label8.Caption = Roll
  
  '39 Batterymah
  BatterymAh = wifidata(22)
  frmSetup.SysLabel2(16) = BatterymAh
  
  '23 Mainkey
  Mainkey = wifidata(23)

  '24 Hold
  If DontcheckHolding = True Then
    DontcheckHolding = False
  Else
   If (wifidata(24) = 0 And Image6.Visible = True) Or (wifidata(24) = 0 And Label4.Caption = "To SLOW") Then
      Label4.Top = 6384
      Label4.Font.Size = 22
      If wifidata(25) < 20 Then
        Label4.Caption = "AutoPilot OFF"
      Else
        If Label4.Caption = "To SLOW" Then
          Label4.Caption = "AutoPilot OFF"
        Else
           Label4.Caption = "To SLOW"
        End If
      End If
      Label6.Visible = False
      Label7.Visible = False
      Image6.Visible = False
      Label8.Visible = False
      Label9.Visible = False
      Label10.Visible = False
    ElseIf wifidata(24) = 1 And Image6.Visible = False Then
      Label4.Top = 6250
      Label4.Font.Size = 34
      Label4.Caption = "Holding "
      Label8.Caption = Format(wifidata(25) / 10, "000")
      Label8.Visible = True
      Label9.Visible = True
      Label10.Visible = True
      Image6.Visible = True
    End If
    If Label8.Caption <> wifidata(25) Then
     Label8.Caption = Format(wifidata(25), "000")
     
    End If
  End If
  CoarseToHold = wifidata(25)
  If frmSetup.Visible = False Then frmAutoPilot.Enabled = True
  WifiLine = ""
  C = Comm.Input
  While C <> ""
    C = Comm.Input
  Wend
  If Err.Number <> 0 Then
    Debug.Print Err.Description
    feil = feil + 1
  Else
    If AskforFactors = 1 Then
      frmAutoPilot.Comm.Output = "Factors"
    Else
      If AskforVariables = 1 Then
         frmAutoPilot.Comm.Output = "Variables"
      End If
    End If
    If SendtoAP <> "" Then
      frmAutoPilot.Comm.Output = SendtoAP
      SendtoAP = ""
    End If
  End If
  On Error GoTo 0
  'If Label7.Caption = "" Then Label7.Caption = Now()
  Mottatt = Mottatt + 1
  'Label8.Caption = "Mottatt=" & Mottatt & "  Mangler=" & Mottatt - DateDiff("S", Label7.Caption, Now) & " Feil=" & feil
  enddate = Now()
  
  enden = GetTickCount
  
End Sub
Sub GetVariables()
  AskforVariables = 0

  frmSetup.Label4(1).Caption = WifiLine
  WifiLine = Right(WifiLine, Len(WifiLine) - 1)
  wifidata = Split(WifiLine, ",")
  If UBound(wifidata) < 16 Then Exit Sub
  frmSetup.Label2(9).Caption = wifidata(0)
  frmSetup.Label2(10).Caption = wifidata(1)
  frmSetup.Label2(11).Caption = wifidata(2)
  frmSetup.Label2(0).Caption = wifidata(3)
  frmSetup.Label2(1).Caption = wifidata(4)
  frmSetup.Label2(2).Caption = wifidata(5)
  frmSetup.Label2(3).Caption = wifidata(6)
  frmSetup.Label2(4).Caption = wifidata(7)
  frmSetup.Label2(5).Caption = wifidata(8)
  frmSetup.Label2(6).Caption = wifidata(9)
  frmSetup.Label2(12).Caption = wifidata(10)
  frmSetup.Label2(8).Caption = wifidata(11)
  frmSetup.Label2(7).Caption = wifidata(12)
  frmSetup.Label2(13).Caption = wifidata(13)
  frmSetup.Label2(14).Caption = wifidata(14)
  frmSetup.Label2(15).Caption = wifidata(15)
  frmSetup.Label2(16).Caption = wifidata(16)
  cadj = wifidata(17)
  frmSetup.Label2(17).Caption = cadj
 
End Sub

Sub GetFactors()
 AskforFactors = 0

 frmSetup.Label4(2).Caption = WifiLine
 
 WifiLine = Right(WifiLine, Len(WifiLine) - 1)
 
 wifidata = Split(WifiLine, ",")
 PortRPMC = wifidata(0)
 frmSetup.SysLabel2(1).Caption = PortRPMC
 PortOilC = wifidata(1)
 frmSetup.SysLabel2(2).Caption = PortOilC
 PortTempC = wifidata(2)
 frmSetup.SysLabel2(3).Caption = PortTempC
 PortALternatorVC = wifidata(3)
 frmSetup.SysLabel2(4).Caption = PortALternatorVC
 PortAlternatorAC = wifidata(4)
 frmSetup.SysLabel2(5).Caption = PortAlternatorAC
 StbRPMC = wifidata(5)
 frmSetup.SysLabel2(6).Caption = StbRPMC
 StbOilC = wifidata(6)
 frmSetup.SysLabel2(7).Caption = StbOilC
 StbTempC = wifidata(7)
 frmSetup.SysLabel2(8).Caption = StbTempC
 StbALternatorVC = wifidata(8)
 frmSetup.SysLabel2(9).Caption = StbALternatorVC
 StbAlternatorAC = wifidata(9)
 frmSetup.SysLabel2(10).Caption = StbAlternatorAC
 WaterC = wifidata(10)
 frmSetup.SysLabel2(11).Caption = WaterC
 DieselC = wifidata(11)
 frmSetup.SysLabel2(12).Caption = DieselC
 BatteryVC = wifidata(12)
 frmSetup.SysLabel2(13).Caption = BatteryVC
 BAtteryAC = wifidata(13)
 frmSetup.SysLabel2(14).Caption = BAtteryAC
 BatteryCap = wifidata(14)
 frmSetup.SysLabel2(15).Caption = BatteryCap
 
 
End Sub
Private Sub CommandButton4_Click()

End Sub

Private Sub Command1_Click()
 If Clock.Visible = False Then
    Me.CompassRose.Visible = False
    Clock.Visible = True
    Clock.ZOrder
    Command1.ZOrder
 Else
 
    Me.CompassRose.Visible = True
    Me.CompassRose.ZOrder
    Clock.Visible = False
    Command1.ZOrder
 End If
End Sub

Private Sub CompassRose_RightClicked(ByVal nX As Long, ByVal nY As Long)
   CompassRose.Visible = False
   Clock.Visible = True
End Sub

Private Sub Form_Load()
  Me.Width = 1366 * Screen.TwipsPerPixelX
  Me.Height = 768 * Screen.TwipsPerPixelY
  X = 455 * Screen.TwipsPerPixelX
  Me.Width = 20500
  Me.Height = 11500
  On Error Resume Next
  Comm.PortOpen = True
  If Err <> 0 Then
    MsgBox "No WIFI detected"
  Else
    AskforFactors = 1
    AskforVariables = 1
  End If
  GMT = GetSetting(App.Title, "System", "GMT", 1)
  Clock.Visible = True
  Me.CompassRose.Visible = False
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
 MouseX = X
 MouseY = Y
 
End Sub

Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  Unload frmNumeric
  Unload frmSetup
  Unload frmKeyboard

End Sub

Private Sub Image1_Click()
 'frmKeyboard.Show
  frmSetup.Show
  frmSetup.ZOrder
  frmSetup.MainTab.Tab = GetSetting(App.Title, "System", "Tab", 0)
End Sub

Private Sub Image2_Click()
  Comm.Output = "$SSE"
  
End Sub

Private Sub Label1_Click()
 If Comm.PortOpen = True Then
   Comm.Output = "$SPE"
 End If
End Sub

Private Sub Label1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
 Image2.BorderStyle = 1
End Sub

Private Sub Label1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Image2.BorderStyle = 0
End Sub

Private Sub Label10_Click()
   SendtoAP = "$Coarse-2" 'Decrease HoldCoarse with 2 degrees
 
End Sub

Private Sub Label2_Click()
If Comm.PortOpen = True Then
   Comm.Output = "$SSE"
 End If
End Sub

Private Sub Label2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Image3.BorderStyle = 1
End Sub

Private Sub Label2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Image3.BorderStyle = 0
End Sub

Private Sub Label3_Click()
  If Comm.PortOpen = True Then
   Comm.Output = "$SBE"
 End If
End Sub

Private Sub Label3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Image4.BorderStyle = 1
End Sub

Private Sub Label3_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Image4.BorderStyle = 0
End Sub

Private Sub OptionButton1_Change()
If OptionButton1.Value = True Then
   CompassRose.Visible = False
   Clock.Visible = True
 Else
   CompassRose.Visible = True
   Clock.Visible = False
 End If
End Sub

Private Sub Label4_Click()
  If Left(Label4.Caption, 1) = "H" Then
    Label4.Top = 6384
    Label4.Font.Size = 22
    Label4.Caption = "AutoPilot OFF"
    Label6.Visible = False
    Label7.Visible = False
    Image6.Visible = False
    Label8.Visible = False
    Label9.Visible = False
    Label10.Visible = False
    
  Else
    Label4.Top = 6250
    Label4.Font.Size = 34
    Label4.Caption = "Holding "
    Label8.Caption = Format(CoarseToHold / 10, "000")
    Label8.Visible = True
    Label9.Visible = True
    Label10.Visible = True
    Image6.Visible = True
  End If
  DontcheckHolding = True
  SendtoAP = "$HOLD" 'Activate/Deactivate Holding.
End Sub

Private Sub Label4_DblClick()
  'SendtoAP = ""
  'frmNumeric.lblfrom = "Coarse"
  'frmNumeric.Show
End Sub

Private Sub Label8_Click()
  frmNumeric.lblfrom = "Coarse"
  frmNumeric.Show
End Sub

Private Sub Label9_Click()
  SendtoAP = "$Coarse2" 'Increase HoldCoarse with 2 degrees
  
End Sub

Private Sub StbOil_RightClicked(ByVal nX As Long, ByVal nY As Long)
  X = X
End Sub

Private Sub Timer1_Timer()
'  Shape2.FillStyle = 1
  Static Xc As Integer
'  Static Z As Integer
'  Static z2 As Single
'  X = X + 1
'  If X = 361 Then X = 1
'  ga = CompassRose.SetValue("RotateLayer1", X)
'  ga = CompassRose.SetValue("DigitalIndicator1", X)
'
'   Y = Y + 10
'  If Y > 300 Then Y = 0
'
'  'Clock.SetValue
'  'ga = Clock.SetValue("Pointer1", Format(Now, "ss"))
'  'ga = Clock.SetValue("Pointer2", Format(Now, "nn"))
'  ''z = Format(Now, "hh")
'  'If z > 12 Then z = z - 12
'  'ga = Clock.SetValue("Pointer3", z)
'  'ga = Clock.SetValue("DateTime1", TimeValue(Now()))
'  'ga = Clock.SetValue("Label2", Format(Now, "hh:nn:ss"))
'
'  ga = Water.SetValue("Pointer1", Y / 4)
'  ga = Diesel.SetValue("Pointer1", Y / 4)
'
'  Z = Z + 1
'  If Z > 120 Then Z = 1
'  'ga = PortTemp.SetValue("DigitalIndicator1", z)
'  'ga = PortTemp.SetValue("Pointer1", z)
'
'  z2 = z2 + 0.01
'  If z2 < 10 Then z2 = 10
'  If z2 > 15 Then z2 = 10
'  'ga = Volt.SetValue("DigitalIndicator1", z2 * 10)
'  'ga = Volt.SetValue("Pointer1", z2)
'  Timer2.Enabled = True

  
End Sub

Private Sub Timer2_Timer()
  If xx = 0 Then
    Z = (Y - OldY) / 9
  End If
  xx = xx + 1
  
  ga = PortTacho.SetValue("Pointer1", OldY + Z * xx)
  ga = StbTacho.SetValue("Pointer1", OldY + Z * xx)
  ga = StbTacho.SetValue("DigitalIndicator1", (OldY + Z * xx) * 10)
  ga = PortTacho.SetValue("DigitalIndicator1", (OldY + Z * xx) * 10)
  If xx = 9 Then
    Timer2.Enabled = False
    xx = 0
    OldY = Y
  End If
End Sub
