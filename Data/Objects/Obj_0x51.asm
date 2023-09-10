;===============================================================================
; Objeto 0x51 - Robotnik na Casino Night
; ->>>        
;===============================================================================     
Offset_0x02CE18:
                moveq   #$00, D0
                move.b  Obj_Boss_Routine(A0), D0                         ; $000A
                move.w  Offset_0x02CE26(PC, D0), D1
                jmp     Offset_0x02CE26(PC, D1)
;-------------------------------------------------------------------------------           
Offset_0x02CE26:
                dc.w    Offset_0x02CE2C-Offset_0x02CE26
                dc.w    Offset_0x02CF14-Offset_0x02CE26
                dc.w    Offset_0x02D2E8-Offset_0x02CE26  
;-------------------------------------------------------------------------------     
Offset_0x02CE2C:
                move.l  #CNz_Boss_Mappings, Obj_Map(A0) ; Offset_0x02D5B4, $0004
                move.w  #$03A7, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, CNz_Boss_Ship_Pos_Y(A0)                    ; $0018
                move.w  #$29D0, Obj_X(A0)                                ; $0008
                move.w  #$0590, Obj_Y(A0)                                ; $000C
                move.b  #$00, Obj_Boss_Ani_Map(A0)                       ; $000B
                move.b  #$20, $000E(A0)
                move.b  #$80, Obj_Inertia(A0)                            ; $0014
                addq.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
                bset    #$06, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$02, Obj_Boss_Hit_2(A0)                         ; $0032
                move.w  Obj_X(A0), (Boss_Move_Buffer).w              ; $FFFFF750; $0008
                move.w  Obj_Y(A0), (Boss_Move_Buffer+$04).w          ; $FFFFF754; $000C
                move.w  Obj_X(A0), CNz_R_Catcher_Pos_X(A0)        ; $0008, $0010
                move.w  Obj_Y(A0), CNz_R_Catcher_Pos_Y(A0)        ; $000C, $0012
                move.b  #$05, Obj_Ani_Boss_Frame(A0)                     ; $0015
                move.w  Obj_X(A0), CNz_Boss_Ship_Pos_X(A0)        ; $0008, $0016
                move.w  Obj_Y(A0), CNz_Boss_Ship_Pos_Y(A0)        ; $000C, $0018
                move.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
                move.w  Obj_X(A0), CNz_Robotnik_Pos_X(A0)         ; $0008, $001C
                move.w  Obj_Y(A0), CNz_Robotnik_Pos_Y(A0)         ; $000C, $001E
                move.b  #$06, Obj_Col_Prop(A0)                           ; $0021
                move.w  Obj_X(A0), CNz_L_Catcher_Pos_X(A0)        ; $0008, $0022
                move.w  Obj_Y(A0), CNz_L_Catcher_Pos_Y(A0)        ; $000C, $0024
                move.b  #$02, Obj_Flip_Angle(A0)                         ; $0027
                move.b  #$02, Obj_Control_Var_0C(A0)                     ; $0038
                move.w  #$E800, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bsr     Offset_0x02CEE6
                rts
Offset_0x02CEE6:
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$04, (A2)+
                move.b  #$00, (A2)+
                move.b  #$01, (A2)+
                move.b  #$00, (A2)+
                move.b  #$10, (A2)+
                move.b  #$00, (A2)+
                move.b  #$03, (A2)+
                move.b  #$00, (A2)+
                move.b  #$02, (A2)+
                move.b  #$00, (A2)+
                rts     
;-------------------------------------------------------------------------------
Offset_0x02CF14:
                moveq   #$00, D0
                move.b  Obj_Ani_Boss_Routine(A0), D0                     ; $0026
                move.w  Offset_0x02CF22(PC, D0), D1
                jmp     Offset_0x02CF22(PC, D1)    
;-------------------------------------------------------------------------------       
Offset_0x02CF22:
                dc.w    Offset_0x02CF30-Offset_0x02CF22
                dc.w    Offset_0x02CF4E-Offset_0x02CF22
                dc.w    Offset_0x02CF8C-Offset_0x02CF22
                dc.w    Offset_0x02D000-Offset_0x02CF22
                dc.w    Offset_0x02D064-Offset_0x02CF22
                dc.w    Offset_0x02D0BE-Offset_0x02CF22
                dc.w    Offset_0x02D114-Offset_0x02CF22     
