
'#define md2_model any ptr
'#define md2_node  any ptr 

#Inclib "loadmd2_chung"
Declare Function MD2loadmodel Cdecl Alias "MD2loadmodel" (Byval filename As ZString Ptr,_  
         ByVal dx As double=0,ByVal dy As double=0,ByVal dz As Double=0) As md2_model Ptr
Declare Function MD2addnode Cdecl Alias "MD2addnode" (ByVal model As md2_model ptr) As md2_node Ptr 
Declare Sub MD2setnodeposition Cdecl Alias "MD2setnodeposition" (ByVal node As md2_node Ptr,ByVal x As double,ByVal y As double,ByVal z As Double)
Declare Sub MD2setnoderotation Cdecl Alias "MD2setnoderotation" (ByVal node As md2_node Ptr,ByVal rx As double,ByVal ry As double,ByVal rz As Double) 
Declare Sub MD2setnodescale Cdecl Alias "MD2setnodescale" (ByVal node As md2_node Ptr,ByVal sx As double,ByVal sy As double,ByVal sz As Double)
Declare Sub MD2setnodetexture Cdecl Alias "MD2setnodetexture" (ByVal node As md2_node Ptr,ByVal texture As uint)
Declare Sub Md2setnodetexpos Cdecl Alias "MD2setnodetexpos" (ByVal md2node As md2_node Ptr,_
	             ByVal texrot As Double=0, _ 
	             ByVal texscaley As Double=1,ByVal texscalez As Double=1, _ 
	             ByVal texdy As Double=0,ByVal texdz As Double=0)
Declare Sub MD2setanimation Cdecl Alias "MD2setanimation" (ByVal node As md2_node Ptr,ByVal anim As uint)
Declare Sub MD2setanimationrange Cdecl Alias "MD2setanimationrange" (ByVal node As md2_node Ptr,ByVal start As uint,ByVal last As uint,_  
	                   ByVal fps As double=10) 
Declare Sub MD2addjoint Cdecl Alias "MD2addjoint" (Byval node As md2_node Ptr,ByVal ivertice As uint,ByVal subjoint As Sub()) 
Declare Sub MD2drawnode Cdecl Alias "MD2drawnode" (ByVal md2node As md2_node Ptr,ByVal glnormal As Integer=0) 
Declare Sub MD2deletemodel Cdecl Alias "MD2deletemodel" (byval md2model as md2_model ptr) 
Declare Sub MD2deletenode Cdecl Alias "MD2deletenode" (ByVal  md2node As md2_node Ptr)

/' 
' ----------------------------------------------
' initialize the 21 MD2 model animations.
' ----------------------------------------------
Type anim_t
    startframe As uint ' first frame
    endframe As uint   ' last frame
    fps As uint        'frame per second for this animation
End Type

Static Shared As anim_t md2_animlist(21) => {_ 
   _' first, last, fps
    (   0,  39,  9 ),_    ' STAND
    (  40,  45, 10 ),_    ' RUN
    (  46,  53, 10 ),_    ' ATTACK
    (  54,  57,  7 ),_    ' PAIN_A
    (  58,  61,  7 ),_    ' PAIN_B
    (  62,  65,  7 ),_    ' PAIN_C
    (  66,  71,  7 ),_    ' JUMP
    (  72,  83,  7 ),_    ' FLIP
    (  84,  94,  7 ),_    ' SALUTE
    (  95, 111, 10 ),_    ' FALLBACK
    ( 112, 122,  7 ),_    ' WAVE
    ( 123, 134,  6 ),_    ' POINT
    ( 135, 153, 10 ),_    ' CROUCH_STAND
    ( 154, 159,  7 ),_    ' CROUCH_WALK
    ( 160, 168, 10 ),_    ' CROUCH_ATTACK
    ( 169, 172,  7 ),_    ' CROUCH_PAIN
    ( 173, 177,  5 ),_    ' CROUCH_DEATH
    ( 178, 183,  7 ),_    ' DEATH_FALLBACK
    ( 184, 189,  7 ),_    ' DEATH_FALLFORWARD
    ( 190, 197,  7 ),_    ' DEATH_FALLBACKSLOW
    ( 198, 198,  5 ) }    ' BOOM

' animation list
Enum md2_anim 
   md2_STAND  = 0  
   md2_Run    '=1 
   md2_ATTACK '=2 
   md2_PAIN_A '=3 
   md2_PAIN_B '=4 
   md2_PAIN_C '=5 
   md2_JUMP   '=6 
   md2_FLIP   '=7 
   md2_SALUTE '=8 
   md2_FALLBACK '=9 
   md2_WAVE   '=10 
   md2_POINT  '=11 
   md2_CROUCH_STAND '=12 
   md2_CROUCH_WALK '=13 
   md2_CROUCH_ATTACK '=14
   md2_CROUCH_PAIN '=15
   md2_CROUCH_DEATH '=16 
   md2_DEATH_FALLBACK '=17
   md2_DEATH_FALLFORWARD '=18
   md2_DEATH_FALLBACKSLOW '=19
   md2_BOOM '=20
  md2_random '21
  md2_all  '22
  md2_other '23
  md2_MAX_ANIMATIONS '=24
End Enum 
Static Shared As String md2_anim_list(22) 
   md2_anim_list(0)="STAND" '=0  
   md2_anim_list(1)="RUN"    '=1 
   md2_anim_list(2)="ATTACK" '=2 
   md2_anim_list(3)="PAIN_A" '=3 
   md2_anim_list(4)="PAIN_B" '=4 
   md2_anim_list(5)="PAIN_C" '=5 
   md2_anim_list(6)="JUMP"   '=6 
   md2_anim_list(7)="FLIP"   '=7 
   md2_anim_list(8)="SALUTE" '=8 
   md2_anim_list(9)="FALLBACK" '=9 
   md2_anim_list(10)="WAVE"   '=10 
   md2_anim_list(11)="POINT"  '=11 
   md2_anim_list(12)="CROUCH_STAND" '=12 
   md2_anim_list(13)="CROUCH_WALK" '=13 
   md2_anim_list(14)="CROUCH_ATTACK" '=14
   md2_anim_list(15)="CROUCH_PAIN" '=15
   md2_anim_list(16)="CROUCH_DEATH" '=16 
   md2_anim_list(17)="DEATH_FALLBACK" '=17
   md2_anim_list(18)="DEATH_FALLFORWARD" '=18
   md2_anim_list(19)="DEATH_FALLBACKSLOW" '=19
   md2_anim_list(20)="BOOM" '=20
   md2_anim_list(21)="random" '=21
   md2_anim_list(22)="all" '=22

'/
