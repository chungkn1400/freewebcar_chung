'libertystatue
dim shared as Single latm2=40.689249,lngm2=-74.0444999
Dim shared as Single libertystatuex=40.689249,libertystatuey=-74.0444999,libertystatuez=-9999:
'Eiffel Tower
latm2=48.85837:lngm2=2.2944810
Dim shared as single eiffeltowerx=48.85837,eiffeltowery=2.2944810,eiffeltowerz=-9999:
'Christ rio
latm2=-22.951916:lngm2=-43.210487
Dim shared as Single christriox=-22.951916,christrioy=-43.210487,christrioz=-9999:
'Dome of the Rock 
latm2=31.778019:lngm2=35.23540800
Dim shared as Single domerockx=31.778019,domerocky=35.23540800,domerockz=-9999:
'The Great Pyramid at Giza 
latm2=29.979234:lngm2=31.13420199
Dim shared as Single gizahx=29.979234,gizahy=31.13420199,gizahz=-9999:
'United States Capitol 
latm2=38.889939:lngm2=-77.00905
Dim shared as Single capitolex=38.889939,capitoley=-77.00905,capitolez=-9999:
'taj mahal
latm2=27.175015:lngm2=78.042155
'Dim shared as Single tajmahalx=40.689249,tajmahaly=-74.0444999',libertystatuez=-9999:
Dim shared as Single tajmahalx=27.175015,tajmahaly=78.042155,tajmahalz=-9999:
'hongkong Buddha
latm2=22.253985:lngm2=113.904984
Dim shared as single buddahx=22.253985,buddahy=113.904984,buddahz=-9999:
'trocadero
Dim shared as single trocaderox=48.8616,trocaderoy=2.2893,trocaderoz=-9999:
'triumph
Dim shared as single triumphx=48.8738,triumphy=2.2951,triumphz=-9999:
'assemblee
Dim shared as single assembleex=48.8602,assembleey=2.3211,asembleez=-9999:
'pantheon
Dim shared as single pantheonx=48.8463,pantheony=2.3462,pantheonz=-9999:
'notredame
Dim shared as single notredamex=48.853,notredamey=2.3499,notredamez=-9999:
'jussieu
Dim shared as single jussieux=48.846,jussieuy=2.3547,jussieuz=-9999:
'radio
Dim shared as single radiox=48.85236657119,radioy=2.278653585338,radioz=-9999:
'arche
Dim shared as single archex=48.8926,archey=2.2361,archez=-9999:
'cnit
Dim shared as single cnitx=48.8924,cnity=2.2391,cnitz=-9999:
'tennis roland garros
Dim Shared As Single tennisx=48.8295787,tennisy=2.198813,tennisz=-9999
'london tower bridge
Dim Shared As Single londonx=51.5054564,londony=-0.0753565,londonz=-9999
'stade de france
Dim Shared As Single stade2x=48.9245,stade2y=2.36034,stade2z=-9999
Dim Shared As Single klon=1,klon1=1
Function testworldobject(latx As single,lngx As Single)As Integer
If testworld=0 Then Return 0
'Var dlat=0.25*360/40000,dlon=dlat*klon
Var dlat=(0.1*360/40000)*0.8,dlon=dlat*klon
Var dlat2=(0.1*360/40000)*0.65,dlon2=dlat2*klon
If abs(latx-trocaderox)<dlat And abs(lngx-trocaderoy)<dlon then return 1 
if abs(latx-assembleex)<dlat And abs(lngx-assembleey)<dlon then return 1 
if abs(latx-triumphx)<dlat2 And abs(lngx-triumphy)<dlon2 then return 1 
If abs(latx-pantheonx)<dlat2 And abs(lngx-pantheony)<dlon2 then return 1 
If abs(latx-notredamex)<dlat And abs(lngx-notredamey)<dlon then return 1 
If abs(latx-jussieux)<dlat And abs(lngx-jussieuy)<dlon then return 1 
If abs(latx-radiox)<dlat And abs(lngx-radioy)<dlon then return 1 
If abs(latx-archex)<dlat*1.5 And abs(lngx-archey)<dlon*1.5 then return 1 
If abs(latx-cnitx)<dlat And abs(lngx-cnity)<dlon then return 1 
If abs(latx-libertystatuex)<dlat And abs(lngx-libertystatuey)<dlon then return 1 
If abs(latx-capitolex)<dlat And abs(lngx-capitoley)<dlon then return 1 
If abs(latx-christriox)<dlat And abs(lngx-christrioy)<dlon then return 1 
If abs(latx-buddahx)<dlat And abs(lngx-buddahy)<dlon then return 1 
If abs(latx-tajmahalx)<dlat And abs(lngx-tajmahaly)<dlon then return 1 
If abs(latx-tennisx)<dlat And abs(lngx-tennisy)<dlon then return 1 
If abs(latx-londonx)<dlat And abs(lngx-londony)<dlon then return 1 
If abs(latx-stade2x)<dlat*2 And abs(lngx-stade2y)<dlon*2 then return 1 
'If abs(latx-x)<dlat And abs(lngx-y)<dlon then return 1 
'If abs(latx-x)<dlat And abs(lngx-y)<dlon then return 1 
'libertystatue
latm2=40.689249:lngm2=-74.0444999
if abs(latx-latm2)<dlat And abs(lngx-lngm2)<dlon then return 1 ' libertystatuex=40.689249,libertystatuey=-74.0444999,libertystatuez=-9999:
'Eiffel Tower
latm2=48.85837:lngm2=2.2944810
if abs(latx-latm2)<dlat*1.2 and abs(lngx-lngm2)<dlon*1.2 then return 1 ' eiffeltowerx=48.85837,eiffeltowery=2.2944810,eiffeltowerz=-9999:
'Christ rio
latm2=-22.951916:lngm2=-43.210487
if abs(latx-latm2)<dlat and abs(lngx-lngm2)<dlon then return 1 ' christriox=-22.951916,christrioy=-43.210487,christrioz=-9999:
'Dome of the Rock 
latm2=31.778019:lngm2=35.23540800
if abs(latx-latm2)<dlat and abs(lngx-lngm2)<dlon then return 1 ' domerockx=31.778019,domerocky=35.23540800,domerockz=-9999:
'The Great Pyramid at Giza 
latm2=29.979234:lngm2=31.13420199
if abs(latx-latm2)<dlat*4 and abs(lngx-lngm2)<dlon*4 then return 1 ' gizahx=29.979234,gizahy=31.13420199,gizahz=-9999:
'United States Capitol 
latm2=38.889939:lngm2=-77.00905
if abs(latx-latm2)<dlat and abs(lngx-lngm2)<dlon then return 1 ' capitolex=38.889939,capitoley=-77.00905,capitolez=-9999:
'taj mahal
latm2=27.175015:lngm2=78.042155
if abs(latx-latm2)<dlat and abs(lngx-lngm2)<dlon then return 1 ' tajmahalx=27.175015,tajmahaly=78.042155,tajmahalz=-9999:
'hongkong Buddha
latm2=22.253985:lngm2=113.904984
if abs(latx-latm2)<dlat and abs(lngx-lngm2)<dlon then return 1 ' buddahx=22.253985,buddahy=113.904984,buddahz=-9999:
Return 0	
End Function
'Declare Sub latlngtomxy(latxx As single,lngxx As Single ,ByRef mxx As Single,ByRef myy As Single)
Declare Sub latlngtomxy2(latxx As single,lngxx As Single ,ByRef mxx As Single,ByRef myy As Single)
Declare Sub drawworldobjects()
Dim Shared As Integer tdrawworld=1,iworld=0
Dim Shared As Single iworldx(200),iworldy(200),iworldz(200)
'Sub updateworldobjects()
'	tdrawworld=0
'	drawworldobjects()
'	tdrawworld=1
'End Sub
Function getterrainheightsize(size As Single,x As Single,y As Single)As Single
	Var dx=size*kscalex/500
	Var z=getterrainheight(x-dx,y)
	z=min(z,getterrainheight(x-dx,y-dx))
	z=min(z,getterrainheight(x-dx,y+dx))
	z=min(z,getterrainheight(x,y-dx))
	z=min(z,getterrainheight(x,y+dx))
	z=min(z,getterrainheight(x+dx,y-dx))
	z=min(z,getterrainheight(x+dx,y))
	z=min(z,getterrainheight(x+dx,y+dx))
	Return z
