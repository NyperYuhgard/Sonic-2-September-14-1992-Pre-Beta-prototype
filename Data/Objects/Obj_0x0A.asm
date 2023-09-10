;===============================================================================
; Objeto 0x0A - Objeto de controle do Sonic / Miles embaixo da água
; ->>>        
;===============================================================================     
; Offset_0x017E80:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x017E8E(PC, D0), D1
                jmp     Offset_0x017E8E(PC, D1)          
;-------------------------------------------------------------------------------
Offset_0x017E8E:
                dc.w    Offset_0x017EA0-Offset_0x017E8E
                dc.w    Offset_0x017EF8-Offset_0x017E8E
                dc.w    Offset_0x017F04-Offset_0x017E8E
                dc.w    Offset_0x017F7A-Offset_0x017E8E
                dc.w    Offset_0x017F8E-Offset_0x017E8E
                dc.w    Offset_0x018166-Offset_0x017E8E
                dc.w    Offset_0x017F94-Offset_0x017E8E
                dc.w    Offset_0x017F6E-Offset_0x017E8E
                dc.w    Offset_0x017F8E-Offset_0x017E8E
;-------------------------------------------------------------------------------
Offset_0x017EA0:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Sonic_Underwater_Mappings, Obj_Map(A0) ; Offset_0x01A678, $0004
                tst.b   Obj_Control_Var_13(A0)                           ; $003F
                beq.s   Offset_0x017EBA
                move.l  #Miles_Underwater_Mappings, Obj_Map(A0) ; Offset_0x01A69A, $0004
Offset_0x017EBA:
                move.w  #$855B, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$84, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x017EE8
                addq.b  #$08, Obj_Routine(A0)                            ; $0024
                andi.w  #$007F, D0
                move.b  D0, Obj_Control_Var_07(A0)                       ; $0033
                bra     Offset_0x018166
Offset_0x017EE8:
                move.b  D0, Obj_Ani_Number(A0)                           ; $001C
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                move.w  #$FF78, Obj_Speed_Y(A0)                          ; $0012
;-------------------------------------------------------------------------------                
Offset_0x017EF8:
                lea     (Bubbles_Animate_Data), A1             ; Offset_0x01839A
                jsr     (AnimateSprite)                        ; Offset_0x01212E
;-------------------------------------------------------------------------------                
Offset_0x017F04:
                move.w  (Water_Level).w, D0                          ; $FFFFF646
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcs.s   Offset_0x017F2A
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                addq.b  #$07, Obj_Ani_Number(A0)                         ; $001C
                cmpi.b  #$0D, Obj_Ani_Number(A0)                         ; $001C
                beq.s   Offset_0x017F7A
                bcs.s   Offset_0x017F7A
                move.b  #$0D, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x017F7A
Offset_0x017F2A:
                tst.b   ($FFFFF7C7).w
                beq.s   Offset_0x017F34
                addq.w  #$04, Obj_Control_Var_04(A0)                     ; $0030
Offset_0x017F34:
                move.b  Obj_Angle(A0), D0                                ; $0026
                addq.b  #$01, Obj_Angle(A0)                              ; $0026
                andi.w  #$007F, D0
                lea     (Offset_0x018020), A1
                move.b  $00(A1, D0), D0
                ext.w   D0
                add.w   Obj_Control_Var_04(A0), D0                       ; $0030
                move.w  D0, Obj_X(A0)                                    ; $0008
                bsr.s   Offset_0x017FD4
                jsr     (SpeedToPos)                           ; Offset_0x011F96
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x017F68
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x017F68:
                jmp     (DeleteObject)                         ; Offset_0x0120D0
;-------------------------------------------------------------------------------                
Offset_0x017F6E:
                move.l  Obj_Control_Var_10(A0), A2                       ; $003C
                cmpi.b  #$0C, Obj_Subtype(A2)                            ; $0028
                bhi.s   Offset_0x017F8E
