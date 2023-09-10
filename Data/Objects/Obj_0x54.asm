;===============================================================================
; Objeto 0x54 - Robotnik na Metropolis
; ->>>          Rotinas adicionais deste objeto no objeto 0x53 ( obj_0x53.asm )
;===============================================================================  
; Offset_0x02D73C:
                moveq   #$00, D0
                move.b  Obj_Boss_Routine(A0), D0                         ; $000A
                move.w  Offset_0x02D74A(PC, D0), D1
                jmp     Offset_0x02D74A(PC, D1)   
;-------------------------------------------------------------------------------    
Offset_0x02D74A:
                dc.w    Offset_0x02D752-Offset_0x02D74A
                dc.w    Offset_0x02D86E-Offset_0x02D74A
                dc.w    Mz_Boss_Sub_02-Offset_0x02D74A         ; Offset_0x02E124
                dc.w    Mz_Boss_Sub_03-Offset_0x02D74A         ; Offset_0x02E1BE
;-------------------------------------------------------------------------------     
Offset_0x02D752:
                move.l  #Mz_Boss_Mappings, Obj_Map(A0)  ; Offset_0x02E23C, $0004
                move.w  #$037C, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.w  #$2B50, Obj_X(A0)                                ; $0008
                move.w  #$0380, Obj_Y(A0)                                ; $000C
                move.b  #$02, Obj_Boss_Ani_Map(A0)                       ; $000B
                addq.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
                bset    #$06, Obj_Flags(A0)                              ; $0001
                move.b  #$02, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Boss_Hit_2(A0)                         ; $0032
                move.b  #$07, Obj_Control_Var_12(A0)                     ; $003E
                move.w  Obj_X(A0), (Boss_Move_Buffer).w              ; $FFFFF750; $0008
                move.w  Obj_Y(A0), (Boss_Move_Buffer+$04).w          ; $FFFFF754; $000C
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.w  #$0100, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$20, $000E(A0)
                clr.b   Obj_Player_Status(A0)                            ; $002B
                clr.b   Obj_Control_Var_00(A0)                           ; $002C
                move.b  #$40, Obj_Map_Id(A0)                             ; $001A
                move.b  #$27, Obj_Control_Var_07(A0)                     ; $0033
                move.b  #$27, Obj_Control_Var_0D(A0)                     ; $0039
                move.w  Obj_X(A0), Mz_Robotnik_Pos_X(A0)          ; $0008, $0010
                move.w  Obj_Y(A0), Mz_Robotnik_Pos_Y(A0)          ; $000C, $0012
                move.b  #$0C, Obj_Ani_Boss_Frame(A0)                     ; $0015
                move.w  Obj_X(A0), Mz_Ship_Boost_Pos_X(A0)        ; $0008, $0016
                move.w  Obj_Y(A0), Mz_Ship_Boost_Pos_Y(A0)        ; $000C, $0018
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
                bsr     Jmp_0E_To_SingleObjectLoad             ; Offset_0x02E3CC
                bne.s   Offset_0x02D850
                move.b  #$54, (A1)
                move.b  #$06, Obj_Boss_Routine(A1)                       ; $000A
                move.b  #$13, Obj_Map_Id(A1)                             ; $001A
                move.l  #Mz_Boss_Mappings, Obj_Map(A1)  ; Offset_0x02E23C, $0004
                move.w  #$037C, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$06, Obj_Priority(A1)                           ; $0018
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.b  #$20, Obj_Width(A1)                              ; $0019
                bsr     Jmp_0E_To_SingleObjectLoad             ; Offset_0x02E3CC
                bne.s   Offset_0x02D850
                move.b  #$53, (A1)
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
Offset_0x02D850:
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$10, (A2)+
                move.b  #$00, (A2)+
                move.b  #$03, (A2)+
                move.b  #$00, (A2)+
                move.b  #$01, (A2)+
                move.b  #$00, (A2)+
                rts
