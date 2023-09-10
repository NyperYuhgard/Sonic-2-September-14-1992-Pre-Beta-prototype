;===============================================================================
; Objeto 0xD5 - Elevadores na Casino Night
; ->>> 
;===============================================================================
; Offset_0x0264E0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0264EE(PC, D0), D1
                jmp     Offset_0x0264EE(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x0264EE:
                dc.w    Offset_0x0264F2-Offset_0x0264EE
                dc.w    Offset_0x026540-Offset_0x0264EE         
;-------------------------------------------------------------------------------
Offset_0x0264F2:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #CNz_Elevator_Mappings, Obj_Map(A0) ; Offset_0x026618, $0004
                move.w  #$4384, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_2F_To_ModifySpriteAttr_2P          ; Offset_0x026632
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.w  Obj_Y(A0), Obj_Control_Var_06(A0)         ; $000C, $0032
                move.w  #$8000, $000E(A0)
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$02, D0
                sub.w   D0, Obj_Y(A0)                                    ; $000C
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x026540
                add.w   D0, D0
                add.w   D0, Obj_Y(A0)                                    ; $000C 
;-------------------------------------------------------------------------------
Offset_0x026540:
                bsr     Jmp_10_To_SpeedToPos                   ; Offset_0x02663E
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                move.w  Offset_0x02656C(PC, D0), D1
                jsr     Offset_0x02656C(PC, D1)
                cmpi.w  #$0006, Obj_Control_Var_08(A0)                   ; $0034
                bcc.s   Offset_0x026568
                move.w  #$0010, D1
                move.w  #$0009, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_00_To_Platform_Elevator            ; Offset_0x026638
Offset_0x026568:
                bra     Jmp_1A_To_MarkObjGone                  ; Offset_0x02662C   
;-------------------------------------------------------------------------------
Offset_0x02656C:
                dc.w    Offset_0x026574-Offset_0x02656C
                dc.w    Offset_0x02658E-Offset_0x02656C
                dc.w    Offset_0x0265C6-Offset_0x02656C
                dc.w    Offset_0x0265E0-Offset_0x02656C     
;-------------------------------------------------------------------------------
Offset_0x026574:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.w  #$0018, D0
                beq.s   Offset_0x02658C
                move.w  #$00D6, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addq.w  #$02, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x02658C:
                rts  
;-------------------------------------------------------------------------------
Offset_0x02658E:
                moveq   #$08, D1
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcc.s   Offset_0x02659C
                neg.w   D1
Offset_0x02659C:
                add.w   D1, Obj_Speed_Y(A0)                              ; $0012
                bne.s   Offset_0x0265C4
                addq.w  #$02, Obj_Control_Var_08(A0)                     ; $0034
                move.w  D0, Obj_Y(A0)                                    ; $000C
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$02, D0
                sub.w   D0, Obj_Y(A0)                                    ; $000C
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x0265C4
                add.w   D0, D0
                add.w   D0, Obj_Y(A0)                                    ; $000C
Offset_0x0265C4:
                rts    
;-------------------------------------------------------------------------------
Offset_0x0265C6:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.w  #$0018, D0
                bne.s   Offset_0x0265DE
                move.w  #$00D6, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addq.w  #$02, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x0265DE:
                rts      
;-------------------------------------------------------------------------------
Offset_0x0265E0:
                moveq   #$08, D1
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcc.s   Offset_0x0265EE
                neg.w   D1
Offset_0x0265EE:
                add.w   D1, Obj_Speed_Y(A0)                              ; $0012
                bne.s   Offset_0x026616
                clr.w   Obj_Control_Var_08(A0)                           ; $0034
                move.w  D0, Obj_Y(A0)                                    ; $000C
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$02, D0
                sub.w   D0, Obj_Y(A0)                                    ; $000C
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x026616
                add.w   D0, D0
                add.w   D0, Obj_Y(A0)                                    ; $000C
Offset_0x026616:
                rts    
;-------------------------------------------------------------------------------
CNz_Elevator_Mappings:                                         ; Offset_0x026618
                dc.w    Offset_0x02661A-CNz_Elevator_Mappings
Offset_0x02661A:
                dc.w    $0002
                dc.l    $F8050000, $0000FFF0
                dc.l    $F8050800, $08000000
;===============================================================================
; Objeto 0xD5 - Elevadores na Casino Night
; <<<- 
;===============================================================================