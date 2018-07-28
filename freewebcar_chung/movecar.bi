Dim Shared As Integer isoundmoteur=0,isoundmoteur0
Sub soundmoteur
	isoundmoteur0=isoundmoteur
	isoundmoteur+=kfps
	If isoundmoteur0<=4 And isoundmoteur>4 Then
		mcisendstring("play moteur from 0",0,0,0)
	Else 
	  If isoundmoteur0<=8 And isoundmoteur>8 Then
		mcisendstring("play moteur2 from 0",0,0,0)
	  EndIf
	EndIf   
	If isoundmoteur>8 Then isoundmoteur-=8
End Sub
/'Function max2(ByVal x As single,ByVal y As single)As Single
	If x>=y Then Return x Else Return y
End Function
Function min2(ByVal x As single,ByVal y As single) As Single
	If x<=y Then Return x Else Return y
End Function'/
Function sgn2(ByVal x As Single) As Single
	If x>=0 Then Return 1.0 Else Return -1.0
End Function
Dim Shared As Single vmy,mzsol,mznext,mz1,mz11,mzsol0,mzsol2,vmz0,v,volantrot,dmx,dmz,dmy,vmz3,mzsol00
Dim Shared As Single tspeed,mmx,mmz,mmy,do3,do30
Dim Shared As Single vmx2,vmy2,vmz2,dvmx2,dvmy2,dvmz2,vmz
Dim Shared As Single vcruise=30,kvaux=1.0,klevel=1.0,canono2,force=1,rforce=1
Dim Shared As Integer cockpit=1,viseur=0,helice=1,plane,typeavion=3,tourelle,ikey0(256)
Dim Shared As Integer car=0,typetir0,volant=1,level=1
Dim Shared As Single carb0=10000,carb=10000,prop,kprop,volume=550,volume2
Dim Shared As Single degatsmoi=0,to1,to2,to3,tcos1,tsin1,tcos2,tsin2,tcos3,tsin3
Dim Shared As Single kqueue,kroll,kpitch,vqueue,vroll,vpitch,air,altmax
Dim Shared As Single rv,rqueue,rroll,rpitch
Dim Shared As Single poids=1,p1,p2,pz3,py3,vplane,dirv,vkm,v0,vkm2,vkm20,xkm,ykm,zkm
Dim Shared As Integer joystick=0,jet,jetspace
Dim Shared As Single speed,speed1,speed2,tvol,tvol1,tvol2',vcruise=30
Dim Shared As Single queuex,queuey,queuez,pitchx,pitchy,pitchz
Dim Shared As Double taccelere,taccelere2
Sub stopvol
mcisendstring("setaudio avion volume to "+str$(0),0,0,0)
mcisendstring("setaudio avion2 volume to "+str$(0),0,0,0)	
End Sub
Sub setvol
If carb<=0.001 then volume=550
prop=kprop*(volume-550)
If volume>=549 Then
	volume2=min2(1000,int(volume*soundvol*0.05))
Else
	volume2=min2(1000,int(850*soundvol*0.05))	
EndIf
If Time2<taccelere2+0.3 Then volume2=min2(1000,Int(volume2+200*2.8*(taccelere2+0.3-Time2)))
If typeavion=13 Then volume2=Int(volume2*0.5)'ballon
mcisendstring("setaudio avion volume to "+str$(volume2),0,0,0)
mcisendstring("setaudio avion2 volume to "+str$(volume2),0,0,0)
End Sub
Dim Shared As Single volumecar,vcar,volumecar2
Sub setvolcar 'other cars
volumecar2=min2(690,1+int(volumecar*soundvol*0.05))
mcisendstring("setaudio mycar volume to "+str$(volumecar2),0,0,0)
mcisendstring("setaudio mycar2 volume to "+str$(volumecar2),0,0,0)
End Sub
Dim Shared As Single kjoy=0.8,kmotor=1
Dim Shared As String avion,avionname(20)
Sub initavion
Dim As String soundfic
If typeavion<1 Then typeavion=8
If typeavion>15 Then typeavion=1
avionname(0)="car"
avionname(1)="avion1"
avionname(2)="corsair"
avionname(3)="avion3"
avionname(4)="avion4"
avionname(5)="avion5"
avionname(6)="zero"
avionname(7)="jet3"
avionname(8)="jet4"
avionname(9)="jet5"
avionname(10)="space1"
avionname(11)="space2"
avionname(12)="c150"
avionname(13)="ballon"
avionname(14)="737"
avionname(15)="copter"
kjoy=1
kmotor=1
If car<=0 Then
	avion=avionname(typeavion)
Else
	If car=1 Then 
		avion="ford_mustang"'"car"
		kjoy=0.75
		kmotor=1.7
	ElseIf car=2 Then 
		avion="fiat"
		kjoy=0.93
		kmotor=1
	ElseIf car=3 Then 
		avion="nissan"'car3
		kjoy=0.88
		kmotor=1.1
	ElseIf car=4 Then 
		avion="chevy"'"car3"
		kjoy=0.78
		kmotor=1.4
	Else 
		avion="cadillac"
		kjoy=0.77
		kmotor=1.38
	EndIf
EndIf
If car>0 Then kmotor*=1.1
kpitch=1:kroll=1:kqueue=1:kprop=1
poids=1
vcruise=18
altmax=70000'30000
jet=0:jetspace=0
Dim As Single kaux=0.18'0.18
rroll=kaux:rpitch=kaux:rqueue=kaux:rv=0.01 'resistances
'if avion$="avion3" then
   kpitch=0.7:kroll=0.7:kqueue=0.7:kprop=1.5
   poids=1.2
   vcruise=32
   altmax=70000'10000
'end If	
If avion="737" then
   kpitch=0.5:kroll=0.5:kqueue=0.5:kprop=3'1.5
   poids=2.2
   vcruise=53
   altmax=150000'10000
End If	
If avion="c150" then
   kpitch=0.7:kroll=0.7:kqueue=0.7:kprop=1.25'1.5
   poids=0.85'1.2
   vcruise=22'32
   altmax=70000'10000
End If	
If avion="car" Then
   kpitch=0.7:kroll=0.7:kqueue=0.7:kprop=1.7
   poids=1.2
   vcruise=32
   altmax=70000
End if
If avion="car2" Then
   kpitch=0.7:kroll=0.7:kqueue=0.7:kprop=2.0
   poids=1.2
   vcruise=40
   altmax=70000
End If
If avion="car3" Then
   kpitch=0.7:kroll=0.7:kqueue=0.7:kprop=2.5
   poids=1.2
   vcruise=40
   altmax=70000
End if
If avion="ballon" Then
   kpitch=0.8:kroll=2:kqueue=2:kprop=1.5
   poids=0.15
   vcruise=5.0
   altmax=70000
End If
If avion="copter" Then
   kpitch=0.8:kroll=2:kqueue=2:kprop=1.5
   poids=0.15
   vcruise=9.0'5.0
   altmax=70000
End If
If avion="avion1" Then
   kpitch=0.85:kroll=1:kqueue=1:kprop=1.05
   poids=0.8
   vcruise=19.5
   altmax=70000
end if
if avion="corsair" then
   kpitch=0.95:kroll=1:kqueue=1:kprop=1.25
   poids=0.9
   vcruise=22
   altmax=70000
end if
if avion="avion3" then
   'kpitch=0.7:kroll=0.7:kqueue=0.7:kprop=1.5
   kpitch=0.8:kroll=0.8:kqueue=0.8:kprop=1.35
   poids=1.0'1.2
   vcruise=25'32
   altmax=70000
end if
if avion="avion4" then
   'kpitch=0.7:kroll=1.5:kqueue=0.7:kprop=1.5
   kpitch=0.7:kroll=0.9:kqueue=0.9:kprop=1.375
   poids=1.0
   vcruise=26
   altmax=70000
end if
if avion="avion5" then
   kpitch=1:kroll=1:kqueue=1:kprop=1.4
   poids=1
   vcruise=28
   altmax=70000
end if
if avion="zero" Then'zero
   kpitch=0.9:kroll=0.9:kqueue=1:kprop=1.25'1.5
   poids=0.9
   vcruise=22'30'22
   altmax=70000
end if
If avion="jet2" then
   kpitch=0.7:kroll=1:kqueue=0.7:kprop=1.25
   poids=1.2
   vcruise=27
   altmax=100000:jet=1
end if
if avion="jet3" then
   'kpitch=0.7:kroll=0.7:kqueue=0.7:kprop=1.5
   kpitch=0.7:kroll=0.87:kqueue=0.7:kprop=1.5
   poids=1'1.2
   vcruise=30'35
   altmax=100000:jet=1
