;===============================================================================
; Objeto 0x0D - Painel de fim de fase
; ->>> 
;===============================================================================
; Offset_0x014544:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x014574(PC, D0), D1
                jsr     Offset_0x014574(PC, D1)
                lea     (End_Panel_Animate_Data), A1           ; Offset_0x01473A
                bsr     AnimateSprite                          ; Offset_0x01212E
                move.w  Obj_X(A0), D0                                    ; $0008
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     DeleteObject                           ; Offset_0x0120D0
                bra     DisplaySprite                          ; Offset_0x0120DE 
;-------------------------------------------------------------------------------
Offset_0x014574:                 
                dc.w    Offset_0x01457E-Offset_0x014574
                dc.w    Offset_0x0145A6-Offset_0x014574
                dc.w    Offset_0x0145D0-Offset_0x014574
                dc.w    Offset_0x01466C-Offset_0x014574
                dc.w    Offset_0x014738-Offset_0x014574              
;-------------------------------------------------------------------------------
Offset_0x01457E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.l  #End_Panel_Mappings, Obj_Map(A0) ; Offset_0x014764, $0004
                move.w  #$0434, Obj_Art_VRAM(A0)                         ; $0002
                bsr     ModifySpriteAttr_2P                    ; Offset_0x01298E
                move.b  #$04, Obj_Flags(A0)                              ; $0001
                move.b  #$18, Obj_Width(A0)                              ; $0019
                move.b  #$04, Obj_Priority(A0)                           ; $0018
;-------------------------------------------------------------------------------
Offset_0x0145A6:
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                sub.w   Obj_X(A0), D0                                    ; $0008
                bcs.s   Offset_0x0145CE
                cmpi.w  #$0020, D0
                bcc.s   Offset_0x0145CE
                move.w  #$00CF, D0
                jsr     (Play_Music)                           ; Offset_0x00190C
                clr.b   (HUD_Timer_Refresh_Flag).w                   ; $FFFFFE1E
                move.w  (Sonic_Level_Limits_Max_X).w, (Sonic_Level_Limits_Min_X).w ; $FFFFEECA
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x0145CE:
                rts
;-------------------------------------------------------------------------------                
Offset_0x0145D0:
                subq.w  #$01, Obj_Control_Var_04(A0)                     ; $0030
                bpl.s   Offset_0x0145EC
                move.w  #$003C, Obj_Control_Var_04(A0)                   ; $0030
                addq.b  #$01, Obj_Ani_Number(A0)                         ; $001C
                cmpi.b  #$03, Obj_Ani_Number(A0)                         ; $001C
                bne.s   Offset_0x0145EC
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Offset_0x0145EC:
                subq.w  #$01, Obj_Control_Var_06(A0)                     ; $0032
                bpl.s   Offset_0x01465A
                move.w  #$000B, Obj_Control_Var_06(A0)                   ; $0032
                moveq   #$00, D0
                move.b  Obj_Control_Var_08(A0), D0                       ; $0034
                addq.b  #$02, Obj_Control_Var_08(A0)                     ; $0034
                andi.b  #$0E, Obj_Control_Var_08(A0)                     ; $0034
                lea     Offset_0x01465C(PC, D0), A2
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne.s   Offset_0x01465A
                move.b  #$25, Obj_Id(A1)                                 ; $0000
                move.b  #$06, Obj_Routine(A1)                            ; $0024
                move.b  (A2)+, D0
                ext.w   D0
                add.w   Obj_X(A0), D0                                    ; $0008
                move.w  D0, Obj_X(A1)                                    ; $0008
                move.b  (A2)+, D0
                ext.w   D0
                add.w   Obj_Y(A0), D0                                    ; $000C
                move.w  D0, Obj_Y(A1)                                    ; $000C
                move.l  #Rings_Mappings, Obj_Map(A1)    ; Offset_0x00F444, $0004
                move.w  #$27B2, Obj_Art_VRAM(A1)                         ; $0002
                bsr     ModifySpriteAttr_2P_A1                 ; Offset_0x0129AA
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$02, Obj_Priority(A1)                           ; $0018
                move.b  #$08, Obj_Width(A1)                              ; $0019
Offset_0x01465A:
                rts                  
;-------------------------------------------------------------------------------
Offset_0x01465C:
                dc.b    $E8, $F0, $08, $08, $F0, $00, $18, $F8
                dc.b    $00, $F8, $10, $00, $E8, $08, $18, $10    
;-------------------------------------------------------------------------------
Offset_0x01466C:
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                bne     Offset_0x01470C
                btst    #$01, ($FFFFB022).w
                bne.s   Offset_0x014688
                move.b  #$01, ($FFFFF7CC).w
                move.w  #$0800, ($FFFFF602).w
