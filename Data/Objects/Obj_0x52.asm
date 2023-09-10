;===============================================================================
; Objeto 0x52 - Robotnik na Hill Top
; ->>>          
;===============================================================================  
Offset_0x02B280:
                moveq   #$00, D0
                move.b  Obj_Boss_Routine(A0), D0                         ; $000A
                move.w  Offset_0x02B28E(PC, D0), D1
                jmp     Offset_0x02B28E(PC, D1)    
;-------------------------------------------------------------------------------       
Offset_0x02B28E:
                dc.w    Offset_0x02B298-Offset_0x02B28E
                dc.w    Offset_0x02B326-Offset_0x02B28E
                dc.w    Offset_0x02B516-Offset_0x02B28E
                dc.w    Offset_0x02B58C-Offset_0x02B28E
                dc.w    Offset_0x02B7B6-Offset_0x02B28E  
;-------------------------------------------------------------------------------     
Offset_0x02B298:
                move.l  #HTz_Boss_Mappings, Obj_Map(A0) ; Offset_0x02B862, $0004
                move.w  #$03C1, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$90, $000E(A0)
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.w  #$3040, Obj_X(A0)                                ; $0008
                move.w  #$0580, Obj_Y(A0)                                ; $000C
                move.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                move.b  #$01, Obj_Boss_Ani_Map(A0)                       ; $000B
                addq.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
                bset    #$06, Obj_Flags(A0)                              ; $0001
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Boss_Hit_2(A0)                         ; $0032
                move.w  #$FF20, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.w  Obj_X(A0), (Boss_Move_Buffer).w              ; $FFFFF750; $0008
                move.w  Obj_Y(A0), (Boss_Move_Buffer+$04).w          ; $FFFFF754; $000C
                move.w  Obj_X(A0), HTz_Robotnik_Pos_X(A0)         ; $0008, $0010
                move.w  Obj_Y(A0), HTz_Robotnik_Pos_Y(A0)         ; $000C, $0012
                move.b  #$02, Obj_Ani_Boss_Frame(A0)                     ; $0015
                bsr     Offset_0x02B310
                rts
Offset_0x02B310:
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$06, (A2)+
                move.b  #$00, (A2)+
                move.b  #$10, (A2)+
                move.b  #$00, (A2)+
                rts     
;-------------------------------------------------------------------------------
Offset_0x02B326:
                moveq   #$00, D0
                move.b  Obj_Ani_Boss_Routine(A0), D0                     ; $0026
                move.w  Offset_0x02B334(PC, D0), D1
                jmp     Offset_0x02B334(PC, D1)  
;-------------------------------------------------------------------------------       
Offset_0x02B334:
                dc.w    Offset_0x02B33E-Offset_0x02B334
                dc.w    Offset_0x02B384-Offset_0x02B334
                dc.w    Offset_0x02B400-Offset_0x02B334
                dc.w    Offset_0x02B434-Offset_0x02B334
                dc.w    Offset_0x02B6CA-Offset_0x02B334    
;-------------------------------------------------------------------------------     
Offset_0x02B33E:
                move.b  #$00, ($FFFFF73F).w
                bsr     Boss_Move                              ; Offset_0x028E8C
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02B358
                cmpi.w  #$0518, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bgt.s   Offset_0x02B376
                bra.s   Offset_0x02B360
Offset_0x02B358:
                cmpi.w  #$04FC, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bgt.s   Offset_0x02B376