;-------------------------------------------------------------------------------  
Offset_0x02CF30:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     CNz_Boss_Hit                           ; Offset_0x028DF2
                bsr     Offset_0x02D162
                bsr     Offset_0x02D23A
                lea     (CNz_Boss_Animate_Data), A1            ; Offset_0x02D56C
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718     
;-------------------------------------------------------------------------------
Offset_0x02CF4E:
                move.b  Obj_Control_Var_12(A0), D0                       ; $003E
                andi.b  #$01, D0
                beq.s   Offset_0x02CF74
                subi.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                move.b  #$00, Obj_Boss_Ani_Map(A0)                       ; $000B
                addq.b  #$04, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bsr     Offset_0x02D04E
                move.w  #$00DC, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bra.s   Offset_0x02CF30
Offset_0x02CF74:
                addi.b  #$01, Obj_Control_Var_12(A0)                     ; $003E
                move.b  #$0C, Obj_Boss_Ani_Map(A0)                       ; $000B
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$00C8, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bra.s   Offset_0x02CF30       
;-------------------------------------------------------------------------------
Offset_0x02CF8C:
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bmi.s   Offset_0x02CFE6
                beq.s   Offset_0x02CFCA
                cmpi.w  #$004B, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bne.s   Offset_0x02CF30
Offset_0x02CF9E:
                move.b  #$02, ($FFFFF73F).w
                move.b  #$20, (Boss_Animate_Buffer+$03).w            ; $FFFFF743
                move.b  #$20, (Boss_Animate_Buffer+$09).w            ; $FFFFF749
                move.b  #$40, (Boss_Animate_Buffer+$01).w            ; $FFFFF741
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                andi.b  #$F0, $0006(A1)
                ori.b   #$05, $0006(A1)
                bra     Offset_0x02CF30
Offset_0x02CFCA:
                move.b  #$01, ($FFFFF73F).w
                move.b  #$00, (Boss_Animate_Buffer+$03).w            ; $FFFFF743
                move.b  #$00, (Boss_Animate_Buffer+$09).w            ; $FFFFF749
                move.b  #$00, (Boss_Animate_Buffer+$01).w            ; $FFFFF741
                bra     Offset_0x02CF30
Offset_0x02CFE6:
                cmpi.w  #$FFB5, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                beq.s   Offset_0x02CF9E
                cmpi.w  #$FF6A, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bne     Offset_0x02CF30
                move.b  #$00, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bra.s   Offset_0x02CFCA   
;-------------------------------------------------------------------------------
Offset_0x02D000:
                move.b  #$00, ($FFFFF73F).w
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bne.s   Offset_0x02D02E
                move.b  #$20, (Boss_Animate_Buffer+$03).w            ; $FFFFF743
                move.b  #$20, (Boss_Animate_Buffer+$09).w            ; $FFFFF749
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                andi.b  #$F0, $0006(A1)
                ori.b   #$05, $0006(A1)
                bra     Offset_0x02CF30
Offset_0x02D02E:
                cmpi.w  #$FFEC, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bgt     Offset_0x02CF30
                move.b  #$00, (Boss_Animate_Buffer+$03).w            ; $FFFFF743
                move.b  #$00, (Boss_Animate_Buffer+$09).w            ; $FFFFF749
                move.b  #$00, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bra     Offset_0x02CF30
Offset_0x02D04E:
                bsr     Jmp_0D_To_SingleObjectLoad             ; Offset_0x02D724
                bne.s   Offset_0x02D062
                move.b  #$51, (A1)
                move.b  #$04, Obj_Boss_Routine(A1)                       ; $000A
                move.l  A0, CNz_R_Catcher_Fall_Y(A1)                     ; $0034
Offset_0x02D062:
                rts   
;-------------------------------------------------------------------------------
Offset_0x02D064:
                st      Obj_Control_Var_00(A0)                           ; $002C
                move.b  #$00, ($FFFFEEBD).w
                subq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
                bmi.s   Offset_0x02D07A
                bsr     Boss_Defeated                          ; Offset_0x028F7A
                bra.s   Offset_0x02D0AA
Offset_0x02D07A:
                move.b  #$0B, Obj_Col_Prop(A0)                           ; $0021
                move.b  #$00, Obj_Boss_Ani_Map(A0)                       ; $000B
                bset    #$00, Obj_Flags(A0)                              ; $0001
                clr.w   (Boss_Move_Buffer+$08).w                     ; $FFFFF758
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$DD, (Level_Map_Buffer+$0C54).w             ; $FFFF8C54
                move.b  #$01, (Refresh_Level_Layout).w               ; $FFFFF72C
                move.w  #$FFEE, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
