; Configuração dos movimentos do chefe    [$01=Broca (nº2) Diagonal]
;                                         [$02=Broca nave movendo]
;                                         [$03=Broca (nº2) Vertical]
;                                         [$04..$0B=Broca (nº2) Horizontal]
;                                         [$0C=Broca (nº2) Subindo]
; $FFFF742 => Configuração da broca nº 1
; $FFFF748 => Configuração da broca nº 2
; $FFFF750 => Posição da tela
; $FFFF75A => Movimento Cima / Baixo
; $FFFF758 => Movimento Esquerda / Direita
; (A0) + 32 => Contagem de toques no chefe
;===============================================================================
; Objeto 0x57 - Robotnik na Dust Hill
; ->>> 
;=============================================================================== 
; Offset_0x02C4E0:   
                moveq   #$00, D0
                move.b  Obj_Boss_Routine(A0), D0                         ; $000A
                move.w  Offset_0x02C4EE(PC, D0), D1
                jmp     Offset_0x02C4EE(PC, D1)       
;------------------------------------------------------------------------------- 
Offset_0x02C4EE:
                dc.w    Offset_0x02C4F4-Offset_0x02C4EE
                dc.w    Offset_0x02C5FA-Offset_0x02C4EE
                dc.w    Offset_0x02CB2C-Offset_0x02C4EE    
;-------------------------------------------------------------------------------                   
Offset_0x02C4F4:
                move.l  #DHz_Boss_Mappings, Obj_Map(A0) ; Offset_0x02CC26, $0004
                move.w  #$03C0, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, DHz_Ship_Boost_Pos_Y(A0)                   ; $0018
                move.w  #$21A0, Obj_X(A0)                                ; $0008
                move.w  #$0560, Obj_Y(A0)                                ; $000C
                move.b  #$05, Obj_Boss_Ani_Map(A0)                       ; $000B
                addq.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
                move.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bset    #$06, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Boss_Hit_2(A0)                         ; $0032
                move.w  Obj_X(A0), (Boss_Move_Buffer).w       ; $FFFFF750, $0008
                move.w  Obj_Y(A0), (Boss_Move_Buffer+$04).w   ; $FFFFF754, $000C
                move.w  #$00C0, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$00, ($FFFFF73F).w
                move.b  #$01, ($FFFFEEBD).w
                move.b  #$40, $000E(A0)
                move.w  Obj_X(A0), DHz_Front_Drill_Pos_X(A0)      ; $0008, $0010
                move.w  Obj_Y(A0), DHz_Front_Drill_Pos_Y(A0)      ; $000C, $0012
                move.b  #$02, Obj_Ani_Boss_Frame(A0)                     ; $0015
                move.w  Obj_X(A0), DHz_Ship_Boost_Pos_X(A0)       ; $0008, $0016
                move.w  Obj_Y(A0), DHz_Ship_Boost_Pos_Y(A0)       ; $000C, $0018
                move.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
                move.w  Obj_X(A0), DHz_Robotnik_Pos_X(A0)         ; $0008, $001C
                move.w  Obj_Y(A0), DHz_Robotnik_Pos_Y(A0)         ; $000C, $001E
                move.b  #$0E, Obj_Col_Prop(A0)                           ; $0021
                move.w  Obj_X(A0), DHz_Back_Drill_Pos_X(A0)       ; $0008, $0022
                move.w  Obj_Y(A0), DHz_Back_Drill_Pos_Y(A0)       ; $000C, $0024
                move.b  #$02, Obj_Flip_Angle(A0)                         ; $0027
                subi.w  #$0028, DHz_Back_Drill_Pos_X(A0)                 ; $0022
                move.w  #$0028, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.w  #$FC80, Obj_Control_Var_02(A0)                   ; $002E
                move.w  #$FC80, Obj_Control_Var_04(A0)                   ; $0030
                bsr     Offset_0x02C5CC
                rts
Offset_0x02C5CC:
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$02, (A2)+
                move.b  #$00, (A2)+
                move.b  #$03, (A2)+
                move.b  #$00, (A2)+
                move.b  #$10, (A2)+
                move.b  #$00, (A2)+
                move.b  #$0D, (A2)+
                move.b  #$00, (A2)+
                move.b  #$03, (A2)+
                move.b  #$00, (A2)+
                rts     
