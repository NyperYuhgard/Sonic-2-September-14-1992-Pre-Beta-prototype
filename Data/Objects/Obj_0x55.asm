;===============================================================================
; Objeto 0x55 - Robotnik na Oil Ocean
; ->>>        
;===============================================================================     
; Offset_0x02E3F0:
                moveq   #$00, D0
                move.b  Obj_Boss_Routine(A0), D0                         ; $000A
                move.w  Offset_0x02E3FE(PC, D0), D1
                jmp     Offset_0x02E3FE(PC, D1)     
;-------------------------------------------------------------------------------       
Offset_0x02E3FE:
                dc.w    Offset_0x02E408-Offset_0x02E3FE
                dc.w    Offset_0x02E446-Offset_0x02E3FE
                dc.w    Offset_0x02E654-Offset_0x02E3FE
                dc.w    Offset_0x02E8A0-Offset_0x02E3FE
                dc.w    Offset_0x02E9BA-Offset_0x02E3FE    
;-------------------------------------------------------------------------------   
Offset_0x02E408:
                move.l  #OOz_Boss_Mappings, Obj_Map(A0) ; Offset_0x02EBA0, $0004
                move.w  #$038C, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                bset    #$06, Obj_Flags(A0)                              ; $0001
                move.b  #$00, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                addq.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$08, Obj_Control_Var_06(A0)                     ; $0032
                move.b  #$40, $000E(A0)
                rts    
;-------------------------------------------------------------------------------
Offset_0x02E446:
                moveq   #$00, D0
                move.b  Obj_Ani_Boss_Routine(A0), D0                     ; $0026
                move.w  Offset_0x02E454(PC, D0), D1
                jmp     Offset_0x02E454(PC, D1)   
;-------------------------------------------------------------------------------       
Offset_0x02E454:
                dc.w    Offset_0x02E45E-Offset_0x02E454
                dc.w    Offset_0x02E4D8-Offset_0x02E454
                dc.w    Offset_0x02E51A-Offset_0x02E454
                dc.w    Offset_0x02E564-Offset_0x02E454
                dc.w    Offset_0x02E606-Offset_0x02E454   
;-------------------------------------------------------------------------------    
Offset_0x02E45E:
                move.w  #$2940, (Boss_Move_Buffer).w                 ; $FFFFF750
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                move.w  (Player_Position_X).w, D1                    ; $FFFFB008
                cmpi.w  #$293A, D1
                bcc.s   Offset_0x02E47A
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x02E47A:
                move.w  #$02D0, Obj_Y(A0)                                ; $000C
                move.w  #$02D0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.b  #$08, Obj_Boss_Ani_Map(A0)                       ; $000B
                move.b  #$01, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$FF80, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$0F, Obj_Col_Flags(A0)                          ; $0020
                move.w  Obj_X(A0), Obj_Speed(A0)                  ; $0008, $0010
                move.w  Obj_Y(A0), Obj_Speed_Y(A0)                ; $000C, $0012
                clr.b   Obj_Map_Id(A0)                                   ; $001A
                clr.b   Obj_Timer(A0)                                    ; $002A
                move.b  #$08, Obj_Ani_Boss_Frame(A0)                     ; $0015
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$05, (A2)+
                move.b  #$00, (A2)+
                move.b  #$01, (A2)+
                move.b  #$00, (A2)
                move.b  #$00, ($FFFFF73F).w
                rts   
;-------------------------------------------------------------------------------
Offset_0x02E4D8:
                bsr     Boss_Move                              ; Offset_0x028E8C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                bsr     Offset_0x02E54A
                cmpi.w  #$0290, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc     Offset_0x02E5BE
                move.w  #$0290, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$00A8, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                btst    #$07, Obj_Timer(A0)                              ; $002A
                bne     Offset_0x02E5BE
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$10, (A2)+
                move.b  #$00, (A2)
                bra     Offset_0x02E5BE 
