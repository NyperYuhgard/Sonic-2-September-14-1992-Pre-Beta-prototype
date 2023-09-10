;===============================================================================
; Objeto 0xA9 - Inimigo Grabber na Chemical Plant
; ->>>          Objeto vinculado ao 0xA7
;===============================================================================     
; Offset_0x033410:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03341E(PC, D0), D1
                jmp     Offset_0x03341E(PC, D1)     
;-------------------------------------------------------------------------------       
Offset_0x03341E:
                dc.w    Offset_0x033422-Offset_0x03341E
                dc.w    Offset_0x033434-Offset_0x03341E   
;-------------------------------------------------------------------------------  
Offset_0x033422:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                subi.w  #$000C, Obj_Y(A0)                                ; $000C
                rts    
;-------------------------------------------------------------------------------
Offset_0x033434:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                cmpi.b  #$A7, (A1)
                bne     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
;===============================================================================   
; Objeto 0xA9 - Inimigo Grabber na Chemical Plant
; <<<-          Objeto vinculado ao 0xA7
;===============================================================================