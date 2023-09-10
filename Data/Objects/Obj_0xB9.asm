;===============================================================================
; Objeto 0xB9 - Laser no início da Sky Fortress (Danifica o Tornado no início
; ->>>          da fase)
;===============================================================================
; Offset_0x035A02:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x035A10(PC, D0), D1
                jmp     Offset_0x035A10(PC, D1)         
;-------------------------------------------------------------------------------  
Offset_0x035A10:
                dc.w    Offset_0x035A16-Offset_0x035A10
                dc.w    Offset_0x035A1C-Offset_0x035A10
                dc.w    Offset_0x035A34-Offset_0x035A10
;------------------------------------------------------------------------------- 
Offset_0x035A16:
                bsr     Object_Settings                        ; Offset_0x030A30
                rts
;------------------------------------------------------------------------------- 
Offset_0x035A1C:
                tst.b   Obj_Flags(A0)                                    ; $0001
                bmi.s   Offset_0x035A26
                bra     Offset_0x035A3C
Offset_0x035A26:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$F000, Obj_Speed(A0)                            ; $0010
                bra     Offset_0x035A3C
;-------------------------------------------------------------------------------                
Offset_0x035A34:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Offset_0x035A3C
Offset_0x035A3C:
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  (Camera_X).w, D1                             ; $FFFFEE00
                subi.w  #$0040, D1
                cmp.w   D1, D0
                blt     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6   
;-------------------------------------------------------------------------------
Obj_0xB9_Ptr:                                                  ; Offset_0x035A52
                dc.l    Laser_Mappings                         ; Offset_0x035A5C
                dc.w    $C3C3
                dc.b    $04, $04, $60, $00       
;-------------------------------------------------------------------------------    
Laser_Mappings                                                 ; Offset_0x035A5C
                dc.w    Offset_0x035A5E-Laser_Mappings
Offset_0x035A5E:
                dc.w    $0006
                dc.l    $F8010000, $0000FFB8
                dc.l    $F80D0002, $0001FFC0
                dc.l    $F80D0002, $0001FFE0
                dc.l    $F80D0002, $00010000
                dc.l    $F80D0002, $00010020
                dc.l    $F8010800, $08000040                                                                                                                                   
;===============================================================================
; Objeto 0xB9 - Laser no início da Sky Fortress (Danifica o Tornado no início
; <<<-          da fase)
;===============================================================================