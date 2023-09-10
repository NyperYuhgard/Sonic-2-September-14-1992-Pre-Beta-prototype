;===============================================================================
; Objeto 0xAE - Galo do inimigo Clucker na Sky Fortress
; ->>> 
;===============================================================================
; Offset_0x033830:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03383E(PC, D0), D1
                jmp     Offset_0x03383E(PC, D1)
;-------------------------------------------------------------------------------    
Offset_0x03383E:
                dc.w    Offset_0x03384C-Offset_0x03383E
                dc.w    Offset_0x033866-Offset_0x03383E
                dc.w    Offset_0x033880-Offset_0x03383E
                dc.w    Offset_0x0338B0-Offset_0x03383E
                dc.w    Offset_0x0338BE-Offset_0x03383E
                dc.w    Offset_0x0338E6-Offset_0x03383E
                dc.w    Offset_0x0338F4-Offset_0x03383E    
;-------------------------------------------------------------------------------    
Offset_0x03384C:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$15, Obj_Map_Id(A0)                             ; $001A
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x033864
                bset    #$00, Obj_Status(A0)                             ; $0022
Offset_0x033864:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x033866:
                bsr     Offset_0x030B18
                addi.w  #$0080, D2
                cmpi.w  #$0100, D2
                bcs.s   Offset_0x033878
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x033878:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x033880:
                move.b  Obj_Routine(A0), D2                              ; $0024
                lea     (Clucker_Animate_Data), A1             ; Offset_0x033968
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                cmp.b   Obj_Routine(A0), D2                              ; $0024
                bne.s   Offset_0x033898
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x033898:
                lea     Obj_Map_Id(A0), A1                               ; $001A
                clr.l   (A1)
                clr.w   Obj_Map(A1)                                      ; $0004
                move.b  #$08, (A1)
                move.b  #$06, Obj_Col_Flags(A0)                          ; $0020
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0338B0:
                lea     (Clucker_Animate_Data_01), A1          ; Offset_0x033974
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0338BE:
                tst.b   Obj_Timer(A0)                                    ; $002A
                beq.s   Offset_0x0338CC
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0338CC:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                lea     Obj_Map_Id(A0), A1                               ; $001A
                clr.l   (A1)
                clr.w   Obj_Map(A1)                                      ; $0004
                move.b  #$0B, (A1)
                bsr     Load_Clucker_Weapon                    ; Offset_0x033904
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0338E6:
                lea     (Clucker_Animate_Data_02), A1          ; Offset_0x033980
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0338F4:
                move.b  #$08, Obj_Routine(A0)                            ; $0024
                move.b  #$40, Obj_Timer(A0)                              ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------
Load_Clucker_Weapon:                                           ; Offset_0x033904
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x033952
                move.b  #$98, Obj_Id(A1)                                 ; $0000
                move.b  #$0D, Obj_Map_Id(A1)                             ; $001A
                move.b  #$46, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$000B, Obj_Y(A1)                                ; $000C
                move.w  #$FE00, D0
                move.w  #$FFF8, D1
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x033942
                neg.w   D0
                neg.w   D1
Offset_0x033942:
                move.w  D0, Obj_Speed(A1)                                ; $0010
                add.w   D1, Obj_X(A1)                                    ; $0008
                lea     Clucker_Weapon(PC), A2                 ; Offset_0x031B82
                move.l  A2, Obj_Timer(A1)                                ; $002A
Offset_0x033952:
                rts
;-------------------------------------------------------------------------------
Obj_0xAD_Ptr:                                                  ; Offset_0x033954
                dc.l    Clucker_Mappings                       ; Offset_0x033992
                dc.w    $0379
                dc.b    $04, $04, $18, $00       
;-------------------------------------------------------------------------------
Obj_0xAE_Ptr:                                                  ; Offset_0x03395E
                dc.l    Clucker_Mappings                       ; Offset_0x033992
                dc.w    $0379
                dc.b    $04, $05, $10, $00
;-------------------------------------------------------------------------------
Clucker_Animate_Data:                                          ; Offset_0x033968
                dc.w    Offset_0x03396A-Clucker_Animate_Data
Offset_0x03396A:
                dc.b    $01, $00, $01, $02, $03, $04, $05, $06
                dc.b    $07, $FC     
;-------------------------------------------------------------------------------
Clucker_Animate_Data_01:                                       ; Offset_0x033974
                dc.w    Offset_0x033976-Clucker_Animate_Data_01
Offset_0x033976:
                dc.b    $01, $08, $09, $0A, $0B, $0B, $0B, $0B
                dc.b    $FC, $00
;-------------------------------------------------------------------------------
Clucker_Animate_Data_02:                                       ; Offset_0x033980
                dc.w    Offset_0x033982-Clucker_Animate_Data_02   
Offset_0x033982:
                dc.b    $03, $0A, $0B, $FC
;------------------------------------------------------------------------------- 
Clucker_Weapon_Animate_Data:                                   ; Offset_0x033986
                dc.w    Offset_0x033988-Clucker_Weapon_Animate_Data
