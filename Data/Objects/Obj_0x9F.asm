;===============================================================================
; Objeto 0x9F - Inimigo Shellcracker na Metropolis
; ->>>
;===============================================================================
; Offset_0x03243A:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x032448(PC, D0), D1
                jmp     Offset_0x032448(PC, D1)
;-------------------------------------------------------------------------------  
Offset_0x032448:
                dc.w    Offset_0x032450-Offset_0x032448
                dc.w    Offset_0x03247C-Offset_0x032448
                dc.w    Offset_0x0324F2-Offset_0x032448
                dc.w    Offset_0x03252A-Offset_0x032448
;-------------------------------------------------------------------------------  
Offset_0x032450:
                bsr     Object_Settings                        ; Offset_0x030A30
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x032462
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x032462:
                move.w  #$FFC0, Obj_Speed(A0)                            ; $0010
                move.b  #$0C, Obj_Height_2(A0)                           ; $0016
                move.b  #$18, Obj_Width_2(A0)                            ; $0017
                move.w  #$0140, Obj_Timer(A0)                            ; $002A
                rts
;-------------------------------------------------------------------------------                 
Offset_0x03247C:
                bsr     Offset_0x030B18
                tst.w   D0
                beq.s   Offset_0x03248C
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x032496
Offset_0x03248C:
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x0324DC
Offset_0x032496:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                cmpi.w  #$FFF8, D1
                blt.s   Offset_0x0324C4
                cmpi.w  #$000C, D1
                bge.s   Offset_0x0324C4
                add.w   D1, Obj_Y(A0)                                    ; $000C
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0324C8
                lea     (Shellcracker_Animate_Data), A1        ; Offset_0x032732
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0324C4:
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x0324C8:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.w  #$003B, Obj_Timer(A0)                            ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0324DC:
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0008, Obj_Timer(A0)                            ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0324F2:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x032512
                bsr     Offset_0x030B18
                tst.w   D0
                beq.s   Offset_0x032508
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x032512
Offset_0x032508:
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x0324DC
Offset_0x032512:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03251C
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x03251C:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0140, Obj_Timer(A0)                            ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x03252A:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x03253C(PC, D0), D1
                jsr     Offset_0x03253C(PC, D1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------      
Offset_0x03253C:
                dc.w    Offset_0x032542-Offset_0x03253C
                dc.w    Offset_0x032558-Offset_0x03253C
                dc.w    Offset_0x03256C-Offset_0x03253C
;-------------------------------------------------------------------------------     
Offset_0x032542:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03254A
                rts
Offset_0x03254A:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                bra     Load_Sheelcracker_Craw_Obj             ; Offset_0x0326C0
Offset_0x032558:
                tst.b   Obj_Control_Var_00(A0)                           ; $002C
                bne.s   Offset_0x032560
                rts
Offset_0x032560:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0020, Obj_Timer(A0)                            ; $002A
                rts
Offset_0x03256C:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x032574
                rts
Offset_0x032574:
                clr.b   Obj_Routine_2(A0)                                ; $0025
                clr.b   Obj_Control_Var_00(A0)                           ; $002C
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0140, Obj_Timer(A0)                            ; $002A
                rts                                                   
;===============================================================================
; Objeto 0x9F - Inimigo Shellcracker na Metropolis
; <<<-
;===============================================================================