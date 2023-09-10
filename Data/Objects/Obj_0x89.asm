;===============================================================================
; Objeto 0x89 - Robotnik na Neo Green Hill
; ->>>        
;===============================================================================     
; Offset_0x02BA0C:
                moveq   #$00, D0
                move.b  Obj_Boss_Routine(A0), D0                         ; $000A
                move.w  Offset_0x02BA1A(PC, D0), D1
                jmp     Offset_0x02BA1A(PC, D1)     
Offset_0x02BA1A:
                dc.w    Offset_0x02BA20-Offset_0x02BA1A
                dc.w    Offset_0x02BB9C-Offset_0x02BA1A
                dc.w    Offset_0x02BF06-Offset_0x02BA1A       
Offset_0x02BA20:
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                cmpi.w  #$2A60, D0
                blt     Offset_0x02BB70
                cmpi.w  #$2B60, D0
                bgt     Offset_0x02BB70
                cmpi.b  #$81, ($FFFFB06A).w
                beq.s   Offset_0x02BA50
                move.w  ($FFFFB048).w, D0
                cmpi.w  #$2A60, D0
                blt     Offset_0x02BB70
                cmpi.w  #$2B60, D0
                bgt     Offset_0x02BB70
Offset_0x02BA50:
                move.b  #$01, ($FFFFEEBD).w
                move.w  #$03E0, Obj_Art_VRAM(A0)                         ; $0002
                move.l  #NGHz_Boss_Ship_Mappings, Obj_Map(A0) ; Offset_0x02C35C, $0004
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$20, $000E(A0)
                move.b  #$02, Obj_Priority(A0)                           ; $0018
                move.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
                move.w  #$2AE0, Obj_X(A0)                                ; $0008
                move.w  #$0388, Obj_Y(A0)                                ; $000C
                move.w  #$2AE0, (Boss_Move_Buffer).w                 ; $FFFFF750
                move.w  #$0388, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bset    #$06, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Boss_Hit_2(A0)                         ; $0032
                move.b  #$08, Obj_Boss_Ani_Map(A0)                       ; $000B
                move.w  #$FC80, Obj_Control_Var_02(A0)                   ; $002E
                clr.b   ($FFFFF73F).w
                move.w  #$2AE0, NGHz_Robotnik_Pos_X(A0)                  ; $0010
                move.w  #$0488, NGHz_Robotnik_Pos_Y(A0)                  ; $0012
                move.b  #$00, Obj_Ani_Boss_Frame(A0)                     ; $0015
                move.w  #$2AE0, NGHz_Hammer_Pos_X(A0)                    ; $0016
                move.w  #$0488, NGHz_Hammer_Pos_Y(A0)                    ; $0018
                move.b  #$09, Obj_Ani_Frame(A0)                          ; $001B
                move.w  #$2AE0, NGHz_Ship_Boost_Pos_X(A0)                ; $001C
                move.w  #$0488, NGHz_Ship_Boost_Pos_Y(A0)                ; $001E
                move.b  #$06, Obj_Col_Prop(A0)                           ; $0021
                move.w  #$0100, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bsr     Jmp_0B_To_SingleObjectLoad             ; Offset_0x02C4B0
                bne     Offset_0x02BB70
                move.b  #$89, (A1)
                move.l  #NGHz_Boss_Arrows_Launcher_Mappings, Obj_Map(A1) ; Offset_0x02C2C6, $0004
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.w  #$03E0, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.w  #$2A50, Obj_X(A1)                                ; $0008
                move.w  #$0510, Obj_Y(A1)                                ; $000C
                addq.b  #$04, Obj_Boss_Routine(A1)                       ; $000A
                move.l  A0, Obj_Timer(A1)                                ; $002A
                move.b  #$00, Obj_Map_Id(A1)                             ; $001A
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.b  #$20, Obj_Height_2(A1)                           ; $0016
                move.l  A1, A2
                bsr     Jmp_13_To_SingleObjectLoad_2           ; Offset_0x02C4BC
                bne.s   Offset_0x02BB70
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x02BB58:
                move.l  $00(A2, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x02BB58
                bset    #$00, Obj_Flags(A1)                              ; $0001
                move.w  #$2B70, Obj_X(A1)                                ; $0008
Offset_0x02BB70:
                bsr     Offset_0x02BB76
                rts
Offset_0x02BB76:
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$04, (A2)+
                move.b  #$00, (A2)+
                move.b  #$00, (A2)+
                move.b  #$00, (A2)+
                move.b  #$02, (A2)+
                move.b  #$00, (A2)+
                move.b  #$01, (A2)+
                move.b  #$00, (A2)+
                rts
Offset_0x02BB9C:
                moveq   #$00, D0
                move.b  Obj_Ani_Boss_Routine(A0), D0                     ; $0026
                move.w  Offset_0x02BBAA(PC, D0), D1
                jmp     Offset_0x02BBAA(PC, D1)         
Offset_0x02BBAA:
                dc.w    Offset_0x02BBB8-Offset_0x02BBAA
                dc.w    Offset_0x02BBF6-Offset_0x02BBAA
                dc.w    Offset_0x02BC34-Offset_0x02BBAA
                dc.w    Offset_0x02BC82-Offset_0x02BBAA
                dc.w    Offset_0x02BDEC-Offset_0x02BBAA
                dc.w    Offset_0x02BE4E-Offset_0x02BBAA
                dc.w    Offset_0x02BEAE-Offset_0x02BBAA             
Offset_0x02BBB8:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02BCD8
                bsr     Offset_0x02BD84
                cmpi.w  #$0430, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02BBE8
                move.w  #$0430, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                addi.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.w  #$FF38, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                st      Obj_Control_Var_0C(A0)                           ; $0038
Offset_0x02BBE8:
                lea     (NGHz_Boss_Animate_Data), A1           ; Offset_0x02C326
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BBF6:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02BCD8
                bsr     Offset_0x02BD84
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                bne.s   Offset_0x02BC12
                cmpi.w  #$2B10, (Boss_Move_Buffer).w                 ; $FFFFF750
                blt.s   Offset_0x02BC26
                bra.s   Offset_0x02BC1A
Offset_0x02BC12:
                cmpi.w  #$2AB0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bgt.s   Offset_0x02BC26
Offset_0x02BC1A:
                addi.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
Offset_0x02BC26:
                lea     (NGHz_Boss_Animate_Data), A1           ; Offset_0x02C326
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BC34:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02BCD8
                bsr     Offset_0x02BD84
                cmpi.b  #$C0, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x02BC74
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                andi.b  #$F0, $0004(A1)     
                ori.b   #$03, $0004(A1)     
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                btst    #$00, Obj_Flags(A0)                              ; $0001
                sne     Obj_Control_Var_0C(A0)                           ; $0038
                move.w  #$001E, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.b  #$BD, D0
                bsr     Jmp_02_To_Play_Sfx                     ; Offset_0x02C4B6
Offset_0x02BC74:
                lea     (NGHz_Boss_Animate_Data), A1           ; Offset_0x02C326
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BC82:
                cmpi.w  #$0014, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bne.s   Offset_0x02BC96
                bset    #$00, Obj_Control_Var_12(A0)                     ; $003E
                move.b  #$01, ($FFFFF73F).w
Offset_0x02BC96:
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bpl.s   Offset_0x02BCBE
                clr.b   ($FFFFF73F).w
                move.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bchg    #00, Obj_Flags(A0)                               ; $0001
                beq.s   Offset_0x02BCB8
                move.w  #$FF38, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bra.s   Offset_0x02BCBE
Offset_0x02BCB8:
                move.w  #$00C8, (Boss_Move_Buffer+$08).w             ; $FFFFF758
Offset_0x02BCBE:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02BCD8
                bsr     Offset_0x02BD84
                lea     (NGHz_Boss_Animate_Data), A1           ; Offset_0x02C326
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BCD8:
                bsr     Offset_0x02BD0A
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x02BCEC
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x02BCF6
Offset_0x02BCEC:
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                move.b  #$31, $0003(A1)
Offset_0x02BCF6:
                cmpi.b  #$3F, Obj_Inertia(A0)                            ; $0014
                bne.s   Offset_0x02BD08
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                move.b  #$C0, $0003(A1)
Offset_0x02BD08:
                rts
Offset_0x02BD0A:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$06, D0
                add.w   (Boss_Move_Buffer+$04).w, D0                 ; $FFFFF754
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                addq.b  #$02, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$08, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bcc.s   Offset_0x02BD6E
                tst.b   Obj_Boss_Hit_2(A0)                               ; $0032
                beq.s   Offset_0x02BD70
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                bne.s   Offset_0x02BD6E
                tst.b   Obj_Inertia(A0)                                  ; $0014
                bne.s   Offset_0x02BD52
                move.b  #$40, Obj_Inertia(A0)                            ; $0014
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x02BD52:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x02BD60
                move.w  #$0EEE, D0
Offset_0x02BD60:
                move.w  D0, (A1)
                subq.b  #$01, Obj_Inertia(A0)                            ; $0014
                bne.s   Offset_0x02BD6E
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
Offset_0x02BD6E:
                rts
Offset_0x02BD70:
                moveq   #$64, D0
                bsr     Jmp_03_To_AddPoints                    ; Offset_0x02C4CE
                move.w  #$00B3, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.b  #$08, Obj_Ani_Boss_Routine(A0)                   ; $0026
                rts
Offset_0x02BD84:
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  Obj_Y(A0), D1                                    ; $000C
                move.w  D0, NGHz_Robotnik_Pos_X(A0)                      ; $0010
                move.w  D1, NGHz_Robotnik_Pos_Y(A0)                      ; $0012
                move.w  D0, NGHz_Ship_Boost_Pos_X(A0)                    ; $001C
                move.w  D1, NGHz_Ship_Boost_Pos_Y(A0)                    ; $001E
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02BDB0
                move.w  D0, NGHz_Hammer_Pos_X(A0)                        ; $0016
                move.w  D1, NGHz_Hammer_Pos_Y(A0)                        ; $0018
                move.w  D1, Obj_Control_Var_0E(A0)                       ; $003A
                rts
Offset_0x02BDB0:
                cmpi.w  #$0078, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bgt.s   Offset_0x02BDEA
                subi.w  #$0001, NGHz_Hammer_Pos_X(A0)                    ; $0016
                move.l  Obj_Control_Var_0E(A0), D0                       ; $003A
                move.w  Obj_Control_Var_02(A0), D1                       ; $002E
                addi.w  #$0038, Obj_Control_Var_02(A0)                   ; $002E
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, Obj_Control_Var_0E(A0)                       ; $003A
                move.w  Obj_Control_Var_0E(A0), NGHz_Hammer_Pos_Y(A0) ; $003A, $0018
                cmpi.w  #$0540, NGHz_Hammer_Pos_Y(A0)                    ; $0018
                blt.s   Offset_0x02BDEA
                move.w  #$0000, Obj_Control_Var_02(A0)                   ; $002E
Offset_0x02BDEA:
                rts
Offset_0x02BDEC:
                st      Obj_Control_Var_00(A0)                           ; $002C
                subq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
                bmi.s   Offset_0x02BE02
                bsr     Boss_Defeated                          ; Offset_0x028F7A
                move.b  #$05, Obj_Ani_Boss_Frame(A0)                     ; $0015
                bra.s   Offset_0x02BE30
Offset_0x02BE02:
                move.b  #$03, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$01, $0004(A2)
                move.b  #$00, $0005(A2)
                bset    #$00, Obj_Flags(A0)                              ; $0001
                clr.w   (Boss_Move_Buffer+$08).w                     ; $FFFFF758
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$FFEE, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
Offset_0x02BE30:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                lea     (NGHz_Boss_Animate_Data), A1           ; Offset_0x02C326
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02BD84
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BE4E:
                addq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
                beq.s   Offset_0x02BE5E
                bpl.s   Offset_0x02BE64
                addi.w  #$0018, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bra.s   Offset_0x02BE88
Offset_0x02BE5E:
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
                bra.s   Offset_0x02BE88
Offset_0x02BE64:
                cmpi.w  #$0018, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bcs.s   Offset_0x02BE7C
                beq.s   Offset_0x02BE84
                cmpi.w  #$0020, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bcs.s   Offset_0x02BE88
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bra.s   Offset_0x02BE88
Offset_0x02BE7C:
                subi.w  #$0008, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bra.s   Offset_0x02BE88
Offset_0x02BE84:
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
Offset_0x02BE88:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02BD0A
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                lea     (NGHz_Boss_Animate_Data), A1           ; Offset_0x02C326
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02BD84
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BEAE:
                move.w  #$0400, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.w  #$FFC0, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                cmpi.w  #$2D00, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                bcc.s   Offset_0x02BEC8
                addq.w  #$02, (Sonic_Level_Limits_Max_X).w           ; $FFFFEECA
                bra.s   Offset_0x02BECE
Offset_0x02BEC8:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x02BEF4
Offset_0x02BECE:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02BD0A
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                lea     (NGHz_Boss_Animate_Data), A1           ; Offset_0x02C326
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02BD84
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BEF4:
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x02BF00
                move.b  #$01, ($FFFFF7A7).w
Offset_0x02BF00:
                jmp     (DeleteObject)                         ; Offset_0x0120D0
Offset_0x02BF06:
                moveq   #$00, D0
                move.l  Obj_Timer(A0), A1                                ; $002A
                cmpi.b  #$08, Obj_Ani_Boss_Routine(A1)                   ; $0026
                blt.s   Offset_0x02BF1A
                move.b  #$04, Obj_Routine_2(A0)                          ; $0025
Offset_0x02BF1A:
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02BF26(PC, D0), D1
                jmp     Offset_0x02BF26(PC, D1)            
Offset_0x02BF26:
                dc.w    Offset_0x02BF30-Offset_0x02BF26
                dc.w    Offset_0x02BF62-Offset_0x02BF26
                dc.w    Offset_0x02C0A8-Offset_0x02BF26
                dc.w    Offset_0x02C0FC-Offset_0x02BF26
                dc.w    Offset_0x02C0CA-Offset_0x02BF26       
Offset_0x02BF30:
                bsr     Offset_0x02C0D8
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x02BF46
                move.w  #$00E1, D0
                bsr     Jmp_02_To_Play_Sfx                     ; Offset_0x02C4B6
Offset_0x02BF46:
                subi.w  #$0001, Obj_Y(A0)                                ; $000C
                cmpi.w  #$0488, Obj_Y(A0)                                ; $000C
                bgt.s   Offset_0x02BF5E
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$00, ($FFFFEEBD).w
Offset_0x02BF5E:
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BF62:
                bsr     Offset_0x02C0D8
                move.l  Obj_Timer(A0), A3                                ; $002A
                btst    #$00, Obj_Control_Var_12(A3)                     ; $003E
                beq.s   Offset_0x02BF98
                tst.b   Obj_Control_Var_0C(A3)                           ; $0038
                beq.s   Offset_0x02BF82
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x02BF98
                bra.s   Offset_0x02BF8A
Offset_0x02BF82:
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x02BF98
Offset_0x02BF8A:
                bclr    #$00, Obj_Control_Var_12(A3)                     ; $003E
                bsr     Offset_0x02C012
                st      Obj_Control_Var_0C(A0)                           ; $0038
Offset_0x02BF98:
                bsr     Offset_0x02BFA0
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02BFA0:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x02C00C
                tst.w   Obj_Control_Var_04(A0)                           ; $0030
                bgt.s   Offset_0x02BFB2
                move.w  #$001F, Obj_Control_Var_04(A0)                   ; $0030
Offset_0x02BFB2:
                subi.w  #$0001, Obj_Control_Var_04(A0)                   ; $0030
                bgt.s   Offset_0x02BFE0
                sf      Obj_Control_Var_0C(A0)                           ; $0038
                move.w  #$0000, Obj_Control_Var_04(A0)                   ; $0030
                tst.b   Obj_Control_Var_0C(A3)                           ; $0038
                bne.s   Offset_0x02BFD2
                move.w  #$2A50, Obj_X(A0)                                ; $0008
                bra.s   Offset_0x02BFD8
Offset_0x02BFD2:
                move.w  #$2B70, Obj_X(A0)                                ; $0008
Offset_0x02BFD8:
                move.w  #$0488, Obj_Y(A0)                                ; $000C
                bra.s   Offset_0x02C00C
Offset_0x02BFE0:
                move.w  #$2A50, D1
                tst.b   Obj_Control_Var_0C(A3)                           ; $0038
                beq.s   Offset_0x02BFEE
                move.w  #$2B70, D1
Offset_0x02BFEE:
                move.b  ($FFFFFE0F).w, D0
                andi.w  #$0001, D0
                add.w   D0, D0
                add.w   Offset_0x02C00E(PC, D0), D1
                move.w  D1, Obj_X(A0)                                    ; $0008
                move.w  #$0488, D1
                add.w   Offset_0x02C00E(PC, D0), D1
                move.w  D1, Obj_Y(A0)                                    ; $000C
Offset_0x02C00C:
                rts
;-------------------------------------------------------------------------------
Offset_0x02C00E:
                dc.w    $0001, $FFFF       
;-------------------------------------------------------------------------------  
Offset_0x02C012:
                bsr     Jmp_0B_To_SingleObjectLoad             ; Offset_0x02C4B0
                bne     Offset_0x02C09E
                move.b  #$89, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Boss_Routine(A1)                       ; $000A
                move.b  #$08, Obj_Routine_2(A1)                          ; $0025
                move.l  #NGHz_Boss_Arrows_Launcher_Mappings, Obj_Map(A1) ; Offset_0x02C2C6, $0004
                move.w  #$03E0, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                moveq   #$00, D6
                move.b  #$02, Obj_Map_Id(A1)                             ; $001A
                move.w  #$2A6A, Obj_X(A1)                                ; $0008
                tst.b   Obj_Control_Var_0C(A3)                           ; $0038
                beq.s   Offset_0x02C062
                st      D6
                move.w  #$2B56, Obj_X(A1)                                ; $0008
                bset    #$00, Obj_Flags(A1)                              ; $0001
Offset_0x02C062:
                move.w  #$0028, Obj_Control_Var_04(A1)                   ; $0030
                bsr     Jmp_02_To_PseudoRandomNumber           ; Offset_0x02C4C8
                andi.w  #$0003, D0
                add.w   D0, D0
                move.w  Arrows_Target(PC, D0), Obj_Y(A1) ; Offset_0x02C0A0, $000C
                move.l  A1, A2
                bsr     Jmp_0B_To_SingleObjectLoad             ; Offset_0x02C4B0
                bne.s   Offset_0x02C09E
                move.b  #$89, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Boss_Routine(A1)                       ; $000A
                move.b  #$06, Obj_Routine_2(A1)                          ; $0025
                move.l  A2, Obj_Control_Var_08(A1)                       ; $0034
                move.b  D6, Obj_Subtype(A1)                              ; $0028
                move.l  A3, Obj_Control_Var_0C(A1)                       ; $0038
Offset_0x02C09E:
                rts
;-------------------------------------------------------------------------------
Arrows_Target:                                                 ; Offset_0x02C0A0
                dc.w    $0458, $0478, $0498, $04B8    
;-------------------------------------------------------------------------------     
Offset_0x02C0A8:
                move.b  #$01, ($FFFFEEBD).w
                addi.w  #$0001, Obj_Y(A0)                                ; $000C
                cmpi.w  #$0510, Obj_Y(A0)                                ; $000C
                blt.s   Offset_0x02C0C6
                move.b  #$00, ($FFFFEEBD).w
                bra     Jmp_21_To_DeleteObject                 ; Offset_0x02C4AA
Offset_0x02C0C6:
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02C0CA:
                subi.w  #$0001, Obj_Control_Var_04(A0)                   ; $0030
                beq     Jmp_21_To_DeleteObject                 ; Offset_0x02C4AA
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02C0D8:
                move.w  #$0023, D1
                move.w  #$0044, D2
                move.w  #$0045, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                move.w  Obj_Y(A0), -(A7)                                 ; $000C
                addi.w  #$0004, Obj_Y(A0)                                ; $000C
                bsr     Jmp_18_To_SolidObject                  ; Offset_0x02C4DA
                move.w  (A7)+, Obj_Y(A0)                                 ; $000C
                rts
Offset_0x02C0FC:
                moveq   #$00, D0
                move.l  Obj_Control_Var_0C(A0), A1                       ; $0038
                cmpi.b  #$08, Obj_Ani_Boss_Routine(A1)                   ; $0026
                blt.s   Offset_0x02C110
                move.b  #$06, Obj_Boss_Routine_2(A0)                     ; $002A
Offset_0x02C110:
                move.b  Obj_Boss_Routine_2(A0), D0                       ; $002A
                move.w  Offset_0x02C11C(PC, D0), D1
                jmp     Offset_0x02C11C(PC, D1)        
Offset_0x02C11C:
                dc.w    Offset_0x02C126-Offset_0x02C11C
                dc.w    Offset_0x02C194-Offset_0x02C11C
                dc.w    Offset_0x02C1E4-Offset_0x02C11C
                dc.w    Offset_0x02C20A-Offset_0x02C11C
                dc.w    Offset_0x02C226-Offset_0x02C11C   
Offset_0x02C126:
                move.l  #NGHz_Boss_Arrows_Launcher_Mappings, Obj_Map(A0) ; Offset_0x02C2C6, $0004
                move.w  #$03E0, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$90, $000E(A0)
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                addq.b  #$02, Obj_Boss_Routine_2(A0)                     ; $002A
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.w  #$0004, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                addi.w  #$0009, Obj_Y(A0)                                ; $000C
                tst.b   Obj_Subtype(A0)                                  ; $0028
                beq.s   Offset_0x02C186
                bset    #$00, Obj_Status(A0)                             ; $0022
                bset    #$00, Obj_Flags(A0)                              ; $0001
                move.w  #$FFFD, Obj_Speed(A0)                            ; $0010
                bra.s   Offset_0x02C18C
Offset_0x02C186:
                move.w  #$0003, Obj_Speed(A0)                            ; $0010
Offset_0x02C18C:
                move.b  #$AC, Obj_Col_Flags(A0)                          ; $0020
                rts
Offset_0x02C194:
                btst    #$07, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02C1A2
                move.b  #$08, Obj_Boss_Routine_2(A0)                     ; $002A
Offset_0x02C1A2:
                move.w  Obj_X(A0), D0                                    ; $0008
                add.w   Obj_Speed(A0), D0                                ; $0010
                tst.w   Obj_Speed(A0)                                    ; $0010
                bpl.s   Offset_0x02C1BC
                cmpi.w  #$2A77, D0
                bgt.s   Offset_0x02C1DC
                move.w  #$2A77, D0
                bra.s   Offset_0x02C1C6
Offset_0x02C1BC:
                cmpi.w  #$2B49, D0
                blt.s   Offset_0x02C1DC
                move.w  #$2B49, D0
Offset_0x02C1C6:
                addi.b  #$02, Obj_Boss_Routine_2(A0)                     ; $002A
                move.w  D0, Obj_X(A0)                                    ; $0008
                move.b  #$DD, D0
                bsr     Jmp_02_To_Play_Sfx                     ; Offset_0x02C4B6
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02C1DC:
                move.w  D0, Obj_X(A0)                                    ; $0008
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02C1E4:
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                btst    #$07, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02C1F8
                addi.b  #$02, Obj_Boss_Routine_2(A0)                     ; $002A
Offset_0x02C1F8:
                bsr     Offset_0x02C22A
                lea     (Pillars_Animate_Data), A1             ; Offset_0x02C28A
                bsr     Jmp_14_To_AnimateSprite                ; Offset_0x02C4C2
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02C20A:
                bsr     Offset_0x02C262
                move.w  Obj_Y(A0), D0                                    ; $000C
                add.w   NGHz_Robotnik_Pos_Y(A0), D0                      ; $0012
                cmpi.w  #$04F0, D0
                bgt     Jmp_21_To_DeleteObject                 ; Offset_0x02C4AA
                move.w  D0, Obj_Y(A0)                                    ; $000C
                bra     Jmp_1E_To_DisplaySprite                ; Offset_0x02C4A4
Offset_0x02C226:
                bra     Jmp_21_To_DeleteObject                 ; Offset_0x02C4AA
Offset_0x02C22A:
                tst.w   Obj_Control_Var_04(A0)                           ; $0030
                bne.s   Offset_0x02C252
                move.w  #$001B, D1
                move.w  #$0001, D2
                move.w  #$0002, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_03_To_Platform_Object              ; Offset_0x02C4D4
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02C260
                move.w  #$001F, Obj_Control_Var_04(A0)                   ; $0030
Offset_0x02C252:
                subi.w  #$0001, Obj_Control_Var_04(A0)                   ; $0030
                bne.s   Offset_0x02C260
                move.b  #$06, Obj_Boss_Routine_2(A0)                     ; $002A
Offset_0x02C260:
                rts
Offset_0x02C262:
                bclr    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02C270
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x02C27C
Offset_0x02C270:
                bclr    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02C288
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x02C27C:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
Offset_0x02C288:
                rts   
;-------------------------------------------------------------------------------
Pillars_Animate_Data:                                          ; Offset_0x02C28A
                dc.w    Offset_0x02C28E-Pillars_Animate_Data
                dc.w    Offset_0x02C2A5-Pillars_Animate_Data
Offset_0x02C28E:
                dc.b    $01, $04, $06, $05, $04, $06, $04, $05
                dc.b    $04, $06, $04, $04, $06, $05, $04, $06
                dc.b    $04, $05, $04, $06, $04, $FD, $01
Offset_0x02C2A5:
                dc.b    $0F, $04, $04, $04, $04, $04, $04, $04
                dc.b    $04, $04, $04, $04, $04, $04, $04, $04
                dc.b    $04, $04, $04, $04, $04, $04, $04, $04
                dc.b    $04, $04, $04, $04, $04, $04, $04, $F9
                dc.b    $00     
;-------------------------------------------------------------------------------
NGHz_Boss_Arrows_Launcher_Mappings:                            ; Offset_0x02C2C6
                dc.w    Offset_0x02C2D4-NGHz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x02C2FE-NGHz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x02C2FE-NGHz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x02C308-NGHz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x02C308-NGHz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x02C312-NGHz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x02C31C-NGHz_Boss_Arrows_Launcher_Mappings
Offset_0x02C2D4:
                dc.w    $0005
                dc.l    $280F208B, $20450000
                dc.l    $080F208B, $20450000
                dc.l    $E80F208B, $20450000
                dc.l    $C80F208B, $20450000
                dc.l    $C00C2087, $20430000
Offset_0x02C2FE:
                dc.w    $0001
                dc.l    $FC04209B, $204DFFF8
Offset_0x02C308:
                dc.w    $0001
                dc.l    $FC0C209D, $204EFFF0
Offset_0x02C312:
                dc.w    $0001
                dc.l    $FC0C20A1, $2050FFF0
Offset_0x02C31C:
                dc.w    $0001
                dc.l    $FC0C20A5, $2052FFF0    
;-------------------------------------------------------------------------------
NGHz_Boss_Animate_Data:                                        ; Offset_0x02C326
                dc.w    NGHz_Robotnik_Faces-NGHz_Boss_Animate_Data ; Offset_0x02C330
                dc.w    NGHz_Ship_Boost-NGHz_Boss_Animate_Data     ; Offset_0x02C346
                dc.w    NGHz_Hammer_Start-NGHz_Boss_Animate_Data   ; Offset_0x02C34A
                dc.w    NGHz_Hammer_Usage-NGHz_Boss_Animate_Data   ; Offset_0x02C34D
                dc.w    NGHz_Hammer_Fall-NGHz_Boss_Animate_Data    ; Offset_0x02C359
NGHz_Robotnik_Faces:                                           ; Offset_0x02C330
                dc.b    $07, $00, $01, $FF, $02, $03, $02, $03
                dc.b    $02, $03, $02, $03, $FF, $04, $04, $04
                dc.b    $04, $04, $04, $04, $04, $FF
NGHz_Ship_Boost:                                               ; Offset_0x02C346
                dc.b    $01, $06, $07, $FF
NGHz_Hammer_Start:                                             ; Offset_0x02C34A
                dc.b    $0F, $09, $FF
NGHz_Hammer_Usage:                                             ; Offset_0x02C34D
                dc.b    $02, $0A, $0A, $0B, $0B, $0B, $0B, $0B
                dc.b    $0A, $0A, $FD, $02
NGHz_Hammer_Fall:                                              ; Offset_0x02C359
                dc.b    $0F, $08, $FF     
;-------------------------------------------------------------------------------
NGHz_Boss_Ship_Mappings:                                       ; Offset_0x02C35C
                dc.w    Offset_0x02C374-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C386-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C398-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C3AA-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C3BC-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C3CE-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C3E0-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C3F2-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C404-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C436-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C460-NGHz_Boss_Ship_Mappings
                dc.w    Offset_0x02C48A-NGHz_Boss_Ship_Mappings
Offset_0x02C374:
                dc.w    $0002
                dc.l    $E80D0150, $00A8FFE8
                dc.l    $E8050148, $00A4FFD8
Offset_0x02C386:
                dc.w    $0002
                dc.l    $E80D0158, $00ACFFE8
                dc.l    $E8050148, $00A4FFD8
Offset_0x02C398:
                dc.w    $0002
                dc.l    $E80D0160, $00B0FFE8
                dc.l    $E805014C, $00A6FFD8
Offset_0x02C3AA:
                dc.w    $0002
                dc.l    $E80D0168, $00B4FFE8
                dc.l    $E805014C, $00A6FFD8
Offset_0x02C3BC:
                dc.w    $0002
                dc.l    $E80D0170, $00B8FFE8
                dc.l    $E805014C, $00A6FFD8
Offset_0x02C3CE:
                dc.w    $0002
                dc.l    $E80D0178, $00BCFFE8
                dc.l    $E805014C, $00A6FFD8
Offset_0x02C3E0:
                dc.w    $0002
                dc.l    $18050081, $0040FFE8
                dc.l    $18050081, $00400008
Offset_0x02C3F2:
                dc.w    $0002
                dc.l    $18040085, $0042FFE8
                dc.l    $18040085, $00420008
Offset_0x02C404:
                dc.w    $0006
                dc.l    $D8050140, $00A0FFFA
                dc.l    $E8050144, $00A20008
                dc.l    $F80A2070, $2038FFD0
                dc.l    $F80F2128, $2094FFE8
                dc.l    $F8072079, $203CFFE8
                dc.l    $F8072079, $203C0008
Offset_0x02C436:
                dc.w    $0005
                dc.l    $EA0F2000, $2000FF9C
                dc.l    $D20A2010, $2008FFA4
                dc.l    $D20B2019, $200CFFBC
                dc.l    $F2052025, $2012FFBC
                dc.l    $F8052064, $2032FFC0
Offset_0x02C460:
                dc.w    $0005
                dc.l    $F10F2029, $2014FF9D
                dc.l    $D90E2039, $201CFFA5
                dc.l    $E1022045, $2022FFC5
                dc.l    $F1032048, $2024FFBD
                dc.l    $F8052068, $2034FFC0
Offset_0x02C48A:
                dc.w    $0003
                dc.l    $EC0F204C, $2026FFA0
                dc.l    $0C0D205C, $202EFFA0
                dc.l    $F805206C, $2036FFC0            
;-------------------------------------------------------------------------------     
;===============================================================================   
; Objeto 0x89 - Robotnik na Neo Green Hill
; <<<-        
;===============================================================================