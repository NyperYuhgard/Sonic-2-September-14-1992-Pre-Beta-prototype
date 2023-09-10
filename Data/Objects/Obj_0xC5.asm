;===============================================================================
; Objeto 0xC5 - Chefe na Sky Fortress
; ->>>          
;===============================================================================  
; Offset_0x036306:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x036314(PC, D0), D1
                jmp     Offset_0x036314(PC, D1)   
;-------------------------------------------------------------------------------     
Offset_0x036314:
                dc.w    Offset_0x036320-Offset_0x036314
                dc.w    Offset_0x036332-Offset_0x036314
                dc.w    Offset_0x03643E-Offset_0x036314
                dc.w    Offset_0x036482-Offset_0x036314
                dc.w    Offset_0x0364CC-Offset_0x036314
                dc.w    Offset_0x0365C2-Offset_0x036314
;-------------------------------------------------------------------------------   
Offset_0x036320:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  Obj_Subtype(A0), D0                              ; $0028
                subi.b  #$88, D0
                move.b  D0, Obj_Routine(A0)                              ; $0024
                rts     
;------------------------------------------------------------------------------- 
Offset_0x036332:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036344(PC, D0), D1
                jsr     Offset_0x036344(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;------------------------------------------------------------------------------- 
Offset_0x036344:
                dc.w    Offset_0x036360-Offset_0x036344
                dc.w    Offset_0x036378-Offset_0x036344
                dc.w    Offset_0x0363CA-Offset_0x036344
                dc.w    Offset_0x0363D8-Offset_0x036344
                dc.w    Offset_0x0363E2-Offset_0x036344
                dc.w    Offset_0x0363CA-Offset_0x036344
                dc.w    Offset_0x0363D8-Offset_0x036344
                dc.w    Offset_0x03640E-Offset_0x036344
                dc.w    Offset_0x0363CA-Offset_0x036344
                dc.w    Offset_0x0363D8-Offset_0x036344
                dc.w    Offset_0x03641E-Offset_0x036344
                dc.w    Offset_0x0363CA-Offset_0x036344
                dc.w    Offset_0x0363D8-Offset_0x036344
                dc.w    Offset_0x036436-Offset_0x036344  
;-------------------------------------------------------------------------------   
Offset_0x036360:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  (Sonic_Level_Limits_Max_Y).w, Obj_Control_Var_02(A0)      ; $FFFFEECE; $002E
                move.w  #$0442, D0
                move.w  D0, (Sonic_Level_Limits_Max_Y).w             ; $FFFFEECE
                move.w  D0, ($FFFFEEC6).w
                rts 
;------------------------------------------------------------------------------- 
Offset_0x036378:
                bsr     Offset_0x030B18
                addi.w  #$0020, D2
                cmpi.w  #$0040, D2
                bcs.s   Offset_0x036388
                rts
Offset_0x036388:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0020, Obj_Timer(A0)                            ; $002A
                lea     (Load_SFz_Boss_Sub_Obj_0xC5), A2       ; Offset_0x0366AC
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                subi.w  #$0088, Obj_X(A1)                                ; $0008
                addi.w  #$0048, Obj_Y(A1)                                ; $000C
                lea     (Load_SFz_Boss_Sub_Obj_0xC5), A2       ; Offset_0x0366AC
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                addi.w  #$0088, Obj_X(A1)                                ; $0008
                addi.w  #$0048, Obj_Y(A1)                                ; $000C
                lea     (Load_SFz_Boss_Sub_Obj_0xC5_3), A2     ; Offset_0x0366B8
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                rts       
;------------------------------------------------------------------------------- 
Offset_0x0363CA:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0363D2
                rts
Offset_0x0363D2:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                rts 
;------------------------------------------------------------------------------- 
Offset_0x0363D8:
                lea     (SFz_Boss_Animate_Data), A1            ; Offset_0x0366EE
                bra     Jmp_1A_To_AnimateSprite                ; Offset_0x037620   
;------------------------------------------------------------------------------- 
Offset_0x0363E2:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0090, Obj_Timer(A0)                            ; $002A
                lea     (Load_SFz_Boss_Sub_Obj_0xC5_2), A2     ; Offset_0x0366B4
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                move.l  A1, A3
                lea     (Load_SFz_Boss_Sub_Obj_0xC5_1), A2     ; Offset_0x0366B0
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                move.w  A3, Obj_Control_Var_10(A1)                       ; $003C
                rts  
;------------------------------------------------------------------------------- 
Offset_0x03640E:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
Offset_0x036412:
                move.w  #$0080, Obj_Timer(A0)                            ; $002A
                clr.b   Obj_Ani_Number(A0)                               ; $001C
                rts  
;------------------------------------------------------------------------------- 
Offset_0x03641E:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0080, Obj_Timer(A0)                            ; $002A
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                bset    #$02, Obj_Status(A0)                             ; $0022
                rts  
;------------------------------------------------------------------------------- 
Offset_0x036436:
                move.b  #$0E, Obj_Routine_2(A0)                          ; $0025
                bra.s   Offset_0x036412    
;------------------------------------------------------------------------------- 
Offset_0x03643E:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x03644C(PC, D0), D1
                jmp     Offset_0x03644C(PC, D1)  
;-------------------------------------------------------------------------------    
Offset_0x03644C:
                dc.w    Offset_0x036450-Offset_0x03644C
                dc.w    Offset_0x03645E-Offset_0x03644C     
;------------------------------------------------------------------------------- 
Offset_0x036450:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$0C, Obj_Map_Id(A0)                             ; $001A
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;------------------------------------------------------------------------------- 
Offset_0x03645E:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                move.w  #$0013, D1
                move.w  #$0040, D2
                move.w  #$0080, D3
                move.w  (A7)+, D4
                bsr     Jmp_19_To_SolidObject                  ; Offset_0x03764A
                bchg    #01, Obj_Status(A0)                              ; $0022
                bne     Return_to_sub_routine                  ; Offset_0x031E96
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;------------------------------------------------------------------------------- 
Offset_0x036482:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x03649E(PC, D0), D1
                jsr     Offset_0x03649E(PC, D1)
                lea     (SFz_Boss_Animate_Data), A1            ; Offset_0x0366EE
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
;------------------------------------------------------------------------------- 
Offset_0x03649E:
                dc.w    Offset_0x0364A2-Offset_0x03649E
                dc.w    Offset_0x0364B4-Offset_0x03649E    
;------------------------------------------------------------------------------- 
Offset_0x0364A2:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$05, Obj_Map_Id(A0)                             ; $001A
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                rts          
;------------------------------------------------------------------------------- 
Offset_0x0364B4:
                move.w  Obj_Control_Var_10(A0), A1                       ; $003C
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), D0                                    ; $000C
                subi.w  #$0010, D0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                rts   
