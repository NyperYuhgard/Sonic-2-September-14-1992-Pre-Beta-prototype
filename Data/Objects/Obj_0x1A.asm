;===============================================================================
; Objeto 0x1A - Plataformas que desmoronam na Hidden Palace / Oil Ocean
; ->>>
;===============================================================================
; Offset_0x00DB40:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00DB4E(PC, D0), D1
                jmp     Offset_0x00DB4E(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x00DB4E:
                dc.w    Offset_0x00DB54-Offset_0x00DB4E
                dc.w    Offset_0x00DC00-Offset_0x00DB4E
                dc.w    Offset_0x00DC38-Offset_0x00DB4E
;-------------------------------------------------------------------------------
Offset_0x00DB54:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Collapsing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00DEF0, $0004
                move.w  #$4000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$07, Obj_Control_Var_0C(A0)                     ; $0038
                move.b  Obj_Subtype(A0), Obj_Map_Id(A0)           ; $001A, $0028
                move.l  #Collapsing_Platforms_Data, Obj_Control_Var_08(A0) ; Offset_0x00DE76, $0034
                cmpi.b  #$08, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00DBBC
                move.l  #HPz_Collapsing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00E2A0, $0004
                move.w  #$434A, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$30, Obj_Width(A0)                              ; $0019
                move.l  #Offset_0x00E270, Obj_Control_Var_10(A0)               ; $003C
                move.l  #HPz_Collapsing_Platforms_Data, Obj_Control_Var_08(A0) ; Offset_0x00DE8F, $0034
                bra.s   Offset_0x00DC00
Offset_0x00DBBC:
                cmpi.b  #$0A, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00DBE6
                move.l  #OOz_Collapsing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00E34A, $0004
                move.w  #$639D, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$40, Obj_Width(A0)                              ; $0019
                move.l  #Offset_0x00E260, Obj_Control_Var_10(A0)               ; $003C
                bra.s   Offset_0x00DC00
Offset_0x00DBE6:
                move.l  #Offset_0x00DEC0, Obj_Control_Var_10(A0)               ; $003C
                move.b  #$34, Obj_Width(A0)                              ; $0019
                move.b  #$38, Obj_Height_2(A0)                           ; $0016
                bset    #$04, Obj_Flags(A0)                              ; $0001
;-------------------------------------------------------------------------------                
Offset_0x00DC00:
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                beq.s   Offset_0x00DC12
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq     Offset_0x00DDEC
                subq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
Offset_0x00DC12:
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x00DC22
                move.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
Offset_0x00DC22:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                move.l  Obj_Control_Var_10(A0), A2                       ; $003C
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Platform_Object_2                      ; Offset_0x014D5A
                bra     MarkObjGone                            ; Offset_0x011FBC
;-------------------------------------------------------------------------------                
Offset_0x00DC38:
                tst.b   Obj_Control_Var_0C(A0)                           ; $0038
                beq.s   Offset_0x00DC7C
                tst.b   Obj_Control_Var_0E(A0)                           ; $003A
                bne.s   Offset_0x00DC4C
                subq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00DC4C:
                bsr     Offset_0x00DC22
                subq.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                bne.s   Offset_0x00DC7A
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x00DC60
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x00DC60:
                btst    #$03, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x00DC7A
                bclr    #$03, Obj_Status(A1)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
                move.b  #$01, Obj_Ani_Flag(A1)                           ; $001D
Offset_0x00DC7A:
                rts
Offset_0x00DC7C:
                bsr     ObjectFall                             ; Offset_0x011F6A
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE                                         
;===============================================================================
; Objeto 0x1A - Plataformas que desmoronam na Hidden Palace / Oil Ocean
; <<<-
;===============================================================================