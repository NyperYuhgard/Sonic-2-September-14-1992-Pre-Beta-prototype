;===============================================================================
; Objeto 0xB7 - Laser vertical largo na Sky Fortress não usado no jogo
; ->>>
;===============================================================================
; Offset_0x0357EE:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0357FC(PC, D0), D1
                jmp     Offset_0x0357FC(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x0357FC:
                dc.w    Offset_0x035800-Offset_0x0357FC
                dc.w    Offset_0x03580C-Offset_0x0357FC     
;-------------------------------------------------------------------------------    
Offset_0x035800:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$20, Obj_Timer(A0)                              ; $002A
                rts
;-------------------------------------------------------------------------------                  
Offset_0x03580C:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                beq     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bchg    #00, Obj_Player_Status(A0)                       ; $002B
                beq     Return_to_sub_routine                  ; Offset_0x031E96
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;-------------------------------------------------------------------------------   
Obj_0xB7_Ptr:                                                  ; Offset_0x035822
                dc.l    Vertical_Large_Laser_Mappings          ; Offset_0x03582C
                dc.w    $C39F
                dc.b    $04, $04, $18, $A9   
;-------------------------------------------------------------------------------
Vertical_Large_Laser_Mappings:                                 ; Offset_0x03582C
                dc.w    Offset_0x03582E-Vertical_Large_Laser_Mappings
Offset_0x03582E:
                dc.w    $0010
                dc.l    $900B0000, $0000FFE8
                dc.l    $900B0800, $08000000
                dc.l    $B00B0000, $0000FFE8
                dc.l    $B00B0800, $08000000
                dc.l    $D00B0000, $0000FFE8
                dc.l    $D00B0800, $08000000
                dc.l    $F00B0000, $0000FFE8
                dc.l    $F00B0800, $08000000
                dc.l    $100B0000, $0000FFE8
                dc.l    $100B0800, $08000000
                dc.l    $300B0000, $0000FFE8
                dc.l    $300B0800, $08000000
                dc.l    $500B0000, $0000FFE8
                dc.l    $500B0800, $08000000
                dc.l    $700B0000, $0000FFE8
                dc.l    $700B0800, $08000000                                                   
;===============================================================================
; Objeto 0xB7 - Laser vertical largo na Sky Fortress não usado no jogo
; <<<-
;===============================================================================