;------------------------------------------------------------------------------- 
Offset_0x0364CC:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x0364E8(PC, D0), D1
                jsr     Offset_0x0364E8(PC, D1)
                lea     (SFz_Boss_Animate_Data), A1            ; Offset_0x0366EE
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;------------------------------------------------------------------------------- 
Offset_0x0364E8:
                dc.w    Offset_0x0364F0-Offset_0x0364E8
                dc.w    Offset_0x03653A-Offset_0x0364E8
                dc.w    Offset_0x036554-Offset_0x0364E8
                dc.w    Offset_0x036582-Offset_0x0364E8    
;------------------------------------------------------------------------------- 
Offset_0x0364F0:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$07, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0040, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0090, Obj_Timer(A0)                            ; $002A
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                lea     Offset_0x036532(PC), A2
                lea     Obj_Control_Var_04(A0), A3                       ; $0030
                move.w  Obj_Y(A1), D0                                    ; $000C
                add.w   (A2)+, D0
                move.w  D0, (A3)+
                add.w   (A2)+, D0
                move.w  D0, (A3)+
                move.w  Obj_X(A1), D0                                    ; $0008
                add.w   (A2)+, D0
                move.w  D0, (A3)+
                add.w   (A2)+, D0
                move.w  D0, (A3)+
                rts        
