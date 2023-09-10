;===============================================================================
; Objeto 0x53 - Bolas e mini Robotniks a partir das bolas na Metropolis
; ->>> 
;=============================================================================== 
; Offset_0x02DDDE:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02DDEC(PC, D0), D1
                jmp     Offset_0x02DDEC(PC, D1)  
;-------------------------------------------------------------------------------        
Offset_0x02DDEC:
                dc.w    Offset_0x02DDF6-Offset_0x02DDEC
                dc.w    Offset_0x02DE78-Offset_0x02DDEC
                dc.w    Offset_0x02DFDA-Offset_0x02DDEC
                dc.w    Offset_0x02E052-Offset_0x02DDEC
                dc.w    Offset_0x02E10E-Offset_0x02DDEC    
;-------------------------------------------------------------------------------     
Offset_0x02DDF6:
                move.l  A0, A1
                moveq   #$06, D3
                moveq   #$00, D2
                bra.s   Offset_0x02DE04      
Offset_0x02DDFE:
                bsr     Jmp_0E_To_SingleObjectLoad             ; Offset_0x02E3CC
                bne.s   Offset_0x02DE68
Offset_0x02DE04:
                move.b  #$20, Obj_Width(A1)                              ; $0019
                move.l  Obj_Control_Var_08(A0), Obj_Control_Var_08(A1); $0034, $0034
                move.b  #$53, (A1)
                move.l  #Mz_Boss_Mappings, Obj_Map(A1)  ; Offset_0x02E23C, $0004
                move.w  #$037C, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  #$05, Obj_Map_Id(A1)                             ; $001A
                move.b  Offset_0x02DE6A(PC, D2), Obj_Subtype(A1)         ; $0028
                move.b  Offset_0x02DE6A(PC, D2), Obj_Control_Var_0F(A1)  ; $003B
                move.b  Offset_0x02DE71(PC, D2), Obj_Control_Var_0E(A1)  ; $003A
                move.b  #$40, Obj_Player_Flip_Flag(A1)                   ; $0029
                move.b  #$87, Obj_Col_Flags(A1)                          ; $0020
                move.b  #$02, Obj_Col_Prop(A1)                           ; $0021
                move.b  #$00, Obj_Control_Var_10(A1)                     ; $003C
                addq.w  #$01, D2
                dbra    D3, Offset_0x02DDFE
Offset_0x02DE68:
                rts    
;-------------------------------------------------------------------------------
Offset_0x02DE6A:
                dc.b    $24, $6C, $B4, $FC, $48, $90, $D8  
;-------------------------------------------------------------------------------
Offset_0x02DE71:
                dc.b    $00, $01, $01, $00, $01, $01, $00   
;-------------------------------------------------------------------------------
Offset_0x02DE78:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_Y(A1), Obj_Timer(A0)                  ; $000C, $002A
                subi.w  #$0004, Obj_Timer(A0)                            ; $002A
                move.w  Obj_X(A1), Obj_Control_Var_0C(A0)         ; $0008, $0038
                tst.b   Obj_Control_Var_0C(A1)                           ; $0038
                beq.s   Offset_0x02DECC
                move.b  #$00, Obj_Control_Var_0C(A1)                     ; $0038
                addi.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$3C, Obj_Boss_Hit_2(A0)                         ; $0032
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$FC00, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$FF80, D1
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                bpl.s   Offset_0x02DEC6
                neg.w   D1
Offset_0x02DEC6:
                move.w  D1, Obj_Speed(A0)                                ; $0010
                bra.s   Offset_0x02DEDA
Offset_0x02DECC:
                cmpi.b  #$02, Obj_Boss_Hit(A0)                           ; $0021
                beq.s   Offset_0x02DEDA
                move.b  #$00, Obj_Col_Flags(A1)                          ; $0020