Offset_0x02D0AA:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                bsr     Offset_0x02D23A
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718  
;-------------------------------------------------------------------------------
Offset_0x02D0BE:
                addq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
                beq.s   Offset_0x02D0CE
                bpl.s   Offset_0x02D0D4
                addi.w  #$0018, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bra.s   Offset_0x02D0F8
Offset_0x02D0CE:
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
                bra.s   Offset_0x02D0F8
Offset_0x02D0D4:
                cmpi.w  #$0018, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bcs.s   Offset_0x02D0EC
                beq.s   Offset_0x02D0F4
                cmpi.w  #$0020, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bcs.s   Offset_0x02D0F8
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bra.s   Offset_0x02D0F8
Offset_0x02D0EC:
                subi.w  #$0008, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bra.s   Offset_0x02D0F8
Offset_0x02D0F4:
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
Offset_0x02D0F8:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     CNz_Boss_Hit                           ; Offset_0x028DF2
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                bsr     Offset_0x02D23A
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718     
;-------------------------------------------------------------------------------
Offset_0x02D114:
                move.w  #$0400, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.w  #$FFC0, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                cmpi.w  #$2980, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                beq.s   Offset_0x02D12E
                addq.w  #$02, (Sonic_Level_Limits_Max_X).w           ; $FFFFEECA
                bra.s   Offset_0x02D134
Offset_0x02D12E:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x02D150
Offset_0x02D134:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     CNz_Boss_Hit                           ; Offset_0x028DF2
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                bsr     Offset_0x02D23A
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
Offset_0x02D150:
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x02D15C
                move.b  #$01, ($FFFFF7A7).w
Offset_0x02D15C:
                jmp     (DeleteObject)                         ; Offset_0x0120D0
Offset_0x02D162:
                moveq   #$00, D0
                move.b  Obj_Control_Var_0C(A0), D0                       ; $0038
                move.w  Offset_0x02D170(PC, D0), D0
                jmp     Offset_0x02D170(PC, D0)      
;-------------------------------------------------------------------------------     
Offset_0x02D170:
                dc.w    Offset_0x02D178-Offset_0x02D170
                dc.w    Offset_0x02D19A-Offset_0x02D170
                dc.w    Offset_0x02D1D0-Offset_0x02D170
                dc.w    Offset_0x02D20A-Offset_0x02D170    
;------------------------------------------------------------------------------- 
Offset_0x02D178:
                cmpi.w  #$29E0, (Boss_Move_Buffer).w                 ; $FFFFF750
                blt.s   Offset_0x02D198
                move.w  #$29E0, (Boss_Move_Buffer).w                 ; $FFFFF750
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.w  #$FE80, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$02, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x02D198:
                rts   
;-------------------------------------------------------------------------------
Offset_0x02D19A:
                cmpi.w  #$063A, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bgt.s   Offset_0x02D1CE
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                cmpi.w  #$063A, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bgt.s   Offset_0x02D1CE
                move.w  #$063A, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.w  #$FE80, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.b  #$04, Obj_Control_Var_0C(A0)                     ; $0038
                andi.b  #$7F, Obj_Control_Var_12(A0)                     ; $003E
Offset_0x02D1CE:
                rts       
;-------------------------------------------------------------------------------
Offset_0x02D1D0:
                cmpi.w  #$2940, (Boss_Move_Buffer).w                 ; $FFFFF750
                bgt.s   Offset_0x02D208
                tst.b   Obj_Control_Var_12(A0)                           ; $003E
                bmi.s   Offset_0x02D1E8
                ori.b   #$80, Obj_Control_Var_12(A0)                     ; $003E
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
Offset_0x02D1E8:
                cmpi.w  #$28A0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bgt.s   Offset_0x02D208
                move.w  #$28A0, (Boss_Move_Buffer).w                 ; $FFFFF750
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.w  #$0180, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$06, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x02D208:
                rts     
;-------------------------------------------------------------------------------
Offset_0x02D20A:
                cmpi.w  #$063A, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02D238
                bset    #$00, Obj_Flags(A0)                              ; $0001
                cmpi.w  #$063A, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02D238
                move.w  #$063A, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.w  #$0180, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.b  #$00, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x02D238:
                rts
