;===============================================================================
; Objeto 0xBE - Escotilhas que abrem e fecham na Sky Fortress
; ->>>
;===============================================================================
; Offset_0x035C82:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035C90(PC, D0), D1
                jmp     Offset_0x035C90(PC, D1)  
;-------------------------------------------------------------------------------
Offset_0x035C90:
                dc.w    Offset_0x035C98-Offset_0x035C90
                dc.w    Offset_0x035CA0-Offset_0x035C90
                dc.w    Offset_0x035CB6-Offset_0x035C90
                dc.w    Offset_0x035CC8-Offset_0x035C90
;-------------------------------------------------------------------------------     
Offset_0x035C98:
                bsr     Object_Settings                        ; Offset_0x030A30
                bra     Offset_0x0356C0
;-------------------------------------------------------------------------------
Offset_0x035CA0:
                subq.w  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x035CAA
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x035CAA:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                clr.b   Obj_Ani_Number(A0)                               ; $001C
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                
Offset_0x035CB6:
                bsr     Offset_0x035CD8
                lea     (Hatchway_Animate_Data), A1            ; Offset_0x035D0A
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                
Offset_0x035CC8:
                move.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$00C0, Obj_Timer(A0)                            ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x035CD8:
                move.b  Obj_Map_Id(A0), D0                               ; $001A
                cmpi.b  #$03, D0
                beq.s   Offset_0x035CEA
                cmpi.b  #$04, D0
                bne     Offset_0x035704
Offset_0x035CEA:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                move.w  #$0023, D1
                move.w  #$0018, D2
                move.w  #$0019, D3
                move.w  (A7)+, D4
                bra     Jmp_04_To_Platform_Object              ; Offset_0x037644  
;-------------------------------------------------------------------------------  
Obj_0xBE_Ptr:                                                  ; Offset_0x035D00
                dc.l    Hatchway_Mappings                      ; Offset_0x035D22
                dc.w    $E422
                dc.b    $04, $04, $18, $00
;-------------------------------------------------------------------------------
Hatchway_Animate_Data:                                         ; Offset_0x035D0A
                dc.w    Offset_0x035D10-Hatchway_Animate_Data
                dc.w    Offset_0x035D18-Hatchway_Animate_Data
                dc.w    Offset_0x035D1C-Hatchway_Animate_Data
Offset_0x035D10:
                dc.b    $05, $00, $01, $02, $03, $FD, $01, $00
Offset_0x035D18:
                dc.b    $7E, $04, $FD, $02
Offset_0x035D1C:
                dc.b    $05, $03, $02, $01, $00, $FC        
;-------------------------------------------------------------------------------     
Hatchway_Mappings:                                             ; Offset_0x035D22
                dc.w    Offset_0x035D2C-Hatchway_Mappings
                dc.w    Offset_0x035D3E-Hatchway_Mappings
                dc.w    Offset_0x035D50-Hatchway_Mappings
                dc.w    Offset_0x035D62-Hatchway_Mappings
                dc.w    Offset_0x035D74-Hatchway_Mappings
Offset_0x035D2C:
                dc.w    $0002
                dc.l    $E8090000, $0000FFE8
                dc.l    $E8090006, $00030000
Offset_0x035D3E:
                dc.w    $0002
                dc.l    $E809000C, $0006FFE8
                dc.l    $E8090012, $00090000
Offset_0x035D50:
                dc.w    $0002
                dc.l    $E8090018, $000CFFE8
                dc.l    $E8090818, $080C0000
Offset_0x035D62:
                dc.w    $0002
                dc.l    $E80E001E, $000FFFE0
                dc.l    $E80E081E, $080F0000
Offset_0x035D74:
                dc.w    $0002
                dc.l    $E80E002A, $0015FFE0
                dc.l    $E80E082A, $08150000                                                                                                   
;===============================================================================
; Objeto 0xBE - Escotilhas que abrem e fecham na Sky Fortress
; <<<-
;===============================================================================