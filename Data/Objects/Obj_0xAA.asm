;===============================================================================
; Objeto 0xAA - Inimigo Grabber na Chemical Plant
; ->>>          Objeto vinculado ao 0xA7
;===============================================================================     
; Offset_0x033444:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x033452(PC, D0), D1
                jmp     Offset_0x033452(PC, D1) 
;-------------------------------------------------------------------------------              
Offset_0x033452:
                dc.w    Offset_0x033456-Offset_0x033452
                dc.w    Offset_0x033460-Offset_0x033452  
;-------------------------------------------------------------------------------   
Offset_0x033456:
                bsr     Object_Settings                        ; Offset_0x030A30
                subq.w  #$08, Obj_Y(A0)                                  ; $000C
                rts   
;-------------------------------------------------------------------------------
Offset_0x033460:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                cmpi.b  #$A7, (A1)
                bne     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                move.w  Obj_Y(A1), D0                                    ; $000C
                sub.w   Obj_Y(A0), D0                                    ; $000C
                bmi.s   Offset_0x03347C
                lsr.w   #$04, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
Offset_0x03347C:
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
;===============================================================================   
; Objeto 0xAA - Inimigo Grabber na Chemical Plant
; <<<-          Objeto vinculado ao 0xA7
;===============================================================================