;------------------------------------------------------------------------------- 
Offset_0x02C5FA:
                moveq   #$00, D0
                move.b  Obj_Ani_Boss_Routine(A0), D0                     ; $0026
                move.w  Offset_0x02C608(PC, D0), D1
                jmp     Offset_0x02C608(PC, D1)  
;-------------------------------------------------------------------------------            
Offset_0x02C608:
                dc.w    Offset_0x02C616-Offset_0x02C608
                dc.w    Offset_0x02C6AA-Offset_0x02C608
                dc.w    Offset_0x02C6E6-Offset_0x02C608
                dc.w    Offset_0x02C786-Offset_0x02C608
                dc.w    Offset_0x02CA08-Offset_0x02C608
                dc.w    Offset_0x02CA5C-Offset_0x02C608
                dc.w    Offset_0x02CAD4-Offset_0x02C608    
;-------------------------------------------------------------------------------  
Offset_0x02C616:
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bpl.s   Offset_0x02C668
                move.b  #$00, (Boss_Animate_Buffer+$05).w            ; $FFFFF745
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$0560, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bgt.s   Offset_0x02C668
                move.w  #$0100, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.w  (Player_Position_X).w, D3                    ; $FFFFB008
                cmpi.w  #$2190, D3
                bcc.s   Offset_0x02C646
                move.w  #$2200, D3
                bra.s   Offset_0x02C64A
Offset_0x02C646:
                move.w  #$2120, D3
Offset_0x02C64A:
                move.w  D3, (Boss_Move_Buffer).w                     ; $FFFFF750
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   ($FFFFF750).w, D0
                bmi.s   Offset_0x02C668
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x02C668:
                cmpi.w  #$0028, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bne.s   Offset_0x02C676
                move.b  #$00, ($FFFFF73F).w
Offset_0x02C676:
                cmpi.w  #$0620, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bge.s   Offset_0x02C688
                move.b  #$01, ($FFFFEEBD).w
                bsr     Offset_0x02C902
Offset_0x02C688:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)   ; $FFFFF754, $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)       ; $FFFFF750, $0008
                bsr     Offset_0x02C976
                lea     (DHz_Boss_Animate_Data), A1            ; Offset_0x02CB44
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02C846
                bra     Jmp_1F_To_DisplaySprite                ; Offset_0x02CDF4      
;-------------------------------------------------------------------------------  
Offset_0x02C6AA:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02C902
                cmpi.w  #$0620, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02C6C4
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$00, ($FFFFEEBD).w
Offset_0x02C6C4:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)   ; $FFFFF754, $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)       ; $FFFFF750, $0008
                bsr     Offset_0x02C976
                lea     (DHz_Boss_Animate_Data), A1            ; Offset_0x02CB44
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02C846
                bra     Jmp_1F_To_DisplaySprite                ; Offset_0x02CDF4  
;-------------------------------------------------------------------------------  
Offset_0x02C6E6:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$0660, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                blt.s   Offset_0x02C764
                move.w  #$0660, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                andi.b  #$F0, $0002(A1) 
                ori.b   #$06, $0002(A1) 
                andi.b  #$F0, $0008(A1) 
                ori.b   #$06, $0008(A1) 
                andi.b  #$F0, $0006(A1)
                ori.b   #$0D, $0006(A1)
                move.b  #$20, $0005(A1)
                move.w  #$0064, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.b  #$30, $0001(A1)
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   (Boss_Move_Buffer).w, D0                     ; $FFFFF750
                bmi.s   Offset_0x02C74C
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x02C74C:
                move.w  #$FE00, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x02C764
                neg.w   (Boss_Move_Buffer+$08).w                     ; $FFFFF758
Offset_0x02C764:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)   ; $FFFFF754, $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)       ; $FFFFF750, $0008
                bsr     Offset_0x02C976
                lea     (DHz_Boss_Animate_Data), A1            ; Offset_0x02CB44
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02C846
                bra     Jmp_1F_To_DisplaySprite                ; Offset_0x02CDF4  