;-------------------------------------------------------------------------------
Offset_0x02E51A:
                btst    #$07, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x02E53C
                bsr     Offset_0x02E54A
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bpl     Offset_0x02E5BE
                lea     (Boss_Animate_Buffer).w, A2                  ; $FFFFF740
                move.b  #$05, (A2)+
                move.b  #$00, (A2)
Offset_0x02E53C:
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$FFC0, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bra     Offset_0x02E5BE
Offset_0x02E54A:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                jsr     (CalcSine)                             ; Offset_0x00396A
                asr.w   #$07, D1
                add.w   (Boss_Move_Buffer+$04).w, D1                 ; $FFFFF754
                move.w  D1, Obj_Y(A0)                                    ; $000C
                addq.b  #$04, Obj_Map_Id(A0)                             ; $001A
                rts   
;-------------------------------------------------------------------------------
Offset_0x02E564:
                bsr     Boss_Move                              ; Offset_0x028E8C
                move.w  (Boss_Move_Buffer+$04).w, Obj_Y(A0)          ; $FFFFF754; $000C
                move.w  (Boss_Move_Buffer).w, Obj_X(A0)              ; $FFFFF750; $0008
                btst    #$06, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x02E59C
                cmpi.w  #$028C, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc     Offset_0x02E5BE
                move.w  #$028C, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.w  #$0080, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                ori.b   #$40, Obj_Timer(A0)                              ; $002A
                bra     Offset_0x02E5BE
Offset_0x02E59C:
                cmpi.w  #$02D0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcs.s   Offset_0x02E5BE
                move.w  #$02D0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                clr.b   Obj_Ani_Boss_Routine(A0)                         ; $0026
                addq.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
                btst    #$07, Obj_Timer(A0)                              ; $002A
                beq.s   Offset_0x02E5BE
                addq.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
Offset_0x02E5BE:
                bsr     Offset_0x02E5D4
                lea     (OOz_Boss_Animate_Data), A1            ; Offset_0x02EB5C
                bsr     Boss_AnimateSprite                     ; Offset_0x028EB2
                bsr     Offset_0x02E5F4
                bra     Jmp_22_To_DisplaySprite                ; Offset_0x02ECE8
Offset_0x02E5D4:
                bsr     Boss_Hit                               ; Offset_0x028E10
                cmpi.b  #$1F, Obj_Inertia(A0)                            ; $0014
                bne.s   Offset_0x02E5F2
                lea     (Boss_Animate_Buffer).w, A1                  ; $FFFFF740
                andi.b  #$F0, (A1)
                ori.b   #$03, (A1)
                ori.b   #$80, Obj_Timer(A0)                              ; $002A
Offset_0x02E5F2:
                rts
Offset_0x02E5F4:
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  Obj_Y(A0), D1                                    ; $000C
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.w  D1, Obj_Speed_Y(A0)                              ; $0012
                rts
;-------------------------------------------------------------------------------
Offset_0x02E606:
                subq.w  #$01, (Boss_Move_Buffer+$0C).w               ; $FFFFF75C
                bmi.s   Offset_0x02E622
                cmpi.w  #$001E, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bcc.s   Offset_0x02E61A
                move.b  #$0B, Obj_Boss_Ani_Map(A0)                       ; $000B
Offset_0x02E61A:
                bsr     Boss_Defeated                          ; Offset_0x028F7A
                bra     Jmp_22_To_DisplaySprite                ; Offset_0x02ECE8
Offset_0x02E622:
                cmpi.w  #$2CFE, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                bcc.s   Offset_0x02E630
                addq.w  #$02, (Sonic_Level_Limits_Max_X).w           ; $FFFFEECA
                bra.s   Offset_0x02E63E
Offset_0x02E630:
                move.w  #$2D00, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                cmpi.w  #$02D0, Obj_Y(A0)                                ; $000C
                bcc.s   Offset_0x02E64A
Offset_0x02E63E:
                addi.w  #$0001, Obj_Y(A0)                                ; $000C
                bsr.s   Offset_0x02E5F4
                bra     Jmp_22_To_DisplaySprite                ; Offset_0x02ECE8
