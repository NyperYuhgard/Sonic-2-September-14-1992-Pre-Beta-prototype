;===============================================================================
; Objeto 0x8F -> Parede que oculta o Grounder na Neo Green Hill
; ->>>           Carregado a partir do objeto 0x8D / 0x8E
;===============================================================================     
; Offset_0x030FDA:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x030FE8(PC, D0), D1
                jmp     Offset_0x030FE8(PC, D1)   
;-------------------------------------------------------------------------------   
Offset_0x030FE8:
                dc.w    Offset_0x030FEE-Offset_0x030FE8
                dc.w    Offset_0x030FF8-Offset_0x030FE8
                dc.w    Offset_0x03106E-Offset_0x030FE8                         
;-------------------------------------------------------------------------------
Offset_0x030FEE:
                bsr     Object_Settings                        ; Offset_0x030A30
                clr.w   Obj_Art_VRAM(A0)                                 ; $0002
                rts                                                             
;-------------------------------------------------------------------------------
Offset_0x030FF8:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                tst.b   Obj_Player_Status(A1)                            ; $002B
                bne.s   Offset_0x031006
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x031006:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                move.b  Offset_0x03101E(PC, D0), Obj_Speed(A0)           ; $0010
                move.b  Offset_0x03101E+$01(PC, D0), Obj_Speed_Y(A0)     ; $0012
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608    
Offset_0x03101E:
                dc.b    $01, $FE, $01, $FF, $FF, $FE, $FF, $FF   
;===============================================================================   
; Objeto 0x8F -> Parede que oculta o Grounder na Neo Green Hill
; <<<-           Carregado a partir do objeto 0x8D / 0x8E
;===============================================================================