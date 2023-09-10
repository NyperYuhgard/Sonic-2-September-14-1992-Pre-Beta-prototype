;===============================================================================
; Objeto 0xD7 - Bumpers azuis na Casino Night
; ->>> 
;===============================================================================
; Offset_0x026F38:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x026F46(PC, D0), D1
                jmp     Offset_0x026F46(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x026F46:
                dc.w    Offset_0x026F4A-Offset_0x026F46
                dc.w    Offset_0x026F9C-Offset_0x026F46         
;-------------------------------------------------------------------------------
Offset_0x026F4A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Blue_Bumper_Mappings, Obj_Map(A0) ; Offset_0x027116, $0004
                move.w  #$4394, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_31_To_ModifySpriteAttr_2P          ; Offset_0x027196
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  #$CA, Obj_Col_Flags(A0)                          ; $0020
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x026F86
                move.b  #$01, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x026F86:
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  D0, D1
                subi.w  #$0060, D0
                move.w  D0, Obj_Control_Var_04(A0)                       ; $0030
                addi.w  #$0060, D1
                move.w  D1, Obj_Control_Var_06(A0)                       ; $0032
Offset_0x026F9C:
                move.b  Obj_Col_Prop(A0), D0                             ; $0021
                beq     Offset_0x02706E
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$00, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x026FB2
                bsr.s   Offset_0x026FC8
Offset_0x026FB2:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bclr    #$01, Obj_Col_Prop(A0)                           ; $0021
                beq.s   Offset_0x026FC0
                bsr.s   Offset_0x026FC8
Offset_0x026FC0:
                clr.b   Obj_Col_Prop(A0)                                 ; $0021
                bra     Offset_0x02706E
Offset_0x026FC8:
                move.w  Obj_X(A0), D1                                    ; $0008
                move.w  Obj_Y(A0), D2                                    ; $000C
                sub.w   Obj_X(A1), D1                                    ; $0008
                sub.w   Obj_Y(A1), D2                                    ; $000C
                jsr     (CalcAngle)                            ; Offset_0x003C02
                addi.b  #$20, D0
                andi.w  #$00C0, D0
                cmpi.w  #$0040, D0
                beq.s   Offset_0x027006
                cmpi.w  #$0080, D0
                beq.s   Offset_0x027024
                cmpi.w  #$00C0, D0
                beq.s   Offset_0x027032
                move.w  #$F800, Obj_Speed(A1)                            ; $0010
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x02704E
Offset_0x027006:
                subi.w  #$0200, Obj_Speed(A1)                            ; $0010
                tst.w   D1
                bpl.s   Offset_0x027016
                addi.w  #$0400, Obj_Speed(A1)                            ; $0010
Offset_0x027016:
                move.w  #$F800, Obj_Speed_Y(A1)                          ; $0012
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x02704E
Offset_0x027024:
                move.w  #$0800, Obj_Speed(A1)                            ; $0010
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                bra.s   Offset_0x02704E
Offset_0x027032:
                subi.w  #$0200, Obj_Speed(A1)                            ; $0010
                tst.w   D1
                bpl.s   Offset_0x027042
                addi.w  #$0400, Obj_Speed(A1)                            ; $0010
Offset_0x027042:
                move.w  #$0800, Obj_Speed_Y(A1)                          ; $0012
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
Offset_0x02704E:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$04, Obj_Status(A1)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
                clr.b   Obj_Control_Var_10(A1)                           ; $003C
                move.w  #$00B4, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
Offset_0x02706E:
                lea     (Blue_Bumper_Animate_Data), A1         ; Offset_0x027100
                bsr     Jmp_08_To_AnimateSprite                ; Offset_0x027190
                tst.b   Obj_Subtype(A0)                                  ; $0028
                beq     Jmp_1C_To_MarkObjGone                  ; Offset_0x02718A
                tst.b   Obj_Control_Var_08(A0)                           ; $0034
                beq.s   Offset_0x02709E
                move.w  Obj_X(A0), D0                                    ; $0008
                subq.w  #$01, D0
                cmp.w   Obj_Control_Var_04(A0), D0                       ; $0030
                bne.s   Offset_0x027098
                move.b  #$00, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x027098:
                move.w  D0, Obj_X(A0)                                    ; $0008
                bra.s   Offset_0x0270B4
Offset_0x02709E:
                move.w  Obj_X(A0), D0                                    ; $0008
                addq.w  #$01, D0
                cmp.w   Obj_Control_Var_06(A0), D0                       ; $0032
                bne.s   Offset_0x0270B0
                move.b  #$01, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x0270B0:
                move.w  D0, Obj_X(A0)                                    ; $0008
Offset_0x0270B4:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x0270BE
                bra     Jmp_16_To_DisplaySprite                ; Offset_0x027184
Offset_0x0270BE:
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bls.s   Offset_0x0270E2
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x0270E8
Offset_0x0270E2:
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x0270E8:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x0270FA
                bclr    #$07, $02(A2, D0)
Offset_0x0270FA:
                jmp     (DeleteObject)                         ; Offset_0x0120D0    
;-------------------------------------------------------------------------------  
Blue_Bumper_Animate_Data:                                      ; Offset_0x027100
                dc.w    Offset_0x027106-Blue_Bumper_Animate_Data
                dc.w    Offset_0x027109-Blue_Bumper_Animate_Data
                dc.w    Offset_0x02710F-Blue_Bumper_Animate_Data
Offset_0x027106:
                dc.b    $0F, $00, $FF
Offset_0x027109:
                dc.b    $03, $01, $00, $01, $FD, $00
Offset_0x02710F:
                dc.b    $03, $02, $00, $02, $FD, $00, $00          
;-------------------------------------------------------------------------------
Blue_Bumper_Mappings:                                          ; Offset_0x027116
                dc.w    Offset_0x02711C-Blue_Bumper_Mappings
                dc.w    Offset_0x02713E-Blue_Bumper_Mappings
                dc.w    Offset_0x027160-Blue_Bumper_Mappings
Offset_0x02711C:
                dc.w    $0004
                dc.l    $F0090000, $0000FFE8
                dc.l    $F0090800, $08000000
                dc.l    $00091000, $1000FFE8
                dc.l    $00091800, $18000000
Offset_0x02713E:
                dc.w    $0004
                dc.l    $F4090000, $0000FFE8
                dc.l    $F4090800, $08000000
                dc.l    $04091000, $1000FFE8
                dc.l    $04091800, $18000000
Offset_0x027160:
                dc.w    $0004
                dc.l    $F0090000, $0000FFEC
                dc.l    $F0090800, $08000004
                dc.l    $00091000, $1000FFEC
                dc.l    $00091800, $18000004
;===============================================================================
; Objeto 0xD7 - Bumpers azuis na Casino Night
; <<<- 
;===============================================================================