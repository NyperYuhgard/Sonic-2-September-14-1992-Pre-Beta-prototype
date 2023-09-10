;===============================================================================
; Objeto 0x2D - Porta automática na Chemical Plant / Hill Top / Metropolis
; ->>> 
;=============================================================================== 
; Offset_0x00E792:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00E7A0(PC, D0), D1
                jmp     Offset_0x00E7A0(PC, D1)             
;-------------------------------------------------------------------------------
Offset_0x00E7A0:
                dc.w    Offset_0x00E7A4-Offset_0x00E7A0
                dc.w    Offset_0x00E856-Offset_0x00E7A0  
;-------------------------------------------------------------------------------
Offset_0x00E7A4:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Automatic_Door_Mappings, Obj_Map(A0) ; Offset_0x00E91A, $0004
                move.w  #$2426, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$08, Obj_Width(A0)                              ; $0019
                cmpi.b  #$04, (Level_Id).w                           ; $FFFFFE10
                beq.s   Offset_0x00E7CC
                cmpi.b  #$05, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00E7D8
Offset_0x00E7CC:
                move.w  #$6000, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$0C, Obj_Width(A0)                              ; $0019
Offset_0x00E7D8:
                cmpi.b  #$0D, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00E7EC
                move.w  #$2394, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$08, Obj_Width(A0)                              ; $0019
Offset_0x00E7EC:
                cmpi.b  #$0E, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00E800
                move.w  #$2328, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$08, Obj_Width(A0)                              ; $0019
Offset_0x00E800:
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00E814
                move.w  #$23F8, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$08, Obj_Width(A0)                              ; $0019
Offset_0x00E814:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                move.b  Obj_Subtype(A0), Obj_Map_Id(A0)           ; $001A, $0028
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  D2, D3
                subi.w  #$0200, D2
                addi.w  #$0018, D3
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x00E84E
                subi.w  #$FE18, D2
                addi.w  #$01E8, D3
Offset_0x00E84E:
                move.w  D2, Obj_Control_Var_0C(A0)                       ; $0038
                move.w  D3, Obj_Control_Var_0E(A0)                       ; $003A
;-------------------------------------------------------------------------------                
Offset_0x00E856:
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x00E872
                move.w  Obj_Control_Var_0C(A0), D2                       ; $0038
                move.w  Obj_X(A0), D3                                    ; $0008
                tst.b   Obj_Routine_2(A0)                                ; $0025
                beq.s   Offset_0x00E884
                move.w  Obj_Control_Var_0E(A0), D3                       ; $003A
                bra.s   Offset_0x00E884
Offset_0x00E872:
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  Obj_Control_Var_0E(A0), D3                       ; $003A
                tst.b   Obj_Routine_2(A0)                                ; $0025
                beq.s   Offset_0x00E884
                move.w  Obj_Control_Var_0C(A0), D2                       ; $0038
Offset_0x00E884:
                move.w  Obj_Control_Var_06(A0), D4                       ; $0032
                move.w  D4, D5
                subi.w  #$0020, D4
                addi.w  #$0020, D5
                move.b  #$00, Obj_Routine_2(A0)                          ; $0025
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x00E8EC
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr.s   Offset_0x00E8EC
                tst.b   Obj_Routine_2(A0)                                ; $0025
                beq.s   Offset_0x00E8B8
                cmpi.w  #$0040, Obj_Control_Var_04(A0)                   ; $0030
                beq.s   Offset_0x00E8CE
                addq.w  #$08, Obj_Control_Var_04(A0)                     ; $0030
                bra.s   Offset_0x00E8C2
Offset_0x00E8B8:
                tst.w   Obj_Control_Var_04(A0)                           ; $0030
                beq.s   Offset_0x00E8CE
                subq.w  #$08, Obj_Control_Var_04(A0)                     ; $0030
Offset_0x00E8C2:
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                sub.w   Obj_Control_Var_04(A0), D0                       ; $0030
                move.w  D0, Obj_Y(A0)                                    ; $000C
Offset_0x00E8CE:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                move.w  #$0020, D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     SolidObject                            ; Offset_0x0147F4
                bra     MarkObjGone                            ; Offset_0x011FBC
Offset_0x00E8EC:
                move.w  Obj_X(A1), D0                                    ; $0008
                cmp.w   D2, D0
                blt     Offset_0x00E918
                cmp.w   D3, D0
                bcc     Offset_0x00E918
                move.w  Obj_Y(A1), D0                                    ; $000C
                cmp.w   D4, D0
                bcs     Offset_0x00E918
                cmp.w   D5, D0
                bcc     Offset_0x00E918
                tst.b   Obj_Timer(A1)                                    ; $002A
                bmi.s   Offset_0x00E918
                move.b  #$02, Obj_Routine_2(A0)                          ; $0025
Offset_0x00E918:
                rts    
;-------------------------------------------------------------------------------
Automatic_Door_Mappings:                                       ; Offset_0x00E91A
                dc.w    Offset_0x00E922-Automatic_Door_Mappings
                dc.w    Offset_0x00E944-Automatic_Door_Mappings
                dc.w    Offset_0x00E956-Automatic_Door_Mappings
                dc.w    Offset_0x00E968-Automatic_Door_Mappings
Offset_0x00E922:
                dc.w    $0004
                dc.l    $E0050000, $0000FFF8
                dc.l    $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8
                dc.l    $10050000, $0000FFF8
Offset_0x00E944:
                dc.w    $0002
                dc.l    $E00B005F, $002FFFF4
                dc.l    $000B005F, $002FFFF4
Offset_0x00E956:
                dc.w    $0002
                dc.l    $E0070000, $0000FFF8
                dc.l    $00070000, $0000FFF8
Offset_0x00E968:
                dc.w    $0002
                dc.l    $E0070000, $0000FFF8
                dc.l    $00070000, $0000FFF8                                                                                                       
;===============================================================================
; Objeto 0x2D - Porta automática na Chemical Plant / Hill Top / Metropolis
; <<<- 
;===============================================================================