end if
if avion="jet4" then
   kpitch=0.7:kroll=1.405:kqueue=0.7:kprop=1.6
   poids=1.2
   vcruise=32
   altmax=100000:jet=1
end If
if avion="jet5" then
   kpitch=0.7:kroll=1.405:kqueue=0.7:kprop=1.9
   poids=1.2
   vcruise=40'34
   altmax=100000:jet=1
end If
if avion="space1" then
   kpitch=0.7:kroll=1.0:kqueue=0.7:kprop=2.95
   poids=1.1
   vcruise=48'34
   altmax=120000:jet=1:jetspace=1 
end If
if avion="space2" then
   kpitch=0.7:kroll=1.0:kqueue=0.7:kprop=2.95
   poids=1.2
   vcruise=48'34
   altmax=120000:jet=1:jetspace=1
end If
altmax=altmax/2.2'2.5
soundfic="sounds/"+avion+".mp3"
If avion="corsair" Then soundfic="sounds/avion2.mp3"
If avion="737" Then soundfic="sounds/jet3.mp3"
If avion="c150" Then soundfic="sounds/avion1.mp3"
If avion="ballon" Then soundfic="sounds/avion5.mp3"
If avion="copter" Then soundfic="sounds/copter.mp3"
If avion="zero" Then soundfic="sounds/avion3.mp3"
If avion="jet5" Then soundfic="sounds/jet4.mp3"
If avion="space1" Then soundfic="sounds/jet4.mp3"
If avion="space2" Then soundfic="sounds/jet4.mp3"
mcisendstring("close avion",0,0,0)
mcisendstring("close avion2",0,0,0)
mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" alias avion",0,0,0)
mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" alias avion2",0,0,0)
soundavion
speed1=0:speed2=0
setsoundvol
setvol
force=min(10.0,((vcruise/19.5)^1.25)*((kprop/1.05)^2))
If car>=1 Then force=1
If plane=0 Then stopsoundavion:force=1
rforce=force^0.7
End Sub
Sub queue2
joy*=kfps2
joy=joy*kqueue*max(jetspace-0.6,air)
vqueue=vqueue+joy
End Sub
Sub queue3
joy*=kfps2
If Abs(o2)<50 Or Abs(o2)>86 Or plane=0 Then 
   o2=o2-sin3*joy '-sin2*abs(sin3)*joy
   o1=o1+cos3*joy
EndIf 
	joy*=degtorad
   dmx+=queuex*joy
   dmy+=queuey*joy
   dmz+=queuez*joy   
End Sub
Sub roll2
joy*=kfps2
If mz<=(mzsol0) And (orbit=1 Or planet=0) Then
  o1=o1+joy*2/(1.2+abs(v))
Else	
  joy=joy*kroll*max(jetspace-0.6,air)
  vroll=vroll+joy
EndIf 
End Sub
Sub roll3
joy*=kfps2
o3=o3+joy
End Sub
Sub pitch2
joy*=kfps2
If car>=1 Then joy=0
joy=joy*kpitch*max(jetspace-0.6,air)
vpitch=vpitch+joy
End Sub
Sub pitch3
joy*=kfps2
If Abs(o2)<50 Or Abs(o2)>86 Or plane=0 Then 
   o2=o2+cos3*joy '-sin2*abs(sin3)*joy
   o1=o1+sin3*joy
   o3=o3+sin3*sin2*joy
EndIf
	joy*=degtorad
	dmx+=pitchx*joy
	dmy+=pitchy*joy
	dmz+=pitchz*joy 
End Sub
Sub keyLeft(ByVal joy0 As Single=2)
joy=joy0*kjoy
if tourelle=1 Then
	to1=to1+joy*2
Else
   If car>=1 Then
   	if abs(v)<1 And joy0>1 Then soundmoteur
      If tautopilot>0 Or typeautopilot=1 Then
      	volantrot+=joy*20*kfps'40
      Else
      	volantrot+=joy*7*min(2.5,kfps)
      EndIf
   	joy=joy*4*Sgn2(dirv)
   	queue2
   Else  	
      volantrot+=joy*40
   	joy=1.9*joy:klevel=0.4
      roll2
   EndIf    
EndIf
End Sub
Sub keyRight(ByVal joy0 As Single=2)
joy=-joy0*kjoy
if tourelle=1 Then
	to1=to1+joy*2
Else
   If car>=1 Then
   	if abs(v)<1 And joy0>1 Then soundmoteur
      If tautopilot>0 Or typeautopilot=1 Then
      	volantrot+=joy*20*kfps'40
      Else
      	volantrot+=joy*7*min(2.5,kfps)
      EndIf
   	joy=joy*4*Sgn2(dirv)
   	queue2
   Else  	
      volantrot+=joy*40
   	joy=1.9*joy:klevel=0.4
      roll2
   EndIf    
EndIf
End Sub 
Sub keyleft2
joy=1*kjoy
if tourelle=1 Then
	to1=to1+joy*2
Else
   volantrot+=joy*40
   If car>=1 Then
   	if abs(v)<1 then soundmoteur
   	joy=joy*4*Sgn2(dirv)
   EndIf
	joy=1.5*joy:klevel=0.4
   queue2
EndIf
End Sub 
Sub keyright2
joy=-1*kjoy
if tourelle=1 Then
	to1=to1+joy*2
Else
   volantrot+=joy*40
   If car>=1 Then
   	if abs(v)<1 then soundmoteur
   	joy=joy*4*sgn2(dirv)
   EndIf
	joy=1.5*joy:klevel=0.4
	queue2
EndIf
End Sub
Sub keyup
joy=-2*kjoy
If tourelle=1 Then
	to2=to2-joy*2
Else
	If car>=1 Then
		if abs(v)<2.5 then soundmoteur:mx+=dmx*4*kfps:my+=dmy*4*kfps
	Else 
   	joy=1.5*joy:klevel=0.4
	   pitch2
	EndIf    
EndIf
End Sub
Sub keydown
joy=2*kjoy
If tourelle=1 Then
	to2=to2-joy*2
Else
	If car>=1 Then
		If v>0 Then v=max(0.0,v-0.04*kfps):vautopilot=v
		if v>=0 And v<0.25 then soundmoteur:mx-=dmx*1.2*kfps:my-=dmy*1.2*kfps
		If v<0 And v>-2 then soundmoteur:mx-=dmx*1*kfps:my-=dmy*1*kfps
	Else 
	   joy=1.5*joy:klevel=0.4
   	pitch2
   EndIf  	
EndIf
End Sub
Sub roll
joy=joy1dx/5000
if tourelle=1 Then
	to1=to1+joy
Else
   If mz<=mzsol0 And jetspace=0 Then joy=joy*6
   volantrot+=joy*2.5
   joy=joy*min(2.2,max(jetspace+0.1,(v+sgn2(dirv)*2.4)/vcruise))
   If car<=0 Then
   	joy*=air
   	roll2 
   Else
   	if abs(v)<1 Then
   		soundmoteur:joy=2.7*joy
   	EndIf
   	joy=0.7*joy
   	queue2 
   EndIf
EndIf
End Sub
Sub pitch
joy=joy1dy/5000
if tourelle=1 Then
	to2=to2+joy
Else
	If car>=1 Then
		if abs(v)<9 Then
			soundmoteur:mx-=dmx*joy*0.8*kfps:my-=dmy*joy*0.8*kfps
		EndIf
	Else 
      joy=joy*min(2.2,max(jetspace+0.1,v/vcruise))
   	joy*=air
      pitch2
   EndIf    
EndIf
End Sub
Sub queuer
joy=joy1dr/30000'40000
if tourelle=1 Then
	to1=to1+joy
Else
	If car>=1 Then
		joy=joy*10
	EndIf
   volantrot+=joy*3
   If car>=1 Then
   	joy=joy*max(0.3,v/vcruise):If Abs(v)<1 Then soundmoteur
   Else 	
   	joy=joy*min(2.2,max(jetspace+0.1,v/vcruise))
   	joy*=air
   EndIf
   queue2
EndIf
End Sub
Sub queue
joy=joy1dz/30000'40000
if tourelle=1 Then
	to1=to1+joy
Else
	If car>=1 Then joy=joy*10
   volantrot+=joy*3
	joy=joy*min(2.2,max(jetspace+0.1,v/vcruise))
  	joy*=air
   queue2
