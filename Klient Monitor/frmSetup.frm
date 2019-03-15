VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmSetup 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "White Bird SetUp"
   ClientHeight    =   9480
   ClientLeft      =   30
   ClientTop       =   390
   ClientWidth     =   16590
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
   ScaleHeight     =   9480
   ScaleWidth      =   16590
   StartUpPosition =   3  'Windows Default
   Begin TabDlg.SSTab MainTab 
      Height          =   9312
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   15468
      _ExtentX        =   27279
      _ExtentY        =   16431
      _Version        =   393216
      TabHeight       =   882
      WordWrap        =   0   'False
      ShowFocusRect   =   0   'False
      TabCaption(0)   =   "Pilot Variables"
      TabPicture(0)   =   "frmSetup.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "FrameAutoPilot"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "System Variables"
      TabPicture(1)   =   "frmSetup.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Frame1"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Live Data"
      TabPicture(2)   =   "frmSetup.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Label2(20)"
      Tab(2).Control(1)=   "Label1(20)"
      Tab(2).ControlCount=   2
      Begin VB.Frame Frame1 
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   7.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   8028
         Left            =   -74952
         TabIndex        =   43
         Top             =   576
         Width           =   15285
         Begin VB.CommandButton Command3 
            Caption         =   "EXIT"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   36
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   756
            Left            =   13344
            TabIndex        =   85
            Top             =   7248
            Width           =   1932
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "360000"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   16
            Left            =   11280
            TabIndex        =   84
            Tag             =   "BatterymAh"
            Top             =   7296
            Width           =   1800
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   15
            Left            =   11280
            TabIndex        =   83
            Tag             =   "BatteryCap"
            Top             =   6672
            Width           =   1752
         End
         Begin VB.Label SysLabel 
            Caption         =   "Battery SOC"
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
            Index           =   16
            Left            =   8256
            TabIndex        =   82
            Top             =   7296
            Width           =   2832
         End
         Begin VB.Label SysLabel 
            Caption         =   "Battery Cap"
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
            Index           =   15
            Left            =   8256
            TabIndex        =   81
            Top             =   6720
            Width           =   2664
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   14
            Left            =   11808
            TabIndex        =   80
            Tag             =   "BatteryAC"
            Top             =   6000
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   13
            Left            =   11808
            TabIndex        =   79
            Tag             =   "BatteryVC"
            Top             =   5376
            Width           =   1224
         End
         Begin VB.Label SysLabel 
            Caption         =   "Battery Amp"
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
            Index           =   14
            Left            =   8208
            TabIndex        =   78
            Top             =   6000
            Width           =   2772
         End
         Begin VB.Label SysLabel 
            Caption         =   "Battery Volt"
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
            Index           =   13
            Left            =   8208
            TabIndex        =   77
            Top             =   5400
            Width           =   2676
         End
         Begin VB.Label SysLabel 
            Caption         =   "Diesel"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   12
            Left            =   360
            TabIndex        =   76
            Top             =   6000
            Width           =   1410
         End
         Begin VB.Label SysLabel 
            Caption         =   "Water"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   11
            Left            =   360
            TabIndex        =   75
            Top             =   5400
            Width           =   1380
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   12
            Left            =   3168
            TabIndex        =   74
            Tag             =   "DieselC"
            Top             =   5952
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   11
            Left            =   3168
            TabIndex        =   73
            Tag             =   "WaterC"
            Top             =   5328
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   10
            Left            =   13920
            TabIndex        =   72
            Tag             =   "StbAlternatorAC"
            Top             =   4416
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   585
            Index           =   9
            Left            =   13920
            TabIndex        =   71
            Tag             =   "StbAlternatorVC"
            Top             =   3840
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   585
            Index           =   8
            Left            =   13920
            TabIndex        =   70
            Tag             =   "StbTempC"
            Top             =   3240
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   7
            Left            =   13920
            TabIndex        =   69
            Tag             =   "StbOilC"
            Top             =   2640
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   6
            Left            =   13920
            TabIndex        =   68
            Tag             =   "StbRPMC"
            Top             =   2040
            Width           =   1224
         End
         Begin VB.Label SysLabel 
            Caption         =   "Port Engine Alternator A"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   5
            Left            =   360
            TabIndex        =   67
            Top             =   4560
            Width           =   5580
         End
         Begin VB.Label SysLabel 
            Caption         =   "Port Engine Alternator V"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   4
            Left            =   360
            TabIndex        =   66
            Top             =   3960
            Width           =   5580
         End
         Begin VB.Label SysLabel 
            Caption         =   "Port Engine Oil"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   2
            Left            =   360
            TabIndex        =   65
            Top             =   2760
            Width           =   3465
         End
         Begin VB.Label SysLabel 
            Caption         =   "Port Engine Temp"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   3
            Left            =   360
            TabIndex        =   64
            Top             =   3360
            Width           =   4125
         End
         Begin VB.Label SysLabel 
            Caption         =   "Port Engine RPM"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   1
            Left            =   360
            TabIndex        =   63
            Top             =   2160
            Width           =   3915
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   5
            Left            =   6240
            TabIndex        =   62
            Tag             =   "PortAlternatorAC"
            Top             =   4440
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   4
            Left            =   6240
            TabIndex        =   61
            Tag             =   "PortAlternatorVC"
            Top             =   3840
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   3
            Left            =   6240
            TabIndex        =   60
            Tag             =   "PortTempC"
            Top             =   3240
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   2
            Left            =   6240
            TabIndex        =   59
            Tag             =   "PortOilC"
            Top             =   2640
            Width           =   1224
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "3333"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   1
            Left            =   6240
            TabIndex        =   58
            Tag             =   "PortRPMC"
            Top             =   2040
            Width           =   1224
         End
         Begin VB.Line Line1 
            BorderWidth     =   5
            X1              =   360
            X2              =   15000
            Y1              =   1920
            Y2              =   1920
         End
         Begin VB.Label SysLabel 
            AutoSize        =   -1  'True
            Caption         =   "ADC convertion factors"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   20
            Left            =   360
            TabIndex        =   57
            Top             =   1320
            Width           =   5295
         End
         Begin VB.Label SysLabel 
            Caption         =   "Stb Engine Alternator A"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   10
            Left            =   8160
            TabIndex        =   56
            Top             =   4560
            Width           =   5400
         End
         Begin VB.Label SysLabel 
            Caption         =   "Stb Engine Alternator V"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   9
            Left            =   8160
            TabIndex        =   55
            Top             =   3960
            Width           =   5400
         End
         Begin VB.Label SysLabel 
            Caption         =   "Stb Engine Oil"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   7
            Left            =   8160
            TabIndex        =   54
            Top             =   2760
            Width           =   3285
         End
         Begin VB.Label SysLabel 
            Caption         =   "Stb Engine Temp"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   8
            Left            =   8160
            TabIndex        =   53
            Top             =   3360
            Width           =   3945
         End
         Begin VB.Label SysLabel 
            Caption         =   "Stb Engine RPM"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   6
            Left            =   8160
            TabIndex        =   52
            Top             =   2160
            Width           =   3735
         End
         Begin VB.Label SysLabel 
            AutoSize        =   -1  'True
            Caption         =   "Hour"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   50
            Left            =   5640
            TabIndex        =   46
            Top             =   480
            Width           =   1110
         End
         Begin VB.Label SysLabel2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   585
            Index           =   0
            Left            =   5040
            TabIndex        =   45
            Tag             =   "STMR"
            Top             =   360
            Width           =   570
         End
         Begin VB.Label SysLabel 
            AutoSize        =   -1  'True
            Caption         =   "Local Time = GMT +"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   0
            Left            =   330
            TabIndex        =   44
            Top             =   480
            Width           =   4680
         End
      End
      Begin VB.Frame FrameAutoPilot 
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   7.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   8748
         Left            =   48
         TabIndex        =   1
         Top             =   528
         Width           =   15324
         Begin VB.CommandButton Command1 
            Caption         =   "EXIT"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   36
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   756
            Left            =   13200
            TabIndex        =   47
            Top             =   6552
            Width           =   1932
         End
         Begin VB.Label Label4 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Label4"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   2
            Left            =   528
            TabIndex        =   90
            Top             =   8160
            Width           =   14700
         End
         Begin VB.Label Label4 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Label4"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   1
            Left            =   528
            TabIndex        =   89
            Top             =   7776
            Width           =   14700
         End
         Begin VB.Label Label4 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Label4"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   0
            Left            =   528
            TabIndex        =   88
            Top             =   7392
            Width           =   14700
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   17
            Left            =   13584
            TabIndex        =   87
            Tag             =   "CADJ"
            Top             =   5520
            Width           =   1596
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Compass adjust"
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
            Index           =   17
            Left            =   9360
            TabIndex        =   86
            Top             =   5520
            Width           =   3624
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   585
            Index           =   16
            Left            =   13584
            TabIndex        =   51
            Tag             =   "HDA"
            Top             =   4920
            Width           =   1590
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   585
            Index           =   15
            Left            =   13584
            TabIndex        =   50
            Tag             =   "HDS"
            Top             =   4320
            Width           =   1590
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Heading agregate"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   16
            Left            =   9360
            TabIndex        =   49
            Top             =   4920
            Width           =   4065
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Heading source"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   15
            Left            =   9360
            TabIndex        =   48
            Top             =   4320
            Width           =   3585
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00008000&
            Height          =   204
            Left            =   240
            Shape           =   3  'Circle
            Top             =   7440
            Width           =   204
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   14
            Left            =   13584
            TabIndex        =   42
            Tag             =   "RTV"
            Top             =   3648
            Width           =   1596
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   13
            Left            =   13584
            TabIndex        =   41
            Tag             =   "OCV"
            Top             =   3072
            Width           =   1596
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Rate of Turn value"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   555
            Index           =   14
            Left            =   9360
            TabIndex        =   40
            Top             =   3645
            Width           =   4140
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Off Coarse value"
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
            Index           =   13
            Left            =   9360
            TabIndex        =   39
            Top             =   3072
            Width           =   3780
         End
         Begin VB.Label Label3 
            Caption         =   ".1 Deg."
            Height          =   492
            Index           =   8
            Left            =   6048
            TabIndex        =   38
            Top             =   3936
            Width           =   1500
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   492
            Index           =   6
            Left            =   4560
            TabIndex        =   37
            Tag             =   "MAXOC"
            Top             =   3984
            Width           =   1392
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Max off Coarse"
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
            Index           =   6
            Left            =   240
            TabIndex        =   36
            Top             =   3936
            Width           =   3444
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   588
            Index           =   12
            Left            =   13584
            TabIndex        =   35
            Tag             =   "RMC"
            Top             =   2208
            Width           =   1596
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Rudder Constant"
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
            Index           =   12
            Left            =   9360
            TabIndex        =   34
            Top             =   2256
            Width           =   3804
         End
         Begin VB.Label Label3 
            Caption         =   "Sec"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   7
            Left            =   7008
            TabIndex        =   33
            Top             =   6576
            Width           =   1596
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   28.5
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   588
            Index           =   8
            Left            =   6288
            TabIndex        =   32
            Tag             =   "WAS"
            Top             =   6576
            Width           =   576
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Time between Corrections"
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
            Index           =   8
            Left            =   240
            TabIndex        =   31
            Top             =   6672
            Width           =   5892
         End
         Begin VB.Label Label3 
            Caption         =   ".1 D/S"
            Height          =   588
            Index           =   6
            Left            =   6048
            TabIndex        =   30
            Top             =   4464
            Width           =   1596
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Counter, Closing In"
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
            Index           =   7
            Left            =   240
            TabIndex        =   29
            Top             =   4416
            Width           =   4332
         End
         Begin VB.Label Label3 
            Caption         =   ".1 D/S"
            Height          =   588
            Index           =   5
            Left            =   6048
            TabIndex        =   28
            Top             =   3456
            Width           =   1596
         End
         Begin VB.Label Label3 
            Caption         =   ".1 D/S"
            Height          =   588
            Index           =   4
            Left            =   6048
            TabIndex        =   27
            Top             =   2976
            Width           =   1596
         End
         Begin VB.Label Label3 
            Caption         =   "mS"
            Height          =   588
            Index           =   3
            Left            =   6144
            TabIndex        =   26
            Top             =   1920
            Width           =   780
         End
         Begin VB.Label Label3 
            Caption         =   "mS"
            Height          =   540
            Index           =   2
            Left            =   6144
            TabIndex        =   25
            Top             =   1008
            Width           =   780
         End
         Begin VB.Label Label3 
            Caption         =   "mS"
            Height          =   588
            Index           =   1
            Left            =   6144
            TabIndex        =   24
            Top             =   1488
            Width           =   780
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Max Rate of Turn"
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
            Index           =   5
            Left            =   240
            TabIndex        =   23
            Top             =   3456
            Width           =   3900
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Min Rate of Turn"
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
            Index           =   4
            Left            =   240
            TabIndex        =   22
            Top             =   3024
            Width           =   3756
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Rudder Lag Time"
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
            Index           =   3
            Left            =   192
            TabIndex        =   21
            Top             =   2016
            Width           =   3864
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   588
            Index           =   11
            Left            =   13584
            TabIndex        =   20
            Tag             =   "Ruddercenter"
            Top             =   1632
            Width           =   1596
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   588
            Index           =   10
            Left            =   13584
            TabIndex        =   19
            Tag             =   "Ruddermax"
            Top             =   1056
            Width           =   1596
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   588
            Index           =   9
            Left            =   13584
            TabIndex        =   18
            Tag             =   "Ruddermin"
            Top             =   480
            Width           =   1596
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "RudderCenter"
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
            Index           =   11
            Left            =   9360
            TabIndex        =   17
            Top             =   1632
            Width           =   3144
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "RudderMax"
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
            Index           =   10
            Left            =   9360
            TabIndex        =   16
            Top             =   1056
            Width           =   2592
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "RudderMin"
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
            Index           =   9
            Left            =   9312
            TabIndex        =   15
            Top             =   480
            Width           =   2448
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   492
            Index           =   7
            Left            =   4560
            TabIndex        =   14
            Tag             =   "CIC"
            Top             =   4464
            Width           =   1392
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   492
            Index           =   5
            Left            =   4560
            TabIndex        =   13
            Tag             =   "MAXRT"
            Top             =   3504
            Width           =   1392
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   492
            Index           =   4
            Left            =   4560
            TabIndex        =   12
            Tag             =   "MINRT"
            Top             =   3024
            Width           =   1392
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   492
            Index           =   3
            Left            =   4560
            TabIndex        =   11
            Tag             =   "RL"
            Top             =   1920
            Width           =   1392
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   492
            Index           =   2
            Left            =   4560
            TabIndex        =   10
            Tag             =   "RBL"
            Top             =   1440
            Width           =   1392
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   492
            Index           =   1
            Left            =   4560
            TabIndex        =   9
            Tag             =   "MTMR"
            Top             =   960
            Width           =   1380
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Rudder BackLash"
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
            Index           =   2
            Left            =   192
            TabIndex        =   8
            Top             =   1488
            Width           =   3996
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Max Pump Time"
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
            Index           =   1
            Left            =   192
            TabIndex        =   7
            Top             =   1008
            Width           =   3648
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Min Pump Time"
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
            Index           =   0
            Left            =   192
            TabIndex        =   4
            Top             =   480
            Width           =   3504
         End
         Begin VB.Label Label2 
            Alignment       =   1  'Right Justify
            BorderStyle     =   1  'Fixed Single
            Caption         =   "1234"
            Height          =   492
            Index           =   0
            Left            =   4560
            TabIndex        =   3
            Tag             =   "STMR"
            Top             =   480
            Width           =   1392
         End
         Begin VB.Label Label3 
            Caption         =   "mS"
            Height          =   588
            Index           =   0
            Left            =   6096
            TabIndex        =   2
            Top             =   528
            Width           =   780
         End
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
         Index           =   20
         Left            =   -70728
         TabIndex        =   6
         Top             =   768
         Width           =   1728
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Battery Capasity"
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
         Index           =   20
         Left            =   -74664
         TabIndex        =   5
         Top             =   960
         Width           =   3708
      End
   End
