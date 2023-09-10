;===============================================================================
; Objeto 0x5D - Robotnik na Chemical Plant
; ->>> 
;===============================================================================
; Offset_0x028FDC:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x028FEA(PC, D0), D1
                jmp     Offset_0x028FEA(PC, D1)
Offset_0x028FEA:
                dc.w    Offset_0x029006-Offset_0x028FEA
                dc.w    Offset_0x0291F6-Offset_0x028FEA
                dc.w    Offset_0x02962C-Offset_0x028FEA
                dc.w    Offset_0x0296F0-Offset_0x028FEA
                dc.w    Offset_0x02983C-Offset_0x028FEA
                dc.w    Offset_0x029904-Offset_0x028FEA
                dc.w    Offset_0x029F04-Offset_0x028FEA
                dc.w    Offset_0x029888-Offset_0x028FEA
                dc.w    Offset_0x029A1C-Offset_0x028FEA
                dc.w    Offset_0x029540-Offset_0x028FEA
                dc.w    Offset_0x0294E8-Offset_0x028FEA
                dc.w    Offset_0x02A178-Offset_0x028FEA
                dc.w    Offset_0x02A1AA-Offset_0x028FEA
                dc.w    Offset_0x02A252-Offset_0x028FEA   
;-------------------------------------------------------------------------------                      
Offset_0x029006:
                move.l  #CPz_Boss_Mappings_1, Obj_Map(A0) ; Offset_0x02A5C4, $0004
                move.w  #$2420, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.w  #$2B80, Obj_X(A0)                                ; $0008
                move.w  #$04B0, Obj_Y(A0)                                ; $000C
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Boss_Hit(A0)                           ; $0021
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Control_Var_0C(A0)         ; $000C, $0038
                bclr    #$03, Obj_Control_Var_01(A0)                     ; $002D
                bsr     Jmp_36_To_ModifySpriteAttr_2P          ; Offset_0x02A696
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne     Offset_0x029154
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  A1, Obj_Control_Var_08(A0)                       ; $0034
                move.l  #CPz_Boss_Mappings_1, Obj_Map(A1) ; Offset_0x02A5C4, $0004
                move.w  #$0420, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$16, Obj_Routine(A1)                            ; $0024
                move.b  #$01, Obj_Ani_Number(A1)                         ; $001C
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                bsr     Jmp_05_To_ModifySpriteAttr_2P_A1       ; Offset_0x02A68A
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bmi     Offset_0x029154
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne     Offset_0x029154
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #CPz_Boss_Mappings_2, Obj_Map(A1) ; Offset_0x02A630, $0004
                move.w  #$0418, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_05_To_ModifySpriteAttr_2P_A1       ; Offset_0x02A68A
                move.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$18, Obj_Routine(A1)                            ; $0024
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x029154
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$12, Obj_Routine(A1)                            ; $0024
Offset_0x029154:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x0291B0
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                subi.w  #$0038, Obj_Y(A1)                                ; $000C
                subi.w  #$0010, Obj_X(A1)                                ; $0008
                move.w  #$FFF0, Obj_Control_Var_02(A1)                   ; $002E
                addi.b  #$10, Obj_Routine(A1)                            ; $0024
                move.b  #$06, Obj_Ani_Number(A1)                         ; $001C
Offset_0x0291B0:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x0291F4
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$04, Obj_Routine(A1)                            ; $0024
Offset_0x0291F4:
                rts
;-------------------------------------------------------------------------------                
Offset_0x0291F6:
                bsr     Offset_0x02923A
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02922C(PC, D0), D1
                jsr     Offset_0x02922C(PC, D1)
                lea     (CPz_Boss_Animate_Data_1), A1          ; Offset_0x02A5B8
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$03, D0
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                or.b    D0, Obj_Flags(A0)                                ; $0001
                jmp     (DisplaySprite)                        ; Offset_0x0120DE     
Offset_0x02922C:
                dc.w    Offset_0x0292FC-Offset_0x02922C
                dc.w    Offset_0x029422-Offset_0x02922C
                dc.w    Offset_0x02948A-Offset_0x02922C
                dc.w    Offset_0x02949E-Offset_0x02922C
                dc.w    Offset_0x02925C-Offset_0x02922C
                dc.w    Offset_0x029280-Offset_0x02922C
                dc.w    Offset_0x0292C2-Offset_0x02922C  
;-------------------------------------------------------------------------------                      
Offset_0x02923A:
                cmpi.b  #$08, Obj_Routine_2(A0)                          ; $0025
                bge.s   Offset_0x029252
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                bgt.s   Offset_0x029254
                bclr    #$00, Obj_Status(A0)                             ; $0022
Offset_0x029252:
                rts
Offset_0x029254:
                bset    #$00, Obj_Status(A0)                             ; $0022
                rts
;-------------------------------------------------------------------------------                
Offset_0x02925C:
                subq.w  #$01, Obj_Control_Var_10(A0)                     ; $003C
                bpl     Offset_0x0293BE
                bset    #$00, Obj_Status(A0)                             ; $0022
                bclr    #$07, Obj_Status(A0)                             ; $0022
                clr.w   Obj_Speed(A0)                                    ; $0010
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FFDA, Obj_Control_Var_10(A0)                   ; $003C
                rts
;-------------------------------------------------------------------------------                
Offset_0x029280:
                addq.w  #$01, Obj_Control_Var_10(A0)                     ; $003C
                beq.s   Offset_0x029290
                bpl.s   Offset_0x029296
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                bra.s   Offset_0x0292BA
Offset_0x029290:
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                bra.s   Offset_0x0292BA
Offset_0x029296:
                cmpi.w  #$0030, Obj_Control_Var_10(A0)                   ; $003C
                bcs.s   Offset_0x0292AE
                beq.s   Offset_0x0292B6
                cmpi.w  #$0038, Obj_Control_Var_10(A0)                   ; $003C
                bcs.s   Offset_0x0292BA
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra.s   Offset_0x0292BA
Offset_0x0292AE:
                subi.w  #$0008, Obj_Speed_Y(A0)                          ; $0012
                bra.s   Offset_0x0292BA
Offset_0x0292B6:
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x0292BA:
                bsr     Offset_0x029398
                bra     Offset_0x029318
;-------------------------------------------------------------------------------                
Offset_0x0292C2:
                bset    #$06, Obj_Control_Var_02(A0)                     ; $002E
                move.w  #$0400, Obj_Speed(A0)                            ; $0010
                move.w  #$FFC0, Obj_Speed_Y(A0)                          ; $0012
                cmpi.w  #$2CC0, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                beq.s   Offset_0x0292E2
                addq.w  #$02, (Sonic_Level_Limits_Max_X).w           ; $FFFFEECA
                bra.s   Offset_0x0292E8
Offset_0x0292E2:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x0292F0
Offset_0x0292E8:
                bsr     Offset_0x029398
                bra     Offset_0x029318
