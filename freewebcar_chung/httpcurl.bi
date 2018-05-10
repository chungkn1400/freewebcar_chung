'' Curl HTTP Get example

#inclib "curldll"
#Include once "curl.bi"
#include once "crt/string.bi"

'Dim Shared As String*12500100 myztext
'Dim Shared As Byte recvdata(12512001)
'Dim Shared As Integer tquitweb=0
Dim Shared As Integer myidata
'' this callback will be called when any data is received
'Private Function write_callback CDecl _
Dim Shared As ZString Ptr zstr = 0
Dim Shared As Integer maxbytes = 0, ibyte,ibytes
Function write_callback CDecl _
    ( _
        ByVal buffer As Byte Ptr, _
        ByVal size As Integer, _
        ByVal nitems As Integer, _
        ByVal outstream As Any Ptr _
    ) As Integer


    ibyte=0:ibytes = size * nitems

    '' current zstring buffer too small?
    'If( maxbytes < bytes ) Then
    '    zstr = Reallocate( zstr, bytes + 1 )
    '    maxbytes = bytes
    'End If

    '' "buffer" is not null-terminated, so we must dup it and add the null-term
    'memcpy( zstr, buffer, bytes )
    'zstr[bytes] = 0

    '' just print it..
    '? Left(*zstr,100)
    If ibytes<12500000-myidata And ibytes>0 Then
    	'myztext+=*zstr
      For ibyte=0 To ibytes-1
      	recvdatacurl(myidata)=buffer[ibyte]
      	myidata+=1
      	httpidata=myidata
      Next
    ElseIf ibytes>0 Then 
    	myidata=0:Return 0
    EndIf
    
    If tquitweb=1 Or quit=1 Then myidata=0:Return 0 'stop
    Return ibytes
End Function

    '' init
    'myztext=""+Chr(0)
    myidata=0
    'Var curlglob= curl_global_init(CURL_GLOBAL_DEFAULT)
    ''?"CURL_GLOBAL_DEFAULT "+Str(curlglob)
    

    '' set url and callback
    Var url="freebasic.net" 
	 url="https://chungkn1400.github.io/mysrtm/srtm/e20n40/lngE20latN0.js"
    'url="http://freebasic.net/"
    'url="https://www.google.fr/search?q=chungswebsite+blogspot&ie=utf-8&oe=utf-8&gws_rd=cr&ei=S4A2WMmaE4ejU-v1n8gP"
Dim Shared As String useragent   
Function httppostcurl(ByRef host As String,ByRef path As String)As Integer
If tquitweb=1 Then Return 0
Dim As Integer i,j,k
Var url=host
    If Left(path,1)="/" Then
    	url=url+path
    Else
    	url=url+"/"+path
    EndIf
    If Left(url,4)<>"http" Then
    	If InStr(LCase(url),"google")>0 Then
    		url="https://"+url
    	ElseIf InStr(LCase(url),"overpass")>0 Or InStr(LCase(url),"openstreetmap")>0 Then
    		'url=Left("https://"+url,4000)'"overpass-api.de/api/interpreter?"'url
    		url="https://"+url'"overpass-api.de/api/interpreter?"'url
    	Else 	
    		url="http://"+url
    	EndIf
    EndIf
    'myztext=""+Chr(0)
    myidata=0
    Dim As CURL Ptr curl = curl_easy_init( )
    If( curl = 0 ) Then
    	  guinotice "error open curl"
    	  Sleep 500
        Return 0
    End If
    Var res=curl_easy_setopt( curl, CURLOPT_URL, url)
    res=curl_easy_setopt( curl, CURLOPT_WRITEFUNCTION, @write_callback )
    res=curl_easy_setopt(curl, CURLOPT_BUFFERSIZE, 100000L)
    If InStr(url,"https")>0 Then res=curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L)'no verify'1L)
    '?"CURLOPT_SSL_VERIFYPEER "+Str(res)
    If InStr(url,"google")<=0 Then
    	useragent="freewebcar_chung"'+Str(Int(Rnd*1000))
    Else
      useragent="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.186 Safari/535.1"
    EndIf 
    res=curl_easy_setopt(curl, CURLOPT_USERAGENT, useragent)
    'guinotice "CURLOPT_USERAGENT "+Str(res)
    res=curl_easy_setopt( curl, CURLOPT_FAILONERROR, 1L)
    '' execute..
    
    myidata=0
    Var retcode=curl_easy_perform( curl )
    /'If retcode<>0 Then
    	Sleep 2000
    	guinotice "curl code="+Str(retcode)
    	myidata=0
    	retcode=curl_easy_perform( curl )
    EndIf
    If retcode<>0 Then
    	Sleep 2000
    	guinotice "curl code="+Str(retcode)
    	myidata=0
    	retcode=curl_easy_perform( curl )
    EndIf '/

    'guinotice "retcode="+Str(retcode)
    If retcode<>0 Then
    	If auxtest>0.61 Then guinotice "error curl="+Str(retcode)+"  "+url'curl_easy_strerror(retcode))
    	myidata=0
    EndIf
    'myztext+=Chr(0)
    '?"len="+Str(Len(myztext))+" myztext="+Left(myztext,100)

    '' shutdown
    curl_easy_cleanup( curl )
    
    'curl_global_cleanup()
    'For i=0 To myidata
    '	recvdata(i)=myztext[i]
    'Next
    
    If myidata>=0 Then 
     For i=0 To 10
      	recvdatacurl(myidata+i)=0
     Next
    EndIf  
    
If tquitweb=1 Or quit=1 Then Return 0
'guinotice url+"="+Str(myidata)
   httpon=0
   /'If InStr(LCase(httphost),"nominatim")>0 Then 'And InStr(UCase(Left(recvbuffer,30)),"HTTP")>0 Then
      guinotice url+"="+Str(myidata)
   	For i=0 To 500
   		recvbuffer[i]=recvdatacurl(i)
   	Next
   	If auxtest>-0.68 Then guinotice Left(recvbuffer,500)
   	'httpon=-1:httpidata=-httpidata:Return 0
   EndIf'/
Return myidata
End Function 
/'
    Var thost="freebasic.net"
    Var tpath="" 
	 'host="https://chungkn1400.github.io":path="/mysrtm/srtm/e20n40/lngE20latN0.js"
    
    tquitweb=0
    Var idata=httppost(thost,tpath)
    '?"idata="+Str(idata)
    For i=0 To idata:myztext[i]=recvdata(i):next
    guinotice Str(idata)+"/"+Str(recvdata(idata))+" "+left(myztext,200)
    
    Sleep 300
	 thost="https://chungkn1400.github.io":tpath="/mysrtm/srtm/e20n40/lngE20latN0.js"
    idata=httppost(thost,tpath)
    For i=0 To idata:myztext[i]=recvdata(i):next
    guinotice Str(idata)+"/"+Str(recvdata(idata))+" "+left(myztext,200)
    '?Str(recvdata(idata))
    'Sleep 5000
    
    thost="overpass-api.de"
    tpath="/api/interpreter?data=[out:json];"
    tpath+="%29%3Bout%20skel%2029999%3B"
    idata=httppost(thost,tpath)
    For i=0 To idata:myztext[i]=recvdata(i):next
    guinotice Str(idata)+"/"+Str(recvdata(idata))+" "+left(myztext,200)
    
    '/
    
    
    
    
    
    
    
    
    
    
    
