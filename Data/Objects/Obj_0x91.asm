;===============================================================================
; Objeto 0x91 -> Inimigo Chop Chop na Neo Green Hill
; ->>> 
;=============================================================================== 
; Offset_0x0311FE:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03120C(PC, D0), D1
                jmp     Offset_0x03120C(PC, D1)         
Offset_0x03120C:
                dc.w    Offset_0x031214-Offset_0x03120C
                dc.w    Offset_0x031236-Offset_0x03120C
                dc.w    Offset_0x031284-Offset_0x03120C
                dc.w    Offset_0x0312B8-Offset_0x03120C   
;-------------------------------------------------------------------------------
Offset_0x031214:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$0200, Obj_Timer(A0)                            ; $002A
                move.w  #$0050, Obj_Control_Var_00(A0)                   ; $002C
                moveq   #$40, D0
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x031230
                neg.w   D0
Offset_0x031230:
                move.w  D0, Obj_Speed(A0)                                ; $0010
                rts    
;-------------------------------------------------------------------------------
Offset_0x031236:
                subq.b  #$01, Obj_Control_Var_00(A0)                     ; $002C
                bne.s   Offset_0x031240
                bsr     Offset_0x0312CA
Offset_0x031240:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bpl.s   Offset_0x03125C
                move.w  #$0200, Obj_Timer(A0)                            ; $002A
                bchg    #00, Obj_Status(A0)                              ; $0022
                bchg    #00, Obj_Flags(A0)                               ; $0001
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x03125C:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bsr     Offset_0x030B18
                move.w  D2, D4
                move.w  D3, D5
                bsr     Offset_0x031304
                bne.s   Offset_0x031272
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x031272:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$10, Obj_Timer(A0)                              ; $002A
                clr.w   Obj_Speed(A0)                                    ; $0010
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;-------------------------------------------------------------------------------
Offset_0x031284:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x03128E
                bra     Offset_0x0312BC
Offset_0x03128E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Offset_0x030B18
                lsr.w   #$01, D0
                move.b  Offset_0x0312B4(PC, D0), Obj_Speed(A0)           ; $0010
                addi.w  #$0010, D3
                cmpi.w  #$0020, D3
                bcs.s   Offset_0x0312B0
                lsr.w   #$01, D1
                move.b  Offset_0x0312B6(PC, D1), $0013(A0)
Offset_0x0312B0:
                bra     Offset_0x0312BC   
;-------------------------------------------------------------------------------          
Offset_0x0312B4:
                dc.b    $FE, $02    
;-------------------------------------------------------------------------------
Offset_0x0312B6:                
                dc.b    $80, $80  
;------------------------------------------------------------------------------- 
Offset_0x0312B8:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
Offset_0x0312BC:
                lea     (Chop_Chop_Animate_Data), A1           ; Offset_0x031342
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0312CA:
                move.w  #$0050, Obj_Control_Var_00(A0)                   ; $002C
                bsr     Jmp_10_To_SingleObjectLoad             ; Offset_0x037602
                bne.s   Offset_0x031302
                move.b  #$0A, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                moveq   #$14, D0
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x0312F4
                neg.w   D0
Offset_0x0312F4:
                add.w   D0, Obj_X(A1)                                    ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addq.w  #$06, Obj_Y(A1)                                  ; $000C
Offset_0x031302:
                rts
Offset_0x031304:
                addi.w  #$0020, D3
                cmpi.w  #$0040, D3
                bcc.s   Offset_0x031330
                tst.w   D2
                bmi.s   Offset_0x03131C
                tst.w   Obj_Speed(A0)                                    ; $0010
                bpl.s   Offset_0x031330
                bra     Offset_0x031324
Offset_0x03131C:
                tst.w   Obj_Speed(A0)                                    ; $0010
                bmi.s   Offset_0x031330
                neg.w   D2
Offset_0x031324:
                cmpi.w  #$0020, D2
                bcs.s   Offset_0x031330
                cmpi.w  #$00A0, D2
                bcs.s   Offset_0x031334
Offset_0x031330:
                moveq   #$00, D2
                rts
Offset_0x031334:
                moveq   #$01, D2
                rts 
;-------------------------------------------------------------------------------                                              
Obj_0x91_Ptr:                                                  ; Offset_0x031338
                dc.l    Chop_Chop_Mappings                     ; Offset_0x031348
                dc.w    $253B
                dc.b    $04, $04, $10, $02 
;-------------------------------------------------------------------------------                      
Chop_Chop_Animate_Data:                                        ; Offset_0x031342
                dc.w    Offset_0x031344-Chop_Chop_Animate_Data
Offset_0x031344:
                dc.b    $04, $00, $01, $FF   
;-------------------------------------------------------------------------------        
Chop_Chop_Mappings:                                            ; Offset_0x031348
                dc.w    Offset_0x03134C-Chop_Chop_Mappings
                dc.w    Offset_0x031356-Chop_Chop_Mappings
Offset_0x03134C:
                dc.w    $0001
                dc.l    $F40E0000, $0000FFF0
Offset_0x031356:
                dc.w    $0001
                dc.l    $F40E000C, $0006FFF0                           
;===============================================================================
; Objeto 0x91 -> Inimigo Chop Chop na Neo Green Hill
; <<<- 
;===============================================================================