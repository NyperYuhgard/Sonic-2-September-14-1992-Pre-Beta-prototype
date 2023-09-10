;===============================================================================
; Objeto 0x21 - Mostrador de Pontos, tempo, anéis e vidas
; ->>> 
;===============================================================================
; Offset_0x0392FC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03930A(PC, D0), D1
                jmp     Offset_0x03930A(PC, D1)             
;-------------------------------------------------------------------------------
Offset_0x03930A:
                dc.w    Offset_0x03930E-Offset_0x03930A
                dc.w    Offset_0x03933C-Offset_0x03930A  
;-------------------------------------------------------------------------------  
Offset_0x03930E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0090, Obj_X(A0)                                ; $0008
                move.w  #$0108, Obj_Sub_Y(A0)                            ; $000A
                move.l  #Head_Up_Display_Mappings, Obj_Map(A0) ; Offset_0x039380, $0004
                move.w  #$06CA, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_3D_To_ModifySpriteAttr_2P          ; Offset_0x03A090
                move.b  #$00, Obj_Flags(A0)                              ; $0001
                move.b  #$00, Obj_Priority(A0)                           ; $0018 
;-------------------------------------------------------------------------------  
Offset_0x03933C:
                tst.w   (Ring_Count).w                               ; $FFFFFE20
                beq.s   Offset_0x039360
                moveq   #$00, D0
                btst    #$03, ($FFFFFE05).w
                bne.s   Offset_0x039356
                cmpi.b  #$09, ($FFFFFE23).w
                bne.s   Offset_0x039356
                addq.w  #$02, D0
Offset_0x039356:
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x039360:
                moveq   #$00, D0
                btst    #$03, ($FFFFFE05).w
                bne.s   Offset_0x039376
                addq.w  #$01, D0
                cmpi.b  #$09, ($FFFFFE23).w
                bne.s   Offset_0x039376
                addq.w  #$02, D0
Offset_0x039376:
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                jmp     (DisplaySprite)                        ; Offset_0x0120DE  
;-------------------------------------------------------------------------------  
Head_Up_Display_Mappings:                                      ; Offset_0x039380
                dc.w    Offset_0x039388-Head_Up_Display_Mappings
                dc.w    Offset_0x0393DA-Head_Up_Display_Mappings
                dc.w    Offset_0x03942C-Head_Up_Display_Mappings
                dc.w    Offset_0x03947E-Head_Up_Display_Mappings
Offset_0x039388:
                dc.w    $000A
                dc.l    $800DA000, $A0000000
                dc.l    $800DA018, $A00C0020
                dc.l    $800DA020, $A0100040
                dc.l    $900DA010, $A0080000
                dc.l    $900DA028, $A0140028
                dc.l    $A00DA008, $A0040000
                dc.l    $A001A000, $A0000020
                dc.l    $A009A030, $A0180030
                dc.l    $4005810A, $80850000
                dc.l    $400DA10E, $A0870010
Offset_0x0393DA:
                dc.w    $000A
                dc.l    $800DA000, $A0000000
                dc.l    $800DA018, $A00C0020
                dc.l    $800DA020, $A0100040
                dc.l    $900DA010, $A0080000
                dc.l    $900DA028, $A0140028
                dc.l    $A00D8008, $80040000
                dc.l    $A0018000, $80000020
                dc.l    $A009A030, $A0180030
                dc.l    $4005810A, $80850000
                dc.l    $400DA10E, $A0870010
Offset_0x03942C:
                dc.w    $000A
                dc.l    $800DA000, $A0000000
                dc.l    $800DA018, $A00C0020
                dc.l    $800DA020, $A0100040
                dc.l    $900D8010, $80080000
                dc.l    $900DA028, $A0140028
                dc.l    $A00DA008, $A0040000
                dc.l    $A001A000, $A0000020
                dc.l    $A009A030, $A0180030
                dc.l    $4005810A, $80850000
                dc.l    $400DA10E, $A0870010
Offset_0x03947E:
                dc.w    $000A
                dc.l    $800DA000, $A0000000
                dc.l    $800DA018, $A00C0020
                dc.l    $800DA020, $A0100040
                dc.l    $900D8010, $80080000
                dc.l    $900DA028, $A0140028
                dc.l    $A00D8008, $80040000
                dc.l    $A0018000, $80000020
                dc.l    $A009A030, $A0180030
                dc.l    $4005810A, $80850000
                dc.l    $400DA10E, $A0870010                                        
;===============================================================================
; Objeto 0x21 - Mostrador de Pontos, tempo, anéis e vidas
; <<<- 
;===============================================================================