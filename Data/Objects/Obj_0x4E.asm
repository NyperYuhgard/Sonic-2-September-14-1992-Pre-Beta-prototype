;===============================================================================
; Objeto 0x4E - Crocobot - Inimigo crocodilo na Hidden Palace
; ->>>          
;===============================================================================  
; Offset_0x02798C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x02799A(PC, D0), D1
                jmp     Offset_0x02799A(PC, D1)
;-------------------------------------------------------------------------------    
Offset_0x02799A:
                dc.w    Offset_0x02799E-Offset_0x02799A
                dc.w    Offset_0x0279EE-Offset_0x02799A          
;-------------------------------------------------------------------------------   
Offset_0x02799E:
                move.l  #Crocobot_Mappings, Obj_Map(A0) ; Offset_0x027ABC, $0004
                move.w  #$2300, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$0A, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$10, Obj_Height_2(A0)                           ; $0016
                move.b  #$08, Obj_Width_2(A0)                            ; $0017
                bsr     Jmp_01_To_ObjectFall                   ; Offset_0x027C78
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl.s   Offset_0x0279EC
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  #$0000, Obj_Speed_Y(A0)                          ; $0012
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x0279EC:
                rts  
;-------------------------------------------------------------------------------  
Offset_0x0279EE:
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x027A0A(PC, D0), D1
                jsr     Offset_0x027A0A(PC, D1)
                lea     (Crocobot_Animate_Data), A1            ; Offset_0x027AA2
                bsr     Jmp_0B_To_AnimateSprite                ; Offset_0x027C72
                bra     Jmp_1F_To_MarkObjGone                  ; Offset_0x027C6C       
;-------------------------------------------------------------------------------       
Offset_0x027A0A:
                dc.w    Offset_0x027A0E-Offset_0x027A0A
                dc.w    Offset_0x027A32-Offset_0x027A0A        
;-------------------------------------------------------------------------------
Offset_0x027A0E:
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bpl.s   Offset_0x027A30
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$FF40, Obj_Speed(A0)                            ; $0010
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                bchg    #00, Obj_Status(A0)                              ; $0022
                bne.s   Offset_0x027A30
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x027A30:
                rts     
;-------------------------------------------------------------------------------
Offset_0x027A32:
                bsr     Offset_0x027A6A
                bsr     Jmp_12_To_SpeedToPos                   ; Offset_0x027C7E
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                cmpi.w  #$FFF8, D1
                blt.s   Offset_0x027A52
                cmpi.w  #$000C, D1
                bge.s   Offset_0x027A52
                add.w   D1, Obj_Y(A0)                                    ; $000C
                rts
Offset_0x027A52:
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$003B, Obj_Control_Var_04(A0)                   ; $0030
                move.w  #$0000, Obj_Speed(A0)                            ; $0010
                move.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x027A6A:
                move.w  Obj_X(A0), D0                                    ; $0008
                sub.w   ($FFFFB008).w, D0
                bmi.s   Offset_0x027A84
                cmpi.w  #$0040, D0
                bgt.s   Offset_0x027A9A
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x027A92
                rts
Offset_0x027A84:
                cmpi.w  #$FFC0, D0
                blt.s   Offset_0x027A9A
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x027A9A
Offset_0x027A92:
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
                rts
Offset_0x027A9A:
                move.b  #$00, Obj_Ani_Number(A0)                         ; $001C
                rts                     
;-------------------------------------------------------------------------------
Crocobot_Animate_Data:                                         ; Offset_0x027AA2
                dc.w    Offset_0x027AA8-Crocobot_Animate_Data
                dc.w    Offset_0x027AB0-Crocobot_Animate_Data
                dc.w    Offset_0x027AB3-Crocobot_Animate_Data
Offset_0x027AA8:
                dc.b    $03, $00, $04, $02, $03, $01, $05, $FF
Offset_0x027AB0:
                dc.b    $0F, $00, $FF
Offset_0x027AB3:
                dc.b    $03, $06, $0A, $08, $09, $07, $0B, $FF
                dc.b    $00                                     