EndIf
End Sub
Sub accelere
taccelere2=Time2	
'If time2>taccelere and car>0 Then
'	taccelere=max(time2-0.12,taccelere+kfps*0.12)
'	Exit Sub
'EndIf
taccelere=time2+0.5 
volume=min2(2550,volume+30*kfps*kmotor)
setvol
End Sub 
Dim Shared As Single suspension
Dim Shared As Double tdecelere
Sub decelere
If volume>=550 Then volume=max2(550,volume-30*kfps)
If piste=1 Then
	suspension=2.5
Else
	suspension=1.5
EndIf
if mz<=mzsol0 Then
	If car>0 Then
		v=v-v*0.1*0.5*kfps+0.000001-0.03*kfps
	Else 
		v=v-v*0.1*0.125*kfps+0.000001-0.008*kfps
	EndIf
	If Abs(v)<0.5 Then v=0:vmx2=0:vmy2=0
EndIf
If time2>tdecelere+2 And time2<tdecelere+4 Then
	tdecelere=time2-2.1
	If car>0 Then
		v=v-v*min(0.9,0.1*0.25*kfps)+0.000001
	Else 
		v=v-v*min(0.9,0.1*0.06*kfps)+0.000001
	EndIf
	If Abs(v)<0.5 Then v=0:vmx2=0:vmy2=0
ElseIf time2>tdecelere+4.1 Then 
	tdecelere=time2	
EndIf
If jetspace=1 Then 
   volume=max2(550-1100,volume-60*kfps)
EndIf
setvol
End Sub 
Sub brakes
If piste=1 Then
	suspension=2.5
Else
	suspension=1.5
EndIf
If v>12 Then suspension=2
If mz<=mzsol0+0.01 Then
	If car=0 Then
		v=v-v*min(0.9,0.1*kfps)
	Else 
		Var kv=min(0.9,0.03*kfps)
		v-=(v)*kv
		vmx2-=(vmx2)*kv
		vmy2-=(vmy2)*kv
	EndIf
	If Abs(v)<0.5 Then v=0:vmx2=0:vmy2=0
EndIf
setvol
End Sub 
Sub setspeed
If tspeed>0 Then
	tspeed=0
Else
 'speed=int(min(2200,max(550,volume*0.5+v*1000/25)))
 speed=int(min2(2190,max2(550,volume*0.5+v*700/vcruise)))
 'carb=min(1020.0,carb)
 If carb<1001 And prop>1000 And car>0 Then
 	speed=Int(min2(2190,speed*2))
 	volume-=kfps*50
 EndIf
 tvol=time0
 If abs(speed1-speed)>20 then
  if tvol>(tvol1+100) or tvol<tvol1 then
    tvol1=tvol
    tvol2=tvol
    speed1=speed
    mcisendstring("set avion speed "+str$(speed),0,0,0)
    mcisendstring("play avion from 1000 repeat",0,0,0)
    tspeed=1
  EndIf 
 EndIf 
 If abs(speed2-speed1)>20 then
  if tvol>(tvol2+70) or tvol<tvol2 then
    tvol2=tvol
    speed2=speed1
    'r$ = mcisend$("stop fictoplay2")
    mcisendstring("set avion2 speed "+str$(speed1),0,0,0)
    'r$ = mcisend$("seek fictoplay2 to start")
    mcisendstring("play avion2 from 0 repeat",0,0,0)
    tspeed=1
  EndIf
 EndIf
EndIf 
End Sub
Dim Shared As Integer speedcar,speedcar1,speedcar2
Dim Shared As Double tspeedcar,tvolcar,tvolcar1,tvolcar2
Sub setspeedcar
If tspeedcar>0 Then
	tspeedcar-=kfps/2
Else
 'speedcar=int(min(2200,max(550,volume*0.5+v*1000/25)))
 speedcar=int(min2(2190,max2(550,vcar*150)))
 tvolcar=time0
 If abs(speedcar1-speedcar)>20 then
  if tvolcar>(tvolcar1+100) or tvolcar<tvolcar1 then
    tvolcar1=tvolcar
    tvolcar2=tvolcar
    speedcar1=speedcar
    mcisendstring("set mycar speed "+str$(speedcar),0,0,0)
    mcisendstring("play mycar from 1000 repeat",0,0,0)
    tspeedcar=1
  EndIf 
 EndIf 
 If abs(speedcar2-speedcar1)>20 then
  if tvolcar>(tvolcar2+70) or tvolcar<tvolcar2 then
    tvolcar2=tvolcar
    speedcar2=speedcar1
    'r$ = mcisend$("stop fictoplay2")
    mcisendstring("set mycar2 speed "+str$(speedcar1),0,0,0)
    'r$ = mcisend$("seek fictoplay2 to start")
    mcisendstring("play mycar2 from 0 repeat",0,0,0)
    tspeedcar=1
  EndIf
 EndIf
EndIf 
End Sub
Dim Shared As Integer mapdisplay=0
Dim Shared As Double tcrashz,mzcrash
Sub testcrash
If guitestkey(vk_up) Or guitestkey(vk_down) Or guitestkey(vk_left) or guitestkey(vk_right) Then Exit Sub 
If plane=1 And mapdisplay<>4 Then 
	If Abs(v)>4 Then
		soundcrash
	   If plane>0 And car=0 Then tcrashz=Timer:mzcrash=mz+300 
	   If car=3 Then degatsmoi+=Rnd*30 Else degatsmoi=degatsmoi+255 EndIf 
   	'If degatsmoi>1000 Then
   	'	vie=0:o2=0:o3=0:v=0:vmz3=0
   	'Else
   		Sleep 1300
	      If prop>50 Then
	      	v=vcruise:mx-=dmx*40:mz-=dmz*40-70:my-=dmy*40:o1=o1+Sgn(Rnd-0.5)*45*0.5
	      Else 
	         mx-=dmx*40:my-=dmy*40:mz-=dmz*40
	         If myboat=0 Then o1=o1+Sgn(Rnd-0.5)*45*0.5
	      EndIf
	      'irrsetnodeposition(cameranode,mx,mz,my)
	      vmz3=0
	      o2=0
      'EndIf 
	Else 
         mx-=dmx*10:my-=dmy*10:mz-=dmz*10-40
         o2=0
	EndIf
	v=0
EndIf
End Sub 
Dim Shared As Integer aterrissage,tdrawwind,piste0
Dim Shared As Single windvx,windvy,windco1,windsi1
Dim Shared As Single pistez,pz
Dim Shared As Single dmmx,dmmy,dmmz,o22,o33,sin22,sin33,vmx1,vmy1,vmz1,mzh=25
Sub movewind()
If tdrawwind=1 Then
	windvx+=(3*windco1-windvx)*rv*kfps
	windvy+=(3*windsi1-windvy)*rv*kfps
   If mz>(mzsol0+0.01) Then  
	   mx+=windvx*kfps
	   my+=windvy*kfps
   Else
   	windvx=0.5*windvx+1e-10
   	windvy=0.5*windvy+1e-10
   EndIf 
EndIf	
End Sub
Dim Shared As Double timemove0,timemove
Sub movespace
'If carb<=0.1 then prop=0:volume=550 else carb=max(0.01,carb-0.000003*prop*v*kfps)
If carb<=0.1 Then
	prop=0:volume=550 
ElseIf jetspace=0 Then 
	carb=max(0.01,carb-0.00009*Abs(prop)*kfps)
Else 
	carb=max(0.01,carb-0.00005*Abs(prop)*kfps)
EndIf

p1=0'-poids*sin2
p2=0'poids*cos2
py3=0'p2*sin3
pz3=0'p2*cos3
'vcruise=18
'altmax=10000
'air=max(0.1,min(2.0,(altmax-mz)/altmax))
air=1'max(0.1,(altmax)/(altmax+Abs(mz)))
Var air0=air
'If v>1000.0/17 Or tsphere=1 Or planet=1 Then
'	If jet=1 Then air*=0.6 Else air0=0
'EndIf
'vplane=air*poids*Abs(v)/vcruise
'pz=-vplane*cos2*cos3+poids

joy=sin3*cos2*1.4:queue2
p1=0

vroll=vroll-min(0.4,rroll*air*kfps2)*vroll+1e-20 'pour eviter float underflow
vpitch=vpitch-min(0.4,rpitch*air*kfps2)*vpitch+1e-20
vqueue=vqueue-min(0.4,rqueue*air*kfps2)*vqueue+1e-20
Dim As Single kaux=0.12
joy=kaux*vroll:roll3
joy=kaux*vpitch:pitch3
joy=kaux*vqueue:queue3
sin2=sin(o2*degtorad)
Var rv2=rv 
If v>950.0/17 And v<1000.0/17 Then
 If tsphere=0 And planet=0 Then 	
	rv2=min(0.99,rv+0.07/(1001.0-v*17))
	If jet=0 Then air0*=rv/rv2
 EndIf 