Offset_0x02D86E:
                moveq   #$00, D0
                move.b  Obj_Ani_Boss_Routine(A0), D0                     ; $0026
                move.w  Offset_0x02D87C(PC, D0), D1
                jmp     Offset_0x02D87C(PC, D1)   
;-------------------------------------------------------------------------------     
Offset_0x02D87C:
                dc.w    Offset_0x02D890-Offset_0x02D87C
                dc.w    Offset_0x02D90A-Offset_0x02D87C
                dc.w    Offset_0x02D990-Offset_0x02D87C
                dc.w    Offset_0x02D9D8-Offset_0x02D87C
                dc.w    Offset_0x02D9F8-Offset_0x02D87C
                dc.w    Offset_0x02DA28-Offset_0x02D87C
                dc.w    Offset_0x02DA72-Offset_0x02D87C
                dc.w    Offset_0x02DAE2-Offset_0x02D87C
                dc.w    Offset_0x02DCB6-Offset_0x02D87C
                dc.w    Offset_0x02DD0C-Offset_0x02D87C  
;-------------------------------------------------------------------------------      
Offset_0x02D890:
                bsr     Boss_Move                              ; Offset_0x028E8C
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                cmpi.w  #$04A0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcs.s   Offset_0x02D8DA
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.w  #$FF00, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bclr    #$07, Obj_Player_Status(A0)                      ; $002B
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                cmp.w   ($FFFFF750).w, D0
                bcs.s   Offset_0x02D8DA
                move.w  #$0100, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bset    #$07, Obj_Player_Status(A0)                      ; $002B
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x02D8DA:
                bsr     Offset_0x02DC42
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x02E1F0
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02DC28
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0     
;-------------------------------------------------------------------------------
Offset_0x02D8F0:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$06, D0
                add.w   ($FFFFF754).w, D0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                addq.b  #$04, Obj_Map_Id(A0)                             ; $001A
                rts    
;-------------------------------------------------------------------------------
Offset_0x02D90A:
                bsr     Boss_Move                              ; Offset_0x028E8C
                btst    #$07, Obj_Player_Status(A0)                      ; $002B
                bne.s   Offset_0x02D944
                cmpi.w  #$2AD0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bcc.s   Offset_0x02D970
                bchg    #07, Obj_Player_Status(A0)                       ; $002B
                move.w  #$0100, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bset    #$06, Obj_Player_Status(A0)                      ; $002B
                beq.s   Offset_0x02D970
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$FF00, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bra.s   Offset_0x02D970
Offset_0x02D944:
                cmpi.w  #$2BD0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bcs.s   Offset_0x02D970
                bchg    #07, Obj_Player_Status(A0)                       ; $002B
                move.w  #$FF00, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                bset    #$06, Obj_Player_Status(A0)                      ; $002B
                beq.s   Offset_0x02D970
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$FF00, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
Offset_0x02D970:
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                bsr     Offset_0x02D8F0
Offset_0x02D97A:
                bsr     Offset_0x02DC42
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x02E1F0
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02DC28
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0   
;-------------------------------------------------------------------------------
Offset_0x02D990:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$0470, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc.s   Offset_0x02D9A2
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
Offset_0x02D9A2:
                btst    #$07, Obj_Player_Status(A0)                      ; $002B
                bne.s   Offset_0x02D9BA
                cmpi.w  #$2B50, (Boss_Move_Buffer).w                 ; $FFFFF750
                bcc.s   Offset_0x02D9C8
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bra.s   Offset_0x02D9C8
Offset_0x02D9BA:
                cmpi.w  #$2B50, (Boss_Move_Buffer).w                 ; $FFFFF750
                bcs.s   Offset_0x02D9C8
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
Offset_0x02D9C8:
                move.w  (Boss_Move_Buffer+$08).w, D0                 ; $FFFFF758
                or.w    (Boss_Move_Buffer+$0A).w, D0                 ; $FFFFF75A
                bne.s   Offset_0x02D9D6
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
Offset_0x02D9D6:
                bra.s   Offset_0x02D970     
