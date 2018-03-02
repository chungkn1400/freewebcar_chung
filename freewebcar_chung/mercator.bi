'mercator.bi 
Const MERCATOR_RANGE = 1500'256
Const myPI=ASin(1)*2
#Define mysingle Double 
Function degreesToRadians(deg As mysingle)As mysingle 
  return deg * (myPI / 180)
end Function
function radiansToDegrees(rad As mysingle)As mysingle 
  return rad / (myPI / 180)
end Function
dim shared as mysingle pixeloriginx=MERCATOR_RANGE / 2
dim shared as mysingle pixeloriginy=MERCATOR_RANGE / 2
dim shared as mysingle pixelsPerLonDegree = MERCATOR_RANGE / 360
dim shared as mysingle pixelsPerLonRadian = MERCATOR_RANGE / (2 * myPI)

dim shared as mysingle pointx=0,pointy=0,worldmx=0,worldmy=0,lat=0,lng=0
dim shared as mysingle pointx0=0,pointy0=0,worldmx0=0,worldmy0=0,lat0=0,lng0=0
Dim Shared As Integer zoom=11'13
sub MercatorLatLngtoPoint(lat As mysingle,lng As mysingle) 
  pointx = pixeloriginx + lng * pixelsPerLonDegree
  ' NOTE(appleton): Truncating to 0.9999 effectively limits latitude to
  ' 89.189.  This is about a third of a tile past the edge of the world tile.
  var siny=min(max(Sin(degreesToRadians(lat)),-0.9999),0.9999)
  pointy = pixeloriginy+0.5*log((1+siny)/(1-siny))*pixelsPerLonRadian  
end Sub
Dim Shared As mysingle srtmlat,srtmlng
sub MercatorLatLngtosrtmlatlng(lat As mysingle,lng As mysingle) 
	srtmlat=lat:srtmlng=lng:Exit Sub 
  Var pointx = pixeloriginx + lng * pixelsPerLonDegree
  ' NOTE(appleton): Truncating to 0.9999 effectively limits latitude to
  ' 89.189.  This is about a third of a tile past the edge of the world tile.
  var siny=min(max(Sin(degreesToRadians(lat)),-0.9999),0.9999)
  Var pointy = pixeloriginy+0.5*log((1+siny)/(1-siny))*pixelsPerLonRadian
  srtmlat=(pointy-pixeloriginy)*360/mercator_range
  srtmlng=(pointx-pixeloriginx)*360/mercator_range    
end Sub
Sub MercatorPointtoLatLng(pointx As mysingle,pointy As mysingle) 
  lng=(pointx-pixeloriginx)/pixelsPerLonDegree
  var latRadians = (pointy-pixeloriginy)/pixelsPerLonRadian
  lat=radiansToDegrees(2*atn(exp(latRadians))-myPI/2)
end Sub
'Sub MercatorPointtosrtmLatLng(pointx As mysingle,pointy As mysingle) 
'  srtmlat=(pointy-pixeloriginy)*360/mercator_range
'  srtmlng=(pointx-pixeloriginx)*360/mercator_range    
'End Sub
Sub MercatorsrtmlatlngtoLatLng(srtmlat As mysingle,srtmlng As mysingle)
lng=srtmlng:lat=srtmlat:Exit Sub 
  lng=srtmlng'*(mercator_range/360)/pixelsPerLonDegree
  var latRadians = srtmlat*(mercator_range/360)/pixelsPerLonRadian
  lat=radiansToDegrees(2*atn(exp(latRadians))-myPI/2)
end Sub
Sub myMercatorPointtoLatLng(pointx As mysingle,pointy As mysingle) 
'MercatorPointtoLatLng(pointx,pointy):Exit Sub 
  'lng=(pointx-pixeloriginx)/pixelsPerLonDegree
  'lat=(pointy-pixeloriginy)/pixelsPerLonDegree
  'lng=(pointx-750)*(-157)/(96-750)'hawai lng-156.5 96 alexandrie 30->31N 878
  lng=33.15+(pointx-889.5)*(-157-33.15)/(96-889.5)
  lat=(pointy-755)*49/(953-755)'paris lat 49 crete 35.9N 25E chypre 35N 894 33.51->33.15E 889.5
  'lat=35+(pointy-894)*(0-35)/(760-894)
