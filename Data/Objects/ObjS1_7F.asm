;===============================================================================
; Objeto 0x7F - Esmeraldas na tela de pontuação e bonificação do
; ->>>          Estágio Especial
;===============================================================================
; Offset_0x010474:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x010482(PC, D0), D1
                jmp     Offset_0x010482(PC, D1)
Offset_0x010482:                
                dc.w    Offset_0x010492-Offset_0x010482
                dc.w    Offset_0x0104EC-Offset_0x010482
Emeralds_Screen_Pos:                                           ; Offset_0x010486               
                dc.w    $0110, $0128, $00F8, $0140, $00E0, $0158
Offset_0x010492:
                move.l  A0, A1
                lea     Emeralds_Screen_Pos(PC), A2            ; Offset_0x010486
                moveq   #$00, D2
                moveq   #$00, D1
                move.b  (Emerald_Count).w, D1                        ; $FFFFFE57
                subq.b  #$01, D1
                bcs     DeleteObject                           ; Offset_0x0120D0
Offset_0x0104A6:
                move.b  Obj_Id(A0), Obj_Id(A1)                           ; $0000
                move.w  (A2)+, Obj_X(A1)                                 ; $0008
                move.w  #$00F0, Obj_Sub_Y(A1)                            ; $000A
                lea     (Emerald_Collected_Flag_List).w, A3          ; $FFFFFE58
                move.b  $00(A3, D2), D3
                move.b  D3, Obj_Map_Id(A1)                               ; $001A
                move.b  D3, Obj_Ani_Number(A1)                           ; $001C
                addq.b  #$01, D2
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
                move.l  #Emeralds_Mappings, Obj_Map(A1) ; Offset_0x010D62, $0004
                move.w  #$8541, Obj_Art_VRAM(A1)                         ; $0002
                bsr     ModifySpriteAttr_2P_A1                 ; Offset_0x0129AA
                move.b  #$00, Obj_Flags(A1)                              ; $0001
                lea     Obj_Size(A1), A1                                 ; $0040
                dbra    D1, Offset_0x0104A6
Offset_0x0104EC:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                move.b  #$06, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$06, D0
                bne.s   Offset_0x010502
                move.b  Obj_Ani_Number(A0), Obj_Map_Id(A0)        ; $001A, $001C
Offset_0x010502:
                bra     DisplaySprite                          ; Offset_0x0120DE
;===============================================================================
; Objeto 0x7F - Esmeraldas na tela de pontuação e bonificação do
; <<<-          Estágio Especial
;===============================================================================