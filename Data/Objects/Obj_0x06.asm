;===============================================================================
; Objeto 0x06 - Atributo invisível dos espirais na Emerald Hill / Metropolis
; ->>>
;===============================================================================
; Offset_0x01BF70:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01BFA0(PC, D0), D1
                jsr     Offset_0x01BFA0(PC, D1)
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x01BF86
                rts
Offset_0x01BF86:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x01BF9A
                rts
Offset_0x01BF9A:
                jmp     (DeleteObject)                         ; Offset_0x0120D0     
;-------------------------------------------------------------------------------                  
Offset_0x01BFA0:
                dc.w    Offset_0x01BFA6-Offset_0x01BFA0
                dc.w    Offset_0x01BFBE-Offset_0x01BFA0
                dc.w    Offset_0x01C2B4-Offset_0x01BFA0    
;-------------------------------------------------------------------------------
Offset_0x01BFA6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$D0, Obj_Width(A0)                              ; $0019
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bpl.s   Offset_0x01BFBE
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bra     Offset_0x01C2B4
;-------------------------------------------------------------------------------                
Offset_0x01BFBE:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                bsr.s   Offset_0x01BFCC
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                addq.b  #$01, D6
Offset_0x01BFCC:
                btst    D6, Obj_Status(A0)                               ; $0022
                bne     Offset_0x01C06C
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne     Offset_0x01C06A
                btst    #$03, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x01C02C
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                tst.w   Obj_Speed(A1)                                    ; $0010
                bmi.s   Offset_0x01C002
                cmpi.w  #$FF40, D0
                bgt.s   Offset_0x01C06A
                cmpi.w  #$FF30, D0
                blt.s   Offset_0x01C06A
                bra.s   Offset_0x01C00E
Offset_0x01C002:
                cmpi.w  #$00C0, D0
                blt.s   Offset_0x01C06A
                cmpi.w  #$00D0, D0
                bgt.s   Offset_0x01C06A
Offset_0x01C00E:
                move.w  Obj_Y(A1), D1                                    ; $000C
                sub.w   Obj_Y(A0), D1                                    ; $000C
                subi.w  #$0010, D1
                cmpi.w  #$0030, D1
                bcc.s   Offset_0x01C06A
                tst.b   Obj_Timer(A1)                                    ; $002A
                bne.s   Offset_0x01C06A
                bsr     Player_On_Spiral                       ; Offset_0x014EE4
                rts
Offset_0x01C02C:
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                tst.w   Obj_Speed(A1)                                    ; $0010
                bmi.s   Offset_0x01C048
                cmpi.w  #$FF50, D0
                bgt.s   Offset_0x01C06A
                cmpi.w  #$FF40, D0
                blt.s   Offset_0x01C06A
                bra.s   Offset_0x01C054
Offset_0x01C048:
                cmpi.w  #$00B0, D0
                blt.s   Offset_0x01C06A
                cmpi.w  #$00C0, D0
                bgt.s   Offset_0x01C06A
Offset_0x01C054:
                move.w  Obj_Y(A1), D1                                    ; $000C
                sub.w   Obj_Y(A0), D1                                    ; $000C
                subi.w  #$0010, D1
                cmpi.w  #$0030, D1
                bcc.s   Offset_0x01C06A
                bsr     Player_On_Spiral                       ; Offset_0x014EE4
Offset_0x01C06A:
                rts
Offset_0x01C06C:
                move.w  Obj_Inertia(A1), D0                              ; $0014
                bpl.s   Offset_0x01C074
                neg.w   D0
Offset_0x01C074:
                cmpi.w  #$0600, D0
                bcs.s   Offset_0x01C096
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x01C096
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                addi.w  #$00D0, D0
                bmi.s   Offset_0x01C096
                cmpi.w  #$01A0, D0
                bcs.s   Offset_0x01C0AE
Offset_0x01C096:
                bclr    #$03, Obj_Status(A1)                             ; $0022
                bclr    D6, Obj_Status(A0)                               ; $0022
                move.b  #$00, Obj_P_Flips_Remaining(A1)                  ; $002C
                move.b  #$04, Obj_Player_Flip_Speed(A1)                  ; $002D
                rts
