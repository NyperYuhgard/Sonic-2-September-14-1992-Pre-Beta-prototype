;===============================================================================
; Object 0xAF - Metal Sonic - Death Egg
; ->>>        
;===============================================================================     
; Offset_0x033B0A:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x033B18(PC, D0), D1
                jmp     Offset_0x033B18(PC, D1)   
;-------------------------------------------------------------------------------        
Offset_0x033B18:
                dc.w    Offset_0x033B3A-Offset_0x033B18
                dc.w    Offset_0x033B88-Offset_0x033B18
                dc.w    Offset_0x033BB0-Offset_0x033B18
                dc.w    Offset_0x033BEC-Offset_0x033B18
                dc.w    Offset_0x033C50-Offset_0x033B18
                dc.w    Offset_0x033F0A-Offset_0x033B18
                dc.w    Offset_0x033F2A-Offset_0x033B18
                dc.w    Offset_0x033F3C-Offset_0x033B18
                dc.w    Offset_0x033F52-Offset_0x033B18
                dc.w    Offset_0x033F54-Offset_0x033B18
                dc.w    Offset_0x033F6C-Offset_0x033B18
                dc.w    Offset_0x033F74-Offset_0x033B18
                dc.w    Offset_0x033F7C-Offset_0x033B18
                dc.w    Offset_0x033F94-Offset_0x033B18
                dc.w    Offset_0x033FAC-Offset_0x033B18
                dc.w    Offset_0x033FBA-Offset_0x033B18
                dc.w    Offset_0x03400A-Offset_0x033B18  
;-------------------------------------------------------------------------------     
Offset_0x033B3A:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$1B, Obj_Height_2(A0)                           ; $0016
                move.b  #$10, Obj_Width_2(A0)                            ; $0017
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Col_Prop(A0)                           ; $0021
                lea     (Load_Metal_Sonic_Sub_Obj_0xAF), A2    ; Offset_0x034130
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                move.b  #$0C, Obj_Routine(A1)                            ; $0024
                lea     (Load_Metal_Sonic_Sub_Obj_0xAF_1), A2  ; Offset_0x034134
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                move.b  #$12, Obj_Routine(A1)                            ; $0024
                lea     (Load_Metal_Sonic_Sub_Obj_0xAF_2), A2  ; Offset_0x034138
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                move.b  #$18, Obj_Routine(A1)                            ; $0024
                rts             
;-------------------------------------------------------------------------------
Offset_0x033B88:
                move.w  (Camera_X).w, D0                             ; $FFFFEE00
                cmpi.w  #$0224, D0
                bcc.s   Offset_0x033B96
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x033B96:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0080, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0224, D0
                move.w  D0, (Sonic_Level_Limits_Min_X).w             ; $FFFFEEC8
                move.w  D0, (Sonic_Level_Limits_Max_X).w             ; $FFFFEECA
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Offset_0x033BB0:
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bmi.s   Offset_0x033BD2
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                bsr     Offset_0x030C0A
                bsr     Offset_0x0340B8
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x033BD2:
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$1A, Obj_Col_Flags(A0)                          ; $0020
                bset    #$01, Obj_Status(A0)                             ; $0022
                bra     Offset_0x033D62                 
;-------------------------------------------------------------------------------
Offset_0x033BEC:
                bsr     Offset_0x03401C
                bsr     Offset_0x03408A
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                beq.s   Offset_0x033C16
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                add.w   D1, Obj_Y(A0)                                    ; $000C
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bsr     Animate_Sprite_2                       ; Offset_0x030CEC
                bsr     Offset_0x0340B8
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x033C16:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                moveq   #$00, D0
                move.b  Obj_Control_Var_03(A0), D0                       ; $002F
                andi.b  #$0F, D0
                move.b  Offset_0x033C40(PC, D0), Obj_Routine_2(A0)       ; $0025
                addq.b  #$01, Obj_Control_Var_03(A0)                     ; $002F
                clr.b   Obj_Control_Var_02(A0)                           ; $002E
                move.w  Obj_Control_Var_10(A0), A1                       ; $003C
                move.b  #$14, Obj_Routine(A1)                            ; $0024
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;-------------------------------------------------------------------------------                  
Offset_0x033C40:
                dc.b    $00, $06, $10, $06, $00, $06, $10, $06
                dc.b    $00, $06, $10, $06, $00, $06, $10, $1E  