Offset_0x02DEDA:
                bsr     Offset_0x02DEE6
                bsr     Offset_0x02DF90
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0
Offset_0x02DEE6:
                move.b  Obj_Player_Flip_Flag(A0), D0                     ; $0029
                jsr     (CalcSine)                             ; Offset_0x00396A
                move.w  D0, D3
                moveq   #$00, D1
                move.b  Obj_Control_Var_07(A1), D1                       ; $0033
                muls.w  D1, D0
                move.w  D0, D5
                move.w  D0, D4
                move.b  Obj_Control_Var_0D(A1), D2                       ; $0039
                tst.b   Obj_Control_Var_0E(A1)                           ; $003A
                beq.s   Offset_0x02DF0C
                move.w  #$0010, D2
Offset_0x02DF0C:
                muls.w  D3, D2
                move.w  Obj_Control_Var_0C(A0), D6                       ; $0038
                move.b  Obj_Subtype(A0), D0                              ; $0028
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  D0, D5
                swap.w  D5
                add.w   D6, D5
                move.w  D5, Obj_X(A0)                                    ; $0008
                muls.w  D1, D4
                swap.w  D4
                move.w  D4, Obj_Control_Var_04(A0)                       ; $0030
                move.w  Obj_Timer(A0), D6                                ; $002A
                move.b  Obj_Control_Var_0F(A0), D0                       ; $003B
                tst.b   Obj_Control_Var_0E(A1)                           ; $003A
                beq.s   Offset_0x02DF40
                move.b  Obj_Control_Var_10(A0), D0                       ; $003C
Offset_0x02DF40:
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  D0, D2
                swap.w  D2
                add.w   D6, D2
                move.w  D2, Obj_Y(A0)                                    ; $000C
                addq.b  #$04, Obj_Subtype(A0)                            ; $0028
                tst.b   Obj_Control_Var_0E(A1)                           ; $003A
                bne.s   Offset_0x02DF60
                addq.b  #$08, Obj_Control_Var_0F(A0)                     ; $003B
                rts
Offset_0x02DF60:
                cmpi.b  #$FF, Obj_Control_Var_0E(A1)                     ; $003A
                beq.s   Offset_0x02DF82
                cmpi.b  #$80, Obj_Control_Var_0E(A1)                     ; $003A
                bne.s   Offset_0x02DF7A
                subq.b  #$02, Obj_Control_Var_10(A0)                     ; $003C
                bpl.s   Offset_0x02DF8E
                clr.b   Obj_Control_Var_10(A0)                           ; $003C
Offset_0x02DF7A:
                move.b  #$00, Obj_Control_Var_0E(A1)                     ; $003A
                rts
Offset_0x02DF82:
                cmpi.b  #$40, Obj_Control_Var_10(A0)                     ; $003C
                bcc.s   Offset_0x02DF8E
                addq.b  #$02, Obj_Control_Var_10(A0)                     ; $003C
Offset_0x02DF8E:
                rts
Offset_0x02DF90:
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                bmi.s   Offset_0x02DFB8
                cmpi.w  #$000C, D0
                blt.s   Offset_0x02DFAA
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                rts
Offset_0x02DFAA:
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                move.b  #$02, Obj_Priority(A0)                           ; $0018
                rts
Offset_0x02DFB8:
                cmpi.w  #$FFF4, D0
                blt.s   Offset_0x02DFCC
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                move.b  #$06, Obj_Priority(A0)                           ; $0018
                rts
Offset_0x02DFCC:
                move.b  #$05, Obj_Map_Id(A0)                             ; $001A
                move.b  #$07, Obj_Priority(A0)                           ; $0018
                rts     
;-------------------------------------------------------------------------------
Offset_0x02DFDA:
                tst.b   Obj_Boss_Hit_2(A0)                               ; $0032
                bmi.s   Offset_0x02DFEC
                subq.b  #$01, Obj_Boss_Hit_2(A0)                         ; $0032
                bpl.s   Offset_0x02DFEC
                move.b  #$DA, Obj_Col_Flags(A0)                          ; $0020
Offset_0x02DFEC:
                bsr     Jmp_09_To_ObjectFall                   ; Offset_0x02E3E4
                subi.w  #$0020, Obj_Speed_Y(A0)                          ; $0012
                cmpi.w  #$0180, Obj_Speed_Y(A0)                          ; $0012
                blt.s   Offset_0x02E004
                move.w  #$0180, Obj_Speed_Y(A0)                          ; $0012
