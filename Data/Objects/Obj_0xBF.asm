;===============================================================================
; Objeto 0xBF
; ->>>
;===============================================================================
; Offset_0x035D86:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035D94(PC, D0), D1
                jmp     Offset_0x035D94(PC, D1)         
;-------------------------------------------------------------------------------
Offset_0x035D94:
                dc.w    Offset_0x035D98-Offset_0x035D94
                dc.w    Offset_0x035D9C-Offset_0x035D94
;-------------------------------------------------------------------------------    
Offset_0x035D98:
                bra     Object_Settings                        ; Offset_0x030A30
;-------------------------------------------------------------------------------                 
Offset_0x035D9C:
                lea     (Engine_Part_Animate_Data), A1         ; Offset_0x035DB4
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;------------------------------------------------------------------------------- 
Obj_0xBF_Ptr:                                                  ; Offset_0x035DAA
                dc.l    Engine_Part_Mappings                   ; Offset_0x035DBC
                dc.w    $E458
                dc.b    $04, $04, $04, $04      
;-------------------------------------------------------------------------------
Engine_Part_Animate_Data:                                      ; Offset_0x035DB4
                dc.w    Offset_0x035DB6-Engine_Part_Animate_Data
Offset_0x035DB6:
                dc.b    $01, $00, $01, $02, $FF, $00 
;-------------------------------------------------------------------------------   
Engine_Part_Mappings:                                          ; Offset_0x035DBC
                dc.w    Offset_0x035DC2-Engine_Part_Mappings
                dc.w    Offset_0x035DCC-Engine_Part_Mappings
                dc.w    Offset_0x035DD6-Engine_Part_Mappings
Offset_0x035DC2:
                dc.w    $0001
                dc.l    $F0030000, $0000FFFC
Offset_0x035DCC:
                dc.w    $0001
                dc.l    $F0030004, $0002FFFC
Offset_0x035DD6:
                dc.w    $0001
                dc.l    $F0030008, $0004FFFC                                                                                                     
;===============================================================================
; Objeto 0xBF
; <<<-
;===============================================================================