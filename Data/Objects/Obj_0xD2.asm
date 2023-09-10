;===============================================================================
; Objeto 0xD2 -> Plataformas verdes que aprecem de desaparecem na Casino Night
; ->>> 
;===============================================================================
; Offset_0x026014:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x026022(PC, D0), D1
                jmp     Offset_0x026022(PC, D1)        
;-------------------------------------------------------------------------------
Offset_0x026022:
                dc.w    Offset_0x026026-Offset_0x026022
                dc.w    Offset_0x02606A-Offset_0x026022   
;-------------------------------------------------------------------------------
Offset_0x026026:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Green_Platform_Mappings, Obj_Map(A0) ; Offset_0x026180, $0004
                move.w  #$437C, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_2C_To_ModifySpriteAttr_2P          ; Offset_0x026326
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.w  Obj_X(A0), Obj_Control_Var_04(A0)         ; $0008, $0030
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$04, D0
                move.w  D0, Obj_Control_Var_0C(A0)                       ; $0038
                bsr     Offset_0x0260F8             
;-------------------------------------------------------------------------------
Offset_0x02606A:
                tst.w   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x026078
                subq.w  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bra     Jmp_07_To_MarkObjGone_3                ; Offset_0x026320
Offset_0x026078:
                subq.w  #$01, Obj_Control_Var_0E(A0)                     ; $003A
                bpl.s   Offset_0x0260D8
                move.w  #$000F, Obj_Control_Var_0E(A0)                   ; $003A
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                andi.b  #$0F, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x0260D6
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$04, D0
                move.w  D0, Obj_Control_Var_0C(A0)                       ; $0038
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x0260CE
                bclr    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0260BA
                bclr    #$03, ($FFFFB022).w
                bset    #$01, ($FFFFB022).w
Offset_0x0260BA:
                bclr    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0260CE
                bclr    #$03, ($FFFFB062).w
                bset    #$01, ($FFFFB062).w
Offset_0x0260CE:
                move.w  Obj_Control_Var_04(A0), Obj_X(A0)         ; $0008, $0030
                bra.s   Offset_0x0260F8
Offset_0x0260D6:
                bsr.s   Offset_0x0260F8
Offset_0x0260D8:
                move.w  Obj_Control_Var_08(A0), D1                       ; $0034
                addi.w  #$000B, D1
                move.w  Obj_Control_Var_0A(A0), D2                       ; $0036
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_15_To_SolidObject                  ; Offset_0x02632C
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                bra     Jmp_08_To_MarkObjGone_2                ; Offset_0x026332
Offset_0x0260F8:
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                add.w   D0, D0
                add.w   D0, D0
                lea     Offset_0x026140(PC, D0), A1
                move.b  (A1)+, D0
                ext.w   D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x026114
                neg.w   D0
Offset_0x026114:
                add.w   Obj_Control_Var_04(A0), D0                       ; $0030
                move.w  D0, Obj_X(A0)                                    ; $0008
                move.b  (A1)+, D0
                ext.w   D0
                add.w   Obj_Control_Var_06(A0), D0                       ; $0032
                move.w  D0, Obj_Y(A0)                                    ; $000C
                moveq   #$00, D1
                moveq   #$00, D2
                moveq   #$00, D3
                move.b  (A1)+, D1
                move.b  (A1)+, D2
                move.w  D1, Obj_Control_Var_08(A0)                       ; $0034
                move.b  D1, Obj_Width(A0)                                ; $0019
                move.w  D2, Obj_Control_Var_0A(A0)                       ; $0036
                rts                                   
;-------------------------------------------------------------------------------
Offset_0x026140:
                dc.b    $D8, $18, $08, $08, $D8, $10, $08, $10
                dc.b    $D8, $08, $08, $18, $D8, $00, $08, $20
                dc.b    $E0, $00, $10, $20, $E8, $F8, $18, $18
                dc.b    $F0, $F0, $20, $10, $F8, $E8, $28, $08
                dc.b    $08, $E8, $28, $08, $10, $F0, $20, $10
                dc.b    $18, $F8, $18, $18, $20, $00, $10, $20
                dc.b    $28, $00, $08, $20, $28, $08, $08, $18
                dc.b    $28, $10, $08, $10, $28, $18, $08, $08     