Offset_0x02B360:
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$3C, Obj_Control_Var_12(A0)                     ; $003E
Offset_0x02B376:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                bsr     Boss_Hit                               ; Offset_0x028E10
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4    
;-------------------------------------------------------------------------------
Offset_0x02B384:
                subi.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                bpl.s   Offset_0x02B3E6
                move.b  #$01, ($FFFFF73F).w
                move.b  #$01, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                cmpi.b  #$E8, Obj_Control_Var_12(A0)                     ; $003E
                bne.s   Offset_0x02B3E6
                bsr     Jmp_0A_To_SingleObjectLoad             ; Offset_0x02B9E0
                bne.s   Offset_0x02B3D0
                move.b  #$52, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Boss_Routine(A1)                       ; $000A
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                andi.b  #$01, Obj_Flags(A1)                              ; $0001
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$2F, Obj_Control_Var_12(A0)                     ; $003E
Offset_0x02B3D0:
                bsr     Boss_Hit                               ; Offset_0x028E10
                bsr     Offset_0x02B504
                lea     (HTz_Boss_Animate_Data), A1            ; Offset_0x02B82E
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
Offset_0x02B3E6:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$07, D1
                add.w   (Boss_Move_Buffer+$04).w, D1                 ; $FFFFF754
                move.w  D1, Obj_Y(A0)                                    ; $000C
                addq.b  #$04, Obj_Map_Id(A0)                             ; $001A
                bra.s   Offset_0x02B3D0        
;-------------------------------------------------------------------------------
Offset_0x02B400:
                move.b  #$00, ($FFFFF73F).w
                move.b  #$00, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                move.b  #$10, (Boss_Animate_Buffer+$02).w            ; $FFFFF742
                move.b  #$00, (Boss_Animate_Buffer+$03).w            ; $FFFFF743
                subi.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                bne     Offset_0x02B3E6
                move.w  #$00E0, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bsr     Offset_0x02B504
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4  
;-------------------------------------------------------------------------------
Offset_0x02B434:
                bsr     Boss_Move                              ; Offset_0x028E8C
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02B448
                cmpi.w  #$0538, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02B47E
                bra.s   Offset_0x02B450
Offset_0x02B448:
                cmpi.w  #$0548, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02B47E
Offset_0x02B450:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                bne.s   Offset_0x02B47E
                st      Obj_Control_Var_0C(A0)                           ; $0038
                bsr     Jmp_0A_To_SingleObjectLoad             ; Offset_0x02B9E0
                bne.s   Offset_0x02B47E
                move.b  #$52, (A1)
                move.b  #$06, Obj_Boss_Routine(A1)                       ; $000A
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$AE, D0
                bsr     Jmp_01_To_Play_Sfx                     ; Offset_0x02B9EC
Offset_0x02B47E:
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02B494
                cmpi.w  #$05A0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02B4F6
                move.w  #$05A0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bra.s   Offset_0x02B4A2
Offset_0x02B494:
                cmpi.w  #$0580, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02B4F6
                move.w  #$0580, (Boss_Move_Buffer+$04).w             ; $FFFFF754
Offset_0x02B4A2:
                move.w  #$FF20, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$00, Obj_Ani_Boss_Routine(A0)                   ; $0026
                sf      Obj_Control_Var_0C(A0)                           ; $0038
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                subi.w  #$2FC0, D0
                bmi.s   Offset_0x02B4CE
                move.w  #$0580, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.w  #$3040, Obj_X(A0)                                ; $0008
                st      Obj_Control_Var_00(A0)                           ; $002C
                bra.s   Offset_0x02B4DE
Offset_0x02B4CE:
                move.w  #$2F40, Obj_X(A0)                                ; $0008
                move.w  #$05A0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                sf      Obj_Control_Var_00(A0)                           ; $002C
Offset_0x02B4DE:
                move.w  Obj_X(A0), D0                                    ; $0008
                cmp.w   ($FFFFB008).w, D0
                bgt.s   Offset_0x02B4F0
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bra.s   Offset_0x02B4F6
Offset_0x02B4F0:
                bclr    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x02B4F6:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                bsr     Boss_Hit                               ; Offset_0x028E10
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
Offset_0x02B504:
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  Obj_Y(A0), D1                                    ; $000C
                move.w  D0, HTz_Robotnik_Pos_X(A0)                       ; $0010
                move.w  D1, HTz_Robotnik_Pos_Y(A0)                       ; $0012
                rts  
