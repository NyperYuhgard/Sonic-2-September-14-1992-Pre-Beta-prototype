;===============================================================================
; Objeto 0x46 - Bola emcima da mola, após pressionar o botão a bola ejeta
; ->>>          podendo ser usada como veículo na Oil Ocean - Objeto não usado
;===============================================================================
; Offset_0x01F47E:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01F48C(PC, D0), D1
                jmp     Offset_0x01F48C(PC, D1) 
;-------------------------------------------------------------------------------   
Offset_0x01F48C:
                dc.w    Offset_0x01F494-Offset_0x01F48C
                dc.w    Offset_0x01F552-Offset_0x01F48C
                dc.w    Offset_0x01F5A0-Offset_0x01F48C
                dc.w    Offset_0x01F644-Offset_0x01F48C  
;------------------------------------------------------------------------------- 
Offset_0x01F494:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x01F4B0
                bclr    #$07, $02(A2, D0)
                bset    #$00, $02(A2, D0)
                bne     Jmp_0A_To_DeleteObject                 ; Offset_0x01F72C
Offset_0x01F4B0:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$0F, Obj_Height_2(A0)                           ; $0016
                move.b  #$0F, Obj_Width_2(A0)                            ; $0017
                move.l  #Spring_Ball_Mappings, Obj_Map(A0) ; Offset_0x01F6BA, $0004
                move.w  #$6354, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_0C_To_ModifySpriteAttr_2P          ; Offset_0x01F73E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.w  Obj_X(A0), Obj_Control_Var_08(A0)         ; $0008, $0034
                move.w  Obj_Y(A0), Obj_Control_Var_0A(A0)         ; $000C, $0036
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                move.w  #$0000, Obj_Inertia(A0)                          ; $0014
                move.b  #$01, Obj_Ani_Time_2(A0)                         ; $001F
                bsr     Jmp_01_To_SingleObjectLoad             ; Offset_0x01F732
                bne.s   Offset_0x01F54E
                move.b  #$46, Obj_Id(A1)                                 ; $0000
                addq.b  #$06, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addi.w  #$0012, Obj_Y(A1)                                ; $000C
                move.l  #Spring_Push_Boost_Mappings, Obj_Map(A1) ; Offset_0x01EF82, $0004
                move.w  #$43C5, Obj_Art_VRAM(A1)                         ; $0002
                ori.b   #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$09, Obj_Map_Id(A1)                             ; $001A
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
Offset_0x01F54E:
                move.l  A1, Obj_Control_Var_10(A0)                       ; $003C  
;------------------------------------------------------------------------------- 
Offset_0x01F552:
                btst    #$06, ($FFFFF607).w
                bne.s   Offset_0x01F56C
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsr.w   #$04, D0
                tst.b   $00(A2, D0)
                beq.s   Offset_0x01F598
Offset_0x01F56C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bset    #$01, Obj_Status(A0)                             ; $0022
                move.w  #$FD00, Obj_Speed_Y(A0)                          ; $0012
                move.w  #$0100, Obj_Inertia(A0)                          ; $0014
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.b  #$01, Obj_Control_Var_04(A1)                     ; $0030
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01F598
                neg.w   Obj_Inertia(A0)                                  ; $0014
Offset_0x01F598:
                bsr     Offset_0x01F658
                bra     Jmp_09_To_MarkObjGone                  ; Offset_0x01F738    
;------------------------------------------------------------------------------- 
Offset_0x01F5A0:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                bsr     Jmp_07_To_SpeedToPos                   ; Offset_0x01F756
                btst    #$01, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01F5F4
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                bmi.s   Offset_0x01F5F2
                move.w  (Sonic_Level_Limits_Max_Y).w, D0             ; $FFFFEECE
                addi.w  #$00E0, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcs.s   Offset_0x01F62C
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                tst.w   D1
                bpl     Offset_0x01F5F2
                add.w   D1, Obj_Y(A0)                                    ; $000C
                clr.w   Obj_Speed_Y(A0)                                  ; $0012
                bclr    #$01, Obj_Status(A0)                             ; $0022
                move.w  #$0100, Obj_Speed(A0)                            ; $0010
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01F5F2
                neg.w   Obj_Speed(A0)                                    ; $0010
Offset_0x01F5F2:
                bra.s   Offset_0x01F60C
