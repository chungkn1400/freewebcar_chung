' gui_chung a program by NGUYEN.Chung (freeware 2010)
#Include Once "windows.bi"
#Include Once "win/commctrl.bi"
#Include Once "win/commdlg.bi"
#Include Once "win/shellapi.bi"
#Include Once "file.bi"
#include Once "GL/gl.bi"
#Include Once "GL/glu.bi"
#Include Once "GL/glext.bi"
#Include Once "fbgfx.bi"

#Ifndef noguijpeg
'#Inclib "./jpeg" 'jpeg.dll by Alyce Watson
'Declare function hbmpjpg Cdecl alias "LoadImageFile" (ByVal hwin As hwnd,Byval filename As ZString ptr) As hbitmap
Dim Shared hbmpjpg As Function(ByVal hwin As hwnd,Byval filename As ZString ptr) As hbitmap
Function hbmpjpg0(ByVal hwin As hwnd,Byval filename As ZString ptr) As hbitmap
Return 0
End Function 
'Declare Function hbmpX Cdecl Alias "ImageWidth" (ByVal hbmp as hbitmap) as uint 
'Declare Function hbmpY Cdecl Alias "ImageHeight" (ByVal hbmp as hbitmap) as uint
#EndIf 
Sub guinotice(ByRef msg As string,ByRef title As String ="notice")
Dim As HWND hwin
ScreenControl(2, Cast(Integer,hwin)) 'get screen handle
	messagebox(hwin,msg,title,MB_TASKMODAL Or 0)
   Sleep 200
End Sub
Sub guiconfirm(ByRef msg As string,ByRef title As string,ByRef resp As String)
Dim As HWND hwin
ScreenControl(2, Cast(Integer,hwin)) 'get screen handle
	Dim i As Integer
	i=messagebox(hwin,msg,title,MB_TASKMODAL Or 1)
	If i=1 Then resp="yes" Else resp="no"
   Sleep 200
End Sub
Function max2(ByVal i As Integer,ByVal j As Integer)As Integer
	If i>=j Then Return i Else Return j
End Function
Function min2(ByVal i As Integer,ByVal j As Integer)As Integer
	If i<=j Then Return i Else Return j
End Function

Dim Shared As uint guifont1=ANSI_FIXED_FONT ' Windows fixed-pitch (monospace) system font.
Dim Shared As uint guifont2=ANSI_VAR_FONT   ' Windows variable-pitch (proportional space) system font.
Dim Shared As uint guifont3=DEVICE_DEFAULT_FONT' Windows NT only: Device-dependent font.
Dim Shared As uint guifont4=DEFAULT_GUI_FONT ' Windows 95 only: Default font for user interface objects such Shared As menus and dialog boxes.
Dim Shared As uint guifont5=OEM_FIXED_FONT   ' Original equipment manufacturer (OEM) dependent fixed-pitch (monospace) font.
Dim Shared As uint guifont6=SYSTEM_FONT      ' System font. By default, Windows uses the system font to draw menus, dialog box controls, and text. In Windows versions 3.0 and later, the system font is a proportionally spaced font; earlier versions of Windows used a monospace system font.
Dim Shared As uint guifont7=SYSTEM_FIXED_FONT' Fixed-pitch (monospace) system font used in Windows versions earlier than 3.0. This stock object is provided for compatibility with earlier versions of Windows.

Dim Shared As uint guiscreenx,guiscreeny,guidepth
ScreenInfo guiscreenx,guiscreeny,guidepth
#If Not Defined(guinogfx)
  ScreenRes guiscreenx,guiscreeny,guidepth,2,fb.gfx_null'-1
#EndIf 
Dim Shared As bitmapv4header guigfxinfo
With guigfxinfo
      .bV4Size = SizeOf(BITMAPV4HEADER)
      .bv4width=guiscreenx
      .bv4height=-guiscreeny 'negative value=>top to bottom bmp
      '(standard BMP's are bottom to top)
      .bv4planes=  1
      .bv4bitcount=guidepth
      .bv4v4compression=0
      .bv4sizeimage=guiscreenx*guiscreeny*guidepth/8'mywin.right+1*mywin.bottom+1*4
      .bV4RedMask = &h0F00
      .bV4GreenMask = &h00F0
      .bV4BlueMask = &h000F
      .bV4AlphaMask = &hF000
End With	

Dim Shared As uint ngui,igui,iguiwindow,nguiwindow,iguicontrol,guiinit=0,nguimax=900
Dim Shared guihinstance As HMODULE
'GetModuleHandleEx(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS,@guihinstance,@guihinstance)
GetModuleHandleEx(4,Cast(Any Ptr,@guihinstance),@guihinstance)
'guinotice Str(guihinstance)
If guihinstance=0 Then guihinstance=GetModuleHandle(NULL)
#Ifndef noguijpeg
Dim As ZString*255 dllname
GetModuleFileName(guihinstance, dllname, 250)
Var guicurdir1=Left(dllname,InStrRev(dllname,"\")-1)
Dim Shared As Any Ptr hjpeg
If hjpeg=0 Then hjpeg=DyLibLoad(guicurdir1+"/jpeg.dll")
If hjpeg<>0 Then hbmpjpg=DylibSymbol(hjpeg,"LoadImageFile")
If hjpeg=0 Or hbmpjpg=0 Then hbmpjpg=@hbmpjpg0()
#EndIf 
Const guiClassName="GUICHUNG"
Dim Shared As HWND guihwindow(nguimax)
Dim Shared As HWND guihcontrol(nguimax),guih
Dim Shared As String guiwindowname(nguimax)
Dim Shared As uint guiwindowtype(nguimax)
Dim Shared As uint guiwindowtypeex(nguimax)
Dim Shared As HMENU guiwindowhmenu(nguimax)
Dim Shared As Sub() guicontrolsub(nguimax),guitrapclosesub(nguimax),guiresizesub(nguimax)
Dim Shared As Sub() guikeyboardsub(nguimax)
Dim Shared As String guicontrolname(nguimax)
Dim Shared As String guicontrolwind(nguimax)
Dim Shared As String guicontroltype(nguimax)
Dim Shared As String guicontroltext(nguimax)
Dim Shared As uint guicontrolstyle(nguimax),guicontrolstyleadd
Dim Shared As uint guicontrolx(nguimax),guicontroly(nguimax)
Dim Shared As uint guicontroldx(nguimax),guicontroldy(nguimax)
Dim Shared As String guicontroltypeadd,guiwindowadd,guiwindowtext(nguimax) 
Dim Shared As uint guiwindowx=10,guiwindowy=10,guiwindowdx=200,guiwindowdy=100
Dim Shared As uint guicommand,guiopenwin(nguimax)
Dim Shared As HICON guihIcon,guicontrolhicon(nguimax)
Dim Shared As String guificicon:guificicon=CurDir+"/gui_chung.ico"
Dim Shared As ZString * 4000 guibuffer
Dim Shared As String guitype
Dim Shared As uint guiwindowflag
Dim Shared As uint nguiusersubmax=10000 
Dim Shared As Sub() guiusersub(nguiusersubmax)
Dim Shared As uint guiwindowdefautflag=WS_SYSMENU or WS_MINIMIZEBOX 'or WS_DLGFRAME 'or WS_MAXIMIZEBOX 
Dim Shared As HWND guihwin
Dim shared As Lparam guiLparam
Dim Shared As Wparam guiWparam
Dim Shared As uint guikeyboard,guimsg
Dim Shared As hbrush guiBrush,guibrushedittext,guibrushlistbox
Dim Shared As uint guibackcolor=0,guiedittextcolor=bgr(255,255,255),guilistboxcolor=bgr(255,255,255)
Dim Shared As uint guistatictextink=bgr(0,0,0),guiedittextink=bgr(0,0,0),guilistboxink=bgr(0,0,0)
Dim Shared As hfont guiedittextfont=0,guistatictextfont=0,guilistboxfont=0,guibuttonfont=0
Dim Shared As hbitmap guicontrolhbmp(nguimax)
Dim shared As Any Ptr guigfxbuffer(nguimax)
Dim Shared As Integer guimousex,guimousey,guikeyreturn,guimousewheelrot
Dim Shared As Sub() guileftmousesub(nguimax),guirightmousesub(nguimax),guimovemousesub(nguimax)
Dim Shared As Sub() guileftmouseupsub(nguimax),guirightmouseupsub(nguimax),guimousewheelsub
Dim shared as hwnd guiopenglhwin
dim shared as hdc  guiopenglwindc
Dim Shared As hGLRC guiopenglhRC
Dim Shared As hdc guiwindc0=0
Dim Shared As uint guiopenglfontlist=99000
Dim Shared As String guichar


Declare Sub guiclose(ByRef opt As String = "nomsg")
Sub guireset()
#Ifndef noguijpeg
Dim As ZString*255 dllname
GetModuleFileName(guihinstance, dllname, 250)
Var guicurdir1=Left(dllname,InStrRev(dllname,"\")-1)
If hjpeg=0 Then hjpeg=DyLibLoad(guicurdir1+"/jpeg.dll")
If hjpeg<>0 Then hbmpjpg=DylibSymbol(hjpeg,"LoadImageFile")
If hjpeg=0 Or hbmpjpg=0 Then hbmpjpg=@hbmpjpg0()
#EndIf 
Dim As uint i
If guiinit<>0 Then guiclose
If FileExists(guificicon) Then
	If guihicon<>0 Then destroyicon(guihicon)
	guihicon=ExtractIcon(guihinstance,guificicon,0)
Else 
	guificicon=Space(255)+Chr(0) 
	getmodulefilename(0,guificicon,255)
	If guihicon<>0 Then destroyicon(guihicon)
	guihicon=ExtractIcon(guihinstance,guificicon,0)	
EndIf
If guihicon<=1 Then guihicon=0
If guibrushedittext<>0 Then	DeleteObject guibrushedittext
guibrushedittext=CreateSolidBrush(guiedittextcolor)
If guibrushlistbox<>0 Then DeleteObject guibrushlistbox
guibrushlistbox=CreateSolidBrush(guilistboxcolor)

ngui=0:nguiwindow=0
For igui=0 To nguimax
	guicontrolname(igui)=""
	guiwindowname(igui)=""
	guicontrolsub(igui)=0 
	guicontrolwind(igui)=""
	guihwindow(igui)=0
	guiwindowhmenu(igui)=0
	guiopenwin(igui)=0
	guitrapclosesub(igui)=0
	guileftmousesub(igui)=0
	guirightmousesub(igui)=0
	guileftmouseupsub(igui)=0
	guirightmouseupsub(igui)=0
	guimovemousesub(igui)=0
	guimousewheelsub=0
	guiresizesub(igui)=0
	guikeyboardsub(igui)=0
	guicontrolhicon(igui)=0
	guicontrolhbmp(igui)=0
	guigfxbuffer(igui)=0
Next igui
For i=0 To nguiusersubmax
	guiusersub(i)=0
Next
End Sub
guireset()
#Ifndef noguijpeg
Function guiloadimage(ByRef filename As String) As hbitmap
        'Supported types; bmp,emf,wmf,jpg,ico,gif
If FileExists(filename)=0 Then Return 0 
Dim As ZString * 256 ficname
Dim As hbitmap ret
ficname=Left(filename,250)
ret=hbmpjpg(0,@ficname)
'guinotice(Str(ret),"hbmpjpg")
'Dim As uint x,y:If ret<>0 Then x=hbmpx(ret):y=hbmpy(ret):guinotice(Str(x)+" "+Str(y))
If ret=0 then guinotice("erreur loadimage :"+filename,"guiloadimage")
Return ret 
End Function
Function guiloadbmp(ByRef filename As String) As hbitmap
Return guiloadimage(filename)
End Function 
#EndIf 
Function guiloadbmpdib(ByRef filename As String) As hbitmap
If FileExists(filename)=0 Then Return 0 
Dim As uint options= LR_LOADFROMFILE or LR_DEFAULTSIZE Or LR_CREATEDIBSECTION
Dim As hbitmap ret
ret=LoadImage(Cast(hinstance,0),filename,IMAGE_BITMAP,0,0, options )
If ret=0 then guinotice("erreur loadbmp :"+filename,"guiloadbmpdib")
Return ret 
End Function
Function guigetbmpdibbits(ByVal hbmp As hbitmap) As Any Ptr  
Dim As bitmap infobmp
Dim As uint linfobmp
Dim As Any Ptr ret
'zeromemory(@infobmp,SizeOf(infobmp))
linfobmp=sizeof(bitmap)
GetObject(hbmp, linfobmp , @infobmp)
'bmp0x=infobmp.bmpx
'bmp0y=infobmp.bmpy
ret=infobmp.bmbits  'adresse bmp data
Return ret 	
End Function
sub guigetbmpXY(ByVal bmpdc As hdc,ByRef bmpx As uint,ByRef bmpy As uint)
Dim As uint i=0,j=8000,k
k=j
while (j-i)>=2
  k=int((i+j)/2)
  if getpixel(bmpdc,k,0)<>-1 then i=k else j=k
wend
bmpx=max(1,j)
i=0:j=2000
k=j
while (j-i)>=2
  k=int((i+j)/2)
  if getpixel(bmpdc,0,k)<>-1 then i=k else j=k
wend
bmpy=max(1,j)
End Sub
Sub guiaddcontrol(ByRef controlname As String,Byref controltext As String,ByVal controlsub As Sub(),_ 
	    ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	    ByVal userflags As uint = 0)
Dim As uint i,old
 old=0
 For i=1 To ngui
 	If guicontrolname(i)=controlname Then
 		old=1
 		Exit For
 	EndIf
 Next i
 If old=0 Then
 	If ngui<nguimax Then
 		ngui+=1:i=ngui
 	Else 
 		guinotice(Str(nguimax)+" max ngui reached !","guinotice")
 		i=0
 	EndIf
 EndIf
 If i>0 Then 
  guicontroltype(i)=guicontroltypeadd
  guicontrolstyle(i)=guicontrolstyleadd
  If userflags<>0 Then guicontrolstyle(i)=userflags 
  guicontrolname(i)=controlname
  guicontrolwind(i)=Left(controlname,InStr(controlname,".")-1)
  guicontroltext(i)=controltext 
  guicontrolsub(i)=controlsub 
  guicontrolx(i)=controlx 
  guicontroly(i)=controly 
  guicontroldx(i)=controldx 
  guicontroldy(i)=controldy 
 EndIf
 If guicontrolwind(i)="" Then 
 	guinotice("invalid window control name : "+controlname+" !","guiaddcontrol")
 	i=0
 EndIf
 iguicontrol=i
End Sub
Sub button(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        ByVal userflags As uint = 0)
guicontroltypeadd="button"
guicontrolstyleadd=bs_text Or ws_border Or BS_PUSHBUTTON
guiaddcontrol(controlname,controltext,controlsub,_ 
	        controlx,controly,controldx,controldy,userflags)
End Sub 

Function getguiindex(ByRef controlname As String) As uint 
Dim As uint i,icontrol
 icontrol=0:guih=0
 guitype=""
 For i=1 To nguiwindow
 	If guiwindowname(i)=controlname Then
 	   icontrol=i
 	   guih=guihwindow(i)
 	   guitype="window"
 		Exit For
 	EndIf
 Next i
 If icontrol=0 Then 
   For i=1 To ngui
 	 If guicontrolname(i)=controlname Then
 	   icontrol=i
 	   guih=guihcontrol(i)
 	   guitype="control"
 		Exit For
 	 EndIf
   Next i
 EndIf   
Return icontrol
End Function 
Function getguih(ByRef controlname As String) As hwnd 
Dim As uint i,icontrol
 icontrol=0:guih=0
 For i=1 To nguiwindow
 	If guiwindowname(i)=controlname Then
 	   icontrol=i
 	   guih=guihwindow(i)
 		Exit For
 	EndIf
 Next i
 If icontrol=0 Then 
   For i=1 To ngui
 	 If guicontrolname(i)=controlname Then
 	   icontrol=i
 	   guih=guihcontrol(i)
 		Exit For
 	 EndIf
   Next i
 EndIf   
Return guih
End Function 
function getguihname(ByVal guihwin As hwnd) As String
Dim As uint i,iwindow
Dim guiname As String
iwindow=0:guiname=""
For i=1 To nguiwindow
	If guihwindow(i)=guihwin Then
		iwindow=i
		guiname=guiwindowname(i)
		Exit For 
	EndIf
Next i
If iwindow=0 Then
	For i=1 To ngui
		If guihcontrol(i)=guihwin Then
			iwindow=i
			guiname=guicontrolname(i)
			Exit For
		EndIf
	Next i
EndIf
Return guiname 
End Function
Sub printguih(ByVal hcontrol As hwnd,ByRef controltext As String)
 If hcontrol<>0 Then
 	SetWindowText(hcontrol,controltext)
 EndIf
End Sub
Sub printgui(Byref controlname As String,Byref controltext As String)
 printguih(getguih(controlname),controltext)
End Sub
Function guigettexth(ByVal hcontrol As hwnd) As String
Dim As uint i
 If hcontrol<>0 Then
 	guibuffer=Space(4000-1)+Chr(0)
 	i=getWindowText(hcontrol,guibuffer,4000)
 	If i=0 Then guibuffer=""
 Else 
 	guibuffer=""
 EndIf
 Return guibuffer
End Function
Function guigettext(Byref controlname As String) As String 
 Return guigettexth(getguih(controlname))
End Function 
Sub guirefresh
Dim As uint i
   For i=1 To nguiwindow
   	If guihwindow(i)<>0 Then
   		InvalidateRect ( guihwindow(i), NULL, TRUE )
   	EndIf
   Next
End Sub
Sub guirefreshwindow(ByRef windowname As String)
Dim As uint i,iwindow
 iwindow=0
 For i=1 To nguiwindow
 	If guiwindowname(i)=windowname Then
 	   iwindow=i
 		Exit For
 	EndIf
 Next i
 If iwindow>0 Then
		If guihwindow(iwindow)<>0 Then
			'invalidaterect(guihwindow(iwindow),NULL,TRUE ) 
         redrawwindow(guihwindow(iwindow),0,0,RDW_INVALIDATE )'or RDW_UPDATENOW)
		EndIf
 EndIf
End Sub
Sub guirefreshwindowh(Byval windowh As hwnd)
		If windowh<>0 Then
			'invalidaterect(guihwindow(iwindow),NULL,TRUE ) 
         redrawwindow(windowh,0,0,RDW_INVALIDATE )'or RDW_UPDATENOW)
		EndIf
End Sub
Sub guirefreshcontrolh(ByVal hcontrol As hwnd)
If hcontrol<>0 Then	
   redrawwindow(hcontrol,0,0,RDW_INVALIDATE Or RDW_ERASE )'Or RDW_UPDATENOW)
EndIf
End Sub
Sub guirefreshcontrol(Byref controlname As String)
	guirefreshcontrolh(getguih(controlname))
End Sub
Function guifont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE) As hfont
Dim As hfont hfont,myhfont
hfont=NULL:myhfont=NULL  
If fontnum=ANSI_FIXED_FONT Or _' Windows fixed-pitch (monospace) system font.
   fontnum=ANSI_VAR_FONT Or _' Windows variable-pitch (proportional space) system font.
   fontnum=DEVICE_DEFAULT_FONT Or _' Windows NT only: Device-dependent font.
   fontnum=DEFAULT_GUI_FONT Or _' Windows 95 only: Default font for user interface objects such as menus and dialog boxes.
   fontnum=OEM_FIXED_FONT Or _' Original equipment manufacturer (OEM) dependent fixed-pitch (monospace) font.
   fontnum=SYSTEM_FONT Or _' System font. By default, Windows uses the system font to draw menus, dialog box controls, and text. In Windows versions 3.0 and later, the system font is a proportionally spaced font; earlier versions of Windows used a monospace system font.
   fontnum=SYSTEM_FIXED_FONT _' Fixed-pitch (monospace) system font used in Windows versions earlier than 3.0. This stock object is provided for compatibility with earlier versions of Windows.
   Then
    hfont= GetStockObject(fontnum)
    If hfont<>0 Then 
      Dim As LOGFONT mylogFont
      GetObject ( hfont, sizeof(LOGFONT), @mylogfont )
      If size<>0 Then mylogfont.lfHeight=-size
      mylogfont.lfItalic=italic 
      myhfont = CreateFontIndirect ( @mylogfont )
      deleteobject(hfont)
      'guinotice(Str(mylogfont.lfHeight)+" "+Str(mylogfont.lfwidth),"myfont")
    EndIf 
EndIf 
If myhfont=0 Then myhfont=GetStockObject(DEFAULT_GUI_FONT)
Return myhfont 	
End Function
Sub setedittextfont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE)
	guiedittextfont=guifont(fontnum,size,italic)
	guirefresh
End Sub
Sub setstatictextfont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE)
	guistatictextfont=guifont(fontnum,size,italic)
	guirefresh
End Sub
Sub setlistboxfont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE)
	guilistboxfont=guifont(fontnum,size,italic)
	guirefresh
