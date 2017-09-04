Dim Shared As Single tfire,texfire,dtexfire
Sub drawfire 
   If time2>(tfire+0.12) Or time2<tfire Then
    	tfire=time2
    	texfire+=Rnd
   EndIf
Dim As Single x1,x,y,tx
'x=80*0.5:y=80:tx=0.5
x=90:y=120:tx=0.5
dtexfire+=0.5
x1=x*0.5
	glbegin(gl_quads)
	glTexCoord2f(dtexfire+texfire,0)
	glvertex3f(0,-x1,0)
	gltexcoord2f(dtexfire+texfire+tx,0)
	glvertex3f(0,x1,0)
	glTexCoord2f(dtexfire+texfire+tx,0.9)
	glvertex3f(0,x1,y)
	gltexcoord2f(dtexfire+texfire,0.9)
	glvertex3f(0,-x1,y)
	glend()
End Sub 
Dim Shared As Integer ifire(nboat),nfire=40,isfire(nboat),nsfire=100
Dim Shared As Single firex(nfire,nboat),firey(nfire,nboat),firez(nfire,nboat),timefire(nfire,nboat)
Dim Shared As Single tsfire(nboat)
Dim Shared As Single sfirex(nsfire,nboat),sfirey(nsfire,nboat),sfirez(nsfire,nboat)
Dim Shared As Single sfiretime(nsfire,nboat),sfirer(nsfire,nboat)
Sub addfire(ByVal x As Single,ByVal y As Single,ByVal z As Single,ByVal iboat As Integer, _  
	         ByVal dtime As Single=0.0001)
Dim As Integer i,j,k,kmax
Dim As Single t,r,h
r=dxboatmax(iboat)/8
'h=3.5*dyboat(iboat)
h=3.5*dzboat2(iboat)
kmax=7
If z>h Then r=99999:kmax=7
k=0
If dtime>100 Then  
 For i=1 To nfire
  If timefire(i,iboat)>(time2+20) Then
	If Abs(firex(i,iboat)-x)<r Then
		If Sgn(firez(i,iboat)-h)=Sgn(z-h) Then k+=1
	EndIf
  EndIf 
 Next
EndIf 
If k<=kmax Then r=99999:h=99999
j=1:t=time2+9999:k=0 
For i=1 To nfire 
 If timefire(i,iboat)<(time2+dtime+0.001) Then k+=1
 If timefire(i,iboat)<(t-0.0001) Then
 	If Abs(firex(i,iboat)-x)<r Then
 		If Sgn(firez(i,iboat)-h)=Sgn(z-h) Then 
   	   j=i
 	      t=timefire(i,iboat)
      EndIf 
   EndIf 
 EndIf
Next
If k<=2 Then j=1+Int(Rnd*2) 
timefire(j,iboat)=(time2+dtime)
firex(j,iboat)=x
firey(j,iboat)=y
firez(j,iboat)=z
If z<=0.351*dyboat(iboat) Then
	If x>-0.5*dxboatmax(iboat) Then firez(j,iboat)=min(0.3*dyboat(iboat),z)
EndIf
End Sub
Sub addsfire(ByVal x As Single,ByVal y As Single,ByVal z As Single,ByVal iboat As Integer, _  
	          ByVal r As Single=1.0)
isfire(iboat)+=1
If isfire(iboat)>nsfire Then isfire(iboat)=1
sfiretime(isfire(iboat),iboat)=time2
sfirex(isfire(iboat),iboat)=x
sfirey(isfire(iboat),iboat)=y
sfirez(isfire(iboat),iboat)=z	
sfirer(isfire(iboat),iboat)=r
End Sub
Dim Shared As Single vdegats(nboat),tdegats(nboat,4)
Sub drawfires(ByVal iboat As Integer)
Dim As Integer i,j
Dim As Single fx,fy,fz
vdegats(iboat)=0
For i=0 To 3
	tdegats(iboat,i)=0
Next
glenable gl_alpha_test
glAlphaFunc(gl_gequal,1/254)
glEnable GL_BLEND
glBlendFunc GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA
glbindtexture(gl_texture_2d,firetext)
'glcolor3f(1.0,1.0,1.0)
dtexfire=0
For i=1 To nfire
  If (time2+9999)<timefire(i,iboat) Then timefire(i,iboat)=time2 'if midnight	
  If time2<(timefire(i,iboat)+0.001) Then  	
    glpushmatrix
    fx=firex(i,iboat):fy=firey(i,iboat):fz=firez(i,iboat)
    If fz>3.5*dyboat(iboat) Then
    	vdegats(iboat)+=1
    Else 
    	j=max2(0,min2(3,Int(4*(fx+dxboatmax(iboat))/(1.8*dxboatmax(iboat)))))
    	tdegats(iboat,j)+=1
    EndIf
    gltranslatef(fx,fy,fz)
    glrotatef(boato3(iboat),1,0,0)
    glrotatef(boato2(iboat),0,1,0)
    If tourelle=0 Or plane=0 Then
    	glrotatef(o1-boato1(iboat),0,0,1)
    Else 
    	glrotatef(to1-boato1(iboat),0,0,1)
    EndIf 	
    drawfire
    glpopmatrix
    If tsfire(iboat)<0.0001 Then
    	addsfire(fx*boatco1(iboat)-fy*boatsi1(iboat)+boatx(iboat), _  
    	         fx*boatsi1(iboat)+fy*boatco1(iboat)+boaty(iboat), _  
    	         fz+boatz(iboat)+180,iboat)
    EndIf   
  EndIf
Next i  
gldisable GL_BLEND
gldisable gl_alpha_test
End Sub
Sub drawsfire(ByVal iboat As Integer)
Dim As Integer i,j
Dim As Single dt,k
   glEnable GL_BLEND
   glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_ALPHA
	'gldisable GL_DEPTH_TEST
	For i=nsfire To 1 Step -1
		If time2<(sfiretime(i,iboat)-0.001) Then sfiretime(i,iboat)=time2 'if midnight
		If time2<(sfiretime(i,iboat)+4) Then 			
       	If Abs(sfirez(i,iboat)-mz)<120 Then
       		gldisable GL_DEPTH_TEST
       	Else 
       		glenable GL_DEPTH_TEST
       	EndIf
	      glpushmatrix
	      sfirez(i,iboat)+=5*kfps*sfirer(i,iboat)
	      gltranslatef(sfirex(i,iboat),sfirey(i,iboat),sfirez(i,iboat))
	      glbindtexture(gl_texture_2d,sfiretext)
	      glcolor3f(1,1,1)
	      If tourelle=0 Then 
	        glrotatef(o1,0,0,1)
	        glrotatef(o2,0,1,0)
	      Else
	        glrotatef(to1,0,0,1)
	        glrotatef(to2,0,1,0)
	      EndIf
	      dt=time2-sfiretime(i,iboat)
	      k=4.2/(4.2+dt)
	      glcolor3f(k,k,k)
	      j=(150+70*(dt))*sfirer(i,iboat)
	      gltexcarre3(j,j)
	      glpopmatrix
		EndIf
	Next
	gldisable GL_BLEND
	glEnable GL_DEPTH_TEST
tsfire(iboat)+=kfps*(0.5+Rnd)
If tsfire(iboat)>20 Then 
	tsfire(iboat)=0
EndIf
End Sub 