Offset_0x01F5F4:
                jsr     (ObjHitFloor)                          ; Offset_0x019B74
                cmpi.w  #$0008, D1
                blt.s   Offset_0x01F608
                bset    #$01, Obj_Status(A0)                             ; $0022
                bra.s   Offset_0x01F60C
Offset_0x01F608:
                add.w   D1, Obj_Y(A0)                                    ; $000C
Offset_0x01F60C:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  (A7)+, D4
                bsr     Jmp_02_To_SolidObject                  ; Offset_0x01F744
                bsr     Offset_0x01F658
                bra     Jmp_09_To_MarkObjGone                  ; Offset_0x01F738
Offset_0x01F62C:
                move.w  (A7)+, D4
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x01F640
                bclr    #$07, $02(A2, D0)
Offset_0x01F640:
                bra     Jmp_0A_To_DeleteObject                 ; Offset_0x01F72C    
;------------------------------------------------------------------------------- 
Offset_0x01F644:
                tst.b   Obj_Control_Var_04(A0)                           ; $0030
                beq.s   Offset_0x01F654
                subq.b  #$01, Obj_Map_Id(A0)                             ; $001A
                bne.s   Offset_0x01F654
                clr.b   Obj_Control_Var_04(A0)                           ; $0030
Offset_0x01F654:
                bra     Jmp_09_To_MarkObjGone                  ; Offset_0x01F738
Offset_0x01F658:
                tst.b   Obj_Map_Id(A0)                                   ; $001A
                beq.s   Offset_0x01F666
                move.b  #$00, Obj_Map_Id(A0)                             ; $001A
                rts
Offset_0x01F666:
                move.b  Obj_Inertia(A0), D0                              ; $0014
                beq.s   Offset_0x01F692
                bmi.s   Offset_0x01F69A
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x01F692
                neg.b   D0
                addq.b  #$08, D0
                bcs.s   Offset_0x01F67C
                moveq   #$00, D0
Offset_0x01F67C:
                move.b  D0, Obj_Ani_Time(A0)                             ; $001E
                move.b  Obj_Ani_Time_2(A0), D0                           ; $001F
                addq.b  #$01, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x01F68E
                moveq   #$01, D0
Offset_0x01F68E:
                move.b  D0, Obj_Ani_Time_2(A0)                           ; $001F
Offset_0x01F692:
                move.b  Obj_Ani_Time_2(A0), Obj_Map_Id(A0)        ; $001A, $001F
                rts
Offset_0x01F69A:
                subq.b  #$01, Obj_Ani_Time(A0)                           ; $001E
                bpl.s   Offset_0x01F692
                addq.b  #$08, D0
                bcs.s   Offset_0x01F6A6
                moveq   #$00, D0
Offset_0x01F6A6:
                move.b  D0, Obj_Ani_Time(A0)                             ; $001E
                move.b  Obj_Ani_Time_2(A0), D0                           ; $001F
                subq.b  #$01, D0
                bne.s   Offset_0x01F6B4
                moveq   #$03, D0
Offset_0x01F6B4:
                move.b  D0, Obj_Ani_Time_2(A0)                           ; $001F
                bra.s   Offset_0x01F692            
;-------------------------------------------------------------------------------
Spring_Ball_Mappings:                                          ; Offset_0x01F6BA
                dc.w    Offset_0x01F6C2-Spring_Ball_Mappings
                dc.w    Offset_0x01F6E4-Spring_Ball_Mappings
                dc.w    Offset_0x01F706-Spring_Ball_Mappings
                dc.w    Offset_0x01F718-Spring_Ball_Mappings
Offset_0x01F6C2:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF0
                dc.l    $F0050004, $00020000
                dc.l    $00051804, $1802FFF0
                dc.l    $00051004, $10020000
Offset_0x01F6E4:
                dc.w    $0004
                dc.l    $F0050008, $0004FFF0
                dc.l    $F0050808, $08040000
                dc.l    $00051008, $1004FFF0
                dc.l    $00051808, $18040000
Offset_0x01F706:
                dc.w    $0002
                dc.l    $F00D000C, $0006FFF0
                dc.l    $000D180C, $1806FFF0
Offset_0x01F718:
                dc.w    $0002
                dc.l    $F00D080C, $0806FFF0
                dc.l    $000D100C, $1006FFF0                     
;===============================================================================
; Objeto 0x46 - Bola emcima da mola, após pressionar o botão a bola ejeta
; <<<-          podendo ser usada como veículo na Oil Ocean - Objeto não usado
;===============================================================================