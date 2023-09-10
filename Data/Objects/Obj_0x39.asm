;===============================================================================
; Objeto 0x39 - Objeto de controle de Game Over / Time Over
; ->>> 
;===============================================================================
; Offset_0x00FF7E:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00FF8C(PC, D0), D1
                jmp     Offset_0x00FF8C(PC, D1)    
Offset_0x00FF8C:                
                dc.w    Offset_0x00FF92-Offset_0x00FF8C
                dc.w    Offset_0x00FFD6-Offset_0x00FF8C
                dc.w    Offset_0x00FFF8-Offset_0x00FF8C      
Offset_0x00FF92:
                tst.l   ($FFFFF680).w
                beq.s   Offset_0x00FF9A
                rts
Offset_0x00FF9A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0050, Obj_X(A0)                                ; $0008
                btst    #$00, Obj_Map_Id(A0)                             ; $001A
                beq.s   Offset_0x00FFB2
                move.w  #$01F0, Obj_X(A0)                                ; $0008
Offset_0x00FFB2:
                move.w  #$00F0, Obj_Sub_Y(A0)                            ; $000A
                move.l  #Time_Over_Game_Over_Mappings, Obj_Map(A0) ; Offset_0x0109C4                         ; $0004
                move.w  #$84DE, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$00, Obj_Flags(A0)                              ; $0001
                move.b  #$00, Obj_Priority(A0)                           ; $0018
Offset_0x00FFD6:
                moveq   #$10, D1
                cmpi.w  #$0120, Obj_X(A0)                                ; $0008
                beq.s   Offset_0x00FFEC
                bcs.s   Offset_0x00FFE4
                neg.w   D1
Offset_0x00FFE4:
                add.w   D1, Obj_X(A0)                                    ; $0008
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00FFEC:
                move.w  #$02D0, Obj_Ani_Time(A0)                         ; $001E
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                rts
Offset_0x00FFF8:
                move.b  (Control_Ports_Buffer_Data+$0001).w, D0      ; $FFFFF605
                andi.b  #$70, D0
                bne.s   Offset_0x010018
                btst    #$00, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x01003C
                tst.w   Obj_Ani_Time(A0)                                 ; $001E
                beq.s   Offset_0x010018
                subq.w  #$01, Obj_Ani_Time(A0)                           ; $001E
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x010018:
                tst.b   ($FFFFFE1A).w
                bne.s   Offset_0x010032
                move.b  #$14, (Game_Mode).w                          ; $FFFFF600
                tst.b   ($FFFFFE18).w
                bne.s   Offset_0x01003C
                move.b  #$00, (Game_Mode).w                          ; $FFFFF600
                bra.s   Offset_0x01003C
Offset_0x010032:
                clr.l   ($FFFFFE38).w
                move.w  #$0001, ($FFFFFE02).w
Offset_0x01003C:
                bra     DisplaySprite                          ; Offset_0x0120DE
;===============================================================================
; Objeto 0x39 - Objeto de controle de Game Over / Time Over
; <<<- 
;===============================================================================