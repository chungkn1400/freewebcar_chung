Dim Shared As uint gizeh0text,gizeh1text,gizeh2text,gizeh3text
Dim Shared As uint gizeh0list,gizeh1list,gizeh2list,gizeh3list
Dim Shared As uint domerocktext,domerocklist,bridgetext,bridgesidetext
Dim Shared As uint bridge2text,bridgeside2text,bridgeredtext,bridgeredsidetext,bridgeyellowtext,bridgeyellowsidetext
Dim Shared As uint eiffeltext,eiffellist,triumphtext,triumphlist
Dim Shared As uint londontext,londonlist,paris01text,paris02text,paris03text
Dim Shared As uint archelist,notredamelist,pantheonlist,radiolist,cnitlist
Dim Shared As uint jussieulist,trocaderolist,assembleelist
Dim Shared As uint gasstationtext,gasstationlist,gasstation2list,tennistext,tennislist,stade2text,stade2list
Dim Shared As uint buddahtext,capitoletext,christriotext,libertystatuetext,tajmahaltext,airporttowertext
Dim Shared As uint watertowertext,commtowertext,balloontext,balloon1text,balloon2text
Sub inittownobject()
gizeh0text=0:gizeh1text=0:gizeh2text=0:gizeh3text=0
gizeh0list=0:gizeh1list=0:gizeh2list=0:gizeh3list=0
domerocktext=0:domerocklist=0:bridgetext=0:bridgesidetext=0
bridge2text=0:bridgeside2text=0:bridgeredtext=0:bridgeredsidetext=0:bridgeyellowtext=0:bridgeyellowsidetext=0
eiffeltext=0:eiffellist=0:triumphtext=0:triumphlist=0
londontext=0:londonlist=0:paris01text=0:paris02text=0:paris03text=0
archelist=0:notredamelist=0:pantheonlist=0:radiolist=0:cnitlist=0
jussieulist=0:trocaderolist=0:assembleelist=0
gasstationtext=0:gasstationlist=0:gasstation2list=0
buddahtext=0:capitoletext=0:christriotext=0:libertystatuetext=0:tajmahaltext=0
tennistext=0:tennislist=0:stade2text=0:stade2list=0:airporttowertext=0:watertowertext=0:commtowertext=0
balloontext=0:balloon1text=0:balloon2text=0
End Sub 
Sub myguiloadtexture(ByRef texture As uint,ficname As String,ByVal maxcolor As uint=255)
If texture<>0 Then Exit Sub
texture=guiloadtexture(ficname,maxcolor)
If texture=0 Then glGenTextures(1,@texture)	
End Sub 
Sub myguiloadlist(ByRef list As uint,ficname As String,size As uint=100)
If list<>0 Then Exit Sub
glpushmatrix
list=glgenlists(1)
glnewlist list,gl_compile 
loadobjsize(ficname,@"",@"",size)
glendlist	
glpopmatrix
End Sub
Sub rotaviontest(dx As Single,dy As Single,dz As Single)
Dim As Integer i
Dim As Single x,y 
If (itime Mod 80)=70 And testworld=0 Then
	x=mx+dx:y=my+dy
   For i=1 To itown4
   	If Abs(townhousex(i)-x)<800 Then
   		If Abs(townhousey(i)-y)<800 Then
   			townhousez(i)=-9999999
   		EndIf
   	EndIf
   Next
EndIf
rotavion(dx,dy,dz)
End Sub
Sub drawbridge(size As Single,bridgetext As uint,bridgesidetext As uint)
			gltranslatef(0,0,size*0.058)
			glbindtexture(gl_texture_2d,boattext)
			gltexcarre4(size/43,size)
			Var xx=size*0.5/43,yy=size/2,zz=size*0.058
			gltexquad(-xx,-yy,0,-xx,-yy*1.52,-zz,xx,-yy*1.52,-zz,xx,-yy,0)
			gltexquad(-xx,yy,0,-xx,yy*1.52,-zz,xx,yy*1.52,-zz,xx,yy,0)
			gltranslatef(-size/80,0,-size*0.058)
			glbindtexture(gl_texture_2d,bridgetext)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			gltexface2(size,size/5,0.0004*size)
			gltranslatef(size/40,0,0)
			gltexface2(size,size/5,0.0004*size)
			glbindtexture(gl_texture_2d,bridgesidetext)
			gltranslatef(-size/80,-size*0.3018,0)
			glrotatef(90,0,0,1)
			gltexface2(size/35,size/5,0.001*size)
			gltranslatef(size*2*0.3018,0,0)
			gltexface2(size/35,size/5,0.001*size)	
