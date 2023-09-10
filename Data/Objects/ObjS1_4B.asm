;===============================================================================
; Objeto 0x4B - Anel gigante usado para acesso ao Estágio Especial, não usado
; ->>>          Left over do Sonic 1
;===============================================================================
; Offset_0x00F2C2:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00F2D0(PC, D0), D1
                jmp     Offset_0x00F2D0(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x00F2D0:
                dc.w    Offset_0x00F2D8-Offset_0x00F2D0
                dc.w    Offset_0x00F326-Offset_0x00F2D0
                dc.w    Offset_0x00F344-Offset_0x00F2D0
                dc.w    Offset_0x00F382-Offset_0x00F2D0
;-------------------------------------------------------------------------------   
Offset_0x00F2D8:
                move.l  #Big_Ring_Mappings, Obj_Map(A0) ; Offset_0x00F4A8, $0004
                move.w  #$2400, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$40, Obj_Width(A0)                              ; $0019
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x00F326
                cmpi.b  #$06, (Emerald_Count).w                      ; $FFFFFE57
                beq     Offset_0x00F382
                cmpi.w  #$0032, (Ring_Count).w                       ; $FFFFFE20
                bcc.s   Offset_0x00F310
                rts
Offset_0x00F310:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$02, Obj_Priority(A0)                           ; $0018
                move.b  #$52, Obj_Col_Flags(A0)                          ; $0020
                move.w  #$0C40, ($FFFFF7BE).w
;-------------------------------------------------------------------------------                 
Offset_0x00F326:
                move.b  ($FFFFFEA3).w, Obj_Map_Id(A0)                    ; $001A
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                 
Offset_0x00F344:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne     Offset_0x00F376
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                cmp.w   Obj_X(A0), D0                                    ; $0008
                bcs.s   Offset_0x00F376
                bset    #$00, Obj_Flags(A1)                              ; $0001
Offset_0x00F376:
                move.w  #$00C3, D0
                jsr     (Play_Music_Ex)                        ; Offset_0x001918
                bra.s   Offset_0x00F326
;-------------------------------------------------------------------------------                 
Offset_0x00F382:
                bra     DeleteObject                           ; Offset_0x0120D0                             
;===============================================================================
; Objeto 0x4B - Anel gigante usado para acesso ao Estágio Especial, não usado
; <<<-          Left over do Sonic 1
;===============================================================================