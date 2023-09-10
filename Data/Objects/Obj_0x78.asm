;===============================================================================
; Objeto 0x78 - Plataformas que giram em torno de si mesmo, plataformas que
; ->>>          sobem ou descem quando tocadas na Chemical Plant e Escadas
;===============================================================================  
; Offset_0x023F08:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x023F1E(PC, D0), D1
                jsr     Offset_0x023F1E(PC, D1)
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                bra     Jmp_05_To_MarkObjGone_2                ; Offset_0x0240D6                               
;-------------------------------------------------------------------------------     
Offset_0x023F1E:
                dc.w    Offset_0x023F24-Offset_0x023F1E
                dc.w    Offset_0x023FA8-Offset_0x023F1E
                dc.w    Offset_0x023FBC-Offset_0x023F1E       
;-------------------------------------------------------------------------------    
Offset_0x023F24:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                moveq   #$34, D3
                moveq   #$02, D4
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x023F38
                moveq   #$3A, D3
                moveq   #-$02, D4
Offset_0x023F38:
                move.w  Obj_X(A0), D2                                    ; $0008
                move.l  A0, A1
                moveq   #$03, D1
                bra.s   Offset_0x023F50              
;-------------------------------------------------------------------------------
Offset_0x023F42:
                bsr     Jmp_0D_To_SingleObjectLoad_2           ; Offset_0x0240C4
                bne     Offset_0x023FA8
                move.b  #$04, Obj_Routine(A1)                            ; $0024
Offset_0x023F50:
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.l  #CPz_Block_Mappings, Obj_Map(A1) ; Offset_0x022A02, $0004
                move.w  #$6418, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_03_To_ModifySpriteAttr_2P_A1       ; Offset_0x0240CA
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  Obj_Subtype(A0), Obj_Subtype(A1)          ; $0028, $0028
                move.w  D2, Obj_X(A1)                                    ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_X(A0), Obj_Control_Var_04(A1)         ; $0008, $0030
                move.w  Obj_Y(A1), Obj_Control_Var_06(A1)         ; $000C, $0032
                addi.w  #$0020, D2
                move.b  D3, Obj_Control_Var_03(A1)                       ; $002F
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
                add.b   D4, D3
                dbra    D1, Offset_0x023F42  
;-------------------------------------------------------------------------------  
Offset_0x023FA8:
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$0007, D0
                add.w   D0, D0
                move.w  Offset_0x023FF4(PC, D0), D1
                jsr     Offset_0x023FF4(PC, D1)     
;-------------------------------------------------------------------------------
Offset_0x023FBC:
                move.l  Obj_Control_Var_10(A0), A2                       ; $003C
                moveq   #$00, D0
                move.b  Obj_Control_Var_03(A0), D0                       ; $002F
                move.w  $00(A2, D0), D0
                add.w   Obj_Control_Var_06(A0), D0                       ; $0032
                move.w  D0, Obj_Y(A0)                                    ; $000C
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_12_To_SolidObject                  ; Offset_0x0240D0
                swap.w  D6
                or.b    D6, Obj_Control_Var_02(A2)                       ; $002E
                rts                           
;-------------------------------------------------------------------------------    
Offset_0x023FF4:
                dc.w    Offset_0x024004-Offset_0x023FF4
                dc.w    Offset_0x024070-Offset_0x023FF4
                dc.w    Offset_0x024028-Offset_0x023FF4
                dc.w    Offset_0x024070-Offset_0x023FF4
                dc.w    Offset_0x024004-Offset_0x023FF4
                dc.w    Offset_0x02409A-Offset_0x023FF4
                dc.w    Offset_0x024028-Offset_0x023FF4
                dc.w    Offset_0x02409A-Offset_0x023FF4     
;-------------------------------------------------------------------------------  
Offset_0x024004:
                tst.w   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02401C
                move.b  Obj_Control_Var_02(A0), D0                       ; $002E
                andi.b  #$30, D0
                beq.s   Offset_0x02401A
                move.w  #$001E, Obj_Control_Var_00(A0)                   ; $002C
Offset_0x02401A:
                rts
Offset_0x02401C:
                subq.w  #$01, Obj_Control_Var_00(A0)                     ; $002C
                bne.s   Offset_0x02401A
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
                rts   
;-------------------------------------------------------------------------------  
Offset_0x024028:
                tst.w   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x024040
                move.b  Obj_Control_Var_02(A0), D0                       ; $002E
                andi.b  #$0C, D0
                beq.s   Offset_0x02403E
                move.w  #$003C, Obj_Control_Var_00(A0)                   ; $002C
Offset_0x02403E:
                rts
Offset_0x024040:
                subq.w  #$01, Obj_Control_Var_00(A0)                     ; $002C
                bne.s   Offset_0x02404C
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
                rts
Offset_0x02404C:
                lea     Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_Control_Var_00(A0), D0                       ; $002C
                lsr.b   #$02, D0
                andi.b  #$01, D0
                move.w  D0, (A1)+
                eori.b  #$01, D0
                move.w  D0, (A1)+
                eori.b  #$01, D0
                move.w  D0, (A1)+
                eori.b  #$01, D0
                move.w  D0, (A1)+
                rts     
;-------------------------------------------------------------------------------  
Offset_0x024070:
                lea     Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.w  #$0080, (A1)
                beq.s   Offset_0x024098
                addq.w  #$01, (A1)
                moveq   #$00, D1
                move.w  (A1)+, D1
                swap.w  D1
                lsr.l   #$01, D1
                move.l  D1, D2
                lsr.l   #$01, D1
                move.l  D1, D3
                add.l   D2, D3
                swap.w  D1
                swap.w  D2
                swap.w  D3
                move.w  D3, (A1)+
                move.w  D2, (A1)+
                move.w  D1, (A1)+
Offset_0x024098:
                rts     
;-------------------------------------------------------------------------------  
Offset_0x02409A:
                lea     Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.w  #$FF80, (A1)
                beq.s   Offset_0x0240C2
                subq.w  #$01, (A1)
                moveq   #$00, D1
                move.w  (A1)+, D1
                swap.w  D1
                asr.l   #$01, D1
                move.l  D1, D2
                asr.l   #$01, D1
                move.l  D1, D3
                add.l   D2, D3
                swap.w  D1
                swap.w  D2
                swap.w  D3
                move.w  D3, (A1)+
                move.w  D2, (A1)+
                move.w  D1, (A1)+
Offset_0x0240C2:
                rts                                                            
;===============================================================================   
; Objeto 0x78 - Plataformas que giram em torno de si mesmo, plataformas que
; <<<-          sobem ou descem quando tocadas na Chemical Plant e Escadas
;===============================================================================