;===============================================================================
; Objeto 0x56 - Robotnik na Green Hill
; ->>>        
;===============================================================================     
; Offset_0x02A6A8:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02A6B6(PC, D0), D1
                jmp     Offset_0x02A6B6(PC, D1) 
;-------------------------------------------------------------------------------          
Offset_0x02A6B6:
                dc.w    Offset_0x02A6C6-Offset_0x02A6B6
                dc.w    Offset_0x02A9E0-Offset_0x02A6B6
                dc.w    Offset_0x02ACAE-Offset_0x02A6B6
                dc.w    Offset_0x02AD3A-Offset_0x02A6B6
                dc.w    Offset_0x02ADA8-Offset_0x02A6B6
                dc.w    Offset_0x02AF24-Offset_0x02A6B6
                dc.w    Offset_0x02AC8A-Offset_0x02A6B6
                dc.w    Offset_0x02B00A-Offset_0x02A6B6  
;-------------------------------------------------------------------------------  
Offset_0x02A6C6:
                move.l  #GHz_Boss_Mappings_02, Obj_Map(A0) ; Offset_0x02B1D6, $0004
                move.w  #$23A0, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$14, Obj_Height_2(A0)                           ; $0016
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Boss_Hit(A0)                           ; $0021
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Control_Var_0C(A0)         ; $000C, $0038
                bsr     Jmp_37_To_ModifySpriteAttr_2P          ; Offset_0x02B274
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne     Offset_0x02A762
                move.b  #$56, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  A1, Obj_Control_Var_08(A0)                       ; $0034
                move.l  #GHz_Boss_Mappings_02, Obj_Map(A1) ; Offset_0x02B1D6, $0004
                move.w  #$03A0, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$0E, Obj_Routine(A1)                            ; $0024
                move.b  #$01, Obj_Ani_Number(A1)                         ; $001C
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
Offset_0x02A762:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x02A7B0
                move.b  #$56, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #GHz_Boss_Mappings_01, Obj_Map(A1) ; Offset_0x02B15A, $0004
                move.w  #$0400, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_06_To_ModifySpriteAttr_2P_A1       ; Offset_0x02B262
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$10, Obj_Height_2(A1)                           ; $0016
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.w  #$2AA0, Obj_X(A1)                                ; $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$06, Obj_Routine(A1)                            ; $0024
Offset_0x02A7B0:
                bsr     Offset_0x02A816
                subi.w  #$0008, Obj_Control_Var_0C(A0)                   ; $0038
                move.w  #$2AA0, Obj_X(A0)                                ; $0008
                move.w  #$0348, Obj_Y(A0)                                ; $000C
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x02A814
                move.b  #$56, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #GHz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02B072, $0004
                move.w  #$25E8, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_06_To_ModifySpriteAttr_2P_A1       ; Offset_0x02B262
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  #$001E, Obj_Timer(A1)                            ; $002A
                move.b  #$04, Obj_Routine(A1)                            ; $0024
Offset_0x02A814:
                rts
Offset_0x02A816:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x02A88E
                move.b  #$56, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #GHz_Boss_Mappings_01, Obj_Map(A1) ; Offset_0x02B15A, $0004
                move.w  #$2400, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_06_To_ModifySpriteAttr_2P_A1       ; Offset_0x02B262
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Height_2(A1)                           ; $0016
                move.b  #$10, Obj_Width_2(A1)                            ; $0017
                move.w  #$2AA0, Obj_X(A1)                                ; $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$001C, Obj_X(A1)                                ; $0008
                addi.w  #$000C, Obj_Y(A1)                                ; $000C
                move.b  #$08, Obj_Routine(A1)                            ; $0024
                move.b  #$04, Obj_Map_Id(A1)                             ; $001A
                move.b  #$01, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$000A, Obj_Timer(A1)                            ; $002A
                move.b  #$00, Obj_Subtype(A1)                            ; $0028
