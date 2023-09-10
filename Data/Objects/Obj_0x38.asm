;===============================================================================
; Objeto 0x38 - Escudo do Sonic / Miles
; ->>> 
;===============================================================================
; Offset_0x01842C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01843A(PC, D0), D1
                jmp     Offset_0x01843A(PC, D1)
;------------------------------------------------------------------------------- 
Offset_0x01843A:
                dc.w    Offset_0x01843E-Offset_0x01843A
                dc.w    Offset_0x018466-Offset_0x01843A
;-------------------------------------------------------------------------------   
Offset_0x01843E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Shield_Mappings, Obj_Map(A0)   ; Offset_0x0189CA, $0004
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.w  #$04BE, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
;-------------------------------------------------------------------------------                   
Offset_0x018466:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                btst    #$01, Obj_Player_Status(A1)                      ; $002B
                bne.s   Offset_0x0184B4
                btst    #$00, Obj_Player_Status(A1)                      ; $002B
                beq.s   Offset_0x0184B6
                lea     (Obj_Memory_Address).w, A2                   ; $FFFFB000
                move.w  (Player_Position_X).w, Obj_X(A0)             ; $FFFFB008; $0008
                move.w  (Player_Position_Y).w, Obj_Y(A0)             ; $FFFFB00C; $000C
                move.b  ($FFFFB022).w, Obj_Status(A0)                    ; $0022
                andi.w  #$7FFF, Obj_Art_VRAM(A0)                         ; $0002
                tst.w   Obj_Art_VRAM(A2)                                 ; $0002
                bpl.s   Offset_0x0184A2
                ori.w   #$8000, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x0184A2:
                lea     (Shield_AnimateData), A1               ; Offset_0x0189BC
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x0184B4:
                rts
Offset_0x0184B6:
                jmp     (DeleteObject)                         ; Offset_0x0120D0                             
;===============================================================================
; Objeto 0x38 - Escudo do Sonic / Miles
; <<<- 
;===============================================================================