;===============================================================================
; Objeto 0x50 - Imimigo cavalo marinho (Aquis) na Oil Ocean
; ->>>        
;===============================================================================     
; Offset_0x028098:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0280A6(PC, D0), D1
                jmp     Offset_0x0280A6(PC, D1)              
Offset_0x0280A6:
                dc.w    Offset_0x0280B2-Offset_0x0280A6
                dc.w    Offset_0x028170-Offset_0x0280A6
                dc.w    Offset_0x028196-Offset_0x0280A6
                dc.w    Offset_0x0281C0-Offset_0x0280A6
                dc.w    Offset_0x0283BE-Offset_0x0280A6
                dc.w    Offset_0x0283FA-Offset_0x0280A6
;-------------------------------------------------------------------------------                
Offset_0x0280B2:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Aquis_Mappings, Obj_Map(A0)    ; Offset_0x028574, $0004
                move.w  #$2500, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$0A, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.w  #$FF00, Obj_Speed(A0)                            ; $0010
                move.b  Obj_Subtype(A0), D0                              ; $0028
                move.b  D0, D1
                andi.w  #$00F0, D1
                lsl.w   #$04, D1
                move.w  D1, Obj_Control_Var_02(A0)                       ; $002E
                move.w  D1, Obj_Control_Var_04(A0)                       ; $0030
                andi.w  #$000F, D0
                lsl.w   #$04, D0
                subq.w  #$01, D0
                move.w  D0, Obj_Control_Var_06(A0)                       ; $0032
                move.w  D0, Obj_Control_Var_08(A0)                       ; $0034
                move.w  Obj_Y(A0), Obj_Timer(A0)                  ; $000C, $002A
                move.w  (Water_Level).w, Obj_Control_Var_0E(A0) ; $FFFFF646, $003A
                bsr     Jmp_09_To_SingleObjectLoad             ; Offset_0x02861C
                bne.s   Offset_0x028170
                move.b  #$50, Obj_Id(A1)                                 ; $0000
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$000A, Obj_X(A1)                                ; $0008
                addi.w  #$FFFA, Obj_Y(A1)                                ; $000C
                move.l  #Aquis_Mappings, Obj_Map(A1)    ; Offset_0x028574, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
                move.b  #$03, Obj_Ani_Number(A1)                         ; $001C
                move.l  A1, Obj_Control_Var_0A(A0)                       ; $0036
                move.l  A0, Obj_Control_Var_0A(A1)                       ; $0036
                bset    #$06, Obj_Status(A0)                             ; $0022     
;-------------------------------------------------------------------------------
Offset_0x028170:
                lea     (Aquis_Animate_Data), A1               ; Offset_0x02854C
                bsr     Jmp_0E_To_AnimateSprite                ; Offset_0x028628
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x028190(PC, D0), D1
                jsr     Offset_0x028190(PC, D1)
                bsr     Offset_0x028384
                bra     Jmp_21_To_MarkObjGone                  ; Offset_0x028622       
Offset_0x028190:
                dc.w    Offset_0x0281D6-Offset_0x028190
                dc.w    Offset_0x0281EC-Offset_0x028190
                dc.w    Offset_0x0281FE-Offset_0x028190   
;-------------------------------------------------------------------------------
Offset_0x028196:
                move.l  Obj_Control_Var_0A(A0), A1                       ; $0036
                tst.b   (A1)
                beq     Jmp_1B_To_DeleteObject                 ; Offset_0x028616
                cmpi.b  #$50, (A1)
                bne     Jmp_1B_To_DeleteObject                 ; Offset_0x028616
                btst    #$07, Obj_Status(A1)                             ; $0022
                bne     Jmp_1B_To_DeleteObject                 ; Offset_0x028616
                lea     (Aquis_Animate_Data), A1               ; Offset_0x02854C
                bsr     Jmp_0E_To_AnimateSprite                ; Offset_0x028628
                bra     Jmp_19_To_DisplaySprite                ; Offset_0x028610   
;-------------------------------------------------------------------------------
Offset_0x0281C0:
                bsr     Offset_0x0284A8
                bsr     Jmp_14_To_SpeedToPos                   ; Offset_0x028634
                lea     (Aquis_Animate_Data), A1               ; Offset_0x02854C
                bsr     Jmp_0E_To_AnimateSprite                ; Offset_0x028628
                bra     Jmp_21_To_MarkObjGone                  ; Offset_0x028622     