End Sub
Dim Shared As Integer trepair
Sub drawgasstation(x As Single,y As Single,z As Single,do1 As Single,size0 As Single)
Dim As Single z1,size
      size=max(350.0,size0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			If x2>0 And x2<size*0.9 And Abs(y2)<size Then trepair=1
			myguiloadtexture(gasstationtext,"objects/town/gasstation.jpg")
			myguiloadlist(gasstationlist,"objects/town/gasstation.obj",630)
			Var kx=(kscalex/500)*size
         z1=min(z,getterrainheight(x-dmx0-kx,y-dmy0-kx*0.64))
         z1=min(z1,getterrainheight(x-dmx0-kx,y-dmy0+kx*0.64))
         z1=min(z1,getterrainheight(x-dmx0+kx,y-dmy0-kx*0.64))
         z1=min(z1,getterrainheight(x-dmx0+kx,y-dmy0+kx*0.64))
			glpushmatrix
			glbindtexture(gl_texture_2d,gasstationtext)
			gltranslatef(x-dmx0,y-dmy0,z1)
			glrotatef(do1,0,0,1)
			glscalef(kx/630,kx/630,kx/630)
			glcalllist(gasstationlist)
			glpopmatrix
		EndIf
End Sub
Sub drawgasstation2(x As Single,y As Single,z As Single,do1 As Single,size0 As Single)
Dim As Single z1,size
      size=max(80.0,size0)
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			If x2>0 And x2<size*0.9 And Abs(y2)<size Then trepair=1
			myguiloadtexture(gasstationtext,"objects/town/gasstation.jpg")
			myguiloadlist(gasstation2list,"objects/town/gasstation2.obj",630)
			Var kx=(kscalex/500)*size
         z1=min(z,getterrainheight(x-dmx0-kx,y-dmy0-kx*0.64))
         z1=min(z1,getterrainheight(x-dmx0-kx,y-dmy0+kx*0.64))
         z1=min(z1,getterrainheight(x-dmx0+kx,y-dmy0-kx*0.64))
         z1=min(z1,getterrainheight(x-dmx0+kx,y-dmy0+kx*0.64))
			glpushmatrix
			glbindtexture(gl_texture_2d,gasstationtext)
			gltranslatef(x-dmx0,y-dmy0,z1)
			glrotatef(do1,0,0,1)
			glscalef(kx/630,kx/630,kx/630)
			glcalllist(gasstation2list)
			glpopmatrix
		EndIf
End Sub
Sub drawwatertower(x As single,y As single,z As Single,w As Single=1)
glenable gl_texture_2d
gldisable gl_lighting
'glcolor3f(1,1,1)
      Var size=400
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		if x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(watertowertext,"objects/town/water_tower512.jpg",250)
			glbindtexture(gl_texture_2d,watertowertext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			Var do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			'glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			'glsphere(1000)
			gltexcarre2rot(400*w,440,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
End Sub  
Sub drawsilo(x As single,y As single,z As Single,w As Single=1)
glenable gl_texture_2d
gldisable gl_lighting
glcolor3f(0.9,0.9,0)
      Var size=300
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		if x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(watertowertext,"objects/town/water_tower512.jpg",250)
			glbindtexture(gl_texture_2d,watertowertext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			Var do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			'glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			'glsphere(1000)
			gltexcarre2rot(300*w,300,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
glcolor3f(1,1,1)		
End Sub  
Sub drawcommtower(x As single,y As single,z As Single,w As Single=1)
glenable gl_texture_2d
gldisable gl_lighting
      Var size=420
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		if x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(commtowertext,"objects/town/communication_tower.jpg",250)
			glbindtexture(gl_texture_2d,commtowertext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			Var do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			'glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			'glsphere(1000)
			gltexcarre2rot(250*w,420,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf 
End Sub  
Sub drawairporttower(x As single,y As single,z As Single,w As Single=1)
glenable gl_texture_2d
gldisable gl_lighting
glcolor3f(1,1,1)
      Var size=750
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		if x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(airporttowertext,"objects/town/airporttower512.jpg",250)
			glbindtexture(gl_texture_2d,airporttowertext)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z-20)
			Var do1=-diro1(x-mx-dmx0,y-my-dmy0)+180
			glrotatef(-do1,0,0,1)
			Var do2=-34.0/max(1.0,(mz-z)*0.02)
			glrotatef(do2,0,1,0)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			'glsphere(1000)
			gltexcarre2(750*w,750)',do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
End Sub  
Dim Shared As Single balloonx,balloony,balloonz,balloono1,balloonco1,balloonsi1,balloonzsol,balloonx2,balloondo1
Dim Shared As Double tballoon
Sub drawballoon()
If time2>tballoon Then
   tballoon=time2+10+Rnd*30
   balloono1+=(Rnd-0.5)*30
   If balloono1>180 Then balloono1-=360
   If balloono1<-180 Then balloono1+=360
   balloonco1=Cos(degtorad*balloono1)
   balloonsi1=Sin(degtorad*balloono1)
EndIf
If Abs(balloonx)+Abs(balloony)<0.00001 Then 
   balloonx=mx+9000*cos1
   balloony=my+9000*sin1
   balloono1=(Rnd-0.5)*60+o1+180
EndIf 
balloonx+=balloonco1*kfps
balloony+=balloonsi1*kfps
Var dmax=10000.0
If balloonx>mx+dmax Then balloonx=mx-0.9*dmax
If balloonx<mx-dmax Then balloonx=mx+0.9*dmax
If balloony>my+dmax Then balloony=my-0.9*dmax
If balloony<my-dmax Then balloony=my+0.9*dmax
balloonzsol=getterrainheightfast(balloonx,balloony)
balloonz=max(waterz+500.0,balloonzsol+500)	
Var x=balloonx+dmx0,y=balloony+dmy0,z=balloonz
glenable gl_texture_2d
gldisable gl_lighting
glcolor3f(1,1,1)
      Var size=400
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		balloonx2=x2
		if x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(balloontext,"objects/town/ballon.jpg",250)
			myguiloadtexture(balloon1text,"objects/town/ballon1.jpg",250)
			myguiloadtexture(balloon2text,"objects/town/ballon2.jpg",250)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			Var do1=-diro1(x-mx-dmx0,y-my-dmy0)'+180
			Var ddo1=-balloono1-do1+90
			While ddo1>180:ddo1-=360:Wend
			While ddo1<-180:ddo1+=360:Wend
			Var do10=0.0
			If ddo1<-90 And ddo1>-150 Then
				do1+=180
				do10=30
				glbindtexture(gl_texture_2d,balloon2text)
			ElseIf ddo1<-150 or ddo1>150 Then
				do1+=180
				glbindtexture(gl_texture_2d,balloontext)
			ElseIf ddo1<150 and ddo1>90 Then
				do1+=180
				do10=-30
				glbindtexture(gl_texture_2d,balloon1text)
			ElseIf ddo1<90 and ddo1>30 Then
				do10=30
				glbindtexture(gl_texture_2d,balloon1text)
			ElseIf ddo1<30 and ddo1>-30 Then
				glbindtexture(gl_texture_2d,balloontext)
			Else'If ddo1<-30 or ddo1>-90 Then
			   do10=-30
				glbindtexture(gl_texture_2d,balloon2text)
			EndIf
			balloondo1=balloono1+do10
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			'glsphere(1000)
			gltexcarre2rot(400,280,do1)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
End Sub  
Sub drawtownobjects()
Dim As Single x,y,z,size,do1,kx,dx,dy,h,r,g,b
kx=kscalex/500
glenable gl_texture_2d
gldisable gl_lighting
glcolor3f(1,1,1)
If worldname="israel" Then
	If townname="lecaire" Then
      x=-2548300*kscalex/500:y=-815900*kscalex/500:do1=-15:size=300
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(gizeh0text,"objects/town/gizeh0.jpg")
			myguiloadlist(gizeh0list,"objects/town/gizeh0.obj",size)
			glbindtexture(gl_texture_2d,gizeh0text)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(gizeh0list)
			glpopmatrix
		EndIf
      x=-2555050*kscalex/500:y=-815200*kscalex/500:do1=0:size=5700
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(gizeh1text,"objects/town/gizeh1.jpg")
			myguiloadlist(gizeh1list,"objects/town/gizeh1.obj",size)
			glbindtexture(gl_texture_2d,gizeh1text)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(gizeh1list)
			glpopmatrix
		EndIf
      x=-2551600*kscalex/500:y=-811800*kscalex/500:do1=0:size=3390
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(gizeh2text,"objects/town/gizeh2.jpg")
			myguiloadlist(gizeh2list,"objects/town/gizeh2.obj",size)
			glbindtexture(gl_texture_2d,gizeh2text)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(gizeh2list)
			glpopmatrix
		EndIf
      x=-2557350*kscalex/500:y=-819000*kscalex/500:do1=0:size=9700
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(gizeh3text,"objects/town/gizeh3.jpg")
			myguiloadlist(gizeh3list,"objects/town/gizeh3.obj",size)
			glbindtexture(gl_texture_2d,gizeh3text)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(gizeh3list)
			glpopmatrix
		EndIf
	EndIf
	If townname="jerusalem" Then
      x=741620*kscalex/500:y=500260*kscalex/500:do1=-15:size=678
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(domerocktext,"objects/town/domerock.jpg")
			myguiloadlist(domerocklist,"objects/town/domerock.obj",size)
			glbindtexture(gl_texture_2d,domerocktext)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(domerocklist)
			glpopmatrix
		EndIf
	EndIf
EndIf 	
If worldname="westUS" Then
	If townname="sanfrancisco" Then
      x=-2289700*kscalex/500:y=389800*kscalex/500:do1=42:size=8500
      z=waterz-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(bridgetext,"objects/town/bridge_red.jpg",240)
			myguiloadtexture(bridgesidetext,"objects/town/bridgeside_red.jpg",230)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			drawbridge(size,bridgetext,bridgesidetext)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
EndIf 	
If worldname="°WestUSA" Then
	If townname="sanfrancisco" Then
      x=-7014900*kscalex/500:y=8559800*kscalex/500:do1=8:size=8500
      z=waterz-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(bridgetext,"objects/town/bridge_red.jpg",240)
			myguiloadtexture(bridgesidetext,"objects/town/bridgeside_red.jpg",230)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			drawbridge(size,bridgetext,bridgesidetext)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	EndIf 
EndIf 	
If worldname="france" Then
	'If townname="deauville" Then
      x=341400*kscalex/500:y=1885900*kscalex/500:do1=-34:size=34000
      z=waterz-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(bridgetext,"objects/town/bridge_yellow.jpg",240)
			myguiloadtexture(bridgesidetext,"objects/town/bridgeside_yellow.jpg",230)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glscalef(0.5,1,0.5)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			drawbridge(size,bridgetext,bridgesidetext)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	'EndIf 
	'If townname="deauville" Then
      x=544560*kscalex/500:y=1926100*kscalex/500:do1=12:size=16400
      z=waterz-50
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(bridge2text,"objects/town/bridge_red.jpg",240)
			myguiloadtexture(bridgeside2text,"objects/town/bridgeside_red.jpg",230)
         glenable gl_alpha_test
         glAlphaFunc(gl_less,10/254)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glscalef(0.6,1,0.6)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			drawbridge(size,bridge2text,bridgeside2text)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
	'EndIf 
	If townname="nice" Then
      x=2877520*kscalex/500:y=-2718000*kscalex/500:do1=33:size=630
      z=getterrainheight(x-dmx0,y-dmy0)
      drawgasstation(x,y,z,do1,size)
	EndIf 
	If townname="orly" Then
      x=1542000*kscalex/500:y=1409230*kscalex/500:do1=14:size=630
      z=getterrainheight(x-dmx0,y-dmy0)
      drawgasstation(x,y,z,do1,size)
	EndIf 
	If townname="paris" Then
      If taddtownhouse2=0 Then 
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

      x=1506100*kscalex/500:y=1495000*kscalex/500:do1=-140:size=590
      z=getterrainheight(x-dmx0,y-dmy0)
      drawgasstation(x,y,z,do1,size)

      x=1518120*kscalex/500:y=1517250*kscalex/500:do1=0:size=3100
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
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
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(eiffellist)
			glpopmatrix
         gldisable gl_alpha_test
		EndIf
      x=1518280*kscalex/500:y=1528830*kscalex/500:do1=63:size=630
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(triumphtext,"objects/town/triumph.jpg")
			myguiloadlist(triumphlist,"objects/town/triumph.obj",size)
			glbindtexture(gl_texture_2d,triumphtext)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(triumphlist)
			glpopmatrix
		EndIf
      x=1514900*kscalex/500:y=1520330*kscalex/500:do1=47:size=1710
      z=getterrainheight(x-dmx0,y-dmy0)-5
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-700) And x2<dxterrain*scalex Then
			myguiloadtexture(paris02text,"objects/town/paris02.jpg")
			myguiloadlist(trocaderolist,"objects/town/trocadero.obj",size)
			glbindtexture(gl_texture_2d,paris02text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcolor3f(0.8,0.8,0.8)
			glcalllist(trocaderolist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
      x=1529440*kscalex/500:y=1519760*kscalex/500:do1=17.5:size=580
      z=getterrainheight(x-dmx0,y-dmy0)+10
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-700) And x2<dxterrain*scalex Then
			myguiloadtexture(paris01text,"objects/town/paris01.jpg")
			myguiloadlist(assembleelist,"objects/town/assemblee.obj",size)
			glbindtexture(gl_texture_2d,paris01text)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			'glcolor3f(0.8,0.8,0.8)
			glcalllist(assembleelist)
			glpopmatrix
			'glcolor3f(1,1,1)
		EndIf
      x=1494400*kscalex/500:y=1549000*kscalex/500:do1=55:size=900
      z=getterrainheight(x-dmx0,y-dmy0)-50
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris01text,"objects/town/paris01.jpg")
			myguiloadlist(archelist,"objects/town/archedefense.obj",size)
			glbindtexture(gl_texture_2d,paris01text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glcolor3f(0.85,0.85,0.85)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(archelist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
      x=1497500*kscalex/500:y=1549080*kscalex/500:do1=-11:size=1100
      z=getterrainheight(x-dmx0,y-dmy0)-40
		rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris03text,"objects/town/paris03.jpg")
			myguiloadlist(cnitlist,"objects/town/cnit.obj",size)
			glbindtexture(gl_texture_2d,paris03text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(cnitlist)
			glpopmatrix
		EndIf 	
		If taddtownhouse2=0 Then 
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
		/'rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
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
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
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
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcolor3f(0.7,0.7,0.7)
			drawbuilding2(220,size,size*0.27,1,x2,0.7,0.7,0.7)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf '/
      x=1545080*kscalex/500:y=1513160*kscalex/500:do1=63:size=920
      z=getterrainheight(x-dmx0,y-dmy0)-30
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris02text,"objects/town/paris02.jpg")
			myguiloadlist(notredamelist,"objects/town/notredame.obj",size)
			glbindtexture(gl_texture_2d,paris02text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(notredamelist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
      x=1542950*kscalex/500:y=1508400*kscalex/500:do1=-18:size=690
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris01text,"objects/town/paris01.jpg")
			myguiloadlist(pantheonlist,"objects/town/pantheon_low.obj",size)
			glbindtexture(gl_texture_2d,paris01text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(pantheonlist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
      x=1548270*kscalex/500:y=1509050*kscalex/500:do1=-5.5:size=1730
      z=getterrainheight(x-dmx0,y-dmy0)-40
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris03text,"objects/town/paris03.jpg")
			myguiloadlist(jussieulist,"objects/town/jussieu.obj",size)
			glbindtexture(gl_texture_2d,paris03text)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			glcolor3f(0.89,0.89,0.89)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(jussieulist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
      x=1510090*kscalex/500:y=1513080*kscalex/500:do1=-5:size=695
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris03text,"objects/town/paris03.jpg")
			myguiloadlist(radiolist,"objects/town/radio.obj",size)
			glbindtexture(gl_texture_2d,paris03text)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			'glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(radiolist)
			glpopmatrix
			glcolor3f(1,1,1)
		EndIf
      /'x=1532900*kscalex/500:y=1539800*kscalex/500:do1=185:size=940
      z=getterrainheight(x-dmx0,y-dmy0)
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(paris02text,"objects/town/paris02.jpg")
			myguiloadlist(sacrecoeurlist,"objects/town/sacrecoeur_low.obj",size)
			glbindtexture(gl_texture_2d,paris02text)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			'glcolor3f(0.8,0.8,0.8)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(sacrecoeurlist)
			glpopmatrix
			'glcolor3f(1,1,1)
		EndIf '/
	EndIf 
EndIf 	
If worldname="england" Then
	If townname="londres" Then
      x=2591760*kscalex/500:y=-1900900*kscalex/500:do1=-20:size=1140
      z=getterrainheight(x-dmx0,y-dmy0)+15
		rotaviontest(x-mx-dmx0,y-my-dmy0,z-mz)
		If x2>(0.9*max(y2,z2)-size*kscalex/500-100) And x2<dxterrain*scalex Then
			myguiloadtexture(londontext,"objects/town/london.jpg")
			myguiloadlist(londonlist,"objects/town/london.obj",size)
			glbindtexture(gl_texture_2d,londontext)
			glpushmatrix
			gltranslatef(x-dmx0,y-dmy0,z)
			glrotatef(do1,0,0,1)
			glscalef(kscalex/500,kscalex/500,kscalex/500)
			glcalllist(londonlist)
			glbindtexture(gl_texture_2d,boattext)
			gltranslatef(0,77,0)
			Var xx=size*0.09,yy=size*0.93,zz=size*0.065
			gltexquad(-xx,-yy,zz,-xx,-yy*1.34,-20,xx-23,-yy*1.34,-20,xx-23,-yy,zz)
			gltexquad(-xx,yy,zz,-xx,yy*1.34,-20,xx-23,yy*1.34,-20,xx-23,yy,zz)
			glpopmatrix
		EndIf
	EndIf
EndIf 
taddtownhouse2=1
End Sub