End Sub
Sub setbuttonfont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE)
	guibuttonfont=guifont(fontnum,size,italic)
	guirefresh
End Sub
Sub guiclosewindow(ByRef windowname As String)
Dim As uint i,iwindow
 iwindow=0
 For i=1 To nguiwindow
 	If guiwindowname(i)=windowname Then
 	   iwindow=i
 		Exit For
 	EndIf
 Next i
 If iwindow>0 Then
 	If guiopenwin(iwindow)=0 Then guinotice(windowname+" window yet closed !","guinotice")
   If guihwindow(iwindow)<>0 Then
   	DestroyWindow(guihwindow(iwindow))
   	If guiwindowhmenu(iwindow)<>0 Then 
   		destroymenu(guiwindowhmenu(iwindow))
   		guiwindowhmenu(iwindow)=0
   	EndIf
   EndIf
	For i=1 To ngui
	    If guicontrolwind(i)=windowname Then
	    	If guihcontrol(i)<>0 Then
	    		If guicontroltype(i)="menu" Then destroymenu(Cast(hmenu,guihcontrol(i)))
	    	EndIf
	   	guihcontrol(i)=0
	    EndIf
	Next i
	guihwindow(iwindow)=0
	guiwindowhmenu(iwindow)=0
	guiopenwin(iwindow)=0 
 EndIf 
End Sub  
Sub graphicbox(Byref controlname As String, _ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        ByRef graphtype As String = "gfx",ByVal userflags As uint = 0)
Dim As uint i
guicontroltypeadd="static"
guicontrolstyleadd= ss_blackframe'SS_BLACKRECT ' Or ss_bitmap'bs_ownerdraw
guiaddcontrol(controlname,"graphicbox",0,_ 
	        controlx,controly,controldx,controldy,userflags)
If graphtype="gfx" Then
   i=iguicontrol
	If guigfxbuffer(i)<>0 Then ImageDestroy guigfxbuffer(i)
	guigfxbuffer(i)=ImageCreate(controldx,controldy,RGB(0,0,0))
	'guinotice(Str(guigfxbuffer(i))+"  "+guicontrolname(i)+" i="+Str(i))
EndIf
End Sub 
Function getguigfxbuffer(ByRef controlname As String) As Any Ptr
Dim As uint i,icontrol
icontrol=0
For i=1 To ngui
	If guigfxbuffer(i)<>0 Then
		If guicontrolname(i)=controlname Then
			icontrol=i:Exit For
		EndIf
	EndIf
