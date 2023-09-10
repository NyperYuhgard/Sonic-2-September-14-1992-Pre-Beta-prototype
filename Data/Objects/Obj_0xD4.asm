;===============================================================================
; Objeto 0xD4 - Caixas azuis na Casino Night
; ->>>
;===============================================================================
; Offset_0x0263C4:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0263D2(PC, D0), D1
                jmp     Offset_0x0263D2(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x0263D2:
                dc.w    Offset_0x0263D6-Offset_0x0263D2
                dc.w    Offset_0x026446-Offset_0x0263D2                 
;-------------------------------------------------------------------------------
Offset_0x0263D6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Blue_Box_Mappings, Obj_Map(A0) ; Offset_0x0264A2, $0004
                move.w  #$436C, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_2E_To_ModifySpriteAttr_2P          ; Offset_0x0264C8
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                move.w  #$8000, Obj_Sub_Y(A0)                            ; $000A
                move.w  #$8000, $000E(A0)
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bne.s   Offset_0x026432
                subi.w  #$0060, Obj_X(A0)                                ; $0008
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x026446
                addi.w  #$00C0, Obj_X(A0)                                ; $0008
                bra.s   Offset_0x026446
Offset_0x026432:
                subi.w  #$0060, Obj_Y(A0)                                ; $000C
                btst    #$01, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x026446
                addi.w  #$00C0, Obj_Y(A0)                                ; $000C 
;-------------------------------------------------------------------------------
Offset_0x026446:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                move.w  Offset_0x026476(PC, D0), D1
                jsr     Offset_0x026476(PC, D1)
                bsr     Jmp_0F_To_SpeedToPos                   ; Offset_0x0264DA
                move.w  #$002B, D1
                move.w  #$0020, D2
                move.w  #$0021, D3
                move.w  (A7)+, D4
                bsr     Jmp_17_To_SolidObject                  ; Offset_0x0264CE
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                bra     Jmp_09_To_MarkObjGone_2                ; Offset_0x0264D4
;-------------------------------------------------------------------------------
Offset_0x026476:
                dc.w    Offset_0x02647A-Offset_0x026476
                dc.w    Offset_0x02648E-Offset_0x026476       
;-------------------------------------------------------------------------------
Offset_0x02647A:
                moveq   #$04, D1
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                cmp.w   Obj_X(A0), D0                                    ; $0008
                bhi.s   Offset_0x026488
                neg.w   D1
Offset_0x026488:
                add.w   D1, Obj_Speed(A0)                                ; $0010
                rts     
;-------------------------------------------------------------------------------
Offset_0x02648E:
                moveq   #$04, D1
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bhi.s   Offset_0x02649C
                neg.w   D1
Offset_0x02649C:
                add.w   D1, Obj_Speed_Y(A0)                              ; $0012
                rts                     
;-------------------------------------------------------------------------------
Blue_Box_Mappings:                                             ; Offset_0x0264A2
                dc.w    Offset_0x0264A4-Blue_Box_Mappings
Offset_0x0264A4:
                dc.w    $0004
                dc.l    $E00F0000, $0000FFE0
                dc.l    $E00F0800, $08000000
                dc.l    $000F1000, $1000FFE0
                dc.l    $000F1800, $18000000
;===============================================================================
; Objeto 0xD4 - Caixas azuis na Casino Night
; <<<-
;===============================================================================