;===============================================================================
; Objeto 0x03 - Alterna o plano do cen�rio em rela��o ao jogador
; ->>>        
;===============================================================================  
; Offset_0x01A758:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01A774(PC, D0), D1
                jsr     Offset_0x01A774(PC, D1)
                tst.w   ($FFFFFFFA).w
                beq     Jmp_00_To_MarkObjGone_3                ; Offset_0x01AB38
                jmp     (MarkObjGone)                          ; Offset_0x011FBC
Offset_0x01A774:                
                dc.w    Offset_0x01A77A-Offset_0x01A774
                dc.w    Offset_0x01A828-Offset_0x01A774
                dc.w    Offset_0x01A942-Offset_0x01A774
Offset_0x01A77A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Layer_Switch_Mappings, Obj_Map(A0) ; Offset_0x01AA5C, $0004
                move.w  #$26BC, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                btst    #$02, D0
                beq.s   Offset_0x01A7F4
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                andi.w  #$0007, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                andi.w  #$0003, D0
                add.w   D0, D0
                move.w  Layer_Switch_Conf(PC, D0), $0032(A0)   ; Offset_0x01A7EC
                move.w  Obj_Y(A0), D1                                    ; $000C
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                cmp.w   Obj_Y(A1), D1                                    ; $000C
                bcc.s   Offset_0x01A7D8
                move.b  #$01, $0034(A0)
Offset_0x01A7D8:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                cmp.w   Obj_Y(A1), D1                                    ; $000C
                bcc.s   Offset_0x01A7E8
                move.b  #$01, $0035(A0)
Offset_0x01A7E8:
                bra     Offset_0x01A942  
Layer_Switch_Conf:                                             ; Offset_0x01A7EC
                dc.w    $0020, $0040, $0080, $0100              
Offset_0x01A7F4:
                andi.w  #$0003, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                add.w   D0, D0
                move.w  Layer_Switch_Conf(PC, D0), $0032(A0)   ; Offset_0x01A7EC
                move.w  Obj_X(A0), D1                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bcc.s   Offset_0x01A818
                move.b  #$01, $0034(A0)
Offset_0x01A818:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bcc.s   Offset_0x01A828
                move.b  #$01, $0035(A0)
Offset_0x01A828:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne     Offset_0x01A940
                move.w  Obj_X(A0), D1                                    ; $0008
                lea     $0034(A0), A2
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x01A842
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x01A842:
                tst.b   (A2)+
                bne.s   Offset_0x01A8BC
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bhi     Offset_0x01A940
                move.b  #$01, -1(A2)
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                blt     Offset_0x01A940
                cmp.w   D3, D4
                bge     Offset_0x01A940
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x01A882
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne     Offset_0x01A940
Offset_0x01A882:
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x01A8A8
                move.b  #$0C, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0D, Obj_Player_LRB_Solid(A1)                   ; $003F
                btst    #$03, D0
                beq.s   Offset_0x01A8A8
                move.b  #$0E, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0F, Obj_Player_LRB_Solid(A1)                   ; $003F
Offset_0x01A8A8:
                andi.w  #$7FFF, Obj_Art_VRAM(A1)                         ; $0002
                btst    #$05, D0
                beq.s   Offset_0x01A930
                ori.w   #$8000, Obj_Art_VRAM(A1)                         ; $0002
                bra.s   Offset_0x01A930
Offset_0x01A8BC:
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bls     Offset_0x01A940
                move.b  #$00, -1(A2)
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                blt     Offset_0x01A940
                cmp.w   D3, D4
                bge     Offset_0x01A940
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x01A8F8
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne     Offset_0x01A940
Offset_0x01A8F8:
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x01A91E
                move.b  #$0C, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0D, Obj_Player_LRB_Solid(A1)                   ; $003F
                btst    #$04, D0
                beq.s   Offset_0x01A91E
                move.b  #$0E, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0F, Obj_Player_LRB_Solid(A1)                   ; $003F
Offset_0x01A91E:
                andi.w  #$7FFF, Obj_Art_VRAM(A1)                         ; $0002
                btst    #$06, D0
                beq.s   Offset_0x01A930
                ori.w   #$8000, Obj_Art_VRAM(A1)                         ; $0002
Offset_0x01A930:
                tst.w   ($FFFFFFFA).w
                beq.s   Offset_0x01A940
                move.w  #$00A1, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x01A940:
                rts
