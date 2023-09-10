;===============================================================================
; Objeto 0xB3 - Nuvens na Sky Chase
; ->>>
;===============================================================================
; Offset_0x03521A:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035228(PC, D0), D1
                jmp     Offset_0x035228(PC, D1)    
;-------------------------------------------------------------------------------
Offset_0x035228:
                dc.w    Offset_0x03522C-Offset_0x035228
                dc.w    Offset_0x03524E-Offset_0x035228  
;-------------------------------------------------------------------------------  
Offset_0x03522C:
                bsr     Object_Settings                        ; Offset_0x030A30
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                subi.b  #$56, D0
                move.w  Offset_0x035248(PC, D0), Obj_Speed(A0)           ; $0010
                lsr.w   #$01, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                rts                                               
;-------------------------------------------------------------------------------
Offset_0x035248:
                dc.w    $FF80, $FFC0, $FFE0
;-------------------------------------------------------------------------------
Offset_0x03524E:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                move.w  ($FFFFF736).w, D0
                add.w   D0, Obj_X(A0)                                    ; $0008
                bra     Offset_0x030C32          
;-------------------------------------------------------------------------------    
Obj_0xB3_Ptr:                                                  ; Offset_0x03525E
                dc.l    Clouds_Mappings                        ; Offset_0x035268
                dc.w    $454F
                dc.b    $04, $06, $30, $00    
;-------------------------------------------------------------------------------  
Clouds_Mappings:                                               ; Offset_0x035268
                dc.w    Offset_0x03526E-Clouds_Mappings
                dc.w    Offset_0x035288-Clouds_Mappings
                dc.w    Offset_0x03529A-Clouds_Mappings
Offset_0x03526E:
                dc.w    $0003
                dc.l    $FC0C0000, $0000FFD8
                dc.l    $FC0C0004, $0002FFF8
                dc.l    $FC040008, $00040018
Offset_0x035288:
                dc.w    $0002
                dc.l    $FC0C000A, $0005FFE8
                dc.l    $FC04000E, $00070008
Offset_0x03529A:
                dc.w    $0001
                dc.l    $FC040010, $0008FFF8                                                              
;===============================================================================
; Objeto 0xB3 - Nuvens na Sky Chase
; <<<-
;===============================================================================