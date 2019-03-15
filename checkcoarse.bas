
HoldHeading:

'Coarse computing and correcting is done once every second. (When GPS has transmitted).

'OC= degrees off coarse. When positive boat is starbord of coarse
'RT= Rate of turn        when positive boat is turning to starboard

'formula for mS  turning.
'Turn= oc*ocf-rt*rtf


'Positive XL indicates coarse is Stb of Hold.
OC=heading-coarsetohold
if OC<-1800 then OC=OC+3600
if OC>1800 then OC=OC-3600
'Positive OC betyr at kurs er styrbord
'OC=10 Er styrbord
'LastOC=10 'Var også styrbord. båten dreier ikke
'LastOC=20 'Var mer styrbord. båt dreier port
'LastOC=-10 'Var port. Båt dreier styrbord

RT=OC-LastOC
'Positiv RT betyr at båten dreier styrbord.

print "OC=";oc;" RT=";rt
'oc=oc-XL
'if lastoc>0 and oc>0 then
'   lastoc=oc
'   oc=-oc
'elseif
'   lastoc<0 and os>0 then
'   lastoc=oc
'   oc=-oc
'End if
dim rtt as long
rtt=abs(rt)
rtt=rtt*100
LastCorrection=0                  ''100ms =1560 ticks
  'Kursjustering må gjøres
  if OC>10 then  'Vi er for mye Stb!
    if RT>0 then 'Bare turn om kursdifferansen har øket
      Lastcorrection=1
      pumptime=oc*150
      pumptime=pumptime+rtt
      if lastturn=0 then
        pumptime=pumptime+700   'Rudderlag=40ms..
      End if
      if pumptime>6000 then pumptime=6000
      timer1=timermax-pumptime
      goport=1
      start timer1
      LastTurn=1
    else
      'Båt er styrbod, men dreier port
      if OC>0 and OC<50 then
        if RT<-10 then
          LastCorrection=2
          timer1=timermax-1500
          gostb=1
          start timer1
          lastturn=0
        end if
      end if
    end if
  end if
  if OC<-10 then  'Vi er for mye Port!
    if rt<0 then 'Bare turn om kursdifferansen har øket
      LastCorrection=3
      pumptime=abs(oc)*150
      pumptime=pumptime+rtt
      if lastturn=1 then
        pumptime=pumptime+700
      End if
      if pumptime>6000 then pumptime=6000
      timer1=timermax-pumptime
      gostb=1
      start timer1
      lastturn=0
    else
      if oc<-50 and oc<0 then
        LastCorrection=4
        timer1=timermax-1500
        goport=1
        start timer1
        lastturn=1
      end if
    end if
  End if

lastoc=oc
return




'FindNeutral:
'If rudder and coarse is stable for 10 readings (10 times RudderLag)
'we asume the rudder is in Neutral.
'This calculation is continous as Neutral can change depending on currents,
'wind and waves

'Adcin 4, rudder
'neutralno=neutralno+1
'if tmprudder=rudder then
'  if heading=ncoarse then
'    if neutralno=10 then
'      'Set new Rudder Neutral position
'      Write $32, rudder
'      RudderNeutral=Rudder
'      neutralno=0
'    Endif
'  else
'    ncoarse=heading
'    neutralno=0
'  endif
'else
'  tmprudder=rudder
'  neutralno=0
'endif

'return


'CenterRudder:
'Center rudder in closed loop
'adcin 4, Rudder
'b2=0
'tmprudder=rudder
'if rudder>RudderNeutral then  'Rudder goes from Stb min to Port Max
'  'Rudder is port
'  ledstb=1
'  gostb=1
'  hydvalve=1
'Else
'  'Rudder is Starboard
'  ledport=1
'  goport=1
'  hydvalve=1
'Endif
'while rudder<>RudderNeutral
'  clearwdt
'  pause 20
'  adcin 4, rudder
'  if rudder<>tmprudder then
'    tmprudder=rudder
'    b2=0
'  endif
'  if b2>20 then goto EndCenter 'Ror har ikke beveget seg på 400ms
'  b2=b2+1
'wend

'EndCenter:
'pause 200
'clearwdt
'adcin 4, rudder
'tmprudder=rudder

'b2=holding
'gosub alloff
'holding=b2
'Return