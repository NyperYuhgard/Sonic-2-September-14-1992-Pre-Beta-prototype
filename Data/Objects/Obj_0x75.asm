;===============================================================================
; Objeto 0x75 - Bola de espinhos com corrente na Dust Hill
; ->>>
;===============================================================================
; Offset_0x023904:
                btst    #$06, Obj_Flags(A0)                              ; $0001
                bne     Offset_0x02391C
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x023924(PC, D0), D1
                jmp     Offset_0x023924(PC, D1)
Offset_0x02391C:
                move.w  #$0280, D0
                bra     Jmp_00_To_DisplaySprite_Param          ; Offset_0x023AFC
;-------------------------------------------------------------------------------  
Offset_0x023924:
                dc.w    Offset_0x02392A-Offset_0x023924
                dc.w    Offset_0x023A06-Offset_0x023924
                dc.w    Offset_0x023AA8-Offset_0x023924   
;-------------------------------------------------------------------------------  
Offset_0x02392A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Spikeball_Chain_Mappings, Obj_Map(A0) ; Offset_0x023AC6, $0004
                move.w  #$2000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_1F_To_ModifySpriteAttr_2P          ; Offset_0x023B20
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                move.b  Obj_Subtype(A0), D1                              ; $0028
                move.b  D1, D0
                andi.w  #$000F, D1
                andi.b  #$F0, D0
                ext.w   D0
                asl.w   #$03, D0
                move.w  D0, Obj_Control_Var_08(A0)                       ; $0034
                move.b  Obj_Status(A0), D0                               ; $0022
                ror.b   #$02, D0
                andi.b  #$C0, D0
                move.b  D0, Obj_Angle(A0)                                ; $0026
                cmpi.b  #$0F, D1
                bne.s   Offset_0x02399A
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                rts
Offset_0x02399A:
                move.b  #$9A, Obj_Col_Flags(A0)                          ; $0020
                bsr     Jmp_0C_To_SingleObjectLoad_2           ; Offset_0x023B1A
                bne.s   Offset_0x023A06
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                bset    #$06, Obj_Flags(A1)                              ; $0001
                move.b  #$40, $000E(A1)
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  Obj_Y(A0), D3                                    ; $000C
                move.b  D1, Obj_Ani_Boss_Cnt(A1)                         ; $000F
                subq.w  #$01, D1
                lea     Obj_Speed(A1), A2                                ; $0010
Offset_0x0239DC:
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0001, (A2)+
                dbra    D1, Offset_0x0239DC
                move.w  D2, Obj_X(A1)                                    ; $0008
                move.w  D3, Obj_Y(A1)                                    ; $000C
                move.b  #$00, Obj_Boss_Ani_Map(A1)                       ; $000B
                move.l  A1, Obj_Control_Var_10(A0)                       ; $003C
                move.b  #$40, Obj_Inertia(A1)                            ; $0014
                bset    #$04, Obj_Flags(A1)                              ; $0001  
;-------------------------------------------------------------------------------  
Offset_0x023A06:
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                add.w   D0, Obj_Angle(A0)                                ; $0026
                move.b  Obj_Angle(A0), D0                                ; $0026
                bsr     Jmp_07_To_CalcSine                     ; Offset_0x023B26
                move.w  Obj_Control_Var_06(A0), D2                       ; $0032
                move.w  Obj_Control_Var_04(A0), D3                       ; $0030
                moveq   #$00, D6
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.b  Obj_Ani_Boss_Cnt(A1), D6                         ; $000F
                subq.w  #$01, D6
                bcs.s   Offset_0x023A7A
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                moveq   #$00, D4
                moveq   #$00, D5
                lea     Obj_Speed(A1), A2                                ; $0010
Offset_0x023A40:
                movem.l D4/D5, -(A7)
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, (A2)+
                move.w  D4, (A2)+
                movem.l (A7)+, D4/D5
                add.l   D0, D4
                add.l   D1, D5
                addq.w  #$02, A2
                dbra    D6, Offset_0x023A40
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, Obj_X(A0)                                    ; $0008
                move.w  D4, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Subtype(A1), Obj_X(A1)                ; $0008, $0028
                move.w  Obj_Timer(A1), Obj_Y(A1)                  ; $000C, $002A
Offset_0x023A7A:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x023A84
                bra     Jmp_10_To_DisplaySprite                ; Offset_0x023B02
Offset_0x023A84:
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x023A9C
                bra     Jmp_10_To_DisplaySprite                ; Offset_0x023B02
Offset_0x023A9C:
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                bsr     Jmp_01_To_DeleteObject_A1              ; Offset_0x023B14
                bra     Jmp_12_To_DeleteObject                 ; Offset_0x023B08   
;-------------------------------------------------------------------------------  
Offset_0x023AA8:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_0F_To_SolidObject                  ; Offset_0x023B2C
                bra     Jmp_14_To_MarkObjGone                  ; Offset_0x023B0E        
;-------------------------------------------------------------------------------
Spikeball_Chain_Mappings:                                      ; Offset_0x023AC6
                dc.w    Offset_0x023ACC-Spikeball_Chain_Mappings
                dc.w    Offset_0x023ADE-Spikeball_Chain_Mappings
                dc.w    Offset_0x023AE8-Spikeball_Chain_Mappings
Offset_0x023ACC:
                dc.w    $0002
                dc.l    $F00D007A, $003DFFF0
                dc.l    $000D187A, $183DFFF0
Offset_0x023ADE:
                dc.w    $0001
                dc.l    $F8054066, $4033FFF8
Offset_0x023AE8:
                dc.w    $0002
                dc.l    $F0074040, $4020FFF0
                dc.l    $F0074840, $48200000 
;===============================================================================
; Objeto 0x75 - Bola de espinhos com corrente na Dust Hill
; <<<-
;===============================================================================