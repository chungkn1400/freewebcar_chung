'agl_chung by NGUYEN.Chung (2017)

Declare Sub pushagl(func As Integer,x1 As single=0,y1 As single=0,z1 As single=0,t1 As single=0,t2 As single=0)
Declare Sub pushagli(func As Integer,x1 As uint=0,y1 As uint=0,z1 As uint=0,yptr As uint Ptr=0)
Const As Integer nagl=300000 
Dim Shared As Integer aglfunc(nagl),iagl,iagltext,taglcompile=0,taglyet=0
Dim Shared As Single ax1(nagl),ay1(nagl),az1(nagl),at1(nagl),at2(nagl)
Dim Shared As uint ai1(nagl),aj1(nagl),ak1(nagl)
Dim Shared As String atext1(nagl)
Dim Shared As uint Ptr aglptr(nagl)
/'#Define glbegin aglbegin
#Define glend aglend
#Define gltexcoor2f aglcoord2f
#Define '/ 
/'
Dim Shared As Integer kc1=-1
Sub aglenableexecute(k As integer)
	kc1=k
End Sub
Sub aglbegin(gloption As uint)
	If taglcompile<=kc1 Then glbegin(gloption)
	pushagli(1,gloption)
End Sub
Sub aglend
	If taglcompile<=kc1 Then glend
	pushagli(2)
End Sub
Sub agltexcoord2f(tx As single,ty As single)
   If taglcompile<=kc1 Then glTexCoord2f tx,ty
   pushagl(3,tx,ty)
End Sub
Sub aglvertex3f(x As single,y As single,z As Single)
   If taglcompile<=kc1 Then glVertex3f x,y,z
   pushagl(4,x,y,z)
End Sub
Sub myaglbindtexture(gltext2d As uint, itexture As uint Ptr) 
  If taglcompile<=1 Then myglbindtexture(gltext2d, itexture)
  pushagli(5,gltext2d,*itexture)
End Sub
Sub aglcolor3f(x As single,y As single,z As Single)
  If taglcompile<=kc1 Then glcolor3f x,y,z
   pushagl(6,x,y,z)
End Sub
Sub aglcolor4f(x As single,y As single,z As Single,t As single)
  glcolor4f x,y,z,t
   pushagl(7,x,y,z,t)
End Sub
Sub aglenable(x As uint)
	If taglcompile<=kc1 Then glenable x
   pushagli(8,x)
End Sub
Sub agldisable(x As uint)
	If taglcompile<=kc1 Then gldisable x
   pushagli(9,x)
End Sub
Sub aglalphafunc(x As uint,y As single)
	If taglcompile<=kc1 Then glalphafunc x,y 
   pushagli(10,x,y):ax1(iagl)=y
End Sub
Sub aglblendfunc(x As uint,y As uint)
	If taglcompile<=kc1 Then glblendfunc x,y
   pushagli(11,x,y)
End Sub
/'Sub agltriangle (ByVal x1 As Single,ByVal y1 As Single,ByVal z1 As Single,_ 
                ByVal x2 As Single,ByVal y2 As Single,ByVal z2 As Single,_
                ByVal x3 As Single,ByVal y3 As Single,ByVal z3 As Single )
aglbegin GL_triangles
aglvertex3f x1,y1,z1
aglvertex3f x2,y2,z2
aglvertex3f x3,y3,z3
aglend
End Sub '/
Sub aglloadidentity()
	If taglcompile<=kc1 Then glloadidentity
	pushagli(12)
End Sub
Sub agltranslatef(x As single,y As single,z As Single)
	If taglcompile<=kc1 Then gltranslatef(x,y,z)
   pushagl(13,x,y,z)
End Sub
Sub aglrotatef(o1 As Single,x As Single,y As single,z As Single)
	If taglcompile<=kc1 Then glrotatef(o1,x,y,z)
   pushagl(14,o1,x,y,z)
