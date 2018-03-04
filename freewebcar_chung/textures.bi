'texture.bi
Dim Shared As uint fueltext,roadtext,roadbandtext,roadarrowtext,roadarrow2text,lamplist,barrieretext,haietext
Dim Shared As uint nathalietext,veroniquetext,christinetext,mywomantext,crosstext,onewaytext,parkingtext
Dim Shared As uint railtext,crossrailtext,housetext,retrotext,roadlefttext,roadarrowlefttext,roadarrow2lefttext
Dim Shared As uint cocacolatext,marisoltext,lamplist2,lamplist3,oneway2text
Dim Shared As uint mygltext(11)
Sub resettextures()
aviontext=0'("objects/c150.jpg")
avionredtext=0'("objects/c150red.jpg")
corsairtext=0'("objects/f4u.jpg")
vg33text=0'("objects/vg33.jpg")
zerotext=0'("objects/zero1.jpg")
zero2text=0'("objects/zerogreen.jpg")
b25text=0'("objects/b25.jpg")
alphajettext=0'("objects/alphajet.jpg")
spitfiretext=0'("objects/spitfire_lowpoly2.jpg")
spitfiretext2=0'("objects/spitfire_lowpoly22.jpg")
bf109text=0'("objects/bf109.jpg")
p51dtext=0'("objects/p51d.jpg")
f14text=0'("objects/f14_2.jpg")
eurofightertext=0'("objects/eurofighter.jpg")
fightertext=0
fightertext2=0
spaceshiptext=0
ballontext=0
boeing737text=0
coptertext=0

        tronctext=0'("media/tronc.jpg")
        volanttext=0'("objects/volant.jpg",252)
        volanttext2=0'("objects/volant2.jpg",252)
        startext=0'("media/stars.jpg")
        sunsettext=0'("media/sun.jpg")
        sunbacktext=0
        helicetext=0'("objects/helice.jpg",40,47)
        cockpittext1=0'("media/cockpit1.jpg",245)'252)
        cockpittext2=0'("media/cockpit2.jpg",237)'252)
        cockpittext3=0'("media/cockpit3.jpg",237)'252)
        cockpittext4=0'("media/cockpit4.jpg",237)'252)
        feutext=0'("media/explosion.jpg",25,200)'feu.jpg")
        feutext2=0'("media/feu.jpg")
        smoketext=0'("media/smoke.bmp",55)
        firetext=0'("media/fire.jpg",20,175)
        sfiretext=0'("media/smoke.bmp")
        boattext=0'("objects/ship.jpg")
        boattext2=0'("objects/sailship.jpg")
        boattext3=0'("objects/_vessel.jpg")
        boattext4=0'("objects/shipcarrier.jpg")
        windtext=0'("media/vent.jpg",253)
        windtext2=0'("media/vent2.jpg",253)
        radartext=0'("media/radar.jpg",253)
        pistetext=0'("media/piste.jpg")
        bullettext=0'("media/impactballe.jpg",253)
        worldtext=0'("media/world1024.jpg")
        starspacetext=0
        starspacetext2=0
        debristext=0
        seawavetext=0
        cloudtext=0
        churchtext=0
        shoptext=0
        officialtext=0
        official2text=0
        railstationtext=0
        hospitaltext=0
        fueltext=0
        raintext=0
        raintext2=0
        cockpit1text=0
        cockpit2text=0
        cockpit3text=0
        cockpit4text=0
        cockpit5text=0
        capottext=0
        roadtext=0
        roadbandtext=0
        roadarrowtext=0
        roadarrow2text=0
        roadlefttext=0
        roadarrowlefttext=0
        roadarrow2lefttext=0
        barrieretext=0
        haietext=0
        nathalietext=0
        veroniquetext=0
        christinetext=0
        cocacolatext=0
        marisoltext=0
        mywomantext=0
        crosstext=0
        onewaytext=0
        oneway2text=0
        parkingtext=0
        raindroptext=0
        essuieglacetext=0
        railtext=0
        crossrailtext=0
        housetext=0
        roctext=0
        c150cockpittext=0
        c150phototext=0
        c150grptext=0
        boeing737cockpittext=0
        boeing737phototext=0
        balloncockpittext=0
        ballonphototext=0
        retrotext=0
        ladytext=0
        ladylefttext=0
        ladygreentext=0
        ladygreenlefttext=0
        ladyredtext=0
        ladyredlefttext=0
        ladyyellowtext=0
        ladyyellowlefttext=0
        ladybluetext=0
        ladybluelefttext=0
        ladybikinitext=0
        ladybikinilefttext=0
        ladybikiniyellowtext=0
        ladybikiniyellowlefttext=0
        ladybikiniredtext=0
        ladybikiniredlefttext=0
        ladybikinibluetext=0
        ladybikinibluelefttext=0
        ladybikinigreentext=0
        ladybikinigreenlefttext=0
        carshadowtext=0
        carshadowbacktext=0
        carpoliceshadowtext=0
        carpoliceshadowbacktext=0
        shadowcrosstext=0
        shadowonewaytext=0
        shadowparkingtext=0
        shadowcitytext=0
        shadowcitykmtext=0
        shadowlamptext=0
        shadowroctext=0
        horsetext=0
        handtext=0
        snowtext=0
        spottext=0
        helentext=0

End Sub
Sub initlist()
Dim As Integer i,j,k 

agllist=glgenlists(1)	
glnewlist agllist,GL_COMPILE
glendlist
	
lamplist=glgenlists(1)
glnewlist lamplist,GL_COMPILE
glcolor3f(115/256,115/256,115/256)
glcylindre(2,2,180,4,4)
gltranslatef(0,0,179)
glrotatef(45,-1,0,0)
glcylindre(2,2,91,4,4)
gltranslatef(0,0,90)
glcolor3f(200/256,200/256,200/256)
glscalef(1.1,1,1)
glcylindre(3.9,4,22,4,4)
glendlist

lamplist2=glgenlists(1)
glnewlist lamplist2,GL_COMPILE
glcolor3f(115/256,115/256,115/256)
glcylindre(2,2,180,4,4)
gltranslatef(0,0,179)
glrotatef(45,-1,0,0)
glcylindre(2,2,91,4,4)
gltranslatef(0,0,90)
glcolor3f(1,1,1)
glscalef(1.32,1.2,1.2)
glcylindre(3.9,4,22,4,4)
glendlist

lamplist3=glgenlists(1)
glnewlist lamplist3,GL_COMPILE
'glcolor3f(115/256,115/256,115/256)
'glcylindre(2,2,180,4,4)
gltranslatef(0,0,179)
glrotatef(45,-1,0,0)
'glcylindre(2,2,91,4,4)
gltranslatef(0,0,90)
glcolor3f(1,1,1)'200/256,200/256,200/256)
glscalef(2.2,2,2)
glcylindre(3.9,4,22,4,4)
glendlist
	
 ncarlist=glgenlists(1)
 glnewlist ncarlist,gl_compile 
 glenable gl_alpha_test
 glAlphaFunc(gl_less,1/254)
 'gldisable gl_lighting
 'glrotatef(-90,0,0,1)
 'glrotatef(90,1,0,0)
 'glscalef(1,1,1.22)
 loadobjsize("objects/rover.obj",@"",@"",74)
 gldisable gl_alpha_test 
glendlist

wheellist=glgenlists(1)
glnewlist wheellist,gl_compile 
loadobjsize("objects/loganwheel.obj",@"",@"",11)
glendlist 

ncarpolicelist=glgenlists(1)
glnewlist ncarpolicelist,gl_compile 
load3dssize("objects/policecar_lowpoly.3ds",@"",@"",81)
glendlist

roclist=glgenlists(1)
glnewlist roclist,gl_compile 
load3dssize("objects/roc.3ds",@"",@"",150)
glendlist 

horselist=glgenlists(1)
glnewlist horselist,gl_compile 
load3dssize("objects/horseheadlow.3ds",@"",@"",100)
glendlist 

webtext=guiloadtexture("media/road.jpg")
roadtext=guiloadtexture("media/road.jpg",200,255)
roadbandtext=guiloadtexture("media/roadband.jpg")
roadarrowtext=guiloadtexture("media/roadarrow.jpg")
roadarrow2text=guiloadtexture("media/roadarrow2.jpg")
roadlefttext=guiloadtexture("media/roadleft.jpg")
roadarrowlefttext=guiloadtexture("media/roadarrowleft.jpg")
roadarrow2lefttext=guiloadtexture("media/roadarrow2left.jpg")
barrieretext=guiloadtexture("media/barriere.jpg",150)
haietext=guiloadtexture("media/haie.jpg",150)
crosstext=guiloadtexture("media/cross.bmp",250)
onewaytext=guiloadtexture("media/oneway.bmp",250)
oneway2text=guiloadtexture("media/oneway2.bmp",250)
parkingtext=guiloadtexture("media/parking.bmp",250)
raindroptext=guiloadtexture("media/raindrop.jpg")
essuieglacetext=guiloadtexture("media/essuie_glace.jpg",250)
railtext=guiloadtexture("media/rail.jpg")
crossrailtext=guiloadtexture("media/crossrail.bmp",250)
housetext=guiloadtexture("media/house.jpg")

churchtext=guiloadtexture("objects/town/church.jpg")
shoptext=guiloadtexture("objects/town/shop.jpg")
officialtext=guiloadtexture("objects/town/official.jpg")
official2text=guiloadtexture("objects/town/official2.jpg",253)
railstationtext=guiloadtexture("objects/town/railstation.jpg")
hospitaltext=guiloadtexture("objects/town/hospital.jpg")
fueltext=guiloadtexture("objects/town/fuel.jpg")

           glbindtexture(gl_texture_2d,mywomantext)
           glbindtexture(gl_texture_2d,marisoltext)
           glbindtexture(gl_texture_2d,nathalietext)
           glbindtexture(gl_texture_2d,veroniquetext)
           glbindtexture(gl_texture_2d,christinetext)
           glbindtexture(gl_texture_2d,cocacolatext)

For i=0 To 11
	If mygltext(i)<>0 Then guideletetexture(mygltext(i))
	mygltext(i)=guiloadtexture(ExePath+"/media/image/glvideo"+Str(i)+".jpg")
Next
End Sub 
Sub loadtextures(itext As uint Ptr)
If itext=@webtext Then *(itext)=guiloadtexture("media/road.jpg") 
If itext=@aviontext then *(itext)=guiloadtexture("objects/c150.jpg")
If itext=@avionredtext then *(itext)=guiloadtexture("objects/c150red.jpg")
If itext=@ballontext then *(itext)=guiloadtexture("objects/ballon.jpg")
If itext=@boeing737text then *(itext)=guiloadtexture("objects/737.jpg")
If itext=@coptertext then *(itext)=guiloadtexture("objects/copter.jpg",250)
'If itext=@corsairtext then *(itext)=guiloadtexture("objects/f4u.jpg")
'If itext=@vg33text then *(itext)=guiloadtexture("objects/vg33.jpg")
If itext=@zerotext then *(itext)=guiloadtexture("objects/zero1.jpg")
'If itext=@zero2text then *(itext)=guiloadtexture("objects/zerogreen.jpg")
'If itext=@b25text then *(itext)=guiloadtexture("objects/b25.jpg")
'If itext=@alphajettext then *(itext)=guiloadtexture("objects/alphajet.jpg")
'If itext=@spitfiretext then *(itext)=guiloadtexture("objects/spitfire_lowpoly2.jpg")
'If itext=@spitfiretext2 then *(itext)=guiloadtexture("objects/spitfire_lowpoly22.jpg")
'If itext=@bf109text then *(itext)=guiloadtexture("objects/bf109.jpg")
If itext=@p51dtext then *(itext)=guiloadtexture("objects/p51d.jpg")
'If itext=@f14text then *(itext)=guiloadtexture("objects/f14_2.jpg")
'If itext=@eurofightertext then *(itext)=guiloadtexture("objects/eurofighter.jpg")	
'If itext=@fightertext then *(itext)=guiloadtexture("objects/fighter.jpg")	
'If itext=@fightertext2 then *(itext)=guiloadtexture("objects/fighter_cockpit.jpg",250)	
'If itext=@spaceshiptext then *(itext)=guiloadtexture("objects/spaceship.jpg")	

'If itext=@tronctext then *(itext)=guiloadtexture("media/tronc.jpg")
If itext=@volanttext then *(itext)=guiloadtexture("objects/volant.jpg",220)
If itext=@volanttext2 then *(itext)=guiloadtexture("objects/volant2.jpg",220)
istars=2:If itext=@startext then *(itext)=guiloadtexture("media/stars"+Str(istars)+".jpg",80)
If itext=@sunsettext then *(itext)=guiloadtexture("media/sun.jpg")
If itext=@sunbacktext then *(itext)=guiloadtexture("media/sunback.jpg")
If itext=@helicetext then *(itext)=guiloadtexture("objects/helice.jpg",40,47)
If itext=@cockpittext1 then *(itext)=guiloadtexture("media/cockpit1.jpg",245)'252)
If itext=@cockpittext2 then *(itext)=guiloadtexture("media/cockpit2.jpg",237)'252)
If itext=@cockpittext3 then *(itext)=guiloadtexture("media/cockpit3.jpg",237)'252)
If itext=@cockpittext4 then *(itext)=guiloadtexture("media/cockpit4.jpg",237)'252)
If itext=@feutext then *(itext)=guiloadtexture("media/explosion.jpg",25,200)'feu.jpg")
If itext=@feutext2 then *(itext)=guiloadtexture("media/feu.jpg")
If itext=@smoketext then *(itext)=guiloadtexture("media/smoke.bmp",55)
If itext=@firetext then *(itext)=guiloadtexture("media/fire.jpg",20,175)
If itext=@sfiretext then *(itext)=guiloadtexture("media/smoke.bmp")
If itext=@boattext then *(itext)=guiloadtexture("objects/ship.jpg")
'If itext=@boattext2 then *(itext)=guiloadtexture("objects/sailship.jpg")
'If itext=@boattext3 then *(itext)=guiloadtexture("objects/_vessel.jpg")
'If itext=@boattext4 then *(itext)=guiloadtexture("objects/shipcarrier.jpg")
If itext=@windtext then *(itext)=guiloadtexture("media/vent.jpg",253)
If itext=@windtext2 then *(itext)=guiloadtexture("media/vent2.jpg",230)
If itext=@radartext then *(itext)=guiloadtexture("media/radar.jpg",253)
If itext=@pistetext then *(itext)=guiloadtexture("media/piste.jpg")
If itext=@bullettext then *(itext)=guiloadtexture("media/impactballe.jpg",253)
If itext=@worldtext Then
	If planet=0 Or FileExists("addon/"+addon(imap)+"world.jpg")=0 Then
		*(itext)=guiloadtexture("media/world1024.jpg")
	Else
		*(itext)=guiloadtexture("addon/"+addon(imap)+"world.jpg")
	EndIf
EndIf
If itext=@starspacetext then *(itext)=guiloadtexture("media/starspace.jpg",80)
If itext=@starspacetext2 Then
	Select Case istars Mod 4
		Case 1
			*(itext)=guiloadtexture("media/galaxy11.jpg")
		Case 2
			*(itext)=guiloadtexture("media/galaxy21.jpg")
		Case 3
			*(itext)=guiloadtexture("media/galaxy31.jpg")
		Case 0
			*(itext)=guiloadtexture("media/orion.jpg")
		Case Else 
			*(itext)=guiloadtexture("media/galaxy11.jpg")
	End Select
EndIf
If itext=@debristext then *(itext)=guiloadtexture("media/debris.jpg",250)
If itext=@seawavetext then *(itext)=guiloadtexture("media/seawave2.jpg")
If itext=@cloudtext then *(itext)=guiloadtexture("media/cloud.jpg",55)
If itext=@churchtext then *(itext)=guiloadtexture("objects/town/church.jpg")
If itext=@shoptext then *(itext)=guiloadtexture("objects/town/shop.jpg")
If itext=@officialtext then *(itext)=guiloadtexture("objects/town/official.jpg")
If itext=@official2text then *(itext)=guiloadtexture("objects/town/official2.jpg",253)
If itext=@railstationtext then *(itext)=guiloadtexture("objects/town/railstation.jpg")
If itext=@hospitaltext then *(itext)=guiloadtexture("objects/town/hospital.jpg")
If itext=@fueltext then *(itext)=guiloadtexture("objects/town/fuel.jpg")
If itext=@raintext then *(itext)=guiloadtexture("media/rain.jpg")
If itext=@raintext2 then *(itext)=guiloadtexture("media/snowflakes.jpg")
If itext=@cockpit1text then *(itext)=guiloadtexture("media/cockpit/ford.jpg",240)
If itext=@cockpit2text then *(itext)=guiloadtexture("media/cockpit/fiat.jpg",250)
If itext=@cockpit3text then *(itext)=guiloadtexture("media/cockpit/nissan.jpg",240)
If itext=@cockpit4text then *(itext)=guiloadtexture("media/cockpit/malibuchevy.jpg",240)
If itext=@cockpit5text then *(itext)=guiloadtexture("media/cockpit/cadillac.jpg",240)
If itext=@capottext then *(itext)=guiloadtexture("objects/capot.jpg",170,127)
If itext=@roadtext then *(itext)=guiloadtexture("media/road.jpg",200,255)
If itext=@roadbandtext then *(itext)=guiloadtexture("media/roadband.jpg")
If itext=@roadarrowtext then *(itext)=guiloadtexture("media/roadarrow.jpg")
If itext=@roadarrow2text then *(itext)=guiloadtexture("media/roadarrow2.jpg")
If itext=@roadlefttext then *(itext)=guiloadtexture("media/roadleft.jpg")
If itext=@roadarrowlefttext then *(itext)=guiloadtexture("media/roadarrowleft.jpg")
If itext=@roadarrow2lefttext then *(itext)=guiloadtexture("media/roadarrow2left.jpg")
If itext=@barrieretext then *(itext)=guiloadtexture("media/barriere.jpg",150)
If itext=@haietext then *(itext)=guiloadtexture("media/haie.jpg",150)
If itext=@crosstext then *(itext)=guiloadtexture("media/cross.bmp",250)
If itext=@onewaytext then *(itext)=guiloadtexture("media/oneway.bmp",250)
If itext=@oneway2text then *(itext)=guiloadtexture("media/oneway2.bmp",250)
If itext=@parkingtext then *(itext)=guiloadtexture("media/parking.bmp",250)
If itext=@raindroptext then *(itext)=guiloadtexture("media/raindrop.jpg")
If itext=@essuieglacetext then *(itext)=guiloadtexture("media/essuie_glace.jpg",250)
If itext=@railtext then *(itext)=guiloadtexture("media/rail.jpg")
If itext=@crossrailtext then *(itext)=guiloadtexture("media/crossrail.bmp",250)
If itext=@housetext then *(itext)=guiloadtexture("media/house.jpg")
If itext=@roctext then *(itext)=guiloadtexture("objects/roc.jpg")
If itext=@c150cockpittext then *(itext)=guiloadtexture("objects/c150cockpit2.jpg",250)
If itext=@c150phototext then *(itext)=guiloadtexture("objects/c150photo.jpg",250)
If itext=@c150grptext then *(itext)=guiloadtexture("objects/c150grp.jpg",250)
If itext=@boeing737cockpittext then *(itext)=guiloadtexture("objects/superjet100.jpg",250)
If itext=@boeing737phototext then *(itext)=guiloadtexture("objects/737photo.jpg",245)
If itext=@balloncockpittext then *(itext)=guiloadtexture("objects/balloncockpit.jpg",250)
If itext=@ballonphototext then *(itext)=guiloadtexture("objects/ballonphoto.jpg",250)
If itext=@retrotext then *(itext)=guiloadtexture("objects/retrotexture.jpg")
If itext=@ladytext then *(itext)=guiloadtexture("objects/lady/lady.jpg",250)
If itext=@ladylefttext then *(itext)=guiloadtexture("objects/lady/ladyleft.jpg",250)
If itext=@ladygreentext then *(itext)=guiloadtexture("objects/lady/ladygreen.jpg",250)
If itext=@ladygreenlefttext then *(itext)=guiloadtexture("objects/lady/ladygreenleft.jpg",250)
If itext=@ladyredtext then *(itext)=guiloadtexture("objects/lady/ladyred.jpg",250)
If itext=@ladyredlefttext then *(itext)=guiloadtexture("objects/lady/ladyredleft.jpg",250)
If itext=@ladyyellowtext then *(itext)=guiloadtexture("objects/lady/ladyyellow.jpg",250)
If itext=@ladyyellowlefttext then *(itext)=guiloadtexture("objects/lady/ladyyellowleft.jpg",250)
If itext=@ladybluetext then *(itext)=guiloadtexture("objects/lady/ladyblue.jpg",250)
If itext=@ladybluelefttext then *(itext)=guiloadtexture("objects/lady/ladyblueleft.jpg",250)
If itext=@ladybikinitext then *(itext)=guiloadtexture("objects/lady/ladybikini.jpg",250)
If itext=@ladybikinilefttext then *(itext)=guiloadtexture("objects/lady/ladybikinileft.jpg",250)
If itext=@ladybikiniyellowtext then *(itext)=guiloadtexture("objects/lady/ladybikiniyellow.jpg",250)
If itext=@ladybikiniyellowlefttext then *(itext)=guiloadtexture("objects/lady/ladybikiniyellowleft.jpg",250)
If itext=@ladybikiniredtext then *(itext)=guiloadtexture("objects/lady/ladybikinired.jpg",250)
If itext=@ladybikiniredlefttext then *(itext)=guiloadtexture("objects/lady/ladybikiniredleft.jpg",250)
If itext=@ladybikinibluetext then *(itext)=guiloadtexture("objects/lady/ladybikiniblue.jpg",250)
If itext=@ladybikinibluelefttext then *(itext)=guiloadtexture("objects/lady/ladybikiniblueleft.jpg",250)
If itext=@ladybikinigreentext then *(itext)=guiloadtexture("objects/lady/ladybikinigreen.jpg",250)
If itext=@ladybikinigreenlefttext then *(itext)=guiloadtexture("objects/lady/ladybikinigreenleft.jpg",250)
If itext=@carshadowtext then *(itext)=guiloadtexture("objects/carshadow.jpg",250)
If itext=@carshadowbacktext then *(itext)=guiloadtexture("objects/carshadowback.jpg",250)
If itext=@carpoliceshadowtext then *(itext)=guiloadtexture("objects/carpoliceshadow.jpg",250)
If itext=@carpoliceshadowbacktext then *(itext)=guiloadtexture("objects/carpoliceshadowback.jpg",250)
If itext=@shadowcrosstext then *(itext)=guiloadtexture("media/shadowcross.bmp",250)
If itext=@shadowonewaytext then *(itext)=guiloadtexture("media/shadowoneway.bmp",250)
If itext=@shadowparkingtext then *(itext)=guiloadtexture("media/shadowparking.bmp",250)
If itext=@shadowcitytext then *(itext)=guiloadtexture("media/shadowcity.bmp",250)
If itext=@shadowcitykmtext then *(itext)=guiloadtexture("media/shadowcitykm.bmp",250)
If itext=@shadowlamptext then *(itext)=guiloadtexture("media/shadowlamp.bmp",250)
If itext=@shadowroctext then *(itext)=guiloadtexture("media/shadowroc.bmp",250)
If itext=@shadowc150text then *(itext)=guiloadtexture("media/shadowc150.jpg",250,110)
If itext=@shadow737text then *(itext)=guiloadtexture("media/shadow737.jpg",250,110)
If itext=@shadowballontext then *(itext)=guiloadtexture("media/shadowballon.jpg",250,110)
If itext=@horsetext then *(itext)=guiloadtexture("objects/horseheadlow.jpg")
If itext=@handtext then *(itext)=guiloadtexture("media/hand.jpg",252)
If itext=@snowtext then *(itext)=guiloadtexture("media/grass_snow.jpg")
If itext=@spottext then *(itext)=guiloadtexture("media/spot.jpg",100,0,3)
If itext=@mywomantext Then 
	If FileExists("woman/chateau22.jpg") Then
		*(itext)=guiloadtexture("woman/chateau22.jpg")
	Else 
		*(itext)=guiloadtexture("media/girl.jpg")'nathalie.jpg")
	EndIf
EndIf
If itext=@nathalietext then *(itext)=guiloadtexture("media/nathalie.jpg")
If itext=@veroniquetext then *(itext)=guiloadtexture("media/veronique.jpg")
If itext=@christinetext Then
	If FileExists("media/alix1.jpg") Then
		*(itext)=guiloadtexture("media/alix1.jpg")
	ElseIf Rnd<0.5 Then 
		*(itext)=guiloadtexture("media/christine.jpg")
	Else 
		*(itext)=guiloadtexture("media/womansmile.jpg")
	EndIf
EndIf
If itext=@cocacolatext Then
	If Rnd>0.5 Then 
		*(itext)=guiloadtexture("media/jane.jpg")'cocacola.jpg")
	Else 
		*(itext)=guiloadtexture("media/alix.jpg")
	EndIf
EndIf
If itext=@marisoltext then *(itext)=guiloadtexture("media/marisol.jpg")
End Sub
Dim Shared As uint dummytext
Sub myglbindtexture(gltexture2d As uint,itext As uint Ptr)
If *(itext)=0 Then
	If gllist=0 Then loadtextures(itext)
   If *(itext)=0 Then *(itext)=dummytext 
EndIf
glbindtexture0(gltexture2d,*(itext))
End Sub


Dim Shared As string typejpg,typepng,mapstyle,hostname,path,apikey,apikeystat,apikeybing
typejpg="jpg-baseline"
typepng="png"
mapstyle="&style=feature:road%7Cvisibility:off&style=element:labels%7Cvisibility:off&style=element:geometry.stroke%7Cvisibility:off"
hostname="maps.googleapis.com"
lat=48.891977155490395   :lng=2.237673523003608  
Dim Shared As Integer size=640,scale=2:size=512
path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=satellite&format="+typejpg+mapstyle
'Dim Shared As Double tloadwebtext=-2
'Dim Shared As Integer tloadwebtext2=0
Dim Shared As hbitmap hbmpweb,hbmpwebzoom
Dim Shared As hdc bmpwebdc,bmpwebzoomdc
Dim Shared As Any Ptr bmpwebbits,bmpwebzoombits
Dim Shared As uint bmpwebx=1,bmpweby=1
ReDim Shared As uint webpicbits(1 To bmpwebx*bmpweby)
ReDim Shared As uint webpicbits0(1 To bmpwebx*bmpweby)
Dim Shared As uint bmpwebzoomx=1,bmpwebzoomy=1
ReDim Shared As uint webzoompicbits(1 To bmpwebx*bmpweby)
'Dim Shared As Single xweb1=-99999999,yweb1
Dim Shared As Single dxweb1=1,dyweb1=1
Var ficapi=ExePath+"/apikey.txt"
apikey=""
If FileExists(ficapi) Then
  file=FreeFile
  Open ficapi For Input As #file
  If Not Eof(file) Then Line Input #file,ficin:apikey=trim(ficin)
  Close #file
  If apikey<>"" Then apikey="&key="+apikey
EndIf
apikeystat="&key=AIzaSyAnliCSQNwHgqO3vnAxug4u9LlHLkIfxe0"
Dim Shared As Integer iapikey=999
Function myapikey()As String
	iapikey+=1
	If iapikey>40 Then iapikey=0:Return apikeystat'keep this for my stats
	Return apikey
End Function
If FileExists(ExePath+"/woman/girl2.jpg") Then
   apikeystat=apikey	
EndIf
Var ficapibing=ExePath+"/apikeybing.txt"
apikeybing=""
If FileExists(ficapibing) Then
  file=FreeFile
  Open ficapibing For Input As #file
  If Not Eof(file) Then Line Input #file,ficin:apikeybing=trim(ficin)
  Close #file
  If apikeybing<>"" Then apikeybing="&key=%20"+apikeybing
EndIf

Function getpixbits(x As Integer,y As Integer)As UInteger
	If x<1 Or x>bmpwebx Then Return 0
	If y<1 Or y>bmpweby Then Return 0
	Return webpicbits((x-1)*bmpweby+y)
End Function
'Dim Shared As Integer testworld=0
'Dim Shared As Single myworldx=0,myworldy=-145
Declare Sub loadwebterrain(zoom1 As integer)
Declare Sub loadwebterrainmap(zoom1 As integer)
Dim Shared As Single dlat=0.1,dlon=0.1,latmx,lngmx,xweb0=999000,yweb0=999000,latweb0,lngweb0',klon=1
Dim Shared As Integer webzoom=13
Sub latlngtomxy(ByVal latxx As single,ByVal lngxx As Single ,ByRef mxx As Single,ByRef myy As Single)
	If kmxlat<10 Then mxx=0:myy=0:Exit Sub 
	If Abs(xweb0-xweb)<0.01 And Abs(yweb0-yweb)<0.01 Then		
   	myy=yweb0+(latxx-latweb0)*kmxlat'latmx
	   mxx=xweb0+(lngxx-lngweb0)*kmxlat/klon'lngmx
	   'mxx=max(-9999999.0,min(9999999.0,mxx))
	   'myy=max(-9999999.0,min(9999999.0,myy))
	   Exit Sub
	EndIf
	Var lat0=lat,lng0=lng
	mxytolatlng(xweb,yweb)
	myy=yweb+(latxx-lat)*kmxlat'latmx
	mxx=xweb+(lngxx-lng)*kmxlat/klon'lngmx
   'mxx=max(-9999999.0,min(9999999.0,mxx))
   'myy=max(-9999999.0,min(9999999.0,myy))
	xweb0=xweb:yweb0=yweb
	lngweb0=lng:latweb0=lat
	'mxytolatlng(mx,my)
	'myy=my+(latxx-lat)*kmxlat'latmx
	'mxx=mx+(lngxx-lng)*kmxlat/klon'lngmx
	'myy=(myyy-535+my)/2
	'mxx=(mxxx+mx)/2
	lat=lat0:lng=lng0 
End Sub
'Dim Shared As Single xweb2,yweb2,kmxlat2=0.1,lat2,lng2
Sub latlngtomxy2(ByVal latxx As single,ByVal lngxx As Single ,ByRef mxx As Single,ByRef myy As Single)
	'latlngtomxy(latxx,lngxx,mxx,myy):Exit Sub 
	'Var lat0=lat,lng0=lng
	'mxytolatlng(xweb2,yweb2)
	'mxx=xweb2+(lngxx-lng2)*kmxlat2/klon'dxweb/dlon
	'myy=yweb2+(latxx-lat2)*kmxlat2'dyweb/dlat
	'lat=lat0:lng=lng0
	If iworld>200 Then Exit Sub 
	If tdrawworld=1 Then mxx=iworldx(iworld):myy=iworldy(iworld):Exit Sub 
	Var lat0=lat,lng0=lng
	mxytolatlng(xweb,yweb)'mxmap,mymap)
	myy=yweb+(latxx-lat)*kmxlat'-440*kscalex/500'latmx
	mxx=xweb+(lngxx-lng)*kmxlat/klon'+920*kscalex/500'lngmx
	'myy=(myyy-535+my)/2
	'mxx=(mxxx+mx)/2
	lat=lat0:lng=lng0 
	iworldx(iworld)=mxx:iworldy(iworld)=myy
End Sub
Sub latlngtomxy1(ByVal latxx As double,ByVal lngxx As Double ,ByRef mxx As Single,ByRef myy As Single)
	Var lat0=lat,lng0=lng
   MercatorLatLngtoPoint(latxx,lngxx)
   Dim As Double xx=pointx,yy=750+750/2-pointy
   Dim As Double mapautoix=xx*535/750,mapautoiy=yy*2*276/750
   Dim As Double aux=(8/40)/(4*k8*512*scalex)  
	If worldname="world" Then
		testworld=1
		worldx=myworldx:worldy=myworldy 
	Else
		testworld=0
	EndIf
   mxx=(mapautoix-535-worldx)/(aux*535)
   myy=(276+worldy-mapautoiy)/(aux*2*276)
	lat=lat0:lng=lng0 
End Sub
Sub mxytolatlng(x0 As Single,y0 As Single)
	Var x=x0+xweb,y=y0+yweb
	x=x0:y=y0
	If worldname="world" Then
		testworld=1
		worldx=myworldx:worldy=myworldy 
	Else
		testworld=0
	EndIf
	'Var k8=6
   Var aux=(8/40)/(4*k8*512*scalex)  
   Var mapautoix=535+worldx+(x)*aux*535
   Var mapautoiy=(276+worldy)-(y)*aux*276*2
	Var xx=mapautoix*750/535,yy=mapautoiy*(375)/276
	'Var pix00=Point(xx,yy,worldbmp)'1500x750
	'Var scx=1'0.9995
	'Var scy=1'1.013'49/42'45
	'Var pointx0=xx*scx,pointy0=750+(750/2-yy)*scy'*49.5/43
	Var pointx0=xx,pointy0=750+(375-yy)'*49.5/43
	'zoom=11
	'Dim As Integer zoom1=zoom
	'If x960>2000 Then zoom1=zoom-1
	'If testscale=1 Then zoom1+=1
   'Var worldmx0=pointx0*(2^zoom1)
   'Var worldmy0=pointy0*(2^zoom1)
	If testworld=1 Then
		MercatorPointtoLatLng(pointx0,pointy0)
	Else 
	   myMercatorPointtoLatLng(pointx0,pointy0)
	EndIf 
End Sub
Declare Sub loadwebtext2()
Declare Sub updatetownwaynode()
Sub subsetmapautotextures(ByVal userdata As Any Ptr)
      'loadwebtextzoom2()
      setmapautotextures1()
      updatetownwaynode()
      tloadwebtext2=3
End Sub             
'Sub subsetmapautotextureszoom(ByVal userdata As Any Ptr)
      'loadwebtextzoom2()
      'setmapautotextures()
'      tloadwebtext2=0
'End Sub
Dim Shared As Integer myred(256),mygreen(256),myblue(256),mygreen2(256)
For i=0 To 256
	Var j=i'-128.0
	Var jj=140'100
	Var jjj=210
	Var k=(jj+256.0)/(jj+Abs(j))
	Var p=Int(max2(0,min2(255,Int(j/k))))
	Var kk=(jjj+256.0)/(jjj+Abs(j))
	Var pp=Int(max2(0,min2(255,Int(j/kk))))
	Var ppp=Int(max2(0,min2(255,Int(251-(251-pp)*0.8))))
	myred(i)=p
	mygreen(i)=pp
	myblue(i)=p
	If pp>54 Then
		mygreen2(i)=ppp
	Else
		mygreen2(i)=pp
	EndIf
	'myred(i)=i
	'mygreen(i)=i
	'myblue(i)=i
Next
Dim Shared As Double t10=7,t11=0,t111,t222,t300=700
Dim Shared As Integer tcancel=0,ttestroad=0
Declare Sub loadwebtext3(zoom1 As Integer)
Dim Shared As Double tloadwebtext0
/'Function bmpdummy() As Any Ptr
Dim As Integer i 
For i=0 To 200
	recvdata(i)=0
Next
Return Fl_JPEG_ImageMem("myjpgdummy", @recvdata(0))
End Function '/
Sub loadwebtext(ByVal userdata As Any Ptr)
	'If tloadwebtext2=2 Then Exit Sub
	tquitweb=0
	tcancel=0
	If worldname="world" Then
		testworld=1
		worldx=myworldx:worldy=myworldy 
	Else
		testworld=0
	EndIf
  	If Timer<tloadwebtext+t10-0.5 Then Sleep min2(t300,Int((tloadwebtext+t10-Timer)*1000))
   If Timer<tloadwebtext0+6.5 Then tloadwebtext2=0:Exit Sub 
   If tloadwebtext0<1000 Then tloadwebtext0=Timer
	tloadwebtext=Timer+20
	tloadwebtext2=2 
	'Var k8=6
   Var aux=(8/40)/(4*k8*512*scalex)  
   Var mapautoix=535+worldx+(xweb1+100000)*aux*535
   Var mapautoiy=(276+worldy)-(yweb1+100000)*aux*276*2
	Var xx=mapautoix*750/535,yy=mapautoiy*(750/2)/276
	'Var pix00=Point(xx,yy,worldbmp)'1500x750
	Var scx=1'0.9995
	Var scy=1'1.013'49/42'45
	pointx0=xx*scx:pointy0=750+(750/2-yy)*scy'*49.5/43
	'zoom=11
	webzoom=zoom
	Dim As Integer zoom1=zoom
	If x960>2000 Then zoom1=zoom-1
	'If testscale=1 Then zoom1+=1
   worldmx0=pointx0*(2^zoom1)
   worldmy0=pointy0*(2^zoom1)
   mapautoix=535+worldx+(xweb1)*aux*535
   mapautoiy=(276+worldy)-(yweb1)*aux*276*2
   /'If testworld=1 Then
   	If max(Abs(xweb1),Abs(yweb1))>2000000 Then
         Var aux=(8/40)/(4*k8*512*scalex)  
         mapautoix=535+worldx+(xweb1)*aux*535
         mapautoiy=(276+worldy)-(yweb1)*aux*276*2
   		worldx=max(-535,min(535,mapautoix-535))
   		worldy=max(-276,min(276,mapautoiy-276))
   		myworldx=worldx:myworldy=worldy
   		dmx0=0:dmy0=0:mx=0:my=0
   		xweb=0:yweb=0:xweb1=0:yweb1=0
   	EndIf
   EndIf'/
	xx=mapautoix*750/535:yy=mapautoiy*(750/2)/276
	'Var pix00=Point(xx,yy,worldbmp)'1500x750
	pointx=xx*scx:pointy=750+(750/2-yy)*scy'*49.5/43
   worldmx=pointx*(2^zoom1)
   worldmy=pointy*(2^zoom1)
	If testworld=1 Then
		MercatorPointtoLatLng(pointx0,pointy0)
		Var lat0=lat,lng0=lng
		MercatorPointtoLatLng(pointx,pointy)
		dlat=lat0-lat:dlon=lng0-lng
	Else 
	   myMercatorPointtoLatLng(pointx0,pointy0)
	   Var lat0=lat,lng0=lng
	   myMercatorPointtoLatLng(pointx,pointy)
	   dlat=lat0-lat:dlon=lng0-lng
	EndIf 
	dxweb1=100000*1500/max(1,worldmx0-worldmx)
	dyweb1=100000*1500/max(1,worldmy0-worldmy)
	If tbing=1 And plane>0 And car=0 Then dxweb1*=0.5:dyweb1*=0.5
   'size=563
   'dxweb1=size*(2^(20-zoom1))
   'dyweb1=size*(2^(20-zoom1))
   'guinotice Str(dyweb1)+" / "+Str(dxweb1)'18000000 37500
	klon1=dlon/max(0.000001,dlat)
	lat0=lat:lng0=lng
  	mxytolatlng(mx+dmx0,my+dmy0)
  	Var latmx0=lat,lngmy0=lng
  	mxytolatlng(mx+dmx0+10000,my+dmy0+10000)
  	kmxlat=10000/max(0.0000001,Abs(lat-latmx0))
  	lat=lat0:lng=lng0
  	'kmxlat=dyweb1*2/max(0.000001,dlat)
	'auxvar=worldmx0-worldmx
	'auxvar2=worldmy0-worldmy
	'auxvar=lat:auxvar2=lng'lat35:-2 lat43:+6
	'auxvar=dxweb1:auxvar2=dyweb1
	'auxvar=pointx

'lat=48.891977155490395   :lng=2.237673523003608  
scale=2:size=563':kxweb=(1-512/563)/2'Int(512/(1-0.12))'512
'If (mz-mzsol0)<500 Then scale=1
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=satellite&format="+typejpg+mapstyle
Var mapstyle3=Str(mapstyle)
If zoom1>=13 Then
	mapstyle3="&style=feature:road%7Cvisibility:on&style=element:labels%7Cvisibility:off&style=element:geometry.stroke%7Cvisibility:off"
EndIf
path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=hybrid&format="+typejpg+mapstyle3
If tgoogle=1 Then path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=terrain&format="+typejpg+mapstyle3
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=terrain&format="+typejpg+mapstyle
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(6)+"&scale="+Str(1)+"&size="+Str(256)+"x"+Str(256)+"&maptype=terrain&format="+typejpg+mapstyle
If mapdisplay=5 Then
 path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=hybrid&format="+typejpg	
EndIf
Var iretry=9
retry1:
If tbing=1 Then
 'http://dev.virtualearth.net/REST/v1/Imagery/Map/aerial/47.619048,-122.35384/15?mapSize=500,500&key=%20Aq0npnXsrnwL9eY3rCUQsJZJJedr8Za9hIH-XsWnppaizf92DYjKS1syE9K3HqVr	
 Var hostname="dev.virtualearth.net"
 'Var apikeybing="&key=%20Aq0npnXsrnwL9eY3rCUQsJZJJedr8Za9hIH-XsWnppaizf92DYjKS1syE9K3HqVr"
 Var msize=Int(scale*size)
 'path="/REST/v1/Imagery/Map/aerial/"+Str(lat)+","+Str(lng)+"/"+Str(zoom1)+"?mapSize="+Str(msize)+","+Str(msize)+"&format=png"
 If plane=0 Or car>0 Then
 	path="/REST/v1/Imagery/Map/Aerial/"+Str(lat)+","+Str(lng)+"/"+Str(zoom1+1)+"?mapSize="+Str(msize)+","+Str(msize)+"&format=jpeg"
 Else 
   path="/REST/v1/Imagery/Map/Aerial/"+Str(lat)+","+Str(lng)+"/"+Str(zoom1+2)+"?mapSize="+Str(msize)+","+Str(msize)+"&format=jpeg"
 EndIf 
 If googleerror=0 Then 
	webidata=httppost(hostname,path+apikeybing)
	'guinotice Str(webidata)+" "+Str(msize)
	'Var i=0,mwtext=""
	'For i=0 To 6'00
	'	mwtext+=Chr(recvdata(i))
	'Next
	'If Left(mwtext,4)<>"ÿØÿà" Then guinotice "ÿØÿà"
	'If Left(mwtext,4)<>"‰PNG" Then guinotice "‰PNG"
	'guinotice Left(mwtext,600)
 Else
	webidata=0
 EndIf 
Else 
 Var hostname="maps.googleapis.com"
 If googleerror=0 Then 
	webidata=httppost(hostname,path+myapikey)
 Else
	webidata=0
 EndIf 
EndIf 
If webidata>2 Then'And tbing=1 Then
	'guinotice Str(Asc("ÿ"))+" "+Str(Asc("Ù"))+"  "+Str(&hD9)+" "+Str(recvdata(webidata-1))'217
	'recvdata(webidata-1)=0 '=>crash
	If recvdatagoogle(webidata-1)<>217 Or recvdatagoogle(webidata-2)<>255 Then
		If auxtest>0.001 Then guinotice "error jpg end"
		webidata=0
	EndIf
EndIf '/ 
If webidata=0 Then 
   Dim As Integer i 
   For i=0 To 200
   	recvdatagoogle(i)=0
   Next
EndIf
'auxvar3=webidata
If webidata<-15 Or tquitweb=1 Then tloadwebtext=Timer:tloadwebtext2=0:Exit Sub

'Var bmp=Fl_JPEG_ImageMem(0, @recvdata(0))
'Var bmp=LoadRGBAMemory(@recvdata(0),12500000) 
Var mem=FreeImage_OpenMemory(@recvdatagoogle(cdatagoogle),12500000)' as FIMEMORY Ptr
Var fifjpeg=fif_jpeg'fif_jpeg
'If tbing=0 Then fifjpeg=fif_png
Var bmp0=FreeImage_LoadFromMemory(fifjpeg, mem, 0)
'Var bmp0=FreeImage_LoadFromMemory(fif_png, mem, 0)
Var bmp=freeimage_convertto32bits(bmp0)
freeimage_flipvertical(bmp)
freeimage_unload(bmp0)
Var w=freeimage_getwidth(bmp)
Var h=freeimage_getheight(bmp)
Var d=freeimage_getbpp(bmp)\8
Var buffjpg=FreeImage_Getbits(bmp)
'guinotice Str(w)+" "+Str(h)
'Var buffjpg1=@(FreeImage_Getbits(bmp)[0]):guinotice Str(buffjpg1-buffjpg)
/'Var bmp=Fl_JPEG_ImageMem("myjpg"+Str(Int(size*scale)), @recvdata(0))
'Var bmp=Fl_png_ImageMem("myjpg", @recvdata(0),webidata)
If bmp=0 Then 
	guinotice "bmp=0"
	bmp=bmpdummy()
	'tloadwebtext=Timer:tloadwebtext2=0:Exit Sub 	
EndIf
Var w = Fl_ImageW(bmp) ' width
var h = Fl_ImageH(bmp) ' height
Var d = Fl_ImageD(bmp) ' depth
var p = Fl_ImageLD(bmp) ' pitch
var c = Fl_ImageCount(bmp) ' image count
Var buffjpg = Fl_ImageData(bmp)[0] ' pixel buffer
'/
'auxvar3=w+1
'guinotice Str(bmp)+"  "+Str(webidata)+"  "+Str(w)+"  "+Str(h)
Var kw=w/(2*size),kh=h/(2*size)
If w<100 Or h<100 Or w<>2*size Or h<>2*size Then
   'Fl_ImageDelete(bmp)
   If iretry<5 Then
      'Fl_ImageDelete(bmp)
      freeimage_unload(bmp)
      freeimage_closememory(mem)
      guinotice "error load webtext "+Str(bmp)+" idata="+Str(webidata)+" w="+Str(w)+" h="+Str(h)
   	iretry+=1:Sleep 3000:GoTo retry1
   EndIf
   Sleep t300'2000
	'tloadwebtext=Timer+1:tloadwebtext2=0
	guierror=1
	If kw>0.1 And Abs(kw-kh)<0.001 Then guierror=2
	w=2*size:h=2*size
	'Exit Sub 
EndIf
'Dim As hbitmap hbmp
'Dim As hdc bmpdc
Dim As uint x,y,bmpx,bmpy,itexture
'Dim As Any Ptr bmpbits
'Const ScrCopy = &HCC0020
'If guiwindc0=0 Then guiwindc0=getdc(0)
'guiwindc0=0'guiopenglwindc
'hbmp=guiloadbmpdib("bmp/bmp256x256.bmp")
getlockterrainbmp2()
If bmpwebdc<>0 Then 
  deletedc(bmpwebdc)
  bmpwebdc=0
EndIf 
If hbmpweb<>0 Then 
  deleteobject(hbmpweb)
  hbmpweb=0
EndIf   
x=w:y=h
hbmpweb=guicreateDIBbmp(x,y)
bmpwebbits=guigetbmpdibbits(hbmpweb)
'guinotice("bmpbits "+Str(bmpbits))
bmpwebdc=createcompatibleDC(guiwindc0)
selectobject(bmpwebdc,hbmpweb)
guigetbmpXY(bmpwebdc,bmpwebx,bmpweby)
'bmpx=x:bmpy=y
'guinotice("x="+Str(x)+"  y="+Str(y)+"  bmpx="+Str(bmpx)+" bmpy="+Str(bmpy))
'SetStretchBltMode(bmpdc,COLORONCOLOR )
'StretchBlt(bmpdc, 0, 0, bmpx,bmpy, bmp2dc, 0, 0, x,y, ScrCopy)
'bitblt(bmpdc,0,0,bmpx,bmpy,bmp2dc,0,0,srccopy)
Dim As uint pix,k,r,g,b,a:Dim As uint i
If UBound(webpicbits)<bmpwebx*bmpweby Then
	If auxtest>0.6 Then guinotice "redim"
	ReDim As uint webpicbits(1 To bmpwebx*bmpweby)
	ReDim As uint webpicbits0(1 To bmpwebx*bmpweby)
EndIf
  'GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=0:a=255 Shl 24
  Var kk=0.01,k1=Int(kk)
  For i=1 To min2(bmpwebx*bmpweby,UBound(webpicbits))
    If guierror=0 Then   
     b=(buffjpg[k])
     g=(buffjpg[k+1])
     r=(buffjpg[k+2])
     k+=d
    ElseIf guierror=2 Then
     k1=Int(kk):kk+=kw
     k=k1*d
     b=(buffjpg[k])
     g=(buffjpg[k+1])
     r=(buffjpg[k+2])
    Else 	
     r=70:g=160:b=70
    EndIf  
	 webpicbits0(i)=a+(r Shl 16)+(g Shl 8)+(b)
    If tgoogle=2 And b>80 And g>80 And g>b+10 And b>r Then g=mygreen2(g) Else g=mygreen(g)'buffjpg[k+1])
    r=myred(r)'buffjpg[k])
    b=myblue(b)'buffjpg[k+2])
    'k+=d
    If tgoogle=1 Then 
     If r<b+15 And r>160 And g>160 And b>160 Then
    	 r-=160:b-=160:g-=100
     ElseIf tgoogle=1 And g>r+20 And g>b+20 Then'forest
    	 r=0:b=0:g*=0.5
     EndIf
    EndIf  

	 webpicbits(i)=a+(r Shl 16)+(g Shl 8)+(b)
  Next
'Fl_ImageDelete(bmp)
freeimage_unload(bmp)
freeimage_closememory(mem)
guierror=0

  If (mz-mzsol0)<20000 And mapdisplay<>5 Then
  	  Sleep t300'1000
  	  If tbing=1 And plane>0 And car=0 Then
  	  	loadwebtext3(zoom1+1):ttestroad=1
  	  Else 
  	  	loadwebtext3(zoom1):ttestroad=1
  	  EndIf
  Else
  	  ttestroad=0
  EndIf
  SetBitmapBits hbmpweb,bmpwebx*bmpweby*4,@webPicBits(1)
freelockterrainbmp()
If testworld=1 Then
	Sleep t300'1000
	getlockterrain2()
	loadwebterrain(zoom1)
	freelockterrain()
EndIf
Sleep t300'1000
tloadwebtext2=1  
'If tquitweb=1 Then tloadwebtext2=0:tloadwebtext=0
End Sub
Dim Shared As Byte testroad(1200,1200)
Dim Shared As UByte testroadr(1200,1200),testroadg(1200,1200),testroadb(1200,1200)
Dim Shared As Integer testroaddx=563*2+1,testroaddy=563*2+1
Dim Shared As Single testroadxweb,testroadyweb
Dim Shared As Byte testtree(1200,1200)
Dim Shared As UByte testtreer(1200,1200),testtreeg(1200,1200),testtreeb(1200,1200)
Dim Shared As Integer testtreedx=563*2+1,testtreedy=563*2+1
Dim Shared As Single testtreexweb,testtreeyweb
Sub setterrainroadwater()
Dim As Integer i,j,k,n,ii,jj,ix,iy
Var di=1
Var ki=testroaddx/512
Var kj=testroaddy/512
Var zwater=(waterz-4)/scalez
'waterz=hwater0*scalez+4
Var zwater1=(waterz-4)/scalez+0.03
Var zwater0=zwater+0.01
For i=2 To 512-2
	ix=Int(i*ki)
	For j=2 To 512-2
	  If terrain22(i,j)>zwater0 Then 
	   iy=Int(j*kj)
	   Var test=0
		If testroad(ix,iy)=3 Then'water
			test=1
		ElseIf testroad(ix+1,iy)=3 Then'water
			test=1
		elseIf testroad(ix,iy+1)=3 Then'water
			test=1
		elseIf testroad(ix+1,iy+1)=3 Then'water
			test=1
		EndIf
		If test=1 Then 
			var zz=zwater1+Int((terrain22(i,j)-zwater)/5.0)*5.0
			terrain22(i,j)=zz
			terrain22(i+1,j)=zz
			terrain22(i-1,j)=zz
			terrain22(i,j+1)=zz
			terrain22(i,j-1)=zz
			terrain22(i+1,j+1)=zz
			terrain22(i-1,j-1)=zz
		EndIf
	  EndIf 	
	Next
Next
End Sub
Sub loadwebtext3(zoom1 As Integer)
scale=2:size=563':kxweb=(1-512/563)/2'Int(512/(1-0.12))'512
'If (mz-mzsol0)<500 Then scale=1
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=satellite&format="+typejpg+mapstyle
'Var mapstyle3=Str(mapstyle)
'If zoom1>=13 Then
Var mapstyle3="&style=feature:road%7Cvisibility:on&style=element:labels%7Cvisibility:off&style=element:geometry.stroke%7Cvisibility:off"
'EndIf
path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=roadmap&format="+typejpg+mapstyle3
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=terrain&format="+typejpg+mapstyle
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(6)+"&scale="+Str(1)+"&size="+Str(256)+"x"+Str(256)+"&maptype=terrain&format="+typejpg+mapstyle
If mapdisplay=5 Then
 'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=roadmap&format="+typejpg	
EndIf
Var iretry=9
retry2:
Var hostname="maps.googleapis.com"
If googleerror=0 Then 
	webidata=httppost(hostname,path+myapikey)
Else
	webidata=0
EndIf 
If webidata>2 Then
	'guinotice Str(Asc("ÿ"))+" "+Str(Asc("Ù"))+"  "+Str(&hD9)+" "+Str(recvdata(webidata-1))'217
	If recvdatagoogle(webidata-1)<>217 Or recvdatagoogle(webidata-2)<>255 Then
		If auxtest>0.001 Then guinotice "error jpg end"
		webidata=0
	EndIf
EndIf 
If webidata=0 Then 
   Dim As Integer i 
   For i=0 To 200
   	recvdatagoogle(i)=0
   Next
EndIf
'auxvar3=webidata
If webidata<-15 Or tquitweb=1 Then tloadwebtext=Timer:tloadwebtext2=0:Exit Sub

Var mem=FreeImage_OpenMemory(@recvdatagoogle(cdatagoogle),12500000)' as FIMEMORY Ptr
Var bmp0=FreeImage_LoadFromMemory(fif_jpeg, mem, 0)
Var bmp=freeimage_convertto32bits(bmp0)
freeimage_flipvertical(bmp)
freeimage_unload(bmp0)
Var w=freeimage_getwidth(bmp)
Var h=freeimage_getheight(bmp)
Var d=freeimage_getbpp(bmp)\8
Var buffjpg=FreeImage_Getbits(bmp)
/'Var bmp=Fl_JPEG_ImageMem(0, @recvdata(0))
'Var bmp=Fl_JPEG_ImageMem("myjpg3"+Str(Int(size*scale)), @recvdata(0))
'Var bmp=Fl_png_ImageMem("myjpg", @recvdata(0),webidata)
If bmp=0 Then 
	guinotice "bmp=0"
	bmp=bmpdummy()
	'tloadwebtext=Timer:tloadwebtext2=0:Exit Sub 	
EndIf
Var w = Fl_ImageW(bmp) ' width
var h = Fl_ImageH(bmp) ' height
Var d = Fl_ImageD(bmp) ' depth
var p = Fl_ImageLD(bmp) ' pitch
var c = Fl_ImageCount(bmp) ' image count
Var buffjpg = Fl_ImageData(bmp)[0] ' pixel buffer
'/
If w<100 Or h<100 Or w<>2*size Or h<>2*size Then
   'Fl_ImageDelete(bmp)
   If iretry<5 Then
      'Fl_ImageDelete(bmp)
      freeimage_unload(bmp)
      freeimage_closememory(mem)
      guinotice "error load webtext3"
   	iretry+=1:Sleep 3000:GoTo retry2
   EndIf
   Sleep t300'2000
   guierror=1
   w=2*size:h=2*size
	'tloadwebtext=timer+1:tloadwebtext2=0
   'freeimage_unload(bmp)
   'freeimage_closememory(mem)
	'Exit Sub 
EndIf
'Dim As hbitmap hbmp
'Dim As hdc bmpdc
Dim As uint x,y,bmpx,bmpy,itexture
'Dim As Any Ptr bmpbits
'Const ScrCopy = &HCC0020
'If guiwindc0=0 Then guiwindc0=getdc(0)
'guiwindc0=0'guiopenglwindc
'hbmp=guiloadbmpdib("bmp/bmp256x256.bmp")
/'If bmpwebdc<>0 Then 
  deletedc(bmpwebdc)
  bmpwebdc=0
EndIf 
If hbmpweb<>0 Then 
  deleteobject(hbmpweb)
  hbmpweb=0
EndIf '/   
x=w:y=h
/'hbmpweb=guicreateDIBbmp(x,y)
bmpwebbits=guigetbmpdibbits(hbmpweb)
'guinotice("bmpbits "+Str(bmpbits))
bmpwebdc=createcompatibleDC(guiwindc0)
selectobject(bmpwebdc,hbmpweb)
guigetbmpXY(bmpwebdc,bmpwebx,bmpweby)
'bmpx=x:bmpy=y
'guinotice("x="+Str(x)+"  y="+Str(y)+"  bmpx="+Str(bmpx)+" bmpy="+Str(bmpy))
'SetStretchBltMode(bmpdc,COLORONCOLOR )
'StretchBlt(bmpdc, 0, 0, bmpx,bmpy, bmp2dc, 0, 0, x,y, ScrCopy)
'bitblt(bmpdc,0,0,bmpx,bmpy,bmp2dc,0,0,srccopy)
'/
Dim As uint pix,k,r,g,b,a,argb,argb2,argb3:Dim As uint i
If UBound(webpicbits)<bmpwebx*bmpweby Then
	If auxtest>0.6 Then guinotice "redim"
	ReDim As uint webpicbits(1 To bmpwebx*bmpweby)
	ReDim As uint webpicbits0(1 To bmpwebx*bmpweby)
EndIf
  'GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=0:a=255 Shl 24
  r=128:g=r:b=r
  argb=a+(r Shl 16)+(g Shl 8)+(b)
  r=15:g=r:b=r
  argb2=a+(r Shl 16)+(g Shl 8)+(b)
  r=128+32:g=128+16:b=0 
  argb3=a+(r Shl 16)+(g Shl 8)+(b)
  If testroaddx<bmpwebx Or testroaddy<bmpweby Then 
    guinotice "testroaddx error ! "+Str(bmpwebx)+" "+Str(bmpweby)
    'Fl_ImageDelete(bmp)
    freeimage_unload(bmp)
    freeimage_closememory(mem)
    Exit Sub    
    'testroaddx=bmpwebx:testroaddy=bmpweby
    'ReDim As Byte testroad(testroaddx,testroaddy)
    'ReDim As UByte testroadr(testroaddx,testroaddy)
    'ReDim As UByte testroadg(testroaddx,testroaddy)
    'ReDim As UByte testroadb(testroaddx,testroaddy)
  EndIf   
  testroaddx=bmpwebx:testroaddy=bmpweby
  Var iroad=-1,jroad=0
  For i=1 To min2(bmpwebx*bmpweby,UBound(webpicbits))
  	 iroad+=1
  	 If iroad>=testroaddx Then
  	 	iroad=0:jroad+=1
  	 EndIf
  	 If guierror=0 Then 
     b=(buffjpg[k])
     g=(buffjpg[k+1])
     r=(buffjpg[k+2])
     k+=d
    Else  
     r=70:g=170:b=70
  	 EndIf  
    testroadr(iroad,jroad)=r
    testroadg(iroad,jroad)=g
    testroadb(iroad,jroad)=b
    If r>240 And g>240 And b>240 Then
    	webpicbits(i)=argb Or (webpicbits(i) And argb2)
    	testroad(iroad,jroad)=1
    ElseIf r>225 And Abs(g-234)<30 And Abs(b-165)<30 Then
    	webpicbits(i)=argb3 Or (webpicbits(i) And argb2)
    	testroad(iroad,jroad)=2
    ElseIf b>r*1.2 And b>1.1*g Then'water 
    	testroad(iroad,jroad)=3
    Else
    	testroad(iroad,jroad)=0
    EndIf
  Next
  testroadxweb=xweb1
  testroadyweb=yweb1
  If testtreedx<bmpwebx Or testtreedy<bmpweby Then 
    guinotice "testtreedx error !"
    'Fl_ImageDelete(bmp)
    freeimage_unload(bmp)
    freeimage_closememory(mem)
    Exit Sub    
    'testtreedx=bmpwebx:testtreedy=bmpweby
    'ReDim As Byte testtree(testtreedx,testtreedy)
    'ReDim As UByte testtreer(testtreedx,testtreedy)
    'ReDim As UByte testtreeg(testtreedx,testtreedy)
    'ReDim As UByte testtreeb(testtreedx,testtreedy)
  EndIf   
  testtreedx=bmpwebx:testtreedy=bmpweby
  Var itree=-1,jtree=0,rrr=r,rr=r,ggg=g,gg=g,bbb=b,bb=b
  Var dr=5,dg=5,db=5,ntree=0,itree2=0,jtree2=0
  'dr=8:dg=8:db=8
  Var g70=mygreen(70),g10=mygreen(10),g120=mygreen(120)
  g70=70:g10=10:g120=120
  g70=90
  Var r1=70,g1=60,b1=51
  For itree2=0 To testtreedx Shr 1
  	For jtree2=0 To testtreedy Shr 1
  		testtree(itree2,jtree2)=0
  	Next
  Next
  Var rr2=rr,gg2=gg,bb2=bb
  Var rrr2=rrr,ggg2=ggg,bbb2=bbb
  'zoom1 13,14,15
  For i=1 To min2(bmpwebx*bmpweby,UBound(webpicbits))
  	 itree+=1
  	 If itree>=testtreedx Then
  	 	itree=0:jtree+=1
  	 EndIf
  	 Var pix=webpicbits0(i)'webpicbits(i)
  	  rrr2=rr2:rr2=rrr
  	  ggg2=gg2:gg2=ggg
  	  bbb2=bb2:bb2=bbb
  	  rrr=rr:rr=r
  	  ggg=gg:gg=g
  	  bbb=bb:bb=b
    r=(pix Shr 16)And 255
    g=(pix Shr 8)And 255
    b=pix And 255
    testtreer(itree,jtree)=r
    testtreeg(itree,jtree)=g
    testtreeb(itree,jtree)=b
    testtree(itree,jtree)=0
   If tgoogle=2 Then 
    Var test1=0,drr=dr,dgg=dg,dbb=db
    If (Abs(r-r1)<10 And Abs(g-g1)<10 And Abs(b-b1)<10) Then
    	test1=1
    	drr=2:dgg=2:dbb=2
    EndIf
    'If (Abs(r-64)<10 And Abs(g-71)<10 And Abs(b-54)<10) Then
    	'test1=1
    	'drr=2:dgg=2:dbb=2
    'EndIf
    'If (g>r*1.12 and g>b*1.02 and g<g70 and g>g10) Then
    'If (g>r*1.08 and g>b*1.04 and g<g70 and g>g10) Or test1=1 Then
    If (g>r*1.01 and g>b*1.04 and g<g70 and g>g10) Or test1=1 Then
		 If Abs(rr-r)>drr Or Abs(gg-g)>dgg Or Abs(bb-b)>dbb Then
		 	If testroad(itree,jtree)=0 And testroad(itree+1,jtree)=0 And testroad(itree,jtree+1)=0 And _
		 	   testroad(itree+1,jtree+1)=0 And testroad(itree+2,jtree)=0 And testroad(itree,jtree+2)=0 Then
   		 	'If (itree+jtree)And 1 Then
   		 	 'If (itree+jtree)And 2 Then 	
   		 		testtree(itree Shr 1,jtree Shr 1)=1
   		 		ntree+=1
   		 	 'EndIf 	
   		 	'EndIf
   		Else  	
   		 		testtree(itree Shr 1,jtree Shr 1)=0
		 	EndIf
		 ElseIf Abs(rrr-r)>drr Or Abs(ggg-g)>dgg Or Abs(bbb-b)>dbb Then
		 	If testroad(itree,jtree)=0 And testroad(itree+1,jtree)=0 And testroad(itree,jtree+1)=0 And _
		 	   testroad(itree+1,jtree+1)=0 And testroad(itree+2,jtree)=0 And testroad(itree,jtree+2)=0 Then
   		 	'If (itree+jtree)And 1 Then
   		 	 'If (itree+jtree)And 2 Then 	
   		 		testtree(itree Shr 1,jtree Shr 1)=1
   		 		ntree+=1
   		 	 'EndIf 	
   		 	'EndIf
   		Else  	
   		 		testtree(itree Shr 1,jtree Shr 1)=0
		 	EndIf
		 EndIf
    ElseIf (g>r*1.08 and g>b*1.04 and g>g70 And g<g120) Then
		 If Abs(rr-r)<dr and Abs(gg-g)<dg And Abs(bb-b)<db Then
		 	If testroad(itree,jtree)=0 And testroad(itree+1,jtree)=0 And testroad(itree,jtree+1)=0 And _
		 	   testroad(itree+1,jtree+1)=0 And testroad(itree+2,jtree)=0 And testroad(itree,jtree+2)=0 Then
   		 		testtree(itree Shr 1,jtree Shr 1)=2'cowland
   		Else  	
   		 		testtree(itree Shr 1,jtree Shr 1)=0
		 	EndIf
		 EndIf 	
    EndIf
   ElseIf tgoogle=1 Then
   	r=myred(r)
   	g=mygreen(g)
   	b=myblue(b)
   	If (r>b+15 Or r<160 Or g<160 Or b<160) And g>r+20 And g>b+20 Then'forest
    	   'r=0:b=0:g*=0.5
		   testtree(itree Shr 1,jtree Shr 1)=1
      Else 	
  	   	'testtree(itree Shr 1,jtree Shr 1)=0
  	   EndIf 	
   EndIf
  Next
  testtreexweb=xweb1
  testtreeyweb=yweb1
  'guinotice Str(ntree)	
'Fl_ImageDelete(bmp)
freeimage_unload(bmp)
freeimage_closememory(mem)
guierror=0
	
End Sub
Function gettestroad(x As Single,y As Single)As Integer
Dim As Integer i,j,k
If ttestroad=0 Then Return 0 
	Var k06=kxweb,k66=1-k06-k06
	'Var tyy=k06+k66*(y-yweb+dyweb-512)*0.5/dyweb
	Var tyy=0.5+k66*(y-testroadyweb)*0.5/dyweb
	'Var txx=max(-1,min(2.0,k06+k66*(x-xweb+dxweb-256)*0.5/dxweb))
	Var txx=0.5+k66*(x-testroadxweb)*0.5/dxweb
	'gltexcoord2f(txx,tyy)
i=testroaddx*max(0.00001,min(0.9999,txx))
j=testroaddy*max(0.00001,min(0.9999,1-tyy))
testroadrr=testroadr(i,j)
testroadgg=testroadg(i,j)
testroadbb=testroadb(i,j)
Return testroad(i,j)
End Function
Function gettestroadtree(x As Single,y As Single)As Integer
Dim As Integer i,j,k
If ttestroad=0 Then Return 1'Return 0 
	Var k06=kxweb,k66=1-k06-k06
	'Var tyy=k06+k66*(y-yweb+dyweb-512)*0.5/dyweb
	Var tyy=0.5+k66*(y-testroadyweb)*0.5/dyweb
	'Var txx=max(-1,min(2.0,k06+k66*(x-xweb+dxweb-256)*0.5/dxweb))
	Var txx=0.5+k66*(x-testroadxweb)*0.5/dxweb
	'gltexcoord2f(txx,tyy)
i=testroaddx*max(0.00001,min(0.9999,txx))
j=testroaddy*max(0.00001,min(0.9999,1-tyy))
testroadrr=testroadr(i,j)
testroadgg=testroadg(i,j)
testroadbb=testroadb(i,j)
If testtree(i Shr 1,j Shr 1)=2 Then Return 4'cowland
If testtree(i Shr 1,j Shr 1)=0 Then Return 1
Return testroad(i,j)
End Function
Function gettesttree(x As Single,y As Single)As Integer
Dim As Integer i,j,k
If ttestroad=0 Then Return 0 
	Var k06=kxweb,k66=1-k06-k06
	'Var tyy=k06+k66*(y-yweb+dyweb-512)*0.5/dyweb
	Var tyy=0.5+k66*(y-testtreeyweb)*0.5/dyweb
	'Var txx=max(-1,min(2.0,k06+k66*(x-xweb+dxweb-256)*0.5/dxweb))
	Var txx=0.5+k66*(x-testtreexweb)*0.5/dxweb
	'gltexcoord2f(txx,tyy)
i=testtreedx*max(0.00001,min(0.9999,txx))
j=testtreedy*max(0.00001,min(0.9999,1-tyy))
Return testtree(i Shr 1,j Shr 1)
End Function
Declare Sub loadwebtextzoom2()
Dim Shared As Single dxwebzoom1=10000,dywebzoom1=10000
dim shared as single kzoom=0.5
Sub loadwebtextzoom(ByVal userdata As Any Ptr)
	'If tloadwebtext2=2 Then Exit Sub
	If worldname="world" Then
		testworld=1
		worldx=myworldx:worldy=myworldy 
	Else
		testworld=0
	EndIf
  	If Timer<tloadwebtext+t10-1 Then Sleep min2(t300,Int((tloadwebtext+t10-Timer)*1000))
	tloadwebtext=Timer+20
	tloadwebtext2=2 
	'Var k8=6
   Var aux=(8/40)/(4*k8*512*scalex)  
   Var mapautoix=535+worldx+(xwebzoom1+100000)*aux*535
   Var mapautoiy=(276+worldy)-(ywebzoom1+100000)*aux*276*2
	Var xx=mapautoix*750/535,yy=mapautoiy*(750/2)/276
	'Var pix00=Point(xx,yy,worldbmp)'1500x750
	Var scx=1'0.9995
	Var scy=1'1.013'49/42'45
	pointx0=xx*scx:pointy0=750+(750/2-yy)*scy'*49.5/43
	'zoom=11
	kzoom=4/dkzoom'0.25
	Var dzoom=-2,zoom1=zoom
	Dim As Integer webzoom1=max2(zoom,webzoom)
	If x960>2000 Then webzoom1=max2(zoom-1,webzoom-1)
	webzoom1=max2(6,webzoom1+dzoom)
	If dkzoom>6.1 Then
		If ntownnear>10 Then
			webzoom1=17
		Else
			webzoom1=16
		EndIf
	ElseIf dkzoom>1.1 Then
		If ntownnear>10 Then
			webzoom1=16
		Else
			webzoom1=15
		EndIf
	ElseIf dkzoom>0.9 Then
		webzoom1=13
	ElseIf dkzoom>0.1 Then
		webzoom1=10
	ElseIf dkzoom<0.1 Then
		webzoom1=6
	EndIf
	lat0=lat:lng0=lng
  	mxytolatlng(xwebzoom1,ywebzoom1)
  	Var lat1=lat,lng1=lng
  	lat=lat0:lng=lng0
'lat=48.891977155490395   :lng=2.237673523003608  
Var scale=1,size=563':kxweb=(1-512/563)/2'Int(512/(1-0.12))'512
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=satellite&format="+typejpg+mapstyle
Var mapstyle3=Str(mapstyle)
mapstyle3="&style=feature:road%7Cvisibility:on&style=element:labels%7Cvisibility:on&style=element:geometry.stroke%7Cvisibility:on"
path="/maps/api/staticmap?center="+Str(lat1)+","+Str(lng1)+"&zoom="+Str(webzoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=hybrid&format="+typejpg+mapstyle3
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1)+"&scale="+Str(scale)+"&size="+Str(size)+"x"+Str(size)+"&maptype=terrain&format="+typejpg+mapstyle
'path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(6)+"&scale="+Str(1)+"&size="+Str(256)+"x"+Str(256)+"&maptype=terrain&format="+typejpg+mapstyle
Var iretry=9
retry3:
Var hostname="maps.googleapis.com"
If googleerror=0 Or tinittown0>1 Then 
	webidata=httppost(hostname,path+myapikey)
Else
	webidata=0
EndIf 
If webidata>2 Then
	'guinotice Str(Asc("ÿ"))+" "+Str(Asc("Ù"))+"  "+Str(&hD9)+" "+Str(recvdata(webidata-1))'217
	If recvdatagoogle(webidata-1)<>217 Or recvdatagoogle(webidata-2)<>255 Then
		If auxtest>0.001 Then guinotice "error jpg end"
		webidata=0
	EndIf
EndIf 
If webidata=0 Then 
   Dim As Integer i 
   For i=0 To 200
   	recvdatagoogle(i)=0
   Next
EndIf
'auxvar3=webidata
If webidata<-15 Or tquitweb=1 Then tloadwebtext=Timer:tloadwebtext2=0:Exit Sub

Var mem=FreeImage_OpenMemory(@recvdatagoogle(cdatagoogle),12500000)' as FIMEMORY Ptr
Var bmp0=FreeImage_LoadFromMemory(fif_jpeg, mem, 0)
Var bmp=freeimage_convertto32bits(bmp0)
freeimage_flipvertical(bmp)
freeimage_unload(bmp0)
Var w=freeimage_getwidth(bmp)
Var h=freeimage_getheight(bmp)
Var d=freeimage_getbpp(bmp)\8
Var buffjpg=FreeImage_Getbits(bmp)
/'Var bmp=Fl_JPEG_ImageMem(0, @recvdata(0))
'Var bmp=Fl_JPEG_ImageMem("myjpgzoom", @recvdata(0))
'Var bmp=Fl_png_ImageMem("myjpg", @recvdata(0),webidata)
If bmp=0 Then 
	guinotice "bmp=0"
	bmp=bmpdummy()
	'tloadwebtext=Timer:tloadwebtext2=0:Exit Sub 	
EndIf
Var w = Fl_ImageW(bmp) ' width
var h = Fl_ImageH(bmp) ' height
Var d = Fl_ImageD(bmp) ' depth
var p = Fl_ImageLD(bmp) ' pitch
var c = Fl_ImageCount(bmp) ' image count
Var buffjpg = Fl_ImageData(bmp)[0] ' pixel buffer
'/
If w<100 Or h<100 Or w<>1*size Or h<>1*size Then
   'Fl_ImageDelete(bmp)
   If iretry<5 Then
      'Fl_ImageDelete(bmp)
      freeimage_unload(bmp)
      freeimage_closememory(mem)
      guinotice "error load terrainzoom"
   	iretry+=1:Sleep 3000:GoTo retry3
   EndIf
   Sleep t300'2000
   guierror=1
   w=size:h=size
	'tloadwebtext=Timer+1:tloadwebtext2=0
	'Exit Sub 
EndIf
'Dim As hbitmap hbmp
'Dim As hdc bmpdc
Dim As uint x,y,bmpx,bmpy,itexture
'Dim As Any Ptr bmpbits
'Const ScrCopy = &HCC0020
'If guiwindc0=0 Then guiwindc0=getdc(0)
'guiwindc0=0'guiopenglwindc
'hbmp=guiloadbmpdib("bmp/bmp256x256.bmp")
getlockterrainbmp2()
If bmpwebzoomdc<>0 Then
  deletedc(bmpwebzoomdc)
  bmpwebzoomdc=0
EndIf
If hbmpwebzoom<>0 Then 
  deleteobject(hbmpwebzoom)
  hbmpwebzoom=0
EndIf 
x=w:y=h
hbmpwebzoom=guicreateDIBbmp(x,y)
bmpwebzoombits=guigetbmpdibbits(hbmpwebzoom)
'guinotice("bmpbits "+Str(bmpbits))
bmpwebzoomdc=createcompatibleDC(guiwindc0)
selectobject(bmpwebzoomdc,hbmpwebzoom)
guigetbmpXY(bmpwebzoomdc,bmpwebzoomx,bmpwebzoomy)
'bmpx=x:bmpy=y
'guinotice("x="+Str(x)+"  y="+Str(y)+"  bmpx="+Str(bmpx)+" bmpy="+Str(bmpy))
'SetStretchBltMode(bmpdc,COLORONCOLOR )
'StretchBlt(bmpdc, 0, 0, bmpx,bmpy, bmp2dc, 0, 0, x,y, ScrCopy)
'bitblt(bmpdc,0,0,bmpx,bmpy,bmp2dc,0,0,srccopy)
Dim As uint pix,k,r,g,b,a:Dim As uint i
If UBound(webzoompicbits)<bmpwebzoomx*bmpwebzoomy Then
	ReDim As uint webzoompicbits(1 To bmpwebzoomx*bmpwebzoomy)
EndIf
  'GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=0:a=255 Shl 24
  For i=1 To bmpwebzoomx*bmpwebzoomy'UBound(picbits)
    If guierror=0 Then  
     b=buffjpg[k]
     g=buffjpg[k+1]
     r=buffjpg[k+2]
     k+=d
    Else  
     r=70:g=170:b=70
    EndIf  
	 webzoompicbits(i)=a+(r Shl 16)+(g Shl 8)+(b)
  Next
  SetBitmapBits hbmpwebzoom,bmpwebzoomx*bmpwebzoomy*4,@webzoomPicBits(1)
  freelockterrainbmp()
'Fl_ImageDelete(bmp)	
freeimage_unload(bmp)
freeimage_closememory(mem)
guierror=0

'If tquitweb=1 Then tloadwebtext2=0:Exit Sub 
Sleep t300'1000
tloadwebtext2=4
 
End Sub
Dim Shared As uint bmpwebx2=1,bmpweby2=1
ReDim Shared As uint webpicr(1 To bmpwebx2*bmpweby2)
ReDim Shared As uint webpicg(1 To bmpwebx2*bmpweby2)
ReDim Shared As uint webpicb(1 To bmpwebx2*bmpweby2)
Dim Shared As Single xweb10=0,yweb10=0,dxweb10=1,dyweb10=1
Dim Shared As Double tloadwebmap=0
Sub loadwebmap()
	If tloadwebtext2=2 Then Exit Sub
	getlockterrain()
	tloadwebtext2=2
	If Timer<tloadwebmap+t10-0.5 Then Sleep min2(t300,Int((tloadwebmap+t10-Timer)*1000))
   tloadwebmap=Timer
	Var lat0=lat,lng0=lng
	'Var k8=6
   Var aux=(8/40)/(4*k8*512*scalex)  
   Var mapautoix=535+worldx+(xweb10+100000)*aux*535
   Var mapautoiy=(276+worldy)-(yweb10+100000)*aux*276*2
	Var xx=mapautoix*750/535,yy=mapautoiy*(750/2)/276
	'Var pix00=Point(xx,yy,worldbmp)'1500x750
	Var scx=1'0.9995
	Var scy=1'1.013'49/42'45
	pointx0=xx*scx:pointy0=750+(750/2-yy)*scy'*49.5/43
   pointx0-=0.0000158
   pointy0-=0.000011
	'zoom=11
	Dim As Integer zoom1=11
   worldmx0=pointx0*(2^zoom1)
   worldmy0=pointy0*(2^zoom1)
   mapautoix=535+worldx+(xweb10)*aux*535
   mapautoiy=(276+worldy)-(yweb10)*aux*276*2
	xx=mapautoix*750/535:yy=mapautoiy*(750/2)/276
	'Var pix00=Point(xx,yy,worldbmp)'1500x750
	pointx=xx*scx:pointy=750+(750/2-yy)*scy'*49.5/43
   pointx-=0.0000158
   pointy-=0.000011
   worldmx=pointx*(2^zoom1)
   worldmy=pointy*(2^zoom1)
	If testworld=1 Then
		MercatorPointtoLatLng(pointx,pointy)
	Else 
	   myMercatorPointtoLatLng(pointx,pointy)
	EndIf 
	dxweb10=100000*1500.0/max(100,worldmx0-worldmx)
	dyweb10=100000*1500.0/max(100,worldmy0-worldmy)
	Sleep t300'1000
	loadwebterrain(zoom1)
	Sleep t300'1000
	terraintomap()
	lat=lat0:lng=lng0
	tloadwebtext2=0
	freelockterrain()
End Sub
Sub subloadwebmap(ByVal userdata As Any Ptr)
   guinotice("loadmap")
	loadwebmap()
	tloadwebtext2=0
End Sub
Sub loadwebterrain(zoom1 As integer)
'https://maps.googleapis.com/maps/api/staticmap?key=YOUR_API_KEY&center=-33.9,151.14999999999998&zoom=12&format=png
'&maptype=roadmap&style=element:geometry%7Ccolor:0xf5f5f5&style=element:labels%7Cvisibility:off&style=element:labels.icon%7Cvisibility:off&style=element:labels.text.fill%7Ccolor:0x616161&style=element:labels.text.stroke%7Ccolor:0xf5f5f5&style=feature:administrative%7Celement:geometry%7Cvisibility:off&style=feature:administrative.land_parcel%7Cvisibility:off&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0xbdbdbd&style=feature:administrative.neighborhood%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:poi%7Celement:geometry%7Ccolor:0xeeeeee&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x757575&style=feature:poi.park%7Celement:geometry%7Ccolor:0xe5e5e5&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&style=feature:road%7Cvisibility:off&style=feature:road%7Celement:geometry%7Ccolor:0xffffff&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:road.arterial%7Celement:labels.text.fill%7Ccolor:0x757575&style=feature:road.highway%7Celement:geometry%7Ccolor:0xdadada&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0x616161&style=feature:road.local%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&style=feature:transit%7Cvisibility:off&style=feature:transit.line%7Celement:geometry%7Ccolor:0xe5e5e5&style=feature:transit.station%7Celement:geometry%7Ccolor:0xeeeeee&style=feature:water%7Celement:geometry%7Ccolor:0xc9c9c9&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&size=480x360 
'https://maps.googleapis.com/maps/api/staticmap?key=YOUR_API_KEY&center=-33.91219906720679,151.10270729064936&zoom=15&format=png&maptype=roadmap&style=element:labels%7Cvisibility:off&style=feature:administrative%7Celement:geometry%7Cvisibility:off&style=feature:administrative.land_parcel%7Cvisibility:off&style=feature:administrative.neighborhood%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:road%7Cvisibility:off&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:transit%7Cvisibility:off&size=480x360 
Dim As Integer size=512
'If (mz-mzsol0)<700 Then size=256
'If (mz-mzsol0)<100 Then size=256
'Var mapstyle2="&style=feature:road%7Cvisibility:off&style=element:labels%7Cvisibility:off&style=element:geometry.stroke%7Cvisibility:off"
'Var mapstyle2="&style=feature:road%7Cvisibility:off&style=element:labels%7Cvisibility:off&style=element:geometry.stroke%7Cvisibility:off"
'Var mapstyle2="&style=element:geometry%7Ccolor:0xf5f5f5&style=element:labels%7Cvisibility:off&style=element:labels.icon%7Cvisibility:off&style=element:labels.text.fill%7Ccolor:0x616161&style=element:labels.text.stroke%7Ccolor:0xf5f5f5&style=feature:administrative%7Celement:geometry%7Cvisibility:off&style=feature:administrative.land_parcel%7Cvisibility:off&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0xbdbdbd&style=feature:administrative.neighborhood%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:poi%7Celement:geometry%7Ccolor:0xeeeeee&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x757575&style=feature:poi.park%7Celement:geometry%7Ccolor:0xe5e5e5&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&style=feature:road%7Cvisibility:off&style=feature:road%7Celement:geometry%7Ccolor:0xffffff&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:road.arterial%7Celement:labels.text.fill%7Ccolor:0x757575&style=feature:road.highway%7Celement:geometry%7Ccolor:0xdadada&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0x616161&style=feature:road.local%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&style=feature:transit%7Cvisibility:off&style=feature:transit.line%7Celement:geometry%7Ccolor:0xe5e5e5&style=feature:transit.station%7Celement:geometry%7Ccolor:0xeeeeee&style=feature:water%7Celement:geometry%7Ccolor:0xc9c9c9&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x9e9e9e" 
Var mapstyle2="&style=element:labels%7Cvisibility:off&style=feature:administrative%7Celement:geometry%7Cvisibility:off&style=feature:administrative.land_parcel%7Cvisibility:off&style=feature:administrative.neighborhood%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:road%7Cvisibility:off&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:transit%7Cvisibility:off" 
'Var path2="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1-1)+"&scale="+Str(1)+"&size="+Str(size)+"x"+Str(size)+"&maptype=terrain&format="+typejpg+mapstyle2
Var path2="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(zoom1-3)+"&scale="+Str(1)+"&size="+Str(size)+"x"+Str(size)+"&maptype=terrain&format="+typejpg+mapstyle2
Var iretry=9
retry4:
Var hostname="maps.googleapis.com"
If googleerror=0 Then 
	webidata=httppost(hostname,path2+myapikey)
Else
	webidata=0
EndIf 
If webidata>2 Then
	'guinotice Str(Asc("ÿ"))+" "+Str(Asc("Ù"))+"  "+Str(&hD9)+" "+Str(recvdata(webidata-1))'217
	If recvdatagoogle(webidata-1)<>217 Or recvdatagoogle(webidata-2)<>255 Then
		If auxtest>0.001 Then guinotice "error jpg end"
		webidata=0
	EndIf
EndIf 
If webidata=0 Then 
   Dim As Integer i 
   For i=0 To 200
   	recvdatagoogle(i)=0
   Next
EndIf
'auxvar3=webidata
If webidata<-15 Or tquitweb=1 Then tloadwebtext=Timer:tloadwebtext2=0:Exit Sub

Var mem=FreeImage_OpenMemory(@recvdatagoogle(cdatagoogle),12500000)' as FIMEMORY Ptr
Var bmp0=FreeImage_LoadFromMemory(fif_jpeg, mem, 0)
Var bmp=freeimage_convertto32bits(bmp0)
freeimage_flipvertical(bmp)
freeimage_unload(bmp0)
Var w=freeimage_getwidth(bmp)
Var h=freeimage_getheight(bmp)
Var d=freeimage_getbpp(bmp)\8
Var buffjpg=FreeImage_Getbits(bmp)
/'Var bmp=Fl_JPEG_ImageMem(0, @recvdata(0))
'Var bmp=Fl_JPEG_ImageMem("myjpg2"+Str(size), @recvdata(0))
If bmp=0 Then 
	guinotice "bmp=0"
	bmp=bmpdummy()
	'tloadwebtext=Timer+1:tloadwebtext2=0:Exit Sub 	
EndIf
Var w = Fl_ImageW(bmp) ' width
var h = Fl_ImageH(bmp) ' height
Var d = Fl_ImageD(bmp) ' depth
var p = Fl_ImageLD(bmp) ' pitch
var c = Fl_ImageCount(bmp) ' image count
Var buffjpg = Fl_ImageData(bmp)[0] ' pixel buffer
'/
If w<100 Or h<100 Or w<>1*size Or h<>1*size Then
   'Fl_ImageDelete(bmp)
   If iretry<5 Then
      'Fl_ImageDelete(bmp)
      freeimage_unload(bmp)
      freeimage_closememory(mem)
      guinotice "error load webterrain"
   	iretry+=1:Sleep 3000:GoTo retry4
   EndIf
   Sleep t300'1000
   guierror=1':quit=1
   'tloadwebtext=Timer+1:tloadwebtext2=0
	'Exit Sub 
	w=size:h=size
EndIf
'Dim As hbitmap hbmp
'Dim As hdc bmpdc
Dim As uint x,y,bmpx,bmpy
x=w:y=h
bmpx=x:bmpy=y
'getlockterrain2()
If bmpwebx2*bmpweby2<bmpx*bmpy Then 
 bmpwebx2=bmpx:bmpweby2=bmpy
 ReDim As uint webpicr(1 To bmpx*bmpy)
 ReDim As uint webpicg(1 To bmpx*bmpy)
 ReDim As uint webpicb(1 To bmpx*bmpy)
EndIf  
Dim As uint pix,k,r,g,b,a:Dim As uint i,j
k=0:a=255 Shl 24
'For i=1 To bmpx*bmpy'UBound(picbits)
'bmpx=min2(bmpx,512)
'bmpy=min2(bmpy,512)
For i=1 To bmpx*bmpy
  If guierror=0 Then 
    webpicb(i)=buffjpg[k]
    webpicg(i)=buffjpg[k+1]
    webpicr(i)=buffjpg[k+2]
    k+=d
	 'Var rr=32
	 'if(b>r*1.4 And abs(r-176)<rr and abs(g-208)<rr and abs(b-254)<rr)Then
	 '	terrain(i,j)=-65
	 'Else
	 '	terrain(i,j)=-60+dhmareemax+5
	 'EndIf
  Else 	 
    webpicr(i)=70
    webpicg(i)=170
    webpicb(i)=70
  EndIf 	 
Next
'freelockterrain()
'Fl_ImageDelete(bmp)
freeimage_unload(bmp)
freeimage_closememory(mem)
guierror=0

'guinotice "srtm "+Str(toksrtm)
If toksrtm>=1 And tinternet>=3 Then
	testloadsrtm()
	If msgsrtm<>"" Then
		textspeak=msgsrtm
		msgsrtm=""
	EndIf
EndIf

	
End Sub
Sub loadwebtext2old_()
Dim As uint itexture
'If webtext>0 Then
   'deletedc(bmpwebdc)
   'deleteobject(hbmpweb)
'	Exit Sub
'EndIf
getlockterrainbmp()
glGenTextures(1, @itexture)
'guinotice("texture="+Str(itexture),"ok")
glEnable GL_TEXTURE_2D 
glbindtexture0(GL_TEXTURE_2D, itexture) 
Dim As Single dx,dy 
'dx=log(bmpwebx)/Log(2)
'dy=Log(bmpweby)/Log(2)
'If (Abs(Int(dx)-dx)<0.00001) And (Abs(Int(dy)-dy)<0.00001) Then 
'   glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
'   glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
'   glTexImage2D(GL_texture_2d,0,4, bmpwebx,bmpweby, 0,gl_bgra,GL_UNSIGNED_BYTE, bmpwebbits)
'Else 
Var ret=gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpwebx,bmpweby, GL_BGRA_ext ,GL_UNSIGNED_BYTE ,bmpwebbits )
'EndIf 
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpwebx,bmpweby, GL_BGRA ,GL_UNSIGNED_BYTE ,bmpwebbits )
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA ,GL_UNSIGNED_byte ,@(picbits(1)) ) 
'guinotice("ok mipmap")
deletedc(bmpwebdc)
bmpwebdc=0
deleteobject(hbmpweb)
hbmpweb=0
If ret=0 Then 
  If webtext>0 Then guideletetexture(webtext):webtext=0
  webtext=itexture
EndIf    
itexture=0:glbindtexture0(GL_TEXTURE_2D, itexture)
freelockterrainbmp() 
'webtext=soltexture0
tloadwebtext=Timer+1
'Sleep 1000
End Sub 
Sub loadwebtext2()
Dim As uint itexture
'If webtext>0 Then
   'deletedc(bmpwebdc)
   'deleteobject(hbmpweb)
'	Exit Sub
'EndIf
getlockterrainbmp()
If webtext=0 Then
	glGenTextures(1, @itexture)
	webtext=itexture
EndIf
'guinotice("texture="+Str(itexture),"ok")
glEnable GL_TEXTURE_2D 
glbindtexture0(GL_TEXTURE_2D, webtext)'itexture) 
'Dim As Single dx,dy 
'dx=log(bmpwebx)/Log(2)
'dy=Log(bmpweby)/Log(2)
'If (Abs(Int(dx)-dx)<0.00001) And (Abs(Int(dy)-dy)<0.00001) Then 
'   glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
'   glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
'   glTexImage2D(GL_texture_2d,0,4, bmpwebx,bmpweby, 0,gl_bgra,GL_UNSIGNED_BYTE, bmpwebbits)
'Else 
Var ret=gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpwebx,bmpweby, GL_BGRA_ext ,GL_UNSIGNED_BYTE ,bmpwebbits )
'EndIf 
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpwebx,bmpweby, GL_BGRA ,GL_UNSIGNED_BYTE ,bmpwebbits )
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA ,GL_UNSIGNED_byte ,@(picbits(1)) ) 
'guinotice("ok mipmap")
deletedc(bmpwebdc)
bmpwebdc=0
deleteobject(hbmpweb)
hbmpweb=0
/'If ret=0 Then 
  If webtext>0 Then guideletetexture(webtext):webtext=0
  webtext=itexture
EndIf    
itexture=0:glbindtexture0(GL_TEXTURE_2D, itexture)
'/
freelockterrainbmp() 
'webtext=soltexture0
tloadwebtext=Timer+1
'Sleep 1000
End Sub 
Sub loadwebtextzoom2()
Dim As uint itexture
'If webtextzoom>0 Then
'   deletedc(bmpwebzoomdc)
'   deleteobject(hbmpwebzoom)
'	Exit Sub
'EndIf
getlockterrainbmp()
If webtextzoom=0 Then
	glGenTextures(1, @itexture)
	webtextzoom=itexture
EndIf
'guinotice("texture="+Str(itexture),"ok")
glEnable GL_TEXTURE_2D 
glbindtexture0(GL_TEXTURE_2D, webtextzoom)'itexture) 
'Dim As Single dx,dy 
'dx=log(bmpwebzoomx)/Log(2)
'dy=Log(bmpwebzoomy)/Log(2)
'If (Abs(Int(dx)-dx)<0.00001) And (Abs(Int(dy)-dy)<0.00001) Then 
'   glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
'   glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
'   glTexImage2D(GL_texture_2d,0,4, bmpwebzoomx,bmpwebzoomy, 0,gl_bgra,GL_UNSIGNED_BYTE, bmpwebzoombits)
'Else 
Var ret=gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpwebzoomx,bmpwebzoomy, GL_BGRA_ext ,GL_UNSIGNED_BYTE ,bmpwebzoombits )
'EndIf 
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpwebx,bmpweby, GL_BGRA ,GL_UNSIGNED_BYTE ,bmpwebbits )
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA ,GL_UNSIGNED_byte ,@(picbits(1)) ) 
'guinotice("ok mipmap")
deletedc(bmpwebzoomdc)
bmpwebzoomdc=0
deleteobject(hbmpwebzoom)
hbmpwebzoom=0
/'If ret=0 Then 
  If webtextzoom>0 Then guideletetexture(webtextzoom):webtextzoom=0
  webtextzoom=itexture
EndIf   
itexture=0:glbindtexture0(GL_TEXTURE_2D, itexture) 
'/
freelockterrainbmp()
tloadwebtext=Timer+1
tloadwebtext2=0
	
End Sub
Sub setwebwater(i As Integer,j As Integer,xx As Single,yy As Single)
Dim As UInteger ipix,jpix,pix,r,g,b
Dim As Integer k,l,test=0
If xx<-99999990 Then
   terrain22(i,j)=max(terrain22(i,j),-60+dhmareemax+0.1)
   Exit Sub 	
EndIf
If water(i,j)=1 Then
	mapautotext=soltexture0'watertext
	'If testsea=1 Then terrain(i,j)=-65
	If i>-98 And j>-98 Then
	 	For k=i-2 To i
			For l=j-2 To j
				water(k,l)=1
			Next
		Next
	EndIf
	Exit Sub 
EndIf
getlockterrainbmp2()
     	ipix=1+bmpwebx*(xx-xweb+dxweb)/(dxweb+dxweb)
     	jpix=1+bmpweby*(-yy+yweb+dyweb)/(dyweb+dyweb)
     	pix=getpixbits(jpix,ipix)
     	r=(pix Shr 16)And 255
     	g=(pix Shr 8)And 255
     	b=pix And 255
     	If r<b*0.7 Then
     		If g<b Then
     			test=1
     			If testsea=1 Then terrain22(i,j)=-65
     			water(i,j)=1
     			mapautotext=soltexture0'watertext
     			If i>-97 And i<609 And j>-97 And j<609 Then
     				For k=i-3 To i+3
     					For l=j-3 To j+3
     						water(k,l)=1
     					Next
     				Next
     			EndIf
     		EndIf
     	EndIf
     	If test=0 Then
     	  terrain22(i,j)=max(terrain22(i,j),-60+dhmareemax+0.1)
     	  water(i,j)=0
     	EndIf
   freelockterrainbmp()  	
End Sub
Function hrgb(r As Integer,g As Integer,b As Integer)As Single
Dim As Single h
  'h=120*4000*(g+g-b-r)/(30+r*r+g*g+b*b)
  h=256*58/max(10.0,r+b+g)'+g*(256-r)/256.0)
  h=max(0.0,min(512.0,h))'256
Return h	
End Function
Sub setwebwater2(i As Integer,j As Integer,xx As Single,yy As Single)
If testworld=0 Then
	setwebwater(i,j,xx,yy):Exit Sub 
EndIf
Dim As Integer ipix,jpix,pix,r,g,b
Dim As Integer k,l,test=0
If xx<-99999990 Then
	water(i,j)=0
   terrain22(i,j)=max(terrain22(i,j),-60+dhmareemax+0.1)
   Exit Sub
EndIf
/'If water(i,j)=1 Then
	mapautotext=soltexture0'watertext
	terrain(i,j)=-65
	If i>-98 And j>-98 Then
		For k=i-2 To i
			For l=j-2 To j
				water(k,l)=1
			Next
		Next
	EndIf
	Exit Sub 
EndIf'/
   'ipix=1+bmpwebx2*(xx-xweb+dxweb+dxweb)/(dxweb+dxweb+dxweb+dxweb)
   'jpix=1+bmpweby2*(-yy+yweb+dyweb+dyweb)/(dyweb+dyweb+dyweb+dyweb)
   Var kx=4*2.0
   ipix=1+bmpwebx2*(xx-xweb+dxweb*kx)/(kx*(dxweb+dxweb))
   jpix=1+bmpweby2*(-yy+yweb+dyweb*kx)/(kx*(dyweb+dyweb))
   'pix=getpixbits(jpix,ipix)
   Var ij=(jpix-1)*bmpwebx2+ipix
   If ij<1 Or ij>bmpwebx2*bmpweby2 Then
   	'r=0:g=0:b=0
   Else 
     	r=webpicr(ij)
     	g=webpicg(ij)
     	b=webpicb(ij)
	   Var rr=32
	   If(b>r*1.4)Then
	     If abs(r-176)<rr Then
	     	 If (Abs(g-208)<rr and abs(b-254)<rr)Then
     			test=1
     			terrain22(i,j)=-65
     			water(i,j)=1
     			mapautotext=soltexture0'watertext
     			/'If i>-97 And i<609 And j>-97 And j<609 Then
     			 	Var hwater0=-60+dhmareemax+0.1
     				For k=i-3 To i+3
     					For l=j-3 To j+3
     						If water(k,l)<>1 Then
     							water(k,l)=2
     						   terrain(k,l)=hwater0
     						EndIf
     					Next
     				Next
     			EndIf'/
     		EndIf 	
     	 EndIf
     	EndIf
		Var latx=mylatweb+mydlatweb*(yy-myyweb)/mydyweb
		Var lngx=mylngweb+mydlngweb*(xx-myxweb)/mydxweb
		MercatorLatLngtosrtmlatlng(latx,lngx)
		'Var hsrtm=max(-0.0,0.4*(getsrtmheight(srtmlat,srtmlng)-14))
		Var hsrtm=max(-0.0,0.8*(getsrtmheight(srtmlat,srtmlng)-14))
     	If test=0 Then
     	  Var h=0.0'max(0,(r+g)/2-b)*2'4'*0.1
   	  h=hrgb(r,g,b)'120*4000*(g+g-b-r)/(30+r*r+g*g+b*b)
		  If Abs(h-hrgb0)<90 Then hrgb1=max(0.0,min(256.0,hrgb1+(h-hrgb0)))
		  hrgb0=h
		  h=hrgb1
		  'If testhsrtm<>0 Then h*=0.2
		  'h=max(0.0,min(256.0,h))
     	  h=h+hsrtm-60+dhmareemax+0.1
     	  myzmin+=(max(-65.0,min(myzmin,h))-myzmin)*0.001
     	  myzmax+=(max(myzmax,h)-myzmax)*0.001
     	  terrain22(i,j)=h'(h-60+dhmareemax+0.1)
     	  water(i,j)=0
     	Else 
     	  Var hh=hsrtm-60+dhmareemax+0.1	
        terrain22(i,j)=-65
        water(i,j)=1
     	  myzmin+=(max(-65.0,min(myzmin,hh))-myzmin)*0.001
     	  myzmax+=(max(myzmax,hh)-myzmax)*0.001
     	EndIf
   EndIf   	
End Sub
Sub setwebwater3(i As Integer,j As Integer,xx As Single,yy As Single)
If testworld=0 Then
	Exit Sub 
EndIf
Dim As Integer ipix,jpix,pix,r,g,b
Dim As Integer k,l,test=0
   'ipix=1+bmpwebx2*(xx-xweb10+dxweb10+dxweb10)/(dxweb10+dxweb10+dxweb10+dxweb10)
   'jpix=1+bmpweby2*(-yy+yweb10+dyweb10+dyweb10)/(dyweb10+dyweb10+dyweb10+dyweb10)
   Var kx=4*2.0
   ipix=1+bmpwebx2*(xx-xweb10+dxweb10*kx)/(kx*(dxweb10+dxweb10))
   jpix=1+bmpweby2*(-yy+yweb10+dyweb10*kx)/(kx*(dyweb10+dyweb10))
   'pix=getpixbits(jpix,ipix)
   Var ij=(jpix-1)*bmpwebx2+ipix
   If ij<1 Or ij>bmpwebx2*bmpweby2 Then
   	'r=0:g=0:b=0
   Else 
     	r=webpicr(ij)
     	g=webpicg(ij)
     	b=webpicb(ij)
	   Var rr=32
	   If(b>r*1.4)Then
	     If abs(r-176)<rr Then
	     	 If (Abs(g-208)<rr and abs(b-254)<rr)Then
     			test=1
     			terrain(i,j)=-65
     			'water(i,j)=1
     			'mapautotext=soltexture0'watertext
     			/'If i>-97 And i<609 And j>-97 And j<609 Then
     				Var hwater0=-60+dhmareemax+0.1
     				For k=i-3 To i+3
     					For l=j-3 To j+3
     						If water(k,l)<>1 Then
     							water(k,l)=2
     						   terrain(k,l)=hwater0
     						EndIf
     					Next
     				Next
     			EndIf'/
     		EndIf 	
     	 EndIf
     	EndIf
     	If test=0 Then
     	  Var h=0.0'max(0,(r+g)/2-b)*2'4'*0.1
		  h=hrgb(r,g,b)'120*4000*(g+g-b-r)/(30+r*r+g*g+b*b)
		  'h=max(0.0,min(256.0,h))
     	  terrain(i,j)=(h-60+dhmareemax+0.1)
     	  'water(i,j)=0
     	EndIf
   EndIf   	
End Sub
Sub replace(ByRef text As String,ByRef str1 As String, _  
	              ByRef str2 As String)
Dim As Integer i,j,k,l
Dim As String text2
text2=""
j=1:l=Len(str1)
If l<1 Then Exit Sub  
For i=1 To 2000
	k=InStr(j,text,str1)
	If k<1 Then Exit For 
	text2+=Mid(text,j,k-j)+str2
	j=k+l
Next
text2+=Right(text,Len(text)-j+1)
text=text2
End Sub
Sub latlngtoworldxy(lat As Single,lng As Single,ByRef worldx As double,ByRef worldy As Double)
MercatorLatLngtoPoint(lat,lng)	
	'Var k8=6
   Var aux=(8/40)/(4*k8*512*scalex)  
   'Var mapautoix=535+worldx+(xweb10)*aux*535
   'Var mapautoiy=(276+worldy)-(yweb10)*aux*276*2
	'Var xx=mapautoix*750/535,yy=mapautoiy*(750/2)/276
	'Var pix00=Point(xx,yy,worldbmp)'1500x750
	Var scx=1'0.9995
	Var scy=1'1.013'49/42'45
	'pointx0=xx*scx:pointy0=750+(750/2-yy)*scy'*49.5/43
Var xx=pointx/scx,yy=-(pointy-750)/scy+750/2
Var mapautoix=xx*535/750,mapautoiy=yy*276*2/750
worldx=mapautoix-535-xweb10*aux*535'xweb10=0
worldy=mapautoiy-276+yweb10*aux*276*2
End Sub
Sub worldxytomxy(worldx As double,worldy As double,ByRef mxx As Single,ByRef myy As Single)
	'Var k8=6
   Var aux=(8/40)/(4*k8*512*scalex)  
   'Var mapautoix=535+worldx+(xweb10)*aux*535
   'Var mapautoiy=(276+worldy)-(yweb10)*aux*276*2
	'Var xx=mapautoix*750/535,yy=mapautoiy*(750/2)/276
	'Var pix00=Point(xx,yy,worldbmp)'1500x750
	'Var scx=1'0.9995
	'Var scy=1'1.013'49/42'45
	'pointx0=xx*scx:pointy0=750+(750/2-yy)*scy'*49.5/43
'Var mapautoix=535,mapautoiy=276
mxx=(worldx)/(aux*535)
myy=-(worldy)/(aux*276*2)
'guinotice(Str(mxx)+"/"+Str(myy))
End Sub
Declare Sub resetbridge()
Sub subflyto0(lat1 As Single,lng1 As single) 
lat=lat1:lng=lng1
mx=0:my=0:dmx0=0:dmy0=0:xweb=0:yweb=0:xweb1=xweb-1000000:yweb1=0
latlngtoworldxy(lat,lng,worldx,worldy)
If Abs(worldx)>535 Or Abs(worldy)>276 Then Exit sub
myworldx=worldx:myworldy=worldy
tinittown0=2
lattown=lat:lngtown=lng
latreverse=-89
reverselocation=""
resetmxweb()
resetbridge()
resettownwaynode()
resetfuel()
nshop=999
If car>0 Then volume=1500
Sleep 500	
End Sub
Dim Shared As Integer quit2=0
Function subflyto(lat1 As Single,lng1 As Single)As Integer 
 	If waitbusy()=0 Then Return 0 
 	tloadwebtext2=2
	tinittown=1
	subflyto0(lat1,lng1)
	Sleep 500
	tinittown=0
	tloadwebtext2=0
	tloadwebtext=0
	quit2=0:tquitweb=0
	tmapchanged=1
	Return 1
End Function 
Function subgeocoding0() As Integer 
Dim As Integer i,j,k
Dim As String text
If testworld=0 Or tquitweb=1 Then Return 0
resp="" 
prompt("fly to : enter a location name",resp)
resp=Trim(resp)
If resp="" Then Return 0
replace(resp," ","%20")
If tquitweb=1 Then Return 0 
tquitweb=0
Var hostname="nominatim.openstreetmap.org"
Var path="/search?format=json&q="+resp+"&limit=1"
Var webidata=httppost(hostname,path)
If webidata<10 Then guinotice("not found !","geocoding"):Return 0
text=""
For i=0 To min2(webidata,1000)
	If recvdata(i)=0 Then Exit For
	text+=Chr(recvdata(i))
Next
j=InStr(text,"""lat"":")
If j<1 Then Return 0
text=Mid(text,j+6)
j=InStr(text,"""")
text=Mid(text,j+1)
j=InStr(text,"""")
If j<1 Then Return 0 
Var lat1=Val(Left(text,j-1))
j=InStr(text,"""lon"":")
If j<1 Then Return 0
text=Mid(text,j+6)
j=InStr(text,"""")
text=Mid(text,j+1)
j=InStr(text,"""")
If j<1 Then Return 0
Var lng1=Val(Left(text,j-1))
lat=lat1:lng=lng1
mx=0:my=0:dmx0=0:dmy0=0:xweb=0:yweb=0:xweb1=xweb-1000000:yweb1=0
latlngtoworldxy(lat,lng,worldx,worldy)
If Abs(worldx)>535 Or Abs(worldy)>276 Then Return 0
myworldx=worldx:myworldy=worldy
tinittown0=2
lattown=lat:lngtown=lng
latreverse=-89
reverselocation=""
resetmxweb()
resetbridge()
resettownwaynode()
resetfuel()
timeinit=Timer 
resetsrtm()
resetterrain()
nshop=999
If car>0 Then volume=1500
icombomap=1
selectcomboindex("win.map",icombomap)
xweb1=-999999
xweb11=-999999 
Sleep 500
Return 1
End Function 
Sub subgeocoding()
   If waitbusy()=0 Then Exit Sub 
	tloadwebtext2=2
	tinittown=1
	If subgeocoding0()=1 Then
		initterrain3
   	tmapchanged=1
   	
		itownp=0
      resetaeroway()
      resetmxweb()
      resettownwaynode()
      resetfuel()
	EndIf
	Sleep 500
	tinittown=0
	tloadwebtext2=0
	tloadwebtext=Timer 
	quit2=0:tquitweb=0

tloadwebtext2=0

End Sub
Sub subscaletown0
Dim As Single x
Dim As Integer i	
	resp=Str(k88)
	msg="towns scale : enter a number (4.0(high density) ..6(initial).. 9.0(low density))  last="+Str(k88)
	prompt(msg,resp)
	x=Val(resp)
	If x<3.9 Or x>9.1 Then Exit sub
	x=max(4.0,min(9.0,x)) 
	If Abs(x-k88)>0.01 Then
		k88=x
		xweb1-=1000000
      tinittown0=2
	EndIf
End Sub
Sub subscaletown()
	If tloadwebtext2<>0 Or tinittown<>0 Then
		Var i=0
		quit2=1
		For i=1 To 20
			Sleep 500
			If tloadwebtext2=0 And tinittown=0 Then Exit For
		Next
		If tloadwebtext2<>0 Or tinittown<>0 Then 
		  guinotice("i am busy , try later")
		  quit2=0
		  Exit Sub
		EndIf  
	EndIf
	quit2=0
	tloadwebtext2=2
	tinittown=1
	subscaletown0()
	Sleep 500
	tinittown=0
	tloadwebtext2=0
	tmapchanged=1
End Sub
Dim Shared As String wtext(20),wline,wword
Dim Shared As Integer windex,nwtext,nerr
Dim Shared As String msgprint
Sub Printmsg(text As String="")
	Exit Sub 
	If Len(msgprint)<20000 Then msgprint+=text+Chr(13)+Chr(10)
End Sub
function nextwords(wwline As string,c As String) As String 
	windex=InStr(wwline,c)
	If windex>0 Then
		'wword=Left(wwline,windex-1)
		Return Mid(wwline,windex+Len(c))
	Else
		'wword=""
		'nerr+=1
		Return ""
	EndIf
End Function 
Sub nextword(c As String)
	windex=InStr(wline,c)
	If windex>0 Then
		wword=Left(wline,windex-1)
		wline=Mid(wline,windex+Len(c))
	Else
		wword=""
	EndIf
End Sub
Function formatwebtext(text0 As String)As String
	Dim As Integer i,j,k
	Dim As String c
	wline=text0
	nextword("["):nextword("["):nextword("[")
	j=0:wword=""
	For i=1 To 9999
		c=Mid(wline,i,1)
		If c="[" Then j+=1
		If c="]" Then j-=1
		If j>=0 Then wword+=c
		If j<0 Then Exit For 
	Next
	wline=wword
	nwtext=0
	For i=1 To 1+Rnd*10
		nextword(""""):If windex<=0 Then Exit For
		nextword(""""):If windex<=0 Then Exit For
		If Len(wword)>5 Then nwtext+=1:wtext(nwtext)=wword
		printmsg wword
	Next
	var text2=""
	If nwtext>0 Then text2=wtext(Int(1+Rnd*nwtext*0.99))
	replace(text2,"\u2013","-")
	Var text=""
	j=0:k=0
	For i=1 To Len(text2)
		c=Mid(text2,i,1)
		If c="\" And Mid(text2,i+1,1)="u" Then
			c="-":i+=5
		EndIf
		If c="(" Or c="[" Or c="{" Then j+=1
		If c="/" Then
			'If k=0 Then k=1 Else k=0 EndIf 
		EndIf
		if j=0 and k=0 then text+=c
		If c=")" Or c="]" Or c="}" Then j-=1
	Next
	Return text
End Function
Dim Shared As ZString*12600000 ztext,ztext2
Dim Shared As ZString*40 zcc
Dim Shared As Integer tendofdata=0
Function nextdata0(wwline As String,cc As String,ccc As string) As String
Dim As Integer i,j,i2,lline
Dim As char c,icc,iccc,ic1,ic2
tendofdata=0
icc=Asc(cc):iccc=Asc(ccc):ic1=Asc("}"):ic2=Asc("]")
lline=Len(wwline)
If lline>=12600000-4 Then Return ""
ztext=wwline
ztext2="":i2=0
For i=0 To lline-1
	'c=ztext[i]
	If ztext[i]=icc Then
		For j=i+1 To lline-1
			c=ztext[j]
			If c=iccc Then ztext2[i2]=0:Return Trim(ztext2)
			If c=ic1 Or c=ic2 Then ztext2[i2]=0:tendofdata=1:Return Trim(ztext2)
			ztext2[i2]=c
			i2+=1 
		Next
		ztext2[i2]=0
		Return Trim(ztext2)
	EndIf
Next
nerr+=1
Return ""
i=InStr(wwline,cc)
If i<=0 Then Return ""
wline=Mid(wwline,i+1)
j=InStr(wline,ccc)
If j<=0 Then Return wline
Return Left(wline,j-1) 
End Function
Function nextdata(wwline As String,cc As String,ccc As string) As String
Dim As integer i,j,k,i2,lline
Dim As char c,icc,iccc
ztext=wwline
lline=Len(wwline)
If lline>=8000000 Then Return ""
ztext2="":i2=0
icc=Asc(cc):iccc=Asc(ccc)
	j=1
	k=InStr(wwline,cc)
	If k<=0 Then Return ""
	For i=k+1 To lline
		c=ztext[i]
		If c=iccc Then
			j-=1
		ElseIf c=icc Then
		   j+=1
		EndIf    
		If j>0 Then
			ztext2[i2]=c
			i2+=1
		EndIf
		If j<=0 Then Exit For 
	Next
	ztext2[i2]=0
	'wword=ztext2
Return ztext2'wword
End Function
Dim Shared As String wsplit(99999)
Dim Shared As Integer nsplit=1
Sub split(wwline As String,cc As String)
Dim As Integer i,j,k,kk,k0,p,pp,n,lcc=Len(cc)
dim as char c,c1,c2,cc1,cc2
'ReDim As String wsplit(99999)
nsplit=0
j=0:k=0:kk=Len(wwline)
If kk>=8000000 Then Exit Sub 
ztext=wwline
zcc=cc
c1=Asc("["):c2=Asc("{")
cc1=Asc("]"):cc2=Asc("}")
p=0
For i=1 To kk
	'wline=Mid(wline,k)
	If k>=kk Then Exit For
	k0=k+1 
	For pp=0 To kk-k
	  k+=1
	  If k>=kk Then Exit For 
	  c=ztext[k]
     If c=c1 Or c=c2 Then p+=1
	  If p=0 Then
	  	 For n=0 To lcc-1
	  	 	If ztext[n+k]<>zcc[n] Then Exit For
	  	 	If n=lcc-1 Then Exit For,For
	  	 Next
	  EndIf
	  If c=cc1 Or c=cc2 Then p-=1
	Next pp  	  
	'k=InStr(wline,cc)
	'If k<=0 Then Exit For
	j+=1:wsplit(j)=Trim(mid(wwline,k0,k-k0+1))
	If j>=99998 Then Exit For 
	k+=lcc
Next
nsplit=j
End Sub
Sub printmsgsplit()
printmsg "split="+wsplit(1)+"/nplit="+Str(nsplit)+"/"+(wsplit(nsplit))
guinotice("nsplit="+Str(nsplit)+" /"+wsplit(1))
End Sub
Dim Shared As String wsplit2(99999)
Dim Shared As Integer nsplit2=1
Sub split2(wwline As String,cc As String)
Dim As Integer i,j,k,kk,k0,p,pp,n,lcc=Len(cc)
dim as char c,c1,c2,cc1,cc2
'ReDim As String wsplit2(99999)
nsplit2=0
j=0:k=0:kk=Len(wwline)
If kk>=8000000 Then Exit Sub 
ztext=wwline
zcc=cc
c1=Asc("["):c2=Asc("{")
cc1=Asc("]"):cc2=Asc("}")
p=0
For i=1 To kk
	'wline=Mid(wline,k)
	If k>=kk Then Exit For
	k0=k+1 
	For pp=0 To kk-k
	  k+=1
	  If k>=kk Then Exit For 
	  c=ztext[k]
     If c=c1 Or c=c2 Then p+=1
	  If p=0 Then
	  	 For n=0 To lcc-1
	  	 	If ztext[n+k]<>zcc[n] Then Exit For
	  	 	If n=lcc-1 Then Exit For,For
	  	 Next
	  EndIf
	  If c=cc1 Or c=cc2 Then p-=1
	Next pp  	  
	'k=InStr(wline,cc)
	'If k<=0 Then Exit For
	j+=1:wsplit2(j)=Trim(mid(wwline,k0,k-k0+1))
	If j>=99998 Then Exit For 
	k+=lcc
Next
nsplit2=j
End Sub
Sub printmsgsplit2()
printmsg "split2="+wsplit2(1)+"/nplit="+Str(nsplit2)+"/"+(wsplit2(nsplit2))
guinotice("nsplit2="+Str(nsplit2)+" /"+wsplit2(1))
End Sub
Dim Shared As String text,wtext0,wtext1,wtext2,wtext3,wtext4,wtext5
Function formatwebtext2(text0 As String)As String 'getways
	Dim As Integer i,j,k
	Dim As String c
	wline=nextwords(text0,"""elements"":")
	wtext0=nextdata(wline,"[","]")
	'printmsg "wtext0="+wtext0
	printmsg
	split(wtext0,",")
	printmsgsplit()
	printmsg
	wtext1=wsplit(1)'nextdata(wtext0,"{","}")
	printmsg "wtext1="+wtext1
	printmsg
	wtext2=nextwords(wtext1,"""nodes"":")
	wtext2=nextdata0(wtext2,"[","]")
	printmsg "wtext2="+wtext2
	split(wtext2,",")
	printmsgsplit()
	printmsg 
	wtext2=nextwords(wtext1,"""tags"":")
	wtext2=nextdata(wtext2,"{","}")
	printmsg "wtext2="+wtext2
	printmsg 
	wtext3=nextwords(wtext2,"""building:levels"":")
	wtext3=nextdata0(wtext3,"""","""")
	printmsg "wtext3="+wtext3
	printmsg 
	Var text2=nextdata0(wtext2,"""","""")
	Return text2
End Function
Function formatwebtext3(text0 As String)As String 'getnodes
	Dim As Integer i,j,k
	Dim As String c
	wline=nextwords(text0,"""elements"":")
	wtext0=nextdata(wline,"[","]")
	printmsg "wtext0="+Left(wtext0,400)
	printmsg
	split(wtext0,",")
	printmsgsplit()
	printmsg
	wtext1=wsplit(1)
	printmsg "wtext1="+wtext1
	Var id=0,latnode=0.1,lonnode=0.1
	For i=1 To nsplit
		wtext1=wsplit(i)
		wtext2=nextwords(wtext1,"""id""")
		id=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext2,"""lat""")
		latnode=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext2,"""lon""")
		lonnode=Val(nextdata0(wtext2,":",","))
	Next
	printmsg "id="+Str(id)+" latlon="+Str(latnode)+"/"+Str(lonnode)
	printmsg
	wtext2=nextwords(wtext1,"""id""")
	printmsg nextdata(wtext2,":",",")
	printmsg 
	wtext2=nextwords(wtext1,"""lat""")
	Var text2=nextdata(wtext2,":",",")
	Return text2
End Function
Const As Integer mynnode=4000,nrecentid=2000,naskwayid=90
Dim Shared As Integer myinode=0,mynasknode=180+220,myiasknode=0,myiasknode2=0,myiasknode3=0,irecentid=0,myiaskway=0
Dim Shared As int64 mynodeid(mynnode),myasknodeid(mynasknode),recentid(nrecentid),myaskwayid(naskwayid)
Dim Shared As Single mylat(mynnode),mylon(mynnode)
For i=0 To mynnode
	mynodeid(i)=0
Next
Sub resetrecentid()
Dim As Integer i 
For i=0 To nrecentid
	recentid(i)=0
Next
irecentid=0
End Sub
Function testrecentid(ByVal id As int64)As Integer
Dim As Integer i,j
If id=0 Then Return 1
j=irecentid
For i=0 To nrecentid
	If id=recentid(j) Then
		Return 1
	EndIf
	j-=1:If j<0 Then j=nrecentid
Next
Return 0
End Function
Sub addrecentid(ByVal id As int64)
	If id=0 Then Exit Sub 
	irecentid+=1:If irecentid>nrecentid Then irecentid=0
	recentid(irecentid)=id
End Sub
Sub addmynode(id As int64,latx As Single,lngx  As Single)
Dim As Integer i,j,k	
'Var dlatx=20*360.0/40000,dlonx=dlatx*klon
'auxvar=myinode+0.1:auxtest=0.3
j=myinode
For i=1 To mynnode
	If mynodeid(j)=id Then Exit Sub
	j-=1:If j<1 Then j=mynnode
Next
/'j=myinode
For i=1 To mynnode
	j-=1:If j<1 Then j=mynnode
   If Abs(mylat(j)-latmx)>dlatx Then
   	mynodeid(j)=id
   	mylat(j)=latx
   	mylon(j)=lngx
   	Exit Sub
   EndIf
   If Abs(mylon(j)-lngmx)>dlonx Then	
   	mynodeid(j)=id
   	mylat(j)=latx
   	mylon(j)=lngx
   	Exit Sub
   EndIf
Next '/
myinode+=1:If myinode>mynnode Then myinode=1
mynodeid(myinode)=id
mylat(myinode)=latx
mylon(myinode)=lngx	
End Sub
Function mygetinode(id As int64) As Integer
Dim As Integer i,j
j=myinode
For i=1 To mynnode
	If mynodeid(j)=id Then Return j
	j-=1:If j<1 Then j=mynnode
Next
Return 0
End Function
Sub resetmynode()
Dim As Integer i	
For i=0 To mynnode
	mynodeid(i)=0
Next
End Sub
Const As Integer nnode=99999,nway=29000,naeroway=120 
dim shared as integer nnode2=0
Dim Shared As int64 nodeid(nnode)
Dim Shared As Single latnode(nnode),lonnode(nnode)
Dim Shared As Integer nway2=0,waytheight(nway),nway20
Dim Shared As int64 waynode(nway)
Dim Shared As Single waylat(nway),waylon(nway),wayheight(nway),waywidth(nway),waydo1(nway),waylength(nway)
Dim Shared As Single waynodez(nway),wayheightmin(nway),wayred,waygreen,wayblue,wayr(nway),wayg(nway),wayb(nway)
Dim Shared As Integer addwaynodebuild(nway)
Dim Shared As String waytype(nway),waycolor(nway),wayname(nway)
Dim Shared As Integer iaeroway=0
Dim Shared As String aerowayname(naeroway)
Dim Shared As Single aerowaylat(naeroway),aerowaylon(naeroway),aerowayx(naeroway),aerowayy(naeroway)
Dim Shared As Integer iwaynode(nway)',nwaynode=20
Dim Shared As int64 waynodeid(nway)
Dim Shared As Single waynodex(nway,nwaynode),waynodey(nway,nwaynode)
For i=1 To naeroway
	aerowayname(i)="":aerowaylat(i)=-91:aerowaylon(i)=-181
Next
For i=1 To 18
	aerowayname(i)=nearaerowayname(i):aerowaylat(i)=nearaerowaylat(i):aerowaylon(i)=nearaerowaylon(i)
	If aerowaylat(i)>-89 Then iaeroway=i
Next
Sub resetaddwaynodebuild()
Dim As Integer i
For i=0 To nway
	addwaynodebuild(i)=0
Next
End Sub
Dim Shared As Integer nbroad
Declare Sub setioverpass()
Declare Function formatname(text0 As String)As String
Sub setwayrgb(colour As String)
Dim As String rgbh
rgbh=colour
wayred=0:waygreen=0:wayblue=0
If Left(rgbh,1)="#" Then
	wayred=Val("&h"+Mid(rgbh,2,2))
	waygreen=Val("&h"+Mid(rgbh,4,2))
	wayblue=Val("&h"+Mid(rgbh,6,2))
	wayred=max(0.145,wayred/255)
	waygreen=max(0.145,waygreen/255)
	wayblue=max(0.145,wayblue/255)
	Exit Sub 
EndIf
If colour="black" Then rgbh="#000000"
If colour="white" Then rgbh="#FFFFFF"
if colour="gray" or colour="grey" then rgbh="#808080"
If colour="silver" Then rgbh="#C0C0C0"
If colour="maroon" Then rgbh="#800000"
If colour="red" Then rgbh="#FF0000"
If colour="olive" Then rgbh="#808000"
If colour="yellow" Then rgbh="#FFFF00"
If colour="green" Then rgbh="#008000"
If colour="lime" Then rgbh="#00FF00"
If colour="teal" Then rgbh="#008080"
If colour="aqua" Then rgbh="#00FFFF"
If colour="navy" Then rgbh="#000080"
If colour="blue" Then rgbh="#0000FF"
If colour="purple" Then rgbh="#800080"
If colour="fuchsia" Then rgbh="#FF00FF"
wayred=0:waygreen=0:wayblue=0
If Left(rgbh,1)="#" Then
	wayred=Val("&h"+Mid(rgbh,2,2))
	waygreen=Val("&h"+Mid(rgbh,4,2))
	wayblue=Val("&h"+Mid(rgbh,6,2))
	wayred=max(0.145,wayred/255)
	waygreen=max(0.145,waygreen/255)
	wayblue=max(0.145,wayblue/255)
EndIf
End Sub
Sub addaeroway(nametext As String,latx As single,lngx As Single,dlat0 As Single=0.001,treplace As Integer=0)
Dim As Integer i,j,test
Dim As Single dist,dist1,dist11,dist2,x,y
dist1=3*dlat0*360/40000:dist11=dist1*klon
j=iaeroway+1
test=0
For i=1 To naeroway
	j-=1:If j<1 Then j=naeroway
	If Abs(latx-aerowaylat(j))<dist1 Then
		If Abs(lngx-aerowaylon(j))<dist11 Then
			If treplace=0 Then Exit Sub
			If test=0 Then
				test=1
				aerowayname(j)=formatname(nametext)
		      aerowaylat(j)=latx
		      aerowaylon(j)=lngx
            latlngtomxy(aerowaylat(j),aerowaylon(j),x,y)
            aerowayx(j)=x:aerowayy(j)=y
			Else
				aerowayname(j)=""
				aerowaylat(j)=-91
				aerowaylon(j)=-181
				aerowayx(j)=-9999999
			EndIf 
		EndIf
	EndIf
Next
If test=1 Then Exit Sub 
dist1=20*360/40000
For i=1 To naeroway
	iaeroway+=1:If iaeroway>naeroway Then iaeroway=1
	dist2=max(Abs(aerowaylat(iaeroway)-lat),Abs(aerowaylon(iaeroway)-lng))
	If dist2>dist1 Then
		aerowayname(iaeroway)=formatname(nametext)
		aerowaylat(iaeroway)=latx
		aerowaylon(iaeroway)=lngx
      latlngtomxy(aerowaylat(iaeroway),aerowaylon(iaeroway),x,y)
      aerowayx(iaeroway)=x:aerowayy(iaeroway)=y
		Exit Sub 
	EndIf
Next
dist=max(Abs(latx-lat),Abs(lngx-lng)/klon)
If dist>dist1 Then Exit Sub 
For i=1 To naeroway
	iaeroway+=1:If iaeroway>naeroway Then iaeroway=1
	dist2=max(Abs(aerowaylat(iaeroway)-lat),Abs(aerowaylon(iaeroway)-lng))
	If dist2>dist Then
		aerowayname(iaeroway)=formatname(nametext)
		aerowaylat(iaeroway)=latx
		aerowaylon(iaeroway)=lngx
      latlngtomxy(aerowaylat(iaeroway),aerowaylon(iaeroway),x,y)
      aerowayx(iaeroway)=x:aerowayy(iaeroway)=y
		Exit Sub 
	EndIf
Next
End Sub
Sub resetaeroway()
Dim As Integer i
For i=1 To naeroway
   aerowaylat(i)=-91:aerowaylon(i)=-181:aerowayname(i)=""
Next	
End Sub
Dim Shared As Integer aerotest(naeroway)
Sub setnearaeroway()
Dim As Integer i,j,k 
Dim As Single dist
For i=1 To naeroway
	aerotest(i)=0
Next
For i=1 To 18
	nearaerowaylat(i)=-91:nearaerowayname(i)=""
Next
For i=1 To 18
	dist=999999:k=0
	For j=1 To naeroway
		If aerotest(j)=0 Then
			If dist>max(Abs(aerowaylat(j)-lat),Abs(aerowaylon(j)-lng)/klon) Then
				dist=max(Abs(aerowaylat(j)-lat),Abs(aerowaylon(j)-lng)/klon)
				k=j
			EndIf
		EndIf
	Next
	If k>0 Then
		aerotest(k)=1
		nearaerowayname(i)=aerowayname(k)
		nearaerowaylat(i)=aerowaylat(k)
		nearaerowaylon(i)=aerowaylon(k)
	EndIf
Next
End Sub
Dim Shared As Single aerowayxweb,aerowayyweb
Function testnearairport(x As Single,y As Single,dist As Single=8000)As Integer
Dim As Integer i 
For i=1 To naeroway
  	If aerowaylat(i)>-89 Then
     If Abs(aerowayx(i)-x)<dist Then
     	If Abs(aerowayy(i)-y)<dist Then
     		Return 1
     	EndIf
     EndIf
  	EndIf
Next
Return 0	
End Function
Sub drawaeroways()
Dim As Integer i,j,k,test 
Dim As Single dlat=70*360/40000,dlon=dlat*klon,x,y,z,do1,size
Dim As Single dlat2=50*360/40000,dlon2=dlat2*klon
For i=1 To 18
	nearaerowaylat(i)=-91:nearaerowayname(i)=""
Next
test=0
If Abs(xweb-aerowayxweb)+Abs(yweb-aerowayyweb)>0.01 And iaeroway>0 Then
  test=1:aerowayxweb=xweb:aerowayyweb=yweb
  For i=1 To naeroway
  	If aerowaylat(i)>-89 Then
  		latlngtomxy(aerowaylat(i),aerowaylon(i),x,y)
      aerowayx(i)=x:aerowayy(i)=y
  	EndIf
  Next
EndIf 
k=0:i=iaeroway+1
For j=1 To naeroway
	i-=1:If i<1 Then i=naeroway
	If aerowaylat(i)>-89 Then
		If Abs(aerowaylat(i)-lat)<dlat Then
			If Abs(aerowaylon(i)-lng)<dlon Then            
            'do1=0:size=600'630
            x=aerowayx(i):y=aerowayy(i)
		      If Abs(aerowaylat(i)-lat)<dlat2 Then
			    If Abs(aerowaylon(i)-lng)<dlon2 Then            
              z=getterrainheight(x-dmx0,y-dmy0)
              'drawgasstation(x,y,z,do1,size)
              Var w=1.1
              drawairporttower(x,y,z,w)
			    EndIf
		      EndIf
		      If k=18 Then
		      	Var dist=max(Abs(nearaerowaylat(k)-lat),Abs(nearaerowaylon(k)-lng)/klon)
		      	If max(Abs(aerowaylat(i)-lat),Abs(aerowaylon(i)-lng)/klon)<dist Then
		      		k-=1
		      	EndIf
		      EndIf
            If k<18 Then
            	k+=1
            	nearaerowayname(k)=aerowayname(i)
            	nearaerowaylat(k)=aerowaylat(i)
            	nearaerowaylon(k)=aerowaylon(i)
               nearaerowayx(k)=aerowayx(i)
               nearaerowayy(k)=aerowayy(i)
            EndIf
			EndIf
		EndIf
	EndIf
Next
End Sub
Function airporttext2(i As Integer) As String
Dim As String nametext
If Rnd<0.8 Then Return nearaerowayname(i)
nametext=""
If Rnd<0.5 Then nametext=" "+nearaerowayname(i)
Select Case Int(Rnd*4)
	Case 0
		Return "ground airport"+nametext
	Case 1
		Return "ground control"+nametext
	Case 2
		Return "airport control"+nametext
	Case Else 
		Return "ground airport control"+nametext
End Select
End Function
Function getroadh(waytype As String)As Single
Dim As Single r=1.0
   If (waytype="aerodrome")then
     r=5':tairport=1:
   ElseIf (waytype="runway")then
     r=8':tairport=1:
   ElseIf (waytype="taxiway")then
     r=6':tairport=1:
   ElseIf (waytype="parking")then
     r=0.87':tparking=1:
   ElseIf (waytype="motorway")then
     r=2.8':taddbar=1:
   ElseIf (waytype="trunk")then
     r=2.6':if(oneway=1)thentaddbar=1:}
   ElseIf (waytype="primary")then
     r=2.4
   ElseIf (waytype="secondary")then
     r=1.8
   ElseIf (waytype="tertiary")then
     r=1.2
   ElseIf (waytype="residential")then
     r=1.0
   ElseIf (waytype="service")then
     r=0.7
   ElseIf (waytype="pedestrian")then
	 r=0.5':rt=0.3
   ElseIf (waytype="path")then
     r=0.35':rt=0.25
   ElseIf (waytype="rail")then
     r=0.29
   endif 	 
Return r*30
End Function
Function getinode(id As int64) As Integer
Dim As Integer i,j,k,n 
i=1:j=nnode2
If id=nodeid(i) Then Return i
If id=nodeid(j) Then Return j
If (j-i)<2 Then nerr+=1000:Return 0
k=(j+i)Shr 1'/2
If id=nodeid(k) Then Return k
For n=1 To 100
   If id<nodeid(k) Then
   	j=k
   ElseIf id=nodeid(k) Then
   	Return k
   Else 	
   	i=k
   EndIf
	If (j-i)<2 Then nerr+=1000:Return 0
	k=(j+i)Shr 1'*0.5
Next
nerr+=1000
Return 0
End Function
Sub getnodes(text0 As String) 'getnodes
	Dim As Integer i,j,k
	Dim As String c
	wline=nextwords(text0,"""elements"":")
	If wline="" Then
		setioverpass():Sleep 1000
	   If auxtest>1.01 Then guinotice(Left(text0,800))
	EndIf
	wtext0=nextdata(wline,"[","]")
	'printmsg "wtext0="+Left(wtext0,400)
	'printmsg
	split(wtext0,",")
	'printmsgsplit()
	'printmsg
	'guinotice wsplit(1)
	nnode2=nsplit
	For i=1 To nsplit
		If quit2=1 Or quit=1 Then Exit For 
		wtext1=wsplit(i)
		wtext2=nextwords(wtext1,"""id""")
		nodeid(i)=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext2,"""lat""")
		latnode(i)=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext2,"""lon""")
		lonnode(i)=Val(nextdata0(wtext2,":",","))
	Next
	'printmsg "id="+Str(id)+" latlon="+Str(latnode)+"/"+Str(lonnode)
End Sub 
Sub addasknodes(text0 As String) 'getnodes
	Dim As Integer i,j,k
	Dim As String c
	Dim As Single latx,lngx
	Dim As int64 id
	wline=nextwords(text0,"""elements"":")
	wtext0=nextdata(wline,"[","]")
	'printmsg "wtext0="+Left(wtext0,400)
	'printmsg
	split(wtext0,",")
	'printmsgsplit()
	'printmsg
	Var innode2=nsplit
	For i=1 To nsplit
		If quit2=1 Then Exit For 
		wtext1=wsplit(i)
		wtext2=nextwords(wtext1,"""id""")
		id=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext2,"""lat""")
		latx=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext2,"""lon""")
		lngx=Val(nextdata0(wtext2,":",","))
		addmynode(id,latx,lngx)
	Next
End Sub 
/'Sub getways(text0 As String)'getways
	Dim As Integer i,j,k,test
	Dim As String c
	wline=nextwords(text0,"""elements"":")
	If wline="" Then setioverpass():Sleep 1000
	wtext0=nextdata(wline,"[","]")
	'printmsg "wtext0="+wtext0
	split(wtext0,",")
	'printmsgsplit()
	nway2=nsplit
	For i=1 To nsplit
	 wtext1=wsplit(i)'nextdata(wtext0,"{","}")
 	 wtext2=nextwords(wtext1,"""nodes"":")
	 waynode(i)=Val(nextdata0(wtext2,"[",","))
	 j=getinode(waynode(i))
	 If j<=0 Then
	  waylat(i)=-91
	  waylon(i)=-181	
	 Else
	  waylat(i)=latnode(j)
	  waylon(i)=lonnode(j)
	  Var h1=50+Rnd*700'800
	  If Rnd<0.3 Then h1=70+Rnd*230
	  If h1>450 Then h1*=1.45
	  wayheight(i)=h1'+scalez
	  wtext2=nextwords(wtext1,"""tags"":")
	  If wtext2<>"" Then 
	   wtext2=nextdata(wtext2,"{","}") 
	   wtext3=nextwords(wtext2,"""building:levels""")
	   test=0
	   If wtext3<>"" Then
	 	 wayheight(i)=Val(nextdata0(wtext3,"""",""""))*40:test=1
	   Else
	    wtext3=nextwords(wtext2,"""building:height""")
       If wtext3<>"" Then
	 	   wayheight(i)=Val(nextdata0(wtext3,"""",""""))*14:test=1
	    Else
	      wtext3=nextwords(wtext2,"""height""")
         If wtext3<>"" Then
	 	     wayheight(i)=Val(nextdata0(wtext3,"""",""""))*14:test=1
	      Else
	        wtext3=nextwords(wtext2,"""levels""")
           If wtext3<>"" Then
	 	       wayheight(i)=Val(nextdata0(wtext3,"""",""""))*40:test=1   	
           EndIf
         EndIf   
       EndIf
	   EndIf
	   If test=1 And wayheight(i)>50 Then
	  	  waytheight(i)=1':If wayheight(i)<1 Then wayheight(i)=2000:nerr+=1000000 
	   Else
	     waytheight(i)=0
	   EndIf
	  EndIf
	 EndIf  
	Next i 
End Sub '/
Const As Integer nnodei=800
Dim Shared As int64 nodeiid(nnodei)
Dim Shared As Integer inodei,tnodei(nnodei)
Dim Shared As String nodeitype(nnodei),nodeiname(nnodei)
Dim Shared As Single nodeilat(nnodei),nodeilon(nnodei)
Sub addfuel(id As int64,lati As Single,loni As Single,do1 As single)
Dim As Integer i,j
Dim As Single mxx,myy
If id=0 Then Exit Sub 
j=ifuel
For i=1 To nfuel
	If id=fuelid(j) Then
		fueldo1(j)=do1
		Exit Sub
	EndIf
	j-=1:If j<1 Then j=nfuel
Next
ifuel+=1:If ifuel>nfuel Then ifuel=1
fuelid(ifuel)=id
Var lat0=lat,lng0=lng
latlngtomxy(lati,loni,mxx,myy)
lat=lat0:lng=lng0
fuelx(ifuel)=mxx
fuely(ifuel)=myy
fuelz(ifuel)=-999999
fueldo1(ifuel)=do1
End Sub
Sub resetfuel()
Dim As Integer i 
For i=1 To nfuel
	fuelid(i)=0
	fuelx(i)=999999
	fuely(i)=999999
	fuelz(i)=-999999
	fueldo1(ifuel)=0	
Next
ifuel=1
End Sub
Sub addnodei(id As int64,lati As Single,loni As Single,typei As String,namei As string)
Dim As Integer i,j

If id=0 Then Exit Sub 
j=inodei
For i=1 To nnodei
	If id=nodeiid(j) Then Exit Sub
	j-=1:If j<1 Then j=nnodei
Next
inodei+=1:If inodei>nnodei Then inodei=1
nodeiid(inodei)=id
nodeilat(inodei)=lati
nodeilon(inodei)=loni
nodeitype(inodei)=typei
nodeiname(inodei)=namei
tnodei(inodei)=0
End Sub
Dim Shared As String testnamei
Function testtypenodei(latmin As Single,latmax As Single,lonmin As Single,lonmax As Single,latlonmax As Single)As String
Dim As Integer i,j,k
testnamei=""
j=inodei
For i=1 To nnodei
	if nodeiid(j)=0 Then Return ""
	If latmin<nodeilat(j) And latmax>nodeilat(j) Then
		If lonmin<nodeilon(j) And lonmax>nodeilon(j) Then
			If nodeitype(j)="fuel" Then
				Var id=nodeiid(j)
				For k=1 To nfuel
					If id=fuelid(k) Then
						Var kx=1.0:If latlonmax<(latmax+latmin)*0.5 Then kx=-1.0
						If (latmax-latmin)<(lonmax-lonmin)*klon*0.5*0.5 Then
							fueldo1(k)=0
						ElseIf (latmax-latmin)<(lonmax-lonmin)*klon*0.5 Then
							fueldo1(k)=30*kx
						ElseIf (latmax-latmin)<(lonmax-lonmin)*klon*2*0.5 Then
							fueldo1(k)=60*kx
						Else
							fueldo1(k)=90*kx
						EndIf
						Exit For 
					EndIf
				Next
			ElseIf tnodei(j)>0 Then
				Return ""
			EndIf
			tnodei(j)=1
			testnamei=nodeiname(j)
			Return nodeitype(j)
		EndIf
	EndIf
	j-=1:If j<1 Then j=nnodei
Next
Return ""
End Function
Dim Shared As Integer taddbridge,irelation,irelationway(100)
Dim Shared As int64 relationwayid(100,20)
Dim Shared As String relationname(100),relationcolor(100)
Dim Shared As Single relationheight(100),relationheightmin(100)
Declare Sub addbridges(latx As Single,lngx As Single,latx2 As Single,lngx2 As Single,name0 As string)
Sub getways2(text0 As String)'getways
	Dim As Integer i,j,k,test,ii
	Dim As int64 id,wayid
	Dim As String c
	wline=nextwords(text0,"""elements"":")
	If wline="" Then
		setioverpass():Sleep 1000
	   If auxtest>1.01 Then guinotice(Left(text0,800))
	EndIf
	wtext0=nextdata(wline,"[","]")
	'printmsg "wtext0="+wtext0
	split(wtext0,",")
	'printmsgsplit()
   'If nsplit<2 Then setioverpass():If auxtest>0.81 Then guinotice Left(text0,800)
	nway2=nsplit
	nway20=nway2
	myiasknode=0
	myiaskway=0
	nbroad=0
	irelation=0
	nshop0=nshop
	nshop=0
	'auxvar6=inodei:auxtest=1
	For i=1 To nnodei
		tnodei(i)=0
	Next
	For i=1 To 100
		irelationway(i)=0
	Next
	If nsplit<1 Then Sleep 4000:Exit Sub 
	For i=1 To nsplit
	 If quit2=1 Then Exit For 
	 wtext1=wsplit(i)'nextdata(wtext0,"{","}")
	 'If InStr(wtext1,"3793528")>0 then guinotice left(wtext1,400)
	 If InStr(wtext1,"""relation""")>0 Then
	 	If irelation>=100 then Exit For
	 	irelation+=1
	 	'For j=1 To 20
	   '  	  relationwayid(irelation,j)=0	 		
	 	'Next
	 	irelationway(irelation)=0
	 	wtext2=wtext1
	 	'If auxtest<0.5 Then auxtest=0.6:guinotice Left(wtext2,400)
	 	For j=1 To 100
	 	  If irelationway(irelation)>=20 Then Exit For	
	 	  wtext2=nextwords(wtext2,"""way""")
	     If wtext2="" Then Exit For
	     Dim As int64 rwayid=Val(nextdata0(wtext2,":",","))
	     If rwayid=0 Then Exit For 
	     wtext2=nextwords(wtext2,"""role""")
	     If wtext2="" Then Exit For 
	     Var rrole=nextdata0(wtext2,"""","""")
	     If rrole="outer" Then'Or rrole="part" Then
	     	  irelationway(irelation)+=1
	     	  relationwayid(irelation,irelationway(irelation))=rwayid
	     EndIf 	  
	 	Next j  
	 	 'auxvar2=max(irelationway(irelation),auxvar2)
	    wtext2=nextdata(wtext1,"{","}")
	    Var test=0
	    Var rwayheight=0
	    wtext3=nextwords(wtext2,"""building:levels""")
	    If wtext3<>"" Then
	 	  rwayheight=Val(nextdata0(wtext3,"""",""""))*40:test=1
	    Else
	     wtext3=nextwords(wtext2,"""building:height""")
        If wtext3<>"" Then
	 	   rwayheight=Val(nextdata0(wtext3,"""",""""))*14:test=1
	     Else
	      wtext3=nextwords(wtext2,"""height""")
         If wtext3<>"" Then
	 	     rwayheight=Val(nextdata0(wtext3,"""",""""))*14:test=1
	      Else
	        wtext3=nextwords(wtext2,"""levels""")
           If wtext3<>"" Then
	 	       rwayheight=Val(nextdata0(wtext3,"""",""""))*40:test=1   	
           EndIf
         EndIf   
        EndIf
       EndIf  
	    Var test2=0
	    Var rwayheightmin=0
	    wtext3=nextwords(wtext2,"""building:min_level""")
	    If wtext3<>"" Then
	 	  rwayheightmin=Val(nextdata0(wtext3,"""",""""))*40:test2=1
	    Else
	     wtext3=nextwords(wtext2,"""building:min_height""")
        If wtext3<>"" Then
	 	   rwayheightmin=Val(nextdata0(wtext3,"""",""""))*14:test2=1
	     Else
	      wtext3=nextwords(wtext2,"""min_height""")
         If wtext3<>"" Then
	 	     rwayheightmin=Val(nextdata0(wtext3,"""",""""))*14:test2=1
	      Else
	        wtext3=nextwords(wtext2,"""min_level""")
           If wtext3<>"" Then
	 	       rwayheightmin=Val(nextdata0(wtext3,"""",""""))*40:test2=1   	
           EndIf
         EndIf   
        EndIf
	    EndIf  
	    Var testcolor=0
	    Var rwaycolor=""
	    wtext3=nextwords(wtext2,"""building:colour""")
	    If wtext3<>"" Then
	 	  rwaycolor=(nextdata0(wtext3,"""","""")):testcolor=1
	    Else
	     wtext3=nextwords(wtext2,"""building:facade:colour""")
        If wtext3<>"" Then
	 	   rwaycolor=(nextdata0(wtext3,"""","""")):testcolor=1
	     Else
	      wtext3=nextwords(wtext2,"""colour""")
         If wtext3<>"" Then
	 	     rwaycolor=(nextdata0(wtext3,"""","""")):testcolor=1
         EndIf   
        EndIf
	    EndIf  
	    rwayheightmin=min(500.0,rwayheightmin)
	    Var rname=""	
	    wtext3=nextwords(wtext2,"""name:en""")
	    If wtext3<>"" Then
	 	  rname=formatname(nextdata0(wtext3,"""",""""))
	    Else 
	     wtext3=nextwords(wtext2,"""int_name""")
	     If wtext3<>"" Then
	 	    rname=formatname(nextdata0(wtext3,"""",""""))
	     Else
	       wtext3=nextwords(wtext2,"""name""")
	       If wtext3<>"" Then
	 	      rname=formatname(nextdata0(wtext3,"""",""""))
	       Else 
	       	wtext3=nextwords(wtext2,"""alt_name""")
	         If wtext3<>"" Then
	 	         rname=formatname(nextdata0(wtext3,"""",""""))
	         EndIf 	
	       EndIf   
	     EndIf 	
	    EndIf
	 	 'If InStr(rname,"Tour Total")>0 Then
       '	   guinotice rname+" h="+Str(rwayheight)+" i="+Str(irelationway(irelation))
       '	   'guinotice "wayid="+Str(relationwayid(irelation,irelationway(irelation)))
	 	 'EndIf
	 	 relationname(irelation)=rname
	 	 relationheight(irelation)=rwayheight
	 	 relationheightmin(irelation)=rwayheightmin
	 	 relationcolor(irelation)=rwaycolor
	 EndIf  
	Next i 
	For i=1 To nsplit
	 If quit2=1 Then Exit For
	 waytype(i)=""
	 wayname(i)=""
	 wtext1=wsplit(i)'nextdata(wtext0,"{","}")
    If InStr(wtext1,"""relation""")>0 Then Continue For 
	 wtext2=nextwords(wtext1,"""id""")
	 wayid=Val(nextdata0(wtext2,":",","))
	 waynodeid(i)=0
	 Var testrecent=testrecentid(wayid)
	 If testrecent And tmassload=1 Then Continue For 
    'If InStr(wtext1,"284893655")>0 Then guinotice "ok"
 	 'If wayid=176985151 Then guinotice "ok"
	 Var trunway=0
	 wtext4=nextwords(wtext1,"""aeroway"":")
	 If wtext4<>"" Then
	 	waytype(i)=nextdata0(wtext4,"""","""")
	 	If waytype(i)<>"aerodrome" And waytype(i)<>"runway" And waytype(i)<>"taxiway" Then
	 		If waytype(i)<>"terminal" Then
	         waylat(i)=-91
	         waylon(i)=-181	
	 	      Continue For
	 		EndIf
	 	Else
	 		trunway=1
	 	Endif
	 	wtext4=nextwords(wtext1,"""name"":")
	 	If wtext4<>"" Then
	 	   Var aeronamei=formatname(nextdata0(wtext4,"""",""""))
	 	 	If InStr(wtext1,"""node""")>0 Then
		      wtext2=nextwords(wtext1,"""id""")
		      id=Val(nextdata0(wtext2,":",","))
		      wtext2=nextwords(wtext1,"""lat""")
		      Var aerowaylati=Val(nextdata0(wtext2,":",","))
		      wtext2=nextwords(wtext1,"""lon""")
		      Var aerowayloni=Val(nextdata0(wtext2,":",","))
		      addmynode(id,aerowaylati,aerowayloni)
		      getlocktown(0)
		      If waytype(i)="terminal" Then
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,0)
		      Else	
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,1)
		      EndIf
		      freelocktown(0)
	         waylat(i)=-91
	         waylon(i)=-181	
	         Continue For 
	 	 	EndIf
 	      wtext4=nextwords(wtext1,"""nodes"":")
	      waynode(i)=Val(nextdata0(wtext4,"[",","))
	      id=waynode(i)
	      j=getinode(id)
	      If j<=0 Then
     	    j=mygetinode(id)
     	    If j>0 Then
  	         Var aerowaylati=mylat(j)
 	  	      Var aerowayloni=mylon(j)
		      getlocktown(0)
		      If waytype(i)="terminal" Then
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,0)
		      Else	
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,1)
		      EndIf
		      freelocktown(0)
     	    Else 
   	  	   If myiasknode<mynasknode Then
    	  	   	myiasknode+=1
    	  	   	myasknodeid(myiasknode)=id
    	  	   EndIf
    	  	 EndIf   
	      Else
	         addmynode(id,latnode(j),lonnode(j))
	         Var aerowaylati=latnode(j)
	         Var aerowayloni=lonnode(j)
		      getlocktown(0)
		      If waytype(i)="terminal" Then
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,0)
		      Else	
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,1)
		      EndIf
		      freelocktown(0)
	      EndIf 
	      waylat(i)=-91
	      waylon(i)=-181	
	      If trunway=0 Then
	 		  If waytype(i)<>"terminal" Or InStr(wtext1,"""building"":")<=0 Then
	      	 Continue For
	        EndIf  	  
	      EndIf
	 	ElseIf InStr(wtext1,"""building"":")<=0 And trunway=0 Then  
	      waylat(i)=-91
	      waylon(i)=-181	
	 	   'If trunway=0 Then
	 	   	Continue For
	 	   'EndIf
	 	EndIf    
	 EndIf
    If InStr(wtext1,"""node""")>0 Then
		      wtext2=nextwords(wtext1,"""id""")
		      id=Val(nextdata0(wtext2,":",","))
		      wtext2=nextwords(wtext1,"""lat""")
		      Var nodelati=Val(nextdata0(wtext2,":",","))
		      wtext2=nextwords(wtext1,"""lon""")
		      Var nodeloni=Val(nextdata0(wtext2,":",","))
		      'addmynode(id,nodelati,nodeloni)
	         Var rname=""
      	   wtext3=nextwords(wtext2,"""name:en""")
	         If wtext3<>"" Then
	 	         rname=formatname(nextdata0(wtext3,"""",""""))
	         Else 
	            wtext3=nextwords(wtext2,"""int_name""")
	            If wtext3<>"" Then
	 	            rname=formatname(nextdata0(wtext3,"""",""""))
	            Else
	               wtext3=nextwords(wtext2,"""name""")
	               If wtext3<>"" Then
	 	               rname=formatname(nextdata0(wtext3,"""",""""))
	               EndIf 	
	            EndIf   
	         EndIf 	
		      getlocktown(0)
		      If InStr(wtext2,"fuel")>1 Then
		      	addfuel(id,nodelati,nodeloni,0)
		      	addnodei(id,nodelati,nodeloni,"fuel",rname)
		      ElseIf InStr(wtext2,"hospital")>1 Then 	
		      	addnodei(id,nodelati,nodeloni,"hospital",rname)
		      ElseIf InStr(wtext2,"railway")>1 Then 	
		      	addnodei(id,nodelati,nodeloni,"railstation",rname)
		      ElseIf InStr(wtext2,"shop")>1 Then 	
		      	addnodei(id,nodelati,nodeloni,"shop",rname)
		      	nshop+=1
		      ElseIf InStr(wtext2,"cinema")>1 Then 
		      	addnodei(id,nodelati,nodeloni,"shop",rname)
		      	nshop+=1
		      ElseIf InStr(wtext2,"cafe")>1 Then 
		      	addnodei(id,nodelati,nodeloni,"shop",rname)
		      	nshop+=1
		      ElseIf InStr(wtext2,"restaurant")>1 Then 
		      	addnodei(id,nodelati,nodeloni,"shop",rname)
		      	nshop+=1
		      ElseIf InStr(wtext2,"bar")>1 Then 
		      	addnodei(id,nodelati,nodeloni,"shop",rname)
		      	nshop+=1
		      ElseIf InStr(wtext2,"water_tower")>1 Or InStr(wtext2,"storage_tank")>1  Then 	
		      	addfuel(id,nodelati,nodeloni,720)
		      	'addnodei(id,nodelati,nodeloni,"water_tower")
		      	'guinotice "water"
		      ElseIf InStr(wtext2,"silo")>1 Then 	
		      	addfuel(id,nodelati,nodeloni,720*2)
		      	'addnodei(id,nodelati,nodeloni,"water_tower")
		      	'guinotice "silo"
		      ElseIf InStr(wtext2,"communications_tower")>1  Or InStr(wtext2,"""tower""")>1 Then 	
		      	addfuel(id,nodelati,nodeloni,720*3)
		      	'addnodei(id,nodelati,nodeloni,"communications_tower")
		      	'guinotice "comm"
		      EndIf
		      freelocktown(0)
	         waylat(i)=-91
	         waylon(i)=-181	
	         Continue For 
    EndIf
    var testaskhighway=0
 	 wtext4=nextwords(wtext1,"""nodes"":")
	 waynode(i)=Val(nextdata0(wtext4,"[",","))
	 id=waynode(i)
	 j=getinode(id)
	 If j<=0 Then 
     	j=mygetinode(id)
     	If j>0 Then
  	    waylat(i)=mylat(j)
 	  	 waylon(i)=mylon(j)
     	Else
     	 If InStr(wtext1,"""highway""")>1 Or trunway=1 Then
  	  	     	If myiasknode<mynasknode Then
  	  	     		'myiasknode+=1
  	  	     		'myasknodeid(myiasknode)=id
  	  	     		testaskhighway=1
  	  	     	EndIf     	 	
     	 EndIf
	    waylat(i)=-91
	    waylon(i)=-181	
     	EndIf 
    Else  	
 	   if InStr(wtext2,"""bridge""")>1 Or trunway=1 Then
 	   	addmynode(id,latnode(j),lonnode(j))
 	   EndIf
	   waylat(i)=latnode(j)
	   waylon(i)=lonnode(j)
	 EndIf 
	 If waylat(i)>-90 Or testaskhighway=1 Then 
	  waydo1(i)=0
	  /'If tendofdata=0 Then
	  	  Var nodeid1=Val(nextdata0(wtext4,",",","))
	  	  j=getinode(nodeid1)
	  	  If j>0 Then
 	  	    	Var dy=(waylat(i)-latnode(j))*kmxlat
 	  	  	   Var dx=(waylon(i)-lonnode(j))*kmxlat/(klon)
  	  	  	   waydo1(i)=diro1(dx,dy)
	  	  EndIf
	  EndIf '/
	  Var rnd1=(wayid and 127)/128.0
	  Var h1=50+Rnd1*700'800
  	  rnd1=((wayid Shr 4) and 127)/128.0
	  If Rnd1<0.3 Then
  	     rnd1=((wayid Shr 8) and 127)/128.0
	  	  h1=70+Rnd1*230
	  EndIf
	  If h1>450 Then h1*=1.25'1.45
	  h1=50+(h1-50)*0.5
	  wayheight(i)=h1'+scalez
	  wayheightmin(i)=0
	  waytheight(i)=0
     waywidth(i)=100
     iwaynode(i)=0
     var testhighway=0
     Var testoneway=0
     Var testchurch=0
     Var testshop=0
     Var testofficial=0
     Var testrailstation=0
     Var testhospital=0
     Var testschool=0
     Var testparking=0
     Var testrail=0,testbuilding=0
	  wtext2=nextwords(wtext1,"""tags"":")
	  If wtext2<>"" And InStr(wtext2,"""bridge""")>1 Then
	  	  wayheight(i)=0
	  	  taddbridge=0
 	     wtext3=nextdata(wtext4,"[","]")
 	     split2(wtext3,",")
 	     If nsplit2>=2 Then
	  	    Var dj=1,dxy=0,dxy0=0
	  	    k=0
	  	    For dj=1 To nsplit2+0.0001 'Step nsplit2/4
 	  	     id=Val(wsplit2(dj))
 	  	     j=getinode(id)
 	  	     If j>0 Then
 	  	     	addmynode(id,latnode(j),lonnode(j))
 	  	    	If k>=0 Then
 	  	    	 Var dy=(waylat(i)-latnode(j))*kmxlat
 	  	  	    Var dx=(waylon(i)-lonnode(j))*kmxlat/(klon)
 	  	  	    dxy=Sqr(dx*dx+dy*dy)
 	  	    	 If dxy>dxy0 Then
 	  	    		dxy0=dxy
  	  	  	      k=j
  	  	  	      'waydo1(i)=diro1(dx,dy)
  	  	  	    EndIf   
 	  	    	EndIf
 	  	     Else
 	  	     	j=mygetinode(id)
 	  	     	If j>0 Then
 	  	     	  If k>=0 Then 	
 	  	    	   Var dy=(waylat(i)-mylat(j))*kmxlat
 	  	  	      Var dx=(waylon(i)-mylon(j))*kmxlat/(klon)
 	  	  	      dxy=Sqr(dx*dx+dy*dy)
 	  	    	   If dxy>dxy0 Then
 	  	    		  dxy0=dxy
  	  	  	        k=j+100000
 	  	    	   EndIf
 	  	    	  EndIf  
 	  	     	Else
    	  	     	k=-1
    	  	     	If myiasknode<mynasknode Then
    	  	     		myiasknode+=1
    	  	     		myasknodeid(myiasknode)=id
    	  	     	EndIf
    	  	   EndIf   	 
 	  	     EndIf
	  	    Next dj 
	  	    wayheight(i)=0'4000
	  	    If k>0 Then 
	         Var rname=""
      	   wtext3=nextwords(wtext2,"""name:en""")
	         If wtext3<>"" Then
	 	         rname=formatname(nextdata0(wtext3,"""",""""))
	         Else 
	            wtext3=nextwords(wtext2,"""int_name""")
	            If wtext3<>"" Then
	 	            rname=formatname(nextdata0(wtext3,"""",""""))
	            Else
	               wtext3=nextwords(wtext2,"""name""")
	               If wtext3<>"" Then
	 	               rname=formatname(nextdata0(wtext3,"""",""""))
	               EndIf 	
	            EndIf   
	         EndIf
	  	      wayname(i)=rname
	  	      getlocktown(0)
	  	      If k>100000 Then
	  	    	  k-=100000
	  	    	  addbridges(waylat(i),waylon(i),mylat(k),mylon(k),wayname(i))
	  	      ElseIf k>0 Then
	  	    	  addbridges(waylat(i),waylon(i),latnode(k),lonnode(k),wayname(i))
	  	      EndIf
	  	      freelocktown(0)
	  	    EndIf 'k>0 
 	     EndIf
 	     If taddbridge=1 Or InStr(wtext2,"""highway""")<1 Then Continue For
 	  EndIf  
     'If InStr(wtext1,"284893655")>0 Then guinotice "ok"
     Var layer=0
	  If wayid>0 Then'wtext2<>"" Then
	  	If trunway=1 Then
	  		testhighway=1
	  	ElseIf InStr(wtext2,"""railway""")>0 Then
	  		testrail=1
	  		testhighway=1
	  		waytype(i)="rail"
	  		wtext5=nextwords(wtext2,"""layer"":")
	  		If wtext5<>"" Then
	 	      layer=Val(nextdata0(wtext5,"""",""""))
	 	      If layer<-0.5 Or layer>0.5 Then
	 	      	waynodeid(i)=0:Continue For 
	 	      EndIf
	  		EndIf
	  	ElseIf InStr(wtext2,"""highway""")>0 Then
	   	testhighway=1
	      wtext5=nextwords(wtext2,"""highway"":")
	 	   waytype(i)=nextdata0(wtext5,"""","""")
	      wtext5=nextwords(wtext2,"""oneway"":")
	 	   Var oneway=nextdata0(wtext5,"""","""")
	 	   If oneway="yes" Or oneway="true" Or oneway="1" Then testoneway=1
  	 	   If InStr(wtext2,"""parking_aisle""")>0 Then testparking=1
	  		wtext5=nextwords(wtext2,"""layer"":")
	  		If wtext5<>"" Then
	 	      layer=Val(nextdata0(wtext5,"""",""""))
	  		EndIf
  	 	   nbroad+=1
	   ElseIf InStr(wtext2,"""place_of_worship""")>0 Then
	   	testchurch=1
	   	testbuilding=1 
	   ElseIf InStr(wtext2,"""shop""")>0 Then
	   	testshop=1
	   	nshop+=1
	   	testbuilding=1 
	  	ElseIf InStr(wtext2,"""railway""")>0 Then
	   	testrailstation=1
	   	testbuilding=1 
	   ElseIf InStr(wtext2,"""station""")>0 Then
	   	testrailstation=1 
	   	testbuilding=1 
	  	ElseIf InStr(wtext2,"""hospital""")>0 Then
	   	testhospital=1 
	   	testbuilding=1 
	  	ElseIf InStr(wtext2,"""school""")>0 Then
	   	testschool=1
	   	testbuilding=1 
	  	ElseIf InStr(wtext2,"""university""")>0 Then
	   	testschool=1
	   	testbuilding=1 
	  	ElseIf InStr(wtext2,"""amenity""")>0 Then
	   	testofficial=1
	   	testbuilding=1 
	   EndIf 
	   Var test=0,test2=0,testcolor=0,testname=0
	   If testhighway=1 Then
	   	wayheight(i)=getroadh(LCase(waytype(i)))
	   	If testoneway=1 Then wayheight(i)+=1000
	   	If testparking=1 Then wayheight(i)+=2000
	   Else
	    'If InStr(wtext2,"""building""")>0 Then
	    	testbuilding=1	
	    'EndIf
	    wtext2=nextdata(wtext2,"{","}")
	    test=0
	    wtext3=nextwords(wtext2,"""building:levels""")
	    If wtext3<>"" Then
	 	  wayheight(i)=Val(nextdata0(wtext3,"""",""""))*40:test=1
	    Else
	     wtext3=nextwords(wtext2,"""building:height""")
        If wtext3<>"" Then
	 	   wayheight(i)=Val(nextdata0(wtext3,"""",""""))*14:test=1
	     Else
	      wtext3=nextwords(wtext2,"""height""")
         If wtext3<>"" Then
	 	     wayheight(i)=Val(nextdata0(wtext3,"""",""""))*14:test=1
	      Else
	        wtext3=nextwords(wtext2,"""levels""")
           If wtext3<>"" Then
	 	       wayheight(i)=Val(nextdata0(wtext3,"""",""""))*40:test=1   	
           EndIf
         EndIf   
        EndIf
	    EndIf 
	    test2=0
	    wtext3=nextwords(wtext2,"""building:min_level""")
	    If wtext3<>"" Then
	 	  wayheightmin(i)=Val(nextdata0(wtext3,"""",""""))*40:test2=1
	    Else
	     wtext3=nextwords(wtext2,"""building:min_height""")
        If wtext3<>"" Then
	 	   wayheightmin(i)=Val(nextdata0(wtext3,"""",""""))*14:test2=1
	     Else
	      wtext3=nextwords(wtext2,"""min_height""")
         If wtext3<>"" Then
	 	     wayheightmin(i)=Val(nextdata0(wtext3,"""",""""))*14:test2=1
	      Else
	        wtext3=nextwords(wtext2,"""min_level""")
           If wtext3<>"" Then
	 	       wayheightmin(i)=Val(nextdata0(wtext3,"""",""""))*40:test2=1   	
           EndIf
         EndIf   
        EndIf
	    EndIf  
	    testcolor=0
	    waycolor(i)=""
	    wtext3=nextwords(wtext2,"""building:colour""")
	    If wtext3<>"" Then
	 	  waycolor(i)=(nextdata0(wtext3,"""","""")):testcolor=1
	    Else
	     wtext3=nextwords(wtext2,"""building:facade:colour""")
        If wtext3<>"" Then
	 	   waycolor(i)=(nextdata0(wtext3,"""","""")):testcolor=1
	     Else
	      wtext3=nextwords(wtext2,"""colour""")
         If wtext3<>"" Then
	 	     waycolor(i)=(nextdata0(wtext3,"""","""")):testcolor=1
         EndIf   
        EndIf
	    EndIf
	   EndIf  
	   'wayname(i)=""
	   testname=0
	   wtext3=nextwords(wtext2,"""name:en""")
	   If wtext3<>"" Then
	 	  wayname(i)=formatname(nextdata0(wtext3,"""",""""))':testname=1
	   Else 
	     wtext3=nextwords(wtext2,"""int_name""")
	     If wtext3<>"" Then
	 	    wayname(i)=formatname(nextdata0(wtext3,"""",""""))':testname=1
	     Else
	       wtext3=nextwords(wtext2,"""name""")
	       If wtext3<>"" Then
	 	      wayname(i)=formatname(nextdata0(wtext3,"""",""""))':testname=1
	 	    Else 
	       	wtext3=nextwords(wtext2,"""alt_name""")
	         If wtext3<>"" Then
	 	         wayname(i)=formatname(nextdata0(wtext3,"""",""""))':testname=1
	 	      Else 
	       	   If testhighway=1 Then wtext3=nextwords(wtext2,"""ref""")
	            If wtext3<>"" Then
	 	            wayname(i)=formatname(nextdata0(wtext3,"""",""""))' :testname=1
	            /'ElseIf irelation>0 Then 
   	         	For j=1 To irelation
	            		If wayid=relationwayid(j) Then
	            			wayname(i)=relationname(j)
	                    'If auxtest<0.4 Then auxtest=0.35:guinotice wayname(i)
	             		EndIf
   	         	Next '/
   	         EndIf 	
	         EndIf 	
          EndIf   
	     EndIf 	
	   EndIf
	   If wayname(i)<>"" Then testname=1
	   'If testbuilding And InStr(LCase(wayname(i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
	   If testhighway=0 And (test=0 Or test2=0 Or testcolor=0 Or testname=0) Then
	   'If testhighway=0 And testbuilding=0 And (test=0 Or test2=0 Or testcolor=0 Or testname=0) Then
	   	'auxvar+=1:auxtest=0.5
   	   Var wayirelation=0
	   	For j=1 To irelation
	   		 For k=1 To irelationway(j)
	   		   If relationwayid(j,k)=wayid Then
	   		  	  'auxvar+=1:auxtest=0.5
	   			  wayirelation=j:Exit For,For 
	   		   EndIf
	   		 Next
	   	Next
	   	If wayirelation>0 Then
	   		If test=0 Then wayheight(i)=relationheight(wayirelation)':auxvar2+=1
	   		If test2=0 Then wayheightmin(i)=relationheightmin(wayirelation)':auxvar2+=1
	   		If testcolor=0 Then waycolor(i)=relationcolor(wayirelation)':auxvar2+=1
	   		If testname=0 Then wayname(i)=relationname(wayirelation)':auxvar2+=1
	   		'If InStr(wayname(i),"Tour Total")>0 Then guinotice Str(i)
	   		'If wayid=229142768 Then guinotice "wayheight= "+Str(wayheight(i)) 
	   		wayheight(i)=max(70.0,wayheight(i))
	   		If wayheight(i)>50 Then test=1
	   		If wayheightmin(i)>0.1 Then test2=1
	   		If waycolor(i)<>"" Then testcolor=1
	   		If wayname(i)<>"" Then testname=1
	   		'auxtest=0.7
	   	ElseIf testbuilding=0 Then'And testhighway=0 then	   	
 	         iwaynode(i)=0:waynodeid(i)=0 
            Continue For
	      EndIf
	   EndIf
	    'If InStr(LCase(wayname(i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
	    If waytype(i)="terminal" Then wayheight(i)=max(100.0,wayheight(i))
	    If test2=1 Then wayheightmin(i)=min(500.0,wayheightmin(i))
	    If test=1  And wayheight(i)>50 Then
	  	   waytheight(i)=1':If wayheight(i)<1 Then wayheight(i)=2000:nerr+=1000000:EndIf  
	    ElseIf test2=1 Then
	   	if wayheightmin(i)>1 And wayheight(i)<4000 Then
	   		waytheight(i)=1
	   	EndIf
	    EndIf 	
	   Var testtype=0
	   if testhighway=1 Then waytheight(i)=100:testtype=1
	   if testchurch=1 Then waytheight(i)=4:testtype=1
	   if testshop=1 Then waytheight(i)=5:testtype=1
	   if testofficial=1 Then waytheight(i)=6:testtype=1
	   if testrailstation=1 Then waytheight(i)=7:testtype=1
	   if testhospital=1 Then waytheight(i)=8:testtype=1
	   if testschool=1 Then waytheight(i)=10:testtype=1
	   wayred=0:waygreen=0:wayblue=0
	   If testcolor=1 Then setwayrgb(waycolor(i))':guinotice waycolor(i)+" "+Str(waytheight(i))
	   If layer<>0 And testhighway=1 Then 
	   	testcolor=1:wayred=1:waygreen=layer:wayblue=0
	   ElseIf testhighway=1 Then 
	   	wayred=min(0.9,wayred)
	   Else 
	   	layer=0
	   EndIf
	   wayr(i)=wayred:wayg(i)=waygreen:wayb(i)=wayblue
 	   wtext3=nextdata(wtext4,"[","]")
 	   split2(wtext3,",")
 	   waywidth(i)=100
 	   waylength(i)=100
 	   Var latmin=99.0,latmax=-99.0,lonmin=199.0,lonmax=-199.0,latlonmax=0.0
 	   If nsplit2>=3 Or (nsplit2>=2 And testhighway=1) Then
 	     	 'id=Val(wsplit2(1))
 	     	 waynodeid(i)=wayid'id
 	     	 Dim As Single kx,dkx=1,k40=0.0,k0=0
 	     	 Dim As Integer i40=0,j40=0
	       'If InStr(LCase(wayname(i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
 	       If nsplit2>(nwaynode) And testrail=0 Then
 	       	dkx=(nsplit2-1)/(nwaynode-1)
 	     	 	'If Str(wayid)="79152373" Then auxvar+=1:auxtest=0.8:auxvar2=wayheight(i)-h40
 	       	If wayheight(i)>h40 And testhighway<>1 Then
 	       		i40=setitown40(wayid)
  	 				'townid40(i40)=wayid
	            'If InStr(LCase(wayname(i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
  	 				'auxvar=itown40:auxvar2=i40:auxtest=0.75
 	     	 		'If Str(wayid)="79152373" Then auxvar+=1000:auxtest=0.8:auxvar2=i40
 	       	ElseIf testhighway=1 Then
 	       		i40=setitown40(wayid) 	       		
 	       	EndIf
 	       EndIf
 	       'auxvar=itown40:auxtest=0.3
 	       'If nsplit2>2 Then dkx=(nsplit2)/(2)
 	       iwaynode(i)=0
 	       Var tasknode=0
      	 Var loni=0.0,lati=0.0
      	 j40=0:k=0
 	     	 For kx=1 To nsplit2+0.5 step dkx
 	     	 	k0=k
 	     	 	k=Int(kx+0.01)+0.001
 	     	 	id=Val(wsplit2(k))
 	     	 	j=getinode(id)
 	     	 	Var tmynode=0
 	     	 	If j>0 Then
 	     	 		If i40>0 Or testschool=1 Or trunway=1 Or testrail=1 Then addmynode(id,latnode(j),lonnode(j))
            Else 
 	     	 		If i40=0 And testschool=0 And trunway=0 And testhighway=0 And testrail=0 And waytype(i)<>"terminal" Then
 	     	 			iwaynode(i)=0:waynodeid(i)=0
 	     	 			Continue For,For
 	     	 		Else
 	     	 			tmynode=1
 	     	 			j=mygetinode(id)
 	     	 			If j<=0 Then 
 	     	 			 tasknode=1
 	     	 			 If testrecent Then Continue For,For 
     	  	     	    If myiasknode<mynasknode Then
    	  	     		   myiasknode+=1
    	  	     		   myasknodeid(myiasknode)=id
     	  	     	    EndIf 
     	  	     	   EndIf  
 	     	 		EndIf
 	     	 	EndIf
 	     	 	'If Str(wayid)="79152373" Then auxvar+=1:auxtest=0.8:auxvar2=tasknode
 	     	 	If tasknode=1 Then
 	     	 	   iwaynode(i)=0:waynodeid(i)=0 
               Continue For
 	     	 	EndIf
 	     	 	Var iwaynodei=min2(nwaynode,iwaynode(i)+1)
 	     	 	iwaynode(i)=iwaynodei
 	     	 	If tmynode=0 Then 
 	     	 	   loni=lonnode(j)
 	     	 	   lati=latnode(j)
 	     	 	Else
 	     	 	   loni=mylon(j)
 	     	 	   lati=mylat(j)
 	     	 	EndIf       
 	     	 	waynodex(i,iwaynodei)=loni
 	     	 	waynodey(i,iwaynodei)=lati
 	     	 	'If Str(wayid)="53691705" Then guinotice  Str(lati- 49.3598128)+"  "+Str(0.010*360/40000)'loni-0.0627624)
 	     	 	'If Str(wayid)="79152373" Then auxvar+=1:auxtest=0.8:auxvar2=i40
 	     	 	If i40>0 Then
 	     	 		'If Str(wayid)="79152373" Then auxvar+=1:auxtest=0.8
 	     	 		j40=iwaynodei
 	     	 		If j40>0 And j40<=n40 Then
 	     	 		 k40=(k0+k)*0.5+0.01
 	     	 		 If j40=1 Or k40<k0+1.001 Or k40>k-0.001 or k40>nsplit2-0.001 Then
 	     	 			knode40(i40,j40)=0
 	     	 			townnodex40(i40,j40)=0
 	     	 			townnodey40(i40,j40)=0
 	     	 			townixy40(i40)=1
 	     	 		 Else
 	     	 			knode40(i40,j40)=j40
      	     	 	Dim As int64 id40=Val(wsplit2(Int(k40)))
 	          	 	Var jj=getinode(id40)
 	     	 			If jj>0 Then
 	     	 				'Var dxy=Abs(latnode(jj)-townnodelat40(i40,j40))
 	     	 				'If dxy<0.00000011 Then dxy=Abs(lonnode(jj)-townnodelon40(i40,j40))/klon
 	     	 				'If dxy>0.0000001 Then  	     	 				
 	     	 				'If dxy<0.000000011 Then dxy=Abs(lonnode(jj)-townnodelon40(i40,j40))/klon
 	     	 				'If dxy>0.00000001 Then  	     	 				
 	     	 				  townnodelon40(i40,j40)=lonnode(jj)
 	     	 				  townnodelat40(i40,j40)=latnode(jj)
 	     	 				  townnodex40(i40,j40)=0
 	     	 				  townnodey40(i40,j40)=0
 	     	 				  townixy40(i40)=1
 	     	 				  'latlngtomxy(latnode(jj),lonnode(jj),townnodex40(i40,j40),townnodey40(i40,j40)) 
 	     	 			     knode40(i40,j40)=j40
 	     	 				'Else
 	     	 				  'auxvar+=1:auxtest=0.8
 	     	 				'EndIf 
 	     	 			EndIf
 	     	 		 EndIf 
 	     	 		EndIf
 	     	 	EndIf
 	     	 	If testtype=0 Then
 	     	 		If latmin>lati Then latmin=lati
 	     	 		If latmax<lati Then latmax=lati
 	     	 		If lonmin>loni Then lonmin=loni
 	     	 		If lonmax<loni Then lonmax=loni:latlonmax=lati
 	     	 	EndIf
 	     	 Next
 	     	 waylat(i)=(waylat(i)+lati)*0.5
 	     	 waylon(i)=(waylon(i)+loni)*0.5
	       'If InStr(LCase(wayname(i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
  	 		 'If Str(wayid)="79152373" Then auxvar+=1000:auxtest=0.8
 	     	 If tasknode=1 Then
 	     	 	If myiaskway<naskwayid Then
 	     	 		myiaskway+=1:myaskwayid(myiaskway)=wayid
 	     	 	EndIf
 	     	 	Continue For 
 	     	 EndIf
	       'If InStr(LCase(wayname(i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
  	 		 'If Str(wayid)="79152373" Then auxvar+=1000:auxtest=0.8
 	     	 If iwaynode(i)<2 Or (iwaynode(i)<3 And testhighway=0) Then
 	     	 	iwaynode(i)=0:waynodeid(i)=0
 	     	 ElseIf testtype=0 And wayheightmin(i)<1 Then 
 	     	 	Var typei=testtypenodei(latmin,latmax,lonmin,lonmax,latlonmax)
 	     	 	If typei<>"" Then
	            'if testhighway=1 Then waytheight(i)=100:testtype=1
	            'If testchurch=1 Then waytheight(i)=4:testtype=1
	            if typei="shop" Then waytheight(i)=5:testtype=1
	            'if testofficial=1 Then waytheight(i)=6:testtype=1
	            If typei="railstation" Then waytheight(i)=7:testtype=1
	            If typei="hospital" Then waytheight(i)=8:testtype=1
	            If typei="fuel" Then waytheight(i)=9:testtype=1
	            'If testschool=1 Then waytheight(i)=10:testtype=1
	            If testtype=1 And wayname(i)="" Then wayname(i)=testnamei
 	     	 	EndIf
 	     	 EndIf	 
 	   EndIf
	   'If InStr(LCase(wayname(i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
 	     'If iwaynode(i)>0 Then	auxvar6+=1
 	     /'If nsplit2>=4 And 0 Then
 	  	    id=Val(wsplit2(nsplit2/4+0.1))
 	  	    j=getinode(id)
 	  	    If j>0 Then
 	  	    	Var dy=waylat(i)-latnode(j)
 	  	    	Var dx=waylon(i)-lonnode(j)
 	  	    	waylength(i)=max(waylength(i),Abs(dy)*kmxlat)
 	  	  	   waylength(i)=max(waylength(i),Abs(dx)*kmxlat/(klon))
 	  	  	   If Abs(dx)+Abs(dy)>0.0000001 Then
 	  	  	   	waydo1(i)=diro1(dx,dy)
 	  	  	   	'waylat(i)-=dy*0.5
 	  	  	   	'waylon(i)-=dx*0.5
 	  	    Else 
	         waylat(i)=-91
	         waylon(i)=-181	
 	  	    EndIf
 	  	    Var j0=j
 	  	    id=Val(wsplit2(nsplit2*2/4+0.1))
 	  	    j=getinode(id)
 	  	    If j>0 And j0>0 Then
 	  	    	Var dy=latnode(j0)-latnode(j)
 	  	    	Var dx=lonnode(j0)-lonnode(j)
 	  	  	   waywidth(i)=max(waywidth(i),Abs(dy)*kmxlat)
 	  	  	   waywidth(i)=max(waywidth(i),Abs(dx)*kmxlat/(klon))
 	  	  	   'waylat(i)-=dy*0.5
 	  	  	   'waylon(i)-=dx*0.5
 	  	    Else 
	         waylat(i)=-91
	         waylon(i)=-181	
 	  	    EndIf
 	  	    id=Val(wsplit2(nsplit2*3/4))
 	  	    j=getinode(id)
 	  	    If j>0 Then
 	  	     	waywidth(i)=max(waywidth(i),Abs(waylat(i)-latnode(j))*kmxlat)
 	  	  	   waywidth(i)=max(waywidth(i),Abs(waylon(i)-lonnode(j))*kmxlat/(klon))
 	  	    EndIf
  	     EndIf 
	  EndIf  '/    
	  EndIf
	 EndIf  
	Next i 
	'auxvar4=myiasknode
End Sub
Sub getways2bridge(text0 As String)'getways
	Dim As Integer i,j,k,test
	Dim As int64 id
	Dim As String c
	wline=nextwords(text0,"""elements"":")
	If wline="" Then setioverpass():Sleep 1000
	wtext0=nextdata(wline,"[","]")
	'printmsg "wtext0="+wtext0
	split(wtext0,",")
	'printmsgsplit()
	nway2=nsplit
	For i=1 To nsplit
	 wtext1=wsplit(i)'nextdata(wtext0,"{","}")
	 wtext4=nextwords(wtext1,"""aeroway"":")
	 If wtext4<>"" Then
	 	waytype(i)=nextdata0(wtext4,"""","""")
	 	If waytype(i)<>"aerodrome" And waytype(i)<>"runway" And waytype(i)<>"taxiway" Then
	 	      	Continue For   	
	 	EndIf  
	 	wtext4=nextwords(wtext1,"""name"":")
	 	If wtext4<>"" Then
	 	 	Var aeronamei=formatname(nextdata0(wtext4,"""",""""))
	 	 	If InStr(wtext1,"""node""")>0 Then
	         Continue For 
	 	 	EndIf
 	      wtext4=nextwords(wtext1,"""nodes"":")
	      waynode(i)=Val(nextdata0(wtext4,"[",","))
	      id=waynode(i)
	      j=getinode(id)
	      If j<=0 Then
     	    j=mygetinode(id)
     	    If j>0 Then
  	         Var aerowaylati=mylat(j)
 	  	      Var aerowayloni=mylon(j)
 	  	      getlocktown(0)
		      If waytype(i)="terminal" Then
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,0)
		      Else	
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,1)
		      EndIf
		      freelocktown(0)
     	    Else 
   	  	   If myiasknode<mynasknode Then
    	  	   	myiasknode+=1
    	  	   	myasknodeid(myiasknode)=id
   	  	   EndIf
    	  	 EndIf   
	      Else
	         addmynode(id,latnode(j),lonnode(j))
	         Var aerowaylati=latnode(j)
	         Var aerowayloni=lonnode(j)
	         getlocktown(0)
		      If waytype(i)="terminal" Then
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,0)
		      Else	
		      	addaeroway(aeronamei,aerowaylati,aerowayloni,1.0,1)
		      EndIf
		      freelocktown(0)
	      EndIf 
	      waylat(i)=-91
	      waylon(i)=-181	
	      Continue For 
	 	ElseIf InStr(wtext1,"""building"":")<=0 Then  
	      waylat(i)=-91
	      waylon(i)=-181	
	 	   Continue For
	 	EndIf 
	 EndIf 
 	 wtext4=nextwords(wtext1,"""nodes"":")
	 waynode(i)=Val(nextdata0(wtext4,"[",","))
	 j=getinode(waynode(i))
	 If j<=0 Then
	  waylat(i)=-91
	  waylon(i)=-181	
	 Else
	  waylat(i)=latnode(j)
	  waylon(i)=lonnode(j)
	  wtext2=nextwords(wtext1,"""tags"":")
	  If wtext2<>"" And InStr(wtext2,"""bridge""")>1 Then
	  	  wayheight(i)=0
 	     wtext3=nextdata(wtext4,"[","]")
 	     split2(wtext3,",")
 	     If nsplit2>=2 Then
	  	    Var dj=1,dxy=0,dxy0=0
	  	    k=0
  	    For dj=1 To nsplit2+0.0001 'Step nsplit2/4
 	  	     id=Val(wsplit2(dj))
 	  	     j=getinode(id)
 	  	     If j>0 Then
 	  	     	'addmynode(id,latnode(j),lonnode(j))
 	  	    	If k>=0 Then
 	  	    	 Var dy=(waylat(i)-latnode(j))*kmxlat
 	  	  	    Var dx=(waylon(i)-lonnode(j))*kmxlat/(klon)
 	  	  	    dxy=Sqr(dx*dx+dy*dy)
 	  	    	 If dxy>dxy0 Then
 	  	    		dxy0=dxy
  	  	  	      k=j
  	  	  	      'waydo1(i)=diro1(dx,dy)
  	  	  	    EndIf   
 	  	    	EndIf
 	  	     Else
 	  	     	j=mygetinode(id)
 	  	     	If j>0 Then
 	  	     	  If k>=0 Then 	
 	  	    	   Var dy=(waylat(i)-mylat(j))*kmxlat
 	  	  	      Var dx=(waylon(i)-mylon(j))*kmxlat/(klon)
 	  	  	      dxy=Sqr(dx*dx+dy*dy)
 	  	    	   If dxy>dxy0 Then
 	  	    		  dxy0=dxy
  	  	  	        k=j+100000
 	  	    	   EndIf
 	  	    	  EndIf  
 	  	     	Else
    	  	     	k=-1
    	  	     	If myiasknode<mynasknode Then
    	  	     		myiasknode+=1
    	  	     		myasknodeid(myiasknode)=id
    	  	     	EndIf
    	  	   EndIf   	 
 	  	     EndIf
	  	    Next dj 
	  	    wayheight(i)=0'4000
	  	    If k>0 Then 
	         Var rname=""
      	   wtext3=nextwords(wtext2,"""name:en""")
	         If wtext3<>"" Then
	 	         rname=formatname(nextdata0(wtext3,"""",""""))
	         Else 
	            wtext3=nextwords(wtext2,"""int_name""")
	            If wtext3<>"" Then
	 	            rname=formatname(nextdata0(wtext3,"""",""""))
	            Else
	               wtext3=nextwords(wtext2,"""name""")
	               If wtext3<>"" Then
	 	               rname=formatname(nextdata0(wtext3,"""",""""))
	               EndIf 	
	            EndIf   
	         EndIf
	  	      wayname(i)=rname
	  	      getlocktown(0)
	  	      If k>100000 Then
	  	    	   k-=100000
	  	    	   addbridges(waylat(i),waylon(i),mylat(k),mylon(k),wayname(i))
	  	      ElseIf k>0 Then
	  	    	   addbridges(waylat(i),waylon(i),latnode(k),lonnode(k),wayname(i))
	  	      EndIf
	  	      freelocktown(0)
	  	    EndIf 'k>0
 	     EndIf
 	    EndIf  
 	  EndIf    
	Next i 
End Sub
Function formatname(text0 As String)As String
	Dim As String abcd="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 '-_éèçà&ù,;:!*?./"
	Dim As String abcd2="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789éèçà&ù"
	Dim As String utf8="Ã©Ã¨Ã§Ã Ã¹Ã¢ÃªÃ®Ã´Ã»Ã‚ÃŠÃŽÃ”Ã›Ã¤Ã«Ã¯Ã¶Ã¼Ã„Ã‹ÃÃ–ÃœÃ‰ÃˆÃ‡"
   Dim As String ansi="eecauaeiouAEIOUaeiouAEIOUEEC" '"éèçàùâêîôûÂÊÎÔÛäëïöüÄËÏÖÜÉÈÇ"
	Dim As String text,c,cc
	Dim As Integer i,li,j,k,tok=0
	text="":li=Len(text0)
	For i=1 To li
		c=Mid(text0,i,1)
		If InStr(abcd,c)>0 Then
			text+=c
			If tok=0 Then
				If InStr(abcd2,c)>0 Then tok=1
			EndIf
		ElseIf i<li Then
			cc=Mid(text0,i,2)
			j=InStr(utf8,cc)
			If j>0 And (j Mod 2)=1 Then
				text+=Mid(ansi,Int(j/2+1),1)
				i+=1
				tok=1
			Else
				text+="."
			EndIf
		Else 	
			text+="."
		EndIf
	Next
	if tok=0 then return ""
	Return Left(Trim(text),40)
End Function
Dim Shared As String countrycode
Sub getreverse(text0 As String)'getways
	Dim As Integer i,j,k,test
	Dim As int64 id
	Dim As String c
	'guinotice(text0)
	reverselocation=""
	i=InStr(text0," ref=""")
	If i>0 Then  
	   wline=Mid(text0,i+6)
	   j=InStr(wline,"""")
	   reverselocation=formatname(Left(wline,j-1))
	   If reverselocation<>"" And InStr(reverselocation,"..")<1 Then Exit Sub 
	EndIf      
	i=InStr(text0,"<city>")
	If i>0 Then  
	   wline=Mid(text0,i+6)
	   j=InStr(wline,"<")
	   reverselocation=formatname(Left(wline,j-1))
	   Exit Sub 
	EndIf      
	i=InStr(text0,"<village>")
	If i>0 Then  
	   wline=Mid(text0,i+9)
	   j=InStr(wline,"<")
	   reverselocation=formatname(Left(wline,j-1))
	   Exit Sub 
	EndIf      
	i=InStr(text0,"<hamlet>")
	If i>0 Then  
	   wline=Mid(text0,i+8)
	   j=InStr(wline,"<")
	   reverselocation=formatname(Left(wline,j-1))
	   Exit Sub 
	EndIf      
	i=InStr(text0,"<town>")
	If i>0 Then  
	   wline=Mid(text0,i+6)
	   j=InStr(wline,"<")
	   reverselocation=formatname(Left(wline,j-1))
	   Exit Sub 
	EndIf      
	'guinotice(reverselocation)
	/'countrycode=""
	i=InStr(text0,"<country_code>")
	If i<1 Then Exit Sub 
	wline=Mid(text0,i+14)
	j=InStr(wline,"<")
	countrycode=UCase(Left(wline,j-1))
	guinotice countrycode '/
End Sub
'Dim Shared As Integer ntownnode=100,townnwaynode(ntown),towniwaynode(ntown,ntownnode)
/'Dim Shared As int64  townwaynodeid(ntown,ntownnode)
Dim Shared As Single townwaynodex(ntown,ntownnode,nwaynode),townwaynodey(ntown,ntownnode,nwaynode)
Dim Shared As Single townwaynodeh(ntown,ntownnode),townwaynodez(ntown,ntownnode)
Dim Shared As Single townwaynodevie(ntown,ntownnode)
Dim Shared As Integer townwaynodebuild(ntown,ntownnode) '/
'Dim Shared As Integer ntowpnode=100,towpnwaynode(ntowp),towpiwaynode(ntowp,ntowpnode)
'Dim Shared As int64  towpwaynodeid(ntowp,ntowpnode)
'Dim Shared As Single towpwaynodex(ntowp,ntowpnode,nwaynode),towpwaynodey(ntowp,ntowpnode,nwaynode)
'Dim Shared As Single towpwaynodeh(ntowp,ntowpnode),towpwaynodez(ntowp,ntowpnode)
Sub resettownwaynode()
Dim As Integer ij,i,j
For ij=0 To ntown
	townnwaynode(ij)=0
	For i=0 To ntownnode
		towniwaynode(ij,i)=0
		townwaynodeid(ij,i)=0
		townwaynodeh(ij,i)=0
		townwaynodez(ij,i)=-999999
		townwaynodevie(ij,i)=10
		townwaynodebuild(ij,i)=0
		townwaynoder(ij,i)=0
		townwaynodeg(ij,i)=0
		townwaynodeb(ij,i)=0
		townwayname(ij,i)=""
		towni40(ij,i)=0
		ttsetterrain(ij,i)=0
		'For j=0 To nwaynode
		'	townwaynodex(ij,i,j)=0
		'	townwaynodey(ij,i,j)=0
		'	townwaynodeo1(ij,i,j)=999
		'Next
		townalloc(ij,i)=0
		ReDim As Single (townwaynodexyo1(ij,i).x)(0)
		ReDim As Single (townwaynodexyo1(ij,i).y)(0)
		ReDim As Single (townwaynodexyo1(ij,i).o1)(0)
	Next
Next
resetrecentid()
End Sub
Sub resettownwaynode2()
Dim As Integer ij,i,j
For ij=0 To ntown
	townnwaynode2(ij)=0
	For i=0 To ntownnode
		towniwaynode2(ij,i)=0
		townwaynodeid2(ij,i)=0
		townwaynodeh2(ij,i)=0
		townwaynodez2(ij,i)=-999999
		townwaynodevie2(ij,i)=10
		townwaynodebuild2(ij,i)=0
		townwaynoder2(ij,i)=0
		townwaynodeg2(ij,i)=0
		townwaynodeb2(ij,i)=0
		townwayname2(ij,i)=""
		towni402(ij,i)=0
		ttsetterrain2(ij,i)=0
		'For j=0 To nwaynode
		'	townwaynodex2(ij,i,j)=0
		'	townwaynodey2(ij,i,j)=0
		'	townwaynodeo12(ij,i,j)=999
		'Next
		townalloc2(ij,i)=0
		ReDim As Single (townwaynodexyo12(ij,i).x)(0)
		ReDim As Single (townwaynodexyo12(ij,i).y)(0)
		ReDim As Single (townwaynodexyo12(ij,i).o1)(0)
	Next
Next
resetrecentid()
End Sub
Dim Shared As Integer water2(-100 To 612,-100 To 612)
Sub resetmxy0()
Dim As Integer i,j,k,ij,di,dj    
 dxcopy=-Int(mx/scalex)*scalex:dycopy=-Int(my/scalex)*scalex
 di=-Int(mx/scalex):dj=-Int(my/scalex)
 mx+=dxcopy:my+=dycopy
 mx0+=dxcopy:my0+=dycopy
 Var aux=(8/40)/(4*k8*512*scalex)  
 'Var mapautoix=535+worldx+(x)*aux*535
 'Var mapautoiy=(276+worldy)-(y)*aux*276*2
 myworldx-=dxcopy*aux*535
 myworldy+=dycopy*aux*276*2
 worldx00-=dxcopy*aux*535
 worldy00+=dycopy*aux*276*2
 worldx-=dxcopy*aux*535
 worldy+=dycopy*aux*276*2
 xweb+=dxcopy:yweb+=dycopy
 xweb1+=dxcopy:yweb1+=dycopy
 mxytolatlng(xweb,yweb)
 For ij=1 To ntown2
 	for i=1 To townnwaynode(ij)
 		For j=1 To towniwaynode(ij,i)
 			townwaynodex(ij,i,j)+=dxcopy
 			townwaynodey(ij,i,j)+=dycopy
 		Next
 	Next
 Next
 For i=1 To narbre
 	arbrex(i)+=dxcopy
 	arbrey(i)+=dycopy
 Next
 For i=1 To nbuisson
 	buissonx(i)+=dxcopy
 	buissony(i)+=dycopy
 Next
 For i=1 To nroc
 	rocx(i)+=dxcopy
 	rocy(i)+=dycopy
 Next
 For i=1 To nlady
 	ladyx(i)+=dxcopy
 	ladyy(i)+=dycopy
 Next
 For i=1 To ncow
 	cowx(i)+=dxcopy
 	cowy(i)+=dycopy
 Next
 For i=1 To nairport
 	airportx(i)+=dxcopy
 	airporty(i)+=dycopy
 Next
 For i=1 To nfuel
 	fuelx(i)+=dxcopy
 	fuely(i)+=dycopy
 Next
 For i=1 To nship
 	airshipx(i)+=dxcopy
 	airshipy(i)+=dycopy
 Next
 'subsettupdate()
 For i=-100 To 612
 	For j=-100 To 612
 		Var ii=i-di,jj=j-dj
 		If ii<-100 Or ii>612 Or jj<-100 Or jj>612 Then
 			terrain22(i,j)=waterz-4'2
 			water2(i,j)=1
 		Else
 			terrain22(i,j)=terrain(ii,jj)
 			water2(i,j)=water(ii,jj)
 		EndIf
 	Next
 Next
 For i=-100 To 612
 	For j=-100 To 612
		terrain(i,j)=terrain22(i,j)
		terrain0(i,j)=terrain(i,j)
		water(i,j)=water2(i,j)
 	Next
 Next
End Sub
Dim Shared As Single testmz0,testmzsol0
Sub testresetmz0()
Dim As Integer i,j,k,ij,n
 If plane=0 Or car>0 Or tinittown0>0 Then
   testmz0=mz:testmzsol0=mzsol0
 	Exit Sub 
 EndIf
 If Abs(testmz0-testmzsol0-(mz-mzsol0))<90 Or Abs(testmz0-testmzsol0)<10 Or time2<tcrashz+10 Then
   testmz0=mz:testmzsol0=mzsol0
 	Exit Sub 
 EndIf
 Var dzcopy=(testmz0-testmzsol0)-(mz-mzsol0)
 mz+=dzcopy:mz1+=dzcopy
 testmzsol0=mz-(testmz0-testmzsol0)
 testmz0=mz
 For i=1 To narbre
 	arbrez(i)+=dzcopy
 Next
 For i=1 To nbuisson
 	buissonz(i)+=dzcopy
 Next
 For i=1 To nroc
 	rocz(i)+=dzcopy
 Next
 For i=1 To nlady
 	ladyz(i)+=dzcopy
 Next
 For i=1 To ncow
 	cowz(i)+=dzcopy
 Next
 For i=1 To nairport
 	airportz(i)+=dzcopy
 Next
 For i=1 To nfuel
 	fuelz(i)+=dzcopy
 Next
 For i=1 To nship
 	airshipz(i)+=dzcopy
 Next 

/'getlockterrain()
For ij=0 To ntown2
	n=townnwaynode(ij)
	If n>0 Then
	 getlocktown(ij)
	 For i=1 To n
		If townwaynodez(ij,i)>-99990 Then
			townwaynodez(ij,i)+=dzcopy
		EndIf	
	 Next
	 freelocktown(ij)
	EndIf  
Next
freelockterrain() '/
End Sub 
Sub updatetownwaynode()
Dim As Integer ij,i,j,n
getlockterrain22()
For ij=0 To ntown2
	n=townnwaynode(ij)
	If n>0 Then
	 getlocktown(ij)
	 For i=1 To n
		'For j=1 To towniwaynode(ij,i)
			townwaynodez(ij,i)=getterrainheight2(townwaynodex(ij,i,1)-dmx0,townwaynodey(ij,i,1)-dmy0)
		'Next 	
	 Next
	 freelocktown(ij)
	EndIf  
Next
freelockterrain22()
End Sub
Declare Function testbridge(latx As Single,lngx As Single)As Integer
Sub addtownwaynode(ij As Integer,k As Integer)
Dim As Integer i,j,n,p
Dim As Single mxweb,myweb',mxweb2,myweb2,mxweb3,myweb3
Dim As int64 id,id0
n=townnwaynode(ij)
If n>=ntownnode Then
	n=ntownnode
	townnwaynode(ij)=n
	'Exit Sub
EndIf
'If InStr(LCase(wayname(k)),"ge henri")>0 Then auxvar+=1000:auxtest=0.72
id=waynodeid(k)
If id=0 Then Exit Sub 
If waytheight(k)=100 Or tmassload=1 Then'road
	If testrecentid(id) Then Exit Sub 
   'addrecentid(id)
endif 
'If Str(id)="79152373" Then auxvar+=1:auxtest=0.8
p=0
For i=1 To n
	id0=townwaynodeid(ij,i)
	If id0=0 Or towniwaynode(ij,i)<2 Or (id=id0)Then' And (waytheight(k)=100 Or addwaynodebuild(k)=100))Then
		If p=0 Then p=i:'auxvar+=0.00001
		'If id=id0 Then p=i:Exit For 
	EndIf
   If id=id0 Then  
     If (townwaynodevie(ij,i)<14 Or auxtest>0.1) And kmxlat>10 Then
   	  townwaynodevie(ij,i)+=1'15
   	  p=i:Exit For
     EndIf    	
   EndIf
	If id=id0 Then
      'townwaynodez(ij,i)=-999999
     p=i
             'If Str(id)="79152373" Then auxvar+=1000:auxtest=0.8
   			'If waytheight(k)=100 Then 
   			 Var i40=towni40(ij,i)
   			 towni40(ij,i)=max2(0,i40)
   			 'If i40>0 Then
   				'townixy40(i40)=1
             	'For j=0 To n40
		         '   townnodex40(i40,j)=0
		         '   townnodey40(i40,j)=0
             	'Next
   			 'EndIf
   			'EndIf  
   			townwaynodeh(ij,i)=wayheight(k)
   			If wayname(k)<>"" Or Rnd<0.2 Then townwayname(ij,i)=wayname(k)
            If addwaynodebuild(k)>0 Then
                townwaynodebuild(ij,i)=addwaynodebuild(k)
                If addwaynodebuild(k)=100 Then
                	 townwaynodeh(ij,i)=wayheight(k)
                EndIf
            ElseIf waytype(k)="terminal" Then
   				townwaynodebuild(ij,i)=11
   			ElseIf waytheight(k)=1 Then
   				'townwaynodeh(ij,i)=wayheight(k)
   				If wayheight(k)>=4000 Then townwaynodebuild(ij,i)=5'+Int(Rnd*2) 
   				If wayheightmin(k)>10 and wayheight(k)<4000 then
   				 townwaynodebuild(ij,i)=4
   				 townwaynodeh(ij,i)=wayheight(k)+Int(wayheightmin(k))*4000
   				EndIf
   				townwaynoder(ij,i)=wayr(k)
   				townwaynodeg(ij,i)=wayg(k)
   				townwaynodeb(ij,i)=wayb(k)
            ElseIf waytheight(k)=2 Then
   				townwaynodebuild(ij,i)=10'bridge
   				'townwaynodeh(ij,i)=h
   			ElseIf waytheight(k)=100 Then
   				townwaynodebuild(ij,i)=100'highway
   				'townwaynodez(ij,i)=mzsol0
   				townwaynodeh(ij,i)=wayheight(k)
   				townwaynoder(ij,i)=wayr(k)
   				townwaynodeg(ij,i)=wayg(k)
   				townwaynodeb(ij,i)=wayb(k)
            ElseIf waytheight(k)=4 Then
   				townwaynodebuild(ij,i)=12'church
   			ElseIf waytheight(k)=5 Then
   				townwaynodebuild(ij,i)=13'shop
   			ElseIf waytheight(k)=6 Then
   				townwaynodebuild(ij,i)=14'official
   			ElseIf waytheight(k)=7 Then
   				townwaynodebuild(ij,i)=15'railstation
   			ElseIf waytheight(k)=8 Then
   				townwaynodebuild(ij,i)=16'hospital
   			ElseIf waytheight(k)=9 Then
   				townwaynodebuild(ij,i)=17'fuel
   				townwaynodeh(ij,i)=82
   			ElseIf waytheight(k)=10 Then
   				townwaynodebuild(ij,i)=18'school
   			ElseIf townwaynodebuild(ij,i)<=3 Or Rnd<0.2 Then 
      			townwaynodebuild(ij,i)=1+(id Mod 3)'1+Int(Rnd*3)
            EndIf 	
      'Exit For
		Exit Sub
	EndIf
Next
If n>=ntownnode And p=0 Then
 n=ntownnode	
 If waytheight(k)>=4 Or addwaynodebuild(k)>=12 Then
	For i=1 To n
		If townwaynodebuild(ij,i)<10 Then
			p=i:Exit For
		EndIf
	Next
 EndIf
 If p=0 Then Exit Sub  
EndIf
 
Var ij2=ij-1
If ij2>0 Then
	For i=1 To townnwaynode(ij2)
		If id=townwaynodeid(ij2,i) Then
         'townwaynodez(ij2,i)=-999999
         townwaynodeid(ij2,i)=0
         'auxvar2+=1
		   'Exit Sub			
		EndIf
	Next
EndIf
ij2=ij-i101
If ij2>0 Then
	For i=1 To townnwaynode(ij2)
		If id=townwaynodeid(ij2,i) Then
         'townwaynodez(ij2,i)=-999999
         townwaynodeid(ij2,i)=0
         'auxvar2+=1
		   'Exit Sub			
		EndIf
	Next
EndIf
ij2=ij+1
If ij2<ntown2 Then
	For i=1 To townnwaynode(ij2)
		If id=townwaynodeid(ij2,i) Then
         'townwaynodez(ij2,i)=-999999
         townwaynodeid(ij2,i)=0
         'auxvar2+=1
		   'Exit Sub			
		EndIf
	Next
EndIf
ij2=ij+i101
If ij2<ntown2 Then
	For i=1 To townnwaynode(ij2)
		If id=townwaynodeid(ij2,i) Then
         'townwaynodez(ij2,i)=-999999
         townwaynodeid(ij2,i)=0
         'auxvar2+=1
		   'Exit Sub			
		EndIf
	Next
EndIf
ij2=ij+i101+1
If ij2<ntown2 Then
	For i=1 To townnwaynode(ij2)
		If id=townwaynodeid(ij2,i) Then
         'townwaynodez(ij2,i)=-999999
         townwaynodeid(ij2,i)=0
         'auxvar2+=1
		   'Exit Sub			
		EndIf
	Next
EndIf
ij2=ij-i101-1
If ij2>0 Then
	For i=1 To townnwaynode(ij2)
		If id=townwaynodeid(ij2,i) Then
         'townwaynodez(ij2,i)=-999999
         townwaynodeid(ij2,i)=0
         'auxvar2+=1
		   'Exit Sub			
		EndIf
	Next
EndIf
ij2=ij-i101+1
If ij2>0 Then
	For i=1 To townnwaynode(ij2)
		If id=townwaynodeid(ij2,i) Then
         'townwaynodez(ij2,i)=-999999
         townwaynodeid(ij2,i)=0
         'auxvar2+=1
		   'Exit Sub			
		EndIf
	Next
EndIf
ij2=ij+i101-1
If ij2<ntown2 Then
	For i=1 To townnwaynode(ij2)
		If id=townwaynodeid(ij2,i) Then
         'townwaynodez(ij2,i)=-999999
         townwaynodeid(ij2,i)=0
         'auxvar2+=1
		   'Exit Sub			
		EndIf
	Next
EndIf

i=n+1
if p>0 then i=p
'Var lat0=lat,lng0=lng
'j=Int(iwaynode(k)*0.51)
Var latweb=(waynodey(k,1))'+waynodey(k,j))/2
Var lngweb=(waynodex(k,1))'+waynodex(k,j))/2
if testbridge(latweb,lngweb)=1 Then
	townwaynodeid(ij,i)=0
	towniwaynode(ij,i)=0
	Exit Sub 
EndIf
'mxweb=mx+dmx0:myweb=my+dmy0
'mxweb=xweb:myweb=yweb
'mxytolatlng(mxweb,myweb)
'latweb=lat:lngweb=lng
latlngtomxy(latweb,lngweb,mxweb,myweb)
'latlngtomxy(latweb+0.001,lngweb+0.001,mxweb2,myweb2)
'lat=lat0:lng=lng0
If i>ntownnode Then
	Var co1=cos1,si1=sin1
	Var dxx=co1*(mxweb-mx-dmx0)+si1*(myweb-my-dmy0)
	Var d400=-400,d2000=500
	If waytheight(k)=100 Or addwaynodebuild(k)=100 Then d400=-5000:d2000=0
	If dxx>d400 Then
	 dxx=max(0.0,dxx)+d2000
	 Var j0=0
	 For j=1 To ntownnode
	 	If townwaynodebuild(ij,j)=100 Then Continue For 
		Var dxxx=co1*(townwaynodex(ij,j,1)-mx-dmx0)+si1*(townwaynodey(ij,j,1)-my-dmy0)
		If dxxx<-400 Or dxxx>dxx Then
			j0=j
			If townwaynodebuild(ij,j)<10 And townwaynodeh(ij,j)<300 Then
				p=j:i=j:Exit For 
			EndIf
		EndIf
	 Next
	 If i>ntownnode And j0>0 Then
	 	If waytheight(k)=100 Or addwaynodebuild(k)=100 Then p=j0:i=j0 
	 EndIf
	EndIf  
EndIf 	
If i>ntownnode Then
	Exit Sub 
EndIf
'myy=yweb+(latxx-lat)*kmxlat'latmx
'mxx=xweb+(lngxx-lng)*kmxlat/klon'lngmx 
'If waytheight(k)=100 Then
 Var i40=towni40(ij,i)
 towni40(ij,i)=max2(0,i40)
 'If i40>0 Then
	'townixy40(i40)=1
	'For j=0 To n40
	'	townnodex40(i40,j)=0
	'	townnodey40(i40,j)=0
	'Next
 'EndIf
'EndIf  
townwaynodeid(ij,i)=id
iwaynode(k)=min2(nwaynode,iwaynode(k))
towniwaynode(ij,i)=iwaynode(k)
townwaynodeh(ij,i)=wayheight(k)
townwayname(ij,i)=wayname(k)
            If addwaynodebuild(k)>0 Then
                townwaynodebuild(ij,i)=addwaynodebuild(k)
                If addwaynodebuild(k)=100 Then
                	 townwaynodeh(ij,i)=wayheight(k)
                EndIf
            ElseIf waytype(k)="terminal" Then
   				townwaynodebuild(ij,i)=11
   			ElseIf waytheight(k)=1 Then
   				townwaynodebuild(ij,i)=4+Int(Rnd*3)
   				If wayheight(k)>=4000 Then townwaynodebuild(ij,i)=5'+Int(Rnd*2) 
   				if wayheightmin(k)>10 and wayheight(k)<4000 then
   				 townwaynodebuild(ij,i)=4
   				 townwaynodeh(ij,i)=wayheight(k)+Int(wayheightmin(k))*4000
   				endif  
   				townwaynoder(ij,i)=wayr(k)
   				townwaynodeg(ij,i)=wayg(k)
   				townwaynodeb(ij,i)=wayb(k)
            ElseIf waytheight(k)=2 Then
   				townwaynodebuild(ij,i)=10'bridge
   				'townwaynodeh(ij,i)=h
   			ElseIf waytheight(k)=100 Then
   				townwaynodebuild(ij,i)=100'highway
   				townwaynodeh(ij,i)=wayheight(k)
   				townwaynoder(ij,i)=wayr(k)
   				townwaynodeg(ij,i)=wayg(k)
   				townwaynodeb(ij,i)=wayb(k)
            ElseIf waytheight(k)=4 Then
   				townwaynodebuild(ij,i)=12'church
   			ElseIf waytheight(k)=5 Then
   				townwaynodebuild(ij,i)=13'shop
   			ElseIf waytheight(k)=6 Then
   				townwaynodebuild(ij,i)=14'official
   			ElseIf waytheight(k)=7 Then
   				townwaynodebuild(ij,i)=15'railstation
   			ElseIf waytheight(k)=8 Then
   				townwaynodebuild(ij,i)=16'hospital
   			ElseIf waytheight(k)=9 Then
   				townwaynodebuild(ij,i)=17'fuel
   				townwaynodeh(ij,i)=82
   			ElseIf waytheight(k)=10 Then
   				townwaynodebuild(ij,i)=18'school
   			Else 
      			townwaynodebuild(ij,i)=1+(id Mod 3)'Int(Rnd*3)
      		EndIf 	
townwaynodez(ij,i)=-999999
'latweb=lat:lngweb=lng
'latlngtomxy(latweb,lngweb,mxweb,myweb)
For j=1 To iwaynode(k)
	'latlngtomxy(waynodey(k,j),waynodex(k,j),mxx,myy)
	''townwaynodex(ij,i,j)=mxweb+(waynodex(k,j)-lngweb)*(mxweb2-mxweb)/0.00114
	''townwaynodey(ij,i,j)=myweb+(waynodey(k,j)-latweb)*(myweb2-myweb)/0.00114
	townwaynodex(ij,i,j)=mxweb+(waynodex(k,j)-lngweb)*kmxlat/klon
	townwaynodey(ij,i,j)=myweb+(waynodey(k,j)-latweb)*kmxlat
Next
townwaynodesize40(ij,i)=0
townnwaynode(ij)=max2(i,n)
'If Str(id)="79152373" Then auxvar+=1:auxtest=0.8
'If waytheight(k)=100 Or (tmassload=1 And iwaynode(k)<nwaynode) Then'road
	'If testrecentid(id) Then Exit Sub 
   addrecentid(id)
'endif    
End Sub
Dim Shared As Single townzsol
Const As Integer nshadow=12000
Dim Shared As Integer nishadow(nshadow),nisshadow(nshadow),shadowrank(nshadow)
'Dim Shared As Single dxshadow,dyshadow,dzshadow
Dim Shared As Single shadowx1(nshadow),shadowy1(nshadow),shadowz1(nshadow)
Dim Shared As Single shadowx2(nshadow),shadowy2(nshadow),shadowz2(nshadow)
Dim Shared As Single shadowx3(nshadow),shadowy3(nshadow),shadowz3(nshadow)
Dim Shared As Single shadowx4(nshadow),shadowy4(nshadow),shadowz4(nshadow)
'Dim Shared As Single shadowdr(nshadow),shadowdh(nshadow),shadowdx(nshadow),shadowdy(nshadow)
Dim Shared As Single shadownx(nshadow),shadowny(nshadow),shadownz(nshadow),shadowkdxyz(nshadow)
Dim Shared As uint shadowtexture(nshadow),myshadowtext 
Dim Shared As Single shadowtx1(nshadow),shadowty1(nshadow),shadowtx2(nshadow),shadowty2(nshadow),myshadowtx=1
'Dim Shared As Single myshadowz1,myshadowz2,myshadowz3,myshadowz4,myirank1
Dim Shared As Integer testmygltexquad,testmygltexquad0,buildrottype
Sub addshadowquad(ByVal x10 As Single,ByVal y10 As Single,ByVal z10 As Single, _ 
	                ByVal x20 As Single,ByVal y20 As Single,ByVal z20 As Single,ByVal dr As Single,ByVal rank As Integer=0)
Dim As Integer i,j,k
If ishadow>=nshadow Then Exit Sub
'ishadow+=1
    'Var x=x1,y=y1,z=z1,xx=x2,yy=y2,zz=z2,xxx=x1+dr*dxshadow,yyy=y1+dr*dyshadow,zzz=z1+dr*dzshadow
    /'setnorm(xxx-x,yyy-y,zzz-z, xx-x,yy-y,zz-z)
    Var co1=x-mx,si1=y-my,si2=z-mz
    Var no1=1/max(0.001,Sqr(co1*co1+si1*si1+si2*si2))
    co1*=no1:si1*=no1:si2*=no1
    Var dxyz=normx*(co1)+normy*(si1)+normz*(si2)
    Var normxy=1:If dxyz>0 Then normxy=-1
    nishadow(ishadow)=normxy
    'shadowkdxyz(ishadow)=dxyz
    'shadownx(ishadow)=normx
    'shadowny(ishadow)=normy
    'shadownz(ishadow)=normz
    '/
    'myshadowtext=bridgeredtext
    Dim As Integer di,dj
    Var kshadow=min(2500.0,dr*(dxyshadow)/max(0.2,Abs(dzshadow)))
    Var z9=5.0
 	 di=max2(1,Int(kshadow/200.0))
 	 kshadow=kshadow/di
 	 dj=max2(1,Int(max(Abs(x20-x10),Abs(y20-y10))/200.0))
 	 If ishadow+di*dj>=nshadow Then Exit Sub
 	 Var x1=x10,y1=y10,x2=x20,y2=y20
 	 Var dx=(x2-x1)/dj,dy=(y2-y1)/dj
 	 Var dtx=1.0/dj,dty=1.0/di
 	 Var tx1=0.0,ty1=0.0
 	 dtx*=myshadowtx
For j=0 To dj-0.9 	 
 x1=x10+j*dx
 y1=y10+j*dy
 x2=x1+dx
 y2=y1+dy
 tx1=j*dtx
 ty1=0.0
 'If rank<>1 Then
 	 /'shadowx1(ishadow)=x1
 	 shadowy1(ishadow)=y1
 	 shadowz1(ishadow)=z1
 	 shadowx2(ishadow)=x2
 	 shadowy2(ishadow)=y2
 	 shadowz2(ishadow)=z2
 	 shadowx3(ishadow)=x2+kshadow*dxshadow
 	 shadowy3(ishadow)=y2+kshadow*dyshadow
 	 shadowz3(ishadow)=z2+kshadow*dzshadow'+myshadowz3-myshadowz2
 	 shadowx4(ishadow)=x1+kshadow*dxshadow
 	 shadowy4(ishadow)=y1+kshadow*dyshadow
 	 shadowz4(ishadow)=z1+kshadow*dzshadow '/
 /'ElseIf rank=1 And kshadow<200 Then 
 	 shadowx1(ishadow)=x1
 	 shadowy1(ishadow)=y1
 	 'shadowz1(ishadow)=z1
 	 shadowz1(ishadow)=z9+getterrainheight(shadowx1(ishadow),shadowy1(ishadow))
 	 shadowx2(ishadow)=x2
 	 shadowy2(ishadow)=y2
 	 'shadowz2(ishadow)=z2
 	 shadowz2(ishadow)=z9+getterrainheight(shadowx2(ishadow),shadowy2(ishadow))
 	 shadowx3(ishadow)=x2+kshadow*dxshadow
 	 shadowy3(ishadow)=y2+kshadow*dyshadow
 	 shadowz3(ishadow)=z9+getterrainheight(shadowx3(ishadow),shadowy3(ishadow))
 	 shadowx4(ishadow)=x1+kshadow*dxshadow
 	 shadowy4(ishadow)=y1+kshadow*dyshadow
 	 shadowz4(ishadow)=z9+getterrainheight(shadowx4(ishadow),shadowy4(ishadow))
 '/
 If rank=1 Or rank=2 Then
    'z9=9.0
    ishadow+=1	
    shadowrank(ishadow)=rank
    shadowtexture(ishadow)=myshadowtext
    shadowtx1(ishadow)=tx1
    shadowty1(ishadow)=ty1
    shadowtx2(ishadow)=tx1+dtx
    shadowty2(ishadow)=ty1+dty
 	 shadowx1(ishadow)=x1
 	 shadowy1(ishadow)=y1
 	 'shadowz1(ishadow)=z1
 	 'If max(Abs(shadowx1(ishadow)-mx),Abs(shadowy1(ishadow)-my))<360 Then z9=5.0 Else z9=19.0
 	 shadowz1(ishadow)=z9+getterrainheight(shadowx1(ishadow),shadowy1(ishadow))
 	 shadowx2(ishadow)=x2
 	 shadowy2(ishadow)=y2
 	 'shadowz2(ishadow)=z2
 	 shadowz2(ishadow)=z9+getterrainheight(shadowx2(ishadow),shadowy2(ishadow))
 	 shadowx3(ishadow)=shadowx2(ishadow)+kshadow*dxshadow
 	 shadowy3(ishadow)=shadowy2(ishadow)+kshadow*dyshadow
 	 'z9=9.0
 	 'If max(Abs(shadowx3(ishadow)-mx),Abs(shadowy3(ishadow)-my))<360 Then z9=5.0 Else z9=19.0
 	 shadowz3(ishadow)=z9+getterrainheight(shadowx3(ishadow),shadowy3(ishadow))
 	 shadowx4(ishadow)=shadowx1(ishadow)+kshadow*dxshadow
 	 shadowy4(ishadow)=shadowy1(ishadow)+kshadow*dyshadow
 	 shadowz4(ishadow)=z9+getterrainheight(shadowx4(ishadow),shadowy4(ishadow))
 	 For i=1 To di-1
 	 'z9=9.0
 	 ishadow+=1	
    shadowrank(ishadow)=rank
    shadowtexture(ishadow)=myshadowtext
    ty1+=dty
    shadowtx1(ishadow)=tx1
    shadowty1(ishadow)=ty1
    shadowtx2(ishadow)=tx1+dtx
    shadowty2(ishadow)=ty1+dty
 	 shadowx1(ishadow)=shadowx4(ishadow-1)
 	 shadowy1(ishadow)=shadowy4(ishadow-1)
 	 shadowz1(ishadow)=shadowz4(ishadow-1)
 	 shadowx2(ishadow)=shadowx3(ishadow-1)
 	 shadowy2(ishadow)=shadowy3(ishadow-1)
 	 shadowz2(ishadow)=shadowz3(ishadow-1)
 	 shadowx3(ishadow)=shadowx2(ishadow)+kshadow*dxshadow
 	 shadowy3(ishadow)=shadowy2(ishadow)+kshadow*dyshadow
 	 'If max(Abs(shadowx3(ishadow)-mx),Abs(shadowy3(ishadow)-my))<360 Then z9=5.0 Else z9=12.0
 	 shadowz3(ishadow)=z9+getterrainheight(shadowx3(ishadow),shadowy3(ishadow))
 	 shadowx4(ishadow)=shadowx1(ishadow)+kshadow*dxshadow
 	 shadowy4(ishadow)=shadowy1(ishadow)+kshadow*dyshadow
 	 shadowz4(ishadow)=z9+getterrainheight(shadowx4(ishadow),shadowy4(ishadow))
 	 Next i
 	 /'myshadowz3=shadowz3(ishadow)
 	 myshadowz4=shadowz4(ishadow)
 	 myshadowz2=shadowz2(ishadow)
 	 myshadowz1=shadowz1(ishadow)
 	 myirank1=ishadow'/
 ElseIf rank=3 Then 
    'z9=9.0
    ishadow+=1	
    shadowrank(ishadow)=rank
    Var dr0=z10'max(0.0,z10-getterrainheight(x10,y10))
    Var kshadow0=min(1500.0,dr0*(dxyshadow)/max(0.2,Abs(dzshadow)))
    Var dr1=z20'max(0.0,z20-getterrainheight(x20,y20))
    Var kshadow1=min(1500.0,dr1*(dxyshadow)/max(0.2,Abs(dzshadow)))
    Var distxx=max(0.001,Sqr(dx*dx+dy*dy))
    Var dxx=dy/distxx,dyy=-dx/distxx
    kshadow=dr 
    shadowtexture(ishadow)=myshadowtext
    shadowtx1(ishadow)=tx1
    shadowty1(ishadow)=ty1
    shadowtx2(ishadow)=tx1+dtx
    shadowty2(ishadow)=ty1+dty
 	 shadowx1(ishadow)=x1+kshadow0*dxshadow
 	 shadowy1(ishadow)=y1+kshadow0*dyshadow
 	 'shadowz1(ishadow)=z1
 	 'If max(Abs(shadowx1(ishadow)-mx),Abs(shadowy1(ishadow)-my))<360 Then z9=5.0 Else z9=19.0
 	 shadowz1(ishadow)=z9+getterrainheight(shadowx1(ishadow),shadowy1(ishadow))
 	 shadowx2(ishadow)=x2+kshadow1*dxshadow
 	 shadowy2(ishadow)=y2+kshadow1*dyshadow
 	 'shadowz2(ishadow)=z2
 	 shadowz2(ishadow)=z9+getterrainheight(shadowx2(ishadow),shadowy2(ishadow))
 	 shadowx3(ishadow)=shadowx2(ishadow)+kshadow*dxx
 	 shadowy3(ishadow)=shadowy2(ishadow)+kshadow*dyy
 	 'z9=9.0
 	 'If max(Abs(shadowx3(ishadow)-mx),Abs(shadowy3(ishadow)-my))<360 Then z9=5.0 Else z9=19.0
 	 shadowz3(ishadow)=z9+getterrainheight(shadowx3(ishadow),shadowy3(ishadow))
 	 shadowx4(ishadow)=shadowx1(ishadow)+kshadow*dxx
 	 shadowy4(ishadow)=shadowy1(ishadow)+kshadow*dyy
 	 shadowz4(ishadow)=z9+getterrainheight(shadowx4(ishadow),shadowy4(ishadow))
 	 For i=1 To di-1
 	 'z9=9.0
 	 ishadow+=1	
    shadowrank(ishadow)=rank
    shadowtexture(ishadow)=myshadowtext
    ty1+=dty
    shadowtx1(ishadow)=tx1
    shadowty1(ishadow)=ty1
    shadowtx2(ishadow)=tx1+dtx
    shadowty2(ishadow)=ty1+dty
 	 shadowx1(ishadow)=shadowx4(ishadow-1)
 	 shadowy1(ishadow)=shadowy4(ishadow-1)
 	 shadowz1(ishadow)=shadowz4(ishadow-1)
 	 shadowx2(ishadow)=shadowx3(ishadow-1)
 	 shadowy2(ishadow)=shadowy3(ishadow-1)
 	 shadowz2(ishadow)=shadowz3(ishadow-1)
 	 shadowx3(ishadow)=shadowx2(ishadow)+kshadow*dxx
 	 shadowy3(ishadow)=shadowy2(ishadow)+kshadow*dyy
 	 'If max(Abs(shadowx3(ishadow)-mx),Abs(shadowy3(ishadow)-my))<360 Then z9=5.0 Else z9=12.0
 	 shadowz3(ishadow)=z9+getterrainheight(shadowx3(ishadow),shadowy3(ishadow))
 	 shadowx4(ishadow)=shadowx1(ishadow)+kshadow*dxx
 	 shadowy4(ishadow)=shadowy1(ishadow)+kshadow*dyy
 	 shadowz4(ishadow)=z9+getterrainheight(shadowx4(ishadow),shadowy4(ishadow))
 	 Next i
 EndIf
Next j 
End Sub
Dim Shared As Integer mytnormal,thmin
Dim Shared As Single mynormalx,mynormaly,mynormalz
Sub mygltexquad (ByVal x1 As Single,ByVal y1 As Single,ByVal z1 As Single,_ 
             ByVal x2 As Single,ByVal y2 As Single,ByVal z2 As Single,_
             ByVal x3 As Single,ByVal y3 As Single,ByVal z3 As Single,_
             ByVal x4 As Single,ByVal y4 As Single,ByVal z4 As Single,_ 
             ByVal tx As Single=1,ByVal ty As Single=1,ByVal tx0 As Single=0,ByVal tagl As Integer=0)
Dim As Integer i,j,k,i1,i2,j1,j2,test=0
If testposx0=1 Then 
rotavionpx((x1)-mx,(y1)-my,max(0.0,z1-mz))
'If px2+Abs(py2)>1400 Then Exit sub  
Var zz1=px2
If testposx=1 And max(z4-mz,pz2)<min(400.0,px2*0.295) Then 
 i1=20+20*0.8*py2/max(0.1,px2)
 rotavionpx(x2-mx,y2-my,max(0.0,z2-mz))
 If max(z3-mz,pz2)<min(400.0,px2*0.295) Then
 	i2=20+20*0.8*py2/max(0.1,px2)
 	Var zz2=px2
 	If i1<=i2 Then
 	  If i1>1 And i2<40 Then	
 		Var dzi=(zz2-zz1)/max(1.0,i2-i1) 
 		Var zi=zz1-dzi
 	   For i=i1-1 To i2+1
 	   	If winposx(i)>zi Then test=1:Exit For 
 	   	zi+=dzi
 	   Next
 	   If test=0 Then Exit Sub
 	  EndIf  
 	Else
 	  If i2>1 And i1<40 Then 	
 		Var dzi=(zz1-zz2)/max(1.0,i1-i2)
 	   Var zi=zz2-dzi
 	   For i=i2-1 To i1+1
 	   	If winposx(i)>zi Then test=1:Exit For 
 	   	zi+=dzi
 	   Next
 	   If test=0 Then Exit Sub
 	  EndIf  
 	EndIf
 EndIf
EndIf
If taddshadowquad=1 And thmin=0 Then 'scaleview>0.9 And testtownshow=1 And tishadow=0 Then
 rotavionpx((x1+x2)*0.5-mx,(y1+y2)*0.5-my,0)
 'If px2+Abs(py2)>1400 Then Exit sub  
 Var kzshadow=max(0.2,dxyshadow)/max(0.2,dzshadow)
 If ishadow<nshadow And px2>0.9*Abs(py2)-min(4000.0,(z3-townzsol)*kzshadow+200) And px2<2400.1400  Then
  'setnorm(x3-x1,y3-y1,z3-z1, x2-x1,y2-y1,z2-z1)
  'Var dxyz=(normx*dxshadow+normy*dyshadow)/dxyshadow'+normz*dzshadow)
  Var dxyz=-(x2-x1)*dyshadow+(y2-y1)*dxshadow
  If buildrottype=-1 Then dxyz=-dxyz
  If ((dxyz>0.1)) And ishadow<nshadow Then
   'Var dr=max(0.001,z3-townzsol+100)'Abs(z3-z2)*0.4
   'Var zzz2=townzsol-100,zzz3=z3,zzz4=z4,zzz1=zzz2
   /'Var co1=mx-(x1+x2)*0.5,si1=my-(y1+y2)*0.5
   Var dco1=dxshadow*co1+dyshadow*si1
   Var dsi1=-dxshadow*si1+dyshadow*co1
   Var dsi10=-dxshadow*(y2-y1)*0.5+dyshadow*(x2-x1)*0.5
   Var testtrunk=0,kdx=1.0
   Var dco10=max(0.001,(z3-townzsol)*dxyshadow/dzshadow) 
  	If dco1>0 Then'And dco1<dco10 Then'And Abs(dsi1)<Abs(dsi10) Then
   	   testtrunk=1
  	EndIf'/  	
     'If (x3-mx)*(x3-mx)+(y3-my)*(y3-my)>(x4-mx)*(x4-mx)+(y4-my)*(y4-my) Then       
   'Var testtrunk=0
   'If max(Abs((x1+x2)*0.5-mx),Abs((y1+y2)*0.5-my))<200 Then 
   '	testtrunk=1
   'EndIf 
   'If buildrottype=1 Then
   	If tnightshadow=0 Then addshadowquad(x1,y1,townzsol+9,x2,y2,townzsol+9,(z3-townzsol)*1.2,1)
   'Else 
   '	addshadowquad(x2,y2,townzsol+9,x1,y1,townzsol+9,(z3-townzsol)*1.2,1)
   'EndIf
   /'If testtrunk=0 And buildrottype=199 Then  
      addshadowquad(x2,y2,zzz2,x3,y3,zzz3,dr,2)
      addshadowquad(x3,y3,zzz3,x4,y4,zzz4,dr,3)
      'addshadowquad(x4,y4,zzz4,x3,y3,zzz3,dr,3)
      addshadowquad(x4,y4,zzz4,x1,y1,zzz1,dr,4)
   EndIf    
   If testtrunk=0 And buildrottype<=1 Then  
      addshadowquad(x3,y3,zzz3,x2,y2,zzz2,dr,2)
      'addshadowquad(x3,y3,zzz3,x4,y4,zzz4,dr,3)
      addshadowquad(x4,y4,zzz4,x3,y3,zzz3,dr,3)
      addshadowquad(x1,y1,zzz1,x4,y4,zzz4,dr,4)
   EndIf '/    
  EndIf 
 EndIf  
EndIf
EndIf 'testposx
testmygltexquad=1
testmygltexquad0=1 
'If mytnormal=0 Then
If tagl=0 Then     
 glBegin GL_QUADS
 glTexCoord2f tx0,0
 glVertex3f x1,y1,z1
 glTexCoord2f tx0+tx,0
 glVertex3f x2,y2,z2
 glTexCoord2f tx0+tx,ty
 glVertex3f x3,y3,z3
 glTexCoord2f tx0,ty
 glVertex3f x4,y4,z4
 glEnd
Else
 aglbegin GL_QUADS
 agltexcoord2f tx0,0
 aglvertex3f x1,y1,z1
 agltexcoord2f tx0+tx,0
 aglvertex3f x2,y2,z2
 agltexcoord2f tx0+tx,ty
 aglvertex3f x3,y3,z3
 agltexcoord2f tx0,ty
 aglvertex3f x4,y4,z4
 aglend
EndIf  
/'Else
 glBegin GL_QUADS
 'glnormal3f mynormalx,mynormaly,mynormalz
 glTexCoord2f tx0,0
 glVertex3f x1,y1,z1
 'glnormal3f mynormalx,mynormaly,mynormalz
 glTexCoord2f tx0+tx,0
 glVertex3f x2,y2,z2
 'glnormal3f mynormalx,mynormaly,mynormalz
 glTexCoord2f tx0+tx,ty
 glVertex3f x3,y3,z3
 'glnormal3f mynormalx,mynormaly,mynormalz
 glTexCoord2f tx0,ty
 glVertex3f x4,y4,z4
 glEnd
EndIf '/  
End Sub
/'Sub subcopyshadow()
Dim As Integer i 
ishadow0=ishadow
For i=1 To ishadow
	sshadowrank(i)=shadowrank(i)
	sshadowx1(i)=shadowx1(i)
	sshadowy1(i)=shadowy1(i)
	sshadowz1(i)=shadowz1(i)
	sshadowx2(i)=shadowx2(i)
	sshadowy2(i)=shadowy2(i)
	sshadowz2(i)=shadowz2(i)
	sshadowx3(i)=shadowx3(i)
	sshadowy3(i)=shadowy3(i)
	sshadowz3(i)=shadowz3(i)
	sshadowx4(i)=shadowx4(i)
	sshadowy4(i)=shadowy4(i)
	sshadowz4(i)=shadowz4(i)
	/'sshadowx5(i)=shadowx5(i)
	sshadowy5(i)=shadowy5(i)
	sshadowz5(i)=shadowz5(i)
	sshadownx(i)=shadownx(i)
	sshadowny(i)=shadowny(i)
	sshadownz(i)=shadownz(i)
	sshadowkdxyz(i)=shadowkdxyz(i) '/
Next
End Sub '/
Dim Shared As Single talpha=1
Sub drawshadowwalls()
Dim As Integer i	
glbegin gl_quads
For i=1 To ishadow
  'If shadowrank(i)<>4 Then Continue For 
  If shadowrank(i)>=1 Then Continue For 
  glVertex3f shadowx1(i),shadowy1(i),shadowz1(i)
  glVertex3f shadowx2(i),shadowy2(i),shadowz2(i)
  'glVertex3f shadowx2(i)+100,shadowy2(i)+100,shadowz2(i)-100
  'glVertex3f shadowx1(i)+100,shadowy1(i)+100,shadowz1(i)-100
  glVertex3f shadowx3(i),shadowy3(i),shadowz3(i)
  glVertex3f shadowx4(i),shadowy4(i),shadowz4(i)
Next
glEnd
End Sub
Sub drawshadow()
Dim As Integer i,j,k 
tlight=0:If tnight=0 Then tlight=1
'If tdark=1 Then tnight=0:tlight=1
talpha=0.35
If mz>mzsol00+1400 Then Exit Sub 
If tshadow=0 Or (ishadow=0 And ishadowtree=0 And ishadowtree2=0 And ishadowlady=0) Then Exit Sub
If heure>=21 Or heure<=5 Then
     tnightshadow=1
	  dxshadow=cos1*0.95
	  dyshadow=sin1*0.95
	  dzshadow=-0.3
	  dxyshadow=0.9
	  o1shadow=o1
Else 	
	  tnightshadow=0
	  dxshadow=dxshadow0
	  dyshadow=dyshadow0
	  dzshadow=dzshadow0
	  dxyshadow=dxyshadow0
	  o1shadow=o1shadow0
EndIf
'auxvar6=ishadow:If auxtest<=0.0001 Then auxtest=0.85
'If ishadow<>ishadow0 Then subcopyshadow()
glpushmatrix
gltranslatef(0,0,(mz-mzsol00)*0.05)
glclear(GL_STENCIL_BUFFER_BIT)
'gltranslatef(shadowmx0-mx,shadowmy0-my,shadowmz0-mz)
gldisable gl_texture_2D
gldisable gl_normalize
gldisable gl_lighting
If auxtest<0.91 Then glColorMask(GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE)
glDepthMask(GL_FALSE)
glEnable(GL_STENCIL_TEST)
glStencilMask(255)

/'
'gldisable gl_depth_test
glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_keep, GL_keep, GL_incr)'_wrap_ext)'invert)'stencil fail,stencil ok,stencil+depth ok
'GL_NEVER, GL_LESS, GL_LEQUAL, GL_GREATER, GL_GEQUAL, GL_EQUAL, GL_NOTEQUAL, and GL_ALWAYS
glenable(gl_cull_face)
glcullface(gl_back)
'glFrontFace(GL_CCW)
drawshadowwalls()
glStencilOp(GL_keep, GL_keep, GL_decr)
glcullface(gl_front)
'glFrontFace(GL_CW)
drawshadowwalls()

glenable gl_depth_test
glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_keep, GL_keep, GL_incr)'_wrap_ext)'invert)'stencil fail,stencil ok,stencil+depth ok
'GL_NEVER, GL_LESS, GL_LEQUAL, GL_GREATER, GL_GEQUAL, GL_EQUAL, GL_NOTEQUAL, and GL_ALWAYS
glenable(gl_cull_face)
glcullface(gl_front)
'glFrontFace(GL_CW)
drawshadowwalls()
'glenable(gl_cull_face)
glcullface(gl_back)
'glFrontFace(GL_CCW)
glStencilOp(GL_keep, GL_keep, GL_decr)'_wrap_ext)'invert)'stencil fail,stencil ok,stencil+depth ok
drawshadowwalls()
'/
glColorMask(GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE)
glEnable(GL_STENCIL_TEST)
glStencilMask(255)
glDepthMask(GL_false)

/'subteststenciltop()
If teststenciltop=0 Then
 gldisable(gl_cull_face)
 glStencilFunc(GL_always, 0, 255)
 glStencilOp(GL_KEEP, GL_KEEP, GL_decr)'stencil fail,stencil ok,stencil+depth ok
 glpushmatrix
 glplacecursor(xmax/2,ymax/2,-40)
 glcarre(50)
 glpopmatrix	
EndIf '/

'glenable gl_lighting
'glFrontFace(GL_CCW)
gldisable(gl_cull_face)
'glcullface(gl_front)
glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_KEEP, GL_KEEP, GL_REPLACE)'stencil fail,stencil ok,stencil+depth ok
If auxtest>0.9 Then
	glColorMask(GL_true, GL_true, GL_true, GL_true)
EndIf
  	 gldisable gl_texture_2D
  	 gldisable gl_alpha_test
For i=1 To ishadow'0
  If shadowrank(i)=2 Then Continue For 
    glbegin gl_quads
    'glBegin GL_polygon
    glVertex3f shadowx1(i),shadowy1(i),shadowz1(i)
    glVertex3f shadowx2(i),shadowy2(i),shadowz2(i)
    glVertex3f shadowx3(i),shadowy3(i),shadowz3(i)
    glVertex3f shadowx4(i),shadowy4(i),shadowz4(i)
    glEnd
Next i
glcolor4f(0,0,0,1)    
glAlphaFunc(gl_less,50/254)
For i=1 To ishadow'0
  If shadowrank(i)<>2 Then Continue For 
  If shadowtexture(i)=0 Then
  	 gldisable gl_texture_2D
  	 gldisable gl_alpha_test
    glbegin gl_quads
    'glBegin GL_polygon
    glVertex3f shadowx1(i),shadowy1(i),shadowz1(i)
    glVertex3f shadowx2(i),shadowy2(i),shadowz2(i)
    glVertex3f shadowx3(i),shadowy3(i),shadowz3(i)
    glVertex3f shadowx4(i),shadowy4(i),shadowz4(i)
    glEnd 
  Else  
  	 glenable gl_texture_2D
  	 glenable gl_alpha_test
  	 glbindtexture(gl_texture_2D,shadowtexture(i))
    glbegin gl_quads
    'glBegin GL_polygon
	 gltexcoord2f(shadowtx1(i),shadowty1(i))
    glVertex3f shadowx1(i),shadowy1(i),shadowz1(i)
	 gltexcoord2f(shadowtx2(i),shadowty1(i))
    glVertex3f shadowx2(i),shadowy2(i),shadowz2(i)
	 gltexcoord2f(shadowtx2(i),shadowty2(i))
    glVertex3f shadowx3(i),shadowy3(i),shadowz3(i)
	 gltexcoord2f(shadowtx1(i),shadowty2(i))
    glVertex3f shadowx4(i),shadowy4(i),shadowz4(i)
    glEnd
  EndIf   
Next

/'glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_keep, GL_keep, GL_incr)
glenable(gl_cull_face)
'glcullface(gl_front)
glFrontFace(GL_CCW)
drawshadowtree()
'glcullface(gl_back)
glFrontFace(GL_CW)
glStencilOp(GL_keep, GL_keep, GL_decr)
'/
glenable gl_texture_2D
glenable gl_alpha_test
gldisable(gl_cull_face)
glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_KEEP, GL_KEEP, GL_REPLACE)'stencil fail,stencil ok,stencil+depth ok
'glColorMask(GL_true, GL_true, GL_true, GL_true)
If mz<mzsol0+2500 Then
  glAlphaFunc(gl_gequal,50/254)
  glbindtexture(gl_texture_2d,cloudtext)
  For i=1 To ncloud2
	  drawcloudshadow(i)
  Next
  glAlphaFunc(gl_less,50/254)
EndIf
drawshadowtree()
drawshadowtree2()
drawshadowlady()
drawshadowcar()
drawshadowpanel()
drawshadowroc()

gldisable gl_texture_2D
gldisable gl_alpha_test
'glbindtexture(gl_texture_2d,whitetext)
'glFrontFace(GL_CCW)
glColorMask(GL_true, GL_true, GL_true, GL_true)
glStencilFunc(GL_notequal, 0, 255)
glStencilOp(GL_KEEP, GL_KEEP, GL_keep)'stencil fail,stencil ok,stencil+depth ok
glEnable GL_BLEND
glBlendFunc GL_zero,GL_src_ALPHA
glpushmatrix
glcolor4f(0.6,0.6,0.6,0.6)
'glplacecursor(xmax/2,ymax/2,-40)
'glcarre(50)
gldisable gl_depth_test
glenable gl_texture_2D
tcolorshadow=1
drawterrain2()
tcolorshadow=0
glenable gl_depth_test
glpopmatrix
gldisable(GL_STENCIL_TEST)
'glStencilFunc(GL_GEQUAL, 1, &hFF)
'glStencilOp(GL_KEEP, GL_KEEP, GL_REPLACE)'stencil fail,stencil ok,stencil+depth ok
'GL_ZERO GL_INCR GL_DECR GL_INVERT
'glStencilMask(&hFF)
gldisable gl_cull_face
gldisable gl_blend
If tdark=1 Then
	glenable gl_lighting
Else 	
	gldisable gl_lighting
EndIf
gldisable gl_normalize
glenable gl_texture_2d
glenable gl_depth_test
glColorMask(GL_true, GL_true, GL_true, GL_true)
glDepthMask(GL_true)
glcolor4f(1,1,1,1)
glpopmatrix 
End Sub
/'Sub drawshadow_old()
Dim As Integer i,j,k 
tlight=0
talpha=0.35
If tshadow=0 Or (ishadow=0 And ishadowtree=0 And ishadowlady=0) Then Exit Sub
If heure>=21 Or heure<=5 Then
     tnightshadow=1
	  dxshadow=cos1*0.95
	  dyshadow=sin1*0.95
	  dzshadow=-0.3
	  dxyshadow=0.9
	  o1shadow=o1
Else 	
	  tnightshadow=0
	  dxshadow=dxshadow0
	  dyshadow=dyshadow0
	  dzshadow=dzshadow0
	  dxyshadow=dxyshadow0
	  o1shadow=o1shadow0
EndIf
'auxvar6=ishadow:If auxtest<=0.0001 Then auxtest=0.85
'If ishadow<>ishadow0 Then subcopyshadow()
glclear(GL_STENCIL_BUFFER_BIT)
'gltranslatef(shadowmx0-mx,shadowmy0-my,shadowmz0-mz)
gldisable gl_texture_2D
gldisable gl_normalize
gldisable gl_lighting
If auxtest<0.91 Then glColorMask(GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE)
glDepthMask(GL_FALSE)
glEnable(GL_STENCIL_TEST)
glStencilMask(255)
glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_keep, GL_keep, GL_incr)'invert)'stencil fail,stencil ok,stencil+depth ok
'GL_NEVER, GL_LESS, GL_LEQUAL, GL_GREATER, GL_GEQUAL, GL_EQUAL, GL_NOTEQUAL, and GL_ALWAYS
glenable(gl_cull_face)
glcullface(gl_front)
'glFrontFace(GL_CW)
For i=1 To ishadow'0
  If shadowrank(i)=1 Then Continue For 
  'glpushmatrix
  'Var dxyz=(shadownx(i)*cos1*cos2+shadowny(i)*sin1*cos2+shadownz(i)*sin2)
  'Var dxyz=shadowkdxyz(i)
  'If nishadow(i)=1 Or dxyz<0.3 Then
  '   glStencilOp(GL_keep, GL_keep, GL_zero)'stencil fail,stencil ok,stencil+depth ok
  'Else
  '   glStencilOp(GL_keep, GL_keep, GL_invert)'stencil fail,stencil ok,stencil+depth ok
  'EndIf
  glbegin gl_quads
  'glBegin GL_polygon
  glVertex3f shadowx1(i),shadowy1(i),shadowz1(i)
  glVertex3f shadowx2(i),shadowy2(i),shadowz2(i)
  glVertex3f shadowx3(i),shadowy3(i),shadowz3(i)
  glVertex3f shadowx4(i),shadowy4(i),shadowz4(i)
  glEnd
  'glpopmatrix
Next
'glenable(gl_cull_face)
glcullface(gl_back)
'glFrontFace(GL_CCW)
glStencilOp(GL_keep, GL_keep, GL_decr)'invert)'stencil fail,stencil ok,stencil+depth ok
For i=1 To ishadow'0
  If shadowrank(i)=1 Then Continue For 
  'glpushmatrix
  glbegin gl_quads
  'glBegin GL_polygon
  glVertex3f shadowx1(i),shadowy1(i),shadowz1(i)
  glVertex3f shadowx2(i),shadowy2(i),shadowz2(i)
  glVertex3f shadowx3(i),shadowy3(i),shadowz3(i)
  glVertex3f shadowx4(i),shadowy4(i),shadowz4(i)
  glEnd
  'glpopmatrix
Next
glEnable(GL_STENCIL_TEST)
glStencilMask(255)
glDepthMask(GL_false)
'glenable gl_lighting
'glFrontFace(GL_CCW)
gldisable(gl_cull_face)
'glcullface(gl_back)'front)
glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_KEEP, GL_KEEP, GL_REPLACE)'stencil fail,stencil ok,stencil+depth ok
'glColorMask(GL_true, GL_true, GL_true, GL_true)
For i=1 To ishadow'0
  If shadowrank(i)<>1 Then Continue For 
  'glpushmatrix
  glbegin gl_quads
  'glBegin GL_polygon
  glVertex3f shadowx1(i),shadowy1(i),shadowz1(i)
  glVertex3f shadowx2(i),shadowy2(i),shadowz2(i)
  glVertex3f shadowx3(i),shadowy3(i),shadowz3(i)
  glVertex3f shadowx4(i),shadowy4(i),shadowz4(i)
  glEnd
  'glpopmatrix
Next

/'glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_keep, GL_keep, GL_incr)
glenable(gl_cull_face)
'glcullface(gl_front)
glFrontFace(GL_CCW)
drawshadowtree()
'glcullface(gl_back)
glFrontFace(GL_CW)
glStencilOp(GL_keep, GL_keep, GL_decr)
'/
gldisable(gl_cull_face)
glStencilFunc(GL_always, 1, 255)
glStencilOp(GL_KEEP, GL_KEEP, GL_REPLACE)'stencil fail,stencil ok,stencil+depth ok
'glColorMask(GL_true, GL_true, GL_true, GL_true)
drawshadowtree()
drawshadowtree2()
drawshadowlady()

gldisable gl_texture_2D
'glFrontFace(GL_CCW)
glColorMask(GL_true, GL_true, GL_true, GL_true)
glStencilFunc(GL_notequal, 0, 255)
glStencilOp(GL_KEEP, GL_KEEP, GL_keep)'stencil fail,stencil ok,stencil+depth ok
/'For i=1 To ishadow'0
  glpushmatrix
  'Var dxyz=(shadownx(i)*cos1*cos2+shadowny(i)*sin1*cos2+shadownz(i)*sin2)
  'Var dxyz=shadowkdxyz(i)
  'Var kdxyz=(1+999*Abs(dxyz))/(1+999)
  If 0 Then'nishadow(i)=1 Or dxyz<0.3 Then
   'glBlendFunc GL_dst_color,gl_src_alpha
  	''glcolor4f(0,0,0,1)
   'glStencilOp(GL_keep, GL_keep, GL_keep)'stencil fail,stencil ok,stencil+depth ok
 	'gltranslatef(cos1,sin1,0)
  Else
   'glStencilOp(GL_keep, GL_keep, GL_keep)'stencil fail,stencil ok,stencil+depth ok
   'glBlendFunc GL_zero,GL_src_ALPHA
  	glcolor4f(0,0,0,0.7)
   glbegin gl_quads
   'glBegin GL_polygon
   glVertex3f shadowx1(i),shadowy1(i),shadowz1(i)
   glVertex3f shadowx2(i),shadowy2(i),shadowz2(i)
   glVertex3f shadowx3(i),shadowy3(i),shadowz3(i)
   glVertex3f shadowx4(i),shadowy4(i),shadowz4(i)
   glEnd
  EndIf
  glpopmatrix
Next '/
glEnable GL_BLEND
glBlendFunc GL_zero,GL_src_ALPHA
glpushmatrix
glcolor4f(0,0,0,0.6)
glplacecursor(xmax/2,ymax/2,-40)
glcarre(50)
glpopmatrix
gldisable(GL_STENCIL_TEST)
'glStencilFunc(GL_GEQUAL, 1, &hFF)
'glStencilOp(GL_KEEP, GL_KEEP, GL_REPLACE)'stencil fail,stencil ok,stencil+depth ok
'GL_ZERO GL_INCR GL_DECR GL_INVERT
'glStencilMask(&hFF)
gldisable gl_cull_face
gldisable gl_blend
If tdark=1 Then glenable gl_lighting
gldisable gl_normalize
glenable gl_texture_2d
glenable gl_depth_test
glColorMask(GL_true, GL_true, GL_true, GL_true)
glDepthMask(GL_true)
glcolor4f(1,1,1,1) 
End Sub
Sub drawbuildingnodetest(ij As Integer,i As Integer,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single x,y,z,z1,h,tx,ty,z0,xx,yy,xmin,ymin,xmax,ymax,xmid,ymid,tx0,x0,y0,hmin
Dim As Integer j,n
h=max(20,townwaynodeh(ij,i))
If h>4000 Then hmin=Int(h/4000):h=h-4000*hmin
h=setbuildh(h)
n=towniwaynode(ij,i)
If n<2 Then Exit Sub 
x=200:y=200
z=h+townwaynodez(ij,i):z1=z+20:z0=-800+z-h
tx=x/150:ty=(z-z0)/120
Var ktx=tx*0.5/x
 x=townwaynodex(ij,i,1)
 y=townwaynodey(ij,i,1)
 x0=x:y0=y
 tx=0:tx0=0
 xmin=x:ymin=y:xmax=x:ymax=y
 For j=2 To n
 	xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
 	xmin=min(x,xmin):ymin=min(y,ymin)
 	xmax=max(x,xmax):ymax=max(y,ymax)
 	tx0+=tx
 	tx=ktx*Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 	'gltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0
 Next
 xx=x:yy=y
 x=x0:y=y0
 tx0+=tx
 'tx=ktx*Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 'gltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0
 xmid=(xmin+xmax)/2
 ymid=(ymin+ymax)/2
 glcolor3f(1,1,1)
 glpushmatrix
 gltranslatef(xweb-dmx0,yweb-dmy0,mz)
 glsphere 100
 glpopmatrix
 Var lat0=lat,lng0=lng
 mxytolatlng(xweb-20000,yweb-20000)
 latlngtomxy(lat,lng,xmid,ymid)
 gltranslatef(xmid+20000-dmx0,ymid+170+20000-dmy0,mz)
 glsphere 70
 lat=lat0:lng=lng0
glcolor3f(1,1,1)
End Sub '/  
Dim Shared As String drawbuildname
Dim Shared As uint drawbuildtext
Dim Shared As Single drawbuildtx=1,drawbuildty=1,dr30000=15000
Dim Shared As Integer hlight3=2
Declare Sub drawbuildingnode40(ij As Integer,i As Integer,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Sub drawbuildingnode(ij As Integer,i As Integer,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single x,y,z,z1,h,tx,ty,z0,xx,yy,xmin,ymin,xmax,ymax,xmid,ymid,tx0,x0,y0,hmin
Dim As Integer j,n,k
'If taglcompile>1 Then Exit Sub
'If InStr(LCase(townwayname(ij,i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
If tlayer<-0.1 Then Exit Sub 
Var i40=0
If kmxlat>10 Then i40=towni40(ij,i)
'If Str(townwaynodeid(ij,i))="79152373" And i40>0 Then auxtest=0.8:auxvar2=i40+0.1
If i40>0 Then
  If townixy40(i40)>nwaynode then	
	 drawbuildingnode40(ij,i,dist,r,g,b)
	 Exit Sub
  EndIf  	 
EndIf
h=max(20.0,townwaynodeh(ij,i))
'If InStr(townwayname(ij,i),"Tour Total")>0 Then auxvar=h:auxtest=0.3
If h>4000 Then
	If thmin=1 Then
		hmin=Int(h/4000):h=h-4000*hmin
	Else
		hmin=0
		'Exit Sub 
	EndIf
EndIf
avgbuildh+=h:navgbuildh+=1
Var h0=setbuildh(h)
'If InStr(townwayname(ij,i)," Henri")>0 Then auxvar+=0:h0=3000:auxtest=0.8:auxtext=townwayname(ij,i)
h=h0'*scalexyh
hmin=setbuildh(hmin)
n=towniwaynode(ij,i)
If n<2 Then Exit Sub
If (Int(i+time2) Mod 10)=1 Then
 If testweb=0 And time2>max(ttonneau,timeinit)+20 Then
   Var x=townwaynodex(ij,i,1)
   Var y=townwaynodey(ij,i,1)
	If Abs(townwaynodez(ij,i)-getterrainheight(x,y))>15 Then
		ttonneau=Timer 
		testweb=1
	EndIf
 EndIf 
EndIf
i40=0
Var rr=r,gg=g,bb=b
If n>=nwaynode Then
	i40=towni40(ij,i)
	If i40=0 Then
		i40=getolditown40(townwaynodeid(ij,i))
		If i40=0 Then i40=-1
		towni40(ij,i)=i40
		If i40>0 Then
			town40ij(i40)=ij
			town40iji(i40)=i
		EndIf
	EndIf
   'If Str(townwaynodeid(ij,i))="79152373" Then auxtest=0.8:auxvar4=i40
EndIf
If i40>0 Then
	If auxtest>0.69 Then rr=1:gg=0.5:bb=0'h=2000:h0=h
EndIf
Var tterminal=0:If townwaynodebuild(ij,i)=11 Then tterminal=1
Var sizei=townwaynodesize(ij,i)
If sizei>3900*(100+h)/140 And tterminal=0 Then h0=45:h=42
x=200:y=200
Var t800=min(800.0,sizei*0.5)'0.35)
If hmin>10 Then t800=-hmin'*0.84
z=h+townwaynodez(ij,i):z1=z+20:z0=-t800+z-h
tx=drawbuildtx*x/150:ty=drawbuildty*(h0+t800)/120'(z-z0)/(120)
If h>240 Then ty/=scalexy
Var ktx=tx*0.5/x
glenable(gl_texture_2d)
testmygltexquad=0
Var tnight1=(tnight Or tdark)
hlight3=2
If heure>0 And heure<4.5 Then hlight3=3
If heure>1.5 And heure<3 Then hlight3=5
If drawbuildtext<>building3text Then tnight1=0
If (Int(h)Mod 6)<hlight3  Then tnight1=0
If tnight1=1 Then'And vie>0 Then
	gldisable gl_alpha_test
	gldisable gl_lighting
	glcolor3f(1,1,0.84)
   glbindtexture(gl_texture_2d,whitetext)
   'glpushmatrix
   'glscalef(0.9,0.9,0.99)
 x=townwaynodex(ij,i,1)-dmx0
 y=townwaynodey(ij,i,1)-dmy0
 x=mx+1.02*(x-mx)
 y=my+1.02*(y-my)
 x0=x:y0=y
 tx=0:tx0=0
 Var z1=z-10
 For j=2 To n
 	/'If i40>0 Then
 		If knode40(i40,j)=j Then
      	xx=x:yy=y
 	      x=gettownnodex40(i40,j)
 	      y=gettownnodey40(i40,j)
         x=mx+1.01*(x-mx)
         y=my+1.01*(y-my)
 	      mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0 ',1
 		EndIf
 	EndIf '/
 	xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
   x=mx+1.02*(x-mx)
   y=my+1.02*(y-my)
 	If Abs(xx-x)+Abs(yy-y)<dr30000 Then
 		mygltexquad xx,yy,z0, x,y,z0, x,y,z1, xx,yy,z1, tx,ty,tx0 ',1
 	EndIf
 Next
 xx=x:yy=y
 x=x0:y=y0
 tx0+=tx
 'tx=ktx*Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 If Abs(xx-x)+Abs(yy-y)<dr30000 Then
 	mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0 ',1
 EndIf
   glcolor3f(1,1,1)
   'glscalef(1,1,1)
   'glpopmatrix 
EndIf    
If tnight1=1 Then
   glenable gl_alpha_test
 	'glAlphaFunc(gl_greater,50/254)
 	glalphafunc(gl_less,50/254)
EndIf
 'glcolor3f(1,1,1)
 'glEnable GL_BLEND
 'glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 If (tnight=0 And tlight=1)Or tdark=1 Then
 	glenable(gl_lighting)
 	glenable(gl_normalize)
 	mytnormal=1
 Else
 	mytnormal=0
 EndIf
 If dist>-13400 And tnight1=1 Then 
 	  talpha=1
     glbindtexture(gl_texture_2d,building32text)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
 Else 
     'glbindtexture(gl_texture_2d,building3text)
     glbindtexture(gl_texture_2d,drawbuildtext)
 EndIf 
 If rr>-0.1 Then
 	glcolor4f(rr,gg,bb,talpha)
 Else
 	glcolor4f(1,1,1,talpha)
 EndIf
 Var ixy40=0
 x=townwaynodex(ij,i,1)-dmx0
 y=townwaynodey(ij,i,1)-dmy0
 If i40>0 Then
   ixy40+=1
   townx40(i40,ixy40)=x
   towny40(i40,ixy40)=y
 EndIf   
 'If InStr(townwayname(ij,i)," Henri")>0 Then
 '	If InStr(townwayname(ij,i),"Lycee")>0 Then auxvar+=1:auxvar2=x-mx:auxtest=0.8
 'EndIf
 x0=x:y0=y
 tx=0:tx0=0
 xmin=x:ymin=y:xmax=x:ymax=y
 'If drawbuildname<>"" Then
 Var text=Left(drawbuildname,40)
 Var text2=""
 Var text3=""
 Var testname=0
 'Var dh=min(60.0,5+(h)*0.05)
 Var dh=min(80.0,5+(h)*0.07)
 Var dl=Len(text)*dh*0.47
 Var len2=Len(text)*34/dh
 If dh>30 Then
 	If townnametype(ij,i)=1 Then
 		len2*=0.66
 	EndIf
 	Var instr1=InStr(text," ")
 	If instr1>len2 Then
 		text2=Trim(Mid(text,instr1+1))
 		text=Trim(Left(text,instr1-1))
 		dl=max(Len(text),Len(text2))*dh*0.47
 	Else 
 	   Var instr2=InStr(Mid(text,instr1+1)+" "," ")
 		text2=Trim(Mid(text,instr1+instr2))
 		text=Trim(Left(text,instr1+instr2-1))
 		dl=max(Len(text),Len(text2))*dh*0.47
 		Var instr3=InStr(text2," ")
 		If instr3>len2 Then
 			text3=Trim(Mid(text2,instr3+1))
 			text2=Trim(Left(text2,instr3-1))
 			dl=max(Len(text),Len(text2))
 			dl=max(dl,Len(text3))*dh*0.47
 		EndIf
 	EndIf    
 EndIf
 If dl>len2 And dl<len2*2 Then
 	dh*=len2/dl:dl=len2
 EndIf
 Var jname=2
 buildrottype=1
 If dl>1 Then
 	Var xn=townwaynodex(ij,i,n*0.9)
 	Var yn=townwaynodey(ij,i,n*0.9)
 	Var x2=townwaynodex(ij,i,n*0.30)
 	Var y2=townwaynodey(ij,i,n*0.30)
 	If (xn-x2)*(y2-y)-(yn-y2)*(x2-x)>0 Then
 		buildrottype=-1
 	EndIf
 EndIf
 Var dr=1.0
 'If Str(townwaynodeid(ij,i))="79152373" Then auxtest=0.8:auxvar5=i40
 For j=2 To n


 	If i40>0 Then
 		Var jj=j
 		If knode40(i40,jj)=jj Then
 	     	'If townwaynodeid(ij,i)=79152373 Then auxvar6=ixy40
      	'xx=x:yy=y
 	      Var xxx=gettownnodex40(i40,jj)
 	      Var yyy=gettownnodey40(i40,jj)
 	      'mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0 ',1
   If Abs(xxx)<0.1 Or Abs(yyy)<0.1 Then'Or Abs(xxx-x)+Abs(yyy-y)>10000 Then
     'knode40(i40,jj)=0
  	  ixy40=0:townixy40(i40)=1
  	  i40=0 
   ElseIf ixy40<n40-1 Then 
     'If Str(townwaynodeid(ij,i))="79152373" Then auxvar+=10:auxtest=0.8
     ixy40+=1
     townx40(i40,ixy40)=xxx
     towny40(i40,ixy40)=yyy
   EndIf     
   /'      
 	mynormalx=yy-y:mynormaly=x-xx:mynormalz=0.0
 	'If buildrottype=-1 Then mynormalx=-mynormalx:mynormaly=-mynormaly':glcolor3f(1,0,0)
   If mytnormal Then glnormal3f mynormalx,mynormaly,mynormalz
 	xmin=min(x,xmin):ymin=min(y,ymin)
 	xmax=max(x,xmax):ymax=max(y,ymax)
 	tx0+=tx
 	dr=Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 	tx=ktx*dr
	mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0', 1
/' 	If dl>1 And j>=jname Then
 		Var dr1=dr
 		Var xj=x,yj=y
 		If dr1<dl And buildrottype=1 Then 
 		 For k=j+1 To min2(n,j+Int(n*0.33))
 			If dr1>dl Then Exit For 
 	      Var xk=townwaynodex(ij,i,k)
 	      Var yk=townwaynodey(ij,i,k)
 			Var dxy=(xk-x)*(y-yy)-(yk-y)*(x-xx)
 			Var drk=Sqr((xk-xx)*(xk-xx)+(yk-yy)*(yk-yy))
 			If dxy<0 And dxy>-drk*dr*0.2 Then
 				dr1=drk
 				xj=xk:yj=yk
 				If dr1>dl Then Exit For 
 			Else
 				Exit For 
 			EndIf
 		 Next
 		EndIf  
 		If dr1<dl And buildrottype=-1 Then 
 		 For k=j+1 To min2(n,j+Int(n*0.33))
 			If dr1>dl Then Exit For 
 	      Var xk=townwaynodex(ij,i,k)
 	      Var yk=townwaynodey(ij,i,k)
 			Var dxy=(xk-x)*(y-yy)-(yk-y)*(x-xx)
 			Var drk=Sqr((xk-xx)*(xk-xx)+(yk-yy)*(yk-yy))
 			If dxy>0 And dxy<drk*dr*0.2 Then
 			   dr1=drk
 			   xj=xk:yj=yk
 			   If dr1>dl Then Exit For 
 			Else
 				Exit For 
 			EndIf
 		 Next
 		EndIf 
 		If dr1>dl Then 
 		   If drawbuildtext=shoptext Or sizei>1500 Then
 		      jname+=n*0.25
 		   Else    	
 		   	jname+=n*0.5
 		   EndIf
 			glpushmatrix
         If buildrottype=1 Then
            'gltranslatef(xx-(yj-y)*0.12*dl/dr1,yy+(xj-x)*0.12*dl/dr1,z-2-dh)
            gltranslatef(xx+(yj-y)*30/dr1,yy-(xj-x)*30/dr1,z-2-dh)
            Var do1=diro1((xj-xx),(yj-yy))
            glrotatef(do1-90,0,0,1)
         	gltranslatef(1.5,5,0)
         Else
            'gltranslatef(xx-(yj-y)*0.12*dl/dr1,yy+(xj-x)*0.12*dl/dr1,z-2-dh)
            gltranslatef(xx-(yj-y)*30/dr1,yy+(xj-x)*30/dr1,z-2-dh)
            Var do1=diro1((xj-xx),(yj-yy))
            glrotatef(do1-90,0,0,1)
         	gltranslatef(-1.5,5+dl,0)
         	glrotatef(180,0,0,1)
         EndIf
   	   glcolor3f(0,1,0)
         gldrawtext3D(text,dh)
         If text2<>"" Then
         	gltranslatef(0,0,-dh)
         	gldrawtext3D(text2,dh)
         EndIf
         If text3<>"" Then
         	gltranslatef(0,0,-dh)
         	gldrawtext3D(text3,dh)
         EndIf
         testname=1
         glpopmatrix 
         glbindtexture(gl_texture_2D,drawbuildtext)			 
         If r>-0.1 Then
 	         glcolor4f(r,g,b,talpha)
         Else
 	         glcolor4f(1,1,1,talpha)
         EndIf
 		EndIf    
 	EndIf 
 	'/
 	EndIf '/ 

 		EndIf
 	EndIf
 	

 	xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
   If i40>0 Then
     ixy40+=1
     townx40(i40,ixy40)=x
     towny40(i40,ixy40)=y
   EndIf   
 	mynormalx=yy-y:mynormaly=x-xx:mynormalz=0.0
 	'If buildrottype=-1 Then mynormalx=-mynormalx:mynormaly=-mynormaly':glcolor3f(1,0,0)
   If mytnormal Then glnormal3f mynormalx,mynormaly,mynormalz
 	xmin=min(x,xmin):ymin=min(y,ymin)
 	xmax=max(x,xmax):ymax=max(y,ymax)
 	tx0+=tx
 	dr=Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 	tx=ktx*dr
	If dr<dr30000 Then mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0', 1
 	If dl>1 And j>=jname Then
 		Var dr1=dr
 		Var xj=x,yj=y
 		If dr1<dl And buildrottype=1 Then 
 		 For k=j+1 To min2(n,j+Int(n*0.33))
 			If dr1>dl Then Exit For 
 	      Var xk=townwaynodex(ij,i,k)
 	      Var yk=townwaynodey(ij,i,k)
 			Var dxy=(xk-x)*(y-yy)-(yk-y)*(x-xx)
 			Var drk=Sqr((xk-xx)*(xk-xx)+(yk-yy)*(yk-yy))
 			If dxy<0 And dxy>-drk*dr*0.2 Then
 				dr1=drk
 				xj=xk:yj=yk
 				If dr1>dl Then Exit For 
 			Else
 				Exit For 
 			EndIf
 		 Next
 		EndIf  
 		If dr1<dl And buildrottype=-1 Then 
 		 For k=j+1 To min2(n,j+Int(n*0.33))
 			If dr1>dl Then Exit For 
 	      Var xk=townwaynodex(ij,i,k)
 	      Var yk=townwaynodey(ij,i,k)
 			Var dxy=(xk-x)*(y-yy)-(yk-y)*(x-xx)
 			Var drk=Sqr((xk-xx)*(xk-xx)+(yk-yy)*(yk-yy))
 			If dxy>0 And dxy<drk*dr*0.2 Then
 			   dr1=drk
 			   xj=xk:yj=yk
 			   If dr1>dl Then Exit For 
 			Else
 				Exit For 
 			EndIf
 		 Next
 		EndIf 
 		If dr1>dl Then 
 		   If drawbuildtext=shoptext Or sizei>1500 Then
 		      jname+=n*0.25
 		   Else    	
 		   	jname+=n*0.5
 		   EndIf
 			glpushmatrix
         If buildrottype=1 Then
            'gltranslatef(xx-(yj-y)*0.12*dl/dr1,yy+(xj-x)*0.12*dl/dr1,z-2-dh)
            gltranslatef(xx+(yj-y)*30/dr1,yy-(xj-x)*30/dr1,z-2-dh)
            Var do1=diro1((xj-xx),(yj-yy))
            glrotatef(do1-90,0,0,1)
         	gltranslatef(1.5,5,0)
         Else
            'gltranslatef(xx-(yj-y)*0.12*dl/dr1,yy+(xj-x)*0.12*dl/dr1,z-2-dh)
            gltranslatef(xx-(yj-y)*30/dr1,yy+(xj-x)*30/dr1,z-2-dh)
            Var do1=diro1((xj-xx),(yj-yy))
            glrotatef(do1-90,0,0,1)
         	gltranslatef(-1.5,5+dl,0)
         	glrotatef(180,0,0,1)
         EndIf
   	   glcolor3f(0,1,0)
         gldrawtext3D(text,dh)
         If text2<>"" Then
         	gltranslatef(0,0,-dh)
         	gldrawtext3D(text2,dh)
         EndIf
         If text3<>"" Then
         	gltranslatef(0,0,-dh)
         	gldrawtext3D(text3,dh)
         EndIf
         testname=1
         glpopmatrix 
         glbindtexture(gl_texture_2D,drawbuildtext)			 
         If r>-0.1 Then
 	         glcolor4f(rr,gg,bb,talpha)
         Else
 	         glcolor4f(1,1,1,talpha)
         EndIf
 		EndIf    
 	EndIf

 	
 Next
 If testname=0 And drawbuildname<>"" Then
 	townnametype(ij,i)=1
 EndIf
 If Abs(x-x0)+Abs(y-y0)>0.00001 Then 
  xx=x:yy=y
  x=x0:y=y0
  If i40>0 Then
    ixy40+=1
    townx40(i40,ixy40)=x
    towny40(i40,ixy40)=y
  EndIf   
  tx0+=tx
  Var dr=Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
  tx=ktx*dr
  If dr<dr30000 Then mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0', 1
 EndIf 
 xmid=(xmin+xmax)/2
 ymid=(ymin+ymax)/2
 If i40>0 Then
 	townixy40(i40)=ixy40
 	If ixy40>nwaynode Then
 		townwaynodesize40(ij,i)=0
      'If Str(townwaynodeid(ij,i))="79152373" Then auxvar+=10000:auxtest=0.8':auxvar6=ixy40
 	EndIf
 EndIf
 Var dxy=max(xmax-xmin,ymax-ymin)
 If dxy<300 Then
 	'If h>dxy*1.75 Then townwaynodeh(ij,i)=dxy*1.75+4000*Int(hmin+0.5)
 	If h>dxy*7 Then townwaynodeh(ij,i)=dxy*7+4000*Int(hmin+0.5)
 EndIf
If testmygltexquad=1 And h0>46 Then  
 Var dz=max(0.0,z),troof=1
 If h<200*(1-dz/(700+dz)) And sizei<1500 Then'z<200 Then
 	'z1=z+24+(max(0,Abs(xmax-xmin)-200)+max(0,(ymax-ymin)-200))*0.051:glcolor4f(0.9,0.3,0.4,talpha)
 	z1=z+24+min(max(0,Abs(xmax-xmin)-200),max(0,abs(ymax-ymin)-200))*0.1:glcolor4f(0.9,0.3,0.4,talpha)
 Else
 	troof=0
   glcolor4f( 0.4,0.35,0.4,talpha)
 EndIf 
 gldisable GL_alpha_test
 gldisable(gl_texture_2d)
 If tdark=1 Then
   glenable(gl_lighting)
   glenable gl_normalize
 Else
   gldisable(gl_lighting)
   'gldisable gl_normalize
 EndIf   
 x=x0'townwaynodex(ij,i,1)
 y=y0'townwaynodey(ij,i,1)
'If troof=1 Or mz>z Then 
 If troof=1 Then  
   glbegin(gl_triangle_fan)
   glvertex3f(xmid,ymid,z1)
 Else
 	glbegin(gl_polygon)
 EndIf 	
 If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 	glvertex3f(x,y,z)
 EndIf
 For j=2 To n
 	'xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
 	'gltriangle xx,yy,z, xmid,ymid,z1, x,y,z
 	If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 		glvertex3f(x,y,z)
 	EndIf
 Next
 'xx=x:yy=y
 x=x0:y=y0
 'gltriangle xx,yy,z, xmid,ymid,z1, x,y,z
 If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 	glvertex3f(x,y,z)
 EndIf
 glend()
'EndIf  
If hmin>10 Then
 glcolor3f( 0.55,0.55,0.7)
 x=x0'townwaynodex(ij,i,1)
 y=y0'townwaynodey(ij,i,1)
 'glbegin(gl_triangle_fan)
 'glvertex3f(xmid,ymid,z0)
 glbegin(gl_polygon)
 If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 	glvertex3f(x,y,z0)
 EndIf
 For j=2 To n
 	'xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
 	'gltriangle xx,yy,z0, xmid,ymid,z0, x,y,z0
   If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
   	glvertex3f(x,y,z0)
   EndIf
 Next
 'xx=x:yy=y
 x=x0:y=y0
 'gltriangle xx,yy,z0, xmid,ymid,z0, x,y,z0
 If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 	glvertex3f(x,y,z0)
 EndIf
 glend()
EndIf
EndIf 'testmygltexquad
glcolor3f(1,1,1)
glenable(gl_texture_2d)
If tnight1=1 Then
	gldisable gl_alpha_test
EndIf
'gldisable gl_lighting
'gldisable(gl_normalize)
End Sub
Function getsizei40(ij As Integer,i As Integer)As Single
Dim As Integer j,k
Dim As Single dxmax=-599999,dymax=-599999,dxmin=599999,dymin=599999,dx,dy 
Var i40=0
If kmxlat>10 Then i40=towni40(ij,i)
If i40>0 Then
  If townixy40(i40)>nwaynode then	
     Var ixy40=townixy40(i40)
     For j=1 To ixy40	 
 	    dx=townx40(i40,j)
 	    dy=towny40(i40,j)
 	    dxmax=max(dxmax,dx)
 	    dymax=max(dymax,dy)
 	    dxmin=min(dxmin,dx)
 	    dymin=min(dymin,dy)
	  Next  
	  Return ((dxmax-dxmin)+(dymax-dymin))*0.7
  EndIf  	 
EndIf
Return 0
End Function
Sub drawbuildingnode40(ij As Integer,i As Integer,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single x,y,z,z1,h,tx,ty,z0,xx,yy,xmin,ymin,xmax,ymax,xmid,ymid,tx0,x0,y0,hmin
Dim As Integer j,n,k
'If taglcompile>1 Then Exit Sub 
h=max(20.0,townwaynodeh(ij,i))
'If InStr(townwayname(ij,i),"Tour Total")>0 Then auxvar=h:auxtest=0.3
If h>4000 Then
	If thmin=1 Then
		hmin=Int(h/4000):h=h-4000*hmin
	Else 
		hmin=0
		'Exit Sub 
	EndIf
EndIf
avgbuildh+=h:navgbuildh+=1
Var h0=setbuildh(h)
h=h0'*scalexyh
hmin=setbuildh(hmin)
n=towniwaynode(ij,i)
If n<2 Then Exit Sub
If (Int(i+time2) Mod 10)=1 Then
 If testweb=0 And time2>max(ttonneau,timeinit)+20 Then
   Var x=townwaynodex(ij,i,1)
   Var y=townwaynodey(ij,i,1)
	If Abs(townwaynodez(ij,i)-getterrainheight(x,y))>15 Then
		ttonneau=Timer 
		testweb=1
	EndIf
 EndIf 
EndIf
Var i40=0,rr=r,gg=g,bb=b
If n>=nwaynode Then
	i40=towni40(ij,i)
	If i40=0 Then
		i40=getolditown40(townwaynodeid(ij,i))
		If i40=0 Then i40=-1
		towni40(ij,i)=i40
		If i40>0 Then
			town40ij(i40)=ij
			town40iji(i40)=i
		EndIf
	EndIf
EndIf
If i40>0 Then
	If auxtest>0.59 Then rr=1:gg=0:bb=0'h=2000:h0=h
Else
	Exit Sub 
EndIf
Var ixy=townixy40(i40)
If ixy<2 Then Exit Sub 
n=ixy
Var tterminal=0:If townwaynodebuild(ij,i)=11 Then tterminal=1
Var sizei=townwaynodesize(ij,i)
If sizei>3900*(100+h)/140 And tterminal=0 Then h0=45:h=42
x=200:y=200
Var t800=min(800.0,sizei*0.5)'0.35)
If hmin>10 Then t800=-hmin'*0.84
z=h+townwaynodez(ij,i):z1=z+20:z0=-t800+z-h
tx=drawbuildtx*x/150:ty=drawbuildty*(h0+t800)/120'(z-z0)/(120)
If h>240 Then ty/=scalexy
Var ktx=tx*0.5/x
glenable(gl_texture_2d)
testmygltexquad=0
Var tnight1=(tnight or tdark)
If drawbuildtext<>building3text Then tnight1=0
If (Int(h)Mod 6)<hlight3  Then tnight1=0
If tnight1=1 Then'And vie>0 Then
	gldisable gl_alpha_test
	gldisable gl_lighting
	glcolor3f(1,1,0.84)
   glbindtexture(gl_texture_2d,whitetext)
   'glpushmatrix
   'glscalef(0.9,0.9,0.99)
 x=townx40(i40,1)-dmx0
 y=towny40(i40,1)-dmy0
 x=mx+1.02*(x-mx)
 y=my+1.02*(y-my)
 x0=x:y0=y
 tx=0:tx0=0
 Var z1=z-10
 For j=2 To n
 	xx=x:yy=y
 	x=townx40(i40,j)-dmx0
 	y=towny40(i40,j)-dmy0
   x=mx+1.02*(x-mx)
   y=my+1.02*(y-my)
 	If Abs(xx-x)+Abs(yy-y)<dr30000 Then
 		mygltexquad xx,yy,z0, x,y,z0, x,y,z1, xx,yy,z1, tx,ty,tx0 ',1
 	EndIf
 Next
 xx=x:yy=y
 x=x0:y=y0
 tx0+=tx
 'tx=ktx*Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 If Abs(xx-x)+Abs(yy-y)<dr30000 Then
 	mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0 ',1
 EndIf
   glcolor3f(1,1,1)
   'glscalef(1,1,1)
   'glpopmatrix 
EndIf    
If tnight1=1 Then
   glenable gl_alpha_test
 	'glAlphaFunc(gl_greater,50/254)
 	glalphafunc(gl_less,50/254)
EndIf
 'glcolor3f(1,1,1)
 'glEnable GL_BLEND
 'glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 If (tnight=0 And tlight=1)Or tdark=1 Then
 	glenable(gl_lighting)
 	glenable(gl_normalize)
 	mytnormal=1
 Else
 	mytnormal=0
 EndIf
 If dist>-13400 And tnight1=1 Then 
     glbindtexture(gl_texture_2d,building32text)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
 Else 
     'glbindtexture(gl_texture_2d,building3text)
     glbindtexture(gl_texture_2d,drawbuildtext)
 EndIf 
 If rr>-0.1 Then
 	glcolor4f(rr,gg,bb,talpha)
 Else
 	glcolor4f(1,1,1,talpha)
 EndIf
 x=townx40(i40,1)-dmx0
 y=towny40(i40,1)-dmy0
 x0=x:y0=y
 tx=0:tx0=0
 xmin=x:ymin=y:xmax=x:ymax=y
 'If drawbuildname<>"" Then
 Var text=Left(drawbuildname,40)
 Var text2=""
 Var text3=""
 Var testname=0
 'Var dh=min(60.0,5+(h)*0.05)
 Var dh=min(80.0,5+(h)*0.07)
 Var dl=Len(text)*dh*0.47
 Var len2=Len(text)*34/dh
 If dh>30 Then
 	If townnametype(ij,i)=1 Then
 		len2*=0.66
 	EndIf
 	Var instr1=InStr(text," ")
 	If instr1>len2 Then
 		text2=Trim(Mid(text,instr1+1))
 		text=Trim(Left(text,instr1-1))
 		dl=max(Len(text),Len(text2))*dh*0.47
 	Else 
 	   Var instr2=InStr(Mid(text,instr1+1)+" "," ")
 		text2=Trim(Mid(text,instr1+instr2))
 		text=Trim(Left(text,instr1+instr2-1))
 		dl=max(Len(text),Len(text2))*dh*0.47
 		Var instr3=InStr(text2," ")
 		If instr3>len2 Then
 			text3=Trim(Mid(text2,instr3+1))
 			text2=Trim(Left(text2,instr3-1))
 			dl=max(Len(text),Len(text2))
 			dl=max(dl,Len(text3))*dh*0.47
 		EndIf
 	EndIf    
 EndIf
 If dl>len2 And dl<len2*2 Then
 	dh*=len2/dl:dl=len2
 EndIf
 Var jname=2
 buildrottype=1
 If dl>1 Then
 	Var xn=townx40(i40,n*0.9)
 	Var yn=towny40(i40,n*0.9)
 	Var x2=townx40(i40,n*0.30)
 	Var y2=towny40(i40,n*0.30)
 	If (xn-x2)*(y2-y)-(yn-y2)*(x2-x)>0 Then
 		buildrottype=-1
 	EndIf
 EndIf
 Var dr=1.0
 For j=2 To n


 	xx=x:yy=y
 	x=townx40(i40,j)
 	y=towny40(i40,j)
 	mynormalx=yy-y:mynormaly=x-xx:mynormalz=0.0
 	'If buildrottype=-1 Then mynormalx=-mynormalx:mynormaly=-mynormaly':glcolor3f(1,0,0)
   If mytnormal Then glnormal3f mynormalx,mynormaly,mynormalz
 	xmin=min(x,xmin):ymin=min(y,ymin)
 	xmax=max(x,xmax):ymax=max(y,ymax)
 	tx0+=tx
 	dr=Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 	tx=ktx*dr
	If dr<dr30000 Then mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0', 1
 	If dl>1 And j>=jname Then
 		Var dr1=dr
 		Var xj=x,yj=y
 		If dr1<dl And buildrottype=1 Then 
 		 For k=j+1 To min2(n,j+Int(n*0.33))
 			If dr1>dl Then Exit For 
 	      Var xk=townx40(i40,k)
 	      Var yk=towny40(i40,k)
 			Var dxy=(xk-x)*(y-yy)-(yk-y)*(x-xx)
 			Var drk=Sqr((xk-xx)*(xk-xx)+(yk-yy)*(yk-yy))
 			If dxy<0 And dxy>-drk*dr*0.2 Then
 				dr1=drk
 				xj=xk:yj=yk
 				If dr1>dl Then Exit For 
 			Else
 				Exit For 
 			EndIf
 		 Next
 		EndIf  
 		If dr1<dl And buildrottype=-1 Then 
 		 For k=j+1 To min2(n,j+Int(n*0.33))
 			If dr1>dl Then Exit For 
 	      Var xk=townx40(i40,k)
 	      Var yk=towny40(i40,k)
 			Var dxy=(xk-x)*(y-yy)-(yk-y)*(x-xx)
 			Var drk=Sqr((xk-xx)*(xk-xx)+(yk-yy)*(yk-yy))
 			If dxy>0 And dxy<drk*dr*0.2 Then
 			   dr1=drk
 			   xj=xk:yj=yk
 			   If dr1>dl Then Exit For 
 			Else
 				Exit For 
 			EndIf
 		 Next
 		EndIf 
 		If dr1>dl Then 
 		   If drawbuildtext=shoptext Or sizei>1500 Then
 		      jname+=n*0.25
 		   Else    	
 		   	jname+=n*0.5
 		   EndIf
 			glpushmatrix
         If buildrottype=1 Then
            'gltranslatef(xx-(yj-y)*0.12*dl/dr1,yy+(xj-x)*0.12*dl/dr1,z-2-dh)
            gltranslatef(xx+(yj-y)*30/dr1,yy-(xj-x)*30/dr1,z-2-dh)
            Var do1=diro1((xj-xx),(yj-yy))
            glrotatef(do1-90,0,0,1)
         	gltranslatef(1.5,5,0)
         Else
            'gltranslatef(xx-(yj-y)*0.12*dl/dr1,yy+(xj-x)*0.12*dl/dr1,z-2-dh)
            gltranslatef(xx-(yj-y)*30/dr1,yy+(xj-x)*30/dr1,z-2-dh)
            Var do1=diro1((xj-xx),(yj-yy))
            glrotatef(do1-90,0,0,1)
         	gltranslatef(-1.5,5+dl,0)
         	glrotatef(180,0,0,1)
         EndIf
   	   glcolor3f(0,1,0)
         gldrawtext3D(text,dh)
         If text2<>"" Then
         	gltranslatef(0,0,-dh)
         	gldrawtext3D(text2,dh)
         EndIf
         If text3<>"" Then
         	gltranslatef(0,0,-dh)
         	gldrawtext3D(text3,dh)
         EndIf
         testname=1
         glpopmatrix 
         glbindtexture(gl_texture_2D,drawbuildtext)			 
         If r>-0.1 Then
 	         glcolor4f(rr,gg,bb,talpha)
         Else
 	         glcolor4f(1,1,1,talpha)
         EndIf
 		EndIf    
 	EndIf

 	
 Next
 If testname=0 And drawbuildname<>"" Then
 	townnametype(ij,i)=1
 EndIf
 If Abs(x-x0)+Abs(y-y0)>0.00001 Then 
  xx=x:yy=y
  x=x0:y=y0
  tx0+=tx
  Var dr=Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
  tx=ktx*dr
  If dr<dr30000 Then mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0', 1
 EndIf 
 xmid=(xmin+xmax)/2
 ymid=(ymin+ymax)/2
 Var dxy=max(xmax-xmin,ymax-ymin)
 If dxy<300 Then
 	'If h>dxy*1.75 Then townwaynodeh(ij,i)=dxy*1.75+4000*Int(hmin+0.5)
 	If h>dxy*7 Then townwaynodeh(ij,i)=dxy*7+4000*Int(hmin+0.5)
 EndIf
If testmygltexquad=1 And h0>46 Then  
 Var dz=max(0.0,z),troof=1
 If h<200*(1-dz/(700+dz)) And sizei<1500 Then'z<200 Then
 	'z1=z+24+(max(0,Abs(xmax-xmin)-200)+max(0,(ymax-ymin)-200))*0.051:glcolor4f(0.9,0.3,0.4,talpha)
 	z1=z+24+min(max(0,Abs(xmax-xmin)-200),max(0,abs(ymax-ymin)-200))*0.1
 	glcolor4f(1,0.2,0.23,talpha)
 Else
 	troof=0
   'glcolor4f( 0.4,0.35,0.4,talpha)
   glcolor4f( 0.4,0.45,0.4,talpha)
 EndIf 
 If auxtest>0.0051 Then glcolor4f(1,0,0,talpha)
 gldisable GL_alpha_test
 gldisable(gl_texture_2d)
 If tdark=1 Then
   glenable(gl_lighting)
   glenable gl_normalize
 Else
   gldisable(gl_lighting)
   'gldisable gl_normalize
 EndIf   
 x=x0'townwaynodex(ij,i,1)
 y=y0'townwaynodey(ij,i,1)
'If troof=1 Or mz>z Then  
 If troof=1 Then  
   glbegin(gl_triangle_fan)
   glvertex3f(xmid,ymid,z1)
 Else
 	glbegin(gl_polygon)
 EndIf 	
 If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 	glvertex3f(x,y,z)
 EndIf
 For j=2 To n
 	'xx=x:yy=y
 	x=townx40(i40,j)-dmx0
 	y=towny40(i40,j)-dmy0
 	'gltriangle xx,yy,z, xmid,ymid,z1, x,y,z
   If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
   	glvertex3f(x,y,z)
   EndIf
 Next
 'xx=x:yy=y
 x=x0:y=y0
 'gltriangle xx,yy,z, xmid,ymid,z1, x,y,z
 If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 	glvertex3f(x,y,z)
 EndIf
 glend()
'EndIf  
If hmin>10 Then
 glcolor3f( 0.55,0.55,0.7)
 x=x0'townwaynodex(ij,i,1)
 y=y0'townwaynodey(ij,i,1)
 'glbegin(gl_triangle_fan)
 'glvertex3f(xmid,ymid,z0)
 glbegin(gl_polygon)
 If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 	glvertex3f(x,y,z0)
 EndIf
 For j=2 To n
 	'xx=x:yy=y
 	x=townx40(i40,j)-dmx0
 	y=towny40(i40,j)-dmy0
 	'gltriangle xx,yy,z0, xmid,ymid,z0, x,y,z0
   If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
   	glvertex3f(x,y,z0)
   EndIf
 Next
 'xx=x:yy=y
 x=x0:y=y0
 'gltriangle xx,yy,z0, xmid,ymid,z0, x,y,z0
 If max(Abs(x-xmid),Abs(y-ymid))<dr30000 Then
 	glvertex3f(x,y,z0)
 EndIf
 glend()
EndIf
EndIf 'testmygltexquad
glcolor3f(1,1,1)
glenable(gl_texture_2d)
If tnight1=1 Then
	gldisable gl_alpha_test
EndIf
'gldisable gl_lighting
'gldisable(gl_normalize)
End Sub
Sub drawbuildingnodefast(ij As Integer,i As Integer,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single x,y,z,z1,h,tx,ty,z0,xx,yy,xmin,ymin,xmax,ymax,xmid,ymid,tx0,x0,y0,hmin
Dim As Integer j,n,jj
Dim As Single jx,di
If tlayer<-0.1 Then Exit Sub 
'If taglcompile>1 Then Exit Sub
h=max(20.0,townwaynodeh(ij,i))
If h>4000 Then
	If thmin=1 Then
		hmin=Int(h/4000):h=h-4000*hmin
	Else 
		hmin=0
		'Exit Sub 
	EndIf
EndIf
Var h0=setbuildh(h)
h=h0'*scalexyh
hmin=setbuildh(hmin)
n=towniwaynode(ij,i)
If n<=4 Then
	di=1.001
Else
	di=n/4.0+0.001
EndIf
If n<2 Then Exit Sub 
If (Int(i+time2) Mod 10)=1 Then
 If testweb=0 And time2>max(ttonneau,timeinit)+20 Then
   Var x=townwaynodex(ij,i,1)
   Var y=townwaynodey(ij,i,1)
	If Abs(townwaynodez(ij,i)-getterrainheight(x,y))>15 Then
		ttonneau=Timer 
		testweb=1
	EndIf
 EndIf 
EndIf
Var tterminal=0:If townwaynodebuild(ij,i)=11 Then tterminal=1
Var sizei=townwaynodesize(ij,i)
If sizei>3900*(100+h)/140 And tterminal=0 Then h0=45:h=42
x=200:y=200
Var t800=min(800.0,sizei*0.5)'0.35)
If hmin>10 Then t800=-hmin'*0.84
z=h+townwaynodez(ij,i):z1=z+20:z0=-t800+z-h
tx=drawbuildtx*x/150:ty=drawbuildty*(h0+t800)/120'(z-z0)/(120)
If h>240 Then ty/=scalexy
Var ktx=tx*0.5/x
glenable(gl_texture_2d)
testmygltexquad=0
Var tnight1=(tnight Or tdark)
If drawbuildtext<>building3text Then tnight1=0
If (Int(h)Mod 6)<hlight3  Then tnight1=0
If tnight1=1 Then'And vie>0 Then
	gldisable gl_alpha_test
	gldisable gl_lighting
	glcolor3f(1,1,0.84)
   glbindtexture(gl_texture_2d,whitetext)
   'glscalef(0.9,0.9,0.99)
 x=townwaynodex(ij,i,1)-dmx0
 y=townwaynodey(ij,i,1)-dmy0
 x=mx+1.005*(x-mx)
 y=my+1.005*(y-my)
 x0=x:y0=y
 tx=0:tx0=0
 jx=1.001
 Var z1=z-10
 For jj=2 To n
 	jx+=di
 	j=Int(jx)
 	If j>n+0.99 Then Exit For 
 	xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
   x=mx+1.005*(x-mx)
   y=my+1.005*(y-my)
 	If Abs(xx-x)+Abs(yy-y)<dr30000 Then
 		mygltexquad xx,yy,z0, x,y,z0, x,y,z1, xx,yy,z1, tx,ty,tx0', 1
 	EndIf
 Next
 xx=x:yy=y
 x=x0:y=y0
 tx0+=tx
 'tx=ktx*Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 If Abs(xx-x)+Abs(yy-y)<dr30000 Then
 	mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0', 1
 EndIf
   glcolor3f(1,1,1)
   'glscalef(1,1,1) 
EndIf    
If tnight1=1 Then
   glenable gl_alpha_test
 	'glAlphaFunc(gl_greater,50/254)
 	glalphafunc(gl_less,50/254)
EndIf
 'glcolor3f(1,1,1)
 'glEnable GL_BLEND
 'glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 If (tnight=0 And tlight=1)Or tdark=1 Then'And fpsmoy>11 Then
 	glenable(gl_lighting)
 	glenable(gl_normalize)
 	mytnormal=1
 Else 
 	mytnormal=0
 EndIf
 If dist>-13400 And tnight1=1 Then 
     glbindtexture(gl_texture_2d,building32text)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
 Else 
     'glbindtexture(gl_texture_2d,building3text)
     glbindtexture(gl_texture_2d,drawbuildtext)
 EndIf 
 If r>-0.1 Then
 	glcolor4f(r,g,b,talpha)
 Else
 	glcolor4f(1,1,1,talpha)
 EndIf
 x=townwaynodex(ij,i,1)-dmx0
 y=townwaynodey(ij,i,1)-dmy0
 x0=x:y0=y
 tx=0:tx0=0
 xmin=x:ymin=y:xmax=x:ymax=y
 jx=1.001
 Var text=Left(drawbuildname,40)
 Var text2=""
 Var text3=""
 'Var dh=min(60.0,5+(h)*0.05)
 Var dh=min(80.0,5+(h)*0.07)
 Var dl=Len(text)*dh*0.47
 Var len2=Len(text)*34/dh
 If dh>30 Then
 	If townnametype(ij,i)=1 Then
 		len2*=0.66
 	EndIf
 	Var instr1=InStr(text," ")
 	If instr1>len2 Then
 		text2=Trim(Mid(text,instr1+1))
 		text=Trim(Left(text,instr1-1))
 		dl=max(Len(text),Len(text2))*dh*0.47
 	Else 
 	   Var instr2=InStr(Mid(text,instr1+1)+" "," ")
 		text2=Trim(Mid(text,instr1+instr2))
 		text=Trim(Left(text,instr1+instr2-1))
 		dl=max(Len(text),Len(text2))*dh*0.47
 		Var instr3=InStr(text2," ")
 		If instr3>len2 Then
 			text3=Trim(Mid(text2,instr3+1))
 			text2=Trim(Left(text2,instr3-1))
 			dl=max(Len(text),Len(text2))
 			dl=max(dl,Len(text3))*dh*0.47
 		EndIf
 	EndIf    
 EndIf
 If dl>len2 And dl<len2*2 Then
 	dh*=len2/dl:dl=len2
 EndIf
 Var jname=2
 buildrottype=1
 If dl>1 Then
 	Var xn=townwaynodex(ij,i,n*0.90)
 	Var yn=townwaynodey(ij,i,n*0.90)
 	Var x2=townwaynodex(ij,i,n*0.30)
 	Var y2=townwaynodey(ij,i,n*0.30)
 	If (xn-x2)*(y2-y)-(yn-y2)*(x2-x)>0 Then
 		buildrottype=-1
 	EndIf
 EndIf
 For jj=2 To n
 	jx+=di
 	j=Int(jx)
 	If j>n+0.99 Then Exit For 
 	xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
 	mynormalx=yy-y:mynormaly=x-xx:mynormalz=0.0
 	'If buildrottype=-1 Then mynormalx=-mynormalx:mynormaly=-mynormaly:glcolor3f(1,0,0)
   If mytnormal Then glnormal3f mynormalx,mynormaly,mynormalz
 	xmin=min(x,xmin):ymin=min(y,ymin)
 	xmax=max(x,xmax):ymax=max(y,ymax)
 	tx0+=tx
 	Var dr=Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
 	tx=ktx*dr
 	If dr<dr30000 Then mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0', 1
 	If dl>1 And dr>dl And jj>=jname Then
	   	jname+=n*0.5/di
 			glpushmatrix
         gltranslatef(xx,yy,z-2-dh)
         Var do1=diro1(x-xx,y-yy)
         glrotatef(do1-90,0,0,1)
         If buildrottype=1 Then
         	gltranslatef(1.5,5,0)
         Else
         	gltranslatef(-1.5,5+dl,0)
         	glrotatef(180,0,0,1)
         EndIf
   	   glcolor3f(0,1,0)
         gldrawtext3D(text,dh)
         If text2<>"" Then
         	gltranslatef(0,0,-dh)
         	gldrawtext3D(text2,dh)
         EndIf
         If text3<>"" Then
         	gltranslatef(0,0,-dh)
         	gldrawtext3D(text3,dh)
         EndIf
         glpopmatrix 
         glbindtexture(gl_texture_2D,drawbuildtext)			 
         If r>-0.1 Then
 	         glcolor4f(r,g,b,talpha)
         Else
 	         glcolor4f(1,1,1,talpha)
         EndIf 
 	EndIf
 Next
 If Abs(x-x0)+Abs(y-y0)>0.00001 Then 
  xx=x:yy=y
  x=x0:y=y0
  tx0+=tx
  Var dr=Sqr((x-xx)*(x-xx)+(y-yy)*(y-yy))
  tx=ktx*dr
  If dr<dr30000 Then mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0', 1
 EndIf 
 xmid=(xmin+xmax)/2
 ymid=(ymin+ymax)/2
 Var dxy=max(xmax-xmin,ymax-ymin)
 If dxy<300 Then
 	'If h>dxy*1.75 Then townwaynodeh(ij,i)=dxy*1.75+4000*Int(hmin+0.5)
 	If h>dxy*7 Then townwaynodeh(ij,i)=dxy*7+4000*Int(hmin+0.5)
 EndIf
If testmygltexquad=1 And h0>46 Then  
 Var dz=max(0.0,z),troof=1
 If h<200*(1-dz/(700+dz)) And sizei<1500 Then'z<200 Then
 'If z<200 Then
 	'z1=z+24+(max(0,Abs(xmax-xmin)-200)+max(0,(ymax-ymin)-200))*0.051:glcolor4f(0.9,0.3,0.4,talpha)
 	z1=z+24+min(max(0,Abs(xmax-xmin)-200),max(0,abs(ymax-ymin)-200))*0.1:glcolor4f(0.9,0.3,0.4,talpha)
 Else
 	troof=0
   glcolor4f( 0.4,0.35,0.4,talpha)
 EndIf 
 gldisable GL_alpha_test
 gldisable(gl_texture_2d)
 If tdark=1 Then
   glenable(gl_lighting)
   glenable gl_normalize
 Else
   gldisable(gl_lighting)
   'gldisable gl_normalize
 End If   
 x=x0'townwaynodex(ij,i,1)
 y=y0'townwaynodey(ij,i,1)
 jx=1.001 
'If troof=1 Or mz>z Then  
 If troof=1 Then  
   glbegin(gl_triangle_fan)
   glvertex3f(xmid,ymid,z1)
 Else
 	glbegin(gl_polygon)
 EndIf 	
 glvertex3f(x,y,z)
 For jj=2 To n
 	jx+=di
 	j=Int(jx)
 	If j>n+0.99 Then Exit For 
 	'xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
 	'gltriangle xx,yy,z, xmid,ymid,z1, x,y,z
 	glvertex3f(x,y,z)
 Next
 'xx=x:yy=y
 x=x0:y=y0
 'gltriangle xx,yy,z, xmid,ymid,z1, x,y,z
 glvertex3f(x,y,z)
 glend()
'EndIf 'mz 
EndIf 'testmygltexquad 
glcolor3f(1,1,1)
glenable(gl_texture_2d)
If tnight1=1 Then
	gldisable gl_alpha_test
EndIf
'gldisable gl_lighting
'gldisable(gl_normalize)
End Sub
Dim Shared As Single txroad
Declare Sub drawmxy(mxx As Single,myy As Single)
Dim Shared As Integer myibridge1
Sub testroadautopilot(xx As Single,yy As Single,zz As Single,x As Single,y As Single,z As Single,r As Single,tbridge As Integer=0)
 Var mx1=mx+cos1*v*7,my1=my+sin1*v*7
 Var mx2=mx+cos1*v*4,my2=my+sin1*v*4
 Var mx3=mx+cos1*v*14,my3=my+sin1*v*14
 Var toneway=0,tparking=0
 If r>2000 Then r-=2000:tparking=1
 If r>1000 Then r-=1000:toneway=1
 If typeautopilot=0 Or typeautopilot=1 Then toneway=0
 	Var dx=x-xx,dy=y-yy
   Var dr=max(0.1,Sqr(dx*dx+dy*dy))
   Var co1=r*dx/dr,si1=r*dy/dr
   Var dxy=(mx1-xx)*dy-(my1-yy)*dx
   If Abs(dxy)<dr*(r+d60road) Then
      Var dxx=(mx3-xx)*dx+(my3-yy)*dy
      Var r05=(r+d05road)*0.75,r005=r05
      If tbridge=1 Then r005=dr*0.21:r05=r005'*0.19
      If dxx>-r005*dr And dxx<(dr+r005)*(dr) Then mytestroad3=1
      dxx=(mx2-xx)*dx+(my2-yy)*dy
      If dxx>-r005*dr And dxx<(dr+r005)*(dr) Then
         If Abs(dxy)<dr*r*(1+tbridge*2) And dxx>-r05*dr And dxx<(dr+r05)*(dr) Then
            mytestroad2=1
            If tbridge=1 Then
            	Var dco1=(cos1*co1+sin1*si1)
            	If Abs(dco1)>r*0.7 Then
                  soundvoyage(1)
                  If Abs(dco1)>r*0.9 Then
                  	mytestbridge=1
                     'v=min(19.0,max(v,dr/400))
            		   Var dmx=mx-xx,dmy=my-yy
            		   Var dmxx=(dmx*co1+dmy*si1)/(r*dr)
           		   	Var dz=zz+(z-zz)*(dmxx)
            		   If dmxx<0 And dmxx>-0.21 Then
           		   	   Var dzz=min((zz-mzsol00)*0.8,dr*0.012)
            		   	dz=zz+(dmxx/0.21)*(dzz)
            		   ElseIf dmxx>1 And dmxx<1.21 Then
            		   	Var dzz=min((z-mzsol00)*0.8,dr*0.012)
            		   	dz=z-((dmxx-1)/0.21)*(dzz)
            		   EndIf
            		   mzbridge=dz+6.5
                  EndIf
            		'Var drx=max(0.1,Sqr(dmx*dmx+dmy*dmy))
            		If dxy>dr*r*0.265 then mx-=si1*0.4:my+=co1*0.4:o1+=1.5*Sgn(dco1)
            		If dxy<-dr*r*0.265 Then mx+=si1*0.4:my-=co1*0.4:o1-=1.5*Sgn(dco1)
            	   myibridge=myibridge1
            	EndIf
            EndIf
         EndIf
         Var kcos1=(cos1*co1+sin1*si1)
         If tbridge=1 Then  
          If Abs(kcos1)<r*0.607 Then
         	If Abs(mx-xx)>r005 Or Abs(my-yy)>r005 Then
         		If Abs(mx-x)>r005 Or Abs(my-y)>r005 Then
         			Exit Sub 
         		EndIf
         	EndIf
          EndIf 	
         EndIf
   		dxx=(kcos1)/(30+r)
   		Var kdxy=dxy/(dr*(r+d60road))
   		dxx*=(1+Abs(kdxy))/(0.5+Abs(kdxy))
   		If dxx>0 Then
   			dxx=max(0.0001,dxx-dxx*0.1*kdxy)
   		Else 
   			dxx=min(-0.0001,dxx-dxx*0.1*kdxy)
   			If toneway=1 And dxx<-0.0005 Then dxx*=0.2
   		EndIf
   		If tbridge=1 Then dxx*=6
   		If Abs(dxx)>Abs(dxautopilot) Then
   		  dxautopilot=dxx
   		  dyautopilot=dxy/(dr*(r+d60road))
   		  If tbridge=0 and tautopilot=2 Then 
   		   If cos1*(mx1-xx)+sin1*(my1-yy)<0 Then
   		    If cos1*(mx1-x)+sin1*(my1-y)<0 Then
   		    	 dyautopilot=Sgn(dyautopilot)
   		    EndIf              		  	
   		   EndIf 
   		  EndIf
   		  co1autopilot=co1
   		  si1autopilot=si1
   		EndIf
   	EndIf
   EndIf	
End Sub
Function gettestnearroad(x As Single,y As Single,dist As Single=0)As Integer
Dim As Integer i
Dim As Single dx,dy,r,dr,co1,si1,dxx
'If plane>0 And car=0 Then Return 0
For i=1 To inearroad0
	r=rnearroad0(i)
	If r<9.1 Then r=17'Continue For 'rail
	If r>2.5*30 Then r+=30'runway	
	r+=dist
	dr=drnearroad0(i)
	dx=x-xnearroad0(i)
	If Abs(dx)<(r+r+dr) Then
		dy=y-ynearroad0(i)
		If Abs(dy)<(r+r+dr) Then
			co1=co1nearroad0(i)
			si1=si1nearroad0(i)
			If Abs(dx*si1-dy*co1)<r*(r+30) Then
				dxx=dx*co1+dy*si1
				If dxx>-r*(r+r) And dxx<(r+r+dr)*r Then Return 1
			EndIf
		EndIf
	EndIf
Next
Return 0
End Function
Function gettestnear0road(x As Single,y As Single,layer As Integer=0,inear0 As Integer=0)As Integer
Dim As Integer i
Dim As Single dx,dy,r,dr,co1,si1,dxx
'If plane>0 And car=0 Then Return 0
Var d30=40.0'30.0':If layer<-0.9 Then d30=20
For i=1 To inear0road0
	r=rnear0road0(i)
	'If r<9.1 Or layernear0road0(i)>layer+0.1 Or (inear0>0 And Abs(i-inear0)<=3) Then Continue For 'rail
	If r<9.1 Then r=17
	If layernear0road0(i)>layer+0.1 Or (inear0>0 And Abs(i-inear0)<=3) Then Continue For 'rail
	If r>2.5*30 Then r+=30'runway	
	dr=drnear0road0(i)
	dx=x-xnear0road0(i)
	If Abs(dx)<(r+r+dr) Then
		dy=y-ynear0road0(i)
		If Abs(dy)<(r+r+dr) Then
			co1=co1near0road0(i)
			si1=si1near0road0(i)
			If Abs(dx*si1-dy*co1)<r*(r+d30) Then
				dxx=dx*co1+dy*si1
				'If dxx>-r*(r+r) And dxx<(r+r+dr)*r Then Return 1
				If dxx>-r*(r) And dxx<(r+dr)*r Then Return 1
			EndIf
		EndIf
	EndIf
Next
Return 0
End Function
'Dim Shared As Integer irandomnearroad(20),nrandomnearroad
Function getrandomnearroad(x As Single,y As Single,n0 As Integer,nco1 As Single,nsi1 As Single,ddr0 As Single=0,tback As Integer=0)As Integer
Dim As Integer i,j,n,idxxx
Dim As Single dx,dy,r,dr,co1,si1,dxx,dxxx
'If plane>0 And car=0 Then Return 0
Var ddr=0.0
n=0:zroad=-999999:dxxx=0:idxxx=0
If n0<0 Then
	ddr=500
ElseIf myncari=0 Then 
 If plane>0 And car=0 Then
 	ddr=320
 ElseIf n0>0 And n0<=inearroad Then
  If onewaynearroad(n0)=1 And typeautopilot=1 Then
   co1=co1nearroad(n0)
	si1=si1nearroad(n0)
   'If nco1*co1+nsi1*si1<0 Then
   If cos1*co1+sin1*si1<0 Then
   	If typeautopilot=1 Then'Or (Int(time2)Mod 15)<=2 Then
   		ddr=75.0
   	Else 
    		ddr=20.0'15.0
   	EndIf
   EndIf
  EndIf
 EndIf  
EndIf
If ddr0>0.001 And ddr<ddr0 Then ddr=ddr0
ddr+=distback
If tback=1 Then ddr=ddr0
Var tlayern=0.0
If myncari=0 Then tlayern=tlayer
For i=1 To inearroad
	Var ttunnel=0
	If myncari=0 Then 
	 If Abs(layernearroad(i)-tlayern)>0.7 Then
		ttunnel=1
		'If layernearroad(i)<-0.1 And tlayern>-0.4 Then Continue For
	 ElseIf Abs(tlayern)>0.4 Then
		ttunnel=2
	 EndIf
	EndIf 
	r=rnearroad(i)
	Var r0=r
	If r<9.1 Then Continue For 'rail
	r+=ddr	
	dr=drnearroad(i)+ddr
	dx=x-xnearroad(i)
	If Abs(dx)<(r+dr) Then
		dy=y-ynearroad(i)
		If Abs(dy)<(r+dr) Then
			co1=co1nearroad(i)/r
			si1=si1nearroad(i)/r
			If Abs(dx*si1-dy*co1)<(r+0.30) Then
				dxx=dx*co1+dy*si1
				If dxx>-(r) And dxx<(dr) Then
				  Var dcos1=nco1*co1+nsi1*si1
				  If dcos1>0 Then dcos1+=0.1 Else dcos1-=0.1
				  If myncari=0 Then dcos1+=(avgco1*co1+avgsi1*si1-dcos1)*0.3	
				  If n=0 Or (onewaynearroad(i)=0 Or typeautopilot=0) Or (dcos1)>0.1 Then  	
					irandomnearroad(n)=i
					n+=1:If n>=400 Then Exit For
					If i=n0 Then
						'If Rnd<0.5 Then Return n0
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For
					EndIf
					If ttunnel=1 Then dcos1*=0.01
					If ttunnel=2 Then dcos1*=100
					If myncari=0 Or tcarpolice=1 Then
                If dxxx<Abs(dcos1)*(5+r0) Then
               	dxxx=Abs(dcos1)*(5+r0)
               	idxxx=i
                EndIf
					 dcos1=avgco1*co1+avgsi1*si1
					 If ttunnel=1 Then dcos1*=0.01
					 If ttunnel=2 Then dcos1*=100
					 Var dsin1=sin1*avgco1-cos1*avgsi1
					 Var dsi1=sin1*co1-cos1*si1
					 if abs(dcos1)<0.92 and dsin1*dsi1>0.01 Then dcos1=0 
					 If Abs(dcos1)>0.5 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					 If Abs(dcos1)>0.71 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					 If Abs(dcos1)>0.83 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					 If Abs(dcos1)>0.90 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					 If Abs(dcos1)>0.95 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					EndIf  
				  EndIf 	
				EndIf
			EndIf
		EndIf
	EndIf
Next
If tback=1 And n=0 Then Return 0
nrandomnearroad=n
If typeautopilot=1 Then 
	If (n=0 or dxxx>0.97*30) And idxxx>0 Then Return idxxx
Else 
	If (n=0 or dxxx>0.985*30) And idxxx>0 Then Return idxxx
EndIf
If n=0 Then Return 0
'If Rnd<0.8 And idxxx>0 Then Return idxxx
For i=1 To 50
	Var nn=irandomnearroad(Int(n*Rnd))
	If Abs(layernearroad(nn)-tlayern)<0.4 Then Return nn
Next
Return irandomnearroad(Int(n*Rnd))
End Function
Function getrandomnearroad0(x As Single,y As Single,n0 As Integer,nco1 As Single,nsi1 As Single)As Integer
Dim As Integer i,j,n
Dim As Single dx,dy,r,dr,co1,si1,dxx
'If plane>0 And car=0 Then Return 0
Var ddr=0
If n0<0 Then ddr=500
n=0:zroad=-999999
For i=1 To inearroad
	r=rnearroad(i)
	If r<9.1 Then Continue For 'rail
	r+=ddr	
	dr=drnearroad(i)+ddr
	dx=x-xnearroad(i)
	If Abs(dx)<(r+dr) Then
		dy=y-ynearroad(i)
		If Abs(dy)<(r+dr) Then
			co1=co1nearroad(i)
			si1=si1nearroad(i)
			If Abs(dx*si1-dy*co1)<r*(r+0.30) Then
				dxx=dx*co1+dy*si1
				If dxx>-r*(r) And dxx<(dr)*r Then
				  Var dcos1=nco1*co1+nsi1*si1	
				  If onewaynearroad(i)=0 Or (dcos1)>0 Then  	
					irandomnearroad(n)=i
					n+=1:If n>=400 Then Exit For
					If i=n0 Then
						If Rnd<0.75 Then Return n0
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For
					EndIf
					'If Abs(dcos1)>0.8 Then
 					'   irandomnearroad(n)=i
					'   n+=1:If n>=400 Then Exit For
					'EndIf
					If myncari=0 Or tcarpolice=1 Then
					 dcos1=avgco1*co1+avgsi1*si1
					 If Abs(dcos1)>0.5 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					 If Abs(dcos1)>0.71 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					 If Abs(dcos1)>0.83 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					 If Abs(dcos1)>0.90 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					 If Abs(dcos1)>0.95 Then
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					   irandomnearroad(n)=i
					   n+=1:If n>=400 Then Exit For						
					 EndIf
					EndIf  
				  EndIf 	
				EndIf
			EndIf
		EndIf
	EndIf
Next
nrandomnearroad=n
If n=0 Then Return 0
Return irandomnearroad(Int(n*Rnd))
End Function
Sub copynearroad0()
Dim As Integer i,j
inearroad0=inearroad
For i=1 To inearroad0
	rnearroad0(i)=rnearroad(i)
	drnearroad0(i)=drnearroad(i)
	xnearroad0(i)=xnearroad(i)
	ynearroad0(i)=ynearroad(i)
	co1nearroad0(i)=co1nearroad(i)
	si1nearroad0(i)=si1nearroad(i)
	layernearroad0(i)=layernearroad(i)
Next
inear0road0=inear0road
inear0road20=inear0road2
For i=1 To inear0road0
	rnear0road0(i)=rnear0road(i)
	drnear0road0(i)=drnear0road(i)
	xnear0road0(i)=xnear0road(i)
	ynear0road0(i)=ynear0road(i)
	co1near0road0(i)=co1near0road(i)
	si1near0road0(i)=si1near0road(i)
	layernear0road0(i)=layernear0road(i)
Next
End Sub
Function getcrossnearroad(x As Single,y As Single,co11 As Single=99,si11 As Single=99)As Integer
Dim As Integer i,n
Dim As Single dx,dy,r,dr,co1,si1,dxx
'If plane>0 And car=0 Then Return 0
If max(Abs(x-mx-dmx0),Abs(y-my-dmy0))>distnearroad Then Return 0
n=0
Var trail=0,testrail=0
For i=1 To inearroad0
	r=rnearroad0(i)
	If r<9.1 Then
		trail=1:r=100
	Else
		trail=0
	EndIf
	dr=drnearroad0(i)
	dx=x-xnearroad0(i)
	If Abs(dx)<(r+r+dr) Then
		dy=y-ynearroad0(i)
		If Abs(dy)<(r+r+dr) Then
			co1=co1nearroad0(i)
			si1=si1nearroad0(i)
			If Abs(dx*si1-dy*co1)<r*(r+5) Then
				dxx=dx*co1+dy*si1
				If dxx>-r*(r) And dxx<(r+dr)*r Then
				   If co11<90 And trail=1 Then
					  Var xx=xnearroad0(i)+dr*co1/(r+r)
					  Var yy=ynearroad0(i)+dr*si1/(r+r)
					  If (xx-x)*co11+(yy-y)*si11<0.5*max(Abs(xx-x),Abs(yy-y)) Then
					  	  Continue For 
					  EndIf
					  If Abs(co1*si11-si1*co11)<0.12*r Then
					  	  continue for 
					  EndIf
				   EndIf
					n+=1
					If trail=1 Then testrail=1
					'If n>2 Then Return 1+trail
				EndIf
			EndIf
		EndIf
	EndIf
Next
If testrail=1 Then Return 2
If n>2 Then Return 1
Return 0
End Function
Function getcrossnear0road(x As Single,y As Single,co11 As Single=99,si11 As Single=99,r0 As Single=0)As Integer
Dim As Integer i,n,j
Dim As Single dx,dy,r,dr,co1,si1,dxx
'If plane>0 And car=0 Then Return 0
If max(Abs(x-mx-dmx0),Abs(y-my-dmy0))>distnearroad Then Return 0
n=0:j=0
Var trail=0,testrail=0
For i=1 To inear0road0
	r=rnear0road0(i)
	If r<9.1 Then
		trail=1:r=100
	Else
		trail=0
	EndIf
	r+=r0
	dr=drnear0road0(i)
	dx=x-xnear0road0(i)
	If Abs(dx)<(r+r+dr) Then
		dy=y-ynear0road0(i)
		If Abs(dy)<(r+r+dr) Then
			co1=co1near0road0(i)
			si1=si1near0road0(i)
			If Abs(dx*si1-dy*co1)<r*(r+5) Then
				dxx=dx*co1+dy*si1
				If dxx>-r*(r) And dxx<(r+dr)*r Then
				   If co11<90 And trail=1 Then
					  Var xx=xnear0road0(i)+dr*co1/(r+r)
					  Var yy=ynear0road0(i)+dr*si1/(r+r)
					  If (xx-x)*co11+(yy-y)*si11<0.5*max(Abs(xx-x),Abs(yy-y)) Then
					  	  Continue For 
					  EndIf
					  If Abs(co1*si11-si1*co11)<0.12*r Then
					  	  continue for 
					  EndIf
				   EndIf
					n+=1
					If trail=1 Then testrail=1
					'If n>2 Then Return 1+trail
				EndIf
			EndIf
		EndIf
	EndIf
Next
If testrail=1 Then Return 2
If n>2 Then Return 1
Return 0
End Function
'Const As Integer nreverse=100
'Dim Shared As Integer ireverse
'Dim Shared As Single latreverse,lngreverse,latreversei(nreverse),lngreversei(nreverse)
'Dim Shared As string namereversei(nreverse)
Declare Function getreversei(latx As Single,lngx As Single)As Integer
Dim Shared As String citykm1,citykm2,citykm3,citynamekm1,citynamekm2,citynamekm3 
Dim Shared As Integer testcross,testcross2
Dim Shared As Integer ttestcross(ntown,ntownnode),ttestcross2(ntown,ntownnode),ttaddbarriere(ntown,ntownnode)
Dim Shared As Integer ttaddoneway(ntown,ntownnode)
Declare Sub setcitykm1(latx As single,lngx As Single,co1 As Single,si1 As Single)
Sub resetttsetterrain()
Dim As Integer ij,i,j
For ij=1 To ntown2
	For i=1 To ntownnode
		ttsetterrain(ij,i)=0
	Next
Next
For i=-100 To 612
	For j=-100 To 612
		tsetterrain(i,j)=0
	Next
Next
End Sub
Dim Shared As Single distrunway4000
Sub drawroadnode(ij As Integer,i As Integer)
Dim As Single x,y,z,z1,h,tx,ty,z0,xx,yy,tx0,x0,y0,xx0,yy0,x1,y1,xx1,yy1,r,dr,dx,dy,co1,si1,ddx0,ddy0,ddx1,ddy1,hr
dim as single co10,si10,zz0,zz1
Dim As Integer j,n,jj,toneway=0,tparking=0,trail=0,trunway=0,taddspot=0,tmainway=0
'If taglcompile>1 Then 
'	Exit sub
'EndIf
Var i40=0,ixy40=0,t40=0,tcolor=0,rcolor=0.515,gcolor=rcolor,bcolor=rcolor
If kmxlat>10 Then i40=towni40(ij,i)
If i40>0 Then
  If townixy40(i40)>nwaynode then	
	 t40=1
	 tcolor=1
	 'drawbuildingnode40(ij,i,dist,r,g,b)
	 'Exit Sub
  EndIf  	 
EndIf
Dim As Integer layer=0
Var zlayer=0.0
tcolor=0
'If (i Mod 4)=0 Then tcolor=1
If auxtest>0.0071 And tcolor=1 Then rcolor=1:gcolor=0:bcolor=0
If townwaynoder(ij,i)>0.91 and towniwaynode(ij,i)>2 Then
	layer=1:If townwaynodeg(ij,i)<-0.5 Then layer=-1'$$
	If layer<-0.9 Then
		zlayer=-100
		If tlayer0>-0.4 Then zlayer=1
	EndIf
	If layer>0.9 Then zlayer=80
	tcolor=1:rcolor=0.3:gcolor=1:bcolor=0.4
EndIf
h=2'4'8
hr=-0.2
If t40=0 Then
 n=towniwaynode(ij,i)
 If n<2 Then Exit Sub 
 i40=0
 If n>=nwaynode Then
	i40=towni40(ij,i)
	If i40=0 Then
		i40=getolditown40(townwaynodeid(ij,i))
		If i40=0 Then i40=-1
		towni40(ij,i)=i40
		If i40>0 Then
			town40ij(i40)=ij
			town40iji(i40)=i
		EndIf
	EndIf
 EndIf
Else
 n=townixy40(i40)
 If n<2 Then Exit Sub 
EndIf
r=max(5.0,townwaynodeh(ij,i))
If r>2000 Then r-=2000:tparking=1
If r>1000 Then r-=1000:toneway=1
If r<0.3*30 Then trail=1
If r>4*30 then trunway=1
If r>2.5*30 And trunway=0 Then tmainway=1 
If r<29 And layer>0 Then layer=0:zlayer=0:rcolor=0.5:gcolor=0.6:bcolor=1'tcolor=0
If tdark=1 Then
   glenable(gl_lighting)
   glenable gl_normalize
   If trunway=1 Then taddspot=1
Else
   gldisable(gl_lighting)
   'gldisable gl_normalize
End If   
h-=max(0.0,(2.8*30-r)*0.005)
Var ttsetterrainij=ttsetterrain(ij,i)
ttsetterrain(ij,i)=1 
Var taddtree=0,taddlamp=0,taddbarriere=0,taddhaie=0,taddnathalie=0,taddcity=0,cityname1="",cityname2=""
Var taddcitykm=0,taddcross=0,taddcross2=0,taddoneway=0,taddrail=0,taddrail2=0,taddoneway2=0
If t40=0 Then 
 xx=townwaynodex(ij,i,1)
 yy=townwaynodey(ij,i,1)
 x=townwaynodex(ij,i,n)
 y=townwaynodey(ij,i,n)
 If i40>0 Then
   ixy40+=1
   townx40(i40,ixy40)=xx
   towny40(i40,ixy40)=yy
 EndIf
Else
 xx=townx40(i40,1)
 yy=towny40(i40,1)
 x=townx40(i40,n)
 y=towny40(i40,n)
EndIf  
Var id=townwaynodeid(ij,i)
dx=x-xx:dy=y-yy
dr=max(0.0001,Sqr(dx*dx+dy*dy))
Var d7000=dr*0.5+7000
Var distxy7000=max(Abs((xx+x)*0.5-dmx0-mx),Abs((yy+y)*0.5-dmy0-my))
If distxy7000<d7000 Then 
If ttsetterrainij=0 And distxy7000<dr*0.5+2000 Then subsettupdate() 
If r>1.15*30 And r<2.5*30 Then taddtree=1
If r>2.5*30 And r<3*30 Then taddlamp=1
If r>1.15*0.7*30 And r<2.95*30 And n>=3 Then taddnathalie=1  
co1=dx/dr:si1=dy/dr
If r>0.6*30 And r<2.5*30 Then
 If r<2.0*30 Or (id And 1) Then
  If tdttestcross=1 then	
   If gettestroadtree((xx+x)*0.5+si1*200,(yy+y)*0.5-co1*200)=4 Then'cowland
   	taddtree=0:taddbarriere=1
   ElseIf gettestroadtree(xx*0.25+x*0.75+si1*200,yy*0.25+y*0.75-co1*200)=4 Then'cowland
   	taddtree=0:taddbarriere=1
   ElseIf gettestroadtree(xx*0.75+x*0.25+si1*200,yy*0.75+y*0.25-co1*200)=4 Then'cowland
   	taddtree=0:taddbarriere=1
   EndIf
   ttaddbarriere(ij,i)=taddbarriere
  Else
  	taddbarriere=ttaddbarriere(ij,i)
  	If taddbarriere=1 Then taddtree=0
  EndIf 	
   If (Int(id*0.1)And 1) And r>1.15*30 Then taddtree=1
   If taddbarriere=0 And r>0.9*30 And r<2.1*30 Then
   	If (Int(id*0.01)mod 3)>0 And dr<3000 Then taddbarriere=0:taddhaie=1 
   EndIf
   If dr<900 Then taddbarriere=0:taddhaie=0
   If dr<300 Then taddnathalie=0
 EndIf   
EndIf
If r>0.9*30 And r<3*30 And dr>300 Then
	Var lat0=lat,lng0=lng
	mxytolatlng(xx,yy)
	Var j1=getreversei(lat,lng)
	If j1>0 Then cityname1=namereversei(j1)
	mxytolatlng(x,y)
	Var j2=getreversei(lat,lng)
	If j2>0 Then cityname2=namereversei(j2)
	If cityname1<>cityname2 Then
	   taddcity=1
	EndIf
	lat=lat0:lng=lng0
EndIf 	
If tdttestcross=1 And r>0.9*30 Then 
	testcross=getcrossnearroad(x,y,co1,si1)
EndIf
If r>0.9*30 And r<2.5*30 And tparking=0 Then
  If tdttestcross=1 Then 
	'testcross=getcrossnearroad(x,y,co1,si1)
	If testcross=1 And dr>700 Then
		taddcross=1
		If toneway=1 And dr>900 Then 
			taddoneway=1
		EndIf
	EndIf
	If testcross=2 Then taddrail=1
	If dr>900 Or testcross<>1 Then  
		testcross2=getcrossnearroad(xx,yy,-co1,-si1)
   	If testcross2=1 And dr>700 Then taddcross2=1
   	If testcross2=2 Then taddrail2=1
	EndIf
	ttestcross(ij,i)=testcross
	ttestcross2(ij,i)=testcross2
	ttaddoneway(ij,i)=taddoneway
  Else
	testcross=ttestcross(ij,i)
	If testcross=1 And dr>700 Then
		taddcross=1
		taddoneway=ttaddoneway(ij,i)
	EndIf 
	If testcross=2 Then taddrail=1
	If dr>900 Or testcross<>1 Then  
    	testcross2=ttestcross2(ij,i)
   	If testcross2=1 And dr>700 Then taddcross2=1
   	If testcross2=2 Then taddrail2=1
	EndIf
  EndIf 
  If toneway=1 And taddcross2=1 And r<2*30 Then taddoneway2=1
EndIf
If r>1.15*30 And r<3*30 And dr>900 And tparking=0 and (n>7 Or dr>4000) Then
	taddcitykm=1
	Var lat0=lat,lng0=lng
	mxytolatlng(xx,yy)
	Var latx=lat,lngx=lng
	lat=lat0:lng=lng0
	citynamekm1="":citynamekm2="":citynamekm3=""
	setcitykm1(latx,lngx,co1,si1)
	If citynamekm1="" And citynamekm2="" And citynamekm3="" Then taddcitykm=0
EndIf
EndIf 
x=200:y=200
tx=1'drawbuildtx*x/150
ty=1'drawbuildty*(h0)/120'(z-z0)/(120)
Var ktx=tx*0.5/x
If trail=1 Then
	r=0.7*30
	ktx=tx*1.5/x
EndIf
 glenable(gl_texture_2d)
 'glbindtexture(gl_texture_2d,building3text)
 Var r65=50.0
 If trunway=1 Then r65=999
 If trail=0 Then
 	If r<999+r65 Then
 		drawbuildtext=roadtext
 	Else
 		drawbuildtext=roadlefttext
 	EndIf
 Else
 	drawbuildtext=railtext
 	h+=0.15
 EndIf
 glbindtexture(gl_texture_2d,drawbuildtext) 
 If t40=0 Then
  xx=townwaynodex(ij,i,1)-dmx0
  yy=townwaynodey(ij,i,1)-dmy0
  x=townwaynodex(ij,i,2)-dmx0
  y=townwaynodey(ij,i,2)-dmy0
 Else
  xx=townx40(i40,1)
  yy=towny40(i40,1)
  x=townx40(i40,2)
  y=towny40(i40,2)
 EndIf 
 dx=x-xx:dy=y-yy
 dr=max(0.0001,Sqr(dx*dx+dy*dy))
 co1=r*dx/dr:si1=r*dy/dr
 x=xx:y=yy
/' glpushmatrix
 gltranslatef(x-dmx0,y-dmy0,mzsol0)
 glcolor3f(1,0,0)
 gltexsphere(60,8,8)
 glpopmatrix
 glpushmatrix
 x=townwaynodex(ij,i,n)
 y=townwaynodey(ij,i,n)
 gltranslatef(x-dmx0,y-dmy0,mzsol0)
 glcolor3f(1,1,1)
 gltexsphere(20,8,8)
 glpopmatrix 
 'Exit sub
 x=xx:y=yy
 '/
 x0=x-si1-co1:y0=y+co1-si1
 x1=x+si1-co1:y1=y-co1-si1
 tx=0:tx0=txroad
 Dim As single px0,pxx0,py0,pyy0,px1,pxx1,py1,pyy1
 px0=x0:px1=x1:py0=y0:py1=y1
 'If n=nwaynode Then glcolor3f(1,0,0) 
 'If n=2 Then glcolor3f(0,1,0)
 Var mx1=mx+cos1*v*7,my1=my+sin1*v*7
 Var mx2=mx+cos1*v*4,my2=my+sin1*v*4
 Var mx3=mx+cos1*v*15,my3=my+sin1*v*15
 Dim As Single dddx0,dddy0,dddx,dddy,ddxx,ddyy,ddx,ddy
 For j=2 To n
   
 	If i40>0 And t40=0 Then
 		Var jj=j
 		If knode40(i40,jj)=jj Then
 	     	'If townwaynodeid(ij,i)=79152373 Then auxvar6=max(auxvar6,jj)
      	'xx=x:yy=y
 	      Var xxx=gettownnodex40(i40,jj)
 	      Var yyy=gettownnodey40(i40,jj)
 	      'mygltexquad xx,yy,z0, x,y,z0, x,y,z, xx,yy,z, tx,ty,tx0 ',1
   If Abs(xxx)<0.1 Or Abs(yyy)<0.1 Or Abs(xxx-x)+Abs(yyy-y)>20000 Then
     knode40(i40,jj)=0
  	  ixy40=0:townixy40(i40)=1
  	  i40=0 
   ElseIf ixy40<n40-1 Then 
     ixy40+=1
     townx40(i40,ixy40)=xxx
     towny40(i40,ixy40)=yyy
   EndIf   
 		EndIf
 	EndIf  	

   Var ttunnel=0
   If layer<-0.1 And tlayer0>-0.1 Then
   	If (j>2 and j<n) Then
   		ttunnel=1
   	Else
   		ttunnel=2
   	EndIf
   EndIf

 	xx=x:yy=y
 	If t40=0 Then
 	 x=townwaynodex(ij,i,j)-dmx0
 	 y=townwaynodey(ij,i,j)-dmy0
    If i40>0 Then
      ixy40+=1
      townx40(i40,ixy40)=x
      towny40(i40,ixy40)=y
    EndIf
   Else
    x=townx40(i40,j)
    y=towny40(i40,j)
 	EndIf
 	dx=x-xx:dy=y-yy
   dr=max(0.1,Sqr(dx*dx+dy*dy))
   co1=r*dx/dr:si1=r*dy/dr
   Var xco1=dx/dr,xsi1=dy/dr
 	Var r60=r
 	If j>=3 And j<=n-1 And tlayer0>0.4 And layer>0.99 Then
 		If Timer>timelayer-2.5 Then
 		   r60+=r+r
 		   var dmx=mx-xx,dmy=my-yy
   		If Abs(xsi1*dmx-xco1*dmy)<r60 Then
   		   Var dmxx=xco1*dmx+xsi1*dmy
   		   If dmxx>-r60 Then
   		   	If dmxx<dr+r60 Then
   		   	   tlayer=1
   		   	   tlayer2=0
   		   	   timelayer=Timer+2
   		   	endif    
   		   EndIf
   		EndIf
 		EndIf 
 	EndIf 	
 	/'ElseIf j<=3 Or j>=n-1 And Abs(layer)>0.99 Then
    If layer>0 And tlayer>-0.1 And tlayer2>-0.1 Then
     If Timer>timelayer-2 Then 	
    	r60+=r+r+r+r
   	If j<=2 Or j>=n Then
   		If Abs(mx+mx-x-xx)<r60 Then
   		   If Abs(my+my-y-yy)<r60 Then
   		   	Var ttlayer2=0.5*layer
   		   	If Abs(ttlayer2-tlayer2)<0.7 Then
   		   	  Var dx=xco1,dy=xsi1',dr=Sqr(dx*dx+dy*dy)
   		   	  If j>=n Then dx=-dx:dy=-dy
   		   	  If cos1*dx+sin1*dy>0.906 Then 	
   		   		 timelayer=Timer+2.1
   		   		 tlayer2=ttlayer2
       		   	 If Abs(tlayer)<0.4 Then tlayer=layer
       		     EndIf 	
       		   EndIf 	
   		   EndIf
   		EndIf
   	ElseIf (tlayer2)>0.4 And layer>0.4 Then  	
   		If Abs(mx+mx-x-xx)<r60 Then
   			If Abs(my+my-y-yy)<r60 Then
   		   	  Var dx=xco1,dy=xsi1',dr=Sqr(dx*dx+dy*dy)
   		   	  If j>=n-1 Then dx=-dx:dy=-dy
   		   	  If cos1*dx+sin1*dy>0.906 Then 	
   				     tlayer=layer:timelayer=Timer+2.1
   				  EndIf    
   			EndIf
   		EndIf
   	EndIf
     EndIf '/ 	
    /'Elseif layer<0 And tlayer0<0.4 And tlayer0>-0.4 And time2>timelayer+7 Then          
   	r60*=1.4
   	If j=2 Then
   		If Abs(mx-x)<r60 Then
   		   If Abs(my-y)<r60 Then
   		   	Var ttlayer2=0.5*layer
   		   	If Abs(ttlayer2-tlayer2)<0.7 Then
   		   	  Var dx=x-xx,dy=y-yy,dr=Sqr(dx*dx+dy*dy)
   		   	  If cos1*dx+sin1*dy>dr*0.7 Then 	
   		   		 timelayer=Timer-6
   		   		 tlayer2=ttlayer2
       		   	 tlayer=layer
       		     EndIf 	 
       		   EndIf 	
   		   EndIf
   		EndIf
   	EndIf 	
   	If j=n Then
   		If Abs(mx-xx)<r60 Then
   		   If Abs(my-yy)<r60 Then
   		   	Var ttlayer2=0.5*layer
   		   	If Abs(ttlayer2-tlayer2)<0.7 Then
   		   	  Var dx=x-xx,dy=y-yy,dr=Sqr(dx*dx+dy*dy)
   		   	  If cos1*dx+sin1*dy>dr*0.7 Then 	
   		   		 timelayer=Timer-6
   		   		 tlayer2=ttlayer2
       		   	 tlayer=layer
       		     EndIf 	 
       		   EndIf 	
   		   EndIf
   		EndIf
   	EndIf 	
    ElseIf layer<0 And tlayer0<-0.4 And time2>timelayer+7 Then
    	r60*=1.4
   	If j=2 Then
   		If Abs(mx-xx)<r60 Then
   		   If Abs(my-yy)<r60 Then
   		   	Var ttlayer2=0
   		   	'If Abs(ttlayer2-tlayer2)<0.7 Then
   		   	  Var dx=x-xx,dy=y-yy',dr=Sqr(dx*dx+dy*dy)
   		   	  If cos1*dx+sin1*dy<0 Then 	
   		   		 timelayer=Timer
   		   		 tlayer2=ttlayer2
       		   	 tlayer=0
       		     EndIf 	 
       		   'EndIf 	
   		   EndIf
   		EndIf
   	EndIf
   	If j=n Then
   		If Abs(mx-x)<r60 Then
   		   If Abs(my-y)<r60 Then
   		   	Var ttlayer2=0
   		   	'If Abs(ttlayer2-tlayer2)<0.7 Then
   		   	  Var dx=x-xx,dy=y-yy',dr=Sqr(dx*dx+dy*dy)
   		   	  If cos1*dx+sin1*dy<0 Then 	
   		   		 timelayer=Timer
   		   		 tlayer2=ttlayer2
       		   	 tlayer=0
       		     EndIf 	 
       		   'EndIf 	
   		   EndIf
   		EndIf
   	EndIf '/
   '  EndIf  	
   'EndIf
   'If plane=0 Or car>0 Then 
    Var tnear=0,testcrossjj=0
    Var dxxx=xx-mx,d100=30+r+r+r+dr
    'If Abs(dxxx-distnearroad)<d100 Or Abs(dxxx+distnearroad)<d100 Then
    If Abs(dxxx)<distnearroad+d100 Then
   	/'If inearroad<nnearroad Then
   		inearroad+=1
   		xnearroad(inearroad)=xx
   		ynearroad(inearroad)=yy
   		rnearroad(inearroad)=r
   		drnearroad(inearroad)=dr
   		co1nearroad(inearroad)=co1
   		si1nearroad(inearroad)=si1
   	EndIf
    Else'/ 	
      Var dyyy=yy-my
      'If Abs(dyyy-distnearroad)<d100 Or Abs(dyyy+distnearroad)<d100 Then
      If Abs(dyyy)<distnearroad+d100 Then
   	   If Abs(dxxx)<920+d100 And Abs(dyyy)<920+d100 Then'And trail=0 Then
   	   	tnear=1
   	   EndIf
   	   If inearroad<nnearroad Then'And trail=0 Then
   	   	inearroad+=1
   		   xnearroad(inearroad)=xx
   		   ynearroad(inearroad)=yy
   		   If trail=0 Then
   		   	rnearroad(inearroad)=r
   		   Else
   		   	rnearroad(inearroad)=9
   		   EndIf
   		   drnearroad(inearroad)=dr
   		   co1nearroad(inearroad)=co1
   		   si1nearroad(inearroad)=si1
   		   onewaynearroad(inearroad)=toneway
   		   namenearroad(inearroad)=townwayname(ij,i)
   		   idnearroad(inearroad)=Str(townwaynodeid(ij,i))
   		   inearroad2+=r*dr/(40*200)
   		   ijnearroad(inearroad)=ij
   		   iinearroad(inearroad)=i
            layernearroad(inearroad)=layer
            /'If townwaynoder(ij,i)>0.91 Then
      	      If townwaynodeg(ij,i)<-0.5 Then
      	      	layernearroad(inearroad)=-1'$$$
      	      Else
      	      	If r>40 Then
      	      		layernearroad(inearroad)=1
      	      	Else
      	      		layernearroad(inearroad)=0
      	      	EndIf
      	      EndIf
            Else
            	layernearroad(inearroad)=0
            EndIf '/
   	   EndIf
   	   Var dxxxx=x-mx,dyyyy=y-my
   	   If (Abs(dxxx)<500+d100 And Abs(dyyy)<500+d100)Or(Abs(dxxxx)<500+d100 And Abs(dyyyy)<500+d100) Then
    	    If inear0road<nnear0road Then'And trail=0 Then
    	    	tnear=2
   	   	inear0road+=1
   		   Var xx0=xnear0road(inear0road)
   		   Var yy0=ynear0road(inear0road)
   		   xnear0road(inear0road)=xx
   		   ynear0road(inear0road)=yy
   		   If trail=0 Then
   		   	rnear0road(inear0road)=r
   		   Else
   		   	rnear0road(inear0road)=9
   		   EndIf
   		   drnear0road(inear0road)=dr
   		   co1near0road(inear0road)=co1
   		   si1near0road(inear0road)=si1
   		   onewaynear0road(inear0road)=toneway
      	   layernear0road(inear0road)=layer
      	   If Abs(xx-xx0)+Abs(yy-yy0)<1 Then
      	   	testcrossjj=0
      	   Else
      	   	testcrossjj=1
      	   EndIf
            /'If townwaynoder(ij,i)>0.91 Then
      	      If townwaynodeg(ij,i)<-0.5 Then
      	      	layernear0road(inear0road)=-1
      	      Else
      	      	layernear0road(inear0road)=1
      	      EndIf
            Else
            	layernear0road(inear0road)=0
            EndIf '/
    	    EndIf
   	   EndIf
      EndIf    
    EndIf 
   'EndIf
   'If j>3 And j<n-1 And layer<0 And tlayer0>-0.1 Then'mz>mzsol0-5 Then
   '	z0+=zlayer:z1+=zlayer
   '	Continue For  
   'EndIf 
   'If j>3 And j<n-1 And layer>=0 And tlayer0<-0.1 Then'mz>mzsol0-5 Then
   '	z0+=zlayer:z1+=zlayer
   '	Continue For  
   'EndIf
   If tnear=2 Then 
    Var dxy=(mx1-xx)*dy-(my1-yy)*dx
    If Abs(dxy)<dr*(r+d60road) Then
      Var dxx=(mx3-xx)*dx+(my3-yy)*dy
      Var r05=(r*0.5+d05road)*0.75
      If dxx>-r05*dr And dxx<(dr+r05)*(dr) Then mytestroad3=1
      dxx=(mx2-xx)*dx+(my2-yy)*dy
      If dxx>-r05*dr And dxx<(dr+r05)*(dr) Then
         If Abs(dxy)<dr*r Then
            mytestroad2=1
         EndIf
   		dxx=(cos1*co1+sin1*si1)*1.75/(20+r)
   		Var kdxy=dxy/(dr*(r+d60road))
  			dxx*=(1.5+Abs(kdxy))/(1+Abs(kdxy))
   		If dxx>0 Then
   			dxx=max(0.0001,dxx-dxx*0.1*kdxy)
   		Else 
   			dxx=min(-0.0001,dxx-dxx*0.1*kdxy)
   			If toneway=1 Then dxx*=0.05
   		EndIf
   		If Abs(dxx)>Abs(dxautopilot) Then
   		  dxautopilot=dxx
   		  dyautopilot=dxy/(dr*(r+d60road))
   		  If cos1*(mx1-xx)+sin1*(my1-yy)<-r Then
   		    If cos1*(mx1-x)+sin1*(my1-y)<-r Then
   		    	 dyautopilot=Sgn(dyautopilot)
   		    EndIf              		  	
   		  EndIf
   		  co1autopilot=co1
   		  si1autopilot=si1
   		EndIf
      EndIf
    EndIf 
   EndIf
 	'tx0+=tx
 	'tx=ktx*dr
 	xx0=px0:yy0=py0
 	xx1=px1:yy1=py1
   x0=x-si1:y0=y+co1
   x1=x+si1:y1=y-co1
   If j=n Then
   	x0+=co1:y0+=si1
   	x1+=co1:y1+=si1
   EndIf
   If j<=2 Then 
    px0=xx0:px1=xx1:py0=yy0:py1=yy1
    'Var dist=max(Abs(px0-mx-dmx0),Abs(py0-my-dmy0))
    if ttsetterrainij Then'dist<1900 Or dist>2100 Then'600 
       z0=getterrainheight(px0,py0)+h 
       z1=getterrainheight(px1,py1)+h
    Else  
      'z0=getterrainheight(px0,py0)+h
      'z1=getterrainheight(px1,py1)+h
       z0=setterrainheight((px0+px1)*0.5,(py0+py1)*0.5,xco1,xsi1,trunway)+h
       z1=z0
    EndIf
    Var drr=Abs(px0-x0)+Abs(py0-y0)+Abs(px1-x1)+Abs(py1-y1)
    'If dist>3000*kdistroad Then Continue For 
   Else 
     pxx0=px0:pyy0=py0:pxx1=px1:pyy1=py1
     px0=xx-si1:py0=yy+co1
     px1=xx+si1:py1=yy-co1
     zz0=z0:zz1=z1
     Var drr=Abs(px0-pxx0)+Abs(py0-pyy0)+Abs(px1-pxx1)+Abs(py1-pyy1)
     If drr>r*0.1 Then
     Var dist=max(Abs(xx-mx-dmx0),Abs(yy-my-dmy0))	
     If ttsetterrainij Or layer<>0 Then'dist<1900 Or dist>2100 Then'600 
       z0=getterrainheight(px0,py0)+h 
       z1=getterrainheight(px1,py1)+h
     Else  
       z0=setterrainheight(xx,yy,xco1,xsi1,trunway)+h
       z1=z0
     EndIf
     If j>=2 And j<=n Then z0+=zlayer:z1+=zlayer
     'If dist>3000*kdistroad Then Continue for
      'z0=min(z0,zmax):z1=min(z1,zmax)
      tx=drr*0.5/r
      If trail=0 Then
      	If r<r65 Then
      		drawbuildtext=roadtext
      	Else
      		drawbuildtext=roadlefttext
      	EndIf
      Else 
      	drawbuildtext=railtext
      EndIf
      If tcolor Then glcolor3f(rcolor,gcolor,bcolor)
      glbindtexture(gl_texture_2d,drawbuildtext)
      testmygltexquad=0
      If ttunnel<>1 and (ttunnel=0 or (j=2 or j=n))Then 
   		gltexquad pxx0,pyy0,zz0, px0,py0,z0, px1,py1,z1+hr, pxx1,pyy1,zz1+hr, tx,ty,tx0	
   	   If Abs(layer)<0.4 And tlayer0>-0.1 Then 
   	    glcolor3f(0,1,0)
   	    glbindtexture(gl_texture_2d,webtext)
   	    Var t4=7.0,t8=5.0
     	    gltexquad pxx0,pyy0,zz0, px0,py0,z0, px0-t4*xsi1,py0+t4*xco1,z0-t8, pxx0-t4*xsi1,pyy0+t4*xco1,zz0-t8, tx,0.092,tx0,0.5
     	    gltexquad pxx1,pyy1,zz1, px1,py1,z1, px1+t4*xsi1,py1-t4*xco1,z1-t8, pxx1+t4*xsi1,pyy1-t4*xco1,zz1-t8, tx,0.092,tx0,0.5
   	    glcolor3f(1,1,1)
          glbindtexture(gl_texture_2d,drawbuildtext)
         EndIf  
      EndIf
   	testmygltexquad=1
   	testmygltexquad0=1
   	tx0+=tx 
     EndIf 	  	
   EndIf 
   'Var zmax=mzsol0+100*scalez
   'z0=min(z0,zmax):z1=min(z1,zmax)
   'If (n=2 and j=2 And dr<450) Then
   '	layer=0
   'EndIf
   Var di=1,di0=1
   If layer<>0 And j=n Or j=2 Then
      di=max2(1,Int(dr/70)):di0=max2(1,min2(15,di/2))
   Else 
      di=max2(1,Int(dr/150)):di0=max2(1,min2(15,di/2))
   EndIf
   ddx0=(x0-px0)/di
   ddy0=(y0-py0)/di
   ddx1=(x1-px1)/di
   ddy1=(y1-py1)/di
   tx=ktx*dr/di
   Var pxx=(px0+px1)*0.5,pyy=(py0+py1)*0.5
   dddx0=ddxx:dddy0=ddyy
   ddxx=(ddx0+ddx1)*0.5:ddyy=(ddy0+ddy1)*0.5
   dddx=(ddxx-dddx0)/di0
   dddy=(ddyy-dddy0)/di0
   ddx=(dddx0-ddxx)*0.5
   ddy=(dddy0-ddyy)*0.5
   Var kdd=10.0/max(Abs(ddx)+Abs(ddy),10.0)
   dddx*=kdd:dddy*=kdd:ddx*=kdd:ddy*=kdd
   For jj=1 To di
   	pxx0=px0:pyy0=py0:pxx1=px1:pyy1=py1
   	px0+=ddx0:py0+=ddy0:px1+=ddx1:py1+=ddy1
      zz0=z0:zz1=z1
      pxx+=ddxx:pyy+=ddyy
      If jj<di0 and jj>1 Then  
        px0+=ddx:py0+=ddy:px1+=ddx:py1+=ddy
        pxx+=ddx:pyy+=ddy
        ddx+=dddx:ddy+=dddy
      ElseIf jj>(di-di0) And jj<di Then  
        px0+=ddx:py0+=ddy:px1+=ddx:py1+=ddy
        pxx+=ddx:pyy+=ddy
        ddx-=dddx:ddy-=dddy
      ElseIf jj=di Then 
        px0=x0:py0=y0:px1=x1:py1=y1
        pxx=(x0+x1)*0.5:pyy=(y0+y1)*0.5	
      EndIf    
     Var dist=max(Abs(pxx-mx-dmx0),Abs(pyy-my-dmy0))
     If ttsetterrainij Or layer<>0 Then'dist<1900 Or dist>2100 Then'600 
      z0=getterrainheight(px0,py0)+h 
      z1=getterrainheight(px1,py1)+h
     Else  
      z0=setterrainheight(pxx,pyy,xco1,xsi1,trunway)+h
      z1=z0
     EndIf
     If layer<>0 Then
     	  Var dzlayer=zlayer
     	  if j=n Then
     	  	If jj>=di Then dzlayer=0
     	  EndIf  	
     	  z0+=dzlayer:z1+=dzlayer
     EndIf
     'If trunway=0 and tmainway=0 Then
     	'If dist>min(12000.0,4000+(mz-mzsol0)*2.5) Then Continue For
     'Else 
     	If dist>distrunway4000 Then Continue For
     'EndIf
      'z0=min(z0,zmax):z1=min(z1,zmax)
      Var dz=0.0
      Var txx=tx
      If trail=0 Then 
       If j=2 And jj=1 Then
      	drawbuildtext=roadbandtext
      	glbindtexture(gl_texture_2d,drawbuildtext)
      	tx0=0.7:txx=1.4:dz=-0.1
       ElseIf j=n And jj=di Then 
      	drawbuildtext=roadbandtext
      	glbindtexture(gl_texture_2d,drawbuildtext)
      	tx0=0.3:txx=1.4:dz=-0.1
       ElseIf j>2 And j<n And (jj Mod 8)=5 and r>29 Then 
      	If toneway=0 Then
      	  If r<r65 Then
      		drawbuildtext=roadarrowtext
      	  Else
      		drawbuildtext=roadarrowlefttext
      	  EndIf
      	Else 
      	  If r<r65 Then
      		drawbuildtext=roadarrow2text
      	  Else
      		drawbuildtext=roadarrow2lefttext
      	  EndIf
      	EndIf
      	glbindtexture(gl_texture_2d,drawbuildtext)
      	tx0=0:txx=1.4
       ElseIf r<r65 And drawbuildtext<>roadtext Then 	
      	drawbuildtext=roadtext
      	glbindtexture(gl_texture_2d,drawbuildtext)
       ElseIf r>=r65 And drawbuildtext<>roadlefttext Then 	
      	drawbuildtext=roadlefttext
      	glbindtexture(gl_texture_2d,drawbuildtext)
       EndIf 
      EndIf
      If tcolor Then glcolor3f(rcolor,gcolor,bcolor)
      If tcolor And j=n And jj=di Then glcolor3f(rcolor,gcolor,1)
      testmygltexquad=0
   	If dr<dr30000 And ttunnel<>1 And (ttunnel=0 Or (j=2 And jj=1) Or (j=n And jj=di)) Then
   		gltexquad pxx0,pyy0,dz+zz0, px0,py0,dz+z0, px1,py1,dz+z1+hr, pxx1,pyy1,dz+zz1+hr, txx,ty,tx0
   	   If Abs(layer)<0.4 And tlayer0>-0.1 Then 
     	    glcolor3f(0,1,0)
          glbindtexture(gl_texture_2d,webtext)
     	    Var t4=7.0,t8=5.0
     	    gltexquad pxx0,pyy0,dz+zz0, px0,py0,dz+z0, px0-t4*xsi1,py0+t4*xco1,dz+z0-t8, pxx0-t4*xsi1,pyy0+t4*xco1,dz+zz0-t8, txx,0.092,tx0,0.5
     	    gltexquad pxx1,pyy1,dz+zz1, px1,py1,dz+z1, px1+t4*xsi1,py1-t4*xco1,dz+z1-t8, pxx1+t4*xsi1,pyy1-t4*xco1,dz+zz1-t8, txx,0.092,tx0,0.5
   	    glcolor3f(1,1,1)
          glbindtexture(gl_texture_2d,drawbuildtext)
         EndIf  
   	EndIf
   	testmygltexquad=1
   	testmygltexquad0=1
   	'gltexquad xx0,yy0,z0, x0,y0,z0, x1,y1,z, xx1,yy1,z, tx,ty,tx0
   	'glpushmatrix
   	'gltranslatef(px0,py0,z0)
   	'If j=n And jj=di Then gltexsphere(40,4,4)
   	'glpopmatrix
   If tcolor Then glcolor3f(1,1,1)
   If dr>dr30000 Then Continue For 
   If layer<0 And ttunnel<>1 Then
     If (((j=2 And jj=1)Or(j=n And jj=di))Or tlayer0<-0.4) Then
         drawbuildtext=roadtext
         glbindtexture(gl_texture_2d,roadtext)
         If tlayer0>-0.4 Then glcolor3f(0.5,1,0.8)
         Var dzz=dz:If tlayer0>-0.4 Then dzz-=86'89
         Var test=0
         If tlayer0<-0.4 Then test=gettestnear0road((px0*1.3-0.3*px1),(py0*1.3-0.3*py1),-1,inear0road)
         If test=0 Then
      	   gltexquad pxx0,pyy0,dzz+zz0, px0,py0,dzz+z0, px0,py0,dzz+z1+hr+100, pxx0,pyy0,dzz+zz1+hr+100, txx,ty,tx0
         EndIf 
         'If gettestnear0road((pxx1+px1)*0.5,(pyy1+py1)*0.5,-1,inear0road)=0 Then
         	gltexquad pxx1,pyy1,dzz+zz0, px1,py1,dzz+z0, px1,py1,dzz+z1+hr+100, pxx1,pyy1,dzz+zz1+hr+100, txx,ty,tx0
         'EndIf 
         If j=2 And jj=1 Then
           glcolor3f(0.3,0.4,1)
           Var co01=co1*0.03,si01=si1*0.03
   	     gltexquad pxx0+si01,pyy0-co01,dzz+zz0, pxx0-si01,pyy0+co01,dzz+zz0, pxx0-si01,pyy0+co01,dzz+z1+hr+100, pxx0+si01,pyy0-co01,dzz+zz1+hr+100, txx,ty,tx0
           gltexquad pxx1-si01,pyy1+co01,dzz+zz0, pxx1+si01,pyy1-co01,dzz+z0,  pxx1+si01,pyy1-co01,dzz+z1+hr+100, pxx1-si01,pyy1+co01,dzz+zz1+hr+100, txx,ty,tx0         	
           glcolor3f(1,1,1)
         EndIf
         If j=n And jj=di Then         	
           glcolor3f(0.3,0.4,1)
           Var co01=co1*0.03,si01=si1*0.03
   	     gltexquad px0+si01,py0-co01,dzz+zz0, px0-si01,py0+co01,dzz+zz0, px0-si01,py0+co01,dzz+z1+hr+100, px0+si01,py0-co01,dzz+zz1+hr+100, txx,ty,tx0
           gltexquad px1+si01,py1-co01,dzz+zz0, px1+si01,py1-co01,dzz+z0,  px1+si01,py1-co01,dzz+z1+hr+100, px1+si01,py1-co01,dzz+zz1+hr+100, txx,ty,tx0         	
           glcolor3f(1,1,1)
         EndIf
         If (j=2 And jj=1)Or(j=n And jj=di) Then
           Var dt2=2:If id=idlayer Or id=idlayer0 Then dt2=-1	
           If Timer>timelayer-dt2 Then
         	Var drr=r*2.8,dxx=0.0
         	If j=2 And jj=1 Then dxx=Abs(mx+mx-pxx0-pxx1)
         	If j=n And jj=di Then dxx=Abs(mx+mx-px0-px1)
         	If dxx<drr Then
         		Var dyy=0.0
         	   If j=2 And jj=1 Then dyy=Abs(my+my-pyy0-pyy1)
         	   If j=n And jj=di Then dyy=Abs(my+my-py0-py1)
         		If dyy<drr Then
         			dxx=cos1*co1+sin1*si1
         			If tlayer0>-0.4 And tlayer0<0.4 Then
         				If (j=2 And dxx>r*0.8)Or(j=n And dxx<-r*0.8) Then
         					tlayer=-1:idlayer0=0:idlayer=0:timelayer=Timer+5
         				EndIf
         			ElseIf tlayer0<-0.4 Then 
         				If (j=2 And dxx<-r*0.3)Or(j=n And dxx>r*0.3) Then
         					tlayer=0:idlayer0=idlayer:idlayer=id:timelayer=Timer+1.8'+5 
         				EndIf
         			EndIf
         		EndIf
         	EndIf
           EndIf 	
         EndIf
     EndIf  
   EndIf
   If layer>0 Then
     If (((j=2 And jj=1)Or(j=n And jj=di))) Then
     	     Var dt2=2:If id=idlayer Or id=idlayer0 Then dt2=-1
           If Timer>timelayer-dt2 Then
         	Var drr=r*4,dxx=0.0
         	If j=2 And jj=1 Then dxx=Abs(mx+mx-pxx0-pxx1)
         	If j=n And jj=di Then dxx=Abs(mx+mx-px0-px1)
         	If dxx<drr Then
         		Var dyy=0.0
         	   If j=2 And jj=1 Then dyy=Abs(my+my-pyy0-pyy1)
         	   If j=n And jj=di Then dyy=Abs(my+my-py0-py1)
         		If dyy<drr Then
         			dxx=cos1*co1+sin1*si1
         			If tlayer0>-0.4 And tlayer0<0.4 Then
         				If (j=2 And dxx>r*0.5)Or(j=n And dxx<-r*0.5) Then
         					tlayer=1:idlayer0=0:timelayer=Timer+5'2.9'2.1
         				EndIf
         			ElseIf tlayer0>0.4 Then 
         				If (j=2 And dxx<-r*0.4)Or(j=n And dxx>r*0.4) Then
         					tlayer=0:idlayer0=idlayer:idlayer=id:timelayer=Timer+1.8'+2.1 
         				EndIf
         			EndIf
         		EndIf
         	EndIf
           EndIf 	
     EndIf  
   EndIf
   If testmygltexquad=1 And trail=0 And layer=0 Then 
     If taddspot=1 And j>1 And j<max2(n,3) And (jj Mod 7)=2 Then
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
      	gldisable gl_texture_2d
      	gldisable gl_lighting
      	glpushmatrix
   	   Var sc=15.0
   	   Var px=px1+si1*0.15
   	   Var py=py1-co1*0.15
   	   gltranslatef(px,py,z1+sc*1.4)
   	   'Var doo1=diro1(px-mx,py-my)
   	   'glrotatef(doo1,0,0,1)
   	   'glrotatef(45,1,0,0)
   	   'glcarre2(sc,sc)
   	   'glscalef(sc,sc,sc)
   	   glsphere(sc,4,2)
   	   gltranslatef(px0-px1-si1*0.3,py0-py1+co1*0.3,z0-z1)
   	   glsphere(sc,4,2)
   	   'glpopmatrix
   	   'glpushmatrix
   	   'px=px0-si1*0.15
   	   'py=py0+co1*0.15
   	   'gltranslatef(px,py,z0+sc*1.4)
   	   'doo1=diro1(px-mx,py-my)
   	   'glrotatef(doo1,0,0,1)
   	   'glrotatef(45,1,0,0)
   	   'glcarre2(sc,sc)
     	   glpopmatrix 
         glenable gl_texture_2d
         glenable gl_lighting  
      EndIf 
      Var tcross=1:If testcross<>0 And ((j=2 And jj<=2)Or(j=n And jj>=di-1))Then tcross=0
      Var testcross2=0
      If tnear=2 And jj<100 And r>0.9*30 And tcross=1 Then 
       If testcrossjj=0 Then
      	 testcross2=testcrossnear0road(inear0road,jj)
       Else
     	    testcross2=getcrossnear0road((px1),(py1),co1,si1,30)
     	    testcrossnear0road(inear0road,jj)=testcross2
       EndIf 
      EndIf
      If testcross2<>0 Then tcross=0
      If tcross And taddtree=1 And (jj And 2) And ((j>2 And j<n)Or(jj>1 And jj<di)) Then
       Var dist=max(Abs(px1-mx),Abs(py1-my))
       If dist<4000 Then 	
         glenable gl_alpha_test
         glalphafunc(gl_less,1/254)
         drawbuildtext=arbretext(1)
         glbindtexture(gl_texture_2d,arbretext(1))	
      	glpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*0.5
   	   Var dzz1=zz1+(zz1-zz0)*0.5*0.5
   	   Var xxx=(px1+pxx1+si1)*0.5,yyy=(py1+pyy1-co1)*0.5,zzz=(dz1+dzz1)*0.5-2
   	   gltranslatef(xxx,yyy,zzz)
   	   If taddsauterelle=1 Then addsauterelle(xxx,yyy,zzz)
   	   Var sc=0.6
   	   glscalef(sc,sc,sc)
   	   glrotatef(Int(px1+pxx1)And 255,0,0,1)
   	   drawarbre()
     	   glpopmatrix 
     	   gldisable gl_alpha_test
     	   If taddshadowtree=1 And dist<1200 Then addshadowtree2(xxx,yyy,zzz,1)
     	 EndIf        	
      ElseIf tcross And taddlamp=1 Then
       If (max(Abs(px1-mx),Abs(py1-my))<3000 Or (tmainway=1 And (jj Mod 3)=2))And(dist<4000 Or tdark=1) Then 
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
      	gldisable gl_texture_2d
      	glpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*0.15
   	   Var dzz1=zz1+(zz1-zz0)*0.5*0.15
   	   gltranslatef(px1+(pxx1-px1)*0.3+si1*0.15,py1+(pyy1-py1)*0.3-co1*0.15,dz1+(dzz1-dz1)*0.3)
   	   If taddshadowpanel=1 And dist<4000 Then
   	   	addshadowpanel(px1+(pxx1-px1)*0.3+si1*0.15,py1+(pyy1-py1)*0.3-co1*0.15,shadowlamptext,do1)
   	   EndIf
   	   glrotatef(do1,0,0,1)
   	   Var sc=0.28
   	   glscalef(sc,sc,sc)
   	   If tdark=1 Then gldisable gl_lighting
   	   If dist<4000 Then
   	   	If tdark=0 Then 
   	   		glcalllist(lamplist)
   	   	Else
   	   		glcalllist(lamplist2)
   	   	EndIf
   	   ElseIf tdark=1 Then 
   	   	glcalllist(lamplist3)
   	   EndIf
   	   If tdark=1 Then glenable gl_lighting
     	   glpopmatrix 
         glenable gl_texture_2d  
       EndIf
      EndIf  
      If tcross And taddlamp=0 And taddbarriere=1 And ((j>2 And j<n)Or(jj>1 And jj<di)) Then
       If max(Abs(px1-mx),Abs(py1-my))<3000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glenable gl_alpha_test
         glalphafunc(gl_less,50/254)
         drawbuildtext=barrieretext
         glbindtexture(gl_texture_2d,barrieretext)	
      	glpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5
   	   Var dzz1=zz1+(zz1-zz0)*0.5
   	   gltranslatef(px1*0.25+pxx1*0.75+si1,py1*0.25+pyy1*0.75-co1,dz1*0.25+dzz1*0.75-1)
   	   If taddshadowquad=1 Then
   	   	Var xx=px1*0.25+pxx1*0.75+si1,yy=py1*0.25+pyy1*0.75-co1,zz=0'dz1*0.75+dzz1*0.25-1
   	   	Var d25=30.0/(r)
   	   	myshadowtext=barrieretext
   	      addshadowquad(xx-d25*co1,yy-d25*si1,zz,xx+co1*d25,yy+si1*d25,zz,15,2)
   	      myshadowtext=0   	   	
   	   EndIf
   	   glrotatef(do1+90,0,0,1)
   	   Var dz=(zz1-z1)*0.5*60/(dr/di)
   	   gltexcarre2dz(60,15,dz)
   	   glrotatef(90,0,0,1)
   	   gltranslatef(28,0,dz)
   	   gltexcarre2(2,15,0.2)
   	   gltranslatef(-56,0,-dz-dz)
   	   gltexcarre2(2,15,0.2)
     	   glpopmatrix
      	glpushmatrix
   	   gltranslatef(px1*0.75+pxx1*0.25+si1,py1*0.75+pyy1*0.25-co1,dz1*0.75+dzz1*0.25-1)
   	   If taddshadowquad=1 Then
   	   	Var xx=px1*0.75+pxx1*0.25+si1,yy=py1*0.75+pyy1*0.25-co1,zz=0'dz1*0.75+dzz1*0.25-1
   	   	Var d25=30.0/(r)
   	   	myshadowtext=barrieretext
   	      addshadowquad(xx-d25*co1,yy-d25*si1,zz,xx+co1*d25,yy+si1*d25,zz,15,2)   	   	
   	   	myshadowtext=0
   	   EndIf
   	   glrotatef(do1+90,0,0,1)
   	   'Var dz=(zz1-z1)*0.5*60/(dr/di)
   	   gltexcarre2dz(60,15,dz)
   	   glrotatef(90,0,0,1)
   	   gltranslatef(28,0,dz)
   	   gltexcarre2(2,15,0.2)
   	   gltranslatef(-56,0,-dz-dz)
   	   gltexcarre2(2,15,0.2)
     	   glpopmatrix 
     	   gldisable gl_alpha_test
     	 EndIf        	
      ElseIf tcross And taddlamp=0 And taddhaie=1 And ((j>2 And j<n)Or(jj>1 And jj<di)) Then
       If max(Abs(px1-mx),Abs(py1-my))<3000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glenable gl_alpha_test
         glalphafunc(gl_less,50/254)
         drawbuildtext=haietext
         glbindtexture(gl_texture_2d,haietext)
         'glcolor3f(0.5,0.8,0.5)	 
      	glpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5
   	   Var dzz1=zz1+(zz1-zz0)*0.5
   	   gltranslatef(px1*0.25+pxx1*0.75+si1,py1*0.25+pyy1*0.75-co1,dz1*0.25+dzz1*0.75-1)
   	   If taddshadowquad=1 Then
   	   	Var xx=px1*0.25+pxx1*0.75+si1,yy=py1*0.25+pyy1*0.75-co1,zz=0'dz1*0.25+dzz1*0.75-1
   	   	Var d25=25.0/(r)
   	      addshadowquad(xx-d25*co1,yy-d25*si1,zz,xx+co1*d25,yy+si1*d25,zz,20,2)   	   	
   	   EndIf
   	   glrotatef(do1+90,0,0,1)
   	   Var dz=(zz1-z1)*0.5*50/(dr/di)
   	   gltexcarre2dz(50,20,dz)
   	   gltranslatef(6,0,0)
   	   gltexcarre2dz(50,20,dz)
   	   glrotatef(90,0,0,1)
   	   gltranslatef(23,3,dz)
   	   gltexcarre2(6,20,1)
   	   gltranslatef(-46,0,-dz-dz)
   	   gltexcarre2(6,20,1)
     	   glpopmatrix
      	glpushmatrix
   	   gltranslatef(px1*0.75+pxx1*0.25+si1,py1*0.75+pyy1*0.25-co1,dz1*0.75+dzz1*0.25-1)
   	   If taddshadowquad=1 Then
   	   	Var xx=px1*0.75+pxx1*0.25+si1,yy=py1*0.75+pyy1*0.25-co1,zz=0'dz1*0.75+dzz1*0.25-1
   	   	Var d25=25.0/(r)
   	      addshadowquad(xx-d25*co1,yy-d25*si1,zz,xx+co1*d25,yy+si1*d25,zz,20,2)   	   	
   	   EndIf
   	   glrotatef(do1+90,0,0,1)
   	   'Var dz=(zz1-z1)*0.5*50/(dr/di)
   	   gltexcarre2dz(50,20,dz)
   	   gltranslatef(6,0,0)
   	   gltexcarre2dz(50,20,dz)
   	   glrotatef(90,0,0,1)
   	   gltranslatef(23,3,dz)
   	   gltexcarre2(6,20,1)
   	   gltranslatef(-46,0,-dz-dz)
   	   gltexcarre2(6,20,1)
     	   glpopmatrix 
     	   glcolor3f(1,1,1)
     	   gldisable gl_alpha_test
     	 EndIf        	
      EndIf
      Var testnathalie=0
      If tcross And taddnathalie=1 Then 
         If (j=Int(n/2) Or (j=Int(n*0.18)And j>2 And taddcitykm=0)) And jj=2 Then
         	testnathalie=1
         ElseIf n>12 Then 
            If (j=Int(n*0.7)) And jj=2 Then
         	    testnathalie=1
            EndIf     
         EndIf
      EndIf 	
      If testnathalie=1 Then  
       Var dist=max(Abs(px1-mx),Abs(py1-my))
       If dist<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor3f(1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*1.4
   	   Var dzz1=zz1+(zz1-zz0)*0.5*1.4
   	   gltranslatef(px1*0.5+pxx1*0.5+si1*1.4,py1*0.5+pyy1*0.5-co1*1.4,dz1*0.5+dzz1*0.5-1)
    	   If taddshadowpanel=1 Then addshadowpanel(px1*0.5+pxx1*0.5+si1*1.4,py1*0.5+pyy1*0.5-co1*1.4,shadowcitytext)
   	   glrotatef(do1-190,0,0,1)
   	   glcylindre(1,1,5.3,4,2)
   	   glcolor3f(1,1,1)
   	   gltranslatef(0,0,5)
   	   glenable gl_texture_2d
   	   If dist<distnathalie Then nathaliex=px1:nathaliey=py1
         If Int(px1/100)And 1 Then 
          If Int(py1/100)And 1 Then
          	if do1woman<350 And (Int(px1/40)Mod 3)=2 Then 
               drawbuildtext=mywomantext
               glbindtexture(gl_texture_2d,mywomantext)
               If dist<distnathalie Then distnathalie=dist:namenathalie="christine"
          	Else
               drawbuildtext=marisoltext
               glbindtexture(gl_texture_2d,marisoltext)
               If dist<distnathalie Then distnathalie=dist:namenathalie="marisol"
          	EndIf 	
          Else 
            drawbuildtext=nathalietext
            glbindtexture(gl_texture_2d,nathalietext)
            If dist<distnathalie Then distnathalie=dist:namenathalie="nathalie"
          EndIf  
         ElseIf (Int(px1/40)Mod 3)=1 Then  
           drawbuildtext=veroniquetext
           glbindtexture(gl_texture_2d,veroniquetext)
           If dist<distnathalie Then distnathalie=dist:namenathalie="veronique"
         ElseIf (Int(px1/40)And 1) Then  
           drawbuildtext=christinetext
           glbindtexture(gl_texture_2d,christinetext)
           If dist<distnathalie Then distnathalie=dist:namenathalie="valerie"'"christine"
         Else  
           drawbuildtext=cocacolatext
           glbindtexture(gl_texture_2d,cocacolatext)
           If dist<distnathalie Then distnathalie=dist:namenathalie="jane"'"cocacola"
         EndIf
         'glbindtexture(gl_texture_2d,onewaytext)
         'glcolor4f(0.14,0.14,0.14,1)
         'glenable gl_alpha_test
         'glAlphaFunc(gl_less,10/254)
         If drawbuildtext=mywomantext Then
         	gltexrotcarre2(35,41,do1woman)
         Else 	
         	gltexcarre2(35,41)
         	If drawbuildtext=cocacolatext Then
         		gltranslatef(-1,0,0)
         		gltexcarre2(-35,41)
         	EndIf
         EndIf
         'glcolor4f(1,1,1,1)
         'gldisable gl_alpha_test
         /'gltranslatef(1,-17,37)
         Var lat0=lat,lng0=lng
         mxytolatlng(px1+dmx0,py1+dmy0)
         Var lati=lat,lngi=lng
         lat=lat0:lng=lng0
         Var jreverse=getreversei(lati,lngi) 
         If jreverse>0 Then gldrawtext3D(Left(namereversei(jreverse),14),5)
         '/
         glpopmatrix
       EndIf
      EndIf  
      If taddcross=1 And (j=n) And jj=di Then 
       If max(Abs(pxx1-mx),Abs(pyy1-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor4f(1,1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   'Var dz1=z1+(z1-z0)*0.5*0.3
   	   Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   gltranslatef(pxx1-co1+si1*0.3,pyy1-si1-co1*0.3,dzz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(pxx1-co1+si1*0.3,pyy1-si1-co1*0.3,shadowcrosstext)
   	   glrotatef(do1-190,0,0,1)
   	   glcylindre(0.75,0.75,20.3,4,2)
   	   glcolor4f(1,1,1,1)
   	   gltranslatef(0,0,20)
   	   glenable gl_texture_2d
         drawbuildtext=crosstext
         glbindtexture(gl_texture_2d,crosstext)
         glenable gl_alpha_test
         glalphafunc(gl_less,100/254)
         gltexcarre2(15,15)
         gltranslatef(-0.3,0,1)
         glcolor4f(0.06,0.06,0.06,1)
         gltexcarre2(12,12)
         glcolor4f(1,1,1,1)
         gldisable gl_alpha_test
         glpopmatrix
       EndIf
      EndIf  
      If taddcross2=1 And (j=2) And jj=1 Then 
       If max(Abs(px0-mx),Abs(py0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor4f(1,1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   Var dz1=z0+(z0-z1)*0.5*0.3
   	   'Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   gltranslatef(px0+co1-si1*0.3,py0+si1+co1*0.3,dz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(px0+co1-si1*0.3,py0+si1+co1*0.3,shadowcrosstext)
   	   glrotatef(do1-190+180,0,0,1)
   	   glcylindre(0.75,0.75,20.3,4,2)
   	   glcolor4f(1,1,1,1)
   	   gltranslatef(0,0,20)
   	   glenable gl_texture_2d
         drawbuildtext=crosstext
         glbindtexture(gl_texture_2d,crosstext)
         glenable gl_alpha_test
         glalphafunc(gl_less,100/254)
         gltexcarre2(15,15)
         gltranslatef(-0.3,0,1)
         glcolor4f(0.06,0.06,0.06,1)
         gltexcarre2(12,12)
         glcolor4f(1,1,1,1)
         gldisable gl_alpha_test
         glpopmatrix
       EndIf
      EndIf  
      If taddrail=1 And (j=n) And jj=di Then 
       If max(Abs(pxx1-mx),Abs(pyy1-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor4f(1,1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   'Var dz1=z1+(z1-z0)*0.5*0.3
   	   Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   gltranslatef(pxx1-co1+si1*0.3,pyy1-si1-co1*0.3,dzz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(pxx1-co1+si1*0.3,pyy1-si1-co1*0.3,shadowcrosstext)
   	   glrotatef(do1-190,0,0,1)
   	   glcylindre(0.75,0.75,20.3,4,2)
   	   glcolor4f(1,1,1,1)
   	   gltranslatef(0,0,20)
   	   glenable gl_texture_2d
         drawbuildtext=crossrailtext
         glbindtexture(gl_texture_2d,crossrailtext)
         glenable gl_alpha_test
         glalphafunc(gl_less,100/254)
         gltexcarre2(15,15)
         gltranslatef(-0.3,0,1)
         glcolor4f(0.06,0.06,0.06,1)
         gltexcarre2(12,12)
         glcolor4f(1,1,1,1)
         gldisable gl_alpha_test
         glpopmatrix
       EndIf
      EndIf  
      If taddrail2=1 And (j=2) And jj=1 Then 
       If max(Abs(px0-mx),Abs(py0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor4f(1,1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   Var dz1=z0+(z0-z1)*0.5*0.3
   	   'Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   gltranslatef(px0+co1-si1*0.3,py0+si1+co1*0.3,dz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(px0+co1-si1*0.3,py0+si1+co1*0.3,shadowcrosstext)
   	   glrotatef(do1-190+180,0,0,1)
   	   glcylindre(0.75,0.75,20.3,4,2)
   	   glcolor4f(1,1,1,1)
   	   gltranslatef(0,0,20)
   	   glenable gl_texture_2d
         drawbuildtext=crossrailtext
         glbindtexture(gl_texture_2d,crossrailtext)
         glenable gl_alpha_test
         glalphafunc(gl_less,100/254)
         gltexcarre2(15,15)
         gltranslatef(-0.3,0,1)
         glcolor4f(0.06,0.06,0.06,1)
         gltexcarre2(12,12)
         glcolor4f(1,1,1,1)
         gldisable gl_alpha_test
         glpopmatrix
       EndIf
      EndIf  
      If tparking=1 And ((j Mod 2)=0) And j<n And jj=1 Then 
       If max(Abs(px0-mx),Abs(py0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor4f(1,1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*0.3
   	   'Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   gltranslatef(px1+si1*0.3,py1-co1*0.3,dz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(px1+si1*0.3,py1-co1*0.3,shadowparkingtext)
   	   glrotatef(do1-190+180,0,0,1)
   	   glcylindre(0.75,0.75,20.3,4,2)
   	   glcolor4f(1,1,1,1)
   	   gltranslatef(0,0,20)
   	   glenable gl_texture_2d
         drawbuildtext=parkingtext
         glbindtexture(gl_texture_2d,parkingtext)
         glenable gl_alpha_test
         glalphafunc(gl_less,100/254)
         gltexcarre2(15,15)
         gltranslatef(-0.3,0,0)
         gltexcarre2(-15,15)
         glcolor4f(1,1,1,1)
         gldisable gl_alpha_test
         glpopmatrix
       EndIf
      EndIf  
      If taddoneway=1 And (j=n) And jj=di Then 
       If max(Abs(pxx0-mx),Abs(pyy0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor4f(1,1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   'Var dz1=z1+(z1-z0)*0.5*0.3
   	   Var dzz1=zz0+(zz0-zz1)*0.5*0.3
   	   gltranslatef(pxx0-co1-si1*0.3,pyy0-si1+co1*0.3,dzz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(pxx0-co1-si1*0.3,pyy0-si1+co1*0.3,shadowonewaytext)
   	   glrotatef(do1-190+180,0,0,1)
   	   glcylindre(0.75,0.75,20.3,4,2)
   	   glcolor4f(1,1,1,1)
   	   gltranslatef(0,0,20)
   	   glenable gl_texture_2d
         drawbuildtext=onewaytext
         glbindtexture(gl_texture_2d,onewaytext)
         glenable gl_alpha_test
         glalphafunc(gl_less,100/254)
         gltexcarre2(10.5,10.5)
         gltranslatef(-0.3,0,1)
         glcolor4f(0.06,0.06,0.06,1)
         gltexcarre2(8.2,8.2)
         glcolor4f(1,1,1,1)
         gldisable gl_alpha_test
         glpopmatrix
       EndIf
      EndIf  
      If (taddoneway2=1) And (j=2) And jj=2 Then 
       If max(Abs(pxx0-mx),Abs(pyy0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor4f(1,1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   'Var dz1=z1+(z1-z0)*0.5*0.3
   	   Var dzz1=zz0+(zz0-zz1)*0.5*0.3
   	   gltranslatef(pxx0+co1*0.4-si1*0.3,pyy0+si1*0.4+co1*0.3,dzz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(pxx0+co1*0.4-si1*0.3,pyy0+si1*0.4+co1*0.3,shadowparkingtext)
   	   glrotatef(do1-190,0,0,1)
   	   glcylindre(0.75,0.75,20.3,4,2)
   	   glcolor4f(1,1,1,1)
   	   gltranslatef(0,0,20)
   	   glenable gl_texture_2d
         drawbuildtext=oneway2text
         glbindtexture(gl_texture_2d,oneway2text)
         glenable gl_alpha_test
         glalphafunc(gl_less,100/254)
         gltexcarre2(10.5,10.5)
         gltranslatef(-0.3,0,1)
         glcolor4f(0.06,0.06,0.06,1)
         gltexcarre2(8.2,8.2)
         glcolor4f(1,1,1,1)
         gldisable gl_alpha_test
         glpopmatrix
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   'Var dz1=z1+(z1-z0)*0.5*0.3
   	   dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   gltranslatef(pxx1+co1*0.4+si1*0.3,pyy1+si1*0.4-co1*0.3,dzz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(pxx1+co1*0.4+si1*0.3,pyy1+si1*0.4-co1*0.3,shadowparkingtext)
   	   glrotatef(do1-190,0,0,1)
   	   glcylindre(0.75,0.75,20.3,4,2)
   	   glcolor4f(1,1,1,1)
   	   gltranslatef(0,0,20)
   	   glenable gl_texture_2d
         drawbuildtext=oneway2text
         glbindtexture(gl_texture_2d,oneway2text)
         glenable gl_alpha_test
         glalphafunc(gl_less,100/254)
         gltexcarre2(10.5,10.5)
         gltranslatef(-0.3,0,1)
         glcolor4f(0.06,0.06,0.06,1)
         gltexcarre2(8.2,8.2)
         glcolor4f(1,1,1,1)
         gldisable gl_alpha_test
         glpopmatrix
       EndIf
      EndIf  
      If tcross And taddcity=1 And (j=max2(1,Int(n/3))) And jj=2 And cityname2<>"" Then 
       If max(Abs(px1-mx),Abs(py1-my))<4000 Then 
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor3f(1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*1.1
   	   Var dzz1=zz1+(zz1-zz0)*0.5*1.1
   	   gltranslatef(px1*0.5+pxx1*0.5+co1+si1*1.1,py1*0.5+pyy1*0.5+si1-co1*1.1,dz1*0.5+dzz1*0.5-1)
    	   If taddshadowpanel=1 Then addshadowpanel(px1*0.5+pxx1*0.5+co1+si1*1.1,py1*0.5+pyy1*0.5+si1-co1*1.1,shadowcitytext)
   	   glrotatef(do1-190,0,0,1)
   	   glscalef(1.2,1.2,1.2)
   	   glcylindre(1,1,9.3,4,2)
   	   glcolor3f(0,0,0.8)
   	   gltranslatef(0,0,9)
   	   Var ltext=min2(18,Len(cityname2))
         glcarre2(36*ltext/14,8)
         gltranslatef(1,-17*ltext/14,2)
   	   glcolor3f(1,1,1)
   	   glenable gl_texture_2d
         drawbuildtext=nathalietext
         gldrawtext3D(Left(cityname2,ltext),5)
         glpopmatrix
   	   glcolor3f(1,1,1)
       EndIf
      EndIf  
      If tcross And taddcity=1 And (j=max2(1,Int(n/3))) And jj=2 And cityname1<>"" And toneway=0 Then 
       If max(Abs(px0-mx),Abs(py0-my))<4000 Then 
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor3f(1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   Var dz0=z0+(z0-z1)*0.5*1.1
   	   Var dzz0=zz0+(zz0-zz1)*0.5*1.1
   	   gltranslatef(px0*0.5+pxx0*0.5-si1*1.1,py0*0.5+pyy0*0.5+co1*1.1,dz0*0.5+dzz0*0.5-1)
   	   If taddshadowpanel=1 Then addshadowpanel(px0*0.5+pxx0*0.5-si1*1.1,py0*0.5+pyy0*0.5+co1*1.1,shadowcitytext)
   	   glrotatef(do1-190+180,0,0,1)
   	   glscalef(1.2,1.2,1.2)
   	   glcylindre(1,1,9.3,4,2)
   	   glcolor3f(0,0,0.8)
   	   gltranslatef(0,0,9)
   	   Var ltext=min2(18,Len(cityname1))
         glcarre2(36*ltext/14,8)
         gltranslatef(1,-17*ltext/14,2)
   	   glcolor3f(1,1,1)
   	   glenable gl_texture_2d
         drawbuildtext=nathalietext
         gldrawtext3D(Left(cityname1,ltext),5)
         glpopmatrix
   	   glcolor3f(1,1,1)
       EndIf
      EndIf  
      If tcross And taddcitykm=1 And (j=max2(2,Int(n/4))) And jj=2 Then
       If max(Abs(px1-mx),Abs(py1-my))<4000 Then 
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         glcolor3f(1,1,1)
         gldisable gl_texture_2d	 
      	glpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*1.2
   	   Var dzz1=zz1+(zz1-zz0)*0.5*1.2
   	   gltranslatef(px1*0.5+pxx1*0.5-co1+si1*1.2,py1*0.5+pyy1*0.5-si1-co1*1.2,dz1*0.5+dzz1*0.5-1)
    	   If taddshadowpanel=1 Then addshadowpanel(px1*0.5+pxx1*0.5-co1+si1*1.2,py1*0.5+pyy1*0.5-si1-co1*1.2,shadowcitykmtext)
   	   glrotatef(do1-190,0,0,1)
   	   glscalef(1.2,1.2,1.2)
   	   glcylindre(1,1,9.3,4,2)
   	   glcolor3f(0,0,0.8)
   	   gltranslatef(0,0,9)
         glcarre2(37,38)
         gltranslatef(1,-17.5,32)
   	   glcolor3f(1,1,1)
   	   glenable gl_texture_2d
         drawbuildtext=nathalietext
         If citynamekm1<>"" Then 
           gldrawtext3D(Left(UCase(citynamekm1),10),5)
           Var k26=27.5+(3-Len(citykm1))*2
           gltranslatef(0,k26,0)
           gldrawtext3D(citykm1,5)
           gltranslatef(0,-k26,-7)
         EndIf 
         If citynamekm2<>"" Then 
           gldrawtext3D(Left(citynamekm2,10),5)
           Var k26=27.5+(3-Len(citykm2))*2
           gltranslatef(0,k26,0)
           gldrawtext3D(citykm2,5)
           gltranslatef(0,-k26,-7)
         EndIf 
         If citynamekm3<>"" Then 
           gldrawtext3D(Left(citynamekm3,10),5)
           Var k26=27.5+(3-Len(citykm3))*2
           gltranslatef(0,k26,0)
           gldrawtext3D(citykm3,5)
         EndIf 
         glpopmatrix
   	   glcolor3f(1,1,1)
       EndIf
      EndIf
   EndIf 'testmygltexquad   
      tx0+=tx
   Next
 Next
 If i40>0 And t40=0 Then
 	townixy40(i40)=ixy40
 EndIf
 txroad=tx0:If txroad>100 Then txroad-=100
glcolor3f(1,1,1)
glenable(gl_texture_2d)
If tdark=1 Then
  	glenable(gl_lighting)
   glenable(gl_normalize)
   tnight=0:tlight=1
Else
   gldisable(gl_lighting)
   gldisable(gl_normalize)
EndIf   
'gldisable(gl_lighting)
End Sub
Sub drawroadnode_agl(ij As Integer,i As Integer)
Dim As Single x,y,z,z1,h,tx,ty,z0,xx,yy,tx0,x0,y0,xx0,yy0,x1,y1,xx1,yy1,r,dr,dx,dy,co1,si1,ddx0,ddy0,ddx1,ddy1,hr
dim as single co10,si10,zz0,zz1
Dim As Integer j,n,jj,toneway=0,tparking=0,trail=0,trunway=0,taddspot=0,tmainway=0
If taglcompile>1 Then 
	Exit sub
EndIf
h=4'8
hr=-0.2
n=towniwaynode(ij,i)
If n<2 Then Exit Sub 
r=max(5.0,townwaynodeh(ij,i))
If r>2000 Then r-=2000:tparking=1
If r>1000 Then r-=1000:toneway=1
If r<0.3*30 Then trail=1
If r>4*30 then trunway=1
If r>2.5*30 And trunway=0 Then tmainway=1 
If tdark=1 Then
   aglenable(gl_lighting)
   aglenable gl_normalize
   If trunway=1 Then taddspot=1
Else
   agldisable(gl_lighting)
   'agldisable gl_normalize
End If   
h-=max(0.0,(2.8*30-r)*0.005)
Var ttsetterrainij=ttsetterrain(ij,i)
ttsetterrain(ij,i)=1 
Var taddtree=0,taddlamp=0,taddbarriere=0,taddhaie=0,taddnathalie=0,taddcity=0,cityname1="",cityname2=""
Var taddcitykm=0,taddcross=0,taddcross2=0,taddoneway=0,taddrail=0,taddrail2=0,taddoneway2=1
xx=townwaynodex(ij,i,1)
yy=townwaynodey(ij,i,1)
x=townwaynodex(ij,i,n)
y=townwaynodey(ij,i,n)
Var id=townwaynodeid(ij,i)
dx=x-xx:dy=y-yy
dr=max(0.0001,Sqr(dx*dx+dy*dy))
Var d7000=dr*0.5+7000
Var distxy7000=max(Abs((xx+x)*0.5-dmx0-mx),Abs((yy+y)*0.5-dmy0-my))
If distxy7000<d7000 Then 
If ttsetterrainij=0 And distxy7000<dr*0.5+2000 Then subsettupdate() 
If r>1.15*30 And r<2.5*30 Then taddtree=1
If r>2.5*30 And r<3*30 Then taddlamp=1
If r>1.15*0.7*30 And r<2.95*30 And n>=3 Then taddnathalie=1  
co1=dx/dr:si1=dy/dr
If r>0.6*30 And r<2.5*30 Then
 If r<2.0*30 Or (id And 1) Then
  If tdttestcross=1 then	
   If gettestroadtree((xx+x)*0.5+si1*200,(yy+y)*0.5-co1*200)=4 Then'cowland
   	taddtree=0:taddbarriere=1
   ElseIf gettestroadtree(xx*0.25+x*0.75+si1*200,yy*0.25+y*0.75-co1*200)=4 Then'cowland
   	taddtree=0:taddbarriere=1
   ElseIf gettestroadtree(xx*0.75+x*0.25+si1*200,yy*0.75+y*0.25-co1*200)=4 Then'cowland
   	taddtree=0:taddbarriere=1
   EndIf
   ttaddbarriere(ij,i)=taddbarriere
  Else
  	taddbarriere=ttaddbarriere(ij,i)
  	If taddbarriere=1 Then taddtree=0
  EndIf 	
   If (Int(id*0.1)And 1) And r>1.15*30 Then taddtree=1
   If taddbarriere=0 And r>0.9*30 Then
   	If (Int(id*0.01)mod 3)>0 And dr<3000 Then taddbarriere=0:taddhaie=1 
   EndIf
   If dr<900 Then taddbarriere=0:taddhaie=0
   If dr<300 Then taddnathalie=0
 EndIf   
EndIf
If r>0.9*30 And r<3*30 And dr>300 Then
	Var lat0=lat,lng0=lng
	mxytolatlng(xx,yy)
	Var j1=getreversei(lat,lng)
	If j1>0 Then cityname1=namereversei(j1)
	mxytolatlng(x,y)
	Var j2=getreversei(lat,lng)
	If j2>0 Then cityname2=namereversei(j2)
	If cityname1<>cityname2 Then
	   taddcity=1
	EndIf
	lat=lat0:lng=lng0
EndIf 	
If r>0.9*30 And r<2.5*30 And tparking=0 Then
  If tdttestcross=1 Then 
	testcross=getcrossnearroad(x,y,co1,si1)
	If testcross=1 And dr>700 Then
		taddcross=1
		If toneway=1 And dr>900 Then 
			taddoneway=1
		EndIf
	EndIf
	If testcross=2 Then taddrail=1
	If dr>900 Or testcross<>1 Then  
		testcross2=getcrossnearroad(xx,yy,-co1,-si1)
   	If testcross2=1 And dr>700 Then taddcross2=1:taddoneway2=1
   	If testcross2=2 Then taddrail2=1
	EndIf
	ttestcross(ij,i)=testcross
	ttestcross2(ij,i)=testcross2
	ttaddoneway(ij,i)=taddoneway
  Else
	testcross=ttestcross(ij,i)
	If testcross=1 And dr>700 Then
		taddcross=1
		taddoneway=ttaddoneway(ij,i)
	EndIf 
	If testcross=2 Then taddrail=1
	If dr>900 Or testcross<>1 Then  
    	testcross2=ttestcross2(ij,i)
   	If testcross2=1 And dr>700 Then taddcross2=1:taddoneway2=1
   	If testcross2=2 Then taddrail2=1
	EndIf
  EndIf 	
EndIf
If r>1.15*30 And r<3*30 And dr>900 And tparking=0 and (n>7 Or dr>4000) Then
	taddcitykm=1
	Var lat0=lat,lng0=lng
	mxytolatlng(xx,yy)
	Var latx=lat,lngx=lng
	lat=lat0:lng=lng0
	citynamekm1="":citynamekm2="":citynamekm3=""
	setcitykm1(latx,lngx,co1,si1)
	If citynamekm1="" And citynamekm2="" And citynamekm3="" Then taddcitykm=0
EndIf
EndIf 
x=200:y=200
tx=1'drawbuildtx*x/150
ty=1'drawbuildty*(h0)/120'(z-z0)/(120)
Var ktx=tx*0.5/x
If trail=1 Then
	r=0.7*30
	ktx=tx*1.5/x
EndIf
 aglenable(gl_texture_2d)
 'glbindtexture(gl_texture_2d,building3text)
 Var r65=50.0
 If trunway=1 Then r65=999
 If trail=0 Then
 	If r<999+r65 Then
 		drawbuildtext=roadtext
 	Else
 		drawbuildtext=roadlefttext
 	EndIf
 Else
 	drawbuildtext=railtext
 	h+=0.15
 EndIf
 aglbindtexture(gl_texture_2d,drawbuildtext) 
 xx=townwaynodex(ij,i,1)-dmx0
 yy=townwaynodey(ij,i,1)-dmy0
 x=townwaynodex(ij,i,2)-dmx0
 y=townwaynodey(ij,i,2)-dmy0
 dx=x-xx:dy=y-yy
 dr=max(0.0001,Sqr(dx*dx+dy*dy))
 co1=r*dx/dr:si1=r*dy/dr
 x=xx:y=yy
/' aglpushmatrix
 agltranslatef(x-dmx0,y-dmy0,mzsol0)
 aglcolor3f(1,0,0)
 agltexsphere(60,8,8)
 aglpopmatrix
 aglpushmatrix
 x=townwaynodex(ij,i,n)
 y=townwaynodey(ij,i,n)
 agltranslatef(x-dmx0,y-dmy0,mzsol0)
 aglcolor3f(1,1,1)
 agltexsphere(20,8,8)
 aglpopmatrix 
 'Exit sub
 x=xx:y=yy
 '/
 x0=x-si1-co1:y0=y+co1-si1
 x1=x+si1-co1:y1=y-co1-si1
 tx=0:tx0=txroad
 Dim As single px0,pxx0,py0,pyy0,px1,pxx1,py1,pyy1
 px0=x0:px1=x1:py0=y0:py1=y1
 'If n=nwaynode Then aglcolor3f(1,0,0) 
 'If n=2 Then aglcolor3f(0,1,0)
 Var mx1=mx+cos1*v*7,my1=my+sin1*v*7
 Var mx2=mx+cos1*v*4,my2=my+sin1*v*4
 Var mx3=mx+cos1*v*15,my3=my+sin1*v*15
 Dim As Single dddx0,dddy0,dddx,dddy,ddxx,ddyy,ddx,ddy
 For j=2 To n
 	xx=x:yy=y
 	x=townwaynodex(ij,i,j)-dmx0
 	y=townwaynodey(ij,i,j)-dmy0
 	dx=x-xx:dy=y-yy
   dr=max(0.1,Sqr(dx*dx+dy*dy))
   co1=r*dx/dr:si1=r*dy/dr
   Var xco1=dx/dr,xsi1=dy/dr
   'If plane=0 Or car>0 Then 
    Var tnear=0
    Var dxxx=xx-mx,d100=30+r+r+r+dr
    'If Abs(dxxx-distnearroad)<d100 Or Abs(dxxx+distnearroad)<d100 Then
    If Abs(dxxx)<distnearroad+d100 Then
   	/'If inearroad<nnearroad Then
   		inearroad+=1
   		xnearroad(inearroad)=xx
   		ynearroad(inearroad)=yy
   		rnearroad(inearroad)=r
   		drnearroad(inearroad)=dr
   		co1nearroad(inearroad)=co1
   		si1nearroad(inearroad)=si1
   	EndIf
    Else'/ 	
      Var dyyy=yy-my
      'If Abs(dyyy-distnearroad)<d100 Or Abs(dyyy+distnearroad)<d100 Then
      If Abs(dyyy)<distnearroad+d100 Then
   	   If Abs(dxxx)<920+d100 And Abs(dyyy)<920+d100 Then'And trail=0 Then
   	   	tnear=1
   	   EndIf
   	   If inearroad<nnearroad Then'And trail=0 Then
   	   	inearroad+=1
   		   xnearroad(inearroad)=xx
   		   ynearroad(inearroad)=yy
   		   If trail=0 Then
   		   	rnearroad(inearroad)=r
   		   Else
   		   	rnearroad(inearroad)=9
   		   EndIf
   		   drnearroad(inearroad)=dr
   		   co1nearroad(inearroad)=co1
   		   si1nearroad(inearroad)=si1
   		   onewaynearroad(inearroad)=toneway
   		   namenearroad(inearroad)=townwayname(ij,i)
   		   idnearroad(inearroad)=Str(townwaynodeid(ij,i))
   		   inearroad2+=r*dr/(40*200)
   		   ijnearroad(inearroad)=ij
   		   iinearroad(inearroad)=i
   	   EndIf
   	   If Abs(dxxx)<500+d100 And Abs(dyyy)<500+d100 Then
    	    If inear0road<nnear0road Then'And trail=0 Then
    	    	tnear=2
   	   	inear0road+=1
   		   xnear0road(inear0road)=xx
   		   ynear0road(inear0road)=yy
   		   If trail=0 Then
   		   	rnear0road(inear0road)=r
   		   Else
   		   	rnear0road(inear0road)=9
   		   EndIf
   		   drnear0road(inear0road)=dr
   		   co1near0road(inear0road)=co1
   		   si1near0road(inear0road)=si1
   		   onewaynear0road(inear0road)=toneway
    	    EndIf
   	   EndIf
      EndIf    
    EndIf 
   'EndIf
   If tnear=2 Then 
    Var dxy=(mx1-xx)*dy-(my1-yy)*dx
    If Abs(dxy)<dr*(r+d60road) Then
      Var dxx=(mx3-xx)*dx+(my3-yy)*dy
      Var r05=(r*0.5+d05road)*0.75
      If dxx>-r05*dr And dxx<(dr+r05)*(dr) Then mytestroad3=1
      dxx=(mx2-xx)*dx+(my2-yy)*dy
      If dxx>-r05*dr And dxx<(dr+r05)*(dr) Then
         If Abs(dxy)<dr*r Then
            mytestroad2=1
         EndIf
   		dxx=(cos1*co1+sin1*si1)*1.75/(20+r)
   		Var kdxy=dxy/(dr*(r+d60road))
  			dxx*=(1.5+Abs(kdxy))/(1+Abs(kdxy))
   		If dxx>0 Then
   			dxx=max(0.0001,dxx-dxx*0.1*kdxy)
   		Else 
   			dxx=min(-0.0001,dxx-dxx*0.1*kdxy)
   			If toneway=1 Then dxx*=0.05
   		EndIf
   		If Abs(dxx)>Abs(dxautopilot) Then
   		  dxautopilot=dxx
   		  dyautopilot=dxy/(dr*(r+d60road))
   		  If cos1*(mx1-xx)+sin1*(my1-yy)<-r Then
   		    If cos1*(mx1-x)+sin1*(my1-y)<-r Then
   		    	 dyautopilot=Sgn(dyautopilot)
   		    EndIf              		  	
   		  EndIf
   		  co1autopilot=co1
   		  si1autopilot=si1
   		EndIf
      EndIf
    EndIf 
   EndIf
 	'tx0+=tx
 	'tx=ktx*dr
 	xx0=px0:yy0=py0
 	xx1=px1:yy1=py1
   x0=x-si1:y0=y+co1
   x1=x+si1:y1=y-co1
   If j=n Then
   	x0+=co1:y0+=si1
   	x1+=co1:y1+=si1
   EndIf
   If j<=2 Then 
    px0=xx0:px1=xx1:py0=yy0:py1=yy1
    'Var dist=max(Abs(px0-mx-dmx0),Abs(py0-my-dmy0))
    if ttsetterrainij Then'dist<1900 Or dist>2100 Then'600 
       z0=getterrainheight(px0,py0)+h 
       z1=getterrainheight(px1,py1)+h
    Else  
      'z0=getterrainheight(px0,py0)+h
      'z1=getterrainheight(px1,py1)+h
       z0=setterrainheight((px0+px1)*0.5,(py0+py1)*0.5,xco1,xsi1,trunway)+h
       z1=z0
    EndIf
    Var drr=Abs(px0-x0)+Abs(py0-y0)+Abs(px1-x1)+Abs(py1-y1)
    'If dist>3000*kdistroad Then Continue For 
   Else 
     pxx0=px0:pyy0=py0:pxx1=px1:pyy1=py1
     px0=xx-si1:py0=yy+co1
     px1=xx+si1:py1=yy-co1
     zz0=z0:zz1=z1
     Var drr=Abs(px0-pxx0)+Abs(py0-pyy0)+Abs(px1-pxx1)+Abs(py1-pyy1)
     If drr>r*0.1 Then
     Var dist=max(Abs(xx-mx-dmx0),Abs(yy-my-dmy0))	
     If ttsetterrainij then'dist<1900 Or dist>2100 Then'600 
       z0=getterrainheight(px0,py0)+h 
       z1=getterrainheight(px1,py1)+h
     Else  
       z0=setterrainheight(xx,yy,xco1,xsi1,trunway)+h
       z1=z0
     EndIf
     'If dist>3000*kdistroad Then Continue for
      'z0=min(z0,zmax):z1=min(z1,zmax)
      tx=drr*0.5/r
      If trail=0 Then
      	If r<r65 Then
      		drawbuildtext=roadtext
      	Else
      		drawbuildtext=roadlefttext
      	EndIf
      Else 
      	drawbuildtext=railtext
      EndIf
      aglbindtexture(gl_texture_2d,drawbuildtext)
      testmygltexquad=0
   	agltexquad pxx0,pyy0,zz0, px0,py0,z0, px1,py1,z1+hr, pxx1,pyy1,zz1+hr, tx,ty,tx0
   	testmygltexquad=1
   	testmygltexquad0=1
   	tx0+=tx 
     EndIf 	  	
   EndIf 
   'Var zmax=mzsol0+100*scalez
   'z0=min(z0,zmax):z1=min(z1,zmax)
   Var di=max2(1,Int(dr/150)),di0=max2(1,min2(15,di/2))
   ddx0=(x0-px0)/di
   ddy0=(y0-py0)/di
   ddx1=(x1-px1)/di
   ddy1=(y1-py1)/di
   tx=ktx*dr/di
   Var pxx=(px0+px1)*0.5,pyy=(py0+py1)*0.5
   dddx0=ddxx:dddy0=ddyy
   ddxx=(ddx0+ddx1)*0.5:ddyy=(ddy0+ddy1)*0.5
   dddx=(ddxx-dddx0)/di0
   dddy=(ddyy-dddy0)/di0
   ddx=(dddx0-ddxx)*0.5
   ddy=(dddy0-ddyy)*0.5
   Var kdd=10.0/max(Abs(ddx)+Abs(ddy),10.0)
   dddx*=kdd:dddy*=kdd:ddx*=kdd:ddy*=kdd
   For jj=1 To di
   	pxx0=px0:pyy0=py0:pxx1=px1:pyy1=py1
   	px0+=ddx0:py0+=ddy0:px1+=ddx1:py1+=ddy1
      zz0=z0:zz1=z1
      pxx+=ddxx:pyy+=ddyy
      If jj<di0 and jj>1 Then  
        px0+=ddx:py0+=ddy:px1+=ddx:py1+=ddy
        pxx+=ddx:pyy+=ddy
        ddx+=dddx:ddy+=dddy
      ElseIf jj>(di-di0) And jj<di Then  
        px0+=ddx:py0+=ddy:px1+=ddx:py1+=ddy
        pxx+=ddx:pyy+=ddy
        ddx-=dddx:ddy-=dddy
      ElseIf jj=di Then 
        px0=x0:py0=y0:px1=x1:py1=y1
        pxx=(x0+x1)*0.5:pyy=(y0+y1)*0.5	
      EndIf    
     Var dist=max(Abs(pxx-mx-dmx0),Abs(pyy-my-dmy0))
     If ttsetterrainij then'dist<1900 Or dist>2100 Then'600 
      z0=getterrainheight(px0,py0)+h 
      z1=getterrainheight(px1,py1)+h
     Else  
      z0=setterrainheight(pxx,pyy,xco1,xsi1,trunway)+h
      z1=z0
     EndIf
     'If trunway=0 and tmainway=0 Then
     	'If dist>min(12000.0,4000+(mz-mzsol0)*2.5) Then Continue For
     'Else 
     	If dist>distrunway4000 Then Continue For
     'EndIf
      'z0=min(z0,zmax):z1=min(z1,zmax)
      Var dz=0.0
      Var txx=tx
      If trail=0 Then 
       If j=2 And jj=1 Then
      	drawbuildtext=roadbandtext
      	aglbindtexture(gl_texture_2d,drawbuildtext)
      	tx0=0.7:txx=1.4:dz=-0.1
       ElseIf j=n And jj=di Then 
      	drawbuildtext=roadbandtext
      	aglbindtexture(gl_texture_2d,drawbuildtext)
      	tx0=0.3:txx=1.4:dz=-0.1
       ElseIf j>2 And j<n And (jj Mod 8)=5 and r>29 Then 
      	If toneway=0 Then
      	  If r<r65 Then
      		drawbuildtext=roadarrowtext
      	  Else
      		drawbuildtext=roadarrowlefttext
      	  EndIf
      	Else 
      	  If r<r65 Then
      		drawbuildtext=roadarrow2text
      	  Else
      		drawbuildtext=roadarrow2lefttext
      	  EndIf
      	EndIf
      	aglbindtexture(gl_texture_2d,drawbuildtext)
      	tx0=0:txx=1.4
       ElseIf r<r65 And drawbuildtext<>roadtext Then 	
      	drawbuildtext=roadtext
      	aglbindtexture(gl_texture_2d,drawbuildtext)
       ElseIf r>=r65 And drawbuildtext<>roadlefttext Then 	
      	drawbuildtext=roadlefttext
      	aglbindtexture(gl_texture_2d,drawbuildtext)
       EndIf 
      EndIf
      testmygltexquad=0
   	agltexquad pxx0,pyy0,dz+zz0, px0,py0,dz+z0, px1,py1,dz+z1+hr, pxx1,pyy1,dz+zz1+hr, txx,ty,tx0
   	testmygltexquad=1
   	testmygltexquad0=1
   	'gltexquad xx0,yy0,z0, x0,y0,z0, x1,y1,z, xx1,yy1,z, tx,ty,tx0
   	'glpushmatrix
   	'gltranslatef(px0,py0,z0)
   	'If j=n And jj=di Then agltexsphere(40,4,4)
   	'glpopmatrix
   If testmygltexquad=1 And trail=0 Then 
      If taddspot=1 And j>1 And j<max2(n,3) And (jj Mod 7)=2 Then
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
      	agldisable gl_texture_2d
      	agldisable gl_lighting
      	aglpushmatrix
   	   Var sc=15.0
   	   Var px=px1+si1*0.15
   	   Var py=py1-co1*0.15
   	   agltranslatef(px,py,z1+sc*1.4)
   	   'Var doo1=diro1(px-mx,py-my)
   	   'aglrotatef(doo1,0,0,1)
   	   'aglrotatef(45,1,0,0)
   	   'aglcarre2(sc,sc)
   	   'aglscalef(sc,sc,sc)
   	   aglsphere(sc,4,2)
   	   agltranslatef(px0-px1-si1*0.3,py0-py1+co1*0.3,z0-z1)
   	   aglsphere(sc,4,2)
   	   'aglpopmatrix
   	   'aglpushmatrix
   	   'px=px0-si1*0.15
   	   'py=py0+co1*0.15
   	   'agltranslatef(px,py,z0+sc*1.4)
   	   'doo1=diro1(px-mx,py-my)
   	   'aglrotatef(doo1,0,0,1)
   	   'aglrotatef(45,1,0,0)
   	   'aglcarre2(sc,sc)
     	   aglpopmatrix 
         aglenable gl_texture_2d
         aglenable gl_lighting  
      EndIf  
      If taddtree=1 And (jj And 2) And ((j>2 And j<n)Or(jj>1 And jj<di)) Then
       Var dist=max(Abs(px1-mx),Abs(py1-my))
       If dist<4000 Then 	
         aglenable gl_alpha_test
         aglalphafunc(gl_less,1/254)
         drawbuildtext=arbretext(1)
         aglbindtexture(gl_texture_2d,arbretext(1))	
      	aglpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*0.5
   	   Var dzz1=zz1+(zz1-zz0)*0.5*0.5
   	   Var xxx=(px1+pxx1+si1)*0.5,yyy=(py1+pyy1-co1)*0.5,zzz=(dz1+dzz1)*0.5-2
   	   agltranslatef(xxx,yyy,zzz)
   	   If taddsauterelle=1 Then addsauterelle(xxx,yyy,zzz)
   	   Var sc=0.6
   	   aglscalef(sc,sc,sc)
   	   aglrotatef(Int(px1+pxx1)And 255,0,0,1)
   	   agldrawarbre()
     	   aglpopmatrix 
     	   agldisable gl_alpha_test
     	   If taddshadowtree=1 And dist<1200 Then addshadowtree2(xxx,yyy,zzz,1)
     	 EndIf        	
      ElseIf taddlamp=1 Then
       If (max(Abs(px1-mx),Abs(py1-my))<3000 Or (tmainway=1 And (jj Mod 3)=2))And(dist<4000 Or tdark=1) Then 
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
      	agldisable gl_texture_2d
      	aglpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*0.15
   	   Var dzz1=zz1+(zz1-zz0)*0.5*0.15
   	   agltranslatef(px1+(pxx1-px1)*0.3+si1*0.15,py1+(pyy1-py1)*0.3-co1*0.15,dz1+(dzz1-dz1)*0.3)
   	   If taddshadowpanel=1 And dist<4000 Then
   	   	addshadowpanel(px1+(pxx1-px1)*0.3+si1*0.15,py1+(pyy1-py1)*0.3-co1*0.15,shadowlamptext,do1)
   	   EndIf
   	   aglrotatef(do1,0,0,1)
   	   Var sc=0.28
   	   aglscalef(sc,sc,sc)
   	   If tdark=1 Then agldisable gl_lighting
   	   If dist<4000 Then
   	   	If tdark=0 Then 
   	   		aglcalllist(lamplist)
   	   	Else
   	   		aglcalllist(lamplist2)
   	   	EndIf
   	   ElseIf tdark=1 Then 
   	   	aglcalllist(lamplist3)
   	   EndIf
   	   If tdark=1 Then aglenable gl_lighting
     	   aglpopmatrix 
         aglenable gl_texture_2d  
       EndIf
      EndIf  
      If taddlamp=0 And taddbarriere=1 And ((j>2 And j<n)Or(jj>1 And jj<di)) Then
       If max(Abs(px1-mx),Abs(py1-my))<3000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglenable gl_alpha_test
         aglalphafunc(gl_less,50/254)
         drawbuildtext=barrieretext
         aglbindtexture(gl_texture_2d,barrieretext)	
      	aglpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5
   	   Var dzz1=zz1+(zz1-zz0)*0.5
   	   agltranslatef(px1*0.25+pxx1*0.75+si1,py1*0.25+pyy1*0.75-co1,dz1*0.25+dzz1*0.75-1)
   	   If taddshadowquad=1 Then
   	   	Var xx=px1*0.25+pxx1*0.75+si1,yy=py1*0.25+pyy1*0.75-co1,zz=0'dz1*0.75+dzz1*0.25-1
   	   	Var d25=30.0/(r)
   	   	myshadowtext=barrieretext
   	      addshadowquad(xx-d25*co1,yy-d25*si1,zz,xx+co1*d25,yy+si1*d25,zz,15,2)
   	      myshadowtext=0   	   	
   	   EndIf
   	   aglrotatef(do1+90,0,0,1)
   	   Var dz=(zz1-z1)*0.5*60/(dr/di)
   	   agltexcarre2dz(60,15,dz)
   	   aglrotatef(90,0,0,1)
   	   agltranslatef(28,0,dz)
   	   agltexcarre2(2,15,0.2)
   	   agltranslatef(-56,0,-dz-dz)
   	   agltexcarre2(2,15,0.2)
     	   aglpopmatrix
      	aglpushmatrix
   	   agltranslatef(px1*0.75+pxx1*0.25+si1,py1*0.75+pyy1*0.25-co1,dz1*0.75+dzz1*0.25-1)
   	   If taddshadowquad=1 Then
   	   	Var xx=px1*0.75+pxx1*0.25+si1,yy=py1*0.75+pyy1*0.25-co1,zz=0'dz1*0.75+dzz1*0.25-1
   	   	Var d25=30.0/(r)
   	   	myshadowtext=barrieretext
   	      addshadowquad(xx-d25*co1,yy-d25*si1,zz,xx+co1*d25,yy+si1*d25,zz,15,2)   	   	
   	   	myshadowtext=0
   	   EndIf
   	   aglrotatef(do1+90,0,0,1)
   	   'Var dz=(zz1-z1)*0.5*60/(dr/di)
   	   agltexcarre2dz(60,15,dz)
   	   aglrotatef(90,0,0,1)
   	   agltranslatef(28,0,dz)
   	   agltexcarre2(2,15,0.2)
   	   agltranslatef(-56,0,-dz-dz)
   	   agltexcarre2(2,15,0.2)
     	   aglpopmatrix 
     	   agldisable gl_alpha_test
     	 EndIf        	
      ElseIf taddlamp=0 And taddhaie=1 And ((j>2 And j<n)Or(jj>1 And jj<di)) Then
       If max(Abs(px1-mx),Abs(py1-my))<3000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglenable gl_alpha_test
         aglalphafunc(gl_less,50/254)
         drawbuildtext=haietext
         aglbindtexture(gl_texture_2d,haietext)
         'glcolor3f(0.5,0.8,0.5)	 
      	aglpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5
   	   Var dzz1=zz1+(zz1-zz0)*0.5
   	   agltranslatef(px1*0.25+pxx1*0.75+si1,py1*0.25+pyy1*0.75-co1,dz1*0.25+dzz1*0.75-1)
   	   If taddshadowquad=1 Then
   	   	Var xx=px1*0.25+pxx1*0.75+si1,yy=py1*0.25+pyy1*0.75-co1,zz=0'dz1*0.25+dzz1*0.75-1
   	   	Var d25=25.0/(r)
   	      addshadowquad(xx-d25*co1,yy-d25*si1,zz,xx+co1*d25,yy+si1*d25,zz,20,2)   	   	
   	   EndIf
   	   aglrotatef(do1+90,0,0,1)
   	   Var dz=(zz1-z1)*0.5*50/(dr/di)
   	   agltexcarre2dz(50,20,dz)
   	   agltranslatef(6,0,0)
   	   agltexcarre2dz(50,20,dz)
   	   aglrotatef(90,0,0,1)
   	   agltranslatef(23,3,dz)
   	   agltexcarre2(6,20,1)
   	   agltranslatef(-46,0,-dz-dz)
   	   agltexcarre2(6,20,1)
     	   aglpopmatrix
      	aglpushmatrix
   	   agltranslatef(px1*0.75+pxx1*0.25+si1,py1*0.75+pyy1*0.25-co1,dz1*0.75+dzz1*0.25-1)
   	   If taddshadowquad=1 Then
   	   	Var xx=px1*0.75+pxx1*0.25+si1,yy=py1*0.75+pyy1*0.25-co1,zz=0'dz1*0.75+dzz1*0.25-1
   	   	Var d25=25.0/(r)
   	      addshadowquad(xx-d25*co1,yy-d25*si1,zz,xx+co1*d25,yy+si1*d25,zz,20,2)   	   	
   	   EndIf
   	   aglrotatef(do1+90,0,0,1)
   	   'Var dz=(zz1-z1)*0.5*50/(dr/di)
   	   agltexcarre2dz(50,20,dz)
   	   agltranslatef(6,0,0)
   	   agltexcarre2dz(50,20,dz)
   	   aglrotatef(90,0,0,1)
   	   agltranslatef(23,3,dz)
   	   agltexcarre2(6,20,1)
   	   agltranslatef(-46,0,-dz-dz)
   	   agltexcarre2(6,20,1)
     	   aglpopmatrix 
     	   aglcolor3f(1,1,1)
     	   agldisable gl_alpha_test
     	 EndIf        	
      EndIf
      Var testnathalie=0
      If taddnathalie=1 Then 
         If (j=Int(n/2) Or (j=Int(n*0.18)And j>2 And taddcitykm=0)) And jj=2 Then
         	testnathalie=1
         ElseIf n>12 Then 
            If (j=Int(n*0.7)) And jj=2 Then
         	    testnathalie=1
            EndIf     
         EndIf
      EndIf 	
      If testnathalie=1 Then  
       Var dist=max(Abs(px1-mx),Abs(py1-my))
       If dist<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor3f(1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*1.4
   	   Var dzz1=zz1+(zz1-zz0)*0.5*1.4
   	   agltranslatef(px1*0.5+pxx1*0.5+si1*1.4,py1*0.5+pyy1*0.5-co1*1.4,dz1*0.5+dzz1*0.5-1)
    	   If taddshadowpanel=1 Then addshadowpanel(px1*0.5+pxx1*0.5+si1*1.4,py1*0.5+pyy1*0.5-co1*1.4,shadowcitytext)
   	   aglrotatef(do1-190,0,0,1)
   	   aglcylindre(1,1,5.3,4,2)
   	   aglcolor3f(1,1,1)
   	   agltranslatef(0,0,5)
   	   aglenable gl_texture_2d
   	   If dist<distnathalie Then nathaliex=px1:nathaliey=py1
         If Int(px1/100)And 1 Then 
          If Int(py1/100)And 1 Then
          	if do1woman<350 And (Int(px1/40)Mod 3)=2 Then 
               drawbuildtext=mywomantext
               aglbindtexture(gl_texture_2d,mywomantext)
          	Else
               drawbuildtext=marisoltext
               aglbindtexture(gl_texture_2d,marisoltext)
               If dist<distnathalie Then distnathalie=dist:namenathalie="marisol"
          	EndIf 	
          Else 
            drawbuildtext=nathalietext
            aglbindtexture(gl_texture_2d,nathalietext)
            If dist<distnathalie Then distnathalie=dist:namenathalie="nathalie"
          EndIf  
         ElseIf (Int(px1/40)Mod 3)=1 Then  
           drawbuildtext=veroniquetext
           aglbindtexture(gl_texture_2d,veroniquetext)
           If dist<distnathalie Then distnathalie=dist:namenathalie="veronique"
         ElseIf (Int(px1/40)And 1) Then  
           drawbuildtext=christinetext
           aglbindtexture(gl_texture_2d,christinetext)
           If dist<distnathalie Then distnathalie=dist:namenathalie="valerie"'"christine"
         Else  
           drawbuildtext=cocacolatext
           aglbindtexture(gl_texture_2d,cocacolatext)
           If dist<distnathalie Then distnathalie=dist:namenathalie="jane"'"cocacola"
         EndIf
         'glbindtexture(gl_texture_2d,onewaytext)
         'glcolor4f(0.14,0.14,0.14,1)
         'glenable gl_alpha_test
         'glAlphaFunc(gl_less,10/254)
         If drawbuildtext=mywomantext Then
         	agltexrotcarre2(35,41,do1woman)
         Else 	
         	agltexcarre2(35,41)
         	If drawbuildtext=cocacolatext Then
         		agltranslatef(-1,0,0)
         		agltexcarre2(-35,41)
         	EndIf
         EndIf
         'glcolor4f(1,1,1,1)
         'gldisable gl_alpha_test
         /'gltranslatef(1,-17,37)
         Var lat0=lat,lng0=lng
         mxytolatlng(px1+dmx0,py1+dmy0)
         Var lati=lat,lngi=lng
         lat=lat0:lng=lng0
         Var jreverse=getreversei(lati,lngi) 
         If jreverse>0 Then agldrawtext3D(Left(namereversei(jreverse),14),5)
         '/
         aglpopmatrix
       EndIf
      EndIf  
      If taddcross=1 And (j=n) And jj=di Then 
       If max(Abs(pxx1-mx),Abs(pyy1-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor4f(1,1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   'Var dz1=z1+(z1-z0)*0.5*0.3
   	   Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   agltranslatef(pxx1-co1+si1*0.3,pyy1-si1-co1*0.3,dzz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(pxx1-co1+si1*0.3,pyy1-si1-co1*0.3,shadowcrosstext)
   	   aglrotatef(do1-190,0,0,1)
   	   aglcylindre(0.75,0.75,20.3,4,2)
   	   aglcolor4f(1,1,1,1)
   	   agltranslatef(0,0,20)
   	   aglenable gl_texture_2d
         drawbuildtext=crosstext
         aglbindtexture(gl_texture_2d,crosstext)
         aglenable gl_alpha_test
         aglalphafunc(gl_less,100/254)
         agltexcarre2(15,15)
         agltranslatef(-0.3,0,1)
         aglcolor4f(0.06,0.06,0.06,1)
         agltexcarre2(12,12)
         aglcolor4f(1,1,1,1)
         agldisable gl_alpha_test
         aglpopmatrix
       EndIf
      EndIf  
      If taddcross2=1 And (j=2) And jj=1 Then 
       If max(Abs(px0-mx),Abs(py0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor4f(1,1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   Var dz1=z0+(z0-z1)*0.5*0.3
   	   'Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   agltranslatef(px0+co1-si1*0.3,py0+si1+co1*0.3,dz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(px0+co1-si1*0.3,py0+si1+co1*0.3,shadowcrosstext)
   	   aglrotatef(do1-190+180,0,0,1)
   	   aglcylindre(0.75,0.75,20.3,4,2)
   	   aglcolor4f(1,1,1,1)
   	   agltranslatef(0,0,20)
   	   aglenable gl_texture_2d
         drawbuildtext=crosstext
         aglbindtexture(gl_texture_2d,crosstext)
         aglenable gl_alpha_test
         aglalphafunc(gl_less,100/254)
         agltexcarre2(15,15)
         agltranslatef(-0.3,0,1)
         aglcolor4f(0.06,0.06,0.06,1)
         agltexcarre2(12,12)
         aglcolor4f(1,1,1,1)
         agldisable gl_alpha_test
         aglpopmatrix
       EndIf
      EndIf  
      If taddrail=1 And (j=n) And jj=di Then 
       If max(Abs(pxx1-mx),Abs(pyy1-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor4f(1,1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   'Var dz1=z1+(z1-z0)*0.5*0.3
   	   Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   agltranslatef(pxx1-co1+si1*0.3,pyy1-si1-co1*0.3,dzz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(pxx1-co1+si1*0.3,pyy1-si1-co1*0.3,shadowcrosstext)
   	   aglrotatef(do1-190,0,0,1)
   	   aglcylindre(0.75,0.75,20.3,4,2)
   	   aglcolor4f(1,1,1,1)
   	   agltranslatef(0,0,20)
   	   aglenable gl_texture_2d
         drawbuildtext=crossrailtext
         aglbindtexture(gl_texture_2d,crossrailtext)
         aglenable gl_alpha_test
         aglalphafunc(gl_less,100/254)
         agltexcarre2(15,15)
         agltranslatef(-0.3,0,1)
         aglcolor4f(0.06,0.06,0.06,1)
         agltexcarre2(12,12)
         aglcolor4f(1,1,1,1)
         agldisable gl_alpha_test
         aglpopmatrix
       EndIf
      EndIf  
      If taddrail2=1 And (j=2) And jj=1 Then 
       If max(Abs(px0-mx),Abs(py0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor4f(1,1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   Var dz1=z0+(z0-z1)*0.5*0.3
   	   'Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   agltranslatef(px0+co1-si1*0.3,py0+si1+co1*0.3,dz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(px0+co1-si1*0.3,py0+si1+co1*0.3,shadowcrosstext)
   	   aglrotatef(do1-190+180,0,0,1)
   	   aglcylindre(0.75,0.75,20.3,4,2)
   	   aglcolor4f(1,1,1,1)
   	   agltranslatef(0,0,20)
   	   aglenable gl_texture_2d
         drawbuildtext=crossrailtext
         aglbindtexture(gl_texture_2d,crossrailtext)
         aglenable gl_alpha_test
         aglalphafunc(gl_less,100/254)
         agltexcarre2(15,15)
         agltranslatef(-0.3,0,1)
         aglcolor4f(0.06,0.06,0.06,1)
         agltexcarre2(12,12)
         aglcolor4f(1,1,1,1)
         agldisable gl_alpha_test
         aglpopmatrix
       EndIf
      EndIf  
      If tparking=1 And ((j Mod 2)=0) And j<n And jj=1 Then 
       If max(Abs(px0-mx),Abs(py0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor4f(1,1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*0.3
   	   'Var dzz1=zz1+(zz1-zz0)*0.5*0.3
   	   agltranslatef(px1+si1*0.3,py1-co1*0.3,dz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(px1+si1*0.3,py1-co1*0.3,shadowparkingtext)
   	   aglrotatef(do1-190+180,0,0,1)
   	   aglcylindre(0.75,0.75,20.3,4,2)
   	   aglcolor4f(1,1,1,1)
   	   agltranslatef(0,0,20)
   	   aglenable gl_texture_2d
         drawbuildtext=parkingtext
         aglbindtexture(gl_texture_2d,parkingtext)
         aglenable gl_alpha_test
         aglalphafunc(gl_less,100/254)
         agltexcarre2(15,15)
         agltranslatef(-0.3,0,0)
         agltexcarre2(-15,15)
         aglcolor4f(1,1,1,1)
         agldisable gl_alpha_test
         aglpopmatrix
       EndIf
      EndIf  
      If taddoneway=1 And (j=n) And jj=di Then 
       If max(Abs(pxx0-mx),Abs(pyy0-my))<4000 Then 	
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor4f(1,1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   'Var dz1=z1+(z1-z0)*0.5*0.3
   	   Var dzz1=zz0+(zz0-zz1)*0.5*0.3
   	   agltranslatef(pxx0-co1-si1*0.3,pyy0-si1+co1*0.3,dzz1-1)
   	   If taddshadowpanel=1 Then addshadowpanel(pxx0-co1-si1*0.3,pyy0-si1+co1*0.3,shadowonewaytext)
   	   aglrotatef(do1-190+180,0,0,1)
   	   aglcylindre(0.75,0.75,20.3,4,2)
   	   aglcolor4f(1,1,1,1)
   	   agltranslatef(0,0,20)
   	   aglenable gl_texture_2d
         drawbuildtext=onewaytext
         aglbindtexture(gl_texture_2d,onewaytext)
         aglenable gl_alpha_test
         aglalphafunc(gl_less,100/254)
         agltexcarre2(10.5,10.5)
         agltranslatef(-0.3,0,1)
         aglcolor4f(0.06,0.06,0.06,1)
         agltexcarre2(8.2,8.2)
         aglcolor4f(1,1,1,1)
         agldisable gl_alpha_test
         aglpopmatrix
       EndIf
      EndIf  
      If taddcity=1 And (j=max2(1,Int(n/3))) And jj=2 And cityname2<>"" Then 
       If max(Abs(px1-mx),Abs(py1-my))<4000 Then 
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor3f(1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*1.1
   	   Var dzz1=zz1+(zz1-zz0)*0.5*1.1
   	   agltranslatef(px1*0.5+pxx1*0.5+co1+si1*1.1,py1*0.5+pyy1*0.5+si1-co1*1.1,dz1*0.5+dzz1*0.5-1)
    	   If taddshadowpanel=1 Then addshadowpanel(px1*0.5+pxx1*0.5+co1+si1*1.1,py1*0.5+pyy1*0.5+si1-co1*1.1,shadowcitytext)
   	   aglrotatef(do1-190,0,0,1)
   	   aglscalef(1.2,1.2,1.2)
   	   aglcylindre(1,1,9.3,4,2)
   	   aglcolor3f(0,0,0.8)
   	   agltranslatef(0,0,9)
   	   Var ltext=min2(18,Len(cityname2))
         aglcarre2(36*ltext/14,8)
         agltranslatef(1,-17*ltext/14,2)
   	   aglcolor3f(1,1,1)
   	   aglenable gl_texture_2d
         drawbuildtext=nathalietext
         agldrawtext3D(Left(cityname2,ltext),5)
         aglpopmatrix
   	   aglcolor3f(1,1,1)
       EndIf
      EndIf  
      If taddcity=1 And (j=max2(1,Int(n/3))) And jj=2 And cityname1<>"" And toneway=0 Then 
       If max(Abs(px0-mx),Abs(py0-my))<4000 Then 
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor3f(1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   Var dz0=z0+(z0-z1)*0.5*1.1
   	   Var dzz0=zz0+(zz0-zz1)*0.5*1.1
   	   agltranslatef(px0*0.5+pxx0*0.5-si1*1.1,py0*0.5+pyy0*0.5+co1*1.1,dz0*0.5+dzz0*0.5-1)
   	   If taddshadowpanel=1 Then addshadowpanel(px0*0.5+pxx0*0.5-si1*1.1,py0*0.5+pyy0*0.5+co1*1.1,shadowcitytext)
   	   aglrotatef(do1-190+180,0,0,1)
   	   aglscalef(1.2,1.2,1.2)
   	   aglcylindre(1,1,9.3,4,2)
   	   aglcolor3f(0,0,0.8)
   	   agltranslatef(0,0,9)
   	   Var ltext=min2(18,Len(cityname1))
         aglcarre2(36*ltext/14,8)
         agltranslatef(1,-17*ltext/14,2)
   	   aglcolor3f(1,1,1)
   	   aglenable gl_texture_2d
         drawbuildtext=nathalietext
         agldrawtext3D(Left(cityname1,ltext),5)
         aglpopmatrix
   	   aglcolor3f(1,1,1)
       EndIf
      EndIf  
      If taddcitykm=1 And (j=max2(2,Int(n/4))) And jj=2 Then
       If max(Abs(px1-mx),Abs(py1-my))<4000 Then 
       	Var do1=townwaynodeo1(ij,i,j)
       	If do1>990 Then
       		do1=diro1(co1,si1):townwaynodeo1(ij,i,j)=do1
       	EndIf
         aglcolor3f(1,1,1)
         agldisable gl_texture_2d	 
      	aglpushmatrix
   	   Var dz1=z1+(z1-z0)*0.5*1.2
   	   Var dzz1=zz1+(zz1-zz0)*0.5*1.2
   	   agltranslatef(px1*0.5+pxx1*0.5-co1+si1*1.2,py1*0.5+pyy1*0.5-si1-co1*1.2,dz1*0.5+dzz1*0.5-1)
    	   If taddshadowpanel=1 Then addshadowpanel(px1*0.5+pxx1*0.5-co1+si1*1.2,py1*0.5+pyy1*0.5-si1-co1*1.2,shadowcitykmtext)
   	   aglrotatef(do1-190,0,0,1)
   	   aglscalef(1.2,1.2,1.2)
   	   aglcylindre(1,1,9.3,4,2)
   	   aglcolor3f(0,0,0.8)
   	   agltranslatef(0,0,9)
         aglcarre2(37,38)
         agltranslatef(1,-17.5,32)
   	   aglcolor3f(1,1,1)
   	   aglenable gl_texture_2d
         drawbuildtext=nathalietext
         If citynamekm1<>"" Then 
           agldrawtext3D(Left(UCase(citynamekm1),10),5)
           Var k26=27.5+(3-Len(citykm1))*2
           agltranslatef(0,k26,0)
           agldrawtext3D(citykm1,5)
           agltranslatef(0,-k26,-7)
         EndIf 
         If citynamekm2<>"" Then 
           agldrawtext3D(Left(citynamekm2,10),5)
           Var k26=27.5+(3-Len(citykm2))*2
           agltranslatef(0,k26,0)
           agldrawtext3D(citykm2,5)
           agltranslatef(0,-k26,-7)
         EndIf 
         If citynamekm3<>"" Then 
           agldrawtext3D(Left(citynamekm3,10),5)
           Var k26=27.5+(3-Len(citykm3))*2
           agltranslatef(0,k26,0)
           agldrawtext3D(citykm3,5)
         EndIf 
         aglpopmatrix
   	   aglcolor3f(1,1,1)
       EndIf
      EndIf
   EndIf 'testmygltexquad   
      tx0+=tx
   Next
 Next
 txroad=tx0:If txroad>100 Then txroad-=100
aglcolor3f(1,1,1)
aglenable(gl_texture_2d)
If tdark=1 Then
  	aglenable(gl_lighting)
   aglenable(gl_normalize)
   tnight=0:tlight=1
Else
   agldisable(gl_lighting)
   agldisable(gl_normalize)
EndIf   
'agldisable(gl_lighting)
End Sub
Declare Sub drawwaynodebuild(ij As Integer,i As Integer)
Sub drawtownnode(ij As Integer)
Dim As Integer i,j,k,n,p
'If taglcompile<>1 Then Exit sub
 If townnwaynode(ij)>0 Then
 	If testtownshow=0 And scaleview>0.9 Then
 			If townshow(ij)=0 Then Exit Sub
   elseIf testtownshow2=0 And scaleview<0.9 Then 
 			If townshow2(ij)=0 Then Exit Sub
 	ElseIf testtownshow=1 And scaleview>0.9 Then
 			townshow(ij)=0
 	ElseIf testtownshow2=1 And scaleview<0.9 Then
 			townshow2(ij)=0 			
 	EndIf


 	txroad=0
 	Var kh0=0.9
 	getlocktown2(ij)
 	nshowtown+=1
 	'If taglcompile2<>2 Then testtownshow=0:testtownshow2=0
 	For i=1 To townnwaynode(ij)
 		Var testshow=0
      If testtownshow=0 And scaleview>0.9 Then
	        testshow=1
	        If townwaynodeshow(ij,i)=0 Then Continue For
      ElseIf testtownshow2=0 And scaleview<0.9 Then
	        testshow=1
	        If townwaynodeshow2(ij,i)=0 Then Continue For
      ElseIf testtownshow=1 And scaleview>0.9 Then	
         townwaynodeshow(ij,i)=0
         If i>1 And testmygltexquad0=1 Then
       	    townwaynodeshow(ij,i-1)=1
      	    townshow(ij)=1
         EndIf 
      ElseIf testtownshow2=1 And scaleview<0.9 Then
         townwaynodeshow2(ij,i)=0
         If i>1 And testmygltexquad0=1 Then
       	    townwaynodeshow2(ij,i-1)=1
      	    townshow2(ij)=1
         EndIf 
      EndIf
      
  	nshowbuild+=1
   If testshow=0 Then  
      testmygltexquad0=0
      'If InStr(LCase(townwayname(ij,i)),"ge henri")>0 Then auxvar+=1:auxtest=0.8
 		If towniwaynode(ij,i)>1 And townwaynodeid(ij,i)<>0 Then
        Var waynodebuild=townwaynodebuild(ij,i)
        'If waynodebuild=100 And taglcompile<>1 And taglcompile2<>1 Then Continue For   	
        'If waynodebuild<>100 And taglcompile2<>1 And taglcompile2<>1 Then Continue For   	
        'If waynodebuild<>100 and (sizei>300 or sizei<0.01) Then
        '	  If testnearairport(x,y,18000)=1 Then
        '	  	  'kdistterrain=kdistterrainsave*5
        '	  EndIf
        'EndIf
        Var hh=townwaynodeh(ij,i)
        If hh>4000 And waynodebuild=4 Then
        	  Var hmin=Int(hh/4000):hh-=4000*hmin
        EndIf
        If waynodebuild<>100 Then 
         Var hhh=0.0
         If mz>mzsol00+7000 then hhh=200
         If mz>mzsol00+9500 Then hhh=300
         If hh<hhh Then Continue For  
 		  EndIf 
 		  Var d50000=50000.0:If plane=0 Or car>0 Then d50000=35000
 		  Var sizei=townwaynodesize(ij,i)
 		  If sizei>320 Then
 		  	If hh>99 And sizei<3900*(100+hh)/140 And waynodebuild<>100 Then d50000+=35*sizei
 		  ElseIf sizei<0.01 Then 
 		  	If hh>99 And waynodebuild<>100 Then d50000+=35000
 		  EndIf
        'If InStr(townwayname(ij,i),"ge Henri")>0 Then auxvar=sizei+0.1:auxtest=0.8
 		  If plane>0 And car=0 Then
 		  	  d50000*=kdistterrain*max(2.0,200/(10+Abs(vkm)))
 		  Else 
 		  	  d50000*=kdistterrain*max(1.0,90/(15+Abs(vkm)))
 		  EndIf
 		  Var hh1=hh-(avgbuildh0)*2.5
 		  If hh1>500 And waynodebuild<>100 Then
 		  	  If hh1>1000 Then
 		  	  	 d50000+=min(70000.0,40*hh1)
 		  	  Else
 		  	  	 d50000+=10*hh1
 		  	  EndIf
 		  EndIf
 		  Var x=townwaynodex(ij,i,1)
 		  If Abs(x-mx)>d50000 And waynodebuild<>100 Then Continue For 
 		  Var y=townwaynodey(ij,i,1)
 		  If Abs(y-my)>d50000 And waynodebuild<>100  Then Continue For
 		  Var z=townwaynodez(ij,i)
 		  If z<-99990 Or tupdatetown=1 Then
 		  	z=getterrainheight(x,y):townwaynodez(ij,i)=z:If z<-99990 And waynodebuild<>100 Then Continue For 
 		  EndIf
 		  townzsol=z
 		  Var kxx=14000.0
 		  kxx*=2*kdistterrain
        Var troad=0,trunway=0,tparking=0,toneway=0,trail=0,r=1.0
        If waynodebuild=100 Then
        	  kxx+=2000:troad=1
        	  r=max(5.0,townwaynodeh(ij,i))
           If r>2000 Then r-=2000:tparking=1
           If r>1000 Then r-=1000:toneway=1
           If r<0.3*30 Then trail=1
           If r>2.5*30 then trunway=1
           Var hhh=0.0
           If mz>mzsol00+7000 then hhh=1.7*30
           if mz>mzsol00+8500 then hhh=2.4*30
           If mz>mzsol00+10000 Then hhh=2.7*30
           if r<hhh then continue for 
        EndIf
 		  If plane=0 Or car>0 Then kxx*=0.7'0.5
 		  If (sizei<0.5 Or townwaynodesize40(ij,i)<0.5) And troad=0 Then
 		  	  Var xmin=x,ymin=y,xxmax=x,yymax=y
 		  	  For j=2 To towniwaynode(ij,i)
 		  	  	xmin=min(xmin,townwaynodex(ij,i,j))
 		  	  	ymin=min(ymin,townwaynodey(ij,i,j))
 		  	  	xxmax=max(xxmax,townwaynodex(ij,i,j))
 		  	  	yymax=max(yymax,townwaynodey(ij,i,j))
 		  	  Next
 		  	  'sizei=max(xmax-xmin,ymax-ymin)*1.4
 		  	  sizei=(xxmax-xmin+yymax-ymin)*0.7
	  	     Var sizei40=getsizei40(ij,i)
 		  	  If sizei40>(sizei+sizei+sizei)Then sizei40=599999
 		  	  sizei=max(sizei,sizei40)  
 		  	  townwaynodesize(ij,i)=sizei
 		  	  townwaynodesize40(ij,i)=1
           'If InStr(townwayname(ij,i),"ge Henri")>0 Then auxvar2=sizei+0.1:auxtest=0.8
 		  ElseIf troad=1 Then 
 		  	  sizei=0	  
 		  EndIf
        'If InStr(townwayname(ij,i)," Henri")>0 And troad=0 Then auxvar=sizei+0.11:auxtest=0.8
 		  If sizei>30000 Then'15000 Then
           'If InStr(townwayname(ij,i)," Henri")>0 Then auxvar=sizei+0.1:auxtest=0.8
 		  	  townwaynodeid(ij,i)=0
 		  	  towniwaynode(ij,i)=0
 		  	  townwaynodesize(ij,i)=0
           Var i40=0
           If kmxlat>10 Then i40=towni40(ij,i)
           If i40>0 Then
              resettown40i(i40) 	
 		  	  EndIf 
 		  	  Continue For 
 		  EndIf
 		  Var d7000=distradar
        If Abs(x-mx)<d7000 Then
        	If Abs(y-my)<d7000 And plane>0 And car>0 And scaleview>0.9 Then
        		If waynodebuild=12 Then addradar(x,y,1)'church
        		If waynodebuild=15 Then addradar(x,y,2)'railstation
        		If waynodebuild=16 Then addradar(x,y,3)'hospital
        		If waynodebuild=18 Then addradar(x,y,5)'school
        		If waynodebuild=13 Then addradar(x,y,8)'shop
        	EndIf
        EndIf
 		  Var test=0
 		  rotavion(x-mx,y-my,(z-mz)*0.5)
        'If InStr(townwayname(ij,i)," Henri")>0 And troad=0 Then auxvar+=1:auxtest=0.8
 		  'If x2>(0.9*Abs(y2)-(kxx+sizei+sizei)) And troad=0 Then
 		  If x2>(0.9*Abs(y2)-(kxx*0.1+sizei+sizei)) And troad=0 Then
 		  	  test=1
 		  EndIf 	  
 		  If troad=1 Then 'road
 		     n=towniwaynode(ij,i)
 		     Var xx=x,yy=y,dk=1
 		     For j=2 To n
 		      xx=x:yy=y
 		      x=townwaynodex(ij,i,j)-dmx0
 		      y=townwaynodey(ij,i,j)-dmy0
 		      dk=max2(1,Int((Abs(x-xx)+Abs(y-yy))/500))
 		      'If dk>=1 Then
 		      	Var dx=(x-xx)/dk
 		     	  	Var dy=(y-yy)/dk
 		     	  	Var d4000=4000*kdistroad
 		     	  	If trunway=1 Then
 		     	  		If mz>mzsol0+200 Then
 		     	  			If r<4*30 Then
 		     	  				d4000*=4
 		     	  			Else
 		     	  				d4000*=8
 		     	  			EndIf
 		     	  		Else
 		     	  			d4000*=2
 		     	  		EndIf
 		     	  		distrunway4000=d4000
 		     	  	Else
 		     	  		d4000=min(10000.0,d4000+(mz-mzsol0)*2)
 		     	  		distrunway4000=d4000
 		     	  	EndIf
 		     	  	'auxvar=distrunway4000:auxtest=0.3
 		     	  	For k=1 To dk
 		     	  	 xx+=dx:yy+=dy	
 		          rotavion(xx-mx,yy-my,0)
 		     	    If x2<d4000 Then'4000
 		            If x2*kdistroad>(0.9*Abs(y2)-kxx) Then
 		     	        x=xx:y=yy
 		     	        test=1:Exit For,For
 		     	      endif     
 		          EndIf
 		     	  	Next k
 		      'EndIf 
 		     Next j  
 		  EndIf
 		  If test=0 Then
 		  	  If (mz-mzsol0)<700 Then
 		  	  	Continue For
 		  	  Else 
 		  	  	'i+=6
 		  	  	Continue For'Exit Sub 
 		  	  EndIf
 		  EndIf
        'If InStr(townwayname(ij,i)," Henri")>0 and troad=0 Then auxvar+=1:auxtest=0.8
 		  'If x2<(0.9*Abs(y2)-kxx*0.5) Then Continue For 
        Var h=700.0
        If troad=0 Then
 		     h=hh'max(20.0,townwaynodeh(ij,i))
           h=setbuildh(h)
        EndIf 
 		  thmin=0:If waynodebuild=4 Then thmin=1':h=400
        Var kh=kh0:If h>600 And thmin=0 Then kh=2
        If plane=0 Or car>0 Then kh*=0.31*scaleview
        'h*=scalexyh
 		  Var dyy=0.9*Abs(y2)-h*1.4-1400'-400-1800 		  
        'If InStr(townwayname(ij,i)," Henri")>0 Then auxvar=sizei:auxtest=0.8
        'If (x2>dyy And z>waterz0 And h>1)Or mapdisplay>=4 Then
        If (x2>dyy-sizei-sizei And h>1)Or mapdisplay>=4 Or troad=1 Then
          'If InStr(townwayname(ij,i)," Henri")>0 And troad=0 Then auxvar+=1:auxtest=0.8
          If troad=0 And sizei<2000 And hh1<1000 Then 
           Var dxx=dxterrain*scalex*kdistterrain*kh*max(1.0,h/450)
           Var i3=0':If nnodes<300 Then i3=0
           If x2>(dxx+9000*scaleview) Then i+=i3:Continue For'Exit Sub 
           'If Abs(x-mx)>(dxx+9000) Then i+=i3:Continue For'Exit Sub'*kh
           'If Abs(y-my)>(dxx+9000) Then i+=i3:Continue For'Exit Sub'*kh 
           If Abs(x-mx)>dxx+5000 Then kh0=0:Continue For'30000 Then
           If Abs(y-my)>dxx+5000 Then kh0=0:Continue For'30000 Then
      	 EndIf 
          If troad=1 And scaleview<0.9 Then 
           Var dxx=dxterrain*scalex*kdistterrain*0.5'*scaleview'kh
           If x2>(dxx+2500.0) Then Continue For'Exit Sub 
           If Abs(x-mx)>dxx+2500.0 Then Continue For'30000 Then
           If Abs(y-my)>dxx+2500.0 Then Continue For'30000 Then
          EndIf
          'If InStr(townwayname(ij,i)," Henri")>0 And troad=0 Then auxvar+=1:auxtest=0.8
          waynodebuildx(ij,i)=x
          waynodebuildy(ij,i)=y
          waynodebuildh(ij,i)=h
          waynodebuildx2(ij,i)=x2
          drawwaynodebuild(ij,i)
         EndIf  
 		EndIf
   Else
   	drawwaynodebuild(ij,i)
   EndIf 
   
 	Next i
 	thmin=0
 	freelocktown(ij)
   If scaleview>0.9 Then 
    If testtownshow=1 Then 
     If i>1 And testmygltexquad0=1 Then
    	    townwaynodeshow(ij,i-1)=1
    	    townshow(ij)=1
     EndIf 
    EndIf
   Else
    If testtownshow2=1 Then
     If i>1 And testmygltexquad0=1 Then 
    	    townwaynodeshow2(ij,i-1)=1
    	    townshow2(ij)=1	
     EndIf
    EndIf  
   EndIf   
 EndIf	
End sub
Sub drawwaynodebuild(ij As Integer,i As Integer) 	 		
      	 Var waynodebuild=townwaynodebuild(ij,i)
          drawbuildtext=building3text
          If housetext=0 Then glbindtexture(gl_texture_2d,housetext)
          Var h=waynodebuildh(ij,i)
          Var x2=waynodebuildx2(ij,i)
          Var sizei=townwaynodesize(ij,i)
          Var x=waynodebuildx(ij,i)
          Var y=waynodebuildy(ij,i)
          Var troad=0
          If waynodebuild=100 Then troad=1
          If h<120 And troad=0 Then
          	Var n=towniwaynode(ij,i)
          	If Abs(x-townwaynodex(ij,i,Int(n*0.5)))<300 Then
          	 If Abs(y-townwaynodey(ij,i,Int(n*0.5)))<300 Then
          		drawbuildtext=housetext
          	 EndIf 	
          	EndIf
          EndIf
          drawbuildname=townwayname(ij,i)
          drawbuildtx=1:drawbuildty=1
      	 Var r=-1.0,g=0.0,b=0.0
          If 0 then'townwaynodevie(ij,i)<-1 Then 
               glcolor3f(1,0,0)
          Else 
   			/'If waytype(k)="terminal" Then
   				townwaynodebuild(ij,i)=11
   			ElseIf waytheight(k)=1 Then
   				townwaynodebuild(ij,i)=4+Int(Rnd*3)
   				If wayheight(k)>=4000 Then townwaynodebuild(ij,i)=5'+Int(Rnd*2) 
   				if wayheightmin(k)>10 and wayheight(k)<4000 then
   				 townwaynodebuild(ij,i)=4
   				 townwaynodeh(ij,i)=wayheight(k)+Int(wayheightmin(k))*4000
   				endif  
   				townwaynoder(ij,i)=wayr(k)
   				townwaynodeg(ij,i)=wayg(k)
   				townwaynodeb(ij,i)=wayb(k)
   			ElseIf waytheight(k)=2 Then
   				townwaynodebuild(ij,i)=10'bridge
   				'townwaynodeh(ij,i)=h
   			ElseIf waytheight(k)=100 Then
   				townwaynodebuild(ij,i)=100'highway
   			ElseIf waytheight(k)=4 Then
   				townwaynodebuild(ij,i)=12'church
   			ElseIf waytheight(k)=5 Then
   				townwaynodebuild(ij,i)=13'shop
   			ElseIf waytheight(k)=6 Then
   				townwaynodebuild(ij,i)=14'official
   			ElseIf waytheight(k)=7 Then
   				townwaynodebuild(ij,i)=15'railstation
   			ElseIf waytheight(k)=8 Then
   				townwaynodebuild(ij,i)=16'hospital
   			Else 
      			townwaynodebuild(ij,i)=1+Int(Rnd*3)
      		EndIf '/
      		   If plane=0 Then timesoundarcade0=0
           	   If waynodebuild=100 Then'highway
           	      If roadtext=0 Then glbindtexture(gl_texture_2d,roadtext)
           	      If roadbandtext=0 Then glbindtexture(gl_texture_2d,roadbandtext)
           	      If roadarrowtext=0 Then glbindtexture(gl_texture_2d,roadarrowtext)
           	      If roadarrow2text=0 Then glbindtexture(gl_texture_2d,roadarrow2text)
           	      If roadlefttext=0 Then glbindtexture(gl_texture_2d,roadlefttext)
           	      If roadarrowlefttext=0 Then glbindtexture(gl_texture_2d,roadarrowlefttext)
           	      If roadarrow2lefttext=0 Then glbindtexture(gl_texture_2d,roadarrow2lefttext)
           	      If railtext=0 Then glbindtexture(gl_texture_2d,railtext)
            	   drawbuildtext=roadtext
            	   glcolor3f(1,1,1)
            	   h=400
            	ElseIf waynodebuild=11 Then
            	   glcolor3f(0,0.6,1)
            	   r=0:g=0.6:b=1
            	ElseIf waynodebuild=6 And h>200 Then
            	   glcolor3f(0.2,1,0.7)
            	   r=0.2:g=1:b=0.7
            	ElseIf waynodebuild=11 Then'terminal
            	   glcolor3f(0.5,1,0.5)
            	   h=400
            	ElseIf waynodebuild=12 Then'church
            	   If churchtext=0 Then glbindtexture(gl_texture_2d,churchtext)
            	   drawbuildtext=churchtext
            	   drawbuildtx=4.5:drawbuildty=4
            	   glcolor3f(0.5,0.6,0.4)
            	   If x2>0.8*max(Abs(y2),Abs(y2)) And x2<570 Then soundvoyage()
            	   h=400
            	ElseIf waynodebuild=13 Then'shop
            	   If shoptext=0 Then glbindtexture(gl_texture_2d,shoptext)
            	   drawbuildtext=shoptext
            	   drawbuildtx=0.5:drawbuildty=0.5
            	   glcolor3f(0.9,0.6,0.9)
            	   If x2>0.8*max(Abs(y2),Abs(y2)) And x2<770 Then soundvoyage(4,LCase(drawbuildname))
            	   h=400
            	ElseIf waynodebuild=14 Then'official
            	   If officialtext=0 Then glbindtexture(gl_texture_2d,officialtext)
            	   drawbuildtext=officialtext
            	   drawbuildtx=2:drawbuildty=2
            	   glcolor3f(0.999,0.999,0.6)
            	   h=400
            	ElseIf waynodebuild=15 Then'railstation
           	      If railstationtext=0 Then glbindtexture(gl_texture_2d,railstationtext)
            	   drawbuildtext=railstationtext
            	   glcolor3f(0.85,1,1)'(0.9,0.5,0.5)
            	   If x2>0.8*max(Abs(y2),Abs(y2)) And x2<770 Then soundvoyage(1)
            	   h=400
            	ElseIf waynodebuild=16 Then'hospital
            	   If hospitaltext=0 Then glbindtexture(gl_texture_2d,hospitaltext)
            	   drawbuildtext=hospitaltext
            	   glcolor3f(0.82,0.62,0.62)
            	   If x2>0.8*max(Abs(y2),Abs(y2)) And x2<770 Then soundvoyage(2)
            	   h=400
            	ElseIf waynodebuild=17 Then'fuel
           	      If fueltext=0 Then glbindtexture(gl_texture_2d,fueltext)
            	   drawbuildtext=fueltext
            	   glcolor3f(1,1,1)
            	   h=400
            	ElseIf waynodebuild=18 Then'school
            	   If officialtext=0 Then glbindtexture(gl_texture_2d,officialtext)
            	   drawbuildtext=officialtext
            	   drawbuildtx=3.5:drawbuildty=2
            	   glcolor3f(0.48,0.44,1)
            	   r=0.48:g=0.44:b=1
            	   If x2>0.8*max(Abs(y2),Abs(y2)) And x2<770 Then soundvoyage(3)
            	   h=400
            	ElseIf waynodebuild>=10 Then
            	   glcolor3f(0.5,1,0.5)
            	   r=0.5:g=1:b=0.5
            	   h=400
            	ElseIf waynodebuild>=4 Then
            	   glcolor3f(0.85,1,1)
            	   r=0.85:g=1:b=1
            	ElseIf waynodebuild=3 And h>200 Then
            	   glcolor3f(0,1,1)
            	   r=0:g=1:b=1
            	Else	
            		glcolor3f(0.85,0.85,0.85)
            		r=0.85:g=0.85:b=0.85
            	EndIf
          EndIf
          If tdark=1 Then
          	glenable(gl_lighting)
 	         glenable(gl_normalize)
            tnight=0:tlight=1
          Else
            gldisable(gl_lighting)
 	         'gldisable(gl_normalize)
          EndIf   
	       glpushmatrix
 		    'If ij=(i50+2)*i101+i50 Then
 		    '  gltranslatef(x,y,z)
 		    '  gltexsphere 500
 		    'Else
 		    If townwaynoder(ij,i)>0.1 Then
 		    	r=townwaynoder(ij,i)
 		    	g=townwaynodeg(ij,i)
 		    	b=townwaynodeb(ij,i)
 		    EndIf
 		    'If townwaynodeh(ij,i)>400 Then r=1:g=0:b=0
 		    thmin=0:If waynodebuild=4 Then thmin=1
          If waynodebuild<>100 And scaleview>0.9 Then
          	Var kh=3*h/(200+h+waynodebuild)
          	If tourelle=0 Then
          		If y2>0 Then
          			gltranslatef((cos1-sin1)*kh,(sin1+cos1)*kh,0)
          		Else 	
          			gltranslatef((cos1+sin1)*kh,(sin1-cos1)*kh,0)
          		EndIf
          	Else
          		If y2>0 Then
          			gltranslatef((tcos1-tsin1)*kh,(tsin1+tcos1)*kh,0)
          		Else 	
          			gltranslatef((tcos1+tsin1)*kh,(tsin1-tcos1)*kh,0)
          		EndIf
          	EndIf
          EndIf
          'If InStr(townwayname(ij,i)," Henri")>0 Then auxvar+=1:auxtest=0.8
 		    If waynodebuild=100 Then
 		    	drawroadnode(ij,i)
 		    ElseIf x2>2500-300+sizei And (plane=0 Or car>0) Then
 		    	If Abs(x-mx)<1200 And Abs(y-my)<1200 Then ntownnear+=1
 		    	drawbuildingnodefast(ij,i,1,r,g,b)
 		    ElseIf x2>5000+sizei*5 And (plane=1 And car=0) Then 	
 		    	If Abs(x-mx)<1200 And Abs(y-my)<1200 Then ntownnear+=1
 		    	drawbuildingnodefast(ij,i,1,r,g,b)
 		    Else
 		    	'If x2>-200 And x2<700 And Abs(y2)<700 Then ntownnear+=1
 		    	'If x2>-600 And x2<1200 And Abs(y2)<1200 Then ntownnear+=1
 		    	If Abs(x-mx)<1200 And Abs(y-my)<1200 Then ntownnear+=1
 		    	drawbuildingnode(ij,i,1,r,g,b)
 		    EndIf
 		    'EndIf   
 		    glpopmatrix 
End Sub
Sub updatewaysm()
Dim As Integer i,j,k,n,p,di,dj
Dim As Single x,y,z,h,dx,dy
If nway2<1 Then Exit Sub   
If quit2=1 Or tquitweb=1 Then Exit Sub 
Var lat0=lat,lng0=lng
mxytolatlng(towpmapx0,towpmapy0)
If lat<-89 Or lat>89 Or lng<-179 Or lng>179 Then lat=lat0:lng=lng0:Exit Sub
Var lat00=lat,lng00=lng
mxytolatlng(towpmapx0+towpmapdx0,towpmapy0+towpmapdx0)
Var lat11=lat,lng11=lng
lat=lat0:lng=lng0
Var dij=7*100/kscalex
i50=int(25/dij):i101=i50+i50+1
For k=1 To nway2
 If quit2=1 Or tquitweb=1 Then Exit Sub 
 If waylat(k)>-90 Then
  Var testworldobj=0
  If waytheight(k)<>100 Then'not road
  	testworldobj=testworldobject(waylat(k),waylon(k))	
  EndIf
  If testworldobj=0 Then   	
	x=((waylon(k)-lng00)/(lng11-lng00))'*k88/6
	y=((waylat(k)-lat00)/(lat11-lat00))'*k88/6
	x=x*i50+0.5
	y=y*i50-0.5
	j=Int(x)
	i=Int(-y)
   'If InStr(LCase(wayname(k)),"ge henri")>0 Then auxvar+=100:auxtest=0.8
	'dx=((-y-i)*7)
	'dy=((x-j)*7)
	'di=Int(dx)'(-y-i)*7)
	'dj=Int(dy)'(x-j)*7)
   'h=wayheight(k)
   if i>-i50 and i<i50 and j>-i50 And j<i50 Then
   	Var ij=(i+i50)*i101+j+i50+1
   	If ij>0 And ij<ntowp2 Then	
   	  If iwaynode(k)>1 Then
   			If ij<>0 Then getlocktown(0)	
    			getlocktown(ij)
    			addtownwaynode(ij,k)
   			freelocktown(ij)
   			If ij<>0 Then freelocktown(0)	
   	  /'ElseIf tmaptowp(ij)>=0 And towpdz(ij,di,dj)>waterz And 0 Then 
   		towptype(ij)=1
   		tmaptowp(ij)=1
   		If towph(ij,di,dj)<1 Or (waytheight(k)>=1 And towpbuild(ij,di,dj)<10) Then
   			If waytype(k)="terminal" Then
   				towpbuild(ij,di,dj)=11
   			ElseIf waytheight(k)=1 Then
   				towpbuild(ij,di,dj)=4+Int(Rnd*3)
   				If wayheight(k)>=4000 Then townwaynodebuild(ij,i)=5'+Int(Rnd*2) 
   				if wayheightmin(k)>10 and wayheight(k)<4000 then
   				 townwaynodebuild(ij,i)=4
   				 townwaynodeh(ij,i)=wayheight(k)+Int(wayheightmin(k))*4000
   				endif  
   				townwaynoder(ij,i)=wayr(k)
   				townwaynodeg(ij,i)=wayg(k)
   				townwaynodeb(ij,i)=wayb(k)
   		   ElseIf waytheight(k)=2 Then
   				towpbuild(ij,di,dj)=10'bridge
   				towph(ij,di,dj)=h
   			ElseIf waytheight(k)=4 Then
   				towpbuild(ij,di,dj)=12'church
   			ElseIf waytheight(k)=5 Then
   				towpbuild(ij,di,dj)=13'shop
   			ElseIf waytheight(k)=6 Then
   				towpbuild(ij,di,dj)=14'official
   			ElseIf waytheight(k)=7 Then
   				towpbuild(ij,di,dj)=15'railstation
   			ElseIf waytheight(k)=8 Then
   				towpbuild(ij,di,dj)=16'hospital
   			Else 
      			towpbuild(ij,di,dj)=1+Int(Rnd*3)
      		EndIf 	
    	   	towph(ij,di,dj)=max(h,towph(ij,di,dj))
   	   	towpw(ij,di,dj)=max(200,waylength(k)*0.5)'0.45
    	   	towpwy(ij,di,dj)=max(200,waywidth(k)*0.5)'0.45
    	   	towpo1(ij,di,dj)=waydo1(k)
    	   	'towpddx(ij,di,dj)=towpdx(ij,di,dj)+(dx-Int(dx))*(towpdx(ij,1,1)-towpdx(ij,0,0))
    	   	'towpddy(ij,di,dj)=towpdy(ij,di,dj)+(dy-Int(dy))*(towpdy(ij,1,1)-towpdy(ij,0,0))
    	   	towpddx(ij,di,dj)=(dx-Int(dx))*(towpdx(ij,1,1)-towpdx(ij,0,0))
    	   	towpddy(ij,di,dj)=(dy-Int(dy))*(towpdy(ij,1,1)-towpdy(ij,0,0))
   		ElseIf Abs(towpo1(ij,di,dj))<0.00001 And h>10 Then
     	   	towpo1(ij,di,dj)=waydo1(k)  			
   		EndIf '/
   	  EndIf 	
   	EndIf
   EndIf
  EndIf
 EndIf  
Next
lat=lat0:lng=lng0
itownp=0
End Sub
Declare Sub updatewaysn()
Sub updateways()
If quit2=1 Or tquitweb=1 Then Exit Sub 
If topentown=1 Then
	'itownp=0
	If itownp=0 Then
		inittown3()
		itownp=0'1
	Else
		inittowp3()
		itownp=1'0
	EndIf
EndIf 
If itownp=1 Then updatewaysm():Exit Sub
updatewaysn()
End Sub
Sub updatewaysn()
Dim As Integer i,j,k,n,p,di,dj
Dim As Single x,y,z,h,dx,dy
If nway2<1 Then Exit Sub   
If quit2=1 Or tquitweb=1 Then Exit Sub  
Var lat0=lat,lng0=lng
mxytolatlng(townmapx0,townmapy0)
If lat<-89 Or lat>89 Or lng<-179 Or lng>179 Then lat=lat0:lng=lng0:Exit Sub
Var lat00=lat,lng00=lng
mxytolatlng(townmapx0+townmapdx0,townmapy0+townmapdx0)
Var lat11=lat,lng11=lng
lat=lat0:lng=lng0
Var dij=7*100/kscalex
Var i50=int(25/dij),i101=i50+i50+1
For k=1 To nway2
 If quit2=1 Or tquitweb=1 Then Exit Sub 
 If waylat(k)>-90 Then 	
  Var testworldobj=0
  If waytheight(k)<>100 Then'not road
  	testworldobj=testworldobject(waylat(k),waylon(k))	
  EndIf
  If testworldobj=0 Then   	
	x=((waylon(k)-lng00)/(lng11-lng00))'*k88/6
	y=((waylat(k)-lat00)/(lat11-lat00))'*k88/6
	x=x*i50+0.5
	y=y*i50-0.5
	j=Int(x)
	i=Int(-y)
	'dx=((-y-i)*7)
	'dy=((x-j)*7)
	'di=Int(dx)'(-y-i)*7)
	'dj=Int(dy)'(x-j)*7)
   'h=wayheight(k)
   if i>-i50 and i<i50 and j>-i50 And j<i50 Then
   	Var ij=(i+i50)*i101+j+i50+1
   	If ij>0 And ij<ntown2 Then	
   	  If iwaynode(k)>1 Then
   			If ij<>0 Then getlocktown(0)	
   			getlocktown(ij)
   			addtownwaynode(ij,k)
   			freelocktown(ij)
   			If ij<>0 Then freelocktown(0)	
   	  /'ElseIf tmaptown(ij)>=0 And towndz(ij,di,dj)>waterz And 0 Then 	
   		tmaptown(ij)=1
   		towntype(ij)=1
   		If townh(ij,di,dj)<1 Or (waytheight(k)>=1 And townbuild(ij,di,dj)<10) Then
   			If waytype(k)="terminal" Then
   				towpbuild(ij,di,dj)=11
   			ElseIf waytheight(k)=1 Then
   				townbuild(ij,di,dj)=4+Int(Rnd*3)
   				If wayheight(k)>=4000 Then townwaynodebuild(ij,i)=5'+Int(Rnd*2) 
   				if wayheightmin(k)>10 and wayheight(k)<4000 then
   				 townwaynodebuild(ij,i)=4
   				 townwaynodeh(ij,i)=wayheight(k)+Int(wayheightmin(k))*4000
   				endif  
   				townwaynoder(ij,i)=wayr(k)
   				townwaynodeg(ij,i)=wayg(k)
   				townwaynodeb(ij,i)=wayb(k)
   			ElseIf waytheight(k)=2 Then
   				townbuild(ij,di,dj)=10'bridge
   				townh(ij,di,dj)=h
   			ElseIf waytheight(k)=100 Then
   				townbuild(ij,di,dj)=100'highway
   			ElseIf waytheight(k)=4 Then
   				townbuild(ij,di,dj)=12'church
   			ElseIf waytheight(k)=5 Then
   				townbuild(ij,di,dj)=13'shop
   			ElseIf waytheight(k)=6 Then
   				townbuild(ij,di,dj)=14'official
   			ElseIf waytheight(k)=7 Then
   				townbuild(ij,di,dj)=15'railstation
   			ElseIf waytheight(k)=8 Then
   				townbuild(ij,di,dj)=16'hospital
   			Else 
      			townbuild(ij,di,dj)=1+Int(Rnd*3)
      		EndIf 	
    	   	townh(ij,di,dj)=max(h,townh(ij,di,dj))
    	   	townw(ij,di,dj)=max(200,waylength(k)*0.5)'0.45
    	   	townwy(ij,di,dj)=max(200,waywidth(k)*0.5)'0.45
    	   	towno1(ij,di,dj)=waydo1(k)
    	   	'townddx(ij,di,dj)=towndx(ij,di,dj)+(dx-Int(dx))*(towndx(ij,1,1)-towndx(ij,0,0))
    	   	'townddy(ij,di,dj)=towndy(ij,di,dj)+(dy-Int(dy))*(towndy(ij,1,1)-towndy(ij,0,0))
    	   	townddx(ij,di,dj)=(dx-Int(dx))*(towndx(ij,1,1)-towndx(ij,0,0))
    	   	townddy(ij,di,dj)=(dy-Int(dy))*(towndy(ij,1,1)-towndy(ij,0,0))
   		ElseIf Abs(towno1(ij,di,dj))<0.00001 And h>10 Then
     	   	towno1(ij,di,dj)=waydo1(k)  			
   		EndIf'/
   	  EndIf 	
   	EndIf
   EndIf
  EndIf  
 EndIf   
Next
lat=lat0:lng=lng0
itownp=1
End Sub
Sub addtownxy3(fic0 As String="")
If topentown=0 Then Exit Sub'$$   
Dim As Integer i,File,ii,jj
Dim As String fic
fic=ExePath+"/save/map"+Str(imap)+".townxy3" 
If fic0<>"" Then fic=fic0
If FileExists(fic)=0 Then
	Exit Sub 
EndIf
file=FreeFile 
Open fic For  Binary Access Read As #file
Dim As Single towniix00,townjjx00
Dim As Single townmapx00,townmapy00 
Var addworldx0=myworldx,addworldy0=myworldy
Get #file,,towniix00
If towniix00>99990.0 Then
  Get #file,,addworldx0
  Get #file,,addworldy0
  Get #file,,towniix00
Else 
	Close #file
	guinotice "old version of save file ! reload and resave this save file to upgrade compatibility.","addfile"
   Exit Sub 
EndIf
Get #file,,townjjx00
Get #file,,townmapx00
Get #file,,townmapy00
Var dij=7*100/kscalex,dij0=dij
Var i50=int(25/dij),i500=i50,i101=i50+i50+1
Get #file,,dij
Get #file,,i50
Var ntown22=ntown2
Get #file,,ntown22
Var nwaynode2=nwaynode
get #file,,nwaynode2
Var ntownnode2=ntownnode
Get #file,,ntownnode2
Var nbridge2=nbridge
Get #file,,nbridge2
If Abs(dij-dij0)<0.005 And Abs(i500-i50)<0.005 And ntown22=ntown2 And _
   nwaynode2<=nwaynode And ntownnode2<=ntownnode And nbridge2=nbridge Then
 'towniix0=towniix00
 'townjjx0=townjjx00
 'townmapx0=townmapx00
 'townmapy0=townmapy00
 'towpiix0=towniix00
 'towpjjx0=townjjx00
 'towpmapx0=townmapx00
 'towpmapy0=townmapy00
 sleep 500
 Var auxlat=bridgelat(0)
 For i=0 To min2(500,nbridge)
	Get #file,,auxlat'bridgelat(i)
	Get #file,,auxlat'bridgelon(i)
	Get #file,,auxlat'bridgelat2(i)
	Get #file,,auxlat'bridgelon2(i)
 Next
 For i=0 To ntown2
   Var townnwaynodei=townnwaynode(i)
	Get #file,,townnwaynodei
	If townnwaynodei>0 Then
	 nway2=0	
	 Var myworldx0=myworldx,myworldy0=myworldy
	 myworldx=addworldx0:myworldy=addworldy0
	 Var lat0=lat,lng0=lng
	 For ii=1 To min2(ntownnode,townnwaynodei)'ntownnode<nway
	   nway2=ii
	   Get #file,,waynodeid(ii)
	   If waynodeid(ii)<>0 Then
	    If waynodeid(ii)<0 Then
	    	waynodeid(ii)=-waynodeid(ii)
	    	Get #file,,myztext40
	    	wayname(ii)=myztext40
	    EndIf
		 Get #file,,iwaynode(ii)
		 Get #file,,wayheight(ii)
		 Get #file,,waynodez(ii)
		 Get #file,,addwaynodebuild(ii)
		 If addwaynodebuild(ii)>=1000 Then
		 	addwaynodebuild(ii)-=1000
		   Get #file,,wayr(ii)
		   Get #file,,wayg(ii)
		   Get #file,,wayb(ii)
		 Else
		 	wayr(ii)=0
		 	wayg(ii)=0
		 	wayb(ii)=0
		 EndIf
		 Var townwaynodexiijj=townwaynodex(i,ii,0)
		 Var townwaynodeyiijj=townwaynodey(i,ii,0)
		 Var ni=min2(nwaynode,iwaynode(ii))
		 For jj=0 To ni
		 	Get #file,,townwaynodexiijj
		 	Get #file,,townwaynodeyiijj
		 	mxytolatlng(townwaynodexiijj,townwaynodeyiijj)
		 	If jj=1 Then
		 		waylat(ii)=lat
		 		waylon(ii)=lng
		 	ElseIf jj=ni Then		 		
		 		waylat(ii)=(waylat(ii)+lat)*0.5
		 		waylon(ii)=(waylon(ii)+lng)*0.5
		 	EndIf
		 	waynodex(ii,jj)=lng
		 	waynodey(ii,jj)=lat
		 Next
	   EndIf  
	 Next
	 lat=lat0:lng=lng0
	 myworldx=myworldx0:myworldy=myworldy0
	 worldx=myworldx:worldy=myworldy
	 Var itownp0=itownp
	 If itownp=0 Then
	 	updatewaysm()
	 Else
	 	updatewaysn()
	 EndIf
	 itownp=itownp0
	 For ii=1 To nway'nway2
	 	addwaynodebuild(ii)=0
	 Next
	EndIf  
 Next
 /'If Not Eof(file) Then
 	Var nfuel2=0
 	Get #file,,nfuel2
 	If nfuel2<=nfuel Then
 	   Get #file,,ifuel
 		For i=1 To nfuel2
 			Get #file,,fuelid(i)
 			Get #file,,fuelx(i)
 			Get #file,,fuely(i)
 			Get #file,,fueldo1(i)
 			fuelz(i)=-999999 			
 		Next
 	EndIf
 EndIf '/
 Sleep 500
EndIf
Close #file
End Sub 
'Dim Shared As Integer itownij,jtownij
Dim Shared As Single xtownij,ytownij
Function gettownij(px As single,py As Single)As Integer 	
/'Var lat0=lat,lng0=lng
mxytolatlng(townmapx0,townmapy0)
If lat<-89 Or lat>89 Or lng<-179 Or lng>179 Then lat=lat0:lng=lng0:Exit Sub
Var lat00=lat,lng00=lng
mxytolatlng(townmapx0+townmapdx0,townmapy0+townmapdx0)
Var lat11=lat,lng11=lng
lat=lat0:lng=lng0'/
'Var dij=7*100/kscalex
'Var i50=int(25/dij),i101=i50+i50+1
Dim As Integer i,j,k,ij
Dim As Single x,y   	
	x=(px-townmapx0)/(0.01+townmapdx0)'*k88/6
	y=(py-townmapy0)/(0.01+townmapdx0)'*k88/6
	x=x*i50+0.5
	y=y*i50-0.5
	j=Int(x)
	i=Int(-y)
	Var townij=0
   i=max2(-i50,min2(i50,i))
   j=max2(-i50,min2(i50,j))
   If i>-i50 and i<i50 and j>-i50 And j<i50 Then
   	ij=(i+i50)*i101+j+i50+1
   	If ij>0 And ij<ntown Then	
   	  townij=ij
   	EndIf 
   EndIf
   itownij=i
   jtownij=j
   Return townij
End Function
function settownijxy(ij As Integer) As Integer
Dim As Integer i,j,k
Dim As Single x,y 
If ij<1 Or ij>ntown Or ij>ntown2 Then Return 0
i=Int(ij/i101)
j=ij-i*i101
x=(j-i50-1)/i50
y=-(i-i50)/i50
If x<-1 Or x>1 Or y<-1 Or y>1 Then Return 0
xtownij=townmapx0+x*townmapdx0
ytownij=townmapy0+y*townmapdx0
Return 1	
End Function 
Sub drawfuel()
Dim As Integer i,j,k
For i=1 To nfuel
 	If fuelid(i)<>0 Then
 		  Var x=fuelx(i)-dmx0
 		  If Abs(x-mx)>20000 Then Continue For 
 		  Var y=fuely(i)-dmy0
 		  If Abs(y-my)>20000 Then Continue For
 		  'If Abs(x-mx)<14000 Then'7000
 		  	'If Abs(y-my)<14000 And plane>0 And car>0 Then
 		  		If fueldo1(i)<360 Then
 		  			addradar(x,y,4)'fuel
 		  		ElseIf fueldo1(i)<720+360 Then
 		  			addradar(x,y,6)'water_tower
 		  		ElseIf fueldo1(i)<720*2+360 Then
 		  			addradar(x,y,7)'silo
 		  		'Else
 		  		'	addradar(x,y,8)'communicationstower
 		  		EndIf
 		  	'EndIf
 		  'EndIf
 		  Var z=fuelz(i)
 		  'If z<-99990 Then z=getterrainheight(x,y):fuelz(i)=z:Continue For
 		  z=getterrainheight(x,y)
 		  If z<-99990 Then Continue For 
 		  fuelz(i)=z
 		  /'If z<waterz-1 Then
 		  	  fuelid(i)=0
 		  	  fuelx(i)=999999
 		  	  fuely(i)=999999
 		  	  fuelz(i)=-999999
 		  	  Continue For 
 		  EndIf '/
 		  Var do1=fueldo1(i),size=112.0 
 		  If do1<360 Then
 		  	drawgasstation2(x+dmx0,y+dmy0,z,do1,size)
 		  ElseIf do1<720+360 Then 
 		  	drawwatertower(x+dmx0,y+dmy0,z)
 		  ElseIf do1<720*2+360 Then 
 		  	drawsilo(x+dmx0,y+dmy0,z)
 		  ElseIf do1<720*3+360 Then
 		  	drawcommtower(x+dmx0,y+dmy0,z)
 		  Else 	
 		  	glcolor3f(1,0.35,0.35)
 		  	drawwatertower(x+dmx0,y+dmy0,z)
 		  	glcolor3f(1,1,1)
 		  EndIf
 	EndIf 	  
Next  	
End Sub 
Dim Shared As ZString*12600000 zwebtext,zwebtext0
Sub subtest2(ByVal userdata As Any Ptr)
'guinotice("ok")
'tloadwebtext2=0
Exit Sub 
If tloadwebtext2<>0 Then Exit Sub
tloadwebtext2=2
Var lat0=lat,lng0=lng
mxytolatlng(mx+dmx0,my+dmy0)
Var lat11=lat,lng11=lng
townmapdx0=k8*512*scalex*(50/x960)*x960/1200
mxytolatlng(mx+dmx0+townmapdx0,my+dmy0+townmapdx0)
dlat=lat-lat11:dlon=lng-lng11
'auxvar=dlat:auxvar2=dlon
lat=lat0:lng=lng0
tloadwebtext2=0:Exit Sub 
End Sub
Dim Shared As String overpass(20),overpass2(20)
Dim Shared As Integer toverpasserror=0',ioverpass=0
overpass(0)="overpass-api.de":overpass2(0)="api/"
overpass(1)="overpass.osm.rambler.ru":overpass2(1)="cgi/"
overpass(2)="api.openstreetmap.fr":overpass2(2)="oapi/"
Sub setioverpass()
	If toverpasserror=0 Then
		ioverpass+=1:If ioverpass>2 Then ioverpass=0
	EndIf
	toverpasserror=1 
	'tquitweb=1
	'guinotice(Left(zwebtext,800))
	'guinotice("ioverpass="+Str(ioverpass))
	auxvar4=ioverpass+0.1
	auxvar3=0
	'mxweb(imxweb)=-179
	'myweb(imxweb)=-89
	'imxweb-=1:If imxweb<1 Then imxweb=nxweb
	resetmxweb()
	If asktownlat2>-90 Then 
	  asktownlat=asktownlat2
  	  asktownlon=asktownlon2
     asktownlat2=-99
   EndIf   
	If auxtest>0.89 Then guinotice Left(zwebtext,800)
	tinittown=0
	'Sleep 2000
End Sub
Dim Shared As String myoverpass
Sub suboverpass()
	confirm("change overpass server ? last="+myoverpass,"confirm",resp)
   If resp="yes" Then setioverpass()
   Sleep 500	
End Sub
Sub resetreverse()
Dim As Integer i 
For i=1 To nreverse
	latreversei(i)=-90
	lngreversei(i)=0
	namereversei(i)=""
Next
End Sub
Function getreversei(latx As Single,lngx As Single)As Integer  
Dim As Integer i,j
Var dx=0.7*360/40000
j=0
For i=1 To nreverse
  If Abs(latx-latreversei(i))<dx Then 	
	Var dist=max(Abs(latx-latreversei(i)),Abs(lngx-lngreversei(i))/klon)
	If dist<dx Then
		If namereversei(i)<>"" Then
			j=i
			dx=dist
		Else
			latreversei(i)=-90
		EndIf		
	EndIf
  endif 	
Next
Return j
End Function
Sub addreversei(latx As Single,lngx As Single,namei As String)
Dim As Integer i,j
If namei="" Then Exit Sub 
j=getreversei(latx,lngx)
If j>0 Then
	'namereversei(j)=namei
	Exit Sub 
EndIf
Var dx=0.0
For i=1 To nreverse
	Var dist=max(Abs(latx-latreversei(i)),Abs(lngx-lngreversei(i))/klon)
		If dist>dx Then
		dx=dist:j=i
	EndIf
Next
latreversei(j)=latx
lngreversei(j)=lngx
namereversei(j)=namei
End Sub
Function formatutf8name(text0 As String)As String
    Dim As String abcd="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 '-_éèçà&ù,;:!*?./"
    Dim As String abcd2="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789éèçà&ù"
    Dim As String utf8="Ã©Ã¨Ã§Ã Ã¹Ã¢ÃªÃ®Ã´Ã»Ã‚ÃŠÃŽÃ”Ã›Ã¤Ã«Ã¯Ã¶Ã¼Ã„Ã‹ÃÃ–ÃœÃ‰ÃˆÃ‡"
   Dim As String ansi="eecauaeiouAEIOUaeiouAEIOUEEC" '"éèçàùâêîôûÂÊÎÔÛäëïöüÄËÏÖÜÉÈÇ"
    Dim As String text,c,cc
    Dim As Integer i,li,j,k,tok=0
    text="":li=Len(text0)
    For i=1 To li
        c=Mid(text0,i,1)
        If InStr(abcd,c)>0 Then
            text+=c
            If tok=0 Then
            	If InStr(abcd2,c)>0 Then tok=1
            EndIf
        ElseIf i<li Then
            cc=Mid(text0,i,2)
            j=InStr(utf8,cc)
            If j>0 And (j Mod 2)=1 Then
                text+=Mid(ansi,Int(j/2+1),1)
                i+=1
                tok=1
            Else
                text+="."
            EndIf
        Else    
            text+="."
        EndIf
    Next
    If tok=0 Then Return ""
    Return text
End Function
Const As Integer ncity=10000,ncitynear=1000
Dim Shared As int64 cityid(ncity)
Dim Shared As Integer ncity2,citycapital(ncity),citypopulation(ncity)
Dim Shared As Single citylat(ncity),citylon(ncity)
Dim Shared As String cityname(ncity),citycountry(ncity),citycountrycode(ncity)
Dim Shared As Integer ncitynear2,icitynear(ncitynear)
Dim Shared As Integer cityneardist(ncitynear)
Dim Shared As Single latcity=-90,lngcity,latcitynear=-90,lngcitynear
Sub setcitykm1(latx As single,lngx As Single,co1 As Single,si1 As Single)
Dim As Integer i,j,k 
Var dist1=999
For i=1 To ncitynear2
	j=icitynear(i)
	If citycapital(j)>2 Then Continue For 
	Var dist=cityneardist(i)
	If dist>=dist1 Or dist<2 Then Continue For 
	Var dx=(citylon(j)-lngx)*40000/(360*klon)
	Var dy=(citylat(j)-latx)*40000/360
	If (dx*co1+dy*si1)>0.75*dist And (citycountrycode(j)=countrycode Or citycountrycode(j)="") Then
	   dist1=dist
	   citynamekm1=cityname(j)
	   citykm1=Str(dist)	
	EndIf
Next
Var dist2=999
k=0
For i=1 To ncitynear2
	j=icitynear(i)
	If citycapital(j)<=2 Then Continue For 
	Var dist=cityneardist(i)
	If dist>=dist2 Or dist<2 Then Continue For 
	Var dx=(citylon(j)-lngx)*40000/(360*klon)
	Var dy=(citylat(j)-latx)*40000/360
	If (dx*co1+dy*si1)>0.75*dist And (citycountrycode(j)=countrycode Or citycountrycode(j)="") Then
	   dist2=dist
	   citynamekm2=cityname(j)
	   citykm2=Str(dist)
	   k=i	
	EndIf
Next
If k=0 Then Exit Sub
Var dist3=999
For i=1 To ncitynear2
	If i=k Then Continue For 
	j=icitynear(i)
	If citycapital(j)<=2 Then Continue For 
	Var dist=cityneardist(i)
	If dist>=dist3 Or dist<2 Then Continue For 
	Var dx=(citylon(j)-lngx)*40000/(360*klon)
	Var dy=(citylat(j)-latx)*40000/360
	If (dx*co1+dy*si1)>0.75*dist And (citycountrycode(j)=countrycode Or citycountrycode(j)="") Then
	   dist3=dist
	   citynamekm3=cityname(j)
	   citykm3=Str(dist)	
	EndIf
Next
End Sub
Sub getcitynear(latx As Single,lngx As Single)
Dim As Integer i,j,k 
ncitynear2=0
Var dist1=320.0*360/40000'km
Var dist2=200.0*360/40000'km
Var dist=dist1,dmin=99999
For i=1 To ncity2
	If citycapital(i)<=2 Then
		dist=dist1
	Else
		dist=dist2
	EndIf
	If Abs(citylat(i)-latx)<dist Then
		If Abs(citylon(i)-lngx)<dist*klon Then
			ncitynear2+=1
			icitynear(ncitynear2)=i
			Var dx=citylat(i)-latx,dy=(citylon(i)-lngx)/klon
			cityneardist(ncitynear2)=Int(Sqr(dx*dx+dy*dy)*40000/360)
			If cityneardist(ncitynear2)<dmin And citycountrycode(i)<>"" Then
				dmin=cityneardist(ncitynear2):countrycode=citycountrycode(i)
			EndIf
			If ncitynear2>=ncitynear Then Exit For 
		EndIf
	EndIf
Next
'guinotice "ncitynear2="+Str(ncitynear2)
Var msg=""
For i=1 To min2(50,ncitynear2)
	j=icitynear(i)
	'msg+=cityname(j)+" "+Str(citycapital(j))+" "+Str(cityneardist(i))+" "+citycountrycode(j)+" /"
Next
'guinotice msg
End Sub
Sub setcityneardist(latx As Single,lngx As single) 
Dim As Integer i,j 
For j=1 To ncitynear2
	i=icitynear(j)
	Var dx=citylat(i)-latx,dy=(citylon(i)-lngx)/klon
	cityneardist(j)=Int(Sqr(dx*dx+dy*dy)*40000/360)
Next
End Sub
Sub drawcitynear()
Dim As Integer i,j
Var dlat=(min(mz-mzsol00,10000.0)+6000.0)*0.5*0.008*360/40000,dlon=dlat*klon,px=mx,py=my,pz=mz
dlat*=(8+ncitynear2)/(1+ncitynear2):dlon=dlat*klon
'auxvar=ncitynear2:auxtest=0.2
glcolor3f(1,1,1)
gldisable gl_depth_test
For j=1 To ncitynear2
 i=icitynear(j)
 If Abs(citylat(i)-latmx)<dlat Then
		If Abs(citylon(i)-lngmx)<dlon Then
			If cityname(i)<>"" Then
				latlngtomxy(citylat(i),citylon(i),px,py)
				pz=max(waterz,getterrainheightfast(px,py))-20000+20800*80000/(80000+max(Abs(px-mx),Abs(py-my)))
				rotavion(px-mx,py-my,pz-mz)
				If x2>0.9*max(Abs(y2),Abs(z2)) Then
					glpushmatrix
					gltranslatef(px,py,pz)
					If tourelle=0 Then
						glrotatef(o1+180,0,0,1)
					Else
						glrotatef(o1+to1+180,0,0,1)
					EndIf
					gldrawtext3D(cityname(i),max(50.0,x2*0.03))
					glpopmatrix 
				EndIf
			EndIf
		EndIf
	EndIf
Next
glenable gl_depth_test
End Sub
Sub getcity(text0 As String="") 'getcitynodes
Dim As String fic
Dim As Integer file
fic=exepath+"/save/citytext.txt"
If text0<>"" Then
	zwebtext=text0
Else
 file=freefile
 Open fic For Binary Access Read As #file
 Get #file,,zwebtext
 Close #file
EndIf 
'guinotice "length="+Str(Len(zwebtext))
	Dim As Integer i,j,k
	Dim As String c
	wline=nextwords(zwebtext,"""elements"":")
	If wline="" Then
	   guinotice(Left(zwebtext,800))
	   Exit Sub 
	EndIf
	wtext0=nextdata(wline,"[","]")
	'printmsg "wtext0="+Left(wtext0,400)
	'printmsg
	split(wtext0,",")
	'guinotice "nsplit="+Str(nsplit)
	'printmsgsplit()
	'printmsg
	'guinotice wsplit(1)
	If nsplit>ncity Then nsplit=ncity'1900
	ncity2=nsplit
	For i=1 To nsplit
		If quit2=1 Or quit=1 Then Exit For 
		wtext1=wsplit(i)
		wtext2=nextwords(wtext1,"""id""")
		cityid(i)=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext1,"""lat""")
		citylat(i)=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext1,"""lon""")
		citylon(i)=Val(nextdata0(wtext2,":",","))
		wtext2=nextwords(wtext1,"""capital""")
		citycapital(i)=val(nextdata0(wtext2,"""",""""))
		wtext2=nextwords(wtext1,"""int_name""")
		cityname(i)=(nextdata0(wtext2,"""",""""))
		If cityname(i)="" Then			
		  wtext2=nextwords(wtext1,"""name:en""")
		  cityname(i)=(nextdata0(wtext2,"""",""""))
		EndIf
		If cityname(i)="" Then			
		  wtext2=nextwords(wtext1,"""name""")
		  cityname(i)=(nextdata0(wtext2,"""",""""))
		EndIf
		cityname(i)=formatutf8name(cityname(i))
		wtext2=nextwords(wtext1,"""population""")
		citypopulation(i)=Val(nextdata0(wtext2,"""",""""))
    	wtext2=nextwords(wtext1,"""is_in:country""")
		citycountry(i)=(nextdata0(wtext2,"""",""""))
		wtext2=nextwords(wtext1,"""is_in:country_code""")
		citycountrycode(i)=(nextdata0(wtext2,"""",""""))
	Next
	i=10
	'guinotice Str(citylon(i))+" "+cityname(i)+" "+Str(citypopulation(i))+" "+citycountry(i)+" "+citycountrycode(i)
End Sub 
Dim Shared As String latlon,latlon1,latlon2,latlon3,latlon30,nodeurl,wayurl,myoverpass2
'Dim Shared As Double kdxweb=0.3',t300=2000
Dim Shared As Integer tloadcity=3
Sub loadcity()
If tloadcity=0 Then Exit Sub 
tloadcity=0
Dim As Integer i,j,k,file
Var hostname="overpass-api.de"
Var path="api/interpreter?data=[out:json];%28node[place~'city|town|metropolis'][capital~'yes|1|2|3|4|5|6|7']"
path+="%29%3Bout%20qt%2089999%3B"
'http://overpass-api.de/api/interpreter?data=[out:json];%28node[place~'city|town|metropolis'][capital~'yes|1|2|3|4|5|6']%29%3Bout%20qt%2029999%3B
Var idata=httppost(hostname,path)
   'If idata=0 Then setioverpass()
   For i=0 To idata-1
   	zwebtext[i]=recvdata(i)
   Next
   zwebtext[idata]=0
   guinotice "length="+Str(Len(zwebtext)) 
   guinotice Left(zwebtext,400)
   'If quit2=1 Or tquitweb=1 Then Exit Sub 
   'getnodes(zwebtext)
   'getcity(zwebtext)	
Dim As String fic
fic=exepath+"/save/citytext.txt"
guiconfirm("save zwebtext as "+fic+" ?","confirm",resp)
If resp<>"yes" Then Exit Sub 
file=freefile
Open fic For Binary Access write As #file
Put #file,,zwebtext
Close #file
guinotice "data saved as "+fic 
End Sub
dim shared as Double tidle,tidle2
Sub loadopentown()
tidle2=tidle
'Var lat=48.891977155490395,lng=2.237673523003608'paris defense
'lat=49.36198047661674:lng=0.07262960190958628'deauville marinas
'lat=42.78764305091493:lng=3.0338932951133533'le barcares 
'Var lat0=lat,lng0=lng
'mxytolatlng(mx+dmx0,my+dmy0)
Dim As Integer i,idata
toverpasserror=0
nerr=0
Var kdx=1.0
'If (mz-mzsol0)<500 Then kdx=0.5
If (mz-mzsol0)<100 Then kdx=0.7'0.25
If tinittown0>0 Then kdxweb=0.3
If dtweb>40 Then kdxweb=max(0.27,kdxweb*0.7)
If dtweb>30 Then kdxweb=max(0.27,kdxweb*0.7)
If dtweb>20 Then kdxweb=max(0.27,kdxweb*0.7)
If dtweb<12 Then kdxweb=min(1.0,kdxweb*1.15)
'auxvar=inearroad0:auxtest=0.3
If plane=0 Or car>0 And inearroad0>130 Then kdx*=0.7
Var dx0=kdx*1.3*360/40000',klon=1.4
kdx*=kdxweb
Var dx=dx0*kdxweb
dmxweb(imxweb)=dx0*0.7
'lattown=lat+dx*1.5*sin1:lngtown=lng+dx*1.5*cos1*klon
var lat1=lattown-dx,lon1=lngtown-dx*klon
var lat2=lattown+dx,lon2=lngtown+dx*klon
dx=kdxweb*5.0*360/40000
Var lat11=lattown-dx,lon11=lngtown-dx*klon
var lat21=lattown+dx,lon21=lngtown+dx*klon
dx=kdxweb*2.5*360/40000
var lat12=lattown-dx,lon12=lngtown-dx*klon
var lat22=lattown+dx,lon22=lngtown+dx*klon
dx=kdx*10*360/40000
var lat13=lattown-dx,lon13=lngtown-dx*klon
var lat23=lattown+dx,lon23=lngtown+dx*klon
'dx=7*360/40000
'var lat130=lattown-dx,lon130=lngtown-dx*klon
'var lat230=lattown+dx,lon230=lngtown+dx*klon
'lat=lat0:lng=lng0
latlon="%28"+Str(lat1)+"%2C"+Str(lon1)+"%2C"+Str(lat2)+"%2C"+Str(lon2)+"%29"
latlon1="%28"+Str(lat11)+"%2C"+Str(lon11)+"%2C"+Str(lat21)+"%2C"+Str(lon21)+"%29"
latlon2="%28"+Str(lat12)+"%2C"+Str(lon12)+"%2C"+Str(lat22)+"%2C"+Str(lon22)+"%29"
latlon3="%28"+Str(lat13)+"%2C"+Str(lon13)+"%2C"+Str(lat23)+"%2C"+Str(lon23)+"%29"
'latlon30="%28"+Str(lat130)+"%2C"+Str(lon130)+"%2C"+Str(lat230)+"%2C"+Str(lon230)+"%29"
myoverpass=overpass(ioverpass)'"overpass-api.de"
myoverpass2=overpass2(ioverpass)
'Var wayurl="api/interpreter?data=[out:json];%28way[aeroway~'aerodrome|runway']"+latlon+";"
'wayurl="api/interpreter?data=[out:json];%28way[aeroway~'aerodrome']"+latlon+";"
'var wayurl=http+overpass+"interpreter?data=[out:json];%28node[aeroway~'aerodrome']"+latlon+";"
'Var keyway="way['building:height']"+latlon+";way['building']['height']"+latlon+";way['building']['levels']"+latlon+";way['building:levels']"+latlon
'Var keyway="way[aeroway~'aerodrome|terminal']"+latlon3
Var keyway="way[aeroway~'aerodrome']"+latlon3+";way[aeroway~'runway|taxiway']"+latlon3
'keyway+=";node[aeroway~'aerodrome|runway']"+latlon1
keyway+=";node[aeroway~'aerodrome']"+latlon3
keyway+=";node['man_made'~'water_tower|storage_tank|silo']"+latlon3
keyway+=";node['man_made'~'communications_tower|tower']"+latlon3
keyway+=";node[amenity~'fuel|hospital|cinema']"+latlon2+";node[railway~'station']"+latlon2
If nshop>180 Or nshop0>180 Then
	keyway+=";node[shop~'mall|supermarket|books']"+latlon2
Else 	
	keyway+=";node[shop]"+latlon2+";node[amenity~'cafe|restaurant|bar|pub']"+latlon
EndIf
'keyway+=";way[highway~'motorway|trunk|primary|secondary|tertiary']"+latlon
'keyway+=";way[highway~'motorway|trunk|primary|secondary|tertiary|unclassified|residential|service|pedestrian|path|parking']"+latlon
If (dtweb<19.5 Or time2>tidle2+4) And fpsmoy>14 Then 
 keyway+=";way['highway'~'motorway|trunk']"+latlon3
 'keyway+=";way['highway'~'motorway|trunk|primary']"+latlon3
 'If myroadwayid<>"" Then
 '   keyway+=";(way("+myroadwayid+");way(around:0)[highway~'motorway|trunk|primary|secondary'])->.myway"
 'EndIf
 'keyway+=";way['highway'~'secondary|tertiary|unclassified|residential|service|pedestrian|path|parking']"+latlon'latlon
 keyway+=";way['highway']"+latlon'latlon
Else
 'If myroadwayid<>"" Then
 '   keyway+=";(way("+myroadwayid+");way(around:0)[highway~'motorway|trunk|primary|secondary'])->.myway"
 'EndIf
 keyway+=";way['highway']"+latlon'latlon
EndIf 
'setmyroadlatlon()
If myroadlat>-90 And dtweb<18 And fpsmoy>17 Then
 Var dx=0.4*360/40000
 Var lat14=myroadlat-dx,lon14=myroadlon-dx*klon
 Var lat24=myroadlat+dx,lon24=myroadlon+dx*klon
 Var latlon4="%28"+Str(lat14)+"%2C"+Str(lon14)+"%2C"+Str(lat24)+"%2C"+Str(lon24)+"%29"
 keyway+=";way['highway'~'motorway|trunk|primary|secondary']"+latlon4
 /'dx=0.4*360/40000
 lat14+=dx*sin1:lon14+=dx*cos1*klon
 lat24+=dx*sin1:lon24+=dx*cos1*klon
 Var latlon5="%28"+Str(lat14)+"%2C"+Str(lon14)+"%2C"+Str(lat24)+"%2C"+Str(lon24)+"%29"
 keyway+=";way['highway'~'motorway|trunk|primary|secondary']"+latlon5
 '/
EndIf 
keyway+=";way['building']"+latlon
keyway+=";way['building:part'~'yes']"+latlon
'keyway+=";way['roof:material']"+latlon
'keyway+=";relation['building']"+latlon'+";way(r);)"
keyway+=";relation['building']"+latlon+"->.myrel;way(r.myrel:outer)->.myrelway"';way(r.myrel:part)->.myrelway2"
keyway+=";way['railway'~'rail']"+latlon
keyway+=";way[amenity~'school|university|hospital']"+latlon
'wayurl+="way['man_made'~'bridge']"+latlon1+";";
'wayurl+="way['bridge']"+latlon1+";";
'auxvar6=myiaskway+0.1
If myiaskway>0 Then
	For i=1 To myiaskway
		keyway+=";way%28"+Str(myaskwayid(i))+"%29"
		If Len(keyway)>3900 Then
			If auxtest>0.1 Then guinotice "keyway len="+Str(Len(keyway))+"/"+Str(i)
			Exit For 
		EndIf
	Next
	myiaskway=0
	'resetmxweb()
EndIf
If testworld=1 Then keyway=keyway+";way['bridge']"+latlon1+";way['man_made'~'bridge']"+latlon1
wayurl=myoverpass2+"interpreter?data=[out:json][timeout:45];%28"+keyway
'If myroadwayid<>"" Then wayurl+=";.myway"
wayurl+=";.myrel;.myrelway%29%3Bout%20qt%2029999%3B"
'wayurl+="%29%3Bout%20qt%209999%3B"
nodeurl=myoverpass2+"interpreter?data=[out:json][timeout:45];%28node"+latlon
'nodeurl+="node"+latlon
nodeurl+="%29%3Bout%20skel%2029999%3B"
Var hostname=myoverpass
path=nodeurl
var myquery="format=xml&lat="+Str(lat)+"&lon="+Str(lng)+"&zoom=10&addressdetails=1&accept-language=en"
Var reversehost="nominatim.openstreetmap.org"
Var reverseurl="reverse?"+myquery

If Timer>tinittown00 Then
	
	/'If tloadcity=1 Then
		guiconfirm("load city ?","confirm",resp)
		If resp="yes" Then
			loadcity():tloadcity=0
		EndIf
	EndIf '/
	/'If tloadcity=2 Then
		guiconfirm("load citytext ?","confirm",resp)
		If resp="yes" Then
			getcity():tloadcity=0
		EndIf
	EndIf '/
	If tloadcity=3 Then getcity():tloadcity=0

   Var dxreverse=1.0*360/40000 '1km
   Var lat0=lat,lng0=lng
   mxytolatlng(mx+dmx0,my+dmy0)
   Var latx=lat,lngx=lng
   lat=lat0:lng=lng0
   If Abs(latx-latcity)>10*360/40000 Or Abs(lngx-lngcity)>klon*10*360/40000 Then
   	latcity=latx:lngcity=lngx
   	latcitynear=latx:lngcitynear=lngx
   	getcitynear(latx,lngx)
   ElseIf Abs(latx-latcitynear)>0.7*360/40000 Or Abs(lngx-lngcitynear)>klon*0.7*360/40000 Then
   	latcitynear=latx:lngcitynear=lngx
   	setcityneardist(latx,lngx)
   EndIf 	
   Var jreverse=getreversei(latx,lngx)
   If jreverse>0 Then reverselocation=namereversei(jreverse)
   'Var msg= "ok="+Str(jreverse)
   'For i=1 To 10:msg+="/"+Str(i)+"="+Str(Int(latreversei(i)))+" "+namereversei(i):Next
   'guinotice msg
   If jreverse=0 And (max(Abs(latreverse-latx),Abs(lngreverse-lngx)/klon)>dxreverse) Then'dx0/2'dx/2
   	lngreverse=lngx:latreverse=latx
      myquery="format=xml&lat="+Str(latx)+"&lon="+Str(lngx)+"&zoom=10&addressdetails=1&accept-language=en"
      reversehost="nominatim.openstreetmap.org"
      reverseurl="reverse?"+myquery
      If quit2=1 Or tquitweb=1 Then Exit Sub 
	   idata=httppost(reversehost,reverseurl)
      For i=0 To idata-1
   	   zwebtext[i]=recvdata(i)
      Next
      zwebtext[idata]=0
      If quit2=1 Or tquitweb=1 Then Exit Sub 
      getreverse(zwebtext)
      If reverselocation<>"" Then addreversei(latx,lngx,reverselocation)
      sleep t300
   Else
    Var lati=latx+dxreverse*sin1,lngi=lngx+cos1*dxreverse*klon	
    jreverse=getreversei(lati,lngi)	
    If jreverse=0 And (max(Abs(latreverse-lati),Abs(lngreverse-lngi)/klon)>dxreverse) Then'dx0/2'dx/2
      If quit2=1 Or tquitweb=1 Then Exit Sub 
      myquery="format=xml&lat="+Str(lati)+"&lon="+Str(lngi)+"&zoom=10&addressdetails=1&accept-language=en"
      reversehost="nominatim.openstreetmap.org"
      reverseurl="reverse?"+myquery
	   idata=httppost(reversehost,reverseurl)
      For i=0 To idata-1
   	   zwebtext[i]=recvdata(i)
      Next
      zwebtext[idata]=0
      If quit2=1 Or tquitweb=1 Then Exit Sub
      Var lngreverse0=lngreverse,latreverse0=latreverse,reverselocation0=reverselocation,countrycode0=countrycode
      getreverse(zwebtext)
      If reverselocation<>"" Then addreversei(lati,lngi,reverselocation)
      lngreverse=lngreverse0:latreverse=latreverse0:reverselocation=reverselocation0:countrycode=countrycode0 
      sleep t300
    EndIf  
   EndIf

   idata=httppost(myoverpass,path)
   If idata=0 Then setioverpass():Exit Sub
   For i=0 To idata-1
   	zwebtext[i]=recvdata(i)
   Next
   zwebtext[idata]=0
   'guinotice Left(zwebtext,400)
   If quit2=1 Or tquitweb=1 Then Exit Sub 
   getnodes(zwebtext)
      
	sleep t300
EndIf 
End Sub
Sub loadopentown2()
Dim As Integer i,idata

   If quit2=1 Or tquitweb=1 Then Exit Sub 
	ddtweb=Timer 
	idata=httppost(myoverpass,wayurl)
   If idata=0 Then setioverpass():Exit Sub
	dtweb=Timer-ddtweb
   For i=0 To idata-1
   	zwebtext[i]=recvdata(i)
   Next
   zwebtext[idata]=0
   'If InStr(zwebtext,"man_made")>0 Then guinotice Mid(zwebtext,InStr(zwebtext,"man_made"),800)
   If quit2=1 Or tquitweb=1 Then Exit Sub
   Sleep t300:tloadwebtext2=200 
   getways2(zwebtext)
   'guinotice(msgprint)
   msgprint=""
   If quit2=1 Or tquitweb=1 Then Exit Sub 
   updateways()
   tcancel=0
   'auxvar=nway2
   sleep t300
End Sub
Sub loadopentown3(tgetway As Integer=0)
Dim As Integer i,idata
If myiasknode>0 Then
	zwebtext0=zwebtext
	myiasknode2=0
	myiasknode3=0
   nodeurl=myoverpass2+"interpreter?data=[out:json];%28"
	For i=1 To myiasknode
		nodeurl+="node%28"+Str(myasknodeid(i))+"%29;"
		If Len(nodeurl)>4900 Then myiasknode2=i:Exit for
	Next
   nodeurl+="%29%3Bout%20skel%20299%3B"
   Sleep t300
	idata=httppost(myoverpass,nodeurl)
   If idata=0 Then setioverpass():Exit Sub
   For i=0 To idata-1
   	zwebtext[i]=recvdata(i)
   Next
   zwebtext[idata]=0
   'guinotice Left(zwebtext,400)
   If quit2=1 Or tquitweb=1 Then Exit Sub 
   addasknodes(zwebtext)
   If myiasknode2>1 Then 
     nodeurl=myoverpass2+"interpreter?data=[out:json];%28"
	  For i=myiasknode2+1 To myiasknode
	 	nodeurl+="node%28"+Str(myasknodeid(i))+"%29;"
 		If Len(nodeurl)>4900 Then myiasknode3=i:Exit for
 	  Next
     nodeurl+="%29%3Bout%20skel%20299%3B"
     Sleep t300
	  idata=httppost(myoverpass,nodeurl)
     If idata=0 Then setioverpass():Exit Sub
     For i=0 To idata-1
   	 zwebtext[i]=recvdata(i)
     Next
     zwebtext[idata]=0
     'guinotice Left(zwebtext,400)
     If quit2=1 Or tquitweb=1 Then Exit Sub 
     addasknodes(zwebtext)
   EndIf
   If myiasknode3>1 Then 
     nodeurl=myoverpass2+"interpreter?data=[out:json];%28"
	  For i=myiasknode3+1 To myiasknode
	 	nodeurl+="node%28"+Str(myasknodeid(i))+"%29;"
 		If Len(nodeurl)>4900 Then Exit for
 	  Next
     nodeurl+="%29%3Bout%20skel%20299%3B"
     Sleep t300
	  idata=httppost(myoverpass,nodeurl)
     If idata=0 Then setioverpass():Exit Sub
     For i=0 To idata-1
   	 zwebtext[i]=recvdata(i)
     Next
     zwebtext[idata]=0
     'guinotice Left(zwebtext,400)
     If quit2=1 Or tquitweb=1 Then Exit Sub 
     addasknodes(zwebtext)
   EndIf
   If quit2=1 Or tquitweb=1 Then Exit Sub 
   If tgetway=0 Then
   	getways2bridge(zwebtext0)
   Else 
   	getways2(zwebtext0)
   EndIf
   'guinotice(Str(myiasknode))
	sleep t300
EndIf

   'guinotice("ok nnode="+Str(nnode2)+"  nway="+Str(nway2))
   auxvar3+=1000
   'auxvar2=nnode2
   'auxvar2=nerr
   'auxvar=nway2+0.1
End Sub 	
Sub inittown22(ByVal userdata As Any Ptr)
	tcancel=1
	t11=2
	loadopentown()
	tinittown=22
	If quit2=1 Or tquitweb=1 Or toverpasserror>0 Then tinittown=0:tloadwebtext=0:tquitweb=0:tcancel=0
	'tloadwebtext2=22
	'tinittown=0
	t11=2
	tloadwebtext2=0
	tloadwebtext=0
	If t11>1 Then tloadwebtext=max(tloadwebtext,Timer-t10)
End Sub
Sub inittown222(ByVal userdata As Any Ptr)
	tcancel=1
	t11=2'0
	loadopentown2()
	tcancel=0
	tinittown=23
	If quit2=1 Or tquitweb=1 Or toverpasserror>0 Then tinittown=0:tloadwebtext=0:tcancel=0
	If tloadwebtext2=200 Or tquitweb=1 Or toverpasserror>0 Then tloadwebtext2=0
	tquitweb=0
	t11=2'0
	If t11>1 Then tloadwebtext=max(tloadwebtext,Timer-t10)
End Sub 
Sub inittown223(ByVal userdata As Any Ptr)
	tcancel=0
	t11=0
	loadopentown3()
	tcancel=0
	tinittown=0:tloadwebtext=0:tquitweb=0
	tloadwebtext2=0
	myroadlat=-99
	t11=0
	Sleep t300'1000
	tloadwebtext=Timer-t10-99
	'If t11>1 then tloadwebtext=max(tloadwebtext,Timer-t10)
End Sub 
Dim Shared As Double weathertime,weatherlat,weatherlng
Sub getweather(ByVal userdata As Any Ptr)
Var weatherhost="api.openweathermap.org"'/data/2.5/weather?lat="+Str(lat)+"&lon="+Str(lng)+"&APPID=4cd1de75fbc57d92794e74ec918593ca"	
Var weatherurl="data/2.5/weather?lat="+Str(lat)+"&lon="+Str(lng)+"&APPID=4cd1de75fbc57d92794e74ec918593ca"	
var idata=httppost(weatherhost,weatherurl)
If idata>0 Then  
  Dim As Integer i,j,k
  For i=0 To idata-1
   	 zwebtext[i]=recvdata(i)
  Next
  zwebtext[idata]=0
  'guinotice Left(zwebtext,600)
  wtext1=zwebtext
  wtext2=nextwords(wtext1,"""clouds"":")
  If wtext2<>"" Then
  	  wtext3=nextwords(wtext2,"""all""")
	  Var ncloud=(nextdata0(wtext3,":","}"))
	  If ncloud<>"" Then 
	  	 wclouds=Val(ncloud)
	  	 'guinotice ncloud+"/"+Str(wclouds)
	  	 tsubciel=1
	  EndIf
  EndIf 
  wtext2=nextwords(wtext1,"""visibility""")
  If wtext2<>"" Then
  	  Var nfog=nextdata0(wtext2,":",",")
  	  If nfog<>"" Then
  	  	wfog=Val(nfog)
  	  	tsubciel=1
  	  EndIf
  EndIf
  wtext2=nextwords(wtext1,"""temp_min""")
  If wtext2<>"" Then
  	  Var ntempmin=nextdata0(wtext2,":",",")
  	  If ntempmin<>"" Then
  	  	wtempmin=Val(ntempmin)-273
  	  	'guinotice Str(wtempmin)
  	  	'tsubciel=1
  	  EndIf
  EndIf
  wtext2=nextwords(wtext1,"""humidity""")
  If wtext2<>"" Then
  	  Var nhumidity=nextdata0(wtext2,":",",")
  	  If nhumidity<>"" Then
  	  	whumidity=Val(nhumidity)
  	  	'guinotice Str(whumidity)
  	  	'tsubciel=1
  	  EndIf
  EndIf
EndIf  
tsnow=0
If wtempmin<3 And whumidity>=80 Then tsnow=1
'guinotice Left(zwebtext,400)
Sleep 500
Var myoverpass=overpass(ioverpass)'"overpass-api.de"
Var myoverpass2=overpass2(ioverpass)
Var dx=30.0*360/40000
Var lat1=lat-dx,lon1=lng-dx*klon
var lat2=lat+dx,lon2=lng+dx*klon
Var latlon="%28"+Str(lat1)+"%2C"+Str(lon1)+"%2C"+Str(lat2)+"%2C"+Str(lon2)+"%29"
Var keyway="way['leaf_type']"+latlon
Var wayurl=myoverpass2+"interpreter?data=[out:json];%28"+keyway
wayurl+="%29%3Bout%20qt%202%3B" 
If quit2=1 Or tquitweb=1 Then tloadwebtext2=0:Exit Sub 
idata=httppost(myoverpass,wayurl)
If idata=0 Then setioverpass():tloadwebtext2=0:Exit Sub
Dim As Integer i 
For i=0 To idata-1
  	zwebtext[i]=recvdata(i)
Next
zwebtext[idata]=0
'guinotice Left(zwebtext,700)
wtext2=Left(zwebtext,idata) 
wtext3=nextwords(wtext2,"""leaf_type"":")
wtext3=nextdata0(wtext3,"""","""")
'guinotice wtext3'broadleaved ' needleleaved ' mixed
treetype="mixed"  
If wtext3="broadleaved" Then treetype="broad"
If wtext3="needleleaved" Then treetype="needle"
'treetype="mixed"
setarbretype(treetype)
Sleep 100
tloadwebtext2=0
End Sub
Sub testgetweather()
If tloadwebtext2<>0 Or httpon<>0 Then Exit Sub
If Abs(weathertime-Timer)<120 And Abs(weatherlat-lat)<0.1 And Abs(weatherlng-lng)<0.1*klon Then
	Exit Sub 
EndIf
tloadwebtext2=2
weathertime=Timer:weatherlat=lat:weatherlng=lng
threaddetach(ThreadCreate(@getweather))
End Sub
Dim Shared As Integer tsubtest=0
Declare Sub drawmaptestterrain()
Declare Sub drawmaptestterrain0()
Sub substartrain()
train=Timer-60:krain=99:rain=1:wclouds=99:whumidity=99
train=timer+60
End Sub
Declare Sub substat()
Sub subtest()
'substat():Exit Sub
'guinotice "test" 
'substartrain():Exit Sub 
glviewport(0,0,xmax,ymax)
glpushmatrix
drawmaptestterrain0()
glpopmatrix
guirefreshopenGL()
While guitestkey(vk_space)=0 And quit=0:guiscan:Sleep 100:Wend
Sleep 300:guiscan
glpushmatrix
drawmaptestterrain()
glpopmatrix 
guirefreshopenGL()
While guitestkey(vk_space)=0 And quit=0:guiscan:Sleep 100:Wend
Exit sub
mz+=350:mz1=mz:mz11=mz:Exit sub
Dim As Integer i
'tquitweb=1:Return
Var msg=""
For i=0 To 18
 	Var j=iaeroway-i:If j<1 Then j+=naeroway
	msg+=aerowayname(j)+"/ "+Str(aerowaylat(j))+" / "
Next
guinotice msg
myTTSspeak(aerowayname(iaeroway),1+SVSFPurgeBeforeSpeak)
Exit Sub 
 If tloadwebtext2=0 Then
 	tloadwebtext2=11
 	'threaddetach(ThreadCreate(@loadwebtext))'subtest2))
 	'threaddetach(ThreadCreate(@subtest2))
 EndIf
 Exit Sub 
'lattown=-89
xweb1=xweb-999999:guinotice("ok")
Exit Sub
Var lat0=lat,lng0=lng
mxytolatlng(xweb,yweb)
Var lat11=lat,lng11=lng
lat=lat0:lng=lng0
guinotice(Str(lat11-lat))
Exit Sub 
If tloadwebtext2=0 Then
	tloadwebtext2=2
   If tinittown=0 Then
	   tinittown=1
	   loadopentown()
	   'inittown()
	   tinittown=0
   EndIf
   tloadwebtext2=0 
  'If tloadwebtext2=0 Then threaddetach(ThreadCreate(@subtest2))
  Sleep 100
EndIf 
End Sub
Sub subtest0
	'xweb=mx+dmx0
	'yweb=my+dmy0
	'loadwebtext()
Dim As Single mxx,myy
worldxytomxy(0,0,mxx,myy):
worldxytomxy(-750,-750/2,mxx,myy)
worldxytomxy(750,750/2,mxx,myy)
End Sub
'Dim Shared As Integer nbridge=500,ibridge=0
'Dim Shared As Single bridgelat(nbridge),bridgelon(nbridge),bridgelat2(nbridge),bridgelon2(nbridge)
Sub resetbridge()
Dim As Integer i  	
For i=0 To nbridge
	bridgelat(i)=-89.5
	bridgelon(i)=-179.5
	bridgelat2(i)=-89.5
	bridgelon2(i)=-179.5
	bridgename(i)=""
Next
For i=0 To nfuel
	fuelid(i)=0
	fuelx(i)=999999
	fuely(i)=999999
	fueldo1(i)=0
	fuelz(i)=-999999
Next
End Sub
resetbridge()
Function testbridge(latx As Single,lngx As Single)As Integer
Dim As Integer i,j,k 
Dim As Single dlat,dlon,blat,blon,dxy,dxy0,dx,dy
For i=0 To nbridge
  If Abs(bridgelat(i)-latx)<360/4000.0 Then
		If Abs(bridgelon(i)-lngx)<klon*360/4000.0 Then
			blat=bridgelat(i)
			blon=bridgelon(i)
			dlat=bridgelat2(i)-blat
			dlon=(bridgelon2(i)-blon)/klon
			dxy0=dlat*dlat+dlon*dlon
			dx=(lngx-blon)/klon
			dy=latx-blat
			dxy=dx*dlon+dy*dlat
			If dxy>0 And dxy<dxy0 Then 
				If Abs(dx*dlat-dy*dlon)<dxy0*0.025 Then Return 1
			EndIf
		EndIf
  EndIf 		
Next
Return 0 
End Function
Dim Shared As Integer bridgecolor(nbridge) 
Sub drawbridge2(size As Single,bridgetext As uint,bridgesidetext As uint,scaleh As Single=1.0)
Dim As Single sizex=400,size2=max(3000,Sqr(size)*100)
Dim As Integer i,j
         'Var do1=radtodeg*(size2/max(0.001,size))/40
         'glrotatef(do1,0,0,1)
         Var scaley=min(1.0,1.2*scaleh)
         glscalef(scaley,1,scaleh)
			gltranslatef(0,0,size2*0.058-4)
			glcolor4f(1,1,1,0)
			glbindtexture(gl_texture_2d,boattext)
			gltexcarre4(size2/43,size)
			Var xx=size2*0.5/43,yy=size/2,zz=size2*0.058,tx=1
			tx=1+Int(size/8500)
			gltexquad(-xx,-yy,0,-xx,-yy*1.52,-zz,xx,-yy*1.52,-zz,xx,-yy,0)
			gltexquad(-xx,yy,0,-xx,yy*1.52,-zz,xx,yy*1.52,-zz,xx,yy,0)
			gltranslatef(-size2/80,0,-size2*0.058)
			glcolor4f(1,1,1,1)
			glbindtexture(gl_texture_2d,bridgetext)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
         'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
			gltexface2(size,size2/5,0.0004*size2,tx)
			gltranslatef(size2/40,0,0)
			gltexface2(size,size2/5,0.0004*size2,tx)
			glbindtexture(gl_texture_2d,bridgesidetext)
			For i=0 To tx-1
			 Var dx=((i-(tx-1)*0.5))*size/tx
			 glpushmatrix 
			 gltranslatef(0,dx,0)	
			 gltranslatef(-size2/80,-size*0.3018/tx,0)
			 glrotatef(90,0,0,1)
			 gltexface2(size2/35,size2/5,0.001*size2)
			 gltranslatef(size*2*0.3018/tx,0,0)
			 gltexface2(size2/35,size2/5,0.001*size2)
			 glpopmatrix
			Next i 
				
End Sub
dim shared as single kscalehbridge=1
Function setbridgecolor(x As Single,y As Single,xx As Single,yy As Single,z0 As Single,z1 As Single)As Integer 
'Var z=(getterrainheightfast(x-dmx0,y-dmy0)+getterrainheightfast(xx-dmx0,yy-dmy0))*0.5
Dim As Integer twater=0,j,di=9
'Dim As Single dh=20*scalez'100
Dim As Single dz=(z1-z0)/di,h=0,hh=0,dx=(xx-x)/di,dy=(yy-y)/di
Var xxx=x-dy-dy-dy,yyy=y+dx+dx+dx
Var xxxx=x+dy+dy+dy,yyyy=y-dx-dx-dx
kscalehbridge=1
For j=1 To di-1
	xxx+=dx:yyy+=dy
	If max(Abs(mx-xxx),Abs(my-yyy))>20000 Then Continue For 
	Var dzzz=getterrainheightfast(xxx,yyy)
	If dzzz<waterz+0.15 Then Return 100
	'If dzzz<=waterz+1 Then twater=2:Exit For
	xxxx+=dx:yyyy+=dy
	Var dzzzz=getterrainheightfast(xxxx,yyyy)
	If dzzzz<waterz+0.15 Then Return 100
	Var hi=(z0+j*dz)-dzzz
	h=max(h,hi)
	'hh=min(hh,hi)
	'If dzzz>z+1 And twater<=1 Then twater=-1
	'If dzzz<z-20 And twater>=0 And twater<=1 Then twater=1
Next
'If hh<-50*scalez Then Return 0
var hii=min2(99,32*Int(1+3*h/(10*scalez)))
'kscalehbridge=hii/99
Return hii
End Function  
Sub drawbridges()
Dim As Integer i,j,k
Dim As Single x,y,z,size,do1,dxy,xx,yy,dx,dy
Var lat0=lat,lng0=lng
mxytolatlng(mx,my)'xweb,yweb)
latmx=lat:lngmx=lng
lat=lat0:lng=lng0
Var dlatx=10*360.0/40000,dlonx=dlatx*klon
mzbridge=-999999
if tdark=199 Then
	glenable gl_lighting
	glenable gl_normalize
Else
	gldisable gl_lighting
EndIf
gldisable gl_fog
myibridge=0
For i=0 To nbridge
	bridgex(i)=-9999999
	If Abs(bridgelat(i)-latmx)<dlatx Then
		If Abs(bridgelon(i)-lngmx)<dlonx Then
			latlngtomxy(bridgelat(i),bridgelon(i),x,y)
			latlngtomxy(bridgelat2(i),bridgelon2(i),xx,yy)
         Var z0=getterrainheight(x-dmx0,y-dmy0),z1=getterrainheight(xx-dmx0,yy-dmy0)
         z=(z0+z1)/2
         bridgecolor(i)=setbridgecolor(x,y,xx,yy,z0,z1)
         If z0<waterz+0.1 Or z1<waterz+0.1 Then bridgecolor(i)=100
        If bridgecolor(i)>0 Then  
			dx=xx-x
			dy=yy-y
			If Abs(bridgeo1(i))<0.000001 Then
				do1=diro1(dx,dy)+90
				bridgeo1(i)=do1+0.000002
			Else
				do1=bridgeo1(i)
			EndIf
			dxy=max(Sqr(dx*dx+dy*dy),0.001)
			Var co1=dx/dxy,si1=dy/dxy
			If Abs(z1-z0)>dxy/5 Then Continue For 
			var x0=x,y0=y,kx=1.0'.2
			x+=(xx-x)*kx/2
			y+=(yy-y)*kx/2
         'x=341400*kscalex/500:y=1885900*kscalex/500:do1=-34:size=34000
         'z=waterz-50
         size=dxy*kx'*500/kscalex
			bridgex(i)=x
			bridgey(i)=y
		   rotavion(x-mx-dmx0,y-my-dmy0,z-mz)
		   If x2>(0.8*max(Abs(y2),Abs(z2))-2*size-3000) And x2<dxterrain*scalex+size+3000 Then
			 myguiloadtexture(bridgeredtext,"objects/town/bridge_red.jpg",240)
			 myguiloadtexture(bridgeredsidetext,"objects/town/bridgeside_red.jpg",230)
			 myguiloadtexture(bridgeyellowtext,"objects/town/bridge_yellow.jpg",240)
			 myguiloadtexture(bridgeyellowsidetext,"objects/town/bridgeside_yellow.jpg",230)
          glenable gl_alpha_test
          glAlphaFunc(gl_less,60/254)
          Var kscaleh=0.5
			 Var scaleh=bridgecolor(i)*0.01*kscaleh
          If taddshadowquad=1 Then
   	     If (Abs(x2)<400+size) And (ishadow<nshadow-200) Then
            Var size2=max(3000,Sqr(size)*100)
            Var dxx=co1*size2/80,dyy=si1*size2/80
            Var dz=size2*0.058*kscaleh/2
            myshadowtext=bridgeredtext
			   myshadowtx=1+Int(size/8500)
            Var dxxyy=dxshadow*si1-dyshadow*co1
            If dxxyy>0 Then 
   	    	   addshadowquad(x0-dyy,y0+dxx,z0,xx-dyy,yy+dxx,z1,(size2/5),2)
  	    	   	If Abs(dxxyy)<0.54 Then   
  	    	   	  myshadowtext=0
  	    	   	  addshadowquad(x0-dyy,y0+dxx,dz,xx-dyy,yy+dxx,dz,(size2/73),3)
               EndIf 
            Else    
   	    	   addshadowquad(x0+dyy,y0-dxx,z0,xx+dyy,yy-dxx,z1,(size2/5),2)
  	    	   	If Abs(dxxyy)<0.54 Then   
  	    	   	  myshadowtext=0
  	    	   	  addshadowquad(x0+dyy,y0-dxx,dz,xx+dyy,yy-dxx,dz,(size2/73),3)
               EndIf 
            EndIf  
   	    	myshadowtext=0
   	    	myshadowtx=1
   	     EndIf
          EndIf 
			 glpushmatrix
			 gltranslatef(x-dmx0,y-dmy0,z+40-90*scaleh)
			 'glscalef(0.5,1,0.5)
			 glrotatef(do1,0,0,1)
			 glscalef(kscalex/500,kscalex/500,kscalex*0.5/500)
          Var dz0=z0,dz1=z1'dz0=z0+40-90*scaleh,dz1=z1+40-90*scaleh
			 Var do2=diro1(dxy,(z1-z0)),si2=(z1-z0)/dxy
			 glrotatef(-do2,1,0,0)
			 'If getterrainheightfast(x-dmx0,y-dmy0)<=waterz Then
			 If bridgecolor(i)>99.1 Then 
			 	drawbridge2(size,bridgeredtext,bridgeredsidetext,scaleh)
			 Else
			 	drawbridge2(size,bridgeyellowtext,bridgeyellowsidetext,scaleh)
			 EndIf
			 glpopmatrix
          gldisable gl_alpha_test
          If car>0 or plane=0 Then
           If tautopilot=0 Then d60road=60:d05road=60	
           'Var dz0=z0,dz1=z1'dz0=z0+40-90*scaleh,dz1=z1+40-90*scaleh
           Var size2=max(3000,Sqr(size)*100)*0.058*scaleh*0.5*kscalex/500
           'size2+=mzh+220*size2/469-90*scaleh
           size2+=40*(1-scaleh)
           myibridge1=i
           testroadautopilot(x0-dmx0,y0-dmy0,dz0+size2+si2*size*0.25,xx-dmx0,yy-dmy0,dz1+size2-si2*size*0.25,60,1)
          EndIf 
		   EndIf
		  EndIf 'bridgecolor 
		EndIf
	EndIf 	
Next i
If ifog>0 And tdark=0 Then glenable gl_fog
If tdark=1 Then
	glenable(gl_lighting)
	glenable gl_normalize
Else
	gldisable(gl_lighting)
	'gldisable gl_normalize
EndIf
End Sub
Sub addbridges(latx As Single,lngx As Single,latx2 As Single,lngx2 As Single,name0 As string)
Dim As Integer i,j,k
Dim As Single dlatx=0.400*360/40000
Dim As Single dlonx=dlatx*klon
taddbridge=0
if quit2=1 or tquitweb=1 then exit sub  
Var dx=(lngx2-lngx)/klon
Var dy=latx2-latx
Var dlatmin=0.100*360/40000
If Abs(dx)<dlatmin And Abs(dy)<dlatmin Then Exit Sub
taddbridge=1 
'If testworldobject(latx,lngx)=1 Then Exit Sub 
For i=0 To nbridge
	If Abs(latx-bridgelat(i))<dlatx Then
	 If Abs(lngx-bridgelon(i))<dlonx Then
	  If Abs(latx2-bridgelat2(i))<dlatx Then
		If Abs(lngx2-bridgelon2(i))<dlonx Then
	      Var name1=formatname(name0)
			If name1<>"" Then bridgename(i)=name1
			Exit sub
		EndIf
	  EndIf
	 EndIf  
	EndIf
Next
dx*=1000
dy*=1000
Var distx=Sqr(dx*dx+dy*dy)
For i=0 To nbridge
	If Abs(latx-bridgelat(i))<dlatx Then
		If Abs(lngx-bridgelon(i))<dlonx Then
			Var dxx=(bridgelon2(i)-bridgelon(i))*1000/klon
		   Var dyy=(bridgelat2(i)-bridgelat(i))*1000
		   Var distxx=Sqr(dxx*dxx+dyy*dyy)
		   If  dx*dxx+dy*dyy>0.5*distx*distxx Then
					/'bridgelat(i)=(latx+bridgelat(i))/2
					bridgelon(i)=(lngx+bridgelon(i))/2
	            If Abs(latx2-bridgelat2(i))<dlat Then
		          If Abs(lngx2-bridgelon2(i))<dlon Then
	   				bridgelat2(i)=(latx2+bridgelat2(i))/2
		   			bridgelon2(i)=(lngx2+bridgelon2(i))/2
		          EndIf
		         EndIf'/  
	            Var name1=formatname(name0)
					If name1<>"" Then bridgename(i)=name1
					If distxx>distx-0.00001 Then
						Exit Sub 
					EndIf
					bridgelat(i)=latx
					bridgelon(i)=lngx
					bridgelat2(i)=latx2
					bridgelon2(i)=lngx2
					Exit Sub 
		   EndIf
		EndIf
	EndIf
	If Abs(latx-bridgelat2(i))<dlatx Then
		If Abs(lngx-bridgelon2(i))<dlonx Then
			Var dxx=(bridgelon2(i)-bridgelon(i))*1000/klon
		   Var dyy=(bridgelat2(i)-bridgelat(i))*1000
		   Var distxx=Sqr(dxx*dxx+dyy*dyy)
		   If -dx*dxx-dy*dyy>0.5*distx*distxx Then
					/'bridgelat2(i)=(latx+bridgelat2(i))/2
					bridgelon2(i)=(lngx+bridgelon2(i))/2
	            If Abs(latx2-bridgelat(i))<dlat Then
		          If Abs(lngx2-bridgelon(i))<dlon Then
					   bridgelat(i)=(latx2+bridgelat(i))/2
					   bridgelon(i)=(lngx2+bridgelon(i))/2
		          EndIf
	            EndIf'/
	            Var name1=formatname(name0)
					If name1<>"" Then bridgename(i)=name1
					If distxx>distx-0.00001 Then Exit Sub
					bridgelat(i)=latx
					bridgelon(i)=lngx
					bridgelat2(i)=latx2
					bridgelon2(i)=lngx2
					Exit Sub  
		   EndIf
		EndIf
	EndIf
Next
dlatx=10*360/40000:dlonx=dlatx*klon
Var ibridge0=ibridge
Var dr=max(Abs(latx2-latx),Abs(lngx2-lngx)/klon)
Var dist=max(Abs(latx-lat),Abs(lngx-lng)/klon)/(0.05+dr)
Var p=-1,ibridge2=ibridge
For j=0 To nbridge
	ibridge2+=1:If ibridge2>nbridge Then ibridge2=0
	i=ibridge2
   'if(dist<Math.max(Math.abs(bridgemeshx[ibridgemesh]-x)/klon,
   '                 Math.abs(bridgemeshy[ibridgemesh]-y))/(1+bridgemeshscalex[ibridgemesh])){
   Var dr2=max(Abs(bridgelat2(i)-bridgelat(i)),Abs(bridgelon2(i)-bridgelon(i))/klon)
   Var dist2=max(Abs(bridgelat(i)-lat),abs(bridgelon(i)-lng)/klon)/(0.05+dr2)
   If dist2>dist Then
    p=i
	 If Abs(latx-bridgelat(i))>dlatx And Abs(latx-bridgelat2(i))>dlatx Then Exit For
	 If Abs(lngx-bridgelon(i))>dlonx And Abs(lngx-bridgelon2(i))>dlonx Then Exit For
   EndIf 
Next j 
If p>=0 Then
	i=p
Else
	ibridge+=1:if ibridge>nbridge then ibridge=0
	i=ibridge
EndIf
bridgelat(i)=latx
bridgelon(i)=lngx
bridgelat2(i)=latx2
bridgelon2(i)=lngx2
Var name1=formatname(name0)
bridgename(i)=name1
End Sub
Sub drawmaptest0()
Dim As Integer i,j,k,n,p,ij,ntot
Dim As Single r,g,b
gldisable gl_depth_test
gldisable gl_texture_2D    
Var ij0=gettownij(mx+dmx0,my+dmy0)
Var i0=itownij,j0=jtownij
Var i00=i0,j00=j0
For i=-i50 To i50
  For j=-i50 To i50
     ij=(i+i50)*i101+j+i50+1
     ij=max2(0,min2(ntown,ij))
	  n=min2(ntownnode,townnwaynode(ij))
	  ntot+=n
	  r=max(0,min(1.0,n/(200+n)))
	  g=max(0,min(1.0,1-r))
	  b=0
	  If settownijxy(ij)=1 Then
	  	  Var x=xtownij-dmx0,y=ytownij-dmy0
	  	  Var dz=0.0
	  	  For k=0 To 5
	  	  	   dz=getterrainheightfast(x+k*100,y)
	  	      If dz<waterz+0.8 Then'And max(Abs(x-mx),Abs(y-my))<70000 Then
	  	  	      b=1:r*=0.4:g*=0.4
	  	  	      Exit For 	  
	  	      EndIf
	  	  Next k    
	  ElseIf n=0 Then 	  
	  	  	  b=0.7:r*=0.4:g*=0.4
	  EndIf
	  If ij=ij0 Then
	  	  b=0.1:r=0:g=0
	  	  i0=i:j0=j
	  EndIf
	  glcolor3f(r,g,b)
     glpushmatrix
	  glplacecursor(xmax*0.5+270*j/i50,ymax*0.5+270*i/i50,-40)
	  glcarre(0.5)
	  glpopmatrix
  Next
Next
glcolor3f(1,1,1)
glpushmatrix
gldrawtext("ntown="+Str(ntot),200,100,1.2)
gldrawtext("i0="+Str(i0),200,130,1.2)
gldrawtext("j0="+Str(j0),200,160,1.2)
'gldrawtext("i00="+Str(i00),200,190,1.2)
'gldrawtext("j00="+Str(j00),200,220,1.2)
glpopmatrix
glenable gl_texture_2D	
glenable gl_depth_test
Sleep 30
End Sub
Sub drawmaptest()
Dim As Integer i,j,k,n,p
Dim As Single r,g,b
gldisable gl_depth_test
gldisable gl_texture_2D 
r=0.5:g=r:b=r
glcolor3f(r,g,b)
glplacecursor(xmax*0.5,ymax*0.5,-40)
glcarre(15)
n=testtreedx   
For i=1 To n Step 8
	For j=1 To n Step 8
	  'If testtree(i,j)=0 Then
	  '	  Continue For 
	  '	  If (1 And i) then Continue For 
	  '	  If (1 And j) Then Continue For  
	  'EndIf
	  r=0.7:g=r:b=r
	  r=testroadr(i,j)/255
	  g=testroadg(i,j)/255
	  b=testroadb(i,j)/255
	  If testroad(i,j)=3 Then r=0:g=0:b=0.5
	  If testtree(i Shr 1,j Shr 1)=1 Then r=0:b=0:g=1
	  If testtree(i Shr 1,j Shr 1)=2 Then r=0:b=0:g=0.4
	  glcolor3f(r,g,b)
     glpushmatrix
	  glplacecursor(xmax*0.5+270*(-1+2*i/n),ymax*0.5+270*(-1+2*j/n),-40)
	  glcarre(0.15)
	  glpopmatrix
  Next
Next
glcolor3f(1,1,1)
glenable gl_texture_2D	
glenable gl_depth_test
Sleep 30	
End Sub
Sub drawmaptestterrain0()
Dim As Integer i,j,k,n,p
Dim As Single r,g,b,dz
gldisable gl_depth_test
gldisable gl_texture_2D 
r=0.5:g=r:b=r
glcolor3f(r,g,b)
glplacecursor(xmax*0.5,ymax*0.5,-40)
glcarre(15.5)
n=512 
Var ii0=(mx-xweb)/scalex+256
Var jj0=(my-yweb)/scalex+256 
For i=1 To n 'Step 2
	For j=1 To n 'Step 2
	  Var dxx=512/(dxterrain*2.2)'(i101*2)
	  Var ii=256+(i-256)/dxx
	  Var jj=256+(j-256)/dxx
	  Var dz=(terrain(ii,jj))*scalez
	  dz=(waterz+(dz-waterz)*3)
	  Var d10=max(10.0,(myzmax-myzmin)*scalez*0.04)
  r=max(0.0,min(1.0,(d10+dz)/(10*d10+Abs(dz))))
	  g=1-r:b=0
	  If dz<waterz Then b=1
	  If Abs(ii-ii0)<0.5 And Abs(jj-jj0)<0.5 Then r=0:g=0:b=0
	  glcolor3f(r,g,b)
     glpushmatrix
	  glplacecursor(xmax*0.5+270*(-1+2*i/n),ymax*0.5-270*(-1+2*j/n),-40)
	  glcarre(0.15)
	  glpopmatrix
  Next
Next
glcolor3f(1,1,1)
glenable gl_texture_2D	
glenable gl_depth_test
Sleep 30	
End Sub
Sub drawmaptestterrain()
Dim As Integer i,j,k,n,p
Dim As Single r,g,b
gldisable gl_depth_test
gldisable gl_texture_2D 
r=0.5:g=r:b=r
glcolor3f(r,g,b)
glplacecursor(xmax*0.5,ymax*0.5,-40)
glcarre(15.5)
'ReDim Shared As uint webpicr(1 To bmpwebx2*bmpweby2)
n=bmpwebx2
Var sc=2.0   
For i=1 To n Step 2
	For j=1 To n Step 2
	  Var ij=n*(j-1)+i
	  If ij<1 Or ij>n*n Then Exit For,For
	  r=webpicr(ij)/255
	  g=webpicg(ij)/255
	  b=webpicb(ij)/255
	  glcolor3f(r,g,b)
     glpushmatrix
	  glplacecursor(xmax*0.5+sc*270*(-1+2*i/n),ymax*0.5+sc*270*(-1+2*j/n),-40)
	  glcarre(sc*0.15)
	  glpopmatrix
  Next
Next
glcolor3f(1,1,1)
glenable gl_texture_2D	
glenable gl_depth_test
Sleep 30	
End Sub
Sub drawmxy(mxx As Single,myy As Single)
'Var lati=49.3532117,loni=0.0627624
'Var lat0=lat,lng0=lng,mxx=mx,myy=my
'latlngtomxy(lati,loni,mxx,myy)
'lat=lat0:lng=lng0
glpushmatrix
gltranslatef(mxx,myy,getterrainheight(mxx,myy))
gltexsphere(40)
glpopmatrix
End Sub
Sub drawtest()
/'Var lati=49.3532117,loni=0.0627624
Var lat0=lat,lng0=lng,mxx=mx,myy=my
latlngtomxy(lati,loni,mxx,myy)
lat=lat0:lng=lng0
glpushmatrix
gltranslatef(mxx-dmx0,myy-dmy0,mzsol0)
gltexsphere(40)
glpopmatrix '/
'Exit Sub
	 'auxtest=0.1':auxvar=ioverpass+0.1'ntown-ntown2
	 'Return
	 If auxtest<0.69 Then Exit Sub   
    Var xx=lattown,yy=lngtown
    Var xxx=mx,yyy=my
    latlngtomxy(xx,yy,xxx,yyy)
    'xxx=mx+dmx0+cos1*4000:yyy=my+dmy0+sin1*4000
    glpushmatrix
    gltranslatef(xxx-dmx0,yyy-dmy0,getterrainheight(xxx-dmx0,yyy-dmy0))
    If tinittown<>0 Then glcolor3f(0,1,1) Else glcolor3f(1,0,0)
    gldisable gl_texture_2D
    glsphere 1000
    glcolor3f(1,1,1)
    glenable gl_texture_2d
    glpopmatrix	
    Exit Sub 
     
    xx=lattown:yy=lngtown
    latlngtomxy(xx,yy,xxx,yyy)
Var dij=7*100/kscalex
Var i50=int(25/dij),i101=i50+i50+1
    xxx=towpx(i50*i101+i50+1):yyy=towpy(i50*i101+i50+1)
    glpushmatrix
    gltranslatef(xxx-dmx0,yyy-dmy0,getterrainheight(xxx-dmx0,yyy-dmy0))
    glcolor3f(0.7,0.7,0.7)
    gltexsphere 5000
    glpopmatrix	

    xxx=towpx(i50*i101+i50+1-4*i101):yyy=towpy(i50*i101+i50+1-4*i101)
    xxx=townmapx0:yyy=townmapy0
    glpushmatrix
    gltranslatef(xxx-dmx0,yyy-dmy0+9000,getterrainheight(xxx-dmx0,yyy-dmy0))
    glcolor3f(0.7,0.7,0.7)
    gltexsphere 9000
    glpopmatrix	

    xxx=townx(i50*i101+i50+1):yyy=towny(i50*i101+i50+1)
    xxx=mxtest:yyy=mytest
    glpushmatrix
    gltranslatef(xxx-dmx0,yyy-dmy0,getterrainheight(xxx-dmx0,yyy-dmy0))
    glcolor3f(0.7,0.7,0.7)
    gltexsphere 1000
    glpopmatrix	

End Sub
Const As String abcd="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_+="
Function formaturl(text As string)As String
Dim As Integer i
Dim As String c,txt
txt=""
For i=1 To Len(text)
	c=Mid(text,i,1)
	If InStr(abcd,c)>0 Then txt+=c
	If c=" " Then txt+="+"	
Next
Return txt
End Function
Sub substat()
If FileExists(ExePath+"/woman/girl2.jpg") Then Exit Sub 
'Exit sub
Dim As Integer i
Sleep 900
Var hwin0=getforegroundwindow()
If hwin0<>getguih("win") Then Exit Sub 
Var url="https://chungkn1400.github.io/json_osm_chung/json_osm_chung/stat.html"
url="http://chungswebsite.blogspot.fr/p/exit.html?"+formaturl(guigettext("win")+"+"+reverselocation)
url="http://chungswebsite.blogspot.fr/search/label/freewebcar_chung#"+formaturl(guigettext("win")+"="+reverselocation)
ShellExecute(NULL,"open",url,NULL,NULL,SW_SHOWmaximized)
'ShellExecute(NULL,"open","iexplore.exe",url,NULL,SW_SHOWmaximized)
Sleep 4000
Var hwin=getforegroundwindow()
If hwin=hwin0 Then
	Sleep 4000
	hwin=getforegroundwindow()
EndIf
If hwin=hwin0 Then
	Sleep 4000
	hwin=getforegroundwindow()
EndIf
Sleep 300
Exit Sub 
/'      Var text=Space(255)+Chr(0)
      GetWindowText(hwin, text,255)
      Var title=LCase(Trim(text))
If InStr(title,"stat")>0 Or InStr(title,"chungkn1400")>0 Or _  
  	  	  	     InStr(title,"mozilla")>0 Or _ 
  	  	  	     InStr(title,"chrome")>0 Or _ 
  	  	  	     InStr(title,"explorer")>0 Or _ 
  	  	  	     InStr(title,"safari")>0 Or _ 
  	  	  	     InStr(title,"opera")>0 Or _ 
  	  	  	     InStr(title,"microsoft")>0 Then
  	'/
	If hwin<>hwin0 Then sendmessage(hwin, WM_CLOSE, 0,0)
'EndIf
SetWindowPos hwin0, HWND_TOPMOST, 0, 0, 0, 0, SW_SHOW Or SWP_SHOWWINDOW Or SWP_NOMOVE Or SWP_NOSIZE
Sleep 900
End Sub    
Sub subgooglemap()
Sleep 300
Var hwin0=getforegroundwindow()
If hwin0<>getguih("win") Then Exit Sub 
Var hostname="maps.googleapis.com"  
Var mapstyle3="&style=feature:road%7Cvisibility:on&style=element:labels%7Cvisibility:off&style=element:geometry.stroke%7Cvisibility:off"
Var path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(15)+"&scale="+Str(1)+"&size="+Str(Int(xmax*0.9))+"x"+Str(Int(ymax*0.9))+"&maptype=hybrid&format=jpg-baseline"
path="/maps/api/staticmap?center="+Str(lat)+","+Str(lng)+"&zoom="+Str(15)+"&scale="+Str(1)+"&size="+Str(Int(xmax*0.9))+"x"+Str(Int(ymax*0.9))+"&maptype=terrain&format=jpg-baseline"
Var url="https://"+hostname+path+mapstyle3+myapikey
'https://www.instantstreetview.com/@49.359839,0.08108,98.9h,5p,1z
Var lat0=lat,lng0=lng
mxytolatlng(mx,my)
Var latmx=lat,lngmx=lng
lat=lat0:lng=lng0
url="https://www.instantstreetview.com/@"+Str(latmx)+","+Str(lngmx)+","+Str(Int(90-o1))+"h,5p,1z" 
ShellExecute(NULL,"open",url,NULL,NULL,SW_SHOWmaximized)
'ShellExecute(NULL,"open","iexplore.exe",url,NULL,SW_SHOWmaximized)
sleep 1000	
guisetfocus("win.graph")
End Sub




















