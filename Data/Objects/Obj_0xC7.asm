;===============================================================================
; Objeto 0xC7 - Robotnik gigante na última batalha do jogo na Death Egg
; ->>>          
;===============================================================================  
; Offset_0x036BD0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x036BDE(PC, D0), D1
                jmp     Offset_0x036BDE(PC, D1)   
;-------------------------------------------------------------------------------
Offset_0x036BDE:
                dc.w    Offset_0x036BF8-Offset_0x036BDE
                dc.w    Offset_0x036C0A-Offset_0x036BDE
                dc.w    Offset_0x036D14-Offset_0x036BDE
                dc.w    Offset_0x036D48-Offset_0x036BDE
                dc.w    Offset_0x036D7E-Offset_0x036BDE
                dc.w    Offset_0x036DAE-Offset_0x036BDE
                dc.w    Offset_0x036DE4-Offset_0x036BDE
                dc.w    Offset_0x036E18-Offset_0x036BDE
                dc.w    Offset_0x036E4E-Offset_0x036BDE
                dc.w    Offset_0x036EC6-Offset_0x036BDE
                dc.w    Offset_0x036F20-Offset_0x036BDE
                dc.w    Offset_0x036F56-Offset_0x036BDE
                dc.w    Offset_0x036F8C-Offset_0x036BDE    
;-------------------------------------------------------------------------------                
Offset_0x036BF8:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  Obj_Subtype(A0), D0                              ; $0028
                subi.b  #$9C, D0
                move.b  D0, Obj_Routine(A0)                              ; $0024
                rts  
;-------------------------------------------------------------------------------
Offset_0x036C0A:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036C1C(PC, D0), D1
                jsr     Offset_0x036C1C(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;-------------------------------------------------------------------------------
Offset_0x036C1C:
                dc.w    Offset_0x036C26-Offset_0x036C1C
                dc.w    Offset_0x036CA6-Offset_0x036C1C
                dc.w    Offset_0x036CCC-Offset_0x036C1C
                dc.w    Offset_0x036CFA-Offset_0x036C1C
                dc.w    Offset_0x036D08-Offset_0x036C1C   
;-------------------------------------------------------------------------------
Offset_0x036C26:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                lea     (Load_DEz_Boss_Sub_Obj_0xC7), A2       ; Offset_0x037290
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_1), A2     ; Offset_0x037294
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_2), A2     ; Offset_0x037298
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_3), A2     ; Offset_0x03729C
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_4), A2     ; Offset_0x0372A0
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_5), A2     ; Offset_0x0372A4
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_6), A2     ; Offset_0x0372A8
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_7), A2     ; Offset_0x0372AC
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_8), A2     ; Offset_0x0372B0
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_9), A2     ; Offset_0x0372B4
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                lea     (Load_DEz_Boss_Sub_Obj_0xC7_A), A2     ; Offset_0x0372B8
                bsr     Load_Sub_Obj                           ; Offset_0x030BE4
                rts        
;-------------------------------------------------------------------------------
Offset_0x036CA6:
                btst    #$02, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x036CB0
                rts
Offset_0x036CB0:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FF00, Obj_Speed_Y(A0)                          ; $0012
                move.b  #$79, Obj_Ani_Time(A0)                           ; $001E
                move.w  Obj_Control_Var_0C(A0), A1                       ; $0038
                move.b  #$04, Obj_Routine_2(A1)                          ; $0025
                rts    
;-------------------------------------------------------------------------------
Offset_0x036CCC:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                beq.s   Offset_0x036CE0
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Offset_0x03706A), A1
                bra     Offset_0x037040
Offset_0x036CE0:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                move.b  #$1F, Obj_Ani_Time(A0)                           ; $001E
                move.w  Obj_Control_Var_0C(A0), A1                       ; $0038
                move.b  #$06, Obj_Routine_2(A1)                          ; $0025
                rts  
;-------------------------------------------------------------------------------
Offset_0x036CFA:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bmi.s   Offset_0x036D02
                rts
