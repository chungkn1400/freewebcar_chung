''
'' simple http-post example for Windows 
''
#Ifdef __FB_WIN32__
#include once "win/winsock2.bi"
/'#else
#include once "crt/netdb.bi"
#include once "crt/sys/socket.bi"
#include once "crt/netinet/in.bi"
#include once "crt/arpa/inet.bi"
#include once "crt/unistd.bi"
'/
#EndIf

const RECVBUFFLEN = 200000'8192
const NEWLINE = !"\r\n"
Const DEFAULT_HOST = "www.freebasic.net"

declare sub doInit( )
declare sub doShutdown( )
declare sub getHostAndPath _
	( _
		byref src as string, _
		byref hostname as string, _
		byref path as string _
	)
declare function resolveHost( byref hostname as string ) as integer
declare sub reportError( byref msg as string )

/'dim Shared hostname as string
dim Shared path as string

Dim As Single lat=48.0,lon=2.0
Dim As String weatherurl="http://api.openweathermap.org/data/2.5/weather?lat="+Str(lat)+"&lon="+Str(lon)
hostname="http://www.freebasic.net"'api.openweathermap.org/data/2.5/"'weather?lat="+Str(lat)+"&lon="+Str(lon)

hostname="http://api.hostip.info/get_json.php?position=true"
path=""'weatherurl


hostname="http://overpass-api.de/api/interpreter?data=[out:json];%28node%28371597318%29;node%28371597317%29%29%3Bout%20skel%209%3B"
path=""

hostname="overpass-api.de"
path="/api/interpreter?data=[out:json];%28node%28371597318%29;node%28371597317%29%29%3Bout%20skel%209%3B"

hostname="api.openweathermap.org"
path="/data/2.5/weather?lat="+Str(lat)+"&lon="+Str(lon)


hostname="en.wikipedia.org"
'path="/w/api.php?action=opensearch&search="+wikikeysearch+"&limit=5&namespace=0&format=json&redirects=resolve&callback=mywikicallback";
path="/w/api.php?action=opensearch&search="+"lennon"+"&limit=5&namespace=0&format=json&redirects=resolve"
'/

