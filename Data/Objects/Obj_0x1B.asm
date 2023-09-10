;===============================================================================
; Objeto 0x1B - Propulsor automático na Chemical Plant
; ->>>          
;===============================================================================  
; Offset_0x01CD1C:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01CD2A(PC, D0), D1
                jmp     Offset_0x01CD2A(PC, D1)  
;-------------------------------------------------------------------------------
Offset_0x01CD2A:
                dc.w    Offset_0x01CD32-Offset_0x01CD2A
                dc.w    Offset_0x01CD68-Offset_0x01CD2A
;-------------------------------------------------------------------------------
Offset_0x01CD2E:
                dc.w    $1000, $0A00 
;-------------------------------------------------------------------------------
Offset_0x01CD32:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #CPz_Speed_Booster_Mappings, Obj_Map(A0) ; Offset_0x01CE52, $0004
                move.w  #$E39C, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_08_To_ModifySpriteAttr_2P          ; Offset_0x01CE72
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$20, Obj_Width(A0)                              ; $0019
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$0002, D0
                move.w  Offset_0x01CD2E(PC, D0), Obj_Control_Var_04(A0)  ; $0030 
;-------------------------------------------------------------------------------
Offset_0x01CD68:
                move.b  ($FFFFFE05).w, D0
                andi.b  #$02, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                move.w  Obj_X(A0), D0                                    ; $0008
                move.w  D0, D1
                subi.w  #$0010, D0
                addi.w  #$0010, D1
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                subi.w  #$0010, D2
                addi.w  #$0010, D3
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x01CDC4
                move.w  Obj_X(A1), D4                                    ; $0008
                cmp.w   D0, D4
                bcs     Offset_0x01CDC4
                cmp.w   D1, D4
                bcc     Offset_0x01CDC4
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                bcs     Offset_0x01CDC4
                cmp.w   D3, D4
                bcc     Offset_0x01CDC4
                move.w  D0, -(A7)
                bsr     Offset_0x01CDF8
                move.w  (A7)+, D0
Offset_0x01CDC4:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne.s   Offset_0x01CDF4
                move.w  Obj_X(A1), D4                                    ; $0008
                cmp.w   D0, D4
                bcs     Offset_0x01CDF4
                cmp.w   D1, D4
                bcc     Offset_0x01CDF4
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                bcs     Offset_0x01CDF4
                cmp.w   D3, D4
                bcc     Offset_0x01CDF4
                bsr     Offset_0x01CDF8
Offset_0x01CDF4:
                bra     Jmp_04_To_MarkObjGone                  ; Offset_0x01CE6C
Offset_0x01CDF8:
                move.w  Obj_Speed(A1), D0                                ; $0010
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01CE06
                neg.w   D0
Offset_0x01CE06:
                cmpi.w  #$1000, D0
                bge.s   Offset_0x01CE48
                move.w  Obj_Control_Var_04(A0), Obj_Speed(A1)     ; $0010, $0030
                bclr    #$00, Obj_Status(A1)                             ; $0022
                btst    #$00, Obj_Status(A0)                             ; $0022
                beq.s   Offset_0x01CE2A
                bset    #$00, Obj_Status(A1)                             ; $0022
                neg.w   Obj_Speed(A1)                                    ; $0010
Offset_0x01CE2A:
                move.w  #$000F, Obj_Control_Var_02(A1)                   ; $002E
                move.w  Obj_Speed(A1), Obj_Inertia(A1)            ; $0010, $0014
                bclr    #$05, Obj_Status(A0)                             ; $0022
                bclr    #$06, Obj_Status(A0)                             ; $0022
                bclr    #$05, Obj_Status(A1)                             ; $0022
Offset_0x01CE48:
                move.w  #$00CC, D0
                jmp     (Play_Sfx)                             ; Offset_0x001912 
;-------------------------------------------------------------------------------
CPz_Speed_Booster_Mappings:                                    ; Offset_0x01CE52
                dc.w    Offset_0x01CE58-CPz_Speed_Booster_Mappings
                dc.w    Offset_0x01CE58-CPz_Speed_Booster_Mappings
                dc.w    Offset_0x01CE6A-CPz_Speed_Booster_Mappings
Offset_0x01CE58:
                dc.w    $0002
                dc.l    $F8050000, $0000FFE8
                dc.l    $F8050000, $00000008
Offset_0x01CE6A:
                dc.w    $0000                                                                                   
;===============================================================================   
; Objeto 0x1B - Propulsor automático na Chemical Plant
; <<<-
;===============================================================================