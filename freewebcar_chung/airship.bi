'Dim Shared As Single airshipo1,airshipo2,airshipo3,airshipx,airshipy,airshipz
Dim Shared As Single airshipmmx,airshipmmy,airshipmmz
Dim Shared As Single airshipv(nship),airshipco1(nship),airshipsi1(nship),airshipco2(nship),airshipsi2(nship)
Dim Shared As Single airshipvie(nship),distairship,airshipz900(nship),airshipsol
Dim Shared As Integer setairship(nship),turnairship11,airshipsmoke(nship)
Dim Shared As Single airshiphelicerot(nship),airshipo30(nship),h1400=450,h1100=275,h700=180
Dim Shared As Single dxairship,dyairship,dzairship,turnairship(nship),dturnairship(nship),dairshipo1(nship)
'Dim Shared As Single dmax=645000*0.5-20000+350000
'Dim Shared As Single dmax2=645000*0.5-20000+350000,dmax3=200000
Dim Shared As Single dmax2=645000*0.5-20000+250000,dmax3=200000,kfps3
dmax2=distmax:dmax3=distmax*0.4
Dim Shared As Integer target,typetarget
Sub testairshipboom(ByVal iship As Integer)
   	If airshipvie(iship)<airshipvie0(iship)*0.4 And Rnd<0.4*0.2 Then airshipsmoke(iship)=4000
   	If airshipvie(iship)<0 Then
   		If target=iship And typetarget=2 Then target=0
   		'target22(i)=0
         If airshipvie(iship)>-100 Then
            soundboom
         	airshipvie(iship)=-150
         	addboom(airshipx(iship),airshipy(iship),airshipz(iship))
         	adddebris(airshipx(iship),airshipy(iship),airshipz(iship), _	
         	          airshipv(iship)*airshipco1(iship)*airshipco2(iship), _ 
         	          airshipv(iship)*airshipsi1(iship)*airshipco2(iship), _ 
         	          airshipv(iship)*airshipsi2(iship))
         EndIf
   	EndIf
End Sub 
Sub dirairship(ByVal i As Integer)
distairship=sqr(airshipmmx*airshipmmx+airshipmmy*airshipmmy)
dxairship=airshipmmx*airshipco1(i)+airshipmmy*airshipsi1(i)
If dxairship>dturnairship(i) or turnairship(i)>0 Then
   if turnairship(i)<=0 Then
   	If Rnd<0.2 Then turnairship(i)=Int(Rnd*140)
   Else
   	turnairship(i)=turnairship(i)-1
   EndIf
   dturnairship(i)=0-min(dmax2*0.36,0.7*distairship-4000)
   if Abs(airshipo30(i))<1 then
     'dyairship=airshipmmx*airshipsi1(i)-airshipmmz*airshipco1(i) '!!!
     dyairship=airshipmmx*airshipsi1(i)-airshipmmy*airshipco1(i)
     if dyairship>(Rnd-0.5)*dmax2*0.2 then
        airshipo30(i)=2':dairshipo1(i)=1
     else
        airshipo30(i)=-2':dairshipo1(i)=-1
     end if
   end If
   airshipo3(i)=max(-40.0,min(40.0,airshipo3(i)+airshipo30(i)*kfps3))
   dairshipo1(i)=airshipo3(i)*0.025
   airshipo1(i)=airshipo1(i)+dairshipo1(i)*kfps3*0.8
   setairship(i)=1
Else
  	If Rnd<0.0003*kfps Then
  		If dxairship<0 Or Rnd<0.05 Then turnairship(i)=Int(Rnd*40)
  	EndIf
   if Abs(airshipo3(i))>01.1 Then
   	airshipo3(i)=max(0.5,(1.0-0.3*kfps3))*airshipo3(i)+1e-20:setairship(i)=1
   Else
      If Abs(airshipo3(i))>0.001 Then airshipo3(i)=0:setairship(i)=1
   EndIf
   airshipo30(i)=0
   If i=11 Then
   	If distairship>(dmax3-5000) then dturnairship(i)=0 else dturnairship(i)=dmax3*0.59
   Else 
   	If distairship>(dmax2-5000) then dturnairship(i)=0 else dturnairship(i)=dmax2*0.59
   EndIf
