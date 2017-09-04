'gui_chung a program by NGUYEN.Chung (freeware 2010)


list of useable procedures


Sub guinotice(ByRef msg As string,ByRef title As String ="notice")

Sub guiconfirm(ByRef msg As string,ByRef title As string,ByRef resp As String)

Sub guireset()

Function guiloadimage(ByRef filename As String) As hbitmap
          'Supported types; bmp,emf,wmf,jpg,ico,gif
Function guiloadbmp(ByRef filename As String) As hbitmap

Function guiloadbmpdib(ByRef filename As String) As hbitmap

Function guigetbmpdibbits(ByVal hbmp As hbitmap) As Any Ptr  

Sub button(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        userflags As uint = 0)
 
Function getguiindex(ByRef controlname As String) As uint 
 
Function getguih(ByRef controlname As String) As hwnd 

function getguihname(ByVal guihwin As hwnd) As String

Sub printguih(ByVal hcontrol As hwnd,ByRef controltext As String)

Sub printgui(Byref controlname As String,Byref controltext As String)

Function guigettexth(ByVal hcontrol As hwnd) As String

Function guigettext(Byref controlname As String) As String 
 
Sub guirefresh

Sub guirefreshwindow(ByRef windowname As String)

Sub guirefreshcontrolh(ByVal hcontrol As hwnd)

Sub guirefreshcontrol(Byref controlname As String)

Sub setedittextfont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE)
	
Sub setstatictextfont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE)

Sub setlistboxfont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE)

Sub setbuttonfont(ByVal fontnum As uint,ByVal size As uint = 0,ByVal italic As Byte = FALSE)

Sub guiclosewindow(ByRef windowname As String)
  
Sub graphicbox(Byref controlname As String, _ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        ByRef graphtype As String = "gfx",ByVal userflags As uint = 0)

Function getguigfxbuffer(ByRef controlname As String) As Any Ptr

Sub guiscan

Sub guiwait

Sub guibackgroundcolor(r As uint,g As uint,b As uint)

Sub guiedittextbackcolor(r As uint,g As uint,b As uint)

Sub guilistboxbackcolor(r As uint,g As uint,b As uint)

Sub guiedittextinkcolor(r As uint,g As uint,b As uint)

Sub guilistboxinkcolor(r As uint,g As uint,b As uint)

Sub guistatictextinkcolor(r As uint,g As uint,b As uint)

Sub openwindow (ByVal windowname As String,ByVal windowtext As String,_ 
                ByVal x As uint,ByVal y As uint,ByVal dx As uint,ByVal dy As uint,_
                ByVal windowtype As uint = guiwindowdefautflag)

Sub guiclose(ByVal opt As String = "nomsg")

Sub guiquit(ByRef opt As String = "nomsg")

Sub trapclose(ByRef windowname As String,ByVal closesub As Sub())	

Sub trapresize(ByRef windowname As String,ByVal resizesub As Sub())	

Sub trapkeyboard(ByRef windowname As String,ByVal keyboardsub As Sub())	

Sub trapLeftmouse(ByRef controlname As String,ByVal mousesub As Sub())	

Sub trapRightmouse(ByRef controlname As String,ByVal mousesub As Sub())	

Sub trapmovemouse(ByRef controlname As String,ByVal mousesub As Sub())	

Sub enableguih(ByVal hcontrol As hwnd)

Sub disableguih(ByVal hcontrol As hwnd)

Sub enablegui(ByRef controlname As String)

Sub disablegui(ByRef controlname As String)

Sub showguih(ByVal hcontrol As hwnd)

Sub hideguih(ByVal hcontrol As hwnd)

Sub showgui(ByRef controlname As String)

Sub hidegui(ByRef controlname As String)

