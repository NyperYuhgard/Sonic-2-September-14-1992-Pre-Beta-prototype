;===============================================================================
; Object 0xA5 - Inimigo Lander na Chemical Plant
; ->>>        
;===============================================================================     
; Offset_0x032ED2:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x032EE0(PC, D0), D1
                jmp     Offset_0x032EE0(PC, D1)      
;------------------------------------------------------------------------------- 
Offset_0x032EE0:
                dc.w    Offset_0x032EE6-Offset_0x032EE0
                dc.w    Offset_0x032EF8-Offset_0x032EE0
                dc.w    Offset_0x032F4A-Offset_0x032EE0   
;-------------------------------------------------------------------------------  
Offset_0x032EE6:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$FFC0, Obj_Speed(A0)                            ; $0010
                move.w  #$0080, Obj_Timer(A0)                            ; $002A
                rts   
;------------------------------------------------------------------------------- 
Offset_0x032EF8:
                tst.b   Obj_Player_Status(A0)                            ; $002B
                beq.s   Offset_0x032F06
                subq.b  #$01, Obj_Player_Status(A0)                      ; $002B
                bra     Offset_0x032F14
Offset_0x032F06:
                bsr     Offset_0x030B18
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x032F36
Offset_0x032F14:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x032F24
                move.w  #$0080, Obj_Timer(A0)                            ; $002A
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x032F24:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Horizontal_Spiny_Animate_Data), A1    ; Offset_0x0330A0
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032F36:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$28, Obj_Player_Status(A0)                      ; $002B
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608 
;------------------------------------------------------------------------------- 
Offset_0x032F4A:
                subq.b  #$01, Obj_Player_Status(A0)                      ; $002B
                bmi.s   Offset_0x032F60
                cmpi.b  #$14, Obj_Player_Status(A0)                      ; $002B
                bne.s   Offset_0x032F5C
                bsr     Load_Spiny_Horizontal_Shot_Obj         ; Offset_0x03300A
Offset_0x032F5C:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032F60:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$40, Obj_Player_Status(A0)                      ; $002B
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;===============================================================================   
; Object 0xA5 - Inimigo Lander na Chemical Plant
; <<<-        
;===============================================================================