end if
End Sub 
Dim Shared As Single dairshipmmx,dairshipmmy,dairshipmmz
Dim Shared As Single tshootairship(nship),turnairship0(nship),turnairship0max(nship)
Sub dirairship2(ByVal i As Integer)
'dairshipmmx=airshipx(i)-x:dairshipmmy=airshipz(i)-z
dairshipmmx=airshipmmx:dairshipmmy=airshipmmy
distairship=sqr(dairshipmmx*dairshipmmx+dairshipmmy*dairshipmmy)
dxairship=dairshipmmx*airshipco1(i)+dairshipmmy*airshipsi1(i)
dyairship=dairshipmmx*airshipsi1(i)-dairshipmmy*airshipco1(i)
'If abs(dyairship)>max2(500*7,-0.15*dxairship) or turnairship(i)>0 _
If abs(dyairship)>max2(900,0.15*distairship) or turnairship(i)>0 _
	Or dxairship>35000 Then
   if turnairship(i)<=0 then turnairship(i)=14 else turnairship(i)=turnairship(i)-1
   if Abs(airshipo30(i))<1 then
      if dyairship>0 then
        airshipo30(i)=2':dairshipo1(i)=0.7
      else
        airshipo30(i)=-2':dairshipo1(i)=-0.7
      end if
   end if
   airshipo3(i)=max(-40.0,min(40.0,airshipo3(i)+airshipo30(i)*kfps3))
   dairshipo1(i)=airshipo3(i)*0.02
   airshipo1(i)=airshipo1(i)+dairshipo1(i)*kfps3*0.8
   setairship(i)=1
else
   if Abs(airshipo3(i))>01.1 Then
   	airshipo3(i)=max(0.5,(1.0-0.3*kfps3))*airshipo3(i)+1e-20:setairship(i)=1
   Else
      If Abs(airshipo3(i))>0.001 Then airshipo3(i)=0:setairship(i)=1
   EndIf
   airshipo30(i)=0
   turnairship(i)=0
end if
End Sub 
Sub dirairship3(ByVal i As Integer)
Dim As Single do1
'dairshipmmx=airshipx(i)-mx:dairshipmmy=airshipy(i)-my
dairshipmmx=airshipmmx:dairshipmmy=airshipmmy
distairship=sqr(dairshipmmx*dairshipmmx+dairshipmmy*dairshipmmy)
dxairship=dairshipmmx*airshipco1(i)+dairshipmmy*airshipsi1(i)
dyairship=dairshipmmx*airshipsi1(i)-dairshipmmy*airshipco1(i)
If dxairship<0 and dxairship>-3500 Then aux=40 else aux=-0.15*dxairship
If abs(dyairship)>aux or (turnairship(i)>0) then
   if turnairship(i)<=0 then turnairship(i)=14 else turnairship(i)=turnairship(i)-1
   'if Abs(airshipo3(i))<40 or dairshipo1(i)=0 then
      If distairship<1400 Then aux2=min(50.0,Abs(dyairship/10.0)) Else aux2=40
      if dyairship>0 then
        airshipo3(i)=min(aux2,airshipo3(i)+2.0*kfps3)
      else
        airshipo3(i)=max(-aux2,airshipo3(i)-2.0*kfps3)
      end if
      dairshipo1(i)=Sin(airshipo3(i)*degtorad)*2'-0.7
   'end if
  	airshipo1(i)=airshipo1(i)+dairshipo1(i)*kfps3*0.8
   setairship(i)=1
else
   if Abs(airshipo3(i))>01.1 Then
   	airshipo3(i)=max(0.5,(1.0-0.3*kfps3))*airshipo3(i)+1e-20:setairship(i)=1
   Else
   	do1=(o1-airshipo1(i))
   	While do1<-180:do1+=360:Wend
   	While do1>180:do1-=360:Wend
   	airshipo1(i)+=do1*0.123
   	airshipo3(i)=0:setairship(i)=1
   EndIf
   turnairship(i)=0
end if
End Sub
Dim Shared As Integer target2,disttarget2,target22(nship)
Dim Shared As Integer typetarget22(nship)
Dim Shared As Single  klevel2(nship)
target2=0
For i=1 To nship:target22(i)=0:Next 
Sub dirairshipwar(ByVal i As Integer)
Dim As Single dist
dairshipmmx=airshipx(i)-mx:dairshipmmy=airshipy(i)-my:dairshipmmz=airshipz(i)-mz'-h700
dxairship=dairshipmmx*airshipco1(i)+dairshipmmy*airshipsi1(i)
If dxairship<0 Then
	'dist=-v*30*dxairship/15000
	dist=-v*50*dxairship/10000'15000
	dairshipmmx-=dist*dmx
	dairshipmmy-=dist*dmy
	dairshipmmz-=dist*dmz
   'dxairship=dairshipmmx*airshipco1(i)+dairshipmmy*airshipsi1(i)
