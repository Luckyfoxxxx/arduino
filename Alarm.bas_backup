
Dim GSMLine as string*100
Dim ErrCounter as integer
Dim Vent as integer


'********************************************************************
Deaktivert:
  'Leds for 220V og IRD skal vises, ON skal slukkes.
  '12V Led er direkte drevet av 12V Input
  'PumpLed er direkte drevet av Pump

'Check MainKey
  if onboard=0 and onroute=0 and onshore =0 then
    mainkey=0
  end if
  if onboard=1 then
    waitms 50
    if onboard=1 then
      mainkey=1
    end if
  elseif onroute=1 then
    waitms 50
    if onroute=1 then
      mainkey=2
    end if
  elseif onshore=1 then
    waitms 50
    if onshore=1 then
      mainkey=3
    end if
  end if

  if mainkey=1 or mainkey=2 then goto toppen

  If ischarwaiting(#2)>0 Then
    gosub readgps   'Also reading Compass
    gosub sendstatus
    print "Deaktivert. DayCounter=";Daycounter

    GPSflag=0
    'onled=0

    incr daycounter
    if daycounter>  86400 then
      daycounter=0
      'Dont send Routine SMS when deaktivated!
      'But keep the daycounter alive.
    End if


    if mainkey=0 then  'MainKey in OFF
     waitms 50
      If Mainkey=0 then
        incr oncounter
      end if
    else
      waitms 50
      if mainkey=1 or mainkey=2 then  'MainKey NOT in OFF
        oncounter=0
        goto toppen
      end if
    End if

    If oncounter>3 then
        outcounter=0
        oncounter=0
        goto WalkOut
    ENd if

    'Sekk om vi har kommunikasjon fra GSM
    if ischarwaiting (#1)>0 then  'PC
      get #1,Xb
      'print "Noe"
      if Xb<>10 then

        'print chr(Xb);
        print #6,chr(Xb);
        gsmline=gsmline+chr(Xb)
      else
        print #6,chr(13);
      End if
      if Xb=13 then
        print gsmline
        if left(gsmline,4)="CALL" then
          gsmline=""
          print #6,chr(13)
          waitms 200
        end if
        gsmline=""
      end if
    End if

    if ischarwaiting (#5)>0 then 'GSM
      get #5,Xb
      print chr(Xb);
    End if
  end if
 Goto Deaktivert


'***************************************************************************
WalkOut:
  'System is activated. Wait 30 sec before Alarms are transmitted
  If ischarwaiting(#2)>0 Then
    gosub readgps   'Also reading Compass
    gosub sendstatus
    print "Walkout Outcounter=";Outcounter
    GPSflag=0
    incr daycounter 'Keep daycounter alive
    incr outcounter
    if outcounter>60 then
      beeper=0
      incounter=0
      AktivertFlag=1
      PRINT "aKTIVERT"

      'Send SMS With Alarm Activated
      If sendsms("Alarm Aktivert",1)=1   then
      ENd if

      goto Aktivert
    end if
    toggle beeper
    Waitms 400
  End if
  if Onboard=1 or onroute=1 then
    waitms 50
    if Onboard=1 or onroute=1 then
      Outcounter=0
      beeper=0
      goto deaktivert
    End if
  End if

goto walkout


Aktivert:  '***********************************************************

  if onboard=1 or onroute=1 then
    waitms 50
    if onboard=1 or onroute=1 then
      pumpsent=0
      mainssent=0
      irdsent=0
      pumpflag=0
      mainsflag=0
      irdflag=0
      incounter=0
      goto deaktivert
    End if
  End if

  if ird=1 then
      waitms 50
      if ird=1 then
        irdflag=1
      end if
  else
      waitms 50
      if ird=0 then
        irdsent=0
      End if
  End if



  get #5,xb
  if xb>0 then 'GSM is Talking
      print "Something comming!"
      if waitfor("RING",8000)=1 then
        disable interrupts
           print "Ring detected"
           print #6,"ATA";chr(13);  'Answer incomming call
           if waitfor("OK",1000)=1 then
              for xi=1 to 10
                print #6,"AT+VTS=";xi;chr(13);
                if waitfor("OK",1000)=1 then
                end if
                waitms 300
              Next
              waitms 1000
              print #6,"ATH";chr(13)
              if waitfor("OK",1000)=1 then
                print "Hang UP"
              end if
           End if
        enable interrupts
      end if
  End if

  If ischarwaiting(#2)>0 Then
    gosub readgps   'Also reading Compass
    gosub sendstatus
    print "Aktivert. Daycounter=";Daycounter
    GPSFlag=0
    incr daycounter
    if daycounter>86400 then  'Send rutinemelding
      if incounter=0 then 'Do not send if alarm is activated
        daycounter=0
        if sendAlarm("Alt OK",1)=0 then
          GSMreset=0
          waitms 100
          GSMreset=1
          'goto Starten
        End if
      end if
    ENd if


    if mains=1 then
      waitms 50
      if mains=1 then
        mainsflag=1
      end if
    else
      waitms 500
      if mains=0 then
        if mainssent=1 then
          mainssent=0
          mainsflag=0
          if sendAlarm("Landstrom OK",1)=1 then
          end if
        else
          mainsflag=0
        end if
      end if
    end if

    if pump=1 then
      waitms 50
      if pump=1 then
        pumpflag=1
      end if
    else
      waitms 500
      if pump=0 then
        if pumpsent=1 then
          pumpsent=0
          pumpflag=0
          if sendAlarm("Lensepumpe OK",1)=1 then
          end if

        Else
          pumpflag=0
        end if
      End if
    end if
    Dim AlarmSent as integer
    if pumpflag=1 or mainsflag=1 or irdflag=1 then
      print "Some Flags ";incounter
      Sendit=0
      'print "Yepp something to send! ";pumpsent;" ";mainssent;" ";irdsent
      if pumpflag=1 and pumpsent=0 then
        sendit=1
        incounter=16
      end if
      if mainsflag=1 and mainssent=0 then
        sendit=1
        incounter=16
      end if
      if irdflag=1 and irdsent=0 then sendit=1
      if sendit=1 then
        incr incounter
        if incounter>15 then 'Now send the alarm
          alarmsent=0
          if sendAlarm("ALARM",1)=1 then
           alarmsent=1
          end if
          if sendAlarm("ALARM",2)=1 then
           alarmsent=1
          end if

          if alarmsent=1 then
            if pumpflag=1 then pumpsent=1
            if mainsflag=1 then mainssent=1
            if irdflag=1 then irdsent=1
            pumpflag=0
            mainsflag=0
            irdflag=0
            incounter=0
         end if
        end if
      ENd if
    End if
 End if
goto aktivert




function SendALARM(Byval Msg as string *20, Byval Number as byte) as byte
  disable interrupts
  FResult=0
  'First sjekk if Modem ready to send SMS
  print #6,"AT+CMGF=1";chr(13);

  if waitfor("OK",5000)=0 then
    'print "No 1"
    Goto NoArespons 'No Modem not responding
  End if

  'Set up to send SMS to ME
  print #6,"AT+CMGS=";
  print #6,chr(34);
  if number=1 then
   print #6,"90613522";
  else
   print #6,"92684042";
  end if
  print #6,chr(34);
  print #6, chr(13);

  if waitfor(">",5000)=0 then
    'print "No 2"

    Goto NoARespons 'NO Answer

  End if

  waitms 10

  Print #6,"White Bird Calling"

  print #6,msg

  if irdflag=1 and irdsent=0 then
     print #6, "Innbrudd";
  End if
  if mainsflag=1 and mainssent=0 then
     print #6, "Ingen Landstrom!";
  End if
  if pumpflag=1 and pumpsent=0 then
    print #6, "Lensepumpe aktivert";
  End if
  print #6,""

  Print #6,"Battery Volt=";'13.2V"
   xi=getadc(6)
   battvolt=xi/65.73
   print #6,battvolt;"V"

  waitms 10
  print #6, chr(26);
  if waitfor("OK",10000)=0 then
    'print "No 3"
    Goto NoArespons 'No Modem not responding
  else
    FResult=1
  end if
NoArespons:
  enable interrupts
  SendAlarm=Fresult
end function

end



getGSM:
 gsmline=""
 more:
 if Ischarwaiting(#5) > 0 then
     get #5,xb
     gsmline=gsmline+chr(Xb)
     if xb=10 then
       print gsmline
       return
     end if
 End if
 goto more
 return



'**********************************************************
GSMRestart:
  disable interrupts
  gsmreset=0
  waitms 100
  gsmreset=1
  Print "Cell Restart"
  enable Interrupts
return