;-------------------------------------------------------------------------------  
Offset_0x02C786:
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                cmpi.w  #$0028, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bgt     Offset_0x02C824
                move.b  #$01, ($FFFFF73F).w
                tst.w   (Boss_Move_Buffer+$0C).w                     ; $FFFFF75C
                bpl     Offset_0x02C824
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x02C7B0
                sf      Obj_Control_Var_0C(A0)                           ; $0038
                bra.s   Offset_0x02C7D4
Offset_0x02C7B0:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$2120, (Boss_Move_Buffer).w                 ; $FFFFF750
                bgt.s   Offset_0x02C7C4
                move.w  #$2120, (Boss_Move_Buffer).w                 ; $FFFFF750
                bra.s   Offset_0x02C7DE
Offset_0x02C7C4:
                cmpi.w  #$2200, (Boss_Move_Buffer).w                 ; $FFFFF750
                blt.s   Offset_0x02C824
                move.w  #$2200, (Boss_Move_Buffer).w                 ; $FFFFF750
                bra.s   Offset_0x02C7DE
Offset_0x02C7D4:
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                move.b  #$30, $0007(A1)
Offset_0x02C7DE:
                move.w  #$0000, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.b  #$00, Obj_Ani_Boss_Routine(A0)                   ; $0026
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                andi.b  #$F0, $0002(A1) 
                ori.b   #$0B, $0002(A1) 
                andi.b  #$F0, $0008(A1) 
                ori.b   #$0B, $0008(A1) 
                move.b  #$00, $0001(A1) 
                andi.b  #$F0, $0006(A1)
                ori.b   #$0D, $0006(A1)
                move.w  #$0064, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.w  #$FF40, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
Offset_0x02C824:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)   ; $FFFFF754, $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)       ; $FFFFF750, $0008
                bsr     Offset_0x02C976
                lea     (DHz_Boss_Animate_Data), A1            ; Offset_0x02CB44
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02C846
                bra     Jmp_1F_To_DisplaySprite                ; Offset_0x02CDF4
Offset_0x02C846:
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  Obj_Y(A0), D1                                    ; $000C
                move.w  D0, DHz_Ship_Boost_Pos_X(A0)                     ; $0016
                move.w  D1, DHz_Ship_Boost_Pos_Y(A0)                     ; $0018
                move.w  D0, DHz_Robotnik_Pos_X(A0)                       ; $001C
                move.w  D1, DHz_Robotnik_Pos_Y(A0)                       ; $001E
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x02C894
                move.w  D0, DHz_Back_Drill_Pos_X(A0)                     ; $0022
                move.w  D1, DHz_Back_Drill_Pos_Y(A0)                     ; $0024
                move.w  D0, DHz_Front_Drill_Pos_X(A0)                    ; $0010
                move.w  D1, DHz_Front_Drill_Pos_Y(A0)                    ; $0012
                move.w  D1, Obj_Control_Var_0E(A0)                       ; $003A
                move.w  D1, Obj_Control_Var_08(A0)                       ; $0034
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x02C88C
                addi.w  #$0028, DHz_Back_Drill_Pos_X(A0)                 ; $0022
                rts
Offset_0x02C88C:
                subi.w  #$0028, DHz_Back_Drill_Pos_X(A0)                 ; $0022
                rts
Offset_0x02C894:
                cmpi.w  #$0078, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bgt.s   Offset_0x02C900
                subi.w  #$0001, DHz_Back_Drill_Pos_X(A0)                 ; $0022
                move.l  Obj_Control_Var_0E(A0), D0                       ; $003A
                move.w  Obj_Control_Var_02(A0), D1                       ; $002E
                addi.w  #$0038, Obj_Control_Var_02(A0)                   ; $002E
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, Obj_Control_Var_0E(A0)                       ; $003A
                move.w  Obj_Control_Var_0E(A0), DHz_Back_Drill_Pos_Y(A0); $0024, $003A
                cmpi.w  #$06F0, DHz_Back_Drill_Pos_Y(A0)                 ; $0024
                blt.s   Offset_0x02C8CE
                move.w  #$0000, Obj_Control_Var_02(A0)                   ; $002E