Offset_0x0292F0:
                move.b  #$01, ($FFFFF7A7).w
                jmp     (DeleteObject)                         ; Offset_0x0120D0
;-------------------------------------------------------------------------------                
Offset_0x0292FC:
                move.w  #$0100, Obj_Speed_Y(A0)                          ; $0012
                bsr     Offset_0x029398
                cmpi.w  #$04C0, Obj_Control_Var_0C(A0)                   ; $0038
                bne.s   Offset_0x029318
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
Offset_0x029318:
                move.b  Obj_Control_Var_13(A0), D0                       ; $003F
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$06, D0
                add.w   Obj_Control_Var_0C(A0), D0                       ; $0038
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_04(A0), Obj_X(A0)         ; $0008, $0030
                addq.b  #$02, Obj_Control_Var_13(A0)                     ; $003F
                cmpi.b  #$08, Obj_Routine_2(A0)                          ; $0025
                bcc.s   Offset_0x029382
                tst.b   Obj_Status(A0)                                   ; $0022
                bmi.s   Offset_0x029384
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                bne.s   Offset_0x029382
                tst.b   Obj_Control_Var_12(A0)                           ; $003E
                bne.s   Offset_0x029360
                move.b  #$40, Obj_Control_Var_12(A0)                     ; $003E
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x029360:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x02936E
                move.w  #$0EEE, D0
Offset_0x02936E:
                move.w  D0, (A1)
                subq.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                bne.s   Offset_0x029382
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                bclr    #$01, Obj_Control_Var_01(A0)                     ; $002D
Offset_0x029382:
                rts
Offset_0x029384:
                moveq   #$64, D0
                bsr     Jmp_01_To_AddPoints                    ; Offset_0x02A690
                move.b  #$08, Obj_Routine_2(A0)                          ; $0025
                move.w  #$00B3, Obj_Control_Var_10(A0)                   ; $003C
                rts
Offset_0x029398:
                move.l  Obj_Control_Var_04(A0), D2                       ; $0030
                move.l  Obj_Control_Var_0C(A0), D3                       ; $0038
                move.w  Obj_Speed(A0), D0                                ; $0010
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, Obj_Control_Var_04(A0)                       ; $0030
                move.l  D3, Obj_Control_Var_0C(A0)                       ; $0038
                rts
Offset_0x0293BE:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$07, D0
                bne.s   Offset_0x029404
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne.s   Offset_0x029404
                move.b  #$58, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                move.w  D0, D1
                moveq   #$00, D1
                move.b  D0, D1
                lsr.b   #$02, D1
                subi.w  #$0020, D1
                add.w   D1, Obj_X(A1)                                    ; $0008
                lsr.w   #$08, D0
                lsr.b   #$02, D0
                subi.w  #$0020, D0
                add.w   D0, Obj_Y(A1)                                    ; $000C
Offset_0x029404:
                rts
;-------------------------------------------------------------------------------
Offset_0x029406:
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne.s   Offset_0x029420
                move.b  #$58, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
Offset_0x029420:
                rts
;-------------------------------------------------------------------------------                
Offset_0x029422:
                btst    #$03, Obj_Control_Var_01(A0)                     ; $002D
                bne.s   Offset_0x029430
                move.w  #$2B30, D0
                bra.s   Offset_0x029434
Offset_0x029430:
                move.w  #$2A50, D0
Offset_0x029434:
                move.w  D0, D1
                sub.w   Obj_Control_Var_04(A0), D0                       ; $0030
                bpl.s   Offset_0x02943E
                neg.w   D0
Offset_0x02943E:
                cmpi.w  #$0003, D0
                ble.s   Offset_0x029460
                cmp.w   Obj_Control_Var_04(A0), D1                       ; $0030
                bgt.s   Offset_0x029452
                move.w  #$FD00, Obj_Speed(A0)                            ; $0010
                bra.s   Offset_0x029458
Offset_0x029452:
                move.w  #$0300, Obj_Speed(A0)                            ; $0010
Offset_0x029458:
                bsr     Offset_0x029398
                bra     Offset_0x029318
Offset_0x029460:
                cmpi.w  #$04C0, Obj_Control_Var_0C(A0)                   ; $0038
                bne     Offset_0x029318
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bchg    #03, Obj_Control_Var_01(A0)                      ; $002D
                bset    #$00, Obj_Control_Var_02(A0)                     ; $002E
                bra     Offset_0x029318
;-------------------------------------------------------------------------------                
Offset_0x02948A:
                btst    #$00, Obj_Control_Var_02(A0)                     ; $002E
                beq.s   Offset_0x029496
                bra     Offset_0x029318
Offset_0x029496:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra     Offset_0x029318
;-------------------------------------------------------------------------------                
Offset_0x02949E:
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                addi.w  #$004C, D0
                cmp.w   Obj_Control_Var_04(A0), D0                       ; $0030
                bgt.s   Offset_0x0294CC
                beq     Offset_0x029318
                subi.l  #$00010000, Obj_Control_Var_04(A0)               ; $0030
                cmpi.w  #$2A28, Obj_Control_Var_04(A0)                   ; $0030
                bgt     Offset_0x029318
                move.w  #$2A28, Obj_Control_Var_04(A0)                   ; $0030
                bra     Offset_0x029318
Offset_0x0294CC:
                addi.l  #$00010000, Obj_Control_Var_04(A0)               ; $0030
                cmpi.w  #$2B70, Obj_Control_Var_04(A0)                   ; $0030
                blt     Offset_0x029318
                move.w  #$2B70, Obj_Control_Var_04(A0)                   ; $0030
                bra     Offset_0x029318
;-------------------------------------------------------------------------------                
Offset_0x0294E8:
                cmpi.b  #$F9, Obj_Control_Var_04(A0)                     ; $0030
                beq.s   Offset_0x02950A
                subi.b  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bgt     Jmp_1B_To_DisplaySprite                ; Offset_0x02A678
                bsr     Offset_0x029406
                move.b  #$F9, Obj_Control_Var_04(A0)                     ; $0030
                move.w  #$001E, Obj_Timer(A0)                            ; $002A
Offset_0x02950A:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bpl     Jmp_1B_To_DisplaySprite                ; Offset_0x02A678
                move.w  Obj_Speed(A0), D0                                ; $0010
                add.w   D0, Obj_X(A0)                                    ; $0008
                move.l  Obj_Y(A0), D3                                    ; $000C
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                addi.w  #$0038, Obj_Speed_Y(A0)                          ; $0012
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D3, Obj_Y(A0)                                    ; $000C
                cmpi.l  #$05800000, D3
                bcc     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                bra     Jmp_24_To_MarkObjGone                  ; Offset_0x02A684
;-------------------------------------------------------------------------------                
Offset_0x029540:
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x029576
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.l  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.l  #CPz_Boss_Animate_Data, A1             ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x029576:
                moveq   #$22, D3
                move.b  #$78, Obj_Control_Var_04(A0)                     ; $0030
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  D3, Obj_Map_Id(A0)                               ; $001A
                move.b  #$14, Obj_Routine(A0)                            ; $0024
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.w  #$FC80, Obj_Speed_Y(A0)                          ; $0012
                moveq   #$01, D2
                addq.w  #$01, D3
