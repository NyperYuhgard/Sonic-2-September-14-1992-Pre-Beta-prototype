;===============================================================================
; Objeto 0xBC - Turbinas do foguete do Robotnik na Sky Fortress
; ->>>
;===============================================================================     
; Offset_0x035B00:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035B0E(PC, D0), D1
                jmp     Offset_0x035B0E(PC, D1)              
;-------------------------------------------------------------------------------     
Offset_0x035B0E:
                dc.w    Offset_0x035B12-Offset_0x035B0E
                dc.w    Offset_0x035B16-Offset_0x035B0E
;-------------------------------------------------------------------------------   
Offset_0x035B12:
                bra     Object_Settings                        ; Offset_0x030A30
Offset_0x035B16:
                bchg    #00, Obj_Timer(A0)                               ; $002A
                beq     Return_to_sub_routine                  ; Offset_0x031E96
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608 
;-------------------------------------------------------------------------------    
Obj_0xBC_Ptr:                                                  ; Offset_0x035B24
                dc.l    Ship_Boost_Mappings                    ; Offset_0x035B2E
                dc.w    $C40E
                dc.b    $04, $04, $10, $00     
;-------------------------------------------------------------------------------  
Ship_Boost_Mappings:                                           ; Offset_0x035B2E
                dc.w    Offset_0x035B30-Ship_Boost_Mappings
Offset_0x035B30:
                dc.w    $0002
                dc.l    $F00D0000, $0000FFF0
                dc.l    $000D1000, $1000FFF0     
;===============================================================================   
; Objeto 0xBC - Turbinas do foguete do Robotnik na Sky Fortress
; <<<- 
;===============================================================================