;------------------------------------------------------------------------------- 
Offset_0x036532:
                dc.w    $000C, $0084, $FF90, $00E0     
;------------------------------------------------------------------------------- 
Offset_0x03653A:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x036544
                bra     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
Offset_0x036544:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0040, Obj_Timer(A0)                            ; $002A
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts     
;------------------------------------------------------------------------------- 
Offset_0x036554:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03655C
                rts
Offset_0x03655C:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FF00, Obj_Speed(A0)                            ; $0010
                move.w  #$0100, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                move.w  Obj_Control_Var_12(A1), A1                       ; $003E
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                rts   
;------------------------------------------------------------------------------- 
Offset_0x036582:
                move.w  Obj_Y(A0), D0                                    ; $000C
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x036596
                cmp.w   Obj_Control_Var_06(A0), D0                       ; $0032
                bcc.s   Offset_0x03659C
                bra     Offset_0x0365A0
Offset_0x036596:
                cmp.w   Obj_Control_Var_04(A0), D0                       ; $0030
                bcc.s   Offset_0x0365A0
Offset_0x03659C:
                neg.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x0365A0:
                move.w  Obj_X(A0), D0                                    ; $0008
                tst.w   Obj_Speed(A0)                                    ; $0010
                bmi.s   Offset_0x0365B4
                cmp.w   Obj_Control_Var_0A(A0), D0                       ; $0036
                bcc.s   Offset_0x0365BA
                bra     Offset_0x0365BE
Offset_0x0365B4:
                cmp.w   Obj_Control_Var_08(A0), D0                       ; $0034
                bcc.s   Offset_0x0365BE
Offset_0x0365BA:
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x0365BE:
                bra     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656  
;------------------------------------------------------------------------------- 
Offset_0x0365C2:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x0365D8(PC, D0), D1
                jsr     Offset_0x0365D8(PC, D1)
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;------------------------------------------------------------------------------- 
Offset_0x0365D8:
                dc.w    Offset_0x0365E2-Offset_0x0365D8
                dc.w    Offset_0x0365F2-Offset_0x0365D8
                dc.w    Offset_0x036612-Offset_0x0365D8
                dc.w    Offset_0x03662A-Offset_0x0365D8
                dc.w    Offset_0x036644-Offset_0x0365D8     
;------------------------------------------------------------------------------- 
Offset_0x0365E2:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                subq.w  #$04, Obj_Y(A0)                                  ; $000C
                rts   
;------------------------------------------------------------------------------- 
Offset_0x0365F2:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                bclr    #$02, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x036600
                rts
Offset_0x036600:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0010, Obj_Timer(A0)                            ; $002A
                move.w  #$0100, Obj_Speed_Y(A0)                          ; $0012
                rts   
;------------------------------------------------------------------------------- 
Offset_0x036612:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03661A
                rts
Offset_0x03661A:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0070, Obj_Timer(A0)                            ; $002A
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts  
;------------------------------------------------------------------------------- 
Offset_0x03662A:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x036632
                rts
Offset_0x036632:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0010, Obj_Timer(A0)                            ; $002A
                move.w  #$FF00, Obj_Speed_Y(A0)                          ; $0012
                rts 
;------------------------------------------------------------------------------- 
Offset_0x036644:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03664C
                rts
Offset_0x03664C:
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts                   
;-------------------------------------------------------------------------------  
; Offset_0x036658:   ; Não usado
                tst.b   Obj_Boss_Hit(A0)                                 ; $0021
                beq.s   Offset_0x036698
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                bne.s   Offset_0x036696
                tst.b   Obj_Control_Var_04(A0)                           ; $0030
                bne.s   Offset_0x03667A
                move.b  #$20, Obj_Control_Var_04(A0)                     ; $0030
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x03667A:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x036688
                move.w  #$0EEE, D0