;-------------------------------------------------------------------------------
Offset_0x02B516:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02B524(PC, D0), D1
                jmp     Offset_0x02B524(PC, D1)       
;-------------------------------------------------------------------------------       
Offset_0x02B524:
                dc.w    Offset_0x02B528-Offset_0x02B524
                dc.w    Offset_0x02B576-Offset_0x02B524    
;-------------------------------------------------------------------------------     
Offset_0x02B528:
                move.l  #HTz_Boss_Mappings, Obj_Map(A0) ; Offset_0x02B862, $0004
                move.w  #$0421, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$05, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$98, Obj_Col_Flags(A0)                          ; $0020
                subi.w  #$001C, Obj_Y(A0)                                ; $000C
                move.w  #$FF90, D0
                move.w  #$FFFC, D1
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x02B56C
                neg.w   D0
                neg.w   D1
Offset_0x02B56C:
                add.w   D0, Obj_X(A0)                                    ; $0008
                move.w  D1, HTz_Robotnik_Pos_X(A0)                       ; $0010
                rts      
;-------------------------------------------------------------------------------
Offset_0x02B576:
                move.w  HTz_Robotnik_Pos_X(A0), D1                       ; $0010
                add.w   D1, Obj_X(A0)                                    ; $0008
                lea     (HTz_Boss_Animate_Data), A1            ; Offset_0x02B82E
                bsr     Jmp_13_To_AnimateSprite                ; Offset_0x02B9F2
                bra     Jmp_26_To_MarkObjGone                  ; Offset_0x02B9E6     
;-------------------------------------------------------------------------------
Offset_0x02B58C:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02B59A(PC, D0), D1
                jmp     Offset_0x02B59A(PC, D1)     
;-------------------------------------------------------------------------------        
Offset_0x02B59A:
                dc.w    Offset_0x02B59E-Offset_0x02B59A
                dc.w    Offset_0x02B62E-Offset_0x02B59A   
;-------------------------------------------------------------------------------     
Offset_0x02B59E:
                move.l  A0, A1
                moveq   #$00, D2
                moveq   #$01, D1
                bra.s   Offset_0x02B5BA        
;-------------------------------------------------------------------------------
Offset_0x02B5A6:
                bsr     Jmp_0A_To_SingleObjectLoad             ; Offset_0x02B9E0
                bne     Offset_0x02B62C
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
Offset_0x02B5BA:
                move.b  #$52, (A1)
                move.b  #$06, Obj_Boss_Routine(A1)                       ; $000A
                move.l  #HTz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02B862, $0004
                move.w  #$0421, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                addq.b  #$02, Obj_Routine_2(A1)                          ; $0025
                move.b  #$07, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$8B, Obj_Col_Flags(A1)                          ; $0020
                move.b  D2, Obj_Control_Var_02(A1)                       ; $002E
                move.b  #$08, Obj_Height_2(A1)                           ; $0016
                move.b  #$08, Obj_Width_2(A1)                            ; $0017
                move.w  Obj_X(A1), Obj_Timer(A1)                  ; $0008, $002A
                move.w  #$1C00, D0
                tst.w   D2
                bne.s   Offset_0x02B60E
                neg.w   D0
Offset_0x02B60E:
                move.w  D0, Obj_Speed(A1)                                ; $0010
                move.w  #$AC00, Obj_Speed_Y(A1)                          ; $0012
                cmpi.w  #$2F40, Obj_X(A1)                                ; $0008
                beq.s   Offset_0x02B626
                move.w  #$9C00, Obj_Speed_Y(A1)                          ; $0012
Offset_0x02B626:
                addq.w  #$01, D2
                dbra    D1, Offset_0x02B5A6
Offset_0x02B62C:
                rts      
