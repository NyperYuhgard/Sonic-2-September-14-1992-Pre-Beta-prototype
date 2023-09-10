;===============================================================================
; Object 0x28 - Flickies (pássaros, esquilos) que aparecem ao destruir iminigos
; ->>> 
;=============================================================================== 
; Offset_0x00E97C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00E98A(PC, D0), D1
                jmp     Offset_0x00E98A(PC, D1)    
;-------------------------------------------------------------------------------
Offset_0x00E98A:
                dc.w    Offset_0x00EAAE-Offset_0x00E98A
                dc.w    Offset_0x00EBCE-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00EC64-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00EC64-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00EC64-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00EC28-Offset_0x00E98A
                dc.w    Offset_0x00ECE4-Offset_0x00E98A
                dc.w    Offset_0x00ED04-Offset_0x00E98A
                dc.w    Offset_0x00ED04-Offset_0x00E98A
                dc.w    Offset_0x00ED24-Offset_0x00E98A
                dc.w    Offset_0x00ED5E-Offset_0x00E98A
                dc.w    Offset_0x00EDB8-Offset_0x00E98A
                dc.w    Offset_0x00EDD6-Offset_0x00E98A
                dc.w    Offset_0x00EDB8-Offset_0x00E98A
                dc.w    Offset_0x00EDD6-Offset_0x00E98A
                dc.w    Offset_0x00EDB8-Offset_0x00E98A
                dc.w    Offset_0x00EE14-Offset_0x00E98A
                dc.w    Offset_0x00ED7A-Offset_0x00E98A     
;-------------------------------------------------------------------------------
Offset_0x00E9BE:
                dc.b    $06, $05  ; GHz
                dc.b    $06, $05  ; Lvl 1
                dc.b    $06, $05  ; Wz
                dc.b    $06, $05  ; Lvl 3
                dc.b    $09, $07  ; Mz
                dc.b    $09, $07  ; Mz
                dc.b    $09, $07  ; SFz
                dc.b    $09, $07  ; HTz
                dc.b    $08, $03  ; HPz
                dc.b    $08, $03  ; Lvl 9
                dc.b    $02, $03  ; OOz
                dc.b    $08, $01  ; DHz
                dc.b    $0B, $05  ; CNz
                dc.b    $00, $07  ; CPz
                dc.b    $04, $01  ; DEz
                dc.b    $02, $05  ; NGHz
                dc.b    $0A, $01  ; SCz
;------------------------------------------------------------------------------- 
Offset_0x00E9E0:
                dc.w    $FE00, $FC00
                dc.l    Flickies_Mappings_04                   ; Offset_0x00EF9C
                dc.w    $FE00, $FD00
                dc.l    Flickies_Mappings                      ; Offset_0x00EF0C
                dc.w    $FE80, $FD00
                dc.l    Flickies_Mappings_04                   ; Offset_0x00EF9C
                dc.w    $FEC0, $FE80
                dc.l    Flickies_Mappings_03                   ; Offset_0x00EF78
                dc.w    $FE40, $FD00
                dc.l    Flickies_Mappings_02                   ; Offset_0x00EF54
                dc.w    $FD00, $FC00
                dc.l    Flickies_Mappings                      ; Offset_0x00EF0C
                dc.w    $FD80, $FC80
                dc.l    Flickies_Mappings_01                   ; Offset_0x00EF30
                dc.w    $FD80, $FD00
                dc.l    Flickies_Mappings                      ; Offset_0x00EF0C
                dc.w    $FE00, $FC80
                dc.l    Flickies_Mappings_01                   ; Offset_0x00EF30
                dc.w    $FD40, $FD00
                dc.l    Flickies_Mappings_01                   ; Offset_0x00EF30
                dc.w    $FEC0, $FE00
                dc.l    Flickies_Mappings_01                   ; Offset_0x00EF30
                dc.w    $FE00, $FD00
                dc.l    Flickies_Mappings_01                   ; Offset_0x00EF30   
;-------------------------------------------------------------------------------
Offset_0x00EA40:
                dc.w    $FBC0, $FC00
                dc.w    $FBC0, $FC00
                dc.w    $FBC0, $FC00
                dc.w    $FD00, $FC00
                dc.w    $FD00, $FC00
                dc.w    $FE80, $FD00
                dc.w    $FE80, $FD00
                dc.w    $FEC0, $FE80
                dc.w    $FE40, $FD00
                dc.w    $FE00, $FD00
                dc.w    $FD80, $FC80        
