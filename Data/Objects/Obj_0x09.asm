;===============================================================================
; Objeto 0x09 - Sonic no Special Stage
; ->>>
;===============================================================================
; Offset_0x02ED2C:
                bsr     Offset_0x02ED44
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02ED3E(PC, D0), D1
                jmp     Offset_0x02ED3E(PC, D1)    
;-------------------------------------------------------------------------------   
Offset_0x02ED3E:
                dc.w    Offset_0x02ED58-Offset_0x02ED3E
                dc.w    Offset_0x02EE0C-Offset_0x02ED3E
                dc.w    Offset_0x02EF9C-Offset_0x02ED3E           
;-------------------------------------------------------------------------------  
Offset_0x02ED44:
                lea     ($FFFF9B82).w, A1
                moveq   #$0E, D0
Offset_0x02ED4A:
                move.w  -4(A1), -(A1)
                dbra    D0, Offset_0x02ED4A
                move.w  (Control_Ports_Buffer_Data).w, -(A1)         ; $FFFFF604
                rts
;-------------------------------------------------------------------------------                  
Offset_0x02ED58:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$007F, Obj_X(A0)                                ; $0008
                move.w  #$00A8, Obj_Y(A0)                                ; $000C
                move.b  #$0E, Obj_Height_2(A0)                           ; $0016
                move.b  #$07, Obj_Width_2(A0)                            ; $0017
                move.l  #Sonic_In_SS_Mappings, Obj_Map(A0) ; Offset_0x02F566, $0004
                move.w  #$22F2, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$02, Obj_Priority(A0)                           ; $0018
                move.w  #$0400, Obj_Control_Var_04(A0)                   ; $0030
                move.b  #$40, Obj_Angle(A0)                              ; $0026
                move.w  Obj_X(A0), Obj_Control_Var_00(A0)         ; $0008, $002C
                move.w  Obj_Y(A0), Obj_Control_Var_02(A0)         ; $000C, $002E
                subi.w  #$0064, Obj_Control_Var_02(A0)                   ; $002E
                move.w  #$2000, (Sonic_Max_Speed).w                  ; $FFFFF760
                move.b  #$01, ($FFFFF766).w
                move.w  #$0050, Obj_Control_Var_0C(A0)                   ; $0038
                move.w  #$0064, Obj_Control_Var_0E(A0)                   ; $003A
                move.l  #(Obj_Memory_Address+$02C0), A1              ; $FFFFB2C0
                move.b  #$63, (A1) ; Carrega o objeto 0x63 - Sombra do Sonic
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0018, Obj_Y(A1)                                ; $000C
                move.l  #SS_Objects_Shadow_Mappings, Obj_Map(A1) ; Offset_0x02F7E6, $0004
                move.w  #$6279, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.w  Obj_Control_Var_00(A0), Obj_Control_Var_00(A1); $002C, $002C
                move.w  Obj_Control_Var_02(A0), Obj_Control_Var_02(A1); $002E, $002E
                move.l  A0, Obj_Control_Var_08(A1)                       ; $0034
                rts
Offset_0x02EE0C:
                tst.b   Obj_Routine_2(A0)                                ; $0025
                bne.s   Offset_0x02EE40
                lea     (Control_Ports_Buffer_Data).w, A2            ; $FFFFF604
                bsr     Offset_0x02F274
                bsr     Offset_0x02F2CA
                bsr     Offset_0x02F3F0
                bsr     Offset_0x02EF4A
                bsr     Offset_0x02F194
                lea     (Sonic_In_SS_AnimateData), A1          ; Offset_0x02F538
                bsr     SS_Animate_Sprite                      ; Offset_0x02F1E4
                bsr     Jmp_23_To_DisplaySprite                ; Offset_0x02FC14
                bsr     Offset_0x02F0E4
                bra     SS_Load_Sonic_Dynamic_PLC              ; Offset_0x02EED4
Offset_0x02EE40:
                bsr     Offset_0x02EE4C
                bsr     Jmp_23_To_DisplaySprite                ; Offset_0x02FC14
                bra     SS_Load_Sonic_Dynamic_PLC              ; Offset_0x02EED4
