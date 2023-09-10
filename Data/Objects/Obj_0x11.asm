;===============================================================================
; Objeto 0x11 - Pontes na Emerald Hill / Hidden Palace
; ->>> 
;===============================================================================
; Offset_0x00C910:
                btst    #$06, Obj_Flags(A0)                              ; $0001
                bne     Offset_0x00C928
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00C930(PC, D0), D1
                jmp     Offset_0x00C930(PC, D1)
;-------------------------------------------------------------------------------                
Offset_0x00C928:
                move.w  #$0180, D0
                bra     DisplaySprite_Param                    ; Offset_0x01211A 
;-------------------------------------------------------------------------------  
Offset_0x00C930:
                dc.w    Offset_0x00C938-Offset_0x00C930
                dc.w    Offset_0x00CA1E-Offset_0x00C930
                dc.w    Offset_0x00CAB0-Offset_0x00C930
                dc.w    Offset_0x00CAB4-Offset_0x00C930              
;------------------------------------------------------------------------------- 
Offset_0x00C938:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #GHz_Bridge_Mappings, Obj_Map(A0) ; Offset_0x00CF14, $0004
                move.w  #$43B6, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                cmpi.b  #$08, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00C96A
                addq.b  #$04, Obj_Routine(A0)                            ; $0024
                move.l  #HPz_Bridge_Mappings, Obj_Map(A0) ; Offset_0x00CECC, $0004
                move.w  #$6300, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x00C96A:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$80, Obj_Width(A0)                              ; $0019
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, Obj_Control_Var_10(A0)                       ; $003C
                move.w  Obj_X(A0), D3                                    ; $0008
                lea     Obj_Subtype(A0), A2                              ; $0028
                moveq   #$00, D1
                move.b  (A2), D1
                move.w  D1, D0
                lsr.w   #$01, D0
                lsl.w   #$04, D0
                sub.w   D0, D3
                swap.w  D1
                move.w  #$0008, D1
                bsr.s   Offset_0x00C9CC
                move.w  Obj_Subtype(A1), D0                              ; $0028
                subq.w  #$08, D0
                move.w  D0, Obj_X(A1)                                    ; $0008
                move.l  A1, Obj_Control_Var_04(A0)                       ; $0030
                swap.w  D1
                subq.w  #$08, D1
                bls.s   Offset_0x00C9CA
                move.w  D1, D4
                bsr.s   Offset_0x00C9CC
                move.l  A1, Obj_Control_Var_08(A0)                       ; $0034
                move.w  D4, D0
                add.w   D0, D0
                add.w   D4, D0
                move.w  $10(A1, D0), D0    
                subq.w  #$08, D0
                move.w  D0, Obj_X(A1)                                    ; $0008
Offset_0x00C9CA:
                bra.s   Offset_0x00CA1E
Offset_0x00C9CC:
                bsr     SingleObjectLoad_2                     ; Offset_0x013BC0
                bne.s   Offset_0x00CA1C
                move.b  Obj_Id(A0), Obj_Id(A1)                           ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                             ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                             ; $000C
                move.l  Obj_Map(A0), Obj_Map(A1)                         ; $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)               ; $0002
                move.b  Obj_Flags(A0), Obj_Flags(A1)                     ; $0001
                bset    #$06, Obj_Flags(A1)                              ; $0001
                move.b  #$40, $000E(A1)
                move.b  D1, Obj_Ani_Boss_Cnt(A1)                         ; $000F
                subq.b  #$01, D1
                lea     Obj_Speed(A1), A2                                ; $0010
Offset_0x00CA0C:
                move.w  D3, (A2)+
                move.w  D2, (A2)+
                move.w  #$0000, (A2)+
                addi.w  #$0010, D3
                dbra    D1, Offset_0x00CA0C
Offset_0x00CA1C:
                rts