Offset_0x02D23A:
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  Obj_Y(A0), D1                                    ; $000C
                move.w  D0, CNz_Boss_Ship_Pos_X(A0)                      ; $0016
                move.w  D1, CNz_Boss_Ship_Pos_Y(A0)                      ; $0018
                move.w  D0, CNz_Robotnik_Pos_X(A0)                       ; $001C
                move.w  D1, CNz_Robotnik_Pos_Y(A0)                       ; $001E
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02D272
                move.w  D0, CNz_L_Catcher_Pos_X(A0)                      ; $0022
                move.w  D1, CNz_L_Catcher_Pos_Y(A0)                      ; $0024
                move.w  D0, CNz_R_Catcher_Pos_X(A0)                      ; $0010
                move.w  D1, CNz_R_Catcher_Pos_Y(A0)                      ; $0012
                move.w  D1, CNz_L_Catcher_Fall_Y(A0)                     ; $003A
                move.w  D1, CNz_R_Catcher_Fall_Y(A0)                     ; $0034
                rts
Offset_0x02D272:
                cmpi.w  #$0078, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bgt.s   Offset_0x02D2E6
                subi.w  #$0001, CNz_L_Catcher_Pos_X(A0)                  ; $0022
                move.l  CNz_L_Catcher_Fall_Y(A0), D0                     ; $003A
                move.w  CNz_L_Catcher_Pos_Y_1(A0), D1                    ; $002E
                addi.w  #$0038, CNz_L_Catcher_Pos_Y_1(A0)                ; $002E
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, CNz_L_Catcher_Fall_Y(A0)                     ; $003A
                move.w  CNz_L_Catcher_Fall_Y(A0), CNz_L_Catcher_Pos_Y(A0); $0024, $003A
                cmpi.w  #$06F0, CNz_L_Catcher_Pos_Y(A0)                  ; $0024
                blt.s   Offset_0x02D2AC
                move.w  #$0000, CNz_L_Catcher_Pos_Y_1(A0)                ; $002E
Offset_0x02D2AC:
                cmpi.w  #$003C, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bgt.s   Offset_0x02D2E6
                addi.w  #$0001, CNz_R_Catcher_Pos_X(A0)                  ; $0010
                move.l  CNz_R_Catcher_Fall_Y(A0), D0                     ; $0034
                move.w  Obj_Control_Var_04(A0), D1                       ; $0030
                addi.w  #$0038, Obj_Control_Var_04(A0)                   ; $0030
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, CNz_R_Catcher_Fall_Y(A0)                     ; $0034
                move.w  CNz_R_Catcher_Fall_Y(A0), CNz_R_Catcher_Pos_Y(A0); $0012, $0034
                cmpi.w  #$06F0, CNz_R_Catcher_Pos_Y(A0)                  ; $0012
                blt.s   Offset_0x02D2E6
                move.w  #$0000, Obj_Control_Var_04(A0)                   ; $0030
Offset_0x02D2E6:
                rts 
;-------------------------------------------------------------------------------
Offset_0x02D2E8:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02D2F6(PC, D0), D1
                jmp     Offset_0x02D2F6(PC, D1)      
;-------------------------------------------------------------------------------    
Offset_0x02D2F6:
                dc.w    Offset_0x02D300-Offset_0x02D2F6
                dc.w    Offset_0x02D354-Offset_0x02D2F6
                dc.w    Offset_0x02D3A0-Offset_0x02D2F6
                dc.w    Offset_0x02D3DA-Offset_0x02D2F6
                dc.w    Offset_0x02D550-Offset_0x02D2F6   
;-------------------------------------------------------------------------------   
Offset_0x02D300:
                move.l  #CNz_Boss_Mappings, Obj_Map(A0) ; Offset_0x02D5B4, $0004
                move.w  #$03A7, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$07, Obj_Priority(A0)                           ; $0018
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_X(A1), Obj_Timer(A0)                  ; $0008, $002A
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                addi.w  #$0030, Obj_Y(A0)                                ; $000C
                move.b  #$08, CNz_Boss_Ship_Pos_X(A0)                    ; $0016
                move.b  #$08, Obj_Width_2(A0)                            ; $0017
                move.b  #$12, Obj_Map_Id(A0)                             ; $001A
                move.b  #$98, Obj_Col_Flags(A0)                          ; $0020
                rts    
