'-------------------------------------------------------------------------------
'                         Config_MMCSD_HC.BAS
'               Config File for MMC/SD/SDHC Flash Cards Driver
'        (c) 2003-2012 , MCS Electronics / V�gel Franz Josef
'-------------------------------------------------------------------------------
' Place MMCSD_HC.LIB in the LIB-Path of BASCOM-AVR installation
'
'Connection as following     for XMEGA the MMC is connected to PORTC
'MMC    M128/M103
'1      MMC_CS PORTB.0
'2      MOSI PORTB.2
'3      GND
'4      +3.3V
'5      CLOCK PORTB.1
'6      GND
'7      MISO, PORTB.3

' you can vary MMC_CS on HW-SPI and all pins on SOFT-SPI, check settings
' ========== Start of user definable range =====================================

' you can use HW-SPI of the AVR (recommended) or a driver build in Soft-SPI, if
' the HW-SPI of the AVR is occupied by an other SPI-Device with different settings

' Declare here you SPI-Mode
' using HW-SPI:     cMMC_Soft = 0
' not using HW_SPI: cMMC_Soft = 1

Const Cmmc_soft = 0

' --------- Start of Section for HW-SPI ----------------------------------------


' Chip Select Pin  => Pin 1 of MMC/SD
   Config Pinb.0 = Output
   Mmc_cs Alias Portb.0
   Set Mmc_cs

   Config Pinb.0 = Output                                   ' define here Pin of SPI SS
   Spi_ss Alias PortB.0
   Set Spi_ss                                               ' Set SPI-SS to Output and High por Proper work of




   ' MOSI - Pin  => Pin 2 of MMC/SD
   Config Pinb.2 = Output
   Set Portb.2
   Mmc_portmosi Alias Portb
   mmc_mosi Alias portb.2

   ' MISO - Pin  => Pin 7 of MMC/SD
   Config Pinb.3 = Input
   Mmc_portmiso Alias Pinb
   mmc_miso Alias portb.3
   'Portb.3 = 1                                              ' pull up

   ' SCK - Pin  => Pin 5 of MMC/SD
   Config Pinb.1 = Output
   Set Portb.1
   Mmc_portsck Alias Portb
   mmc_sck Alias portb.1




'define Chip-Select Pin
'Config Pinb.1 = Output                                   ' define here Pin for CS of MMC/SD Card
'Mmc_cs Alias Portb.1
'Set Mmc_cs
' Define here SS Pin of HW-SPI of the CPU (f.e. Pinb.0 on M128)
'config Pinb.0 = Output                                   ' define here Pin of SPI SS
'Spi_ss Alias Portb.0
'Set Spi_ss                                               ' Set SPI-SS to Output and High for Proper work of

'portb.3=1  'pull up on miso



' HW-SPI is configured to highest Speed
Config Spi = Hard , Interrupt = Off , Data Order = Msb , Master = Yes , Polarity = high , Phase = 1 , Clockrate = 16 , Noss = 1
'  Spsr = 1                                     ' Double speed on ATMega128
Spiinit



' ========== End of user definable range =======================================


'==== Variables For Application ================================================
 Dim MMCSD_CardType As Byte                                 ' Information about the type of the Card
'   0 can't init the Card
'   1 MMC
'   2 SDSC Spec. 1.x
'   4 SDSC Spec. 2.0 or later
'  12 SDHC Spec. 2.0 or later

Dim GbdriveError As Byte                                    ' General Driver Error register
' Values see Error-Codes
'===============================================================================



' ==== Variables for Debug =====================================================
' You can remove remarks(') if you want check this variables in your application
Dim GbdriveStatusReg As Byte                                ' Driver save here Card response
' Dim gbDriveErrorReg as Byte at GbdriveStatusReg overlay     '
' Dim gbDriveLastCommand as Byte                              ' Driver save here Last Command to Card
Dim Gbdrivedebug As Byte
' Dim MMCSD_Try As Byte                                        ' how often driver tried to initialized the card
'===============================================================================


'==== Driver internal variables ================================================
' You can remove remarks(') if you want check this variables in your application
' Dim _mmcsd_timer1 As Word
' Dim _mmcsd_timer2 As Word
'===============================================================================



' Error-Codes
Const cpErrDriveNotPresent = &HE0
Const cpErrDriveNotSupported = &HE1
Const cpErrDriveNotInitialized = &HE2

Const cpErrDriveCmdNotAccepted = &HE6
Const cpErrDriveNoData = &HE7

Const cpErrDriveInit1 = &HE9
Const cpErrDriveInit2 = &HEA
Const cpErrDriveInit3 = &HEB
Const cpErrDriveInit4 = &HEC
Const cpErrDriveInit5 = &HED
Const cpErrDriveInit6 = &HEE

Const cpErrDriveRead1 = &HF1
Const cpErrDriveRead2 = &HF2

Const cpErrDriveWrite1 = &HF5
Const cpErrDriveWrite2 = &HF6
Const cpErrDriveWrite3 = &HF7
Const cpErrDriveWrite4 = &HF8



$LIB "MMCSD_HC.LIB"
$EXTERNAL _MMC
' Init the Card
Gbdriveerror = DriveInit()


' you can remark/remove following two Code-lines, if you dont't use MMCSD_GetSize()
$EXTERNAL MMCSD_GetSize
Declare Function MMCSD_GetSize() as Long


' you can remark/remove following two Code-lines, if you dont't use MMCSD_GetCSD()
' write result of function to an array of 16 Bytes
$External MMCSD_GetCSD
Declare Function MMCSD_GetCSD() as Byte


' you can remark/remove following two Code-lines, if you dont't use MMCSD_GetCID()
' write result of function to an array of 16 Bytes
$External MMCSD_GetCID
Declare Function MMCSD_GetCID() as Byte


' you can remark/remove following two Code-lines, if you dont't use MMCSD_GetOCR()
' write result of function to an array of 4 Bytes
$External MMCSD_GetOCR
Declare Function MMCSD_GetOCR() as Byte


' you can remark/remove following two Code-lines, if you dont't use MMCSD_GetSDStat
' write result of function to an array of 64 Bytes
$External SD_GetSD_Status
Declare Function SD_GetSD_Status() as Byte

' check the usage of the above functions in the sample MMCSD_Analysis.bas
' check also the MMC and SD Specification for the content of the registers CSD, CID, OCR and SDStat