;-------------------------------------------------------------------------------
Offset_0x0281D6:
                bsr     Offset_0x028210
                bsr     Jmp_14_To_SpeedToPos                   ; Offset_0x028634
                bsr     Offset_0x02848A
                bsr     Offset_0x028330
                bsr     Offset_0x0282C8
                rts    
;-------------------------------------------------------------------------------
Offset_0x0281EC:
                bsr     Offset_0x028210
                bsr     Jmp_14_To_SpeedToPos                   ; Offset_0x028634
                bsr     Offset_0x02848A
                bsr     Offset_0x028352
                rts 
;-------------------------------------------------------------------------------
Offset_0x0281FE:
                bsr     Jmp_04_To_ObjectFall                   ; Offset_0x02862E
                bsr     Offset_0x02848A
                bsr     Offset_0x028224
                bsr     Offset_0x0282A0
                rts
Offset_0x028210:
                move.w  Obj_Control_Var_0E(A0), D0                       ; $003A
                sub.w   ($FFFFF646).w, D0
                sub.w   D0, Obj_Y(A0)                                    ; $000C
                move.w  (Water_Level).w, Obj_Control_Var_0E(A0) ; $FFFFF646, $003A
                rts
Offset_0x028224:
                tst.b   Obj_Control_Var_01(A0)                           ; $002D
                bne.s   Offset_0x028230
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bpl.s   Offset_0x028232
Offset_0x028230:
                rts
Offset_0x028232:
                st      Obj_Control_Var_01(A0)                           ; $002D
                bsr     Jmp_09_To_SingleObjectLoad             ; Offset_0x02861C
                bne.s   Offset_0x02829E
                move.b  #$50, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  #Aquis_Mappings, Obj_Map(A1)    ; Offset_0x028574, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$E5, Obj_Col_Flags(A1)                          ; $0020
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$000C, D0
                move.w  #$0010, D1
                move.w  #$FD00, D2
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x028292
                neg.w   D1
                neg.w   D2
Offset_0x028292:
                sub.w   D0, Obj_Y(A1)                                    ; $000C
                sub.w   D1, Obj_X(A1)                                    ; $0008
                move.w  D2, Obj_Speed(A1)                                ; $0010
Offset_0x02829E:
                rts
Offset_0x0282A0:
                move.w  Obj_Y(A0), D0                                    ; $000C
                cmp.w   ($FFFFF646).w, D0
                blt.s   Offset_0x0282C6
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                move.w  Obj_Control_Var_04(A0), Obj_Control_Var_02(A0) ; $002E, $0030
                move.w  #$0040, Obj_Speed_Y(A0)                          ; $0012
                sf      Obj_Control_Var_01(A0)                           ; $002D
Offset_0x0282C6:
                rts
Offset_0x0282C8:
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                beq.s   Offset_0x02832E
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                move.w  (Player_Position_Y).w, D1                    ; $FFFFB00C
                sub.w   Obj_Y(A0), D1                                    ; $000C
                bpl.s   Offset_0x02832E
                cmpi.w  #$FFC0, D1
                blt.s   Offset_0x02832E
                sub.w   Obj_X(A0), D0                                    ; $0008
                cmpi.w  #$0058, D0
                bgt.s   Offset_0x02832E
                cmpi.w  #$FFA8, D0
                blt.s   Offset_0x02832E
                tst.w   D0
                bpl.s   Offset_0x028306
                cmpi.w  #$FFD8, D0
                bgt.s   Offset_0x02832E
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x02832E
                bra.s   Offset_0x028314
Offset_0x028306:
                cmpi.w  #$0028, D0
                blt.s   Offset_0x02832E
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02832E
Offset_0x028314:
                moveq   #$20, D0
                cmp.w   Obj_Control_Var_06(A0), D0                       ; $0032
                bgt.s   Offset_0x02832E
                move.b  #$04, Obj_Routine_2(A0)                          ; $0025
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$FC00, Obj_Speed_Y(A0)                          ; $0012
Offset_0x02832E:
                rts
Offset_0x028330:
                subq.w  #$01, Obj_Control_Var_02(A0)                     ; $002E
                bne.s   Offset_0x028350
                move.w  Obj_Control_Var_04(A0), Obj_Control_Var_02(A0) ; $002E, $0030
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FFC0, D0
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                beq.s   Offset_0x02834C
                neg.w   D0
Offset_0x02834C:
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
Offset_0x028350:
                rts
