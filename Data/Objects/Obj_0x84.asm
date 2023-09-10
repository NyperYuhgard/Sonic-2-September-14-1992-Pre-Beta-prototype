;===============================================================================
; Objeto 0x84 - Auto Spin - Hill Top, Hidden Palace, Casino Night
; ->>>
;===============================================================================
Offset_0x01BBFA:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01BC16(PC, D0), D1
                jsr     Offset_0x01BC16(PC, D1)
                tst.w   (Debug_Mode_Active_Flag).w                   ; $FFFFFFFA
                beq     Jmp_01_To_MarkObjGone_3                ; Offset_0x01BF5C
                jmp     (MarkObjGone)                          ; Offset_0x011FBC
;-------------------------------------------------------------------------------
Offset_0x01BC16:
                dc.w    Offset_0x01BC1C-Offset_0x01BC16
                dc.w    Offset_0x01BCCA-Offset_0x01BC16
                dc.w    Offset_0x01BD94-Offset_0x01BC16
;-------------------------------------------------------------------------------
Offset_0x01BC1C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Layer_Switch_Mappings, Obj_Map(A0) ; Offset_0x01AA5C, $0004
                move.w  #$06BC, Obj_Art_VRAM(A0)                         ; $0002
                bsr     Jmp_04_To_ModifySpriteAttr_2P          ; Offset_0x01BF62
                ori.b   #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$10, Obj_Width(A0)                              ; $0019
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                move.b  Obj_Subtype(A0), D0                              ; $0028
                btst    #$02, D0
                beq.s   Offset_0x01BC96
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                andi.w  #$0007, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                andi.w  #$0003, D0
                add.w   D0, D0
                move.w  Offset_0x01BC8E(PC, D0), Obj_Control_Var_06(A0)  ; $0032
                move.w  Obj_Y(A0), D1                                    ; $000C
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                cmp.w   Obj_Y(A1), D1                                    ; $000C
                bcc.s   Offset_0x01BC7A
                move.b  #$01, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x01BC7A:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                cmp.w   Obj_Y(A1), D1                                    ; $000C
                bcc.s   Offset_0x01BC8A
                move.b  #$01, Obj_Control_Var_09(A0)                     ; $0035
Offset_0x01BC8A:
                bra     Offset_0x01BD94     
;-------------------------------------------------------------------------------   
Offset_0x01BC8E:
                dc.w    $0020, $0040, $0080, $0100
;-------------------------------------------------------------------------------
Offset_0x01BC96:
                andi.w  #$0003, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                add.w   D0, D0
                move.w  Offset_0x01BC8E(PC, D0), Obj_Control_Var_06(A0)  ; $0032
                move.w  Obj_X(A0), D1                                    ; $0008
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bcc.s   Offset_0x01BCBA
                move.b  #$01, Obj_Control_Var_08(A0)                     ; $0034
Offset_0x01BCBA:
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bcc.s   Offset_0x01BCCA
                move.b  #$01, Obj_Control_Var_09(A0)                     ; $0035
;-------------------------------------------------------------------------------                
Offset_0x01BCCA:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x01BD22
                move.w  Obj_X(A0), D1                                    ; $0008
                lea     Obj_Control_Var_08(A0), A2                       ; $0034
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x01BCE2
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x01BCE2:
                tst.b   (A2)+
                bne.s   Offset_0x01BD24
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bhi.s   Offset_0x01BD22
                move.b  #$01, -1(A2)
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                move.w  Obj_Control_Var_06(A0), D4                       ; $0032
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                bcs.s   Offset_0x01BD22
                cmp.w   D3, D4
                bcc.s   Offset_0x01BD22
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x01BD1C
                move.b  #$01, Obj_Player_Spdsh_Flag(A1)                  ; $0039
                bra.s   Offset_0x01BD62
Offset_0x01BD1C:
                move.b  #$00, Obj_Player_Spdsh_Flag(A1)                  ; $0039
Offset_0x01BD22:
                rts
Offset_0x01BD24:
                cmp.w   Obj_X(A1), D1                                    ; $0008
                bls.s   Offset_0x01BD22
                move.b  #$00, -1(A2)
                move.w  Obj_Y(A0), D2                                    ; $000C
                move.w  D2, D3
                move.w  Obj_Control_Var_06(A0), D4                       ; $0032
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_Y(A1), D4                                    ; $000C
                cmp.w   D2, D4
                bcs.s   Offset_0x01BD22
                cmp.w   D3, D4
                bcc.s   Offset_0x01BD22
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x01BD5A
                move.b  #$01, Obj_Player_Spdsh_Flag(A1)                  ; $0039
                bra.s   Offset_0x01BD62
Offset_0x01BD5A:
                move.b  #$00, Obj_Player_Spdsh_Flag(A1)                  ; $0039
                rts
Offset_0x01BD62:
                btst    #$02, Obj_Status(A1)                             ; $0022
                beq.s   Offset_0x01BD6C
                rts
Offset_0x01BD6C:
                bset    #$02, Obj_Status(A1)                             ; $0022
                move.b  #$0E, Obj_Height_2(A1)                           ; $0016
                move.b  #$07, Obj_Width_2(A1)                            ; $0017
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                addq.w  #$05, Obj_Y(A1)                                  ; $000C
                move.w  #$00BE, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                rts
;-------------------------------------------------------------------------------                
Offset_0x01BD94:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne.s   Offset_0x01BDEE
                move.w  Obj_Y(A0), D1                                    ; $000C
                lea     Obj_Control_Var_08(A0), A2                       ; $0034
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bsr.s   Offset_0x01BDAC
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
Offset_0x01BDAC:
                tst.b   (A2)+
                bne.s   Offset_0x01BDF0
                cmp.w   Obj_Y(A1), D1                                    ; $000C
                bhi.s   Offset_0x01BDEE
                move.b  #$01, -1(A2)
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  D2, D3
                move.w  Obj_Control_Var_06(A0), D4                       ; $0032
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_X(A1), D4                                    ; $0008
                cmp.w   D2, D4
                bcs.s   Offset_0x01BDEE
                cmp.w   D3, D4
                bcc.s   Offset_0x01BDEE
                btst    #$00, Obj_Flags(A0)                              ; $0001
                bne.s   Offset_0x01BDE8
                move.b  #$01, Obj_Player_Spdsh_Flag(A1)                  ; $0039
                bra     Offset_0x01BD62
Offset_0x01BDE8:
                move.b  #$00, Obj_Player_Spdsh_Flag(A1)                  ; $0039
Offset_0x01BDEE:
                rts
Offset_0x01BDF0:
                cmp.w   Obj_Y(A1), D1                                    ; $000C
                bls.s   Offset_0x01BDEE
                move.b  #$00, -1(A2)
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  D2, D3
                move.w  Obj_Control_Var_06(A0), D4                       ; $0032
                sub.w   D4, D2
                add.w   D4, D3
                move.w  Obj_X(A1), D4                                    ; $0008
                cmp.w   D2, D4
                bcs.s   Offset_0x01BDEE
                cmp.w   D3, D4
                bcc.s   Offset_0x01BDEE
                btst    #$00, Obj_Flags(A0)                              ; $0001
                beq.s   Offset_0x01BE28
                move.b  #$01, Obj_Player_Spdsh_Flag(A1)                  ; $0039
                bra     Offset_0x01BD62
Offset_0x01BE28:
                move.b  #$00, Obj_Player_Spdsh_Flag(A1)                  ; $0039
                rts                                                          
;===============================================================================
; Objeto 0x84 - Auto Spin - Hill Top, Hidden Palace, Casino Night
; <<<-
;===============================================================================