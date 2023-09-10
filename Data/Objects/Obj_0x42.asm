;===============================================================================
; Objeto 0x42 - Molas a vapor na Metropolis
; ->>>
;===============================================================================
Offset_0x021040:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02104E(PC, D0), D1
                jmp     Offset_0x02104E(PC, D1)       
;-------------------------------------------------------------------------------                
Offset_0x02104E:
                dc.w    Offset_0x021054-Offset_0x02104E
                dc.w    Offset_0x021094-Offset_0x02104E
                dc.w    Offset_0x021246-Offset_0x02104E     
;-------------------------------------------------------------------------------    
Offset_0x021054:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Steam_Vent_Mappings, Obj_Map(A0) ; Offset_0x021278, $0004
                move.w  #$6000, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                bsr     Jmp_13_To_ModifySpriteAttr_2P          ; Offset_0x021320
                move.b  #$07, Obj_Map_Id(A0)                             ; $001A
                move.w  Obj_Y(A0), Obj_Control_Var_08(A0)         ; $000C, $0034
                move.w  #$0010, Obj_Control_Var_0A(A0)                   ; $0036
                addi.w  #$0010, Obj_Y(A0)                                ; $000C
;-------------------------------------------------------------------------------                
Offset_0x021094:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  #$0010, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     Jmp_01_To_SolidObject_2_A1             ; Offset_0x021326
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0210BE
                bsr     Offset_0x02119A
Offset_0x0210BE:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     Jmp_01_To_SolidObject_2_A1             ; Offset_0x021326
                btst    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x0210D8
                bsr     Offset_0x02119A
Offset_0x0210D8:
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                bne.s   Offset_0x0210F0
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x021154
                move.w  #$007F, Obj_Control_Var_06(A0)                   ; $0032
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra.s   Offset_0x021154
Offset_0x0210F0:
                subq.b  #$02, D0
                bne.s   Offset_0x021122
                subq.w  #$08, Obj_Control_Var_0A(A0)                     ; $0036
                bne.s   Offset_0x021114
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bsr.s   Offset_0x021158
                addi.w  #$0028, Obj_X(A1)                                ; $0008
                bsr.s   Offset_0x021158
                subi.w  #$0028, Obj_X(A1)                                ; $0008
                bset    #$00, Obj_Flags(A1)                              ; $0001
Offset_0x021114:
                move.w  Obj_Control_Var_0A(A0), D0                       ; $0036
                add.w   Obj_Control_Var_08(A0), D0                       ; $0034
                move.w  D0, Obj_Y(A0)                                    ; $000C
                bra.s   Offset_0x021154
Offset_0x021122:
                subq.b  #$02, D0
                bne.s   Offset_0x021138
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x021154
                move.w  #$007F, Obj_Control_Var_06(A0)                   ; $0032
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                bra.s   Offset_0x021154
Offset_0x021138:
                addq.w  #$08, Obj_Control_Var_0A(A0)                     ; $0036
                cmpi.w  #$0010, Obj_Control_Var_0A(A0)                   ; $0036
                bne.s   Offset_0x021148
                clr.b   Obj_Routine_2(A0)                                ; $0025
Offset_0x021148:
                move.w  Obj_Control_Var_0A(A0), D0                       ; $0036
                add.w   Obj_Control_Var_08(A0), D0                       ; $0034
                move.w  D0, Obj_Y(A0)                                    ; $000C
Offset_0x021154:
                bra     Jmp_10_To_MarkObjGone                  ; Offset_0x02131A
Offset_0x021158:
                bsr     Jmp_04_To_SingleObjectLoad             ; Offset_0x021314
                bne.s   Offset_0x021198
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                addq.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Control_Var_08(A0), Obj_Y(A1)         ; $000C, $0034
                move.b  #$07, Obj_Ani_Time(A1)                           ; $001E
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  #$2405, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$18, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
Offset_0x021198:
                rts
Offset_0x02119A:
                cmpi.b  #$02, Obj_Routine_2(A0)                          ; $0025
                beq.s   Offset_0x0211A4
                rts
Offset_0x0211A4:
                move.w  #$F600, Obj_Speed_Y(A1)                          ; $0012
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$10, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  #$00, Obj_Control_Var_0D(A1)                     ; $0039
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x0211D4
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
Offset_0x0211D4:
                btst    #$00, D0
                beq.s   Offset_0x021214
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$00, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$04, Obj_Control_Var_01(A1)                     ; $002D
                btst    #$01, D0
                bne.s   Offset_0x021204
                move.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
Offset_0x021204:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x021214
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x021214:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x02122A
                move.b  #$0C, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0D, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x02122A:
                cmpi.b  #$08, D0
                bne.s   Offset_0x02123C
                move.b  #$0E, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0F, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x02123C:
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
;-------------------------------------------------------------------------------                
Offset_0x021246:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x021274
                move.b  #$07, Obj_Ani_Time(A0)                           ; $001E
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                addq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                cmpi.b  #$03, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x02126A
                move.b  #$A6, Obj_Col_Flags(A0)                          ; $0020
Offset_0x02126A:
                cmpi.b  #$07, Obj_Map_Id(A0)                             ; $001A
                beq     Jmp_0F_To_DeleteObject                 ; Offset_0x02130E
Offset_0x021274:
                bra     Jmp_0B_To_DisplaySprite                ; Offset_0x021308
;-------------------------------------------------------------------------------
Steam_Vent_Mappings:                                           ; Offset_0x021278      
                dc.w    Offset_0x021288-Steam_Vent_Mappings
                dc.w    Offset_0x021292-Steam_Vent_Mappings
                dc.w    Offset_0x02129C-Steam_Vent_Mappings
                dc.w    Offset_0x0212A6-Steam_Vent_Mappings
                dc.w    Offset_0x0212B8-Steam_Vent_Mappings
                dc.w    Offset_0x0212CA-Steam_Vent_Mappings
                dc.w    Offset_0x0212E4-Steam_Vent_Mappings
                dc.w    Offset_0x0212F6-Steam_Vent_Mappings
;-------------------------------------------------------------------------------
Offset_0x021288:
                dc.w    $0001
                dc.l    $FF000000, $0000FFE8
;-------------------------------------------------------------------------------
Offset_0x021292:
                dc.w    $0001
                dc.l    $FF040001, $0000FFE8
;-------------------------------------------------------------------------------
Offset_0x02129C:
                dc.w    $0001
                dc.l    $FC050003, $0001FFEC
;-------------------------------------------------------------------------------
Offset_0x0212A6:
                dc.w    $0002
                dc.l    $FC050007, $0003FFF8
                dc.l    $FC050003, $0001FFF0
;-------------------------------------------------------------------------------
Offset_0x0212B8:
                dc.w    $0002
                dc.l    $FC051007, $10030000
                dc.l    $FC01100B, $1005FFF8
;-------------------------------------------------------------------------------
Offset_0x0212CA:
                dc.w    $0003
                dc.l    $FC01000D, $0006000C
                dc.l    $FC01000B, $00050004
                dc.l    $FC01180D, $1806FFFC
;-------------------------------------------------------------------------------
Offset_0x0212E4:
                dc.w    $0002
                dc.l    $FC01000D, $00060010
                dc.l    $FC01180D, $18060008
;-------------------------------------------------------------------------------
Offset_0x0212F6:
                dc.w    $0002
                dc.l    $F0070015, $000AFFF0
                dc.l    $F007001D, $000E0000                                                                                                       
;===============================================================================
; Objeto 0x42 - Molas a vapor na Metropolis
; <<<-
;===============================================================================