Offset_0x02E64A:
                move.b  #$01, ($FFFFF7A7).w
                bra     Jmp_25_To_DeleteObject                 ; Offset_0x02ECEE  
;-------------------------------------------------------------------------------
Offset_0x02E654:
                moveq   #$00, D0
                move.b  Obj_Ani_Boss_Routine(A0), D0                     ; $0026
                move.w  Offset_0x02E662(PC, D0), D1
                jmp     Offset_0x02E662(PC, D1) 
;-------------------------------------------------------------------------------              
Offset_0x02E662:
                dc.w    Offset_0x02E66C-Offset_0x02E662
                dc.w    Offset_0x02E6E0-Offset_0x02E662
                dc.w    Offset_0x02E710-Offset_0x02E662
                dc.w    Offset_0x02E76E-Offset_0x02E662
                dc.w    Offset_0x02E7D2-Offset_0x02E662      
;-------------------------------------------------------------------------------    
Offset_0x02E66C:
                clr.w   ($FFFFFB22).w
                move.w  #$2940, (Boss_Move_Buffer).w                 ; $FFFFF750
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                move.w  (Player_Position_X).w, D1                    ; $FFFFB008
                cmpi.w  #$293A, D1
                bcs.s   Offset_0x02E68C
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x02E68C:
                move.w  #$02B0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.w  #$02B0, Obj_Y(A0)                                ; $000C
                move.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$8A, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$05, Obj_Boss_Ani_Map(A0)                       ; $000B
                moveq   #$07, D0
                moveq   #$07, D2
                moveq   #$00, D4
                move.w  (Boss_Move_Buffer+$04).w, D5                 ; $FFFFF754
Offset_0x02E6B4:
                addi.w  #$000F, D5
                move.b  D0, $15(A0, D4)
                move.w  D5, $12(A0, D4)
                addq.w  #$06, D4
                dbra    D2, Offset_0x02E6B4
                move.b  #$08, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                move.w  #$FF80, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$00, Obj_Control_Var_12(A0)                     ; $003E
                move.b  #$01, ($FFFFF73F).w
                rts           
;-------------------------------------------------------------------------------
Offset_0x02E6E0:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$0240, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcc     Offset_0x02E804
                move.w  #$0240, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                addi.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$0080, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.b  #$03, Obj_Control_Var_0C(A0)                     ; $0038
                bra     Offset_0x02E804   
;-------------------------------------------------------------------------------
Offset_0x02E710:
                subq.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                bne.s   Offset_0x02E71C
                move.b  #$05, Obj_Boss_Ani_Map(A0)                       ; $000B
Offset_0x02E71C:
                subi.w  #$0001, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                bne     Offset_0x02E804
                subi.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bmi.s   Offset_0x02E756
                bsr     Jmp_04_To_PseudoRandomNumber           ; Offset_0x02ED12
Offset_0x02E732:
                addq.b  #$01, D0
                andi.w  #$0003, D0
                btst    D0, Obj_Control_Var_12(A0)                       ; $003E
                bne.s   Offset_0x02E732
                bset    D0, Obj_Control_Var_12(A0)                       ; $003E
                add.w   D0, D0
                move.w  Offset_0x02E766(PC, D0), (Boss_Move_Buffer+$0C).w ; $FFFFF75C
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bsr     Offset_0x02E810
                bra     Offset_0x02E804
Offset_0x02E756:
                move.w  #$0080, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$08, Obj_Ani_Boss_Routine(A0)                   ; $0026
                bra     Offset_0x02E804      
;-------------------------------------------------------------------------------         
Offset_0x02E766:
                dc.w    $0238, $0230, $0240, $025F  