;-------------------------------------------------------------------------------
Offset_0x00EA6C:
                dc.l    Flickies_Mappings                      ; Offset_0x00EF0C
                dc.l    Flickies_Mappings                      ; Offset_0x00EF0C
                dc.l    Flickies_Mappings                      ; Offset_0x00EF0C
                dc.l    Flickies_Mappings_04                   ; Offset_0x00EF9C
                dc.l    Flickies_Mappings_04                   ; Offset_0x00EF9C
                dc.l    Flickies_Mappings_04                   ; Offset_0x00EF9C
                dc.l    Flickies_Mappings_04                   ; Offset_0x00EF9C
                dc.l    Flickies_Mappings_03                   ; Offset_0x00EF78
                dc.l    Flickies_Mappings_02                   ; Offset_0x00EF54
                dc.l    Flickies_Mappings                      ; Offset_0x00EF0C
                dc.l    Flickies_Mappings_01                   ; Offset_0x00EF30  
;-------------------------------------------------------------------------------
Offset_0x00EA98:
                dc.w    $05A5
                dc.w    $05A5
                dc.w    $05A5
                dc.w    $0553
                dc.w    $0553
                dc.w    $0573
                dc.w    $0573
                dc.w    $0585
                dc.w    $0593
                dc.w    $0565
                dc.w    $05B3
;-------------------------------------------------------------------------------  
Offset_0x00EAAE:
                tst.b   Obj_Subtype(A0)                                  ; $0028
                beq     Offset_0x00EB1C
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                add.w   D0, D0
                move.b  D0, Obj_Routine(A0)                              ; $0024
                subi.w  #$0014, D0
                move.w  Offset_0x00EA98(PC, D0), Obj_Art_VRAM(A0)        ; $0002
                add.w   D0, D0
                move.l  Offset_0x00EA6C(PC, D0), Obj_Map(A0)             ; $0004
                lea     Offset_0x00EA40(PC), A1
                move.w  $00(A1, D0), Obj_Control_Var_06(A0)              ; $0032
                move.w  $00(A1, D0), Obj_Speed(A0)                       ; $0010
                move.w  $02(A1, D0), Obj_Control_Var_08(A0)              ; $0034
                move.w  $02(A1, D0), Obj_Speed_Y(A0)                     ; $0012
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$0C, Obj_Height_2(A0)                           ; $0016
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                bset    #$00, Obj_Flags(A0)                              ; $0001
                move.b  #$06, Obj_Priority(A0)                           ; $0018
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00EB1C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Jmp_00_To_PseudoRandomNumber           ; Offset_0x00F02C
                move.w  #$0580, Obj_Art_VRAM(A0)                         ; $0002
                andi.w  #$0001, D0
                beq.s   Offset_0x00EB36
                move.w  #$0594, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x00EB36:
                moveq   #$00, D1
                move.b  (Level_Id).w, D1                             ; $FFFFFE10
                add.w   D1, D1
                add.w   D0, D1
                lea     Offset_0x00E9BE(PC), A1
                move.b  $00(A1, D1), D0
                move.b  D0, Obj_Control_Var_04(A0)                       ; $0030
                lsl.w   #$03, D0
                lea     Offset_0x00E9E0(PC), A1
                adda.w  D0, A1
                move.w  (A1)+, Obj_Control_Var_06(A0)                    ; $0032
                move.w  (A1)+, Obj_Control_Var_08(A0)                    ; $0034
                move.l  (A1)+, Obj_Map(A0)                               ; $0004
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$0C, Obj_Height_2(A0)                           ; $0016
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                bset    #$00, Obj_Flags(A0)                              ; $0001
                move.b  #$06, Obj_Priority(A0)                           ; $0018
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                move.b  #$02, Obj_Map_Id(A0)                             ; $001A
                move.w  #$FC00, Obj_Speed_Y(A0)                          ; $0012
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x00EBC0
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne.s   Offset_0x00EBBC
                move.b  #$29, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_Control_Var_12(A0), D0                       ; $003E
                lsr.w   #$01, D0
                move.b  D0, Obj_Map_Id(A1)                               ; $001A
Offset_0x00EBBC:
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00EBC0:
                move.b  #$1C, Obj_Routine(A0)                            ; $0024
                clr.w   Obj_Speed(A0)                                    ; $0010
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x00EBCE:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     DeleteObject                           ; Offset_0x0120D0
                bsr     ObjectFall                             ; Offset_0x011F6A
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x00EC24
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x00EC24
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_06(A0), Obj_Speed(A0)     ; $0010, $0032
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                move.b  Obj_Control_Var_04(A0), D0                       ; $0030
                add.b   D0, D0
                addq.b  #$04, D0
                move.b  D0, Obj_Routine(A0)                              ; $0024
                tst.b   ($FFFFF7A7).w
                beq.s   Offset_0x00EC24
                btst    #$04, ($FFFFFE0F).w
                beq.s   Offset_0x00EC24
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x00EC24:
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x00EC28:
                bsr     ObjectFall                             ; Offset_0x011F6A
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x00EC52
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x00EC52
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
Offset_0x00EC52:
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bne.s   Offset_0x00ECC8
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x00EC64:
                bsr     SpeedToPos                             ; Offset_0x011F96
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x00ECA0
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x00ECA0
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
                tst.b   Obj_Subtype(A0)                                  ; $0028
                beq.s   Offset_0x00ECA0
                cmpi.b  #$0A, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x00ECA0
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x00ECA0:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x00ECB6
                move.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                andi.b  #$01, Obj_Map_Id(A0)                             ; $001A
