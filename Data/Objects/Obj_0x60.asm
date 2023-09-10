;===============================================================================
; Objeto 0x60 - Anéis no Special Stage
; ->>> 
;===============================================================================
; Offset_0x030316:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x030324(PC, D0), D1
                jmp     Offset_0x030324(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x030324:
                dc.w    Offset_0x03032A-Offset_0x030324
                dc.w    Offset_0x030362-Offset_0x030324
                dc.w    Offset_0x03058A-Offset_0x030324
;-------------------------------------------------------------------------------  
Offset_0x03032A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$007F, Obj_X(A0)                                ; $0008
                move.w  #$0058, Obj_Y(A0)                                ; $000C
                move.l  #SS_Rings_Mappings, Obj_Map(A0) ; Offset_0x03078A, $0004
                move.w  #$430D, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$01, Obj_Col_Flags(A0)                          ; $0020
                bsr     Offset_0x0304F4
                move.l  A1, Obj_Control_Var_08(A0)                       ; $0034
;-------------------------------------------------------------------------------                  
Offset_0x030362:
                bsr     Offset_0x0303A2
                bsr     Offset_0x030386
                bsr     Offset_0x030436
                lea     (SS_Rings_AnimateData), A1             ; Offset_0x03073A
                bsr     Offset_0x0305E8
                tst.b   Obj_Flags(A0)                                    ; $0001
                bmi     Jmp_25_To_DisplaySprite                ; Offset_0x030A10
                rts    
;-------------------------------------------------------------------------------  
; Offset_0x030382:
                bra     Jmp_25_To_DisplaySprite                ; Offset_0x030A10
;-------------------------------------------------------------------------------                  
Offset_0x030386:
                moveq   #$0C, D0
                cmpi.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                blt.s   Offset_0x03039C
                addq.w  #$04, D0
                cmpi.b  #$07, Obj_Ani_Number(A0)                         ; $001C
                blt.s   Offset_0x03039C
                addq.w  #$04, D0
Offset_0x03039C:
                move.b  D0, Obj_Control_Var_0F(A0)                       ; $003B
                rts
Offset_0x0303A2:
                btst    #$07, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0303C8
                subi.l  #$0000CD00, Obj_Control_Var_04(A0)               ; $0030
                ble.s   Offset_0x0303C8
                cmpi.b  #$0A, Obj_Ani_Number(A0)                         ; $001C
                beq.s   Offset_0x0303C6
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                move.b  Offset_0x0303D6(PC, D0), Obj_Ani_Number(A0)      ; $001C
Offset_0x0303C6:
                rts
Offset_0x0303C8:
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                st      Obj_Timer(A1)                                    ; $002A
                move.l  (A7)+, D0
                bra     Jmp_26_To_DeleteObject                 ; Offset_0x030A16       
;-------------------------------------------------------------------------------
Offset_0x0303D6:
                dc.b    $09, $09, $09, $08, $08, $07, $07, $06
                dc.b    $06, $05, $05, $04, $04, $03, $03, $03
                dc.b    $02, $02, $02, $01, $01, $01, $01, $01
                dc.b    $01, $01, $01, $01, $01, $01, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00   
;-------------------------------------------------------------------------------  
Offset_0x030436:
                move.w  D7, -(A7)
                moveq   #$00, D2
                moveq   #$00, D3
                moveq   #$00, D4
                moveq   #$00, D5
                moveq   #$00, D6
                moveq   #$00, D7
                move.l  ($FFFF9B82).w, A1
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                beq.s   Offset_0x0304B0
                cmp.w   (A1)+, D0
                bgt.s   Offset_0x0304B0
                subq.w  #$01, D0
                add.w   D0, D0
                move.w  D0, D1
                add.w   D0, D0
                add.w   D1, D0
                tst.b   ($FFFF9B0E).w
                bne     Offset_0x0304B8
                move.b  $04(A1, D0), D6
                move.b  $05(A1, D0), D7
                beq.s   Offset_0x03047A
                move.b  Obj_Angle(A0), D1                                ; $0026
                cmp.b   D6, D1
                bcs.s   Offset_0x03047A
                cmp.b   D7, D1
                bcs.s   Offset_0x0304B0
Offset_0x03047A:
                move.b  $00(A1, D0), D2
                move.b  $01(A1, D0), D3
                move.b  $02(A1, D0), D4
                move.b  $03(A1, D0), D5
Offset_0x03048A:
                move.b  Obj_Angle(A0), D0                                ; $0026
                bsr     Jmp_0C_To_CalcSine                     ; Offset_0x030A22
                muls.w  D4, D1
                muls.w  D5, D0
                asr.l   #$08, D0
                asr.l   #$08, D1
                add.w   D2, D1
                add.w   D3, D0
                move.w  D1, Obj_X(A0)                                    ; $0008
                move.w  D0, Obj_Y(A0)                                    ; $000C
                ori.b   #$80, Obj_Flags(A0)                              ; $0001
Offset_0x0304AC:
                move.w  (A7)+, D7
                rts
Offset_0x0304B0:
                andi.b  #$7F, Obj_Flags(A0)                              ; $0001
                bra.s   Offset_0x0304AC
Offset_0x0304B8:
                move.b  #$80, D1
                move.b  $04(A1, D0), D6
                move.b  $05(A1, D0), D7
                beq.s   Offset_0x0304DA
                sub.w   D1, D6
                sub.w   D1, D7
                neg.w   D6
                neg.w   D7
                move.b  Obj_Angle(A0), D1                                ; $0026
                cmp.b   D7, D1
                bcs.s   Offset_0x0304DA
                cmp.b   D6, D1
                bcs.s   Offset_0x0304B0
Offset_0x0304DA:
                move.b  $00(A1, D0), D2
                move.b  $01(A1, D0), D3
                move.b  $02(A1, D0), D4
                move.b  $03(A1, D0), D5
                subi.w  #$0100, D2
                neg.w   D2
                bra     Offset_0x03048A
Offset_0x0304F4:
                lea     ($FFFFB8C0).w, A1
                moveq   #$0B, D0
Offset_0x0304FA:
                tst.b   (A1)
                beq.s   Offset_0x030508
                lea     Obj_Size(A1), A1                                 ; $0040
                dbra    D0, Offset_0x0304FA
                rts
Offset_0x030508:
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                move.b  (A0), (A1)
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.l  #SS_Objects_Shadow_Mappings, Obj_Map(A1) ; Offset_0x02F7E6, $0004
                move.w  #$6279, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$05, Obj_Priority(A1)                           ; $0018
                move.b  Obj_Angle(A0), D0                                ; $0026
                cmpi.b  #$10, D0
                bgt.s   Offset_0x030546
                bset    #$00, Obj_Flags(A1)                              ; $0001
                move.b  #$02, Obj_Player_Status(A1)                      ; $002B
                rts
Offset_0x030546:
                cmpi.b  #$30, D0
                bgt.s   Offset_0x03055A
                bset    #$00, Obj_Flags(A1)                              ; $0001
                move.b  #$01, Obj_Player_Status(A1)                      ; $002B
                rts
Offset_0x03055A:
                cmpi.b  #$50, D0
                bgt.s   Offset_0x030568
                move.b  #$00, Obj_Player_Status(A1)                      ; $002B
                rts
Offset_0x030568:
                cmpi.b  #$70, D0
                bgt.s   Offset_0x030576
                move.b  #$01, Obj_Player_Status(A1)                      ; $002B
                rts
Offset_0x030576:
                move.b  #$02, Obj_Player_Status(A1)                      ; $002B
                rts
;-------------------------------------------------------------------------------    
Offset_0x03057E:
                dc.w    $0000, $0018, $0014, $0014, $0014, $0000
;-------------------------------------------------------------------------------  
Offset_0x03058A:
                tst.b   Obj_Timer(A0)                                    ; $002A
                bne     Jmp_26_To_DeleteObject                 ; Offset_0x030A16
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                tst.b   Obj_Flags(A1)                                    ; $0001
                bmi.s   Offset_0x03059E
                rts
Offset_0x03059E:
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                moveq   #$09, D0
                sub.b   Obj_Ani_Number(A1), D0                           ; $001C
                move.w  D0, D1
                add.w   D0, D0
                add.w   D1, D0
                moveq   #$00, D1
                move.b  Obj_Player_Status(A0), D1                        ; $002B
                beq.s   Offset_0x0305D8
                cmpi.b  #$01, D1
                beq.s   Offset_0x0305CE
                add.w   D1, D0
                move.w  #$62D9, Obj_Art_VRAM(A0)                         ; $0002
                bra.s   Offset_0x0305E0
Offset_0x0305CE:
                add.w   D1, D0
                move.w  #$629F, Obj_Art_VRAM(A0)                         ; $0002
                bra.s   Offset_0x0305E0
Offset_0x0305D8:
                add.w   D1, D0
                move.w  #$6279, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x0305E0:
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                bra     Jmp_25_To_DisplaySprite                ; Offset_0x030A10
Offset_0x0305E8:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x030630
                move.b  Obj_Ani_Number(A0), D0                           ; $001C
                add.w   D0, D0
                adda.w  $00(A1, D0), A1
                move.b  (A1), Obj_Ani_Time(A0)                           ; $001E
                moveq   #$00, D1
                move.b  Obj_Ani_Frame(A0), D1                            ; $001B
                move.b  $01(A1, D1), D0
                bpl.s   Offset_0x030612
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
                move.b  Obj_Flags(A1), D0                                ; $0001
Offset_0x030612:
                andi.b  #$7F, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.b  Obj_Status(A0), D1                               ; $0022
                andi.b  #$03, D1
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                or.b    D1, Obj_Flags(A0)                                ; $0001
                addq.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
Offset_0x030630:
                rts                                                                 
;===============================================================================
; Objeto 0x60 - Anéis no Special Stage
; <<<- 
;===============================================================================