ElseIf deepspace=1 Then
	rv2=rv/8
   deepspace=0
EndIf
If jetspace=1 Then air0=(air0+2)/3
Var vmax=3000.0/max(0.1,min(1.0,air*1.7))
If jetspace=1 Then vmax=20000
v=max(-10.0,min(vmax/17,v+0.7*kfps*(air0*prop*poids/8000-air*v*rv2+p1)+1e-20))
'v=v+air*prop*poids/8000-air*v/100+p1
'v=v+prop/4000-0.02*v
If v<0 Then v=v-1.4*kfps*air*v*rv+1e-20
If v>-0.09 And v<0.03 then v=0
'If v0<=1000.0/17 And v>1000.0/17 Then soundshoot
'v0=v
vmx1=v*cos1:vmy1=v*sin1
vmx2=vmx1*cos2:vmy2=vmy1*cos2:vmz2=v*sin2
'kvaux=0.05
timemove0=timemove
timemove=Timer
Var dkfps=min(6.0,(timemove-timemove0)*30)'kfps
mx+=vmx2*dkfps*kvaux:my+=vmy2*dkfps*kvaux:mz1+=vmz2*dkfps*kvaux
End Sub
Dim Shared As Integer ntownnear,ntownnear0
Dim Shared As Single do22,do33
Sub move
If avion="ballon" Then
	o3=max(-30.0,min(30.0,o3))
	o2=max(-47.0,min(28.0,o2))
	vmz3=0
	mz1+=max(0.0,(v+prop*0.0003)*sin2*1.3*kfps)
	If o3>15 Then o1+=kfps*(o3-15)*0.0085
	If o3<-15 Then o1+=kfps*(o3+15)*0.0085
	If guitestkey(vk_left) Or guitestkey(vk_right) Then
		If o2>0 Then o2=max(0.0,o2-kfps)
	EndIf
EndIf
If avion="copter" Then
	vmz3=0
	Var si2=sin2,si22=(o2+19)*0.01
	If sin2<0.9 Then
		If o2>-20 Then si2=-0.0022
		If o2>0 Then si2=-0.0018
		If (prop<2000 And o2>-10 And o2<20) Then si22=0.28
		si22=min(si22,0.45)
		If piste=0 Then
			v=max(-8.0,min(30.0,v-(si22-0.09)*prop*0.002*kfps))
		Else
			v=max(-8.0,min(30.0,v+(0.03)*prop*0.002*kfps))
		EndIf
	EndIf
	mz1+=max(-1.5*kfps,(max(0.0,v)+prop*0.0003)*(0.002+si2)*kfps)
	If o2<10 Or prop<1000 Or  prop>1500 Then mz1-=(1500-prop)*0.0015*kfps
	If Abs(sin3)>0.6 Then o2=max(-85.0,o2-Abs(sin3*cos2)*0.25*kfps)
	If o2<-80 Then o1+=o3:o3=0	
	If o3>15 Then o1+=kfps*(o3-15)*0.0085
	If o3<-15 Then o1+=kfps*(o3+15)*0.0085
EndIf

'movewind()
'If carb<=0.1 then prop=0:volume=550 else carb=max(0.01,carb-0.000003*prop*v*kfps)
If carb<=0.1 Then
	prop=0:volume=550 
ElseIf jetspace=0 Then 
	carb=max(0.01,carb-0.00003*Abs(prop)*kfps)
Else 
	carb=max(0.01,carb-0.00002*Abs(prop)*kfps)
EndIf
If (mz>=mzsol00+0.102) Then aterrissage=1
If mz<=(min(mzsol0,mzsol00+10)+0.1) Then
   'ysol0=NGetTerrainHeight(Terrain,x,z)+yh
   'piste=0'mytestairport() Or piste
   piste=piste0
   If 0 then'piste>=1 Then
    o22=Rnd*0.14:o33=0:If Abs(v)<1 Then o22=0
   Else  	
    mmy=20
    mmz=getterrainheight(mx,my)
    dmmy=getterrainheight(mx+mmy*cos1,my+mmy*sin1)-mmz'+mzh-mzsol0'+yh-ysol0
    o22=Atn(dmmy/mmy)*radtodeg
    dmmx=getterrainheight(mx-mmy*sin1,my+mmy*cos1)-mmz'+mzh-mzsol0'+yh-ysol0
    o33=-Atn(dmmx/mmy)*radtodeg
   EndIf
   sin22=Sin((o2-o22)*degtorad)
   sin33=Sin((o3-o33)*degtorad)
   'dmmz=(vmz3+v*sin22)
	dmmz=v*sin22+vmz3*Cos(o22*degtorad)
   'If (vh<-1 || cos3<0.85){setcrash();};
   o3=o33
   vmz3*=-0.85	
   if aterrissage=1 then
      aterrissage=0
      'if v*sin2>2.5 then
      If (dmmz<(-2.5) Or cos3<0.85) Then
         v=99:testcrash'soundcrash:Sleep 2000
         O2=0:o3=0:o22=0:o33=0
         If prop>50 Then
         	mzsol00+=200:mz=mzsol00:v=vcruise
         Else
         	mz=mzsol00:v=Rnd*20
         EndIf
         v=v*0.85+1e-20:o2=o22'-(o2-o22):sin2=Sin(o2*degtorad)
         'degatsmoi=degatsmoi+350
      Else
   		soundpneu
   		If mz<=(waterz+mzh) Then 
   			If ntownnear<2 Then soundwaterwave
   		EndIf
         v-=v*0.0002*kfps'v*0.85+1e-20
      End if
   end If
   If o2<-0.4 Then
   	o2*=-0.8
   Else
   	o2=max(-0.1,o2)
   EndIf
   'mz=mzsol0
   mz1=mzsol0+0.09
   'piste=0
   'for ipiste=1 to npiste
   '   if abs(ypiste(ipiste)-my)<100 then
   '     if abs(xpiste(ipiste)-mx)<1500 then
   '        piste=1
   '        exit for
   '     end if
   '   end if
   'next ipiste
'   if sin2>=0.1 then
	'if ((o2-o22)<-1){o2=0.85*(o22-o2);}else{o2=o22;}
   /'if (dmmz)<-0.23 Then '0.3 Then
      o2=o22-0.8*(o2-o22)
   else
      if (piste=1 And (dmmz)>-0.14) or (dmmz)>-0.07 then
         o2=o22:vpitch=0
      else
         o2=o22-0.87*(o2-o22)
      end if
   end if '/
   if Abs(sin33)>0.08 then
      o3=o33-0.75*(o3-o33)
   else
      o3=o33
      If piste>=1 Then
      	o3=0:sin3=0
      	If plane>0 And car=0 Then o2=max(-0.1,o2)
      EndIf
   end If
   if piste=0 Then
     If Rnd<0.75*kfps Then 	
       do22=(Rnd-0.5)*0.74*min(1.1,abs(v)/5)
       do33=o3+(Rnd-0.5)*0.74*min(1.1,abs(v)/2)
     EndIf
     o2+=do22
     o3+=do33
   end If
   'cos2=Cos(o2*degtorad)
   sin2=sin(o2*degtorad)
   sin3=sin(o3*degtorad)
   cos3=Cos(o3*degtorad)
Else
   If Rnd<0.75*kfps Then  
     do22=(Rnd-0.5)*0.3*min(1.3,abs(v)/60)
     do33=(Rnd-0.5)*0.6*min(1.3,abs(v)/60)
   EndIf
   o2+=do22
   o3+=do33
   'cos2=Cos(o2*degtorad)
   sin2=sin(o2*degtorad)
   sin3=sin(o3*degtorad)
   cos3=Cos(o3*degtorad)
EndIf
Var kpoids=1000000/(1000000+mz)
p1=-poids*sin2*kpoids*kpoids
p2=poids*cos2*kpoids*kpoids
py3=p2*sin3
pz3=p2*cos3
'vcruise=18
'altmax=10000
'air=max(0.1,min(2.0,(altmax-mz)/altmax))
'air=max(0.1,(altmax)/(altmax+Abs(mz)))
air=max(0.1,(altmax)/(altmax+Abs(mz-mzsol0*0.79*mzsol0/max(3000.0,mzsol0))))'0.79
Var air0=air
If v>1000.0/17 Or tsphere=1 Then
	If jet=1 Then air*=0.6 Else air0=0
EndIf
vplane=air*poids*Abs(v)/vcruise
pz=-vplane*cos2*cos3+poids

joy=py3:queue2
If jetspace=0 Then
	joy=(vplane-pz3):pitch2
