'*********************Reads Gyro and calculates rolling average
Getgyro:
  X = Getadc(1)
  X = Gyrozero - X
  Gyrocount = Gyrocount + 1
  Gyrosum = Gyrosum + X
  X = Getadc(0)
  Gyrorol = X
Return

Function Map(X as integer, minx as integer, maxx as integer, miny as integer, maxy as integer) as integer
dim xm as double
dim ym as double
dim ml as long
dim xrange as integer
xrange=maxx-minx

ml=x*100

xm=ml/xrange

xrange=maxy-miny
ym=xrange*xm

x=miny+ym
map=x

end function