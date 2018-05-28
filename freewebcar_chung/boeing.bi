Const As Integer nboeing=30
Dim Shared As String boeingid(nboeing),boeingmodel(nboeing)
Dim Shared As Single boeingalt(nboeing),boeinglat(nboeing),boeinglng(nboeing),boeingspd(nboeing),boeingtrak(nboeing)
Dim Shared As String boeingid0(nboeing),boeingmodel0(nboeing)
Dim Shared As Single boeingalt0(nboeing),boeinglat0(nboeing),boeinglng0(nboeing),boeingspd0(nboeing),boeingtrak0(nboeing)
Dim Shared As String nboeingid0(nboeing),nboeingmodel0(nboeing)
Dim Shared As Single nboeingalt0(nboeing),nboeinglat0(nboeing),nboeinglng0(nboeing)
Dim Shared As String nnboeingid(nboeing),nnboeingmodel(nboeing)
Dim Shared As Single nnboeingalt(nboeing),nnboeinglat(nboeing),nnboeinglng(nboeing)
Dim Shared As Single nnnboeingx(nboeing),nnnboeingy(nboeing),nnnboeingz(nboeing)
Dim Shared As Single nnboeingx(nboeing),nnboeingy(nboeing),nnboeingz(nboeing)
Dim Shared As Single nnboeingdx(nboeing),nnboeingdy(nboeing),nnboeingdz(nboeing),nnboeingv(nboeing)
Dim Shared As Single nnboeingdo1(nboeing),nnboeingdo2(nboeing),nnboeingdo3(nboeing)
Dim Shared As Single nnboeingo1(nboeing),nnboeingo2(nboeing),nnboeingo3(nboeing)
Dim Shared As Single nnnboeingo1(nboeing),nnnboeingo2(nboeing),nnnboeingo3(nboeing),nnnboeingalt(nboeing)
Dim Shared As String recentboeingid(nboeing),recentboeingid0(nboeing)
Dim Shared As Integer irecentboeing,irecentboeing0,irepeatboeing(nboeing),nboeing0
Declare Sub copyboeing0()
Sub getairtraffic(text00 As String)
'https://public-api.adsbexchange.com/VirtualRadar/AircraftList.json?lat=33.433638&lng=-112.008113&fDstL=0&fDstU=7	
'{"src":1,"feeds":[{"id":1,"name":"From Consolidator","polarPlot":false}],"srcFeed":1,"showSil":true,"showFlg":true,"showPic":true,"flgH":20,"flgW":85,"acList":[{"Id":10718357,"Rcvr":1,"HasSig":false,"Icao":"A38C95","Bad":false,"Reg":"N328FR","FSeen":"\/Date(1525489330170)\/","TSecs":9817,"CMsgs":5935,"Alt":1075,"GAlt":1125,"InHg":29.9704723,"AltT":0,"Call":"1277","Lat":33.437344,"Long":-112.009285,"PosTime":1525499141196,"Mlat":false,"Tisb":false,"Spd":0.0,"Trak":101.3,"TrkH":false,"Type":"A20N","Mdl":"Airbus A320 251NSL","Man":"Airbus","CNum":"8118","Op":"Frontier Airlines","OpIcao":"FFT","Sqk":"2636","Help":false,"Vsi":-64,"VsiT":0,"Dst":0.43,"Brng":345.2,"WTC":2,"Species":1,"Engines":"2","EngType":3,"EngMount":0,"Mil":false,"Cou":"United States","HasPic":false,"Interested":false,"FlightsCount":0,"Gnd":false,"SpdTyp":0,"CallSus":false,"Trt":2,"Year":"2017"}],"totalAc":4861,"lastDv":"636610861300471610","shtTrlSec":65,"stm":1525499148039}
'Var text0="{""src"":1,""feeds"":[{""id"":1,""name"":""From Consolidator"",""polarPlot"":false}],""srcFeed"":1,""showSil"":true,""showFlg"":true,""showPic"":true,""flgH"":20,""flgW"":85,""acList"":[{""Id"":10718357,""Rcvr"":1,""HasSig"":false,""Icao"":""A38C95"",""Bad"":false,""Reg"":""N328FR"",""FSeen"":""\/Date(1525489330170)\/"",""TSecs"":9817,""CMsgs"":5935,""Alt"":1075,""GAlt"":1125,""InHg"":29.9704723,""AltT"":0,""Call"":""1277"",""Lat"":33.437344,""Long"":-112.009285,""PosTime"":1525499141196,""Mlat"":false,""Tisb"":false,""Spd"":0.0,""Trak"":101.3,""TrkH"":false,""Type"":""A20N"",""Mdl"":""Airbus A320 251NSL"",""Man"":""Airbus"",""CNum"":""8118"",""Op"":""Frontier Airlines"",""OpIcao"":""FFT"",""Sqk"":""2636"",""Help"":false,""Vsi"":-64,""VsiT"":0,""Dst"":0.43,""Brng"":345.2,""WTC"":2,""Species"":1,""Engines"":""2"",""EngType"":3,""EngMount"":0,""Mil"":false,""Cou"":""United States"",""HasPic"":false,""Interested"":false,""FlightsCount"":0,""Gnd"":false,""SpdTyp"":0,""CallSus"":false,""Trt"":2,""Year"":""2017""ok},{ok2}],""totalAc"":4861,""lastDv"":""636610861300471610"",""shtTrlSec"":65,""stm"":1525499148039}"
 'getlockboeing()
 Var text0=text00
	Dim As Integer i,j,k,n,p 
	Dim As String c
	wline=nextwords(text0,"""acList"":")
	'guinotice(Left(wline,700))
	wtext0=nextdata(wline,"[","]")
	'guinotice(Left("wtext0="+wtext0,800))
	printmsg
	split(wtext0,",")
	'printmsgsplit()
	Printmsg
	For i=0 To nboeing
		boeingid(i)=""
	Next
	n=0:p=0
For i=1 To nsplit	
	wtext1=wsplit(i)'nextdata(wtext0,"{","}")
	'If i<=3 Then guinotice Left("wtext1="+wtext1,900)
	'printmsg
   'wtext2=nextwords(wtext1,"""Icao""")'Id
   wtext2=nextwords(wtext1,"""Id""")'Id
   If wtext2="" Then Continue for
   If wtext2<>"" Then
  	  'Var aux=nextdata0(wtext2,"""","""")'":",",")
  	  Var aux=nextdata0(wtext2,":",",")
  	  If aux="" Then Continue For
  	  Var id=Trim(LCase(aux))
  	  'For j=0 To n-1
  	  '	 If id=boeingid(j) Then id="":Exit For  
  	  'Next
  	  If id="" Then Continue For 
  	  boeingid(n)=id
   EndIf
   wtext2=nextwords(wtext1,"""Alt""")'feet
   If wtext2="" Then Continue for
   If wtext2<>"" Then
  	  Var aux=nextdata0(wtext2,":",",")
  	  If aux="" Then Continue For
  	  boeingalt(n)=Val(aux)'*2
  	  If boeingalt(n)>16000 Then Continue For  
   EndIf
   wtext2=nextwords(wtext1,"""Lat""")
   If wtext2="" Then Continue for
   If wtext2<>"" Then
  	  Var aux=nextdata0(wtext2,":",",")
  	  If aux="" Then Continue For
  	  boeinglat(n)=Val(aux) 
   EndIf
   wtext2=nextwords(wtext1,"""Long""")
   If wtext2="" Then Continue for
   If wtext2<>"" Then
  	  Var aux=nextdata0(wtext2,":",",")
  	  If aux="" Then Continue For
  	  boeinglng(n)=Val(aux) 
   EndIf
   wtext2=nextwords(wtext1,"""Spd""")
   boeingspd(n)=4000
   'If wtext2="" Then Continue for
   If wtext2<>"" Then
  	  Var aux=nextdata0(wtext2,":",",")
  	  If aux<>"" Then
  	  	  boeingspd(n)=Val(aux)*1800*6*30/3600 
  	  EndIf
   EndIf
   wtext2=nextwords(wtext1,"""Trak""")
   'If wtext2="" Then Continue for
   If wtext2<>"" Then
  	  Var aux=nextdata0(wtext2,":",",")
  	  If aux<>"" Then 
  	  	  boeingtrak(n)=-Val(aux)+90 
  	  EndIf
   EndIf
   wtext2=nextwords(wtext1,"""Mdl""")
   'If wtext2="" Then Continue for
  	boeingmodel(n)="cessna" 
   If wtext2<>"" Then
  	  Var aux=nextdata0(wtext2,":",",")
  	  'If aux="" Then Continue For
  	  aux=Trim(LCase(aux))
  	  If aux<>"" Then
  	   Var model=""
  	   If InStr(aux,"cessna")>0 Then model="cessna" 
  	   If InStr(aux,"boeing")>0 Then model="boeing" 
  	   If InStr(aux,"airbus")>0 Then model="airbus" 
  	   If InStr(aux,"douglas")>0 Then model="douglas" 
  	   If InStr(aux,"donnell")>0 Then model="douglas" 
  	   If InStr(aux,"tupolev")>0 Then model="tupolev" 
  	   If InStr(aux,"embraer")>0 Then model="embraer" 
  	   If InStr(aux,"fokker")>0 Then model="fokker" 
  	   If model="" Then model=aux'Continue For 
  	   boeingmodel(n)=model
  	  EndIf   
   EndIf
   Var boeingtype=0
   wtext2=nextwords(wtext1,"""EngType""")
   'If wtext2="" Then Continue for
   If wtext2<>"" Then
  	  Var aux=nextdata0(wtext2,":",",")
  	  If aux<>"" Then
  	  	  boeingtype=Val(aux)
  	  	  If boeingtype<>2 And boeingtype<>3 Then' 1=piston,2=turboprop,3=jet 
  	  	  	  boeingmodel(n)="cessna" 
  	  	  ElseIf boeingtype=2 Then
  	  	  	  boeingmodel(n)="fokker"
  	  	  EndIf
  	  EndIf
   EndIf
   If boeingmodel(n)="cessna" Then p+=1':Continue For 
   If n=0 Then
     'auxtext=boeingmodel(n)
     'guinotice "spd="+Str(boeingspd(n))	
     'guinotice "trak="+Str(boeingtrak(n))	
     'guinotice "type="+Str(boeingtype)	
     'guinotice "n="+Str(n)+"/id="+boeingid(n)+"/model="+boeingmodel(n)+"/alt="+Str(boeingalt(n))+"/lat="+Str(boeinglat(n))+"/lng="+Str(boeinglng(n))
   EndIf
   n+=1
   If n>nboeing Then Exit For 
Next i
nboeing0=n-1
'freelockboeing()
'auxtext=boeingmodel(0)+"."
'auxvar4=nsplit+0.001
End Sub
Dim Shared As Double timecopyboeing
Sub loadairtraffic()
If tcopyboeing<>0 Then Exit Sub
tcopyboeing=-1
textload="loadtraffic"
'auxvar+=1:auxtest=0.2
'https://public-api.adsbexchange.com/VirtualRadar/AircraftList.json?lat=33.433638&lng=-112.008113&fDstL=0&fDstU=7	
Var airhost="https://public-api.adsbexchange.com"
'Var airurl="VirtualRadar/AircraftList.json?lat=33.433638&lng=-112.008113&fDstL=0&fDstU=6"	
Var airurl="VirtualRadar/AircraftList.json?lat="+Str(lat)+"&lng="+Str(lng)+"&fDstL=0&fDstU=7"	
If nboeing0<nboeing*0.3 Then
	airurl="VirtualRadar/AircraftList.json?lat="+Str(lat)+"&lng="+Str(lng)+"&fDstL=0&fDstU=12"	
ElseIf nboeing0<nboeing*0.5 Then
	airurl="VirtualRadar/AircraftList.json?lat="+Str(lat)+"&lng="+Str(lng)+"&fDstL=0&fDstU=10"	
ElseIf nboeing0<nboeing*0.7 Then
	airurl="VirtualRadar/AircraftList.json?lat="+Str(lat)+"&lng="+Str(lng)+"&fDstL=0&fDstU=8"	
EndIf
'guinotice airhost+"/"+airurl
Var idata=httppost(airhost,airurl)
Sleep t300
'guinotice Str(idata)
If idata>0 Then  
  Dim As Integer i,j,k
  For i=0 To idata-1
   	 zwebtextboeing[i]=recvdataboeing(i)
  Next
  zwebtextboeing[idata]=0
  'guinotice Left(zwebtextboeing,800)
  getairtraffic(zwebtextboeing)
  tcopyboeing=1
Else
  'guinotice "err traffic"	
  timeboeing=Timer+10
  timeboeing10=timeboeing
  tcopyboeing=0
EndIf
textload=""
End Sub
'loadairtraffic()
Sub subloadairtraffic(ByVal userdata As Any Ptr)
	loadairtraffic()
	Sleep t300
	'guinotice "subloadairtraffic ok"
	tloadwebtext2=0	
End Sub
Sub updatenboeing()
Dim As Integer i	
If auxtest>0.1 Then guinotice "updatenboeing"
   For i=0 To nboeing
   	nnboeingx(i)+=mx-mx0
   	nnboeingy(i)+=my-my0
   	nnboeingz(i)+=mz-mz0
   Next
End Sub
Const As Single v8000=9700
Sub copyboeing0()
'getlockboeing2()
Dim As Integer i,j,k,p
Var i4=6.7-5*nboeing00/nboeing
For i=0 To nboeing
	If nboeingid0(i)<>"" Then
		nnboeingid(i)=nboeingid0(i)
		irepeatboeing(i)=0
	ElseIf nnboeingid(i)<>"" Then
		irepeatboeing(i)+=1
		If irepeatboeing(i)>i4 Then
			nnboeingid(i)=""	
			irepeatboeing(i)=99'tryremove
		EndIf
	EndIf
   nboeingid0(i)=""
Next
For i=0 To nboeing
	If boeingid0(i)="" Then
		Continue For 
	EndIf
	Var test=0
	For j=0 To nboeing0
		If boeingid0(i)=boeingid(j) Then
			test=1:Exit For
		EndIf
	Next
   If test=0 Then
   	boeingid0(i)=""
   	Continue For  	
   EndIf
	boeingid0(i)=boeingid(j)
	boeingmodel0(i)=boeingmodel(j)
	boeingalt0(i)=boeingalt(j)
	boeinglat0(i)=boeinglat(j)
	boeinglng0(i)=boeinglng(j)
   boeingspd0(i)=boeingspd(j)
   boeingtrak0(i)=boeingtrak(j)
	
	nboeingid0(i)=boeingid(j)
	nboeingmodel0(i)=boeingmodel(j)
	nboeingalt0(i)=boeingalt(j)
	nboeinglat0(i)=boeinglat(j)
	nboeinglng0(i)=boeinglng(j)
	
   nnboeingid(i)=boeingid(j)
   irepeatboeing(i)=0

	Var id=boeingid(j)
	For k=0 To nboeing0
		If boeingid(k)=id Then boeingid(k)=""
	Next
	
Next
j=0
auxvar=max(auxvar,0.1)
For i=0 To nboeing
	If nboeingid0(i)="" And nnboeingid(i)<>"" Then
      For k=0 To nboeing0
      	If boeingid(k)=nnboeingid(i) Then      		
	         boeingid0(i)=boeingid(k)
	         boeingmodel0(i)=boeingmodel(k)
	         boeingalt0(i)=boeingalt(k)
	         boeinglat0(i)=boeinglat(k)
	         boeinglng0(i)=boeinglng(k)
	         boeingspd0(i)=boeingspd(k)
	         boeingtrak0(i)=boeingtrak(k)
	         
	         nboeingid0(i)=boeingid(k)
	         nboeingmodel0(i)=boeingmodel(k)
	         nboeingalt0(i)=boeingalt(k)
	         nboeinglat0(i)=boeinglat(k)
	         nboeinglng0(i)=boeinglng(k)
	         
	         nnboeingid(i)=boeingid(k)
	         irepeatboeing(i)=0
	         auxvar+=1
	         
          	Var id=boeingid(k)
	         For p=0 To nboeing0
		          If boeingid(p)=id Then boeingid(p)=""
	         Next
	         Exit For 
      	EndIf
      Next 
	EndIf
Next
j=0
For i=0 To nboeing
	If nboeingid0(i)="" And nnboeingid(i)="" Then
      For k=j To nboeing0
      	If boeingid(k)<>"" Then      		
	         boeingid0(i)=boeingid(k)
	         boeingmodel0(i)=boeingmodel(k)
	         boeingalt0(i)=boeingalt(k)
	         boeinglat0(i)=boeinglat(k)
	         boeinglng0(i)=boeinglng(k)
	         boeingspd0(i)=boeingspd(k)
	         boeingtrak0(i)=boeingtrak(k)
	         
	         nboeingid0(i)=boeingid(k)
	         nboeingmodel0(i)=boeingmodel(k)
	         nboeingalt0(i)=boeingalt(k)
	         nboeinglat0(i)=boeinglat(k)
	         nboeinglng0(i)=boeinglng(k)
	         
	         nnboeingo1(i)=boeingtrak(k)
	         nnboeingdo1(i)=0
	         nnboeingo2(i)=0
	         nnboeingdo2(i)=0
	         nnboeingo3(i)=0
	         nnboeingdo3(i)=0
	         Var lat0=lat,lng0=lng,x=mx,y=my
	         latlngtomxy(nboeinglat0(i),nboeinglng0(i),x,y)
	         lat=lat0:lng=lng0
	         Var dx=boeingspd(k)*Cos(boeingtrak(k)*degtorad)
	         Var dy=boeingspd(k)*Sin(boeingtrak(k)*degtorad)
	         nnboeingx(i)=x-dx
	         nnboeingy(i)=y-dy
	         nnboeingdx(i)=dx
	         nnboeingdy(i)=dy
	         nnboeingv(i)=max(Abs(dx),Abs(dy))
	         nnboeingalt(i)=max(0.0,boeingalt(k))
	         nnboeingz(i)=getterrainheight(x-dx,y-dy)+nnboeingalt(i)
	         nnboeingdz(i)=0
	         
	         nnboeingid(i)=boeingid(k)
	         irepeatboeing(i)=-99
	         
          	Var id=boeingid(k)
	         For p=0 To nboeing0
		          If boeingid(p)=id Then boeingid(p)=""
	         Next
	         j=k+1
	         Exit For 
      	EndIf
      Next
      If k>=nboeing0 Then Exit For 
	EndIf
Next
nboeing00=0
ncessna=0:nfokker=0
For i=0 To nboeing
	If irepeatboeing(i)<-90 Then
		 irepeatboeing(i)=0
	  	 nnnboeingo1(i)=nnboeingo1(i)
	  	 nnnboeingo2(i)=0
	  	 nnboeingo2(i)=0
	  	 nnboeingdo1(i)=0
	  	 nnboeingdo2(i)=0
	  	 nnnboeingz(i)=nnboeingz(i)
	  	 nnnboeingalt(i)=nnboeingalt(i)
	  	 nnboeingdz(i)=0
	  	 nboeing00+=1
	  	 If nboeingmodel0(i)="cessna" Then ncessna+=1
	  	 If nboeingmodel0(i)="fokker" Then nfokker+=1
		 Continue For 
	EndIf
	If nboeingid0(i)="" Then
	  If nnboeingid(i)="" Then
	  	 irepeatboeing(i)=99
		 Continue For
	  Else
	  	 Var dist=max(Abs(nnboeingx(i)-mx),Abs(nnboeingy(i)-my))
	  	 If dist>150000 Then
	  	 	nnboeingid(i)=""
   	  	irepeatboeing(i)=99
	  	 	Continue For 
	  	 EndIf
	  	 If dist<30000 And nnboeingalt(i)>600 Then irepeatboeing(i)=0
	  	 nnnboeingo1(i)=nnboeingo1(i)
	  	 nnnboeingo2(i)=0
	  	 nnboeingo2(i)=0
	  	 nnboeingdo1(i)=0
	  	 nnboeingdo2(i)=0
	  	 nnnboeingz(i)=nnboeingz(i)
	  	 nnnboeingalt(i)=nnboeingalt(i)
	  	 nnboeingdz(i)=0
	  	 nboeing00+=1
	  	 If nboeingmodel0(i)="cessna" Then ncessna+=1
	  	 If nboeingmodel0(i)="fokker" Then nfokker+=1
	  	 Continue For 
	  EndIf 	
	EndIf
	nboeing00+=1
	If nboeingmodel0(i)="cessna" Then ncessna+=1
 	If nboeingmodel0(i)="fokker" Then nfokker+=1
	Var lat0=lat,lng0=lng,x=mx,y=my
	latlngtomxy(nboeinglat0(i),nboeinglng0(i),x,y)
	lat=lat0:lng=lng0
	nnnboeingx(i)=nnboeingx(i)
	nnnboeingy(i)=nnboeingy(i)
	nnnboeingz(i)=nnboeingz(i)
	nnnboeingalt(i)=nnboeingalt(i)
	Var z=getterrainheight(x,y)+nboeingalt0(i)
	nnboeingalt(i)=nboeingalt0(i)
	Var dx=x-nnboeingx(i),dy=y-nnboeingy(i)
   Var dist=max(Abs(dx),Abs(dy))
   If irepeatboeing(i)>90 Then'tryremove
   	dist=max(1.0,dist)
   	dx*=15000/dist
   	dy*=15000/dist
   	dist=15000
	   nnboeingx(i)=x-dx
	   nnboeingy(i)=y-dy
   	nnboeingz(i)=getterrainheight(x-dx,y-dy)+max(2000.0,nboeingalt0(i))
   	nnboeingalt(i)=max(2000.0,nboeingalt0(i))
   	z=nnboeingz(i)
   EndIf
   If dist>35000 Then
   	If nboeingmodel0(i)="cessna" Then
   	  dx*=15000/dist
   	  dy*=15000/dist
   	  dist=15000
   	Else
   	  dx*=35000/dist
   	  dy*=35000/dist
   	  dist=35000
   	EndIf 	
   EndIf
	nnboeingdx(i)=dx
	nnboeingdy(i)=dy
	Var do1=diro1(dx,dy)-nnboeingo1(i)
	While do1>180:do1-=360:Wend
	While do1<-180:do1+=360:Wend 
	nnboeingdo1(i)=do1
	nnnboeingo1(i)=nnboeingo1(i)
	Var v=max(Abs(dx),Abs(dy))
	If v>v8000 Or (irepeatboeing(i)>0 And max(Abs(x-mx),Abs(y-my))>90000) Or (nboeingalt0(i)>2000 And v>500) Then
	 If v<v8000 Then
   	v=max(1.0,v)
   	dx*=(v8000+10)/v
   	dy*=(v8000+10)/v
   	v=v8000+10
	   nnboeingdx(i)=dx
	   nnboeingdy(i)=dy
	 EndIf
	 z=max(z,z-nboeingalt0(i)+2000)
	 Var dz=z-nnboeingz(i)
	 nnboeingdz(i)=dz	
	 Var do2=max(-40.0,min(40.0,diro1(Sqr(dx*dx+dy*dy),dz)))-nnboeingo2(i)
	 nnnboeingo2(i)=nnboeingo2(i)
	 If boeingspd0(i)>v Then
	 	 dx*=boeingspd0(i)/v
	 	 dy*=boeingspd0(i)/v
	 	 nnboeingdx(i)=dx
	 	 nnboeingdy(i)=dy	 	 
	 EndIf
	Else
	 /'If min(nnnboeingalt(i),nnboeingalt(i))>600 Then
	 	auxvar5=min(nnnboeingalt(i),nnboeingalt(i))+0.1
	 	nboeingid0(i)=""
	 	nnboeingid(i)=""
	 	irepeatboeing(i)=0	
		nnboeingx(i)=-9999999
	 EndIf'/
	 nnnboeingz(i)=z-nnboeingalt(i)
	 nnboeingdz(i)=-5000
	 nnboeingalt(i)=0
	 nboeingalt0(i)=0
	 nnboeingo2(i)=0
	 nnboeingdo2(i)=0
	 nnnboeingo2(i)=0
	EndIf
	nnboeingo3(i)=0
	nnboeingdo3(i)=0
	nnboeingv(i)=v
Next
For i=0 To nboeing-1
  If nboeingid0(i)<>"" or nnboeingid(i)<>"" Then 
   If irepeatboeing(i)<90 And nnboeingalt(i)<10 Then 
	  Var testrecent=0,id=nboeingid0(i)
	  If id="" Then id=nnboeingid(i)
	  For j=0 To irecentboeing
		If id=recentboeingid(j) Then
			testrecent=1
			Exit For 
		EndIf
	  Next
	  If testrecent=0 Then Continue For 
  	  Var x=nnboeingx(i)
	  Var y=nnboeingy(i)
	  k=irepeatboeing(i)
	  For j=i+1 To nboeing
     	 If nboeingid0(j)<>"" or nnboeingid(j)<>"" Then 
        If irepeatboeing(j)>=k And nnboeingalt(j)<10 Then
        	  If Abs(x-nnboeingx(j))<300 Then
         	  If Abs(y-nnboeingy(j))<300 Then'remove collide
         	  	  nboeingid0(j)=""
                 nnboeingid(j)=""
                 irepeatboeing(j)=99
         	  EndIf       	  	 
        	  EndIf
        EndIf	
       EndIf  
	  Next j
	EndIf
  EndIf 	
Next i	
'auxtext="boeing="+Str(nboeing00-ncessna-nfokker)+" fokker="+Str(nfokker)+" cessna="+Str(ncessna)
'auxtest=0.2
'guinotice auxtext
'freelockboeing()
End Sub
Sub drawnboeing()
	Var dmax=150000.0
	'nboeingx=mx+200+(1+Cos(Timer*3/10))*1400:nboeingy=my:nboeingz=getterrainheight(nboeingx,nboeingy)+(boeingx-mx)*0.00:nboeingo1=3*o1:nboeingo3=0
	'drawspot(mx+100,my,mz,1,0,1,0.1,1)
	'drawspot(mx+100,my+20,mz,1,1,0.1,0,1)
	'nboeingco1=Cos(nboeingo1*degtorad)
	'nboeingsi1=Sin(nboeingo1*degtorad)
	'nboeingx+=nboeingv*nboeingco1*kfps
	'nboeingy+=nboeingv*nboeingsi1*kfps
	'If nboeingx<mx-dmax Then Exit Sub
	'If nboeingx>mx+dmax Then Exit Sub
	'If nboeingy<my-dmax Then Exit Sub
	'If nboeingy>my+dmax Then Exit Sub 
   Var dist=max(Abs(nboeingx-mx),Abs(nboeingy-my))
   If dist>dmax Then Exit Sub 
   If nboeingv>100 Then  
    Var dist1=max(Abs(nboeingz-mz),dist)
  	 If (itime Mod 4)=0 And nboeingmodel<>"cessna" Then
  		'auxvar=dist1:auxtest=0.2
      If nboeingmodel="fokker" Then
         Var kvol=990.0/max(990.0,dist1)
         kvol=max(2.0,998*kvol*kvol)
      	nfokkerkvol=max(nfokkerkvol,kvol)
      Else 
         Var kvol=990.0/max(990.0,dist1)
         kvol=max(2.0,998*kvol*kvol)
      	nboeingkvol=max(nboeingkvol,kvol)
      EndIf
  		'mcisendstring("setaudio boeing volume to "+str(Int(kvol)),0,0,0)
  	 EndIf
   EndIf 	

   'If nboeingo1>360 Then nboeingo1-=360
   'If nboeingo1<-360 Then nboeingo1+=360
   'Var nboeingzsol=getterrainheight(nboeingx,nboeingy) 	
  	'boeingo1=45
  	'nboeingz=nboeingzsol+nboeingalt
   rotavion(nboeingx-mx,nboeingy-my,nboeingz-mz)
   nboeingx2=x2
   If x2<0.9*max(Abs(y2),Abs(z2))-300 Then Exit Sub 
   glpushmatrix
   gltranslatef(nboeingx,nboeingy,nboeingz+7)
   glrotatef(nboeingo1,0,0,1)
   glrotatef(-nboeingo2,0,1,0)
   glrotatef(-nboeingo3,1,0,0)
   gldisable gl_alpha_test
   
  If nboeingmodel="cessna" Then
  	gltranslatef(0,0,15)
   If scalexy>1.1 Then glscalef(1,1,scalexy)
   glcolor4f(0.86,1,0.4,1)
   drawc150red()   
   glcolor4f(1,1,1,1)
   gltranslatef(41,0,0)
   drawhelice0()
  ElseIf nboeingmodel="fokker" Then  	
   glcolor3f(0.86,1,0.55)
   gltranslatef(0,0,-47)
   glscalef(4,4,5)
   If x2<10000 Then
   	drawfokker()
   Else
   	drawfokkerlow()
   EndIf
   glcolor4f(1,1,1,1)
   glpushmatrix
   gltranslatef(27,28,10)
   glscalef(0.65,0.65,0.65)
   drawhelice0()
   glpopmatrix
   glpushmatrix
   gltranslatef(28,-28,10)
   glscalef(0.65,0.65,0.65)
   drawhelice0(50,0)
   glpopmatrix
   If (Int(time2)Mod 2)=1 Then 
    gldisable gl_texture_2D
    gldisable gl_lighting
    gltranslatef(4,100,15)
    glcolor3f(1,0.1,0)
    Var dr=max(3.0,min(12.5,Abs(x2)/1000))
    glsphere(dr,4,4)
    glcolor3f(0,1,0.1)
    gltranslatef(0,-199,0)
    glsphere(dr,4,4)
    glenable gl_texture_2D
    glcolor3f(1,1,1)
   EndIf 
  Else  	
   glscalef(4,4,5)
   If x2<10000 Then
   	draw737low()
   Else
   	draw737low2()
   EndIf
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
  EndIf  
  glpopmatrix
End Sub
Dim Shared As Double ttimeboeing
Sub drawnboeings()
Dim As Integer i,j,k	
Var t30=30.0
auxvar6=Int(timeboeing+t30-timer)+0.1
If time2<timeinit+15 And time2>timecopyboeing+0.5 And tcopyboeing=0 Then
   tcopyboeing=-1
   timeboeing0=Timer-15.1
   timeboeing=timeboeing0+30
   timeboeing10=timeboeing
   timecopyboeing=Timer+10
   For i=0 To nboeing
   	nboeingid0(i)=""
   	nnboeingid(i)=""
   	irepeatboeing(i)=99
   Next
   tcopyboeing=0
EndIf
If tcopyboeing=1 And time2>timecopyboeing+0.5 Then
   timecopyboeing=Timer 
	copyboeing0()
	For i=0 To nboeing
	  If nboeingid0(i)<>"" Then 
	   'nnboeingdx(i)=8000
	   'nnboeingdy(i)=0
	   nnboeingv(i)=max(Abs(nnboeingdx(i)),Abs(nnboeingdy(i)))
	   If nnboeingv(i)<v8000+300 Then
	  	   nnboeingdz(i)=-5000
	   EndIf
	  EndIf  
   Next 
   timeboeing0=Timer-0.1 
   timeboeing=timeboeing0+t30
   timeboeing10=timeboeing
	tcopyboeing=0
EndIf
Var dt=0.0,dt4=0.0
If ttimeboeing<timer-200 Then ttimeboeing=Timer-0.1
'If 1 Then'ttimeboeing<timeboeing+t30 And ttimeboeing>timeboeing0 Then
	dt=max(0.0001,min(1.0,(Timer-ttimeboeing)/60.0))'max(1.0,timeboeing+t30-timeboeing0))
   If ttimeboeing>timeboeing Then dt*=max(0.25,(timeboeing+t30-ttimeboeing)/t30) 
   If ttimeboeing<timeboeing0+10 Then
	   dt4=min(1.0,(Timer-ttimeboeing)/10)
   EndIf
'EndIf
ttimeboeing=Timer

Var irecent=0,testrecent=0
irecentboeing0=-1
k=0
Var distmin=999999
For irecent=0 To 1
 For i=0 To nboeing
 	Var id=nboeingid0(i)
	If id="" Then
		id=nnboeingid(i)
		If id="" Then
			Continue For
		EndIf
	EndIf
	testrecent=0
	For j=0 To irecentboeing
		If id=recentboeingid(j) Then
			testrecent=1
			Exit For 
		EndIf
	Next
	If irecent=0 Then
		If testrecent=0 Then Continue For
	else 
		if testrecent=1 then continue for 
	EndIf
	If irecentboeing0<nboeing Then 
	  irecentboeing0+=1
	  recentboeingid0(irecentboeing0)=id
	EndIf   
	k+=1:If k>nboeing2 Then Exit For
	nboeingmodel=nboeingmodel0(i) 
	nboeingv=nnboeingv(i)
	If dt4<0.000001 Then 
	 nboeingx=nnboeingx(i)+nnboeingdx(i)*dt
	 nboeingy=nnboeingy(i)+nnboeingdy(i)*dt
	Else
	 nboeingx=nnboeingx(i)+Cos(nnboeingo1(i)*degtorad)*nboeingv*dt
	 nboeingy=nnboeingy(i)+Sin(nnboeingo1(i)*degtorad)*nboeingv*dt
	EndIf 
	nnboeingx(i)=nboeingx
	nnboeingy(i)=nboeingy
	If nboeingv>v8000+300 Then'Or max(Abs(nboeingx-mx),Abs(nboeingy-my))>50000 Then
		nboeingz=nnboeingz(i)+nnboeingdz(i)*dt
		nboeingzsol=getterrainheight(nboeingx,nboeingy)
		Var nboeingzz=max(nboeingzsol+2000,nnnboeingz(i)+nnboeingdz(i))
		nnboeingdz(i)=nboeingzz-nboeingz
	   nnboeingz(i)=nboeingz
		'auxvar4=max(Abs(nnboeingdx(i)),Abs(nnboeingdy(i)))
		'nnboeingv(i)=min(nboeingv,max(Abs(nnboeingdx(i)),Abs(nnboeingdy(i))))
	ElseIf max(Abs(nboeingx-mx),abs(nboeingy-my))<35000 Then 
		'Var nboeingzsol=getterrainheight(nboeingx,nboeingy)
		nboeingzsol=getterrainheight(nboeingx,nboeingy)
		nboeingz=max(nboeingzsol,nnboeingz(i)+min(-8*kfps,nnboeingdz(i)*dt))
		nnboeingz(i)=nboeingz
		nnboeingdz(i)=-5000
		If nboeingz<nboeingzsol+1 Then nnboeingdz(i)=0
	Else 	
		nboeingz=nnboeingz(i)
	EndIf 
	If dt4>0.000001 Then 
	   nboeingo1=nnboeingo1(i)+nnboeingdo1(i)*dt4
	   nboeingo2=nnboeingo2(i)+nnboeingdo2(i)*dt4
	Else
		nboeingo1=nnnboeingo1(i)+nnboeingdo1(i)
		nboeingo2=nnnboeingo2(i)+nnboeingdo2(i)
	EndIf
	'distmin=min(distmin,max(Abs(nboeingx-mx),Abs(nboeingy-my)))
	var dnboeingo3=0.0'nnboeingo3(i)+nnboeingdo3(i)*dt
	If dt4>0.000001 And nboeingv>v8000 Then dnboeingo3=max(-30.0,min(30.0,nnboeingdo1(i)*0.5))
	nboeingo3=nnboeingo3(i)+(dnboeingo3-nnboeingo3(i))*0.03*kfps
	drawnboeing()
	nnboeingo1(i)=nboeingo1
	nnboeingo2(i)=nboeingo2
	nnboeingo3(i)=nboeingo3
 Next i
Next irecent
'auxvar=distmin
irecentboeing=irecentboeing0
For i=0 To irecentboeing
	recentboeingid(i)=recentboeingid0(i)
Next
End Sub
Sub drawnboeingradar(dx As Single,dy As single)
Dim As Integer i,j,k
Dim As Integer mapx,mapy,dmx,dmy
'Dim As Single dx=35,dy=85-15
'dx=xmax*0.60:dy=ymax*0.9
k=0
Var irecent=0
For irecent=0 To 1
 For i=0 To nboeing
     If nboeingid0(i)="" And nnboeingid(i)="" Then Continue For
     Var testrecent=0,id=nboeingid0(i)
     If id="" Then id=nnboeingid(i)
     For j=0 To irecentboeing
     	  If id=recentboeingid(i) Then
     	  	  testrecent=1:Exit For
     	  EndIf
     Next
     If irecent=0 Then
     	  If testrecent=0 Then Continue For
     Else
     	  If testrecent=1 Then Continue For 
     EndIf
     k+=1:If k>nboeing2 Then Exit For 
     dmx=nnboeingx(i)-mx:dmy=nnboeingy(i)-my
     'dmx=0:dmy=7000
     If Abs(dmx)<150000 And Abs(dmy)<150000 Then 
       dmx*=0.4:dmy*=0.4
       Var aux=Sqr(dmx*dmx+dmy*dmy)
       If aux<=60000 Then 
         mapx=57*((dmx*cos1+dmy*sin1)/(5000+aux))*ymax/471
         mapy=57*((-dmx*sin1+dmy*cos1)/(5000+aux))*ymax/471
         'If (mapx*mapx+mapy*mapy)<(50*50) Then
         If nboeingmodel0(i)="cessna" Then 
           If nnboeingz(i)<(mz+aux*0.15+300) Then
         	  glcolor3f(0.2,0.2,1)
           Else 
         	  glcolor3f(0.5,0.5,1)           	
           EndIf
         Else
           If nnboeingz(i)<(mz+aux*0.15+300) Then
         	  glcolor3f(0.7,0,0)
           Else 
         	  glcolor3f(1,0.3,0.3)           	
           EndIf
         EndIf 	
       	If nboeingmodel0(i)="fokker" Then
       		 gldrawtext("+", dx-mapy,dy-mapx,0.8)'0.6)'1.2 )    	
       	Else 
       		 gldrawtext(".", dx-mapy,dy-mapx,1.2)'0.6)'1.2 )    	
       	EndIf
         'EndIf
       EndIf
     EndIf 
 Next i	
Next irecent  
'auxvar2=k:'auxtest=0.2
'auxvar2=nboeing00
'auxtext=textload
End Sub
Sub drawnboeingshadow()
Dim As Integer i,j,k
Dim As Single dmx,dmy,dmz  
k=0
Var irecent=0
For irecent=0 To 1
 For i=0 To nboeing
     If nboeingid0(i)="" And nnboeingid(i)="" Then Continue For
     Var testrecent=0,id=nboeingid0(i)
     If id="" Then id=nnboeingid(i)
     For j=0 To irecentboeing
     	  If id=recentboeingid(i) Then
     	  	  testrecent=1:Exit For
     	  EndIf
     Next
     If irecent=0 Then
     	  If testrecent=0 Then Continue For
     Else
     	  If testrecent=1 Then Continue For 
     EndIf
     k+=1:If k>nboeing2 Then Exit For 
     dmx=nnboeingx(i)-mx:dmy=nnboeingy(i)-my:dmz=nnboeingz(i)-mz
     If max(Abs(dmx),Abs(dmy))>35000 Then Continue For
     rotavion(dmx,dmy,dmz)
     If Abs(x2)<25000 Then 
      Var boeingzsol=getterrainheight(nnboeingx(i),nnboeingy(i))  
      If x2>-1000-(nnboeingz(i)-boeingzsol)*suntan2 Then 
        Var boeingco2=Cos(degtorad*nnboeingo2(i))
        Var boeingco3=Cos(degtorad*nnboeingo3(i))
        Var boeingco1=Cos(degtorad*nnboeingo1(i))
        Var boeingsi1=Sin(degtorad*nnboeingo1(i))
        If nboeingmodel0(i)="cessna" Then
        	 Var scale=1.3
          drawc150shadow(nnboeingx(i),nnboeingy(i),nnboeingz(i),boeingzsol,scale,boeingco1,boeingsi1,boeingco2,boeingco3)   
        ElseIf nboeingmodel0(i)="fokker" Then  
        	 drawfokkershadow(nnboeingx(i),nnboeingy(i),nnboeingz(i),boeingzsol,4.5,boeingco1,boeingsi1,boeingco2,boeingco3)   
        Else 
        	 draw737shadow(nnboeingx(i),nnboeingy(i),nnboeingz(i),boeingzsol,4.5,boeingco1,boeingsi1,boeingco2,boeingco3)   
        EndIf
      EndIf   
     EndIf 
 Next i
Next irecent 
	
End Sub