Offset_0x02C8CE:
                addi.w  #$0001, DHz_Front_Drill_Pos_X(A0)                ; $0010
                move.l  Obj_Control_Var_08(A0), D0                       ; $0034
                move.w  Obj_Control_Var_04(A0), D1                       ; $0030
                addi.w  #$0038, Obj_Control_Var_04(A0)                   ; $0030
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, Obj_Control_Var_08(A0)                       ; $0034
                move.w  Obj_Control_Var_08(A0), DHz_Front_Drill_Pos_Y(A0); $0012, $0034
                cmpi.w  #$06F0, DHz_Front_Drill_Pos_Y(A0)                ; $0012
                blt.s   Offset_0x02C900
                move.w  #$0000, Obj_Control_Var_04(A0)                   ; $0030
Offset_0x02C900:
                rts
Offset_0x02C902:
                move.b  ($FFFFFE0F).w, D1
                sf      D2
                andi.b  #$1F, D1
                beq.s   Offset_0x02C916
                andi.b  #$07, D1
                bne.s   Offset_0x02C974
                st      D2
Offset_0x02C916:
                bsr     Jmp_03_To_PseudoRandomNumber           ; Offset_0x02CE06
                swap.w  D1
                andi.w  #$01FF, D1
                addi.w  #$20F0, D1
                cmpi.w  #$2230, D1
                bgt.s   Offset_0x02C916
                bsr     Jmp_0C_To_SingleObjectLoad             ; Offset_0x02CE00
                bne.s   Offset_0x02C974
                move.b  #$57, (A1)
                move.b  #$04, Obj_Boss_Routine(A1)                       ; $000A
                move.w  D1, Obj_X(A1)                                    ; $0008
                move.w  #$05F0, Obj_Y(A1)                                ; $000C
                move.l  #DHz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02CC26, $0004
                move.w  #$0560, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$0D, Obj_Map_Id(A1)                             ; $001A
                tst.b   D2
                bne.s   Offset_0x02C974
                move.b  #$14, Obj_Map_Id(A1)                             ; $001A
                move.b  #$AD, Obj_Col_Flags(A1)                          ; $0020
Offset_0x02C974:
                rts
Offset_0x02C976:
                bsr     Offset_0x02C9AC
                cmpi.b  #$3F, Obj_Inertia(A0)                            ; $0014
                bne.s   Offset_0x02C98C
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                move.b  #$C0, $0007(A1)
Offset_0x02C98C:
                rts    
;-------------------------------------------------------------------------------
Offset_0x02C98E:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$06, D0
                add.w   (Boss_Move_Buffer+$04).w, D0                 ; $FFFFF754
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)       ; $FFFFF750, $0008
                addq.b  #$02, Obj_Map_Id(A0)                             ; $001A
Offset_0x02C9AC:
                cmpi.b  #$08, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bcc.s   Offset_0x02C9F2
                tst.b   Obj_Boss_Hit_2(A0)                               ; $0032
                beq.s   Offset_0x02C9F4
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                bne.s   Offset_0x02C9F2
                tst.b   Obj_Inertia(A0)                                  ; $0014
                bne.s   Offset_0x02C9D6
                move.b  #$40, Obj_Inertia(A0)                            ; $0014
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x02C9D6:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x02C9E4
                move.w  #$0EEE, D0
Offset_0x02C9E4:
                move.w  D0, (A1)
                subq.b  #$01, Obj_Inertia(A0)                            ; $0014
                bne.s   Offset_0x02C9F2
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
Offset_0x02C9F2:
                rts
Offset_0x02C9F4:
                moveq   #$64, D0
                bsr     Jmp_04_To_AddPoints                    ; Offset_0x02CE0C
                move.w  #$00B3, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.b  #$08, Obj_Ani_Boss_Routine(A0)                   ; $0026
                rts  