;-------------------------------------------------------------------------------
Offset_0x02D9D8:
                cmpi.b  #$68, Obj_Control_Var_07(A0)                     ; $0033
                bcc.s   Offset_0x02D9EA
                addq.b  #$01, Obj_Control_Var_07(A0)                     ; $0033
                addq.b  #$01, Obj_Control_Var_0D(A0)                     ; $0039
                bra.s   Offset_0x02D9F4
Offset_0x02D9EA:
                subq.b  #$01, Obj_Control_Var_0D(A0)                     ; $0039
                bne.s   Offset_0x02D9F4
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
Offset_0x02D9F4:
                bra     Offset_0x02D970   
;-------------------------------------------------------------------------------
Offset_0x02D9F8:
                cmpi.b  #$27, Obj_Control_Var_07(A0)                     ; $0033
                bcs.s   Offset_0x02DA06
                subq.b  #$01, Obj_Control_Var_07(A0)                     ; $0033
                bra.s   Offset_0x02DA24
Offset_0x02DA06:
                addq.b  #$01, Obj_Control_Var_0D(A0)                     ; $0039
                cmpi.b  #$27, Obj_Control_Var_0D(A0)                     ; $0039
                bcs.s   Offset_0x02DA24
                move.w  #$0100, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$00, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bclr    #$06, Obj_Player_Status(A0)                      ; $002B
Offset_0x02DA24:
                bra     Offset_0x02D970       
;-------------------------------------------------------------------------------
Offset_0x02DA28:
                tst.b   Obj_Control_Var_0D(A0)                           ; $0039
                beq.s   Offset_0x02DA34
                subq.b  #$01, Obj_Control_Var_0D(A0)                     ; $0039
                bra.s   Offset_0x02DA3A
Offset_0x02DA34:
                move.b  #$FF, Obj_Control_Var_0E(A0)                     ; $003A
Offset_0x02DA3A:
                cmpi.b  #$27, Obj_Control_Var_07(A0)                     ; $0033
                bcs.s   Offset_0x02DA46
                subq.b  #$01, Obj_Control_Var_07(A0)                     ; $0033
Offset_0x02DA46:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$0420, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc.s   Offset_0x02DA58
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
Offset_0x02DA58:
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02DA6E
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                beq.s   Offset_0x02DA6A
                move.b  #$80, Obj_Control_Var_0E(A0)                     ; $003A
Offset_0x02DA6A:
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
Offset_0x02DA6E:
                bra     Offset_0x02D970 
;-------------------------------------------------------------------------------
Offset_0x02DA72:
                tst.b   Obj_Control_Var_12(A0)                           ; $003E
                beq.s   Offset_0x02DAA0
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                bne.s   Offset_0x02DADE
                cmpi.b  #$27, Obj_Control_Var_0D(A0)                     ; $0039
                bcc.s   Offset_0x02DA8C
                addq.b  #$01, Obj_Control_Var_0D(A0)                     ; $0039
                bra.s   Offset_0x02DADE
Offset_0x02DA8C:
                move.w  #$0100, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$00, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bclr    #$06, Obj_Player_Status(A0)                      ; $002B
                bra.s   Offset_0x02DADE
Offset_0x02DAA0:
                move.w  #$FE80, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.w  #$FF00, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                btst    #$07, Obj_Player_Status(A0)                      ; $002B
                beq.s   Offset_0x02DAC6
                move.w  #$0100, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x02DAC6:
                move.b  #$0E, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$00, Obj_Control_Var_02(A0)                     ; $002E
                bclr    #$06, Obj_Player_Status(A0)                      ; $002B
                move.b  #$00, Obj_Control_Var_03(A0)                     ; $002F
Offset_0x02DADE:
                bra     Offset_0x02D970     
;-------------------------------------------------------------------------------
Offset_0x02DAE2:
                tst.b   Obj_Control_Var_03(A0)                           ; $002F
                beq.s   Offset_0x02DAF0
                subq.b  #$01, Obj_Control_Var_03(A0)                     ; $002F
                bra     Offset_0x02D97A