EndIf
distairship=sqr(dairshipmmx*dairshipmmx+dairshipmmy*dairshipmmy)
dyairship=dairshipmmx*airshipsi1(i)-dairshipmmy*airshipco1(i)
dzairship=-dairshipmmz*airshipco2(i)-distairship*(airshipsi2(i)-0.04)'-0.07)
If Abs(dyairship)<500 And dxairship<0 And distairship<20000 Then
 'If distairship<disttarget2 And i>=7 Then target2=i:disttarget2=distairship
 If distairship<disttarget2 Then target2=i:disttarget2=distairship
 'If abs(dyairship)<120 and abs(dzairship)<min2(h700,distairship*0.1215) then
 'If abs(dyairship)<max(200.0,dist*0.7) and abs(dzairship)<min2(h700,distairship*0.1215) then
 If abs(dyairship*0.7)<max(200.0,dist*0.7) and Abs(dzairship*0.7)<min2(h700,distairship*0.1215) then
   'if dxairship<0 and distairship<80000 Then
   	'If i>=7 Then target2=i
   	If time2>tshootairship(i)+0.15 Then
   		tshootairship(i)=time2
   		'vie-=Rnd*2
   		'shootballe
   		soundshoot2
   		addtirairship(i,1000+i)'2)
   		klevel2(i)=max(0.0,5.0-level)
   		If max(Abs(ttirx-mx),Abs(ttiry-my))<500 And time2<(ttirxyz+9) Then
   			dzairship+=(ttirz-mz)*4
   			dyairship+=((ttirx-mx)*airshipsi1(i)-(ttiry-my)*airshipco1(i))*4
   		EndIf
   	Else
   		If time2<tshootairship(i)-100 Then tshootairship(i)=time2 'if midnight
   	EndIf
   'EndIf
 EndIf 
EndIf  
mmx=airshipx(i)+4000*airshipco1(i):mmy=airshipy(i)+4000*airshipsi1(i)
airshipsol=max2(airshipsol,GetTerrainHeight(mmx,mmy))
If (dzairship>(0.115*distairship*(1/(1+level+klevel2(i)))) And dxairship<0)or airshipz(i)<(airshipsol+500) Then
	if airshipo2(i)<30 then airshipo2(i)=airshipo2(i)+2*kfps3:setairship(i)=1
EndIf
if dzairship<(-0.115*distairship*(1/(1+level+klevel2(i)))) and airshipz(i)>(airshipsol+500) Then
	if airshipo2(i)>-30 then airshipo2(i)=airshipo2(i)-2*kfps3:setairship(i)=1
EndIf
If dxairship<0 and dxairship>-3500 then aux=90 else aux=-0.115*dxairship
if abs(dyairship)>aux or (turnairship(i)>0 And klevel2(i)<0.1) then
   if turnairship(i)<=-40 then turnairship(i)=0 Else turnairship(i)=turnairship(i)-1
   if abs(airshipo30(i))<1 or turnairship(i)=-20 or turnairship(i)=20 then
      if dyairship>(Rnd-0.5)*120*7 then
        airshipo30(i)=2.5':dairshipo1(i)=1.5
      else
        airshipo30(i)=-2.5':dairshipo1(i)=-1.5
      end if
      turnairship(i)=4
      if dxairship<-0.2*distairship then turnairship0(i)=0
   end if
   turnairship0(i)=turnairship0(i)+kfps
   if turnairship0(i)>turnairship0max(i) then
      turnairship0(i)=0:turnairship(i)=int(Rnd*120)
      turnairship0max(i)=200+Rnd*200
      airshipo30(i)=0-airshipo30(i)':dairshipo1(i)=0-dairshipo1(i)
   end If
   airshipo3(i)=max(-45.0,min(45.0,airshipo3(i)+airshipo30(i)*kfps3))
   dairshipo1(i)=airshipo3(i)*0.045
   'if dxairship<0 and dxairship>-0.8*distairship then airshipo1(i)+=dairshipo1(i)*kfps3
   airshipo1(i)+=dairshipo1(i)*kfps3*0.8*klevel*(1.5+level+klevel2(i))/3.5
   'klevel=min2(1.0,klevel+0.01*kfps)
   setairship(i)=1
else
   if Abs(airshipo3(i))>01.1 Then
   	airshipo3(i)=max(0.5,(1.0-0.3*kfps3))*airshipo3(i):setairship(i)=1
   Else
      If Abs(airshipo3(i))>0.001 Then airshipo3(i)=0:setairship(i)=1
   EndIf
   airshipo30(i)=0
   turnairship(i)=0:turnairship0(i)=0