ElseIf tstation=0 Then  
	joy=(vplane-pz3*air0)*0.7:pitch2
	p1-=(v*v*cos2*cos2)/(1400000+mz)
ElseIf tstation>0 and vie>1 Then
	p1=0
EndIf
vroll=vroll-min(0.4,rroll*air*kfps2)*vroll+1e-20 'pour eviter float underflow
vpitch=vpitch-min(0.4,rpitch*air*kfps2)*vpitch+1e-20
vqueue=vqueue-min(0.4,rqueue*air*kfps2)*vqueue+1e-20
Dim As Single kaux=0.12
joy=kaux*vroll:roll3
joy=kaux*vpitch:pitch3
joy=kaux*vqueue:queue3
sin2=sin(o2*degtorad)
Var rv2=rv,k17=17*0.33
If v>950.0/k17 And v<1000.0/k17 Then
 If tsphere=0 Then 	
	rv2=min(0.99,rv+0.07/(1001.0-v*k17))
	If jet=0 Then air0*=rv/rv2
 EndIf 
EndIf
If jetspace=1 Then air0=(air0+2)/3
Var vmax=3000.0/max(0.1,min(1.0,air*1.7))
v=max(-10.0,min(vmax/k17,v+0.7*kfps*(air0*prop*poids/8000-air*v*rv2+p1)+1e-20))
'v=v+air*prop*poids/8000-air*v/100+p1
'v=v+prop/4000-0.02*v
If v<0 Then v=v-1.4*kfps*air*v*rv+1e-20
If v>-0.09 And v<0.03 then v=0
If v0<=1000.0/k17 And v>1000.0/k17 Then
	If tsphere=0 Then soundshoot
EndIf
v0=v
vmx1=v*cos1:vmy1=v*sin1
vmx2=vmx1*cos2:vmy2=vmy1*cos2:vmz2=v*sin2
'If v<7 And mz>(mzsol0+0.1) And piste=0 Then 'stall
'   vmz3=vmz3-0.5-0.05*vmz3:vmz2=vmz2+vmz3
'Else
'   vmz3=0
'EndIf 
if (mz>(mzsol00+0.01)) And tstation=0 And (orbit=1 Or planet=0) Then
  If (v<(vcruise/7)) Then
  	 vmz3=max(-5.0,vmz3-kfps*(0.5*pz+(1+Abs(cos2*cos3))*0.04*vmz3))
  Else
    vmz3=max(-1.0,vmz3-kfps*(0.015*pz+(1+abs(cos2*cos3))*0.04*vmz3))
  EndIf 
  If(o3>0.1)Then
  	o3-=kfps*0.03
  ElseIf(o3<-0.1) Then
  	o3+=kfps*0.03
  Else
  	o3=0
  EndIf 	
Else 
  vmz3=0
EndIf   
vmz2=vmz2+vmz3
kvaux=1.0'5.9
timemove0=timemove
timemove=Timer
Var dkfps=min(6.0,(timemove-timemove0)*30)*0.4'0.6'kfps
If tautopilot=0 Then dkfps*=1.2

mx+=vmx2*dkfps*kvaux:my+=vmy2*dkfps*kvaux:mz1+=vmz2*dkfps*kvaux
mz11=min(mz1,mz11)
End Sub
Dim Shared As Double ttonneau
Dim Shared As Integer rebond,tonneau,pneu,ipneu,mytestbridge,testweb
Dim Shared As Single do300
Dim Shared As Single vm20,vm2,do222,o222,ko222=1,cos222,sin222,scalexy=1,scalexyh=1
Declare Function gettestroadtree(x As Single,y As Single)As Integer
Declare Function gettestnear0road(x As Single,y As Single,layer As Integer=0,inear0 As Integer=0)As Integer
Function getterrainheightpiste(x As Single,y As Single)As Single
Var z=getterrainheight(x,y)-8
If gettestnear0road(x,y)>=1 Then z+=8
Return z
End Function
Sub movecar 
Dim As Single carmx,carmy,mmy1,mmy2,mmy3,mmy4,o20,o30',o33
If time2<timeinit+10 Then Exit Sub 
If volume<549 Then 
	volume=min2(550,volume+1+30*kfps)
	setvol
EndIf
If orbit=0 And planet=1 Then 
	movespace
ElseIf car<=0 And (piste=0 Or v>vcruise*0.134) Then
   If plane=1 Then move
Else
	carb=max(0.01,carb-0.00002*Abs(prop)*kfps)
   carmx=32.0:carmy=24.0
   mmx=carmx*cos1+carmy*sin1
   mmy=carmx*sin1-carmy*cos1
   mmy1=getterrainheightpiste(mx+mmx,my+mmy) 'front left
   mmy4=getterrainheightpiste(mx-mmx,my-mmy) 'back right
   mmx=carmx*cos1-carmy*sin1
   mmy=carmx*sin1+carmy*cos1
   mmy2=getterrainheightpiste(mx+mmx,my+mmy) 'front right
   mmy3=getterrainheightpiste(mx-mmx,my-mmy) 'back left
   If mytestbridge=1 Then
   	o2=0
   ElseIf mz<=mzsol0+0.1 Then
     mz=mzsol0
     o20=o2:o30=o3 
     'piste=mytestairport() Or piste
     piste=piste0
     If 0 Then'piste=1 Then
      'o2=0:o3=Cos((o1-boato1(10))*degtorad)*boato3(10)+Sin((o1-boato1(10))*degtorad)*boato2(10)
      o2=atn( (max(mmy1,mmy2)-max(mmy3,mmy4))/(carmx+carmx) )*radtodeg
      o3=Atn( (max(mmy1,mmy3)-max(mmy2,mmy4))/(carmy+carmy) )*radtodeg
     Else  	
      'o2=atn( (max(mmy1,mmy2)-max(mmy3,mmy4))/(carmx+carmx) )*radtodeg
      'o3=Atn( (max(mmy1,mmy3)-max(mmy2,mmy4))/(carmy+carmy) )*radtodeg
      o2=atn( ((mmy1+mmy2)/2-(mmy3+mmy4)/2)/(carmx+carmx) )*radtodeg
      o3=Atn( ((mmy1+mmy3)/2-(mmy2+mmy4)/2)/(carmy+carmy) )*radtodeg
      If Rnd<0.79*kfps Then 
       If piste=0 Then 
       	'do22=(Rnd-0.4)*0.94045*min(1.1,abs(v)/4.5)
         'do33=(Rnd-0.5)*1.1045*min(1.1,abs(v)/4.5)
       	do22=(Rnd-0.4)*3*0.94045*min(1.1,abs(v)/4.5)
         do33=(Rnd-0.5)*3*1.1045*min(1.1,abs(v)/4.5)
       Else
       	Var rnd2=Rnd,rnd3=Rnd
       	do22=(Rnd-0.4)*rnd2*Rnd2*3*0.4845*min(1.1,Abs(v)/4.5)
         do33=(Rnd-0.5)*Rnd3*Rnd3*2*0.4855*min(1.1,Abs(v)/4.5)
       EndIf 	
      EndIf  
      o2=o2-do22:o222-=do22'(o2-do22)-o2
      o3=o3+do33
      If do22>(0.85-0.4)*0.94045*1.1 Then
      	If Rnd<0.84 Then
      		addcarsmoke()
      	Else
      		soundpneu()
      	   If Rnd<0.80 Then soundmetal()
      	EndIf
      EndIf
     EndIf 
     if rebond=1 Then
      rebond=0
      If o20<o2 Then o2-=0.34*(o20-o2)
      o3-=0.34*(o30-o3)
      o2=o2+(Rnd-0.5)*5
      o222+=o2-o20
      o3=o3+(rnd-0.5)*5
     End If
     o33=o3
     cos2=Cos(o2*degtorad)
     sin2=sin(o2*degtorad)
     cos3=Cos(o3*degtorad)
     sin3=sin(o3*degtorad)
   end If
'poids=1
'carb=10000
'if carb<=0 then prop=0:volume=550 else carb=max2(0,carb-0.000005*prop*v)
'mmymin=-10 '-12 -7
p1=-poids*sin2
p2=poids*cos2
pz3=p2*sin3
py3=p2*cos3
'vcruise=18
'altmax=10000
'air=max(0.1,min(2.0,(altmax-mz)/altmax))
air=max(0.1,(altmax)/(altmax+Abs(mz)))
vplane=air*poids*v/vcruise