;-------------------------------------------------------------------------------  
Offset_0x02CA08:
                st      Obj_Control_Var_00(A0)                           ; $002C
                move.b  #$00, ($FFFFEEBD).w
                subq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
                bmi.s   Offset_0x02CA2A
                move.b  #$13, Obj_Col_Prop(A0)                           ; $0021
                move.b  #$07, Obj_Boss_Ani_Map(A0)                       ; $000B
                bsr     Boss_Defeated                          ; Offset_0x028F7A
                bra.s   Offset_0x02CA48
Offset_0x02CA2A:
                bset    #$00, Obj_Flags(A0)                              ; $0001
                clr.w   (Boss_Move_Buffer+$08).w                     ; $FFFFF758
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$12, Obj_Col_Prop(A0)                           ; $0021
                move.w  #$FFEE, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
Offset_0x02CA48:
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                bsr     Offset_0x02C846
                bra     Jmp_1F_To_DisplaySprite                ; Offset_0x02CDF4       
;-------------------------------------------------------------------------------  
Offset_0x02CA5C:
                addq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
                beq.s   Offset_0x02CA78
                bpl.s   Offset_0x02CA7E
                cmpi.w  #$0620, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc.s   Offset_0x02CA70
                subq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
Offset_0x02CA70:
                addi.w  #$0010, ($FFFFF75A).w
                bra.s   Offset_0x02CAB8
Offset_0x02CA78:
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
                bra.s   Offset_0x02CAB8
Offset_0x02CA7E:
                cmpi.w  #$0018, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bcs.s   Offset_0x02CAAC
                beq.s   Offset_0x02CAB4
                cmpi.w  #$0020, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bcs.s   Offset_0x02CAB8
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                move.b  #$0D, $0007(A1)
                move.b  #$02, $0000(A2)                                 
                move.b  #$00, $0001(A1) 
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bra.s   Offset_0x02CAB8
Offset_0x02CAAC:
                subi.w  #$0008, ($FFFFF75A).w
                bra.s   Offset_0x02CAB8
Offset_0x02CAB4:
                clr.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
Offset_0x02CAB8:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02C98E
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)   ; $FFFFF754, $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)       ; $FFFFF750, $0008
                bsr     Offset_0x02C846
                bra     Jmp_1F_To_DisplaySprite                ; Offset_0x02CDF4    
;-------------------------------------------------------------------------------  
Offset_0x02CAD4:
                move.w  #$0400, (Boss_Move_Buffer+$08).w             ; $FFFFF758
                move.w  #$FFC0, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                cmpi.w  #$22F0, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                beq.s   Offset_0x02CAEE
                addq.w  #$02, (Sonic_Level_Limits_Max_X).w           ; $FFFFEECA
                bra.s   Offset_0x02CAF4
Offset_0x02CAEE:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x02CB1A
Offset_0x02CAF4:
                bsr     Boss_Move                              ; Offset_0x028E8C
                bsr     Offset_0x02C98E
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)   ; $FFFFF754, $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)       ; $FFFFF750, $0008
                lea     (DHz_Boss_Animate_Data), A1            ; Offset_0x02CB44
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02C846
                bra     Jmp_1F_To_DisplaySprite                ; Offset_0x02CDF4
Offset_0x02CB1A:
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x02CB26
                move.b  #$01, ($FFFFF7A7).w
Offset_0x02CB26:
                jmp     (DeleteObject)                         ; Offset_0x0120D0   
;-------------------------------------------------------------------------------                   
Offset_0x02CB2C:
                bsr     Jmp_08_To_ObjectFall                   ; Offset_0x02CE12
                subi.w  #$0028, DHz_Front_Drill_Pos_Y(A0)                ; $0012
                cmpi.w  #$06F0, Obj_Y(A0)                                ; $000C
                bgt     Jmp_22_To_DeleteObject                 ; Offset_0x02CDFA
                bra     Jmp_1F_To_DisplaySprite                ; Offset_0x02CDF4      
;-------------------------------------------------------------------------------
DHz_Boss_Animate_Data:                                         ; Offset_0x02CB44
                dc.w    Offset_0x02CB62-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CB68-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CB6B-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CB72-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CB83-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CB94-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CB9B-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CBAD-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CBBE-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CBCF-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CBE0-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CBE7-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CBF9-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CC0B-DHz_Boss_Animate_Data
                dc.w    Offset_0x02CC22-DHz_Boss_Animate_Data