Offset_0x0295B0:
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.b  D3, Obj_Map_Id(A1)                               ; $001A
                move.b  #$14, Obj_Routine(A1)                            ; $0024
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, Obj_Speed(A1)                                ; $0010
                move.w  #$FC80, Obj_Speed_Y(A1)                          ; $0012
                swap.w  D0
                addi.b  #$1E, D0
                andi.w  #$007F, D0
                move.b  D0, Obj_Control_Var_04(A1)                       ; $0030
                addq.w  #$01, D3
                dbra    D2, Offset_0x0295B0
                rts
;-------------------------------------------------------------------------------                
Offset_0x02962C:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02963A(PC, D0), D1
                jmp     Offset_0x02963A(PC, D1)
Offset_0x02963A:
                dc.w    Offset_0x02963E-Offset_0x02963A
                dc.w    Offset_0x02966C-Offset_0x02963A
;-------------------------------------------------------------------------------                
Offset_0x02963E:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                btst    #$00, Obj_Control_Var_02(A1)                     ; $002E
                bne.s   Offset_0x02964C
                rts
Offset_0x02964C:
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                addi.w  #$0018, Obj_Y(A0)                                ; $000C
                move.w  #$000C, Obj_Control_Var_00(A0)                   ; $002C
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.l  A0, A1
                bra.s   Offset_0x02967A
;-------------------------------------------------------------------------------                
Offset_0x02966C:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                beq.s   Offset_0x029676
                rts
Offset_0x029676:
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
Offset_0x02967A:
                subq.w  #$01, Obj_Control_Var_00(A0)                     ; $002C
                blt.s   Offset_0x0296E0
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$05, Obj_Priority(A1)                           ; $0018
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_Control_Var_00(A0), D0                       ; $002C
                subi.w  #$000B, D0
                neg.w   D0
                lsl.w   #$03, D0
                move.w  D0, Obj_Control_Var_0C(A1)                       ; $0038
                add.w   D0, Obj_Y(A1)                                    ; $000C
                move.b  #$01, Obj_Ani_Number(A1)                         ; $001C
                cmpi.b  #$02, Obj_Routine_2(A1)                          ; $0025
                beq     Offset_0x029888
                move.b  #$0E, Obj_Routine(A1)                            ; $0024
                bra     Offset_0x029888
Offset_0x0296E0:
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                bra     Offset_0x029888
;-------------------------------------------------------------------------------                
Offset_0x0296F0:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x0296FE(PC, D0), D1
                jmp     Offset_0x0296FE(PC, D1)
Offset_0x0296FE:
                dc.w    Offset_0x029704-Offset_0x0296FE
                dc.w    Offset_0x029792-Offset_0x0296FE
                dc.w    Offset_0x029800-Offset_0x0296FE     
;-------------------------------------------------------------------------------                  
Offset_0x029704:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne     Offset_0x029888
                move.b  #$0E, Obj_Routine(A0)                            ; $0024
                move.b  #$06, Obj_Routine(A1)                            ; $0024
                move.b  #$02, Obj_Routine_2(A1)                          ; $0025
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$02, Obj_Boss_Hit_2(A1)                         ; $0032
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  #$0058, D0
                move.b  D0, Obj_Control_Var_05(A1)                       ; $0031
                add.w   D0, Obj_Y(A1)                                    ; $000C
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.b  #$12, Obj_Control_Var_04(A1)                     ; $0030
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x02978E
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.b  #$0A, Obj_Routine(A1)                            ; $0024
                move.l  Obj_Control_Var_08(A0), Obj_Control_Var_08(A1); $0034, $0034
Offset_0x02978E:
                bra     Offset_0x029888
;-------------------------------------------------------------------------------                
Offset_0x029792:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), A2                       ; $0034
                btst    #$07, Obj_Status(A2)                             ; $0022
                bne     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                subi.b  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bne.s   Offset_0x0297E4
                move.b  #$12, Obj_Control_Var_04(A0)                     ; $0030
                subi.b  #$08, Obj_Control_Var_05(A0)                     ; $0031
                bgt.s   Offset_0x0297E4
                bmi.s   Offset_0x0297D6
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$0C, Obj_Control_Var_04(A0)                     ; $0030
                bra.s   Offset_0x0297E4
Offset_0x0297D6:
                move.b  #$06, Obj_Control_Var_04(A0)                     ; $0030
                move.b  #$04, Obj_Routine_2(A0)                          ; $0025
                rts
Offset_0x0297E4:
                moveq   #$00, D0
                move.b  Obj_Control_Var_05(A0), D0                       ; $0031
                add.w   D0, Obj_Y(A0)                                    ; $000C
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x029800:
                subi.b  #$01, Obj_Control_Var_04(A0)                     ; $0030
                beq.s   Offset_0x02980A
                rts
Offset_0x02980A:
                subq.b  #$01, Obj_Boss_Hit_2(A0)                         ; $0032
                beq.s   Offset_0x029828
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$12, Obj_Control_Var_04(A0)                     ; $0030
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$58, Obj_Control_Var_05(A0)                     ; $0031
Offset_0x029828:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.b  #$08, Obj_Routine(A1)                            ; $0024
                move.b  #$58, Obj_Control_Var_05(A1)                     ; $0031
                bra     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
;-------------------------------------------------------------------------------                
Offset_0x02983C:
                tst.b   Obj_Control_Var_10(A0)                           ; $003C
                bne.s   Offset_0x029878
                moveq   #$00, D0
                move.b  Obj_Control_Var_05(A0), D0                       ; $0031
                add.w   Obj_Y(A0), D0                                    ; $000C
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$7F, D1
Offset_0x029852:
                cmp.w   Obj_Y(A1), D0                                    ; $000C
                beq.s   Offset_0x029868
                lea     Obj_Size(A1), A1                                 ; $0040
                dbra    D1, Offset_0x029852
                bra.s   Offset_0x029888      
;-------------------------------------------------------------------------------    
Offset_0x029862:
                st      Obj_Control_Var_10(A0)                           ; $003C
                bra.s   Offset_0x029888
Offset_0x029868:
                moveq   #$00, D7
                move.b  #$5D, D7
                cmp.b   (A1), D7
                beq.s   Offset_0x02987A
                dbra    D1, Offset_0x029852
                bra.s   Offset_0x029888
Offset_0x029878:
                move.l  A0, A1
Offset_0x02987A:
                bset    #$07, Obj_Status(A1)                             ; $0022
                subi.b  #$08, Obj_Control_Var_05(A0)                     ; $0031
                beq.s   Offset_0x029862
;-------------------------------------------------------------------------------                
Offset_0x029888:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), A2                       ; $0034
                btst    #$07, Obj_Status(A2)                             ; $0022
                bne.s   Offset_0x0298D8
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                cmpi.b  #$04, Obj_Routine_2(A0)                          ; $0025
                bne.s   Offset_0x0298B2
                addi.w  #$0018, Obj_Y(A0)                                ; $000C