;-------------------------------------------------------------------------------
Green_Platform_Mappings:                                       ; Offset_0x026180
                dc.w    Offset_0x0261A0-Green_Platform_Mappings
                dc.w    Offset_0x0261AA-Green_Platform_Mappings
                dc.w    Offset_0x0261BC-Green_Platform_Mappings
                dc.w    Offset_0x0261D6-Green_Platform_Mappings
                dc.w    Offset_0x0261F8-Green_Platform_Mappings
                dc.w    Offset_0x026222-Green_Platform_Mappings
                dc.w    Offset_0x02624C-Green_Platform_Mappings
                dc.w    Offset_0x026276-Green_Platform_Mappings
                dc.w    Offset_0x026276-Green_Platform_Mappings
                dc.w    Offset_0x0262A0-Green_Platform_Mappings
                dc.w    Offset_0x0262CA-Green_Platform_Mappings
                dc.w    Offset_0x0262F4-Green_Platform_Mappings
                dc.w    Offset_0x0261D6-Green_Platform_Mappings
                dc.w    Offset_0x0261BC-Green_Platform_Mappings
                dc.w    Offset_0x0261AA-Green_Platform_Mappings
                dc.w    Offset_0x0261A0-Green_Platform_Mappings
Offset_0x0261A0:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x0261AA:
                dc.w    $0002
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8
Offset_0x0261BC:
                dc.w    $0003
                dc.l    $E8050000, $0000FFF8
                dc.l    $F8050000, $0000FFF8
                dc.l    $08050000, $0000FFF8
Offset_0x0261D6:
                dc.w    $0004
                dc.l    $E0050000, $0000FFF8
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8
                dc.l    $10050000, $0000FFF8
Offset_0x0261F8:
                dc.w    $0005
                dc.l    $E0050000, $00000000
                dc.l    $E0050000, $0000FFF0
                dc.l    $F0050000, $0000FFF0
                dc.l    $00050000, $0000FFF0
                dc.l    $10050000, $0000FFF0
Offset_0x026222:
                dc.w    $0005
                dc.l    $E8050000, $00000008
                dc.l    $E8050000, $0000FFF8
                dc.l    $E8050000, $0000FFE8
                dc.l    $F8050000, $0000FFE8
                dc.l    $08050000, $0000FFE8
Offset_0x02624C:
                dc.w    $0005
                dc.l    $F0050000, $00000010
                dc.l    $F0050000, $00000000
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050000, $0000FFE0
                dc.l    $00050000, $0000FFE0
Offset_0x026276:
                dc.w    $0005
                dc.l    $F8050000, $00000018
                dc.l    $F8050000, $00000008
                dc.l    $F8050000, $0000FFF8
                dc.l    $F8050000, $0000FFE8
                dc.l    $F8050000, $0000FFD8
Offset_0x0262A0:
                dc.w    $0005
                dc.l    $00050000, $00000010
                dc.l    $F0050000, $00000010
                dc.l    $F0050000, $00000000
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050000, $0000FFE0
Offset_0x0262CA:
                dc.w    $0005
                dc.l    $08050000, $00000008
                dc.l    $F8050000, $00000008
                dc.l    $E8050000, $00000008
                dc.l    $E8050000, $0000FFF8
                dc.l    $E8050000, $0000FFE8
Offset_0x0262F4:
                dc.w    $0005
                dc.l    $10050000, $00000000
                dc.l    $00050000, $00000000
                dc.l    $F0050000, $00000000
                dc.l    $E0050000, $00000000
                dc.l    $E0050000, $0000FFF0
;===============================================================================
; Objeto 0xD2 -> Plataformas verdes que aprecem de desaparecem na Casino Night
; <<<- 
;===============================================================================