Offset_0x02CB62:
                dc.b    $0F, $01, $FF, $00, $FC, $02
Offset_0x02CB68:
                dc.b    $05, $08, $FF
Offset_0x02CB6B:
                dc.b    $01, $05, $06, $FF, $07, $FC, $03
Offset_0x02CB72:
                dc.b    $01, $02, $02, $02, $02, $02, $03, $03
                dc.b    $03, $03, $03, $04, $04, $04, $04, $FD
                dc.b    $04
Offset_0x02CB83:
                dc.b    $01, $02, $02, $02, $02, $03, $03, $03
                dc.b    $04, $04, $04, $02, $02, $03, $03, $FD
                dc.b    $05
Offset_0x02CB94:
                dc.b    $01, $04, $02, $03, $04, $FC, $01
Offset_0x02CB9B:
                dc.b    $01, $02, $03, $04, $04, $02, $02, $03
                dc.b    $03, $03, $04, $04, $04, $02, $02, $02
                dc.b    $FD, $07
Offset_0x02CBAD:
                dc.b    $01, $02, $03, $03, $03, $03, $04, $04
                dc.b    $04, $04, $04, $02, $08, $08, $08, $FD
                dc.b    $08
Offset_0x02CBBE:
                dc.b    $01, $09, $09, $09, $09, $09, $0A, $0A
                dc.b    $0A, $0A, $0A, $0B, $0B, $0B, $0B, $FD
                dc.b    $09
Offset_0x02CBCF:
                dc.b    $01, $09, $09, $09, $09, $0A, $0A, $0A
                dc.b    $0B, $0B, $0B, $09, $09, $0A, $0A, $FD
                dc.b    $0A
Offset_0x02CBE0:
                dc.b    $01, $0B, $09, $0A, $0B, $FC, $01
Offset_0x02CBE7:
                dc.b    $01, $09, $0A, $0B, $0B, $09, $09, $0A
                dc.b    $0A, $0A, $0B, $0B, $0B, $09, $09, $09
                dc.b    $FD, $0C
Offset_0x02CBF9:
                dc.b    $01, $09, $0A, $0A, $0A, $0A, $0B, $0B
                dc.b    $0B, $0B, $0B, $09, $08, $08, $08, $08
                dc.b    $FD, $03
Offset_0x02CC0B:
                dc.b    $07, $0E, $0F, $FF, $10, $11, $10, $11
                dc.b    $10, $11, $10, $11, $FF, $12, $12, $12
                dc.b    $12, $12, $12, $12, $12, $12, $FF
Offset_0x02CC22:
                dc.b    $07, $12, $FF, $00  
;-------------------------------------------------------------------------------    
DHz_Boss_Mappings:                                             ; Offset_0x02CC26
                dc.w    Offset_0x02CC50-DHz_Boss_Mappings
                dc.w    Offset_0x02CC7A-DHz_Boss_Mappings
                dc.w    Offset_0x02CCA4-DHz_Boss_Mappings
                dc.w    Offset_0x02CCB6-DHz_Boss_Mappings
                dc.w    Offset_0x02CCC8-DHz_Boss_Mappings
                dc.w    Offset_0x02CCDA-DHz_Boss_Mappings
                dc.w    Offset_0x02CCEC-DHz_Boss_Mappings
                dc.w    Offset_0x02CCFE-DHz_Boss_Mappings
                dc.w    Offset_0x02CD08-DHz_Boss_Mappings
                dc.w    Offset_0x02CD32-DHz_Boss_Mappings
                dc.w    Offset_0x02CD44-DHz_Boss_Mappings
                dc.w    Offset_0x02CD56-DHz_Boss_Mappings
                dc.w    Offset_0x02CD68-DHz_Boss_Mappings
                dc.w    Offset_0x02CD72-DHz_Boss_Mappings
                dc.w    Offset_0x02CD7C-DHz_Boss_Mappings
                dc.w    Offset_0x02CD8E-DHz_Boss_Mappings
                dc.w    Offset_0x02CDA0-DHz_Boss_Mappings
                dc.w    Offset_0x02CDB2-DHz_Boss_Mappings
                dc.w    Offset_0x02CDC4-DHz_Boss_Mappings
                dc.w    Offset_0x02CDD6-DHz_Boss_Mappings
                dc.w    Offset_0x02CDE8-DHz_Boss_Mappings
