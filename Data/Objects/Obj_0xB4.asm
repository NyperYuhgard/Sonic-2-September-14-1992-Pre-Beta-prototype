;===============================================================================
; Objeto 0xB4 - Hélice Vertical na Sky Fortress
; ->>> 
;===============================================================================
; Offset_0x0352A4:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0352B2(PC, D0), D1
                jmp     Offset_0x0352B2(PC, D1)
;-------------------------------------------------------------------------------                   
Offset_0x0352B2:
                dc.w    Offset_0x0352B6-Offset_0x0352B2
                dc.w    Offset_0x0352BA-Offset_0x0352B2    
;------------------------------------------------------------------------------- 
Offset_0x0352B6:
                bra     Object_Settings                        ; Offset_0x030A30
;------------------------------------------------------------------------------- 
Offset_0x0352BA:
                lea     (Vertical_Helix_Animate_Data), A1      ; Offset_0x0352D2
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------  
Obj_0xB4_Ptr:                                                  ; Offset_0x0352C8
                dc.l    Vertical_Helix_Mappings                ; Offset_0x0352DA
                dc.w    $A561
                dc.b    $04, $04, $04, $A8
;-------------------------------------------------------------------------------
Vertical_Helix_Animate_Data:                                   ; Offset_0x0352D2
                dc.w    Offset_0x0352D4-Vertical_Helix_Animate_Data  
Offset_0x0352D4:
                dc.b    $01, $00, $01, $02, $FF, $00    
;-------------------------------------------------------------------------------   
Vertical_Helix_Mappings:                                       ; Offset_0x0352DA
                dc.w    Offset_0x0352E0-Vertical_Helix_Mappings
                dc.w    Offset_0x0352F2-Vertical_Helix_Mappings
                dc.w    Offset_0x035304-Vertical_Helix_Mappings
Offset_0x0352E0:
                dc.w    $0002
                dc.l    $C0030000, $0000FFFC
                dc.l    $E0031000, $1000FFFC
Offset_0x0352F2:
                dc.w    $0002
                dc.l    $E0030000, $0000FFFC
                dc.l    $00031000, $1000FFFC
Offset_0x035304:
                dc.w    $0002
                dc.l    $00030000, $0000FFFC
                dc.l    $20031000, $1000FFFC                                                                                                                                                              
;===============================================================================
; Objeto 0xB4 - Hélice Vertical na Sky Fortress
; <<<- 
;===============================================================================