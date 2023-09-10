;===============================================================================
; Objeto 0x3B - Pedra roxa na Green Hill do Sonic 1 não usado (Left over)
; ->>> 
;===============================================================================
; Offset_0x0118E4:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0118F2(PC, D0), D1
                jmp     Offset_0x0118F2(PC, D1)
;-------------------------------------------------------------------------------      
Offset_0x0118F2:
                dc.w    Offset_0x0118F6-Offset_0x0118F2
                dc.w    Offset_0x01191E-Offset_0x0118F2
;-------------------------------------------------------------------------------     
Offset_0x0118F6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Rock_Mappings, Obj_Map(A0)     ; Offset_0x01194A, $0004
                move.w  #$66C0, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$13, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
;-------------------------------------------------------------------------------                 
Offset_0x01191E:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  #$0010, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     SolidObject                            ; Offset_0x0147F4
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE   
;-------------------------------------------------------------------------------  
Rock_Mappings:                                                 ; Offset_0x01194A
                dc.w    Offset_0x01194C-Rock_Mappings
Offset_0x01194C:
                dc.w    $0002
                dc.l    $F00B0000, $0000FFE8
                dc.l    $F00B000C, $00060000                                  
;===============================================================================
; Objeto 0x3B - Pedra roxa na Green Hill do Sonic 1 não usado (Left over)
; <<<- 
;===============================================================================