Offset_0x02EE4C:
                moveq   #$00, D0
                move.b  Obj_Control_Var_10(A0), D0                       ; $003C
                addi.b  #$08, D0
                move.b  D0, Obj_Control_Var_10(A0)                       ; $003C
                cmp.b   Obj_Angle(A0), D0                                ; $0026
                bne.s   Offset_0x02EE66
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
Offset_0x02EE66:
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                subi.b  #$10, D0
                lsr.b   #$05, D0
                add.w   D0, D0
                move.b  Offset_0x02EEB4(PC, D0), Obj_Map_Id(A0)          ; $001A
                move.b  Offset_0x02EEB4+$01(PC, D0), D0
                or.b    D0, Obj_Flags(A0)                                ; $0001
                move.b  Obj_Control_Var_10(A0), D0                       ; $003C
                subi.b  #$08, D0
                cmp.b   Obj_Angle(A0), D0                                ; $0026
                bne.s   Offset_0x02EEB2
                tst.w   Obj_Control_Var_12(A0)                           ; $003E
                beq.s   Offset_0x02EEB2
                tst.b   ($FFFFBEC0).w
                beq.s   Offset_0x02EEA8
                move.b  #$5B, ($FFFFC140).w
                move.l  A0, ($FFFFC174).w
                bra.s   Offset_0x02EEB2
Offset_0x02EEA8:
                move.b  #$5B, ($FFFFBEC0).w
                move.l  A0, ($FFFFBEF4).w
Offset_0x02EEB2:
                rts
;-------------------------------------------------------------------------------
Offset_0x02EEB4:
                dc.b    $04, $01, $00, $00, $04, $00, $0C, $00
                dc.b    $04, $02, $00, $02, $04, $03, $0C, $01         
;-------------------------------------------------------------------------------     
Art_SS_Sonic_Ram_Buffer:                                       ; Offset_0x02EEC4
                dc.l    $00FF0000, $00FF0B00, $00FF2480, $00FF2E20
;-------------------------------------------------------------------------------   
SS_Load_Sonic_Dynamic_PLC:                                     ; Offset_0x02EED4
                lea     Art_SS_Sonic_Ram_Buffer(PC), A3        ; Offset_0x02EEC4
                lea     ($FFFFF766).w, A4
                move.w  #$5E40, D4
                moveq   #$00, D1
SS_Load_Miles_Dynamic_PLC_2:                                   ; Offset_0x02EEE2                
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                cmp.b   (A4), D0
                beq.s   Offset_0x02EF48
                move.b  D0, (A4)
                moveq   #$00, D6
                cmpi.b  #$04, D0
                blt.s   Offset_0x02EF08
                addq.w  #$04, D6
                cmpi.b  #$0C, D0
                blt.s   Offset_0x02EF08
                addq.w  #$04, D6
                cmpi.b  #$10, D0
                blt.s   Offset_0x02EF08
                addq.b  #$04, D6
Offset_0x02EF08:
                move.l  $00(A3, D6), D6
                add.w   D1, D0
                add.w   D0, D0
                lea     (Sonic_In_SS_Dyn_Script), A2           ; Offset_0x02F94E
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Offset_0x02EF48
Offset_0x02EF20:
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.w   #$01, D1
                add.l   D6, D1
                move.w  D4, D2
                add.w   D3, D4
                add.w   D3, D4
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x0019E4
                dbra    D5, Offset_0x02EF20
Offset_0x02EF48:
                rts
;-------------------------------------------------------------------------------                
Offset_0x02EF4A:
                lea     ($FFFFF603).w, A2
Miles_In_SS_Sub:                                               ; Offset_0x02EF4E                
                move.b  (A2), D0
                andi.b  #$70, D0
                beq     Offset_0x02EF9A
                move.w  #$0680, D2
                moveq   #$00, D0
                move.b  Obj_Angle(A0), D0                                ; $0026
                addi.b  #$80, D0
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  D2, D1
                asr.l   #$08, D1
                add.w   D1, Obj_Speed(A0)                                ; $0010
                muls.w  D2, D0
                asr.l   #$08, D0
                add.w   D0, Obj_Speed_Y(A0)                              ; $0012
                bset    #$02, Obj_Status(A0)                             ; $0022
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$00, Obj_Ani_Time(A0)                           ; $001E
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
Offset_0x02EF9A:
                rts