End Sub
Sub aglscalef(x As single,y As single,z As Single)
	If taglcompile<=kc1 Then glscalef(x,y,z)
   pushagl(15,x,y,z)
End Sub
Sub aglpushmatrix()
	If taglcompile<=kc1 Then glpushmatrix
   pushagli(16)
End Sub
Sub aglpopmatrix()
	If taglcompile<=kc1 Then glpopmatrix
   pushagli(17)
End Sub
Declare Sub gldrawtext3D(ByRef text As String,ByVal scale As Single=5.0)
Sub agldrawtext3D(text As string,scale As Single=5.0)
  	If taglyet<>0 Then Exit Sub
  	taglyet=1
  	If taglcompile<=kc1 Then gldrawtext3D(text,scale)
  	pushagl(18,scale)
  	If iagltext<nagl Then
  		iagltext+=1
  		atext1(iagltext)=text
  	EndIf
  	taglyet=0
End Sub   	
Sub aglcylindre(x As Single,y As single,z As Single,t1 As Single,t2 As single)
   If taglcompile<=kc1 Then glcylindre(x,y,z,t1,t2)
   pushagl(19,x,y,z,t1,t2)
End Sub 
Sub aglcarre2(x As single,y As Single)
	If taglcompile<=kc1 Then glcarre2(x,y)
   pushagl(20,x,y)
End Sub 
Sub agltexcarre2(x As single,y As Single,z As Single=1)
	If taglcompile<=kc1 Then gltexcarre2(x,y,z)
   pushagl(21,x,y,z)
End Sub 
Sub aglcalllist(x As uint)
  	If taglyet<>0 Then Exit Sub
  	taglyet=1
	If taglcompile<=kc1 Then glcalllist(x)
   pushagli(22,x)
   taglyet=0
End Sub 
Sub agltexcarre2dz(x As single,y As Single,z As single)
	If taglcompile<=kc1 Then gltexcarre2dz(x,y,z)
   pushagl(23,x,y,z)
End Sub 
Sub agltexsphere(x As Single,y As Single=20,z As Single=20)
	If taglcompile<=kc1 Then gltexsphere(x,y,z)
	pushagl(24,x,y,z)
End Sub
Sub agltexrotcarre2(x As Single,y As single,do1 As single)
	If taglcompile<=kc1 Then gltexrotcarre2(x,y,do1)
	pushagl(25,x,y,do1)
End Sub
Declare Sub drawarbre()
Sub agldrawarbre()
	If taglcompile<=kc1 Then drawarbre()
	pushagli(26)
End Sub
Sub aglnormal3f(mynormalx As single,mynormaly As single,mynormalz As single)
   If taglcompile<=kc1 Then glnormal3f mynormalx,mynormaly,mynormalz
   pushagl(27,mynormalx,mynormaly,mynormalz)
End Sub    
Sub agltexquad (ByVal x1 As Single,ByVal y1 As Single,ByVal z1 As Single,_ 
             ByVal x2 As Single,ByVal y2 As Single,ByVal z2 As Single,_
             ByVal x3 As Single,ByVal y3 As Single,ByVal z3 As Single,_
             ByVal x4 As Single,ByVal y4 As Single,ByVal z4 As Single,_ 
             ByVal tx As Single=1,ByVal ty As Single=1,ByVal tx0 As Single=0)
aglbegin GL_QUADS
agltexcoord2f tx0,0
aglvertex3f x1,y1,z1
agltexcoord2f tx0+tx,0
aglvertex3f x2,y2,z2
agltexcoord2f tx0+tx,ty
aglvertex3f x3,y3,z3
agltexcoord2f tx0,ty
aglvertex3f x4,y4,z4
aglEnd
End Sub
Sub aglsphere(x As Single,y As Single=20,z As Single=20)
	If taglcompile<=kc1 Then glsphere(x,y,z)
	pushagl(28,x,y,z)
End Sub


