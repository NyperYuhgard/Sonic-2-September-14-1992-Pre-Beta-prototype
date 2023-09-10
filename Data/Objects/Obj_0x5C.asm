;===============================================================================
; Objeto 0x5C - Inimigo Masher (Piranha) na Green Hill
; ->>> 
;===============================================================================
; Offset_0x028C28:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x028C3A(PC, D0), D1
                jsr     Offset_0x028C3A(PC, D1)
                bra     Jmp_23_To_MarkObjGone                  ; Offset_0x028D10   
;------------------------------------------------------------------------------- 
Offset_0x028C3A:
                dc.w    Offset_0x028C3E-Offset_0x028C3A
                dc.w    Offset_0x028C78-Offset_0x028C3A
;-------------------------------------------------------------------------------   
Offset_0x028C3E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Masher_Mappings, Obj_Map(A0)   ; Offset_0x028CD6, $0004
                move.w  #$0414, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_34_To_ModifySpriteAttr_2P          ; Offset_0x028D1C
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$09, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.w  #$FC00, Obj_Speed_Y(A0)                          ; $0012
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
;-------------------------------------------------------------------------------                 
Offset_0x028C78:                
                lea     (Masher_Animate_Data), A1              ; Offset_0x028CC4
                bsr     Jmp_11_To_AnimateSprite                ; Offset_0x028D16
                bsr     Jmp_16_To_SpeedToPos                   ; Offset_0x028D22
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcc.s   Offset_0x028CA0
                move.w  D0, Obj_Y(A0)                                    ; $000C
                move.w  #$FB00, Obj_Speed_Y(A0)                          ; $0012
Offset_0x028CA0:
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                subi.w  #$00C0, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcc.s   Offset_0x028CC2
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x028CC2
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
Offset_0x028CC2:
                rts    
;------------------------------------------------------------------------------- 
Masher_Animate_Data:                                           ; Offset_0x028CC4
                dc.w    Offset_0x028CCA-Masher_Animate_Data
                dc.w    Offset_0x028CCE-Masher_Animate_Data
                dc.w    Offset_0x028CD2-Masher_Animate_Data
Offset_0x028CCA:
                dc.b    $07, $00, $01, $FF
Offset_0x028CCE:
                dc.b    $03, $00, $01, $FF
Offset_0x028CD2:
                dc.b    $07, $00, $FF, $00
;-------------------------------------------------------------------------------    
Masher_Mappings:                                               ; Offset_0x028CD6    
                dc.w    Offset_0x028CDA-Masher_Mappings
                dc.w    Offset_0x028CF4-Masher_Mappings
Offset_0x028CDA:
                dc.w    $0003
                dc.l    $F0050000, $0000FFF4, $F0010004, $00020004
                dc.l    $0009000A, $0005FFF4
Offset_0x028CF4:
                dc.w    $0003
                dc.l    $F0050000, $0000FFF4, $F0050006, $00030002
                dc.l    $00090010, $0008FFF4       
;===============================================================================
; Objeto 0x5C - Inimigo Masher (Piranha) na Green Hill
; <<<- 
;===============================================================================