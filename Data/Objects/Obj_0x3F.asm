;===============================================================================
; Objeto 0x3F - Ventiladores na Oil Ocean
; ->>> 
;===============================================================================
; Offset_0x02531C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02532A(PC, D0), D1
                jmp     Offset_0x02532A(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x02532A:
                dc.w    Offset_0x025330-Offset_0x02532A
                dc.w    Offset_0x02536E-Offset_0x02532A
                dc.w    Offset_0x02545C-Offset_0x02532A 
;-------------------------------------------------------------------------------
Offset_0x025330:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Vertical_Fan_Mappings, Obj_Map(A0) ; Offset_0x025562, $0004
                move.w  #$6403, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_29_To_ModifySpriteAttr_2P          ; Offset_0x0256CE
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bpl.s   Offset_0x02536E
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Horizontal_Fan_Mappings, Obj_Map(A0) ; Offset_0x025614, $0004
                bra     Offset_0x02545C    
;-------------------------------------------------------------------------------
Offset_0x02536E:
                btst    #$01, Obj_Subtype(A0)                            ; $0028
                bne.s   Offset_0x025396
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bpl.s   Offset_0x025396
                move.w  #$0000, Obj_Control_Var_08(A0)                   ; $0034
                move.w  #$0078, Obj_Control_Var_04(A0)                   ; $0030
                bchg    #00, Obj_Control_Var_06(A0)                      ; $0032
                beq.s   Offset_0x025396
                move.w  #$00B4, Obj_Control_Var_04(A0)                   ; $0030
Offset_0x025396:
                tst.b   Obj_Control_Var_06(A0)                           ; $0032
                beq     Offset_0x0253BA
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x0253FC
                cmpi.w  #$0400, Obj_Control_Var_08(A0)                   ; $0034
                bcc.s   Offset_0x0253FC
                addi.w  #$002A, Obj_Control_Var_08(A0)                   ; $0034
                move.b  Obj_Control_Var_08(A0), Obj_Ani_Time(A0)  ; $001E, $0034
                bra.s   Offset_0x0253D6
Offset_0x0253BA:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr     Offset_0x025400
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr     Offset_0x025400
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x0253FC
                move.b  #$00, Obj_Ani_Time(A0)                           ; $001E
Offset_0x0253D6:
                addq.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
                cmpi.b  #$06, Obj_Ani_Frame(A0)                          ; $001B
                bcs.s   Offset_0x0253E8
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
Offset_0x0253E8:
                moveq   #$00, D0
                btst    #$00, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x0253F4
                moveq   #$05, D0
Offset_0x0253F4:
                add.b   Obj_Ani_Frame(A0), D0                            ; $001B
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
Offset_0x0253FC:
                bra     Jmp_18_To_MarkObjGone                  ; Offset_0x0256C8
Offset_0x025400:
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x025412
                neg.w   D0
Offset_0x025412:
                addi.w  #$0050, D0
                cmpi.w  #$00F0, D0
                bcc.s   Offset_0x02545A
                move.w  Obj_Y(A1), D1                                    ; $000C
                addi.w  #$0060, D1
                sub.w   Obj_Y(A0), D1                                    ; $000C
                bcs.s   Offset_0x02545A
                cmpi.w  #$0070, D1
                bcc.s   Offset_0x02545A
                subi.w  #$0050, D0
                bcc.s   Offset_0x02543A
                not.w   D0
                add.w   D0, D0
Offset_0x02543A:
                addi.w  #$0060, D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x025448
                neg.w   D0
Offset_0x025448:
                neg.w   D0
                asr.w   #$04, D0
                btst    #$00, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x025456
                neg.w   D0
Offset_0x025456:
                add.w   D0, Obj_X(A1)                                    ; $0008
Offset_0x02545A:
                rts  
;-------------------------------------------------------------------------------
Offset_0x02545C:
                btst    #$01, Obj_Subtype(A0)                            ; $0028
                bne.s   Offset_0x025484
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bpl.s   Offset_0x025484
                move.w  #$0000, Obj_Control_Var_08(A0)                   ; $0034
                move.w  #$0078, Obj_Control_Var_04(A0)                   ; $0030
                bchg    #00, Obj_Control_Var_06(A0)                      ; $0032
                beq.s   Offset_0x025484
                move.w  #$00B4, Obj_Control_Var_04(A0)                   ; $0030
Offset_0x025484:
                tst.b   Obj_Control_Var_06(A0)                           ; $0032
                beq     Offset_0x0254A8
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x0254EA
                cmpi.w  #$0400, Obj_Control_Var_08(A0)                   ; $0034
                bcc.s   Offset_0x0254EA
                addi.w  #$002A, Obj_Control_Var_08(A0)                   ; $0034
                move.b  Obj_Control_Var_08(A0), Obj_Ani_Time(A0)  ; $001E, $0034
                bra.s   Offset_0x0254C4
Offset_0x0254A8:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr     Offset_0x0254EE
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr     Offset_0x0254EE
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x0254EA
                move.b  #$00, Obj_Ani_Time(A0)                           ; $001E
Offset_0x0254C4:
                addq.b  #$01, Obj_Ani_Frame(A0)                          ; $001B
                cmpi.b  #$06, Obj_Ani_Frame(A0)                          ; $001B
                bcs.s   Offset_0x0254D6
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
Offset_0x0254D6:
                moveq   #$00, D0
                btst    #$00, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x0254E2
                moveq   #$05, D0
Offset_0x0254E2:
                add.b   Obj_Ani_Frame(A0), D0                            ; $001B
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
Offset_0x0254EA:
                bra     Jmp_18_To_MarkObjGone                  ; Offset_0x0256C8
Offset_0x0254EE:
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                addi.w  #$0040, D0
                cmpi.w  #$0080, D0
                bcc.s   Offset_0x025560
                moveq   #$00, D1
                move.b  ($FFFFFE74).w, D1
                add.w   Obj_Y(A1), D1                                    ; $000C
                addi.w  #$0060, D1
                sub.w   Obj_Y(A0), D1                                    ; $000C
                bcs.s   Offset_0x025560
                cmpi.w  #$0090, D1
                bcc.s   Offset_0x025560
                subi.w  #$0060, D1
                bcs.s   Offset_0x025524
                not.w   D1
                add.w   D1, D1
Offset_0x025524:
                addi.w  #$0060, D1
                neg.w   D1
                asr.w   #$04, D1
                add.w   D1, Obj_Y(A1)                                    ; $000C
                bset    #$01, Obj_Status(A1)                             ; $0022
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                tst.b   Obj_Flip_Angle(A1)                               ; $0027
                bne.s   Offset_0x025560
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$7F, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$08, Obj_Control_Var_01(A1)                     ; $002D
Offset_0x025560:
                rts
;-------------------------------------------------------------------------------
Vertical_Fan_Mappings:                                         ; Offset_0x025562
                dc.w    Offset_0x025578-Vertical_Fan_Mappings
                dc.w    Offset_0x025592-Vertical_Fan_Mappings
                dc.w    Offset_0x0255AC-Vertical_Fan_Mappings
                dc.w    Offset_0x0255C6-Vertical_Fan_Mappings
                dc.w    Offset_0x0255E0-Vertical_Fan_Mappings
                dc.w    Offset_0x0255FA-Vertical_Fan_Mappings
                dc.w    Offset_0x0255E0-Vertical_Fan_Mappings
                dc.w    Offset_0x0255C6-Vertical_Fan_Mappings
                dc.w    Offset_0x0255AC-Vertical_Fan_Mappings
                dc.w    Offset_0x025592-Vertical_Fan_Mappings
                dc.w    Offset_0x025578-Vertical_Fan_Mappings
Offset_0x025578:
                dc.w    $0003
                dc.l    $F3020000, $0000FFF4
                dc.l    $F0050007, $0003FFFC
                dc.l    $00051007, $1003FFFC
Offset_0x025592:
                dc.w    $0003
                dc.l    $F5021000, $1000FFF4
                dc.l    $F0050007, $0003FFFC
                dc.l    $00051007, $1003FFFC
Offset_0x0255AC:
                dc.w    $0003
                dc.l    $F0030003, $0001FFF4
                dc.l    $F0050007, $0003FFFC
                dc.l    $00051007, $1003FFFC
Offset_0x0255C6:
                dc.w    $0003
                dc.l    $F3020000, $0000FFF4
                dc.l    $F005000B, $0005FFFC
                dc.l    $0005100B, $1005FFFC
Offset_0x0255E0:
                dc.w    $0003
                dc.l    $F5021000, $1000FFF4
                dc.l    $F005000B, $0005FFFC
                dc.l    $0005100B, $1005FFFC
Offset_0x0255FA:
                dc.w    $0003
                dc.l    $F0030003, $0001FFF4
                dc.l    $F005000B, $0005FFFC
                dc.l    $0005100B, $1005FFFC      
;-------------------------------------------------------------------------------
Horizontal_Fan_Mappings:                                       ; Offset_0x025614
                dc.w    Offset_0x02562A-Horizontal_Fan_Mappings
                dc.w    Offset_0x025644-Horizontal_Fan_Mappings
                dc.w    Offset_0x02565E-Horizontal_Fan_Mappings
                dc.w    Offset_0x025678-Horizontal_Fan_Mappings
                dc.w    Offset_0x025692-Horizontal_Fan_Mappings
                dc.w    Offset_0x0256AC-Horizontal_Fan_Mappings
                dc.w    Offset_0x025692-Horizontal_Fan_Mappings
                dc.w    Offset_0x025678-Horizontal_Fan_Mappings
                dc.w    Offset_0x02565E-Horizontal_Fan_Mappings
                dc.w    Offset_0x025644-Horizontal_Fan_Mappings
                dc.w    Offset_0x02562A-Horizontal_Fan_Mappings
Offset_0x02562A:
                dc.w    $0003
                dc.l    $F408000F, $0007FFF3
                dc.l    $FC050016, $000BFFF0
                dc.l    $FC050816, $080B0000
Offset_0x025644:
                dc.w    $0003
                dc.l    $F408080F, $0807FFF5
                dc.l    $FC050016, $000BFFF0
                dc.l    $FC050816, $080B0000
Offset_0x02565E:
                dc.w    $0003
                dc.l    $F40C0012, $0009FFF0
                dc.l    $FC050016, $000BFFF0
                dc.l    $FC050816, $080B0000
Offset_0x025678:
                dc.w    $0003
                dc.l    $F408000F, $0007FFF3
                dc.l    $FC05001A, $000DFFF0
                dc.l    $FC05081A, $080D0000
Offset_0x025692:
                dc.w    $0003
                dc.l    $F408080F, $0807FFF5
                dc.l    $FC05001A, $000DFFF0
                dc.l    $FC05081A, $080D0000
Offset_0x0256AC:
                dc.w    $0003
                dc.l    $F40C0012, $0009FFF0
                dc.l    $FC05001A, $000DFFF0
                dc.l    $FC05081A, $080D0000
;===============================================================================
; Objeto 0x3F - Ventiladores na Oil Ocean
; <<<- 
;===============================================================================