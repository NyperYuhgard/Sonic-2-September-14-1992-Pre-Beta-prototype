;===============================================================================
; Objeto 0x37 - Perdendo anéis após sofrer algum dano
; ->>>
;===============================================================================
; Offset_0x00F16E:
                moveq   #$00, D0
                move.b  Obj_Routine(A0), D0                              ; $0024
                move.w  Offset_0x00F17C(PC, D0), D1
                jmp     Offset_0x00F17C(PC, D1)          
;-------------------------------------------------------------------------------
Offset_0x00F17C:
                dc.w    Offset_0x00F186-Offset_0x00F17C
                dc.w    Offset_0x00F24A-Offset_0x00F17C
                dc.w    Offset_0x00F29C-Offset_0x00F17C
                dc.w    Offset_0x00F2B0-Offset_0x00F17C
                dc.w    Offset_0x00F2BE-Offset_0x00F17C
;-------------------------------------------------------------------------------
Offset_0x00F186:
                move.l  A0, A1
                moveq   #$00, D5
                move.w  (Ring_Count).w, D5                           ; $FFFFFE20
                moveq   #$20, D0
                cmp.w   D0, D5
                bcs.s   Offset_0x00F196
                move.w  D0, D5
Offset_0x00F196:
                subq.w  #$01, D5
                move.w  #$0288, D4
                bra.s   Offset_0x00F1A6
;-------------------------------------------------------------------------------
Offset_0x00F19E:
                bsr     SingleObjectLoad                       ; Offset_0x013BAA
                bne     Offset_0x00F22E
Offset_0x00F1A6:
                move.b  #$37, Obj_Id(A1)                                 ; $0000
                addq.b  #$02, Obj_Routine(A1)                            ; $0024
                move.b  #$08, Obj_Height_2(A1)                           ; $0016
                move.b  #$08, Obj_Width_2(A1)                            ; $0017
                move.w  Obj_X(A0), Obj_X(A1)                      ; $0008, $0008
                move.w  Obj_Y(A0), Obj_Y(A1)                      ; $000C, $000C
                move.l  #Rings_Mappings, Obj_Map(A1)    ; Offset_0x00F444, $0004
                move.w  #$26BC, Obj_Art_VRAM(A1)                         ; $0002
                bsr     ModifySpriteAttr_2P_A1                 ; Offset_0x0129AA
                move.b  #$04, Obj_Flags(A1)                              ; $0001
                move.b  #$03, Obj_Priority(A1)                           ; $0018
                move.b  #$47, Obj_Col_Flags(A1)                          ; $0020
                move.b  #$08, Obj_Width(A1)                              ; $0019
                move.b  #$FF, ($FFFFFEA6).w
                tst.w   D4
                bmi.s   Offset_0x00F21E
                move.w  D4, D0
                bsr     Jmp_03_To_CalcSine                     ; Offset_0x00F6A8
                move.w  D4, D2
                lsr.w   #$08, D2
                asl.w   D2, D0
                asl.w   D2, D1
                move.w  D0, D2
                move.w  D1, D3
                addi.b  #$10, D4
                bcc.s   Offset_0x00F21E
                subi.w  #$0080, D4
                bcc.s   Offset_0x00F21E
                move.w  #$0288, D4
Offset_0x00F21E:
                move.w  D2, Obj_Speed(A1)                                ; $0010
                move.w  D3, Obj_Speed_Y(A1)                              ; $0012
                neg.w   D2
                neg.w   D4
                dbra    D5, Offset_0x00F19E
Offset_0x00F22E:
                move.w  #$0000, (Ring_Count).w                       ; $FFFFFE20
                move.b  #$80, (HUD_Rings_Refresh_Flag).w             ; $FFFFFE1D
                move.b  #$00, (Ring_Life_Flag).w                     ; $FFFFFE1B
                move.w  #$00C6, D0
                jsr     (Play_Music_Ex)                        ; Offset_0x001918
;-------------------------------------------------------------------------------                
Offset_0x00F24A:
                move.b  ($FFFFFEA7).w, Obj_Map_Id(A0)                    ; $001A
                bsr     SpeedToPos                             ; Offset_0x011F96
                addi.w  #$0018, Obj_Speed_Y(A0)                          ; $0012
                bmi.s   Offset_0x00F284
                move.b  ($FFFFFE0F).w, D0
                add.b   D7, D0
                andi.b  #$03, D0
                bne.s   Offset_0x00F284
                jsr     (Ring_FindFloor)                       ; Offset_0x019BD0
                tst.w   D1
                bpl.s   Offset_0x00F284
                add.w   D1, Obj_Y(A0)                                    ; $000C
                move.w  Obj_Speed_Y(A0), D0                              ; $0012
                asr.w   #$02, D0
                sub.w   D0, Obj_Speed_Y(A0)                              ; $0012
                neg.w   Obj_Speed_Y(A0)                                  ; $0012
Offset_0x00F284:
                tst.b   ($FFFFFEA6).w
                beq.s   Offset_0x00F2BE
                move.w  (Sonic_Level_Limits_Max_Y).w, D0             ; $FFFFEECE
                addi.w  #$00E0, D0
                cmp.w   Obj_Y(A0), D0                                    ; $000C
                bcs.s   Offset_0x00F2BE
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x00F29C:
                addq.b  #$02, Obj_Routine(A0)                            ; $0024
                move.b  #$00, Obj_Col_Flags(A0)                          ; $0020
                move.b  #$01, Obj_Priority(A0)                           ; $0018
                bsr     Add_Rings                              ; Offset_0x00F12E
;-------------------------------------------------------------------------------                
Offset_0x00F2B0:
                lea     (Rings_Animate_Data), A1               ; Offset_0x00F43C
                bsr     AnimateSprite                          ; Offset_0x01212E
                bra     DisplaySprite                          ; Offset_0x0120DE
;-------------------------------------------------------------------------------                
Offset_0x00F2BE:
                bra     DeleteObject                           ; Offset_0x0120D0                                                                                                      
;===============================================================================
; Objeto 0x37 - Perdendo anéis após sofrer algum dano
; <<<-
;===============================================================================