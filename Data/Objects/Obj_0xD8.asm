;===============================================================================
; Objeto 0xD8 - Bumper verde na Casino Night muda para amarelo e vermelho
; ->>>          ao tocar depois some
;=============================================================================== 
; Offset_0x02719C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0271AA(PC, D0), D1
                jmp     Offset_0x0271AA(PC, D1)                 
;-------------------------------------------------------------------------------
Offset_0x0271AA:
                dc.w    Offset_0x0271B0-Offset_0x0271AA
                dc.w    Offset_0x0271EC-Offset_0x0271AA
                dc.w    Offset_0x027372-Offset_0x0271AA       
;-------------------------------------------------------------------------------
Offset_0x0271B0:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Green_Bumper_Mappings, Obj_Map(A0) ; Offset_0x0273B2, $0004
                move.w  #$43E6, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_32_To_ModifySpriteAttr_2P          ; Offset_0x027414
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$D7, Obj_Col_Flags(A0)                          ; $0020
                move.b  Obj_Subtype(A0), D0                              ; $0028
                rol.b   #$02, D0
                andi.b  #$03, D0
                move.b  D0, Obj_Ani_Number(A0)                           ; $001C
Offset_0x0271EC:
                move.b  Obj_Col_Prop(A0), D0                             ; $0021
                bne     Offset_0x0271FA
                tst.w   Obj_Control_Var_04(A0)                           ; $0030
                beq.s   Offset_0x027230
Offset_0x0271FA:
                lea     Obj_Control_Var_04(A0), A4                       ; $0030
                tst.b   (A4)
                beq.s   Offset_0x027206
                subq.b  #$01, (A4)
                bra.s   Offset_0x027214
Offset_0x027206:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$00, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x027214
                bsr.s   Offset_0x02723E
Offset_0x027214:
                addq.w  #$01, A4
                tst.b   (A4)
                beq.s   Offset_0x02721E
                subq.b  #$01, (A4)
                bra.s   Offset_0x02722C
Offset_0x02721E:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bclr    #$01, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x02722C
                bsr.s   Offset_0x02723E
Offset_0x02722C:
                clr.b   Obj_Col_Prop(A0)                                 ; $0021
Offset_0x027230:
                lea     (Green_Bumper_Animate_Data), A1        ; Offset_0x02738A
                bsr     Jmp_09_To_AnimateSprite                ; Offset_0x02740E
                bra     Jmp_1D_To_MarkObjGone                  ; Offset_0x027408
Offset_0x02723E:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                subq.b  #$03, D0
                beq.s   Offset_0x02724C
                bcc.s   Offset_0x02726A
                addq.b  #$03, D0
                bne.s   Offset_0x02726A
Offset_0x02724C:
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$F900, Obj_Speed_Y(A1)                          ; $0012
                move.w  Obj_Y(A0), D2                                    ; $000C
                sub.w   Obj_Y(A1), D2                                    ; $000C
                bpl.s   Offset_0x027266
                neg.w   Obj_Speed_Y(A1)                                  ; $0012
Offset_0x027266:
                bra     Offset_0x0272F6
Offset_0x02726A:
                subq.b  #$01, D0
                bne.s   Offset_0x0272DC
                move.b  #$04, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$0020, D3
                btst    #$00, Obj_Status(A0)                             ; $0022
                bne.s   Offset_0x027284
                move.w  #$0060, D3
Offset_0x027284:
                move.w  Obj_Speed(A1), D1                                ; $0010
                move.w  Obj_Speed_Y(A1), D2                              ; $0012
                jsr     (CalcAngle)                            ; Offset_0x003C02
                sub.w   D3, D0
                move.w  D0, D1
                bpl.s   Offset_0x02729A
                neg.w   D1
Offset_0x02729A:
                neg.w   D0
                add.w   D3, D0
                cmpi.b  #$40, D1
                bcc.s   Offset_0x0272AE
                cmpi.b  #$38, D1
                bcs.s   Offset_0x0272C0
                move.w  D3, D0
                bra.s   Offset_0x0272C0
Offset_0x0272AE:
                subi.w  #$0080, D1
                neg.w   D1
                cmpi.b  #$38, D1
                bcs.s   Offset_0x0272C0
                move.w  D3, D0
                addi.w  #$0080, D0
Offset_0x0272C0:
                jsr     (CalcSine)                             ; Offset_0x00396A
                muls.w  #$F900, D1
                asr.l   #$08, D1
                move.w  D1, Obj_Speed(A1)                                ; $0010
                muls.w  #$F900, D0
                asr.l   #$08, D0
                move.w  D0, Obj_Speed_Y(A1)                              ; $0012
                bra.s   Offset_0x0272F6