Offset_0x02EF9C:
                jsr     (ObjectFall)                           ; Offset_0x011F6A
                move.w  #$003C, D5
                move.w  #$00C8, D3
                bsr     Offset_0x02F02E
                bsr     Offset_0x02EFC4
                lea     (Sonic_In_SS_AnimateData), A1          ; Offset_0x02F538
                bsr     SS_Animate_Sprite                      ; Offset_0x02F1E4
                bsr     Jmp_23_To_DisplaySprite                ; Offset_0x02FC14
                bra     SS_Load_Sonic_Dynamic_PLC              ; Offset_0x02EED4
Offset_0x02EFC4:
                moveq   #$00, D6
                move.w  Obj_Control_Var_00(A0), D0                       ; $002C
                sub.w   Obj_X(A0), D0                                    ; $0008
                bpl.s   Offset_0x02EFD4
                st      D6
                neg.w   D0
Offset_0x02EFD4:
                lsr.w   #$01, D0
                move.b  Offset_0x02EFEC(PC, D0), D0
                tst.b   D6
                beq.s   Offset_0x02EFE6
                move.w  #$0080, D1
                sub.w   D0, D1
                move.b  D1, D0
Offset_0x02EFE6:
                move.b  D0, Obj_Angle(A0)                                ; $0026
                rts
;-------------------------------------------------------------------------------
Offset_0x02EFEC:
                dc.b    $40, $41, $42, $43, $44, $45, $46, $47
                dc.b    $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
                dc.b    $50, $51, $52, $53, $54, $55, $56, $57
                dc.b    $58, $59, $5A, $5B, $5C, $5D, $5E, $5F
                dc.b    $60, $61, $62, $63, $64, $65, $66, $67
                dc.b    $68, $69, $6A, $6B, $6C, $6D, $6E, $6F
                dc.b    $70, $71, $72, $73, $74, $75, $76, $77
                dc.b    $78, $79, $7A, $7B, $7C, $7D, $7E, $7F
                dc.b    $80, $00
;-------------------------------------------------------------------------------   
Offset_0x02F02E:
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                move.w  D0, D1
                subi.w  #$0008, D1
                cmp.w   Obj_Y(A0), D1                                    ; $000C
                bgt.s   Offset_0x02F0A2
                move.w  D0, D2
                sub.w   D5, D0
                move.w  Obj_Control_Var_00(A0), D1                       ; $002C
                sub.w   Obj_X(A0), D1                                    ; $0008
                muls.w  D1, D1
                sub.w   Obj_Y(A0), D0                                    ; $000C
                muls.w  D0, D0
                add.w   D1, D0
                move.w  D3, -(A7)
                moveq   #$0F, D3
                bsr     Offset_0x02F0A4
                move.w  D0, D4
                add.w   D5, D2
                sub.w   Obj_Y(A0), D2                                    ; $000C
                muls.w  D2, D2
                add.w   D1, D2
                move.w  D2, D0
                moveq   #$0A, D3
                bsr     Offset_0x02F0A4
                move.w  (A7)+, D3
                add.w   D4, D0
                cmp.w   D3, D0
                bcs.s   Offset_0x02F0A2
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                bclr    #$02, Obj_Status(A0)                             ; $0022
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0000, Obj_Inertia(A0)                          ; $0014
                move.w  #$0000, ($FFFF9B50).w
                move.w  #$0000, ($FFFF9B52).w
Offset_0x02F0A2:
                rts
Offset_0x02F0A4:
                movem.l D1/D2, -(A7)
                moveq   #$01, D1
Offset_0x02F0AA:
                subq.w  #$01, D3
                bmi.s   Offset_0x02F0CC
                andi.l  #$0000FFFF, D1
                beq.s   Offset_0x02F0CC
                move.w  D1, D2
                move.w  D0, D1
                divu.w  D2, D1
                add.w   D2, D1
                lsr.w   #$01, D1
                cmp.w   D1, D2
                bne.s   Offset_0x02F0AA
Offset_0x02F0C4:
                move.l  D1, D0
                movem.l (A7)+, D1/D2
                rts