Offset_0x02DAF0:
                moveq   #$00, D0
                move.b  Obj_Control_Var_02(A0), D0                       ; $002E
                move.w  Offset_0x02DAFE(PC, D0), D1
                jmp     Offset_0x02DAFE(PC, D1)     
;-------------------------------------------------------------------------------  
Offset_0x02DAFE:
                dc.w    Offset_0x02DB04-Offset_0x02DAFE
                dc.w    Offset_0x02DB6C-Offset_0x02DAFE
                dc.w    Offset_0x02DBB8-Offset_0x02DAFE    
;-------------------------------------------------------------------------------   
Offset_0x02DB04:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$0420, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc.s   Offset_0x02DB16
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
Offset_0x02DB16:
                btst    #$07, Obj_Player_Status(A0)                      ; $002B
                bne.s   Offset_0x02DB44
                cmpi.w  #$2AF0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bcc.s   Offset_0x02DB68
                addq.b  #$02, Obj_Control_Var_02(A0)                     ; $002E
                move.w  #$0180, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$04, Obj_Control_Var_01(A0)                     ; $002D
                move.w  #$001E, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bra.s   Offset_0x02DB68
Offset_0x02DB44:
                cmpi.w  #$2BB0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bcs.s   Offset_0x02DB68
                addq.b  #$02, Obj_Control_Var_02(A0)                     ; $002E
                move.w  #$0180, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$04, Obj_Control_Var_01(A0)                     ; $002D
                move.w  #$001E, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bclr    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x02DB68:
                bra     Offset_0x02D970   
;-------------------------------------------------------------------------------
Offset_0x02DB6C:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$04A0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcs.s   Offset_0x02DB8A
                move.w  #$FE80, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                addq.b  #$02, Obj_Control_Var_02(A0)                     ; $002E
                bchg    #07, Obj_Player_Status(A0)                       ; $002B
                bra.s   Offset_0x02DBB0
Offset_0x02DB8A:
                btst    #$07, Obj_Player_Status(A0)                      ; $002B
                bne.s   Offset_0x02DBA2
                cmpi.w  #$2AD0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bcc.s   Offset_0x02DBB0
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                bra.s   Offset_0x02DBB0
Offset_0x02DBA2:
                cmpi.w  #$2BD0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bcs.s   Offset_0x02DBB0
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
Offset_0x02DBB0:
                bsr     Offset_0x02DBF4
                bra     Offset_0x02D970  
;-------------------------------------------------------------------------------
Offset_0x02DBB8:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$0470, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc.s   Offset_0x02DBD8
                move.w  #$0100, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                btst    #$07, Obj_Player_Status(A0)                      ; $002B
                bne.s   Offset_0x02DBD8
                move.w  #$FF00, (Boss_Move_Buffer+$08).w             ; $FFFFF758
Offset_0x02DBD8:
                cmpi.w  #$0420, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc.s   Offset_0x02DBEC
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$00, Obj_Control_Var_02(A0)                     ; $002E
Offset_0x02DBEC:
                bsr     Offset_0x02DBF4
                bra     Offset_0x02D970
Offset_0x02DBF4:
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w              ; $FFFFF75C
                bne.s   Offset_0x02DC26
                tst.b   Obj_Control_Var_01(A0)                           ; $002D
                beq.s   Offset_0x02DC26
                subq.b  #$01, Obj_Control_Var_01(A0)                     ; $002D
                bsr     Jmp_0E_To_SingleObjectLoad             ; Offset_0x02E3CC
                bne.s   Offset_0x02DC26
                move.b  #$54, (A1)
                move.b  #$04, Obj_Boss_Routine(A1)                       ; $000A
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.w  #$001E, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.b  #$10, Obj_Control_Var_03(A0)                     ; $002F
Offset_0x02DC26:
                rts
Offset_0x02DC28:
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  Obj_Y(A0), D1                                    ; $000C
                move.w  D0, Mz_Robotnik_Pos_X(A0)                        ; $0010
                move.w  D1, Mz_Robotnik_Pos_Y(A0)                        ; $0012
                move.w  D0, Mz_Ship_Boost_Pos_X(A0)                      ; $0016
                move.w  D1, Mz_Ship_Boost_Pos_Y(A0)                      ; $0018
                rts