;-------------------------------------------------------------------------------  
Offset_0x033C50:
                bsr     Offset_0x03401C
                bsr     Offset_0x03408A
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x033C82(PC, D0), D1
                jsr     Offset_0x033C82(PC, D1)
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                bsr     Offset_0x030C0A
                bsr     Offset_0x0340B8
                bsr     Offset_0x030C0A
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6      
;-------------------------------------------------------------------------------  
Offset_0x033C82:
                dc.w    Offset_0x033CAE-Offset_0x033C82
                dc.w    Offset_0x033CD6-Offset_0x033C82
                dc.w    Offset_0x033D02-Offset_0x033C82
                dc.w    Offset_0x033D90-Offset_0x033C82
                dc.w    Offset_0x033DA2-Offset_0x033C82
                dc.w    Offset_0x033DC2-Offset_0x033C82
                dc.w    Offset_0x033DE6-Offset_0x033C82
                dc.w    Offset_0x033E14-Offset_0x033C82
                dc.w    Offset_0x033D90-Offset_0x033C82
                dc.w    Offset_0x033DA2-Offset_0x033C82
                dc.w    Offset_0x033E28-Offset_0x033C82
                dc.w    Offset_0x033E4C-Offset_0x033C82
                dc.w    Offset_0x033E72-Offset_0x033C82
                dc.w    Offset_0x033EA6-Offset_0x033C82
                dc.w    Offset_0x033E14-Offset_0x033C82
                dc.w    Offset_0x033D90-Offset_0x033C82
                dc.w    Offset_0x033DA2-Offset_0x033C82
                dc.w    Offset_0x033E28-Offset_0x033C82
                dc.w    Offset_0x033E4C-Offset_0x033C82
                dc.w    Offset_0x033EC2-Offset_0x033C82
                dc.w    Offset_0x033EA6-Offset_0x033C82
                dc.w    Offset_0x033E14-Offset_0x033C82     
;-------------------------------------------------------------------------------  
Offset_0x033CAE:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                move.b  #$04, Obj_Control_Var_00(A0)                     ; $002C
Offset_0x033CBE:
                move.b  #$20, Obj_Timer(A0)                              ; $002A
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                move.b  #$0E, Obj_Routine(A1)                            ; $0024
                move.b  #$01, Obj_Ani_Number(A1)                         ; $001C
                rts         
;-------------------------------------------------------------------------------  
Offset_0x033CD6:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x033CDE
                rts
Offset_0x033CDE:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$40, Obj_Timer(A0)                              ; $002A
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0800, D0
                bsr     Offset_0x0340CE
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                rts      
;-------------------------------------------------------------------------------  
Offset_0x033D02:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x033D4E
                cmpi.b  #$20, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x033D20
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                move.b  #$10, Obj_Routine(A1)                            ; $0024
Offset_0x033D20:
                bsr     Offset_0x0340E0
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bsr     Animate_Sprite_2                       ; Offset_0x030CEC
                cmpi.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x033D4C
                cmpi.b  #$02, Obj_Ani_Frame(A0)                          ; $001B
                bne.s   Offset_0x033D4C
                cmpi.b  #$03, Obj_Ani_Time(A0)                           ; $001E
                bne.s   Offset_0x033D4C
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x033D4C:
                rts
Offset_0x033D4E:
                subq.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                beq.s   Offset_0x033D62
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
                clr.w   Obj_Speed(A0)                                    ; $0010
                bra     Offset_0x033CBE
