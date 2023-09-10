;===============================================================================
; Objeto 0x7A - Plataformas com movimentos horizontais na Chemical Plant,
; ->>>          Dust Hill
;===============================================================================
; Offset_0x0240DC:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x0240EA(PC, D0), D1
                jmp     Offset_0x0240EA(PC, D1)
;-------------------------------------------------------------------------------    
Offset_0x0240EA:
                dc.w    Offset_0x024108-Offset_0x0240EA
                dc.w    Offset_0x0241CA-Offset_0x0240EA
                dc.w    Offset_0x024226-Offset_0x0240EA      
;-------------------------------------------------------------------------------    
Offset_0x0240F0:
                dc.b    $00, $68, $FF, $98, $00, $00, $01, $A8
                dc.b    $FF, $50, $00, $40, $01, $E8, $FF, $80
                dc.b    $00, $80, $00, $68, $00, $67, $00, $00    
;-------------------------------------------------------------------------------    
Offset_0x024108:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Platform_Horizontal_Mappings, Obj_Map(A0) ; Offset_0x0242A0, $0004
                move.w  #$E418, Obj_Art_VRAM(A0)                         ; $0002
                cmpi.b  #$0B, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x024130
                move.l  #DHz_Swing_Platforms_Mappings, Obj_Map(A0) ; Offset_0x00D4F2, $0004
                move.w  #$0000, Obj_Art_VRAM(A0)                         ; $0002
Offset_0x024130:
                bsr     Jmp_22_To_ModifySpriteAttr_2P          ; Offset_0x0242C0
                moveq   #$00, D1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                lea     Offset_0x0240F0(PC, D1), A2
                move.b  (A2)+, D1
                move.l  A0, A1
                bra.s   Offset_0x024162    
;-------------------------------------------------------------------------------    
Offset_0x024144:
                bsr     Jmp_0E_To_SingleObjectLoad_2           ; Offset_0x0242BA
                bne.s   Offset_0x024186
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
Offset_0x024162:
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$18, Obj_Width(A1)                              ; $0019
                move.w  Obj_X(A1), Obj_Control_Var_04(A1)         ; $0008, $0030
Offset_0x024186:
                dbra    D1, Offset_0x024144
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
                move.l  A1, Obj_Control_Var_10(A0)                       ; $003C
                cmpi.b  #$0C, Obj_Subtype(A0)                            ; $0028
                bne.s   Offset_0x0241A0
                move.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
Offset_0x0241A0:
                moveq   #$00, D1
                move.b  (A2)+, D1
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                sub.w   D1, D0
                move.w  D0, Obj_Control_Var_06(A0)                       ; $0032
                move.w  D0, Obj_Control_Var_06(A1)                       ; $0032
                add.w   D1, D0
                add.w   D1, D0
                move.w  D0, Obj_Control_Var_08(A0)                       ; $0034
                move.w  D0, Obj_Control_Var_08(A1)                       ; $0034
                move.w  (A2)+, D0
                add.w   D0, Obj_X(A0)                                    ; $0008
                move.w  (A2)+, D0
                add.w   D0, Obj_X(A1)                                    ; $0008    
;------------------------------------------------------------------------------- 
Offset_0x0241CA:
                bsr.s   Offset_0x024230
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFD8
                beq.s   Offset_0x0241D6
                bra     Jmp_11_To_DisplaySprite                ; Offset_0x0242B4
Offset_0x0241D6:
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bls.s   Offset_0x0241FA
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x024200
Offset_0x0241FA:
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x024200:
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                cmpa.l  A0, A1
                beq.s   Offset_0x02420E
                jsr     (DeleteObject_A1)                      ; Offset_0x0120D2
Offset_0x02420E:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x024220
                bclr    #$07, $02(A2, D0)
Offset_0x024220:
                jmp     (DeleteObject)                         ; Offset_0x0120D0     
;------------------------------------------------------------------------------- 
Offset_0x024226:
                bsr.s   Offset_0x024230
                bsr.s   Offset_0x02427A
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x024230:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                tst.b   Obj_Control_Var_0A(A0)                           ; $0036
                beq.s   Offset_0x024252
                move.w  Obj_X(A0), D0                                    ; $0008
                subq.w  #$01, D0
                cmp.w   Obj_Control_Var_06(A0), D0                       ; $0032
                bne.s   Offset_0x02424C
                move.b  #$00, Obj_Control_Var_0A(A0)                     ; $0036
Offset_0x02424C:
                move.w  D0, Obj_X(A0)                                    ; $0008
                bra.s   Offset_0x024268
Offset_0x024252:
                move.w  Obj_X(A0), D0                                    ; $0008
                addq.w  #$01, D0
                cmp.w   Obj_Control_Var_08(A0), D0                       ; $0034
                bne.s   Offset_0x024264
                move.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
Offset_0x024264:
                move.w  D0, Obj_X(A0)                                    ; $0008
Offset_0x024268:
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                move.w  #$0008, D3
                move.w  (A7)+, D4
                bsr     Jmp_01_To_Platform_Object              ; Offset_0x0242C6
                rts
Offset_0x02427A:
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.w  Obj_X(A0), D0                                    ; $0008
                subi.w  #$0018, D0
                move.w  Obj_X(A1), D2                                    ; $0008
                addi.w  #$0018, D2
                cmp.w   D0, D2
                bne.s   Offset_0x02429E
                eori.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                eori.b  #$01, Obj_Control_Var_0A(A1)                     ; $0036
Offset_0x02429E:
                rts
;-------------------------------------------------------------------------------
Platform_Horizontal_Mappings:                                  ; Offset_0x0242A0
                dc.w    Offset_0x0242A2-Platform_Horizontal_Mappings
Offset_0x0242A2:
                dc.w    $0002
                dc.l    $F8090010, $0008FFE8
                dc.l    $F8090810, $08080000
;===============================================================================
; Objeto 0x7A - Plataformas com movimentos horizontais na Chemical Plant,
; <<<-          Dust Hill
;===============================================================================