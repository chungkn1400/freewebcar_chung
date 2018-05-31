Dim Shared As String srtmfile,srtmfolder
Dim Shared As Single lat5,lng5,lat50,lng50
function getsrtmfile(lat1 As single,lng1 As single)As String 
If(lat1<-87 or lat1>87 or lng1<-177 Or lng1>177) Then return ""  
lat5=-90+5*Int((lat1+90.0)/5) 
lng5=-180+5*Int((lng1+180.0)/5) 
if(lng5<=0) Then
  srtmfile="lngW"+Str(0-lng5)  
Else
  srtmfile="lngE"+str(lng5)
EndIf     
if(lat5>=0) Then
  srtmfile+="latN"+Str(lat5)  
Else
  srtmfile+="latS"+Str(0-lat5)
EndIf     
lat50=-60+50*Int((lat1+110.0)/50) 
lng50=-180+40*Int((lng1+180.0)/40) 
if(lng50<=0) Then
  srtmfolder="w"+Str(0-lng50)  
Else
  srtmfolder="e"+Str(lng50)
EndIf     
if(lat50>=0) Then
  srtmfolder+="n"+Str(lat50)  
Else
  srtmfolder+="s"+Str(0-lat50)
EndIf       
srtmfile=srtmfolder+"/"+srtmfile+".js" 
Return srtmfile 
End Function 
Dim Shared As integer val62(256)
Dim Shared As ZString*256  abcd62="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" 
'Dim Shared As String abc:abc="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
'Dim Shared As String abcd64(64)'from srtm.bas
'For i=0 To 61
'	abcd64(i)=Mid(abc,i+1,1)
'Next
For i=0 To 256
	val62(i)=0
Next
For i=0 To 62-1
	val62(abcd62[i])=i   
Next
Dim Shared As ZString*4000000 srtmtext
Dim Shared As Integer isrtm,toksrtm=1
Dim Shared As String srtmfiles(4),msgsrtm
Dim Shared As Single srtmlati(4),srtmlngi(4),srtmdata(4,610,610)
Dim Shared As Integer tloadwebtext2=0
Sub formatsrtmdata(ii As Integer)
Exit Sub 	
Dim As Integer i,j,k
Dim As Single x,xx,xxx
For i=0 To 600-1
	For j=0 To 600-1
		xx=x
		x=srtmdata(ii,i,j)
		If Abs(xx-x)>100 Then
			x=(xx+srtmdata(ii,i,j+1))*0.5
			srtmdata(ii,i,j)=x
			'auxvar+=1:auxtest=0.2
		EndIf
	Next
Next
For j=0 To 600-1
	For i=0 To 600-1
		xx=x
		x=srtmdata(ii,i,j)
		If Abs(xx-x)>100 Then
			x=(xx+srtmdata(ii,i+1,j))*0.5
			srtmdata(ii,i,j)=x
			'auxvar2+=1:auxtest=0.2
		EndIf
	Next
Next
End Sub
Function loadwebsrtmtext(fic As String)As Integer 
Dim As Integer i
i=InStr(fic,"/srtm/")
Var fic1=fic'Mid(fic,i+6)	
'folderdrive="https://chungkn1400.github.io/mysrtm/srtm/";'e20n40/lngE20latN0.js
Var hostname="https://chungkn1400.github.io"
Var path="mysrtm/srtm/"+fic1
'guinotice path
Var idata=httppost(hostname,path)
   idata=min2(idata,4000000-2)
   For i=0 To idata-1
   	srtmtext[i]=recvdata(i)
   Next
   srtmtext[idata]=0
   'guinotice "length="+Str(Len(srtmtext))+"/"+Str(idata) 
   'guinotice Left(srtmtext,400)+"/"+Str(recvdata(100))
Return idata 
End Function 
Dim Shared As String srtmfolder0
Dim Shared As Integer srtmlock
Sub getsrtmlock()
Dim As Integer i 
For i=1 To 4000
	If srtmlock=0 Then srtmlock=1:Exit Sub
	If quit=1 Then Exit Sub 
	Sleep 2
Next
End Sub
Sub getsrtmlock2()
Dim As Integer i 
For i=1 To 4000
	If srtmlock=0 Then srtmlock=1:Exit Sub
	If quit=1 Then Exit Sub 
	Sleep 2
Next
End Sub
Sub freesrtmlock()
	srtmlock=0
End Sub
Sub loadsrtmfile(fic As String,ii As integer)
Dim As Integer file,i
Dim As String fic1
If toksrtm=1 Then
	srtmfolder0=ExePath+"/srtm/"
	If FileExists(srtmfolder0+fic)=0 Then
		srtmfolder0="C:/SRTM/srtm/"
		If FileExists(srtmfolder0+fic)=0 Then
			srtmfolder0="D:/SRTM/srtm/"
			If FileExists(srtmfolder0+fic)=0 Then
				toksrtm=3':Exit Sub 
			EndIf
		EndIf
	EndIf
