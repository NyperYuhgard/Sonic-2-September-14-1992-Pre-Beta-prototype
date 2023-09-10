;===============================================================================
; Objeto 0x6E - Máquina na Metropolis
; ->>>        
;===============================================================================     
; Offset_0x022DA0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x022DAE(PC, D0), D1
                jmp     Offset_0x022DAE(PC, D1)    
;-------------------------------------------------------------------------------
Offset_0x022DAE:
                dc.w    Offset_0x022DBC-Offset_0x022DAE
                dc.w    Offset_0x022E26-Offset_0x022DAE
                dc.w    Offset_0x022EB0-Offset_0x022DAE
;-------------------------------------------------------------------------------    
Offset_0x022DB4:
                dc.b    $10, $0C, $28, $08, $60, $18, $0C, $0C
;-------------------------------------------------------------------------------
Offset_0x022DBC:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Machine_Mappings, Obj_Map(A0)  ; Offset_0x022F20, $0004
                move.w  #$6000, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_1C_To_ModifySpriteAttr_2P          ; Offset_0x022FA8
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$04, Obj_Priority(A0)                           ; $0018
                moveq   #$00, D0
                move.b  Obj_Subtype(A0), D0                              ; $0028
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                lea     Offset_0x022DB4(PC, D0), A3
                move.b  (A3)+, Obj_Width(A0)                             ; $0019
                move.b  (A3)+, Obj_Height_2(A0)                          ; $0016
                lsr.w   #$01, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.w  Obj_X(A0), Obj_Control_Var_08(A0)         ; $0008, $0034
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
                cmpi.b  #$03, D0
                bne.s   Offset_0x022E26
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$63F0, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_1C_To_ModifySpriteAttr_2P          ; Offset_0x022FA8
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                bra     Offset_0x022EB0
Offset_0x022E26:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                move.b  ($FFFFFE80).w, D1
                subi.b  #$38, D1
                ext.w   D1
                move.b  ($FFFFFE84).w, D2
                subi.b  #$38, D2
                ext.w   D2
                btst    #$00, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x022E4A
                neg.w   D1
                neg.w   D2
Offset_0x022E4A:
                btst    #$01, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x022E56
                neg.w   D1
                exg.l   D1, D2
Offset_0x022E56:
                add.w   Obj_Control_Var_08(A0), D1                       ; $0034
                move.w  D1, Obj_X(A0)                                    ; $0008
                add.w   Obj_Control_Var_04(A0), D2                       ; $0030
                move.w  D2, Obj_Y(A0)                                    ; $000C
                move.w  (A7)+, D4
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  Obj_Height_2(A0), D2                             ; $0016
                move.w  D2, D3
                addq.w  #$01, D3
                bsr     Jmp_0C_To_SolidObject                  ; Offset_0x022FAE
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x022E98
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x022E98:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x022EAA
                bclr    #$07, $02(A2, D0)
Offset_0x022EAA:
                jmp     (DeleteObject)                         ; Offset_0x0120D0
Offset_0x022EB0:
                move.b  ($FFFFFE80).w, D1
                lsr.b   #$01, D1
                subi.b  #$1C, D1
                ext.w   D1
                move.b  ($FFFFFE84).w, D2
                lsr.b   #$01, D2
                subi.b  #$1C, D2
                ext.w   D2
                btst    #$00, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x022ED4
                neg.w   D1
                neg.w   D2
Offset_0x022ED4:
                btst    #$01, Obj_Subtype(A0)                            ; $0028
                beq.s   Offset_0x022EE0
                neg.w   D1
                exg.l   D1, D2
Offset_0x022EE0:
                add.w   Obj_Control_Var_08(A0), D1                       ; $0034
                move.w  D1, Obj_X(A0)                                    ; $0008
                add.w   Obj_Control_Var_04(A0), D2                       ; $0030
                move.w  D2, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x022F08
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x022F08:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x022F1A
                bclr    #$07, $02(A2, D0)
Offset_0x022F1A:
                jmp     (DeleteObject)                         ; Offset_0x0120D0  
;-------------------------------------------------------------------------------   
Machine_Mappings:                                              ; Offset_0x022F20
                dc.w    Offset_0x022F28-Machine_Mappings
                dc.w    Offset_0x022F32-Machine_Mappings
                dc.w    Offset_0x022F4C-Machine_Mappings
                dc.w    Offset_0x022F9E-Machine_Mappings
Offset_0x022F28:
                dc.w    $0001
                dc.l    $F40E0025, $0012FFF0
Offset_0x022F32:
                dc.w    $0003
                dc.l    $F80D0031, $0018FFD8
                dc.l    $F80D0031, $0018FFF8
                dc.l    $F8050031, $00180018
Offset_0x022F4C:
                dc.w    $000A
                dc.l    $E80E0039, $001CFFA0
                dc.l    $E80E0839, $081CFFC0
                dc.l    $E80E0039, $001CFFE0
                dc.l    $E80E0839, $081C0000
                dc.l    $E80E0039, $001C0020
                dc.l    $E80E0839, $081C0040
                dc.l    $00060045, $0022FFA0
                dc.l    $00060845, $0822FFB0
                dc.l    $00060045, $00220040
                dc.l    $00060845, $08220050
Offset_0x022F9E:
                dc.w    $0001
                dc.l    $F40A0000, $0000FFF4                                                   
;===============================================================================   
; Objeto 0x6E - Máquina na Metropolis
; <<<-        
;===============================================================================