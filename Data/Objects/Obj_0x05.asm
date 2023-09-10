;===============================================================================
; Objeto 0x05 - Rabo do Miles
; ->>> 
;=============================================================================== 
; Offset_0x017D5E:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x017D6C(PC, D0), D1
                jmp     Offset_0x017D6C(PC, D1) 
;-------------------------------------------------------------------------------                
Offset_0x017D6C:                   
                dc.w    Offset_0x017D70-Offset_0x017D6C
                dc.w    Offset_0x017D98-Offset_0x017D6C   
;-------------------------------------------------------------------------------    
Offset_0x017D70:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Miles_Mappings, Obj_Map(A0)    ; Offset_0x0739E2, $0004
                move.w  #$07B0, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$02, Obj_Priority(A0)                           ; $0018
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Flags(A0)                              ; $0001
Offset_0x017D98:
                move.w  Obj_Player_Top_Solid(A0), A2                     ; $003E
                move.b  Obj_Angle(A2), Obj_Angle(A0)                     ; $0026
                move.b  Obj_Status(A2), Obj_Status(A0)                   ; $0022
                move.w  Obj_X(A2), Obj_X(A0)                             ; $0008
                move.w  Obj_Y(A2), Obj_Y(A0)                             ; $000C
                andi.w  #$7FFF, Obj_Art_VRAM(A0)                         ; $0002
                tst.w   Obj_Art_VRAM(A2)                                 ; $0002
                bpl.s   Offset_0x017DC6
                ori.w   #$8000, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x017DC6:
                moveq   #$00, D0
                move.b  Obj_Ani_Number(A2), D0                           ; $001C
                btst    #$05, Obj_Status(A2)                             ; $0022
                beq.s   Offset_0x017DD6
                moveq   #$04, D0
Offset_0x017DD6:
                cmp.b   Obj_P_Invunerblt_Time(A0), D0                    ; $0030
                beq.s   Offset_0x017DE6
                move.b  D0, Obj_P_Invunerblt_Time(A0)                    ; $0030
                move.b  Offset_0x017DFC(PC, D0), Obj_Ani_Number(A0)      ; $001C
Offset_0x017DE6:
                lea     (Offset_0x017E1E), A1
                bsr     Miles_Animate_A1                       ; Offset_0x017928
                bsr     Load_Miles_Tail_Dynamic_PLC            ; Offset_0x017CE2
                jsr     (DisplaySprite)                        ; Offset_0x0120DE
                rts     
;-------------------------------------------------------------------------------                        
Offset_0x017DFC:
                dc.b    $00, $00, $03, $03, $09, $01, $00, $02, $01, $07, $00, $00, $00, $08, $00, $00
                dc.b    $00, $00, $00, $00, $0A, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00  
;-------------------------------------------------------------------------------  
Offset_0x017E1E:
                dc.w    Offset_0x017E34-Offset_0x017E1E
                dc.w    Offset_0x017E37-Offset_0x017E1E
                dc.w    Offset_0x017E3E-Offset_0x017E1E
                dc.w    Offset_0x017E46-Offset_0x017E1E
                dc.w    Offset_0x017E4C-Offset_0x017E1E
                dc.w    Offset_0x017E52-Offset_0x017E1E
                dc.w    Offset_0x017E58-Offset_0x017E1E
                dc.w    Offset_0x017E5E-Offset_0x017E1E
                dc.w    Offset_0x017E64-Offset_0x017E1E
                dc.w    Offset_0x017E6A-Offset_0x017E1E
                dc.w    Offset_0x017E70-Offset_0x017E1E
Offset_0x017E34:
                dc.b    $20, $00, $FF
Offset_0x017E37:
                dc.b    $07, $09, $0A, $0B, $0C, $0D, $FF
Offset_0x017E3E:
                dc.b    $03, $09, $0A, $0B, $0C, $0D, $FD, $01
Offset_0x017E46:
                dc.b    $FC, $49, $4A, $4B, $4C, $FF
Offset_0x017E4C:
                dc.b    $03, $4D, $4E, $4F, $50, $FF
Offset_0x017E52:
                dc.b    $03, $51, $52, $53, $54, $FF
Offset_0x017E58:
                dc.b    $03, $55, $56, $57, $58, $FF
Offset_0x017E5E:
                dc.b    $02, $81, $82, $83, $84, $FF
Offset_0x017E64:
                dc.b    $02, $87, $88, $89, $8A, $FF
Offset_0x017E6A:
                dc.b    $09, $87, $88, $89, $8A, $FF
Offset_0x017E70:
                dc.b    $09, $81, $82, $83, $84, $FF                                                                                                                                                 
;===============================================================================
; Objeto 0x05 - Rabo do Miles
; <<<- 
;===============================================================================