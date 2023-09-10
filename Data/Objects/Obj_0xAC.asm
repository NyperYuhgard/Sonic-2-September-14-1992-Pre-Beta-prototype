;===============================================================================
; Objeto 0xAC - Inimigo Balkiry na Sky Chase
; ->>> 
;===============================================================================
; Offset_0x033758:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x033766(PC, D0), D1
                jmp     Offset_0x033766(PC, D1)   
Offset_0x033766:
                dc.w    Offset_0x03376A-Offset_0x033766
                dc.w    Offset_0x033794-Offset_0x033766    
Offset_0x03376A:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                move.w  #$FD00, Obj_Speed(A0)                            ; $0010
                bclr    #$01, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x033788
                move.w  #$FB00, Obj_Speed(A0)                            ; $0010
Offset_0x033788:
                lea     Balkiry_Animate_Data(PC), A1           ; Offset_0x031FAA
                move.l  A1, Obj_Control_Var_02(A0)                       ; $002E
                bra     Load_Enemy_Boost_Sub_Obj_0x9C          ; Offset_0x031F0C
Offset_0x033794:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bsr     Offset_0x030C20
                bra     Offset_0x030C32       
;-------------------------------------------------------------------------------
Obj_0xAC_Ptr:                                                  ; Offset_0x0337A0
                dc.l    Balkiry_Mappings                       ; Offset_0x0337AA
                dc.w    $0565
                dc.b    $04, $04, $20, $08    
;-------------------------------------------------------------------------------
Balkiry_Mappings:                                              ; Offset_0x0337AA
                dc.w    Offset_0x0337AE-Balkiry_Mappings
                dc.w    Offset_0x0337D0-Balkiry_Mappings
Offset_0x0337AE:
                dc.w    $0004
                dc.l    $F40D0000, $0000FFDC
                dc.l    $EC040008, $0004000C
                dc.l    $F40D000A, $0005FFFC
                dc.l    $04080012, $0009FFFC
Offset_0x0337D0:
                dc.w    $0005
                dc.l    $F40D0000, $0000FFDC
                dc.l    $EC040008, $0004000C
                dc.l    $F40D000A, $0005FFFC
                dc.l    $04080015, $000A000C
                dc.l    $0C000018, $000C001C            
;===============================================================================
; Objeto 0xAC - Inimigo Balkiry na Sky Chase
; <<<- 
;===============================================================================