;-------------------------------------------------------------------------------                
Offset_0x00CA1E:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                bne.s   Offset_0x00CA34
                tst.b   Obj_Control_Var_12(A0)                           ; $003E
                beq.s   Offset_0x00CA60
                subq.b  #$04, Obj_Control_Var_12(A0)                     ; $003E
                bra.s   Offset_0x00CA5C
Offset_0x00CA34:
                andi.b  #$10, D0
                beq.s   Offset_0x00CA50
                move.b  Obj_Control_Var_13(A0), D0                       ; $003F
                sub.b   Obj_Control_Var_0F(A0), D0                       ; $003B
                beq.s   Offset_0x00CA50
                bcc.s   Offset_0x00CA4C
                addq.b  #$01, Obj_Control_Var_13(A0)                     ; $003F
                bra.s   Offset_0x00CA50
Offset_0x00CA4C:
                subq.b  #$01, Obj_Control_Var_13(A0)                     ; $003F
Offset_0x00CA50:
                cmpi.b  #$40, Obj_Control_Var_12(A0)                     ; $003E
                beq.s   Offset_0x00CA5C
                addq.b  #$04, Obj_Control_Var_12(A0)                     ; $003E
Offset_0x00CA5C:
                bsr     Offset_0x00CC8C
Offset_0x00CA60:
                moveq   #$00, D1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                lsl.w   #$03, D1
                move.w  D1, D2
                addq.w  #$08, D1
                add.w   D2, D2
                moveq   #$08, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Offset_0x00CB16
Offset_0x00CA78:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x00CA80
                rts
Offset_0x00CA80:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x00CA94
                rts
Offset_0x00CA94:
                move.l  Obj_Control_Var_04(A0), A1                       ; $0030
                bsr     DeleteObject_A1                        ; Offset_0x0120D2
                cmpi.b  #$08, Obj_Subtype(A0)                            ; $0028
                bls.s   Offset_0x00CAAC
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                bsr     DeleteObject_A1                        ; Offset_0x0120D2
Offset_0x00CAAC:
                bra     DeleteObject                           ; Offset_0x0120D0                
;-------------------------------------------------------------------------------  
Offset_0x00CAB0:
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                 
Offset_0x00CAB4:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                bne.s   Offset_0x00CACA
                tst.b   Obj_Control_Var_12(A0)                           ; $003E
                beq.s   Offset_0x00CAF6
                subq.b  #$04, Obj_Control_Var_12(A0)                     ; $003E
                bra.s   Offset_0x00CAF2
Offset_0x00CACA:
                andi.b  #$10, D0
                beq.s   Offset_0x00CAE6
                move.b  Obj_Control_Var_13(A0), D0                       ; $003F
                sub.b   Obj_Control_Var_0F(A0), D0                       ; $003B
                beq.s   Offset_0x00CAE6
                bcc.s   Offset_0x00CAE2
                addq.b  #$01, Obj_Control_Var_13(A0)                     ; $003F
                bra.s   Offset_0x00CAE6
Offset_0x00CAE2:
                subq.b  #$01, Obj_Control_Var_13(A0)                     ; $003F
Offset_0x00CAE6:
                cmpi.b  #$40, Obj_Control_Var_12(A0)                     ; $003E
                beq.s   Offset_0x00CAF2
                addq.b  #$04, Obj_Control_Var_12(A0)                     ; $003E
Offset_0x00CAF2:
                bsr     Offset_0x00CC8C
Offset_0x00CAF6:
                moveq   #$00, D1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                lsl.w   #$03, D1
                move.w  D1, D2
                addq.w  #$08, D1
                add.w   D2, D2
                moveq   #$08, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Offset_0x00CB16
                bsr     Offset_0x00CBB6
                bra     Offset_0x00CA78
Offset_0x00CB16:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                moveq   #$3B, D5
                movem.l D1-D4, -(A7)
                bsr.s   Offset_0x00CB30
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                subq.b  #$01, D6
                moveq   #$3F, D5
