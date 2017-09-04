Dim Shared As md2_model Ptr md2model(20),lamam_md2model,lamam2_md2model
Dim Shared As md2_node Ptr md2node,md2nodes(20)
Dim Shared As uint md2texture(20),iavatar,tavatar,tavatar0,iavatar0
Dim Shared As Single md2o1(20),md2o2(20),md2o3(20),md2x(20),md2y(20),md2z(20)
Dim Shared As Single md2_o1,md2_o2,md2_o3
Sub initavatars()
Dim As Integer i,x,y,z
lamam_md2model=MD2loadmodel("avatars/lamam.md2")
lamam2_md2model=MD2loadmodel("avatars/lamam2.md2")
/'i=3
md2texture(i)=guiloadtexture("avatars/jean.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
'MD2setnodetexpos(md2nodes(i),-8,1.4182,1.2253,0.18999,-0.00999)
MD2setnodetexpos(md2nodes(i),2,0.8950005,0.8550003,-0.0600002,-0.005)
i=4
md2texture(i)=guiloadtexture("avatars/audrey.jpg")
md2model(i)=lamam_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
MD2setnodetexpos(md2nodes(i),-6,0.9855,1.15,0.051140,-0.05)
i=5
md2texture(i)=guiloadtexture("avatars/ingrid.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
MD2setnodetexpos(md2nodes(i),-4,1.065,0.985,0.13495,0.035)
'/
i=6
'md2texture(i)=guiloadtexture("avatars/elise.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
MD2setnodetexpos(md2nodes(i),2,0.69500,0.9850001,-0.2100002,-0.055)
i=7
'md2texture(i)=guiloadtexture("avatars/carole.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
MD2setnodetexpos(md2nodes(i),-4,0.7100,1.044,-0.1453000,-0.0135)
i=8
'md2texture(i)=guiloadtexture("avatars/sophie.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
MD2setnodetexpos(md2nodes(i),8,0.77660655,0.714999,-0.23000,0.029999)
/'i=9
md2texture(i)=guiloadtexture("avatars/grace.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
MD2setnodetexpos(md2nodes(i),3.25,1.14,1.039999,0.039999,0.06124995)
'/
i=10
'md2texture(i)=guiloadtexture("avatars/anne.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
Md2setnodetexpos(md2nodes(i),-1.25,0.561250,1.006249,-0.36897,0.034999)
/'i=11
md2texture(i)=guiloadtexture("avatars/nicole.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
Md2setnodetexpos(md2nodes(i),3.25,0.906250,1.377499,-0.0687503,0.1412499)
'/
i=12
'md2texture(i)=guiloadtexture("avatars/ann.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
Md2setnodetexpos(md2nodes(i),2.25,0.99250,0.862499,-0.1187504,-0.00625012)
i=13
'md2texture(i)=guiloadtexture("avatars/nathalie.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
Md2setnodetexpos(md2nodes(i),-6.75,0.92500,1.03125,0.012,-0.10375)
i=14
'md2texture(i)=guiloadtexture("objects/clementine.jpg")
md2model(i)=lamam2_md2model',0,0,25)
md2nodes(i)=MD2addnode(md2model(i))
MD2setnodetexture(md2nodes(i),md2texture(i))
'x=-65:y=0:z=-5
MD2setnodeposition(md2nodes(i),x,y,z)'getterrainheight(x,y))
MD2setanimationrange(md2nodes(i),6,12,1.2)'md2_all)'random)
Md2setnodetexpos(md2nodes(i),4.25,0.85000,1.34125,-0.1515005,0.15125)
iavatar=14
End Sub 
Dim Shared As String avatar,avatar0
Sub setavatar(ii As Integer)
Dim As Integer i=Int(Abs(ii*99.99))Mod 7
iavatar0=iavatar
iavatar=12:avatar="Ann"
If i=0 Then iavatar=12:avatar="Ann"
If i=1 Then iavatar=10:avatar="Anne"
If i=2 Then iavatar=8:avatar="Sophie"
If i=3 Then iavatar=7:avatar="Carole"
If i=4 Then iavatar=6:avatar="Elise"
If i=5 Then iavatar=13:avatar="Nathalie"
If i=6 Then iavatar=14:avatar="Clementine"
If avatar0<>avatar Then
	avatar0=avatar
	If md2texture(iavatar0)<>0 Then
		guideletetexture(md2texture(iavatar0))
		md2texture(iavatar0)=0
	EndIf
   md2texture(iavatar)=guiloadtexture("avatars/"+avatar+".jpg")	
   MD2setnodetexture(md2nodes(iavatar),md2texture(iavatar))
EndIf
End Sub
Declare Function myTTSstatus Cdecl Alias "myTTSgetstatus" () As ZString Ptr
Dim Shared As double timemd2,time00
Dim Shared As ZString*100 status,status0
Dim Shared As String myinputtext
Dim Shared As Integer avatarinput
Dim Shared As hwnd winavatarinputh
Dim Shared As Single scaleavatar=1
Sub drawavatar()
md2node=md2nodes(iavatar)
If Timer>(timemd2+0.1) Or Timer<(timemd2-99) Then
	 timemd2=Timer 
	 md2_o1+=(Rnd-0.5)*0.4
	 md2_o1=max(-14.0,min(14.0,md2_o1))	
	 md2_o2+=(Rnd-0.5)*0.4
	 md2_o2=max(-4.0,min(4.0,md2_o2))	
	 md2_o3+=(Rnd-0.5)*0.12
	 md2_o3=max(-1.0,min(1.0,md2_o3))	
    MD2setnoderotation(md2node,md2_o2-90,md2_o1-120,md2_o3)
    'MD2setnodescale(md2node,0.25*scaleavatar,0.25*scaleavatar,0.28*scaleavatar)
    MD2setnodescale(md2node,0.25,0.25,0.28)
EndIf 
            status=*(myTTSstatus())
            'printgui("win.msg",status)
            If status<>status0 Or (status<>"phoneme7" And status<>"phoneme0") Then 
             status0=status	
             If status="phoneme7" Then
             	MD2setanimationrange(md2node,6,12,1.2) 'silence
             Else
               If Timer>(time00+0.2) Or Timer<(time00-99) Then 
            	  time00=Timer
            	  MD2setanimationrange(md2node,2,6,13) 'syllabe
               EndIf 
             EndIf
            EndIf
            /'If status="error" Or myinputtext<>"" Or Timer>(time00+4) Then
            	'Exit While
            EndIf
            If status="done" Then
            	'exit while
            EndIf '/
glcolor3f(1,1,1)
Md2drawnode(md2node)	
End Sub


#Inclib "./aiml_chung_dll"
Declare Function aimladdaiml Cdecl Alias "AIMLaddaiml" () As Integer   
Declare Function aimlloadaiml Cdecl Alias "AIMLloadaiml" () As Integer  
Declare Function aimlloaddata Cdecl Alias "AIMLloaddata" (ByRef ficsave As String="data\AIMLdata.data") As Integer  
Declare Sub aimlsavedata Cdecl Alias "AIMLsavedata" (ByRef ficsave As String="data\AIMLdata.data")  
Declare Function aimlsendmyinput Cdecl Alias "aimlsendmyinput" _  
	      (ByRef myinputtext As string) As String  
Declare Function aimladdaimlfile Cdecl Alias "AIMLaddaimlfile" (ByRef fic As string) As Integer   
Declare Function aimlgetvar Cdecl Alias "AIMLgetvar" (ByRef varname As String)As String  
Declare Sub aimlsetvar Cdecl Alias "AIMLsetvar" (ByRef varname As String,ByRef varval As String) 
Declare Sub aimlsavevars Cdecl Alias "AIMLsavevars" (ByRef ficname As String="data\initvars.txt")  
Declare Sub aimlloadvars Cdecl Alias "AIMLloadvars" (ByRef ficname As String="data\initvars.txt")  
Declare Sub aimlresetvars Cdecl Alias "AIMLresetvars" () 
Declare function aimlgetsize Cdecl Alias "AIMLgetsize" () As Integer  
Declare Sub aimlsaveasAIML Cdecl Alias "AIMLsaveasaiml" (ByRef ficsave As String)
Declare Sub aimlsubsaveasAIML Cdecl Alias "AIMLsubsaveasaiml" ()
Declare function aimllistvars Cdecl Alias "AIMLlistvars" () As String   
Declare Function aimlloaddataas Cdecl Alias "AIMLloadDATAas" () As Integer  
Declare Sub aimlsavedataas Cdecl Alias "AIMLsaveDATAas" ()  
Declare Sub aimlclose Cdecl Alias "AIMLclose" () 
Declare Sub aimlsubimportsynonyms Cdecl Alias "AIMLsubimportsynonyms" ()  
Declare Sub aimlsubloadsynonyms Cdecl Alias "AIMLsubloadsynonyms" () 
Declare Sub aimlsubsavesynonyms Cdecl Alias "AIMLsubsavesynonyms" () 
Declare Sub aimlsaveSynonyms Cdecl Alias "AIMLsavesynonyms" (ByRef ficsave As String="data\AIMLsynonyms.txt") 


Declare Function formatvoice(ByRef myinput As String)As String
Declare Function formatname(ByRef text As String)As String

AIMLloadvars()

Dim Shared As String myinput,myname
Dim Shared As ZString*10000 myvoicemsg

'Print Str(aimlgetsize())+" patterns loaded"


Function formatname(ByRef text As String)As String
Dim As Integer i
Dim As String text2,key
text2=""
For i=1 To Len(text)
	key=Mid(text,i,1)
	If (InStr(" 1234567890-_ $",key)>=1) Or (key>="A" And key<="z") Then
		text2+=key
	EndIf
Next
Return Trim(text2)
End Function

Function formatvoice(ByRef myinput As String)As String 
Dim As Integer i,j
Dim As String text,text2,key,key0
text=LCase(Trim(Left(myinput,19000)))
For i=1 To Len(text)
	key=Mid(text,i,1)
	If InStr(",&",key) Then text2+=","
	If InStr(";()",key) Then text2+=", , "
	If InStr(":!?.",key) Then text2+=", , , "
	If (key>="a" And key<="z") Or (key>="0" And key<="9") Or _
	    InStr(" +-*/'""",key) Then
		'If key<>" " Or key0<>" " Then
	      'key0=key
			text2+=key
		'EndIf
	EndIf
Next 
Return text2
End Function