;-------------------------------------------------------------------------------      
Offset_0x02E76E:
                bsr     Boss_Move                              ; Offset_0x028E8C
                move.w  (Boss_Move_Buffer+$0C).w, D0                 ; $FFFFF75C
                tst.w   (Boss_Move_Buffer+$0A).w                     ; $FFFFF75A
                bmi.s   Offset_0x02E786
                cmp.w   (Boss_Move_Buffer+$04).w, D0                 ; $FFFFF754
                bcs.s   Offset_0x02E78C
                bra     Offset_0x02E804
Offset_0x02E786:
                cmp.w   (Boss_Move_Buffer+$04).w, D0                 ; $FFFFF754
                bcs.s   Offset_0x02E804
Offset_0x02E78C:
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$08, Obj_Control_Var_00(A0)                     ; $002C
                move.b  #$06, Obj_Boss_Ani_Map(A0)                       ; $000B
                bsr     Jmp_0F_To_SingleObjectLoad             ; Offset_0x02ECF4
                bne     Offset_0x02E804
                move.b  #$55, (A1)
                move.b  #$08, Obj_Boss_Routine(A1)                       ; $000A
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.b  #$EA, D0
                bsr     Jmp_04_To_Play_Sfx                     ; Offset_0x02ED00
                move.b  #$04, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.w  #$0028, (Boss_Move_Buffer+$0C).w             ; $FFFFF75C
                move.w  #$FF80, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                bra     Offset_0x02E804   
;-------------------------------------------------------------------------------
Offset_0x02E7D2:
                subq.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                bne.s   Offset_0x02E7DE
                move.b  #$05, Obj_Boss_Ani_Map(A0)                       ; $000B
Offset_0x02E7DE:
                bsr     Boss_Move                              ; Offset_0x028E8C
                cmpi.w  #$02B0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                bcs.s   Offset_0x02E804
                move.w  #$02B0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.w  #$0000, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                move.b  #$00, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$02, Obj_Boss_Routine(A0)                       ; $000A
                rts
Offset_0x02E804:
                bsr     Offset_0x02E82A
                bsr     Offset_0x02E850
                bra     Jmp_22_To_DisplaySprite                ; Offset_0x02ECE8        
Offset_0x02E810:
                move.w  (Boss_Move_Buffer+$0C).w, D0                 ; $FFFFF75C
                sub.w   (Boss_Move_Buffer+$04).w, D0                 ; $FFFFF754
                bpl.s   Offset_0x02E822
                move.w  #$FF80, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                rts
Offset_0x02E822:
                move.w  #$0080, (Boss_Move_Buffer+$0A).w             ; $FFFFF75A
                rts
Offset_0x02E82A:
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                blt.s   Offset_0x02E842
                subi.w  #$0008, D0
                blt.s   Offset_0x02E840
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x02E840:
                rts
Offset_0x02E842:
                addi.w  #$0008, D0
                bgt.s   Offset_0x02E840
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                rts
Offset_0x02E850:
                move.w  (Boss_Move_Buffer).w, D5                     ; $FFFFF750
                move.w  (Boss_Move_Buffer+$04).w, D6                 ; $FFFFF754
                move.b  Obj_Map_Id(A0), D3                               ; $001A
                move.b  D3, D0
                bsr     Offset_0x02E890
                move.w  D1, Obj_X(A0)                                    ; $0008
                move.w  D0, Obj_Y(A0)                                    ; $000C
                addi.b  #$02, Obj_Map_Id(A0)                             ; $001A
                moveq   #$07, D2
                moveq   #$00, D4
Offset_0x02E874:
                addi.w  #$000F, D6
                subi.b  #$10, D3
                bsr     Offset_0x02E890
                move.w  D1, $10(A0, D4)
                move.w  D0, $12(A0, D4)
                addq.w  #$06, D4
                dbra    D2, Offset_0x02E874
                rts
Offset_0x02E890:
                move.b  D3, D0
                bsr     Jmp_0B_To_CalcSine                     ; Offset_0x02ED1E
                asr.w   #$04, D1
                add.w   D5, D1
                asr.w   #$06, D0
                add.w   D6, D0
                rts 