Offset_0x02A88E:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x02A906
                move.b  #$56, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #GHz_Boss_Mappings_01, Obj_Map(A1) ; Offset_0x02B15A, $0004
                move.w  #$2400, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_06_To_ModifySpriteAttr_2P_A1       ; Offset_0x02B262
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Height_2(A1)                           ; $0016
                move.b  #$10, Obj_Width_2(A1)                            ; $0017
                move.w  #$2AA0, Obj_X(A1)                                ; $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$FFF4, Obj_X(A1)                                ; $0008
                addi.w  #$000C, Obj_Y(A1)                                ; $000C
                move.b  #$08, Obj_Routine(A1)                            ; $0024
                move.b  #$04, Obj_Map_Id(A1)                             ; $001A
                move.b  #$01, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$000A, Obj_Timer(A1)                            ; $002A
                move.b  #$01, Obj_Subtype(A1)                            ; $0028
Offset_0x02A906:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x02A97E
                move.b  #$56, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #GHz_Boss_Mappings_01, Obj_Map(A1) ; Offset_0x02B15A, $0004
                move.w  #$2400, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_06_To_ModifySpriteAttr_2P_A1       ; Offset_0x02B262
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Height_2(A1)                           ; $0016
                move.b  #$10, Obj_Width_2(A1)                            ; $0017
                move.w  #$2AA0, Obj_X(A1)                                ; $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$FFD4, Obj_X(A1)                                ; $0008
                addi.w  #$000C, Obj_Y(A1)                                ; $000C
                move.b  #$08, Obj_Routine(A1)                            ; $0024
                move.b  #$06, Obj_Map_Id(A1)                             ; $001A
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$000A, Obj_Timer(A1)                            ; $002A
                move.b  #$02, Obj_Subtype(A1)                            ; $0028
Offset_0x02A97E:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x02A9DE
                move.b  #$56, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #GHz_Boss_Mappings_01, Obj_Map(A1) ; Offset_0x02B15A, $0004
                move.w  #$2400, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_06_To_ModifySpriteAttr_2P_A1       ; Offset_0x02B262
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.w  #$2AA0, Obj_X(A1)                                ; $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$FFCA, Obj_X(A1)                                ; $0008
                addi.w  #$0008, Obj_Y(A1)                                ; $000C
                move.b  #$0A, Obj_Routine(A1)                            ; $0024
                move.b  #$01, Obj_Map_Id(A1)                             ; $001A
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
Offset_0x02A9DE:
                rts 
;-------------------------------------------------------------------------------
Offset_0x02A9E0:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02A9EE(PC, D0), D1
                jmp     Offset_0x02A9EE(PC, D1)     
;-------------------------------------------------------------------------------      
Offset_0x02A9EE:
                dc.w    Offset_0x02A9FA-Offset_0x02A9EE
                dc.w    Offset_0x02AA30-Offset_0x02A9EE
                dc.w    Offset_0x02AA8C-Offset_0x02A9EE
                dc.w    Offset_0x02AABE-Offset_0x02A9EE
                dc.w    Offset_0x02AAFC-Offset_0x02A9EE
                dc.w    Offset_0x02AB12-Offset_0x02A9EE     
;-------------------------------------------------------------------------------        
Offset_0x02A9FA:
                cmpi.w  #$28F0, (Sonic_Level_Limits_Min_X).w         ; $FFFFEEC8
                bcs     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                cmpi.w  #$29D0, Obj_X(A0)                                ; $0008
                ble.s   Offset_0x02AA22
                subi.w  #$0001, Obj_X(A0)                                ; $0008
                addi.w  #$0001, Obj_Y(A0)                                ; $000C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AA22:
                move.w  #$29D0, Obj_X(A0)                                ; $0008
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244   
;-------------------------------------------------------------------------------
Offset_0x02AA30:
                moveq   #$00, D0
                move.b  Obj_Control_Var_00(A0), D0                       ; $002C
                move.w  Offset_0x02AA3E(PC, D0), D1
                jmp     Offset_0x02AA3E(PC, D1)        
