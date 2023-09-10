;===============================================================================
; Objeto 0x15 - Plataformas tipo pendúlo na Neo Green Hill, Dust Hill e
; ->>>          Oil Ocean
;===============================================================================
; Offset_0x00CF38:
                btst    #$06, Obj_Flags(A0)                              ; $0001
                bne     Offset_0x00CF50
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00CF58(PC, D0), D1
                jmp     Offset_0x00CF58(PC, D1)
Offset_0x00CF50:
                move.w  #$0200, D0
                bra     DisplaySprite_Param                    ; Offset_0x01211A
;------------------------------------------------------------------------------- 
Offset_0x00CF58:
                dc.w    Offset_0x00CF66-Offset_0x00CF58
                dc.w    Offset_0x00D0EC-Offset_0x00CF58
                dc.w    Offset_0x00D2D6-Offset_0x00CF58
                dc.w    Offset_0x00D2DA-Offset_0x00CF58
                dc.w    Offset_0x00D394-Offset_0x00CF58
                dc.w    Offset_0x00D39C-Offset_0x00CF58
                dc.w    Offset_0x00D402-Offset_0x00CF58
;------------------------------------------------------------------------------- 
Offset_0x00CF66:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #OOz_Swing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00D484, $0004
                move.w  #$43E3, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$10, Obj_Height_2(A0)                           ; $0016
                move.w  Obj_Y(A0), Obj_Control_Var_0C(A0)         ; $000C, $0038
                move.w  Obj_X(A0), Obj_Control_Var_0E(A0)         ; $0008, $003A
                cmpi.b  #$0B, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00CFBE
                move.l  #DHz_Swing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00D4F2, $0004
                move.w  #$0000, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.b  #$08, Obj_Height_2(A0)                           ; $0016
Offset_0x00CFBE:
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00CFE0
                move.l  #NGHz_Swing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00D4BA, $0004
                move.w  #$0000, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$08, Obj_Height_2(A0)                           ; $0016
Offset_0x00CFE0:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                moveq   #$00, D1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                bpl.s   Offset_0x00CFF0
                addq.b  #$04, Obj_Routine(A0)                            ; $0024
Offset_0x00CFF0:
                move.b  D1, D4
                andi.b  #$70, D4
                andi.w  #$000F, D1
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  Obj_Y(A0), D3                                    ; $000C
                bsr     SingleObjectLoad_2                     ; Offset_0x013BC0
                bne     Offset_0x00D0C0
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                cmpi.b  #$20, D4
                bne.s   Offset_0x00D062
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$50, Obj_Height_2(A1)                           ; $0016
                bset    #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Map_Id(A1)                             ; $001A
                move.w  D2, Obj_X(A1)                                    ; $0008
                addi.w  #$0040, D3
                move.w  D3, Obj_Y(A1)                                    ; $000C
                addi.w  #$0048, D3
                move.w  D3, Obj_Y(A0)                                    ; $000C
                bra.s   Offset_0x00D0BC
Offset_0x00D062:
                bset    #$06, Obj_Flags(A1)                              ; $0001
                move.b  #$48, $000E(A1)
                move.b  D1, Obj_Ani_Boss_Cnt(A1)                         ; $000F
                subq.b  #$01, D1
                lea     Obj_Speed(A1), A2                                ; $0010
Offset_0x00D078:
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0001, (A2)+
                addi.w  #$0010, D3
                dbra    D1, Offset_0x00D078
                move.b  #$02, $0015(A1)
                move.w  Obj_Subtype(A1), Obj_X(A1)                ; $0008, $0028
                move.w  Obj_Timer(A1), Obj_Y(A1)                  ; $000C, $002A
                move.w  D2, Obj_Subtype(A1)                              ; $0028
                move.w  D3, Obj_Timer(A1)                                ; $002A
                move.b  #$01, Obj_Boss_Ani_Map(A1)                       ; $000B
                addi.w  #$0008, D3
                move.w  D3, Obj_Y(A0)                                    ; $000C
                move.b  #$50, Obj_Inertia(A1)                            ; $0014
                bset    #$04, Obj_Flags(A1)                              ; $0001
