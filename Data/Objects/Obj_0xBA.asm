;===============================================================================
; Objeto 0xBA - Rodas das esteiras na Sky Fortress
; ->>>
;===============================================================================
; Offset_0x035A90:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035A9E(PC, D0), D1
                jmp     Offset_0x035A9E(PC, D1)                 
;-------------------------------------------------------------------------------
Offset_0x035A9E:
                dc.w    Offset_0x035AA2-Offset_0x035A9E
                dc.w    Offset_0x035AA6-Offset_0x035A9E
;-------------------------------------------------------------------------------                
Offset_0x035AA2:
                bra     Object_Settings                        ; Offset_0x030A30
;-------------------------------------------------------------------------------                 
Offset_0x035AA6:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;-------------------------------------------------------------------------------
Obj_0xBA_Ptr:                                                  ; Offset_0x035AAA
                dc.l    Conveyor_Belt_Wheels_Mappings          ; Offset_0x035AB4
                dc.w    $C3EA
                dc.b    $04, $04, $10, $00     
;------------------------------------------------------------------------------- 
Conveyor_Belt_Wheels_Mappings:                                 ; Offset_0x035AB4
                dc.w    Offset_0x035AB6-Conveyor_Belt_Wheels_Mappings
Offset_0x035AB6:
                dc.w    $0001
                dc.l    $F00F0000, $0000FFF0                                                                                                       
;===============================================================================
; Objeto 0xBA - Rodas das esteiras na Sky Fortress
; <<<-
;===============================================================================