Offset_0x02AA3E:
                dc.w    Offset_0x02AA42-Offset_0x02AA3E
                dc.w    Offset_0x02AA68-Offset_0x02AA3E         
Offset_0x02AA42:
                cmpi.w  #$041E, Obj_Y(A0)                                ; $000C
                bge.s   Offset_0x02AA54
                addi.w  #$0001, Obj_Y(A0)                                ; $000C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AA54:
                addq.b  #$02, Obj_Control_Var_00(A0)                     ; $002C
                bset    #$00, Obj_Control_Var_01(A0)                     ; $002D
                move.w  #$003C, Obj_Timer(A0)                            ; $002A
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AA68:
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                move.w  #$FE00, Obj_Speed(A0)                            ; $0010
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                bset    #$01, Obj_Control_Var_01(A0)                     ; $002D
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244   
;-------------------------------------------------------------------------------
Offset_0x02AA8C:
                bsr     Offset_0x02AC1C
                bsr     Offset_0x02ABFA
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                lsr.w   #$01, D0
                subi.w  #$0014, D0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, Obj_Control_Var_02(A0)                   ; $002E
                move.l  Obj_X(A0), D2                                    ; $0008
                move.w  Obj_Speed(A0), D0                                ; $0010
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.l  D2, Obj_X(A0)                                    ; $0008
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244      
;-------------------------------------------------------------------------------
Offset_0x02AABE:
                subq.w  #$01, Obj_Control_Var_10(A0)                     ; $003C
                bmi.s   Offset_0x02AAE4
                bsr     Boss_Defeated                          ; Offset_0x028F7A
                bsr     Jmp_07_To_ObjectFall                   ; Offset_0x02B27A
                bsr     Jmp_02_To_ObjHitFloor                  ; Offset_0x02B268
                tst.w   D1
                bpl     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AAE4:
                clr.w   Obj_Speed(A0)                                    ; $0010
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FFDA, Obj_Control_Var_10(A0)                   ; $003C
                move.w  #$000C, Obj_Timer(A0)                            ; $002A
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244   
;-------------------------------------------------------------------------------
Offset_0x02AAFC:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bpl     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$00, Obj_Control_Var_00(A0)                     ; $002C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244         
;-------------------------------------------------------------------------------
Offset_0x02AB12:
                moveq   #$00, D0
                move.b  Obj_Control_Var_00(A0), D0                       ; $002C
                move.w  Offset_0x02AB2C(PC, D0), D1
                jsr     Offset_0x02AB2C(PC, D1)
                tst.b   ($FFFFF7A7).w
                bne     Jmp_1F_To_DeleteObject                 ; Offset_0x02B24A
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244  
;-------------------------------------------------------------------------------   
Offset_0x02AB2C:
                dc.w    Offset_0x02AB32-Offset_0x02AB2C
                dc.w    Offset_0x02ABAA-Offset_0x02AB2C
                dc.w    Offset_0x02ABC4-Offset_0x02AB2C  
;-------------------------------------------------------------------------------      
Offset_0x02AB32:
                bclr    #$00, Obj_Control_Var_01(A0)                     ; $002D
                bsr     Jmp_12_To_SingleObjectLoad_2           ; Offset_0x02B256
                bne     Offset_0x02ABA8
                move.b  #$56, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #GHz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02B072, $0004
                move.w  #$25E8, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_06_To_ModifySpriteAttr_2P_A1       ; Offset_0x02B262
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$000C, Obj_Y(A1)                                ; $000C
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                move.b  #$0C, Obj_Routine(A1)                            ; $0024
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$0010, Obj_Timer(A1)                            ; $002A
                move.w  #$0032, Obj_Timer(A0)                            ; $002A
                addq.b  #$02, Obj_Control_Var_00(A0)                     ; $002C
Offset_0x02ABA8:
                rts         
;-------------------------------------------------------------------------------
Offset_0x02ABAA:
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl.s   Offset_0x02ABC2
                bset    #$02, Obj_Control_Var_01(A0)                     ; $002D
                move.w  #$0060, Obj_Timer(A0)                            ; $002A
                addq.b  #$02, Obj_Control_Var_00(A0)                     ; $002C
