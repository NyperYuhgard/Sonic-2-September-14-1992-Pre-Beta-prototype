;===============================================================================
; Objeto 0x32 - Pedra na Hill Top / Obstáculo nos tuneis da Chemical Plant
; ->>>        
;===============================================================================  
; Offset_0x01DF8A:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01DF98(PC, D0), D1
                jmp     Offset_0x01DF98(PC, D1)    
;-------------------------------------------------------------------------------
Offset_0x01DF98:
                dc.w    Offset_0x01DF9E-Offset_0x01DF98
                dc.w    Offset_0x01DFF2-Offset_0x01DF98
                dc.w    Offset_0x01E0DA-Offset_0x01DF98
;-------------------------------------------------------------------------------
Offset_0x01DF9E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #HTz_Rock_Mappings, Obj_Map(A0) ; Offset_0x01E2C2, $0004
                move.w  #$43B2, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.l  #HTz_Rock_Break_Data, Obj_Control_Var_10(A0) ; Offset_0x01E0F0, $003C
                cmpi.b  #$0D, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x01DFE2
                move.l  #CPz_Tunel_Obstacle_Mappings, Obj_Map(A0) ; Offset_0x01E2F6, $0004
                move.w  #$6430, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.l  #CPz_Tunel_Obstacle_Break_Data, Obj_Control_Var_10(A0) ; Offset_0x01E108, $003C
Offset_0x01DFE2:
                bsr     Jmp_0A_To_ModifySpriteAttr_2P          ; Offset_0x01E334
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
;-------------------------------------------------------------------------------
Offset_0x01DFF2:
                move.w  ($FFFFF7D0).w, Obj_Control_Var_0C(A0)            ; $0038
                move.b  ($FFFFB01C).w, Obj_Control_Var_06(A0)            ; $0032
                move.b  ($FFFFB05C).w, Obj_Control_Var_07(A0)            ; $0033
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                bsr     Jmp_00_To_SolidObject                  ; Offset_0x01E340
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                bne.s   Offset_0x01E02C
Offset_0x01E028:
                bra     Jmp_07_To_MarkObjGone                  ; Offset_0x01E32E
Offset_0x01E02C:
                cmpi.b  #$18, D0
                bne.s   Offset_0x01E05A
                cmpi.b  #$02, Obj_Control_Var_06(A0)                     ; $0032
                beq.s   Offset_0x01E042
                cmpi.b  #$02, Obj_Control_Var_07(A0)                     ; $0033
                bne.s   Offset_0x01E028
Offset_0x01E042:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.b  Obj_Control_Var_06(A0), D0                       ; $0032
                bsr.s   Offset_0x01E072
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                move.b  Obj_Control_Var_07(A0), D0                       ; $0033
                bsr.s   Offset_0x01E072
                bra     Offset_0x01E0C2
Offset_0x01E05A:
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x01E0AA
                cmpi.b  #$02, Obj_Control_Var_06(A0)                     ; $0032
                bne.s   Offset_0x01E028
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x01E078
                bra.s   Offset_0x01E0C2
Offset_0x01E072:
                cmpi.b  #$02, D0
                bne.s   Offset_0x01E096
Offset_0x01E078:
                bset    #$02, Obj_Status(A1)                             ; $0022
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$FD00, Obj_Speed_Y(A1)                          ; $0012
Offset_0x01E096:
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                rts
Offset_0x01E0AA:
                andi.b  #$10, D0
                beq     Offset_0x01E028
                cmpi.b  #$02, Obj_Control_Var_07(A0)                     ; $0033
                bne     Offset_0x01E028
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                bsr.s   Offset_0x01E078
Offset_0x01E0C2:
                move.w  Obj_Control_Var_0C(A0), ($FFFFF7D0).w            ; $0038
                andi.b  #$E7, Obj_Status(A0)                             ; $0022
                move.l  Obj_Control_Var_10(A0), A4                       ; $003C
                bsr     Jmp_00_To_Smash_Object                 ; Offset_0x01E33A
                bsr     Offset_0x01E118   
;-------------------------------------------------------------------------------
Offset_0x01E0DA:
                bsr     Jmp_06_To_SpeedToPos                   ; Offset_0x01E346
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                tst.b   Obj_Flags(A0)                                    ; $0001
                bpl     Jmp_08_To_DeleteObject                 ; Offset_0x01E322
                bra     Jmp_06_To_DisplaySprite                ; Offset_0x01E31C        
;-------------------------------------------------------------------------------
HTz_Rock_Break_Data:                                           ; Offset_0x01E0F0
                dc.w    $FE00, $FE00, $0000, $FD80, $0200, $FE00, $FE40, $FE40
                dc.w    $0000, $FE00, $01C0, $FE40                  
;-------------------------------------------------------------------------------
CPz_Tunel_Obstacle_Break_Data:                                 ; Offset_0x01E108
                dc.w    $FF00, $FE00, $0100, $FE00, $FF40, $FE40, $00C0, $FE40 
;-------------------------------------------------------------------------------
Offset_0x01E118:
                bsr     Jmp_00_To_SingleObjectLoad             ; Offset_0x01E328
                bne.s   Offset_0x01E160
                move.b  #$29, Obj_Id(A1)                                 ; $0000
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.w  ($FFFFF7D0).w, D2
                addq.w  #$02, ($FFFFF7D0).w
                cmpi.w  #$0006, D2
                bcs.s   Offset_0x01E140
                moveq   #$06, D2
Offset_0x01E140:
                moveq   #$00, D0
                move.w  Break_Obstacle_Points(PC, D2), D0      ; Offset_0x01E162
                cmpi.w  #$0020, ($FFFFF7D0).w
                bcs.s   Offset_0x01E154
                move.w  #$03E8, D0
                moveq   #$0A, D2
Offset_0x01E154:
                jsr     (AddPoints)                            ; Offset_0x0394D0
                lsr.w   #$01, D2
                move.b  D2, Obj_Map_Id(A1)                               ; $001A
Offset_0x01E160:
                rts                  
;-------------------------------------------------------------------------------
Break_Obstacle_Points:                                         ; Offset_0x01E162
                dc.w    $000A   ;  100
                dc.w    $0014   ;  200
                dc.w    $0032   ;  500
                dc.w    $0064   ; 1000              
;===============================================================================   
; Objeto 0x32 - Pedra na Hill Top / Obstáculo nos tuneis da Chemical Plant
; <<<-        
;===============================================================================