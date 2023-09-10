;===============================================================================
; Objeto 0x63 - Sombra do Sonic, Miles, bombas e anéis no Special Stage
; ->>> 
;===============================================================================
; Offset_0x02F436:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.b  #$09, (A1)
                bne.s   Offset_0x02F448
                move.l  #$FFFFB000, A1
                bra.s   Offset_0x02F44E
Offset_0x02F448:
                move.l  #$FFFFB040, A1
Offset_0x02F44E:
                btst    #$02, Obj_Status(A1)                             ; $0022
                bne     Offset_0x02F50E
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
;-------------------------------------------------------------------------------
Offset_0x02F464:                
                moveq   #$00, D0
                move.b  Obj_Angle(A1), D0                                ; $0026
                subi.b  #$10, D0
                lsr.b   #$05, D0
                move.b  D0, D1
                lsl.w   #$03, D0
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                move.w  Offset_0x02F4BA(PC, D0), Obj_Art_VRAM(A0)        ; $0002
                move.w  Offset_0x02F4BA+$02(PC, D0), D2
                move.w  Offset_0x02F4BA+$04(PC, D0), D3
                move.b  Offset_0x02F4BA+$06(PC, D0), Obj_Map_Id(A0)      ; $001A
                move.b  Offset_0x02F4BA+$07(PC, D0), D0
                or.b    D0, Obj_Flags(A0)                                ; $0001
                add.w   D2, Obj_X(A0)                                    ; $0008
                add.w   D3, Obj_Y(A0)                                    ; $000C
                tst.b   Obj_Angle(A1)                                    ; $0026
                bpl     Jmp_23_To_DisplaySprite                ; Offset_0x02FC14
                cmpi.b  #$03, D1
                beq.s   Offset_0x02F4B2
                cmpi.b  #$07, D1
                bne.s   Offset_0x02F4FA
Offset_0x02F4B2:
                addi.b  #$03, Obj_Map_Id(A0)                             ; $001A
                bra.s   Offset_0x02F4FA
;-------------------------------------------------------------------------------   
Offset_0x02F4BA:
                dc.w    $629F, $0014, $0014
                dc.b    $01, $01
                dc.w    $6279, $0000, $0018
                dc.b    $00, $00
                dc.w    $629F, $FFEC, $0014
                dc.b    $01, $00
                dc.w    $62D9, $FFEC, $0000
                dc.b    $02, $00
                dc.w    $629F, $FFEC, $FFEC
                dc.b    $07, $00
                dc.w    $6279, $0000, $FFE8
                dc.b    $09, $00
                dc.w    $629F, $0014, $FFEC
                dc.b    $07, $01
                dc.w    $62D9, $0014, $0000
                dc.b    $02, $01
;-------------------------------------------------------------------------------  
Offset_0x02F4FA:
                move.w  Obj_Control_Var_02(A1), D1                       ; $002E
                sub.w   Obj_Y(A0), D1                                    ; $000C
                add.w   D1, Obj_Y(A0)                                    ; $000C
                add.w   D1, Obj_Y(A0)                                    ; $000C
                bra     Jmp_23_To_DisplaySprite                ; Offset_0x02FC14
Offset_0x02F50E:
                move.b  Obj_Angle(A1), D0                                ; $0026
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  Obj_Control_Var_0C(A1), D1                       ; $0038
                asr.l   #$08, D1
                add.w   Obj_Control_Var_00(A1), D1                       ; $002C
                move.w  D1, Obj_X(A0)                                    ; $0008
                muls.w  Obj_Control_Var_0E(A1), D0                       ; $003A
                asr.l   #$08, D0
                add.w   Obj_Control_Var_02(A1), D0                       ; $002E
                move.w  D0, Obj_Y(A0)                                    ; $000C
                bra     Offset_0x02F464                              
;===============================================================================
; Objeto 0x63 - Sombra do Sonic, Miles, bombas e anéis no Special Stage
; <<<- 
;===============================================================================