;-------------------------------------------------------------------------------
Offset_0x02D354:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_X(A1), Obj_Timer(A0)                  ; $0008, $002A
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.w  Obj_Subtype(A0), D0                              ; $0028
                add.w   D0, Obj_Y(A0)                                    ; $000C
                addi.w  #$0001, D0
                cmpi.w  #$002E, D0
                blt.s   Offset_0x02D380
                move.w  #$002E, D0
Offset_0x02D380:
                move.w  D0, Obj_Subtype(A0)                              ; $0028
                tst.w   (Boss_Move_Buffer+$0C).w                     ; $FFFFF75C
                bne     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  (Boss_Move_Buffer+$08).w, CNz_R_Catcher_Pos_X(A0) ; $FFFFF758, $0010
                move.w  #$0001, Obj_Control_Var_04(A0)                   ; $0030
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718             
;-------------------------------------------------------------------------------
Offset_0x02D3A0:
                bsr     Offset_0x02D48E
                subi.w  #$0008, CNz_R_Catcher_Pos_X(A0)                  ; $0010
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, CNz_R_Catcher_Pos_Y(A0)                  ; $0012
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bclr    #$07, Obj_Control_Var_00(A0)                     ; $002C
                move.w  #$FD00, CNz_R_Catcher_Pos_X(A0)                  ; $0010
                move.w  #$0800, CNz_R_Catcher_Pos_Y(A0)                  ; $0012
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718              
;-------------------------------------------------------------------------------
Offset_0x02D3DA:
                bsr     Offset_0x02D4CA
                btst    #$07, Obj_Control_Var_00(A0)                     ; $002C
                bne.s   Offset_0x02D428
                cmpi.w  #$2884, Obj_X(A0)                                ; $0008
                bcs.s   Offset_0x02D41A
                bsr     Offset_0x02D45C
                bsr     Jmp_04_To_ObjHitFloor                  ; Offset_0x02D736
                ext.w   D3
                ext.l   D3
                asl.l   #$03, D3
                divs.w  #$0005, D3
                add.w   D3, CNz_R_Catcher_Pos_X(A0)                      ; $0010
                bmi.s   Offset_0x02D40C
                bchg    #07, Obj_Control_Var_00(A0)                      ; $002C
Offset_0x02D40C:
                tst.w   D1
                bpl     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
                add.w   D1, Obj_Y(A0)                                    ; $000C
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
Offset_0x02D41A:
                bchg    #07, Obj_Control_Var_00(A0)                      ; $002C
                neg.w   CNz_R_Catcher_Pos_X(A0)                          ; $0010
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
Offset_0x02D428:
                cmpi.w  #$29FC, Obj_X(A0)                                ; $0008
                bcc.s   Offset_0x02D41A
                bsr     Offset_0x02D45C
                bsr     Jmp_04_To_ObjHitFloor                  ; Offset_0x02D736
                ext.w   D3
                ext.l   D3
                asl.l   #$03, D3
                divs.w  #$0005, D3
                add.w   D3, CNz_R_Catcher_Pos_X(A0)                      ; $0010
                bpl.s   Offset_0x02D44E
                bchg    #07, Obj_Control_Var_00(A0)                      ; $002C
Offset_0x02D44E:
                tst.w   D1
                bpl     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
                add.w   D1, Obj_Y(A0)                                    ; $000C
                bra     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
Offset_0x02D45C:
                moveq   #$00, D2
                move.w  Obj_X(A0), D2                                    ; $0008
                swap.w  D2
                moveq   #$00, D3
                move.w  Obj_Y(A0), D3                                    ; $000C
                swap.w  D3
                move.w  CNz_R_Catcher_Pos_X(A0), D0                      ; $0010
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  CNz_R_Catcher_Pos_Y(A0), D0                      ; $0012
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                swap.w  D2
                move.w  D2, Obj_X(A0)                                    ; $0008
                swap.w  D3
                move.w  D3, Obj_Y(A0)                                    ; $000C
                rts
Offset_0x02D48E:
                moveq   #$00, D2
                move.w  Obj_Timer(A0), D2                                ; $002A
                swap.w  D2
                moveq   #$00, D3
                move.w  Obj_Y(A0), D3                                    ; $000C
                swap.w  D3
                move.w  CNz_R_Catcher_Pos_X(A0), D0                      ; $0010
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  CNz_R_Catcher_Pos_Y(A0), D0                      ; $0012
                addi.w  #$0038, CNz_R_Catcher_Pos_Y(A0)                  ; $0012
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                swap.w  D2
                move.w  D2, Obj_Timer(A0)                                ; $002A
                move.w  D2, Obj_X(A0)                                    ; $0008
                swap.w  D3
                move.w  D3, Obj_Y(A0)                                    ; $000C
                rts