Offset_0x036688:
                move.w  D0, (A1)
                subq.b  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bne.s   Offset_0x036696
                move.b  #$1A, Obj_Col_Flags(A0)                          ; $0020
Offset_0x036696:
                rts
Offset_0x036698:
                moveq   #$64, D0
                bsr     AddPoints                              ; Offset_0x0394D0
                move.w  #$00EF, Obj_Timer(A0)                            ; $002A
                move.b  #$0A, Obj_Routine(A0)                            ; $0024
                rts
;-------------------------------------------------------------------------------  
Load_SFz_Boss_Sub_Obj_0xC5:                                    ; Offset_0x0366AC  
                dc.w    $002A
                dc.b    $C5, $8C
;------------------------------------------------------------------------------- 
Load_SFz_Boss_Sub_Obj_0xC5_1:                                  ; Offset_0x0366B0   
                dc.w    $003E
                dc.b    $C5, $8E
;------------------------------------------------------------------------------- 
Load_SFz_Boss_Sub_Obj_0xC5_2:                                  ; Offset_0x0366B4 
                dc.w    $003C
                dc.b    $C5, $90 
;------------------------------------------------------------------------------- 
Load_SFz_Boss_Sub_Obj_0xC5_3:                                  ; Offset_0x0366B8
                dc.w    $003A
                dc.b    $C5, $92  
;-------------------------------------------------------------------------------   
Obj_0xC5_Ptr:                                                  ; Offset_0x0366BC
                dc.l    SFz_Boss_Mappings                      ; Offset_0x03670E
                dc.w    $03F9
                dc.b    $04, $04, $20, $09         
;------------------------------------------------------------------------------- 
Obj_0xC5_01_Ptr:                                               ; Offset_0x0366C6
                dc.l    SFz_Boss_Mappings                      ; Offset_0x03670E
                dc.w    $03F9
                dc.b    $04, $04, $08, $00   
;------------------------------------------------------------------------------- 
Obj_0xC5_02_Ptr:                                               ; Offset_0x0366D0
                dc.l    SFz_Boss_Mappings                      ; Offset_0x03670E
                dc.w    $03F9
                dc.b    $04, $05, $10, $00 
;------------------------------------------------------------------------------- 
Obj_0xC5_03_Ptr:                                               ; Offset_0x0366DA
                dc.l    SFz_Boss_Mappings                      ; Offset_0x03670E
                dc.w    $03F9
                dc.b    $04, $05, $10, $00 
;-------------------------------------------------------------------------------      
Obj_0xC5_04_Ptr:                                               ; Offset_0x0366E4
                dc.l    SFz_Boss_Mappings                      ; Offset_0x03670E
                dc.w    $03F9
                dc.b    $04, $05, $10, $00  
;------------------------------------------------------------------------------- 
SFz_Boss_Animate_Data:                                         ; Offset_0x0366EE
                dc.w    Offset_0x0366F6-SFz_Boss_Animate_Data
                dc.w    Offset_0x0366FC-SFz_Boss_Animate_Data
                dc.w    Offset_0x036702-SFz_Boss_Animate_Data
                dc.w    Offset_0x036706-SFz_Boss_Animate_Data
Offset_0x0366F6:
                dc.b    $03, $00, $01, $02, $03, $FA
Offset_0x0366FC:
                dc.b    $03, $03, $02, $01, $00, $FA
Offset_0x036702:
                dc.b    $03, $05, $06, $FF
Offset_0x036706:
                dc.b    $03, $07, $08, $09, $0A, $0B, $FF, $00    