Offset_0x028352:
                move.w  Obj_Y(A0), D0                                    ; $000C
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x028370
                cmp.w   ($FFFFF646).w, D0
                bgt.s   Offset_0x02836E
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                st      Obj_Control_Var_00(A0)                           ; $002C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x02836E:
                rts
Offset_0x028370:
                cmp.w   Obj_Timer(A0), D0                                ; $002A
                blt.s   Offset_0x02836E
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                sf      Obj_Control_Var_00(A0)                           ; $002C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                rts
Offset_0x028384:
                moveq   #$0A, D0
                moveq   #-$06, D1
                move.l  Obj_Control_Var_0A(A0), A1                       ; $0036
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
                move.b  Obj_Respaw_Ref(A0), Obj_Respaw_Ref(A1)    ; $0023, $0023
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x0283B4
                neg.w   D0
Offset_0x0283B4:
                add.w   D0, Obj_X(A1)                                    ; $0008
                add.w   D1, Obj_Y(A1)                                    ; $000C
                rts    
;-------------------------------------------------------------------------------
Offset_0x0283BE:
                bsr     Jmp_04_To_ObjectFall                   ; Offset_0x02862E
                bsr     Offset_0x0283D4
                lea     (Aquis_Animate_Data), A1               ; Offset_0x02854C
                bsr     Jmp_0E_To_AnimateSprite                ; Offset_0x028628
                bra     Jmp_21_To_MarkObjGone                  ; Offset_0x028622
Offset_0x0283D4:
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x0283EE
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                asr.w   #$01, D0
                neg.w   D0
                move.w  D0, Obj_Speed_Y(A0)                              ; $0012
Offset_0x0283EE:
                subi.b  #$01, Obj_Col_Prop(A0)                           ; $0021
                beq     Jmp_1B_To_DeleteObject                 ; Offset_0x028616
                rts     
;-------------------------------------------------------------------------------
Offset_0x0283FA:
                bsr     Offset_0x02844A
                tst.b   Obj_Routine_2(A0)                                ; $0025
                beq.s   Offset_0x02843A
                subi.w  #$0001, Obj_Control_Var_00(A0)                   ; $002C
                beq     Jmp_1B_To_DeleteObject                 ; Offset_0x028616
                move.w  (Player_Position_X).w, Obj_X(A0)      ; $FFFFB008, $0008
                move.w  (Player_Position_Y).w, Obj_Y(A0)      ; $FFFFB00C, $000C
                addi.w  #$000C, Obj_Y(A0)                                ; $000C
                subi.b  #$01, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x02843C
                move.b  #$03, Obj_Timer(A0)                              ; $002A
                bchg    #00, Obj_Status(A0)                              ; $0022
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x02843A:
                rts
Offset_0x02843C:
                lea     (Aquis_Animate_Data), A1               ; Offset_0x02854C
                bsr     Jmp_0E_To_AnimateSprite                ; Offset_0x028628
                bra     Jmp_19_To_DisplaySprite                ; Offset_0x028610
Offset_0x02844A:
                tst.b   Obj_Routine_2(A0)                                ; $0025
                bne.s   Offset_0x028488
                move.b  ($FFFFB024).w, D0
                cmpi.b  #$02, D0
                bne.s   Offset_0x028488
                move.w  (Player_Position_X).w, Obj_X(A0)      ; $FFFFB008, $0008
                move.w  (Player_Position_Y).w, Obj_Y(A0)      ; $FFFFB00C, $000C
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$05, Obj_Ani_Number(A0)                         ; $001C
                st      Obj_Routine_2(A0)                                ; $0025
                move.w  #$012C, Obj_Control_Var_00(A0)                   ; $002C
                move.b  #$03, Obj_Timer(A0)                              ; $002A
Offset_0x028488:
                rts
Offset_0x02848A:
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x0284A6
                move.w  Obj_Control_Var_08(A0), Obj_Control_Var_06(A0) ; $0032, $0034
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Status(A0)                              ; $0022
                move.b  #$01, Obj_Ani_Flag(A0)                           ; $001D
Offset_0x0284A6:
                rts
Offset_0x0284A8:
                tst.b   Obj_Col_Prop(A0)                                 ; $0021
                beq     Offset_0x02854A
                moveq   #$02, D3
