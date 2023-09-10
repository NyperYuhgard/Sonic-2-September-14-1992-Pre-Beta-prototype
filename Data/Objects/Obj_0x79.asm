;===============================================================================
; Objeto 0x79 - Poste de reinício, utilizado para salvar a posição do jogador 
; ->>>          na fase
;===============================================================================
Offset_0x019E30:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x019E44(PC, D0), D1
                jsr     Offset_0x019E44(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x011FBC
;-------------------------------------------------------------------------------  
Offset_0x019E44:
                dc.w    Offset_0x019E4A-Offset_0x019E44
                dc.w    Offset_0x019EAC-Offset_0x019E44
                dc.w    Offset_0x019F34-Offset_0x019E44
;-------------------------------------------------------------------------------   
Offset_0x019E4A:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #Lamp_Post_Mappings, Obj_Map(A0) ; Offset_0x01A06A, $0004
                move.w  #$047C, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$08, Obj_Width(A0)                              ; $0019
                move.b  #$05, Obj_Priority(A0)                           ; $0018
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                bclr    #$07, $02(A2, D0)
                btst    #$00, $02(A2, D0)
                bne.s   Offset_0x019E9E
                move.b  (Saved_Level_Flag).w, D1                     ; $FFFFFE30
                andi.b  #$7F, D1
                move.b  Obj_Subtype(A0), D2                              ; $0028
                andi.b  #$7F, D2
                cmp.b   D2, D1
                bcs.s   Offset_0x019EAC
Offset_0x019E9E:
                bset    #$00, $02(A2, D0)
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                rts
;-------------------------------------------------------------------------------                
Offset_0x019EAC:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne     Offset_0x019F32
                tst.b   ($FFFFB02A).w
                bmi     Offset_0x019F32
                move.b  (Saved_Level_Flag).w, D1                     ; $FFFFFE30
                andi.b  #$7F, D1
                move.b  Obj_Subtype(A0), D2                              ; $0028
                andi.b  #$7F, D2
                cmp.b   D2, D1
                bcs.s   Offset_0x019EEA
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                bset    #$00, $02(A2, D0)
                move.b  #$04, Obj_Routine(A0)                            ; $0024
                bra     Offset_0x019F32
Offset_0x019EEA:
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                addi.w  #$0008, D0
                cmpi.w  #$0010, D0
                bcc     Offset_0x019F32
                move.w  (Player_Position_Y).w, D0                    ; $FFFFB00C
                sub.w   Obj_Y(A0), D0                                    ; $000C
                addi.w  #$0040, D0
                cmpi.w  #$0068, D0
                bcc.s   Offset_0x019F32
                move.w  #$00A1, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                bsr     Level_Save_Info                        ; Offset_0x019F46
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  Obj_Respaw_Ref(A0), D0                           ; $0023
                bset    #$00, $02(A2, D0)
Offset_0x019F32:
                rts
;-------------------------------------------------------------------------------                
Offset_0x019F34:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$02, D0
                lsr.b   #$01, D0
                addq.b  #$01, D0
                move.b  D0, Obj_Map_Id(A0)                               ; $001A
                rts
Level_Save_Info:                                               ; Offset_0x019F46
                move.b  Obj_Subtype(A0), (Saved_Level_Flag).w ; $0028, $FFFFFE30
                move.b  (Saved_Level_Flag).w, ($FFFFFE31).w          ; $FFFFFE30
                move.w  Obj_X(A0), ($FFFFFE32).w                         ; $0008
                move.w  Obj_Y(A0), ($FFFFFE34).w                         ; $000C
                move.w  (Ring_Count).w, ($FFFFFE36).w                ; $FFFFFE20
                move.b  (Ring_Life_Flag).w, ($FFFFFE54).w            ; $FFFFFE1B
                move.l  ($FFFFFE22).w, ($FFFFFE38).w
                move.b  ($FFFFEEDF).w, ($FFFFFE3C).w
                move.w  (Sonic_Level_Limits_Max_Y).w, ($FFFFFE3E).w  ; $FFFFEECE
                move.w  (Camera_X).w, ($FFFFFE40).w                  ; $FFFFEE00
                move.w  (Camera_Y).w, ($FFFFFE42).w                  ; $FFFFEE04
                move.w  (Camera_X_x2).w, ($FFFFFE44).w               ; $FFFFEE08
                move.w  (Camera_Y_x4).w, ($FFFFFE46).w               ; $FFFFEE0C
                move.w  (Camera_X_x8).w, ($FFFFFE48).w               ; $FFFFEE10
                move.w  (Camera_Y_x4_Mod_10).w, ($FFFFFE4A).w        ; $FFFFEE14
                move.w  (Camera_X_x4).w, ($FFFFFE4C).w               ; $FFFFEE18
                move.w  (Camera_Y_x4_Mod_10_2).w, ($FFFFFE4E).w      ; $FFFFEE1C
                move.w  ($FFFFF648).w, ($FFFFFE50).w
                move.b  ($FFFFF64D).w, ($FFFFFE52).w
                move.b  ($FFFFF64E).w, ($FFFFFE53).w
                rts    
;-------------------------------------------------------------------------------                                   
Level_Restore_Info:                                            ; Offset_0x019FC0
                move.b  ($FFFFFE31).w, (Saved_Level_Flag).w          ; $FFFFFE30
                move.w  ($FFFFFE32).w, (Player_Position_X).w         ; $FFFFB008
                move.w  ($FFFFFE34).w, (Player_Position_Y).w         ; $FFFFB00C
                move.w  ($FFFFFE36).w, (Ring_Count).w                ; $FFFFFE20
                move.b  ($FFFFFE54).w, (Ring_Life_Flag).w            ; $FFFFFE1B
                clr.w   (Ring_Count).w                               ; $FFFFFE20
                clr.b   (Ring_Life_Flag).w                           ; $FFFFFE1B
                move.l  ($FFFFFE38).w, ($FFFFFE22).w
                move.b  #$3B, ($FFFFFE25).w
                subq.b  #$01, ($FFFFFE24).w
                move.b  ($FFFFFE3C).w, ($FFFFEEDF).w
                move.b  ($FFFFFE52).w, ($FFFFF64D).w
                move.w  ($FFFFFE3E).w, (Sonic_Level_Limits_Max_Y).w  ; $FFFFEECE
                move.w  ($FFFFFE3E).w, ($FFFFEEC6).w
                move.w  ($FFFFFE40).w, (Camera_X).w                  ; $FFFFEE00
                move.w  ($FFFFFE42).w, (Camera_Y).w                  ; $FFFFEE04
                move.w  ($FFFFFE44).w, (Camera_X_x2).w               ; $FFFFEE08
                move.w  ($FFFFFE46).w, (Camera_Y_x4).w               ; $FFFFEE0C
                move.w  ($FFFFFE48).w, (Camera_X_x8).w               ; $FFFFEE10
                move.w  ($FFFFFE4A).w, (Camera_Y_x4_Mod_10).w        ; $FFFFEE14
                move.w  ($FFFFFE4C).w, (Camera_X_x4).w               ; $FFFFEE18
                move.w  ($FFFFFE4E).w, (Camera_Y_x4_Mod_10_2).w      ; $FFFFEE1C
                tst.b   (Water_Level_Flag).w                         ; $FFFFF730
                beq.s   Offset_0x01A056
                move.w  ($FFFFFE50).w, ($FFFFF648).w
                move.b  ($FFFFFE52).w, ($FFFFF64D).w
                move.b  ($FFFFFE53).w, ($FFFFF64E).w
Offset_0x01A056:
                tst.b   (Saved_Level_Flag).w                         ; $FFFFFE30
                bpl.s   Offset_0x01A068
                move.w  ($FFFFFE32).w, D0
                subi.w  #$00A0, D0
                move.w  D0, (Sonic_Level_Limits_Min_X).w             ; $FFFFEEC8
Offset_0x01A068:
                rts      
;-------------------------------------------------------------------------------
Lamp_Post_Mappings:                                            ; Offset_0x01A06A
                dc.w    Offset_0x01A070-Lamp_Post_Mappings
                dc.w    Offset_0x01A092-Lamp_Post_Mappings
                dc.w    Offset_0x01A0B4-Lamp_Post_Mappings
Offset_0x01A070:
                dc.w    $0004
                dc.l    $E8012000, $2000FFF8
                dc.l    $E8012800, $28000000
                dc.l    $F8030006, $0003FFF8
                dc.l    $F8030806, $08030000
Offset_0x01A092:
                dc.w    $0004
                dc.l    $E8010002, $0001FFF8
                dc.l    $E8010802, $08010000
                dc.l    $F8030006, $0003FFF8
                dc.l    $F8030806, $08030000
Offset_0x01A0B4:
                dc.w    $0004
                dc.l    $E8012004, $2002FFF8
                dc.l    $E8012804, $28020000
                dc.l    $F8030006, $0003FFF8
                dc.l    $F8030806, $08030000
;===============================================================================
; Objeto 0x79 - Poste de reinício, utilizado para salvar a posição do jogador 
; <<<-          na fase
;===============================================================================