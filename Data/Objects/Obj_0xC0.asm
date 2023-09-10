;===============================================================================
; Objeto 0xC0 - Impulsionadores na Sky Fortress
; ->>> 
;===============================================================================
Offset_0x035DE0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035DEE(PC, D0), D1
                jmp     Offset_0x035DEE(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x035DEE:
                dc.w    Offset_0x035DF2-Offset_0x035DEE
                dc.w    Offset_0x035E12-Offset_0x035DEE
;------------------------------------------------------------------------------- 
Offset_0x035DF2:
                move.w  #$007E, D0
                bsr     Object_Settings_D0                     ; Offset_0x030A36
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$04, D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x035E0A
                neg.w   D0
Offset_0x035E0A:
                add.w   Obj_X(A0), D0                                    ; $0008
                move.w  D0, Obj_Control_Var_06(A0)                       ; $0032
;-------------------------------------------------------------------------------                
Offset_0x035E12:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x035E34(PC, D0), D1
                jsr     Offset_0x035E34(PC, D1)
                move.w  #$0010, D1
                move.w  #$0011, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_04_To_Platform_Object              ; Offset_0x037644
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;------------------------------------------------------------------------------- 
Offset_0x035E34:
                dc.w    Offset_0x035E3A-Offset_0x035E34
                dc.w    Offset_0x035EA8-Offset_0x035E34
                dc.w    Offset_0x035F24-Offset_0x035E34      
;-------------------------------------------------------------------------------
Offset_0x035E3A:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x035E82
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0C00, Obj_Speed(A0)                            ; $0010
                move.w  #$0080, Obj_Control_Var_04(A0)                   ; $0030
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x035E68
                neg.w   Obj_Speed(A0)                                    ; $0010
                neg.w   Obj_Control_Var_04(A0)                           ; $0030
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
Offset_0x035E68:
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x035E76
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x035E84
Offset_0x035E76:
                andi.b  #$10, D0
                beq.s   Offset_0x035E82
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr.s   Offset_0x035E84
Offset_0x035E82:
                rts
Offset_0x035E84:
                clr.w   Obj_Inertia(A1)                                  ; $0014
                clr.w   Obj_Speed(A1)                                    ; $0010
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                bclr    #$00, Obj_Status(A1)                             ; $0022
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x035EA6
                bset    #$00, Obj_Status(A1)                             ; $0022
Offset_0x035EA6:
                rts
;-------------------------------------------------------------------------------                
Offset_0x035EA8:
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                add.w   D0, Obj_Speed(A0)                                ; $0010
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                cmp.w   Obj_X(A0), D0                                    ; $0008
                bhi.s   Offset_0x035EF8
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x035EE2
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x035ED6
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x035E84
Offset_0x035ED6:
                andi.b  #$10, D0
                beq.s   Offset_0x035EE2
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr.s   Offset_0x035E84
Offset_0x035EE2:
                rts
;-------------------------------------------------------------------------------  
Offset_0x035EE4:
                move.w  Obj_Speed(A0), Obj_Speed(A1)              ; $0010, $0010
                move.w  #$FC00, Obj_Speed_Y(A1)                          ; $0012
                bset    #$01, Obj_Status(A1)                             ; $0022
                rts
;-------------------------------------------------------------------------------                 
Offset_0x035EF8:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  D0, Obj_X(A0)                                    ; $0008
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x035F24
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x035F18
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x035EE4
Offset_0x035F18:
                andi.b  #$10, D0
                beq.s   Offset_0x035F24
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr.s   Offset_0x035EE4
Offset_0x035F24:
                rts
;-------------------------------------------------------------------------------   
Obj_0xC0_Ptr:                                                  ; Offset_0x035F26
                dc.l    Speed_Booster_Mappings                 ; Offset_0x035F30
                dc.w    $A464
                dc.b    $04, $04, $10, $00
;------------------------------------------------------------------------------- 
Speed_Booster_Mappings:                                        ; Offset_0x035F30
                dc.w    Offset_0x035F32-Speed_Booster_Mappings
Offset_0x035F32:
                dc.w    $0002
                dc.l    $E9080000, $0000FFF0
                dc.l    $E1010003, $00010008                                
;===============================================================================
; Objeto 0xC0 - Impulsionadores na Sky Fortress
; <<<- 
;===============================================================================