Offset_0x00CB30:
                btst    D6, Obj_Status(A0)                               ; $0022
                beq.s   Offset_0x00CB94
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x00CB50
                moveq   #$00, D0
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                add.w   D1, D0
                bmi.s   Offset_0x00CB50
                cmp.w   D2, D0
                bcs.s   Offset_0x00CB5E
Offset_0x00CB50:
                bclr    #$03, Obj_Status(A1)                             ; $0022
                bclr    D6, Obj_Status(A0)                               ; $0022
                moveq   #$00, D4
                rts
Offset_0x00CB5E:
                lsr.w   #$04, D0
                move.b  D0, $00(A0, D5)
                move.l  Obj_Control_Var_04(A0), A2                       ; $0030
                cmpi.w  #$0008, D0
                bcs.s   Offset_0x00CB76
                move.l  Obj_Control_Var_08(A0), A2                       ; $0034
                subi.w  #$0008, D0
Offset_0x00CB76:
                add.w   D0, D0
                move.w  D0, D1
                add.w   D0, D0
                add.w   D1, D0
                move.w  $12(A2, D0), D0
                subq.w  #$08, D0
                moveq   #$00, D1
                move.b  Obj_Height_2(A1), D1                             ; $0016
                sub.w   D1, D0
                move.w  D0, Obj_Y(A1)                                    ; $000C
                moveq   #$00, D4
                rts
Offset_0x00CB94:
                move.w  D1, -(A7)
                bsr     Offset_0x00CF2C
                move.w  (A7)+, D1
                btst    D6, Obj_Status(A0)                               ; $0022
                beq.s   Offset_0x00CBB4
                moveq   #$00, D0
                move.w  Obj_X(A1), D0                                    ; $0008
                sub.w   Obj_X(A0), D0                                    ; $0008
                add.w   D1, D0
                lsr.w   #$04, D0
                move.b  D0, $00(A0, D5)
Offset_0x00CBB4:
                rts
Offset_0x00CBB6:
                moveq   #$00, D0
                tst.w   ($FFFFB010).w
                bne.s   Offset_0x00CBC8
                move.b  ($FFFFFE0F).w, D0
                andi.w  #$001C, D0
                lsr.w   #$01, D0
Offset_0x00CBC8:
                moveq   #$00, D2
                move.b  Offset_0x00CBF4+$01(PC, D0), D2
                swap.w  D2
                move.b  Offset_0x00CBF4(PC, D0), D2
                moveq   #$00, D0
                tst.w   ($FFFFB050).w
                bne.s   Offset_0x00CBE6
                move.b  ($FFFFFE0F).w, D0
                andi.w  #$001C, D0
                lsr.w   #$01, D0
Offset_0x00CBE6:
                moveq   #$00, D6
                move.b  Offset_0x00CBF4+$01(PC, D0), D6
                swap.w  D6
                move.b  Offset_0x00CBF4(PC, D0), D6
                bra.s   Offset_0x00CC04    
;-------------------------------------------------------------------------------
Offset_0x00CBF4:
                dc.b    $01, $02, $01, $02, $01, $02, $01, $02, $00, $01, $00, $00, $00, $00, $00, $01
;-------------------------------------------------------------------------------  
Offset_0x00CC04:
                moveq   #-$02, D3
                moveq   #-$02, D4
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$08, D0
                beq.s   Offset_0x00CC16
                move.b  Obj_Control_Var_13(A0), D3                       ; $003F
Offset_0x00CC16:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$10, D0
                beq.s   Offset_0x00CC24
                move.b  Obj_Control_Var_0F(A0), D4                       ; $003B
Offset_0x00CC24:
                move.l  Obj_Control_Var_04(A0), A1                       ; $0030
                lea     $0045(A1), A2
                lea     $0015(A1), A1
                moveq   #$00, D1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                subq.b  #$01, D1
                moveq   #$00, D5
Offset_0x00CC3A:
                moveq   #$00, D0
                subq.w  #$01, D3
                cmp.b   D3, D5
                bne.s   Offset_0x00CC44
                move.w  D2, D0
