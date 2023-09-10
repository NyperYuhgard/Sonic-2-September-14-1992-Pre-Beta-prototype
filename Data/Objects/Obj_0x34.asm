;===============================================================================
; Objeto 0x34 - Tela com o nome das fases conhecido também conhecido como:
; ->>>        - Splash Screen, Title Cards, etc...
;===============================================================================
; Offset_0x00FE28:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00FE36(PC, D0), D1
                jmp     Offset_0x00FE36(PC, D1)
Offset_0x00FE36:
                dc.w    Offset_0x00FE3E-Offset_0x00FE36
                dc.w    Offset_0x00FED0-Offset_0x00FE36
                dc.w    Offset_0x00FEF6-Offset_0x00FE36
                dc.w    Offset_0x00FEF6-Offset_0x00FE36          
Offset_0x00FE3E:
                move.l  A0, A1
                lea     Title_Cards_Main_Position(PC), A2      ; Offset_0x00FF66
                lea     Title_Cards_Config(PC), A3             ; Offset_0x00FF72
                moveq   #$02, D1
                move.b  (Level_Id).w, D0                             ; $FFFFFE10
                cmpi.b  #$10, D0
                beq.s   Offset_0x00FE60
                cmpi.b  #$06, D0
                beq.s   Offset_0x00FE60
                cmpi.b  #$0E, D0
                bne.s   Offset_0x00FE62
Offset_0x00FE60:
                moveq   #$01, D1
Offset_0x00FE62:
                move.b  #$34, Obj_Id(A1)                                 ; $0000
                move.w  (A3), Obj_X(A1)                                  ; $0008
                move.w  (A3)+, $0032(A1)
                move.w  (A3)+, $0030(A1)
                move.w  (A2)+, Obj_Sub_Y(A1)                             ; $000A
                move.b  (A2)+, Obj_Routine(A1)                           ; $0024
                move.b  (A2)+, D0
                bpl.s   Offset_0x00FE94
                moveq   #$14, D0
                cmpi.b  #$05, (Level_Id).w                           ; $FFFFFE10
                beq.s   Offset_0x00FE9A
                move.b  (Act_Id).w, D0                               ; $FFFFFE11
                addi.b  #$12, D0
                bra.s   Offset_0x00FE9A
Offset_0x00FE94:
                bne.s   Offset_0x00FE9A
                move.b  (Level_Id).w, D0                             ; $FFFFFE10
Offset_0x00FE9A:
                move.b  D0, Obj_Map_Id(A1)                               ; $001A
                move.l  #Title_Cards_Mappings, Obj_Map(A1) ; Offset_0x010506, $0004
                move.w  #$8000, Obj_Art_VRAM(A1)                         ; $0002
                bsr     ModifySpriteAttr_2P_A1                 ; Offset_0x0129AA
                move.b  #$60, Obj_Width(A1)                              ; $0019
                move.b  #$00, Obj_Flags(A1)                              ; $0001
                move.b  #$00, Obj_Priority(A1)                           ; $0018
                move.w  #$003C, Obj_Ani_Time(A1)                         ; $001E
                lea     Obj_Size(A1), A1                                 ; $0040
                dbra    D1, Offset_0x00FE62
Offset_0x00FED0:
                moveq   #$10, D1
                move.w  $0030(A0), D0
                cmp.w   Obj_X(A0), D0                                    ; $0008
                beq.s   Offset_0x00FEE4
                bge.s   Offset_0x00FEE0
                neg.w   D1
Offset_0x00FEE0:
                add.w   D1, Obj_X(A0)                                    ; $0008
Offset_0x00FEE4:
                move.w  Obj_X(A0), D0                                    ; $0008
                bmi.s   Offset_0x00FEF4
                cmpi.w  #$0200, D0
                bcc.s   Offset_0x00FEF4
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00FEF4:
                rts
Offset_0x00FEF6:
                tst.w   Obj_Ani_Time(A0)                                 ; $001E
                beq.s   Offset_0x00FF04
                subq.w  #$01, Obj_Ani_Time(A0)                           ; $001E
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00FF04:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x00FF30
                moveq   #$20, D1
                move.w  $0032(A0), D0
                cmp.w   Obj_X(A0), D0                                    ; $0008
                beq.s   Offset_0x00FF30
                bge.s   Offset_0x00FF1A
                neg.w   D1
Offset_0x00FF1A:
                add.w   D1, Obj_X(A0)                                    ; $0008
                move.w  Obj_X(A0), D0                                    ; $0008
                bmi.s   Offset_0x00FF2E
                cmpi.w  #$0200, D0
                bcc.s   Offset_0x00FF2E
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00FF2E:
                rts
Offset_0x00FF30:
                cmpi.b  #$04, Obj_Routine(A0)                            ; $0024
                bne.s   Offset_0x00FF50
                moveq   #$02, D0
                jsr     (LoadPLC)                              ; Offset_0x001BB4
                moveq   #$00, D0
                move.b  (Level_Id).w, D0                             ; $FFFFFE10
                move.b  Flickies_Select_Array(PC, D0), D0      ; Offset_0x00FF54
                jsr     (LoadPLC)                              ; Offset_0x001BB4
Offset_0x00FF50:
                bra     DeleteObject                           ; Offset_0x0120D0        
Flickies_Select_Array:                                         ; Offset_0x00FF54
                dc.b    $32, $32, $32, $32, $34, $34, $34, $34
                dc.b    $36, $36, $37, $33, $39, $3A, $35, $3B
                dc.b    $38, $38                
Title_Cards_Main_Position:                                     ; Offset_0x00FF66
                dc.w    $00B8, $0200  ; Nome da fase
                dc.w    $00D0, $0211  ; "ZONE"
                dc.w    $00D0, $02FF  ; "1","2" ou "3"
Title_Cards_Config:                                            ; Offset_0x00FF72                      
                dc.w    $0240, $0120  ; Nome da fase
                dc.w    $0028, $0148  ; "ZONE"
                dc.w    $0068, $0188  ; "1","2" ou "3"                
;===============================================================================
; Objeto 0x34 - Tela com o nome das fases conhecido também conhecido como:
; <<<-        - Splash Screen, Title Cards, etc...
;===============================================================================