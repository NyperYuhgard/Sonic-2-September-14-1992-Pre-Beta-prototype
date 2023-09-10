;===============================================================================
; Objeto 0x1F - Plataformas que desmoronam na Dust Hill / Oil Ocean
; ->>>
;===============================================================================
; Offset_0x00DC8C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00DC9A(PC, D0), D1
                jmp     Offset_0x00DC9A(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x00DC9A:
                dc.w    Offset_0x00DCA0-Offset_0x00DC9A
                dc.w    Offset_0x00DD5A-Offset_0x00DC9A
                dc.w    Offset_0x00DD92-Offset_0x00DC9A
;-------------------------------------------------------------------------------
Offset_0x00DCA0:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Collapsing_Platforms_Mappings_2, Obj_Map(A0) ; Offset_0x00E190, $0004
                move.w  #$42B8, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$07, Obj_Control_Var_0C(A0)                     ; $0038
                move.b  #$44, Obj_Width(A0)                              ; $0019
                lea     (Collapsing_Platforms_2_Data), A4      ; Offset_0x00DE9B
                btst    #$00, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x00DCDE
                lea     (Collapsing_Platforms_2_Data_2), A4    ; Offset_0x00DEA3
Offset_0x00DCDE:
                move.l  A4, Obj_Control_Var_08(A0)                       ; $0034
                cmpi.b  #$0A, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00DD0A
                move.l  #OOz_Collapsing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00E34A, $0004
                move.w  #$639D, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$40, Obj_Width(A0)                              ; $0019
                move.l  #OOz_Collapsing_Platforms_Data, Obj_Control_Var_08(A0) ; Offset_0x00DEAB, $0034
Offset_0x00DD0A:
                cmpi.b  #$0B, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00DD32
                move.l  #DHz_Collapsing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00E38A, $0004
                move.w  #$63F4, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.l  #DHz_Collapsing_Platforms_Data, Obj_Control_Var_08(A0) ; Offset_0x00DEB2, $0034
Offset_0x00DD32:
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00DD5A
                move.l  #NGHz_Collapsing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00E3E2, $0004
                move.w  #$4000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.l  #NGHz_Collapsing_Platforms_Data, Obj_Control_Var_08(A0) ; Offset_0x00DEB8, $0034
Offset_0x00DD5A:
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                beq.s   Offset_0x00DD6C
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq     Offset_0x00DDE6
                subq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x00DD6C:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x00DD7C
                move.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
Offset_0x00DD7C:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                move.w  #$0010, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Platform_Object                        ; Offset_0x014D02
                bra     MarkObjGone                            ; Offset_0x011FBC
Offset_0x00DD92:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x00DDD6
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                bne.s   Offset_0x00DDA6
                subq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00DDA6:
                bsr     Offset_0x00DD7C
                subq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bne.s   Offset_0x00DDD4
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x00DDBA
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x00DDBA:
                btst    #$03, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x00DDD4
                bclr    #$03, Obj_Status(A1)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
                move.b  #$01, Obj_Ani_Flag(A1)                           ; $001D
Offset_0x00DDD4:
                rts
Offset_0x00DDD6:
                bsr     ObjectFall                             ; Offset_0x011F6A
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00DDE6:
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                bra.s   Offset_0x00DDF0
Offset_0x00DDEC:
                addq.b  #$02, Obj_Map_Id(A0)                             ; $001A
Offset_0x00DDF0:
                move.l  Obj_Control_Var_08(A0), A4                       ; $0034
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                add.w   D0, D0
                move.l  Obj_Map(A0), A3                                  ; $0004
                adda.w  $00(A3, D0), A3
                move.w  (A3)+, D1
                subq.w  #$01, D1
                bset    #$05, Obj_Flags(A0)                              ; $0001
                move.b  Obj_Id(A0), D4                                   ; $0000
                move.b  Obj_Flags(A0), D5                                ; $0001
                move.l  A0, A1
                bra.s   Offset_0x00DE22                
;-------------------------------------------------------------------------------
Offset_0x00DE1A:
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne.s   Offset_0x00DE68
                addq.w  #$08, A3
Offset_0x00DE22:
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.b  D4, Obj_Id(A1)                                   ; $0000
                move.l  A3, Obj_Map(A1)                                  ; $0004
                move.b  D5, Obj_Flags(A1)                                ; $0001
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  Obj_Priority(A0), Obj_Priority(A1)        ; $0018, $0018
                move.b  Obj_Width(A0), Obj_Width(A1)              ; $0019, $0019
                move.b  Obj_Height_2(A0), Obj_Height_2(A1)        ; $0016, $0016
                move.b  (A4)+, Obj_Control_Var_0C(A1)                    ; $0038
                cmpa.l  A0, A1
                bcc.s   Offset_0x00DE64
                bsr     DisplaySprite_A1                       ; Offset_0x0120FC
Offset_0x00DE64:
                dbra    D1, Offset_0x00DE1A
Offset_0x00DE68:
                bsr     DisplaySprite                          ; Offset_0x0120DE
                move.w  #$00B9, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912                     
;===============================================================================
; Objeto 0x1F - Plataformas que desmoronam na Dust Hill / Oil Ocean
; <<<-
;===============================================================================