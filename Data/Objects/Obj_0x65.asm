;===============================================================================
; Objeto 0x65 - Plataformas sobre engrenagens na Metropolis
; ->>> 
;=============================================================================== 
; Offset_0x0214EC:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0214FA(PC, D0), D1
                jmp     Offset_0x0214FA(PC, D1)            
;-------------------------------------------------------------------------------
Offset_0x0214FA:
                dc.w    Offset_0x021512-Offset_0x0214FA
                dc.w    Offset_0x021628-Offset_0x0214FA
                dc.w    Offset_0x0218A0-Offset_0x0214FA
                dc.w    Offset_0x0218BE-Offset_0x0214FA   
;-------------------------------------------------------------------------------     
Offset_0x021502:
                dc.b    $40, $0C, $80, $01, $20, $0C, $40, $03
                dc.b    $10, $10, $20, $00, $40, $0C, $80, $07         
;-------------------------------------------------------------------------------
Offset_0x021512:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Mz_Platform_Mappings, Obj_Map(A0) ; Offset_0x0218C4, $0004
                move.w  #$6000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_15_To_ModifySpriteAttr_2P          ; Offset_0x021948
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsr.w   #$02, D0
                andi.w  #$001C, D0
                lea     Offset_0x021502(PC, D0), A3
                move.b  (A3)+, Obj_Width(A0)                             ; $0019
                move.b  (A3)+, Obj_Height_2(A0)                          ; $0016
                lsr.w   #$02, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                cmpi.b  #$01, D0
                bne.s   Offset_0x02155E
                bset    #$07, Obj_Status(A0)                             ; $0022
Offset_0x02155E:
                cmpi.b  #$02, D0
                bne.s   Offset_0x02157A
                addq.b  #$04, Obj_Routine(A0)                            ; $0024
                move.l  #Mini_Gear_Mappings, Obj_Map(A0) ; Offset_0x021900, $0004
                move.w  #$655F, Obj_Art_VRAM(A0)                         ; $0002
                bra     Offset_0x0218BE
Offset_0x02157A:
                move.w  Obj_X(A0), Obj_Control_Var_08(A0)         ; $0008, $0034
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
                moveq   #$00, D0
                move.b  (A3)+, D0
                move.w  D0, Obj_Control_Var_10(A0)                       ; $003C
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl     Offset_0x021622
                andi.b  #$0F, D0
                move.b  D0, Obj_Control_Var_12(A0)                       ; $003E
                move.b  (A3), Obj_Subtype(A0)                            ; $0028
                cmpi.b  #$07, (A3)
                bne.s   Offset_0x0215B0
                move.w  Obj_Control_Var_10(A0), Obj_Control_Var_0E(A0); $003A, $003C
Offset_0x0215B0:
                bsr     Jmp_08_To_SingleObjectLoad_2           ; Offset_0x021942
                bne.s   Offset_0x021610
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                addq.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$FFB4, Obj_X(A1)                                ; $0008
                addi.w  #$0014, Obj_Y(A1)                                ; $000C
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0215EC
                subi.w  #$FFE8, Obj_X(A1)                                ; $0008
                bset    #$00, Obj_Flags(A1)                              ; $0001
Offset_0x0215EC:
                move.l  #Mini_Gear_Mappings, Obj_Map(A1) ; Offset_0x021900, $0004
                move.w  #$655F, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
Offset_0x021610:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x021622
                bclr    #$07, $02(A2, D0)
Offset_0x021622:
                andi.b  #$0F, Obj_Subtype(A0)                            ; $0028
;-------------------------------------------------------------------------------                
Offset_0x021628:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                add.w   D0, D0
                move.w  Offset_0x021686(PC, D0), D1
                jsr     Offset_0x021686(PC, D1)
                move.w  (A7)+, D4
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                bsr     Jmp_07_To_SolidObject                  ; Offset_0x02194E
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x02166E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x02166E:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x021680
                bclr    #$07, $02(A2, D0)
Offset_0x021680:
                jmp     (DeleteObject)                         ; Offset_0x0120D0    
;-------------------------------------------------------------------------------     
Offset_0x021686:
                dc.w    Offset_0x021696-Offset_0x021686
                dc.w    Offset_0x0216AC-Offset_0x021686
                dc.w    Offset_0x021738-Offset_0x021686
                dc.w    Offset_0x021794-Offset_0x021686
                dc.w    Offset_0x021838-Offset_0x021686
                dc.w    Offset_0x021846-Offset_0x021686
                dc.w    Offset_0x021698-Offset_0x021686
                dc.w    Offset_0x021718-Offset_0x021686
;-------------------------------------------------------------------------------  
Offset_0x021696:
                rts