Offset_0x033D62:
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$64, Obj_Timer(A0)                              ; $002A
                clr.w   Obj_Speed(A0)                                    ; $0010
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                move.b  #$10, Obj_Routine(A1)                            ; $0024
                move.w  Obj_Control_Var_10(A0), A1                       ; $003C
                move.b  #$16, Obj_Routine(A1)                            ; $0024
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6      
;-------------------------------------------------------------------------------  
Offset_0x033D90:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                rts      
;-------------------------------------------------------------------------------  
Offset_0x033DA2:
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bsr     Animate_Sprite_2                       ; Offset_0x030CEC
                bne.s   Offset_0x033DB0
                rts
Offset_0x033DB0:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$20, Obj_Timer(A0)                              ; $002A
                move.b  #$04, Obj_Ani_Number(A0)                         ; $001C
                rts   
;-------------------------------------------------------------------------------  
Offset_0x033DC2:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x033DD4
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bsr     Animate_Sprite_2                       ; Offset_0x030CEC
                rts
Offset_0x033DD4:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$40, Obj_Timer(A0)                              ; $002A
                move.w  #$0800, D0
                bra     Offset_0x0340CE           
;-------------------------------------------------------------------------------  
Offset_0x033DE6:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x033DFA
                bsr     Offset_0x0340E0
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bra     Animate_Sprite_2                       ; Offset_0x030CEC
Offset_0x033DFA:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$05, Obj_Ani_Number(A0)                         ; $001C
                bchg    #00, Obj_Flags(A0)                               ; $0001
                clr.w   Obj_Speed(A0)                                    ; $0010
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts    
;-------------------------------------------------------------------------------  
Offset_0x033E14:
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bsr     Animate_Sprite_2                       ; Offset_0x030CEC
                bne     Offset_0x033E24
                rts
Offset_0x033E24:
                bra     Offset_0x033D62  
;-------------------------------------------------------------------------------  
Offset_0x033E28:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x033E3A
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bsr     Animate_Sprite_2                       ; Offset_0x030CEC
                rts
Offset_0x033E3A:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$40, Obj_Timer(A0)                              ; $002A
                move.w  #$0400, D0
                bra     Offset_0x0340CE   
;-------------------------------------------------------------------------------  
Offset_0x033E4C:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                cmpi.b  #$3C, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x033E5C
                bsr     Offset_0x033E66
Offset_0x033E5C:
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bra     Animate_Sprite_2                       ; Offset_0x030CEC
Offset_0x033E66:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FA00, Obj_Speed_Y(A0)                          ; $0012
                rts     
;-------------------------------------------------------------------------------  
Offset_0x033E72:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi     Offset_0x033DFA
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x033E88
                bsr     Offset_0x033E98
Offset_0x033E88:
                addi.w  #$0038, Obj_Speed_Y(A0)                          ; $0012
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bra     Animate_Sprite_2                       ; Offset_0x030CEC
Offset_0x033E98:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                add.w   D1, Obj_Y(A0)                                    ; $000C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts   
;-------------------------------------------------------------------------------  
Offset_0x033EA6:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi     Offset_0x033DFA
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                add.w   D1, Obj_Y(A0)                                    ; $000C
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bra     Animate_Sprite_2                       ; Offset_0x030CEC     
;-------------------------------------------------------------------------------  
Offset_0x033EC2:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi     Offset_0x033DFA
                tst.b   Obj_Control_Var_02(A0)                           ; $002E
                bne.s   Offset_0x033EDE
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x033EDE
                st      Obj_Control_Var_02(A0)                           ; $002E
                bsr     Offset_0x0340F0
Offset_0x033EDE:
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x033EEC
                bsr     Offset_0x033EFC
Offset_0x033EEC:
                addi.w  #$0038, Obj_Speed_Y(A0)                          ; $0012
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x034150
                bra     Animate_Sprite_2                       ; Offset_0x030CEC
