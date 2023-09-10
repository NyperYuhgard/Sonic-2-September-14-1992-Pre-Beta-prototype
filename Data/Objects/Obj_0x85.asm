;===============================================================================
; Objeto 0x85 - Mola ejetora dos pinball - Casino Night
; ->>>          
;===============================================================================  
; Offset_0x0256D4:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02571E(PC, D0), D1
                jsr     Offset_0x02571E(PC, D1)
                move.w  #$0200, D0
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x0256F0
                bra     Jmp_03_To_DisplaySprite_Param          ; Offset_0x025C1C
Offset_0x0256F0:
                move.w  Obj_X(A0), D1                                    ; $0008
                andi.w  #$FF80, D1
                sub.w   ($FFFFF7DA).w, D1
                cmpi.w  #$0280, D1
                bhi     Offset_0x025708
                bra     Jmp_03_To_DisplaySprite_Param          ; Offset_0x025C1C
Offset_0x025708:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x02571A
                bclr    #$07, $02(A2, D0)
Offset_0x02571A:
                bra     Jmp_16_To_DeleteObject                 ; Offset_0x025C22       
;-------------------------------------------------------------------------------
Offset_0x02571E:
                dc.w    Offset_0x025724-Offset_0x02571E
                dc.w    Offset_0x0257DA-Offset_0x02571E
                dc.w    Offset_0x02597A-Offset_0x02571E     
;-------------------------------------------------------------------------------
Offset_0x025724:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Diagonal_Pinball_Spring_Mappings, Obj_Map(A0) ; Offset_0x025B70,$0004
                move.w  #$0422, Obj_Art_VRAM(A0)                         ; $0002
                tst.b   Obj_Subtype(A0)                                  ; $0028
                beq.s   Offset_0x02574A
                move.l  #Vertical_Pinball_Spring_Mappings, Obj_Map(A0) ; Offset_0x025BDE, $0004
                move.w  #$0402, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x02574A:
                bsr     Jmp_2A_To_ModifySpriteAttr_2P          ; Offset_0x025C28
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                bset    #$06, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Boss_Ani_Map(A0)                       ; $000B
                tst.b   Obj_Subtype(A0)                                  ; $0028
                beq.s   Offset_0x0257A4
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$20, $000E(A0)
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.w  Obj_X(A0), Obj_Control_Var_02(A0)         ; $0008, $002E
                move.w  Obj_Y(A0), Obj_Control_Var_08(A0)         ; $000C, $0034
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  Obj_Y(A0), D3                                    ; $000C
                addi.w  #$0000, D3
                move.b  #$01, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                lea     Obj_Speed(A0), A2                                ; $0010
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0002, (A2)+
                bra     Offset_0x02597A
Offset_0x0257A4:
                move.b  #$10, $000E(A0)
                move.b  #$10, Obj_Width(A0)                              ; $0019
                subi.w  #$0018, Obj_Y(A0)                                ; $000C
                move.w  Obj_Y(A0), Obj_Control_Var_08(A0)         ; $000C, $0034
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  Obj_Y(A0), D3                                    ; $000C
                addi.w  #$0020, D3
                move.b  #$01, Obj_Ani_Boss_Cnt(A0)                       ; $000F
                lea     Obj_Speed(A0), A2                                ; $0010
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0002, (A2)+              
;-------------------------------------------------------------------------------
Offset_0x0257DA:
                move.b  #$00, Obj_Control_Var_0E(A0)                     ; $003A
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                add.w   Obj_Control_Var_0C(A0), D0                       ; $0038
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.b  #$02, $0015(A0)
                cmpi.w  #$0010, Obj_Control_Var_0C(A0)                   ; $0038
                bcs.s   Offset_0x025800
                move.b  #$03, $0015(A0)
Offset_0x025800:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0005, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     Obj_Control_Var_0A(A0), A2                       ; $0036
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  ($FFFFF602).w, D5
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr.s   Offset_0x02587C
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D5
                moveq   #$04, D6
                bsr.s   Offset_0x02587C
                tst.w   Obj_Control_Var_0A(A0)                           ; $0036
                beq.s   Offset_0x02586A
                tst.w   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x02587A
                moveq   #$00, D0
                cmpi.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bne.s   Offset_0x025850
                or.w    ($FFFFF602).w, D0
Offset_0x025850:
                cmpi.b  #$01, Obj_Control_Var_0B(A0)                     ; $0037
                bne.s   Offset_0x02585C
                or.w    ($FFFFF606).w, D0
Offset_0x02585C:
                andi.w  #$7000, D0
                bne.s   Offset_0x02587A
                move.w  #$0202, Obj_Control_Var_0A(A0)                   ; $0036
                rts
Offset_0x02586A:
                move.b  #$01, Obj_Boss_Ani_Map(A0)                       ; $000B
                subq.w  #$04, Obj_Control_Var_0C(A0)                     ; $0038
                bcc.s   Offset_0x02587A
                clr.w   Obj_Control_Var_0C(A0)                           ; $0038
Offset_0x02587A:
                rts
Offset_0x02587C:
                move.b  (A2), D0
                bne.s   Offset_0x0258D0
