;===============================================================================
; Objeto 0x7E - Tela com a pontuação e bonificação do Estágio Especial
; ->>> 
;===============================================================================
; Offset_0x0102CE:                                              
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0102DC(PC, D0), D1
                jmp     Offset_0x0102DC(PC, D1)
Offset_0x0102DC:                
                dc.w    Offset_0x0102F2-Offset_0x0102DC
                dc.w    Offset_0x01036A-Offset_0x0102DC
                dc.w    Offset_0x0103A2-Offset_0x0102DC
                dc.w    Offset_0x0103B0-Offset_0x0102DC
                dc.w    Offset_0x0103A2-Offset_0x0102DC
                dc.w    Offset_0x01040A-Offset_0x0102DC
                dc.w    Offset_0x0103A2-Offset_0x0102DC
                dc.w    Offset_0x010414-Offset_0x0102DC
                dc.w    Offset_0x0103A2-Offset_0x0102DC
                dc.w    Offset_0x01040A-Offset_0x0102DC
                dc.w    Offset_0x010438-Offset_0x0102DC
Offset_0x0102F2:
                tst.l   ($FFFFF680).w
                beq.s   Offset_0x0102FA
                rts
Offset_0x0102FA:
                move.l  A0, A1
                lea     (Special_Stage_Results_Screen_Pos), A2 ; Offset_0x01044C
                moveq   #$03, D1
                cmpi.w  #$0032, (Ring_Count).w                       ; $FFFFFE20
                bcs.s   Offset_0x01030E
                addq.w  #$01, D1
Offset_0x01030E:
                move.b  Obj_Id(A0), Obj_Id(A1)                           ; $0000
                move.w  (A2)+, Obj_X(A1)                                 ; $0008
                move.w  (A2)+, $0030(A1)
                move.w  (A2)+, Obj_Sub_Y(A1)                             ; $000A
                move.b  (A2)+, Obj_Routine(A1)                           ; $0024
                move.b  (A2)+, Obj_Map_Id(A1)                            ; $001A
                move.l  #Special_Stage_Results_Mappings, Obj_Map(A1) ; Offset_0x010B40, $0004
                move.w  #$8580, Obj_Art_VRAM(A1)                         ; $0002
                bsr     ModifySpriteAttr_2P_A1                 ; Offset_0x0129AA
                move.b  #$00, Obj_Flags(A1)                              ; $0001
                lea     Obj_Size(A1), A1                                 ; $0040
                dbra    D1, Offset_0x01030E
                moveq   #$07, D0
                move.b  (Emerald_Count).w, D1                        ; $FFFFFE57
                beq.s   Offset_0x010366
                moveq   #$00, D0
                cmpi.b  #$06, D1
                bne.s   Offset_0x010366
                moveq   #$08, D0
                move.w  #$0018, Obj_X(A0)                                ; $0008
                move.w  #$0118, $0030(A0)
Offset_0x010366:
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
Offset_0x01036A:
                moveq   #$10, D1
                move.w  $0030(A0), D0
                cmp.w   Obj_X(A0), D0                                    ; $0008
                beq.s   Offset_0x010390
                bge.s   Offset_0x01037A
                neg.w   D1
Offset_0x01037A:
                add.w   D1, Obj_X(A0)                                    ; $0008
Offset_0x01037E:
                move.w  Obj_X(A0), D0                                    ; $0008
                bmi.s   Offset_0x01038E
                cmpi.w  #$0200, D0
                bcc.s   Offset_0x01038E
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x01038E:
                rts
Offset_0x010390:
                cmpi.b  #$02, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x01037E
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$00B4, Obj_Ani_Time(A0)                         ; $001E
Offset_0x0103A2:
                subq.w  #$01, Obj_Ani_Time(A0)                           ; $001E
                bne.s   Offset_0x0103AC
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x0103AC:
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x0103B0:
                bsr     DisplaySprite                          ; Offset_0x0120DE
                move.b  #$01, ($FFFFF7D6).w
                tst.w   ($FFFFF7D4).w
                beq.s   Offset_0x0103E2
                subi.w  #$000A, ($FFFFF7D4).w
                moveq   #$0A, D0
                jsr     (AddPoints)                            ; Offset_0x0394D0
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x010408
                move.w  #$00CD, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
Offset_0x0103E2:
                move.w  #$00C5, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$00B4, Obj_Ani_Time(A0)                         ; $001E
                cmpi.w  #$0032, (Ring_Count).w                       ; $FFFFFE20
                bcs.s   Offset_0x010408
                move.w  #$003C, Obj_Ani_Time(A0)                         ; $001E
                addq.b  #$04, Obj_Routine(A0)                            ; $0024
Offset_0x010408:
                rts
Offset_0x01040A:
                move.w  #$0001, ($FFFFFE02).w
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x010414:
                move.b  #$04, ($FFFFB6DA).w
                move.b  #$14, ($FFFFB6E4).w
                move.w  #$00BF, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0168, Obj_Ani_Time(A0)                         ; $001E
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x010438:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$0F, D0
                bne.s   Offset_0x010448
                bchg    #00, Obj_Map_Id(A0)                              ; $001A
Offset_0x010448:
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------
Special_Stage_Results_Screen_Pos:                              ; Offset_0x01044C 
                dc.w    $0020, $0120, $00C4, $0200
                dc.w    $0320, $0120, $0118, $0201
                dc.w    $0360, $0120, $0128, $0202
                dc.w    $01EC, $011C, $00C4, $0203
                dc.w    $03A0, $0120, $0138, $0206                
;===============================================================================
; Objeto 0x7E - Tela com a pontuação e bonificação do Estágio Especial
; <<<- 
;===============================================================================