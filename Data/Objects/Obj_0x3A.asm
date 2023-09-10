;===============================================================================
; Objeto 0x3A - Tela com a pontuação e bonificação da fase
; ->>>
;===============================================================================
; Offset_0x010040:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01004E(PC, D0), D1
                jmp     Offset_0x01004E(PC, D1)     
Offset_0x01004E:                    
                dc.w    Offset_0x010056-Offset_0x01004E
                dc.w    Offset_0x0100B2-Offset_0x01004E
                dc.w    Offset_0x0100FE-Offset_0x01004E
                dc.w    Offset_0x01016E-Offset_0x01004E     
Offset_0x010056:
                tst.l   ($FFFFF680).w
                beq.s   Offset_0x01005E
                rts
Offset_0x01005E:
                move.l  A0, A1
                lea     (Level_Results_Screen_Pos), A2         ; Offset_0x010296
                moveq   #$06, D1
Offset_0x010068:
                move.b  #$3A, Obj_Id(A1)                                 ; $0000
                move.w  (A2), Obj_X(A1)                                  ; $0008
                move.w  (A2)+, $0032(A1)
                move.w  (A2)+, $0030(A1)
                move.w  (A2)+, Obj_Sub_Y(A1)                             ; $000A
                move.b  (A2)+, Obj_Routine(A1)                           ; $0024
                move.b  (A2)+, D0
                cmpi.b  #$06, D0
                bne.s   Offset_0x01008E
                add.b   (Act_Id).w, D0                               ; $FFFFFE11
Offset_0x01008E:
                move.b  D0, Obj_Map_Id(A1)                               ; $001A
                move.l  #Level_Results_Mappings, Obj_Map(A1) ; Offset_0x010A14, $0004
                move.w  #$8580, Obj_Art_VRAM(A1)                         ; $0002
                bsr     ModifySpriteAttr_2P_A1                 ; Offset_0x0129AA
                move.b  #$00, Obj_Flags(A1)                              ; $0001
                lea     Obj_Size(A1), A1                                 ; $0040
                dbra    D1, Offset_0x010068
Offset_0x0100B2:
                moveq   #$10, D1
                move.w  $0030(A0), D0
                cmp.w   Obj_X(A0), D0                                    ; $0008
                beq.s   Offset_0x0100E4
                bge.s   Offset_0x0100C2
                neg.w   D1
Offset_0x0100C2:
                add.w   D1, Obj_X(A0)                                    ; $0008
Offset_0x0100C6:                
                move.w  Obj_X(A0), D0                                    ; $0008
                bmi.s   Offset_0x0100D8
                cmpi.w  #$0200, D0
                bcc.s   Offset_0x0100D8
                rts           
; Offset_0x0100D4:
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x0100D8:
                rts        
Offset_0x0100DA:
                move.b  #$0E, Obj_Routine(A0)                            ; $0024
                bra     Offset_0x010244
Offset_0x0100E4:
                cmpi.b  #$0E, ($FFFFB724).w
                beq.s   Offset_0x0100DA
                cmpi.b  #$04, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x0100C6
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$00B4, Obj_Ani_Time(A0)                         ; $001E
Offset_0x0100FE:
                subq.w  #$01, Obj_Ani_Time(A0)                           ; $001E
                bne.s   Offset_0x010108
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x010108:
                rts                        
; Offset_0x01010A:
                bra     DisplaySprite                          ; Offset_0x0120DE  
; Offset_0x01010E:
                bsr     DisplaySprite                          ; Offset_0x0120DE
                move.b  #$01, ($FFFFF7D6).w
                moveq   #$00, D0
                tst.w   ($FFFFF7D2).w
                beq.s   Offset_0x01012A
                addi.w  #$000A, D0
                subi.w  #$000A, ($FFFFF7D2).w
Offset_0x01012A:
                tst.w   ($FFFFF7D4).w
                beq.s   Offset_0x01013A
                addi.w  #$000A, D0
                subi.w  #$000A, ($FFFFF7D4).w
Offset_0x01013A:
                tst.w   D0
                bne.s   Offset_0x010154
                move.w  #$00C5, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$00B4, Obj_Ani_Time(A0)                         ; $001E
Offset_0x010152:
                rts
Offset_0x010154:
                jsr     (AddPoints)                            ; Offset_0x0394D0
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x010152
                move.w  #$00CD, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