Offset_0x025880:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x0258CE
                tst.w   Obj_Speed_Y(A1)                                  ; $0012
                bmi.s   Offset_0x0258CE
                bsr     Jmp_04_To_SolidObject_2_A1             ; Offset_0x025C2E
                btst    D6, Obj_Status(A0)                               ; $0022
                beq.s   Offset_0x0258CE
                move.b  #$81, Obj_Timer(A1)                              ; $002A
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                move.w  #$0000, Obj_Inertia(A1)                          ; $0014
                bset    #$02, Obj_Status(A1)                             ; $0022
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                addq.b  #$01, (A2)
Offset_0x0258CE:
                rts
Offset_0x0258D0:
                subq.b  #$01, D0
                bne.s   Offset_0x025930
                andi.w  #$7000, D5
                beq.s   Offset_0x025922
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                bne.s   Offset_0x025922
                move.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
                subq.b  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x0258FE
                move.b  #$03, Obj_Control_Var_06(A0)                     ; $0032
                cmpi.w  #$0020, Obj_Control_Var_0C(A0)                   ; $0038
                beq.s   Offset_0x0258FE
                addq.w  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x0258FE:
                subq.b  #$01, Obj_Control_Var_07(A0)                     ; $0033
                bpl.s   Offset_0x02591C
                move.w  Obj_Control_Var_0C(A0), D0                       ; $0038
                subi.w  #$0020, D0
                neg.w   D0
                lsr.w   #$01, D0
                move.b  D0, Obj_Control_Var_07(A0)                       ; $0033
                bchg    #02, Obj_Boss_Ani_Map(A0)                        ; $000B
                bra.s   Offset_0x025922
Offset_0x02591C:
                move.b  #$01, Obj_Boss_Ani_Map(A0)                       ; $000B
Offset_0x025922:
                move.w  Obj_Y(A0), D0                                    ; $000C
                subi.w  #$0016, D0
                move.w  D0, Obj_Y(A1)                                    ; $000C
                rts
Offset_0x025930:
                move.b  #$00, (A2)
                bclr    D6, Obj_Status(A0)                               ; $0022
                beq     Offset_0x025880
                move.w  Obj_Control_Var_0C(A0), D0                       ; $0038
                addi.w  #$0010, D0
                lsl.w   #$07, D0
                neg.w   D0
                move.w  D0, Obj_Speed_Y(A1)                              ; $0012
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0800, Obj_Inertia(A1)                          ; $0014
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  #$00, Obj_Timer(A1)                              ; $002A
                move.w  #$00E2, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912    
;-------------------------------------------------------------------------------
Offset_0x02597A:
                move.b  #$00, Obj_Control_Var_0E(A0)                     ; $003A
                move.w  Obj_Control_Var_0C(A0), D1                       ; $0038
                lsr.w   #$01, D1
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                sub.w   D1, D0
                move.w  D0, Obj_X(A0)                                    ; $0008
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                add.w   D1, D0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.b  #$02, $0015(A0)
                cmpi.w  #$0010, Obj_Control_Var_0C(A0)                   ; $0038
                bcs.s   Offset_0x0259AE
                move.b  #$03, $0015(A0)
Offset_0x0259AE:
                move.w  #$0023, D1
                move.w  #$0008, D2
                move.w  #$0005, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     Obj_Control_Var_0A(A0), A2                       ; $0036
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  ($FFFFF602).w, D5
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr.s   Offset_0x025A2A
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D5
                moveq   #$04, D6
                bsr.s   Offset_0x025A2A
                tst.w   Obj_Control_Var_0A(A0)                           ; $0036
                beq.s   Offset_0x025A18
                tst.w   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x025A28
                moveq   #$00, D0
                cmpi.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bne.s   Offset_0x0259FE
                or.w    ($FFFFF602).w, D0
Offset_0x0259FE:
                cmpi.b  #$01, Obj_Control_Var_0B(A0)                     ; $0037
                bne.s   Offset_0x025A0A
                or.w    ($FFFFF606).w, D0
Offset_0x025A0A:
                andi.w  #$7000, D0
                bne.s   Offset_0x025A28
                move.w  #$0202, Obj_Control_Var_0A(A0)                   ; $0036
                rts
Offset_0x025A18:
                move.b  #$01, Obj_Boss_Ani_Map(A0)                       ; $000B
                subq.w  #$04, Obj_Control_Var_0C(A0)                     ; $0038
                bcc.s   Offset_0x025A28
                clr.w   Obj_Control_Var_0C(A0)                           ; $0038
Offset_0x025A28:
                rts
Offset_0x025A2A:
                move.b  (A2), D0
                bne.s   Offset_0x025A9E
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x025A9C
                tst.w   Obj_Speed_Y(A1)                                  ; $0012
                bmi.s   Offset_0x025A9C
                bsr     Jmp_04_To_SolidObject_2_A1             ; Offset_0x025C2E
                btst    D6, Obj_Status(A0)                               ; $0022
                bne.s   Offset_0x025A52
                move.b  D6, D0
                addq.b  #$02, D0
                btst    D0, Obj_Status(A0)                               ; $0022
                beq.s   Offset_0x025A9C
                bset    D6, Obj_Status(A0)                               ; $0022