Offset_0x033EFC:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                add.w   D1, Obj_Y(A0)                                    ; $000C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts   
;-------------------------------------------------------------------------------  
Offset_0x033F0A:
                clr.b   Obj_Col_Flags(A0)                                ; $0020
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bmi.s   Offset_0x033F1C
                bsr     Jmp_00_To_Boss_Defeated                ; Offset_0x03763E
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x033F1C:
                move.w  #$1000, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                addq.b  #$02, ($FFFFEEDF).w
                bra     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC     
;-------------------------------------------------------------------------------  
Offset_0x033F2A:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                rts         
;-------------------------------------------------------------------------------  
Offset_0x033F3C:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                bsr     Offset_0x030C50
                lea     (Metal_Sonic_Animate_Data_1), A1       ; Offset_0x03419E
                bsr     Animate_Sprite_2                       ; Offset_0x030CEC
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6 
;-------------------------------------------------------------------------------  
Offset_0x033F52:
                rts    
;-------------------------------------------------------------------------------  
Offset_0x033F54:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$0B, Obj_Map_Id(A0)                             ; $001A
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                rts
;-------------------------------------------------------------------------------  
Offset_0x033F6C:
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                rts      
;-------------------------------------------------------------------------------  
Offset_0x033F74:
                move.b  #$98, Obj_Col_Flags(A0)                          ; $0020
                rts
;-------------------------------------------------------------------------------  
Offset_0x033F7C:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                move.w  #$02C0, Obj_X(A0)                                ; $0008
                move.w  #$0139, Obj_Y(A0)                                ; $000C
                rts 
;-------------------------------------------------------------------------------  
Offset_0x033F94:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                bclr    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x033FA4
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x033FA4:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------  
Offset_0x033FAC:
                lea     (Metal_Sonic_Animate_Data_2), A1       ; Offset_0x0341B0
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6    
;-------------------------------------------------------------------------------  
Offset_0x033FBA:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                lea     (Obj_Memory_Address).w, A2                   ; $FFFFB000
                btst    #$02, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x033FFC
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                cmpi.b  #$04, Obj_Routine(A2)                            ; $0024
                bne.s   Offset_0x033FE2
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                bra     Offset_0x033FEE
Offset_0x033FE2:
                tst.b   Obj_Col_Flags(A1)                                ; $0020
                bne.s   Offset_0x033FEE
                move.b  #$04, Obj_Ani_Number(A0)                         ; $001C
Offset_0x033FEE:
                lea     (Metal_Sonic_Animate_Data_2), A1       ; Offset_0x0341B0
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x033FFC:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6     
;-------------------------------------------------------------------------------  
Offset_0x03400A:
                lea     (Metal_Sonic_Animate_Data_2), A1       ; Offset_0x0341B0
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bsr     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x03401C:
                tst.b   Obj_Col_Prop(A0)                                 ; $0021
                beq.s   Offset_0x03405E
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                bne.s   Offset_0x03405C
                tst.b   Obj_Control_Var_04(A0)                           ; $0030
                bne.s   Offset_0x03403E
                move.b  #$20, Obj_Control_Var_04(A0)                     ; $0030
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x03403E:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x03404C
                move.w  #$0EEE, D0
Offset_0x03404C:
                move.w  D0, (A1)
                subq.b  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bne.s   Offset_0x03405C
                clr.w   ($FFFFFB22).w
                bsr     Offset_0x034092
Offset_0x03405C:
                rts