End
Attribute VB_Name = "frmSetup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  Me.Visible = False
  SaveSetting App.Title, "System", "Tab", Me.MainTab.Tab
  Unload Me
End Sub

Private Sub Command3_Click()
  Me.Visible = False
  SaveSetting App.Title, "System", "Tab", Me.MainTab.Tab
  Unload Me
End Sub

Private Sub Form_Activate()
   'frmAutoPilot.Enabled = False
 
End Sub

Private Sub Form_Load()
  'frmAutoPilot.Enabled = False
  Me.Width = 1366 * Screen.TwipsPerPixelX * 1.2
  Me.Height = 768 * Screen.TwipsPerPixelY * 1.2
  Me.Left = 200
  Me.Top = 500
  SysLabel2(0).Caption = GetSetting(App.Title, "System", "GMT", 1)
  
End Sub

Private Sub Form_Resize()
  MainTab.Width = Me.Width
  MainTab.Height = Me.Height
  FrameAutoPilot.Width = Me.Width - 200
  FrameAutoPilot.Height = Me.Height - FrameAutoPilot.Top - 550
  Frame1.Width = Me.Width - 200
  Frame1.Height = Me.Height - Frame1.Top - 550
  Command3.Left = Me.Width - Command3.Width - 400
  Command1.Left = Me.Width - Command1.Width - 400
  Command3.Top = Me.Height - Command3.Height - 1250
  Command1.Top = Me.Height - Command1.Height - 1200
