;===============================================================================
; Objeto 0x4B - Inimigo Buzzer na Green Hill
; ->>> 
;===============================================================================
; Offset_0x02890C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02891A(PC, D0), D1
                jmp     Offset_0x02891A(PC, D1)
;-------------------------------------------------------------------------------                    
Offset_0x02891A:                 
                dc.w    Offset_0x02896C-Offset_0x02891A
                dc.w    Offset_0x028A18-Offset_0x02891A
                dc.w    Offset_0x028934-Offset_0x02891A
                dc.w    Offset_0x028922-Offset_0x02891A
;-------------------------------------------------------------------------------
Offset_0x028922:
                bsr     Jmp_15_To_SpeedToPos                   ; Offset_0x028C20
                lea     (Buzzer_AnimateData), A1               ; Offset_0x028B62                            
                bsr     Jmp_10_To_AnimateSprite                ; Offset_0x028C08
                bra     Jmp_00_MarkObjGone_4                   ; Offset_0x028C14  
;------------------------------------------------------------------------------- 
Offset_0x028934:
                move.l  Obj_Timer(A0), A1                                ; $002A
                tst.b   (A1)
                beq     Jmp_1C_To_DeleteObject                 ; Offset_0x028BFC
                tst.w   Obj_Control_Var_04(A1)                           ; $0030
                bmi.s   Offset_0x028946
                rts
Offset_0x028946:
                move.w  Obj_X(A1), Obj_X(A0)                             ; $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                             ; $000C
                move.b  Obj_Status(A1), Obj_Status(A0)                   ; $0022
                move.b  Obj_Flags(A1), Obj_Flags(A0)                     ; $0001
                lea     (Buzzer_AnimateData), A1               ; Offset_0x028B62
                bsr     Jmp_10_To_AnimateSprite                ; Offset_0x028C08
                bra     Jmp_00_MarkObjGone_4                   ; Offset_0x028C14
;------------------------------------------------------------------------------- 
Offset_0x02896C:
                move.l  #Buzzer_Mappings, Obj_Map(A0)   ; Offset_0x028B7E, $0004
                move.w  #$03D2, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_33_To_ModifySpriteAttr_2P          ; Offset_0x028C1A
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$0A, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$10, Obj_Height_2(A0)                           ; $0016
                move.b  #$18, Obj_Width_2(A0)                            ; $0017
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Jmp_11_To_SingleObjectLoad_2           ; Offset_0x028C02
                bne.s   Offset_0x028A16
                move.b  #$4B, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.l  #Buzzer_Mappings, Obj_Map(A1)   ; Offset_0x028B7E, $0004
                move.w  #$03D2, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_04_To_ModifySpriteAttr_2P_A1       ; Offset_0x028C0E
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  Obj_Status(A0), Obj_Status(A1)                   ; $0022
                move.b  Obj_Flags(A0), Obj_Flags(A1)                     ; $0001
                move.b  #$01, Obj_Ani_Number(A1)                         ; $001C
                move.l  A0, Obj_Timer(A1)                                ; $002A
                move.w  Obj_X(A0), Obj_X(A1)                             ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                             ; $000C
                move.w  #$0100, Obj_Control_Var_02(A0)                   ; $002E
                move.w  #$FF00, Obj_Speed(A0)                            ; $0010
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x028A16
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x028A16:
                rts
;------------------------------------------------------------------------------- 
Offset_0x028A18:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x028A34(PC, D0), D1
                jsr     Offset_0x028A34(PC, D1)
                lea     (Buzzer_AnimateData), A1               ; Offset_0x028B62
                bsr     Jmp_10_To_AnimateSprite                ; Offset_0x028C08
                bra     Jmp_00_MarkObjGone_4                   ; Offset_0x028C14
;-------------------------------------------------------------------------------                 
Offset_0x028A34:                                   
                dc.w    Offset_0x028A38-Offset_0x028A34
                dc.w    Offset_0x028AC8-Offset_0x028A34        
;------------------------------------------------------------------------------- 
Offset_0x028A38:
                bsr     Offset_0x028A7A
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                cmpi.w  #$000F, D0
                beq.s   Offset_0x028A5E
                tst.w   D0
                bpl.s   Offset_0x028A5C
                subq.w  #$01, Obj_Control_Var_02(A0)                     ; $002E
                bgt     Jmp_15_To_SpeedToPos                   ; Offset_0x028C20
                move.w  #$001E, Obj_Control_Var_04(A0)                   ; $0030
Offset_0x028A5C:
                rts
Offset_0x028A5E:
                sf      Obj_Control_Var_06(A0)                           ; $0032
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Flags(A0)                               ; $0001
                bchg    #00, Obj_Status(A0)                              ; $0022
                move.w  #$0100, Obj_Control_Var_02(A0)                   ; $002E
                rts