Offset_0x00D0BC:
                move.l  A1, Obj_Control_Var_04(A0)                       ; $0030
Offset_0x00D0C0:
                move.w  #$8000, Obj_Angle(A0)                            ; $0026
                move.w  #$0000, Obj_Control_Var_12(A0)                   ; $003E
                move.b  Obj_Subtype(A0), D1                              ; $0028
                andi.w  #$0070, D1
                move.b  D1, Obj_Subtype(A0)                              ; $0028
                cmpi.b  #$40, D1
                bne.s   Offset_0x00D0EC
                move.l  #DHz_Swing_Platforms_Mappings_01, Obj_Map(A0) ; Offset_0x00D57A, $0004
                move.b  #$A7, Obj_Col_Flags(A0)                          ; $0020
;-------------------------------------------------------------------------------                 
Offset_0x00D0EC:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Offset_0x00D10C
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                moveq   #$00, D3
                move.b  Obj_Height_2(A0), D3                             ; $0016
                addq.b  #$01, D3
                move.w  (A7)+, D4
                bsr     Platform_Object_3                      ; Offset_0x014DB2
                bra     Offset_0x00D2A8
Offset_0x00D10C:
                moveq   #$00, D0
                moveq   #$00, D1
                move.b  ($FFFFFE78).w, D0
                move.b  Obj_Subtype(A0), D1                              ; $0028
                beq.s   Offset_0x00D15E
                cmpi.b  #$10, D1
                bne.s   Offset_0x00D13A
                cmpi.b  #$3F, D0
                beq.s   Offset_0x00D12C
                bcc.s   Offset_0x00D15E
                moveq   #$40, D0
                bra.s   Offset_0x00D15E
Offset_0x00D12C:
                move.w  #$00D7, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
                moveq   #$40, D0
                bra.s   Offset_0x00D15E
Offset_0x00D13A:
                cmpi.b  #$20, D1
                beq     Offset_0x00D208
                cmpi.b  #$30, D1
                bne.s   Offset_0x00D154
                cmpi.b  #$41, D0
                beq.s   Offset_0x00D12C
                bcs.s   Offset_0x00D15E
                moveq   #$40, D0
                bra.s   Offset_0x00D15E
Offset_0x00D154:
                cmpi.b  #$40, D1
                bne.s   Offset_0x00D15E
                bsr     Offset_0x00D20A
Offset_0x00D15E:
                move.b  Obj_Control_Var_02(A0), D1                       ; $002E
                cmp.b   D0, D1
                beq     Offset_0x00D208
                move.b  D0, Obj_Control_Var_02(A0)                       ; $002E
                move.w  #$0080, D1
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x00D17C
                neg.w   D0
                add.w   D1, D0
Offset_0x00D17C:
                bsr     Jmp_01_To_CalcSine                     ; Offset_0x00D594
                move.w  Obj_Control_Var_0C(A0), D2                       ; $0038
                move.w  Obj_Control_Var_0E(A0), D3                       ; $003A
                moveq   #$00, D6
                move.l  Obj_Control_Var_04(A0), A1                       ; $0030
                move.b  Obj_Ani_Boss_Cnt(A1), D6                         ; $000F
                subq.w  #$01, D6
                bcs.s   Offset_0x00D208
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                moveq   #$00, D4
                moveq   #$00, D5
                lea     Obj_Speed(A1), A2                                ; $0010
