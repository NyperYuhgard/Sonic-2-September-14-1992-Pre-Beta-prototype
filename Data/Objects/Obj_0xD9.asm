;===============================================================================
; Objeto 0xD9 - Objeto invísivel para se agarrar na Sky Fortress
; ->>>
;===============================================================================
; Offset_0x02741C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02742A(PC, D0), D1
                jmp     Offset_0x02742A(PC, D1)               
;-------------------------------------------------------------------------------
Offset_0x02742A:
                dc.w    Offset_0x02742E-Offset_0x02742A
                dc.w    Offset_0x027444-Offset_0x02742A
;-------------------------------------------------------------------------------    
Offset_0x02742E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
;-------------------------------------------------------------------------------                
Offset_0x027444:
                lea     Obj_Control_Var_04(A0), A2                       ; $0030
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  (Control_Ports_Buffer_Data).w, D0            ; $FFFFF604
                bsr.s   Offset_0x027462
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D0
                bsr.s   Offset_0x027462
                bra     Jmp_08_To_MarkObjGone_3                ; Offset_0x0274FC
Offset_0x027462:
                tst.b   (A2)
                beq.s   Offset_0x027490
                andi.b  #$70, D0
                beq     Offset_0x0274F8
                clr.b   Obj_Timer(A1)                                    ; $002A
                clr.b   (A2)
                move.b  #$12, Obj_Art_VRAM(A2)                           ; $0002
                andi.w  #$0F00, D0
                beq.s   Offset_0x027486
                move.b  #$3C, Obj_Art_VRAM(A2)                           ; $0002
Offset_0x027486:
                move.w  #$FD00, Obj_Speed_Y(A1)                          ; $0012
                bra     Offset_0x0274F8
Offset_0x027490:
                tst.b   Obj_Art_VRAM(A2)                                 ; $0002
                beq.s   Offset_0x02749E
                subq.b  #$01, Obj_Art_VRAM(A2)                           ; $0002
                bne     Offset_0x0274F8
Offset_0x02749E:
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                addi.w  #$0018, D0
                cmpi.w  #$0030, D0
                bcc     Offset_0x0274F8
                move.w  Obj_Y(A1), D1                                    ; $000C
                sub.w   Obj_Y(A0), D1                                    ; $000C
                cmpi.w  #$0010, D1
                bcc     Offset_0x0274F8
                tst.b   Obj_Timer(A1)                                    ; $002A
                bmi.s   Offset_0x0274F8
                cmpi.b  #$06, Obj_Routine(A1)                            ; $0024
                bcc.s   Offset_0x0274F8
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x0274F8
                clr.w   Obj_Speed(A1)                                    ; $0010
                clr.w   Obj_Speed_Y(A1)                                  ; $0012
                clr.w   Obj_Inertia(A1)                                  ; $0014
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$14, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$01, Obj_Timer(A1)                              ; $002A
                move.b  #$01, (A2)
Offset_0x0274F8:
                rts                                                                                                            
;===============================================================================
; Objeto 0xD9 - Objeto invísivel para se agarrar na Sky Fortress
; <<<-
;===============================================================================