
Encoder:

Config Porte.4 = Input
cha Alias Pine.4
Porte.4 = 1

Config PortL.6 = Input
chb Alias Pinl.6
Portl.6 = 1

config PORTB.7 =output
led alias portb.7


Config Int2 = Falling
Const Debouncetime = 1

Dim Wtime As Byte
Dim Encounter As Integer


On Int2 Getencoder

Cls

Wtime = 250
Encounter = 0

Enable Interrupts
Enable Int2

Do
 ' incr encounter
'  print encounter
  Waitms 250
  toggle led

  Waitms 250
  toggle led
Loop

print "huffhuff"
Getencoder:
 Waitms Debouncetime
  If Cha = 0 Then
    If Chb = 0 Then Incr Encounter Else Decr Encounter
    print "encounter: " ; Encounter ; "     "
  End If
  'Gifr = 64
Return