;===============================================================================
; Objeto 0x68 - Bloco com harpão na Metropolis
; ->>> 
;===============================================================================
; Offset_0x021F94
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x021FA2(PC, D0), D1
                jmp     Offset_0x021FA2(PC, D1)     
;------------------------------------------------------------------------------- 
Offset_0x021FA2:
                dc.w    Offset_0x021FA8-Offset_0x021FA2
                dc.w    Offset_0x02204A-Offset_0x021FA2
                dc.w    Offset_0x022062-Offset_0x021FA2
;-------------------------------------------------------------------------------   
Offset_0x021FA8:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Block_Harpon_Mappings, Obj_Map(A0) ; Offset_0x022150, $0004
                move.w  #$6414, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_17_To_ModifySpriteAttr_2P          ; Offset_0x022270
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                bsr     Jmp_09_To_SingleObjectLoad_2           ; Offset_0x02226A
                bne.s   Offset_0x022044
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                addq.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_X(A1), Obj_Control_Var_04(A1)         ; $0008, $0030
                move.w  Obj_Y(A1), Obj_Control_Var_06(A1)         ; $000C, $0032
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  #$241C, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.w  ($FFFFFE04).w, D0
                lsr.w   #$06, D0
                move.w  D0, D1
                andi.w  #$0001, D0
                move.w  D0, Obj_Control_Var_0A(A1)                       ; $0036
                lsr.w   #$01, D1
                add.b   Obj_Subtype(A0), D1                              ; $0028
                andi.w  #$0003, D1
                move.b  D1, Obj_Routine_2(A1)                            ; $0025
                move.b  D1, Obj_Map_Id(A1)                               ; $001A
                lea     (Offset_0x02214C), A2
                move.b  $00(A2, D1), Obj_Col_Flags(A1)                   ; $0020
Offset_0x022044:
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
Offset_0x02204A:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_08_To_SolidObject                  ; Offset_0x022276
                bra     Jmp_12_To_MarkObjGone                  ; Offset_0x022264
Offset_0x022062:
                bsr     Offset_0x0220CA
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                add.w   D0, D0
                move.w  Offset_0x02207E(PC, D0), D1
                jsr     Offset_0x02207E(PC, D1)
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                bra     Jmp_01_To_MarkObjGone_2                ; Offset_0x02227C     
;------------------------------------------------------------------------------- 
Offset_0x02207E:
                dc.w    Offset_0x022086-Offset_0x02207E
                dc.w    Offset_0x022098-Offset_0x02207E
                dc.w    Offset_0x0220A8-Offset_0x02207E
                dc.w    Offset_0x0220B8-Offset_0x02207E
;-------------------------------------------------------------------------------  
Offset_0x022086:
                moveq   #$00, D0
                move.b  Obj_Control_Var_08(A0), D0                       ; $0034
                neg.w   D0
                add.w   Obj_Control_Var_06(A0), D0                       ; $0032
                move.w  D0, Obj_Y(A0)                                    ; $000C
                rts
Offset_0x022098:
                moveq   #$00, D0
                move.b  Obj_Control_Var_08(A0), D0                       ; $0034
                add.w   Obj_Control_Var_04(A0), D0                       ; $0030
                move.w  D0, Obj_X(A0)                                    ; $0008
                rts
Offset_0x0220A8:
                moveq   #$00, D0
                move.b  Obj_Control_Var_08(A0), D0                       ; $0034
                add.w   Obj_Control_Var_06(A0), D0                       ; $0032
                move.w  D0, Obj_Y(A0)                                    ; $000C
                rts
Offset_0x0220B8:
                moveq   #$00, D0
                move.b  Obj_Control_Var_08(A0), D0                       ; $0034
                neg.w   D0
                add.w   Obj_Control_Var_04(A0), D0                       ; $0030
                move.w  D0, Obj_X(A0)                                    ; $0008
                rts
Offset_0x0220CA:
                tst.w   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x0220EE
                move.b  ($FFFFFE05).w, D0
                andi.b  #$3F, D0
                bne.s   Offset_0x02214A
                clr.w   Obj_Control_Var_0C(A0)                           ; $0038
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x0220EE
                move.w  #$00B6, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x0220EE:
                tst.w   Obj_Control_Var_0A(A0)                           ; $0036
                beq.s   Offset_0x02212A
                subi.w  #$0800, Obj_Control_Var_08(A0)                   ; $0034
                bcc.s   Offset_0x02214A
                move.w  #$0000, Obj_Control_Var_08(A0)                   ; $0034
                move.w  #$0000, Obj_Control_Var_0A(A0)                   ; $0036
                move.w  #$0001, Obj_Control_Var_0C(A0)                   ; $0038
                addq.b  #$01, Obj_Routine_2(A0)                          ; $0025
                andi.b  #$03, Obj_Routine_2(A0)                          ; $0025
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.b  Offset_0x02214C(PC, D0), Obj_Col_Flags(A0)       ; $0020
                rts
Offset_0x02212A:
                addi.w  #$0800, Obj_Control_Var_08(A0)                   ; $0034
                cmpi.w  #$2000, Obj_Control_Var_08(A0)                   ; $0034
                bcs.s   Offset_0x02214A
                move.w  #$2000, Obj_Control_Var_08(A0)                   ; $0034
                move.w  #$0001, Obj_Control_Var_0A(A0)                   ; $0036
                move.w  #$0001, Obj_Control_Var_0C(A0)                   ; $0038
Offset_0x02214A:
                rts   
;-------------------------------------------------------------------------------
Offset_0x02214C:
                dc.b    $84, $A6, $84, $A6
;-------------------------------------------------------------------------------
Block_Harpon_Mappings:                                         ; Offset_0x022150
                dc.w    Offset_0x02215A-Block_Harpon_Mappings
                dc.w    Offset_0x022164-Block_Harpon_Mappings
                dc.w    Offset_0x02216E-Block_Harpon_Mappings
                dc.w    Offset_0x022178-Block_Harpon_Mappings
                dc.w    Offset_0x022182-Block_Harpon_Mappings
Offset_0x02215A:
                dc.w    $0001
                dc.l    $F0031000, $1000FFFC
Offset_0x022164:
                dc.w    $0001
                dc.l    $FC0C0004, $0002FFF0
Offset_0x02216E:
                dc.w    $0001
                dc.l    $F0030000, $0000FFFC
Offset_0x022178:
                dc.w    $0001
                dc.l    $FC0C0804, $0802FFF0
Offset_0x022182:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0
                dc.l    $F0070800, $08000000                                                                                                                                                                                                          
;===============================================================================
; Objeto 0x68 - Bloco com harpão na Metropolis
; <<<- 
;===============================================================================