Offset_0x0298B2:
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0298D4
                move.w  Obj_Control_Var_0C(A0), D0                       ; $0038
                add.w   D0, Obj_Y(A0)                                    ; $000C
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x0298D4:
                bra     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
Offset_0x0298D8:
                move.b  #$14, Obj_Routine(A0)                            ; $0024
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.w  #$FC80, Obj_Speed_Y(A0)                          ; $0012
                swap.w  D0
                addi.b  #$1E, D0
                andi.w  #$007F, D0
                move.b  D0, Obj_Control_Var_04(A0)                       ; $0030
                bra     Jmp_1B_To_DisplaySprite                ; Offset_0x02A678
;-------------------------------------------------------------------------------                
Offset_0x029904:
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02991C(PC, D0), D1
                jmp     Offset_0x02991C(PC, D1)         
Offset_0x02991C:
                dc.w    Offset_0x029922-Offset_0x02991C
                dc.w    Offset_0x029968-Offset_0x02991C
                dc.w    Offset_0x0299BA-Offset_0x02991C      
;-------------------------------------------------------------------------------                     
Offset_0x029922:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$5D, Obj_Id(A0)                                 ; $0000
                move.l  #CPz_Boss_Mappings, Obj_Map(A0) ; Offset_0x02A338, $0004
                move.w  #$6500, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  #$0F, Obj_Control_Var_04(A0)                     ; $0030
                move.b  #$04, Obj_Ani_Number(A0)                         ; $001C
;-------------------------------------------------------------------------------                
Offset_0x029968:
                subq.b  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bne.s   Offset_0x02998C
                move.b  #$05, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$04, Obj_Control_Var_04(A0)                     ; $0030
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                subi.w  #$0024, Obj_Y(A0)                                ; $000C
                subi.w  #$0002, Obj_X(A0)                                ; $0008
                rts
Offset_0x02998C:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x0299BA:
                subq.b  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bne.s   Offset_0x0299E0
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                bset    #$01, Obj_Control_Var_02(A1)                     ; $002E
                addq.b  #$01, Obj_Control_Var_10(A0)                     ; $003C
                cmpi.b  #$0C, Obj_Control_Var_10(A0)                     ; $003C
                bge     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                rts
Offset_0x0299E0:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                subi.w  #$0024, Obj_Y(A0)                                ; $000C
                subi.w  #$0002, Obj_X(A0)                                ; $0008
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x029A0A
                addi.w  #$0004, Obj_X(A0)                                ; $0008
Offset_0x029A0A:
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x029A1C:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x029A2A(PC, D0), D1
                jmp     Offset_0x029A2A(PC, D1)       
Offset_0x029A2A:
                dc.w    Offset_0x029A36-Offset_0x029A2A
                dc.w    Offset_0x029AE6-Offset_0x029A2A
                dc.w    Offset_0x029E9A-Offset_0x029A2A
                dc.w    Offset_0x029E2E-Offset_0x029A2A
                dc.w    Offset_0x029EF0-Offset_0x029A2A
                dc.w    Offset_0x029B72-Offset_0x029A2A     
;-------------------------------------------------------------------------------                
Offset_0x029A36:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                btst    #$07, Obj_Control_Var_02(A1)                     ; $002E
                bne.s   Offset_0x029A98
                bset    #$07, Obj_Control_Var_02(A1)                     ; $002E
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x029A98
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$10, Obj_Routine(A1)                            ; $0024
                move.b  #$04, Obj_Routine_2(A1)                          ; $0025
                move.b  #$09, Obj_Ani_Number(A1)                         ; $001C
Offset_0x029A98:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x029AE2
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$6500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.b  #$10, Obj_Routine(A1)                            ; $0024
                move.b  #$06, Obj_Routine_2(A1)                          ; $0025
Offset_0x029AE2:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
;-------------------------------------------------------------------------------                
Offset_0x029AE6:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                subi.w  #$0038, Obj_Y(A0)                                ; $000C
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x029B6A
                btst    #$02, Obj_Control_Var_02(A1)                     ; $002E
                beq.s   Offset_0x029B16
                bsr     Offset_0x029D58
                bsr     Offset_0x029C7C
                bra.s   Offset_0x029B36
Offset_0x029B16:
                btst    #$05, Obj_Control_Var_02(A1)                     ; $002E
                beq.s   Offset_0x029B36
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x029B36
                bclr    #$05, Obj_Control_Var_02(A1)                     ; $002E
                bset    #$03, Obj_Control_Var_02(A1)                     ; $002E
                bset    #$04, Obj_Control_Var_02(A1)                     ; $002E
Offset_0x029B36:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x029B54
                neg.w   D0
Offset_0x029B54:
                add.w   D0, Obj_X(A0)                                    ; $0008
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x029B6A:
                move.b  #$0A, Obj_Routine_2(A0)                          ; $0025
                bra.s   Offset_0x029B36
;-------------------------------------------------------------------------------                
Offset_0x029B72:
                move.l  D7, -(A7)
                move.b  #$1E, Obj_Control_Var_04(A0)                     ; $0030
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                subi.w  #$0038, Obj_Y(A0)                                ; $000C
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x029B9E
                neg.w   D0
Offset_0x029B9E:
                add.w   D0, Obj_X(A0)                                    ; $0008
                move.b  #$20, Obj_Map_Id(A0)                             ; $001A
                move.b  #$14, Obj_Routine(A0)                            ; $0024
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.w  #$FC80, Obj_Speed_Y(A0)                          ; $0012
                moveq   #$00, D7
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                addi.w  #$0018, D0
                bge.s   Offset_0x029BE0
                addi.w  #$0018, D0
                bge.s   Offset_0x029BDE
                addi.w  #$0018, D0
                bge.s   Offset_0x029BDC
                addq.w  #$01, D7
Offset_0x029BDC:
                addq.w  #$01, D7
Offset_0x029BDE:
                addq.w  #$01, D7
Offset_0x029BE0:
                subq.w  #$01, D7
                bmi     Offset_0x029C70
Offset_0x029BE6:
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.b  #$21, Obj_Map_Id(A1)                             ; $001A
                move.b  #$14, Obj_Routine(A1)                            ; $0024
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0008, Obj_Y(A1)                                ; $000C
                move.w  D7, D2
                add.w   D2, D2
                move.w  Offset_0x029C76(PC, D2), D3
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x029C46
                neg.w   D3
Offset_0x029C46:
                add.w   D3, Obj_X(A1)                                    ; $0008
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, Obj_Speed(A1)                                ; $0010
                move.w  #$FC80, Obj_Speed_Y(A1)                          ; $0012
                swap.w  D0
                addi.b  #$1E, D0
                andi.w  #$007F, D0
                move.b  D0, Obj_Control_Var_04(A1)                       ; $0030
                dbra    D7, Offset_0x029BE6