end if
airshipo2(i)=max2(-30.0,min2(30.0,airshipo2(i)))
If setairship(i)=1 Then
    	 setairship(i)=0
    	 While airshipo1(i)>180:airshipo1(i)-=360:Wend
    	 While airshipo1(i)<-180:airshipo1(i)+=360:wend
       airshipco1(i)=Cos(airshipo1(i)*degtorad):airshipsi1(i)=Sin(airshipo1(i)*degtorad)
       airshipco2(i)=Cos(airshipo2(i)*degtorad):airshipsi2(i)=Sin(airshipo2(i)*degtorad)       	
EndIf
End Sub
'Dim Shared As Single boatvie0(nboat),boatvie(nboat),distboat(nboat)
'Dim Shared As Integer setboat(nboat),boatpiste=0,initboatmmx(nboat)
Dim Shared As integer targetx,targety,targetdist
Dim Shared As integer targetr(4)
targetr(0)=0
targetr(1)=600/4
targetr(2)=97'480/4
targetr(3)=480/4
targetr(4)=1200/4
target=0
Sub dirairshipwar2(ByVal i As Integer)
Dim As Integer testdx=0,ry,rz
'dairshipmmx=airshipx(i)-x:dairshipmmy=airshipz(i)-z:dairshipmmz=-airshipy(i)+h700+y
Select Case typetarget22(i)
	Case 1 '"boule"
    'dairshipmmx=airshipx(i)-boulex(target22(i))
    'dairshipmmy=airshipz(i)-boulez(target22(i))
    'dairshipmmz=-airshipy(i)+1350+bouley(target22(i))
	Case 2 '"airship"
    dairshipmmx=airshipx(i)-airshipx(target22(i))
    dairshipmmy=airshipy(i)-airshipy(target22(i))
    dairshipmmz=airshipz(i)-airshipz(target22(i))*0.975'-h700
	Case 3 '"tank"
    'dairshipmmx=airshipx(i)-tankx(target22(i))
    'dairshipmmy=airshipz(i)-tankz(target22(i))
    'dairshipmmz=-airshipy(i)+1350+tanky(target22(i))
	Case 4 '"boat"
    dairshipmmx=airshipx(i)-boatx(target22(i))
    dairshipmmy=airshipy(i)-boaty(target22(i))
    dairshipmmz=airshipz(i)-boatz(target22(i))'-h1400+12.5
End Select
If i=4 Then dairshipmmx+=250
If i=6 Then dairshipmmx-=250
distairship=sqr(dairshipmmx*dairshipmmx+dairshipmmy*dairshipmmy)
dxairship=dairshipmmx*airshipco1(i)+dairshipmmy*airshipsi1(i)
dyairship=dairshipmmx*airshipsi1(i)-dairshipmmy*airshipco1(i)
dzairship=-dairshipmmz*airshipco2(i)-distairship*airshipsi2(i)
If typetarget22(i)=4 Then 'boat
   ry=dxboatmax(target22(i))
   rz=ry
Else 
	ry=targetr(typetarget22(i))
	rz=ry
EndIf 
If Abs(dyairship)<ry Then'480 Then 
 If Abs(dzairship)<max2(rz,min2(h700,distairship*0.143)) then
   If dxairship<0 and distairship<20000 Then
   	If time2>tshootairship(i)+0.15 Then
   		tshootairship(i)=time2
   		'degatsmoi=degatsmoi+Rnd*7
   		'shootballe
   		soundshoot2
   		addtirairship(i,1000+i)
   		iaux=target22(i)
   		klevel2(i)=max(0.0,5.0-level)
   		Select case typetarget22(i)
   		 Case 1 'boule
   		  'boulevie(iaux)-=Rnd*3.5
   		  'testbouleboom(iaux) 		
   		 Case 2 'airship
   	 	  If iaux=7 And nship>=9 Then target22(9)=i:typetarget22(9)=2
   		  If iaux=8 And nship>=10 Then target22(10)=i:typetarget22(10)=2
   		  If iaux=9 And nship>=11 Then target22(11)=i:typetarget22(11)=2
   		  If iaux=11 And nship>=12 Then target22(12)=i:typetarget22(12)=2
   		  If iaux=12 And nship>=13 Then target22(13)=i:typetarget22(13)=2
   		  If iaux=13 And nship>=14 Then target22(14)=i:typetarget22(14)=2
   		  If iaux=15 And nship>=16 Then target22(16)=i:typetarget22(16)=2
   		  If iaux=16 And nship>=17 Then target22(17)=i:typetarget22(17)=2
   		  If iaux=17 And nship>=18 Then target22(18)=i:typetarget22(18)=2
   		  If iaux>=7 And target22(iaux)=0 Then airshipwar(iaux)=15000
   		  target22(iaux)=i:typetarget22(iaux)=2
   		  If typeship(iaux)=4 Then boattarget(0)=i 'b25
   		  'airshipvie(iaux)-=Rnd*2'(1+rnd)*10
           'testairshipboom(iaux)
   		 Case 3 'tank
   		  'tankvie(iaux)-=Rnd*7
   		  'tankwar=1
   		  'testtankboom(iaux) 		
   		 Case 4 'boat
   		  boattarget(iaux)=i 
   		  'boatvie(iaux)-=1+Rnd
   		  'boatwar(iaux)=1
   		  'testboatboom(iaux) 		
   		End Select 
   	Else
   		If time2<tshootairship(i)-100 Then tshootairship(i)=time2 'if midnight
   	EndIf
   EndIf
 EndIf 
