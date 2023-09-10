;===============================================================================
; Objeto 0x9E - Inimigo Crawlton na Dust Hill
; ->>>        
;===============================================================================  
; Offset_0x032264:
                moveq   #$00, D0
                move.b  Obj_Control_Var_0F(A0), D0                       ; $003B
                move.w  Offset_0x032272(PC, D0), D1
                jmp     Offset_0x032272(PC, D1)    
Offset_0x032272:
                dc.w    Offset_0x03227E-Offset_0x032272
                dc.w    Offset_0x03228A-Offset_0x032272
                dc.w    Offset_0x0322E0-Offset_0x032272
                dc.w    Offset_0x0322FE-Offset_0x032272
                dc.w    Offset_0x03231C-Offset_0x032272
                dc.w    Offset_0x032344-Offset_0x032272  
Offset_0x03227E:
                bsr     Object_Settings                        ; Offset_0x030A30
                addq.b  #$02, Obj_Control_Var_0F(A0)                     ; $003B
                bra     Offset_0x0323A2
Offset_0x03228A:
                bsr     Offset_0x030B18
                move.w  D2, D4
                addi.w  #$0080, D2
                cmpi.w  #$0100, D2
                bcc.s   Offset_0x0322A6
                move.w  D3, D5
                addi.w  #$0080, D3
                cmpi.w  #$0100, D3
                bcs.s   Offset_0x0322AA
Offset_0x0322A6:
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0322AA:
                addq.b  #$02, Obj_Control_Var_0F(A0)                     ; $003B
                move.b  #$10, Obj_Control_Var_0E(A0)                     ; $003A
                bclr    #$00, Obj_Flags(A0)                              ; $0001
                tst.w   D0
                beq.s   Offset_0x0322C4
                bset    #$00, Obj_Flags(A0)                              ; $0001
Offset_0x0322C4:
                neg.w   D4
                lsl.w   #$03, D4
                andi.w  #$FF00, D4
                move.w  D4, Obj_Speed(A0)                                ; $0010
                neg.w   D5
                lsl.w   #$03, D5
                andi.w  #$FF00, D5
                move.w  D5, Obj_Speed_Y(A0)                              ; $0012
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0322E0:
                subq.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
                bmi.s   Offset_0x0322EA
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0322EA:
                addq.b  #$02, Obj_Control_Var_0F(A0)                     ; $003B
                move.b  #$08, Obj_Control_Var_0D(A0)                     ; $0039
                move.b  #$1C, Obj_Control_Var_0E(A0)                     ; $003A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x0322FE:
                subq.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
                beq.s   Offset_0x03230C
                bsr     Jmp_1A_To_SpeedToPos                   ; Offset_0x037656
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x03230C:
                move.b  Obj_Control_Var_0D(A0), Obj_Control_Var_0F(A0); $0039, $003B
                move.b  #$20, Obj_Control_Var_0E(A0)                     ; $003A
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x03231C:
                subq.b  #$01, Obj_Control_Var_0E(A0)                     ; $003A
                beq.s   Offset_0x032326
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032326:
                move.b  #$06, Obj_Control_Var_0F(A0)                     ; $003B
                move.b  #$02, Obj_Control_Var_0D(A0)                     ; $0039
                move.b  #$1C, Obj_Control_Var_0E(A0)                     ; $003A
                neg.w   Obj_Speed(A0)                                    ; $0010
                neg.w   Obj_Speed_Y(A0)                                  ; $0012
                bra     Jmp_28_To_MarkObjGone                  ; Offset_0x037608
Offset_0x032344:
                move.w  Obj_Control_Var_12(A0), A1                       ; $003E
                cmpi.b  #$9E, (A1)
                bne     Jmp_27_To_DeleteObject                 ; Offset_0x0375FC
                move.w  Obj_X(A1), Obj_X(A0)                      ; $0008, $0008
                move.w  Obj_Y(A1), Obj_Y(A0)                      ; $000C, $000C
                cmpi.b  #$06, Obj_Control_Var_0F(A1)                     ; $003B
                bne.s   Offset_0x03239A
                move.w  Obj_Speed(A1), D2                                ; $0010
                asr.w   #$08, D2
                move.w  Obj_Speed_Y(A1), D3                              ; $0012
                asr.w   #$08, D3
                lea     Obj_Speed(A0), A2                                ; $0010
                move.b  Obj_Control_Var_0E(A1), D0                       ; $003A
                moveq   #$18, D1
                moveq   #$06, D6
Offset_0x03237C:
                move.w  (A2), D4
                move.w  Obj_Art_VRAM(A2), D5                             ; $0002
                cmp.b   D1, D0
                bcc.s   Offset_0x03238A
                add.w   D2, D4
                add.w   D3, D5
Offset_0x03238A:
                move.w  D4, (A2)+
                move.w  D5, (A2)+
                subi.b  #$04, D1
                bcs.s   Offset_0x03239A
                addq.w  #$02, A2
                dbra    D6, Offset_0x03237C
Offset_0x03239A:
                move.w  #$0280, D0
                bra     Jmp_04_To_DisplaySprite_Param          ; Offset_0x0375F0
Offset_0x0323A2:
                bsr     Jmp_10_To_SingleObjectLoad             ; Offset_0x037602
                bne.s   Offset_0x032414
                move.b  #$9E, Obj_Id(A1)                                 ; $0000
                move.b  Obj_Flags(A0), Obj_Flags(A1)              ; $0001, $0001
                bset    #$06, Obj_Flags(A1)                              ; $0001
                move.l  Obj_Map(A0), Obj_Map(A1)                  ; $0004, $0004
                move.w  Obj_Art_VRAM(A0), Obj_Art_VRAM(A1)        ; $0002, $0002
                move.b  #$0A, Obj_Control_Var_0F(A1)                     ; $003B
                move.b  #$00, Obj_Boss_Ani_Map(A1)                       ; $000B
                move.b  #$40, $000E(A1)
                move.b  #$07, Obj_Ani_Boss_Cnt(A1)                       ; $000F
                move.w  A0, Obj_Control_Var_12(A1)                       ; $003E
                move.w  Obj_X(A0), D2                                    ; $0008
                move.w  D2, Obj_X(A1)                                    ; $0008
                move.w  Obj_Y(A0), D3                                    ; $000C
                move.w  D3, Obj_Y(A1)                                    ; $000C
                move.b  #$40, Obj_Inertia(A1)                            ; $0014
                bset    #$04, Obj_Flags(A1)                              ; $0001
                lea     Obj_Speed(A1), A2                                ; $0010
                moveq   #$06, D6
Offset_0x032404:
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0002, (A2)+
                addi.w  #$0010, D1
                dbra    D6, Offset_0x032404
Offset_0x032414:
                rts           
;-------------------------------------------------------------------------------
Obj_0x9E_Ptr:                                                  ; Offset_0x032416
                dc.l    Crawlton_Mappings                      ; Offset_0x032420
                dc.w    $23C0
                dc.b    $04, $04, $80, $0B      
;------------------------------------------------------------------------------- 
Crawlton_Mappings:                                             ; Offset_0x032420
                dc.w    Offset_0x032426-Crawlton_Mappings
                dc.w    Offset_0x032426-Crawlton_Mappings
                dc.w    Offset_0x032430-Crawlton_Mappings
Offset_0x032426:
                dc.w    $0001
                dc.l    $F8090000, $0000FFF0
Offset_0x032430:
                dc.w    $0001
                dc.l    $F8050006, $0003FFF8                                        
;===============================================================================   
; Objeto 0x9E - Inimigo Crawlton na Dust Hill
; <<<-        
;===============================================================================