Offset_0x02ABC2:
                rts 
;-------------------------------------------------------------------------------
Offset_0x02ABC4:
                subq.w  #$01, Obj_Y(A0)                                  ; $000C
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl.s   Offset_0x02ABF8
                bset    #$00, Obj_Status(A0)                             ; $0022
                bset    #$00, Obj_Flags(A0)                              ; $0001
                addq.w  #$01, Obj_Y(A0)                                  ; $000C
                addq.w  #$02, Obj_X(A0)                                  ; $0008
                cmpi.w  #$2B08, Obj_X(A0)                                ; $0008
                bcs.s   Offset_0x02ABF8
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x02ABF8
                move.b  #$01, ($FFFFF7A7).w
Offset_0x02ABF8:
                rts
Offset_0x02ABFA:
                move.w  Obj_X(A0), D0                                    ; $0008
                cmpi.w  #$28A0, D0
                ble.s   Offset_0x02AC0A
                cmpi.w  #$2B08, D0
                blt.s   Offset_0x02AC1A
Offset_0x02AC0A:
                bchg    #00, Obj_Status(A0)                              ; $0022
                bchg    #00, Obj_Flags(A0)                               ; $0001
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x02AC1A:
                rts
Offset_0x02AC1C:
                cmpi.b  #$06, Obj_Routine_2(A0)                          ; $0025
                bcc.s   Offset_0x02AC62
                tst.b   Obj_Status(A0)                                   ; $0022
                bmi.s   Offset_0x02AC64
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                bne.s   Offset_0x02AC62
                tst.b   Obj_Control_Var_12(A0)                           ; $003E
                bne.s   Offset_0x02AC46
                move.b  #$20, Obj_Control_Var_12(A0)                     ; $003E
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x02AC46:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x02AC54
                move.w  #$0EEE, D0
Offset_0x02AC54:
                move.w  D0, (A1)
                subq.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                bne.s   Offset_0x02AC62
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
Offset_0x02AC62:
                rts
Offset_0x02AC64:
                moveq   #$64, D0
                bsr     Jmp_02_To_AddPoints                    ; Offset_0x02B26E
                move.b  #$06, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  #$FE80, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$00B3, Obj_Control_Var_10(A0)                   ; $003C
                bset    #$03, Obj_Control_Var_01(A0)                     ; $002D
                rts  
;-------------------------------------------------------------------------------
Offset_0x02AC8A:
                subi.w  #$0001, Obj_Y(A0)                                ; $000C
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                lea     (GHz_Boss_Animate_Data), A1            ; Offset_0x02B038
                bsr     Jmp_12_To_AnimateSprite                ; Offset_0x02B25C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244       
;-------------------------------------------------------------------------------
Offset_0x02ACAE:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02ACBC(PC, D0), D1
                jmp     Offset_0x02ACBC(PC, D1)     
;-------------------------------------------------------------------------------   
Offset_0x02ACBC:
                dc.w    Offset_0x02ACC0-Offset_0x02ACBC
                dc.w    Offset_0x02AD0A-Offset_0x02ACBC 
;-------------------------------------------------------------------------------    
Offset_0x02ACC0:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.b  #$56, (A1)
                bne     Jmp_1F_To_DeleteObject                 ; Offset_0x02B24A
                btst    #$00, Obj_Control_Var_01(A1)                     ; $002D
                beq.s   Offset_0x02ACE4
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0018, Obj_Timer(A0)                            ; $002A
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
Offset_0x02ACE4:
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                lea     (GHz_Boss_Animate_Data), A1            ; Offset_0x02B038
                bsr     Jmp_12_To_AnimateSprite                ; Offset_0x02B25C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244      