Offset_0x02DC42:
                bsr     Offset_0x02DD82
                cmpi.b  #$3F, Obj_Inertia(A0)                            ; $0014
                bne.s   Offset_0x02DC86
                st      Obj_Control_Var_0C(A0)                           ; $0038
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                andi.b  #$F0, $0002(A1) 
                ori.b   #$05, $0002(A1) 
                tst.b   Obj_Control_Var_12(A0)                           ; $003E
                beq.s   Offset_0x02DC7E
                move.b  #$0A, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$FE80, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                subq.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
Offset_0x02DC7E:
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                rts
Offset_0x02DC86:
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x02DC96
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x02DCB4
Offset_0x02DC96:
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                move.b  $0002(A1), D0 
                andi.b  #$0F, D0
                cmpi.b  #$04, D0
                beq.s   Offset_0x02DCB4
                andi.b  #$F0, $0002(A1) 
                ori.b   #$04, $0002(A1) 
Offset_0x02DCB4:
                rts   
;-------------------------------------------------------------------------------
Offset_0x02DCB6:
                subq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
                bmi.s   Offset_0x02DCCC
                bsr     Boss_Defeated                          ; Offset_0x028F7A
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                move.b  #$07, $0002(A1)
                bra.s   Offset_0x02DCEE
Offset_0x02DCCC:
                bset    #$00, Obj_Flags(A0)                              ; $0001
                clr.w   (Boss_Move_Buffer+$08).w                     ; $FFFFF758
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$FFEE, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                move.b  #$03, $0002(A1)
Offset_0x02DCEE:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x02E1F0
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02DC28
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0     
;-------------------------------------------------------------------------------
Offset_0x02DD0C:
                move.w  #$0400, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.w  #$FFC0, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                cmpi.w  #$2AB0, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                bcc.s   Offset_0x02DD26
                addq.w  #$02, (Sonic_Level_Limits_Max_X).w           ; $FFFFEECA
                bra.s   Offset_0x02DD2C
Offset_0x02DD26:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x02DD52
Offset_0x02DD2C:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02DD64
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x02E1F0
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02DC28
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0
Offset_0x02DD52:
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x02DD5E
                move.b  #$01, ($FFFFF7A7).w
Offset_0x02DD5E:
                jmp     (DeleteObject)                         ; Offset_0x0120D0
Offset_0x02DD64:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$06, D0
                add.w   (Boss_Move_Buffer+$04).w, D0                 ; $FFFFF754
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                addq.b  #$02, Obj_Map_Id(A0)                             ; $001A
Offset_0x02DD82:
                cmpi.b  #$10, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bcc.s   Offset_0x02DDC8
                tst.b   Obj_Boss_Hit_2(A0)                               ; $0032
                beq.s   Offset_0x02DDCA
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                bne.s   Offset_0x02DDC8
                tst.b   Obj_Inertia(A0)                                  ; $0014
                bne.s   Offset_0x02DDAC
                move.b  #$40, Obj_Inertia(A0)                            ; $0014
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x02DDAC:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x02DDBA
                move.w  #$0EEE, D0
Offset_0x02DDBA:
                move.w  D0, (A1)
                subq.b  #$01, Obj_Inertia(A0)                            ; $0014
                bne.s   Offset_0x02DDC8
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
Offset_0x02DDC8:
                rts
Offset_0x02DDCA:
                moveq   #$64, D0
                bsr     Jmp_05_To_AddPoints                    ; Offset_0x02E3DE
                move.w  #$00B3, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.b  #$10, Obj_Ani_Boss_Routine(A0)                   ; $0026
                rts                                                          
;===============================================================================   
; Objeto 0x54 - Robotnik na Metropolis
; <<<-          Rotinas adicionais deste objeto no objeto 0x53 ( obj_0x53.asm )
;===============================================================================