Offset_0x00CC44:
                addq.w  #$02, D3
                cmp.b   D3, D5
                bne.s   Offset_0x00CC4C
                move.w  D2, D0
Offset_0x00CC4C:
                subq.w  #$01, D3
                subq.w  #$01, D4
                cmp.b   D4, D5
                bne.s   Offset_0x00CC56
                move.w  D6, D0
Offset_0x00CC56:
                addq.w  #$02, D4
                cmp.b   D4, D5
                bne.s   Offset_0x00CC5E
                move.w  D6, D0
Offset_0x00CC5E:
                subq.w  #$01, D4
                cmp.b   D3, D5
                bne.s   Offset_0x00CC6A
                swap.w  D2
                move.w  D2, D0
                swap.w  D2
Offset_0x00CC6A:
                cmp.b   D4, D5
                bne.s   Offset_0x00CC74
                swap.w  D6
                move.w  D6, D0
                swap.w  D6
Offset_0x00CC74:
                move.b  D0, (A1)
                addq.w  #$01, D5
                addq.w  #$06, A1
                cmpa.w  A2, A1
                bne.s   Offset_0x00CC86
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                lea     $0015(A1), A1
Offset_0x00CC86:
                dbra    D1, Offset_0x00CC3A
                rts
Offset_0x00CC8C:
                move.b  Obj_Control_Var_12(A0), D0                       ; $003E
                bsr     Jmp_00_To_CalcSine                     ; Offset_0x00CF32
                move.w  D0, D4
                lea     (Offset_0x00CDCC), A4
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsl.w   #$04, D0
                moveq   #$00, D3
                move.b  Obj_Control_Var_13(A0), D3                       ; $003F
                move.w  D3, D2
                add.w   D0, D3
                moveq   #$00, D5
                lea     (Offset_0x00CD3C-$80), A5
                move.b  $00(A5, D3), D5
                andi.w  #$000F, D3
                lsl.w   #$04, D3
                lea     $00(A4, D3), A3
                move.l  Obj_Control_Var_04(A0), A1                       ; $0030
                lea     $0042(A1), A2
                lea     Obj_Speed_Y(A1), A1                              ; $0012
Offset_0x00CCD0:
                moveq   #$00, D0
                move.b  (A3)+, D0
                addq.w  #$01, D0
                mulu.w  D5, D0
                mulu.w  D4, D0
                swap.w  D0
                add.w   Obj_Control_Var_10(A0), D0                       ; $003C
                move.w  D0, (A1)
                addq.w  #$06, A1
                cmpa.w  A2, A1
                bne.s   Offset_0x00CCF0
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                lea     Obj_Speed_Y(A1), A1                              ; $0012
Offset_0x00CCF0:
                dbra    D2, Offset_0x00CCD0
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                moveq   #$00, D3
                move.b  Obj_Control_Var_13(A0), D3                       ; $003F
                addq.b  #$01, D3
                sub.b   D0, D3
                neg.b   D3
                bmi.s   Offset_0x00CD3A
                move.w  D3, D2
                lsl.w   #$04, D3
                lea     $00(A4, D3), A3
                adda.w  D2, A3
                subq.w  #$01, D2
                bcs.s   Offset_0x00CD3A
Offset_0x00CD16:
                moveq   #$00, D0
                move.b  -(A3), D0
                addq.w  #$01, D0
                mulu.w  D5, D0
                mulu.w  D4, D0
                swap.w  D0
                add.w   Obj_Control_Var_10(A0), D0                       ; $003C
                move.w  D0, (A1)
                addq.w  #$06, A1
                cmpa.w  A2, A1
                bne.s   Offset_0x00CD36
                move.l  Obj_Control_Var_08(A0), A1                       ; $0034
                lea     Obj_Speed_Y(A1), A1                              ; $0012
Offset_0x00CD36:
                dbra    D2, Offset_0x00CD16