Offset_0x03405E:
                moveq   #$64, D0
                bsr     AddPoints                              ; Offset_0x0394D0
                move.w  #$00EF, Obj_Control_Var_06(A0)                   ; $0032
                move.b  #$0A, Obj_Routine(A0)                            ; $0024
                clr.b   Obj_Col_Flags(A0)                                ; $0020
                bset    #$02, Obj_Status(A0)                             ; $0022
                move.w  Obj_Control_Var_10(A0), A1                       ; $003C
                bsr     Jmp_04_To_DeleteObject_A1              ; Offset_0x03760E
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                bra     Jmp_04_To_DeleteObject_A1              ; Offset_0x03760E
Offset_0x03408A:
                tst.b   Obj_Col_Flags(A0)                                ; $0020
                beq     Return_to_sub_routine                  ; Offset_0x031E96
Offset_0x034092:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                cmpi.b  #$06, D0
                beq.s   Offset_0x0340B0
                cmpi.b  #$07, D0
                beq.s   Offset_0x0340B0
                cmpi.b  #$08, D0
                beq.s   Offset_0x0340B0
                move.b  #$1A, Obj_Col_Flags(A0)                          ; $0020
                rts
Offset_0x0340B0:
                move.b  #$9A, Obj_Col_Flags(A0)                          ; $0020
                rts
Offset_0x0340B8:
                moveq   #$0C, D0
                moveq   #-$0C, D1
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x0340C6
                neg.w   D0
Offset_0x0340C6:
                move.w  Obj_Control_Var_10(A0), A1                       ; $003C
                bra     Offset_0x030C0A
Offset_0x0340CE:
                tst.b   Obj_Control_Var_01(A0)                           ; $002D
                bne.s   Offset_0x0340D6
                neg.w   D0
Offset_0x0340D6:
                not.b   Obj_Control_Var_01(A0)                           ; $002D
                move.w  D0, Obj_Speed(A0)                                ; $0010
                rts
Offset_0x0340E0:
                moveq   #$20, D0
                tst.w   Obj_Speed(A0)                                    ; $0010
                bmi.s   Offset_0x0340EA
                neg.w   D0
Offset_0x0340EA:
                add.w   D0, Obj_Speed(A0)                                ; $0010
                rts
Offset_0x0340F0:
                move.b  #$4A, D2
                moveq   #$07, D6
                lea     (Offset_0x034100), A2
                bra     Enemy_Weapon                           ; Offset_0x030C98   
;-------------------------------------------------------------------------------    
Offset_0x034100:
                dc.b    $00, $E8, $00, $FD, $0F, $00, $F0, $F0
                dc.b    $FE, $FE, $10, $00, $E8, $00, $FD, $00
                dc.b    $11, $00, $F0, $10, $FE, $02, $12, $00
                dc.b    $00, $18, $00, $03, $13, $00, $10, $10
                dc.b    $02, $02, $14, $00, $18, $00, $03, $00
                dc.b    $15, $00, $10, $F0, $02, $FE, $16, $00
;-------------------------------------------------------------------------------                
Load_Metal_Sonic_Sub_Obj_0xAF:                                 ; Offset_0x034130 
                dc.w    $003E
                dc.b    $AF, $48
;-------------------------------------------------------------------------------  
Load_Metal_Sonic_Sub_Obj_0xAF_1:                               ; Offset_0x034134  
                dc.w    $003C
                dc.b    $AF, $48
;-------------------------------------------------------------------------------  
Load_Metal_Sonic_Sub_Obj_0xAF_2:                               ; Offset_0x034138  
                dc.w    $003A
                dc.b    $AF, $94     
;-------------------------------------------------------------------------------   
Obj_0xAF_Ptr:                                                  ; Offset_0x03413C
                dc.l    Metal_Sonic_Mappings                   ; Offset_0x0341D6
                dc.w    $2380
                dc.b    $04, $04, $10, $1A      
;-------------------------------------------------------------------------------   
Obj_0xAF_01_Ptr:                                               ; Offset_0x034146
                dc.l    Robotnik_Window_Mappings               ; Offset_0x0343FA
                dc.w    $0378
                dc.b    $04, $06, $10, $00    