;-------------------------------------------------------------------------------
Offset_0x02B62E:
                bsr     Offset_0x02B698
                bsr     Jmp_03_To_ObjHitFloor                  ; Offset_0x02B9F8
                tst.w   D1
                bpl.s   Offset_0x02B68A
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.b  #$20, (A0)
                move.b  #$0A, Obj_Routine(A0)                            ; $0024
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.l  #Fireball_Mappings, Obj_Map(A0) ; Offset_0x01DD04, $0004
                move.w  #$839E, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_38_To_ModifySpriteAttr_2P          ; Offset_0x02BA04
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0009, Obj_Boss_Hit_2(A0)                       ; $0032
                move.b  #$03, Obj_Control_Var_0A(A0)                     ; $0036
                move.b  #$B3, D0
                bsr     Jmp_01_To_Play_Sfx                     ; Offset_0x02B9EC
                bra     Offset_0x02B9FE
Offset_0x02B68A:
                lea     (HTz_Boss_Animate_Data), A1            ; Offset_0x02B82E
                bsr     Jmp_13_To_AnimateSprite                ; Offset_0x02B9F2
                bra     Jmp_26_To_MarkObjGone                  ; Offset_0x02B9E6
Offset_0x02B698:
                move.l  Obj_Timer(A0), D2                                ; $002A
                move.l  Obj_Y(A0), D3                                    ; $000C
                move.w  Obj_Speed(A0), D0                                ; $0010
                ext.l   D0
                asl.l   #$04, D0
                add.l   D0, D2
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                addi.w  #$0380, Obj_Speed_Y(A0)                          ; $0012
                ext.l   D0
                asl.l   #$04, D0
                add.l   D0, D3
                move.l  D2, Obj_Timer(A0)                                ; $002A
                move.l  D3, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Timer(A0), Obj_X(A0)                  ; $0008, $002A
                rts     
;-------------------------------------------------------------------------------
Offset_0x02B6CA:
                move.b  #$00, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bmi.s   Offset_0x02B706
                cmpi.w  #$001E, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bgt.s   Offset_0x02B6FE
                move.b  #$10, Obj_Boss_Ani_Map(A0)                       ; $000B
                bsr     Boss_Defeated                          ; Offset_0x028F7A
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
                bsr     Offset_0x02B75A
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
Offset_0x02B6FE:
                bsr     Boss_Defeated                          ; Offset_0x028F7A
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
Offset_0x02B706:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne     Offset_0x02B716
                bsr     Offset_0x02B75A
Offset_0x02B716:
                cmpi.w  #$FFC4, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bgt     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
                addq.w  #$02, Obj_Y(A0)                                  ; $000C
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02B738
                cmpi.w  #$0538, Obj_Y(A0)                                ; $000C
                bgt     Offset_0x02B746
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
Offset_0x02B738:
                cmpi.w  #$0548, Obj_Y(A0)                                ; $000C
                bgt     Offset_0x02B746
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
Offset_0x02B746:
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x02B756
                move.b  #$01, ($FFFFF7A7).w
                bra     Jmp_20_To_DeleteObject                 ; Offset_0x02B9DA
Offset_0x02B756:
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4
Offset_0x02B75A:
                bsr     Jmp_0A_To_SingleObjectLoad             ; Offset_0x02B9E0
                bne.s   Offset_0x02B7B4
                move.b  #$52, (A1)
                move.b  #$08, Obj_Boss_Routine(A1)                       ; $000A
                move.l  #HTz_Boss_Defeated_Smoke_Mappings, Obj_Map(A1) ; Offset_0x02B7FE, $0004
                move.w  #$05E4, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$01, Obj_Priority(A1)                           ; $0018
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_X(A0), Obj_Timer(A1)                  ; $0008, $002A
                subi.w  #$0028, Obj_Y(A1)                                ; $000C
                move.w  #$FFA0, Obj_Speed(A1)                            ; $0010
                move.w  #$FF40, Obj_Speed_Y(A1)                          ; $0012
                move.b  #$00, Obj_Map_Id(A1)                             ; $001A
                move.b  #$11, Obj_Ani_Time(A1)                           ; $001E