Offset_0x00D1A6:
                movem.l D4/D5, -(A7)
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, (A2)+
                move.w  D4, (A2)+
                movem.l (A7)+, D4/D5
                add.l   D0, D4
                add.l   D1, D5
                addq.w  #$02, A2
                dbra    D6, Offset_0x00D1A6
                movem.l D4/D5, -(A7)
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  Obj_Subtype(A1), D2                              ; $0028
                move.w  Obj_Timer(A1), D3                                ; $002A
                move.w  D5, Obj_Subtype(A1)                              ; $0028
                move.w  D4, Obj_Timer(A1)                                ; $002A
                move.w  D2, Obj_X(A1)                                    ; $0008
                move.w  D3, Obj_Y(A1)                                    ; $000C
                movem.l (A7)+, D4/D5
                asr.l   #$01, D0
                asr.l   #$01, D1
                add.l   D0, D4
                add.l   D1, D5
                swap.w  D4
                swap.w  D5
                add.w   Obj_Control_Var_0C(A0), D4                       ; $0038
                add.w   Obj_Control_Var_0E(A0), D5                       ; $003A
                move.w  D4, Obj_Y(A0)                                    ; $000C
                move.w  D5, Obj_X(A0)                                    ; $0008
Offset_0x00D208:
                rts
Offset_0x00D20A:
                tst.w   Obj_Control_Var_0A(A0)                           ; $0036
                beq.s   Offset_0x00D218
                subq.w  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bra     Offset_0x00D2A2
Offset_0x00D218:
                tst.b   Obj_Control_Var_08(A0)                           ; $0034
                bne.s   Offset_0x00D23E
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_Control_Var_0E(A0), D0                       ; $003A
                addi.w  #$0020, D0
                cmpi.w  #$0040, D0
                bcc.s   Offset_0x00D2A2
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne     Offset_0x00D2A2
                move.b  #$01, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x00D23E:
                tst.b   Obj_Control_Var_11(A0)                           ; $003D
                beq.s   Offset_0x00D274
                move.w  Obj_Control_Var_12(A0), D0                       ; $003E
                addi.w  #$0008, D0
                move.w  D0, Obj_Control_Var_12(A0)                       ; $003E
                add.w   D0, Obj_Angle(A0)                                ; $0026
                cmpi.w  #$0200, D0
                bne.s   Offset_0x00D2A2
                move.w  #$0000, Obj_Control_Var_12(A0)                   ; $003E
                move.w  #$8000, Obj_Angle(A0)                            ; $0026
                move.b  #$00, Obj_Control_Var_11(A0)                     ; $003D
                move.w  #$003C, Obj_Control_Var_0A(A0)                   ; $0036
                bra.s   Offset_0x00D2A2
Offset_0x00D274:
                move.w  Obj_Control_Var_12(A0), D0                       ; $003E
                subi.w  #$0008, D0
                move.w  D0, Obj_Control_Var_12(A0)                       ; $003E
                add.w   D0, Obj_Angle(A0)                                ; $0026
                cmpi.w  #$FE00, D0
                bne.s   Offset_0x00D2A2
                move.w  #$0000, Obj_Control_Var_12(A0)                   ; $003E
                move.w  #$4000, Obj_Angle(A0)                            ; $0026
                move.b  #$01, Obj_Control_Var_11(A0)                     ; $003D
                move.w  #$003C, Obj_Control_Var_0A(A0)                   ; $0036
Offset_0x00D2A2:
                move.b  Obj_Angle(A0), D0                                ; $0026
                rts
Offset_0x00D2A8:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x00D2B2
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00D2B2:
                move.w  Obj_Control_Var_0E(A0), D0                       ; $003A
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x00D2CA
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00D2CA:
                move.l  Obj_Control_Var_04(A0), A1                       ; $0030
                bsr     DeleteObject_A1                        ; Offset_0x0120D2
                bra     DeleteObject                           ; Offset_0x0120D0
