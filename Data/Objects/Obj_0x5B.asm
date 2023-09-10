;===============================================================================
; Objeto 0x5B - Sonic / Miles perdendo anéis ao tocar nas bombas no
; ->>>          estágio especial
;===============================================================================  
; Offset_0x030646:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x030654(PC, D0), D1
                jmp     Offset_0x030654(PC, D1)
Offset_0x030654:
                dc.w    Offset_0x030658-Offset_0x030654
                dc.w    Offset_0x0306FC-Offset_0x030654
Offset_0x030658:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                moveq   #$00, D1
                move.w  Obj_Control_Var_12(A1), D0                       ; $003E
                move.w  D0, D1
                subi.w  #$000A, D0
                bpl.s   Offset_0x03066E
                move.w  #$0000, D0
Offset_0x03066E:
                move.w  D0, Obj_Control_Var_12(A1)                       ; $003E
                beq.s   Offset_0x03067A
                move.w  #$000A, D1
                bra.s   Offset_0x030686
Offset_0x03067A:
                btst    #$00, D1
                beq.s   Offset_0x030686
                lea     Offset_0x03063C(PC), A3
                bra.s   Offset_0x03068A
Offset_0x030686:
                lea     Offset_0x030632(PC), A3
Offset_0x03068A:
                move.w  D1, D2
                subq.w  #$01, D2
                bmi.s   Offset_0x0306FA
                move.l  A0, A2
Offset_0x030692:
                move.b  #$5B, (A2)
                move.b  #$02, Obj_Routine(A2)                            ; $0024
                move.l  #SS_Rings_Mappings, Obj_Map(A2) ; Offset_0x03078A, $0004
                move.w  #$430D, Obj_Art_VRAM(A2)                         ; $0002
                move.b  #$04, Obj_Flags(A2)                              ; $0001
                move.b  #$05, Obj_Priority(A2)                           ; $0018
                move.b  #$00, Obj_Col_Flags(A2)                          ; $0020
                move.b  #$08, Obj_Map_Id(A2)                             ; $001A
                move.w  Obj_X(A1), Obj_X(A2)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A2)                      ; $000C, $000C
                move.b  Obj_Angle(A1), D0                                ; $0026
                addi.b  #$40, D0
                add.b   (A3)+, D0
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  #$0400, D1
                asr.l   #$08, D1
                move.w  D1, Obj_Speed(A2)                                ; $0010
                muls.w  #$0800, D0
                asr.l   #$08, D0
                move.w  D0, Obj_Speed_Y(A2)                              ; $0012
                lea     Obj_Size(A2), A2                                 ; $0040
                dbra    D2, Offset_0x030692
Offset_0x0306FA:
                rts
Offset_0x0306FC:
                bsr     Jmp_0A_To_ObjectFall                   ; Offset_0x030A28
                bsr     Offset_0x030724
                tst.w   Obj_X(A0)                                        ; $0008
                bmi     Jmp_26_To_DeleteObject                 ; Offset_0x030A16
                cmpi.w  #$0100, Obj_X(A0)                                ; $0008
                bcc     Jmp_26_To_DeleteObject                 ; Offset_0x030A16
                cmpi.w  #$00E0, Obj_Y(A0)                                ; $000C
                bcc     Jmp_26_To_DeleteObject                 ; Offset_0x030A16
                bra     Jmp_25_To_DisplaySprite                ; Offset_0x030A10
Offset_0x030724:
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi     Offset_0x030738
                move.b  #$00, Obj_Priority(A0)                           ; $0018
                move.b  #$09, Obj_Map_Id(A0)                             ; $001A
Offset_0x030738:
                rts            
;===============================================================================   
; Objeto 0x5B - Sonic / Miles perdendo anéis ao tocar nas bombas no
; <<<-          estágio especial
;===============================================================================