;===============================================================================
; Objeto 0x8E -> Grounder na Neo Green Hill
; ->>>        
;===============================================================================     
Offset_0x030EC8:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x030ED6(PC, D0), D1
                jmp     Offset_0x030ED6(PC, D1)   
;-------------------------------------------------------------------------------            
Offset_0x030ED6:
                dc.w    Offset_0x030EE2-Offset_0x030ED6
                dc.w    Offset_0x030F2E-Offset_0x030ED6
                dc.w    Offset_0x030F52-Offset_0x030ED6
                dc.w    Offset_0x030F60-Offset_0x030ED6
                dc.w    Offset_0x030F86-Offset_0x030ED6
                dc.w    Offset_0x030FBC-Offset_0x030ED6   
;-------------------------------------------------------------------------------            
Offset_0x030EE2:
                bsr     Object_Settings                        ; Offset_0x030A30
                bclr    #$01, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x030EFA
                bclr    #$01, Obj_Status(A0)                             ; $0022
                andi.w  #$7FFF, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x030EFA:
                move.b  #$14, Obj_Height_2(A0)                           ; $0016
                move.b  #$10, Obj_Width_2(A0)                            ; $0017
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x030F1A
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
Offset_0x030F1A:
                move.b  Obj_Id(A0), D0                                   ; $0000
                subi.b  #$8D, D0
                beq     Offset_0x0310B6
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                rts   
;-------------------------------------------------------------------------------
Offset_0x030F2E:
                bsr     Offset_0x030B18
                tst.w   D2
                bpl.s   Offset_0x030F38
                neg.w   D2
Offset_0x030F38:
                cmpi.w  #$0060, D2
                bls.s   Offset_0x030F42
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x030F42:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                st      Obj_Player_Status(A0)                            ; $002B
                bsr     Offset_0x03107E
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608        
;-------------------------------------------------------------------------------
Offset_0x030F52:
                lea     (Grounder_AnimateData_01), A1          ; Offset_0x03113C
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608      
;-------------------------------------------------------------------------------
Offset_0x030F60:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Offset_0x030B18
                move.w  Offset_0x030F82(PC, D0), Obj_Speed(A0)           ; $0010
                bclr    #$00, Obj_Status(A0)                             ; $0022
                tst.w   D0
                beq.s   Offset_0x030F7E
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x030F7E:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------      
Offset_0x030F82:
                dc.w    $FF00, $0100    
;-------------------------------------------------------------------------------    
Offset_0x030F86:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                cmpi.w  #$FFFF, D1
                blt.s   Offset_0x030FAE
                cmpi.w  #$000C, D1
                bge.s   Offset_0x030FAE
                add.w   D1, Obj_Y(A0)                                    ; $000C
                lea     (Grounder_AnimateData), A1             ; Offset_0x031134
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x030FAE:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$3B, Obj_Timer(A0)                              ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;-------------------------------------------------------------------------------
Offset_0x030FBC:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x030FC6
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x030FC6:
                move.b  #$08, Obj_Routine(A0)                            ; $0024
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Status(A0)                              ; $0022
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;===============================================================================   
; Objeto 0x8E -> Grounder na Neo Green Hill
; <<<-        
;===============================================================================