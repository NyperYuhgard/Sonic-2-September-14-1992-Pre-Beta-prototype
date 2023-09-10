;===============================================================================
; Objeto 0x07 - Viscosidade do óleo na Oil Ocean
; ->>> 
;=============================================================================== 
; Offset_0x01EA90:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01EA9E(PC, D0), D1
                jmp     Offset_0x01EA9E(PC, D1)        
;-------------------------------------------------------------------------------
Offset_0x01EA9E:
                dc.w    Offset_0x01EAA2-Offset_0x01EA9E
                dc.w    Offset_0x01EAC4-Offset_0x01EA9E   
;-------------------------------------------------------------------------------
Offset_0x01EAA2:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0758, Obj_Y(A0)                                ; $000C
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
                move.b  #$30, Obj_Control_Var_0C(A0)                     ; $0038
                bset    #$07, Obj_Status(A0)                             ; $0022   
;-------------------------------------------------------------------------------
Offset_0x01EAC4:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$08, D1
                move.b  Obj_Status(A0), D0                               ; $0022
                and.b   D1, D0
                bne.s   Offset_0x01EAE0
                cmpi.b  #$30, Obj_Control_Var_0C(A0)                     ; $0038
                beq.s   Offset_0x01EAEA
                addq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bra.s   Offset_0x01EAEA
Offset_0x01EAE0:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x01EB3E
                subq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x01EAEA:
                moveq   #$20, D1
                moveq   #$00, D3
                move.b  Obj_Control_Var_0C(A0), D3                       ; $0038
                moveq   #$03, D6
                move.w  Obj_X(A1), D4                                    ; $0008
                move.w  D4, Obj_X(A0)                                    ; $0008
                bsr     Jmp_00_To_Platform_Object_A1           ; Offset_0x01EB5A
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$10, D1
                move.b  Obj_Status(A0), D0                               ; $0022
                and.b   D1, D0
                bne.s   Offset_0x01EB1C
                cmpi.b  #$30, Obj_Control_Var_0E(A0)                     ; $003A
                beq.s   Offset_0x01EB26
                addq.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
                bra.s   Offset_0x01EB26
Offset_0x01EB1C:
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                beq.s   Offset_0x01EB3E
                subq.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
Offset_0x01EB26:
                moveq   #$20, D1
                moveq   #$00, D3
                move.b  Obj_Control_Var_0E(A0), D3                       ; $003A
                moveq   #$04, D6
                move.w  Obj_X(A1), D4                                    ; $0008
                move.w  D4, Obj_X(A0)                                    ; $0008
                bsr     Jmp_00_To_Platform_Object_A1           ; Offset_0x01EB5A
                rts
Offset_0x01EB3E:
                not.b   D1
                and.b   D1, Obj_Status(A0)                               ; $0022
                move.l  A0, -(A7)
                move.l  A0, A2
                move.l  A1, A0
                bsr     Oil_Kill_Player                        ; Offset_0x01EB54
                move.l  (A7)+, A0
                rts                                                                                                                                     
;===============================================================================
; Objeto 0x07 - Viscosidade do óleo na Oil Ocean
; <<<- 
;===============================================================================