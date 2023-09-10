;===============================================================================
; Objeto 0x69 - Porca usada nos parafusos na Metropolis
; ->>> 
;===============================================================================
; Offset_0x022284:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x022292(PC, D0), D1
                jmp     Offset_0x022292(PC, D1)
;-------------------------------------------------------------------------------                                        
Offset_0x022292:
                dc.w    Offset_0x02229A-Offset_0x022292
                dc.w    Offset_0x0222DC-Offset_0x022292
                dc.w    Offset_0x0223FC-Offset_0x022292
                dc.w    Offset_0x0222F4-Offset_0x022292
;-------------------------------------------------------------------------------   
Offset_0x02229A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Screw_Nut_Mappings, Obj_Map(A0) ; Offset_0x022426, $0004
                move.w  #$2500, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_18_To_ModifySpriteAttr_2P          ; Offset_0x02249C
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$0B, Obj_Height_2(A0)                           ; $0016
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$007F, D0
                lsl.w   #$03, D0
                move.w  D0, Obj_Control_Var_0A(A0)                       ; $0036
;-------------------------------------------------------------------------------                 
Offset_0x0222DC:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                lea     Obj_Control_Var_0C(A0), A4                       ; $0038
                moveq   #$03, D6
                bsr.s   Offset_0x022312
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                lea     Obj_Control_Var_10(A0), A4                       ; $003C
                moveq   #$04, D6
                bsr.s   Offset_0x022312
;-------------------------------------------------------------------------------                 
Offset_0x0222F4:
                andi.w  #$07FF, Obj_Y(A0)                                ; $000C
                move.w  #$002B, D1
                move.w  #$000C, D2
                move.w  #$000D, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_09_To_SolidObject                  ; Offset_0x0224A2
                bra     Jmp_13_To_MarkObjGone                  ; Offset_0x022490
Offset_0x022312:
                btst    D6, Obj_Status(A0)                               ; $0022
                bne.s   Offset_0x02231A
                clr.b   (A4)
Offset_0x02231A:
                moveq   #$00, D0
                move.b  (A4), D0
                move.w  Offset_0x022326(PC, D0), D0
                jmp     Offset_0x022326(PC, D0)     
;-------------------------------------------------------------------------------  
Offset_0x022326:
                dc.w    Offset_0x02232C-Offset_0x022326
                dc.w    Offset_0x02234C-Offset_0x022326
                dc.w    Offset_0x02236E-Offset_0x022326
;-------------------------------------------------------------------------------   
Offset_0x02232C:
                btst    D6, Obj_Status(A0)                               ; $0022
                bne.s   Offset_0x022334
                rts
Offset_0x022334:
                addq.b  #$02, (A4)
                move.b  #$00, $0001(A4)                       
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   Obj_X(A1), D0                                    ; $0008
                bcc.s   Offset_0x02234C
                move.b  #$01, $0001(A4)     
;-------------------------------------------------------------------------------                                    
Offset_0x02234C:
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                tst.b   $0001(A4)                               
                beq.s   Offset_0x02235E
                addi.w  #$000F, D0
Offset_0x02235E:
                cmpi.w  #$0010, D0
                bcc.s   Offset_0x02236C
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                addq.b  #$02, (A4)
Offset_0x02236C:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x02236E:
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                bcc.s   Offset_0x0223D4
                add.w   D0, Obj_Control_Var_08(A0)                       ; $0034
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                asr.w   #$03, D0
                move.w  D0, D1
                asr.w   #$01, D0
                andi.w  #$0003, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                neg.w   D1
                add.w   Obj_Control_Var_06(A0), D1                       ; $0032
                move.w  D1, Obj_Y(A0)                                    ; $000C
                sub.w   Obj_Control_Var_06(A0), D1                       ; $0032
                move.w  Obj_Control_Var_0A(A0), D0                       ; $0036
                cmp.w   D0, D1
                blt.s   Offset_0x0223D2
                move.w  D0, D1
                add.w   Obj_Control_Var_06(A0), D1                       ; $0032
                move.w  D1, Obj_Y(A0)                                    ; $000C
                lsl.w   #$03, D0
                neg.w   D0
                move.w  D0, Obj_Control_Var_08(A0)                       ; $0034
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bmi.s   Offset_0x0223CC
                clr.b   (A4)
                rts
Offset_0x0223CC:
                move.b  #$04, Obj_Routine(A0)                            ; $0024
Offset_0x0223D2:
                rts
Offset_0x0223D4:
                add.w   D0, Obj_Control_Var_08(A0)                       ; $0034
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                asr.w   #$03, D0
                move.w  D0, D1
                asr.w   #$01, D0
                andi.w  #$0003, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                neg.w   D1
                add.w   Obj_Control_Var_06(A0), D1                       ; $0032
                move.w  D1, Obj_Y(A0)                                    ; $000C
                rts
;-------------------------------------------------------------------------------                 
Offset_0x0223FC:
                bsr     Jmp_0B_To_SpeedToPos                   ; Offset_0x0224A8
                addi.w  #$0038, Obj_Speed_Y(A0)                          ; $0012
                bsr     Jmp_00_To_ObjHitFloor                  ; Offset_0x022496
                tst.w   D1
                bpl     Offset_0x022422
                add.w   D1, Obj_Y(A0)                                    ; $000C
                andi.w  #$07FF, Obj_Y(A0)                                ; $000C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x022422:
                bra     Offset_0x0222F4                                        
;-------------------------------------------------------------------------------
Screw_Nut_Mappings:                                            ; Offset_0x022426
                dc.w    Offset_0x02242E-Screw_Nut_Mappings
                dc.w    Offset_0x022440-Screw_Nut_Mappings
                dc.w    Offset_0x02245A-Screw_Nut_Mappings
                dc.w    Offset_0x022474-Screw_Nut_Mappings
Offset_0x02242E:
                dc.w    $0002
                dc.l    $F40E0000, $0000FFE0
                dc.l    $F40E000C, $00060000
Offset_0x022440:
                dc.w    $0003
                dc.l    $F40A0003, $0001FFE0
                dc.l    $F40E000C, $0006FFF8
                dc.l    $F4020809, $08040018
Offset_0x02245A:
                dc.w    $0003
                dc.l    $F4060024, $0012FFE0
                dc.l    $F40E002A, $0015FFF0
                dc.l    $F4060018, $000C0010
Offset_0x022474:
                dc.w    $0003
                dc.l    $F4020027, $0013FFE0
                dc.l    $F40E0018, $000CFFE8
                dc.l    $F40A082D, $08160008
;===============================================================================
; Objeto 0x69 - Porca usada nos parafusos na Metropolis
; <<<- 
;===============================================================================