EndIf  
If Rnd<0.01*kfps Then
	If i=7 Or i=8 Or i=11 Or i>=15 Or Rnd<0.07 Then
		target22(i)=0
	EndIf
EndIf
mmx=airshipx(i)+4000*airshipco1(i):mmy=airshipy(i)+4000*airshipsi1(i)
airshipsol=max2(airshipsol,GetTerrainHeight(mmx,mmy))
If typetarget=4 And dxairship>0 And distairship<5900 Then 'boat
	testdx=1:aux=h1400+140
Else
	testdx=0:aux=h1400
EndIf
If (dzairship>(0.115*distairship*(1/(1+level+klevel2(i)))) And dxairship<0)or airshipz(i)<(airshipsol+aux) Then
	if airshipo2(i)<30 then airshipo2(i)=airshipo2(i)+2*kfps3:setairship(i)=1
EndIf
if (dzairship<(-0.115*distairship*(1/(1+level+klevel2(i)))) And dxairship<0 And airshipz(i)>(airshipsol+h1400)) Or _  
   airshipz(i)>(mz+15000) Then 'airshipsol+4700) Then
	if airshipo2(i)>-30 then airshipo2(i)=airshipo2(i)-2*kfps3:setairship(i)=1
EndIf
If dxairship<0 and dxairship>-3500 then aux=90 else aux=-0.115*dxairship
If (Abs(dyairship)>aux or (turnairship(i)>0 And klevel2(i)<0.1) )And testdx=0 Then
   if turnairship(i)<=-40 then turnairship(i)=0 Else turnairship(i)=turnairship(i)-1
   if Abs(airshipo30(i))<1 or turnairship(i)=-20 or turnairship(i)=20 then
      if dyairship>(Rnd-0.5)*200 Then '120*7 then
        airshipo30(i)=2.5':dairshipo1(i)=1.5
      else
        airshipo30(i)=-2.5':dairshipo1(i)=-1.5
      end if
      turnairship(i)=4
      if dxairship<-0.2*distairship then turnairship0(i)=0
   end if
   turnairship0(i)=turnairship0(i)+1
   if turnairship0(i)>turnairship0max(i) then
      turnairship0(i)=0:turnairship(i)=int(Rnd*120)
      turnairship0max(i)=200+Rnd*200
      airshipo30(i)=0-airshipo30(i)':dairshipo1(i)=0-dairshipo1(i)
   end if
   airshipo3(i)=max(-45.0,min(45.0,airshipo3(i)+airshipo30(i)*kfps3))
   dairshipo1(i)=airshipo3(i)*0.045
   'if dxairship<0 and dxairship>-0.8*distairship then airshipo1(i)=airshipo1(i)+dairshipo1(i)
   airshipo1(i)=airshipo1(i)+dairshipo1(i)*kfps3*0.8*klevel*(1.5+level+klevel2(i))/3.5
   'klevel=min2(1.0,klevel+0.01*kfps)
   setairship(i)=1
else
   if Abs(airshipo3(i))>01.1 Then
   	airshipo3(i)=max(0.5,(1.0-0.3*kfps3))*airshipo3(i):setairship(i)=1
   Else
      If Abs(airshipo3(i))>0.001 Then airshipo3(i)=0:setairship(i)=1
   EndIf
   airshipo30(i)=0
   turnairship(i)=0:turnairship0(i)=0
end if
airshipo2(i)=max2(-30.0,min2(30.0,airshipo2(i)))
If setairship(i)=1 Then
    	 setairship(i)=0
    	 While airshipo1(i)>180:airshipo1(i)-=360:Wend
    	 While airshipo1(i)<-180:airshipo1(i)+=360:wend
       airshipco1(i)=Cos(airshipo1(i)*degtorad):airshipsi1(i)=Sin(airshipo1(i)*degtorad)
       airshipco2(i)=Cos(airshipo2(i)*degtorad):airshipsi2(i)=Sin(airshipo2(i)*degtorad)       	
