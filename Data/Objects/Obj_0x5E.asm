;===============================================================================
; Objeto 0x5E - Display na tela no Special Stage
; ->>>          ( Sonic Ring / Time / Miles Ring )
;===============================================================================  
; Offset_0x00907A:
                move.b  Obj_Routine(A0), D0                              ; $0024
                bne.s   Offset_0x0090A6
                move.w  #$0080, Obj_X(A0)                                ; $0008
                move.l  #SS_Head_Up_Display_Mappings, Obj_Map(A0) ; Offset_0x0090AC, $0004
                move.w  #$4237, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$01, Obj_Routine(A0)                            ; $0024
Offset_0x0090A6:
                bra     Jmp_00_To_DisplaySprite                ; Offset_0x009694    
                rts               
;-------------------------------------------------------------------------------
SS_Head_Up_Display_Mappings:                                   ; Offset_0x0090AC
                dc.w    Offset_0x0090AE-SS_Head_Up_Display_Mappings
Offset_0x0090AE:
                dc.w    $0007
                dc.l    $100C8000, $8000FFA0
                dc.l    $10008004, $8002FFC0
                dc.l    $100C8005, $80020038
                dc.l    $10008009, $80040058
                dc.l    $180D800A, $8005FF98
                dc.l    $180D800A, $80050030
                dc.l    $100F8012, $8009FFF0                                                                                      
;===============================================================================   
; Objeto 0x5E - Display na tela no Special Stage
; <<<-          ( Sonic Ring / Time / Miles Ring )
;===============================================================================