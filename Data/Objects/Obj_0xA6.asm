;===============================================================================
; Object 0xA6 - Inimigo Lander na Chemical Plant
; ->>>        
;===============================================================================     
; Offset_0x032F6E:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x032F7C(PC, D0), D1
                jmp     Offset_0x032F7C(PC, D1)     
;-------------------------------------------------------------------------------    
Offset_0x032F7C:
                dc.w    Offset_0x032F82-Offset_0x032F7C
                dc.w    Offset_0x032F94-Offset_0x032F7C
                dc.w    Offset_0x032FE6-Offset_0x032F7C  
;-------------------------------------------------------------------------------   
Offset_0x032F82:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  #$FFC0, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0080, Obj_Timer(A0)                            ; $002A
                rts     
;------------------------------------------------------------------------------- 
Offset_0x032F94:
                tst.b   Obj_Player_Status(A0)                            ; $002B
                beq.s   Offset_0x032FA2
                subq.b  #$01, Obj_Player_Status(A0)                      ; $002B
                bra     Offset_0x032FB0
Offset_0x032FA2:
                bsr     Offset_0x030B18
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x032FD2
Offset_0x032FB0:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bne.s   Offset_0x032FC0
                move.w  #$0080, Obj_Timer(A0)                            ; $002A
                neg.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x032FC0:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                lea     (Vertical_Spiny_Animate_Data), A1      ; Offset_0x0330A6
                bsr     Jmp_1A_To_AnimateSprite                ; Offset_0x037620
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032FD2:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$28, Obj_Player_Status(A0)                      ; $002B
                move.b  #$05, Obj_Map_Id(A0)                             ; $001A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608  
;------------------------------------------------------------------------------- 
Offset_0x032FE6:
                subq.b  #$01, Obj_Player_Status(A0)                      ; $002B
                bmi.s   Offset_0x032FFC
                cmpi.b  #$14, Obj_Player_Status(A0)                      ; $002B
                bne.s   Offset_0x032FF8
                bsr     Load_Spiny_Vertical_Shot_Obj           ; Offset_0x033056
Offset_0x032FF8:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032FFC:
                subq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$40, Obj_Player_Status(A0)                      ; $002B
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                
Load_Spiny_Horizontal_Shot_Obj:                                ; Offset_0x03300A
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x033054
                move.b  #$98, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Map_Id(A1)                             ; $001A
                move.b  #$34, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  #$FD00, Obj_Speed_Y(A1)                          ; $0012
                move.w  #$0100, D1
                lea     (Obj_Memory_Address).w, A2                   ; $FFFFB000
                move.w  Obj_X(A0), D0                                    ; $0008
                cmp.w   Obj_X(A2), D0                                    ; $0008
                bcs.s   Offset_0x033048
                neg.w   D1
Offset_0x033048:
                move.w  D1, Obj_Speed(A1)                                ; $0010
                lea     Spiny_Weapon(PC), A2                   ; Offset_0x031B90
                move.l  A2, Obj_Timer(A1)                                ; $002A
Offset_0x033054:
                rts
;-------------------------------------------------------------------------------                
Load_Spiny_Vertical_Shot_Obj:                                  ; Offset_0x033056
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x033094
                move.b  #$98, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Map_Id(A1)                             ; $001A
                move.b  #$34, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  #$0300, D1
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x033088
                neg.w   D1
Offset_0x033088:
                move.w  D1, Obj_Speed(A1)                                ; $0010
                lea     Spiny_Weapon(PC), A2                   ; Offset_0x031B90
                move.l  A2, Obj_Timer(A1)                                ; $002A
Offset_0x033094:
                rts               
;-------------------------------------------------------------------------------     
Obj_0xA5_Ptr:                                                  ; Offset_0x033096
                dc.l    Spiny_Mappings                         ; Offset_0x0330B2
                dc.w    $252D
                dc.b    $04, $04, $08, $0B       
;-------------------------------------------------------------------------------  
Horizontal_Spiny_Animate_Data:                                 ; Offset_0x0330A0
                dc.w    Offset_0x0330A2-Horizontal_Spiny_Animate_Data
Offset_0x0330A2:
                dc.b    $09, $00, $01, $FF               
;-------------------------------------------------------------------------------
Vertical_Spiny_Animate_Data:                                   ; Offset_0x0330A6
                dc.w    Offset_0x0330A8-Vertical_Spiny_Animate_Data
Offset_0x0330A8:
                dc.b    $09, $03, $04, $FF
;------------------------------------------------------------------------------- 
Spiny_Weapon_Animate_Data:                                     ; Offset_0x0330AC  
                dc.w    Offset_0x0330AE-Spiny_Weapon_Animate_Data
Offset_0x0330AE:                
                dc.b    $03, $06, $07, $FF                                    
;-------------------------------------------------------------------------------
Spiny_Mappings:                                                ; Offset_0x0330B2
                dc.w    Offset_0x0330C2-Spiny_Mappings
                dc.w    Offset_0x0330E4-Spiny_Mappings
                dc.w    Offset_0x033106-Spiny_Mappings
                dc.w    Offset_0x033128-Spiny_Mappings
                dc.w    Offset_0x03314A-Spiny_Mappings
                dc.w    Offset_0x03316C-Spiny_Mappings
                dc.w    Offset_0x03318E-Spiny_Mappings
                dc.w    Offset_0x033198-Spiny_Mappings
Offset_0x0330C2:
                dc.w    $0004
                dc.l    $F4000000, $0000FFF8
                dc.l    $FC090001, $0000FFE8
                dc.l    $F4000800, $08000000
                dc.l    $FC090801, $08000000
Offset_0x0330E4:
                dc.w    $0004
                dc.l    $F4000000, $0000FFF8
                dc.l    $FC090007, $0003FFE8
                dc.l    $F4000800, $08000000
                dc.l    $FC090807, $08030000
Offset_0x033106:
                dc.w    $0004
                dc.l    $F404000D, $0006FFF0
                dc.l    $FC090001, $0000FFE8
                dc.l    $F404080D, $08060000
                dc.l    $FC090801, $08000000
Offset_0x033128:
                dc.w    $0004
                dc.l    $E806000F, $0007FFF4
                dc.l    $F8000015, $000A0004
                dc.l    $0006100F, $1007FFF4
                dc.l    $00001015, $100A0004
Offset_0x03314A:
                dc.w    $0004
                dc.l    $E8060016, $000BFFF4
                dc.l    $F8000015, $000A0004
                dc.l    $00061016, $100BFFF4
                dc.l    $00001015, $100A0004
Offset_0x03316C:
                dc.w    $0004
                dc.l    $E806000F, $0007FFF4
                dc.l    $F001001C, $000E0004
                dc.l    $0006100F, $1007FFF4
                dc.l    $0001101C, $100E0004
Offset_0x03318E:
                dc.w    $0001
                dc.l    $FC00001E, $000FFFFC
Offset_0x033198:
                dc.w    $0001
                dc.l    $FC00001F, $000FFFFC
;===============================================================================   
; Object 0xA6 - Inimigo Lander na Chemical Plant
; <<<-        
;===============================================================================