Offset_0x025A52:
                move.b  #$81, Obj_Timer(A1)                              ; $002A
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                addi.w  #$0013, Obj_X(A1)                                ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                subi.w  #$0013, Obj_Y(A1)                                ; $000C
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                move.w  #$0000, Obj_Inertia(A1)                          ; $0014
                bset    #$02, Obj_Status(A1)                             ; $0022
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                addq.b  #$01, (A2)
Offset_0x025A9C:
                rts
Offset_0x025A9E:
                subq.b  #$01, D0
                bne.s   Offset_0x025B0A
                andi.w  #$7000, D5
                beq.s   Offset_0x025AF0
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                bne.s   Offset_0x025AF0
                move.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
                subq.b  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x025ACC
                move.b  #$03, Obj_Control_Var_06(A0)                     ; $0032
                cmpi.w  #$001C, Obj_Control_Var_0C(A0)                   ; $0038
                beq.s   Offset_0x025ACC
                addq.w  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x025ACC:
                subq.b  #$01, Obj_Control_Var_07(A0)                     ; $0033
                bpl.s   Offset_0x025AEA
                move.w  Obj_Control_Var_0C(A0), D0                       ; $0038
                subi.w  #$001C, D0
                neg.w   D0
                lsr.w   #$01, D0
                move.b  D0, Obj_Control_Var_07(A0)                       ; $0033
                bchg    #02, Obj_Boss_Ani_Map(A0)                        ; $000B
                bra.s   Offset_0x025AF0
Offset_0x025AEA:
                move.b  #$01, Obj_Boss_Ani_Map(A0)                       ; $000B
Offset_0x025AF0:
                move.w  Obj_X(A0), D0                                    ; $0008
                addi.w  #$0013, D0
                move.w  D0, Obj_X(A1)                                    ; $0008
                move.w  Obj_Y(A0), D0                                    ; $000C
                subi.w  #$0013, D0
                move.w  D0, Obj_Y(A1)                                    ; $000C
                rts
Offset_0x025B0A:
                move.b  #$00, (A2)
                bclr    D6, Obj_Status(A0)                               ; $0022
                beq     Offset_0x025A9C
                move.w  Obj_Control_Var_0C(A0), D0                       ; $0038
                addi.w  #$0004, D0
                lsl.w   #$07, D0
                move.w  D0, Obj_Speed(A1)                                ; $0010
                neg.w   D0
                move.w  D0, Obj_Speed_Y(A1)                              ; $0012
                move.w  #$0800, Obj_Inertia(A1)                          ; $0014
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bpl.s   Offset_0x025B5A
                neg.w   D0
                move.w  D0, Obj_Inertia(A1)                              ; $0014
                bclr    #$00, Obj_Status(A1)                             ; $0022
                bclr    #$01, Obj_Status(A1)                             ; $0022
                move.b  #$E0, Obj_Angle(A1)                              ; $0026
Offset_0x025B5A:
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  #$00, Obj_Timer(A1)                              ; $002A
                move.w  #$00E2, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
;-------------------------------------------------------------------------------
Diagonal_Pinball_Spring_Mappings:                              ; Offset_0x025B70
                dc.w    Offset_0x025B7C-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x025B9E-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x025BA8-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x025BC2-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x025BD4-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x025BD4-Diagonal_Pinball_Spring_Mappings
Offset_0x025B7C:
                dc.w    $0004
                dc.l    $E0090000, $0000FFF4
                dc.l    $F0090006, $0003FFF4
                dc.l    $00090006, $0003FFF4
                dc.l    $1009000C, $0006FFF4
Offset_0x025B9E:
                dc.w    $0001
                dc.l    $F8090000, $0000FFF4
Offset_0x025BA8:
                dc.w    $0003
                dc.l    $E8090006, $0003FFF4
                dc.l    $F8090006, $0003FFF4
                dc.l    $0809000C, $0006FFF4
Offset_0x025BC2:
                dc.w    $0002
                dc.l    $F8090006, $0003FFF4
                dc.l    $0809000C, $0006FFF4
Offset_0x025BD4:
                dc.w    $0001
                dc.l    $F8092000, $2000FFF4                       
;-------------------------------------------------------------------------------
Vertical_Pinball_Spring_Mappings:                              ; Offset_0x025BDE
                dc.w    Offset_0x025BEA-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x025BFC-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x025C06-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x025C06-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x025C10-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x025C10-Vertical_Pinball_Spring_Mappings
Offset_0x025BEA:
                dc.w    $0002
                dc.l    $F00F0000, $0000FFF0
                dc.l    $000F0010, $0008FFE0
Offset_0x025BFC:
                dc.w    $0001
                dc.l    $F00F0000, $0000FFF0
Offset_0x025C06:
                dc.w    $0001
                dc.l    $000F0010, $0008FFE0
Offset_0x025C10:
                dc.w    $0001
                dc.l    $F00F2000, $2000FFF0                           
;===============================================================================   
; Objeto 0x85 - Mola ejetora dos pinball - Casino Night
; <<<-
;===============================================================================