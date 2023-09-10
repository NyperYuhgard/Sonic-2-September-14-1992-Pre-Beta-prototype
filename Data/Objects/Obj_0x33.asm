;===============================================================================
; Objeto 0x33 - Aceleradores (Toque para ganhar impulso) na Oil Ocean
; ->>> 
;=============================================================================== 
; Offset_0x01E564:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x01E572(PC, D0), D1
                jmp     Offset_0x01E572(PC, D1) 
;-------------------------------------------------------------------------------
Offset_0x01E572:
                dc.w    Offset_0x01E578-Offset_0x01E572
                dc.w    Offset_0x01E600-Offset_0x01E572
                dc.w    Offset_0x01E80A-Offset_0x01E572    
;-------------------------------------------------------------------------------
Offset_0x01E578:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Touch_Booster_Mappings, Obj_Map(A0) ; Offset_0x01E84C, $0004
                move.w  #$632C, Obj_Art_VRAM(A0)                         ; $0002
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$03, Obj_Priority(A0)                           ; $0018
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.w  Obj_Y(A0), Obj_Control_Var_04(A0)         ; $000C, $0030
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$0078, Obj_Control_Var_0A(A0)                   ; $0036
                tst.b   Obj_Subtype(A0)                                  ; $0028
                beq.s   Offset_0x01E5B8
                move.b  #$04, Obj_Routine_2(A0)                          ; $0025
Offset_0x01E5B8:
                bsr     Jmp_04_To_SingleObjectLoad_2           ; Offset_0x01E8A2
                bne.s   Offset_0x01E600
                move.b  Obj_Id(A0), Obj_Id(A1)                    ; $0000, $0000
                move.b  #$04, Obj_Routine(A1)                            ; $0024
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                subi.w  #$0010, Obj_Y(A1)                                ; $000C
                move.l  #Touch_Booster_Mappings_01, Obj_Map(A1) ; Offset_0x01E860, $0004
                move.w  #$62E2, Obj_Art_VRAM(A1)                         ; $0002
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$04, Obj_Priority(A1)                           ; $0018
                move.b  #$10, Obj_Width(A1)                              ; $0019
                move.l  A0, Obj_Control_Var_10(A1)                       ; $003C
;-------------------------------------------------------------------------------                
Offset_0x01E600:
                move.w  Obj_X(A0), -(A7)                                 ; $0008
                moveq   #$00, D0
                move.b  Obj_Routine_2(A0), D0                            ; $0025
                move.w  Offset_0x01E62C(PC, D0), D1
                jsr     Offset_0x01E62C(PC, D1)
                move.w  (A7)+, D4
                moveq   #$00, D1
                move.b  Obj_Width(A0), D1                                ; $0019
                addi.w  #$000B, D1
                moveq   #$08, D2
                move.w  D2, D3
                addq.w  #$01, D3
                bsr     Jmp_01_To_SolidObject                  ; Offset_0x01E8A8
                bra     Jmp_08_To_MarkObjGone                  ; Offset_0x01E89C    
;-------------------------------------------------------------------------------
Offset_0x01E62C:
                dc.w    Offset_0x01E636-Offset_0x01E62C
                dc.w    Offset_0x01E65A-Offset_0x01E62C
                dc.w    Offset_0x01E696-Offset_0x01E62C
                dc.w    Offset_0x01E790-Offset_0x01E62C
                dc.w    Offset_0x01E808-Offset_0x01E62C
;-------------------------------------------------------------------------------
Offset_0x01E636:
                subq.w  #$01, Obj_Control_Var_0A(A0)                     ; $0036
                bpl.s   Offset_0x01E658
                move.w  #$0078, Obj_Control_Var_0A(A0)                   ; $0036
                move.l  #$FFF69800, Obj_Control_Var_06(A0)               ; $0032
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$00D4, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01E658:
                rts    