Offset_0x02D4CA:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.b  #$0A, Obj_Ani_Boss_Routine(A1)                   ; $0026
                bcc.s   Offset_0x02D502
                subi.w  #$0001, Obj_Control_Var_04(A0)                   ; $0030
                bmi.s   Offset_0x02D502
                cmpi.w  #$01A4, Obj_Control_Var_04(A0)                   ; $0030
                bcc.s   Offset_0x02D500
                subi.w  #$0001, Obj_Boss_Hit_2(A0)                       ; $0032
                bpl.s   Offset_0x02D500
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                divs.w  #$003C, D0
                move.w  D0, Obj_Boss_Hit_2(A0)                           ; $0032
                eori.w  #$2000, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x02D500:
                rts
Offset_0x02D502:
                move.w  #$03A7, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$07, CNz_Robotnik_Pos_X(A0)                     ; $001C
                move.w  #$FD00, CNz_R_Catcher_Pos_Y(A0)                  ; $0012
                move.w  #$FF00, CNz_R_Catcher_Pos_X(A0)                  ; $0010
                move.w  Obj_X(A0), Obj_Timer(A0)                  ; $0008, $002A
                move.b  #$04, Obj_Boss_Routine(A0)                       ; $000A
                move.b  #$08, Obj_Routine_2(A0)                          ; $0025
                move.b  #$98, Obj_Col_Flags(A0)                          ; $0020
                bsr     Jmp_14_To_SingleObjectLoad_2           ; Offset_0x02D72A
                bne.s   Offset_0x02D54E
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x02D53E:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x02D53E
                neg.w   CNz_R_Catcher_Pos_X(A1)                          ; $0010
Offset_0x02D54E:
                rts  
;-------------------------------------------------------------------------------
Offset_0x02D550:
                bsr     Offset_0x02D48E
                lea     (CNz_Boss_Animate_Data), A1            ; Offset_0x02D56C
                bsr     Jmp_15_To_AnimateSprite                ; Offset_0x02D730
                cmpi.w  #$0705, Obj_Y(A0)                                ; $000C
                bcs     Jmp_20_To_DisplaySprite                ; Offset_0x02D718
                bra     Jmp_23_To_DeleteObject                 ; Offset_0x02D71E
;-------------------------------------------------------------------------------
CNz_Boss_Animate_Data:                                         ; Offset_0x02D56C
                dc.w    Offset_0x02D57C-CNz_Boss_Animate_Data
                dc.w    Offset_0x02D57F-CNz_Boss_Animate_Data
                dc.w    Offset_0x02D585-CNz_Boss_Animate_Data
                dc.w    Offset_0x02D58B-CNz_Boss_Animate_Data
                dc.w    Offset_0x02D58F-CNz_Boss_Animate_Data
                dc.w    Offset_0x02D599-CNz_Boss_Animate_Data
                dc.w    Offset_0x02D5A4-CNz_Boss_Animate_Data
                dc.w    Offset_0x02D5AF-CNz_Boss_Animate_Data
Offset_0x02D57C:
                dc.b    $0F, $01, $FF
Offset_0x02D57F:
                dc.b    $0F, $04, $FF, $05, $FC, $02
Offset_0x02D585:
                dc.b    $0F, $02, $FF, $03, $FC, $02
Offset_0x02D58B:
                dc.b    $07, $06, $07, $FF
Offset_0x02D58F:
                dc.b    $01, $0C, $0D, $0E, $FF, $0F, $10, $11
                dc.b    $FC, $04
Offset_0x02D599:
                dc.b    $07, $08, $09, $08, $09, $08, $09, $08
                dc.b    $09, $FD, $03
Offset_0x02D5A4:
                dc.b    $07, $06, $0A, $06, $0A, $06, $0A, $06
                dc.b    $0A, $FD, $03
Offset_0x02D5AF:
                dc.b    $03, $13, $14, $FF, $00                   
