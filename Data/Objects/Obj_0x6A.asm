;===============================================================================
; Objeto 0x6A - Três caixas rodando na Mystic Cave / Plataformas na Metropolis
; ->>> 
;===============================================================================
; Offset_0x0224B0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0224BE(PC, D0), D1
                jmp     Offset_0x0224BE(PC, D1)
;-------------------------------------------------------------------------------    
Offset_0x0224BE:
                dc.w    Offset_0x0224C4-Offset_0x0224BE
                dc.w    Offset_0x0225DE-Offset_0x0224BE
                dc.w    Offset_0x022666-Offset_0x0224BE      
;-------------------------------------------------------------------------------  
Offset_0x0224C4:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Mz_Platform_Mappings, Obj_Map(A0) ; Offset_0x0218C4, $0004
                move.w  #$6000, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$0C, Obj_Height_2(A0)                           ; $0016
                move.l  #Offset_0x0226DC, Obj_Control_Var_00(A0)         ; $002C
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$0B, (Level_Id).w                           ; $FFFFFE10
                bne     Offset_0x0225C4
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Rotating_Boxes_Mappings, Obj_Map(A0) ; Offset_0x022730, $0004
                move.w  #$63D4, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$20, Obj_Height_2(A0)                           ; $0016
                move.l  #Offset_0x0226F4, Obj_Control_Var_00(A0)         ; $002C
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02253C
                move.l  #Offset_0x022712, Obj_Control_Var_00(A0)         ; $002C
Offset_0x02253C:
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$18, Obj_Subtype(A0)                            ; $0028
                bne     Offset_0x0225D0
                bsr     Jmp_0A_To_SingleObjectLoad_2           ; Offset_0x022754
                bne.s   Offset_0x02259C
                bsr.s   Offset_0x02259E
                addi.w  #$0040, Obj_X(A1)                                ; $0008
                addi.w  #$0040, Obj_Y(A1)                                ; $000C
                move.b  #$06, Obj_Subtype(A1)                            ; $0028
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x022574
                move.b  #$0C, Obj_Subtype(A1)                            ; $0028
Offset_0x022574:
                bsr     Jmp_0A_To_SingleObjectLoad_2           ; Offset_0x022754
                bne.s   Offset_0x02259C
                bsr.s   Offset_0x02259E
                subi.w  #$0040, Obj_X(A1)                                ; $0008
                addi.w  #$0040, Obj_Y(A1)                                ; $000C
                move.b  #$0C, Obj_Subtype(A1)                            ; $0028
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02259C
                move.b  #$06, Obj_Subtype(A1)                            ; $0028
Offset_0x02259C:
                bra.s   Offset_0x0225C4
Offset_0x02259E:
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_X(A0), Obj_Control_Var_06(A1)         ; $0008, $0032
                move.w  Obj_Y(A0), Obj_Control_Var_04(A1)         ; $000C, $0030
                move.b  Obj_Status(A0), Obj_Status(A1)            ; $0022, $0022
                rts
Offset_0x0225C4:
                move.w  Obj_X(A0), Obj_Control_Var_06(A0)         ; $0008, $0032
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
Offset_0x0225D0:
                bsr     Jmp_19_To_ModifySpriteAttr_2P          ; Offset_0x02275A
                move.b  Obj_Subtype(A0), Obj_Control_Var_0C(A0)   ; $0028, $0038
                bra     Offset_0x0226A2
Offset_0x0225DE:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                tst.w   Obj_Control_Var_0A(A0)                           ; $0036
                bne.s   Offset_0x02262E
                move.b  Obj_Control_Var_10(A0), D1                       ; $003C
                move.b  Obj_Status(A0), D0                               ; $0022
                btst    #$03, D0
                bne.s   Offset_0x02260A
                btst    #$03, D1
                beq.s   Offset_0x02260E
                move.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                move.b  #$00, Obj_Control_Var_10(A0)                     ; $003C
                bra.s   Offset_0x02263E
