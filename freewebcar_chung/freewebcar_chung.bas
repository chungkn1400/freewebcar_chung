'freewebcar_chung.bas by NGUYEN.Chung freeware (2011-2017)    
'
'#Define guinogfx 'dont use freebasic gfx 
Dim Shared As double auxvar,auxvar2,auxvar3,auxvar4,auxvar5,auxvar6,auxtest=0,auxtest0=0.8
Dim Shared As Single kfps=1,xmax,ymax
Dim Shared As String auxtext
Dim Shared As Integer quit=0,guierror=0
Dim As Integer i,j,k,n
Dim Shared As Integer tshowradio,tradio,fre00
fre00=Fre(0)
/'#include Once "GL/gl.bi" 
Sub myglpushmatrix
	auxvar6+=1
	glpushmatrix
End Sub
Sub myglpopmatrix
	auxvar6-=1
	glpopmatrix
End Sub
auxtest=1
#Undef glpushmatrix
#Undef glpopmatrix
#Define glpushmatrix myglpushmatrix
#Define glpopmatrix myglpopmatrix
'/
#Include Once "gui_chung.bi"
#Include Once "gl_chung.bi"
#Include once "md2loader.bi"
#include Once "win/mmsystem.bi"
#Include Once "mercator.bi"
'#Define NO_TEXT
'#include once "fltk-c.bi"
#Include Once "httppost.bi"
#Include Once "httpcurl.bi"
#Include Once "fbthread.bi"
#Include Once "srtm.bi"
#Include Once "woman.bi"
#Include Once "freeimage.bi"
#Undef char
#Define char UByte

/'On Error GoTo suberror
GoTo start 
suberror:
    guinotice "error number: " + Str( Err ) + " at line: " + Str( Erl )
    quit=1
    On Error GoTo 0
    guiclose
    guiquit
    end
start:'/

#Ifndef sounds2
Sub subsounds2()
End Sub
Sub testsounds2()
End Sub
Sub closesounds2()
End Sub
Dim Shared As Single do1woman=360*0
#EndIf 
Dim Shared As Integer gllist=0
Sub myglnewlist(a As uint,b As uint)
	glnewlist a,b 
	gllist=1
End Sub
Sub myglendlist()
	glendlist()
	gllist=0
End Sub
#Undef glnewlist
#Undef glendlist
#Define glnewlist myglnewlist
#Define glendlist myglendlist
Sub glbindtexture0(gltexture2d As uint,itexture As uint)
	glbindtexture(gltexture2d,itexture)
End Sub
Declare Sub myglbindtexture(gltexture2d As uint,itext As uint Ptr)
#Undef glbindtexture
#Define glbindtexture(a,b) myglbindtexture(a,@b)
#Define aglbindtexture(a,b) myaglbindtexture(a,@b)
#Include Once "agl_chung.bi"

#Inclib "./loadobj_chung"
Declare Function loadobj Cdecl Alias "loadobj" (Byval ficload As ZString Ptr,ByVal textlist As ZString Ptr,_ 
         Byval defauttext As ZString Ptr) As Integer        
Declare Function loadobjsize Cdecl Alias "loadobjsize" (Byval ficload As ZString Ptr,ByVal textlist As ZString Ptr,_ 
         Byval defauttext As ZString Ptr, ByVal size As uint) As Integer 'returns resize scale*1000        
#Inclib "./load3ds_chung"
Declare Function load3DS Cdecl Alias "load3DS" (Byval ficload As ZString Ptr,ByVal textlist As ZString Ptr,_ 
         Byval defauttext As ZString Ptr) As Integer        
'call with autoresize desired size=integer 
Declare Function load3DSsize Cdecl Alias "load3DSsize" (Byval ficload As ZString Ptr,ByVal textlist As ZString Ptr,_ 
         Byval defauttext As ZString Ptr, ByVal size As uint) As Integer        
Declare Function load3DSsizesmooth Cdecl Alias "load3DSsizesmooth" (Byval ficload As ZString Ptr,ByVal textlist As ZString Ptr,_ 
         Byval defauttext As ZString Ptr, ByVal size As uint) As Integer        
Type vertex_type
    As single x,y,z
End Type
'polygon (triangle), 3 numbers that aim 3 vertices
Type polygon_type
    As Integer a,b,c,flags
End Type 
'mapcoord type, 2 texture coordinates for each vertex
Type mapcoord_type
    As single u,v
End Type 
'myobject type
#Define max_obj 200
#Define max_vertices 64000
#Define max_polygons 64000
#Define max_textures 64000
Type  myobj_type
    As ZString*200 nameobj(max_obj-1)
    As Integer obj_poly(max_obj-1)

    As Integer vertices_qty
    As Integer polygons_qty
    As Integer textures_qty

    As vertex_type vertex(max_vertices-1)
    As polygon_type polygon(max_polygons-1)
    As mapcoord_type mapcoord(max_textures-1)
End Type
Declare Function load3DSsizeptr Cdecl Alias "load3DSsizeptr" (Byval ficload As ZString Ptr,ByVal myobjptr As myobj_type Ptr,size As Integer) As Integer          
Declare Function draw3DSptr Cdecl Alias "draw3DSptr" (ByVal myobjptr As myobj_type Ptr) As Integer          
Declare Function draw3DSptrsmooth Cdecl Alias "draw3DSptrsmooth" (ByVal myobjptr As myobj_type Ptr) As Integer          
Declare Function load3DSmap Cdecl Alias "load3DSmap" (Byval ficload As ZString Ptr,ByVal map As Integer Ptr) As Integer        


#Inclib "./morphobj3ds_chung"
Declare Function morphobj3DS Cdecl Alias "morphobj3DS" (ByVal myobj As myobj_type Ptr,ByVal myobj1 As myobj_type Ptr,ByVal kx1 As Single, _      
	                                       ByVal myobj2 As myobj_type Ptr,ByVal kx2 As single)As Integer  

'Dim Shared As myobj_type myobj,myobj0,myobj1,myobj2


#Inclib "TTS_chung_dll"
Declare Sub myTTSinit Cdecl Alias "myTTSinit" () 
Declare Sub myTTSclose Cdecl Alias"myTTSclose" () 
Declare Function myTTSspeak Cdecl Alias "myTTSspeak" (txt as ZString ptr,flags as Integer=0)As Integer 
Declare Function myTTSstatus Cdecl Alias "myTTSgetstatus" () As ZString Ptr
Enum SpeechVoiceSpeakFlags
      ' spvoice flags
      SVSFDefault          = &H0000
      SVSFlagsAsync        = &H0001
      SVSFPurgeBeforeSpeak = &H0002
      SVSFIsFilename       = &H0004 ' must be the whole path
      SVSFIsXML            = &H0008
      SVSFIsNotXML         = &H0010
      SVSFPersistXML       = &H0020
End Enum 
SetPriorityClass( GetCurrentProcess(), HIGH_PRIORITY_CLASS ) 
Dim Shared As Double tspeak
Dim Shared As String textspeak,statusspeak,textspeakmsg
Dim Shared As Integer pitchspeak=0
Sub testspeak()
statusspeak=*(myTTSstatus)
If statusspeak<>"phoneme0" And statusspeak<>"phoneme7" Then
	tspeak=max(tspeak,Timer)
	If Timer<tspeak-999 Then tspeak=Timer 'midnight
EndIf
If Timer>tspeak+1.5 And textspeak<>"" Then
   Dim As String ilang="409",text
   '409 English (United States)
   '809 English (United Kingdom)
   '40C French (Standard)
   '407 German (Standard)
   If Left(textspeak,2)="  " Then
    'text="<VOICE Gender=""Male"">"+*txt+"</VOICE>"
    text="<VOICE Gender=""Male""><lang langid="""+Str(ilang)+""">"+textspeak+"</lang></VOICE>"
   Else    	
    'text="<VOICE Gender=""Female"">"+*txt+"</VOICE>"
    text="<VOICE Gender=""Female""><lang langid="""+Str(ilang)+""">"+textspeak+"</lang></VOICE>"
   EndIf
		myTTSspeak("<PITCH ABSMIDDLE="""+Str(pitchspeak)+""">"+text+ _
		           "</pitch>",SVSFlagsAsync+SVSFIsXML)
		If Left(textspeak,2)<>"  " Then textspeakmsg=textspeak
		textspeak=""
EndIf 
End Sub
textspeak="hello, how are you?"

'SetPriorityClass( GetCurrentProcess(), HIGH_PRIORITY_CLASS )    
Sub notice0(ByRef msg As string,ByRef title As String ="notice")
	messagebox(0,msg,title,MB_TASKMODAL Or 0)
End Sub
Sub confirm0(ByRef msg As string,ByRef title As string,ByRef resp As String)
	Dim i As Integer
	i=messagebox(0,msg,title,MB_TASKMODAL Or 1)
	If i=1 Then resp="yes" Else resp="no"
End Sub
Sub confirmspeak(ByRef msg As string,ByRef title As string,ByRef resp As String)
	Dim i As Integer
	myTTSspeak(msg,1)
	i=messagebox(0,msg,title,MB_TASKMODAL Or 1)
	If i=1 Then myTTSspeak("ok",1):resp="yes" Else resp="no"
End Sub
Dim Shared As Integer trikku=-1,tarcade2=0
Randomize
Declare Sub setsoundarcadevol()
Sub setsoundarcade()
	Dim As String soundfic
	If trikku>=0 Then
	  mcisendstring("stop arcade",0,0,0)
	  mcisendstring("close arcade",0,0,0)
	EndIf   
	If trikku<0 Then
		'trikku=Int(Rnd*4)
		trikku=0
      If Rnd<0.75*0.6 Then trikku=1:soundfic="sounds/rikku.mp3"
      If Rnd<0.6*0.6 Then trikku=2:soundfic="sounds/luck.mp3"
	Else  
   	trikku=(trikku+1)Mod 3
   endif 	
	'trikku=0
   soundfic="sounds/arcade.mp3"
   If trikku=1 Then soundfic="sounds/rikku.mp3"
   If trikku=2 Then soundfic="sounds/luck.mp3"
   'If trikku=3 Then soundfic="sounds/bird.mp3"
   If tarcade2=1 Then
   	soundfic="sounds/arcade2.mp3"
   EndIf
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias arcade",0,0,0)	
   setsoundarcadevol()
End Sub
Sub initsounds
	Dim As String soundfic
   soundfic="sounds/yuna.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias yuna",0,0,0)
   'soundfic="sounds/arcade.mp3"'rikku
   'If Rnd<0.65 Then trikku=1:soundfic="sounds/rikku.mp3"
   'If Rnd<0.5 Then trikku=1:soundfic="sounds/luck.mp3"
   'mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias arcade",0,0,0)
   setsoundarcade()
   soundfic="sounds/crash.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias crash",0,0,0)
   soundfic="sounds/pneu.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias pneu",0,0,0)
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias pneu2",0,0,0)
   soundfic="sounds/moteur.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias moteur",0,0,0)
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias moteur2",0,0,0)
   soundfic="sounds/horse.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias horse",0,0,0)
   soundfic="sounds/explosion_1.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias explosion1",0,0,0)
   soundfic="sounds/waterwave.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias waterwave",0,0,0)
   soundfic="sounds/ocean.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias ocean",0,0,0)
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias ocean2",0,0,0)
   soundfic="sounds/shoot.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias shoot",0,0,0)
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias shoot1",0,0,0)
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias shoot2",0,0,0)
   soundfic="sounds/subwater.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias subwater",0,0,0)
   soundfic="sounds/explosion_2.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias explosion21",0,0,0)
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias explosion22",0,0,0)
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias explosion23",0,0,0)
   soundfic="sounds/aah.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias aah",0,0,0)
   soundfic="sounds/boom.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias boom",0,0,0)
   soundfic="sounds/thunder.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias thunder",0,0,0)
   soundfic="sounds/deerhunter.mp3"'voyage_enfer.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias voyage",0,0,0)
   soundfic="sounds/victoria.mp3"'deerhunter.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias voyage2",0,0,0)
   soundfic="sounds/debby.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias debby",0,0,0)
   soundfic="sounds/debbylong.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias debbylong",0,0,0)
   soundfic="sounds/anne_midi.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias anne",0,0,0)
   soundfic="sounds/someone.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias someone",0,0,0)
   soundfic="sounds/nearness_song.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias nearness",0,0,0)
   soundfic="sounds/junk.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias junk",0,0,0)
   soundfic="sounds/grantorino.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias grantorino",0,0,0)
   soundfic="sounds/pennylane.mp3"'magic_is_you.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias magic",0,0,0)
   soundfic="sounds/cow.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias cow",0,0,0)
   soundfic="sounds/carhorn.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias carhorn",0,0,0)
   soundfic="sounds/car3.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias mycar",0,0,0)
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias mycar2",0,0,0)
   soundfic="sounds/essuie_glace.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias essuieglace",0,0,0)
   soundfic="sounds/click.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias click",0,0,0)
   'soundfic="sounds/deerhunter.mid"
   'mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" type sequencer shareable alias deermidi",0,0,0)
   soundfic="sounds/rain.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias rain",0,0,0)
   soundfic="sounds/sauterelle.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias sauterelle",0,0,0)
   soundfic="sounds/cigale.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias cigale",0,0,0)
   soundfic="sounds/grillon.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias grillon",0,0,0)
   soundfic="sounds/hi.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias hi",0,0,0)
   soundfic="sounds/foot.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias foot",0,0,0)
   soundfic="sounds/seagull.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias seagull",0,0,0)
   soundfic="sounds/metal.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias metal",0,0,0)
   soundfic="sounds/jet4.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias boeing",0,0,0)
   soundfic="sounds/aube5jour.mp3"
   mcisendstring("open "+chr$(34)+soundfic+chr$(34)+" shareable alias aube",0,0,0)
End Sub 
Sub closesounds
   mcisendstring("close avion",0,0,0)
   mcisendstring("close avion2",0,0,0)
	mcisendstring("close yuna",0,0,0)
	mcisendstring("close arcade",0,0,0)
	mcisendstring("close crash",0,0,0)
	mcisendstring("close pneu",0,0,0)
	mcisendstring("close pneu2",0,0,0)
	mcisendstring("close moteur",0,0,0)
	mcisendstring("close moteur2",0,0,0)
	mcisendstring("close horse",0,0,0)
	mcisendstring("close explosion1",0,0,0)
	mcisendstring("close waterwave",0,0,0)
	mcisendstring("close ocean",0,0,0)
	mcisendstring("close ocean2",0,0,0)
	mcisendstring("close shoot",0,0,0)
	mcisendstring("close shoot1",0,0,0)
	mcisendstring("close shoot2",0,0,0)
	mcisendstring("close subwater",0,0,0)
	mcisendstring("close explosion21",0,0,0)
	mcisendstring("close explosion22",0,0,0)
	mcisendstring("close explosion23",0,0,0)
	mcisendstring("close aah",0,0,0)
	mcisendstring("close boom",0,0,0)
	mcisendstring("close thunder",0,0,0)
	mcisendstring("close voyage",0,0,0)
	mcisendstring("close voyage2",0,0,0)
	mcisendstring("close debby",0,0,0)
	mcisendstring("close debbylong",0,0,0)
	mcisendstring("close anne",0,0,0)
	mcisendstring("close someone",0,0,0)
	mcisendstring("close nearness",0,0,0)
	mcisendstring("close junk",0,0,0)
	mcisendstring("close grantorino",0,0,0)
	mcisendstring("close magic",0,0,0)
	mcisendstring("close cow",0,0,0)
	mcisendstring("close carhorn",0,0,0)
	mcisendstring("close mycar",0,0,0)
	mcisendstring("close mycar2",0,0,0)
	mcisendstring("close essuieglace",0,0,0)
	mcisendstring("close click",0,0,0)
	'mcisendstring("close deermidi",0,0,0)
	mcisendstring("close rain",0,0,0)
	mcisendstring("close sauterelle",0,0,0)
	mcisendstring("close cigale",0,0,0)
	mcisendstring("close grillon",0,0,0)
	mcisendstring("close hi",0,0,0)
	mcisendstring("close foot",0,0,0)
	mcisendstring("close seagull",0,0,0)
	mcisendstring("close metal",0,0,0)
	mcisendstring("close boeing",0,0,0)
	mcisendstring("close aube",0,0,0)
	mcisendstring("close all",0,0,0)
End Sub 
Dim Shared As Single soundvol=1.7'3
Sub setsoundarcadevol()
	Dim As Integer vol=Int(min(1000.0,2500*soundvol*0.05))
	'mcisendstring("setaudio arcade volume to "+str(Int(1.1*vol)),0,0,0)'2.5'1.4'1.95'1.4
	mcisendstring("setaudio arcade volume to "+str(Int(3.1*vol)),0,0,0)'2.5'1.4'1.95'1.4
	If trikku=1 Then mcisendstring("setaudio arcade volume to "+str(Int(2.5*vol)),0,0,0)'2.5'1.4'1.95'1.4
	If trikku=2 Then mcisendstring("setaudio arcade volume to "+str(Int(2.04*vol)),0,0,0)'2.5'1.4'1.95'1.4
	If trikku=3 Then mcisendstring("setaudio arcade volume to "+str(Int(3.1*vol)),0,0,0)'2.5'1.4'1.95'1.4
	If tarcade2=1 Then mcisendstring("setaudio arcade volume to "+str(Int(3.1*vol)),0,0,0)'2.5'1.4'1.95'1.4
End Sub 	
Sub setsoundvol
	Dim As Integer vol=Int(min(1000.0,2500*soundvol*0.05))
	'mcisendstring("setaudio yuna volume to "+str(Int(2.7*vol)),0,0,0)'1.4'1.95'1.4
	mcisendstring("setaudio yuna volume to "+str(Int(2.0*vol)),0,0,0)'1.4'1.95'1.4
	'mcisendstring("setaudio arcade volume to "+str(Int(1.1*vol)),0,0,0)'2.5'1.4'1.95'1.4
	'If trikku=1 Then mcisendstring("setaudio arcade volume to "+str(Int(2.5*vol)),0,0,0)'2.5'1.4'1.95'1.4
	setsoundarcadevol()
	mcisendstring("setaudio crash volume to "+str(Int(2.5*vol)),0,0,0)
	mcisendstring("setaudio pneu volume to "+str(vol),0,0,0)
	mcisendstring("setaudio pneu2 volume to "+str(vol),0,0,0)
	mcisendstring("setaudio moteur volume to "+str(vol),0,0,0)
	mcisendstring("setaudio moteur2 volume to "+str(vol),0,0,0)
	mcisendstring("setaudio horse volume to "+str(vol),0,0,0)
	mcisendstring("setaudio explosion1 volume to "+str(vol),0,0,0)
	mcisendstring("setaudio waterwave volume to "+str(Int(1.5*vol)),0,0,0)
	mcisendstring("setaudio ocean volume to "+str(Int(1.4*vol)),0,0,0)
	mcisendstring("setaudio ocean2 volume to "+str(Int(2.5*vol)),0,0,0)
	mcisendstring("setaudio shoot volume to "+str(Int(1.12*vol)),0,0,0)
	mcisendstring("setaudio shoot1 volume to "+str(Int(1.12*vol)),0,0,0)
	mcisendstring("setaudio shoot2 volume to "+str(Int(1.12*vol)),0,0,0)
	mcisendstring("setaudio subwater volume to "+str(vol),0,0,0)
	mcisendstring("setaudio explosion21 volume to "+str(vol),0,0,0)
	mcisendstring("setaudio explosion22 volume to "+str(vol),0,0,0)
	mcisendstring("setaudio explosion23 volume to "+str(vol),0,0,0)
	mcisendstring("setaudio aah volume to "+str(Int(1.4*vol)),0,0,0)
	mcisendstring("setaudio boom volume to "+str(Int(1.4*vol)),0,0,0)
	mcisendstring("setaudio thunder volume to "+Str(Int(1.7*vol)),0,0,0)
	mcisendstring("setaudio voyage volume to "+Str(Int(1.9*vol)),0,0,0)
	'mcisendstring("setaudio voyage2 volume to "+Str(Int(2.2*vol)),0,0,0)
	mcisendstring("setaudio voyage2 volume to "+Str(Int(2.3*vol)),0,0,0)
	mcisendstring("setaudio debby volume to "+Str(Int(2.2*vol)),0,0,0)
	mcisendstring("setaudio debbylong volume to "+Str(Int(2.35*vol)),0,0,0)
	mcisendstring("setaudio aube volume to "+Str(Int(2.35*vol)),0,0,0)
	mcisendstring("setaudio anne volume to "+Str(Int(2.18*vol)),0,0,0)'2.12
	mcisendstring("setaudio someone volume to "+Str(Int(2.4*vol)),0,0,0)
	mcisendstring("setaudio nearness volume to "+Str(Int(2.45*vol)),0,0,0)
	mcisendstring("setaudio junk volume to "+Str(Int(2.6*vol)),0,0,0)
	mcisendstring("setaudio grantorino volume to "+Str(Int(2.9*vol)),0,0,0)
	mcisendstring("setaudio magic volume to "+Str(Int(3.4*vol)),0,0,0)'3.0
	mcisendstring("setaudio cow volume to "+Str(Int(2.2*vol)),0,0,0)
	mcisendstring("setaudio carhorn volume to "+Str(Int(2.4*vol)),0,0,0)
	mcisendstring("setaudio mycar volume to "+Str(Int(2.2*vol)),0,0,0)
	mcisendstring("setaudio mycar2 volume to "+Str(Int(2.2*vol)),0,0,0)
	mcisendstring("setaudio essuieglace volume to "+Str(Int(0.6*vol)),0,0,0)
	mcisendstring("setaudio click volume to "+Str(Int(1.2*vol)),0,0,0)
	'mcisendstring("setaudio deermidi volume to "+Str(Int(2.2*vol)),0,0,0)
	mcisendstring("setaudio rain volume to "+Str(Int(1.7*vol)),0,0,0)
	mcisendstring("setaudio sauterelle volume to "+Str(Int(1.7*vol)),0,0,0)
	mcisendstring("setaudio cigale volume to "+Str(Int(1.7*vol)),0,0,0)
	mcisendstring("setaudio grillon volume to "+Str(Int(1.7*vol)),0,0,0)
	mcisendstring("setaudio hi volume to "+Str(Int(2*vol)),0,0,0)
	mcisendstring("setaudio foot volume to "+Str(Int(0.7*vol)),0,0,0)
	mcisendstring("setaudio seagull volume to "+Str(Int(0.7*vol)),0,0,0)
	mcisendstring("setaudio metal volume to "+Str(Int(0.33*vol)),0,0,0)
	mcisendstring("setaudio boeing volume to "+str(2),0,0,0)
End Sub 
Dim Shared As Integer oceansound,arcadesound,yunasound
Sub soundyuna	
If yunasound=1 Then Exit Sub 	
   yunasound=1
   'mcisendstring("set yuna time format ms",0,0,0)
   'mcisendstring("set yuna speed 850",0,0,0)
   mcisendstring("play yuna from 0 repeat",0,0,0)
End Sub
Sub stopsoundyuna
	If yunasound=0 Then Exit Sub 
	yunasound=0
   mcisendstring("stop yuna",0,0,0)
End Sub
Dim Shared As Double timesoundarcade,timesoundarcade0
Dim Shared As Double timeinit
Dim Shared As Integer testinit
Sub soundarcade	
If arcadesound=1 Then Exit Sub
If Timer<timeinit+10 Then Exit Sub  	
   arcadesound=1
   timesoundarcade0=Timer 
   If trikku=0 And tarcade2=0 Then 
     mcisendstring("set arcade time format ms",0,0,0)
     mcisendstring("set arcade speed 850",0,0,0)
   EndIf 
   mcisendstring("play arcade from 0 repeat",0,0,0)
End Sub
Sub stopsoundarcade
	If arcadesound=0 Then Exit Sub 
	arcadesound=0
   mcisendstring("stop arcade",0,0,0)
End Sub
Dim Shared As Integer tsoundarcade=1
Sub subsoundarcade()
	If tsoundarcade=0 And tradio=0 Then
		tsoundarcade=1
		setsoundarcade() 
	ElseIf tradio=3 Then
		tsoundarcade=1
		setsoundarcade()
		stopsoundarcade()
		soundarcade() 		
	ElseIf tradio=1 Then 
		tsoundarcade=0
	EndIf
	Sleep 200
End Sub
Sub soundocean
	'Exit Sub 
	oceansound=1
   mcisendstring("play ocean from 0 repeat",0,0,0)
End Sub
Sub stopsoundocean
	'Exit Sub 
	oceansound=0
   mcisendstring("stop ocean",0,0,0)	
End Sub
Dim Shared As Integer tsoundocean
Dim Shared As Single distocean
Sub soundocean2
	'Exit Sub
	If tsoundocean=1 Then Exit Sub 
	tsoundocean=1
   mcisendstring("play ocean2 from 0 repeat",0,0,0)
End Sub
Sub stopsoundocean2
	'Exit Sub 
	If tsoundocean=0 Then Exit Sub
	tsoundocean=0
   mcisendstring("stop ocean2",0,0,0)	
End Sub
Sub soundavion
   mcisendstring("set avion time format ms",0,0,0)
   mcisendstring("set avion speed 550",0,0,0)
   mcisendstring("set avion2 time format ms",0,0,0)
   mcisendstring("set avion2 speed 550",0,0,0)
   mcisendstring("play avion from 4000 repeat",0,0,0)
   mcisendstring("play avion2 from 0 repeat",0,0,0)
End Sub 
Sub stopsoundavion
   mcisendstring("stop avion",0,0,0)
   mcisendstring("stop avion2",0,0,0)
End Sub
Declare Sub addcarsmoke(dz As Single=15)
Dim Shared As Integer tpiste
Dim Shared As Double tpneu,tpneu2,tavgpneu,tavgpneu0
Sub soundpneu2
Dim As Double ttime
   ttime=Timer 
   If (tpneu2-99)>ttime Then tpneu2=ttime 'if midnight
   If ttime>(tpneu2+0.13) Then 
   	tpneu2=ttime 
      mcisendstring("set pneu2 speed "+str$(770),0,0,0)
   	mcisendstring("play pneu2 from 0",0,0,0)
   EndIf
End Sub
Sub soundpneu
Dim As Double ttime
If tpiste=0 Then soundpneu2:Exit Sub 
   ttime=Timer
   If tpneu>ttime Then tpneu=ttime 'if midnight
   If ttime>(tpneu+0.08) Then 
   	tpneu=ttime 
      Var ttime2=max(0.1,min(40.0,ttime-tavgpneu0))
      tavgpneu0=ttime
      tavgpneu+=0.05/ttime2-ttime2
      'auxvar=tavgpneu:auxtest=0.2
      If tavgpneu>40 Then tavgpneu-=0.05/ttime2:Exit Sub
      tavgpneu=max(0.0,tavgpneu) 
   	If Rnd<0.65 Then
   		mcisendstring("play pneu from 0",0,0,0)
   	Else 
         mcisendstring("set pneu2 time format ms",0,0,0)
         mcisendstring("set pneu2 speed 930",0,0,0)
   		mcisendstring("play pneu2 from 0",0,0,0)
   	EndIf
   	addcarsmoke()
   EndIf
End Sub
Dim Shared As Double tcrash
Sub soundcrash
Dim As Double ttime
   ttime=Timer 
	If tcrash>ttime Then tcrash=ttime 'if midnight
	If ttime>(tcrash+0.3) Then
		tcrash=ttime
		mcisendstring("play crash from 0",0,0,0)
	EndIf
End Sub
Sub soundhorse
   mcisendstring("play horse from 0",0,0,0)
End Sub
Sub soundexplosion1
   mcisendstring("play explosion1 from 0",0,0,0)
tspeak=max(tspeak,Timer+30)
End Sub
Dim Shared As Single twater 
Sub soundwaterwave
If twater>Timer Then twater=Timer 'if midnight
If Timer>(twater+0.7) Then
  	twater=Timer
   mcisendstring("play waterwave from 0",0,0,0)
EndIf 
End Sub
Sub soundshoot
	mcisendstring("play shoot from 0",0,0,0)	
'tspeak=max(tspeak,Timer+30)
End Sub
Dim Shared As Integer isoundshoot
Sub soundshoot2
'tspeak=max(tspeak,Timer+30)
isoundshoot+=1
If isoundshoot>2 Then isoundshoot=1
Select Case isoundshoot
	Case 1
		mcisendstring("play shoot1 from 0",0,0,0)
	Case 2
		mcisendstring("play shoot2 from 0",0,0,0)
End Select
End Sub
Dim Shared As Single tsubwater
Sub soundsubwater
If tsubwater>Timer Then tsubwater=Timer 'if midnight
If Timer>(tsubwater+0.7) Then
  	tsubwater=Timer
   mcisendstring("play subwater from 0",0,0,0)
EndIf 
End Sub
Dim Shared As Integer iexplosion2
Sub soundexplosion2
'tspeak=max(tspeak,Timer+30)
iexplosion2+=1
If iexplosion2>3 Then iexplosion2=1
Select Case iexplosion2
	Case 1
   mcisendstring("play explosion21 from 0",0,0,0)
	Case 2
   mcisendstring("play explosion22 from 0",0,0,0)
	Case 3
   mcisendstring("play explosion23 from 0",0,0,0)
End Select
End Sub
Sub soundaah
   mcisendstring("play aah from 0",0,0,0)
End Sub
Sub soundboom
   mcisendstring("play boom from 0",0,0,0)
End Sub
Dim Shared As Double tsoundthunder
Sub soundthunder
	If Timer<tsoundthunder+6 Then Exit Sub
	tsoundthunder=timer
   mcisendstring("set thunder time format ms",0,0,0)
   mcisendstring("set thunder speed 740",0,0,0)
   mcisendstring("play thunder from 0",0,0,0)
End Sub
Dim Shared As Double tsoundcow
Sub soundcow
	If Timer>tsoundcow+2.5 Then
		tsoundcow=Timer+Rnd*3 
		mcisendstring("play cow from 0",0,0,0)
	EndIf
End Sub
Dim Shared As Double tsoundcarhorn
Sub soundcarhorn
	If timer>tsoundcarhorn+0.2 Then
		tsoundcarhorn=Timer
		mcisendstring("play carhorn from 0",0,0,0)'1300
	EndIf
End Sub
Sub soundmycar
   mcisendstring("play mycar from 0 repeat",0,0,0)
End Sub
Sub soundmycar2
   mcisendstring("play mycar2 from 4000 repeat",0,0,0)
End Sub
Sub soundessuieglace
   mcisendstring("play essuieglace from 250",0,0,0)
End Sub
Dim Shared As Double tsoundclick
Sub soundclick
   mcisendstring("play click from 0",0,0,0)
End Sub
Sub soundrain
   	mcisendstring("play rain from 0 repeat",0,0,0)
End Sub
Sub stopsoundrain
   	mcisendstring("stop rain",0,0,0)
End Sub
Dim Shared As Integer tsoundsauterelle,tsoundcigale,tcigale
Sub soundsauterelle
If tcigale=0 Then
	If tsoundsauterelle=0 Then
		tsoundsauterelle=1
		mcisendstring("play sauterelle from 0 repeat",0,0,0)
		tsoundcigale=0
		mcisendstring("stop cigale",0,0,0)
	EndIf
Else
	If tsoundcigale=0 Then
		tsoundcigale=1
		mcisendstring("play cigale from 0 repeat",0,0,0)
		tsoundsauterelle=0
		mcisendstring("stop sauterelle",0,0,0)
   EndIf 
EndIf
End Sub
Sub stopsoundsauterelle
	If tsoundsauterelle=1 Then
		tsoundsauterelle=0
		mcisendstring("stop sauterelle",0,0,0)
	EndIf
	If tsoundcigale=1 Then
		tsoundcigale=0
		mcisendstring("stop cigale",0,0,0)
	EndIf
End Sub
Dim Shared As Integer tsoundgrillon
Sub soundgrillon
	If tsoundgrillon=0 Then
		tsoundgrillon=1
		mcisendstring("play grillon from 0 repeat",0,0,0)
	EndIf
End Sub
Sub stopsoundgrillon
	If tsoundgrillon=1 Then
		tsoundgrillon=0
		mcisendstring("stop grillon",0,0,0)
	EndIf
End Sub
Dim Shared As Double tsoundhi
Sub soundhi
	If Timer>tsoundhi+4 Then
		tsoundhi=Timer+Rnd*4 
      mcisendstring("set hi time format ms",0,0,0)
      mcisendstring("set hi speed "+Str(Int(960+Rnd*170)),0,0,0)
		mcisendstring("play hi from 0",0,0,0)
	EndIf
End Sub
Dim Shared As Double tsoundfoot
Sub soundfoot(kvol As Single=1.0)
	If Timer>tsoundfoot+0.65 Then
		tsoundfoot=Timer
	   Dim As Integer vol=Int(min(1000.0,2500*soundvol*0.05))
   	mcisendstring("setaudio foot volume to "+Str(Int(0.9*vol*kvol)),0,0,0)
		mcisendstring("play foot from 0",0,0,0)
	EndIf
End Sub
Sub soundseagull
		mcisendstring("play seagull from 0",0,0,0)
End Sub
Sub soundmetal
      mcisendstring("set metal time format ms",0,0,0)
      mcisendstring("set metal speed "+Str(Int(1600+Rnd*150)),0,0,0)
		mcisendstring("play metal from 0",0,0,0)
End Sub
Sub soundboeing
   mcisendstring("play boeing from 0 repeat",0,0,0)
End Sub
Dim Shared As Double tsoundvoyage1,tsoundvoyage2,tsounddebby,tsoundvoyage,tsoundanne,tsoundsomeone,tsounddebbylong
Dim Shared As Double tsoundvoyage3,tsoundnearness,tsoundjunk,tsoundgrantorino,tsoundmagic,tsoundaube
Dim Shared As Integer ivoyage
Sub soundvoyage1
	'If Timer>tsoundvoyage1+295 Then '4m53
	If Timer>tsoundvoyage1+223 Then '3m41'4m53
	  tsoundvoyage1=Timer
	  mcisendstring("play voyage from 0",0,0,0)
	EndIf   
End Sub
Sub soundvoyage2
	'If Timer>tsoundvoyage2+223 Then '3m41
	If Timer>tsoundvoyage2+252 Then '4m10
	  tsoundvoyage2=Timer
	  mcisendstring("play voyage2 from 0",0,0,0)
	EndIf   
End Sub
Sub soundvoyage3
	If Timer>tsoundvoyage2+223 Then '3m41
	  tsoundvoyage3=Timer
	  'mcisendstring("play deermidi from 0",0,0,0)
	EndIf   
End Sub
Sub sounddebby
	If Timer>tsounddebby+81 Then '1m19'3m10
	  tsounddebby=Timer
	  mcisendstring("play debby from 0",0,0,0)
	EndIf   
End Sub
Sub sounddebbylong
	If Timer>tsounddebbylong+272 Then '4m30
	  tsounddebbylong=Timer
	  mcisendstring("play debbylong from 0",0,0,0)
	EndIf   
End Sub
Sub soundaube
	If Timer>tsoundaube+229 Then '3m47
	  tsoundaube=Timer
	  mcisendstring("play aube from 0",0,0,0)
	EndIf   
End Sub
Sub soundanne
	If Timer>tsoundanne+133 Then'135'189 Then '2m13'3m07
	  tsoundanne=Timer
     'mcisendstring("set anne time format ms",0,0,0)
     'mcisendstring("set anne speed 972",0,0,0)
	  mcisendstring("play anne from 0",0,0,0)
	EndIf   
End Sub
Sub soundsomeone
	If Timer>tsoundsomeone+138 Then '2m16
	  tsoundsomeone=Timer
	  mcisendstring("play someone from 0",0,0,0)
	EndIf   
End Sub
Sub soundnearness
	If Timer>tsoundnearness+191 Then '3m09
	  tsoundnearness=Timer
	  mcisendstring("play nearness from 0",0,0,0)
	EndIf   
End Sub
Sub soundjunk
	If Timer>tsoundjunk+156/0.95 Then '2m34
	  tsoundjunk=Timer
     mcisendstring("set junk time format ms",0,0,0)
     mcisendstring("set junk speed 950",0,0,0)
	  mcisendstring("play junk from 0",0,0,0)
	EndIf   
End Sub
Sub soundgrantorino
	If Timer>tsoundgrantorino+302 Then '5m00
	  tsoundgrantorino=Timer
	  mcisendstring("play grantorino from 0",0,0,0)
	EndIf   
End Sub
Dim Shared As Double tmagic=181'3m01 '226 '3m44
Sub soundmagic
	If Timer>tsoundmagic+tmagic Then '3m44
	  tsoundmagic=Timer
	  mcisendstring("play magic from 0",0,0,0)
	EndIf   
End Sub
Declare Sub stopsoundvoyage()
Dim Shared As Integer ivoyage0
Function testivoyage() As Integer
	Var ttimer=Timer 
	If tTimer<tsoundvoyage+0.2 Or tradio=1 Then Return ivoyage
	tsoundvoyage=tTimer
	If tradio=2 And ivoyage>0 Then
		ivoyage0=ivoyage 
	EndIf
	If tTimer>tsoundvoyage1+223-0.0001 And ivoyage=1 Then ivoyage=0
	If tTimer>tsoundvoyage2+252-0.0001 And ivoyage=2 Then ivoyage=0
	If tTimer>tsounddebby+81-0.0001 And ivoyage=3 Then ivoyage=0
	If tTimer>tsoundanne+133-0.0001 And ivoyage=4 Then ivoyage=0
	If tTimer>tsoundsomeone+138-0.0001 And ivoyage=5 Then ivoyage=0
	If tTimer>tsounddebbylong+272-0.0001 And ivoyage=6 Then ivoyage=0
	If tTimer>tsoundnearness+191-0.0001 And ivoyage=7 Then ivoyage=0
	If tTimer>tsoundjunk+156/0.95-0.0001 And ivoyage=8 Then ivoyage=0
	If tTimer>tsoundgrantorino+302-0.0001 And ivoyage=9 Then ivoyage=0
	If tTimer>tsoundmagic+tmagic-0.0001 And ivoyage=10 Then ivoyage=0
	If tTimer>tsoundaube+229-0.0001 And ivoyage=11 Then ivoyage=0
Return ivoyage	
End Function
Dim Shared As Double tsoundvoyage0,timegps
Sub soundvoyage(isong As Integer=0,text As String="")
	Var ttimer=Timer
	If tTimer<max(timeinit+20,tsoundvoyage0+0.2) Then Exit Sub
	tsoundvoyage0=tTimer
	If tradio=1 Or (tradio=2 And arcadesound=1) Then Exit Sub 
	If Timer<timesoundarcade0+18 Then Exit Sub 
	If tradio=2 And ivoyage>0 Then
		ivoyage0=ivoyage
	EndIf 
	If tTimer>tsoundvoyage1+223-0.0001 And ivoyage=1 Then ivoyage=0
	If tTimer>tsoundvoyage2+252-0.0001 And ivoyage=2 Then ivoyage=0
	If tTimer>tsounddebby+81-0.0001 And ivoyage=3 Then ivoyage=0
	If tTimer>tsoundanne+133-0.0001 And ivoyage=4 Then ivoyage=0
	If tTimer>tsoundsomeone+138-0.0001 And ivoyage=5 Then ivoyage=0
	If tTimer>tsounddebbylong+272-0.0001 And ivoyage=6 Then ivoyage=0
	If tTimer>tsoundnearness+191-0.0001 And ivoyage=7 Then ivoyage=0
	If tTimer>tsoundjunk+156/0.95-0.0001 And ivoyage=8 Then ivoyage=0
	If tTimer>tsoundgrantorino+302-0.0001 And ivoyage=9 Then ivoyage=0
	If tTimer>tsoundmagic+tmagic-0.0001 And ivoyage=10 Then ivoyage=0
	If tTimer>tsoundaube+229-0.0001 And ivoyage=11 Then ivoyage=0
	'If Timer>tsoundvoyage3+223-0.0001 And ivoyage=7 Then ivoyage=0
	'If isong=11 And (ivoyage=2 Or ivoyage=6) Then stopsoundvoyage():Sleep 200:Exit sub
	If tradio<>2 And isong=11 And (ivoyage>=1 and ivoyage<=11) Then stopsoundvoyage():Sleep 200:ivoyage=0:Exit sub
	If tradio=2 And ivoyage=0 Then stopsoundarcade():ivoyage=ivoyage0
	If ivoyage=0 Then
		If Timer>timegps+15 And Rnd<0.8 Then timegps=Timer-6+3*rnd
		stopsoundarcade()
		''tsoundvoyage=0:tsoundvoyage2=0
		If isong=11 Then
 		 setsoundarcade()
		 If Rnd<0.07 Then
		  ivoyage=11		  	
		 ElseIf Rnd<0.15 Then
		  ivoyage=4		  	
		 ElseIf Rnd<0.1 Then
		  ivoyage=8		  	
		 ElseIf Rnd<0.25 Then
		  ivoyage=10		  	
		 ElseIf Rnd<0.33 Then
		  ivoyage=2		  	
		 Else 
		  If Rnd<0.13 Then
		  	ivoyage=9
		  ElseIf Rnd<0.33 Then
		  	ivoyage=7
		  Else
			If Rnd<0.35 Then
				ivoyage=11
			ElseIf Rnd<0.5 Then
				ivoyage=3
			Else
				ivoyage=6
			EndIf
		  EndIf
		 EndIf   
		ElseIf isong=0 Then
			If Rnd<0.5 Then    
			   ivoyage=1
			Else
				If oceansound=1 Or Rnd<0.3 Then
					ivoyage=8
				Else   	
					ivoyage=2
				EndIf
			EndIf 	
		ElseIf isong=1 Then
		   If Rnd<0.3 Then
		   	ivoyage=10
		   Else 	
		   	ivoyage=4
		   EndIf
		ElseIf isong=2 Then 
			ivoyage=5
		ElseIf isong=3 Then 
			If Rnd<0.35 Then
				ivoyage=11
			ElseIf Rnd<0.65 Then
				ivoyage=3
			Else
				ivoyage=6
			EndIf
		Else
			If Rnd<0.5 Then    
   			ivoyage=7
			ElseIf oceansound=1 Or InStr(text,"bar")>0 Or InStr(text,"cafe")>0 Or InStr(text,"pub") Or _  
				    InStr(text,"restaurant")>0 Or InStr(text,"hotel")>0 Or Rnd<0.25 Then
				ivoyage=9
			Else 	
				ivoyage=2
			EndIf 	
		EndIf
	EndIf 
	If ivoyage=1 Then soundvoyage1
	If ivoyage=2 Then soundvoyage2
	If ivoyage=3 Then sounddebby
	If ivoyage=4 Then soundanne
	If ivoyage=5 Then soundsomeone
	If ivoyage=6 Then sounddebbylong
	If ivoyage=7 Then soundnearness
	If ivoyage=8 Then soundjunk
	If ivoyage=9 Then soundgrantorino
	If ivoyage=10 Then soundmagic
	If ivoyage=11 Then soundaube
	'If ivoyage=7 Then soundvoyage3
End Sub
Sub stopsoundvoyage()
	tsoundvoyage1=0
	tsoundvoyage2=0
	tsounddebby=0
	tsoundanne=0
	tsoundsomeone=0
	tsounddebbylong=0
	tsoundnearness=0
	tsoundjunk=0
	tsoundgrantorino=0
	tsoundmagic=0
	tsoundaube=0
	tsoundvoyage3=0
	mcisendstring("stop voyage",0,0,0)
	mcisendstring("stop voyage2",0,0,0)	
	mcisendstring("stop debby",0,0,0)	
	mcisendstring("stop anne",0,0,0)	
	mcisendstring("stop someone",0,0,0)	
	mcisendstring("stop debbylong",0,0,0)	
	mcisendstring("stop nearness",0,0,0)	
	mcisendstring("stop junk",0,0,0)	
	mcisendstring("stop grantorino",0,0,0)	
	mcisendstring("stop magic",0,0,0)	
	mcisendstring("stop aube",0,0,0)	
	'mcisendstring("stop deermidi",0,0,0)	
End Sub
'Sub soundmidi
'   mcisendstring("play midi",0,0,0)
'End Sub
initsounds
setsoundvol
soundyuna'arcade
soundboeing
myTTSinit()

Declare Function getterrainheight(ByVal x As Single,ByVal y As Single) As Single
Declare Function getterrainheightfast(ByVal x As Single,ByVal y As Single) As Single
Declare Sub initterrain2
Declare Sub initterrain3
Declare Sub movehorses
Declare Sub drawavion
Declare Sub drawseashore
Declare Sub addtir(ByVal itypetir As Integer=0)
Declare Sub addtir2(ByVal itypetir As Integer=0)
Declare Sub rotavion(ByVal x As Single,ByVal y As Single,ByVal z As Single)
Declare Sub addsmoke(ByVal mx As Single,ByVal my As Single,ByVal mz As Single,ByVal itype As Integer=0)
Declare Sub addboom(ByVal mx As Single,ByVal my As Single,ByVal mz As Single,ByVal itype As Integer=0)
Declare Sub adddebris(ByVal mx As Single,ByVal my As Single,ByVal mz As Single, _
                      ByVal vx As Single,ByVal vy As Single,ByVal vz As Single,ByVal itype As Integer=0)
Declare Sub addtirairship(ByVal i As Integer,ByVal itypetir As Integer=0)
Declare Function testtirtriangle(ByVal tx1 As Single,ByVal ty1 As Single,ByVal tz1 As Single, _
	                      ByVal tx2 As Single,ByVal ty2 As Single,ByVal tz2 As Single, _
	                      ByVal tx3 As Single,ByVal ty3 As Single,ByVal tz3 As Single, _
	                      ByVal rtir As Single = 512 ) As Integer
Declare Function mytestairport() As Integer 
Declare Sub addbullet() 
Declare Sub display()
Declare Sub displayback(tdraw As Integer=1)
declare Function testairport(ByVal x As Single,ByVal y As Single, _   
	                  dxx As Single=2500,dyy As Single=120) As Integer
Declare sub initarbres
Declare sub initcow
Declare Sub inithouses
Declare Sub initdomes
Declare sub initgrass
Declare Sub setfog
Declare Sub submap
Declare Sub testo123
Declare Sub subjoystick
Declare Sub testorbit
Declare Sub suborbit 
Declare Sub initairport
Declare Sub inittown
Declare Sub initterrainlines
'Declare Sub setmapautotextures()
Declare Sub inittownobject

    Dim Shared As uint pause,ianim,glnormals,restart,fullscreen=1,compas=1,compas2=1   
    Dim Shared As uint soltexture,arbretext(10),tronctext,buissontext(8),volanttext,volanttext2,arbreflowertext
    Dim Shared As uint cartext,md2horsetext(4),md2zebratext(3),grasstext(10),arbreflower2text,arbresequoiatext
    Dim Shared As uint arbreautumntext,arbreautumn2text
    Dim Shared As uint sunsettext,startext,radartext,pistetext,maptexture,avionredtext
    Dim Shared As uint aviontext,helicetext,feutext,feutext2,md2iavion,maptext,boattext,boattext2,boattext3
    Dim Shared As uint windtext,windtext2,cockpittext1,boattext4,corsairtext,firetext,sfiretext
    Dim Shared As uint vg33text,zerotext,zero2text,b25text,alphajettext,spitfiretext,bf109text
    Dim Shared As uint spitfiretext2,p51dtext,cockpittext2,cockpittext3,cockpittext4,f14text
    Dim Shared As uint bullettext,eurofightertext,worldtext,maptexture2
    Dim Shared As uint maptexture3,maptexture4,maptexture5,soltexture0
    Dim Shared As uint fightertext,spaceshiptext,planetsattext,starspacetext
    Dim Shared As uint debristext,fightertext2,towntext,skydometext,starspacetext2,webtext
    Dim Shared As Integer icar,iciel=6,imap=1,isol=2,igrass=2,imapsol=4,icombomap=1   
    Dim Shared As Integer mapsol(40),itime
    Dim Shared As double time0,time1,time2,time3,nframe,kfps2,dtime2,maxfps,kfps4,tfps,fpsmoy,minfps=5
    Dim Shared As Single mx,my,mz,o1=180,o2,o3,cos1,sin1,cos2,sin2,cos3,sin3,mx0,my0,mz0,yh=17,dyh
    Dim Shared As Single vie=100,vie0=100
    Const pi=ACos(-1),degtorad=pi/180,radtodeg=180/pi
    Dim Shared As Single terrain(-100 To 512+100,-100 To 512+100),waterz,waterz0
    Dim Shared As Single terrain2(-100 To 512+100,-100 To 512+100)
    Dim Shared As Single terrain0(-100 To 512+100,-100 To 512+100)
    Dim Shared As Byte tsetterrain(-101 To 512+101,-101 To 512+101)
    Dim Shared As Byte water(-101 To 512+101,-101 To 512+101)
    Dim Shared As Byte forest(128,128)
    Dim Shared As vec3_t  terraincolor(-100 To 612,-100 To 612),terraincolor0(-100 To 612,-100 To 612)
    Dim Shared As Single terraincolory0(-100 To 612,-100 To 612)
    Dim Shared As uint mapautotexture(-100 To 512+100,-100 To 512+100)
    Dim Shared As uint seawavetext,watertext,snowtext
    Dim Shared As Integer seashore(-100 To 612,-100 To 612),tseashore
Dim Shared As uint wx,wy,winx,winy,init=0
'Dim Shared As Single xmax,ymax
Dim Shared buttons As Integer :Dim Shared As Single ax,ay,az,at,hatx,haty
Dim Shared As Integer bb=0,b(16),b2(16),tjoy(16)
For i=1 To 16:b(i)=0:b2(i)=i:Next  
Dim Shared As Single joy,tdx,tdy,tdz,joy1dx,joy1dy,joy1dz,joy1dr
Dim Shared As Single timehour,timehour0,timehour1,timehour2,dtimehour=0
Dim Shared As String msg,resp
Dim Shared As uint narbre2=2500,ismooth=0,nboat2=9
Dim Shared As Single distscale=1.0,kwave=1.0
Dim Shared As Single x1,y1,z1,x2,y2,z2,px1,py1,pz1,px2,py2,pz2
Dim Shared As Integer startoption=0
Dim Shared As Integer iaux,iship,nship=18,nship2=10
Dim Shared As Single airshipo1(nship),airshipo2(nship),airshipo3(nship),aux,aux2
Dim Shared As Single airshipx(nship),airshipy(nship),airshipz(nship),airshipwar(nship)
Dim Shared As Integer nboat=12,typeship(nship),typeboat(nboat)
Dim Shared As Single boatx(nboat),boaty(nboat),boatz(nboat),boato1(nboat),boato2(nboat),boato3(nboat)
dim shared as Integer order,torder,war,ncloud2=30,ifog=0,nroc2=25,myicar=4,myiplane=8
Dim Shared As Single  scalez=20
Dim Shared As Any Ptr worldbmp,townbmp 
Dim Shared As Integer tsphere,tsphere0,altsphere,altsphere0,tstation,istars
Dim Shared As Integer planet=1,planetsat=1,orbit=1
Dim Shared As String  addon(100)
Dim Shared As Integer myboat,myboat0,initspace,deepspace
Dim Shared As Single  smx0,smy0,kscalex=100,kscalex00=100
Dim Shared As String  addonname 
Dim Shared As Double  myworldx=0,myworldy=-145
Dim Shared As Single  xweb1=-99999999,yweb1=0,xweb11=-99999999,yweb11
Dim Shared As Integer topentown=0,itown=1,tinittown0=2,tmapchanged=0,ioverpass=0,tautopilot=0,ncar2=50,tretroviseur=0
Dim Shared As Double  tinittown00,timeretro
Dim Shared As String reverselocation,reverselocation0
Dim Shared As Single k8=6,k88=6,vautopilot=3
Dim Shared As Single nearaerowaylat(18),nearaerowaylon(18),nearaerowayx(18),nearaerowayy(18)
Dim Shared As String nearaerowayname(18)
Dim Shared As Single to1car,to2car,to1plane,to2plane,retroto1,retroto2,tlayer=0,tlayer2,tlayer0,tlayer00,layero1
Dim Shared As Integer tshadow=1,tfoothorse=0,typeautopilot,tbing=1,tgps=0,dyh0,tradar2,typeautopilot0
Dim Shared As Double timelayer
Dim Shared As int64  idlayer,idlayer0
#Include "./movecar.bi"

Dim Shared As String ficin
Dim As String ficini="freewebcar_chung.ini"
Dim Shared As String ficload,ficok:ficok="okinit.txt"
Dim Shared As Integer File,tok
function getficok()As String  
file=FreeFile
Open ficok For Input As #file
ficin=""
If Not Eof(file) Then Line Input #file,ficin
Close #file
Return ficin
End Function
Sub setficok(text As string)
file=freefile
Open ficok For Output As #file
Print #file,text
Close #file	
End Sub
If FileExists(ficini)=0 Then
	i=messagebox(0,"create "+ficini+" ?","freewebcar_chung",1)
	If i<>1 Then closesounds:myTTSclose():End
   file=FreeFile
	Open ficini For Output As #file
	Close #file
EndIf
file=FreeFile
Open ficini For Input As #file
icar=2
If Not Eof(file) Then Line Input #file,ficin:icar=Val(ficin)
imap=1
If Not Eof(file) Then Line Input #file,ficin:imap=Val(ficin)
isol=2
If Not Eof(file) Then Line Input #file,ficin:isol=Val(ficin)
iciel=6
If Not Eof(file) Then Line Input #file,ficin:iciel=Val(ficin)
to1=0:to2=0
If Not Eof(file) Then Line Input #file,ficin:to1=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:to2=Val(ficin)
igrass=2
If Not Eof(file) Then Line Input #file,ficin:igrass=Val(ficin)
viseur=0
If Not Eof(file) Then Line Input #file,ficin:viseur=Val(ficin)
narbre2=2500
If Not Eof(file) Then Line Input #file,ficin:narbre2=Val(ficin)
distscale=1.0
If Not Eof(file) Then Line Input #file,ficin:distscale=Val(ficin)
fullscreen=1
If Not Eof(file) Then Line Input #file,ficin:fullscreen=Val(ficin)
maxfps=32
If Not Eof(file) Then Line Input #file,ficin:maxfps=Val(ficin)
ismooth=0
If Not Eof(file) Then Line Input #file,ficin:ismooth=Val(ficin)
kwave=1.0
If Not Eof(file) Then Line Input #file,ficin:kwave=Val(ficin)
nboat2=9
If Not Eof(file) Then Line Input #file,ficin:nboat2=Val(ficin)
startoption=0
If Not Eof(file) Then Line Input #file,ficin:startoption=Val(ficin)
volant=1
If Not Eof(file) Then Line Input #file,ficin:volant=Val(ficin)
mx=0:my=0:mz=0
If Not Eof(file) Then Line Input #file,ficin:mx=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:my=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:mz=Val(ficin)
o1=0:o2=0:o3=0
If Not Eof(file) Then Line Input #file,ficin:o1=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:o2=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:o3=Val(ficin)
iship=0
For i=1 To nship
	airshipx(i)=i*4500:airshipy(i)=i*4000:airshipz(i)=1500.0 
Next
While Not Eof(file) And ficin<>"finlist"
  iship=min2(nship,iship+1)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipx(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipy(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipz(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipo1(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipo2(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipo3(iship)=Val(ficin)
Wend
ficin=""
order=1
If Not Eof(file) Then Line Input #file,ficin:order=Val(ficin)
ncloud2=30
If Not Eof(file) Then Line Input #file,ficin:ncloud2=Val(ficin)
ifog=0
If Not Eof(file) Then Line Input #file,ficin:ifog=Val(ficin)
nship2=10
If Not Eof(file) Then Line Input #file,ficin:nship2=Val(ficin)
level=1
If Not Eof(file) Then Line Input #file,ficin:level=Val(ficin)
carb=carb0
If Not Eof(file) Then Line Input #file,ficin:carb=Val(ficin)
imapsol=4
If Not Eof(file) Then Line Input #file,ficin:imapsol=Val(ficin)
compas=1
If Not Eof(file) Then Line Input #file,ficin:compas=Val(ficin)
scalez=20
If Not Eof(file) Then Line Input #file,ficin:scalez=Val(ficin)
For i=1 To 40
	mapsol(i)=4
Next
i=0
While Not Eof(file) And ficin<>"finlist"
  i=min2(40,i+1)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then mapsol(i)=Val(ficin)
Wend 
ficin=""
istars=1
If Not Eof(file) Then Line Input #file,ficin:istars=Val(ficin)
addonname=""
If Not Eof(file) Then Line Input #file,ficin:addonname=Trim(ficin)
kscalex00=100
If Not Eof(file) Then Line Input #file,ficin:kscalex00=Val(ficin)
tseashore=1
If Not Eof(file) Then Line Input #file,ficin:tseashore=Val(ficin)
topentown=0
If Not Eof(file) Then Line Input #file,ficin:topentown=Val(ficin)
itown=1
If Not Eof(file) Then Line Input #file,ficin:itown=Val(ficin)
k88=6
If Not Eof(file) Then Line Input #file,ficin:k88=max2(4,min2(9,Val(ficin)))
For i=1 To 18
	nearaerowayname(i)=""
	nearaerowaylat(i)=-91
	nearaerowaylon(i)=-181
Next
For i=1 To 18
If Not Eof(file) Then Line Input #file,ficin:nearaerowayname(i)=Trim(ficin)
If Not Eof(file) Then Line Input #file,ficin:nearaerowaylat(i)=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:nearaerowaylon(i)=Val(ficin)
Next
ioverpass=0
If Not Eof(file) Then Line Input #file,ficin:ioverpass=Val(ficin)
icombomap=1
If Not Eof(file) Then Line Input #file,ficin:icombomap=Val(ficin)
tautopilot=0
If Not Eof(file) Then Line Input #file,ficin:tautopilot=Val(ficin)
vautopilot=3
If Not Eof(file) Then Line Input #file,ficin:vautopilot=Val(ficin)
ncar2=50
If Not Eof(file) Then Line Input #file,ficin:ncar2=Val(ficin)
tretroviseur=0
If Not Eof(file) Then Line Input #file,ficin:tretroviseur=Val(ficin)
nroc2=25
If Not Eof(file) Then Line Input #file,ficin:nroc2=Val(ficin)
myicar=4
If Not Eof(file) Then Line Input #file,ficin:myicar=Val(ficin)
myiplane=8
If Not Eof(file) Then Line Input #file,ficin:myiplane=Val(ficin)
to1car=170:to2car=0
If Not Eof(file) Then Line Input #file,ficin:to1car=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:to2car=Val(ficin)
to1plane=170:to2plane=0
If Not Eof(file) Then Line Input #file,ficin:to1plane=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:to2plane=Val(ficin)
tsoundarcade=1
If Not Eof(file) Then Line Input #file,ficin':tsoundarcade=Val(ficin)
tshadow=1
If Not Eof(file) Then Line Input #file,ficin:tshadow=Val(ficin)
minfps=6
If Not Eof(file) Then Line Input #file,ficin:minfps=Val(ficin)
tfoothorse=0
If Not Eof(file) Then Line Input #file,ficin:tfoothorse=Val(ficin)
retroto1=0:retroto2=0
If Not Eof(file) Then Line Input #file,ficin:retroto1=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:retroto2=Val(ficin)
typeautopilot=0
If Not Eof(file) Then Line Input #file,ficin:typeautopilot=Val(ficin)
tgoogle=0
If Not Eof(file) Then Line Input #file,ficin:tgoogle=Val(ficin)
tbing=1
If Not Eof(file) Then Line Input #file,ficin:tbing=Val(ficin)
tgps=0
If Not Eof(file) Then Line Input #file,ficin:tgps=Val(ficin)
tlayer=0
If Not Eof(file) Then Line Input #file,ficin:tlayer=Val(ficin)
reverselocation=""
If Not Eof(file) Then Line Input #file,ficin:reverselocation=Trim(ficin)
dyh0=0
If Not Eof(file) Then Line Input #file,ficin:dyh0=Val(ficin)
tradar2=0
If Not Eof(file) Then Line Input #file,ficin:tradar2=Val(ficin)
tradio=0
If Not Eof(file) Then Line Input #file,ficin:tradio=Val(ficin)
typeautopilot0=0
If Not Eof(file) Then Line Input #file,ficin:typeautopilot0=Val(ficin)
Close #file
carb=max(1000.0,min(carb+1000.0,carb0))
kscalex=500:kscalex00=500
'scalex=2500:scalex0=2500
k8=6:k88=6
Dim Shared As Single gldistmax
Sub glsetrange(dxmin As Single=2.0,dxmax As Single=13000*10*25)
        /' init OpenGL '/        
   Var k=1.0
   If plane=0 And tfoothorse=0 Then k=0.5
	glMatrixMode GL_PROJECTION
	glLoadIdentity
	'              anglevue    xmax/ymax   mxmin,mxmax
	'gluPerspective   48.0,    640.0/480.0,  2.0, 13000.0
	'gldistmax=dxmax/25'13000*10
	gluPerspective   48.0,    xmax/ymax,  dxmin*0.7*k, dxmax*0.7*k
	glMatrixMode GL_MODELVIEW
	'glLoadIdentity
End Sub 
Sub initgl
        /' init OpenGL '/        
	glMatrixMode GL_PROJECTION
	glLoadIdentity
	'              anglevue    xmax/ymax   mxmin,mxmax
	'gluPerspective   48.0,    640.0/480.0,  2.0, 13000.0
	gldistmax=13000*10
	'gluPerspective   48.0,    xmax/ymax,  2.0, gldistmax*25
	gluPerspective   48.0,    xmax/ymax,  3.3, 1700000
	glMatrixMode GL_MODELVIEW
	glLoadIdentity
	
	glShadeModel GL_SMOOTH
	glClearColor 0.50, 0.50, 1.0, 0.0
	glClearDepth 1.0
	glEnable GL_DEPTH_TEST
	glDepthFunc GL_LEQUAL
	
	gldisable gl_cull_face
	gldisable gl_lighting
	glenable gl_light0
	glenable gl_normalize
	glnormals=1
   glEnable GL_COLOR_MATERIAL
   'glColorMaterial GL_FRONT_and_back,GL_DIFFUSE
   glcolormaterial GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE

	'glHint GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST    '' Really Nice Perspective Calculations
	glHint GL_PERSPECTIVE_CORRECTION_HINT, GL_FASTEST    
	'glHint GL_PERSPECTIVE_CORRECTION_HINT, GL_DONT_CARE
		
	Dim LightAmbient(0 to 3) as Single => {0.625, 0.625, 0.625, 1.0}   '' Ambient Light Values
	Dim LightAmbient2(0 to 3) as Single => {0.7,0.7,0.7, 1.0}   '' Ambient Light Values
	Dim LightAmbient3(0 to 3) as Single => {0.071,0.071,0.071, 1.0}   '' Ambient Light Values
	Dim LightDiffuse(0 to 3) as Single => {1.0, 1.0, 1.0, 1.0}   '' Diffuse Light Values
	Dim LightPosition(0 to 3) as single => {0.0, 0.0, 2000.0, 1.0}  '' Light Position
	glLightfv GL_LIGHT1, GL_AMBIENT, @LightAmbient(0)   '' Setup The Ambient Light
	glLightfv GL_LIGHT2, GL_AMBIENT, @LightAmbient2(0)   '' Setup The Ambient Light
	glLightfv GL_LIGHT0, GL_AMBIENT, @LightAmbient3(0)   '' Setup The Ambient Light
	'glLightfv GL_LIGHT0, GL_DIFFUSE, @LightDiffuse(0)   '' Setup The Diffuse Light
	'glLightfv GL_LIGHT0, GL_POSITION, @LightPosition(0) '' Position The Light
	glEnable GL_LIGHT0                                  '' Enable Light One

End Sub

Dim Shared As Single fps,rot
Dim Shared As md2_node Ptr md2_nodes(100)
Dim Shared As uint md2inode,md2nnode
Function addmd2node(ByVal model As md2_model ptr) As uint 
	If md2nnode>=100 Then Return 0
	md2nnode+=1
   md2_nodes(md2nnode)  = Callocate (sizeof(md2_node))
	With *md2_nodes(md2nnode)
      .md2model=model
      .scalex=1
      .scaley=1
      .scalez=1		
	End With
	Return md2nnode
End Function
Sub setnodeposition(ByVal node As md2_node Ptr,ByVal x As Single,ByVal y As Single,ByVal z As Single)
	node->x=x:node->y=y:node->z=z
End Sub
Sub setnoderotation(ByVal node As md2_node Ptr,ByVal rx As Single,ByVal ry As Single,ByVal rz As Single)
	node->rotx=rx:node->roty=ry:node->rotz=rz
End Sub
Sub setnodescale(ByVal node As md2_node Ptr,ByVal sx As Single,ByVal sy As Single,ByVal sz As Single)
	node->scalex=sx:node->scaley=sy:node->scalez=sz
End Sub
Sub setnodetexture(ByVal node As md2_node Ptr,ByVal texture As uint)
	node->texture=texture
End Sub
Sub setanim(ByVal node As md2_node Ptr,ByVal anim As uint)
Dim As uint i
With *node
	If anim<0 Or anim>md2_all Then anim=md2_all
	If anim=md2_random Then i=Int(Rnd*20.9) Else i=anim
	If anim=md2_all Then 
	  .startframe=0
	  .endframe=.md2model ->header.num_frames-1
	  .fps=10
	Else     
	  .startframe=md2_animlist(i).startframe
	  .endframe=md2_animlist(i).endframe
	  .fps=md2_animlist(i).fps
	  'dtime=80*10/(0.01+md2_animlist(i).fps)
	EndIf 
	.startframe=min(.md2model ->header.num_frames-1,.startframe)
	.endframe=min(.md2model ->header.num_frames-1,.endframe)
	.nframe=.startframe
	.anim=anim
End With 
End Sub
Sub setanimationrange(ByVal node As md2_node Ptr,ByVal start As uint,ByVal last As uint,_  
	                   ByVal fps As Single=10)
With *node
 .endframe=min(.md2model->header.num_frames-1,last) 
 .startframe=min(.endframe,start)
 .fps=fps
 .nframe=.startframe
 .anim=md2_other
End With 
End Sub
Const As Integer narbre=2500+17500,ncow=50
Dim Shared As Integer ntree
Dim Shared As Single scalex=500,scalez0=20,texscale,dxterrain,scaley=500
Dim Shared As Integer x960=1200
kscalex=kscalex00*Sqr(1200/x960)
scalex*=kscalex/100
If planet=0 Then scaley=scalex Else scaley=(scalex*1.5)'2
texscale=800/scalex
Dim Shared As Single hsnow=1900,hsnowij
Dim Shared As uint mapautotext,mapautotext0,solautotext(10),webtextzoom
Dim Shared As Integer testwater=0,testsea=0,testsea2=0,testworld=0
Sub webglbindtexture(gltexture2D As uint,texture As uint)
	If texture=webtextzoom Then
		glbindtexture(gl_texture_2d,texture)
	ElseIf texture=towntext Then
		glbindtexture(gl_texture_2d,texture)
	ElseIf texture=soltexture0 And testsea=1 Then'watertext Then
		glbindtexture(gl_texture_2d,texture)
	ElseIf webtext>0 And planet=0 Then
		glbindtexture(gl_texture_2d,webtext)
	Else
		glbindtexture(gl_texture_2d,texture)
	EndIf
End Sub 
Dim Shared As Integer tcolorshadow=0,testwater2
Sub myglcolor3fv(color3fv As glfloat Ptr)
Dim As Single r1=1.0 
If tcolorshadow Then glcolor4f(0.6,0.6,0.6,0.6):Exit sub
If mapautotext=towntext And hsnowij>waterz Then
	glcolor4f(r1,r1,r1,0):Exit Sub
ElseIf testwater=1 And (testsea2=1 Or testwater2=1) Then
	glcolor4f(0.2,0.2,r1,0):Exit Sub 
'ElseIf mapautotext=webtext And planet=0 Then
'	glcolor3f(1,1,1):Exit sub
ElseIf webtext>0 And planet=0 Then
	glcolor4f(r1,r1,r1,0):Exit sub
	'glcolor4f(0,0,0,0):Exit sub
EndIf
'If (mapautotext<>maptexture4 Or hsnowij<hsnow) Then
'	glcolor3fv(color3fv)
'Else
	glcolor4f(r1,r1,r1,0)
'EndIf
End Sub
Dim Shared As Single dmx0,dmy0,xtown,ytown,dxtown,dytown,townbmpx,townbmpy
Dim Shared As Single ktownh=1,dktownh=1
Dim Shared As Single xweb=-99999999,yweb,dxweb=75000,dyweb=75000
Dim Shared As Single xwebzoom=-99999999,ywebzoom,dxwebzoom=10000,dywebzoom=1,xwebzoom1=-9999999,ywebzoom1
Dim Shared As Integer nbridge=500,ibridge=0
Dim Shared As Single bridgelat(nbridge),bridgelon(nbridge),bridgelat2(nbridge),bridgelon2(nbridge)
Dim Shared As String bridgename(nbridge)
Dim Shared As Single kxweb=(1-512/563.0)/2
Sub mygltexcoord2f(tx As Single,ty As Single) 
Dim As Single x,y
If topview<=2 Then 
 If mapautotext=towntext Then
	x=(tx*texscale-256)*scalex+dmx0
	y=(ty*texscale-256)*scalex+dmy0
	gltexcoord2f((x-xtown+dxtown)*0.48/dxtown,(y-ytown+dytown)*0.48/dytown)
 /'ElseIf (mapautotext=webtextzoom And planet=0) Then
	x=(tx*texscale-256)*scalex+dmx0
	y=(ty*texscale-256)*scalex+dmy0
	Var k06=kxweb,k88=1-k06-k06
	Var tyy=k06+k88*(y-ywebzoom+dywebzoom)*0.5/dywebzoom
	'If (tyy-Int(tyy))<k06 Then tyy+=k88
	Var txx=k06+k88*(x-xwebzoom+dxwebzoom)*0.5/dxwebzoom
	gltexcoord2f(txx,tyy) '/
 ElseIf mapautotext=snowtext Then 	
	gltexcoord2f(tx*4,ty*4)
 ElseIf (mapautotext=webtext And planet=0) Or testsea=0 Then
	x=(tx*texscale-256)*scalex+dmx0
	y=(ty*texscale-256)*scalex+dmy0
	If Abs(x-mx)>15000 Then
		testwater2=1
	ElseIf Abs(y-my)>15000 Then
		testwater2=1
	Else
		testwater2=0
	EndIf
	'Var tyy=0.06+0.94*(y-yweb+dyweb)*0.48/dyweb
	'x=(tx*texscale-256+0.665)*scalex+dmx0
	'y=(ty*texscale-256-0.665)*scalex+dmy0
	Var k06=kxweb,k66=1-k06-k06
	'Var tyy=k06+k66*(y-yweb+dyweb-512)*0.5/dyweb
	Var tyy=0.5+k66*(y-yweb-256)*0.5/dyweb
	'Var tyy0=0.5+k66*(-dyweb-256)*0.5/dyweb
	'Var dtyy=tyy-Int(tyy)
	Var dtyy=k66*(y-yweb+dyweb)*0.5/dyweb
	If dtyy<k06 Then
			'tyy=k06+(dtyy-k06)*0.2
			'tyy=min(1,k06+k06-dtyy)
			tyy=k06+(k06-dtyy)*0.2
	ElseIf dtyy>(1-k06) Then
		   'tyy=(1-k06)+(dtyy-(1-k06))*0.2
		   'tyy=max(0,1-k06-(dtyy-1+k06))
		   tyy=1-k06-(dtyy-1+k06)*0.2
	EndIf
	'Var txx=max(-1,min(2.0,k06+k66*(x-xweb+dxweb-256)*0.5/dxweb))
	Var txx=0.5+k66*(x-xweb-256)*0.5/dxweb
	'Var dtxx=txx-Int(txx)
	Var dtxx=k66*(x-xweb+dxweb)*0.5/dxweb
	If dtxx<k06 Then
		'txx=k06+(dtxx-k06)*0.2
		'txx=min(1,k06+k06-dtxx)
		txx=k06+(k06-dtxx)*0.2
	ElseIf dtxx>(1-k06) Then
		'txx=(1-k06)+(dtxx-(1-k06))*0.2
		'txx=max(0,1-k06-(dtxx-1+k06))
		txx=1-k06-(dtxx-1+k06)*0.2
	EndIf
	gltexcoord2f(txx,tyy)
	'Var tyy=0.06+0.94*(y-yweb+dyweb)*0.48/dyweb
	'If (tyy-Int(tyy))<0.06 Then tyy+=0.94
	'gltexcoord2f((x-xweb+dxweb)*0.48/dxweb,tyy)
 ElseIf webtext>0 And planet=0 Then
	gltexcoord2f(tx,ty)
 Else
	gltexcoord2f(tx,ty)
 EndIf 	
Else 
 If mapautotext=towntext Then
	x=(tx*texscale-256)*scalex+dmx0
	y=(ty*texscale-256)*scalex+dmy0
	tx=(x-xtown+dxtown)*0.5/dxtown:ty=(y-ytown+dytown)*0.5/dytown
	'tx=0.5+5*(tx-0.5):ty=0.5+5*(ty-0.5)
	gltexcoord2f(tx,ty)
 ElseIf mapautotext=webtext And planet=0 Then
	x=(tx*texscale-256)*scalex+dmx0
	y=(ty*texscale-256)*scalex+dmy0
	tx=(x-xweb+dxweb)*0.5/dxweb:ty=(y-yweb+dyweb)*0.5/dyweb
	tx=0.5+0.5*(tx-0.5):ty=0.5+0.5*(ty-0.5)
	gltexcoord2f(tx,ty)
 ElseIf webtext>0 And planet=0 Then
	tx=0.5+0.5*(tx-0.5):ty=0.5+0.5*(ty-0.5)
	gltexcoord2f(tx,ty)
 Else
	tx=0.5+0.5*(tx-0.5):ty=0.5+0.5*(ty-0.5)
	gltexcoord2f(tx,ty)
 EndIf
EndIf  
End Sub 
Sub drawterrain
Dim As Single x,y
Dim As Single i,j,i1,dx=27
dx=27+min(57.0,Int((mz-mzsol0)*0.01*distscale))
dx=Int(min(120.0,dx*max(1.0, distscale*3*narbre2/(narbre2+4*2*ntree))))
dxterrain=dx
For x=max(-356.0,-dx+Int(mx/scalex+10000)-10000) To min(356.0-1,dx+Int(mx/scalex+10000)-10000)
	i=x+256+0.1
	while i<-100:i+=512+200:Wend 
	While i>612.2:i-=512+200:Wend 
   glBegin (GL_TRIANGLE_STRIP)	
	For y=max(-356.0,-dx+Int(my/scalex+10000)-10000) To min(356.0,dx+Int(my/scalex+10000)-10000)
     j=y+256+0.1
	  While j<-100:j+=512+200:Wend 
	  While j>612.2:j-=512+200:Wend 
     myglcolor3fv(Cast(glfloat Ptr,@terraincolor(i,j)))
     glTexCoord2f(i/texscale,j/texscale)
 	  glvertex3f((x)*scalex,y*scalex,scalez*terrain(i,j))
 	  i1=i+1:If i1>612.2 Then i1-=512+200
     myglcolor3fv(cast(glfloat Ptr,@terraincolor(i1,j)))
     glTexCoord2f((i+1)/texscale,j/texscale)
 	  glvertex3f((x+1)*scalex,y*scalex,scalez*terrain(i1,j))
	Next
	glend()
Next
End Sub
Dim Shared As Single houlex,houley,kwater,houlez(-612*32-200 To 612*32+200),altwater=2200
For houlex=-612*32-200 To 612*32+200
	houlez(houlex)=3.0*(-1.001+Cos(houlex*360*degtorad/32))/scalez
Next
Dim Shared As Single dxwater=10
Dim Shared As Integer mapauto,solauto,ntown3=100',worldx,worldy
Dim Shared As Double worldx,worldy
Dim Shared As Integer ntown4=700,itown4,townpix,taddtownhouse,taddtownhouse2
Dim Shared As Single mapautoix,mapautoiy,mapautoiz
Dim Shared As String worldname,townname,townworld,townname1(ntown3),townworld1(ntown3)
Dim Shared As Single xtown1(ntown3),ytown1(ntown3),dxtown1(ntown3),dytown1(ntown3)
Dim Shared As Single ktownh1(ntown3),ktownh2(ntown3)
Dim Shared As Single wxtown1(ntown3),wytown1(ntown3),wktown1(ntown3),wxtown,wytown,wktown=1
Dim Shared As Integer townbmpx1(ntown3),townbmpy1(ntown3),townpix1(ntown3)
Dim Shared As Single townhousex(ntown4),townhousey(ntown4),townhouseh(ntown4),townhousez(ntown4)
Dim Shared As Single townhouseo1(ntown4),townhousedx(ntown4),townhousedy(ntown4)
Dim Shared As Single townhousevie(ntown4),townhouser(ntown4),townhouseg(ntown4),townhouseb(ntown4)
Dim Shared As Integer townhousetype(ntown4)
Declare Sub resetmxweb()
Declare Sub resettownwaynode()
Declare Sub resettownwaynode2()
Declare Sub resetfuel()
Sub subresettown()
Dim As String resp
guiconfirm("reset town ?","confirm",resp)
If resp="yes" Then
	itown4=0
	taddtownhouse=0
	taddtownhouse2=0
EndIf
resetmxweb()
resettownwaynode()
resettownwaynode2()
End Sub
Sub subsavetown()
Dim As Integer file,i,j
Dim As String fictown,resp
If towntext=0 Then Exit Sub
fictown="media/town/"+townname+worldname+".txt"
guiconfirm("save town in "+fictown+" ?","confirm",resp)
If resp<>"yes" And testworld=0 Then 
  fictown="media/town/"+townname+".txt"
  guiconfirm("save town in "+fictown+" ?","confirm",resp)
EndIf   
If resp<>"yes" Then Exit Sub 
file=freefile
Open fictown For Output As #file
For i=1 To itown4
    Print #file,(townhousex(i)+dmx0)*100/kscalex
    Print #file,(townhousey(i)+dmy0)*100/kscalex
    Print #file,townhousedx(i)*100/kscalex
    Print #file,townhousedy(i)*100/kscalex
    Print #file,townhouseh(i)*100/kscalex
    Print #file,townhouseo1(i)
Next
Print #file,"finlist"
For i=1 To itown4
    Print #file,townhousetype(i)
    Print #file,townhouser(i)
    Print #file,townhouseg(i)
    Print #file,townhouseb(i)
Next 
Close #file	
End Sub
Sub subloadtown()
'Exit Sub 	
Dim As Integer file,i,j
Dim As String fictown,ficin
If towntext=0 Then Exit Sub
fictown="media/town/"+townname+worldname+".txt"
If FileExists(fictown)=0 And testworld=0 Then
	fictown="media/town/"+townname+".txt"
EndIf
If FileExists(fictown)=0 Then Exit Sub 
file=freefile
Open fictown For Input As #file
itown4=0
For i=1 To ntown4
  If Eof(file) Then Exit For 
  If Not Eof(file) then Line Input #file,ficin
  If ficin="finlist" Then Exit For 
  itown4+=1
  townhousex(itown4)=Val(ficin)*kscalex/100-dmx0
  If Not Eof(file) then Line Input #file,ficin:townhousey(itown4)=Val(ficin)*kscalex/100-dmy0
  If Not Eof(file) then Line Input #file,ficin:townhousedx(itown4)=Val(ficin)*kscalex/100
  If Not Eof(file) then Line Input #file,ficin:townhousedy(itown4)=Val(ficin)*kscalex/100
  If Not Eof(file) then Line Input #file,ficin:townhouseh(itown4)=Val(ficin)*kscalex/100
  If Not Eof(file) then Line Input #file,ficin:townhouseo1(itown4)=Val(ficin)
  townhousez(itown4)=getterrainheight(townhousex(itown4),townhousey(itown4))
  townhousevie(itown4)=200+townhouseh(itown4)*0.5
  townhouser(itown4)=1
  townhouseg(itown4)=1
  townhouseb(itown4)=1
Next
For i=1 To itown4
	townhousetype(i)=0
   If Not Eof(file) then Line Input #file,ficin:townhousetype(i)=Val(ficin)	
	townhouser(i)=1
   If Not Eof(file) then Line Input #file,ficin:townhouser(i)=Val(ficin)	
	townhouseg(i)=1
   If Not Eof(file) then Line Input #file,ficin:townhouseg(i)=Val(ficin)	
	townhouseb(i)=1
   If Not Eof(file) then Line Input #file,ficin:townhouseb(i)=Val(ficin)	
Next
Close #file	
taddtownhouse=1
End Sub
Sub loadtown(i As integer)
If towntext<>0 Then guideletetexture(towntext):towntext=0
towntext=guiloadtexture("media/town/"+townname1(i)+".jpg",0,255)
guiBload(townbmp,"media/town/"+townname1(i)+".jpg")'max 900x900			
xtown=xtown1(i):ytown=ytown1(i):dxtown=dxtown1(i):dytown=dytown1(i):ktownh=ktownh1(i)
townbmpx=townbmpx1(i):townbmpy=townbmpy1(i):townname=townname1(i)
townworld=townworld1(i)
If testworld=1 Then
	xtown=wxtown:ytown=wytown:dxtown*=wktown:dytown*=wktown
EndIf
dktownh=1:If ktownh2(i)>0.1 Then dktownh=ktownh2(i)/ktownh
townpix=140:If townpix1(i)>0 Then townpix=townpix1(i)
'setmapautotextures()
itown4=0
taddtownhouse=0
taddtownhouse2=0
subloadtown()
End Sub
dim shared as integer itownworld=0
Declare Sub settown2()
Sub settown()
If testworld=1 Then settown2():Return 
Dim As Integer i,dist,dist1
If dxterrain<1 Then dxterrain=100
dist=max(Abs(xtown-mx-dmx0),Abs(ytown-my-dmy0))-100
If dist<dxterrain*scalex+1 Then
 If dist<min(dxtown,dytown) Then
	If towntext<>0 And worldname=townworld Then Exit Sub Else dist=9999999
 EndIf 
EndIf
For i=1 To ntown3
	If townworld1(i)="" Then Exit Sub
	If worldname=townworld1(i) Then
		dist1=max(Abs(xtown1(i)-mx-dmx0),Abs(ytown1(i)-my-dmy0))
      If dist1<dxterrain*scalex Then
       If dist1<dist And i<>itownworld Then 	
      	loadtown(i):itownworld=i
      	Exit Sub 
       EndIf 	
      EndIf
	EndIf
Next
End Sub 
Sub subretroviseur()
	If tretroviseur=0 Then tretroviseur=1 Else tretroviseur=0
	soundclick()
	Sleep 300
End Sub
Dim Shared As Integer worldmapx(100),worldmapy(100),showmapworld,worldx0,worldy0
Dim Shared As String worldmap(100)
Dim shared as string worldname2
Dim Shared As Single mx2,my2
Function settown3(worldname2 As String)As Integer 
Dim As Integer i,dist,dist1,j
If testworld=1 Then Return 0
If dxterrain<1 Then dxterrain=100
/'dist=max(Abs(xtown-mx-dmx0),Abs(ytown-my-dmy0))-100
If dist<dxterrain*scalex+1 Then
 If dist<min(dxtown,dytown) Then
	If towntext<>0 And worldname2=townworld Then Return 1 Else dist=99999999
 EndIf 
EndIf'/
dist=99999999
i=6
'wxtown1(i)=1985511:wytown1(i)=7851558:wktown1(i)=1.32
'wxtown1(i)=mx2+dmx0:wytown1(i)=my2+dmy0:wktown1(i)=1.3
j=0
For i=1 To ntown3
	If townworld1(i)="" Then Exit For 
	If worldname2=townworld1(i) Then
		dist1=max(Abs(wxtown1(i)-mx2-dmx0),Abs(wytown1(i)-my2-dmy0))
      If dist1<dxterrain*scalex Then
       If dist1<dist Then
      	j=i:dist=dist1
       EndIf 	
      EndIf
	EndIf
Next
If j>0 Then
	      i=j
	      if i<>itownworld Then loadtown(i):itownworld=i
      	xtown=wxtown1(i)-mx2+mx
      	ytown=wytown1(i)-my2+my
      	wktown=wktown1(i)
      	dxtown=dxtown1(i)*wktown
      	dytown=dytown1(i)*wktown
      	'auxvar2=xtown-mx-dmx0
      	'auxvar3=ytown-my-dmy0
      	Return 1
EndIf 
Return 0
End Function
Declare Sub worldxytomxy(worldx As double,worldy As double,ByRef mxx As Single,ByRef myy As Single)
Sub settown2()
Dim As Integer i,test
Dim As Single dx,dy
For i=1 To 100
	If worldmap(i)<>"" Then
		worldname2=worldmap(i)
      worldxytomxy(worldx-worldmapx(i),worldy-worldmapy(i),dx,dy)
		mx2=mx+dx
		my2=my+dy
		wxtown=xtown+dx
		wytown=ytown+dy
		test=settown3(worldname2)
		If test=1 Then
		   'auxvar+=1000
		   'auxvar=dx'*aux*535
		   'auxvar2=worldy-worldmapy(i)
			Exit For 
		EndIf
	EndIf
Next
End Sub
Sub inittownjpg()
Dim As Integer i=0
'itown4=0
For i=1 To ntown3
	wxtown1(i)=-99999999:wytown1(i)=0
Next
i=6
wxtown1(i)=1984129:wytown1(i)=7855013:wktown1(i)=1.32
wxtown1(i)=1985511:wytown1(i)=7851558:wktown1(i)=1.32
i=1
wxtown1(i)=-94797.61:wytown1(i)=5175779:wktown1(i)=1.3
i=2'nice
wxtown1(i)=6195461:wytown1(i)=1473789:wktown1(i)=1.3
i=3
wxtown1(i)=5281726:wytown1(i)=7609446:wktown1(i)=1.3
i=4
wxtown1(i)=70050.41:wytown1(i)=8494721:wktown1(i)=1.3
i=5
wxtown1(i)=2045877:wytown1(i)=7699277:wktown1(i)=1.3
i=7
wxtown1(i)=4885884:wytown1(i)=3240896:wktown1(i)=1.3
i=8
wxtown1(i)=2591880:wytown1(i)=409470.1:wktown1(i)=1.3
i=9
wxtown1(i)=3051317:wytown1(i)=5531520:wktown1(i)=1.3
i=10
wxtown1(i)=-126288.4:wytown1(i)=1415696:wktown1(i)=1.3
i=11
wxtown1(i)=487185.1:wytown1(i)=2209864:wktown1(i)=1.3
i=12
wxtown1(i)=-2911428:wytown1(i)=474411.9:wktown1(i)=1.3
i=13
wxtown1(i)=-2581650:wytown1(i)=2854958:wktown1(i)=1.3
i=14
wxtown1(i)=1020335:wytown1(i)=-1058691:wktown1(i)=1.3
i=15
wxtown1(i)=-2581650:wytown1(i)=2854958:wktown1(i)=1.3
i=16
wxtown1(i)=-4150613:wytown1(i)=8122770:wktown1(i)=1.3
i=17
wxtown1(i)=1761756:wytown1(i)=-3549315:wktown1(i)=1.3
For i=1 To ntown3
	wxtown1(i)*=kscalex/500:wytown1(i)*=kscalex/500
Next
i=0
i+=1
townworld1(i)="yougo"
townname1(i)="crikvenica"	
dxtown1(i)=17000*kscalex/500:dytown1(i)=21000*kscalex/500
xtown1(i)=140000*kscalex/500:ytown1(i)=146000*kscalex/500
townbmpx1(i)=480:townbmpy1(i)=515
ktownh1(i)=1
i+=1
townworld1(i)="france"
townname1(i)="nice"	
dxtown1(i)=30200*kscalex/500:dytown1(i)=19100*kscalex/500
xtown1(i)=2862000*kscalex/500:ytown1(i)=-2725000*kscalex/500
townbmpx1(i)=481:townbmpy1(i)=512
ktownh1(i)=2
i+=1
townworld1(i)="france"
townname1(i)="nancy"	
dxtown1(i)=17500*kscalex/500:dytown1(i)=19000*kscalex/500
xtown1(i)=2246000*kscalex/500:ytown1(i)=1083000*kscalex/500
townbmpx1(i)=482:townbmpy1(i)=513
ktownh1(i)=1.2
i+=1
townworld1(i)="france"
townname1(i)="deauville"	
dxtown1(i)=18000*kscalex/500:dytown1(i)=16500*kscalex/500
xtown1(i)=79500*kscalex/500:ytown1(i)=1826000*kscalex/500
townbmpx1(i)=480:townbmpy1(i)=515
ktownh1(i)=1
i+=1
townworld1(i)="france"
townname1(i)="orly"	
dxtown1(i)=20000*kscalex/500:dytown1(i)=21000*kscalex/500
xtown1(i)=1540000*kscalex/500:ytown1(i)=1420000*kscalex/500
townbmpx1(i)=483:townbmpy1(i)=516
ktownh1(i)=3
i+=1
townworld1(i)="france"
townname1(i)="paris"	
dxtown1(i)=33000*kscalex/500:dytown1(i)=21000*kscalex/500
xtown1(i)=1530000*kscalex/500:ytown1(i)=1510000*kscalex/500
townbmpx1(i)=825:townbmpy1(i)=522
ktownh1(i)=2.7:townpix1(i)=100
i+=1
townworld1(i)="france"
townname1(i)="grenoble"	
dxtown1(i)=32500*kscalex/500:dytown1(i)=19000*kscalex/500
xtown1(i)=3130000*kscalex/500:ytown1(i)=-1131000*kscalex/500
townbmpx1(i)=825:townbmpy1(i)=524
ktownh1(i)=3
i+=1
townworld1(i)="france"
townname1(i)="lebarcares"	
dxtown1(i)=32500*kscalex/500:dytown1(i)=19000*kscalex/500
xtown1(i)=2240800*kscalex/500:ytown1(i)=-3348000*kscalex/500
townbmpx1(i)=821:townbmpy1(i)=524
ktownh1(i)=1:townpix1(i)=97
i+=1
townworld1(i)="england"
townname1(i)="londres"	
dxtown1(i)=32500*kscalex/500:dytown1(i)=19000*kscalex/500
xtown1(i)=2590000*kscalex/500:ytown1(i)=-1900000*kscalex/500
townbmpx1(i)=823:townbmpy1(i)=523
ktownh1(i)=2.7:townpix1(i)=90
i+=1
townworld1(i)="grece"
townname1(i)="athenes"	
dxtown1(i)=32500*kscalex/500:dytown1(i)=19000*kscalex/500
xtown1(i)=-176000*kscalex/500:ytown1(i)=-1150000*kscalex/500
townbmpx1(i)=828:townbmpy1(i)=525
ktownh1(i)=2.2:townpix1(i)=140
i+=1
townworld1(i)="israel"
townname1(i)="jerusalem"	
dxtown1(i)=32500*kscalex/500:dytown1(i)=19000*kscalex/500
xtown1(i)=740000*kscalex/500:ytown1(i)=500000*kscalex/500
townbmpx1(i)=823:townbmpy1(i)=520
ktownh1(i)=1.2:townpix1(i)=100
i+=1
townworld1(i)="israel"
townname1(i)="lecaire"	
dxtown1(i)=34000*kscalex/500:dytown1(i)=20000*kscalex/500
xtown1(i)=-2550000*kscalex/500:ytown1(i)=-810000*kscalex/500
townbmpx1(i)=827:townbmpy1(i)=525
ktownh1(i)=1.2:townpix1(i)=80 
i+=1
townworld1(i)="westUS"
townname1(i)="sanfrancisco"	
dxtown1(i)=21000*kscalex/500:dytown1(i)=22000*kscalex/500
xtown1(i)=-2239500*kscalex/500:ytown1(i)=369500*kscalex/500
townbmpx1(i)=484:townbmpy1(i)=514
ktownh1(i)=8.5:ktownh2(i)=9.5
i+=1
townworld1(i)="westUS"
townname1(i)="losangeles"	
dxtown1(i)=21000*kscalex/500:dytown1(i)=22000*kscalex/500
xtown1(i)=141000*kscalex/500:ytown1(i)=-2258000*kscalex/500
townbmpx1(i)=488:townbmpy1(i)=514
ktownh1(i)=8.1:townpix1(i)=130
i+=1
townworld1(i)="°WestUSA"
townname1(i)="sanfrancisco"	
dxtown1(i)=21000*kscalex/500:dytown1(i)=22000*kscalex/500
xtown1(i)=-6962000*kscalex/500:ytown1(i)=8533400*kscalex/500
townbmpx1(i)=484:townbmpy1(i)=514
ktownh1(i)=9.5:townpix1(i)=120
i+=1
townworld1(i)="°WestUSA"
townname1(i)="losangeles"	
dxtown1(i)=21000*kscalex/500:dytown1(i)=22000*kscalex/500
xtown1(i)=-4436000*kscalex/500:ytown1(i)=5803000*kscalex/500
townbmpx1(i)=488:townbmpy1(i)=514
ktownh1(i)=8.1:townpix1(i)=130
i+=1
townworld1(i)="vietnam"
townname1(i)="saigon"	
dxtown1(i)=34000*kscalex/500:dytown1(i)=20000*kscalex/500
xtown1(i)=2765000*kscalex/500:ytown1(i)=-3037500*kscalex/500
townbmpx1(i)=820:townbmpy1(i)=523
ktownh1(i)=1.4:townpix1(i)=110 
End Sub 
Sub setmapautotext(x As Single,y As Single)
Dim As Integer i
Dim As Single xx,yy
      xx=(x*scalex+dmx0)
      yy=(y*scalex+dmy0)
      If Abs(xx-xtown)<dxtown And Abs(yy-ytown)<dytown Then
      	mapautotext=towntext
      	Exit Sub 
      EndIf
      texscale=16000/scalex
	   'Var k8=6
      Var aux=(8/40)/(4*k8*512*scalex)  
	   mapautoix=535+worldx+xx*aux*535
	   mapautoiy=(276+worldy)-yy*aux*276*2
  		Var pix=Point(mapautoix*750/535,mapautoiy*(750/2)/276,worldbmp)
		Var r=pix Shr 16
		Var g=(pix Shr 8)And 255
		Var b=pix And 255
		If Not(r<35 And g<35)Then 'not water
			If (r>230 And g>230) Then 
			   mapautotext=maptexture5:i=5
	         mapautoiz=getterrainheight(x*scalex,y*scalex)
			   If mapautoiz>hsnow Then mapautotext=maptexture4:i=4 'snow
			ElseIf (r>180 And g>180) Then
				mapautotext=maptexture4:i=4
			ElseIf (r>130 And g>130) Then
				mapautotext=maptexture3:i=3
			ElseIf (r>90 And g>90) Then
				mapautotext=maptexture2:i=2
			Else 	
				mapautotext=maptexture:i=1
			EndIf 
		Else
			mapautotext=maptexture:i=1
		EndIf
End Sub
Dim Shared As Single hrgb0,hrgb1,hrgbi(-100 To 612),testhrgb(-100 To 612,-100 To 612)
Dim Shared As Integer thrgb0,webzoom=13
Declare Sub testtownarbres()
Declare Sub setwebwater2(i As Integer,j As Integer,xx As Single,yy As Single)
Declare Sub setwebwater3(i As Integer,j As Integer,xx As Single,yy As Single)
Dim Shared As Single dayjj
Dim Shared As Single dhmareemax=3.7
Dim Shared As uint mapautotexture2(-100 To 612,-100 To 612)
dim shared as single terrain22(-100 To 612,-100 To 612)
Declare Sub getlockterrain()
Declare Sub getlockterrain2()
Declare Sub freelockterrain()
Declare Sub getlockterrainbmp()
Declare Sub getlockterrainbmp2()
Declare Sub freelockterrainbmp()
Declare Sub getlocktown(ij As Integer)
Declare Sub getlocktown2(ij As Integer)
Declare Sub freelocktown(ij As Integer)
Dim Shared As Integer tupdateroc,inearroad0,tupdatelady,tupdatetown,tupdatearbre,tupdatecow,tupdategrass
Dim Shared As Integer tupdateseashore,testcorrect
Dim Shared As Single zcorrect
Sub subsettupdate()
 tupdateroc=1
 tupdatetown=1
 tupdatelady=1
 tupdatearbre=1
 tupdatecow=1
 tupdategrass=1
 tupdateseashore=1
End Sub
Declare Sub resetttsetterrain()
Sub setmapautotextures2()
Dim As Integer i,j
getlockterrain()
Var dzmax=80.0,dzz=0.0,dzz0=0.0
Var altzold=mz-mzsol00
For i=-100 To 612
	For j=-100 To 612
		mapautotexture(i,j)=mapautotexture2(i,j)
		terrain(i,j)=terrain22(i,j)
		If j>-100 Then
			'If Abs(terrain(i,j)-dzz0)>dzmax Then auxvar+=1:auxtest=0.2
			terrain(i,j)=max(dzz0-dzmax,min(dzz0+dzmax,terrain(i,j)))
		EndIf
		dzz0=dzz
		dzz=terrain(i,j)
		If i>-100 Then dzz=(terrain(i-1,j)+dzz)*0.5
		terrain0(i,j)=terrain(i,j)
		tsetterrain(i,j)=1
	Next
Next
mz=getterrainheight(mx,my)+altzold
mz1=mz
/'If Abs(mxold)>0.001 And mzold>-scalez And mzold<1900*scalez And scalezold>0.01 And scalez>0.01 Then
	Var dz=(mzold/scalezold)-getterrainheight(mxold,myold)/scalez
	For i=-100 To 612
		For j=-100 To 612
			terrain22(i,j)+=dz
			terrain(i,j)+=dz
			terrain0(i,j)+=dz
		Next
	Next
	waterz+=dz*scalez
	waterz0+=dz*scalez 
	mxold=0
   'For i=1 To nship
	'  airshipz(i)+=dz*scalez
   'Next 
EndIf '/
freelockterrain()
subsettupdate()
resetttsetterrain()
End Sub
Dim Shared As Double timecorrectterrain
Dim Shared As Single mxcorrect,mycorrect,mzcorrect
Sub correctterrain(dz As Single)
Dim As Integer i,j,k
getlockterrain()
	For i=-100 To 612
		For j=-100 To 612
			terrain22(i,j)+=dz
			terrain(i,j)+=dz
			terrain0(i,j)+=dz
		Next
	Next
	waterz+=dz*scalez
	waterz0+=dz*scalez 
freelockterrain()	
subsettupdate()
End Sub
Sub testcorrectterrain()
If time2>timecorrectterrain+5 And time2>timeinit+20 Then
	If max(Abs(mxcorrect-mx),Abs(mycorrect-my))<10*kfps Then
		If Abs(mzcorrect-mz)>10*kfps Then
			Var dz=(mzcorrect-getterrainheight(mxcorrect,mycorrect))
			If dz>5*kfps Then 
			  If auxtest>0.6 Then guinotice "correctmz="+Str(dz)
			  'If Abs(waterz-100)>200 Then dz+=(100-waterz)*0.5
			  'correctterrain(dz/scalez)
			  timecorrectterrain=Timer
			  'mz+=dz
			  'mz1+=dz
			  mz-=dz
			  mz1-=dz
			  testcorrect=1
			  'auxvar+=1:auxtest=0.2
			EndIf   
		EndIf
	EndIf
EndIf
mxcorrect=mx
mycorrect=my
mzcorrect=getterrainheight(mxcorrect,mycorrect)
End Sub
Sub resetterrain()
Dim As Integer i,j,k
'getlockterrain()
	For i=-100 To 612
		For j=-100 To 612
			terrain22(i,j)=0
			terrain(i,j)=0
			terrain0(i,j)=0
		Next
	Next
	waterz=0
	waterz0=0 
'freelockterrain()	
subsettupdate()
End Sub
Declare Sub mxytolatlng(x0 As Single,y0 As Single)
Declare Function getterrainheight2 (ByVal x As Single,ByVal y As Single) As Single
Declare Sub setterrainroadwater()
Dim Shared As Single mylatweb,mylngweb,mydlatweb,mydlngweb,myxweb,myyweb,mydxweb,mydyweb,myzmin,myzmax
Sub setmapautotextures1()
Dim As Integer i,j,k,l,x,y,ipix,jpix,n
Dim As Single  xx,yy,dx,dy,xxx,yyy
Dim As Integer z00,z10,z01,z11
Dim As uint pix,r,g,b
getlockterrain2()
getsrtmlock2()
getlockterrainbmp2()

testtownarbres()
myxweb=xweb:myyweb=yweb:mydxweb=max(0.0001,dxweb):mydyweb=max(0.0001,dyweb)
Var lat0=lat,lng0=lng
mxytolatlng(myxweb,myyweb)
mylatweb=lat:mylngweb=lng
mxytolatlng(myxweb+mydxweb,myyweb+mydyweb)
mydlatweb=lat-mylatweb
mydlngweb=lng-mylngweb
lat=lat0:lng=lng0
myzmin=4000:myzmax=1
For i=-100 To 612
	For j=-100 To 612
		mapautotexture2(i,j)=mapautotexture(i,j)
		terrain22(i,j)=terrain(i,j)
	Next
Next
hsnow=1800+(worldy)*Cos(degtorad*360*dayjj/365)
hsnow=(hsnow+400-2*Abs(worldy))*scalez/10
	   'Var k8=6
      Var aux=(8/40)/(4*k8*512*scalex)  
testsea=0:testsea2=0
If testworld=1 Then  
 Var ix=256+(mx+dmx0)/scalex
 Var iy=256+(my+dmy0)/scaley
 For i=max2(-100,ix-50) To min2(612,ix+50)
	For j=max2(-100,iy-50) To min2(612,iy+50)
		'water(i,j)=0
		If terrain22(i,j)<-60.001 Then testsea2+=1
	Next
 Next
 If testsea2>100 Then testsea=1
 If testsea2>100*5 Then testsea2=1 Else testsea2=0 '100*10
Else
 testsea=1:testsea2=1
EndIf
'Var dxwebzoom2=dxwebzoom*0.9,dywebzoom2=dywebzoom*0.9
thrgb0=0:If plane=0 Or car>0 Or webzoom>=15 Then thrgb0=1
For j=-100 To 612
	hrgbi(j)=0
	For i=-100 To 612
		testhrgb(i,j)=0
	Next
Next
For i=-100 To 612
	hrgb0=0:hrgb1=0
	For j=-100 To 612
	  x=i-256:y=j-256
     xx=(x*scalex+dmx0)
     yy=(y*scalex+dmy0)
     If Abs(xx-xtown)<dxtown And Abs(yy-ytown)<dytown And (testworld=0 or topview>0) Then
     	mapautotext=towntext
     	setwebwater2(i,j,-99999999,0)
     'ElseIf Abs(xx-xwebzoom)<dxwebzoom2 And Abs(yy-ywebzoom)<dywebzoom2 And webtextzoom>0 And planet=0 Then
     '	mapautotext=webtextzoom
     '	'setwebwater2(i,j,xx,yy)
     '	setwebwater2(i,j,-99999999,0)
     ElseIf Abs(xx-xweb)<dxweb And Abs(yy-yweb)<dyweb And webtext>0 And planet=0 Then
     	mapautotext=webtext
     	setwebwater2(i,j,xx,yy)
     ElseIf webtext>0 And planet=0 Then
     	mapautotext=soltexture0
     	If testworld=1 Then setwebwater2(i,j,xx,yy)
     Else
	   mapautoix=535+worldx+(x*scalex+dmx0)*aux*535
	   mapautoiy=(276+worldy)-(y*scalex+dmy0)*aux*276*2
  		xx=mapautoix*750/535:yy=mapautoiy*(750/2)/276
  		Var pix00=Point(xx,yy,worldbmp)
  		/'Var pix10=Point(xx+1,yy,worldbmp)
  		Var pix01=Point(xx,yy+1,worldbmp)
  		Var pix11=Point(xx+1,yy+1,worldbmp)
      dx=xx-(Int(xx+10000)-10000)
      dy=yy-(Int(yy+10000)-10000)
      z00=pix00 Shr 16
      z10=pix10 Shr 16
      z01=pix01 Shr 16
      z11=pix11 Shr 16 
      If dx<=(1.0-dy) Then 
         r=( dx*(z10-z00) +dy*(z01-z00) +z00)
      Else 
         r=( (1-dx)*(z01-z11) +(1-dy)*(z10-z11) +z11 )
      EndIf 		
      z00=(pix00 Shr 8)And 255
      z10=(pix10 Shr 8)And 255
      z01=(pix01 Shr 8)And 255
      z11=(pix11 Shr 8)And 255
      If dx<=(1.0-dy) Then 
         g=( dx*(z10-z00) +dy*(z01-z00) +z00)
      Else 
         g=( (1-dx)*(z01-z11) +(1-dy)*(z10-z11) +z11 )
      EndIf '/ 		
		Var r=pix00 Shr 16
		Var g=(pix00 Shr 8)And 255
		'Var b=pix And 255
		If Not(r<35 And g<35)And planet=0 Then 'not water
			If (r>230 And g>230) Then 
			   mapautotext=maptexture5':i=5
	         mapautoiz=getterrainheight(x*scalex,y*scalex)
			   If mapautoiz>hsnow Then mapautotext=maptexture4 'snow
			ElseIf (r>180 And g>180) Then
				mapautotext=maptexture4':i=4
			ElseIf (r>130 And g>130) Then
				mapautotext=maptexture3':i=3
			ElseIf (r>90 And g>90) Then
				mapautotext=maptexture2':i=2
			Else 	
				mapautotext=maptexture':i=1
			EndIf 
		Else
			mapautotext=maptexture':i=1
		EndIf
	  EndIf 	
     mapautotexture2(i,j)=mapautotext
	Next j
Next i 	
Var d120=128.0 
'myzmin=99999:myzmax=-99999
For k=1 To 1'ismooth
For i=-100+1 To 612
	xx=terrain22(i,-100)
	For j=-100 To 612
		xxx=xx:xx=terrain22(i,j)
		yyy=terrain22(i-1,j)
		xx=min(yyy+d120,max(yyy-d120,xx))
		yy=min(xxx+d120,max(xxx-d120,xx))
		terrain22(i,j)=yy
		'If myzmin>yy Then myzmin+=(yy-myzmin)*0.1
		'If myzmax<yy Then myzmax+=(yy-myzmax)*0.1
	Next
Next
Next k
myzmax=max(myzmin+10,myzmax)
If testworld=1 Then 
 Dim As Integer di=2'3
 If myzmin<4 Then 
  Var dz=-myzmin-4/scalez
  For i=-100 To 612
 	 For j=-100 To 612
 		terrain22(i,j)+=dz
 	 Next
  Next
  myzmin+=dz
  myzmax+=dz
 EndIf  
 Var hwater0=max(-60+dhmareemax+0.1,myzmin)
 'Var hwater0=-60+dhmareemax+0.1
 'Var dhwater=max(0.0,myzmin-hwater0)
 waterz=hwater0*scalez+4
 For i=-100+di To 612-di
	For j=-100+di To 612-di
		If water(i,j)=1 Then
			n=0
			For k=i-di To i+di
				For l=j-di To j+di
					If water(k,l)<>1 Or topview>0 Then
   				   terrain22(k,l)=hwater0
						n+=1
						'If Abs(k-i)+Abs(l-j)<1 Then 
			         ' mapautotexture(k,l)=soltexture0
			         'EndIf  
					EndIf
				Next
			Next
			terrain22(i,j)=hwater0
			'If mapautotexture(i,j)<>webtextzoom Then
			  If n<=4 Then '16 Then
					mapautotexture2(i,j)=soltexture0
			  Else
				mapautotexture2(i,j)=webtext
			  EndIf 	
			'EndIf
		ElseIf myzmax>1256.5+hwater0 Then'356.5 
			If terrain22(i,j)>hwater0+1 Then
				terrain22(i,j)=hwater0+1+((1256.5*0.95+(myzmax-hwater0)*0.05)/(myzmax-hwater0))*(terrain22(i,j)-hwater0-1)
			Else 
				terrain22(i,j)=hwater0+1
			EndIf
		Else 
			terrain22(i,j)=max(hwater0+1,terrain22(i,j))
		EndIf
	Next
 Next
Else /'
	Var h0=-60+dhmareemax+0.12
	For i=-100 To 612
		For j=-100 To 612
			If terrain22(i,j)>h0 Then
				If mapautotexture2(i,j)<>towntext Then water(i,j)=0
			ElseIf mapautotexture2(i,j)=towntext Then 
				water(i,j)=1
				terrain22(i,j)=-61
			EndIf
		Next
	Next '/
EndIf 
Dim As uint map,map1,map2
For i=-100 To 612-1
	map=mapautotexture2(i,-100)
	For j=-100 To 612-1
		map1=map
		map=mapautotexture2(i,j)
		If map<>map1 Then
			If mapautotexture2(i,j+1)<>map Then
				map=map1
				mapautotexture2(i,j)=map
			EndIf
		EndIf		
	Next
Next 
For j=-100 To 612-1
	map=mapautotexture2(-100,j)
	For i=-100 To 612-1
		map1=map
		map=mapautotexture2(i,j)
		If map<>map1 Then
			If mapautotexture2(i+1,j)<>map Then
				map=map1
				mapautotexture2(i,j)=map
			EndIf
		EndIf		
	Next
Next
d120=32.0
For k=1 To 1'ismooth
For i=-100+1 To 612
	xx=terrain22(i,-100)
	For j=-100 To 612
		xxx=xx:xx=terrain22(i,j)
		yyy=terrain22(i-1,j)
		xx=min(yyy+d120,max(yyy-d120,xx))
		terrain22(i,j)=min(xxx+d120,max(xxx-d120,xx))
	Next
Next
Next k

setterrainroadwater()

freelockterrainbmp()
freesrtmlock()
freelockterrain()
End Sub
'Sub setmapautotextures()
'	If auxtest>0.1 Then guinotice "setmapautotextures()"
	'setmapautotextures1()
	'setmapautotextures2()
'End Sub
Sub drawhorizon(dx As Single)
gldisable(gl_texture_2d)
glpushmatrix
gltranslatef(mx,my,waterz0-(mz-mzsol0)*0.04-200)
If planet=0 Then 
	glcolor3f(0,0,0.5)
ElseIf addon(imap)="Moon" Then
	glcolor3f(0.5,0.5,0.5)
Else
	glcolor3f(0.5,0.25,0.1)
EndIf
gldisk(0.0,dx*scalex*1.41)
glpopmatrix
End Sub
dim shared as Single dhmaree,dhmaree0
Sub glvertex3fx(x As Single,y As Single,z as Single)
	glvertex3f(x,y,z)
	If Abs(x-mx)<2000 Then
		If Abs(y-my)<2000 Then
			If Abs(z-mzsol00)>1000 Then
				testweb=1
			EndIf
		EndIf
	EndIf
	Return 
	'glvertex3f(x,y,z)
	'Return 
   'scalex=500*kscalex/100
   Var xx=x-mx,yy=y-my
   Var d=max(Abs(xx),Abs(yy))
   Var sc=(d+20)/(d+kscalex)
 	glvertex3f(mx+xx*sc,my+yy*sc,z)
End Sub 
Dim Shared As Double timetestocean
Dim Shared As Integer mynwater
Sub drawterrain20
Dim As Single x,y,x0,y0
Dim As Single i,j,i1,dx=27,j1,dy,ii,jj,kwater1,d7000,dxy
Dim As Integer di,nwater,dxstep,dystep,kdx,dii
houlex=Int(time2*12) Mod 32 
houley=Int(time2*11) Mod 32 
'dx=27+min(57.0,Int((mz-mzsol0)*0.01*distscale))
dx=50+min(57.0,Int((mz-mzsol0)*0.01*distscale))
dx=Int(min(190.0,dx*max(1.0, distscale*3*narbre2/(narbre2+4*2*ntree))))
dx=Int(dx*100/kscalex)
'dx=Int(min(120.0,dx*max(1.0, distscale*3*narbre2/(narbre2+4*2*ntree))))
dxterrain=dx
If tcolorshadow Then
	dx=min(18.0,dx) 
	glcolor4f(0.6,0.6,0.6,0.6)
	gldisable gl_lighting
EndIf
x0=Int(mx/scalex+10000)-10000
y0=Int(my/scalex+10000)-10000
d7000=9000*scalex/500
'kwater1=kwater*scalex/500
If time2>timetestocean+3 And pause=0 Then'And mz<(waterz+altwater) And imap>=4 And pause=0 And planet=0 Then
 timetestocean=time2	
 nwater=0	
 dxwater=20'Int(20+max(0.0,(mz-waterz)*15/altwater))
 For x=max(-356.0,-dxwater+x0) To min(356.0-1,dxwater+x0)
	i=x+256+0.001
	while i<-100:i+=512+200:Wend 
	While i>612.2:i-=512+200:Wend
	For y=max(-356.0,-dxwater+y0) To min(356.0,dxwater+y0)
     j=y+256+0.001
	  While j<-100:j+=512+200:Wend 
	  While j>612.2:j-=512+200:Wend
	  If water(i,j)=1 Then
	  	'If terrain(i,j)<-60+dhmaree Then
	  	  nwater+=1
        'terrain(i,j)=terrain(i,j)*0.7+0.3*(-60.0001+kwater1*(houlez(i*16+houlex)+houlez(j*16-houley)))
      'EndIf   	  	
	  EndIf
	Next 
 Next
 nwater=nwater*100/(dxwater*dxwater)
 ''kwater=min(4.0,(nwater*nwater*nwater/(365*80000.0)))
 ''kwater=kwave*min(2.9,(nwater*220*220+nwater*nwater*nwater)/(370*80000.0))
 'kwater=kwave*min(2.9,(nwater*220*220+nwater*nwater*nwater)/(740*80000.0))
'Else 
' kwater=min(0.51,kwave)
' If mzsol0<=(waterz+mzh) Then nwater=400 Else nwater=0	
 If mz>(mzsol0+1700) Or planet=1 Then
	'If arcadesound=1 Then stopsoundarcade
	If oceansound=1 Then stopsoundocean:stopsoundocean2
 Else
 	mynwater=nwater
   If nwater>=168 Then'180 And kwater1>=0.5 Then
      'If Rnd<0.1 Then soundseagull()
	   If oceansound=0 Then soundocean
	   If mz<waterz+25 Then 
	   	soundocean2
	   Else
	   	stopsoundocean2
	   EndIf
   Else 
	   If oceansound=1 Then stopsoundocean:stopsoundocean2
   EndIf
   'If nwater<240 Then 
   '	If arcadesound=0 Then soundarcade
   'Else 
   '	If arcadesound=1 Then stopsoundarcade
   'EndIf
 EndIf   
EndIf 
If Abs(cos1)>Abs(sin1) Then 
 If cos1>0 Then
	dx=dx:dxstep=1
 Else
	dx=-dx:dxstep=-1
 EndIf
 dy=Abs(dx):dystep=1
 If mz>(mzsol0+10001) Then
   kdx=Int(2*(mz-mzsol0)/10000)
   x0=kdx*Int(x0/kdx):y0=kdx*Int(y0/kdx)
 	dxstep*=kdx:dystep*=kdx
 EndIf
 For x=max(-356.0,min(355.9-Abs(dxstep),-dx+x0)) To max(-356.0,min(355.9-Abs(dxstep),dx+x0)) Step dxstep
	i=x+256+0.1
	while i<-100:i+=512+200:Wend 
	While i>612.2:i-=512+200:Wend
 	i1=i+abs(dxstep):If i1>612.2 Then i1=612.1'-=512+200
	di=4 
	If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 Then 
       j=y0+256+0.1
	    While j<-100:j+=512+200:Wend 
	    While j>612.2:j-=512+200:Wend 
       mapautotext=mapautotexture(i,max2(-100,j-1))
       If mapautotext<>mapautotext0 Then
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 	  
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf 
     	  texscale=800/scalex
       EndIf 
      EndIf
	ElseIf mapauto=1 Or (webtext>0 And planet=0) Then
		'setmapautotext(x,y0)
      j=y0+256+0.1
	   'While j<-100:j+=512+200:Wend 
	   'While j>612.2:j-=512+200:Wend 
      If j<-100 Then j=-100
      If j>612 Then j=612
      mapautotext=mapautotexture(i,max2(-100,j-1))
      If mapautotext<>mapautotext0 Then
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
  	     texscale=16000/scalex
      EndIf 
	EndIf
	ii=i:jj=-9999:dii=0
   glBegin (GL_TRIANGLE_STRIP)	
	For y=max(-356.0,-dy+y0) To min(356.0,dy+y0)
     j=y+256+0.1
	  'While j<-100:j+=512+200:Wend 
	  'While j>612.2:j-=512+200:Wend
     If j<-100 Then j=-100
     If j>612 Then j=612
	  hsnowij=scalez*terrain(i,j)
	  If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 And dii>1 Then 
       mapautotext=mapautotexture(i,max2(-100,j-1))
       If mapautotext<>mapautotext0 Then
	     glend()
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
  	     texscale=800/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then
        	testwater=water(ii,jj) 'or water(ii,jj+1) 'or water(ii,jj-1)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3fx((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var iii=ii+Abs(dxstep)
         testwater=water(iii,jj) 'or water(iii,jj+1) 'or water(iii,jj-1)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii+Abs(dxstep),jj)))
         myglTexCoord2f((ii+Abs(dxstep))/texscale,jj/texscale)
 	      glvertex3fx((ii-256.1+Abs(dxstep))*scalex,(jj-256.1)*scalex,scalez*terrain(ii+abs(dxstep),jj))
        EndIf 
       EndIf 
      EndIf
	  ElseIf mapauto=1 And dii>1 Or(webtext>0 And planet=0) Then   
      mapautotext=mapautotexture(i,max2(-100,j-1))
      If mapautotext<>mapautotext0 Then
	     glend()
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
     	  texscale=16000/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then
        	testwater=water(ii,jj) 'or water(ii,jj+1) 'or water(ii,jj-1)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3fx((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var iii=ii+Abs(dxstep)
         testwater=water(iii,jj) 'or water(iii,jj+1) 'or water(iii,jj-1)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii+abs(dxstep),jj)))
         myglTexCoord2f((ii+abs(dxstep))/texscale,jj/texscale)
 	      glvertex3fx((ii-256.1+abs(dxstep))*scalex,(jj-256.1)*scalex,scalez*terrain(ii+abs(dxstep),jj))
        EndIf 
      EndIf 
     EndIf
     jj=j:dii+=1
     testwater=water(i,j) 'or water(i,j+1) 'or water(i,j-1)
     myglcolor3fv(Cast(glfloat Ptr,@terraincolor(i,j)))
     myglTexCoord2f(i/texscale,j/texscale)
 	  glvertex3fx((x)*scalex,y*scalex,scalez*terrain(i,j))
 	  testwater=water(i1,j) 'or water(i1,j+1) 'or water(i1,j-1)
     myglcolor3fv(cast(glfloat Ptr,@terraincolor(i1,j)))
     myglTexCoord2f((i1)/texscale,j/texscale)
 	  glvertex3fx((x+abs(dxstep))*scalex,y*scalex,scalez*terrain(i1,j))
 	  di+=1
 	  If di>=4 Then 
 	  	di=0
      rotavion(x*scalex-mx,y*scalex-my,scalez*terrain(i,j)-mz)
      If x2<(0.85*max(Abs(y2),Abs(z2))-d7000) Then y+=8*Abs(dxstep):di=4
 	  EndIf
	Next
	glend()
 Next
Else 
 dx=Abs(dx):dxstep=1
 If sin1>0 Then
	dy=dx:dystep=1
 Else
	dy=-dx:dystep=-1
 EndIf
 If mz>(mzsol0+10001) Then
   kdx=Int(2*(mz-mzsol0)/10000)
   x0=kdx*Int(x0/kdx):y0=kdx*Int(y0/kdx)
 	dxstep*=kdx:dystep*=kdx
 EndIf
 For y=max(-356.0,min(355.9-abs(dxstep),-dy+y0)) To max(-356.0,min(355.9-abs(dxstep),dy+y0)) Step dystep
	j=y+256+0.1
	'while j<-100:j+=512+200:Wend 
	'While j>612.2:j-=512+200:Wend
   If j<-100 Then j=-100
   If j>612 Then j=612
 	j1=j+abs(dystep):If j1>612.2 Then j1=612.1'-=512+200
	di=4 
	If mz<(mzsol0+80)And webtext=0 Then
      If solauto=1 And mapauto=1 Then 
       i=x0+256+0.1
	    'While i<-100:i+=512+200:Wend 
	    'While i>612.2:i-=512+200:Wend 
       If i<-100 Then i=-100
       If i>612 Then i=612
       mapautotext=mapautotexture(max2(-100,i-1),j)
       If mapautotext<>mapautotext0 Then
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=800/scalex
       EndIf 
      EndIf
	ElseIf mapauto=1 Then
		'setmapautotext(x0,y)
      i=x0+256+0.1
	   'While i<-100:i+=512+200:Wend 
	   'While i>612.2:i-=512+200:Wend 
      If i<-100 Then i=-100
      If i>612 Then i=612
      mapautotext=mapautotexture(max2(-100,i-1),j)
      If mapautotext<>mapautotext0 Then
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=16000/scalex
      EndIf 
	EndIf
	ii=-9999:jj=j:dii=0
   glBegin (GL_TRIANGLE_STRIP)	
	For x=max(-356.0,-dx+x0) To min(356.0,dx+x0)
     i=x+256+0.1
	  'While i<-100:i+=512+200:Wend 
	  'While i>612.2:i-=512+200:Wend 
     If i<-100 Then i=-100
     If i>612 Then i=612
	  hsnowij=scalez*terrain(i,j)
	  If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 And dii>1 Then 
       mapautotext=mapautotexture(max2(-100,i-1),j)
       If mapautotext<>mapautotext0 Then
        glend()	
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=800/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then 
        	testwater=water(ii,jj) 'Or water(ii+1,jj) Or water(ii-1,jj)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3fx((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var jjj=jj+Abs(dystep)
         testwater=water(ii,jjj) 'or water(ii+1,jjj) 'or water(ii-1,jjj)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii,jj+abs(dystep))))
         myglTexCoord2f((ii)/texscale,(jj+abs(dystep))/texscale)
 	      glvertex3fx((ii-256.1)*scalex,(jj-256.1+abs(dystep))*scalex,scalez*terrain(ii,jj+abs(dystep)))
        EndIf 
       EndIf 
      EndIf
	  ElseIf mapauto=1 And dii>1 Then
      mapautotext=mapautotexture(max2(-100,i-1),j)
      If mapautotext<>mapautotext0 Then
	     glend()
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=16000/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then 
        	testwater=water(ii,jj) 'or water(ii+1,jj) 'or water(ii-1,jj)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3fx((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var jjj=jj+Abs(dystep)
         testwater=water(ii,jjj) 'or water(ii+1,jjj) 'or water(ii-1,jjj)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii,jj+abs(dystep))))
         myglTexCoord2f((ii)/texscale,(jj+abs(dystep))/texscale)
 	      glvertex3fx((ii-256.1)*scalex,(jj-256.1+abs(dystep))*scalex,scalez*terrain(ii,jj+abs(dystep)))
        EndIf 
      EndIf 
     EndIf
     ii=i:dii+=1
     testwater=water(i,j) 'or water(i+1,j) 'or water(i-1,j)
     myglcolor3fv(Cast(glfloat Ptr,@terraincolor(i,j)))
     myglTexCoord2f(i/texscale,j/texscale)
 	  glvertex3fx((x)*scalex,y*scalex,scalez*terrain(i,j))
 	  testwater=water(i,j1) 'or water(i+1,j1) 'or water(i-1,j1)
     myglcolor3fv(cast(glfloat Ptr,@terraincolor(i,j1)))
     myglTexCoord2f((i)/texscale,(j1)/texscale)
 	  glvertex3fx((x)*scalex,(y+abs(dystep))*scalex,scalez*terrain(i,j1))
 	  di+=1
 	  If di>=4 Then 
 	  	di=0
      rotavion(x*scalex-mx,y*scalex-my,scalez*terrain(i,j)-mz)
      If x2<(0.85*max(Abs(y2),Abs(z2))-d7000) Then x+=8*Abs(dxstep):di=4
 	  EndIf
	Next
	glend()
 Next
EndIf
End Sub
Sub drawterrain200
Dim As Single x,y,x0,y0
Dim As Single i,j,i1,dx=27,j1,dy,ii,jj,kwater1,d7000,dxy
Dim As Integer di,nwater,dxstep,dystep,kdx,dii
houlex=Int(time2*12) Mod 32 
houley=Int(time2*11) Mod 32 
'dx=27+min(57.0,Int((mz-mzsol0)*0.01*distscale))
dx=50+min(57.0,Int((mz-mzsol0)*0.01*distscale))
dx=Int(min(190.0,dx*max(1.0, distscale*3*narbre2/(narbre2+4*2*ntree))))
dx=Int(dx*100/kscalex)
'dx=Int(min(120.0,dx*max(1.0, distscale*3*narbre2/(narbre2+4*2*ntree))))
dxterrain=dx
x0=Int(mx/scalex+10000)-10000
y0=Int(my/scalex+10000)-10000
d7000=9000*scalex/500
kwater1=kwater*scalex/500
/'If mz<(waterz+altwater) And imap>=4 And pause=0 And planet=0 Then
 nwater=0	
 dxwater=Int(20+max(0.0,(mz-waterz)*15/altwater))
 For x=max(-356.0,-dxwater+x0) To min(356.0-1,dxwater+x0)
	i=x+256+0.001
	while i<-100:i+=512+200:Wend 
	While i>612.2:i-=512+200:Wend
	For y=max(-356.0,-dxwater+y0) To min(356.0,dxwater+y0)
     j=y+256+0.001
	  While j<-100:j+=512+200:Wend 
	  While j>612.2:j-=512+200:Wend
	  If water(i,j)=1 Then
	  	If terrain(i,j)<-60+dhmaree Then
	  	  nwater+=1
        terrain(i,j)=terrain(i,j)*0.7+0.3*(-60.0001+kwater1*(houlez(i*16+houlex)+houlez(j*16-houley)))
      EndIf   	  	
	  EndIf
	Next 
 Next
 nwater=nwater*100/(dxwater*dxwater)
 ''kwater=min(4.0,(nwater*nwater*nwater/(365*80000.0)))
 'kwater=kwave*min(2.9,(nwater*220*220+nwater*nwater*nwater)/(370*80000.0))
 kwater=kwave*min(2.9,(nwater*220*220+nwater*nwater*nwater)/(740*80000.0))
Else 
 kwater=min(0.51,kwave)
 If mzsol0<=(waterz+mzh) Then nwater=400 Else nwater=0	
EndIf
If mz>(mzsol0+1700) Or planet=1 Then
	If arcadesound=1 Then stopsoundarcade
	If oceansound=1 Then stopsoundocean
Else 
   If nwater>220 And kwater1>=0.5 Then
	   If oceansound=0 Then soundocean
   Else 
	   If oceansound=1 Then stopsoundocean
   EndIf
   If nwater<240 Then 
   	If arcadesound=0 Then soundarcade
   Else 
   	If arcadesound=1 Then stopsoundarcade
   EndIf
EndIf '/
If Abs(cos1)>Abs(sin1) Then 
 If cos1>0 Then
	dx=dx:dxstep=1
 Else
	dx=-dx:dxstep=-1
 EndIf
 dy=Abs(dx):dystep=1
 If mz>(mzsol0+10001) Then
   kdx=Int(2*(mz-mzsol0)/10000)
   x0=kdx*Int(x0/kdx):y0=kdx*Int(y0/kdx)
 	dxstep*=kdx:dystep*=kdx
 EndIf
 For x=max(-356.0,min(355.9-Abs(dxstep),-dx+x0)) To max(-356.0,min(355.9-Abs(dxstep),dx+x0)) Step dxstep
	i=x+256+0.1
	while i<-100:i+=512+200:Wend 
	While i>612.2:i-=512+200:Wend
 	i1=i+abs(dxstep):If i1>612.2 Then i1=612.1'-=512+200
	di=4 
	If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 Then 
       j=y0+256+0.1
	    While j<-100:j+=512+200:Wend 
	    While j>612.2:j-=512+200:Wend 
       mapautotext=mapautotexture(i,max2(-100,j-1))
       If mapautotext<>mapautotext0 Then
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 	  
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf 
     	  texscale=800/scalex
       EndIf 
      EndIf
	ElseIf mapauto=1 Or (webtext>0 And planet=0) Then
		'setmapautotext(x,y0)
      j=y0+256+0.1
	   'While j<-100:j+=512+200:Wend 
	   'While j>612.2:j-=512+200:Wend 
      If j<-100 Then j=-100
      If j>612 Then j=612
      mapautotext=mapautotexture(i,max2(-100,j-1))
      If mapautotext<>mapautotext0 Then
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
  	     texscale=16000/scalex
      EndIf 
	EndIf
	ii=i:jj=-9999:dii=0
   glBegin (GL_TRIANGLE_STRIP)	
	For y=max(-356.0,-dy+y0) To min(356.0,dy+y0)
     j=y+256+0.1
	  'While j<-100:j+=512+200:Wend 
	  'While j>612.2:j-=512+200:Wend
     If j<-100 Then j=-100
     If j>612 Then j=612
	  hsnowij=scalez*terrain(i,j)
	  If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 And dii>1 Then 
       mapautotext=mapautotexture(i,max2(-100,j-1))
       If mapautotext<>mapautotext0 Then
	     glend()
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
  	     texscale=800/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then
        	testwater=water(ii,jj) 'or water(ii,jj+1) 'or water(ii,jj-1)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var iii=ii+Abs(dxstep)
         testwater=water(iii,jj) 'or water(iii,jj+1) 'or water(iii,jj-1)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii+Abs(dxstep),jj)))
         myglTexCoord2f((ii+Abs(dxstep))/texscale,jj/texscale)
 	      glvertex3f((ii-256.1+Abs(dxstep))*scalex,(jj-256.1)*scalex,scalez*terrain(ii+abs(dxstep),jj))
        EndIf 
       EndIf 
      EndIf
	  ElseIf mapauto=1 And dii>1 Or(webtext>0 And planet=0) Then   
      mapautotext=mapautotexture(i,max2(-100,j-1))
      If mapautotext<>mapautotext0 Then
	     glend()
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
     	  texscale=16000/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then
        	testwater=water(ii,jj) 'or water(ii,jj+1) 'or water(ii,jj-1)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var iii=ii+Abs(dxstep)
         testwater=water(iii,jj) 'or water(iii,jj+1) 'or water(iii,jj-1)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii+abs(dxstep),jj)))
         myglTexCoord2f((ii+abs(dxstep))/texscale,jj/texscale)
 	      glvertex3f((ii-256.1+abs(dxstep))*scalex,(jj-256.1)*scalex,scalez*terrain(ii+abs(dxstep),jj))
        EndIf 
      EndIf 
     EndIf
     jj=j:dii+=1
     testwater=water(i,j) 'or water(i,j+1) 'or water(i,j-1)
     myglcolor3fv(Cast(glfloat Ptr,@terraincolor(i,j)))
     myglTexCoord2f(i/texscale,j/texscale)
 	  glvertex3f((x)*scalex,y*scalex,scalez*terrain(i,j))
 	  testwater=water(i1,j) 'or water(i1,j+1) 'or water(i1,j-1)
     myglcolor3fv(cast(glfloat Ptr,@terraincolor(i1,j)))
     myglTexCoord2f((i1)/texscale,j/texscale)
 	  glvertex3f((x+abs(dxstep))*scalex,y*scalex,scalez*terrain(i1,j))
 	  di+=1
 	  If di>=4 Then 
 	  	di=0
      rotavion(x*scalex-mx,y*scalex-my,scalez*terrain(i,j)-mz)
      If x2<(0.85*max(Abs(y2),Abs(z2))-d7000) Then y+=8*Abs(dxstep):di=4
 	  EndIf
	Next
	glend()
 Next
Else 
 dx=Abs(dx):dxstep=1
 If sin1>0 Then
	dy=dx:dystep=1
 Else
	dy=-dx:dystep=-1
 EndIf
 If mz>(mzsol0+10001) Then
   kdx=Int(2*(mz-mzsol0)/10000)
   x0=kdx*Int(x0/kdx):y0=kdx*Int(y0/kdx)
 	dxstep*=kdx:dystep*=kdx
 EndIf
 For y=max(-356.0,min(355.9-abs(dxstep),-dy+y0)) To max(-356.0,min(355.9-abs(dxstep),dy+y0)) Step dystep
	j=y+256+0.1
	'while j<-100:j+=512+200:Wend 
	'While j>612.2:j-=512+200:Wend
   If j<-100 Then j=-100
   If j>612 Then j=612
 	j1=j+abs(dystep):If j1>612.2 Then j1=612.1'-=512+200
	di=4 
	If mz<(mzsol0+80)And webtext=0 Then
      If solauto=1 And mapauto=1 Then 
       i=x0+256+0.1
	    'While i<-100:i+=512+200:Wend 
	    'While i>612.2:i-=512+200:Wend 
       If i<-100 Then i=-100
       If i>612 Then i=612
       mapautotext=mapautotexture(max2(-100,i-1),j)
       If mapautotext<>mapautotext0 Then
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=800/scalex
       EndIf 
      EndIf
	ElseIf mapauto=1 Then
		'setmapautotext(x0,y)
      i=x0+256+0.1
	   'While i<-100:i+=512+200:Wend 
	   'While i>612.2:i-=512+200:Wend 
      If i<-100 Then i=-100
      If i>612 Then i=612
      mapautotext=mapautotexture(max2(-100,i-1),j)
      If mapautotext<>mapautotext0 Then
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=16000/scalex
      EndIf 
	EndIf
	ii=-9999:jj=j:dii=0
   glBegin (GL_TRIANGLE_STRIP)	
	For x=max(-356.0,-dx+x0) To min(356.0,dx+x0)
     i=x+256+0.1
	  'While i<-100:i+=512+200:Wend 
	  'While i>612.2:i-=512+200:Wend 
     If i<-100 Then i=-100
     If i>612 Then i=612
	  hsnowij=scalez*terrain(i,j)
	  If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 And dii>1 Then 
       mapautotext=mapautotexture(max2(-100,i-1),j)
       If mapautotext<>mapautotext0 Then
        glend()	
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=800/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then 
        	testwater=water(ii,jj) 'Or water(ii+1,jj) Or water(ii-1,jj)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var jjj=jj+Abs(dystep)
         testwater=water(ii,jjj) 'or water(ii+1,jjj) 'or water(ii-1,jjj)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii,jj+abs(dystep))))
         myglTexCoord2f((ii)/texscale,(jj+abs(dystep))/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1+abs(dystep))*scalex,scalez*terrain(ii,jj+abs(dystep)))
        EndIf 
       EndIf 
      EndIf
	  ElseIf mapauto=1 And dii>1 Then
      mapautotext=mapautotexture(max2(-100,i-1),j)
      If mapautotext<>mapautotext0 Then
	     glend()
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=16000/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then 
        	testwater=water(ii,jj) 'or water(ii+1,jj) 'or water(ii-1,jj)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var jjj=jj+Abs(dystep)
         testwater=water(ii,jjj) 'or water(ii+1,jjj) 'or water(ii-1,jjj)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii,jj+abs(dystep))))
         myglTexCoord2f((ii)/texscale,(jj+abs(dystep))/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1+abs(dystep))*scalex,scalez*terrain(ii,jj+abs(dystep)))
        EndIf 
      EndIf 
     EndIf
     ii=i:dii+=1
     testwater=water(i,j) 'or water(i+1,j) 'or water(i-1,j)
     myglcolor3fv(Cast(glfloat Ptr,@terraincolor(i,j)))
     myglTexCoord2f(i/texscale,j/texscale)
 	  glvertex3f((x)*scalex,y*scalex,scalez*terrain(i,j))
 	  testwater=water(i,j1) 'or water(i+1,j1) 'or water(i-1,j1)
     myglcolor3fv(cast(glfloat Ptr,@terraincolor(i,j1)))
     myglTexCoord2f((i)/texscale,(j1)/texscale)
 	  glvertex3f((x)*scalex,(y+abs(dystep))*scalex,scalez*terrain(i,j1))
 	  di+=1
 	  If di>=4 Then 
 	  	di=0
      rotavion(x*scalex-mx,y*scalex-my,scalez*terrain(i,j)-mz)
      If x2<(0.85*max(Abs(y2),Abs(z2))-d7000) Then x+=8*Abs(dxstep):di=4
 	  EndIf
	Next
	glend()
 Next
EndIf
End Sub
Dim Shared As Single latmap=-179.5,lngmap=0,mxmap,mymap
Sub drawterrain2 
If testworld=0 Or plane=0 Or car>0 Or mz<(mzsol0+400) Then drawterrain20:Exit sub
Dim As Single x,y,x0,y0
Dim As Single i,j,i1,dx=27,j1,dy,ii,jj,kwater1,d7000,dxy
Dim As Integer di,nwater,dxstep,dystep,kdx,dii
'houlex=Int(time2*12) Mod 32 
'houley=Int(time2*11) Mod 32 
'dx=27+min(57.0,Int((mz-mzsol0)*0.01*distscale))
dx=50+min(57.0,Int((mz-mzsol0)*0.01*distscale))
dx=Int(min(190.0,dx*max(1.0, distscale*3*narbre2/(narbre2+4*2*ntree))))
dx=Int(dx*100/kscalex)
'dx=Int(min(120.0,dx*max(1.0, distscale*3*narbre2/(narbre2+4*2*ntree))))
dxterrain=dx
If tcolorshadow Then
	dx=min(18.0,dx)
   glcolor4f(0.6,0.6,0.6,0.6)
	gldisable gl_lighting
EndIf
x0=Int(mx/scalex+10000)-10000
y0=Int(my/scalex+10000)-10000
'x0=mxmap/scalex
'y0=mymap/scalex
d7000=9000*scalex/500
'kwater1=kwater*scalex/500
If time2>timetestocean+3 And pause=0 Then'And mz<(waterz+altwater) And imap>=4 And pause=0 And planet=0 Then
 timetestocean=time2
 nwater=0	
 dxwater=20'Int(20+max(0.0,(mz-waterz)*15/altwater))
 For x=max(-356.0,-dxwater+x0) To min(356.0-1,dxwater+x0)
	i=x+256+0.001
	while i<-100:i+=512+200:Wend 
	While i>612.2:i-=512+200:Wend
	For y=max(-356.0,-dxwater+y0) To min(356.0,dxwater+y0)
     j=y+256+0.001
	  While j<-100:j+=512+200:Wend 
	  While j>612.2:j-=512+200:Wend
	  If water(i,j)=1 Then
	  	'If terrain(i,j)<-60+dhmaree Then
	  	  nwater+=1
      '  terrain(i,j)=terrain(i,j)*0.7+0.3*(-60.0001+kwater1*(houlez(i*16+houlex)+houlez(j*16-houley)))
      'EndIf   	  	
	  EndIf
	Next 
 Next
 nwater=nwater*100/(dxwater*dxwater)
 ''kwater=min(4.0,(nwater*nwater*nwater/(365*80000.0)))
 ''kwater=kwave*min(2.9,(nwater*220*220+nwater*nwater*nwater)/(370*80000.0))
 'kwater=kwave*min(2.9,(nwater*220*220+nwater*nwater*nwater)/(740*80000.0))
'Else 
' kwater=min(0.51,kwave)
' If mzsol0<=(waterz+mzh) Then nwater=400 Else nwater=0	
 If mz>(mzsol0+1700) Or planet=1 Then
	'If arcadesound=1 Then stopsoundarcade
	If oceansound=1 Then stopsoundocean:stopsoundocean2
 Else
 	mynwater=nwater
   If nwater>=180 Then'And kwater1>=0.5 Then
	   If oceansound=0 Then soundocean:stopsoundocean2
   Else 
	   If oceansound=1 Then stopsoundocean:stopsoundocean2
   EndIf
   'If nwater<240 Then 
   '	If arcadesound=0 Then soundarcade
   'Else 
   '	If arcadesound=1 Then stopsoundarcade
   'EndIf
 EndIf 
EndIf 
If Abs(cos1)>Abs(sin1) Then 
 If cos1>0 Then
	dx=dx:dxstep=1
 Else
	dx=-dx:dxstep=-1
 EndIf
 dy=Abs(dx):dystep=1
 If mz>(mzsol0+10001) Then
   kdx=Int(2*(mz-mzsol0)/10000)
   x0=kdx*Int(x0/kdx):y0=kdx*Int(y0/kdx)
 	dxstep*=kdx:dystep*=kdx
 EndIf
 For x=max(-356.0,min(355.9-Abs(dxstep),-dx+x0)) To max(-356.0,min(355.9-Abs(dxstep),dx+x0)) Step dxstep
	i=x+256+0.001
	while i<-100:i+=512+200:Wend 
	While i>612.2:i-=512+200:Wend
 	i1=i+abs(dxstep):If i1>612.2 Then i1=612.1'-=512+200
	di=4 
	If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 Then 
       j=y0+256+0.001
	    While j<-100:j+=512+200:Wend 
	    While j>612.2:j-=512+200:Wend 
       mapautotext=mapautotexture(i,max2(-100,j-1))
       If mapautotext<>mapautotext0 Then
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 	  
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf 
     	  texscale=800/scalex
       EndIf 
      EndIf
	ElseIf mapauto=1 Or (webtext>0 And planet=0) Then
		'setmapautotext(x,y0)
      j=y0+256+0.001
	   'While j<-100:j+=512+200:Wend 
	   'While j>612.2:j-=512+200:Wend 
      If j<-100 Then j=-100
      If j>612 Then j=612
      mapautotext=mapautotexture(i,max2(-100,j-1))
      If mapautotext<>mapautotext0 Then
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
  	     texscale=16000/scalex
      EndIf 
	EndIf
	ii=i:jj=-9999:dii=0
   glBegin (GL_TRIANGLE_STRIP)	
	For y=max(-356.0,-dy+y0) To min(356.0,dy+y0)
     j=y+256+0.001
	  'While j<-100:j+=512+200:Wend 
	  'While j>612.2:j-=512+200:Wend
     If j<-100 Then j=-100
     If j>612 Then j=612
	  hsnowij=scalez*terrain(i,j)
	  If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 And dii>1 Then 
       mapautotext=mapautotexture(i,max2(-100,j-1))
       If mapautotext<>mapautotext0 Then
	     glend()
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
  	     texscale=800/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then
        	testwater=water(ii,jj) Or water(ii,jj+1) Or water(ii,jj-1)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var iii=ii+Abs(dxstep)
         testwater=water(iii,jj) Or water(iii,jj+1) Or water(iii,jj-1)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii+Abs(dxstep),jj)))
         myglTexCoord2f((ii+Abs(dxstep))/texscale,jj/texscale)
 	      glvertex3f((ii-256.1+Abs(dxstep))*scalex,(jj-256.1)*scalex,scalez*terrain(ii+abs(dxstep),jj))
        EndIf 
       EndIf 
      EndIf
	  ElseIf mapauto=1 And dii>1 Or(webtext>0 And planet=0) Then   
      mapautotext=mapautotexture(i,max2(-100,j-1))
      If mapautotext<>mapautotext0 Then
	     glend()
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
     	  texscale=16000/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then
        	testwater=water(ii,jj) Or water(ii,jj+1) Or water(ii,jj-1)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var iii=ii+Abs(dxstep)
         testwater=water(iii,jj) Or water(iii,jj+1) Or water(iii,jj-1)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii+abs(dxstep),jj)))
         myglTexCoord2f((ii+abs(dxstep))/texscale,jj/texscale)
 	      glvertex3f((ii-256.1+abs(dxstep))*scalex,(jj-256.1)*scalex,scalez*terrain(ii+abs(dxstep),jj))
        EndIf 
      EndIf 
     EndIf
     jj=j:dii+=1
     testwater=water(i,j) Or water(i,j+1) Or water(i,j-1)
     myglcolor3fv(Cast(glfloat Ptr,@terraincolor(i,j)))
     myglTexCoord2f(i/texscale,j/texscale)
 	  glvertex3f((x)*scalex,y*scalex,scalez*terrain(i,j))
 	  testwater=water(i1,j) Or water(i1,j+1) Or water(i1,j-1)
     myglcolor3fv(cast(glfloat Ptr,@terraincolor(i1,j)))
     myglTexCoord2f((i1)/texscale,j/texscale)
 	  glvertex3f((x+abs(dxstep))*scalex,y*scalex,scalez*terrain(i1,j))
 	  di+=1
 	  If di>=4 Then 
 	  	di=0
      rotavion(x*scalex-mx,y*scalex-my,scalez*terrain(i,j)-mz)
      If x2<(0.85*max(Abs(y2),Abs(z2))-d7000) Then y+=8*Abs(dxstep):di=4
 	  EndIf
	Next
	glend()
 Next
Else 
 dx=Abs(dx):dxstep=1
 If sin1>0 Then
	dy=dx:dystep=1
 Else
	dy=-dx:dystep=-1
 EndIf
 If mz>(mzsol0+10001) Then
   kdx=Int(2*(mz-mzsol0)/10000)
   x0=kdx*Int(x0/kdx):y0=kdx*Int(y0/kdx)
 	dxstep*=kdx:dystep*=kdx
 EndIf
 For y=max(-356.0,min(355.9-abs(dxstep),-dy+y0)) To max(-356.0,min(355.9-abs(dxstep),dy+y0)) Step dystep
	j=y+256+0.001
	'while j<-100:j+=512+200:Wend 
	'While j>612.2:j-=512+200:Wend
   If j<-100 Then j=-100
   If j>612 Then j=612
 	j1=j+abs(dystep):If j1>612.2 Then j1=612.1'-=512+200
	di=4 
	If mz<(mzsol0+80)And webtext=0 Then
      If solauto=1 And mapauto=1 Then 
       i=x0+256+0.001
	    'While i<-100:i+=512+200:Wend 
	    'While i>612.2:i-=512+200:Wend 
       If i<-100 Then i=-100
       If i>612 Then i=612
       mapautotext=mapautotexture(max2(-100,i-1),j)
       If mapautotext<>mapautotext0 Then
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=800/scalex
       EndIf 
      EndIf
	ElseIf mapauto=1 Then
		'setmapautotext(x0,y)
      i=x0+256+0.001
	   'While i<-100:i+=512+200:Wend 
	   'While i>612.2:i-=512+200:Wend 
      If i<-100 Then i=-100
      If i>612 Then i=612
      mapautotext=mapautotexture(max2(-100,i-1),j)
      If mapautotext<>mapautotext0 Then
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=16000/scalex
      EndIf 
	EndIf
	ii=-9999:jj=j:dii=0
   glBegin (GL_TRIANGLE_STRIP)	
	For x=max(-356.0,-dx+x0) To min(356.0,dx+x0)
     i=x+256+0.001
	  'While i<-100:i+=512+200:Wend 
	  'While i>612.2:i-=512+200:Wend 
     If i<-100 Then i=-100
     If i>612 Then i=612
	  hsnowij=scalez*terrain(i,j)
	  If mz<(mzsol0+80) And webtext=0 Then
      If solauto=1 And mapauto=1 And dii>1 Then 
       mapautotext=mapautotexture(max2(-100,i-1),j)
       If mapautotext<>mapautotext0 Then
        glend()	
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=800/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then 
        	testwater=water(ii,jj) Or water(ii+1,jj) Or water(ii-1,jj)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var jjj=jj+Abs(dystep)
         testwater=water(ii,jjj) Or water(ii+1,jjj) Or water(ii-1,jjj)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii,jj+abs(dystep))))
         myglTexCoord2f((ii)/texscale,(jj+abs(dystep))/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1+abs(dystep))*scalex,scalez*terrain(ii,jj+abs(dystep)))
        EndIf 
       EndIf 
      EndIf
	  ElseIf mapauto=1 And dii>1 Then
      mapautotext=mapautotexture(max2(-100,i-1),j)
      If mapautotext<>mapautotext0 Then
	     glend()
  	     webglbindtexture(gl_texture_2d,mapautotext)
  	     mapautotext0=mapautotext
  	     If mapautotext=towntext Then 
  	     	  webglbindtexture(gl_texture_2d,towntext)
  	     EndIf
     	  texscale=16000/scalex
        glBegin (GL_TRIANGLE_STRIP)	
        If ii>-999 And jj>-999 Then 
        	testwater=water(ii,jj) Or water(ii+1,jj) Or water(ii-1,jj)
         myglcolor3fv(Cast(glfloat Ptr,@terraincolor(ii,jj)))
         myglTexCoord2f(ii/texscale,jj/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
         Var jjj=jj+Abs(dystep)
         testwater=water(ii,jjj) Or water(ii+1,jjj) Or water(ii-1,jjj)
         myglcolor3fv(cast(glfloat Ptr,@terraincolor(ii,jj+abs(dystep))))
         myglTexCoord2f((ii)/texscale,(jj+abs(dystep))/texscale)
 	      glvertex3f((ii-256.1)*scalex,(jj-256.1+abs(dystep))*scalex,scalez*terrain(ii,jj+abs(dystep)))
        EndIf 
      EndIf 
     EndIf
     ii=i:dii+=1
     testwater=water(i,j) Or water(i+1,j) Or water(i-1,j)
     myglcolor3fv(Cast(glfloat Ptr,@terraincolor(i,j)))
     myglTexCoord2f(i/texscale,j/texscale)
 	  glvertex3f((x)*scalex,y*scalex,scalez*terrain(i,j))
 	  testwater=water(i,j1) Or water(i+1,j1) Or water(i-1,j1)
     myglcolor3fv(cast(glfloat Ptr,@terraincolor(i,j1)))
     myglTexCoord2f((i)/texscale,(j1)/texscale)
 	  glvertex3f((x)*scalex,(y+abs(dystep))*scalex,scalez*terrain(i,j1))
 	  di+=1
 	  If di>=4 Then 
 	  	di=0
      rotavion(x*scalex-mx,y*scalex-my,scalez*terrain(i,j)-mz)
      If x2<(0.85*max(Abs(y2),Abs(z2))-d7000) Then x+=8*Abs(dxstep):di=4
 	  EndIf
	Next
	glend()
 Next
EndIf
End Sub
Dim Shared As Single planetdxmax=1,planetdymax=1
Sub drawsphere()
Dim As Single r=1000000'1400000
glenable(gl_texture_2d)
gldisable(gl_lighting)
glbindtexture(gl_texture_2d,worldtext)
glcolor3f(1,1,1)
glpushmatrix
gltranslatef(mx,my,-r-3500)'5000
If planet=0 Then 
 'Var k8=6
 Var aux=(8/40)/(4*k8*512*scalex)  
 mapautoix=535+worldx+(mx+dmx0)*aux*535
 mapautoiy=276+worldy-(my+dmy0)*aux*276*2*scalex/scaley
 'glrotatef(-45,0,1,0)
 glrotatef(-90*(mapautoiy)/276,1,0,0)
 'glrotatef(-35,0,0,1)
 glrotatef(-180*(mapautoix-535)/535,0,0,1)
Else
 glrotatef(-90+90*(my+dmy0)/planetdymax,1,0,0)
 glrotatef(-180*(mx+dmx0)/planetdxmax,0,0,1)
EndIf  
gltexsphere(r,60,60)
glpopmatrix	
End Sub
'Dim Shared As Integer tsphere,tsphere0,altsphere,altsphere0
Dim Shared As Single heure
Dim Shared As Integer tdark,tsnow
Sub drawsol
Dim As Single dx=2000,tx=7
Dim As Integer i
If tsphere0<>tsphere Then
	tsphere0=tsphere
	setfog()
EndIf
tsphere=0
/'If mz>(waterz0+30000) Or mz>(mzsol0+10000) Then
	drawsphere()
	If mz>(mzsol0+30000) Then
		tsphere=1
	   altsphere=Int((mz-waterz0)/2000)
	   If altsphere0<>altsphere Then 
		   altsphere0=altsphere:setfog()
	   EndIf
		Exit Sub 
	EndIf
EndIf '/ 
   
   If webtext>0 And mz>mzsol0+30 And planet=0 Then
     'glenable gl_alpha_test
 	  'glAlphaFunc(gl_greater,250/254)   	
   EndIf
	glpushmatrix
   glenable(gl_texture_2d)
	'glnormal3f(0,0,1)
	/'If (mz<(mzsol0+80) Or imapsol<=1) And webtext=0 Then 
	   glcolor3f(0,0.7,0)
	   If solauto=0 Then 
		  webglbindtexture(gl_texture_2d,soltexture)
		  watertext=soltexture
      Else  
        mapautotext=maptexture
  	     If mapautotext=maptexture5 Then
  	     	  webglbindtexture(gl_texture_2d,solautotext(3))
  	     ElseIf mapautotext=maptexture4 Then 
  	     	  webglbindtexture(gl_texture_2d,solautotext(2))
  	     Else 
  	     	  webglbindtexture(gl_texture_2d,solautotext(1))
  	     EndIf
  	     mapautotext0=mapautotext
  	     watertext=mapautotext
  	     If mapauto=0 Then
  	     	webglbindtexture(gl_texture_2d,soltexture0)
  	     	watertext=soltexture0 
  	     EndIf
      EndIf
      texscale=800/scalex
	ElseIf mapauto=0 Then
	   glcolor3f(1.0,1.0,1.0)
		webglbindtexture(gl_texture_2d,maptexture)
      texscale=16000/scalex
      watertext=maptexture
	Else 
	   If webtext=0 or planet>0 Then
	   	glcolor3f(1.0,1.0,1.0)
	   Else 	
	      glcolor4f(0,0,0,0)
	   EndIf
	   'setmapautotext(mx/scalex,my/scalex)
	   mapautotext=soltexture0
		webglbindtexture(gl_texture_2d,mapautotext)
		mapautotext0=mapautotext
		watertext=mapautotext
      'texscale=16000/scalex
	EndIf '/
	glcolor4f(1,1,1,1)
	mapautotext=soltexture0
	webglbindtexture(gl_texture_2d,mapautotext)
	mapautotext0=mapautotext
	watertext=mapautotext
	'If heure>6 And heure<20 Then
		gldisable(gl_lighting)
	'Else
      'gllightfv(gl_light0,GL_ambient,glparam4f(0.1,0.1,0.1, 1)) 'GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_POSITION
	'	glenable(gl_lighting)
	'EndIf
	gldisable(gl_normalize)
	'gltexdisk(0,2000)
   'gltexcarre(dx,tx)
   'Var scalexsave=scalex
   'scalex*=0.25
   'gltranslatef(0,512,0)
   'glenable(gl_cull_face)
   'If Abs(cos1)>Abs(sin1) Then
   '   glcullface(gl_front)
   'Else 
   '	glcullface(gl_back)
   'EndIf
   If tdark=1 Then
   	glenable(gl_lighting)
	   glenable(gl_normalize)
   EndIf
   Var webtext00=webtext
   If tsnow=1 and mz<mzsol0+4000 Then'1500 Then 
     webtext=snowtext
     glbindtexture(gl_texture_2d,snowtext)
	EndIf  
	drawterrain2()
	webtext=webtext00
   'gldisable(gl_cull_face)
	'scalex=scalexsave
	glpopmatrix
   gldisable gl_alpha_test
   If tdark=1 Then
   	glenable gl_lighting
   Else 	
   	gldisable gl_lighting
   EndIf
	'If (mz<(mzsol0+500) And (mzsol0-mzh)<waterz+1)Then'And tseashore=1 and webtext=0 Then
		'drawseashore()
	'EndIf
   'gllightfv(gl_light0,GL_ambient,glparam4f(0.1,0.1,0.1, 1)) 'GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_POSITION
'If mz>(mzsol0+10000) And mz<(waterz0+30000) Then drawhorizon(Abs(dxterrain))
End Sub
'Dim Shared As uint ntree,narbre=700
Dim Shared As uint arbrelist,distarbre=5000,distarbre0=5000:distarbre=5000*Sqr(narbre/700)
narbre2=min2(narbre2,narbre)
Dim Shared As Single arbrex(narbre),arbrey(narbre),arbrez(narbre),arbrerot(narbre),arbrerot0(narbre)
Dim Shared As Single arbrescalex(narbre),arbrescalez(narbre)
Dim Shared As Single arbreh(narbre)
Dim Shared As Integer arbretype(narbre),arbretype0(narbre)
Dim Shared As Single arbrehousex(narbre),arbrehousey(narbre),arbrehouseh(narbre)
Dim Shared As Single arbrehouseo1(narbre),arbrehousedx(narbre),arbrehousedy(narbre)
Dim Shared As Single cowx(ncow),cowy(ncow),cowz(ncow),cowo1(ncow),distcow=3000
Dim Shared As uint cowtext,cowlist
Function testpixhouse(i As Integer,j As Integer)As Integer
Dim As UInteger pix,r,g,b,k
pix=Point(i,townbmpy-j,townbmp)
r=(pix Shr 16)And 255
g=(pix Shr 8)And 255
b=pix And 255
k=245
If r>k And g>k And b>k Then Return 2
k=townpix'140
If r>k And g>k And b>k Then Return 1
Return 0	
End Function
Function testtown(iarbre As Integer) As Integer 
Dim As Integer i,j,k,r,g,b,pix,i1,i2,j1,j2,k1,k2,l1,l2,test
If Abs(arbrex(iarbre)+dmx0-xtown)>dxtown Then Return 0
If Abs(arbrey(iarbre)+dmy0-ytown)>dytown Then Return 0
i=(arbrex(iarbre)+dmx0-xtown+dxtown)*0.48*townbmpx/dxtown
j=(arbrey(iarbre)+dmy0-ytown+dytown)*0.48*townbmpy/dytown
test=testpixhouse(i,j)
If test=0 Then Return 0
If test=2 Then Return 2
For k=1 To 40
	If testpixhouse(i-k,j)<>1 Then Exit For
	i1-=1
Next
For k=1 To 40
	If testpixhouse(i+k,j)<>1 Then Exit For
	i2+=1
Next
For k=1 To 40
	If testpixhouse(i,j-k)<>1 Then Exit For
	j1-=1
Next
For k=1 To 40
	If testpixhouse(i,j+k)<>1 Then Exit For
	j2+=1
Next
For k=1 To 40
	If testpixhouse(i-k,j-k)<>1 Then Exit For
	k1-=1
Next
For k=1 To 40
	If testpixhouse(i+k,j+k)<>1 Then Exit For
	k2+=1
Next
For k=1 To 40
	If testpixhouse(i-k,j+k)<>1 Then Exit For
	l1-=1
Next
For k=1 To 40
	If testpixhouse(i+k,j-k)<>1 Then Exit For
	l2+=1
Next
If (i2-i1)<2 Or (j2-j1)<2 Then Return 0
If (i2-i1)<6 Or (j2-j1)<6 Then Return 2
If (i2-i1)>32 Or (j2-j1)>32 Then Return 2
If (k2-k1)<2 Or (l2-l1)<2 Then Return 0
If (k2-k1)<4 Or (l2-l1)<4 Then Return 2
If (k2-k1)>22 Or (l2-l1)>22 Then Return 2
If (j2-j1)>2.5*(i2-i1) Or (i2-i1)>2.5*(j2-j1) Then Return 2
If (l2-l1)>2.5*(k2-k1) Or (k2-k1)>2.5*(l2-l1) Then Return 2
Var h180=220.0
If max2(k2-k1,l2-l1)*1.4>max2(i2-i1,j2-j1) Then 
 arbrehouseo1(iarbre)=0
 arbrehousex(iarbre)=arbrex(iarbre)+(i2+i1)*dxtown/townbmpx
 arbrehousey(iarbre)=arbrey(iarbre)+(j2+j1)*dytown/townbmpy
 arbrehousedx(iarbre)=(i2-i1)*dxtown/townbmpx
 arbrehousedy(iarbre)=(j2-j1)*dytown/townbmpy
 arbrehouseh(iarbre)=min((i2-i1)*dxtown/townbmpx,(j2-j1)*dytown/townbmpy)
 arbrehouseh(iarbre)=min(h180*ktownh,arbrehouseh(iarbre)*ktownh)
 arbrehousedx(iarbre)=min(h180,arbrehousedx(iarbre))
 arbrehousedy(iarbre)=min(h180,arbrehousedy(iarbre))
 arbrehousedx(iarbre)=min(arbrehousedx(iarbre),arbrehousedy(iarbre)*2.5)
 arbrehousedy(iarbre)=min(arbrehousedy(iarbre),arbrehousedx(iarbre)*2.5)
ElseIf (k2-k1)>(l2-l1) Then 
 arbrehouseo1(iarbre)=45
 arbrehousex(iarbre)=arbrex(iarbre)+(k2+k1)*dxtown/townbmpx
 arbrehousey(iarbre)=arbrey(iarbre)+(k2+k1)*dytown/townbmpy
 arbrehousedx(iarbre)=(k2-k1)*dxtown/townbmpx
 arbrehousedy(iarbre)=(l2-l1)*dytown/townbmpy
 arbrehouseh(iarbre)=min((k2-k1)*dxtown/townbmpx,(l2-l1)*dytown/townbmpy)
 arbrehouseh(iarbre)=min(h180*ktownh,arbrehouseh(iarbre)*1.4*ktownh)
 arbrehousedx(iarbre)=min(h180,arbrehousedx(iarbre)*1.4)
 arbrehousedy(iarbre)=min(h180,arbrehousedy(iarbre)*1.4)
 arbrehousedx(iarbre)=min(arbrehousedx(iarbre),arbrehousedy(iarbre)*2.5)
 arbrehousedy(iarbre)=min(arbrehousedy(iarbre),arbrehousedx(iarbre)*2.5)
Else 
 arbrehouseo1(iarbre)=-45
 arbrehousex(iarbre)=arbrex(iarbre)+(l2+l1)*dxtown/townbmpx
 arbrehousey(iarbre)=arbrey(iarbre)+(l2+l1)*dytown/townbmpy
 arbrehousedx(iarbre)=(l2-l1)*dxtown/townbmpx
 arbrehousedy(iarbre)=(k2-k1)*dytown/townbmpy
 arbrehouseh(iarbre)=min((l2-l1)*dxtown/townbmpx,(k2-k1)*dytown/townbmpy)
 arbrehouseh(iarbre)=min(h180*ktownh,arbrehouseh(iarbre)*1.4*ktownh)
 arbrehousedx(iarbre)=min(h180,arbrehousedx(iarbre)*1.4)
 arbrehousedy(iarbre)=min(h180,arbrehousedy(iarbre)*1.4)
 arbrehousedx(iarbre)=min(arbrehousedx(iarbre),arbrehousedy(iarbre)*2.5)
 arbrehousedy(iarbre)=min(arbrehousedy(iarbre),arbrehousedx(iarbre)*2.5)
EndIf 
If (Int((arbrehousex(iarbre)+arbrehousey(iarbre))/100)Mod 3)=0 Then
	If arbrehouseh(iarbre)>200 Then arbrehouseh(iarbre)*=0.65
EndIf
Return 1
End Function
Declare Sub addtownhouse(iarbre As Integer)
Sub testtownarbres()
Exit Sub 
Dim As Integer i,test
'itown4=0
For i=1 To narbre2
  test=testtown(i)
  If test=2 Then arbretype(i)=10
  If test=1 Then
  	  arbretype(i)=10
     arbrez(i)=getterrainheight(arbrehousex(i),arbrehousey(i))
     addtownhouse(i)
  EndIf
Next i  
End Sub 
Sub drawarbre
If arbrelist<>0 Then
   glcalllist arbrelist
Else
 arbrelist=glgenlists(1)
 glnewlist arbrelist,gl_compile 
 Dim As Single auxy,auxz,scale=2
 auxy=68*scale:auxz=70*scale
 gltexcarre2 auxy,auxz
 'glrotatef( 60,0,0,1)
 'gltexcarre2 auxy,auxz
 gltexcarre2rot auxy,auxz,60
 'glrotatef( 60,0,0,1)
 'gltexcarre2 auxy,auxz
 gltexcarre2rot auxy,auxz,120 
 'glcolor3f(1,1,1)
 'glbindtexture(gl_texture_2d,tronctext)
 'gltexcylindre 1.5*scale,1.2*scale,35*scale,4,4
glendlist
EndIf 
End Sub
Dim Shared As uint nbuisson=35,buissonlist,distbuisson
Dim Shared As Single buissonx(nbuisson),buissony(nbuisson),buissonz(nbuisson),buissonrot(nbuisson),buissonrot0(nbuisson)
Dim Shared As Single buissontype(nbuisson)
Sub drawbuisson
If buissonlist<>0 Then
   glcalllist buissonlist
Else
 buissonlist=glgenlists(1)
 glnewlist buissonlist,gl_compile 
 Dim As Single auxy,auxz,scale=2
 auxy=40*scale:auxz=15*scale
 glcolor3f(1,1,1)
 gltexcarre2 auxy,auxz
 'glrotatef( 60,0,0,1)
 'gltexcarre2 auxy,auxz
 gltexcarre2rot auxy,auxz,60
 'glrotatef( 60,0,0,1)
 'gltexcarre2 auxy,auxz
 gltexcarre2rot auxy,auxz,120
 'glbindtexture(gl_texture_2d,tronctext)
 'gltexcylindre 1.5*scale,1.2*scale,7.5*scale
glendlist
EndIf 
End Sub
Declare Function gettestnearroad(x As Single,y As Single,dist As Single=0)As Integer
Const As Integer nroc=100
Dim Shared As uint distroc=2000,roctext,roclist
Dim Shared As Single rocx(nroc),rocy(nroc),rocz(nroc),roco1(nroc),roco2(nroc),roco3(nroc)
Dim Shared As Single rocscale(nroc),rocdz(nroc)
Dim Shared As Integer shadowiroc(nroc),ishadowroc,nshadowroc=nroc
Dim Shared As Single roczshadow(nroc),rocdo2shadow(nroc),rocdo3shadow(nroc),roczshadow3(nroc)
Dim Shared As Single rocdo1shadow(nroc)
Dim Shared As uint shadowroctext
Dim Shared As Single dxshadow,dyshadow,dzshadow,dxyshadow,o1shadow
Dim Shared As Integer tnightshadow 
Sub initroc()
Dim As Integer i
Randomize(imap)
nroc2=max2(1,min2(nroc,nroc2))
For i=1 To nroc
	rocscale(i)=(0.7+Rnd*2)*0.3
	rocdz(i)=(Rnd-0.7)*rocscale(i)*140
	rocx(i)=(Rnd-0.5)*distroc*2+2*distroc*Int(mx/(2*distroc))
	rocy(i)=(Rnd-0.5)*distroc*2+2*distroc*Int(my/(2*distroc))
	rocz(i)=getterrainheight(rocx(i),rocy(i))+rocdz(i)
	roco1(i)=Rnd*360
	roco2(i)=Rnd*360
	roco3(i)=Rnd*360
   If rocz(i)<waterz Or (i>nroc2) Or inearroad0<2 Then
     	rocz(i)=-999999
   ElseIf gettestnearroad(rocx(i),rocy(i),50)=1 Then'testpiste=1 Then
	   rocz(i)=-999999
   EndIf
Next
subsettupdate()
End Sub
Declare Function diro1(dx As Single,dy As Single)As Single 
Sub addshadowroc(iroc As Integer)
	If ishadowroc<nshadowroc Then
		ishadowroc+=1
		shadowiroc(ishadowroc)=iroc
	EndIf
End Sub
Dim Shared As Single suntan2=1
Sub drawshadowroc()
If tshadow=0 Or ishadowroc=0 Then Exit Sub
Dim As Integer i,j,k
glenable gl_alpha_test
glAlphaFunc(gl_less,100/254)
'gldisable gl_lighting
glenable gl_texture_2D
glcolor4f(0.6,0.6,0.6,1)
'glEnable GL_BLEND
'glBlendFunc GL_zero,GL_one_minus_src_color
Dim As Single auxy,auxz
auxy=150:auxz=150
Var do1sun=o1shadow'diro1(dxshadow,dyshadow)
'auxvar6=ishadowroc:auxtest=1
glbindtexture(gl_texture_2d,shadowroctext)	
For j=1 To ishadowroc
	  i=shadowiroc(j)
     glpushmatrix
     gltranslatef(rocx(i),rocy(i),rocz(i)-rocdz(i)+3+max(0.0,(roczshadow(i)-rocz(i))*0.3))
     Var dr=max(0.01,auxz*rocscale(i))
     Var h=max(0.0,dr-rocdz(i))
     Var si2=1.0-h/(dr)
     Var auxyy=Sqr(1-si2*si2)*dr
     Var auxzz=h*suntan2*(1+1/(1+suntan2))
     'Var auxzz=h*min(2.0,dxyshadow/max(0.001,Abs(dzshadow)))'*(1+1/(1+suntan2))
     'Var dr=auxyy*0.7
     Var do1=diro1(rocx(i)-20*cos1-mx,rocy(i)-20*sin1-my)
     Var do2=rocdo2shadow(i)'diro1(50*dxyshadow,roczshadow(i)-rocz(i))
     Var do3=rocdo3shadow(i)
       If tnightshadow=1 Then
         glrotatef(do1,0,0,1)
       Else	
       	glrotatef(do1sun,0,0,1)
       EndIf
       glrotatef(90-do2,0,1,0)
       glrotatef(do3,0,0,1)
       'Var scale=rocscale(i)
       'Var auxyy=2*150*scale,auxzz=150*scale+rocz(i)
  	  	 'gltexcarre2(auxyy,auxzz*suntan2*(1+1/(1+suntan2)),1,(2*150*scale-auxzz)/(2*150*scale))        
       gltexcarre2 auxyy,auxzz       
     glpopmatrix
Next j
glcolor4f(1,1,1,1)
gldisable gl_alpha_test
gldisable gl_blend
End Sub
Sub drawrocs()
Dim As Integer i 
glcolor3f(1,1,1)
glbindtexture(GL_TEXTURE_2D,roctext)
gldisable gl_lighting
ishadowroc=0
For i= 1 To min2(nroc,nroc2)'*2)
     Var changeroc=tupdateroc
     While rocx(i)<mx-distroc :rocx(i)+=distroc*2:changeroc=1:Wend 
     While rocx(i)>mx+distroc :rocx(i)-=distroc*2:changeroc=1:Wend 	
     While rocy(i)<my-distroc :rocy(i)+=distroc*2:changeroc=1:Wend 
     While rocy(i)>my+distroc :rocy(i)-=distroc*2:changeroc=1:Wend 
     If changeroc=1 Then
      	rocz(i)=getterrainheight(rocx(i),rocy(i))+rocdz(i)	
         If rocz(i)<waterz or inearroad0<2 Then 
         	rocz(i)=-999999
         ElseIf gettestnearroad(rocx(i),rocy(i),50)=1 Then'testpiste=1 Then
     		   rocz(i)=-999999
         Else 
     	  	  roczshadow(i)=getterrainheight(rocx(i)+dxshadow*30,rocy(i)+dyshadow*30)+rocdz(i) 
     	  	  rocdo2shadow(i)=diro1(30*dxyshadow,roczshadow(i)-rocz(i))
     	  	  roczshadow3(i)=getterrainheight(rocx(i)-dyshadow*30,rocy(i)+dxshadow*30)+rocdz(i)
     	  	  rocdo3shadow(i)=diro1(30*dxyshadow,roczshadow3(i)-rocz(i))
         EndIf
     EndIf
     If rocz(i)<-999995 Then Continue For 
     rotavion(rocx(i)-mx,rocy(i)-my,rocz(i)-mz) 
     If x2>-400 And x2<1200 Then addshadowroc(i) 	
     If x2>(0.9*max(Abs(y2),Abs(z2))-200*rocscale(i)) Then 	
    	glpushmatrix
  		gltranslatef(rocx(i),rocy(i),rocz(i)-30)
    	glrotatef(roco1(i),0,0,1)
    	glrotatef(roco2(i),1,0,0)
    	glrotatef(roco3(i),0,1,0)
    	glscalef(rocscale(i),rocscale(i),rocscale(i))
    	glcalllist roclist
      glpopmatrix
     EndIf  
Next i 
if tlight=1 then glenable gl_lighting
End Sub
Declare Sub prompt(ByRef msg As String,ByRef resp0 As String)
Sub subnroc
Dim As Integer i	
	resp=Str(nroc2)
	msg="number of rocs : enter a number (1 .. "+Str(nroc)+")  last="+Str(nroc2)
	prompt(msg,resp)
	i=Val(resp)
	i=max2(1,min2(nroc,i))
	If i<>nroc2 Then
		nroc2=i
		initroc()
	EndIf
End Sub
Dim Shared As uint seagulltext(5)
Dim Shared As Single seagullx,seagully,seagullz,seagullo1
Sub initseagull()
seagullo1=Rnd*360-180
Var co1=Cos(degtorad*seagullo1),si1=Sin(degtorad*seagullo1)
cos1=Cos(degtorad*o1):sin1=Sin(degtorad*o1)
Var r=900
seagullx=mx-r*co1+r*(Rnd-0.5)*0.5
seagully=my-r*si1+r*(Rnd-0.5)*0.5
If (cos1*co1+sin1*si1)>-0.25 Then
	seagullx+=r*cos1*0.75
	seagully+=r*sin1*0.75
EndIf
seagullz=((10+5*Rnd)*5+mz)
End Sub
Dim Shared As Double tsoundseagull
Sub drawseagull()
 Var co1=Cos(degtorad*seagullo1),si1=Sin(degtorad*seagullo1)
 Var dxy=(seagullx-mx)*si1-(seagully-my)*co1
 Var v=0.9*kfps
 seagullx+=v*co1:seagully+=v*si1
 Var dist=max(Abs(seagullx-mx),Abs(seagully-my))
 If dist<180 Then
 	If Timer>tsoundseagull Then
 		tsoundseagull=Timer+Rnd*Rnd*30
 		soundseagull()
 	EndIf
 EndIf
 If dist>1000 Then
 	if Rnd<0.005*kfps Then initseagull()
 EndIf
 seagullz=max(mz+dist*0.15,min(mz+dist*0.3,seagullz))
 seagullz=min(mzsol00+400,seagullz)
 glbindtexture(gl_texture_2d,seagulltext(Int(Timer*3.6)Mod 5))
 glenable gl_alpha_test
 glAlphaFunc(gl_less,20/254)
 'gldisable gl_depth_test
 glcolor4f(0.6,0.6,0.6,1)
 glpushmatrix
 'seagullx=mx+500*cos1*cos1:seagully=my+500*sin1*cos1':seagullz=mz+100*cos1
 gltranslatef(seagullx,seagully,seagullz)
 If dxy>0 Then
 	glrotatef(o1,0,0,1)
 Else
 	glrotatef(o1+180,0,0,1)
 EndIf
 gltexcarre2(19,19)
 glpopmatrix
 gldisable gl_alpha_test
 glenable gl_depth_test 
End Sub
Dim Shared As uint nhouse=10,house1list,building3text,rooftext,buildingtext
Dim Shared As uint whitetext,building32text,tnight
Dim Shared As Single tx,ty,tz,housex(nhouse),housey(nhouse),housez(nhouse),disthouse
Sub drawhouse1(dist As Single=1)
Dim As Single x=60,y=60,z=60,z1=104
glenable(gl_texture_2d)
If tnight=1 Then
	gldisable gl_alpha_test
	glcolor3f(1,1,0.6)
   glbindtexture(gl_texture_2d,whitetext)
   glscalef(0.9,0.9,0.99)
   gltexquad  x,y,0, x,0-y,0, x,0-y,z, x,y,z
   gltexquad  0-x,0-y,0, 0-x,y,0, 0-x,y,z, 0-x,0-y,z
   gltexquad  x,0-y,0, 0-x,0-y,0, 0-x,0-y,z, x,0-y,z
   gltexquad  0-x,y,0, x,y,0, x,y,z, 0-x,y,z
   glcolor3f(1,1,1)
   glscalef(1,1,1)
EndIf    
If tnight=1 Then
   glenable gl_alpha_test
 	glAlphaFunc(gl_greater,50/254)
EndIf
If dist>5000 And tnight=1 Then 
     glbindtexture(gl_texture_2d,building32text)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
Else 
     glbindtexture(gl_texture_2d,building3text)
EndIf 
If house1list<>0 Then
 glcalllist house1list
Else
 house1list=glgenlists(1)
 glnewlist house1list,gl_compile	
 glEnable GL_BLEND
 glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 glcolor3f( 0.9,1,1)
 gltexquad  x,y,0, x,0-y,0, x,0-y,z, x,y,z
 gltexquad  0-x,0-y,0, 0-x,y,0, 0-x,y,z, 0-x,0-y,z
 gltexquad  x,0-y,0, 0-x,0-y,0, 0-x,0-y,z, x,0-y,z
 gltexquad  0-x,y,0, x,y,0, x,y,z, 0-x,y,z
 glcolor3f( 240/255,50/255,50/255)
 gldisable GL_BLEND
 gldisable gl_alpha_test
 glbindtexture(gl_texture_2d,rooftext)
 x+=1:y+=1
 gltextriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltextriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltextriangle  0-x,y,z, 0,0,z1, x,y,z
 gltextriangle  x,y,z, 0,0,z1, x,0-y,z
tx=x:ty=y:tz=z1
glendlist
EndIf 
End Sub
Dim Shared As uint nhouse2=10,house2list
Dim Shared As Single house2x(nhouse2),house2y(nhouse2),house2z(nhouse2),disthouse2
Sub drawhouse2(dist As Single=1)
Dim As Single x=50,y=110,z=64,z1=112
glenable(gl_texture_2d)
If tnight=1 Then
	gldisable gl_alpha_test
	glcolor3f(1,1,0.6)
   glbindtexture(gl_texture_2d,whitetext)
   glscalef(0.9,0.9,0.99)
   gltexquad  x,y,0, x,0-y,0, x,0-y,z, x,y,z
   gltexquad  0-x,0-y,0, 0-x,y,0, 0-x,y,z, 0-x,0-y,z
   gltexquad  x,0-y,0, 0-x,0-y,0, 0-x,0-y,z, x,0-y,z
   gltexquad  0-x,y,0, x,y,0, x,y,z, 0-x,y,z
   glcolor3f(1,1,1)
   glscalef(1,1,1)
EndIf    
If tnight=1 Then
   glenable gl_alpha_test
 	glAlphaFunc(gl_greater,50/254)
EndIf
If dist>5000 And tnight=1 Then 
     glbindtexture(gl_texture_2d,building32text)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
Else 
     glbindtexture(gl_texture_2d,building3text)
EndIf 
If house2list<>0 Then
 glcalllist house2list
Else
 house2list=glgenlists(1)
 glnewlist house2list,gl_compile	
 glEnable GL_BLEND
 glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 glcolor3f( 0.9,1,1)
 gltexquad  x,y,0, x,0-y,0, x,0-y,z, x,y,z
 gltexquad  0-x,0-y,0, 0-x,y,0, 0-x,y,z, 0-x,0-y,z
 gltexquad  x,0-y,0, 0-x,0-y,0, 0-x,0-y,z, x,0-y,z
 gltexquad  0-x,y,0, x,y,0, x,y,z, 0-x,y,z
 glcolor3f( 220/255,40/255,40/255)
 gldisable GL_BLEND
 gldisable gl_alpha_test
 glbindtexture(gl_texture_2d,rooftext)
 x+=1:y+=1
 gltextriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltextriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltextriangle  0-x,y,z, 0,0,z1, x,y,z
 gltextriangle  x,y,z, 0,0,z1, x,0-y,z
tx=x:ty=y:tz=z1
glendlist
EndIf 
End Sub
Sub drawbuilding2(ByVal h As Single,x As Single=200,y As Single=200,vie As Single=1,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single z,z1,tx,ty,z0
z=h*dktownh:'If h<600 And h>300 Then z*=0.3
z1=z'+20
z0=-800
tx=x/150:ty=(z-z0)/120
glenable(gl_texture_2d)
Var tnight1=tnight
If (Int(h)Mod 5)<2  Then tnight1=0
If tnight1=1 And vie>0 Then
	gldisable gl_alpha_test
	glcolor3f(1,1,0.6)
   glbindtexture(gl_texture_2d,whitetext)
   glscalef(0.9,0.9,0.99)
   gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty
   gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty
   gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
   gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
   glcolor3f(1,1,1)
   glscalef(1,1,1)
EndIf    
If tnight1=1 Then
   glenable gl_alpha_test
 	glAlphaFunc(gl_greater,50/254)
EndIf
 'glEnable GL_BLEND
 'glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 gldisable(gl_lighting)
 If dist>13400 And tnight1=1 Then 
     glbindtexture(gl_texture_2d,building32text)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
 Else 
     glbindtexture(gl_texture_2d,building3text)
 EndIf 
 If r>-0.1 Then glcolor3f(r,g,b) 
 gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty
 gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty
 gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
 gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
 If z<100 Then
 	z1=z+54:glcolor3f(0.9,0.3,0.4)
 Else
   glcolor3f( 0.4,0.35,0.4)
 EndIf 
 'gldisable GL_BLEND
 gltriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltriangle  0-x,y,z, 0,0,z1, x,y,z
 gltriangle  x,y,z, 0,0,z1, x,0-y,z
tx=x:ty=y:tz=z1
If tnight1=1 Then
	gldisable gl_alpha_test
EndIf
End Sub
Function setbuildh(h As Single) As Single
	'Dim As Single kh=1.0 
	'If h<50 Then Return h '<200
	'If h>1200-itown*40 Then Return h
	Var hh=600-itown*40.0
	If h>hh Then Return h
	'If h>480-itown*20 Then Return h
	'kh=itown/(2+itown)
	Var h80=50.0,hhh=h
	If h<h80 Then Return h '<200
	If itown=6 Then hhh=h80+(h-h80)*1.1'*2
	If itown=5 Then hhh=h80+(h-h80)*0.8'*2
	If itown=4 Then hhh=h80+(h-h80)*0.5'*2 
	If itown=3 Then hhh=h80+(h-h80)*0.3'*2
	If itown=2 Then hhh=h80+(h-h80)*0.2'*2
	If itown=1 Then hhh=h80+(h-h80)*0.15'*2
	hhh=min(hh,hhh)
	Var kh=(h-h80)/(hh-h80)
	Return hhh*(1-kh)+kh*h 
End Function
Sub drawbuilding1(ByVal h As Single,x As Single=200,y As Single=200,vie As Single=1,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single z,z1,tx,ty,z0
z=h:z1=z+20:z0=-800
tx=x/150:ty=(z-z0)/120
glenable(gl_texture_2d)
Var tnight1=tnight
If (Int(h)Mod 5)<2  Then tnight1=0
If tnight1=1 And vie>0 Then
	gldisable gl_alpha_test
	glcolor3f(1,1,0.6)
   glbindtexture(gl_texture_2d,whitetext)
   glscalef(0.9,0.9,0.99)
   gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty
   gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty
   gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
   gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
   glcolor3f(1,1,1)
   glscalef(1,1,1)
EndIf    
If tnight1=1 Then
   glenable gl_alpha_test
 	glAlphaFunc(gl_greater,50/254)
EndIf
 'glEnable GL_BLEND
 'glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 gldisable(gl_lighting)
 If dist>13400 And tnight1=1 Then 
     glbindtexture(gl_texture_2d,building32text)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
 Else 
     glbindtexture(gl_texture_2d,building3text)
 EndIf 
 If r>-0.1 Then glcolor3f(r,g,b) 
 gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty
 gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty
 gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
 gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
 If z<200 Then
 	z1=z+54+(max(0,x-200)+max(0,y-200))*0.1:glcolor3f(0.9,0.3,0.4)
 Else
   glcolor3f( 0.4,0.35,0.4)
 EndIf 
 'gldisable GL_BLEND
 gltriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltriangle  0-x,y,z, 0,0,z1, x,y,z
 gltriangle  x,y,z, 0,0,z1, x,0-y,z
tx=x:ty=y:tz=z1
If tnight1=1 Then
	gldisable gl_alpha_test
EndIf
End Sub
Dim Shared As uint churchtext
Sub drawchurch(ByVal h As Single,x As Single=200,y As Single=200,vie As Single=1,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single z,z1,tx,ty,z0
z=h:z1=z+20:z0=-800
tx=x/150:ty=(z-z0)/120
glenable(gl_texture_2d)
Var tnight1=0'tnight
If (Int(h)Mod 5)<2  Then tnight1=0
If tnight1=1 And vie>0 Then
	gldisable gl_alpha_test
	glcolor3f(1,1,0.6)
   glbindtexture(gl_texture_2d,whitetext)
   glscalef(0.9,0.9,0.99)
   gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty
   gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty
   gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
   gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
   glscalef(1,1,1)
EndIf    
If vie>0 Then glcolor3f(0.7,0.8,0.85)
If tnight1=1 Then
   glenable gl_alpha_test
 	glAlphaFunc(gl_greater,50/254)
EndIf
 'glEnable GL_BLEND
 'glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 gldisable(gl_lighting)
 If dist>13400 And tnight1=1 Then 
     glbindtexture(gl_texture_2d,churchtext)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
 Else 
     glbindtexture(gl_texture_2d,churchtext)
 EndIf 
 If r>-0.1 Then glcolor3f(r,g,b) 
 gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty
 gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty
 gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
 gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
 If z<700 Then
 	z1=z+100+(max(0,x-200)+max(0,y-200))*0.2:glcolor3f(0.9,0.3,0.4)
 Else
   glcolor3f( 0.9,0.3,0.4)
 EndIf 
 'gldisable GL_BLEND
 gltriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltriangle  0-x,y,z, 0,0,z1, x,y,z
 gltriangle  x,y,z, 0,0,z1, x,0-y,z
tx=x:ty=y:tz=z1
If tnight1=1 Then
	gldisable gl_alpha_test
EndIf
End Sub
Dim Shared As uint shoptext
Sub drawshop(ByVal h As Single,x As Single=200,y As Single=200,vie As Single=1,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single z,z1,tx,ty,z0,tx0
z=h:z1=z+20:z0=-800
tx=-x/400:ty=(z-z0)/405
tx0=0
glenable(gl_texture_2d)
If vie>0 Then glcolor3f(1,1,1)
 gldisable(gl_lighting)
 glbindtexture(gl_texture_2d,shoptext) 
 If r>-0.1 Then glcolor3f(r,g,b) 
 gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty,tx0
 tx0+=tx
 gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty,tx0
 tx0+=tx
 gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty,tx0
 tx0+=tx
 gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty,tx0
 If z<700 Then
 	z1=z+80+(max(0,x-200)+max(0,y-200))*0.16:glcolor3f(0.9,0.4,0.4)
 Else
   glcolor3f(0.9,0.4,0.4)
 EndIf 
 'gldisable GL_BLEND
 gltriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltriangle  0-x,y,z, 0,0,z1, x,y,z
 gltriangle  x,y,z, 0,0,z1, x,0-y,z
End Sub
Dim Shared As uint officialtext,official2text
Sub drawofficial(ByVal h As Single,x As Single=200,y As Single=200,vie As Single=1,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single z,z1,tx,ty,z0
z=h:z1=z+20:z0=-800
tx=x/130:ty=(z-z0)/99
glenable(gl_texture_2d)
Var tnight1=tnight
If (Int(Abs(dist))Mod 8)<2  Then tnight1=0
If tnight1=1 And vie>0 Then
	gldisable gl_alpha_test
	glcolor3f(1,1,0.73)
   glbindtexture(gl_texture_2d,whitetext)
   glscalef(0.9,0.9,0.99)
   gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty
   gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty
   gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
   gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
   glscalef(1,1,1)
EndIf    
If vie>0 Then
	If tnight=1 Then
		glcolor3f(0.65,0.65,0.5)
	Else
		glcolor3f(0.9,0.9,0.62)
	EndIf
EndIf
If tnight1=1 Then
   glenable gl_alpha_test
 	glAlphaFunc(gl_less,50/254)
EndIf
 gldisable(gl_lighting)
 If tnight1=1 Then 
     glbindtexture(gl_texture_2d,official2text)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_nearest)'linear)
     'glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST)'nomipmap
 Else
     glbindtexture(gl_texture_2d,officialtext) 
 EndIf
 If r>-0.1 Then glcolor3f(r,g,b) 
 gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,tx,ty
 gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,tx,ty
 gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
 gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
 If z<700 Then
 	z1=z+85+(max(0,x-200)+max(0,y-200))*0.17:glcolor3f(0.9,0.35,0.4)
 Else
   glcolor3f(0.9,0.35,0.4)
 EndIf 
 'gldisable GL_BLEND
 gltriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltriangle  0-x,y,z, 0,0,z1, x,y,z
 gltriangle  x,y,z, 0,0,z1, x,0-y,z
 If tnight1=1 Then
	gldisable gl_alpha_test
 EndIf
End Sub
Dim Shared As uint railstationtext
Sub drawrailstation(ByVal h As Single,x As Single=200,y As Single=200,vie As Single=1,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single z,z1,tx,ty,z0,txx
z=h:z1=z+20:z0=-800
tx=x/484:txx=y/484:ty=(z-z0)/405
glenable(gl_texture_2d)
If vie>0 Then glcolor3f(0.85,1,1)'0.68,1,1
 gldisable(gl_lighting)
 glbindtexture(gl_texture_2d,railstationtext) 
 If r>-0.1 Then glcolor3f(r,g,b) 
 gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,txx,ty
 gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,txx,ty
 gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
 gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
 If z<700 Then
 	z1=z+75+(max(0,x-200)+max(0,y-200))*0.15:glcolor3f(0.9,0.4,0.4)
 Else
   glcolor3f(0.9,0.4,0.4)
 EndIf 
 'gldisable GL_BLEND
 gltriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltriangle  0-x,y,z, 0,0,z1, x,y,z
 gltriangle  x,y,z, 0,0,z1, x,0-y,z
End Sub
Dim Shared As uint hospitaltext
Sub drawhospital(ByVal h As Single,x As Single=200,y As Single=200,vie As Single=1,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim As Single z,z1,tx,ty,z0,txx
z=h:z1=z+20:z0=-800
tx=x/430:txx=y/430:ty=(z-z0)/405
glenable(gl_texture_2d)
If vie>0 Then glcolor3f(0.82,0.72,0.72)
 gldisable(gl_lighting)
 glbindtexture(gl_texture_2d,hospitaltext) 
 If r>-0.1 Then glcolor3f(r,g,b) 
 gltexquad  x,y,z0, x,0-y,z0, x,0-y,z, x,y,z,txx,ty
 gltexquad  0-x,0-y,z0, 0-x,y,z0, 0-x,y,z, 0-x,0-y,z,txx,ty
 gltexquad  x,0-y,z0, 0-x,0-y,z0, 0-x,0-y,z, x,0-y,z,tx,ty
 gltexquad  0-x,y,z0, x,y,z0, x,y,z, 0-x,y,z,tx,ty
 If z<700 Then
 	z1=z+77+(max(0,x-200)+max(0,y-200))*0.154:glcolor3f(0.9,0.4,0.4)
 Else
   glcolor3f(0.9,0.4,0.4)
 EndIf 
 'gldisable GL_BLEND
 gltriangle  x,0-y,z, 0,0,z1, 0-x,0-y,z
 gltriangle  0-x,0-y,z, 0,0,z1, 0-x,y,z
 gltriangle  0-x,y,z, 0,0,z1, x,y,z
 gltriangle  x,y,z, 0,0,z1, x,0-y,z
End Sub
Declare Sub drawbuildingnode(ij As Integer,i As Integer,dist As Single=1,r As Single=-1,g As Single=0,b As Single=0)
Dim Shared As Single  dmx00,dmy00,dmx000,dmy000
Dim Shared As Single  townvie400(400,6,6)
''Dim Shared As Integer ntown=400*50,ntown2,towntype(ntown),townchanged=1,tinittown=1,tinittownvie=1
'Dim Shared As Integer ntown=3*25*3*25,ntown2,towntype(ntown),townchanged=1,tinittown=1,tinittownvie=1
Const As Integer ntown=1250
Dim Shared As Integer ntown2=1225,towntype(ntown),townchanged=1,tinittown=1,tinittownvie=1
Dim Shared As Integer showtown(ntown),townntower(ntown),tmaptown(ntown)
Dim Shared As Single  townx(ntown),towny(ntown),townz(ntown),townw(ntown,6,6),townwy(ntown,6,6)
Dim Shared As Single  townbuild(ntown,6,6),townh(ntown,6,6),towndz(ntown,6,6)
Dim Shared As Single  towndx(ntown,6,6),towndy(ntown,6,6),townvie(ntown,6,6)
Dim Shared As Single  townddx(ntown,6,6),townddy(ntown,6,6)
Dim Shared As Single  towno1(ntown,6,6)
''Dim Shared As Integer ntowp=400*50,ntowp2,towptype(ntowp),towpchanged=1,tinittowp=1
'Dim Shared As Integer ntowp=3*25*3*25,ntowp2,towptype(ntowp),towpchanged=1,tinittowp=1
Const As Integer ntowp=1250
Dim Shared As Integer ntowp2=1225,towptype(ntowp),towpchanged=1,tinittowp=1
Dim Shared As Integer showtowp(ntowp),towpntower(ntowp),tmaptowp(ntowp)
Dim Shared As Single  towpx(ntowp),towpy(ntowp),towpz(ntowp),towpw(ntowp,6,6),towpwy(ntowp,6,6)
Dim Shared As Single  towpbuild(ntowp,6,6),towph(ntowp,6,6),towpdz(ntowp,6,6)
Dim Shared As Single  towpdx(ntowp,6,6),towpdy(ntowp,6,6),towpvie(ntowp,6,6)
Dim Shared As Single  towpddx(ntowp,6,6),towpddy(ntowp,6,6)
Dim Shared As Single  towpo1(ntowp,6,6)
Dim Shared As Integer itownp=1,testweb2',testweb
Dim Shared As Double  tloadwebtext=-2
Dim Shared As Single  lattown=-91,lngtown,lattown1,lngtown1,o1town

Const As Integer nnearroad=2000
Dim Shared As Integer inearroad,onewaynearroad(nnearroad),inearroad2',inearroad0
Dim Shared As Single xnearroad(nnearroad),ynearroad(nnearroad),rnearroad(nnearroad),drnearroad(nnearroad)
Dim Shared As Single co1nearroad(nnearroad),si1nearroad(nnearroad),distnearroad=2000
Dim Shared As String namenearroad(nnearroad),idnearroad(nnearroad)
Dim Shared As Integer ijnearroad(nnearroad),iinearroad(nnearroad)
Dim Shared As Single rnearroad0(nnearroad),drnearroad0(nnearroad),xnearroad0(nnearroad),ynearroad0(nnearroad)
Dim Shared As Single co1nearroad0(nnearroad),si1nearroad0(nnearroad)
Dim Shared As Single layernearroad(nnearroad),layernearroad0(nnearroad)
Const As Integer nnear0road=400
Dim Shared As Integer inear0road,onewaynear0road(nnear0road),inear0road2
Dim Shared As Single xnear0road(nnear0road),ynear0road(nnear0road),rnear0road(nnear0road),drnear0road(nnear0road)
Dim Shared As Single co1near0road(nnear0road),si1near0road(nnear0road),distnear0road=2000
Dim Shared As Single layernear0road(nnear0road)
Dim Shared As Integer inear0road0,onewaynear0road0(nnear0road),inear0road20
Dim Shared As Single xnear0road0(nnear0road),ynear0road0(nnear0road),rnear0road0(nnear0road),drnear0road0(nnear0road)
Dim Shared As Single co1near0road0(nnear0road),si1near0road0(nnear0road),distnear0road0=2000
Dim Shared As Single layernear0road0(nnear0road)
Dim Shared As Byte   testcrossnear0road(nnear0road,100)
Const As Integer nwaynode=20,ntownnode=900
'Dim Shared As Integer ntownnode=500,townnwaynode(ntown),towniwaynode(ntown,ntownnode)
Dim Shared As Integer townnwaynode(ntown),towniwaynode(ntown,ntownnode)
Dim Shared As Integer towni40(ntown,ntownnode)
Dim Shared As Byte townalloc(ntown,ntownnode)
Dim Shared As UByte towni1(ntown,ntownnode),towni2(ntown,ntownnode),towni3(ntown,ntownnode),towni4(ntown,ntownnode)
Dim Shared As int64  townwaynodeid(ntown,ntownnode)
Type nodexyo1
	ReDim As Single x(0)
	ReDim As Single y(0)
	ReDim As Single o1(0)
End Type
Dim Shared As nodexyo1 townwaynodexyo1(ntown,ntownnode)
'Dim Shared As Single dtownwaynodex(ntown,ntownnode,nwaynode),dtownwaynodey(ntown,ntownnode,nwaynode)
'Dim Shared As Single dtownwaynodeo1(ntown,ntownnode,nwaynode)
Dim Shared As Single townwaynodeh(ntown,ntownnode),townwaynodez(ntown,ntownnode)
Dim Shared As Single townwaynodevie(ntown,ntownnode),townwaynodesize(ntown,ntownnode),townwaynodesize40(ntown,ntownnode)
Dim Shared As Integer townwaynodebuild(ntown,ntownnode)
Dim Shared As Single townwaynoder(ntown,ntownnode),townwaynodeg(ntown,ntownnode),townwaynodeb(ntown,ntownnode)
Dim Shared As Integer townnwaynode2(ntown),towniwaynode2(ntown,ntownnode)
Dim Shared As Integer towni402(ntown,ntownnode)
Dim Shared As Byte townalloc2(ntown,ntownnode)
Dim Shared As int64  townwaynodeid2(ntown,ntownnode)
Dim Shared As nodexyo1 townwaynodexyo12(ntown,ntownnode)
'Dim Shared As Single townwaynodex2(ntown,ntownnode,nwaynode),townwaynodey2(ntown,ntownnode,nwaynode)
'Dim Shared As Single townwaynodeo12(ntown,ntownnode,nwaynode)
Dim Shared As Single townwaynodeh2(ntown,ntownnode),townwaynodez2(ntown,ntownnode)
Dim Shared As Single townwaynodevie2(ntown,ntownnode),townwaynodesize2(ntown,ntownnode)
Dim Shared As Integer townwaynodebuild2(ntown,ntownnode)
Dim Shared As Single townwaynoder2(ntown,ntownnode),townwaynodeg2(ntown,ntownnode),townwaynodeb2(ntown,ntownnode)
Dim Shared As Integer townshow(ntown),townwaynodeshow(ntown,ntownnode)
Dim Shared As Integer townshow2(ntown),townwaynodeshow2(ntown,ntownnode),townnametype(ntown,ntownnode)
Dim Shared As Integer i50=50,i101=101
Dim Shared As Byte townlock(ntown),lockterrain,lockterrainbmp,lockterrain22
Dim Shared As Integer ttsetterrain(ntown,ntownnode),ttsetterrain2(ntown,ntownnode) 
Dim Shared As String  townwayname(ntown,ntownnode),townwayname2(ntown,ntownnode)
Dim Shared As Single waynodebuildh(ntown,ntownnode),waynodebuildx(ntown,ntownnode),waynodebuildy(ntown,ntownnode)
Dim Shared As Single waynodebuildx2(ntown,ntownnode),waynodebuildy2(ntown,ntownnode)
Dim Shared As Single myroadlat=-99,myroadlon,myroadlat2=-99,myroadlon2
Dim Shared As Integer mywayroadij,mywayroadi',tt2=10,ttt2=0,t8000=25000/10
Dim Shared As Double twarning 
Sub testwarningfree()
	If Fre()<50000000 Then
	  If Timer>twarning+8 Then
		 guiconfirm("warning low memory (free<50M), resetnodes ?","confirm",resp)
		 If resp="yes" Then resettownwaynode():resettownwaynode2()
		 twarning=Timer 
	  EndIf
	EndIf	
End Sub
#Define townwaynodex(ntown,ntownnode,nwaynode) *ptownwaynodex(ntown,ntownnode,nwaynode)
Function  ptownwaynodex(ntowni As integer,ntownnodei As integer,nwaynodei As Integer)As Single Ptr
	If townalloc(ntowni,ntownnodei)=0 Then
      testwarningfree()
		townalloc(ntowni,ntownnodei)=1
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).x)(nwaynode)
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).y)(nwaynode)
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).o1)(nwaynode)
		Dim As Integer i
		For i=0 To nwaynode:townwaynodexyo1(ntowni,ntownnodei).o1(i)=999:Next 
	EndIf
	Return @(townwaynodexyo1(ntowni,ntownnodei).x(nwaynodei))
End Function
#Define townwaynodey(ntown,ntownnode,nwaynode) *ptownwaynodey(ntown,ntownnode,nwaynode)
Function  ptownwaynodey(ntowni As integer,ntownnodei As integer,nwaynodei As Integer)As Single Ptr
	If townalloc(ntowni,ntownnodei)=0 Then
      testwarningfree()
		townalloc(ntowni,ntownnodei)=1
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).x)(nwaynode)
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).y)(nwaynode)
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).o1)(nwaynode)
		Dim As Integer i
		For i=0 To nwaynode:townwaynodexyo1(ntowni,ntownnodei).o1(i)=999:Next 
	EndIf
	Return @(townwaynodexyo1(ntowni,ntownnodei).y(nwaynodei))
End Function
#Define townwaynodeo1(ntown,ntownnode,nwaynode) *ptownwaynodeo1(ntown,ntownnode,nwaynode)
Function  ptownwaynodeo1(ntowni As integer,ntownnodei As integer,nwaynodei As Integer)As Single Ptr
	If townalloc(ntowni,ntownnodei)=0 Then
      testwarningfree()
		townalloc(ntowni,ntownnodei)=1
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).x)(nwaynode)
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).y)(nwaynode)
		ReDim As Single (townwaynodexyo1(ntowni,ntownnodei).o1)(nwaynode)
		Dim As Integer i
		For i=0 To nwaynode:townwaynodexyo1(ntowni,ntownnodei).o1(i)=999:Next 
	EndIf
	Return @(townwaynodexyo1(ntowni,ntownnodei).o1(nwaynodei))
End Function
#Define townwaynodex2(ntown,ntownnode,nwaynode) *ptownwaynodex2(ntown,ntownnode,nwaynode)
Function  ptownwaynodex2(ntowni As integer,ntownnodei As integer,nwaynodei As Integer)As Single Ptr
	If townalloc2(ntowni,ntownnodei)=0 Then
      testwarningfree()
		townalloc2(ntowni,ntownnodei)=1
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).x)(nwaynode)
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).y)(nwaynode)
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).o1)(nwaynode)
		Dim As Integer i
		For i=0 To nwaynode:townwaynodexyo12(ntowni,ntownnodei).o1(i)=999:Next 
	EndIf
	Return @(townwaynodexyo12(ntowni,ntownnodei).x(nwaynodei))
End Function
#Define townwaynodey2(ntown,ntownnode,nwaynode) *ptownwaynodey2(ntown,ntownnode,nwaynode)
Function  ptownwaynodey2(ntowni As integer,ntownnodei As integer,nwaynodei As Integer)As Single Ptr
	If townalloc2(ntowni,ntownnodei)=0 Then
      testwarningfree()
		townalloc2(ntowni,ntownnodei)=1
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).x)(nwaynode)
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).y)(nwaynode)
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).o1)(nwaynode)
		Dim As Integer i
		For i=0 To nwaynode:townwaynodexyo12(ntowni,ntownnodei).o1(i)=999:Next 
	EndIf
	Return @(townwaynodexyo12(ntowni,ntownnodei).y(nwaynodei))
End Function
#Define townwaynodeo12(ntown,ntownnode,nwaynode) *ptownwaynodeo12(ntown,ntownnode,nwaynode)
Function  ptownwaynodeo12(ntowni As integer,ntownnodei As integer,nwaynodei As Integer)As Single Ptr
	If townalloc2(ntowni,ntownnodei)=0 Then
      testwarningfree()
		townalloc2(ntowni,ntownnodei)=1
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).x)(nwaynode)
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).y)(nwaynode)
		ReDim As Single (townwaynodexyo12(ntowni,ntownnodei).o1)(nwaynode)
		Dim As Integer i
		For i=0 To nwaynode:townwaynodexyo12(ntowni,ntownnodei).o1(i)=999:Next 
	EndIf
	Return @(townwaynodexyo12(ntowni,ntownnodei).o1(nwaynodei))
End Function
#Define tt2 10
#Define t8000 25000/10
Sub getlockterrain()
'Exit sub
Dim As Integer i
For i=1 To t8000
	If lockterrain=0 Then lockterrain=1:tlockchanged=1:Exit Sub
	If quit=1 Then Exit Sub
	Sleep tt2
Next
lockterrain+=1
End Sub
Sub getlockterrain2()
'Exit sub
Dim As Integer i
For i=1 To t8000
	If lockterrain=0 Then lockterrain=1:tlockchanged=1:Exit Sub
	If quit=1 Then Exit Sub
	Sleep tt2
Next
lockterrain+=1
End Sub
Sub freelockterrain()
'Exit sub
	lockterrain=max2(0,lockterrain-1):tlockchanged=1
	'Sleep ttt2
End Sub
Sub getlockterrain22()
'Exit sub
Dim As Integer i
For i=1 To t8000
	If lockterrain22=0 Then lockterrain22=1:tlockchanged=1:Exit Sub
	If quit=1 Then Exit Sub
	Sleep tt2
Next
lockterrain22+=1
End Sub
Sub freelockterrain22()
'Exit sub
	lockterrain22=max2(0,lockterrain22-1):tlockchanged=1
	'Sleep ttt2
End Sub
Sub getlockterrainbmp()
'Exit sub
Dim As Integer i 
For i=1 To t8000
	If lockterrainbmp=0 Then lockterrainbmp=1:tlockchanged=1:Exit Sub
	If quit=1 Then Exit Sub
	Sleep tt2
Next
lockterrainbmp+=1
End Sub
Sub getlockterrainbmp2()
'Exit sub
Dim As Integer i 
For i=1 To t8000
	If lockterrainbmp=0 Then lockterrainbmp=1:tlockchanged=1:Exit Sub
	If quit=1 Then Exit Sub
	Sleep tt2
Next
lockterrainbmp+=1
End Sub
Sub freelockterrainbmp()
'Exit sub
	lockterrainbmp=max2(0,lockterrainbmp-1):tlockchanged=1
	'Sleep ttt2
End Sub
Sub getlocktown(ij As Integer)
'Exit sub
Dim As Integer i 
For i=1 To t8000
	If townlock(ij)=0 Then townlock(ij)=1:tlockchanged=1:Exit Sub
	If quit=1 Then Exit Sub 
	Sleep tt2
Next
townlock(ij)+=1
End Sub
Sub getlocktown2(ij As Integer)
'Exit sub
Dim As Integer i 
For i=1 To t8000
	If townlock(ij)=0 Then townlock(ij)=1:tlockchanged=1:Exit Sub
	If quit=1 Then Exit Sub 
	Sleep tt2
Next
townlock(ij)+=1
End Sub
Sub freelocktown(ij As Integer)
'Exit sub
	townlock(ij)=max2(0,townlock(ij)-1):tlockchanged=1
	'Sleep ttt2
End Sub
Declare Function gettownij(px As single,py As Single)As Integer
Dim Shared As Single dxcopy,dycopy 
Dim Shared As Integer copydoubles,nbuilds,ntown20
Const As Integer ntown40=3000,n40=nwaynode*2+1'20
Dim Shared As Single h40=100'400
Dim Shared As int64 townid40(ntown40)
Dim Shared As Integer towninode40(ntown40),itown40,knode40(ntown40,n40),townixy40(ntown40)
Dim Shared As Integer town40ij(ntown40),town40iji(ntown40)
Dim Shared As Single townnodex40(ntown40,n40),townnodey40(ntown40,n40)
Dim Shared As Single townnodelon40(ntown40,n40),townnodelat40(ntown40,n40)
Dim Shared As Single townx40(ntown40,n40),towny40(ntown40,n40)
Dim Shared As int64  initid(100000)
Dim Shared As Integer iinitid,tiinitid
Dim Shared As Double timeinitid
Sub resetinitid()
Dim As Integer i
For i=0 To 100000
	initid(i)=0
Next
iinitid=0
End Sub
Function testinitid(id As int64)As Integer
Dim As Integer i 
For i=iinitid To 1 Step -1
	If id=initid(i) Then Return 1
	If initid(i)=0 Then Exit For 
Next
For i=100000 To iinitid+1 Step -1
	If id=initid(i) Then Return 1
	If initid(i)=0 Then Exit For 
Next
iinitid+=1:If iinitid>100000 Then iinitid=1
initid(iinitid)=id
Return 0
End Function
Sub resettown40()
Dim As Integer i,j 
For i=0 To ntown40
	townid40(i)=0
	townixy40(i)=0
	town40ij(i)=0
	town40iji(i)=0
	For j=0 To n40
		knode40(i,j)=0
		townnodelat40(i,j)=-99
		townnodex40(i,j)=0
		townnodey40(i,j)=0
	Next
Next
itown40=1
End Sub
Sub resettownxy40()
Dim As Integer i,j 
For i=0 To ntown40
	townixy40(i)=0
	For j=0 To n40
		townnodex40(i,j)=0
		townnodey40(i,j)=0
	Next
Next
End Sub
Sub resettown40i(i As integer)
Dim As Integer j 
	townid40(i)=0
	townixy40(i)=0
	town40ij(i)=0
	town40iji(i)=0
	For j=0 To n40
		knode40(i,j)=0
		townnodelat40(i,j)=-99
		townnodex40(i,j)=0
		townnodey40(i,j)=0
	Next
End Sub
Declare Sub latlngtomxy(ByVal latxx As single,ByVal lngxx As Single ,ByRef mxx As Single,ByRef myy As Single)
Dim Shared As Single kmxlat=1
Function gettownnodex40(ij As Integer,i As Integer)As Single
	If knode40(ij,i)<>i Then Return 0
	Var x=townnodex40(ij,i),y=x
	If Abs(x)<0.1 Then
		If townnodelat40(ij,i)>-90 Then
			latlngtomxy(townnodelat40(ij,i),townnodelon40(ij,i),x,y)
		Else
			Return 0
		EndIf
	Else
		Return x
	EndIf
	If Abs(x-xweb)>150000 Or Abs(y-yweb)>150000 Then
		x=0:y=0
	EndIf
	If Abs(x)<0.11 Then
		if Abs(x)>0.05 Then x=0.2 Else x=0:y=0
	EndIf
	If Abs(y)<0.11 Then
		if Abs(y)>0.05 Then y=0.2 Else y=0:x=0
	EndIf
	townnodex40(ij,i)=x
	townnodey40(ij,i)=y
	Return x
End Function
Function gettownnodey40(ij As Integer,i As Integer)As Single 
	If knode40(ij,i)<>i Then Return 0
	Var y=townnodey40(ij,i),x=y
	If Abs(y)<0.5 Then
		If townnodelat40(ij,i)>-90 Then
			latlngtomxy(townnodelat40(ij,i),townnodelon40(ij,i),x,y)
		Else
			Return 0
		EndIf
	Else
		Return y
	EndIf
	If Abs(x-xweb)>150000 Or Abs(y-yweb)>150000 Then
		x=0:y=0
	EndIf
	If Abs(x)<0.11 Then
		if Abs(x)>0.05 Then x=0.2 Else x=0:y=0
	EndIf
	If Abs(y)<0.11 Then
		if Abs(y)>0.05 Then y=0.2 Else y=0:x=0
	EndIf
	townnodex40(ij,i)=x
	townnodey40(ij,i)=y
	Return y
End Function
Function getolditown40(id As int64)As Integer
Dim As Integer i 
If id=0 Then Return 0
For i=itown40 To 1 Step -1
	If townid40(i)=id Then Return i
Next
For i=ntown40 To itown40+1 Step -1
	If townid40(i)=id Then Return i
Next
Return 0
End Function
Function setitown40(id As int64)As Integer
Dim As Integer i,j
If id=0 Then Return 0
For i=itown40 To 1 Step -1
	If townid40(i)=id Then Return i
Next
For i=ntown40 To itown40+1 Step -1
	If townid40(i)=id Then Return i
Next
itown40+=1:If itown40>ntown40 Then itown40=1
Var ij=town40ij(itown40),iji=town40iji(itown40)
towni40(ij,iji)=-1
'towniwaynode(ij,iji)=min2(nwaynode-1,towniwaynode(ij,iji))
town40ij(itown40)=0:town40iji(itown40)=0
townid40(itown40)=id
townixy40(itown40)=0
For j=0 To n40
	knode40(itown40,j)=0
	townnodelat40(itown40,j)=-99
	townnodex40(itown40,j)=0
	townnodey40(itown40,j)=0
Next
Return itown40
End Function
Sub copytownopen(ByVal i As integer,ByVal j As integer,ByVal i2 As integer,ByVal j2 As Integer)
Dim As integer ii,jj,ij,ij2,n,p,ni
Dim As int64 id
Var dij=7*100/kscalex
   'For iix=-50+iix0 To iix0+50 Step dij
	'  For jjx=-50+jjx0 To jjx0+50 Step dij
	'	Var ij=Int((iix-iix0+50)/dij)*Int(101/dij)+Int((jjx-jjx0+50)/dij)
i50=int(25/dij):i101=i50+i50+1
If i2>-i50 And i2<i50 And j2>-i50 And j2<i50 Then
   	ij2=(i2+i50)*i101+j2+i50+1
   	ij2=max2(0,min2(ntown,ij2))
	   'townnwaynode2(ij)=townnwaynode(ij2)
	   n=min2(ntownnode,townnwaynode(ij2))
	   Var iii=0
	   If n>0 Then
	    /'Var tinitid=0
	    If Timer>timeinitid-1000 Then 
	     If Timer<timeinitid+5 Then
	    	tinitid=1
	     ElseIf Timer<timeinitid+20 And tiinitid Then
	    	tinitid=1
	     EndIf
	    EndIf '/  
	    For ii=1 To n'ntownnode
	      id=townwaynodeid(ij2,ii)
	      If id=0 Then Continue For 
	      ni=towniwaynode(ij2,ii)
	      If ni<2 Then Continue For
	      Var xij=(townwaynodex(ij2,ii,1)+townwaynodex(ij2,ii,ni))*0.5
	      Var yij=(townwaynodey(ij2,ii,1)+townwaynodey(ij2,ii,ni))*0.5
	      Var ij=gettownij(xij,yij)
	      If ij=0 Then Continue For  	
		   iii=max2(1,min2(ntownnode,townnwaynode2(ij)+1))
		   For p=1 To iii-1
		   	If id=townwaynodeid2(ij,p) Then
		   		copydoubles+=1
		   		Continue For,For
		   	EndIf
		   Next
	      'If tinitid=1 Then
	      '	If testinitid(id)=1 Then Continue For 
	      'EndIf
		   nbuilds+=1
		   townnwaynode2(ij)=iii		   
		   towniwaynode2(ij,iii)=towniwaynode(ij2,ii)
	   	townwaynodeid2(ij,iii)=townwaynodeid(ij2,ii)
	   	townwaynodeh2(ij,iii)=townwaynodeh(ij2,ii)
	   	townwaynodez2(ij,iii)=townwaynodez(ij2,ii)
 	   	townwaynodevie2(ij,iii)=townwaynodevie(ij2,ii)
 	   	townwaynodebuild2(ij,iii)=townwaynodebuild(ij2,ii)
	   	townwaynoder2(ij,iii)=townwaynoder(ij2,ii)
	   	townwaynodeg2(ij,iii)=townwaynodeg(ij2,ii)
	   	townwaynodeb2(ij,iii)=townwaynodeb(ij2,ii)
	   	townwayname2(ij,iii)=townwayname(ij2,ii)
	   	ttsetterrain2(ij,iii)=ttsetterrain(ij2,ii)
	   	townwaynodesize2(ij,iii)=townwaynodesize(ij2,ii)
	   	towni402(ij,iii)=towni40(ij2,ii)
         For jj=1 To min2(nwaynode,towniwaynode(ij2,ii))
	         townwaynodex2(ij,iii,jj)=townwaynodex(ij2,ii,jj)
	         townwaynodey2(ij,iii,jj)=townwaynodey(ij2,ii,jj)
	         townwaynodeo12(ij,iii,jj)=townwaynodeo1(ij2,ii,jj)
         Next
         If towniwaynode(ij2,ii)>=20 Then
         	If townwaynodeh(ij2,ii)>h40 Or townwaynodebuild(ij2,ii)=100 Then
         		ntown20+=1 
         	EndIf
         EndIf
	    Next ii
	   EndIf 
EndIf
End Sub
Sub copytownopen2(ByVal i As integer,ByVal j As integer,ByVal i2 As integer,ByVal j2 As integer)
Dim As integer ii,jj,ij,ij2,n
Var dij=7*100/kscalex
   'For iix=-50+iix0 To iix0+50 Step dij
	'  For jjx=-50+jjx0 To jjx0+50 Step dij
	'	Var ij=Int((iix-iix0+50)/dij)*Int(101/dij)+Int((jjx-jjx0+50)/dij)
i50=int(25/dij):i101=i50+i50+1
If i>-i50 And i<i50 And j>-i50 And j<i50 Then
   ij=(i+i50)*i101+j+i50+1
   ij=max2(0,min2(ntown,ij))
   If i2>-i50 And i2<i50 And j2>-i50 And j2<i50 Then
   	ij2=(i2+i50)*i101+j2+i50+1
   	ij2=max2(0,min2(ntown,ij2))
	   townnwaynode(ij)=townnwaynode2(ij2)
	   n=min2(ntownnode,townnwaynode2(ij2))
	   If n>0 Then 
	    For ii=1 To n'ntownnode
		   towniwaynode(ij,ii)=towniwaynode2(ij2,ii)
	   	townwaynodeid(ij,ii)=townwaynodeid2(ij2,ii)
	   	townwaynodeh(ij,ii)=townwaynodeh2(ij2,ii)
	   	townwaynodez(ij,ii)=townwaynodez2(ij2,ii)
 	   	townwaynodevie(ij,ii)=townwaynodevie2(ij2,ii)
 	   	townwaynodebuild(ij,ii)=townwaynodebuild2(ij2,ii)
	   	townwaynoder(ij,ii)=townwaynoder2(ij2,ii)
	   	townwaynodeg(ij,ii)=townwaynodeg2(ij2,ii)
	   	townwaynodeb(ij,ii)=townwaynodeb2(ij2,ii)
	   	townwayname(ij,ii)=townwayname2(ij2,ii)
	   	townwaynodesize(ij,ii)=townwaynodesize2(ij2,ii)
	   	towni40(ij,ii)=towni402(ij2,ii)
	   	ttsetterrain(ij,ii)=ttsetterrain2(ij2,ii)
         For jj=1 To min2(nwaynode,towniwaynode2(ij2,ii))
	         townwaynodex(ij,ii,jj)=townwaynodex2(ij2,ii,jj)
	         townwaynodey(ij,ii,jj)=townwaynodey2(ij2,ii,jj)
	         townwaynodeo1(ij,ii,jj)=townwaynodeo12(ij2,ii,jj)
         Next
         townnametype(ij,ii)=0
	    Next ii
	   EndIf 
   Else
	   townnwaynode(ij)=0
   EndIf 	
EndIf
End Sub
Sub copytown(i As integer,j As integer,i2 As integer,j2 As integer)
Dim As integer ii,jj,ij,ij2
Var dij=7*100/kscalex
   'For iix=-50+iix0 To iix0+50 Step dij
	'  For jjx=-50+jjx0 To jjx0+50 Step dij
	'	Var ij=Int((iix-iix0+50)/dij)*Int(101/dij)+Int((jjx-jjx0+50)/dij)
Var i50=int(25/dij),i101=i50+i50+1
If i>=-i50 And i<=i50 And j>=-i50 And j<=i50 Then
   ij=(i+i50)*i101+j+i50+1
   ij=max(0,min(ntown,ij))
   If i2>=-i50 And i2<=i50 And j2>=-i50 And j2<=i50 Then
   	ij2=(i2+i50)*i101+j2+i50+1
   	ij2=max(0,min(ntown,ij2))
   	towntype(ij)=towptype(ij2)
   	showtown(ij)=showtowp(ij2)
   	townntower(ij)=towpntower(ij2)
   	tmaptown(ij)=tmaptowp(ij2)
   	townx(ij)=towpx(ij2)
   	towny(ij)=towpy(ij2)
   	townz(ij)=towpz(ij2)
	   For ii=0 To 6
		 For jj=0 To 6
			townbuild(ij,ii,jj)=towpbuild(ij2,ii,jj)
			townh(ij,ii,jj)=towph(ij2,ii,jj)
			towndz(ij,ii,jj)=towpdz(ij2,ii,jj)
			towndx(ij,ii,jj)=towpdx(ij2,ii,jj)
			towndy(ij,ii,jj)=towpdy(ij2,ii,jj)
			townddx(ij,ii,jj)=towpddx(ij2,ii,jj)
			townddy(ij,ii,jj)=towpddy(ij2,ii,jj)
			townvie(ij,ii,jj)=towpvie(ij2,ii,jj)			
			townw(ij,ii,jj)=towpw(ij2,ii,jj)
			townwy(ij,ii,jj)=towpwy(ij2,ii,jj)
			towno1(ij,ii,jj)=towpo1(ij2,ii,jj)
		 Next
	   Next
   Else
   	towntype(ij)=0
   	showtown(ij)=0
   	townntower(ij)=0
   	tmaptown(ij)=0'-1
   	townx(ij)=towpx(ij)
   	towny(ij)=towpy(ij)
   	townz(ij)=-999999'towpz(ij)
 	   For ii=0 To 6
		 For jj=0 To 6
			townbuild(ij,ii,jj)=0
			townh(ij,ii,jj)=0
			towndz(ij,ii,jj)=-999999
			towno1(ij,ii,jj)=0
		 Next
		Next  
  EndIf 	
EndIf
End Sub
Sub copytowp(i As integer,j As integer,i2 As integer,j2 As integer)
Dim As integer ii,jj,ij,ij2
Var dij=7*100/kscalex
   'For iix=-50+iix0 To iix0+50 Step dij
	'  For jjx=-50+jjx0 To jjx0+50 Step dij
	'	Var ij=Int((iix-iix0+50)/dij)*Int(101/dij)+Int((jjx-jjx0+50)/dij)
Var i50=int(25/dij),i101=i50+i50+1
If i>=-i50 And i<=i50 And j>=-i50 And j<=i50 Then
   ij=(i+i50)*i101+j+i50+1
   ij=max(0,min(ntown,ij))
   If i2>=-i50 And i2<=i50 And j2>=-i50 And j2<=i50 Then
   	ij2=(i2+i50)*i101+j2+i50+1
   	ij2=max(0,min(ntown,ij2))
   	towptype(ij)=towntype(ij2)
   	showtowp(ij)=showtown(ij2)
   	towpntower(ij)=townntower(ij2)
   	tmaptowp(ij)=tmaptown(ij2)
   	towpx(ij)=townx(ij2)
   	towpy(ij)=towny(ij2)
   	towpz(ij)=townz(ij2)
	   For ii=0 To 6
		 For jj=0 To 6
			towpbuild(ij,ii,jj)=townbuild(ij2,ii,jj)
			towph(ij,ii,jj)=townh(ij2,ii,jj)
			towpdz(ij,ii,jj)=towndz(ij2,ii,jj)
			towpdx(ij,ii,jj)=towndx(ij2,ii,jj)
			towpdy(ij,ii,jj)=towndy(ij2,ii,jj)
			towpddx(ij,ii,jj)=townddx(ij2,ii,jj)
			towpddy(ij,ii,jj)=townddy(ij2,ii,jj)
			towpvie(ij,ii,jj)=townvie(ij2,ii,jj)			
			towpw(ij,ii,jj)=townw(ij2,ii,jj)
			towpwy(ij,ii,jj)=townwy(ij2,ii,jj)
			towpo1(ij,ii,jj)=towno1(ij2,ii,jj)
		 Next
	   Next
   Else
   	towptype(ij)=0
   	showtowp(ij)=0
   	towpntower(ij)=0
   	tmaptowp(ij)=0'-1
   	towpx(ij)=townx(ij)
   	towpy(ij)=towny(ij)
   	towpz(ij)=-999999'townz(ij)
 	   For ii=0 To 6
		 For jj=0 To 6
			towpbuild(ij,ii,jj)=0
			towph(ij,ii,jj)=0
			towpdz(ij,ii,jj)=0
			towpo1(ij,ii,jj)=0
		 Next
		Next  
  EndIf 	
EndIf
End Sub
Declare Sub drawtowps()
Declare Sub drawbridges()
Declare Sub drawfuel()
Declare Sub drawtownnode(ij As Integer)
Declare Sub drawtownnodes()
Dim Shared As Single kdistterrain=0.3,kdistterrainsave,dkdistterrain=1
Dim Shared As Double tdistterrain,tkdistterrain
Const As Integer nradar=30
Dim Shared As Single xradar(nradar),yradar(nradar),distradar=5000
Dim Shared As Integer iradar,typeradar(nradar),iradar0,iradar2,iradar20
Dim Shared As Integer testtownshow,testtownshow2
Dim Shared As Double ttownshow
Sub addradar(ByVal x As Single,ByVal y As Single,ByVal itype As Integer,testshow As Integer=0)
	If testtownshow=0 And testshow=0 Then Exit Sub 
	If iradar<nradar Then
		iradar+=1
		xradar(iradar)=x
		yradar(iradar)=y
		typeradar(iradar)=itype
		If testshow=0 Then iradar20=iradar:iradar2=iradar20
	ElseIf itype=4 Then 'fuel
			iradar2+=1:If iradar2>nradar Then iradar2=1
		   xradar(iradar2)=x
		   yradar(iradar2)=y
		   typeradar(iradar2)=itype
	EndIf
End Sub
Declare Sub copynearroad0()
Dim Shared As Integer itownij,jtownij
Dim Shared As Single scaleview=1,kdistterrain0=1,kdistterrain00=1,dfps=0,asktownlat=-99,asktownlon,kdistroad=1
Dim Shared As Single asktownlat2=-99,asktownlon2
Dim Shared As Double timesearchroad,timeautopilot
Sub drawtowns
'iradar=0
'If (Timer>tdistterrain+max(0.3,min(1.0,0.15*kfps))) Then
If (Timer>tdistterrain+max(0.1,min(0.5,0.15*kfps))) Then
	tdistterrain=Timer
	kdistterrain=kdistterrain0
	If fps<fpsmoy-4 Then fpsmoy=fps+1
	Var kk=6.0/max(3.0,minfps) 
	If fpsmoy<6+dfps And time2>tkdistterrain Then 
		kdistterrain=max(kk*0.050,kdistterrain*0.4)
	ElseIf fpsmoy<8+dfps And time2>tkdistterrain Then 
		kdistterrain=max(kk*0.070,kdistterrain*0.6)
	ElseIf fpsmoy<11+dfps And time2>tkdistterrain Then 
		kdistterrain=max(kk*0.10,kdistterrain*0.95)'0.85)
	ElseIf fpsmoy<17+dfps And time2>tkdistterrain Then 
		kdistterrain=max(kk*0.15,kdistterrain*0.97)
	ElseIf fpsmoy>21+dfps And (mz-mzsol0)>200 Then
		tkdistterrain=time2+3
		kdistterrain=min(kk*0.69,kdistterrain*1.015)'0.69
   ElseIf fpsmoy>21+dfps And (mz-mzsol0)<=200 Then 
		tkdistterrain=time2+3
		kdistterrain=min(kk*0.25,kdistterrain*1.015)'0.5
   ElseIf fpsmoy>30+dfps And (mz-mzsol0)<=200 Then 
		tkdistterrain=time2+3
		kdistterrain=min(kk*0.69,kdistterrain*1.015)'0.5
	EndIf
	If Abs(kdistterrain-kdistterrain0)>0.0001 Then
		If kdistterrain<kdistterrain0 Then
			dfps=minfps-6+3
		Else
			dfps=minfps-6-6
		EndIf
		dfps=minfps-7.5
		'If Abs(dfps-minfps+6)>0.001 Then dfps=0+minfps-6 Else dfps=1+minfps-6
	   If (kdistterrain-kdistterrain0)*(kdistterrain0-kdistterrain00)<0.00001 Then
	   	'kdistterrain+=(kdistterrain0-kdistterrain)*0.8
	   	dkdistterrain*=0.5
	   	If dkdistterrain<0.03 Then dkdistterrain=0.03
	   Else 
	   	dkdistterrain*=1.5
	   	If dkdistterrain>1 Then dkdistterrain=1
	   EndIf
	   kdistterrain+=(kdistterrain0-kdistterrain)*(1-dkdistterrain)
	   'auxvar=dkdistterrain:auxtest=0.2:auxvar2=kdistterrain	   
		kdistterrain00=kdistterrain0
	EndIf
	kdistterrain0=kdistterrain
	kdistroad=Sqr(kdistterrain/0.050)
EndIf
kdistterrain=scaleview*kdistterrain0
kdistterrainsave=kdistterrain
copynearroad0()
Var i60=60:If mz<mzsol00+100 Then i60=30
If inearroad<=i60 Then
	distnearroad=min(20000.0,distnearroad+1000)
ElseIf inearroad>i60+10 Then 
	distnearroad=max(2000.0,distnearroad-1000)
EndIf
If time2>timesearchroad+40 And tautopilot>0 Then
 If plane>0 And car>0 And time2>timeautopilot+3 Then
   Dim As Integer i,j
   Var dist=99999.0
   j=0
   For i=1 To inearroad
   	Var distxy=max(Abs(xnearroad(i)-mx),Abs(ynearroad(i)-my))
   	If distxy<dist Then
   		dist=distxy
   		j=i
   	EndIf
   Next
   If j>0 Then
   	o1=diro1(xnearroad(j)-mx,ynearroad(j)-my)
   EndIf
 EndIf   
EndIf
'If taglcompile=1 Then inearroad=0:inearroad2=0:inear0road=0
If topentown=1 And itownp=0 Then drawtowps():Exit Sub 
If tinittown>0 And (itownp=0 Or topentown=0) Then Exit Sub
drawtownnodes()
End Sub
Dim Shared As Integer isauterelle,taddsauterelle,iarbresauterelle(200),iarbresauterelle0,iarbrecigale0
Dim Shared As Single nsauterellex(200),nsauterelley(200),nsauterellez(200)
Sub addsauterelle(x As Single,y As Single,z As Single,iarbre As Integer=0)
	If isauterelle<200 Then
		nsauterellex(isauterelle)=x
		nsauterelley(isauterelle)=y
		nsauterellez(isauterelle)=z
		iarbresauterelle(isauterelle)=iarbre
		isauterelle+=1
	EndIf
End Sub
Dim Shared As Single o1show,xshow,yshow,wtempmin,sauterellex,sauterelley,sauterellez,cigalex,cigaley,cigalez
Dim Shared As Double to1show,dtsoundsauterelle,dttestcross
Dim Shared As Integer testposx0,tdttestcross,ishadow,ishadow0,tishadow,taddshadowtree,ishadowtree2,taddshadowquad
Dim Shared As Integer ishadowpanel,taddshadowpanel,taddshadowroc,trun,nshowtown,nshowbuild,nshowbuild0,nshowbuild1
Dim Shared As Single  shadowmx0,shadowmy0,shadowmz0
Dim Shared As String namenathalie,namenathalie0 
Dim Shared As Single distnathalie,nathaliex0,nathaliey0,nathaliex,nathaliey
Dim Shared As Double train,timeaddshadowtree,timeishadow,train2,tdrawroad
Dim Shared As uint agllist
Dim Shared As Single avgbuildh,navgbuildh,avgbuildh0
Dim Shared As Integer taglcompile2
Declare Sub subcopyshadow()
Declare Sub drawcigale()
Dim Shared As uint sauterelletext,sauterelletext2
Dim Shared As Double timesauterelle
Sub drawsauterelle
	'sauterellex=mx+100*cos1*cos1*cos1:sauterelley=my:sauterellez=mzsol00
	If tcigale=1 Then drawcigale:Exit Sub 
	If Abs(sauterellex-mx)<500 Then
	  If Abs(sauterelley-my)<500 Then
	    If iarbresauterelle0=0 Or arbrez(iarbresauterelle0)>-99990 Then 		
			If ((Int(time2*18)and 255)Mod 3)>0 Or time2<timesauterelle+0.2 Then
				glbindtexture(gl_texture_2d,sauterelletext)
			Else 
				glbindtexture(gl_texture_2d,sauterelletext2)
				If Rnd<0.03*kfps Then
					timesauterelle=time2+Rnd*1.5
				EndIf
			EndIf
         glenable gl_alpha_test
         glAlphaFunc(gl_less,2/254)
         Var r=0.1+Abs(sauterellex-mx)+Abs(sauterelley-my)
         Var co1=(sauterellex-mx)/r,si1=(sauterelley-my)/r
			glpushmatrix
			gltranslatef(sauterellex-16*co1,sauterelley-16*si1,mzsol00+10)
			glrotatef(o1+180,0,0,1)
			gltexcarre2(19,19)
			glpopmatrix
         gldisable gl_alpha_test
       EndIf   
	  EndIf
	EndIf
End Sub
Dim Shared As uint cigaletext,cigaletext2
Dim Shared As Double timecigale
Sub drawcigale
	cigalex=sauterellex:cigaley=sauterelley:cigalez=sauterellez
	iarbrecigale0=iarbresauterelle0
	'cigalex=mx+100*cos1*cos1*cos1:cigaley=my:cigalez=mzsol00
	If Abs(cigalex-mx)<500 Then
	  If Abs(cigaley-my)<500 Then
	    If iarbrecigale0=0 Or arbrez(iarbrecigale0)>-99990 Then 		
			If ((Int(time2*18)and 255)Mod 3)>0 Or time2<timecigale+0.2 Then
				glbindtexture(gl_texture_2d,cigaletext)
			Else 
				glbindtexture(gl_texture_2d,cigaletext2)
				If Rnd<0.03*kfps Then
					timecigale=time2+Rnd*1.5
				EndIf
			EndIf
         glenable gl_alpha_test
         glAlphaFunc(gl_less,2/254)
         Var r=0.1+Abs(cigalex-mx)+Abs(cigaley-my)
         Var co1=(cigalex-mx)/r,si1=(cigaley-my)/r
			glpushmatrix
			gltranslatef(cigalex-16*co1,cigaley-16*si1,mzsol00+10)
			glrotatef(o1+180,0,0,1)
			gltexcarre2(12,12)
			glpopmatrix
         gldisable gl_alpha_test
       EndIf   
	  EndIf
	EndIf
End Sub
Dim Shared As uint grillontext,grillontext2,grillontext0
Dim Shared As Double timegrillon
Dim Shared As Integer testgrillon,testtreegrillon=1
Dim Shared As Single grillonx,grillony,grillonz,grillonx1,grillony1,grillono1=1
Sub movegrillon()
Var dist=max(Abs(grillonx-mx),Abs(grillony-my))'+Abs(grillonz-mz)
If dist>2400 Or testgrillon=0 Or testtreegrillon>0 Then
	Var do1=Rnd*360
	grillonx1=mx+(1700+Rnd*700)*Cos(degtorad*do1)
	grillony1=my+(1700+Rnd*700)*Sin(degtorad*do1)
ElseIf Rnd<0.2 Then 
	grillonx1=grillonx+(Rnd-0.5)*16*cos1+Rnd*sin1*9*grillono1
	grillony1=grillony+(Rnd-0.5)*16*sin1-Rnd*cos1*9*grillono1
	If Rnd<0.05 Then grillono1=-grillono1
Else 	
	Exit Sub 
EndIf
Var testroadtree=gettestroadtree(grillonx1,grillony1)
If testroadtree<=0 Or testtreegrillon>0 Then'forest if testroadtree=-1
   testtreegrillon=testroadtree
   grillonx=grillonx1
   grillony=grillony1
   grillonz=getterrainheight(grillonx,grillony)
   dist=max(Abs(grillonx-mx),Abs(grillony-my))'+Abs(grillonz-mz)
   If dist<2400 And testroadtree<=0 Then
   	testgrillon=1
   	soundgrillon()
   Else
   	testgrillon=0
   EndIf
EndIf 		
End Sub
Sub drawgrillon
   If wtempmin<10 Or mz>mzsol00+2400 Then stopsoundgrillon():Exit Sub 
	If auxtest>0.21 Then
		grillonx=mx+50*cos1*cos1*cos1:grillony=my:grillonz=getterrainheight(grillonx,grillony)'mzsol00-20
	EndIf
   Var dist=max(Abs(grillonx-mx),Abs(grillony-my))
   dist=max(dist,Abs(grillonz-mz))
   Var kcos=1+0.6*(cos1*(grillonx-mx)+sin1*(grillony-my))/(1+dist)
   Var volgrillon=max(0.03,min(2.0,kcos*240/(120+dist)))
   'auxvar=dist:auxtest=0.2
   If dist>2500 Then
   	testgrillon=0
   	stopsoundgrillon()
   	movegrillon()
   Else
      mcisendstring("setaudio grillon volume to "+Str(Int(400*volgrillon)),0,0,0)
   EndIf 
	If Abs(grillonx-mx)<500 Then
	  If Abs(grillony-my)<500 Then
			If ((Int(time2*2)And 255)Mod 2)>0 Or time2<timegrillon+0.5 Then
				glbindtexture(gl_texture_2d,grillontext)
				If grillontext0<>grillontext Then movegrillon()
				grillontext0=grillontext
			Else 
				glbindtexture(gl_texture_2d,grillontext2)
				If grillontext0<>grillontext2 Then movegrillon()
				grillontext0=grillontext2
				If Rnd<0.03*kfps Then
					timegrillon=time2+Rnd*2
				EndIf
			EndIf
         glenable gl_alpha_test
         glAlphaFunc(gl_less,2/254)
			glpushmatrix
			gltranslatef(grillonx,grillony,grillonz+6)
			If grillono1>0.5 Then
				glrotatef(o1+180,0,0,1)
			Else 
				glrotatef(o1,0,0,1)
			EndIf
			gltexcarre2(6,5)
			glpopmatrix
         gldisable gl_alpha_test
	  EndIf
	EndIf
End Sub
Sub drawtownnodes()
Dim As Integer i,ii,jj,ix,jx
Dim As Single h,x,y,z,r
If time2>dttestcross Then
	dttestcross=time2+4'0.4
	tdttestcross=1
Else
	tdttestcross=0
EndIf
If (itime Mod 5)=1 Then 
If wtempmin>14 And mz<mzsol00+2400 Then'Or 1 Then
	soundsauterelle
	If time2>dtsoundsauterelle+0.4 Then
		dtsoundsauterelle=time2
		If taddsauterelle=1 And isauterelle>0 Then
			taddsauterelle=0
			i=Int(Rnd*isauterelle)
			sauterellex=nsauterellex(i)
			sauterelley=nsauterelley(i)
			sauterellez=nsauterellez(i)
			iarbresauterelle0=iarbresauterelle(i)
			tcigale=Int(Rnd*2)
		EndIf
		If auxtest>0.21 Then tcigale=1
		Var dist=max(Abs(sauterellex-mx),Abs(sauterelley-my))
		dist=max(dist,Abs(sauterellez-mz))
		If iarbresauterelle0>0 And arbrez(iarbresauterelle0)<-99990 Then dist+=9999
		If dist>2400 Or sauterellez<waterz+1 Then taddsauterelle=1:isauterelle=0
		Var kcos=1+0.6*(cos1*(sauterellex-mx)+sin1*(sauterelley-my))/(1+dist)
		Var volsauterelle=max(0.03,min(2.0,kcos*240/(120+dist)))
		'auxvar=dist:auxtest=0.2
	   If tcigale=0 Then
	   	mcisendstring("setaudio sauterelle volume to "+Str(Int(480*volsauterelle)),0,0,0)
	   Else 
	   	mcisendstring("setaudio cigale volume to "+Str(Int(380*volsauterelle)),0,0,0)
	   EndIf
	EndIf
Else
	stopsoundsauterelle
EndIf
If testivoyage()=0 And (trun>=0 Or plane>=0) And (tsoundarcade=1 Or plane=0 Or tradio=2) And (Timer>train2 Or trikku>=0) Then
	If tradio<>1 Then'plane>0 Then'And (time2<timesoundarcade+2099 Or tautopilot=0 Or car=0) Then
		If tradio=2 Then
			soundvoyage()
		elseIf arcadesound=0 Then
			soundarcade
		EndIf 	
		If yunasound=1 Then stopsoundyuna
	Else
		If arcadesound=1 Then stopsoundarcade
		If mynwater<190 Then
			If yunasound=0 Then soundyuna
		Else 
			If yunasound=1 Then stopsoundyuna
		EndIf 	
	EndIf 	
Else	
	If arcadesound=1 Then stopsoundarcade	
	If yunasound=1 Then stopsoundyuna
EndIf
/'If ((Abs(nathaliex-nathaliex0)+Abs(nathaliey-nathaliey0)>250) Or namenathalie<>namenathalie0) _   
   And namenathalie<>"" And textspeak="" Then
	If Timer>tspeak+35 Then 
	 If Rnd<0.3 Then
	 	textspeak="  i do love you "+namenathalie
	 ElseIf Rnd<0.5 Then 
	 	textspeak="  i love you so much "+namenathalie
	 Else
	 	textspeak="  you are so beautifull "+namenathalie
	 EndIf 	
    namenathalie0=namenathalie
    nathaliex0=nathaliex:nathaliey0=nathaliey
   EndIf 
EndIf '/
EndIf'itime  
distnathalie=250
If Abs(o1show-o1-to1)>0.3 Then
	o1show=o1+to1
	xshow=mx:yshow=my
	testposx0=0
	ttownshow=time2+0.45
	testtownshow=1
	'tishadow=1
	If tretroviseur=1 Then testtownshow2=1
Else
	testposx0=1
EndIf
If (time2>ttownshow Or Abs(xshow-mx)>180 Or Abs(yshow-my)>180)And scaleview>0.9 Then
	xshow=mx:yshow=my
	ttownshow=time2+5.5'0.195
	testtownshow=1
	If tretroviseur=1 Then testtownshow2=1
'ElseIf testtownshow=1 And (scaleview<0.9 Or tretroviseur=0)Then 
'	testtownshow=0
'ElseIf testtownshow2=1 And (scaleview>0.9 Or tretroviseur=0)Then  
'	testtownshow2=0
EndIf
Var d50000=50000.0
If plane=0 Or car>0 Then
	'd50000=min(120000.0,35000*kdistroad*kdistroad*kdistroad)
	d50000=min(150000.0,45000*kdistroad*kdistroad*kdistroad)
Else 
	'd50000=min(120000.0,50000*kdistroad*kdistroad)
	d50000=min(150000.0,60000*kdistroad*kdistroad*kdistroad)
EndIf
'auxvar=nshowbuild1+0.1:auxvar2=nshowbuild0+0.1:auxtest=0.7
'If nshowbuild0>90000 Then d50000*=0.7
'If nshowbuild0>30000 Then d50000*=0.7
'If nshowbuild0>10000 Then d50000*=0.7
'If nshowbuild0>3000 Then d50000*=0.7
nshowtown=0
nshowbuild=0
Var ij0=gettownij(mx+dmx0-d50000,my+dmy0-d50000)
Var i0=max2(-i50,min2(i50,itownij)),j0=max2(-i50,min2(i50,jtownij))
Var ij1=gettownij(mx+dmx0+d50000,my+dmy0+d50000)
var i1=max2(-i50,min2(i50,itownij)),j1=max2(-i50,min2(i50,jtownij))
'Var ij2=gettownij(mx+dmx0+d50000,my+dmy0-d50000)
'auxvar=i1-i0:auxvar2=j1-j0

'If taglcompile=1 Then auxvar=iagl+0.1:auxtest=0.3
taglcompile2+=1:If taglcompile2>(40+fpsmoy*2) Then taglcompile2=1
'If taglcompile2=1 Or taglcompile2=30 Then'Or taglcompile2=60 Then
'	taglcompile=1
'Else
'	taglcompile=0
'EndIf
If car>0 And Abs(mz-zcorrect)>5*kfps Then testcorrect=1
zcorrect=mz
If testtownshow=1 Or (Abs(tlayer0-tlayer)>0.01 And taglcompile2>2) Or testcorrect=1 Then
	If scaleview>0.9 Then'And taglcompile2>30 Then
	   'If testcorrect=1 Then auxvar+=1:auxtest=0.2
	   testcorrect=0
		'taglcompile=1
		taglcompile2=1
	EndIf
EndIf 
'taglcompile=1
If taglcompile=1 Then aglreset()
If taglcompile2=1 Then
	inearroad=0:inearroad2=0:inear0road=0
   tlayer0=tlayer 
   'If timer>timelayer-0.3 Then'+0.18 Then'+0.102*kfps Then
   '	If tlayer>0.4 or tlayer2>0.4 Then tlayer=0:tlayer2=0
   'EndIf 
   /'if time2>timelayer+0.5 then 
   	if tlayer<-0.4 And tlayer2<-0.4 Then
   		tlayer=0:timelayer=time2
   		tlayer2=0
   	'Elseif tlayer>-0.4 and tlayer2<-0.4 Then
   	'	tlayer=-1:timelayer=time2
   	EndIf 	
   	'tlayer2=0
   EndIf '/
EndIf
If tdark=1 Then
	glenable(gl_lighting)
	glenable gl_normalize
Else
	gldisable(gl_lighting)
	'gldisable gl_normalize
EndIf

'$$auxvar=tlayer+0.01:auxvar2=tlayer2+0.01:auxvar3=tlayer0+0.01:auxtest=0.2 

taddshadowquad=0
If scaleview>0.9 And testposx0=1 And taglcompile2=1 Then 
 If testtownshow=1 Then
 	iradar0=iradar
	iradar=0
   If iradar0>=nradar Then distradar=max(1000.0,distradar-100)
 	If iradar0<nradar*0.75 Then distradar=min(7000.0,distradar+100) 
	tishadow=1 
   If time2>timeishadow+2 And mz<mzsol00+1400 Then 
   	timeishadow=time2 
   	ishadow=0
   	tishadow=0
   	taddshadowquad=1
   EndIf
 EndIf
EndIf
If scaleview>0.9 And time2>timeaddshadowtree+2 And taglcompile2=1 Then
	timeaddshadowtree=time2
	taddshadowtree=1
	ishadowtree2=0
	taddshadowpanel=1
	ishadowpanel=0  
	taddshadowroc=1
	ishadowroc=0
Else
	taddshadowtree=0
	taddshadowpanel=0
	taddshadowroc=0
EndIf

If taglcompile2=1 Then
   glnewlist agllist,gl_compile_and_execute
EndIf

If taglcompile=1 Or taglcompile2=1 Or scaleview<0.9 Then

avgbuildh0=avgbuildh
avgbuildh=0:navgbuildh=1

If mz>mzsol0+200 Then 
For i=1 To ntown2
	drawtownnode(i)
Next

Else'If taglcompile<=1 Then   
	
If Abs(sin1)>Abs(cos1) Then 
 If sin1>0 Then 	
  If cos1>0 Then 
   For ii=i0-1 To i1 Step -1'=>y
    For jj=j0+1 To j1 '=>x
     i=(ii+i50)*i101+jj+i50+1
     If i>0 And i<ntown2 Then 
      'showtown(i)=0
      drawtownnode(i)
     EndIf  
    Next jj 
   Next ii
  Else
   For ii=i0-1 To i1 Step -1'=>y
    For jj=j1-1 To j0 Step -1 '=>x
     i=(ii+i50)*i101+jj+i50+1
     If i>0 And i<ntown2 Then 
      'showtown(i)=0
      drawtownnode(i)
     EndIf  
    Next jj 
   Next ii
  EndIf 	
 Else
  If cos1>0 Then 	
   For ii=i1+1 To i0 Step 1
    For jj=j0+1 To j1
     i=(ii+i50)*i101+jj+i50+1
     If i>0 And i<ntown2 Then 
      'showtown(i)=0
      drawtownnode(i)
     EndIf  
    Next jj 
   Next ii
  Else
   For ii=i1+1 To i0 Step 1
    For jj=j1-1 To j0 Step -1
     i=(ii+i50)*i101+jj+i50+1
     If i>0 And i<ntown2 Then 
      'showtown(i)=0
      drawtownnode(i)
     EndIf  
    Next jj 
   Next ii
  EndIf 	
 EndIf 	
Else
 If cos1>0 Then
  If sin1>0 Then 	
   For jj=j0+1 To j1
    For ii=i0-1 To i1 Step -1
     i=(ii+i50)*i101+jj+i50+1
     If i>0 And i<ntown2 Then 
      'showtown(i)=0
      drawtownnode(i)
     EndIf  
    Next ii 
   Next jj
  Else
   For jj=j0+1 To j1
    For ii=i1+1 To i0 Step 1
     i=(ii+i50)*i101+jj+i50+1
     If i>0 And i<ntown2 Then 
      'showtown(i)=0
      drawtownnode(i)
     EndIf  
    Next ii 
   Next jj
  EndIf 	
 Else
  If sin1>0 Then 	
   For jj=j1-1 To j0 Step -1
    For ii=i0-1 To i1 Step -1
     i=(ii+i50)*i101+jj+i50+1
     If i>0 And i<ntown2 Then 
      'showtown(i)=0
      drawtownnode(i)
     EndIf  
    Next ii 
   Next jj
  Else
   For jj=j1-1 To j0 Step -1
    For ii=i1+1 To i0 Step 1
     i=(ii+i50)*i101+jj+i50+1
     If i>0 And i<ntown2 Then 
      'showtown(i)=0
      drawtownnode(i)
     EndIf  
    Next ii 
   Next jj
  EndIf 	
 EndIf 	
EndIf  

EndIf 'test 

avgbuildh=avgbuildh/navgbuildh
EndIf 'tagl

If taglcompile2=1 Then
	glendlist()
EndIf 
If agllist<>0 And taglcompile2<>1 Then glcalllist(agllist)    

If taglcompile=19999 then
	aglpushmatrix
	agltranslatef(mx+800*cos1,my+800*sin1,mz)
	agltexsphere 300
	aglpopmatrix
EndIf 	

If 0 Then'taglcompile>=1 Then
	aglexecute()
EndIf
'gldisable(gl_lighting)
'gldisable(gl_normalize) 
'gldisable gl_blend
'gldisable gl_fog
'gldisable gl_alpha_test      
 
If testtownshow=1 And scaleview>0.9 Then
	nshowbuild0+=(nshowbuild-nshowbuild0)*0.3
EndIf
If testtownshow=0 And scaleview>0.9 Then
	nshowbuild1+=(nshowbuild-nshowbuild1)*0.3
EndIf

If testtownshow=1 And (scaleview>0.9)Then 
	testtownshow=0
ElseIf testtownshow2=1 And (scaleview<0.9)Then  
	testtownshow2=0
EndIf
 
 
/'If 0 And tmaptown(i)>0 Then 	
 If Abs(townx(i)-mx-dmx0)<dxterrain*scalex*kdistterrain Then'30000 Then
  If Abs(towny(i)-my-dmy0)<dxterrain*scalex*kdistterrain And townz(i)>waterz Then'30000 Then
   rotavion(townx(i)-mx-dmx0,towny(i)-my-dmy0,townz(i)-mz)
   If x2>(Abs(y2)-8600) Or mapdisplay>=4 Then
    'Var dx=(i Mod 2)*200,dy=-(i Mod 3)*110
    'showtown(i)=1	
    For ii=0 To 6
     For jj=0 To 6
      If townbuild(i,ii,jj)>0 Then    	
         x=towndx(i,ii,jj)+townddx(i,ii,jj)-dmx0'+dx
         y=towndy(i,ii,jj)+townddy(i,ii,jj)-dmy0'+dy
         z=towndz(i,ii,jj)
         h=townh(i,ii,jj)
         h=setbuildh(h)
         rotavion(x-mx,y-my,z-mz)
         If x2>(Abs(y2)-h*1.4-400-600) And z>waterz And h>1 Then
    	      showtown(i)=1
    	      /'r=210
    	      If Abs(x-mx)<r Then
         	 	If Abs(y-my)<r Then
    	      		If Abs(z-mz)<(h+10) Then 
                    mx -= cos1 *(10)*kfps
                    my -= sin1 *(10)*kfps
                    If plane=1 Then
                    	  mx-=cos1*v*2*kfps
                    	  my-=sin1*v*2*kfps
                    	  o1+=(Rnd-0.5)*140
                    	  testcrash
                    EndIf
    	 		      EndIf
         	 	EndIf
    	      EndIf '/
            If townvie(i,ii,jj)<0 Then 
               glcolor3f(1,0,0)
            Else 
            	If townbuild(i,ii,jj)=11 Then
            	   glcolor3f(0,0.6,1)
            	ElseIf townbuild(i,ii,jj)=6 And h>200 Then
            	   glcolor3f(0.2,1,0.7)
            	ElseIf townbuild(i,ii,jj)>=10 Then
            	   glcolor3f(1,0,0)
            	   h=400
            	ElseIf townbuild(i,ii,jj)>=4 Then
            	   glcolor3f(0.85,1,1)
            	ElseIf townbuild(i,ii,jj)=3 And h>200 Then
            	   glcolor3f(0,1,1)
            	Else	
            		glcolor3f(1,1,1)
            	EndIf
            EndIf
         	glpushmatrix
         	gltranslatef(x,y,z)
         	'glsphere(400)
         	Var h200=max(200,h*0.075)
         	h200=max(h200,townw(i,ii,jj))
         	Var hy200=max(200,h*0.075)
         	hy200=max(hy200,townwy(i,ii,jj))
         	Var do1=towno1(i,ii,jj)
         	If Abs(do1)>1 Then
	       	  glrotatef(do1-45,0,0,1)
	       	  'glrotatef(do1,0,0,1)
         	EndIf
           	If townbuild(i,ii,jj)=16 Then
           		drawhospital(h,h200,hy200,townvie(i,ii,jj),x2) 
           	ElseIf townbuild(i,ii,jj)=15 Then
           		drawrailstation(h,h200,hy200,townvie(i,ii,jj),x2) 
           	ElseIf townbuild(i,ii,jj)=14 Then
           		drawofficial(h,h200,hy200,townvie(i,ii,jj),x) 
           	ElseIf townbuild(i,ii,jj)=13 Then
           		drawshop(h,h200,hy200,townvie(i,ii,jj),x2) 
           	ElseIf townbuild(i,ii,jj)<>12 Then
           		drawbuilding1(h,h200,hy200,townvie(i,ii,jj),x2) 
           	Else 
           		drawchurch(h,h200,hy200,townvie(i,ii,jj),x2) 
           	EndIf
         	glpopmatrix
         EndIf 
      EndIf    
     Next jj
    Next ii
   EndIf  
  EndIf
 EndIf
 EndIf'/
End Sub 
Sub drawtowps
If tinittown>0 And itownp=1 Then Exit Sub 
drawtownnodes()
Exit Sub 
Dim As Integer i,ii,jj
Dim As Single h,x,y,z,r
Var d50000=50000.0:If plane=0 Or car>0 Then d50000=18000
Var ij0=gettownij(mx+dmx0-d50000,my+dmy0-d50000)
Var i0=max2(-i50,min2(i50,itownij)),j0=max2(-i50,min2(i50,jtownij))
Var ij1=gettownij(mx+dmx0+d50000,my+dmy0+d50000)
Var i1=max2(-i50,min2(i50,itownij)),j1=max2(-i50,min2(i50,jtownij))
'For i=1 To ntowp2
For ii=i0 To i1 Step -1
 For jj=j0 To j1
  i=(ii+i50)*i101+jj+i50+1
  If i>0 And i<ntowp2 Then 
   'showtowp(i)=0
   drawtownnode(i)
  EndIf 
 /'If 0 And tmaptowp(i)>0 Then 	
 If Abs(towpx(i)-mx-dmx0)<dxterrain*scalex*kdistterrain Then'30000 Then
  If Abs(towpy(i)-my-dmy0)<dxterrain*scalex*kdistterrain and towpz(i)>waterz Then'30000 Then
   rotavion(towpx(i)-mx-dmx0,towpy(i)-my-dmy0,towpz(i)-mz)
   If x2>(Abs(y2)-8600) Or mapdisplay>=4  Then
    'showtowp(i)=1	
    'Var dx=(i Mod 2)*200,dy=-(i Mod 3)*110	
    For ii=0 To 6
     For jj=0 To 6
      If towpbuild(i,ii,jj)>0 Then    	
         x=towpdx(i,ii,jj)+towpddx(i,ii,jj)-dmx0'+dx
         y=towpdy(i,ii,jj)+towpddy(i,ii,jj)-dmy0'+dy
         z=towpdz(i,ii,jj)
         h=towph(i,ii,jj)
         h=setbuildh(h)
         rotavion(x-mx,y-my,z-mz)
         If x2>(Abs(y2)-h*1.4-400-600) And z>waterz And h>1 Then
    	      showtowp(i)=1
    	      /'r=210
    	      If Abs(x-mx)<r Then
         	 	If Abs(y-my)<r Then
    	      		If Abs(z-mz)<(h+10) Then 
                    mx -= cos1 *(10)*kfps
                    my -= sin1 *(10)*kfps
                    If plane=1 Then
                    	  mx-=cos1*v*2*kfps
                    	  my-=sin1*v*2*kfps
                    	  o1+=(Rnd-0.5)*140
                    	  testcrash
                    EndIf
    	 		      EndIf
         	 	EndIf
    	      EndIf '/
            If towpvie(i,ii,jj)<0 Then 
               glcolor3f(1,0,0)
            Else 
            	If towpbuild(i,ii,jj)=11 Then
            	   glcolor3f(0,0.6,1)
            	ElseIf towpbuild(i,ii,jj)=6 And h>200 Then
            	   glcolor3f(0.2,1,0.7)
            	ElseIf towpbuild(i,ii,jj)>=10 Then
            	   glcolor3f(1,0,0)
            	   h=400
            	ElseIf towpbuild(i,ii,jj)>=4 Then
            	   glcolor3f(0.85,1,1)
            	ElseIf towpbuild(i,ii,jj)=3 And h>200 Then
            	   glcolor3f(0,1,1)
            	Else	
            		glcolor3f(1,1,1)
            	EndIf
            EndIf
         	glpushmatrix
         	gltranslatef(x,y,z)
         	'glsphere(400)
         	Var h200=max(200,h*0.075)
         	h200=max(h200,towpw(i,ii,jj))
         	Var hy200=max(200,h*0.075)
         	hy200=max(hy200,towpwy(i,ii,jj))
         	Var do1=towpo1(i,ii,jj)
         	If Abs(do1)>1 Then
	       	  glrotatef(do1-45,0,0,1)
	       	  'glrotatef(do1,0,0,1)
         	EndIf         	
           	If towpbuild(i,ii,jj)=16 Then
           		drawhospital(h,h200,hy200,towpvie(i,ii,jj),x2) 
           	ElseIf towpbuild(i,ii,jj)=15 Then
           		drawrailstation(h,h200,hy200,towpvie(i,ii,jj),x2) 
           	ElseIf towpbuild(i,ii,jj)=14 Then
           		drawofficial(h,h200,hy200,towpvie(i,ii,jj),x) 
           	ElseIf towpbuild(i,ii,jj)=13 Then
           		drawshop(h,h200,hy200,towpvie(i,ii,jj),x2) 
           	ElseIf towpbuild(i,ii,jj)<>12 Then
           		drawbuilding1(h,h200,hy200,towpvie(i,ii,jj),x2) 
           	Else 
           		drawchurch(h,h200,hy200,towpvie(i,ii,jj),x2) 
           	EndIf
         	glpopmatrix
         EndIf 
      EndIf    
     Next jj
    Next ii
   EndIf  
  EndIf
 EndIf
 EndIf'/
 Next jj 
Next ii 
End Sub 
Dim Shared As Integer wclouds,wfog=30000,whumidity=50
Sub setfog()
Dim As Single dfog=120000,dfog2=121000,scale=1.0
Dim fogcolor(0 to 3) as single => {0.72,0.72,0.72, 1.0}
glFogi(GL_FOG_MODE, gl_linear)
glFogfv(GL_FOG_COLOR, @fogcolor(0))
glFogf(GL_FOG_DENSITY, 1.0)
glHint(GL_FOG_HINT, gl_nicest)'GL_DONT_CARE)
Var ifog1=ifog
If ifog=21 Then ifog1=max2(0,min2(20,Int(40000/(1000+wfog))))
If ifog=22 Then ifog1=max2(0,min2(20,Int(120000/(1000+wfog))))
'guinotice "ifog="+Str(ifog1)+" / visibility="+Str(wfog)
If ifog1=0 Then	dfog=120000
If ifog1=1 Then	dfog=70000
If ifog1=2 Then	dfog=60000
If ifog1=3 Then	dfog=50000
If ifog1=4 Then	dfog=40000
If ifog1=5 Then	dfog=30000
If ifog1=6 Then	dfog=20000
If ifog1=7 Then	dfog=12000
If ifog1=8 Then	dfog=7000
If ifog1=9 Then	dfog=2000
If ifog1=10 Then dfog=400:dfog2=95000
If ifog1=11 Then dfog=100:dfog2=65000
If ifog1=12 Then dfog=100:dfog2=50000
If ifog1=13 Then dfog=100:dfog2=40000
If ifog1=14 Then dfog=100:dfog2=30000
If ifog1=15 Then dfog=100:dfog2=20000
If ifog1=16 Then dfog=80:dfog2=19000
If ifog1=17 Then dfog=60:dfog2=18000
If ifog1=18 Then dfog=40:dfog2=17000
If ifog1=19 Then dfog=15:dfog2=17000
If ifog1=20 Then dfog=5:dfog2=17000
If tsphere=1 Then scale=2*(mz-waterz0+100000)/130000
glFogf(GL_FOG_START, dfog*scale)
glFogf(GL_FOG_END, dfog2*scale)
If tdark=0 Then glEnable(GL_FOG)
if planet=1 then gldisable(gl_fog)
End Sub
Dim Shared As uint domelist,distdome=25000
Dim Shared As Integer ndome=1'30'70
Dim Shared As Single domex(ndome),domey(ndome),domez(ndome),domer(ndome)
Dim Shared As Integer dometype(ndome),showdome(ndome)
Dim Shared As Single domevie(ndome),domevie0(ndome)
Sub drawdomes
Exit Sub 	
Dim As Integer i,ii
Dim As Single r
'glEnable GL_BLEND
'glBlendFunc GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA
gldisable(gl_texture_2d)
glenable(gl_lighting)
ii=max2(5,200000/(10000+mz))
For i=1 To ndome
 showdome(i)=0	
 If Abs(domex(i)-mx)<10000 Then
  If Abs(domey(i)-my)<10000 Then
    rotavion(domex(i)-mx,domey(i)-my,domez(i)-mz)
    If x2>(Abs(y2)-500) And domez(i)>waterz Then
    	 showdome(i)=1
    	 r=domer(i)+10
    	 If Abs(x2)<r Then
    	 	If Abs(y2)<r Then
    	 		If Abs(z2)<r Then 
               mx -= cos1 *(10)*kfps
               my -= sin1 *(10)*kfps
               If plane=1 Then testcrash
    	 		EndIf
    	 	EndIf
    	 EndIf
       glpushmatrix
       If dometype(i)=0 Then
         gltranslatef(domex(i),domey(i),domez(i))
         If domevie(i)>0 Then 
         	glcolor3f(0,1,1)
         Else
         	glcolor3f(0.9,0.15,0.1)
         EndIf
         If scalexy>1.1 Then glscalef(1,1,scalexy)
       	glsphere(100,ii,ii)
       Else
         gltranslatef(domex(i),domey(i),domez(i)-74)
       	glcolor3f(0.5,0.6,0.6)
         If scalexy>1.1 Then glscalef(1,1,scalexy)
      	glcylindre(35,15,94,ii,ii)
       	gltranslatef(0,0,124)
         If domevie(i)>0 Then
         	glcolor3f(0,1,1)
         Else
         	glcolor3f(0.9,0.15,0.1)
         EndIf
       	glsphere(42,ii,ii)
       EndIf
       glpopmatrix
    EndIf 
  EndIf 
 EndIf  
Next i
glcolor3f(1,1,1)
'gldisable gl_blend
End Sub
Sub initdomes
Dim As Integer i	
	ndome=0
	Randomize((imap-1)*100)
	distdome=30000
	For i=1 To ndome
	  dometype(i)=0
	  domer(i)=100	
	  If Rnd>0.35 Then dometype(i)=1:domer(i)=50	
     domex(i)=(Rnd-0.5)*2*distdome
     domey(i)=(Rnd-0.5)*2*distdome
     If dometype(i)=0 Then
        domevie0(i)=400
     	  domez(i)=getterrainheight(domex(i),domey(i))
     	  If domez(i)>(waterz+0.01) Then domez(i)+=58.5 Else domez(i)=waterz-1
     Else
     	  domevie0(i)=200
     	  domez(i)=getterrainheight(domex(i),domey(i))
     	  If domez(i)>(waterz+0.01) Then domez(i)+=68.5 Else domez(i)=waterz-1
     EndIf
     domevie(i)=domevie0(i)
  	  If testairport(domex(i),domey(i),2500,200)=1 Then
  	    	domez(i)=waterz0-1 
  	  EndIf
	Next
End Sub
Dim Shared As Integer nairport=800,nairport2,airporttype(nairport)
Dim Shared As Integer showairport(nairport),airportntower(nairport)
Dim Shared As Single  airportx(nairport),airporty(nairport),airportz(nairport)
Dim Shared As Single  airportix(nairport),airportiy(nairport)
Dim Shared As Single  airportr(nairport),airportvie(nairport,3)
Declare Sub setairportz(iairport As Integer)
Sub drawairports
Dim As Integer i,ii,itower
Dim As Single r,x,y
ii=max2(5,200000/(10000+mz))
For i=1 To nairport2
 showairport(i)=0	
 If Abs(airportx(i)-mx-dmx0)<dxterrain*scalex Then'30000 Then
  If Abs(airporty(i)-my-dmy0)<dxterrain*scalex Then'30000 Then
   For itower=1 To airportntower(i)
    x=airportx(i)-dmx0
    y=airporty(i)-dmy0-(itower-1)*470
    rotavion(x-mx,y-my,airportz(i)-mz)
    If x2>(Abs(y2)-2000) Then
    	 showairport(i)=1
    	 r=airportr(i)+10
    	 If Abs(x2)<r Then
    	 	If Abs(y2)<r Then
    	 		If Abs(z2)<r Then 
               mx -= cos1 *(10)*kfps
               my -= sin1 *(10)*kfps
               If plane=1 Then testcrash
    	 		EndIf
    	 	EndIf
    	 EndIf
    	 setairportz(i)
       glpushmatrix
       gldisable(gl_texture_2d)
       'glenable(gl_lighting)
       If airporttype(i)=2 Or airporttype(i)=4 Or airporttype(i)=7 Then
         gltranslatef(x,y,airportz(i))
         If airportvie(i,itower)>0 Then 
         	glcolor3f(0,1,1)
         Else
         	glcolor3f(0.9,0.15,0.1)
         EndIf
         If scalexy>1.1 Then glscalef(1,1,scalexy)
       	glsphere(100,ii,ii) 'dome
       Else 	
         gltranslatef(x,y,airportz(i)-74)
         glcolor3f(0.5,0.6,0.6)
         If scalexy>1.1 Then glscalef(1,1,scalexy)
         glcylindre(35,15,94,ii,ii)
         gltranslatef(0,0,124)
         If airportvie(i,itower)>0 Then
        	  glcolor3f(0,1,1)
         Else
        	  glcolor3f(0.9,0.15,0.1)
         EndIf
         If scalexy>1.1 Then glscalef(1,1,scalexy)
         glsphere(42,ii,ii) 'tower
       EndIf   
       gldisable(gl_lighting)
       glcolor3f(1,1,1)
       glenable(gl_texture_2d)
       glbindtexture(gl_texture_2d,pistetext)	
       If airporttype(i)=3 Then 'tower 3pistes
           gltranslatef(0,-240,-67+74-124+(mz-mzsol0)*20/(3000+mz-mzsol0))
       	  gltexcarre5(2000,200,-1)
       	  gltranslatef(0,-470,0)
       	  gltexcarre5(2000,200,-1)
       	  gltranslatef(0,-470,0)
       	  gltexcarre5(2000,200,-1)
       ElseIf airporttype(i)=4 Then 'dome 3pistes
       	  gltranslatef(0,-290,-57+(mz-mzsol0)*20/(3000+mz-mzsol0))
       	  gltexcarre5(2000,200,-1)
       	  gltranslatef(0,-470,0)
       	  gltexcarre5(2000,200,-1)
       	  gltranslatef(0,-470,0)
       	  gltexcarre5(2000,200,-1)         	
       ElseIf airporttype(i)=2 Then 'dome 1piste
       	  gltranslatef(0,-290,-57+(mz-mzsol0)*20/(3000+mz-mzsol0))
       	  gltexcarre5(2000,200,-1)
       ElseIf airporttype(i)=6 Then 'tower 2pistes cross
       	  gltranslatef(0,-240,1-67+74-124+(mz-mzsol0)*20/(3000+mz-mzsol0))
       	  gltexcarre5(2000,200,-1)
       	  gltranslatef(400,0,-1)
       	  glrotatef(90,0,0,1)
       	  gltexcarre5(2000,200,-1)
       ElseIf airporttype(i)=7 Then 'dome 2pistes cross
       	  gltranslatef(0,-290,1-57+(mz-mzsol0)*20/(3000+mz-mzsol0))
       	  gltexcarre5(2000,200,-1)
       	  gltranslatef(400,0,-1)
       	  glrotatef(90,0,0,1)
       	  gltexcarre5(2000,200,-1)
       Else
       	  gltranslatef(0,-240,-67+74-124+(mz-mzsol0)*20/(3000+mz-mzsol0))
       	  gltexcarre5(2000,200,-1)
       EndIf   
       glpopmatrix
    EndIf
   Next itower 
  EndIf 
 EndIf  
Next i
glcolor3f(1,1,1)
'gldisable gl_blend
End Sub
Function testairport(ByVal x As Single,ByVal y As Single, _   
	                  dxx As Single=2500,dyy As Single=120) As Integer
Dim As Integer i
Dim As Single dx,dy
For i=1 To nairport2
	If Abs(airportx(i)-dmx0-x)<2500 Then
	  If Abs(airporty(i)-dmy0-y)<2500 Then 	
		Select Case airporttype(i)
        Case 3,5 
         dx=airportx(i)-dmx0-x			
       	If Abs(dx)<dxx Then
            dy=airporty(i)-dmy0-y-240
         	If Abs(dy)<dyy Then Return 1
         	dy-=470
           	If Abs(dy)<dyy Then Return 1
       	   dy-=470
       	   If Abs(dy)<dyy Then Return 1
       	EndIf    
			Case 4
         dx=airportx(i)-dmx0-x			
       	If Abs(dx)<dxx Then
            dy=airporty(i)-dmy0-y-290
         	If Abs(dy)<dyy Then Return 1
         	dy-=470
           	If Abs(dy)<dyy Then Return 1
       	   dy-=470
       	   If Abs(dy)<dyy Then Return 1
       	EndIf    
			Case 2 
         dx=airportx(i)-dmx0-x			
       	If Abs(dx)<dxx Then
            dy=airporty(i)-dmy0-y-290
         	If Abs(dy)<dyy Then Return 1
       	EndIf 			
			Case 6 'tower+cross
         dx=airportx(i)-dmx0-x			
       	If Abs(dx)<dxx Then
            dy=airporty(i)-dmy0-y-240
         	If Abs(dy)<dyy Then Return 1
		   EndIf 
         dx=airportx(i)+400-dmx0-x
       	If Abs(dx)<dyy Then
            dy=airporty(i)-dmy0-y-240
         	If Abs(dy)<dxx Then Return 1
		   EndIf 
			Case 7 'dome+cross
         dx=airportx(i)-dmx0-x			
       	If Abs(dx)<dxx Then
            dy=airporty(i)-dmy0-y-290
         	If Abs(dy)<dyy Then Return 1
		   EndIf 
         dx=airportx(i)+400-dmx0-x
       	If Abs(dx)<dyy Then
            dy=airporty(i)-dmy0-y-290
         	If Abs(dy)<dxx Then Return 1
		   EndIf 
			Case Else 
         dx=airportx(i)-dmx0-x			
       	If Abs(dx)<dxx Then
            dy=airporty(i)-dmy0-y-240
         	If Abs(dy)<dyy Then Return 1
		   EndIf 
		End Select 
	  EndIf 	
	EndIf
Next i
Return 0
End Function
Function mytestairport() As Integer
Dim As Integer i
Dim As Single dx,dy
If (mz-mzsol0)>1 Then Return 0
For i=1 To nairport2
	If showairport(i)=1 Then 
		Select Case airporttype(i)
			Case 3,5 
         dx=airportx(i)-dmx0-mx			
       	If Abs(dx)<1000 Then
            dy=airporty(i)-dmy0-my-240
         	If Abs(dy)<100 Then Return 1
         	dy-=470
           	If Abs(dy)<100 Then Return 1
       	   dy-=470
       	   If Abs(dy)<100 Then Return 1
       	EndIf    
			Case 4
         dx=airportx(i)-dmx0-mx			
       	If Abs(dx)<1000 Then
            dy=airporty(i)-dmy0-my-290
         	If Abs(dy)<100 Then Return 1
         	dy-=470
           	If Abs(dy)<100 Then Return 1
       	   dy-=470
       	   If Abs(dy)<100 Then Return 1
       	EndIf    
			Case 6 'tower+cross
         dx=airportx(i)-dmx0-mx			
       	If Abs(dx)<1000 Then
            dy=airporty(i)-dmy0-my-240
         	If Abs(dy)<100 Then Return 1
		   EndIf 
         dx=airportx(i)+400-dmx0-mx
       	If Abs(dx)<100 Then
            dy=airporty(i)-dmy0-my-240
         	If Abs(dy)<1000 Then Return 1
		   EndIf 
			Case 7 'dome+cross
         dx=airportx(i)-dmx0-mx			
       	If Abs(dx)<1000 Then
            dy=airporty(i)-dmy0-my-290
         	If Abs(dy)<100 Then Return 1
		   EndIf 
         dx=airportx(i)+400-dmx0-mx
       	If Abs(dx)<100 Then
            dy=airporty(i)-dmy0-my-290
         	If Abs(dy)<1000 Then Return 1
		   EndIf 
			Case Else
         dx=airportx(i)-dmx0-mx			
       	If Abs(dx)<1000 Then
            dy=airporty(i)-dmy0-my-240
         	If Abs(dy)<100 Then Return 1
		   EndIf 
		End Select 
	EndIf
Next i
Return 0
End Function
Dim Shared As uint carlist
Dim Shared As Single carx,cary,carz,cursorx,cursory,cursorz,cursorx0,cursory0,cursorz0
Sub glsetcursor0(ByVal x As Single,ByVal y As Single,ByVal z As Single=0)
	cursorx0=x:cursory0=y:cursorz0=z
End Sub
Sub glplacecursor(ByVal x0 As Single,ByVal y0 As Single,ByVal z0 As Single=-40,ByVal scale As Single=1)
   glLoadIdentity()
   Var x=x0+cursorx0,y=y0+cursory0,z=z0+cursorz0
   If Abs(scale-1)>0.001 Then glscalef(scale,scale,scale)
   cursorx=(-0.31+23.7*(-1+2*x/xmax)*(xmax/ymax)*(520/700))
   cursory=-0.25+17.1*(1-2*y/ymax)
   cursorz=z
   glTranslatef (cursorx,cursory,cursorz)
End Sub 
Sub gldrawtext0(ByRef text As String,ByVal x0 As Single,ByVal y0 As Single,ByVal scale As Single=1.0)
   glLoadIdentity()
   Var x=x0+cursorx0,y=y0+cursory0
   gldisable(gl_texture_2d)
   'glTranslatef (22*(-1+2*x/xmax)*(xmax/ymax)*(520/700),17*(1-2*y/ymax),-38)
   glTranslatef ((-0.31+23.7*(-1+2*x/xmax)*(xmax/ymax)*(520/700)),-0.25+17.1*(1-2*y/ymax),-40+cursorz0)
   glscalef(scale,scale,scale)
   guigltext(text)
End Sub 
Sub gldrawtext(ByRef text As String,ByVal x0 As Single,ByVal y0 As Single,ByVal scale As Single=1.0,rot As Single=0)
   glLoadIdentity()
   Var x=x0+cursorx0,y=y0+cursory0
   glenable(gl_texture_2d)
   glbindtexture(gl_texture_2d,myguifont256text)
   'glTranslatef (22*(-1+2*x/xmax)*(xmax/ymax)*(520/700),17*(1-2*y/ymax),-38)
   glTranslatef ((-0.31+23.7*(-1+2*x/xmax)*(xmax/ymax)*(520/700)),-0.25+17.1*(1-2*y/ymax),-40+cursorz0)
   If Abs(rot)>1 Then
   	Var xx=23.7*(2/xmax)*(xmax/ymax)*(520/700)
   	Var yy=17.1*(-2*3/ymax)
   	gltranslatef(xx,yy,0)
   	glrotatef(rot,0,0,1)
   	Var  co1=Cos((rot)*degtorad),si1=-Sin((rot)*degtorad)
   	gltranslatef(xx*co1+yy*si1,xx*si1-yy*co1,0)
   EndIf
   glscalef(scale*1.1,scale,scale)
   'glscalef(scale,scale,scale)
   myguigltext(text)
   gldisable(gl_texture_2d)
End Sub
Sub gldrawtext3D(ByRef text As String,ByVal scale As Single=5.0)
    glbindtexture(gl_texture_2d,myguifont256text)
    glpushmatrix
    glrotatef(90,0,0,1)
    glrotatef(90,1,0,0)
    glscalef(scale,scale,scale)
    myguigltext(text)
    glpopmatrix	
End Sub
Sub drawboussole
'gldrawtext "$",0,0
'gldrawtext "$",xmax/2,ymax/2
'gldrawtext "$",xmax,0
'gldrawtext "$",0,ymax
'gldrawtext "$",xmax,ymax
Dim As Single rx=12,dx=20,dy=20,scale=0.8,cosx,sinx
glpushmatrix
If tourelle=0 Or plane=0 Then
	cosx=cos1:sinx=sin1 
Else
	cosx=tcos1:sinx=tsin1
EndIf
gldrawtext "+", xmax-dx, ymax-dy,scale
gldrawtext "S", xmax-dx+cosx*rx, ymax-dy+sinx*rx,scale
gldrawtext "N", xmax-dx-cosx*rx, ymax-dy-sinx*rx,scale
gldrawtext "W", xmax-dx-sinx*rx, ymax-dy+cosx*rx,scale
gldrawtext "E", xmax-dx+sinx*rx, ymax-dy-cosx*rx,scale
glpopmatrix
End Sub
Dim Shared As Single distmax=100000,radardx,radardy,radarrx,oradar=0
Dim Shared As Single airshipmove(nship),airshipvie0(nship)
Sub setradarcolor(ByVal i As Integer)
Dim As Integer typeship0
typeship0=typeship(i)
If typeship0=0 Then glcolor3f(0.2,0.3,1)	
If typeship0=1 Then glcolor3f(0,0,1)	
If typeship0=2 Then glcolor3f(1,0,0)	
If typeship0=3 Then glcolor3f(0.77,0,0)
If typeship0=4 Then glcolor3f(0.2,0.2,1)	
If typeship0=5 Then glcolor3f(0,0,1)
If typeship0=6 Then glcolor3f(0,0,1)
If typeship0=7 Then glcolor3f(0,0,1)
If typeship0=8 Then glcolor3f(0,0,1)
If typeship0=9 Then glcolor3f(0,0,1)
If typeship0=10 Then glcolor3f(0,0,1)
If typeship0=11 Then glcolor3f(0,0,1)
If typeship0=12 Then glcolor3f(0,0,1)
If typeship0=13 Then glcolor3f(0,0,1)
End Sub 	
Sub drawcompas
Dim As Single dx,dy,rx:dx=xmax*0.40:dy=ymax*0.9'ymax-50
 gldisable gl_texture_2d
 glcolor3f(0.099,0.982,0.23)
 glpushmatrix
 glplacecursor dx+5,dy-5
 glrotatef(-o3,0,0,1)
 rx=3.9
 gldisk(0,rx)
 glcolor3f(0,0.22,0)
 gllinewidth(2)
 glligne(-rx,0,-0.1,rx,0,-0.1)
 glligne(0,0,-0.1,0,rx*cos2*0.97*(1-sin2*sin2),-0.1)
 glpopmatrix
End Sub  
Dim Shared As Single radaro1
Sub drawcompas2(opt As Integer=0) 
Dim As Single dx,dy,rx:dx=xmax*0.73:dy=ymax*0.9'ymax-50
Dim As Integer i
If mapdisplay>0 Then Exit Sub 
If typeavion=13 Then'ballon 
   dx=xmax*0.40:dy=ymax*0.9	
EndIf
If opt=1 Then 
   dx=xmax*0.475:dy=ymax*0.9	
   If volant=2 Then 
	   cursorx0=xmax*cocko1*0.5/45
   	cursory0=ymax*cocko2*(1-Abs(cocko1)/100)/45
   EndIf
EndIf
 'glenable gl_alpha_test
 'glAlphaFunc(gl_less,1/254)
 glpushmatrix
 'glplacecursor(xmax2+55,ymax-55)
 glplacecursor dx+5,dy-5
 glTranslatef (0,0,-0.01)
 glcolor4f(1,1,1,0)
 gldisable gl_texture_2d
 glColorMask(GL_false, GL_false, GL_false, GL_true)
 glcarre(5)
 glColorMask(GL_true, GL_true, GL_true, GL_true)
 glcolor4f(1,1,1,1)
 gldisk(0,4*475/471,40)
 'radaro1+=kfps*2
 glrotatef(90-o1,0,0,1)
 glenable gl_texture_2d
 glbindtexture(gl_texture_2d,webtext)
 glEnable GL_BLEND
 glBlendFunc GL_dst_ALPHA,GL_ONE_MINUS_dst_ALPHA
 'Var ty=0.5+0.5*(mx+dmx0-xweb)/dxweb
 'Var tx=0.5-0.5*(my+dmy0-yweb)/dyweb 
 Var k06=kxweb,k66=1-k06-k06
 Var tyy=0.5+k66*(my+dmy0-yweb)*0.5/dyweb
 Var txx=0.5+k66*(mx+dmx0-xweb)*0.5/dxweb
 gltexcarrexy(4.2,txx-0.3,tyy-0.3,0.6)
 'gltexdisk(0,4*475/ymax,40)
 glcolor3f(1,1,1)
 gldisable GL_BLEND
 rx=ymax-dy+12'61
 gldrawtext "N",dx-rx*cos1,dy-rx*sin1
 gldrawtext "+",dx+2,dy+2,0.8
 glpopmatrix
End Sub
Dim Shared As String myroadwayname
Dim Shared As Integer tvideo,tgps0,ipersovideo
Declare Sub drawvideo(scale As Single=1)
Sub drawgps
Dim As Single dx,dy,rx:dx=xmax*0.80:dy=ymax*0.65'ymax-50
Dim As Integer i
If mapdisplay>0 Then Exit Sub'Or volant=2 Then Exit Sub
If (tvideo=0 And time2>timegps+130 And tgps=1) Or time2<timeinit+11 Then timegps=timer+Rnd*3  
If (tvideo=0 And time2>timegps+190 And tgps=0) Or time2<timeinit+11 Then timegps=timer+Rnd*3  
If time2<timegps+10 Then
	If tvideo=0 Then ipersovideo=Int(Rnd*2.9)
   tvideo=1	
Else
   If tvideo=1 Then timegps=time2-13
	tvideo=0
EndIf
tgps0=tgps
 'glenable gl_alpha_test
 'glAlphaFunc(gl_less,1/254)
 gldisable gl_depth_test
 glviewport(dx,ymax-dy-ymax*0.25,xmax*0.2,ymax*0.3)
If tgps=1 Then 
 glpushmatrix
 'glplacecursor(xmax2+55,ymax-55)
 glplacecursor -xmax*0.72*(1300/730)*(wy/wx),-50'dy/40
 glTranslatef (35*(1-(1300/730)*(wy/wx)),-22,-0.01)
 'glplacecursor -xmax*0.72*(1300/730)*(wy/wx),0'dy/40
 'glTranslatef (35*(1-(1300/768)*(wy/wx)),-22,-0.01)
 glcolor4f(1,1,1,1)
 'gldisable gl_texture_2d
 'glcarre(7*475/471)
 'radaro1+=kfps*2
 glrotatef(90,0,1,0)
 glrotatef(-45,0,0,1)
 glenable gl_texture_2d
 glbindtexture(gl_texture_2d,webtext)
 'glEnable GL_BLEND
 'glBlendFunc GL_dst_ALPHA,GL_ONE_MINUS_dst_ALPHA
 glscalef(2.5*14/12,-2,2)
 gltexrotcarre2(90,90,180+o1,0.75,-0.002+(mx-xweb)*0.5/dxweb,0.0045+(my-yweb)*0.5/dyweb)
 glcolor3f(1,1,1)
 'gldisable GL_BLEND
 'rx=ymax-dy+12'61
 'gldrawtext "N",dx-rx*cos1,dy-rx*sin1
 'glpopmatrix
 'glpushmatrix 
 gldrawtext "^",xmax*0.48,ymax*0.62,5
 gldrawtext myroadwayname,xmax*0.05,ymax*0.97,4
 glpopmatrix
EndIf 
 If tvideo=1 Then
 	If tgps=1 Then 
 		drawvideo()
 	Else
 		drawvideo(0.77)
 	EndIf
 EndIf
 glenable gl_depth_test
 glviewport(0,0,xmax,ymax)
End Sub
Dim Shared As Single bridgex(nbridge),bridgey(nbridge),bridgeo1(nbridge)
Sub drawradar2car 
Dim As Single dx,dy,rx:dx=xmax*0.60:dy=ymax*0.9'ymax-50
Dim As Integer i
If mapdisplay>0 Then Exit Sub 
 'glenable gl_alpha_test
 'glAlphaFunc(gl_less,1/254)
 glpushmatrix
 'glplacecursor(xmax2+55,ymax-55)
 glplacecursor dx+5,dy-5
 glTranslatef (0,0,-0.01)
 gldisable gl_texture_2d
 glcolor4f(1,1,1,0)
 glColorMask(GL_FALSE, GL_FALSE, GL_FALSE, GL_true)
 gldisk(0,6*475/471,20)
 glColorMask(GL_true, GL_true, GL_true, GL_true)
 glcolor4f(1,1,1,1)
 gldisk(0,4*475/471,40)
 'radaro1+=kfps*2
 glrotatef(90-o1,0,0,1)
 glenable gl_texture_2d
 glbindtexture(gl_texture_2d,webtext)
 glEnable GL_BLEND
 glBlendFunc GL_dst_ALPHA,GL_ONE_MINUS_dst_ALPHA
 'Var ty=0.5+0.5*(mx+dmx0-xweb)/dxweb
 'Var tx=0.5-0.5*(my+dmy0-yweb)/dyweb 
 Var k06=kxweb,k66=1-k06-k06
 Var tyy=0.5+k66*(my+dmy0-yweb)*0.5/dyweb
 Var txx=0.5+k66*(mx+dmx0-xweb)*0.5/dxweb
 gltexcarrexy(4.2,txx-0.15,tyy-0.15,0.3)
 'gltexdisk(0,4*475/ymax,40)
 glcolor3f(1,1,1)
 gldisable GL_BLEND
 rx=ymax-dy+12'61
 gldrawtext "N",dx-rx*cos1,dy-rx*sin1
 gldrawtext "+",dx+2,dy+2,0.8
 glpopmatrix

If volant>0 Then 
 dx+=rx*2.5
 glenable gl_texture_2d
 glbindtexture(gl_texture_2d,radartext)
 glpushmatrix
 'glplacecursor(xmax2+55,ymax-55)
 glplacecursor dx+5,dy-5
 glTranslatef (0,0,-0.01)
 radaro1+=kfps*2
 glrotatef(radaro1,0,0,1)
 gltexdisk(0,4*475/471,40)
 rx=ymax-dy+12'61
 gldrawtext "N",dx-rx*cos1,dy-rx*sin1
 gldisable gl_alpha_test
 gldisable gl_depth_test
 For i=1 To iradar
     Var dmx=xradar(i)-mx,dmy=yradar(i)-my
     Var aux=Sqr(dmx*dmx+dmy*dmy)
     If aux>5000 Then aux=1.5*aux-2500
     Var mapx=rx*((dmx*cos1+dmy*sin1)*1.35/(2500+aux))
     Var mapy=rx*((-dmx*sin1+dmy*cos1)*1.35/(2500+aux))
     Var itype=typeradar(i)
     If itype=1 Then'church
     	  glcolor3f(0.35,0.35,0.4)
     	  gldrawtext("+", dx-mapy,dy-mapx)    	
     EndIf
     If itype=2 Then'railstation
     	  glcolor3f(0.7,0,0.7)
     	  gldrawtext("-", dx-mapy,dy-mapx)    	
     EndIf
     If itype=3 Then'hospital
     	  glcolor3f(0.7,0.3,0.3)
     	  gldrawtext("+", dx-mapy,dy-mapx)    	
     EndIf
     If itype=4 Then'fuel
    	  glcolor3f(1,1,0)'1)
     	  'gldrawtext(".", dx-mapy,dy-mapx)    	
     	  gldrawtext("R", dx-mapy,dy-mapx,0.7)    	
     EndIf
     If itype=5 Then'school
     	  glcolor3f(0.45,0.45,0.9)
     	  gldrawtext("*", dx-mapy,dy-mapx)    	
     EndIf
     If itype=6 Then'watertower
     	  glcolor3f(0,0,1)
     	  gldrawtext(".", dx-mapy,dy-mapx)    	
     EndIf
     If itype=7 Then'silo
     	  glcolor3f(0.3,0.9,1)
     	  gldrawtext(".", dx-mapy,dy-mapx)    	
     EndIf
     If itype=8 Then'shop'communicationstower
     	  glcolor3f(1,0,1)
     	  gldrawtext(".", dx-mapy,dy-mapx)    	
     EndIf
 Next
 
 For i=1 To 18'naeroway
   If nearaerowaylat(i)<-89 Then Continue For 	
   Var dmx=nearaerowayx(i)-mx
   If Abs(dmx)<90000*2 Then 
      Var dmy=nearaerowayy(i)-my
     'dmx=-000:dmy=70000
     If Abs(dmy)<90000*2 Then
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux>5000 Then aux=1.5*aux-2500
       Var mapx=rx*((dmx*cos1+dmy*sin1)*1.35/(2500+aux))
       Var mapy=rx*((-dmx*sin1+dmy*cos1)*1.35/(2500+aux))
    	 glcolor3f(1,1,1)
       gldrawtext("-",Int(dx-mapy),Int(dy-mapx),1.2 )
     EndIf     
   EndIf 
 Next i	      	

 For i=0 To nbridge
 	If bridgex(i)<-999990 Then Continue For 
	'If Abs(bridgelat(i)-lat)>0.05 Then Continue For
	'If Abs(bridgelon(i)-lng)>0.07 Then Continue For
   Var dmx=bridgex(i)-mx
   If Abs(dmx)<20000 Then 
      Var dmy=bridgey(i)-my
     'dmx=-000:dmy=70000
     If Abs(dmy)<20000 Then
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       Var d2500=10000.0
       If aux>d2500+d2500 Then aux=1.5*aux-d2500
       Var mapx=rx*((dmx*cos1+dmy*sin1)*1.35/(d2500+aux))
       Var mapy=rx*((-dmx*sin1+dmy*cos1)*1.35/(d2500+aux))
    	 glcolor3f(1,0.5,0.5)
     	 'gldrawtext("-", dx-mapy,dy-mapx)    	
       gldrawtext("-",(dx-mapy),(dy-mapx)-3,1,bridgeo1(i)-o1)
     EndIf     
   EndIf 
 Next i    	      	

 glpopmatrix
EndIf 
 'gldisable gl_alpha_test
 glenable gl_depth_test
End Sub
Sub drawradar2
If car>0 Then
	drawradar2car()
	Exit Sub 
EndIf
If volant>=3 And compas=1 Then drawcompas
If (volant=3 Or(volant=4 And avion="737")) And compas2=1 Then drawcompas2
If volant=2 And compas2=1 And max(Abs(cocko1),Abs(cocko2))<55 Then drawcompas2(1)
Dim As Single dx,dy,rx:dx=xmax*0.60:dy=ymax*0.9'ymax-50
If volant=2 Then 
	cursorx0=xmax*cocko1*0.5/45
	cursory0=ymax*cocko2*(1-Abs(cocko1)/100)/45
EndIf
 'glenable gl_alpha_test
 'glAlphaFunc(gl_less,1/254)
 glenable gl_texture_2d
 glcolor3f(1,1,1)
 glbindtexture(gl_texture_2d,radartext)
 glpushmatrix
 'glplacecursor(xmax2+55,ymax-55)
 glplacecursor dx+5,dy-5
 glTranslatef (0,0,-0.01)
 radaro1+=kfps*2
 glrotatef(radaro1,0,0,1)
 'gltexcarre(4)
 'gltexdisk(0,4*475/ymax,40)
 gltexdisk(0,4*475/471,40)
 rx=ymax-dy+12'61
 gldrawtext "N",dx-rx*cos1,dy-rx*sin1
 glpopmatrix
 'gldisable gl_alpha_test
'If tgps=1 Then drawgps
End Sub
Dim Shared As Single distspeak,dxspeak
Function diro1(dx As Single,dy As Single)As Single 
Dim As Single do1
If Abs(dx)>max(0.000001,0.001*Abs(dy)) Then
   If dx>0 Then
   	do1=Atn(dy/dx)*radtodeg
   Else
   	do1=180-Atn(dy/Abs(dx))*radtodeg
   EndIf
Else
	do1=Sgn(dy)*90
EndIf
Return do1
End Function 
Function dirtext(dx As Single,dy As Single) As String
Dim As Single do1
do1=diro1(dx,dy)
Select Case Int((do1+22.5)/45)
	Case 0
		Return "east"
	Case 1
		Return "north east"
	Case 2
		Return "north"
	Case 3
		Return "north west"
	Case 4
		Return "west"
	Case -1,7
		Return "south east"
	Case -2,6
		Return "south"
	Case -3,5
		Return "south west"
	Case -4
		Return "west"
	Case Else
		Return "direction"
End Select
End Function
declare function airporttext2(i as integer) as string 
Function airporttext() As String
Select Case Int(Rnd*4)
	Case 0
		Return "ground airport"
	Case 1
		Return "ground control"
	Case 2
		Return "airport control"
	Case Else 
		Return "ground airport control"
End Select
End Function
Function carriertext() As String
Select Case Int(Rnd*3)
	Case 0
		Return "aircraft carrier"
	Case 1
		Return "carrier control"
	Case Else
		Return "aircraft carrier control"
End Select
End Function
Function stationtext() As String
Select Case Int(Rnd*4)
	Case 0
		Return "orbital station"
	Case 1
		Return "orbital control"
	Case 2
		Return "space control"
	Case Else 
		Return "orbital station control"
End Select
End Function
Function alttext(x As Single,y As Single,z As Single) As String
	Var dx=x-mx,dy=y-my,dz=z-mz
	Var dist=Abs(dx)+Abs(dy)
	If Abs(dz)<(2000+dist*0.8) And Rnd<0.5 Then Return " "
	If dz<(-2000-dist*0.4) Then Return " , altitude down"
	If dz>(2000+dist*0.4) Then Return " , altitude up"
	Return " "
End Function
Function zonetext() As String
Select Case Int(Rnd*4)
	Case 0
		Return "radar zone"
	Case 1
		Return "control zone"
	Case 2
		Return "radar control area"
	Case Else
		Return "control area"
End Select
End Function
Function approachtext() As String
Select Case Int(Rnd*2)
	Case 0
		Return "approaching"
	Case Else
		Return "your approach"
End Select
End Function
Function directiontext() As String
Select Case Int(Rnd*2)
	Case 0
		Return "direction"
	Case Else
		Return "azimut"
End Select
End Function
Function starttext() As String
Select Case Int(Rnd*4)
	Case 0
		Return "start"
	Case 1
		Return "continue"
	Case 2
		Return "begin"
	case else
		return "engage"
End Select
End Function
Dim Shared As Single stationx,stationy,stationz,stationvie,boeingportx,boeingporty,boeingx,boeingy,boeingz
Dim Shared As Single mnearaerowayx,mnearaerowayy,mynearaerowayz,mdistnearaeroway=999999
Sub drawradar
Dim As Integer i
Dim As Single dx=35,dy=85-15,rx=30*ymax/520
radardx=dx+3*(xmax/700):radardy=dy+6*(ymax/520):radarrx=rx
'gldisable GL_DEPTH_TEST
glpushmatrix
glplacecursor dx+5,dy-5
glTranslatef (0,0,-0.01)
glEnable GL_BLEND
glBlendFunc GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA
glcolor4f(0.3,1,0.3,0.7)
gldisk(0,2)
gldisable GL_BLEND 
glcolor3f(0,0.5,0.5)
gldrawtext "+",dx,dy
glcolor3f(0.9,1,1)
Var distmax2=Sqr(mx*mx+my*my)
If distmax2<distmax Then distmax2=distmax
gldrawtext "+",dx+rx*mx/distmax2,dy-rx*my/distmax2
/'glcolor3f(0.9,1,0)
gldrawtext "+",dx+rx*avionx/distmax,dy-rx*aviony/distmax
i=1
If boatz(i)<(waterz0+0.01) and nboat2>=i Then 
  glcolor3f(0,0,1)
  gldrawtext "+",dx+rx*max(-0.9,min(0.9,boatx(i)/distmax)),dy-rx*max(-0.9,min(0.9,boaty(i)/distmax))
EndIf 
i=1
If max(Abs(airshipx(i)),Abs(airshipy(i)))<distmax Then 
   setradarcolor(i)
   gldrawtext("+",dx+rx*airshipx(i)/distmax,dy-rx*airshipy(i)/distmax,0.59)
EndIf 
For i=3 To nship2 Step 4
  If max(Abs(airshipx(i)),Abs(airshipy(i)))<distmax Then 
     setradarcolor(i)
     gldrawtext("+",dx+rx*airshipx(i)/distmax,dy-rx*airshipy(i)/distmax,0.59)
  EndIf 
Next i '/
glpopmatrix
'End Sub
'Sub drawradar2
Dim As Integer mapx,mapy,dmx,dmy
Dim As Single kaux=3.5/2.5
If guitestactivekey=1 And guitestkey(vk_c) Then
	tradar2=(tradar2+1)Mod 2
	Sleep 200
EndIf
If plane=1 And (volant>=1 Or tradar2=1) And tourelle=0 Then
 drawradar2()
 glpushmatrix
 If car=0 Then	
 dx=xmax*0.60:dy=ymax*0.9'ymax-50
 /'glplacecursor(dx+5,dy-5)'xmax*0.57,ymax*0.768,-30)
 'glTranslatef (0,0,-0.01)
 glenable GL_BLEND
 glBlendFunc GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA
 glcolor4f(0.3,1,0.3,0.7)
 glcolor4f(0.3,1,0.3,0.95)
 gldisk(0,4)'2.5)
 gldisable GL_BLEND
 '/ 
 'glcolor4f(0,1,1,1)
 'oradar+=kfps*2
 'If oradar>3600 Then oradar-=3600
 'glplacecursor(dx,dy-12)
 'gllinewidth(1)
 'glligne(0,0,1, 2.3*Cos(oradar*degtorad),-2.3*Sin(oradar*degtorad),1)
 'glcolor3f(0,0.5,0.5)
 glcolor3f(0,0.2,0.2)
 'gldrawtext "+",dx,dy
 glcolor3f(1,1,1)
/'     dmx=avionx-mx:dmy=aviony-my
     'dmx=0:dmy=89000
     If Abs(dmx)<90000 And Abs(dmy)<90000 Then 
       dmx*=0.4:dmy*=0.4
       aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=36000 Then
         'mapx=(dmx*cos1+dmy*sin1)/(200+aux/54)
         'mapy=(-dmx*sin1+dmy*cos1)/(200+aux/54)
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then    	
       	  if (avionz<(mz-aux*0.15-300)) Then
       	  	gldrawtext("o", dx-mapy,dy-mapx,0.85 )    	
       	  ElseIf (avionz<(mz+aux*0.15+300)) Then
       	  	gldrawtext("+", dx-mapy,dy-mapx,1.5 )    	
       	  Else 
       	  	gldrawtext("*", dx-mapy,dy-mapx,1.5 )    	
       	  EndIf
         'EndIf
       EndIf
     EndIf   
 '/
 For i=1 To nship2
     dmx=airshipx(i)-mx:dmy=airshipy(i)-my
     'dmx=-000:dmy=70000
     If Abs(dmx)<90000 And Abs(dmy)<90000 Then 
       dmx*=0.4:dmy*=0.4
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=36000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
           If airshipz(i)<(mz+aux*0.15+300) Then
         	  glcolor3f(0,0,1)
           Else 
         	  glcolor3f(0.3,0.3,1)           	
           EndIf
       	  gldrawtext("+", dx-mapy,dy-mapx,1.2)'1.5 )    	
           /'setradarcolor(i)
       	  If (airshipz(i)<(mz-aux*0.15-300)) Then
       	  	gldrawtext("o", dx-mapy,dy-mapx,0.85 )    	
       	  ElseIf (airshipz(i)<(mz+aux*0.15+300)) Then
       	  	gldrawtext("+", dx-mapy,dy-mapx,1.2)'1.5 )    	
       	  Else 
       	  	gldrawtext("*", dx-mapy,dy-mapx,1.2)'1.5 )    	
       	  EndIf'/
         'EndIf
       EndIf
     EndIf 
 Next i
 dmx=boeingx-mx:dmy=boeingy-my
     'dmx=-000:dmy=70000
     If Abs(dmx)<90000 And Abs(dmy)<90000 Then 
       dmx*=0.4:dmy*=0.4
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=36000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
           If boeingz<(mz+aux*0.15+300) Then
         	  glcolor3f(0,0,1)
           Else 
         	  glcolor3f(0.2,0.2,1)           	
           EndIf
       	  gldrawtext("o", dx-mapy,dy-mapx,0.8)'1.5 )    	
           /'setradarcolor(i)
       	  If (airshipz(i)<(mz-aux*0.15-300)) Then
       	  	gldrawtext("o", dx-mapy,dy-mapx,0.85 )    	
       	  ElseIf (airshipz(i)<(mz+aux*0.15+300)) Then
       	  	gldrawtext("+", dx-mapy,dy-mapx,1.2)'1.5 )    	
       	  Else 
       	  	gldrawtext("*", dx-mapy,dy-mapx,1.2)'1.5 )    	
       	  EndIf'/
         'EndIf
       EndIf
     EndIf 
 /'
 if tsphere=1 Or planet=1 Then
     dmx=stationx-mx:dmy=stationy-my
     'dmx=0:dmy=89000
     'If Abs(dmx)<90000 And Abs(dmy)<90000 Then
     Var tnear=0 
     If Abs(dmx)<900000 And Abs(dmy)<900000 Then 
       If Abs(dmx)<90000 And Abs(dmy)<90000 Then
       	dmx*=0.4:dmy*=0.4
       	tnear=1
       Else
       	dmx*=0.13:dmy*=0.13
       EndIf
       aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=360000 Then
         'mapx=(dmx*cos1+dmy*sin1)/(200+aux/54)
         'mapy=(-dmx*sin1+dmy*cos1)/(200+aux/54)
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471   	
           If stationz>(mz-200) Then
           	  glcolor3f(1,0,1)
           Else
           	  glcolor3f(1,0,0)
           EndIf
           gldrawtext(".", dx-mapy,dy-mapx,1.4 )    	
       	  If (Rnd<0.004*kfps Or Timer>(tspeak+59))And tnear=1 Then
      	    If Timer>(tspeak+20) And textspeak="" And stationvie>0 Then
      	    	tspeak=max(tspeak,Timer-1.5) 
      	    	pitchspeak=Int(-8+(int(dmx0+dmy0) Mod 3)*9)
      	    	Var pilot=guigettext("win.combo1")
      	    	distspeak=aux
      	    	dxspeak=dmx*cos1+dmy*sin1
      	    	If distspeak>25000 And dxspeak>0 And Rnd<0.5 Then 
       	    	  textspeak=stationtext()+" to "+pilot+ _  
       	    	   ", you are coming in our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)+alttext(stationx,stationy,stationz)
      	    	ElseIf distspeak>25000 And dxspeak>0 Then 
       	    	  textspeak=stationtext()+" to "+pilot+ _  
       	    	   ", you are entering our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)+alttext(stationx,stationy,stationz)
      	    	ElseIf distspeak>25000 Then 
       	    	  textspeak=stationtext()+" to "+pilot+ _  
       	    	   ", you are leaving our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)+alttext(stationx,stationy,stationz)
      	    	ElseIf distspeak>1000 Then   
       	    	  textspeak=stationtext()+" to "+pilot+ _  
       	    	   ", "+starttext()+" "+approachtext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)+alttext(stationx,stationy,stationz)
      	    	EndIf 	          
      	    EndIf
       	  EndIf    	
       EndIf
     EndIf   
 EndIf
 '/ 
If planet=0 Then  
 /'glcolor3f(0,0,1)
 For i=1 To nboat2
   If boatz(i)<=(waterz0+0.01) Then 
     dmx=boatx(i)-mx:dmy=boaty(i)-my
     'dmx=-000:dmy=70000
     If Abs(dmx)<90000 And Abs(dmy)<90000 Then 
       dmx*=0.4:dmy*=0.4
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=36000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
       	  gldrawtext(".", dx-mapy,dy-mapx,1.5 ) 
       	  if typeboat(i)=4 Then 'carrier
     	      If Rnd<0.004*kfps Or (Timer>(tspeak+59) And Rnd<0.5) Then
      	    If Timer>(tspeak+20) And textspeak="" And v>1 Then
      	    	pitchspeak=0
      	    	Var pilot=guigettext("win.combo1")
      	    	distspeak=aux
      	    	dxspeak=dmx*cos1+dmy*sin1
      	    	If distspeak>25000 And dxspeak>0 And Rnd<0.5 Then 
       	    	  textspeak=carriertext()+" to "+pilot+ _  
       	    	   ", you are coming in our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>25000 And dxspeak>0 Then 
       	    	  textspeak=carriertext()+" to "+pilot+ _  
       	    	   ", you are entering our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>25000 Then 
       	    	  textspeak=carriertext()+" to "+pilot+ _  
       	    	   ", you are leaving our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>3000 Then   
       	    	  textspeak=carriertext()+" to "+pilot+ _  
       	    	   ", "+starttext()+" "+approachtext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	EndIf 	          
      	    EndIf
     	      EndIf
       	  EndIf    	
         'EndIf
       EndIf
     EndIf  
   EndIf   
 Next i '/
 EndIf 
 EndIf 'car 
 /'For i=1 To nairport2 
   dmx=airportx(i)-dmx0-mx
   If Abs(dmx)<90000 Then 
      dmy=airporty(i)-dmy0-my
     'dmx=-000:dmy=70000
     If Abs(dmy)<90000 Then 
       dmx*=0.4:dmy*=0.4
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=36000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
           If airporttype(i)>=3 Then 
           	  glcolor3f(1,1,0.3)
           Else
           	  glcolor3f(0.8,0.8,0.8)
           EndIf
       	  gldrawtext(".", dx-mapy,dy-mapx,1 )    	
       	  If Rnd<0.004*kfps Or Timer>(tspeak+59) Then
      	    If Timer>(tspeak+20) And textspeak="" And v>1 Then
      	    	pitchspeak=Int(-8+(i Mod 3)*9)
      	    	Var pilot=guigettext("win.combo1")
      	    	distspeak=aux
      	    	dxspeak=dmx*cos1+dmy*sin1
      	    	If distspeak>25000 And dxspeak>0 And Rnd<0.5 Then 
       	    	  textspeak=airporttext()+" to "+pilot+ _  
       	    	   ", you are coming in our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>25000 And dxspeak>0 Then 
       	    	  textspeak=airporttext()+" to "+pilot+ _  
       	    	   ", you are entering our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>25000 Then 
       	    	  textspeak=airporttext()+" to "+pilot+ _  
       	    	   ", you are leaving our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>3000 Then   
       	    	  textspeak=airporttext()+" to "+pilot+ _  
       	    	   ", "+starttext()+" "+approachtext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	EndIf 	          
      	    EndIf
       	  EndIf    	
         'EndIf
       EndIf
     EndIf
   EndIf   
 Next i

If planet=0 Then  
 For i=1 To ntown2 
   dmx=townx(i)-dmx0-mx
   If Abs(dmx)<90000 And tmaptown(i)>0 Then 
      dmy=towny(i)-dmy0-my
     'dmx=-000:dmy=70000
     If Abs(dmy)<90000 Then 
       dmx*=0.4:dmy*=0.4
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=36000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
           If towntype(i)>=2 Then 
           	  glcolor3f(0.4,0.8,0)
           Else
           	  glcolor3f(0,0.8,0)
           EndIf
       	  gldrawtext("^", dx-mapy,dy-mapx,0.8 )    	
         'EndIf
       EndIf
     EndIf
   EndIf   
 Next i
 For i=1 To ntown3 
  If townworld1(i)="" Then Exit For
  If worldname=townworld1(i) Then
   dmx=xtown1(i)-dmx0-mx
   If Abs(dmx)<90000 Then 
      dmy=ytown1(i)-dmy0-my
     'dmx=-000:dmy=70000
     If Abs(dmy)<90000 Then 
       dmx*=0.4:dmy*=0.4
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=36000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
        	  glcolor3f(1.0,0,0)
       	  gldrawtext("^", dx-mapy,dy-mapx,1 )    	
         'EndIf
       EndIf
     EndIf
   EndIf 
  ElseIf testworld=1 And i=1 Then 
   dmx=xtown-dmx0-mx
   If Abs(dmx)<90000 Then 
      dmy=ytown-dmy0-my
     'dmx=-000:dmy=70000
     If Abs(dmy)<90000 Then 
       dmx*=0.4:dmy*=0.4
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=36000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
        	  glcolor3f(1.0,0,0)
       	  gldrawtext("^", dx-mapy,dy-mapx,1 )    	
         'EndIf
       EndIf
     EndIf
   EndIf 
  EndIf  
 Next i
EndIf
'/  
If planet=0 And testworld=1 Then 
 mdistnearaeroway=999999
 For i=1 To 18'naeroway
   If nearaerowaylat(i)<-89 Then Continue For 	
   dmx=nearaerowayx(i)-dmx0-mx
   If Abs(dmx)<90000*2 Then 
      dmy=nearaerowayy(i)-dmy0-my
     'dmx=-000:dmy=70000
     If Abs(dmy)<90000*2 Then
     	 If Abs(dmx)<mdistnearaeroway Then
     	 	If Abs(dmy)<mdistnearaeroway Then
     	 		Var mdist=max(Abs(dmx),Abs(dmy))
     	 		Var mdxx=dmx*cos1+dmy*sin1
     	 		If (mdist>10000 Or mdxx>880)And mdxx>0  Then
     	 		   mdistnearaeroway=mdist
     	 		   mnearaerowayx=nearaerowayx(i)
     	 		   mnearaerowayy=nearaerowayy(i)
     	 		EndIf 
     	 	EndIf
     	 EndIf
       dmx*=0.4/10:dmy*=0.4/10
       Var aux=Sqr(dmx*dmx+dmy*dmy)*10
       dmx*=10:dmy*=10
       If aux>30000 And aux<72000 Then
       	Var kaux=(aux-30000)/(72000-30000),aux0=aux
       	aux=30000+kaux*6000
       	dmx*=aux/aux0:dmy*=aux/aux0
       EndIf
       If aux<=36000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
        	  glcolor3f(1,1,1)
       	  If car=0 Then gldrawtext("-",Int(dx-mapy),Int(dy-mapx),1.2 )    	
       	  If Rnd<0.004*kfps Or Timer>(tspeak+59) Then
      	    If Timer>(tspeak+20) And textspeak="" And v>1 And plane>0 And car=0 Then
      	    	pitchspeak=Int(-8+(i Mod 3)*9)
      	    	Var pilot=guigettext("win.combo1")
      	    	distspeak=aux
      	    	dxspeak=dmx*cos1+dmy*sin1
      	    	If distspeak>25000 And dxspeak>0 And Rnd<0.5 Then 
       	    	  textspeak=airporttext2(i)+" to "+pilot+ _  
       	    	   ", you are coming in our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>25000 And dxspeak>0 Then 
       	    	  textspeak=airporttext2(i)+" to "+pilot+ _  
       	    	   ", you are entering our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>25000 Then 
       	    	  textspeak=airporttext2(i)+" to "+pilot+ _  
       	    	   ", you are leaving our "+zonetext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	ElseIf distspeak>3000 Then   
       	    	  textspeak=airporttext2(i)+" to "+pilot+ _  
       	    	   ", "+starttext()+" "+approachtext()+" . . . . . "+ _
       	    	   directiontext()+" "+dirtext(dmx,dmy)
      	    	EndIf 
      	    	If Abs(boeingportx)+Abs(boeingporty)<0.001 And dxspeak>0 Then
      	    		If InStr(LCase(nearaerowayname(i)),"heliport")<=0 Then
      	    			If InStr(LCase(nearaerowayname(i)),"seaplane")<=0 Then
      	    				boeingportx=nearaerowayx(i)
      	    				boeingporty=nearaerowayy(i)
      	    				'auxtext=nearaerowayname(i):auxtest=0.2
      	    			EndIf
      	    		EndIf
      	    	EndIf
      	    EndIf
       	  EndIf    	
         'EndIf
       EndIf
     EndIf
   EndIf   
 Next i
EndIf 
  
 glcolor3f(1,1,1)
 glpopmatrix
Else
 drawboussole	
EndIf 	
'glenable GL_DEPTH_TEST
End Sub
Dim Shared As Single volantrots0,handrot
Dim Shared As Integer thand
Sub drawvolant
 gldisable gl_depth_test	
 gldisable(gl_lighting)
 glenable gl_alpha_test
 glAlphaFunc(gl_less,1/254)
 glcolor3f(1,1,1)
 If car=5 Then
 	glbindtexture(gl_texture_2d,volanttext2)
 Else 	
 	glbindtexture(gl_texture_2d,volanttext)
 EndIf
 glpushmatrix
 glplacecursor(xmax*0.43,ymax*0.768,-30)
 If handrot>-990 and thand=1 Then volantrot=handrot:volantrots0=0
 If volantrot>120 Then volantrot=120
 If volantrot<-120 Then volantrot=-120
 glrotatef(volantrot+volantrots0,0,0,1)
 If tautopilot>0 Or typeautopilot=1 Or Abs(volantrot)<19*kfps Then
 	volantrot=0.75*volantrot+1e-10
 Else
 	o1+=volantrot*0.01*kfps
 EndIf
 gltexcarre(5)
 glpopmatrix
 glenable gl_depth_test
End Sub
Dim Shared As Single windo1,vwind,avgo1
Dim Shared As Double tclignotant
Sub drawwind'boussole
 glenable gl_alpha_test
 glAlphaFunc(gl_less,10/254)
 glcolor3f(1,1,1)
 glbindtexture(gl_texture_2d,windtext2)
 glpushmatrix
 glplacecursor(xmax-55,55)
 glpushmatrix
 glrotatef(avgo1-o1,0,0,1)
 gltexcarre(3.4)
 glpopmatrix
 glbindtexture(gl_texture_2d,windtext)
 If tourelle=0 Then
 	'glrotatef(windo1-o1,0,0,1)
 	glrotatef(90-o1,0,0,1)
 Else
 	glrotatef(90-to1-o1,0,0,1)
 EndIf
 gltexcarre(3)
 'glplacecursor(xmax-55,0.95*ymax)
 'glrotatef(avgo1-o1,0,0,1)
 'gltexcarre(1.4)
 glpopmatrix
 gldisable gl_alpha_test
End Sub
Dim Shared As Single drawmapx=50,drawmapy=159+9',k8=6
'waterz=-60*scalez
Sub drawmap2(texture As uint=0)
 glcolor3f(1,1,1)
 If texture<>0 Then 
 	glbindtexture(gl_texture_2d,texture)
 ElseIf testworld=0 Then 
 	glbindtexture(gl_texture_2d,maptext)
 Else 
 	glbindtexture(gl_texture_2d,worldtext)
 EndIf
 glpushmatrix
 glplacecursor(100,220)
 gltexcarre(2.5*2)
 Dim As Single aux=(200/(k8*512*scalex))*1200/x960'200/(6*512*500) 
 gldrawtext("+",100-5+(mx+dmx0)*aux,220+5-(my+dmy0)*aux*scalex/scaley)
 glpopmatrix	
End Sub
'Dim Shared As Integer worldmapx(100),worldmapy(100),showmapworld,worldx0,worldy0
'Dim Shared As String worldmap(100)
Sub drawmapworld(texture as uint=0)
Dim As Single scale=8*1200/x960
 glcolor3f(1,1,1)
 gldisable(gl_lighting)
 glenable(gl_texture_2d)
 If texture<>0 Then
 	glbindtexture(gl_texture_2d,texture)
 Else 	
 	glbindtexture(gl_texture_2d,worldtext)
 EndIf
 glpushmatrix
 glplacecursor(xmax/2-worldx*scale*100,ymax/2-worldy*scale*100,-4400)
 glscalef(1.0,750/1500,1.0)
 If planet=0 Then
 	gltexcarre(4000*scale)
 Else
 	gltexcarre(4400)
 EndIf
 glpopmatrix	
 glEnable GL_BLEND
 glBlendFunc GL_SRC_ALPHA,GL_one_minus_SRC_ALPHA
 glbindtexture(gl_texture_2d,maptext)
 glpushmatrix
 glplacecursor(xmax/2,ymax/2,-4000)
 If showmapworld=1 Then gltexcarre(800)
 glpopmatrix	
 gldisable GL_BLEND
 glcolor3f(1,0,0)
 gldrawtext("worldx="+Str(worldx)+"    worldy="+Str(worldy),10,10,1.2)
 gldrawtext("[S]save     [esc]quit     [M]map",10,40,1.2)
 gldrawtext("map : "+worldname,10,70,1.2)
 'Var k8=6
 Var aux=(8/40)/(4*k8*512*scalex)  
 mapautoix=535+worldx+(mx+dmx0)*aux*535
 mapautoiy=(276+worldy)-(my+dmy0)*aux*276*2*scalex/scaley
 Var pix=Point(mapautoix*750/535,mapautoiy*(750/2)/276,worldbmp)
 Var r=pix Shr 16
 Var g=(pix Shr 8)And 255
 Var b=pix And 255
 gldrawtext("r="+Str(r)+"   g="+Str(g)+"   b="+Str(b),10,100,1.2)
 glplacecursor(xmax/2+(mapautoix-535-worldx)*scale, _   
               ymax/2+(mapautoiy-276-worldy)*scale,-39)
 glsphere(0.3)
 glcolor3f(1,1,1)
 '535,276
End Sub
Sub loadmapworld()
Dim As Integer file,i,j,k,ii
Dim As String ficin
file=freefile
Open "world.txt" For Input As #file
For i=1 To 100
	worldmap(i)="":worldmapx(i)=0:worldmapy(i)=0
	If Not Eof(file) Then
      Line Input #file,ficin
      j=InStr(ficin,"/")
      k=InStr(j+1,ficin,"/")
      worldmap(i)=Left(ficin,j-1)
      worldmapx(i)=Val(Mid(ficin,j+1,k-j-1))
      worldmapy(i)=Val(Mid(ficin,k+1))	
	EndIf
Next
Close #file	
End Sub
Sub savemapworld()
Dim As Integer file,i,j
loadmapworld()
For i=1 To 100
	If worldmap(i)=worldname Or worldmap(i)="" Then
		If worldmap(i)="" And i<100 Then worldmap(i+1)=""
		worldmap(i)=worldname
		worldmapx(i)=worldx:worldmapy(i)=worldy
		Exit For
	EndIf
Next
file=freefile
Open "world.txt" For Output As #file
For i=1 To 100
	If worldmap(i)="" Then Exit For
	Print #file,worldmap(i)+"/"+Str(worldmapx(i))+"/"+Str(worldmapy(i))
Next
Close #file
End Sub
Sub getmapworldx()
Dim As Integer i
loadmapworld()
For i=1 To 100
	If worldmap(i)=worldname Then
		worldx=worldmapx(i):worldy=worldmapy(i)
		Exit For 
	EndIf
Next
End Sub
Sub submapworld() 
Dim As Integer tworld,tworld0,i,j,k
Dim As String worldname0
stopvol()
showmapworld=1
worldx0=worldx:worldy0=worldy
worldname0=worldname
worldname="wolrd"'guigettext("win.map")
If worldname="world" Then testworld=1 Else testworld=0
If worldname<>worldname0 Then
	loadmapworld()
	For i=1 To 100
		If worldmap(i)=worldname Then
			worldx=worldmapx(i):worldy=worldmapy(i)
			Exit For 
		EndIf
	Next
EndIf
While quit=0 And guitestkey(vk_escape)=0 And guitestkey(vk_return)=0 _   
	   And guitestkey(vk_space)=0 
   guiscan
   If tworld<3 Then Sleep 150 Else Sleep 20
   If tworld0=tworld Then tworld=0
   tworld0=tworld
   If guitestkey(vk_left) Then worldx-=1:tworld+=1
   If guitestkey(vk_right) Then worldx+=1:tworld+=1
   If guitestkey(vk_up) Then worldy-=1:tworld+=1
   If guitestkey(vk_down) Then worldy+=1:tworld+=1
   worldx=max2(-750,min2(750,worldx))
   worldy=max2(-400,min2(400,worldy))
   If guitestkey(vk_s) Then
   	confirmspeak("save map world ?","confirm",resp)
   	If resp="yes" Then
   		savemapworld()
   	EndIf
   EndIf
   If guitestkey(vk_m) Then showmapworld=(showmapworld+1)Mod 2
   
   glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT Or GL_STENCIL_BUFFER_BIT)
   glLoadIdentity ()
   drawmapworld()
   guirefreshopenGL  
Wend
'If mapauto=1 Then setmapautotextures()
setvol()
Sleep 400
guiscan
End Sub
Sub drawtexture(texture As UInteger)	
 gldisable GL_DEPTH_TEST
 glenable(gl_texture_2d)
 glcolor3f(1,1,1)
 glbindtexture(gl_texture_2d,texture)
 glpushmatrix
 glplacecursor(xmax/2,ymax/2)
 gltexcarre(5*4*640/(0.1+ymax))
 glpopmatrix
 glenable GL_DEPTH_TEST
End Sub
'Dim Shared As Integer mapdisplay=0
Declare Sub drawmaptest0()
Declare Sub drawmaptest()
Dim Shared As Single dkzoom=1.0
Sub displaymap
 'If mapdisplay=4 Then drawtexture(webtext):Exit sub	
 If mapdisplay=5 Then
 	drawmaptest0()
 	'drawtexture(webtext)
 	Exit sub	
 EndIf
 If mapdisplay=3 Then drawmaptest():Exit Sub
 If mapdisplay>=4 Then Exit Sub  
 gldisable GL_DEPTH_TEST
 glenable(gl_texture_2d)
 glcolor3f(1,1,1)
 If testworld=0 Then 
 	glbindtexture(gl_texture_2d,maptext)
 ElseIf mapdisplay=3 then 
 	glbindtexture(gl_texture_2d,soltexture0)
 ElseIf mapdisplay=1 then 
 	If webtextzoom=0 Then
 		glbindtexture(gl_texture_2d,webtext)
 	Else 	
 		glbindtexture(gl_texture_2d,webtextzoom)
 	EndIf
   glpushmatrix
   glcolor4f(1,1,1,0)
   glplacecursor(xmax/2-50,ymax/2)
   gltexcarre(19)
   glcolor3f(1,0,0)
   gldisable gl_texture_2d
   If webtextzoom=0 Then
   	gltranslatef(19*(mx+dmx0-xweb)/dxweb,19*(my+dmy0-yweb)/dyweb,0)
   Else
   	Var kx=1.0/4
   	kx*=dkzoom
   	/'If dkzoom<0.2 Then
   		kx*=0.125/16
   	ElseIf dkzoom<0.3 Then 	
   		kx*=0.125
   	ElseIf dkzoom<2 Then
   		kx*=1
   	ElseIf dkzoom<7 Then
   		kx*=4
   	elseIf dkzoom<13 Then
   		kx*=8
   	EndIf'/ 	
   	'gltranslatef(19*kx*(mx+dmx0-xwebzoom1)/dxwebzoom1,19*kx*(my+dmy0-ywebzoom1)/dywebzoom1,0)
   	gltranslatef(19*kx*(mx+dmx0-xwebzoom1)/10000,19*kx*(my+dmy0-ywebzoom1)/10000,0)
   EndIf
   glcarre(0.2)
   glenable gl_texture_2d
   glpopmatrix
   glenable gl_depth_test
   Exit Sub 
 Else 
 	glbindtexture(gl_texture_2d,worldtext)
 EndIf
 glpushmatrix
 glplacecursor(xmax/2-150,200)
 gltexcarre(2.5*4*640/(0.1+ymax))
 Dim As Single aux=(380/(k8*512*scalex))*1200/x960 
 glcolor3f(0.8,0.8,0.8)
If testworld=0 Or mapdisplay=3 Then
 Dim As integer i
 For i=1 To nairport2
    If airporttype(i)>=3 Then
     	glcolor3f(1,1,0.3)
    Else 
     	glcolor3f(0.8,0.8,0.8)
    EndIf
   gldrawtext("-",xmax/2-150-5+airportx(i)*aux,200+5-airporty(i)*aux*scalex/scaley,1.7) 	
 Next
If planet=0 Then 
 For i=1 To ntown2
 	If tmaptown(i)>0 Then 
    If towntype(i)>=2 Then
     	glcolor3f(1,0.8,0.3)
    Else 
     	glcolor3f(0.8,0.8,0.8)
    EndIf
   gldrawtext("^",xmax/2-150-5+townx(i)*aux,200+5-towny(i)*aux*scalex/scaley,1.2) 	
  EndIf 
 Next
 For i=1 To ntown3
    If townworld1(i)="" Then Exit For 
    If worldname=townworld1(i) Then 
     	glcolor3f(1.0,0,0)
      gldrawtext("^",xmax/2-150-5+xtown1(i)*aux,200+5-ytown1(i)*aux*scalex/scaley,1.2) 	
    EndIf  
 Next
EndIf 
 glcolor3f(1,1,1)
 gldrawtext("+",xmax/2-150-5+(mx+dmx0)*aux,200+5-(my+dmy0)*aux*scalex/scaley)
 If webtext>0999999 Then
   glenable(gl_texture_2d)
   glEnable GL_BLEND
   glBlendFunc GL_SRC_color,GL_one_minus_src_color
 	glbindtexture(gl_texture_2d,webtext)
   glcolor3f(0.8,0.8,0.8)
   'glplacecursor(xmax/2-150,200)
   glplacecursor(xmax/2-150-5+(mx+dmx0)*aux,200+5-(my+dmy0)*aux*scalex/scaley)
   gltexcarre(2.5*4*640/(0.1+ymax))
   gldisable GL_BLEND
 EndIf
Else
   /'aux=(8/40)/(4*k8*512*scalex)  
   Var mapautoix=535+worldx+(mx+dmx0)*aux*535
   Var mapautoiy=(276+worldy)-(my+dmy0)*aux*276*2*scalex/scaley
   Var x=max(-48.0,min(48.0,50*(mapautoix-535)/535))
   Var y=max(-48.0,min(48.0,50*(-mapautoiy+276)/276))       
   gldrawtext("+",xmax/2-150-5+x*380/100,200+5-y*380/100)'/
   Var x=lng/180,y=lat/90
   gldrawtext("+",xmax/2-150-5+x*380/2,200+5-y*380/2)'/
EndIf 
 glpopmatrix
 glenable GL_DEPTH_TEST
End Sub
Sub displaymap2
Dim As Single dx,tx,ty,dtx
 If mapdisplay=3 Then drawmaptest():Exit Sub
 gldisable GL_DEPTH_TEST
 glenable(gl_texture_2d)
 glcolor3f(1,1,1)
 If testworld=0 Then 
 	glbindtexture(gl_texture_2d,maptext)
 ElseIf mapdisplay=3 then 
 	'If webtext=0 Then
 		glbindtexture(gl_texture_2d,soltexture0)
 	'Else 
 	'	glbindtexture(gl_texture_2d,webtext)
 	'EndIf
 Else 
 	glbindtexture(gl_texture_2d,worldtext)
 EndIf
 glpushmatrix
 glplacecursor(xmax/2-150,200)
 dx=(2.5*4*640/(0.1+ymax))
 Dim As Single aux=(1/(k8*512*scalex))*1200/x960
 'If webtext>0 and mapdisplay=3 Then 
 '  tx=0.5+0.5*(mx+dmx0-xweb)/dxweb
 '  ty=0.5+0.5*(my+dmy0-yweb)/dyweb
 '  dtx=0.25
 If testworld=0 Or mapdisplay=3 Then 
   tx=0.5+(mx+dmx0)*aux
   ty=0.5+(my+dmy0)*aux*scalex/scaley
   dtx=0.2
 Else
   /'aux=(8/40)/(4*k8*512*scalex)  
   Var mapautoix=535+worldx+(mx+dmx0)*aux*535
   Var mapautoiy=(276+worldy)-(my+dmy0)*aux*276*2*scalex/scaley
   Var x=max(-48.0,min(48.0,50*(mapautoix-535)/535))
   Var y=max(-48.0,min(48.0,50*(-mapautoiy+276)/276))'/
   Var x=lng/180,y=lat/90
   tx=0.5+x/2
   ty=0.5+y/2       
   dtx=0.1
 EndIf   
 dtx=min(dtx,tx)
 dtx=min(dtx,ty)
 dtx=min(dtx,1.0-tx)
 dtx=min(dtx,1.0-ty)
 dtx=max(0.05,dtx)
	glbegin(gl_quads)
	glTexCoord2f(tx-dtx,ty-dtx)
	glvertex3f(-dx,-dx,0)
	gltexcoord2f(tx+dtx,ty-dtx)
	glvertex3f(dx,-dx,0)
	glTexCoord2f(tx+dtx,ty+dtx)
	glvertex3f(dx,dx,0)
	gltexcoord2f(tx-dtx,ty+dtx)
	glvertex3f(-dx,dx,0)
	glend()
If testworld=0 Or mapdisplay=3 Then 
 glcolor3f(0.8,0.8,0.8)
 If mapdisplay=3 Then
 	aux*=200/0.2
 Else 
 	aux*=200/dtx
 EndIf
 Dim As integer i,ix,iy
 For i=1 To nairport2
 	ix=(airportx(i)-mx-dmx0)*aux
 	iy=(airporty(i)-my-dmy0)*aux*scalex/scaley
 	If Abs(ix)<182 And Abs(iy)<187 Then 
      If airporttype(i)>=3 Then
      	glcolor3f(1,1,0.3)
      Else 
      	glcolor3f(0.8,0.8,0.8)
      EndIf
 		gldrawtext("-",xmax/2-150-5+ix,200+5-iy,1.87) 	
 	EndIf
 Next
If planet=0 Then 
 For i=1 To ntown2
  If tmaptown(i)>0 Then 	
 	ix=(townx(i)-mx-dmx0)*aux
 	iy=(towny(i)-my-dmy0)*aux*scalex/scaley
 	If Abs(ix)<182 And Abs(iy)<187 Then 
      If towntype(i)>=2 Then
      	glcolor3f(1,0.8,0.3)
      Else 
      	glcolor3f(0.8,0.8,0.8)
      EndIf
 		gldrawtext("^",xmax/2-150-5+ix,200+5-iy,1.3) 	
 	EndIf
  EndIf 	
 Next
 For i=1 To ntown3
 	If townworld1(i)="" Then Exit For 
 	If worldname=townworld1(i) Then 
 	 ix=(xtown1(i)-mx-dmx0)*aux
 	 iy=(ytown1(i)-my-dmy0)*aux*scalex/scaley
 	 If Abs(ix)<182 And Abs(iy)<187 Then 
      glcolor3f(1,0,0)
 		gldrawtext("^",xmax/2-150-5+ix,200+5-iy,1.3) 	
 	 EndIf   
 	EndIf
 Next
EndIf
EndIf 
 glcolor3f(1,1,1)
 gldrawtext("+",xmax/2-150-5,200+5)
 glpopmatrix
 glenable GL_DEPTH_TEST
End Sub
Sub drawmap(texture As uint=0)
 gldisable GL_DEPTH_TEST
 glcolor3f(1,1,1)
 If texture<>0 Then 
 	glbindtexture(gl_texture_2d,texture)
 ElseIf testworld=0 Then 
 	glbindtexture(gl_texture_2d,maptext)
 Else 
 	glbindtexture(gl_texture_2d,worldtext)
 EndIf
 glpushmatrix
 glplacecursor(50,159)
 gltexcarre(2.5*640/(0.1+ymax))
 Dim As Single x,y,aux=(100/(k8*512*scalex))*1200/x960
 x=max(-48.0,min(48.0,(mx+dmx0)*aux))
 y=max(-48.0,min(48.0,(my+dmy0)*aux*scalex/scaley)) 
 If testworld=1 Then 
   /'aux=(8/40)/(4*k8*512*scalex)  
   Var mapautoix=535+worldx+(mx+dmx0)*aux*535
   Var mapautoiy=(276+worldy)-(my+dmy0)*aux*276*2*scalex/scaley
   x=max(-48.0,min(48.0,50*(mapautoix-535)/535))
   y=max(-48.0,min(48.0,50*(-mapautoiy+276)/276))'/    
   x=50*lng/180:y=50*lat/90
 EndIf   
 gldrawtext("+",50-5+x,159+5-y)
 glpopmatrix
 glenable GL_DEPTH_TEST
 If mapdisplay=1 Then displaymap()
 If mapdisplay=2 Then displaymap2()
 If mapdisplay=5 Then displaymap()
 If mapdisplay=3 Then displaymap2()
 /'If Abs(dmx0+mx-dmx000)<distmax/2 And Abs(dmy0+my-dmy000)<distmax/2 Then 
 	If Abs(dmx0-dmx000)>1 Or Abs(dmy0-dmy000)>1 Then
 		mx0=mx:my0=my
 		mx+=dmx0-dmx000:my+=dmy0-dmy000
      dmx=avionx-mx0:dmy=aviony-my0
      If Sqr(dmx*dmx+dmy*dmy)<30000 Then 
      	avionx+=dmx0-dmx000:aviony+=dmy0-dmy000
      EndIf
      dmx00=dmx0+(mx0-mx)*2:dmy00=dmy0+(my0-my)*2
      dmx0-=mx-mx0:dmy0-=my-my0
      'dmx00=dmx0:dmy00=dmy0
 		'dmx0=dmx000:dmy0=dmy000
 		If imap>=4 Then initterrain3
 	EndIf
 EndIf '/
End Sub
Dim Shared As Single caro2,caro3
Sub drawcar0
glpushmatrix
glplacecursor(xmax*0.57,ymax*0.75,-21)
caro2=0.055*caro2+0.945*sin2*10
caro3=0.055*caro3+0.945*sin3*10
glrotatef(caro2,1,0,0)
glrotatef(caro3,0,0,1)
glenable gl_texture_2d
glbindtexture(gl_texture_2d,cartext)
If carlist<>0 Then
   glcalllist carlist:glpopmatrix
Else
 carlist=glgenlists(1)
 glnewlist carlist,gl_compile 
 gldisable GL_DEPTH_TEST
 glEnable GL_BLEND
 glBlendFunc GL_one_minus_SRC_ALPHA,GL_SRC_ALPHA
 gldisable gl_lighting
 glcolor3f(1,1,1)
 glscalef(1,1.22,1)
 loadobjsize("objects/car.obj",@"",@"",83)
 gldisable GL_BLEND
 glEnable GL_DEPTH_TEST
glendlist
glpopmatrix
EndIf 
End Sub
Dim Shared As Single o2horse=0,o1horse=0,o3horse=0,tmovehorse=1,tframehorse=0,vhorse=0,vhorse2=0,o10
Dim Shared As Integer tmovehorse2=0,tmovehorse20=0
Dim Shared As uint horselist,horsetext
Sub subtestmovehorse()
	  Var test=0
	  If (guitestkey(vk_left) Or joy1dx<-8000) Then test=1':o1+=dt*0.07
     if (guitestkey(vk_right)Or joy1dx>8000) Then test=1':o1-=dt*0.07	  
     if (tfoothorse=1 and trun=1) Then test=0.97
     if (guitestkey(vk_up)Or guitestkey(vk_space) Or joy1dy<-8000) Then test=1.5';x+=dt*0.004*cos1;y+=dt*0.004*sin1;
     if (guitestkey(vk_down)or joy1dy>8000) Then test=1';x-=dt*0.003*cos1;y-=dt*0.003*sin1;
	  If(test>=0.1 And tfoothorse=1) Then
	  	tmovehorse=test
	  Else
	  	tmovehorse-=kfps*0.027
	  EndIf
	  If(tmovehorse<0) Then tmovehorse=0	
End Sub
Sub drawhorse()
	   subtestmovehorse()
	   Var tframe=time2
      tmovehorse20=tmovehorse2:tmovehorse2=0
		If guitestkey(vk_up)Or guitestkey(vk_space) Or joy1dy<-8000 Then tmovehorse2=3
      tframehorse+=30*kfps*(tmovehorse*0.6+0.3)
		o2horse=sin(tframehorse*0.0065)*4*tmovehorse
		o2horse+=sin(tframehorse*0.0016)*3-3'//*tmovehorse
		If o2horse<-0.3-3 And tmovehorse>0.001 Then
			if mz<waterz+25.1 Then
				If Timer>tsoundfoot+0.67 Then
					If ntownnear<2 Then soundwaterwave()
					soundfoot(2.4)
				EndIf
			Else
				soundfoot(2.4)
			EndIf 
		EndIf
		If guitestkey(vk_up)Or guitestkey(vk_space) Or joy1dy<-8000 Then vhorse2=0.1
		If guitestkey(vk_down)Or joy1dy>8000 Then o2horse+=7:vhorse2=0
		o1horse=sin(tframehorse*0.0014)*8
		o3horse=sin(tframehorse*0.0028)*23*cos(tframe*0.0003)
		if(o1>o10+0.0001) Then o3horse-=10:o1horse+=7:tmovehorse2=1
		if(o1<o10-0.0001) Then o3horse+=10:o1horse-=7:tmovehorse2=2
		o10=o1
		if(tmovehorse2<>tmovehorse20 And tmovehorse2<>0) Then 
		   If Rnd<0.3 Or (Rnd<0.6 And tmovehorse2=3) Then 
		        soundhorse()
		   EndIf 
		EndIf    
		glpushmatrix
		glloadidentity
		gltranslatef(0,-28-24*sin2,-38)
		glrotatef(o1horse, 0, 1, 0)
		glrotatef(43+o2horse-o2, 1, 0, 0)		
		glrotatef(-4+o3horse, 0, 0, 1)	
		glrotatef(44, 1, 0, 0)		
		glscalef(0.5,0.5,-0.5)
      glbindTexture(gl_TEXTURE_2D,  horsetext)
      glcalllist(horselist)
      glpopmatrix
End Sub 
Dim Shared As uint helentext,helengreentext,helenbluetext,helenredtext,helenyellowtext
Dim Shared As Integer testhelen,thelene
Dim Shared As Single helenx,heleny,helenz,heleno1,helenco1,helensi1,helenv=1,disthelen
Dim Shared As myobj_type helenobj,helenobj0,helenobj1,helenobj2 
Declare Sub setrangeGL(ByVal dist As Single=0)
Sub drawhelen(ByVal ilady As Integer)
Dim As Integer i,j,k 
If helentext=0 Then
	Randomize()
	helentext=guiloadtexture(ExePath+"/objects/lady/helene_bikini.jpg")
	helengreentext=guiloadtexture(ExePath+"/objects/lady/helene_bikini_green.jpg")
	helenbluetext=guiloadtexture(ExePath+"/objects/lady/helene_bikini_blue.jpg")
	helenredtext=guiloadtexture(ExePath+"/objects/lady/helene_bikini_red.jpg")
	helenyellowtext=guiloadtexture(ExePath+"/objects/lady/helene_bikini_yellow.jpg")
   load3DSsizeptr(ExePath+"/objects/lady/helene_bikini.3ds",@helenobj0,150)
   load3DSsizeptr(ExePath+"/objects/lady/helene_bikini_walk1.3ds",@helenobj1,150)
   load3DSsizeptr(ExePath+"/objects/lady/helene_bikini_walk2.3ds",@helenobj2,150)
	helenobj=helenobj0
	helenx=45
	heleny=my-(100+Rnd*400)*Sgn(Rnd-0.5)
	helenz=0
	heleno1=90*Sgn(my-heleny)
	helenco1=Cos(heleno1*degtorad)
	helensi1=Sin(heleno1*degtorad)
EndIf
glcolor3f(1,1,1)
'glbindtexture(GL_TEXTURE_2D,helentext)
Var itext=ilady Mod 5
If itext=0 Then glbindtexture(gl_texture_2d,helentext)
If itext=1 Then glbindtexture(gl_texture_2d,helenredtext)
If itext=2 Then glbindtexture(gl_texture_2d,helenyellowtext)
If itext=3 Then glbindtexture(gl_texture_2d,helenbluetext)
If itext=4 Then glbindtexture(gl_texture_2d,helengreentext)
'helenco1=Cos(heleno1*degtorad)
'helensi1=Sin(heleno1*degtorad)
Var d7=9.0
Var dist=max(Abs(mx-helenx-d7*helenco1),Abs(my-heleny-d7*helensi1))
Var disthelen=max(Abs(mx-helenx),Abs(my-heleny))
testhelen=0
thelene=0
If disthelen<20 Then thelene=1
If disthelen<6.5 And plane=0 Then
	Var dxx=max(0.0,(mx-helenx)*cos1+(my-heleny)*sin1)
	mx-=cos1*(dxx+7.3-disthelen)
	my-=sin1*(dxx+7.3-disthelen)
EndIf
If dist<5 Then
	If disthelen>8.5 Then testhelen=1
Else 	
 'Var vv=0.22
 'helenx+=helenco1*vv*kfps*helenv
 'heleny+=helensi1*vv*kfps*helenv
EndIf 
helenv=1
rotavion(helenx-mx,heleny-my,helenz-mz)
If x2>0.9*max(Abs(y2),Abs(z2))-80 Then
	If x2<15 Then setrangeGL(0)
	glenable gl_lighting
	glpushmatrix
	gltranslatef(helenx,heleny,helenz)
	glrotatef(heleno1+92,0,0,1)
	glrotatef(-2.5,0,1,0)
	Var sc=0.13:glscalef(sc,sc,sc*1.26)
	Var kt=1.9*Timer
	Var kx=(1+Cos(kt))*0.8
	morphobj3ds(@helenobj,@helenobj0,kx,@helenobj1,(1-kx))
	Var kx2=(1+Sin(kt))*0.65
	morphobj3ds(@helenobj,@helenobj,kx2,@helenobj2,(1-kx2))
	helenv=kx*0.5+kx2*0.5+0.5
	draw3DSptrsmooth(@helenobj)
   'draw3DSptr(@myobj)
	glpopmatrix	
	gldisable gl_lighting
	If x2<15 Then setrangeGL(4000)
EndIf
End Sub 
Const As Integer nlady=70
Dim Shared As uint ladytext,ladylefttext,ladyredtext,ladyredlefttext,ladyyellowtext,ladyyellowlefttext
Dim Shared As uint ladybluetext,ladybluelefttext,ladygreentext,ladygreenlefttext
Dim Shared As uint ladybikinitext,ladybikinilefttext,ladybikiniyellowtext,ladybikiniyellowlefttext
Dim Shared As uint ladybikiniredtext,ladybikiniredlefttext,ladybikinibluetext,ladybikinibluelefttext
Dim Shared As uint ladybikinigreentext,ladybikinigreenlefttext
Dim Shared As Integer tinitlady=0,ladyiroad(nlady)
Dim Shared As Single ladyx(nlady),ladyy(nlady),ladyz(nlady),ladyo1(nlady),distlady
Dim Shared As Integer ishadowlady,shadowilady(nlady),shadowladytexture(nlady)
Dim Shared As Single ladyzshadow(nlady),ladydo2shadow(nlady),ladydo3shadow(nlady),ladyzshadow3(nlady)
Declare Function getrandomnearroad(x As Single,y As Single,n0 As Integer,nco1 As Single,nsi1 As Single,ddr0 As Single=0,tback As Integer=0)As Integer
Dim Shared As Integer irandomnearroad(400),nrandomnearroad,myncari
dim shared as single xrandomnearroad(400)
Dim Shared As Integer helenilady,helenilady0
Dim Shared As Single helendistlady,helendistlady0
Declare Sub drawshadowlady()
Sub addshadowilady(i As Integer)
	If ishadowlady<nlady Then
		ishadowlady+=1
		shadowilady(ishadowlady)=i
	EndIf
End Sub
Sub drawladys()
Dim As Integer i,j,k
distlady=1100.0
Var dmax=1100.0
If tinitlady=0 And tupdatelady=1 Then
	tinitlady=1
	For i=1 To nlady
		ladyx(i)=mx+dmx0+1.9*(Rnd-0.5)*distlady*2
		ladyy(i)=my+dmy0+1.9*(Rnd-0.5)*distlady*2
		ladyz(i)=waterz-999999
	Next
EndIf 
glenable gl_alpha_test
glAlphaFunc(gl_less,50/254)
'glcolor4f(0.9,1,0.9,1)
glcolor4f(1.1,1.1,1.1,1)
ishadowlady=0
helenilady0=helenilady
helenilady=0
helendistlady0=helendistlady
helendistlady=9999
if helenilady0=0 then thelene=0
For i=1 To nlady
	Var tupdate=tupdatelady
	Var dist=max(Abs(ladyx(i)-mx-dmx0),Abs(ladyy(i)-my-dmy0))
	If dist>distlady+distlady Then
		ladyx(i)=mx+dmx0+1.9*(Rnd-0.5)*distlady
		ladyy(i)=my+dmy0+1.9*(Rnd-0.5)*distlady
		ladyz(i)=waterz-999999
		dist=max(Abs(ladyx(i)-mx-dmx0),Abs(ladyy(i)-my-dmy0))
		tupdate=1
	EndIf
	Var nntownnear=ntownnear
	If oceansound=1 Then nntownnear=ntownnear*0.5+3
	If dist>distlady Then
		Var do1=o1+(Rnd-0.5)*120,kx=1.0
		If i>nntownnear*3 Then do1=Rnd*360
		Var x=mx+dmx0+kx*distlady*Cos(degtorad*do1)*(0.7+Rnd*0.2)
		Var y=my+dmy0+kx*distlady*Sin(degtorad*do1)*(0.7+Rnd*0.2)
		ladyo1(i)=do1-180
		ladyx(i)=x
		ladyy(i)=y
		tupdate=1
	 If i<=nntownnear*3 Then 
		Var n=getrandomnearroad(x,y,-1,Cos((do1+180)*degtorad),Sin((do1+180)*degtorad))
		ladyiroad(i)=n
		Var n0=n
		If n0>0 Then
		  Var dist=0.0,xx=0.0,yy=0.0
		  For n=0 To nrandomnearroad-1
		  	Var co1=co1nearroad(n),si1=si1nearroad(n)
			For j=0 To 14
			  'j=Int(Rnd*15)
			  xx=xnearroad(n)+(j/15)*co1*drnearroad(n)/(0.1+rnearroad(n))
			  yy=ynearroad(n)+(j/15)*si1*drnearroad(n)/(0.1+rnearroad(n))
			  Var dist1=max(Abs(xx-mx-dmx0),Abs(yy-my-dmy0))
			  If dist<dist1 And dist1<dmax*0.9 And Rnd<0.5 Then
			  	 dist=dist1
			  	 var dr=Rnd*0.059
			  	 ladyx(i)=xx+i*co1*0.2+si1*(1.2+dr)
			  	 ladyy(i)=yy+i*si1*0.2-co1*(1.2+dr)
		       ladyiroad(i)=n
			  EndIf 
			Next j  
	     Next n 	
   	EndIf
     	'If gettestnearroad(ladyx(i),ladyy(i),-15)<>0 Then
     	If gettestnearroad(ladyx(i),ladyy(i),-10)<>0 Then
     		ladyz(i)=waterz-999999
     	Else 	
     		  ladyz(i)=getterrainheight(ladyx(i),ladyy(i))
     	EndIf
	 Else
		ladyz(i)=waterz-999999
	 EndIf 	
	EndIf
   'ladyx(i)=mx+i*30:ladyy(i)=my+(i Mod 4)*50
   'ladyz(i)=getterrainheight(ladyx(i),ladyy(i))+12	
	If ladyz(i)<waterz-0.99-2 Then Continue For 
	If ladyz(i)<waterz-0.7-1.4 and ntownnear<1 Then Continue For
  	If tupdate=1 Then 
  		ladyz(i)=getterrainheight(ladyx(i),ladyy(i))
     	ladyzshadow(i)=getterrainheight(ladyx(i)+dxshadow*30,ladyy(i)+dyshadow*30)
     	ladydo2shadow(i)=diro1(30*dxyshadow,ladyzshadow(i)-ladyz(i))
     	ladyzshadow3(i)=getterrainheight(ladyx(i)-dyshadow*30,ladyy(i)+dxshadow*30)
     	ladydo3shadow(i)=diro1(30*dxyshadow,ladyzshadow3(i)-ladyz(i))
  	EndIf
	rotavion(ladyx(i)-mx-dmx0,ladyy(i)-my-dmy0,ladyz(i)-mz)
	If x2>-200 And x2<1200 Then addshadowilady(i)
	If x2>0.9*max(Abs(y2),Abs(z2))-140 Then
		If x2>0.99*max(Abs(y2),Abs(z2)) And x2<40 And v>0.7 Then
			soundhi() 
		EndIf
		If helendistlady>dist And oceansound=1 Then
			helendistlady=dist
			helenilady=i
		EndIf
  		If Rnd<0.02*kfps Then
  			ladyo1(i)+=(Rnd-0.5)*180
  			If ladyo1(i)>180 Then ladyo1(i)-=360
  			If ladyo1(i)<-180 Then ladyo1(i)+=360
  		EndIf
		If i=helenilady0 And dist<60 Then
			helenx=ladyx(i):heleny=ladyy(i):helenz=ladyz(i):heleno1=ladyo1(i)
         gldisable gl_alpha_test
			drawhelen(i)
         glenable gl_alpha_test
			Continue For 
		EndIf
		Var do1=diro1(ladyx(i)-mx-dmx0,ladyy(i)-my-dmy0)
		Var ddo1=(Int(do1-ladyo1(i)+3600)Mod 360)-180
		Var itext=i Mod 5
		If ddo1>45 And ddo1<135 Then 
   	  shadowladytexture(i)=1
		  If oceansound=1 Then 
		  	If itext=0 Then glbindtexture(gl_texture_2d,ladybikinilefttext)
		   If itext=1 Then glbindtexture(gl_texture_2d,ladybikiniredlefttext)
		   If itext=2 Then glbindtexture(gl_texture_2d,ladybikiniyellowlefttext)
		   If itext=3 Then glbindtexture(gl_texture_2d,ladybikinibluelefttext)
		   If itext=4 Then glbindtexture(gl_texture_2d,ladybikinigreenlefttext)
		  Else
		   If itext=0 Then glbindtexture(gl_texture_2d,ladylefttext)
		   If itext=1 Then glbindtexture(gl_texture_2d,ladyredlefttext)
		   If itext=2 Then glbindtexture(gl_texture_2d,ladyyellowlefttext)
		   If itext=3 Then glbindtexture(gl_texture_2d,ladybluelefttext)
		   If itext=4 Then glbindtexture(gl_texture_2d,ladygreenlefttext)
		  EndIf 
		ElseIf ddo1<-45 And ddo1>-135 Then  
		  shadowladytexture(i)=2
		  If oceansound=1 Then 
		  	If itext=0 Then glbindtexture(gl_texture_2d,ladybikinilefttext)
		   If itext=1 Then glbindtexture(gl_texture_2d,ladybikiniredlefttext)
		   If itext=2 Then glbindtexture(gl_texture_2d,ladybikiniyellowlefttext)
		   If itext=3 Then glbindtexture(gl_texture_2d,ladybikinibluelefttext)
		   If itext=4 Then glbindtexture(gl_texture_2d,ladybikinigreenlefttext)
		  Else
		   If itext=0 Then glbindtexture(gl_texture_2d,ladylefttext)
		   If itext=1 Then glbindtexture(gl_texture_2d,ladyredlefttext)
		   If itext=2 Then glbindtexture(gl_texture_2d,ladyyellowlefttext)
		   If itext=3 Then glbindtexture(gl_texture_2d,ladybluelefttext)
		   If itext=4 Then glbindtexture(gl_texture_2d,ladygreenlefttext)
		  EndIf  
		  do1+=180
		ElseIf ddo1>-45 And ddo1<45 Then 
		  shadowladytexture(i)=0
		  If oceansound=1 Then 
		  	If itext=0 Then glbindtexture(gl_texture_2d,ladybikinitext)
		   If itext=1 Then glbindtexture(gl_texture_2d,ladybikiniredtext)
		   If itext=2 Then glbindtexture(gl_texture_2d,ladybikiniyellowtext)
		   If itext=3 Then glbindtexture(gl_texture_2d,ladybikinibluetext)
		   If itext=4 Then glbindtexture(gl_texture_2d,ladybikinigreentext)
		  Else
		   If itext=0 Then glbindtexture(gl_texture_2d,ladytext)
		   If itext=1 Then glbindtexture(gl_texture_2d,ladyredtext)
		   If itext=2 Then glbindtexture(gl_texture_2d,ladyyellowtext)
		   If itext=3 Then glbindtexture(gl_texture_2d,ladybluetext)
		   If itext=4 Then glbindtexture(gl_texture_2d,ladygreentext)
		  EndIf  
		Else
		  shadowladytexture(i)=3
		  If oceansound=1 Then 
		  	If itext=0 Then glbindtexture(gl_texture_2d,ladybikinitext)
		   If itext=1 Then glbindtexture(gl_texture_2d,ladybikiniredtext)
		   If itext=2 Then glbindtexture(gl_texture_2d,ladybikiniyellowtext)
		   If itext=3 Then glbindtexture(gl_texture_2d,ladybikinibluetext)
		   If itext=4 Then glbindtexture(gl_texture_2d,ladybikinigreentext)
		  Else
		   If itext=0 Then glbindtexture(gl_texture_2d,ladytext)
		   If itext=1 Then glbindtexture(gl_texture_2d,ladyredtext)
		   If itext=2 Then glbindtexture(gl_texture_2d,ladyyellowtext)
		   If itext=3 Then glbindtexture(gl_texture_2d,ladybluetext)
		   If itext=4 Then glbindtexture(gl_texture_2d,ladygreentext)
		  EndIf
		  do1+=180
		EndIf    
		glpushmatrix
		gltranslatef(ladyx(i),ladyy(i),ladyz(i)+3)'12)
		'glrotatef(o1,0,0,1)
		gltexcarre2rot(11,21,-do1)
		glpopmatrix
	EndIf
Next
glcolor4f(1,1,1,1)
gldisable gl_alpha_test 
'drawshadowlady()
End Sub
Sub drawshadowlady()
If tshadow=0 Or ishadowlady=0 Then Exit Sub 
Dim As Integer i,j,k 
glenable gl_alpha_test
glAlphaFunc(gl_less,100/254)
glenable gl_texture_2D
glcolor4f(1,1,1,1)
'glEnable GL_BLEND
'glBlendFunc GL_zero,GL_src_ALPHA
Dim As Single auxy,auxz,scale=2
auxy=68*scale:auxz=70*scale
Var do1sun=o1shadow'diro1(dxshadow,dyshadow)
'auxvar6=ishadowtree:auxtest=1
For j=1 To ishadowlady
	  i=shadowilady(j)	
     glpushmatrix
     'gltranslatef(ladyx(i),ladyy(i),ladyz(i)+12+max(0.0,(ladyzshadow(i)-ladyz(i))*0.3))
     gltranslatef(ladyx(i),ladyy(i),ladyz(i)+3+max(0.0,(ladyzshadow(i)-ladyz(i))*0.3))
     Var auxyy=11
     Var auxzz=21*min(2.0,dxyshadow/max(0.001,Abs(dzshadow)))
     If oceansound=1 Then  
      If shadowladytexture(i)=0 Then
     	  glbindtexture(gl_texture_2d,ladybikinitext)
      ElseIf shadowladytexture(i)=3 Then
     	  glbindtexture(gl_texture_2d,ladybikinitext)
     	  auxyy=-auxyy
      ElseIf shadowladytexture(i)=1 Then
     	  glbindtexture(gl_texture_2d,ladybikinilefttext)
      Else 
     	  glbindtexture(gl_texture_2d,ladybikinilefttext)
     	  auxyy=-auxyy
      EndIf
     Else
      If shadowladytexture(i)=0 Then
     	  glbindtexture(gl_texture_2d,ladytext)
      ElseIf shadowladytexture(i)=3 Then
     	  glbindtexture(gl_texture_2d,ladytext)
     	  auxyy=-auxyy
      ElseIf shadowladytexture(i)=1 Then
     	  glbindtexture(gl_texture_2d,ladylefttext)
      Else 
     	  glbindtexture(gl_texture_2d,ladylefttext)
     	  auxyy=-auxyy
      EndIf
     EndIf  
     Var do1=diro1(ladyx(i)-20*cos1-mx,ladyy(i)-20*sin1-my)
     Var do2=ladydo2shadow(i)'diro1(50*dxyshadow,arbrezshadow(i)-arbrez(i))
     Var do3=ladydo3shadow(i)
       If tnightshadow=1 Then
         glrotatef(do1,0,0,1)
       Else	
       	glrotatef(do1sun,0,0,1)
       EndIf
       glrotatef(90-do2,0,1,0)
       glrotatef(do3,0,0,1)
       gltexcarre2 auxyy,auxzz       
     glpopmatrix
Next j
gldisable gl_alpha_test
gldisable gl_blend
End Sub
const as integer npanel=50
Dim Shared As Single panelx(npanel),panely(npanel),panelz(npanel),panelo1(npanel),distpanel
Dim Shared As Integer shadowipanel(npanel)
Dim Shared As uint shadowpaneltexture(npanel)
Dim Shared As Single panelzshadow(npanel),paneldo2shadow(npanel),paneldo3shadow(npanel),panelzshadow3(npanel)
Dim Shared As Single paneldo1shadow(npanel)
Dim Shared As uint shadowcrosstext,shadowonewaytext,shadowparkingtext,shadowcitytext,shadowcitykmtext,shadowlamptext
Dim Shared As uint shadowstoptext
Sub addshadowpanel(x As Single,y As Single,paneltext As uint,do1 As Single=0)
   If ishadowpanel>=npanel Then Exit Sub
   ishadowpanel+=1
   Var i=ishadowpanel
   panelx(i)=x:panely(i)=y
 	panelz(i)=getterrainheight(panelx(i),panely(i))
	rotavion(panelx(i)-mx-dmx0,panely(i)-my-dmy0,panelz(i)-mz)
	If x2<-400 or x2>1200 Then ishadowpanel-=1:Exit Sub 
  	shadowpaneltexture(i)=paneltext 
  	paneldo1shadow(i)=do1
  	panelzshadow(i)=getterrainheight(panelx(i)+dxshadow*30,panely(i)+dyshadow*30)
  	paneldo2shadow(i)=diro1(30*dxyshadow,panelzshadow(i)-panelz(i))
  	panelzshadow3(i)=getterrainheight(panelx(i)-dyshadow*30,panely(i)+dxshadow*30)
  	paneldo3shadow(i)=diro1(30*dxyshadow,panelzshadow3(i)-panelz(i))	
End Sub
Sub drawshadowpanel()     
If tshadow=0 Or ishadowpanel=0 Then Exit Sub 
Dim As Integer i,j,k 
glenable gl_alpha_test
glAlphaFunc(gl_less,100/254)
glenable gl_texture_2D
glcolor4f(1,1,1,1)
'glEnable GL_BLEND
'glBlendFunc GL_zero,GL_src_ALPHA
Dim As Single auxy,auxz,scale=2
auxy=68*scale:auxz=70*scale
Var do1sun=o1shadow'diro1(dxshadow,dyshadow)
'auxvar6=ishadowtree:auxtest=1
If shadowcrosstext=0 Then glbindtexture(gl_texture_2d,shadowcrosstext)
If shadowstoptext=0 Then glbindtexture(gl_texture_2d,shadowstoptext)
If shadowonewaytext=0 Then glbindtexture(gl_texture_2d,shadowonewaytext)
If shadowparkingtext=0 Then glbindtexture(gl_texture_2d,shadowparkingtext)
If shadowcitytext=0 Then glbindtexture(gl_texture_2d,shadowcitytext)
If shadowcitykmtext=0 Then glbindtexture(gl_texture_2d,shadowcitykmtext)
If shadowlamptext=0 Then glbindtexture(gl_texture_2d,shadowlamptext)
For i=1 To ishadowpanel
     glpushmatrix
     gltranslatef(panelx(i),panely(i),panelz(i)+5+max(0.0,(panelzshadow(i)-panelz(i))*0.3))
     Var auxyy=15
     Var auxzz=29*min(2.0,dxyshadow/max(0.001,Abs(dzshadow)))
     If shadowpaneltexture(i)=shadowcitykmtext Then
     	auxyy=40
     	auxzz*=2
     EndIf
     If shadowpaneltexture(i)=shadowcitytext Then
     	auxyy=35
     	auxzz*=0.65
     EndIf 	
     If shadowpaneltexture(i)=shadowlamptext Then
     	Var so1=paneldo1shadow(i)-do1sun
     	While so1>180:so1-=360:Wend
     	While so1<-180:so1+=360:wend 
     	If so1>0 Then auxyy=10 Else auxyy=-10
     	auxzz*=2.2
     EndIf 	
  	  glbindtexture(gl_texture_2d,shadowpaneltexture(i))
     Var do1=diro1(panelx(i)-20*cos1-mx,panely(i)-20*sin1-my)
     Var do2=paneldo2shadow(i)'diro1(50*dxyshadow,arbrezshadow(i)-arbrez(i))
     Var do3=paneldo3shadow(i)
       If tnightshadow=1 Then
         glrotatef(do1,0,0,1)
       Else	
       	glrotatef(do1sun,0,0,1)
       EndIf
       glrotatef(90-do2,0,1,0)
       glrotatef(do3,0,0,1)
       gltexcarre2 auxyy,auxzz 
     glpopmatrix
Next i
gldisable gl_alpha_test
gldisable gl_blend
End Sub
Const As Integer ncar=50
dim shared as integer ncariroad(ncar),ncar22
Dim Shared As Single ncarx(ncar),ncary(ncar),ncarz(ncar),ncaro1(ncar),ncaro2(ncar),ncaro3(ncar)
Dim Shared As Single nncarx(ncar),nncary(ncar),nncarz(ncar),nncaro1(ncar),nncaro2(ncar),nncaro3(ncar)
Dim Shared As Single ncarv(ncar),ncarco1(ncar),ncarsi1(ncar),nncarv(ncar),loganwheelrot(ncar),volantrots(ncar)
Dim Shared As Single ncarvv(ncar),ncarxx0(ncar),ncaryy0(ncar),nvmx2,nvmy2
Dim Shared As Double ncartimeroad(ncar)
Dim Shared As uint ncartext,logantext,wheellist,ncarlist,ncarpolicelist,ncarpolicetext
Sub setmyroadlatlon()
	'myroadlat=-99
	Var nn=ncariroad(0)
	If nn=0 Then Exit Sub
	Var ij=ijnearroad(nn),i=iinearroad(nn)
	If ij=0 Or i=0 Then Exit Sub
	Var xx=townwaynodex(ij,i,1)
	Var yy=townwaynodey(ij,i,1)
	Var n=towniwaynode(ij,i)
	Var x=townwaynodex(ij,i,n)
	Var y=townwaynodey(ij,i,n)
	Var dxx=(xx-mx)*cos1+(yy-my)*sin1
	Var dx=(x-mx)*cos1+(y-my)*sin1
	Var lat0=lat,lng0=lng
	If dxx>dx Then 
	   mxytolatlng(xx,yy)
	   myroadlat=lat:myroadlon=lng
	Else    
	   mxytolatlng(x,y)
	   myroadlat=lat:myroadlon=lng
	EndIf    
	lat=lat0:lng=lng0
End Sub
Sub drawncarpolice(i As Integer)
glenable gl_texture_2d
glbindtexture(gl_texture_2d,ncarpolicetext)
glcolor3f(1,1,1)
glcalllist ncarpolicelist
      'glscalef(1.2,1.2,1.2)
		'myglcalllist roverlist
		glcolor3f(1,1,1)
		glbindtexture(gl_texture_2d,logantext)
		loganwheelrot(i)+=kfps*(3+0.3*Rnd)*ncarv(i)
      If loganwheelrot(i)>10000 Then loganwheelrot(i)=0
		glpushmatrix
		gltranslatef(48,28,12)
		glrotatef(90+volantrots(i),0,0,1)
		glrotatef(loganwheelrot(i),1,0,0)
		glcalllist wheellist
		glpopmatrix
		glpushmatrix
		gltranslatef(48,-28,12)
		glrotatef(-90+volantrots(i),0,0,1)
		glrotatef(loganwheelrot(i),-1,0,0)
		glcalllist wheellist
		glpopmatrix
		glpushmatrix
		gltranslatef(-44,30,12)
		glrotatef(90,0,0,1)
		glrotatef(loganwheelrot(i),1,0,0)
		glcalllist wheellist
		glpopmatrix
		glpushmatrix
		gltranslatef(-44,-30,12)
		glrotatef(-90,0,0,1)
		glrotatef(loganwheelrot(i),-1,0,0)
		glcalllist wheellist
		glpopmatrix			
End Sub
Dim Shared As uint carshadowtext,carshadowbacktext,carpoliceshadowtext,carpoliceshadowbacktext
Dim Shared As Integer tcarpolice,icarshadow,nicarshadow(200)
sub gltexcarreshadow(byval x As Single,co1 As Single,si1 As single,dr As Single,ByVal tx As Single=1)
Dim As Single x1,x0,dx,dy
x1=x*0.5:x0=-x1
dx=dr*si1:dy=dr*co1
	glbegin(gl_quads)
	glTexCoord2f(0,0)
	glvertex3f(0,x0,0)
	gltexcoord2f(-tx,0)
	glvertex3f(0,x1,0)
	glTexCoord2f(-tx,tx)
	glvertex3f(dy,x1+dx,0)
	gltexcoord2f(0,tx)
	glvertex3f(dy,x0+dx,0)
	glend()
End Sub
Sub drawncarpoliceshadow(i As Integer)
glenable gl_alpha_test
glAlphaFunc(gl_less,100/254)
glpushmatrix
gltranslatef(ncarx(i),ncary(i),ncarz(i)+9)
glrotatef(ncaro1(i),0,0,1)
glrotatef(ncaro2(i),0,-1,0)
glrotatef(ncaro3(i),1,0,0)
glbindtexture(gl_texture_2D,carpoliceshadowtext)
Var co1=Cos(degtorad*(o1shadow-ncaro1(i))),si1=Sin(degtorad*(o1shadow-ncaro1(i)))
Var dr=dxyshadow/max(0.2,dzshadow)
glpushmatrix
glrotatef(90,0,0,1)
gltranslatef(10,-3,0)
gltexcarreshadow(65,si1,-co1,20*dr)
gltranslatef(-20,0,0)
gltexcarreshadow(65,si1,-co1,20*dr)
glpopmatrix
glbindtexture(gl_texture_2D,carpoliceshadowbacktext)
gltranslatef(21,0,0)
gltexcarreshadow(30,co1,si1,20*dr)
gltranslatef(-34,0,0)
gltexcarreshadow(30,co1,si1,20*dr)
glpopmatrix
gldisable gl_alpha_test
End Sub
Sub drawncarshadow(i As Integer)
If i=1 Or i=5 Or i=12 Or i=24 Or i=40 Then tcarpolice=1 Else tcarpolice=0
If tcarpolice=1 Then drawncarpoliceshadow(i):Exit sub
glenable gl_alpha_test
glAlphaFunc(gl_less,100/254)
glpushmatrix
gltranslatef(ncarx(i),ncary(i),ncarz(i)+9)
glrotatef(ncaro1(i),0,0,1)
glrotatef(ncaro2(i),0,-1,0)
glrotatef(ncaro3(i),1,0,0)
glbindtexture(gl_texture_2D,carshadowtext)
Var co1=Cos(degtorad*(o1shadow-ncaro1(i))),si1=Sin(degtorad*(o1shadow-ncaro1(i)))
Var dr=dxyshadow/max(0.2,dzshadow)
glpushmatrix
glrotatef(90,0,0,1)
gltranslatef(10,0,0)
gltexcarreshadow(65,si1,-co1,20*dr)
gltranslatef(-20,0,0)
gltexcarreshadow(65,si1,-co1,20*dr)
glpopmatrix
glbindtexture(gl_texture_2D,carshadowbacktext)
gltranslatef(17,0,0)
gltexcarreshadow(30,co1,si1,20*dr)
gltranslatef(-34,0,0)
gltexcarreshadow(30,co1,si1,20*dr)
glpopmatrix
gldisable gl_alpha_test
End Sub
Dim Shared As uint shadowc150text
Dim Shared As Single sunco1=1,sunsi1=0
Sub drawc150shadow(mmx As Single,mmy As Single,mmz As Single,mmzsol00 As Single,scale As Single,ccos1 As Single,csin1 As Single,ccos2 As Single,ccos3 As single)
Var z9=14.0
If mmz>mzsol00+80 And piste=0 Then z9+=21
Var xx=mmx+(mmz+z9-mmzsol00)*sunco1*suntan2
Var yy=mmy+(mmz+z9-mmzsol00)*sunsi1*suntan2
Var zz=getterrainheight(xx,yy)
rotavion(xx-mx,yy-my,zz-mz)
If x2<0.8*max(Abs(y2),Abs(z2))-1000 Then Exit Sub
Var co2=0.5+0.5*ccos2
Var co3=0.5+0.5*ccos3  
Var x70=70.0*scale
Var x95=95.0*scale  
Var xx0=xx+x70*ccos1*co2-x95*csin1*co3
Var yy0=yy+x70*csin1*co2+x95*ccos1*co3
Var zz0=getterrainheight(xx0,yy0)
Var xx1=xx+x70*ccos1*co2+x95*csin1*co3
Var yy1=yy+x70*csin1*co2-x95*ccos1*co3
Var zz1=getterrainheight(xx1,yy1)
Var x0=xx-(xx1-xx)
Var y0=yy-(yy1-yy)
Var z0=zz-(zz1-zz)
Var x1=xx-(xx0-xx)
Var y1=yy-(yy0-yy)
Var z1=zz-(zz0-zz)
Var z11=(mz-mmzsol00)*0.04+max(0.0,x2)*0.005+15
'gldisable gl_alpha_test
'glAlphaFunc(gl_less,10/254)
glEnable GL_BLEND
glBlendFunc GL_zero,GL_one_minus_src_ALPHA
glcolor4f(1,1,1,1)
glbindtexture(gl_texture_2D,shadowc150text)
	glbegin(gl_quads)
	glTexCoord2f(0,0)
	glvertex3f(x0,y0,z0+z11)
	gltexcoord2f(1,0)
	glvertex3f(x1,y1,z1+z11)
	glTexCoord2f(1,1)
	glvertex3f(xx1,yy1,zz1+z11)
	gltexcoord2f(0,1)
	glvertex3f(xx0,yy0,zz0+z11)
	glend()
'gldisable gl_alpha_test
gldisable gl_blend
End Sub
Dim Shared As uint shadow737text
Sub draw737shadow(mmx As Single,mmy As Single,mmz As Single,mmzsol00 As Single,scale As Single,ccos1 As Single,csin1 As Single,ccos2 As Single,ccos3 As single)
Var z9=14.0
Var xx=mmx+(mmz+z9-mmzsol00)*sunco1*suntan2
Var yy=mmy+(mmz+z9-mmzsol00)*sunsi1*suntan2
Var zz=getterrainheight(xx,yy)
rotavion(xx-mx,yy-my,zz-mz)
If x2<0.85*max(Abs(y2),Abs(z2))-1000 Then Exit Sub
Var co2=0.5+0.5*ccos2
Var co3=0.5+0.5*ccos3
Var x70=70.0*scale
Var x95=95.0*scale  
Var xx0=xx+x70*ccos1*co2-x95*csin1*co3
Var yy0=yy+x70*csin1*co2+x95*ccos1*co3
Var zz0=getterrainheight(xx0,yy0)
Var xx1=xx+x70*ccos1*co2+x95*csin1*co3
Var yy1=yy+x70*csin1*co2-x95*ccos1*co3
Var zz1=getterrainheight(xx1,yy1)
Var x0=xx-(xx1-xx)
Var y0=yy-(yy1-yy)
Var z0=zz-(zz1-zz)
Var x1=xx-(xx0-xx)
Var y1=yy-(yy0-yy)
Var z1=zz-(zz0-zz)
Var z11=(mz-mmzsol00)*0.06+15+max(0.0,x2)*0.005
'gldisable gl_alpha_test
'glAlphaFunc(gl_less,10/254)
glEnable GL_BLEND
glBlendFunc GL_zero,GL_one_minus_src_ALPHA
glcolor4f(1,1,1,1)
glbindtexture(gl_texture_2D,shadow737text)
	glbegin(gl_quads)
	glTexCoord2f(0,0)
	glvertex3f(x0,y0,z0+z11)
	gltexcoord2f(1,0)
	glvertex3f(x1,y1,z1+z11)
	glTexCoord2f(1,1)
	glvertex3f(xx1,yy1,zz1+z11)
	gltexcoord2f(0,1)
	glvertex3f(xx0,yy0,zz0+z11)
	glend()
'gldisable gl_alpha_test
gldisable gl_blend
End Sub
Dim Shared As uint shadowballontext
Sub drawballonshadow(mmx As Single,mmy As Single,mmz As Single,mmzsol00 As Single,scale As Single,ccos1 As Single,csin1 As Single,ccos2 As Single,ccos3 As single)
Var z9=14.0
Var xx=mmx+(mmz+z9-mmzsol00)*sunco1*suntan2
Var yy=mmy+(mmz+z9-mmzsol00)*sunsi1*suntan2
Var zz=getterrainheight(xx,yy)
rotavion(xx-mx,yy-my,zz-mz)
If x2<0.85*max(Abs(y2),Abs(z2))-1000 Then Exit Sub
Var co2=0.5+0.5*ccos2
Var co3=0.5+0.5*ccos3
Var x70=120.0*scale
Var x95=95.0*scale  
Var xx0=xx+x70*ccos1*co2-x95*csin1*co3
Var yy0=yy+x70*csin1*co2+x95*ccos1*co3
Var zz0=getterrainheight(xx0,yy0)
Var xx1=xx+x70*ccos1*co2+x95*csin1*co3
Var yy1=yy+x70*csin1*co2-x95*ccos1*co3
Var zz1=getterrainheight(xx1,yy1)
Var x0=xx-(xx1-xx)
Var y0=yy-(yy1-yy)
Var z0=zz-(zz1-zz)
Var x1=xx-(xx0-xx)
Var y1=yy-(yy0-yy)
Var z1=zz-(zz0-zz)
Var z11=(mz-mmzsol00)*0.06+15+max(0.0,x2)*0.005
'gldisable gl_alpha_test
'glAlphaFunc(gl_less,10/254)
glEnable GL_BLEND
glBlendFunc GL_zero,GL_one_minus_src_ALPHA
glcolor4f(1,1,1,1)
glbindtexture(gl_texture_2D,shadowballontext)
	glbegin(gl_quads)
	glTexCoord2f(0,0)
	glvertex3f(x0,y0,z0+z11)
	gltexcoord2f(1,0)
	glvertex3f(x1,y1,z1+z11)
	glTexCoord2f(1,1)
	glvertex3f(xx1,yy1,zz1+z11)
	gltexcoord2f(0,1)
	glvertex3f(xx0,yy0,zz0+z11)
	glend()
'gldisable gl_alpha_test
gldisable gl_blend
End Sub
Sub addicarshadow(i As Integer)
	If icarshadow<200 Then
		icarshadow+=1:nicarshadow(icarshadow)=i
	EndIf
End Sub
Sub drawshadowcar()
Dim As Integer i
If icarshadow=0 Then Exit Sub
For i=1 To icarshadow
	drawncarshadow(nicarshadow(i))
Next
End Sub
Sub drawncar(i As Integer)
glscalef(0.7,0.7,0.9)
If tcarpolice=1 Then drawncarpolice(i):Exit sub
glenable gl_texture_2d
glbindtexture(gl_texture_2d,ncartext)
glcalllist ncarlist
      'glscalef(1.2,1.2,1.2)
		'myglcalllist roverlist
		glcolor3f(1,1,1)
		glbindtexture(gl_texture_2d,logantext)
		loganwheelrot(i)+=kfps*(3+0.3*Rnd)*ncarv(i)
      If loganwheelrot(i)>10000 Then loganwheelrot(i)=0
		glpushmatrix
		gltranslatef(44,28,12)
		glrotatef(90+volantrots(i),0,0,1)
		glrotatef(loganwheelrot(i),1,0,0)
		glcalllist wheellist
		glpopmatrix
		glpushmatrix
		gltranslatef(44,-28,12)
		glrotatef(-90+volantrots(i),0,0,1)
		glrotatef(loganwheelrot(i),-1,0,0)
		glcalllist wheellist
		glpopmatrix
		glpushmatrix
		gltranslatef(-52,30,12)
		glrotatef(90,0,0,1)
		glrotatef(loganwheelrot(i),1,0,0)
		glcalllist wheellist
		glpopmatrix
		glpushmatrix
		gltranslatef(-52,-30,12)
		glrotatef(-90,0,0,1)
		glrotatef(loganwheelrot(i),-1,0,0)
		glcalllist wheellist
		glpopmatrix			
End Sub
Sub initncar()
Dim As integer i 	
 	ncartext=guiloadtexture("objects/car2.jpg",240,245)
 	logantext=guiloadtexture("objects/logan.jpg")
 	ncarpolicetext=guiloadtexture("objects/policecar_lowpoly.jpg")
	For i=1 To ncar
		ncarx(i)=mx+dmx0+Rnd*200
		ncary(i)=my+dmy0+Rnd*200
		ncarz(i)=999999
	Next
End Sub
Dim Shared As Integer ncari1,thighway,tinverse,myibridge
Dim Shared As Double timeautopilot2,timeinverse(ncar)
Dim Shared As Single ncarv0,vautopilot0=5.5,ncarx0,ncary0,ncaro10,ncarcos100=1,ncarsin100,o1autopilot
Dim Shared As Single ncarz0,zroad,avgco1=1,avgsi1,distback,kavgo1
Dim Shared As String myroadwayid
Dim Shared As Double tmyroadwayname,timerrot,timenear0road
Sub drawncars()
Dim As Integer i,j
If tinittown0>0 Then
	timeautopilot=Timer
	Exit sub
EndIf
Var dmax=2000
Var i1=1
If tautopilot>=1 And plane>0 And car>0 Then'And scaleview>0.9 Then
	i1=0
   If ncariroad(0)<>0 Or mytestbridge=1 Then timesoundarcade=time2
   If time2<timeautopilot+3.001 Then
   	ncarv(0)=v*vautopilot/max(1.0,vautopilot0)
   	nncarv(0)=ncarv(0):ncarx(0)=mx+dmx0:ncary(0)=my+dmy0:ncarco1(0)=cos1:ncarsi1(0)=sin1:ncaro1(0)=o1
   	nncarx(0)=ncarx(0):nncary(0)=ncary(0):nncaro1(0)=ncaro1(0)
   	ncarz(0)=mz1-mzh
      i1=1
   Else
   	If ncari1=0 Then
       If ncariroad(0)<>0 And mytestbridge=0 Then 
   '		v=ncarv(0):mx=ncarx(0)-dmx0:my=ncary(0)-dmy0:mz=ncarz(0)+mzh:o1=ncaro1(0)
         ncarv(0)+=(v-ncarv0)*vautopilot/max(1.0,vautopilot0)
         nncarv(0)+=(v-ncarv0)*vautopilot/max(1.0,vautopilot0)
         ncarx(0)+=mx+dmx0-ncarx0
         ncary(0)+=my+dmy0-ncary0
         nncarx(0)+=mx+dmx0-ncarx0
         nncary(0)+=my+dmy0-ncary0
         ncaro1(0)+=o1-ncaro10
         nncaro1(0)+=o1-ncaro10
         ncarz(0)+=mz1-mzh-ncarz0
       Else
         ncarv(0)=(v)*vautopilot/max(1.0,vautopilot0)
         nncarv(0)=(v)*vautopilot/max(1.0,vautopilot0)
         ncarx(0)=mx+dmx0
         ncary(0)=my+dmy0
         nncarx(0)=mx+dmx0
         nncary(0)=my+dmy0
         ncaro1(0)=o1
         nncaro1(0)=o1         	
         ncarco1(0)=cos1
         ncarsi1(0)=sin1
         ncarz(0)=mz1-mzh
       EndIf
      EndIf     
   EndIf
Else'If scaleview>0.9 Then 
	If tautopilot>0 Or typeautopilot=1 Then
		volantrots0-=volantrots0*kfps*0.05
	Else
		volantrots0=max(-120.0,min(120.0,volantrots0))
	EndIf
EndIf
ncari1=i1
ncar22=0
'i=1
'nncarx(i)=mx+100:nncary(i)=my:nncaro1(i)=4
'nncarx(i)=mx+100:ncary(i)=my:ncaro1(i)=4
'drawncarshadow(i)
icarshadow=0
For i=i1 To ncar
  myncari=i
  If i>0 Then
    Var kcos1=(ncarx(i)-ncarxx0(i))*ncarco1(i)+(ncary(i)-ncaryy0(i))*ncarsi1(i)
    If kcos1<0 Then
    	kcos1=max(kcos1,-100.0)*1.02
    	ncarx(i)-=kcos1*ncarco1(i):ncary(i)-=kcos1*ncarsi1(i)
    EndIf
    ncarxx0(i)=ncarx(i):ncaryy0(i)=ncary(i)
  EndIf
  If i=1 Or i=5 Or i=12 Or i=24 Or i=40 Then tcarpolice=1 Else tcarpolice=0
  If scaleview>0.9 Then 
	If ncarz(i)>99990 Then 
	  ncarx(i)=mx+dmx0-i*500+(Rnd-0.5)*dmax*1.8
	  ncary(i)=my+dmy0-600+(Rnd-0.5)*dmax*1.8
	  ncarz(i)=getterrainheight(ncarx(i),ncary(i))
	  nncarx(i)=ncarx(i):nncary(i)=ncary(i)
	  ncaro1(i)=Rnd*360
	  nncarv(i)=4-Rnd*0.5
	EndIf
	If (Abs(ncarx(i)-mx-dmx0)>dmax Or Abs(ncary(i)-my-dmy0)>dmax) Then
	 If i=0 Then
	 	ncarx(i)=mx+dmx0
	 	ncary(i)=my+dmy0
	 	ncaro1(i)=o1
		nncarx(i)=ncarx(i):nncary(i)=ncary(i)
		nncaro1(i)=ncaro1(i)
		ncarco1(i)=cos1:ncarsi1(i)=sin1
		ncarv(i)=4
	 ElseIf i>Int(1+ncar2*inearroad/400) Then'/15
	 	ncarx(i)=-999999
	 	ncarz(i)=-999999
	 	ncariroad(i)=0
	 	Continue For 
	 Else 	
		Var dx=0.9*dmax
		Var do1=o1+(0.5-Rnd)*120
		If (i Mod 2)=1 Then do1=Rnd*360
		ncarx(i)=mx+dmx0+dx*Cos(degtorad*do1)
		ncary(i)=my+dmy0+dx*Sin(degtorad*do1)
		nncarx(i)=ncarx(i):nncary(i)=ncary(i)
		ncaro1(i)=o1+180+(Rnd-0.5)*360
		nncaro1(i)=ncaro1(i)
   	ncarco1(i)=Cos(degtorad*ncaro1(i))
   	ncarsi1(i)=Sin(degtorad*ncaro1(i))
		Var n=getrandomnearroad(ncarx(i),ncary(i),-1,ncarco1(i),ncarsi1(i))
		ncariroad(i)=n
		If n>0 Then
		  Var dist=0.0,xx=0.0,yy=0.0
		  For n=0 To nrandomnearroad-1	
			For j=0 To 14
			  xx=xnearroad(n)+(j/15)*co1nearroad(n)*drnearroad(n)/(05.1+rnearroad(n))
			  yy=ynearroad(n)+(j/15)*si1nearroad(n)*drnearroad(n)/(05.1+rnearroad(n))
			  var dist1=max(Abs(xx-mx-dmx0),Abs(yy-my-dmy0))
			  If dist<dist1 And dist1<dmax*0.9 Then
			  	 dist=dist1
			  	 ncarx(i)=xx:ncary(i)=yy
		       ncariroad(i)=n
			  EndIf 
			Next j  
			nncarx(i)=ncarx(i)
			nncary(i)=ncary(i)
		  Next n 	
		EndIf
		nncarv(i)=4-Rnd*0.5
	 EndIf 	
	EndIf
	If ncarx(i)<-999990 Then Continue For 
	Var x=nncarx(i)'+ncarv(i)*kfps*ncarco1(i)*0.9
	Var y=nncary(i)'+ncarv(i)*kfps*ncarsi1(i)*0.9
	If i>0 Then
		Var kv1=1.1*0.63/0.8
		Var co1=ncarco1(i),si1=ncarsi1(i)
		If time2<thorn+120 Then
			If ncarv(i)>v-7 And ncarv(i)>2 And co1*cos1+si1*sin1>0.7 Then
				nncarv(i)=max(v+1.95,nncarv(i))
				ncarv(i)=max(v+1.95,ncarv(i))
			EndIf
		EndIf
		ncarvv(i)+=(ncarv(i)-ncarvv(i))*kfps*0.03
	   x+=ncarvv(i)*kfps*co1*kv1
	   y+=ncarvv(i)*kfps*si1*kv1		
	Else
		ncarvv(i)+=(ncarv(i)-ncarvv(i))*kfps*0.1
      vautopilot0=2
      Var kaux=0.98'0.92
      If distback>10 Then kaux=0.9
      kaux=1-(1-kaux)*max(0.001,min(1.0,0.196*kfps))
      nvmx2=kaux*nvmx2+(1-kaux)*ncarvv(i)*ncarco1(i)
      nvmy2=kaux*nvmy2+(1-kaux)*ncarvv(i)*ncarsi1(i)
      'vmz2=kaux*vmz2+(1-kaux)*dvmz2	
		x+=nvmx2*kfps*0.2'0.63
		y+=nvmy2*kfps*0.2'0.63
	   'x+=ncarvv(i)*kfps*ncarco1(i)*0.63'0.8
	   'y+=ncarvv(i)*kfps*ncarsi1(i)*0.63'0.8		
	EndIf
	Var n=ncariroad(i)
	Var n0=n,ddr0=0.0',ttlayer=0:If n>0 Then ttlayer=layernearroad(n)
	'If (i=0 And Abs(tlayer0)>0.3 And n=0)Then ddr0=70
	If (i=0 And n=0)Then ddr0=70
	If time2>ncartimeroad(i)+4 Then n=0
	n=getrandomnearroad(x,y,n,ncarco1(i),ncarsi1(i),ddr0)
	If n=0 And n0<>0 And i=0 Then
		'If asktownlat<-90 Then
			Var lat0=lat,lng0=lng
			mxytolatlng(mx+cos1*2000,my+sin1*2000)
			asktownlat=lat:asktownlon=lng
			asktownlat2=-99
			lat=lat0:lng=lng0 
		'EndIf
	/'ElseIf i=0 And asktownlat2<-90 Then 
		Var n2=getrandomnearroad(x+cos1*1000,y+sin1*1000,n,cos1,sin1)
		If n2=0 Then
			Var lat0=lat,lng0=lng
			mxytolatlng(mx+cos1*2000,my+sin1*2000)
			asktownlat2=lat:asktownlon2=lng
			lat=lat0:lng=lng0			
		EndIf '/
	EndIf
   If n>0 Then
	 Var tcrossroad=0
	 If nrandomnearroad>1 Then	tcrossroad=1
	 Var r=max(0.1,rnearroad(n))
	 If r>4000 Then r-=4000
	 If r>1000 Then r-=1000
	 If i=0 Then
	 	if r>2.2*30 Then thighway=1 Else thighway=0
	 EndIf
	 Var dr=drnearroad(n)
	 Var co1=co1nearroad(n)/r
	 Var si1=si1nearroad(n)/r
    Var dxx=ncarco1(i)*co1+ncarsi1(i)*si1
    'auxvar=inear0road:auxtest=0.2
    If i=0 And inear0road>20 Then timenear0road=time2
    If i=0 And time2>timenear0road+20 Then
    	 Var cco1=Cos(avgo1*degtorad),ssi1=Sin(avgo1*degtorad) 
    	 Var dxxx=cco1*cos1+ssi1*sin1
    	 Var avgo10=avgo1,kavgo10=kavgo1 
    	 If (timeautopilot>time2-4) Or((Abs(dxx)>0.8)And distback<1) Then
    	 	If dxx>0 Then kavgo1=1 Else kavgo1=-1
    	 EndIf
    	 'auxvar2=(kavgo1)
    	 if 1 Then'dxxx>-0.8 then'dxxx>0 Then 
    		If kavgo1>=0 Then
    			avgo1=diro1(co1,si1)
    		Else
    			avgo1=diro1(-co1,-si1)
    		EndIf
    	 	If time2>timenear0road+22 Then
    	 		ncaro1(i)=avgo1
    	 	   nncaro1(i)=avgo1
    	 		'timenear0road=time2-22+0.04*kfps
    	 		timenear0road=time2-21+0.04*kfps
    	 	EndIf
    	 EndIf	
    	 'If dxxx<-0.1 Then'And time2>timenear0road+25 Then 
    	 	'timenear0road=time2-20
    	 '	distback=30
    	 'EndIf
    	 If Abs(avgo1-avgo10)>8 Then
    	 	 ncarv(i)=min(ncarv(i),0.40)
    	 	 nncarv(i)=min(nncarv(i),0.40)
    	 EndIf
    	 If dxxx<0 Then distback=60
    EndIf 	
    tinverse=0
    If dxx<0 And onewaynearroad(n) And (i>0 Or inear0road>10) And (i>0 Or typeautopilot=1) Then
    	tinverse=1
      If time2>timeinverse(i)+12 Then timeinverse(i)=time2
    	If time2>timeinverse(i)+4 Then tinverse=0 
    EndIf
    If dxx<0 Then co1=-co1:si1=-si1
	 Var xx=xnearroad(n)+si1*0.5*r
	 Var yy=ynearroad(n)-co1*0.5*r
    Var dx=x-xx,dy=y-yy
    Var dxy=max(-8.0,min(8.0,((dx*si1-dy*co1)+(i And 3)*1.4)))
    nncarx(i)=x-dxy*si1+co1
    nncary(i)=y+dxy*co1+si1
  	 ncarco1(i)=Cos(degtorad*ncaro1(i))
    ncarsi1(i)=Sin(degtorad*ncaro1(i))
    nncaro1(i)=diro1(co1,si1)
    If tinverse Then 
  	   	   If Rnd<0.5 Then nncaro1(i)=nncaro1(i)-160+(Rnd-0.5)*40
    EndIf
    If i=0 And (tinverse=0 Or typeautopilot=0) Then
    	If avgco1*co1+avgsi1*si1<0 And time2>timeinverse(i)+4 Then
    	   If Rnd<0.03*kfps Then
    	   	avgo1-=5
    	   EndIf 	
  	   	If Rnd<0.5 Then nncaro1(i)=nncaro1(i)-180+(Rnd-0.5)*40
    	EndIf 
    EndIf
	 Var kv=1.0:If i>0 Then kv=(30+r)/(30+r*0.35)	
    If tcrossroad=0 Then
    	If Abs(nncarv(i)-7.5*kv)>0.75 Then nncarv(i)=(7.5*kv+Rnd*0.7)
    Else 
    	If Abs(nncarv(i)-4)>0.55 Then nncarv(i)=4+Rnd*0.5
    EndIf
    If i=0 Then ncarcos100=cos1:ncarsin100=sin1
   ElseIf i>0 Or tautopilot>0 Then 
   	'If Abs(nncarv(i)-5)>0.55 Then nncarv(i)=5-Rnd*0.5
   	If (nncarv(i)-7.5)>0.55 Then nncarv(i)=7.5-Rnd*0.5
   	nncarx(i)=x
   	nncary(i)=y
   	If i>0 Then
   	 nncaro1(i)-=0.4*kfps*(2+ncarco1(i)*(ncarcos100-0.35*ncarsin100)+ncarsi1(i)*(ncarsin100+0.35*ncarcos100))
   	 ncarco1(i)=Cos(degtorad*nncaro1(i))
   	 ncarsi1(i)=Sin(degtorad*nncaro1(i))
   	EndIf   
   EndIf
   If ncariroad(i)<>n Then
   	ncariroad(i)=n:ncartimeroad(i)=time2
   	If Abs(ncarv(i))>1 And tautopilot>0 then ncarv(i)*=0.7:nncarv(i)*=0.7
   EndIf
   'Var kx=min(0.7,0.03*kfps)
   Var kx=min(0.7,0.03*kfps)
	If i>0 And ncarv(i)<1 And Rnd<0.01 Then'And Rnd<0.5 Then 
	  ncarv(i)=5
	  nncarv(i)=5
	  ncarx(i)+=28*kfps*ncarco1(i)
     ncary(i)+=28*kfps*ncarsi1(i)		
	  nncarx(i)+=28*kfps*ncarco1(i)
     nncary(i)+=28*kfps*ncarsi1(i)		
	  'ncarx(i)+=ncarvv(i)*kfps*ncarco1(i)*0.3
     'ncary(i)+=ncarvv(i)*kfps*ncarsi1(i)*0.3		
   EndIf 
   Var dcarx=nncarx(i)-ncarx(i)
   Var dcary=nncary(i)-ncary(i)
   Var dcarxy=max(Abs(dcarx),Abs(dcary))
   Var kvx=kx
   'If dcarxy>15 And dcarxy<700 Then 
   '	kx*=max(0.5,15/dcarxy)
   'EndIf
   If dcarxy>700 Then kx=1
   ncarv(i)+=(nncarv(i)-ncarv(i))*kvx
   ncarx(i)+=(dcarx)*kx
   ncary(i)+=(dcary)*kx
   Var do1=nncaro1(i)-ncaro1(i)
   While do1>180:do1-=360:Wend
   While do1<-180:do1+=360:Wend
	If (n>0 And n0<>0 And i=0)Or i>0 Then
      volantrots(i)=max(-100.0,min(100.0,do1+do1))
   EndIf  
   ncaro1(i)+=do1*kx
   ncarz(i)=getterrainheight(ncarx(i),ncary(i))
  EndIf'scaleview      
   If ncariroad(i)=0 And ncarz(i)<waterz-5 Then Continue For
   If i=0 Then Continue For
   
   rotavion(ncarx(i)-mx-dmx0,ncary(i)-my-dmy0,ncarz(i)-mz)
   If x2<0.9*Abs(y2)-120 Then Continue For 
   If ncar22>10 And x2>500 Then Continue For
   If x2<500 Then ncar22+=1 
   Var ncarzi=ncarz(i)
   If scaleview>0.9 Then 
    Var dr=30.0
    Var zz=getterrainheight(ncarx(i)+dr*ncarco1(i),ncary(i)+dr*ncarsi1(i))
    ncaro2(i)=diro1(dr,zz-ncarzi)
    If x2<1000 Then
    	 zz=getterrainheight(ncarx(i)-dr*ncarsi1(i),ncary(i)+dr*ncarco1(i))
   	 ncaro3(i)=diro1(dr,zz-ncarzi)
	    addicarshadow(i)
    Else
   	ncaro3(i)=0
    EndIf 	
   EndIf
	Var k=i Mod 4
	If k=1 then	glcolor3f(1,1,1)
	If k=2 then	glcolor3f(0.2,1,0.2)
	If k=3 then	glcolor3f(1,0,0.2)
	If k=0 then	glcolor3f(1,0.5,0)
	'ncarx(1)=mx+100:ncary(1)=my':ncarz(1)=mz
	'nncarx(1)=mx+100:nncary(1)=my':nncarz(1)=mz
   glpushmatrix
   If ncariroad(i)>0 Then   	
		gltranslatef(ncarx(i)-dmx0,ncary(i)-dmy0,ncarzi+4)
	Else 
		gltranslatef(ncarx(i)-dmx0,ncary(i)-dmy0,ncarzi)
   EndIf
   /'Var mzz=mz+dyh
   If ncarzi>mzz Then 
		gltranslatef(ncarx(i)-dmx0,ncary(i)-dmy0,ncarzi)
   ElseIf ncariroad(i)=0 Or ncarzi>mzz-10 Then
   	Var kz=(mzz-ncarzi)/10
   	gltranslatef(ncarx(i)-dmx0,ncary(i)-dmy0,ncarzi+min(10.0,kz*(mzz-ncarzi)))
   Else
   	Var kz=(mzz-10-ncarzi)/3
   	gltranslatef(ncarx(i)-dmx0,ncary(i)-dmy0,ncarzi+10+min(3.0,kz*(mzz-10-ncarzi)))'15)
   EndIf '/
   /'If ncariroad(i)=0 Then
   	gltranslatef(ncarx(i)-dmx0,ncary(i)-dmy0,ncarzi)
   Else 
   	Var n=ncariroad(i),dr=drnearroad(n),r=rnearroad(n),co1=co1nearroad(n)/r,si1=si1nearroad(n)/r,xn=xnearroad(n),yn=ynearroad(n)
   	Var z0=getterrainheight(xn,yn)
   	Var z1=getterrainheight(xn+dr*co1,yn+dr*si1)
   	Var ncarziroad=z0+(z1-z0)*((ncarx(i)-xn)*co1+(ncary(i)-yn)*si1)/dr
   	gltranslatef(ncarx(i)-dmx0,ncary(i)-dmy0,ncarziroad+8)   	
   EndIf '/
	glrotatef(ncaro1(i),0,0,1)
	glrotatef(ncaro2(i),0,-1,0)
	glrotatef(ncaro3(i),1,0,0)
	glscalef(0.42,0.42,0.42)
	drawncar(i)
	glpopmatrix
Next
glcolor3f(1,1,1)
If tautopilot>=1 And time2>timeautopilot+3 And plane>0 And car>0 Then'And scaleview>0.9 Then
 If ncariroad(0)>0 Then timeautopilot2=time2-3.001
 If ncari1=0 And time2>timeautopilot2+3 Then
    v=ncarv(0)*vautopilot0/max(1.0,vautopilot):ncarv0=v
    mx=ncarx(0)-dmx0:my=ncary(0)-dmy0:ncarx0=mx+dmx0:ncary0=my+dmy0
    mz1=max(mz1,ncarz(0)+mzh):mz11=min(mz11,mz1)
    ncarz0=mz1-mzh
    o1autopilot+=ncaro1(0)-o1
    o1=ncaro1(0):ncaro10=o1
    If ncariroad(0)=0 Then
    	Var k25=25.0
    	'If (Int(Timer/40)Mod 2)>=0 Then k25=-55
    	'volantrots(0)=-25*(2+ncarco1(0)*ncarcos100+ncarsi1(0)*ncarsin100)
      volantrots(0)=-k25*(2+ncarco1(0)*(ncarcos100+0.25*ncarsin100)+ncarsi1(0)*(ncarsin100-0.25*ncarcos100))
      If (Int((Timer-timerrot)/40)Mod 3)=0 Then volantrots(0)=-volantrots(0)
      If timer>timerrot+80 Then timerrot=timer+Int(Rnd*2)*40
    EndIf 
    volantrots0+=(volantrots(0)-volantrots0)*min(1.0,0.2*kfps)
    volantrot+=(volantrots(0)-volantrot)*min(1.0,0.2*kfps)
 EndIf
Else'If scaleview>0.9 Then 
	volantrots(0)=0'-=min(1.0,0.3*kfps)*volantrots(0)+0.00001
EndIf 
'If ncariroad(0)=0 And typeautopilot=0 Then timeautopilot=time2-2.99
End Sub
Sub testcollidecars()
If Abs(tlayer)>0.4 Then Exit Sub 
Dim As Integer i,j,k,j2,j3,j0,j1
Var r=20.0,r2=45.0,rr=20.0
Var v0=v:If tautopilot=1 Then v0*=vautopilot/max(1.0,vautopilot0)
ncarv(0)=v0'+=(v0-ncarv(0))*kfps*0.1
nncarv(0)=v0:ncarx(0)=mx+dmx0:ncary(0)=my+dmy0:ncaro1(0)=o1:ncarco1(0)=cos1:ncarsi1(0)=sin1
ncarz(0)=mz1-mzh
Var tcrash=0
Var i0=0:If plane=0 Or car=0 Then i0=1
For i=i0 To ncar
	If ncariroad(i)=0 and ncarz(i)<waterz-5 And i>0 Then Continue For 
	Var x=ncarx(i),y=ncary(i),z=ncarz(i)
	Var co1=ncarco1(i),si1=ncarsi1(i)
	Var kcos=(Abs(co1)+Abs(si1))
	co1*=kcos:si1*=kcos
	Var x0=x-co1*30,y0=y-si1*30
	Var x1=x+co1*rr,y1=y+si1*rr
	Var x2=x+co1*r2-r2*si1*0.6,y2=y+si1*r2+r2*co1*0.6
	Var x3=x+co1*r2+r2*si1*0.9,y3=y+si1*r2-r2*co1*0.9
	Var test0=0,test1=0,test2=0,test3=0
	Var nncarvi0=nncarv(i)
	For j=i0 To ncar
		If i=j Then Continue For
	   If ncariroad(j)=0 And ncarz(j)<waterz-5 And j>0 Then Continue For 
	   Var xx=ncarx(j),yy=ncary(j),zz=ncarz(j)
	   If Abs(zz-z)>15 Then Continue For 
	   If Abs(xx-x0)<r Then
	   	If Abs(yy-y0)<r Then
	   		test0=1
	   		'test0+=2-2*(co1*ncarco1(j)+si1*ncarsi1(j))
	   		j0=j
	   		If j0=0 Then
	   			If Rnd<0.035*kfps And tautopilot=1 Then
	   				keytir
	   			EndIf
	   		EndIf
	   	EndIf
	   EndIf
	   If Abs(xx-x1)<r Then
	   	If Abs(yy-y1)<r Then
	   		test1=1
	   		'test1+=2-2*(co1*ncarco1(j)+si1*ncarsi1(j))
	   		j1=j
	   	EndIf
	   EndIf		
	   If Abs(xx-x2)<r2 Then
	   	If Abs(yy-y2)<r2 Then
	   		Var dxx=co1*ncarco1(j)+si1*ncarsi1(j)
	   		test2=(2-(dxx))*0.5
	   		If dxx>0.5 Then
	   			nncarv(i)=min(nncarv(i),ncarv(j)-1) 
	   			ncarv(i)=min(ncarv(i),ncarv(j)-1) 
	   			If j>0 Then 
	   			  nncarv(j)=max(nncarv(i)+2,nncarv(j)) 
	   			  ncarv(j)=max(ncarv(i)+2,ncarv(j))
	   			EndIf    
	   		EndIf
	   		j2=j
	   		If i=0 Then
	   			If Rnd<0.005*kfps And tautopilot=1 Then
	   				If dxx>0.7 Then keytir
	   			EndIf
	   		EndIf
	   	EndIf
	   EndIf
	   If Abs(xx-x3)<r2 Then
	   	If Abs(yy-y3)<r2 Then
	   		Var dxx=co1*ncarco1(j)+si1*ncarsi1(j)
	   		test3=(2-(dxx))*0.5
	   		If dxx>0.5 Then
	   			nncarv(i)=min(nncarv(i),ncarv(j)-1) 
	   			ncarv(i)=min(ncarv(i),ncarv(j)-1) 
	   			If j>0 Then 
	   			  nncarv(j)=max(nncarv(i)+2,nncarv(j)) 
	   			  ncarv(j)=max(ncarv(i)+2,ncarv(j))
	   			EndIf    
	   		EndIf
	   		j3=j
	   		If i=0 Then
	   			If Rnd<0.015*kfps And tautopilot=1 Then
	   				keytir
	   			EndIf
	   		EndIf
	   	EndIf
	   EndIf		
	Next j
	If test1>0 Then
		If (nncarv(i)>-1) And (ncarv(i)>-1) Then
			nncarv(i)-=2:ncarv(i)-=2
			If Abs(ncarv(i))<0.5 Then ncarv(i)=-0.51  
			If j1>0 Then
	   	   Var dxx=co1*ncarco1(j1)+si1*ncarsi1(j1)
				If dxx>0.5 And (nncarv(j1)<20) And (ncarv(j1)<20) Then nncarv(j1)+=2:ncarv(j1)+=2
			EndIf
			If i=0 Then tcrash=1
		EndIf
	EndIf 	
	If test0>0 Then
		If (nncarv(i)<20) And (ncarv(i)<20) Then
			If i=0 Then
				If Rnd<0.01 Then soundcarhorn()
			EndIf
			If i>0 Then 
   		 nncarv(i)+=2:ncarv(i)+=2
		    Var do1=(Rnd-0.5)*50
		    nncaro1(i)+=do1
		    ncaro1(i)+=do1
		    ncarco1(i)=Cos(degtorad*ncaro1(i))
		    ncarsi1(i)=Sin(degtorad*ncaro1(i))
		    ncarx(i)+=ncarco1(i)*20
		    ncary(i)+=ncarsi1(i)*20
		   EndIf 
		EndIf
	EndIf
	If test3>0 Then
		If i>0 Then
   		nncaro1(i)+=kfps*3
	   	ncaro1(i)+=kfps*3
		   ncarco1(i)=Cos(degtorad*ncaro1(i))
		   ncarsi1(i)=Sin(degtorad*ncaro1(i))
		EndIf    
		If ncarv(i)>test3+1 Then ncarv(i)-=test3
		If nncarv(i)>test3+1 Then nncarv(i)-=test3
		If j3>0 And i>0 Then
	   	Var dxx=co1*ncarco1(j3)+si1*ncarsi1(j3)
			If dxx>0.25 And (nncarv(j3)<ncarv(i)+5) Then nncarv(j3)+=4:ncarv(j3)+=4
		EndIf
	EndIf 
	If test2>0 Then
		If i>0 Then
	   	nncaro1(i)-=kfps*3
		   ncaro1(i)-=kfps*3
		   ncarco1(i)=Cos(degtorad*ncaro1(i))
		   ncarsi1(i)=Sin(degtorad*ncaro1(i))
		EndIf 
		If ncarv(i)>test2+1 Then ncarv(i)-=test2
		If nncarv(i)>test2+1 Then nncarv(i)-=test2
		If j2>0 And i>0 Then
	   	Var dxx=co1*ncarco1(j2)+si1*ncarsi1(j2)
			If dxx>0.25 And (nncarv(j2)<ncarv(i)+5) Then nncarv(j2)+=4:ncarv(j2)+=4
		EndIf
	EndIf
	If i>0 Then 
	 Var dist=Abs(x-mx+10*cos1)+Abs(y-my+10*sin1)+Abs(ncarz(i)-mz)
    If dist<700 Then
      Var vol=((6+ncarv(i))/1.2)*(100/max(80.0,dist*dist/40))*1800
      If vol>volumecar Then volumecar=vol:vcar=ncarv(i)	
    EndIf
    If dist<80 Then
    	If (x-mx-dmx0)*ncarsi1(i)-(y-my-dmy0)*ncarco1(i)>5 Then
    		 Var kkfps=6*kfps
 		    ncarx(i)+=ncarsi1(i)*kkfps:ncary(i)-=ncarco1(i)*kkfps
 		    nncarx(i)+=ncarsi1(i)*kkfps:nncary(i)-=ncarco1(i)*kkfps
    	Else     
    		Var kkfps=6*kfps
 		    ncarx(i)-=ncarsi1(i)*kkfps:ncary(i)+=ncarco1(i)*kkfps
 		    nncarx(i)-=ncarsi1(i)*kkfps:nncary(i)+=ncarco1(i)*kkfps
    	EndIf
    EndIf
	EndIf
	If i>0 And nncarv(i)<nncarvi0-0.4 Then
		If Rnd<0.03*kfps Then addsmoke(x,y,ncarz(i)) 
	EndIf
Next i
If plane>0 And car>0 Then
  If tcrash=1 Then 	
	soundcrash()
	If (ncarv(0)-v0)>0 Then
     mx+=cos1*30
     my+=sin1*30
   Else 
     mx-=cos1*30
     my-=sin1*30
   EndIf   
   vmx2+=(ncarv(0)-v0)*cos1
   vmy2+=(ncarv(0)-v0)*sin1
  EndIf
  If  time2>timeautopilot+3 And time2>timeautopilot2+3 and tautopilot=1 Then
  	   v+=(ncarv(0)*vautopilot0/max(1.0,vautopilot)-v)*kfps*0.05
  EndIf
  ncarv0=v
  mx=ncarx(0)-dmx0:my=ncary(0)-dmy0:o1=ncaro1(0)
EndIf   
End Sub
Sub subcarhorn()
Dim As Integer i
If time2>tsoundcarhorn+0.2 Then
	soundcarhorn
	Var x=mx+dmx0+cos1*150,y=my+dmy0+sin1*150
	Var xx=mx+dmx0+cos1*360,yy=my+dmy0+sin1*360
	For i=1 To ncar
		If (Abs(ncarx(i)-x)<150 and Abs(ncary(i)-y)<150) Or _  
		   (Abs(ncarx(i)-xx)<150 and Abs(ncary(i)-yy)<150) Then
				Var dxx=(ncarco1(i)*cos1+ncarsi1(i)*sin1)
				If dxx>0 Then
					If ncarv(i)<v+3.5 Then ncarv(i)+=7:nncarv(i)+=7
				Else 	
					If ncarv(i)>0 Then ncarv(i)-=5:nncarv(i)-=5
				EndIf 
		EndIf
	Next
EndIf
End Sub
Declare Sub testhandrot()
Dim Shared As Integer icartext=10
Dim Shared As Single volant2x,volant2y,volant2r=100,volant2z=-30
Sub drawvolant2(x As Single=0.47,y As Single=0.768,z As Single=-30)
 
 testhandrot()
 
 gldisable(gl_lighting)
 glenable gl_alpha_test
 glAlphaFunc(gl_less,1/254)
 glcolor3f(1,1,1)
 If icartext=13 Then
 	glbindtexture(gl_texture_2d,volanttext2)
 Else 	
 	glbindtexture(gl_texture_2d,volanttext)
 EndIf
 glpushmatrix
 'glplacecursor(xmax*0.43,ymax*0.768,-30)
 Var k=1.5,kx=1.5*48/46.0
 glplacecursor(xmax*(0.5+kx*(x-0.5)),ymax*(0.5+kx*(y-0.5)),z*k)
 volant2x=xmax*(0.5+kx*(x-0.5)):volant2y=ymax*(0.5+k*(y-0.5)):volant2r=ymax*0.5*(4.5*kx)/(z*k):volant2z=z*k
 If handrot>-990 And thand=1 Then volantrot=handrot
 If volantrot>120 Then volantrot=120
 If volantrot<-120 Then volantrot=-120
 glrotatef(volantrot+volantrots0-2.5,0,0,1)
 If tautopilot>0 Or typeautopilot=1 Or Abs(volantrot)<19*kfps Then
 	volantrot=0.75*volantrot+1e-10
 Else
 	o1+=volantrot*0.01*kfps
 EndIf
 gltexcarre(4.5*kx)
 glpopmatrix
 gldisable gl_alpha_test
End Sub
Dim Shared As uint capottext
Sub drawcapot()
gldisable gl_depth_test
glenable gl_alpha_test
glAlphaFunc(gl_gequal,100/254)
glbindtexture(gl_texture_2D,capottext)
glenable gl_lighting
glnormal3f(-cos1,-sin1,-0.72)
If icartext=11 Then glcolor4f(1,0.2,0,1)'ford
If icartext=9 Then glcolor4f(0.75,0.8,0.9,1)'fiat
If icartext=10 Then glcolor4f(0.5,0.62,1,1)'nissan
If icartext=5 Then glcolor4f(0.6,0.6,1,1)'malibuchevy
If icartext=13 Then glcolor4f(1,0.2,0.3,1)'cadillac
glpushmatrix
If volant<>1 Then 
	glplacecursor(xmax*0.5,ymax*0.75,-37)
ElseIf icartext=11 Then
	glplacecursor(xmax*0.5,ymax*0.747,-37)
ElseIf icartext=9 Then
	glplacecursor(xmax*0.5,ymax*0.75,-37)
ElseIf icartext=10 Then
	glplacecursor(xmax*0.5,ymax*0.732,-37)
ElseIf icartext=5 Then
	glplacecursor(xmax*0.5,ymax*0.750,-37)
ElseIf icartext=13 Then 
	glplacecursor(xmax*0.5,ymax*0.72,-37)	
EndIf
glrotatef(-90,0,1,0)
glrotatef(-caro2,0,0,1)
glrotatef(-90+caro3,1,0,0)
gltexcarre3(70,20)
glpopmatrix	
glenable gl_depth_test
gldisable gl_alpha_test
glcolor4f(1,1,1,1)
End Sub
Dim Shared As uint cockpit1text,cockpit2text,cockpit3text,cockpit4text,cockpit5text
Sub drawcockpitcar
drawcapot()	
gldisable gl_depth_test
glenable gl_alpha_test
glAlphaFunc(gl_less,10/254)
Var a=1'(1.2+ksoleil+tlight1*0.3)/2.5
'If tlight=0 Then a=1
glcolor3f(a,a,a)
If icartext=11 Then glbindtexture(gl_texture_2d,cockpit1text)'ford
If icartext=9 Then glbindtexture(gl_texture_2d,cockpit2text)'fiat
If icartext=10 Then glbindtexture(gl_texture_2d,cockpit3text)'nissan
If icartext=5 Then glbindtexture(gl_texture_2d,cockpit4text)'malibuchevy
If icartext=13 Then glbindtexture(gl_texture_2d,cockpit5text)'cadillac
glpushmatrix
If icartext=1 Then glplacecursor(xmax*0.5,ymax*0.67,-32)
If icartext=2 Then glplacecursor(xmax*0.5,ymax*0.6,-32)
If icartext=3 Then glplacecursor(xmax*0.54,ymax*0.71,-32)
If icartext=4 Then glplacecursor(xmax*0.54,ymax*0.688,-32)
If icartext=5 Then glplacecursor(xmax*0.545,ymax*0.678,-32)
If icartext=6 Then glplacecursor(xmax*0.465,ymax*0.712,-32)
If icartext=7 Then glplacecursor(xmax*0.52,ymax*0.7,-32)
If icartext=8 Then glplacecursor(xmax*0.52,ymax*0.7,-32)
If icartext=9 Then glplacecursor(xmax*0.54,ymax*0.7,-32)
If icartext=10 Then glplacecursor(xmax*0.55,ymax*0.642,-32)
If icartext=11 Then glplacecursor(xmax*0.55,ymax*0.69,-32)
If icartext=12 Then glplacecursor(xmax*0.55,ymax*0.76,-32)
If icartext=13 Then glplacecursor(xmax*0.54,ymax*0.61,-32)
If mytestbridge=0 Then 
  caro2+=0.945*(sin2*10-caro2)*min(1.0,kfps*0.4) 
  caro3+=0.945*(sin3*10-caro3)*min(1.0,kfps*0.4)
EndIf 
glrotatef(-90,0,1,0)
glrotatef(-caro2,0,0,1)
glrotatef(-90+caro3,1,0,0)
glscalef(1,48/46.0,1)
If icartext=1 Then gltexcarre3(60,41)
If icartext=2 Then gltexcarre3(65,41)
If icartext=3 Then gltexcarre3(63.4,45)
If icartext=4 Then gltexcarre3(64.85,42.88)
If icartext=5 Then gltexcarre3(64.9,44.5)
If icartext=6 Then gltexcarre3(63.4,43.4)
If icartext=7 Then gltexcarre3(64.4,49.2)
If icartext=8 Then gltexcarre3(65,42)
If icartext=9 Then gltexcarre3(61,43.1)
If icartext=10 Then gltexcarre3(64,43)
If icartext=11 Then gltexcarre3(66,46)
If icartext=12 Then gltexcarre3(67,46.5)
If icartext=13 Then gltexcarre3(70,43)
glpopmatrix
'drawvolant(0.414,0.72,-15.9)
If icartext=1 Then drawvolant2(0.5+(0.414-0.50)*1007*ymax/(xmax*515),0.72,-15.9)
If icartext=2 Then drawvolant2(0.5+(0.410-0.50)*1007*ymax/(xmax*515),0.715,-15.1)
If icartext=3 Then drawvolant2(0.5+(0.415-0.50)*1007*ymax/(xmax*515),0.69,-16.4)
If icartext=4 Then drawvolant2(0.5+(0.395-0.50)*1007*ymax/(xmax*515),0.72,-17.4)
If icartext=5 Then drawvolant2(0.5+(0.414-0.50)*1007*ymax/(xmax*515),0.682,-16.1)
If icartext=6 Then drawvolant2(0.5+(0.450-0.50)*1007*ymax/(xmax*515),0.682,-14.9)
If icartext=7 Then drawvolant2(0.5+(0.38-0.50)*1007*ymax/(xmax*515),0.735,-17.9)
If icartext=8 Then drawvolant2(0.5+(0.385-0.50)*1007*ymax/(xmax*515),0.724,-19)
If icartext=9 Then drawvolant2(0.5+(0.418-0.50)*1007*ymax/(xmax*515),0.694,-13.7)
If icartext=10 Then drawvolant2(0.5+(0.379-0.50)*1007*ymax/(xmax*515),0.704,-17.9)
If icartext=11 Then drawvolant2(0.5+(0.402-0.50)*1007*ymax/(xmax*515),0.746,-17.5)
If icartext=12 Then drawvolant2(0.5+(0.407-0.50)*1007*ymax/(xmax*515),0.724,-17.9)
If icartext=13 Then drawvolant2(0.5+(0.40-0.50)*1007*ymax/(xmax*515),0.69,-16)
'drawspeed(0.57,0.800,-30)
gldisable gl_alpha_test
glenable gl_depth_test
End Sub
Dim Shared As uint handtext
Dim Shared As Single handx,handy,handrot0
Dim Shared As Integer tshowhand 
Dim Shared As Double timehand
Declare Sub submovehand()
Sub sublefthand
If plane=0 Or car=0 Or tinittown0>0 Then Exit Sub 
	If tshowhand=1 Then
		thand=(thand+1)Mod 2
	Else
		thand=0
	EndIf
	submovehand()
End Sub
'Sub sublefthandup
	'thand=0
	'submovehand()
'End Sub
Sub testhandrot()
If plane=0 Or car=0 Or tinittown0>0 Then Exit Sub 
If thand=1 then	
	   timeautopilot=time2
	   timeautopilot2=time2
	   volantrots0=0
	   If handrot>0 Then keyLeft(handrot/60)
	   If handrot<0 Then keyRight(-handrot/60)
	   If guitestkey(vk_shift) Then accelere()
	   If guitestkey(vk_control) Then decelere()
	   avgo1=o1
EndIf 	
End Sub
Dim Shared As Integer mousex,mousey,mousex0,mousey0,handx0,handy0
Dim Shared As Double tplacecursor
Sub submovehand
If plane=0 Or car=0 Or tinittown0>0 Then Exit Sub 
'Var mousex=guimousex
'Var mousey=guimousey
If (mousey>ymax*0.60 Or (mousey>ymax*0.35 And mousex<xmax*0.48))And mousex<xmax*0.83 Then
  If mousex<xmax*0.48 Then tshowhand=1 Else tshowhand=0 
  If thand=1 Then 
  	Var mouseyy=mousey+15
	Var dz=Abs(volant2z)+0.01
	var handxx=xmax*0.5+(mousex-xmax*0.5)*dz/40.0
	var handyy=ymax*0.5+(mouseyy-ymax*0.5)*dz/40.0
	Var dx=handxx-volant2x
	Var dy=handyy-volant2y
	Var dr=Abs(volant2r)
	Var dxy=max(0.1,Sqr(dx*dx+dy*dy))
	'auxvar=handrot:auxtest=0.3:auxvar2=dx:auxvar3=dy
	If dxy<dr*0.05 Or (Abs(dy)>dr*3 Or Abs(dx)>dr*8) Then
      If time2>timehand+6 Then
			thand=0
      EndIf
 		handx=mousex
      handy=mouseyy
  Else
		timehand=time2
	   dz=Abs(volant2z)+0.01
	   'handx=volant2x+dx*(dr*0.5+0.66*dxy)/dxy
	   'handy=volant2y+dy*(dr*0.5+0.66*dxy)/dxy
	   handx=volant2x+dx*(dr*0.95+0.25*dxy)/dxy
	   handy=volant2y+dy*(dr*0.95+0.25*dxy)/dxy
	   handx=xmax*0.5+(handx-xmax*0.5)*40.0/dz
	   handy=ymax*0.5+(handy-ymax*0.5)*40.0/dz
      If time2>tplacecursor And (max(Abs(handx-handx0),Abs(handy-handy0))>ymax*0.02 Or handy>ymax-10) Then
        tplacecursor=time2+0.5
        handy=min2(ymax-11,handy)	
        mousex=handx:mousey=handy-15
        mousex0=mousex:mousey0=mousey
        handx0=handx:handy0=handy
        SetCursorPos(mousex,mousey)
      EndIf   
	   Var handrot00=handrot
	   handrot=(diro1(dx,-dy)-90)*0.8
	   If dxy>dr*1.3 Then
	   	handrot-=Sgn(dx)*(dxy-dr*1.3)*50/dr
	   EndIf
	   If handrot00<-990 Then
	   	handrot0=handrot
	   	volantrot=0
	   EndIf
	   handrot-=handrot0
		thand=1
	EndIf
  Else
  	handx=mousex
  	handy=mousey
  	handrot=-999
  EndIf 	
Else
	tshowhand=0
EndIf
End Sub
Sub drawhand()
If plane=0 Or car=0 Or tinittown0>0 Then Exit Sub 
	If tshowhand Then
	 If thand=1 Or handx<xmax*0.45 Then 	
		glpushmatrix
		glplacecursor(handx+ymax*0.008,handy+ymax*0.015,-40)
		glenable gl_texture_2D
		glbindtexture(gl_texture_2D,handtext)
      glenable gl_alpha_test
      glAlphaFunc(gl_less,10/254)
      gldisable gl_depth_test
      If thand=1 Then glcolor4f(1,0.7,0.7,1)
		gltexcarre(2.98)
		glcolor4f(1,1,1,1)
		gldisable gl_alpha_test
		glenable gl_depth_test
		glpopmatrix
	 EndIf 	
	EndIf
End Sub
Dim Shared As Single helicerot0
Sub addhelicesmoke(dz As Single=15)
If Abs(v)<2 Then Exit Sub 
   	Var dx=100,dy=30
   	dx+=vcruise
   	If Rnd<0.14*kfps Then
   		addsmoke(mx+dmx*dx-dy*sin1,my+dmy*dx+dy*cos1,mz+dmz*dx-dz*cos3)
   	EndIf
   	If Rnd<0.14*kfps Then
   		addsmoke(mx+dmx*dx+dy*sin1,my+dmy*dx-dy*cos1,mz+dmz*dx-dz*cos3)
   	EndIf	
End Sub
Sub addcarsmoke(dz As Single=15) 
   	Var dx=100,dy=30
   	If Rnd>v*0.14 Then Exit Sub 
   	dx+=v*0.3'vcruise
   	If Rnd<0.24*kfps Then
   		addsmoke(mx+dmx*dx-dy*sin1,my+dmy*dx+dy*cos1,mz+dmz*dx-dz*cos3,-1)
   	EndIf
   	If Rnd<0.24*kfps Then
   		addsmoke(mx+dmx*dx+dy*sin1,my+dmy*dx-dy*cos1,mz+dmz*dx-dz*cos3,-1)
   	EndIf	
End Sub
Dim Shared As uint c150phototext,boeing737phototext,ballonphototext
Sub drawcockpit
Dim As Single ymax2
ymax2=ymax*(0.95+(1.0-sin2)*cos3*0.058)
gldisable GL_DEPTH_TEST
glpushmatrix
if typeavion<7 Or typeavion=12 Then 
 addhelicesmoke()	
 glbindtexture(gl_texture_2d,helicetext)	
 glEnable GL_BLEND
 'glBlendFunc GL_SRC_color,GL_ONE_MINUS_SRC_color
 glBlendFunc GL_SRC_alpha,GL_ONE_MINUS_SRC_alpha
 glcolor4f(1,1,1,0.62)
 glplacecursor(xmax*0.5,ymax2*0.785)
 'helicerot0=helicerot0+(8.5+v)*1.5*kfps
 helicerot0=helicerot0+(9+v)*1.35*kfps
 If helicerot0>10000 Then helicerot0-=10000
 glrotatef(-helicerot0,0,0,1)
 gltexcarre4(40,40)
 gldisable gl_blend
EndIf 
glenable gl_alpha_test
glAlphaFunc(gl_less,10/254)
Select Case typeavion
	Case 14
     glbindtexture(gl_texture_2d,boeing737phototext)
     glplacecursor(xmax*0.5,ymax2*0.85)
     gltexcarre4(75,62)
     glcolor3f(1,0,1)
     gldisable gl_lighting
     gldrawtext(Str(Int(vkm)),xmax*0.476,ymax*0.96,2)
     glenable gl_texture_2D
	Case 13,15
     glbindtexture(gl_texture_2d,ballonphototext)
     glplacecursor(xmax*0.5,ymax2*0.83)
     gltexcarre4(76,61)
     glcolor3f(1,0,1)
     gldisable gl_lighting
     gldrawtext(Str(Int(vkm)),xmax*0.476,ymax*0.96,2)
     glenable gl_texture_2D
	Case 12
     glbindtexture(gl_texture_2d,c150phototext)
     glplacecursor(xmax*0.5,ymax2*0.46)
     gltexcarre4(75,40.75)
     glcolor3f(1,0,1)
     gldisable gl_lighting
     gldrawtext(Str(Int(vkm)),xmax*0.476,ymax*0.96,2)
     glenable gl_texture_2D
	Case 1,4,6
	  If typeavion=1 Then glcolor3f(1,1,0.88)	
	  If typeavion=4 Then glcolor3f(0.8,1,0.8)	
	  If icar=12 Then glcolor3f(0.75,1,0.75)	
     glbindtexture(gl_texture_2d,cockpittext1)
     'glplacecursor(xmax*0.5,ymax*0.5)
     'gltexcarre4(56,36)
     glplacecursor(xmax*0.5,ymax2*0.505)
     gltexcarre4(56,36.5)
	/'Case 2  
     glbindtexture(gl_texture_2d,cockpittext2)
     glplacecursor(xmax*0.5,ymax2*0.527)
     gltexcarre4(64,37.8)
	Case 3,5
	  If icar=8 Then glcolor3f(0.82,1,0.9)	
     glbindtexture(gl_texture_2d,cockpittext3)
     glplacecursor(xmax*0.5,ymax2*0.526)
     gltexcarre4(64,37.8)
	Case 7,8,9
	  If typeavion=7 Then glcolor3f(0.8,0.87,1)	
     glbindtexture(gl_texture_2d,cockpittext4)
     glplacecursor(xmax*0.5,ymax2*0.57)
     gltexcarre4(64,41) '/
End Select  
glpopmatrix
glenable GL_DEPTH_TEST
gldisable gl_alpha_test
End Sub
Dim Shared As uint avionlist,corsair0list,corsairlist,vg33list,zerolist,b25list,alphajetlist
Dim Shared As uint alphajet0list,vg330list,spitfirelist,spitfire0list,bf109list,bf1090list
Dim Shared As uint p51dlist,p51d0list,f14list,f140list,zero0list,c150list,c1500list,boeing737list,boeing737lowlist
Dim Shared As uint eurofighterlist,eurofighter0list,fighterlist,fighter0list
Dim Shared As uint spaceshiplist,spaceship0list
/'
Sub drawcorsair0
glenable gl_texture_2d
glbindtexture(gl_texture_2d,corsairtext)
glscalef(1.05,1.05,1.05)
	If corsair0list<>0 Then
		glcalllist(corsair0list)
	Else
		corsair0list=glgenlists(1)
		glnewlist corsair0list,gl_compile
		'loadobjsize("objects/corsair.obj",@"",@"",94)
		loadobjsize("objects/f4ucockpit.obj",@"",@"",42.52)
      glendlist
	EndIf	
End Sub
Sub drawalphajet0
glenable gl_texture_2d
glbindtexture(gl_texture_2d,alphajettext)
'glscalef(1.05,1.05,1.05)
	If alphajet0list<>0 Then
		glcalllist(alphajet0list)
	Else
		alphajet0list=glgenlists(1)
		glnewlist alphajet0list,gl_compile
		loadobjsize("objects/alphajet_cockpit.obj",@"",@"",77)
      glendlist
	EndIf	
End Sub
Sub drawvg330
glenable gl_texture_2d
glbindtexture(gl_texture_2d,vg33text)
'glscalef(1.05,1.05,1.05)
	If vg330list<>0 Then
		glcalllist(vg330list)
	Else
		vg330list=glgenlists(1)
		glnewlist vg330list,gl_compile
		loadobjsize("objects/vg33_cockpit.obj",@"",@"",54)
      glendlist
	EndIf	
End Sub
Sub drawspitfire0
glenable(gl_lighting)
glenable(gl_light2)
glenable gl_texture_2d
If icar=7 Then 
	glbindtexture(gl_texture_2d,spitfiretext)
Else 
	glbindtexture(gl_texture_2d,spitfiretext2)
EndIf
	If spitfire0list<>0 Then
		glcalllist(spitfire0list)
	Else
		spitfire0list=glgenlists(1)
		glnewlist spitfire0list,gl_compile
		loadobjsize("objects/spitfire_cockpit.obj",@"",@"",79.3)
      glendlist
	EndIf	
gldisable(gl_light2)
gldisable(gl_lighting)
End Sub
Sub drawbf1090
glenable(gl_lighting)
glenable(gl_light2)
glenable gl_texture_2d
glbindtexture(gl_texture_2d,bf109text)
	If bf1090list<>0 Then
		glcalllist(bf1090list)
	Else
		bf1090list=glgenlists(1)
		glnewlist bf1090list,gl_compile
		loadobjsize("objects/bf109_cockpit.obj",@"",@"",55)
      glendlist
	EndIf	
gldisable(gl_light2)
gldisable(gl_lighting)
End Sub
Sub drawp51d0
glenable(gl_lighting)
glenable(gl_light2)
glenable gl_texture_2d
glbindtexture(gl_texture_2d,p51dtext)
	If p51d0list<>0 Then
		glcalllist(p51d0list)
	Else
		p51d0list=glgenlists(1)
		glnewlist p51d0list,gl_compile
		loadobjsize("objects/p51d_cockpit.obj",@"",@"",95)
      glendlist
	EndIf	
gldisable(gl_light2)
gldisable(gl_lighting)
End Sub
Sub drawf140
glenable gl_texture_2d
glbindtexture(gl_texture_2d,f14text)
	If f140list<>0 Then
		glcalllist(f140list)
	Else
		f140list=glgenlists(1)
		glnewlist f140list,gl_compile
		loadobjsize("objects/f14_cockpit2.obj",@"",@"",50)
      glendlist
	EndIf	
End Sub
Sub draweurofighter0
glenable gl_texture_2d
glbindtexture(gl_texture_2d,eurofightertext)
	If eurofighter0list<>0 Then
		glcalllist(eurofighter0list)
	Else
		eurofighter0list=glgenlists(1)
		glnewlist eurofighter0list,gl_compile
		loadobjsize("objects/f14_cockpit2.obj",@"",@"",50)
      glendlist
	EndIf	
End Sub
Sub drawfighter0
glenable gl_alpha_test
glAlphaFunc(gl_less,10/254)
glenable gl_texture_2d
glbindtexture(gl_texture_2d,fightertext2)
	If fighter0list<>0 Then
		glcalllist(fighter0list)
	Else
		fighter0list=glgenlists(1)
		glnewlist fighter0list,gl_compile
		loadobjsize("objects/fighter.obj",@"",@"",140)
      glendlist
	EndIf	
gldisable gl_alpha_test
End Sub
Sub drawspaceship0
glenable gl_texture_2d
glbindtexture(gl_texture_2d,spaceshiptext)
	If spaceship0list<>0 Then
		glcalllist(spaceship0list)
	Else
		spaceship0list=glgenlists(1)
		glnewlist spaceship0list,gl_compile
		loadobjsize("objects/f14_cockpit2.obj",@"",@"",50)
      glendlist
	EndIf	
End Sub
'/
Sub drawzero0
glenable(gl_lighting)
glenable(gl_light3)
glenable gl_texture_2d
'if icar=11 Then 
	glbindtexture(gl_texture_2d,zerotext)
'Else 
'	glbindtexture(gl_texture_2d,zero2text)
'EndIf
	If zero0list<>0 Then
		glcalllist(zero0list)
	Else
		zero0list=glgenlists(1)
		glnewlist zero0list,gl_compile
		loadobjsize("objects/zero1_cockpit.obj",@"",@"",37.3)
      glendlist
	EndIf	
gldisable(gl_light3)
gldisable(gl_lighting)
End Sub
Dim Shared As uint c150grplist,c150grptext
Sub drawc150grp
glenable(gl_lighting)
glenable(gl_light3)
glenable gl_texture_2d
'if icar=11 Then 
	glbindtexture(gl_texture_2d,c150grptext)
'Else 
'	glbindtexture(gl_texture_2d,zero2text)
'EndIf
   glpushmatrix
   var sc=0.25
   'gltranslatef(-32.5,-0.6,11)
   gltranslatef(-30.9,-0.6,17.4)
   glrotatef(-2.2,0,1,0)
   glrotatef(-cocko1,0,0,1)
   glrotatef(cocko2*(1-0.5*Abs(cocko1/60)),0,1,0)
	If c150grplist<>0 Then
		glcalllist(c150grplist)
	Else
		c150grplist=glgenlists(1)
		glnewlist c150grplist,gl_compile
		load3dssizesmooth("objects/c150grp.3ds",@"",@"",100*sc)
      glendlist
	EndIf
	glpopmatrix
gldisable(gl_light3)
gldisable(gl_lighting)
End Sub
Dim Shared As uint c150cockpittext
Sub drawc1500
glenable gl_texture_2d
glbindtexture(gl_texture_2d,c150cockpittext)
glenable gl_alpha_test
glAlphaFunc(gl_less,10/254)
gldisable GL_DEPTH_TEST
glpushmatrix
glplacecursor(xmax*0.5,ymax*0.99,-40)
gltexcarre4(40,40)'45
glpopmatrix
gldisable gl_alpha_test
glenable GL_DEPTH_TEST
End Sub
Dim Shared As uint boeing737cockpittext
Sub draw7370
Dim As Single ymax2
ymax2=ymax*(0.95+(1.0-sin2)*cos3*0.058)
gldisable GL_DEPTH_TEST
glpushmatrix
glenable gl_alpha_test
glAlphaFunc(gl_less,10/254)
glbindtexture(gl_texture_2d,boeing737cockpittext)
glplacecursor(xmax*0.5,ymax2*0.62,-40)
gltexcarre4(75,52)
glcolor3f(1,0,1)
'gldisable gl_lighting
'gldrawtext(Str(Int(vkm)),xmax*0.476,ymax*0.96,2)
'glenable gl_texture_2D
glpopmatrix     
gldisable gl_alpha_test
glenable GL_DEPTH_TEST
End Sub
Dim Shared As uint balloncockpittext
Sub drawballon0
glenable gl_texture_2d
glbindtexture(gl_texture_2d,balloncockpittext)
glenable gl_alpha_test
glAlphaFunc(gl_less,10/254)
gldisable GL_DEPTH_TEST
glpushmatrix
'glplacecursor(xmax*0.5,ymax*0.65,-40)
glplacecursor(xmax*0.526,ymax*0.73689,-40)
gltexcarre4(78,53.33)'46) 
glpopmatrix
gldisable gl_alpha_test
glenable GL_DEPTH_TEST
End Sub
Declare Sub drawcoptercockpit
Sub drawcockpit2()
Dim As Single ymax2
ymax2=ymax*(0.9875+(1.0-sin2)*cos3*0.0125)
glpushmatrix
If typeavion<7 Or typeavion=15 Or (typeavion=12 And (volant<>2 Or (Abs(cocko1)<60 And Abs(cocko2)<40))) Then 
 if typeavion<>15 then addhelicesmoke()	
 glbindtexture(gl_texture_2d,helicetext)	
 gldisable GL_DEPTH_TEST
 glEnable GL_BLEND
 'glBlendFunc GL_SRC_color,GL_ONE_MINUS_SRC_color
 glBlendFunc GL_SRC_alpha,GL_ONE_MINUS_SRC_alpha
 glcolor4f(1,1,1,0.62)
 Var dx=0.0,dy=0.0
 If volant=2 Then dx=xmax*0.012*cocko1:dy=ymax*0.022*cocko2
 If typeavion<>15 Then 
 	'glplacecursor(xmax*0.5+dx,ymax2*0.785+dy)
 	glplacecursor(xmax*0.5+dx,ymax2*0.790+dy)
 Else 
 	glplacecursor(xmax*0.5+dx,-ymax2*0.05+dy,2)
 	glrotatef(77,1,0,0)
 	glscalef(2,2,1)
 EndIf
 'helicerot0=helicerot0+(8.5+v)*1.5*kfps
 helicerot0=helicerot0+(9+v)*1.35*kfps
 If helicerot0>10000 Then helicerot0-=10000
 glrotatef(-helicerot0,0,0,1)
 If typeavion=12 Then 
 	gltexcarre4(35,35)
 Else
 	gltexcarre4(40,40)
 EndIf
 gldisable gl_blend
 glenable GL_DEPTH_TEST
EndIf
If typeavion=2 Then glplacecursor(xmax*0.5,ymax2*0.925,-25.28)
If typeavion=7 Then glplacecursor(xmax*0.5,ymax2*0.85,-21)
If typeavion=1 Then glplacecursor(xmax*0.5,ymax2*0.87,-25.9)
If typeavion=3 Then glplacecursor(xmax*0.5035,ymax2*0.74,-9.2)
If typeavion=4 Then glplacecursor(xmax*0.503,ymax2*0.855,-9.3)
If typeavion=5 Then glplacecursor(xmax*0.5,ymax2*0.98,-20)
If typeavion=8 Then glplacecursor(xmax*0.505,ymax2*0.92,-22)
If typeavion=9 Then glplacecursor(xmax*0.505,ymax2*0.92,-22)
If typeavion=6 Then glplacecursor(xmax*0.5,ymax2*1.075,-31,0.4)
If typeavion=10 Then glplacecursor(xmax*0.50,ymax2*0.95,37.2)
If typeavion=11 Then glplacecursor(xmax*0.505,ymax2*0.92,-22)
If typeavion=12 Then glplacecursor(xmax*0.5,ymax2*1.075,-31,0.7)
If typeavion=15 And volant=2 Then glplacecursor(xmax*0.5,ymax2*1.4,5,2)
'glplacecursor(xmax*0.5,ymax*0.57,-6)
caro2=0.055*caro2+0.945*sin2*10
caro3=0.055*caro3+0.945*sin3*10
glrotatef(-90,1,0,0)
glrotatef(90,0,0,1)
glrotatef(-0.115*caro3,1,0,0)
glrotatef(-0.105*caro2,0,1,0)
'If typeavion=2 Then drawcorsair0
'If typeavion=7 Then drawalphajet0
'If typeavion=1 Then drawvg330
'If typeavion=3 Then drawspitfire0
'If typeavion=4 Then drawbf1090
'If typeavion=5 Then drawp51d0
'If typeavion=8 Then drawf140
'If typeavion=9 Then draweurofighter0
'If typeavion=10 Then drawfighter0
'If typeavion=11 Then drawspaceship0
If typeavion=6 Then drawzero0
If typeavion=12 And volant=2 Then drawc150grp
If typeavion=12 And volant<>2 Then drawc1500
If typeavion=13 Then drawballon0
If typeavion=14 Then draw7370
If typeavion=15 And volant=2 Then drawcoptercockpit'drawc150grp
If typeavion=15 And volant<>2 Then drawballon0
glcolor3f(1,0,1)
gldisable gl_lighting
If volant<>2 Then gldrawtext(Str(Int(vkm)),xmax*0.476,ymax*0.95,2)
glenable gl_texture_2D
glpopmatrix
End Sub
/'
Sub drawcockpit20
     glenable(gl_texture_2d)
     glbindtexture(gl_texture_2d,corsairtext)
     glcolor3f(1,1,1)	
     glpushmatrix
     gltranslatef(mx,my,mz)
     glrotatef(o1,0,0,1)
     glrotatef(-o2,0,1,0)
     glrotatef(-0.85*o3,1,0,0)
    'gltranslatef(0,0,8)
     gltranslatef(23,0,0)'-22)
     'gltranslatef(22,0,2.5)
     drawcorsair0
     glpopmatrix
End Sub
'/
Dim Shared As Integer boatlist(5),voilelist,voile2list,voileboat(nboat)
Dim Shared As Single vboat(nboat),vboat0(nboat),boatvie(nboat),boatvie0(nboat)
Dim Shared As Single tboatturn(nboat),boatvie00(nboat)
Dim Shared As Single boatdo1(nboat),boatdo10(nboat),boatturn(nboat)
Dim Shared As Single dxboat(nboat),dyboat(nboat),distboatmax=110000'70000'45000
Dim Shared As Single boatco1(nboat),boatsi1(nboat),boatpoids(nboat),timeboat(nboat)
Dim Shared As Single dzboat1(nboat),dzboat2(nboat),dzboat3(nboat),dxboatmax(nboat)
Dim Shared As Integer boatwar(nboat)
Dim Shared As Single boatdcao1(nboat),boatdcao2(nboat),timeboatdca(nboat)
Dim Shared As Single distboatx(nboat),boattarget(nboat)
nboat2=min2(nboat,nboat2)
'#Include "boatfires.bi"
Sub initboat
Dim As Integer i  	
Randomize()
windo1=Rnd*360
For i=1 To 4
	typeboat(i)=0
	vboat0(i)=5
	boatx(i)=-1000+45000*(i Mod 2):boaty(i)=-1000+45000*((int(i/2.5))Mod 2)
	boato1(i)=Rnd*360
	dxboat(i)=300
	dyboat(i)=30
	dxboatmax(i)=490
	dzboat1(i)=110
	dzboat2(i)=170
	dzboat3(i)=90
	boatpoids(i)=1
	boatvie0(i)=200
	boatvie(i)=boatvie0(i)
Next
For i=5 To 6
	typeboat(i)=1
	vboat0(i)=1.8'5/3
	boatx(i)=-2000+20000*(i Mod 2)*rnd:boaty(i)=-2000+20000*((Int((i-4)/2.5))Mod 2)*rnd
	boato1(i)=Rnd*360
	dxboat(i)=170
	dyboat(i)=17
	dxboatmax(i)=150
	dzboat1(i)=1.5
	dzboat2(i)=5
	dzboat3(i)=1.5
	boatpoids(i)=0.5
	boatvie0(i)=40
	boatvie(i)=boatvie0(i)
Next
For i=7 To 7
	typeboat(i)=3
	vboat0(i)=3.5
	boatx(i)=-2000+20000*((i-1) Mod 2)*rnd:boaty(i)=-2000+20000*((Int((i-6)/2.5))Mod 2)*rnd
	boato1(i)=Rnd*360
	dxboat(i)=400
	dyboat(i)=40
	dxboatmax(i)=430
	dzboat1(i)=59
	dzboat2(i)=51
	dzboat3(i)=95
	boatpoids(i)=1
	boatvie0(i)=200
	boatvie(i)=boatvie0(i)
Next
For i=8 To 8
	typeboat(i)=2
	vboat0(i)=3
	boatx(i)=-2000+20000*((i-1) Mod 2)*rnd:boaty(i)=-2000+20000*((Int((i-6)/2.5))Mod 2)*rnd
	boato1(i)=Rnd*360
	dxboat(i)=400
	dyboat(i)=40
	dxboatmax(i)=430
	dzboat1(i)=59
	dzboat2(i)=51
	dzboat3(i)=95
	boatpoids(i)=1
	boatvie0(i)=200
	boatvie(i)=boatvie0(i)
Next
For i=9 To 9
	typeboat(i)=0
	vboat0(i)=5
	boatx(i)=-1000+45000*(i Mod 2):boaty(i)=-1000+45000*((int(i/2.5))Mod 2)
	boato1(i)=Rnd*360
	dxboat(i)=300
	dyboat(i)=30
	dxboatmax(i)=490
	dzboat1(i)=110
	dzboat2(i)=170
	dzboat3(i)=90
	boatpoids(i)=1
	boatvie0(i)=200
	boatvie(i)=boatvie0(i)
Next
For i=1 To 1'i=10 To 10
	typeboat(i)=4    'carrier
	vboat0(i)=3.7
	boatx(i)=-2000+20000*((i-1) Mod 2)*rnd:boaty(i)=-2000+20000*((Int((i-6)/2.5))Mod 2)*rnd
	boato1(i)=Rnd*360
	dxboat(i)=1850'2050
	dyboat(i)=200'280
	dxboatmax(i)=1850'2050
	dzboat1(i)=180
	dzboat2(i)=180
	dzboat3(i)=180
	boatpoids(i)=1
	boatvie0(i)=300
	boatvie(i)=boatvie0(i)
Next
For i=10 To nboat'i=11 To nboat
	typeboat(i)=0
	vboat0(i)=5
	boatx(i)=-1000+45000*(i Mod 2)+4000*rnd:boaty(i)=-1000+45000*((int(i/2.5))Mod 2)+4000*rnd
	boato1(i)=Rnd*360
	dxboat(i)=300
	dyboat(i)=30
	dxboatmax(i)=490
	dzboat1(i)=110
	dzboat2(i)=170
	dzboat3(i)=90
	boatpoids(i)=1
	boatvie0(i)=200
	boatvie(i)=boatvie0(i)
Next
i=1'10
boatx(i)=80:boaty(i)=900
boato1(i)=90
i=9
boatx(i)=-2000:boaty(i)=4000
boato1(i)=50+Rnd*80
For i=1 To nboat
	timeboat(i)=-999999
Next
End Sub 
initboat()
Dim Shared As Single tboatmort(nboat)
Dim Shared As Integer testmort(nboat)
Dim Shared As Single tirx,tiry,tirz,dtirx,dtiry,dtirz,ttirx,ttiry,ttirz
Dim Shared As Double ttirxyz
Sub tirboat(ByVal i As Integer,ByVal iairship As Integer=0)
Dim As Single distboat,co1,si1,co2,si2,dx,dy,dz,tdx,tdy,tdz,disttir,aux
If testmort(i)=0 Then  
	If distboatx(i)<14000 Or boattarget(i)=0 Then 
	   dx=mx-boatx(i)
	   dy=my-boaty(i)
	   dz=mz-boatz(i)-dzboat2(i)
	   aux=min(Abs(dx),1100.0)
	   aux=min(abs(dy),aux)
	   dx+=aux*cos1*cos2
	   dy+=aux*sin1*cos2
	   dz+=aux*sin2
	   distboat=Sqr(dx*dx+dy*dy+dz*dz)
	Else 
		dx=airshipx(boattarget(i))-boatx(i)
		dy=airshipy(boattarget(i))-boaty(i)
		dz=airshipz(boattarget(i))-boatz(i)-dzboat2(i)
	   distboat=Sqr(dx*dx+dy*dy+dz*dz)
	   If distboat>17000 Then boattarget(i)=0
	EndIf 	
	'distboatx=max(Abs(dx),Abs(dy)) 
	'distboat=max(Abs(dz),distboatx)
	If distboat<17000 Then
		If iairship=0 Then 
		  co1=Cos(boatdcao1(i)*degtorad)
		  si1=Sin(boatdcao1(i)*degtorad)
		  co2=Cos(boatdcao2(i)*degtorad)
		  si2=Sin(boatdcao2(i)*degtorad)
		Else 
		  co1=Cos((boatdcao1(i)+airshipo1(iairship))*degtorad)
		  si1=Sin((boatdcao1(i)+airshipo1(iairship))*degtorad)
		  co2=Cos((boatdcao2(i))*degtorad)
		  si2=Sin((boatdcao2(i))*degtorad)
		EndIf 	
		tdy=-dx*si1+dy*co1
		tdz=-distboat*si2+dz*co2
      boatdcao1(i)+=Sgn(tdy)*kfps*min(7.0,Abs(tdy/400)+0.25)
      boatdcao2(i)+=Sgn(tdz)*kfps*min(7.0,Abs(tdz/400)+0.25)
      boatdcao2(i)=max(-80.0,min(80.0,boatdcao2(i)))				
	EndIf
	If distboat<14000 Then
      If time2<timeboatdca(i)-100 Then timeboatdca(i)=time2 'if midnight
      If time2>(timeboatdca(i)+1) Then
	      timeboatdca(i)=time2
	      soundexplosion2
	      tirx=boatx(i):tiry=boaty(i):tirz=boatz(i)+dzboat2(i)
		   'tdx=-dx*cos1-dy*sin1
		   disttir=distboat*1.27
	      dtirx=disttir*co1*co2
	      dtiry=disttir*si1*co2
	      dtirz=disttir*si2
	      If iairship=0 Then 
	      	addtir2(1)
	      Else
	      	addtir2(2000+iairship)
	      EndIf
      EndIf    
	EndIf
EndIf
End Sub
Sub tirb25(ByVal iship As Integer)
Dim As Integer i
i=0
boatx(i)=airshipx(iship)
boaty(i)=airshipy(iship)
boatz(i)=airshipz(iship)
distboatx(i)=max(Abs(boatx(i)-mx),Abs(boaty(i)-my))
tirboat(i,iship)
End Sub
Sub resetboat(ByVal iboat As Integer)
Dim As Integer j
Dim As Single do1,r
   testmort(iboat)=0
   boatvie(iboat)=boatvie0(iboat)
	For j=1 To 40
	 do1=Rnd*360
	 r=distboatmax*(3+Rnd)/4.1'*Sqr(nboat2/4)
	 boatx(iboat)=mx+r*Cos(do1*degtorad)
	 boaty(iboat)=my+r*Sin(do1*degtorad)
	 boatz(iboat)=getterrainheight(boatx(iboat),boaty(iboat))
	 If boatz(iboat)<waterz0 Then Exit For 
	Next 
	boatwar(iboat)=0
	boattarget(iboat)=0
/'	For j=0 To 3
		tdegats(iboat,j)=0
	Next
   vdegats(iboat)=0
	For j=1 To nfire
		timefire(j,iboat)=0
	Next '/
End Sub
Function testboat(ByVal iboat As Integer,ByVal x As Single,ByVal y As Single) As Integer
Dim As Integer i2,test
Dim As Single x1,y1
If getterrainheight(x,y)>=waterz0 Then Return 1
test=0
For i2=1 To nboat2
  If i2<>iboat Then 	
	 x1=(x-boatx(i2))*boatco1(i2)+(y-boaty(i2))*boatsi1(i2)
	 If Abs(x1)<dxboatmax(i2) Then 
		y1=-(x-boatx(i2))*boatsi1(i2)+(y-boaty(i2))*boatco1(i2)
	   If Abs(y1)<(2*dyboat(i2)) Then test=2:Exit For
 	 EndIf
  EndIf 	
Next
Return test 
End Function
Sub moveboat
Exit Sub	
Dim As Integer i,test
Dim As Single co1,si1,do1,dmmx1,dmmx2,dmmx3,mz10,boato10,boatx2,boaty2,boatdo100,ddir,co10,si10
mz11=-999999
If Rnd<kfps*0.1 Then
	windo1+=(Rnd-0.5)*10 '1.5 '*5
	windco1=Cos(windo1*degtorad):windsi1=Sin(windo1*degtorad)
EndIf
While windo1>180:windo1-=360:Wend
While windo1<-180:windo1+=360:Wend
If plane=0 Then v=vboat(myboat)
myboat0=myboat:myboat=0
For i=1 To nboat2
 While boatx(i)<mx-distboatmax:boatx(i)+=2*distboatmax:boato1(i)=Rnd*360:Wend
 While boatx(i)>mx+distboatmax:boatx(i)-=2*distboatmax:boato1(i)=Rnd*360:Wend	
 While boaty(i)<my-distboatmax:boaty(i)+=2*distboatmax:boato1(i)=Rnd*360:Wend
 While boaty(i)>my+distboatmax:boaty(i)-=2*distboatmax:boato1(i)=Rnd*360:Wend
If testmort(i)=1 Then
	boatz(i)-=kfps*0.22
	soundsubwater
	If boatz(i)<(waterz0-400) Then
		testmort(i)=0
		resetboat(i)
	EndIf
Else
 If boatwar(i)<>0 And Rnd<0.3*kfps Then
 	If typeboat(i)=0 Or typeboat(i)=4 Then tirboat(i)
 EndIf
 co1=Cos(boato1(i)*degtorad)
 si1=Sin(boato1(i)*degtorad)
 mz10=-999999:boato10=boato1(i)
 distboatx(i)=max(Abs(boatx(i)-mx),Abs(boaty(i)-my))
 If distboatx(i)<(dxwater*scalex) And mz<(waterz0+altwater) Then 
  mmx=dxboat(i)+0.1
  mmy=dyboat(i)+0.1
  dmmx1=getterrainheight(boatx(i)+mmx*co1,boaty(i)+mmx*si1)
  dmmx3=getterrainheight(boatx(i)-mmx*co1,boaty(i)-mmx*si1)
  dmmx2=(dmmx1+dmmx3)/2
  boatz(i)=dmmx2
  If getterrainheight(boatx(i),boaty(i))<waterz0 Then boatz(i)=min(waterz0-0.001,boatz(i))
  boato2(i)=Atn((dmmx1-dmmx2)/(mmx))*radtodeg
  dmmy=getterrainheight(boatx(i)-mmy*si1,boaty(i)+mmy*co1) - _ 
       getterrainheight(boatx(i)+mmy*si1,boaty(i)-mmy*co1)
  boato3(i)=-Atn(dmmy/(2*mmy))*radtodeg
  If typeboat(i)=4 Then 
  	  boato2(i)*=0.4:boato3(i)*=0.4
  EndIf
  If (myboat0=i Or myboat0=0) And mz<(waterz0+mzh+200)  Then
   If distboatx(i)<dxboatmax(i) Then 
  	 y1=-(mx-boatx(i))*si1+(my-boaty(i))*co1
  	 If Abs(y1)<(mmy+mmy) Then
  	 	mmx=dxboatmax(i)
   	x1=(mx-boatx(i))*co1+(my-boaty(i))*si1
  	   If x1<(mmx) And x1>(mmx*0.3) Then
  	   	mz10=dmmx1+dzboat1(i)+mzh
  	   Else 
  	      If x1<=(mmx*0.31) And x1>=(-mmx*0.31) Then
  	    	   mz10=dmmx2+dzboat2(i)+mzh
  	      Else 
      	   If x1<(-mmx*0.3) And x1>(-mmx) Then
  	         	mz10=dmmx3+dzboat3(i)+mzh
  	       	EndIf 
  	   	EndIf 
  	   EndIf
  	 EndIf 
   EndIf
   If mz10>-99999 Then
   	If mz<=(mz10+30) Or plane=0 Then myboat=i
   	If typeboat(i)=4 Then 'carrier
   		pistez=mz10
   	EndIf
   EndIf
  EndIf
 Else 
  boatz(i)=getterrainheight(boatx(i),boaty(i))
  boato2(i)=0:boato3(i)=0
 EndIf
 If boatz(i)<=waterz0 And Abs(boatdo1(i))<0.1 Then
  co10=co1:si10=si1
  If vboat(i)<0 Then co1=-co1:si1=-si1	
  If testboat(i,boatx(i)+co1*dxboatmax(i)-si1*2*dyboat(i),boaty(i)+dxboatmax(i)*si1+co1*2*dyboat(i))>=1 Then
  	boatdo1(i)=-1
  Else 
   If testboat(i,boatx(i)+co1*dxboatmax(i)+si1*2*dyboat(i),boaty(i)+dxboatmax(i)*si1-co1*2*dyboat(i))>=1 Then
 	  boatdo1(i)=1
   EndIf 
  EndIf 
  'If testboat(i,boatx(i)+kfps*co1*vboat(i),boaty(i)+kfps*si1*vboat(i))=1 Then
  test=testboat(i,boatx(i)+0.8*co1*dxboatmax(i),boaty(i)+0.8*si1*dxboatmax(i))
  If test>=1 Then 
 	  If boatdo1(i)<=0 Then boatdo1(i)=-1 Else boatdo1(i)=1
     If test>=2 Then boatdo1(i)*=8 
  EndIf   
  If Abs(boatdo1(i))<0.1 Then 
   	If getterrainheight(boatx(i)+co1*1700-si1*90,boaty(i)+si1*1700+co1*90)>=(waterz0) Then
 	   	'boatdo1(i)=-0.4
 	      boatdo10(i)=-0.4:boatturn(i)=40
 	   Else
 	    	If getterrainheight(boatx(i)+co1*1700+si1*90,boaty(i)+si1*1700-co1*90)>=(waterz0) Then
 	    		'boatdo1(i)=0.4
 	    		boatdo10(i)=0.4:boatturn(i)=40
   	   EndIf 
   	EndIf
  EndIf
  If Rnd<0.1 Then
     If Abs(boatdo1(i))>0.1 Then boatdo1(i)=-boatdo1(i)'(Rnd-0.5)*2
  EndIf
  co1=co10:si1=si10
 EndIf
 If Abs(boatdo1(i))>0.1 Then 
 	If Abs(tboatturn(i))<=400 Then
 		do1=boatdo1(i)*kfps*abs(vboat(i))/vboat0(i)
 		boato1(i)+=do1
 		tboatturn(i)+=do1
 	Else 
 	   boatx(i)+=kfps*co1*vboat(i)
 	   boaty(i)+=kfps*si1*vboat(i)
 	EndIf
   boatturn(i)=0	
 EndIf 
 boatdo100=boatdo1(i)
 If typeboat(i)=0 Then vboat(i)+=0.2*kfps*(0.25*(vboat0(i)-vboat(i))-0.27*boatpoids(i)*Sin(boato2(i)))
 If typeboat(i)=4 Then vboat(i)+=0.2*kfps*(0.25*(vboat0(i)-vboat(i))-0.27*boatpoids(i)*Sin(boato2(i)))
 If typeboat(i)>=1 And typeboat(i)<=3 Then
 	 vwind=( vboat0(i)*(0.065+0.015)/(0.065+0.005) )*(0.92+kwave*0.08)
 	 ddir=boato1(i)-windo1
 	 While boato1(i)>180:boato1(i)-=360:Wend
 	 While boato1(i)<-180:boato1(i)+=360:Wend
 	 While ddir>180:ddir-=360:Wend
 	 While ddir<-180:ddir+=360:wend
 	 ddir=ddir*degtorad
    vboat(i)+=0.17*kfps*(0.065*(vwind-vboat(i))*cos((ddir)/2)+0.005*vwind*Cos(ddir)-0.015*vboat(i) _  
              -0.27*boatpoids(i)*Sin(boato2(i))) 	
    boato3(i)-=Sin(ddir)*0.2
 EndIf
 If Abs(boatdo1(i))<2 Then
    boatx2=boatx(i)+kfps*co1*vboat(i)
    boaty2=boaty(i)+kfps*si1*vboat(i)
 Else 
    boatx2=boatx(i)+kfps*co1*vboat(i)*0.2
    boaty2=boaty(i)+kfps*si1*vboat(i)*0.2
 EndIf 
 If getterrainheight(boatx2,boaty2)<waterz0 Or boatz(i)>=waterz0 Then
	boatdo1(i)=0
 	If tboatturn(i)>kfps Then tboatturn(i)-=kfps*0.5
 	If tboatturn(i)<-kfps Then tboatturn(i)+=kfps*0.5
 	boatx(i)=boatx2
 	boaty(i)=boaty2
   If boatturn(i)>0.1 Then
   	boatturn(i)-=1
   	boato1(i)+=boatdo10(i)*kfps*Abs(vboat(i))/vboat0(i)
   Else 
      If Rnd<0.1 Or i=9 Then 
    	  If Rnd<0.1/(1+fps) Then
    	  	 If time2<timeboat(i) Or time2>(timeboat(i)+500) Then 
   		   boatturn(i)=Rnd*90/0.4
   		   If i<>9 Then 
   		   	boatdo10(i)=sgn2(Rnd-0.5)*0.4
   		   Else
   		      boatdo10(i)=0.4*Sgn(co1*(boaty(10)+4000-boaty(i))-si1*(boatx(10)-4000-boatx(i)))
   		   EndIf
    	    EndIf 
    	  EndIf 
   	EndIf
   EndIf
 Else 
 	If boatdo1(i)<0.15 Then boatdo1(i)=sgn2(Rnd-0.5)
 EndIf
 If plane>=0 And mz10>-99999 Then
    mz11=mz10
 	 If Abs(boatdo100)<0.5 Then 
   	If guitestkey(vk_1) Or guitestkey(vk_5) Or guitestkey(vk_numpad7) Or (hatx=-1 And plane=0) Or _ 
        (plane=0 And guitestkey(vk_numpad4)) Then boato1(i)+=kfps*0.8*vboat(i)/vboat0(i):timeboat(i)=time2
 	   If guitestkey(vk_2) Or guitestkey(vk_6) Or guitestkey(vk_numpad9) Or (hatx=1 And plane=0) Or _  
 	     (plane=0 And guitestkey(vk_numpad6)) Then boato1(i)-=kfps*0.8*vboat(i)/vboat0(i):timeboat(i)=time2
 	 EndIf 
    If typeboat(i)=4 And Abs(boatdo1(i))<0.1 Then boato1(i)+=0.7*(boato10-boato1(i))
 	 o1+=boato1(i)-boato10
    co1=Cos(boato1(i)*degtorad)
    si1=Sin(boato1(i)*degtorad)
 	 mx=boatx(i)+co1*x1-si1*y1
 	 my=boaty(i)+si1*x1+co1*y1
 Else 	 
    If typeboat(i)=4 And Abs(boatdo1(i))<0.1 Then boato1(i)+=0.7*(boato10-boato1(i))
 EndIf
 boatco1(i)=co1
 boatsi1(i)=si1
EndIf 
Next i
End Sub
Sub testpiste
Dim As Integer i
piste=0
'If myboat<>0 Then piste=1
End Sub
'Dim Shared As Single x1,y1,z1,x2,y2,z2
/'
Sub drawvoile
  If voilelist<>0 Then
     glcalllist voilelist
  Else	
    voilelist=glgenlists(1)
    glnewlist voilelist,gl_compile 
    loadobjsize("objects/_voile.obj",@"",@"",310)
    glendlist    
  EndIf 	
End Sub
Sub drawvoile2
  If voile2list<>0 Then
     glcalllist voile2list
  Else	
    voile2list=glgenlists(1)
    glnewlist voile2list,gl_compile 
    loadobjsize("objects/_voile2.obj",@"",@"",310)
    glendlist    
  EndIf 	
End Sub
Sub drawboat
Dim As uint i,scale
Dim As Single do1
glenable(gl_texture_2d)
For i=1 To nboat2
If plane=0 Or car>0 Then
	If i>1 Then Exit Sub'carrier only
endif 	
 If typeboat(i)=0 Then 
    glenable(gl_lighting)
    glenable(gl_normalize)
	 gldisable(gl_light1)
    glbindtexture(gl_texture_2d,boattext)
 Else
 	 If typeboat(i)=1 Then  
       'gldisable(gl_lighting)
       glenable(gl_lighting)
       glenable(gl_normalize)
	    glenable(gl_light1)
       glbindtexture(gl_texture_2d,boattext2)
 	 Else 
       If typeboat(i)=2 Or typeboat(i)=3 Then 
          glenable(gl_lighting)
          glenable(gl_normalize)
	       gldisable(gl_light1)
          glbindtexture(gl_texture_2d,boattext3)
       Else 
          glenable(gl_lighting)
          glenable(gl_normalize)
	       gldisable(gl_light1)
          glbindtexture(gl_texture_2d,boattext4)
       EndIf 	
 	 EndIf 	
 EndIf   
 rotavion(boatx(i)-mx,boaty(i)-my,boatz(i)-mz)
 If x2>(max(Abs(y2),Abs(z2))-dxboatmax(i)-80.500) And boatz(i)<=(waterz0+0.1) Then 	
  If max(Abs(boatx(i)-mx),Abs(boaty(i)-my))<dxterrain*scalex And _ 
    Abs(boatx(i)+dmx0-xweb)<dxweb And Abs(boaty(i)+dmy0-yweb)<dyweb Then 	
   glpushmatrix
   gltranslatef(boatx(i),boaty(i),boatz(i))
   glrotatef(boato1(i),0,0,1)
   If Abs(boato2(i))>1 Then glrotatef(-boato2(i),0,1,0)
   If Abs(boato3(i))>1 Then glrotatef(-boato3(i),1,0,0)
   If scalexy>1.1 Then glscalef(1/scalexy,1/scalexy,1)
   If boatlist(typeboat(i))<>0 Then
     glcalllist boatlist(typeboat(i))
     If typeboat(i)=3 Then 
        gltranslatef(-350,0,90)
        do1=boato1(i)-windo1
        While do1<-180:do1+=360:Wend
        While do1>180:do1-=360:Wend
        If do1<-5 And do1>-175 Then voileboat(i)=-1
        If do1>5 And do1<175 Then voileboat(i)=1
        If voileboat(i)<0 Then
        	  If do1>0 Then do1=-do1
           glrotatef(-30-do1*0.4,0,0,1)
           drawvoile
        Else
        	  If do1<0 Then do1=-do1
           glrotatef(30-do1*0.4,0,0,1)
           drawvoile2
        EndIf 	
     EndIf
     glpopmatrix
   Else	
    boatlist(typeboat(i))=glgenlists(1)
    glnewlist boatlist(typeboat(i)),gl_compile 
    glcolor3f(0.75,0.75,0.9)
    Select Case typeboat(i)
    	Case 0
    	loadobjsize("objects/ship_lowpoly.obj",@"",@"",500)
      Case 1 
        loadobjsize("objects/sailship.obj",@"",@"",358)
    	Case 2,3
        loadobjsize("objects/_vessel.obj",@"",@"",600)
      Case Else 
        loadobjsize("objects/shipcarrier.obj",@"",@"",1800)
    End Select 
    glendlist
    glpopmatrix
   EndIf 
  EndIf 
 EndIf  
Next i
gldisable(gl_light1)
End Sub
'/ 
#Include "./airship.bi"
Dim Shared As Single tsun,kxsoleil,kysoleil,kzsoleil,ksoleil
Dim Shared As Single heure0,ixsun,iysun
Dim Shared As Single kxsat,kysat,kzsat,heure2,heure6=6,heure20=20
Sub drawstars
gldisable GL_LIGHTING
gldisable GL_DEPTH_TEST
glEnable GL_TEXTURE_2D
glbindtexture(gl_texture_2d,startext)
If heure<heure6 Or heure>heure20 Or tsphere=1 Or planet=1 Then 
	aux=1'210/256'184/256'170/256
Else 
	aux=0.34
EndIf
glcolor3f(aux,aux,aux)
glpushmatrix
gltranslatef( mx,my,mz)
glrotatef(-heure*170/24,0,0,1)
glrotatef(-50*(1-Abs(heure-12)/12),0,1,0)
If tsphere=1 Then
	gltranslatef(0,0,-1000000)
	gltexcarre(1000000)
	gltranslatef(0,0,1000000)
EndIf
gltranslatef( 100000,0,0)
gltexcarre3(200000,200000)
gltranslatef( -100000,100000,0)
glrotatef(90,0,0,1)
gltexcarre3(200000,200000)
gltranslatef( -100000,100000,0)
glrotatef(90,0,0,1)
gltexcarre3(200000,200000)
gltranslatef( -100000,100000,0)
glrotatef(90,0,0,1)
gltexcarre3(200000,200000)
gltranslatef( -100000,0,100000)
glrotatef(90,0,1,0)
gltexcarre3(200000,200000)
glEnable GL_DEPTH_TEST
glpopmatrix
End Sub
Sub drawstarspace
gldisable GL_LIGHTING
gldisable GL_DEPTH_TEST
glEnable GL_TEXTURE_2D
glcolor3f(1,1,1)
glpushmatrix
gltranslatef( mx,my,mz)
glbindtexture(gl_texture_2d,starspacetext2)
gltexsphere(200000,8,8)
glenable gl_alpha_test
glAlphaFunc(gl_greater,10/254)
glbindtexture(gl_texture_2d,startext)
	gltranslatef(0,0,-1000000)
	gltexcarre(1000000)
	gltranslatef(0,0,1000000)
glbindtexture(gl_texture_2d,starspacetext)
gltranslatef( 100000,0,0)
gltexcarre3(200000,200000)
gltranslatef( -100000,100000,0)
glrotatef(90,0,0,1)
gltexcarre3(200000,200000)
gltranslatef( -100000,100000,0)
glrotatef(90,0,0,1)
gltexcarre3(200000,200000)
gltranslatef( -100000,100000,0)
glrotatef(90,0,0,1)
gltexcarre3(200000,200000)
gltranslatef( -100000,0,100000)
glrotatef(90,0,1,0)
glbindtexture(gl_texture_2d,startext)
gltexcarre3(200000,200000) 
gldisable gl_alpha_test
glEnable GL_DEPTH_TEST
glpopmatrix
End Sub
Dim Shared As Single timeh,timedo1,timedo2,dhseashore
Dim Shared As Double timemaree
'Dim Shared As Single dxshadow,dyshadow,dzshadow,dxyshadow,o1shadow
Dim Shared As Single dxshadow0,dyshadow0,dzshadow0,dxyshadow0,o1shadow0
Sub drawsun
Dim As Single x,y,z,aux
Dim As Integer i,j
    If guitestkey(vk_f3) Then
    	confirm("change time of day ?","confirm",resp)
    	If resp="yes" Then
    	  timehour1=timehour+dtimehour'heure	
    	  While timehour1>24:timehour1-=24:wend
        If timehour1<=6 Or timehour1>=20 Then timehour2=6.1
    	  If timehour1>6 And timehour1<=8 Then timehour2=12
        If timehour1>8 And timehour1<=18 Then timehour2=19.1
        If timehour1>18 And timehour1<20 Then timehour2=1.5
        dtimehour=(timehour2-timehour+24)
        While dtimehour>24:dtimehour-=24:Wend 
        tsun=0
        dayjj+=0.25
        'timemaree=-9999
        'xweb1=xweb-999999
    	EndIf   
    EndIf 
tsun-=kfps
if tsun<0 Or time2<timeinit+10 Then
  tsun=600'200
  'tsun=30:dtimehour+=0.05:If dtimehour>24 Then dtimehour-=24
  'auxvar=heure:auxtest=0.2
  timehour=val(Left(Time(),2))+Val(Mid(Time(),4,2))/60
  'heure=0.1*(Timer Mod 240)
  heure=timehour+dtimehour
  If plane=1 And orbit=1 And planet=1 Then heure+=(mx+dmx0)*12/planetdxmax
  While heure>24:heure-=24:Wend 
  While heure<0:heure+=24:Wend 
  printgui("win.hour",Left(Str(heure+.0001),4))
  Var mois=Val(Left(Date,2))-1+Val(Mid(Date,4,2))/31
  Var dhour=sin(degtorad*lat)*Cos(degtorad*360*(mois/12))*(1.5/0.8)
  heure6=6.5+dhour
  heure20=19.5-dhour
  'auxvar=heure6:auxvar2=heure20:auxvar3=lat:auxtest=0.2
  'x=0-800*(12-heure):y=6000:z=410*(13.5-abs(12-heure))
  x=0-800*(12-heure):y=6000:z=490*(12-abs(12-heure))
  aux=0.8*10000*4*(1-Abs(12-heure)/140)/Sqr(x*x+y*y+z*z)
  kxsoleil=aux*x:kysoleil=aux*y:kzsoleil=aux*z
  timedo1=-Atn(x/y)*radtodeg-90
  timedo2=Atn(z/Sqr(x*x+y*y))*radtodeg
  heure2=timehour+dtimehour-(Int(100*dayjj*24/28)Mod 2400)/100
  If planet=1 And orbit=1 Then heure2+=(mx+dmx0)*12/planetdxmax
  While heure2>24:heure2-=24:Wend 
  While heure2<0:heure2+=24:Wend 
  x=0-800*(12-heure2):y=6000:z=380*(12-abs(12-heure2))
  aux=0.8*10000*4*(1-Abs(12-heure2)/140)/Sqr(x*x+y*y+z*z)
  kxsat=aux*x:kysat=aux*y:kzsat=aux*z
  'ksoleil=1-Abs(12-heure)/50'25
  If heure<=4 or heure>=21 Then
  	  ksoleil=0.4
  EndIf 
  If heure>4 And heure<=6 Then
  	  aux=(heure-4)/2
  	  ksoleil=0.6074*aux+(1-aux)*0.4
  EndIf     
  If heure>6 And heure<=8 Then
  	  aux=(heure-6)/2
  	  ksoleil=1.0*aux+(1-aux)*0.6'0.74
  EndIf
  If heure>8 And heure<=17 Then
  	  ksoleil=1.0
  EndIf
  If heure>17 And heure<=19 Then 
  	  aux=(19-heure)/2
  	  ksoleil=1.0*aux+(1-aux)*0.6'0.74 
  EndIf
  If heure>19 And heure<=21 Then 
  	  aux=(21-heure)/2
  	  ksoleil=0.6074*aux+(1-aux)*0.4
  EndIf
  If heure<heure6 Or heure>heure20-0.5 Then tnight=1 Else tnight=0
  'ksoleil=1-Abs(12-heure)/35
  'ksoleil=ksoleil*ksoleil
  'glClearColor 0.5, 0.5*ksoleil, 1.0*ksoleil, 0.0
  If Int(heure0*60)<>Int(heure*60) Then
  	  heure0=heure
  	  aux=sqr(kxsoleil*kxsoleil+kysoleil*kysoleil+kzsoleil*kzsoleil+1)
  	  ixsun=0.53*kxsoleil/aux'0.52
  	  iysun=0.53*kysoleil/aux
     For i=0 To 512
	    For j=0 To 512
		    terraincolor(i,j).y=terraincolory0(i,j)
	    Next
     Next 
     Var b=ksoleil^1.4:b=1.15+(ksoleil-1)*0.6'0.5
     Var c=min(1.0,b)
     Var a=c*c*0.471'0.65'0.14'0.07
     'a=0
     Var sb=b
     sb=0
     tdark=0
     If heure>heure20+2 Or heure<heure6 Then
     	  tdark=1
     	  a=0.01:b=0.35:c=b
     EndIf
     Var sb3=0.9
     gllightfv(gl_light0,GL_ambient,glparam4f(a,a,a, 1)) 'GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_POSITION
     'gllightfv(gl_light0,GL_diffuse,glparam4f(1,1,1, 1)) 'GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_POSITION
     gllightfv(gl_light0,GL_diffuse,glparam4f(b,b,c, 1)) 'GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_POSITION
     gllightfv(gl_light0,GL_specular,glparam4f(sb,sb,sb,1)) 'GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_POSITION
     gllightfv(gl_light3,GL_specular,glparam4f(sb3,sb3,sb3,1)) 'GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_POSITION
     Var dxyz=Sqr(kxsoleil*kxsoleil+kysoleil*kysoleil+kzsoleil*kzsoleil)
     dxshadow=kxsoleil/dxyz:dyshadow=kysoleil/dxyz:dzshadow=-kzsoleil/dxyz
     dxyshadow=max(0.001,Sqr(dxshadow*dxshadow+dyshadow*dyshadow))
     o1shadow=diro1(dxshadow,dyshadow)
	  glenable(gl_light0)
	  dxshadow0=dxshadow
	  dyshadow0=dyshadow
	  dzshadow0=dzshadow
	  dxyshadow0=dxyshadow
	  o1shadow0=o1shadow
	  sunco1=dxshadow/dxyshadow
	  sunsi1=dyshadow/dxyshadow
	  suntan2=min(20.0,dxyshadow/max(0.01,-dzshadow))
	  getmoonhour(heure)
	  dhseashore=(Cos(2*3.1416*moonhour/12)+1)
     'guinotice Str(getmoonlng)+"  "+Str(getmoonhour(heure))+" "+Str(dhseashore)
  EndIf
End if
     /'glpushmatrix
     glloadidentity
     glulookat(mx,my,mz+yh,mx+1000,my,mz+yh, 0,0,1)
     glrotatef(-o1,0,0,1)
     glrotatef(o2,0,1,0)     	
     gllightfv(gl_light0,GL_position,glparam4f(mx-kxsoleil*9,my-kysoleil*9,mz+kzsoleil*9,0))'w=0,directional
     glpopmatrix '/
If 1 Then
 If tdark=1 And (mz<mzsol0+200) Then'(plane=0 Or car>0) Then=
 	Var dr=16.5'20.0
   gllightfv(gl_light0,GL_position,glparam4f(mx+dr*cos1*cos2,my+dr*sin1*cos2,mz+dr*sin2+5,1)) 'w=1 position GL_POSITION
   glLightfv(gl_light0, GL_SPOT_DIRECTION, glparam3f(dmx,dmy,dmz-0.4))
   If (itime Mod 60)=0 Then
   glLightf(gl_light0, GL_SPOT_EXPONENT, 0.0)'3.0)
   glLightf(gl_light0, GL_CONSTANT_ATTENUATION, 0.0)
   glLightf(gl_light0, GL_LINEAR_ATTENUATION, 0.0)
   'glLightf(gl_light0, GL_QUADRATIC_ATTENUATION, 0.000004)
   glLightf(gl_light0, GL_QUADRATIC_ATTENUATION, 0.000002)
   'glLightfv(gl_light0, GL_SPOT_DIRECTION, glparam4f(dmx,dmy,dmz-0.2,0))
   glLightf(gl_light0, GL_SPOT_CUTOFF, 33.0)'32.0)
   EndIf 
   glenable gl_lighting
   glenable gl_normalize
 Else 
   'gllightfv(gl_light0,GL_position,glparam4f(mx-kxsoleil*9,my-kysoleil*9,mz+kzsoleil*9,0))'w=0,directional
   If (itime Mod 60)=0 Then
   gllightfv(gl_light0,GL_position,glparam4f(-kxsoleil*9,-kysoleil*9,kzsoleil*9,0))'w=0,directional
   glLightf(gl_light0, GL_SPOT_EXPONENT, 0.0)'3.0)
   glLightf(gl_light0, GL_CONSTANT_ATTENUATION, 0.0)
   glLightf(gl_light0, GL_LINEAR_ATTENUATION, 0.0)
   glLightf(gl_light0, GL_QUADRATIC_ATTENUATION, 0.0)
   EndIf 
 EndIf 
EndIf
End Sub
Dim Shared As uint sunbacktext
Sub drawsunset
Dim As Single aux
aux=ksoleil'0.5
If planet=1 And addonname<>"Earth" Then aux=0.28
If tsphere=1 Then aux=0.18*830000/(mz+800000)
glClearColor 0.5*aux, 0.5*aux, 1.0*aux, 0.0
glpushmatrix
'gltranslatef( mx+40000,my,mz-5000)
Var k5=2.5
gltranslatef( mx-kxsoleil*k5,my-kysoleil*k5,mz+kzsoleil*k5)'5
glrotatef(-heure*170/24,0,0,1)
glrotatef(-50*(1-Abs(heure-12)/12),0,1,0)
gldisable GL_LIGHTING
'glenable GL_LIGHTING
gldisable GL_DEPTH_TEST
'glEnable GL_COLOR_LOGIC_OP
glEnable GL_TEXTURE_2D
'glLogicOp GL_OR
glbindtexture(gl_texture_2d,sunsettext)
aux=210/256'184/256'170/256
glcolor3f(aux,aux,aux*0.6)
'glcolor3f( aux,aux*ksoleil,aux*ksoleil)
gltexcarre3(20000*k5,18000*k5)
'glDisable GL_COLOR_LOGIC_OP
glpopmatrix
If guitestkey(vk_up) Then
	If getfocus()=getguih("win.hour") Then
		heure-=1:If heure<0 Then heure+=24
		dtimehour=heure-timehour
		printgui("win.hour",Left(Str(heure),4))
		tsun=0:Sleep 300
	EndIf
EndIf
If guitestkey(vk_down) Then
	If getfocus()=getguih("win.hour") Then
		heure+=1:If heure>=24 Then heure-=24
		dtimehour=heure-timehour
		printgui("win.hour",Left(Str(heure),4))
		tsun=0:Sleep 300
	EndIf
EndIf
If (heure>4 And heure<(heure6+0.99)) Or (heure<22 And heure>(heure20-1.51)) Then
   glbindtexture(gl_texture_2d,sunbacktext)
   glBlendFunc GL_SRC_color,GL_ONE_MINUS_SRC_color
   glpushmatrix
   If tourelle=0 Then
      gltranslatef(mx+80000*cos1,my+80000*sin1,waterz)
   	glrotatef(o1,0,0,1)
   Else 	
      gltranslatef(mx+80000*tcos1,my+80000*tsin1,waterz)
   	glrotatef(o1+to1,0,0,1)
   EndIf
   'gltexcarre3(170000,50000,1,1)
   Var xx=100000,yy=15000+kzsoleil*k5*2,cc=1.0
   'cc=max(0.0,min(1.0,(heure-4)*0.5))
	glbegin(gl_quads)
   glcolor4f(cc,cc,cc,cc)
	glTexCoord2f(0,0.5)
	glvertex3f(0,-xx,-yy*0.01)
	gltexcoord2f(1,0.5)
	glvertex3f(0,xx,-yy*0.01)
   glcolor4f(0,0,0,0)
	glTexCoord2f(1,1)
	glvertex3f(0,xx,yy)
	gltexcoord2f(0,1)
	glvertex3f(0,-xx,yy)
	glend()
   glcolor4f(1,1,1,1)
   glpopmatrix
EndIf
glEnable GL_DEPTH_TEST
gldisable GL_BLEND
End Sub
Dim Shared As Single skydomex(40,40),skydomey(40,40),skydomez(40,40)
Dim Shared As Single skydometx(40,40),skydomety(40,40)
Dim Shared As Single skydomer(40,40),skydomeg(40,40),skydomeb(40,40),o1sky
Dim Shared As Integer tinitskydome=0
Sub drawskydome(rx As Single,ix0 As Integer,iy0 As Integer)
Dim As Integer i,j,k,l,ix,iy
Dim As Single do1,do2,r,g,b,kdo1,kdo2,r0,g0,b0,rx0
ix=max2(4,min2(40,ix0))
iy=max2(4,min2(40,iy0))
rx0=49000
If tinitskydome=0 Then 
 tinitskydome=1
 For i=0 To ix
	For j=0 To iy
		skydometx(i,j)=i/ix
		skydomety(i,j)=j/iy
		skydomer(i,j)=1
		skydomeg(i,j)=j/iy
		skydomeb(i,j)=j/iy
		do1=360*degtorad*i/ix
		do2=(-90+180*j/iy)*degtorad
		skydomex(i,j)=rx0*Cos(do1)*Cos(do2)
		skydomey(i,j)=rx0*Sin(do1)*Cos(do2)
		skydomez(i,j)=rx0*Sin(do2)
	Next
 Next
EndIf  
'glcolor3f Sqr(ksoleil), ksoleil, min(1.0,2.0*ksoleil)
Var ksoleil1=ksoleil
If heure>heure6 And heure<heure6+1 Then ksoleil1*=0.4+0.6*(heure-heure6)
r0=Sqr(ksoleil1):g0=ksoleil1:b0=min(1.0,2.0*ksoleil1)
o1sky=Sin(Timer*0.004)*50
For i=0 To ix
   For j=0 To iy
   	'Var o1sky=-90
		do1=(360*i/ix)+o1sky-(timedo1)
		do2=(-90+180*j/iy)-(timedo2)
      While do1<-180:do1+=360:Wend
      While do1>180:do1-=360:wend
      While do2<-180:do2+=360:Wend
      While do2>180:do2-=360:Wend
      Var kkdo2=1.0
      If (heure>heure6 And heure<heure6+2)Or(heure<heure20 and heure>heure20-3) Then kkdo2=max(0.0,min(1.0,(-80+180*j/iy)/60))
      kdo1=max(0.0,min(1.0,1-Abs(do1/150)))
      kdo2=max(0.0,min(1.0,(1-Abs(do2/70))*kkdo2))
   	r=max(0.0,min(1.0,r0*(0.6+kdo1*kdo2)))
		skydomer(i,j)=max(0.0,min(1.0,0.7+1.2*(r-0.7)))'*max(0.0,min(1.0,Abs(do1)/180))
		skydomeg(i,j)=max(0.0,min(1.0,kkdo2*0.7+1.2*(g0-0.7)))'*max(0.0,min(1.0,Abs(do1)/180))
		skydomeb(i,j)=max(0.0,min(1.0,kkdo2*0.7+1.2*(b0-0.7)))'*max(0.0,min(1.0,Abs(do1)/180))
   Next 		
Next 
glscalef(rx/rx0,rx/rx0,rx/rx0)
glbegin(gl_quads)
For i=0 To ix-1
	For j=0 To iy-1
		k=i:l=j
   	glTexCoord2f(skydometx(k,l),skydomety(k,l))
   	glcolor3f(skydomer(k,l),skydomeg(k,l),skydomeb(k,l))
	   glvertex3f(skydomex(k,l),skydomey(k,l),skydomez(k,l))				
		k=i:l=j+1
   	glTexCoord2f(skydometx(k,l),skydomety(k,l))
   	glcolor3f(skydomer(k,l),skydomeg(k,l),skydomeb(k,l))
	   glvertex3f(skydomex(k,l),skydomey(k,l),skydomez(k,l))				
		k=i+1:l=j+1
   	glTexCoord2f(skydometx(k,l),skydomety(k,l))
   	glcolor3f(skydomer(k,l),skydomeg(k,l),skydomeb(k,l))
	   glvertex3f(skydomex(k,l),skydomey(k,l),skydomez(k,l))				
		k=i+1:l=j
   	glTexCoord2f(skydometx(k,l),skydomety(k,l))
   	glcolor3f(skydomer(k,l),skydomeg(k,l),skydomeb(k,l))
	   glvertex3f(skydomex(k,l),skydomey(k,l),skydomez(k,l))				
	Next
Next
glend() 	
End Sub
Dim Shared As Single rplanetsat=1
Sub drawplanetsat	
glpushmatrix
'var heure2=heure+dayjj*24/28
'gltranslatef( mx+40000,my,mz-5000)
Var scale=5
gltranslatef( mx-kxsat*scale,my-kysat*scale,mz+kzsat*scale)
glrotatef(-heure2*170/24-dayjj*360/28,0,0,1)
glrotatef(-50*(1-Abs(heure2-12)/12),0,1,0)
gldisable GL_LIGHTING
glEnable GL_TEXTURE_2D
glbindtexture(gl_texture_2d,planetsattext)
Var aux=0.85
glcolor3f(aux,aux,aux)
'glcolor3f( aux,aux*ksoleil,aux*ksoleil)
'gltexcarre3(20000*5,18000*5)
gltexsphere(3000*scale*rplanetsat)
glpopmatrix
End Sub
Dim Shared As Single owind,tcielx,tciely,ciellist
Dim Shared As uint cieltext
'Dim Shared As Single  dhmaree=0,dhmaree0
Sub drawciel
'If heure<=3.2001 Or heure>=20.8001 Then drawsunset
glEnable GL_BLEND
glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_color
'If heure<8 or heure>18 Or tsphere=1 Or planet=1 Then drawstars
drawsunset
If iciel>1 And (planet=0 Or addonname="Earth") Then
gldisable GL_DEPTH_TEST
glcolor3f(ksoleil,ksoleil,ksoleil)'1,1,1)
glpushmatrix
Dim As Single x,y,xtex,ytex,aux=25000 '5000
owind=(owind+(rnd(1)-0.5))
if owind<0 then owind=owind+360
if owind>360 then owind=owind-360
tcielx=int(tcielx+8*kfps*cos(owind*degtorad))mod aux
tciely=int(tciely+8*kfps*sin(owind*degtorad))mod aux
gltranslatef (tcielx+aux*(Int(400.5+mx/aux)-400),tciely+aux*(Int(400.5+my/aux)-400), _ 
              3500+max(0.0,dhmaree*scalez))
glbindtexture(gl_texture_2d,cieltext)
If ciellist<>0 Then
	glCallList ciellist:glpopmatrix
Else 
 ciellist=glgenlists(1)
 glNewList ciellist , gl_compile
 gldisable GL_LIGHTING
 'glenable GL_LIGHTING
 'glEnable GL_COLOR_LOGIC_OP
 glEnable GL_TEXTURE_2D
 glLogicOp GL_OR
 'glColor3f( 120/255,140/255,255/255)
 'glcolor3f(1,1,1)
 x=-50000
 y=0-x
 xtex=2*50000/aux:ytex=xtex
 glBegin GL_QUADS
 'glnormal3f(0,0,1)
 glTexCoord2f(0,0)
 glVertex3f(x,x,0)
 glTexCoord2d(xtex,0)
 glVertex3f(y,x,0)
 glTexCoord2f(xtex,ytex)
 glVertex3f(y,y,0)
 glTexCoord2f(0,ytex)
 glVertex3f(x,y,0)
 glEnd
 'glDisable GL_COLOR_LOGIC_OP
 glDisable GL_TEXTURE_2D
 'gldisable GL_LIGHTING  
 glEndList
 glpopmatrix
EndIf 
EndIf 
glEnable GL_DEPTH_TEST
gldisable GL_BLEND
If planetsat=1 And orbit=1 Then drawplanetsat
End Sub
'Dim Shared As Single x1,y1,z1,x2,y2,z2
Sub rotavion(ByVal x As Single,ByVal y As Single,ByVal z As Single)
/'If plane=0 Or car>0 Then
If tourelle=0 Then 
 x2=x*cos1+y*sin1
 'y1=0-x*sin1+y*cos1
 'z1=z
 'x2=x1*cos2+z*sin2
 'y2=y1
 y2=-x*sin1+y*cos1
 z2=z'-x1*sin2+z*cos2
Else
 x2=x*tcos1+y*tsin1
 'y1=0-x*tsin1+y*tcos1
 'z1=z
 'x2=x1*tcos2+z*tsin2
 'y2=y1
 y2=-x*tsin1+y*tcos1
 z2=z'-x1*tsin2+z*tcos2
EndIf  	
Exit Sub 	
EndIf
'/
If tourelle=0 And scaleview>0.9 Then 
 Var x1=x*cos1+y*sin1
 'y1=0-x*sin1+y*cos1
 'z1=z
 x2=x1*cos2+z*sin2
 'y2=y1
 y2=-x*sin1+y*cos1
 z2=-x1*sin2+z*cos2
Else
 Var x1=x*tcos1+y*tsin1
 'y1=0-x*tsin1+y*tcos1
 'z1=z
 x2=x1*tcos2+z*tsin2
 'y2=y1
 y2=-x*tsin1+y*tcos1
 z2=-x1*tsin2+z*tcos2
EndIf  
End Sub
Sub rotavion2(ByVal x As Single,ByVal y As Single)
If tourelle=0 And scaleview>0.9 Then 
 x2=x*cos1+y*sin1
 'y1=0-x*sin1+y*cos1
 'z1=z
 'x2=x1'*cos2+z*sin2
 'y2=y1
 y2=-x*sin1+y*cos1
 'z2=-x1*sin2+z*cos2
Else
 x2=x*tcos1+y*tsin1
 'y1=0-x*tsin1+y*tcos1
 'z1=z
 'x2=x1'*tcos2+z*tsin2
 'y2=y1
 y2=-x*tsin1+y*tcos1
 'z2=-x1*tsin2+z*tcos2
EndIf  
End Sub
Sub rotavionpx(ByVal x As Single,ByVal y As Single,ByVal z As Single)
If tourelle=0 And scaleview>0.9 Then 
 Var px1=x*cos1+y*sin1
 'y1=0-x*sin1+y*cos1
 'z1=z
 px2=px1*cos2+z*sin2
 'y2=y1
 py2=-x*sin1+y*cos1
 pz2=-x1*sin2+z*cos2
Else
 Var px1=x*tcos1+y*tsin1
 'y1=0-x*tsin1+y*tcos1
 'z1=z
 px2=px1*tcos2+z*tsin2
 'y2=y1
 py2=-x*tsin1+y*tcos1
 pz2=-px1*tsin2+z*tcos2
EndIf  
End Sub
Dim Shared As Single tircos1,tirsin1,tircos2,tirsin2,tirdist
Dim Shared As Single impactdx,impactx,impacty,impactz,rimpact
Dim Shared As Integer impact 
Sub rotaviontir2(ByVal x As Single,ByVal y As Single,ByVal z As Single,_
	             ByRef x2 As Single,ByRef y2 As Single,ByRef z2 As Single)
 x1=x*tircos1+y*tirsin1
 'y1=0-x*sin1+y*cos1
 'z1=z
 x2=x1*tircos2+z*tirsin2
 'y2=y1
 y2=-x*tirsin1+y*tircos1
 z2=-x1*tirsin2+z*tircos2
End Sub 
Dim Shared As Single avx,avy,avz,avx1,avy1,avz1,avx2,avy2,avz2,avx3,avy3,avz3
Dim Shared As Single x3,y3,z3,x30,y30,z30,disttir
Dim Shared As Integer explosion1,impact40
Sub rotaviontir(ByVal avx As Single,ByVal avy As Single,ByVal avz As Single)
If tourelle=0 Then 
 avx3=avx
 avy3=avy*cos3+avz*sin3
 avz3=-avy*sin3+avz*cos3
 avx2=avx3*cos2-avz3*sin2
 avy2=avy3
 avz2=avx3*sin2+avz3*cos2
 avx1=avx2*cos1-avy2*sin1
 avy1=avx2*sin1+avy2*cos1
 avz1=avz2
Else
 avx3=avx
 avy3=avy*tcos3+avz*tsin3
 avz3=-avy*tsin3+avz*tcos3
 avx2=avx3*tcos2-avz3*tsin2
 avy2=avy3
 avz2=avx3*tsin2+avz3*tcos2
 avx1=avx2*tcos1-avy2*tsin1
 avy1=avx2*tsin1+avy2*tcos1
 avz1=avz2
EndIf  
End Sub
Dim Shared As Single mcos1,msin1,mcos2,msin2,mcos3,msin3
Sub rotationMd2(ByVal avx As Single,ByVal avy As Single,ByVal avz As Single) 
 avx3=avx
 avy3=avy*mcos3+avz*msin3
 avz3=-avy*msin3+avz*mcos3
 avx2=avx3*mcos2-avz3*msin2
 avy2=avy3
 avz2=avx3*msin2+avz3*mcos2
 avx1=avx2*mcos1-avy2*msin1
 avy1=avx2*msin1+avy2*mcos1
 avz1=avz2
End Sub  
Sub rotationMd22(ByVal avx As Single,ByVal avy As Single,ByVal avz As Single) 
 avx1=avx*mcos1+avy*msin1
 avy1=-avx*msin1+avy*mcos1
 avz1=avz
 avx2=avx1*mcos2+avz1*msin2
 avy2=avy1
 avz2=-avx1*msin2+avz1*mcos2
 avx3=avx2
 avy3=avy2*mcos3-avz2*msin3
 avz3=avy2*msin3+avz2*mcos3
End Sub 
Function testtirtriangle(ByVal tx1 As Single,ByVal ty1 As Single,ByVal tz1 As Single, _
	                      ByVal tx2 As Single,ByVal ty2 As Single,ByVal tz2 As Single, _
	                      ByVal tx3 As Single,ByVal ty3 As Single,ByVal tz3 As Single, _
	                      ByVal rtir As Single = 512 ) As Integer 
Dim As Single x1,y1,z1,x2,y2,z2,x3,y3,z3,a,b,det,x
rotaviontir2(tx1-tirx,ty1-tiry,tz1-tirz,x1,y1,z1)
If Abs(y1)>rtir Then Return 0
If Abs(z1)>rtir Then Return 0
If x1>(tirdist+rtir) Then Return 0
If x1<(-rtir) Then Return 0
rotaviontir2(tx2-tirx,ty2-tiry,tz2-tirz,x2,y2,z2)
rotaviontir2(tx3-tirx,ty3-tiry,tz3-tirz,x3,y3,z3)
'x1+a*(x2-x1)+b*(x3-x2)=x
'y1+a*(y2-y1)+b*(y3-y2)=0 '0<a<1 '0<b<a 
'z1+a*(z2-z1)+b*(z3-z2)=0
'b=-(y1+a*(y2-y1))/(y3-y2) 
det=(z2-z1)*(y3-y2)-(y2-y1)*(z3-z2)
If Abs(det)<0.01 Then Return 0
a=(-z1*(y3-y2)+y1*(z3-z2))/det
If a<0 Or a>1 Then Return 0
b=(z1*(y2-y1)-y1*(z2-z1))/det
If b<0 Or b>a Then Return 0
x=x1+a*(x2-x1)+b*(x3-x2)
If x<0 Or x>tirdist Then Return 0
impactdx=x
tirdist=x
impact=1
Return 1
End Function
Function testtircarre(ByVal tx1 As Single,ByVal ty1 As Single,ByVal tz1 As Single, _
	                      ByVal tx2 As Single,ByVal ty2 As Single,ByVal tz2 As Single, _
	                      ByVal tx3 As Single,ByVal ty3 As Single,ByVal tz3 As Single, _
	                      ByVal rtir As Single = 512 ) As Integer 
Dim As Single x1,y1,z1,x2,y2,z2,x3,y3,z3,a,b,det,x
rotaviontir2(tx1-tirx,ty1-tiry,tz1-tirz,x1,y1,z1)
If Abs(y1)>rtir Then Return 0
If Abs(z1)>rtir Then Return 0
If x1>(tirdist+rtir) Then Return 0
If x1<(-rtir) Then Return 0
rotaviontir2(tx2-tirx,ty2-tiry,tz2-tirz,x2,y2,z2)
rotaviontir2(tx3-tirx,ty3-tiry,tz3-tirz,x3,y3,z3)
'x1+a*(x2-x1)+b*(x3-x1)=x
'y1+a*(y2-y1)+b*(y3-y1)=0 '0<a<1 '0<b<1 
'z1+a*(z2-z1)+b*(z3-z1)=0
'b=-(y1+a*(y2-y1))/(y3-y1) 
det=(z2-z1)*(y3-y1)-(y2-y1)*(z3-z1)
If Abs(det)<0.001 Then Return 0
a=(-z1*(y3-y1)+y1*(z3-z1))/det
If a<0 Or a>1 Then Return 0
b=(z1*(y2-y1)-y1*(z2-z1))/det
If b<0 Or b>1 Then Return 0
x=x1+a*(x2-x1)+b*(x3-x1)
If x<0 Or x>tirdist Then Return 0
impactdx=x
tirdist=x
impact=1
Return 1
End Function
Function testtirMd2(ByVal md2node As md2_node Ptr) As Integer 
Dim As Single x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,sx,sy,sz
Dim As Integer test=0 
sx=md2node->scalex
sy=md2node->scaley
sz=md2node->scalez
bxmin=md2node->md2model->bxmin*sx
bymin=md2node->md2model->bymin*sy
bzmin=md2node->md2model->bzmin*sz
bxmax=md2node->md2model->bxmax*sx
bymax=md2node->md2model->bymax*sy
bzmax=md2node->md2model->bzmax*sz
rmax=Abs(bxmin)
If rmax<Abs(bymin) Then rmax=Abs(bymin)
If rmax<Abs(bzmin) Then rmax=Abs(bzmin)
If rmax<Abs(bxmax) Then rmax=Abs(bxmax)
If rmax<Abs(bymax) Then rmax=Abs(bymax)
If rmax<Abs(bzmax) Then rmax=Abs(bzmax)
x0=md2node->x
y0=md2node->y
z0=md2node->z
rotaviontir2(x0-tirx,y0-tiry,z0-tirz,x1,y1,z1)
If Abs(y1)>rmax Then Return 0
If Abs(z1)>rmax Then Return 0
If x1>(tirdist+rmax) Then Return 0
If x1<(-rmax) Then Return 0
rmax=rmax*2*1.41	
mcos1=Cos(md2node->rotz*degtorad)
msin1=Sin(md2node->rotz*degtorad)
mcos2=Cos(-md2node->roty*degtorad)
msin2=Sin(-md2node->roty*degtorad)
mcos3=Cos(-md2node->rotx*degtorad)
msin3=Sin(-md2node->rotx*degtorad)
rotationMd2(bxmin,bymin,bzmin)
x1=x0+avx1:y1=y0+avy1:z1=z0+avz1
rotationMd2(bxmax,bymin,bzmin)	
x2=x0+avx1:y2=y0+avy1:z2=z0+avz1
rotationMd2(bxmin,bymax,bzmin)	
x3=x0+avx1:y3=y0+avy1:z3=z0+avz1
rotationMd2(bxmin,bymin,bzmax)	
x4=x0+avx1:y4=y0+avy1:z4=z0+avz1
/'
test=test Or testtircarre(x1,y1,z1,x2,y2,z2,x3,y3,z3,rmax)
'gltriangle(x1,y1,z1,x2,y2,z2,x3,y3,z3)
test=test Or testtircarre(x4,y4,z4,x4+(x2-x1),y4+(y2-y1),z4+(z2-z1),x4+(x3-x1),y4+(y3-y1),z4+(z3-z1),rmax)
'gltriangle(x4,y4,z4,x4+(x2-x1),y4+(y2-y1),z4+(z2-z1),x4+(x3-x1),y4+(y3-y1),z4+(z3-z1))
test=test Or testtircarre(x1,y1,z1,x2,y2,z2,x4,y4,z4,rmax)
'gltriangle(x1,y1,z1,x2,y2,z2,x4,y4,z4)
test=test Or testtircarre(x3,y3,z3,x3+(x2-x1),y3+(y2-y1),z3+(z2-z1),x3+(x4-x1),y3+(y4-y1),z3+(z4-z1),rmax)
'gltriangle(x3,y3,z3,x3+(x2-x1),y3+(y2-y1),z3+(z2-z1),x3+(x4-x1),y3+(y4-y1),z3+(z4-z1))
test=test Or testtircarre(x1,y1,z1,x3,y3,z3,x4,y4,z4,rmax)
'gltriangle(x1,y1,z1,x3,y3,z3,x4,y4,z4)
test=test Or testtircarre(x2,y2,z2,x2+(x3-x1),y2+(y3-y1),z2+(z3-z1),x2+(x4-x1),y2+(y4-y1),z2+(z4-z1),rmax)
'gltriangle(x2,y2,z2,x2+(x3-x1),y2+(y3-y1),z2+(z3-z1),x2+(x4-x1),y2+(y4-y1),z2+(z4-z1))
'/
test=test Or testtircarre((x1+x4)*0.5,(y1+y4)*0.5,(z1+z4)*0.5,_   
                           x2+(x4-x1)*0.5,y2+(y4-y1)*0.5,z2+(z4-z1)*0.5,_
                           x3+(x4-x1)*0.5,y3+(y4-y1)*0.5,z3+(z4-z1)*0.5,rmax)
'gltriangle((x1+x4)*0.5,(y1+y4)*0.5,(z1+z4)*0.5,x2+(x4-x1)*0.5,y2+(y4-y1)*0.5,z2+(z4-z1)*0.5,_
'                           x3+(x4-x1)*0.5,y3+(y4-y1)*0.5,z3+(z4-z1)*0.5)
test=test Or testtircarre((x1+x2)*0.5,(y1+y2)*0.5,(z1+z2)*0.5,_   
                           x3+(x2-x1)*0.5,y3+(y2-y1)*0.5,z3+(z2-z1)*0.5,_
                           x4+(x2-x1)*0.5,y4+(y2-y1)*0.5,z4+(z2-z1)*0.5,rmax)
'gltriangle((x1+x2)*0.5,(y1+y2)*0.5,(z1+z2)*0.5,x3+(x2-x1)*0.5,y3+(y2-y1)*0.5,z3+(z2-z1)*0.5,_
'                           x4+(x2-x1)*0.5,y4+(y2-y1)*0.5,z4+(z2-z1)*0.5)
test=test Or testtircarre((x1+x3)*0.5,(y1+y3)*0.5,(z1+z3)*0.5,_  
                           x2+(x3-x1)*0.5,y2+(y3-y1)*0.5,z2+(z3-z1)*0.5,_
                           x4+(x3-x1)*0.5,y4+(y3-y1)*0.5,z4+(z3-z1)*0.5,rmax)
'gltriangle((x1+x3)*0.5,(y1+y3)*0.5,(z1+z3)*0.5,x2+(x3-x1)*0.5,y2+(y3-y1)*0.5,z2+(z3-z1)*0.5,_
'                           x4+(x3-x1)*0.5,y4+(y3-y1)*0.5,z4+(z3-z1)*0.5)
Return test
End Function  
Function testtirboat(ByVal iboat As Integer) As Integer  
Dim As Single x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,x42,y42,z42
Dim As Integer test=0 
bxmin=-dxboatmax(iboat)*0.9
bymin=-dyboat(iboat)*1.5
bzmin=0'-dyboat(iboat)
bxmax=dxboatmax(iboat)*0.9
bymax=-bymin
bzmax=max(dzboat1(iboat),dzboat2(iboat))'dyboat(iboat)*2.7'5.9'2.7
bzmax=max(dzboat3(iboat),bzmax)*1.5
rmax=Abs(bxmin)
If rmax<Abs(bymin) Then rmax=Abs(bymin)
If rmax<Abs(bzmin) Then rmax=Abs(bzmin)
If rmax<Abs(bxmax) Then rmax=Abs(bxmax)
If rmax<Abs(bymax) Then rmax=Abs(bymax)
If rmax<Abs(bzmax) Then rmax=Abs(bzmax)
x0=boatx(iboat)
y0=boaty(iboat)
z0=boatz(iboat)
rotaviontir2(x0-tirx,y0-tiry,z0-tirz,x1,y1,z1)
If Abs(y1)>rmax Then Return 0
If Abs(z1)>rmax Then Return 0
If x1>(tirdist+rmax) Then Return 0
If x1<(-rmax) Then Return 0
rmax=rmax*2*1.41	
mcos1=boatco1(iboat)
msin1=boatsi1(iboat)
mcos2=Cos(boato2(iboat)*degtorad)
msin2=Sin(boato2(iboat)*degtorad)
mcos3=Cos(boato3(iboat)*degtorad)
msin3=Sin(boato3(iboat)*degtorad)
rotationMd2(bxmin,bymin,bzmin)
x1=x0+avx1:y1=y0+avy1:z1=z0+avz1
rotationMd2(bxmax,bymin,bzmin)	
x2=x0+avx1:y2=y0+avy1:z2=z0+avz1
rotationMd2(bxmin,bymax,bzmin)	
x3=x0+avx1:y3=y0+avy1:z3=z0+avz1
rotationMd2(bxmin,bymin,bzmax)	
x4=x0+avx1:y4=y0+avy1:z4=z0+avz1
If typeboat(iboat)>=1 and typeboat(iboat)<=3 Then 
   rotationMd2(bxmin,bymin,max(170.0,bzmax*3.5))	
   x42=x0+avx1:y42=y0+avy1:z42=z0+avz1
 test=test Or testtircarre((x1*0.5+x2*0.5),(y1*0.5+y2*0.5),(z1*0.5+z2*0.5),_  
                           x3+(x2-x1)*0.5,y3+(y2-y1)*0.5,z3+(z2-z1)*0.5,_
                           x42+(x2-x1)*0.5,y42+(y2-y1)*0.5,z42+(z2-z1)*0.5,rmax)
 test=test Or testtircarre((x1*0.7+x2*0.3),(y1*0.7+y2*0.3),(z1*0.7+z2*0.3),_  
                           x3+(x2-x1)*0.3,y3+(y2-y1)*0.3,z3+(z2-z1)*0.3,_
                           x42+(x2-x1)*0.3,y42+(y2-y1)*0.3,z42+(z2-z1)*0.3,rmax)
 test=test Or testtircarre((x1*0.28+x2*0.72),(y1*0.28+y2*0.72),(z1*0.28+z2*0.72),_  
                           x3+(x2-x1)*0.72,y3+(y2-y1)*0.72,z3+(z2-z1)*0.72,_
                           x42+(x2-x1)*0.72,y42+(y2-y1)*0.72,z42+(z2-z1)*0.72,rmax)
EndIf    

test=test Or testtircarre(x1+0.59*(x4-x1),y1+0.59*(y4-y1),z4+0.59*(z4-z1), _   
                          x2+0.59*(x4-x1),y2+0.59*(y4-y1),z2+0.59*(z4-z1),_
                          x3+0.59*(x4-x1),y3+0.59*(y4-y1),z3+0.59*(z4-z1),rmax)
'test=test Or testtircarre((x1+x4)/2,(y1+y4)/2,(z1+z4)/2, x2+(x4-x1)/2,y2+(y4-y1)/2,z2+(z4-z1)/2,_
'                           x3+(x4-x1)/2,y3+(y4-y1)/2,z3+(z4-z1)/2,rmax)
'gltriangle((x1+x4)/2,(y1+y4)/2,(z1+z4)/2,x2+(x4-x1)/2,y2+(y4-y1)/2,z2+(z4-z1)/2,_
'                           x3+(x4-x1)/2,y3+(y4-y1)/2,z3+(z4-z1)/2)
test=test Or testtircarre( x1+(x2-x1)*0.1,y1+(y2-y1)*0.1,z1+(z2-z1)*0.1,_  
                           x3+(x2-x1)*0.1,y3+(y2-y1)*0.1,z3+(z2-z1)*0.1,_
                           x4+(x2-x1)*0.1,y4+(y2-y1)*0.1,z4+(z2-z1)*0.1,rmax)
test=test Or testtircarre( x1+(x2-x1)*0.8,y1+(y2-y1)*0.8,z1+(z2-z1)*0.8,_  
                           x3+(x2-x1)*0.8,y3+(y2-y1)*0.8,z3+(z2-z1)*0.8,_
                           x4+(x2-x1)*0.8,y4+(y2-y1)*0.8,z4+(z2-z1)*0.8,rmax)
'gltriangle((x1+x2)/2,(y1+y2)/2,(z1+z2)/2, x3+(x2-x1)/2,y3+(y2-y1)/2,z3+(z2-z1)/2,_
'                           x4+(x2-x1)/2,y4+(y2-y1)/2,z4+(z2-z1)/2)
test=test Or testtircarre((x1+x3)/2,(y1+y3)/2,(z1+z3)/2, x2+(x3-x1)/2,y2+(y3-y1)/2,z2+(z3-z1)/2,_
                           x4+(x3-x1)/2,y4+(y3-y1)/2,z4+(z3-z1)/2,rmax)
'gltriangle((x1+x3)/2,(y1+y3)/2,(z1+z3)/2, x2+(x3-x1)/2,y2+(y3-y1)/2,z2+(z3-z1)/2,_
'                           x4+(x3-x1)/2,y4+(y3-y1)/2,z4+(z3-z1)/2)
Return test	
End Function
Function testtirsphere(ByVal x As Single,ByVal y As Single,ByVal z As Single,ByVal r As Single) As Integer  
Dim As Single x1,y1,z1
rotaviontir2(x-tirx,y-tiry,z-tirz,x1,y1,z1)
If Abs(y1)>r Then Return 0
If Abs(z1)>r Then Return 0
If x1>(tirdist+r) Then Return 0
If x1<(-r) Then Return 0
tirdist=max(1.0,min(tirdist,x1-r))
Return 1
End Function 
Function testtirbuilding(ByVal x As Single,ByVal y As Single,ByVal z As Single,_  
	                      ByVal h As Single,ByVal r As Single) As Integer 
Dim As Integer i,test
If h<=r Then Return testtirsphere(x,y,z+h-r,r)
test=0
For i=0 To Int(h/r-1)
	test=test Or testtirsphere(x,y,z+i*r,r)
Next
test=test Or testtirsphere(x,y,z+h-r,r)
Return test
End Function
Function testtirstation(ByVal x As Single,ByVal y As Single,ByVal z As Single)As Integer   
Dim As Integer i,test
dim as Single scale=1.59,do1,rco1,rsi1,r,dr,h 
test=testtirsphere(x,y,z+75*scale,75*scale)
r=338*scale
dr=24*scale
h=z+20*scale
For i=1 To 10
	do1=degtorad*i*360/40
	rco1=r*Cos(do1):rsi1=r*Sin(do1)
	test=test Or testtirsphere(x+rco1,y+rsi1,h,dr)
	test=test Or testtirsphere(x-rco1,y-rsi1,h,dr)
	test=test Or testtirsphere(x-rsi1,y+rco1,h,dr)
	test=test Or testtirsphere(x+rsi1,y-rco1,h,dr)
Next
Return test 	
End Function
/'	                     
If mz>=stationz And mz<=(stationz+150*scale) Then
	Var testcollide=0
	Var dxy=Sqr((stationx-mx)*(stationx-mx)+(stationy-my)*(stationy-my))
   If dxy<=(75*scale) Then testcollide=1
   If dxy>=(280*scale) And dxy<=(395*scale) And mz<=(stationz+40*scale) Then testcollide=1
   If testcollide=1 Then testcrash()
EndIf '/
Function testtirterrain() As Integer 
Dim As Integer x,y,init,x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,test=0
Dim As Integer i,j,i1,dx=30
dx=1+tirdist/scalex
For x=-dx+Int(tirx/scalex+10000)-10000 To dx+Int(tirx/scalex+10000)-10000
	i=x+256+0.001
	while i<-100:i+=512+200:Wend 
	While i>612.2:i-=512+200:Wend
	init=0 	
	For y=-dx+Int(tiry/scalex+10000)-10000 To dx+Int(tiry/scalex+10000)-10000
     j=y+256+0.001
	  While j<-100:j+=512+200:Wend 
	  While j>612.2:j-=512+200:Wend 
 	  x0=x2:y0=y2:z0=z2
 	  x1=x3:y1=y3:z1=z3
 	  x2=x*scalex:y2=y*scalex:z2=scalez*terrain(i,j)
 	  i1=i+1:If i1>612.2 Then i1-=512+200
 	  x3=(x+1)*scalex:y3=y*scalex:z3=scalez*terrain(i1,j)
 	  If init>0 Then 
        test=test Or testtirtriangle(x0,y0,z0,x1,y1,z1,x2,y2,z2,scalex*1.4)
        test=test Or testtirtriangle(x1,y1,z1,x2,y2,z2,x3,y3,z3,scalex*1.4)
 	  EndIf 
 	  init=1
	Next
Next
Return test 
End Function 
Dim Shared As Integer itir,ntir=80,itesttir,typetir(ntir)
Dim Shared As Single vtirx(ntir),vtiry(ntir),vtirz(ntir),ftir(ntir),ftir0=30'15
Dim Shared As Single tirstartx(ntir),tirstarty(ntir),tirstartz(ntir)
Sub addtir(ByVal itypetir As Integer=0)
	itir=(itir+1)Mod ntir
	typetir(itir)=itypetir	
	ftir(itir)=ftir0
	aux=30'8*2
	tirstartx(itir)=tirx
	tirstarty(itir)=tiry
	tirstartz(itir)=tirz
	vtirx(itir)=(dtirx)/aux*(1+0.012*(Rnd-0.5))
	vtiry(itir)=(dtiry)/aux*(1+0.012*(Rnd-0.5))
	vtirz(itir)=(dtirz)/aux*(1+0.012*(Rnd-0.5))
	Var k=0.045
	addsmoke(tirx+vtirx(itir)*k,tiry+vtiry(itir)*k,tirz+vtirz(itir)*k,-1)
End Sub
Sub addtirairship(ByVal i As Integer,ByVal itypetir As Integer=0)
Dim As Single disttir=20000
   disttir+=airshipv(i)*30
	tirx=airshipx(i)
	tiry=airshipy(i)
	tirz=airshipz(i)
	dtirx=disttir*airshipco1(i)*airshipco2(i)
	dtiry=disttir*airshipsi1(i)*airshipco2(i)
	dtirz=disttir*airshipsi2(i)
	addtir(itypetir)
End Sub
Sub addtir2(ByVal itypetir As Integer=0)
Dim As Single vtir=1000,disttir,aux
	itir=(itir+1)Mod ntir
	typetir(itir)=itypetir
	disttir=Sqr(dtirx*dtirx+dtiry*dtiry+dtirz*dtirz)
	ftir(itir)=min2(30,disttir/vtir)'ftir0
	aux=max2(1,disttir/vtir)	
	tirstartx(itir)=tirx
	tirstarty(itir)=tiry
	tirstartz(itir)=tirz
	vtirx(itir)=(dtirx/aux)*(1+0.2*(Rnd-0.5))
	vtiry(itir)=(dtiry/aux)*(1+0.2*(Rnd-0.5))
	vtirz(itir)=(dtirz/aux)*(1+0.2*(Rnd-0.5))
End Sub
Dim Shared As Single avionsmoke
Dim Shared As uint nhorse=50,nhorse0=17,nhorse2=0,md2ihorse(nhorse),testsoundshoot,ndrawmd2'nhorse=29
Dim Shared As Single horsex(nhorse),horsey(nhorse),horsez(nhorse),horseo1(nhorse),horseo2(nhorse)
Sub testtir(ByVal itypetir As Integer=0)
Dim As Integer i  	
Dim As Integer ishiptir,typeship0,itower,ii,jj,ii1,jj1
ishiptir=itypetir-1000
If itypetir>2000 Then ishiptir=itypetir-2000
tirdist=Sqr(dtirx*dtirx +dtiry*dtiry +dtirz*dtirz +1e-20)
tirsin2=dtirz/tirdist
tircos2=Sqr(max(0.0001,1.0-tirsin2*tirsin2))
tircos1=dtirx/(tirdist*tircos2)
tirsin1=dtiry/(tirdist*tircos2)
impact=0
If tsphere=0 Then 
If itypetir<>1 Then 
 If testtirterrain() Then rimpact=65
 If itypetir=0 Then 
   For i=1 To nhorse
     If testtirMd2(md2_nodes(md2ihorse(i))) Then rimpact=40:impact=1000+i	
   Next
 EndIf   
 For i=1 To nboat2
  If boatz(i)<waterz0 Then 	
    If testtirboat(i) Then rimpact=80:impact=3000+i
  EndIf 
 Next
EndIf 
For i=1 To ndome
	If showdome(i)=1 Then
		If dometype(i)=0 Then 
			If testtirsphere(domex(i),domey(i),domez(i),domer(i)) Then
				rimpact=65:impact=4000+i
			EndIf
		Else
			If testtirsphere(domex(i),domey(i),domez(i)+50,domer(i)) Then
				rimpact=50:impact=4000+i
			EndIf
		EndIf 	
	EndIf
Next
For i=1 To nairport2
  If showairport(i)=1 Then 
	Select Case airporttype(i)
		Case 1,3,6 'tower
			If testtirsphere(airportx(i)-dmx0,airporty(i)-dmy0,airportz(i)+50,airportr(i)) Then
				rimpact=50:impact=5000+i
				itower=1
			EndIf		
	   Case 2,4,7 'dome
			If testtirsphere(airportx(i)-dmx0,airporty(i)-dmy0,airportz(i)+50,airportr(i)) Then
				rimpact=65:impact=5000+i
				itower=1
			EndIf
		Case 5   '3towers 
			If testtirsphere(airportx(i)-dmx0,airporty(i)-dmy0,airportz(i)+50,airportr(i)) Then
				rimpact=50:impact=5000+i
				itower=1
			EndIf
			If testtirsphere(airportx(i)-dmx0,airporty(i)-dmy0-470,airportz(i)+50,airportr(i)) Then
				rimpact=50:impact=5000+i
				itower=2
			EndIf
			If testtirsphere(airportx(i)-dmx0,airporty(i)-dmy0-470-470,airportz(i)+50,airportr(i)) Then
				rimpact=50:impact=5000+i
				itower=3
			EndIf
	End Select	
  EndIf
Next
If topentown=0 Or itownp=1 Then 
 For i=1 To ntown2
	If showtown(i)=1 Then
		For ii=0 To 6
			For jj=0 To 6
			 If townbuild(i,ii,jj)>0 Then 	
				If testtirbuilding(towndx(i,ii,jj)-dmx0,towndy(i,ii,jj)-dmy0,_ 
				                   towndz(i,ii,jj),townh(i,ii,jj),200) Then
				   ii1=ii:jj1=jj
				   rimpact=65:impact=60000+i                
			   EndIf                  
			 EndIf 
			Next
		Next
	EndIf
 Next
Else
 For i=1 To ntowp2
	If showtowp(i)=1 Then
		For ii=0 To 6
			For jj=0 To 6
			 If towpbuild(i,ii,jj)>0 Then 	
				If testtirbuilding(towpdx(i,ii,jj)-dmx0,towpdy(i,ii,jj)-dmy0,_ 
				                   towpdz(i,ii,jj),towph(i,ii,jj),200) Then
				   ii1=ii:jj1=jj
				   rimpact=65:impact=60000+i                
			   EndIf                  
			 EndIf 
			Next
		Next
	EndIf
 Next
EndIf  
EndIf 'tsphere
'$$$If testtirMd2(md2_nodes(md2iavion)) Then rimpact=30:turnavion=Rnd*200:impact=2000
If plane<>2 Or itypetir<>0 Then
	If testtirsphere(avionx,aviony,avionz,90) Then rimpact=30:impact=2000
EndIf
For i=1 To nship2
	If i<>ishiptir Then 
	 If typeship(i)=4 Then 'b25	
	   If testtirsphere(airshipx(i),airshipy(i),airshipz(i),160) Then 
		  rimpact=30:impact=2000+i
	   EndIf 
	 Else
	   If testtirsphere(airshipx(i),airshipy(i),airshipz(i),97) Then 
		  rimpact=30:impact=2000+i
	   EndIf 
	 EndIf 	
	EndIf
Next
If tsphere=1 Then 
 If testtirstation(stationx,stationy,stationz) Then
	rimpact=40:impact=7001
 EndIf 
EndIf 
If itown4>0 Then
  For i=1 To itown4 
  	 Var r=max(70.0,min(townhousedx(i),townhousedy(i)))*0.6
    If testtirbuilding(townhousex(i),townhousey(i),_ 
		                 townhousez(i),max(20.0,townhouseh(i))*dktownh*0.4,r) Then
	   rimpact=65:impact=8000+i                
    EndIf   
  Next 			                  
EndIf 	
If itypetir<>0 Then 
	If itypetir=1 Then 'boat
		If testtirsphere(mx,my,mz,57)=1 Then impact=10000
	Else 
      'If testtirsphere(mx,my,mz,90)=1 Then impact=10000
      If testtirsphere(mx,my,mz,170)=1 Then impact=10000
      If max(Abs(tirx-mx),Abs(tiry-my))<500 Then
      	ttirx=tirx:ttiry=tiry:ttirz=tirz:ttirxyz=time2
      EndIf 	
	EndIf
EndIf

If impact>1000 And impact<2000 Then
  i=impact-1000
  soundhorse
  horsex(i)+=70*cos1
  horsey(i)+=70*sin1
  horsez(i)=getterrainheight(horsex(i),horsey(i))
  setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))			
EndIf
If impact=2000 Then 
   turnavion=Rnd*200
   avionvie-=force*(1+Rnd)*5.9*0.5*kfps/(1.0+klevel)
   If avionvie<avionvie0*0.4 And Rnd<0.4 Then avionsmoke=4000	
EndIf
If impact>2000 And impact<3000 Then
	i=impact-2000
	typeship0=typeship(i)
   If itypetir=0 And _   
    ((typeship0<>1 And typeship0<>0 And typeship0<5) or rnd<0.1  _  
      Or airshipvie(i)<airshipvie0(i)*0.6 ) Then
   	airshipwar(i)=10000
      target=i:typetarget=2:targetdist=0 'airship
   EndIf
   airshipvie(i)-=force*((1+Rnd)*1.3/(1.0+klevel))*kfps
	If airshipvie(i)<(-kfps-150.5) Then soundboom:rimpact*=3:airshipvie(i)=-150
   If airshipvie(i)<airshipvie0(i)*0.4 And Rnd<0.4 Then airshipsmoke(i)=4000
   testairshipboom(i)	
	If testsoundshoot=0 Then soundshoot:testsoundshoot=1
   impactx=tirx+tircos1*tircos2*tirdist
   impacty=tiry+tirsin1*tircos2*tirdist
   impactz=tirz+tirsin2*tirdist
	addsmoke(impactx,impacty,impactz,1)
EndIf
If impact>3000 And impact<4000 Then 'boat
	i=impact-3000
	If testsoundshoot=0 Then soundshoot:testsoundshoot=1
   impactx=tirx+tircos1*tircos2*tirdist
   impacty=tiry+tirsin1*tircos2*tirdist
   impactz=tirz+tirsin2*tirdist
	'addsfire(impactx,impacty,impactz,i,0.89)
   mcos1=boatco1(i)
   msin1=boatsi1(i)
   mcos2=Cos(boato2(i)*degtorad)
   msin2=Sin(boato2(i)*degtorad)
   mcos3=Cos(boato3(i)*degtorad)
   msin3=Sin(boato3(i)*degtorad)
	rotationMd22(impactx-boatx(i),impacty-boaty(i),impactz-boatz(i))
	If Rnd<0.35 Then '0.35 Then 
	'	addfire(avx3,avy3,avz3,i,350+Rnd*200)
	Else 
	'	addfire(avx3,avy3,avz3,i,15)
	EndIf
	boatvie(i)-=force*(1+Rnd)*kfps*0.3
	If boatvie(i)<(-kfps-99.5) Then soundboom:rimpact*=3:boatvie(i)=-99
   If itypetir=0 Then
   	boatwar(i)=1
   	target=i:typetarget=4:targetdist=0 'boat
   EndIf
EndIf
If impact>4000 And impact<5000 Then
	i=impact-4000
	var domevie_0=domevie(i)
	domevie(i)-=force*((1+Rnd)*3.3/(1.0+klevel))*kfps
   If domevie(i)<0 And domevie_0>=0 Then
   	soundboom
   	addboom(domex(i),domey(i),domez(i))
   	addsmoke(domex(i),domey(i),domez(i)+50,2)
   EndIf
	addsmoke(impactx,impacty,impactz)
EndIf 
If impact>5000 And impact<6000 Then
	i=impact-5000
	var airportvie_0=airportvie(i,itower)
	airportvie(i,itower)-=force*((1+Rnd)*3.3/(1.0+klevel))*kfps
   If airportvie(i,itower)<0 And airportvie_0>=0 Then
   	soundboom
   	addboom(airportx(i)-dmx0,airporty(i)-dmy0-(itower-1)*470,airportz(i))
   	addsmoke(airportx(i)-dmx0,airporty(i)-dmy0-(itower-1)*470,airportz(i)+50,2)
   EndIf
	addsmoke(impactx,impacty,impactz)
EndIf 
If impact>60000 And impact<90000 and tinittownvie=0 Then
	i=impact-60000
   impactx=tirx+tircos1*tircos2*tirdist
   impacty=tiry+tirsin1*tircos2*tirdist
   impactz=tirz+tirsin2*tirdist
  If topentown=0 Or itownp=1 Then  
	var townvie_0=townvie(i,ii1,jj1)
	townvie(i,ii1,jj1)-=force*((1+Rnd)*3.3/(1.0+klevel))*kfps
   If townvie(i,ii1,jj1)<0 And townvie_0>=0 Then
   	soundboom
   	addboom(towndx(i,ii1,jj1)-dmx0,towndy(i,ii1,jj1)-dmy0,impactz)
   	addsmoke(towndx(i,ii1,jj1)-dmx0,towndy(i,ii1,jj1)-dmy0,impactz+50,2)
   EndIf
  Else
	var towpvie_0=towpvie(i,ii1,jj1)
	towpvie(i,ii1,jj1)-=force*((1+Rnd)*3.3/(1.0+klevel))*kfps
   If towpvie(i,ii1,jj1)<0 And towpvie_0>=0 Then
   	soundboom
   	addboom(towpdx(i,ii1,jj1)-dmx0,towpdy(i,ii1,jj1)-dmy0,impactz)
   	addsmoke(towpdx(i,ii1,jj1)-dmx0,towpdy(i,ii1,jj1)-dmy0,impactz+50,2)
   EndIf
  EndIf 	
	If Rnd<0.12 Then 
		addsmoke(impactx,impacty,impactz,3)
	Else
		addsmoke(impactx,impacty,impactz,1)
	EndIf
	townchanged=1
EndIf 
If impact>7000 And impact<8000 Then 'station
   impactx=tirx+tircos1*tircos2*tirdist
   impacty=tiry+tirsin1*tircos2*tirdist
   impactz=tirz+tirsin2*tirdist
	addsmoke(impactx,impacty,impactz,1)
	If testsoundshoot=0 Then soundshoot:testsoundshoot=1
	Var stationvie_0=stationvie
	stationvie-=force*((1+Rnd)*3.3/(1.0+klevel))*kfps
   If stationvie<0 And stationvie_0>=0 Then
   	soundboom
   	addboom(impactx,impacty,impactz)
   	addsmoke(impactx,impacty,impactz,2)
  		If nship2>=7 Then airshipwar(nship2)=30000
   EndIf
	If stationvie<(-kfps-99.5) Then
		soundboom:rimpact*=3:stationvie=-99
   	addboom(impactx,impacty,impactz)
   	addsmoke(impactx,impacty,impactz,2)
	EndIf
EndIf 
If impact>8000 And impact<9000 Then
	i=impact-8000
   impactx=tirx+tircos1*tircos2*tirdist
   impacty=tiry+tirsin1*tircos2*tirdist
   impactz=tirz+tirsin2*tirdist
	var townvie_0=townhousevie(i)
	townhousevie(i)-=force*((1+Rnd)*5.0/(1.0+klevel))*kfps
   If townhousevie(i)<0 And townvie_0>=0 Then
   	soundboom
   	addboom(townhousex(i),townhousey(i),impactz)
   	addsmoke(townhousex(i),townhousey(i),impactz+50,2)
   EndIf
	If Rnd<0.13 Then 
		addsmoke(impactx,impacty,impactz,3)
	Else
		addsmoke(impactx,impacty,impactz,1)
	EndIf
EndIf 
If (itypetir=1 Or itypetir>2000) And ftir(itesttir)<0.001 Then rimpact=30:impact=1
If impact<>0 And itypetir<>0 Then soundshoot2
End Sub
Dim Shared As Integer iimpact,nimpact=5
Dim Shared As Single impactmx(nimpact),impactmy(nimpact),impactmz(nimpact),impacttime(nimpact)
Dim Shared As Single impactmr(nimpact),tshoot
Sub drawtir 
Dim As Single dx,dy,dz
glpushmatrix
impactx=tirx+tircos1*tircos2*tirdist*0.9
impacty=tiry+tirsin1*tircos2*tirdist*0.9
impactz=tirz+tirsin2*tirdist*0.9
gldisable gl_lighting
glenable gl_texture_2d
'gldisable gl_texture_2d
'glcolor3f(1,0.3,0)
'gllinewidth(4.5)
'glligne(tirx,tiry,tirz,impactx,impacty,impactz)
myglbindtexture(gl_texture_2d,@feutext2)
glcolor3f(1,1,0.6)
gltranslatef(tirx,tiry,tirz)
dx=impactx-tirx:dy=impacty-tiry:dz=impactz-tirz
glrotatef(diro1(dx,dy),0,0,1)
glrotatef(diro1(Sqr(dx*dx+dy*dy),dz)-90,0,-1,0)
gltexcylindre(0.1,7.6,Sqr(dx*dx+dy*dy+dz*dz),8,2)
If impact>=1 Then
	iimpact+=1
	If iimpact>nimpact Then iimpact=0
	impacttime(iimpact)=time2+rimpact*0.001
	impactmx(iimpact)=impactx
	impactmy(iimpact)=impacty
	impactmz(iimpact)=impactz
	impactmr(iimpact)=rimpact*rforce
If ((impactx-mx)*dmx+(impacty-my)*dmy+(impactz-mz)*dmz)>120 Then 
	   impactmx(iimpact)=impactx-dmx*20
	   impactmy(iimpact)=impacty-dmy*20
	   impactmz(iimpact)=impactz-dmz*20
EndIf    
EndIf 
glcolor3f(1,1,1)
glpopmatrix
End Sub
Dim Shared As Integer ttir
Sub tir
If time2<tshoot Then tshoot=time2 'if midnight
If time2>(tshoot+0.1) And ttir=0 Then
ttir=1
soundexplosion1:tshoot=time2
disttir=30000+v*30'14000'8000
x30=0:y30=-40:z30=-1.7'5.5
x3=disttir:y3=-43:z3=z30-disttir/23'20'33.4 '/30
if viseur=2 then z3=z30-20
rotaviontir(x30,y30,z30)	
tirx=mx+avx1:tiry=my+avy1:tirz=mz+avz1
rotaviontir(x3,y3,z3)	
dtirx=mx+avx1-tirx:dtiry=my+avy1-tiry:dtirz=mz+avz1-tirz
addtir
y30=-y30:y3=-y3
rotaviontir(x30,y30,z30)	
tirx=mx+avx1:tiry=my+avy1:tirz=mz+avz1
rotaviontir(x3,y3,z3)	
dtirx=mx+avx1-tirx:dtiry=my+avy1-tiry:dtirz=mz+avz1-tirz
addtir
Else 
 ttir=0	
EndIf 
End Sub
Sub drawviseur
glcolor3f(0,1,1)
	'If viseur=1 Then gldrawtext("- -",xmax/2-12.5,ymax/2+30,2.5)
	'If viseur=2 Then gldrawtext("- -",xmax/2-12.5,ymax/2+7,2.5)
	'If viseur=1 Then gldrawtext("_   _",xmax/2-17,ymax/2+16.2,1.5)
If volant<>6 Or tourelle=1 Then 
	If viseur=1 Then gldrawtext("_   _",xmax/2-17-5,ymax/2+24.3,1.5)
	If viseur=2 Then gldrawtext("_   _",xmax/2-17-5,ymax/2-7.2,1.5)
Else
	If viseur=1 Then gldrawtext("+",xmax/2-4,(0.9-0.4*sin2)*ymax/2,1)
	If viseur=2 Then gldrawtext("+",xmax/2-4,(0.8-0.4*sin2)*ymax/2,1)
EndIf 
End Sub
Dim Shared As uint smoketext,cloudtext  
Dim Shared As Integer ncloud=200
Dim Shared As Single cloudx(ncloud),cloudy(ncloud),cloudz(ncloud),cloudr(ncloud)
Dim Shared As Single distcloud=50000
Sub initcloud
Dim As Integer i
ncloud2=min2(ncloud,ncloud2)
Randomize(Int(Timer/1000))
For i=1 To ncloud
	cloudx(i)=(Rnd-0.5)*2*distcloud+mx
	cloudy(i)=(Rnd-0.5)*2*distcloud+my
	cloudz(i)=max(getterrainheight(cloudx(i),cloudy(i))+1000+1200*Rnd,waterz+3000+1200*Rnd)
	cloudr(i)=(1500+Rnd*1000)*2.6
Next
End Sub
Dim Shared As Single rain,krain=1
Dim Shared As Integer ncloud22
Sub drawcloud(ByVal i As Integer)
	      glpushmatrix
	      gltranslatef(cloudx(i),cloudy(i),cloudz(i))	      
	      'glbindtexture(gl_texture_2d,cloudtext)
	      Var cc=1.0
	      If mz>mzsol0+100 Then
	      	cc=min(1.0,max(0.45,0.45*9000/(4500+Abs(cloudx(i)-mx)+Abs(cloudy(i)-my)+Abs(cloudz(i)-mz))))
	      Else 
	      	cc=min(1.0,max(0.45,0.45*9000/(4500+Abs(cloudx(i)-mx)+Abs(cloudy(i)-my))))
	      EndIf
	      glcolor3f(cc,cc,cc)
	      If cc>0.6 And i<=ncloud22 Then
	      	If Rnd<0.003*0.03*whumidity*kfps Then
	      		If (rain<90 Or Rnd<0.01*kfps) Then krain=15:rain=0
	      	EndIf
	      EndIf
	      If tourelle=0 Then 
	        glrotatef(o1,0,0,1)
	        glrotatef(-o2,0,1,0)
	      Else
	        glrotatef(to1+o1,0,0,1)
	        glrotatef(-to2,0,1,0)
	      EndIf
	      gltexcarre3(cloudr(i)*1.5,cloudr(i))
	      'gltexsphere(800)
	      glpopmatrix
End Sub 
Declare Sub drawrain()
Declare Sub drawcloudshadows()
Dim Shared As Single krain0=1
Sub drawclouds()
Dim As Integer i 	
Dim As Integer test
'krain=0.1
ncloud22=min2(ncloud2,Int(ncloud2*krain0))
If ncloud2>0 Then
If tdark=1 Then
   glenable gl_lighting
Else    
	gldisable gl_lighting
EndIf
'glenable gl_alpha_test
'glAlphaFunc(gl_greater,10/254)
glEnable GL_BLEND
glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_ALPHA
gldisable GL_DEPTH_TEST
gldisable gl_alpha_test
glenable(gl_texture_2d)
glbindtexture(gl_texture_2d,cloudtext)
glcolor4f(1,1,1,1)
For i=1 To ncloud2
	test=0
	cloudx(i)+=kfps*3
	If cloudx(i)<mx-distcloud Then cloudx(i)+=1.999*distcloud:test=1
	If cloudx(i)>mx+distcloud Then cloudx(i)-=1.999*distcloud:test=1
	If cloudy(i)<my-distcloud Then cloudy(i)+=1.999*distcloud:test=1
	If cloudy(i)>my+distcloud Then cloudy(i)-=1.999*distcloud:test=1
	If test=1 Then
		cloudz(i)=max(getterrainheight(cloudx(i),cloudy(i))+1000+1200*Rnd,waterz+3000+1200*Rnd)
	EndIf
	drawcloud(i)
Next
gldisable GL_BLEND
glEnable GL_DEPTH_TEST
'gldisable gl_alpha_test
EndIf 
'drawrain()
End Sub
Dim Shared As Single cloudshadowdo1(ncloud),cloudshadowdo2(ncloud),cloudshadowdo3(ncloud)
Dim Shared As Single clouddz(ncloud),testcloud(11,11)
Dim Shared As Double timecloudshadow
Dim Shared As Integer tupdatecloudshadow
Sub drawcloudshadow(ByVal i As Integer)
	      Var xx=cloudx(i)
	      Var yy=cloudy(i)
	      Var zz=max(0.0,cloudz(i)-getterrainheight(xx,yy))
	      Var dzz=max(0.2,-dzshadow)
	      xx+=zz*dxshadow/dzz
	      yy+=zz*dyshadow/dzz
	      'if i=1 And auxtest>0.4 Then xx=mx:yy=my
	      zz=getterrainheight(xx,yy)
	      'If zz>mz-10 And mz<mzsol00+100 Then Exit Sub 
      Var size=cloudr(i)*2
		rotavion(xx-mx,yy-my,zz-mz)
		if x2>(0.9*max(y2,z2)-size-100) And x2<dxterrain*scalex-size Then
	      If tupdatecloudshadow Then  
	       Var dxx=size*0.35,dyy=dxx
	       Var dmxx=(xx-mx)*cos1+(yy-my)*sin1
	       Var dmyy=-(xx-mx)*sin1+(yy-my)*cos1
	       If max(Abs(dmxx),Abs(dmyy))<Abs(dxx) Then'max(Abs(dxx),Abs(dyy)) Then 
	        'If Abs(dmxx)>60 And Abs(dmxx)<Abs(dxx) Then dxx=dmxx
	        'If Abs(dmyy)>60 And Abs(dmyy)<Abs(dyy) Then dyy=dmyy
	        If Abs(dmxx)>60 Then dxx=dmxx
	        If Abs(dmyy)>60 Then dyy=dmyy
	       EndIf 
	       Var zz2=getterrainheight(xx-dxx*cos1,yy-dxx*sin1)
	       Var do2=diro1(dxx,zz2-zz)
	       Var zz3=getterrainheight(xx+dyy*sin1,yy-dyy*cos1)
	       Var do3=diro1(dyy,zz3-zz)
	       cloudshadowdo1(i)=o1
	       cloudshadowdo2(i)=do2
	       cloudshadowdo3(i)=do3
	       Dim As integer ii=(xx-mx)/10000,jj=(yy-my)/10000
	       ii=max2(0,min2(11,ii+5))
	       jj=max2(0,min2(11,jj+5))
	       clouddz(i)=testcloud(ii,jj)
	       testcloud(ii,jj)+=0.5
	      EndIf  
	      Var cc=0.4
      	'cc*=min(1.0,max(0.001,0.25*9000/(1000+Abs(xx-mx)+Abs(yy-my))))
      	'cc*=min(1.0,max(0.001,(mz-zz)*Abs(x2)*0.002*0.002))
	      glcolor4f(cc,cc,cc,cc)
	      'glcolor4f(1,0,0,1)
	      glpushmatrix
	      gltranslatef(xx,yy,clouddz(i)+zz+max(8.0,(mz-zz)*0.03))	      
	      'glbindtexture(gl_texture_2d,cloudtext)
	      If tourelle=0 Then 
	        glrotatef(cloudshadowdo1(i),0,0,1)
	      Else
	        glrotatef(to1+cloudshadowdo1(i),0,0,1)
	      EndIf
	      glrotatef(cloudshadowdo2(i)-90,0,1,0)
	      glrotatef(cloudshadowdo3(i),1,0,0)
	      gltexcarre3(cloudr(i)*1.5,cloudr(i))
	      'gltexsphere(900)
	      glpopmatrix
	   EndIf    
End Sub 
Sub drawcloudshadows()
Dim As Integer i,j,k
Dim As Integer test
'krain=0.1
ncloud22=min2(ncloud2,Int(ncloud2*krain0))
If ncloud2>0 Then 
If time2>timecloudshadow+2 Then
	timecloudshadow=time2
	tupdatecloudshadow=1
	For i=0 To 11
		For j=0 To 11
			testcloud(i,j)=0
		Next
	Next
Else
	tupdatecloudshadow=0
EndIf
If mz<mzsol0+2500 Then Exit Sub 
'glenable gl_alpha_test
'glAlphaFunc(gl_greater,10/254)
glenable(gl_cull_face)
glcullface(gl_front)
gldisable gl_fog
glenable GL_BLEND
glBlendFunc gl_zero,GL_ONE_MINUS_SRC_color
'gldisable GL_DEPTH_TEST
glenable(gl_texture_2d)
glbindtexture(gl_texture_2d,cloudtext)
Var cc=0.25
glcolor4f(cc,cc,cc,1)
For i=1 To ncloud2
	drawcloudshadow(i)
Next
glcolor4f(1,1,1,1)
gldisable GL_BLEND
glEnable GL_DEPTH_TEST	
gldisable gl_cull_face	
gldisable gl_alpha_test
if ifog>0 And tdark=0 Then glenable gl_fog
EndIf 
End Sub
Dim Shared As Integer rainsound
Dim Shared As uint raintext,raintext2
'Dim Shared As Double train
Dim Shared As Integer skyauto,iskyauto,tsubciel
Const As Integer nraindrop=80
Dim Shared As uint raindroptext,essuieglacetext
Dim Shared As Integer tdrawraindrop(nraindrop)
Dim Shared As Double traindrop(nraindrop)
Dim Shared As Single xraindrop(nraindrop),yraindrop(nraindrop),sizeraindrop(nraindrop),scaleraindrop(nraindrop)
Dim Shared As Single essuieglaceo1,essuieglacedo1=1
Dim Shared As Double essuieglacetime
Sub drawraindrop()
Dim As Integer i,j,k
glEnable GL_BLEND
glBlendFunc GL_one_minus_SRC_color,GL_ONE'_MINUS_SRC_color
glcolor3f(1,1,1)
glenable(gl_texture_2d)
glbindtexture(gl_texture_2d,raindroptext)
gldisable gl_depth_test
gldisable gl_lighting 
glpushmatrix
For i=1 To nraindrop
	If time2>traindrop(i) Then
		traindrop(i)=time2+(0.5+Rnd)*4
		xraindrop(i)=100+(xmax-200)*Rnd
		yraindrop(i)=30+(ymax*0.8)*Rnd
		If Rnd<0.5 Then scaleraindrop(i)=1 Else scaleraindrop(i)=-1
		If Rnd<0.5 Then sizeraindrop(i)=1+Rnd Else sizeraindrop(i)=-1-Rnd
		tdrawraindrop(i)=1
		If time2>train+1 Then tdrawraindrop(i)=0
	EndIf
	If tdrawraindrop(i)=0 Then Continue For 
	If sizeraindrop(i)>0 Then
		If sizeraindrop(i)<3 Then sizeraindrop(i)+=0.01*kfps
	Else 		
		If sizeraindrop(i)>-3 Then sizeraindrop(i)-=0.01*kfps
	EndIf
	If plane>0 And car=0 And v>9 Then
		Var dx=xraindrop(i)-xmax*0.5
		Var dy=yraindrop(i)-ymax*0.1
		Var dxy=Abs(dx)+Abs(dy)+0.1
		Var kv=kfps*1.1*(v-8)/(1+v)
		xraindrop(i)+=kv*0.6*dx/dxy
		yraindrop(i)+=kv*0.4*dy/dxy
	ElseIf time2>traindrop(i)-2 Then
		Var dr=Abs(sizeraindrop(i))
		If dr>2.89 Then
			yraindrop(i)+=kfps*(1-Abs(traindrop(i)-1-time2))*0.95
		EndIf
	EndIf
	glplacecursor(xraindrop(i),yraindrop(i))
	If scaleraindrop(i)<0 Then glscalef(-1,-1,-1)
	gltexcarre(sizeraindrop(i)*0.25)
Next
glpopmatrix
gldisable gl_blend

If plane=1 And tourelle=0 And car>0 And volant=1 And v>0.7 Then
If time2>essuieglacetime+10 Then
	For i=1 To nraindrop
		tdrawraindrop(i)=0
	Next
	essuieglaceo1=-170
	essuieglacedo1=1
EndIf
Var kfps1=min(30.0,(Time2-essuieglacetime)*66)
essuieglacetime=Time2
If essuieglacedo1>0.9 Then
	essuieglaceo1+=kfps1
	If essuieglaceo1>89 Then
		soundessuieglace()
		essuieglaceo1=89:essuieglacedo1=-1
	EndIf
Else
	essuieglaceo1-=kfps1
	If essuieglaceo1<6 Then
		essuieglaceo1=6
		If time2<train Then
			soundessuieglace()
			essuieglacedo1=1
		EndIf
	EndIf
EndIf
Var co1=Cos(degtorad*essuieglaceo1)
Var si1=Sin(degtorad*essuieglaceo1)
Var xx=xmax*0.26,yy=ymax*0.82,dx35=17.5*max(2.0,kfps)
For i=1 To nraindrop
	If tdrawraindrop(i)=0 Then Continue For 
	Var dxy=(xraindrop(i)-xx)*si1+(yraindrop(i)-yy)*co1
	If Abs(dxy)<dx35 Then'35
	   Var dxx=(xraindrop(i)-xx)*co1-(yraindrop(i)-yy)*si1
		If Abs(dxx)<ymax*0.78 Then
			tdrawraindrop(i)=0
			traindrop(i)=min(traindrop(i),time2+0.3)
		EndIf
	EndIf
Next
train2=time2+2
glenable gl_alpha_test
glAlphaFunc(gl_lequal,100/254)
glbindtexture(gl_texture_2d,essuieglacetext)
glpushmatrix 
glplacecursor(xx,yy)
glrotatef(essuieglaceo1-45,0,0,1)
gltexcarre(19)
gldisable gl_alpha_test
glpopmatrix
EndIf 'volant
glenable gl_depth_test
If tdark=1 Then glenable gl_lighting
End Sub
Sub drawrain
Dim As Integer test=0 
'If Timer>train+30 Then train=Timer+100
'krain=15:rain=0
If Timer>train Or krain>=6 Then
	If Rnd<0.003*kfps Or rain<24 Then '10sec
	   If rain<100 Then rain+=1 
	   'If Rnd<(1/6)*(krain*0.3) Then   '60sec
	   If Rnd<(1/6)*(krain*0.99) Then   '60sec
	      var ciel=Trim(guigettext("win.ciel"))
	   	Var iskyauto1=0:If skyauto=1 Then iskyauto1=iskyauto
	   	If iskyauto1=1 Or ciel="sky1" Then If Rnd<1/60 Then train=Timer+70:test=1:EndIf:endif
	   	If iskyauto1=2 Or ciel="sky6" Then If Rnd<1/40 Then train=Timer+100:test=1:EndIf:endif
	   	If iskyauto1=3 Or ciel="sky5" Then If Rnd<1/27 Then train=Timer+140:test=1:EndIf:endif
	   	If iskyauto1=4 Or ciel="sky2" Then If Rnd<1/14 Then train=Timer+240:test=1:EndIf:EndIf
	   	If iskyauto1=5 Or ciel="sky7" Then If Rnd<1/8 Then train=Timer+440:test=1:EndIf:EndIf'8mn
	   	If test=1 Then
	   		train=Timer+(train-Timer)*(0.8+Rnd)/10+30'15
	   		soundthunder()
	   		rain=100
	   	EndIf
	   EndIf
	EndIf 
EndIf
'Var tsnow=0:If wtempmin<2.5 Then tsnow=1
krain=krain0*(0.9+krain0)*min(1.6,0.9+krain0)
If skyauto=1 Then
	If iskyauto=1 Then krain=0.1
	If iskyauto=2 Then krain=0.2
	If iskyauto=3 Then krain=0.4
	If iskyauto=4 Then krain=0.8
	If iskyauto=5 Then krain=1.6	
EndIf
If Timer<train-9999 Then train=Timer 'midnight
If Timer<train+6 And scaleview>0.9 And tsnow=0 And tlayer>-0.1 And plane>0 Then drawraindrop()
If Timer>train Or tlayer0<-0.4 Then
	If rainsound=1 Then rainsound=0:stopsoundrain
	Exit Sub
EndIf
If rainsound=0 And tsnow=0 Then rainsound=1:soundrain 
'If isinside(mx,my,homex,homey,homedx,homedy,1) Then Exit Sub   
gldisable GL_DEPTH_TEST
glEnable GL_BLEND
glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_color
glcolor3f(1,1,1)
glenable(gl_texture_2d)
If tsnow=0 Then
	glbindtexture(gl_texture_2d,raintext)
Else
   glbindtexture(gl_texture_2d,raintext2)
EndIf
glpushmatrix
glplacecursor(xmax/2,ymax/2)
glrotatef(-o3,0,0,1)
glrotatef(min(20.0,v*0.5),-1,0,0)
If tsnow=0 Then 
 Var vt=1.5,dt=((Timer*vt-Int(Timer*vt))*4)
 gltexcarre4(80,80,dt,0.5)
Else
 Var vt=0.2,dt=((Timer*vt-Int(Timer*vt))*4)
 gltexcarre4(80,80,dt,1)
EndIf 
glpopmatrix 
gldisable gl_blend 
glenable GL_DEPTH_TEST
End Sub 
Dim Shared As Integer ndust=100,initdust=0
Dim Shared As Single dustx(ndust),dusty(ndust),dustz(ndust) 
Sub drawdust(ByVal i As Integer,ByVal scale As Single=1.0)
	      glpushmatrix
	      gltranslatef(dustx(i),dusty(i),dustz(i))	      
	      If tourelle=0 Then 
	        glrotatef(o1,0,0,1)
	        glrotatef(-o2,0,1,0)
	      Else
	        glrotatef(to1+o1,0,0,1)
	        glrotatef(-to2,0,1,0)
	      EndIf
	      glcarre3(2.8*scale)
	      glpopmatrix
End Sub
Sub drawdusts(ByVal scale As Single=1.0)
Dim As Integer i
Dim As Single distdust=2400,scale2
distdust*=scale
scale2=max(0.01,scale)
gldisable(gl_texture_2d)
glcolor3f(0.6,0.6,0.6)
If initdust=0 Or Abs(dustx(1)-mx)>30000*scale Or Abs(dusty(1)-my)>30000*scale _   
   Or Abs(dustz(1)-mz)>30000*scale Then
	initdust=1
	For i=1 To ndust
	   dustx(i)=mx+(Rnd-0.5)*(distdust+distdust)
		dusty(i)=my+(Rnd-0.5)*(distdust+distdust)
		dustz(i)=mz+(Rnd-0.5)*(distdust+distdust)
	Next
EndIf
For i=1 To ndust
	If dustx(i)<(mx-distdust) Then dustx(i)+=(distdust+distdust)
	If dustx(i)>(mx+distdust) Then dustx(i)-=(distdust+distdust)
	If dusty(i)<(my-distdust) Then dusty(i)+=(distdust+distdust)
	If dusty(i)>(my+distdust) Then dusty(i)-=(distdust+distdust)
	If dustz(i)<(mz-distdust) Then dustz(i)+=(distdust+distdust)
	If dustz(i)>(mz+distdust) Then dustz(i)-=(distdust+distdust)
	rotavion(dustx(i)-mx,dusty(i)-my,dustz(i)-mz)
	If x2>(max(Abs(y2),Abs(z2))-100) Then
		drawdust(i,scale2)
	EndIf
Next
End Sub
Sub drawimpact(ByVal i As Integer)
glenable gl_alpha_test
glAlphaFunc(gl_greater,100/254)
	      glpushmatrix
	      gltranslatef(impactmx(i),impactmy(i),impactmz(i))	      
	      glbindtexture(gl_texture_2d,feutext)
	      glcolor3f(1,1,1)
	      If tourelle=0 Then 
	        glrotatef(o1,0,0,1)
	        glrotatef(-o2,0,1,0)
	      Else
	        glrotatef(to1+o1,0,0,1)
	        glrotatef(-to2,0,1,0)
	      EndIf
	      glrotatef(i*130,1,0,0)
	      gltexcarre3(impactmr(i)*2.5,impactmr(i)*2.5)
	      glpopmatrix
gldisable gl_alpha_test    
End Sub 
Dim Shared As Integer ismoke=0,nsmoke=50,typesmoke(nsmoke)'20
Dim Shared As Double smoketime(nsmoke)
Dim Shared As Single tsmoke=0,smokex(nsmoke),smokey(nsmoke),smokez(nsmoke)
Sub addsmoke(ByVal mx As Single,ByVal my As Single,ByVal mz As Single,ByVal itype As Integer=0)
Dim i As Integer
For i=1 To nsmoke
	ismoke+=1
	If ismoke>nsmoke Then ismoke=0
	If typesmoke(ismoke)<2 Then
		Exit For  
	Else 
	   If time2>(smoketime(ismoke)+17) Then Exit For
   EndIf 
Next i
	smokex(ismoke)=mx
	smokey(ismoke)=my
	smokez(ismoke)=mz
   smoketime(ismoke)=time2
   typesmoke(ismoke)=itype	
End Sub
Dim Shared As Integer iboom=0,nboom=4'20
Dim Shared As Integer boomtime(nboom),typeboom(nboom)
Dim Shared As Single boomx(nboom),boomy(nboom),boomz(nboom)
Sub addboom(ByVal mx As Single,ByVal my As Single,ByVal mz As Single,ByVal itype As Integer=0)
	iboom+=1
	If iboom>nboom Then iboom=0
	boomx(iboom)=mx
	boomy(iboom)=my
	boomz(iboom)=mz
   boomtime(iboom)=time2
   typeboom(iboom)=itype
   addsmoke(mx,my,mz,2)
End Sub
Dim Shared As Integer idebris=0,ndebris=4'20
Dim Shared As Integer debristime(ndebris),typedebris(ndebris)
Dim Shared As Single debrisx(ndebris),debrisy(ndebris),debrisz(ndebris)
Dim Shared As Single debrisvx(ndebris),debrisvy(ndebris),debrisvz(ndebris)
Sub adddebris(ByVal mx As Single,ByVal my As Single,ByVal mz As Single, _
	           ByVal vx As Single,ByVal vy As Single,ByVal vz As Single,ByVal itype As Integer=0)
	idebris+=1
	If idebris>ndebris Then idebris=0
	debrisx(idebris)=mx
	debrisy(idebris)=my
	debrisz(idebris)=mz
	debrisvx(idebris)=vx*0.9
	debrisvy(idebris)=vy*0.9
	debrisvz(idebris)=vz*0.9
   debristime(idebris)=time2
   typedebris(idebris)=itype	
End Sub
Sub drawdebris(ByVal i As Integer)
glenable gl_alpha_test
glAlphaFunc(gl_less,10/254)
gldisable(gl_depth_test)
	      glpushmatrix
	      debrisvx(i)=debrisvx(i)-0.03*kfps*debrisvx(i)+1e-10
	      debrisvy(i)=debrisvy(i)-0.03*kfps*debrisvy(i)+1e-10
	      debrisvz(i)=debrisvz(i)-0.03*kfps*debrisvz(i)+1e-10
	      debrisx(i)+=debrisvx(i)*kfps*kvaux
	      debrisy(i)+=debrisvy(i)*kfps*kvaux
	      debrisz(i)+=debrisvz(i)*kfps*kvaux
	      gltranslatef(debrisx(i),debrisy(i),debrisz(i))	      
	      glbindtexture(gl_texture_2d,debristext)
	      glcolor3f(1,1,1)
	      If tourelle=0 Then 
	        glrotatef(o1,0,0,1)
	        glrotatef(-o2,0,1,0)
	      Else
	        glrotatef(to1+o1,0,0,1)
	        glrotatef(-to2,0,1,0)
	      EndIf
	      glrotatef(i*130,1,0,0)
	      Var dt=max(0.001,time2-debristime(i))
	      Var r=200*(0.3+2*sqr(dt))
	      'Var r=75*(0.5+3*sqr(dt/2))*2
	      gltexcarre3(r,r)
	      glpopmatrix
gldisable gl_alpha_test
glenable(gl_depth_test)    
End Sub 
Sub testtirs()
Dim As Integer i,ishiptir
Dim As Single r,dt
testsoundshoot=0
	For itesttir=0 To ntir
		If ftir(itesttir)>0.001 Then
			ftir(itesttir)-=kfps4
			tirx=tirstartx(itesttir)
			tiry=tirstarty(itesttir)
			tirz=tirstartz(itesttir)
			dtirx=vtirx(itesttir)
			dtiry=vtiry(itesttir)
			dtirz=vtirz(itesttir)
			tirstartx(itesttir)+=dtirx*kfps4
			tirstarty(itesttir)+=dtiry*kfps4
			tirstartz(itesttir)+=dtirz*kfps4
			aux=1-0.05*kfps4'0.95
			vtirx(itesttir)=aux*vtirx(itesttir)
			vtiry(itesttir)=aux*vtiry(itesttir)
			If orbit=1 Or planet=0 Then
				vtirz(itesttir)=aux*vtirz(itesttir)-2.0*kfps4'19.0
			Else 
				vtirz(itesttir)=aux*vtirz(itesttir)-1.0*kfps4'19.0
			EndIf
			testtir(typetir(itesttir))
			drawtir
			If impact<>0 Then
				ftir(itesttir)=0
				If typetir(itesttir)=1 Or typetir(itesttir)>2000 Then 'dca
					addsmoke(impactx,impacty,impactz,1)
					aux=10+Abs(impactx-mx)+Abs(impacty-my)+Abs(impactz-mz)
					'If aux<2200 Then vie-=(1+Rnd)*400*400/(aux*aux)
					If aux<2200 Then vie-=(Rnd)*400*400/(aux*aux)
					ishiptir=typetir(itesttir)-2000
					For i=1 To nship2
					  If i<>ishiptir Then 	
					   aux=10+Abs(impactx-airshipx(i))+Abs(impacty-airshipy(i))+Abs(impactz-airshipz(i))
					   'If aux<2200 Then airshipvie(i)-=(1+Rnd)*400*400/(aux*aux)						
					   If aux<2200 Then airshipvie(i)-=(Rnd)*400*400/(aux*aux)						
					  EndIf 
					Next
				EndIf
				If typetir(itesttir)>1000 Then
					'addsmoke(impactx+dmx*90,impacty+dmy*90,impactz+dmz*90,1)
					addsmoke(impactx+dmx*370,impacty+dmy*370,impactz+dmz*370,1)
					aux=20+Abs(impactx-mx)+Abs(impacty-my)+Abs(impactz-mz)
					'If aux<200 Then vie-=(1+Rnd)*200/(aux)
					If aux<400 Then vie-=Sqr(force)*(1+Rnd)*200/(aux):addbullet()
				EndIf
			EndIf
		EndIf
	Next
	glenable(gl_texture_2d)
   glEnable GL_BLEND
   glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_ALPHA
	gldisable GL_DEPTH_TEST
	For i=0 To nsmoke
		dt=4.07
		If typesmoke(i)=-1 Then dt=1
		If typesmoke(i)=2 Then dt=17
		If typesmoke(i)=3 Then dt=45'35
		If time2<(smoketime(i)+dt) Then 			
		   If time2<(smoketime(i)-100) Then smoketime(i)=time2+dt 'if midnight
	      glpushmatrix
	      gltranslatef(smokex(i),smokey(i),smokez(i))
	      glbindtexture(gl_texture_2d,smoketext)
	      glcolor3f(0.8,0.8,0.8)
	      If tourelle=0 Then 
	        glrotatef(o1,0,0,1)
	        glrotatef(o2,0,1,0)
	      Else
	        glrotatef(to1+o1,0,0,1)
	        glrotatef(to2,0,1,0)
	      EndIf   	
	      If typesmoke(i)=0 Then 
	      	r=50+30*(time2-smoketime(i))
	      ElseIf typesmoke(i)=-1 Then 
	      	r=40+24*(time2-smoketime(i))
	      Else 
	      	If typesmoke(i)=1 Then 
	      		r=150+90*(time2-smoketime(i))
	      	Else 
	      		r=200+200*(time2-smoketime(i))
	      	EndIf
	      EndIf
	      gltexcarre3(r,r)
	      glpopmatrix
		EndIf
	Next
	glEnable GL_DEPTH_TEST
	For i=0 To nboom
		If time2<(boomtime(i)+3.4) Then
		   If time2<(boomtime(i)-100) Then boomtime(i)=time2-100 'if midnight
			gldisable(gl_texture_2d)
         glBlendFunc GL_SRC_alpha,GL_ONE_MINUS_SRC_ALPHA
	      glpushmatrix
	      gltranslatef(boomx(i),boomy(i),boomz(i))
	      glcolor4f(1,0.8,0.8, 0.3)'0.25)
	      dt=max(0.001,time2-boomtime(i))
	      r=75*(0.5+3*sqr(dt/2))*2
         'scale=(0.5+3*sqr((time0-aux)/2000))*2+(boomscale(i)-1)
	      glsphere(r*0.5,12,12)
	      glsphere(r*0.7,12,12)
	      glsphere(r,12,12)
	      glpopmatrix
	      glcolor4f(1,1,1, 1)
			glenable(gl_texture_2d)
		EndIf   
   Next i
	gldisable GL_BLEND
	glEnable GL_DEPTH_TEST
	For i=0 To nimpact
		If time2<(impacttime(i)+0.06) Then	'0.03		
		   If time2<(impacttime(i)-99) Then impacttime(i)=time2 'if midnight
	      /'glpushmatrix
	      gltranslatef(impactmx(i),impactmy(i),impactmz(i))
	      glbindtexture(gl_texture_2d,feutext)
	      'glcolor3f(0.85,0,0)
	      gltexsphere(impactmr(i),10,10)
	      glpopmatrix '/
	      drawimpact(i)
		EndIf
	Next
	For i=0 To ndebris
		If time2<(debristime(i)+5) Then	'2.5		
		   If time2<(debristime(i)-99) Then debristime(i)=time2 'if midnight
	      drawdebris(i)
		EndIf
	Next
tsmoke+=kfps*(0.5+Rnd)
If tsmoke>3 Then 
	tsmoke=0
EndIf
If avionvie<avionvie0 Then avionvie=max(0.0,avionvie+0.1*kfps)
If tsmoke=0 And avionsmoke>0.1 Then
	If avionvie>avionvie0*0.8 Then avionsmoke=0
	avionsmoke-=kfps
	addsmoke(avionx,aviony,avionz)
EndIf
End Sub
Sub drawMd2node(ByVal md2node As md2_node Ptr,ByVal glnormal As Integer=0)
Dim As Integer i  	
Dim As Single dn,dtime,dx,dy,dz,dist
If md2node->md2model<>0 Then
	dx=md2node->x-mx:dy=md2node->y-my:dz=md2node->z-mz
	dist=dx*dx+dy*dy'+dz*dz
   If (dist)<(gldistmax*gldistmax) And (md2node->z)>waterz+1 Then   	
     'rotavion2(md2node->x-mx,md2node->y-my)
     rotavion(dx,dy,dz)
     If x2>(max(Abs(z2),Abs(y2))-300) Then 	
        With *md2node
        If glnormal=0 Then gldisable(gl_lighting)
        glpushmatrix
        glTranslatef (.x,.y,.z)
        glRotatef (.rotz, 0.0, 0.0, 1.0)
        glRotatef (.roty, 0.0, 1.0, 0.0)
        If (Abs(.rotx)>1) Then glRotatef (.rotx, 1.0, 0.0, 0.0)
        glscalef  (.scalex/scalexy,.scaley/scalexy,.scalez)

        /' draw model '/
        'glsphere 10
        dtime=80*10/(0.01+.fps)
        dn=(time1-time0)/dtime
        .nframe+=dn+Rnd*0.001
        If .nframe>=.endframe Or .nframe<.startframe Then .nframe=.startframe

        'drawMd2 ((md2node))
        'drawMd2_glcmds((md2node))
        'drawMd2_inter ((md2node))
        'drawMd2_inter_glcmds(md2node)

        If (md2node->md2model->header.num_glcmds)=0 Then
          If md2node->md2model->header.num_frames>1 And dist<(3000*3000) Then 
        	   drawMd2_inter(md2node ,glnormal)
          Else
         	drawMd2(md2node ,glnormal)
          EndIf 
        Else 	
          If md2node->md2model->header.num_frames>1 And dist<(3000*3000) Then 
        	   drawMd2_inter_glcmds(md2node ,glnormal)
        	 Else 
        	   drawMd2_glcmds(md2node ,glnormal)
          EndIf 
        EndIf	
        
        End With  
        With md2node->joints 
        If .njoint>0 Then

        	For i=1 To .njoint
           glpushmatrix
           glTranslatef (.vxjoint(i),.vyjoint(i),.vzjoint(i))
           glulookat(0,0,0, .vxjoint2(i)-.vxjoint(i),.vyjoint2(i)-.vyjoint(i),.vzjoint2(i)-.vzjoint(i),_
                  .vxjoint3(i)-.vxjoint(i),.vyjoint3(i)-.vyjoint(i),.vzjoint3(i)-.vzjoint(i))
           If .subjoint(i)<>0 Then .subjoint(i)()
           glpopmatrix
        	Next i
        EndIf 
        End With
        glpopmatrix	
        glenable(gl_lighting)
     EndIf 
   EndIf   
EndIf 
End Sub
Dim Shared As uint ngrass=500,distgrass=500
Dim Shared As Single grassx(ngrass),grassy(ngrass),grassz(ngrass),grassrot(ngrass),grassrot0(ngrass)
Dim Shared As Single grassscalex(ngrass),grassscalez(ngrass),grasstype(ngrass),grasstx(ngrass)
Dim Shared As Single grasswind,grasswindo1,grassscalez2(ngrass)
Declare Function gettestroad(x As Single,y As Single)As Integer
'Declare Function gettestroadtree(x As Single,y As Single)As Integer
'Declare Function gettestnear0road(x As Single,y As Single,layer As Integer=0,inear0 As Integer=0)As Integer
Sub drawgrass
Dim As Integer i  	
Dim As Integer changegrass,ix,iy
Dim As Single x=30,y=20,tx=1,x0,x1,dtx=0.8,grasso1,aux
x1=x*0.5:x0=0-x1
    If Rnd<0.15*kfps Then
    	grasswind+=(Rnd-0.5)*2.5
    	grasswind=max(-10.0,min(10.0,grasswind))
    	grasswindo1+=(Rnd-0.5)*30
    	While grasswindo1<-180:grasswindo1+=360:Wend
    	While grasswindo1>180:grasswindo1-=360:Wend
    Else
    	grasswind=(1-min(0.8,0.15*kfps))*grasswind+1e-10
    EndIf
    For i=1 To ngrass
     changegrass=tupdategrass	
     While grassx(i)<mx-distgrass :grassx(i)+=distgrass*2:changegrass=1:Wend 
     While grassx(i)>mx+distgrass :grassx(i)-=distgrass*2:changegrass=1:Wend 	
     While grassy(i)<my-distgrass :grassy(i)+=distgrass*2:changegrass=1:Wend 
     While grassy(i)>my+distgrass :grassy(i)-=distgrass*2:changegrass=1:Wend 
     If changegrass=1 Then
     	 Var testroad=0
     	 If inearroad2<200 And thighway=0 Then 
     	 	testroad=gettestroad(grassx(i)+dmx0,grassy(i)+dmy0)
     	 Else
     	 	testroad=gettestnear0road(grassx(i)+dmx0,grassy(i)+dmy0)
     	 EndIf
     	 If testroad>=1 Then
     	 	grassz(i)=waterz-1
     	 ElseIf testairport(grassx(i),grassy(i),1000,100)=0 Then
     	 	grassz(i)=getterrainheight(grassx(i),grassy(i))	
     	 Else
     	 	grassz(i)=waterz-1
     	 EndIf
       ix=Int(grassx(i)/scalex+10000)-10000
       iy=Int(grassy(i)/scalex+10000)-10000
       ix=max2(0,min2(512,ix))
       iy=max2(0,min2(512,iy))
       aux=1-terraincolor(ix,iy).x
       'grassscalez2(i)=1.6*aux*grassscalez(i)
       grassscalez2(i)=0.95*aux*grassscalez(i)
     EndIf
 If grassz(i)>waterz Then 
  'rotavion2(grassx(i)-mx,grassy(i)-my)
  rotavion(grassx(i)-mx,grassy(i)-my,grassz(i)-mz)
  If x2>(max(Abs(y2),Abs(z2))-80) Then 	
     If igrass=2 Then 
     	 glbindtexture(gl_texture_2d,grasstext(1))	
     Else 	 
     	 glbindtexture(gl_texture_2d,grasstext(grasstype(i)))	
     EndIf
     glpushmatrix
     gltranslatef(grassx(i),grassy(i),grassz(i))
     glrotatef(grassrot(i),0,0,1)
     grasso1=grassrot(i)-grasswindo1+(Abs(grassx(i)-mx)+Abs(grassy(i)-my))*0.18
     While grasso1<-180:grasso1+=360:Wend
     While grasso1>180:grasso1-=360:Wend
     If grasso1>0 Then 
       glrotatef(grasswind,0,1,0)
     Else 
       glrotatef(-grasswind,0,1,0)
     EndIf
     glscalef(grassscalex(i),grassscalex(i),grassscalez2(i)) 
	  tx=grasstx(i)
	glbegin(gl_quads)
	glTexCoord2f(tx,0)
	glvertex3f(0,x0,0)
	gltexcoord2f(tx+dtx,0)
	glvertex3f(0,x1,0)
	glTexCoord2f(tx+dtx,1)
	glvertex3f(0,x1,y)
	gltexcoord2f(tx,1)
	glvertex3f(0,x0,y)
	glend()
     glpopmatrix
  EndIf
 EndIf  
    Next i 
End Sub
Sub drawhelice0
     glbindtexture(gl_texture_2d,helicetext)	
     glEnable GL_BLEND
     'glBlendFunc GL_SRC_color,GL_ONE_MINUS_SRC_color
     glBlendFunc GL_SRC_alpha,GL_ONE_MINUS_SRC_alpha
     helicerot0=helicerot0+(9+v)*1.35*kfps
     If helicerot0>10000 Then helicerot0-=10000
     glrotatef(helicerot0,1,0,0) 
     gltexcarre3(50,50)
     gldisable gl_blend
End Sub 
Sub drawhelice(ByVal i As Integer)
     glbindtexture(gl_texture_2d,helicetext)	
     glEnable GL_BLEND
     'glBlendFunc GL_SRC_color,GL_ONE_MINUS_SRC_color
     glBlendFunc GL_SRC_alpha,GL_ONE_MINUS_SRC_alpha
     airshiphelicerot(i)+=airshipv(i)*1.5
     If airshiphelicerot(i)>10000 Then airshiphelicerot(i)-=10000
     glrotatef(airshiphelicerot(i),1,0,0) 
     gltexcarre3(50,50)
     gldisable gl_blend
End Sub 
Sub drawhelice2(ByVal i As Integer)
     glbindtexture(gl_texture_2d,helicetext)	
     glEnable GL_BLEND
     'glBlendFunc GL_SRC_color,GL_ONE_MINUS_SRC_color
     glBlendFunc GL_SRC_alpha,GL_ONE_MINUS_SRC_alpha
     airshiphelicerot(i)+=airshipv(i)*1.5
     If airshiphelicerot(i)>10000 Then airshiphelicerot(i)-=10000
     glpushmatrix
     glrotatef(airshiphelicerot(i),1,0,0) 
     gltexcarre3(70,70)
     glpopmatrix
     gldisable gl_blend
End Sub 
/'Sub drawavion
If plane=0 Or car>0 Then Exit Sub
	If avionlist<>0 Then
		glcalllist(avionlist)
	Else
		avionlist=glgenlists(1)
		glnewlist avionlist,gl_compile
		loadobjsize("objects/c150.obj",@"",@"",94)
      glendlist
	EndIf	
End Sub '/
/'
Sub drawcorsair
If plane=0 Or car>0 Then Exit Sub
gldisable(gl_lighting)
glbindtexture(gl_texture_2d,corsairtext)
	If corsairlist<>0 Then
		glcalllist(corsairlist)
	Else
		corsairlist=glgenlists(1)
		glnewlist corsairlist,gl_compile
		loadobjsize("objects/f4u.obj",@"",@"",100)
      glendlist
	EndIf	
End Sub
Sub drawvg33
gldisable(gl_lighting)
glbindtexture(gl_texture_2d,vg33text)
	If vg33list<>0 Then
		glcalllist(vg33list)
	Else
		vg33list=glgenlists(1)
		glnewlist vg33list,gl_compile
		loadobjsize("objects/vg33lowpoly.obj",@"",@"",100)
      glendlist
	EndIf	
End Sub
Sub drawalphajet
gldisable(gl_lighting)
glbindtexture(gl_texture_2d,alphajettext)
	If alphajetlist<>0 Then
		glcalllist(alphajetlist)
	Else
		alphajetlist=glgenlists(1)
		glnewlist alphajetlist,gl_compile
		loadobjsize("objects/alphajet.obj",@"",@"",102)
      glendlist
	EndIf	
End Sub
Sub drawspitfire
glenable(gl_lighting)
glenable(gl_light1)
If icar=7 Then 
	glbindtexture(gl_texture_2d,spitfiretext)
Else 
	glbindtexture(gl_texture_2d,spitfiretext2)
EndIf
	If spitfirelist<>0 Then
		glcalllist(spitfirelist)
	Else
		spitfirelist=glgenlists(1)
		glnewlist spitfirelist,gl_compile
		loadobjsize("objects/spitfire_lowpoly2.obj",@"",@"",100)
      glendlist
	EndIf	
gldisable(gl_light1)
End Sub
Sub drawbf109
glenable(gl_lighting)
glenable(gl_light1)
glbindtexture(gl_texture_2d,bf109text)
	If bf109list<>0 Then
		glcalllist(bf109list)
	Else
		bf109list=glgenlists(1)
		glnewlist bf109list,gl_compile
		loadobjsize("objects/bf109.obj",@"",@"",100)
      glendlist
	EndIf	
gldisable(gl_light1)
End Sub'/
Sub drawp51d
glenable(gl_lighting)
glenable(gl_light3)
glbindtexture(gl_texture_2d,p51dtext)
	If p51dlist<>0 Then
		glcalllist(p51dlist)
	Else
		p51dlist=glgenlists(1)
		glnewlist p51dlist,gl_compile
		loadobjsize("objects/p51d.obj",@"",@"",100)
      glendlist
	EndIf	
gldisable(gl_light3)
If tdark=1 Then 
   If (Int(time2+0.5)Mod 2)=1 Then 
    gldisable gl_lighting
    gldisable gl_texture_2D
    glpushmatrix
    gltranslatef(0,99,-3)
    glcolor3f(1,0.1,0)
    Var dr=max(3.0,min(12.0,Abs(x2)/1000))
    glsphere(dr,4,4) 
    glcolor3f(0,1,0.1)
    gltranslatef(0,-198,0)
    glsphere(dr,4,4)
    glpopmatrix
    glenable gl_texture_2D
    glenable gl_lighting
    glcolor3f(1,1,1)
   EndIf 
EndIf    
End Sub
/'
Sub drawf14
glenable(gl_lighting)
glenable(gl_light1)
glbindtexture(gl_texture_2d,f14text)
	If f14list<>0 Then
		glcalllist(f14list)
	Else
		f14list=glgenlists(1)
		glnewlist f14list,gl_compile
		loadobjsize("objects/f14_2.obj",@"",@"",107)
      glendlist
	EndIf	
gldisable(gl_light1)
End Sub
Sub draweurofighter
glenable(gl_lighting)
glenable(gl_light1)
glbindtexture(gl_texture_2d,eurofightertext)
	If eurofighterlist<>0 Then
		glcalllist(eurofighterlist)
	Else
		eurofighterlist=glgenlists(1)
		glnewlist eurofighterlist,gl_compile
		loadobjsize("objects/eurofighter3.obj",@"",@"",107)
      glendlist
	EndIf	
gldisable(gl_light1)
End Sub
Sub drawfighter
glenable(gl_lighting)
glenable(gl_light1)
glbindtexture(gl_texture_2d,fightertext)
	If fighterlist<>0 Then
		glcalllist(fighterlist)
	Else
		fighterlist=glgenlists(1)
		glnewlist fighterlist,gl_compile
		loadobjsize("objects/fighter.obj",@"",@"",140)
      glendlist
	EndIf	
gldisable(gl_light1)
End Sub
Sub drawspaceship
glenable(gl_lighting)
glenable(gl_light1)
glbindtexture(gl_texture_2d,spaceshiptext)
	If spaceshiplist<>0 Then
		glcalllist(spaceshiplist)
	Else
		spaceshiplist=glgenlists(1)
		glnewlist spaceshiplist,gl_compile
		loadobjsize("objects/spaceship.obj",@"",@"",111)
      glendlist
	EndIf	
gldisable(gl_light1)
End Sub
'/
Sub drawzero
glenable(gl_lighting)
glenable(gl_light3)
'if icar=12 Then 
'	glbindtexture(gl_texture_2d,zero2text)
'Else 
	glbindtexture(gl_texture_2d,zerotext)
'EndIf
	If zerolist<>0 Then
		glcalllist(zerolist)
	Else
		zerolist=glgenlists(1)
		glnewlist zerolist,gl_compile
		loadobjsize("objects/zero1.obj",@"",@"",100)
      glendlist
	EndIf	
gldisable(gl_light3)	
End Sub
Sub drawc150
glenable(gl_lighting)
glenable(gl_light3)
If mz>mzsol00+80 And piste=0 Then gltranslatef(0,0,21)
'if icar=12 Then 
'	glbindtexture(gl_texture_2d,zero2text)
'Else 
	glbindtexture(gl_texture_2d,aviontext)
'EndIf
	If avionlist<>0 Then
		glcalllist(avionlist)
	Else
		avionlist=glgenlists(1)
		glnewlist avionlist,gl_compile
		loadobjsize("objects/c150.obj",@"",@"",94)
      glendlist
	EndIf	
gldisable(gl_light3)	
If tdark=1 Then 
   If (Int(time2+0.5)Mod 2)=1 Then 
    gldisable gl_lighting
    gldisable gl_texture_2D
    glpushmatrix
    gltranslatef(0,93,14)
    glcolor3f(1,0.1,0)
    Var dr=2.2'max(2.4,min(10.0,Abs(x2)/1200))
    glsphere(dr,4,4)
    glcolor3f(0,1,0.1)
    gltranslatef(0,-186,0)
    glsphere(dr,4,4)
    glpopmatrix
    glenable gl_texture_2D
    glenable gl_lighting
    glcolor3f(1,1,1)
   EndIf 
EndIf    
End Sub
Sub drawc150red
'If tdark=0 Then 
  glenable(gl_lighting)
'Else 
'  gldisable(gl_lighting)
'EndIf   
glenable(gl_light3)
'If mz>mzsol00+80 And piste=0 Then gltranslatef(0,0,21)
'if icar=12 Then 
'	glbindtexture(gl_texture_2d,zero2text)
'Else 
	glbindtexture(gl_texture_2d,avionredtext)
'EndIf
	If avionlist<>0 Then
		glcalllist(avionlist)
	Else
		avionlist=glgenlists(1)
		glnewlist avionlist,gl_compile
		loadobjsize("objects/c150.obj",@"",@"",94)
      glendlist
	EndIf	
gldisable(gl_light3)	
If tdark=1 Then 
   If (Int(time2+0.3)Mod 2)=1 Then 
    gldisable gl_lighting
    gldisable gl_texture_2D
    glpushmatrix
    gltranslatef(0,93,14)
    glcolor3f(1,0.1,0)
    Var dr=max(2.4,min(10.0,Abs(x2)/1200))
    glsphere(dr,4,4)
    glcolor3f(0,1,0.1)
    gltranslatef(0,-186,0)
    glsphere(dr,4,4)
    glpopmatrix
    glenable gl_texture_2D
    glenable gl_lighting
    glcolor3f(1,1,1)
   EndIf 
EndIf    
End Sub
Dim Shared As uint boeing737text
Sub draw737
glenable(gl_lighting)
glenable(gl_light3)
'If mz>mzsol00+80 And piste=0 Then gltranslatef(0,0,18)
gltranslatef(0,0,18)
'if icar=12 Then 
'	glbindtexture(gl_texture_2d,zero2text)
'Else 
	glbindtexture(gl_texture_2d,boeing737text)
'EndIf
	If boeing737list<>0 Then
		glcalllist(boeing737list)
	Else
		boeing737list=glgenlists(1)
		glnewlist boeing737list,gl_compile
		load3dssize("objects/737.3ds",@"",@"",100)
      glendlist
	EndIf	
gldisable(gl_light3)
If tdark=1 Then 	
   If (Int(time2+0.6)Mod 2)=1 Then 
    gldisable gl_texture_2D
    gldisable gl_lighting
    gltranslatef(-20,100,-16)
    glcolor3f(1,0.1,0)
    Var dr=3.0'max(3.0,min(12.5,Abs(x2)/1000))
    glsphere(dr,4,4)
    glcolor3f(0,1,0.1)
    gltranslatef(0,-200,0)
    glsphere(dr,4,4)
    glenable gl_texture_2D
    glcolor3f(1,1,1)
   EndIf 
EndIf    
End Sub
Sub draw737low
glenable(gl_lighting)
glenable(gl_light3)
'If mz>mzsol00+80 And piste=0 Then gltranslatef(0,0,18)
gltranslatef(0,0,18)
'if icar=12 Then 
'	glbindtexture(gl_texture_2d,zero2text)
'Else 
	glbindtexture(gl_texture_2d,boeing737text)
'EndIf
	If boeing737lowlist<>0 Then
		glcalllist(boeing737lowlist)
	Else
		boeing737lowlist=glgenlists(1)
		glnewlist boeing737lowlist,gl_compile
		load3dssize("objects/737lowpoly2.3ds",@"",@"",100)
      glendlist
	EndIf	
gldisable(gl_light3)	
End Sub
Dim Shared As uint spottext
Sub drawspot(px As single,py As single,pz As single,dr As Single,r As Single,g As Single,b As Single,a As Single)
If (Int(time2)Mod 2)=1 Then Exit sub
'glbindtexture(gl_texture_2d,spottext)
gldisable gl_texture_2D
glpushmatrix
gltranslatef(px,py,pz-dr*0.5)
'Var do1=diro1(px-mx,py-my)
'glrotatef(do1,0,0,1)
glcolor4f(r,g,b,a)
glsphere(dr,2,4)
'glEnable GL_BLEND
'glBlendFunc GL_src_alpha,GL_one_minus_src_alpha
'gltexcarre2(dr,dr*1.2)
glpopmatrix
glcolor4f(1,1,1,1)
'gldisable gl_blend 
glenable gl_texture_2D
End Sub
Dim Shared As Single boeingo1,boeingo2,boeingo3,boeingx0,boeingy0,boeingtx,boeingty,boeingx2
Dim Shared As Single boeingco1,boeingsi1,boeingzsol,boeingdz3000=3000
Sub drawboeing()
	Var dmax=30000.0
	'boeingx=mx+600+(1+Cos(Timer*3/30))*14000:boeingy=my:boeingz=mz+(boeingx-mx)*0.200
	'drawspot(mx+100,my,mz,1,0,1,0.1,1)
	'drawspot(mx+100,my+20,mz,1,1,0.1,0,1)
	boeingco1=Cos(boeingo1*degtorad)
	boeingsi1=Sin(boeingo1*degtorad)
	boeingx+=14*boeingco1*kfps
	boeingy+=14*boeingsi1*kfps
	If boeingx<mx-dmax Then boeingx=mx+dmax*0.9
	If boeingx>mx+dmax Then boeingx=mx-dmax*0.9
	If boeingy<my-dmax Then boeingy=my+dmax*0.9
	If boeingy>my+dmax Then boeingy=my-dmax*0.9
   If max(Abs(boeingx-boeingx0),Abs(boeingy-boeingy0))>300 Then
   	boeingx0=boeingx:boeingy0=boeingy
   	boeingo1+=(Rnd-0.5)*2
  	   'boeingo2=0
  	   'boeingo3=0
   EndIf 	
   'boeingtx=mx+cos1*3000:boeingty=my+sin1*3000
   'auxvar=max(Abs(boeingportx-mx),Abs(boeingporty-my))/dmax
   'auxvar2=(Abs(boeingportx)+Abs(boeingporty))
   'auxvar3=max(Abs(boeingx-mx),Abs(boeingy-my))/dmax
   'auxvar4=max(Abs(boeingtx-mx),Abs(boeingty-my))/dmax
   'auxtest=0.2
   If Abs(boeingportx)+Abs(boeingporty)>0.001 Then
   	If max(Abs(boeingportx-mx),Abs(boeingporty-my))>dmax*5 Then
   		boeingportx=0
   		boeingporty=0
   	Else 
   		boeingtx=boeingportx
   		boeingty=boeingporty
   	EndIf
   EndIf
   Var dist=max(Abs(boeingx-mx),Abs(boeingy-my))
   Var dist1=max(Abs(boeingz-mz),dist)
  	If (itime Mod 3)=0 Then
  		'auxvar=dist1:auxtest=0.2
      Var kvol=990.0/max(990.0,dist1)
      kvol=max(2.0,998*kvol*kvol)
  		mcisendstring("setaudio boeing volume to "+str(Int(kvol)),0,0,0)
  	EndIf
   If Abs(boeingtx)+Abs(boeingty)>0.001 Then
   		Var dxx=(boeingtx-boeingx)*boeingco1+(boeingty-boeingy)*boeingsi1
   		Var dyy=(boeingtx-boeingx)*boeingsi1-(boeingty-boeingy)*boeingco1
   		If dyy<-dxx*0.1 Then
   			boeingo3+=(30-boeingo3)*0.03*kfps:boeingo1+=0.3*kfps
   		ElseIf dyy>dxx*0.1 Then
   			boeingo3+=(-30-boeingo3)*0.03*kfps:boeingo1-=0.3*kfps
   		Else
   			boeingo3+=(0-boeingo3)*0.03*kfps
   		EndIf
   		If dxx>0 And dxx<7500 And boeingz>boeingzsol+max(210.0,dxx*0.44-300) Then
   			boeingo2+=(-20-boeingo2)*0.03*kfps:boeingdz3000=max(200.0,dxx*0.44-300)
   		ElseIf dxx<0 And dxx>-7500 And boeingz<boeingzsol+3000 Then 
   			boeingo2+=(20-boeingo2)*0.3*kfps:boeingdz3000=max(200.0,-dxx*0.44-300)	
   		ElseIf boeingdz3000<2990 Then 
   			boeingo2+=(20-boeingo2)*0.3*kfps
            boeingdz3000=min(3000.0,boeingdz3000+3*kfps)
   		Else
   			boeingo2+=(0-boeingo2)*0.3*kfps
   		EndIf
   		If dxx<-500 Then boeingtx=0:boeingty=0
   		If dist>dmax*0.45 Then 
   		  If max(Abs(boeingtx-mx),Abs(boeingty-my))>dmax Then boeingtx=0:boeingty=0
         EndIf 
   Else
   	boeingtx=mx+(Rnd-0.5)*dmax*1.7
   	boeingty=my+(Rnd-0.5)*dmax*1.7
   EndIf
   If Abs(boeingtx)+Abs(boeingty)<0.001 Then   	
   		boeingportx=0
   		boeingporty=0
   EndIf
   If boeingo1>360 Then boeingo1-=360
   If boeingo1<-360 Then boeingo1+=360
   boeingzsol=getterrainheight(boeingx,boeingy) 	
  	boeingz+=(max(mz-400-dist*0.3,boeingzsol+boeingdz3000)-boeingz)*0.03*kfps
  	'boeingo1=45
   rotavion(boeingx-mx,boeingy-my,boeingz-mz)
   boeingx2=x2
   If x2<0.9*max(Abs(y2),Abs(z2))-300 Then Exit Sub 
   glpushmatrix
   gltranslatef(boeingx,boeingy,boeingz)
   glrotatef(boeingo1,0,0,1)
   glrotatef(-boeingo2,0,1,0)
   glrotatef(-boeingo3,1,0,0)
   glscalef(4,4,5)
   draw737low()
   If (Int(time2)Mod 2)=1 Then 
    gldisable gl_texture_2D
    gldisable gl_lighting
    gltranslatef(-18,100,5)
    glcolor3f(1,0.1,0)
    Var dr=max(3.0,min(12.5,Abs(x2)/1000))
    glsphere(dr,4,4)
    glcolor3f(0,1,0.1)
    gltranslatef(0,-200,0)
    glsphere(dr,4,4)
    glenable gl_texture_2D
    glcolor3f(1,1,1)
   EndIf 
   glpopmatrix
End Sub
Dim Shared As uint ballontext,ballonlist
Sub drawballon
glenable(gl_lighting)
glenable(gl_light3)
'if icar=12 Then 
'	glbindtexture(gl_texture_2d,zero2text)
'Else 
	glbindtexture(gl_texture_2d,ballontext)
'EndIf
	If ballonlist<>0 Then
		glcalllist(ballonlist)
	Else
		ballonlist=glgenlists(1)
		glnewlist ballonlist,gl_compile
		load3dssize("objects/ballon.3ds",@"",@"",94.5)
      glendlist
	EndIf	
gldisable(gl_light3)	
End Sub
Dim Shared As uint coptertext,copterlist
Sub drawcopter
glenable(gl_lighting)
glenable(gl_light3)
If mz<mzsol00+mzh+4 Then gltranslatef(0,0,-mzh+4)
'if icar=12 Then 
'	glbindtexture(gl_texture_2d,zero2text)
'Else 
	glbindtexture(gl_texture_2d,coptertext)
'EndIf
	If copterlist<>0 Then
		glcalllist(copterlist)
	Else
		copterlist=glgenlists(1)
		glnewlist copterlist,gl_compile
		load3dssize("objects/copter.3ds",@"",@"",94.5)
      glendlist
	EndIf	
gldisable(gl_light3)	
End Sub
Dim Shared As uint coptercockpitlist 
Sub drawcoptercockpit
glenable(gl_lighting)
glenable(gl_light3)
glenable(gl_cull_face)
glcullface(gl_front)  
glenable gl_alpha_test
glAlphaFunc(gl_less,100/254)
Var cc=0.94*max(0.94,min(1.0,1+Cos(helicerot0*3.1416/50)))
If tdark=1 Then cc=cc/0.94
glcolor4f(cc,cc,cc,1)
'if icar=12 Then 
'	glbindtexture(gl_texture_2d,zero2text)
'Else 
	glbindtexture(gl_texture_2d,coptertext)
'EndIf
   glpushmatrix
   'var sc=0.25
   'gltranslatef(-32.5,-0.6,11)
   gltranslatef(-2,0,-5)
   glrotatef(-2.2,0,1,0)
   glrotatef(-cocko1*0.88-2,0,0,1)
   glrotatef(0.85*cocko2*(1-0.5*Abs(cocko1/60)),0,1,0)
	glscalef(1.1,1.1,1.1)
	If coptercockpitlist<>0 Then
		glcalllist(coptercockpitlist)
	Else
		coptercockpitlist=glgenlists(1)
		glnewlist coptercockpitlist,gl_compile
		load3dssize("objects/copter_cockpit.3ds",@"",@"",94.5)
      glendlist
	EndIf	
	glpopmatrix 
gldisable(gl_light3)	
gldisable(gl_cull_face)
gldisable gl_alpha_test
glcolor4f(1,1,1,1)
End Sub
/'
Sub drawzero2
glenable(gl_lighting)
glbindtexture(gl_texture_2d,zero2text)
	If zerolist<>0 Then
		glcalllist(zerolist)
	Else
		zerolist=glgenlists(1)
		glnewlist zerolist,gl_compile
		loadobjsize("objects/zero1.obj",@"",@"",100)
      glendlist
	EndIf	
End Sub
Sub drawb25
If plane=0 Or car>0 Then Exit Sub
glenable(gl_lighting)
glbindtexture(gl_texture_2d,b25text)
	If b25list<>0 Then
		glcalllist(b25list)
	Else
		b25list=glgenlists(1)
		glnewlist b25list,gl_compile
		loadobjsize("objects/b25_lowpoly.obj",@"",@"",250)
      glendlist
	EndIf	
End Sub
'/
Sub drawcockpit3
   glpushmatrix
   gltranslatef(mx,my,mz)
   glrotatef(o1,0,0,1)
   glrotatef(-o2,0,1,0)
   glrotatef(-o3,1,0,0)
   If typeavion<>15 Then glscalef(1,1,1.2)'1.325)
   'If typeavion=2 Then drawcorsair:gltranslatef(47,0,0)
  	'If typeavion=1 Then drawvg33:gltranslatef(50,0,0)
   'If typeavion=7 Then drawalphajet
   'If typeavion=3 Then drawspitfire:gltranslatef(50,0,0)
   'If typeavion=4 Then drawbf109:gltranslatef(50,0,0)
   'If typeavion=5 Then drawp51d:gltranslatef(62,0,0)
   'If typeavion=8 Then drawf14
   'If typeavion=9 Then draweurofighter
   'If typeavion=10 Then drawfighter
   'If typeavion=11 Then drawspaceship
   If typeavion=6 Then drawzero:gltranslatef(41,0,0)
   If typeavion=12 Then drawc150:gltranslatef(41,0,0)
   If typeavion=13 Then drawballon:gltranslatef(41,0,0)
   If typeavion=14 Then draw737:gltranslatef(41,0,0)
   If typeavion=15 Then drawcopter:gltranslatef(0,0,55):glrotatef(75,0,1,0):glscalef(2,2,2)
   If typeavion<7 Or typeavion=12 Or typeavion=15 Then 
   	drawhelice0
   EndIf
   glpopmatrix
If tsmoke=0 And vie<0.4*vie0 Then
	addsmoke(mx,my,mz)
EndIf
End Sub
Sub drawstation()
stationx=0:stationy=0
If orbit=1 Then 
	stationz=getterrainheight(stationx,stationy)+50000
Else
	stationz=0
EndIf
Dim As Single scale=1.59
tstation=0
If Abs(stationx-mx)<8000 And Abs(stationy-my)<8000 Then
	If Abs(stationz-mz)<8000 Then tstation=1
EndIf
rotavion(stationx-mx,stationy-my,stationz-mz)
If x2>(Abs(y2)-1200) And x2<150000 Then
If x2<18000 Then
	glenable(gl_lighting)
Else 
	gldisable(gl_lighting)
EndIf
glbindtexture(gl_texture_2d,buildingtext)
If stationvie>0 Then 
	glcolor3f( 100/255,1,1)
Else
	glcolor3f(1,0,0)
EndIf
glpushmatrix
gltranslatef(stationx,stationy,stationz)
gltexcylindre 70*scale,70*scale,150*scale,10,10
gldisk 0,70*scale,10,10
gltranslatef 0,0,150*scale
gldisk 0,70*scale,10,10
gltranslatef 0,0,-150*scale
glbindtexture(gl_texture_2d,building3text)	
gltexcylindre 375*scale,375*scale,40*scale,10,10
gltexcylindre 300*scale,300*scale,40*scale,10,10
gldisk 300*scale,375*scale,10,10
gltranslatef 0,0,40*scale
gldisk 300*scale,375*scale,10,10
If tstation=2 And (Int(Timer*1.5)Mod 3)>0 Then 
	glcolor3f(0,1,0)
	gldrawtext("[R]repair",110,15,1.2)
EndIf
glcolor3f(1,1,1)
glpopmatrix
If mz>=stationz And mz<=(stationz+150*scale) Then
	Var testcollide=0
	Var dxy=Sqr((stationx-mx)*(stationx-mx)+(stationy-my)*(stationy-my))
   If dxy<=(75*scale) Then testcollide=1
   If dxy>=(280*scale) And dxy<=(395*scale) And mz<=(stationz+40*scale) Then testcollide=1
   If testcollide=1 Then testcrash()
EndIf
EndIf 
End Sub 

/'[drawstation3]
call color 100,100,100,1
call pushmatrix
call translate 0-ox,oy,-90-oz
call cylindre 17,17,220
call popmatrix
call color 0,0,255,1
oz=oz-20
text$="building":gosub [selecttexture]
rboule=70:gosub [drawtexboule]
call color 100,200,200,1
oz=oz+150
rboule=50:gosub [drawboule]
call color 100,200,200,1
oz=oz-300
rboule=50:gosub [drawboule]
oz=oz+160
gosub [drawroue]
tx=400:ty=400:tz=40
return
'/

Sub initairship
Dim As Integer i
order=1
If order<4 Then torder=Timer+99999 Else torder=Timer+15
For i=1 To nship
	airshipx(i)=mx-i*1200+4000:airshipy(i)=my+i*1000-4000:airshipz(i)=mz+200.0 
Next
For i=1 To nship
  If planet=0 Then 
	Select Case 1'i
		Case 1,2
			typeship(i)=0
			airshipmove(i)=1
			airshipvie0(i)=300
		/'Case 3
			typeship(i)=4
			airshipmove(i)=0.59
			airshipvie0(i)=400'800
		Case 4,5,6
			typeship(i)=1
			airshipmove(i)=1
			airshipvie0(i)=300
		Case 7,8,9,10,15,16
			typeship(i)=2
			airshipmove(i)=1
			airshipvie0(i)=300
		Case 11,12,13,14,17,18
			typeship(i)=3
			airshipmove(i)=1
			airshipvie0(i)=300
		'/
		Case Else 
			typeship(i)=2
			airshipmove(i)=1
			airshipvie0(i)=300
	End Select
  Else
	Select Case i
		Case 1,2
			typeship(i)=2
			airshipmove(i)=1
			airshipvie0(i)=300
		Case 3
			typeship(i)=4
			airshipmove(i)=0.59
			airshipvie0(i)=400'800
		Case 4,5,6
			typeship(i)=2
			airshipmove(i)=1
			airshipvie0(i)=300
		Case 7,8,9,10,15,16
			typeship(i)=3
			airshipmove(i)=1
			airshipvie0(i)=300
		Case 11,12,13,14,17,18
			typeship(i)=3
			airshipmove(i)=1
			airshipvie0(i)=300
		Case Else 
			typeship(i)=2
			airshipmove(i)=1
			airshipvie0(i)=300
	End Select
  EndIf 	
Next
For i=1 To nship
	airshipv(i)=max(vcruise,v):setairship(i)=1:dturnairship(i)=0
   airshipvie(i)=airshipvie0(i)
Next
End Sub
Dim Shared As Single vcruisesave,airshipx2(nship),airshipzsol(nship)
Sub drawairship
Dim As Integer i  	
Dim As Single distmax2
distmax2=30000'distmax+30000
'gldisable(gl_lighting)
glenable(gl_normalize)
glenable(gl_texture_2d)
Var nship22=nship2
If plane=0 Or car>0 Then nship22=min2(6,nship2)
vcruisesave=vcruise
vcruise=max(30.0,vcruise*0.9732)
For i=1 To nship2
  'If airshipx(i)<-distmax Then airshipx(i)=-distmax:airshipo1(i)+=90:setairship(i)=1
  'If airshipx(i)>distmax Then airshipx(i)=distmax:airshipo1(i)+=90:setairship(i)=1
  'If airshipy(i)<-distmax Then airshipy(i)=-distmax:airshipo1(i)+=90:setairship(i)=1
  'If airshipy(i)>distmax Then airshipy(i)=distmax:airshipo1(i)+=90:setairship(i)=1
  While airshipx(i)<mx-distmax2:airshipx(i)+=2*distmax2:Wend
  While airshipx(i)>mx+distmax2:airshipx(i)-=2*distmax2:Wend 
  While airshipy(i)<my-distmax2:airshipy(i)+=2*distmax2:Wend 
  While airshipy(i)>my+distmax2:airshipy(i)-=2*distmax2:Wend 
  If pause=0 Then
  	  moveairship(i)
     airshipzsol(i)=airshipsol
  EndIf
  airshipz(i)=max(mz-5000,min(mz+5000,airshipz(i)))
  If i>nship22 Then Continue For 
  rotavion(airshipx(i)-mx,airshipy(i)-my,airshipz(i)-mz)
  airshipx2(i)=x2
  If x2>(Abs(y2)-250) And x2<30000 Then
     If airshipvie(i)>0 Then 
     	glcolor3f(1,1,1)	
     Else
      glcolor3f(1,0.5,0.5)	
     EndIf 
     glpushmatrix
     gltranslatef(airshipx(i),airshipy(i),airshipz(i))
     glrotatef(airshipo1(i),0,0,1)
     glrotatef(-airshipo2(i),0,1,0)
     glrotatef(-airshipo3(i),1,0,0)'+90,1,0,0)
     If scalexy>1.1 Then glscalef(1,1,scalexy)
     'If typeship(i)=0 Then
     	  'gltexsphere(40)
      If avion<>"737" Then
      	drawc150red:gltranslatef(41,0,0):drawhelice(i)
      Else 
         drawp51d:gltranslatef(62,0,0):drawhelice(i)
      EndIf
     'EndIf 
     /'If typeship(i)=0 Then drawvg33:gltranslatef(50,0,0):drawhelice(i)
     If typeship(i)=1 Then drawcorsair:gltranslatef(47,0,0):drawhelice(i)
     If typeship(i)=2 Then
     	  If typeavion=6 Then 
     	  	  drawvg33:gltranslatef(50,0,0):drawhelice(i)
     	  ElseIf typeavion=10 Then
     	  	  drawspaceship
     	  ElseIf typeavion=11 Then
     	  	  drawfighter
     	  Else 	  
     	  	  drawzero:gltranslatef(41,0,0):drawhelice(i)
     	  EndIf
     EndIf
     If typeship(i)=3 Then
     	  If typeavion=6 Then 
     	  	  drawcorsair:gltranslatef(47,0,0):drawhelice(i)
     	  ElseIf typeavion=10 Then
     	  	  drawspaceship
     	  ElseIf typeavion=11 Then
     	  	  drawfighter
     	  else 	  
     	  	  drawzero2:gltranslatef(41,0,0):drawhelice(i)
     	  EndIf
     EndIf 	  
     If typeship(i)=4 Then
     	  If planet=0 Then   
     	    drawb25:gltranslatef(100,71,0):drawhelice2(i)
     	    gltranslatef(0,-142,0):glrotatef(90,1,0,0):drawhelice2(i)
     	  Else
	       glpushmatrix:glscalef(2.5,3.5,2.5):drawspaceship:glpopmatrix
     	  EndIf 	
     EndIf
     If typeship(i)=5 Then drawalphajet
     If typeship(i)=6 Then drawspitfire:gltranslatef(50,0,0):drawhelice(i)
     If typeship(i)=7 Then drawbf109:gltranslatef(50,0,0):drawhelice(i)
     If typeship(i)=8 Then drawp51d:gltranslatef(62,0,0):drawhelice(i)
     If typeship(i)=9 Then drawf14
     If typeship(i)=11 Then draweurofighter
     If typeship(i)=12 Then drawfighter
     If typeship(i)=13 Then drawspaceship
     If typeship(i)=10 Then drawzero:gltranslatef(41,0,0):drawhelice(i)
     '/
     glpopmatrix
  EndIf 
  If airshipvie(i)<airshipvie0(i) And airshipvie(i)>0 Then airshipvie(i)+=0.003*kfps
  If tsmoke=0 And airshipsmoke(i)>0.1 Then
	  If airshipvie(i)>airshipvie0(i)*0.8 Then airshipsmoke(i)=0
	  airshipsmoke(i)-=kfps
	  addsmoke(airshipx(i),airshipy(i),airshipz(i))
  EndIf
Next i
glcolor3f(1,1,1)
vcruise=vcruisesave
End Sub
Sub drawvie
 	'gldisable(gl_lighting)
   gldisable gl_texture_2d
   gldisable gl_depth_test
  	glpushmatrix
 	glplacecursor(10,240)
 	glcolor3f(0,1,1)
   gllinewidth(10)
 	glligne(0,0,-0.02,5,0,-0.02)
 	If carb>0.2*carb0 Then'vie>0.2*vie0 Then
 		glcolor3f(0,0.89,0)
 	Else 
 		glcolor3f(0.89,0,0)
 	EndIf
 	'glligne(0,0,0, 5.0*max(0.0,vie)/vie0,0,0)
 	glligne(0,0,0, 5.0*max(0.0,carb)/carb0,0,0)
 	glpopmatrix
 	'glenable(gl_lighting)
   glenable gl_texture_2d
   glenable gl_depth_test	
End Sub
Dim Shared As Double tmort
Sub drawmort
Dim As Integer i,j,iboat
 gldisable GL_DEPTH_TEST
 gldisable gl_lighting 
 gldisable gl_texture_2d
 glEnable GL_BLEND
 glBlendFunc GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA
 glcolor4f(1,0.7,0,0.35)
 glpushmatrix
 glplacecursor(xmax/2,ymax/2)
 glcarre(50*xmax/1000)
 glpopmatrix
 glcolor4f(1,1,1,1)
 gldisable GL_BLEND
 glenable GL_DEPTH_TEST
 glenable gl_texture_2d
 If vie<0.1 Then
 	soundboom
 	guirefreshopenGL()
   if tmort<Timer And vie>(-200) And Rnd>0.1 And (Rnd>0.3 Or orbit=1 Or planet=0) _  
      Then Sleep 500:Exit Sub 
 	soundaah
 	Sleep  5000
 	vie=vie0
 	target=0
 	war=0
 	For iboat=1 To nboat2
 		boatvie(iboat)=boatvie0(iboat)
 		boatwar(iboat)=0
 		boattarget(iboat)=0
	  /' For j=0 To 3
		   tdegats(iboat,j)=0
	   Next
      vdegats(iboat)=0
	   For j=1 To nfire
		   timefire(j,iboat)=0
	   Next '/
 	Next
 	For i=1 To nship
 		airshipwar(i)=0
 		airshipvie(i)=airshipvie0(i)
 	Next
 	confirm "you are dead !","confirm",resp
   Sleep 500
 EndIf
End Sub
'Dim Shared As Single vm20,vm2,do222,o222,ko222=1,cos222,sin222
Dim Shared As Integer ibullet,nbullet,nbulletmax=10
Dim Shared As Integer xbullet(nbulletmax),ybullet(nbulletmax)
Dim Shared As Integer txbullet(nbulletmax),tybullet(nbulletmax)
Dim Shared As Double  tbullet
Sub drawbullet(jbullet As Integer)
Dim As Single x1,x0,y1,y0,tx,ty
x1=5:x0=-x1
y1=5:y0=-y1
tx=txbullet(jbullet)/2
ty=tybullet(jbullet)/3
	glbegin(gl_quads)
	glTexCoord2f(tx,ty)
	glvertex3f(x0,y0,0)
	gltexcoord2f(tx+0.5,ty)
	glvertex3f(x1,y0,0)
	glTexCoord2f(tx+0.5,ty+0.33)
	glvertex3f(x1,y1,0)
	gltexcoord2f(tx,ty+0.33)
	glvertex3f(x0,y1,0)
	glend()
End Sub
Sub addbullet()
ibullet+=1:If ibullet>nbulletmax Then ibullet=0
If nbullet<nbulletmax Then nbullet+=1
xbullet(ibullet)=50+(xmax-100)*Rnd
ybullet(ibullet)=50+(ymax-100)*Rnd
txbullet(ibullet)=Int(Rnd*2)
tybullet(ibullet)=Int(Rnd*3)
End Sub
Sub drawbullets()
Dim As Integer i,j,k
'If nbullet<1 Then For i=1 To 10:addbullet():next
If nbullet<1 Then Exit Sub 
j=ibullet
gldisable(gl_lighting)
glenable gl_alpha_test
glAlphaFunc(gl_less,10/254)
glbindtexture(gl_texture_2d,bullettext)
glcolor3f(1,1,1)
glpushmatrix
For i=1 To nbullet
  glplacecursor(xbullet(j),ybullet(j))
  drawbullet(j)
  j-=1:If j<0 Then j=nbulletmax
Next i   
glpopmatrix
gldisable gl_alpha_test
If Timer>(tbullet+0.07) Or Timer<(tbullet-99) Then 
	tbullet=Timer
	nbullet=max2(0,min2(nbulletmax,30*(vie0*0.48-vie)/vie0))
EndIf
End Sub
Dim Shared As Single treeheight=2
Sub setarbreh(ByVal i As Integer)
arbreh(i)=1.85+(Int((Abs(arbrex(i))+Abs(arbrey(i)))/5)And 3)*0.1
If arbreh(i)>2.12 Then arbreh(i)*=2.4'sequoia
Exit Sub 
Dim As Integer ix,iy,jx,jy,ix0,iy0
     If arbrez(i)<=waterz Then Exit Sub 
     Var h=treeheight
	  jx=Int((arbrex(i)+dmx0))'/scalex+512000)Mod 512
	  jy=Int((arbrey(i)+dmy0))'/scalex+512000)Mod 512
	  If mapauto=1 Then 
      ix0=max2(-100,min2(612,Int(arbrex(i)/scalex+10000)-10000+256))
      iy0=max2(-100,min2(612,Int(arbrey(i)/scalex+10000)-10000+256))
	   Var maptext=mapautotexture(ix0,iy0)
	   If maptext=maptexture5 Then
	  	  arbreh(i)=0.7:Exit Sub 
	   EndIf 
	   If maptext=maptexture4 Then
	  	  h*=0.75
	   EndIf 
	  EndIf
     Dim As Byte tforest
     tforest=forest(Int(128000+(jx)/12000) Mod 128, _ '/14000
                        Int(128000+(jy)/12000) Mod 128)                   
     If tforest=0 Then
     	If mz<(max(mzsol0,arbrez(i))+distarbre*0.132) Then
        h=1.0'treeheight2
        ix=arbrex(i)/scalex+256.1+ixsun
        iy=arbrey(i)/scalex+256.1+iysun
        If ix>0 And ix<512 And iy>0 And iy<512 Then
        	  terraincolor(ix,iy).y=min(1.0,terraincolory0(ix,iy) +0.5)
        EndIf
      EndIf 
     EndIf
     If tforest<>1 Or arbrez(i)<=(-60+dhmareemax)*scalez Then h=1.0
     arbreh(i)=h
End Sub
/'
Sub subinputavatar()
	myinput=guigettext("winavatar.input")
	printgui("winavatar.input","")
	'If Left(myinput,1)=">" Then myinput=Mid(myinput,2)
 	'myTTSspeak(myinput,1)
If Right(myinput,2)=Chr(13)+Chr(10) Then 'crlf Then
	myinput=Left(myinput,Len(myinput)-2)
EndIf
myinput=Trim(myinput)
Var myinput2=LCase(formatname(myinput)) 	
Dim As Integer i,imap2=0
For i=1 To 100
	If myinput2="fly to "+LCase(formatname(addon(i))) Then imap2=i:Exit For
	If myinput2="go to "+LCase(formatname(addon(i))) Then imap2=i:Exit For
	If myinput2="go "+LCase(formatname(addon(i))) Then imap2=i:Exit For
	If myinput2=LCase(formatname(addon(i))) Then imap2=i:Exit For
Next
If imap2>4 Then
	confirmspeak("go to "+formatname(addon(imap2))+" ?","confirm",resp)
	If resp="yes" Then 
		selectcomboindex("win.map",imap2-4)
		submap()
	EndIf
	guisetfocus("winavatar.input")
	Exit Sub 	
EndIf
If myinput="r" Or myinput="R" Or myinput="repair" Then
	   If (piste=1 Or tstation=2) And Abs(v)<0.1 Then
	   	myTTSspeak("repair and refuel , ok",1)
	   	vie=vie0:carb=carb0
	   EndIf
ElseIf myinput="t" Or myinput="T" Then tourelle=(tourelle+1)Mod 2   
ElseIf myinput="/vars" Then
	'Print aimllistvars()
'   Print "botname="+aimlgetvar("botname")
'   Print "name="+aimlgetvar("name")
'   Print "botmaster="+aimlgetvar("botmaster")
'   Print "botgender="+aimlgetvar("botgender")
'   Print "topic="+aimlgetvar("topic")	
ElseIf myinput="/reset" Or myinput="reset" Then
	confirm("reset avatar vars ?","confirm",resp)
	If resp="yes" Then aimlresetvars()
	guisetfocus("winavatar.input")
Else 
   msg=AIMLsendmyinput(myinput)
   'Print msg
   If Trim(msg)="" Then 
		Select Case Int(Rnd*3)
			Case 0
				msg="> I have no answer to this"
			Case 1
				msg="> I dont know what to say"
			Case Else
				msg="> That's too complicated for me" 
		End Select
	EndIf 	
   myvoicemsg=formatvoice(msg)
   myvoicemsg=Left(myvoicemsg,800)
   If LCase(myinput)<>"exit" And LCase(myinput)<>"/exit" Then 
      myTTSspeak(myvoicemsg,SVSFlagsAsync+SVSFPurgeBeforeSpeak)
   Else
      myTTSspeak(myvoicemsg,SVSFlagsAsync+SVSFPurgeBeforeSpeak)
      guisetfocus("win.graph")
      tavatar=0
   EndIf 
EndIf 
If myname<>formatname(aimlgetvar("name")) Then 
  myname=formatname(aimlgetvar("name"))
  If myname<>"" And FileExists("data\"+myname+"("+avatar+").txt") Then
	  aimlloadvars("data\"+myname+"("+avatar+").txt")
	  aimlsetvar("name",myname)
	  aimlsavevars("data\"+myname+"("+avatar+").txt")
  EndIf 
EndIf
End Sub
Sub testavatar()
        If tstation=2 And tsphere=1 And tavatar=1 Then
        	If planet=1 And orbit=0 Then 
        		setavatar(smx0+smy0)
        	Else 	
        		setavatar(dmx0+dmy0)
        	EndIf
         glLoadIdentity ()
         scaleavatar=ymax/(600-129)
         Var sc=scaleavatar
	      glplacecursor(xmax-100*sc,200*sc,-40)
         drawavatar()
         'tavatar=1
         If tavatar0<>tavatar Then
         	tavatar0=tavatar
         	edittext("winavatar.input","",@subinputavatar,1,1,183*sc,20,es_multiline+WS_VSCROLL)
            openwindow("winavatar","avatar",winx+xmax-200*sc,winy+340*sc,184*sc,21,WS_popupwindow, _   
                        WS_EX_TOPMOST)' Or WS_EX_TRANSPARENT)         	
            winavatarinputh=getguih("winavatar.input")
            guisetfocush(winavatarinputh)
            aimlloadvars()
            myname=formatname(aimlgetvar("name"))
            If myname<>"" And FileExists("data\"+myname+"("+avatar+").txt") Then
	            aimlloadvars("data\"+myname+"("+avatar+").txt")
            EndIf
         	aimlsetvar("botname",avatar)
         	printgui("winavatar.input","")
         EndIf
         If getfocus()=winavatarinputh Then avatarinput=1 Else avatarinput=0
        Else
        	tavatar=0
        	If tavatar0<>tavatar Then
        		tavatar0=tavatar
        		guiclosewindow("winavatar")
            aimlsavevars()
            myname=formatname(aimlgetvar("name"))
            If myname<>"" And avatar<>"" Then
	            aimlsavevars("data\"+myname+"("+avatar+").txt")
            EndIf
        	EndIf
     		avatarinput=0
        EndIf  	
End Sub
'/
Sub addtownhouse(iarbre As Integer)
Dim As Integer i
If taddtownhouse=1 Then Exit Sub 
If itown4>=ntown4 Then Exit Sub
If arbrez(iarbre)<waterz Then Exit Sub  	
If itown4>0 Then 
 For i=1 To itown4
	If Abs(arbrehousex(iarbre)-townhousex(i))<40 Then
   	If Abs(arbrehousey(iarbre)-townhousey(i))<40 Then
   		Exit Sub
   	EndIf
	EndIf
 Next i
EndIf  
itown4+=1
townhousex(itown4)=arbrehousex(iarbre)
townhousey(itown4)=arbrehousey(iarbre)
townhousedx(itown4)=arbrehousedx(iarbre)
townhousedy(itown4)=arbrehousedy(iarbre)
townhouseh(itown4)=arbrehouseh(iarbre)
townhouseo1(itown4)=arbrehouseo1(iarbre)
townhousez(itown4)=arbrez(iarbre)
townhousevie(itown4)=200+townhouseh(itown4)*0.5
townhousetype(itown4)=0
townhouser(itown4)=1
townhouseg(itown4)=1
townhouseb(itown4)=1
End Sub
Sub addtownhouse2(xx As Single,yy As Single,dx As Single,dy As Single,h As Single,do1 As Single,r as Single=1,g As Single=1,b As Single=1,itype As Integer=0)
Dim As Integer i
Dim As Single x,y,z
If taddtownhouse2=1 Then Exit Sub
x=xx:y=yy:If ((x+dmx0+y+dmy0)Mod 8)=0 Then x+=1.1
z=getterrainheight(x,y)-9
z=min(z,getterrainheight(x+dx,y+dy)-9)
z=min(z,getterrainheight(x-dx,y+dy)-9)
z=min(z,getterrainheight(x+dx,y-dy)-9)
z=min(z,getterrainheight(x-dx,y-dy)-9)
If z<=waterz Then Exit Sub  	
If itown4>0 Then 
 For i=1 To itown4
	If Abs(x-townhousex(i))<dx Then'40+dx
   	If Abs(y-townhousey(i))<dy Then'40+dy
   		townhousex(i)=x
   		townhousey(i)=y
   		townhousez(i)=z
   		townhousedx(i)=dx
   		townhousedy(i)=dy
   		townhouseh(i)=h
         townhousevie(i)=200+townhouseh(i)*0.5
   		townhouser(i)=r
   		townhouseg(i)=g
   		townhouseb(i)=b
   		Exit Sub
   	EndIf
	EndIf
 Next i
EndIf  
If itown4>=ntown4 Then Exit Sub
itown4+=1
townhousex(itown4)=x
townhousey(itown4)=y
townhousedx(itown4)=dx
townhousedy(itown4)=dy
townhouseh(itown4)=h
townhouseo1(itown4)=do1
townhousez(itown4)=z
townhousevie(itown4)=200+townhouseh(itown4)*0.5
townhousetype(itown4)=itype
townhouser(itown4)=r
townhouseg(itown4)=g
townhouseb(itown4)=b
End Sub
Sub addtownhouse1(xx As Single,yy As Single,dx As Single,dy As Single,h As Single,do1 As Single,r as Single=1,g As Single=1,b As Single=1)
addtownhouse2(xx,yy,dx,dy,h,do1,r,g,b,1)
End Sub
'Dim Shared As Integer topview=0
Sub subtopview()
'If plane>0 Then Exit Sub 
topview=(topview+1)Mod 3
If topview=1 Then
	plane=0
EndIf
Sleep 300
End Sub
#Include "townobject.bi"
#Include "worldobject.bi"
Dim Shared As Double timecollide,timecollide2,timecollide22,timebridge,timecollide222
Dim Shared As Integer mytestroad,mytestroad2,mytestroad0,mytestroad3',mytestbridge
Dim Shared As Single dyautopilot,dxautopilot,co1autopilot,si1autopilot,d60road=60,d05road
Dim Shared As glfloat winz2(8000),winztop(8000)
Dim Shared As gldouble winposx(400),winposy(400),winposz(400)
Dim Shared As glUByte  winstenciltop(8000)
Dim Shared As Double dtimecollide,timeztop
Dim Shared As Integer testposx,testztop,teststenciltop
Dim Shared As Single mouseo1,mouseo2
Sub subteststenciltop()
Dim As Integer i	
'glPixelStorei(GL_UNPACK_ALIGNMENT, 1)
glReadPixels(1, ymax-2, xmax-2, 1, GL_STENCIL_INDEX, GL_UNSIGNED_BYTE, @winstenciltop(0))
teststenciltop=0
For i=1 To xmax-2 Step 10
	If winstenciltop(i)=0 Then teststenciltop+=1':Exit For 	
Next
If teststenciltop<xmax*0.02 Then teststenciltop=0
auxvar6=teststenciltop+0.1:auxtest=0.8
End Sub
Dim Shared As Double timepiste,timercollide,timelayeroff
Sub testcollideforward()
tpiste=piste
If (tlayer0)<-0.4 then exit Sub
If time2<timercollide+0.1 Then Exit Sub
timercollide=time2
Var kfps0=kfps,kfps=3.0
Var tkeyup=0:If guitestkey(vk_up) Or testjoy2 Then tkeyup=1
If Abs(tlayer)>0.4 Or Abs(mz-mzsol00)>30 Then timelayeroff=time2
If fps<10 Or (Abs(tlayer)>0.4 Or (time2<timelayeroff+6)) Then
	If time2>timeinit+30 Then
		If tkeyup Then Exit Sub 
	EndIf
	kfps=kfps0
EndIf
If tautopilot>0 Then
 If piste>0 Then
	timepiste=time2
	If time2>timeinit+30 Then
		If tkeyup Then Exit Sub 
	EndIf
 ElseIf time2>timepiste+5 Then
	If time2>timeinit+30 Then
		If tkeyup Then Exit Sub 
	EndIf
 EndIf 
EndIf
'If time2<dtimecollide Then Exit Sub
'dtimecollide=time2+0.1
If Abs(mouseo1)+Abs(mouseo2)>1 Then Exit Sub
If plane=0 And Abs(o2)>30 Then Exit Sub  
testposx=0
Var t4=4.0
If testztop=1 Then timecollide=0
If plane>0 Then t4=3.0*(16+Abs(v))/(8+Abs(v)) 
'If tautopilot=1 Then timebridge=0
If (time2>timecollide2+2 And time2>timecollide22+2)Then timecollide222=time2
If time2>timecollide222+12 Then timecollide=time2
If time2<timecollide+t4 Or v<-0.0001 Then
  	If mytestroad2=0 Or time2>timeautopilot+2 Then
  		If tkeyup Then Exit Sub
  	Else 
  		timecollide=min(time2-t4*0.75,timecollide)
  	EndIf
EndIf
Dim As Integer i,j,k
Dim As integer viewport(4)
Dim As GLdouble modelview(16) 
Dim As GLdouble projection(16)
Dim As glfloat winX, winY, winZ,winz3,winz4
Dim as GLdouble posX, posY, posZ, posx2,posy2,posz2, posx3,posy3,posz3, posx4,posy4,posz4
Dim As GLdouble posx20,posy20,posz20,posx21,posy21,posz21
glGetDoublev( GL_MODELVIEW_MATRIX, @modelview(0) )
glGetDoublev( GL_PROJECTION_MATRIX, @projection(0) )
glGetIntegerv( GL_VIEWPORT, @viewport(0) )
Var ky=0.19*ymax
'If tautopilot=1 Then
	ky=0.07*ymax
'EndIf
winx = xmax*0.5
winy = ymax*0.5+ky
glReadPixels( winx,winy, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winZ )
gluUnProject(winX,winY,winz,@modelview(0),@projection(0),@viewport(0),@posX,@posY,@posZ)   
'glpushmatrix
'gltranslatef(posx,posy,posz)
'gltexsphere 20
'glpopmatrix
Var dist=((posx-mx)*cos1*cos2+(posy-my)*sin1*cos2+(posz-mz)*sin2)
'Var dist=sqr((posx-mx)*(posx-mx)+(posy-my)*(posy-my)+(posz-mz)*(posz-mz))
If dist<100 And dist>0 Then
	If plane>0 And car=0 Then
		timecollide=time2
      testcrash():Exit Sub 
	EndIf
EndIf
If plane>0 And car=0 Then
   winx = xmax*0.5
   winy = ymax*0.35
   glReadPixels( winx,winy, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winZ )
   gluUnProject(winX,winY,winz,@modelview(0),@projection(0),@viewport(0),@posX,@posY,@posZ) 
   If max(Abs(posx-mx),Abs(posy-my))+Abs(posz-mz)<80 Then
   	'auxvar=mz-posz-mzh:auxtest=0.2:auxvar2=vcruise
   	posz+=mzh
   	If Abs(v)<2.5 And vcruise<10 Then v=0:mx=mx0:my=my0:mz=mz0
   	If piste=0 Then
   	 mz=max(mz0,posz)
   	 mz1=max(mz0,posz)
   	EndIf  
   	'mzsol00=max(mzsol00,posz-0.4)
   	'mzsol0=max(mzsol0,posz-0.4)
   EndIf
	Exit Sub 
EndIf
If plane>0 And (mytestroad2=0 And time2<timecollide2+1 And time2<timecollide22+1)And time2>timebridge+2 Then 
 	If (tkeyup) Then Exit Sub 
EndIf
'subteststenciltop()
If cos3<0.5 Then Exit Sub 
Var dist1=(posx-mx)*cos1+(posy-my)*sin1
winx = xmax/2
winy = ymax*0.59'0.4+ky
Var d150=150,d300=300
'Var d150=80,d300=160
If winx>150 Then d150=Int(winx):d300=d150+d150
glReadPixels( winx-d150,winy, d300+1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winZ2(0) )
gluUnProject(winX,winY,winz2(d150),@modelview(0),@projection(0),@viewport(0),@posX2,@posY2,@posZ2)   
'gluUnProject(winX-100,winY,winz2(d150-100),@modelview(0),@projection(0),@viewport(0),@posX20,@posY20,@posZ20)   
'gluUnProject(winX+100,winY,winz2(d150+100),@modelview(0),@projection(0),@viewport(0),@posX21,@posY21,@posZ21)
gluUnProject(winX-150,winY,winz2(d150-150),@modelview(0),@projection(0),@viewport(0),@posX20,@posY20,@posZ20)   
gluUnProject(winX+150,winY,winz2(d150+150),@modelview(0),@projection(0),@viewport(0),@posX21,@posY21,@posZ21)
If ntownnear>2 Then 
Dim As gldouble winposx0,winposy0,winposz0   
For i=1 To 80-1
 gluUnProject(winX*i/40,winY,winz2(Int(d150*i/40)),@modelview(0),@projection(0),@viewport(0),@winposX0,@winposY0,@winposZ0)   	
 rotavionpx(winposx0-mx,winposy0-my,winposz0-mz)
 Var dxx=px2+Abs(py2)
 Var i1=0:i1=max2(0,min2(40,20+20*0.8*py2/max(0.1,px2)))
 winposx(i1)=(px2)*1.1+200':winposy(i1)=py2:winposz(i1)=pz2
 If dxx>1400 Or px2>900 Then'px2>5*Abs(py2) Or dxx>700 Then
 	winposx(i1)=99999
 Else
 	testposx=1
 EndIf
Next
EndIf 'ntownnear
Var dist2=(posx2-mx)*cos1+(posy2-my)*sin1,tdist20=0
If plane>0 Or testztop=1 Then
 'mx+=kfps*0.095*cos1:my+=kfps*0.095*sin1	
 Var dist20=(posx20-mx)*cos1+(posy20-my)*sin1
 Var dist21=(posx21-mx)*cos1+(posy21-my)*sin1
 var d55=55.0
 if plane=0 then d55=30.0
 If dist20<d55 And dist21>d55 Then
 	Var kkfps=3.0
 	mx=mx0-8*cos1*kkfps:my=my0-8*sin1*kkfps
 	mx+=kkfps*9.5*sin1:my-=kkfps*9.5*cos1
 	If tkeyup Then
 		timecollide2=time2
 	Else	
   	o1-=0.3*kkfps 
 	EndIf
 	v*=0.8
	vmx2=v*cos1:vmy2=v*sin1
 	'If mytestroad2=0 Then o1-=0.1*kfps Else o1-=0.03*kfps
 	tdist20=1
 ElseIf dist21<d55 And dist20>d55 Then
 	Var kkfps=3.0
 	mx=mx0-8*cos1*kkfps:my=my0-8*sin1*kkfps
 	mx-=kkfps*9.5*sin1:my+=kkfps*9.5*cos1
 	If tkeyup Then
 		timecollide22=time2
 	Else 	
    	o1+=0.3*kkfps
 	EndIf
 	v*=0.8
	vmx2=v*cos1:vmy2=v*sin1
 	'If mytestroad2=0 Then o1+=0.1*kfps Else o1+=0.03*kfps
 	tdist20=1
 'elseif (dist20<50 Or dist21<50)And testztop=1 and(tautopilot=0 Or plane=0) Then 
 elseif (dist20<d55-5 Or dist21<d55-5)And(tkeyup=0) Then 
 	'If Rnd<0.5 Then
 		mx=mx0-cos1*(8+v)*kfps:my=my0-sin1*(8+v)*kfps
 	'EndIf
 	tdist20=1
 	If tautopilot=0 And plane>0 Then
 		If Abs(tlayer)<0.4 And mytestbridge=0 Then testcrash()
 	EndIf
 EndIf 	
EndIf 
'If plane>0 And car>0 And time2>timeautopilot+4 And time2>timebridge+2 And tautopilot=1 Then Exit sub
If tdist20=0 Then 
 winx = xmax/2
 winy = ymax*0.98
 glReadPixels( 1,winy, xmax-2, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winztop(0) )
 If time2>timeztop+5 Then testztop=0
 If testztop=0 Then 
  For i=1 To xmax-2 Step 10
	If winztop(i)>0.9 Then testztop=1:timeztop=time2:Exit For 
  Next
 EndIf   
 If testztop=0 Then
   mz11=max(mzsol00,min(mz-kfps,mz11))
   If plane=0 Or car>0 Then mz1=mz11
   Exit Sub
 Else
 	timecollide=0
 	timecollide2=0
 	timecollide22=0
 EndIf 
endif
winx = xmax/2
winy = ymax*0.1+ky+10
glReadPixels( winx,winy, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winZ3 )
gluUnProject(winX,winY,winz3,@modelview(0),@projection(0),@viewport(0),@posX3,@posY3,@posZ3)   
Var dist3=(posx3-mx)*cos1+(posy3-my)*sin1
winx = xmax/2
winy = 2+ky+7
glReadPixels( winx,winy, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winZ4 )
gluUnProject(winX,winY,winz4,@modelview(0),@projection(0),@viewport(0),@posX4,@posY4,@posZ4)   
Var dist4=(posx4-mx)*cos1+(posy4-my)*sin1
If dist4>800 Then Exit Sub 
If dist4<2000 Then
	If posz4<=getterrainheight(posx4,posy4)+5 Then Exit Sub 
EndIf
If time2>timebridge+4 And dist2<dist1+5 and dist3<dist1+5 And dist2>dist1-1 And dist1<70 Then
   if rnd<0.62 Then timecollide=time2
   If time2<timecollide+t4 Or v<-0.0001 Then
      If plane>0 And (mytestroad2=0) Then timecollide=time2
   	Exit Sub
   EndIf
   If mytestroad2=0 And testztop=0 Then timecollide=time2
   mx=mx0
	my=my0
	If plane>0 Then mx-=40*cos1:my-=40*sin1
	If v>4 Then v*=0.5:vmx2*=0.5:vmy2*=0.5:vmz2*=0.5
	mz1=mz:mz11=mz:Exit Sub 
EndIf 
If time2>timebridge+2 And (time2<timecollide+t4 Or v<-0.0001) Then
  	Exit Sub
EndIf
If (dist2>dist1+1)And (dist1<340.170) Then
	If posz>(mz-0.35*mzh) And time2>timebridge+3 Then
		mz=max(mz+kfps*7.7,posz+0.35*mzh)
		timebridge=time2
	ElseIf posz<(mz-0.35*mzh-20) Then 
		mz-=kfps*0.7
	EndIf
	o2=-Atn((posz-posz2)/(dist2-dist1))-20
	mz1=mz:mz11=mz
	Exit Sub 
EndIf
If (dist4>dist3+1)And (dist3<300) Then
	If posz3>(mz-0.75*mzh) And time2>timebridge+3 Then
		mz=max(mz+kfps*0.7,posz3+0.75*mzh)
		timebridge=time2
	ElseIf posz3<(mz-0.75*mzh-20) Then 
		mz-=kfps*0.7
	EndIf
	o2=-Atn((posz3-posz4)/(dist4-dist3))-20
	mz1=mz:mz11=mz
	Exit Sub 
EndIf
Var do2=0.0
If dist3>120 And (dist4<dist3-1 Or dist4>500) Then do2-=kfps*0.7
If dist2<400 And dist3<240 And dist1>dist2+1 Then do2+=kfps*0.7
If Abs(do2)>0.001 Then o2+=do2 
If posz4>(mz-mzh*0.9) And dist4<dist3-1 And (dist2<dist1-1 Or dist2>300) Then 
 If dist4<dist3-1 And dist4<300 Then 
	If posz4>(mz-0.5*mzh) Then
		mz=max(posz4+0.5*mzh,mz+kfps)
		timebridge=time2
	EndIf
	mz1=mz:mz11=mz
 EndIf 	
ElseIf dist4<700 Then
 	If posz4<(mz-0.9*mzh) Then mz=max(posz4+0.9*mzh,mz-kfps*0.7)
 	mz1=mz:mz11=mz
EndIf
mz11=max(mzsol00,min(mz-kfps,mz11))
If plane=0 Or car>0 Then mz1=mz11
End Sub
Sub testcollideforward0()
Dim As integer viewport(4)
Dim As GLdouble modelview(16) 
Dim As GLdouble projection(16)
Dim As glfloat winX, winY, winZ,winz2,winz3
Dim as GLdouble posX, posY, posZ, posx2,posy2,posz2, posx3,posy3,posz3
glGetDoublev( GL_MODELVIEW_MATRIX, @modelview(0) )
glGetDoublev( GL_PROJECTION_MATRIX, @projection(0) )
glGetIntegerv( GL_VIEWPORT, @viewport(0) )
winx = xmax/2
winy = ymax/2
glReadPixels( winx,winy, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winZ )
gluUnProject(winX,winY,winz,@modelview(0),@projection(0),@viewport(0),@posX,@posY,@posZ)   
'glpushmatrix
'gltranslatef(posx,posy,posz)
'gltexsphere 20
'glpopmatrix
'Var dist=((posx-mx)*cos1*cos2+(posy-my)*sin1*cos2+(posz-mz)*sin2)
Var dist=sqr((posx-mx)*(posx-mx)+(posy-my)*(posy-my)+(posz-mz)*(posz-mz))
If dist<100 And dist>0 Then
	If plane>0 And car=0 Then testcrash():Exit Sub 
	'If dist<10 Then
	'   mx-=cos1*kfps*9
	'   my-=sin1*kfps*9
	'	mz1=mz:mz11=mz
	'	Exit Sub
	'EndIf
EndIf
If cos3<0.7 Then Exit Sub 
winx = xmax/2
winy = 2
glReadPixels( winx,winy, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winZ2 )
gluUnProject(winX,winY,winz2,@modelview(0),@projection(0),@viewport(0),@posX2,@posY2,@posZ2)   
Var dist2=sqr((posx2-mx)*(posx2-mx)+(posy2-my)*(posy2-my)+(posz2-mz)*(posz2-mz))
winx = xmax/2
winy = ymax*0.25
glReadPixels( winx,winy, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, @winZ3 )
gluUnProject(winX,winY,winz3,@modelview(0),@projection(0),@viewport(0),@posX3,@posY3,@posZ3)   
Var dist3=sqr((posx3-mx)*(posx3-mx)+(posy3-my)*(posy3-my)+(posz3-mz)*(posz3-mz))
Var dist1=dist*(0.99-Abs(sin2)),dist11=dist1
If sin2<-0.07 Then dist1+=0.05:dist11=(dist*3+dist11)/4
If dist2<dist and dist3<dist And dist2>dist11*0.6 And dist3>dist11*0.8 And dist<70 Then
   mx=mx0
	my=my0
	mz1=mz:mz11=mz:Exit Sub 
EndIf
If (winz3<winz2 Or posz3<(posz2-40+mz-mzh)/2)And (dist2<300 And dist3<300) Then
	If max(posz2,posz3)>(mz-0.45*mzh) Then
		Var pz=max(posz2,posz3)
		mz=max(mz+kfps*0.7,pz+0.45*mzh)
	ElseIf max(posz2,posz3)<(mz-0.45*mzh-30) Then 
		mz-=kfps*0.7
	EndIf
	mz1=mz:mz11=mz
	Exit Sub 
EndIf
If posz2>(mz-mzh*0.97) Then 
 If winz2<winz And dist2>0 And dist2<150 And dist2<dist1 Then 
	If posz2>(mz-0.45*mzh) Then mz=max(posz2+0.45*mzh,mz+kfps*0.7)
	mz1=mz:mz11=mz
 ElseIf dist2<150 Then
 	If posz2<(mz-0.5*mzh-30) Then mz-=kfps*0.7
 	mz1=mz:mz11=mz
 EndIf 
EndIf
End Sub 
Dim Shared As Integer volant0=-999
Sub setrangeGL(ByVal dist As Single=0)
If dist<=1700 Then 
    'If volant<>volant0 Then
    	 volant0=volant
       If thelene=1 Then
       	 glsetrange(4.0,130000.0)
       ElseIf volant=4 Or (volant=2 And typeavion=12) Then
	       'glsetrange(3.3,2*170000.0)    
	       glsetrange(2.0,2*140000.0)
       ElseIf volant=2 And typeavion=15 Then       
	       glsetrange(14.0,2*140000.0)    
       ElseIf volant=1 Then 
	       glsetrange(18.0,2*170000.0)
       Elseif volant=2 Then 
	       glsetrange(28.0,2*170000.0)
       Else
	       glsetrange(36.0,2*170000.0)
       EndIf
    'EndIf 	
ElseIf thelene=1 Then  
	glsetrange(7.0,2*170000.0)
Else 
	glsetrange(36.0,2*170000.0)
EndIf
End Sub     
Declare Sub drawaeroways()
Declare Sub drawtest()
Declare Sub drawcitynear()
Dim Shared As UByte testroadrr,testroadgg,testroadbb
Dim Shared As Single do1autopilot0
const as integer nshadowtree=100
Dim Shared As Integer ishadowtree,shadowiarbre(nshadowtree)
Dim Shared As Single arbrezshadow(narbre),arbredo2shadow(narbre),arbredo3shadow(narbre),arbrezshadow3(narbre)
Dim Shared As Integer shadowtreetype(nshadowtree)
Dim Shared As Single shadowtreex(nshadowtree),shadowtreey(nshadowtree),shadowtreez(nshadowtree)
Dim Shared As Single shadowtreeo1(nshadowtree),shadowtreeo2(nshadowtree),shadowtreeo3(nshadowtree)
Dim Shared As Single shadowtreez0(nshadowtree),shadowtreez1(nshadowtree)
Declare Sub drawshadowtree()
Declare Sub drawshadowtree2()
Sub addshadowtree(iarbre As Integer)
	If ishadowtree<nshadowtree Then
		ishadowtree+=1
		shadowiarbre(ishadowtree)=iarbre
	EndIf
End Sub
Sub addshadowtree2(x As Single,y As Single,z As Single,treetype As integer)
Dim As Integer i,j,k
If ishadowtree2>=nshadowtree Then Exit Sub 
ishadowtree2+=1
i=ishadowtree2
shadowtreetype(i)=treetype
shadowtreex(i)=x:shadowtreey(i)=y:shadowtreez(i)=z
Var z0=getterrainheight(x,y)
Var z1=getterrainheight(x+30*dxshadow,y+30*dyshadow)
Var z2=getterrainheight(x-30*dyshadow,y+30*dxshadow)
'shadowtreeo1(i)=o1shadow
shadowtreeo2(i)=diro1(30*dxyshadow,z1-z0)
shadowtreeo3(i)=diro1(30*dxyshadow,z2-z0)
shadowtreez0(i)=z0
shadowtreez1(i)=z1
End Sub
Dim Shared As Integer tupdatearbres(narbre),tbusharbre(narbre)
Sub drawarbres()
Dim As Integer i,j,k
    If mz>(mzsol0+9000) Then Exit sub 	
    glenable(gl_texture_2d)
    'gldisable(gl_normalize)
    If tdark=0 Then 
    	gldisable(gl_lighting)
    Else
    	glenable(gl_lighting)
    EndIf
    glenable gl_alpha_test
    glAlphaFunc(gl_less,10/254)
    ntree=0
    ishadowtree=0
    Var tflower=0
    Var mois=Month(Now)
    If (wtempmin>7 And wtempmin<23)Or(mois>2 And mois<6)Or(mois>9 And mois<12) Then
    	If (mois<7 And lat>0)Or(mois>=7 And lat<0) Then
    		tflower=1
    	Else
    		tflower=2'autumn
    	EndIf
    EndIf
    For i=1 To narbre2
     Var changearbre=tupdatearbre
     distarbre=distarbre0:If i>8000 Then distarbre+=distarbre0	
     While arbrex(i)<mx-distarbre :arbrex(i)+=distarbre*1.999:changearbre=1:Wend 
     While arbrex(i)>mx+distarbre :arbrex(i)-=distarbre*1.999:changearbre=1:Wend 	
     While arbrey(i)<my-distarbre :arbrey(i)+=distarbre*1.999:changearbre=1:Wend 
     While arbrey(i)>my+distarbre :arbrey(i)-=distarbre*1.999:changearbre=1:Wend 
     If changearbre>=1 Then
     	  Var test=0'testtown(i)
     	  tbusharbre(i)=0 
     	  If test>0 Then
  	  	  	  arbretype(i)=10
     	  	  If test=1 Then
     	  	  	  arbrez(i)=getterrainheight(arbrehousex(i),arbrehousey(i))
     	  	  	  addtownhouse(i)
     	  	  Else
     	  	  	  arbrez(i)=-99999
     	  	  EndIf
     	  ElseIf changearbre=2 And arbrez(i)<-900000 Then
     	  	  arbrez(i)=-999999
     	  Else
     	  	Var testroadtree=gettestroadtree(arbrex(i)+dmx0,arbrey(i)+dmy0)
     	  	If testroadtree>=1 Then
     	  	  arbrez(i)=-99999
     	  	ElseIf (i And 3)<>0 And testroadtree=0 Then'forest if testroadtree=-1
     	  	  arbrez(i)=-99999	
     	   Else'If testairport(arbrex(i),arbrey(i))=0 Then
     	     If testroadtree=-2 Then tbusharbre(i)=1+(i And 1)
     	  	  arbrez(i)=getterrainheight(arbrex(i),arbrey(i))
     	  	  arbrezshadow(i)=getterrainheight(arbrex(i)+dxshadow*30,arbrey(i)+dyshadow*30)
     	  	  arbredo2shadow(i)=diro1(30*dxyshadow,arbrezshadow(i)-arbrez(i))
     	  	  arbrezshadow3(i)=getterrainheight(arbrex(i)-dyshadow*30,arbrey(i)+dxshadow*30)
     	  	  arbredo3shadow(i)=diro1(30*dxyshadow,arbrezshadow3(i)-arbrez(i))
     	  	  setarbreh(i)
     	  	  arbretype(i)=arbretype0(i)
     	  	  tupdatearbres(i)=0  
     	  	  'Var arbrezi=(arbrez(i))
     	  	  'If arbrezi>zwater+1900 And Rnd<0.3 Then arbretype(i)=7'pine
     	  	  'If arbrezi>zwater+2500 And Rnd<0.3 Then arbretype(i)=7
     	  	  'If arbrezi>zwater+3200 And Rnd<0.3 Then arbretype(i)=7
     	  'Else
     	  '	  arbrez(i)=-999999'waterz-1
     	   EndIf  
     	  EndIf
     EndIf
     If arbrez(i)>-99990 And tupdatearbres(i)<1 Then
      'If Abs(arbrex(i)-mx)-distnearroad<14*kfps Or Abs(arbrey(i)-my)-distnearroad<14*kfps Then
      If Abs(arbrex(i)-mx)<distnearroad Then
       If Abs(arbrey(i)-my)<distnearroad Then
        tupdatearbres(i)+=1
     	  If gettestnearroad(arbrex(i),arbrey(i))=1 Then
     	  	  arbrez(i)=-999999
     	  EndIf
     	 EndIf  
      EndIf
     EndIf  
     If arbrez(i)>-99990 And tupdatearbres(i)<2 Then
     	 var d200=200.0:if mz>mzsol00+100 then d200=400
       If Abs(arbrex(i)-mx)<d200 Then
      	If Abs(arbrey(i)-my)<d200 Then
            tupdatearbres(i)+=2
      		If gettestnear0road(arbrex(i),arbrey(i))>0 Then
      			arbrez(i)=-999999
      		EndIf
      	EndIf
       EndIf 
     EndIf
  If arbrez(i)>min(40000.0,waterz) And mz<(mzsol0+9000) And arbretype(i)<>9 Then 
   'rotavion2(arbrex(i)-mx,arbrey(i)-my)
   If arbretype(i)=10 Then Continue For  
   rotavion(arbrex(i)-mx,arbrey(i)-my,arbrez(i)-mz)
   If x2>-400 And x2<1200 Then addshadowtree(i)
   If x2>1700 And x2<1800 And taddsauterelle=1 Then
   	addsauterelle(arbrex(i),arbrey(i),arbrez(i),i)
   EndIf
   	/'If x2>(0.9*max(Abs(y2),Abs(z2))-arbrehouseh(i)-100) Then
         gldisable gl_alpha_test
         glcolor3f(1,1,1)
   		glpushmatrix
   		gltranslatef(arbrehousex(i),arbrehousey(i),arbrez(i))
   		glrotatef(arbrehouseo1(i),0,0,1)
   		drawbuilding2(arbrehouseh(i)*0.4,arbrehousedx(i)*0.6,arbrehousedy(i)*0.6)
   		glpopmatrix
   	EndIf '/
   Var h150=150:If arbreh(i)>2.3 Then h150=490'sequoia  	
   If x2>(Abs(y2)-h150) Then
    If scaleview<0.9 Then
       If x2>1000 Then Continue For   
    Else	
    	ntree+=1
    EndIf
    If x2>(Abs(z2)-h150) Then
     glenable gl_alpha_test
     If arbreh(i)>2.3 Then 'sequoia
     	 glbindtexture(gl_texture_2d,arbresequoiatext)        
     ElseIf tflower=0 Or arbretype(i)<5 Or ((i Mod 3)=1) Then
     	 If tbusharbre(i)=0 Then
     	 	glbindtexture(gl_texture_2d,arbretext(arbretype(i)))
     	 Else
     	 	glbindtexture(gl_texture_2d,buissontext(2+tbusharbre(i)))
     	 EndIf
     ElseIf arbretype(i)<6 And tflower=2 Then
     	 glbindtexture(gl_texture_2d,arbreautumn2text)
     ElseIf tflower=2 Then
     	 glbindtexture(gl_texture_2d,arbreautumntext)
     ElseIf arbretype(i)<6 Then
     	 glbindtexture(gl_texture_2d,arbreflower2text)
     Else 	 	
     	 glbindtexture(gl_texture_2d,arbreflowertext)	
     EndIf
     glpushmatrix
     gltranslatef(arbrex(i),arbrey(i),arbrez(i))
     glrotatef(arbrerot(i),0,0,1)
     Var h=arbreh(i)
     If h>2.3 Then 'sequoia
     	glscalef(arbrescalex(i)*h*0.5/scalexy,arbrescalex(i)*h*0.5/scalexy,arbrescalez(i)*h) 	
     Else 
     	glscalef(arbrescalex(i)*h/scalexy,arbrescalex(i)*h/scalexy,arbrescalez(i)*h) 	
     EndIf
     drawarbre
     glpopmatrix
    EndIf  
   EndIf  
  EndIf    
    Next i
    glenable gl_alpha_test
    glscalef(1,1,1)
    For i=1 To nbuisson
     Var changebuisson=tupdatearbre	
     While buissonx(i)<mx-distbuisson :buissonx(i)+=distbuisson*1.9999:changebuisson=1:Wend 
     While buissonx(i)>mx+distbuisson :buissonx(i)-=distbuisson*1.9999:changebuisson=1:Wend 	
     While buissony(i)<my-distbuisson :buissony(i)+=distbuisson*1.9999:changebuisson=1:Wend 
     While buissony(i)>my+distbuisson :buissony(i)-=distbuisson*1.9999:changebuisson=1:Wend 
     If changebuisson>=1 Then
        'If testairport(buissonx(i),buissony(i),1000,110)=0 Then
     	  If gettestroadtree(buissonx(i)+dmx0,buissony(i)+dmy0)>=1 Then
     	  	  buissonz(i)=-99999
     	  ElseIf gettestnearroad(buissonx(i)+dmx0,buissony(i)+dmy0)=0 Then
     	     buissonz(i)=getterrainheight(buissonx(i),buissony(i))
     	  Else
     	     buissonz(i)=-99999'waterz-1
        EndIf
     EndIf
  If buissonz(i)>waterz And mz<(mzsol0+9000) Then    
   'rotavion2(buissonx(i)-mx,buissony(i)-my)
   rotavion(buissonx(i)-mx,buissony(i)-my,buissonz(i)-mz)
   If x2>(Abs(y2)-80) Then 	
    If scaleview<0.9 Then
       If x2>1000 Then Continue For   
    EndIf
    If x2>(Abs(z2)-80) Then  
     glbindtexture(gl_texture_2d,buissontext(buissontype(i)))	
     glpushmatrix
     gltranslatef(buissonx(i),buissony(i),buissonz(i))
     glrotatef(buissonrot(i),0,0,1)
     If scalexy>1.1 Then glscalef(1/scalexy,1/scalexy,1) 
     drawbuisson
     glpopmatrix
    EndIf
   EndIf  
  EndIf    
    Next i
    'drawshadowtree2()
    gldisable(gl_lighting)
End Sub
Sub drawshadowtree()
If tshadow=0 Or ishadowtree=0 Then Exit Sub
Dim As Integer i,j,k
glenable gl_alpha_test
glAlphaFunc(gl_less,100/254)
glenable gl_texture_2D
glcolor4f(1,1,1,1)
'glEnable GL_BLEND
'glBlendFunc GL_zero,GL_src_ALPHA
Dim As Single auxy,auxz,scale=2
auxy=68*scale:auxz=70*scale
Var do1sun=o1shadow'diro1(dxshadow,dyshadow)
'auxvar6=ishadowtree:auxtest=1
For j=1 To ishadowtree
	  i=shadowiarbre(j)
     If tbusharbre(i)=0 Then
     	glbindtexture(gl_texture_2d,arbretext(arbretype(i)))
     Else 		
     	glbindtexture(gl_texture_2d,buissontext(2+tbusharbre(i)))
     EndIf
     glpushmatrix
     gltranslatef(arbrex(i),arbrey(i),arbrez(i)+9+max(0.0,(arbrezshadow(i)-arbrez(i))*0.3))
     Var h=arbreh(i)
     Var auxyy=auxy*arbrescalex(i)*h/scalexy
     Var auxzz=auxz*arbrescalez(i)*h*min(2.0,dxyshadow/max(0.001,Abs(dzshadow)))
     'Var dr=auxyy*0.7
     Var do1=diro1(arbrex(i)-20*cos1-mx,arbrey(i)-20*sin1-my)
     Var do2=arbredo2shadow(i)'diro1(50*dxyshadow,arbrezshadow(i)-arbrez(i))
     Var do3=arbredo3shadow(i)
       'glrotatef(do1,0,0,1)
       'glrotatef(90,1,0,0)
       /'gltranslatef(dr*0.5,0,0)
       glpushmatrix
       glrotatef(do1sun+90-do1,0,1,0)
       gltexcarre2 auxyy,auxzz
       glpopmatrix
       glpushmatrix
       gltranslatef(-dr,0,0)
       glrotatef(do1sun+90-do1,0,1,0)
       gltexcarre2 auxyy,auxzz
       glpopmatrix
       gltranslatef(-dr*0.5,0,0)'/
       'glrotatef(do1sun+90-do1,0,1,0)
       'glrotatef(90,0,0,1)
       'glrotatef(do2,0,1,0)
       'glrotatef(do3,0,0,1)
       If tnightshadow=1 Then
         glrotatef(do1,0,0,1)
       Else	
       	glrotatef(do1sun,0,0,1)
       EndIf
       glrotatef(90-do2,0,1,0)
       glrotatef(do3,0,0,1)
       If h>2.3 Then 'sequoia
       	gltexcarre2 auxyy*0.7,auxzz       
       Else 
       	gltexcarre2 auxyy,auxzz       
       EndIf
     glpopmatrix
Next j
gldisable gl_alpha_test
gldisable gl_blend
End Sub
Sub drawshadowtree2()
If tshadow=0 Or ishadowtree2=0 Then Exit Sub
Dim As Integer i,j,k
glenable gl_alpha_test
glAlphaFunc(gl_less,100/254)
glenable gl_texture_2D
glcolor4f(1,1,1,1)
'glEnable GL_BLEND
'glBlendFunc GL_zero,GL_src_ALPHA
Dim As Single auxy,auxz,scale=2
auxy=68*scale:auxz=70*scale
Var do1sun=o1shadow'diro1(dxshadow,dyshadow)
'auxvar6=ishadowtree2:auxtest=1
Var sc=0.6
Var auxyy=auxy*sc
Var auxzz=auxz*sc*min(2.0,dxyshadow/max(0.001,Abs(dzshadow)))
For i=1 To ishadowtree2
     glbindtexture(gl_texture_2d,arbretext(shadowtreetype(i)))	
     glpushmatrix
     gltranslatef(shadowtreex(i),shadowtreey(i),shadowtreez(i)+3+max(0.0,(shadowtreez1(i)-shadowtreez0(i))*0.3))
     'Var dr=auxyy*0.7
     Var do1=diro1(shadowtreex(i)-mx-cos1*20,shadowtreey(i)-my-sin1*20)
     Var do2=shadowtreeo2(i)
     Var do3=shadowtreeo3(i)
       'glrotatef(do1,0,0,1)
       'glrotatef(90,1,0,0)
       /'gltranslatef(dr*0.5,0,0)
       glpushmatrix
       glrotatef(do1sun+90-do1,0,1,0)
       gltexcarre2 auxyy,auxzz
       glpopmatrix
       glpushmatrix
       gltranslatef(-dr,0,0)
       glrotatef(do1sun+90-do1,0,1,0)
       gltexcarre2 auxyy,auxzz
       glpopmatrix
       gltranslatef(-dr*0.5,0,0)'/
       'glrotatef(do1sun+90-do1,0,1,0)
       'glrotatef(90,0,0,1)
       If tnightshadow=1 Then
         glrotatef(do1,0,0,1)
       Else	
       	glrotatef(do1sun,0,0,1)
       EndIf
       glrotatef(90-do2,0,1,0)
       glrotatef(do3,0,0,1)
       gltexcarre2 auxyy,auxzz       
     glpopmatrix
Next i
gldisable gl_alpha_test
gldisable gl_blend
End Sub
Sub drawcows()
Dim As Integer i,j,k
    'glscalef(1,1,1)
    Var changecow=0
    For i=1 To ncow
     changecow=tupdatecow	
     While cowx(i)<mx-distcow :cowx(i)+=distcow*2:changecow=1:Wend 
     While cowx(i)>mx+distcow :cowx(i)-=distcow*2:changecow=1:Wend 	
     While cowy(i)<my-distcow :cowy(i)+=distcow*2:changecow=1:Wend 
     While cowy(i)>my+distcow :cowy(i)-=distcow*2:changecow=1:Wend 
     If changecow=1 Then
     	  If gettestroadtree(cowx(i)+dmx0,cowy(i)+dmy0)=4 Then
     	     cowz(i)=getterrainheight(cowx(i),cowy(i))
        Else
     	     cowz(i)=-99999
        EndIf
     EndIf
     If cowz(i)>-99990 Then 
      If Abs(cowx(i)-mx)-distnearroad<14*kfps Or Abs(cowy(i)-my)-distnearroad<14*kfps Then
     	  If gettestnearroad(cowx(i),cowy(i))=1 Then
     	  	  cowz(i)=-999999
     	  EndIf
      EndIf 
     EndIf
  If cowz(i)>waterz And mz<(mzsol0+9000) Then    
   'rotavion2(cowx(i)-mx,cowy(i)-my)
   rotavion(cowx(i)-mx,cowy(i)-my,cowz(i)-mz)
   If x2>(Abs(y2)-80) Then 	
    If scaleview<0.9 Then
       If x2>1000 Then Continue For   
    EndIf
    If x2>(Abs(z2)-80) Then  
     If x2<100 Then soundcow()
     glbindtexture(gl_texture_2d,cowtext)	
     glpushmatrix
     gltranslatef(cowx(i),cowy(i),cowz(i))
     glrotatef(cowo1(i),0,0,1)
     If cowlist<>0 Then glcalllist cowlist
     glpopmatrix
    EndIf
   EndIf  
  EndIf    
    Next i
End Sub
Declare Sub drawshadow()
Dim Shared As Single to1save,to2save
Sub subtourelleretro()
	If tourelle=0 Then Exit Sub
	confirm("set tourelle view as retro view ?","confirm",resp)
	If resp="yes" Then
		retroto1=to1:retroto2=to2
		tourelle=0:tretroviseur=1
	EndIf
End Sub
Sub displayback(tdraw As integer=1)
    glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT)'  Or GL_STENCIL_BUFFER_BIT)
    glLoadIdentity ()
    glscalef(-1,1,1)

    Var yhlayer0=yh:If time2<timeinit+20 Then tlayer0=tlayer00:tlayer=tlayer00
    If tlayer0>0.6 Then yh+=80
    If tlayer0<-0.6 Then yh-=100

      to1save=to1:to2save=to2
      If Abs(retroto1)>0.00001 And tourelle=0 Then
      	to1=retroto1:to2=retroto2
      EndIf
    	to2=max2(-89,min2(89,to2))
    	While to1<-180:to1+=360:Wend
    	While to1>180:to1-=360:wend
    	tcos1=Cos((to1+o1)*degtorad):tsin1=Sin((to1+o1)*degtorad)
    	var aux=to2+o2*Cos(to1*degtorad)
    	tcos2=Cos(aux*degtorad):tsin2=Sin(aux*degtorad)
    	tcos3=1.0:tsin3=0.0
      tdx=tcos1*tcos2:tdy=tsin1*tcos2:tdz=tsin2   	
      glulookat(mx,my,mz+yh,mx+tdx*1000,my+tdy*1000,mz+tdz*1000+yh, -tsin3*tsin1,tsin3*tcos1,tcos3)    	

      yh=yhlayer0
      
    'gltranslatef(mx,my,mz+yh)
    'glscalef(2,2,2)
    'gltranslatef(-mx,-my,-mz-yh)
    scaleview=0.3'0.3
    setrangeGL(4000)
    If tdraw=0 Then Exit Sub
    'getlockterrain()
   If mapdisplay<4 Then  
    If iciel<=8 Or planet=1 or tsphere=1 Then
    	drawciel
    Else 
      gldisable(GL_FOG)				
      glpushmatrix
      gldisable(gl_lighting)
      glbindtexture(GL_TEXTURE_2D,skydometext)
      gltranslatef(0.9*mx,0.9*my,0)
      o1sky-=Rnd*0.0159
      glrotatef(o1sky,0,0,1)
      'glcolor3f(1,1,1)
      glcolor3f ksoleil, ksoleil, min(1.0,2.0*ksoleil)
      'gltexsphere(49000,12,12)
      'drawskydome(49000*distscale,12,12)'49000,12,12)
      drawskydome(max(100000.0,49000*distscale),12,12)'49000,12,12)
      glpopmatrix
      glEnable GL_BLEND
      glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_color
      drawsunset
      'If heure<6 or heure>20 Then
      '  drawstars
      'EndIf  
      gldisable gl_blend
    EndIf
    drawsun
    If planet=0 And (mz-mzsol0)<1400 Then drawclouds
    If ifog>0 And planet=0 And tdark=0 Then
    	glEnable(GL_FOG)
    Else
    	gldisable(gl_fog)
    EndIf
   EndIf 
    scalexy=1:scalexyh=1
    /'If plane=0 Or car>0 Then
    	gltranslatef(mx,my,mz+yh)
    	scalexy=1
    	scalexyh=1
    	glscalef(scalexy,scalexy,1)
    	'scalexy=1
    	gltranslatef(-mx,-my,-mz-yh)
    EndIf '/
    drawsol
    If planet=0 And (mz-mzsol0)>=1400 Then
    	gldisable gl_fog
    	drawclouds
      If ifog>0 And tdark=0 Then glEnable(GL_FOG)
    EndIf
    glcolor3f(1,1,1)
    glenable(gl_texture_2d)
            
    drawtowns()
    tupdatetown=0
    If testworld=0 Then
    	drawtownobjects()
    EndIf
    If testworld=1 Then
    	getlocktown2(0)
    	If topentown=1 Then drawbridges():drawfuel()
    	If tinittown0>0 Then tinittown00=Timer+8
    	If timer>tinittown00 Then
    		drawworldobjects()
    		drawaeroways()
    	ElseIf Timer>tinittown00-4 Then
    		tinittown00=0
    		'xweb1=xweb-999990
    	EndIf 
    	freelocktown(0)
    EndIf
    
    drawballoon()
    drawboeing()
    
    drawarbres()
    tupdatearbre=0
    drawcows()
    tupdatecow=0
    drawrocs()
    tupdateroc=0
    
    'setrangeGL(0)
    
    gldisable(gl_lighting)
    glenable gl_texture_2d
    drawncars()
    drawladys()
    tupdatelady=0
    
    'drawshadow()
    drawrain()
    'freelockterrain()
    to1=to1save:to2=to2save            	
End Sub
Declare Sub resetmxy0()
Declare Sub testresetmz0()
Dim Shared As String treetype 
Dim shared as double tmxmove,tupdate,dtweb=0,ddtweb
dim shared as single avgv,avgmx,avgmy,mxmove,mymove,o1move,avgdo1,avgo10,tkzoom=0,mzbridge=-999999
Dim Shared As Single o333,cos333,sin333,do333,o100
dim shared as double timehelp,timelayer0
Dim Shared As Integer tfootmove
declare sub drawhelp()
Sub display ()
Dim As Single x,y,z,aux,r,g,b
Dim As Integer changearbre,changebuisson,changehouse,changehouse2,changedome
Dim As Integer i,j,k,test
	
If time2<timeinit+10 Then Exit sub

	 scaleview=1
    trepair=0
    setrangeGL(4000)
    If pause=0 And mapdisplay=0 Then moveavion
    'avionx=0:aviony=0:avionz=10:aviono1=30:aviono2=-20:aviono3=40
    If plane>0 And car>0 And guitestactivekey=1 And mapdisplay=0 Then
       If guitestkey(vk_z) Or guitestkey(vk_w) Then dyh0=min2(10,dyh0+1):guinotice "car height="+Str(dyh0)
       If guitestkey(vk_s) Then dyh0=max2(0,dyh0-1):guinotice "car height="+Str(dyh0)
    EndIf	
    
    testcorrectterrain()
    If Abs(prop)<0.1 And plane>0 And car>0 Then v=max(0.0,v-(0.06+v*0.02)*kfps)
    If prop>999 Then v=max(prop/1000.0,v)
    
If car>=1 And plane>0 And suspension>0.01 Then 'suspensions 
 vm20=vm2
 vm2=vmx2*cos1+vmy2*sin1
 'o2+=(vm2-vm20)*8*suspension/(0.02+kfps/2)'*5*
 o2+=(vm2-vm20)*8*suspension/(0.02+kfps/2)'*5*
 do222+=(o2-o222)*0.08*kfps-0.035*do222*kfps*ko222 '0.04*kfps-0.062*
 o222+=do222*0.3*kfps
 do333+=(o3-o333)*0.08*kfps-0.04*do333*kfps*ko222 '0.04*kfps-0.062*
 o333+=do333*0.3*kfps
Else
 vm20=vm2
 vm2=vmx2*cos1+vmy2*sin1
 o222=o2
 o333=o3
EndIf 
o222=max(-85.0,min(85.0,o222)) 
cos222+=(Cos(o222*degtorad)-cos222)*0.5:sin222=Sin(o222*degtorad)
o333=max(-85.0,min(85.0,o333)) 
cos333+=(Cos(o333*degtorad)-cos333)*0.5:sin333=Sin(o333*degtorad)
If v>4 Then suspension=max(0.1,suspension-0.08*kfps)

    		If mapdisplay<>0 Then
    			Var sc=min(390000.0/4000,2/max(0.001,dkzoom))
    			If guitestkey(vk_left) Then mx-=4000*sc:Sleep 200:testweb2=11
    			If guitestkey(vk_right) Then mx+=4000*sc:Sleep 200:testweb2=11
    			If guitestkey(vk_up) Then my+=4000*sc:Sleep 200:testweb2=11
    			If guitestkey(vk_down) Then my-=4000*sc:Sleep 200:testweb2=11
    			If max(Abs(mx),Abs(my))>250000 Then
    				resetmxy0()
    			EndIf 	
    		EndIf 	
    		If guitestkey(vk_8) Then
    			'guiconfirm("reset srtm ?","confirm",resp)
    			'If resp="yes" Then resetsrtm():testweb=1'resetterrain()
    			timegps=0:Sleep 300
    			'v=50
    		   'subsettupdate():guinotice "ok"
    		'	Var resp0="wxtown1(i)="+Str(wxtown)+":wytown1(i)="+Str(wytown)+":wktown1(i)="+Str(wktown)
    		'	prompt(resp0,resp0)
    		EndIf
         'If tautopilot=0 And v>10 And car>0 Then volume=min(volume,2200.0)
    		If plane>0 And car>0 And tautopilot=1 And mapdisplay<>1 And tourelle=0 Then
    		  If guitestkey(vk_left) And guitestkey(vk_space)=0 Then
    		  	  timeautopilot=time2-2
    		  	  avgo1=o1+29.22
    		  ElseIf guitestkey(vk_right) And guitestkey(vk_space)=0 Then
    		  	  timeautopilot=time2-2
    		  	  avgo1=o1-29.22
    		  ElseIf testjoy Then
    		  	  timeautopilot=time2-2
    		  	  avgo1=o1
    		  EndIf 	  
    		  If guitestkey(vk_up) Or guitestkey(vk_down) Or testjoy2 Then
    		  	  timeautopilot=time2-2.1'2.5
    		  	  avgo1=o1
    		  EndIf
    		  If v<1 Or mytestbridge=1 Then timeautopilot=time2-2.5 
    		  testjoy=0:testjoy2=0
    		  If guitestkey(vk_up) Then vautopilot+=0.012*kfps
    		  If guitestkey(vk_down) Then vautopilot-=0.012*kfps
    		  vautopilot=max(3.0,min(8.0,vautopilot))
           'If mytestroad2=1 Or mytestroad0=1 Then  
    		    While avgo1<o1-180:avgo1+=360:Wend
    		    While avgo1>o1+180:avgo1-=360:Wend
    		    Var do1=o1-avgo10
    		    avgo10=o1
    		    While do1<-180:do1+=360:Wend
    		    While do1>180:do1-=360:wend
    		    avgdo1+=(do1/kfps-avgdo1)*0.03*kfps
    		    'If typeautopilot=0 And Abs(o1-avgo1)<70 And Abs(avgdo1)<0.105 Then
    		    If typeautopilot=0 And Abs(o1-avgo1)<80 And Abs(avgdo1)<0.125 Then
    		    	avgo1+=0.135*kfps*max(-8,min(8,(o1-avgo1)))
    		    Else	
    		    	avgo1+=0.035*kfps*max(-1,min(1,(o1-avgo1)))
    		    EndIf 	
    		    avgco1=Cos(degtorad*avgo1)
    		    avgsi1=Sin(degtorad*avgo1)
           'EndIf   
    		  If time2>timeautopilot+3 Then
    		  	  /'Var kv=(vautopilot/6)*(18.0+0.5*ntownnear)/(15.0+ntownnear)
              If (time2<timecollide2+4 Or time2<timecollide22+4) Or mytestroad3=0 Then
              	   If v>3*kv+0.05*v*kfps Then v-=0.05*v*kfps
              ElseIf v<6*kv And volume>850 And volume<2800 Then
              	   volume=min(2800.1,volume+kfps*15)
              EndIf 	   
              If (mytestroad2=0 Or time2<timecollide2+4 Or time2<timecollide22+4 Or mytestroad3=0) And v>7*kv Then
              	   volume=max(860.0,volume-kfps*30)
              ElseIf v>10*kv And volume>1301 Then
              	   volume=max(1300.0,volume-kfps*30)
              elseif v<9*kv and time2>timecollide2+12 And volume<1450 Then
              	   volume+=kfps*15
              EndIf '/
    		  	  If v<2.9 Then
    		  	  	  v=2.901
    		  	  	  vmx2=v*cos1:vmy2=v*sin1:vmz2=v*sin2
    		  	  	  mz11=mzsol00:mz1=mz11:mz=mz11-0.1
    		  	  EndIf 
    		  Else
    		  	  tavgpneu=0
    		  EndIf
    		  If mytestbridge=1 Or (ncariroad(0)=0 And time2>timeautopilot2+2) Then
    		  	  timeautopilot2=time2
    		  EndIf  	  
    		  If time2>timeautopilot+3 And time2<timeautopilot2+3 Then 
    		  	  Var do1pilot=0.0,o1pilot=diro1(co1autopilot,si1autopilot)
    		  	  If dxautopilot>0 Then 
    		  	     dyautopilot=dyautopilot-0.09
    		  	     do1pilot=(o1-o1pilot)
    		  	  Else
    		  	     dyautopilot=-dyautopilot-0.09'Sgn(dxautopilot)
    		  	     o1pilot+=180
    		  	     do1pilot=(o1-o1pilot)
    		  	  EndIf
    		  	  If (Int(time2/40)Mod 3)=0 Then
    		  	  	  dyautopilot=Abs(dyautopilot)
    		  	  Else
    		  	  	  dyautopilot=-Abs(dyautopilot)
    		  	  EndIf 	  
    		  	  While do1pilot>180:do1pilot-=360:Wend
    		  	  While do1pilot<-180:do1pilot+=360:Wend
    		  	  If dyautopilot>0.75 Then dyautopilot=1.65
    		  	  If dyautopilot<-0.75 Then dyautopilot=-1.65
    		  	  Var d8=8.0
   		  	  If Abs(dyautopilot)<0.12 Then
    		  	    If do1pilot>-30 And do1pilot<30 Then 
    		  	  	   d8=2
    		  	    EndIf
   		  	  ElseIf Abs(dyautopilot)<0.3 Then
    		  	    If do1pilot>-34 And do1pilot<34 Then 
    		  	  	   d8=3
    		  	    EndIf
   		  	  ElseIf Abs(dyautopilot)<0.5 Then
    		  	    If do1pilot>-45 And do1pilot<45 Then 
    		  	  	   d8=5
    		  	    EndIf
   		  	  ElseIf do1pilot<-45 Then
   		  	  	   keyLeft(2)
   		  	  	   o1+=12'21
   		  	  	   o1autopilot+=23
   		  	  ElseIf do1pilot>45 Then
   		  	  	   keyRight(2)
   		  	  	   o1-=12'21
   		  	  	   o1autopilot-=23
   		  	  EndIf
   		  	  If mytestroad3=0 Then d8*=0.5
   		  	  if d60road>600 And mytestroad2=0 And mytestroad3=0 Then
   		  	  	  	  If dyautopilot>0.001 Then
   		  	  	  	  	  dyautopilot=0.5*(2+Cos(degtorad*(o1-do1autopilot0)))/3
   		  	  	  	  	  dyautopilot*=400/(400.0+Abs(o1autopilot))
   		  	  	  	  	  do1pilot=max(-8.0,min(-4.0,do1pilot)) 
   		  	  	  	  Else
   		  	  	  	  	  dyautopilot=-0.5*(2+Cos(degtorad*(o1-do1autopilot0)))/3
   		  	  	  	  	  dyautopilot*=400/(400.0+Abs(o1autopilot)) 
   		  	  	  	  	  do1pilot=max(4.0,min(8.0,do1pilot))
   		  	  	  	  EndIf 
   		  	  Else
   		  	  	     do1autopilot0=o1
   		  	  EndIf
    		  	  If dyautopilot>0.002 And do1pilot<9 And do1pilot>-40+2*kfps Then
    		  	  	  Var joy=dyautopilot*(10*dyautopilot-do1pilot)/d8
    		  	  	  If o1autopilot>720 Then
    		  	  	  	  keyRight(2)
      		  	  	  If Rnd<0.015*kfps Then o1autopilot=0 
    		  	  	  Else 	  
      		  	  	  o1autopilot+=joy*kfps
    		    	  	  keyLeft(joy)
    		  	  	  EndIf 	  
    		  	  ElseIf dyautopilot<-0.002 And do1pilot>-9 And do1pilot<40-2*kfps Then
    		  	  	  Var joy=-dyautopilot*(do1pilot-10*dyautopilot)/d8
    		  	  	  If o1autopilot<-720 Then
    		  	  	  	  keyLeft(2)
      		  	  	  If Rnd<0.015*kfps Then o1autopilot=0 
      		  	  Else 	  
      		  	  	  o1autopilot-=joy*kfps	  
    		  	  	     keyRight(joy)
      		  	  EndIf 	  
    		  	  EndIf '/
    		  EndIf    	
    		EndIf 
         If mytestroad2=1 Or mytestroad0=1 Or mytestroad3=1 Or mytestbridge=1 Then
         	d60road=max(30.0,d60road-kfps*(5+d60road*0.05))
         	d05road=max(0.0,d05road-kfps*(10+d05road*0.1))
         Else
         	d60road=min(920.0,d60road+kfps*(14+d60road*0.14))'120.0
         	d05road=min(120.0,d05road+kfps*(3.8+d05road*0.030))
         EndIf 	
    		mytestroad0=mytestroad2
    		mytestroad2=0
    		mytestroad3=0
    		dyautopilot=0
    		dxautopilot=0
    		If mytestbridge=1 then o3=0:cos3=1:sin3=0
    		mytestbridge=0
    		ntownnear0=ntownnear:ntownnear=0
    		'mytestroad=gettestroad(mx+dmx0,my+dmy0)+0.1
    		'auxvar=xweb1:auxvar2=yweb1:auxtest=1

    glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT)'  Or GL_STENCIL_BUFFER_BIT)
    glLoadIdentity ()
    glscalef(1.325,1,1.325)
    testresetmz0()
    tfootmove=0
    yh=17
    If plane=0 Or car>0 Then
    	'Var ksc=1.38:glscalef(ksc,1,ksc)
    	'Var ksc=2.50:glscalef(ksc,ksc,ksc)
    	mz=max(mzsol0,min(mzsol0+300,mz))
    	yh=5.7'9
    	dyh=-9.4
    	If plane>0 And car>0 Then dyh+=dyh0
    	If plane=0 And tfoothorse=1 Then dyh=-4
    	If (car>0 And plane>0) Or (plane=0 And (trun=1 Or guitestkey(vk_up))) Then
    		If plane>0 Then
    			yh=1'5'-4'17/ksc
    		Else
    		   If Abs(mx-mx0)+Abs(my-my0)>0.03 And Abs(o2)>0.3 Then o2-=kfps*0.03*Sgn(o2)
    		EndIf
    		Var d180=max(30.0,4.0*avgv)'180.0
    		If plane=0 Then d180=80
    		Var k01=0.05*kfps
    		avgv+=(vkm-avgv)*k01:avgmx+=(mx-avgmx)*k01:avgmy+=(my-avgmy)*k01
    		If Abs(mxmove-avgmx)>d180 Or Abs(mymove-avgmy)>d180 Or Abs(o1move-o1)>130 Or (prop<500*(1+sin2) And plane>0) Or _  
    		   mapdisplay>0 Then
    			tmxmove=Timer
    			mxmove=mx:mymove=my:o1move=o1 
    			If prop<100 And car>0 And tourelle=1 Then v=0:mx=mx0:my=my0
    		ElseIf Timer>tmxmove+4 Then
    			tmxmove=max(Timer-4,min(Timer,tmxmove+2.5))
    			mx+=100*cos1:my+=100*sin1
    			mxmove=mx:mymove=my:o1move=o1
    			soundpneu()
    			timeautopilot=time2-2
    		EndIf
    	Else
    		tmxmove=Timer
      EndIf
    	If plane=0 And trun=0 Then
    		If Abs(mx-mx0)+Abs(my-my0)>0.01 And piste>=1 Then o2=0:cos2=1:sin2=0:dmz=0:tfootmove=1
    		If Abs(o1-o100)>0.01 Then tfootmove=1
    	EndIf 	
    EndIf 
    If Abs(mx-mx0)+Abs(my-my0)>0.01 Then
    	'mouseo1-=Sgn(Int(mouseo1))*kfps*0.3:mouseo2-=Sgn(Int(mouseo2))*kfps*0.3
      mouseo1=0:mouseo2=0
    EndIf 
    If mzbridge>-999000 Then
    	mz=max(mzbridge,mz):mz1=mz:mzsol0=mz
    	mx+=v*kfps*cos1*0.5
    	my+=v*kfps*sin1*0.5
    EndIf
    Var kcos1=(mx-mx0)*cos1+(my-my0)*sin1
    If kcos1<0 And v>0.1 And plane>0 And car>0 Then
    	kcos1=max(kcos1,-100.0)
    	mx-=kcos1*cos1:my-=kcos1*sin1
    	distback=min(40.0,distback+10)
    Else 	
      distback=max(0.0,distback-kfps)	
    EndIf
    If plane=0 Or car=0 Then
    	ncarx(0)=mx:ncary(0)=my
    	nncarx(0)=mx:nncary(0)=my
    EndIf
    mx0=mx:my0=my:mz0=mz:o100=o1
    
    
    Var yhlayer0=yh:If time2<timeinit+20 Then tlayer0=tlayer00:tlayer=tlayer00
    If plane>0 And car=0 And mz>mzsol0+100 Then tlayer=0:tlayer0=0
    If tlayer0>0.6 Then
    	mz=mzsol00+50:mz1=mz:yh+=30'yh+=80
    	timelayer0=Timer
    elseIf tlayer0<-0.6 Then
    	yh-=100
    ElseIf timer<timelayer0+1+40/max(20.0,vkm) Then
    	mz=mzsol00+50:mz1=mz:yh+=30
    EndIf 	
    if tfoothorse=1 And plane=0 Then yh+=o2horse*0.8+7.5
    'If mapdisplay=4 Then
    		'glulookat(mx,my-5,mz+yh+max(9000,min(40000,(mz-mzsol0)*20)), mx,my,mz+yh, 0,0,1)'+40000
    If mapdisplay=6 Then
    		glulookat(mx,my-5,mz+yh+max(19000,min(70000,(mz-mzsol0)*40)), mx,my,mz+yh, 0,0,1)'+40000
    ElseIf tourelle=0 Or plane=0 Then
    	If plane>0 Then
    	  If volant<>6 Then
    		If car>=1 Then
    			'glulookat(mx,my,mz+yh+dyh, mx+1000*cos1*cos222,my+1000*sin1*cos222,_   
    			'          mz+1000*sin222+yh+dyh, -sin3*sin1*0.85,sin3*cos1*0.85,cos3)
  			   glulookat(mx,my,mz+yh+dyh, mx+1000*cos1*cos222,my+1000*sin1*cos222,_   
    			          mz+1000*sin222+yh+dyh, -sin333*sin1*0.95,sin333*cos1*0.95,cos333)
    		ElseIf volant=2 Then  
    	  	   glulookat(mx,my,mz+yh, mx+1000,my,mz+yh, 0,0,1)
    		   gltranslatef(mx,my,mz+yh)
    		   If Abs(o1)<=9099 Then
      		   glrotatef(o3,1,0,0)
      		   glrotatef(o2+cocko2,0,1,0)
    		   	glrotatef(-o1-cocko1,0,0,1)
    		   Else
      		   glrotatef(-o3,1,0,0)
      		   glrotatef(-o2-cocko2,0,1,0)
    		   	glrotatef(-o1-cocko1+180,0,0,1)
    		   EndIf 	
    		   gltranslatef(-mx,-my,-mz-yh) 	
    		Else 
    	  	   glulookat(mx,my,mz+yh, mx+1000*dmx,my+1000*dmy,mz+1000*dmz+yh, -sin3*sin1*0.9985,sin3*cos1*0.9985,cos3)
    		EndIf
    	  Else
    	  	If Abs(tlayer0)>0.4 Then
    	  		glulookat(mx-200*dmx,my-200*dmy,mz+yh, mx,my,mz+yh, -sin3*sin1*0.85,sin3*cos1*0.85,cos3)
    	  	Else
    	  		glulookat(mx-200*dmx,my-200*dmy,mz+yh+20-165*dmz, mx,my,mz+yh, -sin3*sin1*0.85,sin3*cos1*0.85,cos3)
    	  	EndIf 	
    	  	'x=mx-200*dmx:y=my-200*dmy:z=mz+yh+20-165*dmz 'cf bug freebasic
    	  	'glulookat(x,y,z, mx,my,mz+yh,  -sin3*sin1*0.85,sin3*cos1*0.85,cos3)
    	  EndIf
    	ElseIf topview=1 Then 
    		glulookat(mx,my,mz+yh+10000, mx+10*dmx,my+10*dmy,mz+10*dmz+yh, 0,0,1)
    	ElseIf topview=2 Then
    		'If (itime Mod 30)=1 Then setmapautotextures()
    		'mz=9000
    		xtown=mx+dmx0:ytown=my+dmy0
    		glulookat(mx,my,mz+yh+10000, mx+9*cos1,my+3*sin1,mz+yh, 0.1*cos1,0.1*sin1,1)
    	   gltranslatef(mx,my,0)
    	   glscalef(0.07,0.07,1)
    	   gltranslatef(-mx,-my,0)
    	Else 
    		Var ddmx=dmx,ddmy=dmy,ddmz=dmz
    		If Abs(mouseo1)>3 Then ddmx+=dmy*mouseo1/30.0:ddmy-=dmx*mouseo1/30.0
    		If Abs(mouseo2)>3 Then ddmz+=mouseo2/30.0
    		glulookat(mx,my,mz+yh+dyh, mx+1000*ddmx,my+1000*ddmy,mz+1000*ddmz+yh+dyh, 0,0,1)
    	EndIf
    Else 
    	to2=max2(-89,min2(89,to2))
    	While to1<-180:to1+=360:Wend
    	While to1>180:to1-=360:wend
    	tcos1=Cos((to1+o1)*degtorad):tsin1=Sin((to1+o1)*degtorad)
    	aux=to2+o2*Cos(to1*degtorad)
    	tcos2=Cos(aux*degtorad):tsin2=Sin(aux*degtorad)
    	tcos3=1.0:tsin3=0.0
      tdx=tcos1*tcos2:tdy=tsin1*tcos2:tdz=tsin2   	
      glulookat(mx,my,mz+yh,mx+tdx*1000,my+tdy*1000,mz+tdz*1000+yh, -tsin3*tsin1,tsin3*tcos1,tcos3)
    EndIf
    gldisable(GL_FOG)
    If guitestkey(vk_f12)<>0 _   
       And guitestkey(vk_control)<>0 Then '$$ screenshot cockpit
    	glcolor3f(255,255,255)
    	drawcockpit2()
    	guirefreshopengl
    	While guitestkey(vk_space)=0 And guitestkey(vk_escape)=0 And quit=0
    		guiscan:sleep 300
    	Wend
    EndIf
    
    yh=yhlayer0

'getlockterrain()

    setrangeGL(10000)
   If mapdisplay<4 Then  
    If iciel<=8 Or planet=1 or tsphere=1 Then
    	drawciel
    Else 
      gldisable(GL_FOG)				
      glpushmatrix
      If tdark=1 Then
      	glenable gl_lighting
      Else 	
      	gldisable(gl_lighting)
      EndIf
      glbindtexture(GL_TEXTURE_2D,skydometext)
      gltranslatef(0.9*mx,0.9*my,0)
      o1sky-=Rnd*0.0159
      glrotatef(o1sky,0,0,1)
      'glcolor3f(1,1,1)
      glcolor3f ksoleil, ksoleil, min(1.0,2.0*ksoleil)
      'gltexsphere(49000,12,12)
      drawskydome(max(70000.0,49000*distscale),12,12)'49000,12,12)
      glpopmatrix
      glEnable GL_BLEND
      glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_color
      drawsunset
      'If heure<4.06 or heure>22.20 Then
      '  drawstars
      'EndIf  
      gldisable gl_blend
    EndIf
    drawsun
    If planet=0 And (mz-mzsol0)<1400 Then drawclouds
    If ifog>0 And planet=0 And tdark=0 Then glEnable(GL_FOG)
   EndIf 
    If tdark=1 Then
     	glenable gl_lighting
    Else 	
     	gldisable(gl_lighting)
    EndIf
    scalexy=1:scalexyh=1
    /'If plane=0 Or car>0 Then
    	gltranslatef(mx,my,mz+yh)
    	scalexy=1
    	scalexyh=1
    	glscalef(scalexy,scalexy,1)
    	'scalexy=1
    	gltranslatef(-mx,-my,-mz-yh)
    EndIf '/
    drawsol
    If planet=0 And (mz-mzsol0)>=1400 Then
    	gldisable gl_fog
    	drawclouds
      If ifog>0 And tdark=0 Then glEnable(GL_FOG)
    EndIf
    If tsphere=1 Or (planet=1 And mz>(mzsol0+3000)) Then drawdusts
    'If ktir=1 Then ktir=0:tir() Else ttir=0
    'gldisable(GL_FOG)
    'testtirs
    'If ifog>0 Then glEnable(GL_FOG)
    glcolor3f(1,1,1)
    glenable(gl_texture_2d)
    If tdark=1 Then
     	glenable gl_lighting
    Else 	
     	gldisable(gl_lighting)
    EndIf
            
            	
    time1=Timer*1000
    If time1<time0 Or pause=1 Then time0=time1 'midnight
    glcolor3f(1,1,1)
    Var ihorse=0'md2nnode
    If (itime Mod 30)=1 Then
    	If inearroad>8 Then tdrawroad=time2
    	ndrawmd2=nhorse
    	If ntownnear0>2 Or inearroad>30 Then
    		ndrawmd2=nhorse0
    	ElseIf ntownnear0>2 Or time2<tdrawroad+5 Then
    		ndrawmd2=nhorse0+4
    	EndIf 	
    	'auxvar=ndrawmd2:auxtest=0.3
    EndIf
    If plane=0 Or car=0 Then 
     If md2nnode>=nhorse And (mz<(mzsol0+9000)) Then'And planet=0 And plane>0 And car=0 Then 
      'For md2inode=1 To nmd2'md2nnode
      '   drawMd2node(md2_nodes(md2inode))
      'Next md2inode
      If ndrawmd2<=nhorse0 Then
        nhorse2=nhorse0	
        For ihorse=1 To nhorse0'ndrawmd2
      	drawMd2node(md2_nodes(md2ihorse(ihorse)))
        Next
      Else
        nhorse2=nhorse	
        For ihorse=1 To nhorse'ndrawmd2
      	drawMd2node(md2_nodes(md2ihorse(ihorse)))
        Next
      EndIf 	
     EndIf 
    EndIf 
    time0=time1

If planet=0 Then 

    If pause=0 And (plane=0 Or car=0) Then
       movehorses
    EndIf    
    
    If imap>=4 Then
    	If plane=0 Or car>0 Then 
    	  mz11=max(mzsol00,mz11-7*kfps)
    	  mz1=max(mz11,mz1-7*kfps)
    	  'mz=max(mz1,mz-7*kfps)
    	EndIf   
      'If pause=0 Then moveboat
  	   'If mz<(mzsol0+50000) And tsphere=0 Then drawboat
    'Else 
    	'mz11=-99999
    EndIf
Else
	 myboat=0
	 mz11=-999999
EndIf

If planet=0 Then 
    /'If itown4>0 And testworld=0 Then 
     gldisable(gl_normalize)
     gldisable(gl_lighting) 
     For i=1 To itown4
     	 Var dx=max(70.0,townhousedx(i))
     	 Var dy=max(70.0,townhousedy(i))
     	 Var h=max(20.0,townhouseh(i))
       rotavion(townhousex(i)-mx,townhousey(i)-my,townhousez(i)-mz)
   	 If x2>(0.9*max(Abs(y2),Abs(z2))-h-dx-dy-100) _  
   	    And  x2<dxterrain*scalex Then 
         If townhousevie(i)<0 Then 
            glcolor3f(1,0,0)
            r=1:g=0:b=0
         Else 
            If ((townhousex(i)+dmx0+townhousey(i)+dmy0)Mod 8)=0 And townhouseh(i)>500 And townhousetype(i)=0 Then
			      glcolor3f(0.45,0.70,1)
			      r=0.45:g=0.70:b=1
            Else
            	r=townhouser(i):g=townhouseg(i):b=townhouseb(i)
            	glcolor3f(r,g,b)
            EndIf 	
         EndIf    
   		glpushmatrix
   		gltranslatef(townhousex(i),townhousey(i),townhousez(i))
   		glrotatef(townhouseo1(i),0,0,1)
   		If townhousetype(i)=0 Then
   			drawbuilding2(h*0.4,dx*0.6,dy*0.6,townhousevie(i),x2,r,g,b)
   		ElseIf townhousetype(i)>=1 Then
   			drawbuilding1(h*0.4,dx*0.6,dy*0.6,townhousevie(i),x2,r,g,b)
   		EndIf    			
   		glpopmatrix
   		If x2<townhouseh(i)*0.5 Then
   			If Abs(townhousex(i)-mx)<dx*0.6 Then
   				If Abs(townhousey(i)-my)<dy*0.6 Then
   					If Abs(townhousez(i)-mz)<h*0.4 Then
   						testcrash()
   					EndIf
   				EndIf
   			EndIf 	
   		EndIf    			
   	 EndIf
     Next i
    EndIf '/  
EndIf 

If planet=0 Then 
	
    gldisable gl_alpha_test
    'gldisable(gl_normalize)
    If tdark=1 Then
     	glenable gl_lighting
    Else 	
     	gldisable(gl_lighting)
    EndIf 
/'    For i=1 To nhouse
     changehouse=0	
     If housex(i)<mx-disthouse Then housex(i)+=disthouse*2:changehouse=1
     If housex(i)>mx+disthouse Then housex(i)-=disthouse*2:changehouse=1	
     If housey(i)<my-disthouse Then housey(i)+=disthouse*2:changehouse=1
     If housey(i)>my+disthouse Then housey(i)-=disthouse*2:changehouse=1
     If changehouse=1 Then
     	 x=60:y=60
     	 housez(i)=getterrainheight(housex(i)-x,housey(i)-y)		
       housez(i)=min(housez(i),getterrainheight(housex(i)+x,housey(i)-y))		
       housez(i)=min(housez(i),getterrainheight(housex(i)+x,housey(i)+y))		
       housez(i)=min(housez(i),getterrainheight(housex(i)-x,housey(i)+y))		
  	    If testairport(housex(i),housey(i),2500,200)=1 Then
  	    	housez(i)=waterz0-1 
  	    EndIf
  	  EndIf
  'rotavion2(housex(i)-mx,housey(i)-my)
  rotavion(housex(i)-mx,housey(i)-my,housez(i)-mz)
  If x2>(Abs(y2)-500) And housez(i)>waterz And tsphere=0 Then
     glpushmatrix
     gltranslatef(housex(i),housey(i),housez(i))
     'glrotatef(houserot(i),0,0,1)
     drawhouse1(x2)
     glpopmatrix 
  EndIf 
    Next i 
    For i=1 To nhouse2
     changehouse2=0	
     If house2x(i)<mx-disthouse2 Then house2x(i)+=disthouse2*2:changehouse2=1
     If house2x(i)>mx+disthouse2 Then house2x(i)-=disthouse2*2:changehouse2=1	
     If house2y(i)<my-disthouse2 Then house2y(i)+=disthouse2*2:changehouse2=1
     If house2y(i)>my+disthouse2 Then house2y(i)-=disthouse2*2:changehouse2=1
     If changehouse2=1 Then
     	 x=50:y=110
     	 house2z(i)=getterrainheight(house2x(i)-x,house2y(i)-y)		
       house2z(i)=min(house2z(i),getterrainheight(house2x(i)+x,house2y(i)-y))		
       house2z(i)=min(house2z(i),getterrainheight(house2x(i)+x,house2y(i)+y))		
       house2z(i)=min(house2z(i),getterrainheight(house2x(i)-x,house2y(i)+y))		
  	    If testairport(house2x(i),house2y(i),2500,200)=1 Then
  	    	house2z(i)=waterz0-1 
  	    EndIf
     EndIf
  'rotavion2(house2x(i)-mx,house2y(i)-my)
  rotavion(house2x(i)-mx,house2y(i)-my,house2z(i)-mz)
  If x2>(Abs(y2)-500) And house2z(i)>waterz And tsphere=0 Then 	
     glpushmatrix
     gltranslatef(house2x(i),house2y(i),house2z(i))
     'glrotatef(house2rot(i),0,0,1)
     drawhouse2(x2)
     glpopmatrix    
  EndIf    
    Next i


    For i=1 To ndome
     changedome=0	
     If domex(i)<mx-distdome Then domex(i)+=distdome*2:changedome=1
     If domex(i)>mx+distdome Then domex(i)-=distdome*2:changedome=1	
     If domey(i)<my-distdome Then domey(i)+=distdome*2:changedome=1
     If domey(i)>my+distdome Then domey(i)-=distdome*2:changedome=1
     If changedome=1 Then
       If dometype(i)=0 Then
     	  domevie0(i)=400
     	  domez(i)=getterrainheight(domex(i),domey(i))
     	  If domez(i)>(waterz+0.01) Then domez(i)+=58.5 Else domez(i)=waterz-1
       Else
     	  domevie0(i)=200
     	  domez(i)=getterrainheight(domex(i),domey(i))
     	  If domez(i)>(waterz+0.01) Then domez(i)+=68.5 Else domez(i)=waterz-1
       EndIf
       domevie(i)=domevie0(i)
  	    If testairport(domex(i),domey(i),2500,200)=1 Then
  	       domez(i)=waterz0-1 
  	    EndIf
     EndIf
    Next i
    If mz<(mzsol0+25000) Then drawdomes()
'/    
EndIf 'planet

'If tsphere=0 Then drawairports()

If tsphere=0 And planet=0 Then
    
    drawtowns()
    tupdatetown=0
    getlocktown2(0)   
    If testworld=0 Then
    	drawtownobjects()
    EndIf
    If testworld=1 Then
    	If topentown=1 Then drawbridges():drawfuel()
    	If tinittown0>0 Then tinittown00=Timer+8
    	If timer>tinittown00 Then
    		drawworldobjects()
    		drawaeroways()
    	ElseIf Timer>tinittown00-4 Then
    		tinittown00=0
    		'xweb1=xweb-999990
    	EndIf 	
    EndIf
    freelocktown(0)
    
    drawballoon()
    drawboeing()
    drawseagull()
    
    gldisable gl_alpha_test
    If auxtest>0.5 Then 
    x=-500:y=100:z=max(Abs(x-mx),Abs(y-my))
    If z<(dxterrain*scalex) Then 
     glEnable GL_BLEND
     glBlendFunc GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA
     glpushmatrix
     gldisable(gl_texture_2d)
     gltranslatef(x,y,getterrainheight(x,y)+60)
     glenable(gl_lighting)
     glcolor4f(0,1,1,0.92)
     i=max2(5,200000/(10000+z))
     glsphere(100,i,i)
     glcolor4f(1,1,1,1)
     glpopmatrix
     gldisable gl_blend
     gldisable gl_alpha_test
     If tdark=1 Then
     	 glenable gl_lighting
     Else 	
     	 gldisable(gl_lighting)
     EndIf
    EndIf
    EndIf 
    
    'If tourelle=0 And tautopilot=1 Then testcollideforward()
    
EndIf 

    'gldisable(gl_normalize)
    If tdark=1 Then
     	glenable gl_lighting
    Else 	
     	gldisable(gl_lighting)
    EndIf

If planet=0 Then
	 glnormal3f(-cos1,-sin1,0.3)
	 drawarbres()
    tupdatearbre=0

    gldisable gl_alpha_test
    drawcows()
    tupdatecow=0
    
    drawrocs()
    tupdateroc=0
    
    If tourelle=0 Then testcollideforward()

    drawladys()
    tupdatelady=0

    glenable gl_alpha_test
    If igrass>=2 And mz<(mzsol0+290) Then
    	drawgrass
    	tupdategrass=0
    EndIf
    drawsauterelle()
    drawgrillon()

    gldisable gl_alpha_test
    'gldisable(gl_normalize)
    If tdark=1 Then
     	glenable gl_lighting
    Else 	
     	gldisable(gl_lighting)
    EndIf
EndIf 

    If ktir=1 Then ktir=0:tir() Else ttir=0
    gldisable(GL_FOG)
    testtirs
    If ifog>0 And tdark=0 Then glEnable(GL_FOG)
    glcolor3f(1,1,1)

  'moveavion
  'avionx=0:aviony=0:avionz=10:aviono1=120:aviono2=-30':aviono3=40
  /'rotavion(avionx-mx,aviony-my,avionz-mz)
  If x2>(Abs(y2)-500) Then
  	  aux=Abs(x2)
     glenable(gl_texture_2d)
     If planet=0 Then
     	glbindtexture(gl_texture_2d,aviontext)
     Else 
     	'glbindtexture(gl_texture_2d,fightertext)
     EndIf
     glcolor3f(1,1,1)	
     glpushmatrix
     gltranslatef(avionx,aviony,avionz)
     glrotatef(aviono1,0,0,1)
     glrotatef(-aviono2,0,1,0)
     glrotatef(-aviono3,1,0,0)'+90,1,0,0)
     If planet=0 Then
     	drawavion
     Else
     	'drawfighter
     EndIf
     'gltranslatef(-96,24,0)
     gltranslatef(-96,0,24)
     If heure>18 Or heure<8 Or planet=1 Then 
      tlight+=kfps
      If tlight>15 Then'27 Then
      	If tlight>40 Then tlight=0
         gldisable(gl_texture_2d)
     	   glcolor3f(1,0.1,0)
     	   glsphere(max(1.2,min(80.0,aux/300)),4,4)'400
     	   glcolor3f(1,1,1)
         glenable(gl_texture_2d)
      EndIf 
     EndIf
     If planet=0 Then 
      gltranslatef(96+45,0,-24)
      glbindtexture(gl_texture_2d,helicetext)	
      glEnable GL_BLEND
      'glBlendFunc GL_SRC_color,GL_ONE_MINUS_SRC_color
      glBlendFunc GL_SRC_alpha,GL_ONE_MINUS_SRC_alpha
      helicerot=helicerot+avionv*1.5
      If helicerot>10000 Then helicerot-=10000
      glrotatef(helicerot,1,0,0) 
      gltexcarre3(40,40)
      gldisable gl_blend
     EndIf 
     glpopmatrix
  EndIf 
  '/
  tstation=0
  If tsphere=1 Or planet=1 Then
     setrangegl(max(abs(stationx-mx),abs(stationy-my))+abs(stationz-mz)) 
  	  drawstation()
  	  setrangeGL(10000)
  EndIf

If planet=0 Then 
	
    If tdark=1 Then
     	glenable gl_lighting
    Else 	
     	gldisable(gl_lighting)
    EndIf
    glenable gl_texture_2d
/'  	 If imap>=4 And mz<(mzsol0+9000) Then 
   	glcolor3f(1,1,1)
  	   For i=1 To nboat2
  	   	glpushmatrix
  	   	gltranslatef(boatx(i),boaty(i),boatz(i))
         glrotatef(boato1(i),0,0,1)
         If Abs(boato2(i))>1 Then glrotatef(-boato2(i),0,1,0)
         If Abs(boato3(i))>1 Then glrotatef(-boato3(i),1,0,0)
 	   	drawfires(i)
  	   	glpopmatrix
  	   	drawsfire(i)
  	   	aux=min(25.0,2*vdegats(i))
  	   	For j=0 To 3
  	   		aux+=min(5.0,tdegats(i,j))
  	   	Next
  	   	aux=aux/45.0
  	   	vboat(i)=vboat(i)-min(0.3,0.04*aux*kfps)*vboat(i)
  	   	aux=time2+99999
  	   	'If tdegats(i,1)>=5 And tdegats(i,2)>=5 And tdegats(i,3)>=5 Then 
  	   	If tdegats(i,1)>=4.9 And tdegats(i,2)>=4.9 And tdegats(i,3)>=4.9 Then 
  	   		'tshootleft(i)=0
  	   		'tshootright(i)=0
  	   		If tdegats(i,0)>=3.9 Then
  	   			vboat(i)=0
  	   			aux=time2
  	   		EndIf
  	   	EndIf
  	   	If boatvie(i)<boatvie0(i) And boatvie(i)>0 Then
  	   		boatvie(i)+=0.02*kfps*boatvie0(i)/200
  	   	EndIf
  	   	If aux>=time2+9999 And boatvie(i)>0 Then
  	   		tboatmort(i)=aux
  	   	Else 
  	   		tboatmort(i)=min(time2,tboatmort(i))
  	   	EndIf
  	   Next
  	   For i=1 To nboat2
  	   	If boatvie00(i)>=0 And boatvie(i)<0 Then
  	   	  boatvie(i)=-99
  	   	  boatvie00(i)=-99	
           soundboom
           addboom(boatx(i),boaty(i),boatz(i))
  	   	Else
  	   	  boatvie00(i)=boatvie(i)
  	   	EndIf
  	   	If time2>(tboatmort(i)+4) Then
  	   		tboatmort(i)=time2+99999
  	   	   testmort(i)=1
  	   	EndIf
  	   Next i
  	 EndIf 
    '/  	 
EndIf 'planet

    
    gldisable(gl_lighting)
    glenable gl_texture_2d
  
    drawairship()
  
    drawncars()
    testcollidecars()
    setvolcar()
    If volumecar>50 Then setspeedcar()
    volumecar=0
    
   If auxtest>0.86 Then 
    glpushmatrix
    Var lat0=lat,lng0=lng,xx=mx,yy=my,xxx=mx,yyy=my
    latlngtomxy(myroadlat,myroadlon,xx,yy)
    var dx=0.5*360/40000
    latlngtomxy(myroadlat+dx*sin1,myroadlon+dx*cos1*klon,xxx,yyy)
    lat=lat0:lng=lng0
    gltranslatef(xx,yy,getterrainheight(xx,yy))
    glcolor3f(0,1,0)
    gltexsphere(190,4,4)
    glpopmatrix 
    glpushmatrix
    gltranslatef(xxx,yyy,getterrainheight(xxx,yyy))
    glcolor3f(0,0,1)
    gltexsphere(190,4,4)
    glpopmatrix 
    glpushmatrix
    Var llat0=lat,llng0=lng,lxx=mx,lyy=my
    latlngtomxy(asktownlat,asktownlon,lxx,lyy)
    lat=llat0:lng=llng0
    gltranslatef(lxx,lyy,getterrainheight(lxx,lyy))
    glcolor3f(1,0,0)
    gltexsphere(190,4,4)
    glpopmatrix
    glcolor3f(1,1,1)
   EndIf  
    
    If tnight=0 And tshadow=1 Then
    	drawcloudshadows()
    EndIf
    drawshadow()

    drawrain()
    
    If plane=0 Then
       If guitestkey(vk_h) Then tfoothorse=(tfoothorse+1)Mod 2:Sleep 300
       If tfoothorse=1 Then
       	drawhorse()
       ElseIf tfootmove>0.5 Then  
			if mz<waterz+25.1 Then
				If Timer>tsoundfoot+0.3 Then
					If ntownnear<2 Then
						soundwaterwave()
					ElseIf ntownnear0<2 Then
						ntownnear0=ntownnear
						testweb=1
					EndIf
					soundfoot(2.4)
				EndIf
			Else
				soundfoot(2.4)
			EndIf 
       EndIf
    EndIf
	 If (mz<(mzsol0+500) And (mzsol0-mzh)<waterz+1+dhseashore)Then'And tseashore=1 and webtext=0 Then
		If ntownnear<1 And plane=0 Then drawseashore()
	 EndIf
    'drawbullets()
    'freelockterrain()
    
    gldisable gl_depth_test
    If plane=1 And car=0 And tdark=0 Then
    	If avion="c150" Or avion="zero" Then
    		'drawc150shadow()
    		Var scale=1.0:If mz>mzsol00+100 Then scale=1.3
    		drawc150shadow(mx,my,mz,mzsol00,scale,cos1,sin1,cos2,cos3)   
    	EndIf
    	If avion="737" Then
    		draw737shadow(mx,my,mz,mzsol00,1.25,cos1,sin1,cos2,cos3)   
    	EndIf
    	If avion="ballon" Then
    		drawballonshadow(mx,my,mz,mzsol00,1.5,cos1,sin1,cos2,cos3)   
    	EndIf
    EndIf
    If tdark=0 Then
    	Var i=0
    	For i=1 To nship2
    		If airshipx2(i)<15000 And airshipx2(i)>-1000-(airshipz(i)-airshipzsol(i))*suntan2 Then
           Var airshipco1=Cos(degtorad*airshipo1(i))
           Var airshipsi1=Sin(degtorad*airshipo1(i))
           Var airshipco2=Cos(degtorad*airshipo2(i))
           Var airshipco3=Cos(degtorad*airshipo3(i))
    		  Var scale=1.3':If airshipz(i)>airshipzsol(i)+100 Then scale=1.1
           drawc150shadow(airshipx(i),airshipy(i),airshipz(i),airshipzsol(i),scale,airshipco1,airshipsi1,airshipco2,airshipco3)   
    		EndIf
    	Next
    EndIf
    If tdark=0 And boeingx2<25000 And boeingx2>-1000-(boeingz-boeingzsol)*suntan2 Then 
     Var boeingco2=Cos(degtorad*boeingo2)
     Var boeingco3=Cos(degtorad*boeingo3)
     draw737shadow(boeingx,boeingy,boeingz,boeingzsol,4.5,boeingco1,boeingsi1,boeingco2,boeingco3)   
    EndIf 
    If tdark=0 And balloonx2<25000 And balloonx2>-1000-(balloonz-balloonzsol)*suntan2 Then 
     Var balloonco2=1'Cos(degtorad*balloono2)
     Var balloonco3=1'Cos(degtorad*balloono3)
     Var balloonco1=Cos(degtorad*balloondo1)
     Var balloonsi1=Sin(degtorad*balloondo1)
     drawballonshadow(balloonx,balloony,balloonz,balloonzsol,1.6,balloonco1,balloonsi1,balloonco2,balloonco3)   
    EndIf
    glenable gl_depth_test

    setrangeGL(0)

    If plane=1 And tourelle=0 Then
      If volant=1 Then
      	drawcockpitcar'drawcar
      ElseIf car>0 Then
      	drawcapot()
      EndIf  	
      If tshowradio=0 Then tshowradio=1:showgui("win.radio")  	
      'ElseIf tshowradio=1 And tradio=0 Then
    	'   tshowradio=0:hidegui("win.radio")      	
      'EndIf
      'auxvar=volant+0.1
      If volant=2 And car=0 Then drawcockpit2
      If volant=3 Then drawcockpit  	
      If volant=4 Then drawcockpit2
      If volant=5 And (typeavion<7 Or typeavion=12)Then addhelicesmoke(21.5)  	
      If volant=6 Then drawcockpit3  	
    	If volant>=1+1 And volant<=2 And car>0 Then drawvolant
      gldisable gl_blend
      gldisable gl_alpha_test
    'ElseIf tshowradio=1 And tradio=0 Then
    '	tshowradio=0
    '	hidegui("win.radio")
    EndIf

    gldisable(gl_lighting)
    If imap>=4 Then
      gldisable GL_DEPTH_TEST
      'If mz<(waterz+altwater) Then drawwind
      If mz<(mzsol0+10000) And planet=0 Then
      	tdrawwind=1:drawwind
      Else
      	tdrawwind=0
      EndIf
    	drawmap()
    EndIf
    
    If vie>0.1 Then vie=min(vie0,vie+0.002*kfps)
    drawvie
    If vie<0.001 Then
    	If mz>(mzsol0+1) And tmort>Timer and (planet=0 or orbit=1) Then
    	   o3+=kfps*1.7*Sgn((Int(tmort)Mod 2)-0.5)
    	Else
    		drawmort
    		tmort=Timer+20
    	EndIf
    EndIf
    
    If mz>mzsol00+5000 And mapdisplay=0 Then
      glsetrange(36.0*14,14*2*170000.0)
      gldisable gl_fog
    	drawcitynear()
    	setrangeGL(0)
    EndIf
    drawtest()

        glLoadIdentity ()
	     gldisable GL_DEPTH_TEST
        gldisable(gl_texture_2d)
        'drawviseur
        'glcolor3f(0.85,0,0)
        glcolor3f(0.4,1,0.4)
        gldrawtext("fps "+Str(Int(fpsmoy)),15,12,1.2)
        'gldrawtext("nvertices "+Str(Int(md2_nodes(1)->md2model->header.num_vertices)),15,35,1.2)
        If (icar=2 Or icar=5 Or icar=16) And tourelle=0 Then 
        	glcolor3f(0.3,0.4,1)
        Else 	
        	glcolor3f(0.4,1,0.4)
        EndIf
        If tourelle=1 And plane>=1 Then gldrawtext("tourelle",xmax-159,17,1.2)
        If itown4>0 And max(Abs(xtown-mx-dmx0),Abs(ytown-my-dmy0))<20*scalex Then 
        	  gldrawtext(townname+"= "+Str(itown4),15,ymax-59,1.2)        	  
        Else 
           gldrawtext(Left(reverselocation,30),15,ymax-59,1.2)
           If reverselocation<>reverselocation0 And textspeak="" Then
           	  If Trim(reverselocation)="" Then
           	  	If Trim(reverselocation0)<>"" Then
           	  		textspeak="you are leaving "+reverselocation0
           	  	EndIf
           	  Else 	
           	   If Rnd<0.5 Then
           	  	  textspeak="you are entering "+reverselocation
           	   Else 	  
           	  	  textspeak="you are arriving "+reverselocation
           	   EndIf
           	  EndIf  
           	  reverselocation0=reverselocation
           EndIf
        EndIf
       If auxtest>0.01 Then  
        If Abs(auxvar)>0.00001 Then gldrawtext("aux= "+Str(auxvar),15,ymax-79,1.2)
       EndIf
       If auxtest>0.1 Then 
        If Abs(auxvar2)>0.00001 Then gldrawtext("aux2= "+Str(auxvar2),15,ymax-99,1.2)
        If Abs(auxvar3)>0.00001 Then gldrawtext("aux3= "+Str(auxvar3),15,ymax-119,1.2)
        If Abs(auxvar4)>0.00001 Then gldrawtext("aux4= "+Str(auxvar4),15,ymax-139,1.2)
        If Abs(auxvar5)>0.00001 Then gldrawtext("aux5= "+Str(auxvar5),15,ymax-159,1.2)
        If Abs(auxvar6)>0.00001 Then gldrawtext("aux6= "+Str(auxvar6),15,ymax-179,1.2)
        If auxtext<>"" Then gldrawtext(auxtext,15,ymax-199,1.2)
       EndIf
       If auxtest<0.1 And mapdisplay=0 Then 
        If timer<timehelp+120 Then drawhelp()	
       EndIf
        Var vv=min(v*3,Sqr((xkm-mx)*(xkm-mx)+(ykm-my)*(ykm-my)+(zkm-mz)*(zkm-mz))*fps/15)'/25
        If (xkm-mx)*cos1+(ykm-my)*sin1>0 Then vv=-vv
        xkm=mx:ykm=my:zkm=mz
        If car>0 Then vkm+=(vv*4.75-vkm)*0.07*kfps Else vkm+=(vv*7-vkm)*0.03*kfps'v*17
        gldrawtext("prop= "+Str(Int(prop))+"  v= "+Str(Int(vkm))+"."+Str(Int(vkm*10+1000)Mod 10),15,ymax-35,1.2)
        gldrawtext("x= "+Str(Int((mx)*500/kscalex))+ _'"+"+Str(Int(dmx0))+ _  
                 "  y= "+Str(Int((my)*500/kscalex))+ _'"+"+Str(Int(dmy0))+ _ 
                 "  z= "+Str(int(mz-mzh-waterz))+"/"+Str(Int(waterz)),15,ymax-10,1.2)
                 '"  z= "+Str(Int(mz-mzsol00)),15,ymax-10,1.2)
        If plane>0 And car>0 And mapdisplay=0 And tourelle=0 Then
        	 vkm20=vkm2
        	 'vkm2=Int(max(0.1,0.8+prop/1100))
        	 vkm2=Int(0.8+(prop/1000))
        	 Var vkm3=Int((prop-vkm)/30.01)
        	 If Abs(vkm2-vkm20)>0.1 Then soundclick()
        	 if volant=2 Then
        	 	glcolor3f(1,0,1)
            If time2<tsoundcarhorn+0.5 Then glcolor3f(1,1,0)
        	 	gldrawtext(Str(Int(vkm)),xmax*0.243*(xmax/ymax)*(639/1336),ymax*0.87,3.5)
        	 	'gldrawtext(Str(Int(vkm3)),xmax*0.243*(xmax/ymax)*(639/1336),ymax*0.87,3.5)
        	 	glcolor3f(0,1,0):gldrawtext(Str(Int(vkm2)),xmax*0.243*(xmax/ymax)*(639/1336),ymax*0.92,1.5)
        	 ElseIf volant=1 Then
        	 	Var i44=0.44
        	 	If car=4 Then i44=0.455
        	 	glcolor3f(1,0,1)
            If time2<tsoundcarhorn+0.5 Then glcolor3f(1,1,0)
        	 	gldrawtext(Str(Int(vkm)),xmax*i44*(xmax/ymax)*(639/1336),ymax*0.87,3.5)
        	 	'gldrawtext(Str(Int(vkm3)),xmax*i44*(xmax/ymax)*(639/1336),ymax*0.87,3.5)
        	 	glcolor3f(0,1,0):gldrawtext(Str(Int(vkm2)),xmax*i44*(xmax/ymax)*(639/1336),ymax*0.92,1.5)
        	 EndIf
        EndIf
        If testworld=1 Then carb=max(1000,carb)
        If carb<carb0*0.1 Then glcolor3f(1,0,0) Else glcolor3f(0,1,1)
        gldrawtext("carb="+Str(Int(carb)),10,270,1)
        If mapdisplay>0 And auxtest<0.699 Then
        	  glcolor3f(1,1,1)
        	  If dkzoom>6.1 Then
        	  	  gldrawtext("[A][Z]zoom = 2",10,320,1.2)
        	  ElseIf dkzoom>1.1 Then
        	  	  gldrawtext("[A][Z]zoom = 1",10,320,1.2)
        	  ElseIf dkzoom>0.5 then 	  
        	  	  gldrawtext("[A][Z]zoom = 0",10,320,1.2)
        	  ElseIf dkzoom>0.1 then 	  
        	  	  gldrawtext("[A][Z]zoom = -1",10,320,1.2)
        	  Else 	  
        	  	  gldrawtext("[A][Z]zoom = -2",10,320,1.2)
        	  EndIf
        	  gldrawtext("visibility = "+Str(wfog),10,340,1.2)
        	  gldrawtext("clouds = "+Str(wclouds),10,360,1.2)
        	  gldrawtext("humidity = "+Str(whumidity),10,380,1.2)
        	  gldrawtext("temp min = "+Str(wtempmin),10,400,1.2)
        	  glcolor3f(1,0,0)
        	  gldrawtext("arrows : move",10,425,1.7)
        	  glcolor3f(1,1,1)
        	  gldrawtext("nbuild = "+Str(nbuilds)+"/"+Str(copydoubles),10,450,1.2)
        	  gldrawtext("itown40 = "+Str(itown40),10,470,1.2)
        	  gldrawtext(treetype,10,490,1.2)
        	  gldrawtext("Fre(0)="+Str(Fre(0)\1000000)+"M/"+Str(fre00\1000000)+"M",10,510,1.2)       	  
        EndIf
        If tautopilot=1 And ((plane>0 And car>0)Or plane=0) Then
        	 If typeautopilot=0 Then
        	 	glcolor3f(1,1,1):gldrawtext("autopilot0",10,290,1)
        	 Else 	
        	 	glcolor3f(1,1,1):gldrawtext("autopilot",10,290,1)
        	 EndIf 	
        EndIf
        If plane>0 And car=0 And volant=2 Then
        	   glcolor3f(1,0,0.6):gldrawtext("QZSD = head",10,290,1)
        EndIf
        If tlockchanged=1 Then'mapdisplay=0 Then
         tlockchanged=0 
         If auxtest>0.5 Then 
          If tloadwebtext2>0 Or testweb>0 Then gldrawtext("loading "+Str(tloadwebtext2)+" "+Str(testweb)+" "+Str(tinittown),10,310,1)
          gldrawtext(httphost+" "+Str(httpon)+" "+Str(httpidata),10,330,1)
         ElseIf httpon=1 Then 
        	 glcolor3f(0,1,1)
          If InStr(httphost,"google")>0 Then
          	gldrawtext("load...",10,310,1)
          Else 
          	gldrawtext("load.."+Str(Int(dtweb))+" "+Str(tinittown),10,310,1)
          EndIf
         ElseIf httpon=-1 Then 
        	 glcolor3f(0,1,1)
          gldrawtext("wait...",10,310,1)
         EndIf 
        EndIf   
        'drawboussole
        drawradar
	     If tgps<=1 Then drawgps
        cursorx0=0:cursory0=0:cursorz0=0
        drawhand
        
    If quit=1 Then
   	glpushmatrix
   	gldrawtext("bye",xmax/2,ymax/2,3)
   	glpopmatrix
   	'Exit Sub 
    EndIf

	 Var n=ncariroad(0)
	 If (plane=0 Or (car>0 And (tautopilot>=0 Or n=0)) Or car=0) And (itime mod 10)=3 Then
	   myncari=0
	   Var drr=0.0
	   If (plane=0 And trun>0 And tautopilot>0) Then
	   	drr=40
	   	If n=0 Then
	   		drr=100
	   		If time2>timeautopilot+2 Then timeautopilot=0 
	   	ElseIf timeautopilot<fpsmoy Then
	   		timeautopilot+=0.5
	   		drr=70
	   	EndIf
	   	avgo1=o1
	   EndIf
	   n=getrandomnearroad(mx,my,n,cos1,sin1,drr,1)
	   myncari=1
	   ncariroad(0)=n
	 EndIf
	 If n>0 Then
	 	If rnearroad(n)>140 Then
	 	   piste0=2
	 	Else    
	 		piste0=1 
	 	EndIf
	 	If plane=0 And trun>0 And tautopilot>0 Then
  		  If guitestkey(vk_up) Or guitestkey(vk_down) Or testjoy2 Then
  		  	  timeautopilot=time2
  		  EndIf
  		  If guitestkey(vk_left) Or guitestkey(vk_right) Or testjoy Then
  		  	  timeautopilot=time2
  		  EndIf
  		  If time2>timeautopilot+2 Then 
	 		Var r=rnearroad(n)
	 		Var co1=co1nearroad(n)/r,si1=si1nearroad(n)/r
	 		Var dxy=(mx-xnearroad(n))*si1-(my-ynearroad(n))*co1
	 		Var dyy=co1*sin1-si1*cos1
	 		Var dxx=co1*cos1+si1*sin1
	 		If dxx<0 Then
 				Var kkfps=kfps*min(1.0,r/60)
	 			If Abs(dxy)>19 Or Abs(dxx)<0.47 Then
	 				o1+=(dyy)*kfps*3
	 				mx+=Sgn(dxy)*sin1*kkfps'*1.25
	 				my-=Sgn(dxy)*cos1*kkfps'*1.25
	 			Else'If Abs(dyy)>0.(1 Then 
	 				o1+=(dyy)*kfps*0.6
	 				mx+=dyy*sin1*kkfps*0.5
	 				my-=dyy*cos1*kkfps*0.5
	 			EndIf
	 		Else 	
 				Var kkfps=kfps*min(1.0,r/60)
	 			If Abs(dxy)>19 Or Abs(dxx)<0.47 Then
	 				o1-=(dyy)*kfps*3
	 				mx-=Sgn(dxy)*sin1*kkfps'*1.25
	 				my+=Sgn(dxy)*cos1*kkfps'*1.25
	 			Else'If Abs(dyy)>0.1 Then 
	 				o1-=(dyy)*kfps*0.6
	 				mx-=dyy*sin1*kkfps*0.5
	 				my+=dyy*cos1*kkfps*0.5
	 			EndIf
	 		EndIf
  		  EndIf 
	 	EndIf
	 Else
	 	piste0=0
	 EndIf
	 If n>0 And time2>tmyroadwayname+1 Then
	 	timesearchroad=time2
		myroadwayname=namenearroad(n)
		myroadwayid=idnearroad(n)
		tmyroadwayname=time2
	 ElseIf myibridge>0 And time2>tmyroadwayname+1 Then
		myroadwayname=bridgename(myibridge)
		myroadwayid=""
		tmyroadwayname=time2
	 ElseIf time2>tmyroadwayname+4 Then 
		myroadwayname=""
		myroadwayid=""
		tmyroadwayname=time2-3
	 EndIf 
	 'If myibridge>0 Then tlayer=1:idlayer0=0:idlayer=0
	 If Abs(tlayer0)>0.6 And (plane=0 Or car>0) Then
	 	avgo1=o1
      layero1=o1
	 	mz=mzsol0:mz1=mz	
	 ElseIf Abs(o1-layero1)>60 and abs(o1-layero1)<180 Then' And Timer>timelayer Then
	 '	timelayer=Timer+1
	 	idlayer0=idlayer:idlayer=0	
	 EndIf
	 If n>0 Then
		Var ttlayer=layernearroad(n)'$$
		If plane=0 Or car>0 Then
		  If tlayer0>-0.4 And Timer>timelayer Then 	
		    If ttlayer>0.4 And Abs(tlayer0)<0.4 And Timer>timelayer+10 Then
		    	tlayer=ttlayer:timelayer=max(timelayer,Timer+1):mz1=mzsol00:mz=mz1 
		    EndIf
		    If Abs(ttlayer)<0.4 Then timelayer=max(timelayer,Timer+1)
		    'If ttlayer<-0.4 And tlayer0>-0.4 And Timer>timelayer+12 Then tlayer=ttlayer:timelayer=max(timelayer,Timer+1):mz1=mzsol00:mz=mz1
		    If Abs(ttlayer)<0.4 And Abs(tlayer0)>0.4 Then tlayer=ttlayer:timelayer=max(timelayer,Timer+1):mz1=mzsol00:mz=mz1
		  ElseIf tlayer0<-0.4 Then 
		  	 If ttlayer>-0.1 Then
		  	 	if Timer>timelayer+10 Then tlayer=ttlayer:mz1=mzsol00:mz=mz1
		  	 Else
		  	 	timelayer=max(timelayer,Timer-3)
		  	 EndIf
		  EndIf 
		ElseIf tlayer0<-0.1 Or Timer>timelayer Then 
		  tlayer=0	
		EndIf
	 Else
	 	If tlayer0<-0.6 Or tlayer0>0.6 Then
	 		If Timer>timelayer+7 Then tlayer=0
	 	EndIf
	 EndIf

        gldisable gl_depth_test
        If time2<tspeak+8 Then'And (plane=0 Or car>0 Or myroadwayname="") Then
        	glcolor3f(0,1,1):gldrawtext(textspeakmsg,110,2,1.2)
        ElseIf time2<tspeak+10 Then 
        	textspeakmsg=""
        EndIf 	
        'If (plane=0 or car>0 Or (car=0)) And myroadwayname<>"" Then
        If time2>tspeak+8 And myroadwayname<>"" Then
        	If tretroviseur=0 Then
        		glcolor3f(0.3,1,0.8):gldrawtext(myroadwayname,xmax*0.5,2,1)
        	Else 
        		glcolor3f(0.3,1,0.8):gldrawtext(myroadwayname,xmax*0.64,2,1)
        	EndIf
        EndIf
        /'If time2<torder Then 
        	  glcolor3f(0,0,1)
        	  If order=1 Then gldrawtext("formation",xmax-70,17,1)
        	  If order=2 Then gldrawtext("attack",xmax-70,17,1)
        	  If order=3 Then gldrawtext("cover",xmax-70,17,1)
        	  If order=4 Then gldrawtext("break",xmax-70,17,1)
        EndIf '/
        If trepair=1 And (Int(Timer*1.5)Mod 3)>0 Then 
	        glcolor3f(0,0.72,0)
	        gldrawtext("[R]refuel",110,15,1.2)
        EndIf
        glenable(gl_texture_2d)
        testsounds2()
        glEnable GL_DEPTH_TEST
        
End Sub 
Sub subquit
	quit=1
End Sub
Sub subpause
	If pause=0 Then pause=1 Else pause=0
End Sub
Sub subhour
Var hhour=Val(guigettext("win.hour"))
hhour=max(0.0,min(23.99,hhour))
dtimehour=hhour-timehour
heure=timehour+dtimehour
tsun=0
drawsun
End Sub
Sub subresp
resp=guigettext("win2.resp")
End Sub
Sub prompt(ByRef msg0 As String,ByRef resp0 As String)
Dim As Integer x400 
x400=max2(400,Len(msg0)*10)
statictext("win2.msg","msg",10,10,x400,40)
edittext("win2.resp","",@subresp,10,60,x400,20)
openwindow("win2","freewebcar_chung",50,50,x400+50,180)
printgui("win2.msg",msg0)
printgui("win2.resp",resp0)
guisetfocus("win2.resp")
While guitestkey(vk_escape)=0 And guitestkey(vk_return)=0
	guiscan
	Sleep 100
Wend
Sleep 100
guiscan
resp=guigettext("win2.resp")
guiclosewindow("win2")
Sleep 200
guiscan 
End Sub
Sub subnarbre
Dim As Integer i  	
Dim As Integer x,y
	resp=Str(narbre2)
	msg="number of trees : enter a number (100.."+Str(narbre)+")  last="+Str(narbre2)
	prompt(msg,resp)
	i=Val(resp)
	i=max2(100,min2(narbre,i))
	If i<>narbre2 Then
		narbre2=i
	If i<>narbre2 Then
		narbre2=i
	EndIf
	EndIf
End Sub
Sub subdistscale
Dim As Single x	
	resp=Str(distscale)
	msg="max distance scale : enter a number (0.3 low .. 3.0 high)  last="+Str(distscale)
	prompt(msg,resp)
	x=Val(resp)
	x=max(0.3,min(3.0,x))
	If x<>distscale Then
		distscale=x
	EndIf
End Sub
Dim Shared As Single scalex0=500
Dim Shared As Integer testscale=0
Sub subscalex
Dim As Single x
Dim As Integer i	
	guinotice "scalex="+Str(scalex)+"  kscalex00="+Str(kscalex00)+" kscalex="+Str(kscalex)
	guinotice "distmax="+Str(distmax)
	guinotice "ntown2="+Str(ntown2)
	Exit Sub 
	resp=Str(kscalex00)
	msg="map scalex : enter a number (100.0  .. 1000.0)%  last="+Str(kscalex00)
	prompt(msg,resp)
	x=Val(resp)
	x=max(100.0,min(1000.0,x))
	If Abs(x-kscalex00)>0.01 Then
		Var kx=x/kscalex00
		'scalex*=kx
		scalex0*=kx
		scalex=scalex0
		If testscale=1 Then scalex=scalex0/2
		xweb1-=1000000
		If imap>=4 Then
		   dmx000*=kx
		   dmy000*=kx
		   dmx00=dmx0
		   dmy00=dmy0
		   dmx0*=kx
		   dmy0*=kx
		   mx*=kx
		   my*=kx
		   mx0*=kx
		   my0*=kx
		   xtown*=kx
		   ytown*=kx
		   dxtown*=kx
		   dytown*=kx
		   For i=1 To itown4
		   	townhousex(i)=(townhousex(i)+dmx00)*kx-dmx0
		   	townhousey(i)=(townhousey(i)+dmy00)*kx-dmy0
		   	townhousedx(i)*=kx
		   	townhousedy(i)*=kx
		   	townhouseh(i)*=kx
		   Next
		   kscalex00=x
		   kscalex=kscalex00*Sqr(1200/x960)
		   dmx00=dmx0:dmy00=dmy0
			initterrain3
		Else 
		   kscalex00=x
		   kscalex=kscalex00*Sqr(1200/x960)
		   dmx00=dmx0:dmy00=dmy0		   
		   initterrain3
		EndIf
      initairport
      inittown
      'initterrainlines
      initarbres
      inithouses
      'initdomes
      initgrass
      'inittownjpg
      
	EndIf
End Sub
Sub subseashore()
If tseashore=0 Then
	confirm "draw coast seashore ?","confirm",resp
	If resp="yes" Then tseashore=1
Else
	confirm "hide coast seashore ?","confirm",resp
	If resp="yes" Then tseashore=0:stopsoundocean2()
EndIf
End Sub
Declare Sub resetaeroway()
Declare Sub resetmynode()
Declare Sub resetreverse()
Declare Function waitbusy() As Integer 
Sub subreset(ByVal nomsg As Integer=0)
Dim As Integer i	
tquitweb=1
If waitbusy()=0 Then tquitweb=0:Exit Sub
tquitweb=0
tloadwebtext2=2  
	If nomsg=0 Then
		confirm("resetnodes ?","confirm",resp)
		If resp="yes" Then
			resetaeroway()
			resetmxweb()
			resettownwaynode()
         resettownwaynode2()
         resetmynode()
         resetfuel()
         resetreverse()
         resettown40()

		itownp=0
      resetaeroway()
      resetmxweb()
      resettownwaynode()
      resetfuel()

         tloadwebtext2=0
         Exit Sub 
		EndIf
		/'confirm("resetnodes40 ?","confirm",resp)
		If resp="yes" Then
			resettown40()
         tloadwebtext2=0
			Exit Sub 
		EndIf '/
		confirm("reset all?","reset",resp)
	Else
		resp="yes"
	EndIf
	If resp="yes" Then
	   If planet=0 Or orbit=1 Then
	    If testworld=1 Then
	    	worldx=0:worldy=-145
	    	myworldx=worldx:myworldy=worldy
	    	If dmx0<0 Then dmx0=100000 Else dmx0=-100000
	    	dmy0=0
	    	mx=0:my=0:xweb=0:yweb=0:xweb1=0:yweb1=0
	    EndIf
		 dmx00=dmx0:dmy00=dmy0
		 dmx0=dmx000:dmy0=dmy000
		 If imap>=4 Then initterrain3
		 mx=0:my=0
		 mz=getterrainheight(mx,my)+mzh
		 mz1=mz:mzsol0=mz
	   EndIf
	   v=0
		o1=90:o2=0:o3=0
		volume=550:setvol
      
      If planet=1 Then
      	stationvie=5000
         stationx=0:stationy=0
         If orbit=1 Then
         	stationz=getterrainheight(stationx,stationy)+50000
         Else
         	stationz=0:smx0=100000:smy0=-100000
         EndIf
      	mx=stationx:my=stationy-800:mz=stationz+150
      	mz1=mz:o2=-7
      	mzsol0=getterrainheight(mx,my)+mzh
      	piste=0
	   EndIf
       
      dim as Single x,y
      For i=1 To nhorse 
        If i<=6 Then 
           x=-190+Rnd*700:y=-100+Rnd*700
        Else
  	        If i<=12 Then 
              x=Rnd*700:y=-100+Rnd*700
  	        Else 
  	           If i<=17 Then 	
                 x=300+Rnd*700:y=300+Rnd*700
              Else 
  	              If i<=23 Then  
                    x=1500+Rnd*500:y=1500+Rnd*500
  	              Else 
  	                 If i<=27 Then 	
                       x=1000+Rnd*500:y=-700+Rnd*500
  	                 Else 
                       x=700+Rnd*500:y=-30+Rnd*500
  	                 EndIf 	
  	              EndIf 	
  	           EndIf
  	        EndIf  
        EndIf
        horseo1(i)=Rnd*360
        horsex(i)=x
        horsey(i)=y
        horsez(i)=getterrainheight(x,y)
        setnodeposition(md2_nodes(md2ihorse(i)),x,y,horsez(i))
        setnoderotation(md2_nodes(md2ihorse(i)),0,0,horseo1(i))
      Next i  
		
		initboat()

      For i=1 To nship
	      airshipx(i)=mx-i*1200+4000:airshipy(i)=my+i*1000-4000:airshipz(i)=mz+200.0 
      Next
      
      target=0
      
      initcloud()

      resetaeroway()
      resetmxweb()
      resettownwaynode()
      resettownwaynode2()
      resetmynode()
      resetfuel()
      resetreverse()
      resettown40()

		itownp=0
      resetaeroway()
      resetmxweb()
      resettownwaynode()
      resetfuel()
	EndIf
	tloadwebtext2=0
End Sub
Sub submaxfps
Dim As Single x	
	resp=Str(maxfps)
	msg="max fps : enter a number (10 .. 100)  last="+Str(maxfps)
	prompt(msg,resp)
	x=Val(resp)
	x=max2(10,min2(100,x))
	If x<>maxfps Then
		maxfps=x
	EndIf
	Sleep 300:guiscan
	resp=Str(minfps)
	msg="min fps : enter a number (5 .. 12)  last="+Str(minfps)+"   initial=6"
	prompt(msg,resp)
	x=Val(resp)
	x=max2(5,min2(12,x))
	If x<>minfps Then
		minfps=x
	EndIf
End Sub
Sub subshadow
	If tshadow=0 Then 
		confirm("set shadow on ?","confirm",resp)
		If resp="yes" Then tshadow=1
	Else
		confirm("set shadow off ?","confirm",resp)
		If resp="yes" Then tshadow=0
	EndIf
End Sub
Sub subsmooth
Dim As Integer x
If imap>=4 Then 	
	resp=Str(ismooth)
	msg="smooth terrain : enter a number (0 .. 8)  last="+Str(ismooth)
	prompt(msg,resp)
	x=Val(resp)
	x=max2(0,min2(8,x))
	If x<>ismooth Then
		ismooth=x
		dmx00=dmx0:dmy00=dmy0
		initterrain3
	EndIf
Else 
   notice("smooth terrain : country map only !")
EndIf 	
End Sub
Sub subwave
Dim As Single x
Dim As Integer ix,iy
If imap>=4 Then 	
	resp=Str(kwave)
	msg="water wave height : enter a number (0.1 - 8.0)  last="+resp+Chr(13)+_  
	    "0.1=calm  1=normal  4=stormy  8=tempest"
	prompt(msg,resp)
	x=Val(resp)
	x=max(0.1,min(8.0,x))
	If x<>kwave Then
		kwave=x
	   For ix=-100 To 612
		  For iy=-100 To 612
		  	 If water(ix,iy)=1 Then terrain(ix,iy)=-60.0001
		  Next
      Next   
	EndIf
Else 
   notice("water wave height : country map only !")
EndIf 	
End Sub
Sub subnboat
Dim As Integer i  	
	resp=Str(nboat2)
	msg="number of boats : enter a number (4..12)  last="+resp
	prompt(msg,resp)
	i=Val(resp)
	i=max2(4,min2(12,i))
	If i<>nboat2 Then
		nboat2=i
	EndIf
End Sub
Sub subncloud
Dim As Integer i  	
	resp=Str(ncloud2)
	msg="number of clouds : enter a number (0..200)  last="+resp
	prompt(msg,resp)
	i=Val(resp)
	i=max2(0,min2(200,i))
	If i<>ncloud2 Then
		ncloud2=i
	EndIf
End Sub
Sub subncar
Dim As Integer i  	
	resp=Str(ncar2)
	msg="number of cars : enter a number (1.."+Str(ncar)+")  last="+resp
	prompt(msg,resp)
	i=Val(resp)
	i=max2(1,min2(ncar,i))
	If i<>ncar2 Then
	  ncar2=i
	  For i=1 To ncar 
	   If i>Int(1+ncar2*inearroad/400) Then'/15
	 	  ncarx(i)=-999999
	 	  ncarz(i)=-999999
	 	  ncariroad(i)=0
	   EndIf 
	  Next i
	EndIf
	Sleep 1000
	guiscan
	resp=Str(nship2)
	Var nship10=min2(nship,10)
	msg="number of planes : enter a number (1.."+Str(nship10)+")  last="+resp
	prompt(msg,resp)
	i=Val(resp)
	i=max2(0,min2(nship10,i))
	If i<>nship2 Then
	  nship2=i
	EndIf
End Sub
Sub sublevel
Dim As Integer i  	
	resp=Str(level)
	msg="level : enter a number 0..4 (0=easy,2=normal,4=hard) last="+resp
	prompt(msg,resp)
	i=Val(resp)
	i=max2(0,min2(4,i))
	If i<>level Then
		level=i
	EndIf
End Sub
/'Sub subcar()
Dim As Integer i
getcomboindex("win.car",i)
If i>0 Then'And i<>icartext Then
	icartext=i
	guideletetexture2(cockpit1text)
   If i=1 Then cockpit1text=guiloadtexture2("media/cockpits/honda.jpg",248)
   If i=2 Then cockpit1text=guiloadtexture2("media/cockpits/toyota.jpg",248)
   If i=3 Then cockpit1text=guiloadtexture2("media/cockpits/porsche.jpg",248)
   If i=4 Then cockpit1text=guiloadtexture2("media/cockpits/bmw.jpg",248)
   If i=5 Then cockpit1text=guiloadtexture2("media/cockpits/malibu.jpg",248)
   If i=6 Then cockpit1text=guiloadtexture2("media/cockpits/audi.jpg",248)
   If i=7 Then cockpit1text=guiloadtexture2("media/cockpits/mercedes.jpg",248)
   If i=8 Then cockpit1text=guiloadtexture2("media/cockpits/volvo.jpg",248)
   If i=9 Then cockpit1text=guiloadtexture2("media/cockpits/fiat.jpg",250)
   If i=10 Then cockpit1text=guiloadtexture2("media/cockpits/nissan.jpg",250)
   If i=11 Then cockpit1text=guiloadtexture2("media/cockpits/rover.jpg",250)
   If i=12 Then cockpit1text=guiloadtexture2("media/cockpits/police.jpg",250)
   initcar()
	'If carname="police" Then policedegats1=0:mypoliceobj1=mypoliceobj0
EndIf
guisetfocus("win.graph")
End Sub '/
Declare Sub subtypeautopilot()
Dim Shared As Integer tgetcombo1=1
Sub subcombo1()
Dim As Integer typeship0,airshipmove0,airshipvie00,i
	If tgetcombo1=1 Then getcomboindex("win.combo1",icar)
	If planet=1 And icar<>16 And icar<>17 And icar>5 Then
		icar=16:selectcomboindex("win.combo1",icar)
	EndIf
	Var car0=car
	If plane=0 Then v=0
	If icar=1 Then plane=0:car=0
	Var youdrive="you drive a "
	If Rnd<0.65 Then
	  If Rnd<0.5 Then 	
		youdrive="you enter a "
	  Else
		youdrive="you pilot a "
	  EndIf 	
	EndIf
	If icar=2 Then plane=1:car=1:icartext=11:myicar=icar:textspeak=youdrive+"Ford"
	If icar=3 Then plane=1:car=2:icartext=9:myicar=icar:textspeak=youdrive+"Fiat"
	If icar=4 Then plane=1:car=3:icartext=10:myicar=icar:textspeak=youdrive+"Nissan"
	If icar=5 Then plane=1:car=4:icartext=5:myicar=icar:textspeak=youdrive+"Chevy"'malibuchevy
	If icar=6 Then plane=1:car=5:icartext=13:myicar=icar:textspeak=youdrive+"Cadillac"
	'If icar=7 Then plane=1:car=0:typeavion=3
	'If icar=8 Then plane=1:car=0:typeavion=3
	'If icar=9 Then plane=1:car=0:typeavion=4
	'If icar=10 Then plane=1:car=0:typeavion=5
	If icar=7 Then plane=1:car=0:myiplane=icar:typeavion=6:textspeak=youdrive+"zero"
	If icar=8 Then plane=1:car=0:myiplane=icar:typeavion=12:textspeak=youdrive+"c150" 
	If icar=9 Then plane=1:car=0:myiplane=icar:typeavion=13:textspeak=youdrive+"ballon"
	If icar=10 Then plane=1:car=0:myiplane=icar:typeavion=14:textspeak=youdrive+"737"
	If icar=11 Then plane=1:car=0:myiplane=icar:typeavion=15:textspeak=youdrive+"copter"
	'If icar=12 Then plane=1:car=0:typeavion=6
	'If icar=13 Then plane=1:car=0:typeavion=7
	'If icar=14 Then plane=1:car=0:typeavion=8
	'If icar=15 Then plane=1:car=0:typeavion=9
	'If icar=16 Then plane=1:car=0:typeavion=10 'space1
	'If icar=17 Then plane=1:car=0:typeavion=11 'space2
	'If icar=18 Then plane=2:car=0:typeavion=2
	If plane>=1 Then
		If ((car>0 And car0=0)Or (car=0 And car0>0))and tgetcombo1=0 Then
			If car0=0 Then
				to1plane=to1:to2plane=to2
				to1=to1car:to2=to2car
			Else 
				to1car=to1:to2car=to2
				to1=to1plane:to2=to2plane
			EndIf
		EndIf
   	tgetcombo1=1
		If topview>0 Then mz=mzsol0+500:topview=0
		initavion
		If cartext<>0 Then guideletetexture(cartext)
      If car=1 Or (car=0 And typeavion=1) Then 
 	     cartext=guiloadtexture("objects/car.jpg",240,245)
      Else
        If car=2 Or (car=0 And typeavion>=7) Then 	
 	       cartext=guiloadtexture("objects/car2.jpg",240,245)
        Else 
 	       cartext=guiloadtexture("objects/car3.jpg",240,245)
        EndIf 	
      EndIf
      If car>=1 Then volant=volant Mod 3
      If (icar<=4 And planet=1) Then typeavion=10
      typeship0=1:airshipmove0=1:airshipvie00=300
      If (icar<=4 And planet=0) Then typeavion=6'2 
      If typeavion=1 Then typeship0=0:airshipmove0=1:airshipvie00=300      
      If typeavion=2 Then typeship0=1:airshipmove0=1:airshipvie00=300       
      If typeavion=3 Then typeship0=6:airshipmove0=1:airshipvie00=300       
      If typeavion=4 Then typeship0=7:airshipmove0=1:airshipvie00=300       
      If typeavion=5 Then typeship0=8:airshipmove0=1:airshipvie00=300 
      If typeavion=6 Then typeship0=10:airshipmove0=1:airshipvie00=300 
      If typeavion=7 Then typeship0=5:airshipmove0=1:airshipvie00=300 
      If typeavion=8 Then typeship0=9:airshipmove0=1:airshipvie00=400 
      If typeavion=9 Then typeship0=11:airshipmove0=1:airshipvie00=400 
      If typeavion=10 Then typeship0=12:airshipmove0=1:airshipvie00=400 
      If typeavion=11 Then typeship0=13:airshipmove0=1:airshipvie00=400 
      If typeavion=12 Then typeship0=10:airshipmove0=1:airshipvie00=300 
      If typeavion=13 Then typeship0=10:airshipmove0=1:airshipvie00=300 
      If typeavion=15 Then typeship0=10:airshipmove0=1:airshipvie00=300 
      For i=4 To 6
      	typeship(i)=typeship0
			airshipmove(i)=airshipmove0
			airshipvie0(i)=airshipvie00
			If plane=2 Then 
				airshipx(i)+=avionx-mx
				airshipy(i)+=aviony-my
			EndIf
      Next
	Else
		stopsoundavion
	EndIf
	tgetcombo1=1
	tourelle=0
   If (tautopilot=1 Or 1) And plane>0 And car>0 And volant>0 Then
   	showgui("win.typeauto")
   	typeautopilot-=1
   	subtypeautopilot()
   Else
   	hidegui("win.typeauto")
   EndIf
   If plane>=0 And car>=0 And volant>=0 Then
   	showgui("win.gps")
   Else
   	hidegui("win.gps")
   EndIf
	guisetfocus("win.graph")
End Sub
Sub subfoot()
If plane=0 Then icar=myicar:volant=1':volume=1000'mycar'car3
If plane=1 And car<>0 Then
	icar=myiplane:volant=6'5'8c150'7zero'icar=11
	'If icar=9 Then volant=3
EndIf
If plane=1 And car=0 Then icar=1:o2=0'foot		     
selectcomboindex("win.combo1",icar)
Sleep 100
tgetcombo1=0
subcombo1()	
tgetcombo1=1
avgo1=o1
End Sub
Sub subfoot2()
If plane=0 Then Exit Sub
If car<>0 Then
	icar+=1:If icar>6 Then icar=2
	volant=1
	myicar=icar
Else
	icar+=1:If icar>11 Then icar=7
	volant=6
	If icar=9 Then volant=3:v=min(7.0,v)
	myiplane=icar
EndIf
selectcomboindex("win.combo1",icar)
Sleep 100
avgo1=o1
tgetcombo1=0
subcombo1()	
tgetcombo1=1
End Sub
Sub subsolauto()
solauto=1
If solautotext(1)<>0 Then
	guideletetexture(solautotext(1))
	solautotext(1)=0
EndIf
If planet=1 And FileExists("addon/"+addon(imap)+"texture.jpg") Then
	solautotext(1)=guiloadtexture("addon/"+addon(imap)+"texture.jpg")
EndIf
If solautotext(1)=0 Then solautotext(1)=guiloadtexture("media/herbe2.jpg")
If solautotext(2)=0 Then solautotext(2)=guiloadtexture("media/desert.jpg")'2
If solautotext(3)=0 Then solautotext(3)=guiloadtexture("media/desert2.jpg")
If mapauto=0 Then
	soltexture0=solautotext(1)
	If (imapsol-2)=5 Then soltexture0=solautotext(3)
	If (imapsol-2)=6 Then soltexture0=solautotext(2)
EndIf
guisetfocus("win.graph")
End Sub
Sub subsol
  getcomboindex("win.sol",isol)
  If isol=6 Then subsolauto():Exit Sub
  solauto=0
  If soltexture<>0 Then guideletetexture(soltexture)
  If isol=1 Then soltexture=guiloadtexture("media/sol.jpg")
  If isol=2 Then soltexture=guiloadtexture("media/herbe.jpg")
  If isol=3 Then soltexture=guiloadtexture("media/herbe2.jpg")
  If isol=4 Then soltexture=guiloadtexture("media/desert2.jpg")
  If isol=5 Then soltexture=guiloadtexture("media/desert.jpg")
  guisetfocus("win.graph")
End Sub
Sub subtown
  getcomboindex("win.town",itown)
  guisetfocus("win.graph")
End Sub
Sub substars()
confirm("change stars ?","confirm",resp)
If resp="yes" Then
  istars+=1:If istars>4 Then istars=1	
  If startext<>0 Then guideletetexture(startext)
  startext=guiloadtexture("media/stars"+Str(istars)+".jpg",80)
  If starspacetext2<>0 Then guideletetexture(starspacetext2):starspacetext2=0
  myglbindtexture(gl_texture_2d,@starspacetext2)
EndIf 
End Sub 
Sub submapauto()
mapauto=1
If imapsol<>4 Or maptexture=0 or planet=1 Then
   If maptexture<>0 Then guideletetexture(maptexture)
   If planet=0 Or FileExists("addon/"+addon(imap)+"texture.jpg")=0 Then
   	maptexture=guiloadtexture("media/sol.jpg")'map"+Str(2)+".jpg")
   Else 
   	maptexture=guiloadtexture("addon/"+addon(imap)+"texture.jpg")
   EndIf
EndIf    
If maptexture2=0 Then 
   maptexture2=guiloadtexture("media/sol.jpg")'map"+Str(3)+".jpg")		
EndIf
If maptexture3=0 Then 
   maptexture3=guiloadtexture("media/sol.jpg")'map"+Str(7)+".jpg")		
EndIf
If maptexture4=0 Then 
   maptexture4=guiloadtexture("media/sol.jpg")'map"+Str(6)+".jpg")		
EndIf
If maptexture5=0 Then 
   maptexture5=guiloadtexture("media/sol.jpg")'map"+Str(5)+".jpg")		
EndIf	
mapautotext=maptexture
worldname="world"'guigettext("win.map")
If worldname="world" Then testworld=1 Else testworld=0
If worldname<>"world" Then getmapworldx()
'If imap<=40 Then mapsol(imap)=imapsol
guisetfocus("win.graph")	
End Sub
Sub submapsol
'getcomboindex("win.mapsol",imapsol)
imapsol=7+3
If imapsol=(7+3) Then submapauto():Exit Sub
mapauto=0
If maptexture<>0 Then guideletetexture(maptexture)
If imapsol>1 Then 
  maptexture=guiloadtexture("media/sol.jpg")'map"+Str(imapsol-2)+".jpg")
Else 
  maptexture=guiloadtexture("media/sol.jpg")'map"+Str(2)+".jpg")
EndIf 
If imap<=40 Then mapsol(imap)=imapsol
If solauto=1 Then subsolauto()
guisetfocus("win.graph")
End Sub 
'Dim Shared As Integer skyauto,iskyauto,wclouds,tsubciel
Sub subciel
Dim As uint i
  getcomboindex("win.ciel",i)
  If i>0 Then iciel=i:skyauto=0
  krain0=0.1
  If iciel>=2 And iciel<=8 Then 
  	krain0=iciel*0.05
   If cieltext<>0 Then guideletetexture(cieltext)
   cieltext=guiloadtexture("media/ciel"+Str(iciel-2)+".jpg")
  ElseIf iciel=9 Then
  	krain0=0.6
   If skydometext<>0 Then guideletetexture(skydometext)
   skydometext=guiloadtexture("media/skydome1.jpg")
  ElseIf iciel=10 Then
  	krain0=1.2
  	soundthunder()
   If skydometext<>0 Then guideletetexture(skydometext)
   skydometext=guiloadtexture("media/skydome2.jpg")
  ElseIf iciel=11 Then
  	krain0=0.3
   If skydometext<>0 Then guideletetexture(skydometext)
   skydometext=guiloadtexture("media/philo_sky2.jpg")
  ElseIf iciel=12 Then
  	krain0=0.6
   If skydometext<>0 Then guideletetexture(skydometext)
   skydometext=guiloadtexture("media/philo_sky3.jpg")
  ElseIf iciel=13 Then
  	krain0=1.2
  	soundthunder()
   If skydometext<>0 Then guideletetexture(skydometext)
   skydometext=guiloadtexture("media/philo_sky5.jpg")
  ElseIf iciel=14 Then
  	skyauto=1
  	Var iskyauto0=iskyauto
  	If wclouds<20 Then
  		iskyauto=1:krain0=0.1
  	ElseIf wclouds<40 Then
  		iskyauto=2:krain0=0.2
  	ElseIf wclouds<60 Then
  		iskyauto=3:krain0=0.4
  	ElseIf wclouds<80 Then
  		iskyauto=4:krain0=0.6
  	ElseIf wclouds<180 Then
  		iskyauto=5:krain0=1.2
  	EndIf
  	If whumidity>0 And whumidity<90 Then krain0*=0.5
  	If whumidity>0 And whumidity<70 Then krain0*=0.5
  	If whumidity>0 And whumidity<50 Then krain0*=0.5
  	If whumidity>0 And whumidity<30 Then krain0*=0.5
  	'guinotice Str(krain0)+"  "+Str(whumidity)+" "+Str(wclouds)
  	If iskyauto<>iskyauto0 Then
  		If iskyauto=4 Then soundthunder()
  		If iskyauto=5 Then soundthunder()
      If skydometext<>0 Then guideletetexture(skydometext)
  		If iskyauto=1 Then skydometext=guiloadtexture("media/skydome1.jpg")
  		If iskyauto=2 Then skydometext=guiloadtexture("media/philo_sky3.jpg")
  		If iskyauto=3 Then skydometext=guiloadtexture("media/philo_sky2.jpg")
  		If iskyauto=4 Then skydometext=guiloadtexture("media/skydome2.jpg")
  		If iskyauto=5 Then skydometext=guiloadtexture("media/philo_sky5.jpg")
  	EndIf
  EndIf
  If skyauto=0 Then iskyauto=0
  guisetfocus("win.graph")
End Sub 
'Dim Shared As uint x960=1200
'Dim Shared As UShort map2(1 To x960,1 To x960)
Dim Shared As Short map2(1 To x960,1 To x960)
Dim Shared As UByte map0(1 To x960,1 To x960)
ReDim Shared As Short map(1 To x960,1 To x960)
Dim Shared As Short dmap(1 To x960)
Sub getmap00
Dim As Integer i,j,k  	
Dim As Integer file 
Dim As String filename="media/heightmap1200x1200.bin"
file = FreeFile        
If Open ( filename For binary access read as #file) <> 0 Then
	notice "error open file "+filename
	Close #file
Else 
	Get #file,,map2()
	Close #file
EndIf
Dim As UShort aux=&h7fff'255+256+512+1024
Dim As Short x
For i=1 To x960
	For j=1 To x960 
      x=map2(i,j)
      If x>=0 Then
      	map(i,j)=(x)'/2.0
      Else
      	map(i,j)=0
      EndIf
	Next
Next
'ReDim As Short map2(1,1)
End Sub 
Sub getmap0
Dim As Integer i,j  	
Dim As Integer file 
Dim As String filename="media/heightmap1200x1200.bin"
file = FreeFile        
If Open ( filename For binary access read as #file) <> 0 Then
	notice "error open file "+filename
	Close #file
Else 
	Get #file,,map2()
	Close #file
EndIf
aux=0
For i=1 To x960
	For j=1 To x960 
		map(i,j)=map2(i,j)And 255
	Next
Next
'ReDim As Short map2(1,1)
file = FreeFile
Open "media/heightmapbyte1200x1200.bin" for binary as #file
Put #file,1,map()
Close #file
End Sub
Dim Shared As Integer dh0=0
Sub setdhmaree()
If Abs(timeh)<0.0001 Then timeh=Val(Left(Time,2))+Val(Mid(Time(),4,2))/60
If Abs(heure)>0.0001 Then timeh=heure
If Abs(dayjj)<0.0001 Then dayjj=Val(Mid(Date,4,2))+Val(left(Date,2))*365/12+Val(Right(date,4))*365
dhmareemax=-3.3'0'3.7
dhmaree=dhmareemax'*0.5*(1.001+cos((timeh-dayjj*24/28-15)*degtorad*360/24))
/'If planet=1 Then
	if addon(imap)="Moon" Then
		dhmaree=-200
	Else
		If dhmaree0<-99999 Then 
			dhmaree=-14
		Else
			dhmaree=dhmaree0
		EndIf
	EndIf
	dhmareemax=max(dhmareemax,dhmaree)
EndIf '/
End Sub
Sub testmaree()
If Timer<(timemaree-99) Then timemaree=Timer-3000
If Abs(timeh-heure)>0.5 And Timer>(timemaree+2000) Then
	timemaree=Timer
	timeh=heure
	setdhmaree()
	'initterrain2()
EndIf
End Sub
Sub loadplanetmap( ByRef filename As String)
	                     'bmp jpg gif ico max 4000x2000
Dim As hbitmap hbmp,hbmp2
Dim As hdc bmpdc,bmp2dc
Dim As uint x,y,bmpx,bmpy,itexture
Dim As Any Ptr bmpbits
Const ScrCopy = &HCC0020
'If guiwindc0=0 Then guiwindc0=getdc(0)
'guiwindc0=0'guiopenglwindc
'hbmp=guiloadbmpdib("bmp/bmp256x256.bmp")
If FileExists(filename)=0 Then Exit Sub 
hbmp2=guiloadimage(filename)
bmp2dc=createcompatibleDC(guiwindc0)
selectobject(bmp2dc,hbmp2)
guigetbmpXY(bmp2dc,x,y)
hbmp=guicreateDIBbmp(x,y)
bmpbits=guigetbmpdibbits(hbmp)
'guinotice("bmpbits "+Str(bmpbits))
bmpdc=createcompatibleDC(guiwindc0)
selectobject(bmpdc,hbmp)
guigetbmpXY(bmpdc,bmpx,bmpy)
'guinotice("x="+Str(x)+"  y="+Str(y)+"  bmpx="+Str(bmpx)+" bmpy="+Str(bmpy))
'SetStretchBltMode(bmpdc,COLORONCOLOR )
'StretchBlt(bmpdc, 0, 0, bmpx,bmpy, bmp2dc, 0, 0, x,y, ScrCopy)
bitblt(bmpdc,0,0,bmpx,bmpy,bmp2dc,0,0,srccopy)
Dim As uint pix,k:Dim As Integer i,j,r,g,b,ix,iy:Dim As Single dx,dy
ReDim As uint picbits(1 To bmpx*bmpy)
GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
deletedc(bmpdc)
deletedc(bmp2dc)
deleteobject(hbmp2)
deleteobject(hbmp)
x960=max2(bmpx,bmpy)
x960=max2(1200,min2(7200,x960))
ReDim As Short map(1 To x960,1 To x960)
For i=1 To x960
	'ix=Int(((i-1)/x960)*bmpy)*bmpx
	dx=(((i-1)/x960))
	'dx=(1+Sin((dx-0.5)*2.97)/Sin(2.98/2))*0.5
   ix=Int(dx*bmpy)*bmpx
   If addon(imap)="Moon" Then 
	  For j=1 To x960
		 iy=Int(((j-1)/x960)*bmpx)
	    pix=picbits(1+ix+iy)
	    r=(pix Shr 16)And 255
	    g=(pix Shr 8) And 255
	    b=pix And 255
	    'map(i,j)=max2(-4000,min2(4000,(r-b)*(255-g)/16))
	    map(i,j)=max2(-200,min2(4000,(r+256-g*0.5-b)*4))+14
	  Next
	Else
	  For j=1 To x960
		 iy=Int(((j-1)/x960)*bmpx)
	    pix=picbits(1+ix+iy)
	    r=(pix Shr 16)And 255
	    g=(pix Shr 8) And 255
	    b=pix And 255
	    map(i,j)=max2(-200,min2(4000,(r+g+b)*4))+14
	  Next
   EndIf  
Next
ReDim As uint picbits(1)
End Sub 
Sub getmap
Dim As Integer file,i,j,k 
Dim As String filename="",ficin
dh0=0:dhmaree=0
worldx=0:worldy=0
If imap=4 Then filename="media/heightmapbyte1200x1200_world.bin":dmx0=-114000:dmy0=75000
If imap=5 Then filename="media/heightmapbyte1200x1200_france.bin":dmx0=-160000:dmy0=-180000
If imap=6 Then filename="media/heightmapbyte1200x1200_england.bin":dmx0=100000:dmy0=-78000
If imap=7 Then filename="media/heightmapbyte1200x1200_yougo.bin":dmx0=17000:dmy0=-50000
If imap=8 Then filename="media/heightmapbyte1200x1200_grece.bin":dmx0=31000:dmy0=-390000
If imap=9 Then filename="media/heightmapbyte1200x1200_israel.bin":dmx0=-270000:dmy0=7000
If imap=10 Then filename="media/heightmapbyte1200x1200_japan.bin":dmx0=31000:dmy0=-405000
If imap=11 Then filename="media/heightmapbyte1200x1200_vietnam.bin":dmx0=91000:dmy0=-513000
If imap=12 Then filename="media/heightmapbyte1200x1200_hawai.bin":dmx0=-114000:dmy0=75000

addonname=""
If FileExists("addon/"+addon(imap)+".bin")<>0 Then
	filename="addon/"+addon(imap)+".bin"
	addonname=Trim(addon(imap))
	dmx0=0:dmy0=0
	If FileExists("addon/"+addon(imap)+".txt") Then 
      file = FreeFile        
      Open "addon/"+addon(imap)+".txt" For Input As #file
      If Not Eof(file) Then Line Input #file,ficin:dmx0=Val(ficin)		
      If Not Eof(file) Then Line Input #file,ficin:dmy0=Val(ficin)
      If Not Eof(file) Then Line Input #file,ficin:dh0=Val(ficin)
      If Not Eof(file) Then Line Input #file,ficin:worldx=Val(ficin)
      If Not Eof(file) Then Line Input #file,ficin:worldy=Val(ficin)
      Close #file		
	EndIf
EndIf
If FileExists("addon/"+addon(imap)+".bi2")<>0 Then
	filename="addon/"+addon(imap)+".bi2"
	addonname=Trim(addon(imap))
	dmx0=0:dmy0=0
	If FileExists("addon/"+addon(imap)+".txt") Then 
      file = FreeFile        
      Open "addon/"+addon(imap)+".txt" For Input As #file
      If Not Eof(file) Then Line Input #file,ficin:dmx0=Val(ficin)		
      If Not Eof(file) Then Line Input #file,ficin:dmy0=Val(ficin)
      If Not Eof(file) Then Line Input #file,ficin:dh0=Val(ficin)
      If Not Eof(file) Then Line Input #file,ficin:worldx=Val(ficin)
      If Not Eof(file) Then Line Input #file,ficin:worldy=Val(ficin)
      Close #file		
	EndIf
EndIf
planet=0
If FileExists("addon/"+addon(imap)+"heightmap.jpg")<>0 Then
	filename="addon/"+addon(imap)+"heightmap.jpg"
	addonname=Trim(addon(imap))
	planet=1
	dmx0=0:dmy0=0:dhmaree0=-999999:rplanetsat=1.0
	If FileExists("addon/"+addon(imap)+".txt") Then 
      file = FreeFile        
      Open "addon/"+addon(imap)+".txt" For Input As #file
      If Not Eof(file) Then Line Input #file,ficin:rplanetsat=Val(ficin)
      If Not Eof(file) Then Line Input #file,ficin:dhmaree0=13'Val(ficin)
      Close #file		
	EndIf
EndIf
If FileExists(filename)=0 Then
	addonname=""
	imap=5:filename="media/heightmapbyte1200x1200_france.bin":dmx0=-160000:dmy0=-180000
EndIf
If imap<=40 And imapsol<>(7+3) Then
	imapsol=mapsol(imap)
   selectcomboindex("win.mapsol",imapsol)
	submapsol()
EndIf
setdhmaree()
file = FreeFile        
If Open ( filename For binary access read as #file) <> 0 Then
	notice "error open file "+filename
	Close #file
ElseIf planet=1 Then
	Close #file
	loadplanetmap(filename)
	Exit Sub 
Else
	Var lenfile=Lof(file)
	If lenfile=1200*1200 Then
		x960=1200
		ReDim As Short map(1 To x960,1 To x960)
	Else
		'If dh0=0 Then dh0=7
		x960=min2(7200,Sqr(lenfile\2))
		ReDim As Short map(1 To x960,1 To x960)
		Get #file,,map()
		Close #file
		Exit Sub 
	EndIf
	If imap<>4 Then
		Get #file,,map0()
	Else
		For i=1 To x960
			For j=1 To x960
				map0(i,j)=12
			Next
		Next
	EndIf
	Close #file
EndIf
Dim As Integer h,h0,dhh,dh,dh0,waterh,dhh0,dh1=128,dh2=128
Dim As Integer waterh1=0
For i=1 To 1
	h=-9999:h0=-9999:dhh=0:dh=0:dh0=0:waterh=0
	For j=1 To x960
		h0=h
		h=map0(i,j)
		dh=h-h0
		If dh>dh1 Then
			If dhh>-1200 And j>1 Then dhh-=256
		ElseIf dh<-dh2 Then
			If dhh<1200 And j>1 Then dhh+=256
		EndIf
		If dhh<=0 And (h<14 and h0<14) Then
			'waterh1=dhh
		EndIf
		If waterh1>dhh Then waterh1=dhh
		If i=1 Then dmap(j)=dhh
	Next
Next
For i=1 To x960
	h=-9999:h0=-9999:dh=0:dh0=0:waterh=0
	dhh=0
	For j=1 To x960
		h0=h
		h=map0(i,j)
		dh=h-h0
		If dh>dh1 Then
			If dhh>-1 And j>1 Then dhh-=256
		ElseIf dh<-dh2 Then
			If dhh<1200 And j>1 Then dhh+=256
		EndIf
		If dhh<=0 And (h<14 Or h0<14) Then waterh=4
		If waterh>0 Then
			waterh-=1:dhh=0
			map2(i,j)=-9999
		Else
   		map2(i,j)=dhh
		EndIf
	Next
Next
For i=1 To x960
	h=-9999:h0=-9999:dh=0:dh0=0:waterh=0
	dhh=max2(dmap(i)-waterh1,0)
	For j=1 To x960 
		h0=h
		h=map0(j,i)
		dh=h-h0
		If dh>dh1 Then
			If dhh>-1 And j>1 Then dhh-=256
		ElseIf dh<-dh2 Then
			If dhh<1200 And j>1 Then dhh+=256
		EndIf
		If dhh<=0 And (h<14 Or h0<14) Then waterh=4
		If waterh>0 Then
			waterh-=1:dhh=0
			map(j,i)=h
		ElseIf map2(j,i)<-9990 Then 
			dhh=0
			map(j,i)=h
		Else 
			dhh=min2(dhh,map2(j,i))
			map(j,i)=h+max2(dhh,0)'min2(h+dhh,map2(j,i))
		EndIf 
	Next
Next '/
'ReDim As Short map2(1,1)
End Sub 
Dim Shared As Single mapx0,mapy0,worldx00=-9999999,worldy00,worldx000=-9999999,worldy000
'Dim Shared As Integer tmapchanged=0
Sub terraintomap()
Dim As Integer ix=0,iy=0,i,j,k,l
Dim As Single i0,j0,kx,ky,h,x,y,xx,yy
tmapchanged=1
getlockterrain2()
getlockterrainbmp2()
   For i=-100 To 612
   	For j=-100 To 612
	      x=i-256:y=j-256
         xx=x*scalex'+dmx0
         yy=y*scalex'+dmy0
   		setwebwater3(i,j,xx,yy)
   	Next
   Next
   ix=0:iy=0
	'i0=(x960*0.5+1200*(ix-256+dmx0/scalex)/(k8*512))
	'j0=(x960*0.5-1200*(iy-256+dmy0/scalex)*(scalex/scaley)/(k8*512))
	i0=(x960*0.5+1200*(ix-256)/(k8*512))+0.5
	j0=(x960*0.5-1200*(iy-256)*(scalex/scaley)/(k8*512))+0.5
	kx=(1200/(k8*512))
	ky=(-1200*(scalex/scaley)/(k8*512))'k8=6
	'If (Abs(worldx-worldx00)+Abs(worldy-worldy00))>0.1 Then 
	'  worldx00=worldx:worldy00=worldy
	  For i=1 To x960
		For j=1 To x960
			map(i,j)=0
		Next
	  Next
	'EndIf
	Var waterh0=-60+dhmareemax,x962=x960/2
	For ix=-100 To 612
		For iy=-100 To 612
			i=(i0+kx*ix)
			j=(j0+ky*iy)
			i=x962+2*(i-x962)
			j=x962+2*(j-x962)
			If i>1 And i<x960 And j>1 And j<x960 Then
		      'h=map(i,j)
		      'If (h-74+dh0)>(-60+dhmareemax) Then
				h=terrain(ix,iy)
				'If water(ix,iy)=0 Then h+=0.1
				'map(i,j)=-60+dhmareemax+75-dh0
				If h>waterh0 Then
					h=h+74-dh0+1
				Else
					h=0'map(i,j)=0
				EndIf
				For k=i To i+1
					For l=j To j+1
				   	map(k,l)=h
					Next
				Next
			EndIf
		Next
	Next 
	freelockterrainbmp()
	freelockterrain()
End Sub
Sub initterrain2
'If tinittown=2 Then Sleep 4000
Dim As Integer ix,iy,z00,z10,z01,z11,jx,jy,ii,jj
Dim As Single aux,i,j,dx,dy,h,hh,hh1,hh2,hh3,hh4,alt
	If planet=0 Then scaley=scalex Else scaley=(scalex*1.5)'2
	planetdxmax=x960*0.5*(k8*512)*scalex/1200-12000
	planetdymax=x960*0.5*(k8*512)*scaley/1200-12000*scaley/scalex
	For ix=-100 To 612
		For iy=-100 To 612
			i=(x960*0.5+1200*(ix-256+dmx0/scalex)/(k8*512))
			j=(x960*0.5-1200*(iy-256+dmy0/scalex)*(scalex/scaley)/(k8*512))
			'jx=Int(ix+(dmx0/scalex)+512000)Mod 512
			'jy=Int(iy+(dmy0/scalex)+512000)Mod 512
			'While i<1:i+=x960-1:Wend
			'While i>x960-1:i-=x960-1:Wend
			'While j<1:j+=x960-1:Wend
			'While j>x960-1:j-=x960-1:Wend
			If i>1 And i<x960 And j>1 And j<x960 Then 
			  ii=Int(i)
			  dx=i-ii
			  jj=Int(j)
			  dy=j-jj
			  z00=map(jj,ii)
			  z10=map(jj,ii+1)
			  z01=map(jj+1,ii)
			  z11=map(jj+1,ii+1)
           h=z00*(1-dx)*(1-dy)+z10*(dx)*(1-dy)+z01*(1-dx)*dy+z11*dx*dy
			Else 
			  h=0	
			EndIf
			terrain(ix,iy)=h
		Next
	Next
   Dim As Integer iaux
   iaux=0	
   While iaux<ismooth
  	 iaux+=1
	 For ix=-100 To 612
		For iy=-100 To 612
			terrain2(ix,iy)=terrain(ix,iy)
		Next
	 Next 	
	 For ix=-100+1 To 612-1
		For iy=-100+1 To 612-1
	      terrain(ix,iy)=(terrain2(ix,iy)*7+terrain2(ix-1,iy)+terrain2(ix+1,iy)+_
	                       terrain2(ix,iy-1)+terrain2(ix,iy+1))/11		
		Next
	 Next
   Wend 
   setdhmaree()
   'waterz=(-60+dhmaree+0.01)*scalez
   waterz0=(-60)*scalez
   waterz0=min(waterz,waterz0)
	For ix=-100 To 612
		For iy=-100 To 612
			jx=Int(ix+(dmx0/scalex)+512000)Mod 512
			jy=Int(iy+(dmy0/scalex)+512000)Mod 512
			h=terrain(ix,iy)
         terrain(ix,iy)=h-74+dh0
         If terrain(ix,iy)>(-60+dhmaree) Then
           alt=(h-74)*scalez
           hh=1.0:hh1=1.0:hh2=0:hh3=0:hh4=0
           If alt>1800 Then hh=min(1.5,1.0+(alt-1800)/400)
           If alt>2000 Then hh1=min(3.5,1.0+(alt-2000)/400)
           If alt>3000 Then hh2=0.7
           If h<(24-dh0) Then hh3=min(0.32,(24-dh0-h)/24)
           If h<(14-dh0+dhmareemax) Then
           	  If planet=0 Then 
           	  	  hh4=0.34:hh1=0:hh2=0.27:hh3=0
           	  Else 
           	  	  hh=0.7:hh1=0.7:hh2=0.0:hh3=0
           	  EndIf
           EndIf
           terraincolor(ix,iy).x=min(1.0,terraincolor0(jx,jy).x*hh+hh2+hh4)
           terraincolor(ix,iy).y=min(1.0,terraincolor0(jx,jy).y*hh1+hh2+hh3+0.04)
           terraincolor(ix,iy).z=min(1.0,terraincolor0(jx,jy).z*hh1+hh2)
         ElseIf terrain(ix,iy)>(-60) Then 
           'terrain(ix,iy)=-60.0001+dhmaree	
		     terraincolor(ix,iy).z=1
		     terraincolor(ix,iy).y=0.2
		     terraincolor(ix,iy).x=0.2
         Else
           terrain(ix,iy)=-60.0001	
		     terraincolor(ix,iy).z=1
		     terraincolor(ix,iy).y=0.2
		     terraincolor(ix,iy).x=0.2
         EndIf 
			terrain2(ix,iy)=terrain(ix,iy)
		   'aux=max(aux,terrain(ix,iy))
		Next
	Next
	'notice Str(aux)
	For ix=-100+1 To 612-1
		For iy=-100+1 To 612-1
			water(ix,iy)=1
		Next
	Next
	For ix=-100+1 To 612-1
	  For iy=-100+1 To 612-1
		  For jx=-1+ix To 1+ix
		  	For jy=-1+iy To 1+iy
			  If terrain(jx,jy)>=(-60+dhmaree) Then
			     water(ix,iy)=0
			     Exit For,For
			  EndIf		  		
		  	Next
		  Next
	  Next
	Next
   For ix=0 To 512
	  For jx=0 To 512
        terraincolory0(ix,jx)=terraincolor(ix,jx).y
	  Next
   Next 
	'If mapauto=1 Then setmapautotextures()
   
   waterz0=(-60)*scalez
   'setseashore()
End Sub
sub setseashore()
Dim As Integer i,j,k,l,iz,izz
Dim As Single x,y,z
waterz0=(-60)*scalez
End Sub
Function disttown(x As Single,ix As Integer=0,iy As Integer=0)As Single 
Dim As Single i=1
Dim As Single scale=8*1200/x960
If worldbmp=0 Then Return x
	   'Var k8=6
      'Var aux=(8/40)/(4*k8*512*scalex)  
	   mapautoix=535+worldx+(2*(iy-x960/2)/x960)*(8/(40*scale))*535
	   mapautoiy=276+worldy+(2*(ix-x960/2)/x960)*(8/(40*scale))*276*2
  		Var pix=Point(mapautoix*750/535,mapautoiy*(750/2)/276,worldbmp)
		Var r=pix Shr 16
		Var g=(pix Shr 8)And 255
		'Var b=pix And 255
		If Not(r<35 And g<35)Then 'not water
			If (r>230 And g>230) Then 
			   i=8
			ElseIf (r>180 And g>180) Then
				i=4'4
			ElseIf (r>130 And g>130) Then
				i=2'3
			ElseIf (r>90 And g>90) Then
				i=1.4'2
			Else 	
				i=1
			EndIf 
		Else
			i=1
		EndIf
Return Sqr(x)*Sqr(i)
End Function
Sub initairport2()
Dim As Integer i,j,k,h,h1,test
Randomize(imap*100)
nairport2=0
Exit Sub 
airporty(0)=-999
For i=30 To x960-30
	For j=30 To x960-30
		h=map(i,j)
		If (h-74+dh0)>(-60+dhmareemax) Then
			If h=map(i,j+1) And h=map(i,j-1) Then
				If h=map(i+1,j) And h=map(i+1,j+1) And h=map(i+1,j-1) Then
					'If x960=1200 Or (h=map(i-1,j) And h=map(i-1,j+1) And h=map(i-1,j-1)) Then
						test=0
						Var k70=350*(disttown(x960/1200,i,j))'^0.7)
						For k=nairport2 To 1 Step -1
							If Abs(airporty(k)-i)<k70 Then
								If Abs(airportx(k)-j)<k70 Then
									j=max2(j,airportx(k)+k70-1)
									test=1:Exit For
								EndIf
							EndIf
						Next k
						If test=0 And nairport2<nairport Then
							nairport2+=1
							airportx(nairport2)=j
							airporty(nairport2)=i
							airportz(nairport2)=(h-74+dh0)*scalez'+68.5
						   'If h=map(i+2,j) And h=map(i+2,j+1) And h=map(i+2,j-1) Then
							'	airporttype(nairport2)=3+Int(Rnd*2.9) '3pistes
						   If h=map(i-1,j) Then 'And h=map(i-1,j+1) Then
								airporttype(nairport2)=6+Int(Rnd*1.9) '2pistes cross
						   Else
								airporttype(nairport2)=1+Int(Rnd*1.4) '1piste
						   EndIf
						   'airporttype(nairport2)=7
						   Select Case airporttype(nairport2)
						   	Case 1,3,6
						   		airportz(nairport2)+=68.5 'tower
						   		airportvie(nairport2,1)=200
						   		airportr(nairport2)=50
						   		airportntower(nairport2)=1
						   	Case 2,4,7
						   		airportz(nairport2)+=58.5 'dome
						   		airportvie(nairport2,1)=400
						   		airportr(nairport2)=100
						   		airportntower(nairport2)=1
						   	Case Else 
						   		airportz(nairport2)+=68.5 '3towers
						   		airportvie(nairport2,1)=200
						   		airportvie(nairport2,2)=200
						   		airportvie(nairport2,3)=200
						   		airportr(nairport2)=50
						   		airportntower(nairport2)=3
						   End Select
							j+=70
						EndIf
						If nairport2>=nairport Then Exit For,For
				   'EndIf  
				EndIf
			EndIf
		EndIf
	Next j
Next i
For i=1 To nairport2
			'i=(x960*(0.5+(dmx0/scalex)/(k8*512)))
			'j=(x960*(0.5-(dmy0/scalex)/(k8*512)))
	'dmx0=scalex*(k8*512)*mapx0/x960
	'dmy0=scalex*(k8*512)*mapy0/x960
	airportix(i)=airportx(i)
	airportiy(i)=airporty(i)
	airportx(i)=k8*512*scalex*(airportx(i)/x960-0.5)*x960/1200
	airporty(i)=-k8*512*scalex*(airporty(i)/x960-0.5)*x960/1200-260
	airporty(i)*=scaley/scalex
Next
End Sub
Sub setairportz(iairport As integer)
If iairport<1 Or iairport>nairport2 then exit sub
airportz(iairport)=getterrainheight(airportx(iairport)-dmx0,airporty(iairport)-dmy0)
	   Select Case airporttype(iairport)
	   	Case 1,3,6
	   		airportz(iairport)+=68.5 'tower
	   	Case 2,4,7
	   		airportz(iairport)+=58.5 'dome
	   	Case Else 
	   		airportz(iairport)+=68.5 '3towers
	   End Select
End Sub
Sub initairport()
Dim As Integer i,j,k,h,h1,test
If planet=1 Then initairport2():Exit Sub 
Randomize(imap*100)
nairport2=0
airporty(0)=-999
Exit Sub 
For i=30 To x960-30
	For j=30 To x960-30
		h=map(i,j)
		If (h-74+dh0)>(-60+dhmareemax) Then
			If h=map(i,j+1) And h=map(i,j-1) Then
				If h=map(i+1,j) And h=map(i+1,j+1) And h=map(i+1,j-1) Then
					'If x960=1200 Or (h=map(i-1,j) And h=map(i-1,j+1) And h=map(i-1,j-1)) Then
						test=0
						Var k70=70*(disttown(x960/1200,i,j))'^0.7)
						For k=nairport2 To 1 Step -1
							If Abs(airporty(k)-i)<k70 Then
								If Abs(airportx(k)-j)<k70 Then
									j=max2(j,airportx(k)+k70-1)
									test=1:Exit For
								EndIf
							EndIf
						Next k
						If test=0 And nairport2<nairport Then
							nairport2+=1
							airportx(nairport2)=j
							airporty(nairport2)=i
							airportz(nairport2)=(h-74+dh0)*scalez'+68.5
						   If h=map(i+2,j) And h=map(i+2,j+1) And h=map(i+2,j-1) Then
								airporttype(nairport2)=3+Int(Rnd*2.9) '3pistes
						   ElseIf h=map(i-1,j) Then 'And h=map(i-1,j+1) Then
								airporttype(nairport2)=6+Int(Rnd*1.9) '2pistes cross
					      Else
								airporttype(nairport2)=1+Int(Rnd*1.4) '1piste
						   EndIf
						   'airporttype(nairport2)=7
						   Select Case airporttype(nairport2)
						   	Case 1,3,6
						   		airportz(nairport2)+=68.5 'tower
						   		airportvie(nairport2,1)=200
						   		airportr(nairport2)=50
						   		airportntower(nairport2)=1
						   	Case 2,4,7
						   		airportz(nairport2)+=58.5 'dome
						   		airportvie(nairport2,1)=400
						   		airportr(nairport2)=100
						   		airportntower(nairport2)=1
						   	Case Else 
						   		airportz(nairport2)+=68.5 '3towers
						   		airportvie(nairport2,1)=200
						   		airportvie(nairport2,2)=200
						   		airportvie(nairport2,3)=200
						   		airportr(nairport2)=50
						   		airportntower(nairport2)=3
						   End Select
							j+=70
						EndIf
						If nairport2>=nairport Then Exit For,For
				   'EndIf  
				EndIf
			EndIf
		EndIf
	Next j
Next i
For i=1 To nairport2
			'i=(x960*(0.5+(dmx0/scalex)/(k8*512)))
			'j=(x960*(0.5-(dmy0/scalex)/(k8*512)))
	'dmx0=scalex*(k8*512)*mapx0/x960
	'dmy0=scalex*(k8*512)*mapy0/x960
	airportix(i)=airportx(i)
	airportiy(i)=airporty(i)
	airportx(i)=k8*512*scalex*(airportx(i)/x960-0.5)*x960/1200
	airporty(i)=-k8*512*scalex*(airporty(i)/x960-0.5)*x960/1200-260
Next
End Sub
Sub savetownvie()
If topentown=1 Then Exit Sub  
Dim As Integer i,File,ii,jj
For i=0 To 400
	For ii=0 To 6
		For jj=0 To 6
			townvie400(i,ii,jj)=townvie(i,ii,jj)
		Next
	Next
Next
Dim As String fic
fic=exepath+"/save/map"+Str(imap)+".townvie" 
file=freefile
Open fic For Binary Access write As #file
Put #file,,townvie400()
Close #file
End Sub 
Sub loadtownvie()
'If topentown=1 Then Exit Sub 
Dim As Integer i,File,ii,jj
Dim As String fic
fic=exepath+"/save/map"+Str(imap)+".townvie" 
For i=0 To ntown
 For ii=0 To 6
	For jj=0 To 6
		townvie(i,ii,jj)=100+townh(i,ii,jj)*0.5
	Next jj
 Next ii
Next i 
If FileExists(fic)=0 Then
	Exit Sub 
EndIf
file=freefile
Open fic For Binary Access Read As #file
Get #file,,townvie400()
Close #file
For i=0 To 400
	For ii=0 To 6
		For jj=0 To 6
			townvie(i,ii,jj)=townvie400(i,ii,jj)
		Next
	Next
Next
townchanged=0
End Sub 
Dim Shared As Single townmapx0=-99999999,townmapy0,townmapdx0
Dim Shared As Single towniix0=-9999,townjjx0
Dim Shared As Single towpmapx0=-99999999,towpmapy0,towpmapdx0
Dim Shared As Single towpiix0=-9999,towpjjx0
'Dim Shared As Integer tinittown0=2
Sub savetowpxy()
If topentown=0 Then Exit Sub 
If tinittown0>0 Then Exit Sub  
Dim As Integer i,File,ii,jj
Dim As Byte b
Dim As Short b16 'int16
Dim As String fic
fic=exepath+"/save/map"+Str(imap)+".townxy2" 
file=FreeFile 
Open fic For  Binary Access write As #file
towpiix0=towniix0
towpjjx0=townjjx0
towpmapx0=townmapx0
towpmapy0=townmapy0
Put #file,,towpiix0
Put #file,,towpjjx0
Put #file,,towpmapx0
Put #file,,towpmapy0
Var dij=7*100/kscalex
Var i50=int(25/dij)
Put #file,,dij
Put #file,,i50
Put #file,,ntowp2
Put #file,,xweb
Put #file,,yweb
Put #file,,mx
Put #file,,my
Put #file,,dmx0
Put #file,,dmy0
Put #file,,lat
Put #file,,lng
Put #file,,myworldx
Put #file,,myworldy
For i=0 To min2(10000,ntowp2)
	b=tmaptowp(i)
	Put #file,,b
	For ii=0 To 6
		For jj=0 To 6
			b=towpbuild(i,ii,jj)
			Put #file,,b
			b16=Int(towph(i,ii,jj)+0.01)
			Put #file,,b16
			b16=Int(towpw(i,ii,jj)+0.01)
			Put #file,,b16
			b16=Int(towpo1(i,ii,jj)+0.01)
			Put #file,,b16
			b16=Int(towpddx(i,ii,jj)+0.01)
			Put #file,,b16
			b16=Int(towpddy(i,ii,jj)+0.01)
			Put #file,,b16
		Next
	Next
Next
Var dlatx=1000*360/40000.0,dlonx=dlatx*1.4
For i=0 To min2(500,nbridge)
	If Abs(bridgelat(i)-lat)>dlatx Or Abs(bridgelon(i)-lng)>dlonx Then
		bridgelat(i)=-89:bridgelon(i)=-179:bridgelat2(i)=-88:bridgelon2(i)=-178
	EndIf
	Put #file,,bridgelat(i)
	Put #file,,bridgelon(i)
	Put #file,,bridgelat2(i)
	Put #file,,bridgelon2(i)
Next
Close #file
End Sub 
Sub savetownxy()
If itownp=0 Then savetowpxy():Exit Sub 
If topentown=0 Then Exit Sub 
If tinittown0>0 Then Exit Sub  
Dim As Integer i,File,ii,jj
Dim As Byte b
Dim As Short b16 'int16
Dim As String fic
fic=exepath+"/save/map"+Str(imap)+".townxy2" 
file=FreeFile 
Open fic For  Binary Access write As #file
Put #file,,towniix0
Put #file,,townjjx0
Put #file,,townmapx0
Put #file,,townmapy0
Var dij=7*100/kscalex
Var i50=int(25/dij)
Put #file,,dij
Put #file,,i50
Put #file,,ntown2
Put #file,,xweb
Put #file,,yweb
Put #file,,mx
Put #file,,my
Put #file,,dmx0
Put #file,,dmy0
Put #file,,lat
Put #file,,lng
Put #file,,myworldx
Put #file,,myworldy
For i=0 To min2(10000,ntown2)
	b=tmaptown(i)
	Put #file,,b
	For ii=0 To 6
		For jj=0 To 6
			b=townbuild(i,ii,jj)
			Put #file,,b
			b16=Int(townh(i,ii,jj)+0.01)
			Put #file,,b16
			b16=Int(townw(i,ii,jj)+0.01)
			Put #file,,b16
			b16=Int(towno1(i,ii,jj)+0.01)
			Put #file,,b16
			b16=Int(townddx(i,ii,jj)+0.01)
			Put #file,,b16
			b16=Int(townddy(i,ii,jj)+0.01)
			Put #file,,b16
		Next
	Next
Next
Var dlatx=1000*360/40000.0,dlonx=dlatx*1.4
For i=0 To min2(500,nbridge)
	If Abs(bridgelat(i)-lat)>dlatx Or Abs(bridgelon(i)-lng)>dlonx Then
		bridgelat(i)=-89:bridgelon(i)=-179:bridgelat2(i)=-88:bridgelon2(i)=-178
	EndIf
	Put #file,,bridgelat(i)
	Put #file,,bridgelon(i)
	Put #file,,bridgelat2(i)
	Put #file,,bridgelon2(i)
Next
Close #file
End Sub 
Sub loadtownxy()
If topentown>=0 Then Exit Sub'$$   
Dim As Integer i,File,ii,jj
Dim As Byte b
Dim As Short b16 'int16
Dim As String fic
fic=exepath+"/save/map"+Str(imap)+".townxy2" 
If FileExists(fic)=0 Then
	Exit Sub 
EndIf
file=FreeFile 
Open fic For  Binary Access Read As #file
Dim As Single towniix00,townjjx00
Dim As Single townmapx00,townmapy00 
Get #file,,towniix00
Get #file,,townjjx00
Get #file,,townmapx00
Get #file,,townmapy00
Var dij=7*100/kscalex,dij0=dij
Var i50=int(25/dij),i500=i50,i101=i50+i50+1
Get #file,,dij
Get #file,,i50
Var ntown22=ntown2
Get #file,,ntown22
If Abs(dij-dij0)<0.005 And Abs(i500-i50)<0.005 And Abs(ntown22-ntown2)<0.005 Then
 towniix0=towniix00
 townjjx0=townjjx00
 townmapx0=townmapx00
 townmapy0=townmapy00
 Get #file,,xweb:xweb1=xweb-1000000
 Get #file,,yweb
 Get #file,,mx
 Get #file,,my
 Get #file,,dmx0
 Get #file,,dmy0
 Get #file,,lat
 Get #file,,lng
 Get #file,,myworldx
 Get #file,,myworldy
 For i=0 To min2(10000,ntown2)
	Get #file,,b
	tmaptown(i)=b
	For ii=0 To 6
		For jj=0 To 6
			Get #file,,b
			townbuild(i,ii,jj)=b
			Get #file,,b16
			townh(i,ii,jj)=b16
			Get #file,,b16
			townw(i,ii,jj)=b16
			Get #file,,b16
			towno1(i,ii,jj)=b16
			Get #file,,b16
			townddx(i,ii,jj)=b16
			Get #file,,b16
			townddy(i,ii,jj)=b16
		Next
	Next
 Next
 For i=0 To ntown
	townz(i)=-999999
 Next
 Dim As Integer iix,jjx
 Var k18=max2(18,18*6/k88)
 For iix=-i50 To i50 'Step dij
	For jjx=-i50 To i50 'Step dij
	  If Abs(iix)>k18 Or Abs(jjx)>k18 Then 
		Var ij=Int((iix+i50))*Int(i101)+Int((jjx+i50))
		If ij>=0 And ij<ntown Then
			ij=ij+1
			tmaptown(ij)=min2(0,tmaptown(ij))
			Dim As Integer ii,jj
			For ii=0 To 6
				For jj=0 To 6
					townbuild(ij,ii,jj)=0
					townh(ij,ii,jj)=0
				Next
			Next
		EndIf
	  EndIf 	
	Next jjx
 Next iix 	
 For i=0 To min2(500,nbridge)
	Get #file,,bridgelat(i)
	Get #file,,bridgelon(i)
	Get #file,,bridgelat2(i)
	Get #file,,bridgelon2(i)
 Next
EndIf 
Close #file
End Sub 
Const As Integer nfuel=100
Dim Shared As int64 fuelid(nfuel)
Dim Shared As Integer ifuel
Dim Shared As Single fuelx(nfuel),fuely(nfuel),fuelz(nfuel),fueldo1(nfuel)
Const As Integer nreverse=100
Dim Shared As Integer ireverse
Dim Shared As Single latreverse,lngreverse,latreversei(nreverse),lngreversei(nreverse)
Dim Shared As string namereversei(nreverse)
'Dim Shared As ZString*31 myztext30
Dim Shared As ZString*41 myztext40
Sub savetowpxy3(fic0 As String="")
Dim As Integer i,j,File,ii,jj
Dim As String fic
fic=exepath+"/save/map"+Str(imap)+".townxy3" 
If fic0<>"" Then fic=fic0
file=FreeFile 
Open fic For  Binary Access write As #file
towpiix0=towniix0
towpjjx0=townjjx0
towpmapx0=townmapx0
towpmapy0=townmapy0
Var towniix00=towniix0
towniix00=99999.0
Put #file,,towniix00
Put #file,,myworldx
Put #file,,myworldy
Put #file,,towpiix0
Put #file,,towpjjx0
Put #file,,towpmapx0
Put #file,,towpmapy0
Var dij=7*100/kscalex
Var i50=int(25/dij)
Put #file,,dij
Put #file,,i50
Put #file,,ntowp2
Var nwaynodex=nwaynode
Var ntownnodex=ntownnode
Put #file,,nwaynodex
Put #file,,ntownnodex
Put #file,,nbridge
Var dlatx=1000*360/40000.0,dlonx=dlatx*1.4
For i=0 To min2(500,nbridge)
	If Abs(bridgelat(i)-lat)>dlatx Or Abs(bridgelon(i)-lng)>dlonx Then
		bridgelat(i)=-89:bridgelon(i)=-179:bridgelat2(i)=-88:bridgelon2(i)=-178
	EndIf
	Put #file,,bridgelat(i)
	Put #file,,bridgelon(i)
	Put #file,,bridgelat2(i)
	Put #file,,bridgelon2(i)
Next
For i=0 To ntowp2
	Put #file,,townnwaynode(i)
	If townnwaynode(i)>0 Then 
	 For ii=1 To min2(ntownnode,townnwaynode(i))
	   If townwaynodeid(i,ii)=0 Then
	      Put #file,,townwaynodeid(i,ii)
	   Else    
	    If townwayname(i,ii)="" Then
	      Put #file,,townwaynodeid(i,ii)
	    Else   
	      Put #file,,-townwaynodeid(i,ii)
	      myztext40=townwayname(i,ii)
	      Put #file,,myztext40
	    EndIf
		 Put #file,,towniwaynode(i,ii)
		 Put #file,,townwaynodeh(i,ii)
		 Put #file,,townwaynodez(i,ii)
		 If townwaynoder(i,ii)<0.1 Then
		 	Put #file,,townwaynodebuild(i,ii)
		 Else 
		 	Put #file,,townwaynodebuild(i,ii)+1000
		 	Put #file,,townwaynoder(i,ii)
		 	Put #file,,townwaynodeg(i,ii)
		 	Put #file,,townwaynodeb(i,ii)
		 EndIf
		 For jj=0 To min2(nwaynode,towniwaynode(i,ii))
		 	Put #file,,townwaynodex(i,ii,jj)
		 	Put #file,,townwaynodey(i,ii,jj)
		 Next
		EndIf  
	 Next
	EndIf  
Next
Var nfuel2=nfuel
Put #file,,nfuel2
Put #file,,ifuel
For i=1 To nfuel2
	Put #file,,fuelid(i)
	Put #file,,fuelx(i)
	Put #file,,fuely(i)
	Put #file,,fueldo1(i)
Next
Var nreverse2=nreverse
Put #file,,nreverse2
Put #file,,ireverse
For i=1 To nreverse2
	Put #file,,latreversei(i)
	Put #file,,lngreversei(i)
	Dim As ZString*40 namereverseii=namereversei(i)
	Put #file,,namereverseii
Next
Put #file,,nbridge
For i=0 To min2(500,nbridge)
	Dim As ZString*40 bridgenameii=bridgename(i)
	Put #file,,bridgenameii
Next
Var ntown400=ntown40
Put #file,,ntown400   
Put #file,,itown40   
For i=0 To ntown40
	Put #file,,townid40(i)
	For j=0 To n40
		Put #file,,knode40(i,j)
		Put #file,,townnodelat40(i,j)
      Put #file,,townnodelon40(i,j)
		'Put #file,,townnodex40(i,j)
		'Put #file,,townnodey40(i,j)
	Next
Next
Close #file	
End Sub
Sub savetownxy3(fic0 As String="")
If topentown=0 Then Exit Sub 
If tinittown0>0 Then Exit Sub  
If itownp=0 Then savetowpxy3(fic0):Exit Sub 
Dim As Integer i,j,File,ii,jj
Dim As String fic
fic=exepath+"/save/map"+Str(imap)+".townxy3" 
If fic0<>"" Then fic=fic0
file=FreeFile 
Open fic For  Binary Access write As #file
Var towniix00=towniix0
towniix00=99999.0
Put #file,,towniix00
Put #file,,myworldx
Put #file,,myworldy
Put #file,,towniix0
Put #file,,townjjx0
Put #file,,townmapx0
Put #file,,townmapy0
Var dij=7*100/kscalex
Var i50=int(25/dij)
Put #file,,dij
Put #file,,i50
Put #file,,ntown2
Var nwaynodex=nwaynode
Var ntownnodex=ntownnode
Put #file,,nwaynodex
Put #file,,ntownnodex
Put #file,,nbridge
Var dlatx=1000*360/40000.0,dlonx=dlatx*1.4
For i=0 To min2(500,nbridge)
	If Abs(bridgelat(i)-lat)>dlatx Or Abs(bridgelon(i)-lng)>dlonx Then
		bridgelat(i)=-89:bridgelon(i)=-179:bridgelat2(i)=-88:bridgelon2(i)=-178
	EndIf
	Put #file,,bridgelat(i)
	Put #file,,bridgelon(i)
	Put #file,,bridgelat2(i)
	Put #file,,bridgelon2(i)
Next
For i=0 To ntown2
	Put #file,,townnwaynode(i)
	If townnwaynode(i)>0 Then 
	 For ii=1 To min2(ntownnode,townnwaynode(i))
	   If townwaynodeid(i,ii)=0 Then
	      Put #file,,townwaynodeid(i,ii)
	   Else    
	    If townwayname(i,ii)="" Then
	      Put #file,,townwaynodeid(i,ii)
	    Else   
	      Put #file,,-townwaynodeid(i,ii)
	      myztext40=townwayname(i,ii)
	      Put #file,,myztext40
	    EndIf
		 Put #file,,towniwaynode(i,ii)
		 Put #file,,townwaynodeh(i,ii)
		 Put #file,,townwaynodez(i,ii)
		 If townwaynoder(i,ii)<0.1 Then
		 	Put #file,,townwaynodebuild(i,ii)
		 Else 
		 	Put #file,,townwaynodebuild(i,ii)+1000
		 	Put #file,,townwaynoder(i,ii)
		 	Put #file,,townwaynodeg(i,ii)
		 	Put #file,,townwaynodeb(i,ii)
		 EndIf
		 For jj=0 To min2(nwaynode,towniwaynode(i,ii))
		 	Put #file,,townwaynodex(i,ii,jj)
		 	Put #file,,townwaynodey(i,ii,jj)
		 Next
		EndIf  
	 Next
	EndIf  
Next
Var nfuel2=nfuel
Put #file,,nfuel2
Put #file,,ifuel
For i=1 To nfuel2
	Put #file,,fuelid(i)
	Put #file,,fuelx(i)
	Put #file,,fuely(i)
	Put #file,,fueldo1(i)
Next
Var nreverse2=nreverse
Put #file,,nreverse2
Put #file,,ireverse
For i=1 To nreverse2
	Put #file,,latreversei(i)
	Put #file,,lngreversei(i)
	Dim As ZString*40 namereverseii=namereversei(i)
	Put #file,,namereverseii
Next
Put #file,,nbridge
For i=0 To min2(500,nbridge)
	Dim As ZString*40 bridgenameii=bridgename(i)
	Put #file,,bridgenameii
Next
Var ntown400=ntown40
Put #file,,ntown400   
Put #file,,itown40   
For i=0 To ntown40
	Put #file,,townid40(i)
	For j=0 To n40
		Put #file,,knode40(i,j)
		Put #file,,townnodelat40(i,j)
      Put #file,,townnodelon40(i,j)
		'Put #file,,townnodex40(i,j)
		'Put #file,,townnodey40(i,j)
	Next
Next
Close #file
End Sub 
Dim Shared As Integer nshop=155,nshop0=155
Sub loadtownxy3(fic0 As String="")
timeinit=Timer 
tlayer00=tlayer
'resetsrtm()
If topentown=0 Then Exit Sub'$$   
Dim As Integer i,j,File,ii,jj
Dim As String fic
fic=exepath+"/save/map"+Str(imap)+".townxy3" 
If fic0<>"" Then fic=fic0:resetsrtm():resetterrain()
If FileExists(fic)=0 Then
	Exit Sub 
EndIf
Var nbtown=0,nbway=0,nbnode=0
file=FreeFile 
Open fic For  Binary Access Read As #file
Dim As Single towniix00,townjjx00
Dim As Single townmapx00,townmapy00 
Var addworldx0=myworldx,addworldy0=myworldy
Get #file,,towniix00
If towniix00>99990 Then
  Get #file,,addworldx0
  Get #file,,addworldy0
  Get #file,,towniix00	
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
 towniix0=towniix00
 townjjx0=townjjx00
 townmapx0=townmapx00
 townmapy0=townmapy00
 towpiix0=towniix00
 towpjjx0=townjjx00
 towpmapx0=townmapx00
 towpmapy0=townmapy00
 sleep 500
 For i=0 To min2(500,nbridge)
	Get #file,,bridgelat(i)
	Get #file,,bridgelon(i)
	Get #file,,bridgelat2(i)
	Get #file,,bridgelon2(i)
 Next
 For i=0 To ntown2
	Get #file,,townnwaynode(i)
	If townnwaynode(i)>0 Then 
	 nbtown+=1	
	 For ii=1 To min2(ntownnode,townnwaynode(i))
	 	nbway+=1
	   Get #file,,townwaynodeid(i,ii)
	   If townwaynodeid(i,ii)<>0 Then
	    If townwaynodeid(i,ii)<0 Then
	    	 townwaynodeid(i,ii)=-townwaynodeid(i,ii)
	    	 Get #file,,myztext40
	    	 townwayname(i,ii)=myztext40
	    EndIf
		 Get #file,,towniwaynode(i,ii)
		 Get #file,,townwaynodeh(i,ii)
		 Get #file,,townwaynodez(i,ii) 
		 Get #file,,townwaynodebuild(i,ii)
		 If townwaynodebuild(i,ii)>=1000 Then
		 	townwaynodebuild(i,ii)-=1000
		   Get #file,,townwaynoder(i,ii)
		   Get #file,,townwaynodeg(i,ii)
		   Get #file,,townwaynodeb(i,ii)
		 Else
		 	townwaynoder(i,ii)=0
		 	townwaynodeg(i,ii)=0
		 	townwaynodeb(i,ii)=0
		 EndIf
		 towni40(i,ii)=0
		 For jj=0 To min2(nwaynode,towniwaynode(i,ii))
		 	nbnode+=1
		 	Get #file,,townwaynodex(i,ii,jj)
		 	Get #file,,townwaynodey(i,ii,jj)
		 Next
		EndIf  
	 Next
	EndIf  
 Next
 If Not Eof(file) Then
 	Var nfuel2=nfuel
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
 EndIf
 If Not Eof(file) Then
 	Var nreverse2=nreverse
 	Get #file,,nreverse2
 	If nreverse2<=nreverse Then
 	   Get #file,,ireverse
 		For i=1 To nreverse2
 			Get #file,,latreversei(i)
 			Get #file,,lngreversei(i)
	      Dim As ZString*40 namereverseii=namereversei(i)
 			Get #file,,namereverseii
 			namereversei(i)=namereverseii
 			If namereversei(i)="" Then
 				latreversei(i)=-90
 				lngreversei(i)=0
 			EndIf
 		Next
 	EndIf
 EndIf
 If Not Eof(file) Then
 Var nbridge3=nbridge
 Get #file,,nbridge3
 If nbridge3<=nbridge Then 
  For i=0 To min2(500,nbridge3)
    Dim As ZString*40 bridgenameii=""
	 Get #file,,bridgenameii
	 bridgename(i)=bridgenameii
  Next
 EndIf 
 EndIf 
 
 resettown40()
 If Not Eof(file) Then
  Var ntown400=ntown40
  Get #file,,ntown400   
  Get #file,,itown40   
  For i=0 To min2(ntown400,ntown40)
	Get #file,,townid40(i)
	townixy40(i)=0
	For j=0 To n40
		Get #file,,knode40(i,j)
		Get #file,,townnodelat40(i,j)
      Get #file,,townnodelon40(i,j)
		townnodex40(i,j)=0
		townnodey40(i,j)=0
	Next
  Next
 EndIf 
 Sleep 500
EndIf
Close #file
nshop=55
Var msg="nbtown="+Str(nbtown)+" nbway="+Str(nbway)+" nbnode="+Str(nbnode)
msg+=Chr(10)+"town/ntown="+Str(nbtown)+"/"+Str(ntown)+" way/town="+Str(Int(nbway/(1+nbtown)))+" node/way="+Str(nbnode/(1+nbway))
msg+=Chr(10)+"ntown="+Str(ntown)+" "+Str(ntownnode)+" "+Str(nwaynode)+"  nbway/totway=1/"+Str((ntown*ntownnode)/(1+nbway))
'guinotice msg
Sleep 300
End Sub 
Declare Sub inittown3()
Declare Sub inittowp3()
Declare Sub copytown00()
Dim Shared As Integer tinitload=1
Sub inittown2(ByVal userdata As Any Ptr)
	inittown()
	tloadwebtext2=33
End Sub
Sub inittown() 
If topentown=1 Then
	If itownp=0 And tinitload=1 Then
		tinitload=0
		tmapchanged=1
		inittown3()
		loadtownxy3()
		copytown00()
		tmapchanged=1
		inittowp3()
		inittown3()
		itownp=1
		xweb1=xweb-999999
		tloadwebtext=Timer-10-1
	ElseIf itownp=0 Then
		inittown3()
		itownp=1
	Else
		inittowp3()
		itownp=0
	EndIf
	Exit Sub 
EndIf
Dim As Integer i,j,k,h,h1,test,test0,test2,ii,jj,dii
Dim As Single townvie0
If planet=1 Then Exit Sub 
Randomize(imap*100)
For i=0 To ntown
	tmaptown(i)=0
Next
ntown2=0
towny(0)=-999
For i=30 To x960-30
	For j=30 To x960-30
		h=map(i,j)
		If (h-74+dh0)>(-60+dhmareemax) Then
			test0=0
			dii=3
			For ii=i-dii To i+dii
				For jj=j-dii To j+dii
					If Abs(h-map(ii,jj))>5 Then test0=1:Exit For,For
				Next
			Next
			If test0=0 Then 
						test=0
						Var k70=70*(disttown(x960/1200,i,j))
						For k=ntown2 To 1 Step -1
							If Abs(towny(k)-i)<k70 Then
								If Abs(townx(k)-j)<k70 Then
									j=max2(j,townx(k)+k70-1)
									test=1:Exit For
								EndIf
							EndIf
						Next k
						If test=0 Then 
						 Var k20=20*(disttown(x960/1200,i,j))
						 For k=nairport2 To 1 Step -1
							If Abs(airportiy(k)-i)<k20 Then
								If Abs(airportix(k)-j)<k20 Then
									j=max2(j,airportix(k)+k20-1)
									test=1:Exit For
								EndIf
							EndIf
						 Next k
						EndIf  
						If test=0 And ntown2<ntown Then
							ntown2+=1
							tmaptown(ntown2)=1
							townx(ntown2)=j
							towny(ntown2)=i
							townz(ntown2)=(h-74+dh0)*scalez'+68.5
					      test2=0
					      For ii=i-dii To i+dii
					      	For jj=j-dii To j+dii
					      		test2=max2(test2,Abs(h-map(ii,jj)))
					      	Next
					      Next
					      If test2<=4 Then 
								towntype(ntown2)=2
							Else
								towntype(ntown2)=1
						   EndIf
						   'towntype(ntown2)=1
						   Select Case towntype(ntown2)
						   	Case 1
						   		dii=3
						   		For ii=i-dii To i+dii
						   		 For jj=j-dii To j+dii
						   			townbuild(ntown2,ii-i+dii,jj-j+dii)=Int(Rnd*3)
						   			townh(ntown2,ii-i+dii,jj-j+dii)=50+Rnd*500+scalez
						   			h1=map(ii,jj)
						   			towndz(ntown2,ii-i+dii,jj-j+dii)=(h1-74+dh0-2)*scalez
						   		   'If towndz(ntown2,ii-i+dii,jj-j+dii)<waterz Then
						   		   '	townbuild(ntown2,ii-i+dii,jj-j+dii)=0
						   		   'EndIf
						   		 Next
						   		Next
						   	Case Else
						   		dii=3
						   		For ii=i-dii To i+dii
						   		 For jj=j-dii To j+dii
						   			townbuild(ntown2,ii-i+dii,jj-j+dii)=Int(Rnd*4)
						   			h1=50+Rnd*800
						   			If h1>450 Then h1*=1.45
						   			townh(ntown2,ii-i+dii,jj-j+dii)=h1+scalez
						   			h1=map(ii,jj)
						   			towndz(ntown2,ii-i+dii,jj-j+dii)=(h1-74+dh0-2)*scalez
						   		   'If towndz(ntown2,ii-i+dii,jj-j+dii)<waterz Then
						   		   '	townbuild(ntown2,ii-i+dii,jj-j+dii)=0
						   		   'EndIf
						   		 Next
						   		Next
						   End Select
							j+=70
						EndIf
						If ntown2>=ntown Then Exit For,For
   		EndIf
		EndIf
	Next j
Next i
If tinittownvie=1 Then loadtownvie()
For i=1 To ntown2
			'i=(x960*(0.5+(dmx0/scalex)/(k8*512)))
			'j=(x960*(0.5-(dmy0/scalex)/(k8*512)))
	'dmx0=scalex*(k8*512)*mapx0/x960
	'dmy0=scalex*(k8*512)*mapy0/x960
	For ii=0 To 6
		For jj=0 To 6
			towndx(i,ii,jj)=k8*512*scalex*((townx(i)+(-3+jj)*100/kscalex)/x960-0.5)*x960/1200
	      towndy(i,ii,jj)=-k8*512*scalex*((towny(i)+(-3+ii)*100/kscalex)/x960-0.5)*x960/1200-260
	      If (Rnd<0.3 Or townvie(i,ii,jj)>0)And tinittownvie=1 Then 
	        townvie0=100+townh(i,ii,jj)*0.5
	        townvie(i,ii,jj)=min(townvie0,max(-90.0,townvie(i,ii,jj)+townvie0/5))
	      EndIf
		Next
	Next
	townx(i)=k8*512*scalex*(townx(i)/x960-0.5)*x960/1200
	towny(i)=-k8*512*scalex*(towny(i)/x960-0.5)*x960/1200-260
Next
tinittownvie=0
If tinittown=2 Then
	tinittown=3
Else
	tinittown=0
EndIf
End Sub
'Dim Shared As Single townmapx0=-99999999,townmapy0,townmapdx0
'Dim Shared As Single towniix0,townjjx0
'Dim Shared As Single towpmapx0=-99999999,towpmapy0,towpmapdx0
'Dim Shared As Single towpiix0,towpjjx0
'Dim Shared As Integer tinittown0=2
Dim Shared As Single dhmareemax2=-14.00001
Dim Shared As Single mxtest,mytest
Function testtowpij(mxx As Single,myy As Single)As Integer
k8=k88
var iix0=Int((((-260-myy)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
Var jjx0=Int((((mxx)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
'		i=Int(iix*dij+iix0+0.5):j=Int(jjx*dij+jjx0+0.5)
Var dij=7*100/kscalex
Var i50=int(25/dij),i101=i50+i50+1
Var iix=(iix0-towpiix0)/dij
Var jjx=(jjx0-towpjjx0)/dij	
If iix<-i50 Or iix>i50 Or jjx<-i50 Or jjx>i50 Then k8=6:Return 0
Var ij=Int((iix+i50))*Int(i101)+Int((jjx+i50))
Var ntowp2=0
If ij>=0 And ij<ntowp Then
	ntowp2=ij+1
	'mxtest=towpx(ij+1):mytest=towpy(ij+1)
   If showtowp(ntowp2)>0 Then k8=6:Return 1
EndIf
k8=6
return 0
End Function
Function testtownij(mxx As Single,myy As Single)As Integer
if itownp=0 then return testtowpij(mxx,myy)
k8=k88
var iix0=Int((((-260-myy)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
Var jjx0=Int((((mxx)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
'		i=Int(iix*dij+iix0+0.5):j=Int(jjx*dij+jjx0+0.5)
Var dij=7*100/kscalex
Var i50=int(25/dij),i101=i50+i50+1
Var iix=(iix0-towniix0)/dij
Var jjx=(jjx0-townjjx0)/dij	
If iix<-i50 Or iix>i50 Or jjx<-i50 Or jjx>i50 Then k8=6:Return 0
Var ij=Int((iix+i50))*Int(i101)+Int((jjx+i50))
Var ntown2=0
If ij>=0 And ij<ntown Then
	ntown2=ij+1
	'mxtest=townx(ij+1):mytest=towny(ij+1)
   If showtown(ntown2)>0 Then k8=6:Return 1
EndIf
k8=6
return 0
End Function
Sub setnbuilds()
Dim As Integer ij,i
nbuilds=0
For ij=1 To ntown2
	nbuilds+=townnwaynode(ij)
Next
End Sub
Sub copytown00()
Dim As Integer i,j,di=0,dj=0
 getlocktown2(0)		
 resettownwaynode2()
 copydoubles=0:nbuilds=0:ntown20=0
 resetinitid()
 timeinitid=Timer
 For i=-i50 To i50
 	tiinitid=0:If Rnd<0.25 Then tiinitid=1
	For j=-i50 To i50
		copytownopen(i,j,i+di,j+dj)
	Next
 Next
 timeinitid=0
 resettownwaynode()
 For i=-i50 To i50
	For j=-i50 To i50
		copytownopen2(i,j,i,j)
	Next
 Next
 freelocktown(0)	
End Sub
Sub inittown3()
k8=k88
Dim As Integer i,j,k,h,h1,test,test0,test2,ii,jj,dii,di,dj,diimax
Dim As Single townvie0,iix,jjx,iix0,jjx0,dij
If planet=1 Then Exit Sub 
Dim As Integer testinit=1,testload=0
dij=7*100/kscalex
i50=int(25/dij):i101=i50+i50+1
townmapdx0=k8*512*scalex*(i50/x960)*x960/1200
'townmapdx0=k8*512*scalex*(50/x960)*x960/1200
towniix0=towpiix0
townjjx0=towpjjx0
townmapx0=towpmapx0
townmapy0=towpmapy0    
If townmapx0>-99999998 Then testinit=0
If tinittown0>=1 Then testinit=1
If tinittown=2 And tinittown0>=1 Then
	tinittown0-=1
	If tinittown0<=1 And tinitload=1 Then tinitload=2':guinotice Str(tinittown0) 
EndIf
If tinitload=2 Then testinit=0
Var iix1=Int((((-260-my-dmy0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
Var jjx1=Int((((mx+dmx0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
di=0:dj=0
diimax=Int(i50*0.6)
If testinit=0 and (Abs(iix1-towniix0)>diimax Or Abs(jjx1-townjjx0)>diimax)Then
	Var towniix00=towniix0,townjjx00=townjjx0
	Var townmapx00=townmapx0,townmapy00=townmapy0
   iix0=iix1'Int((((-260-my-dmy0)*1200/(x960*k8*512*scalex)+0.5)*x960))
   jjx0=jjx1'Int((((mx+dmx0)*1200/(x960*k8*512*scalex)+0.5)*x960))
   towniix0=iix0
   townjjx0=jjx0
   'townmapx0=mx+mx0'k8*512*scalex*(jjx0/x960-0.5)*x960/1200
   'townmapy0=my+my0'-k8*512*scalex*(iix0/x960-0.5)*x960/1200-260
   'For iix=-50+iix0 To iix0+50 Step dij
	'  For jjx=-50+jjx0 To jjx0+50 Step dij
	'	Var ij=Int((iix-iix0+50)/dij)*Int(101/dij)+Int((jjx-jjx0+50)/dij)
   di=Int(0.3*(towniix0-towniix00)/dij)
   dj=Int(0.3*(townjjx0-townjjx00)/dij)
   towniix0=towniix00+di*dij
   townjjx0=townjjx00+dj*dij
   'tmapchanged=1
   If auxtest>1.01 Then guinotice "inittown3 ij0 changed"
ElseIf testinit=0 And max(Abs(mx),Abs(my))>250000 Then
 	'If lockterrain=0 Then
      getlocktown(0)	
 		getlockterrain()
 		resetmxy0()
 		freelockterrain()
      freelocktown(0)	
      Var iix1=Int((((-260-my-dmy0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
      Var jjx1=Int((((mx+dmx0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
 	   towniix0=iix1
 	   townjjx0=jjx1
 	   iix0=iix1
 	   jjx0=jjx1
 	'EndIf
EndIf
'For i=-i50 To i50 Step i50
'	For j=-i50 To i50 Step i50
		'copytown(i,j,i+di,j+dj)
'	Next
'Next
'Randomize(imap*100)
'If testinit=1 Then 
 'For i=0 To ntown
 '	tmaptown(i)=0'-1
 'Next
'EndIf    
Var ntown22=0
'towny(0)=-999
'towndx(i,ii,jj)=k8*512*scalex*((townx(i)+(-3+jj)*100/kscalex)/x960-0.5)*x960/1200
'towndy(i,ii,jj)=-k8*512*scalex*((towny(i)+(-3+ii)*100/kscalex)/x960-0.5)*x960/1200-260
'townx(i)=k8*512*scalex*(townx(i)/x960-0.5)*x960/1200
'towny(i)=-k8*512*scalex*(towny(i)/x960-0.5)*x960/1200-260
'dij=7*100/kscalex
If testinit=1999 and towniix0<-999 Then 
 if auxtest>1.01 then guinotice "ok"
 iix0=((((-260-my-dmy0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
 jjx0=((((mx+dmx0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
 towniix0=iix0
 townjjx0=jjx0
 townmapx0=k8*512*scalex*(jjx0/x960-0.5)*x960/1200
 townmapy0=-k8*512*scalex*(iix0/x960-0.5)*x960/1200-260
Else
 iix0=towniix0
 jjx0=townjjx0
 townmapx0=k8*512*scalex*(townjjx0/x960-0.5)*x960/1200
 townmapy0=-k8*512*scalex*(towniix0/x960-0.5)*x960/1200-260
EndIf
towpmapx0=townmapx0
towpmapy0=townmapy0
If di<0 or di>0 Or dj<0 or dj>0 Or testinit=1 Then
 If auxtest>1.01 Then guinotice Str(di)+"/ok/"+Str(dj)
 getlocktown2(0)	
 resettownwaynode2()
 copydoubles=0:nbuilds=0:ntown20=0
 For i=-i50 To i50
	For j=-i50 To i50
		copytownopen(i,j,i+di,j+dj)
	Next
 Next
 resettownwaynode()
 For i=-i50 To i50
	For j=-i50 To i50
		copytownopen2(i,j,i,j)
	Next
 Next
 freelocktown(0)	
EndIf 
For iix=-i50 To i50 Step i50'Step dij
	For jjx=-i50 To i50 Step i50'Step dij
		Var ij=Int((iix+i50))*Int(i101)+Int((jjx+i50))
		If ij>=0 And ij<ntown Then ntown22=ij+1
		/'i=Int(iix*dij+iix0+0.5):j=Int(jjx*dij+jjx0+0.5)
		test=0
		dii=54
		If i>dii And i<x960-dii And j>dii And j<x960-dii Then
			h=map(i,j)
   		Var hwater=(-60+dhmareemax2)+74-dh0
			For ii=i-dii To i+dii Step dii/2
				For jj=j-dii To j+dii Step dii/2
					'If Abs(h-map(ii,jj))>5 Then test=1:Exit For,For
					Var hh=map(ii,jj)
					If hh<=hwater Then
						tmaptown(ntown22)=-1
						test=1:Exit For,For
					EndIf
				Next
			Next
		Else 	
		   i=max2(7,min2(x960-7,i))
		   j=max2(7,min2(x960-7,j))
		   h=2'map(i,j)
			If tmaptown(ntown22)<0 Then tmaptown(ntown22)=0
			townx(ntown22)=jjx*dij+jjx0
			towny(ntown22)=iix*dij+iix0
			townz(ntown22)=-999999'(h-74+dh0-dhmareemax2)*scalez'+68.5
		EndIf
		If (h-74+dh0)<=(-60+dhmareemax2) Then
			tmaptown(ntown22)=-1
		Else 
			dii=3
			If ntown22>=ntown Then Exit For,For
		EndIf '/ 
	Next jjx
Next iix
ntown2=ntown22
ntowp2=ntown2
If testinit<=1 Then 
 tmapchanged=0
 'If tinitload=2 Then
 '	tinitload=0:loadtownxy():lattown=-89:tloadwebtext=Timer-11-1':guinotice("ok")
 '  tmapchanged=1
 'EndIf
EndIf  
tinittownvie=0
If tinittown=2 Then
	tinittown=3
Else 
	tinittown=0
EndIf
k8=6
End Sub
Sub inittowp3()
k8=k88
Dim As Integer i,j,k,h,h1,test,test0,test2,ii,jj,dii,di,dj,diimax
Dim As Single towpvie0,iix,jjx,iix0,jjx0,dij
If planet=1 Then Exit Sub 
Dim As Integer testinit=1
dij=7*100/kscalex
i50=int(25/dij):i101=i50+i50+1
towpmapdx0=k8*512*scalex*(i50/x960)*x960/1200
'towpmapdx0=k8*512*scalex*(50/x960)*x960/1200
towpiix0=towniix0
towpjjx0=townjjx0
towpmapx0=townmapx0
towpmapy0=townmapy0
If towpmapx0>-99999998 Then testinit=0
Var iix1=Int((((-260-my-dmy0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
Var jjx1=Int((((mx+dmx0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
If tinittown0>=1 Then testinit=1
If tinittown=2 And tinittown0>=1 Then tinittown0-=1
di=0:dj=0
diimax=Int(i50*0.6)
If testinit=0 and (Abs(iix1-towpiix0)>diimax Or Abs(jjx1-towpjjx0)>diimax) Then
	Var towpiix00=towpiix0,towpjjx00=towpjjx0
	Var towpmapx00=towpmapx0,towpmapy00=towpmapy0
   iix0=iix1'Int((((-260-my-dmy0)*1200/(x960*k8*512*scalex)+0.5)*x960))
   jjx0=jjx1'Int((((mx+dmx0)*1200/(x960*k8*512*scalex)+0.5)*x960))
   towpiix0=iix0
   towpjjx0=jjx0
   'towpmapx0=mx+dmx0'k8*512*scalex*(jjx0/x960-0.5)*x960/1200
   'towpmapy0=my+dmy0'-k8*512*scalex*(iix0/x960-0.5)*x960/1200-260
   'For iix=-50+iix0 To iix0+50 Step dij
	'  For jjx=-50+jjx0 To jjx0+50 Step dij
	'	Var ij=Int((iix-iix0+50)/dij)*Int(101/dij)+Int((jjx-jjx0+50)/dij)
   di=Int(0.3*(towpiix0-towpiix00)/dij)
   dj=Int(0.3*(towpjjx0-towpjjx00)/dij)
   towpiix0=towpiix00+di*dij
   towpjjx0=towpjjx00+dj*dij
   'tmapchanged=1
   If auxtest>1.01 Then guinotice "inittowp3 ij0 changed"
ElseIf testinit=0 And max(Abs(mx),Abs(my))>250000 Then
 	'If lockterrain=0 Then
      getlocktown(0)	
 		getlockterrain()
 		resetmxy0()
 		freelockterrain()
      freelocktown(0)	
      Var iix1=Int((((-260-my-dmy0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
      Var jjx1=Int((((mx+dmx0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
 	   towpiix0=iix1
 	   towpjjx0=jjx1
 	   iix0=iix1
 	   jjx0=jjx1
   'EndIf
EndIf
'For i=-i50 To i50 Step i50
'	For j=-i50 To i50 Step i50
		'copytowp(i,j,i+di,j+dj)
'	Next
'Next
'Randomize(imap*100)
'If testinit=1 Then 
 'For i=0 To ntowp
	'tmaptowp(i)=0'-1
 'Next
'EndIf    
Var ntowp22=0
'towpy(0)=-999
'towpdx(i,ii,jj)=k8*512*scalex*((towpx(i)+(-3+jj)*100/kscalex)/x960-0.5)*x960/1200
'towpdy(i,ii,jj)=-k8*512*scalex*((towpy(i)+(-3+ii)*100/kscalex)/x960-0.5)*x960/1200-260
'towpx(i)=k8*512*scalex*(towpx(i)/x960-0.5)*x960/1200
'towpy(i)=-k8*512*scalex*(towpy(i)/x960-0.5)*x960/1200-260
'dij=7*100/kscalex
If testinit=1999 and towpiix0>-999 Then 
 If auxtest>1.01 Then guinotice "ok1"
 iix0=((((-260-my-dmy0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
 jjx0=((((mx+dmx0)*1200/(x960*k8*512*scalex)+0.5)*x960)+0.5)
 towpiix0=iix0
 towpjjx0=jjx0
 towpmapx0=k8*512*scalex*(jjx0/x960-0.5)*x960/1200
 towpmapy0=-k8*512*scalex*(iix0/x960-0.5)*x960/1200-260
Else
 iix0=towpiix0
 jjx0=towpjjx0
 towpmapx0=k8*512*scalex*(towpjjx0/x960-0.5)*x960/1200
 towpmapy0=-k8*512*scalex*(towpiix0/x960-0.5)*x960/1200-260
EndIf 
townmapx0=towpmapx0
townmapy0=towpmapy0
If di<0 or di>0 Or dj<0 or dj>0 Then 
 If auxtest>1.01 Then guinotice Str(di)+"/"+Str(dj)
 getlocktown2(0)		
 resettownwaynode2()
 copydoubles=0:nbuilds=0:ntown20=0
 For i=-i50 To i50
	For j=-i50 To i50
		copytownopen(i,j,i+di,j+dj)
	Next
 Next
 resettownwaynode()
 For i=-i50 To i50
	For j=-i50 To i50
		copytownopen2(i,j,i,j)
	Next
 Next
 freelocktown(0)	
EndIf  
For iix=-i50 To i50 Step i50'Step dij
	For jjx=-i50 To i50 Step i50'Step dij
		Var ij=Int((iix+i50))*Int(i101)+Int((jjx+i50))
		If ij>=0 And ij<ntowp Then ntowp22=ij+1
		/'i=Int(iix*dij+iix0+0.5):j=Int(jjx*dij+jjx0+0.5)
		test=0
		dii=54
		If i>dii And i<x960-dii And j>dii And j<x960-dii Then
			h=map(i,j)
   		var hwater=(-60+dhmareemax2)+74-dh0
			For ii=i-dii To i+dii Step dii/2
				For jj=j-dii To j+dii Step dii/2
					'If Abs(h-map(ii,jj))>5 Then test=1:Exit For,For
					Var hh=map(ii,jj)
					If hh<=hwater Then
						tmaptowp(ntowp22)=-1
						test=1:Exit For,For
					EndIf
				Next
			Next
		Else 	
		   i=max2(7,min2(x960-7,i))
		   j=max2(7,min2(x960-7,j))
		   h=2'map(i,j)
			If tmaptowp(ntowp22)<0 Then tmaptowp(ntowp22)=0
			towpx(ntowp22)=jjx*dij+jjx0
			towpy(ntowp22)=iix*dij+iix0
			towpz(ntowp22)=-999999'(h-74+dh0-dhmareemax2)*scalez'+68.5
		EndIf
		If (h-74+dh0)<=(-60+dhmareemax2) Then
			tmaptowp(ntowp22)=-1
		Else 	
   		dii=3
			If ntowp22>=ntowp Then Exit For,For
		EndIf '/ 
	Next jjx
Next iix
ntowp2=ntowp22
ntown2=ntowp2
If testinit<=1 Then
 tmapchanged=0
EndIf  
tinittowp=0
If tinittown=2 Then
	tinittown=3
Else
	tinittown=0
EndIf
k8=6
End Sub
Function initmaptexture() As uint 
Dim As hbitmap hbmp
Dim As hdc bmpdc
Dim As uint x,y,bmpx,bmpy,itexture
Dim As Any Ptr bmpbits
x=300:y=300
hbmp=guicreateDIBbmp(x,y)
bmpbits=guigetbmpdibbits(hbmp)
bmpdc=createcompatibleDC(guiwindc0)
selectobject(bmpdc,hbmp)
guigetbmpXY(bmpdc,bmpx,bmpy)
Dim As Integer k:Dim As uint i,j,r,transp=(110 Shl 24)
ReDim As uint picbits(1 To bmpx*bmpy)
GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
For i=1 To bmpx
	For j=1 To bmpy
		k=map(j*x960/bmpx,i*x960/bmpy)
		If k>max2(0,14-dh0+dhmaree) Then
			If x960<>1200 or planet=1 Then k=k*0.5
			If k>255 Then
				If x960=1200 and planet=0 Then 
				   r=k Shr 8
   				r=r Or 2
         		r=((r Shl 6)And 255)
				Else
				   r=k Shr 7
					r=((r Shl 6)And 255)
				EndIf 	
      		r=(r Shl 16)Or(r Shl 8)
	   		picbits(i+(j-1)*bmpx)=(k shl 9)Or r Or transp'green land
			Else 
	   		picbits(i+(j-1)*bmpx)=(k Shl 8) Or transp'green land
			EndIf 	
		Else 	
			If planet=0 Then
				picbits(i+(j-1)*bmpx)=180 'blue water
			Else
				picbits(i+(j-1)*bmpx)=70
			EndIf
		EndIf
	Next
Next
SetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
glGenTextures(1, @itexture)
'guinotice("texture="+Str(itexture),"ok")
glEnable GL_TEXTURE_2D 
glBindTexture(GL_TEXTURE_2D, itexture) 
gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA ,GL_UNSIGNED_BYTE ,bmpbits )
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA ,GL_UNSIGNED_byte ,@(picbits(1)) ) 
'guinotice("ok mipmap")
glBindTexture0 (GL_TEXTURE_2D, 0)
deletedc(bmpdc)
deleteobject(hbmp)
Return itexture 
End function
Sub initterrain
'If tinittown=2 Then Sleep 4000
'Dim As hbitmap hbmp,hbmp2
'Dim As hdc bmpdc,bmp2dc
Dim As Integer x,y,bmpx,bmpy,bmp2x,bmp2y,itexture,pix,i,j
Dim As Single h,k,hmin
/'If FileExists("media/terrain_height"+Str(imap)+".jpg")<>0 Then
	hbmp=guiloadimage("media/terrain_height"+Str(imap)+".jpg")
Else 	
	hbmp=guiloadimage("media/terrain_height"+Str(1)+".jpg")
EndIf
bmpdc=createcompatibleDC(guiwindc0)
selectobject(bmpdc,hbmp)
guigetbmpXY(bmpdc,bmpx,bmpy)
If FileExists("media/terrain_texture"+Str(imap)+".jpg")<>0 Then
	hbmp2=guiloadimage("media/terrain_texture"+Str(imap)+".jpg")
Else
  If FileExists("addon/"+addon(imap)+".jpg")<>0 Then
	 hbmp2=guiloadimage("addon/"+addon(imap)+".jpg")
  Else
	 hbmp2=guiloadimage("media/terrain_texture"+Str(1)+".jpg")
  EndIf 
EndIf
bmp2dc=createcompatibleDC(guiwindc0)
selectobject(bmp2dc,hbmp2)
guigetbmpXY(bmp2dc,bmp2x,bmp2y)
'/
For x=-100 To 612
	For y=-100 To 612
		terrain(x,y)=0-74
		terraincolor(x,y).z=1
		terraincolor(x,y).y=0.2
		terraincolor(x,y).x=0.2
	Next
Next
hmin=255
For x=0 To 512-1
	For y=0 To 512-1
		pix=0'getpixel(bmpdc,Int(0.1+bmpx*x/512),Int(0.1+bmpy*y/512))
		h=((pix And 255)+((pix Shr 8)And 255)+((pix Shr 16)And 255))/3
		terrain(x,y)=h-74
		hmin=min(hmin,h)
		k=min(1.0,max(0.5,(h-20)/20))
		If imap<4 Then 
			'pix=getpixel(bmp2dc,Int(0.1+bmp2x*((x*4) Mod 512)/512),Int(0.1+bmp2y*((y*4) Mod 512)/512))
		Else 
			'pix=getpixel(bmp2dc,Int(0.1+bmp2x*(x)/512),Int(0.1+bmp2y*(y)/512))
		EndIf
      terraincolor(x,y).z=k*((pix Shr 16)And 255)/255.0
      terraincolor(x,y).y=k*((pix Shr 8)And 255)/255.0
      terraincolor(x,y).x=k*(pix And 255)/255.0
      terraincolor0(x,y).z=terraincolor(x,y).z
      terraincolor0(x,y).y=terraincolor(x,y).y
      terraincolor0(x,y).x=terraincolor(x,y).x
	Next
Next
/'deletedc(bmpdc)
deletedc(bmp2dc)
deleteobject(hbmp2)
deleteobject(hbmp)
'/
dmx0=0:dmy0=0
If imap>=4 Then 
   getmap
   x=0
	For i=1 To x960
		For j=1 To x960
			map(i,j)=Abs(map(i,j))
			x=max2(x,map(i,j))
		Next
	Next
	If x>16000 Then
		For i=1 To x960
			For j=1 To x960
				map(i,j)*=0.03
			Next
		Next
	EndIf
   kscalex=kscalex00*sqr(1200/x960)
   scalex=500*kscalex/100
   'guinotice Str(dmx0)+" "+Str(dmy0)
   'guinotice Str(dmx0/(kscalex00/100))+" "+Str(dmy0/(kscalex00/100))
   dmx0*=scalex/500:dmy0*=scalex/500
   'dmx0*=sqr(1200/x960)*scalex/500
   'dmy0*=sqr(1200/x960)*scalex/500  
   initterrain2
   'waterz=(-60+dhmaree+0.01)*scalez
   waterz0=(-60)*scalez
   waterz0=min(waterz,waterz0)
Else
	dmx0*=kscalex/100
	dmy0*=kscalex/100
   scalex=500*kscalex/100
	waterz=-9999*scalez
	waterz0=-9999*scalez
   Dim As Integer ix,iy
   Dim As Single alt,hh,hh1,hh2,hh3
   For ix=0 To 512
   	For iy=0 To 512
           alt=(terrain(ix,iy)-hmin)*scalez
           hh=1.0:hh1=1.0:hh2=0:hh3=0
           If alt>1800 Then hh=min(1.5,1.0+(alt-1800)/400)
           If alt>2000 Then hh1=min(3.5,1.0+(alt-2000)/400)
           If alt>3000 Then hh2=0.7
           'h=terrain(ix,iy)+74
           'If h<7 Then hh3=min(0.32,(7-h)/24)
           terraincolor(ix,iy).x=min(1.0,terraincolor0(ix,iy).x*hh+hh2)
           terraincolor(ix,iy).y=min(1.0,terraincolor0(ix,iy).y*hh1+hh2+hh3)
           terraincolor(ix,iy).z=min(1.0,terraincolor0(ix,iy).z*hh1+hh2)
   	Next
   Next
   For x=-100 To 612
	 For y=-100 To 612
		If x<0 Or x>=512 Or y<0 Or y>=512 Then 
		   terraincolor(x,y).z=0.1
		   terraincolor(x,y).y=0.59
		   terraincolor(x,y).x=0.1
		EndIf 
		water(x,y)=0
		terrain2(x,y)=terrain(x,y)
	 Next
   Next
   For x=0 To 512
	   For y=0 To 512
	   	terraincolory0(x,y)=terraincolor(x,y).y
	   Next
   Next 
EndIf
Randomize((imap-1)*101)
For x=0 To 128
	For y=0 To 128
		If Rnd<0.25 Then
			forest(x,y)=0
		Else
			If Rnd<0.2 Then
				forest(x,y)=1
			Else
				forest(x,y)=2
			EndIf
		EndIf
	Next
Next
dmx000=dmx0:dmy000=dmy0
End Sub
Sub terrainline(ix As Integer,iy As Integer,jx As Integer,jy As Integer, _  
	             r As Single=1.0,g As Single=0,b As Single=0.9)
Dim As Integer x,y,xx,yy
Dim As Single dx,dy,dist,xxx,yyy,h0,h
randomize(ix+iy+jx+jy)
x=Int((ix-dmx0)/scalex+100000)-100000+256
y=Int((iy-dmy0)/scalex+100000)-100000+256
xx=Int((jx-dmx0)/scalex+100000)-100000+256
yy=Int((jy-dmy0)/scalex+100000)-100000+256
xxx=x
yyy=y
dist=Abs(xx-xxx)+Abs(yy-yyy)+1
dx=0.5*((Rnd-0.5)*0.4+(xx-xxx)/dist)
dy=0.5*((Rnd-0.5)*0.4+(yy-yyy)/dist)
h=-9999:h0=h
While dist>3
  If Rnd<0.01 Or (dist<20 And Rnd<0.05) Then
     dx=0.5*((Rnd-0.5)*0.4*min(1.0,dist/80.0)+(xx-xxx)/dist)
     dy=0.5*((Rnd-0.5)*0.4*min(1.0,dist/80.0)+(yy-yyy)/dist)
  EndIf
  xxx+=dx
  yyy+=dy
  dist=Abs(xx-xxx)+Abs(yy-yyy)+1
  If Int(xxx)<>x Or Int(yyy)<>y Then 
      x=Int(xxx)
      y=Int(yyy)
		If x>-100 And x<612 And y>-100 And y<612 Then 
			h0=h:h=terrain(x,y):If Abs(h-h0)>40 And h0>(-999) Then Exit While
			If water(x,y)=0 And water(x-1,y)=0 And water(x+1,y)=0 _ 
			   And water(x,y-1)=0 And water(x,y+1)=0 Then  
   		   terraincolor(x,y).x=r
	   	   terraincolor(x,y).y=g
		      terraincolor(x,y).z=b
		   EndIf    
		EndIf
  EndIf 		
Wend 
End Sub
Dim Shared As Integer nobj,nobj2:nobj=nairport+ntown
Dim Shared As Integer objx(nobj),objy(nobj),objtype(nobj)
Sub initterrainlines()
Dim As Integer i,j,k,ix,iy,jx,jy,dx,dy,dx2,dy2,dx3,dy3,dxmax,dist,dist1
Dim As Integer dx4,dy4,dx5,dy5
If planet=1 Then Exit Sub
Exit Sub  
i=1:j=1
For k=1 To nairport2+ntown2
	If i>ntown2 Then i=ntown2
	If j>nairport2 Then j=nairport2
	If towny(i)>=airporty(j) And i<=ntown2 Then 
		objx(k)=townx(i):objy(k)=towny(i):i+=1
		objtype(k)=0
	ElseIf j>=nairport2 Then  
		objx(k)=townx(i):objy(k)=towny(i):i+=1
		objtype(k)=0
	Else
		objx(k)=airportx(j):objy(k)=airporty(j):j+=1
		objtype(k)=1
	EndIf
Next
nobj2=nairport2+ntown2
For i=1 To nobj2-1
	ix=objx(i)
	iy=objy(i)
	dxmax=300000*((x960/1200)^0.7)
	If objtype(i)=1 Then dxmax=120000*((x960/1200)^0.7)
	dx=dxmax:dy=dxmax:dx2=dx:dy2=dy:dx3=dx:dy3=dy:dist=dxmax
	dx4=dx:dy4=dy:dx5=dx:dy5=dy
	For j=nobj2 To i+1 Step -1
		If objtype(j)=0 Then dist1=dist Else dist1=min2(dist,120000*((x960/1200)^0.7))
		If Abs(objx(j)-ix)<=dist1 Then
			If Abs(objy(j)-iy)<=dist1 Then
				'dx5=dx4:dy5=dy4
				'dx4=dx3:dy4=dy3
				'dx3=dx2:dy3=dy2
				If objtype(i)=0 Then dx2=dx:dy2=dy
				dx=objx(j)-ix
				dy=objy(j)-iy
				dist=max2(Abs(dx),Abs(dy))
			EndIf
		EndIf
	Next
	'dx=10000:dy=10000
	If Abs(dx)<dxmax And Abs(dy)<dxmax Then terrainline(ix,iy,ix+dx,iy+dy)
	If Abs(dx2)<dxmax And Abs(dy2)<dxmax Then	terrainline(ix,iy,ix+dx2,iy+dy2)
	'If Abs(dx3)<dxmax And Abs(dy3)<dxmax Then	terrainline(ix,iy,ix+dx3,iy+dy3)
	'If Abs(dx4)<dxmax And Abs(dy4)<dxmax Then	terrainline(ix,iy,ix+dx4,iy+dy4)
	'If Abs(dx5)<dxmax And Abs(dy5)<dxmax Then	terrainline(ix,iy,ix+dx5,iy+dy5)
Next
End Sub
Dim Shared As Double timeseashore
Dim Shared As Single seashorex,seashorey,seashoreo1
Sub drawseashore()
if	oceansound=0 Then Exit Sub 	
Dim As Single x,y,x1,y1,x0,y0,do1,z,dz
Dim As integer i,j
Dim As Single dx,dy,dx2,distocean2
If time2>timeseashore+2 Or tupdateseashore=1 Then
	timeseashore=time2
	tupdateseashore=0
	Var d500=scalex*2/5.0
	Var mmx=mx+(mz-mzh-waterz)*cos1
	Var mmy=my+(mz-mzh-waterz)*sin1
	seashorex=Int(mmx/d500)*d500
	seashorey=Int(mmy/d500)*d500
	dx=200:dz=waterz-0.11+dhseashore-2
	'dx2=dx*2
	seashoreo1=1
	'If getterrainheight(mmx-dx,mmy)<dz And  getterrainheight(mmx-dx2,mmy)<dz Then seashoreo1=180
	'If getterrainheight(mmx+dx,mmy)<dz And  getterrainheight(mmx+dx2,mmy)<dz Then seashoreo1=0
	'If getterrainheight(mmx,mmy-dx)<dz And  getterrainheight(mmx,mmy-dx2)<dz Then seashoreo1=90
	'If getterrainheight(mmx,mmy+dx)<dz And  getterrainheight(mmx,mmy+dx2)<dz Then seashoreo1=-90
	Var z1=getterrainheight(mmx-dx,mmy),z2=getterrainheight(mmx+dx,mmy)
	Var z3=getterrainheight(mmx,mmy-dx),z4=getterrainheight(mmx,mmy+dx)
	If z1<dz Or z2<dz Or z3<dz Or z4<dz Then 
	 If Abs(z2-z1)>Abs(z4-z3) Then
		If z1<z2 Then seashoreo1=180 Else seashoreo1=0
	 Else
		If z3<z4 Then seashoreo1=90 Else seashoreo1=-90
	 EndIf 
	EndIf
EndIf
If Abs(seashoreo1-1)<0.001 Then Exit Sub 
'texscale=(8000/scalex)/6.12
'texscale=2:dtx=-0.5-(0.1+mxx/scalex)/texscale:dty=-0.5-(0.1+myy/scalex)/texscale'kcos
glbindtexture(gl_texture_2d,seawavetext)'watertext)'seawavetext)
glEnable GL_BLEND
'glBlendFunc GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA
glBlendFunc GL_SRC_color,GL_ONE_MINUS_SRC_color
'glcolor4f(0.2,0.2,1,0.7)
z=waterz-0.1+dhseashore-2
        glpushmatrix
        gltranslatef(seashorex,seashorey,z)
        'seashoreo1=0
        glrotatef(90+seashoreo1,0,0,1)
	  	  Var t0=Timer*0.034,tx=5.0'0.75
	  	  dx=scalex
	  	  dx2=dx'*2
		  t0=(t0-Int(t0))
		  'gltexcarre(scalex*0.6,1+(time2*0.07-Int(time2*0.07)))
        'gltexcarre(scalex,time2)
        'glbindtexture(gl_texture_2d,watertext) 
        glcolor3f(0.65,0.65,0.96)
		  'If tlight1=1 Then glenable gl_light1
        'glenable gl_blend
	     glbegin(gl_quads)
	     glTexCoord2f(0,t0)
	     glvertex3f(-dx,-dx2,0)
	     gltexcoord2f(tx,t0)
	     glvertex3f(dx,-dx2,0)
	     glTexCoord2f(tx,t0+tx)
	     glvertex3f(dx,dx2,0)
	     gltexcoord2f(0,t0+tx)
	     glvertex3f(-dx,dx2,0)
	     glend()
	     gldisable gl_blend
        glpopmatrix
End Sub
Function getterrainheight(ByVal x As Single,ByVal y As Single) As Single
Dim As Single h,dx,dy,z00,z10,z01,z11 
Dim As Integer i,j,i1,j1
If orbit=0 And planet=1 Then Return -99999
	i=Int(x/scalex+100000)-100000
	If i<=-100-256 Or i>=612-256-2 Then Return -99999
	j=Int(y/scalex+100000)-100000
	If j<=-100-256 Or j>=612-256-2 Then Return -99999
	dx=x/scalex-i
	dy=y/scalex-j
	i+=256
	j+=256
	'while i<-100:i+=512+200:Wend 
	'While i>=612:i-=512+200:Wend 
	'while j<-100:j+=512+200:Wend 
	'While j>=612:j-=512+200:Wend
	i1=i+1
	j1=j+1
	'While i1>=612:i1-=512+200:Wend
	'While j1>=612:j1-=512+200:Wend 
z00=terrain(i,j)
z10=terrain(i1,j)
z01=terrain(i,j1)
z11=terrain(i1,j1)
If dx<=(1.0-dy) Then 
     h=( dx*(z10-z00) +dy*(z01-z00) +z00)
Else 
     h=( (1-dx)*(z01-z11) +(1-dy)*(z10-z11) +z11 )
EndIf 
'Var hmax=max(Abs(x-mx),Abs(y-my))+mzsol0'+mz-mz0
'Return min(h*scalez,hmax)
Return h*scalez
End Function
Dim Shared As Integer tsetterrainrunway
Function setterrainheight(ByVal x As Single,ByVal y As Single,xco11 As Single,xsi11 As Single,trunway As Integer=0) As Single
Dim As Single h,dx,dy,z00,z10,z01,z11 
Dim As Integer i,j,i1,j1
If orbit=0 And planet=1 Then Return -99999
	i=Int(x/scalex+100000)-100000
	If i<=-100-256 Or i>=612-256-2 Then Return -99999
	j=Int(y/scalex+100000)-100000
	If j<=-100-256 Or j>=612-256-2 Then Return -99999
	dx=x/scalex-i
	dy=y/scalex-j
	i+=256
	j+=256
	'while i<-100:i+=512+200:Wend 
	'While i>=612:i-=512+200:Wend 
	'while j<-100:j+=512+200:Wend 
	'While j>=612:j-=512+200:Wend
	i1=i+1
	j1=j+1
	'While i1>=612:i1-=512+200:Wend
	'While j1>=612:j1-=512+200:Wend 
getlockterrain()
var t4=3
Var t1=0'1
If tsetterrain(i,j)<=t1 Then
	z00=terrain0(i,j)
Else
	z00=terrain(i,j)
EndIf 	
If tsetterrain(i1,j)<=t1 Then
	z10=terrain0(i1,j)
Else
	z10=terrain(i1,j)
EndIf 	
If tsetterrain(i,j1)<=t1 Then
	z01=terrain0(i,j1)
Else
	z01=terrain(i,j1)
EndIf
If tsetterrain(i1,j1)<=t1 Then
	z11=terrain0(i1,j1)
Else
	z11=terrain(i1,j1)
EndIf 	
Var hwaterz=(waterz)/scalez
'If z00<hwaterz Then z00=hwaterz
'If z10<hwaterz Then z10=hwaterz
'If z01<hwaterz Then z01=hwaterz
'If z11<hwaterz Then z11=hwaterz
'Var dr=1.0,d100=270.0,d10=270.0
Var dr=1.0,d10=0.32,d100=100.0'1.0
var dr0=0.32'(Abs(dx)+Abs(dy))*0.25'0.5
'Var xsi0=0.436,xco0=0.9
Var xsi1=xsi11,xco1=xco11
If trunway=1 Then d100=0'dr0=0
If dx<=(1.0-dy) Then 
     h=max(hwaterz,( dx*(z10-z00) +dy*(z01-z00) +z00))
  'If tsetterrain(i,j)<=t4 Then tsetterrain(i,j)+=1:terrain(i,j)=z00+(h-z00)*(Abs(dx*xsi1-dy*xco1)/max(0.01,Abs(dx)+Abs(dy)))'*d100/max(d10,Abs(dx)+Abs(dy))
  'If tsetterrain(i1,j)<=t4 Then tsetterrain(i1,j)+=1:terrain(i1,j)=z10+(h-z10)*(Abs((1-dx)*xsi1-dy*xco1)/max(0.01,Abs(1-dx)+Abs(dy)))'*d100/max(d10,Abs(1-dx)+Abs(dy))
  'If tsetterrain(i,j1)<=t4 Then tsetterrain(i,j1)+=1:terrain(i,j1)=z01+(h-z01)*(Abs(dx*xsi1-(1-dy)*xco1)/max(0.01,Abs(dx)+Abs(1-dy)))'*d100/max(d10,Abs(dx)+Abs(1-dy))
  If tsetterrain(i,j)<=t4 And h<z00 Then
   dr0=max(0.02,Abs(dx)+Abs(dy))
  	dr=(dx*xsi1-dy*xco1)
  	If Abs(dr+dr)>dr0 Then
  	 tsetterrain(i,j)+=1
  	 'terrain(i,j)=h-(h-z00)*min(dr,dr0)*d100/max(d10,dr0)
  	 Var dh=d100*dr0:If dr<0 Then dh=-dh
  	 Var dh0=(h-z00)*dr 
  	 If Abs(dh)<Abs(dh0) Then terrain(i,j)=h+dh
  	EndIf  
  EndIf
  If tsetterrain(i1,j)<=t4 And h<z10 Then
   dr0=max(0.02,Abs(1-dx)+Abs(dy))
  	dr=((1-dx)*xsi1-dy*xco1)
  	If Abs(dr+dr)>dr0 Then
  	 tsetterrain(i1,j)+=1
  	 'terrain(i1,j)=h-(h-z10)*min(dr,dr0)*d100/max(d10,dr0)
  	 Var dh=d100*dr0:If dr<0 Then dh=-dh
  	 Var dh0=(h-z10)*dr
  	 If Abs(dh)<Abs(dh0) Then terrain(i1,j)=h+dh
  	EndIf  
  EndIf
  If tsetterrain(i,j1)<=t4 And h<z01 Then
   dr0=max(0.02,Abs(dx)+Abs(1-dy))
  	dr=(dx*xsi1-(1-dy)*xco1)
  	If Abs(dr+dr)>dr0 Then
  	 tsetterrain(i,j1)+=1
  	 'terrain(i,j1)=h-(h-z01)*min(dr,dr0)*d100/max(d10,dr0)
  	 Var dh=d100*dr0:If dr<0 Then dh=-dh
  	 Var dh0=(h-z01)*dr
  	 If Abs(dh)<Abs(dh0) Then terrain(i,j1)=h+dh
  	EndIf  
  EndIf
  z00=terrain0(i,j)
  z10=terrain0(i1,j)
  z01=terrain0(i,j1)
  'z11=terrain0(i1,j1)
  h=max(hwaterz,( dx*(z10-z00) +dy*(z01-z00) +z00))
Else 
     h=max(hwaterz,( (1-dx)*(z01-z11) +(1-dy)*(z10-z11) +z11 ))
  'If tsetterrain(i1,j)<=t4 Then tsetterrain(i1,j)+=1:terrain(i1,j)=z10+(h-z10)*(Abs((1-dx)*xsi1-dy*xco1)/max(0.01,Abs(1-dx)+Abs(dy)))'*d100/max(d10,Abs(1-dx)+Abs(dy))
  'If tsetterrain(i,j1)<=t4 Then tsetterrain(i,j1)+=1:terrain(i,j1)=z01+(h-z01)*(Abs(dx*xsi1-(1-dy)*xco1)/max(0.01,Abs(dx)+Abs(1-dy)))'*d100/max(d10,Abs(dx)+Abs(1-dy))
  'If tsetterrain(i1,j1)<=t4 Then tsetterrain(i1,j1)+=1:terrain(i1,j1)=z11+(h-z11)*(Abs((1-dx)*xsi1-(1-dy)*xco1)/max(0.01,Abs(1-dx)+Abs(1-dy)))'*d100/max(d10,Abs(1-dx)+Abs(1-dy))
  If tsetterrain(i1,j)<=t4 And h<z10 Then
   dr0=max(0.02,Abs(1-dx)+Abs(dy))
  	dr=((1-dx)*xsi1-dy*xco1)
  	If Abs(dr+dr)>dr0 Then
  	 tsetterrain(i1,j)+=1
  	 'terrain(i1,j)=h-(h-z10)*min(dr,dr0)*d100/max(d10,dr0)
    Var dh=d100*dr0:If dr<0 Then dh=-dh
  	 Var dh0=(h-z10)*dr
  	 If Abs(dh)<Abs(dh0) Then terrain(i1,j)=h+dh
  	EndIf  
  EndIf
  If tsetterrain(i,j1)<=t4 And h<z01 Then
   dr0=max(0.02,Abs(dx)+Abs(1-dy))
  	dr=(dx*xsi1-(1-dy)*xco1)
  	If Abs(dr+dr)>dr0 Then
  	 tsetterrain(i,j1)+=1
  	 'terrain(i,j1)=h-(h-z01)*min(dr,dr0)*d100/max(d10,dr0)
  	 Var dh=d100*dr0:If dr<0 Then dh=-dh
  	 Var dh0=(h-z01)*dr
  	 If Abs(dh)<Abs(dh0) Then terrain(i,j1)=h+dh
  	EndIf  
  EndIf
  If tsetterrain(i1,j1)<=t4 And h<z11 Then
   dr0=max(0.02,Abs(1-dx)+Abs(1-dy))
  	dr=((1-dx)*xsi1-(1-dy)*xco1)
  	If Abs(dr+dr)>dr0 Then
  	 tsetterrain(i1,j1)+=1
  	 'terrain(i1,j1)=h-(h-z11)*min(dr,dr0)*d100/max(d10,dr0)
  	 Var dh=d100*dr0:If dr<0 Then dh=-dh
  	 Var dh0=(h-z11)*dr
  	 If Abs(dh)<Abs(dh0) Then terrain(i1,j1)=h+dh
  	EndIf  
  EndIf
  'z00=terrain0(i,j)
  z10=terrain0(i1,j)
  z01=terrain0(i,j1)
  z11=terrain0(i1,j1)
  h=max(hwaterz,( (1-dx)*(z01-z11) +(1-dy)*(z10-z11) +z11 ))
EndIf
freelockterrain()
'Var hmax=max(Abs(x-mx),Abs(y-my))+mzsol0'+mz-mz0
'Return min(h*scalez,hmax)
Return h*scalez
End Function
Function getterrainheight2 (ByVal x As Single,ByVal y As Single) As Single
Dim As Single h,dx,dy,z00,z10,z01,z11 
Dim As Integer i,j,i1,j1
If orbit=0 And planet=1 Then Return -999999
	i=Int(x/scalex+1000000)-1000000
	If i<=-100-256 Or i>=612-256-2 Then Return -999999
	j=Int(y/scalex+1000000)-1000000
	If j<=-100-256 Or j>=612-256-2 Then Return -999999
	dx=x/scalex-i
	dy=y/scalex-j
	i+=256
	j+=256
	'while i<-100:i+=512+200:Wend 
	'While i>=612:i-=512+200:Wend 
	'while j<-100:j+=512+200:Wend 
	'While j>=612:j-=512+200:Wend
	i1=i+1
	j1=j+1
	'While i1>=612:i1-=512+200:Wend
	'While j1>=612:j1-=512+200:Wend 
z00=terrain22(i,j)
z10=terrain22(i1,j)
z01=terrain22(i,j1)
z11=terrain22(i1,j1)
If dx<=(1.0-dy) Then 
     h=( dx*(z10-z00) +dy*(z01-z00) +z00)
Else 
     h=( (1-dx)*(z01-z11) +(1-dy)*(z10-z11) +z11 )
EndIf 
'Var hmax=max(Abs(x-mx),Abs(y-my))+mzsol0'+mz-mz0
'Return min(h*scalez,hmax)
Return h*scalez
End Function
Function getterrainheightfast(ByVal x As Single,ByVal y As Single) As Single
'Dim As Single h,dx,dy,z00,z10,z01,z11 
Dim As Integer i,j,i1,j1
'If orbit=0 And planet=1 Then Return -999999
'glvertex3fx((ii-256.1)*scalex,(jj-256.1)*scalex,scalez*terrain(ii,jj))
	'i=Int(x/scalex+1000000.5)-1000000+256
	'dx=x/scalex-i
	'j=Int(y/scalex+1000000.5)-1000000+256
	'dy=y/scalex-j
	i=Int(x/scalex+256.5)
	If i<=-100 Or i>=612 Then Return -999999
	j=Int(y/scalex+256.5)
	If j<=-100 Or j>=612 Then Return -999999
	'i+=256
	'j+=256
	/'If i<=-100 Then
		Return -999999
	ElseIf i>=612 Then
	 Return -999999
	ElseIf j<=-100 Then
	 Return -999999
	ElseIf j>=612 Then
	 Return -999999
	EndIf '/  
	'while i<-100:i+=512+200:Wend 
	'While i>=612:i-=512+200:Wend 
	'while j<-100:j+=512+200:Wend 
	'While j>=612:j-=512+200:Wend
	'i1=i+1
	'j1=j+1
	'While i1>=612:i1-=512+200:Wend
	'While j1>=612:j1-=512+200:Wend 
'Var hmax=max(Abs(x-mx),Abs(y-my))+mzsol0'+mz-mz0
Return terrain(i,j)*scalez
'Return h*scalez
End Function
Sub submap_old
Dim As uint i
  getcomboindex("win.map",i)
  i=i+3'4
  If i>0 And i<>imap Then
  	 imap=i:initterrain:initairship
  	 orbit=1
  	 init=2'subreset(1)
  	 quit=1:restart=2
  EndIf
  guisetfocus("win.graph")
End Sub
Dim Shared As String combotext
Declare Function subflyto(lat1 As Single,lng1 As single)As Integer  
Sub submap
Var lat0=lat,lng0=lng,o10=o1
lat=0
Dim As uint i,j=0
getcomboindex("win.map",i)
combotext=""
j+=1:if i=j or(combotext="world")then lat=49.35600551121942   :lng=0.06075459446313726   :o1=110: 
j+=1:if i=j or(combotext="deauville marinas")then lat=49.36198047661674   :lng=0.07262960190958628   :o1=120: 
j+=1:if i=j or(combotext="deauville plage")then lat=49.35600551121942   :lng=0.06075459446313726   :o1=110: 
j+=1:if i=j or(combotext="trouville plage")then lat=49.36663106706898   :lng=0.07818353983048315   :o1=130: 
j+=1:if i=j or(combotext="nancy")then lat=48.69306979368741   :lng=6.182922715725031   :o1=70: 
j+=1:if i=j or(combotext="crickvenica")then lat=45.1734569955986   :lng=14.689314428610118   :o1=-110: 
j+=1:if i=j or(combotext="paris tolbiac")then lat=48.826125291730506   :lng=2.3570559500472212   :o1=0: 
j+=1:if i=j or(combotext="paris defense")then lat=48.891977155490395   :lng=2.237673523003608   :o1=160: 
j+=1:if i=j or(combotext="ivry romain roland")then lat=48.80346335679542   :lng=2.3934673532940915   :o1=-50: 
j+=1:if i=j or(combotext="orsay")then lat=48.706787   :lng=2.180894999999964   :o1=-30: 
j+=1:if i=j or(combotext="le barcares")then lat=42.78764305091493   :lng=3.0338932951133533   :o1=175:  
j+=1:if i=j or(combotext="jerusalem")then lat=31.776636707589287   :lng=35.2337121963501   :o1=36.3920: 
j+=1:if i=j or(combotext="marseille")then lat=43.2803905:lng=5.405139   :o1=36.3920: 
j+=1:if i=j or(combotext="nice")then lat=43.7031905:lng=7.252817  :o1=36.3920: 
j+=1:if i=j or(combotext="arcachon")then lat=44.6514284:lng=-1.171656  :o1=36.3920: 
j+=1:if i=j or(combotext="grenoble")then lat=45.1841656:lng=5.7155425 :o1=36.3920: 
j+=1:if i=j or(combotext="san francisco")then lat=37.7577:lng=-122.4376 :o1=36.3920: 
j+=1:if i=j or(combotext="new york")then lat=40.7033121:lng=-73.97968 :o1=36.3920: 
j+=1:if i=j or(combotext="atlanta")then lat=33.7677129:lng=-84.42060 :o1=36.3920: 
j+=1:if i=j or(combotext="rio")then lat=-22.8650853:lng=-43.13109 :o1=36.3920: 
j+=1:if i=j or(combotext="hong kong")then lat=22.3700556:lng=114.153758 :o1=36.3920: 
j+=1:if i=j or(combotext="athenes")then lat=37.9908372:lng=23.7383394 :o1=36.3920: 
j+=1:if i=j or(combotext="perth")then lat=-31.9546529:lng=115.852662 :o1=36.3920: 
j+=1:if i=j or(combotext="le caire")then lat=30.04441959:lng=31.23571160:o1=36.3920: 
j+=1:if i=j or(combotext="washington")then lat=38.8850399:lng=-77.08054296:o1=36.3920: 
j+=1:if i=j or(combotext="tajmahal")then lat=27.17015:lng=78.002155:o1=36.3920: 

If Abs(lat)<0.00001 Then
	lat=lat0:lng=lng0:o1=o10
	selectcomboindex("win.map",icombomap) 
Else
   Var test=subflyto(lat,lng)
   If test=0 Then
   	lat=lat0:lng=lng0:o1=o10
   	selectcomboindex("win.map",icombomap) 
   Else
   	icombomap=i
   	
		itownp=0
      resetaeroway()
      resetmxweb()
      resettownwaynode()
      resetfuel()
      timeinit=Timer
      resetsrtm()
      resetterrain()
   EndIf
EndIf
Sleep 500
guisetfocus("win.graph")
End Sub
Sub subgrass
Dim As uint i
  getcomboindex("win.grass",i)
  If i>0 Then igrass=i
  guisetfocus("win.graph")
End Sub
Sub subfog
Dim As uint i
  getcomboindex("win.fog",i)
  If i>0 Then ifog=i-1
  setfog
  guisetfocus("win.graph")
End Sub
Sub subscalez
Dim As uint i
  getcomboindex("win.scalez",i)
  If i>0 Then scalez=21-i
  dmx00=dmx0:dmy00=dmy0
  initterrain3
  'waterz=(-60+dhmaree+0.01)*scalez
  waterz0=(-60)*scalez
  waterz0=min(waterz,waterz0)
  initairport
  inittown
  'initterrainlines
  initarbres
  inithouses
  'initdomes
  initgrass
  xweb1-=1000000
  guisetfocus("win.graph")
End Sub
Sub Subscreen
	confirm("change fullscreen mode ? (you'll have to restart)","confirm",resp)
	If resp<>"yes" Then Exit Sub 
	If fullscreen=0 Then fullscreen=1 Else fullscreen=0
	quit=1':restart=1
End Sub
Sub initcar 
 If car=1 Or (car=0 And typeavion=1) Then 
 	cartext=guiloadtexture("objects/car.jpg",240,245)
 Else
 	If car=2 Then 
 	   cartext=guiloadtexture("objects/car2.jpg",240,245)
 	Else 
 	   cartext=guiloadtexture("objects/car3.jpg",240,245)
 	EndIf 	
 EndIf
End Sub 
Sub initcow
	Dim As Integer i
	Randomize((imap-1)*100)
   If cowtext=0 Then 
   	cowtext=guiloadtexture("objects/cow.jpg")
      cowlist=glgenlists(1)
      glnewlist cowlist,gl_compile 
      loadobjsize("objects/cowlowpoly.obj",@"",@"",31)'40)
      glendlist
   Else
   	tupdatecow=1
   	Exit Sub 
   EndIf
	For i=1 To ncow	
     cowx(i)=((Rnd-0.5)*2+2*Int(mx/(2*distcow)))*distcow
     cowy(i)=((Rnd-0.5)*2+2*Int(my/(2*distcow)))*distcow
     cowz(i)=getterrainheight(cowx(i),cowy(i))
     cowo1(i)=Rnd*360 
	Next
End Sub 
Sub setarbretype(treetype As string)
Dim As Integer i,j
Randomize(Int(lat)+Int(lng))
If treetype="mixed" Then 
	For i=1 To narbre
	  arbretype(i)=Int(Rnd*6.25)+1
	  If Rnd<0.4033 Then arbretype(i)=7	
     arbretype0(i)=arbretype(i)		
	Next
ElseIf treetype="broad" Then
	For i=1 To narbre
	  arbretype(i)=Int(Rnd*6.25)+1	
     arbretype0(i)=arbretype(i)		
	Next
ElseIf treetype="needle" Then
	For i=1 To narbre
	  arbretype(i)=Int(Rnd*6.25)+1	
	  If Rnd<0.7772 Then arbretype(i)=7	
     arbretype0(i)=arbretype(i)		
	Next
EndIf
Randomize 
End Sub
Sub initarbres
	initcow()
	initroc()
	Dim As Integer i
	Randomize((imap)*100)
	'distarbre=5000
   distarbre=4000*Sqr(narbre/700)
   distarbre=4000*Sqr(2500/700)
	distarbre0=distarbre
	distbuisson=distarbre
   If arbretext(1)=0 Then 
    For i=1 To 7
   	arbretext(i)=guiloadtexture("media/arbre"+Str(i)+".jpg",130)'117)'130)'180)
    Next
    arbreflowertext=guiloadtexture("media/flower3.jpg",230)'180)
    arbreflower2text=guiloadtexture("media/flower1.jpg",230)'180)
    arbresequoiatext=guiloadtexture("media/treesequoia.jpg",230)'180)
    arbreautumntext=guiloadtexture("media/autumn1.jpg",230)'180)
    arbreautumn2text=guiloadtexture("media/autumn2.jpg",230)'180)
    buissontext(3)=guiloadtexture("media/buisson1.jpg",140)'117)'130)'180)
    buissontext(4)=guiloadtexture("media/buisson2.jpg",200)'117)'130)'180)
   Else
   	tupdatearbre=2
   	Exit Sub 
   EndIf
   Var lat0=lat,lng0=lng
   mxytolatlng(mx,my)
   Var latxx=lat,lngxx=lng
   mxytolatlng(mx+distarbre*2,my+distarbre*2)
   Var dlatx=lat-latxx,dlngx=lng-lngxx
   latxx=Int(latxx/dlatx)*dlatx
   lngxx=Int(lngxx/dlngx)*dlngx
   Dim As single mmx,mmy
   latlngtomxy(latxx,lngxx,mmx,mmy)
   lat=lat0:lng=lng0
	For i=1 To narbre
	  arbretype(i)=Int(Rnd*6.25)+1	
     If i<8000 Then
      'arbrex(i)=((Rnd-0.5)*2+2*Int(mx/(2*distarbre)))*distarbre
      'arbrey(i)=((Rnd-0.5)*2+2*Int(my/(2*distarbre)))*distarbre
      arbrex(i)=((Rnd-0.5)*2+2*Int(0/(2*distarbre)))*distarbre+mmx
      arbrey(i)=((Rnd-0.5)*2+2*Int(0/(2*distarbre)))*distarbre+mmy
     Else
     	Var distarbre2=distarbre+distarbre
      'arbrex(i)=((Rnd-0.5)*2+2*Int(mx/(2*distarbre2)))*distarbre2
      'arbrey(i)=((Rnd-0.5)*2+2*Int(my/(2*distarbre2)))*distarbre2
      arbrex(i)=((Rnd-0.5)*2+2*Int(0/(2*distarbre2)))*distarbre2+mmx
      arbrey(i)=((Rnd-0.5)*2+2*Int(0/(2*distarbre2)))*distarbre2+mmy
     EndIf
     arbrez(i)=getterrainheight(arbrex(i),arbrey(i))
     arbrerot(i)=Rnd*360 
     arbrescalex(i)=1+Rnd*0.15
     arbrescalez(i)=1+Rnd*0.3
     arbrerot0(i)=arbrerot(i)
     setarbreh(i)
     arbretype0(i)=arbretype(i)		
	Next
	buissontext(1)=arbretext(2)
	buissontext(2)=arbretext(5)
	For i=1 To nbuisson
	  buissontype(i)=Int(Rnd*1.99)+1	
     buissonx(i)=(Rnd-0.5)*2*distbuisson
     buissony(i)=(Rnd-0.5)*2*distbuisson
     buissonz(i)=getterrainheight(buissonx(i),buissony(i))
     buissonrot(i)=Rnd*360 
     buissonrot0(i)=buissonrot(i)		
	Next
End Sub
Sub testairportarbres()
Dim As Integer i
For i=1 To narbre2 
     If testairport(arbrex(i),arbrey(i))=0 Then 
     	  arbrez(i)=getterrainheight(arbrex(i),arbrey(i))
     Else
     	  arbrez(i)=waterz-1
     EndIf
Next
For i=1 To nbuisson
     If testairport(buissonx(i),buissony(i),1000,110)=0 Then
     	  buissonz(i)=getterrainheight(buissonx(i),buissony(i))
     Else
     	  buissonz(i)=waterz-1
     EndIf
Next
End Sub 
Sub initgrass
Dim As Integer i  	
Dim As Integer ix,iy
Dim As Single aux
	'distgrass=500
   If grasstext(1)=0 Then 	
    For i=1 To 2
   	grasstext(i)=guiloadtexture("media/grass"+Str(i)+".gif",200)
    Next
   EndIf  
	For i=1 To ngrass
	  grasstype(i)=Int(Rnd*1.19)+1	
     grassx(i)=(Rnd-0.5)*2*distgrass
     grassy(i)=(Rnd-0.5)*2*distgrass
     grassz(i)=getterrainheight(grassx(i),grassy(i))
     grassrot(i)=Rnd*180 
     grassscalex(i)=1+Rnd*0.15
     grassscalez(i)=1+Rnd*0.3
     grasstx(i)=rnd
     grassrot0(i)=grassrot(i)		
     ix=Int(grassx(i)/scalex+10000)-10000
     iy=Int(grassy(i)/scalex+10000)-10000
     ix=max2(0,min2(512,ix))
     iy=max2(0,min2(512,iy))
     aux=1-terraincolor(ix,iy).x
     grassscalez2(i)=1.6*aux*grassscalez(i)
	Next
End Sub 
Sub inithouses
Dim As Integer i  	
nhouse=0
nhouse2=0
Dim As Single x=60,y=60
	disthouse=10000
	If building3text=0 Then 
	 building3text=guiloadtexture("media/building3.jpg")',23,70)'35,70)
	 'building32text=guiloadtexture("media/building3.jpg",1,70)'35,70)
	 building32text=guiloadtexture("media/building3night.jpg",250,70)'35,70)
	 buildingtext=guiloadtexture("media/building.jpg")
	 rooftext=guiloadtexture("media/roof.jpg")
	 whitetext=guiloadtexture("media/white.bmp",0,255)
	EndIf  
	For i=1 To nhouse
     housex(i)=(Rnd-0.5)*2*disthouse
     housey(i)=(Rnd-0.5)*2*disthouse
     housez(i)=getterrainheight(housex(i)-x,housey(i)-y)		
     housez(i)=min(housez(i),getterrainheight(housex(i)+x,housey(i)-y))		
     housez(i)=min(housez(i),getterrainheight(housex(i)+x,housey(i)+y))		
     housez(i)=min(housez(i),getterrainheight(housex(i)-x,housey(i)+y))		
  	  If testairport(housex(i),housey(i),2500,200)=1 Then
  	    	housez(i)=waterz0-1 
  	  EndIf
	Next
x=50:y=110
   disthouse2=14000 
	For i=1 To nhouse2
     house2x(i)=(Rnd-0.5)*2*disthouse2
     house2y(i)=(Rnd-0.5)*2*disthouse2
     house2z(i)=getterrainheight(house2x(i)-x,house2y(i)-y)		
     house2z(i)=min(house2z(i),getterrainheight(house2x(i)+x,house2y(i)-y))		
     house2z(i)=min(house2z(i),getterrainheight(house2x(i)+x,house2y(i)+y))		
     house2z(i)=min(house2z(i),getterrainheight(house2x(i)-x,house2y(i)+y))		
  	  If testairport(house2x(i),house2y(i),2500,200)=1 Then
  	    	house2z(i)=waterz0-1 
  	  EndIf
	Next
End Sub
'Dim Shared As uint nhorse=29,md2ihorse(nhorse)
Dim Shared As uint disthorse=20000'12000
Dim Shared As md2_model Ptr md2horse
'Dim Shared As Single horsex(nhorse),horsey(nhorse),horsez(nhorse),horseo1(nhorse),horseo2(nhorse)
Dim Shared As Integer inithorse=0
Sub inithorses
Dim As Integer i  	
Dim As uint md2inode
Dim As Single x,y
For i=1 To 4
	md2horsetext(i)=guiloadtexture("objects/horse"+Str(i)+".jpg")	
Next
For i=1 To 3
	md2zebratext(i)=guiloadtexture("objects/zebra"+Str(i)+".jpg")	
Next
/'aviontext=guiloadtexture("objects/c150.jpg")
corsairtext=guiloadtexture("objects/f4u.jpg")
vg33text=guiloadtexture("objects/vg33.jpg")
zerotext=guiloadtexture("objects/zero1.jpg")
zero2text=guiloadtexture("objects/zerogreen.jpg")
b25text=guiloadtexture("objects/b25.jpg")
alphajettext=guiloadtexture("objects/alphajet.jpg")
spitfiretext=guiloadtexture("objects/spitfire_lowpoly2.jpg")
spitfiretext2=guiloadtexture("objects/spitfire_lowpoly22.jpg")
bf109text=guiloadtexture("objects/bf109.jpg")
p51dtext=guiloadtexture("objects/p51d.jpg")
f14text=guiloadtexture("objects/f14_2.jpg")
eurofightertext=guiloadtexture("objects/eurofighter.jpg")
'/
For i=1 To nhorse
  md2inode=addmd2node(md2horse)
  If i<=12 Then 
  	setnodetexture(md2_nodes(md2inode),md2horsetext((i Mod 4)+1))
   setnodescale(md2_nodes(md2inode),0.85,0.85,0.85)
   x=-190+Rnd*700:y=-100+Rnd*700
  ElseIf i<=24 Then 
  	setnodetexture(md2_nodes(md2inode),md2zebratext((i Mod 3)+1))
   setnodescale(md2_nodes(md2inode),0.77,0.77,0.65)
   x=Rnd*700:y=-100+Rnd*700
  Else  
  	setnodetexture(md2_nodes(md2inode),md2horsetext((i Mod 4)+1))
   setnodescale(md2_nodes(md2inode),0.85,0.85,0.85)
   x=190+Rnd*700:y=-100+Rnd*700
  EndIf
  If inithorse=1 Then 
  	x=horsex(i):y=horsey(i)
  Else 
  	horseo1(i)=Rnd*360
  EndIf
  horsex(i)=x
  horsey(i)=y
  horsez(i)=getterrainheight(x,y)
  setnodeposition(md2_nodes(md2inode),x,y,horsez(i)) 
  setanim(md2_nodes(md2inode),md2_all)
  'setanimationrange(md2_nodes(md2inode),1,11)
  md2ihorse(i)=md2inode
  If i=5 Then setnodescale(md2_nodes(md2inode),0.5,0.5,0.5)
  If i=12 Then setnodescale(md2_nodes(md2inode),0.5,0.5,0.5)
  If i=20 Then setnodescale(md2_nodes(md2inode),0.5,0.5,0.5)
  If i=35 Then setnodescale(md2_nodes(md2inode),0.5,0.5,0.5)
  setnoderotation(md2_nodes(md2inode),0,0,horseo1(i))
Next i
inithorse=1
End Sub
Dim Shared As Single thorse(nhorse)
Sub movehorses
Dim As Integer i,j,k  	
Dim As Single co1,si1,co2,si2,dmx,dmy,dmz,vhorse,horsex0,horsey0,horsez0
Dim As Integer changehorse,horsesound
Dim As md2_node Ptr md2node
For i=1 To nhorse2
  md2node=md2_nodes(md2ihorse(i))	
  horseo1(i)=md2node->rotz
  co1=Cos(degtorad*horseo1(i))
  si1=Sin(degtorad*horseo1(i))	
  si2=0.6*max(-0.9,sin(degtorad*horseo2(i)))
  If si2>0 Then 
  	co2=max(0.4,Cos(degtorad*horseo2(i)))
  Else 	
  	co2=max(0.1,Cos(degtorad*horseo2(i)))
  EndIf
  If i<=6 Then
    If max(Abs(horsex(1)-md2node->x),Abs(horsey(1)-md2node->y-i*50))<500 Then
   	vhorse=5
    Else 
  	   vhorse=6.2
    EndIf 
  Else 
  	 If i<=12 Then 
      If max(Abs(horsex(7)-md2node->x),Abs(horsey(7)-md2node->y-(i-6)*50))<500 Then
   	  vhorse=4.5
      Else 
  	    vhorse=5.7
      EndIf
    Else 
    	If i<=18 Then 
        If max(Abs(horsex(13)-md2node->x),Abs(horsey(13)-md2node->y-(i-12)*50))<500 Then
   	   vhorse=4.5
        Else 
  	      vhorse=5.7
        EndIf
    	Else
    	  If i<=24 Then 	
          If max(Abs(horsex(19)-md2node->x),Abs(horsey(19)-md2node->y-(i-18)*150))<500 Then
   	     vhorse=4.5
          Else 
  	        vhorse=5.7
          EndIf
    	  Else
    	  	 If i<=30 Then 
            If max(Abs(horsex(25)-md2node->x),Abs(horsey(25)-md2node->y-(i-24)*50))<500 Then
   	       vhorse=4.5
            Else 
  	          vhorse=5.7
            EndIf
    	  	 Else 
            If max(Abs(horsex(31)-md2node->x),Abs(horsey(31)-md2node->y-(i-30)*50))<400 Then
   	       vhorse=4.5
            Else 
  	          vhorse=5.7
            EndIf
    	  	 EndIf 	
    	  EndIf 	
    	EndIf 	
    EndIf 
  EndIf
  If plane=0 Or car>0 Then vhorse*=0.69
  horsex0=horsex(i)
  horsey0=horsey(i)
  horsez0=horsez(i)
  horsex(i)=md2node->x+vhorse*co1*co2*(1+si2)*kfps*2	
  horsey(i)=md2node->y+vhorse*si1*co2*(1+si2)*kfps*2	
  horsez(i)=getterrainheight(horsex(i),horsey(i))
  dmz=GetTerrainHeight(horsex(i)+40*co1,horsey(i)+40*si1)-horsez(i)
  horseo2(i)=-Atn(dmz/40)*radtodeg
  If horseo2(i)<-30 Then
      dmy=getterrainheight(horsex(i)+40*si1,horsey(i)-40*co1)-horsez(i)
   	horseo1(i)+=sgn2(dmy)*40'3*kfps
  Else 
  	   If (horsez(i)<=waterz And horsez0>=(waterz)) Then   	   	
        dmy=getterrainheight(horsex(i)+40*si1,horsey(i)-40*co1)-horsez(i)
   	  horseo1(i)-=sgn2(dmy)*40'3*kfps
  	   EndIf
  EndIf
  If horsez(i)<waterz And horsez0>(waterz+1e-3) And time2<(thorse(i)+10.000) Then
  	 horsex(i)=horsex0
  	 horsey(i)=horsey0
  	 horsez(i)=horsez0
  Else 
  	 thorse(i)=time2
  EndIf
  If ndrawmd2<=nhorse0+1 And i>nhorse0 Then Exit For 
  If Rnd<0.02*kfps Then
  	  Var dist=40000,dist2=1.99*dist,x=horsex(i),y=horsey(i)
  	  While x<mx-dist:x+=dist2:Wend
  	  While x>mx+dist:x-=dist2:Wend
  	  While y<my-dist:y+=dist2:Wend
  	  While y>my+dist:y-=dist2:Wend
  	  horsex(i)=x:horsey(i)=y 
  	  If i=1 Or i=7 Or i=13 Or i=19 Or i=25 Then'Or i=31 Then 
  	    If Rnd<0.05 Then
  	    	horseo1(i)+=(Rnd-0.5)*120
  	    	If (Abs(horsex(i)-mx)+Abs(horsey(i)-my))>40000 Then'(distmax-7000) Then
  	    		If Abs(horsex(i)-mx)>Abs(horsey(i)-my) Then
  	    			If horsex(i)-mx>0 Then horseo1(i)=180 Else horseo1(i)=0
  	    		Else
  	    		   If horsey(i)-my>0 Then horseo1(i)=-90 Else horseo1(i)=90
  	    		EndIf
  	    	EndIf
  	    EndIf
  	  Else 
  	    If i<=6 Then 
  	    	dmx=(horsex(1)-horsex(i))*si1-(horsey(1)-horsey(i)-i*50)*co1
  	    Else 
  	    	If i<=12 Then 
  	    	   dmx=(horsex(7)-horsex(i))*si1-(horsey(7)-horsey(i)-(i-6)*50)*co1
  	    	Else
  	    		If i<=18 Then 
  	    	     dmx=(horsex(13)-horsex(i))*si1-(horsey(13)-horsey(i)-(i-12)*50)*co1
  	    		Else 
  	    		  If i<=24 Then 
  	    		  	 dmx=(horsex(19)-horsex(i))*si1-(horsey(19)-horsey(i)-(i-18)*150)*co1
  	    		  Else
  	    		  	 'If i<=30 Then 
  	    		  	 	dmx=(horsex(25)-horsex(i))*si1-(horsey(25)-horsey(i)-(i-24)*50)*co1
  	    		  	 'Else 
  	    		  	 '	dmx=(horsex(31)-horsex(i))*si1-(horsey(31)-horsey(i)-(i-30)*50)*co1
  	    		  	 'EndIf
  	    		  EndIf
  	    		EndIf 		
  	    	EndIf
  	    EndIf
  	    horseo1(i)-=Sgn2(dmx)*2*max(4.0,vhorse)
  	  EndIf 
     If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))<300 And horsez(i)>(waterz) Then
     	  horsesound=1
     EndIf
  EndIf
  setnodeposition(md2node,horsex(i),horsey(i),horsez(i))	
  setnoderotation(md2node,0,horseo2(i),horseo1(i))	
Next i
  If horsesound=1 And Rnd<0.1 Then soundhorse
  horsesound=0
  changehorse=0:i=1
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=2 To 6
     For j=1 To 1
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
  		  horsex(i)+=horsex(1)-horsex0
  		  horsey(i)+=horsey(1)-horsey0
    	Else
    	  Exit For 	
    	EndIf
     Next j
     horsez(i)=getterrainheight(horsex(i),horsey(i))
     setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    Next i
  EndIf
  changehorse=0:i=7
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=8 To 12
     For j=1 To 1	
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
   	   horsex(i)+=horsex(7)-horsex0
  		   horsey(i)+=horsey(7)-horsey0
    	Else
    		Exit For 
    	EndIf 
     Next j	
     horsez(i)=getterrainheight(horsex(i),horsey(i))
     setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    Next i
  EndIf
  changehorse=0:i=13
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=14 To 18
     For j=1 To 1
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
  		 horsex(i)+=horsex(13)-horsex0
  		 horsey(i)+=horsey(13)-horsey0
    	Else
    		Exit For
    	EndIf
     Next j	
     horsez(i)=getterrainheight(horsex(i),horsey(i))
     setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    Next i
  EndIf
  changehorse=0:i=19
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=20 To 24
     For j=1 To 1
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
  		 horsex(i)+=horsex(19)-horsex0
  		 horsey(i)+=horsey(19)-horsey0
    	Else
    		Exit For
    	EndIf
     Next j	
     horsez(i)=getterrainheight(horsex(i),horsey(i))
     setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    Next i
  EndIf
  changehorse=0:i=25
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=26 To 30'17
     For j=1 To 1
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
  		 horsex(i)+=horsex(25)-horsex0
  		 horsey(i)+=horsey(25)-horsey0
    	Else
    		Exit For
    	EndIf
     Next j	
     horsez(i)=getterrainheight(horsex(i),horsey(i))
     setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    Next i
  EndIf
  changehorse=0:i=31
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=32 To nhorse'17
     For j=1 To 1
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
  		 horsex(i)+=horsex(31)-horsex0
  		 horsey(i)+=horsey(31)-horsey0
    	Else
    		Exit For
    	EndIf
     Next j	
     horsez(i)=getterrainheight(horsex(i),horsey(i))
     setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    Next i
  EndIf
/'  changehorse=0:i=18
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=19 To 23 
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
  		 horsex(i)+=horsex(18)-horsex0
  		 horsey(i)+=horsey(18)-horsey0
       horsez(i)=getterrainheight(horsex(i),horsey(i))
       setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
  	   EndIf 
  	 Next
  EndIf
  changehorse=0:i=24
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=25 To 27
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
  		 horsex(i)+=horsex(24)-horsex0
  		 horsey(i)+=horsey(24)-horsey0
       horsez(i)=getterrainheight(horsex(i),horsey(i))
       setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
  	   EndIf 
  	 Next
  EndIf
  changehorse=0:i=28
  horsex0=horsex(i):horsey0=horsey(i) 
  While horsex(i)<mx-disthorse :horsex(i)+=disthorse*2:changehorse=1:Wend 
  While horsex(i)>mx+disthorse :horsex(i)-=disthorse*2:changehorse=1:Wend 	
  While horsey(i)<my-disthorse :horsey(i)+=disthorse*2:changehorse=1:Wend 
  While horsey(i)>my+disthorse :horsey(i)-=disthorse*2:changehorse=1:Wend 
  If changehorse=1 Then
    horsez(i)=getterrainheight(horsex(i),horsey(i))
    setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
    For i=29 To nhorse
    	If max(Abs(horsex(i)-mx),Abs(horsey(i)-my))>4000 Then 
  		 horsex(i)+=horsex(28)-horsex0
  		 horsey(i)+=horsey(28)-horsey0
       horsez(i)=getterrainheight(horsex(i),horsey(i))
       setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
  	   EndIf 
  	 Next
  EndIf '/
  Var nhorse2=nhorse
  If ndrawmd2<=nhorse0 Then nhorse2=nhorse0
  For i=1 To nhorse2
  	 If Abs(horsex(i)-mx-40*cos1)<40 Then
  	 	If Abs(horsey(i)-my-40*sin1)<40 Then
   	 If Abs(horsez(i)-mz)<100 And horsez(i)>(waterz) Then
     	   soundhorse
  	 		soundcrash
  	 		horsex(i)+=40*cos1
  	 		horsey(i)+=40*sin1
  	 		v=v-15
         horsez(i)=getterrainheight(horsex(i),horsey(i))
         setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))		
  	 	 EndIf 
  	 	EndIf
  	 EndIf
  Next
End Sub 
Sub testarbre
Dim As Integer i  	
Dim dx As Single
    If plane=1 And car=0 Then
    	 dx=18' Else dx=12
     If Abs(mx-mx0)>0.1 Or Abs(my-my0)>0.1 Then
      For i=1 To narbre2
  	     If Abs(arbrex(i)-mx)<dx Then
  	     	 If Abs(arbrey(i)-my)<dx Then
   	     	 If Abs(arbrez(i)-mz)<150 And arbrez(i)>waterz Then
               mx -= cos1 *(10)*kfps
               my -= sin1 *(10)*kfps
               If plane=1 Then testcrash
               Exit For
   	     	 EndIf 
  	     	 EndIf
  	     EndIf
      Next i
     EndIf 
    EndIf 
    For i=1 To narbre2
    		If Rnd<3/(1+fps) Then arbrerot(i)=arbrerot0(i)+Rnd
    Next
    For i=1 To nbuisson
    		If Rnd<3/(1+fps) Then buissonrot(i)=buissonrot0(i)+Rnd
    Next
End Sub 
Sub subleftmouse
Dim As Single x,y,ix,i
sublefthand()
x=guimousex:y=guimousey
If Sqr((x-radardx)*(x-radardx)+(y-radardy)*(y-radardy))<radarrx Then
	mx=distmax*(x-radardx)/radarrx
	my=distmax*(radardy-y)/radarrx
	mzsol0=getterrainheight(mx,my)+mzh
	mz=max(mz,mzsol0)
   If (plane=1 And car<=0 And prop>500) Or plane=2 Then
	  For ix=0 To 3000 Step 20
    	 mz=max(mz,getterrainheight(mx+ix*cos1,my+ix*sin1)+mzh+100)
	  Next
     o2=0:o3=0:v=max(v,vcruise)
   EndIf
   mz1=mz
   If plane=2 Then avionx=mx:aviony=my:avionz=mz
   If imap>=4 And myboat>0 Then
   	boatx(myboat)=mx+boatx(myboat)-mx0
   	boaty(myboat)=my+boaty(myboat)-my0
   	boatz(myboat)=getterrainheight(boatx(myboat),boaty(myboat)) 
   EndIf
   For i=4 To 6 'wingmen
     If max(Abs(airshipx(i)-mx0),Abs(airshipy(i)-my0))<30000 Then 
   	 airshipx(i)+=mx-mx0
   	 airshipy(i)+=my-my0
     EndIf 	
   Next
EndIf
If Abs(x-drawmapx)<50 And Abs(y-drawmapy)<50 And (imap>=4) _  
   And (planet=0 Or orbit=1) Then
 If testworld=1 Then  
    'Var mapautoix=535+worldx+(mx+dmx0)*aux*535
    'Var mapautoiy=(276+worldy)-(my+dmy0)*aux*276*2*scalex/scaley
    'Var x=max(-48.0,min(48.0,50*(mapautoix-535)/535))
    'Var y=max(-48.0,min(48.0,50*(-mapautoiy+276)/276))       
    worldx=535*(x-drawmapx)/50
    worldy=276*(y-drawmapy)/50
    myworldx=worldx
    myworldy=worldy
    dmx00=dmx0:dmy00=dmy0
    If dmx0<0 Then dmx0=100000 Else dmx0=-100000
    dmy0=0
    mx=0:my=0:xweb=0:yweb=0:xweb1=0:yweb1=0
 Else 
	mapx0=Int(x960*(x-drawmapx)/105)
	mapy0=Int(x960*(drawmapy-y)/105)*scaley/scalex
'If Abs(x-drawmapx)<100 And Abs(y-drawmapy)<100 Then
'	mapx0=Int(x960*(x-drawmapx)/200)
'	mapy0=Int(x960*(drawmapy-y)/200)
	dmx00=dmx0:dmy00=dmy0
	dmx0=scalex*(k8*512)*mapx0/1200'x960
	dmy0=scalex*(k8*512)*mapy0/1200'x960
 EndIf 
   initterrain3
   If plane=1 And car<=0 And prop>500 Then
	  For ix=0 To 3000 Step 20
    	 mz=max(mz,getterrainheight(mx+ix*cos1,my+ix*sin1)+mzh+100)
	  Next
     o2=0:o3=0:v=max(v,vcruise)
   EndIf
   mz1=mz
EndIf
guisetfocus("win.graph")
End Sub
Sub initterrain3
If tinittown=2 Then Sleep 4000
Dim As Single x,y
dim as integer i
   dmx0=0:dmy0=0'initterrain2
	mzsol0=getterrainheight(mx,my)+mzh
	mz=max(mz,mzsol0):mz1=mz
	stationvie=5000

If planet=0 Then 

   For i=1 To narbre2
         			arbrex(i)+=dmx0-dmx00:arbrey(i)+=dmy0-dmy00
            	  	arbrez(i)=getterrainheight(arbrex(i),arbrey(i))
            	  	setarbreh(i)
   Next
   For i=1 To nbuisson
         			buissonx(i)+=dmx0-dmx00:buissony(i)+=dmy0-dmy00
                  buissonz(i)=getterrainheight(buissonx(i),buissony(i))
   Next
   For i=1 To nhouse
         			housex(i)+=dmx0-dmx00:housey(i)+=dmy0-dmy00
         			housez(i)=getterrainheight(housex(i),housey(i))
   Next
   For i=1 To nhouse2
         			house2x(i)+=dmx0-dmx00:house2y(i)+=dmy0-dmy00
         			house2z(i)=getterrainheight(house2x(i),house2y(i))
   Next
   For i=1 To ndome
       domex(i)+=dmx0-dmx00:domey(i)+=dmy0-dmy00
       If dometype(i)=0 Then
     	  domez(i)=getterrainheight(domex(i),domey(i))
     	  If domez(i)>(waterz+0.01) Then domez(i)+=58.5 Else domez(i)=waterz-1
       Else
     	  domez(i)=getterrainheight(domex(i),domey(i))
     	  If domez(i)>(waterz+0.01) Then domez(i)+=68.5 Else domez(i)=waterz-1
       EndIf
   Next
   For i=1 To nhorse
         			horsex(i)+=dmx0-dmx00:horsey(i)+=dmy0-dmy00
         			horsez(i)=getterrainheight(horsex(i),horsey(i))
                  setnodeposition(md2_nodes(md2ihorse(i)),horsex(i),horsey(i),horsez(i))			
   Next
   For i=1 To ngrass
   	grassz(i)=waterz-1
   Next
   For i=1 To nboat2
     If i<>myboat Then 
       boatx(i)+=dmx0-dmx00
       boaty(i)+=dmy0-dmy00
     Else 
     	 boatx(i)=mx+boatx(i)-mx0
     	 boaty(i)=my+boaty(i)-my0
     EndIf 
     boatz(i)=getterrainheight(boatx(i),boaty(i))
   Next 
   For i=1 To ncloud
   	cloudx(i)+=mx-mx0
   	cloudy(i)+=my-my0
   	cloudz(i)=max(getterrainheight(cloudx(i),cloudy(i))+1000,cloudz(i))
   Next
   For i=1 To itown4
   	townhousex(i)+=dmx0-dmx00
   	townhousey(i)+=dmy0-dmy00
   	townhousez(i)=getterrainheight(townhousex(i),townhousey(i))
   Next
   testairportarbres()
   initterrainlines()

EndIf 'planet    

   For i=1 To nship
     If i<4 Or i>6 Or max(Abs(airshipx(i)-mx0),Abs(airshipy(i)-my0))>30000 Then 
     	 airshipx(i)+=dmx0-dmx00:airshipy(i)+=dmy0-dmy00
     Else 
   	 airshipx(i)+=mx-mx0
   	 airshipy(i)+=my-my0
     EndIf
   Next i
End Sub
Sub testjoystick
Dim As Integer i  	
    If GetJoystick(0,buttons,ax,ay,az,at)=0 Then
    	joystick=1
    Else 
      joystick=0
    	ax=-1000:ay=-1000:az=-1000:at=-1000
    	joy1dx=0:joy1dy=0:joy1dz=0:joy1dr=0
    	For i=1 To 16:b(i)=0:Next 
    EndIf    	
End Sub
Declare Sub subrightmouse()
Sub subjoystick 
Dim As Integer i  	
Dim As Single vv=7
Dim As Integer order0
If mz>(waterz0+80000) And planet=1 Then tstation=max2(tstation,1)
If topview>=1 And plane=0 Then vv=100
'If joystick=1 Then 
    If GetJoystick(0,buttons,ax,ay,az,at,,,hatx,haty)=0 Then
    	joystick=1
    	bb=buttons:For i=1 To 16:b(i)=0:Next 
    	b(b2(1))=bb And 1:b(b2(2))=bb And 2:b(b2(3))=bb And 4:b(b2(4))=bb And 8
    	b(b2(5))=bb And 16:b(b2(6))=bb And 32:b(b2(7))=bb And 64:b(b2(8))=bb And 128
    	b(b2(9))=bb And 256:b(b2(10))=bb And 512:b(b2(11))=bb And 1024:b(b2(12))=bb And 2048
      If ax>-100 Then joy1dx=(-ax)*32767 Else joy1dx=0
      If ay>-100 Then joy1dy=(ay)*32767 Else joy1dy=0
      If az>-100 Then joy1dz=(-az)*32767 Else joy1dz=0
      If at>-100 Then joy1dr=(-at)*32767 Else joy1dr=0    
    Else
    	joystick=0
    	ax=-1000:ay=-1000:az=-1000:at=-1000:hatx=-1000:haty=-1000
    	joy1dx=0:joy1dy=0:joy1dz=0:joy1dr=0
    	For i=1 To 16:b(i)=0:Next 
    EndIf
'EndIf 
If plane=0 Then 
   If joystick=1 Then 
    If abs(joy1dx)<4000 then joy1dx=0:ax=-1000
    If abs(joy1dy)<4000 then joy1dy=0:ay=-1000
    If abs(joy1dz)<4000 Then joy1dz=0:az=-1000
    If abs(joy1dr)<4000 Then joy1dr=0:at=-1000
    If ay>-100 Then 
    	If ay>0 Then ay=ay*0.5
      mx -= cos1*10*kfps*ay  
      my -= sin1*10*kfps*ay
    EndIf
    If at>-100 Then
      mx += sin1*3*kfps*at
      my -= cos1*3*kfps*at	
    EndIf
    If ax>-100 Then o1-=ax*4*kfps
    If az>-100 Then o2+=az*4*kfps
    if b(3)<>0 then keytir
    If b(7)<>0 Then keytir
   EndIf  
    
    If thelene Then vv=4.5
    If guitestkey(vk_numpad1) Then rot-=3*kfps
    If guitestkey(vk_numpad3) Then rot+=3*kfps
    If guitestkey(vk_numpad8) Or((guitestkey(vk_b)Or guitestkey(vk_prior)) And plane=0)Then o2=min(89.0,o2+3*kfps)
    If guitestkey(vk_numpad2) Or((guitestkey(vk_n)Or guitestkey(vk_next)) And plane=0)Then o2=max(-89.0,o2-3*kfps)
    If guitestkey(vk_numpad5) Or b(10) Then o2=0
    If guitestkey(vk_left) Or guitestkey(vk_numpad1) Then o1+=3*kfps
    If guitestkey(vk_right) Or guitestkey(vk_numpad3) Then o1-=3*kfps
    If guitestkey(vk_up) Then mx+=vv*cos1*kfps:my+=vv*sin1*kfps
    If guitestkey(vk_down) Then mx-=0.5*vv*cos1*kfps:my-=0.5*vv*sin1*kfps
    If guitestkey(vk_SPACE) And mapdisplay<>0 Then
    	 	mapdisplay=0:o2=0:mz=mzsol0:Sleep 300:guiscan
    EndIf
    'If guitestkey(vk_v)<>0 Then
	 '   If ikey0(vk_v)=0 Then
	 '	    ikey0(vk_v)=1:viseur=(viseur+1)Mod 3
	 '   EndIf
    'Else
    '  ikey0(vk_v)=0
    'EndIf
    If guitestkey(vk_f)<>0 Then
	    If ikey0(vk_f)=0 Then
		    ikey0(vk_f)=1:subfoot()
	    EndIf
    Else
      ikey0(vk_f)=0
    EndIf
    mzh=25
  	 If guitestkey(vk_shift) Then
  	 	if guitestkey(vk_m)=0 And guitestkey(vk_r)=0 And guitestkey(vk_t)=0 Then
    		trun=(trun+1)Mod 2
    		subrightmouse()
    		Sleep 300
    	EndIf 	
  	 EndIf
    If trun=1 Then
      	If tfoothorse=0 Then
      		mx+=vv*0.2*cos1*kfps:my+=vv*0.2*sin1*kfps
      	Else 
      		mx+=vv*0.35*cos1*kfps:my+=vv*0.35*sin1*kfps
      	EndIf
      	mzh=25+(0.9-Abs(Cos(Timer*3.2)))
      	If mzh<25.15 And tfoothorse=0 Then
      		If mz<waterz+25.1 Then
      			If Timer>tsoundfoot+0.67 Then
      				If ntownnear<2 Then soundwaterwave()	
      				soundfoot()
      			EndIf
      		Else
      			soundfoot()
      		EndIf
      	EndIf
    EndIf
    If guitestkey(vk_r)<>0 Then
    	Sleep 200
	   If guitestkey(vk_control)=0 And guitestkey(vk_shift)=0 Then
	   	timesoundarcade0=0
	   	soundvoyage(11)
	   ElseIf guitestkey(vk_shift) Then
	   	subsoundarcade()
	   EndIf
    EndIf

    mz=getterrainheight(mx,my)+mzh
    mz1=max(mz1,mz)
    v=0

Else
    If guitestkey(vk_g)<>0 Then subfoot2():Sleep 300
	 If mapdisplay>=5 Then
	 	If guitestkey(vk_up) Then my0+=100*kfps
	 	If guitestkey(vk_down) Then my0-=100*kfps
	 	If guitestkey(vk_left) Then mx0-=100*kfps
	 	If guitestkey(vk_right) Then mx0+=100*kfps
	 EndIf
	 keyplane 
	 'testtirs
    If mapdisplay=0 and tinittown0=0 Then movecar
    setspeed
	 If Abs(tlayer0)>0.6 Or mytestbridge=1 Then
	 	if plane=0 Or car>0 Then o3=0
	 EndIf
    If plane>0 Then setvol Else stopvol()
    dirv=(mx-mx0)*cos1+(my-my0)*sin1
    If guitestkey(vk_r)<>0 Then
    	Sleep 200
	   If (piste=2 Or tstation=2 Or trepair=1) And Abs(v)<0.1 And boatwar(myboat)=0 Then
	   	myTTSspeak("repair and refuel?",1)
	   	confirm("repair and refuel ?","repair",resp)
	   	If resp="yes" Then vie=vie0:carb=carb0:myTTsspeak("ok",1)
	   	Sleep 200
	   ElseIf guitestkey(vk_control)=0 And guitestkey(vk_shift)=0 Then
	   	timesoundarcade0=0
	   	soundvoyage(11)
	   ElseIf guitestkey(vk_shift) Then
	   	subsoundarcade()
	   EndIf
    'ElseIf plane>0 Then 
    '	If guitestkey(vk_shift) Then brakes()  
    '	If guitestkey(vk_control) Then brakes()  
    EndIf
    If plane>0 And car>0 Then 
     If guitestkey(vk_1)Or(guitestkey(vk_space)And guitestkey(vk_left))Or guitestkey(vk_q)Or guitestkey(vk_a) Then
     	  soundclick():avgo1=o1+90:tclignotant=Timer:Sleep 200
     EndIf
     If guitestkey(vk_2)Or(guitestkey(vk_space)And guitestkey(vk_right))Or guitestkey(vk_d) Then
     	  soundclick():avgo1=o1-90:tclignotant=Timer:tsoundclick=Timer:Sleep 200
     EndIf
     If time2<tclignotant+3.4 Then
    	 If time2<tclignotant+0.1 Then timeautopilot=time2
    	 If avgo1>o1 Then keyLeft() Else keyRight()
    	 If time2>tsoundclick+0.9 Then tsoundclick=time2:soundclick()  
    	 'o1+=Sgn(avgo1-o1)*kfps*0.8
     EndIf 
    ElseIf plane>0 And volant=2 Then
    	If guitestkey(vk_q)Or guitestkey(vk_a) Then cocko1=min(60.0,cocko1+kfps)
    	If guitestkey(vk_e)Or guitestkey(vk_d) Then
    		cocko1=max(-60.0,cocko1-kfps)
    	   If guitestkey(vk_q)Or guitestkey(vk_a) Then cocko1=0
    	EndIf
    	If guitestkey(vk_s)Then cocko2=max(-50.0,cocko2-kfps)
    	If guitestkey(vk_z)Or guitestkey(vk_w) Then
    		cocko2=min(20.0,cocko2+kfps)
    	   If guitestkey(vk_s)Then cocko2=0   		
    	EndIf
    	If guitestkey(vk_control) Or guitestkey(vk_shift) Then cocko1=0:cocko2=0
    EndIf
    /'If (plane=1 And car<=0) Or plane=2  Then
      order0=order:order=0	
      If hatx=+1 Or guitestkey(vk_1)<>0 Then order=1:torder=time2+999999  
      If haty=-1 Or guitestkey(vk_2)<>0 Then order=2:torder=time2+999999  
      If haty=+1 Or guitestkey(vk_3)<>0 Then order=3:torder=time2+999999  
      If hatx=-1 Or guitestkey(vk_4)<>0 Then order=4:torder=time2+15
      If order<>0 Then
      	If order=1 Then soundorder1
      	If order=2 Then soundorder2
      	If order=3 Then soundorder3
      	If order=4 Then soundorder4
      	Sleep 200
      Else
      	order=order0
      EndIf 
    EndIf  '/
EndIf
If planet=0 Then 
  'testpiste
  'If piste=1 Then mzsol0=max(mzsol0,pistez)':mz1=max(mz1,mz)
EndIf
If planet=1 Then mz11=-999999
testmz
End Sub 
Sub testo123
    While o1>180:o1-=360:Wend
    While o1<-180:o1+=360:Wend
    While o2>180:o2-=360:Wend
    While o2<-180:o2+=360:Wend
    While o3>180:o3-=360:Wend
    While o3<-180:o3+=360:Wend
    If plane=0 Then  
      If o2<-89 Then o2=-89
      If o2>89 Then o2=89    
    Else
      'If o2>90 then o2=180-o2:o1=180+o1:o3=180+o3
      'If o2<-90 Then o2=-180-o2:o1=180+o1:o3=180+o3
      If o2>87 then o2=174-o2:o1=180+o1:o3=180+o3
      If o2<-87 Then o2=-174-o2:o1=180+o1:o3=180+o3
    EndIf
    If Abs(o2)>=50 And Abs(o2)<=86.01 And plane>0 Then
       o1=diro1(dmx,dmy)
       o2=diro1(Sqr(dmx*dmx+dmy*dmy),dmz)
       Var aux=1.0/max(0.5,Sqr(dmx*dmx+dmy*dmy+dmz*dmz))
       dmx*=aux:dmy*=aux:dmz*=aux  	
         	cos1=Cos(o1*degtorad):sin1=Sin(o1*degtorad)
         	cos2=Cos(o2*degtorad):sin2=Sin(o2*degtorad)
         	cos3=Cos(o3*degtorad):sin3=Sin(o3*degtorad)
    Else    
         	cos1=Cos(o1*degtorad):sin1=Sin(o1*degtorad)
         	cos2=Cos(o2*degtorad):sin2=Sin(o2*degtorad)
         	cos3=Cos(o3*degtorad):sin3=Sin(o3*degtorad)
            dmx=cos1*cos2:dmy=sin1*cos2:dmz=sin2
    EndIf
    'rotaviontir(0,1,0)
    avx3=avx
    avy3=cos3
    avz3=-sin3
    avx2=-avz3*sin2
    avy2=avy3
    avz2=avz3*cos2 
    avx1=avx2*cos1-avy2*sin1
    avy1=avx2*sin1+avy2*cos1
    avz1=avz2
    queuex=avx1:queuey=avy1:queuez=avz1   
    'rotaviontir(0,0,1)
    avx3=avx
    avy3=sin3
    avz3=cos3
    avx2=-avz3*sin2
    avy2=avy3
    avz2=avz3*cos2 
    avx1=avx2*cos1-avy2*sin1
    avy1=avx2*sin1+avy2*cos1
    avz1=avz2
    pitchx=avx1:pitchy=avy1:pitchz=avz1
End Sub
Sub save(ByVal fic As String)
Dim As Integer i,File
file=freefile
Open fic For Output As #file
Print #file,mx
Print #file,my
Print #file,mz
Print #file,o1
Print #file,o2
Print #file,o3
Print #file,dmx0
Print #file,dmy0
Print #file,imap
Print #file,icar
Print #file,avionx
Print #file,aviony
Print #file,avionz
Print #file,aviono1
Print #file,aviono2
Print #file,aviono3
Print #file,avionz900
Print #file,volume
Print #file,v
For i=1 To nhorse
	Print #file,horsex(i)
	Print #file,horsey(i)
	Print #file,horsez(i)
	Print #file,horseo1(i)
	Print #file,horseo2(i)
Next
Print #file,"finlist"
For i=1 To nboat
	Print #file,boatx(i)
	Print #file,boaty(i)
	Print #file,boatz(i)
	Print #file,boato1(i)
	Print #file,boato2(i)
	Print #file,boato3(i)
	Print #file,vboat(i)
Next
Print #file,"finlist"
Print #file,myboat
Print #file,windo1
For i=1 To nship
	Print #file,airshipx(i)
	Print #file,airshipy(i)
	Print #file,airshipz(i)
	Print #file,airshipo1(i)
	Print #file,airshipo2(i)
	Print #file,airshipo3(i)
Next i
Print #file,"finlist"
Print #file,order
If planet=1 And orbit=0 Then initspace=1 Else initspace=0
Print #file,initspace
initspace=0
Print #file,smx0
Print #file,smy0
Print #file,addonname
Print #file,kscalex00
Print #file,myworldx
Print #file,myworldy
Print #file,icombomap
Print #file,tlayer
Close #file
End Sub
Dim Shared As Single mzinit
Sub load(ByVal fic As String)
Dim As Integer File,icar0,imap0,ihorse,iboat,iship,i
Dim As Single kscalex0,dmx0000,dmy0000,mx0000,my0000,mz0000
Dim As String ficin
icar0=icar:imap0=imap
kscalex0=kscalex00

If FileExists(fic) Then 

file=freefile
Open fic For input As #file
mx=0:my=0:mz=0
If Not Eof(file) Then Line Input #file,ficin:mx=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:my=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:mz=Val(ficin)
o1=0:o2=0:o3=0
If Not Eof(file) Then Line Input #file,ficin:o1=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:o2=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:o3=Val(ficin)
dmx0=0:dmy0=0
If Not Eof(file) Then Line Input #file,ficin:dmx0=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:dmy0=Val(ficin)
imap=1
If Not Eof(file) Then Line Input #file,ficin:imap=Val(ficin)
icar=1
If Not Eof(file) Then Line Input #file,ficin:icar=Val(ficin)
avionx=0:aviony=0:avionz=0
If Not Eof(file) Then Line Input #file,ficin:avionx=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:aviony=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:avionz=Val(ficin)
aviono1=0:aviono2=0:aviono3=0:setavion=1
If Not Eof(file) Then Line Input #file,ficin:aviono1=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:aviono2=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:aviono3=Val(ficin)
avionz900=1000
If Not Eof(file) Then Line Input #file,ficin:avionz900=Val(ficin)
volume=1000
If Not Eof(file) Then Line Input #file,ficin:volume=Val(ficin)
v=0
If Not Eof(file) Then Line Input #file,ficin:v=Val(ficin)
ihorse=0
While Not Eof(file) And ficin<>"finlist"
  ihorse=min2(nhorse,ihorse+1)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then horsex(ihorse)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then horsey(ihorse)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then horsez(ihorse)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then horseo1(ihorse)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then horseo2(ihorse)=Val(ficin)
  setnodeposition(md2_nodes(md2ihorse(ihorse)),horsex(ihorse),horsey(ihorse),horsez(ihorse))
  setnoderotation(md2_nodes(md2ihorse(ihorse)),0,horseo2(ihorse),horseo1(ihorse))	
Wend
ficin=""
iboat=0
While Not Eof(file) And ficin<>"finlist"
  iboat=min2(nboat,iboat+1)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then boatx(iboat)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then boaty(iboat)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then boatz(iboat)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then boato1(iboat)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then boato2(iboat)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then boato3(iboat)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then vboat(iboat)=Val(ficin)
Wend
ficin=""
myboat=0
If Not Eof(file) Then Line Input #file,ficin:myboat=Val(ficin)
windo1=Rnd*360
If Not Eof(file) Then Line Input #file,ficin:windo1=Val(ficin)
iship=0
For i=1 To nship
	'airshipx(i)=i*4500:airshipy(i)=i*4000:airshipz(i)=1500.0
	setairship(i)=1 
Next
While Not Eof(file) And ficin<>"finlist"
  iship=min2(nship,iship+1)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipx(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipy(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipz(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipo1(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipo2(iship)=Val(ficin)
  If Not Eof(file) And ficin<>"finlist" Then Line Input #file,ficin
  If ficin<>"finlist" Then airshipo3(iship)=Val(ficin)
Wend
ficin=""
order=1
If Not Eof(file) Then Line Input #file,ficin:order=Val(ficin)
initspace=0
If Not Eof(file) Then Line Input #file,ficin:initspace=Val(ficin)
smx0=0:smy0=0
If Not Eof(file) Then Line Input #file,ficin:smx0=Val(ficin)
If Not Eof(file) Then Line Input #file,ficin:smy0=Val(ficin)
addonname=""
If Not Eof(file) Then Line Input #file,ficin:addonname=Trim(ficin)
kscalex00=100
If Not Eof(file) Then Line Input #file,ficin:kscalex00=Val(ficin)
myworldx=0
If Not Eof(file) Then Line Input #file,ficin:myworldx=Val(ficin)
myworldy=-145
If Not Eof(file) Then Line Input #file,ficin:myworldy=Val(ficin)
icombomap=1
If Not Eof(file) Then Line Input #file,ficin:icombomap=Val(ficin)
tlayer=0
If Not Eof(file) Then Line Input #file,ficin:tlayer=Val(ficin)
Close #file

tinitloadmx=0
loadmx=mx:loadmy=my:loadmz=mz
mzinit=mz

If addonname<>"" Then
	For i=1 To 100
		If LCase(addonname)=LCase(Trim(addon(i))) Then
			imap=i
			Exit For 
		EndIf
	Next
EndIf

kscalex=kscalex00*Sqr(1200/x960)
scalex=500*kscalex/100
If planet=0 Then scaley=scalex Else scaley=(scalex*1.5)'2
mx0=mx:my0=my:mz0=mz
dmx00=dmx0:dmy00=dmy0
mz1=mz:mz11=mz
mzsol0=getterrainheight(mx,my)+mzh
cos1=Cos(o1*degtorad):sin1=Sin(o1*degtorad)
cos2=Cos(o2*degtorad):sin2=Sin(o2*degtorad)
cos3=Cos(o3*degtorad):sin3=Sin(o3*degtorad)
dmx=cos1*cos2:dmy=sin1*cos2:dmz=sin2

If imap<>imap0 Or Abs(kscalex00-kscalex0)>0.001 Then
  'selectcomboindex("win.map",imap-4)
  dmx0000=dmx0:dmy0000=dmy0
  mx0000=mx:my0000=my:mz0000=mz
  initterrain:orbit=1 
  dmx0=dmx0000:dmy0=dmy0000
  dmx00=dmx0:dmy00=dmy0
  mx=mx0000:my=my0000:mz=mz0000
  If planet=0 Then initterrain3
  quit=1:restart=2
Else 
  If imap>=4 And initspace=0 Then
  	  initterrain3:orbit=1	
  EndIf
  stationvie=5000
EndIf
If icar<>icar0 Then 
  icar=icar0 
  selectcomboindex("win.combo1",icar)
  subcombo1
EndIf

selectcomboindex("win.map",icombomap) 

EndIf 
End Sub
Sub subsave
Dim As String fic,dir0
Dim As Integer ret
tquitweb=1
If waitbusy()=0 Then tquitweb=0:Exit Sub
tquitweb=0
tloadwebtext2=2  
dir0=CurDir  
ChDir(ExePath+"\save\")  
fic=filedialog("save","*.save")
fic=Trim(fic)
ChDir(dir0)
If InStr(fic,".")=0 And fic<>"" Then fic=fic+".save"
If Right(fic,5)=".save" Then
	If LCase(Right(fic,9))="map4.save" Then
		guinotice "name reserved map4.save , try another !"
	Else
	 guiconfirm("save in "+fic+" ?","confirm",resp)
	 If resp="yes" Then
		save(fic)
		Var fic0=Left(fic,Len(fic)-5)+".townxy3"
		savetownxy3(fic0)
	 EndIf 
	EndIf
ElseIf fic<>"" Then 
	guinotice "bad name "+fic
EndIf
tloadwebtext2=0
ret=ChDir(dir0)
End Sub
Sub subload
Dim As String fic,dir0
Dim As Integer ret 
tquitweb=1
If waitbusy()=0 Then tquitweb=0:Exit Sub
tquitweb=0
tloadwebtext2=2  
dir0=CurDir
ChDir(ExePath+"\save\")  
fic=filedialog("load","*.save")
fic=Trim(fic)
ret=ChDir(dir0)
ficload=""
If Right(fic,5)=".save" Then
	Var fic0=Left(fic,Len(fic)-5)+".townxy3"
	If FileExists(fic) Then
	 if FileExists(fic0) Then
		load(fic)
		itownp=0
      resetaeroway()
      resetmxweb()
      resettownwaynode()
      resetfuel()
		loadtownxy3(fic0)
		copytown00()
		reverselocation=""
		If car>0 Then volume=1500
		ficload=fic0
	 Else
	 	guinotice fic0+" not found !"
	 EndIf
	Else
		guinotice fic+" not found !"
	EndIf
EndIf
ret=ChDir(dir0)
tloadwebtext2=0
Sleep 300
End Sub
Declare Sub addtownxy3(fic0 As String="")
Sub subadd
Dim As String fic,dir0
Dim As Integer ret 
tquitweb=1
If waitbusy()=0 Then tquitweb=0:Exit Sub
tquitweb=0
tloadwebtext2=2  
dir0=CurDir
ChDir(ExePath+"\save\")  
fic=filedialog("load","*.save")
fic=Trim(fic)
ret=ChDir(dir0)
If Right(fic,5)=".save" Then
	Var fic0=Left(fic,Len(fic)-5)+".townxy3"
	If FileExists(fic) Then
	 if FileExists(fic0) Then
		'load(fic)
		'itownp=0
      'resetaeroway()
      'resetmxweb()
      'resettownwaynode()
      'resetfuel()
      guiconfirm("add "+fic+" ?","confirm",resp)
      If resp="yes" Then
      	addtownxy3(fic0)
      EndIf
	 Else
	 	guinotice fic0+" not found !"
	 EndIf
	Else
		guinotice fic+" not found !"
	EndIf
EndIf
ret=ChDir(dir0)
tloadwebtext2=0
Sleep 300
End Sub
Declare Sub loadopentown()
Declare Sub loadopentown2()
Declare Sub loadopentown3(tgetway As Integer=0)
Dim Shared As Single kdxweb=0.3
dim shared as integer tmassload=0
Sub submassdownload()
Dim As Integer i,j,k 
If waitbusy()=0 Then Exit Sub
If tloadwebtext2<>0 Then guinotice "i'am busy,try later":Exit Sub 
confirm("force download osm data here ? .","confirm",resp)
If resp<>"yes" Then Exit Sub
Var lattown0=lattown,lngtown0=lngtown,kdxweb0=kdxweb
Var lat0=lat,lng0=lng,latmx=lat,lngmx=lng
mxytolatlng(mx+700*cos1,my+700*sin1)
latmx=lat:lngmx=lng
lat=lat0:lng=lng0
kdxweb=0.4
Var dx=2*kdxweb*1.3*360/40000',klon=1.4'range 1.4*1.3km
Var di=0
Var tescape=0
tmassload=1
glpushmatrix
For i=-di To di
 For j=-di To di
 	guiscan
	Sleep 2000
 	If guitestkey(vk_escape) Or quit=1 Then
      glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT  Or GL_STENCIL_BUFFER_BIT)
 		guirefreshopenGL()
 		Sleep 1000
 		tescape=1:Exit For,For
 	EndIf
	display()
	gldrawtext("downloading ("+Str(di)+").."+Str(i)+"/"+Str(j),xmax*0.4,ymax*0.49,2)
	guirefreshopenGL()
   'glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT  Or GL_STENCIL_BUFFER_BIT)
	'gldrawtext("downloading ("+Str(di)+"/"+Str(di)+").."+Str(i)+"/"+Str(j),xmax*0.4,ymax*0.49,2)
	'guirefreshopenGL()
	lngtown=lngmx+i*dx*klon
	lattown=latmx+j*dx
	dtweb=15
	kdxweb=0.4

	loadopentown()
	Var icurl1=icurl
	guirefreshopenGL()
	gldrawtext("1 "+Str(icurl1),xmax*0.5,ymax*0.60,2)
	guirefreshopenGL()
	Sleep 500

	loadopentown2()
	Var icurl2=icurl
	guirefreshopenGL()
	gldrawtext("2 "+Str(icurl2),xmax*0.5,ymax*0.65,2)
	guirefreshopenGL()
	Sleep 500

	loadopentown3(2)
	Var icurl3=icurl
	guirefreshopenGL()
	gldrawtext("3 "+Str(icurl3),xmax*0.5,ymax*0.70,2)
	guirefreshopenGL()
	Sleep 500
	
	'loadopentown2()
	'Var icurl4=icurl
	'guirefreshopenGL()
	'gldrawtext("4 "+Str(icurl4),xmax*0.5,ymax*0.75,2)
	'guirefreshopenGL()
	'Sleep 500 '/
	'loadopentown3()
 	If tquitweb=1 Or quit=1 Then
 		Sleep 1000
 		guinotice "error ! "+Str(i)+"/"+Str(j)
 		Sleep 1000
 		tescape=1:Exit For,For
 	EndIf
 	freelockterrain()
 	freelockterrain22()
 	freelockterrainbmp()
 	freelocktown(0)
 Next j	
Next i
glpopmatrix
tmassload=0
Sleep 1000
guiscan
If tescape=1 Then guinotice "ok"
tloadwebtext2=0:tinittown=0
lattown=lattown0:lngtown=lngtown0:kdxweb=kdxweb0
guisetfocus("win.graph")
End Sub
Sub substart
Dim As Integer i  	
	resp=Str(startoption)
	msg="start option : enter a number (0=reset  1=continue)  last="+resp
	prompt(msg,resp)
	i=Val(resp)
	i=max2(0,min2(1,i))
	If i<>startoption Then
		startoption=i
	EndIf
End Sub
Sub subwar
Dim As Integer i  	
If war=0 Then 
	confirmspeak("declare war ?","war",resp)
	If resp="yes" Then
		war=1
		For i=7 To nship
			airshipwar(i)=30000
		Next
	EndIf
Else 
	confirmspeak("stop war ?","war",resp)
	If resp="yes" Then
		war=0
		For i=1 To nship
			airshipwar(i)=0
		Next
		For i=1 To nboat
			boatwar(i)=0
		Next
	EndIf
EndIf
End Sub
Function waitbusy() As Integer
	   tquitweb=1
      If tquitweb=1 Or quit=1 Then
      	If tinittown=22 Or tinittown=23 Then
   	   	tinittown=0
      	EndIf
      EndIf
		Var i=0
		For i=1 To 30
			tquitweb=1:tinittown=99
			If tloadwebtext2=0 And tinittown=99 And httpon<>1 Then Exit For
			If tloadwebtext2=2 And tinittown=99 And httpon<>1 Then Exit For
			Sleep 500
		Next
		If httpon=1 Then'(tloadwebtext2<>0 And tloadwebtext2<>2) Or tinittown<>0 Or httpon=1 Then
			guinotice("i am busy, try later "+Str(tloadwebtext2)+"/"+Str(tinittown)+"/"+Str(httpon))
		   tquitweb=0:tinittown=0:tloadwebtext2=0
			Return 0 
		EndIf
		tquitweb=0:tinittown=0:tloadwebtext2=0
	   Return 1
End Function
Dim Shared As Integer tinternet=3
Sub subinternet
Dim As Integer i	
	resp=Str(tinternet)
	msg="internet : enter a number (0 .. 3) last="+Str(tinternet)
	msg+=Chr(10)+"0=off  1=terrain  2=terrain+openstreetmap  3=2+srtm"
	prompt(msg,resp)
	i=Val(resp)
	i=max2(0,min2(3,i))
	If i<>tinternet Then
		tinternet=i
	EndIf
End Sub
Sub subgoogle
	If tgoogle=2 Then
		confirm("disable google maps webtext ?","confirm",resp)
		If resp="yes" Then googleerror=1:tgoogle=0:testweb=1
	ElseIf tgoogle=0 Then 
		confirm("enable google maps webtext (basic) ?","confirm",resp)
		If resp="yes" Then tgoogle=1:testweb=1
	Else
		confirm("enable google maps webtext (full)?","confirm",resp)
		If resp="yes" Then tgoogle=2:testweb=1
	EndIf
End Sub
Sub subbing
	If tbing=1 Then
		confirm("use Google imagery instead of bing ?","confirm",resp)
		If resp="yes" Then tbing=0:testweb=1
	Else 
		confirm("use Bing imagery instead of google ?","confirm",resp)
		If resp="yes" Then tbing=1:testweb=1
	EndIf
	If tbing=1 Then
	 	  printgui("win.bing","bing    ")
	Else
	     printgui("win.bing","google  ")
	EndIf
End Sub 	
Sub subopentown
topentown=1
notice "openstreetmap web buildings is on !"
Exit Sub 
If topentown=0 Then
	confirmspeak("set openstreetmap Web buildings on ?","opentown",resp)
	If resp="yes" Then
		topentown=1
		Var i=0
		For i=1 To 30
			If tloadwebtext2=0 And tinittown=0 Then Exit For
			Sleep 500
		Next
		If tloadwebtext2<>0 Or tinittown<>0 Then
			guinotice("i am busy, try later")
			Exit Sub 
		EndIf
		tloadwebtext2=2:tinittown=1:inittown():tinittown=0:tloadwebtext2=0
	EndIf
Else	
	confirmspeak("set openstreetmap Web buildings off ?","opentown",resp)
	If resp="yes" Then
		topentown=0
		Var i=0
		For i=1 To 30
			If tloadwebtext2=0 And tinittown=0 Then Exit For
			Sleep 500
		Next
		If tloadwebtext2<>0 Or tinittown<>0 Then
			guinotice("i am busy, try later")
			Exit Sub 
		EndIf
		tloadwebtext2=2:tinittown=1:inittown():tinittown=0:tloadwebtext2=0
	EndIf
EndIf
End Sub
If FileExists(ExePath+"/woman/girl2.jpg") Then auxtest=0.0012
Dim Shared As Integer thelp
Sub subhelp
If thelp=1 Then Exit Sub	
thelp=1
If auxtest>0.01 Then
	'auxtest0=auxtest
	auxtest=0.005
   If FileExists(ExePath+"/woman/girl2.jpg") Then auxtest=0.007
ElseIf FileExists(ExePath+"/woman/girl2.jpg") Then 
	auxtest=auxtest0
	'auxtest0=0
EndIf
Dim As String msg,resp,cr=Chr(13)+Chr(10)
msg="F1 => help   /  escape => quit"+cr
msg+="F9 => window/fullscreen / P => pause/autopilot(car)"+cr
msg+="F3 => change time of day  / F4 => change stars"+cr
msg+="J,K  => prev/next wheel/cockpit (show/hide)"+cr
msg+="T  => tourelle view (on/off) /  F => foot/car/plane"+cr
msg+="pageup ,num+, N => accelere / lookup"+cr
msg+="pagedown ,num-, B => decelere  / lookdown"+cr
msg+="L  => compas2     C => compas    G => change car/plane"+cr
msg+="space => shoot / carhorn    control => brakes"+cr
msg+="R  => repair,radio  / shift+,M  => google map,zoom map"+cr
'msg+="1,2,3,4 => give wingmen orders /  W  => declare war"+cr
msg+="ctrl+T => number of trees   /   shift+T => set retro view"+cr
msg+="ctrl+D => distmax  /  shift,ctrl,mousewheel => gaz (hand mode)"+cr
msg+="ctrl+N => number of cars/planes"+cr
msg+="ctrl+F => max/min fps"+cr
msg+="ctrl+I => internet on/off"+cr
msg+="ctrl+C => number of clouds"+cr
'msg+="ctrl+W => water wave height"+cr
msg+="ctrl+B => number of rocs   /  shift+B => Bing/Google imagery"+cr
msg+="ctrl+M => download osm here  /  scalez : see combo z1..z20"+cr
'msg+="ctrl+X => map scalex    /  scalez : see combo z1..z20"+cr
'msg+="1,5,num7 / 2,6,num9  => turn boat left / right"+cr
msg+="ctrl+R => reset   /  shift+R => arcade sound (on/off)"+cr'    /   ctrl+A  => draw/hide seashore"+cr 
msg+="ctrl+O => start option (reset/continue)"+cr
'msg+="ctrl+L => select level (easy,normal,hard)"+cr
msg+="ctrl+G => fly to geocoding (world mode)"+cr
msg+="shift+G => google maps webtext (enable/basic/disable)"+cr
'msg+="ctrl+I => internet openstreetmap buildings"+cr
msg+="ctrl+S => shadow (on/off)"+cr'smooth terrain"+cr
msg+="shift+T => retroviseur "+cr
msg+="shift+O => change server"+cr
msg+="ctrl+shift => walk (foot mode)  /   H => horse"+cr
msg+="key 9 => heightmap / Q,D 1,2 or space arrow => turn left/right"+cr
msg+="joystick and gamepad supported" 
confirm(msg,"help",resp)
timehelp=Timer
thelp=0 
End Sub
Sub drawhelp
Dim As integer i=ymax-99-180
i+=20:gldrawtext("F foot/car/fly",15,i,1.2)	
i+=20:gldrawtext("G change engine",15,i,1.2)	
i+=20:gldrawtext("K change cockpit",15,i,1.2)	
i+=20:gldrawtext("T tourelle",15,i,1.2)	
i+=20:gldrawtext("M map",15,i,1.2)	
i+=20:gldrawtext("R radio",15,i,1.2)	
i+=20:gldrawtext("P autopilot",15,i,1.2)	
i+=20:gldrawtext("B,N motor",15,i,1.2)	
i+=20:gldrawtext("Shift,Ctrl brakes",15,i,1.2)	
End Sub
Sub subtypeautopilot
	typeautopilot=(typeautopilot+1)Mod 2
	If typeautopilot=0 Then 
		If tautopilot>0 Then
			printgui("win.typeauto","auto0")
		Else		
		   printgui("win.typeauto","turn0")
		EndIf    
	Else
		If tautopilot>0 Then
			printgui("win.typeauto","auto1")
		Else		
		   printgui("win.typeauto","turn1")
		EndIf    
	EndIf
	soundclick()
	Sleep 100
	guisetfocus("win.graph")
End Sub
Sub subautopilot
	stopsoundavion
	Var typeauto0=typeautopilot0
	Var typeauto=typeautopilot
	If tautopilot=0 Then
		confirm("set autopilot on ?","autopilot",resp)
		If resp="yes" Then
			tautopilot=1
			mx0=mx:my0=my:mz0=mz
			nncarx(0)=mx:nncary(0)=my:nncarz(0)=mz
			ncarx(0)=mx:ncary(0)=my:ncarz(0)=mz
			avgo1=o1
			typeautopilot=typeautopilot0
			typeautopilot0=typeauto
		EndIf
	Else
		confirm("set autopilot off ?","autopilot",resp)
		If resp="yes" Then
			tautopilot=0
			typeautopilot=typeautopilot0
			typeautopilot0=typeauto
		EndIf
	EndIf
	soundavion
	if (tautopilot=1 Or 1)And plane>0 And car>0 And volant>0 Then
		showgui("win.typeauto")
		typeautopilot-=1
		subtypeautopilot()
	Else
		hidegui("win.typeauto")
	EndIf
End Sub
Sub subgps
If tgps=0 Then
	If volant=0 And tradar2=0 And car>0 And plane>0 Then
		tradar2=1
	Else  	
		tgps=1 
	EndIf
Else
	If volant=0 And car>0 And plane>0 Then tradar2=0
	tgps=0
	timegps=0
EndIf
End Sub
Sub subradio
tarcade2=0
If tradio=1 Then
	tradio=0
	printgui("win.radio","radio") 
	subsoundarcade()
ElseIf tradio=0 Then
	tradio=2
	printgui("win.radio","repeat") 
	subsoundarcade()
ElseIf tradio=2 Then
	tradio=3
	tarcade2=1
	printgui("win.radio","arcade") 
	subsoundarcade()
Else
	tradio=1
	printgui("win.radio","noradio")
	stopsoundvoyage()
	stopsoundarcade()
	subsoundarcade()
EndIf
End Sub
Dim Shared As Integer tmouse,mousewheelrot,mousewheeldrot,mousewheelrot0
Dim Shared As Double timemousewheel
Sub submousewheel
mousewheeldrot=guimousewheelrot*0.66
mousewheelrot=max2(-100,min2(320,mousewheelrot+mousewheeldrot))
timemousewheel=time2
End Sub
Sub subtestmousewheel()
If plane=0 Or car=0 Then
	Exit Sub	
EndIf
If plane>0 Then mousewheelrot0=prop*0.1
If plane>0 Then
 If thand=0 Then mousewheelrot=0	
 If thand=1 And time2<timemousewheel+1.5 Then 
   If mousewheelrot>20+mousewheelrot0 Then
   	taccelere=time2+0.1:accelere
   EndIf
   If mousewheelrot<-20+mousewheelrot0 Then
   	decelere
 	   If prop<100 And prop>-5 And mousewheelrot<-90 Then brakes()
 	   If prop<1 And mousewheelrot<-91 And v<1 Then v=-4:soundmoteur() 
   EndIf
 Else
   mousewheelrot=mousewheelrot0	
 EndIf
Else
 mousewheelrot0=prop*0.1
 mousewheelrot=max2(mousewheelrot0-20,min2(mousewheelrot0+20,mousewheelrot))	
EndIf 
End Sub
Sub subrightmouse
SetCursorPos(Int(xmax/2),Int(ymax/1.7))
mousex=xmax/2:mousey=ymax/2
mousex0=mousex:mousey0=mousey
mouseo1=0:mouseo2=0
tmouse=(tmouse+1)Mod 2
thand=0
End Sub
Sub submovemouse
mousex0=mousex
mousey0=mousey
mousex=guimousex
mousey=guimousey
submovehand()
/'	
If Abs(mousex-xmax/2)<30 Then
	if Abs(mousey-ymax/1.6)<30 Then Exit Sub 
EndIf
If tmouse=0 Then Exit Sub 
mouseo1-=kfps*Sgn(mousex0-mousex)*1.8
mouseo2+=kfps*Sgn(mousey0-mousey)*1.8
mouseo1=max(-80.0,min(80.0,mouseo1))
mouseo2=max(-40.0,min(80.0,mouseo2))
'/
End Sub
/'Sub subradio()
If tradio=1 Then 
	tradio=0
   stopsoundvoyage()
  	'If tradiomidi=0 And initradio=0 Then
  	'	threaddetach(ThreadCreate(@startradiomidi))  	 
  	'EndIf
  	printgui("win.radio","noradio")
Else
	tradio=1
	printgui("win.radio","radio")
EndIf
guisetfocus("win.graph")	
End Sub '/
Const As Integer nxweb=5*2
Dim Shared As Integer imxweb=1
Dim Shared As Single mxweb(nxweb),myweb(nxweb),dmxweb(nxweb)
Sub resetmxweb()
Dim As Integer i  	
For i=1 To nxweb
	mxweb(i)=999:myweb(i)=999:dmxweb(i)=0
Next
imxweb=1
End Sub
#Include "textures.bi"
Sub main
End Sub
        
Dim As String filename4="objects/horse.md2"
Dim As String fic
Dim As Single x,y,z,dist',tfps
Randomize(imap) 
time2=Timer:time3=time2-0.01:tfps=0.01:kfps=1

guibackgroundcolor(100,255,150)
/'
i=13
fic=Dir("addon/*.bin")
fic=Right(fic,Len(fic)-InStrRev(fic,"/"))
addon(i)=Left(fic,Len(fic)-4)
While i<100 And addon(i)<>""
  	 i+=1
    fic=Dir()
    fic=Right(fic,Len(fic)-InStrRev(fic,"/"))
 	 addon(i)=Left(fic,Len(fic)-4)
Wend
fic=Dir("addon/*.bi2")
fic=Right(fic,Len(fic)-InStrRev(fic,"/"))
addon(i)=Left(fic,Len(fic)-4)
While i<100 And addon(i)<>""
  	 i+=1
    fic=Dir()
    fic=Right(fic,Len(fic)-InStrRev(fic,"/"))
 	 addon(i)=Left(fic,Len(fic)-4)
Wend
fic=Dir("addon/*heightmap.jpg")
fic=Right(fic,Len(fic)-InStrRev(fic,"/"))
addon(i)=Left(fic,Len(fic)-13)
While i<100 And addon(i)<>""
  	 i+=1
    fic=Dir()
    fic=Right(fic,Len(fic)-InStrRev(fic,"/"))
 	 addon(i)=Left(fic,Len(fic)-13)
Wend
If addonname<>"" Then
	For i=1 To 100
		If LCase(addonname)=LCase(Trim(addon(i))) Then
			imap=i
			Exit For 
		EndIf
	Next
EndIf '/

initterrain()
plane=1:car=1
initavion
initairship
initcloud 
If initspace=0 Or planet=0 Then
 mz=max(mz,getterrainheight(mx,my)+mzh)
endif  
mz11=-999999


        debut:
        restart=0:md2nnode=0:mapauto=0:nairport2=0:ntown2=0:solauto=0
        cowlist=0:arbrelist=0:buissonlist=0:house1list=0:house2list=0
        carlist=0:ciellist=0:For i=0 To 4:boatlist(i)=0:Next
        voilelist=0:voile2list=0:avionlist=0:corsair0list=0:corsairlist=0:vg33list=0:zerolist=0
        b25list=0:alphajetlist=0:alphajet0list=0:vg330list=0:spitfirelist=0:spitfire0list=0
        bf109list=0:bf1090list=0:p51dlist=0:p51d0list=0:f14list=0:f140list=0:zero0list=0
        eurofighterlist=0:eurofighter0list=0:c150list=0:c1500list=0:ballonlist=0:c150grplist=0
        fighterlist=0:fighter0list=0:spaceshiplist=0:spaceship0list=0:copterlist=0:coptercockpitlist=0
        boeing737list=0:boeing737lowlist=0
        cowtext=0:soltexture=0:cartext=0:cieltext=0:maptexture=0:maptexture2=0
        maptexture3=0:maptexture4=0:maptexture5=0:towntext=0:webtext=0:webtextzoom=0
        orbit=1
        For i=1 To 10:solautotext(i)=0:Next 
        resettextures()
        If fullscreen=0 Then
        	  ScreenInfo(wx,wy)
           'xmax=min2(wx-30,750-30):ymax=min2(wy-129,470)
           xmax=min2(wx-30,800-30):ymax=min2(wy-129,600-100)
           winx=max2(0,wx/2-(xmax+30)/2):winy=max2(0,wy/2-(ymax+129)/2)
        Else
           ScreenInfo(wx,wy)
           'wx=800:wy=600
           'wx=1024:wy=600
           'wx=1024:wy=768
           'wx=1215:wy=768
           'wx=1380:wy=1024
           'wx=1600:wy=1200
           'wx=1300:wy=1080*1300/1920
           xmax=wx-30:ymax=wy-129
           winx=0:winy=0
        EndIf    
        button("win.gps","gps",@subgps,xmax-110,ymax-20,40,26) 
        button("win.typeauto","auto0",@subtypeautopilot,xmax*0.5-22,ymax-20,45,26) 
        button("win.quit","quit",@subquit,10,ymax+24,45,24) 
        combobox("win.town",@subtown,241,ymax+24,60,400) 
        button("win.help","help",@subhelp,310,ymax+24,45,24) 
        button("win.add","add",@subadd,645-48,ymax+24,40,19) 
        button("win.load","load",@subload,645,ymax+24,40,19) 
        button("win.save","save",@subsave,693,ymax+24,40,19) 
        'combobox("win.sol",@subsol,172,ymax+24,60,200)
        combobox("win.map",@submap,67,ymax+24,93+60,500)
        combobox("win.combo1",@subcombo1,368,ymax+24,77,400)
        combobox("win.ciel",@subciel,455,ymax+24,58,400)
        'combobox("win.grass",@subgrass,522,ymax+24,67,400)
        combobox("win.fog",@subfog,522,ymax+24,60,400)
        'combobox("win.mapsol",@submapsol,589,ymax+24,60,400)
        combobox("win.scalez",@subscalez,743,ymax+24,50,400)
        button("win.flyto","flyto",@subgeocoding,808,ymax+24,60,24) 
        button("win.autopilot","autopilot",@subautopilot,882,ymax+24,75,24) 
        If wx>=1215 Then
          button("win.streetview","streetview",@Subgooglemap,1040-20,ymax+24,85,24) 
          button("win.radio","radio",@subradio,1174-20,ymax+24,56,24) 
          edittext("win.hour","0.00",@subhour,1134-20,ymax+26,35,20) 
        Else
          button("win.streetview","streetview",@Subgooglemap,1040-1030,ymax-10,85,24) 
          button("win.radio","radio",@subradio,1174-1030,ymax-10,56,24) 
          edittext("win.hour","0.00",@subhour,1134-1030,ymax+2-10,35,20) 
        EndIf 
        statictext("win.bing","google",965,ymax+26,60,20)
        graphicbox("win.graph",10,10,xmax,ymax,"opengl")
        'openwindow("win","my window",100,70,xmax+30,ymax+100)
        openwindow("win","freewebcar_chung",winx,winy,xmax+30,ymax+92)
        Sleep 200
        'showwindow(getguih("win"),sw_show)
        setforegroundwindow(getguih("win"))
        Sleep 200
        trapclose("win",@subquit)
        traprightmouse("win.graph",@subrightmouse)
        'trapmovemouse("win.graph",@submovemouse)
        'trapmousewheel(@submousewheel)
        If tradio=1 Then printgui("win.radio","noradio")
        If tradio=2 Then printgui("win.radio","repeat")
        If tradio=3 Then printgui("win.radio","arcade")
        If tradio=3 Then
        	  tradio=2:subradio():soundarcade()
        ElseIf tradio=1 Then 
        	  tradio=3:subradio():soundarcade()
        Else
        	  tradio=1:subradio():soundarcade()
        EndIf
        tshowradio=1':hidegui("win.radio")
        hidegui("win.typeauto")
        hidegui("win.gps")
	     typeautopilot-=1
	     subtypeautopilot()
	     If tbing=1 Then
	     	  printgui("win.bing","bing    ")
	     Else
	     	  printgui("win.bing","google  ")
	     EndIf
        Var hwin=getguih("win")
        addcombo("win.combo1","foot")
        addcombo("win.combo1","car")
        addcombo("win.combo1","car2")
        addcombo("win.combo1","car3")
        addcombo("win.combo1","car4")
        addcombo("win.combo1","car5")
        'addcombo("win.combo1","vg33")
        'addcombo("win.combo1","corsair")
        'addcombo("win.combo1","spitfire")
        'addcombo("win.combo1","spitfire2")
        'addcombo("win.combo1","bf109")
        'addcombo("win.combo1","p51d")
        addcombo("win.combo1","zero")
        addcombo("win.combo1","c150")
        addcombo("win.combo1","ballon")
        addcombo("win.combo1","737")
        addcombo("win.combo1","copter")
        'addcombo("win.combo1","jet")
        'addcombo("win.combo1","f14")
        'addcombo("win.combo1","eurofighter")
        'addcombo("win.combo1","space1")
        'addcombo("win.combo1","space2")
        'addcombo("win.combo1","tour")
        selectcomboindex("win.combo1",icar)
        subcombo1
        'addcombo("win.map","map1")
        'addcombo("win.map","map2")
        'addcombo("win.map","map3")
        /'addcombo("win.map","world")'map4")
        addcombo("win.map","france")
        addcombo("win.map","england")
        addcombo("win.map","yougo")
        addcombo("win.map","grece")
        addcombo("win.map","israel")
        addcombo("win.map","japan")
        addcombo("win.map","vietnam")
        addcombo("win.map","hawai")
        For i=13 To 100
        	If addon(i)<>"" Then addcombo("win.map",addon(i)) Else Exit For 
        Next'/
        addcombo("win.map","world")'then lat=49.35600551121942   :lng=0.06075459446313726   :o1=110: 
        addcombo("win.map","deauville marinas")'then lat=49.36198047661674   :lng=0.07262960190958628   :o1=120: 
        addcombo("win.map","deauville plage")'then lat=49.35600551121942   :lng=0.06075459446313726   :o1=110: 
        addcombo("win.map","trouville plage")'then lat=49.36663106706898   :lng=0.07818353983048315   :o1=130: 
        addcombo("win.map","nancy")'then lat=48.69306979368741   :lng=6.182922715725031   :o1=70: 
        addcombo("win.map","crickvenica")'then lat=45.1734569955986   :lng=14.689314428610118   :o1=-110: 
        addcombo("win.map","paris tolbiac")'then lat=48.826125291730506   :lng=2.3570559500472212   :o1=0: 
        addcombo("win.map","paris defense")'then lat=48.891977155490395   :lng=2.237673523003608   :o1=160: 
        addcombo("win.map","ivry romain roland")'then lat=48.80346335679542   :lng=2.3934673532940915   :o1=-50: 
        addcombo("win.map","orsay")'then lat=48.706787   :lng=2.180894999999964   :o1=-30: 
        addcombo("win.map","le barcares")'then lat=42.78764305091493   :lng=3.0338932951133533   :o1=175:  
        addcombo("win.map","jerusalem")'then lat=31.776636707589287   :lng=35.2337121963501   :o1=36.3920: 
        addcombo("win.map","marseille")'then lat=43.2803905:lng=5.405139   :o1=36.3920: 
        addcombo("win.map","nice")'then lat=43.7031905:lng=7.252817  :o1=36.3920: 
        addcombo("win.map","arcachon")'then lat=44.6514284:lng=-1.171656  :o1=36.3920: 
        addcombo("win.map","grenoble")'then lat=45.1841656:lng=5.7155425 :o1=36.3920: 
        addcombo("win.map","san francisco")'then lat=37.7577:lng=-122.4376 :o1=36.3920: 
        addcombo("win.map","new york")'then lat=40.7033121:lng=-73.97968 :o1=36.3920: 
        addcombo("win.map","atlanta")'then lat=33.7677129:lng=-84.42060 :o1=36.3920: 
        addcombo("win.map","rio")'then lat=-22.8650853:lng=-43.13109 :o1=36.3920: 
        addcombo("win.map","hong kong")'then lat=22.3700556:lng=114.153758 :o1=36.3920: 
        addcombo("win.map","athenes")'then lat=37.9908372:lng=23.7383394 :o1=36.3920: 
        addcombo("win.map","perth")'then lat=-31.9546529:lng=115.852662 :o1=36.3920: 
        addcombo("win.map","le caire")'then lat=30.04441959:lng=31.23571160:o1=36.3920: 
        addcombo("win.map","washington")'then lat=38.8850399:lng=-77.08054296:o1=36.3920: 
        addcombo("win.map","tajmahal")'then lat=27.17015:lng=78.002155:o1=36.3920: 
        imap=4
        selectcomboindex("win.map",icombomap)'imap-3)'4)
        addcombo("win.town","town1")
        addcombo("win.town","town2")
        addcombo("win.town","town3")
        addcombo("win.town","town4")
        addcombo("win.town","town5")
        selectcomboindex("win.town",itown)
        'addcombo("win.sol","sol")
        'addcombo("win.sol","herbe")
        'addcombo("win.sol","herbe2")
        'addcombo("win.sol","desert2")
        'addcombo("win.sol","desert")
        'addcombo("win.sol","auto")
        'selectcomboindex("win.sol",isol)
        isol=6
        'subsol
        /'addcombo("win.mapsol","none")
        addcombo("win.mapsol","map0")
        addcombo("win.mapsol","map1")
        addcombo("win.mapsol","map2")
        addcombo("win.mapsol","map3")
        addcombo("win.mapsol","map4")
        addcombo("win.mapsol","map5")
        addcombo("win.mapsol","map6")
        addcombo("win.mapsol","map7")
        addcombo("win.mapsol","auto")
        selectcomboindex("win.mapsol",imapsol)
        '/
        guistartOpenGL("win.graph")
        imapsol=7+3
        'submapsol
        addcombo("win.ciel","ciel")
        addcombo("win.ciel","ciel0")
        addcombo("win.ciel","ciel1")
        addcombo("win.ciel","ciel2")
        addcombo("win.ciel","ciel3")
        addcombo("win.ciel","ciel4")
        addcombo("win.ciel","ciel5")
        addcombo("win.ciel","ciel6")
        addcombo("win.ciel","sky1")
        addcombo("win.ciel","sky2")
        addcombo("win.ciel","sky5")
        addcombo("win.ciel","sky6")
        addcombo("win.ciel","sky7")
        addcombo("win.ciel","auto")
        If iciel>8 Then
           'If cieltext<>0 Then guideletetexture(cieltext)
           'cieltext=guiloadtexture("media/ciel"+Str(8-2)+".jpg")
        EndIf
        selectcomboindex("win.ciel",iciel)
        subciel
        'addcombo("win.grass","nograss")
        'addcombo("win.grass","grass1")
        'addcombo("win.grass","grass2")
        'selectcomboindex("win.grass",igrass)
        igrass=2
        For i=0 To 20
        	addcombo("win.fog","fog"+Str(i))
        Next
        addcombo("win.fog","auto0")
        addcombo("win.fog","auto")
        selectcomboindex("win.fog",ifog+1)
        For i=0 To 19
        	addcombo("win.scalez","z"+Str(20-i))
        Next
        selectcomboindex("win.scalez",Int(21-scalez+0.1))
        trapLeftmouse("win.graph",@subleftmouse)
        'trapLeftmouseup("win.graph",@sublefthandup)
        guisetfocus("win.graph")
        
        initgl
        sleep 400
        For n=1 To 2
        glclearcolor 0,0.7,0, 0.0
        glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT  Or GL_STENCIL_BUFFER_BIT)
        If planet=1 Then
        	  glcolor3f(1,1,1)
        	  glenable(gl_texture_2d)
        	  glbindtexture(gl_texture_2d,worldtext)
        	  glplacecursor(xmax/2,ymax/2,-4000)
        	  glrotatef(-90,0,1,0)
        	  gltexsphere(2000)
        EndIf
        i=xmax*0.30:j=ymax*0.4
        glcolor3f(0,0,0.3)
        gldrawtext0("freewebcar_chung",i,j,3)
        glcolor3f(1,1,1)
        gldrawtext0("a program by NGUYEN.Chung",i+40,j+70,1.5)
        guirefreshopenGL()
        Sleep 400
        Next n                        
        substat()
        
        'Dim As Integer maxtextsize
        'glGetIntegerv(GL_MAX_TEXTURE_SIZE, @maxtextsize)
        'notice Str(maxtextsize)
        
        dummytext=guiloadtexture("media/smoke.bmp",55)
        tronctext=guiloadtexture("media/tronc.jpg")
        /'volanttext=guiloadtexture("objects/volant.jpg",252)
        startext=guiloadtexture("media/stars.jpg")
        sunsettext=guiloadtexture("media/sun.jpg")
        helicetext=guiloadtexture("objects/helice.jpg",40,47)
        cockpittext1=guiloadtexture("media/cockpit1.jpg",245)'252)
        cockpittext2=guiloadtexture("media/cockpit2.jpg",237)'252)
        cockpittext3=guiloadtexture("media/cockpit3.jpg",237)'252)
        cockpittext4=guiloadtexture("media/cockpit4.jpg",237)'252)
        feutext=guiloadtexture("media/explosion.jpg",25,200)'feu.jpg")
        smoketext=guiloadtexture("media/smoke.bmp",55)
        firetext=guiloadtexture("media/fire.jpg",20,175)
        sfiretext=guiloadtexture("media/smoke.bmp")
        boattext=guiloadtexture("objects/ship.jpg")
        boattext2=guiloadtexture("objects/sailship.jpg")
        boattext3=guiloadtexture("objects/_vessel.jpg")
        boattext4=guiloadtexture("objects/shipcarrier.jpg")
        windtext=guiloadtexture("media/vent.jpg",253)
        radartext=guiloadtexture("media/radar.jpg",253)
        pistetext=guiloadtexture("media/piste.jpg")
        bullettext=guiloadtexture("media/impactballe.jpg",253)
        worldtext=guiloadtexture("media/world.jpg")
        '/
        /'worldbmp=ImageCreate(1500,750)
        guiBload(worldbmp,"media/world.jpg")
        townbmp=ImageCreate(900,900)
        'guiBload(townbmp,"media/croatia.jpg")
        '/
        timeinit=Timer
        timehelp=Timer-30 
        'initcar
        initncar()
        arbretext(1)=0
        grasstext(1)=0
        building3text=0
        housetext=0
        inittownobject
        initlist
        setfog
        md2horse=loadmd2model(filename4,0,0,-2)

        Randomize()        
        inithorses
        resettownwaynode()
        resetfuel()
        If startoption=1 And init=0 Then
        	  ficload=""
        	  Var testok=1
        	  If getficok()<>"ok" Then
        	  	  testok=0
        	  	  subload()
        	  EndIf
        	  If ficload="" Then
        	  	 If testok=0 Then
        	  	 	guiconfirm("continue previous game ?","confirm",resp)
        	  	 	If resp="yes" Then testok=1
        	  	 EndIf
        	    If testok=0 Then
        	    	subreset()
        	    Else 
         	   setficok("notok")
        	      load("save/startup.save0")
        	    EndIf   
        	  EndIf   
     	     'setficok("ok")
        Else 
        	  tinitload=0
        	  tinitloadmx=1
        EndIf
        o2=0:o3=0
        avgo1=o1
        tlayer00=tlayer
        debut2:
        tinittown0=2
	     If planet=1 And icar<>16 And icar<>17 And icar>4 Then
		     icar=16:selectcomboindex("win.combo1",icar)
	        subcombo1()
	     EndIf
	     'subcombo1
	     subsol
	     submapsol
        initairport
        inittown
        'initterrainlines
        initarbres
        inithouses
        'initdomes
        initgrass
        'inittownjpg
        planetsat=0
        If planet=1 Then 
          If FileExists("addon/"+addon(imap)+"sat.jpg") Then
          	planetsat=1
          	planetsattext=guiloadtexture("addon/"+addon(imap)+"sat.jpg")
          EndIf
        EndIf
        
        If imap>=4 Then
        	If maptext<>0 Then guideletetexture(maptext)
        	maptext=initmaptexture()
        EndIf
        If startoption=0 Or init=2 Then subreset(1):init=1
        If initspace=0 Or planet=0 Then
           mzsol0=getterrainheight(mx,my)+mzh'25
        Else
           mzsol0=-999999
        EndIf       
 	     mz=max(mz,mzsol0):mz1=mz:mz11=mzsol0
 	     'If mz>(mzsol0+1700) Or planet=1 Then stopsoundarcade
 	     stationvie=5000
        init=1
        worldname="world"'guigettext("win.map")
        If worldname="world" Then testworld=1:loadmapworld() Else testworld=0
        xtown=-9999999:itown4=0:settown() 
        stopsoundocean()
        stopsoundocean2()
        'stopsoundarcade()
        resetrecentid() 
        
        time2=Timer:time3=time2-0.01
        
        'Dim Shared As Single scalex0
        scalex0=scalex
        'Dim Shared As ubyte mybmpretro(4*1000*1000)
        timeinit=Timer 
        testinit=0
        mzinit=mz
        'guinotice "ok"
        
        Var tquit=Timer,tframe=tquit-5,tactive=Timer
        quit2=0
        While (quit=0 And guitestkey(vk_escape)=0)Or tframe<tquit
        	   
          	If Timer>tactive+1 then 
          	  tactive=Timer
          	  guitestactivekey=0
         	  If getforegroundwindow()=hwin then guitestactivekey=1
         	  If tok=0 Then
         	  	  If Timer>timeinit+20 Then
         	  	  	 tok=1:setficok("ok")
         	  	  EndIf
         	  EndIf 	  
          	EndIf
          	
				tframe=Timer 
        	   If guitestkey(vk_escape)<>0 Then quit=1
        	   If quit=0 Then tquit=max(tquit,tframe+2)
        	   
         	guiscan
       	   subtestmousewheel()
        	 
         	scalex=scalex0
         	If testscale=1 Then scalex=scalex0/2
         	/'If initspace=1 And planet=1 And quit=0 Then
         		orbit=0:suborbit()
         		If initspace=1 Then quit=1:Exit while
         	Else
         		If planet=0 Or quit=0 Then initspace=0
         		If planet=1 And quit=0 Then
         			initspace=0:testorbit()
            		If initspace=1 Then quit=1:Exit while
         		EndIf
         	EndIf '/
         	orbit=1
         	if quit=1 And tframe>tquit Then exit while 
         	itime+=1:If itime>10000 Then itime=0
         	If (itime Mod 10)=0 Then testspeak()
         	testmaree()
         	'If (time2>timerefreshwindow) Then
         	'	timerefreshwindow=time2+20
         	'	guirefreshwindowh(hwin)'settown()
         	'EndIf 	
         		
        	   If guitestkey(vk_9)<>0 And topview=0 Then subtest()
        	   If guitestkey(vk_0)<>0 Then subsounds2()
        	   If guitestkey(vk_f9)<>0 Then subscreen
        	   If guitestkey(vk_f1)<>0 Then subhelp
        	   If guitestkey(vk_p)<>0 Then
        	    If plane>0 And car=0 Then
        	   	stopvol()
        	   	notice("pause","pause"):time2=Timer:time3=time2-0.01
        	      setvol()
        	    Else
        	    	subautopilot
        	    EndIf 	
        	   EndIf
        	   'If guitestkey(vk_f12)<>0 Then submapworld()
        	   If guitestkey(vk_f4)<>0 Then substars()
        	   If guitestkey(vk_m)<>0 And guitestkey(vk_shift)=0 And guitestkey(vk_control)=0 And imap>=4 Then
        	   	testweb=1
        	   	If testworld=0 Then
        	   		mapdisplay=(mapdisplay+1)Mod 3
        	   	Else
        	   		mapdisplay=(mapdisplay+1)Mod 7
        	   		/'If mapdisplay=4 Then
        	   			mapdisplay=6
        	   		Elseif mapdisplay=6 Then
        	   			mapdisplay=0
        	   		Else
        	   			mapdisplay=4
        	   		EndIf '/
        	   	EndIf
        	   	If mapdisplay=1 Then tkzoom=1
        	   	If mapdisplay>0 Then setnbuilds()
        	   	Sleep 300:guiscan 
        	   EndIf
        	   If guitestkey(vk_m)<>0 And guitestkey(vk_shift)<>0 And imap>=4 Then
        	   	mapdisplay=5
        	   	Sleep 300:guiscan
        	   EndIf
        	   If guitestkey(vk_m)<>0 And guitestkey(vk_control)<>0 Then submassdownload()
        	   If mapdisplay0<>mapdisplay Then
        	   	If mapdisplay0=5 Or mapdisplay=5 Then tloadmapdisplay=1
        	   EndIf
        	   mapdisplay0=mapdisplay
        	   If guitestkey(vk_g)<>0 And guitestkey(vk_control)<>0 And testworld=1 And planet=0 Then subgeocoding()
        	   If guitestkey(vk_g)<>0 And guitestkey(vk_shift)<>0 Then subgoogle()
        	   If guitestkey(vk_b)<>0 And guitestkey(vk_shift)<>0 Then subbing()
        	   If guitestkey(vk_t)<>0 And guitestkey(vk_control)<>0 Then
        	   	If guitestkey(vk_shift)=0 Then
        	   		subnarbre
        	   	Else
        	   		subtourelleretro()
        	   	EndIf
        	   EndIf
        	   If guitestkey(vk_d)<>0 And guitestkey(vk_control)<>0 Then subdistscale
        	   If guitestkey(vk_r)<>0 And guitestkey(vk_control)<>0 Then
        	   	If guitestkey(vk_shift)=0 Then subreset Else subresettown
        	   EndIf
        	   If guitestkey(vk_f)<>0 And guitestkey(vk_control)<>0 Then submaxfps
        	   If guitestkey(vk_s)<>0 And guitestkey(vk_control)<>0 Then subshadow'smooth
        	   If guitestkey(vk_w)<>0 And guitestkey(vk_control)<>0 Then subwave
        	   If guitestkey(vk_b)<>0 And guitestkey(vk_control)<>0 Then subnroc
        	   If guitestkey(vk_o)<>0 And guitestkey(vk_control)<>0 Then substart
        	   If guitestkey(vk_o)<>0 And guitestkey(vk_shift)<>0 Then suboverpass
        	   If guitestkey(vk_c)<>0 And guitestkey(vk_control)<>0 Then subncloud
        	   If guitestkey(vk_n)<>0 And guitestkey(vk_control)<>0 Then subncar
       	   If guitestkey(vk_l)<>0 And guitestkey(vk_control)<>0 Then sublevel
        	   If guitestkey(vk_x)<>0 And guitestkey(vk_control)<>0 Then subscalex
        	   'If guitestkey(vk_x)<>0 And guitestkey(vk_shift)<>0 Then subscaletown
        	   'If guitestkey(vk_z)<>0 And guitestkey(vk_control)<>0 Then
        	   '	subtopview
        	   'EndIf
        	   tseashore=0'If guitestkey(vk_a)<>0 And guitestkey(vk_control)<>0 Then subseashore
        	   'If guitestkey(vk_w)<>0 Then subwar
        	   If guitestkey(vk_prior)<>0 And topview=2 Then
        	   	Var wk=wktown:wktown=min(3,wktown+0.01):dxtown*=wktown/wk:dytown*=wktown/wk
        	   EndIf
        	   If guitestkey(vk_next)<>0 And topview=2 Then
        	   	Var wk=wktown:wktown=max(0.3,wktown-0.01)::dxtown*=wktown/wk:dytown*=wktown/wk
        	   EndIf
        	   If guitestkey(vk_i)<>0 And guitestkey(vk_control)<>0 Then subinternet'subopentown
      
         	'mx0=mx:my0=my:mz0=mz
         	distmax=scalex*256
         	Var dist=Sqr(mx*mx+my*my)
         	If dist>distmax*0.9 Then
         	 mx=-mx*0.98*distmax*0.9/dist
         	 my=-my*0.98*distmax*0.9/dist
			    mx=mx0+Int(mx-mx0):my=my0+Int(my-my0)
         	 If imap>=4 Then 
         	 	'dmx00=dmx0+(mx0-mx)*2:dmy00=dmy0+(my0-my)*2
         		'dmx0-=mx-mx0:dmy0-=my-my0
         		dmx0=0:dmy0=0
         		initterrain3
         		mx0=mx:my0=my:mz0=mz 
         	 EndIf 
             mzsol0=getterrainheight(mx,my)+mzh
             mz=max(mz,mzsol0)
			    If plane=2 Then avionx=mx:aviony=my:avionz=mz
         	EndIf
         	/'If planet=1 Then
         		If Abs(mx+dmx0)>planetdxmax Then
         			dmx00=dmx0:dmy00=dmy0
         			dmx0-=Sgn(mx+dmx0)*planetdxmax*2
         			initterrain3
         		EndIf
         		If Abs(my+dmy0)>planetdymax Then
         			dmx00=dmx0:dmy00=dmy0
         			While (my+dmy0)>(planetdymax-1000):my-=1000:Wend
         			While (my+dmy0)<(-planetdymax+1000):my+=1000:Wend
         			o1=-o1
         			dmx0=((Int(dmx0+planetdxmax*2))Mod Int(planetdxmax*2)) _  
         			    -planetdxmax
         			initterrain3
         		EndIf 
         	EndIf '/
         	subjoystick()
            testo123
           	If planet=0 Then testarbre()
           	
           	glviewport(0,0,xmax,ymax)
            gldisable gl_lighting
            gldisable gl_alpha_test
           	display()
           	
           If mapdisplay=4 Then
           	  drawtexture(webtext)
           	  Var xx=(mx-xweb)/dxweb,yy=(my-yweb)/dyweb
           	  gldrawtext("x",xmax*(0.5+xx*0.27),ymax*(0.5-yy*0.5))
           ElseIf mapdisplay=0 And tretroviseur=1 And plane>0 And car>0 Then 
           	Var dvx=0.0183,dvy=0.5*dvx*xmax/ymax
           	glviewport(xmax*(0.4-dvx),ymax*(0.8-dvy),xmax*(0.2+dvx+dvx),ymax*(0.2+dvy+dvy)) 
          	glplacecursor(xmax*0.5,ymax*0.5,-40)
          	If car=5 Then
          		glcolor3f(1,0.7,0.3)
          	ElseIf car=1 Then 
          	   glcolor3f(0.3,0.3,0.5)
          	ElseIf car=2 Then 
          	   glcolor3f(0.75,0.75,0.9)
          	ElseIf car=4 Then 
          	   glcolor3f(0.2,0.2,0.75)
          	Else 
          	   glcolor3f(0.2,0.2,0.8)
          	EndIf    
          	gldisable gl_texture_2D
          	gldisable gl_depth_test
          	glcarre(50)
          	glenable gl_texture_2d
          	glenable gl_depth_test
          	glcolor3f(1,1,1)
          	dvx=0.05
           	glviewport(xmax*(0.4-dvx),ymax*(0.8-dvx),xmax*(0.2+dvx+dvx),ymax*(0.2+dvx+dvx)) 
           	dvx=0.01
           	Var x0=xmax*(0.4-dvx),y0=ymax*(0.8),dx0=xmax*(0.2+dvx+dvx),dy0=ymax*(0.2) 
           	glscissor(x0,y0,dx0,dy0) 
           	'glscissor(xmax*0.4,ymax*0.8,xmax*0.2,ymax*0.2) 
           	glenable gl_scissor_test     
            If retrotext=0 Then glbindtexture(gl_texture_2d,retrotext)

           	If (itime And 1) And timer>timeretro+0.1 Then
           		timeretro=max(timer-0.05,timeretro+0.1)
               gldisable gl_alpha_test
           		displayback()
           		
           	'gldisable gl_scissor_test     
           	dvx=0.01
           	x0=xmax*(0.4-dvx):y0=ymax*(0.8):dx0=xmax*(0.2+dvx+dvx):dy0=ymax*(0.2) 
      glbindtexture(gl_texture_2d,retrotext)
      'gltexparameteri(gl_texture_2d,GL_GENERATE_MIPMAP,gl_true)
      glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
      glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
      'glcopyTexImage2D(GL_TEXTURE_2D, 0, gl_rgba,0,0,bmpx,bmpx, 0)   
      glcopyTexSubImage2D(GL_TEXTURE_2D, 0, 0,0, x0,y0,dx0,dy0)
      'glbindtexture0(gl_texture_2d,0)
           	Else 
               'displayback(0)
           	EndIf
      
          	dvx=0.05
           	glviewport(xmax*(0.4-dvx),ymax*(0.8-dvx),xmax*(0.2+dvx+dvx),ymax*(0.2+dvx+dvx)) 
            'glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT  Or GL_STENCIL_BUFFER_BIT)
            'glClear (GL_DEPTH_BUFFER_BIT)
           	'Var dvx=0.01
           	'Var x0=xmax*(0.4-dvx),y0=ymax*(0.8),dx0=xmax*(0.2+dvx+dvx),dy0=ymax*(0.2) 
            glpushmatrix
            glcolor4f(1,1,1,1)
            gldisable gl_blend
            glenable gl_texture_2d
            gldisable gl_depth_test
            gldisable gl_alpha_test
            glbindtexture(gl_texture_2d,retrotext)
            glplacecursor(xmax*0.5,ymax*0.5,-39)
            gltexcarre4(80*0.8,40*0.8,dx0/512,dy0*2/(0.995*256)) 
            glenable gl_depth_test 
            glpopmatrix

           	'glscissor(0,0,xmax,ymax) 
           	gldisable gl_scissor_test
           EndIf 
            'glviewport(0,0,xmax,ymax)
            /'glReadPixels(0,0, 400,200, _   
                   GL_rgba, GL_UNSIGNED_BYTE, @mybmpretro(1))
            'glRasterPos2i(100, 100)
            glplacecursor(100,100,-40)
            gldrawPixels(400,200, _   
                   GL_rgba, GL_UNSIGNED_BYTE, @mybmpretro(1))
            '/
           	/'Var dvx=0.01
           	Var x0=xmax*(0.4-dvx),y0=ymax*(0.8),dx0=xmax*(0.2+dvx+dvx),dy0=ymax*(0.2) 
            gldisable gl_depth_test
            glbindtexture(gl_texture_2d,retrotext)
            glplacecursor(xmax*0.5+400,ymax-y0-dy0*0.5)
            gltexcarre4(20*0.8,10*0.8,dx0/512,dy0*2/(256)) 
            glenable gl_depth_test '/
             
           	'For i=1 To md2nnode
           	'	If md2_nodes(i)->anim=md2_random And Rnd<0.7/(0.1+fps) Then
           	'		If pause=0 Then setanim(md2_nodes(i),md2_random)
           	'	EndIf
           	'Next

            If time2>timeinit+10 Then
            	guirefreshopenGL()
            Else 	
               glclearcolor 0,0.7,0, 0.0
               glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT  Or GL_STENCIL_BUFFER_BIT)
            	guirefreshopenGL()
            	If time2<timeinit+8 And Abs(mzinit)>0.001 Then
            		mz=mzinit:mz1=mz:piste=1:piste0=1
            	Else
            		mzinit=0
            	EndIf 	
            EndIf 	
           	If mapdisplay<>0 Then mx=mx0:my=my0:mz=mz0:mz1=mz 
            If time2<tcrashz+1 Then mz=mzcrash:mz1=mz
           	
           	
If Timer>tupdate+0.2 And (planet=0 And orbit=1)And topview=0 And mapdisplay<>4 And mapdisplay<>6 And (tinternet>=1 Or quit=1) Then
	tupdate=timer
	If quit=1 Then
		quit2=1:tquitweb=1
		If tloadwebtext2=0 Then tloadwebtext2=99
		If tinittown=0 Then tinittown=99
		If tloadwebtext2=99 And tinittown=99 Then
			tquit=min(tquit,tframe-0.01)
		EndIf
	EndIf
  If tframe<tquit Or quit=0 Then 
   If quit=0 Then tquit=max(Timer,tframe)+15
   Var dxx=28000,dyy=28000,test=0
   t10=3
   If tloadwebtext<-1 Then
   	tloadwebtext=0
   	If worldname="world" Then zoom=13
   EndIf
   Var kdz=1.0
   If plane>0 And car=0 Then
   	kdz=0.75
   	If tgoogle=1 Then kdz=0.5
   EndIf
   If tbing=1 Then kdz*=0.65
   If 0 Then'(mz-mzsol0)<100 and v<5 Then
   	dxx=1800:dyy=1800
   	If zoom<>16 And webtext>0 And Timer>tloadwebtext+t10 Then
   		test=1
   		zoom=16
   	EndIf
   ElseIf (mz-mzsol0)<700*kdz Then'<500 And (plane=0 Or car>0)Then
   	'dxx=7500:dyy=7500
   	dxx=3500:dyy=3500
   	If zoom<>15 And webtext>0 And Timer>tloadwebtext+t10 Then
   		test=1
   		zoom=15
   	EndIf
   ElseIf (mz-mzsol0)<1400*kdz Then
   	dxx=8000:dyy=8000
   	If zoom<>14 And webtext>0 And Timer>tloadwebtext+t10 Then
   		test=1
   		zoom=14
   	EndIf
   ElseIf (mz-mzsol0)<3400*kdz Then
   	dxx=15000:dyy=15000
   	If zoom<>13 And webtext>0 And Timer>tloadwebtext+t10 Then
   		test=1
   		zoom=13
   	EndIf
   ElseIf (mz-mzsol0)>3000*kdz And (mz-mzsol0)<5000*kdz Then 
   	dxx=28000:dyy=28000
   	If zoom<>12 And webtext>0 And Timer>tloadwebtext+t10 Then
   		test=1
   		zoom=12
   	EndIf
   ElseIf (mz-mzsol0)>5000*kdz Then 
   	dxx=44000:dyy=44000
   	If zoom<>11 And webtext>0 And Timer>tloadwebtext+t10 Then
   		test=1
   		zoom=11
   	EndIf
   EndIf
   'zoom=11
   'dxweb=100000:dyweb=100000
   'webtext=towntext
   If xweb1<-99999998 Then
   	xweb1=xweb-999999:yweb1=yweb:dxweb1=dxweb:dyweb1=dyweb 
   EndIf
   If x960>2000 Then dxx*=1.5:dyy*=1.5
   If plane>0 And car=0 And tbing=1 Then dxx*=0.5:dyy*=0.5
   If testworld=0 Then dyy*=0.75
   Var dxx1=dxx*2,dyy1=dyy*2
   If mapdisplay=1 Then dxx1=30:dyy1=30
   If mapdisplay=1 And guitestkey(vk_z) Then
   	If dkzoom<0.12 Then
   		dkzoom=0.125
   	ElseIf dkzoom<0.7 Then
   		dkzoom=1
   	ElseIf dkzoom<3.1 Then
   		dkzoom=4 
   	ElseIf dkzoom<7 Then
   		dkzoom=8
   	Else  	
   		dkzoom=0.125/16
   	EndIf
   	kzoom=2/dkzoom
   	tkzoom=1
   	testweb2=11
   	'tquitweb=1
   	Sleep 300 
   EndIf
   If mapdisplay=1 And guitestkey(vk_a) Then
   	If dkzoom>7 Then
   		dkzoom=4 
   	ElseIf dkzoom>2 Then
   		dkzoom=1
   	ElseIf dkzoom>0.9 Then   	
   		dkzoom=0.125
   	ElseIf dkzoom>0.1 Then
   		dkzoom=0.125/16
   	Else 	
   		dkzoom=8
   	EndIf
   	kzoom=2/dkzoom
   	tkzoom=1
   	testweb2=11
   	'tquitweb=1
   	Sleep 300 
   EndIf
    'Var mxx=mx+dmx0+cos1*dxx1*kzoom*0.38
    'Var myy=my+dmy0+sin1*dyy1*kzoom*0.38
    Var mxx=mx'+dmx0+cos1*dxx1*kzoom*0.3
    Var myy=my'+dmy0+sin1*dyy1*kzoom*0.3
    If xwebzoom1<mxx-dxx1*kzoom*1.05 Or _'1.5
       xwebzoom1>mxx+dxx1*kzoom*1.05 Or _
       ywebzoom1<myy-dyy1*kzoom*1.05 Or _
       ywebzoom1>myy+dyy1*kzoom*1.05 Or tkzoom>0.1 Then
       'If Timer>tloadwebtext+11 Then
       If Timer>tloadwebtext+t10+t11-0.1 Or (xweb11<xweb-999000) Then
       	test=11
       EndIf
    EndIf
    If test<>1199 then 
   'Var mxx=mx+dmx0+cos1*dxx*0.5
   'Var myy=my+dmy0+sin1*dyy*0.5
   Var mxx=mx+dmx0+cos1*dxx*0.4
   Var myy=my+dmy0+sin1*dyy*0.4
   If (xweb<mxx-dxx) Or _
      (xweb>mxx+dxx) Or _
      (yweb<myy-dyy) Or _
      (yweb>myy+dyy) Or (xweb1<xweb-999000) Then
       If Timer>tloadwebtext+t10+t11 Or (xweb1<xweb-999000) Then
       	test=1
       EndIf
   EndIf
   
       
   /'Else 
    Var dxx10=44000,dyy10=44000	
    Var mxx10=mx+dmx0+cos1*dxx10*0.5
    Var myy10=my+dmy0+sin1*dyy10*0.5
    If xweb10<mxx10-dxx10 Or _
       xweb10>mxx10+dxx10 Or _
       yweb10<myy10-dyy10 Or _
       yweb10>myy10+dyy10 Then
       If Timer>tloadwebtext+t10 Then
       	test=10
       EndIf
    endif '/    
   EndIf
   'If tloadmapdisplay=1 And Timer>tloadwebtext+t10 And tloadwebtext2=0 Then test=1
   /'If test=10 And tloadwebtext2<>2 Then
   	tloadwebtext2=2
      Var dxx10=44000,dyy10=44000	
      xweb10=mx+dmx0+cos1*dxx10*0.5
      yweb10=my+dmy0+sin1*dyy10*0.5
  	   threaddetach(ThreadCreate(@subloadwebmap))
   EndIf '/
   If tquitweb=1 Or quit=1 Then
   	If tinittown=22 Or tinittown=23 Then
   		tinittown=0
   	EndIf
   EndIf
   /'If guitestkey(vk_8) Then
   	Var mmx=mx,mmy=my,mmxx=mx,mmyy=my
   	latlngtomxy(lat,lng,mmx,mmy)
   	latlngtomxy(lat+360/40000,lng+klon*360/40000,mmxx,mmyy)
   	guinotice Str(mmxx-mmx)+" "+str(mmyy-mmy)'10143+-0.5=> 10.143 / 1m
   	latlngtomxy(lat+0.1,lng+0.1,mmx,mmy)
   	latlngtomxy(lat+0.1+360/40000,lng+0.1+klon*360/40000,mmxx,mmyy)
   	guinotice Str(mmxx-mmx)+" "+str(mmyy-mmy)'10143/10147+-0.5=> 10.143 / 1m
   EndIf '/ 	
   'auxvar=asktownlat:auxvar2=asktownlat2:auxtest=0.7
   If tinittown0=0 And tgoogle>=1 Then
   	If googleerror=1 Then
   		't11=0':testweb=1
   		test=0:testweb=0:avgo1=o1
      	kfps=3:fps=10:tfps=0.1
   		'auxtest=0.7
   	EndIf 	
   	googleerror=0
   ElseIf tinittown0>0 Then 
   	googleerror=0:dtweb=20
   Else 
   	googleerror=1
   EndIf
   'auxvar=lockterrain+0.1:auxvar2=lockterrainbmp+0.1:auxtest=0.2
   'auxvar=Int(Fre()/1000):auxtest=0.3
   If tloadwebtext2<>0 Then tidle=time2
   If t11<3 Then setmyroadlatlon()
   If (tloadwebtext2<>2)Or httpon=1 Then t222=Timer
   If (tloadwebtext2=2) And Timer>t222+120 and httpon<>1 Then
   	t222=Timer:tloadwebtext2=0'force to zero
   EndIf 	
   If t11<3 Then t111=Timer 
   If test=11 And (t11<3 Or Timer>t111+9)And (testweb2=0 or mapdisplay>0) Then testweb2=11
   If test=1 And (t11<3 Or Timer>t111+9) Then testweb=1
   If time2>timeinit+200 And timeinit>time2-1000 Then timeinit=time2-30:testweb=1
   If time2>timeinit+20 And testinit=0 Then testinit=1:testweb=1:subsettupdate()
   If timeinit>time2-6 Then testinit=0
   If tquitweb=1 Then
   	If quit=1 Then testweb=0
   	If tloadwebtext2=200 Then tloadwebtext2=0
   EndIf
   If test=0 And testweb=0 And httpon<>1 And tloadwebtext2=0 And skyauto<=1 Then
   	testgetweather()
   	If tsubciel=1 Then tsubciel=0:subciel():setfog()
   EndIf
   If testweb=1 And tinittown=0 And httpon<>1 And tloadwebtext2=0 And _   
      ((mz-mzsol0)<100 Or Abs(sin3)<0.60) Then '<0.67
      timeinit=max(timeinit,time2-20)
   	tloadmapdisplay=0
   	testweb=0 
      tloadwebtext2=2
   	'If (mz-mzsol0)<500 Then t11=1.4
   	t11=4:t111=Timer
   	'xweb1=mx+dmx0+0.5*cos1*dxx:yweb1=my+dmy0+0.5*sin1*dyy
   	If Abs(xweb1-mx-dmx0)>99990 Then resetmxweb()
   	xweb1=mx+dmx0+cos1*dxx*0.7:yweb1=my+dmy0+sin1*dyy*0.7
   	dxweb1=dxweb:dyweb1=dyweb
      If testworld=1 Then
   	 If max(Abs(xweb1),Abs(yweb1))>2500000 Then
         Var aux=(8/40)/(4*k8*512*scalex)  
         mapautoix=535+worldx+(xweb1)*aux*535
         mapautoiy=(276+worldy)-(yweb1)*aux*276*2
   		worldx=max(-535,min(535,mapautoix-535))
   		worldy=max(-276,min(276,mapautoiy-276))
   		myworldx=worldx:myworldy=worldy
   		dmx0=0:dmy0=0:mx=0:my=0
   		xweb=0:yweb=0:xweb1=0:yweb1=0
   	 EndIf
      EndIf
      If (Abs(worldx-worldx00)+Abs(worldy-worldy00))>0.001 Then 
         If worldname="world" Then
         	testworld=1:worldx=myworldx:worldy=myworldy:loadwebmap()
         EndIf
         worldx00=worldx:worldy00=worldy
         resetmxweb()
         'resettownwaynode()
         Sleep 100
      EndIf
  	   threaddetach(ThreadCreate(@loadwebtext))    
ElseIf tinittown=0 And tinittown0=0 And testweb2=11 And httpon<>1 And tloadwebtext2=0 Then
   	   tloadwebtext2=2
   	   testweb2=0
   	   t11=2:t111=Timer
   	   If tkzoom>0.1 Then 
   	    tkzoom=0
   	    tquitweb=0
   	   EndIf  
   	   'xwebzoom1=mx+dmx0+cos1*dxx*0.7*kzoom:ywebzoom1=my+dmy0+sin1*dyy*0.7*kzoom
   	   xwebzoom1=mx:ywebzoom1=my
   	   xweb11=xweb
   	   'xwebzoom1=xweb:ywebzoom1=yweb
   	   dxwebzoom1=dxweb*kzoom:dywebzoom1=dyweb*kzoom
   	   if mapdisplay<>1 then
   	   	threaddetach(ThreadCreate(@loadwebtextzoom))
   	   else
   	   	loadwebtextzoom(0)
   	   endif 
   ElseIf tloadwebtext2=4 Then
      If quit=1 Then
      	tloadwebtext2=0
      Else 
         tloadwebtext2=2
         loadwebtextzoom2()
         xwebzoom=xwebzoom1:ywebzoom=ywebzoom1
         dxwebzoom=dxwebzoom1:dywebzoom=dywebzoom1
         'threaddetach(ThreadCreate(@subsetmapautotextureszoom))
      EndIf '/
   EndIf
   If tinittown0=1 And tloadwebtext2=0 And topentown=1 Then tinittown0=0:lattown=-89
   If tloadwebtext2=1 Then
     If quit2=1 Then
        tloadwebtext2=0
     Else 
      tloadwebtext2=2
      tloadwebtext=0
      tupdateterrain=1
      xweb=xweb1:yweb=yweb1:dxweb=dxweb1:dyweb=dyweb1:klon=klon1
      'subsettupdate()
      If testworld=0 Then
      	y+=(yweb-y)*0.5
      EndIf
      loadwebtext2()
      threaddetach(ThreadCreate(@subsetmapautotextures))
      /'loadwebtextzoom2()
      auxvar=Timer
      loadwebtext2()
      auxvar=(Timer-auxvar)*1000
      setmapautotextures()'/
     EndIf
   ElseIf tloadwebtext2=3 Then
      tloadwebtext2=2
      setmapautotextures2()
      tupdateterrain=0
      If (Abs(worldx-worldx000)+Abs(worldy-worldy000))>0.0001 Or (topentown=1 And tinittown0>=1) Then 
        initairport
     	  If tinittown=0 And quit2=0 Then
     	  	 tinittown=2:threaddetach(ThreadCreate(@inittown2))
     	  EndIf
        worldx000=worldx:worldy000=worldy
        resetmxweb()
        'resettownwaynode()
      Else
        tloadwebtext2=33'tinittown=3
      EndIf
   ElseIf tloadwebtext2=0 And tinittown=22 Then
   	If quit2=1 Or tquitweb=1 Then
   		tinittown=0
   	Else 
        tloadwebtext2=2
        tinittown=0
        threaddetach(ThreadCreate(@inittown222))
      EndIf    
   ElseIf tloadwebtext2=0 And tinittown=23 Then
   	If quit2=1 Or tquitweb=1 Then
   		tinittown=0
   	Else 
        tloadwebtext2=2
        tinittown=0
        threaddetach(ThreadCreate(@inittown223))
      EndIf    
   ElseIf tloadwebtext2=33 Or tinittown=3 Then
   	tloadwebtext2=0
   	If tinittown=3 Then
   		tinittown=0
        initarbres
        inithouses
        initdomes
        initgrass
   	EndIf
   	subsettupdate()
      'updateworldobjects
      'initterrainlines
   ElseIf testweb=0 And tloadwebtext2=0 And tinittown=0 And tinittown0<=0 And topentown=1 And Timer>tloadwebtext+t10+2.3 And _  
   	    abs(sin3)<0.60 And quit2=0 And tinternet>=2 And mapdisplay=0 And  _   
   	    guitestkey(vk_left)=0 And guitestkey(vk_right)=0 And guitestkey(vk_down)=0 Then '<0.67
     If mapdisplay=0 And testweb2=0 And time2>timeinit+20 Then 
   	tloadwebtext2=2:tinittown=1
   	Var dlatmax=1*360/40000
   	Var lat0=lat,lng0=lng
   	mxytolatlng(mx+dmx0,my+dmy0)
   	Var latmx0=lat,lngmx0=lng
      lat=lat0:lng=lng0
      Var kdx=1.0
      If (mz-mzsol0)<690.500 Or vkm<80 Then kdx=0.7
      'If (mz-mzsol0)<100 Then kdx=0.5
      Var dx=kdx*1.3*360/40000
      If plane>0 And car=0 And avion="737" Then dx*=1.5
      Var kz=min(2.0,0.97+(mz-mzsol0)/4000)'2000'1300'3900
      If (mz-mzsol0)<690.500 And plane>0 Then kz+=v*70/1300
      If (mz-mzsol0)<690.500 Or vkm<80 Then kz-=0.65
      lattown1=latmx0+dx*kz*sin1:lngtown1=lngmx0+dx*kz*cos1*klon
      setmyroadlatlon()
      Var test2=1
      Var i=1,mxx=mx,myy=my
      dlatmax*=min(1,kz)
   	If (mz-mzsol0)<700 Then
   	 If imxweb>3*2 Then imxweb=1	
   	 For i=4*2 To nxweb
   	 	mxweb(i)=999:myweb(i)=999:dmxweb(i)=0
   	 Next
   	EndIf
   	If Abs(asktownlat-latmx0)>dx*5 Then asktownlat=-99
   	If Abs(asktownlon-lngmx0)>dx*5*klon Then asktownlat=-99 
   	If inear0road>7 Or (plane>0 And car=0) Then asktownlat=-99
   	If asktownlat<-90 Then'And asktownlat2<-90 Then 
   	 Var itest=0
   	 For i=1 To nxweb
   	    ''If Abs(lattown1-lattown)>dlatmax Or Abs(lngtown1-lngtown)>dlatmax*klon Then
   	    'If Abs(lattown1-myweb(i))<dlatmax*kdx*0.6 And Abs(lngtown1-mxweb(i))<dlatmax*klon*kdx*0.6 Then
   	    If Abs(lattown1-myweb(i))<dmxweb(i)*0.6 And Abs(lngtown1-mxweb(i))<dmxweb(i)*klon*0.6 Then
   	    	itest+=1
   	    	If itest>1 Then
   	    		test2=0:Exit For
   	    	EndIf
   	    EndIf
   	 Next
   	 'If test2=1 Then
   	 '	latlngtomxy(lattown1,lngtown1,mxx,myy)
   	 '	If testtownij(mxx,myy)=1 Then test2=0
   	 'EndIf
   	 If test2=0 Then
   	   test2=1
   		If plane=0 Or car>0 Then
   			lattown1+=sin1*dx*1.45:lngtown1+=cos1*dx*klon*1.45'*1.45'*1.95
   		Else
   			lattown1+=sin1*dx:lngtown1+=cos1*dx*klon'*1.45'*1.95
   		EndIf
   		Var itest=0
   		For i=1 To nxweb  			
   	     'If Abs(lattown1-myweb(i))<dlatmax*kdx And Abs(lngtown1-mxweb(i))<dlatmax*klon*kdx Then
   	     If Abs(lattown1-myweb(i))<dmxweb(i)*0.6 And Abs(lngtown1-mxweb(i))<dmxweb(i)*klon*0.6 Then
   	    	 itest+=1
   	    	 If itest>1 Then
   	    	 	test2=0:Exit For
   	    	 EndIf
   	     EndIf
   		Next
   	   'If test2=1 Then
   		'   latlngtomxy(lattown1,lngtown1,mxx,myy)
   		'   If testtownij(mxx,myy)=1 Then test2=0
   	   'EndIf
   	 EndIf
   	EndIf  
   	If test2=1 Or asktownlat>-90 Then'Or asktownlat2>-90 Then
   		t11=0
   		tloadwebtext2=2
  	   	If asktownlat>-90 Then
  	   		lattown1=asktownlat
  	   		lngtown1=asktownlon
  	   		asktownlat2=asktownlat
  	   		asktownlon2=asktownlon
  	   		asktownlat=-99
  	   	'ElseIf asktownlat2>-90 Then 	
  	   	'	lattown=asktownlat2
  	   	'	lngtown=asktownlon2
  	   	'	asktownlat2=-99
  	   	EndIf
   		If asktownlat<-90 Then'And asktownlat2<-90 Then 
   		 If (mz-mzsol0)>700 Then              
   			imxweb+=1:If imxweb>nxweb Then imxweb=1
      		mxweb(imxweb)=lngtown1
      		myweb(imxweb)=lattown1
      		dmxweb(imxweb)=dlatmax*kdx*0.5
   		 Else 
   			imxweb+=1:If imxweb>3*2 Then imxweb=1
      		mxweb(imxweb)=lngtown1
      		myweb(imxweb)=lattown1
      		dmxweb(imxweb)=dlatmax*kdx*0.5
   		 EndIf 
   		EndIf
  	   	lattown=lattown1:lngtown=lngtown1
  	   	lat0=lat:lng0=lng
  	   	mxytolatlng(mx+dmx0,my+dmy0)
  	   	latmx0=lat:lngmx0=lng
  	   	lat=lat0:lng=lng0
  	   	mxytolatlng(mx+dmx0+10000,my+dmy0+10000)
  	   	kmxlat=10000/max(0.0000001,Abs(lat-latmx0))
  	   	'lat=lat0:lng=lng0
  	   	'mxytolatlng(mx+dmx0-10000,my+dmy0-10000)
  	   	'Var kmxlat2=10000/max(0.0000001,Abs(lat-latmx0))
  	   	'auxvar=kmxlat2-kmxlat:auxvar2=kmxlat:auxtest=0.5
  	   	lat=lat0:lng=lng0
         setmyroadlatlon()
  	   	If tquitweb=0 Then 
  	   	  o1town=o1
   		  tinittown=1:threaddetach(ThreadCreate(@inittown22))
    		  auxvar3+=1
    		EndIf   
   	Else
   		tloadwebtext2=0:tinittown=0
   	EndIf
     EndIf 'mapdisplay	
   ElseIf quit=1 And tframe>tquit-5 Then
        tloadwebtext2=99
        tinittown=99
   Else
   	If (mz-mzsol0)<700 Then
   	 If imxweb>3*2 Then imxweb=1	
   	 For i=4*2 To nxweb
   	 	mxweb(i)=999:myweb(i)=999:dmxweb(i)=0
   	 Next
   	EndIf  
     /'If tcancel=1 And Abs(sin3)<0.5 And tquitweb=0 Then
      Var kdx=1
      If (mz-mzsol0)<500 Then kdx=0.7
      Var dlatmax=1*360/40000
      Var dx=kdx*1.3*360/40000
      Var kz=0.97+(mz-mzsol0)/2000'1300'3900
      If (mz-mzsol0)<500 Then kz+=v*70/1300
   	Var lat0=lat,lng0=lng
   	mxytolatlng(mx+dmx0,my+dmy0)
   	Var latmx=lat,lngmx=lng
      lattown1=lat+dx*kz*sin1-(lattown-lat):lngtown1=lng+dx*kz*cos1*klon-(lngtown-lng)
      lat=lat0:lng=lng0
      Var test2=1
      Var i=1
      Var dist=(dlatmax*kdx+dx*1.45)*1.75'1.5
   	For i=1 To nxweb
   	    If Abs(lattown1-myweb(i))<dist And _  
   	       Abs(lngtown1-mxweb(i))<dist*klon Then
   	    	test2=0:Exit For
   	    EndIf
   	Next
   	If test2=1 And tcancel=1 Then
   		tquitweb=1
   		t11=1.4
   		mxweb(imxweb)=-179
   		myweb(imxweb)=-89
   		imxweb-=1:If imxweb<1 Then imxweb=nxweb
   		Var do1=o1town-o1
   		While do1>180:do1-=360:Wend
   		While do1<-180:do1+=360:Wend
   		If Abs(do1)<30 Then 
   			setioverpass()
         EndIf    			
   	ElseIf Abs(mx+dmx0+cos1*(mz-mzsol0)-xweb)>dxweb*0.75 Or Abs(my+dmy0+sin1*(mz-mzsol0)-yweb)>dyweb*0.75 Then
   		If tcancel=1 Then
   			tquitweb=1
   			t11=0
   		   mxweb(imxweb)=-179
   		   myweb(imxweb)=-89
   		   imxweb-=1:If imxweb<1 Then imxweb=nxweb
   		   'guinotice("ok2")
   		EndIf
   	EndIf 	
     EndIf '/ 	
   EndIf
   'auxvar5=tinittown+0.1+1000*tloadwebtext2
   'auxvar2=imxweb'Int(Timer-tloadwebtext)
   'Var mxxx=mx,myyy=my
   'latlngtomxy(lattown,lngtown,mxxx,myyy)
   'auxvar6=testtownij(mx+dmx0+cos1*4000,my+dmy0+sin1*4000)+0.1
   'auxvar6=itownp+1000*tquitweb+0.1
   'auxvar6=Abs(mx+dmx0+cos1*(mz-mzsol0)-xweb)/dxweb
   'auxvar6=nbroad+0.1'way20
   'auxtest=1
	'pointx=751:pointy=751
	'MercatorPointtoLatLng(pointx,pointy)
	'auxvar=lng:auxvar2=lat
  EndIf'tquit	
EndIf 

           	time3=time2
           	time2=Timer
           	dtime2=1.0/max(10.0,min(200.0,maxfps))-0.0015
           	'If time2<(time3+25) Then Sleep (time3+30-time2)'20'30
           	If time2<(time3+dtime2) Then
           		If time2<time3 Then time2=time3 'if midnight
           		Sleep Int((time3+dtime2+0.001-time2)*1000)'20'30
           	   time2=time3+dtime2+0.001
           	EndIf
           	tfps=0.85*tfps+0.15*min(1.0,(time2-time3))
           	fps=1.0/max(0.001,tfps)
           	kfps=min(10.0,30/fps)
           	'kfps=min(10.0,max(0.1,30*(time2-time3)))
           	kfps2=min(2.0,25/fps)
           	kfps4=min(1.0,kfps/2.5) 
           	If fps<10 Then
           		fpsmoy+=(fps-fpsmoy)*0.14'0.25	
           	ElseIf fpsmoy<20 Then
           		fpsmoy+=(fps-fpsmoy)*0.07'0.13
           	Else
           		fpsmoy+=(fps-fpsmoy)*0.04'0.13
           	EndIf
        Wend

        scalex=scalex0
        
If restart=2 Then
	If worldtext<>0 Then guideletetexture(worldtext):worldtext=0
	If planetsattext<>0 Then guideletetexture(planetsattext):planetsattext=0
	restart=0:quit=0:GoTo debut2
EndIf
        
        guicloseOpenGL()
        deleteMD2model(md2horse)
        For i=1 To md2nnode
        	 If md2_nodes(i)<>0 Then
        	 	DeAllocate(md2_nodes(i))
        	 	md2_nodes(i)=NULL 
        	 EndIf
        Next

quit=1
ImageDestroy(worldbmp)
worldbmp=0
ImageDestroy(townbmp)
townbmp=0
If restart=1 Then restart=0:quit=0:guireset:Sleep 1000:GoTo debut
closesounds
closesounds2 
myTTSclose()
If tradio<>3 and tradio<>1 Then tradio=0
'While tradiomidi=1
'	Sleep 100
'Wend
'Sleep 200
'guinotice "bye"

setnearaeroway()
If startoption=1 And guierror=0 Then save("save/startup.save0")
If guierror=1 Then guinotice "bye !"
file=freefile
Open ficini For Output As #file
Print #file,icar
Print #file,imap
Print #file,isol
Print #file,iciel
Print #file,to1
Print #file,to2
Print #file,igrass
Print #file,viseur
Print #file,narbre2
Print #file,distscale
Print #file,fullscreen
Print #file,maxfps
Print #file,ismooth
Print #file,kwave
Print #file,nboat2
Print #file,startoption
Print #file,volant
Print #file,mx
Print #file,my
Print #file,mz
Print #file,o1
Print #file,o2
Print #file,o3
For i=1 To nship
	Print #file,airshipx(i)
	Print #file,airshipy(i)
	Print #file,airshipz(i)
	Print #file,airshipo1(i)
	Print #file,airshipo2(i)
	Print #file,airshipo3(i)
Next i
Print #file,"finlist"
Print #file,order
Print #file,ncloud2
Print #file,ifog
Print #file,nship2
Print #file,level
Print #file,carb
Print #file,imapsol
Print #file,compas
Print #file,scalez
For i=1 To 40
	Print #file,mapsol(i)
Next
Print #file,"finlist"
Print #file,istars
Print #file,addonname
Print #file,kscalex00
Print #file,tseashore
Print #file,topentown
Print #file,itown
Print #file,k88
For i=1 To 18
	Print #file,nearaerowayname(i)
	Print #file,nearaerowaylat(i)
	Print #file,nearaerowaylon(i)
Next
Print #file,ioverpass
Print #file,icombomap
Print #file,tautopilot
Print #file,vautopilot
Print #file,ncar2
Print #file,tretroviseur
Print #file,nroc2
Print #file,myicar
Print #file,myiplane
Print #file,to1car
Print #file,to2car
Print #file,to1plane
Print #file,to2plane
Print #file,tsoundarcade
Print #file,tshadow
Print #file,minfps
Print #file,tfoothorse
Print #file,retroto1
Print #file,retroto2
Print #file,typeautopilot
Print #file,tgoogle
Print #file,tbing
Print #file,tgps
Print #file,tlayer
Print #file,reverselocation
Print #file,dyh0
Print #file,tradar2
Print #file,tradio
Print #file,typeautopilot0
Close #file
''If townchanged=1 Or Rnd<0.2 Then savetownvie()
If (planet=0 And orbit=1) And topentown=1 And tinittown0<=0 Then
  For i=1 To 30
  	tquitweb=1
   If tquitweb=1 Or quit=1 Then
     	If tinittown=22 Or tinittown=23 Then
  	   	tinittown=0
     	EndIf
   EndIf
	Var dt=Timer+16
	While Timer<dt And ((tloadwebtext2<>0 And tloadwebtext2<>99)Or(tinittown<>0 And tinittown<>99))
		Sleep 100
		tinittown=99:tloadwebtext2=99:tquitweb=1
	Wend
	If ((tloadwebtext2<>0 And tloadwebtext2<>99)Or(tinittown<>0 And tinittown<>99)) Then
		guiconfirm("i am busy, wait for saving towns buildings ?","confirm",resp)
		If resp="yes" Then
      	Sleep 6000
      	guinotice("thanks for waiting")
      	Exit For
		Else 
			Exit For 
		EndIf
	Else 	
	   Exit For 
	EndIf
  Next i 
  savetownxy3()
EndIf

setficok("ok")

'substat()
Sleep 1000

guiclose
guiquit 
End 


Sub drawplanet(x As Single,y As Single,z As Single,r As Single,_ 
	            do1 As Single=0,opt As Integer=0)
Dim As Single dx,dy,dz,dist,dist1,scale
If r<1 Then Exit Sub 
dx=x-mx-smx0:dy=y-my-smy0:dz=z-mz
dist=Sqr(dx*dx+dy*dy+dz*dz)
If dist<(r*1.8) And opt=0 Then deepspace=0
If dist<(r+1000) Then 
	scale=(r+1100)/(1+dist)
	mx=x-scale*dx-smx0
	my=y-scale*dy-smy0
	mz=z-scale*dz
	mz1=mz
EndIf
If dist<1000000 Then
	gltranslatef(x,y,z)
	If opt=0 Then 
	   glrotatef(do1,0,0,1)
		gltexsphere(r,40,40)
	Else
		glrotatef(diro1(dx,dy),0,0,1)
		gltexcarre3(r,r*0.9)
	EndIf
Else
	dist1=1000000+200000*(dist-1000000)/dist
	scale=dist1/dist
	gltranslatef(mx+smx0+dx*scale,my+smy0+dy*scale,mz+dz*scale)
	If opt=0 Then
	   glrotatef(do1,0,0,1)
		gltexsphere(r*scale,40,40)
	Else
		glrotatef(diro1(dx,dy),0,0,1)
		gltexcarre3(r*scale,r*scale*0.9)	
   EndIf 
EndIf
End Sub
Dim Shared As Single heureorbit
Sub display2()
Dim As Single x,y,z,aux
Dim As Integer i,j,k
    trepair=0
    deepspace=1
    'setrangeGL(0)
    If pause=0 And mapdisplay=0 Then moveavion
    'avionx=0:aviony=0:avionz=10:aviono1=30:aviono2=-20:aviono3=40

o222=o2
cos222=Cos(o222*degtorad):sin222=Sin(o222*degtorad)

    glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT)
    glLoadIdentity ()
    
    If tourelle=0 Or plane=0 Then
    	If plane>0 Then
    	  If volant<>6 Then
    		If car>=1 Then
    			glulookat(mx,my,mz+yh, mx+1000*cos1*cos222,my+1000*sin1*cos222,_   
    			          mz+1000*sin222+yh, -sin3*sin1*0.85,sin3*cos1*0.85,cos3)
    		Else 
    	  	   glulookat(mx,my,mz+yh, mx+1000*dmx,my+1000*dmy,mz+1000*dmz+yh, -sin3*sin1*0.85,sin3*cos1*0.85,cos3)
    		EndIf
    	  Else 
    	  	glulookat(mx-200*dmx,my-200*dmy,mz+yh+20-165*dmz, mx,my,mz+yh, -sin3*sin1*0.85,sin3*cos1*0.85,cos3)
    	  	'x=mx-200*dmx:y=my-200*dmy:z=mz+yh+20-165*dmz 'cf bug freebasic
    	  	'glulookat(x,y,z, mx,my,mz+yh,  -sin3*sin1*0.85,sin3*cos1*0.85,cos3)
    	  EndIf
    	Else 
    		glulookat(mx,my,mz+yh, mx+1000*dmx,my+1000*dmy,mz+1000*dmz+yh, 0,0,1)
    	EndIf
    Else 
    	to2=max2(-89,min2(89,to2))
    	While to1<-180:to1+=360:Wend
    	While to1>180:to1-=360:wend
    	tcos1=Cos((to1+o1)*degtorad):tsin1=Sin((to1+o1)*degtorad)
    	aux=to2+o2*Cos(to1*degtorad)
    	tcos2=Cos(aux*degtorad):tsin2=Sin(aux*degtorad)
    	tcos3=1.0:tsin3=0.0
      tdx=tcos1*tcos2:tdy=tsin1*tcos2:tdz=tsin2   	
      glulookat(mx,my,mz+yh,mx+tdx*1000,my+tdy*1000,mz+tdz*1000+yh, -tsin3*tsin1,tsin3*tcos1,tcos3)
    EndIf
    If ktir=1 Then ktir=0:tir() Else ttir=0
    gldisable(GL_FOG)
    testtirs()
    glenable gl_texture_2d

    setrangeGL(10000)
    
    time1=Timer*1000
    time0=time1
    
    glEnable GL_BLEND
    glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_color
    drawstarspace
    drawsun
    glpushmatrix
    gltranslatef(-smx0,-smy0,0)
    'glrotatef(-heureorbit*360/24,0,0,1)
    glpushmatrix
    'glrotatef(-heureorbit*360/24,0,0,1)
    'glrotatef(-heure*360/24,0,0,1)
    'drawsunset
    'Var distmxy=Sqr((smx0+mx)*(smx0+mx)+(smy0+my)*(smy0+my))
    ''gltranslatef(1200000+0.9*distmxy,0,0)
    'gltranslatef(1000000+0.9*(smx0+mx),0.9*(smy0+my),0)
    glbindtexture(gl_texture_2d,sunsettext)
    aux=210/256'184/256'170/256
    glcolor3f(aux,aux,aux*0.6)
    ''gltexcarre3(20000*50,18000*50)
    'gltexcarre3(20000*40,18000*40)'*50
    drawplanet(50000000,0,0,40000000,0,1)
    glpopmatrix
    gldisable gl_blend 
    'drawplanetsat
    gldisable(gl_lighting) 
    glenable gl_texture_2d
    glcolor3f(1,1,1)
    If planetsat=1 Then 
     glbindtexture(gl_texture_2d,planetsattext)
     glpushmatrix
     'gltranslatef(0.9*(smx0+mx),0.9*(smy0+my),0)
     'glrotatef((heure-heure2)*360/24,0,0,1)
     ''gltranslatef(1000000+0.8*distmxy,0,0)
     'gltranslatef(1000000,0,0)
     'glrotatef(-90-dayjj*360/28,0,0,1)
     ''gltexsphere(90000,40,40)'60000
     'gltexsphere(90000*rplanetsat,40,40)'60000
     Var do1=degtorad*(heure-heure2)*360/24
     Var do11=-90-dayjj*360/28
     Var r=3100000
     drawplanet(r*Cos(do1),r*Sin(do1),0,300000*rplanetsat,do11)
     glpopmatrix 
    EndIf 
    'glrotatef(-heureorbit*360/24,0,0,1)
    'drawsphere
    glbindtexture(gl_texture_2d,worldtext)
    glpushmatrix
    'glrotatef((heure)*360/24,0,0,1)
    'gltranslatef(0,0,0)
    'glrotatef(-90,0,0,1)
    'gltexsphere(94000,40,40)
    Var do1=-90+(heure)*360/24
    drawplanet(0,0,0,94000,do1)
    glpopmatrix
    'gltranslatef(smx0,smy0,0)
    glpopmatrix
    
    drawdusts(kvaux)
    drawairship()
    setrangeGL(max(abs(stationx-mx),abs(stationy-my))+abs(stationz-mz)) 
    tstation=1
    drawstation()
    
    If plane=0 Then
       'tfoothorse=1
       If tfoothorse=1 Then drawhorse()
    EndIf

    setrangeGL(0)

    gldisable(gl_lighting)
    glenable(gl_texture_2d)
    drawbullets()
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
    If plane=1 And tourelle=0 Then
      If volant=1 Then
      	drawcockpitcar'drawcar
      EndIf 	
      If 1 Then 
      	If tshowradio=0 Then tshowradio=1:showgui("win.radio")  	
      ElseIf tshowradio=1 Then
    	   tshowradio=0:hidegui("win.radio")      	
      EndIf
      If volant=2 And car=0 Then drawcockpit2
      If volant=3 Then drawcockpit  	
      If volant=4 Then drawcockpit2  	
      If volant=6 Then drawcockpit3  	
    	If volant>=1+1 And volant<=2 And car>0 Then drawvolant
      gldisable gl_blend
      gldisable gl_alpha_test
    ElseIf tshowradio=1 Then
    	tshowradio=0
    	hidegui("win.radio")
    EndIf
    
    
    gldisable(gl_lighting)
    If imap>=4 Then
      gldisable GL_DEPTH_TEST
      'If mz<(waterz+altwater) Then drawwind
      If mz<(mzsol0+10000) And planet=0 Then
      	tdrawwind=1:drawwind
      Else
      	tdrawwind=0
      EndIf
    	drawmap
    EndIf
    
    If vie>0.1 Then vie=min(vie0,vie+0.002*kfps)
    drawvie
    If vie<0.001 Then
    	If mz>(mzsol0+1) And tmort>Timer and (planet=0 or orbit=1) Then
    	   o3+=kfps*1.7*Sgn((Int(tmort)Mod 2)-0.5)
    	Else
    		drawmort
    		tmort=Timer+20
    	EndIf
    EndIf

        glLoadIdentity ()
	     gldisable GL_DEPTH_TEST
        gldisable(gl_texture_2d)
        'drawviseur
        glcolor3f(0.85,0,0)
        'glcolor3f(0.4,1,0.4)
        gldrawtext("fps "+Str(Int(fpsmoy)),15,12,1.2)
        'gldrawtext("nvertices "+Str(Int(md2_nodes(1)->md2model->header.num_vertices)),15,35,1.2)
        If (icar=2 Or icar=5 Or icar=16) And tourelle=0 Then 
        	glcolor3f(0.3,0.4,1)
        Else 	
        	glcolor3f(0.4,1,0.4)
        EndIf
        If tourelle=1 And plane>=1 Then gldrawtext("tourelle",xmax-159,17,1.2)
       If auxtest>0.1 Then  
        If Abs(auxvar)>0.00001 Then gldrawtext("aux= "+Str(auxvar),15,ymax-79,1.2)
        If Abs(auxvar2)>0.00001 Then gldrawtext("aux2= "+Str(auxvar2),15,ymax-99,1.2)
        If Abs(auxvar3)>0.00001 Then gldrawtext("aux3= "+Str(auxvar3),15,ymax-119,1.2)
        If Abs(auxvar4)>0.00001 Then gldrawtext("aux4= "+Str(auxvar4),15,ymax-139,1.2)
        If Abs(auxvar5)>0.00001 Then gldrawtext("aux5= "+Str(auxvar5),15,ymax-159,1.2)
        If Abs(auxvar6)>0.00001 Then gldrawtext("aux6= "+Str(auxvar6),15,ymax-179,1.2)
        If auxtext<>"" Then gldrawtext(auxtext,15,ymax-199,1.2)
       EndIf  
        If car>=1 Then vkm=v*4.5 Else vkm=v*17
        gldrawtext("prop= "+Str(Int(prop))+"  v= "+Str(Int(vkm))+"."+Str(Int(vkm*10+1000)Mod 10),15,ymax-35,1.2)
        gldrawtext("x= "+Str(Int(mx+smx0))+"  y= "+Str(Int(my+smy0))+"  z= "+Str(Int(mz)),15,ymax-10,1.2)
        If carb<carb0*0.1 Then glcolor3f(1,0,0) Else glcolor3f(0,1,1)
        gldrawtext("carb="+Str(Int(carb)),10,270,1)
        'drawboussole
        drawradar
        cursorx0=0:cursory0=0:cursorz0=0
        /'If time2<torder Then 
        	  glcolor3f(0,0,1)
        	  If order=1 Then gldrawtext("formation",xmax-70,17,1)
        	  If order=2 Then gldrawtext("attack",xmax-70,17,1)
        	  If order=3 Then gldrawtext("cover",xmax-70,17,1)
        	  If order=4 Then gldrawtext("break",xmax-70,17,1)
        EndIf '/
        glenable(gl_texture_2d)
        glEnable GL_DEPTH_TEST
        
        
End Sub
Dim Shared as Single tfps2=0.01
Sub setfps()
           	time3=time2
           	time2=Timer
           	dtime2=1.0/max(10.0,min(200.0,maxfps))-0.0015
           	'If time2<(time3+25) Then Sleep (time3+30-time2)'20'30
           	If time2<(time3+dtime2) Then
           		If time2<time3 Then time2=time3 'if midnight
           		Sleep Int((time3+dtime2+0.001-time2)*1000)'20'30
           	   time2=time3+dtime2+0.001
           	EndIf
           	If (time2-time3)<0.2 Then
           		tfps2=0.85*tfps2+0.15*min(1.0,(time2-time3))
           	Else 	
           		tfps2=0.2*tfps2+0.8*min(2.0,(time2-time3))
           	EndIf
           	fps=1.0/max(0.001,tfps2)
           	kfps=min(10.0,30/fps)
           	'kfps2=min(2.0,25/fps)
           	kfps2=max(0.1,min(2.0,25*(time2-time3)))
           	kfps4=min(1.0,kfps/2.5) 
           	If fps<3 Then
           		fpsmoy+=(fps-fpsmoy)*0.8
           	ElseIf fps<5 Then
           		fpsmoy+=(fps-fpsmoy)*0.4
           	ElseIf fps<10 Then
           		fpsmoy+=(fps-fpsmoy)*0.2
           	Else 
           		fpsmoy+=(fps-fpsmoy)*0.1		
           	EndIf
End Sub
Sub leaveorbit()
Dim As Double t
Dim As Single o30,o20,o10
resp="you are leaving "+addon(imap)+" orbital area , entering interplanetary space"
myTTSspeak(resp,1+SVSFPurgeBeforeSpeak)
t=Timer
o30=(90-90*(my+dmy0)/planetdymax)*Sgn(cos1)
o20=0
o10=90-Sgn(cos1)*90
While o10<(o1-180):o10+=360:Wend
While o10>(o1+180):o10-=360:Wend 
While o30<(o3-180):o30+=360:Wend
While o30>(o3+180):o30-=360:Wend 
While Timer<(t+30) _ 'And (Abs(o3-o30)>3 Or Abs(o2-o20)>3 Or Abs(o1-o10)>3) _  
	And guitestkey(vk_escape)=0 And quit=0 And guitestkey(vk_space)=0 
	guiscan
	If Not(Abs(o3-o30)>3 Or Abs(o2-o20)>3 Or Abs(o1-o10)>3)Then
		t=min(t,Timer-30+1)
	EndIf
	o3+=Sgn(Int((o30-o3)/3))*min(kfps,4.0)*0.7
	o2+=Sgn(Int((o20-o2)/3))*min(kfps,4.0)*0.7
	o1+=Sgn(Int((o10-o1)/3))*min(kfps,4.0)*0.7
   cos1=Cos(o1*degtorad):sin1=Sin(o1*degtorad)
   cos2=Cos(o2*degtorad):sin2=Sin(o2*degtorad)
   cos3=Cos(o3*degtorad):sin3=Sin(o3*degtorad)
   dmx=cos1*cos2:dmy=sin1*cos2:dmz=sin2
   vmx1=v*cos1:vmy1=v*sin1
   vmx2=vmx1*cos2:vmy2=vmy1*cos2:vmz2=v*sin2
   kvaux=1.0'5.9
   mx+=vmx2*kfps*kvaux:my+=vmy2*kfps*kvaux:mz1+=vmz2*kfps*kvaux
   testmz()
	pause=1:display():pause=0
	guirefreshopenGL
	setfps()
Wend
End Sub
Sub enterorbit()
Dim As Double t
Dim As Single o30,o20,o10
resp="you are entering "+addon(imap)+" orbital area"
myTTSspeak(resp,1+SVSFPurgeBeforeSpeak)
t=Timer
o20=0
var mx1=smx0+mx,my1=smy0+my
o10=diro1(-mx1,-my1)
Var aux=Sgn(Sin((o1-o10)*degtorad))
o10=o10+(90-40)*aux
o30=90-diro1(Sqr(mx1*mx1+my1*my1),mz)
o30=o30*aux
While o10<(o1-180):o10+=360:Wend
While o10>(o1+180):o10-=360:Wend 
While Timer<(t+30) _ 'And (Abs(o3-o30)>3 Or Abs(o2-o20)>3 Or Abs(o1-o10)>3) _  
	And guitestkey(vk_escape)=0 And quit=0 And guitestkey(vk_space)=0 
	guiscan
	If Not(Abs(o3-o30)>3 Or Abs(o2-o20)>3 Or Abs(o1-o10)>3)Then
		t=min(t,Timer-30+1)
	EndIf
	o3+=Sgn(Int((o30-o3)/3))*min(kfps,4.0)*0.7
	o2+=Sgn(Int((o20-o2)/3))*min(kfps,4.0)*0.7
	o1+=Sgn(Int((o10-o1)/3))*min(kfps,4.0)*0.7
   cos1=Cos(o1*degtorad):sin1=Sin(o1*degtorad)
   cos2=Cos(o2*degtorad):sin2=Sin(o2*degtorad)
   cos3=Cos(o3*degtorad):sin3=Sin(o3*degtorad)
   dmx=cos1*cos2:dmy=sin1*cos2:dmz=sin2
   vmx1=v*cos1:vmy1=v*sin1
   vmx2=vmx1*cos2:vmy2=vmy1*cos2:vmz2=v*sin2
   kvaux=0.05'0.1'5.9
   mx+=vmx2*kfps*kvaux:my+=vmy2*kfps*kvaux:mz1+=vmz2*kfps*kvaux
   mz=mz1
	display2()
	guirefreshopenGL
	setfps()
Wend
End Sub
Sub suborbit()
Dim As Single do1,do2,r,mx0,my0,mz0,alt,co1,si1,co2,si2,mx00,my00,mz00,aux
Dim As Integer i
volant0=-999
tsun=0:drawsun:heureorbit=heure:tsun=0
tsphere=1
mx00=mx:my00=my:mz00=mz
aux=0.18*830000/(mz+800000)
aux=min(aux,0.18*830000/(110000+800000))
glClearColor 0.5*aux, 0.5*aux, 1.0*aux, 0.0
If initspace=1 Then GoTo spacesuite
smx0=0:smy0=0
do1=180*(mx+dmx0)/planetdxmax+heure*360/24
do2=90*(my+dmy0)/planetdymax
co1=Cos(do1*degtorad):si1=Sin(do1*degtorad)
co2=Cos(do2*degtorad):si2=Sin(do2*degtorad)
r=110000'12000
mx=-r*co1*co2:my=-r*si1*co2:mz=r*si2:mz1=mz
o2=0:o3=0:o1=do1-(90-40)*Sgn(cos1)
For i=1 To nship
   airshipx(i)+=mx-mx00
   airshipy(i)+=my-my00
   airshipz(i)+=mz-mz00
   airshipz(i)=mz+(Int(airshipz(i)-mz) Mod 20000)
Next i
spacesuite:
alt=999999:initspace=0:orbit=0
While alt>100000 And orbit=0 _ '11000  
	And guitestkey(vk_escape)=0 And quit=0 'And guitestkey(vk_space)=0 
	guiscan
   itime+=1:If itime>10000 Then itime=0
   If (itime Mod 10)=0 Then testspeak()
	alt=Sqr((smx0+mx)*(smx0+mx)+(smy0+my)*(smy0+my)+mz*mz)
	kvaux=0.5'0.05
	subjoystick()
   testo123 
	display2()
	guirefreshopenGL
	setfps()
         		
        	   If guitestkey(vk_f9)<>0 Then subscreen
        	   If guitestkey(vk_f1)<>0 Then subhelp
        	   If guitestkey(vk_p)<>0 Then
        	   	stopvol()
        	   	notice("pause","pause"):time2=Timer:time3=time2-0.01
        	      setvol()
        	   EndIf
        	   'If guitestkey(vk_f12)<>0 Then submapworld()
        	   If guitestkey(vk_f4)<>0 Then substars()
        	   'If guitestkey(vk_m)<>0 And imap>=4 Then
        	   '	mapdisplay=(mapdisplay+1)Mod 3:Sleep 200:guiscan 
        	   'EndIf
        	   If guitestkey(vk_t)<>0 And guitestkey(vk_control)<>0 Then subnarbre
        	   If guitestkey(vk_d)<>0 And guitestkey(vk_control)<>0 Then subdistscale
        	   If guitestkey(vk_r)<>0 And guitestkey(vk_control)<>0 Then subreset
        	   If guitestkey(vk_f)<>0 And guitestkey(vk_control)<>0 Then submaxfps
        	   If guitestkey(vk_s)<>0 And guitestkey(vk_control)<>0 Then subshadow'subsmooth
        	   If guitestkey(vk_w)<>0 And guitestkey(vk_control)<>0 Then subwave
        	   If guitestkey(vk_b)<>0 And guitestkey(vk_control)<>0 Then subnroc
        	   If guitestkey(vk_o)<>0 And guitestkey(vk_control)<>0 Then substart
        	   If guitestkey(vk_c)<>0 And guitestkey(vk_control)<>0 Then subncloud
        	   If guitestkey(vk_n)<>0 And guitestkey(vk_control)<>0 Then subncar
       	   If guitestkey(vk_l)<>0 And guitestkey(vk_control)<>0 Then sublevel
        	   If guitestkey(vk_x)<>0 And guitestkey(vk_control)<>0 Then subscalex
        	   'If guitestkey(vk_x)<>0 And guitestkey(vk_shift)<>0 Then subscaletown
        	   'If guitestkey(vk_w)<>0 And guitestkey(vk_control)=0  Then subwar
        	   If guitestkey(vk_i)<>0 And guitestkey(vk_control)<>0 Then subinternet'subopentown
         
         	mx0=mx:my0=my:mz0=mz
         	distmax=scalex*256
         	If Sqr(mx*mx+my*my)>distmax Then
         	 mx=-mx*0.98
         	 my=-my*0.98
			    mx=mx0+Int(mx-mx0):my=my0+Int(my-my0)
         	 smx0-=mx-mx0:smy0-=my-my0
             For i=1 To nship
                airshipx(i)+=mx-mx0
                airshipy(i)+=my-my0
                airshipz(i)+=mz-mz0
             Next i
         	EndIf 
Wend
mx0=mx:my0=my:mz0=mz
initspace=0
If alt>100001 And orbit=0 Then
	initspace=1
	/'mx=mx00:my=my00:mz=mz00:mz1=mz 
   For i=1 To nship
    airshipx(i)+=mx-mx0
    airshipy(i)+=my-my0
    airshipz(i)+=mz-mz0
   Next i '/
ElseIf quit=0 And orbit=0 Then
 var mx1=smx0+mx,my1=smy0+my
 do1=diro1(-mx1,-my1)
 do2=diro1(Sqr(mx1*mx1+my1*my1),mz)
 dmx00=dmx0:dmy00=dmy0
 'Var do11=do1+(heureorbit-heure)*360/24
 Var do11=do1-(heure)*360/24
 While do11>180:do11-=360:Wend
 While do11<-180:do11+=360:Wend
 dmx0=planetdxmax*do11/180
 dmy0=planetdymax*do2/90
 Var o11=Sgn(Sin((o1-do1)*degtorad))*90+90
 Var o21=-40
 Var o31=0
 enterorbit()
 mx=0:my=0
 mz=100000:mz1=mz
 o1=o11:o2=o21:o3=o31
 cos1=Cos(o1*degtorad):sin1=Sin(o1*degtorad)
 cos2=Cos(o2*degtorad):sin2=Sin(o2*degtorad)
 cos3=Cos(o3*degtorad):sin3=Sin(o3*degtorad)
 dmx=cos1*cos2:dmy=sin1*cos2:dmz=sin2
 initterrain3
 For i=1 To nship
 	airshipz(i)=mz+(Int(airshipz(i)-mz) Mod 20000)
 Next
Else  
 For i=1 To nship
 	airshipz(i)=mz+(Int(airshipz(i)-mz) Mod 20000)
 Next
EndIf
tsun=0
volant0=-999
End Sub
Sub testorbit()
If orbit=1 Then
	If mz>108000 Then
		leaveorbit():orbit=0
		suborbit()
	EndIf
Else
   If mz<105000 Then
   	orbit=1
   EndIf
EndIf    
End Sub
Sub setvideotexture(ByVal dtime As Double,ByRef itexture As Integer,ByRef tx As Single,ByRef ty As Single, _  
	                 ByRef dtx As Single,ByRef dty As Single,ByVal dx As Integer=0,ByVal dy As Integer=0)
	itexture=Int(dtime)Mod 12
	'glbindtexture gl_texture_2D,mygltext(itexture)
	Var dtime1=dtime-Int(dtime)
	Var ix=Int(dtime1*2)
	Var iy=Int((dtime1*2-ix)*4)
	var videodx=4*Int(512\4)
	Var videody=4*Int(256\4)		
	tx=(ix)/2+dx/videodx
	ty=(3-iy)/4+dy/videody
	dtx=1/2-dx*2/videodx
	dty=1/4-dy*2/videody         
End Sub
Dim Shared As Double time0video
Sub drawvideo(scale As Single=1)
Dim As Single dx,dy,rx:dx=xmax*0.80:dy=ymax*0.65'ymax-50
Dim As Integer i
If mapdisplay>0 Then Exit Sub'Or volant=2 Then Exit Sub 
 gldisable gl_depth_test
 glviewport(dx,ymax-dy-ymax*0.25,xmax*0.2,ymax*0.3)
	If time0video<1 Then time0video=Timer 
	Var dtime=(time2-time0video)*1.1
	Dim As integer itexture=0
	Dim As Single tx=0.0,ty=0.0,dtx=1.0,dty=1.0
	setvideotexture(dtime,itexture,tx,ty,dtx,dty)',dx,dy)
	glenable gl_texture_2D
	If ipersovideo=0 Then
		glbindtexture0(gl_texture_2D,mygltext(itexture))
	ElseIf ipersovideo=1 Then  
		glbindtexture0(gl_texture_2D,mygltext2(itexture))
		Var tx0=(tx+tx+dtx)*0.5
		Var dtx0=(tx+dtx-tx0)*0.75
		tx=tx0-dtx0:dtx=tx0+dtx0-tx		
	Else 
		glbindtexture0(gl_texture_2D,mygltext3(itexture))
	EndIf
	glpushmatrix
	glloadidentity
   glTranslatef (0,0,-50)
	dx=20.7
	Var sc=1.62*scale
	glscalef(sc,scale,sc)
	glbegin(gl_quads)
	glTexCoord2f(tx,ty)
	glvertex3f(-dx,-dx,0)
	gltexcoord2f(tx+dtx,ty)
	glvertex3f(dx,-dx,0)
	glTexCoord2f(tx+dtx,ty+dty)
	glvertex3f(dx,dx,0)
	gltexcoord2f(tx,ty+dty)
	glvertex3f(-dx,dx,0)
	glend()
	glpopmatrix
 glenable gl_depth_test
 glviewport(0,0,xmax,ymax)	
End Sub