Next
if icontrol>0 then return guigfxbuffer(icontrol)
return 0
End Function
Function guiWndProc(ByVal hWin As HWND,ByVal uMsg As UINT,ByVal wParam As WPARAM,ByVal lParam As LPARAM) As Integer
Dim As uint i,iwindow
Dim As Integer mousex,mousey
Dim pnt As PAINTSTRUCT
Dim hDC As HDC
Select Case uMsg
   'Case WM_INITDIALOG
   Case WM_LBUTTONDOWN
      iwindow=0
      For i=1 To nguiwindow
      	If hwin = guihwindow(i) Then
      		iwindow=i:Exit For 
      	EndIf
      Next
      If iwindow>0 Then
      	mousex = LoWord(lParam) 
         mousey = HiWord(lParam)
      	'printgui("win.text2",guiwindowname(iwindow)+"   lmousedown "+Str(mousex)+" "+Str(mousey))
      	For i=1 To ngui
      		If guileftmousesub(i)<>0 Then
      			If guicontrolwind(i)=guiwindowname(iwindow) Then
      				If mousex>=guicontrolx(i) And mousex<=(guicontrolx(i)+guicontroldx(i)) Then
      				  If mousey>=guicontroly(i) And mousey<=(guicontroly(i)+guicontroldy(i)) Then
      				     guimousex=mousex-guicontrolx(i)
      				     guimousey=mousey-guicontroly(i)
      				     guileftmousesub(i)()
      				     Exit For 
      				  EndIf 	
      				EndIf
       			EndIf
      		EndIf
      	Next i        
      EndIf
      Return DefWindowProc(hWin,uMsg,wParam,lParam)

   Case WM_RBUTTONDOWN
      iwindow=0
      For i=1 To nguiwindow
      	If hwin = guihwindow(i) Then
      		iwindow=i:Exit For 
      	EndIf
      Next
      If iwindow>0 Then
      	mousex = LoWord(lParam) 
         mousey = HiWord(lParam)
      	'printgui("win.text2",guiwindowname(iwindow)+"   rmousedown "+Str(mousex)+" "+Str(mousey))
      	For i=1 To ngui
      		If guirightmousesub(i)<>0 Then
      			If guicontrolwind(i)=guiwindowname(iwindow) Then
      				If mousex>=guicontrolx(i) And mousex<=(guicontrolx(i)+guicontroldx(i)) Then
      				  If mousey>=guicontroly(i) And mousey<=(guicontroly(i)+guicontroldy(i)) Then
      				     guimousex=mousex-guicontrolx(i)
      				     guimousey=mousey-guicontroly(i)
      				     guirightmousesub(i)()
      				     Exit For 
      				  EndIf 	
      				EndIf
       			EndIf
      		EndIf
      	Next i        
      EndIf
      Return DefWindowProc(hWin,uMsg,wParam,lParam)

   Case WM_RBUTTONUP
      iwindow=0
      For i=1 To nguiwindow
      	If hwin = guihwindow(i) Then
      		iwindow=i:Exit For 
      	EndIf
      Next
      If iwindow>0 Then
      	mousex = LoWord(lParam) 
         mousey = HiWord(lParam)
      	'printgui("win.text2",guiwindowname(iwindow)+"   rmousedown "+Str(mousex)+" "+Str(mousey))
      	For i=1 To ngui
      		If guirightmouseupsub(i)<>0 Then
      			If guicontrolwind(i)=guiwindowname(iwindow) Then
      				If mousex>=guicontrolx(i) And mousex<=(guicontrolx(i)+guicontroldx(i)) Then
      				  If mousey>=guicontroly(i) And mousey<=(guicontroly(i)+guicontroldy(i)) Then
      				     guimousex=mousex-guicontrolx(i)
      				     guimousey=mousey-guicontroly(i)
      				     guirightmouseupsub(i)()
      				     Exit For 
      				  EndIf 	
      				EndIf
       			EndIf
      		EndIf
      	Next i        
      EndIf
      Return DefWindowProc(hWin,uMsg,wParam,lParam)
   
   Case WM_LBUTTONUP
      iwindow=0
      For i=1 To nguiwindow
      	If hwin = guihwindow(i) Then
      		iwindow=i:Exit For 
      	EndIf
      Next
      If iwindow>0 Then
      	mousex = LoWord(lParam) 
         mousey = HiWord(lParam)
      	'printgui("win.text2",guiwindowname(iwindow)+"   rmousedown "+Str(mousex)+" "+Str(mousey))
      	For i=1 To ngui
      		If guileftmouseupsub(i)<>0 Then
      			If guicontrolwind(i)=guiwindowname(iwindow) Then
      				If mousex>=guicontrolx(i) And mousex<=(guicontrolx(i)+guicontroldx(i)) Then
      				  If mousey>=guicontroly(i) And mousey<=(guicontroly(i)+guicontroldy(i)) Then
      				     guimousex=mousex-guicontrolx(i)
      				     guimousey=mousey-guicontroly(i)
      				     guileftmouseupsub(i)()
      				     Exit For 
      				  EndIf 	
      				EndIf
       			EndIf
      		EndIf
      	Next i        
      EndIf
      Return DefWindowProc(hWin,uMsg,wParam,lParam)

   Case WM_MOUSEMOVE
      iwindow=0
      For i=1 To nguiwindow
      	If hwin = guihwindow(i) Then
      		iwindow=i:Exit For 
      	EndIf
      Next
      If iwindow>0 Then
      	mousex = LoWord(lParam) 
         mousey = HiWord(lParam)
      	'printgui("win.text2",guiwindowname(iwindow)+"   movemouse "+Str(mousex)+" "+Str(mousey))
      	For i=1 To ngui
      		If guimovemousesub(i)<>0 Then
      			If guicontrolwind(i)=guiwindowname(iwindow) Then
      				If mousex>=guicontrolx(i) And mousex<=(guicontrolx(i)+guicontroldx(i)) Then
      				  If mousey>=guicontroly(i) And mousey<=(guicontroly(i)+guicontroldy(i)) Then
      				     guimousex=mousex-guicontrolx(i)
      				     guimousey=mousey-guicontroly(i)
      				     guimovemousesub(i)()
      				     Exit For 
      				  EndIf 	
      				EndIf
       			EndIf
      		EndIf
      	Next i        
      EndIf
      Return DefWindowProc(hWin,uMsg,wParam,lParam)
   

   Case WM_MOUSEWHEEL
     if guimousewheelsub<>0 Then 
      iwindow=0
      For i=1 To nguiwindow
      	If hwin = guihwindow(i) Then
      		iwindow=i:Exit For 
      	EndIf
      Next
      If iwindow>0  Then
      	'keyshift = LoWord(wParam) 
         guimousewheelrot = HiWord(wParam)
         guimousewheelrot=CShort(CUShort(guimousewheelrot))
         guimousewheelsub()
      EndIf  
     EndIf  
      Return DefWindowProc(hWin,uMsg,wParam,lParam)

       
   Case WM_PAINT
      iwindow=0
      For i=1 To nguiwindow
      	If hwin = guihwindow(i) Then
      		iwindow=i:Exit For 
      	EndIf
      Next
      'printgui("win.text2",guiwindowname(iwindow)+"     ok")
      If iwindow>0 Then
         'draw the gfx buffer to screen
         hDC = BeginPaint(hWin, @pnt)
      	For i=1 To ngui
      		If guigfxbuffer(i)<>0 Then
      			If guicontrolwind(i)=guiwindowname(iwindow) Then
       			  Put (0,0),guigfxbuffer(i),pset
       			  ScreenLock
      			  stretchDIBits(hDC, guicontrolx(i),guicontroly(i),guicontroldx(i),guicontroldy(i),_
      			                0,0,guicontroldx(i),guicontroldy(i), _
                             ScreenPtr,_'guigfxbuffer(i),_
                             CPtr(bitmapinfo Ptr, @guigfxinfo), DIB_RGB_COLORS,SRCCOPY)
       			  ScreenUnLock
      			EndIf
      		EndIf
      	Next i
         EndPaint (hWin, @pnt)
         Return 0
      EndIf
      Return DefWindowProc(hWin,uMsg,wParam,lParam)
	
	case WM_CREATE

If guihicon>0 Then sendMessage(hWin,WM_SETICON,0,Cast(LPARAM,guihIcon))

Dim As uint flagex

iwindow=iguiwindow

If iwindow>0 Then 
  guiwindowadd=guiwindowname(iwindow)
  For i=1 To ngui
    If guicontrolwind(i)=guiwindowadd Then
    	If guicontroltype(i)<>"menuitem" And guicontroltype(i)<>"menu" Then 
    	 flagex=0'WS_EX_LEFT Or WS_EX_WINDOWEDGE Or ws_ex_transparent
       guihcontrol(i) = CreateWindowex (flagex ,_
                        guicontroltype(i),guicontroltext(i),_
WS_CHILD Or WS_VISIBLE Or WS_CLIPSIBLINGS  _ 
            Or guicontrolstyle(i),_' ws_border Or BS_PUSHBUTTON ,_
            guicontrolx(i),guicontroly(i),guicontroldx(i),guicontroldy(i),_ 
            hwin,_ ' Parent window
            Cast(hmenu, i),_' Control ID: i
            guihinstance,NULL)          
    	EndIf 
    EndIf 
  Next i   
EndIf 
	   Return DefWindowProc(hWin,uMsg,wParam,lParam)

	Case WM_COMMAND
			Select Case HiWord(wParam)
				Case BN_CLICKED,1
					i=LoWord(wParam)
					If i>=1 And i<=ngui Then 
					  If (lParam = Cast(uint , guihcontrol(i)))_ 
					      Or guicontroltype(i)="menuitem" Then 
					  	 iguicontrol=i:guih=guihcontrol(i):guicommand=HiWord(wparam)
					  	 guihwin=hwin:guiLparam=lparam:guiwparam=wparam
						 'guinotice("control "+Str(guicontrolsub(i)),"ok")
						 If guicontrolsub(i)<>0 Then guicontrolsub(i)()
					  EndIf
					Else
					  If i>=1000 And i<=nguiusersubmax Then
					  	 If guiusersub(i)<>0 Then guiusersub(i)()
					  Else
					  	 'Return DefWindowProc(hWin,uMsg,wParam,lParam)
					  EndIf
					EndIf 
					'
			End Select
		   Return DefWindowProc(hWin,uMsg,wParam,lParam)
			
			'
	Case WM_SIZE
		   iwindow=0
		   For i=1 To nguiwindow
		   	If hwin=guihwindow(i) Then iwindow=i
		   Next i
		   If iwindow>0 Then
		      If guiresizesub(iwindow)<>0 Then
   	   	  	guihwin=hwin:guiLparam=lparam:guiwparam=wparam
		      	guiresizesub(iwindow)()
		      EndIf
		   EndIf        
        'If uMsg = WM_SIZE And WParam = SIZE_MINIMIZED Then	
        '	 guinotice("minimized")
        'EndIf
        '
	Case WM_CLOSE
		   iwindow=0
		   For i=1 To nguiwindow
		   	If hwin=guihwindow(i) Then iwindow=i
		   Next i
		   If iwindow>0 Then
		   	'guiclosewindow(guiwindowname(iwindow))
		      If guitrapclosesub(iwindow)<>0 Then
   	   	  	guihwin=hwin:guiLparam=lparam:guiwparam=wparam
		      	guitrapclosesub(iwindow)()
		      EndIf
		   EndIf
		   'DestroyWindow(hWin)
			'
	Case WM_CHAR
	      guichar=Chr(wparam)
         Return DefWindowProc(hWin,uMsg,wParam,lParam)
	Case WM_KEYDOWN,WM_KEYUP
	   	'guinotice(getguihname(hwin),"wm_key")
		   iwindow=0
		   For i=1 To nguiwindow
		   	If hwin=guihwindow(i) Then iwindow=i:Exit For
		   Next i
		   If iwindow>0 Then
		      If guikeyboardsub(iwindow)<>0 Then
   	   	  	guihwin=hwin:guiLparam=lparam:guiwparam=wparam:guikeyboard=wparam:guimsg=uMsg
		      	guikeyboardsub(iwindow)()
		      EndIf
		   EndIf
         Return DefWindowProc(hWin,uMsg,wParam,lParam)
         '
	Case WM_DESTROY
			'iwindow=0
			'For i=1 To nguiwindow
			'	If guiopenwin(i)>0 Then iwindow=i:Exit For
			'Next i
			'If iwindow=0 Then
			'	guinotice("quithwin","ok")
		   ' 	PostQuitMessage(NULL)
			'EndIf
			'
#If Defined(wm_ctlcoloredit) And Defined(wm_ctlcolorlistbox) And Defined(wm_ctlcolorstatic)
   Case WM_CTLCOLORBTN
          If guibuttonfont<>0 Then SelectObject(Cast(hdc,wparam),guibuttonfont)
          'SetTextColor(wparam,bgr(0,0,255)) 
          'return (GetStockObject(LTGRAY_BRUSH))
	       Return DefWindowProc(hWin,uMsg,wParam,lParam)
   Case WM_CTLCOLOREDIT
          If guiedittextfont<>0 Then SelectObject(Cast(hdc,wparam),guiedittextfont)
          SetTextColor(Cast(hdc,wparam),guiedittextink) 
          SetBkColor(Cast(hdc,wparam), guiedittextcolor) 
          If guibrushedittext<>0 Then Return Cast(uint,guibrushedittext)
          Return cast(uint,GetStockObject(white_BRUSH))
	       'Return DefWindowProc(hWin,uMsg,wParam,lParam)
   Case WM_CTLCOLORLISTBOX
          If guilistboxfont<>0 Then SelectObject(Cast(hdc,wparam),guilistboxfont)
          'SelectObject (wparam,guifont(SYSTEM_FONT))'ANSI_VAR_FONT))'ANSI_FIXED_FONT))'OEM_FIXED_FONT))
          SetTextColor(Cast(hdc,wparam),guilistboxink) 
          SetBkMode(Cast(hdc,wparam),TRANSPARENT) 
          If guibrushlistbox<>0 Then Return Cast(uint,guibrushlistbox)
          Return cast(uint,GetStockObject(white_BRUSH))
	       'Return DefWindowProc(hWin,uMsg,wParam,lParam)
'•WM_CTLCOLORDLG
'•WM_CTLCOLORLISTBOX
'•WM_CTLCOLORSCROLLBAR
   Case WM_CTLCOLORSTATIC
          If guistatictextfont<>0 Then SelectObject(Cast(hdc,wparam),guistatictextfont)
          SetTextColor(Cast(hdc,wparam),guistatictextink) 
          If guibackcolor<>0 Then SetBkColor(Cast(hdc,wparam), guibackcolor)
          return cast(uint,GetStockObject(NULL_BRUSH))
 '  CTLCOLOR_BTN            button control
 '  CTLCOLOR_DLG            dialog box
 '  CTLCOLOR_EDIT           edit control
 '  CTLCOLOR_LISTBOX        list box
 '  CTLCOLOR_MSGBOX         message box
 '  CTLCOLOR_SCROLLBAR      scroll bar
 '  CTLCOLOR_STATIC         static text, frame, or rectangle
 /'     Select  Case (HIWORD(lParam)
      	case CTLCOLOR_BTN
          return (GetStockObject(LTGRAY_BRUSH));
         Case Else 
          return (GetStockObject(WHITE_BRUSH));
      End Select 
      return (GetStockObject(WHITE_BRUSH)); '/
#EndIf 
     
	Case Else
		Return DefWindowProc(hWin,uMsg,wParam,lParam)
			'
	End Select
   'Return DefWindowProc(hWin,uMsg,wParam,lParam)
	Return 0

End Function
Dim Shared As Integer guiend=0
Sub guiscan
Dim guimsg As MSG
Dim As Integer status,i,j 
If guiend=0 Then 
	status=1:i=0
	While status<>0 And i<1000
		i+=1
		'If GetQueueStatus(QS_ALLINPUT) Then 'Or QS_ALLEVENTS) Then  
		If peekmessage(@guimsg,NULL,0,0,PM_NOREMOVE)<>0 Then 
   		  status=GetMessage(@guimsg,NULL,0,0)
		  '   If guimsg.message=WM_QUIT Then status=0
		     If status<>0 And status<>-1 Then 
			   TranslateMessage(@guimsg)
	   	   DispatchMessage(@guimsg)
		     EndIf
	        'If status=-1 Then guinotice("getmsg error status=-1","guiscan")
		Else
			i=10000
		EndIf
	Wend
	If status=0 Then guiend=1
	If (GetKeyState(vk_return)And &HF0000000) Then
		If guikeyreturn=0 Then 
			guikeyreturn=1
		   For i=1 To ngui
			 If getfocus()=guihcontrol(i) Then
			  	if guicontrolsub(i)<>0 Then guicontrolsub(i)()
				exit for 
			 EndIf
		   Next
		EndIf 
	Else
		guikeyreturn=0
	EndIf
	
