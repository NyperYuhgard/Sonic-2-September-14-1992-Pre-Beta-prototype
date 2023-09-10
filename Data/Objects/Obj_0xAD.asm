;===============================================================================
; Objeto 0xAD - Plataforma embaixo do Inimigo Clucker na Sky Fortress
; ->>> 
;===============================================================================
; Offset_0x0337FA:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x033808(PC, D0), D1
                jmp     Offset_0x033808(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x033808:
                dc.w    Offset_0x03380C-Offset_0x033808
                dc.w    Offset_0x033818-Offset_0x033808
;-------------------------------------------------------------------------------  
Offset_0x03380C:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$0C, Obj_Map_Id(A0)                             ; $001A
                rts
;-------------------------------------------------------------------------------                
Offset_0x033818:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0008, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_19_To_SolidObject                  ; Offset_0x03764A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608                              
;===============================================================================
; Objeto 0xAD - Plataforma embaixo do Inimigo Clucker na Sky Fortress
; <<<- 
;===============================================================================