Offset_0x02CC50:
                dc.w    $0005
                dc.l    $F80F2148, $20A4FFF0
                dc.l    $F8072158, $20AC0010
                dc.l    $E8050164, $00B20010
                dc.l    $F80A2009, $2004FFD8
                dc.l    $D8090021, $0010FFF8
Offset_0x02CC7A:
                dc.w    $0005
                dc.l    $F80F2148, $20A4FFF0
                dc.l    $F8072158, $20AC0010
                dc.l    $E8050164, $00B20010
                dc.l    $F80A2000, $2000FFD8
                dc.l    $D8090021, $0010FFF8
Offset_0x02CCA4:
                dc.w    $0002
                dc.l    $D0072027, $2013000C
                dc.l    $F00B203F, $201F0008
Offset_0x02CCB6:
                dc.w    $0002
                dc.l    $D007202F, $2017000C
                dc.l    $F00B204B, $20250008
Offset_0x02CCC8:
                dc.w    $0002
                dc.l    $D0072037, $201B000C
                dc.l    $F00B2057, $202B0008
Offset_0x02CCDA:
                dc.w    $0002
                dc.l    $12080012, $0009FFF8
                dc.l    $1A080015, $000AFFF8
Offset_0x02CCEC:
                dc.w    $0002
                dc.l    $12080012, $0009FFF8
                dc.l    $1A0A0018, $000CFFF8
Offset_0x02CCFE:
                dc.w    $0001
                dc.l    $12080012, $0009FFF8
Offset_0x02CD08:
                dc.w    $0005
                dc.l    $E0092063, $2031FFF8
                dc.l    $F0012069, $20340000
                dc.l    $F00F206B, $20350008
                dc.l    $F802207B, $203D0028
                dc.l    $1004207E, $203F0018
Offset_0x02CD32:
                dc.w    $0002
                dc.l    $FC0D2080, $2040FFF0
                dc.l    $F80E2098, $204C0010
Offset_0x02CD44:
                dc.w    $0002
                dc.l    $FC0D2088, $2044FFF0
                dc.l    $F80E20A4, $20520010
Offset_0x02CD56:
                dc.w    $0002
                dc.l    $FC0D2090, $2048FFF0
                dc.l    $F80E20B0, $20580010
Offset_0x02CD68:
                dc.w    $0001
                dc.l    $F00F40BC, $405EFFF0
Offset_0x02CD72:
                dc.w    $0001
                dc.l    $F8054000, $4000FFF8
Offset_0x02CD7C:
                dc.w    $0002
                dc.l    $E80D0170, $00B8FFF0
                dc.l    $E8050168, $00B4FFE0
Offset_0x02CD8E:
                dc.w    $0002
                dc.l    $E80D0178, $00BCFFF0
                dc.l    $E8050168, $00B4FFE0
Offset_0x02CDA0:
                dc.w    $0002
                dc.l    $E80D0180, $00C0FFF0
                dc.l    $E805016C, $00B6FFE0
Offset_0x02CDB2:
                dc.w    $0002
                dc.l    $E80D0188, $00C4FFF0
                dc.l    $E805016C, $00B6FFE0
Offset_0x02CDC4:
                dc.w    $0002
                dc.l    $E80D0190, $00C8FFF0
                dc.l    $E805016C, $00B6FFE0
Offset_0x02CDD6:
                dc.w    $0002
                dc.l    $E80D0198, $00CCFFF0
                dc.l    $E805016C, $00B6FFE0
Offset_0x02CDE8:
                dc.w    $0001
                dc.l    $F0034004, $4002FFFC           
;===============================================================================
; Objeto 0x57 - Robotnik na Dust Hill
; <<<- 
;===============================================================================