End Function
Dim Shared As Single drawworldxweb,drawworldyweb
Sub drawworldobjects()
Dim As Single x,y,z,size,do1,kx,dx,dy,h,r,g,b,xx,xxx,yy,yyy,zz,zzz,dlat,dlon
var k500=500 
iworld=0
kx=kscalex/k500
dlat=30*360/40000:dlon=dlat*klon
tdrawworld=1
If Abs(xweb-drawworldxweb)+Abs(yweb-drawworldyweb)>0.001 Then
	tdrawworld=0:drawworldxweb=xweb:drawworldyweb=yweb
EndIf 	
If tdrawworld=0 Then dlat=999999:dlon=999999
glenable gl_texture_2d
gldisable gl_lighting
glcolor3f(1,1,1)
Var kscalexz=kscalex*1.25
	iworld+=1:if Abs(lat-libertystatuex)<dlat And Abs(lng-libertystatuey)<dlon Then
      latlngtomxy2(libertystatuex,libertystatuey,x,y)
      size=1500
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(libertystatuetext,"objects/town/libertystatue.jpg",250)
			glbindtexture(gl_texture_2d,libertystatuetext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			'glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			'glsphere(1000)
			gltexcarre2rot(920,1500,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
	iworld+=1:if Abs(lat-buddahx)<dlat And Abs(lng-buddahy)<dlon Then
      latlngtomxy2(buddahx,buddahy,x,y)
      size=1900
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(buddahtext,"objects/town/buddah.jpg",250)
			glbindtexture(gl_texture_2d,buddahtext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			'glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			'glsphere(1000)
			gltexcarre2rot(1900,1900,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
	iworld+=1:if Abs(lat-capitolex)<dlat*2 And Abs(lng-capitoley)<dlon*2 Then
      latlngtomxy2(capitolex,capitoley,x,y)
      size=4300
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(capitoletext,"objects/town/capitole.jpg",250)
			glbindtexture(gl_texture_2d,capitoletext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			'glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			'glsphere(1000)
			gltexcarre2rot(4300,4300,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
	iworld+=1:if Abs(lat-christriox)<dlat And Abs(lng-christrioy)<dlon Then
      latlngtomxy2(christriox,christrioy,x,y)
      size=1800
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(christriotext,"objects/town/christrio.jpg",250)
			glbindtexture(gl_texture_2d,christriotext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			'glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			'glsphere(1000)
			gltexcarre2rot(1150,1800,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
	iworld+=1:if Abs(lat-tajmahalx)<dlat*3 And Abs(lng-tajmahaly)<dlon*3 Then
      latlngtomxy2(tajmahalx,tajmahaly,x,y)
      size=3000
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex*1.5 Then
			myguiloadtexture(tajmahaltext,"objects/town/tajmahal.jpg",250)
			glbindtexture(gl_texture_2d,tajmahaltext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			'glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			'glsphere(1000)
			gltexcarre2rot(3000,3000,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
If 1 Then' worldname="israel" Then
	iworld+=1:if Abs(lat-gizahx)<dlat And Abs(lng-gizahy)<dlon Then'townname="lecaire" Then
      xx=-2548300*kscalex/k500:yy=-815900*kscalex/k500:do1=-15:size=300
      latlngtomxy2(gizahx,gizahy,x,y)
      xxx=x:yyy=y
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(gizeh0text,"objects/town/gizeh0.jpg")
			myguiloadlist(gizeh0list,"objects/town/gizeh0.obj",size)
			glbindtexture(gl_texture_2d,gizeh0text)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(gizeh0list)
			glpopmatrix
		EndIf
      x=-2555050*kscalex/k500-xx+xxx:y=-815200*kscalex/k500-yy+yyy:do1=0:size=5700
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(gizeh1text,"objects/town/gizeh1.jpg")
			myguiloadlist(gizeh1list,"objects/town/gizeh1.obj",size)
			glbindtexture(gl_texture_2d,gizeh1text)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(gizeh1list)
			glpopmatrix
		EndIf
      x=-2551600*kscalex/k500-xx+xxx:y=-811800*kscalex/k500-yy+yyy:do1=0:size=3390
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(gizeh2text,"objects/town/gizeh2.jpg")
			myguiloadlist(gizeh2list,"objects/town/gizeh2.obj",size)
			glbindtexture(gl_texture_2d,gizeh2text)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(gizeh2list)
			glpopmatrix
		EndIf
      x=-2557350*kscalex/k500-xx+xxx:y=-819000*kscalex/k500-yy+yyy:do1=0:size=9700
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(gizeh3text,"objects/town/gizeh3.jpg")
			myguiloadlist(gizeh3list,"objects/town/gizeh3.obj",size)
			glbindtexture(gl_texture_2d,gizeh3text)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(gizeh3list)
			glpopmatrix
		EndIf
	EndIf
	iworld+=1:if Abs(lat-domerockx)<dlat And Abs(lng-domerocky)<dlon Then'townname="jerusalem" Then
      'x=741620*kscalex/k500:y=500260*kscalex/k500:
      do1=-15:size=678
      latlngtomxy2(domerockx,domerocky,x,y)
      z=getterrainheightsize(size,x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(domerocktext,"objects/town/domerock.jpg")
			myguiloadlist(domerocklist,"objects/town/domerock.obj",size)
			glbindtexture(gl_texture_2d,domerocktext)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(domerocklist)
			glpopmatrix
		EndIf
	EndIf
EndIf 	
/'If worldname="westUS" Then
	If townname="sanfrancisco" Then
      x=-2289700*kscalex/k500:y=389800*kscalex/k500:do1=42:size=8500
      z=waterz-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(bridgetext,"objects/town/bridge_red.jpg",240)
			myguiloadtexture(bridgesidetext,"objects/town/bridgeside_red.jpg",230)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			drawbridge(size,bridgetext,bridgesidetext)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
EndIf 	
If worldname="°WestUSA" Then
	If townname="sanfrancisco" Then
      x=-7014900*kscalex/k500:y=8559800*kscalex/k500:do1=8:size=8500
      z=waterz-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(bridgetext,"objects/town/bridge_red.jpg",240)
			myguiloadtexture(bridgesidetext,"objects/town/bridgeside_red.jpg",230)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			drawbridge(size,bridgetext,bridgesidetext)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
EndIf '/ 	
'If 1 Then' worldname="france" Then
	/'If townname="deauville" Then
      x=341400*kscalex/k500:y=1885900*kscalex/k500:do1=-34:size=34000
      z=waterz-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(bridgetext,"objects/town/bridge_yellow.jpg",240)
			myguiloadtexture(bridgesidetext,"objects/town/bridgeside_yellow.jpg",230)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glscalef(0.5,1,0.5)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			drawbridge(size,bridgetext,bridgesidetext)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
	If townname="deauville" Then
      x=544560*kscalex/k500:y=1926100*kscalex/k500:do1=12:size=16400
      z=waterz-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(bridge2text,"objects/town/bridge_red.jpg",240)
			myguiloadtexture(bridgeside2text,"objects/town/bridgeside_red.jpg",230)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glscalef(0.6,1,0.6)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			drawbridge(size,bridge2text,bridgeside2text)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
	If townname="nice" Then
      x=2877520*kscalex/k500:y=-2718000*kscalex/k500:do1=33:size=630
      z=getterrainheight(x-dmx0,y-dmy0)
      drawgasstation(x,y,z,do1,size)
	EndIf 
	If townname="orly" Then
      x=1542000*kscalex/k500:y=1409230*kscalex/k500:do1=14:size=630
      z=getterrainheight(x-dmx0,y-dmy0)
      drawgasstation(x,y,z,do1,size)
	EndIf '/ 
	iworld+=1:if Abs(lat-eiffeltowerx)<dlat And Abs(lng-eiffeltowery)<dlon Then'townname="paris" Then
      /'If taddtownhouse2=0 Then 
       x=1553200:y=1489200:dx=200:dy=200:h=2400:do1=20:r=1:g=1:b=0.75
       addtownhouse2(x*kx-dmx0,y*kx-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
       x=1554600:y=1489500:dx=200:dy=200:h=2400:do1=20:r=1:g=1:b=0.75
       addtownhouse2(x*kx-dmx0,y*kx-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
       x=1555300:y=1490300:dx=180:dy=270:h=1900:do1=20:r=1:g=1:b=1
       addtownhouse2(x*kx-dmx0,y*kx-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
      
       x=1531300:y=1505630:do1=51:size=2050
       h=size/0.4:dx=size*0.1/0.6:dy=size*0.069/0.6:r=0.5:g=0.5:b=0.5
       addtownhouse2(x*kx-dmx0,y*kx-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
      EndIf 

      x=1506100*kscalex/k500:y=1495000*kscalex/k500:do1=-140:size=590
      z=getterrainheight(x-dmx0,y-dmy0)
      drawgasstation(x,y,z,do1,size)
      '/

      'xx=1518120*kscalex/k500:yy=1517250*kscalex/k500:
      do1=0:size=3100
      latlngtomxy2(eiffeltowerx,eiffeltowery,x,y)
      'xxx=x:yyy=y
      'x=mx+dmx0+10000:y=my+dmy0+10000
      z=getterrainheightsize(500,x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(eiffeltext,"objects/town/eiffel.jpg",245)
			myguiloadlist(eiffellist,"objects/town/eiffel.obj",size)
			glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glbindtexture(gl_texture_2d,eiffeltext)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			'glsphere 400
			glcalllist(eiffellist)
			glpopmatrix
			'glpushmatrix
			'gltranslatef(x-dmx0,y-dmy0,200)
			'glcolor3f(0,0,0)
			'glsphere 100
			'glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-triumphx)<dlat And Abs(lng-triumphy)<dlon Then
      'x=1518280*kscalex/k500-xx+xxx:y=1528830*kscalex/k500-yy+yyy:
      do1=63:size=630
      latlngtomxy2(triumphx,triumphy,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(triumphtext,"objects/town/triumph.jpg")
			myguiloadlist(triumphlist,"objects/town/triumph.obj",size)
			glbindtexture(gl_texture_2d,triumphtext)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(triumphlist)
			glpopmatrix
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-trocaderox)<dlat And Abs(lng-trocaderoy)<dlon Then
      'x=1514900*kscalex/k500-xx+xxx:y=1520330*kscalex/k500-yy+yyy:
      do1=47:size=1710
      latlngtomxy2(trocaderox,trocaderoy,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)-5
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-700) And x2<dxterrain*scalex Then
			myguiloadtexture(paris02text,"objects/town/paris02.jpg")
			myguiloadlist(trocaderolist,"objects/town/trocadero.obj",size)
			glbindtexture(gl_texture_2d,paris02text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcolor3f(0.8,0.8,0.8)
			glcalllist(trocaderolist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-assembleex)<dlat And Abs(lng-assembleey)<dlon Then
      'x=1529440*kscalex/k500-xx+xxx:y=1519760*kscalex/k500-yy+yyy:
      do1=17.5:size=580
      latlngtomxy2(assembleex,assembleey,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)+10
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-700) And x2<dxterrain*scalex Then
			myguiloadtexture(paris01text,"objects/town/paris01.jpg")
			myguiloadlist(assembleelist,"objects/town/assemblee.obj",size)
			glbindtexture(gl_texture_2d,paris01text)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			'glcolor3f(0.8,0.8,0.8)
			glcalllist(assembleelist)
			glpopmatrix
			'glcolor3f(1,1,1)
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-archex)<dlat And Abs(lng-archey)<dlon Then
      'x=1494400*kscalex/k500-xx+xxx:y=1549000*kscalex/k500-yy+yyy:
      do1=55:size=900
      latlngtomxy2(archex,archey,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris01text,"objects/town/paris01.jpg")
			myguiloadlist(archelist,"objects/town/archedefense.obj",size)
			glbindtexture(gl_texture_2d,paris01text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glcolor3f(0.85,0.85,0.85)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(archelist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-cnitx)<dlat And Abs(lng-cnity)<dlon Then
      'x=1497500*kscalex/k500-xx+xxx:y=1549080*kscalex/k500-yy+yyy:
      do1=-11:size=1100
      latlngtomxy2(cnitx,cnity,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)-40
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris03text,"objects/town/paris03.jpg")
			myguiloadlist(cnitlist,"objects/town/cnit.obj",size)
			glbindtexture(gl_texture_2d,paris03text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(cnitlist)
			glpopmatrix
		EndIf 	
		/'If taddtownhouse2=0 Then 
		 x+=2000*kx:y+=200*kx:size=1600:do1=-39
       h=size/0.4:dx=170/0.6:dy=170/0.6:r=0.5:g=0.75:b=1
       addtownhouse1(x-dmx0,y-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
		 Var co1=Cos(do1*degtorad),si1=Sin(do1*degtorad),x0=x,y0=y
		 x+=(-300*co1+300*si1)*kx:y+=(-300*si1-300*co1)*kx:size=1600*0.75:do1=-39
       h=size/0.4:dx=170/0.6:dy=170/0.6:r=0.5:g=0.75:b=1
       addtownhouse1(x-dmx0,y-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
		 x=x0:y=y0

 		 x-=2500*kx:y-=4500*kx:size=1800:do1=-39
       h=size/0.4:dx=250/0.6:dy=180/0.6:r=1:g=1:b=1
       addtownhouse2(x-dmx0,y-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
		 x0=x:y0=y
		 x+=(-900*co1+900*si1)*kx:y+=(-900*si1-900*co1)*kx
		 h=size*0.5/0.4:dx=150/0.6:dy=150/0.6:r=0.5:g=0.5:b=0.5
       addtownhouse1(x-dmx0,y-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
		 x+=(-300*co1+200*si1)*kx:y+=(-300*si1-200*co1)*kx
		 h=size*0.3/0.4:dx=200/0.6:dy=150/0.6:r=0.5:g=0.5:b=0.5
       addtownhouse1(x-dmx0,y-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
		 x=x0:y=y0 
		 x-=2200*kx:y+=1400*kx:size=1200:do1=-39
		 h=220/0.4:dx=size/0.6:dy=size*0.27/0.6:r=0.7:g=0.7:b=0.7
       addtownhouse2(x-dmx0,y-dmy0,dx*kx,dy*kx,h*kx,do1,r,g,b)
		EndIf
		'/ 
		/'rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcolor3f(0.5,0.75,1)
			drawbuilding1(size,170,170,1,x2,0.5,0.75,1)
			gltranslatef(-300,-300,0)
			glcolor3f(0.5,0.75,1)
			drawbuilding1(size*0.75,170,170,1,x2,0.5,0.75,1)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf 
		x-=2500:y-=4500:size=1800:do1=-39
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcolor3f(1,1,1)
			drawbuilding2(size,250,180,1,x2)
			gltranslatef(-900,-900,0)
			glcolor3f(0.5,0.5,0.5)
			drawbuilding1(size*0.5,150,150,1,x2,0.5,0.5,0.5)
			gltranslatef(-200,-150,0)
			drawbuilding1(size*0.3,200,150,1,x2,0.5,0.5,0.5)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf 
		x-=2200:y+=1400:size=1200:do1=-39
      z=getterrainheight(x-dmx0,y-dmy0)-70
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcolor3f(0.7,0.7,0.7)
			drawbuilding2(220,size,size*0.27,1,x2,0.7,0.7,0.7)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf '/
	EndIf 	
	iworld+=1:if Abs(lat-notredamex)<dlat And Abs(lng-notredamey)<dlon Then
      'x=1545080*kscalex/k500-xx+xxx:y=1513160*kscalex/k500-yy+yyy:
      do1=63:size=920
      latlngtomxy2(notredamex,notredamey,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)-30
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris02text,"objects/town/paris02.jpg")
			myguiloadlist(notredamelist,"objects/town/notredame.obj",size)
			glbindtexture(gl_texture_2d,paris02text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(notredamelist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-pantheonx)<dlat And Abs(lng-pantheony)<dlon Then
      'x=1542950*kscalex/k500-xx+xxx:y=1508400*kscalex/k500-yy+yyy:
      do1=-18:size=690
      latlngtomxy2(pantheonx,pantheony,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris01text,"objects/town/paris01.jpg")
			myguiloadlist(pantheonlist,"objects/town/pantheon_low.obj",size)
			glbindtexture(gl_texture_2d,paris01text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(pantheonlist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-jussieux)<dlat And Abs(lng-jussieuy)<dlon Then
      'x=1548270*kscalex/k500-xx+xxx:y=1509050*kscalex/k500-yy+yyy:
      do1=-5.5:size=1730
      latlngtomxy2(jussieux,jussieuy,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)-40
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris03text,"objects/town/paris03.jpg")
			myguiloadlist(jussieulist,"objects/town/jussieu.obj",size)
			glbindtexture(gl_texture_2d,paris03text)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glcolor3f(0.89,0.89,0.89)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(jussieulist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-radiox)<dlat And Abs(lng-radioy)<dlon Then
      'x=1510090*kscalex/k500-xx+xxx:y=1513080*kscalex/k500-yy+yyy:
      do1=-5:size=695
      latlngtomxy2(radiox,radioy,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris03text,"objects/town/paris03.jpg")
			myguiloadlist(radiolist,"objects/town/radio.obj",size)
			glbindtexture(gl_texture_2d,paris03text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			'glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(radiolist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
	EndIf 
	iworld+=1:if Abs(lat-tennisx)<dlat And Abs(lng-tennisy)<dlon Then
      'x=1510090*kscalex/k500-xx+xxx:y=1513080*kscalex/k500-yy+yyy:
      do1=110:size=1700
      latlngtomxy2(tennisx,tennisy,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)+90
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(tennistext,"objects/town/tennis.jpg")
			myguiloadlist(tennislist,"objects/town/tennis.obj",size)
			glbindtexture(gl_texture_2d,tennistext)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			'glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(tennislist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
	EndIf 	
	iworld+=1:if Abs(lat-stade2x)<dlat And Abs(lng-stade2y)<dlon Then
      'x=1510090*kscalex/k500-xx+xxx:y=1513080*kscalex/k500-yy+yyy:
      do1=90:size=3000
      latlngtomxy2(stade2x,stade2y,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(stade2text,"objects/town/stade2.jpg")
			myguiloadlist(stade2list,"objects/town/stade2.obj",size)
			glbindtexture(gl_texture_2d,stade2text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			'glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(stade2list)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
	EndIf 	
      /'x=1532900*kscalex/k500:y=1539800*kscalex/k500:do1=185:size=940
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris02text,"objects/town/paris02.jpg")
			myguiloadlist(sacrecoeurlist,"objects/town/sacrecoeur_low.obj",size)
			glbindtexture(gl_texture_2d,paris02text)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			'glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(sacrecoeurlist)
			glpopmatrix
			'glcolor3f(1,1,1)
		EndIf '/	
'If worldname="england" Then
	'If townname="londres" Then
	iworld+=1:if Abs(lat-londonx)<dlat And Abs(lng-londony)<dlon Then
      'x=2591760*kscalex/k500:y=-1900900*kscalex/k500:
      do1=-20:size=1850
      latlngtomxy2(londonx,londony,x,y)
      z=getterrainheight(x-dmx0,y-dmy0)+15
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if tdrawworld=1 and x2>(0.9*max(y2,z2)-size*kscalex/k500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(londontext,"objects/town/london.jpg")
			myguiloadlist(londonlist,"objects/town/london.obj",size)
			glbindtexture(gl_texture_2d,londontext)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/k500,kscalex/k500,kscalexz/k500)
			glcalllist(londonlist)
			glbindtexture(gl_texture_2d,boattext)
			gltranslatef(0,77,0)
			Var xx=size*0.09,yy=size*0.93,zz=size*0.065
			gltexquad(-xx,-yy,zz,-xx,-yy*1.34,-20,xx-23,-yy*1.34,-20,xx-23,-yy,zz)
			gltexquad(-xx,yy,zz,-xx,yy*1.34,-20,xx-23,yy*1.34,-20,xx-23,yy,zz)
			glpopmatrix
		EndIf
	EndIf
'EndIf 
End Sub