Sub radiobutton(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
 
Sub checkbox(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
 
Sub iconbutton(Byref controlname As String,ByRef iconfile As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)
 
Sub bmpbutton(Byref controlname As String,ByRef bmpfile As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)

Sub staticicon(Byref controlname As String,ByRef iconfile As String,_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)

Sub staticbmp(Byref controlname As String,ByRef bmpfile As String,_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)

Sub statictext(Byref controlname As String,ByRef controltext As String,_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        userflags As uint = 0)
 
Sub edittext(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_
	        userflags As uint = 0)
 
Sub combobox(Byref controlname As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint)

Sub reloadcombo(ByRef comboname As String,liste() As string)
 
Sub addcombo(ByRef comboname As String,ByRef liste As String)
 
Sub selectcombotext(ByRef comboname As String,ByRef item As String,liste() As string)
 
Sub selectcomboindex(ByRef comboname As String,ByVal i As uint)
 
Sub getcomboindex(ByRef comboname As String,ByRef i As uint)
 
Sub removecombo(ByRef comboname As String,ByVal i As uint)
 
Sub resetcombo(ByRef comboname As String,ByVal i As uint)

Function getcombotext(ByRef comboname As String,liste() As string) As String
 
Sub setcheckbox(ByRef checkname As String)
 
Sub unsetcheckbox(ByRef checkname As String)

Sub listbox(Byref controlname As String,ByVal controlsub As Sub(),_ 
	        ByVal controlx As uint,ByVal controly As uint,ByVal controldx As uint,ByVal controldy As uint,_ 
	        userflags As uint = 0)

Sub reloadlistbox(ByRef listboxname As String,liste() As string)
 
Sub selectlistboxtext(ByRef listboxname As String,ByRef item As String,liste() As string)
 
Sub addlistbox(ByRef listboxname As String,ByRef text As String)

Function getlistboxtextbyindex(ByRef listboxname As String,ByVal index As uint) As String
 
Sub getlistboxindex(ByRef listboxname As String,ByRef i As uint)
 
Sub selectlistboxindex(ByRef listboxname As String,ByVal i As uint)
 
Function getlistboxtext(ByRef listboxname As String) As String

Function guiiswindowopen(ByRef windowname As String) As UInteger

Function guiisopen(ByRef windowname As String) As UInteger

Sub guigetwindowpos(ByRef windowname As String,ByRef x As uint,ByRef y As uint,_ 
	                 ByRef dx As uint,ByRef dy As uint)

Sub guimovewindow(ByRef windowname As String,ByVal x As uint,ByVal y As uint,_ 
	               ByVal dx As uint,ByVal dy As uint)

Sub guimovecontrol(ByRef controlname As String,ByVal x As uint,ByVal y As uint,_ 
	               ByVal dx As uint = 0,ByVal dy As uint = 0)

Sub guishowwindow(ByRef windowname As String)

Sub guisetfocus(ByRef windowname As String)

Sub addusersub(ByVal i As uint,usersub As Sub() )

Sub changeusersub(ByVal i As uint,usersub As Sub())

Sub addmenu(Byref controlname As String,ByRef controltext As String,_
	           ByVal controlflag As uint = MF_STRING Or MF_POPUP) 

Sub addmenuitem(Byref controlname As String,ByRef controltext As String,ByVal controlsub As Sub(),_
	             ByVal controlflag As uint = MF_STRING) 

Sub setcheckmenu(ByRef menuname As String,ByVal i As uint)

Sub uncheckmenu(ByRef menuname As String,ByVal i As uint)

Sub enablemenu(ByRef menuname As String,ByVal i As uint)

Sub disablemenu(ByRef menuname As String,ByVal i As uint)

Sub setmenutext(ByRef menuname As String,ByVal i As uint,ByRef text As String)

Function guitestkey(ByVal ikey As uint) As Integer

function guiword(ByRef t As string,ByVal i As uint,ByRef s As String) As String

Function filedialog(ByRef titre As String,ByRef filtre As String = "") As String

Sub guigltext(ByRef text As String)

Sub guistartOpenGL (ByRef controlname As String) 'start opengl , only one at a time

Sub guicloseOpenGL 'close and purge opengl

Sub guirefreshopenGL

Function guicreateDIBbmp(ByVal x As uint,ByVal y As uint) As hbitmap

Function guiloadtexture(ByRef filename As String,ByVal maxcolor As uint=255, ByVal alph As uint=127) As uint 'bmp jpg gif ico

Sub guideletetexture(ByVal itexture As uint)