EndIf 
End Sub
Sub guiwait
Dim guimsg As MSG
Dim As Integer status,i
guiscan
status=GetMessage(@guimsg,NULL,0,0)
If guimsg.message=WM_QUIT Then status=0
If status<>0 And status<>-1 Then 
	TranslateMessage(@guimsg)
	DispatchMessage(@guimsg)
EndIf	
End Sub
Sub guibackgroundcolor(ByVal r As uint,ByVal g As uint,ByVal b As uint)
	guibackcolor=BGR(r,g,b)
End Sub
Sub guiedittextbackcolor(ByVal r As uint,ByVal g As uint,ByVal b As uint)
	guiedittextcolor=BGR(r,g,b)
   If guibrushedittext<>0 Then DeleteObject guibrushedittext:guibrushedittext=0
   If guibrushedittext=0 Then guibrushedittext=CreateSolidBrush(guiedittextcolor)
   guirefresh 
End Sub 
Sub guilistboxbackcolor(ByVal r As uint,ByVal g As uint,ByVal b As uint)
dim as uint i
Dim As hwnd hlastwin,hlastfocus
	guilistboxcolor=BGR(r,g,b)
   If guibrushlistbox<>0 Then DeleteObject guibrushlistbox:guibrushlistbox=0
   If guibrushlistbox=0 Then guibrushlistbox=CreateSolidBrush(guilistboxcolor)
   guirefresh
End Sub
Sub guiedittextinkcolor(ByVal r As uint,ByVal g As uint,ByVal b As uint)
	guiedittextink=BGR(r,g,b)
   guirefresh
End Sub 
Sub guilistboxinkcolor(ByVal r As uint,ByVal g As uint,ByVal b As uint)
	guilistboxink=BGR(r,g,b)
   guirefresh
End Sub 
Sub guistatictextinkcolor(ByVal r As uint,ByVal g As uint,ByVal b As uint)
	guistatictextink=BGR(r,g,b)
   guirefresh
End Sub 
Function guiaddwindow(ByVal hInst As HINSTANCE) As Integer
Dim wc As WNDCLASSEX
If guiinit=0 Then 
	guiinit=1
	' Setup and register class for dialog
	wc.cbSize=SizeOf(WNDCLASSEX)
	wc.style=CS_HREDRAW Or CS_VREDRAW
	wc.lpfnWndProc=@guiWndProc
	wc.cbClsExtra=0
	wc.cbWndExtra=DLGWINDOWEXTRA '0
	wc.hInstance=hInst
   'guibackcolor=BGR(100,100,100)
   If guibrush=0 Then
   	If guibackcolor=0 Then 
   		guibrush=GetSysColorBrush(color_btnface)
   	Else 	
   		guiBrush=CreateSolidBrush(guibackColor)
   	EndIf
   EndIf
	wc.hbrBackground=guibrush'Cast(HBRUSH,guibackcolor)'COLOR_BACKGROUND)'COLOR_WINDOW)'COLOR_BTNFACE)
	wc.lpszMenuName=Cast(ZString Ptr,0)'IDM_MENU)
	wc.lpszClassName=@guiClassName
	wc.hIcon=LoadIcon(NULL,IDI_APPLICATION)
	wc.hIconSm=wc.hIcon
	wc.hCursor=LoadCursor(NULL,IDC_ARROW)
	RegisterClassEx(@wc)
EndIf 
  
     guiwindowflag=guiwindowtype(iguiwindow) 
     'If guiwindowflag=0 Then 
     '	  guiwindowflag=WS_SYSMENU or WS_MINIMIZEBOX 'or WS_DLGFRAME 'or WS_MAXIMIZEBOX 
     'EndIf
     'guiwindowflag=guiwindowflag Or WS_MINIMIZEBOX Or WS_SYSMENU 
     
     guihwindow(iguiwindow) = CreateWindowex ( 0 Or guiwindowtypeex(iguiwindow),_'WS_EX_APPWINDOW,_
     guiClassName,_' Class name 
     guiwindowtext(iguiwindow),_' Caption 
     guiwindowflag,_'WS_OVERLAPPEDwindow,_/' Style '/
     _ 'DS_MODALFRAME or WS_POPUP or WS_CAPTION or WS_SYSMENU,_
     guiwindowx,guiwindowy,guiwindowdx,guiwindowdy,_ ' Initial x y dx dy
     NULL,_/' No parent window '/
     NULL,_/' No menu '/
     hInst,_/' This program instance '/
     NULL _/' Creation parameters '/
     )
     If guihwindow(iguiwindow)<>0 Then
     	  guiopenwin(iguiwindow)=1
     Else 
     	  guiopenwin(iguiwindow)=0
     EndIf
    
	ShowWindow(guihwindow(iguiwindow),SW_SHOWNORMAL)
	UpdateWindow(guihwindow(iguiwindow))
 
	' Message loop
   'guiscan
   guih=guihwindow(iguiwindow)
      
Return 0
End Function
Sub openwindow (ByRef windowname As String,ByRef windowtext As String,_ 
                ByVal x As uint,ByVal y As uint,ByVal dx As uint,ByVal dy As uint,_
                ByVal windowtype As uint = guiwindowdefautflag,_ 
                ByVal windowtypeex As uint = 0)
Dim As uint i,j
iguiwindow=0
For i=1 To nguiwindow
	If guiwindowname(i)=windowname Then
		iguiwindow=i:Exit For
	EndIf
Next i
If iguiwindow=0 Then 
  If nguiwindow<nguimax Then 	
	  nguiwindow+=1
	  iguiwindow=nguiwindow
  Else
     guinotice(Str(nguimax)+" max number of window reached !","guinotice")
  EndIf
EndIf 
If iguiwindow>0 Then
	i=iguiwindow
	If guiopenwin(i)=1 Then
	  guinotice(windowname+" window yet opened !","guinotice")
	Else 	
     guiwindowx=x:guiwindowy=y	     
     guiwindowdx=dx:guiwindowdy=dy
     guiwindowname(i)=windowname
     guiwindowtext(i)=windowtext
     guiwindowtype(i)=windowtype
     guiwindowtypeex(i)=windowtypeex
     guiaddwindow(guihinstance)
     For j=1 To ngui
       If guicontrolhicon(j)<>0 Then
       	If guicontrolwind(j)=windowname Then 
       		If guicontroltype(j)="button" Then 
         	   'SendMessage(guihcontrol(j),WM_SETICON,NULL,Cast(LPARAM,guicontrolhIcon(j)))
         	   SendMessage(guihcontrol(j),BM_SETIMAGE,IMAGE_ICON,Cast(LPARAM,guicontrolhIcon(j)))
       		Else 
         	   SendMessage(guihcontrol(j),STM_SETIMAGE,IMAGE_ICON,Cast(LPARAM,guicontrolhIcon(j)))
            EndIf         			
       	EndIf 
       EndIf
       If guicontrolhbmp(j)<>0 Then
       	If guicontrolwind(j)=windowname Then
       		If guicontroltype(j)="button" Then 
       			SendMessage(guihcontrol(j),BM_SETIMAGE,IMAGE_BITMAP,Cast(LPARAM,guicontrolhbmp(j)))
       		Else        			
       			SendMessage(guihcontrol(j),STM_SETIMAGE,IMAGE_BITMAP,Cast(LPARAM,guicontrolhbmp(j)))
       		EndIf
       	EndIf 
       EndIf
     Next j
	EndIf   	     
EndIf 
End Sub
Sub guiclose(ByRef opt As String = "nomsg")
Dim As uint i
   For i=1 To nguiwindow
   	If guiopenwin(i)>0 Then
   		If opt<>"nomsg" Then guinotice(guiwindowname(i)+" : window closed by guiclose !","guinotice")
   		guiclosewindow(guiwindowname(i))
   	EndIf
   Next
	If guihicon<>0 Then DestroyIcon(guihicon)
	guihicon=0
	For i=1 To ngui
		If guicontrolhicon(i)<>0 Then
			'guinotice(Str(guicontrolhicon(i)),"hicon")
         DestroyIcon(guicontrolhicon(i))
         guicontrolhicon(i)=0
		EndIf
		If guicontrolhbmp(i)<>0 Then
			'guinotice(Str(guicontrolhbmp(i)),"hbmp")
         Deleteobject(guicontrolhbmp(i))
         guicontrolhbmp(i)=0
		EndIf
		If guigfxbuffer(i)<>0 Then
			'guinotice(Str(guigfxbuffer(i)),"gfxbuffer")
			ImageDestroy guigfxbuffer(i)
			guigfxbuffer(i)=0
		EndIf
		If guihcontrol(i)<>0 Then
			If guicontroltype(i)="menu" Then destroymenu(Cast(hmenu,guihcontrol(i)))
		EndIf
		guihcontrol(i)=0
	Next
 	'PostQuitMessage(NULL)
	UnregisterClass guiclassname,guihInstance
	DeleteObject guiBrush
	guibrush=0
	DeleteObject guiBrushedittext
	guibrushedittext=0
	DeleteObject guiBrushlistbox
	guibrushlistbox=0
   deleteobject guiedittextfont:guiedittextfont=0
   deleteobject guistatictextfont:guistatictextfont=0
   deleteobject guilistboxfont:guilistboxfont=0
   deleteobject guibuttonfont:guibuttonfont=0
   #Ifndef noguijpeg
   If hjpeg<>0 Then DylibFree(hjpeg):hjpeg=0:hbmpjpg=@hbmpjpg0()
   #EndIf 
	guiinit=0
End Sub
Sub guiquit(ByRef opt As String = "msg")
	If guiinit<>0 Then guiclose(opt)
	PostQuitMessage(0)
   ExitProcess(0)
End Sub
Sub trapclose(ByRef windowname As String,ByVal closesub As Sub())	
Dim As uint i
iguiwindow=0
For i=1 To nguiwindow
	If guiwindowname(i)=windowname Then
		iguiwindow=i
		Exit For
	EndIf
Next i
If iguiwindow>0 Then
	guitrapclosesub(iguiwindow)=closesub
Else
	guinotice("trapclose :"+windowname+" not fount !","warning")
EndIf
End Sub
Sub trapresize(ByRef windowname As String,ByVal resizesub As Sub())	
Dim As uint i
iguiwindow=0
For i=1 To nguiwindow
	If guiwindowname(i)=windowname Then
		iguiwindow=i
		Exit For
	EndIf
Next i
If iguiwindow>0 Then
	guiresizesub(iguiwindow)=resizesub
Else
	guinotice("trapresize :"+windowname+" not fount !","warning")
EndIf
End Sub
Sub trapkeyboard(ByRef windowname As String,ByVal keyboardsub As Sub())	
Dim As uint i
iguiwindow=0
For i=1 To nguiwindow
	If guiwindowname(i)=windowname Then
		iguiwindow=i
		Exit For
	EndIf
Next i
If iguiwindow>0 Then
	guikeyboardsub(iguiwindow)=keyboardsub
Else
	guinotice("trapkeyboard :"+windowname+" not fount !","warning")
EndIf
End Sub
Sub trapLeftmouse(ByRef controlname As String,ByVal mousesub As Sub())	
Dim As uint i
iguicontrol=0
For i=1 To ngui
	If guicontrolname(i)=controlname Then
		iguicontrol=i
		Exit For
	EndIf
Next i
If iguicontrol>0 Then
	guileftmousesub(iguicontrol)=mousesub
Else
	guinotice("trapleftmouse :"+controlname+" not fount !","warning")
EndIf
End Sub
Sub trapRightmouse(ByRef controlname As String,ByVal mousesub As Sub())	
Dim As uint i
iguicontrol=0
For i=1 To ngui
	If guicontrolname(i)=controlname Then
		iguicontrol=i
		Exit For
	EndIf
Next i
If iguicontrol>0 Then
	guirightmousesub(iguicontrol)=mousesub
Else
	guinotice("traprightmouse :"+controlname+" not fount !","warning")
EndIf
End Sub
Sub trapLeftmouseup(ByRef controlname As String,ByVal mousesub As Sub())	
Dim As uint i
iguicontrol=0
For i=1 To ngui
	If guicontrolname(i)=controlname Then
		iguicontrol=i
		Exit For
	EndIf
Next i
If iguicontrol>0 Then
	guileftmouseupsub(iguicontrol)=mousesub
Else
	guinotice("trapleftmouseup :"+controlname+" not fount !","warning")
EndIf
End Sub
Sub trapRightmouseup(ByRef controlname As String,ByVal mousesub As Sub())	
Dim As uint i
iguicontrol=0
For i=1 To ngui
	If guicontrolname(i)=controlname Then
		iguicontrol=i
		Exit For
	EndIf
Next i
If iguicontrol>0 Then
	guirightmouseupsub(iguicontrol)=mousesub
Else
	guinotice("traprightmouseup :"+controlname+" not fount !","warning")
EndIf
End Sub
Sub trapmovemouse(ByRef controlname As String,ByVal mousesub As Sub())	
Dim As uint i
iguicontrol=0
For i=1 To ngui
	If guicontrolname(i)=controlname Then
		iguicontrol=i
		Exit For
	EndIf
Next i
If iguicontrol>0 Then
	guimovemousesub(iguicontrol)=mousesub
Else
	guinotice("trapmovemouse :"+controlname+" not fount !","warning")