Offset_0x02F0CC:
                subi.w  #$0001, D2
                cmp.w   D1, D2
                beq.s   Offset_0x02F0C4
                moveq   #$00, D0
                movem.l (A7)+, D1/D2
                rts 
;-------------------------------------------------------------------------------     
Offset_0x02F0DC:
                dc.b    $00, $00, $0C, $0C, $0A, $0A, $18, $10
;-------------------------------------------------------------------------------      
Offset_0x02F0E4:
                move.l  D7, -(A7)
                lea     ($FFFFB3C0).w, A2
                moveq   #$0B, D0
                move.w  Obj_X(A0), D2                                    ; $0008
                addi.w  #$000E, D2
                move.w  D2, D3
                subi.w  #$001C, D3
                move.w  Obj_Y(A0), D4                                    ; $000C
                addi.w  #$001C, D4
                move.w  D4, D5
                subi.w  #$0038, D5
                moveq   #$00, D6
                moveq   #$00, D7
Offset_0x02F10C:
                tst.b   (A2)
                bne.s   Offset_0x02F11C
Offset_0x02F110:
                lea     Obj_Size(A2), A2                                 ; $0040
                dbra    D0, Offset_0x02F10C
                move.l  (A7)+, D7
                rts
Offset_0x02F11C:
                cmpi.b  #$08, Obj_Ani_Number(A2)                         ; $001C
                bne.s   Offset_0x02F110
                moveq   #$00, D1
                move.b  Obj_Col_Flags(A2), D1                            ; $0020
                beq.s   Offset_0x02F110
                add.w   D1, D1
                move.b  Offset_0x02F0DC(PC, D1), D6
                move.b  Offset_0x02F0DC+$01(PC, D1), D7
                move.w  Obj_X(A2), D1                                    ; $0008
                sub.w   D6, D1
                cmp.w   D2, D1
                bgt.s   Offset_0x02F110
                add.w   D6, D1
                add.w   D6, D1
                cmp.w   D3, D1
                blt.s   Offset_0x02F110
                move.w  Obj_Y(A2), D1                                    ; $000C
                sub.w   D7, D1
                cmp.w   D4, D1
                bgt.s   Offset_0x02F110
                add.w   D7, D1
                add.w   D7, D1
                cmp.w   D5, D1
                blt.s   Offset_0x02F110
                cmpi.b  #$61, (A2)
                beq.s   Offset_0x02F170
                bset    #$07, Obj_Status(A2)                             ; $0022
                bne.s   Offset_0x02F110
                addi.w  #$0001, Obj_Control_Var_12(A0)                   ; $003E
                bra.s   Offset_0x02F110
Offset_0x02F170:
                move.b  #$00, Obj_Col_Flags(A2)                          ; $0020
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  Obj_Angle(A0), Obj_Control_Var_10(A0)     ; $0026, $003C
                bra.s   Offset_0x02F110  
;-------------------------------------------------------------------------------    
Offset_0x02F184:
                dc.b    $01, $01, $00, $00, $01, $00, $02, $00
                dc.b    $01, $02, $00, $02, $01, $03, $02, $01
;-------------------------------------------------------------------------------     
Offset_0x02F194:
                btst    #$02, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02F1A4
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x02F1A4:
                moveq   #$00, D0
                move.b  Obj_Angle(A0), D0                                ; $0026
                subi.b  #$10, D0
                lsr.b   #$05, D0
                move.b  D0, D1
                add.w   D0, D0
                move.b  Offset_0x02F184(PC, D0), D2
                cmp.b   Obj_Ani_Number(A0), D2                           ; $001C
                beq.s   Offset_0x02F1E2
                move.b  D2, Obj_Ani_Number(A0)                           ; $001C
                move.b  Offset_0x02F184+$01(PC, D0), D0
                andi.b  #$FC, Obj_Status(A0)                             ; $0022
                or.b    D0, Obj_Status(A0)                               ; $0022
                cmpi.b  #$01, D1
                beq.s   Offset_0x02F1DC
                cmpi.b  #$05, D1
                bne.s   Offset_0x02F1E2
Offset_0x02F1DC:
                move.w  #$0400, Obj_Control_Var_04(A0)                   ; $0030
Offset_0x02F1E2:
                rts
