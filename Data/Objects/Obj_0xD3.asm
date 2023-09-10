;===============================================================================
; Objeto 0xD3 - Bola de espinhos usada nos caças níqueis na Casino Night
; ->>> 
;===============================================================================
; Offset_0x026338:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x026346(PC, D0), D1
                jmp     Offset_0x026346(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x026346:
                dc.w    Offset_0x02634A-Offset_0x026346
                dc.w    Offset_0x026372-Offset_0x026346          
;-------------------------------------------------------------------------------
Offset_0x02634A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Spikeball_Mappings, Obj_Map(A0) ; Offset_0x02639E, $0004
                move.w  #$0380, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_2D_To_ModifySpriteAttr_2P          ; Offset_0x0263B8
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018 
;-------------------------------------------------------------------------------
Offset_0x026372:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  #$0010, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_16_To_SolidObject                  ; Offset_0x0263BE
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_17_To_DeleteObject                 ; Offset_0x0263B2
                bra     Jmp_15_To_DisplaySprite                ; Offset_0x0263AC         
;-------------------------------------------------------------------------------
Spikeball_Mappings:                                            ; Offset_0x02639E
                dc.w    Offset_0x0263A0-Spikeball_Mappings
Offset_0x0263A0:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
;===============================================================================
; Objeto 0xD3 - Bola de espinhos usada nos caças níqueis na Casino Night
; <<<- 
;===============================================================================