Offset_0x0272DC:
                move.b  #$05, Obj_Ani_Number(A0)                         ; $001C
                move.w  #$F900, Obj_Speed(A1)                            ; $0010
                move.w  Obj_X(A0), D2                                    ; $0008
                sub.w   Obj_X(A1), D2                                    ; $0008
                bpl.s   Offset_0x0272F6
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x0272F6:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$04, Obj_Status(A1)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
                clr.b   Obj_Control_Var_10(A1)                           ; $003C
                move.w  #$00D8, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                moveq   #$04, D3
                moveq   #$01, D0
                subi.w  #$2000, Obj_Art_VRAM(A0)                         ; $0002
                bcc.s   Offset_0x02734A
                addi.w  #$2000, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                lea     ($FFFFE700).w, A1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                andi.w  #$003F, D1
                lea     $00(A1, D1), A1
                addq.b  #$01, (A1)
                cmpi.b  #$03, (A1)
                bcs.s   Offset_0x02734A
                moveq   #$02, D3
                moveq   #$32, D0
Offset_0x02734A:
                jsr     (AddPoints)                            ; Offset_0x0394D0
                bsr     Jmp_08_To_SingleObjectLoad             ; Offset_0x027402
                bne.s   Offset_0x02736C
                move.b  #$29, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  D3, Obj_Map_Id(A1)                               ; $001A
Offset_0x02736C:
                move.b  #$04, (A4)
                rts
Offset_0x027372:
                lea     (Green_Bumper_Animate_Data), A1        ; Offset_0x02738A
                bsr     Jmp_09_To_AnimateSprite                ; Offset_0x02740E
                cmpi.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                bcs     Jmp_18_To_DeleteObject                 ; Offset_0x0273FC
                bra     Jmp_1D_To_MarkObjGone                  ; Offset_0x027408 
;-------------------------------------------------------------------------------
Green_Bumper_Animate_Data:                                     ; Offset_0x02738A
                dc.w    Offset_0x027396-Green_Bumper_Animate_Data
                dc.w    Offset_0x027399-Green_Bumper_Animate_Data
                dc.w    Offset_0x02739C-Green_Bumper_Animate_Data
                dc.w    Offset_0x02739F-Green_Bumper_Animate_Data
                dc.w    Offset_0x0273A5-Green_Bumper_Animate_Data
                dc.w    Offset_0x0273AB-Green_Bumper_Animate_Data
Offset_0x027396:
                dc.b    $0F, $00, $FF
Offset_0x027399:
                dc.b    $0F, $01, $FF
Offset_0x02739C:
                dc.b    $0F, $02, $FF
Offset_0x02739F:
                dc.b    $03, $03, $00, $03, $FD, $00
Offset_0x0273A5:
                dc.b    $03, $04, $01, $04, $FD, $01
Offset_0x0273AB:
                dc.b    $03, $05, $02, $05, $FD, $02, $00                  
;-------------------------------------------------------------------------------
Green_Bumper_Mappings:                                         ; Offset_0x0273B2
                dc.w    Offset_0x0273BE-Green_Bumper_Mappings
                dc.w    Offset_0x0273C8-Green_Bumper_Mappings
                dc.w    Offset_0x0273D2-Green_Bumper_Mappings
                dc.w    Offset_0x0273DC-Green_Bumper_Mappings
                dc.w    Offset_0x0273E6-Green_Bumper_Mappings
                dc.w    Offset_0x0273F0-Green_Bumper_Mappings
Offset_0x0273BE:
                dc.w    $0001
                dc.l    $F80D0000, $0000FFF0
Offset_0x0273C8:
                dc.w    $0001
                dc.l    $F00B0008, $0004FFF4
Offset_0x0273D2:
                dc.w    $0001
                dc.l    $F0070014, $000AFFF8
Offset_0x0273DC:
                dc.w    $0001
                dc.l    $FA0D0000, $0000FFF0
Offset_0x0273E6:
                dc.w    $0001
                dc.l    $F20B0008, $0004FFF2
Offset_0x0273F0:
                dc.w    $0001
                dc.l    $F0070014, $000AFFF6
;===============================================================================
; Objeto 0xD8 - Bumper verde na Casino Night muda para amarelo e vermelho
; <<<-          ao tocar depois some
;===============================================================================