;-------------------------------------------------------------------------------                
Offset_0x021698:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                bne.s   Offset_0x0216AA
                subq.w  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bne.s   Offset_0x0216D8
                move.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x0216AA:
                bra.s   Offset_0x0216CA
;-------------------------------------------------------------------------------                
Offset_0x0216AC:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                bne.s   Offset_0x0216CA
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  Obj_Control_Var_12(A0), D0                       ; $003E
                btst    #$00, $00(A2, D0)
                beq.s   Offset_0x0216D8
                move.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x0216CA:
                move.w  Obj_Control_Var_10(A0), D0                       ; $003C
                cmp.w   Obj_Control_Var_0E(A0), D0                       ; $003A
                beq.s   Offset_0x0216F6
                addq.w  #$02, Obj_Control_Var_0E(A0)                     ; $003A
Offset_0x0216D8:
                move.w  Obj_Control_Var_0E(A0), D0                       ; $003A
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0216EA
                neg.w   D0
                addi.w  #$0080, D0
Offset_0x0216EA:
                move.w  Obj_Control_Var_08(A0), D1                       ; $0034
                sub.w   D0, D1
                move.w  D1, Obj_X(A0)                                    ; $0008
                rts
Offset_0x0216F6:
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
                move.w  #$00B4, Obj_Control_Var_0A(A0)                   ; $0036
                clr.b   Obj_Control_Var_0C(A0)                           ; $0038
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x0216D8
                bset    #$00, $02(A2, D0)
                bra.s   Offset_0x0216D8
;-------------------------------------------------------------------------------                
Offset_0x021718:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                bne.s   Offset_0x021736
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  Obj_Control_Var_12(A0), D0                       ; $003E
                btst    #$00, $00(A2, D0)
                beq.s   Offset_0x021754
                move.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x021736:
                bra.s   Offset_0x02174A
;-------------------------------------------------------------------------------                
Offset_0x021738:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                bne.s   Offset_0x02174A
                subq.w  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bne.s   Offset_0x021754
                move.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x02174A:
                tst.w   Obj_Control_Var_0E(A0)                           ; $003A
                beq.s   Offset_0x021772
                subq.w  #$02, Obj_Control_Var_0E(A0)                     ; $003A
Offset_0x021754:
                move.w  Obj_Control_Var_0E(A0), D0                       ; $003A
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x021766
                neg.w   D0
                addi.w  #$0080, D0
Offset_0x021766:
                move.w  Obj_Control_Var_08(A0), D1                       ; $0034
                sub.w   D0, D1
                move.w  D1, Obj_X(A0)                                    ; $0008
                rts
Offset_0x021772:
                subq.b  #$01, Obj_Subtype(A0)                            ; $0028
                move.w  #$00B4, Obj_Control_Var_0A(A0)                   ; $0036
                clr.b   Obj_Control_Var_0C(A0)                           ; $0038
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x021754
                bclr    #$00, $02(A2, D0)
                bra.s   Offset_0x021754
;-------------------------------------------------------------------------------                
Offset_0x021794:
                move.w  Obj_Control_Var_08(A0), D4                       ; $0034
                move.w  D4, D5
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0217AC
                subi.w  #$0020, D4
                addi.w  #$0060, D5
                bra.s   Offset_0x0217B4
Offset_0x0217AC:
                subi.w  #$00A0, D4
                subi.w  #$0020, D5
Offset_0x0217B4:
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                subi.w  #$0010, D2
                addi.w  #$0040, D3
                moveq   #$00, D1
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                cmp.w   D4, D0
                bcs.s   Offset_0x0217DE
                cmp.w   D5, D0
                bcc.s   Offset_0x0217DE
                move.w  (Player_Position_Y).w, D0                    ; $FFFFB00C
                cmp.w   D2, D0
                bcs.s   Offset_0x0217DE
                cmp.w   D3, D0
                bcc.s   Offset_0x0217DE
                moveq   #$01, D1
Offset_0x0217DE:
                move.w  ($FFFFB048).w, D0
                cmp.w   D4, D0
                bcs.s   Offset_0x0217F8
                cmp.w   D5, D0
                bcc.s   Offset_0x0217F8
                move.w  ($FFFFB04C).w, D0
                cmp.w   D2, D0
                bcs.s   Offset_0x0217F8
                cmp.w   D3, D0
                bcc.s   Offset_0x0217F8
                moveq   #$01, D1
Offset_0x0217F8:
                tst.b   D1
                beq.s   Offset_0x02180E
                move.w  Obj_Control_Var_10(A0), D0                       ; $003C
                cmp.w   Obj_Control_Var_0E(A0), D0                       ; $003A
                beq.s   Offset_0x021836
                addi.w  #$0010, Obj_Control_Var_0E(A0)                   ; $003A
                bra.s   Offset_0x02181A
