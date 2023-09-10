;===============================================================================
; Objeto 0x7B - Molas sobre os tubos na Chemical Plant
; ->>>
;===============================================================================  
; Offset_0x0242CC:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0242FC(PC, D0), D1
                jsr     Offset_0x0242FC(PC, D1)
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x0242E4
                bra     Jmp_12_To_DisplaySprite                ; Offset_0x0244F4
Offset_0x0242E4:
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Jmp_13_To_DeleteObject                 ; Offset_0x0244FA
                bra     Jmp_12_To_DisplaySprite                ; Offset_0x0244F4
;-------------------------------------------------------------------------------  
Offset_0x0242FC:
                dc.w    Offset_0x024304-Offset_0x0242FC
                dc.w    Offset_0x02433A-Offset_0x0242FC      
;-------------------------------------------------------------------------------  
Offset_0x024300:
                dc.w    $F000, $F580                     
;-------------------------------------------------------------------------------
Offset_0x024304:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Spring_Tubes_Mappings, Obj_Map(A0) ; Offset_0x0244B2, $0004
                move.w  #$03E0, Obj_Art_VRAM(A0)                         ; $0002
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$0002, D0
                move.w  Offset_0x024300(PC, D0), Obj_Control_Var_04(A0)  ; $0030
                bsr     Jmp_23_To_ModifySpriteAttr_2P          ; Offset_0x024506        
;-------------------------------------------------------------------------------
Offset_0x02433A:
                cmpi.b  #$01, Obj_Map_Id(A0)                             ; $001A
                beq.s   Offset_0x024384
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0010, D3
                move.w  Obj_X(A0), D4                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     Jmp_03_To_SolidObject_2_A1             ; Offset_0x02450C
                btst    #$03, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x02436C
                bsr     Offset_0x0243F4
Offset_0x02436C:
                movem.l (A7)+, D1-D4
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                moveq   #$04, D6
                bsr     Jmp_03_To_SolidObject_2_A1             ; Offset_0x02450C
                btst    #$04, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x024384
                bsr.s   Offset_0x0243F4
Offset_0x024384:
                move.w  Obj_X(A0), D4                                    ; $0008
                move.w  D4, D5
                subi.w  #$0010, D4
                addi.w  #$0010, D5
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                addi.w  #$0030, D3
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                cmp.w   D4, D0
                bcs.s   Offset_0x0243C2
                cmp.w   D5, D0
                bcc.s   Offset_0x0243C2
                move.w  (Player_Position_Y).w, D0                    ; $FFFFB00C
                cmp.w   D2, D0
                bcs.s   Offset_0x0243C2
                cmp.w   D3, D0
                bcc.s   Offset_0x0243C2
                cmpi.b  #$02, Obj_Ani_Flag(A0)                           ; $001D
                beq.s   Offset_0x0243C2
                move.b  #$02, Obj_Ani_Number(A0)                         ; $001C
Offset_0x0243C2:
                move.w  ($FFFFB048).w, D0
                cmp.w   D4, D0
                bcs.s   Offset_0x0243E8
                cmp.w   D5, D0
                bcc.s   Offset_0x0243E8
                move.w  ($FFFFB04C).w, D0
                cmp.w   D2, D0
                bcs.s   Offset_0x0243E8
                cmp.w   D3, D0
                bcc.s   Offset_0x0243E8
                cmpi.b  #$03, Obj_Ani_Flag(A0)                           ; $001D
                beq.s   Offset_0x0243E8
                move.b  #$03, Obj_Ani_Number(A0)                         ; $001C
Offset_0x0243E8:
                lea     (Spring_Tube_Animate_Data), A1         ; Offset_0x02449A
                bra     Jmp_05_To_AnimateSprite                ; Offset_0x024500                                   
                rts
Offset_0x0243F4:
                move.w  #$0100, Obj_Ani_Number(A0)                       ; $001C
                addq.w  #$04, Obj_Y(A1)                                  ; $000C
                move.w  Obj_Control_Var_04(A0), Obj_Speed_Y(A1)   ; $0012, $0030
                bset    #$01, Obj_Status(A1)                             ; $0022
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$10, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x024428
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
Offset_0x024428:
                btst    #$00, D0
                beq.s   Offset_0x024468
                move.w  #$0001, Obj_Inertia(A1)                          ; $0014
                move.b  #$01, Obj_Flip_Angle(A1)                         ; $0027
                move.b  #$00, Obj_Ani_Number(A1)                         ; $001C
                move.b  #$00, Obj_Control_Var_00(A1)                     ; $002C
                move.b  #$04, Obj_Control_Var_01(A1)                     ; $002D
                btst    #$01, D0
                bne.s   Offset_0x024458
                move.b  #$01, Obj_Control_Var_00(A1)                     ; $002C
Offset_0x024458:
                btst    #$00, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x024468
                neg.b   Obj_Flip_Angle(A1)                               ; $0027
                neg.w   Obj_Inertia(A1)                                  ; $0014
Offset_0x024468:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x02447E
                move.b  #$0C, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0D, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x02447E:
                cmpi.b  #$08, D0
                bne.s   Offset_0x024490
                move.b  #$0E, Obj_Control_Var_12(A1)                     ; $003E
                move.b  #$0F, Obj_Control_Var_13(A1)                     ; $003F
Offset_0x024490:
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912
;-------------------------------------------------------------------------------
Spring_Tube_Animate_Data:                                      ; Offset_0x02449A
                dc.w    Offset_0x0244A2-Spring_Tube_Animate_Data
                dc.w    Offset_0x0244A5-Spring_Tube_Animate_Data
                dc.w    Offset_0x0244A9-Spring_Tube_Animate_Data
                dc.w    Offset_0x0244A9-Spring_Tube_Animate_Data
Offset_0x0244A2:
                dc.b    $0F, $00, $FF
Offset_0x0244A5:
                dc.b    $00, $03, $FD, $00
Offset_0x0244A9:
                dc.b    $05, $01, $02, $02, $02, $04, $FD, $00
                dc.b    $00                                           
;-------------------------------------------------------------------------------
Spring_Tubes_Mappings:                                         ; Offset_0x0244B2
                dc.w    Offset_0x0244BC-Spring_Tubes_Mappings
                dc.w    Offset_0x0244C6-Spring_Tubes_Mappings
                dc.w    Offset_0x0244D8-Spring_Tubes_Mappings
                dc.w    Offset_0x0244EA-Spring_Tubes_Mappings
                dc.w    Offset_0x0244C6-Spring_Tubes_Mappings
Offset_0x0244BC:
                dc.w    $0001
                dc.l    $F00D0000, $0000FFF0
Offset_0x0244C6:
                dc.w    $0002
                dc.l    $E0070008, $0004FFF0
                dc.l    $E0070808, $08040000
Offset_0x0244D8:
                dc.w    $0002
                dc.l    $E0070010, $0008FFF0
                dc.l    $E0070810, $08080000
Offset_0x0244EA:
                dc.w    $0001
                dc.l    $F00D0018, $000CFFF0
;===============================================================================   
; Objeto 0x7B - Molas sobre os tubos na Chemical Plant
; <<<-
;===============================================================================