EndIf
If toksrtm=3 Then
	If loadwebsrtmtext(fic)<300 Then
		toksrtm=0
	Else 
		If auxtest>-0.2 Then msgsrtm="loaded SRTM"
	EndIf
EndIf
If toksrtm=1 Or toksrtm=2 Then 
 fic1=srtmfolder0+fic
 If FileExists(fic1)=0 Then
	If toksrtm=2 Then msgsrtm="SRTM file not found"
	toksrtm=0
	Exit Sub
 Else
	msgsrtm="loading SRTM file"
	toksrtm=2
 EndIf 
EndIf
If toksrtm=2 Then 
 file=freefile
 Open fic1 For Binary Access Read As #file
 Get #file,,srtmtext
 Close #file
EndIf  
'guinotice Str(Len(srtmtext)) 
getsrtmlock()
 var j=0,k=0,l=0,kl=0,n=0,p=0,x=0,ix=0,ixmax=601,jx=0 
 var jmax=Len(srtmtext)-3'="data" 
 j=InStr(srtmtext,"""")
 Var xmin=99999,xmax=-99999,x0=0 
 while(j<jmax And ix<ixmax) 
	'if(x>auxvar) Then auxvar=x  
	if(jx>=600) Then
		jx=0:x=0:ix+=1
		x0=x
		If ix>=ixmax Then Exit While    
	EndIf
   k=val62((srtmtext[j])):j+=1 
	l=val62((srtmtext[j])):j+=1 
   kl=(k-30)*60+l 
	if(kl=0) then 
     k=val62((srtmtext[j])):j+=1 
	  l=val62((srtmtext[j])):j+=1 
	  kl=(k-30)*60+l 
	  For n=0 To kl-1 
    	  srtmdata(ii,ix,jx)=x0
    	  jx+=1
    	  If jx>=600 Then
    	  	jx=0:x=0:ix+=1
    	  	x0=x
    	  	If ix>=ixmax Then Exit While
    	  EndIf
	  Next n	   
   Else
     x+=kl:If Abs(x)<20000 Then x0=x
     srtmdata(ii,ix,jx)=x0 
	  jx+=1
     If jx>=600 Then
     	jx=0:x=0:ix+=1
     	x0=x
     	If ix>=ixmax Then Exit While 
     EndIf
	EndIf
	If x0<xmin Then xmin=x0
	If x0>xmax Then xmax=x0
 Wend 
 formatsrtmdata(ii)
 'guinotice "ix="+Str(ix)+" jx="+Str(jx)+" min="+Str(xmin)+" max="+Str(xmax)+"/"+Str(600*600) 	
 freesrtmlock()
End Sub
'guinotice getsrtmfile(49,0)
'loadwebsrtmtext(srtmfile)
'If FileExists(srtmfile) Then guinotice "ok"
'loadsrtmfile(srtmfile,1)
Dim Shared As Double ttestloadsrtm=0 
Sub resetsrtm()
Dim As Integer i  
For i=0 To 3
	srtmfiles(i)=""
	srtmlati(i)=-89
	srtmlngi(i)=-179
Next
End Sub
Sub testloadsrtmfile(lat1 As single,lng1 As Single)
  srtmfile=getsrtmfile(lat1,lng1) 
  if(srtmfile="") Then Exit Sub
  Dim As Integer i,j,k  
  For i=0 To 3
  	 If(srtmfiles(i)=srtmfile) then Exit Sub   
  Next
  var distsrtm=0 
  For i=0 To 3 
    var dist=(abs(lat1-srtmlati(i))+abs(lng1-srtmlngi(i))) 
    if(dist>distsrtm) then isrtm=i:distsrtm=dist  
  Next i 
  srtmfiles(isrtm)=srtmfile  
  srtmlati(isrtm)=lat5+2.5 
  srtmlngi(isrtm)=lng5+2.5'+1000 
  /'var worldx0=worldx,worldy0=worldy 
  /*getworldxy(zoom,lat5,lng5) 
  srtmxmin(isrtm)=-worldx 
  srtmymin(isrtm)=-worldy 
  getworldxy(zoom,lat5+5,lng5+5) 
  srtmxmax(isrtm)=-worldx //alert(worldx-srtmxmin(isrtm)) 
  srtmymax(isrtm)=-worldy //alert(worldy-srtmymin(isrtm)) 
  worldx=worldx0 worldy=worldy0 
  */
  //getworldxy(zoom,lat5+0.1,lng5-0.1) '/ 
  loadsrtmfile(srtmfile,isrtm) 
  'guinotice "isrtm="+Str(isrtm)+" "+Str(srtmlati(isrtm))+" "+Str(srtmlngi(isrtm))
End Sub
Sub testloadsrtm() 
If(Timer<ttestloadsrtm) Then Exit Sub  
ttestloadsrtm=Timer+8  
'guinotice "testsrtm"
var dx=0.2
MercatorLatLngtosrtmlatlng(lat,lng)
'guinotice Str(srtmlat)+" "+Str(srtmlng) 
testloadsrtmfile(srtmlat-dx,srtmlng-dx)  
testloadsrtmfile(srtmlat-dx,srtmlng+dx)  
testloadsrtmfile(srtmlat+dx,srtmlng+dx)  
testloadsrtmfile(srtmlat+dx,srtmlng-dx)  
End Sub
'lat=49:lng=0
'testloadsrtm()
Dim Shared As Integer testhsrtm=0
function getsrtmheight(laty As single,lngx As single)As single 
	'var wx=worldx+(px-xmaxmin2)*scaletexture*10 
	'var wy=worldy+(py-ymaxmin2)*scaletexture*10 
Dim As Integer i,j,k,ii,jj	
	testhsrtm=0
	jj=-1 
	for ii=0 To 3 
	  if(Abs(lngx-srtmlngi(ii))<2.50001) then 
	   if(abs(laty-srtmlati(ii))<2.50001) Then 
	     jj=ii:Exit For
	   EndIf
	  EndIf 
	Next ii  
	if(jj<0) Then return -0.5
	testhsrtm=1    
	'var nny=0.00001+599.999*(lngx-srtmlngi(jj)+2.5)/5 
	'var nnx=0.00001+599.999*(laty-srtmlati(jj)+2.5)/5 
	var nny=0.00001+599.9999*(lngx-srtmlngi(jj)+2.5)/5 
	var nnx=0.00001+599.9999*(laty-srtmlati(jj)+2.5)/5 
	nnx=599.5-nnx
	nny-=0.5 
	'nnx=599.99991-nnx-0.5 
	'nny-=0.5 
	'if(nnx>=600) then nnx=600-1   
	'if(nny>=600) then nny=600-1   
	if(nnx<0.00001) then nnx=0.00001   
	if(nny<0.00001) then nny=0.00001   
	i=Int(nnx):j=Int(nny) 
	var dx=nnx-i,dy=nny-j 
	var i1=i+1,j1=j+1 
	if(i1>=600) then i1=600-1   
	if(j1>=600) then j1=600-1   
	'var h=srtmdata  (jj)[i*ndata+j]  
	'return h 
	'guinotice Str(i)+"  "+Str(j)
    var z00=srtmdata(jj,i,j) 
    var z10=srtmdata(jj,i1,j) 
    var z01=srtmdata(jj,i,j1) 
    var z11=srtmdata(jj,i1,j1) 
'return (1-dx)*(1-dy)*(z00)+(1-dx)*dy*(z01)+dx*(1-dy)*z10+dx*dy*z11 
If dx<=(1.0-dy) Then 
    Return ( dx*(z10-z00) +dy*(z01-z00) +z00)
Else 
    Return ( (1-dx)*(z01-z11) +(1-dy)*(z10-z11) +z11 )
EndIf 
End Function
function getsrtmheightfast(laty As single,lngx As single)As single 
	'var wx=worldx+(px-xmaxmin2)*scaletexture*10 
	'var wy=worldy+(py-ymaxmin2)*scaletexture*10 
Dim As Integer i,j,k,ii,jj	
	testhsrtm=0
	jj=-1 
	for ii=0 To 3 
	  if(Abs(lngx-srtmlngi(ii))<2.5001) then 
	   if(abs(laty-srtmlati(ii))<2.5001) Then 
	     jj=ii:Exit For
	   EndIf
	  EndIf 
	Next ii  
	if(jj<0) Then return -0.5
	testhsrtm=1    
	var nny=0.00001+599.999*(lngx-srtmlngi(jj)+2.5)/5 
	var nnx=0.00001+599.999*(laty-srtmlati(jj)+2.5)/5 
	nnx=599.5-nnx 
	nny-=0.5 
	'if(nnx>=600) then nnx=600-1   
	'if(nny>=600) then nny=600-1   
	if(nnx<0.00001) then nnx=0.00001   
	if(nny<0.00001) then nny=0.00001   
	'i=Int(nnx):j=Int(nny) 
   Return srtmdata(jj,Int(nnx),Int(nny)) 
End Function
'MercatorLatLngtosrtmlatlng(49,0.2)
'guinotice Str(getsrtmheight(srtmlat,srtmlng))
Dim Shared As Single klonlati(-90000 To 90000)
For i=-89901 To 89901
	Var lati=i/1000.0
	Var degtorad=ASin(1)/90
	klonlati(i)=1/Cos(lati*degtorad)
Next
Function klonlat(latx As Single)As Single
	Var lati=Int(max(-89900.0,min(89900.0,latx*1000.0)))
	Return klonlati(lati)
End Function
