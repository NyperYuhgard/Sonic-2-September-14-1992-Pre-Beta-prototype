;===============================================================================
; Objeto 0x17 - Espinhos em espiral girando na Green Hill - Left over do Sonic 1
; ->>>
;===============================================================================
; Offset_0x00D5A0:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00D5AE(PC, D0), D1
                jmp     Offset_0x00D5AE(PC, D1)
;-------------------------------------------------------------------------------
Offset_0x00D5AE:
                dc.w    Offset_0x00D5B4-Offset_0x00D5AE
                dc.w    Offset_0x00D678-Offset_0x00D5AE
                dc.w    Offset_0x00D6DA-Offset_0x00D5AE
;-------------------------------------------------------------------------------
Offset_0x00D5B4:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Log_Spikes_Mappings, Obj_Map(A0) ; Offset_0x00D6E2, $0004
                move.w  #$4398, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  Obj_X(A0), D3                                    ; $0008
                move.b  Obj_Id(A0), D4                                   ; $0000
                lea     Obj_Subtype(A0), A2                              ; $0028
                moveq   #$00, D1
                move.b  (A2), D1
                move.b  #$00, (A2)+
                move.w  D1, D0
                lsr.w   #$01, D0
                lsl.w   #$04, D0
                sub.w   D0, D3
                subq.b  #$02, D1
                bcs.s   Offset_0x00D678
                moveq   #$00, D6
Offset_0x00D602:
                bsr     SingleObjectLoad_2                     ; Offset_0x013BC0
                bne.s   Offset_0x00D678
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
                move.w  A1, D5
                subi.w  #$B000, D5
                lsr.w   #$06, D5
                andi.w  #$007F, D5
                move.b  D5, (A2)+
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.b  D4, Obj_Id(A1)                                   ; $0000
                move.w  D2, Obj_Y(A1)                                    ; $000C
                move.w  D3, Obj_X(A1)                                    ; $0008
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  #$4398, Obj_Art_VRAM(A1)                         ; $0002
                bsr     ModifySpriteAttr_2P_A1                 ; Offset_0x0129AA
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$08, Obj_Width(A1)                              ; $0019
                move.b  D6, Obj_Control_Var_12(A1)                       ; $003E
                addq.b  #$01, D6
                andi.b  #$07, D6
                addi.w  #$0010, D3
                cmp.w   Obj_X(A0), D3                                    ; $0008
                bne.s   Offset_0x00D674
                move.b  D6, Obj_Control_Var_12(A0)                       ; $003E
                addq.b  #$01, D6
                andi.b  #$07, D6
                addi.w  #$0010, D3
                addq.b  #$01, Obj_Subtype(A0)                            ; $0028
Offset_0x00D674:
                dbra    D1, Offset_0x00D602
;-------------------------------------------------------------------------------                
Offset_0x00D678:
                bsr     Offset_0x00D6BA
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x00D694
                bra     DisplaySprite                          ; Offset_0x0120DE
Offset_0x00D694:
                moveq   #$00, D2
                lea     Obj_Subtype(A0), A2                              ; $0028
                move.b  (A2)+, D2
                subq.b  #$02, D2
                bcs.s   Offset_0x00D6B6
Offset_0x00D6A0:
                moveq   #$00, D0
                move.b  (A2)+, D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A1
                bsr     DeleteObject_A1                        ; Offset_0x0120D2
                dbra    D2, Offset_0x00D6A0
Offset_0x00D6B6:
                bra     DeleteObject                           ; Offset_0x0120D0
Offset_0x00D6BA:
                move.b  ($FFFFFEA1).w, D0
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                add.b   Obj_Control_Var_12(A0), D0                       ; $003E
                andi.b  #$07, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                bne.s   Offset_0x00D6D8
                move.b  #$84, Obj_Col_Flags(A0)                          ; $0020
Offset_0x00D6D8:
                rts
;-------------------------------------------------------------------------------                
Offset_0x00D6DA:
                bsr     Offset_0x00D6BA
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------
Log_Spikes_Mappings:                                           ; Offset_0x00D6E2
                dc.w    Offset_0x00D6F2-Log_Spikes_Mappings
                dc.w    Offset_0x00D6FC-Log_Spikes_Mappings
                dc.w    Offset_0x00D706-Log_Spikes_Mappings
                dc.w    Offset_0x00D710-Log_Spikes_Mappings
                dc.w    Offset_0x00D71A-Log_Spikes_Mappings
                dc.w    Offset_0x00D724-Log_Spikes_Mappings
                dc.w    Offset_0x00D738-Log_Spikes_Mappings
                dc.w    Offset_0x00D72E-Log_Spikes_Mappings
;-------------------------------------------------------------------------------
Offset_0x00D6F2:
                dc.w    $0001
                dc.l    $F0010000, $0000FFFC
Offset_0x00D6FC:
                dc.w    $0001
                dc.l    $F5050002, $0001FFF8
Offset_0x00D706:
                dc.w    $0001
                dc.l    $F8050006, $0003FFF8
Offset_0x00D710:
                dc.w    $0001
                dc.l    $FB05000A, $0005FFF8
Offset_0x00D71A:
                dc.w    $0001
                dc.l    $0001000E, $0007FFFC
Offset_0x00D724:
                dc.w    $0001
                dc.l    $04000010, $0008FFFD
Offset_0x00D72E:
                dc.w    $0001
                dc.l    $F4000011, $0008FFFD
Offset_0x00D738:
                dc.w    $0000       
;===============================================================================
; Objeto 0x17 - Espinhos em espiral girando na Green Hill - Left over do Sonic 1
; <<<-
;===============================================================================