Dim Shared As UByte recvdata(12512016)
Dim Shared As UByte recvdatagoogle(4000016)
Dim Shared As UByte recvdataboeing(400016)
Dim Shared As UByte recvdatacurl(12512016)
Dim Shared As Integer tquitweb=0,httpon,httpidata,webidata,googleerror=1,tgoogle=1,icurl,myhttpon
Dim Shared As Byte tlockchanged,httplock,myhttplock
Dim Shared As String httphost
Dim Shared as ZString * RECVBUFFLEN+2 recvbuffer
Dim Shared As Integer cdatagoogle0,cdatagoogle
cdatagoogle0=CInt(@recvdatagoogle(0))
cdatagoogle=0'16-(cdatagoogle0 Mod 16)
'guinotice Str((cdatagoogle0+cdatagoogle) Mod 16)
Declare Function httppostcurl(ByRef hostname0 As string,ByRef path As string)As Integer'String
Function httppost(ByRef hostname0 As string,ByRef path As string)As Integer'String
Dim As Integer iwait,i
   httplock=1
   myhttplock=1
   httphost=hostname0
   Sleep 100
   If httpon<>0 And httpon<>-1 Then
   	For iwait=1 To 100
   		Sleep 100
   		If httpon=0 Or httpon=-1 Then Exit For 
   	Next
   EndIf
   If httpon<>0 And httpon<>-1 Then
   	If auxtest>0.19 Then guinotice "http busy"
   	httplock=0:Return 0
   EndIf
   httpon=1
   'tlockchanged=1
   Sleep 100
   httplock=0
   icurl= httppostcurl(hostname0,path)
   'If InStr(hostname0,"google")>0 Then auxvar+=1:auxtest=0.2
   httplock=1
   myhttplock=1
   If InStr(hostname0,"google")>0 Or InStr(hostname0,"virtualearth")>0 Then
      icurl=min2(icurl,4000000)
      For i=0 To icurl
      	recvdatagoogle(i+cdatagoogle)=recvdatacurl(i)
      Next
   ElseIf InStr(hostname0,"adsbexchange")>0 Then
      icurl=min2(icurl,400000)
      For i=0 To icurl
      	recvdataboeing(i)=recvdatacurl(i)
      Next
   Else 
   	icurl=min2(icurl,12500000)
      For i=0 To icurl
      	recvdata(i)=recvdatacurl(i)
      Next
   EndIf
   httpon=myhttpon
   If httpon<>-1 Then httpon=0
   httplock=0
   Return icurl
   
   /'
   If tquitweb=1 Then Return 0 
	doInit( )
   Var hostname=hostname0
	'' check command-line
	'getHostAndPath( command( ), hostname, path )
	if( len( hostname ) = 0 ) then
		hostname = DEFAULT_HOST
	end if

	'' resolve name
	dim ip as integer
	dim s as SOCKET

	ip = resolveHost( hostname )
	if( ip = 0 ) then
		guinotice "resolveHost(): invalid address"
		'quit=1':end 1
	end if

	'' open socket
	s = opensocket( AF_INET, SOCK_STREAM, IPPROTO_TCP )
	if( s = 0 ) then
		reportError( "socket()" )
		Return 0
		'quit=1'Sleep:end 1
	end if

	'' connect to host
	dim sa as sockaddr_in
	sa.sin_port        = htons( 80 )
	sa.sin_family      = AF_INET
	sa.sin_addr.S_addr = ip

	if( connect( s, cast( PSOCKADDR, @sa ), sizeof( sa ) ) = SOCKET_ERROR ) then
		reportError( "connect()" )
		closesocket( s )
		Return 0
		'Sleep:end 1
	end if

	'' send HTTP request
	dim sendbuffer as string
	sendBuffer = "GET /" + path + " HTTP/1.0" + NEWLINE + _
	             "Host: " + hostname + NEWLINE + _
	             "Connection: close" + NEWLINE + _
	             "User-Agent: GetHTTP 0.0" + NEWLINE + _
	             NEWLINE
	/'sendBuffer = "POST /" + path + " HTTP/1.0" + NEWLINE + _
	             "Host: " + hostname + NEWLINE + _
	             "Connection: close" + NEWLINE + _
	             "User-Agent: GetHTTP 0.0" + NEWLINE + _
	             NEWLINE
   '/

	if( send( s, sendBuffer, len( sendBuffer ), 0 ) = SOCKET_ERROR ) then
		reportError( "send()" )
		closesocket( s )
		Return 0
		'quit=1'Sleep:end 1
	end if

	'' receive until connection is closed
	'Dim recvbuffer as ZString * RECVBUFFLEN+1
	dim bytes as Integer
	Dim As String recvtext
	'Dim As Byte recvdata(512000)
	Dim As Integer testdata=0,i,j,k=0,idata=0,mode=1,nError
	ioctlsocket(s,FIONBIO,@mode)'nonblocking socket
   
   httpon=2
    
	Do  
		nError=0
		Do 
		 bytes = recv( s, recvBuffer, RECVBUFFLEN, 0 )
		 nError=WSAGetLastError()
		 If(nError<>WSAEWOULDBLOCK And nError<>0)Then Exit Do
		 If(nError=0)Or tquitweb=1 Then Exit Do
		 Sleep 30 
		Loop
		
		If (nError<>WSAEWOULDBLOCK And nError<>0)Or tquitweb=1 Then
			idata=0:exit do
		end If
		If bytes<=0 Then Exit Do

		'' add the null-terminator
		recvbuffer[bytes] = 0

		'' print buffer as a string
		'Print recvbuffer
		'recvtext+=recvbuffer
		If testdata=0 Then
			Var itag=InStr(recvbuffer,newline+newline)
			If itag>0 Then
				testdata=itag+Len(newline+newline)
				For i=testdata-1 To bytes-1
					If idata<12512000 Then 
					   recvdata(idata)=recvbuffer[i]
					   idata+=1
					   httpidata=idata
					   If recvbuffer[i]=0 Then k+=1
					Else
						idata=0:Exit Do
					EndIf    
				Next
			EndIf
		ElseIf bytes>0 Then 
				For i=0 To bytes-1
					If idata<7512000 Then 
					   recvdata(idata)=recvbuffer[i]
					   idata+=1
					   If recvbuffer[i]=0 Then k+=1
					Else
						idata=0:Exit Do
					EndIf    
				Next			
		EndIf
		If tquitweb=1 Then idata=0:Exit do
	loop

	'Print
	'Sleep
	'Print "recvbuffer="+recvbuffer
	'Print "data="+Mid(recvtext,InStr(recvtext,newline+newline)+Len(newline+newline),10)
	'Print "datalength="+Str(idata)+"  nbzeros="+Str(k)
	'Print "datalength="+Str(Len(recvdata))
	'Print 
	

	'' close socket
	shutdown( s, 2 )
	closesocket( s )

	doShutdown( )
   'guinotice Str(idata)
   httpon=0
   If InStr(LCase(httphost),"google")>0 And InStr(UCase(Left(recvbuffer,30)),"HTTP")>0 Then
   	httpon=-1:httpidata=-httpidata:Return 0
   EndIf
	Return idata'recvtext
	'/
End Function 


sub getHostAndPath _
	( _
		byref src as string, _
		byref hostname as string, _
		byref path as string _
	)

	dim p as integer = instr( src, " " )
	if( p = 0 or p = len( src ) ) then
		hostname = trim( src )
		path = ""
	else
		hostname = trim( left( src, p-1 ) )
		path = trim( mid( src, p+1 ) )
	end if

end sub

function resolveHost( byref hostname as string ) as integer

	dim ia as in_addr
	dim hostentry as hostent ptr

	'' check if it's an ip address
	ia.S_addr = inet_addr( hostname )
	if ( ia.S_addr = INADDR_NONE ) then
		
		'' if not, assume it's a name, resolve it
		hostentry = gethostbyname( hostname )
		if ( hostentry = 0 ) then
			Exit function
		end if
		
		function = *cast( integer ptr, *hostentry->h_addr_list )
	else
		'' just return the address
		function = ia.S_addr
	end if

end function

sub reportError( byref msg as string )
#ifdef __FB_WIN32__
	'print msg; ": error #" & WSAGetLastError( )
	If auxtest>1.01 Then guinotice(msg+ ": error #" + Str(WSAGetLastError( )))
	'quit=1
#Else
	perror( msg )
#endif
end sub

sub doInit( )
#ifdef __FB_WIN32__
	'' init winsock
	dim wsaData as WSAData
	if( WSAStartup( MAKEWORD( 1, 1 ), @wsaData ) <> 0 ) then
		'print "Error: WSAStartup failed"
		guinotice "Error: Websocket startup failed"
		'quit=1'end 1
	end if
#endif
end sub

sub doShutdown( )
#ifdef __FB_WIN32__
	'' quit winsock
	WSACleanup( )
#endif
end sub