End Sub
Sub getlatlng(zoom As integer,worldmx As mysingle,worldmy As mysingle)
pointx = worldmx / (2^zoom)
pointy = worldmy / (2^zoom)
MercatorPointtoLatLng(pointx,pointy)
end Sub
Sub getworldmxy(zoom As Integer,lat As mysingle,lng As mysingle)
MercatorLatLngtoPoint(lat,lng)
worldmx=pointx*(2^zoom)
worldmy=pointy*(2^zoom)
End Sub
' http://quasar.as.utexas.edu/BillInfo/JulianDatesG.html

declare function JulianDayNumber(byval year as integer, byval month as integer, byval day as integer) as double
declare sub ConvertJulianDayNumber(byref jdn as const double, byref year as integer, byref month as integer, byref day as integer)

#define check(what) guinotice Str(cbool((what)))
Sub testjulian()
'check(JulianDayNumber(1582, 10, 15) = 2299160.5)

dim as integer y, m, d
ConvertJulianDayNumber(2299160.5, y, m, d)
'check((y = 1582) and (m = 10) and (d = 15))
End Sub 
'testjulian()
function JulianDayNumber(byval Year as integer, byval Month as integer, byval Day as integer) as double
' Calculates the Julian Day Number of any date given on the Gregorian Calendar.
' The Julian Day Number so calculated will be for 0 hours, GMT, on that date.
 
  if Month <= 2 then
    Year -= 1
    Month += 12
  end if
 
  var A = Year \ 100
  var B = A \ 4
  var C = 2 - A + B
  var E = Int(365.25 * (year + 4716))
  var F = Int(30.6001 * (month + 1))
 
  return C + day + E + F - 1524.5
end function

sub ConvertJulianDayNumber(byref jdn as const double, byref year as integer, byref month as integer, byref day as integer)
' Converts a Julian Day Number to a Gregorian date, assume that it is for 0 hours, Greenwich time.
 
  var Q = jdn + 0.5
  var Z = Int(Q)
  var W = Int((Z - 1867216.25) / 36524.25)
  var X = W \ 4
  var A = Z + 1 + W - X
  var B = A + 1524
  var C = Int((B - 122.1) / 365.25)
  var D = Int(365.25 * C)
  var E = Int((B - D) / 30.6001)
  var F = Int(30.6001 * E)
 
  day = Int(B - D - F + (Q - Z))
  month = IIf(E <= 13, E - 1, E - 13)
  year = IIf(month <= 2, C - 4715, C - 4716)
end sub

#include "vbcompat.bi"
Dim Shared As Double moonlng,moonhour
Function getmoonlng()As Double
Var moonperiod=29.530588
Var newmoon0=JulianDayNumber(2017,01,28)+0/24.0+7/(24.0*60)'2017 Jan 28  00:07
Var jjj=juliandaynumber(Year(Now),Month(Now),Day(Now))+Hour(Now)/24.0+Minute(Now)/(24.0*60)
moonlng=360*(jjj-newmoon0)/moonperiod-360*(Hour(Now)/24.0+Minute(Now)/(24.0*60))
While moonlng>180:moonlng-=360:Wend
While moonlng<-180:moonlng+=360:Wend
Return moonlng    	
End Function
Function getmoonhour(thour As mysingle)As Double
moonhour=24*(lng-getmoonlng())/360.0+12+thour
While moonhour>24:moonhour-=24:Wend
While moonhour<0:moonhour+=24:Wend 
Return moonhour	
End Function
'guinotice Str(getmoonlng)+"  "+Str(Getmoonhour)




















