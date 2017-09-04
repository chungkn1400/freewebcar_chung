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
Dim Shared As Integer ifire(nship),nfire=40,isfire(nship),nsfire=100
Dim Shared As Single firex(nfire,nship),firey(nfire,nship),firez(nfire,nship),timefire(nfire,nship)
Dim Shared As Single tsfire(nship)
Dim Shared As Single sfirex(nsfire,nship),sfirey(nsfire,nship),sfirez(nsfire,nship)
Dim Shared As Single sfiretime(nsfire,nship),sfirer(nsfire,nship)
Sub addfire(ByVal x As Single,ByVal y As Single,ByVal z As Single,ByVal iship As Integer, _  
	         ByVal dtime As Single=0.0001)
Dim As Integer i,j,k,kmax
Dim As Single t,r,h
r=dxshipmax(iship)/8
'h=3.5*dyship(iship)
h=3.5*dzship2(iship)
kmax=7
If z>h Then r=99999:kmax=7
k=0
If dtime>100 Then  
 For i=1 To nfire
  If timefire(i,iship)>(time2+20) Then
	If Abs(firex(i,iship)-x)<r Then
		If Sgn(firez(i,iship)-h)=Sgn(z-h) Then k+=1
	EndIf
  EndIf 
 Next
EndIf 
If k<=kmax Then r=99999:h=99999
j=1:t=time2+9999:k=0 
For i=1 To nfire 
 If timefire(i,iship)<(time2+dtime+0.001) Then k+=1
 If timefire(i,iship)<(t-0.0001) Then
 	If Abs(firex(i,iship)-x)<r Then
 		If Sgn(firez(i,iship)-h)=Sgn(z-h) Then 
   	   j=i
 	      t=timefire(i,iship)
      EndIf 
   EndIf 
 EndIf
Next
If k<=2 Then j=1+Int(Rnd*2) 
timefire(j,iship)=(time2+dtime)
firex(j,iship)=x
firey(j,iship)=y
firez(j,iship)=z
If z<=0.351*dyship(iship) Then
	If x>-0.5*dxshipmax(iship) Then firez(j,iship)=min(0.3*dyship(iship),z)
EndIf
shipwar(iship)=1
End Sub
Sub addsfire(ByVal x As Single,ByVal y As Single,ByVal z As Single,ByVal iship As Integer, _  
	          ByVal r As Single=1.0)
isfire(iship)+=1
If isfire(iship)>nsfire Then isfire(iship)=1
sfiretime(isfire(iship),iship)=time2
sfirex(isfire(iship),iship)=x
sfirey(isfire(iship),iship)=y
sfirez(isfire(iship),iship)=z	
sfirer(isfire(iship),iship)=r
End Sub
Dim Shared As Single vdegats(nship),tdegats(nship,4)
Sub drawfires(ByVal iship As Integer)
Dim As Integer i,j
Dim As Single fx,fy,fz
vdegats(iship)=0
For i=0 To 3
	tdegats(iship,i)=0
Next
glenable gl_alpha_test
glAlphaFunc(gl_gequal,1/254)
glEnable GL_BLEND
glBlendFunc GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA
glbindtexture(gl_texture_2d,firetext)
'glcolor3f(1.0,1.0,1.0)
dtexfire=0
For i=1 To nfire
  If (time2+9999)<timefire(i,iship) Then timefire(i,iship)=time2 'if midnight	
  If time2<(timefire(i,iship)+0.001) Then  	
    glpushmatrix
    fx=firex(i,iship):fy=firey(i,iship):fz=firez(i,iship)
    If fz>3.5*dyship(iship) Then
    	vdegats(iship)+=1
    Else 
    	j=max2(0,min2(3,Int(4*(fx+dxshipmax(iship))/(1.8*dxshipmax(iship)))))
    	tdegats(iship,j)+=1
    EndIf
    gltranslatef(fx,fy,fz)
    glrotatef(shipo3(iship),1,0,0)
    glrotatef(shipo2(iship),0,1,0)
    If tourelle=0 Or plane=0 Then
    	glrotatef(o1-shipo1(iship),0,0,1)
    Else 
    	glrotatef(to1-shipo1(iship),0,0,1)
    EndIf 	
    drawfire
    glpopmatrix
    If tsfire(iship)<0.0001 Then
    	addsfire(fx*shipco1(iship)-fy*shipsi1(iship)+shipx(iship), _  
    	         fx*shipsi1(iship)+fy*shipco1(iship)+shipy(iship), _  
    	         fz+shipz(iship)+180,iship)
    EndIf   
  EndIf
Next i  
gldisable GL_BLEND
gldisable gl_alpha_test
End Sub
Sub drawsfire(ByVal iship As Integer)
Dim As Integer i,j
Dim As Single dt,k
   glEnable GL_BLEND
   glBlendFunc GL_SRC_color,GL_ONE'_MINUS_SRC_ALPHA
	'gldisable GL_DEPTH_TEST
	For i=nsfire To 1 Step -1
		If time2<(sfiretime(i,iship)-0.001) Then sfiretime(i,iship)=time2 'if midnight
		If time2<(sfiretime(i,iship)+4) Then 			
       	If Abs(sfirez(i,iship)-mz)<120 Then
       		gldisable GL_DEPTH_TEST
       	Else 
       		glenable GL_DEPTH_TEST
       	EndIf
	      glpushmatrix
	      sfirez(i,iship)+=5*kfps*sfirer(i,iship)
	      gltranslatef(sfirex(i,iship),sfirey(i,iship),sfirez(i,iship))
	      glbindtexture(gl_texture_2d,sfiretext)
	      glcolor3f(1,1,1)
	      If tourelle=0 Then 
	        glrotatef(o1,0,0,1)
	        glrotatef(o2,0,1,0)
	      Else
	        glrotatef(to1,0,0,1)
	        glrotatef(to2,0,1,0)
	      EndIf
	      dt=time2-sfiretime(i,iship)
	      k=4.2/(4.2+dt)
	      glcolor3f(k,k,k)
	      j=(150+70*(dt))*sfirer(i,iship)
	      gltexcarre3(j,j)
	      glpopmatrix
		EndIf
	Next
	gldisable GL_BLEND
	glEnable GL_DEPTH_TEST
tsfire(iship)+=kfps*(0.5+Rnd)
If tsfire(iship)>20 Then 
	tsfire(iship)=0
EndIf
End Sub 
