;===============================================================================
; Objeto 0x8B - Muda a paleta entre as turbinas e escadas na Sky Fortress
; ->>>
;===============================================================================
; Offset_0x01BE30:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01BE4C(PC, D0), D1
                jsr     Offset_0x01BE4C(PC, D1)
                tst.w   (Debug_Mode_Active_Flag).w                   ; $FFFFFFFA
                beq     Jmp_01_To_MarkObjGone_3                ; Offset_0x01BF5C
                jmp     (MarkObjGone)                          ; Offset_0x011FBC 
;-------------------------------------------------------------------------------  
Offset_0x01BE4C:
                dc.w    Offset_0x01BE58-Offset_0x01BE4C
                dc.w    Offset_0x01BEB8-Offset_0x01BE4C
;-------------------------------------------------------------------------------  
Offset_0x01BE50:
                dc.w    $0020, $0040, $0080, $0100
;-------------------------------------------------------------------------------   
Offset_0x01BE58:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Layer_Switch_Mappings, Obj_Map(A0) ; Offset_0x01AA5C, $0004
                move.w  #$06BC, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_04_To_ModifySpriteAttr_2P          ; Offset_0x01BF62
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                andi.w  #$0003, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                add.w   D0, D0
                move.w  Offset_0x01BE50(PC, D0), Obj_Control_Var_06(A0)  ; $0032
                move.w  Obj_X(A0), D1                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bcc.s   Offset_0x01BEA8
                move.b  #$01, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x01BEA8:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bcc.s   Offset_0x01BEB8
                move.b  #$01, Obj_Control_Var_09(A0)                     ; $0035
Offset_0x01BEB8:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x01BF10
                move.w  Obj_X(A0), D1                                    ; $0008
                lea     Obj_Control_Var_08(A0), A2                       ; $0034
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x01BED0
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x01BED0:
                tst.b   (A2)+
                bne.s   Offset_0x01BF12
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bhi.s   Offset_0x01BF10
                move.b  #$01, -1(A2)
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                move.w  Obj_Control_Var_06(A0), D4                       ; $0032
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                bcs.s   Offset_0x01BF10
                cmp.w   D3, D4
                bcc.s   Offset_0x01BF10
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x01BF0A
                move.b  #$01, ($FFFFF72E).w
                rts
Offset_0x01BF0A:
                move.b  #$00, ($FFFFF72E).w
Offset_0x01BF10:
                rts
Offset_0x01BF12:
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bls.s   Offset_0x01BF10
                move.b  #$00, -1(A2)
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                move.w  Obj_Control_Var_06(A0), D4                       ; $0032
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                bcs.s   Offset_0x01BF10
                cmp.w   D3, D4
                bcc.s   Offset_0x01BF10
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x01BF48
                move.b  #$01, ($FFFFF72E).w
                rts
Offset_0x01BF48:
                move.b  #$00, ($FFFFF72E).w
                rts                                                                                                                                          
;===============================================================================
; Objeto 0x8B - Muda a paleta entre as turbinas e escadas na Sky Fortress
; <<<-
;===============================================================================