Offset_0x02E004:
                cmpi.w  #$04AC, Obj_Y(A0)                                ; $000C
                bcs.s   Offset_0x02E026
                move.w  #$04AC, Obj_Y(A0)                                ; $000C
                move.w  #$04AC, Obj_Control_Var_02(A0)                   ; $002E
                move.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Offset_0x02E0C2
Offset_0x02E026:
                bsr     Offset_0x02E038
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x02E1F0
                bsr     Jmp_16_To_AnimateSprite                ; Offset_0x02E3D8
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0
Offset_0x02E038:
                cmpi.b  #$FE, Obj_Col_Prop(A0)                           ; $0021
                bgt.s   Offset_0x02E050
                move.b  #$14, Obj_Map_Id(A0)                             ; $001A
                move.b  #$06, Obj_Ani_Number(A0)                         ; $001C
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x02E050:
                rts   
;-------------------------------------------------------------------------------
Offset_0x02E052:
                tst.b   Obj_Boss_Hit_2(A0)                               ; $0032
                bmi.s   Offset_0x02E064
                subq.b  #$01, Obj_Boss_Hit_2(A0)                         ; $0032
                bpl.s   Offset_0x02E064
                move.b  #$DA, Obj_Col_Flags(A0)                          ; $0020
Offset_0x02E064:
                bsr     Offset_0x02E0DC
                cmpi.b  #$0B, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x02E026
                move.b  Obj_Control_Var_00(A0), D0                       ; $002C
                jsr     (CalcSine)                             ; Offset_0x00396A
                neg.w   D0
                asr.w   #$02, D0
                add.w   Obj_Control_Var_02(A0), D0                       ; $002E
                cmpi.w  #$04AC, D0
                bcc.s   Offset_0x02E0AE
                move.w  D0, Obj_Y(A0)                                    ; $000C
                addq.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                btst    #$00, Obj_Control_Var_00(A0)                     ; $002C
                beq     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0
                moveq   #-$01, D0
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x02E0A6
                neg.w   D0
Offset_0x02E0A6:
                add.w   D0, Obj_X(A0)                                    ; $0008
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0
Offset_0x02E0AE:
                move.w  #$04AC, Obj_Y(A0)                                ; $000C
                bsr     Offset_0x02E0C2
                move.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0
Offset_0x02E0C2:
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                bpl.s   Offset_0x02E0D4
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                rts
Offset_0x02E0D4:
                bset    #$00, Obj_Flags(A0)                              ; $0001
                rts
Offset_0x02E0DC:
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x02E0EC
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x02E0F8
Offset_0x02E0EC:
                move.b  #$14, Obj_Map_Id(A0)                             ; $001A
                move.b  #$06, Obj_Ani_Number(A0)                         ; $001C
Offset_0x02E0F8:
                cmpi.b  #$FE, Obj_Col_Prop(A0)                           ; $0021
                bgt.s   Offset_0x02E10C
                move.b  #$14, Obj_Map_Id(A0)                             ; $001A
                move.b  #$06, Obj_Ani_Number(A0)                         ; $001C
Offset_0x02E10C:
                rts     
;-------------------------------------------------------------------------------
Offset_0x02E10E:
                move.b  #$C4, D0
                bsr     Jmp_03_To_Play_Sfx                     ; Offset_0x02E3D2
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                subi.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
                bra     Jmp_24_To_DeleteObject                 ; Offset_0x02E3C6      
;-------------------------------------------------------------------------------  
Mz_Boss_Sub_02:                                                ; Offset_0x02E124
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02E132(PC, D0), D0
                jmp     Offset_0x02E132(PC, D0)          
;-------------------------------------------------------------------------------     
Offset_0x02E132:
                dc.w    Offset_0x02E136-Offset_0x02E132
                dc.w    Offset_0x02E1A2-Offset_0x02E132     
