
Holdcoarse:

'Coarse computing and correcting is done once every Rudderlag timeframe.
'Trend is the last timeframe relative coarse shift.
'0 to 99 is 0 to 9.9 encreasing degrees shift,
   'And will require Port rudder compensation
'100 to 200 is 0 to 9.9 decreasing degrees shift,   
   'And will require a Starboard rudder compensation.

'Finn først ut hvor mye vi avviker fra kursen.

'Sjekk om Heading +-5 er innenfor LastHeading
GP=0
GS=0
if heading >coarsetohold  then 'Dreier styrbord, om det ikke er Port gjennom 0
   if heading-coarsetohold>1800 then 'Joda det er port gjennom 0
     GS= coarsetohold +3600-heading 'Port
   else
     GP= heading-coarsetohold  'Stb
   endif
ENdif 
if coarsetohold>heading then 'Dreier Port, om ikke mor Stb gjennom 0
   if coarsetohold-heading>1800 then 'Joda det er Stb gjennom 0
     GP= heading +3600 -coarsetohold 'Stb
   else
     GS= coarsetohold-heading 'Port
   endif
endif

  'Kursjustering må gjøres
  if GS>0 then 
    'Turn mot Stb
    if GS>Lastgs then 'Bare turn om kursdifferansen har øket
      turning =rudderneutral+10
      hydvalve=1
      
      gostb=1
      ledstb=1
      if lastturn=0 then
        pause 50
      Endif 
      pause 150
      gostb=0
      ledstb=0
      hydvalve=0
      'gosub turnstarboard
      pause 200
      clearwdt
      adcin 4, rudder
      tmprudder=rudder
      LastTurn=1
      Hendelse=5
      Gosub Logg
      'gosub centerrudder
    else
      if gs<5 then
        hydvalve=1
        goport=1
        ledport=1
        pause 100
        hydvalve=0
        goport=0
        LEDPORT=0
        pause 100
        adcin 4, rudder
        tmprudder=rudder
        lastturn=0
        hendelse=24
        gosub logg
      endif 
    endif
  endif
  if gp>0 then 
    turning=rudderneutral-10
    'gosub turnport
    'pause 1000
    if gp>lastGP then 'Bare turn om kursdifferansen har øket
      hydvalve=1
      goport=1
      ledport=1
      if lastturn=1 then
        pause 50
      endif 
      pause 150
      goport=0
      ledport=0
      hydvalve=0
      pause 200
      clearwdt
      adcin 4, rudder
      tmprudder=rudder
      lastturn=0
      hendelse=4
      gosub logg
    else
      if gp<5 then 
        hydvalve=1
        gostb=1
        ledstb=1
        pause 100
        gostb=0
        HYDVALVE=0
        ledstb=0
        pause 100
        adcin 4, rudder
        tmprudder=rudder
        lastturn=1
        hendelse=25
        gosub logg
      endif
    endif
    'gosub centerrudder
  Endif   

lastGP=GP
LastGS=GS 
if lastgp>0 then lastgs=0
if lASTGS>0 then lastgp=0
return



   
FindNeutral:
'If rudder and coarse is stable for 10 readings (10 times RudderLag)
'we asume the rudder is in Neutral.
'This calculation is continous as Neutral can change depending on currents, 
'wind and waves   

Adcin 4, rudder  
neutralno=neutralno+1
if tmprudder=rudder then
  if heading=ncoarse then
    if neutralno=10 then
      'Set new Rudder Neutral position
      Write $32, rudder
      RudderNeutral=Rudder
      neutralno=0 
    Endif 
  else
    ncoarse=heading
    neutralno=0
  endif
else
  tmprudder=rudder
  neutralno=0 
endif

return


CenterRudder:
'Center rudder in closed loop
adcin 4, Rudder
b2=0
tmprudder=rudder
if rudder>RudderNeutral then  'Rudder goes from Stb min to Port Max
  'Rudder is port
  ledstb=1
  gostb=1
  hydvalve=1
Else
  'Rudder is Starboard
  ledport=1
  goport=1
  hydvalve=1
Endif 
while rudder<>RudderNeutral
  clearwdt
  pause 20
  adcin 4, rudder
  if rudder<>tmprudder then
    tmprudder=rudder
    b2=0
  endif
  if b2>20 then goto EndCenter 'Ror har ikke beveget seg på 400ms
  b2=b2+1 
wend

EndCenter:
pause 200
clearwdt
adcin 4, rudder
tmprudder=rudder

b2=holding
gosub alloff
holding=b2
Return 
