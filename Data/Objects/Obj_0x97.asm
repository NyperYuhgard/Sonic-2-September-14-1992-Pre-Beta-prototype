;===============================================================================
; Objeto 0x97 - Cabeça do inimigo Rexon na Hill Top (Inimigo tipo cobra que
; ->>>          atira bolas de fogo no jogador)
;===============================================================================
; Offset_0x03181E:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x03182C(PC, D0), D1
                jmp     Offset_0x03182C(PC, D1)   
;-------------------------------------------------------------------------------  
Offset_0x03182C:
                dc.w    Offset_0x031836-Offset_0x03182C
                dc.w    Offset_0x0318A2-Offset_0x03182C
                dc.w    Offset_0x0318D6-Offset_0x03182C
                dc.w    Offset_0x031910-Offset_0x03182C
                dc.w    Offset_0x031942-Offset_0x03182C
;-------------------------------------------------------------------------------   
Offset_0x031836:
                bsr     Object_Settings                        ; Offset_0x030A30
                move.b  #$08, Obj_Width(A0)                              ; $0019
                moveq   #$28, D0
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x03184C
                moveq   #-$18, D0
Offset_0x03184C:
                add.w   D0, Obj_X(A0)                                    ; $0008
                addi.w  #$0010, Obj_Y(A0)                                ; $000C
                move.b  #$01, Obj_Control_Var_0C(A0)                     ; $0038
                move.w  Obj_Control_Var_00(A0), A1                       ; $002C
                lea     Obj_Control_Var_02(A1), A1                       ; $002E
                move.b  #$0B, Obj_Col_Flags(A0)                          ; $0020
                moveq   #$00, D0
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                cmpi.w  #$0008, D0
                beq.s   Offset_0x031888
                move.b  #$01, Obj_Map_Id(A0)                             ; $001A
                move.b  #$8B, Obj_Col_Flags(A0)                          ; $0020
                move.w  $00(A1, D0), Obj_Control_Var_04(A0)              ; $0030
Offset_0x031888:
                move.w  $0006(A1), Obj_Control_Var_06(A0)                ; $0032
                lsr.w   #$01, D0
                move.b  Offset_0x03189C(PC, D0), Obj_Timer(A0)           ; $002A
                move.b  D0, Obj_Control_Var_0D(A0)                       ; $0039
                rts    
;-------------------------------------------------------------------------------
Offset_0x03189C:
                dc.b    $1E, $18, $12, $0C, $06, $00                            
;-------------------------------------------------------------------------------    
Offset_0x0318A2:
                bsr     Offset_0x03195A
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0318B0
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0318B0:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$FEE0, Obj_Speed(A0)                            ; $0010
                move.w  #$FE00, Obj_Speed_Y(A0)                          ; $0012
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                subi.w  #$0008, D0
                neg.w   D0
                lsr.w   #$01, D0
                move.b  Offset_0x03189C(PC, D0), Obj_Timer(A0)           ; $002A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x0318D6:
                bsr     Offset_0x03195A
                moveq   #$10, D0
                add.w   D0, Obj_Speed(A0)                                ; $0010
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bmi.s   Offset_0x0318EE
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0318EE:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Offset_0x030BD8
                move.b  #$20, Obj_Timer(A0)                              ; $002A
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                lsr.w   #$01, D0
                move.b  Offset_0x03190C(PC, D0), Obj_Player_Status(A0)   ; $002B
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608   
;-------------------------------------------------------------------------------
Offset_0x03190C:
                dc.b    $24, $20, $1C, $1A 
;------------------------------------------------------------------------------- 
Offset_0x031910:
                bsr     Offset_0x03195A
                cmpi.w  #$0008, Obj_Control_Var_02(A0)                   ; $002E
                bne.s   Offset_0x031926
                subq.b  #$01, Obj_Timer(A0)                              ; $002A
                bpl.s   Offset_0x031926
                bsr     Rexon_Load_Weapon                      ; Offset_0x031980