;-------------------------------------------------------------------------------   
Offset_0x02E136:
                move.l  #Mz_Boss_Mappings, Obj_Map(A0)  ; Offset_0x02E23C, $0004
                move.w  #$037C, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                move.b  #$12, Obj_Map_Id(A0)                             ; $001A
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.b  #$50, Obj_Width(A0)                              ; $0019
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                addi.w  #$0007, Obj_Y(A0)                                ; $000C
                subi.w  #$0004, Obj_X(A0)                                ; $0008
                move.w  #$FC00, D0
                btst    #$00, Obj_Flags(A1)                              ; $0001
                beq.s   Offset_0x02E190
                neg.w   D0
                addi.w  #$0008, Obj_X(A0)                                ; $0008
Offset_0x02E190:
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.b  #$99, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$EA, D0
                bsr     Jmp_03_To_Play_Sfx                     ; Offset_0x02E3D2  
;-------------------------------------------------------------------------------
Offset_0x02E1A2:
                bsr     Jmp_18_To_SpeedToPos                   ; Offset_0x02E3EA
                cmpi.w  #$2AB0, Obj_X(A0)                                ; $0008
                bcs     Jmp_24_To_DeleteObject                 ; Offset_0x02E3C6
                cmpi.w  #$2BF0, Obj_X(A0)                                ; $0008
                bcc     Jmp_24_To_DeleteObject                 ; Offset_0x02E3C6
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0   
;-------------------------------------------------------------------------------
Mz_Boss_Sub_03:                                                ; Offset_0x02E1BE
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                cmpi.b  #$54, (A1)
                bne     Jmp_24_To_DeleteObject                 ; Offset_0x02E3C6
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                btst    #$00, Obj_Flags(A1)                              ; $0001
                beq     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0
                bset    #$00, Obj_Flags(A0)                              ; $0001
                bra     Jmp_21_To_DisplaySprite                ; Offset_0x02E3C0    
;-------------------------------------------------------------------------------
Mz_Boss_Animate_Data:                                          ; Offset_0x02E1F0
                dc.w    Offset_0x02E200-Mz_Boss_Animate_Data
                dc.w    Offset_0x02E203-Mz_Boss_Animate_Data
                dc.w    Offset_0x02E207-Mz_Boss_Animate_Data
                dc.w    Offset_0x02E21C-Mz_Boss_Animate_Data
                dc.w    Offset_0x02E220-Mz_Boss_Animate_Data
                dc.w    Offset_0x02E22B-Mz_Boss_Animate_Data
                dc.w    Offset_0x02E236-Mz_Boss_Animate_Data
                dc.w    Offset_0x02E239-Mz_Boss_Animate_Data
Offset_0x02E200:
                dc.b    $0F, $02, $FF
Offset_0x02E203:
                dc.b    $01, $00, $01, $FF
Offset_0x02E207:
                dc.b    $03, $05, $05, $05, $05, $05, $05, $05
                dc.b    $05, $06, $07, $06, $07, $06, $07, $08
                dc.b    $09, $0A, $0B, $FE, $01
Offset_0x02E21C:
                dc.b    $07, $0C, $0D, $FF
Offset_0x02E220:
                dc.b    $07, $0E, $0F, $0E, $0F, $0E, $0F, $0E
                dc.b    $0F, $FD, $03
Offset_0x02E22B:
                dc.b    $07, $10, $10, $10, $10, $10, $10, $10
                dc.b    $10, $FD, $03
Offset_0x02E236:
                dc.b    $01, $14, $FC
Offset_0x02E239:
                dc.b    $07, $11, $FF    
;-------------------------------------------------------------------------------
Mz_Boss_Mappings:                                              ; Offset_0x02E23C
                dc.w    Offset_0x02E266-Mz_Boss_Mappings
                dc.w    Offset_0x02E270-Mz_Boss_Mappings
                dc.w    Offset_0x02E27A-Mz_Boss_Mappings
                dc.w    Offset_0x02E2A4-Mz_Boss_Mappings
                dc.w    Offset_0x02E2AE-Mz_Boss_Mappings
                dc.w    Offset_0x02E2B8-Mz_Boss_Mappings
                dc.w    Offset_0x02E2C2-Mz_Boss_Mappings
                dc.w    Offset_0x02E2CC-Mz_Boss_Mappings
                dc.w    Offset_0x02E2D6-Mz_Boss_Mappings
                dc.w    Offset_0x02E2E0-Mz_Boss_Mappings
                dc.w    Offset_0x02E2EA-Mz_Boss_Mappings
                dc.w    Offset_0x02E2F4-Mz_Boss_Mappings
                dc.w    Offset_0x02E316-Mz_Boss_Mappings
                dc.w    Offset_0x02E328-Mz_Boss_Mappings
                dc.w    Offset_0x02E33A-Mz_Boss_Mappings
                dc.w    Offset_0x02E34C-Mz_Boss_Mappings
                dc.w    Offset_0x02E35E-Mz_Boss_Mappings
                dc.w    Offset_0x02E370-Mz_Boss_Mappings
                dc.w    Offset_0x02E382-Mz_Boss_Mappings
                dc.w    Offset_0x02E394-Mz_Boss_Mappings
                dc.w    Offset_0x02E39E-Mz_Boss_Mappings