;-------------------------------------------------------------------------------                 
Offset_0x00D2D6:
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                 
Offset_0x00D2DA:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Offset_0x00D10C
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                moveq   #$00, D3
                move.b  Obj_Height_2(A0), D3                             ; $0016
                addq.b  #$01, D3
                move.w  (A7)+, D4
                bsr     Platform_Object_3                      ; Offset_0x014DB2
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq     Offset_0x00D390
                tst.b   ($FFFFFE78).w
                bne     Offset_0x00D390
                bsr     SingleObjectLoad_2                     ; Offset_0x013BC0
                bne.s   Offset_0x00D380
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x00D316:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x00D316
                move.b  #$0A, Obj_Routine(A1)                            ; $0024
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00D334
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
Offset_0x00D334:
                move.w  #$0200, Obj_Speed(A1)                            ; $0010
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x00D346
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x00D346:
                bset    #$01, Obj_Status(A1)                             ; $0022
                move.w  A0, D0
                subi.w  #$B000, D0
                lsr.w   #$06, D0
                andi.w  #$007F, D0
                move.w  A1, D1
                subi.w  #$B000, D1
                lsr.w   #$06, D1
                andi.w  #$007F, D1
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                cmp.b   Obj_Control_Var_11(A1), D0                       ; $003D
                bne.s   Offset_0x00D372
                move.b  D1, Obj_Control_Var_11(A1)                       ; $003D
Offset_0x00D372:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                cmp.b   Obj_Control_Var_11(A1), D0                       ; $003D
                bne.s   Offset_0x00D380
                move.b  D1, Obj_Control_Var_11(A1)                       ; $003D
Offset_0x00D380:
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                andi.b  #$E7, Obj_Status(A0)                             ; $0022
Offset_0x00D390:
                bra     Offset_0x00D2A8
;-------------------------------------------------------------------------------                 
Offset_0x00D394:
                bsr     Offset_0x00D10C
                bra     Offset_0x00D2A8
;-------------------------------------------------------------------------------                 
Offset_0x00D39C:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                btst    #$01, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x00D3DA
                bsr     SpeedToPos                             ; Offset_0x011F96
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                cmpi.w  #$0720, Obj_Y(A0)                                ; $000C
                bcs.s   Offset_0x00D3EA
                move.w  #$0720, Obj_Y(A0)                                ; $000C
                bclr    #$01, Obj_Status(A0)                             ; $0022
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  Obj_Y(A0), Obj_Control_Var_0C(A0)         ; $000C, $0038
                bra.s   Offset_0x00D3EA
Offset_0x00D3DA:
                moveq   #$00, D0
                move.b  ($FFFFFE74).w, D0
                lsr.w   #$01, D0
                add.w   Obj_Control_Var_0C(A0), D0                       ; $0038
                move.w  D0, Obj_Y(A0)                                    ; $000C
Offset_0x00D3EA:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                moveq   #$00, D3
                move.b  Obj_Height_2(A0), D3                             ; $0016
                addq.b  #$01, D3
                move.w  (A7)+, D4
                bsr     Platform_Object_3                      ; Offset_0x014DB2
                bra     MarkObjGone                            ; Offset_0x011FBC
;-------------------------------------------------------------------------------                 
Offset_0x00D402:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     SpeedToPos                             ; Offset_0x011F96
                btst    #$01, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x00D43E
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                move.w  ($FFFFF648).w, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bhi.s   Offset_0x00D46C
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.w  D0, Obj_Control_Var_0C(A0)                       ; $0038
                bclr    #$01, Obj_Status(A0)                             ; $0022
                move.w  #$0100, Obj_Speed(A0)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                bra.s   Offset_0x00D46C
Offset_0x00D43E:
                moveq   #$00, D0
                move.b  ($FFFFFE74).w, D0
                lsr.w   #$01, D0
                add.w   Obj_Control_Var_0C(A0), D0                       ; $0038
                move.w  D0, Obj_Y(A0)                                    ; $000C
                tst.w   Obj_Speed(A0)                                    ; $0010
                beq.s   Offset_0x00D46C
                moveq   #$00, D3
                move.b  Obj_Width(A0), D3                                ; $0019
                bsr     Offset_0x00D59A
                tst.w   D1
                bpl.s   Offset_0x00D46C
                add.w   D1, Obj_X(A0)                                    ; $0008
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
Offset_0x00D46C:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                moveq   #$00, D3
                move.b  Obj_Height_2(A0), D3                             ; $0016
                addq.b  #$01, D3
                move.w  (A7)+, D4
                bsr     Platform_Object_3                      ; Offset_0x014DB2
                bra     MarkObjGone                            ; Offset_0x011FBC  
