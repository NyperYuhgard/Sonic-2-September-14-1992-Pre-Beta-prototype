;===============================================================================
; Objeto 0xA0 - Subojeto do objeto 0x9F - Inimigo Sheelcracker na Metropolis
; ->>>          concha do inimigo
;===============================================================================
; Offset_0x03258A:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x032598(PC, D0), D1
                jmp     Offset_0x032598(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x032598:
                dc.w    Offset_0x03259E-Offset_0x032598
                dc.w    Offset_0x0325DA-Offset_0x032598
                dc.w    Offset_0x0326AE-Offset_0x032598         
;-------------------------------------------------------------------------------     
Offset_0x03259E:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                move.b  Obj_Flags(A1), D0                                ; $0001
                andi.b  #$01, D0
                or.b    D0, Obj_Flags(A0)                                ; $0001
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                beq.s   Offset_0x0325C6
                move.b  #$04, Obj_Map_Id(A0)                             ; $001A
                addq.w  #$06, Obj_X(A0)                                  ; $0008
                addq.w  #$06, Obj_Y(A0)                                  ; $000C
Offset_0x0325C6:
                lsr.w   #$01, D0
                move.b  Offset_0x0325D2(PC, D0), Obj_Timer(A0)           ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608     
;-------------------------------------------------------------------------------
Offset_0x0325D2:
                dc.b    $00, $03, $05, $07, $09, $0B, $0D, $0F
;-------------------------------------------------------------------------------   
Offset_0x0325DA:
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                cmpi.b  #$9F, (A1)
                bne.s   Offset_0x0325FE
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x0325F6(PC, D0), D1
                jsr     Offset_0x0325F6(PC, D1)
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------
Offset_0x0325F6:
                dc.w    Offset_0x03260E-Offset_0x0325F6
                dc.w    Offset_0x032658-Offset_0x0325F6
                dc.w    Offset_0x032672-Offset_0x0325F6
                dc.w    Offset_0x032686-Offset_0x0325F6  
;-------------------------------------------------------------------------------
Offset_0x0325FE:
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                move.w  #$0040, Obj_Timer(A0)                            ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x03260E:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                beq.s   Offset_0x032618
                bmi.s   Offset_0x032618
                rts
Offset_0x032618:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                cmpi.w  #$000E, D0
                bcc.s   Offset_0x032648
                move.w  #$FC00, D2
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x032634
                neg.w   D2
Offset_0x032634:
                move.w  D2, Obj_Speed(A0)                                ; $0010
                lsr.w   #$01, D0
                move.b  Offset_0x032650(PC, D0), D1
                move.b  D1, Obj_Timer(A0)                                ; $002A
                move.b  D1, Obj_Player_Status(A0)                        ; $002B
                rts
Offset_0x032648:
                move.w  #$000B, Obj_Timer(A0)                            ; $002A
                rts             
;-------------------------------------------------------------------------------
Offset_0x032650:
                dc.b    $0D, $0C, $0A, $08, $06, $04, $02, $00   
;------------------------------------------------------------------------------- 
Offset_0x032658:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                beq.s   Offset_0x032666
                bmi.s   Offset_0x032666
                rts
Offset_0x032666:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.b  #$08, Obj_Timer(A0)                              ; $002A
                rts
Offset_0x032672:
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                beq.s   Offset_0x03267C
                bmi.s   Offset_0x03267C
                rts
Offset_0x03267C:
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                neg.w   Obj_Speed(A0)                                    ; $0010
                rts
Offset_0x032686:
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                subq.b  #$01, Obj_Player_Status(A0)                      ; $002B
                beq.s   Offset_0x032694
                bmi.s   Offset_0x032694
                rts
Offset_0x032694:
                tst.w   Obj_Control_Var_02(A0)                           ; $002E
                bne     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                move.b  #$00, Obj_Map_Id(A1)                             ; $001A
                st      Obj_Control_Var_00(A1)                           ; $002C
                bra     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
Offset_0x0326AE:
                bsr     Jmp_0B_To_ObjectFall                   ; Offset_0x037650
                subi.w  #$0001, Obj_Timer(A0)                            ; $002A
                bmi     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                
Load_Sheelcracker_Craw_Obj:                                    ; Offset_0x0326C0
                moveq   #$00, D1
                moveq   #$07, D6
Offset_0x0326C4:
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x03271C
                move.b  #$A0, Obj_Id(A1)                                 ; $0000
                move.b  #$26, Obj_Subtype(A1)                            ; $0028
                move.b  #$05, Obj_Map_Id(A1)                             ; $001A
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  D1, Obj_Control_Var_02(A1)                       ; $002E
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  #$FFEC, D2
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x032706
                neg.w   D2
                tst.w   D1
                beq.s   Offset_0x032706
                subi.w  #$000C, D2
Offset_0x032706:
                add.w   D2, Obj_X(A1)                                    ; $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                subi.w  #$0008, Obj_Y(A1)                                ; $000C
                addq.w  #$02, D1
                dbra    D6, Offset_0x0326C4
Offset_0x03271C:
                rts  
;-------------------------------------------------------------------------------
Obj_0x9F_Ptr:                                                  ; Offset_0x03271E
                dc.l    Shellcracker_Mappings                  ; Offset_0x032742
                dc.w    $031C
                dc.b    $04, $05, $18, $0A
;-------------------------------------------------------------------------------
Obj_0xA0_Ptr:                                                  ; Offset_0x032728
                dc.l    Shellcracker_Mappings                  ; Offset_0x032742
                dc.w    $031C
                dc.b    $04, $04, $0C, $9A    
;-------------------------------------------------------------------------------
Shellcracker_Animate_Data:                                     ; Offset_0x032732      
                dc.w    Offset_0x032736-Shellcracker_Animate_Data
                dc.w    Offset_0x03273C-Shellcracker_Animate_Data
Offset_0x032736:
                dc.b    $0E, $00, $01, $02, $FF, $00
Offset_0x03273C:
                dc.b    $0E, $00, $02, $01, $FF, $00    
;-------------------------------------------------------------------------------
Shellcracker_Mappings:                                         ; Offset_0x032742
                dc.w    Offset_0x03274E-Shellcracker_Mappings
                dc.w    Offset_0x032770-Shellcracker_Mappings
                dc.w    Offset_0x032792-Shellcracker_Mappings
                dc.w    Offset_0x0327B4-Shellcracker_Mappings
                dc.w    Offset_0x0327CE-Shellcracker_Mappings
                dc.w    Offset_0x0327D8-Shellcracker_Mappings
Offset_0x03274E:
                dc.w    $0004
                dc.l    $EC0A0018, $000CFFE0
                dc.l    $F8040021, $00100008
                dc.l    $F40A0000, $0000FFE8
                dc.l    $F40A0800, $08000000
Offset_0x032770:
                dc.w    $0004
                dc.l    $EC0A0018, $000CFFE0
                dc.l    $F8040021, $00100008
                dc.l    $F4060812, $0809FFF0
                dc.l    $F40A0809, $08040000
Offset_0x032792:
                dc.w    $0004
                dc.l    $EC0A0018, $000CFFE0
                dc.l    $F8040021, $00100008
                dc.l    $F40A0009, $0004FFE8
                dc.l    $F4060012, $00090000
Offset_0x0327B4:
                dc.w    $0003
                dc.l    $F8040021, $00100008
                dc.l    $F40A0000, $0000FFE8
                dc.l    $F40A0800, $08000000
Offset_0x0327CE:
                dc.w    $0001
                dc.l    $FC000023, $0011FFFC
Offset_0x0327D8:
                dc.w    $0001
                dc.l    $F40A0018, $000CFFF4                                     
;===============================================================================
; Objeto 0xA0 - Subojeto do objeto 0x9F - Inimigo Sheelcracker na Metropolis
; <<<-          concha do inimigo
;===============================================================================