;-------------------------------------------------------------------------------                
Offset_0x017F7A:
                bsr.s   Offset_0x017FD4
                lea     (Bubbles_Animate_Data), A1             ; Offset_0x01839A
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x017F8E:
                jmp     (DeleteObject)                         ; Offset_0x0120D0
;-------------------------------------------------------------------------------                
Offset_0x017F94:
                move.l  Obj_Control_Var_10(A0), A2                       ; $003C
                cmpi.b  #$0C, Obj_Subtype(A2)                            ; $0028
                bhi.s   Offset_0x017FCE
                subq.w  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bne.s   Offset_0x017FB2
                move.b  #$0E, Obj_Routine(A0)                            ; $0024
                addq.b  #$07, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x017F7A
Offset_0x017FB2:
                lea     (Bubbles_Animate_Data), A1             ; Offset_0x01839A
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                bsr     Load_Oxygen_Numbers_Dynamic_PLC        ; Offset_0x018120
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x017FCE
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x017FCE:
                jmp     (DeleteObject)                         ; Offset_0x0120D0
Offset_0x017FD4:
                tst.w   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x01801E
                subq.w  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bne.s   Offset_0x01801E
                cmpi.b  #$07, Obj_Ani_Number(A0)                         ; $001C
                bcc.s   Offset_0x01801E
                move.w  #$000F, Obj_Control_Var_0C(A0)                   ; $0038
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                move.b  #$80, Obj_Flags(A0)                              ; $0001
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFEE00).w, D0
                addi.w  #$0080, D0
                move.w  D0, Obj_X(A0)                                    ; $0008
                move.w  Obj_Y(A0), D0                                    ; $000C
                sub.w   ($FFFFEE04).w, D0
                addi.w  #$0080, D0
                move.w  D0, Obj_Sub_Y(A0)                                ; $000A
                move.b  #$0C, Obj_Routine(A0)                            ; $0024
Offset_0x01801E:
                rts   
;-------------------------------------------------------------------------------  
Offset_0x018020:
                dc.b    $00, $00, $00, $00, $00, $00, $01, $01
                dc.b    $01, $01, $01, $02, $02, $02, $02, $02
                dc.b    $02, $02, $03, $03, $03, $03, $03, $03
                dc.b    $03, $03, $03, $03, $03, $03, $03, $03
                dc.b    $03, $03, $03, $03, $03, $03, $03, $03
                dc.b    $03, $03, $03, $03, $03, $03, $03, $02
                dc.b    $02, $02, $02, $02, $02, $02, $01, $01
                dc.b    $01, $01, $01, $00, $00, $00, $00, $00
                dc.b    $00, $FF, $FF, $FF, $FF, $FF, $FE, $FE
                dc.b    $FE, $FE, $FE, $FD, $FD, $FD, $FD, $FD
                dc.b    $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FD
                dc.b    $FD, $FD, $FD, $FD, $FD, $FD, $FE, $FE
                dc.b    $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF
                dc.b    $00, $00, $00, $00, $00, $00, $01, $01
                dc.b    $01, $01, $01, $02, $02, $02, $02, $02
                dc.b    $02, $02, $03, $03, $03, $03, $03, $03
                dc.b    $03, $03, $03, $03, $03, $03, $03, $03
                dc.b    $03, $03, $03, $03, $03, $03, $03, $03
                dc.b    $03, $03, $03, $03, $03, $03, $03, $02
                dc.b    $02, $02, $02, $02, $02, $02, $01, $01
                dc.b    $01, $01, $01, $00, $00, $00, $00, $00
                dc.b    $00, $FF, $FF, $FF, $FF, $FF, $FE, $FE
                dc.b    $FE, $FE, $FE, $FD, $FD, $FD, $FD, $FD
                dc.b    $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FD
                dc.b    $FD, $FD, $FD, $FD, $FD, $FD, $FE, $FE
                dc.b    $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF
;------------------------------------------------------------------------------- 
Load_Oxygen_Numbers_Dynamic_PLC:                               ; Offset_0x018120
                moveq   #$00, D1
                move.b  Obj_Map_Id(A0), D1                               ; $001A
                cmpi.b  #$08, D1
                bcs.s   Offset_0x018164
                cmpi.b  #$0E, D1
                bcc.s   Offset_0x018164
                cmp.b   Obj_Control_Var_02(A0), D1                       ; $002E
                beq.s   Offset_0x018164
                move.b  D1, Obj_Control_Var_02(A0)                       ; $002E
                subq.w  #$08, D1
                move.w  D1, D0
                add.w   D1, D1
                add.w   D0, D1
                lsl.w   #$06, D1
                addi.l  #Art_Oxygen_Numbers, D1                ; Offset_0x07EEAC
                move.w  #$9380, D2
                tst.b   Obj_Control_Var_13(A0)                           ; $003F
                beq.s   Offset_0x01815A
                move.w  #$9180, D2
Offset_0x01815A:
                move.w  #$0060, D3
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x0019E4
Offset_0x018164:
                rts
;-------------------------------------------------------------------------------                
Offset_0x018166:
                move.l  Obj_Control_Var_10(A0), A2                       ; $003C
                tst.w   Obj_Control_Var_00(A0)                           ; $002C
                bne     Offset_0x01825C
                cmpi.b  #$06, Obj_Routine(A2)                            ; $0024
                bcc     Offset_0x018368
                btst    #$06, Obj_Status(A2)                             ; $0022
                beq     Offset_0x018368
                subq.w  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bpl     Offset_0x018280
                move.w  #$003B, Obj_Control_Var_0C(A0)                   ; $0038
                move.w  #$0001, Obj_Control_Var_0A(A0)                   ; $0036
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                andi.w  #$0001, D0
                move.b  D0, Obj_Control_Var_08(A0)                       ; $0034
                moveq   #$00, D0
                move.b  Obj_Subtype(A2), D0                              ; $0028
                cmpi.w  #$0019, D0
                beq.s   Offset_0x0181E6
                cmpi.w  #$0014, D0
                beq.s   Offset_0x0181E6
                cmpi.w  #$000F, D0
                beq.s   Offset_0x0181E6
                cmpi.w  #$000C, D0
                bhi.s   Offset_0x0181F0
                bne.s   Offset_0x0181D2
                move.w  #$009F, D0
                jsr     (Play_Music)                           ; Offset_0x00190C
Offset_0x0181D2:
                subq.b  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x0181F0
                move.b  Obj_Control_Var_07(A0), Obj_Control_Var_06(A0); $0032, $0033
                bset    #$07, Obj_Control_Var_0A(A0)                     ; $0036
                bra.s   Offset_0x0181F0
Offset_0x0181E6:
                move.w  #$00C2, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x0181F0:
                subq.b  #$01, Obj_Subtype(A2)                            ; $0028
                bcc     Offset_0x01827E
                move.b  #$81, Obj_Timer(A2)                              ; $002A
                move.w  #$00B2, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                move.b  #$0A, Obj_Control_Var_08(A0)                     ; $0034
                move.w  #$0001, Obj_Control_Var_0A(A0)                   ; $0036
                move.w  #$0078, Obj_Control_Var_00(A0)                   ; $002C
                move.l  A2, A1
                bsr     Resume_Music                           ; Offset_0x01836A
                move.l  A0, -(A7)
                move.l  A2, A0
                bsr     Sonic_ResetOnFloor                     ; Offset_0x015FDA
                move.b  #$17, Obj_Ani_Number(A0)                         ; $001C
                bset    #$01, Obj_Status(A0)                             ; $0022
                bset    #$07, Obj_Art_VRAM(A0)                           ; $0002
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  #$0000, Obj_Inertia(A0)                          ; $0014
                move.l  (A7)+, A0
                cmpa.w  #Obj_Memory_Address, A2                          ; $B000
                bne.s   Offset_0x01825A
                move.b  #$01, ($FFFFEEDC).w
Offset_0x01825A:
                rts