Offset_0x01016E:
                moveq   #$00, D0
                move.b  (Level_Id).w, D0                             ; $FFFFFE10
                add.w   D0, D0
                add.b   (Act_Id).w, D0                               ; $FFFFFE11
                add.w   D0, D0
                lea     (Level_Sequence_List), A1              ; Offset_0x0101BC
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x01018E
                lea     (Level_Sequence_List_2P), A1           ; Offset_0x010200
Offset_0x01018E:
                move.w  $00(A1, D0), D0
                tst.w   D0
                bpl.s   Offset_0x01019E
                move.b  #$00, (Game_Mode).w                          ; $FFFFF600
                rts
Offset_0x01019E:
                move.w  D0, (Level_Id).w                             ; $FFFFFE10
                clr.b   (Saved_Level_Flag).w                         ; $FFFFFE30
                tst.b   ($FFFFF7CD).w
                beq.s   Offset_0x0101B4
                move.b  #$10, (Game_Mode).w                          ; $FFFFF600
                bra.s   Offset_0x0101BA
Offset_0x0101B4:
                move.w  #$0001, ($FFFFFE02).w
Offset_0x0101BA:
                rts  
Level_Sequence_List:                                           ; Offset_0x0101BC
                dc.w    $0001, $0D00
                dc.w    $0000, $0000
                dc.w    $0201, $0400
                dc.w    $0000, $0000
                dc.w    $0401, $1000
                dc.w    $0F00, $0000
                dc.w    $0E00, $0000
                dc.w    $0701, $0B00
                dc.w    $0801, $0A00
                dc.w    $0000, $0000
                dc.w    $0A01, $0400
                dc.w    $0B01, $0A00
                dc.w    $0C01, $0700
                dc.w    $0D01, $0F00
                dc.w    $FFFF, $0000
                dc.w    $0F01, $0C00
                dc.w    $0600, $0000    
Level_Sequence_List_2P:                                        ; Offset_0x010200                  
                dc.w    $0001, $0C00
                dc.w    $0000, $0000
                dc.w    $0201, $0400
                dc.w    $0000, $0000
                dc.w    $0401, $1000
                dc.w    $0F00, $0000
                dc.w    $0E00, $0000
                dc.w    $0701, $0B00
                dc.w    $0801, $0A00
                dc.w    $0000, $0000
                dc.w    $0A01, $0400
                dc.w    $0B01, $FFFF
                dc.w    $0C01, $0B00
                dc.w    $0D01, $0F00
                dc.w    $FFFF, $0000
                dc.w    $0F01, $0C00
                dc.w    $0600, $0000      
;-------------------------------------------------------------------------------
Offset_0x010244:
                moveq   #$20, D1
                move.w  $0032(A0), D0
                cmp.w   Obj_X(A0), D0                                    ; $0008
                beq.s   Offset_0x01026A
                bge.s   Offset_0x010254
                neg.w   D1
Offset_0x010254:
                add.w   D1, Obj_X(A0)                                    ; $0008
                move.w  Obj_X(A0), D0                                    ; $0008
                bmi.s   Offset_0x010268
                cmpi.w  #$0200, D0
                bcc.s   Offset_0x010268
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x010268:
                rts
Offset_0x01026A:
                cmpi.b  #$04, Obj_Map_Id(A0)                             ; $001A
                bne     DeleteObject                           ; Offset_0x0120D0
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                clr.b   ($FFFFF7CC).w
                move.w  #$009A, D0
                jmp     (Play_Music)                           ; Offset_0x00190C    
;-------------------------------------------------------------------------------
; Offset_0x010286:
                addq.w  #$02, (Sonic_Level_Limits_Max_X).w           ; $FFFFEECA
                cmpi.w  #$2100, (Sonic_Level_Limits_Max_X).w         ; $FFFFEECA
                beq     DeleteObject                           ; Offset_0x0120D0
                rts                   
;-------------------------------------------------------------------------------
Level_Results_Screen_Pos:                                      ; Offset_0x010296  
                dc.w    $0004, $0124, $00BC, $0200
                dc.w    $FEE0, $0120, $00D0, $0201
                dc.w    $040C, $014C, $00D6, $0206
                dc.w    $0520, $0120, $00EC, $0202
                dc.w    $0540, $0120, $00FC, $0203
                dc.w    $0560, $0120, $010C, $0204
                dc.w    $020C, $014C, $00CC, $0205                                                                                                              
;===============================================================================
; Objeto 0x3A - Tela com a pontuação e bonificação da fase
; <<<-
;===============================================================================