Offset_0x0284B2:
                bsr     Jmp_09_To_SingleObjectLoad             ; Offset_0x02861C
                bne.s   Offset_0x028524
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.b  #$08, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.w  #$FF00, Obj_Speed_Y(A1)                          ; $0012
                move.b  #$04, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$78, Obj_Col_Prop(A1)                           ; $0021
                cmpi.w  #$0001, D3
                beq.s   Offset_0x02851E
                blt.s   Offset_0x028510
                move.w  #$00C0, Obj_Speed(A1)                            ; $0010
                addi.w  #$FF40, Obj_Speed_Y(A1)                          ; $0012
                bra.s   Offset_0x028524
Offset_0x028510:
                move.w  #$FF00, Obj_Speed(A1)                            ; $0010
                addi.w  #$FFC0, Obj_Speed_Y(A1)                          ; $0012
                bra.s   Offset_0x028524
Offset_0x02851E:
                move.w  #$0040, Obj_Speed(A1)                            ; $0010
Offset_0x028524:
                dbra    D3, Offset_0x0284B2
                bsr     Jmp_09_To_SingleObjectLoad             ; Offset_0x02861C
                bne.s   Offset_0x028546
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.b  #$0A, Obj_Routine(A1)                            ; $0024
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  #$2500, Obj_Art_VRAM(A1)                         ; $0002
Offset_0x028546:
                bra     Jmp_1B_To_DeleteObject                 ; Offset_0x028616
Offset_0x02854A:
                rts
;-------------------------------------------------------------------------------
Aquis_Animate_Data:                                            ; Offset_0x02854C
                dc.w    Offset_0x028558-Aquis_Animate_Data
                dc.w    Offset_0x02855B-Aquis_Animate_Data
                dc.w    Offset_0x028563-Aquis_Animate_Data
                dc.w    Offset_0x028569-Aquis_Animate_Data
                dc.w    Offset_0x02856D-Aquis_Animate_Data
                dc.w    Offset_0x028570-Aquis_Animate_Data
Offset_0x028558:
                dc.b    $0E, $00, $FF
Offset_0x02855B:
                dc.b    $05, $03, $04, $03, $04, $03, $04, $FF
Offset_0x028563:
                dc.b    $03, $05, $06, $07, $06, $FF
Offset_0x028569:
                dc.b    $03, $01, $02, $FF
Offset_0x02856D:
                dc.b    $01, $05, $FF
Offset_0x028570:
                dc.b    $0E, $08, $FF, $00        
;-------------------------------------------------------------------------------  
Aquis_Mappings:                                                ; Offset_0x028574
                dc.w    Offset_0x028586-Aquis_Mappings
                dc.w    Offset_0x0285A0-Aquis_Mappings
                dc.w    Offset_0x0285AA-Aquis_Mappings
                dc.w    Offset_0x0285B4-Aquis_Mappings
                dc.w    Offset_0x0285CE-Aquis_Mappings
                dc.w    Offset_0x0285E8-Aquis_Mappings
                dc.w    Offset_0x0285F2-Aquis_Mappings
                dc.w    Offset_0x0285FC-Aquis_Mappings
                dc.w    Offset_0x028606-Aquis_Mappings 
Offset_0x028586:
                dc.w    $0003
                dc.l    $E80D0000, $0000FFF0
                dc.l    $F8090008, $0004FFF8
                dc.l    $0805000E, $0007FFF8
Offset_0x0285A0:
                dc.w    $0001
                dc.l    $F8050022, $0011FFF8
Offset_0x0285AA:
                dc.w    $0001
                dc.l    $F8050026, $0013FFF8
Offset_0x0285B4:
                dc.w    $0003
                dc.l    $E80D0012, $0009FFF0
                dc.l    $F8090008, $0004FFF8
                dc.l    $0805000E, $0007FFF8
Offset_0x0285CE:
                dc.w    $0003
                dc.l    $E80D001A, $000DFFF0
                dc.l    $F8090008, $0004FFF8
                dc.l    $0805000E, $0007FFF8
Offset_0x0285E8:
                dc.w    $0001
                dc.l    $F801002A, $0015FFFC
Offset_0x0285F2:
                dc.w    $0001
                dc.l    $F801002C, $0016FFFC
Offset_0x0285FC:
                dc.w    $0001
                dc.l    $F801002E, $0017FFFC
Offset_0x028606:
                dc.w    $0001
                dc.l    $F80D0030, $0018FFF0
;===============================================================================   
; Objeto 0x50 - Imimigo cavalo marinho (Aquis) na Oil Ocean
; <<<-        
;===============================================================================