;-------------------------------------------------------------------------------              
Offset_0x02E8A0:
                moveq   #$00, D0
                move.b  Obj_Ani_Boss_Routine(A0), D0                     ; $0026
                move.w  Offset_0x02E8AE(PC, D0), D1
                jmp     Offset_0x02E8AE(PC, D1)    
;-------------------------------------------------------------------------------              
Offset_0x02E8AE:
                dc.w    Offset_0x02E8B2-Offset_0x02E8AE
                dc.w    Offset_0x02E916-Offset_0x02E8AE   
;-------------------------------------------------------------------------------    
Offset_0x02E8B2:
                clr.w   ($FFFFFB22).w
                move.w  #$28C0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                move.w  (Player_Position_X).w, D1                    ; $FFFFB008
                cmpi.w  #$293A, D1
                bcs.s   Offset_0x02E8D8
                move.w  #$29C0, (Boss_Move_Buffer).w                 ; $FFFFF750
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x02E8D8:
                move.w  #$02A0, (Boss_Move_Buffer+$04).w             ; $FFFFF754
                move.b  #$02, Obj_Boss_Ani_Map(A0)                       ; $000B
                move.b  #$8A, Obj_Col_Flags(A0)                          ; $0020
                addq.b  #$02, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$40, $000E(A0)
                clr.b   Obj_Map_Id(A0)                                   ; $001A
                moveq   #$07, D0
                moveq   #$07, D1
                moveq   #$00, D2
Offset_0x02E8FE:
                move.b  D1, $15(A0, D2)
                addq.w  #$06, D2
                dbra    D0, Offset_0x02E8FE
                move.b  #$08, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                move.b  #$02, ($FFFFF73F).w
                rts  
;-------------------------------------------------------------------------------
Offset_0x02E916:
                bsr     Offset_0x02E938
                cmpi.b  #$FE, Obj_Map_Id(A0)                             ; $001A
                bcs.s   Offset_0x02E930
                move.b  #$00, Obj_Ani_Boss_Routine(A0)                   ; $0026
                move.b  #$04, Obj_Boss_Routine(A0)                       ; $000A
                rts
Offset_0x02E930:
                bsr     Offset_0x02E996
                bra     Jmp_22_To_DisplaySprite                ; Offset_0x02ECE8
Offset_0x02E938:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                addi.b  #$40, D0
                move.b  D0, D3
                bsr     Offset_0x02E970
                move.w  D1, Obj_X(A0)                                    ; $0008
                move.w  D0, Obj_Y(A0)                                    ; $000C
                addi.b  #$01, Obj_Map_Id(A0)                             ; $001A
                moveq   #$07, D2
                moveq   #$00, D4
Offset_0x02E958:
                subi.b  #$06, D3
                bsr     Offset_0x02E970
                move.w  D1, $10(A0, D4)
                move.w  D0, $12(A0, D4)
                addq.w  #$06, D4
                dbra    D2, Offset_0x02E958
                rts
Offset_0x02E970:
                move.b  D3, D0
                bsr     Jmp_0B_To_CalcSine                     ; Offset_0x02ED1E
                muls.w  #$0068, D1
                asr.l   #$08, D1
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x02E986
                neg.w   D1
Offset_0x02E986:
                add.w   (Boss_Move_Buffer).w, D1                     ; $FFFFF750
                muls.w  #$0068, D0
                asr.l   #$08, D0
                add.w   (Boss_Move_Buffer+$04).w, D0                 ; $FFFFF754
                rts
Offset_0x02E996:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                moveq   #$15, D1
                cmpi.b  #$52, D0
                bcs.s   Offset_0x02E9B4
                moveq   #$03, D1
                cmpi.b  #$6B, D0
                bcs.s   Offset_0x02E9B4
                moveq   #$02, D1
                cmpi.b  #$92, D0
                bcs.s   Offset_0x02E9B4
                moveq   #$04, D1
Offset_0x02E9B4:
                move.b  D1, Obj_Boss_Ani_Map(A0)                         ; $000B
                rts 