Offset_0x029C70:
                move.l  (A7)+, D7
                bra     Jmp_1B_To_DisplaySprite                ; Offset_0x02A678  
;-------------------------------------------------------------------------------                      
Offset_0x029C76:
                dc.w    $0018, $0030, $0048   
;-------------------------------------------------------------------------------
Offset_0x029C7C:
                btst    #$03, Obj_Control_Var_02(A1)                     ; $002E
                bne     Offset_0x029D56
                btst    #$04, Obj_Control_Var_02(A1)                     ; $002E
                bne     Offset_0x029D56
                cmpi.w  #$FFEC, Obj_Control_Var_02(A0)                   ; $002E
                blt.s   Offset_0x029CB0
                btst    #$01, Obj_Control_Var_01(A1)                     ; $002D
                beq     Offset_0x029D56
                bclr    #$01, Obj_Control_Var_01(A1)                     ; $002D
                bset    #$02, Obj_Control_Var_01(A1)                     ; $002D
                bra.s   Offset_0x029CEE
Offset_0x029CB0:
                cmpi.w  #$FFC0, Obj_Control_Var_02(A0)                   ; $002E
                bge     Offset_0x029D56
                move.w  (Player_Position_X).w, D1                    ; $FFFFB008
                subi.w  #$0008, D1
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x029CDE
                add.w   Obj_Control_Var_02(A0), D1                       ; $002E
                sub.w   Obj_X(A0), D1                                    ; $0008
                bgt     Offset_0x029D56
                cmpi.w  #$FFE8, D1
                bge.s   Offset_0x029CEE
                rts
Offset_0x029CDE:
                sub.w   Obj_Control_Var_02(A0), D1                       ; $002E
                sub.w   Obj_X(A0), D1                                    ; $0008
                blt.s   Offset_0x029D56
                cmpi.w  #$0018, D1
                bgt.s   Offset_0x029D56
Offset_0x029CEE:
                bset    #$05, Obj_Control_Var_02(A1)                     ; $002E
                bclr    #$02, Obj_Control_Var_02(A1)                     ; $002E
                move.w  #$0012, Obj_Timer(A0)                            ; $002A
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x029D56
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.b  #$10, Obj_Routine(A1)                            ; $0024
                move.b  #$08, Obj_Routine_2(A1)                          ; $0025
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$05, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$0B, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$0024, Obj_Timer(A1)                            ; $002A
Offset_0x029D56:
                rts
Offset_0x029D58:
                moveq   #$01, D0
                btst    #$04, Obj_Control_Var_02(A1)                     ; $002E
                bne.s   Offset_0x029D64
                moveq   #-$01, D0
Offset_0x029D64:
                cmpi.w  #$FFF0, Obj_Control_Var_02(A0)                   ; $002E
                bne.s   Offset_0x029DDC
                bclr    #$04, Obj_Control_Var_02(A1)                     ; $002E
                beq.s   Offset_0x029DDC
                bclr    #$02, Obj_Control_Var_02(A1)                     ; $002E
                clr.b   Obj_Routine_2(A0)                                ; $0025
                move.l  A1, A2
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x029DDA
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  Obj_Control_Var_08(A0), Obj_Control_Var_08(A1); $0034, $0034
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
                bra.s   Offset_0x029DDA
;-------------------------------------------------------------------------------
; Offset_0x029DCE:  ; Left over ???
                move.b  #$0A, Obj_Routine(A1)                            ; $0024
                move.l  Obj_Control_Var_08(A0), Obj_Control_Var_08(A1); $0034, $0034
Offset_0x029DDA:
                rts
Offset_0x029DDC:
                move.w  Obj_Control_Var_02(A0), D1                       ; $002E
                cmpi.w  #$FFD8, D1
                bge.s   Offset_0x029E26
                cmpi.w  #$FFC0, D1
                bge.s   Offset_0x029E1E
                move.b  #$08, Obj_Ani_Number(A0)                         ; $001C
                cmpi.w  #$FFA8, D1
                blt.s   Offset_0x029E08
                bgt.s   Offset_0x029E02
                btst    #$04, Obj_Control_Var_02(A1)                     ; $002E
                beq.s   Offset_0x029E06
Offset_0x029E02:
                add.w   D0, Obj_Control_Var_02(A0)                       ; $002E
Offset_0x029E06:
                rts
Offset_0x029E08:
                move.w  #$FFA8, Obj_Control_Var_02(A0)                   ; $002E
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x029E02
                move.w  #$0058, Obj_Control_Var_02(A0)                   ; $002E
                bra.s   Offset_0x029E02
Offset_0x029E1E:
                move.b  #$07, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x029E02
Offset_0x029E26:
                move.b  #$06, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x029E02
;-------------------------------------------------------------------------------                
Offset_0x029E2E:
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), D0                       ; $0034
                beq     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                move.l  D0, A1
                bclr    #$03, Obj_Control_Var_02(A1)                     ; $002E
                beq.s   Offset_0x029E62
                move.b  #$0C, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
                move.b  #$87, Obj_Col_Flags(A0)                          ; $0020
                bra.s   Offset_0x029EC2
Offset_0x029E62:
                bclr    #$01, Obj_Control_Var_02(A1)                     ; $002E
                bne.s   Offset_0x029E72
                tst.b   Obj_Ani_Number(A0)                               ; $001C
                bne.s   Offset_0x029EC2
                rts
Offset_0x029E72:
                tst.b   Obj_Ani_Number(A0)                               ; $001C
                bne.s   Offset_0x029E7E
                move.b  #$0B, Obj_Ani_Number(A0)                         ; $001C
Offset_0x029E7E:
                addi.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                cmpi.b  #$17, Obj_Ani_Number(A0)                         ; $001C
                blt.s   Offset_0x029EC2
                bclr    #$00, Obj_Control_Var_02(A1)                     ; $002E
                bset    #$02, Obj_Control_Var_02(A1)                     ; $002E
                bra.s   Offset_0x029EC2
;-------------------------------------------------------------------------------                
Offset_0x029E9A:
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), A1                       ; $0034
                btst    #$05, Obj_Control_Var_02(A1)                     ; $002E
                beq.s   Offset_0x029EC2
                cmpi.b  #$09, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x029EC2
                move.b  #$0A, Obj_Ani_Number(A0)                         ; $001C
Offset_0x029EC2:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x029EF0:
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                beq     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                bra.s   Offset_0x029EC2
;-------------------------------------------------------------------------------                
Offset_0x029F04:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x029F12(PC, D0), D1
                jmp     Offset_0x029F12(PC, D1)          
Offset_0x029F12:
                dc.w    Offset_0x029F1C-Offset_0x029F12
                dc.w    Offset_0x029F54-Offset_0x029F12
                dc.w    Offset_0x02A052-Offset_0x029F12
                dc.w    Offset_0x029FC8-Offset_0x029F12
                dc.w    Offset_0x02A012-Offset_0x029F12    