Sub pushagl(func As Integer,x1 As single=0,y1 As single=0,z1 As single=0,t1 As single=0,t2 As single=0)
Dim As Integer i
   If taglcompile<>1 Then Exit Sub 
	If iagl>=nagl Then guinotice "error iagl max 900000 reached !":iagl=0
	iagl+=1
	aglfunc(iagl)=func:ax1(iagl)=x1:ay1(iagl)=y1:az1(iagl)=z1:at1(iagl)=t1:at2(iagl)=t2
End Sub
Sub pushagli(func As Integer,x1 As uint=0,y1 As uint=0,z1 As uint=0,yptr As uint Ptr=0)
Dim As Integer i
   If taglcompile<>1 Then Exit Sub 
	If iagl>=nagl Then guinotice "error iagl max 900000 reached !":iagl=0
	iagl+=1
	aglfunc(iagl)=func:ai1(iagl)=x1:aj1(iagl)=y1:ak1(iagl)=z1:aglptr(iagl)=yptr
End Sub
Sub aglreset()
Dim As Integer i  
For i=1 To iagltext
	atext1(i)=""
Next
iagl=0
iagltext=0
taglyet=0
End Sub
Sub aglexecute()
Dim As Integer i,j,k,itext,func
If iagl=0 Then Exit Sub
itext=0 
For i=1 To iagl
      func=aglfunc(i)',x1=ax1(i),y1=ay1(i),z1=az1(i),t1=at1(i),ytex=aglptr(i)
   	If func=3 Then
   		gltexcoord2f(ax1(i),ay1(i))
   	ElseIf func=4 Then
   		glvertex3f(ax1(i),ay1(i),az1(i))
   	ElseIf func=1 Then
   	 	glbegin(ai1(i))
   	ElseIf func=2 Then
   		glend()
   	ElseIf func=5 Then
   		glbindtexture0(ai1(i),aj1(i))
   	ElseIf func=6 Then
   		 glcolor3f(ax1(i),ay1(i),az1(i))
   	ElseIf func=7 Then
   		 glcolor4f(ax1(i),ay1(i),az1(i),at1(i))
   	ElseIf func=13 Then
          gltranslatef(ax1(i),ay1(i),az1(i))
   	ElseIf func=14 Then
          glrotatef(ax1(i),ay1(i),az1(i),at1(i))
   	ElseIf func=15 Then
          glscalef(ax1(i),ay1(i),az1(i))
   	ElseIf func=16 Then
   		 glpushmatrix()
   	ElseIf func=17 Then
   		 glpopmatrix()
   	ElseIf func=8 Then
   		 glenable(ai1(i))
   	ElseIf func=9 Then
   		 gldisable(ai1(i))
   	ElseIf func=10 Then
          glAlphaFunc(ai1(i),ax1(i)) 
   	ElseIf func=11 Then
          glblendFunc(ai1(i),aj1(i))
   	ElseIf func=12 Then
          glloadidentity()
   	ElseIf func=18 Then
   		If itext<iagltext Then itext+=1
   		gldrawtext3D(atext1(itext),ax1(i))
   	ElseIf func=19 Then
         glcylindre(ax1(i),ay1(i),az1(i),at1(i),at2(i))
   	ElseIf func=20 Then
   		glcarre2(ax1(i),ay1(i)) 
   	ElseIf func=21 Then
   		gltexcarre2(ax1(i),ay1(i),az1(i))
   	ElseIf func=22 Then
   		glcalllist(ai1(i))
   	ElseIf func=23 Then
   		gltexcarre2dz(ax1(i),ay1(i),az1(i))
   	ElseIf func=24 Then
   		gltexsphere(ax1(i),ay1(i),az1(i))
   	ElseIf func=25 Then
   		gltexrotcarre2(ax1(i),ay1(i),az1(i))
   	ElseIf func=26 Then
   		drawarbre()
   	ElseIf func=27 Then
   		glnormal3f(ax1(i),ay1(i),az1(i))
   	ElseIf func=28 Then
   		glsphere(ax1(i),ay1(i),az1(i))
   	EndIf
Next i 
End Sub
'/
 
