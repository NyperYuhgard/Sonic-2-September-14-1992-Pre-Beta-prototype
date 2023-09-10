;===============================================================================
; Objeto 0x9B - Inimigo tartaruga na Sky Chase (Atira bolas de fogo no jogador)
; ->>>          Objeto utilizado pelo 0x9A
;===============================================================================  
; Offset_0x031E54:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x031E62(PC, D0), D1
                jmp     Offset_0x031E62(PC, D1)    
Offset_0x031E62:
                dc.w    Offset_0x031E66-Offset_0x031E62
                dc.w    Offset_0x031E6A-Offset_0x031E62               
;-------------------------------------------------------------------------------
Offset_0x031E66:
                bra     Object_Settings                        ; Offset_0x030A30   
;------------------------------------------------------------------------------- 
Offset_0x031E6A:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                lea     Offset_0x031E7A(PC), A2
                bsr     Offset_0x031E7E
                bra     Offset_0x030C32           
Offset_0x031E7A:
                dc.w    $0004, $FFE8        
Offset_0x031E7E:
                move.l  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.l  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.w  (A2)+, D0
                add.w   D0, Obj_X(A0)                                    ; $0008
                move.w  (A2)+, D0
                add.w   D0, Obj_Y(A0)                                    ; $000C
;-------------------------------------------------------------------------------                
Return_to_sub_routine: ; Usado por vários objetos              ; Offset_0x031E96
                rts                                                               
;------------------------------------------------------------------------------- 
Load_Turtloid_Sub_Obj_0x9B:                                    ; Offset_0x031E98
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x031ECE
                move.b  #$9B, Obj_Id(A1)                                 ; $0000
                move.b  #$02, Obj_Map_Id(A1)                             ; $001A
                move.b  #$18, Obj_Subtype(A1)                            ; $0028
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  A1, Obj_Control_Var_00(A0)                       ; $002C
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                addq.w  #$04, Obj_X(A1)                                  ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                subi.w  #$0018, Obj_Y(A1)                                ; $000C
Offset_0x031ECE:
                rts
;===============================================================================   
; Objeto 0x9B - Inimigo tartaruga na Sky Chase (Atira bolas de fogo no jogador)
; <<<-          Objeto utilizado pelo 0x9A
;===============================================================================