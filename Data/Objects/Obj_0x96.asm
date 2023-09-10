;===============================================================================
; Objeto 0x96 - Corpo do inimigo Rexon na Hill Top (Inimigo tipo cobra que atira
; ->>>          bolas de fogo no jogador)
;=============================================================================== 
; Offset_0x031770:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03177E(PC, D0), D1
                jmp     Offset_0x03177E(PC, D1)             
;-------------------------------------------------------------------------------  
Offset_0x03177E:
                dc.w    Offset_0x031786-Offset_0x03177E
                dc.w    Offset_0x03179E-Offset_0x03177E
                dc.w    Offset_0x0317EA-Offset_0x03177E
                dc.w    Offset_0x031818-Offset_0x03177E
;-------------------------------------------------------------------------------    
Offset_0x031786:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                move.w  #$FFE0, Obj_Speed(A0)                            ; $0010
                move.b  #$80, Obj_Timer(A0)                              ; $002A
                rts
Offset_0x03179E:
                bsr     Offset_0x030B18
                addi.w  #$0060, D2
                cmpi.w  #$0100, D2
                bcc.s   Offset_0x0317B0
                bsr     Load_Rexon_Head_Obj                    ; Offset_0x0319FA
Offset_0x0317B0:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Offset_0x0317CE
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0011, D3
                move.w  (A7)+, D4
                bsr     Jmp_19_To_SolidObject                  ; Offset_0x03764A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0317CE:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bpl.s   Offset_0x0317E4
                move.b  #$80, Obj_Timer(A0)                              ; $002A
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x0317E4:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                rts
Offset_0x0317EA:
                bsr     Offset_0x030B18
                addi.w  #$0060, D2
                cmpi.w  #$0100, D2
                bcc.s   Offset_0x0317FC
                bsr     Load_Rexon_Head_Obj                    ; Offset_0x0319FA
Offset_0x0317FC:
                bsr     Offset_0x031804
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x031804:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0008, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bra     Jmp_19_To_SolidObject                  ; Offset_0x03764A
Offset_0x031818:
                bsr.s   Offset_0x031804
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608                                                                               
;===============================================================================
; Objeto 0x66 - Corpo do inimigo Rexon na Hill Top (Inimigo tipo cobra que atira
; <<<-          bolas de fogo no jogador)
;===============================================================================