;===============================================================================
; Objeto 0xA8 - Inimigo Grabber na Chemical Plant
; ->>>          Objeto vinculado ao 0xA7
;===============================================================================     
; Offset_0x03334E:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03335C(PC, D0), D1
                jmp     Offset_0x03335C(PC, D1)     
;------------------------------------------------------------------------------- 
Offset_0x03335C:
                dc.w    Offset_0x033364-Offset_0x03335C
                dc.w    Offset_0x033370-Offset_0x03335C
                dc.w    Offset_0x0333C6-Offset_0x03335C
                dc.w    Offset_0x033400-Offset_0x03335C    
;------------------------------------------------------------------------------- 
Offset_0x033364:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                rts     
;-------------------------------------------------------------------------------
Offset_0x033370:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                cmpi.b  #$A7, (A1)
                bne     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bsr     Offset_0x030C50
                move.b  Obj_Map_Id(A1), D0                               ; $001A
                addq.b  #$03, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.b  Obj_Col_Prop(A0), D0                             ; $0021
                beq.s   Offset_0x0333B6
                cmpi.b  #$04, Obj_Routine_2(A1)                          ; $0025
                bne.s   Offset_0x0333B6
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                clr.b   Obj_Col_Flags(A0)                                ; $0020
                andi.b  #$03, D0
                add.w   D0, D0
                st      Obj_Control_Var_04(A1)                           ; $0030
                move.w  Offset_0x0333BA-$02(PC, D0), Obj_Control_Var_06(A1) ; $0032
                move.w  Offset_0x0333C0-$02(PC, D0), Obj_Control_Var_08(A1) ; $0034
Offset_0x0333B6:
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6     
;-------------------------------------------------------------------------------
Offset_0x0333BA:
                dc.w    $B000, $B040, $B000    
;-------------------------------------------------------------------------------
Offset_0x0333C0:                
                dc.w    $F604, $F606, $F604   
;-------------------------------------------------------------------------------          
Offset_0x0333C6:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                move.w  Obj_Control_Var_06(A1), D0                       ; $0032
                beq.s   Offset_0x0333F8
                move.w  D0, A2
                cmpi.b  #$A7, (A1)
                bne.s   Offset_0x0333E8
                move.w  Obj_X(A0), Obj_X(A2)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A2)                      ; $000C, $000C
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x0333E8:
                move.b  #$00, Obj_Timer(A2)                              ; $002A
                bset    #$01, Obj_Status(A2)                             ; $0022
                bra     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
Offset_0x0333F8:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Offset_0x033400:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                cmpi.b  #$A7, (A1)
                bne     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
;===============================================================================   
; Objeto 0xA8 - Inimigo Grabber na Chemical Plant
; <<<-          Objeto vinculado ao 0xA7
;===============================================================================