;-------------------------------------------------------------------------------  
Metal_Sonic_Animate_Data:                                      ; Offset_0x034150
                dc.w    Offset_0x03415C-Metal_Sonic_Animate_Data
                dc.w    Offset_0x034162-Metal_Sonic_Animate_Data
                dc.w    Offset_0x034166-Metal_Sonic_Animate_Data
                dc.w    Offset_0x03416C-Metal_Sonic_Animate_Data
                dc.w    Offset_0x034182-Metal_Sonic_Animate_Data
                dc.w    Offset_0x034188-Metal_Sonic_Animate_Data
Offset_0x03415C:
                dc.b    $02, $00, $01, $02
                dc.b    $FF, $00
Offset_0x034162:
                dc.b    $45, $03, $FD, $00
Offset_0x034166:
                dc.b    $03, $04, $05, $04
                dc.b    $03, $FC
Offset_0x03416C:
                dc.b    $03, $03, $03, $06
                dc.b    $06, $06, $07, $07
                dc.b    $07, $08, $08, $08
                dc.b    $06, $06, $07, $07
                dc.b    $08, $08, $06, $07
                dc.b    $08, $FC
Offset_0x034182:
                dc.b    $02, $06, $07, $08
                dc.b    $FF, $00
Offset_0x034188:
                dc.b    $03, $08, $07, $06
                dc.b    $08, $08, $07, $07
                dc.b    $06, $06, $08, $08
                dc.b    $08, $07, $07, $07
                dc.b    $06, $06, $06, $03
                dc.b    $03, $FC                                                
;-------------------------------------------------------------------------------
Metal_Sonic_Animate_Data_1:                                    ; Offset_0x03419E
                dc.w    Offset_0x0341A4-Metal_Sonic_Animate_Data_1
                dc.w    Offset_0x0341A8-Metal_Sonic_Animate_Data_1
                dc.w    Offset_0x0341AC-Metal_Sonic_Animate_Data_1
Offset_0x0341A4:
                dc.b    $01, $0B, $0C, $FF
Offset_0x0341A8:
                dc.b    $01, $0D, $0E, $FF
Offset_0x0341AC:
                dc.b    $01, $09, $0A, $FF
;-------------------------------------------------------------------------------
Metal_Sonic_Animate_Data_2:                                    ; Offset_0x0341B0
                dc.w    Offset_0x0341BA-Metal_Sonic_Animate_Data_2
                dc.w    Offset_0x0341C2-Metal_Sonic_Animate_Data_2
                dc.w    Offset_0x0341CA-Metal_Sonic_Animate_Data_2
                dc.w    Offset_0x0341CE-Metal_Sonic_Animate_Data_2
                dc.w    Offset_0x0341D2-Metal_Sonic_Animate_Data_2                          
Offset_0x0341BA:
                dc.b    $03, $04, $03, $02
                dc.b    $01, $00, $FC, $00
Offset_0x0341C2:
                dc.b    $03, $00, $01, $02
                dc.b    $03, $04, $FA, $00
Offset_0x0341CA:
                dc.b    $03, $05, $05, $FF
Offset_0x0341CE:
                dc.b    $03, $05, $06, $FF
Offset_0x0341D2:
                dc.b    $03, $07, $07, $FF