Offset_0x031926:
                move.b  Obj_Control_Var_0D(A0), D0                       ; $0039
                addq.b  #$01, D0
                move.b  D0, Obj_Control_Var_0D(A0)                       ; $0039
                andi.b  #$03, D0
                bne.s   Offset_0x03193E
                bsr     Offset_0x0319D8
                bsr     Offset_0x031A52
Offset_0x03193E:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
;-------------------------------------------------------------------------------                 
Offset_0x031942:
                move.w  (Sonic_Level_Limits_Max_Y).w, D0             ; $FFFFEECE
                addi.w  #$00E0, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcs     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                bsr     Jmp_0B_To_ObjectFall                   ; Offset_0x037650
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x03195A:
                move.w  Obj_Control_Var_06(A0), A1                       ; $0032
                cmpi.b  #$97, (A1)
                beq.s   Offset_0x031974
                move.b  #$08, Obj_Routine(A0)                            ; $0024
                move.w  Obj_Control_Var_02(A0), D0                       ; $002E
                move.w  Offset_0x031976(PC, D0), Obj_Speed(A0)           ; $0010
Offset_0x031974:
                rts
;-------------------------------------------------------------------------------   
Offset_0x031976:
                dc.w    $0080, $FF00, $0100, $FF80, $0080
;------------------------------------------------------------------------------- 
Rexon_Load_Weapon:                                             ; Offset_0x031980
                move.b  #$7F, Obj_Timer(A0)                              ; $002A
                bsr     Jmp_16_To_SingleObjectLoad_2           ; Offset_0x03761A
                bne.s   Offset_0x0319D6
                move.b  #$98, Obj_Id(A1)                                 ; $0000
                move.b  #$03, Obj_Map_Id(A1)                             ; $001A
                move.b  #$10, Obj_Subtype(A1)                            ; $0028
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                lea     (SpeedToPos), A2                       ; Offset_0x011F96
                move.l  A2, Obj_Timer(A1)                                ; $002A
                moveq   #$01, D0
                moveq   #$10, D1
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x0319C4
                neg.w   D0
                neg.w   D1
Offset_0x0319C4:
                move.b  D0, Obj_Speed(A1)                                ; $0010
                add.w   D1, Obj_X(A1)                                    ; $0008
                addq.w  #$04, Obj_Y(A1)                                  ; $000C
                move.b  #$80, $0013(A1)
Offset_0x0319D6:
                rts
Offset_0x0319D8:
                move.b  Obj_Player_Status(A0), D0                        ; $002B
                move.b  Obj_Control_Var_0C(A0), D1                       ; $0038
                add.b   D1, D0
                move.b  D0, Obj_Player_Status(A0)                        ; $002B
                subi.b  #$18, D0
                beq.s   Offset_0x0319F4
                bcs.s   Offset_0x0319F4
                cmpi.b  #$10, D0
                bcs.s   Offset_0x0319F8
Offset_0x0319F4:
                neg.b   Obj_Control_Var_0C(A0)                           ; $0038
Offset_0x0319F8:
                rts
;-------------------------------------------------------------------------------                
Load_Rexon_Head_Obj                                            ; Offset_0x0319FA
                move.b  #$06, Obj_Routine(A0)                            ; $0024
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                tst.w   D0
                beq.s   Offset_0x031A10
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x031A10:
                bsr     Offset_0x030BD8
                lea     Obj_Control_Var_00(A0), A2                       ; $002C
                moveq   #$00, D1
                moveq   #$04, D6
Offset_0x031A1C:
                bsr     Jmp_10_To_SingleObjectLoad             ; Offset_0x037602
                bne.s   Offset_0x031A50
                move.b  #$97, Obj_Id(A1)                                 ; $0000
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                move.b  Obj_Subtype(A0), Obj_Subtype(A1)          ; $0028, $0028
                move.w  A0, Obj_Control_Var_00(A1)                       ; $002C
                move.w  A1, (A2)+
                move.w  D1, Obj_Control_Var_02(A1)                       ; $002E
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                addq.w  #$02, D1
                dbra    D6, Offset_0x031A1C