Offset_0x02180E:
                tst.w   Obj_Control_Var_0E(A0)                           ; $003A
                beq.s   Offset_0x02181A
                subi.w  #$0010, Obj_Control_Var_0E(A0)                   ; $003A
Offset_0x02181A:
                move.w  Obj_Control_Var_0E(A0), D0                       ; $003A
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02182C
                neg.w   D0
                addi.w  #$0040, D0
Offset_0x02182C:
                move.w  Obj_Control_Var_08(A0), D1                       ; $0034
                sub.w   D0, D1
                move.w  D1, Obj_X(A0)                                    ; $0008
Offset_0x021836:
                rts
;-------------------------------------------------------------------------------                
Offset_0x021838:
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x021844
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
Offset_0x021844:
                rts
;-------------------------------------------------------------------------------                
Offset_0x021846:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                bne.s   Offset_0x021880
                addq.w  #$02, Obj_X(A0)                                  ; $0008
                cmpi.b  #$05, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x021870
                cmpi.w  #$1CC0, Obj_X(A0)                                ; $0008
                beq.s   Offset_0x021868
                cmpi.w  #$2940, Obj_X(A0)                                ; $0008
                bne.s   Offset_0x021892
Offset_0x021868:
                move.b  #$00, Obj_Subtype(A0)                            ; $0028
                bra.s   Offset_0x021892
Offset_0x021870:
                cmpi.w  #$1BC0, Obj_X(A0)                                ; $0008
                bne.s   Offset_0x021892
                move.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bra.s   Offset_0x021892
Offset_0x021880:
                subq.w  #$02, Obj_X(A0)                                  ; $0008
                cmpi.w  #$1880, Obj_X(A0)                                ; $0008
                bne.s   Offset_0x021892
                move.b  #$00, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x021892:
                move.w  Obj_X(A0), Obj_Control_Var_08(A0)         ; $0008, $0034
                move.w  Obj_X(A0), ($FFFFF7B0).w                         ; $0008
                rts
;-------------------------------------------------------------------------------                
Offset_0x0218A0:
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.w  Obj_Control_Var_0E(A1), D0                       ; $003A
Offset_0x0218A8:                
                andi.w  #$0007, D0
                move.b  Offset_0x0218B6(PC, D0), Obj_Map_Id(A0)          ; $001A
                bra     Jmp_11_To_MarkObjGone                  ; Offset_0x02193C     
;-------------------------------------------------------------------------------
Offset_0x0218B6:
                dc.b    $00, $00, $02, $02, $02, $01, $01, $01
;-------------------------------------------------------------------------------   
Offset_0x0218BE:
                move.w  ($FFFFF7B0).w, D0
                bra.s   Offset_0x0218A8  
;-------------------------------------------------------------------------------   
Mz_Platform_Mappings:                                          ; Offset_0x0218C4
                dc.w    Automatic_Platform_Mappings-Mz_Platform_Mappings ; Offset_0x0218CC
                dc.w    Platform_Over_Gear_Mappings-Mz_Platform_Mappings ; Offset_0x0218EE
                dc.w    Automatic_Platform_Mappings-Mz_Platform_Mappings ; Offset_0x0218CC
                dc.w    Automatic_Platform_Mappings-Mz_Platform_Mappings ; Offset_0x0218CC
Automatic_Platform_Mappings:                                   ; Offset_0x0218CC
                dc.w    $0004
                dc.l    $F40E004B, $0025FFC0
                dc.l    $F40E004B, $0025FFE0
                dc.l    $F40E004B, $00250000
                dc.l    $F40E004B, $00250020
Platform_Over_Gear_Mappings:                                   ; Offset_0x0218EE
                dc.w    $0002
                dc.l    $F40E0039, $001CFFE0
                dc.l    $F40E0839, $081C0000  
;-------------------------------------------------------------------------------
Mini_Gear_Mappings:                                            ; Offset_0x021900
                dc.w    Offset_0x021906-Mini_Gear_Mappings
                dc.w    Offset_0x021918-Mini_Gear_Mappings
                dc.w    Offset_0x02192A-Mini_Gear_Mappings   
Offset_0x021906:
                dc.w    $0002
                dc.l    $F4060000, $0000FFF0
                dc.l    $F4060800, $08000000
Offset_0x021918:
                dc.w    $0002
                dc.l    $F4060006, $0003FFF0
                dc.l    $F4061806, $18030000
Offset_0x02192A:
                dc.w    $0002
                dc.l    $F4061006, $1003FFF0
                dc.l    $F4060806, $08030000                                                                                                                                                                
;===============================================================================
; Objeto 0x65 - Plataformas sobre engrenagens na Metropolis
; <<<- 
;===============================================================================