EndIf
End Sub
Sub testresetairship(ByVal i As Integer)
Dim As Integer j
	airshipvie(i)=airshipvie(i)-100*kfps
	If airshipvie(i)<-5000 Then
		airshipvie(i)=airshipvie0(i)
		airshipwar(i)=0
		For j=1 To 200
			airshipx(i)=(Rnd-0.5)*distmax*1.7
			airshipy(i)=(Rnd-0.5)*distmax*1.7
			If max(Abs(airshipx(i)-mx),Abs(airshipy(i)-my))>35000 Then
				airshipsol=GetTerrainHeight(airshipx(i),airshipy(i))
				airshipz(i)=max2(airshipz(i),airshipsol+h1400)
				Exit For
			EndIf
		Next j
		For j=1 To nship
			If target22(j)=i And typetarget22(j)=2 Then
				target22(j)=0
			EndIf
		Next
		if target=i and typetarget=2 then target=0
	EndIf
End Sub
Sub dirorder(ByVal i As integer)
disttarget2=20000
Select Case order
	Case 1 'formation
	   Var dx=airshipx(i)-mx-cos1*180
	   Var dy=airshipy(i)-my-sin1*180
	   If vkm>1000 Then
	   	dx-=cos1*(v)*40:dy-=sin1*(v)*40
	   Else
	   	dx-=cos1*(v-vcruise)*20:dy-=sin1*(v-vcruise)*20
	   EndIf
	   If Rnd<0.01*kfps Then target22(i)=0
	   airshipmmx=dx-(1400)*cos1-(i-5)*sin1*380 
	   airshipmmy=dy-(1400)*sin1-(i-5)*cos1*380     		
      airshipz900(i)=mz+200
	   'If (itime Mod 7)=0 Then 
	    Var dxy=((dx)*cos1+(dy)*sin1+100)
	    If vkm>1000 Then dxy+=(v-vcruise)*8
	    If dxy<Sqr(dx*dx+dy*dy)*0.8 Then
	   	airshipv(i)=max(airshipv(i),v*1.05)
	    Else 
	   	airshipv(i)=min(airshipv(i),max(vcruise,v*0.9))
	    EndIf 
	   'EndIf
	Case 2 'attack
		If target>0 Then
			Select Case typetarget
				Case 1
					'targetx=boulex(target):targety=bouley(target)
					'airshipz900(i)=boulez(target)+h700
				Case 2
					If target<>i Then 
					   targetx=airshipx(target):targety=airshipy(target)
					   airshipz900(i)=airshipz(target)*0.975+h700
					Else
					   targetx=airshipx(target):targety=airshipy(target)
					   airshipz900(i)=mz+h700
					EndIf 
				Case 3
					'targetx=tankx(target):targety=tanky(target)
					'airshipz900(i)=tankz(target)+h700
				Case 4
					targetx=boatx(target):targety=boaty(target)
					airshipz900(i)=boatz(target)'+h700
			End Select
   		If max(Abs(targetx-mx),Abs(targety-my))>25000 Then target=0
		EndIf
		If target>0 And (target<>i Or typetarget<>2) Then
	      target22(i)=target
	      typetarget22(i)=typetarget
	      airshipmmx=airshipx(i)-targetx-(i-5)*sin1*250
	      airshipmmy=airshipy(i)-targety-(i-5)*cos1*250     		
	   Else 
	      If Rnd<0.003*kfps Then target22(i)=0
	      airshipmmx=airshipx(i)-mx-(1900)*cos1-(i-5)*sin1*380
	      airshipmmy=airshipy(i)-my-(1900)*sin1-(i-5)*cos1*380     		
		EndIf
      airshipz900(i)=mz+200
	Case 3 'cover
		If target2>0 Then
			targetx=airshipx(target2):targety=airshipy(target2)
   		If max(Abs(targetx-mx),Abs(targety-my))>18000 Then target2=0
		EndIf
		If target2>0 Then			
	      target22(i)=target2
	      typetarget22(i)=2 '"airship"
	      airshipmmx=airshipx(i)-targetx-(i-5)*sin1*250
	      airshipmmy=airshipy(i)-targety-(i-5)*cos1*250     		
	   Else 
	      If Rnd<0.003*kfps Then target22(i)=0
	      airshipmmx=airshipx(i)-mx+(1200)*cos1-(i-5)*sin1*380
	      airshipmmy=airshipy(i)-my+(1200)*sin1-(i-5)*cos1*380     		   	
	   EndIf 
      airshipz900(i)=mz+200
	Case Else 'break	
 	  If Rnd<0.01*kfps Then target22(i)=0
     'If i=4 Then 
		'    airshipmmx=airshipx(i)-airshipx(3):airshipmmy=airshipy(i)-airshipy(3)-380
      '    airshipz900(i)=airshipz(3)+h700
     'Else 
		    airshipmmx=airshipx(i)-airshipx(i-1)-700*airshipco1(i-1)-(i-5)*sin1*380
		    airshipmmy=airshipy(i)-airshipy(i-1)-700*airshipsi1(i-1)-(i-5)*cos1*380
          airshipz900(i)=airshipz(i-1)+h700
     'EndIf 