Offset_0x031A50:
                rts
Offset_0x031A52:
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                beq.s   Offset_0x031A9E
                move.w  D0, A1
                lea     Offset_0x031AF6(PC), A2
                moveq   #$00, D0
                move.b  Obj_Player_Status(A0), D0                        ; $002B
                andi.b  #$7F, D0
                move.w  D0, D1
                andi.w  #$001F, D0
                add.w   D0, D0
                move.b  $00(A2, D0), D2
                ext.w   D2
                move.b  $01(A2, D0), D3
                ext.w   D3
                lsr.w   #$04, D1
                andi.w  #$0006, D1
                move.w  Offset_0x031AA0(PC, D1), D1
                jsr     Offset_0x031AA0(PC, D1)
                move.w  Obj_X(A0), D4                                    ; $0008
                add.w   D2, D4
                move.w  D4, Obj_X(A1)                                    ; $0008
                move.b  $000D(A0), D5
                add.b   D3, D5
                move.b  D5, $000D(A1)
Offset_0x031A9E:
                rts      
;-------------------------------------------------------------------------------
Offset_0x031AA0:
                dc.w    Offset_0x031AA8-Offset_0x031AA0
                dc.w    Offset_0x031AAA-Offset_0x031AA0
                dc.w    Offset_0x031AB0-Offset_0x031AA0
                dc.w    Offset_0x031AB6-Offset_0x031AA0
;-------------------------------------------------------------------------------   
Offset_0x031AA8:
                rts
;-------------------------------------------------------------------------------                  
Offset_0x031AAA:
                exg.l   D2, D3
                neg.w   D3
                rts
;-------------------------------------------------------------------------------                  
Offset_0x031AB0:
                neg.w   D2
                neg.w   D3
                rts
;-------------------------------------------------------------------------------                  
Offset_0x031AB6:
                exg.l   D2, D3
                neg.w   D2
                rts       
;------------------------------------------------------------------------------- 
Obj_0x96_Ptr:                                                  ; Offset_0x031ABC
                dc.l    Rexon_Mappings                         ; Offset_0x031AC6
                dc.w    $637E
                dc.b    $04, $04, $10, $00    
;-------------------------------------------------------------------------------
Rexon_Mappings:                                                ; Offset_0x031AC6
                dc.w    Offset_0x031ACE-Rexon_Mappings
                dc.w    Offset_0x031AD8-Rexon_Mappings
                dc.w    Offset_0x031AE2-Rexon_Mappings
                dc.w    Offset_0x031AEC-Rexon_Mappings
Offset_0x031ACE:
                dc.w    $0001
                dc.l    $FA090000, $0000FFEC
Offset_0x031AD8:
                dc.w    $0001
                dc.l    $F8050006, $0003FFF8
Offset_0x031AE2:
                dc.w    $0001
                dc.l    $F80D000A, $0005FFF0
Offset_0x031AEC:
                dc.w    $0001
                dc.l    $FC000012, $0009FFFC    
;-------------------------------------------------------------------------------  
Offset_0x031AF6:
                dc.b    $0F, $00, $0F, $FF, $0F, $FF, $0F, $FE
                dc.b    $0F, $FD, $0F, $FC, $0E, $FC, $0E, $FB
                dc.b    $0E, $FA, $0E, $FA, $0D, $F9, $0D, $F8
                dc.b    $0C, $F8, $0C, $F7, $0C, $F6, $0B, $F6
                dc.b    $0B, $F5, $0A, $F5, $0A, $F4, $09, $F4
                dc.b    $08, $F4, $08, $F3, $07, $F3, $06, $F2
                dc.b    $06, $F2, $05, $F2, $04, $F2, $04, $F1
                dc.b    $03, $F1, $02, $F1, $01, $F1, $01, $F1                                                                                                  
;===============================================================================
; Objeto 0x97 - Cabeça do inimigo Rexon na Hill Top (Inimigo tipo cobra que
; <<<-          atira bolas de fogo no jogador)
;===============================================================================