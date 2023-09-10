;===============================================================================
; Objeto 0xB8 - Canhão na Sky Fortress
; ->>> 
;===============================================================================
; Offset_0x0358B0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0358BE(PC, D0), D1
                jmp     Offset_0x0358BE(PC, D1)               
;-------------------------------------------------------------------------------
Offset_0x0358BE:
                dc.w    Offset_0x0358C4-Offset_0x0358BE
                dc.w    Offset_0x0358C8-Offset_0x0358BE
                dc.w    Offset_0x0358F2-Offset_0x0358BE
;-------------------------------------------------------------------------------  
Offset_0x0358C4:
                bra     Object_Settings                        ; Offset_0x030A30
;-------------------------------------------------------------------------------                 
Offset_0x0358C8:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl.s   Offset_0x0358E0
                bsr     Offset_0x030B18
                tst.w   D1
                beq.s   Offset_0x0358E0
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x0358E4
Offset_0x0358E0:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0358E4:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$0002, Obj_Timer(A0)                            ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0358F2:
                bsr     Offset_0x030B18
                moveq   #$00, D6
                addi.w  #$0020, D2
                cmpi.w  #$0040, D2
                bcs.s   Offset_0x035908
                move.w  D0, D6
                lsr.w   #$01, D6
                addq.w  #$01, D6
Offset_0x035908:
                move.b  D6, Obj_Map_Id(A0)                               ; $001A
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x03591C
                move.w  #$0040, Obj_Timer(A0)                            ; $002A
                bsr     Offset_0x035920
Offset_0x03591C:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x035920:
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x035970
                move.b  #$98, Obj_Id(A1)                                 ; $0000
                move.b  #$03, Obj_Map_Id(A1)                             ; $001A
                move.b  #$86, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                lea     Cannon_Weapon(PC), A2                  ; Offset_0x031BA4
                move.l  A2, Obj_Timer(A1)                                ; $002A
                moveq   #$00, D0
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                lsl.w   #$02, D0
                lea     Offset_0x035972(PC, D0), A2
                move.b  (A2)+, D0
                ext.w   D0
                add.w   D0, Obj_X(A1)                                    ; $0008
                move.b  (A2)+, D0
                ext.w   D0
                add.w   D0, Obj_Y(A1)                                    ; $000C
                move.b  (A2)+, Obj_Speed(A1)                             ; $0010
                move.b  (A2)+, Obj_Speed_Y(A1)                           ; $0012
Offset_0x035970:
                rts                                             
;-------------------------------------------------------------------------------
Offset_0x035972:
                dc.b    $00, $18, $00, $01, $EF, $10, $FF, $01
                dc.b    $11, $10, $01, $01
;-------------------------------------------------------------------------------   
Obj_0xB8_Ptr:                                                  ; Offset_0x03597E
                dc.l    SFz_Cannon_Mappings                    ; Offset_0x03598E
                dc.w    $03AB
                dc.b    $04, $04, $10, $86             
;-------------------------------------------------------------------------------                  
Cannon_Weapon_Animate_Data:                                    ; Offset_0x035988
                dc.w    Offset_0x03598A-Cannon_Weapon_Animate_Data
Offset_0x03598A:
                dc.b    $02, $03, $04, $FF 
;-------------------------------------------------------------------------------
SFz_Cannon_Mappings:                                           ; Offset_0x03598E
                dc.w    Offset_0x035998-SFz_Cannon_Mappings
                dc.w    Offset_0x0359BA-SFz_Cannon_Mappings
                dc.w    Offset_0x0359D4-SFz_Cannon_Mappings
                dc.w    Offset_0x0359EE-SFz_Cannon_Mappings
                dc.w    Offset_0x0359F8-SFz_Cannon_Mappings
Offset_0x035998:
                dc.w    $0004
                dc.l    $F007E000, $E000FFF0
                dc.l    $F007E008, $E0040000
                dc.l    $0E00E010, $E008FFF8
                dc.l    $0E00E011, $E0080000
Offset_0x0359BA:
                dc.w    $0003
                dc.l    $F007E000, $E000FFF0
                dc.l    $F007E008, $E0040000
                dc.l    $0405E012, $E009FFEB
Offset_0x0359D4:
                dc.w    $0003
                dc.l    $F007E000, $E000FFF0
                dc.l    $F007E008, $E0040000
                dc.l    $0405E812, $E8090005
Offset_0x0359EE:
                dc.w    $0001
                dc.l    $FC008016, $800BFFFC
Offset_0x0359F8:
                dc.w    $0001
                dc.l    $FC008017, $800BFFFC
;===============================================================================
; Objeto 0xB8 - Canhão na Sky Fortress
; <<<- 
;===============================================================================