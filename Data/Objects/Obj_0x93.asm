;===============================================================================
; Objeto 0x93 - Broca lançada pelo inimigo Spiker na Hill Top
; ->>>
;===============================================================================
; Offset_0x031434:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x031442(PC, D0), D1
                jmp     Offset_0x031442(PC, D1)            
;-------------------------------------------------------------------------------  
Offset_0x031442:
                dc.w    Offset_0x031446-Offset_0x031442
                dc.w    Offset_0x031476-Offset_0x031442
;-------------------------------------------------------------------------------  
Offset_0x031446:
                bsr     Object_Settings                        ; Offset_0x030A30
                ori.b   #$80, Obj_Flags(A0)                              ; $0001
                ori.b   #$80, Obj_Col_Flags(A0)                          ; $0020
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                move.b  Obj_Flags(A1), D0                                ; $0001
                andi.b  #$03, D0
                or.b    D0, Obj_Flags(A0)                                ; $0001
                moveq   #$02, D1
                btst    #$01, D0
                bne.s   Offset_0x031470
                neg.w   D1
Offset_0x031470:
                move.b  D1, Obj_Speed_Y(A0)                              ; $0012
                rts
;-------------------------------------------------------------------------------                
Offset_0x031476:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bchg    #00, Obj_Flags(A0)                               ; $0001
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------
Spiker_Sub: ; Usado pelo objeto 0x92 - Spiker                  ; Offset_0x03148C
                tst.b   Obj_Player_Status(A0)                            ; $002B
                bne.s   Offset_0x0314B0
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x0314B0
                bsr     Offset_0x030B18
                addi.w  #$0020, D2
                cmpi.w  #$0040, D2
                bcc.s   Offset_0x0314B0
                addi.w  #$0080, D3
                cmpi.w  #$0100, D3
                bcs.s   Offset_0x0314B4
Offset_0x0314B0:
                moveq   #$00, D0
                rts
Offset_0x0314B4:
                move.b  Obj_Routine(A0), Obj_Control_Var_03(A0)   ; $0024, $002F
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                move.b  #$10, Obj_Control_Var_02(A0)                     ; $002E
                moveq   #$01, D0
                rts       
;-------------------------------------------------------------------------------  
Obj_0x92_Ptr:                                                  ; Offset_0x0314CA
                dc.l    Spiker_Mappings                        ; Offset_0x0314E0
                dc.w    $0000
                dc.b    $04, $04, $10, $12     
;-------------------------------------------------------------------------------
Spiker_Animate_Data:                                           ; Offset_0x0314D4
                dc.w    Offset_0x0314D8-Spiker_Animate_Data
                dc.w    Offset_0x0314DC-Spiker_Animate_Data
Offset_0x0314D8:
                dc.b    $09, $00, $01, $FF
Offset_0x0314DC:
                dc.b    $09, $02, $03, $FF  
;------------------------------------------------------------------------------- 
Spiker_Mappings:                                               ; Offset_0x0314E0
                dc.w    Offset_0x0314EA-Spiker_Mappings
                dc.w    Offset_0x031504-Spiker_Mappings
                dc.w    Offset_0x03151E-Spiker_Mappings
                dc.w    Offset_0x031530-Spiker_Mappings
                dc.w    Offset_0x031542-Spiker_Mappings
Offset_0x0314EA:
                dc.w    $0003
                dc.l    $08090520, $0290FFF4
                dc.l    $E807252C, $2296FFF8
                dc.l    $000503DE, $01EFFFF8
Offset_0x031504:
                dc.w    $0003
                dc.l    $08090526, $0293FFF4
                dc.l    $E807252C, $2296FFF8
                dc.l    $000503DE, $01EFFFF8
Offset_0x03151E:
                dc.w    $0002
                dc.l    $08090520, $0290FFF4
                dc.l    $000503DE, $01EFFFF8
Offset_0x031530:
                dc.w    $0002
                dc.l    $08090526, $0293FFF4
                dc.l    $000503DE, $01EFFFF8
Offset_0x031542:
                dc.w    $0001
                dc.l    $EC07252C, $2296FFF8                                                         
;===============================================================================
; Objeto 0x93 - Broca lançada pelo inimigo Spiker na Hill Top
; <<<-
;===============================================================================