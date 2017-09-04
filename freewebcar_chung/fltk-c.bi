#ifndef __FLTK_C_BI__
#define __FLTK_C_BI__

'  FreeBASIC header file for the Fast Light Tool Kit C wrapper.
'  FLTK C wrapper copyright 2013-2015 by D.J.Peters

'  C++ library Fast Light Tool Kit (FLTK)
'  Copyright 1998-2010 by Bill Spitzak and others.
' 
'  This library is free software. Distribution and use rights are outlined in
'  the file "COPYING" which should have been included with this file.  If this
'  file is missing or damaged, see the license at:
' 
'    http:' www.fltk.org/COPYING.php
' 
'  Please report all FLTK C wrapper bugs and problems on the following page:
' 
'    http://freebasic.net/forum/viewtopic.php?f=14&t=21548

/' ' for my private debug session don't use this defines please
#define NO_BOX
#define NO_BROWSER
#define NO_CANVAS
#define NO_CHART
#define NO_CHOICE
#define NO_COLORCHOOSER
#define NO_DIALOG
#define NO_DRAWING
#define NO_FILEICON
#define NO_GROUP
#define NO_HELPVIEW
#define NO_IMAGE
#define NO_INPUT
#define NO_MENU
#define NO_NFC
#define NO_PREFERENCES
#define NO_PROGRESS
#define NO_SURFACE
#define NO_PAGEDSURFACE
#define NO_PRINTER
#define NO_TABLE
#define NO_TEXT
#define NO_TOOL
#define NO_TOOLTIP
#define NO_TREE
#define NO_URI
#define NO_UTF8
#define NO_VALUATOR
#define NO_OPENGL
#define NO_GLUT
'/


#ifdef __FB_WIN32__
 #ifndef __FB_64BIT__
  #inclib "fltk-c-1.3.3-32" ' Windows 32-bit
 #else
  #inclib "fltk-c-1.3.3-64" ' Windows 64-bit
 #endif
#else
 #ifndef NOSYSLIB
  #ifndef __FB_64BIT__
   #inclib "fltk-c-1.3.3-32-syslib" ' Linux 32-bit will use syslib's libjpeg,libpng,libz from your distro
  #else
   #inclib "fltk-c-1.3.3-64-syslib" ' Linux 64-bit with use syslib's libjpeg,libpng,libz from your distro
  #endif
  #inclib "png"
  #inclib "jpeg"
  #inclib "z"
 #else
  #ifndef __FB_64BIT__
   #inclib "fltk-c-1.3.3-32" ' Linux 32-bit
  #else
   #inclib "fltk-c-1.3.3-64" ' Linux 64-bit
  #endif
 #endif
 ' #inclib "Xcursor" ' if you get open references to color icon support on linux
#endif

#include once "crt/stdio.bi"
#include once "crt/string.bi"
#include once "crt/stdlib.bi"


' FLTK const's
type Fl_Align as ulong
const as Fl_Align Fl_ALIGN_CENTER             = &H0000
const as Fl_Align Fl_ALIGN_TOP                = &H0001
const as Fl_Align Fl_ALIGN_BOTTOM             = &H0002
const as Fl_Align Fl_ALIGN_LEFT               = &H0004
const as Fl_Align Fl_ALIGN_LEFT_TOP           = &H0007 '  magic value
const as Fl_Align Fl_ALIGN_RIGHT              = &H0008

const as Fl_Align Fl_ALIGN_RIGHT_TOP          = &H000b '  magic value
const as Fl_Align Fl_ALIGN_LEFT_BOTTOM        = &H000d '  magic value
const as Fl_Align Fl_ALIGN_RIGHT_BOTTOM       = &H000e '  magic value
const as Fl_Align Fl_ALIGN_POSITION_MASK      = &H000f '  left, right, top, bottom
const as Fl_Align Fl_ALIGN_INSIDE             = &H0010
const as Fl_Align Fl_ALIGN_TEXT_OVER_IMAGE    = &H0020
const as Fl_Align Fl_ALIGN_IMAGE_OVER_TEXT    = &H0000
const as Fl_Align Fl_ALIGN_CLIP               = &H0040
const as Fl_Align Fl_ALIGN_WRAP               = &H0080
const as Fl_Align Fl_ALIGN_IMAGE_NEXT_TO_TEXT = &H0100
const as Fl_Align Fl_ALIGN_TEXT_NEXT_TO_IMAGE = &H0120
const as Fl_Align Fl_ALIGN_IMAGE_BACKDROP     = &H0200
const as Fl_Align Fl_ALIGN_TOP_LEFT           = Fl_ALIGN_TOP    or Fl_ALIGN_LEFT
const as Fl_Align Fl_ALIGN_TOP_RIGHT          = Fl_ALIGN_TOP    or Fl_ALIGN_RIGHT
const as Fl_Align Fl_ALIGN_BOTTOM_LEFT        = Fl_ALIGN_BOTTOM or Fl_ALIGN_LEFT
const as Fl_Align Fl_ALIGN_BOTTOM_RIGHT       = Fl_ALIGN_BOTTOM or Fl_ALIGN_RIGHT
const as Fl_Align Fl_ALIGN_IMAGE_MASK         = &H0320 '  l/r, t/b, backdrop

' Colors
type Fl_Color as ulong
' The Fl_Color type holds an FLTK color value.
' Colors are either 8-bit indexes into a virtual colormap or 24-bit RGB color values.
' Color indices occupy the lower 8 bits of the value, while RGB colors occupy the upper 24 bits, for a byte organization of RGBI.
' Fl_Color => &Hrrggbbii
'                | | | |
'                | | | +--- index between 0 and 255
'                | | +----- blue color component (8 bit)
'                | +------- green component (8 bit)
'                +--------- red component (8 bit)
' A color can have either an index or an rgb value. Colors with rgb set and an index >0 are reserved for special use.

'  Standard colors. These are used as default colors in widgets and altered as necessary
const as Fl_Color Fl_FOREGROUND_COLOR  =  0 ' /< the default foreground color (0) used for labels and text
const as Fl_Color Fl_BACKGROUND2_COLOR =  7 ' /< the default background color for text, list, and valuator widgets

const as Fl_Color Fl_INACTIVE_COLOR    =  8 ' /< the inactive foreground color
const as Fl_Color Fl_SELECTION_COLOR   = 15 ' /< the default selection/highlight color

#define Fl_FREE_COLOR     16
#define Fl_NUM_FREE_COLOR 16

'  boxtypes generally limit themselves to these colors so  the whole ramp is not allocated:
#define Fl_GRAY_RAMP                      32
#define Fl_NUM_GRAY                       24
const as Fl_Color Fl_GRAY0             =  32 '  'A'
const as Fl_Color Fl_DARK3             =  39 '  'H'
const as Fl_Color Fl_DARK2             =  45 '  'N'
const as Fl_Color Fl_DARK1             =  47 '  'P'
const as Fl_Color Fl_BACKGROUND_COLOR  =  49 '  'R' default background color
#define FL_GRAY FL_BACKGROUND_COLOR
const as Fl_Color Fl_LIGHT1            =  50 '  'S'
const as Fl_Color Fl_LIGHT2            =  52 '  'U'
const as Fl_Color Fl_LIGHT3            =  54 '  'W'

'  FLTK provides a 5x8x5 color cube that is used with colormap visuals
#define Fl_NUM_RED 5
#define Fl_NUM_GREEN 8
#define Fl_NUM_BLUE 5
#define Fl_COLOR_CUBE_                    56
const as Fl_Color Fl_BLACK             =  56 ' Fl_COLOR_CUBE_ + r000 + g000 + b000 
const as Fl_Color Fl_DARK_GREEN        =  60 ' Fl_COLOR_CUBE_ +        g004
const as Fl_Color Fl_GREEN             =  63 ' Fl_COLOR_CUBE_ +        g007
const as Fl_Color Fl_DARK_RED          =  72 ' Fl_COLOR_CUBE_ + r016
const as Fl_Color Fl_DARK_YELLOW       =  76
const as Fl_Color Fl_RED               =  88 ' Fl_COLOR_CUBE_ + r032
const as Fl_Color Fl_YELLOW            =  95  
const as Fl_Color Fl_DARK_BLUE         = 136 ' Fl_COLOR_CUBE_ +        r080
const as Fl_Color Fl_DARK_MAGENTA      = 152
const as Fl_Color Fl_DARK_CYAN         = 140
const as Fl_Color Fl_BLUE              = 216 ' Fl_COLOR_CUBE_ +        b160
const as Fl_Color Fl_MAGENTA           = 248
const as Fl_Color Fl_CYAN              = 223
const as Fl_Color Fl_WHITE             = 255 

const as Fl_Color FL_ICON_COLOR        = &Hffffffff ' icon color

type Fl_Font as ulong
const as Fl_Font Fl_HELVETICA              = 0 ' Helvetica (or Arial) normal (0)
const as Fl_Font Fl_BOLD                   = 1 ' bold
const as Fl_Font Fl_ITALIC                 = 2 ' oblique
const as Fl_Font Fl_BOLD_ITALIC            = 3 ' bold-oblique
const as Fl_Font Fl_HELVETICA_BOLD         = Fl_HELVETICA + Fl_BOLD
const as Fl_Font Fl_HELVETICA_ITALIC       = Fl_HELVETICA + Fl_ITALIC
const as Fl_Font Fl_HELVETICA_BOLD_ITALIC  = Fl_HELVETICA + Fl_BOLD_ITALIC
const as Fl_Font Fl_COURIER                = 4 ' Courier normal
const as Fl_Font Fl_COURIER_BOLD           = Fl_COURIER   + Fl_BOLD
const as Fl_Font Fl_COURIER_ITALIC         = Fl_COURIER   + Fl_ITALIC
const as Fl_Font Fl_COURIER_BOLD_ITALIC    = Fl_COURIER   + Fl_BOLD_ITALIC
const as Fl_Font Fl_TIMES                  = 8 ' Times roman
const as Fl_Font Fl_TIMES_BOLD             = Fl_TIMES     + Fl_BOLD
const as Fl_Font Fl_TIMES_ITALIC           = Fl_TIMES     + Fl_ITALIC
const as Fl_Font Fl_TIMES_BOLD_ITALIC      = Fl_TIMES     + Fl_BOLD_ITALIC
const as Fl_Font Fl_SYMBOL                 = 12 ' Standard symbol font
const as Fl_Font Fl_SCREEN                 = 13 ' Default monospaced screen font
const as Fl_Font Fl_SCREEN_BOLD            = Fl_SCREEN    + Fl_BOLD ' Default monospaced bold screen font
const as Fl_Font Fl_ZAPF_DINGBATS          = 15 ' Zapf-dingbats font
const as Fl_Font Fl_FREE_FONT              = 16 ' first one to allocate

' FLTK enums
type Fl_Beep as ulong
' See also: flBeep(v as Fl_Beep) 
const as Fl_Beep FL_BEEP_DEFAULT      = 0 ' Default beep.
const as Fl_Beep FL_BEEP_MESSAGE      = 1 ' Message beep.
const as Fl_Beep FL_BEEP_ERROR        = 2 ' Error beep.
const as Fl_Beep FL_BEEP_QUESTION     = 3 ' Question beep.
const as Fl_Beep FL_BEEP_PASSWORD     = 4 ' Password beep.
const as Fl_Beep FL_BEEP_NOTIFICATION = 5 ' Notification beep.


type FL_Boxtype as ulong
' note: you can't use this values direct as Fl_Boxtype param use Boxtype(value) instead
' var box = Fl_BoxNew2(Boxtype(FL_THIN_DOWN_BOX),10,10,200,100,"a thin down box")
' or
' Fl_WidgetSetBox widget,Boxtype(FL_ROUNDED_FRAME)
#define FL_NO_BOX 0

#define FL_FLAT_BOX 1
#define FL_UP_BOX 2
#define FL_DOWN_BOX 3
#define FL_UP_FRAME 4
#define FL_DOWN_FRAME 5

#define FL_THIN_UP_BOX 6
#define FL_THIN_DOWN_BOX 7
#define FL_THIN_UP_FRAME 8
#define FL_THIN_DOWN_FRAME 9

#define FL_ENGRAVED_BOX 10
#define FL_EMBOSSED_BOX 11
#define FL_ENGRAVED_FRAME 12
#define FL_EMBOSSED_FRAME 13
#define FL_BORDER_BOX 14
#define FL_SHADOW_BOX 15
#define FL_BORDER_FRAME 16
#define FL_SHADOW_FRAME 17
#define FL_ROUNDED_BOX 18
#define FL_RSHADOW_BOX 19
#define FL_ROUNDED_FRAME 20
#define FL_RFLAT_BOX 21
#define FL_OVAL_BOX 22
#define FL_OSHADOW_BOX 23 
#define FL_OVAL_FRAME 24
#define FL_OFLAT_BOX 25
#define FL_ROUND_UP_BOX 26 
#define FL_ROUND_DOWN_BOX 27
#define FL_DIAMOND_UP_BOX 28
#define FL_DIAMOND_DOWN_BOX 29

#define FL_PLASTIC_UP_BOX 30
#define FL_PLASTIC_DOWN_BOX 31
#define FL_PLASTIC_UP_FRAME 32
#define FL_PLASTIC_DOWN_FRAME 33
#define FL_PLASTIC_THIN_UP_BOX 34
#define FL_PLASTIC_THIN_DOWN_BOX 35
#define FL_PLASTIC_ROUND_UP_BOX 36
#define FL_PLASTIC_ROUND_DOWN_BOX 37

#define FL_GTK_UP_BOX 38
#define FL_GTK_DOWN_BOX 39
#define FL_GTK_UP_FRAME 40
#define FL_GTK_DOWN_FRAME 41
#define FL_GTK_THIN_UP_BOX 42
#define FL_GTK_THIN_DOWN_BOX 43
#define FL_GTK_THIN_UP_FRAME 44
#define FL_GTK_THIN_DOWN_FRAME 45
#define FL_GTK_ROUND_UP_BOX 46
#define FL_GTK_ROUND_DOWN_BOX 47

#define FL_GLEAM_UP_BOX 48
#define FL_GLEAM_DOWN_BOX 49
#define FL_GLEAM_UP_FRAME 50
#define FL_GLEAM_DOWN_FRAME 51
#define FL_GLEAM_THIN_UP_BOX 52
#define FL_GLEAM_THIN_DOWN_BOX 53
#define FL_GLEAM_ROUND_UP_BOX 54
#define FL_GLEAM_ROUND_DOWN_BOX 55

type FL_BrowserType as ulong
const as FL_BrowserType FL_NORMALBROWSER = 0
const as FL_BrowserType FL_SELECTBROWSER = 1
const as FL_BrowserType FL_HOLDBROWSER   = 2
const as FL_BrowserType FL_MULTIBROWSER  = 3

type FL_SortOrder as ulong
const as FL_SortOrder FL_SORT_ASCENDING  = 0 ' sort browser items in ascending alphabetic order.
const as FL_SortOrder FL_SORT_DESCENDING = 1 ' sort in descending order

type FL_ChartType as ulong
const as FL_ChartType FL_CHART_BAR        = 0
const as FL_ChartType FL_CHART_HORBAR     = 1
const as FL_ChartType FL_CHART_LINE       = 2
const as FL_ChartType FL_CHART_FILL       = 3
const as FL_ChartType FL_CHART_SPIKE      = 4
const as FL_ChartType FL_CHART_PIE        = 5
const as FL_ChartType FL_CHART_SPECIALPIE = 6

' The following enums define the mouse cursors that are available in FLTK.
' The double-headed arrows are bitmaps provided by FLTK on X, the others are provided by system-defined cursors.
type FL_Cursor as ulong
const as FL_Cursor FL_CURSOR_DEFAULT =   0 ' the default cursor, usually an arrow.
const as FL_Cursor FL_CURSOR_SE      =   8 ' for back compatibility.
const as FL_Cursor FL_CURSOR_S       =   9 ' for back compatibility.
const as FL_Cursor FL_CURSOR_SW      =   7 ' for back compatibility.
const as FL_Cursor FL_CURSOR_MOVE    =  27 ' 4-pointed arrow.
const as FL_Cursor FL_CURSOR_HAND    =  31 ' hand (uparrow on MSWindows).
const as FL_Cursor FL_CURSOR_ARROW   =  35 ' an arrow pointer.
const as FL_Cursor FL_CURSOR_W       =  36 ' for back compatibility.
const as FL_Cursor FL_CURSOR_HELP    =  47 ' question mark.
const as FL_Cursor FL_CURSOR_E       =  49 ' for back compatibility.
const as FL_Cursor FL_CURSOR_CROSS   =  66 ' crosshair.
const as FL_Cursor FL_CURSOR_NW      =  68 ' for back compatibility.
const as FL_Cursor FL_CURSOR_NE      =  69 ' for back compatibility.
const as FL_Cursor FL_CURSOR_N       =  70 ' for back compatibility.
const as FL_Cursor FL_CURSOR_WAIT    =  76 ' watch or hourglass.
const as FL_Cursor FL_CURSOR_INSERT  =  77 ' I-beam.
const as FL_Cursor FL_CURSOR_NS      =  78 ' up/down arrow.
const as FL_Cursor FL_CURSOR_WE      =  79 ' left/right arrow.
const as FL_Cursor FL_CURSOR_NWSE    =  80 ' diagonal arrow.
const as FL_Cursor FL_CURSOR_NESW    =  81 ' diagonal arrow.
const as FL_Cursor FL_CURSOR_NONE    = 255 ' invisible.

#define Fl_clipboard_plain_text "text/plain"
#define Fl_clipboard_image      "image"

type FL_ClockType as ulong
const as FL_ClockType FL_CLOCK_SQUARE = 0
const as FL_ClockType FL_CLOCK_ROUND  = 1

type FL_ColorChooserModes as ulong
const as FL_ColorChooserModes FL_COLORCHOOSER_DEFAULT = &HFFFFFFFF
const as FL_ColorChooserModes FL_COLORCHOOSER_RGB     = 0
const as FL_ColorChooserModes FL_COLORCHOOSER_BYTE    = 1
const as FL_ColorChooserModes FL_COLORCHOOSER_HEX     = 2
const as FL_ColorChooserModes FL_COLORCHOOSER_HSV     = 3

type Fl_CounterType as ulong
const as Fl_CounterType FL_COUNTER_NORMAL = 0 ' Displays a counter with 4 arrow buttons.
const as Fl_CounterType FL_COUNTER_SIMPLE = 1 ' Displays a counter with only 2 arrow buttons.

type FL_Damage as ulong
const as FL_Damage FL_DAMAGE_CHILD   = &H01 ' A child needs to be redrawn.
const as FL_Damage FL_DAMAGE_EXPOSE  = &H02 ' The window was exposed.
const as FL_Damage FL_DAMAGE_SCROLL  = &H04 ' The Fl_Scroll widget was scrolled.
const as FL_Damage FL_DAMAGE_OVERLAY = &H08 ' The overlay planes need to be redrawn.
const as FL_Damage FL_DAMAGE_USER1   = &H10 ' First user-defined damage bit.
const as FL_Damage FL_DAMAGE_USER2   = &H20 ' Second user-defined damage bit.
const as FL_Damage FL_DAMAGE_ALL     = &H80 ' Everything needs to be redrawn.

type FL_DialType as ulong
const as FL_DialType FL_DIAL_NORMAL = 0 ' Draws a normal dial with a knob.
const as FL_DialType FL_DIAL_LINE   = 1 ' Draws a dial with a line.
const as FL_DialType FL_DIAL_FILL   = 2 ' Draws a dial with a filled arc.

type Fl_Event as ulong
const as Fl_Event FL_EVENT_PUSH = 1 
const as Fl_Event FL_EVENT_RELEASE = 2

const as Fl_Event FL_EVENT_ENTER = 3
const as Fl_Event FL_EVENT_LEAVE = 4

const as Fl_Event FL_EVENT_DRAG = 5

const as Fl_Event FL_EVENT_FOCUS = 6
const as Fl_Event FL_EVENT_UNFOCUS = 7

const as Fl_Event FL_EVENT_KEYDOWN = 8
const as Fl_Event FL_EVENT_KEYBOARD = FL_EVENT_KEYDOWN ' both are defined as 8
const as Fl_Event FL_EVENT_KEYUP = 9

const as Fl_Event FL_EVENT_CLOSE = 10
const as Fl_Event FL_EVENT_MOVE = 11
const as Fl_Event FL_EVENT_SHORTCUT = 12

const as Fl_Event FL_EVENT_DEACTIVATE = 13
const as Fl_Event FL_EVENT_ACTIVATE = 14

const as Fl_Event FL_EVENT_HIDE = 15
const as Fl_Event FL_EVENT_SHOW = 16

const as Fl_Event FL_EVENT_PASTE = 17
const as Fl_Event FL_EVENT_SELECTIONCLEAR = 18

const as Fl_Event FL_EVENT_MOUSEWHEEL = 19

const as Fl_Event FL_EVENT_DND_ENTER = 20
const as Fl_Event FL_EVENT_DND_DRAG = 21
const as Fl_Event FL_EVENT_DND_LEAVE = 22
const as Fl_Event FL_EVENT_DND_RELEASE = 23

const as Fl_Event FL_EVENT_SCREEN_CONFIGURATION_CHANGED = 24
const as Fl_Event FL_EVENT_FULLSCREEN = 25


type FL_Event_States as ulong
'  FIXME: it would be nice to have the modifiers in the upper 8 bit so that
'         a unicode ke (24bit) can be sent as an unsigned with the modifiers.
const as FL_Event_States FL_SHIFT       = &H00010000 ' One of the shift keys is down
const as FL_Event_States FL_CAPS_LOCK   = &H00020000 ' The caps lock is on
const as FL_Event_States FL_CTRL        = &H00040000 ' One of the ctrl keys is down
const as FL_Event_States FL_ALT         = &H00080000 ' One of the alt keys is down
const as FL_Event_States FL_NUM_LOCK    = &H00100000 ' The num lock is on
const as FL_Event_States FL_META        = &H00400000 ' One of the meta/Windows keys is down
const as FL_Event_States FL_SCROLL_LOCK = &H00800000 ' The scroll lock is on
const as FL_Event_States FL_BUTTON1     = &H01000000 ' Mouse button 1 is pushed
const as FL_Event_States FL_BUTTON2     = &H02000000 ' Mouse button 2 is pushed
const as FL_Event_States FL_BUTTON3     = &H04000000 ' Mouse button 3 is pushed
const as FL_Event_States FL_BUTTONS     = &H7f000000 ' Any mouse button is pushed
const as FL_Event_States FL_KEY_MASK    = &H0000ffff ' All keys are 16 bit for now  FIXME: Unicode needs 24 bits!

#define Fl_COMMAND Fl_CTRL ' An alias for Fl_CTRL on WIN32 and X11, or Fl_META on MacOS X
#define Fl_CONTROL Fl_META ' An alias for Fl_META on WIN32 and X11, or Fl_CTRL on MacOS X
#define Fl_MOUSEBUTTON(n) (&H00800000 shl (n))  ' Mouse button n (n > 0) is pushed


type FL_Mouse_Keyboard_Events as ulong
const as FL_Mouse_Keyboard_Events FL_Volume_Down  = &HEF11 ' Volume control down 
const as FL_Mouse_Keyboard_Events FL_Volume_Mute  = &HEF12 ' Mute sound from the system 
const as FL_Mouse_Keyboard_Events FL_Volume_Up    = &HEF13 ' Volume control up 
const as FL_Mouse_Keyboard_Events FL_Media_Play   = &HEF14 ' Start playing of audio 
const as FL_Mouse_Keyboard_Events FL_Media_Stop   = &HEF15 ' Stop playing audio 
const as FL_Mouse_Keyboard_Events FL_Media_Prev   = &HEF16 ' Previous track 
const as FL_Mouse_Keyboard_Events FL_Media_Next   = &HEF17 ' Next track 
const as FL_Mouse_Keyboard_Events FL_Home_Page    = &HEF18 ' Display user's home page 
const as FL_Mouse_Keyboard_Events FL_Mail         = &HEF19 ' Invoke user's mail program 
const as FL_Mouse_Keyboard_Events FL_Search       = &HEF1B ' Search 
const as FL_Mouse_Keyboard_Events FL_Back         = &HEF26 ' Like back on a browser 
const as FL_Mouse_Keyboard_Events FL_Forward      = &HEF27 ' Like forward on a browser 
const as FL_Mouse_Keyboard_Events FL_Stop         = &HEF28 ' Stop current operation 
const as FL_Mouse_Keyboard_Events FL_Refresh      = &HEF29 ' Refresh the page 
const as FL_Mouse_Keyboard_Events FL_Sleep        = &HEF2F ' Put system to sleep 
const as FL_Mouse_Keyboard_Events FL_Favorites    = &HEF30 ' Show favorite locations 
'  FIXME: These codes collide with valid Unicode keys
const as FL_Mouse_Keyboard_Events FL_Mouse_Button = &Hfee8 ' A mouse button; use FL_Button + n for mouse button n.
const as FL_Mouse_Keyboard_Events FL_BackSpace   = &Hff08 ' The backspace key.
const as FL_Mouse_Keyboard_Events FL_Tab_KEY     = &Hff09 ' The tab key. ( !!! FL_TAB is a widget)

const as FL_Mouse_Keyboard_Events FL_Iso_Key     = &Hff0c ' The additional key of ISO keyboards.
const as FL_Mouse_Keyboard_Events FL_Enter_Key   = &Hff0d ' The enter key. 

const as FL_Mouse_Keyboard_Events FL_Pause       = &Hff13 ' The pause key.
const as FL_Mouse_Keyboard_Events FL_ScrollLock  = &Hff14 ' The scroll lock key.

const as FL_Mouse_Keyboard_Events FL_Escape      = &Hff1b ' The escape key.
  
const as FL_Mouse_Keyboard_Events FL_Home        = &Hff50 ' The home key.
const as FL_Mouse_Keyboard_Events FL_Left        = &Hff51 ' The left arrow key.
const as FL_Mouse_Keyboard_Events FL_Up          = &Hff52 ' The up arrow key.
const as FL_Mouse_Keyboard_Events FL_Right       = &Hff53 ' The right arrow key.
const as FL_Mouse_Keyboard_Events FL_Down        = &Hff54 ' The down arrow key.
const as FL_Mouse_Keyboard_Events FL_Page_Up     = &Hff55 ' The page-up key.
const as FL_Mouse_Keyboard_Events FL_Page_Down   = &Hff56 ' The page-down key.
const as FL_Mouse_Keyboard_Events FL_End         = &Hff57 ' The end key.

const as FL_Mouse_Keyboard_Events FL_Print       = &Hff61 ' The print (or print-screen) key.

const as FL_Mouse_Keyboard_Events FL_Insert      = &Hff63 ' The insert key. 

const as FL_Mouse_Keyboard_Events FL_Menu        = &Hff67 ' The menu key.
const as FL_Mouse_Keyboard_Events FL_Help        = &Hff68 ' The 'help' key on Mac keyboards

const as FL_Mouse_Keyboard_Events FL_NumLock     = &Hff7f ' The num lock key.
const as FL_Mouse_Keyboard_Events FL_KP          = &Hff80 ' One of the keypad numbers; use FL_KP + n for number n.

const as FL_Mouse_Keyboard_Events FL_KP_Enter    = &Hff8d ' The enter key on the keypad, same as FL_KP+'\\r'.

const as FL_Mouse_Keyboard_Events FL_KP_Last     = &Hffbd ' The last keypad key; use to range-check keypad.

const as FL_Mouse_Keyboard_Events FL_F           = &Hffbd ' One of the function keys; use FL_F + n for function key n.
const as FL_Mouse_Keyboard_Events FL_F_Last      = &Hffe0 ' The last function key; use to range-check function keys.

const as FL_Mouse_Keyboard_Events FL_Shift_L     = &Hffe1 ' The lefthand shift key.
const as FL_Mouse_Keyboard_Events FL_Shift_R     = &Hffe2 ' The righthand shift key.
const as FL_Mouse_Keyboard_Events FL_Control_L   = &Hffe3 ' The lefthand control key.
const as FL_Mouse_Keyboard_Events FL_Control_R   = &Hffe4 ' The righthand control key.
const as FL_Mouse_Keyboard_Events FL_CapsLock    = &Hffe5 ' The caps lock key.

const as FL_Mouse_Keyboard_Events FL_Meta_L      = &Hffe7 ' The left meta/Windows key.
const as FL_Mouse_Keyboard_Events FL_Meta_R      = &Hffe8 ' The right meta/Windows key.
const as FL_Mouse_Keyboard_Events FL_Alt_L       = &Hffe9 ' The left alt key.
const as FL_Mouse_Keyboard_Events FL_Alt_R       = &Hffea ' The right alt key. 
const as FL_Mouse_Keyboard_Events FL_Delete      = &Hffff ' The delete key.

type FL_EVENT_BUTTON as ulong
const as FL_EVENT_BUTTON FL_LEFT_MOUSE   = 1 ' The left mouse button
const as FL_EVENT_BUTTON FL_MIDDLE_MOUSE = 2 ' The middle mouse button
const as FL_EVENT_BUTTON FL_RIGHT_MOUSE  = 3 ' The right mouse button

type FL_FILE_TYPE as ulong
const as FL_FILE_TYPE FL_FILES       = 0
const as FL_FILE_TYPE FL_DIRECTORIES = 1

type FI_FILECHOOSER_TYPE as ulong
const as FI_FILECHOOSER_TYPE FL_FILECHOOSER_SINGLE    = 0 ' allows the user to select a single, existing file.
const as FI_FILECHOOSER_TYPE FL_FILECHOOSER_MULTI     = 1 ' allows the user to select one or more existing files.
const as FI_FILECHOOSER_TYPE FL_FILECHOOSER_CREATE    = 2 ' allows the user to select a single, existing file or specify a new filename.
const as FI_FILECHOOSER_TYPE FL_FILECHOOSER_DIRECTORY = 4 ' allows the user to select a single, existing directory.

type FL_LABEL_TYPE as ulong
const as FL_LABEL_TYPE FL_LABEL_NORMAL   = 0
const as FL_LABEL_TYPE FL_LABEL_SYMBOL   = FL_LABEL_NORMAL
const as FL_LABEL_TYPE FL_LABEL_NO       = 1
const as FL_LABEL_TYPE FL_LABEL_SHADOW   = 2
const as FL_LABEL_TYPE FL_LABEL_ENGRAVED = 3
const as FL_LABEL_TYPE FL_LABEL_EMBOSSED = 4
const as FL_LABEL_TYPE FL_LABEL_MULTI    = 5
const as FL_LABEL_TYPE FL_LABEL_ICON     = 6
const as FL_LABEL_TYPE FL_LABEL_IMAGE    = 7
const as FL_LABEL_TYPE FL_LABEL_FREE     = 8

type FL_INPUT_TYPE as ulong
const as FL_INPUT_TYPE FL_INPUT_NORMAL                = 0
const as FL_INPUT_TYPE FL_INPUT_FLOAT                 = 1
const as FL_INPUT_TYPE FL_INPUT_INT                   = 2

const as FL_INPUT_TYPE FL_INPUT_MULTILINE             = 4
const as FL_INPUT_TYPE FL_INPUT_SECRET                = 5
const as FL_INPUT_TYPE FL_INPUT_TYPE_                 = 7

const as FL_INPUT_TYPE FL_INPUT_READONLY              = 8
const as FL_INPUT_TYPE FL_INPUT_NORMAL_OUTPUT         = FL_INPUT_NORMAL or FL_INPUT_READONLY
const as FL_INPUT_TYPE FL_INPUT_MULTILINE_OUTPUT      = FL_INPUT_MULTILINE or FL_INPUT_READONLY

const as FL_INPUT_TYPE FL_INPUT_WRAP                  = 16
const as FL_INPUT_TYPE FL_INPUT_MULTILINE_WRAP        = FL_INPUT_MULTILINE or FL_INPUT_WRAP
const as FL_INPUT_TYPE FL_INPUT_MULTILINE_OUTPUT_WRAP = FL_INPUT_MULTILINE or FL_INPUT_READONLY or FL_INPUT_WRAP

type FL_LINE_STYLE as ulong
const as FL_LINE_STYLE FL_SOLID      = &H0000 ' line style: ___________
const as FL_LINE_STYLE FL_DASH       = &H0001 ' line style: _ _ _ _ _ _
const as FL_LINE_STYLE FL_DOT        = &H0002 ' line style: . . . . . .
const as FL_LINE_STYLE FL_DASHDOT    = &H0003 ' line style: _ . _ . _ .
const as FL_LINE_STYLE FL_DASHDOTDOT = &H0004 ' line style: _ . . _ . .

const as FL_LINE_STYLE FL_CAP_FLAT   = &H0100 ' cap style: end is flat
const as FL_LINE_STYLE FL_CAP_ROUND  = &H0200 ' cap style: end is round
const as FL_LINE_STYLE FL_CAP_SQUARE = &H0300 ' cap style: end wraps end point

const as FL_LINE_STYLE FL_JOIN_MITER = &H1000 ' join style: line join extends to a point
const as FL_LINE_STYLE FL_JOIN_ROUND = &H2000 ' join style: line join is rounded
const as FL_LINE_STYLE FL_JOIN_BEVEL = &H3000 ' join style: line join is tidied

type FL_LINE_POSITION as ulong
const as FL_LINE_POSITION FL_TOP    = 0
const as FL_LINE_POSITION FL_BOTTOM = 1
const as FL_LINE_POSITION FL_MIDDLE = 2

type FL_MENUBUTTON_POPUP_TYPE as ulong' Values for Fl_WidgetSetType() used to indicate what mouse buttons pop up the menu.
const as FL_MENUBUTTON_POPUP_TYPE POPUP1   = 1 ' pops up with the mouse 1st button. 
const as FL_MENUBUTTON_POPUP_TYPE POPUP2   = 2 ' pops up with the mouse 2nd button. 
const as FL_MENUBUTTON_POPUP_TYPE POPUP12  = 3 ' pops up with the mouse 1st or 2nd buttons. 
const as FL_MENUBUTTON_POPUP_TYPE POPUP3   = 4 ' pops up with the mouse 3rd button. 
const as FL_MENUBUTTON_POPUP_TYPE POPUP13  = 5 ' pops up with the mouse 1st or 3rd buttons. 
const as FL_MENUBUTTON_POPUP_TYPE POPUP23  = 6 ' pops up with the mouse 2nd or 3rd buttons. 
const as FL_MENUBUTTON_POPUP_TYPE POPUP123 = 7 ' pops up with any mouse button. 

type FL_MENUITEM_FLAG as ulong
const as FL_MENUITEM_FLAG FL_MENU_INACTIVE   = &H001 ' Deactivate menu item (gray out)
const as FL_MENUITEM_FLAG FL_MENU_TOGGLE     = &H002 ' Item is a checkbox toggle (shows checkbox for on/off state)
const as FL_MENUITEM_FLAG FL_MENU_VALUE      = &H004 ' The on/off state for checkbox/radio buttons (if set, state is 'on')
const as FL_MENUITEM_FLAG FL_MENU_RADIO      = &H008 ' Item is a radio button (one checkbox of many can be on)
const as FL_MENUITEM_FLAG FL_MENU_INVISIBLE  = &H010 ' Item will not show up (shortcut will work)
const as FL_MENUITEM_FLAG FL_SUBMENU_POINTER = &H020 ' Indicates user_data() is a pointer to another menu array
const as FL_MENUITEM_FLAG FL_SUBMENU         = &H040 ' This item is a submenu to other items
const as FL_MENUITEM_FLAG FL_MENU_DIVIDER    = &H080 ' Creates divider line below this item. Also ends a group of radio buttons.
const as FL_MENUITEM_FLAG FL_MENU_HORIZONTAL = &H100 ' reserved


' Fl_Gl_Window mode (values match Glut)
type Fl_MODE as ulong
const as Fl_MODE FL_MODE_RGB         = &H000
const as Fl_MODE FL_MODE_SINGLE      = &H000
const as Fl_MODE FL_MODE_INDEX       = &H001
const as Fl_MODE FL_MODE_DOUBLE      = &H002
const as Fl_MODE FL_MODE_ACCUM       = &H004
const as Fl_MODE FL_MODE_ALPHA       = &H008
const as Fl_MODE FL_MODE_DEPTH       = &H010
const as Fl_MODE FL_MODE_STENCIL     = &H020
const as Fl_MODE FL_MODE_RGB8        = &H040
const as Fl_MODE FL_MODE_MULTISAMPLE = &H080
const as Fl_MODE FL_MODE_STEREO      = &H100
const as Fl_MODE FL_MODE_FAKE_SINGLE = &H200 '  Fake single buffered windows using double-buffer

type FL_OPTION as ulong
const as FL_OPTION FL_OPTION_ARROW_FOCUS   = 0
const as FL_OPTION FL_OPTION_VISIBLE_FOCUS = 1
const as FL_OPTION FL_OPTION_DND_TEXT      = 2
const as FL_OPTION FL_OPTION_SHOW_TOOLTIPS = 3
const as FL_OPTION FL_OPTION_FNFC_USES_GTK = 4' (select GTK file chooser as native filechooser on linux/unix only). 
const as FL_OPTION FL_OPTION_LAST          = 5

type FL_PACK_TYPE as ulong
const as FL_PACK_TYPE FL_PACK_VERTICAL   = 0
const as FL_PACK_TYPE FL_PACK_HORIZONTAL = 1

type FL_ROOT as ulong 
const as FL_ROOT FL_ROOT_SYSTEM = 0 ' Preferences are used system-wide
const as FL_ROOT FL_ROOT_USER   = 1 ' Preferences apply only to the current user

type FL_SCROLL_TYPE as ulong
const as FL_SCROLL_TYPE FL_SCROLL_NO                = 0 ' No scrollbars.
const as FL_SCROLL_TYPE FL_SCROLL_HORIZONTAL        = 1 ' Only a horizontal scrollbar. 
const as FL_SCROLL_TYPE FL_SCROLL_VERTICAL          = 2 ' Only a vertical scrollbar.
const as FL_SCROLL_TYPE FL_SCROLL_BOTH              = 3 ' The default is both scrollbars.
const as FL_SCROLL_TYPE FL_SCROLL_ALWAYS_ON         = 4 ' Specified scrollbar(s) should 'always' be shown.
const as FL_SCROLL_TYPE FL_SCROLL_HORIZONTAL_ALWAYS = 5 ' Horizontal scrollbar always on, vertical always off.
const as FL_SCROLL_TYPE FL_SCROLL_VERTICAL_ALWAYS   = 6 ' Vertical scrollbar always on, horizontal always off.
const as FL_SCROLL_TYPE FL_SCROLL_BOTH_ALWAYS       = 7

type FL_SLIDER_TYPE as ulong
const as FL_SLIDER_TYPE FL_SLIDER_VERT       = 0
const as FL_SLIDER_TYPE FL_SLIDER_HOR_SLIDER = 1
const as FL_SLIDER_TYPE FL_SLIDER_VERT_FILL  = 2 ' Draws a filled vertical slider, useful as a progress or value meter.
const as FL_SLIDER_TYPE FL_SLIDER_HOR_FILL   = 3 ' Draws a filled horizontal slider, useful as a progress or value meter.
const as FL_SLIDER_TYPE FL_SLIDER_VERT_NICE  = 4 ' Draws a vertical slider with a nice looking control knob.
const as FL_SLIDER_TYPE FL_SLIDER_HOR_NICE   = 5 ' Draws a horizontal slider with a nice looking control knob.

type FL_TABLECONTEXT as ulong
const as FL_TABLECONTEXT FL_CONTEXT_NONE       = &H00 ' no known context
const as FL_TABLECONTEXT FL_CONTEXT_STARTPAGE  = &H01 ' before a page is redrawn
const as FL_TABLECONTEXT FL_CONTEXT_ENDPAGE    = &H02 ' after a page is redrawn
const as FL_TABLECONTEXT FL_CONTEXT_ROW_HEADER = &H04 ' in the row header
const as FL_TABLECONTEXT FL_CONTEXT_COL_HEADER = &H08 ' in the col header
const as FL_TABLECONTEXT FL_CONTEXT_CELL       = &H10 ' in one of the cells
const as FL_TABLECONTEXT FL_CONTEXT_TABLE      = &H20 ' in a dead zone of table
const as FL_TABLECONTEXT FL_CONTEXT_RC_RESIZE  = &H40 ' [r]ow or [c]olumn being resized 

type FL_TABLEROWSELECTMODE as ulong 
const as FL_TABLEROWSELECTMODE FL_SELECT_NONE   = 0
const as FL_TABLEROWSELECTMODE FL_SELECT_SINGLE = 1
const as FL_TABLEROWSELECTMODE FL_SELECT_MULTI  = 2

type FL_TREE_REASON as ulong ' The reason the callback was invoked.
const as FL_TREE_REASON FL_TREE_REASON_NONE       = 0 ' unknown reason
const as FL_TREE_REASON FL_TREE_REASON_SELECTED   = 1 ' an item was selected
const as FL_TREE_REASON FL_TREE_REASON_DESELECTED = 2 ' an item was de-selected
const as FL_TREE_REASON FL_TREE_REASON_RESELECTED = 3 ' an item was re-selected (e.g. double-clicked)
const as FL_TREE_REASON FL_TREE_REASON_OPENED     = 4 ' an item was opened
const as FL_TREE_REASON FL_TREE_REASON_CLOSED     = 5 ' an item was closed 
const as FL_TREE_REASON FL_TREE_REASON_DRAGGED    = 6 ' an item was dragged into a new place

type FL_TREE_CONNECTOR as ulong      ' Defines the style of connection lines between items.
const as FL_TREE_CONNECTOR FL_TREE_CONNECTOR_NONE   = 0 ' Use no lines connecting items.
const as FL_TREE_CONNECTOR FL_TREE_CONNECTOR_DOTTED = 1 ' Use dotted lines connecting items (default)
const as FL_TREE_CONNECTOR FL_TREE_CONNECTOR_SOLID  = 2 ' Use solid lines connecting items.

type FL_TREE_SELECT as ulong      ' Tree selection style.
const as FL_TREE_SELECT FL_TREE_SELECT_NONE   = 0 ' Nothing selected when items are clicked.
const as FL_TREE_SELECT FL_TREE_SELECT_SINGLE = 1 ' Single item selected when item is clicked (default)
const as FL_TREE_SELECT FL_TREE_SELECT_MULTI  = 2 ' Multiple items can be selected by clicking with SHIFT, CTRL or mouse drags.

type FL_TREE_SORT as ulong        ' Sort order options for items added to the tree.
const as FL_TREE_SORT FL_TREE_SORT_NONE       = 0 ' No sorting; items are added in the order defined (default).
const as FL_TREE_SORT FL_TREE_SORT_ASCENDING  = 1 ' Add items in ascending sort order.
const as FL_TREE_SORT FL_TREE_SORT_DESCENDING = 2 ' Add items in descending sort order. 

type FL_VALUATOR_TYPE as ulong
const as FL_VALUATOR_TYPE FL_VALUATOR_VERTICAL   = 0 ' The valuator can work vertically
const as FL_VALUATOR_TYPE FL_VALUATOR_HORIZONTAL = 1 ' The valuator can work horizontally

type FL_WHEN as ulong'  Fl_WidgetSetWhen():
const as FL_WHEN FL_WHEN_NEVER             = 0
const as FL_WHEN FL_WHEN_CHANGED           = 1
const as FL_WHEN FL_WHEN_NOT_CHANGED       = 2
const as FL_WHEN FL_WHEN_RELEASE           = 4
const as FL_WHEN FL_WHEN_RELEASE_ALWAYS    = FL_WHEN_RELEASE or FL_WHEN_NOT_CHANGED
const as FL_WHEN FL_WHEN_ENTER_KEY         = 8
const as FL_WHEN FL_WHEN_ENTER_KEY_ALWAYS  = FL_WHEN_ENTER_KEY or FL_WHEN_NOT_CHANGED
const as FL_WHEN FL_WHEN_ENTER_KEY_CHANGED = FL_WHEN_ENTER_KEY or FL_WHEN_NOT_CHANGED or FL_WHEN_CHANGED

type FD_WHEN as ulong   '  values for "when" passed to Fl_Add_fd()
const as FD_WHEN FL_READ   = 1 ' Call the callback when there is data to be read.
const as FD_WHEN FL_WRITE  = 4 ' Call the callback when data can be written without blocking.
const as FD_WHEN FL_EXCEPT = 8 ' Call the callback if an exception occurs on the file.

#define Fl_IMAGE_WITH_ALPHA &H40000000
#define Fl_RESERVED_TYPE 100

type FL_TEXT_DISPLAY_WRAP_MODE as ulong 
const as FL_TEXT_DISPLAY_WRAP_MODE WRAP_NONE      = 0 ' don't wrap text at all
const as FL_TEXT_DISPLAY_WRAP_MODE WRAP_AT_COLUMN = 1 ' wrap text at the given text column
const as FL_TEXT_DISPLAY_WRAP_MODE WRAP_AT_PIXEL  = 2 ' wrap text at a pixel position
const as FL_TEXT_DISPLAY_WRAP_MODE WRAP_AT_BOUNDS = 3 ' wrap text so that it fits into the widget width

type FL_TEXT_DISPLAY_CURSOR_SHAPE as ulong 
const as FL_TEXT_DISPLAY_CURSOR_SHAPE NORMAL_CURSOR = 0 ' I-beam
const as FL_TEXT_DISPLAY_CURSOR_SHAPE CARET_CURSOR  = 1 ' caret under the text
const as FL_TEXT_DISPLAY_CURSOR_SHAPE DIM_CURSOR    = 2 ' dim I-beam
const as FL_TEXT_DISPLAY_CURSOR_SHAPE BLOCK_CURSOR  = 3 ' unfille box under the current character
const as FL_TEXT_DISPLAY_CURSOR_SHAPE HEAVY_CURSOR  = 4 ' thick I-beam
const as FL_TEXT_DISPLAY_CURSOR_SHAPE SIMPLE_CURSOR = 5 ' as cursor as Fl_Input cursor

' FLTK (simple) data types
type FL_FONTSIZE  as long           ' Size of a font in pixels. This is the approximate height of a font in pixels.
type Fl_String    as zstring ptr       ' Flexible length utf8 Unicode text.
type Fl_CString   as const zstring ptr ' Flexible length utf8 Unicode read-only string.
type Fl_Shortcut  as ulong          ' 24-bit Unicode character + 8-bit indicator for keyboard flags
type Fl_Char      as ulong          ' 24-bit Unicode character - upper 8-bits are unuse
type Fl_Socket    as long

type Style_Table_Entry
  as Fl_Color    color
  as Fl_Font     font
  as FL_FONTSIZE size
  as ulong    attr
end type

type Fl_Text_Selection
  private:
  as any ptr dummy
end type

type Fl_Text_Buffer
  private:
  as any ptr dummy
end type

type Fl_File_Chooser
  private:
  as any ptr dummy
end type

enum FL_NFC_OPTION ' NFC = native file chooser 
  NFC_NO_OPTIONS     = 0
  NFC_SAVEAS_CONFIRM = 1
  NFC_NEW_FOLDER     = 2
  NFC_PREVIEW        = 4
  NFC_USE_FILTER_EXT = 8
end enum
 
enum FL_NFC_TYPE
  NFC_BROWSE_FILE = 0
  NFC_BROWSE_DIRECTORY
  NFC_BROWSE_MULTI_FILE
  NFC_BROWSE_MULTI_DIRECTORY
  NFC_BROWSE_SAVE_FILE
  NFC_BROWSE_SAVE_DIRECTORY
end enum

type Fl_Native_File_Chooser
  private:
  as any ptr dummy
end type

#macro Fl_Extends1(_e_,_a)
type Fl_##_e_ extends Fl_##_a
  declare function _e_ as Fl_##_e_ ptr
  declare operator cast as Fl_##_a ptr
  private:
  as any ptr dummy
end type
function Fl_##_e_.##_e_ as Fl_##_e_ ptr : return     @this : end function
operator Fl_##_e_.cast  as Fl_##_a  ptr : operator = @this : end operator
#endmacro

#macro Fl_Extends2(_e_,_a,_b)
type Fl_##_e_ extends Fl_##_a
  declare function _e_ as Fl_##_e_ ptr
  declare operator cast as Fl_##_a ptr
  declare operator cast as Fl_##_b ptr
  private:
  as any ptr dummy
end type
function Fl_##_e_.##_e_ as Fl_##_e_ ptr : return     @this : end function
operator Fl_##_e_.cast  as Fl_##_a  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_b  ptr : operator = @this : end operator
#endmacro

#macro Fl_Extends3(_e_,_a,_b,_c)
type Fl_##_e_ extends Fl_##_a
  declare function _e_ as Fl_##_e_ ptr
  declare operator cast as Fl_##_a ptr
  declare operator cast as Fl_##_b ptr
  declare operator cast as Fl_##_c ptr
  private:
  as any ptr dummy
end type
function Fl_##_e_.##_e_ as Fl_##_e_ ptr : return     @this : end function
operator Fl_##_e_.cast  as Fl_##_a  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_b  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_c  ptr : operator = @this : end operator
#endmacro

#macro Fl_Extends4(_e_,_a,_b,_c,_d)
type Fl_##_e_ extends Fl_##_a
  declare function _e_ as Fl_##_e_ ptr
  declare operator cast as Fl_##_a ptr
  declare operator cast as Fl_##_b ptr
  declare operator cast as Fl_##_c ptr
  declare operator cast as Fl_##_d ptr
  private:
  as any ptr dummy
end type
function Fl_##_e_.##_e_ as Fl_##_e_ ptr : return     @this : end function
operator Fl_##_e_.cast  as Fl_##_a  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_b  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_c  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_d  ptr : operator = @this : end operator
#endmacro

#macro Fl_Extends5(_e_,_a,_b,_c,_d,_e)
type Fl_##_e_ extends Fl_##_a
  declare function _e_ as Fl_##_e_ ptr
  declare operator cast as Fl_##_a ptr
  declare operator cast as Fl_##_b ptr
  declare operator cast as Fl_##_c ptr
  declare operator cast as Fl_##_d ptr
  declare operator cast as Fl_##_e ptr
  private:
  as any ptr dummy
end type
function Fl_##_e_.##_e_ as Fl_##_e_ ptr : return     @this : end function
operator Fl_##_e_.cast  as Fl_##_a  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_b  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_c  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_d  ptr : operator = @this : end operator
operator Fl_##_e_.cast  as Fl_##_e  ptr : operator = @this : end operator
#endmacro

' #######################################################
' # class Fl_Image is the base class of all FLTK images #
' #######################################################
type Fl_Image
  declare function AsAny as any ptr
  private:
  as any ptr dummy
end type
function Fl_Image.AsAny as any ptr : return @this : end function

' ##########################################
' # class Fl_Shared_Image extends Fl_Image #
' ##########################################
Fl_Extends1(Shared_Image,Image)

' #########################################
' # class Fl_Tiled_Image extends Fl_Image #
' #########################################
Fl_Extends1(Tiled_Image,Image)

' ####################################
' # class Fl_Bitmap extends Fl_Image #
' ####################################
Fl_Extends1(Bitmap,Image)
  ' ########################################
  ' # class Fl_XBM_Image extends Fl_Bitmap #
  ' ########################################
  Fl_Extends2(XBM_Image,Bitmap,Image)

' ####################################
' # class Fl_Pixmap extends Fl_Image #
' ####################################
Fl_Extends1(Pixmap,Image)
  ' ########################################
  ' # class Fl_XPM_Image extends Fl_Pixmap #
  ' ########################################
  Fl_Extends2(XPM_Image,Pixmap,Image)
  ' ########################################
  ' # class Fl_GIF_Image extends Fl_Pixmap #
  ' ########################################
  Fl_Extends2(GIF_Image,Pixmap,Image)

' #######################################
' # class Fl_RGB_Image extends Fl_Image #
' #######################################
Fl_Extends1(RGB_Image,Image)
  ' ###########################################
  ' # class Fl_BMP_Image extends Fl_RGB_Image #
  ' ###########################################
  Fl_Extends2(BMP_Image,RGB_Image,Image)
  ' ###########################################
  ' # class Fl_PNG_Image extends Fl_RGB_Image #
  ' ###########################################
  Fl_Extends2(PNG_Image,RGB_Image,Image)
  ' ############################################
  ' # class Fl_JPEG_Image extends Fl_RGB_Image #
  ' ############################################
  Fl_Extends2(JPEG_Image,RGB_Image,Image)
  ' ###########################################
  ' # class Fl_PNM_Image extends Fl_RGB_Image #
  ' ###########################################
  Fl_Extends2(PNM_Image,RGB_Image,Image)


' ######################
' # class Fl_File_Icon #
' ######################
type Fl_File_Icon
  private:
  as any ptr dummy
end type

' FLTK widget base class
' ##########################################################
' # class Fl_Widget is the base class of all other objects #
' ##########################################################
type Fl_Widget
  declare operator cast as any ptr
  private:
  as any ptr dummy
end type
operator Fl_Widget.cast as any ptr 
  operator = @this
end operator


' FLTK extended widget classes
Fl_Extends1(WidgetEx,Widget)

Fl_Extends1(Box,Widget)
  Fl_Extends2(BoxEx,Box,Widget)
  Fl_Extends2(Canvas,Box,Widget)
 
Fl_Extends1(Button,Widget)
  Fl_Extends2(ButtonEx,Button,Widget)
  Fl_Extends2(Radio_Button,Button,Widget)
    Fl_Extends3(Radio_ButtonEx,Radio_Button,Button,Widget)
  Fl_Extends2(Repeat_Button,Button,Widget)
    Fl_Extends3(Repeat_ButtonEx,Repeat_Button,Button,Widget)
  Fl_Extends2(Return_Button,Button,Widget)
    Fl_Extends3(Return_ButtonEx,Return_Button,Button,Widget)
  Fl_Extends2(Toggle_Button,Button,Widget)
    Fl_Extends3(Toggle_ButtonEx,Toggle_Button,Button,Widget)
  Fl_Extends2(Light_Button,Button,Widget)
    Fl_Extends3(Light_ButtonEx,Light_Button,Button,Widget)
    Fl_Extends3(Check_Button,Light_Button,Button,Widget)
      Fl_Extends4(Check_ButtonEx,Check_Button,Light_Button,Button,Widget)
    Fl_Extends3(Radio_Light_Button,Light_Button,Button,Widget)
      Fl_Extends4(Radio_Light_ButtonEx,Radio_Light_Button,Light_Button,Button,Widget)
    Fl_Extends3(Round_Button,Light_Button,Button,Widget)
      Fl_Extends4(Round_ButtonEx,Round_Button,Light_Button,Button,Widget)
    Fl_Extends3(Radio_Round_Button,Light_Button,Button,Widget)
      Fl_Extends4(Radio_Round_ButtonEx,Radio_Round_Button,Light_Button,Button,Widget)

Fl_Extends1(Chart,Widget)
   Fl_Extends2(ChartEx,Chart,Widget)

Fl_Extends1(Clock_Output,Widget)
  Fl_Extends2(Clock_OutputEx,Clock_Output,Widget)
  Fl_Extends2(Clock,Clock_Output,Widget)
    Fl_Extends3(ClockEx,Clock,Clock_Output,Widget)
    Fl_Extends3(Round_Clock,Clock,Clock_Output,Widget)
      Fl_Extends4(Round_ClockEx,Round_Clock,Clock,Clock_Output,Widget)

Fl_Extends1(Label,Widget)

Fl_Extends1(Menu_,Widget)
  Fl_Extends2(Menu_Bar,Menu_,Widget)
    Fl_Extends3(Menu_BarEx,Menu_Bar,Menu_,Widget)
  Fl_Extends2(Menu_Button,Menu_,Widget)
    Fl_Extends3(Menu_ButtonEx,Menu_Button,Menu_,Widget)
  Fl_Extends2(Choice,Menu_,Widget)
    Fl_Extends3(ChoiceEx,Choice,Menu_,Widget)

Fl_Extends1(Input_,Widget)
  Fl_Extends2(Input,Input_,Widget)
    Fl_Extends3(InputEx,Input,Input_,Widget)
    Fl_Extends3(File_Input,Input,Input_,Widget)
      Fl_Extends4(File_InputEx,File_Input,Input,Input_,Widget)
    Fl_Extends3(Float_Input,Input,Input_,Widget)
      Fl_Extends4(Float_InputEx,Float_Input,Input,Input_,Widget)
    Fl_Extends3(Int_Input,Input,Input_,Widget)
      Fl_Extends4(Int_InputEx,Int_Input,Input,Input_,Widget)
    Fl_Extends3(Multiline_Input,Input,Input_,Widget)
      Fl_Extends4(Multiline_InputEx,Multiline_Input,Input,Input_,Widget)
    Fl_Extends3(Secret_Input,Input,Input_,Widget)
      Fl_Extends4(Secret_InputEx,Secret_Input,Input,Input_,Widget)
    Fl_Extends3(Output,Input,Input_,Widget)
      Fl_Extends4(OutputEx,Output,Input,Input_,Widget)
      Fl_Extends4(Multiline_Output,Output,Input,Input_,Widget)
        Fl_Extends5(Multiline_OutputEx,Multiline_Output,Output,Input,Input_,Widget)

Fl_Extends1(Progress,Widget)
  Fl_Extends2(ProgressEx,Progress,Widget)

Fl_Extends1(Valuator,Widget)
  Fl_Extends2(Adjuster,Valuator,Widget)
    Fl_Extends3(AdjusterEx,Adjuster,Valuator,Widget)
  Fl_Extends2(Counter,Valuator,Widget)
    Fl_Extends3(CounterEx,Counter,Valuator,Widget)
    Fl_Extends3(Simple_Counter,Counter,Valuator,Widget)
      Fl_Extends4(Simple_CounterEx,Simple_Counter,Counter,Valuator,Widget)
  Fl_Extends2(Dial,Valuator,Widget)
    Fl_Extends3(DialEx,Dial,Valuator,Widget)
    Fl_Extends3(Fill_Dial,Dial,Valuator,Widget)
      Fl_Extends4(Fill_DialEx,Fill_Dial,Dial,Valuator,Widget)
    Fl_Extends3(Line_Dial,Dial,Valuator,Widget)
      Fl_Extends4(Line_DialEx,Line_Dial,Dial,Valuator,Widget)
  Fl_Extends2(Roller,Valuator,Widget)
    Fl_Extends3(RollerEx,Roller,Valuator,Widget)
  Fl_Extends2(Slider,Valuator,Widget)
    Fl_Extends3(SliderEx,Slider,Valuator,Widget)
    Fl_Extends3(Scrollbar,Slider,Valuator,Widget)
      Fl_Extends4(ScrollbarEx,Scrollbar,Slider,Valuator,Widget)
    Fl_Extends3(Hor_Slider,Slider,Valuator,Widget)
      Fl_Extends4(Hor_SliderEx,Hor_Slider,Slider,Valuator,Widget)
    Fl_Extends3(Fill_Slider,Slider,Valuator,Widget)
      Fl_Extends4(Fill_SliderEx,Fill_Slider,Slider,Valuator,Widget)
    Fl_Extends3(Hor_Fill_Slider,Slider,Valuator,Widget)
      Fl_Extends4(Hor_Fill_SliderEx,Hor_Fill_Slider,Slider,Valuator,Widget)
    Fl_Extends3(Nice_Slider,Slider,Valuator,Widget)
      Fl_Extends4(Nice_SliderEx,Nice_Slider,Slider,Valuator,Widget)
    Fl_Extends3(Hor_Nice_Slider,Slider,Valuator,Widget)
      Fl_Extends4(Hor_Nice_SliderEx,Hor_Nice_Slider,Slider,Valuator,Widget)
    Fl_Extends3(Value_Slider,Slider,Valuator,Widget)
      Fl_Extends4(Value_SliderEx,Value_Slider,Slider,Valuator,Widget)
      Fl_Extends4(Hor_Value_Slider,Value_Slider,Slider,Valuator,Widget)
        Fl_Extends5(Hor_Value_SliderEx,Hor_Value_Slider,Value_Slider,Slider,Valuator,Widget)

  Fl_Extends2(Value_Input,Valuator,Widget)
    Fl_Extends3(Value_InputEx,Value_Input,Valuator,Widget)
  Fl_Extends2(Value_Output,Valuator,Widget)
    Fl_Extends3(Value_OutputEx,Value_Output,Valuator,Widget)

Fl_Extends1(Group,Widget)
  Fl_Extends2(GroupEx,Group,Widget)
  Fl_Extends2(Pack,Group,Widget)
    Fl_Extends3(PackEx,Pack,Group,Widget)
  Fl_Extends2(Tile,Group,Widget)
    Fl_Extends3(TileEx,Tile,Group,Widget)
  Fl_Extends2(Scroll,Group,Widget)
    Fl_Extends3(ScrollEx,Scroll,Group,Widget)

  Fl_Extends2(Browser_,Group,Widget)
    Fl_Extends3(Check_Browser,Browser_,Group,Widget)
      Fl_Extends4(Check_BrowserEx,Check_Browser,Browser_,Group,Widget)

    Fl_Extends3(Browser,Browser_,Group,Widget)
      Fl_Extends4(BrowserEx,Browser,Browser_,Group,Widget)
   
      Fl_Extends4(File_Browser,Browser,Browser_,Group,Widget)
        Fl_Extends5(File_BrowserEx,File_Browser,Browser,Browser_,Group,Widget)
      Fl_Extends4(Hold_Browser,Browser,Browser_,Group,Widget)
        Fl_Extends5(Hold_BrowserEx,Hold_Browser,Browser,Browser_,Group,Widget)
      Fl_Extends4(Multi_Browser,Browser,Browser_,Group,Widget)
        Fl_Extends5(Multi_BrowserEx,Multi_Browser,Browser,Browser_,Group,Widget)
      Fl_Extends4(Select_Browser,Browser,Browser_,Group,Widget)
        Fl_Extends5(Select_BrowserEx,Select_Browser,Browser,Browser_,Group,Widget)

  Fl_Extends2(Color_Chooser,Group,Widget)
    Fl_Extends3(Color_ChooserEx,Color_Chooser,Group,Widget)

  Fl_Extends2(Help_View,Group,Widget)

  Fl_Extends2(Input_Choice,Group,Widget)
    Fl_Extends3(Input_ChoiceEx,Input_Choice,Group,Widget)

  Fl_Extends2(Spinner,Group,Widget)
    Fl_Extends3(SpinnerEx,Spinner,Group,Widget)

  Fl_Extends2(Table,Group,Widget)
    Fl_Extends3(TableEx,Table,Group,Widget)
  Fl_Extends3(Table_Row,Table,Group,Widget)
    Fl_Extends4(Table_RowEx,Table_Row,Table,Group,Widget)

  Fl_Extends2(Tabs,Group,Widget)
    Fl_Extends3(TabsEx,Tabs,Group,Widget)

  Fl_Extends2(Text_Display,Group,Widget)
    Fl_Extends3(Text_DisplayEx,Text_Display,Group,Widget)
    Fl_Extends3(Text_Editor,Text_Display,Group,Widget)
      Fl_Extends4(Text_EditorEx,Text_Editor,Text_Display,Group,Widget)

  Fl_Extends2(Tree,Group,Widget)
    Fl_Extends3(TreeEx,Tree,Group,Widget)

  Fl_Extends2(Wizard,Group,Widget)

  Fl_Extends2(Window,Group,Widget)
    Fl_Extends3(WindowEx,Window,Group,Widget)
    Fl_Extends3(Single_Window,Window,Group,Widget)
      Fl_Extends4(Single_WindowEx,Single_Window,Window,Group,Widget)
    Fl_Extends4(Menu_Window,Single_Window,Window,Group,Widget)
      Fl_Extends5(Menu_WindowEx,Menu_Window,Single_Window,Window,Group,Widget)
    Fl_Extends3(Double_Window,Window,Group,Widget)
      Fl_Extends4(Double_WindowEx,Double_Window,Window,Group,Widget)
      Fl_Extends4(Overlay_Window,Double_Window,Window,Group,Widget)
        Fl_Extends5(Overlay_WindowEx,Overlay_Window,Double_Window,Window,Group,Widget)

    Fl_Extends3(GL_Window,Window,Group,Widget)
      Fl_Extends4(GL_WindowEx,GL_Window,Window,Group,Widget)

      Fl_Extends4(Glut_Window,GL_Window,Window,Group,Widget)
        Fl_Extends5(Glut_WindowEx,Glut_Window,GL_Window,Window,Group,Widget)

type Fl_Device
  declare function AsAny as any ptr
  private:
  as any ptr dummy
end type
function Fl_Device.AsAny as any ptr : return @this : end function

Fl_Extends1(Graphics_Driver,Device)
Fl_Extends1(Surface_Device,Device)
  Fl_Extends2(Display_Device,Surface_Device,Device)
  Fl_Extends2(Image_Surface,Surface_Device,Device)
  Fl_Extends2(Copy_Surface,Surface_Device,Device)
  Fl_Extends2(Paged_Device,Surface_Device,Device)
    Fl_Extends3(Printer,Paged_Device,Surface_Device,Device)

#ifndef NO_TREE
enum Fl_Tree_Item_Flag
  TREE_ITEM_OPEN      = 1 ' item is open
  TREE_ITEM_VISIBLE   = 2 ' item is visible
  TREE_ITEM_ACTIVE    = 4 ' item is active
  TREE_ITEM_SELECTED  = 8 ' item is selected
end enum
type Fl_Tree_ as Fl_Tree
type Fl_Tree_Item_ as Fl_Tree_Item

type Fl_Tree_Item_Array
  as Fl_Tree_Item_ ptr ptr _items     ' items array
  as long               _total     ' nItems in array
  as long               _size      ' nItems *allocated* for array
  as long               _chunksize ' nItems to enlarge mem allocation
  as ubyte              _flags     ' new internal use only
end type

type Fl_Tree_Item
  as Fl_Tree_ ptr       _tree             ' parent tree
  as any ptr            _dummy            ' <-- added 
  as const zstring ptr  _label            ' label (memory managed)
  as Fl_Font            _labelfont        ' label's font face
  as FL_FONTSIZE        _labelsize        ' label's font size
  as Fl_Color           _labelfgcolor     ' label's fg color
  as Fl_Color           _labelbgcolor     ' label's bg color (&Hffffffff is 'transparent')
  as ushort             _flags            ' Fl_Tree_Item_Flag flags
  as long               _xywh(3)          ' xywh of this widget (if visible)
  as long               _collapse_xywh(3) ' xywh of collapse icon (if visible)
  as long               _label_xywh(3)    ' xywh of label
  as Fl_Widget ptr      _widget           ' item's label widget (optional)
  as Fl_Image ptr       _usericon         ' item's user-specific icon (optional)
  as Fl_Tree_Item_Array _children         ' array of child items
  as Fl_Tree_Item ptr   _parent           ' parent item (=0 if root)
  as any ptr            _userdata         ' user data that can be associated with an item
  as Fl_Tree_Item ptr   _prev_sibling     ' previous sibling (same level)
  as Fl_Tree_Item ptr   _next_sibling     ' next sibling (same level)
end type
#endif

type Fl_Widget_Tracker
  private:
  as any ptr dummy
end type

#ifndef NO_PREFERENCES
type Fl_Preferences
  private:
  as any ptr dummy
end type
#endif

#ifdef __FB_WIN32__
type dirent
  as long   d_ino
  as ushort d_reclen
  as ushort d_namlen
  as zstring * 260 d_name
end type
#else
type dirent
  as longint d_ino
  as longint d_off
  as ushort  d_reclen
  as ubyte   d_type 
  as zstring * 256 d_name
end type
#endif

' DeclareEx() extend any Fl_Widget class with user defined callbacks !!! cdecl !!!
' sub      DestructorCB cdecl (self as any ptr)
' function DrawCB       cdecl (self as any ptr) as long
' function HandleCB     cdecl (self as any ptr, event as Fl_Event) as long
' function ResizeCB     cdecl (self as any ptr, x as long, y as long, w as long, h as long) as long
' and Event delegation to it's base class Fl_XXXExHandleBase(me,event)
#macro DeclareEx(_name_)
declare function _name_##ExNew             cdecl (byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as _name_##Ex ptr
declare sub      _name_##ExDelete          cdecl (byref ex as _name_##Ex ptr)
declare function _name_##ExHandleBase      cdecl (byval ex as _name_##Ex ptr, byval event as Fl_Event) as long
declare sub      _name_##ExSetDestructorCB cdecl (byval ex as _name_##Ex ptr, byval cb as Fl_DestructorEx)
declare sub      _name_##ExSetDrawCB       cdecl (byval ex as _name_##Ex ptr, byval cb as Fl_DrawEx)
declare sub      _name_##ExSetHandleCB     cdecl (byval ex as _name_##Ex ptr, byval cb as Fl_HandleEx)
declare sub      _name_##ExSetResizeCB     cdecl (byval ex as _name_##Ex ptr, byval cb as Fl_ResizeEx)
#endmacro



extern "c"

' FLTK callback's !!! all cdecl !!!
type Fl_Abort_Handler    as sub      (byval fmt as const zstring ptr,...)
type Fl_Args_Handler     as function (byval argc as long,byval argv as zstring ptr ptr, byref i as long) as long
type Fl_Atclose_Handler  as sub      (byval win as Fl_Window ptr,byval userdata as any ptr)
type Fl_Awake_Handler    as sub      (byval userdata as any ptr)
type Fl_Box_Draw_F       as sub      (byval x as long,byval y as long,byval w as long,byval h as long,byval c as Fl_Color)
type Fl_Event_Dispatch   as function (byval event as Fl_Event,byval win as Fl_Window ptr) as long
type Fl_Event_Handler    as function (byval event as Fl_Event) as long
type Fl_FD_Handler       as sub      (byval fd as Fl_SOCKET,byval userdata as any ptr)
type Fl_Idle_Handler     as sub      (byval pUserData as any ptr)
type Fl_Label_Draw_F     as sub      (byval label as const Fl_Label ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval align as Fl_Align)
type Fl_Label_Measure_F  as sub      (byval label as const Fl_Label ptr,byref w as long,byref h as long)
type Fl_Old_Idle_Handler as sub
type Fl_Timeout_Handler  as sub      (byval userdata as any ptr)
type Fl_File_Sort_F      as function (byval as dirent ptr ptr,byval as dirent ptr ptr) as long
' source=0 selection buffer changed  source=1 clipboard changed
type Fl_Clipboard_Notify_Handler as sub(byval source as long,byval userdata as any ptr)

' callback's for all extended FLTK classes
type Fl_DestructorEx     as sub      (byval self as any ptr)
type Fl_DrawEx           as function (byval self as any ptr) as long
type Fl_HandleEx         as function (byval self as any ptr,byval event as Fl_Event) as long
type Fl_ResizeEx         as function (byval self as any ptr,byval x as long,byval y as long,byval w as long,byval h as long) as long

' callback for the Fl_Overlay_WindowEx, Fl_GL_WindowEx and Fl_GlutWindowEx widget's
type Fl_Draw_OverlayEx   as sub      (byval self as any ptr)

' callback for the Fl_TableEx Fl_Table_RowEx widget only
type Fl_DrawCellEx       as function (byval self as any ptr,byval context as FL_TABLECONTEXT,byval row as long,byval col as long,byval x as long,byval y as long,byval w as long,byval h as long) as long

' callback for the Fl_Canvas only
type Fl_CanvasDraw       as sub      (byval self as any ptr,byref dtsX as long,byref dstY as long,byref cpyW as long,byref cpyH as long,byref srcX as long,byref srcY as long)

' callback's for all FLTK widgets
type Fl_Callback         as sub      (byval widget as Fl_Widget ptr,byval pData as any ptr)
type Fl_Callback0        as sub      (byval widget as Fl_Widget ptr)
type Fl_Callback1        as sub      (byval widget as Fl_Widget ptr,byval lData as long)
type Fl_Callback_p as Fl_Callback ptr

' callback only for the Fl_Help widget
type Fl_Help_F           as function (byval widget as Fl_Widget ptr,byval uri as const zstring ptr) as const zstring ptr 

' callback's for Fl_Image classes
type Fl_Shared_Handler   as function (byval ImageName as const zstring ptr,byval Header as ubyte ptr,byval HeaderLen as long) as Fl_Image ptr
type Fl_Draw_Image_Cb    as sub      (byval pUserData as any ptr,byval pixelstart as long,byval scanline as long,byval nPixels as long,byval pScanline as ubyte ptr)

' callback for the Fl_File_Chooser
type Fl_File_Chose_CB    as sub      (byval self as Fl_File_Chooser ptr,byval pUserData as any ptr)

' callbacks for FL_TEXT_XXX widgets
type Fl_Text_Modify_Cb    as sub     (byval pos as long,byval nInserted as long,byval nDeleted as long,byval nRestyled as long,byval deletedText as const zstring ptr,byval pUserdata as any ptr)
type Fl_Text_Predelete_Cb as sub     (byval pos as long,byval nDeleted  as long,byval pUserData as any ptr)
type Unfinished_Style_Cb  as sub     (byval i as long,byval p as any ptr)
type Key_Func             as function(byval key as long,byval editor as Fl_Text_Editor ptr) as long

type Key_Binding
  as long            Key
  as long            State
  as Key_Func        KeyFunction ' (!!! renamed was function)
  as Key_Binding ptr pNext       ' (!!! renamed was next)
end type

type Fl_Menu_Item
  as const zstring ptr text  ' menu item text, returned by label()
  as long        shortcut_   ' menu item shortcut
  as Fl_Callback cb_         ' menu item callback
  as any ptr     user_data_  ' menu item user_data for the menu's callback
  as long        flags       ' menu item flags like FL_MENU_TOGGLE, FL_MENU_RADIO
  as ubyte       labeltype_  ' how the menu item text looks like (see FL_LABEL_TYPE)
  as Fl_Font     labelfont_  ' which font for this menu item text
  as FL_FONTSIZE labelsize_  ' size of menu item text
  as Fl_Color    labelcolor_ ' menu item text color
end type

const FL_MAX_PATH = 2048

#ifndef NO_URI
' ########################################
' # File names and URI utility functions #
' ########################################
' Opens the specified Uniform Resource Identifier (URI).
declare function flOpenUri         (byval uri as const zstring ptr,byval msg as zstring ptr=0,byval msglen as long=0) as long

'Decodes a URL-encoded string.
declare sub      flDecodeUri       (byval uri as zstring ptr)

' Makes a filename absolute from a relative filename.
declare function flFilenameAsolute (byval result as zstring ptr,byval resultlen as long,byval path as const zstring ptr) as long

' Expands a filename containing shell variables and tilde (~). 
declare function flFilenameExpand  (byval result as zstring ptr,byval resultlen as long,byval path as const zstring ptr) as long

' Gets the extensions of a filename.
declare function flFilenameExt     (byval path as const zstring ptr) as const zstring ptr

' Determines if a file exists and is a directory from its filename.
declare function flFilenameIsDir   (byval filename as const zstring ptr) as long

' Checks if a string s matches a pattern.
' The following syntax is used for the pattern:
' * matches any sequence of 0 or more characters.
' ? matches any single character.
' [set] matches any character in the set. Set can contain any single characters, or a-z to represent a range. 
' To match ']' or '-' they must be the first characters. 
' To match '^' or '!' they must not be the first characters.
' [^set] or [!set] matches any character not in the set.
' {X|Y|Z} or {X,Y,Z} matches any one of the subexpressions literally.
' \x quotes the character x so it has no special meaning.
' x all other characters must be matched exactly.
declare function flFilenameMatch   (byval filename as const zstring ptr,byval pattern as const zstring ptr) as long

' Gets the file name from a path.
declare function flFilenameName    (byval path as const zstring ptr) as const zstring ptr

' Makes a filename relative to the current working directory.
declare function flFilenameRelative(byval result as zstring ptr,byval resultlen as long,byval path as const zstring ptr) as long

' Replaces the extension in buf of max.
declare function flFilenameSetExt  (byval result as zstring ptr,byval resultlen as long,byval extension as const zstring ptr) as zstring ptr

declare function flAlphaSort       as Fl_File_Sort_F
declare function flCaseAlphaSort   as Fl_File_Sort_F
declare function flCaseNumericSort as Fl_File_Sort_F
declare function flNumericSort     as Fl_File_Sort_F
declare function flFilenameList    (byval folder as const zstring ptr,byval list as dirent ptr ptr ptr,byval sortcb as Fl_File_Sort_F) as long
declare sub      flFilenameFreeList(byval list as dirent ptr ptr ptr,byval n as long)
#endif ' NO_URI

#ifndef NO_UTF8
'########
'# UTF8 #
'########
' Return the number of bytes needed to encode the given UCS4 character in UTF8.
declare function Fl_utf8bytes(byval ucs as ulong) as long

' OD: returns the byte length of the first UTF-8 char sequence (returns -1 if not valid)
declare function Fl_utf8len(byval c as byte) as long

' OD: returns the byte length of the first UTF-8 char sequence (returns +1 if not valid)
declare function Fl_utf8len1(byval c as byte) as long

' OD: returns the number of Unicode chars in the UTF-8 string
declare function Fl_utf_nb_char(byval buf as const ubyte ptr,byval len as long) as long

' F2: Convert the next UTF8 char-sequence into a Unicode value (and say how many bytes were used)
declare function Fl_utf8decode(byval p as const zstring ptr,byval end as const zstring ptr,byval len as long ptr) as ulong

' F2: Encode a Unicode value into a UTF8 sequence, return the number of bytes used
declare function Fl_utf8encode(byval ucs as ulong,byval buf as zstring ptr) as long

' F2: Move forward to the next valid UTF8 sequence start betwen start and end
declare function Fl_utf8fwd(byval p as const zstring ptr,byval start as const zstring ptr,byval end as const zstring ptr) as const zstring ptr

' F2: Move backward to the previous valid UTF8 sequence start
declare function Fl_utf8back(byval p as const zstring ptr,byval start as const zstring ptr,byval end as const zstring ptr) as const zstring ptr

' XX: Convert a single 32-bit Unicode value into UTF16
declare function Fl_ucs_to_Utf16(byval ucs as const ulong,byval dst as ushort ptr,byval dstlen as const ulong) as ulong

' F2: Convert a UTF8 string into UTF16
declare function Fl_utf8toUtf16(byval src as const zstring ptr,byval srclen as ulong,byval dst as ushort ptr,byval dstlen as ulong) as ulong

' F2: Convert a UTF8 string into a wide character string - makes UTF16 on win32, "UCS4" elsewhere
declare function Fl_utf8towc(byval src as const zstring ptr,byval srclen as ulong,byval dst as wchar_t ptr,byval dstlen as ulong) as ulong

' F2: Convert a wide character string to UTF8 - takes in UTF16 on win32, "UCS4" elsewhere
declare function Fl_utf8fromwc(byval dst as zstring ptr,byval dstlen as ulong,byval src as const wchar_t ptr,byval srclen as ulong) as ulong

' F2: Convert a UTF8 string into ASCII, eliding untranslatable glyphs
declare function Fl_utf8toa (byval src as const zstring ptr,byval srclen as ulong,byval dst as zstring ptr,byval dstlen as ulong) as ulong

' F2: Convert 8859-1 string to UTF8
declare function Fl_utf8froma (byval dst as zstring ptr,byval dstlen as ulong,byval src as const zstring ptr,byval srclen as ulong) as ulong

' F2: Returns true if the current O/S locale is UTF8
declare function Fl_utf8locale() as long

' F2: Examine the first len characters of src, to determine if the input text is UTF8 or not
' NOTE: The value returned is not simply boolean - it contains information about the probable type of the src text.
declare function Fl_utf8test(byval src as const zstring ptr,byval len as ulong) as long

' XX: return width of "raw" ucs character in columns. for internal use only
declare function Fl_wcwidth_(byval ucs as ulong) as long

' XX: return width of utf-8 character string in columns.
' NOTE: this may also do C1 control character (&H80 to &H9f) to CP1252 mapping, depending on original build options
declare function Fl_wcwidth(byval src as const zstring ptr) as long

' OD: Return true if the character is non-spacing
declare function Fl_nonspacing(byval ucs as ulong) as ulong

' F2: Convert UTF8 to a local multi-byte encoding - mainly for win32?
declare function Fl_utf8to_mb(byval src as const zstring ptr,byval srclen as ulong,byval dst as zstring ptr,byval dstlen as ulong) as ulong

' OD: Convert UTF8 to a local multi-byte encoding
declare function Fl_utf2mbcs(byval src as const zstring ptr) as zstring ptr

' F2: Convert a local multi-byte encoding to UTF8 - mainly for win32?
declare function Fl_utf8from_mb(byval dst as zstring ptr,byval dstlen as ulong,byval src as const zstring ptr,byval srclen as ulong) as ulong
#ifdef __FB_WIN32__
  ' OD: Attempt to convert the UTF8 string to the current locale
  declare function Fl_utf8_to_locale(byval s as const zstring ptr,byval len as long,byval codepage as ulong) as zstring ptr
  ' OD: Attempt to convert a string in the current locale to UTF8
  declare function Fl_locale_to_utf8(byval s as const zstring ptr,byval len as long,byval codepage as ulong) as zstring ptr
#endif

' The following functions are intended to provide portable, UTF8 aware versions of standard functions

' OD: UTF8 aware strncasecmp - converts to lower case Unicode and tests
declare function Fl_utf_strncasecmp(byval s1 as const zstring ptr,byval s2 as const zstring ptr,byval n as long) as long

' OD: UTF8 aware strcasecmp - converts to Unicode and tests
declare function Fl_utf_strcasecmp(byval s1 as const zstring ptr,byval s2 as const zstring ptr) as long

' OD: return the Unicode lower case value of ucs
declare function Fl_tolower(byval ucs as ulong) as long

' OD: return the Unicode upper case value of ucs
declare function Fl_toupper(byval ucs as ulong) as long

' OD: converts the UTF8 string to the lower case equivalent
declare function Fl_utf_tolower(byval str as const ubyte ptr,byval nLen as long,byval buf as zstring ptr) as long

' OD: converts the UTF8 string to the upper case equivalent
declare function Fl_utf_toupper(byval str as const ubyte ptr,byval nLen as long,byval buf as zstring ptr) as long

' OD: Portable UTF8 aware chmod wrapper
declare function Fl_chmod(byval f as const zstring ptr,byval mode as long) as long

' OD: Portable UTF8 aware access wrapper
declare function Fl_access(byval f as const zstring ptr,byval mode as long) as long

' OD: Portable UTF8 aware stat wrapper             !!! buffer as stat ptr
declare function Fl_stat(byval path as const zstring ptr,byval buffer as any ptr) as long

' OD: Portable UTF8 aware getcwd wrapper
declare function Fl_getcwd(byval buf as zstring ptr,byval maxlen as long) as zstring ptr

' OD: Portable UTF8 aware fopen wrapper
declare function Fl_fopen(byval f as const zstring ptr,byval mode as const zstring ptr) as FILE ptr

' OD: Portable UTF8 aware system wrapper
declare function Fl_system(byval f as const zstring ptr) as long

' OD: Portable UTF8 aware execvp wrapper
declare function Fl_execvp(byval file as const zstring ptr,byval argv as const zstring ptr ptr) as long

' OD: Portable UTF8 aware open wrapper
declare function Fl_open(byval f as const zstring ptr,byval o as long) as long

' OD: Portable UTF8 aware unlink wrapper
declare function Fl_unlink(byval f as const zstring ptr) as long

' OD: Portable UTF8 aware rmdir wrapper
declare function Fl_rmdir(byval f as const zstring ptr) as long

' OD: Portable UTF8 aware getenv wrapper
declare function Fl_getenv(byval varname as const zstring ptr) as zstring ptr

' OD: Portable UTF8 aware execvp wrapper
declare function Fl_mkdir(byval f as const zstring ptr,byval mode as long) as long

' OD: Portable UTF8 aware rename wrapper
declare function Fl_rename(byval f as const zstring ptr,byval t as const zstring ptr) as long

' OD: Given a full pathname, this will create the directory path needed to hold the file named
declare sub      Fl_make_path_for_file(byval path as const zstring ptr)

' OD: recursively create a path in the file system
declare function Fl_make_path(byval path as const zstring ptr) as ubyte
#endif ' NO_UTF8

#ifndef NO_PREFERENCES
' ########################
' # class Fl_Preferences #
' ########################
' The constructor creates a group that manages name/value pairs and child groups
declare function Fl_PreferencesNew(byval root as Fl_Root,byval vendor as const zstring ptr,byval application as const zstring ptr) as Fl_Preferences ptr

' Use this constructor to create or read a preferences file at an arbitrary position in the file system.
declare function Fl_PreferencesNew2(byval path as const zstring ptr,byval vendor as const zstring ptr,byval application as const zstring ptr) as Fl_Preferences ptr

' call the internal destructor and delete the preferences class
declare sub      Fl_PreferencesDelete(byref pref as Fl_Preferences ptr)

' Create or access a group of preferences using a name.
declare function Fl_PreferencesNewGroup(byval parent as Fl_Preferences ptr,byval groupname as const zstring ptr) as Fl_Preferences ptr

' Open a child group using a given index.
declare function Fl_PreferencesNewGroup2(byval parent as Fl_Preferences ptr,byval groupIndex as long) as Fl_Preferences ptr

' Writes all preferences to disk.
declare sub      Fl_PreferencesFlush(byval pref as Fl_Preferences ptr)

' Delete all groups and all entries. 
declare function Fl_PreferencesClear(byval pref as Fl_Preferences ptr) as long

' write key:values in group returns 0 if setting the value failed 
declare function Fl_PreferencesSetInt    (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr,byval value as long) as long
declare function Fl_PreferencesSetFloat  (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr,byval value as single) as long
declare function Fl_PreferencesSetFloat2 (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr,byval value as single,byval precision as long) as long
declare function Fl_PreferencesSetDouble (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr,byval value as double) as long
declare function Fl_PreferencesSetDouble2(byval pref as Fl_Preferences ptr,byval entry as const zstring ptr,byval value as double,byval precision as long) as long
declare function Fl_PreferencesSetString (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr,byval value as const zstring ptr) as long
declare function Fl_PreferencesSetData   (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr,byval value as const any ptr,byval size as long) as long

' read values from group:key returns 0 if the default value was used 
declare function Fl_PreferencesGetInt    (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr, byref value as long,byval defaultValue as long) as long
declare function Fl_PreferencesGetFloat  (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr, byref value as single,byval defaultValue as single) as long
declare function Fl_PreferencesGetDouble (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr, byref value as double,byval defaultValue as double) as long
declare function Fl_PreferencesGetString (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr, byref value as zstring ptr,byval defaultValue as const zstring ptr) as long
declare function Fl_PreferencesGetString2(byval pref as Fl_Preferences ptr,byval entry as const zstring ptr, byval value as zstring ptr,byval defaultValue as const zstring ptr,byval maxSize as long) as long
declare function Fl_PreferencesGetData   (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr, byref value as any ptr,byval defaultValue as const any ptr,byval defaultSize as long) as long
declare function Fl_PreferencesGetData2  (byval pref as Fl_Preferences ptr,byval entry as const zstring ptr, byval value as any ptr,byval defaultValue as const any ptr,byval defaultSize as long,byval maxSize as long) as long

' Returns the size of the value part of an entry.
declare function Fl_PreferencesGetSize(byval pref as Fl_Preferences ptr,byval entry as const zstring ptr) as long

' Creates a path that is related to the preferences file and that is usable for additional application data.
declare function Fl_PreferencesGetUserdataPath(byval pref as Fl_Preferences ptr,byval path as zstring ptr,byval pathlen as long) as long

' Return the name of this entry. 
declare function Fl_PreferencesEntryName(byval pref as Fl_Preferences ptr) as const zstring ptr

' Return the full path to this entry. 
declare function Fl_PreferencesEntryPath(byval pref as Fl_Preferences ptr) as const zstring ptr

' Returns the number of groups that are contained within a group.
declare function Fl_PreferencesGroups(byval pref as Fl_Preferences ptr) as long

' Returns the name of the Nth index group.
declare function Fl_PreferencesGroup(byval pref as Fl_Preferences ptr,byval groupIndex as long) as const zstring ptr

' Returns non-zero if a group with this name exists. 
declare function Fl_PreferencesGroupExists(byval pref as Fl_Preferences ptr,byval key as const zstring ptr) as long

' Deletes a group
declare function Fl_PreferencesDeleteGroup(byval pref as Fl_Preferences ptr,byval group as const zstring ptr) as long

' Delete all groups. 
declare function Fl_PreferencesDeleteAllGroups(byval pref as Fl_Preferences ptr) as long

' Returns the number of entries (name/value pairs) in a group.
declare function Fl_PreferencesEntries(byval pref as Fl_Preferences ptr) as long

' Returns the name of an entry.
declare function Fl_PreferencesEntry(byval pref as Fl_Preferences ptr,byval entryIndex as long) as const zstring ptr

' Returns non-zero if an entry with this name exists.
declare function Fl_PreferencesEntryExists(byval pref as Fl_Preferences ptr,byval key as const zstring ptr) as long

' Deletes a single name/value pair.
declare function Fl_PreferencesDeleteEntry(byval pref as Fl_Preferences ptr,byval entry as const zstring ptr) as long

' Delete all entries. 
declare function Fl_PreferencesDeleteAllEntries(byval pref as Fl_Preferences ptr) as long
#endif ' NO_PREFERENCES

#ifndef NO_DIALOG
'##################
'# common dialogs # see also: http://www.fltk.org/doc-1.3/group__group__comdlg.html
'##################
declare sub      flAlert(byval msg as const zstring ptr)

declare function flChoice(byval msg as const zstring ptr,byval btn1 as const zstring ptr,byval btn2 as const zstring ptr=0,byval btn3 as const zstring ptr=0) as long

declare sub      flBeep(byval t as Fl_Beep=FL_BEEP_DEFAULT)

declare function flColorChooser(byval name_ as const zstring ptr, byref r as ubyte, byref g as ubyte, byref b as ubyte,byval cmode as FL_ColorChooserModes) as long
declare function flColorChooser2(byval name_ as const zstring ptr, byref r as double, byref g as double, byref b as double,byval cmode as FL_ColorChooserModes) as long

declare function flDirChooser(byval message as const zstring ptr,byval filename as const zstring ptr,byval relative_ as long) as zstring ptr

declare function flFileChooser(byval message as const zstring ptr,byval path as const zstring ptr,byval filename as const zstring ptr,byval relative_ as long) as zstring ptr
declare sub      flFileChooserCallback(byval cb as sub cdecl(byval file as const zstring ptr))
declare sub      flFileChooserOkLabel(byval label as const zstring ptr)
declare function flInput(byval fmt as const zstring ptr,byval def_str as const zstring ptr) as const zstring ptr

declare sub      flMessage(byval txt as const zstring ptr)
declare sub      flMessageSetHotspot(byval enable as long)
declare function flMessageGetHotspot as long
declare function flMessageIcon as Fl_Widget ptr
declare sub      flMessageTitle(byval title as const zstring ptr)
declare sub      flMessageTitleDefault(byval title as const zstring ptr)

declare function flPassword(byval fmt as const zstring ptr,byval default_string as const zstring ptr) as const zstring ptr
#endif ' NO_DIALOG

'#########################
'# class Fl_File_Chooser #
'#########################
declare function Fl_File_ChooserNew(byval pathname as const zstring ptr,byval pattern as const zstring ptr,byval typ as FI_FILECHOOSER_TYPE,byval title as const zstring ptr) as Fl_File_Chooser ptr
declare sub      Fl_File_ChooserDelete(byref fc as Fl_File_Chooser ptr)

declare function Fl_File_ChooserAddExtra(byval fc as Fl_File_Chooser ptr,byval widget as Fl_Widget ptr) as Fl_Widget ptr
declare sub      Fl_File_ChooserCallback(byval fc as Fl_File_Chooser ptr,byval cb as Fl_File_Chose_CB,byval pdata as any ptr=0)
declare function Fl_File_ChooserCount(byval fc as Fl_File_Chooser ptr) as long

declare sub      Fl_File_ChooserRescan(byval fc as Fl_File_Chooser ptr)
declare sub      Fl_File_ChooserRescanKeepFilename(byval fc as Fl_File_Chooser ptr)

declare sub      Fl_File_ChooserShow(byval fc as Fl_File_Chooser ptr)
declare sub      Fl_File_ChooserHide(byval fc as Fl_File_Chooser ptr)

declare function Fl_File_ChooserShown(byval fc as Fl_File_Chooser ptr) as long

declare sub      Fl_File_ChooserSetColor(byval fc as Fl_File_Chooser ptr,byval c as Fl_Color)
declare function Fl_File_ChooserGetColor(byval fc as Fl_File_Chooser ptr) as Fl_Color

declare sub      Fl_File_ChooserSetDirectory(byval fc as Fl_File_Chooser ptr,byval d as const zstring ptr)
declare function Fl_File_ChooserGetDirectory(byval fc as Fl_File_Chooser ptr) as zstring ptr

declare sub      Fl_File_ChooserSetFilter(byval fc as Fl_File_Chooser ptr,byval f as const zstring ptr)
declare function Fl_File_ChooserGetFilter(byval fc as Fl_File_Chooser ptr) as const zstring ptr

declare sub      Fl_File_ChooserSetFilterValue(byval fc as Fl_File_Chooser ptr,byval f as long)
declare function Fl_File_ChooserGetFilterValue(byval fc as Fl_File_Chooser ptr) as long

declare sub      Fl_File_ChooserSetIconSize(byval fc as Fl_File_Chooser ptr,byval s as ubyte)
declare function Fl_File_ChooserGetIconSize(byval fc as Fl_File_Chooser ptr) as ubyte

declare sub      Fl_File_ChooserSetLabel(byval fc as Fl_File_Chooser ptr,byval l as const zstring ptr)
declare function Fl_File_ChooserGetLabel(byval fc as Fl_File_Chooser ptr) as const zstring ptr

declare sub      Fl_File_ChooserSetOkLabel(byval fc as Fl_File_Chooser ptr,byval l as const zstring ptr)
declare function Fl_File_ChooserGetOkLabel(byval fc as Fl_File_Chooser ptr) as const zstring ptr

declare sub      Fl_File_ChooserSetPreview(byval fc as Fl_File_Chooser ptr,byval e as long)
declare function Fl_File_ChooserGetPreview(byval fc as Fl_File_Chooser ptr) as long

declare sub      Fl_File_ChooserSetTextColor(byval fc as Fl_File_Chooser ptr,byval c as Fl_Color)
declare function Fl_File_ChooserGetTextColor(byval fc as Fl_File_Chooser ptr) as Fl_Color

declare sub      Fl_File_ChooserSetTextFont(byval fc as Fl_File_Chooser ptr,byval f as Fl_Font)
declare function Fl_File_ChooserGetTextFont(byval fc as Fl_File_Chooser ptr) as Fl_Font

declare sub      Fl_File_ChooserSetTextSize(byval fc as Fl_File_Chooser ptr,byval s as FL_FONTSIZE)
declare function Fl_File_ChooserGetTextSize(byval fc as Fl_File_Chooser ptr) as FL_FONTSIZE

declare sub      Fl_File_ChooserSetType(byval fc as Fl_File_Chooser ptr,byval t as long)
declare function Fl_File_ChooserGetType(byval fc as Fl_File_Chooser ptr) as long

declare sub      Fl_File_ChooserSetUserData(byval fc as Fl_File_Chooser ptr,byval pUserdata as any ptr)
declare function Fl_File_ChooserGetUserData(byval fc as Fl_File_Chooser ptr) as any ptr

declare sub      Fl_File_ChooserSetValue(byval fc as Fl_File_Chooser ptr,byval filename as const zstring ptr)
declare function Fl_File_ChooserGetValue(byval fc as Fl_File_Chooser ptr,byval f as long=1) as const zstring ptr

declare function Fl_File_ChooserVisible(byval fc as Fl_File_Chooser ptr) as long
declare function Fl_File_ChooserNewButton(byval fc as Fl_File_Chooser ptr) as Fl_Button ptr
declare function Fl_File_ChooserPreviewButton(byval fc as Fl_File_Chooser ptr) as Fl_Check_Button ptr
declare function Fl_File_ChooserShowHiddenButton(byval fc as Fl_File_Chooser ptr) as Fl_Check_Button ptr

#ifndef NO_NFC
'################################
'# class Fl_Native_File_Chooser #
'################################
declare function Fl_Native_File_ChooserNew(byval typ as FL_NFC_TYPE=NFC_BROWSE_FILE) as Fl_Native_File_Chooser ptr
declare sub      Fl_Native_File_ChooserDelete(byref nfc as Fl_Native_File_Chooser ptr)

declare function Fl_Native_File_ChooserCount(byval nfc as Fl_Native_File_Chooser ptr) as long

declare sub      Fl_Native_File_ChooserSetDirectory(byval nfc as Fl_Native_File_Chooser ptr,byval d as const zstring ptr)
declare function Fl_Native_File_ChooserGetDirectory(byval nfc as Fl_Native_File_Chooser ptr) as zstring ptr

declare function Fl_Native_File_ChooserErrorMsg(byval nfc as Fl_Native_File_Chooser ptr) as const zstring ptr

declare sub      Fl_Native_File_ChooserSetFilter(byval nfc as Fl_Native_File_Chooser ptr,byval f as const zstring ptr)
declare function Fl_Native_File_ChooserGetFilter(byval nfc as Fl_Native_File_Chooser ptr) as const zstring ptr

declare function Fl_Native_File_ChooserFilename(byval nfc as Fl_Native_File_Chooser ptr) as const zstring ptr
declare function Fl_Native_File_ChooserGetFilename(byval nfc as Fl_Native_File_Chooser ptr,byval fileIndex as long) as const zstring ptr

declare sub      Fl_Native_File_ChooserSetFilterValue(byval nfc as Fl_Native_File_Chooser ptr,byval value as long)
declare function Fl_Native_File_ChooserGetFilterValue(byval nfc as Fl_Native_File_Chooser ptr) as long

declare sub      Fl_Native_File_ChooserSetOptions(byval nfc as Fl_Native_File_Chooser ptr,byval opt as FL_NFC_OPTION)
declare function Fl_Native_File_ChooserGetOptions(byval nfc as Fl_Native_File_Chooser ptr) as FL_NFC_OPTION

declare sub      Fl_Native_File_ChooserSetPresetFile(byval nfc as Fl_Native_File_Chooser ptr,byval file as const zstring ptr)
declare function Fl_Native_File_ChooserGetPresetFile(byval nfc as Fl_Native_File_Chooser ptr) as const zstring ptr

declare function Fl_Native_File_ChooserShow(byval nfc as Fl_Native_File_Chooser ptr) as long

declare sub      Fl_Native_File_ChooserSetTitle(byval nfc as Fl_Native_File_Chooser ptr,byval title as const zstring ptr)
declare function Fl_Native_File_ChooserGetTitle(byval nfc as Fl_Native_File_Chooser ptr) as const zstring ptr

declare sub      Fl_Native_File_ChooserSetType(byval nfc as Fl_Native_File_Chooser ptr,byval typ as FL_NFC_TYPE)
declare function Fl_Native_File_ChooserGetType(byval nfc as Fl_Native_File_Chooser ptr) as FL_NFC_TYPE
#endif ' NO_NFC

#ifndef NO_DRAWING
'################
'# FLTK Drawing #
'################
' Checks whether platform supports true alpha blending for RGBA images. 
declare function DrawCanDoAlphaBlending as long

declare sub      DrawSetColor(byval c as Fl_Color)
declare sub      DrawSetRGBColor(byval r as ubyte,byval g as ubyte,byval b as ubyte)
declare function DrawGetColor as Fl_Color

' Pushes an empty clip region onto the stack so nothing will be clipped. 
declare sub      DrawPushNoClip

' Intersects the current clip region with a rectangle and pushes this new region onto the stack. 
declare sub      DrawPushClip(byval x as long,byval y as long,byval w as long,byval h as long)

' Restores the previous clip region.
' !!! You must call DrawPopClip() once for every time you call DrawPushClip(), DrawPushNoClip(). !!!
declare sub      DrawPopClip

' Undoes any clobbering of clip done by your program. 
declare sub      DrawRestoreClip

' Does the rectangle intersect the current clip region? 
declare function DrawNotClipped(byval x as long,byval y as long,byval w as long,byval h as long) as long

' Intersects the rectangle with the current clip region ? 
' and returns the bounding box of the result. 
declare function DrawClipBox(byval   x as long,byval    y as long, byval   w as long, byval   h as long, _
                             byref bbx as long, byref bby as long, byref bbw as long, byref bbh as long) as long

' dashes 
' A pointer to an array of dash lengths, measured in pixels. 
' The first location is how long to draw a solid portion, the next is how long to draw the gap, then the solid, etc. 
' It is terminated with a zero-length entry. A NULL pointer or a zero-length array results in a solid line. 
' !!! Odd array sizes are not supported and result in undefined behavior. !!!
declare sub      DrawSetLineStyle(byval style as Fl_LINE_STYLE, byval w as long=0, byval dashes as zstring ptr=0)

' ########################
' # fast integer drawing #
' ########################
' see: fltk-tools.bi also

' Draw a single pixel at the given coordinates with current color.
declare sub      DrawPoint(byval x as long,byval y as long)

' Draw a 1-pixel border inside this bounding box.
declare sub      DrawRect(byval x as long,byval y as long,byval w as long,byval h as long)
declare sub      DrawRectColor(byval x as long,byval y as long,byval w as long,byval h as long,byval c as Fl_Color)

' Color a rectangle that exactly fills the given bounding box.
declare sub      DrawRectFill        (byval x as long,byval y as long,byval w as long,byval h as long)
declare sub      DrawRectFillColor   (byval x as long,byval y as long,byval w as long,byval h as long,byval c as Fl_Color)
declare sub      DrawRectFillRGBColor(byval x as long,byval y as long,byval w as long,byval h as long,byval r as ubyte,byval g as ubyte,byval b as ubyte)

declare sub      DrawOverlayClear
declare sub      DrawOverlayRect(byval x as long,byval y as long,byval w as long,byval h as long)

' Draws a series of line segments around the given box.
' The string s must contain groups of 4 letters which specify one of 24 standard grayscale values, where 'A' is black and 'X' is white. 
' The order of each set of 4 characters is: top, left, bottom, right. 
' The result of calling DrawFrame() with a string that is not a multiple of 4 characters in length is undefined. 
' The only difference between this function and DrawFrame2() is the order of the line segments. 
declare sub      DrawFrame (byval s as const zstring ptr,byval x as long,byval y as long,byval w as long,byval h as long)
' The order of each set of 4 characters is: bottom, right, top, left.
declare sub      DrawFrame2(byval s as const zstring ptr,byval x as long,byval y as long,byval w as long,byval h as long)

' Draws a box using given type, position, size and color. 
declare sub      DrawBox(byval bt as Fl_Boxtype,byval x as long,byval y as long,byval w as long,byval h as long,byval c as Fl_Color)

' Draw one or two lines between the given points.
declare sub      DrawLine (byval x1 as long,byval y1 as long,byval x2 as long,byval y2 as long)
declare sub      DrawLine2(byval x1 as long,byval y1 as long,byval x2 as long,byval y2 as long,byval x3 as long,byval y3 as long)

' Outline a 3 or 4-sided polygon with lines.
declare sub      DrawLoop (byval x1 as long,byval y1 as long,byval x2 as long,byval y2 as long,byval x3 as long,byval y3 as long)
declare sub      DrawLoop2(byval x1 as long,byval y1 as long,byval x2 as long,byval y2 as long,byval x3 as long,byval y3 as long,byval x4 as long,byval y4 as long)

' Fill a 3 or 4-sided filled polygon. The polygon must be convex.
declare sub      DrawPolygon (byval x1 as long,byval y1 as long,byval x2 as long,byval y2 as long,byval x3 as long,byval y3 as long)
declare sub      DrawPolygon2(byval x1 as long,byval y1 as long,byval x2 as long,byval y2 as long,byval x3 as long,byval y3 as long,byval x4 as long,byval y4 as long)

' Draw horizontal and vertical lines. A horizontal line is drawn first, then a vertical, then a horizontal.
declare sub      DrawXYLine(byval x as long,byval y as long,byval x1 as long)
declare sub      DrawXYLine2(byval x as long,byval y as long,byval x1 as long,byval y1 as long)
declare sub      DrawXYLine3(byval x as long,byval y as long,byval x1 as long,byval y1 as long,byval x2 as long)

' Draw vertical and horizontal lines. A vertical line is drawn first, then a horizontal, then a vertical.
declare sub      DrawYXLine(byval x as long,byval y as long,byval y1 as long)
declare sub      DrawYXLine2(byval x as long,byval y as long,byval y1 as long,byval x2 as long)
declare sub      DrawYXLine3(byval x as long,byval y as long,byval y1 as long,byval x2 as long,byval y2 as long)

' DrawArc() draws a series of lines to approximate the arc.
declare sub      DrawArc(byval x as long,byval y as long,byval w as long,byval h as long,byval a1 as double,byval a2 as double)

' Draw filled ellipse sections using long coordinates.
' Like DrawArc(), but DrawPie() draws a filled-in pie slice. 
' This slice may extend outside the line drawn by DrawArc() to avoid this use w - 1 and h - 1. 
declare sub      DrawPie(byval x as long,byval y as long,byval w as long,byval h as long,byval a1 as double,byval a2 as double)


' ###########################
' # complex precise drawing #
' ###########################
' Saves the current transformation matrix on the stack.
' (The maximum depth of the stack is 32)
declare sub      DrawPushMatrix()
' Restores the current transformation matrix from the stack. 
declare sub      DrawPopMatrix()

' Concatenates another transformation onto the current matrix one. 
' matrix new
'  new.a = a*cuurent.a + b*cuurent.c;
'  new.b = a*cuurent.b + b*cuurent.d;
'  new.c = c*cuurent.a + d*cuurent.c;
'  new.d = c*cuurent.b + d*cuurent.d;
'  new.x = x*cuurent.a + y*cuurent.c + cuurent.x;
'  new.y = x*cuurent.b + y*cuurent.d + cuurent.y;
'  cuurent = new;
declare sub      DrawMultMatrix(byval a as double,byval b as double,byval c as double,byval d as double,byval x as double,byval y as double)

' Concatenates scaling transformation onto the current matrix.
' internal mult_matrix(s,0,0,s,0,0)
declare sub      DrawScale(byval s as double)
' internal mult_matrix(x,0,0,y,0,0)
declare sub      DrawScaleXY(byval sx as double,byval sy as double)

' Concatenates rotation transformation onto the current matrix. 
' internal mult_matrix(c,-s,s,c,0,0);
declare sub      DrawRotate(byval r as double)

' Concatenates translation transformation onto the current one
' internal  mult_matrix(1,0,0,1,tx,ty)
declare sub      DrawTranslate(byval tx as double,byval ty as double)

declare sub      DrawArc2(byval x as double,byval y as double,byval r as double,byval start as double,byval end_ as double)
' DrawCircle() is equivalent to DrawArc2(0,360) but may be faster
declare sub      DrawCircle(byval x as double,byval y as double,byval r as double)

' Add a series of points on a Bezier curve to the path.
declare sub      DrawCurve(byval x0 as double,byval y0 as double,byval x1 as double,byval y1 as double,byval x2 as double,byval y2 as double,byval x3 as double,byval y3 as double)

' drawing a list of points. 
declare sub      DrawBeginPoints()
declare sub      DrawEndPoints()

' drawing a list of lines. 
declare sub      DrawBeginLine()
declare sub      DrawEndLine()

' drawing a closed sequence of lines. 
declare sub      DrawBeginLoop()
declare sub      DrawEndLoop()

' drawing a convex filled polygon. 
declare sub      DrawBeginPolygon()
declare sub      DrawEndPolygon()

' drawing a complex filled polygon. (can be concave)
declare sub      DrawBeginComplexPolygon()
declare sub      DrawEndComplexPolygon()

' Adds a single vertex to the current path. 
' xfinal=x* cos(zrot) + y*sin(zrot) + xPos
' yfinal=x*-sin(zrot) + y*cos(zrot) + yPos
declare sub      DrawVertex(byval x as double,byval y as double)

' Adds a single vertex to the current path without further transformations. 
declare sub      DrawTransformedVertex(byval xf as double,byval yf as double)


' Transforms coordinate using the current transformation matrix. (x* cos(zrot) + y*sin(zrot) + xPos)
declare function DrawTransformX(byval x as double,byval y as double) as double
' Transforms coordinate using the current transformation matrix. (x*-sin(zrot) + y*cos(zrot) + yPos)
declare function DrawTransformY(byval x as double,byval y as double) as double

' Transforms distance using current transformation matrix.  (x* cos(zrot) + y*sin(zrot))
declare function DrawTransformDX(byval x as double,byval y as double) as double
' Transforms distance using current transformation matrix.  (x*-sin(zrot)+ y*cos(zrot))
declare function DrawTransformDY(byval x as double,byval y as double) as double


' ################
' # text drawing #
' ################
declare sub      DrawSetFont(byval font as Fl_Font,byval size as FL_FONTSIZE)
declare function DrawHeight(byval font as Fl_Font,byval size as FL_FONTSIZE) as long
declare function DrawGetFont() as Fl_Font

declare function DrawGetFontSize() as FL_FONTSIZE
declare function DrawGetFontHeight() as long
declare function DrawGetFontDescent() as long

declare function DrawGetStrWidth(byval txt as const zstring ptr) as long
declare function DrawGetStrWidth2(byval txt as const zstring ptr,byval nChars as long) as long
declare function DrawGetCharWidth(byval char as ulong) as long

declare sub      DrawStrExtents(byval txt as const zstring ptr, byref dx as long, byref dy as long, byref w as long, byref h as long)
declare sub      DrawStrExtents2(byval txt as const zstring ptr,byval nChars as long, byref dx as long, byref dy as long, byref w as long, byref h as long)
declare sub      DrawStrMeasure(byval txt as const zstring ptr, byref x as long, byref y as long,byval draw_symbols as long = 1)
declare sub      DrawStr(byval txt as const zstring ptr,byval x as long,byval y as long)
declare sub      DrawStr2(byval txt as const zstring ptr,byval nChars as long,byval x as long,byval y as long)
declare sub      DrawStrRightToLeft(byval txt as const zstring ptr,byval nChars as long,byval x as long,byval y as long)
declare sub      DrawStrRot(byval angle as long,byval txt as const zstring ptr,byval x as long,byval y as long)
declare sub      DrawStrRot2(byval angle as long,byval txt as const zstring ptr,byval nChars as long,byval x as long,byval y as long)
declare sub      DrawStrBox(byval txt as const zstring ptr,byval x as long,byval y as long,byval w as long,byval h as long, _
                            byval aligh as Fl_Align=0,byval img as Fl_Image ptr=0,byval draw_symbols as long = 1)

declare function DrawLatin1ToLocal(byval txt as const zstring ptr,byval nChars as long=-1) as const zstring ptr
declare function DrawLocalToLatin1(byval txt as const zstring ptr,byval nChars as long=-1) as const zstring ptr

' #################
' # image drawing #
' #################
' Draws an 8-bit per color RGB or luminance image. 
declare sub      DrawImage    (byval buf as const any ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval BytesPerPixel as long=3,byval pitch as long=0)
' Draws a gray-scale (1 channel) image. 
declare sub      DrawImageMono(byval buf as const any ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval BytesPerPixel as long=1,byval pitch as long=0)

' Draws an image using a callback function to generate image data.
declare sub      DrawImageCallback    (byval cb as Fl_Draw_Image_Cb,byval pUserData as any ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval BytesPerPixel as long)
' Draws a gray-scale image using a callback function to generate image data. 
declare sub      DrawImageMonoCallback(byval cb as Fl_Draw_Image_Cb,byval pUserData as any ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval BytesPerPixel as long)

' Reads an RGB(A) image from the current window
' p    pixel buffer, or NULL to allocate one
' X,Y  position of top-left of image to read
' W,H  width and height of image to read
' alphavalue value for image (0 for none)
' Returns:  pointer to pixel buffer, or NULL if allocation failed.. 
declare function DrawReadImage(byval p as any ptr=0,byval x as long,byval y as long,byval w as long,byval h as long,byval alphavalue as long=0) as any ptr

' Draw XPM image data, with the top-left corner at the given position. 
declare function DrawPixmap(byval pdata as ubyte ptr const ptr,byval x as long,byval y as long,byval c as Fl_Color=FL_GRAY) as long
declare function DrawPixmap2(byval cdata as const zstring ptr const ptr,byval x as long,byval y as long,byval c as Fl_Color=FL_GRAY) as long

' Get the dimensions of a pixmap.
declare function DrawMeasurePixmap(byval pdata as zstring ptr const ptr, byref w as long, byref h as long) as long
declare function DrawMeasurePixmap2(byval cdata as const zstring ptr const ptr, byref w as long, byref h as long) as long

#ifndef NO_OPENGL
' ###################
' # FLTK GL drawing #
' ###################
declare sub      glDrawSetColor(byval c as Fl_Color)
declare sub      glDrawRect(byval x as long,byval y as long,byval w as long,byval h as long)
declare sub      glDrawRectFill(byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      glDrawSetFont(byval font as Fl_Font,byval size as FL_FONTSIZE)

declare function glDrawGetFontHeight() as long
declare function glDrawGetFontDescent() as long

declare function glDrawGetStrWidth(byval txt as const zstring ptr) as double
declare function glDrawGetStrWidth2(byval txt as const zstring ptr,byval nChars as long) as double

declare function glDrawGetCharWidth(byval c as ubyte) as double
declare sub      glDrawStrMeasure(byval txt as const zstring ptr, byref w as long, byref h as long)

declare sub      glDrawStr    (byval txt as const zstring ptr)
declare sub      glDrawStr2   (byval txt as const zstring ptr,byval nChars as long)

declare sub      glDrawStrAti (byval txt as const zstring ptr,byval x as long,byval y as long)
declare sub      glDrawStrAti2(byval txt as const zstring ptr,byval nChars as long,byval x as long,byval y as long)

declare sub      glDrawStrAtf (byval txt as const zstring ptr,byval x as single,byval y as single)
declare sub      glDrawStrAtf2(byval txt as const zstring ptr,byval nChars as long,byval x as single,byval y as single)

declare sub      glDrawStrBox(byval txt as const zstring ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval align as Fl_Align)
declare sub      glDrawImage(byval buffer as const ubyte ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval BytesPerPixel as long=3,byval pitch as long=0)
#endif ' NO_OPENGL

declare function Fl_GetDrawShortcutFlag as ubyte
declare sub      Fl_SetDrawShortcutFlag(byval flag as ubyte)

' I don't know why but it's defined in "Fl_Draw.H"
declare function Fl_GetShortcutLabel(byval shortcut as long) as const zstring ptr

#endif ' NO_DRAWING

#ifndef NO_FILEICON
' ######################
' # class Fl_File_Icon #
' ######################
enum FL_FILEICON_TYPE
  FL_FILEICON_ANY = 0   ' Any kind of file
  FL_FILEICON_PLAIN     ' Only plain files
  FL_FILEICON_FIFO      ' Only named pipes
  FL_FILEICON_DEVICE    ' Only character and block devices
  FL_FILEICON_LINK      ' Only symbolic links
  FL_FILEICON_DIRECTORY ' Only directories
end enum

enum FL_DATAOPCODE
  FL_DOP_END = 0        ' End of primitive/icon                 same as DrawEndLine|Loop|ComplexPolygon [0]=opcode
  FL_DOP_COLOR          ' Followed by color value (2 shorts)    same as DrawSetColor  [0]=opcode [1]=HiWord(Fl_Color) [2]=LoWord(Fl_Color)
  FL_DOP_LINE           ' Start of line                         same as DrawBeginLine [0]=opcode
  FL_DOP_CLOSEDLINE     ' Start of closed line                  same as DrawBeginLoop [0]=opcode
  FL_DOP_POLYGON        ' Start of polygon                      same as DrawBeginComplexPolygon [0]=opcode [1]=HiWord(Fl_Color) [2]=LoWord(Fl_Color)
  FL_DOP_OUTLINEPOLYGON ' Followed by outline color (2 shorts)  same as DrawBeginComplexPolygon [0]=opcode
  FL_DOP_VERTEX         ' Followed by scaled X,Y                same as DrawVertexBegin [0]=opcode [1]=cshort(X) [2]=cshort(Y)
end enum
' static members:
' Finds an icon that matches the given filename and file type. (returns NULL if not found)
declare function Fl_File_IconFind(byval Filename as const zstring ptr, byval FileType as FL_FILEICON_TYPE=FL_FILEICON_ANY) as Fl_File_Icon ptr
' Returns a pointer to the first icon in the list.
declare function Fl_File_IconFirst as Fl_File_Icon ptr
' Draw the icon label.
declare sub      Fl_File_IconLabelType(byval o as const Fl_Label ptr, byval x as long, byval y as long, byval w as long, byval h as long, byval align as Fl_Align)
' Loads all system-defined icons. This call is useful when using the FileChooser widget 
' and should be used when the application starts:
declare sub      Fl_File_IconLoadSystemIcons

' public members:
' Creates a new Fl_File_Icon with the specified information.
declare function Fl_File_IconNew       (byval FilenamePattern as const zstring ptr=@"", byval FileType as FL_FILEICON_TYPE=FL_FILEICON_ANY, byval nDataValue as long=0, byval pDataValue as short ptr=0) as Fl_File_Icon ptr
' The destructor destroys the icon and frees all memory that has been allocated for it.
declare sub      Fl_File_IconDelete    (byref fi as Fl_File_Icon ptr)
' Adds a keyword value to the icon array, returning a pointer to it.
declare function Fl_File_IconAdd       (byval fi as Fl_File_Icon ptr, byval DataValue as short) as short ptr
' Adds a color value (FL_DATAOPCODE) to the icon array, returning a pointer to it.
declare function Fl_File_IconAddColor  (byval fi as Fl_File_Icon ptr, byval c as Fl_Color) as short ptr
' Adds a vertex value to the icon array, returning a pointer to it.
' The long version accepts coordinates from 0 to 10000.
' The origin (0,0) is in the lower-lefthand corner of the icon.
declare function Fl_File_IconAddVertex (byval fi as Fl_File_Icon ptr, byval ix as long, byval iy as long) as short ptr
' Adds a vertex value to the icon array, returning a pointer to it.
' The floating point version goes from 0.0 to 1.0.
' The origin (0.0,0.0) is in the lower-lefthand corner of the icon.
declare function Fl_File_IconAddVertex2(byval fi as Fl_File_Icon ptr, byval fx as single , byval fy as single ) as short ptr
' Clears all icon data from the icon
declare sub      Fl_File_IconClear     (byval fi as Fl_File_Icon ptr)
' Draws an icon in the indicated area.
declare sub      Fl_File_IconDraw      (byval fi as Fl_File_Icon ptr, byval x as long, byval y as long, byval w as long, byval h as long, byval c as Fl_Color, byval IsActive as long=1)
' Applies the icon to the widget, registering the Fl_File_Icon label type as needed.
declare sub      Fl_File_IconLabel     (byval fi as Fl_File_Icon ptr, byval wgt as Fl_Widget ptr)
' Loads the specified icon image. The format is deduced from the filename. Returns 0 on success, non-zero on error.
declare sub      Fl_File_IconLoad      (byval fi as Fl_File_Icon ptr, byval filename as const zstring ptr)
' Loads an SGI icon file. Returns 0 on success, non-zero on error.
declare function Fl_File_IconLoadFTI   (byval fi as Fl_File_Icon ptr, byval filename as const zstring ptr) as long
' Load an image icon file from an image filename. Returns 0 on success, non-zero on error.
declare function Fl_File_IconLoadImage (byval fi as Fl_File_Icon ptr, byval filename as const zstring ptr) as long
' Returns next file icon object. See Fl_File_IconFirst()
declare function Fl_File_IconNext      (byval fi as Fl_File_Icon ptr) as Fl_File_Icon ptr
' Returns the filename matching pattern for the icon.
declare function Fl_File_IconPattern   (byval fi as Fl_File_Icon ptr) as const zstring ptr
' Returns the number of words of data used by the icon.
declare function Fl_File_IconSize      (byval fi as Fl_File_Icon ptr) as long
' Returns the filetype associated with the icon
declare function Fl_File_IconType      (byval fi as Fl_File_Icon ptr) as FL_FILEICON_TYPE
' Returns the data array for the icon
declare function Fl_File_IconValue     (byval fi as Fl_File_Icon ptr) as short ptr
#endif ' NO_FILEICON

#ifndef NO_IMAGE
'##################
'# class Fl_Image #
'##################
declare function Fl_ImageNew(byval w as long,byval h as long,byval d as long) as Fl_Image ptr
declare sub      Fl_ImageDelete(byref img as Fl_Image ptr)

declare sub      Fl_ImageUncache(byval img as Fl_Image ptr)

declare sub      Fl_ImageInactive(byval img as Fl_Image ptr)
declare sub      Fl_ImageColorAverage(byval img as Fl_Image ptr,byval c as Fl_Color,byval i as single)

declare function Fl_ImageCopy(byval img as Fl_Image ptr) as Fl_Image ptr
declare function Fl_ImageCopy2(byval img as Fl_Image ptr,byval w as long,byval h as long) as Fl_Image ptr
declare function Fl_ImageCount(byval img as Fl_Image ptr) as long

declare sub      Fl_ImageDesaturate(byval img as Fl_Image ptr)

declare sub      Fl_ImageDraw(byval img as Fl_Image ptr,byval x as long=0,byval y as long=0)
declare sub      Fl_ImageDraw2(byval img as Fl_Image ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval cx as long = 0,byval cy as long = 0)

declare function Fl_ImageData(byval img as Fl_Image ptr) as const ubyte ptr const ptr
declare function Fl_ImageW(byval img as Fl_Image ptr) as long
declare function Fl_ImageH(byval img as Fl_Image ptr) as long
declare function Fl_ImageD(byval img as Fl_Image ptr) as long
declare function Fl_ImageLD(byval img as Fl_Image ptr) as long

declare function Fl_ImageGetWidth         alias "Fl_ImageW"  (byval img as Fl_Image ptr) as long
declare function Fl_ImageGetHeight        alias "Fl_ImageH"  (byval img as Fl_Image ptr) as long
declare function Fl_ImageGetBytesPerPixel alias "Fl_ImageD"  (byval img as Fl_Image ptr) as long
declare function Fl_ImageGetPitch         alias "Fl_ImageLD" (byval img as Fl_Image ptr) as long

'##########################################
'# class Fl_Shared_Image extends Fl_Image #
'##########################################
' enable all image loaders (gif, bmp, jpg, png,...)
declare sub      Fl_Register_Images()

' ##################
' # static members #
' ##################
' Find or load an image that can be shared by multiple widgets.  
declare function Fl_Shared_ImageGet(byval name_or_path as const zstring ptr,byval w as long=0,byval h as long=0) as Fl_Shared_Image ptr
' Finds a shared image from its name and optional by it's size specifications. 
declare function Fl_Shared_ImageFind(byval name_ as const zstring ptr,byval w as long=0,byval h as long=0) as Fl_Shared_Image ptr
' Returns the Fl_Shared_Image ptr array. 
declare function Fl_Shared_ImageImages as Fl_Shared_Image ptr ptr
' Returns the total number of shared images in the array.
declare function Fl_Shared_ImageNumImages as long
' Adds/removes a shared image handler, which is basically a test function for adding new formats. 
declare sub      Fl_Shared_ImageAddHandler(byval handler as Fl_Shared_Handler)
declare sub      Fl_Shared_ImageRemoveHandler(byval handler as Fl_Shared_Handler)

' ###################
' # public memnbers #
' ###################
' The color_average() method averages the colors in the image with the FLTK color value c. 
declare sub      Fl_Shared_ImageColorAverage(byval si as Fl_Shared_Image ptr,byval c as Fl_Color,byval i as single)
' The copy() method creates a copy of the specified image.
declare function Fl_Shared_ImageCopy(byval si as Fl_Shared_Image ptr) as Fl_Image ptr
' The copy2() method creates a copy of the specified image and rescale it.
declare function Fl_Shared_ImageCopy2(byval si as Fl_Shared_Image ptr,byval w as long,byval h as long) as Fl_Image ptr
' The desaturate() method converts an image to grayscale. 
declare sub      Fl_Shared_ImageDesaturate(byval si as Fl_Shared_Image ptr)
' Draws the image at position x,y. 
declare sub      Fl_Shared_ImageDraw(byval si as Fl_Shared_Image ptr,byval x as long,byval y as long)
' Draws the image with a bounding box. 
declare sub      Fl_Shared_ImageDraw2(byval si as Fl_Shared_Image ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval cx as long=0,byval cy as long=0)
' Returns the filename of the shared image. 
declare function Fl_Shared_ImageName(byval si as Fl_Shared_Image ptr) as const zstring ptr
' Returns the number of references of this shared image.
declare function Fl_Shared_ImageRefcount(byval si as Fl_Shared_Image ptr) as long
' Releases and possibly destroys (if refcount <=0) a shared image.
declare sub      Fl_Shared_ImageRelease(byval si as Fl_Shared_Image ptr)
' Reloads the shared image from disk.
declare sub      Fl_Shared_ImageReload(byval si as Fl_Shared_Image ptr)
' If the image has been cached for display, delete the cache data. 
declare sub      Fl_Shared_ImageUncache(byval si as Fl_Shared_Image ptr)

'#########################################
'# class Fl_Tiled_Image extends Fl_Image #
'#########################################
declare function Fl_Tiled_ImageNew(byval img as Fl_Image ptr,byval w as long=0,byval h as long=0) as Fl_Tiled_Image ptr
declare sub      Fl_Tiled_ImageDelete(byref timg as Fl_Tiled_Image ptr)
declare sub      Fl_Tiled_ImageColorAverage(byval timg as Fl_Tiled_Image ptr,byval c as Fl_Color,byval i as single)
declare function Fl_Tiled_ImageCopy(byval timg as Fl_Tiled_Image ptr) as Fl_Image ptr
declare function Fl_Tiled_ImageCopy2(byval timg as Fl_Tiled_Image ptr,byval w as long,byval h as long) as Fl_Image ptr
declare sub      Fl_Tiled_ImageDesaturate(byval timg as Fl_Tiled_Image ptr)
declare sub      Fl_Tiled_ImageDraw(byval timg as Fl_Tiled_Image ptr,byval x as long,byval y as long)
declare sub      Fl_Tiled_ImageDraw2(byval timg as Fl_Tiled_Image ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval cx as long=0,byval cy as long=0)
declare function Fl_Tiled_ImageImage(byval timg as Fl_Tiled_Image ptr) as Fl_Image ptr

'####################################
'# class Fl_Bitmap extends Fl_Image # 1 bit per pixel
'####################################
declare function Fl_BitmapNew(byval bits as const ubyte ptr const ptr,byval w as long,byval h as long) as Fl_Bitmap ptr
declare sub      Fl_BitmapDelete(byref bm as Fl_Bitmap ptr)
declare function Fl_BitmapCopy (byval bm as Fl_Bitmap ptr) as Fl_Image ptr
declare function Fl_BitmapCopy2(byval bm as Fl_Bitmap ptr,byval w as long,byval h as long) as Fl_Image ptr
declare sub      Fl_BitmapDraw (byval bm as Fl_Bitmap ptr,byval x as long,byval y as long)
declare sub      Fl_BitmapDraw2(byval bm as Fl_Bitmap ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval cx as long = 0,byval cy as long = 0)
declare sub      Fl_BitmapUncache(byval bm as Fl_Bitmap ptr)
declare sub      Fl_BitmapLabel(byval bm as Fl_Bitmap ptr,byval wgt as Fl_Widget ptr)
declare sub      Fl_BitmapLabel2(byval bm as Fl_Bitmap ptr,byval itm as Fl_Menu_Item ptr)

'########################################
'# class Fl_XBM_Image extends Fl_Bitmap # 1 bit per pixel
'########################################
declare function Fl_XBM_ImageNew(byval filename as const zstring ptr) as Fl_Bitmap ptr
declare sub      Fl_XBM_ImageDelete(byref xbm as Fl_Bitmap ptr)

'####################################
'# class Fl_Pixmap extends Fl_Image #  8 bit per pixel
'####################################
declare function Fl_PixmapNew(byval xpm_data as const zstring ptr const ptr) as Fl_Pixmap ptr
declare sub      Fl_PixmapDelete(byref xbm as Fl_Pixmap ptr)
declare sub      Fl_PixmapColorAverage(byval pm as Fl_Pixmap ptr,byval c as Fl_Color,byval i as single)
declare function Fl_PixmapCopy(byval pm as Fl_Pixmap ptr) as Fl_Image ptr
declare function Fl_PixmapCopy2(byval pm as Fl_Pixmap ptr,byval w as long,byval h as long) as Fl_Image ptr
declare sub      Fl_PixmapDesaturate(byval pm as Fl_Pixmap ptr)
declare sub      Fl_PixmapDraw(byval pm as Fl_Pixmap ptr,byval x as long,byval y as long)
declare sub      Fl_PixmapDraw2(byval pm as Fl_Pixmap ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval cx as long=0,byval cy as long=0)
declare sub      Fl_PixmapUncache(byval pm as Fl_Pixmap ptr)
declare sub      Fl_PixmapLabel(byval pm as Fl_Pixmap ptr,byval wgt as Fl_Widget ptr)
declare sub      Fl_PixmapLabel2(byval pm as Fl_Pixmap ptr,byval itm as Fl_Menu_Item ptr)

'########################################
'# class Fl_GIF_Image extends Fl_Pixmap # 8 bit per pixel
'########################################
declare function Fl_GIF_ImageNew(byval filename as const zstring ptr) as Fl_GIF_Image ptr
declare sub      Fl_GIF_ImageDelete(byref gif as Fl_GIF_Image ptr)

'########################################
'# class Fl_XPM_Image extends Fl_Pixmap # 8 bit per pixel
'########################################
declare function Fl_XPM_ImageNew(byval filename as const zstring ptr) as Fl_XPM_Image ptr
declare sub      Fl_XPM_ImageDelete(byref xpm as Fl_XPM_Image ptr)

'#######################################
'# class Fl_RGB_Image extends Fl_Image # truecolor 16,24,32 bit per pixel
'#######################################
declare function Fl_RGB_ImageNew(byval bits as const any ptr,byval w as long,byval h as long,byval BytesPerPixel as long=3,byval pitch as long=0) as Fl_RGB_Image ptr
declare sub      Fl_RGB_ImageDelete      (byref img as Fl_RGB_Image ptr)
declare sub      Fl_RGB_ImageUncache     (byval img as Fl_RGB_Image ptr)
declare sub      Fl_RGB_ImageColorAverage(byval img as Fl_RGB_Image ptr,byval c as Fl_Color,byval i as single)
declare function Fl_RGB_ImageCopy        (byval img as Fl_RGB_Image ptr) as Fl_Image ptr
declare function Fl_RGB_ImageCopy2       (byval img as Fl_RGB_Image ptr,byval w as long,byval h as long) as Fl_Image ptr
declare sub      Fl_RGB_ImageDesaturate  (byval img as Fl_RGB_Image ptr)
declare sub      Fl_RGB_ImageDraw        (byval img as Fl_RGB_Image ptr,byval x as long,byval y as long)
declare sub      Fl_RGB_ImageDraw2       (byval img as Fl_RGB_Image ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval cx as long=0,byval cy as long=0)
declare sub      Fl_RGB_ImageLabel       (byval img as Fl_RGB_Image ptr,byval wgt as Fl_Widget ptr)
declare sub      Fl_RGB_ImageLabel2      (byval img as Fl_RGB_Image ptr,byval itm as Fl_Menu_Item ptr)

'###########################################
'# class Fl_BMP_Image extends Fl_RGB_Image #  truecolor
'###########################################
declare function Fl_BMP_ImageNew (byval filename as const zstring ptr) as FL_BMP_Image ptr
declare sub      Fl_BMP_ImageDelete(byref bmp as Fl_BMP_Image ptr)
'###########################################
'# class Fl_PNG_Image extends Fl_RGB_Image #  truecolor
'###########################################
declare function Fl_PNG_ImageNew (byval filename as const zstring ptr) as FL_PNG_Image ptr
declare sub      Fl_PNG_ImageDelete(byref png as Fl_PNG_Image ptr)
' load from memory
' If a name is given, the image is added to the list of shared images (see: Fl_Shared_Image) and will be available by that name.
declare function Fl_PNG_ImageMem(byval name_png as const zstring ptr=0,byval buffer as const any ptr,byval datasize as long) as FL_PNG_Image ptr

'############################################
'# class Fl_JPEG_Image extends Fl_RGB_Image #  truecolor
'############################################
declare function Fl_JPEG_ImageNew(byval filename as const zstring ptr) as FL_JPEG_Image ptr
declare sub      Fl_JPEG_ImageDelete(byref jpg as Fl_JPEG_Image ptr)
' load from memory
' If a name is given, the image is added to the list of shared images (see: Fl_Shared_Image) and will be available by that name.
declare function Fl_JPEG_ImageMem(byval name_jpeg as const zstring ptr=0,byval buffer as const any ptr) as FL_JPEG_Image ptr

'###########################################
'# class Fl_PNM_Image extends Fl_RGB_Image #  truecolor
'###########################################
declare function Fl_PNM_ImageNew (byval filename as const zstring ptr) as FL_PNM_Image ptr
declare sub      Fl_PNM_ImageDelete(byref pnm as Fl_PNM_Image ptr)

#endif ' NI_IMAGE


#ifndef NO_TOOLTIP
' ###########################
' # static class Fl_Tooltip #
' ###########################
' Get/Set the tooltip delay. The default delay is 1.0 seconds.
declare function Fl_TooltipGetDelay as single
declare sub      Fl_TooltipSetDelay(byval d as single)

'  Get/Set the tooltip hover delay, the delay between tooltips. (The default delay is 0.2 seconds.)
declare function Fl_TooltipGetHoverdelay as single
declare sub      Fl_TooltipSetHoverdelay(byval hd as single)

' Returns non-zero if tooltips are enabled.
declare function Fl_TooltipGetEnabled as long

' Enables tooltips on all widgets (or disables if blnEnable is 0).
declare sub      Fl_TooltipSetEnable(byval blnEnable as long=1)
' disables tooltips on all widgets, same as enable(0).
declare sub      Fl_TooltipDisable

' Get/set the current widget target
declare function Fl_TooltipGetCurrentWidget() as Fl_Widget ptr
declare sub      Fl_TooltipSetCurrentWidget(byval wgt as Fl_Widget ptr)

' Get/Set the typeface for the tooltip text.
declare function Fl_TooltipGetFont as Fl_Font
declare sub      Fl_TooltipSetFont(byval f as Fl_Font)

' Get/Set the size of the tooltip text.
declare function Fl_TooltipGetFontSize as FL_FONTSIZE
declare sub      Fl_TooltipSetFontSize(byval s as FL_FONTSIZE)

' Get/Set the background color for tooltips. (The default background color is a pale yellow.)
declare function Fl_TooltipGetColor as Fl_Color
declare sub      Fl_TooltipSetColor(byval c as Fl_Color)

' Get/set the color of the text in the tooltip. (The default is  black.)
declare function Fl_TooltipGetTextColor as Fl_Color
declare sub      Fl_TooltipSetTextColor(byval c as Fl_Color)

' Get/Set the amount of extra space left/right of the tooltip's text. (Default is 3.)
declare function Fl_TooltipGetMarginWidth as long
declare sub      Fl_TooltipSetMarginWidth(byval w as long)

' Get/Set the amount of extra space above and below the tooltip's text. (Default is 3.)
declare sub      Fl_TooltipSetMarginHeight(byval h as long)
declare function Fl_TooltipGetMarginHeight as long

' Get/Set the maximum width for tooltip's text before it word wraps. (Default is 400.)
declare function Fl_TooltipGetWrapWidth as long
declare sub      Fl_TooltipSetWrapWidth(byval w as long)

declare sub      Fl_TooltipEnterArea(byval wgt as Fl_Widget ptr,byval x as long,byval y as long,byval w as long,byval h as long, byval tip as const zstring ptr)
declare sub      Fl_TooltipEnter(byval wgt as Fl_Widget ptr)
#endif

'###################
'# static class Fl #
'###################
declare sub      Fl_Free(byref By_FLTK_Allocated_Pointer as any ptr)

' #############
' # callbacks #
' #############
' Adds an awake handler for use in Fl_Awake().
declare function Fl_AddAwakeHandler(byval h as Fl_Awake_Handler,byval pArg as any ptr=0) as long
' Sends a message pointer to the main thread, causing any pending Fl_Wait() call to terminate 
' so that the main thread can retrieve the message and any pending redraws can be processed. 
declare sub      Fl_Awake(byval message as any ptr = 0)
declare function Fl_Awake2(byval h as Fl_Awake_Handler,byval message as any ptr = 0) as long
' Gets the last stored awake handler for use in Fl_Awake(). 
declare function Fl_GetAwakeHandler_(byref h as Fl_Awake_Handler, byref pArg as any ptr) as long

' FLTK will call this callback just before it flushes the display and waits for events.
declare sub      Fl_AddCheck(byval h as Fl_Timeout_Handler,byval pArg as any ptr = 0)
' Removes a check callback. 
declare sub      Fl_RemoveCheck(byval h as Fl_Timeout_Handler,byval pdata as any ptr=0)
declare function Fl_HasCheck(byval h as Fl_Timeout_Handler,byval pArg as any ptr = 0) as long

' FLTK will call the registered callback whenever there is a change to the selection buffer or the clipboard.
' The source argument indicates which of the two has changed. Only changes by other applications are reported.
declare sub      Fl_AddClipboardNotify(byval h as Fl_Clipboard_Notify_Handler,byval pArg as any ptr=0)
declare sub      Fl_RemoveClipboardNotify(byval h as Fl_Clipboard_Notify_Handler)

' Adds file descriptor fd to listen to.
' When the fd becomes ready for reading Fl_Wait() will call the callback and then return. 
' The callback is passed the fd and the arbitrary pArg argument.
' The second version takes a when bitfield, with the bits FL_READ, FL_WRITE, and FL_EXCEPT defined, to indicate when the callback should be done.
' There can only be one callback of each type for a file descriptor. Fl_Rremove_fd() gets rid of all the callbacks for a given file descriptor.
' Under UNIX any file descriptor can be monitored (files, devices, pipes, sockets, etc.). 
' Due to limitations in Microsoft Windows, WIN32 applications can only monitor sockets. 
declare sub      Fl_Add_fd(byval fd as long,byval cb as Fl_FD_Handler,byval pArg as any ptr=0)
declare sub      Fl_Add_fd2(byval fd as long,byval when as long,byval cb as Fl_FD_Handler,byval pArg as any ptr=0)
' Removes a file descriptor handler. see Fl_Add_fd()
declare sub      Fl_RemoveFD(byval fd as long)
declare sub      Fl_RemoveFD2(byval fd as long,byval when as long)

' Install a function to parse unrecognized events.
declare sub      Fl_AddHandler(byval h as Fl_Event_Handler)
declare sub      Fl_RemoveHandler(byval h as Fl_Event_Handler)

' Adds a callback function that is called every time by Fl_Wait() and also makes it act as though the timeout is zero 
' (this makes Fl_Wait() return immediately, so if it's in a loop it's called repeatedly, and thus the idle fucntion is called repeatedly). 
declare sub      Fl_AddIdle(byval h as Fl_Idle_Handler,byval pArg as any ptr = 0)
declare function Fl_HasIdle(byval h as Fl_Idle_Handler,byval pArg as any ptr = 0) as long
declare sub      Fl_RemoveIdle(byval h as Fl_Idle_Handler,byval pArg as any ptr = 0)
' will be removed use Fl_AddIdle() instead
declare sub      Fl_SetIdle(byval h as Fl_Old_Idle_Handler)

' Adds a one-shot timeout callback.
declare sub      Fl_AddTimeout   (byval t as double,byval h as Fl_Timeout_Handler,byval pArg as any ptr = 0)
declare function Fl_HasTimeout   (byval h as Fl_Timeout_Handler,byval pArg as any ptr = 0) as long
declare sub      Fl_RepeatTimeout(byval t as double,byval h as Fl_Timeout_Handler,byval pArg as any ptr = 0)
declare sub      Fl_RemoveTimeout(byval h as Fl_Timeout_Handler,byval pArg as any ptr = 0)

' For back compatibility, sets the void Fl_Fatal handler callback. 
declare sub      Fl_SetAbort(byval h as Fl_Abort_Handler)
' For back compatibility, sets the Fl_Atclose handler callback. 
declare sub      Fl_SetAtclose(byval h as Fl_Atclose_Handler)
' Default callback for window widgets.
declare sub      Fl_DefaultAtclose(byval win as Fl_Window ptr,byval pArg as any ptr)

' ##########
' # thread #
' ##########
' The method blocks the current thread until it can safely access FLTK widgets and data.
declare function Fl_Lock as long
' The method releases the lock that was set using the Fl_Lock() method. 
declare sub      Fl_Unlock
' The Fl_ThreadMessage() method returns the last message that was sent from a child by the Fl_Awake() method. 
declare function Fl_ThreadMessage as any ptr

' ################
' # message loop #
' ################
' Same as Fl_Wait2(0).
declare function Fl_Check as long
' This is similar to Fl_Check() except this does not call Fl_Flush() or any callbacks, 
' which is useful if your program is in a state where such callbacks are illegal. 
declare function Fl_Ready as long
' Waits until "something happens" and then returns.
' Call this repeatedly to "run" your program. You can also check what happened each time after this returns, 
' which is quite useful for managing program state.
' What this really does is call all idle callbacks, all elapsed timeouts, call Fl_Flush() to get the screen to update, 
' and then wait some time (zero if there are idle callbacks, the shortest of all pending timeouts, or infinity), 
' for any events from the user or any Fl_Add_fd() callbacks. It then handles the events and calls the callbacks and then returns.
declare function Fl_Wait as long
' Waits a maximum of time seconds. It can return much sooner if something happens.
declare function Fl_Wait2(byval timeout as double) as double
' As long as any windows are displayed this calls Fl_Wait() repeatedly. 
declare function Fl_Run as long

' ############
' # Fl Color #
' ############
' Makes FLTK use its own colormap.
declare sub      Fl_OwnColormap
declare sub      Fl_GetSystemColors
' Changes fl_color(FL_FOREGROUND_COLOR).
declare sub      Fl_Foreground(byval r as ubyte,byval g as ubyte,byval b as ubyte)
' Frees the specified color from the colormap, if applicable.
declare sub      Fl_FreeColor (byval i as Fl_Color,byval overlay as long=0)

' Returns the RGB values for the given FLTK color. 
declare sub      Fl_GetColor(byval i as Fl_Color,byref r as ubyte, byref g as ubyte, byref b as ubyte)
declare function Fl_GetColor2(byval i as Fl_Color) as ulong
' Sets an entry in the fl_color index table.
declare sub      Fl_SetColor (byval n as Fl_Color,byval c as ulong)
declare sub      Fl_SetColor2(byval n as Fl_Color,byval r as ubyte,byval g as ubyte,byval b as ubyte)

' Returns FL_COLOR value from rgb triples
declare function Fl_RGB_Color(byval r as ubyte,byval g as ubyte,byval b as ubyte) as Fl_Color
' Returns a gray FL_COLOR value
declare function Fl_Gray_Color(byval gray as ubyte) as Fl_Color
' Returns Fl_Color cube value from rgb triples
declare function Fl_Color_Cube(byval r as long,byval g as long,byval b as long) as Fl_Color

declare function Fl_Inactive(byval c as Fl_Color) as Fl_Color
declare function Fl_Contrast(byval fg as Fl_Color,byval bg as Fl_Color) as Fl_Color
declare function Fl_Color_Average(byval c1 as Fl_Color,byval c2 as Fl_Color,byval weight as single) as Fl_Color
' Changes fl_color(FL_BACKGROUND_COLOR) to the given color, and changes the gray ramp from 32 to 56 to black to white. 
declare sub      Fl_Background(byval r as ubyte,byval g as ubyte,byval b as ubyte)
' Changes the alternative background color. 
declare sub      Fl_Background2(byval r as ubyte,byval g as ubyte,byval b as ubyte)

' #######
' # box #
' #######
' Returns the offset's for the given boxtype. 
declare function Fl_BoxDX(byval bt as Fl_Boxtype) as long
declare function Fl_BoxDY(byval bt as Fl_Boxtype) as long
declare function Fl_BoxDW(byval bt as Fl_Boxtype) as long
declare function Fl_BoxDH(byval bt as Fl_Boxtype) as long

' Gets/Sets the current box drawing function for the specified box type. 
declare function Fl_GetBoxType(byval bt as Fl_Boxtype) as Fl_Box_Draw_F
declare sub      Fl_SetBoxType2(byval bt as Fl_Boxtype,byval f as Fl_Box_Draw_F,byval a as ubyte,byval b as ubyte,byval c as ubyte,byval d as ubyte)

' Determines if the current draw box is active or inactive.
' (If inactive, the box color is changed by the inactive color.)
declare function Fl_DrawBoxActive as long

' Copies the from boxtype. 
declare sub      Fl_SetBoxType(byval bt as Fl_Boxtype,byval from as Fl_Boxtype)


' ##########
' # widget #
' ##########
' Adds a widget pointer to the widget watch list.
declare sub      Fl_WatchWidgetPointer(byref widget as Fl_Widget ptr)
' Clears a widget pointer in the watch list.(Internal use only !)
declare sub      Fl_ClearWidgetPointer(byval wgt as const Fl_Widget ptr)
' Releases a widget pointer from the watch list.
declare sub      Fl_ReleaseWidgetPointer(byref widget as Fl_Widget ptr)
' Schedules a widget for deletion at the next call to the event loop.
' Use this method to delete a widget inside a callback function.
declare sub      Fl_DeleteWidget(byval wgt as Fl_Widget ptr)
' Deletes widgets previously scheduled for deletion. (This is for internal use only.)
declare sub      Fl_DoWidgetDeletion

' Sets/Gets the widget that is below the mouse.
declare sub      Fl_SetBelowmouse(byval widget as Fl_Widget ptr)
declare function Fl_GetBelowmouse() as Fl_Widget ptr

' Sets the widget that will receive FL_KEYBOARD events.
declare sub      Fl_SetFocus(byval wgt as Fl_Widget ptr)
' Gets the current widget with the focus.
declare function Fl_GetFocus as Fl_Widget ptr

' Gets/Sets the widget that is being pushed. 
declare function Fl_GetPushed as Fl_Widget ptr
declare sub      Fl_SetPushed(byval wgt as Fl_Widget ptr)

' Redraws all widgets.
declare sub      Fl_Redraw
' All Fl_Widgets that don't have a callback defined use a default callback that puts a pointer 
' to the widget in this queue, and this method reads the oldest widget out of this queue. 
declare function Fl_ReadQueue as Fl_Widget ptr

' ##########
' # window #
' ##########
' Causes all the windows that need it to be redrawn and graphics forced out through the pipes. 
declare sub      Fl_Flush
' Handle events from the window system. 
declare function Fl_Handle(byval event as Fl_Event,byval win as Fl_Window ptr) as long
declare function Fl_Handle_(byval event as Fl_Event,byval win as Fl_Window ptr) as long

' Returns the top-most modal() window currently shown. 
declare function Fl_Modal as Fl_Window ptr

' Returns the first top-level window in the list of shown() windows. 
declare function Fl_GetFirstWindow as Fl_Window ptr
' Sets the window that is returned by Fl_GetFirstWindow(). 
declare sub      Fl_SetFirstWindow(byval win as Fl_Window ptr)
' Returns the next top-level window in the list of shown() windows.
declare function Fl_NextWindow(byval win as const Fl_Window ptr) as Fl_Window ptr

' Returns the window that currently receives all events. 
declare function Fl_GetGrab as Fl_Window ptr
' Selects the window to grab.
declare sub      Fl_SetGrab(byval win as Fl_Window ptr)
' Releases the current grabbed window, equals Fl_SetGrab(0).
declare sub      Fl_Release


' #################
' # drag and drob #
' #################
' Initiate a Drag And Drop operation.
declare function Fl_Dnd as long
' Gets or sets whether drag and drop text operations are supported.
declare sub      Fl_SetDndTextOps(byval v as long)
declare function Fl_GetDndTextOps as long

' ###########################
' # clipboard and selection #
' ###########################
' Copies the data pointed to by stuff to the selection buffer (destination is 0) 
' or the clipboard (destination is 1). length is the number of relevant bytes in stuff. 
' type is always Fl_clipboard_plain_text. ("text/plain")

' The selection buffer is used for middle-mouse pastes and for drag-and-drop selections. 
' The clipboard is used for traditional copy/cut/paste operations.
declare sub      Fl_Copy(byval stuff as const zstring ptr,byval length as long,byval destination as long=0,byval stuffType as const zstring ptr=@Fl_clipboard_plain_text)
declare sub      Fl_Paste(byref receiver as Fl_Widget ptr,byval source as long, byval type_ as const zstring ptr = @Fl_clipboard_plain_text)
' Changes the current selection.
' The block of text is copied to an internal buffer by FLTK 
' (be careful if doing this in response to an FL_PASTE as this may be the same buffer returned by event_text()). 
' The selection_owner() widget is set to the passed owner. 
declare sub      Fl_Selection(byref owner as Fl_Widget ptr,byval text as const zstring ptr,byval size as long)
' Back-compatibility only: 
' The single-argument call can be used to move the selection to another widget 
' or to set the owner to NULL, without changing the actual text of the selection. 
declare sub      Fl_SetSelectionOwner(byval wgt as Fl_Widget ptr)
' back-compatibility only: 
' Gets the widget owning the current selection
declare function Fl_GetSelectionOwner as Fl_Widget ptr

' ###########
' # options #
' ###########
' FLTK library options management. see also http://www.fltk.org/doc-1.3/classFl.html#a43e6e0bbbc03cad134d928d4edd48d1d
declare function Fl_GetOption(byval opt as Fl_Option) as long
' Override an option while the application is running. 
declare sub      Fl_SetOption(byval opt as Fl_Option,byval value as long)


' #########
' # event #
' #########
' Returns the last event that was processed. 
declare function Fl_EventNumber as long
' Gets which particular mouse button caused the current event.
declare function Fl_EventButton as long
' Returns non-zero if mouse button 1,2 or 3 is currently held down.
declare function Fl_EventButton1 as long
declare function Fl_EventButton2 as long
declare function Fl_EventButton3 as long
' Returns the mouse buttons state bits if non-zero, then at least one button is pressed now.
declare function Fl_EventButtons as long

' Returns non zero if we had a double click event.
declare function Fl_GetEventClicks as long
' Manually sets the number returned by Fl_GetEventClicks(). 
declare sub      Fl_SetEventClicks(byval i as long)

' Set a new event dispatch function.
declare sub      Fl_SetEventDispatch(byval d as Fl_Event_Dispatch)
' Return the current event dispatch function.
declare function Fl_GetEventDispatch as Fl_Event_Dispatch

' Returns whether or not the mouse event is inside a given child widget.
declare function Fl_EventInside(byval wgt as const Fl_Widget ptr) as long
' Returns whether or not the mouse event is inside the given rectangle.
declare function Fl_EventInside2(byval x as long,byval y as long,byval w as long,byval h as long) as long

' Returns non-zero if the mouse has not moved far enough and not enough time has passed since 
' the last FL_PUSH or FL_KEYBOARD event for it to be considered a "drag" rather than a "click". 
declare function Fl_GetEventIsClick as long
' Clears the value returned by Fl_GetEventIsClick(). 
declare sub      Fl_SetEventIsClick(byval i as long)

' Gets which key on the keyboard was last pushed.
declare function Fl_EventKey as long
' Returns true if the given key was held down (or pressed) during the last event.
declare function Fl_EventKey2(byval key as long) as long
' Returns the keycode of the last key event, regardless of the NumLock state.
declare function Fl_EventOriginalKey as long

' Returns non-zero if the Alt,Ctrl,Shift or Command key is pressed. 
declare function Fl_EventAlt as long
declare function Fl_EventCtrl as long
declare function Fl_EventShift as long
declare function Fl_EventCommand as long ' ctrl or metha on Mac

' This is a bitfield of what shift states were on and what mouse buttons 
' were held down during the most recent event. 
declare function Fl_EventState as long
declare function Fl_EventState2(byval i as long) as long

' Returns the length of the text in Fl_EventText(). 
declare function Fl_EventLength as long
' Returns the text associated with the current event, including FL_EVENT_PASTE or FL_EVENT_DND_RELEASE events. 
declare function Fl_EventText as const zstring ptr

' Returns the mouse position of the event relative to the Fl_Window it was passed to.
declare function Fl_EventX as long
declare function Fl_EventY as long

' Returns the mouse position on the screen of the event.
declare function Fl_EventXRoot as long
declare function Fl_EventYRoot as long

' Returns the current horizontal / vertical mouse scrolling associated with the FL_MOUSEWHEEL event. 
declare function Fl_EventDX as long
declare function Fl_EventDY as long
' new
' During an FL_PASTE event of non-textual data, returns a pointer to the pasted data.
declare function Fl_EventClipboardData() as any ptr
' Returns the type of the pasted data during an FL_PASTE event.
' Fl_clipboard_plain_text ("text/plain") or Fl_clipboard_image ("image")
declare function Fl_EventClipboardType() as const zstring ptr

' Returns true if the given key is held down now.
declare function Fl_GetKey(byval key as long) as long
' Return where the mouse is on the screen by doing a round-trip query to the server. 
declare sub      Fl_GetMouse(byref x as long, byref y as long)

' ########
' # font #
' ########
' Gets the string for this face. 
declare function Fl_GetFont(byval f as Fl_Font) as const zstring ptr
' Get a human-readable string describing the family of this face.
' The long pointed to by attributes (if the pointer is not zero) is set to zero, FL_BOLD or FL_ITALIC or FL_BOLD | FL_ITALIC. 
' To locate a "family" of fonts, search forward and back for a set with non-zero attributes, 
' these faces along with the face with a zero attribute before them constitute a family. 
declare function Fl_GetFontName(byval f as Fl_Font,byval attributes as long ptr=0) as const zstring ptr
' Return an array of sizes in size.  A zero in the first location of the array indicates a scalable font, where any size works.
declare function Fl_GetFontSizes(byval f as Fl_Font, byref size as long ptr) as long
' The string pointer is simply stored, the string is not copied, so the string must be in static memory. 
declare sub      Fl_SetFont(byval f as Fl_Font,byval n as const zstring ptr)

' Copies one face to another. 
declare sub      Fl_SetFont2(byval f as Fl_Font,byval n as Fl_Font)

' FLTK will open the display, and add every fonts on the server to the face table. 
declare function Fl_SetFonts(byval n as const zstring ptr=0) as Fl_Font

' #################
' # look and feel #
' #################
' Called by scheme according to scheme name.
declare function Fl_ReloadScheme as long
'Gets or sets the current widget scheme. sheme can be "none","plastic", "gtk+" or "gleam" 
declare function Fl_SetScheme(byval scheme as const zstring ptr) as long
declare function Fl_GetScheme as const zstring ptr
' new
' Returns whether the current scheme is the given name. 
declare function Fl_IsScheme(byval scheme as const zstring ptr) as long

' Sets/Gets the default scrollbar size that is used by the Fl_Browser_, Fl_Help_View, Fl_Scroll, and Fl_Text_Display widgets. 
declare sub      Fl_SetScrollbarSize(byval size as long)
declare function Fl_GetScrollbarSize as long

' Sets the functions to call to draw and measure a specific labeltype. 
declare sub      Fl_SetLabeltype(byval labelType as FL_LABEL_TYPE,byval drawFunc as Fl_Label_Draw_F,byval measureFunc as Fl_Label_Measure_F)


' log
type MessageFunc as sub(byval msg as const zstring ptr,...)
' overwrite Fl::warning()
declare sub      Fl_SetWarningMessageFunc(byval func as MessageFunc)
' overwrite Fl::error()
declare sub      Fl_SetErroreMessageFunc(byval func as MessageFunc)
' overwrite Fl::fatal()
declare sub      Fl_SetFatalMessageFunc(byval func as MessageFunc)
' FLTK calls Fl::warning() to output a warning message. 
declare sub      Fl_WarningMessage(byval msg as const zstring ptr)
' FLTK calls Fl::error() to output a normal error message. 
declare sub      Fl_ErrorMessage(byval msg as const zstring ptr)
' FLTK calls Fl::fatal() to output a fatal error message.
declare sub      Fl_FatalMessage(byval msg as const zstring ptr)


' misc

' Tests the current event, which must be an FL_KEYBOARD or FL_SHORTCUT, against a shortcut value (described in Fl_Button).
declare function Fl_TestShortcut(byval s as Fl_Shortcut) as long
' Returns the compiled-in value of the FL_VERSION constant. 
declare function Fl_Version as double
'Gets or sets the visible keyboard focus on buttons and other non-text widgets. 
declare sub      Fl_SetVisibleFocus(byval v as long)
declare function Fl_GetVisibleFocus as long

' Selects a visual so that your graphics are drawn correctly. 
declare function Fl_Visual(byval v as long) as long

' misc
' Any text editing widget should call this for each FL_KEYBOARD event. 
declare function Fl_Compose(byref del as long) as long
' If the user moves the cursor, be sure to call Fl_ComposeReset. 
declare sub      Fl_ComposeReset

' If true then Fl_Flush() will do something. 
declare sub      Fl_SetDamage(byval b as long)
declare function Fl_GetDamage as long

' Sets the display to use for all windows. 
declare sub      Fl_Display(byval display as const zstring ptr)

' ##########
' # screen #
' ##########
declare function Fl_GetX as long
declare function Fl_GetY as long
declare function Fl_GetW as long
declare function Fl_GetH as long

declare function Fl_ScreenX      alias "Fl_GetX" as long
declare function Fl_ScreenY      alias "Fl_GetX" as long
declare function Fl_ScreenWidth  alias "Fl_GetW" as long
declare function Fl_ScreenHeight alias "Fl_GetH" as long

declare function Fl_ScreenCount as long
declare sub      Fl_ScreenDpi(byref w as single, byref h as single,byval  screenIndex as long=0)
declare sub      Fl_ScreenWorkAreaXYWH(byref x as long, byref Y as long, byref w as long, byref h as long)
declare sub      Fl_ScreenWorkAreaXYWHN(byref x as long, byref Y as long, byref w as long, byref h as long,byval screenIndex as long)
declare sub      Fl_ScreenWorkAreaXYWHMXMY(byref x as long, byref Y as long, byref w as long, byref h as long,byval mx as long,byval my as long)
declare sub      Fl_ScreenXYWH(byref x as long, byref Y as long, byref w as long, byref h as long)
declare sub      Fl_ScreenXYWHN (byref x as long, byref Y as long, byref w as long, byref h as long,byval screenIndex as long)
declare sub      Fl_ScreenXYWHMXMY(byref x as long, byref Y as long, byref w as long, byref h as long,byval mx as long,byval my as long)
declare sub      Fl_ScreenXYWHMXMYMWMH(byref x as long, byref Y as long, byref w as long, byref h as long,byval mx as long,byval my as long,byval mw as long,byval mh as long)

' ###################
' # class Fl_Widget #
' ###################
' De/Activates the widget. 
declare sub      Fl_WidgetActivate(byval wgt as Fl_Widget ptr)
declare sub      Fl_WidgetDeactivate(byval wgt as Fl_Widget ptr)
' Returns whether the widget is active
declare function Fl_WidgetActive(byval wgt as Fl_Widget ptr) as long
' Returns whether the widget and all of its parents are active. 
declare function Fl_WidgetActiveR(byval wgt as Fl_Widget ptr) as long

' Sets/Gets the label alignment. 
declare sub      Fl_WidgetSetAlign(byval wgt as Fl_Widget ptr,byval align as Fl_Align)
declare function Fl_WidgetGetAlign(byval wgt as Fl_Widget ptr) as Fl_Align

' Sets/Gets the current user data (long) argument that is passed to the callback function. 
declare sub      Fl_WidgetSetArgument(byval wgt as Fl_Widget ptr,byval lArg as long)
declare function Fl_WidgetGetArgument(byval wgt as Fl_Widget ptr) as long

' Returns an Fl_Group pointer if this widget is an Fl_Group
declare function Fl_WidgetAsGroup(byval wgt as Fl_Widget ptr) as Fl_Group ptr
' Returns an Fl_Window pointer if this widget is an Fl_Window
declare function Fl_WidgetAsWindow(byval wgt as Fl_Widget ptr) as Fl_Window ptr
' Returns an Fl_Gl_Window pointer if this widget is an Fl_Gl_Window
declare function Fl_WidgetAsGL_Window(byval wgt as Fl_Widget ptr) as Fl_GL_Window ptr

' Gets/Sets the box type of the widget.
declare function Fl_WidgetGetBox(byval wgt as Fl_Widget ptr) as Fl_Boxtype
declare sub      Fl_WidgetSetBox(byval wgt as Fl_Widget ptr,byval bt as Fl_Boxtype)

declare sub      Fl_WidgetSetCallback    (byval wgt as Fl_Widget ptr,byval cb as Fl_Callback)
declare sub      Fl_WidgetSetCallbackArg (byval wgt as Fl_Widget ptr,byval cb as Fl_Callback,byval arg as any ptr)
declare sub      Fl_WidgetSetCallback0   (byval wgt as Fl_Widget ptr,byval cb as Fl_Callback0)
declare sub      Fl_WidgetSetCallback1Arg(byval wgt as Fl_Widget ptr,byval cb as Fl_Callback1,byval arg as long)
declare function Fl_WidgetGetCallback    (byval wgt as Fl_Widget ptr) as Fl_Callback_p

' Checks if the widget value changed since the last callback.
declare function Fl_WidgetChanged(byval wgt as Fl_Widget ptr) as ulong

declare sub      Fl_WidgetSetChanged(byval wgt as Fl_Widget ptr)
declare sub      Fl_WidgetClearChanged(byval wgt as Fl_Widget ptr)

declare sub      Fl_WidgetSetOutput(byval wgt as Fl_Widget ptr)
declare sub      Fl_WidgetClearOutput(byval wgt as Fl_Widget ptr)
declare function Fl_WidgetOutput(byval wgt as Fl_Widget ptr) as ulong

declare sub      Fl_WidgetSetVisible(byval wgt as Fl_Widget ptr)
declare sub      Fl_WidgetClearVisible(byval wgt as Fl_Widget ptr)

declare sub      Fl_WidgetSetVisibleFocus(byval wgt as Fl_Widget ptr)
declare sub      Fl_WidgetClearVisibleFocus(byval wgt as Fl_Widget ptr)

declare sub      Fl_WidgetSetColor(byval wgt as Fl_Widget ptr,byval bg as Fl_Color)
declare sub      Fl_WidgetSetColorSel(byval wgt as Fl_Widget ptr,byval bg as Fl_Color,byval sel as Fl_Color)
declare function Fl_WidgetGetColor(byval wgt as Fl_Widget ptr) as Fl_Color

declare sub      Fl_WidgetSetSelectionColor(byval wgt as Fl_Widget ptr,byval c as Fl_Color)
declare function Fl_WidgetGetSelectionColor(byval wgt as Fl_Widget ptr) as Fl_Color

' will be removed use Set/GetSelectionColor in new apps.
declare sub      Fl_WidgetSetColor2(byval wgt as Fl_Widget ptr,byval c as Fl_Color)
declare function Fl_WidgetGetColor2(byval wgt as Fl_Widget ptr) as Fl_Color
' 
declare function Fl_WidgetContains(byval wgt as Fl_Widget ptr,byval other as const Fl_Widget ptr) as long

declare sub      Fl_WidgetCopyLabel(byval wgt as Fl_Widget ptr,byval caption as const zstring ptr)
declare sub      Fl_WidgetCopyTooltip(byval wgt as Fl_Widget ptr,byval tip as const zstring ptr)

' Sets the damage bits for the widget.
declare sub      Fl_WidgetSetDamage(byval wgt as Fl_Widget ptr,byval c as ubyte)
' Sets the damage bits for an area inside the widget.
declare sub      Fl_WidgetSetDamage2(byval wgt as Fl_Widget ptr,byval c as ubyte,byval x as long,byval y as long,byval w as long,byval h as long)
' Returns non-zero if draw() needs to be called. 
declare function Fl_WidgetGetDamage(byval wgt as Fl_Widget ptr) as ubyte

' Clears or sets the damage flags.
declare sub      Fl_WidgetClearDamage(byval wgt as Fl_Widget ptr,byval c as ubyte=0)
' Internal use only.
declare function Fl_WidgetDamageResize(byval wgt as Fl_Widget ptr,byval x as long,byval y as long,byval w as long,byval h as long) as long

' Gets/Sets the image that is used as part of the widget label.
declare function Fl_WidgetGetDeimage(byval wgt as Fl_Widget ptr) as Fl_Image ptr
declare sub      Fl_WidgetSetDeimage(byval wgt as Fl_Widget ptr,byval img as Fl_Image ptr)

' Calls the widget callback.
declare sub      Fl_WidgetDoCallback(byval wgt as Fl_Widget ptr)
declare sub      Fl_WidgetDoCallback2(byval wgt as Fl_Widget ptr,byval other as Fl_Widget ptr,byval pArg as any ptr=0)
declare sub      Fl_WidgetDoCallback3(byval wgt as Fl_Widget ptr,byval other as Fl_Widget ptr,byval lArg as long)

' Draws the widget. 
declare sub      Fl_WidgetDraw(byval wgt as Fl_Widget ptr)
' Draws the label in an arbitrary bounding box with an arbitrary alignment.
declare sub      Fl_WidgetDrawLabel(byval wgt as Fl_Widget ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval align as Fl_Align)
' Handles the specified event.
declare function Fl_WidgetHandle(byval wgt as Fl_Widget ptr,byval event as Fl_Event) as long

' Makes a widget in/visible. 
declare sub      Fl_WidgetHide(byval wgt as Fl_Widget ptr)
declare sub      Fl_WidgetShow(byval wgt as Fl_Widget ptr)

' Gets/Sets the image that is used as part of the widget label. 
declare sub      Fl_WidgetSetImage(byval wgt as Fl_Widget ptr,byval img as Fl_Image ptr)
declare function Fl_WidgetGetImage(byval wgt as Fl_Widget ptr) as Fl_Image ptr
declare function Fl_WidgetGetImage2(byval wgt as Fl_Widget ptr) as const Fl_Image ptr

' Checks if this widget is a child of wgt.
declare function Fl_WidgetInside(byval wgt as Fl_Widget ptr,byval other as const Fl_Widget) as long

' Gets/Sets the current label text.' 
declare function Fl_WidgetGetLabel(byval wgt as Fl_Widget ptr) as const zstring ptr
declare sub      Fl_WidgetSetLabel(byval wgt as Fl_Widget ptr,byval text as const zstring ptr)
declare sub      Fl_WidgetSetLabel2(byval wgt as Fl_Widget ptr,byval a as FL_LABEL_TYPE,byval text as const zstring ptr)

' Gets/Sets the label color. 
declare sub      Fl_WidgetSetLabelColor(byval wgt as Fl_Widget ptr,byval c as Fl_Color)
declare function Fl_WidgetGetLabelColor(byval wgt as Fl_Widget ptr) as Fl_Color
' Gets/Sets the label font. 
declare sub      Fl_WidgetSetLabelFont(byval wgt as Fl_Widget ptr,byval f as Fl_Font)
declare function Fl_WidgetGetLabelFont(byval wgt as Fl_Widget ptr) as Fl_Font
' Gets/Sets the label fonstsize. 
declare sub      Fl_WidgetSetLabelSize(byval wgt as Fl_Widget ptr,byval fz as FL_FONTSIZE)
declare function Fl_WidgetGetLabelSize(byval wgt as Fl_Widget ptr) as FL_FONTSIZE
' Gets/Sets the label type.
declare function Fl_WidgetGetLabelType(byval wgt as Fl_Widget ptr) as FL_LABEL_TYPE
declare sub      Fl_WidgetSetLabelType(byval wgt as Fl_Widget ptr,byval lt as FL_LABEL_TYPE)
' Returns w,h accordingly with the label size. 
declare sub      Fl_WidgetMeasureLabel(byval wgt as Fl_Widget ptr, byref w as long, byref h as long)

' Returns a pointer to the parent widget.
declare function Fl_WidgetGetParent(byval wgt as Fl_Widget ptr) as Fl_Group ptr
' Internal use only - "for hacks only"
declare sub      Fl_WidgetSetParent(byval wgt as Fl_Widget ptr,byval p as Fl_Group ptr)

' Repositions the window or widget.
declare sub      Fl_WidgetPosition(byval wgt as Fl_Widget ptr,byval x as long,byval y as long)
' Changes the size of the widget.
declare sub      Fl_WidgetSize(byval wgt as Fl_Widget ptr,byval w as long,byval h as long)
' Changes the size and position of the widget.
declare sub      Fl_WidgetResize(byval wgt as Fl_Widget ptr,byval x as long,byval y as long,byval w as long,byval h as long)

' Schedules the drawing of the widget.
declare sub      Fl_WidgetRedraw(byval wgt as Fl_Widget ptr)
' Schedules the drawing of the label.
declare sub      Fl_WidgetRedrawLabel(byval wgt as Fl_Widget ptr)

' Gives the widget the keyboard focus.
declare function Fl_WidgetTakeFocus(byval wgt as Fl_Widget ptr) as long
' Returns if the widget is able to take events.
declare function Fl_WidgetTakesEvents(byval wgt as Fl_Widget ptr) as ulong
' Returns true if the widget's label contains the entered '&x' shortcut.
declare function Fl_WidgetTestShortcut(byval wgt as Fl_Widget ptr) as long

' Gets/Sets the current tooltip text.
declare function Fl_WidgetGetTooltip(byval wgt as Fl_Widget ptr) as const zstring ptr
declare sub      Fl_WidgetSetTooltip(byval wgt as Fl_Widget ptr,byval text as const zstring ptr)

' Gets/Sets the widget type. 
declare function Fl_WidgetGetType(byval wgt as Fl_Widget ptr) as ubyte
declare sub      Fl_WidgetSetType(byval wgt as Fl_Widget ptr,byval t as ubyte)

' Gets/Sets the user data for this widget.
declare function Fl_WidgetGetUserData(byval wgt as Fl_Widget ptr) as any ptr
declare sub      Fl_WidgetSetUserData(byval wgt as Fl_Widget ptr,byval v as any ptr)

' Returns whether a widget is visible. 
declare function Fl_WidgetVisible(byval wgt as Fl_Widget ptr) as long
' Returns whether a widget and all its parents are visible.
declare function Fl_WidgetVisibleR(byval wgt as Fl_Widget ptr) as long

' Checks whether this widget has a visible focus. 
declare function Fl_WidgetGetVisibleFocus(byval wgt as Fl_Widget ptr) as long
' Modifies keyboard focus navigation.
declare sub      Fl_WidgetVisibleFocus(byval wgt as Fl_Widget ptr,byval v as long)

' Sets the flags used to decide when a callback is called. 
declare sub      Fl_WidgetSetWhen(byval wgt as Fl_Widget ptr,byval w as FL_WHEN)
' Returns the conditions under which the callback is called.
declare function Fl_WidgetGetWhen(byval wgt as Fl_Widget ptr) as FL_WHEN

' Returns a pointer to the nearest parent window up the widget hierarchy.
declare function Fl_WidgetWindow(byval wgt as Fl_Widget ptr) as Fl_Window ptr
declare function Fl_WidgetTopWindow(byval wgt as Fl_Widget ptr) as Fl_Window ptr
declare function Fl_WidgetTopWindowOffset(byval wgt as Fl_Widget ptr,byref xoff as long,byref yoff as long) as Fl_Window ptr

declare function Fl_WidgetGetX(byval wgt as Fl_Widget ptr) as long
declare function Fl_WidgetGetY(byval wgt as Fl_Widget ptr) as long
declare function Fl_WidgetGetW(byval wgt as Fl_Widget ptr) as long
declare function Fl_WidgetGetH(byval wgt as Fl_Widget ptr) as long

declare sub      Fl_WidgetDefaultCallback(byval cb as Fl_Widget ptr,byval pArg as any ptr)
' static members
declare function Fl_WidgetLabelShortcut(byval t as const zstring ptr) as long
declare function Fl_WidgetTestShortcut2(byval t as const zstring ptr,byval require_alt as long=0) as long

' ###########################
' # class Fl_Widget_Tracker #
' ###########################
declare function Fl_Widget_TrackerNew(byval wgt as Fl_Widget ptr) as Fl_Widget_Tracker ptr
declare sub      Fl_Widget_TrackerDelete (byref wt as Fl_Widget_Tracker ptr) 
declare function Fl_Widget_TrackerDeleted(byval wt as Fl_Widget_Tracker ptr) as long
declare function Fl_Widget_TrackerExists (byval wt as Fl_Widget_Tracker ptr) as long
declare function Fl_Widget_TrackerWidget (byval wt as Fl_Widget_Tracker ptr) as Fl_Widget ptr

'#######################################
'# class Fl_WidgetEx extends Fl_Widget #
'#######################################
declare function Fl_WidgetExNew(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_WidgetEx ptr
declare sub      Fl_WidgetExDelete         (byref ex as Fl_WidgetEx ptr)
declare function Fl_WidgetExHandleBase     (byval ex as Fl_WidgetEx ptr,byval event as Fl_Event) as long
declare sub      Fl_WidgetExSetDestructorCB(byval ex as Fl_WidgetEx ptr,byval cb as Fl_DestructorEx)
declare sub      Fl_WidgetExSetDrawCB      (byval ex as Fl_WidgetEx ptr,byval cb as Fl_DrawEx)
declare sub      Fl_WidgetExSetHandleCB    (byval ex as Fl_WidgetEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_WidgetExSetResizeCB    (byval ex as Fl_WidgetEx ptr,byval cb as Fl_ResizeEx)

#ifndef NO_BOX
'##################################
'# class Fl_Box extends Fl_Widget #
'##################################
' convert numeric boxtype 0-55 to Fl_Boxtype
declare function BoxType(byval nType as long) as Fl_Boxtype

DeclareEx(Fl_Box)
declare function Fl_BoxNew (byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Box ptr
declare sub      Fl_BoxDelete(byref box as Fl_Box ptr)
declare function Fl_BoxNew2(byval bt as Fl_Boxtype,byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Box ptr
declare function Fl_BoxHandle(byval box as Fl_Box ptr,byval e as Fl_Event) as long
#endif

#ifndef NO_CANVAS
'##################################
'# class Fl_Canvas extends Fl_Box #
'##################################
declare function Fl_CanvasNew(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Canvas ptr
declare sub      Fl_CanvasDelete         (byref can as Fl_Canvas ptr)
declare function Fl_CanvasHandleBase     (byval can as Fl_Canvas ptr,byval event as Fl_Event) as long
declare sub      Fl_CanvasSetDestructorCB(byval can as Fl_Canvas ptr,byval cb as Fl_DestructorEx)
declare sub      Fl_CanvasSetDrawCB      (byval can as Fl_Canvas ptr,byval cb as Fl_CanvasDraw)
declare sub      Fl_CanvasSetHandleCB    (byval can as Fl_Canvas ptr,byval cb as Fl_HandleEx)
declare sub      Fl_CanvasSetResizeCB    (byval can as Fl_Canvas ptr,byval cb as Fl_ResizeEx)
#endif ' NO_CANVAS

#ifndef NO_BUTTON
'#####################################
'# class Fl_Button extends Fl_Widget #
'#####################################
DeclareEx(Fl_Button)
declare function Fl_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Button ptr
declare sub      Fl_ButtonDelete(byref btn as Fl_Button ptr)
declare function Fl_ButtonClear(byval btn as Fl_Button ptr) as long

declare sub      Fl_ButtonSetDownBox(byval btn as Fl_Button ptr,byval bt as Fl_Boxtype)
declare function Fl_ButtonGetDownBox(byval btn as Fl_Button ptr) as Fl_Boxtype

declare sub      Fl_ButtonSetDownColor(byval btn as Fl_Button ptr,byval c as Fl_Color)
declare function Fl_ButtonGetDownColor(byval btn as Fl_Button ptr) as Fl_Color

declare function Fl_ButtonHandle(byval btn as Fl_Button ptr,byval event as Fl_Event) as long

declare function Fl_ButtonSet(byval btn as Fl_Button ptr) as long

declare sub      Fl_ButtonSetOnly(byval btn as Fl_Button ptr)

declare sub      Fl_ButtonSetShortcut(byval btn as Fl_Button ptr,byval s as long)
declare function Fl_ButtonGetShortcut(byval btn as Fl_Button ptr) as long

declare function Fl_ButtonSetValue(byval btn as Fl_Button ptr,byval v as long) as long
declare function Fl_ButtonGetValue(byval btn as Fl_Button ptr) as long

'###########################################
'# class Fl_Radio_Button extends Fl_Button #
'###########################################
DeclareEx(Fl_Radio_Button)
declare function Fl_Radio_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Radio_Button ptr
declare sub      Fl_Radio_ButtonDelete(byref btn as Fl_Radio_Button ptr)
'############################################
'# class Fl_Repeat_Button extends Fl_Button #
'############################################
DeclareEx(Fl_Repeat_Button)
declare function Fl_Repeat_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Repeat_Button ptr
declare sub      Fl_Repeat_ButtonDelete(byref btn as Fl_Repeat_Button ptr)
declare function Fl_Repeat_ButtonHandle(byval btn as Fl_Repeat_Button ptr,byval ev as Fl_Event) as long
declare sub      Fl_Repeat_ButtonDeactivate(byval btn as Fl_Repeat_Button ptr)

'############################################
'# class Fl_Return_Button extends Fl_Button #
'############################################
DeclareEx(Fl_Return_Button)
declare function Fl_Return_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Return_Button ptr
declare sub      Fl_Return_ButtonDelete(byref btn as Fl_Return_Button ptr)
declare function Fl_Return_ButtonHandle(byval btn as Fl_Return_Button ptr,byval ev as Fl_Event) as long

'############################################
'# class Fl_Toggle_Button extends Fl_Button #
'############################################
DeclareEx(Fl_Toggle_Button)
declare function Fl_Toggle_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Toggle_Button  ptr
declare sub      Fl_Toggle_ButtonDelete(byref btn as Fl_Toggle_Button ptr)
'###########################################
'# class Fl_Light_Button extends Fl_Button #
'###########################################
DeclareEx(Fl_Light_Button)
declare function Fl_Light_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Light_Button  ptr
declare sub      Fl_Light_ButtonDelete(byref btn as Fl_Light_Button ptr)
declare function Fl_Light_ButtonHandle(byval btn as Fl_Light_Button ptr,byval ev as Fl_Event) as long

'#################################################
'# class Fl_Check_Button extends Fl_Light_Button #
'#################################################
DeclareEx(Fl_Check_Button)
declare function Fl_Check_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Check_Button ptr
declare sub      Fl_Check_ButtonDelete(byref btn as Fl_Check_Button ptr)
'#######################################################
'# class Fl_Radio_Light_Button extends Fl_Light_Button #
'#######################################################
DeclareEx(Fl_Radio_Light_Button)
declare function Fl_Radio_Light_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Radio_Light_Button ptr
declare sub      Fl_Radio_Light_ButtonDelete(byref btn as Fl_Radio_Light_Button ptr)
'#################################################
'# class Fl_Round_Button extends Fl_Light_Button #
'#################################################
DeclareEx(Fl_Round_Button)
declare function Fl_Round_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Round_Button ptr
declare sub      Fl_Round_ButtonDelete(byref btn as Fl_Round_Button ptr)
'#######################################################
'# class Fl_Radio_Round_Button extends Fl_Round_Button #
'#######################################################
DeclareEx(Fl_Radio_Round_Button)
declare function Fl_Radio_Round_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Radio_Round_Button ptr
declare sub      Fl_Radio_Round_ButtonDelete(byref btn as Fl_Radio_Round_Button ptr)
#endif ' NO_BUTTON

#ifndef NO_CHART
'####################################
'# class Fl_Chart extends Fl_Widget #
'####################################
DeclareEx(Fl_Chart)
declare function Fl_ChartNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Chart ptr
declare sub      Fl_ChartDelete(byref ch as Fl_Chart ptr)
declare sub      Fl_ChartAdd(byval ch as Fl_Chart ptr,byval v as double,byval label as const zstring ptr=0,byval c as Fl_Color=0)

declare sub      Fl_ChartSetAutoSize(byval ch as Fl_Chart ptr,byval n as long)
declare function Fl_ChartGetAutoSize(byval ch as Fl_Chart ptr) as long

declare sub      Fl_ChartSetBounds(byval ch as Fl_Chart ptr,byval a as double,byval b as double)
declare sub      Fl_ChartGetBounds(byval ch as Fl_Chart ptr,byref a as double,byref b as double)

declare sub      Fl_ChartClear(byval ch as Fl_Chart ptr)
declare sub      Fl_ChartInsert(byval ch as Fl_Chart ptr,byval ind as long,byval v as double,byval label as const zstring ptr=0,byval c as Fl_Color=0)

declare sub      Fl_ChartSetMaxSize(byval ch as Fl_Chart ptr,byval m as long)
declare function Fl_ChartGetMaxSize(byval ch as Fl_Chart ptr) as long

declare sub      Fl_ChartReplace(byval ch as Fl_Chart ptr,byval ind as long,byval v as double,byval vlabel as const zstring ptr=0,byval c as Fl_Color=0)

declare sub      Fl_ChartSetSize(byval ch as Fl_Chart ptr,byval w as long,byval h as long)

declare function Fl_ChartGetSize(byval ch as Fl_Chart ptr) as long

declare sub      Fl_ChartSetTextColor(byval ch as Fl_Chart ptr,byval c as Fl_Color)
declare function Fl_ChartGetTextColor(byval ch as Fl_Chart ptr) as Fl_Color

declare sub      Fl_ChartSetTextFont(byval ch as Fl_Chart ptr,byval f as Fl_Font)
declare function Fl_ChartGetTextFont(byval ch as Fl_Chart ptr) as Fl_Font

declare sub      Fl_ChartSetTextSize(byval ch as Fl_Chart ptr,byval s as FL_FONTSIZE)
declare function Fl_ChartGetTextSize(byval ch as Fl_Chart ptr) as FL_FONTSIZE
#endif ' NO_CHART

#ifndef NO_CLOCK
'###########################################
'# class Fl_Clock_Output extends Fl_Widget #
'###########################################
DeclareEx(Fl_Clock_Output)
declare function Fl_Clock_OutputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Clock_Output ptr
declare sub      Fl_Clock_OutputDelete  (byref co as Fl_Clock_Output ptr)
declare function Fl_Clock_OutputHour    (byval co as Fl_Clock_Output ptr) as long
declare function Fl_Clock_OutputMinute  (byval co as Fl_Clock_Output ptr) as long
declare function Fl_Clock_OutputSecond  (byval co as Fl_Clock_Output ptr) as long
declare sub      Fl_Clock_OutputValue   (byval co as Fl_Clock_Output ptr,byval h as long,byval m as long,byval s as long)
declare sub      Fl_Clock_OutputSetValue(byval co as Fl_Clock_Output ptr,byval v as ulong)
declare function Fl_Clock_OutputGetValue(byval co as Fl_Clock_Output ptr) as ulong

'##########################################
'# class Fl_Clock extends Fl_Clock_Output #
'##########################################
DeclareEx(Fl_Clock)
declare function Fl_ClockNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Clock ptr
declare function Fl_ClockNew2(byval boxtype as ubyte,byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Clock ptr
declare sub      Fl_ClockDelete(byref c as Fl_Clock ptr)

'#########################################
'# class Fl_Round_Clock extends Fl_Clock #
'#########################################
DeclareEx(Fl_Round_Clock)
declare function Fl_Round_ClockNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Round_Clock ptr
declare sub      Fl_Round_ClockDelete(byref c as Fl_Round_Clock ptr)
#endif ' NO_CLOCK

#ifndef NO_INPUT
'#####################################
'# class Fl_Input_ extends Fl_Widget #
'#####################################
' Changes the widget text.
declare function Fl_Input_StaticValue(byval ip_ as Fl_Input_ ptr,byval text as const zstring ptr) as long
declare function Fl_Input_StaticValue2(byval ip_ as Fl_Input_ ptr,byval text as const zstring ptr,byval nChars as long) as long
declare function Fl_Input_SetValue(byval ip_ as Fl_Input_ ptr,byval text as const zstring ptr) as long
declare function Fl_Input_SetValue2(byval ip_ as Fl_Input_ ptr,byval  text as const zstring ptr,byval nChars as long) as long
' Returns the widget text.
declare function Fl_Input_GetValue(byval ip_ as Fl_Input_ ptr) as const zstring ptr

' Inserts text at the cursor position.
declare function Fl_Input_Insert(byval ip_ as Fl_Input_ ptr,byval text as const zstring ptr,byval cpos as long=0) as long

' Deletes text from begin to end and inserts the new string text.
declare function Fl_Input_Replace(byval ip_ as Fl_Input_ ptr,byval begin as long,byval end_ as long,byval text as const zstring ptr,byval nChars as long=0) as long
' Returns the number of bytes in value
declare function Fl_Input_GetSize(byval ip_ as Fl_Input_ ptr) as long
' Returns the character at index i
declare function Fl_Input_Index(byval ip_ as Fl_Input_ ptr,byval i as long) as Fl_Char

' Put the current selection into the clipboard.
declare function Fl_Input_Copy(byval ip_ as Fl_Input_ ptr,byval clipboard as long) as long
' Copies the yank buffer to the clipboard.
declare function Fl_Input_CopyCuts(byval ip_ as Fl_Input_ ptr) as long

' Deletes the current selection.
declare function Fl_Input_Cut(byval ip_ as Fl_Input_ ptr) as long
' Deletes the next n bytes rounded to characters before or after the cursor.
declare function Fl_Input_Cut1(byval ip_ as Fl_Input_ ptr,byval n as long) as long
' Deletes all characters between index a and b.
declare function Fl_Input_Cut2(byval ip_ as Fl_Input_ ptr,byval a as long,byval b as long) as long

declare function Fl_Input_Undo(byval ip_ as Fl_Input_ ptr) as long

' Sets/Gets the input field type.
declare sub      Fl_Input_SetInputType(byval ip_ as Fl_Input_ ptr,byval typ as FL_INPUT_TYPE)
declare function Fl_Input_GetInputType(byval ip_ as Fl_Input_ ptr) as FL_INPUT_TYPE

' Sets/Gets the color of the cursor.
declare sub      Fl_Input_SetCursorColor(byval ip_ as Fl_Input_ ptr,byval c as Fl_Color)
declare function Fl_Input_GetCursorColor(byval ip_ as Fl_Input_ ptr) as Fl_Color

' Sets/Gets the current selection mark.
declare function Fl_Input_SetMark(byval ip_ as Fl_Input_ ptr,byval m as long) as long
declare function Fl_Input_GetMark(byval ip_ as Fl_Input_ ptr) as long

' Sets/Gets the maximum length of the input field in characters.
declare sub      Fl_Input_SetMaximumSize(byval ip_ as Fl_Input_ ptr,byval maxsize as long)
declare function Fl_Input_GetMaximumSize(byval ip_ as Fl_Input_ ptr) as long

' Sets the cursor position and mark.
declare function Fl_Input_SetPosition(byval ip_ as Fl_Input_ ptr,byval p as long) as long
' Sets the index for the cursor and mark.
declare function Fl_Input_SetPosition2(byval ip_ as Fl_Input_ ptr,byval p as long,byval m as long) as long
' Gets the position of the text cursor. 
declare function Fl_Input_GetPosition(byval ip_ as Fl_Input_ ptr) as long

' Sets/Gets the read-only state of the input field. 
declare sub      Fl_Input_SetReadonly(byval ip_ as Fl_Input_ ptr,byval readonly as long)
declare function Fl_Input_GetReadonly(byval ip_ as Fl_Input_ ptr) as long

' Sets/Gets the shortcut key associated with this widget.
declare sub      Fl_Input_SetShortcut(byval ip_ as Fl_Input_ ptr,byval shortcut as long)
declare function Fl_Input_GetShortcut(byval ip_ as Fl_Input_ ptr) as long

' Changes the position and size of the widget.
declare sub      Fl_Input_Resize(byval ip_ as Fl_Input_ ptr,byval x as long,byval y as long,byval w as long,byval h as long)
' Changes the size of the widget.
declare sub      Fl_Input_SetSize(byval ip_ as Fl_Input_ ptr,byval w as long,byval h as long)

' Sets/Gets whether the Tab key causes focus navigation in multiline input fields or not.
declare sub      Fl_Input_SetTabNav(byval ip_ as Fl_Input_ ptr,byval v as long)
declare function Fl_Input_GetTabNav(byval ip_ as Fl_Input_ ptr) as long

' Sets/Gets the color of the text in the input field. 
declare sub      Fl_Input_SetTextColor(byval ip_ as Fl_Input_ ptr,byval c as Fl_Color)
declare function Fl_Input_GetTextColor(byval ip_ as Fl_Input_ ptr) as Fl_Color

' Sets/Gets the font of the text in the input field.
declare sub      Fl_Input_SetTextFont(byval ip_ as Fl_Input_ ptr,byval f as Fl_Font)
declare function Fl_Input_GetTextFont(byval ip_ as Fl_Input_ ptr) as Fl_Font

' Sets/Gets the size of the text in the input field.
declare sub      Fl_Input_SetTextSize(byval ip_ as Fl_Input_ ptr,byval s as FL_FONTSIZE)
declare function Fl_Input_GetTextSize(byval ip_ as Fl_Input_ ptr) as FL_FONTSIZE

' Sets/Gets the word wrapping state of the input field. 
declare sub      Fl_Input_SetWrap(byval ip_ as Fl_Input_ ptr,byval wrap as long)
declare function Fl_Input_GetWrap(byval ip_ as Fl_Input_ ptr) as long

'####################################
'# class Fl_Input extends Fl_Input_ #
'####################################
DeclareEx(Fl_Input)
' Creates a new Fl_Input widget using the given position, size, and label string.
declare function Fl_InputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Input ptr
declare sub      Fl_InputDelete(byref ip as Fl_Input ptr)
' Handles the specified event.
declare function Fl_InputHandle(byval ip as Fl_Input ptr,byval event as Fl_Event) as long

'#########################################
'# class Fl_Float_Input extends Fl_Input #
'#########################################
DeclareEx(Fl_Float_Input)
declare function Fl_Float_InputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Float_Input ptr
declare sub      Fl_Float_InputDelete(byref fip as Fl_Float_Input ptr)
'#######################################
'# class Fl_Int_Input extends Fl_Input #
'#######################################
DeclareEx(Fl_Int_Input)
declare function Fl_Int_InputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Int_Input ptr
declare sub      Fl_Int_InputDelete(byref iip as Fl_Int_Input ptr)
'#############################################
'# class Fl_Multiline_Input extends Fl_Input #
'#############################################
DeclareEx(Fl_Multiline_Input)
declare function Fl_Multiline_InputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Multiline_Input ptr
declare sub      Fl_Multiline_InputDelete(byref mip as Fl_Multiline_Input ptr)
'##########################################
'# class Fl_Secret_Input extends Fl_Input #
'##########################################
DeclareEx(Fl_Secret_Input)
declare function Fl_Secret_InputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Secret_Input ptr
declare sub      Fl_Secret_InputDelete(byref sip as Fl_Secret_Input ptr)
declare function Fl_Secret_InputHandle(byval sip as Fl_Secret_Input ptr,byval event as Fl_Event) as long

'####################################
'# class Fl_Output extends Fl_Input #
'####################################
DeclareEx(Fl_Output)
declare function Fl_OutputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Output ptr
declare sub      Fl_OutputDelete(byref op as Fl_Output ptr)
'###############################################
'# class Fl_Multiline_Output extends Fl_Output #
'###############################################
DeclareEx(Fl_Multiline_Output)
declare function Fl_Multiline_OutputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Multiline_Output ptr
declare sub      Fl_Multiline_OutputDelete(byref op as Fl_Multiline_Output ptr)

'########################################
'# class Fl_File_Input extends Fl_Input #
'########################################
DeclareEx(Fl_File_Input)
' Creates a new Fl_File_Input widget using the given position, size, and label string. 
declare function Fl_File_InputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_File_Input ptr
declare sub      Fl_File_InputDelete(byref fip as Fl_File_Input ptr)
' Handles the specified event.
declare function Fl_File_InputHandle(byval fip as Fl_File_Input ptr,byval event as Fl_Event) as long
' Sets/Gets the box type to use for the navigation bar. 
declare sub      Fl_File_InputSetDownBox(byval fip as Fl_File_Input ptr,byval b as Fl_Boxtype)
declare function Fl_File_InputGetDownBox(byval fip as Fl_File_Input ptr) as Fl_Boxtype
' Gets/Sets the current error color to c
declare function Fl_File_InputGetErrorColor(byval fip as Fl_File_Input ptr) as Fl_Color
declare sub      Fl_File_InputSetErrorColor(byval fip as Fl_File_Input ptr,byval c as Fl_Color)
' Sets the value of the widget given a new string value.
declare function Fl_File_InputSetValue(byval fip as Fl_File_Input ptr,byval txt as const zstring ptr) as long
' Sets the value of the widget given a new string value and its length.
declare function Fl_File_InputSetValue2(byval fip as Fl_File_Input ptr,byval txt as const zstring ptr,byval nChars as long) as long
' Returns the current value, which is a pointer to an internal buffer and is valid only until the next event is handled.
declare function Fl_File_InputGetValue(byval fip as Fl_File_Input ptr) as const zstring ptr
#endif ' NO_INPUT

#ifndef NO_MENU
'######################
'# class Fl_Menu_Item #
'######################
' Allows a menu item to be picked.
declare sub      Fl_Menu_ItemActivate(byval it as Fl_Menu_Item ptr)
declare sub      Fl_Menu_ItemDeactivate(byval it as Fl_Menu_Item ptr)
' Gets whether or not the item can be picked.
declare function Fl_Menu_ItemActive(byval it as Fl_Menu_Item ptr) as long
' Returns non 0 if FL_INACTIVE and FL_INVISIBLE are cleared, 0 otherwise.
declare function Fl_Menu_ItemActiveVisible(byval it as Fl_Menu_Item ptr) as long
' Adds an item. 
declare function Fl_Menu_ItemAdd (byval it as Fl_Menu_Item ptr,byval label as const zstring ptr,byval shortcut as long=0,byval cb as Fl_Callback=0,byval userdata as any ptr=0,byval flag as FL_MENUITEM_FLAG=0) as long
declare function Fl_Menu_ItemAdd2(byval it as Fl_Menu_Item ptr,byval label as const zstring ptr,byval shortcut as const zstring ptr,byval cb as Fl_Callback=0,byval userdata as any ptr=0,byval flag as FL_MENUITEM_FLAG=0) as long
' Inserts an item at position index. 
declare function Fl_Menu_ItemInsert(byval it as Fl_Menu_Item ptr,byval index as long,byval label as const zstring ptr,byval shortcut as long,byval cb as Fl_Callback,byval userdata as any ptr=0,byval flag as FL_MENUITEM_FLAG=0) as long

' Sets/Gets the user data argument that is sent to the callback function. 
declare sub      Fl_Menu_ItemSetArgument(byval it as Fl_Menu_Item ptr,byval v as long)
declare function Fl_Menu_ItemGetArgument(byval it as Fl_Menu_Item ptr) as long 

' Sets the menu item's callback functions and optional the userdata argument. 
declare sub      Fl_Menu_ItemCallback (byval it as Fl_Menu_Item ptr,byval cb as Fl_Callback)
declare sub      Fl_Menu_ItemCallbackArg alias "Fl_Menu_ItemCallback2" (byval it as Fl_Menu_Item ptr,byval cb as Fl_Callback,byval pData as any ptr)
declare sub      Fl_Menu_ItemCallback0(byval it as Fl_Menu_Item ptr,byval cb as Fl_Callback0)
declare sub      Fl_Menu_ItemCallback1(byval it as Fl_Menu_Item ptr,byval cb as Fl_Callback1,byval lData as long=0)

' Returns the callback function that is set for the menu item.
declare function Fl_Menu_ItemGetCallback_p(byval it as Fl_Menu_Item ptr) as Fl_Callback_p
' Returns true if a checkbox will be drawn next to this item. 
declare function Fl_Menu_ItemCheckBox(byval it as Fl_Menu_Item ptr) as long
' Returns true if this item is a radio item.
declare function Fl_Menu_ItemRadio(byval it as Fl_Menu_Item ptr) as long
' next 3 declares for backward compatibility only
declare sub      Fl_Menu_ItemCheck(byval it as Fl_Menu_Item ptr)
declare function Fl_Menu_ItemChecked(byval it as Fl_Menu_Item ptr) as long
declare sub      Fl_Menu_ItemUncheck(byval it as Fl_Menu_Item ptr)

' Turns the check or radio item "off" for the menu item.
declare sub      Fl_Menu_ItemClear(byval it as Fl_Menu_Item ptr)

' Calls the Fl_Menu_Item item's callback, and provides the Fl_Widget argument.
declare sub      Fl_Menu_ItemDoCallback                                     (byval it as Fl_Menu_Item ptr,byval wgt as Fl_Widget ptr,byval pData as any ptr=0)
declare sub      Fl_Menu_ItemDoCallbackArg  alias "Fl_Menu_ItemDoCallback"  (byval it as Fl_Menu_Item ptr,byval wgt as Fl_Widget ptr,byval pData as any ptr)
declare sub      Fl_Menu_ItemDoCallback0    alias "Fl_Menu_ItemDoCallback3" (byval it as Fl_Menu_Item ptr,byval wgt as Fl_Widget ptr)
declare sub      Fl_Menu_ItemDoCallback1Arg alias "Fl_Menu_ItemDoCallback2" (byval it as Fl_Menu_Item ptr,byval wgt as Fl_Widget ptr,byval lData as long)

' Draws the menu item in bounding box x,y,w,h, optionally selects the item.
declare sub      Fl_Menu_ItemDraw(byval it as Fl_Menu_Item ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval m as const Fl_Menu_ ptr,byval t as long=0)
' Search only the top level menu for a shortcut.
declare function Fl_Menu_ItemFindShortcut(byval it as Fl_Menu_Item ptr,byval ip as long ptr=0,byval require_alt as const long=0) as Fl_Menu_Item ptr
' Returns the first menu item, same as next(0)
declare function Fl_Menu_ItemFirst(byval it as Fl_Menu_Item ptr) as Fl_Menu_Item ptr
declare function Fl_Menu_ItemFirst2(byval it as Fl_Menu_Item ptr) as const Fl_Menu_Item ptr
' Advance a pointer by n items through a menu array, skipping the contents of submenus and invisible items.
declare function Fl_Menu_ItemNext(byval it as Fl_Menu_Item ptr,byval index as long=1) as Fl_Menu_Item ptr
declare function Fl_Menu_ItemNext2(byval it as Fl_Menu_Item ptr,byval index as long=1) as const Fl_Menu_Item ptr
' Hides an item in the menu.
declare sub      Fl_Menu_ItemHide(byval it as Fl_Menu_Item ptr)
' Makes an item visible in the menu.
declare sub      Fl_Menu_ItemShow(byval it as Fl_Menu_Item ptr)

declare sub      Fl_Menu_ItemImage(byval it as const Fl_Menu_Item ptr,byval img as Fl_Image ptr)

' Sets or Returns the title of the item.
declare sub      Fl_Menu_ItemSetLabel(byval it as Fl_Menu_Item ptr,byval label as const zstring ptr)
declare sub      Fl_Menu_ItemSetLabel2(byval it as Fl_Menu_Item ptr,byval lt as FL_LABEL_TYPE,byval label as const zstring ptr)
declare function Fl_Menu_ItemGetLabel(byval it as Fl_Menu_Item ptr) as const zstring ptr

declare sub      Fl_Menu_ItemSetLabelColor(byval it as Fl_Menu_Item ptr,byval c as Fl_Color)
declare function Fl_Menu_ItemGetLabelColor(byval it as Fl_Menu_Item ptr) as Fl_Color

declare sub      Fl_Menu_ItemSetLabelFont(byval it as Fl_Menu_Item ptr,byval f as Fl_Font)
declare function Fl_Menu_ItemGetLabelFont(byval it as Fl_Menu_Item ptr) as Fl_Font

declare sub      Fl_Menu_ItemSetLabelSize(byval it as Fl_Menu_Item ptr,byval fs as FL_FONTSIZE)
declare function Fl_Menu_ItemGetLabelSize(byval it as Fl_Menu_Item ptr) as FL_FONTSIZE

declare sub      Fl_Menu_ItemSetLabelType(byval it as Fl_Menu_Item ptr,byval lt as Fl_LABEL_TYPE)
declare function Fl_Menu_ItemGetLabelType(byval it as Fl_Menu_Item ptr) as Fl_LABEL_TYPE

' Measures width of label, including effect of & characters.
declare function Fl_Menu_ItemMeasure(byval it as Fl_Menu_Item ptr,byval h as long ptr,byval m as const Fl_Menu_ ptr) as long

' This method is called by widgets that want to display menus.
declare function Fl_Menu_ItemPopup   (byval it as Fl_Menu_Item ptr,byval x as long,byval y as long,byval title as const zstring ptr=0,byval picked as Fl_Menu_Item ptr=0,byval m as const Fl_Menu_ ptr=0) as Fl_Menu_Item ptr

' Pulldown() is similar to popup(), but a rectangle is provided to position the menu.
declare function Fl_Menu_ItemPulldown(byval it as Fl_Menu_Item ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval picked as Fl_Menu_Item ptr=0,byval m as const Fl_Menu_ ptr=0,byval title as Fl_Menu_Item ptr=0,byval menubar as long=0) as Fl_Menu_Item ptr

' Turns the check or radio item "on" for the menu item.
declare sub      Fl_Menu_ItemSet(byval it as Fl_Menu_Item ptr)

' Turns the radio item "on" for the menu item and turns off adjacent radio items set.
declare sub      Fl_Menu_ItemSetonly(byval it as Fl_Menu_Item ptr)

' Sets/Gets exactly what key combination will trigger the menu item.
declare sub      Fl_Menu_ItemSetShortcut(byval it as Fl_Menu_Item ptr,byval s as long)
declare function Fl_Menu_ItemGetShortcut(byval it as Fl_Menu_Item ptr) as long
' This is designed to be called by a widgets handle() method in response to a FL_SHORTCUT event.
declare function Fl_Menu_ItemTestShortcut(byval it as Fl_Menu_Item ptr) as Fl_Menu_Item ptr

' Size of the menu starting from this menu item.
declare function Fl_Menu_ItemSize(byval it as Fl_Menu_Item ptr) as long
' Returns true if either FL_SUBMENU or FL_SUBMENU_POINTER is on in the flags.
declare function Fl_Menu_ItemSubmenu(byval it as Fl_Menu_Item ptr) as long

' Sets/Gets the user data argument that is sent to the callback function. 
declare sub      Fl_Menu_ItemSetUserData(byval it as Fl_Menu_Item ptr,byval userdata as any ptr)
declare function Fl_Menu_ItemGetUserData(byval it as Fl_Menu_Item ptr) as any ptr
' Returns the current value of the check or radio item. 
declare function Fl_Menu_ItemValue(byval it as Fl_Menu_Item ptr) as long

' Gets the visibility of an item.
declare function Fl_Menu_ItemVisible(byval it as Fl_Menu_Item ptr) as long

'####################################
'# class Fl_Menu_ extends Fl_Widget #
'####################################
declare function Fl_Menu_Add (byval m_ as Fl_Menu_ ptr,byval label as const zstring ptr,byval shortcut as long=0             ,byval cb as Fl_Callback=0,byval userdata as any ptr=0,byval flag as long=0) as long
declare function Fl_Menu_Add2(byval m_ as Fl_Menu_ ptr,byval label as const zstring ptr,byval shortcut as const zstring ptr=0,byval cb as Fl_Callback=0,byval userdata as any ptr=0,byval flag as long=0) as long
declare function Fl_Menu_Add3(byval m_ as Fl_Menu_ ptr,byval label as const zstring ptr) as long

declare sub      Fl_Menu_Clear(byval m_ as Fl_Menu_ ptr)

declare function Fl_Menu_ClearSubmenu(byval m_ as Fl_Menu_ ptr,byval index as long) as long

declare sub      Fl_Menu_Copy(byval m_ as Fl_Menu_ ptr,byval mi as Fl_Menu_Item ptr,byval userdata as any ptr=0)

declare sub      Fl_Menu_SetDownBox(byval m_ as Fl_Menu_ ptr,byval bt as Fl_Boxtype)
declare function Fl_Menu_GetDownBox(byval m_ as Fl_Menu_ ptr) as Fl_Boxtype

declare sub      Fl_Menu_SetDownColor(byval m_ as Fl_Menu_ ptr,byval c as Fl_Color)
declare function Fl_Menu_GetDownColor(byval m_ as Fl_Menu_ ptr) as Fl_Color

declare function Fl_Menu_FindIndexByName(byval m_ as Fl_Menu_ ptr,byval name_ as const zstring ptr) as long
declare function Fl_Menu_FindIndexByItem(byval m_ as Fl_Menu_ ptr,byval item as Fl_Menu_Item ptr) as long
declare function Fl_Menu_FindIndexByCallback(byval m_ as Fl_Menu_ ptr,byval cb as Fl_Callback) as long

declare function Fl_Menu_FindItemByName(byval m_ as Fl_Menu_ ptr,byval name_ as const zstring ptr) as Fl_Menu_Item ptr
declare function Fl_Menu_FindItemByCallback(byval m_ as Fl_Menu_ ptr,byval cb as Fl_Callback) as Fl_Menu_Item ptr

declare sub      Fl_Menu_Global(byval m_ as Fl_Menu_ ptr)

declare function Fl_Menu_Insert (byval m_ as Fl_Menu_ ptr,byval index as long,byval label as const zstring ptr,byval shortcut as const zstring ptr=0,byval cb as Fl_Callback=0,byval userdata as any ptr=0,byval flag as long=0) as long
declare function Fl_Menu_Insert2(byval m_ as Fl_Menu_ ptr,byval index as long,byval label as const zstring ptr,byval shortcut as long          =0,byval cb as Fl_Callback=0,byval userdata as any ptr=0,byval flag as long=0) as long

declare function Fl_Menu_ItemPathName(byval m_ as Fl_Menu_ ptr,byval name_ as zstring ptr,byval namelen as long,byval item as Fl_Menu_Item ptr=0) as long

declare sub      Fl_Menu_SetMenu(byval m_ as Fl_Menu_ ptr,byval item as Fl_Menu_Item ptr)
declare function Fl_Menu_GetMenu(byval m_ as Fl_Menu_ ptr) as Fl_Menu_Item ptr


declare sub      Fl_Menu_SetMode(byval m_ as Fl_Menu_ ptr,byval index as long,byval flag as long)
declare function Fl_Menu_GetMode(byval m_ as Fl_Menu_ ptr,byval index as long) as long

declare function Fl_Menu_MValue(byval m_ as Fl_Menu_ ptr) as Fl_Menu_Item ptr
declare function Fl_Menu_Picked(byval m_ as Fl_Menu_ ptr,byval item as Fl_Menu_Item ptr) as Fl_Menu_Item ptr
declare sub      Fl_Menu_Remove(byval m_ as Fl_Menu_ ptr,byval index as long)
declare sub      Fl_Menu_Replace(byval m_ as Fl_Menu_ ptr,byval index as long,byval label as const zstring ptr)
declare sub      Fl_Menu_Shortcut(byval m_ as Fl_Menu_ ptr,byval index as long,byval shortcut as long)

declare function Fl_Menu_GetSize(byval m_ as Fl_Menu_ ptr) as long

declare sub      Fl_Menu_SetSize(byval m_ as Fl_Menu_ ptr,byval w as long,byval h as long)

declare function Fl_Menu_TestShortcut(byval m_ as Fl_Menu_ ptr) as Fl_Menu_Item ptr

declare function Fl_Menu_Text(byval m_ as Fl_Menu_ ptr) as const zstring ptr
declare function Fl_Menu_TextByIndex(byval m_ as Fl_Menu_ ptr,byval index as long) as const zstring ptr

declare sub      Fl_Menu_SetTextColor(byval m_ as Fl_Menu_ ptr,byval c as Fl_Color)
declare function Fl_Menu_GetTextColor(byval m_ as Fl_Menu_ ptr) as Fl_Color

declare sub      Fl_Menu_SetTextFont(byval m_ as Fl_Menu_ ptr,byval f as Fl_Font)
declare function Fl_Menu_GetTextFont(byval m_ as Fl_Menu_ ptr) as Fl_Font

declare sub      Fl_Menu_SetTextSize(byval m_ as Fl_Menu_ ptr,byval fs as FL_FONTSIZE)
declare function Fl_Menu_GetTextSize(byval m_ as Fl_Menu_ ptr) as FL_FONTSIZE

declare function Fl_Menu_GetValue        alias "Fl_Menu_Value"        (byval m_ as Fl_Menu_ ptr) as long
declare function Fl_Menu_GetValueByItem  alias "Fl_Menu_ValueByItem"  (byval m_ as Fl_Menu_ ptr,byval m as Fl_Menu_Item ptr) as long
declare function Fl_Menu_GetValueByIndex alias "Fl_Menu_ValueByIndex" (byval m_ as Fl_Menu_ ptr,byval index as long) as long

'#########################################
'# class Fl_Menu_Button extends Fl_Menu_ #
'#########################################
DeclareEx(Fl_Menu_Button)
declare function Fl_Menu_ButtonNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Menu_Button ptr
declare sub      Fl_Menu_ButtonDelete(byref mb as Fl_Menu_Button ptr)
declare function Fl_Menu_ButtonHandle(byval mb as Fl_Menu_Button ptr,byval event as Fl_Event) as long
declare function Fl_Menu_ButtonPopup(byval mb as Fl_Menu_Button ptr) as Fl_Menu_Item ptr

'######################################
'# class Fl_Menu_Bar extends Fl_Menu_ #
'######################################
DeclareEx(Fl_Menu_Bar)
declare function Fl_Menu_BarNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Menu_Bar ptr
declare sub      Fl_Menu_BarDelete(byref mb as Fl_Menu_Bar ptr)
declare function Fl_Menu_BarHandle(byval mb as Fl_Menu_Bar ptr,byval event as Fl_Event) as long

'####################################
'# class Fl_Choice extends Fl_Menu_ #
'####################################
DeclareEx(Fl_Choice)
' Create a new Fl_Choice widget using the given position, size and label string. 
declare function Fl_ChoiceNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Choice ptr
declare sub      Fl_ChoiceDelete(byref mb as Fl_Choice ptr)
' Handles the specified event.
declare function Fl_ChoiceHandle(byval c as Fl_Choice ptr,byval event as Fl_Event) as long
' Sets the currently selected value using the index into the menu item array.
declare function Fl_ChoiceSetValue(byval c as Fl_Choice ptr,byval index as long) as long
' Sets the currently selected value using a pointer to menu item.
declare function Fl_ChoiceSetValueByItem(byval c as Fl_Choice ptr,byval item as Fl_Menu_Item ptr) as long
' Gets the index of the last item chosen by the user. 
declare function Fl_ChoiceGetValue(byval c as Fl_Choice ptr) as long
#endif ' NO_MENU

#ifndef NO_PROGRESS
'#######################################
'# class Fl_Progress extends Fl_Widget #
'#######################################
DeclareEx(Fl_Progress)
' The constructor creates the progress bar using the position, size, and label.
declare function Fl_ProgressNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Progress ptr
declare sub      Fl_ProgressDelete(byref prg as Fl_Progress ptr)
' Sets/Gets the minimum value in the progress widget. 
declare sub      Fl_ProgressSetMinimum(byval prg as Fl_Progress ptr,byval minValue as single)
declare function Fl_ProgressGetMinimum(byval prg as Fl_Progress ptr) as single
' Sets/Gets the maximum value in the progress widget. 
declare sub      Fl_ProgressSetMaximum(byval prg as Fl_Progress ptr,byval maxValue as single)
declare function Fl_ProgressGetMaximum(byval prg as Fl_Progress ptr) as single
' Sets/Gets the current value in the progress widget.
declare sub      Fl_ProgressSetValue  (byval prg as Fl_Progress ptr,byval curValue as single)
declare function Fl_ProgressGetValue  (byval prg as Fl_Progress ptr) as single
#endif ' NO_PROGRESS

#ifndef NO_VALUATOR
'#######################################
'# class Fl_Valuator extends Fl_Widget #
'#######################################
' Sets the minimum and maximum values for the valuator widget.
declare sub      Fl_ValuatorBounds(byval va as Fl_Valuator ptr,byval minValue as double,byval maxValue as double)
' Clamps the passed value to the valuator range.
declare function Fl_ValuatorClamp(byval va as Fl_Valuator ptr,byval value as double) as double
' Uses internal rules to format the fields numerical value into the character array pointed to by the passed parameter.
declare function Fl_ValuatorFormat(byval va as Fl_Valuator ptr,byval fmt as zstring ptr) as long
' Adds n times the step value to the passed value.
declare function Fl_ValuatorIncrement(byval va as Fl_Valuator ptr,byval stepValue as double,byval nTimes as long) as double
' Sets the step value to 1/10 digits
declare sub      Fl_ValuatorPrecision(byval va as Fl_Valuator ptr,byval p as long)
' Sets the minimum and maximum values for the valuator.
declare sub      Fl_ValuatorRange(byval va as Fl_Valuator ptr,byval minValue as double,byval maxValue as double)
' Round the passed value to the nearest step increment.
declare function Fl_ValuatorRound(byval va as Fl_Valuator ptr,byval value as double) as double
' Sets/Gets the step value. 
declare sub      Fl_ValuatorSetStep(byval va as Fl_Valuator ptr,byval s as double)
declare function Fl_ValuatorGetStep(byval va as Fl_Valuator ptr) as double
' Sets/Gets the minimum value for the valuator.
declare sub      Fl_ValuatorSetMinimum(byval va as Fl_Valuator ptr,byval minValue as double)
declare function Fl_ValuatorGetMinimum(byval va as Fl_Valuator ptr) as double
' Sets/Gets the maximum value for the valuator.
declare sub      Fl_ValuatorSetMaximum(byval va as Fl_Valuator ptr,byval maxValue as double)
declare function Fl_ValuatorGetMaximum(byval va as Fl_Valuator ptr) as double
' Sets the current value.
declare function Fl_ValuatorSetValue(byval va as Fl_Valuator ptr,byval curValue as double) as long
' Gets the floating point(double) value.
declare function Fl_ValuatorGetValue(byval va as Fl_Valuator ptr) as double

'#########################################
'# class Fl_Adjuster extends Fl_Valuator #
'#########################################
DeclareEx(Fl_Adjuster)
declare function Fl_AdjusterNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Adjuster ptr
declare sub      Fl_AdjusterDelete(byref adj as Fl_Adjuster ptr)
declare sub      Fl_AdjusterSetSoft(byval adj as Fl_Adjuster ptr,byval s as long)
declare function Fl_AdjusterGetSoft(byval adj as Fl_Adjuster ptr) as long

'########################################
'# class Fl_Counter extends Fl_Valuator #
'########################################
DeclareEx(Fl_Counter)
declare function Fl_CounterNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Counter ptr
declare sub      Fl_CounterDelete    (byref cnt as Fl_Counter ptr)
declare function Fl_CounterHandle    (byval cnt as Fl_Counter ptr,byval event      as Fl_Event) as long
declare sub      Fl_CounterLargeStep (byval cnt as Fl_Counter ptr,byval largeStep  as double)
declare sub      Fl_CounterNormalStep(byval cnt as Fl_Counter ptr,byval normalStep as double)
declare sub      Fl_CounterStep      (byval cnt as Fl_Counter ptr,byval minValue   as double,byval maxValue as double)

'##############################################
'# class Fl_Simple_Counter extends Fl_Counter #
'##############################################
DeclareEx(Fl_Simple_Counter)
declare function Fl_Simple_CounterNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Simple_Counter ptr
declare sub      Fl_Simple_CounterDelete(byref cnt as Fl_Simple_Counter ptr)
'#####################################
'# class Fl_Dial extends Fl_Valuator #
'#####################################
DeclareEx(Fl_Dial)
declare function Fl_DialNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Dial ptr
declare sub      Fl_DialDelete(byref dial as Fl_Dial ptr)
declare function Fl_DialHandle(byval dial as Fl_Dial ptr,byval event as Fl_Event) as long

declare sub      Fl_DialAngles(byval dial as Fl_Dial ptr,byval angle1 as short,byval angle2 as short)

declare sub      Fl_DialSetAngle1(byval dial as Fl_Dial ptr,byval angle1 as short)
declare function Fl_DialGetAngle1(byval dial as Fl_Dial ptr) as short

declare sub      Fl_DialSetAngle2(byval dial as Fl_Dial ptr,byval angle2 as short)
declare function Fl_DialGetAngle2(byval dial as Fl_Dial ptr) as short

'######################################
'# class Fl_Fill_Dial extends Fl_Dial #
'######################################
DeclareEx(Fl_Fill_Dial)
declare function Fl_Fill_DialNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Fill_Dial ptr
declare sub      Fl_Fill_DialDelete(byref dial as Fl_Fill_Dial ptr)
'######################################
'# class Fl_Line_Dial extends Fl_Dial #
'######################################
DeclareEx(Fl_Line_Dial)
declare function Fl_Line_DialNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Line_Dial ptr
declare sub      Fl_Line_DialDelete(byref dial as Fl_Line_Dial ptr)
'#######################################
'# class Fl_Roller extends Fl_Valuator #
'#######################################
DeclareEx(Fl_Roller)
declare function Fl_RollerNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Roller ptr
declare sub      Fl_RollerDelete(byref rol as Fl_Roller ptr)
'#######################################
'# class Fl_Slider extends Fl_Valuator #
'#######################################
DeclareEx(Fl_Slider)
declare function Fl_SliderNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Slider ptr
declare sub      Fl_SliderDelete(byref sl as Fl_Slider ptr)
declare function Fl_SliderNew2(byval t as ubyte,byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Slider ptr
declare function Fl_SliderHandle(byval sl as Fl_Slider ptr,byval event as Fl_Event) as long

declare sub      Fl_SliderBounds(byval sl as Fl_Slider ptr,byval a as double,byval b as double)

declare function Fl_SliderScrollValue(byval sl as Fl_Slider ptr,byval p as long,byval size as long,byval first as long,byval total as long) as long

declare sub      Fl_SliderSetSlider(byval sl as Fl_Slider ptr,byval c as Fl_Boxtype)
declare function Fl_SliderGetSlider(byval sl as Fl_Slider ptr) as Fl_Boxtype

declare sub      Fl_SliderSetSliderSize(byval sl as Fl_Slider ptr,byval v as double)
declare function Fl_SliderGetSliderSize(byval sl as Fl_Slider ptr) as double

'#########################################
'# class Fl_Hor_Slider extends Fl_Slider #
'#########################################
DeclareEx(Fl_Hor_Slider)
declare function Fl_Hor_SliderNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Hor_Slider ptr
declare sub      Fl_Hor_SliderDelete(byref sl as Fl_Hor_Slider ptr)
'##########################################
'# class Fl_Fill_Slider extends Fl_Slider #
'##########################################
DeclareEx(Fl_Fill_Slider)
declare function Fl_Fill_SliderNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Fill_Slider ptr
declare sub      Fl_Fill_SliderDelete(byref sl as Fl_Fill_Slider ptr)
'##############################################
'# class Fl_Hor_Fill_Slider extends Fl_Slider #
'##############################################
DeclareEx(Fl_Hor_Fill_Slider)
declare function Fl_Hor_Fill_SliderNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Hor_Fill_Slider ptr
declare sub      Fl_Hor_Fill_SliderDelete(byref sl as Fl_Hor_Fill_Slider ptr)
'##########################################
'# class Fl_Nice_Slider extends Fl_Slider #
'##########################################
DeclareEx(Fl_Nice_Slider)
declare function Fl_Nice_SliderNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Nice_Slider ptr
declare sub      Fl_Nice_SliderDelete(byref sl as Fl_Nice_Slider ptr)
'##############################################
'# class Fl_Hor_Nice_Slider extends Fl_Slider #
'##############################################
DeclareEx(Fl_Hor_Nice_Slider)
declare function Fl_Hor_Nice_SliderNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Hor_Nice_Slider ptr
declare sub      Fl_Hor_Nice_SliderDelete(byref sl as Fl_Hor_Nice_Slider ptr)
'########################################
'# class Fl_Scrollbar extends Fl_Slider #
'########################################
DeclareEx(Fl_Scrollbar)
declare function Fl_ScrollbarNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Scrollbar ptr
declare sub      Fl_ScrollbarDelete(byref sb as Fl_Scrollbar ptr)
declare function Fl_ScrollbarHandle(byval sb as Fl_Scrollbar ptr,byval event as Fl_Event) as long

declare function Fl_ScrollbarValue(byval sb as Fl_Scrollbar ptr,byval p as long,byval windowSize as long,byval first as long,byval total as long) as long

declare sub      Fl_ScrollbarSetLineSize(byval sb as Fl_Scrollbar ptr,byval lz as long)
declare function Fl_ScrollbarGetLineSize(byval sb as Fl_Scrollbar ptr) as long

declare function Fl_ScrollbarSetValue(byval sb as Fl_Scrollbar ptr,byval p as long) as long
declare function Fl_ScrollbarGetValue(byval sb as Fl_Scrollbar ptr) as long

'###########################################
'# class Fl_Value_Slider extends Fl_Slider #
'###########################################
DeclareEx(Fl_Value_Slider)
declare function Fl_Value_SliderNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Value_Slider ptr
declare sub      Fl_Value_SliderDelete(byref sl as Fl_Value_Slider ptr)
declare function Fl_Value_SliderHandle(byval sl as Fl_Value_Slider ptr,byval event as Fl_Event) as long

declare sub      Fl_Value_SliderSetTextColor(byval sl as Fl_Value_Slider ptr,byval c as Fl_Color)
declare function Fl_Value_SliderGetTextColor(byval sl as Fl_Value_Slider ptr) as Fl_Color

declare sub      Fl_Value_SliderSetTextFont(byval sl as Fl_Value_Slider ptr,byval f as Fl_Font)
declare function Fl_Value_SliderGetTextFont(byval sl as Fl_Value_Slider ptr) as Fl_Font

declare sub      Fl_Value_SliderSetTextSize(byval sl as Fl_Value_Slider ptr,byval s as FL_FONTSIZE)
declare function Fl_Value_SliderGetTextSize(byval sl as Fl_Value_Slider ptr) as FL_FONTSIZE

'#####################################################
'# class Fl_Hor_Value_Slider extends Fl_Value_Slider #
'#####################################################
DeclareEx(Fl_Hor_Value_Slider)
declare function Fl_Hor_Value_SliderNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Hor_Value_Slider ptr
declare sub      Fl_Hor_Value_SliderDelete(byref sl as Fl_Hor_Value_Slider ptr)
'############################################
'# class Fl_Value_Input extends Fl_Valuator #
'############################################
DeclareEx(Fl_Value_Input)
declare function Fl_Value_InputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Value_Input ptr
declare sub      Fl_Value_InputDelete(byref vi as Fl_Value_Input ptr)
declare function Fl_Value_InputHandle(byval vi as Fl_Value_Input ptr,byval event as Fl_Event) as long

declare sub      Fl_Value_InputResize(byval vi as Fl_Value_Input ptr,byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      Fl_Value_InputSetCursorColor(byval vi as Fl_Value_Input ptr,byval c as Fl_Color)
declare function Fl_Value_InputGetCursorColor(byval vi as Fl_Value_Input ptr) as Fl_Color

declare sub      Fl_Value_InputSetShortcut(byval vi as Fl_Value_Input ptr,byval s as long)
declare function Fl_Value_InputGetShortcut(byval vi as Fl_Value_Input ptr) as long

declare sub      Fl_Value_InputSetSoft(byval vi as Fl_Value_Input ptr,byval s as long)
declare function Fl_Value_InputGetSoft(byval vi as Fl_Value_Input ptr) as long

declare sub      Fl_Value_InputSetTextColor(byval vi as Fl_Value_Input ptr,byval c as Fl_Color)
declare function Fl_Value_InputGetTextColor(byval vi as Fl_Value_Input ptr) as Fl_Color

declare sub      Fl_Value_InputSetTextFont(byval vi as Fl_Value_Input ptr,byval f as Fl_Font)
declare function Fl_Value_InputGetTextFont(byval vi as Fl_Value_Input ptr) as Fl_Font

declare sub      Fl_Value_InputSetTextSize(byval vi as Fl_Value_Input ptr,byval s as FL_FONTSIZE)
declare function Fl_Value_InputGetTextSize(byval vi as Fl_Value_Input ptr) as FL_FONTSIZE

'#############################################
'# class Fl_Value_Output extends Fl_Valuator #
'#############################################
DeclareEx(Fl_Value_Output)
declare function Fl_Value_OutputNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Value_Output ptr
declare sub      Fl_Value_OutputDelete(byref vo as Fl_Value_Output ptr)
declare function Fl_Value_OutputHandle(byval vo as Fl_Value_Output ptr,byval event as Fl_Event) as long

declare sub      Fl_Value_OutputResize(byval vo as Fl_Value_Output ptr,byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      Fl_Value_OutputSetSoft(byval vo as Fl_Value_Output ptr,byval s as long)
declare function Fl_Value_OutputGetSoft(byval vo as Fl_Value_Output ptr) as long

declare sub      Fl_Value_OutputSetTextColor(byval vo as Fl_Value_Output ptr,byval c as Fl_Color)
declare function Fl_Value_OutputGetTextColor(byval vo as Fl_Value_Output ptr) as Fl_Color

declare sub      Fl_Value_OutputSetTextFont(byval vo as Fl_Value_Output ptr,byval f as Fl_Font)
declare function Fl_Value_OutputGetTextFont(byval vo as Fl_Value_Output ptr) as Fl_Font

declare sub      Fl_Value_OutputSetTextSize(byval vo as Fl_Value_Output ptr,byval s as FL_FONTSIZE)
declare function Fl_Value_OutputGetTextSize(byval vo as Fl_Value_Output ptr) as FL_FONTSIZE
#endif ' NO_VALUATOR

#ifndef NO_GROUP
'####################################
'# class Fl_Group extends Fl_Widget #
'####################################
DeclareEx(Fl_Group)
' Creates a new Fl_Group widget using the given position, size, and label string.
declare function Fl_GroupNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Group ptr
declare sub      Fl_GroupDelete(byref grp as Fl_Group ptr)
' Handles the specified event
declare function Fl_GroupHandle(byval grp as Fl_Group ptr,byval ev as Fl_Event) as long

' The widget is removed from its current group (if any) and then added to the end of this group. 
declare sub      Fl_GroupAdd(byval grp as Fl_Group ptr,byval wgt as Fl_Widget ptr)

' Returns an Fl_Group pointer if this widget is an Fl_Group
declare function Fl_GroupAsGroup(byval grp as Fl_Widget ptr) as Fl_Group ptr

' Sets the current group so you can build the widget tree by just constructing the widgets.
declare sub      Fl_GroupBegin(byval grp as Fl_Group ptr)
declare sub      Fl_GroupEnd(byval grp as Fl_Group ptr)

' Returns how many child widgets the group has. 
declare function Fl_GroupChildren(byval grp as Fl_Group ptr) as long
' Returns a pointer to the children.
declare function Fl_GroupChild(byval grp as Fl_Group ptr,byval childIndex as long) as Fl_Widget ptr
' Returns a pointer to the array of all children. 
declare function Fl_GroupArray(byval grp as Fl_Group ptr) as Fl_Widget ptr ptr
declare function Fl_GroupArray2(byval grp as Fl_Group ptr) as const Fl_Widget ptr ptr


' Deletes all child widgets from memory recursively.
declare sub      Fl_GroupClear(byval grp as Fl_Group ptr)

' Controls whether the group widget clips the drawing of child widgets to its bounding box
declare sub      Fl_GroupSetClipChildren(byval grp as Fl_Group ptr,byval clip as long)
' Returns the current clipping mode
declare function Fl_GroupGetClipChildren(byval grp as Fl_Group ptr) as long

' Searches the child array for the widget and returns the index
declare function Fl_GroupFind(byval grp as Fl_Group ptr,byval wgt as const Fl_Widget ptr) as long

' Resets the internal array of widget sizes and positions.
declare sub      Fl_GroupInitSizes(byval grp as Fl_Group ptr)
' Resizes the Fl_Group widget and all of its children
declare sub      Fl_GroupResize(byval grp as Fl_Group ptr,byval x as long,byval y as long,byval w as long,byval h as long)

' The widget is removed from its current group (if any) and then inserted into this group.
declare sub      Fl_GroupInsert(byval grp as Fl_Group ptr, byref widget as Fl_Widget ptr,byval before as Fl_Widget ptr)
declare sub      Fl_GroupInsert2(byval grp as Fl_Group ptr, byref widget as Fl_Widget ptr,byval childIndex as long)

' Removes the widget at index from the group but does not delete it.
declare sub      Fl_GroupRemove (byval grp as Fl_Group ptr,byval childIndex as long)
declare sub      Fl_GroupRemove2(byval grp as Fl_Group ptr,byval childWgt as Fl_Widget ptr)

' The resizable widget defines the resizing box for the group.
declare sub      Fl_GroupSetResizable(byval grp as Fl_Group ptr,byval wgt as Fl_Widget ptr)
declare function Fl_GroupGetResizable(byval grp as Fl_Group ptr) as Fl_Widget ptr

'##################################
'# class Fl_Pack extends Fl_Group #
'##################################
DeclareEx(Fl_Pack)
declare function Fl_PackNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Pack ptr
declare sub      Fl_PackDelete(byref pac as Fl_Pack ptr)
declare sub      Fl_PackSetSpacing(byval pac as Fl_Pack ptr,byval spacing as long)
declare function Fl_PackGetSpacing(byval pac as Fl_Pack ptr) as long
#define Fl_PackBegin Fl_GroupBegin
#define Fl_PackEnd Fl_GroupEnd

'##################################
'# class Fl_Tile extends Fl_Group #
'##################################
DeclareEx(Fl_Tile)
declare function Fl_TileNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Tile ptr
declare sub      Fl_TileDelete(byref til as Fl_Tile ptr)
declare function Fl_TileHandle(byval til as Fl_Tile ptr,byval event as Fl_Event) as long
declare sub      Fl_TilePosition(byval til as Fl_Tile ptr,byval from_x as long,byval from_y as long,byval to_x as long,byval to_y as long)
declare sub      Fl_TileResize(byval til as Fl_Tile ptr,byval x as long,byval y as long,byval w as long,byval h as long)
#define Fl_TileBegin Fl_GroupBegin
#define Fl_TileEnd Fl_GroupEnd

'####################################
'# class Fl_Scroll extends Fl_Group #
'####################################
DeclareEx(Fl_Scroll)
declare function Fl_ScrollNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Scroll ptr
declare sub      Fl_ScrollDelete(byref sc as Fl_Scroll ptr)
declare function Fl_ScrollHandle(byval sc as Fl_Scroll ptr,byval event as Fl_Event) as long

' Clear all but the scrollbars
declare sub      Fl_ScrollClear(byval sc as Fl_Scroll ptr)

' Resizes the scroll group and all of its children. 
declare sub      Fl_ScrollResize(byval sc as Fl_Scroll ptr,byval x as long,byval y as long,byval w as long,byval h as long)

' Moves the contents of the scroll group to a new position. 
declare sub      Fl_ScrollScrollTo(byval sc as Fl_Scroll ptr,byval x as long,byval y as long)

' Gets/sets the current size of the scrollbars in pixels. 
declare sub      Fl_ScrollSetScrollbarSize(byval sc as Fl_Scroll ptr,byval newSize as long)
declare function Fl_ScrollGetScrollbarSize(byval sc as Fl_Scroll ptr) as long

' Gets the current horizontal or vertical scrolling position.
declare function Fl_ScrollXPosition(byval sc as Fl_Scroll ptr) as long
declare function Fl_ScrollYPosition(byval sc as Fl_Scroll ptr) as long

' Gets the horizontal or vertical scrollbar widget
declare function Fl_ScrollHScrollbar(byval sc as Fl_Scroll ptr) as Fl_Scrollbar ptr
declare function Fl_ScrollScrollbar(byval sc as Fl_Scroll ptr) as Fl_Scrollbar ptr

#define Fl_ScrollBegin Fl_GroupBegin
#define Fl_ScrollEnd Fl_GroupEnd

#endif ' NO_GROUP

#ifndef NO_BROWSER
'######################################
'# class Fl_Browser_ extends Fl_Group #
'######################################
' Handles the event within the normal widget bounding box. 
declare function Fl_Browser_Handle(byval br as Fl_Browser_ ptr,byval event as Fl_Event) as long

' Deselects all items in the list and returns 1 if the state changed or 0 if it did not. 
declare function Fl_Browser_Deselect(byval br as Fl_Browser_ ptr,byval docallbacks as long=0) as long

' Displays the item, scrolling the list as necessary. 
declare sub      Fl_Browser_Display(byval br as Fl_Browser_ ptr,byval item as any ptr)

' Sets/Gets whether the widget should have scrollbars or not (default FL_SCROLL_BOTH). 
declare sub      Fl_Browser_SetHasScrollbar(byval br as Fl_Browser_ ptr,byval mode as ubyte)
declare function Fl_Browser_GetHasSscrollbar(byval br as Fl_Browser_ ptr) as ubyte

' Sets/Gets the horizontal scroll position of the list to pixel position pos. 
declare sub      Fl_Browser_SetHPosition(byval br as Fl_Browser_ ptr,byval p as long)
declare function Fl_Browser_GetHPosition(byval br as Fl_Browser_ ptr) as long

' Sets/Gets the vertical scroll position of the list to pixel position pos. 
declare sub      Fl_Browser_SetPosition(byval br as Fl_Browser_ ptr,byval p as long)
declare function Fl_Browser_GetPosition(byval br as Fl_Browser_ ptr) as long

' Repositions and/or resizes the browser.
declare sub      Fl_Browser_Resize(byval br as Fl_Browser_ ptr,byval x as long,byval y as long,byval w as long,byval h as long)

' Moves the vertical scrollbar to the left- or righthand side of the list. 
declare sub      Fl_Browser_ScrollbarLeft(byval br as Fl_Browser_ ptr)
declare sub      Fl_Browser_ScrollbarRight(byval br as Fl_Browser_ ptr)

' Sets/Gets the pixel size of the scrollbars' troughs to newSize, in pixels. 
declare sub      Fl_Browser_SetScrollbarSize(byval br as Fl_Browser_ ptr,byval newSize as long)
declare function Fl_Browser_GetScrollbarSize(byval br as Fl_Browser_ ptr) as long

' !!! deprecated use Set/Get ScrollbarSize !!!
declare sub      Fl_Browser_SetScrollbarWidth(byval br as Fl_Browser_ ptr,byval w as long)
declare function Fl_Browser_GetScrollbarWidth(byval br as Fl_Browser_ ptr) as long

' Sets the selection state of item to val, and returns 1 if the state changed or 0 if it did not. 
declare function Fl_Browser_Select(byval br as Fl_Browser_ ptr,byval item as any ptr,byval v as long=1,byval docallbacks as long=0) as long

' Selects item and returns 1 if the state changed or 0 if it did not. 
declare function Fl_Browser_SelectOnly(byval br as Fl_Browser_ ptr,byval item as any ptr,byval docallbacks as long=0) as long

' Sort the items in the browser based on flags.
declare sub      Fl_Browser_Sort(byval br as Fl_Browser_ ptr,byval flags as long=0)

' Sets/Gets the default text color for the lines in the browser to color col. 
declare sub      Fl_Browser_SetTextColor(byval br as Fl_Browser_ ptr,byval c as Fl_Color)
declare function Fl_Browser_GetTextColor(byval br as Fl_Browser_ ptr) as Fl_Color

' Sets/Gets the default text font for the lines in the browser to font. 
declare sub      Fl_Browser_SetTextFont(byval br as Fl_Browser_ ptr,byval f as Fl_Font)
declare function Fl_Browser_GetTextFont(byval br as Fl_Browser_ ptr) as Fl_Font

' Sets/Gets the default text size (in pixels) for the lines in the browser to size. 
declare sub      Fl_Browser_SetTextsize(byval br as Fl_Browser_ ptr,byval fs as FL_FONTSIZE)
declare function Fl_Browser_GetTextsize(byval br as Fl_Browser_ ptr) as FL_FONTSIZE
#define Fl_Browser_Begin Fl_GroupBegin
#define Fl_Browser_End Fl_GroupEnd

'##############################################
'# class Fl_Check_Browser extends Fl_Browser_ #
'##############################################
DeclareEx(Fl_Check_Browser)
declare function Fl_Check_BrowserNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Check_Browser ptr
declare sub      Fl_Check_BrowserDelete    (byref cb as Fl_Check_Browser ptr)
declare function Fl_Check_BrowserAdd       (byval cb as Fl_Check_Browser ptr,byval s as zstring ptr) as long
declare function Fl_Check_BrowserAdd2      (byval cb as Fl_Check_Browser ptr,byval s as zstring ptr,byval b as long) as long
declare sub      Fl_Check_BrowserCheckAll  (byval cb as Fl_Check_Browser ptr)
declare sub      Fl_Check_BrowserCheckNone (byval cb as Fl_Check_Browser ptr)
declare sub      Fl_Check_BrowserChecked   (byval cb as Fl_Check_Browser ptr,byval item as long,byval b as long)
declare sub      Fl_Check_BrowserClear     (byval cb as Fl_Check_Browser ptr)
declare function Fl_Check_BrowserNChecked  (byval cb as Fl_Check_Browser ptr) as long
declare function Fl_Check_BrowserNItems    (byval cb as Fl_Check_Browser ptr) as long
declare function Fl_Check_BrowserRemove    (byval cb as Fl_Check_Browser ptr,byval item as long) as long
declare sub      Fl_Check_BrowserSetChecked(byval cb as Fl_Check_Browser ptr,byval item as long)
declare function Fl_Check_BrowserGetChecked(byval cb as Fl_Check_Browser ptr,byval item as long) as long
declare function Fl_Check_BrowserText      (byval cb as Fl_Check_Browser ptr,byval item as long) as zstring ptr
declare function Fl_Check_BrowserValue     (byval cb as Fl_Check_Browser ptr) as long

'########################################
'# class Fl_Browser extends Fl_Browser_ #
'########################################
DeclareEx(Fl_Browser)
' The constructor makes an empty browser. 
declare function Fl_BrowserNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Browser ptr
declare sub      Fl_BrowserDelete(byref br as Fl_Browser ptr)
' Shows the entire Fl_Browser widget -- opposite of Fl_BrowserHide().
declare sub      Fl_BrowserShow(byval br as Fl_Browser ptr)
' Hides the entire Fl_Browser widget -- opposite of Fl_BrowserShow().
declare sub      Fl_BrowserHide(byval br as Fl_Browser ptr)

' Makes line visible, and available for selection by user. 
declare sub      Fl_BrowserShow2(byval br as Fl_Browser ptr,byval line_ as long)
' Makes line invisible, preventing selection by the user. 
declare sub      Fl_BrowserHide2(byval br as Fl_Browser ptr,byval line_ as long)

' Returns non-zero if the specified line is visible, 0 if hidden. 
declare function Fl_BrowserVisible(byval br as Fl_Browser ptr,byval line_ as long) as long

' Removes all the lines in the browser.
declare sub      Fl_BrowserClear(byval br as Fl_Browser ptr)

' Clears the browser and reads the file, adding each line from the file to the browser. 
declare function Fl_BrowserLoad(byval br as Fl_Browser ptr,byval filename as const zstring ptr) as long

' Adds a new line to the end of the browser. 
declare sub      Fl_BrowserAdd(byval br as Fl_Browser ptr,byval newtext as const zstring ptr,byval pData as any ptr=0)
' Insert a new entry whose label is newtext above given line, optional data d.
declare sub      Fl_BrowserInsert(byval br as Fl_Browser ptr,byval line_ as long,byval newtext as const zstring ptr,byval pDatat as any ptr=0)

' Remove entry for given line number, making the browser one line shorter.
declare sub      Fl_BrowserRemove(byval br as Fl_Browser ptr,byval line_ as long)
' Removes the icon for line.
declare sub      Fl_BrowserRemoveIcon(byval br as Fl_Browser ptr,byval line_ as long)

' Returns the line that is currently visible at the top of the browser.
declare function Fl_BrowserGetTopline(byval br as Fl_Browser ptr) as long

' Scrolls the browser so the top item in the browser is showing the specified line.
declare sub      Fl_BrowserSetTopline(byval br as Fl_Browser ptr,byval line_ as long)

' Scrolls the browser so the middle item in the browser is showing the specified line.
declare sub      Fl_BrowserMiddleLine(byval br as Fl_Browser ptr,byval line_ as long)

' Scrolls the browser so the bottom item in the browser is showing the specified line.
declare sub      Fl_BrowserBottomLine(byval br as Fl_Browser ptr,byval line_ as long)

' Sets the column separator to c.
declare sub      Fl_BrowserSetColumnChar(byval br as Fl_Browser ptr,byval c as ubyte)
' Gets the current column separator character.
declare function Fl_BrowserGetColumnChar(byval br as Fl_Browser ptr) as ubyte

' Sets the current array to arr.
declare sub      Fl_BrowserSetColumnWidths(byval br as Fl_Browser ptr,byval arr as const long ptr)
' Gets the current column width array. 
declare function Fl_BrowserGetColumnWidths(byval br as Fl_Browser ptr) as const long ptr

' Sets the user data for specified line.
declare sub      Fl_BrowserSetData(byval br as Fl_Browser ptr,byval line_ as long,byval pData as any ptr)
' Returns the user data for specified line.
declare function Fl_BrowserGetData(byval br as Fl_Browser ptr,byval line_ as long) as any ptr

' For back compatibility.
declare sub      Fl_BrowserDisplay(byval br as Fl_Browser ptr,byval line_ as long,byval v as long=1)
' Returns non-zero if line has been scrolled to a position where it is being displayed.
declare function Fl_BrowserDisplayed(byval br as Fl_Browser ptr,byval line_ as long) as long

' Sets the current format code prefix character to c. 
declare sub      Fl_BrowserSetFormatChar(byval br as Fl_Browser ptr,byval c as ubyte)
' Gets the current format code prefix character, which by default is '@'.
declare function Fl_BrowserGetFormatChar(byval br as Fl_Browser ptr) as ubyte

' Set the image icon for line to the value icon.
declare sub      Fl_BrowserSetIcon(byval br as Fl_Browser ptr,byval line_ as long,byval icon as Fl_Image ptr)
' Returns the icon currently defined for line.
declare function Fl_BrowserGetIcon(byval br as Fl_Browser ptr,byval line_ as long) as Fl_Image ptr

' Updates the browser so that line is shown at position pos.
declare sub      Fl_BrowserLinePosition(byval br as Fl_Browser ptr,byval line_ as long,byval p as FL_LINE_POSITION)

' Make the item at the specified line visible.
declare sub      Fl_BrowserMakeVisible(byval br as Fl_Browser ptr,byval line_ as long)

' Line from is removed and reinserted at to.
declare sub      Fl_BrowserMove(byval br as Fl_Browser ptr,byval to_ as long,byval from as long)
' For back compatibility only.
declare sub      Fl_BrowserReplace(byval br as Fl_Browser ptr,byval a as long,byval b as const zstring ptr)

' Sets the selection state of the item at line to the value val.
declare function Fl_BrowserSelect(byval br as Fl_Browser ptr,byval line_ as long,byval v as long=1) as long

' Returns 1 if specified line is selected, 0 if not.
declare function Fl_BrowserSelected(byval br as Fl_Browser ptr,byval line_ as long) as long

' Changes the size of the widget.
declare sub      Fl_BrowserSetSize(byval br as Fl_Browser ptr,byval w as long,byval h as long)

' Returns how many lines are in the browser. 
declare function Fl_BrowserGetSize(byval br as Fl_Browser ptr) as long

' Swaps two browser lines a and b.
declare sub      Fl_BrowserSwap(byval br as Fl_Browser ptr,byval a as long,byval b as long)

' Sets the text for the specified line to newtext.
declare sub      Fl_BrowserSetText(byval br as Fl_Browser ptr,byval line_ as long,byval newtext as const zstring ptr)
' Returns the label text for the specified line.
declare function Fl_BrowserGetText(byval br as Fl_Browser ptr,byval line_ as long) as const zstring ptr

' Sets the browser's value, which selects the specified line. 
declare sub      Fl_BrowserSetValue(byval br as Fl_Browser ptr,byval line_ as long)
' Returns the line number of the currently selected line, or 0 if none.
declare function Fl_BrowserGetValue(byval br as Fl_Browser ptr) as long
#define Fl_BrowserEnd Fl_GroupEnd

'############################################
'# class Fl_File_Browser extends Fl_Browser #
'############################################
DeclareEx(Fl_File_Browser)
declare function Fl_File_BrowserNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_File_Browser ptr
declare sub      Fl_File_BrowserDelete(byref f as Fl_File_Browser ptr)
declare function Fl_File_BrowserLoad(byval f as Fl_File_Browser ptr,byval directory as const zstring ptr) as long

declare sub      Fl_File_BrowserSetFiletype(byval f as Fl_File_Browser ptr,byval type_ as FL_FILE_TYPE)
declare function Fl_File_BrowserGetFiletype(byval f as Fl_File_Browser ptr) as FL_FILE_TYPE

declare sub      Fl_File_BrowserSetFilter(byval f as Fl_File_Browser ptr,byval pattern as const zstring ptr)
declare function Fl_File_BrowserGetFilter(byval f as Fl_File_Browser ptr) as const zstring ptr

declare sub      Fl_File_BrowserSetIconSize(byval f as Fl_File_Browser ptr,byval s as ubyte)
declare function Fl_File_BrowserGetIconSize(byval f as Fl_File_Browser ptr) as ubyte

declare sub      Fl_File_BrowserSetTextSize(byval f as Fl_File_Browser ptr,byval s as FL_FONTSIZE)
declare function Fl_File_BrowserGetTextSize(byval f as Fl_File_Browser ptr) as FL_FONTSIZE

'############################################
'# class Fl_Hold_Browser extends Fl_Browser #
'############################################
DeclareEx(Fl_Hold_Browser)
declare function Fl_Hold_BrowserNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Hold_Browser ptr
declare sub      Fl_Hold_BrowserDelete(byref br as Fl_Hold_Browser ptr)
'#############################################
'# class Fl_Multi_Browser extends Fl_Browser #
'#############################################
DeclareEx(Fl_Multi_Browser)
declare function Fl_Multi_BrowserNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Multi_Browser ptr
declare sub      Fl_Multi_BrowserDelete(byref br as Fl_Multi_Browser ptr)
'##############################################
'# class Fl_Select_Browser extends Fl_Browser #
'##############################################
DeclareEx(Fl_Select_Browser)
declare function Fl_Select_BrowserNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Select_Browser ptr
declare sub      Fl_Select_BrowserDelete(byref br as Fl_Select_Browser ptr)
#endif ' NO_BROWSER


#ifndef COLORCHOOSER
'###########################################
'# class Fl_Color_Chooser extends Fl_Group #
'###########################################
DeclareEx(Fl_Color_Chooser)
declare function Fl_Color_ChooserNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Color_Chooser ptr
declare sub      Fl_Color_ChooserDelete(byref cc as Fl_Color_Chooser ptr)
declare sub      Fl_Color_ChooserSetMode(byval cc as Fl_Color_Chooser ptr,byval newMode as FL_ColorChooserModes)
declare function Fl_Color_ChooserGetMode(byval cc as Fl_Color_Chooser ptr) as FL_ColorChooserModes

declare function Fl_Color_ChooserRGB(byval cc as Fl_Color_Chooser ptr,byval r as double,byval g as double,byval b as double) as long
declare function Fl_Color_ChooserR(byval cc as Fl_Color_Chooser ptr) as double
declare function Fl_Color_ChooserG(byval cc as Fl_Color_Chooser ptr) as double
declare function Fl_Color_ChooserB(byval cc as Fl_Color_Chooser ptr) as double

declare function Fl_Color_ChooserHSV(byval cc as Fl_Color_Chooser ptr,byval h as double,byval s as double,byval v as double) as long
declare function Fl_Color_ChooserHue(byval cc as Fl_Color_Chooser ptr) as double
declare function Fl_Color_ChooserSaturation(byval cc as Fl_Color_Chooser ptr) as double
declare function Fl_Color_ChooserValue(byval cc as Fl_Color_Chooser ptr) as double

declare sub      Fl_Color_ChooserHSV2RGB(byval cc as Fl_Color_Chooser ptr,byval h as double,byval s as double,byval v as double, byref r as double, byref g as double, byref b as double)
declare sub      Fl_Color_ChooserRGB2HSV(byval cc as Fl_Color_Chooser ptr,byval r as double,byval g as double,byval b as double, byref h as double, byref s as double, byref v as double)
#endif ' COLORCHOOSER

#ifndef NO_HELPVIEW
'#######################################
'# class Fl_Help_View extends Fl_Group #
'#######################################
declare function Fl_Help_ViewNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Help_View ptr
declare sub      Fl_Help_ViewDelete(byref hv as Fl_Help_View ptr)
declare sub      Fl_Help_ViewClearSelection(byval hv as Fl_Help_View ptr)
declare function Fl_Help_ViewDirectory(byval hv as Fl_Help_View ptr) as const zstring ptr
declare function Fl_Help_ViewFilename(byval hv as Fl_Help_View ptr) as const zstring ptr

declare function Fl_Help_ViewFind(byval hv as Fl_Help_View ptr,byval s as const zstring ptr,byval p as long=0) as long

declare sub      Fl_Help_ViewSetLeftLine(byval hv as Fl_Help_View ptr,byval LeftLine as long)
declare function Fl_Help_ViewGetLeftLine(byval hv as Fl_Help_View ptr) as long

declare sub      Fl_Help_ViewLink(byval hv as Fl_Help_View ptr,byval fn as Fl_Help_F)
declare function Fl_Help_ViewLoad(byval hv as Fl_Help_View ptr,byval filename as const zstring ptr) as long
declare sub      Fl_Help_ViewResize(byval hv as Fl_Help_View ptr,byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      Fl_Help_ViewSetScrollbarSize(byval hv as Fl_Help_View ptr,byval s as long)
declare function Fl_Help_ViewGetScrollbarSize(byval hv as Fl_Help_View ptr) as long

declare sub      Fl_Help_ViewSelectAll(byval hv as Fl_Help_View ptr)

declare sub      Fl_Help_ViewSetSize(byval hv as Fl_Help_View ptr,byval w as long,byval h as long)
declare function Fl_Help_ViewGetSize(byval hv as Fl_Help_View ptr) as long

declare sub      Fl_Help_ViewSetTextColor(byval hv as Fl_Help_View ptr,byval c as Fl_Color)
declare function Fl_Help_ViewGetTextColor(byval hv as Fl_Help_View ptr) as Fl_Color

declare sub      Fl_Help_ViewSetTextFont(byval hv as Fl_Help_View ptr,byval f as Fl_Font)
declare function Fl_Help_ViewGetTextFont(byval hv as Fl_Help_View ptr) as Fl_Font

declare sub      Fl_Help_ViewSetTextSize(byval hv as Fl_Help_View ptr,byval s as FL_FONTSIZE)
declare function Fl_Help_ViewGetTextSize(byval hv as Fl_Help_View ptr) as FL_FONTSIZE

declare function Fl_Help_ViewTitle(byval hv as Fl_Help_View ptr) as const zstring ptr

declare sub      Fl_Help_ViewTopline(byval hv as Fl_Help_View ptr,byval by_name as const zstring ptr)

declare sub      Fl_Help_ViewSetTopline(byval hv as Fl_Help_View ptr,byval pixel as long)
declare function Fl_Help_ViewGetTopline(byval hv as Fl_Help_View ptr) as long

declare sub      Fl_Help_ViewSetValue(byval hv as Fl_Help_View ptr,byval v as const zstring ptr)
declare function Fl_Help_ViewGetValue(byval hv as Fl_Help_View ptr) as const zstring ptr
#endif ' NO_HELPVIEW

'##########################################
'# class Fl_Input_Choice extends Fl_Group #
'##########################################
DeclareEx(Fl_Input_Choice)
declare function Fl_Input_ChoiceNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Input_Choice ptr
declare sub      Fl_Input_ChoiceDelete(byref ic as Fl_Input_Choice ptr)
declare sub      Fl_Input_ChoiceAdd(byval ic as Fl_Input_Choice ptr,byval s as const zstring ptr)
declare function Fl_Input_ChoiceChanged(byval ic as Fl_Input_Choice ptr) as long
declare sub      Fl_Input_ChoiceClear(byval ic as Fl_Input_Choice ptr)
declare sub      Fl_Input_ChoiceClearChanged(byval ic as Fl_Input_Choice ptr)

declare sub      Fl_Input_ChoiceSetDownBox(byval ic as Fl_Input_Choice ptr,byval b as Fl_Boxtype)
declare function Fl_Input_ChoiceGetDownBox(byval ic as Fl_Input_Choice ptr) as Fl_Boxtype

declare function Fl_Input_ChoiceInput(byval ic as Fl_Input_Choice ptr) as Fl_Input ptr

declare sub      Fl_Input_ChoiceSetMenu(byval ic as Fl_Input_Choice ptr,byval m as Fl_Menu_Item ptr)
declare function Fl_Input_ChoiceGetMenu(byval ic as Fl_Input_Choice ptr) as Fl_Menu_Item ptr

declare function Fl_Input_ChoiceMenuButton(byval ic as Fl_Input_Choice ptr) as Fl_Menu_Button ptr

declare sub      Fl_Input_ChoiceResize(byval ic as Fl_Input_Choice ptr,byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      Fl_Input_ChoiceSetChanged(byval ic as Fl_Input_Choice ptr)

declare sub      Fl_Input_ChoiceSetTextColor(byval ic as Fl_Input_Choice ptr,byval c as Fl_Color)
declare function Fl_Input_ChoiceGetTextColor(byval ic as Fl_Input_Choice ptr) as Fl_Color

declare sub      Fl_Input_ChoiceSetTextFont(byval ic as Fl_Input_Choice ptr,byval f as Fl_Font)
declare function Fl_Input_ChoiceGetTextFont(byval ic as Fl_Input_Choice ptr) as Fl_Font

declare sub      Fl_Input_ChoiceSetTextSize(byval ic as Fl_Input_Choice ptr,byval s as FL_FONTSIZE)
declare function Fl_Input_ChoiceGetTextSize(byval ic as Fl_Input_Choice ptr) as FL_FONTSIZE

declare sub      Fl_Input_ChoiceValue(byval ic as Fl_Input_Choice ptr,byval v as long)

declare sub      Fl_Input_ChoiceSetValue(byval ic as Fl_Input_Choice ptr,byval v as const zstring ptr)
declare function Fl_Input_ChoiceGetValue(byval ic as Fl_Input_Choice ptr) as const zstring ptr

'#####################################
'# class Fl_Spinner extends Fl_Group #
'#####################################
declare function Fl_SpinnerNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Spinner ptr
declare sub      Fl_SpinnerDelete(byref spi as Fl_Spinner ptr)
declare sub      Fl_SpinnerSetColor(byval spi as Fl_Spinner ptr,byval c as Fl_Color)
declare function Fl_SpinnerGetColor(byval spi as Fl_Spinner ptr) as Fl_Color

declare sub      Fl_SpinnerSetFormat(byval spi as Fl_Spinner ptr,byval f as const zstring ptr)
declare function Fl_SpinnerGetFormat(byval spi as Fl_Spinner ptr) as const zstring ptr

declare function Fl_SpinnerHandle(byval spi as Fl_Spinner ptr,byval e as Fl_Event) as long

declare sub      Fl_SpinnerSetMaximum(byval spi as Fl_Spinner ptr,byval m as double)
declare function Fl_SpinnerGetMaximum(byval spi as Fl_Spinner ptr) as double

declare sub      Fl_SpinnerSetMinimum(byval spi as Fl_Spinner ptr,byval m as double)
declare function Fl_SpinnerGetMinimum(byval spi as Fl_Spinner ptr) as double

declare sub      Fl_SpinnerRange(byval spi as Fl_Spinner ptr,byval a as double,byval b as double)

declare sub      Fl_SpinnerResize(byval spi as Fl_Spinner ptr,byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      Fl_SpinnerSetStep(byval spi as Fl_Spinner ptr,byval s as double)
declare function Fl_SpinnerGetStep(byval spi as Fl_Spinner ptr) as double

declare sub      Fl_SpinnerSetTextColor(byval spi as Fl_Spinner ptr,byval c as Fl_Color)
declare function Fl_SpinnerGetTextColor(byval spi as Fl_Spinner ptr) as Fl_color

declare sub      Fl_SpinnerSetTextFont(byval spi as Fl_Spinner ptr,byval f as Fl_Font)
declare function Fl_SpinnerGetTextFont(byval spi as Fl_Spinner ptr) as Fl_Font

declare sub      Fl_SpinnerSetTextSize(byval spi as Fl_Spinner ptr,byval s as FL_FONTSIZE)
declare function Fl_SpinnerGetTextSize(byval spi as Fl_Spinner ptr) as FL_FONTSIZE

declare sub      Fl_SpinnerSetType(byval spi as Fl_Spinner ptr,byval v as ubyte)
declare function Fl_SpinnerGetType(byval spi as Fl_Spinner ptr) as ubyte

declare sub      Fl_SpinnerSetValue(byval spi as Fl_Spinner ptr,byval v as double)
declare function Fl_SpinnerGetValue(byval spi as Fl_Spinner ptr) as double


#ifndef NO_TABLE
'###################################
'# class Fl_Table extends Fl_Group #
'###################################
declare function Fl_TableNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Table ptr
declare sub      Fl_TableDelete(byref t as Fl_Table ptr)
' The widget is removed from its current group (if any) and then added to the end of this group. 
declare sub      Fl_TableAdd(byval t as Fl_Table ptr,byval wgt as Fl_Widget ptr)

declare function Fl_TableArray(byval t as Fl_Table ptr) as Fl_Widget ptr const ptr

' Sets the current group so you can build the widget tree by just constructing the widgets. 
declare sub      Fl_TableBegin(byval t as Fl_Table ptr)
declare sub      Fl_TableEnd(byval t as Fl_Table ptr)

' Returns the current column and row inside the callback.
declare function Fl_TableCallbackCol(byval t as Fl_Table ptr) as long
declare function Fl_TableCallbackRow(byval t as Fl_Table ptr) as long
' Returns the current 'table context' inside the callback.
declare function Fl_TableCallbackContext(byval t as Fl_Table ptr) as FL_TABLECONTEXT

' Returns the number of children in the table. 
declare function Fl_TableChildren(byval t as Fl_Table ptr) as long
' Returns the child widget by an index. 
declare function Fl_TableChild(byval t as Fl_Table ptr,byval nChildIndex as long) as Fl_Widget ptr

' Clears the table to zero rows,columns and clears any widgets that were added with Fl_TableBegin()/Fl_TableEnd(). 
declare sub      Fl_TableClear(byval t as Fl_Table ptr)

' Enable or disable column headers.
declare sub      Fl_TableSetColHeader(byval t as Fl_Table ptr,byval bFlag as long)
' Returns if column headers are enabled or not.
declare function Fl_TableGetColHeader(byval t as Fl_Table ptr) as long

' Sets the color for column headers and redraws the table.
declare sub      Fl_TableSetColHeaderColor(byval t as Fl_Table ptr,byval c as Fl_Color)
' Gets the color for column headers.
declare function Fl_TableGetColHeaderColor(byval t as Fl_Table ptr) as Fl_Color

' Sets the height in pixels for column headers and redraws the table.
declare sub      Fl_TableSetColHeaderHeight(byval t as Fl_Table ptr,byval h as long)
' Gets the height in pixels for column headers
declare function Fl_TableGetColHeaderHeight(byval t as Fl_Table ptr) as long

' Sets the column scroll position to column 'col', and causes the screen to redraw. 
declare sub      Fl_TableSetColPosition(byval t as Fl_Table ptr,byval col as long)
' Gets the column scroll position.
declare function Fl_TableGetColPosition(byval t as Fl_Table ptr) as long

' Enable / disable column resizing by the user. 
declare sub      Fl_TableSetColResize(byval t as Fl_Table ptr,byval bFlag as long)
' Returns if column resizing by the user is enabled or not.
declare function Fl_TableGetColResize(byval t as Fl_Table ptr) as long

' Sets/Returns the current column minimum resize value.
declare sub      Fl_TableSetColResizeMin(byval t as Fl_Table ptr,byval m as long)
declare function Fl_TableGetColResizeMin(byval t as Fl_Table ptr) as long

' Sets the width of the specified column in pixels, and the table is redrawn. 
declare sub      Fl_TableSetColWidth(byval t as Fl_Table ptr,byval col as long,byval w as long)
' Returns the current width of the specified column in pixels.
declare function Fl_TableGetColWidth(byval t as Fl_Table ptr,byval col as long) as long
' Convenience method to set the width of all columns to the same value, in pixels. 
declare sub      Fl_TableColWidthAll(byval t as Fl_Table ptr,byval w as long)

' Set the number of columns in the table and redraw. 
declare sub      Fl_TableSetCols(byval t as Fl_Table ptr,byval nColumns as long)
' Get the number of columns in the table. 
declare function Fl_TableGetCols(byval t as Fl_Table ptr) as long

' Trigger as table callback.
declare sub      Fl_TableDoCallback(byval t as Fl_Table ptr,byval context as FL_TABLECONTEXT,byval r as long,byval c as long)

declare sub      Fl_TableDraw(byval t as Fl_Table ptr)

' Searches the child array for the widget and returns the index.
declare function Fl_TableFind(byval t as Fl_Table ptr,byval wgt as const Fl_Widget ptr) as long

' Sets/gets the region of cells selected (highlighted).
declare sub      Fl_TableSetSelection(byval t as Fl_Table ptr,byval row_top as long,byval col_left as long,byval row_bot as long,byval col_right as long)
declare sub      Fl_TableGetSelection(byval t as Fl_Table ptr,byref row_top as long,byref col_left as long,byref row_bot as long,byref col_right as long)

' Resets the internal array of widget sizes and positions.
declare sub      Fl_TableInitSizes(byval t as Fl_Table ptr)
' The widget is removed from its current group (if any) and then inserted into this group.
declare sub      Fl_TableInsert(byval t as Fl_Table ptr,byval wgt as Fl_Widget ptr,byval n as long)
' This does Fl_TableInsert(w2, Fl_TbleFind(w1)) before.
declare sub      Fl_TableInsert2(byval t as Fl_Table ptr,byval w1 as Fl_Widget ptr,byval w2 as Fl_Widget ptr)
' Returns 1 if someone is interactively resizing a row or column.
declare function Fl_TableIsInteractiveResize(byval t as Fl_Table ptr) as long

' See if the cell at row and column is selected. 
declare function Fl_TableIsSelected(byval t as Fl_Table ptr,byval row as long,byval col as long) as long
' 
declare function Fl_TableMoveCursor(byval t as Fl_Table ptr,byval ror as long,byval col as long) as long

' Removes a widget from the group but does not delete it.
declare sub      Fl_TableRemove(byval t as Fl_Table ptr,byval wgt as Fl_Widget ptr)

' Changes the size of the Fl_Table, causing it to redraw. 
declare sub      Fl_TableResize(byval t as Fl_Table ptr,byval x as long,byval y as long,byval w as long,byval h as long)

' Sets/Returns enables/disables showing the row headers. 
declare sub      Fl_TableSetRowHeader(byval t as Fl_Table ptr,byval flag as long)
declare function Fl_TableGetRowHeader(byval t as Fl_Table ptr) as long

' Sets the row header color and causes the screen to redraw.
declare sub      Fl_TableSetRowHeaderColor(byval t as Fl_Table ptr,byval c as Fl_Color)
' Returns the current row header color.
declare function Fl_TableGetRowHeaderColor(byval t as Fl_Table ptr) as Fl_Color

' Sets width in pixels for row headers and redraws the table.
declare sub      Fl_TableSetRowHeaderWidth(byval t as Fl_Table ptr,byval w as long)
' Returns the current row header width (in pixels).
declare function Fl_TableGetRowHeaderWidth(byval t as Fl_Table ptr) as long

' Sets the height of the specified row in pixels, and the table is redrawn.
declare sub      Fl_TableSetRowHeight(byval t as Fl_Table ptr,byval row as long,byval h as long)
' Returns the current height of the specified row in pixels.
declare function Fl_TableGetRowHeight(byval t as Fl_Table ptr,byval row as long) as long

' Convenience method to set the height of all rows to the same value, in pixels. 
declare sub      Fl_TableRowHeightAll(byval t as Fl_Table ptr,byval h as long)

' Sets the row scroll position to 'row' and causes the screen to redraw. 
declare sub      Fl_TableSetRowPosition(byval t as Fl_Table ptr,byval row as long)
' Returns the current row scroll position as a row number. 
declare function Fl_TableGetRowPosition(byval t as Fl_Table ptr) as long

' Sets/Returns allows/disallows row resizing by the user. 
declare sub      Fl_TableSetRowResize(byval t as Fl_Table ptr,byval bFlag as long)
declare function Fl_TableGetRowResize(byval t as Fl_Table ptr) as long

' Sets/Gets the current row minimum resize value. 
declare sub      Fl_TableSetRowResizeMin(byval t as Fl_Table ptr,byval m as long)
declare function Fl_TableGetRowResizeMin(byval t as Fl_Table ptr) as long

' Sets the number of rows in the table, and the table is redrawn.
declare sub      Fl_TableSetRows(byval t as Fl_Table ptr,byval r as long)
declare function Fl_TableGetRows(byval t as Fl_Table ptr) as long

' Sets/gets the kind of box drawn around the data table, the default being FL_NO_BOX. 
declare sub      Fl_TableSetTableBox(byval t as Fl_Table ptr,byval bt as Fl_Boxtype)
declare function Fl_TableGetTableBox(byval t as Fl_Table ptr) as Fl_Boxtype

' Sets which row should be at the top of the table, scrolling as necessary, and the table is redrawn. 
declare sub      Fl_TableSetTopRow(byval t as Fl_Table ptr,byval row as long)
' Returns the current top row shown in the table.
declare function Fl_TableGetTopRow(byval t as Fl_Table ptr) as long

' Returns the range of row and column numbers for all visible and partially visible cells in the table.
declare sub      Fl_TableVisibleCells(byval t as Fl_Table ptr, byref r1 as long, byref r2 as long, byref c1 as long, byref c2 as long)

declare sub      Fl_TableWhen(byval t as Fl_Table ptr,byval flags as FL_WHEN)

'#####################################
'# class Fl_TableEx extends Fl_Table #
'#####################################
declare function Fl_TableExNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_TableEx ptr
declare function Fl_TableExHandleBase   (byval tex as Fl_TableEx ptr,byval event as Fl_Event) as long
declare function Fl_TableExFindCell     (byval tex as Fl_TableEx ptr,byval ctx as FL_TABLECONTEXT,byval r as long,byval c as long,byref x as long,byref y as long,byref w as long, byref h as long) as long
declare sub      Fl_TableExSetDrawCB    (byval tex as Fl_TableEx ptr,byval cb as Fl_DrawEx)
declare sub      Fl_TableExSetDrawCellCB(byval tex as Fl_TableEx ptr,byval cb as Fl_DrawcellEx)
declare sub      Fl_TableExSetHandleCB  (byval tex as Fl_TableEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_TableExSetResizeCB  (byval tex as Fl_TableEx ptr,byval cb as Fl_ResizeEx)

'#######################################
'# class Fl_Table_Row extends Fl_Table #
'#######################################
declare function Fl_Table_RowNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Table_Row ptr
declare sub      Fl_Table_RowClear(byval tr as Fl_Table_Row ptr)
' Checks to see if 'row' is selected. 
declare function Fl_Table_RowRowSelected(byval tr as Fl_Table_Row ptr,byval r as long) as long
' Sets the number of rows in the table, and the table is redrawn. 
declare sub      Fl_Table_RowSetRows(byval tr as Fl_Table_Row ptr,byval nRows as long)
' Returns the number of rows in the table. 
declare function Fl_Table_RowGetRows(byval tr as Fl_Table_Row ptr) as long
' This convenience function changes the selection state for all rows based on 'flag'
declare sub      Fl_Table_RowSelectAllRows(byval tr as Fl_Table_Row ptr,byval flag as long=1)
' Changes the selection state for 'row', depending on the value of 'flag'.
declare function Fl_Table_RowSelectRow(byval tr as Fl_Table_Row ptr,byval row as long,byval  flag as long=1) as long
' Sets/Gets the table selection mode. 
declare sub      Fl_Table_RowSetType(byval tr as Fl_Table_Row ptr,byval m as Fl_TableRowSelectMode)
declare function Fl_Table_RowGetType(byval tr as Fl_Table_Row ptr) as Fl_TableRowSelectMode

'#############################################
'# class Fl_Table_RowEx extends Fl_Table_Row #
'#############################################
declare function Fl_Table_RowExNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Table_RowEx ptr
declare function Fl_Table_RowExHandleBase   (byval tex as Fl_Table_RowEx ptr,byval event as Fl_Event) as long
declare function Fl_Table_RowExFindCell     (byval tex as Fl_Table_RowEx ptr,byval ctx as FL_TABLECONTEXT,byval r as long,byval c as long,byref x as long,byref y as long,byref w as long, byref h as long) as long
declare sub      Fl_Table_RowExSetDrawCB    (byval tex as Fl_Table_RowEx ptr,byval cb as Fl_DrawEx)
declare sub      Fl_Table_RowExSetDrawCellCB(byval tex as Fl_Table_RowEx ptr,byval cb as Fl_DrawcellEx)
declare sub      Fl_Table_RowExSetHandleCB  (byval tex as Fl_Table_RowEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_Table_RowExSetResizeCB  (byval tex as Fl_Table_RowEx ptr,byval cb as Fl_ResizeEx)
#endif ' NO_TABLE

#ifndef NO_TABS
'##################################
'# class Fl_Tabs extends Fl_Group #
'##################################
DeclareEx(Fl_Tabs)
' Creates a new Fl_Tabs widget using the given position, size, and label string.
declare function Fl_TabsNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Tabs ptr
declare sub      Fl_TabsdDelete(byref tbs as Fl_Tabs ptr)
declare function Fl_TabsHandle(byval tbs as Fl_Tabs ptr,byval event as Fl_Event) as long
' Returns the position and size available to be used by its children.
declare sub      Fl_TabsClientArea(byval tbs as Fl_Tabs ptr, byref rx as long, byref ry as long, byref rw as long, byref rh as long,byval tabh as long=0)
' This is called by the tab widget's handle() method to set the tab group widget the user last FL_PUSH'ed on.
declare function Fl_TabsSetPush(byval tbs as Fl_Tabs ptr,byval wgt as Fl_Widget ptr) as long
' Returns the tab group for the tab the user has currently down-clicked on and remains over until FL_RELEASE.
declare function Fl_TabsGetPush(byval tbs as Fl_Tabs ptr) as Fl_Widget ptr
' Sets the widget to become the current visible widget/tab.
declare function Fl_TabsSetValue(byval tbs as Fl_Tabs ptr,byval wgt as Fl_Widget ptr) as long
' Gets the currently visible widget/tab.
declare function Fl_TabsGetValue(byval tbs as Fl_Tabs ptr) as Fl_Widget ptr
' Return the widget of the tab the user clicked on at event_x / event_y.
declare function Fl_TabsWhich(byval tbs as Fl_Tabs ptr,byval event_x as long,byval event_y as long) as Fl_Widget ptr
#define Fl_TabsEnd Fl_GroupEnd
#define Fl_TabNew Fl_GroupNew
#define Fl_TabBegin Fl_GroupBegin
#define Fl_TabEnd Fl_GroupEnd

#endif ' NO_TABS

#ifndef NO_TEXT
'#######################################################
'# class Fl_Text_Selection are used by Fl_Text_Display #
'#######################################################
' Return the byte offset to the character after the last selected character. 
declare function Fl_Text_SelectionEnd(byval ts as Fl_Text_Selection ptr) as long
' Return true if position pos with indentation dispIndex is in the Fl_Text_Selection. 
declare function Fl_Text_SelectionIncludes(byval ts as Fl_Text_Selection ptr,byval pos_ as long) as long

' Modify the 'selected' flag. 
declare sub      Fl_Text_SelectionSetSelected(byval ts as Fl_Text_Selection ptr,byval b as long)
' Returns true if any text is selected. 
declare function Fl_Text_SelectionGetSelected(byval ts as Fl_Text_Selection ptr) as long

' Set the selection range. 
declare sub      Fl_Text_SelectionSet(byval ts as Fl_Text_Selection ptr,byval start as long,byval end_ as long)
' Return the positions of this selection. 
declare function Fl_Text_SelectionPosition(byval ts as Fl_Text_Selection ptr,byval pStart as long ptr,byval pEnd as long ptr) as long
' Return the byte offset to the first selected character. 
declare function Fl_Text_SelectionStart(byval ts as Fl_Text_Selection ptr) as long
' Updates a selection afer text was modified. 
declare sub      Fl_Text_SelectionUpdate(byval ts as Fl_Text_Selection ptr,byval p as long,byval nDeleted as long,byval nInserted as long)

'################################################
'# class Fl_Text_Buffer used by Fl_Text_Display #
'################################################
' Create an empty text buffer.
declare function Fl_Text_BufferNew(byval requestedSize as long=0,byval preferredGapSize as long=1024) as Fl_Text_buffer ptr
' Frees a text buffer.
declare sub      Fl_Text_BufferDelete(byref tb as Fl_Text_Buffer ptr)

' Adds a callback function that is called whenever the text buffer is modified. 
declare sub      Fl_Text_BufferAddModifyCallback(byval tb as Fl_Text_Buffer ptr,byval cb as Fl_Text_Modify_Cb,byval cbArg as any ptr)
declare sub      Fl_Text_BufferRemoveModifyCallback(byval tb as Fl_Text_Buffer ptr,byval cb as Fl_Text_Modify_Cb,byval cbArg as any ptr)
' Calls all modify callbacks that have been registered using the add_modify_callback() method. 
declare sub      Fl_Text_BufferCallModifyCallbacks(byval tb as Fl_Text_Buffer ptr)

' Adds a callback routine to be called before text is deleted from the buffer. 
declare sub      Fl_Text_BufferAddPredeleteCallback(byval tb as Fl_Text_Buffer ptr,byval cb as Fl_Text_Predelete_Cb,byval cbArg as any ptr)
declare sub      Fl_Text_BufferRemovePredeleteCallback(byval tb as Fl_Text_Buffer ptr,byval cb as Fl_Text_Predelete_Cb,byval cbArg as any ptr)
' Calls the stored pre-delete callback procedure(s) for this buffer to update the changed area(s) on the screen and any other listeners. 
declare sub      Fl_Text_BufferCallPredeleteCallbacks(byval tb as Fl_Text_Buffer ptr)

' Loads a text file into the buffer.
declare function Fl_Text_BufferLoadFile  (byval tb as Fl_Text_Buffer ptr,byval file as const zstring ptr,byval buflen as long = 128*1024) as long
' Saves a text file from the current buffer.
declare function Fl_Text_BufferSaveFile  (byval tb as Fl_Text_Buffer ptr,byval file as const zstring ptr,byval buflen as long = 128*1024) as long
' 
declare function Fl_Text_BufferOutputFile(byval tb as Fl_Text_Buffer ptr,byval file as const zstring ptr,byval start as long,byval end_ as long,byval buflen as long = 128*1024) as long
' Appends the named file to the end of the buffer.
declare function Fl_Text_BufferAppendFile(byval tb as Fl_Text_Buffer ptr,byval file as const zstring ptr,byval buflen as long = 128*1024) as long
' Inserts a file at the specified position.
declare function Fl_Text_BufferInsertFile(byval tb as Fl_Text_Buffer ptr,byval file as const zstring ptr,byval p as long,byval buflen as long = 128*1024) as long

' Appends the text string to the end of the buffer. 
declare sub      Fl_Text_BufferAppend(byval tb as Fl_Text_Buffer ptr,byval text as const zstring ptr)
' Inserts null-terminated string text at position pos. 
declare sub      Fl_Text_BufferInsert(byval tb as Fl_Text_Buffer ptr,byval pos_ as long,byval text as const zstring ptr)

' Returns the number of bytes in the buffer.
declare function Fl_Text_BufferLength(byval tb as Fl_Text_Buffer ptr) as long

' Convert a byte offset in buffer into a memory address. 
declare function Fl_Text_BufferAddress (byval tb as Fl_Text_Buffer ptr,byval p as long) as zstring ptr
declare function Fl_Text_BufferAddress2(byval tb as Fl_Text_Buffer ptr,byval p as long) as const zstring ptr

' Returns the raw byte at the specified position pos in the buffer. 
declare function Fl_Text_BufferByteAt(byval tb as Fl_Text_Buffer ptr,byval p as long) as ubyte
' Returns the character at the specified position pos in the buffer. 
declare function Fl_Text_BufferCharAt(byval tb as Fl_Text_Buffer ptr,byval p as long) as ulong

' Lets the undo system know if we can undo changes.
declare sub      Fl_Text_BufferCanUndo(byval tb as Fl_Text_Buffer ptr,byval flag as byte=1)

' Copies text from one buffer to this one. 
declare sub      Fl_Text_BufferCopy(byval tb as Fl_Text_Buffer ptr,byval from as Fl_Text_Buffer ptr,byval fromStart as long,byval fromEnd as long,byval toPos as long)

' Count the number of displayed characters between buffer position lineStartPos and targetPos. 
declare function Fl_Text_BufferCountDisplayedCharacters(byval tb as Fl_Text_Buffer ptr,byval lineStartPos as long,byval targetPos as long) as long
' Counts the number of newlines between startPos and endPos in buffer. 
declare function Fl_Text_BufferCountLines(byval tb as Fl_Text_Buffer ptr,byval startPos as long,byval endPos as long) as long

' Search backwards in buffer buf for character searchChar, starting with the character BEFORE startPos, returning the result in foundPos returns 1 if found, 0 if not. 
declare function Fl_Text_BufferFindCharBackward(byval tb as Fl_Text_Buffer ptr,byval startPos as long,byval searchChar as ulong,byval pFoundPos as long ptr) as long
' Finds the next occurrence of the specified character. 
declare function Fl_Text_BufferFindCharForward(byval tb as Fl_Text_Buffer ptr,byval startPos as long,byval searchChar as ulong,byval pFoundPos as long ptr) as long

' Highlights the specified text within the buffer. 
declare sub      Fl_Text_BufferSetHighlight(byval tb as Fl_Text_Buffer ptr,byval start as long,byval end_ as long)

' Returns the highlighted text. 
declare function Fl_Text_BufferGetHighlight(byval tb as Fl_Text_Buffer ptr) as long

' Highlights the specified text between start and end within the buffer. 
declare function Fl_Text_BufferHighlightPosition(byval tb as Fl_Text_Buffer ptr,byval pStart as long ptr,byval pEnd as long ptr) as long

' Returns the current highlight selection. 
declare function Fl_Text_BufferHighlightSelection(byval tb as Fl_Text_Buffer ptr) as const Fl_Text_Selection ptr

' Returns the highlighted text. 
declare function Fl_Text_BufferHighlightText(byval tb as Fl_Text_Buffer ptr) as zstring ptr

' Finds and returns the position of the end of the line containing position pos
' (which is either a pointer to the newline character ending the line, or a pointer to one character beyond the end of the buffer) 
declare function Fl_Text_BufferLineEnd(byval tb as Fl_Text_Buffer ptr,byval p as long) as long

' Returns the position of the start of the line containing position pos.
declare function Fl_Text_BufferLineStart(byval tb as Fl_Text_Buffer ptr,byval p as long) as long

' Returns the text from the entire line containing the specified character position. 
declare function Fl_Text_BufferLineText(byval tb as Fl_Text_Buffer ptr,byval p as long) as zstring ptr

' Returns the index of the next character. 
declare function Fl_Text_BufferNextChar(byval tb as Fl_Text_Buffer ptr,byval ix as long) as long
declare function Fl_Text_BufferNextCharClipped(byval tb as Fl_Text_Buffer ptr,byval ix as long) as long

' Returns the index of the previous character. 
declare function Fl_Text_BufferPrevChar(byval tb as Fl_Text_Buffer ptr,byval ix as long) as long
declare function Fl_Text_BufferPrevCharClipped(byval tb as Fl_Text_Buffer ptr,byval ix as long) as long

' Deletes a range of characters in the buffer. 
declare sub      Fl_Text_BufferRemove(byval tb as Fl_Text_Buffer ptr,byval start as long,byval end_ as long)
' Deletes the characters between start and end, and inserts the null-terminated string text in their place in the buffer. 
declare sub      Fl_Text_BufferReplace(byval tb as Fl_Text_Buffer ptr,byval start as long,byval end_ as long,byval text as const zstring ptr)

' Removes the text in the primary selection. 
declare sub      Fl_Text_BufferRemoveSelection(byval tb as Fl_Text_Buffer ptr)
' Removes the text from the buffer corresponding to the secondary text selection object. 
declare sub      Fl_Text_BufferRemoveSecondarySelection(byval tb as Fl_Text_Buffer ptr)

' Replaces the text in the primary selection. 
declare sub      Fl_Text_BufferReplaceSelection(byval tb as Fl_Text_Buffer ptr,byval text as const zstring ptr)
' Replaces the text from the buffer corresponding to the secondary text selection object with the new string text.
declare sub      Fl_Text_BufferReplaceSecondarySelection(byval tb as Fl_Text_Buffer ptr,byval text as const zstring ptr)

' Finds and returns the position of the first character of the line nLines backwards from startPos
' (not counting the character pointed to by startpos if that is a newline) in the buffer. 
declare function Fl_Text_BufferRewindLines(byval tb as Fl_Text_Buffer ptr,byval startPos as long,byval nLines as long) as long

' Search backwards in buffer for string searchCharssearchString, starting with the character BEFORE startPos, returning the result in foundPos returns 1 if found, 0 if not. 
declare function Fl_Text_BufferSearchBackward(byval tb as Fl_Text_Buffer ptr,byval startPos as long,byval searchString as const zstring ptr,byval pFoundPos as long ptr,byval matchCase as long=0) as long
' Search forwards in buffer for string searchString, starting with the character startPos, and returning the result in foundPos returns 1 if found, 0 if not. 
declare function Fl_Text_BufferSearchForward(byval tb as Fl_Text_Buffer ptr,byval startPos as long,byval searchString as const zstring ptr,byval pFoundPos as long ptr,byval matchCase as long=0) as long

' Returns the primary selection. 
declare function Fl_Text_BufferPrimarySelection(byval tb as Fl_Text_Buffer ptr) as Fl_Text_Selection ptr
declare function Fl_Text_BufferPrimarySelection2(byval tb as Fl_Text_Buffer ptr) as const Fl_Text_Selection ptr

' Selects a range of characters in the buffer.
declare sub      Fl_Text_BufferSelect(byval tb as Fl_Text_Buffer ptr,byval start as long,byval end_ as long)
' Returns a non 0 value if text has been selected, 0 otherwise.
declare function Fl_Text_BufferSelected(byval tb as Fl_Text_Buffer ptr) as long
' Gets the selection position.
declare function Fl_Text_BufferSelectionPosition(byval tb as Fl_Text_Buffer ptr,byval start as long ptr,byval end_ as long ptr) as long
' Returns the currently selected text.
declare function Fl_Text_BufferSelectionText(byval tb as Fl_Text_Buffer ptr) as zstring ptr

' Returns the secondary selection. 
declare function Fl_Text_BufferSecondarySelection(byval tb as Fl_Text_Buffer ptr) as const Fl_Text_Selection ptr
' Selects a range of characters in the secondary selection. 
declare sub      Fl_Text_BufferSecondarySelect(byval tb as Fl_Text_Buffer ptr,byval start as long,byval end_ as long)
' Returns a non 0 value if text has been selected in the secondary text selection, 0 otherwise. 
declare function Fl_Text_BufferSecondarySelected(byval tb as Fl_Text_Buffer ptr) as long
' Returns the current selection in the secondary text selection object.
declare function Fl_Text_BufferSecondarySelectionPosition(byval tb as Fl_Text_Buffer ptr,byval start as long ptr,byval end_ as long ptr) as long
' Returns the text in the secondary selection. 
declare function Fl_Text_BufferSecondarySelectionText(byval tb as Fl_Text_Buffer ptr) as zstring ptr
' Clears any selection in the secondary text selection object.
declare sub      Fl_Text_BufferSecondaryUnselect(byval tb as Fl_Text_Buffer ptr)

' Count forward from buffer position startPos in displayed characters 
' (displayed characters are the characters shown on the screen to represent characters in the buffer, where tabs and control characters are expanded) 
declare function Fl_Text_BufferSkipDisplayedCharacters(byval tb as Fl_Text_Buffer ptr,byval lineStartPos as long,byval nChars as long) as long
' Finds the first character of the line nLines forward from startPos in the buffer and returns its position.
declare function Fl_Text_BufferSkipLines(byval tb as Fl_Text_Buffer ptr,byval startPos as long,byval nLines as long) as long
' Set the hardware tab distance (width) used by all displays for this buffer, and used in computing offsets for rectangular selection operations. 
declare sub      Fl_Text_BufferSetTabDistance(byval tb as Fl_Text_Buffer ptr,byval tabDist as long)
' Gets the tab width.
declare function Fl_Text_BufferGetTabDistance(byval tb as Fl_Text_Buffer ptr) as long

' Replaces the entire contents of the text buffer.
declare sub      Fl_Text_BufferSetText(byval tb as Fl_Text_Buffer ptr,byval text as const zstring ptr=0)
' Get a copy of the entire contents of the text buffer.
declare function Fl_Text_BufferGetText(byval tb as Fl_Text_Buffer ptr) as zstring ptr

' Get a copy of a part of the text buffer.
declare function Fl_Text_BufferTextRange(byval tb as Fl_Text_Buffer ptr,byval start as long,byval end_ as long) as zstring ptr
' Undo text modification according to the undo variables or insert text from the undo buffer. 
declare function Fl_Text_BufferUndo(byval tb as Fl_Text_Buffer ptr,byval cp as long ptr=0) as long

' Unhighlights text in the buffer.
declare sub      Fl_Text_BufferUnhighlight(byval tb as Fl_Text_Buffer ptr)

' Cancels any previous selection on the primary text selection object.
declare sub      Fl_Text_BufferUnselect(byval tb as Fl_Text_Buffer ptr)

' Align an index into the buffer to the current or previous utf8 boundary. 
declare function Fl_Text_BufferUtf8Align(byval tb as Fl_Text_Buffer ptr,byval a as long) as long

' Returns the position corresponding to the end of the word.
declare function Fl_Text_BufferWordEnd(byval tb as Fl_Text_Buffer ptr,byval p as long) as long
' Returns the position corresponding to the start of the word.
declare function Fl_Text_BufferWordStart(byval tb as Fl_Text_Buffer ptr,byval p as long) as long

'##########################################
'# class Fl_Text_Display extends Fl_Group #
'##########################################
DeclareEx(Fl_Text_Display)
declare function Fl_Text_DisplayNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Text_Display ptr
declare sub      Fl_Text_DisplayDelete(byref td as Fl_Text_Display ptr)
declare function Fl_Text_DisplayHandle(byval td as Fl_Text_Display ptr,byval event as Fl_Event) as long

' Attach a text buffer to display, replacing the current buffer (if any) 
declare sub      Fl_Text_DisplaySetBuffer(byval td as Fl_Text_Display ptr,byval pTextbuf as Fl_Text_Buffer ptr)
' Gets the current text buffer associated with the text widget. 
declare function Fl_Text_DisplayGetBuffer(byval td as Fl_Text_Display ptr) as Fl_Text_Buffer ptr

' Attach (or remove) highlight information in text display and redisplay. 
declare sub      Fl_Text_DisplayHighlightData(byval td as Fl_Text_Display ptr,byval pStylebuf as Fl_Text_Buffer ptr,byval pStyles as Style_Table_Entry ptr,byval nStyles as long, _
                                              byval unfinishedStyle as byte=0,byval cb as Unfinished_Style_Cb=0,byval cbArg as any ptr=0)
' Count the number of lines between two positions. 
declare function Fl_Text_DisplayCountLines(byval td as Fl_Text_Display ptr,byval start as long,byval end_ as long,byval start_pos_is_line_start as byte) as long

' Sets/Gets the text cursor color. 
declare sub      Fl_Text_DisplaySetCursorColor(byval td as Fl_Text_Display ptr,byval c as Fl_Color)
declare function Fl_Text_DisplayGetCursorColor(byval td as Fl_Text_Display ptr) as Fl_Color

' Sets the text cursor style. 
declare sub      Fl_Text_DisplayCursorStyle(byval td as Fl_Text_Display ptr,byval style as FL_TEXT_DISPLAY_CURSOR_SHAPE)

' Hides the text cursor. 
declare sub      Fl_Text_DisplayHideCursor(byval td as Fl_Text_Display ptr)
' Shows the text cursor. (This function may trigger a redraw.)
declare sub      Fl_Text_DisplayShowCursor(byval td as Fl_Text_Display ptr,byval b as long=1)

' Check if a pixel position is within the primary selection.
declare function Fl_Text_DisplayInSelection(byval td as Fl_Text_Display ptr,byval x as long,byval y as long) as long
' Inserts "text" at the current cursor location. 
declare sub      Fl_Text_DisplayInsert(byval td as Fl_Text_Display ptr,byval text as const zstring ptr)

' Sets the position of the text insertion cursor for text display. 
declare sub      Fl_Text_DisplaySetInsertPosition(byval td as Fl_Text_Display ptr,byval newPos as long)
' Gets the position of the text insertion cursor for text display. 
declare function Fl_Text_DisplayGetInsertPosition(byval td as Fl_Text_Display ptr) as long

' Returns the end of a line.
declare function Fl_Text_DisplayLineEnd(byval td as Fl_Text_Display ptr,byval startPos as long,byval startPosIsLineStart as byte) as long
' Return the beginning of a line.
declare function Fl_Text_DisplayLineStart(byval td as Fl_Text_Display ptr,byval p as long) as long

' Moves the current insert position down / up one line. 
declare function Fl_Text_DisplayMoveDown(byval td as Fl_Text_Display ptr) as long
declare function Fl_Text_DisplayMoveUp(byval td as Fl_Text_Display ptr) as long

' Moves the current insert position left / right one character. 
declare function Fl_Text_DisplayMoveLeft(byval td as Fl_Text_Display ptr) as long
declare function Fl_Text_DisplayMoveRight(byval td as Fl_Text_Display ptr) as long

' Moves the current insert position right / left one word. 
declare sub      Fl_Text_DisplayNextWord(byval td as Fl_Text_Display ptr)
declare sub      Fl_Text_DisplayPreviousWord(byval td as Fl_Text_Display ptr)

' Replaces text at the current insert position.
declare sub      Fl_Text_DisplayOverStrike(byval td as Fl_Text_Display ptr,byval text as const zstring ptr)

' Find the correct style for a character. 
declare function Fl_Text_DisplayPositionStyle(byval td as Fl_Text_Display ptr,byval lineStartPos as long,byval lineLen as long,byval lineIndex as long) as long

' Convert a character index into a pixel position. 
declare function Fl_Text_DisplayPositionToXY(byval td as Fl_Text_Display ptr,byval p as long,byval x as long ptr,byval y as long ptr) as long

' Marks text from start to end as needing a redraw. 
declare sub      Fl_Text_DisplayRedisplayRange(byval td as Fl_Text_Display ptr,byval start as long,byval end_ as long)
' Change the size of the displayed text area.
declare sub      Fl_Text_DisplayResize(byval td as Fl_Text_Display ptr,byval x as long,byval y as long,byval w as long,byval h as long)
' Skip a number of lines back.
declare function Fl_Text_DisplayRewindLines(byval td as Fl_Text_Display ptr,byval startPos as long,byval nLines as long) as long
' Scrolls the current buffer to start at the specified line and column.
declare sub      Fl_Text_DisplayScroll(byval td as Fl_Text_Display ptr,byval topLineNum as long,byval horizOffset as long)

' Sets / gets the scrollbar alignment type. 
declare sub      Fl_Text_DisplaySetScrollbarAlign(byval td as Fl_Text_Display ptr,byval a as Fl_Align)
declare function Fl_Text_DisplayGetScrollbarAlign(byval td as Fl_Text_Display ptr) as Fl_Align
' Sets / gets the width/height of the scrollbars. 
declare sub      Fl_Text_DisplaySetScrollbarWidth(byval td as Fl_Text_Display ptr,byval w as long)
declare function Fl_Text_DisplayGetScrollbarWidth(byval td as Fl_Text_Display ptr) as long

' Sets / gets the new shortcut key.
declare sub      Fl_Text_DisplaySetShortcut(byval td as Fl_Text_Display ptr,byval s as long)
declare function Fl_Text_DisplayGetShortcut(byval td as Fl_Text_Display ptr) as long

' Scrolls the text buffer to show the current insert position.
declare sub      Fl_Text_DisplayShowInsertPosition(byval td as Fl_Text_Display ptr)

' Skip a number of lines forward.
declare function Fl_Text_DisplaySkipLines(byval td as Fl_Text_Display ptr,byval startPos as long,byval nLines as long,byval startPosIsLineStart as byte) as long

' Sets / gets the default color of text in the widget. 
declare sub      Fl_Text_DisplaySetTextColor(byval td as Fl_Text_Display ptr,byval c as Fl_Color)
declare function Fl_Text_DisplayGetTextColor(byval td as Fl_Text_Display ptr) as Fl_Color

' Sets / gets the default font used when drawing text in the widget. 
declare sub      Fl_Text_DisplaySetTextFont(byval td as Fl_Text_Display ptr,byval f as Fl_Font)
declare function Fl_Text_DisplayGetTextFont(byval td as Fl_Text_Display ptr) as Fl_Font

' Sets / gets the default size of text in the widget. 
declare sub      Fl_Text_DisplaySetTextSize(byval td as Fl_Text_Display ptr,byval s as FL_FONTSIZE)
declare function Fl_Text_DisplayGetTextSize(byval td as Fl_Text_Display ptr) as FL_FONTSIZE

' Moves the insert position to the beginning / end of the current word. 
declare function Fl_Text_DisplayWordStart(byval td as Fl_Text_Display ptr,byval pos_ as long) as long
declare function Fl_Text_DisplayWordEnd(byval td as Fl_Text_Display ptr,byval pos_ as long) as long

' Set the new text wrap mode.
declare sub      Fl_Text_DisplayWrapMode(byval td as Fl_Text_Display ptr,byval wrap as FL_TEXT_DISPLAY_WRAP_MODE,byval wrap_margin as long)
' Nobody knows what this function does. 
declare function Fl_Text_DisplayWrappedColumn(byval td as Fl_Text_Display ptr,byval row as long,byval column as long) as long
declare function Fl_Text_DisplayWrappedRow(byval td as Fl_Text_Display ptr,byval row as long) as long

' Convert an x pixel position into a column number and vice versa.
declare function Fl_Text_DisplayXToCol(byval td as Fl_Text_Display ptr,byval x as double) as double
declare function Fl_Text_DisplayColToX(byval td as Fl_Text_Display ptr,byval col as double) as double

declare sub      Fl_Text_DisplaySetLinenumberAlign(byval td as Fl_Text_Display ptr,byval aligm as Fl_Align)
declare function Fl_Text_DisplayGetLinenumberAlign(byval td as Fl_Text_Display ptr) as Fl_Align

declare sub      Fl_Text_DisplaySetLinenumberBGColor(byval td as Fl_Text_Display ptr,byval c as Fl_Color)
declare function Fl_Text_DisplayGetLinenumberBGColor(byval td as Fl_Text_Display ptr) as Fl_Color

declare sub      Fl_Text_DisplaySetLinenumberFGColor(byval td as Fl_Text_Display ptr,byval c as Fl_Color)
declare function Fl_Text_DisplayGetLinenumberFGColor(byval td as Fl_Text_Display ptr) as Fl_Color

declare sub      Fl_Text_DisplaySetLinenumberFont(byval td as Fl_Text_Display ptr,byval f as Fl_Font)
declare function Fl_Text_DisplayGetLinenumberFont(byval td as Fl_Text_Display ptr) as Fl_Font

declare sub      Fl_Text_DisplaySetLinenumberFormat(byval td as Fl_Text_Display ptr,byval fmt as const zstring ptr)
declare function Fl_Text_DisplayGetLinenumberFormat(byval td as Fl_Text_Display ptr) as const zstring ptr

declare sub      Fl_Text_DisplaySetLinenumberSize(byval td as Fl_Text_Display ptr,byval s as Fl_Fontsize)
declare function Fl_Text_DisplayGetLinenumberSize(byval td as Fl_Text_Display ptr) as Fl_Fontsize

declare sub      Fl_Text_DisplaySetLinenumberWidth(byval td as Fl_Text_Display ptr,byval w as long)
declare function Fl_Text_DisplayGetLinenumberWidth(byval td as Fl_Text_Display ptr) as long


'################################################
'# class Fl_Text_Editor extends Fl_Text_Display #
'################################################
DeclareEx(Fl_Text_Editor)
declare function Fl_Text_EditorNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Text_Editor ptr
declare sub      Fl_Text_EditorDelete(byref te as Fl_Text_Editor ptr)
declare function Fl_Text_EditorHandle(byval te as Fl_Text_Editor ptr,byval e as Fl_Event) as long

declare sub      Fl_Text_EditorAddDefaultKeyBindings(byval te as Fl_Text_Editor ptr,byval list as Key_Binding ptr ptr)

declare sub      Fl_Text_EditorAddKeyBinding(byval te as Fl_Text_Editor ptr,byval key as long,byval state as long,byval f as Key_Func)
declare sub      Fl_Text_EditorAddKeyBinding2(byval te as Fl_Text_Editor ptr,byval key as long,byval state as long,byval f as Key_Func,byval list as Key_Binding ptr ptr)

declare function Fl_Text_EditorBoundKeyFunction(byval te as Fl_Text_Editor ptr,byval key as long,byval state as long) as Key_Func
declare function Fl_Text_EditorBoundKeyFunction2(byval te as Fl_Text_Editor ptr,byval key as long,byval state as long,byval list as Key_Binding ptr) as Key_Func

declare sub      Fl_Text_EditorDefaultKeyFunction(byval te as Fl_Text_Editor ptr,byval f as Key_Func)

declare sub      Fl_Text_EditorSetInsertMode(byval te as Fl_Text_Editor ptr,byval m as long)
declare function Fl_Text_EditorGetInsertMode(byval te as Fl_Text_Editor ptr) as long

declare sub      Fl_Text_EditorRemoveAllKeyBindings(byval te as Fl_Text_Editor ptr)
declare sub      Fl_Text_EditorRemoveAllKeyBindings2(byval te as Fl_Text_Editor ptr,byval list as Key_Binding ptr ptr)

declare sub      Fl_Text_EditorRemoveKeyBinding(byval te as Fl_Text_Editor ptr,byval key as long,byval state as long)
declare sub      Fl_Text_EditorRemoveKeyBinding2(byval te as Fl_Text_Editor ptr,byval key as long,byval state as long,byval list as Key_Binding ptr ptr)

' Fl_Text_Editor key functions
declare function kf_backspace (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_c_s_move  (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_copy      (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_ctrl_move (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_cut       (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_default   (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_delete    (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_down      (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_end       (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_enter     (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_home      (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_ignore    (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_insert    (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_left      (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_m_s_move  (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_meta_move (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_move      (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_page_down (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_page_up   (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_paste     (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_right     (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_select_all(byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_shift_move(byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_undo      (byval c as long,byval te as Fl_Text_Editor ptr) as long
declare function kf_up        (byval c as long,byval te as Fl_Text_Editor ptr) as long
#endif ' NO_TEXT

#ifndef NO_TREE
'#########################################
'# class Fl_Tree_Item is used by Fl_Tree #
'#########################################
declare sub      Fl_Tree_ItemSetLabel(byval item as Fl_Tree_Item ptr,byval newlabel as const zstring ptr)
declare function Fl_Tree_ItemGetLabel(byval item as Fl_Tree_Item ptr) as const zstring ptr

declare sub      Fl_Tree_ItemSetWidget(byval item as Fl_Tree_Item ptr,byval wgt as Fl_Widget ptr)
declare function Fl_Tree_ItemGetWidget(byval item as Fl_Tree_Item ptr) as const Fl_widget ptr

'############################
'# class Fl_Tree_Item_Array #
'############################
declare function Fl_Tree_Item_ArrayNew(byval new_chunksize as long=10) as Fl_Tree_Item_Array ptr
declare function Fl_Tree_Item_ArrayCopy(byval other as const Fl_Tree_Item_Array ptr) as Fl_Tree_Item_Array ptr
declare sub      Fl_Tree_Item_ArrayDelete(byref tia as Fl_Tree_Item_Array ptr)
declare sub      Fl_Tree_Item_ArrayAdd(byval tia as Fl_Tree_Item_Array ptr,byval ti as Fl_Tree_Item ptr)
declare sub      Fl_Tree_Item_ArrayClear(byval tia as Fl_Tree_Item_Array ptr)
declare sub      Fl_Tree_Item_ArrayInsert(byval tia as Fl_Tree_Item_Array ptr,byval position as long,byval ti as Fl_Tree_Item ptr)
declare function Fl_Tree_Item_ArrayTotal(byval tia as Fl_Tree_Item_Array ptr) as long
declare function Fl_Tree_Item_ArrayGetItem(byval tia as Fl_Tree_Item_Array ptr,byval index as long) as Fl_Tree_Item ptr
declare function Fl_Tree_Item_ArrayGetItem2(byval tia as Fl_Tree_Item_Array ptr,byval index as long) as const Fl_Tree_Item ptr
declare sub      Fl_Tree_Item_ArrayRemove(byval tia as Fl_Tree_Item_Array ptr,byval index as long)
declare function Fl_Tree_Item_ArrayRemove2(byval tia as Fl_Tree_Item_Array ptr,byval ti as Fl_Tree_Item ptr) as long
declare sub      Fl_Tree_Item_ArraySwap(byval tia as Fl_Tree_Item_Array ptr,byval indexA as long,byval indexB as long)

'##################################
'# class Fl_Tree extends Fl_Group #
'##################################
DeclareEx(Fl_Tree)
declare function Fl_TreeNew(byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Tree ptr
declare sub      Fl_TreeDelete(byref tr as Fl_Tree ptr)
declare function Fl_TreeHandle(byval tr as Fl_Tree ptr,byval e as Fl_Event) as long

declare function Fl_TreeAdd(byval tr as Fl_Tree ptr,byval path as const zstring ptr) as Fl_Tree_Item ptr
declare function Fl_TreeAddItem(byval tr as Fl_Tree ptr,byval path as const zstring ptr,byval item as Fl_Tree_Item ptr) as Fl_Tree_Item ptr
declare function Fl_TreeAddChildItem(byval tr as Fl_Tree ptr,byval parent as Fl_Tree_Item ptr,byval name as const zstring ptr) as Fl_Tree_Item ptr

declare sub      Fl_TreeSetCallbackItem(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr)
declare function Fl_TreeGetCallbackItem(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr

declare sub      Fl_TreeSetCallbackReason(byval tr as Fl_Tree ptr,byval reason as FL_TREE_REASON)
declare function Fl_TreeGetCallbackReason(byval tr as Fl_Tree ptr) as FL_TREE_REASON

declare sub      Fl_TreeClear(byval tr as Fl_Tree ptr)
declare sub      Fl_TreeClearChildren(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr)
declare function Fl_TreeClose(byval tr as Fl_Tree ptr,byval path as const zstring ptr,byval docallback as long=1) as long
declare function Fl_TreeCloseItem(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr,byval docallback as long=1) as long
' Treeview icons
declare sub      Fl_TreeSetCloseIcon(byval tr as Fl_Tree ptr,byval img as Fl_Image ptr)
declare function Fl_TreeGetCloseIcon(byval tr as Fl_Tree ptr) as Fl_Image ptr

declare sub      Fl_TreeSetOpenIcon(byval tr as Fl_Tree ptr,byval img as Fl_Image ptr)
declare function Fl_TreeGetOpenIcon(byval tr as Fl_Tree ptr) as Fl_Image ptr

declare sub      Fl_TreeSetUserIcon(byval tr as Fl_Tree ptr,byval img as Fl_Image ptr)
declare function Fl_TreeGetUserIcon(byval tr as Fl_Tree ptr) as Fl_Image ptr

declare sub      Fl_TreeSetUserIconMarginLeft(byval tr as Fl_Tree ptr,byval m as long)
declare function Fl_TreeGetUserIconMarginLeft(byval tr as Fl_Tree ptr) as long
' Treeview lines
declare sub      Fl_TreeSetConnectorColor(byval tr as Fl_Tree ptr,byval c as Fl_Color)
declare function Fl_TreeGetConnectorColor(byval tr as Fl_Tree ptr) as Fl_Color

declare sub      Fl_TreeSetConnectorStyle(byval tr as Fl_Tree ptr,byval s as FL_TREE_CONNECTOR)
declare function Fl_TreeGetConnectorStyle(byval tr as Fl_Tree ptr) as FL_TREE_CONNECTOR

declare sub      Fl_TreeSetConnectorWidth(byval tr as Fl_Tree ptr,byval w as long)
declare function Fl_TreeGetConnectorWidth(byval tr as Fl_Tree ptr) as long

declare function Fl_TreeDeselect    (byval tr as Fl_Tree ptr,byval path as const zstring ptr ,byval docallback as long=1) as long
declare function Fl_TreeDeselectItem(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr  ,byval docallback as long=1) as long
declare function Fl_TreeDeselectAll (byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr=0,byval docallback as long=1) as long

declare sub      Fl_TreeDisplay  (byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr)
declare function Fl_TreeDisplayed(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr) as long

declare function Fl_TreeFindClicked(byval tr as Fl_Tree ptr) as const Fl_Tree_Item ptr
declare function Fl_TreeItemClicked(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr

declare function Fl_TreeFindItem(byval tr as Fl_Tree ptr,byval path as const zstring ptr) as Fl_Tree_Item ptr
declare function Fl_TreeFindItem2(byval tr as Fl_Tree ptr,byval path as const zstring ptr) as const Fl_Tree_Item ptr

declare function Fl_TreeRoot(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr
declare function Fl_TreeFirst(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr

declare function Fl_TreeNext(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr=0) as Fl_Tree_Item ptr
declare function Fl_TreePrev(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr=0) as Fl_Tree_Item ptr

declare function Fl_TreeLast(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr
declare function Fl_TreeLastVisible(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr

declare function Fl_TreeNextVisibleItem(byval tr as Fl_Tree ptr,byval start as Fl_Tree_Item ptr,byval direction as long) as Fl_Tree_Item ptr
declare function Fl_TreeExtendSelectionDir(byval tr as Fl_Tree ptr,byval from as Fl_Tree_Item ptr,byval to_ as Fl_Tree_Item ptr,byval dir as long,byval value as long,byval blnVisible as long) as long
declare function Fl_TreeExtendSelection   (byval tr as Fl_Tree ptr,byval from as Fl_Tree_Item ptr,byval to_ as Fl_Tree_Item ptr,byval value as long=1,byval blnVisible as long=0) as long

declare function Fl_TreeFirstSelectedItem(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr
declare function Fl_TreeNextSelectedItem(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr=0) as Fl_Tree_Item ptr

declare function Fl_TreeFirstVisible(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr
declare function Fl_TreeGetItemFocus(byval tr as Fl_Tree ptr) as Fl_Tree_Item ptr

declare function Fl_TreeInsert(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr,byval name as const zstring ptr,byval pos as long) as Fl_Tree_Item ptr
declare function Fl_TreeInsertAbove(byval tr as Fl_Tree ptr,byval above as Fl_Tree_Item ptr,byval name as const zstring ptr) as Fl_Tree_Item ptr

declare function Fl_TreeIsClose(byval tr as Fl_Tree ptr,byval path as const zstring ptr) as long
declare function Fl_TreeIsCloseItem(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr) as long
declare function Fl_TreeIsOpen(byval tr as Fl_Tree ptr,byval path as const zstring ptr) as long
declare function Fl_TreeIsOpenItem(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr) as long
declare function Fl_TreeIsScrollbar(byval tr as Fl_Tree ptr,byval wgt as Fl_Widget ptr) as long
declare function Fl_TreeIsSelected(byval tr as Fl_Tree ptr,byval path as const zstring ptr) as long
declare function Fl_TreeIsSelectedItem(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr) as long

declare function Fl_TreeIsVScrollVisible(byval tr as Fl_Tree ptr) as long
declare sub      Fl_TreeSetVPosition(byval tr as Fl_Tree ptr,byval p as long)
declare function Fl_TreeGetVPosition(byval tr as Fl_Tree ptr) as long

declare function Fl_TreeIsHScrollVisible(byval tr as Fl_Tree ptr) as long
declare sub      Fl_TreeSetHPosition(byval tr as Fl_Tree ptr,byval p as long)
declare function Fl_TreeGetHPosition(byval tr as Fl_Tree ptr) as long

declare sub      Fl_TreeSetItemLabelBGColor(byval tr as Fl_Tree ptr,byval c as Fl_Color)
declare function Fl_TreeGetItemLabelBGClor(byval tr as Fl_Tree ptr) as Fl_Color

declare sub      Fl_TreeSetItemLabelFGColor(byval tr as Fl_Tree ptr,byval c as Fl_Color)
declare function Fl_TreeGetItemLabelFGColor(byval tr as Fl_Tree ptr) as Fl_Color

declare sub      Fl_TreeSetItemLabelFont(byval tr as Fl_Tree ptr,byval f as Fl_Font)
declare function Fl_TreeGetItemLabelFont(byval tr as Fl_Tree ptr) as Fl_Font

declare sub      Fl_TreeSetItemLabelSize(byval tr as Fl_Tree ptr,byval s as FL_FONTSIZE)
declare function Fl_TreeGetItemLabelSize(byval tr as Fl_Tree ptr) as FL_FONTSIZE

declare function Fl_TreeItemPathName(byval tr as Fl_Tree ptr,byval pathname as zstring ptr,byval pathnamelen as long,byval item as const Fl_Tree_Item ptr) as long

declare sub      Fl_TreeSetLabelMarginLeft(byval tr as Fl_Tree ptr,byval m as long)
declare function Fl_TreeGetLabelMarginLeft(byval tr as Fl_Tree ptr) as long

declare sub      Fl_TreeSetLineSpacing(byval tr as Fl_Tree ptr,byval ls as long)
declare function Fl_TreeGetLineSpacing(byval tr as Fl_Tree ptr) as long

declare sub      Fl_TreeSetMarginLeft(byval tr as Fl_Tree ptr,byval m as long)
declare function Fl_TreeGetMarginLeft(byval tr as Fl_Tree ptr) as long

declare sub      Fl_TreeSetMarginTop(byval tr as Fl_Tree ptr,byval m as long)
declare function Fl_TreeGetMarginTop(byval tr as Fl_Tree ptr) as long

declare function Fl_TreeOpen(byval tr as Fl_Tree ptr,byval path as const zstring ptr,byval docallback as long=1) as long
declare function Fl_TreeOpenItem(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr,byval docallback as long=1) as long
declare sub      Fl_TreeOpenToggle(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr,byval docallback as long=1)

declare sub      Fl_TreeSetOpenchildMarginBottom(byval tr as Fl_Tree ptr,byval m as long)
declare function Fl_TreeGetOpenchildMarginBottom(byval tr as Fl_Tree ptr) as long

declare function Fl_TreeRemove(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr) as long

declare sub      Fl_TreeRootLabel(byval tr as Fl_Tree ptr,byval newlabel as const zstring ptr)

declare sub      Fl_TreeSetScrollbarSize(byval tr as Fl_Tree ptr,byval s as long)
declare function Fl_TreeGetScrollbarSize(byval tr as Fl_Tree ptr) as long

declare function Fl_TreeSelect      (byval tr as Fl_Tree ptr,byval path as const zstring ptr,byval docallback as long=1) as long
declare function Fl_TreeSelectItem  (byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr,byval docallback as long=1) as long
declare function Fl_TreeSelectAll   (byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr=0,byval docallback as long=1) as long
declare function Fl_TreeSelectOnly  (byval tr as Fl_Tree ptr,byval selitem as Fl_Tree_Item ptr,byval docallback as long=1) as long
declare sub      Fl_TreeSelectToggle(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr,byval docallback as long=1)

declare sub      Fl_TreeSetSelectBox(byval tr as Fl_Tree ptr,byval bt as Fl_Boxtype)
declare function Fl_TreeGetSelectBox(byval tr as Fl_Tree ptr) as Fl_Boxtype

declare sub      Fl_TreeSetSelectMode(byval tr as Fl_Tree ptr,byval m as FL_TREE_SELECT)
declare function Fl_TreeGetSelectMode(byval tr as Fl_Tree ptr) as FL_TREE_SELECT

declare sub      Fl_TreeSetItemFocus  (byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr)
declare sub      Fl_TreeShowItem      (byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr)
declare sub      Fl_TreeShowItem2     (byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr,byval yoff as long)
declare sub      Fl_TreeShowItemBottom(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr)
declare sub      Fl_TreeShowItemMiddle(byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr)
declare sub      Fl_TreeShowItemTop   (byval tr as Fl_Tree ptr,byval item as Fl_Tree_Item ptr)
declare sub      Fl_TreeShowSelf      (byval tr as Fl_Tree ptr)

declare sub      Fl_TreeSetShowCollapse(byval tr as Fl_Tree ptr,byval c as long)
declare function Fl_TreeGetShowCollapse(byval tr as Fl_Tree ptr) as long

declare sub      Fl_TreeSetShowRoot(byval tr as Fl_Tree ptr,byval bln as long)
declare function Fl_TreeGetShowRoot(byval tr as Fl_Tree ptr) as long

declare sub      Fl_TreeSetSortOrder(byval tr as Fl_Tree ptr,byval s as FL_TREE_SORT)
declare function Fl_TreeGetSortorder(byval tr as Fl_Tree ptr) as FL_TREE_SORT

#define Fl_TreeBegin Fl_GroupBegin
#define Fl_TreeEnd   Fl_GroupEnd

#endif '  NO_TREE

#ifndef NO_WIZARD
'####################################
'# class Fl_Wizard extends Fl_Group #
'####################################
declare function Fl_WizardNew     (byval x as long,byval y as long,byval w as long,byval h as long,byval label as const zstring ptr=0) as Fl_Wizard ptr
declare sub      Fl_WizardDelete  (byref wi as Fl_Wizard ptr)
declare sub      Fl_WizardNext    (byval wi as Fl_Wizard ptr)
declare sub      Fl_WizardPrev    (byval wi as Fl_Wizard ptr)
declare sub      Fl_WizardSetValue(byval wi as Fl_Wizard ptr,byval wgt as Fl_Widget ptr)
declare function Fl_WizardGetValue(byval wi as Fl_Wizard ptr) as Fl_Widget ptr
#define Fl_WizardBegin     Fl_GroupBegin
#define Fl_WizardEnd       Fl_GroupEnd
#define Fl_WizardPageNew   Fl_GroupNew
#define Fl_WizardPageBegin Fl_GroupBegin
#define Fl_WizardPageEnd   Fl_GroupEnd
#endif ' NO_WIZARD


'####################################
'# class Fl_Window extends Fl_Group #
'####################################
declare function Fl_WindowNew(byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Window ptr
declare function Fl_WindowNew2(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Window ptr
declare sub      Fl_WindowDelete(byref win as Fl_Window ptr)

declare function Fl_WindowHandle(byval win as Fl_Window ptr,byval event as Fl_Event) as long

declare sub      Fl_WindowBegin(byval win as Fl_Window ptr)
declare sub      Fl_WindowEnd(byval win as Fl_Window ptr)

declare sub      Fl_WindowSetBorder(byval win as Fl_Window ptr,byval b as long)
declare function Fl_WindowGetBorder(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowClearBorder(byval win as Fl_Window ptr)

declare sub      Fl_WindowCopyLabel(byval win as Fl_Window ptr,byval label as const zstring ptr)

declare sub      Fl_WindowMakeCurrent(byval win as Fl_Window ptr)
declare function Fl_WindowCurrent(byval win as Fl_Window ptr) as Fl_Window ptr

declare sub      Fl_WindowCursor(byval win as Fl_Window ptr,byval c as Fl_Cursor,byval fg as Fl_Color = Fl_BLACK,byval bg as Fl_Color = Fl_WHITE)

declare function Fl_WindowDecorated_h(byval win as Fl_Window ptr) as long
declare function Fl_WindowDecorated_w(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowFreePosition(byval win as Fl_Window ptr)

declare sub      Fl_WindowFullscreen(byval win as Fl_Window ptr)
declare function Fl_WindowFullscreenActive(byval win as Fl_Window ptr) as long
declare sub      Fl_WindowFullscreenOff(byval win as Fl_Window ptr)
declare sub      Fl_WindowFullscreenOffResize(byval win as Fl_Window ptr,byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      Fl_WindowHotspot(byval win as Fl_Window ptr,byval x as long,byval y as long,byval offscreen as long=0)
declare sub      Fl_WindowHotspotWidget(byval win as Fl_Window ptr,byval wgt as const Fl_Widget ptr,byval offscreen as long=0)

declare sub      Fl_WindowIconize(byval win as Fl_Window ptr)

declare sub      Fl_WindowSetIconLabel(byval win as Fl_Window ptr,byval label as const zstring ptr)
declare function Fl_WindowGetIconLabel(byval win as Fl_Window ptr) as const zstring ptr

declare sub      Fl_WindowSetLabel(byval win as Fl_Window ptr,byval label as const zstring ptr)
declare function Fl_WindowGetLabel(byval win as Fl_Window ptr) as const zstring ptr

declare sub      Fl_WindowSetLabels(byval win as Fl_Window ptr,byval wl as const zstring ptr,byval il as const zstring ptr)

declare function Fl_WindowGetMenuWindow(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowSetModal(byval win as Fl_Window ptr)
declare function Fl_WindowGetModal(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowSetNonModal(byval win as Fl_Window ptr)
declare function Fl_WindowGetNonModal(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowSetOverride(byval win as Fl_Window ptr)
declare function Fl_WindowGetOverride(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowResize(byval win as Fl_Window ptr,byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      Fl_WindowHide(byval win as Fl_Window ptr)

declare sub      Fl_WindowShow(byval win as Fl_Window ptr)
declare sub      Fl_WindowShowArgs(byval win as Fl_Window ptr,byval argc as long,byval argv as zstring ptr ptr)

declare function Fl_WindowShown(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowSizeRange(byval win as Fl_Window ptr,byval minw as long,byval minh as long,byval maxw as long=0,byval maxh as long=0,byval dw as long=0,byval dh as long=0,byval aspect as long=0)

declare sub      Fl_WindowSetTooltipWindow(byval win as Fl_Window ptr)
declare function Fl_WindowGetTooltipWindow(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowSetXClass(byval win as Fl_Window ptr,byval xclass as const zstring ptr)
declare function Fl_WindowGetXClass(byval win as Fl_Window ptr) as const zstring ptr

declare function Fl_WindowXRoot(byval win as Fl_Window ptr) as long
declare function Fl_WindowYRoot(byval win as Fl_Window ptr) as long

declare sub      Fl_WindowClearModalStates(byval win as Fl_Window ptr)
declare sub      Fl_WindowCursorImage  (byval win as Fl_Window ptr,byval img as const Fl_RGB_Image ptr,byval hotx as long, byval hoty as long)
declare sub      Fl_WindowDefaultCursor(byval win as Fl_Window ptr,byval c as Fl_Cursor)
declare sub      Fl_WindowDefaultIcon  (byval win as Fl_Window ptr,byval icon as const Fl_RGB_Image ptr)
declare sub      Fl_WindowDefaultIcons (byval win as Fl_Window ptr,byval icons as const Fl_RGB_Image ptr ptr,byval count as long)
declare sub      Fl_WindowIcon         (byval win as Fl_Window ptr,byval icon as const Fl_RGB_Image ptr)
declare sub      Fl_WindowIcons        (byval win as Fl_Window ptr,byval icons as const Fl_RGB_Image ptr ptr,byval count as long)
declare sub      Fl_WindowShape        (byval win as Fl_Window ptr,byval img as const Fl_Image ptr)
declare sub      Fl_WindowWaitForExpose(byval win as Fl_Window ptr)

'#######################################
'# class Fl_WindowEx extends Fl_Window #
'#######################################
declare function Fl_WindowExNew(byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_WindowEx ptr
declare function Fl_WindowExNew2(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_WindowEx ptr
declare sub      Fl_WindowExDelete         (byref ex as Fl_WindowEx ptr)
declare function Fl_WindowExHandleBase     (byval ex as Fl_WindowEx ptr,byval event as Fl_Event) as long
declare sub      Fl_WindowExSetDestructorCB(byval ex as Fl_WindowEx ptr,byval cb as Fl_DestructorEx)
declare sub      Fl_WindowExSetDrawCB      (byval ex as Fl_WindowEx ptr,byval cb as Fl_DrawEx)
declare sub      Fl_WindowExSetHandleCB    (byval ex as Fl_WindowEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_WindowExSetResizeCB    (byval ex as Fl_WindowEx ptr,byval cb as Fl_ResizeEx)

'############################################
'# class Fl_Single_Window extends Fl_Window #
'############################################
declare function Fl_Single_WindowNew     (byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Single_Window ptr
declare function Fl_Single_WindowNew2    (byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Single_Window ptr
declare sub      Fl_Single_WindowDelete  (byref win as Fl_Single_Window ptr)
declare sub      Fl_Single_WindowFlush   (byval win as Fl_Single_Window ptr)
declare sub      Fl_Single_WindowShow    (byval win as Fl_Single_Window ptr)
declare sub      Fl_Single_WindowShowArgs(byval win as Fl_Single_Window ptr,byval argc as long,byval argv as zstring ptr ptr)

'#####################################################
'# class Fl_Single_WindowEx extends Fl_Single_Window #
'#####################################################
declare function Fl_Single_WindowExNew(byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Single_WindowEx ptr
declare function Fl_Single_WindowExNew2(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Single_WindowEx ptr
declare sub      Fl_Single_WindowExDelete         (byref ex as Fl_Single_WindowEx ptr)
declare function Fl_Single_WindowExHandleBase     (byval ex as Fl_Single_WindowEx ptr,byval event as Fl_Event) as long
declare sub      Fl_Single_WindowExSetDestructorCB(byval ex as Fl_Single_WindowEx ptr,byval cb as Fl_DestructorEx)
declare sub      Fl_Single_WindowExSetDrawCB      (byval ex as Fl_Single_WindowEx ptr,byval cb as Fl_DrawEx)
declare sub      Fl_Single_WindowExSetHandleCB    (byval ex as Fl_Single_WindowEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_Single_WindowExSetResizeCB    (byval ex as Fl_Single_WindowEx ptr,byval cb as Fl_ResizeEx)

'#################################################
'# class Fl_Menu_Window extends Fl_Single_Window #
'#################################################
declare function Fl_Menu_WindowNew         (byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Menu_Window ptr
declare function Fl_Menu_WindowNew2        (byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Menu_Window ptr
declare sub      Fl_Menu_WindowDelete      (byref win as Fl_Menu_Window ptr)
declare sub      Fl_Menu_WindowClearOverlay(byval win as Fl_Menu_Window ptr)
declare sub      Fl_Menu_WindowErase       (byval win as Fl_Menu_Window ptr)
declare sub      Fl_Menu_WindowFlush       (byval win as Fl_Menu_Window ptr)
declare sub      Fl_Menu_WindowHide        (byval win as Fl_Menu_Window ptr)
declare function Fl_Menu_WindowOverlay     (byval win as Fl_Menu_Window ptr) as ulong
declare sub      Fl_Menu_WindowSetOverlay  (byval win as Fl_Menu_Window ptr)
declare sub      Fl_Menu_WindowShow        (byval win as Fl_Menu_Window ptr)

'#################################################
'# class Fl_Menu_WindowEx extends Fl_Menu_Window #
'#################################################
declare function Fl_Menu_WindowExNew(byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Menu_WindowEx ptr
declare function Fl_Menu_WindowExNew2(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Menu_WindowEx ptr
declare sub      Fl_Menu_WindowExDelete         (byref ex as Fl_Menu_WindowEx ptr)
declare function Fl_Menu_WindowExHandleBase     (byval ex as Fl_Menu_WindowEx ptr,byval event as Fl_Event) as long
declare sub      Fl_Menu_WindowExSetDestructorCB(byval ex as Fl_Menu_WindowEx ptr,byval cb as Fl_DestructorEx)
declare sub      Fl_Menu_WindowExSetDrawCB      (byval ex as Fl_Menu_WindowEx ptr,byval cb as Fl_DrawEx)
declare sub      Fl_Menu_WindowExSetHandleCB    (byval ex as Fl_Menu_WindowEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_Menu_WindowExSetResizeCB    (byval ex as Fl_Menu_WindowEx ptr,byval cb as Fl_ResizeEx)

'############################################
'# class Fl_Double_Window extends Fl_Window #
'############################################
declare function Fl_Double_WindowNew     (byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Double_Window ptr
declare function Fl_Double_WindowNew2    (byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Double_Window ptr
declare sub      Fl_Double_WindowDelete  (byref win as Fl_Double_Window ptr)
declare sub      Fl_Double_WindowFlush   (byval win as Fl_Double_Window ptr)
declare sub      Fl_Double_WindowHide    (byval win as Fl_Double_Window ptr)
declare sub      Fl_Double_WindowResize  (byval win as Fl_Double_Window ptr,byval x as long,byval y as long,byval w as long,byval h as long)
declare sub      Fl_Double_WindowShow    (byval win as Fl_Double_Window ptr)
declare sub      Fl_Double_WindowShowArgs(byval win as Fl_Double_Window ptr,byval argc as long,byval argv as zstring ptr ptr)

'#####################################################
'# class Fl_Double_WindowEx extends Fl_Double_Window #
'#####################################################
declare function Fl_Double_WindowExNew(byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Double_WindowEx ptr
declare function Fl_Double_WindowExNew2(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Double_WindowEx ptr
declare sub      Fl_Double_WindowExDelete         (byref ex as Fl_Double_WindowEx ptr)
declare function Fl_Double_WindowExHandleBase     (byval ex as Fl_Double_WindowEx ptr,byval event as Fl_Event) as long
declare sub      Fl_Double_WindowExSetDestructorCB(byval ex as Fl_Double_WindowEx ptr,byval cb as Fl_DestructorEx)
declare sub      Fl_Double_WindowExSetDrawCB      (byval ex as Fl_Double_WindowEx ptr,byval cb as Fl_DrawEx)
declare sub      Fl_Double_WindowExSetHandleCB    (byval ex as Fl_Double_WindowEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_Double_WindowExSetResizeCB    (byval ex as Fl_Double_WindowEx ptr,byval cb as Fl_ResizeEx)

'#####################################################
'# class  Fl_Overlay_Window extends Fl_Double_Window #
'#####################################################
declare sub      Fl_Overlay_WindowFlush        (byval win as Fl_Overlay_Window ptr)
declare sub      Fl_Overlay_WindowHide         (byval win as Fl_Overlay_Window ptr)
declare sub      Fl_Overlay_WindowResize       (byval win as Fl_Overlay_Window ptr,byval x as long,byval y as long,byval w as long,byval h as long)
declare function Fl_Overlay_WindowCanDoOverlay (byval win as Fl_Overlay_Window ptr) as long
declare sub      Fl_Overlay_WindowRedrawOverlay(byval win as Fl_Overlay_Window ptr)
declare sub      Fl_Overlay_WindowShow         (byval win as Fl_Overlay_Window ptr)
declare sub      Fl_Overlay_WindowShowArgs     (byval win as Fl_Overlay_Window ptr,byval argc as long,byval argv as zstring ptr ptr)

'########################################################
'# class  Fl_Overlay_WindowEx extends Fl_Overlay_Window #
'########################################################
declare function Fl_Overlay_WindowExNew(byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Overlay_WindowEx ptr
declare function Fl_Overlay_WindowExNew2(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Overlay_WindowEx ptr
declare sub      Fl_Overlay_WindowExDelete           (byref win as Fl_Overlay_WindowEx ptr)
declare function Fl_Overlay_WindowExHandleBase       (byval win as Fl_Overlay_WindowEx ptr,byval event as Fl_Event) as long
declare sub      Fl_Overlay_WindowExSetDraw_OverlayCB(byval win as Fl_Overlay_WindowEx ptr,byval cb as Fl_Draw_OverlayEx)
declare sub      Fl_Overlay_WindowExSetHandleCB      (byval win as Fl_Overlay_WindowEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_Overlay_WindowExSetResizeCB      (byval win as Fl_Overlay_WindowEx ptr,byval cb as Fl_ResizeEx)

#ifndef NO_OPENGL
'########################################
'# class Fl_Gl_Window extends Fl_Window #
'########################################
declare function Fl_Gl_WindowNew(byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Gl_Window ptr
declare function Fl_Gl_WindowNew2(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Gl_Window ptr
declare sub      Fl_Gl_WindowDelete(byref win as Fl_Gl_Window ptr)

declare function Fl_Gl_WindowHandle(byval win as Fl_Gl_Window ptr,byval ev as Fl_Event) as long

declare function Fl_Gl_WindowCanDo(byval win as Fl_Gl_Window ptr) as long
declare function Fl_Gl_WindowCanDoOverlay(byval win as Fl_Gl_Window ptr) as long

declare sub      Fl_Gl_WindowSetContext(byval win as Fl_Gl_Window ptr,byval ctx as any ptr,byval destroy_flag as long=0)
declare function Fl_Gl_WindowGetContext(byval win as Fl_Gl_Window ptr) as any ptr

declare sub      Fl_Gl_WindowSetContextValid(byval win as Fl_Gl_Window ptr,byval v as long)
declare function Fl_Gl_WindowGetContextValid(byval win as Fl_Gl_Window ptr) as long

declare sub      Fl_Gl_WindowSetValid(byval win as Fl_Gl_Window ptr,byval v as long)
declare function Fl_Gl_WindowGetValid(byval win as Fl_Gl_Window ptr) as long

declare sub      Fl_Gl_WindowFlush(byval win as Fl_Gl_Window ptr)

declare sub      Fl_Gl_WindowInvalidate(byval win as Fl_Gl_Window ptr)
declare sub      Fl_Gl_WindowMakeCurrent(byval win as Fl_Gl_Window ptr)

declare sub      Fl_Gl_WindowHideOverlay(byval win as Fl_Gl_Window ptr)
declare sub      Fl_Gl_WindowMakeOverlayCurrent(byval win as Fl_Gl_Window ptr)
declare sub      Fl_Gl_WindowRedrawOverlay(byval win as Fl_Gl_Window ptr)

declare sub      Fl_Gl_WindowSetMode(byval win as Fl_Gl_Window ptr,byval m as Fl_Mode)
declare function Fl_Gl_WindowGetMode(byval win as Fl_Gl_Window ptr) as Fl_Mode

declare sub      Fl_Gl_WindowOrtho(byval win as Fl_Gl_Window ptr)

declare sub      Fl_Gl_WindowResize(byval win as Fl_Gl_Window ptr,byval x as long,byval y as long,byval w as long,byval h as long)

declare sub      Fl_Gl_WindowSwapBuffers(byval win as Fl_Gl_Window ptr)

declare sub      Fl_Gl_WindowHide(byval win as Fl_Gl_Window ptr)
declare sub      Fl_Gl_WindowShow(byval win as Fl_Gl_Window ptr)

declare sub      Fl_Gl_WindowShowArgs(byval win as Fl_Gl_Window ptr,byval argc as long,byval argv as zstring ptr ptr)

'#############################################
'# class Fl_Gl_WindowEx extends Fl_GL_Window #
'#############################################
declare function Fl_Gl_WindowExNew(byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Gl_WindowEx ptr
declare function Fl_Gl_WindowExNew2(byval x as long,byval y as long,byval w as long,byval h as long,byval title as const zstring ptr=0) as Fl_Gl_WindowEx ptr
declare sub      Fl_Gl_WindowExDelete          (byref win as Fl_Gl_WindowEx ptr)
declare function Fl_Gl_WindowExHandleBase      (byval win as Fl_Gl_WindowEx ptr,byval event as Fl_Event) as long
declare sub      Fl_Gl_WindowExSetDestructorCB (byval win as Fl_Gl_WindowEx ptr,byval cb as Fl_DestructorEx)
declare sub      Fl_Gl_WindowExSetDrawCB       (byval win as Fl_Gl_WindowEx ptr,byval cb as Fl_DrawEx)
declare sub      Fl_Gl_WindowExSetDrawOverlayCB(byval win as Fl_Gl_WindowEx ptr,byval cb as Fl_Draw_OverlayEx)
declare sub      Fl_Gl_WindowExSetHandleCB     (byval win as Fl_Gl_WindowEx ptr,byval cb as Fl_HandleEx)
declare sub      Fl_Gl_WindowExSetResizeCB     (byval win as Fl_Gl_WindowEx ptr,byval cb as Fl_ResizeEx)
#endif ' NO_OPENGL

#ifndef NO_SURFACE
' #############
' # Fl_Device #
' #############

' ########################################
' # Fl_Graphics_Driver extends Fl_Device #
' ########################################
declare function Fl_Graphics_DriverClassName (byval gd as Fl_Graphics_Driver ptr) as const zstring ptr

' #######################################
' # Fl_Surface_Device extends Fl_Device #
' #######################################
declare function Fl_Surface_DeviceSurface as Fl_Surface_Device ptr
declare function Fl_Surface_DeviceClassName(byval sd as Fl_Surface_Device ptr) as const zstring ptr
declare sub      Fl_Surface_DeviceSetDriver(byval sd as Fl_Surface_Device ptr,byval gd as Fl_Graphics_Driver ptr)
declare function Fl_Surface_DeviceGetDriver(byval sd as Fl_Surface_Device ptr) as Fl_Graphics_Driver ptr
declare sub      Fl_Surface_DeviceSetCurrent(byval sd as Fl_Surface_Device ptr)

' #####################################################
' # class Fl_Display_Device extends Fl_Surface_Device #
' #####################################################
' set drawing target back to display see also: Fl_Image_SurfaceSetCurrent(),Fl_Copy_SurfaceSetCurrent()
declare sub      Fl_Display_DeviceSetCurrent()

' ####################################################
' # class Fl_Image_Surface extends Fl_Surface_Device #
' ####################################################
' After creation of an Fl_Image_Surface object, call Fl_Image_SurfaceSetCurrent() on it, 
' and all subsequent graphics requests will be recorded in the image. 
' It's possible to draw widgets (using Fl_Image_SurfaceDraw()) or to use any of the Drawing functions or the Color & Font functions. 
' Finally, call Fl_Image_SurfaceImage() on the object to obtain a newly allocated Fl_RGB_Image object.
' Fl_GL_Window objects can be drawn in the image as well.
declare function Fl_Image_SurfaceNew       (byval w as long,byval h as long) as Fl_Image_Surface ptr
declare sub      Fl_Image_SurfaceDelete    (byref ims as Fl_Image_Surface ptr)
declare function Fl_Image_SurfaceClassName (byval ims as Fl_Image_Surface ptr) as const zstring ptr
declare function Fl_Image_SurfaceGetDriver (byval ims as Fl_Image_Surface ptr) as Fl_Graphics_Driver ptr
declare function Fl_Image_SurfaceImage     (byval ims as Fl_Image_Surface ptr) as Fl_RGB_Image ptr 
declare sub      Fl_Image_SurfaceSetCurrent(byval ims as Fl_Image_Surface ptr)
declare sub      Fl_Image_SurfaceDraw      (byval ims as Fl_Image_Surface ptr,byval wgt as Fl_Widget ptr,byval delta_x as long=0,byval delta_y as long=0)

' ###################################################
' # class Fl_Copy_Surface extends Fl_Surface_Device #
' ###################################################
' After creation of an Fl_Copy_Surface object, call Fl_Copy_SurfaceSetCurrent() on it, 
' and all subsequent graphics requests will be recorded in the clipboard. 
' It's possible to draw widgets (using Fl_Copy_SurfaceDraw() ) or to use any of the Drawing functions or the Color & Font functions. 
' Finally, delete the Fl_Copy_SurfaceDelete() object to load the clipboard with the graphical data.
' Fl_GL_Window 's can be copied to the clipboard as well. 
declare function Fl_Copy_SurfaceNew       (byval w as long,byval h as long) as Fl_Copy_Surface ptr
declare sub      Fl_Copy_SurfaceDelete    (byref cs as Fl_Copy_Surface ptr)
declare function Fl_Copy_SurfaceClassName (byval cs as Fl_Copy_Surface ptr) as const zstring ptr
declare function Fl_Copy_SurfaceGetDriver (byval cs as Fl_Copy_Surface ptr) as Fl_Graphics_Driver ptr
' Use this drawing surface for future graphics requests.
declare sub      Fl_Copy_SurfaceSetCurrent(byval cs as Fl_Copy_Surface ptr)
' Copies a widget in the clipboard.
declare sub      Fl_Copy_SurfaceDraw      (byval cs as Fl_Copy_Surface ptr,byval wgt as Fl_Widget ptr,byval delta_x as long=0,byval delta_y as long=0)

 #ifndef NO_PAGEDSURFACE
' ###################################################
' # class Fl_Paged_Device extends Fl_Surface_Device #
' ###################################################
enum Page_Format
  Page_Format_A0 = 0
  Page_Format_A1
  Page_Format_A2
  Page_Format_A3
  Page_Format_A4
  Page_Format_A5
  Page_Format_A6
  Page_Format_A7
  Page_Format_A8
  Page_Format_A9 
  Page_Format_B0
  Page_Format_B1
  Page_Format_B2
  Page_Format_B3
  Page_Format_B4
  Page_Format_B5
  Page_Format_B6
  Page_Format_B7
  Page_Format_B8
  Page_Format_B9
  Page_Format_B10
  Page_Format_C5E
  Page_Format_DLE
  Page_Format_EXECUTIVE
  Page_Format_FOLIO
  Page_Format_LEDGER
  Page_Format_LEGAL
  Page_Format_LETTER
  Page_Format_TABLOID
  Page_Format_ENVELOPE
  Page_Format_MEDIA = &H1000
end enum

enum Page_Layout 
  PORTRAIT    = &H000
  LANDSCAPE   = &H100
  REVERSED    = &H200
  ORIENTATION = &H300
end enum

#define NO_PAGE_FORMATS 30
declare function Fl_Paged_DeviceFormatWidht  (byval pd as Fl_Paged_Device ptr,byval nFormat as long) as long
declare function Fl_Paged_DeviceFormatHeight (byval pd as Fl_Paged_Device ptr,byval nFormat as long) as long
declare function Fl_Paged_DeviceGetFormatName(byval pd as Fl_Paged_Device ptr,byval nFormat as long) as const zstring ptr

' ############################################
' # class Fl_Printer extends Fl_Paged_Device #
' ############################################
  #ifndef NO_PRINTER
declare function Fl_PrinterNew as Fl_Printer ptr
declare sub      Fl_PrinterDelete(byref prt as Fl_Printer ptr)

declare function Fl_PrinterClassName(byval prt as Fl_Printer ptr) as const zstring ptr
declare function Fl_PrinterGetDriver(byval prt as Fl_Printer ptr) as Fl_Graphics_Driver ptr

declare sub      Fl_PrinterSetCurrent(byval prt as Fl_Printer ptr)

declare function Fl_PrinterStartJob(byval prt as Fl_Printer ptr,byval pagecount as long=1,byval frompage as long ptr=0,byval topage as long ptr=0) as long
declare sub      Fl_PrinterEndJob  (byval prt as Fl_Printer ptr)

declare function Fl_PrinterStartPage(byval prt as Fl_Printer ptr) as long
declare function Fl_PrinterEndPage  (byval prt as Fl_Printer ptr) as long

declare sub      Fl_PrinterGetMargins      (byval prt as Fl_Printer ptr,byref left as long, byref top as long, byref right as long, byref bottom as long)
declare function Fl_PrinterGetPrintableRect(byval prt as Fl_Printer ptr, byref w as long, byref h as long) as long

declare sub      Fl_PrinterSetOrigin(byval prt as Fl_Printer ptr,byval x as long,byval y as long)
declare sub      Fl_PrinterGetOrigin(byval prt as Fl_Printer ptr,byref x as long,byref y as long)

declare sub      Fl_PrinterPrintWidget(byval prt as Fl_Printer ptr,byval wgt as Fl_Widget ptr,byval delta_x as long=0,byval delta_y as long=0)
declare sub      Fl_PrinterPrintWindow(byval prt as Fl_Printer ptr,byval win as Fl_Window ptr,byval x_offset as long=0,byval y_offset as long=0)
declare sub      Fl_PrinterPrintWindowPart(byval prt as Fl_Printer ptr,byval win as Fl_Window ptr,byval x as long,byval y as long,byval w as long,byval h as long,byval delta_x as long=0,byval delta_y as long=0)

declare sub      Fl_PrinterRotate(byval prt as Fl_Printer ptr,byval angle as single)
declare sub      Fl_PrinterScale (byval prt as Fl_Printer ptr,byval scale_x as single,byval scale_y as single=0.0)

declare sub      Fl_PrinterTranslate  (byval prt as Fl_Printer ptr,byval x as long,byval y as long)
declare sub      Fl_PrinterUntranslate(byval prt as Fl_Printer ptr)
  #endif ' NO_PRINTER
 #endif ' NO_PAGED_SURFACE
#endif ' NO_SURFACE

end extern

#endif ' __FLTK_C_BI__