joy=pz3:queue2
joy=vplane-py3:pitch2
vroll=vroll-min(0.4,rroll*air*kfps2)*vroll+1e-20 'pour eviter float underflow
vpitch=vpitch-min(0.4,rpitch*air*kfps2)*vpitch+1e-20
vqueue=vqueue-min(0.4,rqueue*air*kfps2)*vqueue+1e-20
Dim As Single kaux=0.12
joy=kaux*vroll:roll3
joy=kaux*vpitch:pitch3
joy=kaux*vqueue:queue3
'v=v-air*v*rv*(3*(v+2)/(0.5+v))+p1+1e-10
'v=v-air*v*rv*3*(abs(v)+2)/(0.5+Abs(v))+p1+1e-10
if v>0.05 then 
  v=v-air*v*rv*3*(abs(v)+2)/(0.995+Abs(v))+p1+1e-10
else 
  v=v-air*v*rv*9*(abs(v)+2)/(0.75+Abs(v))+p1+1e-10
  v=v*0.87+1e-20
EndIf 
If mz<=mzsol0+3 Then 
	v=v+air*prop*poids/8000
EndIf
'v=v+air*prop*poids/8000-air*v/100+p1
'v=v+prop/4000-0.02*v
If v>-0.09 And v<0.03 then v=0:vmx2=0:vmy2=0:vmz2=0
Dim As Single dv,dvmx1,dvmy1,dvmz1,dvmx2,dvmy2,dvmz2
dv=v
dvmx1=dv*cos1:dvmy1=dv*sin1
dvmx2=dvmx1*cos2:dvmy2=dvmy1*cos2:dvmz2=-dv*sin2
if mz>mzsol0+0.0001 then
  'vmz3=vmz3+kfps*(-0.5-0.05*vmz3):vmz2=vmz2+vmz3
  vmz3=vmz3+kfps*3*(-0.95-0.02*vmz3):vmz2=min2(vmz2,vmz3)
Else
  'if vmz3>0.7 Then pneu=1:rebond=1
  if vmz3<-0.997 Then pneu=1:rebond=1
  vmz3=0
  'Var v8=0.80:If tautopilot=0 Then v8=0.33
  Var v8=1.3':If tautopilot=0 Then v8=1.2
  If tautopilot=0 Then
   If (abs(dvmx2-vmx2)+abs(dvmy2-vmy2)+abs(dvmz2-vmz2))>v8*kfps then'*kfps Then'2.5
     pneu=1
     do3=do3*0.7+0.3*( (dvmx2-vmx2)*sin1-(dvmy2-vmy2)*cos1 )*0.9+1e-10
   Else
     do3=do3*0.7+0.3*( (dvmx2-vmx2)*sin1-(dvmy2-vmy2)*cos1 )*0.9+1e-10
     'do3=0.7*do3+1e-10
   EndIf 
  Else  
   If (abs(dvmx2-vmx2)+abs(dvmy2-vmy2)+abs(dvmz2-vmz2))>v8 then'*kfps Then'2.5
     pneu=1
     do3=do3*0.7+0.3*( (dvmx2-vmx2)*sin1-(dvmy2-vmy2)*cos1 )*1.3+1e-10
   Else
     do3=do3*0.7+0.3*( (dvmx2-vmx2)*sin1-(dvmy2-vmy2)*cos1 )*1.3+1e-10
     'do3=0.7*do3+1e-10
   EndIf
  EndIf  
EndIf
o3=o33+do3+do30
While o3>180:o3-=360:Wend
While o3<-180:o3+=360:Wend
'If cos3<0.75 then
'auxvar=o2:auxtest=0.2
If Abs(o3)>40 Then
   If Timer>max(ttonneau,timeinit)+20 Then 	
      ttonneau=Timer
      testweb=1
   EndIf    
   If tonneau=0 Then
   	do30=sin3*50:o3=o3+do30:soundcrash
   	If do30>0 Then do300=20 Else do300=-20
   EndIf
   tonneau=1:do30=do30+do300
   'do300=0.9*do300
   v=0.8*v+1e-10
   'mx-=3*do300*sin1:my+=3*do300*cos1
   mx-=2*do300*sin1:my+=2*do300*cos1
   If mz<(getterrainheight(mx,my)+mzh) Then mx=mx0:my=my0:tonneau=0:do30=0:do300=0:o3=0
Else
	If Abs(o3)>35-10+scalez Or Abs(o2)>35-10+scalez Then
		If Timer>max(ttonneau,timeinit)+30 Then
			ttonneau=Timer
			testweb=1
		EndIf
	elseIf Abs(o3)>25-10+scalez Or Abs(o2)>25-10+scalez Then
		If Timer>max(ttonneau,timeinit)+60 Then
			ttonneau=Timer
			testweb=1
		EndIf
	EndIf
   tonneau=0
   do30=0:do300=0
EndIf
'o3=o33+do3+do30
If pneu=1 Then
	pneu=0
	'If ipneu=0 Then
	'	ipneu=1
		soundpneu
      If mz<=(waterz+mzh) Then
	     	If ntownnear<2 Then soundwaterwave     	
      EndIf
	'Else
	'	ipneu=0
	'EndIf
'Else
'	ipneu=0
EndIf
kaux=0.92
kaux=1-(1-kaux)*max(0.001,min(1.0,0.196*kfps))
vmx2=kaux*vmx2+(1-kaux)*dvmx2
vmy2=kaux*vmy2+(1-kaux)*dvmy2
vmz2=kaux*vmz2+(1-kaux)*dvmz2	
kvaux=0.8
Var kvaux2=kvaux*0.4'0.8
'If scalexy>1.1 Then kvaux2*=0.5
If tautopilot=0 Then kvaux2*=1.7
timemove0=timemove
timemove=Timer
Var dkfps=min(6.0,(timemove-timemove0)*30)'kfps
mx=mx+vmx2*dkfps*kvaux2:my=my+vmy2*dkfps*kvaux2:mz1=mz1+vmz2*dkfps*kvaux2 
EndIf 
End Sub
Dim Shared As Integer tinitloadmx=0
Dim Shared As Single loadmx,loadmy,loadmz
Dim Shared As Single mxold,myold,mzold,scalezold
Declare Sub subsettupdate()
Sub testmz
Dim As Single aux
If orbit=0 And planet=1 Then
	 mz=mz1:mz11=-999999:mzsol0=-999999
Else 
    vmz0=vmz
    If plane=1 And car=0 Then
    	If car>=1 Then 
    	   vmz=vmz2*kvaux
    	Else    
    		vmz=vmz3*kvaux'vmz2*kvaux'0
    	EndIf
    EndIf
    'If fly And plane=0 Then vmz=(dmz+0.4)*10.0
    mz1=min(mz1+vmz*kfps,250000.0)'75000.0)'52000.0)
      mzsol0 =(getterrainheight(mx, my )+mzh)'+25',ysolpiste)
      mzsol00=mzsol0
      mxold=mx:myold=my:mzold=mzsol0-mzh:scalezold=scalez
      mzsol0=max(mz11,mzsol0) 
      If (mz1>mzsol0) And (car>=1 Or plane=0) Then
      	vmz=vmz-4.0*kfps	 
      EndIf
      If (car>=1 Or plane=0 or v<7)And avion<>"ballon" And avion<>"copter" Then aux=3.0 Else aux=0.00004'0.1
      If mz1>(mzsol0+aux) And (piste=0 Or v>1) Then '3.0) Then 
      	mz=mz1
      Else
      	'If mzsol0<(mz+40.0*kfps*7) Then
            'If vmz<-35.0 Then soundfoot
      		'If vmz<-70.0 Then hit=1
         	vmz=-0.01
         	mz=mzsol0
         	mz1=mzsol0
      	'Else
      	'	mx=mx0:my=my0:mz=mz0 'cant climb
      	'EndIf 	
      EndIf
      piste=0
      If plane=0 Or car>0 Then
     	   If mz>mzsol00+500 Then
     	   	mz=min(mzsol00+500,mz)
            mz1=min(mz,mz1)
            mz11=min(mz,mz11)
            mzsol0=min(mz,mzsol0)
            mzsol00=min(mz,mzsol00)
     	   EndIf
     	   piste=piste0
      ElseIf mz>mzsol00+20000 And tinittown0=0 Then   	
     	      If tinitloadmx=0 Then
     	         tinitloadmx=1
     	         'mx=loadmx:my=loadmy
     	         mz=loadmz
     	      Else 
     	      	mz=min(mzsol00+19000,mz)
     	      EndIf
            mz1=min(mz,mz1)
            mz11=min(mz,mz11)
            mzsol0=min(mz,mzsol0)
            mzsol00=min(mz,mzsol00)
     	      subsettupdate()
      ElseIf mz<mzsol00+mzh+0.1 Then
      	   piste=piste0
      	   'If plane>0 And car=0 Then o2=max(-5,o2)
      EndIf 	
      mz11=max(mzsol00,mz11-kfps)
      If (plane=0 Or car>0) Then mz1=mz11
      If plane=0 Then mz=mzsol0:mz1=mz:mz11=mz