Offset_0x01C0AE:
                btst    #$03, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x01C06A
                move.b  Spiral_Data_2(PC, D0), D1              ; Offset_0x01C114
                ext.w   D1
                move.w  Obj_Y(A0), D2                                    ; $000C
                add.w   D1, D2
                moveq   #$00, D1
                move.b  Obj_Height_2(A1), D1                             ; $0016
                subi.w  #$0013, D1
                sub.w   D1, D2
                move.w  D2, Obj_Y(A1)                                    ; $000C
                lsr.w   #$03, D0
                andi.w  #$003F, D0
                move.b  Spiral_Data(PC, D0), Obj_Flip_Angle(A1) ; Offset_0x01C0E0, $0027
                rts
;-------------------------------------------------------------------------------
Spiral_Data:                                                   ; Offset_0x01C0E0
                dc.b    $00, $00, $01, $01, $16, $16, $16, $16
                dc.b    $2C, $2C, $2C, $2C, $42, $42, $42, $42
                dc.b    $58, $58, $58, $58, $6E, $6E, $6E, $6E
                dc.b    $84, $84, $84, $84, $9A, $9A, $9A, $9A
                dc.b    $B0, $B0, $B0, $B0, $C6, $C6, $C6, $C6
                dc.b    $DC, $DC, $DC, $DC, $F2, $F2, $F2, $F2
                dc.b    $01, $01, $00, $00          
;-------------------------------------------------------------------------------
Spiral_Data_2:                                                 ; Offset_0x01C114
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20
                dc.b    $20, $20, $20, $20, $20, $20, $1F, $1F
                dc.b    $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F
                dc.b    $1F, $1F, $1F, $1F, $1F, $1E, $1E, $1E
                dc.b    $1E, $1E, $1E, $1E, $1E, $1E, $1D, $1D
                dc.b    $1D, $1D, $1D, $1C, $1C, $1C, $1C, $1B
                dc.b    $1B, $1B, $1B, $1A, $1A, $1A, $19, $19
                dc.b    $19, $18, $18, $18, $17, $17, $16, $16
                dc.b    $15, $15, $14, $14, $13, $12, $12, $11
                dc.b    $10, $10, $0F, $0E, $0E, $0D, $0C, $0C
                dc.b    $0B, $0A, $0A, $09, $08, $08, $07, $06
                dc.b    $06, $05, $04, $04, $03, $02, $02, $01
                dc.b    $00, $FF, $FE, $FE, $FD, $FC, $FC, $FB
                dc.b    $FA, $F9, $F9, $F8, $F7, $F7, $F6, $F6
                dc.b    $F5, $F5, $F4, $F4, $F3, $F2, $F2, $F1
                dc.b    $F1, $F0, $F0, $EF, $EF, $EE, $EE, $ED
                dc.b    $ED, $ED, $EC, $EB, $EB, $EA, $EA, $E9
                dc.b    $E9, $E8, $E8, $E7, $E7, $E6, $E6, $E5
                dc.b    $E5, $E4, $E4, $E4, $E3, $E3, $E2, $E2
                dc.b    $E2, $E1, $E1, $E1, $E0, $E0, $E0, $DF
                dc.b    $DF, $DF, $DF, $DE, $DE, $DE, $DD, $DD
                dc.b    $DD, $DD, $DD, $DD, $DD, $DD, $DC, $DC
                dc.b    $DC, $DC, $DC, $DC, $DC, $DC, $DC, $DB
                dc.b    $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
                dc.b    $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
                dc.b    $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
                dc.b    $DB, $DB, $DB, $DB, $DC, $DC, $DC, $DC
                dc.b    $DC, $DC, $DC, $DD, $DD, $DD, $DD, $DD
                dc.b    $DD, $DD, $DD, $DE, $DE, $DE, $DF, $DF
                dc.b    $DF, $DF, $E0, $E0, $E0, $E1, $E1, $E1
                dc.b    $E2, $E2, $E2, $E3, $E3, $E4, $E4, $E4
                dc.b    $E5, $E5, $E6, $E6, $E7, $E7, $E8, $E8
                dc.b    $E9, $E9, $EA, $EA, $EB, $EB, $EC, $ED
                dc.b    $ED, $EE, $EE, $EF, $F0, $F0, $F1, $F2
                dc.b    $F2, $F3, $F4, $F5, $F5, $F6, $F7, $F8
                dc.b    $F9, $F9, $FA, $FB, $FC, $FD, $FE, $FF
                dc.b    $00, $01, $02, $03, $04, $05, $06, $07
                dc.b    $08, $08, $09, $0A, $0A, $0B, $0C, $0D
                dc.b    $0D, $0E, $0E, $0F, $0F, $10, $10, $11
                dc.b    $11, $12, $12, $13, $13, $14, $14, $15
                dc.b    $15, $16, $16, $17, $17, $18, $18, $18
                dc.b    $19, $19, $19, $19, $1A, $1A, $1A, $1A
                dc.b    $1B, $1B, $1B, $1B, $1C, $1C, $1C, $1C
                dc.b    $1C, $1C, $1D, $1D, $1D, $1D, $1D, $1D
                dc.b    $1D, $1E, $1E, $1E, $1E, $1E, $1E, $1E
                dc.b    $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F
                dc.b    $1F, $1F, $20, $20, $20, $20, $20, $20
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20     
;------------------------------------------------------------------------------- 
Offset_0x01C2B4:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                lea     ($FFFFF7B2).w, A2
                moveq   #$03, D6
                bsr.s   Offset_0x01C2CA
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                lea     ($FFFFF7B3).w, A2
                addq.b  #$01, D6
