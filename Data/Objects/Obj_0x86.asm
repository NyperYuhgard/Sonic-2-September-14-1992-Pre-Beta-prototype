;===============================================================================
; Objeto 0x86 - Flippers - Casino Night
; ->>>          
;===============================================================================  
; Offset_0x025C34:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x025C46(PC, D0), D1
                jsr     Offset_0x025C46(PC, D1)
                bra     Jmp_19_To_MarkObjGone                  ; Offset_0x025FF0
;-------------------------------------------------------------------------------
Offset_0x025C46:
                dc.w    Offset_0x025C4C-Offset_0x025C46
                dc.w    Offset_0x025C88-Offset_0x025C46
                dc.w    Offset_0x025E06-Offset_0x025C46       
;-------------------------------------------------------------------------------
Offset_0x025C4C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Flippers_Mappings, Obj_Map(A0) ; Offset_0x025F46, $0004
                move.w  #$43B2, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_2B_To_ModifySpriteAttr_2P          ; Offset_0x025FFC
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                tst.b   Obj_Subtype(A0)                                  ; $0028
                beq.s   Offset_0x025C88
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                bra     Offset_0x025E06     
;-------------------------------------------------------------------------------
Offset_0x025C88:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x025CFC
                lea     (Offset_0x025EB2), A2
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                beq.s   Offset_0x025CAA
                lea     (Offset_0x025ED6), A2
                subq.b  #$01, D0
                beq.s   Offset_0x025CAA
                lea     (Offset_0x025EFA), A2
Offset_0x025CAA:
                move.w  #$0023, D1
                move.w  #$0006, D2
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_01_To_SolidObject_3                ; Offset_0x02600E
                lea     Obj_Control_Var_0A(A0), A3                       ; $0036
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  ($FFFFF602).w, D5
                moveq   #$03, D6
                bsr.s   Offset_0x025CFE
                addq.w  #$01, A3
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                move.w  ($FFFFF606).w, D5
                moveq   #$04, D6
                bsr.s   Offset_0x025CFE
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x025CF2
                clr.b   Obj_Control_Var_0C(A0)                           ; $0038
                bsr     Offset_0x025D84
                subq.w  #$01, A3
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                bsr     Offset_0x025D84
Offset_0x025CF2:
                lea     (Flippers_Animate_Data), A1            ; Offset_0x025F1E
                bra     Jmp_06_To_AnimateSprite                ; Offset_0x025FF6
Offset_0x025CFC:
                rts
Offset_0x025CFE:
                move.b  (A3), D0
                bne.s   Offset_0x025D30
                btst    D6, Obj_Status(A0)                               ; $0022
                beq.s   Offset_0x025CFC
                move.b  #$01, Obj_Timer(A1)                              ; $002A
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                bset    #$02, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x025D2C
                addq.w  #$05, Obj_Y(A1)                                  ; $000C
Offset_0x025D2C:
                addq.b  #$01, (A3)
                rts
Offset_0x025D30:
                andi.w  #$0070, D5
                bne.s   Offset_0x025D7C
                btst    D6, Obj_Status(A0)                               ; $0022
                bne.s   Offset_0x025D48
                move.b  #$00, Obj_Timer(A1)                              ; $002A
                move.b  #$00, (A3)
                rts
Offset_0x025D48:
                moveq   #$00, D1
                move.b  Obj_Map_Id(A0), D1                               ; $001A
                subq.w  #$01, D1
                bset    #$00, Obj_Status(A1)                             ; $0022
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x025D66
                neg.w   D1
                bclr    #$00, Obj_Status(A1)                             ; $0022
Offset_0x025D66:
                add.w   D1, Obj_X(A1)                                    ; $0008
                lsl.w   #$08, D1
                move.w  D1, Obj_Speed(A1)                                ; $0010
                move.w  D1, Obj_Inertia(A1)                              ; $0014
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                rts
Offset_0x025D7C:
                move.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                rts
Offset_0x025D84:
                bclr    D6, Obj_Status(A0)                               ; $0022
                beq     Offset_0x025CFC
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x025D9E
                neg.w   D0
Offset_0x025D9E:
                addi.w  #$0023, D0
                move.w  D0, D2
                cmpi.w  #$0040, D2
                bcs.s   Offset_0x025DAE
                move.w  #$0040, D2
Offset_0x025DAE:
                lsl.w   #$05, D2
                addi.w  #$0800, D2
                neg.w   D2
                asr.w   #$02, D0
                addi.w  #$0040, D0
                bsr     Jmp_0A_To_CalcSine                     ; Offset_0x026002
                muls.w  D2, D0
                muls.w  D2, D1
                asr.l   #$08, D0
                asr.l   #$08, D1
                move.w  D0, Obj_Speed_Y(A1)                              ; $0012
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x025DD6
                neg.w   D1
Offset_0x025DD6:
                move.w  D1, Obj_Speed(A1)                                ; $0010
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  #$00, Obj_Timer(A1)                              ; $002A
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                move.b  #$00, (A3)
                move.w  #$00E3, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912  
;-------------------------------------------------------------------------------
Offset_0x025E06:
                move.w  #$0013, D1
                move.w  #$0018, D2
                move.w  #$0019, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     Jmp_05_To_SolidObject_2_A1             ; Offset_0x026008
                btst    #$05, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x025E2E
                bsr.s   Offset_0x025E50