Offset_0x01A942:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne     Offset_0x01AA5A
                move.w  Obj_Y(A0), D1                                    ; $000C
                lea     $0034(A0), A2
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x01A95C
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x01A95C:
                tst.b   (A2)+
                bne.s   Offset_0x01A9D6
                cmp.w   Obj_Y(A1), D1                                    ; $000C
                bhi     Offset_0x01AA5A
                move.b  #$01, -1(A2)
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_X(A1), D4                                    ; $0008
                cmp.w   D2, D4
                blt     Offset_0x01AA5A
                cmp.w   D3, D4
                bge     Offset_0x01AA5A
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x01A99C
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne     Offset_0x01AA5A
Offset_0x01A99C:
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x01A9C2
                move.b  #$0C, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0D, Obj_Player_LRB_Solid(A1)                   ; $003F
                btst    #$03, D0
                beq.s   Offset_0x01A9C2
                move.b  #$0E, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0F, Obj_Player_LRB_Solid(A1)                   ; $003F
Offset_0x01A9C2:
                andi.w  #$7FFF, Obj_Art_VRAM(A1)                         ; $0002
                btst    #$05, D0
                beq.s   Offset_0x01AA4A
                ori.w   #$8000, Obj_Art_VRAM(A1)                         ; $0002
                bra.s   Offset_0x01AA4A
Offset_0x01A9D6:
                cmp.w   Obj_Y(A1), D1                                    ; $000C
                bls     Offset_0x01AA5A
                move.b  #$00, -1(A2)
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_X(A1), D4                                    ; $0008
                cmp.w   D2, D4
                blt     Offset_0x01AA5A
                cmp.w   D3, D4
                bge     Offset_0x01AA5A
                move.b  Obj_Subtype(A0), D0                              ; $0028
                bpl.s   Offset_0x01AA12
                btst    #$01, Obj_Status(A1)                             ; $0022
                bne     Offset_0x01AA5A
Offset_0x01AA12:
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x01AA38
                move.b  #$0C, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0D, Obj_Player_LRB_Solid(A1)                   ; $003F
                btst    #$04, D0
                beq.s   Offset_0x01AA38
                move.b  #$0E, Obj_Player_Top_Solid(A1)                   ; $003E
                move.b  #$0F, Obj_Player_LRB_Solid(A1)                   ; $003F
Offset_0x01AA38:
                andi.w  #$7FFF, Obj_Art_VRAM(A1)                         ; $0002
                btst    #$06, D0
                beq.s   Offset_0x01AA4A
                ori.w   #$8000, Obj_Art_VRAM(A1)                         ; $0002
Offset_0x01AA4A:
                tst.w   ($FFFFFFFA).w
                beq.s   Offset_0x01AA5A
                move.w  #$00A1, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x01AA5A:
                rts    
;-------------------------------------------------------------------------------   
Layer_Switch_Mappings:                                         ; Offset_0x01AA5C
                dc.w    Offset_0x01AA6C-Layer_Switch_Mappings
                dc.w    Offset_0x01AA8E-Layer_Switch_Mappings
                dc.w    Offset_0x01AAB0-Layer_Switch_Mappings
                dc.w    Offset_0x01AAB0-Layer_Switch_Mappings
                dc.w    Offset_0x01AAD2-Layer_Switch_Mappings
                dc.w    Offset_0x01AAF4-Layer_Switch_Mappings
                dc.w    Offset_0x01AB16-Layer_Switch_Mappings
                dc.w    Offset_0x01AB16-Layer_Switch_Mappings
Offset_0x01AA6C:
                dc.w    $0004
                dc.l    $E0050000, $0000FFF8, $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $10050000, $0000FFF8
Offset_0x01AA8E:
                dc.w    $0004
                dc.l    $C0050000, $0000FFF8, $E0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $30050000, $0000FFF8
Offset_0x01AAB0:
                dc.w    $0004
                dc.l    $80050000, $0000FFF8, $E0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $70050000, $0000FFF8
Offset_0x01AAD2:
                dc.w    $0004
                dc.l    $F8050000, $0000FFE0, $F8050000, $0000FFF0
                dc.l    $F8050000, $00000000, $F8050000, $00000010
Offset_0x01AAF4:
                dc.w    $0004
                dc.l    $F8050000, $0000FFC0, $F8050000, $0000FFE0
                dc.l    $F8050000, $00000000, $F8050000, $00000030
Offset_0x01AB16:
                dc.w    $0004
                dc.l    $F8050000, $0000FF80, $F8050000, $0000FFE0
                dc.l    $F8050000, $00000000, $F8050000, $00000070                                                                                                            
;===============================================================================   
; Objeto 0x03 - Alterna o plano do cen�rio em rela��o ao jogador
; <<<-        
;===============================================================================