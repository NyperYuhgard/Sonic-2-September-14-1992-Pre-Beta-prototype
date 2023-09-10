;===============================================================================
; Objeto 0x1D - Inimigo Verme na Chemical Plant
; ->>> 
;===============================================================================
; Offset_0x01CE78:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01CE86(PC, D0), D1
                jmp     Offset_0x01CE86(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x01CE86:
                dc.w    Offset_0x01CE98-Offset_0x01CE86
                dc.w    Offset_0x01CF46-Offset_0x01CE86
                dc.w    Offset_0x01CF64-Offset_0x01CE86
                dc.w    Offset_0x01CF46-Offset_0x01CE86
                dc.w    Offset_0x01CF98-Offset_0x01CE86
;-------------------------------------------------------------------------------
Offset_0x01CE90:
                dc.w    $FB80, $FB00, $FA00, $F900
;-------------------------------------------------------------------------------
Offset_0x01CE98:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$FB80, Obj_Speed_Y(A0)                          ; $0012
                moveq   #$00, D1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                move.b  D1, D0
                andi.b  #$0F, D1
                moveq   #$02, D5
                andi.b  #$F0, D0
                beq.s   Offset_0x01CEB8
                moveq   #$06, D5
Offset_0x01CEB8:
                move.b  Obj_Status(A0), D4                               ; $0022
                moveq   #$00, D2
                move.l  A0, A1
                bra.s   Offset_0x01CEC8       
;-------------------------------------------------------------------------------
Offset_0x01CEC2:
                bsr     Jmp_02_To_SingleObjectLoad_2           ; Offset_0x01CFFA
                bne.s   Offset_0x01CF40
Offset_0x01CEC8:
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.b  D5, Obj_Routine(A1)                              ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  #Worms_Mappings, Obj_Map(A1)    ; Offset_0x01CFE6, $0004
                move.w  #$643C, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_01_To_ModifySpriteAttr_2P_A1       ; Offset_0x01D000
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$8B, Obj_Col_Flags(A1)                          ; $0020
                move.w  Obj_X(A1), Obj_Control_Var_0C(A1)         ; $0008, $0038
                move.w  Obj_Y(A1), Obj_Control_Var_04(A1)         ; $000C, $0030
                move.w  Obj_Speed_Y(A0), Obj_Speed_Y(A1)          ; $0012, $0012
                move.w  Obj_Speed_Y(A1), Obj_Control_Var_08(A1)   ; $0012, $0034
                move.b  #$08, Obj_Width(A1)                              ; $0019
                move.w  #$0060, Obj_Control_Var_0E(A1)                   ; $003A
                move.w  #$000B, Obj_Control_Var_0A(A1)                   ; $0036
                andi.b  #$01, D4
                beq.s   Offset_0x01CF3A
                neg.w   Obj_Control_Var_0A(A1)                           ; $0036
                neg.w   Obj_Control_Var_0E(A1)                           ; $003A
Offset_0x01CF3A:
                move.w  D2, Obj_Control_Var_06(A1)                       ; $0032
                addq.w  #$03, D2
Offset_0x01CF40:
                dbra    D1, Offset_0x01CEC2
                rts
;-------------------------------------------------------------------------------                
Offset_0x01CF46:
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x01CF60
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$003B, Obj_Control_Var_06(A0)                   ; $0032
                move.w  #$00DA, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01CF60:
                bra     Jmp_05_To_MarkObjGone                  ; Offset_0x01CFF4
;-------------------------------------------------------------------------------                
Offset_0x01CF64:
                bsr     Jmp_04_To_SpeedToPos                   ; Offset_0x01D006
                move.w  Obj_Control_Var_0A(A0), D0                       ; $0036
                add.w   D0, Obj_Speed(A0)                                ; $0010
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                bne.s   Offset_0x01CF7C
                neg.w   Obj_Control_Var_0A(A0)                           ; $0036
Offset_0x01CF7C:
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bhi.s   Offset_0x01CF94
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
                clr.w   Obj_Speed(A0)                                    ; $0010
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x01CF94:
                bra     Jmp_05_To_MarkObjGone                  ; Offset_0x01CFF4
;-------------------------------------------------------------------------------                
Offset_0x01CF98:
                bsr     Jmp_04_To_SpeedToPos                   ; Offset_0x01D006
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                bne.s   Offset_0x01CFB0
                move.w  Obj_Control_Var_0E(A0), D0                       ; $003A
                add.w   Obj_Control_Var_0C(A0), D0                       ; $0038
                move.w  D0, Obj_X(A0)                                    ; $0008
Offset_0x01CFB0:
                cmpi.w  #$0180, Obj_Speed_Y(A0)                          ; $0012
                bne.s   Offset_0x01CFC2
                move.w  #$00DA, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01CFC2:
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bhi.s   Offset_0x01CFE2
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
                move.w  Obj_Control_Var_0C(A0), Obj_X(A0)         ; $0008, $0038
                move.w  #$00DA, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01CFE2:
                bra     Jmp_05_To_MarkObjGone                  ; Offset_0x01CFF4     
;-------------------------------------------------------------------------------
Worms_Mappings:                                                ; Offset_0x01CFE6
                dc.w    Offset_0x01CFE8-Worms_Mappings
Offset_0x01CFE8:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8                                                                         
;===============================================================================
; Objeto 0x1D - Inimigo Verme na Chemical Plant
; <<<- 
;===============================================================================