Offset_0x02B7B4:
                rts  
;-------------------------------------------------------------------------------
Offset_0x02B7B6:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x02B7D0
                move.b  #$11, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$04, Obj_Map_Id(A0)                             ; $001A
                beq     Jmp_20_To_DeleteObject                 ; Offset_0x02B9DA
Offset_0x02B7D0:
                move.l  Obj_Timer(A0), D2                                ; $002A
                move.l  Obj_Y(A0), D3                                    ; $000C
                move.w  Obj_Speed(A0), D0                                ; $0010
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, Obj_Timer(A0)                                ; $002A
                move.w  Obj_Timer(A0), Obj_X(A0)                  ; $0008, $002A
                move.l  D3, Obj_Y(A0)                                    ; $000C
                bra     Jmp_1D_To_DisplaySprite                ; Offset_0x02B9D4             
;-------------------------------------------------------------------------------
HTz_Boss_Defeated_Smoke_Mappings:                              ; Offset_0x02B7FE
                dc.w    Offset_0x02B806-HTz_Boss_Defeated_Smoke_Mappings
                dc.w    Offset_0x02B810-HTz_Boss_Defeated_Smoke_Mappings
                dc.w    Offset_0x02B81A-HTz_Boss_Defeated_Smoke_Mappings
                dc.w    Offset_0x02B824-HTz_Boss_Defeated_Smoke_Mappings
Offset_0x02B806:
                dc.w    $0001
                dc.l    $F8052000, $2000FFF8
Offset_0x02B810:
                dc.w    $0001
                dc.l    $F8052004, $2002FFF8
Offset_0x02B81A:
                dc.w    $0001
                dc.l    $F8052008, $2004FFF8
Offset_0x02B824:
                dc.w    $0001
                dc.l    $F805200C, $2006FFF8      
;-------------------------------------------------------------------------------
HTz_Boss_Animate_Data:                                         ; Offset_0x02B82E
                dc.w    Offset_0x02B83E-HTz_Boss_Animate_Data
                dc.w    Offset_0x02B843-HTz_Boss_Animate_Data
                dc.w    Offset_0x02B848-HTz_Boss_Animate_Data
                dc.w    Offset_0x02B84D-HTz_Boss_Animate_Data
                dc.w    Offset_0x02B852-HTz_Boss_Animate_Data
                dc.w    Offset_0x02B856-HTz_Boss_Animate_Data
                dc.w    Offset_0x02B85A-HTz_Boss_Animate_Data
                dc.w    Offset_0x02B85D-HTz_Boss_Animate_Data
Offset_0x02B83E:
                dc.b    $01, $02, $03, $FD, $01
Offset_0x02B843:
                dc.b    $02, $04, $05, $FD, $02
Offset_0x02B848:
                dc.b    $03, $06, $07, $FD, $03
Offset_0x02B84D:
                dc.b    $04, $08, $09, $FD, $04
Offset_0x02B852:
                dc.b    $05, $0A, $0B, $FE
Offset_0x02B856:
                dc.b    $03, $0C, $0D, $FF
Offset_0x02B85A:
                dc.b    $0F, $01, $FF
Offset_0x02B85D:
                dc.b    $03, $0E, $0F, $FF, $00           