;-------------------------------------------------------------------------------   
Metal_Sonic_Mappings:                                          ; Offset_0x0341D6
                dc.w    Offset_0x034204-Metal_Sonic_Mappings
                dc.w    Offset_0x03422E-Metal_Sonic_Mappings
                dc.w    Offset_0x034258-Metal_Sonic_Mappings
                dc.w    Offset_0x034282-Metal_Sonic_Mappings
                dc.w    Offset_0x0342A4-Metal_Sonic_Mappings
                dc.w    Offset_0x0342C6-Metal_Sonic_Mappings
                dc.w    Offset_0x0342E8-Metal_Sonic_Mappings
                dc.w    Offset_0x03430A-Metal_Sonic_Mappings
                dc.w    Offset_0x03432C-Metal_Sonic_Mappings
                dc.w    Offset_0x03434E-Metal_Sonic_Mappings
                dc.w    Offset_0x034360-Metal_Sonic_Mappings
                dc.w    Offset_0x034372-Metal_Sonic_Mappings
                dc.w    Offset_0x034384-Metal_Sonic_Mappings
                dc.w    Offset_0x034396-Metal_Sonic_Mappings
                dc.w    Offset_0x0343A0-Metal_Sonic_Mappings
                dc.w    Offset_0x0343AA-Metal_Sonic_Mappings
                dc.w    Offset_0x0343B4-Metal_Sonic_Mappings
                dc.w    Offset_0x0343BE-Metal_Sonic_Mappings
                dc.w    Offset_0x0343C8-Metal_Sonic_Mappings
                dc.w    Offset_0x0343D2-Metal_Sonic_Mappings
                dc.w    Offset_0x0343DC-Metal_Sonic_Mappings
                dc.w    Offset_0x0343E6-Metal_Sonic_Mappings
                dc.w    Offset_0x0343F0-Metal_Sonic_Mappings
Offset_0x034204:
                dc.w    $0005
                dc.l    $E4090000, $0000FFF3
                dc.l    $F40F0006, $0003FFEF
                dc.l    $140C0016, $000BFFEC
                dc.l    $E404006F, $0037FFF4
                dc.l    $E4070071, $00380004
Offset_0x03422E:
                dc.w    $0005
                dc.l    $E4090000, $0000FFF3
                dc.l    $F40F0006, $0003FFEF
                dc.l    $140C0016, $000BFFEC
                dc.l    $E4040079, $003CFFF4
                dc.l    $E407007B, $003D0004
Offset_0x034258:
                dc.w    $0005
                dc.l    $E4090000, $0000FFF3
                dc.l    $F40F0006, $0003FFEF
                dc.l    $140C0016, $000BFFEC
                dc.l    $E4040083, $0041FFF4
                dc.l    $E4070085, $00420004
Offset_0x034282:
                dc.w    $0004
                dc.l    $E40F001A, $000DFFEC
                dc.l    $E403002A, $0015000C
                dc.l    $040E002E, $0017FFF4
                dc.l    $1400003A, $001DFFEC
Offset_0x0342A4:
                dc.w    $0004
                dc.l    $E40E003B, $001DFFF0
                dc.l    $04010047, $0023FFE8
                dc.l    $FC0F0049, $0024FFF0
                dc.l    $FC030059, $002C0010
Offset_0x0342C6:
                dc.w    $0004
                dc.l    $E406005D, $002EFFF0
                dc.l    $E406085D, $082E0000
                dc.l    $FC0B0063, $0031FFE8
                dc.l    $FC0B0863, $08310000
Offset_0x0342E8:
                dc.w    $0004
                dc.l    $EE0A008D, $0046FFE8
                dc.l    $EE0A0096, $004B0000
                dc.l    $060A1896, $184BFFE8
                dc.l    $060A188D, $18460000
Offset_0x03430A:
                dc.w    $0004
                dc.l    $EE0A009F, $004FFFE8
                dc.l    $EE0A00A8, $00540000
                dc.l    $060A18A8, $1854FFE8
                dc.l    $060A189F, $184F0000
Offset_0x03432C:
                dc.w    $0004
                dc.l    $EE0A00B1, $0058FFE8
                dc.l    $EE0A00BA, $005D0000
                dc.l    $060A18BA, $185DFFE8
                dc.l    $060A18B1, $18580000
Offset_0x03434E:
                dc.w    $0002
                dc.l    $040000C3, $0061000E
                dc.l    $140800CB, $00650012
Offset_0x034360:
                dc.w    $0002
                dc.l    $040800C4, $0062000E
                dc.l    $140800CE, $00670012
Offset_0x034372:
                dc.w    $0002
                dc.l    $1C0000C7, $0063FFF4
                dc.l    $1C0000C7, $0063FFFC