End Select
End Sub 
Sub moveairship(ByVal i As Integer)
Dim As Single auxv',kvaux=1.0
Dim As Integer order0
order0=order
if order=4 and i=4 And nship2>5 then order=1
If klevel2(i)>0.01 Then klevel2(i)=max(0.0,klevel2(i)-0.03*kfps)
kfps3=kfps*airshipmove(i)
airshipx(i)+=airshipv(i)*airshipco2(i)*airshipco1(i)*kfps*kvaux
airshipy(i)+=airshipv(i)*airshipco2(i)*airshipsi1(i)*kfps*kvaux
If airshipwar(i)<0.1 Then
 If ((i-3) Mod 4)=0 Or i=1 Then
	If i=11 Then
		If Abs(airshipx(i)-mx)>18000 Or Abs(airshipy(i)-my)>18000 Then
			turnairship11=0
   		airshipmmx=mx+9000*cos1:airshipmmy=my+9000*sin1
	   	airshipmmx=max(-distmax,min(distmax,airshipmmx))
		   airshipmmy=max(-distmax,min(distmax,airshipmmy))
		   airshipmmx=airshipx(i)-airshipmmx:airshipmmy=airshipy(i)-airshipmmy
		Else
			turnairship11=1
   	   airshipmmx=airshipx(i)-airshipx(i-1):airshipmmy=airshipy(i)-airshipy(i-1)-400
		EndIf 	
	Else
		If i=15 Or i=1 Or i=3 Then 
   	   airshipmmx=airshipx(i)-avionx+250:airshipmmy=airshipy(i)-aviony+250
		Else    
		   'airshipmmx=airshipx(i)-xbase:airshipmmz=airshipz(i)-zbase
		   airshipmmx=airshipx(i)-boatx(1):airshipmmy=airshipy(i)-boaty(1)
		EndIf 
	EndIf
 Else
   If i>=4 And i<=6 Then
   	dirorder(i)
   Else 	
      airshipmmx=airshipx(i)-airshipx(i-1)-590*airshipco1(i-1)-400*((i+1)Mod 2)
      airshipmmy=airshipy(i)-airshipy(i-1)-590*airshipsi1(i-1)-400*(i Mod 2)'2000 
	EndIf
 EndIf
EndIf  
airshipsol=GetTerrainHeight(airshipx(i),airshipy(i))
airshipz(i)+=airshipv(i)*airshipsi2(i)*kfps*kvaux
If airshipz(i)<(airshipsol+h1400) Then
	airshipz(i)=airshipsol+h1400
	airshipz900(i)=max2(airshipz900(i),airshipsol+h1400+h1100)
EndIf
If airshipvie(i)<-100 then
  airshipv(i)=airshipv(i)-0.03*kfps*airshipv(i)+1e-10
  testresetairship(i)