;-------------------------------------------------------------------------------
HTz_Boss_Mappings:                                             ; Offset_0x02B862
                dc.w    HTz_Boss_Mappings-HTz_Boss_Mappings
                dc.w    Offset_0x02B884-HTz_Boss_Mappings
                dc.w    Offset_0x02B8C6-HTz_Boss_Mappings
                dc.w    Offset_0x02B8D0-HTz_Boss_Mappings
                dc.w    Offset_0x02B8DA-HTz_Boss_Mappings
                dc.w    Offset_0x02B8E4-HTz_Boss_Mappings
                dc.w    Offset_0x02B8F6-HTz_Boss_Mappings
                dc.w    Offset_0x02B908-HTz_Boss_Mappings
                dc.w    Offset_0x02B922-HTz_Boss_Mappings
                dc.w    Offset_0x02B93C-HTz_Boss_Mappings
                dc.w    Offset_0x02B956-HTz_Boss_Mappings
                dc.w    Offset_0x02B968-HTz_Boss_Mappings
                dc.w    Offset_0x02B972-HTz_Boss_Mappings
                dc.w    Offset_0x02B97C-HTz_Boss_Mappings
                dc.w    Offset_0x02B986-HTz_Boss_Mappings
                dc.w    Offset_0x02B990-HTz_Boss_Mappings
                dc.w    Offset_0x02B99A-HTz_Boss_Mappings
Offset_0x02B884:
                dc.w    $0008
                dc.l    $04052000, $2000FFE0
                dc.l    $14052004, $2002FFE0
                dc.l    $040F2008, $2004FFF0
                dc.l    $04072018, $200C0010
                dc.l    $F40D0060, $0030FFE0
                dc.l    $F40D0068, $00340000
                dc.l    $DC0A2070, $2038FFE8
                dc.l    $DC062079, $203C0000
Offset_0x02B8C6:
                dc.w    $0001
                dc.l    $DF040083, $0041FFD8
Offset_0x02B8D0:
                dc.w    $0001
                dc.l    $DF040085, $0042FFD8
Offset_0x02B8DA:
                dc.w    $0001
                dc.l    $DF080087, $0043FFD0
Offset_0x02B8E4:
                dc.w    $0002
                dc.l    $DF0C008A, $0045FFC0
                dc.l    $DF00008E, $0047FFE0
Offset_0x02B8F6:
                dc.w    $0002
                dc.l    $DF0C008F, $0047FFB0
                dc.l    $DF080093, $0049FFD0
Offset_0x02B908:
                dc.w    $0003
                dc.l    $DF0C0096, $004BFFA0
                dc.l    $DF0C009A, $004DFFC0
                dc.l    $DF00009E, $004FFFE0
Offset_0x02B922:
                dc.w    $0003
                dc.l    $DF0C009F, $004FFF90
                dc.l    $DF0C00A3, $0051FFB0
                dc.l    $DF0800A7, $0053FFD0
Offset_0x02B93C:
                dc.w    $0003
                dc.l    $DF0C00AA, $0055FF88
                dc.l    $DF0C00AE, $0057FFA8
                dc.l    $DF0800B2, $0059FFC8
Offset_0x02B956:
                dc.w    $0002
                dc.l    $DF0C00B5, $005AFF88
                dc.l    $DF0C00B9, $005CFFA8
Offset_0x02B968:
                dc.w    $0001
                dc.l    $DF0C00BD, $005EFF88
Offset_0x02B972:
                dc.w    $0001
                dc.l    $FC000061, $0030FFFC
Offset_0x02B97C:
                dc.w    $0001
                dc.l    $FC000062, $0031FFFC
Offset_0x02B986:
                dc.w    $0001
                dc.l    $F8050063, $0031FFF8
Offset_0x02B990:
                dc.w    $0001
                dc.l    $F8050067, $0033FFF8
Offset_0x02B99A:
                dc.w    $0007
                dc.l    $04052000, $2000FFE0
                dc.l    $14052004, $2002FFE0
                dc.l    $040F2008, $2004FFF0
                dc.l    $04072018, $200C0010
                dc.l    $F40D0060, $0030FFE0
                dc.l    $F40D0068, $00340000
                dc.l    $EC0C007F, $003FFFF0
;===============================================================================   
; Objeto 0x52 - Robotnik na Hill Top
; <<<-
;===============================================================================