Offset_0x028A7A:
                tst.b   Obj_Control_Var_06(A0)                           ; $0032
                bne     Offset_0x028AC6
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                move.w  D0, D1
                bpl.s   Offset_0x028A90
                neg.w   D0
Offset_0x028A90:
                cmpi.w  #$0028, D0
                blt.s   Offset_0x028AC6
                cmpi.w  #$0030, D0
                bgt.s   Offset_0x028AC6
                tst.w   D1
                bpl.s   Offset_0x028AAA
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x028AC6
                bra.s   Offset_0x028AB2
Offset_0x028AAA:
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x028AC6
Offset_0x028AB2:
                st      Obj_Control_Var_06(A0)                           ; $0032
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0032, Obj_Control_Var_08(A0)                   ; $0034
Offset_0x028AC6:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x028AC8:
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                subq.w  #$01, D0
                blt.s   Offset_0x028ADC
                move.w  D0, Obj_Control_Var_08(A0)                       ; $0034
                cmpi.w  #$0014, D0
                beq.s   Offset_0x028AE2
                rts
Offset_0x028ADC:
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                rts
Offset_0x028AE2:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x013BC0
                bne.s   Offset_0x028B5C
                move.b  #$4B, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Routine(A1)                            ; $0024
                move.l  #Buzzer_Mappings, Obj_Map(A1)   ; Offset_0x028B7E, $0004
                move.w  #$03D2, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_04_To_ModifySpriteAttr_2P_A1       ; Offset_0x028C0E
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$98, Obj_Col_Flags(A1)                          ; $0020
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  Obj_Status(A0), Obj_Status(A1)                   ; $0022
                move.b  Obj_Flags(A0), Obj_Flags(A1)                     ; $0001
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.w  Obj_X(A0), Obj_X(A1)                             ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                             ; $000C
                addi.w  #$0018, Obj_Y(A1)                                ; $000C
                move.w  #$000D, D0
                move.w  #$0180, Obj_Speed_Y(A1)                          ; $0012
                move.w  #$FE80, Obj_Speed(A1)                            ; $0010
                btst    #$00, Obj_Flags(A1)                              ; $0001
                beq.s   Offset_0x028B5C
                neg.w   Obj_Speed(A1)                                    ; $0010
                neg.w   D0
Offset_0x028B5C:
                add.w   D0, Obj_X(A1)                                    ; $0008
                rts
;-------------------------------------------------------------------------------
Buzzer_AnimateData:                                            ; Offset_0x028B62  
                dc.w    Offset_0x028B6A-Buzzer_AnimateData
                dc.w    Offset_0x028B6D-Buzzer_AnimateData
                dc.w    Offset_0x028B71-Buzzer_AnimateData
                dc.w    Offset_0x028B75-Buzzer_AnimateData
Offset_0x028B6A:
                dc.b    $0F, $00, $FF
Offset_0x028B6D:
                dc.b    $02, $03, $04, $FF
Offset_0x028B71:
                dc.b    $03, $05, $06, $FF
Offset_0x028B75:
                dc.b    $09, $01, $01, $01, $01, $01, $FD, $00, $00                
;-------------------------------------------------------------------------------
Buzzer_Mappings:                                               ; Offset_0x028B7E 
                dc.w    Offset_0x028B8C-Buzzer_Mappings
                dc.w    Offset_0x028B9E-Buzzer_Mappings
                dc.w    Offset_0x028BB8-Buzzer_Mappings
                dc.w    Offset_0x028BD2-Buzzer_Mappings
                dc.w    Offset_0x028BDC-Buzzer_Mappings
                dc.w    Offset_0x028BE6-Buzzer_Mappings
                dc.w    Offset_0x028BF0-Buzzer_Mappings
Offset_0x028B8C:
                dc.w    $0002
                dc.l    $F8090000, $0000FFE8, $F8090006, $00030000
Offset_0x028B9E:
                dc.w    $0003
                dc.l    $F8090000, $0000FFE8, $F805000C, $00060000
                dc.l    $08050010, $00080002
Offset_0x028BB8:
                dc.w    $0003
                dc.l    $F8090000, $0000FFE8, $F805000C, $00060000
                dc.l    $08050014, $000A0002
Offset_0x028BD2:
                dc.w    $0001
                dc.l    $F0010014, $000A0004
Offset_0x028BDC:
                dc.w    $0001
                dc.l    $F0010016, $000B0004
Offset_0x028BE6:
                dc.w    $0001
                dc.l    $F8010018, $000CFFF4
Offset_0x028BF0:
                dc.w    $0001
                dc.l    $F801001A, $000DFFF4
;===============================================================================
; Objeto 0x4B - Inimigo Buzzer na Green Hill
; <<<- 
;===============================================================================