;-------------------------------------------------------------------------------                                   
Offset_0x02E9BA:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x02E9C8(PC, D0), D0
                jmp     Offset_0x02E9C8(PC, D0)   
;-------------------------------------------------------------------------------           
Offset_0x02E9C8:
                dc.w    Offset_0x02E9D0-Offset_0x02E9C8
                dc.w    Offset_0x02EA28-Offset_0x02E9C8
                dc.w    Offset_0x02EAFC-Offset_0x02E9C8
                dc.w    Offset_0x02EB58-Offset_0x02E9C8  
;-------------------------------------------------------------------------------      
Offset_0x02E9D0:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.l  #OOz_Boss_Mappings, Obj_Map(A0) ; Offset_0x02EBA0, $0004
                move.w  #$038C, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                move.b  #$0C, Obj_Map_Id(A0)                             ; $001A
                move.w  #$FFE0, D0
                move.w  #$FC00, OOz_Robotnik_Pos_X(A0)                   ; $0010
                btst    #$00, Obj_Flags(A1)                              ; $0001
                beq.s   Offset_0x02EA1C
                neg.w   D0
                neg.w   OOz_Robotnik_Pos_X(A0)                           ; $0010
Offset_0x02EA1C:
                add.w   D0, Obj_X(A0)                                    ; $0008
                move.b  #$AB, Obj_Col_Flags(A0)                          ; $0020
                rts    
;-------------------------------------------------------------------------------
Offset_0x02EA28:
                bsr     Offset_0x02EA48
                bsr     Jmp_19_To_SpeedToPos                   ; Offset_0x02ED24
                cmpi.w  #$2870, Obj_X(A0)                                ; $0008
                bcs     Jmp_25_To_DeleteObject                 ; Offset_0x02ECEE
                cmpi.w  #$2A10, Obj_X(A0)                                ; $0008
                bcc     Jmp_25_To_DeleteObject                 ; Offset_0x02ECEE
                bra     Jmp_22_To_DisplaySprite                ; Offset_0x02ECE8
Offset_0x02EA48:
                cmpi.w  #$0250, Obj_Y(A0)                                ; $000C
                bcs.s   Offset_0x02EA70
                tst.w   OOz_Robotnik_Pos_X(A0)                           ; $0010
                bmi     Offset_0x02EA72
                move.w  Obj_X(A0), D0                                    ; $0008
                cmpi.w  #$2980, D0
                bcc.s   Offset_0x02EA70
                cmpi.w  #$297C, D0
                bcs     Offset_0x02EA70
                move.w  #$2988, D1
                bra.s   Offset_0x02EA8A
Offset_0x02EA70:
                rts
Offset_0x02EA72:
                move.w  Obj_X(A0), D0                                    ; $0008
                cmpi.w  #$2900, D0
                bcs.s   Offset_0x02EA88
                cmpi.w  #$2904, D0
                bcc.s   Offset_0x02EA88
                move.w  #$28F8, D1
                bra.s   Offset_0x02EA8A
Offset_0x02EA88:
                rts
Offset_0x02EA8A:
                bsr     Jmp_0F_To_SingleObjectLoad             ; Offset_0x02ECF4
                bne.s   Offset_0x02EAFA
                move.b  #$55, (A1)
                move.b  #$08, Obj_Boss_Routine(A1)                       ; $000A
                move.b  #$04, Obj_Routine_2(A1)                          ; $0025
                move.b  #$8B, Obj_Col_Flags(A1)                          ; $0020
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$0D, Obj_Map_Id(A1)                             ; $001A
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                move.l  #OOz_Boss_Mappings, Obj_Map(A1) ; Offset_0x02EBA0, $0004
                move.w  #$038C, Obj_Art_VRAM(A1)                         ; $0002
                bsr     Jmp_39_To_ModifySpriteAttr_2P          ; Offset_0x02ED18
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.w  #$0005, Obj_Control_Var_06(A1)                   ; $0032
                move.b  #$07, Obj_Control_Var_0A(A1)                     ; $0036
                move.w  OOz_Robotnik_Pos_X(A0), OOz_Robotnik_Pos_X(A1) ; $0010, $0010
                move.w  D1, Obj_X(A1)                                    ; $0008
                move.w  #$0250, Obj_Y(A1)                                ; $000C
                move.b  #$EB, D0
                bsr     Jmp_04_To_Play_Sfx                     ; Offset_0x02ED00