;-------------------------------------------------------------------------------
Offset_0x02AD0A:
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl.s   Offset_0x02AD2C
                cmpi.w  #$FFF0, Obj_Timer(A0)                            ; $002A
                ble     Jmp_1F_To_DeleteObject                 ; Offset_0x02B24A
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                addi.w  #$0001, Obj_Y(A0)                                ; $000C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AD2C:
                lea     (GHz_Boss_Animate_Data), A1            ; Offset_0x02B038
                bsr     Jmp_12_To_AnimateSprite                ; Offset_0x02B25C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244  
;-------------------------------------------------------------------------------
Offset_0x02AD3A:
                tst.b   Obj_Routine_2(A0)                                ; $0025
                bne.s   Offset_0x02AD6A
                cmpi.w  #$28F0, (Sonic_Level_Limits_Min_X).w         ; $FFFFEEC8
                bcs     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                cmpi.w  #$29D0, Obj_X(A0)                                ; $0008
                ble.s   Offset_0x02AD5C
                subi.w  #$0001, Obj_X(A0)                                ; $0008
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AD5C:
                move.w  #$29D0, Obj_X(A0)                                ; $0008
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AD6A:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                btst    #$01, Obj_Control_Var_01(A1)                     ; $002D
                beq     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                btst    #$02, Obj_Control_Var_01(A1)                     ; $002D
                bne     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                addi.w  #$0008, Obj_Y(A0)                                ; $000C
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                bmi     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244 
;-------------------------------------------------------------------------------
Offset_0x02ADA8:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02ADB6(PC, D0), D1
                jmp     Offset_0x02ADB6(PC, D1) 
;-------------------------------------------------------------------------------       
Offset_0x02ADB6:
                dc.w    Offset_0x02ADC0-Offset_0x02ADB6
                dc.w    Offset_0x02AE58-Offset_0x02ADB6
                dc.w    Offset_0x02AE76-Offset_0x02ADB6
                dc.w    Offset_0x02AED6-Offset_0x02ADB6
                dc.w    Offset_0x02AF02-Offset_0x02ADB6  
;------------------------------------------------------------------------------- 
Offset_0x02ADC0:
                cmpi.w  #$28F0, (Sonic_Level_Limits_Min_X).w         ; $FFFFEEC8
                bcs     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                move.w  #$0100, Obj_Speed_Y(A0)                          ; $0012
                cmpi.b  #$01, Obj_Subtype(A0)                            ; $0028
                bgt.s   Offset_0x02ADFA
                beq.s   Offset_0x02ADEA
                cmpi.w  #$29EC, Obj_X(A0)                                ; $0008
                ble.s   Offset_0x02AE0A
                subi.w  #$0001, Obj_X(A0)                                ; $0008
                bra.s   Offset_0x02AE2C
Offset_0x02ADEA:
                cmpi.w  #$29C4, Obj_X(A0)                                ; $0008
                ble.s   Offset_0x02AE16
                subi.w  #$0001, Obj_X(A0)                                ; $0008
                bra.s   Offset_0x02AE2C
Offset_0x02ADFA:
                cmpi.w  #$29A4, Obj_X(A0)                                ; $0008
                ble.s   Offset_0x02AE22
                subi.w  #$0001, Obj_X(A0)                                ; $0008
                bra.s   Offset_0x02AE2C
Offset_0x02AE0A:
                move.w  #$29EC, Obj_X(A0)                                ; $0008
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra.s   Offset_0x02AE2C
Offset_0x02AE16:
                move.w  #$29C4, Obj_X(A0)                                ; $0008
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra.s   Offset_0x02AE2C
Offset_0x02AE22:
                move.w  #$29A4, Obj_X(A0)                                ; $0008
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
Offset_0x02AE2C:
                bsr     Jmp_07_To_ObjectFall                   ; Offset_0x02B27A
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x02AE3E
                add.w   D1, Obj_Y(A0)                                    ; $000C
Offset_0x02AE3E:
                tst.b   Obj_Routine_2(A0)                                ; $0025
                beq.s   Offset_0x02AE4A
                move.w  #$FE00, Obj_Speed(A0)                            ; $0010