;-------------------------------------------------------------------------------                
Offset_0x01E65A:
                move.l  Obj_Y(A0), D1                                    ; $000C
                add.l   Obj_Control_Var_06(A0), D1                       ; $0032
                move.l  D1, Obj_Y(A0)                                    ; $000C
                addi.l  #$00003800, Obj_Control_Var_06(A0)               ; $0032
                swap.w  D1
                cmp.w   Obj_Control_Var_04(A0), D1                       ; $0030
                bcs.s   Offset_0x01E694
                move.l  Obj_Control_Var_06(A0), D0                       ; $0032
                cmpi.l  #$00010000, D0
                bcc.s   Offset_0x01E686
                subq.b  #$02, Obj_Routine_2(A0)                          ; $0025
Offset_0x01E686:
                lsr.l   #$02, D0
                neg.l   D0
                move.l  D0, Obj_Control_Var_06(A0)                       ; $0032
                move.w  Obj_Control_Var_04(A0), Obj_Y(A0)         ; $000C, $0030
Offset_0x01E694:
                rts     
;-------------------------------------------------------------------------------
Offset_0x01E696:
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  D2, D3
                subi.w  #$0010, D2
                addi.w  #$0010, D3
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$18, D0
                beq.s   Offset_0x01E70E
                cmpi.b  #$18, D0
                beq.s   Offset_0x01E710
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                moveq   #$03, D6
                bsr.s   Offset_0x01E6C2
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                addq.b  #$01, D6
Offset_0x01E6C2:
                btst    D6, Obj_Status(A0)                               ; $0022
                beq.s   Offset_0x01E70E
                move.w  Obj_X(A1), D0                                    ; $0008
                cmp.w   D2, D0
                bcs.s   Offset_0x01E70E
                cmp.w   D3, D0
                bcc.s   Offset_0x01E70E
                move.b  #$01, Obj_Timer(A1)                              ; $002A
                move.w  #$0000, Obj_Inertia(A1)                          ; $0014
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                bclr    #$05, Obj_Status(A1)                             ; $0022
                bclr    #$07, Obj_Art_VRAM(A1)                           ; $0002
                move.l  #$FFF69800, Obj_Control_Var_06(A0)               ; $0032
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$00D4, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01E70E:
                rts
Offset_0x01E710:
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.w  Obj_X(A1), D0                                    ; $0008
                cmp.w   D2, D0
                bcs.s   Offset_0x01E78E
                cmp.w   D3, D0
                bcc.s   Offset_0x01E78E
                lea     (Obj_Memory_Address+$0040).w, A2             ; $FFFFB040
                move.w  Obj_X(A2), D0                                    ; $0008
                cmp.w   D2, D0
                bcs.s   Offset_0x01E78E
                cmp.w   D3, D0
                bcc.s   Offset_0x01E78E
                move.b  #$01, Obj_Timer(A1)                              ; $002A
                move.w  #$0000, Obj_Inertia(A1)                          ; $0014
                move.w  #$0000, Obj_Speed(A1)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A1)                          ; $0012
                bclr    #$05, Obj_Status(A1)                             ; $0022
                bclr    #$07, Obj_Art_VRAM(A1)                           ; $0002
                move.b  #$01, Obj_Timer(A2)                              ; $002A
                move.w  #$0000, Obj_Inertia(A2)                          ; $0014
                move.w  #$0000, Obj_Speed(A2)                            ; $0010
                move.w  #$0000, Obj_Speed_Y(A2)                          ; $0012
                bclr    #$05, Obj_Status(A2)                             ; $0022
                bclr    #$07, Obj_Art_VRAM(A2)                           ; $0002
                move.l  #$FFF69800, Obj_Control_Var_06(A0)               ; $0032
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                move.w  #$00D4, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01E78E:
                rts   