EndIf       
End Sub
Dim Shared As Integer ktir,tcarhorn,thorn
Declare Sub subcarhorn()
Sub keytir
	If car>0 Then
		If tcarhorn=0 Or time2>tsoundcarhorn+1 Then
			tcarhorn=1:subcarhorn
			thorn=time2
		EndIf
		Exit Sub 
	EndIf
   ktir=1	
End Sub
Dim Shared As Integer key2(256)
For i=1 To 256:key2(i)=i:Next 
Sub initkey2()
Dim As Integer File,i
Dim As String ficin,fic,a,b
fic="keyboard.txt"
If FileExists(fic)=0 Then Exit Sub   
file=freefile
Open fic For input As #file
a="":b=""
If Not Eof(file) Then Line Input #file,ficin:a=Trim(ficin)
If Not Eof(file) Then Line Input #file,ficin:b=Trim(ficin)
Close #file
If a="" Or b="" Then Exit Sub
For i=1 To Len(a)
	If Mid(a,i,1)=" " Then Exit For 
	key2(Asc(Mid(a,i,1)))=Asc(Mid(b,i,1))
Next i
End Sub 
initkey2()
Declare Sub subtopview()
Declare Sub subfoot()
Declare Sub subretroviseur()
Dim Shared As Integer topview=0,mapdisplay0=0,tloadmapdisplay=0,testjoy,testjoy2
Dim Shared As Single cocko1,cocko2
Sub keyplane
	
If guitestkey(vk_LEFT)<>0 then keyLeft
if guitestkey(vk_RIGHT)<>0 then keyRight
if guitestkey(vk_UP)<>0 Then keyup
if guitestkey(vk_DOWN)<>0 Then keydown
If guitestkey(vk_PRIOR)<>0 Then accelere 'pageup
if guitestkey(vk_NEXT)<>0 then decelere 'pagedown
if guitestkey(vk_CONTROL)<>0 then brakes
if guitestkey(vk_shift)<>0 then brakes
If guitestkey(vk_add)<>0 then accelere '+
if guitestkey(vk_subtract)<>0 then decelere '-
If guitestkey(vk_NUMPAD4)<>0 then keyLeft
if guitestkey(vk_NUMPAD6)<>0 then keyRight
if guitestkey(vk_NUMPAD1)<>0 then keyleft2
if guitestkey(vk_NUMPAD3)<>0 Then keyright2
If (guitestkey(vk_NUMPAD8)<>0 And plane<>2 And (volant<>4 Or plane=0)) Or guitestkey(vk_4)<>0 Then
	If car=993 Then
		canono2=min2(6,canono2+0.1*Int(1+kfps)):soundmoteur
	Else
		keyup
	EndIf
EndIf
if (guitestkey(vk_NUMPAD2)<>0 And plane<>2 And (volant<>4 Or plane=0)) Or guitestkey(vk_3) Then
	If car=993 Then
		canono2=max2(-6,canono2-0.1*Int(1+kfps)):soundmoteur
	Else
		keydown
	EndIf
EndIf
if guitestkey(vk_NUMPAD5)<>0 Or guitestkey(vk_5)<>0 Then
	If car=993 Then canono2=0
	If tourelle=1 Then to2=0
EndIf


If guitestkey(vk_z)<>0 And guitestkey(vk_control)<>0 Then
	'subtopview
EndIf
If car>0 Or volant<>2 Then 
 If guitestkey(key2(vk_A))<>0 then keyLeft
 If guitestkey(key2(vk_E))<>0 then keyRight
 If guitestkey(key2(vk_Q))<>0 then keyleft2
 If guitestkey(key2(vk_D))<>0 then keyright2
 If guitestkey(key2(vk_Z))<>0 And guitestkey(vk_control)=0 then keyup
 If guitestkey(key2(vk_S))<>0 then keydown 
EndIf  
If guitestkey(vk_b)<>0 Or(guitestkey(vk_down)And car>0 And plane=1 And tourelle=0) Then decelere
If guitestkey(vk_n)<>0 Or(guitestkey(vk_up) And car>0 And plane=1 And tourelle=0) Then accelere
If guitestkey(vk_SPACE)<>0 And guitestkey(vk_left)=0 And guitestkey(vk_right)=0 Then
	If plane=0 Or car>0 Then Sleep 200:guiscan
	If  guitestkey(vk_left)=0 And guitestkey(vk_right)=0 Then
		If mapdisplay=0 Then
			If volant<>2 Or max(Abs(cocko1),Abs(cocko2))<0.01 Then
				keytir
			Else 
				cocko1=0:cocko2=0:Sleep 300:guiscan
			EndIf
		Else
			mapdisplay=0:Sleep 300:guiscan
		EndIf
	EndIf
Else
	tcarhorn=0
EndIf
If guitestkey(vk_k)<>0 Then
	If ikey0(vk_k)=0 Then
		ikey0(vk_k)=1
		If car<=0 Then 
			volant=(volant+1)Mod 7
			If volant=3 And typeavion=15 Then volant=4
			If volant=1 Then
				If typeavion=12 Or typeavion=15 Then'c150 'copter
				   volant=2
				ElseIf typeavion=14 Or typeavion=13 Then
				   volant=3
				Else    	
					volant=4
				EndIf
			EndIf
		Else 
			volant=(volant+1)Mod 3
		EndIf
	EndIf
   If tautopilot=1 And plane>0 And car>0 And volant>0Then
   	showgui("win.typeauto")
   Else
   	hidegui("win.typeauto")
   EndIf
Else
	ikey0(vk_k)=0
EndIf
If guitestkey(vk_j)<>0 Then
	If ikey0(vk_j)=0 Then
		ikey0(vk_j)=1
		If car<=0 Then 
			volant=(volant-1+7)Mod 7
		Else 
			volant=(volant-1+3)Mod 3
		EndIf
	EndIf
Else
	ikey0(vk_j)=0
EndIf
'If plane>0 And car=0 Then
'	   If guitestkey(vk_shift) Then accelere()
'	   If guitestkey(vk_control) Then decelere()	
'EndIf
If guitestkey(vk_t)<>0 And guitestkey(vk_control)=0 Then
 If guitestkey(vk_shift)=0 Then 	
	If ikey0(vk_t)=0 Then
		ikey0(vk_t)=1:tourelle=(tourelle+1)Mod 2
	EndIf
 Else
 	subretroviseur()
 EndIf 	
Else
	ikey0(vk_t)=0
EndIf
'If guitestkey(vk_v)<>0 Then
'	If ikey0(vk_v)=0 Then
'		ikey0(vk_v)=1:viseur=(viseur+1)Mod 3
'	EndIf
'Else
'	ikey0(vk_v)=0
'EndIf
If guitestkey(vk_c)<>0 Then
	If ikey0(vk_c)=0 Then
		ikey0(vk_c)=1:compas=(compas+1)Mod 2
	EndIf
Else
	ikey0(vk_c)=0
EndIf
If guitestkey(vk_l)<>0 Then
	If ikey0(vk_l)=0 Then
		ikey0(vk_l)=1:compas2=(compas2+1)Mod 2
	EndIf
Else
	ikey0(vk_l)=0
EndIf
If guitestkey(vk_f)<>0 Then
   If ikey0(vk_f)=0 Then
      ikey0(vk_f)=1:subfoot()
   EndIf
Else
   ikey0(vk_f)=0
EndIf