;-------------------------------------------------------------------------------                
SS_Animate_Sprite:                                             ; Offset_0x02F1E4
                moveq   #$00, D0
                move.b  Obj_Ani_Number(A0), D0                           ; $001C
                cmp.b   Obj_Ani_Flag(A0), D0                             ; $001D
                beq.s   Offset_0x02F200
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
                move.b  D0, Obj_Ani_Flag(A0)                             ; $001D
                move.b  #$00, Obj_Ani_Time(A0)                           ; $001E
Offset_0x02F200:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x02F268
                add.w   D0, D0
                adda.w  $00(A1, D0), A1
                move.b  ($FFFF9B21).w, Obj_Ani_Time(A0)                  ; $001E
                cmpi.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x02F234
                subi.b  #$01, Obj_Control_Var_05(A0)                     ; $0031
                bgt.s   Offset_0x02F234
                bchg    #00, Obj_Status(A0)                              ; $0022
                bchg    #00, Obj_Flags(A0)                               ; $0001
                move.b  Obj_Control_Var_04(A0), Obj_Control_Var_05(A0); $0030, $0031
Offset_0x02F234:
                moveq   #$00, D1
                move.b  Obj_Ani_Frame(A0), D1                            ; $001B
                move.b  $01(A1, D1), D0
                bpl.s   Offset_0x02F24A
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
                move.b  Obj_Flags(A1), D0                                ; $0001
Offset_0x02F24A:
                andi.b  #$7F, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.b  Obj_Status(A0), D1                               ; $0022
                andi.b  #$03, D1
                andi.b  #$FC, Obj_Flags(A0)                              ; $0001
                or.b    D1, Obj_Flags(A0)                                ; $0001
                addq.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
Offset_0x02F268:
                rts      
;-------------------------------------------------------------------------------   
Offset_0x02F26A:
                dc.b    $01, $00, $01, $80, $02, $80, $04, $80
                dc.b    $0A, $80      
;-------------------------------------------------------------------------------   
Offset_0x02F274:
                tst.b   Obj_Control_Var_06(A0)                           ; $0032
                bne.s   Offset_0x02F2BE
                move.w  ($FFFF9B12).w, D5
                subi.w  #$0008, D5
                add.w   D5, D5
                move.w  Offset_0x02F26A(PC, D5), D5
                btst    #$02, (A2)
                beq.s   Offset_0x02F292
                add.w   D5, Obj_Inertia(A0)                              ; $0014
Offset_0x02F292:
                btst    #$03, (A2)
                beq.s   Offset_0x02F29C
                sub.w   D5, Obj_Inertia(A0)                              ; $0014
Offset_0x02F29C:
                move.b  (A2), D0
                andi.b  #$0C, D0
                bne.s   Offset_0x02F2BE
                move.w  Obj_Inertia(A0), D0                              ; $0014
                beq.s   Offset_0x02F2BE
                bmi.s   Offset_0x02F2B6
                subi.w  #$0008, D0
                move.w  D0, Obj_Inertia(A0)                              ; $0014
                rts
Offset_0x02F2B6:
                addi.w  #$0008, D0
                move.w  D0, Obj_Inertia(A0)                              ; $0014
Offset_0x02F2BE:
                rts 
;-------------------------------------------------------------------------------    
Offset_0x02F2C0:
                dc.w    $2000, $2800, $3000, $3800, $4400
;-------------------------------------------------------------------------------  
Offset_0x02F2CA:
                move.w  ($FFFF9B12).w, D5
                subi.w  #$0008, D5
                add.w   D5, D5
                move.w  Offset_0x02F2C0(PC, D5), D5
                moveq   #$00, D0
                move.b  Obj_Angle(A0), D0                                ; $0026
                ble.s   Offset_0x02F312
                sf      Obj_Control_Var_06(A0)                           ; $0032
Offset_0x02F2E4:
                cmpi.b  #$40, D0
                beq.s   Offset_0x02F310
                blt.s   Offset_0x02F348
                subi.w  #$0040, D0
                add.w   D0, D0
                move.w  Offset_0x02F36E(PC, D0), D0
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bpl.s   Offset_0x02F2FE
                lsr.w   #$01, D0