Offset_0x02E266:
                dc.w    $0001
                dc.l    $000501E4, $00F2001C
Offset_0x02E270:
                dc.w    $0001
                dc.l    $000501E8, $00F4001C
Offset_0x02E27A:
                dc.w    $0005
                dc.l    $D80501A4, $00D20002
                dc.l    $E80501A8, $00D40010
                dc.l    $F80F218C, $20C6FFF0
                dc.l    $F807219C, $20CE0010
                dc.l    $F8022003, $2001FFE8
Offset_0x02E2A4:
                dc.w    $0001
                dc.l    $F40A200E, $2007FFF4
Offset_0x02E2AE:
                dc.w    $0001
                dc.l    $F40A206F, $2037FFF4
Offset_0x02E2B8:
                dc.w    $0001
                dc.l    $F8052078, $203CFFF8
Offset_0x02E2C2:
                dc.w    $0001
                dc.l    $F4062017, $200BFFF8
Offset_0x02E2CC:
                dc.w    $0001
                dc.l    $F809201D, $200EFFF4
Offset_0x02E2D6:
                dc.w    $0001
                dc.l    $F4062023, $2011FFF8
Offset_0x02E2E0:
                dc.w    $0001
                dc.l    $F40A0029, $0014FFF4
Offset_0x02E2EA:
                dc.w    $0001
                dc.l    $F00F0032, $0019FFF0
Offset_0x02E2F4:
                dc.w    $0004
                dc.l    $E80A0042, $0021FFE8
                dc.l    $E80A004B, $00250000
                dc.l    $000A0054, $002AFFE8
                dc.l    $000A005D, $002E0000
Offset_0x02E316:
                dc.w    $0002
                dc.l    $E80D01B4, $00DAFFF0
                dc.l    $E80501AC, $00D6FFE0
Offset_0x02E328:
                dc.w    $0002
                dc.l    $E80D01BC, $00DEFFF0
                dc.l    $E80501AC, $00D6FFE0
Offset_0x02E33A:
                dc.w    $0002
                dc.l    $E80D01C4, $00E2FFF0
                dc.l    $E80501B0, $00D8FFE0
Offset_0x02E34C:
                dc.w    $0002
                dc.l    $E80D01CC, $00E6FFF0
                dc.l    $E80501B0, $00D8FFE0
Offset_0x02E35E:
                dc.w    $0002
                dc.l    $E80D01D4, $00EAFFF0
                dc.l    $E80501B0, $00D8FFE0                                     
Offset_0x02E370:
                dc.w    $0002
                dc.l    $E80D01DC, $00EEFFF0
                dc.l    $E80501B0, $00D8FFE0
Offset_0x02E382:
                dc.w    $0002
                dc.l    $F80D2006, $2003FFE0
                dc.l    $F80D2806, $28030000
Offset_0x02E394:
                dc.w    $0001
                dc.l    $F8022000, $2000FFE0
Offset_0x02E39E:
                dc.w    $0004
                dc.l    $E80A0066, $0033FFE8
                dc.l    $E80A0866, $08330000
                dc.l    $000A1066, $1033FFE8
                dc.l    $000A1866, $18330000                                                               
;===============================================================================
; Objeto 0x53 - Bolas e mini Robotniks a partir das bolas na Metropolis
; <<<- 
;===============================================================================