Offset_0x033988:
                dc.b    $03, $0D, $0E, $0F, $10, $11, $12, $13
                dc.b    $14, $FF 
;-------------------------------------------------------------------------------    
Clucker_Mappings:                                              ; Offset_0x033992
                dc.w    Offset_0x0339BE-Clucker_Mappings
                dc.w    Offset_0x0339C8-Clucker_Mappings
                dc.w    Offset_0x0339D2-Clucker_Mappings
                dc.w    Offset_0x0339DC-Clucker_Mappings
                dc.w    Offset_0x0339EE-Clucker_Mappings
                dc.w    Offset_0x033A00-Clucker_Mappings
                dc.w    Offset_0x033A12-Clucker_Mappings
                dc.w    Offset_0x033A24-Clucker_Mappings
                dc.w    Offset_0x033A36-Clucker_Mappings
                dc.w    Offset_0x033A50-Clucker_Mappings
                dc.w    Offset_0x033A6A-Clucker_Mappings
                dc.w    Offset_0x033A84-Clucker_Mappings
                dc.w    Offset_0x033A9E-Clucker_Mappings
                dc.w    Offset_0x033AB0-Clucker_Mappings
                dc.w    Offset_0x033ABA-Clucker_Mappings
                dc.w    Offset_0x033AC4-Clucker_Mappings
                dc.w    Offset_0x033ACE-Clucker_Mappings
                dc.w    Offset_0x033AD8-Clucker_Mappings
                dc.w    Offset_0x033AE2-Clucker_Mappings
                dc.w    Offset_0x033AEC-Clucker_Mappings
                dc.w    Offset_0x033AF6-Clucker_Mappings
                dc.w    Offset_0x033B00-Clucker_Mappings
Offset_0x0339BE:
                dc.w    $0001
                dc.l    $0C0D2000, $2000FFF0
Offset_0x0339C8:
                dc.w    $0001
                dc.l    $080D2000, $2000FFF0
Offset_0x0339D2:
                dc.w    $0001
                dc.l    $040D2000, $2000FFF0
Offset_0x0339DC:
                dc.w    $0002
                dc.l    $000D2000, $2000FFF0
                dc.l    $100D2008, $2004FFF0
Offset_0x0339EE:
                dc.w    $0002
                dc.l    $FC0D2000, $2000FFF0
                dc.l    $0C0D2008, $2004FFF0
Offset_0x033A00:
                dc.w    $0002
                dc.l    $F80D2000, $2000FFF0
                dc.l    $080D2008, $2004FFF0
Offset_0x033A12:
                dc.w    $0002
                dc.l    $F40D2000, $2000FFF0
                dc.l    $040D2008, $2004FFF0
Offset_0x033A24:
                dc.w    $0002
                dc.l    $F00D2000, $2000FFF0
                dc.l    $000D2008, $2004FFF0
Offset_0x033A36:
                dc.w    $0003
                dc.l    $F00D2000, $2000FFF0
                dc.l    $000D2008, $2004FFF0
                dc.l    $07002010, $2008FFEE
Offset_0x033A50:
                dc.w    $0003
                dc.l    $F00D2000, $2000FFF0
                dc.l    $000D2008, $2004FFF0
                dc.l    $07002010, $2008FFEC
Offset_0x033A6A:
                dc.w    $0003
                dc.l    $F00D2000, $2000FFF0
                dc.l    $000D2008, $2004FFF0
                dc.l    $07002010, $2008FFEA
Offset_0x033A84:
                dc.w    $0003
                dc.l    $F00D2000, $2000FFF0
                dc.l    $000D2008, $2004FFF0
                dc.l    $07002010, $2008FFE8
Offset_0x033A9E:
                dc.w    $0002
                dc.l    $F8096011, $6008FFE8
                dc.l    $F8096811, $68080000
Offset_0x033AB0:
                dc.w    $0001
                dc.l    $FC000017, $000BFFFC
Offset_0x033ABA:
                dc.w    $0001
                dc.l    $FC000018, $000CFFFC
Offset_0x033AC4:
                dc.w    $0001
                dc.l    $FC000019, $000CFFFC
Offset_0x033ACE:
                dc.w    $0001
                dc.l    $FC001018, $100CFFFC
Offset_0x033AD8:
                dc.w    $0001
                dc.l    $FC001017, $100BFFFC
Offset_0x033AE2:
                dc.w    $0001
                dc.l    $FC001818, $180CFFFC
Offset_0x033AEC:
                dc.w    $0001
                dc.l    $FC000819, $080CFFFC
Offset_0x033AF6:
                dc.w    $0001
                dc.l    $FC000818, $080CFFFC
Offset_0x033B00:
                dc.w    $0001
                dc.l    $100D2000, $2000FFF0
;===============================================================================
; Objeto 0xAE - Galo do inimigo Clucker na Sky Fortress
; <<<- 
;===============================================================================