;-------------------------------------------------------------------------------
Offset_0x01E790:
                move.l  Obj_Y(A0), D1                                    ; $000C
                add.l   Obj_Control_Var_06(A0), D1                       ; $0032
                move.l  D1, Obj_Y(A0)                                    ; $000C
                addi.l  #$00003800, Obj_Control_Var_06(A0)               ; $0032
                swap.w  D1
                move.w  Obj_Control_Var_04(A0), D0                       ; $0030
                subi.w  #$007D, D0
                cmp.w   D0, D1
                bne.s   Offset_0x01E806
                addq.b  #$02, Obj_Routine_2(A0)                          ; $0025
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$08, D0
                bsr.s   Offset_0x01E7D0
                lea     (Obj_Memory_Address+$0040).w, A1             ; $FFFFB040
                move.b  Obj_Status(A0), D0                               ; $0022
                andi.b  #$10, D0
Offset_0x01E7D0:
                beq.s   Offset_0x01E806
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.b  #$02, Obj_Ani_Number(A1)                         ; $001C
                move.w  #$0800, Obj_Inertia(A1)                          ; $0014
                bset    #$01, Obj_Status(A1)                             ; $0022
                move.w  #$F000, Obj_Speed_Y(A1)                          ; $0012
                bclr    #$03, Obj_Status(A1)                             ; $0022
                move.b  #$00, Obj_Timer(A1)                              ; $002A
                move.w  #$00CC, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x00191E
Offset_0x01E806:
                rts  
;-------------------------------------------------------------------------------
Offset_0x01E808:
                rts   
;-------------------------------------------------------------------------------
Offset_0x01E80A:
                move.l  Obj_Control_Var_10(A0), A1                       ; $003C
                move.w  Obj_Y(A0), D0                                    ; $000C
                sub.w   Obj_Y(A1), D0                                    ; $000C
                cmpi.w  #$0014, D0
                blt.s   Offset_0x01E832
                move.b  #$9B, Obj_Col_Flags(A0)                          ; $0020
                lea     (Touch_Booster_Animate_Data), A1       ; Offset_0x01E840
                jsr     (AnimateSprite)                        ; Offset_0x01212E
                bra     Jmp_08_To_MarkObjGone                  ; Offset_0x01E89C
Offset_0x01E832:
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$00, Obj_Ani_Frame(A0)                          ; $001B
                rts   
;-------------------------------------------------------------------------------                    
Touch_Booster_Animate_Data:                                    ; Offset_0x01E840
                dc.w    Offset_0x01E842-Touch_Booster_Animate_Data
Offset_0x01E842:
                dc.b    $02, $02, $00, $02, $00, $02, $00, $01
                dc.b    $FF, $00                            
;-------------------------------------------------------------------------------
Touch_Booster_Mappings:                                        ; Offset_0x01E84C
                dc.w    Offset_0x01E84E-Touch_Booster_Mappings
Offset_0x01E84E:
                dc.w    $0002
                dc.l    $F8090000, $0000FFE8
                dc.l    $F8090800, $08000000       
;-------------------------------------------------------------------------------
Touch_Booster_Mappings_01:                                     ; Offset_0x01E860
                dc.w    Offset_0x01E866-Touch_Booster_Mappings_01
                dc.w    Offset_0x01E878-Touch_Booster_Mappings_01
                dc.w    Offset_0x01E88A-Touch_Booster_Mappings_01
Offset_0x01E866:
                dc.w    $0002
                dc.l    $F8060000, $0000FFF0
                dc.l    $F8060800, $08000000
Offset_0x01E878:
                dc.w    $0002
                dc.l    $F0070006, $0003FFF0
                dc.l    $F0070806, $08030000
Offset_0x01E88A:
                dc.w    $0002
                dc.l    $0005000E, $0007FFF0
                dc.l    $0005080E, $08070000                  
;===============================================================================
; Objeto 0x33 - Aceleradores (Toque para ganhar impulso) na Oil Ocean
; <<<- 
;===============================================================================