Offset_0x01825C:
                subq.w  #$01, Obj_Control_Var_00(A0)                     ; $002C
                bne.s   Offset_0x01826A
                move.b  #$06, Obj_Routine(A2)                            ; $0024
                rts
Offset_0x01826A:
                move.l  A0, -(A7)
                move.l  A2, A0
                jsr     (SpeedToPos)                           ; Offset_0x011F96
                addi.w  #$0010, Obj_Speed_Y(A0)                          ; $0012
                move.l  (A7)+, A0
                bra.s   Offset_0x018280
Offset_0x01827E:
                bra.s   Offset_0x018290
Offset_0x018280:
                tst.w   Obj_Control_Var_0A(A0)                           ; $0036
                beq     Offset_0x018368
                subq.w  #$01, Obj_Control_Var_0E(A0)                     ; $003A
                bpl     Offset_0x018368
Offset_0x018290:
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                andi.w  #$000F, D0
                move.w  D0, Obj_Control_Var_0E(A0)                       ; $003A
                jsr     (SingleObjectLoad)                     ; Offset_0x013BAA
                bne     Offset_0x018368
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.w  Obj_X(A2), Obj_X(A1)                      ; $0008, $0008
                moveq   #$06, D0
                btst    #$00, Obj_Status(A2)                             ; $0022
                beq.s   Offset_0x0182C6
                neg.w   D0
                move.b  #$40, Obj_Angle(A1)                              ; $0026
Offset_0x0182C6:
                add.w   D0, Obj_X(A1)                                    ; $0008
                move.w  Obj_Y(A2), Obj_Y(A1)                      ; $000C, $000C
                move.l  Obj_Control_Var_10(A0), Obj_Control_Var_10(A1); $003C, $003C
                move.b  #$06, Obj_Subtype(A1)                            ; $0028
                tst.w   Obj_Control_Var_00(A0)                           ; $002C
                beq     Offset_0x018318
                andi.w  #$0007, Obj_Control_Var_0E(A0)                   ; $003A
                addi.w  #$0000, Obj_Control_Var_0E(A0)                   ; $003A
                move.w  Obj_Y(A2), D0                                    ; $000C
                subi.w  #$000C, D0
                move.w  D0, Obj_Y(A1)                                    ; $000C
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                move.b  D0, Obj_Angle(A1)                                ; $0026
                move.w  ($FFFFFE04).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x01835E
                move.b  #$0E, Obj_Subtype(A1)                            ; $0028
                bra.s   Offset_0x01835E
Offset_0x018318:
                btst    #$07, Obj_Control_Var_0A(A0)                     ; $0036
                beq.s   Offset_0x01835E
                moveq   #$00, D2
                move.b  Obj_Subtype(A2), D2                              ; $0028
                lsr.w   #$01, D2
                jsr     (PseudoRandomNumber)                   ; Offset_0x003944
                andi.w  #$0003, D0
                bne.s   Offset_0x018346
                bset    #$06, Obj_Control_Var_0A(A0)                     ; $0036
                bne.s   Offset_0x01835E
                move.b  D2, Obj_Subtype(A1)                              ; $0028
                move.w  #$001C, Obj_Control_Var_0C(A1)                   ; $0038
Offset_0x018346:
                tst.b   Obj_Control_Var_08(A0)                           ; $0034
                bne.s   Offset_0x01835E
                bset    #$06, Obj_Control_Var_0A(A0)                     ; $0036
                bne.s   Offset_0x01835E
                move.b  D2, Obj_Subtype(A1)                              ; $0028
                move.w  #$001C, Obj_Control_Var_0C(A1)                   ; $0038
Offset_0x01835E:
                subq.b  #$01, Obj_Control_Var_08(A0)                     ; $0034
                bpl.s   Offset_0x018368
                clr.w   Obj_Control_Var_0A(A0)                           ; $0036
Offset_0x018368:
                rts                                                     
;===============================================================================   
; Objeto 0x0A - Objeto de controle do Sonic / Miles embaixo da água
; <<<-        
;===============================================================================