Offset_0x00ECB6:
                tst.b   Obj_Subtype(A0)                                  ; $0028
                bne.s   Offset_0x00ECC8
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00ECC8:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                bcs.s   Offset_0x00ECE0
                subi.w  #$0180, D0
                bpl.s   Offset_0x00ECE0
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     DeleteObject                           ; Offset_0x0120D0
Offset_0x00ECE0:
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x00ECE4:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     DeleteObject                           ; Offset_0x0120D0
                subq.w  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bne     Offset_0x00ED00
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$03, Obj_Priority(A0)                           ; $0018
Offset_0x00ED00:
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x00ED04:
                bsr     Offset_0x00EEA8
                bcc.s   Offset_0x00ED20
                move.w  Obj_Control_Var_06(A0), Obj_Speed(A0)     ; $0010, $0032
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
                move.b  #$0E, Obj_Routine(A0)                            ; $0024
                bra     Offset_0x00EC64
Offset_0x00ED20:
                bra     Offset_0x00ECC8
;-------------------------------------------------------------------------------                
Offset_0x00ED24:
                bsr     Offset_0x00EEA8
                bpl.s   Offset_0x00ED5A
                clr.w   Obj_Speed(A0)                                    ; $0010
                clr.w   Obj_Control_Var_06(A0)                           ; $0032
                bsr     SpeedToPos                             ; Offset_0x011F96
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                bsr     Offset_0x00EE68
                bsr     Offset_0x00EE90
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x00ED5A
                move.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                andi.b  #$01, Obj_Map_Id(A0)                             ; $001A
Offset_0x00ED5A:
                bra     Offset_0x00ECC8
;-------------------------------------------------------------------------------                
Offset_0x00ED5E:
                bsr     Offset_0x00EEA8
                bpl.s   Offset_0x00EDB4
                move.w  Obj_Control_Var_06(A0), Obj_Speed(A0)     ; $0010, $0032
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                bra     Offset_0x00EC28
;-------------------------------------------------------------------------------                
Offset_0x00ED7A:
                bsr     ObjectFall                             ; Offset_0x011F6A
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x00EDB4
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x00EDB4
                not.b   Obj_Player_Flip_Flag(A0)                         ; $0029
                bne.s   Offset_0x00EDAA
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x00EDAA:
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
Offset_0x00EDB4:
                bra     Offset_0x00ECC8
;-------------------------------------------------------------------------------                
Offset_0x00EDB8:
                bsr     Offset_0x00EEA8
                bpl.s   Offset_0x00EDD2
                clr.w   Obj_Speed(A0)                                    ; $0010
                clr.w   Obj_Control_Var_06(A0)                           ; $0032
                bsr     ObjectFall                             ; Offset_0x011F6A
                bsr     Offset_0x00EE68
                bsr     Offset_0x00EE90
Offset_0x00EDD2:
                bra     Offset_0x00ECC8
;-------------------------------------------------------------------------------                
Offset_0x00EDD6:
                bsr     Offset_0x00EEA8
                bpl.s   Offset_0x00EE10
                bsr     ObjectFall                             ; Offset_0x011F6A
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x00EE10
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x00EE10
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Flags(A0)                               ; $0001
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
Offset_0x00EE10:
                bra     Offset_0x00ECC8
;-------------------------------------------------------------------------------                
Offset_0x00EE14:
                bsr     Offset_0x00EEA8
                bpl.s   Offset_0x00EE64
                bsr     SpeedToPos                             ; Offset_0x011F96
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x00EE4E
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x00EE4E
                not.b   Obj_Player_Flip_Flag(A0)                         ; $0029
                bne.s   Offset_0x00EE44
                neg.w   Obj_Speed(A0)                                    ; $0010
                bchg    #00, Obj_Flags(A0)                               ; $0001
Offset_0x00EE44:
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
Offset_0x00EE4E:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x00EE64
                move.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                andi.b  #$01, Obj_Map_Id(A0)                             ; $001A
Offset_0x00EE64:
                bra     Offset_0x00ECC8
Offset_0x00EE68:
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                tst.w   Obj_Speed_Y(A0)                                  ; $0012
                bmi.s   Offset_0x00EE8E
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x00EE8E
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_08(A0), Obj_Speed_Y(A0)   ; $0012, $0034
Offset_0x00EE8E:
                rts
Offset_0x00EE90:
                bset    #$00, Obj_Flags(A0)                              ; $0001
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                bcc.s   Offset_0x00EEA6
                bclr    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x00EEA6:
                rts
Offset_0x00EEA8:
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                subi.w  #$00B8, D0
                rts                                                                                                                                                                
;===============================================================================
; Object 0x28 - Flickies (pássaros, esquilos) que aparecem ao destruir iminigos
; <<<- 
;===============================================================================