Offset_0x034384:
                dc.w    $0002
                dc.l    $1C0200C8, $0064FFF4
                dc.l    $1C0200C8, $0064FFFC
Offset_0x034396:
                dc.w    $0001
                dc.l    $140800CB, $00650012
Offset_0x0343A0:
                dc.w    $0001
                dc.l    $140800CE, $00670012
Offset_0x0343AA:
                dc.w    $0001
                dc.l    $F80100D1, $0068FFFC
Offset_0x0343B4:
                dc.w    $0001
                dc.l    $F80500D3, $0069FFF8
Offset_0x0343BE:
                dc.w    $0001
                dc.l    $FC0400D7, $006BFFF8
Offset_0x0343C8:
                dc.w    $0001
                dc.l    $F80510D3, $1069FFF8                                     
Offset_0x0343D2:
                dc.w    $0001
                dc.l    $F80110D1, $1068FFFC
Offset_0x0343DC:
                dc.w    $0001
                dc.l    $F80518D3, $1869FFF8
Offset_0x0343E6:
                dc.w    $0001
                dc.l    $FC0408D7, $086BFFF8
Offset_0x0343F0:
                dc.w    $0001
                dc.l    $F80508D3, $0869FFF8  
;-------------------------------------------------------------------------------      
Robotnik_Window_Mappings:                                      ; Offset_0x0343FA
                dc.w    Offset_0x03440A-Robotnik_Window_Mappings
                dc.w    Offset_0x034434-Robotnik_Window_Mappings
                dc.w    Offset_0x03445E-Robotnik_Window_Mappings
                dc.w    Offset_0x034488-Robotnik_Window_Mappings
                dc.w    Offset_0x0344C2-Robotnik_Window_Mappings
                dc.w    Offset_0x0344FC-Robotnik_Window_Mappings
                dc.w    Offset_0x034516-Robotnik_Window_Mappings
                dc.w    Offset_0x034530-Robotnik_Window_Mappings
Offset_0x03440A:
                dc.w    $0005
                dc.l    $F4062000, $2000FFF0
                dc.l    $F4062800, $28000000
                dc.l    $04042006, $2003FFF0
                dc.l    $04042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x034434:
                dc.w    $0005
                dc.l    $F4062000, $2000FFF0
                dc.l    $F4062800, $28000000
                dc.l    $00042006, $2003FFF0
                dc.l    $00042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x03445E:
                dc.w    $0005
                dc.l    $F4062000, $2000FFF0
                dc.l    $F4062800, $28000000
                dc.l    $FC042006, $2003FFF0
                dc.l    $FC042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x034488:
                dc.w    $0007
                dc.l    $F4062000, $2000FFF0
                dc.l    $F4062800, $28000000
                dc.l    $F8042006, $2003FFF0
                dc.l    $F8042006, $20030000
                dc.l    $00042006, $2003FFF0
                dc.l    $00042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x0344C2:
                dc.w    $0007
                dc.l    $F4062000, $2000FFF0
                dc.l    $F4062800, $28000000
                dc.l    $F4042006, $2003FFF0
                dc.l    $F4042006, $20030000
                dc.l    $FC042006, $2003FFF0
                dc.l    $FC042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x0344FC:
                dc.w    $0003
                dc.l    $F4062000, $2000FFF0
                dc.l    $F4062800, $28000000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x034516:
                dc.w    $0003
                dc.l    $F4062000, $2000FFF0
                dc.l    $F4062800, $28000000
                dc.l    $F90D0190, $00C8FFF0
Offset_0x034530:
                dc.w    $0003
                dc.l    $F4062000, $2000FFF0
                dc.l    $F4062800, $28000000
                dc.l    $F80D0198, $00CCFFF0
;===============================================================================   
; Object 0xAF - Metal Sonic - Death Egg
; <<<-        
;===============================================================================