End Sub

Private Sub Form_Unload(Cancel As Integer)
  frmAutoPilot.Enabled = True
  frmAutoPilot.ZOrder
End Sub

Private Sub Label2_Click(Index As Integer)
  frmNumeric.lblfrom.Caption = "SETUP"
  frmNumeric.lblfrom.Tag = Index
  frmNumeric.Label1.Caption = Label1(Index).Caption
  frmNumeric.Text1.Text = Label2(Index).Caption
  frmNumeric.Text1.Tag = Label2(Index).Tag
  frmNumeric.Show
  
End Sub

Private Sub MultiPage1_Change()
 
End Sub

Private Sub Label4_Click(Index As Integer)
  Label4(Index).Caption = ""
  If Index = 1 Then
    AskforVariables = 1
  ElseIf Index = 2 Then
    AskforFactors = 1
  End If
End Sub

Private Sub SysLabel_Click(Index As Integer)
  If Index > 0 And Index < 17 Then
    If ShowValue = Index Then
      If Index = 1 Then
        SysLabel(1).Caption = "Port Engine RPM"
      ElseIf Index = 2 Then
        SysLabel(2).Caption = "Port Engine Oil"
      ElseIf Index = 3 Then
        SysLabel(3).Caption = "Port Engine Temp"
      ElseIf Index = 4 Then
        SysLabel(4).Caption = "Port Engine Alternator V"
      ElseIf Index = 5 Then
        SysLabel(5).Caption = "Port Engine Alternator A"
      ElseIf Index = 6 Then
        SysLabel(6).Caption = "Stb Engine RPM"
      ElseIf Index = 7 Then
        SysLabel(7).Caption = "Stb Engine Oil"
      ElseIf Index = 8 Then
        SysLabel(8).Caption = "Stb Engine Temp"
      ElseIf Index = 9 Then
        SysLabel(9).Caption = "Stb Engine Alternator V"
      ElseIf Index = 10 Then
        SysLabel(10).Caption = "Stb Engine Alternator A"
      ElseIf Index = 11 Then
        SysLabel(11).Caption = "Water"
      ElseIf Index = 12 Then
        SysLabel(12).Caption = "Diesel"
      ElseIf Index = 13 Then
        SysLabel(13).Caption = "Battery Volt"
      ElseIf Index = 14 Then
        SysLabel(14).Caption = "Battery Amp"
      ElseIf Index = 15 Then
        SysLabel(15).Caption = "Battery Cap"
      ElseIf Index = 16 Then
        SysLabel(16).Caption = "Battery SOC"
      End If
      SysLabel(Index).BorderStyle = 0
      ShowValue = 0
    ElseIf ShowValue = 0 Then
      ShowValue = Index
      SysLabel(Index).Caption = ""
      SysLabel(Index).BorderStyle = 1
    End If
  End If
End Sub

Private Sub SysLabel2_Click(Index As Integer)
  frmNumeric.lblfrom.Caption = "SYS"
  frmNumeric.lblfrom.Tag = Index
  frmNumeric.Label1.Caption = SysLabel(Index).Caption
  frmNumeric.Text1.Text = SysLabel2(Index).Caption
  frmNumeric.Show
End Sub
