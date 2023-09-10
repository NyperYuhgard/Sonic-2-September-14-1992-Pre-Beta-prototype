;===============================================================================
; Objeto 0x7C - Flash do Anel gigante usado para acesso ao Estágio Especial,
; ->>>          não usado, Left over do Sonic 1
;===============================================================================
; Offset_0x00F386:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00F394(PC, D0), D1
                jmp     Offset_0x00F394(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x00F394:
                dc.w    Offset_0x00F39A-Offset_0x00F394
                dc.w    Offset_0x00F3C8-Offset_0x00F394
                dc.w    Offset_0x00F438-Offset_0x00F394
;-------------------------------------------------------------------------------
Offset_0x00F39A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Big_Ring_Flash_Mappings, Obj_Map(A0) ; Offset_0x00F5A8, $0004
                move.w  #$2462, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$00, Obj_Priority(A0)                           ; $0018
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$FF, Obj_Map_Id(A0)                             ; $001A
;-------------------------------------------------------------------------------                
Offset_0x00F3C8:
                bsr.s   Offset_0x00F3E2
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00F3E2:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x00F428
                move.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$08, Obj_Map_Id(A0)                             ; $001A
                bcc.s   Offset_0x00F42A
                cmpi.b  #$03, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x00F428
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.b  #$06, Obj_Routine(A1)                            ; $0024
                move.b  #$1C, ($FFFFB01C).w
                move.b  #$01, ($FFFFF7CD).w
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$01, Obj_Player_Status(A1)                      ; $002B
                bclr    #$00, Obj_Player_Status(A1)                      ; $002B
Offset_0x00F428:
                rts
Offset_0x00F42A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0000, (Obj_Memory_Address).w               ; $FFFFB000
                addq.l  #$04, A7
                rts
;-------------------------------------------------------------------------------                
Offset_0x00F438:
                bra     DeleteObject                           ; Offset_0x0120D0                                
;===============================================================================
; Objeto 0x7C - Flash do Anel gigante usado para acesso ao Estágio Especial,
; <<<-          não usado, Left over do Sonic 1
;===============================================================================