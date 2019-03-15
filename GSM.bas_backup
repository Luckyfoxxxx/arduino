'Abonement Telipol 46296318


function SendSMS(Byval Msg as string *20, Byval Number as byte) as byte
  'OBS OBS: Tar IKKE norske karakterer som זרו!!!!
  dim Fresult as integer
'  disable interrupts
  FResult=0
  'First sjekk if Modem ready to send SMS
  call sendtogsm("AT+CMGF=1",1)
  if waitfor("OK",10000)=0 then
    'print "No 1"
    Goto Norespons 'No Modem not responding
  End if

  'Set up to send SMS to ME
  call sendtogsm("AT+CMGS=",0)
  print #6,chr(34);
  if number=1 then
   call sendtogsm("90613522",0)
  else
   call sendtogsm("92684042",0)
  end if
  print #6,chr(34);
  print #6, chr(13);

  if waitfor(">",10000)=0 then
    'print "No 2"

    Goto NoRespons 'NO Answer

  End if

  waitms 10

  call sendtogsm("White Bird Calling",1)

  call sendtogsm(msg,1)

  if irdflag=1 and irdsent=0 then
     call sendtogsm("Innbrudd",1)
  End if
  if mainsflag=1 and mainssent=0 then
     call sendtogsm("Ingen Landstrom!",1)
  End if
  if pumpflag=1 and pumpsent=0 then
    call sendtogsm("Lensepumpe aktivert",1)
  End if
  print #6,""

  call sendtogsm("Battery Volt=",0)'13.2V"
   xi=getadc(1)
   xs=xi/65.73
   call sendtogsm(fusing(xs,"#.##"),0)
   call sendtogsm("V",1)

  waitms 10
  print #6, chr(26);
  if waitfor("OK",1000000)=0 then
    'print "No 3"
    Goto Norespons 'No Modem not responding
  else
    FResult=1
  end if
Norespons:
  'enable interrupts
  SendSMS=Fresult
end function

function Waitfor(byval What as string*20,Byval MaksVent as Long) As Byte
 'disable interrupts
 'waitms 1
 FResult=0
 gsmlinje=""
 Zl=0
 yl=0
while instr(gsmlinje,What)=0 and zl<maksvent
   waitus 10
   incr zl

Wend
if zl<maksvent then fresult=1
EndWait:
print gsmlinje;"  Zl=";Zl
'enable interrupts
waitfor=Fresult
end function




sub sendtogsm(byval What as string*20, byval SendCR as byte)
  'disable interrupts
  'print "Sending ";What
  waitms 1
  for zi=1 to len(what)
    kar=mid(what,zi,1)
    'print kar
    print #6,  Kar;
    waitus 100
  next
  waitus 100
  if SendCR=1 then print #6,chr(13);
  'enable interrupts
end sub