;-------------------------------------------------------------------------------
Crocobot_Mappings:                                             ; Offset_0x027ABC
                dc.w    Offset_0x027AD4-Crocobot_Mappings
                dc.w    Offset_0x027AF6-Crocobot_Mappings
                dc.w    Offset_0x027B18-Crocobot_Mappings
                dc.w    Offset_0x027B3A-Crocobot_Mappings
                dc.w    Offset_0x027B5C-Crocobot_Mappings
                dc.w    Offset_0x027B7E-Crocobot_Mappings
                dc.w    Offset_0x027BA0-Crocobot_Mappings
                dc.w    Offset_0x027BC2-Crocobot_Mappings
                dc.w    Offset_0x027BE4-Crocobot_Mappings
                dc.w    Offset_0x027C06-Crocobot_Mappings
                dc.w    Offset_0x027C28-Crocobot_Mappings
                dc.w    Offset_0x027C4A-Crocobot_Mappings
Offset_0x027AD4:
                dc.w    $0004
                dc.l    $F80E0000, $0000FFE4
                dc.l    $F8050018, $000C0004
                dc.l    $0001001C, $000E0004
                dc.l    $00050020, $0010000C
Offset_0x027AF6:
                dc.w    $0004
                dc.l    $F80E0000, $0000FFE4
                dc.l    $F8050018, $000C0004
                dc.l    $0001001C, $000E0004
                dc.l    $00050024, $0012000C
Offset_0x027B18:
                dc.w    $0004
                dc.l    $F80E0000, $0000FFE4
                dc.l    $F8050018, $000C0004
                dc.l    $0001001C, $000E0004
                dc.l    $00050028, $0014000C
Offset_0x027B3A:
                dc.w    $0004
                dc.l    $F80E0000, $0000FFE4
                dc.l    $F8050018, $000C0004
                dc.l    $0001001E, $000F0004
                dc.l    $00050020, $0010000C
Offset_0x027B5C:
                dc.w    $0004
                dc.l    $F80E0000, $0000FFE4
                dc.l    $F8050018, $000C0004
                dc.l    $0001001E, $000F0004
                dc.l    $00050024, $0012000C
Offset_0x027B7E:
                dc.w    $0004
                dc.l    $F80E0000, $0000FFE4
                dc.l    $F8050018, $000C0004
                dc.l    $0001001E, $000F0004
                dc.l    $00050028, $0014000C
Offset_0x027BA0:
                dc.w    $0004
                dc.l    $F00B000C, $0006FFEC
                dc.l    $F8050018, $000C0004
                dc.l    $0001001C, $000E0004
                dc.l    $00050020, $0010000C
Offset_0x027BC2:
                dc.w    $0004
                dc.l    $F00B000C, $0006FFEC
                dc.l    $F8050018, $000C0004
                dc.l    $0001001C, $000E0004
                dc.l    $00050024, $0012000C
Offset_0x027BE4:
                dc.w    $0004
                dc.l    $F00B000C, $0006FFEC
                dc.l    $F8050018, $000C0004
                dc.l    $0001001C, $000E0004
                dc.l    $00050028, $0014000C
Offset_0x027C06:
                dc.w    $0004
                dc.l    $F00B000C, $0006FFEC
                dc.l    $F8050018, $000C0004
                dc.l    $0001001E, $000F0004
                dc.l    $00050020, $0010000C
Offset_0x027C28:
                dc.w    $0004
                dc.l    $F00B000C, $0006FFEC
                dc.l    $F8050018, $000C0004
                dc.l    $0001001E, $000F0004
                dc.l    $00050024, $0012000C
Offset_0x027C4A:
                dc.w    $0004
                dc.l    $F00B000C, $0006FFEC
                dc.l    $F8050018, $000C0004
                dc.l    $0001001E, $000F0004
                dc.l    $00050028, $0014000C
;===============================================================================    
; Objeto 0x4E - Crocobot - Inimigo crocodilo na Hidden Palace
; <<<-
;===============================================================================