Offset_0x00CD3A:
                rts
;-------------------------------------------------------------------------------
Offset_0x00CD3C:
                dc.b    $02, $04, $06, $08, $08, $06, $04, $02, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $08, $06, $04, $02, $00, $00, $00, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0A, $08, $06, $04, $02, $00, $00, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0A, $08, $06, $04, $02, $00, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0C, $0A, $08, $06, $04, $02, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0E, $0C, $0A, $08, $06, $04, $02, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0E, $0E, $0C, $0A, $08, $06, $04, $02, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0E, $10, $0E, $0C, $0A, $08, $06, $04, $02, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0E, $10, $10, $0E, $0C, $0A, $08, $06, $04, $02
;-------------------------------------------------------------------------------
Offset_0x00CDCC:  
                dc.b    $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $B5, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $7E, $DB, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $61, $B5, $EC, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $4A, $93, $CD, $F3, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $3E, $7E, $B0, $DB, $F6, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $38, $6D, $9D, $C5, $E4, $F8, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $31, $61, $8E, $B5, $D4, $EC, $FB, $FF, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $2B, $56, $7E, $A2, $C1, $DB, $EE, $FB, $FF, $00, $00, $00, $00, $00, $00, $00
                dc.b    $25, $4A, $73, $93, $B0, $CD, $E1, $F3, $FC, $FF, $00, $00, $00, $00, $00, $00
                dc.b    $1F, $44, $67, $88, $A7, $BD, $D4, $E7, $F4, $FD, $FF, $00, $00, $00, $00, $00
                dc.b    $1F, $3E, $5C, $7E, $98, $B0, $C9, $DB, $EA, $F6, $FD, $FF, $00, $00, $00, $00
                dc.b    $19, $38, $56, $73, $8E, $A7, $BD, $D1, $E1, $EE, $F8, $FE, $FF, $00, $00, $00
                dc.b    $19, $38, $50, $6D, $83, $9D, $B0, $C5, $D8, $E4, $F1, $F8, $FE, $FF, $00, $00
                dc.b    $19, $31, $4A, $67, $7E, $93, $A7, $BD, $CD, $DB, $E7, $F3, $F9, $FE, $FF, $00
                dc.b    $19, $31, $4A, $61, $78, $8E, $A2, $B5, $C5, $D4, $E1, $EC, $F4, $FB, $FE, $FF
;-------------------------------------------------------------------------------
HPz_Bridge_Mappings:                                           ; Offset_0x00CECC                
                dc.w    Offset_0x00CED8-HPz_Bridge_Mappings
                dc.w    Offset_0x00CEE2-HPz_Bridge_Mappings
                dc.w    Offset_0x00CEEC-HPz_Bridge_Mappings
                dc.w    Offset_0x00CEF6-HPz_Bridge_Mappings
                dc.w    Offset_0x00CF00-HPz_Bridge_Mappings
                dc.w    Offset_0x00CF0A-HPz_Bridge_Mappings
Offset_0x00CED8:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x00CEE2:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x00CEEC:
                dc.w    $0001
                dc.l    $F8050008, $0004FFF8
Offset_0x00CEF6:
                dc.w    $0001
                dc.l    $F402000C, $0006FFFC
Offset_0x00CF00:
                dc.w    $0001
                dc.l    $F402000F, $0007FFFC
Offset_0x00CF0A:
                dc.w    $0001
                dc.l    $F4020012, $0009FFFC
;-------------------------------------------------------------------------------    
GHz_Bridge_Mappings:                                           ; Offset_0x00CF14
                dc.w    Offset_0x00CF18-GHz_Bridge_Mappings
                dc.w    Offset_0x00CF22-GHz_Bridge_Mappings
Offset_0x00CF18:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x00CF22:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8                                                            
;===============================================================================
; Objeto 0x11 - Pontes na Emerald Hill / Hidden Palace
; <<<- 
;===============================================================================