;-------------------------------------------------------------------------------
CNz_Boss_Mappings:                                             ; Offset_0x02D5B4
                dc.w    CNz_Boss_Mappings-CNz_Boss_Mappings
                dc.w    Offset_0x02D5DE-CNz_Boss_Mappings
                dc.w    Offset_0x02D608-CNz_Boss_Mappings
                dc.w    Offset_0x02D612-CNz_Boss_Mappings
                dc.w    Offset_0x02D61C-CNz_Boss_Mappings
                dc.w    Offset_0x02D626-CNz_Boss_Mappings
                dc.w    Offset_0x02D638-CNz_Boss_Mappings
                dc.w    Offset_0x02D64A-CNz_Boss_Mappings
                dc.w    Offset_0x02D65C-CNz_Boss_Mappings
                dc.w    Offset_0x02D66E-CNz_Boss_Mappings
                dc.w    Offset_0x02D680-CNz_Boss_Mappings
                dc.w    Offset_0x02D692-CNz_Boss_Mappings
                dc.w    Offset_0x02D6A4-CNz_Boss_Mappings
                dc.w    Offset_0x02D6AE-CNz_Boss_Mappings
                dc.w    Offset_0x02D6B8-CNz_Boss_Mappings
                dc.w    Offset_0x02D6C2-CNz_Boss_Mappings
                dc.w    Offset_0x02D6D4-CNz_Boss_Mappings
                dc.w    Offset_0x02D6E6-CNz_Boss_Mappings
                dc.w    Offset_0x02D6F8-CNz_Boss_Mappings
                dc.w    Offset_0x02D702-CNz_Boss_Mappings
                dc.w    Offset_0x02D70C-CNz_Boss_Mappings
Offset_0x02D5DE:
                dc.w    $0005
                dc.l    $F005017D, $00BE0010
                dc.l    $D80E2060, $2030FFF9
                dc.l    $000F206C, $2036FFD8
                dc.l    $000F207C, $203EFFF8
                dc.l    $0006208C, $20460018
Offset_0x02D608:
                dc.w    $0001
                dc.l    $180620AA, $2055FFE4
Offset_0x02D612:
                dc.w    $0001
                dc.l    $100620B0, $2058FFDB
Offset_0x02D61C:
                dc.w    $0001
                dc.l    $100B2092, $20490008
Offset_0x02D626:
                dc.w    $0002
                dc.l    $1009209E, $204F0008
                dc.l    $100620A4, $20520020
Offset_0x02D638:
                dc.w    $0002
                dc.l    $F00D0189, $00C4FFF0
                dc.l    $F0050181, $00C0FFE0
Offset_0x02D64A:
                dc.w    $0002
                dc.l    $F00D0191, $00C8FFF0
                dc.l    $F0050181, $00C0FFE0
Offset_0x02D65C:
                dc.w    $0002
                dc.l    $F00D0199, $00CCFFF0
                dc.l    $F0050185, $00C2FFE0
Offset_0x02D66E:
                dc.w    $0002
                dc.l    $F00D01A1, $00D0FFF0
                dc.l    $F0050185, $00C2FFE0
Offset_0x02D680:
                dc.w    $0002
                dc.l    $F00D01A9, $00D4FFF0
                dc.l    $F0050185, $00C2FFE0
Offset_0x02D692:
                dc.w    $0002
                dc.l    $F00D01B1, $00D8FFF0
                dc.l    $F0050185, $00C2FFE0
Offset_0x02D6A4:
                dc.w    $0001
                dc.l    $280C20B6, $205BFFF0
Offset_0x02D6AE:
                dc.w    $0001
                dc.l    $280C20BA, $205DFFF0
Offset_0x02D6B8:
                dc.w    $0001
                dc.l    $280C20BE, $205FFFF0
Offset_0x02D6C2:
                dc.w    $0002
                dc.l    $200C20C2, $2061FFE4
                dc.l    $200C20C6, $20630004
Offset_0x02D6D4:
                dc.w    $0002
                dc.l    $200C20CA, $2065FFE4
                dc.l    $200C20CE, $20670004
Offset_0x02D6E6:
                dc.w    $0002
                dc.l    $200C20D2, $2069FFE4
                dc.l    $200C20D6, $206B0004
Offset_0x02D6F8:
                dc.w    $0001
                dc.l    $F40A00DA, $006DFFF4
Offset_0x02D702:
                dc.w    $0001
                dc.l    $FC0000E3, $0071FFFC
Offset_0x02D70C:
                dc.w    $0001
                dc.l    $FC0000E4, $0072FFFC
;===============================================================================   
; Objeto 0x51 - Robotnik na Casino Night
; <<<-        
;===============================================================================