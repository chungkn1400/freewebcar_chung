'minimidi_chung a program by NGUYEN.Chung (freeware 2013)
#Define noguijpeg
#Include Once "gui_chung.bi"
'#include Once "win/mmsystem.bi"

#Inclib "././midipiano_chungDLL"
Declare Function midipianostatus Cdecl Alias "midipianostatus" () As ZString ptr 
Declare Function midipianostart Cdecl Alias "midipianostart" () As Integer 
Declare Function midipianoclose Cdecl Alias "midipianoclose" () As Integer 
Declare Sub midipianoplay Cdecl Alias "midipianoplay" () 'As Integer 
Declare Sub midipianostop Cdecl Alias "midipianostop" () 'As Integer 
Declare Function midipianoloadrecord Cdecl Alias "midipianoloadrecord" (fic As ZString Ptr) As Integer
Declare Function midipianotimeplay Cdecl Alias "midipianotimeplay" () As Double  
Declare Function midipianotimetot Cdecl Alias "midipianotimetot" () As Double  
Declare Sub midipianosetvolume Cdecl Alias "midipianosetvolume" (ByVal volume As single) 
Declare Function midipianolevel Cdecl Alias "midipianolevel" () As Integer   

Dim Shared As String midistatus
Dim Shared As Double timeplay0,timeplay,timetot
Dim Shared As Integer radiovolume=70,tradiomidi=0 

'SetPriorityClass( GetCurrentProcess(), HIGH_PRIORITY_CLASS ) 

Dim Shared As Integer initradio,isong,nsong,repeat,nsongmax=100
Dim Shared As String song(nsongmax),lsong(nsongmax)
Dim Shared As Double tmsg
Dim Shared As Integer trandom(nsongmax)

radiovolume=40
repeat=2


Sub loadradiostation()
Dim As Integer i	
	song(1)=Dir("midi/*.mid*")
	For i=2 To 100
		song(i)=Dir()
		If song(i)="" Then Exit For 
	Next
	nsong=i-1
	Randomize
	isong=1+Int(Rnd*(nsong-0.1))
	For i=1 To nsong
		trandom(i)=nsong/2
	Next
End Sub 
Sub testinitradio()
Dim As Integer i
If initradio=0 Then
	initradio=1
	midipianostart()
	loadradiostation()
   While midistatus<>"ready" And quit=0
	   'guiscan
    	Sleep 100
	   midistatus=*midipianostatus()
   Wend
   radiovolume=max2(5,min2(100,radiovolume))
   midipianosetvolume(radiovolume/100.0)
EndIf    	
End Sub
Sub subnextsong()
isong+=1:If isong>nsong Then isong=1
If song(isong)="" Then isong=1
If tradio=1 Then
	midipianostop()
	If song(isong)<>"" Then 
		midipianoloadrecord("midi/"+song(isong))
		timeplay0=0:timeplay=0
	EndIf
	midipianoplay()
EndIf
End Sub
Sub subprevsong()
isong-=1:If isong<1 Then isong=nsong
If song(isong)="" Then isong=nsong
If tradio=1 Then
	midipianostop()
	If song(isong)<>"" Then 
      midipianoloadrecord("midi/"+song(isong))
		timeplay0=0:timeplay=0
	EndIf
	midipianoplay()
EndIf
End Sub
Function randomsong() As Integer
Dim As Integer i,j,k,n
For i=1 To nsong
	trandom(i)+=1+Int(trandom(i)*2/nsong)
Next i
trandom(isong)=1
j=0
For i=1 To nsong
	j+=trandom(i)
Next i
k=Int(Rnd*j)
n=0
For i=1 To nsong
  n+=trandom(i)
  If n>k Then Return i
Next
Return 1
End Function
Sub subradiomidi()
If tradiomidi=0 Then
		testinitradio()
		tradiomidi=1
		'midipianoloadrecord("midi/mydebby_edit.mid")
		If song(isong)<>"" Then 
   	  midipianoloadrecord("midi/"+song(isong))
		EndIf
		midipianoplay()
EndIf 		
End Sub
Sub subsong()
Dim As Integer i
'getcomboindex("win.song",i)
i=isong+1
If i>0 Then isong=i
If isong>nsong Then isong=1
If song(isong)="" Then isong=1
If tradio=1 Then
	midipianostop()
	If song(isong)<>"" Then 
		midipianoloadrecord("midi/"+song(isong))
		timeplay0=0:timeplay=0
	EndIf
	midipianoplay()
	selectcomboindex("win.song",isong)
EndIf
End Sub
Sub subrepeat()
repeat=2'(repeat+1)Mod 3
If repeat=0 Then printgui("win.repeat","all")
If repeat=1 Then printgui("win.repeat","one")
If repeat=2 Then printgui("win.repeat","rnd")
End Sub
'
' Program start
quit=0

Sub startradiomidi(ByVal userdata As Any Ptr)
subradiomidi()
tradiomidi=1

debutmidi:

While quit=0 And tradio=1
	'guiscan
	sleep 80
	'If guitestkey(vk_escape)<>0 Then
   '   If winh=getactivewindow() Then quit=1		
	'EndIf
	If tradio=1 Then
		timeplay0=timeplay
		timeplay=midipianotimeplay()
		If timeplay<(timeplay0-0.0001) Then
			If repeat=0 Then subnextsong()
			If repeat=2 Then
				isong=randomsong()-1'1+Int(Rnd*(nsong-0.1))
				subnextsong()
			EndIf
		EndIf
		timetot=midipianotimetot()
   EndIf 		
Wend

Sleep 100
midipianostop()
While quit=0 And tradio=0
	Sleep 100
Wend
If quit=0 And tradio=1 Then timeplay+=999999:GoTo debutmidi

If initradio=1 Then
	midipianoclose()
	initradio=0
EndIf
tradiomidi=0

End Sub 
'guigetwindowpos("win",winx,winy,windx,windy)

/'file=freefile
Open ficini For Output As #file
Print #file,radiovolume
Print #file,radiostation
Print #file,winx
Print #file,winy
Print #file,repeat
Close #file

guiclose()
guiquit()

End 
'/