;-------------------------------------------------------------------------------                      
Offset_0x029F1C:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$20, Obj_Height_2(A0)                           ; $0016
                move.b  #$19, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), A1                       ; $0034
                btst    #$02, Obj_Control_Var_01(A1)                     ; $002D
                beq.s   Offset_0x029F54
                bclr    #$02, Obj_Control_Var_01(A1)                     ; $002D
                move.b  #$06, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0009, Obj_Timer(A0)                            ; $002A
;-------------------------------------------------------------------------------                
Offset_0x029F54:
                bsr     Jmp_06_To_ObjectFall                   ; Offset_0x02A69C
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bmi.s   Offset_0x029F7C
                cmpi.w  #$0518, Obj_Y(A0)                                ; $000C
                bge.s   Offset_0x029FAA
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x029F7C:
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), A1                       ; $0034
                bset    #$02, Obj_Control_Var_02(A1)                     ; $002E
                bset    #$04, Obj_Control_Var_02(A1)                     ; $002E
                move.b  #$02, Obj_Routine_2(A1)                          ; $0025
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$00, Obj_Subtype(A0)                            ; $0028
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x029FAA:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), A1                       ; $0034
                bset    #$02, Obj_Control_Var_02(A1)                     ; $002E
                bset    #$04, Obj_Control_Var_02(A1)                     ; $002E
                move.b  #$02, Obj_Routine_2(A1)                          ; $0025
                bra     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
;-------------------------------------------------------------------------------                
Offset_0x029FC8:
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bpl.s   Offset_0x029FFC
                move.b  #$02, Obj_Priority(A0)                           ; $0018
                move.b  #$25, Obj_Map_Id(A0)                             ; $001A
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$08, Obj_Ani_Time(A0)                           ; $001E
                bra.s   Offset_0x02A012
Offset_0x029FFC:
                bsr     Jmp_17_To_SpeedToPos                   ; Offset_0x02A6A2
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02A298
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x02A012:
                subi.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x02A038
                addi.b  #$01, Obj_Map_Id(A0)                             ; $001A
                move.b  #$08, Obj_Ani_Time(A0)                           ; $001E
                cmpi.b  #$27, Obj_Map_Id(A0)                             ; $001A
                bgt     Offset_0x029FAA
                blt.s   Offset_0x02A038
                addi.b  #$0C, Obj_Ani_Time(A0)                           ; $001E
Offset_0x02A038:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_Control_Var_08(A1), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x02A052:
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bne     Offset_0x02A14E
                addi.w  #$0018, Obj_Y(A0)                                ; $000C
                addi.w  #$000C, Obj_X(A0)                                ; $0008
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x02A076
                subi.w  #$0018, Obj_X(A0)                                ; $0008
Offset_0x02A076:
                move.b  #$04, Obj_Height_2(A0)                           ; $0016
                move.b  #$04, Obj_Width_2(A0)                            ; $0017
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
                move.b  #$09, Obj_Map_Id(A0)                             ; $001A
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                lsr.w   #$01, D0
                neg.w   D0
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                asr.w   #$06, D0
                bmi.s   Offset_0x02A0A6
                addi.w  #$0200, D0
Offset_0x02A0A6:
                addi.w  #$FF00, D0
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                moveq   #$03, D3
Offset_0x02A0B6:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne     Offset_0x02A14A
                move.b  #$5D, Obj_Id(A1)                                 ; $0000
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.l  #CPz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02A338, $0004
                move.w  #$6500, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.l  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.l  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$04, Obj_Height_2(A1)                           ; $0016
                move.b  #$04, Obj_Width_2(A1)                            ; $0017
                move.b  #$09, Obj_Map_Id(A1)                             ; $001A
                move.b  #$0C, Obj_Routine(A1)                            ; $0024
                move.b  #$04, Obj_Routine_2(A1)                          ; $0025
                move.b  #$01, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_Speed_Y(A0), Obj_Speed_Y(A1)          ; $0012, $0012
                move.b  Obj_Col_Flags(A0), Obj_Col_Flags(A1)      ; $0020, $0020
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                asr.w   #$06, D0
                bmi.s   Offset_0x02A134
                addi.w  #$0080, D0
Offset_0x02A134:
                addi.w  #$FF80, D0
                move.w  D0, Obj_Speed(A1)                                ; $0010
                swap.w  D0
                andi.w  #$03FF, D0
                sub.w   D0, Obj_Speed_Y(A1)                              ; $0012
                dbra    D3, Offset_0x02A0B6
Offset_0x02A14A:
                bra     Jmp_1B_To_DisplaySprite                ; Offset_0x02A678
Offset_0x02A14E:
                bsr     Jmp_06_To_ObjectFall                   ; Offset_0x02A69C
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bmi.s   Offset_0x02A160
                bra     Jmp_24_To_MarkObjGone                  ; Offset_0x02A684
Offset_0x02A160:
                bra     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
;-------------------------------------------------------------------------------
; Offset_0x02A164: ; Left Over ???
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                lsr.w   #$01, D0
                neg.w   D0
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
                bra     Jmp_1B_To_DisplaySprite                ; Offset_0x02A678
;-------------------------------------------------------------------------------                
Offset_0x02A178:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.l  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                move.l  #CPz_Boss_Animate_Data_1, A1           ; Offset_0x02A5B8
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE  
;-------------------------------------------------------------------------------                 
Offset_0x02A1A6:
                dc.b    $00, $FF, $01, $00     
;-------------------------------------------------------------------------------      
Offset_0x02A1AA:
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x02A204
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.l  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.l  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  Obj_Status(A1), Obj_Status(A0)            ; $0022, $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)              ; $0001, $0001
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x02A1F2
                move.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                move.b  Obj_Timer(A0), D0                                ; $002A
                addq.b  #$01, D0
                cmpi.b  #$02, D0
                ble.s   Offset_0x02A1E8
                moveq   #$00, D0
Offset_0x02A1E8:
                move.b  Offset_0x02A1A6(PC, D0), Obj_Map_Id(A0)          ; $001A
                move.b  D0, Obj_Timer(A0)                                ; $002A
Offset_0x02A1F2:
                cmpi.b  #$FF, Obj_Map_Id(A0)                             ; $001A
                bne     Jmp_1B_To_DisplaySprite                ; Offset_0x02A678
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                rts
Offset_0x02A204:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                btst    #$06, Obj_Control_Var_02(A1)                     ; $002E
                bne.s   Offset_0x02A212
                rts
Offset_0x02A212:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.l  #CPz_Boss_Mappings_3, Obj_Map(A0) ; Offset_0x02A648, $0004
                move.w  #$0418, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_36_To_ModifySpriteAttr_2P          ; Offset_0x02A696
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.b  #$05, Obj_Ani_Time(A0)                           ; $001E
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                addi.w  #$0004, Obj_Y(A0)                                ; $000C
                subi.w  #$0028, Obj_X(A0)                                ; $0008
                rts