if joystick=1 Then
' gosub [getjoystick]
 if abs(joy1dx)>8000 then roll:testjoy=1
 if abs(joy1dy)>8000 then pitch:testjoy=1
 if abs(joy1dz)>8000 Then queue:testjoy=1
 if abs(joy1dr)>8000 Then queuer:testjoy=1
 if b(1)<>0 Then accelere:testjoy2=1
 if b(2)<>0 Then decelere:testjoy2=1
 if b(4)<>0 then
    if tjoy(4)=0 Then
    	tjoy(4)=1:If tourelle=0 Then tourelle=1 Else tourelle=0
    EndIf
 else
    tjoy(4)=0
 end if
 If b(5)<>0 Then
 	If tjoy(5)=0 Then 
		If car<=0 Then 
			volant=(volant+1)Mod 7
		Else 
			volant=(volant+1)Mod 3
		EndIf
      tjoy(5)=1
   EndIf    
 Else
 	tjoy(5)=0
 EndIf 	
 If b(6)<>0 Then
 	brakes
 	If tjoy(6)=0 And mz>mzsol0+10 Then 
		If car<=0 Then 
			volant=(volant-1+7)Mod 7
		Else 
			volant=(volant-1+3)Mod 3
		EndIf
      tjoy(6)=1
   EndIf    
 Else
 	tjoy(6)=0 '/
 EndIf 	
 if b(3)<>0 then keytir
 if b(7)<>0 Then keytir
 if b(7)=990 then
	If car=993 Then
	 canono2=min2(6,canono2+0.1*Int(1+kfps)):soundmoteur
	Else
    If tjoy(7)=0 Then 
       cockpit=(cockpit+1)Mod 3
    EndIf 
    tjoy(7)=1
   EndIf  
 Else 
    tjoy(7)=0
 EndIf 
 if b(8)<>0 Then
 	If car=993 Then 
	 If b(7)=0 Then canono2=max2(-5,canono2-0.1*Int(1+kfps)):soundmoteur Else canono2=0 EndIf 
   Else    
    if tjoy(8)=0 Then
    	tjoy(8)=1:viseur=(viseur+1)Mod 3
    EndIf
   EndIf 
 else
    tjoy(8)=0
 EndIf
' if joy9<>0 then
'    if tjoy9=0 then tjoy9=1:goto [edit]
' else
'    tjoy9=0
' end if
 if b(10)<>0 Then
    if tjoy(10)=0 Then
    	tjoy(10)=1:typetir0=(typetir0+1)Mod 2
    EndIf
 else
    tjoy(10)=0
 EndIf
EndIf
End Sub
Dim Shared As Single aviono1=180,aviono2,aviono3,avionx,aviony,avionz,aviono30
Dim Shared As Single avionmx,avionmy,avionmz
Dim Shared As Single avionv=30,avionco1,avionsi1,avionco2,avionsi2
Dim Shared As Single avionvie0=300,avionvie,distavion,avionz900=1000,avionsol,timeavion=-999999
Dim Shared As Integer avionwar=0,setavion=1
Dim Shared As Single dxavion,dyavion,dzavion,turnavion,dturnavion=0,daviono1,helicerot,tlight
Dim Shared As Single dmax=90000'100000-8000
avionvie=avionvie0
Sub diravion
distavion=sqr(avionmx*avionmx+avionmy*avionmy)
dxavion=avionmx*avionco1+avionmy*avionsi1
If dxavion>dturnavion or turnavion>0 then
   if turnavion<=0 then turnavion=int(Rnd*140) else turnavion=turnavion-1
   If dturnavion<999999 Then dturnavion=0-min(dmax*0.36,0.7*distavion-4000)
   if Abs(aviono3)<=0.1 or Abs(daviono1)<=0.1 then
     dzavion=avionmx*avionsi1-avionmy*avionco1
     if dzavion>(Rnd-0.5)*dmax*0.2 then
        aviono30=40:daviono1=1
     else
        aviono30=-40:daviono1=-1
     end if
   end if
   aviono1=aviono1+daviono1*kfps*0.8
   aviono3=0.95*aviono3+0.05*aviono30+1e-20
   setavion=1
else
'   turnavion=0
   'if aviono3<>0 then aviono3=0:setavion=1
   aviono3=0.95*aviono3+1e-20
   daviono1=0
   if distavion>(dmax-5000) Or Rnd<0.0005*kfps Then dturnavion=0 else dturnavion=dmax*0.59
   If time2<timeavion Then timeavion=time2
   If time2<(timeavion+120.0) And plane=2 Then dturnavion=9999999
end if
End Sub
Dim Shared As Single aviono10,kfps0
Sub move2
	If guitestkey(vk_5) Or guitestkey(vk_numpad7) Then 'Or (hatx=-1 And plane=2) Then
		turnavion=1:dturnavion=9999999
		aviono30=40:daviono1=1:aviono3=max(1.0,aviono3)
		timeavion=time2
	EndIf
	If guitestkey(vk_6) Or guitestkey(vk_numpad9) Then 'Or (hatx=1 And plane=2) Then
		turnavion=1:dturnavion=9999999
		aviono30=-40:daviono1=-1:aviono3=min(-1.0,aviono3)
	   timeavion=time2
	EndIf
	'mx=avionx-avionco1*22*avionco2
	'my=aviony-avionsi1*22*avionco2
	'mz=avionz-2-22*(avionsi2)
	mx=avionx-avionco1*11'*(0.35-avionsi2)
	my=aviony-avionsi1*11'*(0.35-avionsi2)
	mz=avionz-6.7*3*(0.35+Abs(avionsi2))
	If tourelle=1 Then mz-=27
	mz1=mz
	o1+=aviono1-aviono10
	o3=0
	v=avionv
	volume=1550
	prop=0
  air=3
  vroll=vroll-min(0.7,rroll*air*kfps2)*vroll+1e-20 'pour eviter float underflow
  vpitch=vpitch-min(0.7,rpitch*air*kfps2)*vpitch+1e-20
  vqueue=vqueue-min(0.7,rqueue*air*kfps2)*vqueue+1e-20
  Dim As Single kaux=0.3'0.12
  joy=kaux*vroll:queue3'roll3
  joy=kaux*vpitch:pitch3
  joy=kaux*vqueue:queue3	
End Sub 
Sub moveavion
Dim As Single h1400=300,kvaux2=1.0
aviono10=aviono1
klevel=0.99*klevel+0.0085'0.01
avionx=avionx+avionv*avionco2*avionco1*kfps*kvaux2
aviony=aviony+avionv*avionco2*avionsi1*kfps*kvaux2
avionmx=avionx:avionmy=aviony
avionsol=GetTerrainHeight(avionx,aviony)
avionz=avionz+avionv*avionsi2*kfps*kvaux2
If avionz<(avionsol+h1400) Then
	avionz=avionsol+h1400
	avionz900=max2(avionz900,avionsol+h1400+300)
EndIf
If FALSE Then 'avionvie<0 then
  avionv=avionv-0.7*kfps*avionv*0.3+1e-10
  'testresetavion
Else
  if FALSE Then 'avionwar>0 Or avionvie<avionvie0 Then
    avionwar=max2(-1,avionwar-1)
    'diravionwar
    If distavion>22000 And dxavion<0 Then
    	avionv=max(v,vcruise)+min(v,0.002*distavion)
    Else
    	avionv=max(v+5,vcruise)
    EndIf
  Else
    if rnd<0.0021*kfps And time2>(timeavion+120.0) Then avionz900=max2(-2500+Rnd*5000,avionsol+h1400+200)
    mmx=avionx+5000*avionco1:mmy=aviony+5000*avionsi1
    mmz=getterrainheight(mmx,mmy)
    mmx=avionx+3000*avionco1:mmy=aviony+3000*avionsi1
    mmz=max(mmz,getterrainheight(mmx,mmy))
    If avionz900<(mmz+h1400+100) Then avionz900=mmz+h1400+300
    if abs(avionz-avionz900)<200 And plane=2 Then
    	If ((haty=1 And plane=2) Or guitestkey(vk_numpad2)) And avionz<10000 Then
    		avionz900=avionz+210:timeavion=time2
    	EndIf
    	If (haty=-1 And plane=2) Or guitestkey(vk_numpad8) Then
    		avionz900=avionz-210:timeavion=time2
    	EndIf
    EndIf
    if abs(avionz-avionz900)<200 then
       if aviono2>kfps then aviono2-=kfps:setavion=1
       if aviono2<-kfps then aviono2+=kfps:setavion=1
       If Abs(aviono2)<=(1+kfps) Then
       	If Abs(aviono2)>0.0001 Then aviono2=0:setavion=1
       EndIf
    else
       if (avionz)>avionz900 then if aviono2>-20 then aviono2-=kfps:setavion=1
       if (avionz)<avionz900 Then if aviono2<20  then aviono2+=kfps:setavion=1
    end if
    'avionv=vcruise-vcruise*aviono2/40
    avionv=max(vcruise*0.65,avionv+0.7*kfps*(vcruise/100-0.01*avionv-1.0*avionsi2)+1e-20)
    'If aviono2<-12 Then aviono2=-12+1:setavion=1
    'If aviono2>12 Then aviono2=12-1:setavion=1
    diravion
    if setavion=1 Then
    	 setavion=0
    	 While aviono1>180:aviono1-=360:Wend
    	 While aviono1<-180:aviono1+=360:wend
       avionco1=Cos(aviono1*degtorad):avionsi1=Sin(aviono1*degtorad)
       avionco2=Cos(aviono2*degtorad):avionsi2=Sin(aviono2*degtorad)       
    end if
  end if
end If
If plane=2 Then move2
End Sub