Offset_0x02AE4A:
                lea     (GHz_Boss_Animate_Data_01), A1         ; Offset_0x02B146
                bsr     Jmp_12_To_AnimateSprite                ; Offset_0x02B25C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244     
;-------------------------------------------------------------------------------
Offset_0x02AE58:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.b  #$56, (A1)
                bne     Jmp_1F_To_DeleteObject                 ; Offset_0x02B24A
                btst    #$01, Obj_Control_Var_01(A1)                     ; $002D
                beq     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244   
;-------------------------------------------------------------------------------
Offset_0x02AE76:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.b  #$56, (A1)
                bne     Jmp_1F_To_DeleteObject                 ; Offset_0x02B24A
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                tst.b   Obj_Status(A0)                                   ; $0022
                bpl.s   Offset_0x02AE98
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
Offset_0x02AE98:
                bsr     Offset_0x02ABFA
                bsr     Jmp_07_To_ObjectFall                   ; Offset_0x02B27A
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x02AEAE
                add.w   D1, Obj_Y(A0)                                    ; $000C
Offset_0x02AEAE:
                move.w  #$0100, Obj_Speed_Y(A0)                          ; $0012
                cmpi.b  #$02, Obj_Priority(A0)                           ; $0018
                bne.s   Offset_0x02AEC8
                move.w  Obj_Y(A0), D0                                    ; $000C
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                add.w   D0, Obj_Control_Var_02(A1)                       ; $002E
Offset_0x02AEC8:
                lea     (GHz_Boss_Animate_Data_01), A1         ; Offset_0x02B146
                bsr     Jmp_12_To_AnimateSprite                ; Offset_0x02B25C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244   
;-------------------------------------------------------------------------------
Offset_0x02AED6:
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$000A, Obj_Timer(A0)                            ; $002A
                move.w  #$FD00, Obj_Speed_Y(A0)                          ; $0012
                cmpi.b  #$02, Obj_Priority(A0)                           ; $0018
                beq     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                neg.w   Obj_Speed(A0)                                    ; $0010
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244   
;-------------------------------------------------------------------------------
Offset_0x02AF02:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bpl     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                bsr     Jmp_07_To_ObjectFall                   ; Offset_0x02B27A
                bsr     Jmp_02_To_ObjHitFloor                  ; Offset_0x02B268
                tst.w   D1
                bpl.s   Offset_0x02AF20
                move.w  #$FE00, Obj_Speed_Y(A0)                          ; $0012
                add.w   D1, Obj_Y(A0)                                    ; $000C
Offset_0x02AF20:
                bra     Jmp_25_To_MarkObjGone                  ; Offset_0x02B250    
;-------------------------------------------------------------------------------
Offset_0x02AF24:
                tst.b   Obj_Routine_2(A0)                                ; $0025
                bne.s   Offset_0x02AF54
                cmpi.w  #$28F0, (Sonic_Level_Limits_Min_X).w         ; $FFFFEEC8
                bcs     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                cmpi.w  #$299A, Obj_X(A0)                                ; $0008
                ble.s   Offset_0x02AF46
                subi.w  #$0001, Obj_X(A0)                                ; $0008
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AF46:
                move.w  #$299A, Obj_X(A0)                                ; $0008
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AF54:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.b  #$56, (A1)
                bne     Jmp_1F_To_DeleteObject                 ; Offset_0x02B24A
                btst    #$03, Obj_Control_Var_01(A1)                     ; $002D
                bne.s   Offset_0x02AFBA
                bsr     Offset_0x02AFDA
                btst    #$01, Obj_Control_Var_01(A1)                     ; $002D
                beq     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
                move.b  #$8B, Obj_Col_Flags(A0)                          ; $0020
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                addi.w  #$0010, Obj_Y(A0)                                ; $000C
                move.w  #$FFCA, D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02AFA8
                neg.w   D0
Offset_0x02AFA8:
                add.w   D0, Obj_X(A0)                                    ; $0008
                lea     (GHz_Boss_Animate_Data_01), A1         ; Offset_0x02B146
                bsr     Jmp_12_To_AnimateSprite                ; Offset_0x02B25C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AFBA:
                move.w  #$FFFD, D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02AFC8
                neg.w   D0
