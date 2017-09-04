'mercator.bi 
Const MERCATOR_RANGE = 1500'256
Const myPI=ASin(1)*2
function degreesToRadians(deg As single)As single 
  return deg * (myPI / 180)
end Function
function radiansToDegrees(rad As single)As single 
  return rad / (myPI / 180)
end Function
dim shared as Single pixeloriginx=MERCATOR_RANGE / 2
dim shared as Single pixeloriginy=MERCATOR_RANGE / 2
dim shared as Single pixelsPerLonDegree = MERCATOR_RANGE / 360
dim shared as Single pixelsPerLonRadian = MERCATOR_RANGE / (2 * myPI)

dim shared as Single pointx=0,pointy=0,worldmx=0,worldmy=0,lat=0,lng=0
dim shared as Single pointx0=0,pointy0=0,worldmx0=0,worldmy0=0,lat0=0,lng0=0
Dim Shared As Integer zoom=11'13
sub MercatorLatLngtoPoint(lat As single,lng As single) 
  pointx = pixeloriginx + lng * pixelsPerLonDegree
  ' NOTE(appleton): Truncating to 0.9999 effectively limits latitude to
  ' 89.189.  This is about a third of a tile past the edge of the world tile.
  var siny=min(max(Sin(degreesToRadians(lat)),-0.9999),0.9999)
  pointy = pixeloriginy+0.5*log((1+siny)/(1-siny))*pixelsPerLonRadian  
end Sub
Dim Shared As Single srtmlat,srtmlng
sub MercatorLatLngtosrtmlatlng(lat As single,lng As single) 
	srtmlat=lat:srtmlng=lng:Exit Sub 
  Var pointx = pixeloriginx + lng * pixelsPerLonDegree
  ' NOTE(appleton): Truncating to 0.9999 effectively limits latitude to
  ' 89.189.  This is about a third of a tile past the edge of the world tile.
  var siny=min(max(Sin(degreesToRadians(lat)),-0.9999),0.9999)
  Var pointy = pixeloriginy+0.5*log((1+siny)/(1-siny))*pixelsPerLonRadian
  srtmlat=(pointy-pixeloriginy)*360/mercator_range
  srtmlng=(pointx-pixeloriginx)*360/mercator_range    
end Sub
Sub MercatorPointtoLatLng(pointx As single,pointy As single) 
  lng=(pointx-pixeloriginx)/pixelsPerLonDegree
  var latRadians = (pointy-pixeloriginy)/pixelsPerLonRadian
  lat=radiansToDegrees(2*atn(exp(latRadians))-myPI/2)
end Sub
'Sub MercatorPointtosrtmLatLng(pointx As single,pointy As single) 
'  srtmlat=(pointy-pixeloriginy)*360/mercator_range
'  srtmlng=(pointx-pixeloriginx)*360/mercator_range    
'End Sub
Sub MercatorsrtmlatlngtoLatLng(srtmlat As Single,srtmlng As single)
lng=srtmlng:lat=srtmlat:Exit Sub 
  lng=srtmlng'*(mercator_range/360)/pixelsPerLonDegree
  var latRadians = srtmlat*(mercator_range/360)/pixelsPerLonRadian
  lat=radiansToDegrees(2*atn(exp(latRadians))-myPI/2)
end Sub
Sub myMercatorPointtoLatLng(pointx As single,pointy As single) 
'MercatorPointtoLatLng(pointx,pointy):Exit Sub 
  'lng=(pointx-pixeloriginx)/pixelsPerLonDegree
  'lat=(pointy-pixeloriginy)/pixelsPerLonDegree
  'lng=(pointx-750)*(-157)/(96-750)'hawai lng-156.5 96 alexandrie 30->31N 878
  lng=33.15+(pointx-889.5)*(-157-33.15)/(96-889.5)
  lat=(pointy-755)*49/(953-755)'paris lat 49 crete 35.9N 25E chypre 35N 894 33.51->33.15E 889.5
  'lat=35+(pointy-894)*(0-35)/(760-894)
End Sub
Sub getlatlng(zoom As integer,worldmx As single,worldmy As single)
pointx = worldmx / (2^zoom)
pointy = worldmy / (2^zoom)
MercatorPointtoLatLng(pointx,pointy)
end Sub
Sub getworldmxy(zoom As Integer,lat As single,lng As single)
MercatorLatLngtoPoint(lat,lng)
worldmx=pointx*(2^zoom)
worldmy=pointy*(2^zoom)
End Sub