Offset_0x01C2CA:
                btst    D6, Obj_Status(A0)                               ; $0022
                bne     Offset_0x01C338
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                cmpi.w  #$FF40, D0
                blt.s   Offset_0x01C336
                cmpi.w  #$00C0, D0
                bge.s   Offset_0x01C336
                move.w  Obj_Y(A0), D0                                    ; $000C
                addi.w  #$003C, D0
                move.w  Obj_Y(A1), D2                                    ; $000C
                move.b  Obj_Height_2(A1), D1                             ; $0016
                ext.w   D1
                add.w   D2, D1
                addq.w  #$04, D1
                sub.w   D1, D0
                bhi.s   Offset_0x01C336
                cmpi.w  #$FFF0, D0
                bcs.s   Offset_0x01C336
                cmpi.b  #$06, Obj_Routine(A1)                            ; $0024
                bcc.s   Offset_0x01C336
                add.w   D0, D2
                addq.w  #$03, D2
                move.w  D2, Obj_Y(A1)                                    ; $000C
                move.b  #$01, Obj_Player_Flip_Flag(A1)                   ; $0029
                bsr     Player_On_Spiral                       ; Offset_0x014EE4
                move.w  #$0001, Obj_Ani_Number(A1)                       ; $001C
                move.b  #$00, (A2)
                tst.w   Obj_Inertia(A1)                                  ; $0014
                bne.s   Offset_0x01C336
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
Offset_0x01C336:
                rts
Offset_0x01C338:
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x01C372
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                addi.w  #$00C0, D0
                bmi.s   Offset_0x01C354
                cmpi.w  #$0180, D0
                bcs.s   Offset_0x01C38C
Offset_0x01C354:
                bclr    #$03, Obj_Status(A1)                             ; $0022
                bclr    D6, Obj_Status(A0)                               ; $0022
                move.b  #$00, Obj_P_Flips_Remaining(A1)                  ; $002C
                move.b  #$04, Obj_Player_Flip_Speed(A1)                  ; $002D
                bset    #$01, Obj_Status(A1)                             ; $0022
                rts
Offset_0x01C372:
                move.b  (A2), D0
                addi.b  #$20, D0
                cmpi.b  #$40, D0
                bcc.s   Offset_0x01C384
                asr.w   Obj_Speed_Y(A1)                                  ; $0012
                bra.s   Offset_0x01C354
Offset_0x01C384:
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                bra.s   Offset_0x01C354
Offset_0x01C38C:
                btst    #$03, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x01C336
                move.b  (A2), D0
                bsr     Jmp_05_To_CalcSine                     ; Offset_0x01C3CC
                muls.w  #$2800, D1
                swap.w  D1
                move.w  Obj_Y(A0), D2                                    ; $000C
                add.w   D1, D2
                moveq   #$00, D1
                move.b  Obj_Height_2(A1), D1                             ; $0016
                subi.w  #$0013, D1
                sub.w   D1, D2
                move.w  D2, Obj_Y(A1)                                    ; $000C
                move.b  (A2), D0
                move.b  D0, Obj_Flip_Angle(A1)                           ; $0027
                addq.b  #$04, (A2)
                tst.w   Obj_Inertia(A1)                                  ; $0014
                bne.s   Offset_0x01C3CA
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
Offset_0x01C3CA:
                rts                              
;===============================================================================
; Objeto 0x06 - Atributo invisível dos espirais na Emerald Hill / Metropolis
; <<<-
;===============================================================================