;-------------------------------------------------------------------------------
OOz_Swing_Platforms_Mappings:                                  ; Offset_0x00D484
                dc.w    Offset_0x00D48C-OOz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D4AE-OOz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D4AE-OOz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D4B8-OOz_Swing_Platforms_Mappings
Offset_0x00D48C:
                dc.w    $0004
                dc.l    $F00D2004, $2002FFE0
                dc.l    $F00D200C, $20060000
                dc.l    $000D2014, $200AFFE0
                dc.l    $000D2814, $280A0000
Offset_0x00D4AE:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x00D4B8:
                dc.w    $0000  
;-------------------------------------------------------------------------------   
NGHz_Swing_Platforms_Mappings:                                 ; Offset_0x00D4BA
                dc.w    Offset_0x00D4C2-NGHz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D4D4-NGHz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D4DE-NGHz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D4F0-NGHz_Swing_Platforms_Mappings
Offset_0x00D4C2:
                dc.w    $0002
                dc.l    $F80D6055, $602AFFE0
                dc.l    $F80D6055, $602A0000
Offset_0x00D4D4:
                dc.w    $0001
                dc.l    $F8052051, $2028FFF8
Offset_0x00D4DE:
                dc.w    $0002
                dc.l    $F00E4045, $4022FFF0
                dc.l    $F8052051, $2028FFF8
Offset_0x00D4F0:
                dc.w    $0000   
;-------------------------------------------------------------------------------
DHz_Swing_Platforms_Mappings:                                  ; Offset_0x00D4F2
                dc.w    Offset_0x00D4FA-DHz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D50C-DHz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D516-DHz_Swing_Platforms_Mappings
                dc.w    Offset_0x00D528-DHz_Swing_Platforms_Mappings
Offset_0x00D4FA:
                dc.w    $0002
                dc.l    $F8096060, $6030FFE8
                dc.l    $F8096860, $68300000
Offset_0x00D50C:
                dc.w    $0001
                dc.l    $F8056066, $6033FFF8
Offset_0x00D516:
                dc.w    $0002
                dc.l    $E805406A, $4035FFF4
                dc.l    $F80B406E, $4037FFF4
Offset_0x00D528:
                dc.w    $000A
                dc.l    $A805406A, $4035FFF4
                dc.l    $B80B406E, $4037FFF4
                dc.l    $C8056066, $6033FFF8
                dc.l    $D8056066, $6033FFF8
                dc.l    $E8056066, $6033FFF8
                dc.l    $F8056066, $6033FFF8
                dc.l    $08056066, $6033FFF8
                dc.l    $18056066, $6033FFF8
                dc.l    $28056066, $6033FFF8
                dc.l    $38056066, $6033FFF8 
;-------------------------------------------------------------------------------
DHz_Swing_Platforms_Mappings_01:                               ; Offset_0x00D57A
                dc.w    Offset_0x00D580-DHz_Swing_Platforms_Mappings_01
                dc.w    Offset_0x00D50C-DHz_Swing_Platforms_Mappings_01
                dc.w    Offset_0x00D516-DHz_Swing_Platforms_Mappings_01
Offset_0x00D580:
                dc.w    $0002
                dc.l    $F80D6058, $602CFFE0
                dc.l    $F80D6858, $682C0000
;===============================================================================
; Objeto 0x15 - Plataformas tipo pendúlo na Neo Green Hill, Dust Hill e
; <<<-          Oil Ocean
;===============================================================================