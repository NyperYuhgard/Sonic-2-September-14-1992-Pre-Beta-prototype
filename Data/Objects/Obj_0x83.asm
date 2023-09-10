;===============================================================================
; Objeto 0x83 - Três plataformas girando na Neo Green Hill
; ->>>        
;===============================================================================  
; Offset_0x025068:
                btst    #$06, Obj_Flags(A0)                              ; $0001
                bne     Offset_0x025080
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x025088(PC, D0), D1
                jmp     Offset_0x025088(PC, D1)
Offset_0x025080:
                move.w  #$0280, D0
                bra     Jmp_02_To_DisplaySprite_Param          ; Offset_0x0252E4
;-------------------------------------------------------------------------------
Offset_0x025088:
                dc.w    Offset_0x02508E-Offset_0x025088
                dc.w    Offset_0x02518C-Offset_0x025088
                dc.w    Offset_0x0252BA-Offset_0x025088        
;-------------------------------------------------------------------------------
Offset_0x02508E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #NGHz_Swing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00D4BA ,$0004
                move.w  #$0000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_28_To_ModifySpriteAttr_2P          ; Offset_0x025302
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                move.b  Obj_Subtype(A0), D1                              ; $0028
                move.b  D1, D0
                andi.w  #$000F, D1
                andi.b  #$F0, D0
                ext.w   D0
                asl.w   #$03, D0
                move.w  D0, Obj_Control_Var_02(A0)                       ; $002E
                move.b  Obj_Status(A0), D0                               ; $0022
                ror.b   #$02, D0
                andi.b  #$C0, D0
                move.b  D0, Obj_Angle(A0)                                ; $0026
                bsr     Jmp_10_To_SingleObjectLoad_2           ; Offset_0x0252FC
                bne.s   Offset_0x025148
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                bset    #$06, Obj_Flags(A1)                              ; $0001
                move.b  #$40, $000E(A1)
                moveq   #$08, D1
                move.b  D1, Obj_Ani_Boss_Cnt(A1)                         ; $000F
                subq.w  #$01, D1
                lea     Obj_Speed(A1), A2                                ; $0010
Offset_0x02511C:
                addq.w  #$04, A2
                move.w  #$0001, (A2)+
                dbra    D1, Offset_0x02511C
                move.b  #$01, Obj_Boss_Ani_Map(A1)                       ; $000B
                move.b  #$40, Obj_Inertia(A1)                            ; $0014
                bset    #$04, Obj_Flags(A1)                              ; $0001
                move.l  A1, Obj_Control_Var_08(A0)                       ; $0034
                bsr.s   Offset_0x02514A
                move.l  A1, Obj_Control_Var_0C(A0)                       ; $0038
                bsr.s   Offset_0x02514A
                move.l  A1, Obj_Control_Var_10(A0)                       ; $003C
Offset_0x025148:
                bra.s   Offset_0x02518C
Offset_0x02514A:
                bsr     Jmp_10_To_SingleObjectLoad_2           ; Offset_0x0252FC
                bne.s   Offset_0x02518A
                addq.b  #$04, Obj_Routine(A1)                            ; $0024
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.w  Obj_X(A0), Obj_Control_Var_04(A1)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Control_Var_06(A1)         ; $000C, $0032
                move.w  Obj_X(A0), Obj_Control_Var_00(A1)         ; $0008, $002C
Offset_0x02518A:
                rts       
;-------------------------------------------------------------------------------
Offset_0x02518C:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                add.w   D0, Obj_Angle(A0)                                ; $0026
                move.w  Obj_Control_Var_06(A0), D2                       ; $0032
                move.w  Obj_Control_Var_04(A0), D3                       ; $0030
                moveq   #$00, D6
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                lea     Obj_Speed(A1), A2                                ; $0010
                move.b  Obj_Angle(A0), D0                                ; $0026
                bsr     Jmp_09_To_CalcSine                     ; Offset_0x025308
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                move.l  D0, D4
                move.l  D1, D5
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, Obj_X(A1)                                    ; $0008
                move.w  D4, Obj_Y(A1)                                    ; $000C
                move.l  D0, D4
                move.l  D1, D5
                add.l   D0, D4
                add.l   D1, D5
                moveq   #$01, D6
                bsr     Offset_0x02529A
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, Obj_X(A0)                                    ; $0008
                move.w  D4, Obj_Y(A0)                                    ; $000C
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$55, D0
                bsr     Jmp_09_To_CalcSine                     ; Offset_0x025308
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                move.l  D0, D4
                move.l  D1, D5
                moveq   #$02, D6
                bsr     Offset_0x02529A
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.l  Obj_Control_Var_0C(A0), A1                       ; $0038
                move.w  D5, Obj_X(A1)                                    ; $0008
                move.w  D4, Obj_Y(A1)                                    ; $000C
                move.b  Obj_Angle(A0), D0                                ; $0026
                subi.b  #$55, D0
                bsr     Jmp_09_To_CalcSine                     ; Offset_0x025308
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                move.l  D0, D4
                move.l  D1, D5
                moveq   #$02, D6
                bsr     Offset_0x02529A
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.w  D5, Obj_X(A1)                                    ; $0008
                move.w  D4, Obj_Y(A1)                                    ; $000C
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                bsr     Jmp_02_To_Platform_Object              ; Offset_0x02530E
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x025276
                bra     Jmp_14_To_DisplaySprite                ; Offset_0x0252EA
Offset_0x025276:
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x02528E
                bra     Jmp_14_To_DisplaySprite                ; Offset_0x0252EA
Offset_0x02528E:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                bsr     Jmp_03_To_DeleteObject_A1              ; Offset_0x0252F6
                bra     Jmp_15_To_DeleteObject                 ; Offset_0x0252F0
Offset_0x02529A:
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
                dbra    D6, Offset_0x02529A
                rts  
;-------------------------------------------------------------------------------
Offset_0x0252BA:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  Obj_Control_Var_00(A0), D4                       ; $002C
                bsr     Jmp_02_To_Platform_Object              ; Offset_0x02530E
                move.w  Obj_X(A0), Obj_Control_Var_00(A0)         ; $0008, $002C
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                bra     Jmp_07_To_MarkObjGone_2                ; Offset_0x025314        
;===============================================================================   
; Objeto 0x83 - Três plataformas girando na Neo Green Hill
; <<<-        
;===============================================================================