;===============================================================================
; Objeto 0x92 - Inimigo Spiker na Hill Top
; ->>>
;===============================================================================
; Offset_0x031360:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03136E(PC, D0), D1
                jmp     Offset_0x03136E(PC, D1)       
;-------------------------------------------------------------------------------  
Offset_0x03136E:
                dc.w    Offset_0x031376-Offset_0x03136E
                dc.w    Offset_0x03138E-Offset_0x03136E
                dc.w    Offset_0x0313B8-Offset_0x03136E
                dc.w    Offset_0x0313DE-Offset_0x03136E
;-------------------------------------------------------------------------------    
Offset_0x031376:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$40, Obj_Timer(A0)                              ; $002A
                move.w  #$0080, Obj_Speed(A0)                            ; $0010
                bchg    #00, Obj_Status(A0)                              ; $0022
                rts
;-------------------------------------------------------------------------------                  
Offset_0x03138E:
                bsr     Spiker_Sub                             ; Offset_0x03148C
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0313AA
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Spiker_Animate_Data), A1              ; Offset_0x0314D4
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0313AA:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$10, Obj_Timer(A0)                              ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                  
Offset_0x0313B8:
                bsr     Spiker_Sub                             ; Offset_0x03148C
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0313C6
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0313C6:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$40, Obj_Timer(A0)                              ; $002A
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Status(A0)                              ; $0022
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                  
Offset_0x0313DE:
                move.b  Obj_Control_Var_02(A0), D0                       ; $002E
                cmpi.b  #$08, D0
                beq.s   Offset_0x0313F2
                subq.b  #$01, D0
                move.b  D0, Obj_Control_Var_02(A0)                       ; $002E
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0313F2:
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x03142A
                st      Obj_Player_Status(A0)                            ; $002B
                move.b  #$93, Obj_Id(A1)                                 ; $0000
                move.b  Obj_Subtype(A0), Obj_Subtype(A1)          ; $0028, $0028
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$04, Obj_Map_Id(A1)                             ; $001A
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
Offset_0x03142A:
                move.b  Obj_Control_Var_03(A0), Obj_Routine(A0)   ; $0024, $002F
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608                                                                                                                
;===============================================================================
; Objeto 0x92 - Inimigo Spiker na Hill Top
; <<<-
;===============================================================================