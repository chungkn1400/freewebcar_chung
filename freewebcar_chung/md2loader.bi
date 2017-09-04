'md2loader.bi freeware (2010)    
'
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

    const md2_sig as integer = &H32504449
    
    /' md2 header '/
    type md2_header  Field=1
        
        as integer ident          /' magic number: "IDP2" '/
        as integer version        /' version: must be 8 '/

        as integer skinwidth      /' texture width '/
        as integer skinheight     /' texture height '/

        as integer framesize      /' size in bytes of a frame '/

        as integer num_skins      /' number of skins '/
        as integer num_vertices   /' number of vertices per frame '/
        as integer num_st         /' number of texture coordinates '/
        as integer num_tris       /' number of triangles '/
        as integer num_glcmds     /' number of opengl commands '/
        as integer num_frames     /' number of frames '/

        as integer offset_skins   /' offset skin data '/
        as integer offset_st      /' offset texture coordinate data '/
        as integer offset_tris    /' offset triangle data '/
        as integer offset_frames  /' offset frame data '/
        as integer offset_glcmds  /' offset OpenGL command data '/
        as integer offset_end     /' offset end of file '/
        
    end type
    
    /' vector '/
    type vec3_t  Field=1 
        as glfloat x, y, z
    end type
    
    /' texture name '/
    type md2_skin  Field=1   
        as string * 64 name                 /' texture file name '/
    end type
    
    /' texture coords '/
    type md2_texCoord  Field=1  
        as short s, t
    end type
    
    /' triangle data '/
    type md2_triangle  Field=1   
        as unsigned short vertex(2)         /' vertex indices of the triangle '/
        as unsigned short st(2)             /' tex. coord. indices '/
    end type

    /' vertex data '/
    type md2_vertex  Field=1  
        as unsigned byte  v(2)              /' position '/
        as unsigned byte  normalIndex       /' normal vector index '/
    end type

    
    /' frame data '/
    type md2_frame  Field=1 
        as vec3_t           scale           /' scale factor '/
        as vec3_t           translate       /' translation vector '/
        as string * 16      name            /' frame name '/
        as md2_vertex    ptr verts           ' list of frame's vertices '/

    end type

    Type md2_joints  Field=1 
    	  As uint njoint
    	  As uint verticejoint(20)
    	  As Sub() subjoint(20)
        As Single vxjoint(20)
        As Single vyjoint(20)
        As Single vzjoint(20)
        As Single vxjoint2(20)
        As Single vyjoint2(20)
        As Single vzjoint2(20)
        As Single vxjoint3(20)
        As Single vyjoint3(20)
        As Single vzjoint3(20)
                
    End Type
    
    type md2_model  Field=1 
        
        as md2_header           header
        as md2_skin         Ptr skins
        as md2_texCoord     Ptr texcoords
        as md2_triangle     ptr triangles
        as md2_frame        Ptr frames
        as integer          ptr glcmds
        as GLuint               tex_id
        As Single dx  'offsets
        As Single dy
        As Single dz
        As Single bxmin
        As Single bymin
        As Single bzmin
        As Single bxmax
        As Single bymax
        As Single bzmax
    end type

    type md2_glcmd  Field=1
        as glfloat              s
        as glfloat              t
        as integer              index
    end type

    Type md2_node   Field=1
      	As md2_model Ptr md2model
      	As md2_joints joints
      	As uint texture
      	As uint anim
      	As uint startframe
      	As uint endframe
      	As Single fps
      	As Single nframe
      	As Single x
      	As Single y
      	As Single z
      	As Single rotx
      	As Single roty
      	As Single rotz
      	As Single scalex
      	As Single scaley
      	As Single scalez
    End Type
   
    static shared as vec3_t anorms_table(161) => {  _
    ( -0.262866f,  0.951056f, -0.162460f ), _
    (  0.000000f,  1.000000f,  0.000000f ), _
    (  0.000000f,  0.955423f,  0.295242f ), _
    ( -0.262866f,  0.951056f,  0.162460f ), _
    (  0.238856f,  0.864188f,  0.442863f ), _
    (  0.262866f,  0.951056f,  0.162460f ), _
    (  0.500000f,  0.809017f,  0.309017f ), _
    (  0.238856f,  0.864188f, -0.442863f ), _
    (  0.262866f,  0.951056f, -0.162460f ), _
    (  0.500000f,  0.809017f, -0.309017f ), _
    (  0.850651f,  0.525731f,  0.000000f ), _
    (  0.716567f,  0.681718f,  0.147621f ), _
    (  0.716567f,  0.681718f, -0.147621f ), _
    (  0.525731f,  0.850651f,  0.000000f ), _
    (  0.425325f,  0.688191f,  0.587785f ), _
    (  0.864188f,  0.442863f,  0.238856f ), _
    (  0.688191f,  0.587785f,  0.425325f ), _
    (  0.809017f,  0.309017f,  0.500000f ), _
    (  0.681718f,  0.147621f,  0.716567f ), _
    (  0.587785f,  0.425325f,  0.688191f ), _
    (  0.955423f,  0.295242f,  0.000000f ), _
    (  1.000000f,  0.000000f,  0.000000f ), _
    (  0.951056f,  0.162460f,  0.262866f ), _
    (  0.850651f, -0.525731f,  0.000000f ), _
    (  0.955423f, -0.295242f,  0.000000f ), _
    (  0.864188f, -0.442863f,  0.238856f ), _
    (  0.951056f, -0.162460f,  0.262866f ), _
    (  0.809017f, -0.309017f,  0.500000f ), _
    (  0.681718f, -0.147621f,  0.716567f ), _
    (  0.850651f,  0.000000f,  0.525731f ), _
    (  0.864188f,  0.442863f, -0.238856f ), _
    (  0.809017f,  0.309017f, -0.500000f ), _
    (  0.951056f,  0.162460f, -0.262866f ), _
    (  0.525731f,  0.000000f, -0.850651f ), _
    (  0.681718f,  0.147621f, -0.716567f ), _
    (  0.681718f, -0.147621f, -0.716567f ), _
    (  0.850651f,  0.000000f, -0.525731f ), _
    (  0.809017f, -0.309017f, -0.500000f ), _
    (  0.864188f, -0.442863f, -0.238856f ), _
    (  0.951056f, -0.162460f, -0.262866f ), _
    (  0.147621f,  0.716567f, -0.681718f ), _
    (  0.309017f,  0.500000f, -0.809017f ), _
    (  0.425325f,  0.688191f, -0.587785f ), _
    (  0.442863f,  0.238856f, -0.864188f ), _
    (  0.587785f,  0.425325f, -0.688191f ), _
    (  0.688191f,  0.587785f, -0.425325f ), _
    ( -0.147621f,  0.716567f, -0.681718f ), _
    ( -0.309017f,  0.500000f, -0.809017f ), _
    (  0.000000f,  0.525731f, -0.850651f ), _
    ( -0.525731f,  0.000000f, -0.850651f ), _
    ( -0.442863f,  0.238856f, -0.864188f ), _ 
    ( -0.295242f,  0.000000f, -0.955423f ), _ 
    ( -0.162460f,  0.262866f, -0.951056f ), _ 
    (  0.000000f,  0.000000f, -1.000000f ), _ 
    (  0.295242f,  0.000000f, -0.955423f ), _ 
    (  0.162460f,  0.262866f, -0.951056f ), _ 
    ( -0.442863f, -0.238856f, -0.864188f ), _ 
    ( -0.309017f, -0.500000f, -0.809017f ), _ 
    ( -0.162460f, -0.262866f, -0.951056f ), _ 
    (  0.000000f, -0.850651f, -0.525731f ), _ 
    ( -0.147621f, -0.716567f, -0.681718f ), _ 
    (  0.147621f, -0.716567f, -0.681718f ), _ 
    (  0.000000f, -0.525731f, -0.850651f ), _ 
    (  0.309017f, -0.500000f, -0.809017f ), _ 
    (  0.442863f, -0.238856f, -0.864188f ), _ 
    (  0.162460f, -0.262866f, -0.951056f ), _ 
    (  0.238856f, -0.864188f, -0.442863f ), _ 
    (  0.500000f, -0.809017f, -0.309017f ), _ 
    (  0.425325f, -0.688191f, -0.587785f ), _ 
    (  0.716567f, -0.681718f, -0.147621f ), _ 
    (  0.688191f, -0.587785f, -0.425325f ), _ 
    (  0.587785f, -0.425325f, -0.688191f ), _ 
    (  0.000000f, -0.955423f, -0.295242f ), _ 
    (  0.000000f, -1.000000f,  0.000000f ), _ 
    (  0.262866f, -0.951056f, -0.162460f ), _ 
    (  0.000000f, -0.850651f,  0.525731f ), _ 
    (  0.000000f, -0.955423f,  0.295242f ), _ 
    (  0.238856f, -0.864188f,  0.442863f ), _ 
    (  0.262866f, -0.951056f,  0.162460f ), _ 
    (  0.500000f, -0.809017f,  0.309017f ), _ 
    (  0.716567f, -0.681718f,  0.147621f ), _ 
    (  0.525731f, -0.850651f,  0.000000f ), _ 
    ( -0.238856f, -0.864188f, -0.442863f ), _ 
    ( -0.500000f, -0.809017f, -0.309017f ), _ 
    ( -0.262866f, -0.951056f, -0.162460f ), _ 
    ( -0.850651f, -0.525731f,  0.000000f ), _ 
    ( -0.716567f, -0.681718f, -0.147621f ), _ 
    ( -0.716567f, -0.681718f,  0.147621f ), _ 
    ( -0.525731f, -0.850651f,  0.000000f ), _ 
    ( -0.500000f, -0.809017f,  0.309017f ), _ 
    ( -0.238856f, -0.864188f,  0.442863f ), _ 
    ( -0.262866f, -0.951056f,  0.162460f ), _ 
    ( -0.864188f, -0.442863f,  0.238856f ), _ 
    ( -0.809017f, -0.309017f,  0.500000f ), _ 
    ( -0.688191f, -0.587785f,  0.425325f ), _ 
    ( -0.681718f, -0.147621f,  0.716567f ), _ 
    ( -0.442863f, -0.238856f,  0.864188f ), _ 
    ( -0.587785f, -0.425325f,  0.688191f ), _ 
    ( -0.309017f, -0.500000f,  0.809017f ), _ 
    ( -0.147621f, -0.716567f,  0.681718f ), _ 
    ( -0.425325f, -0.688191f,  0.587785f ), _ 
    ( -0.162460f, -0.262866f,  0.951056f ), _ 
    (  0.442863f, -0.238856f,  0.864188f ), _ 
    (  0.162460f, -0.262866f,  0.951056f ), _ 
    (  0.309017f, -0.500000f,  0.809017f ), _ 
    (  0.147621f, -0.716567f,  0.681718f ), _ 
    (  0.000000f, -0.525731f,  0.850651f ), _ 
    (  0.425325f, -0.688191f,  0.587785f ), _ 
    (  0.587785f, -0.425325f,  0.688191f ), _ 
    (  0.688191f, -0.587785f,  0.425325f ), _ 
    ( -0.955423f,  0.295242f,  0.000000f ), _ 
    ( -0.951056f,  0.162460f,  0.262866f ), _ 
    ( -1.000000f,  0.000000f,  0.000000f ), _ 
    ( -0.850651f,  0.000000f,  0.525731f ), _ 
    ( -0.955423f, -0.295242f,  0.000000f ), _ 
    ( -0.951056f, -0.162460f,  0.262866f ), _ 
    ( -0.864188f,  0.442863f, -0.238856f ), _ 
    ( -0.951056f,  0.162460f, -0.262866f ), _ 
    ( -0.809017f,  0.309017f, -0.500000f ), _ 
    ( -0.864188f, -0.442863f, -0.238856f ), _ 
    ( -0.951056f, -0.162460f, -0.262866f ), _ 
    ( -0.809017f, -0.309017f, -0.500000f ), _ 
    ( -0.681718f,  0.147621f, -0.716567f ), _ 
    ( -0.681718f, -0.147621f, -0.716567f ), _ 
    ( -0.850651f,  0.000000f, -0.525731f ), _ 
    ( -0.688191f,  0.587785f, -0.425325f ), _ 
    ( -0.587785f,  0.425325f, -0.688191f ), _ 
    ( -0.425325f,  0.688191f, -0.587785f ), _ 
    ( -0.425325f, -0.688191f, -0.587785f ), _ 
    ( -0.587785f, -0.425325f, -0.688191f ), _ 
    ( -0.688191f, -0.587785f, -0.425325f )}


    function ReadMD2Model (byref filename as string, byval mdl as md2_model ptr) as integer
        
        If mdl = 0 then return 0
        
        dim fp as integer
        
        fp = freefile
        
        if open (filename for binary access read as #fp) <> 0 Then
            messagebox(0,"!error: couldn't open !"+ filename,"readMD2model",0)
            return 0
        end if

        /' read header '/
        get #fp,, mdl->header

        if ((mdl->header.ident <> md2_sig) or (mdl->header.version <> 8)) then
            /' error! '/
            messagebox(0,"error: bad version!","ReadMD2model",0)
            close #fp
            return 0
        end if

        /' memory allocation '/
        mdl->skins      = callocate (sizeof (md2_skin    )     * mdl->header.num_skins)
        mdl->texcoords  = callocate (sizeof (md2_texCoord    ) * mdl->header.num_st)
        mdl->triangles  = callocate (sizeof (md2_triangle  ) * mdl->header.num_tris)
        mdl->frames     = callocate (sizeof (md2_frame    )    * mdl->header.num_frames)
        mdl->glcmds     = callocate (sizeof (integer)        * mdl->header.num_glcmds)
        
        /' read model data '/
        seek #fp,  mdl->header.offset_skins + 1
        get  #fp,, *mdl->skins, mdl->header.num_skins

        seek #fp,  mdl->header.offset_st + 1
        get  #fp,, *mdl->texcoords, mdl->header.num_st

        seek #fp,  mdl->header.offset_tris + 1
        get  #fp,, *mdl->triangles,mdl->header.num_tris

        seek #fp,  mdl->header.offset_glcmds + 1
        get  #fp,, *mdl->glcmds, mdl->header.num_glcmds
    
        /' read frames '/
        seek #fp, mdl->header.offset_frames + 1
        for i as integer = 0 to mdl->header.num_frames - 1
    
            /' memory allocation for vertices of this frame '/
            'mdl->frames[i].verts = Callocate (sizeof(md2_vertex     ) * mdl->header.num_vertices)
            mdl->frames[i].verts =Callocate( mdl->header.num_vertices,sizeof(md2_vertex     ) )
            
            /' read frame data '/
            get #fp,, mdl->frames[i].scale
            get #fp,, mdl->frames[i].translate
            get #fp,, mdl->frames[i].name
            get #fp,, *mdl->frames[i].verts, mdl->header.num_vertices
            'If Eof(fp)<>0 Then notice("eof !"):Exit For 
        next
        
        close #fp

        'notice(Str(mdl->header.num_skins))
        'notice(Str(mdl->header.skinwidth)+" "+Str(mdl->header.skinheight),"skin")
        return -1
        
    end Function    
    sub freeMD2model (byval mdl as md2_model ptr)

        if mdl = 0 then return

        if (mdl->skins) then
            deallocate (mdl->skins)
            mdl->skins = NULL
        end if

        if (mdl->texcoords) then
          deallocate (mdl->texcoords)
          mdl->texcoords = NULL
        end if

        If (mdl->triangles) then
            deallocate (mdl->triangles)
            mdl->triangles = NULL
        end if

        if (mdl->glcmds) then
            deallocate (mdl->glcmds)
            mdl->glcmds = NULL
        end if

        if (mdl->frames) then
            for i as integer = 0 to mdl->header.num_frames - 1
                deallocate (mdl->frames[i].verts)
                mdl->frames[i].verts = NULL
            next
            
            deallocate (mdl->frames)
            mdl->frames = NULL            
            
        end if

    end Sub    
Sub drawMd2 (byval md2node As md2_node ptr, ByVal glnormal As Integer = 0)
        Dim As Integer n
        Dim As md2_model Ptr mdl
        n=Int(md2node->nframe)
        mdl=md2node->md2model
        gltranslatef(mdl->dx,mdl->dy,mdl->dz)

        dim as GLfloat      s, t
        Dim As uint         ivertice,maxvertice,j,k 
        dim as vec3_t       v
        dim as md2_frame    ptr pframe
        dim as md2_vertex   Ptr pvert
        Dim As Single scalex,scaley,scalez,translatex,translatey,translatez,vx,vy,vz

        /' check if n is in a valid range '/
        if ((n < 0) or (n > mdl->header.num_frames - 1)) then Return

        /' enable models texture '/
        glBindTexture (GL_TEXTURE_2D, md2node->texture)

        pframe = @mdl->frames[n]
        maxvertice= mdl->header.num_vertices - 1
        scalex=pframe->scale.x 
        scaley=pframe->scale.y 
        scalez=pframe->scale.z 
        translatex=pframe->translate.x
        translatey=pframe->translate.y
        translatez=pframe->translate.z
        /' draw the model '/
        glBegin (GL_TRIANGLES)
        
        /' draw each triangle '/
        for i as integer = 0 to mdl->header.num_tris - 1
            /' draw each vertex '/
            for k = 0 to 2
              ivertice=mdl->triangles[i].vertex(k)
              If ivertice<=maxvertice Then 
                pvert = @pframe->verts[ivertice]

                /' normal vector '/
                If glnormal=1 And k=0 Then glNormal3fv (cast(GLfloat ptr, @anorms_table(pvert->normalIndex)))

                /' compute texture coordinates '/
                s = mdl->texcoords[mdl->triangles[i].st(k)].s / mdl->header.skinwidth
                t = mdl->texcoords[mdl->triangles[i].st(k)].t / mdl->header.skinheight

                /' pass texture coordinates to OpenGL '/
                glTexCoord2f (s, t)

                    /' calculate vertex real position '/
                    vx = (scalex * pvert->v(0)) + translatex
                    vy = (scaley * pvert->v(1)) + translatey
                    vz = (scalez * pvert->v(2)) + translatez
                 
                    glvertex3f( vx,vy,vz )
                  
                With md2node->joints
                If .njoint>0 Then
                	For j=1 To .njoint
                		If ivertice=.verticejoint(j) Then
                			.vxjoint(j)=vx
                			.vyjoint(j)=vy
                			.vzjoint(j)=vz
                		EndIf
                		If ivertice=.verticejoint(j)+1 Then
                			.vxjoint2(j)=vx
                			.vyjoint2(j)=vy
                			.vzjoint2(j)=vz
                		EndIf
                		If ivertice=.verticejoint(j)+2 Then
                			.vxjoint3(j)=vx
                			.vyjoint3(j)=vy
                			.vzjoint3(j)=vz
                		EndIf
                	Next
                EndIf
                End With 

               EndIf    
            next
        next
        
        glEnd ()
    
end sub 
Sub drawMd2_glcmds (byval md2node As md2_node ptr, ByVal glnormal As Integer = 0)
        Dim As Integer n
        Dim As md2_model Ptr mdl
        n=Int(md2node->nframe)
        mdl=md2node->md2model
        gltranslatef(mdl->dx,mdl->dy,mdl->dz)
        
        dim as integer          i,j,maxvertice,ivertice
        dim as integer      ptr pglcmds
        dim as vec3_t           v
        dim as md2_frame    Ptr pframe
        dim as md2_vertex   Ptr pvert
        dim as md2_glcmd    ptr packet
        Dim As Single scalex,scaley,scalez,translatex,translatey,translatez,vx,vy,vz

        /' check if n is in a valid range '/
        if ((n < 0) or (n > mdl->header.num_frames - 1)) then return

        /' enable models texture '/
        glBindTexture (GL_TEXTURE_2D, md2node->texture)

        /' pglcmds points at the start of the command list '/
        pglcmds = mdl->glcmds
        
        pframe = @mdl->frames[n]
        
        maxvertice= mdl->header.num_vertices - 1
        scalex=pframe->scale.x 
        scaley=pframe->scale.y 
        scalez=pframe->scale.z 
        translatex=pframe->translate.x
        translatey=pframe->translate.y
        translatez=pframe->translate.z

         /' draw the model '/
        do
            i = *(pglcmds)
            
            if i = 0 then exit do
            
            if (i < 0) then
                glBegin (GL_TRIANGLE_FAN)
                i = -i
            else
                glBegin (GL_TRIANGLE_STRIP)
            end if
            
            pglcmds+=1
            packet = cast(md2_glcmd   ptr, pglcmds)
            
            /' draw each vertex of this group '/
            for pID as integer = 0 to i - 1
                ivertice=packet[pID].index 
                if ivertice <= maxvertice then
                    pvert = @pframe->verts[ivertice]
                    
                    /' normal vector '/
                    If glnormal=1 Then
                    	glNormal3fv (cast(GLfloat ptr, @anorms_table(pvert->normalIndex)))
                    EndIf
                    /' pass texture coordinates to OpenGL '/
                    glTexCoord2f (packet[pID].s, packet[pID].t)

                    /' calculate vertex real position '/
                    vx = (scalex * pvert->v(0)) + translatex
                    vy = (scaley * pvert->v(1)) + translatey
                    vz = (scalez * pvert->v(2)) + translatez
                 
                    glvertex3f( vx,vy,vz )
                  
                With md2node->joints
                If .njoint>0 Then
                	For j=1 To .njoint
                		If ivertice=.verticejoint(j) Then
                			.vxjoint(j)=vx
                			.vyjoint(j)=vy
                			.vzjoint(j)=vz
                		EndIf
                		If ivertice=.verticejoint(j)+1 Then
                			.vxjoint2(j)=vx
                			.vyjoint2(j)=vy
                			.vzjoint2(j)=vz
                		EndIf
                		If ivertice=.verticejoint(j)+2 Then
                			.vxjoint3(j)=vx
                			.vyjoint3(j)=vy
                			.vzjoint3(j)=vz
                		EndIf
                	Next
                EndIf
                End With 
                
               End if
                
               pglcmds += 3
                
            next
            
            glEnd ()
            
        loop

    end sub
Sub drawMd2_inter (byval md2node As md2_node ptr, ByVal glnormal As Integer = 0)
        Dim As Integer n
        Dim As Single interp
        Dim As md2_model Ptr mdl
        n=Int(md2node->nframe)
        interp=md2node->nframe-n
        mdl=md2node->md2model
        gltranslatef(mdl->dx,mdl->dy,mdl->dz)

        dim as GLfloat          s, t
        Dim As md2_texCoord     st  
        Dim As integer          ivertice,maxvertice,j,k
        Dim as vec3_t       Ptr n_curr, n_next
        dim as md2_frame    Ptr pframe1, pframe2
        dim as md2_vertex   Ptr pvert1, pvert2
        Dim As Single scalex,scaley,scalez,translatex,translatey,translatez
        Dim As Single scale2x,scale2y,scale2z,translate2x,translate2y,translate2z
        Dim As Single v_currx,v_curry,v_currz,v_nextx,v_nexty,v_nextz,vx,vy,vz,nx,ny,nz

        /' check if n is in a valid range '/
        if ((n < 0) or (n > mdl->header.num_frames-1)) then return

        /' enable models texture '/
        glBindTexture (GL_TEXTURE_2D, md2node->texture)

        /' draw the model '/
        glBegin (GL_TRIANGLES)
        
        pframe1 = @mdl->frames[n]
        
        if (mdl->header.num_frames-1) > n then
            pframe2 = @mdl->frames[n + 1]
        else
            pframe2 = @mdl->frames[n]
        end If                
        maxvertice= mdl->header.num_vertices - 1
        scalex=pframe1->scale.x 
        scaley=pframe1->scale.y 
        scalez=pframe1->scale.z 
        translatex=pframe1->translate.x
        translatey=pframe1->translate.y
        translatez=pframe1->translate.z
        scale2x=pframe2->scale.x 
        scale2y=pframe2->scale.y 
        scale2z=pframe2->scale.z 
        translate2x=pframe2->translate.x
        translate2y=pframe2->translate.y
        translate2z=pframe2->translate.z
                 
        /' draw each triangle '/
        for i as integer = 0 to mdl->header.num_tris - 1

            /' draw each vertex '/
            for k = 0 to 2
          
              ivertice=mdl->triangles[i].vertex(k)
              If ivertice<=maxvertice Then 
                pvert1 = @pframe1->verts[ivertice]
                pvert2 = @pframe2->verts[ivertice]

                /' interpolate normals '/
                If glnormal=1 And k=0 Then 
                 n_curr = @(anorms_table(pvert1->normalIndex))
                 n_next = @(anorms_table(pvert2->normalIndex))

                 nx = n_curr->x + interp * (n_next->x - n_curr->x)
                 ny = n_curr->y + interp * (n_next->y - n_curr->y)
                 nz = n_curr->z + interp * (n_next->z - n_curr->z)

                 glnormal3f( nx,ny,nz )
                EndIf 

                /' compute texture coordinates '/
                st=mdl->texcoords[mdl->triangles[i].st(k)]
                s = Cast(glfloat,st.s) /mdl->header.skinwidth
                t = Cast(glfloat,st.t) /mdl->header.skinheight

                /' pass texture coordinates to OpenGL '/
                glTexCoord2f (s, t)
                               
                /' interpolate vertices '/
                v_currx = scalex * pvert1->v(0) + translatex
                v_curry = scaley * pvert1->v(1) + translatey
                v_currz = scalez * pvert1->v(2) + translatez

                v_nextx = scale2x * pvert2->v(0) + translate2x
                v_nexty = scale2y * pvert2->v(1) + translate2y
                v_nextz = scale2z * pvert2->v(2) + translate2z

                vx = v_currx + interp * (v_nextx - v_currx)
                vy = v_curry + interp * (v_nexty - v_curry)
                vz = v_currz + interp * (v_nextz - v_currz)
              
                glvertex3f( vx,vy,vz )
                
                With md2node->joints
                If .njoint>0 Then
                	For j=1 To .njoint
                		If ivertice=.verticejoint(j) Then
                			.vxjoint(j)=vx
                			.vyjoint(j)=vy
                			.vzjoint(j)=vz
                		EndIf
                		If ivertice=.verticejoint(j)+1 Then
                			.vxjoint2(j)=vx
                			.vyjoint2(j)=vy
                			.vzjoint2(j)=vz
                		EndIf
                		If ivertice=.verticejoint(j)+2 Then
                			.vxjoint3(j)=vx
                			.vyjoint3(j)=vy
                			.vzjoint3(j)=vz
                		EndIf
                	Next
                EndIf
                End With 

              EndIf                  
            next
        next
        
        glEnd ()
    
end Sub
Sub drawMd2_inter_glcmds (byval md2node As md2_node ptr, ByVal glnormal As Integer = 0)
        Dim As Integer n
        Dim As Single interp
        Dim As md2_model Ptr mdl
        n=Int(md2node->nframe)
        interp=md2node->nframe-n
        mdl=md2node->md2model
        gltranslatef(mdl->dx,mdl->dy,mdl->dz)
           
        dim as integer          i,ivertice,maxvertice,j
        dim as integer      ptr pglcmds
        dim as vec3_t       Ptr n_curr,n_next
        dim as md2_frame    Ptr pframe1, pframe2
        dim as md2_vertex   ptr pvert1, pvert2
        dim as md2_glcmd    ptr packet
        Dim As Single scalex,scaley,scalez,translatex,translatey,translatez
        Dim As Single scale2x,scale2y,scale2z,translate2x,translate2y,translate2z
        Dim As Single v_currx,v_curry,v_currz,v_nextx,v_nexty,v_nextz,vx,vy,vz,nx,ny,nz

        /' check if n is in a valid range '/
        if ((n < 0) or (n > mdl->header.num_frames - 1)) then return

        /' enable models texture '/
        glBindTexture (GL_TEXTURE_2D, md2node->texture)

        /' pglcmds points at the start of the command list '/
        pglcmds = mdl->glcmds
        
        pframe1 = @mdl->frames[n]
        
        if (mdl->header.num_frames-1)> n then
            pframe2 = @mdl->frames[n + 1]
        else
            pframe2 = @mdl->frames[n]
        end if
        
        maxvertice= mdl->header.num_vertices - 1
        scalex=pframe1->scale.x 
        scaley=pframe1->scale.y 
        scalez=pframe1->scale.z 
        translatex=pframe1->translate.x
        translatey=pframe1->translate.y
        translatez=pframe1->translate.z
        scale2x=pframe2->scale.x 
        scale2y=pframe2->scale.y 
        scale2z=pframe2->scale.z 
        translate2x=pframe2->translate.x
        translate2y=pframe2->translate.y
        translate2z=pframe2->translate.z
         
        /' draw the model '/
        do
            
            i = *(pglcmds)
            
            if i = 0 then exit do
    
            if (i < 0) then
                glBegin (GL_TRIANGLE_FAN)
                i = -i
            else
                glBegin (GL_TRIANGLE_STRIP)
            end if
            
            pglcmds+=1
            packet = cast(md2_glcmd   ptr, pglcmds)
            
            /' draw each vertex of this group '/
            for pID as integer = 0 to i - 1
                
              ivertice=packet[pID].index
              If ivertice<=maxvertice Then 
                pvert1 = @pframe1->verts[ivertice]
                pvert2 = @pframe2->verts[ivertice]

                /' pass texture coordinates to OpenGL '/
                glTexCoord2f (packet[pID].s, packet[pID].t)

                /' interpolate normals '/
                If glnormal=1 Then 
                 n_curr = @(anorms_table(pvert1->normalIndex))
                 n_next = @(anorms_table(pvert2->normalIndex))

                 nx = n_curr->x + interp * (n_next->x - n_curr->x)
                 ny = n_curr->y + interp * (n_next->y - n_curr->y)
                 nz = n_curr->z + interp * (n_next->z - n_curr->z)

                 glnormal3f( nx,ny,nz )
                EndIf 
                /' interpolate vertices '/
                v_currx = scalex * pvert1->v(0) + translatex
                v_curry = scaley * pvert1->v(1) + translatey
                v_currz = scalez * pvert1->v(2) + translatez

                v_nextx = scale2x * pvert2->v(0) + translate2x
                v_nexty = scale2y * pvert2->v(1) + translate2y
                v_nextz = scale2z * pvert2->v(2) + translate2z

                vx = v_currx + interp * (v_nextx - v_currx)
                vy = v_curry + interp * (v_nexty - v_curry)
                vz = v_currz + interp * (v_nextz - v_currz)
              
                glvertex3f( vx,vy,vz )
                
                With md2node->joints
                If .njoint>0 Then
                	For j=1 To .njoint
                		If ivertice=.verticejoint(j) Then
                			.vxjoint(j)=vx
                			.vyjoint(j)=vy
                			.vzjoint(j)=vz
                		EndIf
                		If ivertice=.verticejoint(j)+1 Then
                			.vxjoint2(j)=vx
                			.vyjoint2(j)=vy
                			.vzjoint2(j)=vz
                		EndIf
                		If ivertice=.verticejoint(j)+2 Then
                			.vxjoint3(j)=vx
                			.vyjoint3(j)=vy
                			.vzjoint3(j)=vz
                		EndIf
                	Next
                EndIf
                End With 
              EndIf   
              pglcmds += 3
                
            next

            glEnd ()
            
        loop
    end sub
Declare Sub getboxMd2 (byval mdl As md2_model Ptr) 
Function loadmd2model(ByRef filename As String,_  
	                   ByVal dx As Single=0,ByVal dy As Single=0,ByVal dz As Single=0) As md2_model Ptr 
Dim As md2_model Ptr md2model
        /' load model file '/
        md2model  = Callocate (sizeof (md2_model))
        
        Dim As ZString * 256 file
        file=filename
        if ReadMD2model (file, md2model ) = 0 then
            end(-1)
        end If
        md2model->dx=dx
        md2model->dy=dy
        md2model->dz=dz
        'notice("nglcmds="+Str(md2model ->header.num_glcmds))
        'notice("nframes="+Str(md2model ->header.num_frames))
        getboxMd2(md2model)
Return md2model       
End Function 
Sub deleteMD2model(ByRef md2model As md2_model Ptr)
        If md2model <>0 Then 
           freeMD2model(md2model )      
           DeAllocate (md2model )
           md2model  = NULL
        EndIf    
End Sub
Dim Shared As Single bxmin,bymin,bzmin,bxmax,bymax,bzmax,rmax
Sub getboxMd2 (byval mdl As md2_model Ptr) 
	     bxmin=0:bymin=0:bzmin=0:bxmax=0:bymax=0:bzmax=0
        Dim As Integer n
        'Dim As md2_model Ptr mdl
        n=0'Int(md2node->nframe)
        'mdl=md2node->md2model
        'gltranslatef(mdl->dx,mdl->dy,mdl->dz)

        dim as GLfloat      s, t
        Dim As uint         ivertice,maxvertice,j,k 
        dim as vec3_t       v
        dim as md2_frame    ptr pframe
        dim as md2_vertex   Ptr pvert
        Dim As Single scalex,scaley,scalez,translatex,translatey,translatez,vx,vy,vz

        /' check if n is in a valid range '/
        if ((n < 0) or (n > mdl->header.num_frames - 1)) then Return

        pframe = @mdl->frames[n]
        maxvertice= mdl->header.num_vertices - 1
        scalex=pframe->scale.x '* md2node->scalex
        scaley=pframe->scale.y '* md2node->scaley
        scalez=pframe->scale.z '* md2node->scalez
        translatex=pframe->translate.x +mdl->dx
        translatey=pframe->translate.y +mdl->dy
        translatez=pframe->translate.z +mdl->dz
        /' draw the model '/
        'glBegin (GL_TRIANGLES)
        
        /' draw each triangle '/
        for i as integer = 0 to mdl->header.num_tris - 1
            /' draw each vertex '/
            for k = 0 to 2
              ivertice=mdl->triangles[i].vertex(k)
              If ivertice<=maxvertice Then 
                pvert = @pframe->verts[ivertice]

                    /' calculate vertex real position '/
                    vx = (scalex * pvert->v(0)) + translatex
                    vy = (scaley * pvert->v(1)) + translatey
                    vz = (scalez * pvert->v(2)) + translatez
                 
                    'glvertex3f( vx,vy,vz )
                    bxmin=min(bxmin,vx):bymin=min(bymin,vy):bzmin=min(bzmin,vz)
                    bxmax=max(bxmax,vx):bymax=max(bymax,vy):bzmax=max(bzmax,vz)
                  
               EndIf    
            next
        next
        mdl->bxmin=bxmin
        mdl->bymin=bymin
        mdl->bzmin=bzmin
        mdl->bxmax=bxmax
        mdl->bymax=bymax
        mdl->bzmax=bzmax
        'glEnd ()
   
End Sub   