Offset_0x02EAFA:
                rts  
;-------------------------------------------------------------------------------
Offset_0x02EAFC:
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x02EB4A
                move.w  #$00C7, Obj_Control_Var_06(A0)                   ; $0032
                subq.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bmi.s   Offset_0x02EB4A
                bsr     Jmp_15_To_SingleObjectLoad_2           ; Offset_0x02ED06
                bne.s   Offset_0x02EB4A
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x02EB1A:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x02EB1A
                move.w  #$0005, Obj_Control_Var_06(A1)                   ; $0032
                move.w  #$0200, Obj_Ani_Number(A1)                       ; $001C
                move.w  #$0010, D0
                tst.w   OOz_Robotnik_Pos_X(A1)                           ; $0010
                bpl.s   Offset_0x02EB3E
                neg.w   D0
Offset_0x02EB3E:
                add.w   D0, Obj_X(A1)                                    ; $0008
                move.b  #$EB, D0
                bsr     Jmp_04_To_Play_Sfx                     ; Offset_0x02ED00
Offset_0x02EB4A:
                lea     (OOz_Boss_Animate_Data), A1            ; Offset_0x02EB5C
                bsr     Jmp_17_To_AnimateSprite                ; Offset_0x02ED0C
                bra     Jmp_27_To_MarkObjGone                  ; Offset_0x02ECFA 
;-------------------------------------------------------------------------------
Offset_0x02EB58:
                bra     Jmp_25_To_DeleteObject                 ; Offset_0x02ECEE
;-------------------------------------------------------------------------------
OOz_Boss_Animate_Data:                                         ; Offset_0x02EB5C
                dc.w    Offset_0x02EB68-OOz_Boss_Animate_Data
                dc.w    Offset_0x02EB82-OOz_Boss_Animate_Data
                dc.w    Offset_0x02EB85-OOz_Boss_Animate_Data
                dc.w    Offset_0x02EB97-OOz_Boss_Animate_Data
                dc.w    Offset_0x02EB9A-OOz_Boss_Animate_Data
                dc.w    Offset_0x02EB9D-OOz_Boss_Animate_Data
Offset_0x02EB68:
                dc.b    $09, $08, $08, $08, $08, $09, $09, $09
                dc.b    $09, $08, $08, $08, $08, $09, $09, $09
                dc.b    $09, $08, $08, $08, $08, $09, $09, $09
                dc.b    $09, $FF
Offset_0x02EB82:
                dc.b    $0F, $01, $FF
Offset_0x02EB85:
                dc.b    $01, $0D, $11, $0E, $12, $0F, $13, $10
                dc.b    $14, $14, $10, $13, $0F, $12, $0E, $11
                dc.b    $0D, $FA
Offset_0x02EB97:
                dc.b    $0F, $0A, $FF
Offset_0x02EB9A:
                dc.b    $0F, $0B, $FF
Offset_0x02EB9D:
                dc.b    $0F, $08, $FF                                 