;------------------------------------------------------------------------------- 
SFz_Boss_Mappings:                                             ; Offset_0x03670E
                dc.w    Offset_0x036730-SFz_Boss_Mappings
                dc.w    Offset_0x036752-SFz_Boss_Mappings
                dc.w    Offset_0x036774-SFz_Boss_Mappings
                dc.w    Offset_0x036796-SFz_Boss_Mappings
                dc.w    Offset_0x0367B8-SFz_Boss_Mappings
                dc.w    Offset_0x0367CA-SFz_Boss_Mappings
                dc.w    Offset_0x0367DC-SFz_Boss_Mappings
                dc.w    Offset_0x0367EE-SFz_Boss_Mappings
                dc.w    Offset_0x036800-SFz_Boss_Mappings
                dc.w    Offset_0x036812-SFz_Boss_Mappings
                dc.w    Offset_0x036824-SFz_Boss_Mappings
                dc.w    Offset_0x036836-SFz_Boss_Mappings
                dc.w    Offset_0x036848-SFz_Boss_Mappings
                dc.w    Offset_0x03686A-SFz_Boss_Mappings
                dc.w    Offset_0x036874-SFz_Boss_Mappings
                dc.w    Offset_0x03687E-SFz_Boss_Mappings
                dc.w    Offset_0x036888-SFz_Boss_Mappings
Offset_0x036730:
                dc.w    $0004
                dc.l    $F80CA000, $A000FFE0
                dc.l    $F80CA004, $A0020000
                dc.l    $0009A008, $A004FFE8
                dc.l    $0009A808, $A8040000
Offset_0x036752:
                dc.w    $0004
                dc.l    $F80CA000, $A000FFE0
                dc.l    $F80CA800, $A8000000
                dc.l    $0009A00E, $A007FFE8
                dc.l    $0009A80E, $A8070000
Offset_0x036774:
                dc.w    $0004
                dc.l    $F80CA000, $A000FFE0
                dc.l    $F80CA800, $A8000000
                dc.l    $0009A014, $A00AFFE8
                dc.l    $0009A814, $A80A0000
Offset_0x036796:
                dc.w    $0004
                dc.l    $F80CA000, $A000FFE0
                dc.l    $F80CA800, $A8000000
                dc.l    $0008A01A, $A00DFFE8
                dc.l    $0008A81A, $A80D0000
Offset_0x0367B8:
                dc.w    $0002
                dc.l    $F805401D, $400EFFF0
                dc.l    $F805481D, $480E0000
Offset_0x0367CA:
                dc.w    $0002
                dc.l    $F8050021, $0010FFF0
                dc.l    $F8050821, $08100000
Offset_0x0367DC:
                dc.w    $0002
                dc.l    $F8052021, $2010FFF0
                dc.l    $F8052821, $28100000
Offset_0x0367EE:
                dc.w    $0002
                dc.l    $F8052025, $2012FFF0
                dc.l    $F8052825, $28120000
Offset_0x036800:
                dc.w    $0002
                dc.l    $F8052029, $2014FFF0
                dc.l    $F805202D, $20160000
Offset_0x036812:
                dc.w    $0002
                dc.l    $F8052031, $2018FFF0
                dc.l    $F8052035, $201A0000
Offset_0x036824:
                dc.w    $0002
                dc.l    $F8052835, $281AFFF0
                dc.l    $F8052831, $28180000
Offset_0x036836:
                dc.w    $0002
                dc.l    $F805282D, $2816FFF0
                dc.l    $F8052829, $28140000
Offset_0x036848:
                dc.w    $0004
                dc.l    $C007A039, $A01CFFF8
                dc.l    $E007A039, $A01CFFF8
                dc.l    $0007A039, $A01CFFF8
                dc.l    $2007A039, $A01CFFF8
Offset_0x03686A:
                dc.w    $0001
                dc.l    $F8054041, $4020FFF8
Offset_0x036874:
                dc.w    $0001
                dc.l    $F8054045, $4022FFF8
Offset_0x03687E:
                dc.w    $0001
                dc.l    $F8054049, $4024FFF8
Offset_0x036888:
                dc.w    $0001
                dc.l    $F8055841, $5820FFF8
;-------------------------------------------------------------------------------
; Offset_0x036892:  ; Mapeamento não usado
                dc.w    $0001
                dc.l    $F8055849, $5824FFF8                
;===============================================================================   
; Objeto 0xC5 - Chefe na Sky Fortress
; <<<-
;===============================================================================