Offset_0x036D02:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                rts   
;-------------------------------------------------------------------------------
Offset_0x036D08:
                lea     (DEz_Boss_Animate_Data_Ptr), A1        ; Offset_0x03708C
                bsr     DEz_Boss_Animate_Date                  ; Offset_0x036FC2
                rts       
;-------------------------------------------------------------------------------
Offset_0x036D14:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036D2E(PC, D0), D1
                jsr     Offset_0x036D2E(PC, D1)
                lea     Offset_0x036D32(PC), A1
                bsr     Offset_0x037026
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6     
;-------------------------------------------------------------------------------
Offset_0x036D2E:
                dc.w    Offset_0x036D36-Offset_0x036D2E
                dc.w    Offset_0x036D46-Offset_0x036D2E      
;-------------------------------------------------------------------------------
Offset_0x036D32:
                dc.w    $000C, $FFEC  
;-------------------------------------------------------------------------------
Offset_0x036D36:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                clr.b   Obj_Col_Flags(A0)                                ; $0020
                rts  
;-------------------------------------------------------------------------------
Offset_0x036D46:
                rts   
;-------------------------------------------------------------------------------
Offset_0x036D48:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036D5A(PC, D0), D1
                jsr     Offset_0x036D5A(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6     
;-------------------------------------------------------------------------------
Offset_0x036D5A:
                dc.w    Offset_0x036D5E-Offset_0x036D5A
                dc.w    Offset_0x036D7C-Offset_0x036D5A    
;-------------------------------------------------------------------------------
Offset_0x036D5E:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$0B, Obj_Map_Id(A0)                             ; $001A
                addi.w  #$FFFE, Obj_X(A0)                                ; $0008
                addi.w  #$003C, Obj_Y(A0)                                ; $000C
                move.b  #$A2, Obj_Col_Flags(A0)                          ; $0020
                rts   
;-------------------------------------------------------------------------------
Offset_0x036D7C:
                rts  
;-------------------------------------------------------------------------------
Offset_0x036D7E:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036D90(PC, D0), D1
                jsr     Offset_0x036D90(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;-------------------------------------------------------------------------------
Offset_0x036D90:
                dc.w    Offset_0x036D94-Offset_0x036D90
                dc.w    Offset_0x036DAC-Offset_0x036D90    
;-------------------------------------------------------------------------------
Offset_0x036D94:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$06, Obj_Map_Id(A0)                             ; $001A
                addq.w  #$04, Obj_X(A0)                                  ; $0008
                addq.w  #$08, Obj_Y(A0)                                  ; $000C
                clr.b   Obj_Col_Flags(A0)                                ; $0020
                rts    
;-------------------------------------------------------------------------------
Offset_0x036DAC:
                rts   
;-------------------------------------------------------------------------------
Offset_0x036DAE:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036DC0(PC, D0), D1
                jsr     Offset_0x036DC0(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6     
;-------------------------------------------------------------------------------
Offset_0x036DC0:
                dc.w    Offset_0x036DC4-Offset_0x036DC0
                dc.w    Offset_0x036DE2-Offset_0x036DC0  
;-------------------------------------------------------------------------------
Offset_0x036DC4:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$07, Obj_Map_Id(A0)                             ; $001A
                addi.w  #$FFEC, Obj_X(A0)                                ; $0008
                addi.w  #$0008, Obj_Y(A0)                                ; $000C
                move.b  #$88, Obj_Col_Flags(A0)                          ; $0020
                rts   
;-------------------------------------------------------------------------------
Offset_0x036DE2:
                rts  
;-------------------------------------------------------------------------------
Offset_0x036DE4:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036DF6(PC, D0), D1
                jsr     Offset_0x036DF6(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6 
;-------------------------------------------------------------------------------
Offset_0x036DF6:
                dc.w    Offset_0x036DFA-Offset_0x036DF6
                dc.w    Offset_0x036E16-Offset_0x036DF6   
;-------------------------------------------------------------------------------
Offset_0x036DFA:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$05, Obj_Map_Id(A0)                             ; $001A
                addi.w  #$000C, Obj_X(A0)                                ; $0008
                addi.w  #$FFF8, Obj_Y(A0)                                ; $000C
                clr.b   Obj_Col_Flags(A0)                                ; $0020
                rts     
;-------------------------------------------------------------------------------
Offset_0x036E16:
                rts   
;-------------------------------------------------------------------------------
Offset_0x036E18:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036E2A(PC, D0), D1
                jsr     Offset_0x036E2A(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;-------------------------------------------------------------------------------
Offset_0x036E2A:
                dc.w    Offset_0x036E2E-Offset_0x036E2A
                dc.w    Offset_0x036E4C-Offset_0x036E2A    
;-------------------------------------------------------------------------------
Offset_0x036E2E:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$0A, Obj_Map_Id(A0)                             ; $001A
                addi.w  #$0004, Obj_X(A0)                                ; $0008
                addi.w  #$0024, Obj_Y(A0)                                ; $000C
                move.b  #$86, Obj_Col_Flags(A0)                          ; $0020
                rts      
;-------------------------------------------------------------------------------
Offset_0x036E4C:
                rts  
;-------------------------------------------------------------------------------
Offset_0x036E4E:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036E64(PC, D0), D1
                jsr     Offset_0x036E64(PC, D1)
                lea     Offset_0x036E6E(PC), A1
                bra     Offset_0x037026  
;-------------------------------------------------------------------------------       
Offset_0x036E64:
                dc.w    Offset_0x036E72-Offset_0x036E64
                dc.w    Offset_0x036E7E-Offset_0x036E64
                dc.w    Offset_0x036E98-Offset_0x036E64
                dc.w    Offset_0x036EA6-Offset_0x036E64
                dc.w    Offset_0x036EC2-Offset_0x036E64  
;-------------------------------------------------------------------------------
Offset_0x036E6E:
                dc.w    $0000, $FFCC
;-------------------------------------------------------------------------------
Offset_0x036E72:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$88, Obj_Col_Flags(A0)                          ; $0020
                rts    
;-------------------------------------------------------------------------------
Offset_0x036E7E:
                move.w  ($FFFFF660).w, A1
                btst    #$03, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x036E8C
                rts
Offset_0x036E8C:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0040, Obj_Timer(A0)                            ; $002A
                rts 
;-------------------------------------------------------------------------------
Offset_0x036E98:
                lea     (DEz_Boss_Animate_Data_1), A1          ; Offset_0x0372C6
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6    
;-------------------------------------------------------------------------------
Offset_0x036EA6:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x036EB0
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6
Offset_0x036EB0:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                bset    #$02, Obj_Status(A1)                             ; $0022
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6 
;-------------------------------------------------------------------------------
Offset_0x036EC2:
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Offset_0x036EC6:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036EDC(PC, D0), D1
                jsr     Offset_0x036EDC(PC, D1)
                lea     Offset_0x036EE6(PC), A1
                bra     Offset_0x037026         
;-------------------------------------------------------------------------------
Offset_0x036EDC:
                dc.w    Offset_0x036EEA-Offset_0x036EDC
                dc.w    Offset_0x036EFC-Offset_0x036EDC
                dc.w    Offset_0x036EFE-Offset_0x036EDC
                dc.w    Offset_0x036F0C-Offset_0x036EDC
                dc.w    Offset_0x036EFC-Offset_0x036EDC  
;-------------------------------------------------------------------------------
Offset_0x036EE6:
                dc.w    $0038, $0018    
;-------------------------------------------------------------------------------
Offset_0x036EEA:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$0C, Obj_Map_Id(A0)                             ; $001A
                move.b  #$8B, Obj_Col_Flags(A0)                          ; $0020
                rts   
;-------------------------------------------------------------------------------
Offset_0x036EFC:
                rts 
;-------------------------------------------------------------------------------
Offset_0x036EFE:
                lea     (DEz_Boss_Animate_Data_2), A1          ; Offset_0x0372D4
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Offset_0x036F0C:
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                lea     (DEz_Boss_Animate_Data_2), A1          ; Offset_0x0372D4
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Offset_0x036F20:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036F32(PC, D0), D1
                jsr     Offset_0x036F32(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6  
;-------------------------------------------------------------------------------
Offset_0x036F32:
                dc.w    Offset_0x036F36-Offset_0x036F32
                dc.w    Offset_0x036F54-Offset_0x036F32      
;-------------------------------------------------------------------------------
Offset_0x036F36:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$0B, Obj_Map_Id(A0)                             ; $001A
                addi.w  #$FFFE, Obj_X(A0)                                ; $0008
                addi.w  #$003C, Obj_Y(A0)                                ; $000C
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                rts     
;-------------------------------------------------------------------------------
Offset_0x036F54:
                rts      
;-------------------------------------------------------------------------------
Offset_0x036F56:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036F68(PC, D0), D1
                jsr     Offset_0x036F68(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6    
;-------------------------------------------------------------------------------
Offset_0x036F68:
                dc.w    Offset_0x036F6C-Offset_0x036F68
                dc.w    Offset_0x036F8A-Offset_0x036F68       
;-------------------------------------------------------------------------------
Offset_0x036F6C:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$07, Obj_Map_Id(A0)                             ; $001A
                addi.w  #$FFEC, Obj_X(A0)                                ; $0008
                addi.w  #$0008, Obj_Y(A0)                                ; $000C
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                rts       
;-------------------------------------------------------------------------------
Offset_0x036F8A:
                rts  
;-------------------------------------------------------------------------------
Offset_0x036F8C:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x036F9E(PC, D0), D1
                jsr     Offset_0x036F9E(PC, D1)
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Offset_0x036F9E:
                dc.w    Offset_0x036FA2-Offset_0x036F9E
                dc.w    Offset_0x036FC0-Offset_0x036F9E         
;-------------------------------------------------------------------------------
Offset_0x036FA2:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$0A, Obj_Map_Id(A0)                             ; $001A
                addi.w  #$0004, Obj_X(A0)                                ; $0008
                addi.w  #$0024, Obj_Y(A0)                                ; $000C
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                rts   
;-------------------------------------------------------------------------------
Offset_0x036FC0:
                rts
;-------------------------------------------------------------------------------                
DEz_Boss_Animate_Date:                                         ; Offset_0x036FC2
                move.l  (A1)+, A2
                moveq   #$00, D0
                move.b  Obj_Ani_Frame(A0), D0                            ; $001B
                move.b  $00(A1, D0), D0
                bmi.s   Offset_0x037022
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.b  (A2)+, D0
                move.b  (A2)+, D3
                move.b  Obj_Ani_Time_2(A0), D2                           ; $001F
                addq.b  #$01, D2
                cmp.b   D3, D2
                bcs.s   Offset_0x036FEA
                addq.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
                moveq   #$00, D2
Offset_0x036FEA:
                move.b  D2, Obj_Ani_Time_2(A0)                           ; $001F
Offset_0x036FEE:
                move.w  (A2)+, D1
                move.w  $00(A0, D1), A3
                tst.w   D1
                bne.s   Offset_0x036FFA
                move.l  A0, A3
Offset_0x036FFA:
                move.l  Obj_X(A3), D2                                    ; $0008
                move.w  (A2)+, D1
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D2
                move.l  D2, Obj_X(A3)                                    ; $0008
                move.l  Obj_Y(A3), D3                                    ; $000C
                move.w  (A2)+, D1
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D3
                move.l  D3, Obj_Y(A3)                                    ; $000C
                dbra    D0, Offset_0x036FEE
                moveq   #$00, D1
                rts
Offset_0x037022:
                moveq   #$01, D1
                rts
Offset_0x037026:
                move.w  Obj_Control_Var_00(A0), A2                       ; $002C
                move.w  Obj_X(A2), D0                                    ; $0008
                add.w   (A1)+, D0
                move.w  D0, Obj_X(A0)                                    ; $0008
                move.w  Obj_Y(A2), D0                                    ; $000C
                add.w   (A1)+, D0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                rts
Offset_0x037040:
                move.w  (A1)+, D6
Offset_0x037042:
                move.w  (A1)+, D0
                move.w  $00(A0, D0), A2
                move.w  Obj_X(A0), D0                                    ; $0008
                move.b  (A1)+, D1
                ext.w   D1
                add.w   D1, D0
                move.w  D0, Obj_X(A2)                                    ; $0008
                move.w  Obj_Y(A0), D0                                    ; $000C
                move.b  (A1)+, D1
                ext.w   D1
                add.w   D1, D0
                move.w  D0, Obj_Y(A2)                                    ; $000C
                dbra    D6, Offset_0x037042
                rts
;-------------------------------------------------------------------------------  
Offset_0x03706A:
                dc.w    $0007
                dc.w    $002C, $FC3C
                dc.w    $002E, $0408
                dc.w    $0030, $EC08
                dc.w    $0032, $0CF8
                dc.w    $0034, $0424
                dc.w    $003A, $FC3C
                dc.w    $003C, $EC08
                dc.w    $003E, $0424       
;-------------------------------------------------------------------------------        
DEz_Boss_Animate_Data_Ptr:                                     ; Offset_0x03708C
                dc.l    DEz_Boss_Animate_Data                  ; Offset_0x0370A8
                dc.b    $00, $01, $02, $03, $04, $05, $06, $07
                dc.b    $08, $09, $0A, $00, $01, $02, $03, $04
                dc.b    $05, $06, $07, $08, $09, $0A, $FF, $00 
;-------------------------------------------------------------------------------    
DEz_Boss_Animate_Data:                                         ; Offset_0x0370A8  
                dc.w    Offset_0x0370BE-DEz_Boss_Animate_Data
                dc.w    Offset_0x0370F0-DEz_Boss_Animate_Data
                dc.w    Offset_0x037122-DEz_Boss_Animate_Data
                dc.w    Offset_0x03714E-DEz_Boss_Animate_Data
                dc.w    Offset_0x037180-DEz_Boss_Animate_Data
                dc.w    Offset_0x0371B2-DEz_Boss_Animate_Data
                dc.w    Offset_0x0371C0-DEz_Boss_Animate_Data
                dc.w    Offset_0x0371F2-DEz_Boss_Animate_Data
                dc.w    Offset_0x03721E-DEz_Boss_Animate_Data
                dc.w    Offset_0x037250-DEz_Boss_Animate_Data
                dc.w    Offset_0x037282-DEz_Boss_Animate_Data
Offset_0x0370BE:
                dc.b    $07, $10, $00, $34, $FF, $00, $FF, $00
                dc.b    $00, $2C, $FF, $00, $FF, $00, $00, $00
                dc.b    $00, $00, $FF, $80, $00, $2E, $00, $00
                dc.b    $FF, $80, $00, $30, $00, $00, $FF, $80
                dc.b    $00, $32, $00, $00, $FF, $80, $00, $3C
                dc.b    $00, $00, $FF, $80, $00, $3E, $00, $00
                dc.b    $FF, $C0
Offset_0x0370F0:
                dc.b    $07, $08, $00, $34, $FE, $00, $FF, $80
                dc.b    $00, $2C, $FE, $00, $FF, $80, $00, $00
                dc.b    $FE, $00, $FF, $80, $00, $2E, $FE, $00
                dc.b    $FF, $80, $00, $30, $FE, $00, $FF, $80
                dc.b    $00, $32, $FE, $00, $FF, $80, $00, $3C
                dc.b    $FE, $00, $FF, $80, $00, $3E, $FF, $00
                dc.b    $00, $00
Offset_0x037122:
                dc.b    $06, $08, $00, $34, $FF, $00, $00, $80
                dc.b    $00, $2C, $FF, $00, $00, $80, $00, $00
                dc.b    $FF, $00, $00, $80, $00, $2E, $FF, $00
                dc.b    $00, $80, $00, $30, $FF, $00, $00, $80
                dc.b    $00, $32, $FF, $00, $00, $80, $00, $3C
                dc.b    $FF, $00, $00, $80
Offset_0x03714E:
                dc.b    $07, $08, $00, $34, $FF, $80, $02, $00
                dc.b    $00, $2C, $FF, $00, $02, $00, $00, $00
                dc.b    $00, $00, $01, $00, $00, $2E, $00, $00
                dc.b    $01, $00, $00, $30, $00, $00, $01, $00
                dc.b    $00, $32, $00, $00, $01, $00, $00, $3C
                dc.b    $00, $00, $01, $00, $00, $3E, $00, $00
                dc.b    $01, $00
Offset_0x037180:
                dc.b    $07, $10, $00, $34, $FF, $C0, $FF, $C0
                dc.b    $00, $00, $FE, $80, $FF, $80, $00, $2E
                dc.b    $FE, $80, $FF, $80, $00, $30, $FE, $80
                dc.b    $FF, $80, $00, $32, $FE, $80, $FF, $80
                dc.b    $00, $3C, $FE, $80, $FF, $80, $00, $3E
                dc.b    $FD, $80, $FF, $40, $00, $3A, $FD, $00
                dc.b    $FF, $80
Offset_0x0371B2:
                dc.b    $01, $10, $00, $3E, $FF, $00, $FF, $80
                dc.b    $00, $3A, $FF, $00, $FF, $80
Offset_0x0371C0:
                dc.b    $07, $08, $00, $3E, $FE, $00, $FF, $80
                dc.b    $00, $3A, $FE, $00, $FF, $80, $00, $00
                dc.b    $FE, $00, $FF, $80, $00, $2E, $FE, $00
                dc.b    $FF, $80, $00, $30, $FE, $00, $FF, $80
                dc.b    $00, $32, $FE, $00, $FF, $80, $00, $3C
                dc.b    $FE, $00, $FF, $80, $00, $34, $FF, $00
                dc.b    $00, $00
Offset_0x0371F2:
                dc.b    $06, $08, $00, $3E, $FF, $00, $00, $80
                dc.b    $00, $3A, $FF, $00, $00, $80, $00, $00
                dc.b    $FF, $00, $00, $80, $00, $2E, $FF, $00
                dc.b    $00, $80, $00, $30, $FF, $00, $00, $80
                dc.b    $00, $32, $FF, $00, $00, $80, $00, $3C
                dc.b    $FF, $00, $00, $80
Offset_0x03721E:
                dc.b    $07, $08, $00, $3E, $FF, $80, $02, $00
                dc.b    $00, $3A, $FF, $00, $02, $00, $00, $00
                dc.b    $00, $00, $01, $00, $00, $2E, $00, $00
                dc.b    $01, $00, $00, $30, $00, $00, $01, $00
                dc.b    $00, $32, $00, $00, $01, $00, $00, $3C
                dc.b    $00, $00, $01, $00, $00, $34, $00, $00
                dc.b    $01, $00
Offset_0x037250:
                dc.b    $07, $10, $00, $3E, $FF, $C0, $FF, $C0
                dc.b    $00, $00, $FE, $80, $FF, $80, $00, $2E
                dc.b    $FE, $80, $FF, $80, $00, $30, $FE, $80
                dc.b    $FF, $80, $00, $32, $FE, $80, $FF, $80
                dc.b    $00, $3C, $FE, $80, $FF, $80, $00, $34
                dc.b    $FD, $80, $FF, $40, $00, $2C, $FD, $00
                dc.b    $FF, $80
Offset_0x037282:
                dc.b    $01, $10, $00, $34, $FF, $00, $FF, $80
                dc.b    $00, $2C, $FF, $00, $FF, $80            
;-------------------------------------------------------------------------------  
Load_DEz_Boss_Sub_Obj_0xC7:                                    ; Offset_0x037290
                dc.w    $002A
                dc.b    $C7, $A0   
;-------------------------------------------------------------------------------  
Load_DEz_Boss_Sub_Obj_0xC7_1:                                  ; Offset_0x037294
                dc.w    $002C
                dc.b    $C7, $A2 
;------------------------------------------------------------------------------- 
Load_DEz_Boss_Sub_Obj_0xC7_2:                                  ; Offset_0x037298
                dc.w    $002E
                dc.b    $C7, $A4 
;-------------------------------------------------------------------------------  
Load_DEz_Boss_Sub_Obj_0xC7_3:                                  ; Offset_0x03729C   
                dc.w    $0030
                dc.b    $C7, $A6
;-------------------------------------------------------------------------------                                     
Load_DEz_Boss_Sub_Obj_0xC7_4:                                  ; Offset_0x0372A0
                dc.w    $0032
                dc.b    $C7, $A8
;-------------------------------------------------------------------------------                 
Load_DEz_Boss_Sub_Obj_0xC7_5:                                  ; Offset_0x0372A4
                dc.w    $0034
                dc.b    $C7, $AA
;-------------------------------------------------------------------------------                 
Load_DEz_Boss_Sub_Obj_0xC7_6:                                  ; Offset_0x0372A8
                dc.w    $0036
                dc.b    $C7, $AC
;-------------------------------------------------------------------------------                 
Load_DEz_Boss_Sub_Obj_0xC7_7:                                  ; Offset_0x0372AC
                dc.w    $0038
                dc.b    $C7, $AE  
;-------------------------------------------------------------------------------  
Load_DEz_Boss_Sub_Obj_0xC7_8:                                  ; Offset_0x0372B0
                dc.w    $003A
                dc.b    $C7, $B0 
;-------------------------------------------------------------------------------  
Load_DEz_Boss_Sub_Obj_0xC7_9:                                  ; Offset_0x0372B4
                dc.w    $003C
                dc.b    $C7, $B2 
;-------------------------------------------------------------------------------  
Load_DEz_Boss_Sub_Obj_0xC7_A:                                  ; Offset_0x0372B8  
                dc.w    $003E
                dc.b    $C7, $B4         
;-------------------------------------------------------------------------------  
Obj_0xC7_Ptr:                                                  ; Offset_0x0372BC
                dc.l    DEz_Boss_Mappings                      ; Offset_0x0372F6
                dc.w    $0330
                dc.b    $04, $04, $38, $96                    
;------------------------------------------------------------------------------- 
DEz_Boss_Animate_Data_1:                                       ; Offset_0x0372C6
                dc.w    Offset_0x0372C8-DEz_Boss_Animate_Data_1
Offset_0x0372C8:
                dc.b    $07, $16, $16, $16, $16, $16, $16, $16
                dc.b    $00, $01, $02, $FA      
;-------------------------------------------------------------------------------   
DEz_Boss_Animate_Data_2:                                       ; Offset_0x0372D4
                dc.w    Offset_0x0372D8-DEz_Boss_Animate_Data_2
                dc.w    Offset_0x0372DC-DEz_Boss_Animate_Data_2
Offset_0x0372D8:
                dc.b    $01, $0C, $0D, $FF
Offset_0x0372DC:
                dc.b    $01, $0C, $0D, $0C, $0C, $0D, $0D, $0C
                dc.b    $0C, $0C, $0D, $0D, $0D, $0C, $0C, $0C
                dc.b    $0C, $0C, $0D, $0D, $0D, $0D, $0D, $0D
                dc.b    $FA, $00                                 
;-------------------------------------------------------------------------------   
DEz_Boss_Mappings:                                             ; Offset_0x0372F6
                dc.w    Offset_0x037324-DEz_Boss_Mappings
                dc.w    Offset_0x03732E-DEz_Boss_Mappings
                dc.w    Offset_0x037348-DEz_Boss_Mappings
                dc.w    Offset_0x037362-DEz_Boss_Mappings
                dc.w    Offset_0x0373B4-DEz_Boss_Mappings
                dc.w    Offset_0x0373BE-DEz_Boss_Mappings
                dc.w    Offset_0x0373C8-DEz_Boss_Mappings
                dc.w    Offset_0x0373D2-DEz_Boss_Mappings
                dc.w    Offset_0x0373DC-DEz_Boss_Mappings
                dc.w    Offset_0x0373EE-DEz_Boss_Mappings
                dc.w    Offset_0x037400-DEz_Boss_Mappings
                dc.w    Offset_0x03740A-DEz_Boss_Mappings
                dc.w    Offset_0x03743C-DEz_Boss_Mappings
                dc.w    Offset_0x037446-DEz_Boss_Mappings
                dc.w    Offset_0x037450-DEz_Boss_Mappings
                dc.w    Offset_0x03745A-DEz_Boss_Mappings
                dc.w    Offset_0x037464-DEz_Boss_Mappings
                dc.w    Offset_0x037486-DEz_Boss_Mappings
                dc.w    Offset_0x037490-DEz_Boss_Mappings
                dc.w    Offset_0x03749A-DEz_Boss_Mappings
                dc.w    Offset_0x0374A4-DEz_Boss_Mappings
                dc.w    Offset_0x0374AE-DEz_Boss_Mappings
                dc.w    Offset_0x0374B8-DEz_Boss_Mappings
Offset_0x037324:
                dc.w    $0001
                dc.l    $F00B0000, $0000000C
Offset_0x03732E:
                dc.w    $0003
                dc.l    $F00D000C, $0006FFEC
                dc.l    $00090014, $000AFFF4
                dc.l    $F80A001A, $000D000C
Offset_0x037348:
                dc.w    $0003
                dc.l    $08000023, $0011FFDC
                dc.l    $F80E0024, $0012FFE4
                dc.l    $F80E0030, $00180004
Offset_0x037362:
                dc.w    $000A
                dc.l    $DC0F203C, $201EFFD4
                dc.l    $DC0F204C, $2026FFF4
                dc.l    $DC0B205C, $202E0014
                dc.l    $DC0B2068, $2034002C
                dc.l    $FC0F2074, $203AFFD4
                dc.l    $FC0F2084, $2042FFF4
                dc.l    $FC0B2094, $204A0014
                dc.l    $FC0920A0, $2050002C
                dc.l    $1C0C20A6, $2053FFE4
                dc.l    $1C0C20AA, $20550004
Offset_0x0373B4:
                dc.w    $0001
                dc.l    $F00F20AE, $2057FFF0
Offset_0x0373BE:
                dc.w    $0001
                dc.l    $F40A20BE, $205FFFF4
Offset_0x0373C8:
                dc.w    $0001
                dc.l    $F40E20C7, $2063FFF0
Offset_0x0373D2:
                dc.w    $0001
                dc.l    $F40E20D3, $2069FFE8
Offset_0x0373DC:
                dc.w    $0002
                dc.l    $F40E20D3, $2069FFE8
                dc.l    $FC0020DF, $206F0008
Offset_0x0373EE:
                dc.w    $0002
                dc.l    $F40E20D3, $2069FFE8
                dc.l    $FC0420E0, $20700008
Offset_0x037400:
                dc.w    $0001
                dc.l    $F00F20E2, $2071FFF0
Offset_0x03740A:
                dc.w    $0006
                dc.l    $E00620F2, $2079FFEB
                dc.l    $E80920F8, $207CFFFB
                dc.l    $F80620FE, $207FFFEE
                dc.l    $100D2104, $2082FFE0
                dc.l    $F80E210C, $2086FFFE
                dc.l    $100D2118, $208C0000
Offset_0x03743C:
                dc.w    $0001
                dc.l    $F4062120, $2090FFF8
Offset_0x037446:
                dc.w    $0001
                dc.l    $F4052126, $2093FFF8
Offset_0x037450:
                dc.w    $0001
                dc.l    $F00F012B, $0095FFF0
Offset_0x03745A:
                dc.w    $0001
                dc.l    $FC00013B, $009DFFFC
Offset_0x037464:
                dc.w    $0004
                dc.l    $F005213C, $209EFFF0
                dc.l    $F005293C, $289E0000
                dc.l    $0005313C, $309EFFF0
                dc.l    $0005393C, $389E0000
Offset_0x037486:
                dc.w    $0001
                dc.l    $F8052140, $20A0FFF8
Offset_0x037490:
                dc.w    $0001
                dc.l    $FC002144, $20A2FFFC
Offset_0x03749A:
                dc.w    $0001
                dc.l    $FC002145, $20A2FFFC
Offset_0x0374A4:
                dc.w    $0001
                dc.l    $FC002146, $20A3FFFC
Offset_0x0374AE:
                dc.w    $0001
                dc.l    $FC00212A, $2095FFFC
Offset_0x0374B8:
                dc.w    $0001
                dc.l    $00000004, $00020000
;===============================================================================   
; Objeto 0xC7 - Robotnik gigante na última batalha do jogo na Death Egg
; <<<-
;===============================================================================