Offset_0x025E2E:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     Jmp_05_To_SolidObject_2_A1             ; Offset_0x026008
                btst    #$06, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x025E46
                bsr.s   Offset_0x025E50
Offset_0x025E46:
                lea     (Flippers_Animate_Data), A1            ; Offset_0x025F1E
                bra     Jmp_06_To_AnimateSprite                ; Offset_0x025FF6
Offset_0x025E50:
                move.w  #$0300, Obj_Ani_Number(A0)                       ; $001C
                move.w  #$F000, Obj_Speed(A1)                            ; $0010
                addq.w  #$08, Obj_X(A1)                                  ; $0008
                bset    #$00, Obj_Status(A1)                             ; $0022
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x025E86
                bclr    #$00, Obj_Status(A1)                             ; $0022
                subi.w  #$0010, Obj_X(A1)                                ; $0008
                neg.w   Obj_Speed(A1)                                    ; $0010
                move.w  #$0400, Obj_Ani_Number(A0)                       ; $001C
Offset_0x025E86:
                move.w  #$000F, Obj_Control_Var_02(A1)                   ; $002E
                move.w  Obj_Speed(A1), Obj_Inertia(A1)            ; $0010, $0014
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                bset    #$02, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x025EB0
                addq.w  #$05, Obj_Y(A1)                                  ; $000C
Offset_0x025EB0:
                rts         
;-------------------------------------------------------------------------------
Offset_0x025EB2:
                dc.b    $07, $07, $07, $07, $07, $07, $07, $08
                dc.b    $09, $0A, $0B, $0A, $09, $08, $07, $06
                dc.b    $05, $04, $03, $02, $01, $00, $FF, $FE
                dc.b    $FD, $FC, $FB, $FA, $F9, $F8, $F7, $F6
                dc.b    $F5, $F4, $F3, $F2       
;-------------------------------------------------------------------------------
Offset_0x025ED6:
                dc.b    $06, $06, $06, $06, $06, $06, $07, $08
                dc.b    $09, $09, $09, $09, $09, $09, $08, $08
                dc.b    $08, $08, $08, $08, $07, $07, $07, $07
                dc.b    $06, $06, $06, $06, $05, $05, $04, $04
                dc.b    $04, $04, $04, $04                      
;-------------------------------------------------------------------------------
Offset_0x025EFA:
                dc.b    $05, $05, $05, $05, $05, $06, $07, $08
                dc.b    $09, $0A, $0B, $0B, $0C, $0C, $0D, $0D
                dc.b    $0E, $0E, $0F, $0F, $10, $10, $11, $11
                dc.b    $12, $12, $11, $11, $10, $10, $10, $10
                dc.b    $10, $10, $10, $10      
;-------------------------------------------------------------------------------
Flippers_Animate_Data:                                         ; Offset_0x025F1E
                dc.w    Offset_0x025F28-Flippers_Animate_Data
                dc.w    Offset_0x025F2B-Flippers_Animate_Data
                dc.w    Offset_0x025F31-Flippers_Animate_Data
                dc.w    Offset_0x025F34-Flippers_Animate_Data
                dc.w    Offset_0x025F3D-Flippers_Animate_Data
Offset_0x025F28:
                dc.b    $0F, $00, $FF
Offset_0x025F2B:
                dc.b    $03, $01, $02, $01, $FD, $00
Offset_0x025F31:
                dc.b    $0F, $04, $FF
Offset_0x025F34:
                dc.b    $00, $05, $04, $03, $03, $03, $03, $FD
                dc.b    $02
Offset_0x025F3D:
                dc.b    $00, $03, $04, $05, $05, $05, $05, $FD
                dc.b    $02                                           
;-------------------------------------------------------------------------------
Flippers_Mappings:                                             ; Offset_0x025F46
                dc.w    Offset_0x025F52-Flippers_Mappings
                dc.w    Offset_0x025F6C-Flippers_Mappings
                dc.w    Offset_0x025F7E-Flippers_Mappings
                dc.w    Offset_0x025F98-Flippers_Mappings
                dc.w    Offset_0x025FB2-Flippers_Mappings
                dc.w    Offset_0x025FD4-Flippers_Mappings
Offset_0x025F52:
                dc.w    $0003
                dc.l    $F70B000C, $0006FFE7
                dc.l    $FE010018, $000CFFFF
                dc.l    $0105001A, $000D0007
Offset_0x025F6C:
                dc.w    $0002
                dc.l    $F80D0000, $0000FFE8
                dc.l    $F8050008, $00040008
Offset_0x025F7E:
                dc.w    $0003
                dc.l    $E90B100C, $1006FFE7
                dc.l    $F2011018, $100CFFFF
                dc.l    $EF05101A, $100D0007
Offset_0x025F98:
                dc.w    $0003
                dc.l    $E7090024, $0012FFF1
                dc.l    $F709002A, $0015FFEF
                dc.l    $07050030, $0018FFEF
Offset_0x025FB2:
                dc.w    $0004
                dc.l    $E803001E, $000FFFF8
                dc.l    $E803081E, $080F0000
                dc.l    $08010022, $0011FFF8
                dc.l    $08010822, $08110000
Offset_0x025FD4:
                dc.w    $0003
                dc.l    $E7090824, $0812FFF7
                dc.l    $F709082A, $0815FFF9
                dc.l    $07050830, $08180001
;===============================================================================   
; Objeto 0x86 - Flippers - Casino Night
; <<<-
;===============================================================================