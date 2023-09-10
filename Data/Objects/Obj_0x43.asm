;===============================================================================
; Objeto 0x43 - Bola gigante com espinhos na Oil Ocean
; ->>>        
;===============================================================================  
; Offset_0x01E8B0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01E8BE(PC, D0), D1
                jmp     Offset_0x01E8BE(PC, D1)    
;-------------------------------------------------------------------------------
Offset_0x01E8BE:
                dc.w    Offset_0x01E8D6-Offset_0x01E8BE
                dc.w    Offset_0x01E97A-Offset_0x01E8BE
                dc.w    Offset_0x01E9CC-Offset_0x01E8BE
;-------------------------------------------------------------------------------
Offset_0x01E8C4:
                dc.b    $00, $68
                dc.w    $0000, $0000
                dc.b    $01, $E8
                dc.w    $FFE8, $0018
                dc.b    $01, $A8
                dc.w    $FFA8, $FFD8   
;-------------------------------------------------------------------------------
Offset_0x01E8D6:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.w  #$C30C, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_0B_To_ModifySpriteAttr_2P          ; Offset_0x01EA8A
                moveq   #$00, D1
                move.b  Obj_Subtype(A0), D1                              ; $0028
                lea     Offset_0x01E8C4(PC, D1), A2
                move.b  (A2)+, D1
                move.l  A0, A1
                bra.s   Offset_0x01E918     
;-------------------------------------------------------------------------------
Offset_0x01E8F4:
                bsr     Jmp_05_To_SingleObjectLoad_2           ; Offset_0x01EA84
                bne.s   Offset_0x01E944
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.b  #$01, Obj_Control_Var_0A(A1)                     ; $0036
Offset_0x01E918:
                move.l  #Giant_Spikeball_Mappings, Obj_Map(A1) ; Offset_0x01EA50, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$18, Obj_Width(A1)                              ; $0019
                move.b  #$A5, Obj_Col_Flags(A1)                          ; $0020
                move.w  Obj_X(A1), Obj_Control_Var_04(A1)         ; $0008, $0030
Offset_0x01E944:
                dbra    D1, Offset_0x01E8F4
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
                move.l  A1, Obj_Control_Var_10(A0)                       ; $003C
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
Offset_0x01E97A:
                bsr.s   Offset_0x01E9D6
                move.w  Obj_Control_Var_06(A0), D0                       ; $0032
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bls.s   Offset_0x01E9A0
                move.w  Obj_Control_Var_08(A0), D0                       ; $0034
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x01E9A6
Offset_0x01E9A0:
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x01E9A6:
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                cmpa.l  A0, A1
                beq.s   Offset_0x01E9B4
                jsr     (DeleteObject_A1)                      ; Offset_0x0120D2
Offset_0x01E9B4:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                beq.s   Offset_0x01E9C6
                bclr    #$07, $02(A2, D0)
Offset_0x01E9C6:
                jmp     (DeleteObject)                         ; Offset_0x0120D0  
;-------------------------------------------------------------------------------
Offset_0x01E9CC:
                bsr.s   Offset_0x01E9D6
                bsr.s   Offset_0x01EA20
                jmp     (DisplaySprite)                        ; Offset_0x0120DE
Offset_0x01E9D6:
                tst.b   Obj_Control_Var_0A(A0)                           ; $0036
                bne.s   Offset_0x01E9FE
                move.w  Obj_X(A0), D1                                    ; $0008
                subq.w  #$01, D1
                cmp.w   Obj_Control_Var_06(A0), D1                       ; $0032
                bne.s   Offset_0x01E9F8
                move.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                move.w  #$00D5, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01E9F8:
                move.w  D1, Obj_X(A0)                                    ; $0008
                rts
Offset_0x01E9FE:
                move.w  Obj_X(A0), D1                                    ; $0008
                addq.w  #$01, D1
                cmp.w   Obj_Control_Var_08(A0), D1                       ; $0034
                bne.s   Offset_0x01EA1A
                move.b  #$00, Obj_Control_Var_0A(A0)                     ; $0036
                move.w  #$00D5, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01EA1A:
                move.w  D1, Obj_X(A0)                                    ; $0008
                rts
Offset_0x01EA20:
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.w  Obj_X(A0), D0                                    ; $0008
                subi.w  #$0018, D0
                move.w  Obj_X(A1), D2                                    ; $0008
                addi.w  #$0018, D2
                cmp.w   D0, D2
                bne.s   Offset_0x01EA4E
                eori.b  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                eori.b  #$01, Obj_Control_Var_0A(A1)                     ; $0036
                move.w  #$00D5, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01EA4E:
                rts                             
;-------------------------------------------------------------------------------
Giant_Spikeball_Mappings:                                      ; Offset_0x01EA50
                dc.w    Offset_0x01EA52-Giant_Spikeball_Mappings
Offset_0x01EA52:
                dc.w    $0006
                dc.l    $E0050000, $0000FFE8
                dc.l    $D80F0004, $0002FFF8
                dc.l    $F8090014, $000AFFE8
                dc.l    $F809001A, $000D0000
                dc.l    $10051000, $1000FFE8
                dc.l    $080F1004, $1002FFF8                                               
;===============================================================================   
; Objeto 0x43 - Bola gigante com espinhos na Oil Ocean
; <<<-        
;===============================================================================