EndIf
End Sub
Sub trapmousewheel(ByVal mousesub As Sub())	
	guimousewheelsub=mousesub
End Sub
Sub enableguih(ByVal hcontrol As hwnd)
If hcontrol<>0 Then
	EnableWindow(hcontrol,TRUE)
EndIf
End Sub
Sub disableguih(ByVal hcontrol As hwnd)
If hcontrol<>0 Then
	EnableWindow(hcontrol,FALSE)
EndIf
End Sub
Sub enablegui(ByRef controlname As String)
	enableguih(getguih(controlname))
End Sub
Sub disablegui(ByRef controlname As String)
	disableguih(getguih(controlname))
End Sub
Sub showguih(ByVal hcontrol As hwnd)
If hcontrol<>0 Then
	showWindow(hcontrol,SW_SHOW)
EndIf
End Sub
Sub hideguih(ByVal hcontrol As hwnd)
If hcontrol<>0 Then
	showWindow(hcontrol,SW_HIDE)
EndIf
End Sub
Sub showgui(ByRef controlname As String)
	showguih(getguih(controlname))
End Sub
Sub hidegui(ByRef controlname As String)
	hideguih(getguih(controlname))
End Sub
Sub radiobutton(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
guicontroltypeadd="button"
guicontrolstyleadd=bs_radiobutton 'autoradiobutton
guiaddcontrol(controlname,controltext,controlsub,_ 
	        controlx,controly,controldx,controldy)
End Sub 
Sub checkbox(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
guicontroltypeadd="button"
guicontrolstyleadd=bs_checkbox 'autocheckbox
guiaddcontrol(controlname,controltext,controlsub,_ 
	        controlx,controly,controldx,controldy)
End Sub 
Sub iconbutton(Byref controlname As String,ByRef iconfile As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
Dim As uint i
guicontroltypeadd="button"
guicontrolstyleadd=bs_icon 
guiaddcontrol(controlname,"iconbutton",controlsub,_ 
	        controlx,controly,controldx,controldy)
If FileExists(iconfile) Then
	   i=iguicontrol 
		If guicontrolhicon(i)>0 Then DestroyIcon(guicontrolhicon(i))
		guicontrolhicon(i)=ExtractIcon(guihinstance,iconfile,0)
		If guicontrolhicon(i)<=1 Then guicontrolhicon(i)=0
EndIf 		
End Sub
Sub bmpbutton(Byref controlname As String,ByRef bmpfile As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
Dim As uint i
guicontroltypeadd="button"
guicontrolstyleadd=bs_bitmap
guiaddcontrol(controlname,"bmpbutton",controlsub,_ 
	        controlx,controly,controldx,controldy)
If FileExists(bmpfile) Then
	   i=iguicontrol 
		If guicontrolhbmp(i)<>0 Then deleteobject(guicontrolhbmp(i))
	#Ifndef noguijpeg	
		guicontrolhbmp(i)=guiloadbmp(bmpfile)
	#Else 	
      guicontrolhbmp(i)=guiloadbmpdib(bmpfile)
   #EndIf    
EndIf 		
End Sub
Sub staticicon(Byref controlname As String,ByRef iconfile As String,_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
Dim As uint i
guicontroltypeadd="static"
guicontrolstyleadd=ss_icon Or SS_CENTERIMAGE 
guiaddcontrol(controlname,"staticicon",0,_ 
	        controlx,controly,controldx,controldy)
If FileExists(iconfile) Then
	   i=iguicontrol 
		If guicontrolhicon(i)>0 Then DestroyIcon(guicontrolhicon(i))
		guicontrolhicon(i)=ExtractIcon(guihinstance,iconfile,0)
		If guicontrolhicon(i)<=1 Then guicontrolhicon(i)=0
EndIf 		
End Sub
Sub staticbmp(ByRef controlname As String,ByRef bmpfile As String,_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
Dim As uint i
guicontroltypeadd="static"
guicontrolstyleadd=ss_bitmap Or SS_CENTERIMAGE
guiaddcontrol(controlname,"staticbmp",0,_ 
	        controlx,controly,controldx,controldy)
If FileExists(bmpfile) Then
	   i=iguicontrol 
		If guicontrolhbmp(i)<>0 Then deleteobject(guicontrolhbmp(i))
	#Ifndef noguijpeg	
		guicontrolhbmp(i)=guiloadbmp(bmpfile)
	#Else 	
      guicontrolhbmp(i)=guiloadbmpdib(bmpfile)
   #EndIf    
EndIf 		
End Sub
Sub statictext(Byref controlname As String,ByRef controltext As String,_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        ByVal userflags As uint = 0)
guicontroltypeadd="static"
guicontrolstyleadd=0
guiaddcontrol(controlname,controltext,0,_ 
	        controlx,controly,controldx,controldy,userflags)
End Sub 
Sub edittext(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        ByVal userflags As uint = 0)
guicontroltypeadd="edit"
guicontrolstyleadd=ES_MULTILINE Or ES_WANTRETURN Or ES_LEFT 'Or ES_AUTOVSCROLL
guiaddcontrol(controlname,controltext,controlsub,_ 
	        controlx,controly,controldx,controldy,userflags)
End Sub 
Sub combobox(Byref controlname As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
guicontroltypeadd="combobox"
guicontrolstyleadd=WS_VSCROLL or CBS_DROPDOWN
guiaddcontrol(controlname,"combo",controlsub,_ 
	        controlx,controly,controldx,controldy)
End Sub
Sub reloadcombo(ByRef comboname As String,liste() As string)
Dim As uint i
iguicontrol=getguiindex(comboname)
If guih<>0 And iguicontrol>0 Then 
   SendMessage(guih,CB_RESETCONTENT,0,0)
	For i=0 To UBound(liste)
	  If liste(i)<>"" Then
        SendMessage(guih,CB_ADDSTRING,0,Cast(lparam,StrPtr(liste(i))))
	  Else 
		  If i>0 Then Exit For 
	  EndIf
	Next i
EndIf 
End Sub 
Sub addcombo(ByRef comboname As String,ByRef liste As String)
getguih(comboname)
If guih<>0 Then 
	If liste<>"" Then		
      SendMessage(guih,CB_ADDSTRING,0,Cast(lparam,StrPtr(liste)))
	EndIf
EndIf 
End Sub 
Sub selectcombotext(ByRef comboname As String,ByRef item As String,liste() As string)
Dim As Integer i,j
j=-1
For i=0 To UBound(liste)
	If item=liste(i) Then j=i:Exit For
Next i
If j>=0 Then
 If liste(0)<>"" Then j=j+1	
 getguih(comboname)
 If guih<>0 Then 
   SendMessage(guih,CB_SETCURSEL,j-1,0)
 EndIf 
EndIf 
End Sub 
Sub selectcomboindex(ByRef comboname As String,ByVal i As uint)
getguih(comboname)
If guih<>0 Then 
   SendMessage(guih,CB_SETCURSEL,i-1,0)
EndIf 
End Sub 
Sub getcomboindex(ByRef comboname As String,ByRef i As uint)
getguih(comboname)
If guih<>0 Then 
   i=SendMessage(guih,CB_GETCURSEL,0,0)
   If i=CB_ERR Then i=0 Else i=i+1
EndIf 
End Sub 
Sub removecombo(ByRef comboname As String,ByVal i As uint)
getguih(comboname)
If guih<>0 Then 
   SendMessage(guih,CB_DELETESTRING,i-1,0)
EndIf 
End Sub 
Sub resetcombo(ByRef comboname As String,ByVal i As uint)
getguih(comboname)
If guih<>0 Then 
   SendMessage(guih,CB_RESETCONTENT,0,0)
EndIf 
End Sub
Function getcombotext(ByRef comboname As String,liste() As string) As String
Dim As uint i
getguih(comboname)
If guih<>0 Then
   i=SendMessage(guih,CB_GETCURSEL,0,0)
   If i=CB_ERR Then Return ""
   If liste(0)="" Then i=i+1
   If i>UBound(liste) Then Return ""
   Return liste(i)		
EndIf
End Function 
Sub setcheckbox(ByRef checkname As String)
getguih(checkname)
If guih<>0 Then 
   SendMessage(guih,BM_SETCHECK, BST_CHECKED, 0)
EndIf 
End Sub 
Sub unsetcheckbox(ByRef checkname As String)
getguih(checkname)
If guih<>0 Then 
   SendMessage(guih,BM_SETCHECK, BST_UNCHECKED, 0)
EndIf 
End Sub
Sub listbox(Byref controlname As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        ByVal userflags As uint = 0)
guicontroltypeadd="listbox"
guicontrolstyleadd=WS_VSCROLL or LBS_NOTIFY
guiaddcontrol(controlname,"listebox",controlsub,_ 
	        controlx,controly,controldx,controldy,userflags)
End Sub
Sub reloadlistbox(ByRef listboxname As String,liste() As string)
Dim As uint i
getguih(listboxname)
If guih<>0 Then 
   SendMessage(guih,LB_RESETCONTENT,0,0)
	For i=0 To UBound(liste)
	  If liste(i)<>"" Then
        SendMessage(guih,LB_ADDSTRING,0,Cast(lparam,StrPtr(liste(i))))
	  Else 
		  If i>0 Then Exit For 
	  EndIf
	Next i
EndIf 
End Sub 
Sub selectlistboxtext(ByRef listboxname As String,ByRef item As String,liste() As string)
Dim As Integer i,j
j=-1
For i=0 To UBound(liste)
	If item=liste(i) Then j=i:Exit For
Next i
If j>=0 Then
 If liste(0)<>"" Then j=j+1	
 getguih(listboxname)
 If guih<>0 Then 
   SendMessage(guih,LB_SETCURSEL,j-1,0)
 EndIf 
EndIf 
End Sub 
Sub addlistbox(ByRef listboxname As String,ByRef text As String)
getguih(listboxname)
If guih<>0 Then
   SendMessage(guih, LB_ADDSTRING, 0,Cast(lparam,StrPtr(text)))
EndIf
End Sub
Function getlistboxtextbyindex(ByRef listboxname As String,ByVal index As uint) As String
Dim As uint i
getguih(listboxname)
If guih<>0 Then
	guibuffer=space(4000-1)+chr(0)
   i=SendMessage(guih, LB_GETTEXT, Cast(wparam,index-1),Cast(lparam,StrPtr(guiBuffer)))
   If i=LB_err Then guibuffer=""
   Return guibuffer		
EndIf
End Function 
Sub getlistboxindex(ByRef listboxname As String,ByRef i As uint)
getguih(listboxname)
If guih<>0 Then 
   i=SendMessage(guih,LB_GETCURSEL,0,0)
   If i=LB_ERR Then i=0 Else i=i+1
EndIf 
End Sub 
Sub selectlistboxindex(ByRef listboxname As String,ByVal i As uint)
getguih(listboxname)
If guih<>0 Then 
   SendMessage(guih,LB_SETCURSEL,i-1,0)
EndIf 
End Sub 
Function getlistboxtext(ByRef listboxname As String) As String
Dim As uint i
getguih(listboxname)
If guih<>0 Then
   i=SendMessage(guih,LB_GETCURSEL,0,0)
   If i=LB_ERR Then i=0 Else i=i+1
	guibuffer=space(4000-1)+chr(0)
   i=SendMessage(guih, LB_GETTEXT, Cast(wparam,i-1),Cast(lparam,StrPtr(guiBuffer)))
   If i=LB_err Then guibuffer=""
   Return guibuffer		
EndIf
End Function 
Function guiiswindowopen(ByRef windowname As String) As UInteger
	Return guiopenwin(getguiindex(windowname))
End Function
Function guiisopen(ByRef windowname As String) As UInteger
	Return guiopenwin(getguiindex(windowname))
End Function
Sub guigetwindowpos(ByRef windowname As String,ByRef x As uint,ByRef y As uint,_ 
	                 ByRef dx As uint,ByRef dy As uint)
Dim As rect winrect
	getguih(windowname)
	If guih<>0 Then
	   showwindow(guih,sw_shownoactivate)
	   GetWindowRect(guih,@winrect)
      x=winrect.left
      y=winrect.top
      dx=winrect.right-x
      dy=winrect.bottom-y
   EndIf 
End Sub 
Sub guimovewindow(ByRef windowname As String,ByVal x As uint,ByVal y As uint,_ 
	               ByVal dx As uint,ByVal dy As uint)
	getguih(windowname)
	If guih<>0 Then
		MoveWindow(guih,x,y,dx,dy,TRUE) 'do resize too
	EndIf
End Sub
Sub guimovecontrol(ByRef controlname As String,ByVal x As uint,ByVal y As uint,_ 
	               ByVal dx As uint = 0,ByVal dy As uint = 0)
Dim As uint i,dx0,dy0
	i=getguiindex(controlname)
	If guih<>0 And guitype="control" Then
		If dx=0 Then dx=guicontroldx(i)
		If dy=0 Then dy=guicontroldy(i)
		dx0=guicontroldx(i)
		dy0=guicontroldy(i)
		MoveWindow(guih,x,y,dx,dy,TRUE) 
      guicontrolx(i)=x 
      guicontroly(i)=y 
      guicontroldx(i)=dx 
      guicontroldy(i)=dy
      If dx<>dx0 Or dy<>dy0 Then
	      If guigfxbuffer(i)<>0 Then ImageDestroy guigfxbuffer(i)
	      guigfxbuffer(i)=ImageCreate(dx,dy,RGB(0,0,0))
      EndIf
	EndIf
End Sub
Sub guishowwindow(ByRef windowname As String)
	getguih(windowname)
	If guih<>0 Then showwindow(guih,sw_shownoactivate)
End Sub
Sub guisetfocus(ByRef windowname As String)
	getguih(windowname)
	If guih<>0 Then setfocus(guih)
End Sub
Sub guisetfocush(Byval hwin As hwnd)
	guih=hwin
	If guih<>0 Then setfocus(guih)
End Sub
Sub addusersub(ByVal i As uint,usersub As Sub() )
	If i<1000 Then
	  guinotice("usersub index must be >= 1000"+Chr(13)+"index asked : "+str(i),"addusersub")
	Else
	  If i>nguiusersubmax Then 	
		 guinotice("usersub index max = "+Str(nguiusersubmax)+" , asked= "+Str(i),"addusersub") 
     Else 
		 If guiusersub(i)<>0 Then 
			guinotice("usersub index : "+Str(i)+"  yet used !","addusersub")
		Else
			guiusersub(i)=usersub
		 EndIf
	  EndIf 	 
	EndIf
End Sub
Sub changeusersub(ByVal i As uint,usersub As Sub())
  If i>nguiusersubmax Then 	
	  guinotice("usersub index max = "+Str(nguiusersubmax)+" , asked= "+Str(i),"changeusersub") 
  Else 
     guiusersub(i)=usersub
  EndIf    
End Sub
Sub addmenu(Byref controlname As String,ByRef controltext As String,_
	           ByVal controlflag As uint = MF_STRING Or MF_POPUP) 
Dim As uint iwindow,iguicontrol0
guicontroltypeadd="menu"
guicontrolstyleadd=controlflag
guiaddcontrol(controlname,controltext,NULL,_ 
	           0,0,0,0)
If iguicontrol<ngui And guihcontrol(iguicontrol)<>0 Then 
  guinotice(controlname+" : yet exists !","addmenu")
Else 
  iguicontrol0=iguicontrol	
  iwindow=getguiindex(guicontrolwind(iguicontrol0))
  If iwindow=0 Or guitype<>"window" Then 
	  guinotice("window not found : "+guicontrolwind(iguicontrol0),"addmenu")
  Else 	
    If guiopenwin(iwindow)=0 Then
   	guinotice("window not opened : "+guicontrolwind(iguicontrol0),"addmenu")
    Else
   	If guiwindowhmenu(iwindow)=0 Then
   		guiwindowhmenu(iwindow)=createmenu()
   	EndIf
      guihcontrol(iguicontrol0)=Cast(hwnd,createpopupmenu())
      AppendMenu(guiwindowhmenu(iwindow), controlflag,_
                 Cast(uint,guihcontrol(iguicontrol0)),controltext)
      SetMenu(guihwindow(iwindow), guiwindowhmenu(iwindow))
    EndIf
  EndIf   
EndIf
End Sub
Sub addmenuitem(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_
	             ByVal controlflag As uint = MF_STRING) 
Dim As uint iwindow,iguicontrol0
Dim As String menuname
Dim As hmenu hsubmenu
guicontroltypeadd="menuitem"
guicontrolstyleadd=controlflag
guiaddcontrol(controlname,controltext,controlsub,_ 
	            0,0,0,0)
If iguicontrol<ngui And guihcontrol(iguicontrol)<>0 Then 
  guinotice(controlname+" : yet exists !","addmenuitem")
Else 
  iguicontrol0=iguicontrol
  iwindow=getguiindex(guicontrolwind(iguicontrol0))
  If iwindow=0 Or guitype<>"window" Then 
	  guinotice("window not found : "+guicontrolwind(iguicontrol0),"addmenuitem")
  Else 	
    If guiopenwin(iwindow)=0 Then
   	guinotice("window not opened : "+guicontrolwind(iguicontrol0),"addmenuitem")
    Else
   	If guiwindowhmenu(iwindow)=0 Then
         guinotice("window has no menu opened : "+guicontrolwind(iguicontrol0),"addmenuitem")
   	Else
         menuname=Left(controlname,InStr(InStr(controlname,".")+1,controlname,".")-1)
         hsubmenu=Cast(hmenu,getguih(menuname))
         If hsubmenu=0 Then
         	guinotice("menu not found : "+menuname,"addmenuitem")
         Else 
            AppendMenu(hsubmenu, controlflag,iguicontrol0,controltext)
            guihcontrol(iguicontrol0)=Cast(hwnd,1)
            SetMenu(guihwindow(iwindow), guiwindowhmenu(iwindow))
         EndIf
      EndIf    
    EndIf
  EndIf   
EndIf
End Sub
Sub setmenuitemstate(ByRef controlName As String,ByVal i As uint,ByVal state As uint)
Dim As uint iwindow,iguicontrol0
Dim As String menuname
Dim As hmenu hsubmenu
Dim As MENUITEMINFO mii
If i>0 Then 
 iguicontrol0=getguiindex(controlname)
 If iguicontrol0=0 Then
  guinotice("menu not found : "+controlname,"setmenuitemstate")
 Else
  iwindow=getguiindex(guicontrolwind(iguicontrol0))
  If iwindow=0 Or guitype<>"window" Then 
	  guinotice("window not found : "+guicontrolwind(iguicontrol0),"setmenuitemstate")
  Else 	
    If guiopenwin(iwindow)=0 Then
   	guinotice("window not opened : "+guicontrolwind(iguicontrol0),"setmenuitemstate")
    Else
   	If guiwindowhmenu(iwindow)=0 Then
         guinotice("window has no menu opened : "+guicontrolwind(iguicontrol0),"setmenuitemstate")
   	Else
         menuname=controlname
         hsubmenu=Cast(hmenu,getguih(menuname))
         If hsubmenu=0 Then
         	guinotice("menu not found : "+menuname,"setmenuitemstate")
         Else 
            MII.cbSize = SizeOf(MII)
            MII.fMask = MIIM_STATE
            MII.fstate = state'MFS_CHECKED'MFS_UNCHECKED'MFS_DISABLED'MFS_ENABLED
            SetMenuItemInfo(hSubMenu, i-1, True,@MII)
            'SetMenu(guihwindow(iwindow), guiwindowhmenu(iwindow))
         EndIf
      EndIf    
    EndIf
  EndIf
 EndIf  
EndIf 
End Sub
Sub setcheckmenu(ByRef menuname As String,ByVal i As uint)
	setmenuitemstate(menuname,i,MFS_CHECKED)
End Sub
Sub uncheckmenu(ByRef menuname As String,ByVal i As uint)
	setmenuitemstate(menuname,i,MFS_UNCHECKED)
End Sub
Sub enablemenu(ByRef menuname As String,ByVal i As uint)
	setmenuitemstate(menuname,i,MFS_ENABLED)
End Sub
Sub disablemenu(ByRef menuname As String,ByVal i As uint)
	setmenuitemstate(menuname,i,MFS_DISABLED)
End Sub
Sub setmenutext(ByRef menuname As String,ByVal i As uint,ByRef text As String)
Dim As uint iwindow,iguicontrol0
Dim As ZString * 256 label
Dim As hmenu hsubmenu
Dim As MENUITEMINFO mii
If i>0 Then 
 iguicontrol0=getguiindex(menuname)
 If iguicontrol0=0 Then
  guinotice("menu not found : "+menuname,"setmenutext")
 Else
  iwindow=getguiindex(guicontrolwind(iguicontrol0))
  If iwindow=0 Or guitype<>"window" Then 
	  guinotice("window not found : "+guicontrolwind(iguicontrol0),"setmenutext")
  Else 	
    If guiopenwin(iwindow)=0 Then
   	guinotice("window not opened : "+guicontrolwind(iguicontrol0),"setmenutext")
    Else
   	If guiwindowhmenu(iwindow)=0 Then
         guinotice("window has no menu opened : "+guicontrolwind(iguicontrol0),"setmenutext")
   	Else
         hsubmenu=Cast(hmenu,getguih(menuname))
         If hsubmenu=0 Then
         	guinotice("menu not found : "+menuname,"setmenutext")
         Else 
            MII.cbSize = SizeOf(MII)
            MII.fMask = MIIM_TYPE
            MII.ftype = MFT_STRING
            label=Left(text,254)+Chr(0)
            MII.dwTypeData = @label
            MII.cch= Len(label)
            SetMenuItemInfo(hSubMenu, i-1, True,@MII)
            'SetMenu(guihwindow(iwindow), guiwindowhmenu(iwindow))
         EndIf
      EndIf    
    EndIf
  EndIf
 EndIf  
EndIf 
End Sub
Dim Shared As Integer guitestactivekey=1
Function guitestkey(ByVal ikey As uint) As Integer
	Dim As integer i
	If guitestactivekey Then
		If (GetKeyState(ikey)And &HF0000000)Then i=-1 Else i=0
	EndIf
	Return i
End Function
Function guiword(ByRef t As string,ByVal i As uint,ByRef s As String) As String
Dim As uint j,k
Dim r As String 
j=1
If i>0 Then r=t Else r=""
While j<i And r<>""
   j+=1
   k=InStr(r,s)
   If k=0 Then
   	r=""
   Else 
      r=Right(r,Len(r)-InStr(r,s)-Len(s)+1)
   EndIf       
Wend
If InStr(r,s)>0 Then r=Left(r,InStr(r,s)-1)
Return r
End Function
'guinotice(guiword("12st3456st78",2,"st"))
Function filedialog(ByRef titre As String,ByRef filtre As String = "") As String
Dim As Zstring * 256 fi,f0,dirname0,f1,f01,f02,f2 
Dim As ZString * 256 Dirname
Dim As uint i,j,f
i=0:j=0
f0=Right(filtre,Len(filtre)-InStrRev(filtre,"\"))
Dirname=Left(filtre,Len(filtre)-Len(f0))
If Len(Dirname)=0 Then
	'dirname0=Space(255)+Chr(0) 
	'getmodulefilename(0,dirname0,255)
	'dirname=Left(dirname0,InStrRev(dirname0,"\"))
   dirname=CurDir  
EndIf
f=1
f1=guiword(f0,1,";")
f01=guiword(f1,1,",") 'filter
f02=guiword(f1,2,",")+" ("+f01+")" 'label
fi=""
Dim As Byte Ptr ifi,ifimax
ifi=StrPtr(fi):ifimax=ifi+200
While Len(f1)>0
	'fi=f1+Chr(0)+f1+Chr(0)
	For i=1 To Len(f02)
		*(ifi)=Asc(Mid(f02,i,1)):ifi+=1
		If ifi>ifimax Then Return "" 
	Next
	*(ifi)=0:ifi+=1
	For i=1 To Len(f01)
		*(ifi)=Asc(Mid(f01,i,1)):ifi+=1
		If ifi>ifimax Then Return "" 
	Next
	*(ifi)=0:ifi+=1	
	f=f+1
	f1=guiword(f0,f,";")
   f01=guiword(f1,1,",")
   f02=guiword(f1,2,",")+" ("+f01+")"
Wend
f2="All  (*.*)"'+Chr(0)+"*.*"+Chr(0)+Chr(0)
For i=1 To Len(f2)
	*(ifi)=Asc(Mid(f2,i,1)):ifi+=1
	If ifi>ifimax Then Return "" 
Next
*(ifi)=0:ifi+=1
f2="*.*"'+Chr(0)+Chr(0)
For i=1 To Len(f2)
	*(ifi)=Asc(Mid(f2,i,1)):ifi+=1
	If ifi>ifimax Then Return "" 
Next
*(ifi)=0:ifi+=1
*(ifi)=0:ifi+=1

  Dim ofn As OPENFILENAME
  Dim filename As Zstring * (MAX_PATH + 1)
  Dim title As ZString * 32 => titre
  Dim initialdir As Zstring * 256 => dirname
  
  With ofn
    .lStructSize       = Sizeof(OPENFILENAME)
    .hwndOwner         = NULL
    .hInstance         = guihinstance'GetModuleHandle(NULL)
    .lpstrFilter       = @fi'Strptr(!"All Files, (*.*)\0*.*\0Bas Files, (*.BAS)\0*.bas\0\0")
    .lpstrCustomFilter = NULL
    .nMaxCustFilter    = 0
    .nFilterIndex      = 1
    .lpstrFile         = @filename
    .nMaxFile          = Sizeof(filename)
    .lpstrFileTitle    = NULL
    .nMaxFileTitle     = 0
    .lpstrInitialDir   = @initialdir
    .lpstrTitle        = @title
    .Flags             = OFN_EXPLORER Or OFN_FILEMUSTEXIST Or OFN_PATHMUSTEXIST
    .nFileOffset       = 0
    .nFileExtension    = 0
    .lpstrDefExt       = NULL
    .lCustData         = 0
    .lpfnHook          = NULL
    .lpTemplateName    = NULL
  End With

  If InStr(titre,"save")=0 Then
   	If (GetOpenFileName(@ofn) = FALSE) Then Return ""
  Else 
   	If (GetsaveFileName(@ofn) = FALSE) Then Return ""
  EndIf
  Return filename
End Function
'guinotice(filedialog("test filedialog","c:\echo_chung\*.bas,basic files ;*.cp*,cpp files "))
'guinotice(filedialog("test filedialog","*.bas"))
'guinotice(filedialog("test filedialog","c:\echo_chung\*.bas"))
'guinotice(filedialog("test filedialog","c:\echo_chung\*.bas,basic files "))
'guinotice(filedialog("test filedialog","*.bas,basic files ;*.bi,bi files ;*.txt,text files "))
Sub guiinitopenglfont
    Dim As hfont hFont '= GetStockObject(DEFAULT_GUI_FONT)
    Dim As LOGFONT lf
   'create a TrueType font to display.
   zeromemory(@lf,sizeof(LOGFONT))
   lf.lfHeight               =   -20 
   lf.lfWeight               =   FW_NORMAL 
   lf.lfCharSet              =   ANSI_CHARSET 
   lf.lfOutPrecision         =   OUT_DEFAULT_PRECIS 
   lf.lfClipPrecision        =   CLIP_DEFAULT_PRECIS 
   lf.lfQuality              =   DEFAULT_QUALITY 
   lf.lfPitchAndFamily       =   FF_DONTCARE Or DEFAULT_PITCH
   lf.lfFaceName             =   "Arial" 

   hFont = CreateFontIndirect(@lf)
   SelectObject (guiopenglwindc, hFont)
   'guiopenglfontlist = 99000' glGenLists(256)
   guiopenglfontlist = glGenLists(256)
	wglUseFontOutlines(guiopenglwindc, 0,256, guiopenglfontlist, 0.0f, 0.1f, WGL_FONT_POLYGONS,0)
	DeleteObject(hFont)
End Sub 
Sub guigltext(ByRef text As String)
Dim As ZString * 256 ztext 
 ztext=text 
 glListBase(guiopenglfontlist)
 glCallLists (Len(ztext), GL_UNSIGNED_BYTE, @ztext)
End Sub 
Declare Sub guiinitmyfont256()
Sub guistartOpenGL (ByRef controlname As String) 'start opengl , only one at a time
Dim As PIXELFORMATDESCRIPTOR pfd
Dim As Integer iFormat
guiopenglhwin = getguih(controlname)
If guiopenglhwin=0 Then 
	guinotice(controlname+" : not found !","guistartopenGL")
Else 
    '/* get the device context (DC) */
    guiopenglwindc = GetDC (guiopenglhWin)
    guiwindc0 = 0'GetDC (0)
    '/* set the pixel format for the DC */
    ZeroMemory (@pfd, sizeof (pfd))
    pfd.nSize = sizeof (pfd)
    pfd.nVersion = 1
    pfd.dwFlags = PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER
    pfd.iPixelType = PFD_TYPE_RGBA
    pfd.cColorBits = 24
    pfd.cDepthBits = 16
    pfd.cStencilBits = 8 '8 bits stencil
    pfd.iLayerType = PFD_MAIN_PLANE
    
    iFormat = ChoosePixelFormat (guiopenglwindc, @pfd)
    SetPixelFormat (guiopenglwindc, iFormat, @pfd)
    '/* create and enable the render context (RC) */
    guiopenglhRC = wglCreateContext( guiopenglwindc )
    wglMakeCurrent( guiopenglwindc, guiopenglhRC )

    guiinitopenglfont()
    #Ifndef noguijpeg
    guiinitmyfont256()
    #EndIf 

EndIf 
End Sub
Sub guicloseOpenGL 'close and purge opengl
    wglMakeCurrent (NULL, NULL)
    wglDeleteContext (guiopenglhRC)
    ReleaseDC (guiopenglhWin, guiopenglwindc)
    deletedc(guiopenglwindc)
    'ReleaseDC (guiopenglhWin, guiwindc0)
    'deletedc(guiwindc0)
End Sub 
Sub guirefreshopenGL
    glFlush ' Tells OpenGL to finish any calls that have been made
    SwapBuffers(guiopenglwindc)
End Sub 
Function guicreateDIBbmp(ByVal x As uint,ByVal y As uint) As hbitmap
    Dim bi32BitInfo As BITMAPINFO,hbmp As hbitmap
    With bi32BitInfo.bmiHeader
        .biBitCount = 32
        .biCompression =0' BI_RGB
        .biPlanes = 1
        .biSize = Len(bi32BitInfo.bmiHeader)
        .biWidth = x
        .biHeight = y
    End With
    hbmp= CreateDIBSection(guiwindc0, @bi32BitInfo, DIB_RGB_COLORS, 0, 0,0)
    'guinotice("hbmp="+Str(hbmp))
Return hbmp
End Function
#Ifndef noguijpeg
Dim Shared As uint guialpha=255 
Function guiloadtexture(ByRef filename As String,ByVal maxcolor As uint=255, ByVal alph As uint=127,typealpha As uint=0) As uint 
	                     'bmp jpg gif ico
Dim As hbitmap hbmp,hbmp2
Dim As hdc bmpdc,bmp2dc
Dim As uint x,y,bmpx,bmpy,itexture
Dim As Any Ptr bmpbits
Const ScrCopy = &HCC0020
'If guiwindc0=0 Then guiwindc0=getdc(0)
'guiwindc0=0'guiopenglwindc
'hbmp=guiloadbmpdib("bmp/bmp256x256.bmp")
If FileExists(filename)=0 Then Return 0
hbmp2=guiloadimage(filename)
bmp2dc=createcompatibleDC(guiwindc0)
selectobject(bmp2dc,hbmp2)
guigetbmpXY(bmp2dc,x,y)
hbmp=guicreateDIBbmp(x,y)
bmpbits=guigetbmpdibbits(hbmp)
'guinotice("bmpbits "+Str(bmpbits))
bmpdc=createcompatibleDC(guiwindc0)
selectobject(bmpdc,hbmp)
guigetbmpXY(bmpdc,bmpx,bmpy)
'guinotice("x="+Str(x)+"  y="+Str(y)+"  bmpx="+Str(bmpx)+" bmpy="+Str(bmpy))
'SetStretchBltMode(bmpdc,COLORONCOLOR )
'StretchBlt(bmpdc, 0, 0, bmpx,bmpy, bmp2dc, 0, 0, x,y, ScrCopy)
bitblt(bmpdc,0,0,bmpx,bmpy,bmp2dc,0,0,srccopy)
Dim As uint pix,k:Dim As uint i
ReDim As uint picbits(1 To bmpx*bmpy)
If maxcolor=255 Then 
  GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=(guialpha And 255) Shl 24 ' or guialpha default alpha
  For i=1 To UBound(picbits)
	 picbits(i)=picbits(i) Or k
  Next
  SetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
EndIf 
If maxcolor<>255 Then 
  GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=(alph And 255) Shl 24 ' add alpha if color>maxcolor
  Var k2=(230 And 255) Shl 24 ' add alpha if color>maxcolor
  If typealpha=0 Then
  	Var maxcolor3=3*maxcolor
   For i=1 To UBound(picbits)
	  pix=picbits(i)
	  If ((pix And 255)+((pix Shr 8)And 255)+((pix Shr 16)And 255))>maxcolor3 Then 
	 	 picbits(i)=k Or pix
	  EndIf
   Next
  ElseIf typealpha=1 Then 
   For i=1 To UBound(picbits)
	  pix=picbits(i)
	  If ((pix And 255)>maxcolor Or ((pix Shr 8)And 255)>maxcolor Or ((pix Shr 16)And 255)>maxcolor) Then 
	 	 picbits(i)=k Or pix
	  EndIf
   Next
  ElseIf typealpha=2 Then 
   For i=1 To UBound(picbits)
	  pix=picbits(i)
	  If ((pix And 255)>maxcolor Or ((pix Shr 8)And 255)>maxcolor Or ((pix Shr 16)And 255)>maxcolor) Then 
	 	 picbits(i)=k Or pix
	  Else
	  	 picbits(i)=k2 Or pix 
	  EndIf
   Next
  Else
  	Var kpix=(255 Shl 16)+(255 Shl 8)+255
   For i=1 To UBound(picbits)
	  pix=picbits(i)
	  k=(((pix And 255)+((pix Shr 8)And 255)+((pix Shr 16)And 255))\3)
	  If k<maxcolor Then k=0
	  picbits(i)=(k Shl 24) Or kpix
   Next
  EndIf 	
  SetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
EndIf 
glGenTextures(1, @itexture)
'guinotice("texture="+Str(itexture),"ok")
glEnable GL_TEXTURE_2D 
glBindTexture(GL_TEXTURE_2D, itexture) 
gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA_ext ,GL_UNSIGNED_BYTE ,bmpbits )
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA ,GL_UNSIGNED_byte ,@(picbits(1)) ) 
'guinotice("ok mipmap")
glBindTexture (GL_TEXTURE_2D, 0)
deletedc(bmpdc)
deletedc(bmp2dc)
deleteobject(hbmp2)
deleteobject(hbmp)
Return itexture 
End Function
Function guiloadtexturenomipmap(ByRef filename As String,ByVal maxcolor As uint=255, ByVal alph As uint=127) As uint 
	                     'bmp jpg gif ico
Dim As hbitmap hbmp,hbmp2
Dim As hdc bmpdc,bmp2dc
Dim As uint x,y,bmpx,bmpy,itexture
Dim As Any Ptr bmpbits
Const ScrCopy = &HCC0020
'If guiwindc0=0 Then guiwindc0=getdc(0)
'guiwindc0=0'guiopenglwindc
'hbmp=guiloadbmpdib("bmp/bmp256x256.bmp")
If FileExists(filename)=0 Then Return 0
hbmp2=guiloadimage(filename)
bmp2dc=createcompatibleDC(guiwindc0)
selectobject(bmp2dc,hbmp2)
guigetbmpXY(bmp2dc,x,y)
hbmp=guicreateDIBbmp(x,y)
bmpbits=guigetbmpdibbits(hbmp)
'guinotice("bmpbits "+Str(bmpbits))
bmpdc=createcompatibleDC(guiwindc0)
selectobject(bmpdc,hbmp)
guigetbmpXY(bmpdc,bmpx,bmpy)
'guinotice("x="+Str(x)+"  y="+Str(y)+"  bmpx="+Str(bmpx)+" bmpy="+Str(bmpy))
'SetStretchBltMode(bmpdc,COLORONCOLOR )
'StretchBlt(bmpdc, 0, 0, bmpx,bmpy, bmp2dc, 0, 0, x,y, ScrCopy)
bitblt(bmpdc,0,0,bmpx,bmpy,bmp2dc,0,0,srccopy)
Dim As uint pix,k:Dim As uint i:Dim As UByte Ptr pixptr
ReDim As uint picbits(1 To bmpx*bmpy)
If maxcolor<>255 Then 
  GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=(alph And 255) Shl 24 ' add alpha if color>maxcolor
  Var maxcolor3=3*maxcolor
  For i=1 To UBound(picbits)
	 'pix=picbits(i)
	 'If ((pix And 255)+((pix Shr 8)And 255)+((pix Shr 16)And 255))>3*maxcolor Then 
	 pixptr=Cast(UByte Ptr,@picbits(i))
	 If (pixptr[0]+pixptr[1]+pixptr[2])>maxcolor3 Then 
	 	picbits(i)=k Or picbits(i)'pix
	 EndIf
  Next
  SetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
EndIf 
glGenTextures(1, @itexture)
'guinotice("texture="+Str(itexture),"ok")
glEnable GL_TEXTURE_2D 
glBindTexture(GL_TEXTURE_2D, itexture) 
Dim As Single dx,dy 
dx=log(bmpx)/Log(2)
dy=Log(bmpy)/Log(2)
If (Abs(Int(dx)-dx)<0.00001) And (Abs(Int(dy)-dy)<0.00001) Then 
   glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_linear)
   glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_linear)'NEAREST)'nomipmap
   glTexImage2D(GL_texture_2d,0,4, bmpx,bmpy, 0,gl_bgra,GL_UNSIGNED_BYTE, bmpbits)
Else 
   gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA_ext ,GL_UNSIGNED_BYTE ,bmpbits )
EndIf 
'gluBuild2DMipmaps(GL_TEXTURE_2D, 4, bmpx,bmpy, GL_BGRA ,GL_UNSIGNED_byte ,@(picbits(1)) ) 
'guinotice("ok mipmap")
glBindTexture (GL_TEXTURE_2D, 0)
deletedc(bmpdc)
deletedc(bmp2dc)
deleteobject(hbmp2)
deleteobject(hbmp)
Return itexture 
End Function
Dim Shared As uint myguifont256text
Sub myguiglchar(car As String)
Dim As Integer k
Dim As Single tx,ty,dtx=1/16-0.002,dx0=0,dx=0.5,dty=0.7/16
'Dim As Single tx,ty,dtx=0.99*1/16,dx0=0,dx=0.8,dty=0.99*0.7/16
k=Asc(car)
tx=(k\16)/16-1/32+0.002:ty=1-(k Mod 16)/16-1/32
'tx=(k\16)/16-0.003'-1/32
'ty=1-(k Mod 16)/16-1/16+0.003
	glbegin(gl_quads)
	glTexCoord2f(tx,ty)
	glvertex3f(-dx,-dx0,0)
	gltexcoord2f(tx+dtx,ty)
	glvertex3f(dx,-dx0,0)
	glTexCoord2f(tx+dtx,ty+dty)
	glvertex3f(dx,dx+dx,0)
	gltexcoord2f(tx,ty+dty)
	glvertex3f(-dx,dx+dx,0)
	glend()
End Sub
Sub myguigltext(text As String)
Dim As Integer i
Dim As String car 
If text="" Then Exit Sub
glenable gl_alpha_test
glAlphaFunc(gl_greater,10/254)
'glscalef(1.74*0.8,0.8,0.8)
For i=1 To Len(text)
	car=Mid(text,i,1)
	myguiglchar(car)
	If car=" " Then
		gltranslatef(0.28,0,0)
		'gltranslatef(0.45/1.3,0,0)
	Else
		gltranslatef(0.5,0,0)
		'gltranslatef(0.65/1.3,0,0)
	EndIf
Next
gldisable gl_alpha_test
End Sub
Sub guiinitmyfont256()
myguifont256text=guiloadtexture("media/myfont256.bmp",100)
'myguifont256text=guiloadtexture("media/mygothic512.bmp",100)
'myguifont256text=guiloadtexture("media/mygothic1024.bmp",100)
End Sub 
#EndIf 
Sub guideletetexture(ByVal itexture As uint)
	If itexture>0 Then glDeleteTextures (1,@itexture)
End Sub
Function guicurrentcontrolname() As String
	return guicontrolname(iguicontrol)
End Function
Sub guisleep(ByVal ms As Integer)
Dim As Integer t 
t=ms
If t<1 Then t=1
If t>30000 Then t=30000
Sleep t
End Sub
#Ifndef noguijpeg
Function guiBload( ByVal bmpbuffer As Any Ptr=0, _   
	                ByRef filename As String,ByVal maxcolor As uint=255,_  
	                     ByVal alph As uint=RGB(255,0,255), _   
	                     ByVal alphatype As uint=0)As uint 
	                     'bmp jpg gif ico -> freebasic screen or bmp buffer
Dim As hbitmap hbmp,hbmp2
Dim As hdc bmpdc,bmp2dc
Dim As uint x,y,bmpx,bmpy,itexture
Dim As Any Ptr bmpbits
Const ScrCopy = &HCC0020
'If guiwindc0=0 Then guiwindc0=getdc(0)
'guiwindc0=0'guiopenglwindc
'hbmp=guiloadbmpdib("bmp/bmp256x256.bmp")
If FileExists(filename)=0 Then Return 0
hbmp2=guiloadimage(filename)
bmp2dc=createcompatibleDC(guiwindc0)
selectobject(bmp2dc,hbmp2)
guigetbmpXY(bmp2dc,x,y)
hbmp=guicreateDIBbmp(x,y)
bmpbits=guigetbmpdibbits(hbmp)
'guinotice("bmpbits "+Str(bmpbits))
bmpdc=createcompatibleDC(guiwindc0)
selectobject(bmpdc,hbmp)
guigetbmpXY(bmpdc,bmpx,bmpy)
'guinotice("x="+Str(x)+"  y="+Str(y)+"  bmpx="+Str(bmpx)+" bmpy="+Str(bmpy))
'SetStretchBltMode(bmpdc,COLORONCOLOR )
'StretchBlt(bmpdc, 0, 0, bmpx,bmpy, bmp2dc, 0, 0, x,y, ScrCopy)
bitblt(bmpdc,0,0,bmpx,bmpy,bmp2dc,0,0,srccopy)
Dim As uint pix,k:Dim As uint i,j
ReDim As uint picbits(1 To bmpx*bmpy)
GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
If maxcolor<>255 And alphatype=0 Then 
  'GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=alph'rgb(255,0,255)'(alph And 255) Shl 24 ' add alpha if color>maxcolor and alphatype=0
  For i=1 To UBound(picbits)
	 pix=picbits(i)
	 If ((pix And 255)+((pix Shr 8)And 255)+((pix Shr 16)And 255))>3*maxcolor Then 
	 	picbits(i)=k' Or pix
	 EndIf
  Next
  'SetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
EndIf 
If alphatype=1 Then 
  'GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=alph'rgb(255,0,255)'(alph And 255) Shl 24 ' add alpha if color=maxcolor and alphatype=1
  For i=1 To UBound(picbits)
	 pix=picbits(i)
	 If (pix=maxcolor) Then 
	 	picbits(i)=k' Or pix
	 EndIf
  Next
  'SetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
EndIf 
If bmpbuffer<>0 Then
	'Put bmpbuffer,(0,0),@picbits(1),PSet 
	k=0
	For j=0 To bmpy-1
    	For i=0 To bmpx-1
			k+=1
			PSet bmpbuffer,(i,j),picbits(k)
		Next
	Next
Else
	'Put (0,0),@picbits(1),PSet
	k=0
	For j=0 To bmpy-1
    	For i=0 To bmpx-1
			k+=1
			PSet (i,j),picbits(k)
		Next
	Next
EndIf
deletedc(bmpdc)
deletedc(bmp2dc)
deleteobject(hbmp2)
deleteobject(hbmp)
ReDim As uint picbits(1)
Return 0 
End function
sub guigetgfxbmpXY(ByVal bmp As Any Ptr,ByRef bmpx As uint,ByRef bmpy As uint)
Dim As uint i=0,j=8000,k  'freebasic gfx bmp
k=j
while (j-i)>=2
  k=int((i+j)/2)
  if Point(k,0,bmp)<>-1 then i=k else j=k
wend
bmpx=max(1,j)
i=0:j=2000
k=j
while (j-i)>=2
  k=int((i+j)/2)
  if Point(0,k,bmp)<>-1 then i=k else j=k
wend
bmpy=max(1,j)
End Sub
Function guiBloadresize( ByVal bmpbuffer As Any Ptr=0, _   
	                ByRef filename As String,ByVal maxcolor As uint=255,_  
	                     ByVal alph As uint=RGB(255,0,255), _   
	                     ByVal alphatype As uint=0)As uint 
	                     'bmp jpg gif ico -> freebasic screen or bmp buffer
Dim As hbitmap hbmp,hbmp2
Dim As hdc bmpdc,bmp2dc
Dim As uint x,y,bmpx,bmpy,itexture
Dim As Any Ptr bmpbits
Const ScrCopy = &HCC0020
'If guiwindc0=0 Then guiwindc0=getdc(0)
'guiwindc0=0'guiopenglwindc
'hbmp=guiloadbmpdib("bmp/bmp256x256.bmp")
If FileExists(filename)=0 Then Return 0
hbmp2=guiloadimage(filename)
bmp2dc=createcompatibleDC(guiwindc0)
selectobject(bmp2dc,hbmp2)
guigetbmpXY(bmp2dc,x,y)
guigetgfxbmpXY(bmpbuffer,bmpx,bmpy)
hbmp=guicreateDIBbmp(bmpx,bmpy)
bmpbits=guigetbmpdibbits(hbmp)
'guinotice("bmpbits "+Str(bmpbits))
bmpdc=createcompatibleDC(guiwindc0)
selectobject(bmpdc,hbmp)
guigetbmpXY(bmpdc,bmpx,bmpy)
'guinotice("x="+Str(x)+"  y="+Str(y)+"  bmpx="+Str(bmpx)+" bmpy="+Str(bmpy))
'SetStretchBltMode(bmpdc,COLORONCOLOR )
StretchBlt(bmpdc, 0, 0, bmpx,bmpy, bmp2dc, 0, 0, x,y, ScrCopy)
'bitblt(bmpdc,0,0,bmpx,bmpy,bmp2dc,0,0,srccopy)
Dim As uint pix,k:Dim As uint i,j
ReDim As uint picbits(1 To bmpx*bmpy)
GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
If maxcolor<>255 And alphatype=0 Then 
  'GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=alph'rgb(255,0,255)'(alph And 255) Shl 24 ' add alpha if color>maxcolor and alphatype=0
  For i=1 To UBound(picbits)
	 pix=picbits(i)
	 If ((pix And 255)+((pix Shr 8)And 255)+((pix Shr 16)And 255))>3*maxcolor Then 
	 	picbits(i)=k' Or pix
	 EndIf
  Next
  'SetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
EndIf 
If alphatype=1 Then 
  'GetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
  k=alph'rgb(255,0,255)'(alph And 255) Shl 24 ' add alpha if color=maxcolor and alphatype=1
  For i=1 To UBound(picbits)
	 pix=picbits(i)
	 If (pix=maxcolor) Then 
	 	picbits(i)=k' Or pix
	 EndIf
  Next
  'SetBitmapBits hbmp,bmpx*bmpy*4,@PicBits(1)
EndIf 
If bmpbuffer<>0 Then
	'Put bmpbuffer,(0,0),@picbits(1),PSet 
	k=0
	For j=0 To bmpy-1
    	For i=0 To bmpx-1
			k+=1
			PSet bmpbuffer,(i,j),picbits(k)
		Next
	Next
Else
	'Put (0,0),@picbits(1),PSet
	k=0
	For j=0 To bmpy-1
    	For i=0 To bmpx-1
			k+=1
			PSet (i,j),picbits(k)
		Next
	Next
EndIf
deletedc(bmpdc)
deletedc(bmp2dc)
deleteobject(hbmp2)
deleteobject(hbmp)
ReDim As uint picbits(1)
Return 0 
End Function
#EndIf 
Function guiinkey() As String
guiscan
If guichar<>"" Then
	Var key=guichar:guichar=""
	Return key
EndIf
Return ""
End Function
Dim Shared As Integer noticequit=0
Sub subnoticeok()
	noticequit=1
End Sub
Sub subnoticeno()
	noticequit=2
End Sub
Function widthmsg(msg As String) As Integer
Dim As Integer i=0,j=0,k=0
Dim As String text,key
text=Trim(msg)
For j=1 To Len(text)
	key=Mid(text,j,1)
	If key=Chr(10) Then i=0
	If Len(Trim(key))=0 Or InStr(" .,;:!",key)>0 Then i+=3 Else i+=8
	If k<i Then k=i
Next
Return k
End Function
Function heightmsg(msg As String) As Integer
Dim As Integer i=0,j=0,k=16
Dim As String text
text=Trim(msg)
For j=1 To Len(text)
	If Mid(text,j,1)=Chr(10) Then k+=16
Next
Return k+4
End Function
Sub notice(ByRef msg0 As string,ByRef title As String ="notice")
Dim As Integer dx,dy,x,y,depth,lmsg,hmsg
Dim As String jpg
jpg="media/scroll.jpg"
ScreenInfo x,y,depth 
dx=300
dy=180
Var msg=msg0
lmsg=widthmsg(msg)'Len(Trim(msg))*8
hmsg=heightmsg(msg)
If lmsg>dx-10 Then msg=Right(msg,90)
If lmsg>dx-10 Or hmsg>dy-10 Then
  If hmsg>dy-10 Then 
   	dx=500:dy=500
   	jpg="media/scroll500.jpg"
  Else
   	dx=500:dy=320
   	jpg="media/scroll500x300.jpg"
  EndIf 	
EndIf
guiedittextbackcolor(240,230,140)
edittext("notice.msg",Trim(msg),@subnoticeok,dx*0.5-lmsg/2,dy*0.45-hmsg/2,lmsg,hmsg)
button("notice.ok","yes",@subnoticeok,dx*0.5,dy-50,70,25)
staticbmp("notice.image",jpg,0,0,dx,dy)
openwindow("notice",title,x*0.5-dx/2,y*0.5-dy/2,dx+2,dy+2,WS_popupwindow, _   
           WS_EX_TOPMOST)' Or WS_EX_TRANSPARENT)
trapclose("notice",@subnoticeok)
guisetfocus("notice.ok")
noticequit=0
guirefreshopengl
guirefreshopengl
While guitestkey(vk_escape)=0 And guitestkey(vk_space)=0 _  
	   And guitestkey(vk_return)=0 And noticequit=0 
	guiscan
	Sleep 200
Wend
guiclosewindow("notice")
guiedittextbackcolor(255,255,255)
guirefreshopengl
guirefreshopengl
End Sub
Sub confirm(ByRef msg0 As string,ByRef title As String="confirm",ByRef resp As String)
Dim As Integer dx,dy,x,y,depth,lmsg,hmsg
Dim As String jpg
jpg="media/scroll.jpg"
ScreenInfo x,y,depth 
dx=300
dy=180
Var msg=msg0
lmsg=widthmsg(msg)'Len(Trim(msg))*8
hmsg=heightmsg(msg)
If lmsg>dx-10 Then msg=Right(msg,90)
If lmsg>dx-10 Or hmsg>dy-10 Then
  If hmsg>dy-10 Then 
   	dx=500:dy=500
   	jpg="media/scroll500.jpg"
  Else
   	dx=500:dy=320
   	jpg="media/scroll500x300.jpg"
  EndIf 	
EndIf
guiedittextbackcolor(240,230,140)
edittext("confirm.msg",Trim(msg),@subnoticeok,dx*0.5-lmsg/2,dy*0.47-hmsg/2,lmsg,hmsg)
button("confirm.ok","yes",@subnoticeok,dx*0.5-70,dy-50,70,25)
button("confirm.no","no",@subnoticeno,dx*0.5+5,dy-50,70,25)
staticbmp("confirm.image",jpg,0,0,dx,dy)
openwindow("confirm",title,x*0.5-dx/2,y*0.5-dy/2,dx+2,dy+2,WS_popupwindow, _   
           WS_EX_TOPMOST)
trapclose("confirm",@subnoticeno)
guisetfocus("confirm.ok")
noticequit=0
guirefreshopengl
guirefreshopengl
While guitestkey(vk_escape)=0 And noticequit=0 
	guiscan
	Sleep 200
Wend
If noticequit=1 Then resp="yes" Else resp="no"
guiedittextbackcolor(255,255,255)
guiclosewindow("confirm")
guirefreshopengl
End Sub
'notice "ok"
'var resp0=""
'confirm "this is a test",,resp0