Offset_0x02AFC8:
                add.w   D0, Obj_X(A0)                                    ; $0008
                lea     (GHz_Boss_Animate_Data_01), A1         ; Offset_0x02B146
                bsr     Jmp_12_To_AnimateSprite                ; Offset_0x02B25C
                bra     Jmp_1C_To_DisplaySprite                ; Offset_0x02B244
Offset_0x02AFDA:
                cmpi.b  #$01, Obj_Boss_Hit(A1)                           ; $0021
                beq.s   Offset_0x02AFE4
                rts
Offset_0x02AFE4:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                bpl.s   Offset_0x02AFF8
                btst    #$00, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x02B002
                rts
Offset_0x02AFF8:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x02B002
                rts
Offset_0x02B002:
                bset    #$03, Obj_Control_Var_01(A1)                     ; $002D
                rts     
;-------------------------------------------------------------------------------
Offset_0x02B00A:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.l  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                move.l  #GHz_Boss_Animate_Data_02, A1          ; Offset_0x02B1CA
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE  
;-------------------------------------------------------------------------------
GHz_Boss_Animate_Data:                                         ; Offset_0x02B038
                dc.w    Offset_0x02B03E-GHz_Boss_Animate_Data
                dc.w    Offset_0x02B042-GHz_Boss_Animate_Data
                dc.w    Offset_0x02B058-GHz_Boss_Animate_Data
Offset_0x02B03E:
                dc.b    $01, $05, $06, $FF
Offset_0x02B042:
                dc.b    $01, $01, $01, $01, $02, $02, $02, $03
                dc.b    $03, $03, $04, $04, $04, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $FF
Offset_0x02B058:
                dc.b    $01, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $04, $04, $04, $03, $03, $03, $02
                dc.b    $02, $02, $01, $01, $01, $05, $06, $FE
                dc.b    $02, $00                                
;-------------------------------------------------------------------------------
GHz_Boss_Mappings:                                             ; Offset_0x02B072
                dc.w    Offset_0x02B080-GHz_Boss_Mappings
                dc.w    Offset_0x02B08A-GHz_Boss_Mappings
                dc.w    Offset_0x02B0B4-GHz_Boss_Mappings
                dc.w    Offset_0x02B0DE-GHz_Boss_Mappings
                dc.w    Offset_0x02B0F8-GHz_Boss_Mappings
                dc.w    Offset_0x02B112-GHz_Boss_Mappings
                dc.w    Offset_0x02B12C-GHz_Boss_Mappings
Offset_0x02B080:
                dc.w    $0001
                dc.l    $D8050000, $00000002
Offset_0x02B08A:
                dc.w    $0005
                dc.l    $D8050004, $00020002
                dc.l    $D80D000C, $00060012
                dc.l    $D80D000C, $00060032
                dc.l    $D80D000C, $0006FFE2
                dc.l    $D80D000C, $0006FFC2
Offset_0x02B0B4:
                dc.w    $0005
                dc.l    $D8050004, $00020002
                dc.l    $D80D000C, $00060012
                dc.l    $D8050008, $00040032
                dc.l    $D80D000C, $0006FFE2
                dc.l    $D8050008, $0004FFD2
Offset_0x02B0DE:
                dc.w    $0003
                dc.l    $D8050004, $00020002
                dc.l    $D80D000C, $00060012
                dc.l    $D80D000C, $0006FFE2
Offset_0x02B0F8:
                dc.w    $0003
                dc.l    $D8050004, $00020002
                dc.l    $D8050008, $00040012
                dc.l    $D8050008, $0004FFF2
Offset_0x02B112:
                dc.w    $0003
                dc.l    $D8050000, $00000002
                dc.l    $D80D000C, $00060012
                dc.l    $D80D000C, $00060032
Offset_0x02B12C:
                dc.w    $0003
                dc.l    $D8050004, $00020002
                dc.l    $D80D000C, $0006FFE2
                dc.l    $D80D000C, $0006FFC2            