Else
  If airshipv(i)<0.5*vcruise Then airshipv(i)=0.5*vcruise
  If airshipwar(i)>0.1 Then 'Or airshipvie(i)<airshipvie0 Then
    'airshipwar(i)=max2(-1,airshipwar(i)-kfps)
    If  Rnd<0.3*kfps Then
 	     If typeship(i)=4 Then tirb25(i)
    EndIf
    If (target22(i)>0 And i>=7 And i<=18)Or target22(i)>=7 Then
      dirairshipwar2(i)
    Else 	
    	dirairshipwar(i)
    EndIf
    If distairship>5500 Then 
      If dxairship<0 Then
    	   airshipv(i)=max(v,vcruise)+min(v,0.003*distairship)
      Else
      	airshipv(i)=max(v-5,vcruise-3)
      EndIf
    Else
    	airshipv(i)=min(vcruise*4,max(v+5,vcruise))
    EndIf
  Else
    if rnd<0.0031*kfps Then
    	airshipz900(i)=max2(waterz+Rnd*4000,airshipsol+h1400+h1100)
    	If (order>=1 And order<=3 And i>=4 And i<=6) Then
    		airshipz900(i)=max(airshipz900(i),mz-400)
         If distairship<4000 Then airshipz900(i)=max(airshipz900(i),mz-40)
    	EndIf
    EndIf
    mmx=airshipx(i)+5900*airshipco1(i):mmy=airshipy(i)+5900*airshipsi1(i)
    mmz=GetTerrainHeight(mmx,mmy)
    If airshipz900(i)<(mmz+h1400+h700) Then airshipz900(i)=mmz+h1400+h1100
    If (mz-mzsol0)<20000 Then 
    	aux=max(mz+7000.0*(12500.0-(mz-mzsol0))/12500.0,airshipsol+h1400+h1100)
      If airshipz900(i)>aux And distairship>7000 Then airshipz900(i)=aux
    EndIf
    if abs(airshipz(i)-airshipz900(i))<h700 Then
       if airshipo2(i)>kfps then airshipo2(i)-=kfps:setairship(i)=1
       if airshipo2(i)<-kfps then airshipo2(i)+=kfps:setairship(i)=1
       'If Abs(airshipo2(i))<=(1+kfps) Then
       '	If Abs(airshipo2(i))>0.0001 Then airshipo2(i)=0:setairship(i)=1
       'EndIf
    else
       If (airshipz(i))>airshipz900(i) then if airshipo2(i)>-12 then airshipo2(i)-=kfps:setairship(i)=1
       If (airshipz(i))<airshipz900(i) then if airshipo2(i)<12  then airshipo2(i)+=kfps:setairship(i)=1
    end if
    'airshipv(i)=vcruise-vcruise*airshipo2(i)/40
    'airshipo2(i)=max2(-12.1,min2(12.1,airshipo2(i)))
    airshipo2(i)=max2(-30.1,min2(30.1,airshipo2(i)))
    If ((i-3)Mod 4)<>0 Or (i=11 And turnairship11=1) Or (i=15 Or i=1 Or i=3) Then 'dxavion<0.85*dmax2 Then
    	If (order>=1 And order<=3 And i>=4 And i<=6) Or target22(i)>0 Then
    	 If target22(i)>0 Then dirairshipwar2(i) Else dirairship3(i)	
    	 auxv=max(vcruise,v*0.85)'0.9)	
       'If distairship>900 And dxairship<-100 Then '4000 
       If distairship>900 And dxairship<-100 Then '4000 
      	airshipv(i)=airshipv(i)+kfps*((auxv*1.1+12.14)/100-0.01*airshipv(i)-1.0*airshipsi2(i))
        	aux=(airshipo1(i)-o1-180)
        	While aux<-180:aux+=360:Wend
        	While aux>180:aux-=360:Wend
         airshipo1(i)-=0.3*Sgn2(aux)*kfps         
         setairship(i)=1
       Else 
      	airshipv(i)=airshipv(i)+kfps*((auxv+0.05)/100-0.01*airshipv(i)-1.0*airshipsi2(i))
         'If distairship<4000 Then
         	aux=(airshipo1(i)-o1-180)
         	While aux<-180:aux+=360:Wend
         	While aux>180:aux-=360:Wend
            If Abs(aux)<0.5 Then
         	   airshipo1(i)=o1+180':airshipo3(i)=0.7*airshipo3(i)+1e-20
            Else
         	   airshipo1(i)-=0.2*Sgn2(aux)*kfps
            EndIf
            setairship(i)=1
         'EndIf
       EndIf
    	Else
       dirairship2(i)
       If distairship>900 Then 
      	airshipv(i)=airshipv(i)+0.7*kfps*((vcruise+5)/104-0.01*airshipv(i)-1.0*airshipsi2(i))
       Else 
      	airshipv(i)=airshipv(i)+0.7*kfps*((vcruise+0.05)/104-0.01*airshipv(i)-1.0*airshipsi2(i))
       EndIf 
       If i=4 Or i=15 Then 
      	airshipz900(i)=airshipz(3)+50
       ElseIf i=1 Then airshipz900(i)=avionz+50
       Else
    		airshipz900(i)=airshipz(i-1)+50
       EndIf
      EndIf
    Else
    	dirairship(i)
      airshipv(i)=airshipv(i)+0.7*kfps*(vcruise/104-0.01*airshipv(i)-1.0*airshipsi2(i))
    EndIf
    if setairship(i)=1 Then
    	 setairship(i)=0
    	 While airshipo1(i)>180:airshipo1(i)-=360:Wend
    	 While airshipo1(i)<-180:airshipo1(i)+=360:Wend
    	 If Abs(airshipo2(i))<0.51*kfps Then airshipo2(i)=0
       airshipco1(i)=Cos(airshipo1(i)*degtorad):airshipsi1(i)=Sin(airshipo1(i)*degtorad)
       airshipco2(i)=Cos(airshipo2(i)*degtorad):airshipsi2(i)=Sin(airshipo2(i)*degtorad)       
    end if
  end if
end If
order=order0
End Sub 