;-------------------------------------------------------------------------------                
Offset_0x02A252:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x02A294
                move.b  #$05, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$04, Obj_Map_Id(A0)                             ; $001A
                bne     Offset_0x02A294
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.b  (A1), D0
                beq     Jmp_1E_To_DeleteObject                 ; Offset_0x02A67E
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                addi.w  #$0004, Obj_Y(A0)                                ; $000C
                subi.w  #$0028, Obj_X(A0)                                ; $0008
Offset_0x02A294:
                bra     Jmp_1B_To_DisplaySprite                ; Offset_0x02A678                  
;-------------------------------------------------------------------------------
CPz_Boss_Animate_Data:                                         ; Offset_0x02A298
                dc.w    Offset_0x02A2CE-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2D1-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2D4-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2D9-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2DD-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2E4-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2E7-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2EA-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2ED-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2F0-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2F3-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A2FF-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A30A-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A30D-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A310-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A313-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A316-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A319-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A31C-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A31F-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A322-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A325-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A328-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A32B-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A32E-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A331-CPz_Boss_Animate_Data
                dc.w    Offset_0x02A335-CPz_Boss_Animate_Data
Offset_0x02A2CE:
                dc.b    $0F, $00, $FF
Offset_0x02A2D1:
                dc.b    $0F, $01, $FF
Offset_0x02A2D4:
                dc.b    $05, $02, $03, $02, $FF
Offset_0x02A2D9:
                dc.b    $05, $02, $03, $FF
Offset_0x02A2DD:
                dc.b    $02, $04, $05, $06, $07, $08, $FF
Offset_0x02A2E4:
                dc.b    $03, $09, $FF
Offset_0x02A2E7:
                dc.b    $0F, $0A, $FF
Offset_0x02A2EA:
                dc.b    $0F, $1C, $FF
Offset_0x02A2ED:
                dc.b    $0F, $1E, $FF
Offset_0x02A2F0:
                dc.b    $0F, $0B, $FF
Offset_0x02A2F3:
                dc.b    $03, $0C, $0C, $0D, $0D, $0D, $0D, $0D
                dc.b    $0C, $0C, $FD, $09
Offset_0x02A2FF:
                dc.b    $03, $0E, $0E, $0F, $0F, $0F, $0F, $0F
                dc.b    $0E, $0E, $FF
Offset_0x02A30A:
                dc.b    $0F, $10, $FF
Offset_0x02A30D:
                dc.b    $0F, $11, $FF
Offset_0x02A310:
                dc.b    $0F, $12, $FF
Offset_0x02A313:
                dc.b    $0F, $13, $FF
Offset_0x02A316:
                dc.b    $0F, $14, $FF
Offset_0x02A319:
                dc.b    $0F, $15, $FF
Offset_0x02A31C:
                dc.b    $0F, $16, $FF
Offset_0x02A31F:
                dc.b    $0F, $17, $FF
Offset_0x02A322:
                dc.b    $0F, $18, $FF
Offset_0x02A325:
                dc.b    $0F, $19, $FF
Offset_0x02A328:
                dc.b    $0F, $1A, $FF
Offset_0x02A32B:
                dc.b    $0F, $1B, $FF
Offset_0x02A32E:
                dc.b    $0F, $1C, $FF
Offset_0x02A331:
                dc.b    $01, $1D, $1F, $FF
Offset_0x02A335:
                dc.b    $0F, $1E, $FF      
;-------------------------------------------------------------------------------
CPz_Boss_Mappings:                                             ; Offset_0x02A338
                dc.w    Offset_0x02A388-CPz_Boss_Mappings
                dc.w    Offset_0x02A3A2-CPz_Boss_Mappings
                dc.w    Offset_0x02A3AC-CPz_Boss_Mappings
                dc.w    Offset_0x02A3B6-CPz_Boss_Mappings
                dc.w    Offset_0x02A3C0-CPz_Boss_Mappings
                dc.w    Offset_0x02A3CA-CPz_Boss_Mappings
                dc.w    Offset_0x02A3D4-CPz_Boss_Mappings
                dc.w    Offset_0x02A3DE-CPz_Boss_Mappings
                dc.w    Offset_0x02A3E8-CPz_Boss_Mappings
                dc.w    Offset_0x02A3F2-CPz_Boss_Mappings
                dc.w    Offset_0x02A3FC-CPz_Boss_Mappings
                dc.w    Offset_0x02A40E-CPz_Boss_Mappings
                dc.w    Offset_0x02A418-CPz_Boss_Mappings
                dc.w    Offset_0x02A422-CPz_Boss_Mappings
                dc.w    Offset_0x02A42C-CPz_Boss_Mappings
                dc.w    Offset_0x02A436-CPz_Boss_Mappings
                dc.w    Offset_0x02A440-CPz_Boss_Mappings
                dc.w    Offset_0x02A44A-CPz_Boss_Mappings
                dc.w    Offset_0x02A454-CPz_Boss_Mappings
                dc.w    Offset_0x02A45E-CPz_Boss_Mappings
                dc.w    Offset_0x02A468-CPz_Boss_Mappings
                dc.w    Offset_0x02A47A-CPz_Boss_Mappings
                dc.w    Offset_0x02A48C-CPz_Boss_Mappings
                dc.w    Offset_0x02A49E-CPz_Boss_Mappings
                dc.w    Offset_0x02A4B0-CPz_Boss_Mappings
                dc.w    Offset_0x02A4CA-CPz_Boss_Mappings
                dc.w    Offset_0x02A4E4-CPz_Boss_Mappings
                dc.w    Offset_0x02A4FE-CPz_Boss_Mappings
                dc.w    Offset_0x02A518-CPz_Boss_Mappings
                dc.w    Offset_0x02A532-CPz_Boss_Mappings
                dc.w    Offset_0x02A53C-CPz_Boss_Mappings
                dc.w    Offset_0x02A55E-CPz_Boss_Mappings
                dc.w    Offset_0x02A568-CPz_Boss_Mappings
                dc.w    Offset_0x02A572-CPz_Boss_Mappings
                dc.w    Offset_0x02A57C-CPz_Boss_Mappings
                dc.w    Offset_0x02A586-CPz_Boss_Mappings
                dc.w    Offset_0x02A590-CPz_Boss_Mappings
                dc.w    Offset_0x02A59A-CPz_Boss_Mappings
                dc.w    Offset_0x02A5A4-CPz_Boss_Mappings
                dc.w    Offset_0x02A5AE-CPz_Boss_Mappings
Offset_0x02A388:
                dc.w    $0003
                dc.l    $B80D0000, $0000FFF8
                dc.l    $C80A0008, $00040008
                dc.l    $E0050011, $00080010
Offset_0x02A3A2:
                dc.w    $0001
                dc.l    $FC000024, $0012FFFC
Offset_0x02A3AC:
                dc.w    $0001
                dc.l    $FC040025, $0012FFF5
Offset_0x02A3B6:
                dc.w    $0001
                dc.l    $FC040027, $0013FFF6
