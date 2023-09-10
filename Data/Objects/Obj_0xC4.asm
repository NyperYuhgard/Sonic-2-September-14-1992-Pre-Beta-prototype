;===============================================================================
; Objeto 0xC4 - Fumaça saindo do Tornado ao ser atingido pelo laser no início da
; ->>>          Sky Fortress
;===============================================================================     
; Offset_0x03629A:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0362A8(PC, D0), D1
                jmp     Offset_0x0362A8(PC, D1)         
;------------------------------------------------------------------------------- 
Offset_0x0362A8:
                dc.w    Offset_0x0362AC-Offset_0x0362A8
                dc.w    Offset_0x0362DA-Offset_0x0362A8
;-------------------------------------------------------------------------------     
Offset_0x0362AC:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                bsr     Jmp_05_To_PseudoRandomNumber           ; Offset_0x037626
                move.w  ($FFFFF636).w, D0
                andi.w  #$001C, D0
                sub.w   D0, Obj_X(A0)                                    ; $0008
                addi.w  #$0010, Obj_Y(A0)                                ; $000C
                move.w  #$FF00, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$FF00, Obj_Speed(A0)                            ; $0010
                rts
Offset_0x0362DA:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x0362F8
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$05, Obj_Map_Id(A0)                             ; $001A
                beq     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
Offset_0x0362F8:
                bra     Jmp_26_To_DisplaySprite                ; Offset_0x0375F6 
;-------------------------------------------------------------------------------  
Obj_0xC4_Ptr:                                                  ; Offset_0x0362FC
                dc.l    Object_Hit_Mappings                    ; Offset_0x01BBBE
                dc.w    $05A4
                dc.b    $04, $05, $0C, $00                                                    
;===============================================================================   
; Objeto 0xC4 - Fumaça saindo do Tornado ao ser atingido pelo laser no início da
; <<<-          Sky Fortress
;===============================================================================