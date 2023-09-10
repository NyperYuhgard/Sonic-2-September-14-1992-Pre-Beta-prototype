;===============================================================================
; Objeto 0x12 - Esmeralda Mestre na Hidden Palace
; ->>>        
;===============================================================================     
; Offset_0x01ADA8:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01ADB6(PC, D0), D1
                jmp     Offset_0x01ADB6(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x01ADB6:
                dc.w    Offset_0x01ADBA-Offset_0x01ADB6
                dc.w    Offset_0x01ADE2-Offset_0x01ADB6   
;-------------------------------------------------------------------------------       
Offset_0x01ADBA:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Master_Emerald_Mappings, Obj_Map(A0) ; Offset_0x01AE0E, $0004
                move.w  #$6392, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_02_To_ModifySpriteAttr_2P          ; Offset_0x01AE30
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
;-------------------------------------------------------------------------------                 
Offset_0x01ADE2:
                move.w  #$0020, D1
                move.w  #$0010, D2
                move.w  #$0010, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     SolidObject                            ; Offset_0x0147F4
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_02_To_DeleteObject                 ; Offset_0x01AE2A
                bra     Jmp_02_To_DisplaySprite                ; Offset_0x01AE24
;-------------------------------------------------------------------------------    
Master_Emerald_Mappings:                                       ; Offset_0x01AE0E
                dc.w    Offset_0x01AE10-Master_Emerald_Mappings
Offset_0x01AE10:
                dc.w    $0002
                dc.l    $F00F0000, $0000FFE0
                dc.l    $F00F0010, $00080000
;===============================================================================   
; Objeto 0x12 - Esmeralda Mestre na Hidden Palace
; <<<-        
;===============================================================================