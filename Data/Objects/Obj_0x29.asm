;===============================================================================
; Object 0x29 - Pontos obtidos ao destruir alguns objetos
; ->>>
;===============================================================================
; Offset_0x00EEB6:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00EEC4(PC, D0), D1
                jmp     Offset_0x00EEC4(PC, D1)   
;-------------------------------------------------------------------------------
Offset_0x00EEC4:
                dc.w    Offset_0x00EEC8-Offset_0x00EEC4
                dc.w    Offset_0x00EEF6-Offset_0x00EEC4
;-------------------------------------------------------------------------------
Offset_0x00EEC8:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Enemy_Points_Mappings, Obj_Map(A0) ; Offset_0x00EFC0, $0004
                move.w  #$04AC, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.w  #$FD00, Obj_Speed_Y(A0)                          ; $0012
;-------------------------------------------------------------------------------                
Offset_0x00EEF6:
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bpl     DeleteObject                           ; Offset_0x0120D0
                bsr     SpeedToPos                             ; Offset_0x011F96
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                bra     DisplaySprite                          ; Offset_0x0120DE                                                                            
;===============================================================================
; Object 0x29 - Pontos obtidos ao destruir alguns objetos
; <<<-
;===============================================================================