;-------------------------------------------------------------------------------
GHz_Boss_Animate_Data_01:                                      ; Offset_0x02B146
                dc.w    Offset_0x02B14C-GHz_Boss_Animate_Data_01
                dc.w    Offset_0x02B151-GHz_Boss_Animate_Data_01
                dc.w    Offset_0x02B155-GHz_Boss_Animate_Data_01
Offset_0x02B14C:
                dc.b    $05, $01, $02, $03, $FF
Offset_0x02B151:
                dc.b    $01, $04, $05, $FF
Offset_0x02B155:
                dc.b    $01, $06, $07, $FF, $00       
;-------------------------------------------------------------------------------
GHz_Boss_Mappings_01:                                          ; Offset_0x02B15A
                dc.w    Offset_0x02B16A-GHz_Boss_Mappings_01
                dc.w    Offset_0x02B184-GHz_Boss_Mappings_01
                dc.w    Offset_0x02B18E-GHz_Boss_Mappings_01
                dc.w    Offset_0x02B198-GHz_Boss_Mappings_01
                dc.w    Offset_0x02B1A2-GHz_Boss_Mappings_01
                dc.w    Offset_0x02B1AC-GHz_Boss_Mappings_01
                dc.w    Offset_0x02B1B6-GHz_Boss_Mappings_01
                dc.w    Offset_0x02B1C0-GHz_Boss_Mappings_01
Offset_0x02B16A:
                dc.w    $0003
                dc.l    $F00F0000, $0000FFD0
                dc.l    $F00F0010, $0008FFF0
                dc.l    $F00F0020, $00100010
Offset_0x02B184:
                dc.w    $0001
                dc.l    $F00F0030, $0018FFF0
Offset_0x02B18E:
                dc.w    $0001
                dc.l    $F00F0040, $0020FFF0
Offset_0x02B198:
                dc.w    $0001
                dc.l    $F00F0050, $0028FFF0
Offset_0x02B1A2:
                dc.w    $0001
                dc.l    $F00F0060, $0030FFF0
Offset_0x02B1AC:
                dc.w    $0001
                dc.l    $F00F1060, $1030FFF0
Offset_0x02B1B6:
                dc.w    $0001
                dc.l    $F00F0070, $0038FFF0
Offset_0x02B1C0:
                dc.w    $0001
                dc.l    $F00F1070, $1038FFF0                    
;-------------------------------------------------------------------------------
GHz_Boss_Animate_Data_02:                                      ; Offset_0x02B1CA
                dc.w    Offset_0x02B1CE-GHz_Boss_Animate_Data_02
                dc.w    Offset_0x02B1D1-GHz_Boss_Animate_Data_02
Offset_0x02B1CE:
                dc.b    $0F, $00, $FF
Offset_0x02B1D1:
                dc.b    $07, $01, $02, $FF, $00                  
;-------------------------------------------------------------------------------
GHz_Boss_Mappings_02:                                          ; Offset_0x02B1D6
                dc.w    Offset_0x02B1DC-GHz_Boss_Mappings_02
                dc.w    Offset_0x02B1FE-GHz_Boss_Mappings_02
                dc.w    Offset_0x02B220-GHz_Boss_Mappings_02
Offset_0x02B1DC:
                dc.w    $0004
                dc.l    $F8050000, $0000FFE0
                dc.l    $08050004, $0002FFE0
                dc.l    $F80F0008, $0004FFF0
                dc.l    $F8070018, $000C0010
Offset_0x02B1FE:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0
                dc.l    $E80D0030, $0018FFF0
                dc.l    $E8050024, $00120010
                dc.l    $D8050020, $00100002
Offset_0x02B220:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0
                dc.l    $E80D0038, $001CFFF0
                dc.l    $E8050024, $00120010
                dc.l    $D8050020, $00100002
;===============================================================================   
; Objeto 0x56 - Robotnik na Green Hill
; <<<-        
;===============================================================================