Offset_0x02F2FE:
                sub.w   D0, Obj_Inertia(A0)                              ; $0014
                bpl.s   Offset_0x02F362
Offset_0x02F304:
                neg.w   D5
                cmp.w   Obj_Inertia(A0), D5                              ; $0014
                bcs.s   Offset_0x02F310
                move.w  D5, Obj_Inertia(A0)                              ; $0014
Offset_0x02F310:
                rts
Offset_0x02F312:
                cmpi.w  #$2000, Obj_Inertia(A0)                          ; $0014
                bge.s   Offset_0x02F342
                cmpi.w  #$E000, Obj_Inertia(A0)                          ; $0014
                ble.s   Offset_0x02F342
                tst.w   Obj_Inertia(A0)                                  ; $0014
                beq.s   Offset_0x02F2E4
                bpl.s   Offset_0x02F336
                move.b  #$01, Obj_Angle(A0)                              ; $0026
                move.b  #$01, D0
                bra.s   Offset_0x02F2E4
Offset_0x02F336:
                move.b  #$7F, Obj_Angle(A0)                              ; $0026
                move.b  #$7F, D0
                bra.s   Offset_0x02F2E4
Offset_0x02F342:
                st      Obj_Control_Var_06(A0)                           ; $0032
                rts
Offset_0x02F348:
                move.w  #$0040, D1
                sub.w   D0, D1
                add.w   D1, D1
                move.w  Offset_0x02F36E(PC, D1), D0
                tst.w   Obj_Inertia(A0)                                  ; $0014
                bmi.s   Offset_0x02F35C
                lsr.w   #$01, D0
Offset_0x02F35C:
                add.w   D0, Obj_Inertia(A0)                              ; $0014
                bmi.s   Offset_0x02F304
Offset_0x02F362:
                cmp.w   Obj_Inertia(A0), D5                              ; $0014
                bge.s   Offset_0x02F36C
                move.w  D5, Obj_Inertia(A0)                              ; $0014
Offset_0x02F36C:
                rts   
;-------------------------------------------------------------------------------
Offset_0x02F36E:
                dc.w    $0000, $0008, $0010, $0018, $0020, $0028, $0030, $0038
                dc.w    $0040, $0048, $0050, $0058, $0060, $0068, $0070, $0078
                dc.w    $0080, $0090, $00A0, $00B0, $00C0, $00D0, $00E0, $00F0
                dc.w    $0100, $0120, $0140, $0160, $0180, $01A0, $01C0, $01E0
                dc.w    $0200, $0240, $0280, $02C0, $0300, $0340, $0380, $03C0
                dc.w    $0400, $0480, $0500, $0580, $0600, $0680, $0700, $0780
                dc.w    $0800, $0900, $0A00, $0B00, $0C00, $0D00, $0E00, $0F00
                dc.w    $1000, $1200, $1400, $1600, $1800, $1A00, $1C00, $1E00
                dc.w    $2000
;-------------------------------------------------------------------------------   
Offset_0x02F3F0:
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  Obj_Inertia(A0), D2                              ; $0014
                bpl.s   Offset_0x02F406
                neg.w   D2
                lsr.w   #$08, D2
                lsr.w   #$04, D2
                sub.b   D2, Obj_Angle(A0)                                ; $0026
                bra.s   Offset_0x02F40E
Offset_0x02F406:
                lsr.w   #$08, D2
                lsr.w   #$04, D2
                add.b   D2, Obj_Angle(A0)                                ; $0026
Offset_0x02F40E:
                move.b  Obj_Angle(A0), D0                                ; $0026
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  Obj_Control_Var_0C(A0), D1                       ; $0038
                asr.l   #$08, D1
                add.w   Obj_Control_Var_00(A0), D1                       ; $002C
                move.w  D1, Obj_X(A0)                                    ; $0008
                muls.w  Obj_Control_Var_0E(A0), D0                       ; $003A
                asr.l   #$08, D0
                add.w   Obj_Control_Var_02(A0), D0                       ; $002E
                move.w  D0, Obj_Y(A0)                                    ; $000C
                rts                                                                                                                                                              
;===============================================================================
; Objeto 0x09 - Sonic no Special Stage
; <<<-
;===============================================================================