Offset_0x02A3C0:
                dc.w    $0001
                dc.l    $C4000036, $001BFFFB
Offset_0x02A3CA:
                dc.w    $0001
                dc.l    $C4000037, $001BFFFB
Offset_0x02A3D4:
                dc.w    $0001
                dc.l    $C4000038, $001CFFFB
Offset_0x02A3DE:
                dc.w    $0001
                dc.l    $C4010039, $001CFFFB
Offset_0x02A3E8:
                dc.w    $0001
                dc.l    $C401003B, $001DFFFB
Offset_0x02A3F2:
                dc.w    $0001
                dc.l    $FC00003D, $001EFFFC
Offset_0x02A3FC:
                dc.w    $0002
                dc.l    $000E0015, $000A0000
                dc.l    $08080021, $00100018
Offset_0x02A40E:
                dc.w    $0001
                dc.l    $18080029, $00140000
Offset_0x02A418:
                dc.w    $0001
                dc.l    $1808002C, $00160000
Offset_0x02A422:
                dc.w    $0001
                dc.l    $1808002F, $00170008
Offset_0x02A42C:
                dc.w    $0001
                dc.l    $18040032, $0019FFFC
Offset_0x02A436:
                dc.w    $0001
                dc.l    $18040034, $001AFFFC
Offset_0x02A440:
                dc.w    $0001
                dc.l    $10080063, $00310000
Offset_0x02A44A:
                dc.w    $0001
                dc.l    $10080066, $00330000
Offset_0x02A454:
                dc.w    $0001
                dc.l    $10080069, $00340000
Offset_0x02A45E:
                dc.w    $0001
                dc.l    $1008006C, $00360000
Offset_0x02A468:
                dc.w    $0002
                dc.l    $1008006C, $00360000
                dc.l    $08080063, $00310000
Offset_0x02A47A:
                dc.w    $0002
                dc.l    $1008006C, $00360000
                dc.l    $08080066, $00330000
Offset_0x02A48C:
                dc.w    $0002
                dc.l    $1008006C, $00360000
                dc.l    $08080069, $00340000
Offset_0x02A49E:
                dc.w    $0002
                dc.l    $1008006C, $00360000
                dc.l    $0808006C, $00360000
Offset_0x02A4B0:
                dc.w    $0003
                dc.l    $1008006C, $00360000
                dc.l    $0808006C, $00360000
                dc.l    $00080063, $00310000
Offset_0x02A4CA:
                dc.w    $0003
                dc.l    $1008006C, $00360000
                dc.l    $0808006C, $00360000
                dc.l    $00080066, $00330000
Offset_0x02A4E4:
                dc.w    $0003
                dc.l    $1008006C, $00360000
                dc.l    $0808006C, $00360000
                dc.l    $00080069, $00340000
Offset_0x02A4FE:
                dc.w    $0003
                dc.l    $1008006C, $00360000
                dc.l    $0808006C, $00360000
                dc.l    $0008006C, $00360000
Offset_0x02A518:
                dc.w    $0003
                dc.l    $000E0015, $000A0000
                dc.l    $08080021, $00100018
                dc.l    $08080021, $00100030
Offset_0x02A532:
                dc.w    $0001
                dc.l    $000B003E, $001F0000
Offset_0x02A53C:
                dc.w    $0004
                dc.l    $000E0015, $000A0000
                dc.l    $08080021, $00100018
                dc.l    $08080021, $00100030
                dc.l    $08080021, $00100048
Offset_0x02A55E:
                dc.w    $0001
                dc.l    $000B083E, $081F0000
Offset_0x02A568:
                dc.w    $0001
                dc.l    $000E0015, $000A0000
Offset_0x02A572:
                dc.w    $0001
                dc.l    $00080021, $00100000
Offset_0x02A57C:
                dc.w    $0001
                dc.l    $B80D0000, $0000FFF8
Offset_0x02A586:
                dc.w    $0001
                dc.l    $C80A0008, $00040008
Offset_0x02A590:
                dc.w    $0001
                dc.l    $E0050011, $00080010
Offset_0x02A59A:
                dc.w    $0001
                dc.l    $E00A004A, $0025FFF0
Offset_0x02A5A4:
                dc.w    $0001
                dc.l    $E80D0053, $0029FFF0
Offset_0x02A5AE:
                dc.w    $0001
                dc.l    $E80D005B, $002DFFF0           
;-------------------------------------------------------------------------------
CPz_Boss_Animate_Data_1:                                       ; Offset_0x02A5B8
                dc.w    Offset_0x02A5BC-CPz_Boss_Animate_Data_1
                dc.w    Offset_0x02A5BF-CPz_Boss_Animate_Data_1
Offset_0x02A5BC:
                dc.b    $0F, $00, $FF
Offset_0x02A5BF:
                dc.b    $07, $01, $02, $FF, $00   
;-------------------------------------------------------------------------------
CPz_Boss_Mappings_1:                                           ; Offset_0x02A5C4
                dc.w    Offset_0x02A5CA-CPz_Boss_Mappings_1
                dc.w    Offset_0x02A5EC-CPz_Boss_Mappings_1
                dc.w    Offset_0x02A60E-CPz_Boss_Mappings_1
Offset_0x02A5CA:
                dc.w    $0004
                dc.l    $F8050000, $0000FFE0
                dc.l    $08050004, $0002FFE0
                dc.l    $F80F0008, $0004FFF0
                dc.l    $F8070018, $000C0010
Offset_0x02A5EC:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0
                dc.l    $E80D0030, $0018FFF0
                dc.l    $E8050024, $00120010
                dc.l    $D8050020, $00100002
Offset_0x02A60E:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0
                dc.l    $E80D0038, $001CFFF0
                dc.l    $E8050024, $00120010
                dc.l    $D8050020, $00100002      
;-------------------------------------------------------------------------------
CPz_Boss_Mappings_2:                                           ; Offset_0x02A630
                dc.w    Offset_0x02A634-CPz_Boss_Mappings_2
                dc.w    Offset_0x02A63E-CPz_Boss_Mappings_2
Offset_0x02A634:
                dc.w    $0001
                dc.l    $00050000, $0000001C
Offset_0x02A63E:
                dc.w    $0001
                dc.l    $00050004, $0002001C            
;-------------------------------------------------------------------------------
CPz_Boss_Mappings_3:                                           ; Offset_0x02A648
                dc.w    Offset_0x02A650-CPz_Boss_Mappings_3
                dc.w    Offset_0x02A65A-CPz_Boss_Mappings_3
                dc.w    Offset_0x02A664-CPz_Boss_Mappings_3
                dc.w    Offset_0x02A66E-CPz_Boss_Mappings_3
Offset_0x02A650:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x02A65A:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x02A664:
                dc.w    $0001
                dc.l    $F8050008, $0004FFF8
Offset_0x02A66E:
                dc.w    $0001
                dc.l    $F805000C, $0006FFF8
;===============================================================================
; Objeto 0x5D - Robotnik na Chemical Plant
; <<<- 
;===============================================================================