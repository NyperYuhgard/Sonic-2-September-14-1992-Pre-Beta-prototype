;===============================================================================
; Objeto 0x2F - Obstáculo quebravél no chão na Hill Top
; ->>>        
;===============================================================================     
; Offset_0x01DD70:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01DD7E(PC, D0), D1
                jmp     Offset_0x01DD7E(PC, D1)          
;-------------------------------------------------------------------------------
Offset_0x01DD7E:
                dc.w    Offset_0x01DD8E-Offset_0x01DD7E
                dc.w    Offset_0x01DDD8-Offset_0x01DD7E
                dc.w    Offset_0x01DF4C-Offset_0x01DD7E      
;-------------------------------------------------------------------------------
Offset_0x01DD84:
                dc.b    $24, $00, $20, $02, $18, $04, $10, $06
                dc.b    $08, $08                           
;-------------------------------------------------------------------------------
Offset_0x01DD8E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Breakable_Floor_Mappings, Obj_Map(A0) ; Offset_0x01E16A, $0004
                move.w  #$C000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_0A_To_ModifySpriteAttr_2P          ; Offset_0x01E334
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$001E, D0
                lea     Offset_0x01DD84(PC, D0), A2
                move.b  (A2)+, Obj_Height_2(A0)                          ; $0016
                move.b  (A2)+, Obj_Map_Id(A0)                            ; $001A
                move.b  #$20, Obj_Height_2(A0)                           ; $0016
                bset    #$04, Obj_Flags(A0)                              ; $0001
Offset_0x01DDD8:   
;-------------------------------------------------------------------------------
                move.w  ($FFFFF7D0).w, Obj_Control_Var_0C(A0)            ; $0038
                move.b  ($FFFFB01C).w, Obj_Control_Var_06(A0)            ; $0032
                move.b  ($FFFFB05C).w, Obj_Control_Var_07(A0)            ; $0033
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_00_To_SolidObject                  ; Offset_0x01E340
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                bne.s   Offset_0x01DE14
Offset_0x01DE10:
                bra     Jmp_07_To_MarkObjGone                  ; Offset_0x01E32E
Offset_0x01DE14:
                cmpi.b  #$18, D0
                bne.s   Offset_0x01DE78
                cmpi.b  #$02, Obj_Control_Var_06(A0)                     ; $0032
                bne.s   Offset_0x01DE30
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bmi.s   Offset_0x01DE60
                cmpi.b  #$0E, ($FFFFB03E).w
                beq.s   Offset_0x01DE60
Offset_0x01DE30:
                move.b  #$0C, ($FFFFB03E).w
                move.b  #$0D, ($FFFFB03F).w
                cmpi.b  #$02, Obj_Control_Var_07(A0)                     ; $0033
                bne.s   Offset_0x01DE52
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bmi.s   Offset_0x01DE60
                cmpi.b  #$0E, ($FFFFB07E).w
                beq.s   Offset_0x01DE60
Offset_0x01DE52:
                move.b  #$0C, ($FFFFB07E).w
                move.b  #$0D, ($FFFFB07F).w
                bra.s   Offset_0x01DE10
Offset_0x01DE60:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.b  Obj_Control_Var_06(A0), D0                       ; $0032
                bsr.s   Offset_0x01DEAE
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                move.b  Obj_Control_Var_07(A0), D0                       ; $0033
                bsr.s   Offset_0x01DEAE
                bra     Offset_0x01DF14
Offset_0x01DE78:
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x01DEE0
                cmpi.b  #$02, Obj_Control_Var_06(A0)                     ; $0032
                bne.s   Offset_0x01DE96
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bmi.s   Offset_0x01DEA6
                cmpi.b  #$0E, ($FFFFB03E).w
                beq.s   Offset_0x01DEA6
Offset_0x01DE96:
                move.b  #$0C, ($FFFFB03E).w
                move.b  #$0D, ($FFFFB03F).w
                bra     Offset_0x01DE10
Offset_0x01DEA6:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x01DEB4
                bra.s   Offset_0x01DF14
Offset_0x01DEAE:
                cmpi.b  #$02, D0
                bne.s   Offset_0x01DECC
Offset_0x01DEB4:
                bset    #$02, Obj_Status(A1)                             ; $0022
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
Offset_0x01DECC:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                rts
Offset_0x01DEE0:
                andi.b  #$10, D0
                beq     Offset_0x01DE10
                cmpi.b  #$02, Obj_Control_Var_07(A0)                     ; $0033
                bne.s   Offset_0x01DEFE
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bmi.s   Offset_0x01DF0E
                cmpi.b  #$0E, ($FFFFB07E).w
                beq.s   Offset_0x01DF0E
Offset_0x01DEFE:
                move.b  #$0C, ($FFFFB07E).w
                move.b  #$0D, ($FFFFB07F).w
                bra     Offset_0x01DE10
Offset_0x01DF0E:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr.s   Offset_0x01DEB4
Offset_0x01DF14:
                move.w  Obj_Control_Var_0C(A0), ($FFFFF7D0).w            ; $0038
                andi.b  #$E7, Obj_Status(A0)                             ; $0022
                lea     (Offset_0x01DF62), A4
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                move.l  D0, D1
                add.w   D0, D0
                add.w   D0, D0
                lea     $00(A4, D0), A4
                neg.w   D1
                addi.w  #$0009, D1
                move.w  #$0018, D2
                bsr     Jmp_00_To_Smash_Object                 ; Offset_0x01E33A
                bsr     Offset_0x01E118   
;-------------------------------------------------------------------------------
Offset_0x01DF4C:
                bsr     Jmp_06_To_SpeedToPos                   ; Offset_0x01E346
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_08_To_DeleteObject                 ; Offset_0x01E322
                bra     Jmp_06_To_DisplaySprite                ; Offset_0x01E31C
;-------------------------------------------------------------------------------
Offset_0x01DF62:
                dc.w    $FF00, $F800, $0100, $F800, $FF20, $F900, $00E0, $F900
                dc.w    $FF40, $FA00, $00C0, $FA00, $FF60, $FB00, $00A0, $FB00
                dc.w    $FF80, $FC00, $0080, $FC00                
;===============================================================================   
; Objeto 0x2F - Obstáculo quebravél no chão na Hill Top
; <<<-        
;===============================================================================