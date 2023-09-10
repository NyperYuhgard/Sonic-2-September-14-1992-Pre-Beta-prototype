;===============================================================================
; Objeto 0xA1 - Inimigo Slicer na Metropolis
; ->>> 
;===============================================================================
; Offset_0x0327E2:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0327F0(PC, D0), D1
                jmp     Offset_0x0327F0(PC, D1)       
;-------------------------------------------------------------------------------  
Offset_0x0327F0:
                dc.w    Offset_0x0327FA-Offset_0x0327F0
                dc.w    Offset_0x03281E-Offset_0x0327F0
                dc.w    Offset_0x032884-Offset_0x0327F0
                dc.w    Offset_0x0328A0-Offset_0x0327F0
                dc.w    Offset_0x0328BC-Offset_0x0327F0
;-------------------------------------------------------------------------------  
Offset_0x0327FA:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$FFC0, D0
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x03280C
                neg.w   D0
Offset_0x03280C:
                move.w  D0, Obj_Speed(A0)                                ; $0010
                move.b  #$10, Obj_Height_2(A0)                           ; $0016
                move.b  #$10, Obj_Width_2(A0)                            ; $0017
                rts
;-------------------------------------------------------------------------------                 
Offset_0x03281E:
                bsr     Offset_0x030B18
                tst.w   D0
                bne.s   Offset_0x03283A
                addi.w  #$0080, D2
                cmpi.w  #$0100, D2
                bcc.s   Offset_0x03283A
                addi.w  #$0040, D3
                cmpi.w  #$0080, D3
                bcs.s   Offset_0x032870
Offset_0x03283A:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                cmpi.w  #$FFF8, D1
                blt.s   Offset_0x032862
                cmpi.w  #$000C, D1
                bge.s   Offset_0x032862
                add.w   D1, Obj_Y(A0)                                    ; $000C
                lea     (Slicer_Animate_Data), A1              ; Offset_0x0329BC
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032862:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$3B, Obj_Timer(A0)                              ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032870:
                addq.b  #$04, Obj_Routine(A0)                            ; $0024
                move.b  #$03, Obj_Map_Id(A0)                             ; $001A
                move.b  #$08, Obj_Timer(A0)                              ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x032884:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03288E
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x03288E:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Status(A0)                              ; $0022
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0328A0:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0328AA
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0328AA:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                bsr     Load_Slicer_Pincers_Obj                ; Offset_0x03296A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0328BC:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608                                                           
;===============================================================================
; Objeto 0xA1 - Inimigo Slicer na Metropolis
; <<<- 
;===============================================================================