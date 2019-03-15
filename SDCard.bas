InitSDCard:
If CardPresent = 1 Then                                          'SD Inserted...
  sdcardok=0
  Gbdriveerror = DriveInit()
  Print "Start of Card Analysis"
  Print "Last Drive-Error-Code = " ; Gbdriveerror
  Print "Gbdrivestatusreg =" ; Gbdrivestatusreg

  Select Case Mmcsd_cardtype
    Case 1
      Print "MMC-Card detected"
    Case 2
      Print "SD-Card Spec. 1.x detected"
    Case 4
      Print "SD-Card Spec. 2.0 detected"
    Case 12
      Print "SD-Card Spec. 2.0 High Capacity detected"
    Case Else
      Print "No Card detected"
  End Select

  Print "Init File System ... ";
  xi = Initfilesystem(1)                                ' Partition 1
  If Gbdriveerror = 0 Then
    If xi <> 0 Then
       Print "Error: " ; xi ; " at Init file system"
    Else
       sdcardok=1
       Print " OK"
       Print "Filesystem: " ; Gbfilesystem
       Print "FAT Start Sector: " ; Glfatfirstsector
       Print "Root Start Sector: " ; Glrootfirstsector
       Print "Data First Sector: " ; Gldatafirstsector
       Print "Max. Cluster Nummber: " ; Glmaxclusternumber
       Print "Sectors per Cluster: " ; Gbsectorspercluster
       Print "Root Entries: " ; Gwrootentries
       Print "Sectors per FAT: " ; Glsectorsperfat
       Print "Number of FATs: " ; Gbnumberoffats

       Print

    End If
  Else
     Print "Error during Drive Init: " ; Gbdriveerror
  End If
Else
  Print "No SD Card detected!"
End If

if sdcardok=0 then
   Cls
   Locate 1 , 1
   Lcd "SD Not responding"
   'print "NO SD Card!"
   Locate 2 , 1
   lcd "START? -> HOLD"
   'ALSO SEND TO OLED!!
   xi=100
   while holdbtn=1
      waitms 50
      decr xi
      if xi<0 then goto endinitSD
   wend
   while holdbtn=0
     waitms 50
   wend
end if
endinitSD:
return



OpenLog:
 filnavn=left(tiden,2)+mid(tiden,4,2)
 filnavn=filnavn+mid(tiden,7,2)
 filnavn=filnavn+mid(tiden,10,2)
 filnavn=filnavn+mid(tiden,13,2)
 filnavn=filnavn+mid(tiden,16,2)
 filnavn=filnavn+".log"
return


Writelog:
 if cardejected=1 then
    wait 3
    gosub initsdcard
    print "comming back"
    if sdcardok=0 then
      return
    End if
 End if
 cardejected=0
 if filnavn="" then gosub OpenLog
 Open filnavn For Append As #10
 print #10,tiden;",";gpsspeed;",";heading;",";Holding;",";coarsetohold;",";oc;",";lastoc;",";rt;",";",";rudder;",";lastrudder;",";Roll;",";working;",";pumptime;",";lastcorrection;",";turnedoff;",";Ruddercenter
 close #10
 print tiden;" ";gpsspeed;" ";gpsheading;" ";heading;" ";Holding;" ";coarsetohold;" ";oc;" ";lastoc;" ";rt;" ";bredde;" ";lengde;" ";rudder;" ";lastrudder;" ";Roll;",";working;",";pumptime;",";lastcorrection;",";ruddercenter
 'print gpsline
 return