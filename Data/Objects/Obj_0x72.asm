;===============================================================================
; Objeto 0x72 - Atributo invisivel das esteiras na Casino Night / Metropolis
; ->>>
;===============================================================================
; Offset_0x023688:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x023696(PC, D0), D1
                jmp     Offset_0x023696(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x023696:
                dc.w    Offset_0x02369A-Offset_0x023696
                dc.w    Offset_0x0236BA-Offset_0x023696
;-------------------------------------------------------------------------------  
Offset_0x02369A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.b   #$04, D0
                move.b  D0, Obj_Control_Var_0C(A0)                       ; $0038
                move.w  #$0002, Obj_Control_Var_0A(A0)                   ; $0036
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0236BA
                neg.w   Obj_Control_Var_0A(A0)                           ; $0036
;-------------------------------------------------------------------------------                  
Offset_0x0236BA:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x0236CA
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr.s   Offset_0x0236CA
                bra     Jmp_06_To_MarkObjGone_3                ; Offset_0x023708
Offset_0x0236CA:
                moveq   #$00, D2
                move.b  Obj_Control_Var_0C(A0), D2                       ; $0038
                move.w  D2, D3
                add.w   D3, D3
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                add.w   D2, D0
                cmp.w   D3, D0
                bcc.s   Offset_0x023704
                move.w  Obj_Y(A1), D1                                    ; $000C
                sub.w   Obj_Y(A0), D1                                    ; $000C
                addi.w  #$0030, D1
                cmpi.w  #$0030, D1
                bcc.s   Offset_0x023704
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x023704
                move.w  Obj_Control_Var_0A(A0), D0                       ; $0036
                add.w   D0, Obj_X(A1)                                    ; $0008
Offset_0x023704:
                rts                              
;===============================================================================
; Objeto 0x72 - Atributo invisivel das esteiras na Casino Night / Metropolis
; <<<-
;===============================================================================