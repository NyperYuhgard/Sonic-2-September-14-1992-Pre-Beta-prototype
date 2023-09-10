;===============================================================================
; Objeto 0x31 - Atributo invisível das lavas na Hill Top / Metropolis
; ->>> 
;=============================================================================== 
; Offset_0x01B878
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01B886(PC, D0), D1
                jmp     Offset_0x01B886(PC, D1)  
;-------------------------------------------------------------------------------                     
Offset_0x01B886:
                dc.w    Offset_0x01B88E-Offset_0x01B886
                dc.w    Offset_0x01B8D2-Offset_0x01B886     
;-------------------------------------------------------------------------------                                                         
Offset_0x01B88A:
                dc.b    $96, $94, $95, $00                                           
;------------------------------------------------------------------------------- 
Offset_0x01B88E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                move.b  Offset_0x01B88A(PC, D0), Obj_Col_Flags(A0)       ; $0020
                move.l  #Lava_Attributes_Mappings_No_Display, Obj_Map(A0) ; Offset_0x01B8F8, $0004
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                beq.s   Offset_0x01B8B4
                move.l  #Lava_Attributes_Mappings, Obj_Map(A0) ; Offset_0x01B900, $0004
Offset_0x01B8B4:
                move.w  #$8680, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$84, Obj_Flags(A0)                              ; $0001
                move.b  #$80, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), Obj_Map_Id(A0)           ; $001A, $0028
;-------------------------------------------------------------------------------                 
Offset_0x01B8D2:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                bne.s   Offset_0x01B8EC
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_04_To_DeleteObject                 ; Offset_0x01BF56
Offset_0x01B8EC:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                beq.s   Offset_0x01B8F6
                bsr     Jmp_04_To_DisplaySprite                ; Offset_0x01BF50
Offset_0x01B8F6:
                rts
;-------------------------------------------------------------------------------
Lava_Attributes_Mappings_No_Display:                           ; Offset_0x01B8F8
                dc.w    Offset_0x01B8FE-Lava_Attributes_Mappings_No_Display
                dc.w    Offset_0x01B8FE-Lava_Attributes_Mappings_No_Display
                dc.w    Offset_0x01B8FE-Lava_Attributes_Mappings_No_Display
Offset_0x01B8FE:
                dc.w    $0000
;-------------------------------------------------------------------------------
Lava_Attributes_Mappings:                                      ; Offset_0x01B900
                dc.w    Offset_0x01B906-Lava_Attributes_Mappings
                dc.w    Offset_0x01B928-Lava_Attributes_Mappings
                dc.w    Offset_0x01B94A-Lava_Attributes_Mappings
;-------------------------------------------------------------------------------
Offset_0x01B906:
                dc.w    $0004
                dc.l    $E0050034, $001AFFE0
                dc.l    $E0050034, $001A0010
                dc.l    $10050034, $001AFFE0
                dc.l    $10050034, $001A0010
;-------------------------------------------------------------------------------
Offset_0x01B928:
                dc.w    $0004
                dc.l    $E0050034, $001AFFC0
                dc.l    $E0050034, $001A0030
                dc.l    $10050034, $001AFFC0
                dc.l    $10050034, $001A0030
;-------------------------------------------------------------------------------
Offset_0x01B94A:
                dc.w    $0004
                dc.l    $E0050034, $001AFF80
                dc.l    $E0050034, $001A0070
                dc.l    $10050034, $001AFF80
                dc.l    $10050034, $001A0070                                                                                                                        
;===============================================================================
; Objeto 0x31 - Atributo invisível das lavas na Hill Top / Metropolis
; <<<- 
;===============================================================================