Offset_0x02260A:
                move.b  D0, Obj_Control_Var_10(A0)                       ; $003C
Offset_0x02260E:
                btst    #$04, D0
                bne.s   Offset_0x022628
                btst    #$04, D1
                beq.s   Offset_0x02263E
                move.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                move.b  #$00, Obj_Control_Var_10(A0)                     ; $003C
                bra.s   Offset_0x02263E
Offset_0x022628:
                move.b  D0, Obj_Control_Var_10(A0)                       ; $003C
                bra.s   Offset_0x02263E
Offset_0x02262E:
                jsr     (SpeedToPos)                           ; Offset_0x011F96
                subq.w  #$01, Obj_Control_Var_08(A0)                     ; $0034
                bne.s   Offset_0x02263E
                bsr     Offset_0x0226A2
Offset_0x02263E:
                move.w  (A7)+, D4
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x02265E
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                bsr     Jmp_0A_To_SolidObject                  ; Offset_0x022760
Offset_0x02265E:
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                bra     Jmp_02_To_MarkObjGone_2                ; Offset_0x022766
Offset_0x022666:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                jsr     (SpeedToPos)                           ; Offset_0x011F96
                subq.w  #$01, Obj_Control_Var_08(A0)                     ; $0034
                bne.s   Offset_0x02267A
                bsr     Offset_0x0226A2
Offset_0x02267A:
                move.w  (A7)+, D4
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x02269A
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                bsr     Jmp_0A_To_SolidObject                  ; Offset_0x022760
Offset_0x02269A:
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                bra     Jmp_02_To_MarkObjGone_2                ; Offset_0x022766
Offset_0x0226A2:
                moveq   #$00, D0
                move.b  Obj_Control_Var_0C(A0), D0                       ; $0038
                move.l  Obj_Control_Var_00(A0), A1                       ; $002C
                lea     $00(A1, D0), A1
                move.w  (A1)+, Obj_Speed(A0)                             ; $0010
                move.w  (A1)+, Obj_Speed_Y(A0)                           ; $0012
                move.w  (A1)+, Obj_Control_Var_08(A0)                    ; $0034
                move.w  #$0007, Obj_Control_Var_0E(A0)                   ; $003A
                move.b  #$00, Obj_Control_Var_0A(A0)                     ; $0036
                addq.b  #$06, Obj_Control_Var_0C(A0)                     ; $0038
                cmpi.b  #$18, Obj_Control_Var_0C(A0)                     ; $0038
                bcs.s   Offset_0x0226DA
                move.b  #$00, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x0226DA:
                rts     
;-------------------------------------------------------------------------------    
Offset_0x0226DC:
                dc.w    $0000, $0400, $0010, $0400, $FE00, $0020, $0000, $0400
                dc.w    $0010, $FC00, $FE00, $0020
;-------------------------------------------------------------------------------
Offset_0x0226F4:
                dc.w    $0000, $0100, $0040, $FF00, $0000, $0080, $0000, $FF00
                dc.w    $0040, $0100, $0000, $0080, $0100, $0000, $0040   
;-------------------------------------------------------------------------------
Offset_0x022712:
                dc.w    $0000, $0100, $0040, $0100, $0000, $0080, $0000, $FF00
                dc.w    $0040, $FF00, $0000, $0080, $FF00, $0000, $0040
;-------------------------------------------------------------------------------  
Rotating_Boxes_Mappings:                                       ; Offset_0x022730
                dc.w    Offset_0x022732-Rotating_Boxes_Mappings
Offset_0x022732:
                dc.w    $0004
                dc.l    $E00F0000, $0000FFE0
                dc.l    $E00F0010, $00080000
                dc.l    $000F1810, $1808FFE0
                dc.l    $000F1800, $18000000            
;===============================================================================
; Objeto 0x6A - Três caixas rodando na Mystic Cave / Plataformas na Metropolis
; <<<- 
;===============================================================================