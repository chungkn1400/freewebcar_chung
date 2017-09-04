'agl_chung by NGUYEN.Chung (2017)

Declare Sub pushagl(func As uint,x1 As Double=0,y1 As Double=0,z1 As Double=0,t1 As Double=0,yptr As uint Ptr=0)
Sub aglbegin(gloption As uint)
	'glbegin(gloption)
	pushagl(1,gloption)
End Sub
Sub aglend
	'glend
	pushagl(2)
End Sub
Sub agltexcoord2f(tx As single,ty As single)
'glTexCoord2f tx,ty
   pushagl(3,tx,ty)
End Sub
Sub aglvertex3f(x As single,y As single,z As Single)
'glVertex3f x,y,z
   pushagl(4,x,y,z)
End Sub
Sub aglbindtexture(gltext2d As uint, itexture As uint) 
'glbindtexture(gltext2d, itexture)
   pushagl(5,gltext2d,0,0,0,@itexture)
End Sub
Sub aglcolor3f(x As single,y As single,z As Single)
'glcolor3f x,y,z
   pushagl(6,x,y,z)
End Sub
Sub aglcolor4f(x As single,y As single,z As Single,t As single)
'glcolor!'f x,y,z,t
   pushagl(7,x,y,z,t)
End Sub
Sub aglenable(x As uint)
   pushagl(8,x)
End Sub
Sub agldisable(x As uint)
   pushagl(9,x)
End Sub
Sub aglalphafunc(x As uint,y As uint)
   pushagl(10,x,y)
End Sub
Sub aglblendfunc(x As uint,y As uint)
   pushagl(11,x,y)
End Sub
Sub agltriangle (ByVal x1 As Single,ByVal y1 As Single,ByVal z1 As Single,_ 
                ByVal x2 As Single,ByVal y2 As Single,ByVal z2 As Single,_
                ByVal x3 As Single,ByVal y3 As Single,ByVal z3 As Single )
aglbegin GL_triangles
aglvertex3f x1,y1,z1
aglvertex3f x2,y2,z2
aglvertex3f x3,y3,z3
aglend
End Sub


Const As Integer nagl=900000 
Dim Shared As Integer aglfunc(nagl),iagl,iagl0,aglready=1,aglquit=0,taglstart=0,testagl=0
Dim Shared As Double agl1(nagl),agl2(nagl),agl3(nagl),agl4(nagl)
Dim Shared As uint Ptr aglptr(nagl)
Sub pushagl(func As uint,x1 As Double=0,y1 As Double=0,z1 As Double=0,t1 As Double=0,yptr As uint Ptr=0)
Dim As Integer i
	Var iagl00=iagl0
	Var iagl1=iagl+1:If iagl1>nagl Then iagl1=0
	If iagl1=iagl00-1 Or (iagl1=nagl And iagl00=0) Then
		For i=1 To 200
			If iagl0<>iagl00 Then Exit For
			Sleep 50
		Next
	EndIf
	iagl=iagl1
	aglfunc(iagl)=func:agl1(iagl)=x1:agl2(iagl)=y1:agl3(iagl)=z1:agl4(iagl)=t1:aglptr(iagl)=yptr
	If iagl=iagl00 Then guinotice "error iagl max 900000 reached !"
End Sub
Sub aglclose
Dim As Integer i
	aglquit=1
   For i=1 To 100
   	Sleep 100
      If aglready=-1 Then Exit for	
   Next
   guinotice "agl bye!"
End Sub
Sub waitaglready()
Dim As Integer i
 For i=1 To 1000
 	If aglready=1 Or aglready=-1 Then
 		Exit For
 	EndIf
 	Sleep 20
 Next
End Sub 
Sub aglmain(ByVal userdata As Any Ptr)
While quit=0 and aglquit=0 
   If iagl0<>iagl Then
   	aglready=0
   	iagl0+=1:If iagl0>nagl Then iagl0=0:Sleep 1
   	Var func=aglfunc(iagl0),x1=agl1(iagl0),y1=agl2(iagl0),z1=agl3(iagl0),t1=agl4(iagl0),ytex=aglptr(iagl0)
   	/'If func=1 Then
   	 	glbegin(x1)
   	ElseIf func=2 Then
   		glend()
   	ElseIf func=3 Then
   		gltexcoord2f(x1,y1)
   	ElseIf func=4 Then
   		glvertex3f(x1,y1,z1)
   	ElseIf func=5 Then
   		myglbindtexture(x1,ytex)
   	ElseIf func=6 Then
   		 glcolor3f(x1,y1,z1)
   	ElseIf func=7 Then
   		 glcolor4f(x1,y1,z1,t1)
   	ElseIf func=8 Then
   		 glenable(x1)
   	ElseIf func=9 Then
   		 gldisable(x1)
   	ElseIf func=10 Then
          glAlphaFunc(x1,y1) 
   	ElseIf func=11 Then
          glblendFunc(x1,y1)
   	EndIf'/
   Else
   	aglready=1:Sleep 20
   EndIf
Wend
aglready=-1
End Sub
Sub aglstart()
	If taglstart=0 Then taglstart=1:threaddetach(ThreadCreate(@aglmain))  	 
End Sub