;-------------------------------------------------------------------------------
OOz_Boss_Mappings:                                             ; Offset_0x02EBA0
                dc.w    OOz_Boss_Mappings-OOz_Boss_Mappings
                dc.w    Offset_0x02EBCC-OOz_Boss_Mappings
                dc.w    Offset_0x02EC06-OOz_Boss_Mappings
                dc.w    Offset_0x02EC18-OOz_Boss_Mappings
                dc.w    Offset_0x02EC32-OOz_Boss_Mappings
                dc.w    Offset_0x02EC5E-OOz_Boss_Mappings
                dc.w    Offset_0x02EC70-OOz_Boss_Mappings
                dc.w    Offset_0x02EC82-OOz_Boss_Mappings
                dc.w    Offset_0x02EC8C-OOz_Boss_Mappings
                dc.w    Offset_0x02EC96-OOz_Boss_Mappings
                dc.w    Offset_0x02ECA0-OOz_Boss_Mappings
                dc.w    Offset_0x02ECAA-OOz_Boss_Mappings
                dc.w    Offset_0x02ECB4-OOz_Boss_Mappings
                dc.w    Offset_0x02ECBE-OOz_Boss_Mappings
                dc.w    Offset_0x02ECC8-OOz_Boss_Mappings
                dc.w    Offset_0x02ECD2-OOz_Boss_Mappings
                dc.w    Offset_0x02ECDC-OOz_Boss_Mappings
                dc.w    Offset_0x02ECBE-OOz_Boss_Mappings
                dc.w    Offset_0x02ECC8-OOz_Boss_Mappings
                dc.w    Offset_0x02ECD2-OOz_Boss_Mappings
                dc.w    Offset_0x02ECDC-OOz_Boss_Mappings
                dc.w    Offset_0x02EC4C-OOz_Boss_Mappings
Offset_0x02EBCC:
                dc.w    $0007
                dc.l    $E00D2001, $20000000
                dc.l    $E8002000, $2000FFF8
                dc.l    $F00D2009, $2004FFE8
                dc.l    $F00D2011, $20080008
                dc.l    $000F2019, $200CFFD0
                dc.l    $000F2029, $2014FFF0
                dc.l    $000F2039, $201C0010
Offset_0x02EC06:
                dc.w    $0002
                dc.l    $F80D2049, $2024FFDE
                dc.l    $F8052079, $203CFFF8
Offset_0x02EC18:
                dc.w    $0003
                dc.l    $E2092051, $2028FFE2
                dc.l    $F2092057, $202BFFEA
                dc.l    $F8052079, $203CFFF8
Offset_0x02EC32:
                dc.w    $0003
                dc.l    $06062063, $2031FFE2
                dc.l    $FE06205D, $202EFFF2
                dc.l    $F8052079, $203CFFF8
Offset_0x02EC4C:
                dc.w    $0002
                dc.l    $DE0720AD, $2056FFF8
                dc.l    $F8052079, $203CFFF8
Offset_0x02EC5E:
                dc.w    $0002
                dc.l    $F80D2069, $2034FFE0
                dc.l    $F8052079, $203CFFF8
Offset_0x02EC70:
                dc.w    $0002
                dc.l    $F80D2071, $2038FFE0
                dc.l    $F8052079, $203CFFF8
Offset_0x02EC82:
                dc.w    $0001
                dc.l    $F8052079, $203CFFF8
Offset_0x02EC8C:
                dc.w    $0001
                dc.l    $F009007D, $003EFFF4                                     
Offset_0x02EC96:
                dc.w    $0001
                dc.l    $F0090083, $0041FFF4
Offset_0x02ECA0:
                dc.w    $0001
                dc.l    $F0090089, $0044FFF4
Offset_0x02ECAA:
                dc.w    $0001
                dc.l    $F009008F, $0047FFF4
Offset_0x02ECB4:
                dc.w    $0001
                dc.l    $FC0C00A9, $0054FFF0
Offset_0x02ECBE:
                dc.w    $0001
                dc.l    $08040095, $004AFFF8
Offset_0x02ECC8:
                dc.w    $0001
                dc.l    $00050097, $004BFFF8
Offset_0x02ECD2:
                dc.w    $0001
                dc.l    $F806009B, $004DFFF8
Offset_0x02ECDC:
                dc.w    $0001
                dc.l    $F00700A1, $0050FFF8
;===============================================================================   
; Objeto 0x55 - Robotnik na Oil Ocean
; <<<-        
;===============================================================================