Offset_0x014688:
                tst.b   (Obj_Memory_Address).w                       ; $FFFFB000
                beq.s   Offset_0x01469E
                move.w  (Player_Position_X).w, D0                    ; $FFFFB008
                move.w  (Sonic_Level_Limits_Max_X).w, D1             ; $FFFFEECA
                addi.w  #$0128, D1
                cmp.w   D1, D0
                bcs.s   Offset_0x01470C
Offset_0x01469E:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
Load_Level_Results: ; Usado pelo objeto 0x3E ( Container de animais ) ; Offset_0x0146A2                
                tst.b   ($FFFFB5C0).w
                bne.s   Offset_0x01470C
                move.w  (Sonic_Level_Limits_Max_X).w, (Sonic_Level_Limits_Min_X).w ; $FFFFEECA
                lea     (Obj_Memory_Address).w, A1                   ; $FFFFB000
                bclr    #$01, Obj_Player_Status(A1)                      ; $002B
                clr.b   (HUD_Timer_Refresh_Flag).w                   ; $FFFFFE1E
                move.b  #$3A, ($FFFFB5C0).w
                moveq   #$26, D0
                jsr     (LoadPLC2)                             ; Offset_0x001BE6
                move.b  #$01, ($FFFFF7D6).w
                moveq   #$00, D0
                move.b  ($FFFFFE23).w, D0
                mulu.w  #$003C, D0
                moveq   #$00, D1
                move.b  ($FFFFFE24).w, D1
                add.w   D1, D0
                divu.w  #$000F, D0
                moveq   #$14, D1
                cmp.w   D1, D0
                bcs.s   Offset_0x0146EE
                move.w  D1, D0
Offset_0x0146EE:
                add.w   D0, D0
                move.w  Time_Bonus(PC, D0), ($FFFFF7D2).w      ; Offset_0x01470E
                move.w  (Ring_Count).w, D0                           ; $FFFFFE20
                mulu.w  #$000A, D0
                move.w  D0, ($FFFFF7D4).w
                move.w  #$009A, D0
                jsr     (Play_Sfx)                             ; Offset_0x001912
Offset_0x01470C:
                rts   
;-------------------------------------------------------------------------------
Time_Bonus:                                                    ; Offset_0x01470E
                dc.w    $1388, $1388, $03E8, $01F4, $0190, $0190, $012C, $012C
                dc.w    $00C8, $00C8, $00C8, $00C8, $0064, $0064, $0064, $0064
                dc.w    $0032, $0032, $0032, $0032, $0000           
;-------------------------------------------------------------------------------
Offset_0x014738:
                rts                                                             
;-------------------------------------------------------------------------------
End_Panel_Animate_Data:                                        ; Offset_0x01473A        
                dc.w    Offset_0x014742-End_Panel_Animate_Data
                dc.w    Offset_0x014745-End_Panel_Animate_Data
                dc.w    Offset_0x014753-End_Panel_Animate_Data
                dc.w    Offset_0x014761-End_Panel_Animate_Data
Offset_0x014742:
                dc.b    $0F, $02, $FF
Offset_0x014745:
                dc.b    $01, $02, $03, $04, $05, $01, $03, $04, $05, $00, $03, $04, $05, $FF
Offset_0x014753:
                dc.b    $01, $02, $03, $04, $05, $01, $03, $04, $05, $00, $03, $04, $05, $FF
Offset_0x014761:
                dc.b    $0F, $00, $FF
;-------------------------------------------------------------------------------
End_Panel_Mappings:                                            ; Offset_0x014764
                dc.w    Offset_0x014770-End_Panel_Mappings
                dc.w    Offset_0x01478A-End_Panel_Mappings
                dc.w    Offset_0x0147A4-End_Panel_Mappings
                dc.w    Offset_0x0147BE-End_Panel_Mappings
                dc.w    Offset_0x0147D0-End_Panel_Mappings
                dc.w    Offset_0x0147E2-End_Panel_Mappings
Offset_0x014770:
                dc.w    $0003
                dc.l    $F00B0000, $0000FFE8, $F00B000C, $00060000
                dc.l    $10010050, $0028FFFC
Offset_0x01478A:
                dc.w    $0003
                dc.l    $F00B0018, $000CFFE8, $F00B0024, $00120000
                dc.l    $10010050, $0028FFFC
Offset_0x0147A4:
                dc.w    $0003
                dc.l    $F00B0030, $0018FFE8, $F00B0830, $08180000
                dc.l    $10010050, $0028FFFC
Offset_0x0147BE:
                dc.w    $0002
                dc.l    $F00F003C, $001EFFF0, $10010050, $0028FFFC
Offset_0x0147D0:
                dc.w    $0002
                dc.l    $F003004C, $0026FFFC, $10010050, $0028FFFC
Offset_0x0147E2:
                dc.w    $0002
                dc.l    $F00F083C, $081EFFF0, $10010050, $0028FFFC                                   
;===============================================================================
; Objeto 0x0D - Painel de fim de fase
; <<<- 
;===============================================================================