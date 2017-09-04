'' Curl HTTP Get example

#inclib "curldll"
#Include once "curl.bi"
#include once "crt/string.bi"

Dim Shared As String*12500001 myztext
'Dim Shared As Byte recvdata(12512001)
'Dim Shared As Integer tquitweb=0
Dim Shared As Integer myidata
'' this callback will be called when any data is received
'Private Function write_callback CDecl _
Static Shared As ZString Ptr zstr = 0
Static Shared As Integer maxbytes = 0
Function write_callback CDecl _
    ( _
        ByVal buffer As Byte Ptr, _
        ByVal size As Integer, _
        ByVal nitems As Integer, _
        ByVal outstream As Any Ptr _
    ) As Integer


    Dim As Integer i,bytes = size * nitems

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
    If bytes<12500000-myidata Then
    	'myztext+=*zstr
      For i=0 To bytes-1
      	recvdata(myidata)=buffer[i]
      	myidata+=1
      	httpidata=myidata
      Next
    Else
    	myidata=0:Return 0
    EndIf
    
    If tquitweb=1 Or quit=1 Then myidata=0:Return 0 'stop
    Return bytes
End Function

    '' init
    myztext=""+Chr(0)
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
    res=curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L)'no verify'1L)
    '?"CURLOPT_SSL_VERIFYPEER "+Str(res)
    If useragent="" Then useragent="freewebcar_chung"+Str(Int(Rnd*1000))
    res=curl_easy_setopt(curl, CURLOPT_USERAGENT, useragent)
    'guinotice "CURLOPT_USERAGENT "+Str(res)
    '' execute..
    Var retcode=curl_easy_perform( curl )
    '?"retcode="+Str(retcode)
    If retcode<>0 Then
    	If auxtest>1.01 Then guinotice "error curl="+Str(retcode)+"  "+url'curl_easy_strerror(retcode))
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
If tquitweb=1 Or quit=1 Then Return 0
'guinotice Str(myidata)
   httpon=0
   If InStr(LCase(httphost),"google")>0 And InStr(UCase(Left(recvbuffer,30)),"HTTP")>0 Then
   	httpon=-1:httpidata=-httpidata:Return 0
   EndIf
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
    
    
    
    
    
    
    
    
    
    
    
